#!/usr/bin/env python3
"""
Bookkeeping for recipe-resolver-260424r.

Updates:
1. todo_general_packages.org — status for all 100 packages
2. guix/gaurix/packages/general-compat.scm — add module import
3. guix/gaurix/packages.scm — add pass comment and package exports
"""

import json
import os
import re
import tempfile
import shutil

PASS_ID = "recipe-resolver-260424r"
ORG_FILE = "todo_general_packages.org"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_RECIPES = {
    3014: ("bililive-recorder-bin", "bililive-recorder-bin"),
    3025: ("mas", "mas"),
    4422: ("solv-bin", "solv-bin"),
    4467: ("sticker-convert", "sticker-convert"),
    7764: ("notwaita-cursor-theme", "notwaita-cursor-theme"),
    8259: ("gyr-bin", "gyr-bin"),
    8260: ("rres-bin", "rres-bin"),
    8264: ("sqly-bin", "sqly-bin"),
    8273: ("pingme-bin", "pingme-bin"),
    8275: ("gup-bin", "gup-bin"),
    8310: ("youtubedr-bin", "youtubedr-bin"),
    8317: ("ssh2incus-bin", "ssh2incus-bin"),
    8322: ("mockoon-bin", "mockoon-bin"),
    8324: ("shaka-packager-bin", "shaka-packager-bin"),
    8353: ("xiaomitool-v2", "xiaomitool-v2"),
    8396: ("cmake3-bin", "cmake3-bin"),
    10281: ("syncthing-bin", "syncthing-bin"),
    10939: ("torrra-bin", "torrra-bin"),
    10956: ("ttf-wps-fonts", "ttf-wps-fonts"),
    10963: ("reshell-bin", "reshell-bin"),
    10964: ("easytier-bin", "easytier-bin"),
    10990: ("bdf-unifont", "bdf-unifont"),
    11008: ("ytui-bin", "ytui-bin"),
    11011: ("clang-format-static-bin", "clang-format-static-bin"),
    11016: ("lwtools", "lwtools"),
    11050: ("quickserv-bin", "quickserv-bin"),
    11072: ("activitywatch-bin", "activitywatch-bin"),
    11095: ("flaca-bin", "flaca-bin"),
    11106: ("f2-bin", "f2-bin"),
    11141: ("codename-goose-bin", "codename-goose-bin"),
    11142: ("nfpm-bin", "nfpm-bin"),
    11150: ("phinger-cursors", "phinger-cursors"),
    11167: ("zswap-disable-writeback", "zswap-disable-writeback"),
    11221: ("termpicker-bin", "termpicker-bin"),
    11229: ("filebeat-bin", "filebeat-bin"),
    11233: ("zenta-bin", "zenta-bin"),
    11244: ("mingw-w64-environment", "mingw-w64-environment"),
    11253: ("maplemono-cn-unhinted", "maplemono-cn-unhinted"),
    11254: ("maplemono-cn", "maplemono-cn"),
    11255: ("maplemono-nf-cn-unhinted", "maplemono-nf-cn-unhinted"),
    11256: ("maplemono-nf-cn", "maplemono-nf-cn"),
    11257: ("maplemono-nf-unhinted", "maplemono-nf-unhinted"),
    11258: ("maplemono-nf", "maplemono-nf"),
    11259: ("maplemono-otf", "maplemono-otf"),
    11260: ("maplemono-ttf-autohint", "maplemono-ttf-autohint"),
    11261: ("maplemono-ttf", "maplemono-ttf"),
    11282: ("ttf-signika", "ttf-signika"),
    11290: ("ttf-merriweather-sans", "ttf-merriweather-sans"),
    11292: ("ttf-merriweather", "ttf-merriweather"),
    11294: ("ttf-quintessential", "ttf-quintessential"),
    11540: ("ttf-rubik-vf", "ttf-rubik-vf"),
    11613: ("witr-bin", "witr-bin"),
    11625: ("ttf-material-icons-git", "ttf-material-icons-git"),
    11626: ("ttf-material-symbols-variable-git", "ttf-material-symbols-variable-git"),
    11716: ("wifitui-bin", "wifitui-bin"),
    11751: ("v2rayn-bin", "v2rayn-bin"),
    11754: ("lavat-git", "lavat-git"),
    11774: ("ttf-readex-pro", "ttf-readex-pro"),
    11775: ("ttf-readex-pro-variable", "ttf-readex-pro-variable"),
    11784: ("samsung-unified-driver-common", "samsung-unified-driver-common"),
    11808: ("mongoclock", "mongoclock"),
    11841: ("ast-firmware", "ast-firmware"),
    11848: ("spout2pw-bin", "spout2pw-bin"),
    11850: ("scarlett4-firmware", "scarlett4-firmware"),
    12252: ("ttf-mononoki", "ttf-mononoki"),
    12263: ("ttf-recursive", "ttf-recursive"),
    12405: ("piperig-bin", "piperig-bin"),
    12502: ("airwindows-consolidated-bin", "airwindows-consolidated-bin"),
    13260: ("taws-bin", "taws-bin"),
    13286: ("magiskboot-bin", "magiskboot-bin"),
    13322: ("ttf-iosevka", "ttf-iosevka"),
    13399: ("portal-bin", "portal-bin"),
    13405: ("yandex-cloud-cli-bin", "yandex-cloud-cli-bin"),
    13413: ("wasm-pack-bin", "wasm-pack-bin"),
    13424: ("ssh-dashboard-bin", "ssh-dashboard-bin"),
    13463: ("lstf-bin", "lstf-bin"),
    13485: ("filecraft-cli-bin", "filecraft-cli-bin"),
    13488: ("drift-bin", "drift-bin"),
    13588: ("org-stats-bin", "org-stats-bin"),
    13599: ("waitup-bin", "waitup-bin"),
    13609: ("riffdiff-bin", "riffdiff-bin"),
    13635: ("packrinth-bin", "packrinth-bin"),
    13659: ("hcledit-bin", "hcledit-bin"),
    13662: ("slick-bin", "slick-bin"),
    13688: ("pokesay-bin", "pokesay-bin"),
    13695: ("glab-component-generator-bin", "glab-component-generator-bin"),
    14149: ("ratatui-docs", "ratatui-docs"),
    14150: ("mult-bin", "mult-bin"),
    14165: ("snapsr-bin", "snapsr-bin"),
    14186: ("ktlint-compose-rules", "ktlint-compose-rules"),
    14197: ("gophertube-bin", "gophertube-bin"),
    14206: ("ardopcf-bin", "ardopcf-bin"),
    14207: ("arashi-icon-theme", "arashi-icon-theme"),
    14230: ("gh-dash-bin", "gh-dash-bin"),
    14484: ("mite", "mite"),
    14515: ("goose-bin", "goose-bin"),
    14534: ("gost-v3-bin", "gost-v3-bin"),
    14544: ("codellm", "codellm"),
    14791: ("ttf-miracode", "ttf-miracode"),
}

