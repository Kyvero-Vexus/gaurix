#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for recipe-resolver-260413r pass.

Resolves 30 NEEDS_RECIPE_DESIGN packages:
  - 6 recipes created (DONE)
  - 24 re-blocked with concrete notes
"""

import tempfile
import os
import shutil

TODO_FILE = "todo_general_packages.org"

# Packages that got recipes (mark as DONE)
RESOLVED = {
    "keychron-q3-max-udev": "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413r.scm (keychron-q3-max-udev + keychron-link-udev, udev rules, 0BSD/public-domain, trivial-build-system)",
    "cutieascii": "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413r.scm (cutieascii-bin, Go binary, MIT, copy-build-system)",
    "energygraph": "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413r.scm (energygraph, C/make, MIT, gnu-build-system)",
    "d1x-rebirth": "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413r.scm (d1x-rebirth, C++/scons, LGPL-2.1+, gnu-build-system)",
    "mindustry-server-bin": "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413r.scm (mindustry-server-bin, Java JAR, GPL-3.0, copy-build-system)",
}

# Packages that stay BLOCKED with updated notes
BLOCKED = {
    "lib32-xrizer": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: 32-bit OpenVR-to-OpenXR translation; Guix lacks multilib/32-bit builds; all approaches exhausted (recipe-resolver-260413r)",
    "chromium-gost": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — INFEASIBLE_BUILD: full Chromium fork (~40GB build); all approaches exhausted (recipe-resolver-260413r)",
    "csharpier": "BLOCKED: NEEDS_RECIPE_DESIGN — DOTNET_UNSUPPORTED: .NET SDK/runtime not in Guix; needs .NET ecosystem bootstrapping (recipe-resolver-260413r)",
    "qt6-base-hifps": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — INFEASIBLE_BUILD: Qt6 full rebuild with high-FPS patches; all approaches exhausted (recipe-resolver-260413r)",
    "python-opentelemetry-exporter-zipkin-proto-http": "BLOCKED: NEEDS_RECIPE_DESIGN — OTEL_CHAIN_NEEDED: requires 15+ OpenTelemetry Python packages (api, sdk, proto, exporters); needs dedicated OTel pass (recipe-resolver-260413r)",
    "ccase": "BLOCKED: NEEDS_RECIPE_DESIGN — CARGO_DEPS_NEEDED: Rust CLI (github.com/rutrum/ccase, MIT); no binary releases for v0.5.1; needs cargo-inputs enumeration (~30 crates) (recipe-resolver-260413r)",
    "claude-agent-acp": "BLOCKED: NEEDS_RECIPE_DESIGN — NPM_COMPLEX: Node.js/npm package (github.com/zed-industries/claude-agent-acp); deep npm dependency tree; needs manual dep enumeration (recipe-resolver-260413r)",
    "lib32-zix": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: 32-bit zix library; Guix lacks multilib; all approaches exhausted (recipe-resolver-260413r)",
    "brother-mfc-l2710dw": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE: Brother commercial license + 32-bit binary blob; violates Guix FSDG (recipe-resolver-260413r)",
    "plasma-workspace-povd": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — INFEASIBLE_BUILD: KDE Plasma fork with 100+ package dep tree; all approaches exhausted (recipe-resolver-260413r)",
    "youtube-music-desktop": "BLOCKED: NEEDS_RECIPE_DESIGN — MISSING_GUIX_DEPS: depends on qtws-base (Qt Web Shell, not in Guix); needs qtws-base packaged first (recipe-resolver-260413r)",
    "oopz": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE + MISSING_GUIX_DEPS: proprietary license, private Gitea source, depends on electron39; all approaches exhausted (recipe-resolver-260413r)",
    "critique": "BLOCKED: NEEDS_RECIPE_DESIGN — MISSING_GUIX_DEPS: depends on Bun JS runtime (not in Guix); Bun is Zig+C++ project, Zig compiler not in Guix (recipe-resolver-260413r)",
    "ccusage": "BLOCKED: NEEDS_RECIPE_DESIGN — NPM_COMPLEX: Node.js/npm CLI (github.com/ryoppippi/ccusage); deep npm dependency tree; needs manual dep enumeration (recipe-resolver-260413r)",
    "brother-cups-wrapper-common": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE: Brother commercial license; depends on proprietary brother-lpr-drivers-common; violates Guix FSDG (recipe-resolver-260413r)",
    "linux-zen-versioned-headers-bin": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch Linux binary kernel headers metapackage; Guix uses own kernel build system (recipe-resolver-260413r)",
    "linux-zen-versioned-docs-bin": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: Arch Linux binary kernel docs metapackage; Guix uses own kernel build system (recipe-resolver-260413r)",
    "lib32-libtxc_dxtn": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED + OBSOLETE: 32-bit S3TC texture compression; modern Mesa includes S3TC natively; Guix lacks multilib (recipe-resolver-260413r)",
    "yabridgectl-wine10-git": "BLOCKED: NEEDS_RECIPE_DESIGN — WINE_BRIDGE_COMPLEX: VST bridge controller needing 6+ missing deps (bitsery, clap, function2, ghc-filesystem, tomlplusplus) + Wine integration (recipe-resolver-260413r)",
    "lib32-libudev0-shim": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: 32-bit libudev0 compat shim; Guix lacks multilib; all approaches exhausted (recipe-resolver-260413r)",
    "sonic-win": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_SPECIFIC: Windows-only build of Sonic Visualiser; no utility on Linux/Guix (recipe-resolver-260413r)",
    "nvidia-utils-beta": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_LICENSE: NVIDIA proprietary driver utils; violates Guix FSDG; use Nonguix channel or Nouveau (recipe-resolver-260413r)",
    "python-opentelemetry-exporter-otlp-proto-common": "BLOCKED: NEEDS_RECIPE_DESIGN — OTEL_CHAIN_NEEDED: requires 15+ OpenTelemetry Python packages; same chain as zipkin exporter; needs dedicated OTel pass (recipe-resolver-260413r)",
    "mkinitcpio-sd-numlock": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ARCH_SPECIFIC: mkinitcpio/systemd hook; Guix uses Shepherd + own boot system; not applicable (recipe-resolver-260413r)",
    "lib32-l-smash": "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: 32-bit L-SMASH library; Guix lacks multilib; all approaches exhausted (recipe-resolver-260413r)",
    "ttime-bin": "BLOCKED: NEEDS_RECIPE_DESIGN — PYTHON_DEPS_NEEDED: missing python-pyfiglet + python-playsound3 in Guix; A1: package deps first (pyfiglet feasible, playsound3 has audio backend complexity); A2: skip audio — loses notifications (recipe-resolver-260413r)",
}


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    changes = 0

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Check for RESOLVED packages: look for "** BLOCKED NNNN. pkgname" patterns
        for pkg, new_status in RESOLVED.items():
            if f". {pkg}" in stripped and stripped.startswith("** BLOCKED"):
                # Change BLOCKED to DONE
                lines[i] = line.replace("** BLOCKED", "** DONE")
                # Add status line after package header
                # Find the next line that has "Status:" and add our new status
                j = i + 1
                while j < len(lines) and not lines[j].strip().startswith("**"):
                    j += 1
                # Insert status just before next entry
                insert_idx = j
                lines.insert(insert_idx, f"   - Status: {new_status}\n")
                changes += 1
                break

        # Check for BLOCKED packages: add updated status note
        for pkg, new_status in BLOCKED.items():
            if f". {pkg}" in stripped and stripped.startswith("** BLOCKED"):
                # Find end of this entry (next ** line)
                j = i + 1
                while j < len(lines) and not lines[j].strip().startswith("**"):
                    j += 1
                # Insert new status line before next entry
                insert_idx = j
                lines.insert(insert_idx, f"   - Status: {new_status}\n")
                changes += 1
                # Only update first occurrence
                del BLOCKED[pkg]
                break

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE) or ".")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp, TODO_FILE)
        print(f"Updated {TODO_FILE}: {changes} status changes")
    except:
        os.unlink(tmp)
        raise


if __name__ == "__main__":
    main()
