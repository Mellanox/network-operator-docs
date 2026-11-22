---
title: "Automation and CI/CD"
---

{/*
  SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}

<Note>
**Use this when:** you are wiring Launch Kit into a CI/CD pipeline, an automation framework, or an AI agent that needs structured output and exit-code-driven retry logic.
</Note>

Launch Kit is designed for both interactive use and automated pipelines. Lifecycle commands support structured output, process exit codes, and capability discovery. Their output contracts differ by command.

## JSON Output Mode

Use `--output json` for machine-readable lifecycle output. Capture output and diagnostics separately, and preserve the command exit status before parsing:

```bash
status=0
l8k generate --user-config ./cluster-config.yaml \
    --fabric ethernet --deployment-type sriov --multirail \
    --save-deployment-files ./deployments --output json \
    >generation.json 2>generation.log || status=$?
if [ "$status" -ne 0 ]; then
    cat generation.log >&2
    exit "$status"
fi
jq . generation.json
```

`discover`, `generate`, and the root pipeline emit one result object. Standalone `deploy` has no finalized success JSON object; use its exit status. `validate` emits a stream of separate objects for static results, connectivity, and `reportPath`: capture it as JSON Lines and use `jq -s .` when an array is needed. `preset` and `sosreport` retain text success output despite accepting the inherited output flag.

## Non-Interactive Flags

- `--output json` — auto-confirm lifecycle prompts, including deployment actions.
- `--yes` / `-y` and `--quiet` / `-q` — root-pipeline flags, not global subcommand flags.

## Exit Codes

| **Code** | **Meaning** |
| --- | --- |
| 0 | Success. |
| 1 | General error. |
| 2 | Validation error (invalid flags or configuration). |
| 3 | Cluster error (API unreachable, discovery failed). |
| 4 | Deployment or validation gate failure. |
| 5 | Partial success (discovery completed but deployment failed). |

## Structured Errors

In JSON mode, errors include structured fields (`code`, `category`, `transient`, `suggestion`) to help automation decide whether to retry or fix input. `transient: true` indicates a temporary condition (e.g., API unreachable) where retry is appropriate; `transient: false` indicates a permanent failure (e.g., invalid flag) requiring input changes.

## Schema Discovery

AI agents and automation tools can programmatically discover Launch Kit's capabilities:

```bash
l8k schema
```

Outputs a JSON description of available commands, phases, fabrics, deployment types, flags, exit codes, and output formats. Tools that need to know what l8k can do (without parsing `--help` text) use this endpoint.

## See Also

- [AI Skills](/ai-skills) — driving `l8k` from Claude Code, Cursor, Codex CLI, or any agent
- [CLI Reference](/k8s-launch-kit/reference/cli) — complete flag reference
- [Troubleshooting](/k8s-launch-kit/troubleshooting) — diagnosing failed pipelines
