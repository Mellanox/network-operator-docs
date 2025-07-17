# Package related
TOOLSDIR=$(CURDIR)/hack/tools/bin
BUILDDIR=$(CURDIR)/build/_output
CACHE_DIR=$(CURDIR)/.cache/packman

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

$(BUILDDIR) $(TOOLSDIR) $(HELM_CHART_DEP_ROOT) $(CRD_API_DEP_ROOT) $(NIC_CONF_CRD_API_DEP_ROOT): ; $(info Creating directory $@...)
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

# Generate helm chart documentation in a reStructuredText format.
.PHONY: gen-helm-docs
gen-helm-docs: | $(HELM_DOCS)
	$(HELM_DOCS) --output-file=../../../../docs/customizations/helm.rst \
	--ignore-file=.helmdocsignore \
	--template-files=./templates/helm.rst.gotmpl ${HELM_CHART_DEP_ROOT}

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
	docker run --rm --volume "`pwd`:/data:Z" pandoc/minimal -f html -t rst --lua-filter=/data/hack/ref_links.lua \
	--columns 200 /data/build/_output/crds-api.html -o /data/docs/customizations/crds.rst


.PHONY: nic-conf-api-docs
nic-conf-api-docs: gen-nic-conf-crd-api-docs
	docker run --rm --volume "`pwd`:/data:Z" pandoc/minimal -f html -t rst --lua-filter=/data/hack/ref_links.lua \
	--columns 200 /data/build/_output/nic-conf-crds-api.html -o /data/docs/nic-conf-operator/crds.rst

.PHONY: nic-conf-api-docs-versioned
nic-conf-api-docs-versioned:
	$(eval NIC_CONF_VERSION := $(shell grep "nic-configuration-operator-version" docs/common/vars.rst | sed 's/.*replace:: //'))
	@echo "Using NIC Configuration Operator version: $(NIC_CONF_VERSION)"
	TAG=$(NIC_CONF_VERSION) make nic-conf-api-docs

.PHONY: fetch-config-docs
fetch-config-docs:
	$(eval NIC_CONF_VERSION := $(shell grep "nic-configuration-operator-version" docs/common/vars.rst | sed 's/.*replace:: //'))
	@echo "Fetching configuration documentation for version: $(NIC_CONF_VERSION)"
	./hack/fetch-config-docs.sh Mellanox/nic-configuration-operator $(NIC_CONF_VERSION) README.md docs/nic-conf-operator/configuration-details.rst

.PHONY: nic-conf-docs
nic-conf-docs: nic-conf-api-docs-versioned fetch-config-docs
	@echo "Generated all NIC Configuration Operator documentation"

.PHONY: build-cache
build-cache:
	@if [ -d "$(CACHE_DIR)" ]; then \
		echo "$(CACHE_DIR) exists. Skipping build-cache."; \
	else \
		echo "Creating $(CACHE_DIR)..."; \
		mkdir -p $(CACHE_DIR); \
		# Add commands to populate the cache here \
		export PM_PACKAGES_ROOT=${CACHE_DIR}; \
		${CURDIR}/repo.sh docs || true; \
		${CURDIR}/tools/packman/python.sh -m pip install --no-cache-dir --no-deps -U -t ${CACHE_DIR}/chk/sphinx/4.5.0.2-py3.7-linux-x86_64/ Sphinx-Substitution-Extensions; \
	fi

.PHONY: gen-docs
gen-docs: build-cache
	@echo "Generating documentation..."; \
    export PM_PACKAGES_ROOT=${CACHE_DIR}; \
	${CURDIR}/repo.sh docs

.PHONY: generate-docs-versions-var
generate-docs-versions-var: | $(BUILDDIR)
	curl -sL ${RELEASE_YAML_URL} -o $(CURDIR)/build/release.yaml
	cd hack/release && go run release.go --releaseDefaults $(CURDIR)/build/release.yaml --templateDir ./templates/vars --outputDir ../../docs/common/
	cd hack/release && go run release.go --with-sha256 --releaseDefaults $(CURDIR)/build/release.yaml --templateDir ./templates/image-sha256  --outputDir ../../docs/advanced/

.PHONY: clean
clean:
	@echo "Cleaning..."; \
	rm -rf .cache;\
	rm -rf build;\
	rm -rf _build
