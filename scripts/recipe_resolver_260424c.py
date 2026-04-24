#!/usr/bin/env python3
"""
recipe-resolver-260424c: Update bookkeeping files for 30 NEEDS_RECIPE_DESIGN packages.

This pass resolves 30 NRD-blocked packages:
  - 24 already packaged in prior passes (headers not yet updated to DONE)
  - 6 blocked/exhausted (proprietary, multilib, DKMS, distro-specific)
  - 0 new recipes (easy NRD pool fully drained by prior 25+ passes)

Updates:
1. todo_general_packages.org — status lines for all 30 packages
"""

import re
import os
import sys
import json
import tempfile
import shutil

PASS_ID = "recipe-resolver-260424c"

ORG_FILE = "todo_general_packages.org"

# No new recipes this pass (all feasible NRD packages already resolved by prior passes)
NEW_RECIPES = []

# Already packaged in prior passes (org number -> (pkg_name, recipe_file, recipe_name))
ALREADY_PACKAGED = {
    11320: ("google-chrome", "recipe-resolver-260407j", "google-chrome-bin"),
    11321: ("helium-browser-bin", "recipe-resolver-260407j", "helium-browser-bin"),
    11337: ("zoom", "recipe-resolver-260407j", "zoom-bin"),
    11339: ("rustdesk-bin", "recipe-resolver-260407j", "rustdesk-bin"),
    11342: ("mullvad-vpn-bin", "recipe-resolver-260407j", "mullvad-vpn-bin"),
    11355: ("onlyoffice-bin", "recipe-resolver-260407j", "onlyoffice-bin"),
    11401: ("slack-desktop", "recipe-resolver-260407j", "slack-desktop-bin"),
    11315: ("zen-browser-bin", "recipe-resolver-260407j", "zen-browser-bin"),
    11358: ("mullvad-browser-bin", "recipe-resolver-260407j", "mullvad-browser-bin"),
    11357: ("zapzap", "cron-5a2fb251-r5-w02", "zapzap"),
    11380: ("faugus-launcher", "cron-5a2fb251-r5-w02", "faugus-launcher"),
    11364: ("polychromatic", "cron-5a2fb251-r10-w03", "polychromatic"),
    11377: ("bottles", "cron-5a2fb251-recipe-r4-w02", "bottles"),
    11389: ("pinta", "cron-5a2fb251-recipe-r4-w02", "pinta"),
    11359: ("jellyfin-desktop", "cron-5a2fb251-r12-w03", "jellyfin-desktop"),
    11350: ("nvidia-580xx-settings", "cron-c79f127f-r22-w03-nrd8", "nvidia-580xx-settings"),
    5871: ("green-recorder-git", "recipe-resolver-260418ac", "green-recorder-git"),
    8022: ("lightdm-settings", "recipe-resolver-260418ac", "lightdm-settings"),
    8102: ("flatpak-builder-tools-git", "recipe-resolver-260418o", "flatpak-builder-tools"),
    8110: ("shutter-encoder", "recipe-resolver-260418o", "shutter-encoder"),
    8135: ("errands-c-git", "recipe-resolver-260418o", "errands-c"),
    8118: ("phonon-qt5-mpv-git", "recipe-resolver-260418o", "phonon-mpv"),
    5874: ("gr-limesdr-git", "recipe-resolver-260418s", "gr-limesdr"),
    5881: ("gpu-screen-recorder-gtk-git", "recipe-resolver-260418s", "gpu-screen-recorder-gtk"),
}

# Blocked packages (org number -> (pkg_name, reason))
BLOCKED = {}

