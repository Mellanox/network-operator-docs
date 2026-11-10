#!/usr/bin/env python3
# SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
"""Convert gen-crd-api-reference-docs HTML output to a Fern MDX page.

Usage: crd_html_to_mdx.py <input.html> <output.mdx>

Internal type links are rewritten to the heading anchors Fern generates.
"""
import html
import re
import sys
from html.parser import HTMLParser
from urllib.parse import unquote

HEADER = """{/*
  SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  SPDX-License-Identifier: Apache-2.0
*/}
"""


def heading_slug(text):
    """Heading anchor as Fern generates it (github-slugger)."""
    s = re.sub(r"[`*]", "", text).strip().lower()
    s = re.sub(r"[^\w\- ]", "", s)
    return s.replace(" ", "-")


def escape_text(text, in_table):
    text = re.sub(r"\s+", " ", text)
    text = re.sub(r"([\\{}<>*_\[\]])", r"\\\1", text)
    if in_table:
        text = text.replace("|", "\\|")
    return text


class Converter(HTMLParser):
    def __init__(self, anchors):
        super().__init__(convert_charrefs=True)
        self.anchors = anchors
        self.title = ""
        self.blocks = []
        self.buf = []
        self.stack = []
        self.href = []
        self.table = None
        self.row = None
        self.heading = None

    # -- helpers --------------------------------------------------------
    def in_table(self):
        return self.table is not None

    def flush(self):
        text = "".join(self.buf).strip()
        self.buf = []
        return re.sub(r"(<br />\s*)+$", "", text).strip()

    def end_block(self, prefix=""):
        text = self.flush()
        if text:
            self.blocks.append(prefix + text)

    def link_target(self, href):
        if href.startswith("#"):
            target = self.anchors.get(unquote(href[1:]))
            return "#" + target if target else href
        return href

    # -- parser callbacks -----------------------------------------------
    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        self.stack.append(tag)
        if tag in ("h1", "h2", "h3"):
            self.end_block()
            self.heading = tag
        elif tag == "table":
            self.end_block()
            self.table = []
        elif tag == "tr":
            self.row = []
        elif tag in ("td", "th"):
            self.buf = []
        elif tag == "p":
            if self.in_table():
                if "".join(self.buf).strip():
                    self.buf.append("<br />")
            else:
                self.end_block()
        elif tag == "br":
            self.stack.pop()
            self.buf.append("<br />" if self.in_table() else " ")
        elif tag == "li":
            self.end_block()
        elif tag == "code":
            self.buf.append("`")
        elif tag == "em":
            self.buf.append("*")
        elif tag == "strong":
            self.buf.append("**")
        elif tag == "a":
            self.href.append(self.link_target(attrs.get("href", "")))
            self.buf.append("[")

    def handle_endtag(self, tag):
        if tag == "br":
            return
        if self.stack and self.stack[-1] == tag:
            self.stack.pop()
        if tag == "h1":
            self.title = self.flush()
            self.heading = None
        elif tag in ("h2", "h3"):
            self.end_block("#" * int(tag[1]) + " ")
            self.heading = None
        elif tag in ("td", "th"):
            self.row.append(self.flush())
        elif tag == "tr":
            self.table.append(self.row)
            self.row = None
        elif tag == "table":
            rows, self.table = self.table, None
            if rows:
                out = ["| " + " | ".join(rows[0]) + " |",
                       "| " + " | ".join("---" for _ in rows[0]) + " |"]
                out += ["| " + " | ".join(r) + " |" for r in rows[1:]]
                self.blocks.append("\n".join(out))
        elif tag == "p" and not self.in_table():
            self.end_block()
        elif tag == "li":
            self.end_block("- ")
        elif tag == "code":
            self.buf.append("`")
        elif tag == "em":
            self.buf.append("*")
        elif tag == "strong":
            self.buf.append("**")
        elif tag == "a":
            self.buf.append(f"]({self.href.pop()})")

    def handle_data(self, data):
        if not data.strip():
            if self.buf and not self.buf[-1].endswith(" "):
                self.buf.append(" ")
            return
        if "code" in self.stack:
            text = re.sub(r"\s+", " ", data)
            self.buf.append(text.replace("|", "\\|") if self.in_table() else text)
        else:
            self.buf.append(escape_text(data, self.in_table()))

    def finish(self):
        self.end_block()
        body = "\n\n".join(re.sub(r"\[\s+", "[", re.sub(r"\s+\]", "]", b)) for b in self.blocks)
        return f"---\ntitle: {self.title}\n---\n\n{HEADER}\n{body}\n"


def main():
    src, dst = sys.argv[1], sys.argv[2]
    raw = open(src, encoding="utf-8").read()
    anchors = {}
    for m in re.finditer(r'<h[23] id="([^"]+)">(.*?)</h[23]>', raw, re.S):
        text = html.unescape(re.sub(r"<[^>]+>", "", m.group(2)))
        anchors[m.group(1)] = heading_slug(re.sub(r"\s+", " ", text))
    conv = Converter(anchors)
    conv.feed(raw)
    with open(dst, "w", encoding="utf-8") as f:
        f.write(conv.finish())


if __name__ == "__main__":
    main()
