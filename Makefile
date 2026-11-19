# Fern site. Pages reference docs/common/vars.yml as {{name}} and include files
# with <Code src>; docs-render resolves both into $(FERN_BUILD_DIR), and every
# Fern command runs from there.
FERN_BUILD_DIR ?= $(CURDIR)/_build/fern
FERN ?= npx --yes fern-api

.PHONY: docs-render
docs-render:
	python3 hack/fern/render.py --out $(FERN_BUILD_DIR)

.PHONY: docs-check
docs-check: docs-render
	cd $(FERN_BUILD_DIR) && $(FERN) check

# Local preview on http://localhost:3000 (NVIDIA theme needs FERN_TOKEN or 'fern login').
# Re-run 'make docs-render' in another terminal to pick up edits.
.PHONY: docs-preview
docs-preview: docs-render
	cd $(FERN_BUILD_DIR) && $(FERN) docs dev

# Preview deployment; prints the preview URL. Requires FERN_TOKEN.
.PHONY: docs-preview-deploy
docs-preview-deploy: docs-render
	cd $(FERN_BUILD_DIR) && $(FERN) generate --docs --preview

# Publish to the production site. Requires FERN_TOKEN.
.PHONY: docs-publish
docs-publish: docs-render
	cd $(FERN_BUILD_DIR) && $(FERN) generate --docs

.PHONY: clean
clean:
	@echo "Cleaning..."; \
	rm -rf .cache;\
	rm -rf build;\
	rm -rf _build
