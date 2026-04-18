#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260418n pass.

For each of 30 entries:
  1. Find the heading by entry number (e.g. "** FAILED 11391. plasmazones-bin")
  2. Flip the heading keyword to DONE or FAILED as specified
  3. Insert a new status line AFTER the last line of that entry (before next "** " or EOF)
  4. Update the last "- TODO Status:" line within the entry to DONE or FAILED

Deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import re
import tempfile

TODO_FILE = os.path.join(
    os.path.dirname(os.path.abspath(__file__)), "..", "todo_general_packages.org"
)
RESOLVER_ID = "recipe-resolver-260418n"

# Each entry: (entry_number, name, target_keyword, status_text)
# target_keyword: "DONE" or "FAILED"
# status_text: the full text after "- Status: " (will be indented to match entry)
ENTRIES = [
    # --- NEW RECIPES (flip to DONE) ---
    (11391, "plasmazones-bin", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (plasmazones-bin v2.8.7, KDE Plasma window tiling binary, copy-build-system, GPL-3.0+) ({RESOLVER_ID})"),
    (11384, "rustdesk", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (rustdesk-bin v1.4.6, remote desktop binary, copy-build-system, AGPL-3.0) ({RESOLVER_ID})"),
    (11336, "qt-sudo", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (qt-sudo v2.3.0, Qt sudo dialog, cmake-build-system, LGPL-2.1) ({RESOLVER_ID})"),
    (8826, "clamav-gui", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (clamav-gui v1.2.2, ClamAV GUI, cmake-build-system, GPL-3.0) ({RESOLVER_ID})"),
    (8811, "namp", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (namp v2.43, terminal audio player, cmake-build-system, GPL-2.0) ({RESOLVER_ID})"),
    (8802, "samsung-ssd-fwupdate", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (samsung-ssd-fwupdate v1.1, SSD firmware update script, copy-build-system, MIT) ({RESOLVER_ID})"),
    (11363, "prefixer", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (prefixer v1.4.1, Proton prefix manager, pyproject-build-system, GPL-3.0) ({RESOLVER_ID})"),
    (11330, "appimagelauncher", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (appimagelauncher-bin v2.2.0, AppImage helper binary, copy-build-system, MIT) ({RESOLVER_ID})"),
    (11334, "millennium", "DONE",
     f"DONE: NEEDS_RECIPE_DESIGN resolved \u2014 recipe in {RESOLVER_ID}.scm (millennium-bin v3.0.0-beta.21, Steam modding framework binary, copy-build-system, MIT) ({RESOLVER_ID})"),

    # --- ALREADY_IN_GUIX (flip to DONE) ---
    (9534, "python2", "DONE",
     f"DONE: ALREADY_IN_GUIX: already in upstream Guix as python-2 ({RESOLVER_ID})"),

    # --- BLOCKED EXHAUSTED (flip to FAILED) ---
    (11397, "freefilesync", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: NON_FREE_LICENSE: GPL-3.0 with \"private use only\" restriction; A1: binary \u2014 license blocks redistribution; A2: source \u2014 custom wx+ fork, restrictive license; A3: no FOSS-compatible fork ({RESOLVER_ID})"),
    (11387, "traur", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: AUR trust scoring requires pacman/AUR infrastructure; A1: pacman deps not in Guix; A2: tightly coupled to AUR API; A3: no portable upstream ({RESOLVER_ID})"),
    (11356, "vmware-workstation", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: closed-source with DKMS kernel modules; A1: license prohibits redistribution; A2: DKMS incompatible with Guix; A3: requires systemd services ({RESOLVER_ID})"),
    (11352, "aurvote-utils", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: AUR voting utility requires pacman; A1: pacman not in Guix; A2: no portable alternative; A3: Arch-only tooling ({RESOLVER_ID})"),
    (11351, "libxnvctrl-580xx", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA: proprietary NVIDIA NV-CONTROL extension; A1: proprietary driver stack; A2: nonguix handles NVIDIA; A3: no OSS equivalent ({RESOLVER_ID})"),
    (11350, "nvidia-580xx-settings", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA: proprietary NVIDIA settings tool; A1: requires proprietary driver; A2: nonguix handles NVIDIA; A3: nvidia-settings in nonguix ({RESOLVER_ID})"),
    (11345, "lib32-opencl-nvidia-580xx", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED + PROPRIETARY_NVIDIA: 32-bit proprietary OpenCL; A1: Guix lacks multilib; A2: proprietary; A3: use 64-bit version ({RESOLVER_ID})"),
    (11344, "lib32-nvidia-580xx-utils", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED + PROPRIETARY_NVIDIA: 32-bit proprietary utils; A1: Guix lacks multilib; A2: proprietary; A3: use 64-bit version ({RESOLVER_ID})"),
    (11338, "claude-code", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: Anthropic commercial license prohibits redistribution; A1: npm bundle, license blocks packaging; A2: no open-source fork; A3: minified JS, cannot build from source ({RESOLVER_ID})"),
    (11335, "millennium-debug", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT: debug symbols for millennium; A1: not separate package, debug output of millennium-bin; A2: Guix supports :debug output natively; A3: millennium-bin packaged in this pass ({RESOLVER_ID})"),
    (11328, "downgrade", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: pacman downgrade tool; A1: requires pacman and Arch Linux Archive; A2: no portable upstream; A3: Guix has built-in rollback via generations ({RESOLVER_ID})"),
    (11323, "octopi", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: Qt pacman frontend; A1: requires pacman/libalpm; A2: no portable package manager abstraction; A3: Guix has own package management UI ({RESOLVER_ID})"),
    (11319, "antigravity", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY: Google proprietary IDE; A1: closed-source, license prohibits redistribution; A2: no open-source fork; A3: Electron binary with proprietary services ({RESOLVER_ID})"),
    (11318, "nvidia-580xx-dkms", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA: proprietary kernel module sources; A1: DKMS incompatible with Guix kernel; A2: proprietary license; A3: nonguix handles NVIDIA ({RESOLVER_ID})"),
    (11317, "opencl-nvidia-580xx", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA: proprietary OpenCL; A1: proprietary binary blob; A2: nonguix handles this; A3: no OSS equivalent ({RESOLVER_ID})"),
    (11316, "nvidia-580xx-utils", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_NVIDIA: proprietary utils; A1: proprietary; A2: nonguix channel; A3: no OSS alternative for this version ({RESOLVER_ID})"),
    (11313, "aur-sync-vote", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: ARCH_SPECIFIC: AUR vote syncing; A1: requires makepkg/pacman; A2: AUR-specific; A3: no portable upstream ({RESOLVER_ID})"),
    (8818, "libodb", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: BUILD2_REQUIRED: needs build2 toolchain not in Guix; A1: build2 not packaged; A2: community CMake port outdated; A3: packaging build2 is significant scope ({RESOLVER_ID})"),
    (8806, "lib32-libxcb-git", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MULTILIB_UNSUPPORTED: 32-bit X11 client library; A1: Guix lacks multilib; A2: cross-compile i686 not lib32 compatible; A3: use 64-bit libxcb ({RESOLVER_ID})"),
    (8803, "wails", "FAILED",
     f"FAILED: NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_DEPS: Go desktop framework; A1: 100+ Go modules needed; A2: no prebuilt binaries; A3: CGo + WebKitGTK + npm cross-deps ({RESOLVER_ID})"),
]


def update_todo():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    total_lines = len(lines)

    # Build heading index: entry_number -> list of (line_index, name_in_heading)
    heading_re = re.compile(r"^\*\*\s+(\S+)\s+(\d+)\.\s+(\S+)")
    heading_index = {}  # entry_number -> [(line_idx, name)]
    for i, line in enumerate(lines):
        m = heading_re.match(line)
        if m:
            num = int(m.group(2))
            name = m.group(3)
            if num not in heading_index:
                heading_index[num] = []
            heading_index[num].append((i, name))

    # Collect edits: list of dicts with all info needed
    edits = []
    skipped = []

    for entry_num, search_name, target_kw, status_text in ENTRIES:
        if entry_num not in heading_index:
            skipped.append(f"  NOT FOUND: {entry_num}. {search_name}")
            continue

        # Find the best matching heading for this entry number
        candidates = heading_index[entry_num]
        heading_idx = None
        for idx, name in candidates:
            if name == search_name or name.startswith(search_name):
                heading_idx = idx
                break
        if heading_idx is None:
            # Fall back to first candidate with matching number
            heading_idx = candidates[0][0]

        # Find the block end (next heading or EOF)
        block_end = heading_idx + 1
        while block_end < len(lines) and not lines[block_end].startswith("** "):
            block_end += 1

        # Find the last "- TODO Status:" line within this block
        last_todo_status_idx = None
        for j in range(heading_idx + 1, block_end):
            if lines[j].lstrip().startswith("- TODO Status:"):
                last_todo_status_idx = j

        # Determine indent from entry body lines
        indent = "   "  # default 3 spaces
        for j in range(heading_idx + 1, block_end):
            stripped = lines[j].lstrip()
            if stripped.startswith("- "):
                indent = lines[j][: len(lines[j]) - len(lines[j].lstrip())]
                break

        # Find insertion point: last non-blank content line before block_end
        # We insert after the last content line (before trailing blank lines and next heading)
        insert_idx = block_end  # will insert before this index

        edits.append({
            "heading_idx": heading_idx,
            "insert_idx": insert_idx,
            "target_kw": target_kw,
            "status_text": status_text,
            "indent": indent,
            "last_todo_status_idx": last_todo_status_idx,
            "entry_num": entry_num,
            "search_name": search_name,
        })

    # Sort edits by insert_idx descending so insertions don't shift later indices
    edits.sort(key=lambda e: e["insert_idx"], reverse=True)

    updated_count = 0
    for edit in edits:
        heading_idx = edit["heading_idx"]
        insert_idx = edit["insert_idx"]
        target_kw = edit["target_kw"]
        status_text = edit["status_text"]
        indent = edit["indent"]
        last_todo_status_idx = edit["last_todo_status_idx"]
        entry_num = edit["entry_num"]
        search_name = edit["search_name"]

        # 1. Flip the heading keyword
        old_heading = lines[heading_idx]
        new_heading = re.sub(
            r"^(\*\*\s+)(DONE|FAILED|TODO|BLOCKED)(\s+)",
            rf"\g<1>{target_kw}\3",
            old_heading,
        )
        lines[heading_idx] = new_heading

        # 2. Insert new status line before the next heading (at insert_idx)
        new_status_line = f"{indent}- Status: {status_text}\n"
        lines.insert(insert_idx, new_status_line)

        # 3. Update the last TODO Status line (indices after insert_idx are shifted by 1,
        #    but since we process in reverse order of insert_idx, and last_todo_status_idx
        #    is always < insert_idx, it hasn't been shifted yet by THIS insertion)
        if last_todo_status_idx is not None:
            old_ts = lines[last_todo_status_idx]
            new_ts = re.sub(
                r"(- TODO Status:\s*)\S+.*",
                rf"\1{target_kw}",
                old_ts,
            )
            lines[last_todo_status_idx] = new_ts

        updated_count += 1
        kw_change = "DONE" if target_kw == "DONE" else "FAILED"
        print(f"  OK: {entry_num}. {search_name} -> {kw_change} (heading line {heading_idx + 1})")

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        os.replace(tmp, TODO_FILE)
    except:
        os.unlink(tmp)
        raise

    print(f"\nUpdated {TODO_FILE}: {updated_count}/{len(ENTRIES)} entries processed")
    print(f"Lines before: {total_lines}, lines after: {len(lines)}")
    if skipped:
        print(f"Skipped {len(skipped)} entries:")
        for s in skipped:
            print(s)


if __name__ == "__main__":
    update_todo()
