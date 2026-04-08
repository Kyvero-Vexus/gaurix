#!/usr/bin/env python3
"""
Update todo_general_packages.org statuses for recipe-resolver-260408p.

Resolves 30 NEEDS_RECIPE_DESIGN packages:
  - 28 with new recipes (DONE)
  - 2 re-evaluated with specific blocking reasons

All transforms: read → compute → write temp → atomic move.
"""

import os
import re
import tempfile
import shutil

TARGET = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "todo_general_packages.org"
)

BATCH_TAG = "recipe-resolver-260408p"

# Packages resolved with new recipes (status → DONE)
DONE_PACKAGES = {
    4623: ("otf-geist", "font-geist (Vercel Geist sans OTF/TTF, font-build-system)"),
    4624: ("ttf-geist", "compat alias to font-geist (Vercel Geist sans TTF)"),
    4625: ("ttf-geist-variable", "compat alias to font-geist (Vercel Geist variable TTF)"),
    4626: ("otf-geist-mono", "font-geist-mono (Vercel Geist Mono OTF/TTF, font-build-system)"),
    4627: ("ttf-geist-mono", "compat alias to font-geist-mono (Vercel Geist Mono TTF)"),
    4628: ("ttf-geist-mono-variable", "compat alias to font-geist-mono (Vercel Geist Mono variable TTF)"),
    4606: ("profile-sync-daemon-zen", "copy-build-system, Zen browser PSD config file"),
    4614: ("sddm-theme-elegant-archlinux-git", "sddm-theme-elegant-archlinux (copy-build-system, QML login theme)"),
    4631: ("brokefetch-git", "brokefetch (copy-build-system, Bash sysinfo fetcher)"),
    4592: ("empiriqa-bin", "copy-build-system, pre-built Rust binary from GitHub"),
    4595: ("tuitube-bin", "copy-build-system, pre-built TUI YouTube client binary"),
    4620: ("nosy-bin", "copy-build-system, pre-built CLI content summarizer binary"),
    4386: ("stto-bin", "copy-build-system, pre-built Go line-of-code counter binary"),
    4354: ("ptui-bin", "copy-build-system, pre-built Rust TUI image viewer binary"),
    4598: ("terminal-fireworks", "pyproject-build-system, Python terminal fireworks animation"),
    4622: ("deadlock-server-picker", "pyproject-build-system, Python game server picker"),
    3742: ("borse", "pyproject-build-system, Python braille/morse/semaphore practice"),
    4024: ("vhd2vl-git", "vhd2vl (gnu-build-system, C/Make VHDL to Verilog translator)"),
    3739: ("xcman", "gnu-build-system, C/Make minimal X11 compositing manager"),
    3736: ("pp", "pp-pager (gnu-build-system, C/Make page pager utility)"),
    3744: ("xtest", "xtest-utility (gnu-build-system, C/Make test(1) variant)"),
    3745: ("blacklist-check", "copy-build-system, Bash domain DNSBL blacklist checker"),
    4567: ("sc-git", "sc (gnu-build-system, C/Make terminal spreadsheet calculator)"),
    3746: ("fujprog", "cmake-build-system, C JTAG programmer for FPGA boards"),
    4618: ("nautilus-code", "meson-build-system, Nautilus open-in-editor extension"),
    4616: ("litestream", "go-build-system, streaming SQLite replication to S3"),
    4635: ("resticprofile", "go-build-system, restic backup profiles manager"),
}

# Packages re-evaluated with specific blocking reasons (stay BLOCKED)
REBLOCKED_PACKAGES = {
    4607: ("responsively", "NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408p; Electron app requiring full Chromium/Electron build infrastructure not available in Guix. See blocked-notes."),
    4610: ("cupola-git", "NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408p; Rust+libcosmic requires COSMIC desktop libraries (cosmic-text, iced, libcosmic) not packaged in Guix. See blocked-notes."),
    4611: ("python-pymatgen", "NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408p; complex scientific Python with C extensions (spglib, sympy, monty, ruamel-yaml, etc.), 30+ transitive deps not in Guix. See blocked-notes."),
}


def update_done(lines, pkg_num, pkg_name, recipe_desc):
    """Update a package entry to DONE status."""
    pattern = re.compile(rf"^\*\* BLOCKED {pkg_num}\.")
    found = False
    for i, line in enumerate(lines):
        if pattern.match(line):
            found = True
            # Change header from BLOCKED to DONE
            lines[i] = line.replace("** BLOCKED", "** DONE", 1)
            # Find and update Status line
            for j in range(i + 1, min(i + 10, len(lines))):
                if "   - Status:" in lines[j] and "NEEDS_RECIPE_DESIGN" in lines[j]:
                    lines[j] = f"   - Status: DONE: recipe in {BATCH_TAG}.scm ({recipe_desc})"
                    break
            # Find and update TODO Status line
            for j in range(i + 1, min(i + 10, len(lines))):
                if "   - TODO Status:" in lines[j]:
                    lines[j] = f"   - TODO Status: DONE"
                    break
            break
    return found


def update_reblocked(lines, pkg_num, pkg_name, reason):
    """Update a package entry with re-evaluation reason."""
    pattern = re.compile(rf"^\*\* BLOCKED {pkg_num}\.")
    found = False
    for i, line in enumerate(lines):
        if pattern.match(line):
            found = True
            for j in range(i + 1, min(i + 10, len(lines))):
                if "   - Status:" in lines[j] and "NEEDS_RECIPE_DESIGN" in lines[j]:
                    lines[j] = f"   - Status: BLOCKED: {reason}"
                    break
            break
    return found


def main():
    with open(TARGET, "r") as f:
        lines = f.read().split("\n")

    done_count = 0
    reblocked_count = 0
    not_found = []

    for pkg_num, (pkg_name, recipe_desc) in DONE_PACKAGES.items():
        if update_done(lines, pkg_num, pkg_name, recipe_desc):
            done_count += 1
        else:
            not_found.append(f"DONE #{pkg_num} {pkg_name}")

    for pkg_num, (pkg_name, reason) in REBLOCKED_PACKAGES.items():
        if update_reblocked(lines, pkg_num, pkg_name, reason):
            reblocked_count += 1
        else:
            not_found.append(f"REBLOCK #{pkg_num} {pkg_name}")

    result = "\n".join(lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(TARGET), suffix=".org.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.write(result)
        shutil.move(tmp_path, TARGET)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {TARGET}")
    print(f"  DONE: {done_count}")
    print(f"  Re-blocked: {reblocked_count}")
    if not_found:
        print(f"  NOT FOUND: {not_found}")


if __name__ == "__main__":
    main()
