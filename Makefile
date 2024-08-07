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
# Paths to download the helm chart to.
HELM_CHART_DEP_ROOT = $(BUILDDIR)/helmcharts
# Helm chart version and url
HELM_CHART_VERSION ?= 24.4.1
NGC_HELM_CHART_URL ?= https://helm.ngc.nvidia.com/nvidia/charts/network-operator-${HELM_CHART_VERSION}.tgz
BRANCH_HELM_CHART_URL ?= https://github.com/Mellanox/network-operator/archive/refs/heads/${BRANCH}.tar.gz
HELM_CHART_PATH ?=

$(BUILDDIR) $(TOOLSDIR) $(HELM_CHART_DEP_ROOT): ; $(info Creating directory $@...)
	mkdir -p $@

# release.yaml location
BRANCH_RELEASE_YAML_URL ?= https://raw.githubusercontent.com/Mellanox/network-operator/${BRANCH}/hack/release.yaml

# helm-docs is used to generate helm chart documentation
HELM_DOCS_PKG := github.com/norwoodj/helm-docs/cmd/helm-docs
HELM_DOCS_VER := v1.14.2
HELM_DOCS_BIN := helm-docs
HELM_DOCS = $(abspath $(TOOLSDIR)/$(HELM_DOCS_BIN))-$(HELM_DOCS_VER)
$(HELM_DOCS): | $(TOOLSDIR)
	$(call go-install-tool,$(HELM_DOCS_PKG),$(HELM_DOCS_BIN),$(HELM_DOCS_VER))

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

.PHONY: download-branch-helm-chart
download-branch-helm-chart: | $(HELM_CHART_DEP_ROOT) clean-helm-chart-dep-root
	curl -sL ${BRANCH_HELM_CHART_URL} \
	| tar -xz -C ${HELM_CHART_DEP_ROOT} \
	--strip-components 2 network-operator-${BRANCH}/deployment/network-operator

.PHONY: copy-local-helm-chart
copy-local-helm-chart: | $(HELM_CHART_DEP_ROOT) clean-helm-chart-dep-root
	@if [ ! -d $(HELM_CHART_PATH) ] || [ -z $(HELM_CHART_PATH) ]; \
		then echo "HELM_CHART_PATH is not a directory"; \
		exit 1; \
	fi
	cp -r $(HELM_CHART_PATH) $(HELM_CHART_DEP_ROOT)

# Generate helm chart documentation in a reStructuredText format.
.PHONY: helm-docs
helm-docs: | $(HELM_DOCS)
	$(HELM_DOCS) --output-file=../../../../docs/customizations/helm.rst \
	--ignore-file=.helmdocsignore \
	--template-files=./templates/helm.rst.gotmpl ${HELM_CHART_DEP_ROOT}

.PHONY: ngc-helm-docs
ngc-helm-docs: download-ngc-helm-chart helm-docs

.PHONY: branch-helm-docs
branch-helm-docs: download-branch-helm-chart helm-docs

.PHONY: local-helm-docs
local-helm-docs: copy-local-helm-chart helm-docs

.PHONY: gen-docs
gen-docs:
	@ ./repo.sh docs

.PHONY: generate-docs-versions-var
generate-docs-versions-var:
	curl -sL ${BRANCH_RELEASE_YAML_URL} -o $(CURDIR)/build/release.yaml
	cd hack/release && go run release.go --releaseDefaults $(CURDIR)/build/release.yaml --templateDir ./templates/ --outputDir $(CURDIR)/build/
	mv $(CURDIR)/build/vars.yaml docs/common/vars.rst
