# Package related
TOOLSDIR=$(CURDIR)/hack/tools/bin
BUILDDIR=$(CURDIR)/build/_output

# If gobin not set, create one on ./build and add to path.
ifeq (,$(shell go env GOBIN))
GOBIN=$(BUILD_DIR)/gobin
else
GOBIN=$(shell go env GOBIN)
endif
export PATH:=$(GOBIN):${PATH}

BRANCH ?= master
TAG ?=
# Handling the following use cases for repo url:
# 1. PR - refs/pull/<PR id>
# 2. TAG - refs/<tag name (omitted 'v' prefix in url)>
# 3. BRANCH - refs/<branch name>
ifdef PR_NUMBER
    SRC = refs-pull-$(PR_NUMBER)-head
    TAR_PATH = pull/$(PR_NUMBER)/head.tar.gz
else ifdef TAG
    SRC = $(shell echo $(TAG) | sed 's/^v//')
    TAR_PATH = tags/$(TAG)/head.tar.gz
else
    SRC = $(BRANCH)
    TAR_PATH = heads/$(BRANCH).tar.gz
endif

# Network Operator source tar location
REPO_TAR_URL ?= https://github.com/Mellanox/network-operator/archive/refs/$(TAR_PATH)
# NIC Configuration Operator source tar location
NIC_CONF_REPO_TAR_URL ?= https://github.com/Mellanox/nic-configuration-operator/archive/refs/$(TAR_PATH)
# release.yaml location
RELEASE_YAML_URL ?= https://raw.githubusercontent.com/Mellanox/network-operator/$(if $(TAG),$(TAG),$(BRANCH))/hack/release.yaml

# Path to download the crd api to.
CRD_API_DEP_ROOT = $(BUILDDIR)/crd
# Path to download the nic-conf-operator crd api to.
NIC_CONF_CRD_API_DEP_ROOT = $(BUILDDIR)/nic-conf-crd
# Path to download the helm chart to.
HELM_CHART_DEP_ROOT = $(BUILDDIR)/helmcharts
# Helm chart version and url
HELM_CHART_VERSION ?= 24.4.1
NGC_HELM_CHART_URL ?= https://helm.ngc.nvidia.com/nvidia/charts/network-operator-${HELM_CHART_VERSION}.tgz
HELM_CHART_PATH ?=

# Examples build directory for processed YAML files
EXAMPLES_BUILD_DIR = examples/processed

$(BUILDDIR) $(TOOLSDIR) $(HELM_CHART_DEP_ROOT) $(CRD_API_DEP_ROOT) $(NIC_CONF_CRD_API_DEP_ROOT) $(EXAMPLES_BUILD_DIR): ; $(info Creating directory $@...)
	mkdir -p $@

# helm-docs is used to generate helm chart documentation
HELM_DOCS_PKG := github.com/norwoodj/helm-docs/cmd/helm-docs
HELM_DOCS_VER := v1.14.2
HELM_DOCS_BIN := helm-docs
HELM_DOCS = $(abspath $(TOOLSDIR)/$(HELM_DOCS_BIN))-$(HELM_DOCS_VER)
$(HELM_DOCS): | $(TOOLSDIR)
	$(call go-install-tool,$(HELM_DOCS_PKG),$(HELM_DOCS_BIN),$(HELM_DOCS_VER))

# Find or download gen-crd-api-reference-docs
GEN_API_REF_DOCS_PKG := github.com/ahmetb/gen-crd-api-reference-docs
GEN_API_REF_DOCS_VERSION ?= 819de227e5fe85ee70022e71191d7838847e075a
GEN_CRD_API_REFERENCE_DOCS_BIN = gen-crd-api-reference-docs
GEN_CRD_API_REFERENCE_DOCS = $(abspath $(TOOLSDIR)/$/$(GEN_CRD_API_REFERENCE_DOCS_BIN))-$(GEN_API_REF_DOCS_VERSION)
$(GEN_CRD_API_REFERENCE_DOCS): | $(TOOLSDIR)
	$(call go-install-tool,$(GEN_API_REF_DOCS_PKG),$(GEN_CRD_API_REFERENCE_DOCS_BIN),$(GEN_API_REF_DOCS_VERSION))

