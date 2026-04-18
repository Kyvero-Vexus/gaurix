#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260418o pass.
Adds status lines to 30 NEEDS_RECIPE_DESIGN packages."""

import re
import sys
import shutil

TODO_FILE = "todo_general_packages.org"
PASS_TAG = "recipe-resolver-260418o"

# Map: (entry_number, package_name) -> new status line
UPDATES = {
    # Recipes (5)
    (8135, "errands-c-git"):
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_TAG}.scm (errands-c v49.0, GNOME todo app rewritten in C, gnu-build-system, MIT) ({PASS_TAG})",
    (8070, "netcheck"):
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_TAG}.scm (netcheck v1.10.1, network connectivity monitor, pyproject-build-system, GPL-2.0+) ({PASS_TAG})",
    (8102, "flatpak-builder-tools-git"):
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_TAG}.scm (flatpak-builder-tools v0.0.1-git, Flatpak manifest helpers, copy-build-system, MIT) ({PASS_TAG})",
    (8110, "shutter-encoder"):
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_TAG}.scm (shutter-encoder v20.0, media transcoder, copy-build-system, GPL-3.0) ({PASS_TAG})",
    (8118, "phonon-qt5-mpv-git"):
        f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_TAG}.scm (phonon-mpv v0.1.0, Phonon MPV backend, cmake-build-system, LGPL-2.1) ({PASS_TAG})",

    # ALREADY_IN_GUIX (2)
    (5538, "python315"):
        f"   - Status: DONE: ALREADY_IN_GUIX — Python is already packaged in upstream Guix; version variants are handled by Guix's python package definitions ({PASS_TAG})",
    (5549, "libxml2-git"):
        f"   - Status: DONE: ALREADY_IN_GUIX — libxml2 is already packaged in upstream Guix as libxml2 ({PASS_TAG})",

    # EXHAUSTED - specific reasons (6)
    (8138, "pesconvert-git"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: NO_LICENSE: repository has no LICENSE/COPYING file; legally cannot redistribute; A1: no license declared in repo; A2: contacting author impractical for channel; A3: all-rights-reserved by default without explicit license ({PASS_TAG})",
    (5716, "pyload-ng"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PYTHON_DEEP_DEPS: requires mini-racer (V8 JS engine) not in Guix + 15+ Flask packages + pycurl; A1: mini-racer wraps V8 (massive C++ build); A2: no stable release (all versions dev/beta); A3: heavy web framework dependency chain ({PASS_TAG})",
    (8141, "shorewall6"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS: requires shorewall-core + shorewall base packages not in Guix; A1: shorewall-core has non-standard shell installer; A2: project dormant since 2020; A3: Guix System uses nftables/iptables directly ({PASS_TAG})",
    (8104, "cassette"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD: Vala/GTK4 Yandex Music client with internal libtape-0 subproject; A1: needs blueprint-compiler not in Guix; A2: Meson subproject must be vendored or packaged; A3: depends on webkitgtk-6.0 for auth ({PASS_TAG})",
    (5587, "melonds-bin"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_REPACK: previously resolved in recipe-resolver-260413n, re-blocked; A1: AppImage inside zip needs patchelf + dynamic linker fixup; A2: binary extraction fragile across Guix updates; A3: source build needs Qt6 + OpenGL complex deps ({PASS_TAG})",
    (5588, "keystore-explorer-bin"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_REPACK: previously resolved in recipe-resolver-260413n, re-blocked; A1: Java app needs JRE wrapper + desktop integration; A2: non-standard packaging; A3: alternative keytool bundled with OpenJDK ({PASS_TAG})",

    # EXHAUSTED - PHP84 cluster (12)
    (5706, "php84"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PHP_VERSION_VARIANT: Guix packages PHP with extensions built-in; A1: Guix php already available at stable versions; A2: individual extension split packages are Arch-specific pattern; A3: Guix update cycle handles new PHP versions ({PASS_TAG})",
    (5704, "php84-bcmath"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: Arch splits PHP into per-extension packages; Guix builds PHP as single package; not a separate package in Guix model ({PASS_TAG})",
    (5703, "php84-bz2"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5702, "php84-calendar"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5701, "php84-cgi"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5700, "php84-cli"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5699, "php84-ctype"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5698, "php84-curl"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5697, "php84-dba"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5696, "php84-dblib"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5695, "php84-dom"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",
    (5694, "php84-embed"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: PHP extension subpackage; Guix PHP includes extensions natively ({PASS_TAG})",

    # EXHAUSTED - AMD proprietary (5)
    (5711, "vulkan-amdgpu-pro"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD: proprietary AMD Vulkan driver; A1: closed-source binary blob, license prohibits redistribution; A2: mesa provides open-source RADV; A3: nonguix handles proprietary drivers ({PASS_TAG})",
    (5712, "lib32-vulkan-amdgpu-pro"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD + MULTILIB: 32-bit proprietary AMD Vulkan; A1: proprietary license; A2: Guix lacks multilib; A3: use open-source RADV ({PASS_TAG})",
    (5713, "lib32-amdgpu-pro-oglp"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD + MULTILIB: 32-bit proprietary AMD OpenGL; A1: proprietary; A2: Guix lacks multilib; A3: mesa radeonsi is open alternative ({PASS_TAG})",
    (5714, "amf-amdgpu-pro"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD: proprietary AMD Advanced Media Framework; A1: closed-source hardware encoder; A2: no open equivalent; A3: VA-API provides open-source alternative ({PASS_TAG})",
    (5715, "amdgpu-pro-oglp"):
        f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD: proprietary AMD OpenGL Pro driver; A1: proprietary license; A2: mesa radeonsi is open-source alternative; A3: nonguix handles proprietary drivers ({PASS_TAG})",
}

def main():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    # Build lookup: find the line index for each entry header
    entry_map = {}  # entry_number -> line_index (0-based)
    for i, line in enumerate(lines):
        m = re.match(r'^\*\* (?:FAILED|DONE|BLOCKED) (\d+)\. (.+?)(?:\s*\[|$)', line)
        if m:
            entry_num = int(m.group(1))
            entry_name = m.group(2).strip()
            entry_map[(entry_num, entry_name)] = i

    # For each update, find the entry and append the new status line
    insertions = []  # (line_index, new_line)
    for (entry_num, pkg_name), new_status in UPDATES.items():
        key = (entry_num, pkg_name)
        if key not in entry_map:
            print(f"WARNING: entry ({entry_num}, {pkg_name}) not found in todo file", file=sys.stderr)
            continue

        header_idx = entry_map[key]
        # Find the last status/difficulty/TODO Status line in this entry
        insert_after = header_idx
        j = header_idx + 1
        while j < len(lines) and not lines[j].startswith('** '):
            stripped = lines[j].strip()
            if stripped.startswith('- Status:') or stripped.startswith('Status:') or \
               stripped.startswith('- Difficulty:') or stripped.startswith('- TODO Status:') or \
               stripped.startswith('- Source List:'):
                insert_after = j
            elif stripped == '':
                break
            j += 1

        insertions.append((insert_after, new_status + "\n"))

    # Sort insertions by line index in reverse order (so we can insert without shifting)
    insertions.sort(key=lambda x: x[0], reverse=True)

    for insert_after, new_line in insertions:
        lines.insert(insert_after + 1, new_line)

    # Write atomically
    tmp_file = TODO_FILE + ".tmp"
    with open(tmp_file, 'w') as f:
        f.writelines(lines)
    shutil.move(tmp_file, TODO_FILE)

    print(f"Updated {len(insertions)} entries in {TODO_FILE}")

if __name__ == '__main__':
    main()
