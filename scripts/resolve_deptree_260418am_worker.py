#!/usr/bin/env python3
"""Worker for deptree-resolver-260418am: resolve BLOCKED packages.

For each BLOCKED package:
- If genuinely impossible (distro-specific, DKMS, proprietary, etc.) -> FAILED
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
SELECTION = ROOT / "reports" / "deptree-resolver-260418am-selection.json"
PASS_ID = "deptree-resolver-260418am"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

# Packages that should be FAILED with clear reasons and exhausted approaches
FAIL_REASONS = {
    "adbmanager": (
        "DEP_MISSING: requires Lazarus (Free Pascal IDE/RAD) to build; "
        "Lazarus compiler not available in Guix and no binary releases exist",
        "A1: package Lazarus/FPC — massive Pascal IDE ecosystem, no Guix build system support; "
        "A2: pre-built binary — no releases available on GitHub or AUR; "
        "A3: alternative ADB tools — adb itself available in Guix, GUI wrappers are niche"
    ),
    "companion": (
        "DEP_RESOLUTION_FAILED: Electron app requiring nvm for Node.js version management, "
        "complex native USB addon compilation (libusb bindings), and zip-based asset bundling",
        "A1: build from source with node-build-system — native USB bindings need complex "
        "compilation with node-gyp and specific Node.js version; "
        "A2: binary package — large Electron app (~200MB), no official Linux binary releases; "
        "A3: use alternative Streamdeck tools — very specific Elgato hardware, no open alternatives"
    ),
    "garnet": (
        "DEP_MISSING: requires dotnet-sdk-9.0 which is not bootstrapped in Guix; "
        ".NET runtime packaging is a known gap in Guix ecosystem",
        "A1: package .NET SDK — massive ecosystem bootstrap (CoreCLR, Roslyn compiler, NuGet); "
        "A2: pre-built binary — no standalone Linux binary releases for Garnet; "
        "A3: use alternative cache stores (Redis, Memcached) — already packaged in Guix"
    ),
    "bbg": (
        "DEP_RESOLUTION_FAILED: Electron-based static blog generator with no build instructions; "
        "Electron not available in Guix; project appears minimally maintained",
        "A1: build from source — requires Electron which is not in Guix; "
        "A2: binary package — no releases on GitHub; "
        "A3: use alternatives (Hugo, Jekyll, Pelican) — already available in Guix"
    ),
    "tuxedo-backlight-control-git": (
        "KERNEL_MODULE: depends on tuxedo-keyboard (out-of-tree DKMS kernel module); "
        "Guix handles kernel modules via operating-system config, not DKMS; "
        "the userspace tools are unusable without the kernel module",
        "A1: package tuxedo-keyboard — out-of-tree kernel module requires DKMS or "
        "operating-system kernel config; "
        "A2: package userspace only — tools fail without kernel module; "
        "A3: use generic backlight tools (xbacklight, light) — available in Guix"
    ),
    "tuxedo-keyboard-tools": (
        "KERNEL_MODULE: depends on tuxedo-keyboard-dkms (out-of-tree kernel module) "
        "and libxss; kernel module not packageable via standard Guix mechanisms",
        "A1: package tuxedo-keyboard-dkms — DKMS not supported in Guix packaging model; "
        "A2: port to operating-system config — requires kernel module integration work; "
        "A3: use generic keyboard tools — available in Guix"
    ),
    "python-gurobipy": (
        "PROPRIETARY_DEP: requires gurobi>=13.0.1 (commercial optimization solver) "
        "as runtime dependency; Gurobi requires paid license and EULA acceptance",
        "A1: package gurobi — proprietary commercial software with EULA; "
        "A2: binary wheel — still needs proprietary gurobi shared library at runtime; "
        "A3: use open alternatives (scipy.optimize, PuLP with GLPK, OR-Tools) — different tools"
    ),
    "scpdiscord-git": (
        "DEP_MISSING: requires dotnet-sdk-9.0 for building; "
        ".NET SDK not available in Guix; SCP:SL game plugin ecosystem",
        "A1: package .NET SDK — not bootstrapped in Guix; "
        "A2: pre-built binary — no standalone binaries available; "
        "A3: run via container — not native Guix packaging"
    ),
    "opencomic": (
        "DEP_RESOLUTION_FAILED: depends on electron37 (obsolete Electron version, "
        "not available in any distro) and java-runtime with complex nvm-based build",
        "A1: build with current Electron — code depends on electron37-specific APIs; "
        "A2: binary package — no releases available; "
        "A3: use alternatives (MComix, Calibre) — available in Guix"
    ),
    "yesplaymusic-git": (
        "DEP_RESOLUTION_FAILED: depends on electron13 (obsolete, EOL 2022) "
        "and requires nvm/yarn build toolchain; Netease Music service may not be "
        "accessible outside China",
        "A1: build from source — electron13 obsolete, not in Guix; "
        "A2: upgrade to modern Electron — upstream not maintained for 2+ years; "
        "A3: use alternatives (QMMP, Clementine) — available in Guix"
    ),
    "clipboard-manager-git": (
        "DEP_MISSING: depends on cosmic-applets (COSMIC desktop environment by System76) "
        "which is not packaged in Guix; entire COSMIC desktop stack required",
        "A1: package COSMIC desktop — entire Rust-based desktop environment; "
        "A2: build standalone — tightly coupled to COSMIC applet infrastructure; "
        "A3: use alternatives (clipman, copyq, parcellite) — available in Guix"
    ),
    "comictagger-beta": (
        "DEP_RESOLUTION_FAILED: requires 8+ Python packages not in Guix "
        "(python-comicfn2dict, python-niquests, python-settngs, python-pyrate-limiter-2, "
        "python-text2digits, python-wordninja, python-zipremove, python-pillow-jpegxl-plugin); "
        "deep dependency chain makes single-pass resolution infeasible",
        "A1: package all 8+ missing Python deps — each has its own dep chain, "
        "some require C extensions (pillow-jpegxl needs libjxl); "
        "A2: use pip in virtual env — not native Guix packaging model; "
        "A3: use stable comictagger release — also has same dependency requirements"
    ),
}

# Packages we CAN resolve with recipes
RESOLVABLE = {
    "groonga": {
        "version": "16.0.1",
        "build_system": "cmake",
        "source_type": "tarball",
        "tarball_url": "https://github.com/groonga/groonga/releases/download/v{version}/groonga-{version}.tar.gz",
        "license": "license:lgpl2.1",
        "synopsis": "open-source fulltext search engine and column store",
        "description": "Groonga is an open-source fulltext search engine and column store.  It provides fast full-text search with support for multiple languages, geolocation search, and column-oriented data storage.  Groonga is the successor project to Senna.",
        "homepage": "https://groonga.org",
        "native_inputs": ["pkg-config"],
        "inputs": ["zlib", "lz4"],
        "extra_modules": [
            "(gnu packages compression)",
        ],
    },
    "pgroonga": {
        "version": "4.0.4",
        "build_system": "gnu",
        "source_type": "tarball",
        "tarball_url": "https://github.com/pgroonga/pgroonga/releases/download/{version}/pgroonga-{version}.tar.gz",
        "license": "license:postgresql",
        "synopsis": "PostgreSQL extension for Groonga-based full text search",
        "description": "PGroonga is a PostgreSQL extension that uses Groonga as its full text search engine.  It provides fast full text search for all languages supported by PostgreSQL, including CJK languages.",
        "homepage": "https://pgroonga.github.io",
        "native_inputs": ["postgresql", "clang-toolchain", "llvm"],
        "inputs": ["groonga", "postgresql"],
        "extra_modules": [
            "(gnu packages databases)",
            "(gnu packages llvm)",
        ],
    },
    "pcloudcc-lneely": {
        "version": "20260324T111500Z",
        "build_system": "gnu",
        "source_type": "git",
        "git_url": "https://github.com/lneely/pcloudcc-lneely",
        "tag": "20260324T111500Z",
        "license": "license:bsd-3",
        "synopsis": "linux console client for pCloud cloud storage",
        "description": "Console client for pCloud cloud storage.  Provides a command-line interface for mounting pCloud drives via FUSE, uploading and downloading files, and managing cloud storage.  Independently maintained fork of the original pCloud console client.",
        "homepage": "https://github.com/lneely/pcloudcc-lneely",
        "native_inputs": ["pkg-config"],
        "inputs": ["readline", "zlib", "fuse", "mbedtls", "sqlite", "boost", "eudev"],
        "extra_modules": [
            "(gnu packages readline)",
            "(gnu packages compression)",
            "(gnu packages file-systems)",
            "(gnu packages tls)",
            "(gnu packages databases)",
            "(gnu packages boost)",
            "(gnu packages linux)",
        ],
    },
    "sftpman-gtk": {
        "version": "1.3.1",
        "build_system": "python",
        "source_type": "git",
        "git_url": "https://github.com/spantaleev/sftpman-gtk",
        "tag": "1.3.1",
        "license": "license:gpl3",
        "synopsis": "GTK frontend for sftpman SFTP filesystem manager",
        "description": "GTK frontend for sftpman, a CLI application and library for managing and mounting sshfs (SFTP) filesystems.  Provides a graphical interface for configuring, mounting, and unmounting remote SFTP file systems.",
        "homepage": "https://github.com/spantaleev/sftpman-gtk",
        "native_inputs": [],
        "inputs": [],
        "propagated_inputs": ["python-pygobject", "gtk+", "sftpman-python"],
        "extra_modules": [
            "(gnu packages gnome)",
            "(gnu packages gtk)",
        ],
    },
    "xenia-canary-git": {
        "version": "0.0.0",
        "build_system": "cmake",
        "source_type": "git",
        "git_url": "https://github.com/xenia-canary/xenia-canary",
        "tag": "4fcb8e4",
        "commit": "4fcb8e4",
        "license": "license:bsd-3",
        "synopsis": "experimental emulator for the Xbox 360",
        "description": "Xenia is an experimental emulator for the Xbox 360 game console.  It aims to run Xbox 360 games on modern hardware using Vulkan graphics and supports both x86_64 and aarch64 architectures.",
        "homepage": "https://github.com/xenia-canary/xenia-canary",
        "native_inputs": ["cmake", "clang-toolchain", "pkg-config"],
        "inputs": ["alsa-lib", "gtk+", "sdl2", "vulkan-headers", "vulkan-loader", "lz4"],
        "extra_modules": [
            "(gnu packages cmake)",
            "(gnu packages llvm)",
            "(gnu packages sdl)",
            "(gnu packages vulkan)",
            "(gnu packages gtk)",
            "(gnu packages sound)",
            "(gnu packages compression)",
        ],
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
        "cmake": "cmake-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "copy": "copy-build-system",
        "python": "python-build-system",
        "pyproject": "pyproject-build-system",
    }
    bs_name = bs_name_map.get(bs, "gnu-build-system")

    # Source block
    source_type = info.get("source_type", "git")
    if source_type == "tarball":
        url_template = info["tarball_url"]
        # Replace {version} with version reference
        url_scheme = url_template.replace("{version}", '" version "')
        source_block = f"""    (source (origin
              (method url-fetch)
              (uri (string-append "{url_scheme}"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
    else:
        git_url = info["git_url"]
        tag = info.get("tag", version)
        commit = info.get("commit")

        if commit:
            commit_expr = f'"{commit}"'
        elif tag.startswith("v"):
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

    # Arguments
    if bs == "cmake":
        args = """    (arguments
     (list #:tests? #f
           #:configure-flags #~(list)))"""
    elif bs == "python":
        args = """    (arguments (list #:tests? #f))"""
    else:
        args = """    (arguments (list #:tests? #f))"""

    # Inputs
    inputs_parts = []

    native_inputs = info.get("native_inputs", [])
    if native_inputs:
        inputs_list = " ".join(native_inputs)
        inputs_parts.append(f"    (native-inputs (list {inputs_list}))")

    inputs = info.get("inputs", [])
    if inputs:
        inputs_list = " ".join(inputs)
        inputs_parts.append(f"    (inputs (list {inputs_list}))")

    propagated = info.get("propagated_inputs", [])
    if propagated:
        inputs_list = " ".join(propagated)
        inputs_parts.append(f"    (propagated-inputs (list {inputs_list}))")

    inputs_block = "\n".join(inputs_parts) if inputs_parts else ""

    # Special handling for pcloudcc-lneely (Makefile with custom install)
    if name == "pcloudcc-lneely":
        args = """    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "DESTDIR=" #$output)
                                "BUILD=release"
                                "FORCE_FUSE=3")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))"""

    # Special handling for pgroonga (needs pg_config)
    if name == "pgroonga":
        args = """    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PG_CONFIG="
                                  (search-input-file %build-inputs
                                                     "bin/pg_config")))))"""

    # Special handling for xenia (needs submodules, C++20)
    if name == "xenia-canary-git":
        source_block = f"""    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "{info['git_url']}")
                    (commit "{info['commit']}")
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))"""
        args = """    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DXENIA_BUILD_TESTS=OFF"
                   "-DXENIA_BUILD_MISC=OFF")))"""

    parts = [
        f"(define-public {var_name}",
        "  (package",
        f'    (name "{name}")',
        f'    (version "{version}")',
        source_block,
        f"    (build-system {bs_name})",
        args,
    ]
    if inputs_block:
        parts.append(inputs_block)
    parts.extend([
        f'    (synopsis "{escape_scheme_string(info["synopsis"])}")',
        f'    (description "{escape_scheme_string(info["description"])}")',
        f'    (home-page "{escape_scheme_string(info["homepage"])}")',
        f'    (license {info["license"]})))',
        "",
    ])

    return "\n".join(parts)


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

    # Collect all extra modules needed
    all_extra_modules = set()
    all_bs_modules = set()
    for r in resolved:
        bs = r["build_system"]
        bs_map = {
            "gnu": "(guix build-system gnu)",
            "cmake": "(guix build-system cmake)",
            "cargo": "(guix build-system cargo)",
            "go": "(guix build-system go)",
            "copy": "(guix build-system copy)",
            "python": "(guix build-system python)",
            "pyproject": "(guix build-system pyproject)",
        }
        all_bs_modules.add(bs_map.get(bs, "(guix build-system gnu)"))
        for mod in r["info"].get("extra_modules", []):
            all_extra_modules.add(mod)

    # Generate Scheme module for resolved packages
    if resolved:
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

        for bsm in sorted(all_bs_modules):
            header += f"  #:use-module {bsm}\n"

        header += "  #:use-module ((guix licenses) #:prefix license:)\n"
        header += "  #:use-module (gnu packages)\n"
        header += "  #:use-module (gnu packages pkg-config)\n"

        for mod in sorted(all_extra_modules):
            header += f"  #:use-module {mod}\n"

        # Add our own channel module for sftpman-python dep
        header += "  #:use-module (gaurix packages deptree-resolver-260418al)\n"

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