# Exhausted packages (org number -> (pkg_name, reason))
EXHAUSTED = {
    5426: ("cursor-ide",
           "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: Cursor AI IDE; "
           "LicenseRef-Cursor EULA prohibits redistribution; cloud-dependent AI features; "
           "A1: proprietary binary-only, no source code; "
           "A2: EULA forbids redistribution; "
           "A3: requires cloud subscription for core functionality "
           "(recipe-resolver-260424c)"),
    5780: ("lib32-mcpelauncher-linux",
           "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — MULTILIB_UNSUPPORTED: "
           "32-bit Minecraft: Bedrock Edition launcher; "
           "A1: Guix does not support multilib/32-bit builds; "
           "A2: requires lib32-glibc and lib32-libx11 not available; "
           "A3: upstream mcpelauncher-manifest requires Android runtime components "
           "(recipe-resolver-260424c)"),
    11319: ("antigravity",
            "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: "
            "Google Antigravity AI IDE (VS Code fork); "
            "LicenseRef-Google-Antigravity proprietary EULA; binary-only distribution; "
            "A1: no source code published; "
            "A2: proprietary license prohibits redistribution; "
            "A3: cloud-dependent AI features require Google account "
            "(recipe-resolver-260424c)"),
    15269: ("olauncher",
            "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_DEP: "
            "Modified Minecraft launcher with proprietary Microsoft auth; "
            "custom CC0-licensed wrapper but core depends on proprietary Minecraft; "
            "A1: pre-built JAR only, no build from source; "
            "A2: requires proprietary Microsoft authentication libraries; "
            "A3: only 1 AUR vote, flagged out-of-date, minimal user base "
            "(recipe-resolver-260424c)"),
    15278: ("vitis",
            "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY: "
            "AMD/Xilinx Vitis FPGA design suite; proprietary license; "
            "A1: 50GB+ proprietary installer with custom EULA; "
            "A2: requires proprietary Vivado toolchain as dependency; "
            "A3: non-redistributable, requires AMD license agreement "
            "(recipe-resolver-260424c)"),
    15411: ("ec-su_axb35-dkms-git",
            "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — DKMS_UNSUPPORTED: "
            "Linux kernel module for Sixunited AXB35-02 embedded controller; "
            "A1: DKMS not supported in Guix (uses Shepherd, not systemd); "
            "A2: kernel modules must be built with kernel in Guix; "
            "A3: very niche hardware, only 1 AUR vote "
            "(recipe-resolver-260424c)"),
}


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0

    # Build lookup of all packages to update
    all_updates = {}
    for num, (name, recipe_file, recipe_name) in ALREADY_PACKAGED.items():
        status = (f"DONE: NEEDS_RECIPE_DESIGN resolved — ALREADY_PACKAGED_PRIOR: "
                  f"recipe exists in {recipe_file}.scm (as {recipe_name}) "
                  f"({PASS_ID})")
        all_updates[num] = ("DONE", name, status)
    for num, (name, reason) in BLOCKED.items():
        all_updates[num] = ("FAILED", name, reason)
    for num, (name, reason) in EXHAUSTED.items():
        all_updates[num] = ("FAILED", name, reason)

    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(FAILED|TODO|DONE|BLOCKED)( \d+\. )', line)
        if m:
            num_match = re.search(r'(\d+)\.', m.group(3))
            if num_match:
                num = int(num_match.group(1))
                if num in all_updates:
                    new_state, pkg_name, new_status = all_updates[num]
                    old_state = m.group(2)
                    if new_state == "DONE" and old_state != "DONE":
                        rest = line[m.end():]
                        tag = f"  :{PASS_ID}:recipe-generated:"
                        header_rest = rest.rstrip()
                        # Preserve existing tags and add ours
                        if ':' in header_rest and header_rest.rstrip().endswith(':'):
                            # Already has tags, append
                            header_rest = header_rest.rstrip().rstrip(':')
                            tag = f":{PASS_ID}:recipe-generated:"
                            new_line = f"{m.group(1)}DONE{m.group(3)}{header_rest}{tag}\n"
                        else:
                            new_line = f"{m.group(1)}DONE{m.group(3)}{header_rest.strip()}{tag}\n"
                        lines[i] = new_line
                        changes += 1

                    # Find the Status: line with NEEDS_RECIPE_DESIGN and update it
                    j = i + 1
                    status_updated = False
                    while j < len(lines) and j < i + 10:
                        if lines[j].startswith("** "):
                            break
                        if "   - Status:" in lines[j] and "NEEDS_RECIPE_DESIGN" in lines[j]:
                            lines[j] = f"   - Status: {new_status}\n"
                            status_updated = True
                            changes += 1
                            break
                        j += 1

                    if not status_updated:
                        j = i + 1
                        while j < len(lines) and j < i + 10:
                            if lines[j].startswith("** "):
                                break
                            if "   - Status:" in lines[j]:
                                lines.insert(j + 1, f"   - Status: {new_status}\n")
                                status_updated = True
                                changes += 1
                                break
                            j += 1

                    if not status_updated:
                        lines.insert(i + 1, f"   - Status: {new_status}\n")
                        changes += 1

                    del all_updates[num]
        i += 1

    if all_updates:
        print(f"WARNING: {len(all_updates)} packages not found in org file: "
              f"{list(all_updates.keys())}")

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir=".", suffix=".org")
    os.close(fd)
    with open(tmp, "w") as f:
        f.writelines(lines)
    shutil.move(tmp, ORG_FILE)
    print(f"Updated {ORG_FILE}: {changes} changes")


def write_reports():
    """Write summary report."""
    summary = {
        "pass_id": PASS_ID,
        "date": "2026-04-24",
        "resolved_new_recipes": len(NEW_RECIPES),
        "resolved_already_packaged": len(ALREADY_PACKAGED),
        "total_resolved": len(NEW_RECIPES) + len(ALREADY_PACKAGED),
        "blocked": len(BLOCKED),
        "exhausted": len(EXHAUSTED),
        "total": (len(NEW_RECIPES) + len(ALREADY_PACKAGED)
                  + len(BLOCKED) + len(EXHAUSTED)),
        "new_recipes": NEW_RECIPES,
        "already_packaged": {
            str(k): v[0] for k, v in ALREADY_PACKAGED.items()
        },
        "blocked_packages": {
            str(k): v[0] for k, v in BLOCKED.items()
        },
        "exhausted_packages": {
            str(k): v[0] for k, v in EXHAUSTED.items()
        },
    }

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print(f"Working directory: {os.getcwd()}")

    update_org_file()
    write_reports()
    print(f"\nDone. No new recipes (all feasible NRD packages already resolved).")
    print(f"  - {len(ALREADY_PACKAGED)} packages confirmed as already packaged")
    print(f"  - {len(EXHAUSTED)} packages exhausted")
