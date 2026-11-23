# NVIDIA Network Operator Documentation

For official documentation, go to:

https://docs.nvidia.com/networking/software/cloud-orchestration/index.html

The site is built with [Fern](https://buildwithfern.com) following the
[NVIDIA Fern guide](https://gitlab-master.nvidia.com/fern-documentation/guides/-/blob/main/README.md).

## Layout

```text
fern/
  fern.config.json      # Fern organization and CLI version
  docs.yml              # Site settings, theme, versions, variable profile
  redirects.yml         # Old Sphinx *.html URLs -> Fern URLs
  assets/               # Files the pages offer for download
docs/
  index.yml             # Navigation
  common/vars.yml       # Shared variables (versions, repositories, ...)
  images/               # Pictures referenced by the pages
  **/*.mdx              # Pages
```

## Variables

`docs/common/vars.yml` holds every shared value under a single `vars:` key. Fern
reads it through the `default` profile in `fern/docs.yml`, and the version entry
opts in with `profile: default`. Reference a value from any page, including code
blocks, as `${name}`:

```mdx
Install Network Operator ${network_operator_version}:

    helm install network-operator nvidia/network-operator --version ${helm_chart_version}
```

Rules for variables:

- Names use letters, digits and underscores. A hyphenated name such as
  `${helm-chart-version}` is not replaced.
- A name that is not defined is left as written, so shell variables in code blocks
  keep working. Never define `KERNEL_VERSION`, `RH_USERNAME` or `RH_PASSWORD`,
  because the docs use them as shell variables.

This branch holds the v24.4.0 docs and carries its own variables, so the main
branch can attach it to its `fern/docs.yml` as a pinned `ref`. Fern reads the
`docs.yml` and `vars.yml` committed at that commit; after changing either, update
the `ref` on the main branch to the new commit.

## Build and preview

Requires Node.js 18 or newer. The Fern CLI version in `fern/fern.config.json` must
be 5.215.0 or newer, because `profile` on a version entry needs it.

```bash
make docs-check      # validate (fern check)
make docs-preview    # serve on http://localhost:3000
```

Every Fern command runs from the repository root. Restart `docs-preview` after
editing `docs/common/vars.yml` or `fern/docs.yml`. The NVIDIA theme is applied only
when you are logged in (`npx fern-api login`) or `FERN_TOKEN` is set.

## Callouts and other components

| reStructuredText | Fern MDX |
| --- | --- |
| `.. note::` | `<Note>...</Note>` |
| `.. warning::` | `<Warning>...</Warning>` |
| `\|name\|` with `.. \|name\| replace::` | `${name}` with `docs/common/vars.yml` |
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
preview or build.
