#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260415n pass.
Deterministic: read, compute, write temp, atomic move."""

import re
import os
import tempfile

TODO_FILE = "todo_general_packages.org"
PASS_ID = "recipe-resolver-260415n"

# Packages resolved with new recipes (6)
RESOLVED = {
    11422: ("rustconn", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (rustconn-bin v0.10.19, GTK4 connection manager AppImage, GPL-3.0+)"),
    1791: ("uzdoom", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (uzdoom-bin v4.14.3, GZDoom fork AppImage, GPL-3.0+)"),
    15619: ("polymc-qt5-git", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (polymc-bin v7.0, Minecraft launcher portable binary, GPL-3.0)"),
    11043: ("slippi-mainline", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (slippi-mainline-bin v4.0.0-mainline-beta.14, Dolphin fork AppImage, GPL-2.0+)"),
    11777: ("libretro-azahar-git", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (libretro-azahar-core-bin v2125.1, 3DS libretro core prebuilt, GPL-2.0+)"),
    10226: ("osrm-backend", f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm (osrm-backend v6.0.0, CMake source build, BSD-2-Clause)"),
}

# Already packaged in Guix upstream (2)
ALREADY_PACKAGED = {
    7758: ("audacious-plugins-gtk3", f"DONE: NEEDS_RECIPE_DESIGN resolved — ALREADY_IN_GUIX: Guix audacious 4.4.2 already bundles all plugins with GTK support; compat alias ({PASS_ID})"),
    6770: ("godot32", f"DONE: NEEDS_RECIPE_DESIGN resolved — ALREADY_IN_GUIX: Guix has godot 4.4 for native arch; 32-bit is system-specific, not a separate package ({PASS_ID})"),
}

# Exhausted with detailed reasons (22)
EXHAUSTED = {
    6771: ("zoneminder-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — COMPLEX_DEPS: ~12 missing Perl modules + PHP stack + gsoap + libvncserver; A1: package 12+ Perl deps — massive scope; A2: PHP-FPM integration not in Guix; A3: Docker deployment recommended ({PASS_ID})"),
    7285: ("artemisrgb-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NON_FREE_LICENSE: PolyForm Noncommercial 1.0.0; A1: prohibits commercial use — violates FSDG; A2: no FOSS alternative with same HW support; A3: OpenRGB (MIT) covers similar use case ({PASS_ID})"),
    7753: ("canon-pixma-g6000-complete", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_DRIVER: Canon binary blobs from .deb; A1: license prohibits redistribution; A2: requires lib32 compat; A3: use SANE/gutenprint generic driver ({PASS_ID})"),
    10971: ("soh", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_LICENSE: Ship of Harkinian has no license file, reverse-engineered Nintendo code; A1: no license = all rights reserved; A2: Nintendo IP concerns; A3: cannot be distributed ({PASS_ID})"),
    10972: ("soh-otr-exporter", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEP_BLOCKED: depends on soh which has no license; A1: same repo, same legal issues; A2: useless without soh; A3: blocked by soh ({PASS_ID})"),
    10989: ("meowpad-configurator-v2-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — TAURI_UNSUPPORTED: Tauri framework not in Guix; A1: requires cargo-tauri + pnpm + webkit2gtk pipeline; A2: no binary releases; A3: niche HW configurator (2 AUR votes) ({PASS_ID})"),
    10763: ("nih-plug-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NIGHTLY_RUST_REQUIRED: requires cargo-nightly for abi_thiscall/portable_simd; A1: Guix ships stable Rust only; A2: no stable equivalents for nightly features; A3: no tagged releases ({PASS_ID})"),
    11090: ("sparrow-wifi-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — UNMAINTAINED: out-of-date in AUR, last update 2023; A1: missing python-pyqt5-chart + python-gps3 + python-manuf; A2: no tagged releases; A3: upstream inactive ({PASS_ID})"),
    11580: ("howdy-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PAM_INTEGRATION_COMPLEX: facial auth PAM module; A1: deep PAM/polkit integration incompatible with Guix functional model; A2: python-opencv bindings unverified; A3: IR camera hardware testing infeasible ({PASS_ID})"),
    7960: ("graphite-editor-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — WASM_TOOLCHAIN_MISSING: Rust + npm + wasm-pack build; A1: wasm-pack not in Guix; A2: Rust-to-WASM target not supported; A3: no versioned releases ({PASS_ID})"),
    10055: ("cynthiune.app", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — GNUSTEP_RUNTIME_MISSING: needs gnustep-base/gui/back; A1: only gnustep-make in Guix; A2: project abandoned (orphaned in AUR); A3: libao also missing ({PASS_ID})"),
    3733: ("wiso-steuer-2026", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_SOFTWARE: commercial German tax software by Buhl; A1: proprietary license; A2: no source code; A3: cannot be in free software channel ({PASS_ID})"),
    3814: ("playdate-sdk", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_SDK: Panic Playdate console SDK; A1: LicenseRef-SdkLicense not free; A2: SDK binaries proprietary; A3: hardware-specific tooling ({PASS_ID})"),
    7786: ("misans", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — NON_FREE_FONT: Xiaomi MiSans custom license; A1: restricts redistribution; A2: font files proprietary; A3: use Noto Sans as free alternative ({PASS_ID})"),
    7026: ("python-tensorrt", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_NVIDIA: TensorRT requires proprietary license; A1: LicenseRef-TensorRT not free; A2: requires CUDA stack; A3: no FOSS alternative ({PASS_ID})"),
    4652: ("classisland", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — WINDOWS_ONLY: .NET WPF Windows-only classroom display app; A1: WPF is Windows-exclusive; A2: no Linux port; A3: .NET SDK not in Guix ({PASS_ID})"),
    4602: ("ollama-rocm-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEP_CHAIN_NEEDED: ROCm variant needs base ollama first; A1: ollama requires Go + CGo + llama.cpp build; A2: ROCm toolchain in Guix but integration complex; A3: prebuilt binary needs ollama-bin first ({PASS_ID})"),
    11484: ("mangowm-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — UNTESTED_BUILD: wlroots 0.19 + scenefx 0.4 now in Guix; A1: meson build feasible but version pinning fragile; A2: low adoption (3 AUR votes); A3: no stable release process ({PASS_ID})"),
    7015: ("qmc2", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — BUILD_SYSTEM_CUSTOM: qmake + custom Makefile hybrid; A1: needs Makefile patching for Guix; A2: no Linux binaries; A3: MAME not in Guix (retroarch alternative) ({PASS_ID})"),
    7038: ("kretro", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — EARLY_PROJECT: v0.0.1 with no binary releases; A1: API/ABI will change; A2: requires full KDE6/Qt6 framework; A3: too immature for stable packaging ({PASS_ID})"),
    7270: ("libretro-lrps2-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEP_MISSING: needs rapidyaml not in Guix; A1: rapidyaml packaging required first; A2: git-only with no tagged releases; A3: large C++ PS2 emulation codebase ({PASS_ID})"),
    10993: ("sdrpp-brown-git", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — SDR_LIBS_MISSING: needs airspy/airspyhf/bladerf/hackrf/limesuite/soapysdr; A1: ~6 SDR hardware libraries need packaging; A2: rolling release model; A3: original SDR++ better first candidate ({PASS_ID})"),
}

# Read file
with open(TODO_FILE, 'r') as f:
    lines = f.readlines()

# All updates: combine dicts
all_updates = {}
for pkg_num, (name, status) in RESOLVED.items():
    all_updates[pkg_num] = (name, status)
for pkg_num, (name, status) in ALREADY_PACKAGED.items():
    all_updates[pkg_num] = (name, status)
for pkg_num, (name, status) in EXHAUSTED.items():
    all_updates[pkg_num] = (name, status)

# Build index: find the line range for each package entry
# Entries start with ** and end at the next **
entry_starts = {}
for i, line in enumerate(lines):
    m = re.match(r'^\*\* (?:BLOCKED|TODO|DONE|FAILED) (\d+)\. ', line)
    if m:
        pkg_num = int(m.group(1))
        entry_starts[pkg_num] = i

# For each package to update, find the right insertion point
# (after the last Status line in the entry)
insertions = []  # (line_number, text_to_insert)

for pkg_num, (name, status_text) in all_updates.items():
    if pkg_num not in entry_starts:
        print(f"WARNING: package #{pkg_num} ({name}) not found in todo file")
        continue

    start = entry_starts[pkg_num]
    # Find the end of this entry (next ** line or EOF)
    end = len(lines)
    for j in range(start + 1, min(start + 30, len(lines))):
        if lines[j].startswith('** '):
            end = j
            break

    # Find the last Status line in the entry
    last_status_line = start
    for j in range(start, end):
        if '- Status:' in lines[j] or 'Status:' in lines[j]:
            last_status_line = j

    # Insert after the last status line
    insert_line = f"   - Status: {status_text}\n"
    insertions.append((last_status_line + 1, insert_line))

# Sort insertions by line number in reverse order (to preserve line numbers)
insertions.sort(key=lambda x: x[0], reverse=True)

# Apply insertions
for line_num, text in insertions:
    lines.insert(line_num, text)

# Write to temp file and atomically move
fd, tmp_path = tempfile.mkstemp(dir='.', suffix='.org')
with os.fdopen(fd, 'w') as f:
    f.writelines(lines)
os.replace(tmp_path, TODO_FILE)

print(f"Updated {len(insertions)} entries in {TODO_FILE}")
print(f"  Resolved: {len(RESOLVED)}")
print(f"  Already packaged: {len(ALREADY_PACKAGED)}")
print(f"  Exhausted: {len(EXHAUSTED)}")
