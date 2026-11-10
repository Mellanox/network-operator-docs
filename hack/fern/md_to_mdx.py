#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
"""Make generated Markdown safe to compile as MDX.

Usage: md_to_mdx.py <input.md> <output.mdx> [--link-base URL]

Outside code fences and inline code, "{", "}" and any "<" that does not open
one of the allowed tags are escaped. The contents of a one-line <pre>...</pre>
(multi-line values inside table cells, newlines written as &#10;) are escaped
as well. --link-base turns relative links into absolute ones, for Markdown
fetched from another repository.
"""
import argparse
import re

ALLOWED_TAGS = r"(?:br|pre|Note|Warning|Tip|Info)\b"


def split_fences(text):
    out, cur, fence = [], [], None
    for line in text.split("\n"):
        m = re.match(r"^\s*(`{3,}|~{3,})", line)
        if fence is None and m:
            if cur:
                out.append(("\n".join(cur), False))
            cur, fence = [line], m.group(1)
        elif fence is not None and line.strip().startswith(fence) and not line.strip().strip(fence[0]):
            cur.append(line)
            out.append(("\n".join(cur), True))
            cur, fence = [], None
        else:
            cur.append(line)
    if cur:
        out.append(("\n".join(cur), fence is not None))
    return out


def escape_pre(m):
    body = re.sub(r"([\\`*_{}\[\]<>|])", r"\\\1", m.group(1))
    return f"<pre>{body}</pre>"


def escape_prose(text):
    parts = re.split(r"(<pre>.*?</pre>|`[^`\n]+`)", text)
    out = []
    for i, part in enumerate(parts):
        if i % 2:
            out.append(re.sub(r"<pre>(.*?)</pre>", escape_pre, part))
            continue
        part = re.sub(r"(?<!\\)([{}])", r"\\\1", part)
        part = re.sub(r"(?<!\\)<(?!/?" + ALLOWED_TAGS + ")", r"\\<", part)
        out.append(part)
    return "".join(out)


def absolutize(text, base):
    def repl(m):
        target = m.group(2)
        if re.match(r"^([a-z]+:|#|/)", target):
            return m.group(0)
        return f"{m.group(1)}({base.rstrip('/')}/{target})"
    return re.sub(r"(\[[^\]]*\])\(([^)\s]+)\)", repl, text)


def rst_links(text):
    return re.sub(r"`([^`<]+?)\s*<([a-z]+://[^>]+)>`__?", r"[\1](\2)", text)


def convert(text, link_base=None):
    out = []
    for seg, is_code in split_fences(text):
        if not is_code:
            seg = rst_links(seg)
            if link_base:
                seg = absolutize(seg, link_base)
            seg = escape_prose(seg)
        out.append(seg)
    return "\n".join(out)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("src")
    parser.add_argument("dst")
    parser.add_argument("--link-base")
    args = parser.parse_args()
    text = open(args.src, encoding="utf-8").read()
    fm = re.match(r"^---\n.*?\n---\n", text, re.S)
    head, body = (text[:fm.end()], text[fm.end():]) if fm else ("", text)
    # keep MDX comments ({/* ... */}) as written
    pieces = re.split(r"(\{/\*.*?\*/\})", body, flags=re.S)
    body = "".join(p if i % 2 else convert(p, args.link_base) for i, p in enumerate(pieces))
    with open(args.dst, "w", encoding="utf-8") as f:
        f.write(head + body)


if __name__ == "__main__":
    main()
