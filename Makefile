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

$(TOOLSDIR):
	@mkdir -p $@

$(BUILDDIR): ; $(info Creating build directory...)
	mkdir -p $@

BRANCH ?= master
# Paths to download the helm chart to.
HELM_CHART_DEP_ROOT ?= $(BUILDDIR)/helmcharts
# Helm chart version and url
HELM_CHART_VERSION ?= 24.4.1
NGC_HELM_CHART_URL ?= https://helm.ngc.nvidia.com/nvidia/charts/network-operator-${HELM_CHART_VERSION}.tgz
BRANCH_HELM_CHART_URL ?= https://github.com/Mellanox/network-operator/archive/refs/heads/${BRANCH}.tar.gz

# helm-docs is used to generate helm chart documentation
HELM_DOCS_PKG := github.com/norwoodj/helm-docs/cmd/helm-docs
HELM_DOCS_VER := v1.14.2
HELM_DOCS_BIN := helm-docs
HELM_DOCS_PATH = $(abspath $(TOOLSDIR)/$(HELM_DOCS_BIN))
HELM_DOCS = $(abspath $(TOOLSDIR)/$(HELM_DOCS_BIN))-$(HELM_DOCS_VER)
$(HELM_DOCS): | $(TOOLSDIR)
	$(call go-install-tool,$(HELM_DOCS_PKG),$(HELM_DOCS_BIN),$(HELM_DOCS_VER))
	$Q ln $(HELM_DOCS) $(HELM_DOCS_PATH)

# go-install-tool will 'go install' a go module $1 with version $3 and install it with the name $2-$3 to $TOOLSDIR.
define go-install-tool
	$Q echo "Installing $(2)-$(3) to $(TOOLSDIR)"
	$Q GOBIN=$(TOOLSDIR) go install $(1)@$(3)
	$Q mv $(TOOLSDIR)/$(2) $(TOOLSDIR)/$(2)-$(3)
endef

download-ngc-helm-chart:
	mkdir -p ${HELM_CHART_DEP_ROOT} && cd ${HELM_CHART_DEP_ROOT} \
	&& curl -sL ${NGC_HELM_CHART_URL} | tar -xz

download-branch-helm-chart:
	mkdir -p ${HELM_CHART_DEP_ROOT} \
	&& curl -sL ${BRANCH_HELM_CHART_URL} \
	| tar -xz -C ${HELM_CHART_DEP_ROOT} \
	--strip-components 2 network-operator-${BRANCH}/deployment/network-operator

# Generate helm chart documentation in a reStructuredText format.
helm-docs: $(HELM_DOCS)
	$(HELM_DOCS) --output-file=../../../../docs/customizations/helm.rst --ignore-file=.helmdocsignore --template-files=./templates/helm.rst.gotmpl ${HELM_CHART_DEP_ROOT}

ngc-helm-docs: download-ngc-helm-chart helm-docs

branch-helm-docs: download-branch-helm-chart helm-docs
