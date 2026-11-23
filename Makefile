# Fern site. Pages reference docs/common/vars.yml as ${name}; Fern substitutes
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
	rm -rf build