BLOCKED = {
    11204: ("huawei-me936-udev", "SOURCE_UNAVAILABLE: no upstream URL in AUR metadata"),
}


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0
    all_updates = {}

    for num, (aur_name, guix_name) in NEW_RECIPES.items():
        status = (f"DONE: recipe generated in {PASS_ID}.scm "
                  f"(as {guix_name}) ({PASS_ID})")
        all_updates[num] = ("DONE", aur_name, status, f"  :{PASS_ID}:recipe-generated:")

    for num, (aur_name, reason) in BLOCKED.items():
        status = (f"BLOCKED: {reason} ({PASS_ID})")
        all_updates[num] = ("BLOCKED", aur_name, status, f"  :{PASS_ID}:")

    i = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r'^(\*\* )(FAILED|TODO|DONE|BLOCKED)( \d+\. )', line)
        if m:
            num_match = re.search(r'(\d+)\.', m.group(3))
            if num_match:
                num = int(num_match.group(1))
                if num in all_updates:
                    new_state, pkg_name, new_status, tag = all_updates[num]
                    old_state = m.group(2)

                    if old_state != new_state:
                        rest = line[m.end():]
                        header_rest = rest.rstrip()
                        if PASS_ID not in header_rest:
                            new_line = f"{m.group(1)}{new_state}{m.group(3)}{header_rest.strip()}{tag}\n"
                        else:
                            new_line = f"{m.group(1)}{new_state}{m.group(3)}{header_rest.strip()}\n"
                        lines[i] = new_line
                        changes += 1
                    elif PASS_ID not in line:
                        rest = line.rstrip()
                        lines[i] = f"{rest}{tag}\n"
                        changes += 1

                    j = i + 1
                    status_updated = False
                    while j < len(lines) and j < i + 15:
                        if lines[j].startswith("** "):
                            break
                        if "   - Status:" in lines[j]:
                            lines.insert(j + 1, f"   - Status: {new_status}\n")
                            status_updated = True
                            changes += 1
                            break
                        if "   - TODO Status:" in lines[j]:
                            if new_state == "DONE":
                                lines[j] = f"   - TODO Status: DONE\n"
                            elif new_state == "BLOCKED":
                                lines[j] = f"   - TODO Status: BLOCKED\n"
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
        print(f"WARNING: {len(all_updates)} packages not found in org file:")
        for num, (state, name, status, tag) in all_updates.items():
            print(f"  #{num}: {name}")

    fd, tmp = tempfile.mkstemp(dir=".", suffix=".org")
    os.close(fd)
    with open(tmp, "w") as f:
        f.writelines(lines)
    shutil.move(tmp, ORG_FILE)
    print(f"Updated {ORG_FILE}: {changes} changes")


def update_general_compat():
    """Add module import to general-compat.scm."""
    print(f"Updating {COMPAT_FILE}...")
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    module_line = f"#:use-module (gaurix packages {PASS_ID})"
    if module_line in content:
        print(f"  Module already imported in {COMPAT_FILE}")
        return

    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module' in line:
            insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, f"  {module_line}")
        content = '\n'.join(lines)

        fd, tmp = tempfile.mkstemp(dir=".", suffix=".scm")
        os.close(fd)
        with open(tmp, "w") as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
        print(f"  Added module import at line {insert_idx + 2}")
    else:
        print(f"  WARNING: Could not find insertion point in {COMPAT_FILE}")


def update_packages_scm():
    """Add pass comment and package exports to packages.scm."""
    print(f"Updating {PACKAGES_FILE}...")
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  Pass already recorded in {PACKAGES_FILE}")
        return

    lines = content.split('\n')

    comment = (f"            ;; {PASS_ID}: 100 queue entries resolved "
               f"({len(NEW_RECIPES)} recipes, {len(BLOCKED)} BLOCKED)")

    for i, line in enumerate(lines):
        if line.startswith('(define-module'):
            lines.insert(i + 1, comment)
            break

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=".", suffix=".scm")
    os.close(fd)
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_FILE)
    print(f"  Updated {PACKAGES_FILE}")


def main():
    print(f"=== Bookkeeping for {PASS_ID} ===\n")
    update_org_file()
    print()
    update_general_compat()
    print()
    update_packages_scm()
    print(f"\n=== Bookkeeping complete ===")
    print(f"Recipes: {len(NEW_RECIPES)}")
    print(f"Blocked: {len(BLOCKED)}")
    print(f"Total attempted: {len(NEW_RECIPES) + len(BLOCKED)}")


if __name__ == "__main__":
    main()
