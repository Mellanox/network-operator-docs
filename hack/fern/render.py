#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
"""Render the Fern site sources into a buildable Fern project.

Pages reference shared values from docs/common/vars.yml as {{name}}, and
include files with <Code src="..." language="..." lines="N-M" />. Fern
supports neither natively, so this script copies fern/ and docs/ to the
output directory, substitutes the variables (prose, code blocks and
attributes alike) and inlines every <Code src> as a fenced code block.

Run the Fern CLI from the output directory, never from the repo root.
"""
import argparse
import json
import re
import shutil
import sys
import urllib.request
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
TEXT_SUFFIXES = {".mdx", ".md", ".yml", ".yaml", ".json"}

VAR_REF = re.compile(r"\{\{\s*([A-Za-z0-9][A-Za-z0-9_-]*)\s*\}\}")
CODE_TAG = re.compile(r"^(?P<indent>[ \t]*)<Code\s+(?P<attrs>[^>]*?)\s*/>[ \t]*$", re.M)
ATTR = re.compile(r'([\w-]+)="([^"]*)"')


def load_vars(path):
    values = {}
    for n, line in enumerate(path.read_text().splitlines(), 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        key, sep, value = line.partition(":")
        if not sep:
            sys.exit(f"{path}:{n}: expected 'name: value'")
        value = value.strip()
        if value.startswith('"'):
            value = json.loads(value)
        elif value.startswith("'"):
            value = value[1:-1].replace("''", "'")
        values[key.strip()] = value
    return values


def substitute(text, values, where, errors):
    def repl(m):
        name = m.group(1)
        if name in values:
            return values[name]
        # Hyphenated names are ours; anything else (Helm, Go templates) is content
        if "-" in name:
            errors.append(f"{where}: unknown variable {{{{{name}}}}}")
        return m.group(0)
    return VAR_REF.sub(repl, text)


def slice_lines(text, spec):
    lines = text.splitlines()
    picked = []
    for part in spec.split(","):
        start, dash, end = part.strip().partition("-")
        lo = int(start) if start else 1
        hi = (int(end) if end else len(lines)) if dash else lo
        picked.extend(lines[lo - 1:hi])
    return "\n".join(picked)


def read_source(src, page, cache):
    if re.match(r"^https?://", src):
        if src not in cache:
            with urllib.request.urlopen(src, timeout=30) as resp:
                cache[src] = resp.read().decode("utf-8")
        return cache[src]
    path = (page.parent / src).resolve()
    return path.read_text()


def inline_code(text, page, errors, cache):
    def repl(m):
        attrs = dict(ATTR.findall(m.group("attrs")))
        src = attrs.get("src", "")
        try:
            body = read_source(src, page, cache)
        except Exception as e:  # noqa: BLE001
            errors.append(f"{page.relative_to(REPO)}: cannot read {src}: {e}")
            return m.group(0)
        if attrs.get("lines"):
            body = slice_lines(body, attrs["lines"])
        body = body.rstrip("\n")
        fence = "```"
        while fence in body:
            fence += "`"
        info = attrs.get("language", "")
        if attrs.get("title"):
            info += f' title="{attrs["title"]}"'
        indent = m.group("indent")
        block = [f"{fence}{info}"] + body.split("\n") + [fence]
        return "\n".join(indent + l if l else "" for l in block)
    return CODE_TAG.sub(repl, text)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--out", default=str(REPO / "_build" / "fern"),
                        help="output directory (default: _build/fern)")
    args = parser.parse_args()

    out = Path(args.out).resolve()
    values = load_vars(REPO / "docs" / "common" / "vars.yml")

    if out.exists():
        shutil.rmtree(out)
    shutil.copytree(REPO / "fern", out / "fern")
    shutil.copytree(REPO / "docs", out / "docs")

    errors = []
    cache = {}
    for dst in sorted(out.rglob("*")):
        if not dst.is_file() or dst.suffix not in TEXT_SUFFIXES:
            continue
        rel = dst.relative_to(out)
        page = REPO / rel
        text = substitute(dst.read_text(), values, str(rel), errors)
        if dst.suffix == ".mdx":
            text = inline_code(text, page, errors, cache)
        dst.write_text(text)

    if errors:
        print("\n".join(errors), file=sys.stderr)
        sys.exit(1)
    print(f"Rendered Fern project to {out}")


if __name__ == "__main__":
    main()
