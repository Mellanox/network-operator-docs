# NVIDIA Network Operator Documentation

For official documentation, go to:

https://docs.nvidia.com/networking/software/cloud-orchestration/index.html


## Layout

```text
fern/
  fern.config.json      # Fern organization and CLI version
  docs.yml              # Site settings, theme, versions
  redirects.yml         # Old Sphinx *.html URLs -> Fern URLs
  assets/               # Files the pages offer for download
docs/
  index.yml             # Navigation
  common/vars.yml       # Shared variables (versions, repositories, ...)
  images/               # Pictures referenced by the pages
  **/*.mdx              # Pages
hack/fern/render.py     # Resolves variables and includes into _build/fern
```

## Variables

`docs/common/vars.yml` holds every shared value, one `name: "value"` per line.
Reference a value from any page, including code blocks, as `{{name}}`:

```mdx
Install Network Operator {{network-operator-version}}:

    helm install network-operator nvidia/network-operator --version {{helm-chart-version}}
```

Fern does not resolve `{{name}}` itself. `make docs-render` writes the resolved
site to `_build/fern`, and every Fern command runs from there.

## Build and preview

Requires Python 3 and Node.js 22.

```bash
make docs-check      # render and validate (fern check)
make docs-preview    # render and serve on http://localhost:3000
```

While `docs-preview` is running, run `make docs-render` again to pick up edits.
The NVIDIA theme is applied only when you are logged in (`npx fern-api login`) or
`FERN_TOKEN` is set.

## Callouts and other components

| reStructuredText | Fern MDX |
| --- | --- |
| `.. note::` | `<Note>...</Note>` |
| `.. warning::` | `<Warning>...</Warning>` |
| `\|name\|` with `.. \|name\| replace::` | `{{name}}` with `docs/common/vars.yml` |
| `.. list-table::` | a Markdown table |
| `:doc:` / `:ref:` | `[text](/path/to/page#anchor)` |
| `:download:` | `<Download src="../fern/assets/...">text</Download>` |

## Publishing

- Pull requests run `fern check` and, for branches in this repository, post a
  preview link (`fern-docs-ci.yml`, `fern-docs-preview-*.yml`).
- Push a `docs/v*` tag, or run the "Publish Fern Docs" workflow, to publish
  (`publish-fern-docs.yml`).

Both preview and publish need the `FERN_TOKEN` repository secret.

## Version update

Edit the values in `docs/common/vars.yml`; every page picks them up on the next
`make docs-render`.
