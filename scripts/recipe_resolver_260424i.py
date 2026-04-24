#!/usr/bin/env python3
"""
recipe-resolver-260424i: Resolve 30 NEEDS_RECIPE_DESIGN packages.

This pass resolves 30 packages:
  - 26 new recipes generated in recipe-resolver-260424i.scm
  - 4 already packaged in prior passes (bookkeeping update)

Updates:
1. todo_general_packages.org — status lines for all 30 packages
"""

import re
import os
import json
import tempfile
import shutil

PASS_ID = "recipe-resolver-260424i"

ORG_FILE = "todo_general_packages.org"

# New recipes this pass (org number -> (pkg_name, guix_name))
NEW_RECIPES = {
    17781: ("ttf-impallari-cabin-font", "ttf-impallari-cabin-font"),
    19160: ("mkbold-mkitalic", "mkbold-mkitalic"),
    18679: ("ttf-sudo", "ttf-sudo"),
    18718: ("ttf-pacifico", "ttf-pacifico"),
    18996: ("ttf-remixicon", "ttf-remixicon"),
    19258: ("ttf-roboto-serif", "ttf-roboto-serif"),
    19372: ("fonts-et-book", "fonts-et-book"),
    17848: ("ttf-aref-ruqaa", "ttf-aref-ruqaa"),
    18862: ("ttf-martian-mono", "ttf-martian-mono"),
    17850: ("ttf-reem-kufi", "ttf-reem-kufi"),
    19083: ("otf-hanken-grotesk", "otf-hanken-grotesk"),
    19025: ("awesome-themes-git", "awesome-themes-git"),
    18436: ("flat-remix-gnome", "flat-remix-gnome"),
    18673: ("vimix-icon-theme", "vimix-icon-theme"),
    18451: ("vimix-gtk-themes", "vimix-gtk-themes"),
    18662: ("xcursor-simp1e-zenburn", "xcursor-simp1e-zenburn"),
    18483: ("zorin-icon-themes", "zorin-icon-themes"),
    18134: ("adwaita-plus-git", "adwaita-plus-git"),
    18730: ("gtk-cyberpunk-neon-theme-git", "gtk-cyberpunk-neon-theme-git"),
    17821: ("traefik-bin", "traefik-bin"),
    17782: ("dufs-bin", "dufs-bin"),
    18038: ("git-town-bin", "git-town-bin"),
    17826: ("sqlfmt-bin", "sqlfmt-bin"),
    18078: ("docfd-bin", "docfd-bin"),
    18634: ("python-demjson3", "python-demjson3"),
    17842: ("daemon", "daemon"),
}

# Already packaged in prior passes (org number -> (pkg_name, recipe_file, recipe_name))
ALREADY_PACKAGED = {
    21562: ("ttf-courier-prime", "queue-20260325p100", "ttf-courier-prime"),
    21884: ("ebgaramond-otf", "general-compat", "ebgaramond-otf"),
    21434: ("mint-x-icons", "cron-c79f127f-r26-w03", "mint-x-icons"),
    21535: ("mint-themes", "cron-c79f127f-r25-w03", "mint-themes"),
}


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0

    # Build lookup of all packages to update
    all_updates = {}

    for num, (name, guix_name) in NEW_RECIPES.items():
        status = (f"DONE: NEEDS_RECIPE_DESIGN resolved — recipe generated in "
                  f"{PASS_ID}.scm (as {guix_name}) ({PASS_ID})")
        all_updates[num] = ("DONE", name, status)

    for num, (name, recipe_file, recipe_name) in ALREADY_PACKAGED.items():
        status = (f"DONE: NEEDS_RECIPE_DESIGN resolved — ALREADY_PACKAGED_PRIOR: "
                  f"recipe exists in {recipe_file}.scm (as {recipe_name}) "
                  f"({PASS_ID})")
        all_updates[num] = ("DONE", name, status)

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
                    if old_state != "DONE":
                        rest = line[m.end():]
                        tag = f"  :{PASS_ID}:recipe-generated:"
                        header_rest = rest.rstrip()
                        new_line = f"{m.group(1)}DONE{m.group(3)}{header_rest.strip()}{tag}\n"
                        lines[i] = new_line
                        changes += 1

                    # Find/update the Status line
                    j = i + 1
                    status_updated = False
                    while j < len(lines) and j < i + 10:
                        if lines[j].startswith("** "):
                            break
                        if "   - Status:" in lines[j] or "   - TODO Status:" in lines[j]:
                            lines[j] = f"   - Status: {new_status}\n"
                            status_updated = True
                            changes += 1
                            break
                        j += 1

                    if not status_updated:
                        # Insert a status line after the header
                        j = i + 1
                        while j < len(lines) and j < i + 10:
                            if lines[j].startswith("** "):
                                break
                            j += 1
                        lines.insert(j, f"   - Status: {new_status}\n")
                        status_updated = True
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
    """Write summary and selection reports."""
    summary = {
        "pass_id": PASS_ID,
        "date": "2026-04-24",
        "resolved_new_recipes": len(NEW_RECIPES),
        "resolved_already_packaged": len(ALREADY_PACKAGED),
        "total_resolved": len(NEW_RECIPES) + len(ALREADY_PACKAGED),
        "blocked": 0,
        "exhausted": 0,
        "total": len(NEW_RECIPES) + len(ALREADY_PACKAGED),
        "new_recipes": [v[1] for v in NEW_RECIPES.values()],
        "already_packaged": {
            str(k): v[0] for k, v in ALREADY_PACKAGED.items()
        },
    }

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")

    selection = {
        "pass_id": PASS_ID,
        "selected": {
            str(k): v[0] for k, v in {**NEW_RECIPES, **{
                k: (v[0], v[2]) for k, v in ALREADY_PACKAGED.items()
            }}.items()
        },
    }
    sel_path = f"reports/{PASS_ID}-selection.json"
    with open(sel_path, "w") as f:
        json.dump(selection, f, indent=2)
    print(f"Wrote {sel_path}")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print(f"Working directory: {os.getcwd()}")

    update_org_file()
    write_reports()

    print(f"\nDone.")
    print(f"  - {len(NEW_RECIPES)} new recipes in {PASS_ID}.scm")
    print(f"  - {len(ALREADY_PACKAGED)} packages confirmed as already packaged")
    print(f"  - Total: {len(NEW_RECIPES) + len(ALREADY_PACKAGED)} resolved")