# go-install-tool will 'go install' a go module $1 with version $3 and install it with the name $2-$3 to $TOOLSDIR.
define go-install-tool
	echo "Installing $(2)-$(3) to $(TOOLSDIR)"
	GOBIN=$(TOOLSDIR) go install $(1)@$(3)
	mv $(TOOLSDIR)/$(2) $(TOOLSDIR)/$(2)-$(3)
endef

.PHONY: clean-helm-chart-dep-root
clean-helm-chart-dep-root:
	rm -rf ${HELM_CHART_DEP_ROOT}/*

.PHONY: download-ngc-helm-chart
download-ngc-helm-chart: | $(HELM_CHART_DEP_ROOT) clean-helm-chart-dep-root
	cd ${HELM_CHART_DEP_ROOT} \
	&& curl -sL ${NGC_HELM_CHART_URL} | tar -xz

.PHONY: download-helm-chart
download-helm-chart: | $(HELM_CHART_DEP_ROOT) clean-helm-chart-dep-root
	curl -sL ${REPO_TAR_URL} \
	| tar -xz -C ${HELM_CHART_DEP_ROOT} \
	--strip-components 2 network-operator-${SRC}/deployment/network-operator

.PHONY: copy-local-helm-chart
copy-local-helm-chart: | $(HELM_CHART_DEP_ROOT) clean-helm-chart-dep-root
	@if [ ! -d $(HELM_CHART_PATH) ] || [ -z $(HELM_CHART_PATH) ]; \
		then echo "HELM_CHART_PATH is not a directory"; \
		exit 1; \
	fi
	cp -r $(HELM_CHART_PATH) $(HELM_CHART_DEP_ROOT)

# Generate helm chart documentation as a Fern MDX page.
.PHONY: gen-helm-docs
gen-helm-docs: | $(HELM_DOCS)
	$(HELM_DOCS) --output-file=../../../../docs/customizations/helm.mdx \
	--ignore-file=.helmdocsignore \
	--template-files=./templates/helm.mdx.gotmpl ${HELM_CHART_DEP_ROOT}
	python3 hack/fern/md_to_mdx.py docs/customizations/helm.mdx docs/customizations/helm.mdx

.PHONY: ngc-helm-docs
ngc-helm-docs: download-ngc-helm-chart gen-helm-docs

.PHONY: helm-docs
helm-docs: download-helm-chart gen-helm-docs

.PHONY: local-helm-docs
local-helm-docs: copy-local-helm-chart gen-helm-docs

.PHONY: download-api
download-api: | $(CRD_API_DEP_ROOT)
	curl -sL ${REPO_TAR_URL} \
	| tar -xz -C ${CRD_API_DEP_ROOT}

.PHONY: download-nic-conf-api
download-nic-conf-api: | $(NIC_CONF_CRD_API_DEP_ROOT)
	curl -sL ${NIC_CONF_REPO_TAR_URL} \
	| tar -xz -C ${NIC_CONF_CRD_API_DEP_ROOT}

gen-crd-api-docs: | $(GEN_CRD_API_REFERENCE_DOCS) download-api
	cd ${CRD_API_DEP_ROOT}/network-operator-${SRC}/api/v1alpha1 && \
	$(GEN_CRD_API_REFERENCE_DOCS) -api-dir=. -config=${CURDIR}/hack/api-docs/config.json \
	-template-dir=${CURDIR}/hack/api-docs/templates -out-file=${BUILDDIR}/crds-api.html

gen-nic-conf-crd-api-docs: | $(GEN_CRD_API_REFERENCE_DOCS) download-nic-conf-api
	cd ${NIC_CONF_CRD_API_DEP_ROOT}/nic-configuration-operator-${SRC}/api/v1alpha1 && \
	$(GEN_CRD_API_REFERENCE_DOCS) -api-dir=. -config=${CURDIR}/hack/api-docs/nic-conf-config.json \
	-template-dir=${CURDIR}/hack/api-docs/templates -out-file=${BUILDDIR}/nic-conf-crds-api.html

.PHONY: api-docs
api-docs: gen-crd-api-docs
	python3 hack/fern/crd_html_to_mdx.py ${BUILDDIR}/crds-api.html docs/customizations/crds.mdx

.PHONY: nic-conf-api-docs
nic-conf-api-docs: gen-nic-conf-crd-api-docs
	python3 hack/fern/crd_html_to_mdx.py ${BUILDDIR}/nic-conf-crds-api.html docs/nic-conf-operator/crds.mdx

# Value of a variable from docs/common/vars.yml (names use underscores)
docs-var = $(shell sed -n 's/^  $(1): "\(.*\)"$$/\1/p' docs/common/vars.yml)

.PHONY: nic-conf-api-docs-versioned
nic-conf-api-docs-versioned:
	$(eval NIC_CONF_VERSION := $(call docs-var,nic_configuration_operator_version))
	@echo "Using NIC Configuration Operator version: $(NIC_CONF_VERSION)"
	TAG=$(NIC_CONF_VERSION) make nic-conf-api-docs

.PHONY: fetch-config-docs
fetch-config-docs:
	$(eval NIC_CONF_VERSION := $(call docs-var,nic_configuration_operator_version))
	@echo "Fetching configuration documentation for version: $(NIC_CONF_VERSION)"
	./hack/fetch-config-docs.sh Mellanox/nic-configuration-operator $(NIC_CONF_VERSION) README.md docs/nic-conf-operator/configuration-details.mdx

# Example CRs shown in the NIC Configuration Operator and Spectrum-X pages. Fern
# cannot put a variable in a remote <Code src>, so the files are fetched here, at
# the tag that matches the Network Operator version, and committed under
# examples/nic-conf-operator/. The leading comment block (license header and the
# "change this template" note) is dropped, as the pages used to do with
# lines="18-" (Fern's <Code> has no line range). The block is found by content,
# not by line count, and the fetch fails if it holds no SPDX license line.
NIC_CONF_EXAMPLES_DIR = examples/nic-conf-operator
NIC_CONF_EXAMPLES = \
	example-nicfwsource-connectx6dx.yaml \
	example-nicfirmwaretemplate-connectx6-dx.yaml \
	example-nicconfigurationtemplate-connectx6dx.yaml \
	spectrum-x/example-nicfirmwaresource-spectrum-x-full.yaml \
	spectrum-x/example-nicfirmwaretemplate-spectrum-x.yaml \
	spectrum-x/example-nicinterfacenametemplate-spectrum-x.yaml

.PHONY: fetch-nic-conf-examples
fetch-nic-conf-examples:
	$(eval NO_VERSION := $(call docs-var,network_operator_version))
	@echo "Fetching NIC Configuration Operator examples at network-operator-$(NO_VERSION)"
	@for f in $(NIC_CONF_EXAMPLES); do \
		mkdir -p "$(NIC_CONF_EXAMPLES_DIR)/$$(dirname "$$f")"; \
		tmp=$$(mktemp); \
		curl -fsSL "https://raw.githubusercontent.com/Mellanox/nic-configuration-operator/refs/tags/network-operator-$(NO_VERSION)/docs/examples/$$f" -o "$$tmp" \
			|| { rm -f "$$tmp"; exit 1; }; \
		awk 'head && /^([#]|[[:space:]]*$$)/ { if (/SPDX-License-Identifier/) spdx = 1; next } \
			{ head = 0; print } \
			BEGIN { head = 1 } \
			END { if (!spdx || NR == 0) { print "'"$$f"': no leading license header found" > "/dev/stderr"; exit 1 } }' \
			"$$tmp" > "$(NIC_CONF_EXAMPLES_DIR)/$$f" || { rm -f "$$tmp"; exit 1; }; \
		rm -f "$$tmp"; \
	done

.PHONY: nic-conf-docs
nic-conf-docs: nic-conf-api-docs-versioned fetch-config-docs fetch-nic-conf-examples
	@echo "Generated all NIC Configuration Operator documentation"

.PHONY: process-examples
process-examples: | $(EXAMPLES_BUILD_DIR)
	@echo "Processing YAML examples with version substitutions..."
	@# Generate sed script from all variables in vars.yml
	@sed -n 's/^  \([a-z0-9_]*\): "\(.*\)"$$/s@{{\1}}@\2@g/p' docs/common/vars.yml > /tmp/vars.sed
	@find examples/templates -name "*.yaml" -type f | while read -r file; do \
		echo "Processing $$file"; \
		relative_path=$$(echo "$$file" | sed 's|^examples/templates/||'); \
		output_dir="$(EXAMPLES_BUILD_DIR)/$$(dirname "$$relative_path")"; \
		mkdir -p "$$output_dir"; \
		sed -f /tmp/vars.sed "$$file" > "$(EXAMPLES_BUILD_DIR)/$$relative_path"; \
	done
	@rm -f /tmp/vars.sed
	@echo "Generating complete configuration files..."
	@# Generate complete.yaml files by concatenating numbered files in order
	@find $(EXAMPLES_BUILD_DIR) -mindepth 1 -maxdepth 1 -type d | while read -r dir; do \
		echo "Creating complete.yaml for $$(basename "$$dir")"; \
		complete_file="$$dir/complete.yaml"; \
		> "$$complete_file"; \
		find "$$dir" -name "[0-9]*-*.yaml" | sort | while read -r numbered_file; do \
			cat "$$numbered_file" >> "$$complete_file"; \
			echo "" >> "$$complete_file"; \
			echo "---" >> "$$complete_file"; \
		done; \
		if [ -s "$$complete_file" ]; then \
			sed -i '$$d' "$$complete_file"; \
		fi; \
	done

.PHONY: generate-docs-versions-var
generate-docs-versions-var: | $(BUILDDIR)
	curl -sL ${RELEASE_YAML_URL} -o $(CURDIR)/build/release.yaml
	cd hack/release && go run release.go --releaseDefaults $(CURDIR)/build/release.yaml --releaseVersions $(CURDIR)/hack/release/versions.txt --templateDir ./templates/vars --outputDir ../../docs/common/
	cd hack/release && go run release.go --with-sha256 --releaseDefaults $(CURDIR)/build/release.yaml --templateDir ./templates/image-sha256  --outputDir ../../docs/advanced/

.PHONY: release-build
release-build: api-docs helm-docs generate-docs-versions-var nic-conf-docs process-examples
	@echo "Completed release build with all documentation targets"

# Fern site. Pages reference docs/common/vars.yml as ${name} and Fern resolves
# them itself (profiles in fern/docs.yml), so every Fern command runs from the
# repository root. Needs Node.js 18+ and Fern CLI 5.215.0 or newer.
FERN ?= npx --yes fern-api

.PHONY: docs-check
docs-check:
	$(FERN) check

# Local preview on http://localhost:3000 (NVIDIA theme needs FERN_TOKEN or 'fern login').
# Restart it after editing docs/common/vars.yml or fern/docs.yml.
.PHONY: docs-preview
docs-preview:
	$(FERN) docs dev

# Preview deployment; prints the preview URL. Requires FERN_TOKEN.
.PHONY: docs-preview-deploy
docs-preview-deploy:
	$(FERN) generate --docs --preview

# Publish to the production site. Requires FERN_TOKEN.
.PHONY: docs-publish
docs-publish:
	$(FERN) generate --docs

.PHONY: clean
clean:
	@echo "Cleaning..."; \
	rm -rf .cache;\
	rm -rf build;\
	rm -rf _build
