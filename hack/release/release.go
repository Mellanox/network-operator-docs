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
	"strings"
	"text/template"

	"sigs.k8s.io/yaml"

	mellanoxv1alpha1 "github.com/Mellanox/network-operator/api/v1alpha1"
	"github.com/google/go-containerregistry/pkg/authn"
	"github.com/google/go-containerregistry/pkg/name"
	"github.com/google/go-containerregistry/pkg/v1/remote"
)

// Release contains versions for operator release templates.
type Release struct {
	OcpDefaulChannel             string
	HelmChartVersion             string
	DocaDriverBuildCommitHash    string
	NetworkOperator              *mellanoxv1alpha1.ImageSpec
	NetworkOperatorInitContainer *mellanoxv1alpha1.ImageSpec
	SriovNetworkOperator         *mellanoxv1alpha1.ImageSpec
	SriovNetworkOperatorWebhook  *mellanoxv1alpha1.ImageSpec
	SriovConfigDaemon            *mellanoxv1alpha1.ImageSpec
	SriovCni                     *mellanoxv1alpha1.ImageSpec
	SriovIbCni                   *mellanoxv1alpha1.ImageSpec
	Mofed                        *mellanoxv1alpha1.ImageSpec
	RdmaSharedDevicePlugin       *mellanoxv1alpha1.ImageSpec
	SriovDevicePlugin            *mellanoxv1alpha1.ImageSpec
	IbKubernetes                 *mellanoxv1alpha1.ImageSpec
	CniPlugins                   *mellanoxv1alpha1.ImageSpec
	Multus                       *mellanoxv1alpha1.ImageSpec
	Ipoib                        *mellanoxv1alpha1.ImageSpec
	IpamPlugin                   *mellanoxv1alpha1.ImageSpec
	NvIPAM                       *mellanoxv1alpha1.ImageSpec
	NicFeatureDiscovery          *mellanoxv1alpha1.ImageSpec
	DOCATelemetryService         *mellanoxv1alpha1.ImageSpec
	OVSCni                       *mellanoxv1alpha1.ImageSpec
	RDMACni                      *mellanoxv1alpha1.ImageSpec
	Nfd                          *mellanoxv1alpha1.ImageSpec
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

func initWithEnvVariale(name string, image *mellanoxv1alpha1.ImageSpec) {
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
	releaseDefaults := flag.String("releaseDefaults", "release.yaml", "Destination of the release defaults definition")
	flag.Parse()
	release := readDefaults(*releaseDefaults)
	readEnvironmentVariables(&release)
	parts := strings.Split(release.NetworkOperator.Version, ".")
	release.OcpDefaulChannel = fmt.Sprintf("%s.%s", parts[0], parts[1])
	release.HelmChartVersion = strings.TrimPrefix(release.NetworkOperator.Version, "v")
	retrieveDocaDriverBuildCommit(&release)

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
		tmpl, err := template.ParseFiles(file)
		if err != nil {
			fmt.Printf("Error: %v\n", err)
			os.Exit(1)
		}

		// Generate new file full path
		outputFile := filepath.Join(*outputDir, strings.Replace(filepath.Base(file), ".template", ".yaml", 1))
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

	// Parse the image reference
	repo, err := name.NewRepository(imagePath)
	if err != nil {
		log.Fatalf("failed to parse repository: %v", err)
		os.Exit(1)
	}

	// Set authentication if needed
	auth := remote.WithAuthFromKeychain(authn.DefaultKeychain)
	if strings.Contains(release.Mofed.Repository, "nvstaging") {
		nvcrToken := os.Getenv("NGC_CLI_API_KEY")
		if nvcrToken == "" {
			log.Fatalf("NGC_CLI_API_KEY is unset")
			os.Exit(1)
		}
		authNvcr := &authn.Basic{
			Username: "$oauthtoken",
			Password: nvcrToken,
		}
		auth = remote.WithAuth(authNvcr)
	}

	// List tags
	tags, err := remote.List(repo, auth)
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

	fmt.Printf("Matched tag: %s\n", matchedTag)

	// Fetch the image
	imageRef := fmt.Sprintf("%s:%s", imagePath, matchedTag)
	img, err := name.NewTag(imageRef)
	if err != nil {
		log.Fatalf("failed to parse image reference: %v", err)
		os.Exit(1)
	}

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

	fmt.Printf("Label value: %s\n", labelValue)
	release.DocaDriverBuildCommitHash = labelValue
}
