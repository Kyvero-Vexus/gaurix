#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260408j pass.

Resolves 30 NEEDS_RECIPE_DESIGN packages:
- 5 new binary recipes
- 2 compat aliases
- 23 re-evaluated with specific blocking reasons
"""

import re
import sys
import shutil
import tempfile
import os

TODO_FILE = "todo_general_packages.org"

# Package updates: (pkg_number, pkg_name, new_status_line, new_todo_status)
# For DONE packages (binary recipes + compat aliases):
DONE_UPDATES = [
    (3822, "wootility",
     "   - Status: DONE: recipe in recipe-resolver-260408j.scm (wootility-appimage, copy-build-system AppImage v5.2.5; compat alias wootility in general-compat.scm)"),
    (3831, "muse-sounds-manager-bin",
     "   - Status: DONE: recipe in recipe-resolver-260408j.scm (muse-sounds-manager-bin, copy-build-system prebuilt v2.1.1.912; compat alias muse-sounds-manager in general-compat.scm)"),
    (3816, "java-openjdk-ea-bin",
     "   - Status: DONE: recipe in recipe-resolver-260408j.scm (java-openjdk-ea-bin, copy-build-system prebuilt JDK v27b14; compat alias java-openjdk-ea in general-compat.scm)"),
    (3845, "auto-throttle",
     "   - Status: DONE: recipe in recipe-resolver-260408j.scm (auto-throttle, copy-build-system shell script v1.0.4 from GitHub)"),
    (3782, "swiftly-bin",
     "   - Status: DONE: recipe in recipe-resolver-260408j.scm (swiftly-bin, copy-build-system prebuilt v1.1.1 from download.swift.org; compat alias swiftly in general-compat.scm)"),
    (3861, "trayer",
     "   - Status: DONE: compat alias in recipe-resolver-260408j.scm (trayer -> trayer-srg from Guix upstream v1.1.8)"),
    (3850, "nnn-nerd",
     "   - Status: DONE: compat alias in recipe-resolver-260408j.scm (nnn-nerd -> nnn from Guix upstream v5.1; note: O_NERD=1 flag not applied, standard nnn build)"),
]

# For BLOCKED packages (re-evaluated with specific blocking reasons):
BLOCKED_UPDATES = [
    (3778, "ab-download-manager",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Gradle + Java 21 + Compose Desktop (Kotlin/JVM) build; requires complete JVM/Gradle toolchain not available in Guix batch. See blocked-notes."),
    (3838, "tex-fmt",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Rust/Cargo requiring full cargo-inputs enumeration (100+ transitive crates). See blocked-notes."),
    (3860, "netrc",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Go build requiring go-inputs enumeration for vendored modules. See blocked-notes."),
    (3844, "faugus-launcher-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Python/Meson with 10+ Python deps not in Guix (python-vdf, python-filelock, icoextract, libayatana-appindicator). See blocked-notes."),
    (3847, "gksu",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; depends on libgksu (not in Guix); project deprecated since 2012, last release 2017. See blocked-notes."),
    (3829, "orchids-bin",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; binary distributed as .pacman from obscure Supabase CDN, non-standard archive format, unstable URL. See blocked-notes."),
    (3820, "nucleus-cli",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Go build with VCS source (git), needs go-inputs enumeration; rolling release (r0.0.0). See blocked-notes."),
    (3779, "nanocoder",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; npm package from registry.npmjs.org, requires Node.js ecosystem packaging not feasible in batch. See blocked-notes."),
    (3824, "wasistlos",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; CMake C++ with webkit2gtk + libayatana-appindicator + gst-plugins, multiple deps not in Guix. See blocked-notes."),
    (3771, "rip-cli",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Rust/Cargo from crates.io, requires full cargo-inputs enumeration for transitive deps. See blocked-notes."),
    (3777, "brow6el-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; requires Chromium Embedded Framework (CEF) download (300MB+), complex cmake/make build, libsixel integration. See blocked-notes."),
    (3832, "raze",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; C++ CMake game engine (Build-engine source port) with 40+ makedeps including ZMusic, ZVulkan, webp; extremely complex build. See blocked-notes."),
    (3833, "uzdoom-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; C++ CMake Doom engine fork with git submodules and heavy dependency chain similar to GZDoom. See blocked-notes."),
    (3854, "dae",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Go + eBPF + clang build requiring kernel headers, BPF toolchain, and v2ray geodata deps not in Guix. See blocked-notes."),
    (3859, "vintagestory-unstable",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; requires dotnet-runtime-10.0 not available in Guix; .NET game with custom license. See blocked-notes."),
    (3855, "momw-tools-pack",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; metapackage depending on 8+ packages (delta-plugin, umo, momw-configurator, tes3cmd, etc.) all missing from Guix. See blocked-notes."),
    (3856, "vrms-arch-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; depends on pyalpm (Arch Linux pacman bindings), Arch-specific tool with no utility on Guix. See blocked-notes."),
    (3843, "godot-mono-git",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Godot engine + Mono/.NET integration, extremely complex build requiring SCons + .NET SDK + Mono runtime. See blocked-notes."),
    (3840, "zalo-macos",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; macOS-specific application (Vietnamese messaging), no Linux build available. See blocked-notes."),
    (3841, "deezer",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; source is Windows .exe installer, requires Electron rebuild from scratch; no official Linux binary. See blocked-notes."),
    (3807, "tuxedo-control-center-bin",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; RPM binary depends on tuxedo-drivers-dkms (DKMS kernel module incompatible with Guix). See blocked-notes."),
    (3792, "ynote-desktop-bin",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; Chinese cloud notes app requires electron22 (specific old Electron version), proprietary license, .deb repack. See blocked-notes."),
    (3857, "spflashtool-bin",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260408j; prebuilt binary with unknown license, requires Qt5 (serialport, xmlpatterns), download URL needs Referer header workaround. See blocked-notes."),
]

def update_todo_file():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    all_updates = [(num, name, status, "DONE") for num, name, status in DONE_UPDATES] + \
                  [(num, name, status, "BLOCKED") for num, name, status in BLOCKED_UPDATES]

    changes_made = 0

    for pkg_num, pkg_name, new_status, new_todo_status in all_updates:
        # Find the heading line for this package
        heading_pattern = re.compile(rf'^\*\* (BLOCKED|DONE) {pkg_num}\. {re.escape(pkg_name)}\b')
        found = False

        for i, line in enumerate(lines):
            if heading_pattern.match(line.rstrip()):
                found = True
                # Update heading to new status
                old_heading = lines[i].rstrip()
                new_heading = re.sub(r'^\*\* (BLOCKED|DONE)', f'** {new_todo_status}', old_heading)
                lines[i] = new_heading + '\n'

                # Find and update TODO Status line
                for j in range(i+1, min(i+15, len(lines))):
                    if lines[j].strip().startswith('- TODO Status:'):
                        lines[j] = f'   - TODO Status: {new_todo_status}\n'
                        break
                    if lines[j].startswith('** '):
                        break

                # Insert new status line after the last Status line
                insert_pos = i + 1
                for j in range(i+1, min(i+15, len(lines))):
                    if lines[j].strip().startswith('- Status:'):
                        insert_pos = j + 1
                    if lines[j].startswith('** ') or lines[j].strip().startswith('- TODO Status:'):
                        break

                lines.insert(insert_pos, new_status + '\n')
                changes_made += 1
                print(f"  Updated #{pkg_num} {pkg_name} -> {new_todo_status}")
                break

        if not found:
            print(f"  WARNING: Could not find heading for #{pkg_num} {pkg_name}", file=sys.stderr)

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"\nTotal changes: {changes_made}/30")
    return changes_made

if __name__ == '__main__':
    update_todo_file()
