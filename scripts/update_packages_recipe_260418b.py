#!/usr/bin/env python3
"""
Deterministic full-file transform for general-compat.scm and packages.scm
to add recipe-resolver-260418b module and its exports.
"""
import shutil
import tempfile
import os

PASS_ID = "recipe-resolver-260418b"
MODULE_NAME = f"(gaurix packages {PASS_ID})"

EXPORTS = [
    "janet-lang",
    "go-mtpfs",
    "tiptop-cli",
    "seqtui",
    "terminal-typeracer",
    "hyprland-workspaces",
    "leakdice",
    "imapgoose",
    "mf-cli",
    "bitbake",
    "mvw",
    "tqftpserv",
    "wordlist-generator",
    "fts-transfer",
    "gomu",
    "gonic",
    "heirloom-doctools",
    "wired-notify",
    "ragnarwm",
    "polybar",
    "telegram-bot-api",
    "kst2",
    "vtun-ng",
    "marble-marcher-ce",
    "supersayer",
    "project-monalisa",
    "catnap",
    "greetd-qtgreet",
    "virtualbmc",
    "fcitx5-configtool",
]


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dir_name = os.path.dirname(path) or "."
    with tempfile.NamedTemporaryFile(
        mode="w", dir=dir_name, suffix=".scm", delete=False
    ) as tmp:
        tmp.write(content)
        tmp_name = tmp.name
    shutil.move(tmp_name, path)


def update_general_compat():
    """Add use-module and re-export lines to general-compat.scm."""
    path = "guix/gaurix/packages/general-compat.scm"
    with open(path, "r") as f:
        content = f.read()

    # Check if already added
    if PASS_ID in content:
        print(f"general-compat.scm already contains {PASS_ID}, skipping")
        return

    lines = content.split("\n")

    # 1. Add #:use-module line after the last existing #:use-module for recipe-resolver
    new_lines = []
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages recipe-resolver-" in line:
            last_use_module_idx = i

    if last_use_module_idx is None:
        # Fallback: find last #:use-module line
        for i, line in enumerate(lines):
            if "#:use-module" in line:
                last_use_module_idx = i

    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_module_idx:
            new_lines.append(f"  #:use-module {MODULE_NAME}")

    # 2. Append re-export lines at the end
    # Find the last line that has content
    content_joined = "\n".join(new_lines)
    re_export_block = f"\n;;; {PASS_ID}\n"
    for pkg in EXPORTS:
        re_export_block += f"(re-export {pkg})\n"

    content_joined = content_joined.rstrip() + "\n" + re_export_block

    atomic_write(path, content_joined)
    print(f"Updated {path}: added {PASS_ID} use-module + {len(EXPORTS)} re-exports")


def update_packages():
    """Add re-export section to packages.scm."""
    path = "guix/gaurix/packages.scm"
    with open(path, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"packages.scm already contains {PASS_ID}, skipping")
        return

    # Build the new section
    pkg_list = ", ".join(EXPORTS[:5]) + ", ..."
    section = f"\n;; {PASS_ID}: 30 NRD resolved ({pkg_list})\n"
    section += f"(define-module (gaurix packages)\n"
    section += f"  #:use-module {MODULE_NAME}\n"
    section += f"  #:re-export (\n"
    for pkg in EXPORTS:
        section += f"               {pkg}\n"
    section += f"               ))\n"

    content = content.rstrip() + "\n" + section

    atomic_write(path, content)
    print(f"Updated {path}: added {PASS_ID} section with {len(EXPORTS)} re-exports")


if __name__ == "__main__":
    update_general_compat()
    update_packages()
