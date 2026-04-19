#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260418ai.

Marks 18 packages as DONE (resolved with recipes) and 12 as BLOCKED
(NEEDS_RECIPE_DESIGN_EXHAUSTED).
"""

import os
import re
import tempfile
import shutil

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
BATCH_ID = "recipe-resolver-260418ai"

# (package_name_in_file, version, build_system, license)
RESOLVED = [
    ("ryujinx-bin", "v1.3.3", "copy-build-system", "MIT"),
    ("hitech-arch-animation", "v2", "copy-build-system", "MIT"),
    ("ridecost", "v1.1.1", "copy-build-system", "Apache-2.0"),
    ("jre-jetbrains", "v25.0.2", "copy-build-system", "GPL-2.0"),
    ("dssat-csm-os-git", "v4.8.5.17", "cmake-build-system", "custom"),
    ("virt-v2v", "v2.9.2", "gnu-build-system", "GPL-2.0+"),
    ("marcwel-archive", "v3.69.420", "copy-build-system", "beerware"),
    ("gpt4all-chat-git", "v3.3.0", "cmake-build-system", "MIT"),
    ("playonlinux", "v4.4", "copy-build-system", "GPL-3.0+"),
    ("rancher-desktop-bin", "v1.22.0", "copy-build-system", "Apache-2.0"),
    ("duelsplus", "v2.8.4", "copy-build-system", "MIT"),
    ("anytype-bin", "v0.54.11", "copy-build-system", "custom"),
    ("ps7_libps2000", "v3.0.150", "copy-build-system", "custom"),
    ("ps7_libps2000a", "v2.2.155", "copy-build-system", "custom"),
    ("ps7_libps3000a", "v2.2.157", "copy-build-system", "custom"),
    ("ps7_libps4000a", "v2.2.221", "copy-build-system", "custom"),
    ("ps7_libps6000", "v2.1.151", "copy-build-system", "custom"),
    ("ps7_libusbtc08", "v2.0.150", "copy-build-system", "custom"),
]

# (package_name_in_file, exhaust_reason, short_description)
EXHAUSTED = [
    ("lib32-libxxf86dga", "MULTILIB_UNSUPPORTED",
     "32-bit build of Xorg XF86DGA extension; Guix does not support multilib; A1: cross-compile i686 — not lib32 compatible; A2: use 64-bit libxxf86dga — different ABI; A3: custom 32-bit sysroot — impractical"),
    ("hyprland-workspaces-tui", "CARGO_DEPS_NEEDED",
     "Rust TUI needing full cargo dependency enumeration (~30 crates via clap, ratatui); A1: guix import crate — incomplete transitive deps; A2: package crates individually — large scope; A3: use hyprctl directly — no TUI"),
    ("wsl-hello-sudo-bin", "PLATFORM_SPECIFIC",
     "WSL-only PAM module for Windows Hello auth; requires Windows host WSL environment; A1: run on Guix System — no WSL; A2: adapt to non-WSL — needs Windows Hello API; A3: use standard PAM — different auth model"),
    ("keyd-openrc", "INIT_SPECIFIC",
     "OpenRC init scripts for keyd daemon; Guix uses Shepherd init system; A1: convert to Shepherd service — keyd itself already in Guix; A2: OpenRC wrapper — unsupported init; A3: run keyd directly — no init integration"),
    ("container2wasm-git", "DEP_MISSING",
     "Go container converter needing buildah + skopeo (not in Guix); A1: package buildah (~50 Go deps) — large scope; A2: package skopeo — also large scope; A3: pre-built binary — no official Linux releases"),
    ("deadlock-api-ingest-git", "CARGO_DEPS_NEEDED",
     "Rust packet capture client needing cargo deps (~25 crates including libpcap bindings); A1: guix import crate — incomplete; A2: vendored build — violates Guix source policy; A3: pre-built binary — none available"),
    ("powershell-editor-services", "DEP_MISSING",
     "PowerShell language server needing PowerShell runtime (not in Guix); A1: package PowerShell — .NET ecosystem not bootstrapped; A2: pre-built binary — needs PowerShell host; A3: alternative LSP — different tool"),
    ("yt6801-dkms", "KERNEL_MODULE",
     "DKMS kernel module for Motorcomm YT6801 NIC; Guix uses declarative kernel module system incompatible with DKMS; A1: native kernel config — needs upstream mainlining; A2: out-of-tree module build — complex Guix integration; A3: use compatible NIC — different hardware"),
    ("texlive-installer", "DISTRO_SPECIFIC",
     "Arch pacman compatibility shim that tricks pacman into thinking texlive is installed; A1: Guix has native texlive packages — no shim needed; A2: adapt installer — downloads 4GB runtime; A3: use guix texlive packages — already available"),
    ("updpkgsrcs", "DISTRO_SPECIFIC",
     "Bash tool for updating git submodule source arrays in Arch PKGBUILD files; A1: no PKGBUILD on Guix — tool has no purpose; A2: adapt for Guix — different packaging model; A3: use git submodule commands directly"),
    ("transgui-git", "DEP_MISSING",
     "Transmission Qt6 GUI requiring Lazarus/Free Pascal compiler (not in Guix); A1: package Lazarus — massive Pascal IDE ecosystem; A2: package qt6pas — needs Lazarus build; A3: use tremc/transmission-gtk — different clients"),
    ("roxybrowser-bin", "PROPRIETARY",
     "Antidetect browser (commercial product by Roxy); MIT license applies to AUR PKGBUILD only; A1: actual software is proprietary — no redistribution rights; A2: Electron binary — requires patching for Guix; A3: use Tor Browser — open-source privacy browser"),
]


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    header_re = re.compile(
        r'^(\*\* )(FAILED|TODO|BLOCKED|DONE|SKIPPED)( \d+\.\s+)(.+?)(\s+\[.*\])?(\s+:.*:)?\s*$'
    )

    updated_count = 0
    not_found = []

    # Process RESOLVED packages
    for pkg_name, version, build_system, license_str in RESOLVED:
        status_line = (
            f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
            f"recipe in {BATCH_ID}.scm "
            f"({pkg_name} {version}, {build_system}, {license_str}) "
            f"({BATCH_ID})\n"
        )
        found = _update_entry(lines, header_re, pkg_name, "DONE", status_line)
        if found:
            updated_count += 1
        else:
            not_found.append(pkg_name)

    # Process EXHAUSTED packages
    for pkg_name, reason, description in EXHAUSTED:
        status_line = (
            f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: "
            f"{reason}: {description} ({BATCH_ID})\n"
        )
        found = _update_entry(lines, header_re, pkg_name, "BLOCKED", status_line)
        if found:
            updated_count += 1
        else:
            not_found.append(pkg_name)

    if not_found:
        print(f"WARNING: not found in todo file: {not_found}")

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(TODO_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Updated {updated_count} entries in {TODO_FILE}")
    if not_found:
        print(f"Not found: {not_found}")


def _update_entry(lines, header_re, pkg_name, new_keyword, status_line):
    """Find and update a package entry. Returns True if found."""
    indices = []
    for i, line in enumerate(lines):
        m = header_re.match(line.rstrip('\n'))
        if m:
            header_pkg = m.group(4).strip()
            # Remove trailing bracket content and tags for matching
            header_pkg = re.sub(r'\s+\[.*$', '', header_pkg)
            header_pkg = re.sub(r'\s+:.*$', '', header_pkg)
            if header_pkg == pkg_name:
                indices.append(i)

    if not indices:
        return False

    # Process from bottom to top so insertions don't shift later indices
    for idx in reversed(indices):
        # 1. Change header keyword to new_keyword
        line = lines[idx]
        new_line = re.sub(
            r'^(\*\* )(FAILED|TODO|BLOCKED|DONE|SKIPPED)', f'\\1{new_keyword}', line
        )
        # Add tag if DONE
        if new_keyword == "DONE" and f":{BATCH_ID}:" not in new_line:
            tag = f"  :{BATCH_ID}:recipe-generated:"
            new_line = new_line.rstrip() + tag + "\n"
        lines[idx] = new_line

        # 2. Find end of entry and insert status line
        j = idx + 1
        while j < len(lines):
            if lines[j].startswith('** '):
                break
            j += 1
        # Walk backwards to skip blank lines
        insert_at = j
        while insert_at > idx + 1 and lines[insert_at - 1].strip() == '':
            insert_at -= 1
        lines.insert(insert_at, status_line)

    return True


if __name__ == "__main__":
    main()
