#!/usr/bin/env python3
"""
Bookkeeping for recipe-resolver-260424s.

Updates:
1. todo_general_packages.org -- status for all 100 packages
2. guix/gaurix/packages/general-compat.scm -- add module import
3. guix/gaurix/packages.scm -- add pass comment and package exports
"""

import os
import re
import tempfile
import shutil

PASS_ID = "recipe-resolver-260424s"
ORG_FILE = "todo_general_packages.org"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_RECIPES = {
    17768: ("trackma-git", "trackma-git"),
    17769: ("nvim-packer-git", "nvim-packer-git"),
    17786: ("landrun-git", "landrun-git"),
    17798: ("spotify-tray-git", "spotify-tray-git"),
    17975: ("rffmpeg-git", "rffmpeg-git"),
    17977: ("paketkoll", "paketkoll"),
    17980: ("karlyriceditor", "karlyriceditor"),
    17981: ("igop", "igop"),
    17982: ("hjson-cli-bin", "hjson-cli-bin"),
    17983: ("gotify-tray-bin", "gotify-tray-bin"),
    17985: ("ecmerge-bin", "ecmerge-bin"),
    17986: ("deepcool-ak620-digital-linux-git", "deepcool-ak620-digital-linux-git"),
    17987: ("corral-git", "corral-git"),
    17988: ("corral", "corral"),
    17989: ("copybook-bin", "copybook-bin"),
    17990: ("amethyst-player-git", "amethyst-player-git"),
    17991: ("cmigemo-git", "cmigemo-git"),
    17992: ("riscv-gnu-toolchain-bin", "riscv-gnu-toolchain-bin"),
    17993: ("mox", "mox"),
    17994: ("elfinfo", "elfinfo"),
    17995: ("yaloco", "yaloco"),
    17996: ("easy", "easy"),
    17997: ("cargo-mutants", "cargo-mutants"),
    17998: ("amethyst-player", "amethyst-player"),
    17999: ("in", "in"),
    18000: ("xace", "xace"),
    18001: ("v-editor-git", "v-editor-git"),
    18002: ("tikz2pdf-git", "tikz2pdf-git"),
    18003: ("spacemidi", "spacemidi"),
    18004: ("shef-bin", "shef-bin"),
    18005: ("octave-femoctave", "octave-femoctave"),
    18006: ("markflowy-bin", "markflowy-bin"),
    18008: ("god-build-git", "god-build-git"),
    18009: ("falsec-bin", "falsec-bin"),
    18010: ("falsec", "falsec"),
    18011: ("confz", "confz"),
    18012: ("canace", "canace"),
    18013: ("bmputil-git", "bmputil-git"),
    18014: ("axon-applauncher-git", "axon-applauncher-git"),
    18015: ("hunspell-cs", "hunspell-cs"),
    18018: ("joshuto", "joshuto"),
    18019: ("rustpython-git", "rustpython-git"),
    18021: ("dnsviz", "dnsviz"),
    18022: ("rustpython", "rustpython"),
    18023: ("razer-cli", "razer-cli"),
    18025: ("masayloblockly-bin", "masayloblockly-bin"),
    18026: ("bluelog-git", "bluelog-git"),
    18027: ("b-em", "b-em"),
    18028: ("ft232r_prog", "ft232r_prog"),
    18029: ("php83-zip", "php83-zip"),
    18030: ("xmpp-dns-git", "xmpp-dns-git"),
    18031: ("atto", "atto"),
    18033: ("requestly-git", "requestly-git"),
    18034: ("project-zomboid-server", "project-zomboid-server"),
    18035: ("perl-mason", "perl-mason"),
    18036: ("libcanlock", "libcanlock"),
    18037: ("abs-lang-git", "abs-lang-git"),
    18039: ("stackandconquer", "stackandconquer"),
    18040: ("opencl-nvidia-tesla", "opencl-nvidia-tesla"),
    18041: ("electron23", "electron23"),
    18042: ("capter", "capter"),
    18043: ("hasher-priv", "hasher-priv"),
    18044: ("coursier-bin", "coursier-bin"),
    18045: ("coursier-native-bin", "coursier-native-bin"),
    18046: ("superproductivity", "superproductivity"),
    18047: ("sdrconnect", "sdrconnect"),
    18048: ("daggerfall-unity-bin", "daggerfall-unity-bin"),
    18049: ("eparakstitajs3", "eparakstitajs3"),
    18050: ("tuptime", "tuptime"),
    18051: ("qgnomeplatform-qt6", "qgnomeplatform-qt6"),
    18054: ("gocheat-bin", "gocheat-bin"),
    18055: ("dulcepan-git", "dulcepan-git"),
    18057: ("rundeck-community", "rundeck-community"),
    18058: ("alvr-git", "alvr-git"),
    18059: ("listen1-desktop-appimage", "listen1-desktop-appimage"),
    18061: ("arqiver", "arqiver"),
    18062: ("purr", "purr"),
    18065: ("abracadabra", "abracadabra"),
    18067: ("outlook-for-linux-bin", "outlook-for-linux-bin"),
    18068: ("afdko", "afdko"),
    18069: ("wiznote-desktop-bin", "wiznote-desktop-bin"),
    18070: ("torzu-git", "torzu-git"),
    18071: ("pi-hole-ftl", "pi-hole-ftl"),
    18074: ("xerox-phaser-3020", "xerox-phaser-3020"),
    18076: ("owncast", "owncast"),
    18080: ("qt-dab", "qt-dab"),
    18082: ("dpitunnel", "dpitunnel"),
    18086: ("hyprlux", "hyprlux"),
    18089: ("google-cloud-cli-lite", "google-cloud-cli-lite"),
    18090: ("zfs-prune-snapshots", "zfs-prune-snapshots"),
    18095: ("golored", "golored"),
    18096: ("metals", "metals"),
    18097: ("airgeddon", "airgeddon"),
    18099: ("zrok-bin", "zrok-bin"),
    18101: ("conceal-bin", "conceal-bin"),
    18103: ("softethervpn", "softethervpn"),
    18104: ("jlink-systemview", "jlink-systemview"),
    18105: ("nikto-git", "nikto-git"),
    18106: ("mangl", "mangl"),
    18107: ("softethervpn-git", "softethervpn-git"),
}

BLOCKED = {}


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
