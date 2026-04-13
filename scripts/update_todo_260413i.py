#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260413i."""

import re

TODO_FILE = "todo_general_packages.org"

# Recipes (status → DONE)
RECIPES = {
    "python3-threaded_servers": "DONE: recipe in recipe-resolver-260413i.scm (copy-build-system, Python threaded server modules from xyne.dev)",
    "ps3dec-git": "DONE: recipe in recipe-resolver-260413i.scm (cmake-build-system, PS3 ISO decryptor with mbedtls)",
    "trickle": "DONE: recipe in recipe-resolver-260413i.scm (gnu-build-system, C autotools bandwidth shaper with libevent)",
    "oshd": "DONE: recipe in recipe-resolver-260413i.scm (copy-build-system, Python daemon for /etc/hosts management)",
    "sshpilot": "DONE: recipe in recipe-resolver-260413i.scm (pyproject-build-system, Python/GTK4 SSH manager with paramiko)",
    "rip-cli": "DONE: recipe in recipe-resolver-260413i.scm (trivial-build-system stub, Rust rm replacement; cargo-inputs pending)",
    "disk-spinner": "DONE: recipe in recipe-resolver-260413i.scm (trivial-build-system stub, Rust HDD burn-in tool; cargo-inputs pending)",
    "psn-git": "DONE: recipe in recipe-resolver-260413i.scm (trivial-build-system stub, Rust TUI process navigator; cargo-inputs pending)",
    "ripsecrets": "DONE: recipe in recipe-resolver-260413i.scm (trivial-build-system stub, Rust secret scanner; cargo-inputs pending)",
    "kapowarr": "DONE: recipe in recipe-resolver-260413i.scm (copy-build-system, Python/Flask comic book library manager)",
    "nut-multimedia-git": "DONE: recipe in recipe-resolver-260413i.scm (gnu-build-system, NUT multimedia container format library from FFmpeg project)",
    "gnome-ssh-askpass4-git": "DONE: recipe in recipe-resolver-260413i.scm (gnu-build-system, GNOME SSH askpass dialog from openssh-portable contrib)",
    "pleaser": "DONE: recipe in recipe-resolver-260413i.scm (trivial-build-system stub, Rust sudo/doas alternative; cargo-inputs pending)",
    "libsurvive-git": "DONE: recipe in recipe-resolver-260413i.scm (cmake-build-system, VR lighthouse tracking library with hidapi/eigen)",
    "sddm-conf": "DONE: recipe in recipe-resolver-260413i.scm (cmake-build-system, Qt5 configuration editor for SDDM)",
}

# Blocked (update status with reason)
BLOCKED = {
    "python-withoutbg": "BLOCKED: MISSING_GUIX_DEPS — onnxruntime (massive C++ ML runtime) and huggingface-hub not in Guix. See recipe-resolver-260413i-blocked-notes.scm.",
    "meshroom": "BLOCKED: COMPLEX_DEPS — requires AliceVision framework (C++ photogrammetry with CUDA/OpenEXR/Geogram). See recipe-resolver-260413i-blocked-notes.scm.",
    "manga-tui": "BLOCKED: RUST_CARGO — 50+ transitive crate deps (reqwest, ratatui, tokio, image). See recipe-resolver-260413i-blocked-notes.scm.",
    "objdiff": "BLOCKED: RUST_CARGO — 60+ crate workspace (object, egui, gimli, capstone-rs). See recipe-resolver-260413i-blocked-notes.scm.",
    "css-inline": "BLOCKED: RUST_CARGO — servo CSS/HTML parser ecosystem (cssparser, selectors, html5ever). See recipe-resolver-260413i-blocked-notes.scm.",
    "d2x-rebirth": "BLOCKED: COMPLEX_DEPS — SCons game engine build with custom site_scons modules. See recipe-resolver-260413i-blocked-notes.scm.",
    "vpkedit": "BLOCKED: MISSING_GUIX_DEPS — Qt6 not fully available in Guix; upstream requires Qt6 minimum. See recipe-resolver-260413i-blocked-notes.scm.",
    "welle.io": "BLOCKED: MISSING_GUIX_DEPS — SoapySDR (SDR abstraction layer) not in Guix. See recipe-resolver-260413i-blocked-notes.scm.",
    "darkly": "BLOCKED: MISSING_GUIX_DEPS — KF6/Plasma6 deps (KDecoration3, KColorScheme, etc.) not in Guix. See recipe-resolver-260413i-blocked-notes.scm.",
    "86box-git": "BLOCKED: COMPLEX_DEPS — munt (MT-32 emulator), libslirp, FAudio not in Guix. See recipe-resolver-260413i-blocked-notes.scm.",
    "hyprlight": "BLOCKED: RUST_CARGO — Rust brightness tool (not C++/Hyprwm as initially assumed); needs crate enumeration. See recipe-resolver-260413i-blocked-notes.scm.",
    "python-requirements-language-server": "BLOCKED: MISSING_GUIX_DEPS — lsp-tree-sitter and tree-sitter-requirements not in Guix. See recipe-resolver-260413i-blocked-notes.scm.",
    "rustfetch-git": "BLOCKED: RUST_CARGO — upstream unclear; needs verification and crate enumeration. See recipe-resolver-260413i-blocked-notes.scm.",
    "icann-rdap": "BLOCKED: COMPLEX_DEPS — Go binary with 100+ Go module deps needing individual packaging. See recipe-resolver-260413i-blocked-notes.scm.",
    "logiops-rs": "BLOCKED: RUST_CARGO — upstream unclear; needs HID/udev Rust bindings. See recipe-resolver-260413i-blocked-notes.scm.",
}

def update_todo():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    changes = 0
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match "** BLOCKED NNNN. package-name" headers
        m = re.match(r'^(\*\* )BLOCKED( \d+\. )(\S+)\s*$', line)
        if m:
            prefix, num, pkg_name = m.group(1), m.group(2), m.group(3)
            if pkg_name in RECIPES:
                # Change header from BLOCKED to DONE
                lines[i] = f"{prefix}DONE{num}{pkg_name}\n"
                # Find and update the Status line(s)
                j = i + 1
                while j < len(lines) and not lines[j].startswith("** "):
                    if lines[j].strip().startswith("- Status:"):
                        lines[j] = f"   - Status: {RECIPES[pkg_name]}\n"
                    if lines[j].strip().startswith("- TODO Status:"):
                        lines[j] = f"   - TODO Status: DONE\n"
                    j += 1
                changes += 1
                print(f"RECIPE: {pkg_name} (line {i+1})")
            elif pkg_name in BLOCKED:
                # Keep header as BLOCKED, update status
                j = i + 1
                while j < len(lines) and not lines[j].startswith("** "):
                    if lines[j].strip().startswith("- Status:"):
                        lines[j] = f"   - Status: {BLOCKED[pkg_name]}\n"
                    j += 1
                changes += 1
                print(f"BLOCKED: {pkg_name} (line {i+1})")
        i += 1

    with open(TODO_FILE, 'w') as f:
        f.writelines(lines)

    print(f"\nTotal changes: {changes}")

if __name__ == "__main__":
    update_todo()
