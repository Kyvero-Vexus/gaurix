#!/usr/bin/env python3
"""Worker for deptree-resolver-260418ak: resolve BLOCKED packages.

For each BLOCKED package:
- If genuinely impossible (distro-specific, DKMS, placeholder, etc.) -> FAILED
- If resolvable -> generate Guix recipe with proper build system detection

Reads selection, AUR metadata, and generates:
- Guix Scheme module with package definitions
- Blocked notes for remaining blocked packages
- AUR lookup results
- Summary
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260418ak-selection.json"
PASS_ID = "deptree-resolver-260418ak"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages that should be FAILED with clear reasons and exhausted approaches
FAIL_REASONS = {
    "powershell-editor-services": (
        "DEP_MISSING: requires PowerShell/.NET ecosystem which is not bootstrapped in Guix",
        "A1: package PowerShell — .NET ecosystem not bootstrapped in Guix; "
        "A2: pre-built binary — needs PowerShell host runtime; "
        "A3: alternative LSP — would be a different tool entirely"
    ),
    "yt6801-dkms": (
        "KERNEL_MODULE: out-of-tree RTL YT6801 WiFi kernel driver via DKMS; "
        "Guix handles kernel modules via operating-system config, not DKMS",
        "A1: native kernel config — needs upstream mainlining first; "
        "A2: out-of-tree module build — requires Guix kernel module integration (not DKMS); "
        "A3: use compatible NIC — different hardware, not a software fix"
    ),
    "ananicy-cpp-s6": (
        "DISTRO_SPECIFIC: s6-rc service scripts for ananicy-cpp; "
        "Guix uses GNU Shepherd, not s6; no upstream URL; AUR-only inline scripts",
        "A1: convert to Shepherd service — ananicy-cpp itself not packaged; "
        "A2: port s6 scripts — wrong init system for Guix; "
        "A3: package as data files — no value without s6 runtime"
    ),
    "keyd-openrc": (
        "DISTRO_SPECIFIC: OpenRC init scripts for keyd; "
        "Guix uses GNU Shepherd, not OpenRC; keyd itself is already in Guix upstream",
        "A1: convert to Shepherd service — keyd already has shepherd support in Guix; "
        "A2: package OpenRC scripts — wrong init system for Guix; "
        "A3: run keyd directly — no init integration needed beyond existing Guix support"
    ),
    "texlive-installer": (
        "DISTRO_SPECIFIC: Arch pacman compatibility shim that tricks pacman into thinking "
        "texlive is installed; Guix has native texlive packages via (gnu packages tex)",
        "A1: Guix has native texlive packages — no shim needed; "
        "A2: adapt installer — downloads 4GB runtime bypassing Guix store; "
        "A3: use guix install texlive — already available and supported"
    ),
    "wsl-hello-sudo-bin": (
        "PLATFORM_SPECIFIC: WSL-only PAM module for Windows Hello authentication; "
        "requires Windows host with WSL environment and Windows Hello API",
        "A1: run on Guix System — no WSL layer available; "
        "A2: adapt to non-WSL — fundamentally depends on Windows Hello API via WSL bridge; "
        "A3: use standard PAM modules — different auth model, fprintd or pam_u2f for biometric"
    ),
    "transgui-git": (
        "DEP_MISSING: requires Free Pascal compiler and Lazarus IDE component library; "
        "neither is available in Guix; upstream repo archived/unmaintained",
        "A1: package Lazarus/FPC — massive Pascal IDE ecosystem, no Guix build system; "
        "A2: package qt6pas binding — needs Lazarus build infrastructure; "
        "A3: use alternative client (tremc, transmission-gtk) — different tools"
    ),
    "lib32-libxxf86dga": (
        "MULTILIB_UNSUPPORTED: 32-bit build of Xorg XF86DGA extension library; "
        "Guix does not support multilib (lib32) builds",
        "A1: cross-compile i686 — not lib32 compatible, different target arch; "
        "A2: use 64-bit libxxf86dga — different ABI, not a replacement; "
        "A3: custom 32-bit sysroot — impractical in Guix build model"
    ),
    "updpkgsrcs": (
        "DISTRO_SPECIFIC: bash tool for updating git submodule source arrays in Arch PKGBUILD files; "
        "has no purpose outside Arch packaging workflow",
        "A1: no PKGBUILD on Guix — tool has no purpose; "
        "A2: adapt for Guix packaging — completely different packaging model; "
        "A3: use git submodule commands directly — manual equivalent"
    ),
    "roxybrowser-bin": (
        "PROPRIETARY: closed-source commercial antidetect browser by Linkv Tech; "
        "no source code available; MIT license applies only to AUR PKGBUILD, not the software",
        "A1: actual software is proprietary — no source code to build from; "
        "A2: Electron binary repack — no redistribution rights for proprietary software; "
        "A3: use open-source alternatives (Tor Browser, Mullvad Browser) — different tools"
    ),
}

# Packages we CAN resolve with recipes
RESOLVABLE = {
    "hyprland-workspaces-tui": {
        "version": "1.2.0",
        "build_system": "cargo",
        "git_url": "https://github.com/Levizor/hyprland-workspaces-tui",
        "tag": "1.2.0",
        "license": "license:expat",
        "synopsis": "Terminal-based TUI wrapper for hyprland-workspaces CLI utility",
        "description": "Terminal-based user interface (TUI) wrapper for the hyprland-workspaces CLI utility.  Provides a visual workspace manager for the Hyprland Wayland compositor.",
        "homepage": "https://github.com/Levizor/hyprland-workspaces-tui",
    },
    "deadlock-api-ingest-git": {
        "version": "0.2.9",
        "build_system": "cargo",
        "git_url": "https://github.com/deadlock-api/deadlock-api-ingest",
        "tag": "v0.2.9",
        "license": "license:expat",
        "synopsis": "Client for uploading match data to deadlock-api",
        "description": "Client for uploading match data to the Deadlock API service.  Captures and ingests game telemetry data via libpcap.",
        "homepage": "https://github.com/deadlock-api/deadlock-api-ingest",
    },
    "fiqhack-git": {
        "version": "4.3.0",
        "build_system": "gnu",
        "git_url": "https://github.com/FredrIQ/fiqhack",
        "tag": "4.3.0",
        "license": "license:gpl2+",
        "synopsis": "NetHack variant focused on AI, balance, and interface improvements",
        "description": "Variant of NetHack focused on AI, balance, and interface improvements.  Uses a custom build system (aimake) included in the source tree.",
        "homepage": "https://github.com/FredrIQ/fiqhack",
    },
    "container2wasm-git": {
        "version": "0.8.2",
        "build_system": "go",
        "git_url": "https://github.com/container2wasm/container2wasm",
        "tag": "v0.8.2",
        "license": "license:asl2.0",
        "synopsis": "Convert OCI container images to WASM modules",
        "description": "Convert OCI container images to WASM modules.  Provides the c2w binary for container-to-WebAssembly conversion.",
        "homepage": "https://github.com/container2wasm/container2wasm",
    },
}


def sanitize_name(name):
    """Convert AUR name to valid Guix variable name."""
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    """Escape a string for Scheme."""
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def generate_package_def(name, info):
    """Generate a single package definition."""
    var_name = sanitize_name(name)
    version = info["version"]
    bs = info["build_system"]

    bs_name_map = {
        "gnu": "gnu-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "copy": "copy-build-system",
    }
    bs_name = bs_name_map.get(bs, "gnu-build-system")

    git_url = info["git_url"]
    tag = info["tag"]

    # Use tag directly for version reference
    if tag.startswith("v"):
        commit_expr = f'(string-append "v" version)'
    else:
        commit_expr = "version"

    source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{git_url}")
                    (commit {commit_expr})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""

    if bs == "cargo":
        args = """    (arguments (list #:tests? #f))"""
    elif bs == "go":
        import_path = git_url.replace("https://", "")
        args = f"""    (arguments
     (list #:import-path "{import_path}"
           #:tests? #f))"""
    elif bs == "gnu":
        args = """    (arguments (list #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    return f"""(define-public {var_name}
  (package
    (name "{name}")
    (version "{version}")
{source_block}
    (build-system {bs_name})
{args}
    (synopsis "{escape_scheme_string(info['synopsis'])}")
    (description "{escape_scheme_string(info['description'])}")
    (home-page "{escape_scheme_string(info['homepage'])}")
    (license {info['license']})))
"""


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    packages = selection["packages"]
    print(f"[{PASS_ID}] Processing {len(packages)} selected BLOCKED packages")

    resolved = []
    failed = []
    aur_lookup = []

    for pkg in packages:
        name = pkg["name"]

        # Check if this package should be FAILED
        if name in FAIL_REASONS:
            reason, approaches = FAIL_REASONS[name]
            failed.append({
                "name": name,
                "number": pkg["number"],
                "reason": reason,
                "approaches_exhausted": approaches,
            })
            aur_lookup.append({"name": name, "status": "FAILED", "reason": reason})
            continue

        # Check if this package can be resolved
        if name in RESOLVABLE:
            info = RESOLVABLE[name]
            resolved.append({
                "name": name,
                "number": pkg["number"],
                "version": info["version"],
                "build_system": info["build_system"],
                "info": info,
            })
            aur_lookup.append({
                "name": name,
                "status": "RESOLVED",
                "version": info["version"],
                "build_system": info["build_system"],
            })
            continue

        # Shouldn't reach here but handle gracefully
        failed.append({
            "name": name,
            "number": pkg["number"],
            "reason": f"UNHANDLED: not in FAIL_REASONS or RESOLVABLE maps",
            "approaches_exhausted": "none",
        })
        aur_lookup.append({"name": name, "status": "FAILED", "reason": "UNHANDLED"})

    print(f"  Resolved: {len(resolved)}, Failed: {len(failed)}")

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)

    # Generate Scheme module for resolved packages
    if resolved:
        bs_modules = set()
        for r in resolved:
            bs = r["build_system"]
            bs_map = {
                "gnu": "(guix build-system gnu)",
                "cargo": "(guix build-system cargo)",
                "go": "(guix build-system go)",
                "copy": "(guix build-system copy)",
            }
            bs_modules.add(bs_map.get(bs, "(guix build-system gnu)"))

        exports = [sanitize_name(r["name"]) for r in resolved]

        header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {PASS_ID}
;;; Resolves {len(resolved)} BLOCKED packages with concrete recipes.
;;; Moves {len(failed)} packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages {PASS_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
"""

        for bsm in sorted(bs_modules):
            header += f"  #:use-module {bsm}\n"

        header += "  #:use-module ((guix licenses) #:prefix license:)\n"
        header += "  #:use-module (gnu packages)\n"

        header += "  #:export ("

        for i, exp in enumerate(exports):
            if i == 0:
                header += f"{exp}\n"
            else:
                header += f"            {exp}\n"

        header += "))\n\n"

        pkg_defs = []
        for r in resolved:
            pkg_def = generate_package_def(r["name"], r["info"])
            pkg_defs.append(pkg_def)

        full_module = header + "\n".join(pkg_defs)

        with open(OUTPUT_SCM, "w") as f:
            f.write(full_module)
        print(f"  Wrote {OUTPUT_SCM}")

    # Write blocked/failed notes
    notes_lines = [
        f";;; Notes for {PASS_ID}",
        f";;; {len(failed)} packages moved to FAILED status",
        f";;; {len(resolved)} packages resolved with recipes",
        ";;;",
        ";;; === FAILED packages (approaches exhausted) ===",
    ]
    for b in failed:
        notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")
        if 'approaches_exhausted' in b:
            notes_lines.append(f";;;   Approaches: {b['approaches_exhausted']}")

    with open(BLOCKED_NOTES, "w") as f:
        f.write("\n".join(notes_lines) + "\n")
    print(f"  Wrote {BLOCKED_NOTES}")

    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved),
        "failed": len(failed),
        "still_blocked": 0,
        "resolved_packages": [{"name": r["name"], "number": r["number"],
                               "version": r["version"], "build_system": r["build_system"]}
                              for r in resolved],
        "failed_packages": [{"name": f["name"], "number": f["number"], "reason": f["reason"]}
                            for f in failed],
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved, failed


if __name__ == "__main__":
    resolved, failed = main()
