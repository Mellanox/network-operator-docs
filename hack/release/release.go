/*
2023 NVIDIA CORPORATION & AFFILIATES

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Package main creates release templates.
package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"reflect"
	"regexp"
	"sort"
	"strings"
	"text/template"

	"sigs.k8s.io/yaml"

	mellanoxv1alpha1 "github.com/Mellanox/network-operator/api/v1alpha1"
	"github.com/google/go-containerregistry/pkg/authn"
	containerregistryname "github.com/google/go-containerregistry/pkg/name"
	containerregistryv1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/remote"
)

// ReleaseImageSpec contains ImageSpec in addition with Image SHA256.
type ReleaseImageSpec struct {
	// Shas is a list of SHA2256. A list is needed for DOCA-OFED drivers that have multiple images.
	Shas []SHA256ImageRef
	mellanoxv1alpha1.ImageSpec
}

// SHA256ImageRef contains container image in sha256 format and a description.
type SHA256ImageRef struct {
	// SHA256 is the SHA256 of the image
	SHA256 string
	// Tags is a list of tags
	Tags []string
}

// Release contains versions for operator release templates.
type Release struct {
	HelmChartVersion             string
	DocaDriverBuildCommitHash    string
	NetworkOperator              *ReleaseImageSpec
	NetworkOperatorInitContainer *ReleaseImageSpec
	SriovNetworkOperator         *ReleaseImageSpec
	SriovNetworkOperatorWebhook  *ReleaseImageSpec
	SriovConfigDaemon            *ReleaseImageSpec
	SriovCni                     *ReleaseImageSpec
	SriovIbCni                   *ReleaseImageSpec
	Mofed                        *ReleaseImageSpec
	MofedStigFips                *ReleaseImageSpec
	RdmaSharedDevicePlugin       *ReleaseImageSpec
	SriovDevicePlugin            *ReleaseImageSpec
	IbKubernetes                 *ReleaseImageSpec
	CniPlugins                   *ReleaseImageSpec
	Multus                       *ReleaseImageSpec
	Ipoib                        *ReleaseImageSpec
	NvIPAM                       *ReleaseImageSpec
	NicFeatureDiscovery          *ReleaseImageSpec
	NodeFeatureDiscovery         *ReleaseImageSpec
	DOCATelemetryService         *ReleaseImageSpec
	OVSCni                       *ReleaseImageSpec
	RDMACni                      *ReleaseImageSpec
	Nfd                          *ReleaseImageSpec
	NicConfigurationOperator     *ReleaseImageSpec
	NicConfigurationConfigDaemon *ReleaseImageSpec
	MaintenanceOperator          *ReleaseImageSpec
	SpectrumXOperator            *ReleaseImageSpec
	CurrentGAVersionMajorMinor   string
	CurrentMaintenanceMajorMinor string
	CurrentEOLMajorMinor         string
}

func readDefaults(releaseDefaults string) Release {
	f, err := os.ReadFile(filepath.Clean(releaseDefaults))
	if err != nil {
		log.Fatal(err)
	}
	var release Release
	if err := yaml.Unmarshal(f, &release); err != nil {
		log.Fatal(err)
	}

	return release
}

func getEnviromnentVariableOrDefault(defaultValue, varName string) string {
	val := os.Getenv(varName)
	if val != "" {
		return val
	}
	return defaultValue
}

func initWithEnvVariale(name string, image *ReleaseImageSpec) {
	envName := name + "_IMAGE"
	image.Image = getEnviromnentVariableOrDefault(image.Image, envName)
	envName = name + "_REPO"
	image.Repository = getEnviromnentVariableOrDefault(image.Repository, envName)
	envName = name + "_VERSION"
	image.Version = getEnviromnentVariableOrDefault(image.Version, envName)
}

func readEnvironmentVariables(release *Release) {
	initWithEnvVariale("NETWORK_OPERATOR", release.NetworkOperator)
	initWithEnvVariale("NETWORK_OPERATOR_INIT_CONTAINER", release.NetworkOperatorInitContainer)
	initWithEnvVariale("MOFED", release.Mofed)
	initWithEnvVariale("MOFED_STIG_FIPS", release.MofedStigFips)
	initWithEnvVariale("RDMA_SHARED_DEVICE_PLUGIN", release.RdmaSharedDevicePlugin)
	initWithEnvVariale("SRIOV_DEVICE_PLUGIN", release.SriovDevicePlugin)
	initWithEnvVariale("IB_KUBERNEES", release.IbKubernetes)
	initWithEnvVariale("CNI_PLUGINS", release.CniPlugins)
	initWithEnvVariale("MULTUS", release.Multus)
	initWithEnvVariale("IPOIB", release.Ipoib)
	initWithEnvVariale("IPAM_PLUGIN", release.Ipoib)
	initWithEnvVariale("NV_IPAM", release.NvIPAM)
	initWithEnvVariale("NIC_FEATURE_DISCOVERY", release.NicFeatureDiscovery)
	initWithEnvVariale("DOCA_TELEMETRY_SERVICE", release.DOCATelemetryService)
	initWithEnvVariale("OVS_CNI", release.OVSCni)
	initWithEnvVariale("RDMA_CNI", release.RDMACni)
}

func main() {
	templateDir := flag.String("templateDir", ".", "Directory with templates to render")
	outputDir := flag.String("outputDir", ".", "Destination directory to render templates to")
	releaseVersions := flag.String("releaseVersions", "", "File with release versions to use for the templates. Won't be used if not provided")
	releaseDefaults := flag.String("releaseDefaults", "release.yaml", "Destination of the release defaults definition")
	retrieveSha := flag.Bool("with-sha256", false, "retrieve SHA256 for container images references")
	flag.Parse()
	release := readDefaults(*releaseDefaults)
	readEnvironmentVariables(&release)
	release.HelmChartVersion = strings.TrimPrefix(release.NetworkOperator.Version, "v")
	retrieveDocaDriverBuildCommit(&release)
	if *retrieveSha {
		err := resolveImagesSha(&release)
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}
	}
	if *releaseVersions != "" {
		err := handleReleaseVersions(&release, *releaseVersions)
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}
	}
	var files []string
	err := filepath.Walk(*templateDir, func(path string, info os.FileInfo, err error) error {
		// Error during traversal
		if err != nil {
			return err
		}

		if info.IsDir() {
			return nil
		}

		// Skip non suffix files
		base := info.Name()
		if strings.HasSuffix(base, ".template") {
			files = append(files, path)
		}

		return nil
	})
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		os.Exit(1)
	}

	for _, file := range files {
		tmpl, err := template.New(filepath.Base(file)).Funcs(template.FuncMap{
			"imageSha": func(obj interface{}) string {
				imageSpec := obj.(*ReleaseImageSpec)
				return imageSpec.Shas[0].SHA256
			},
			"hasSubstring": func(substring string, tags []string) bool {
				for _, tag := range tags {
					if strings.Contains(tag, substring) {
						return true
					}
				}
				return false
			},
		}).ParseFiles(file)
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}

		// Generate new file full path
		outputFile := filepath.Join(*outputDir, strings.Replace(filepath.Base(file), ".template", ".rst", 1))
		f, err := os.Create(filepath.Clean(outputFile))
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}
		err = tmpl.Execute(f, release)
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}
	}
}

func retrieveDocaDriverBuildCommit(release *Release) {
	imagePath := release.Mofed.Repository + "/" + release.Mofed.Image
	version := release.Mofed.Version
	labelKey := "org.opencontainers.image.revision"

	// List tags
	tags, err := listTags(release.Mofed.Repository, release.Mofed.Image)
	if err != nil {
		log.Fatalf("failed to list tags: %v", err)
		os.Exit(1)
	}

	// Find the first tag that includes the version substring
	var matchedTag string
	for _, tag := range tags {
		if strings.Contains(tag, version) {
			matchedTag = tag
			break
		}
	}

	if matchedTag == "" {
		log.Fatalf("no matching tag found for version: %s", version)
		os.Exit(1)
	}

	// Fetch the image
	imageRef := fmt.Sprintf("%s:%s", imagePath, matchedTag)
	img, err := containerregistryname.NewTag(imageRef)
	if err != nil {
		log.Fatalf("failed to parse image reference: %v", err)
		os.Exit(1)
	}
	auth := getAuth(release.Mofed.Repository)
	image, err := remote.Image(img, auth)
	if err != nil {
		log.Fatalf("failed to fetch image: %v", err)
		os.Exit(1)
	}

	// Get the image config
	configFile, err := image.ConfigFile()
	if err != nil {
		log.Fatalf("failed to get image config: %v", err)
		os.Exit(1)
	}

	// Look up the label
	labelValue, ok := configFile.Config.Labels[labelKey]
	if !ok {
		log.Fatalf("label %q not found in image %s", labelKey, matchedTag)
		os.Exit(1)
	}

	release.DocaDriverBuildCommitHash = labelValue
}

func resolveImagesSha(release *Release) error {
	v := reflect.ValueOf(*release)
	for i := 0; i < v.NumField(); i++ {
		field := v.Field(i)
		if v.Type().Field(i).Type.Kind() != reflect.String && !field.IsNil() {
			releaseImageSpec := field.Interface().(*ReleaseImageSpec)
			if strings.Contains(releaseImageSpec.Image, "doca-driver") {
				digests, err := resolveDocaDriversShas(releaseImageSpec.Repository, releaseImageSpec.Image,
					releaseImageSpec.Version)
				if err != nil {
					return err
				}
				releaseImageSpec.Shas = digests
			} else {
				digest, err := resolveImageSha(releaseImageSpec.Repository, releaseImageSpec.Image,
					releaseImageSpec.Version)
				if err != nil {
					return err
				}
				releaseImageSpec.Shas = make([]SHA256ImageRef, 1)
				releaseImageSpec.Shas[0] = SHA256ImageRef{SHA256: digest}
			}
		}
	}
	return nil
}

func resolveImageSha(repo, image, tag string) (string, error) {
	ref, err := containerregistryname.ParseReference(fmt.Sprintf("%s/%s:%s", repo, image, tag))
	if err != nil {
		return "", err
	}
	auth := getAuth(repo)
	desc, err := remote.Get(ref, auth)
	if err != nil {
		return "", err
	}

	digest, err := containerregistryv1.NewHash(desc.Descriptor.Digest.String())
	if err != nil {
		return "", err
	}
	return digest.String(), nil
}

func resolveDocaDriversShas(repoName, imageName, ver string) ([]SHA256ImageRef, error) {
	var sha256ImageRefs []SHA256ImageRef
	digestToTags := make(map[string][]string)
	orderedDigests := make([]string, 0)

	tags, err := listTags(repoName, imageName)
	if err != nil {
		return nil, err
	}

	for _, tag := range tags {
		if strings.Contains(tag, ver) {
			digest, err := resolveImageSha(repoName, imageName, tag)
			if err != nil {
				return nil, err
			}
			if _, exists := digestToTags[digest]; !exists {
				orderedDigests = append(orderedDigests, digest)
			}
			digestToTags[digest] = append(digestToTags[digest], tag)
		}
	}

	for _, digest := range orderedDigests {
		sha256ImageRefs = append(sha256ImageRefs, SHA256ImageRef{
			SHA256: digest,
			Tags:   digestToTags[digest],
		})
	}

	return sha256ImageRefs, nil
}

func listTags(repoName, imageName string) ([]string, error) {
	tags := make([]string, 0)
	image := fmt.Sprintf("%s/%s", repoName, imageName)
	repo, err := containerregistryname.NewRepository(image)
	if err != nil {
		return tags, err
	}
	auth := getAuth(repoName)
	tags, err = remote.List(repo, auth)
	if err != nil {
		return tags, err
	}
	sort.Strings(tags)
	return tags, nil
}

func getAuth(repo string) remote.Option {
	if strings.Contains(repo, "nvstaging") {
		nvcrToken := os.Getenv("NGC_CLI_API_KEY")
		if nvcrToken == "" {
			log.Fatalf("NGC_CLI_API_KEY is unset")
			os.Exit(1)
		}
		authNvcr := &authn.Basic{
			Username: "$oauthtoken",
			Password: nvcrToken,
		}
		return remote.WithAuth(authNvcr)
	} else {
		return remote.WithAuthFromKeychain(authn.DefaultKeychain)
	}
}

// handleReleaseVersions updates the release versions file with the current major.minor version
// and fills the CurrentGAVersionMajorMinor, CurrentMaintenanceMajorMinor, and CurrentEOLMajorMinor fields.
func handleReleaseVersions(release *Release, releaseVersionsPath string) error {
	content, err := os.ReadFile(filepath.Clean(releaseVersionsPath))
	if err != nil {
		return err
	}

	rawLines := strings.Split(string(content), "\n")
	lines := make([]string, 0, len(rawLines))
	for _, l := range rawLines {
		trimmed := strings.TrimSpace(l)
		if trimmed != "" {
			lines = append(lines, trimmed)
		}
	}

	// Parse version using regex: supports values like "v25.10.0-beta.5" or "25.10.0"
	re := regexp.MustCompile(`^v?(\d+)\.(\d+)\.\d+(?:[-+].*)?$`)
	matches := re.FindStringSubmatch(release.NetworkOperator.Version)
	if matches == nil {
		return fmt.Errorf("failed to parse version %q", release.NetworkOperator.Version)
	}
	currentMajorMinor := fmt.Sprintf("%s.%s.x", matches[1], matches[2])

	// If top line doesn't match, prepend the extracted major.minor
	if len(lines) == 0 || lines[0] != currentMajorMinor {
		lines = append([]string{currentMajorMinor}, lines...)
		// Write back to the file; ensure trailing newline
		newContent := strings.Join(lines, "\n") + "\n"
		if err := os.WriteFile(releaseVersionsPath, []byte(newContent), 0o644); err != nil {
			return err
		}
	}

	// After update, take three top lines
	if len(lines) < 3 {
		return fmt.Errorf("versions file %q has fewer than 3 lines after update", releaseVersionsPath)
	}
	release.CurrentGAVersionMajorMinor = lines[0]
	release.CurrentMaintenanceMajorMinor = lines[1]
	release.CurrentEOLMajorMinor = lines[2]
	return nil
}
