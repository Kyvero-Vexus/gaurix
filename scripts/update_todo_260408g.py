#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260408g pass.

Appends status updates to 30 NEEDS_RECIPE_DESIGN packages.
Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import tempfile
import shutil

SRC = "todo_general_packages.org"

# Each entry: (line_number_of_NEEDS_RECIPE_DESIGN_status, pkg_name, status_update_text)
# Line numbers are from the NEEDS_RECIPE_DESIGN grep output
UPDATES = [
    # Group A: Already resolved via existing recipes in cron-*/recipe-resolver-* modules
    # These had placeholder stubs in queue-20260329p100 but real recipes exist elsewhere
    (67812, "localsend",
     "   - Status: DONE: already resolved; real recipe exists as localsend-bin in localsend-bin.scm, exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67877, "freetube-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r18-w01.scm (freetube-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67895, "zotero-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r18-w01.scm (zotero-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67948, "proton-pass-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r3-w01.scm (proton-pass-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67997, "anytype-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r18-w01.scm (anytype-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67979, "arduino-ide-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r18-w01.scm (arduino-ide-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67856, "electron40-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r12-w03.scm (electron40-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67851, "vesktop",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r3-w01.scm (vesktop-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67956, "cursor-bin",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-recipe-w02.scm (cursor-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67861, "jetbrains-toolbox",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-recipe-w02.scm (jetbrains-toolbox), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67840, "mullvad-browser-bin",
     "   - Status: DONE: already resolved; real recipe exists in recipe-resolver-260407j.scm (mullvad-browser-bin), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67846, "jellyfin-desktop",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r12-w03.scm (jellyfin-desktop), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67943, "bottles",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-recipe-r4-w02.scm (bottles), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67835, "zapzap",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r5-w02.scm (zapzap), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (68014, "pinta",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-recipe-r4-w02.scm (pinta), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67872, "polychromatic",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r10-w03.scm (polychromatic), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67962, "faugus-launcher",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r5-w02.scm (faugus-launcher), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (67972, "minecraft-launcher",
     "   - Status: DONE: already resolved; real recipe exists in cron-5a2fb251-r10-w03.scm (minecraft-launcher), exported from packages.scm (confirmed in recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),

    # Group B: New compat aliases for -git/-bin variants -> existing packages
    (96745, "localsend-git",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> localsend-bin (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (90717, "logseq-desktop-git",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> logseq-desktop-bin (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (89203, "xlibre-input-wacom-bin",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> xf86-input-wacom (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (89209, "xlibre-video-fbdev-bin",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> xf86-video-fbdev (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (89235, "appimagelauncher-git",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> appimagelauncher-bin (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (102389, "ffmpeg-amd-full-git",
     "   - Status: DONE: compat alias in recipe-resolver-260408g.scm -> ffmpeg (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),

    # Group C: New binary recipes
    (67967, "android-studio",
     "   - Status: DONE: recipe in recipe-resolver-260408g.scm (android-studio-bin v2024.3.2.16, tar.gz binary, proprietary) + compat alias android-studio in general-compat.scm (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),
    (61925, "netbeans-bin",
     "   - Status: DONE: recipe in recipe-resolver-260408g.scm (netbeans-bin v24, zip binary from Apache, Apache-2.0 license) (recipe-resolver-260408g pass)\n"
     "   - TODO Status: DONE\n"),

    # Group D: Properly blocked with exhausted approaches
    (67830, "vmware-workstation",
     "   - Status: BLOCKED: PROPRIETARY_COMPLEX_EXHAUSTED | A1: proprietary binary with DKMS kernel modules (vmmon, vmnet) incompatible with Guix; A2: requires systemd services + kernel headers; A3: binary redistribution restricted by VMware EULA | recipe-resolver-260408g pass\n"
     "   - TODO Status: BLOCKED\n"),
    (68003, "traur",
     "   - Status: BLOCKED: ARCH_SPECIFIC_EXHAUSTED | A1: AUR trust scoring tool, requires makepkg/pacman infrastructure; A2: Bash script tightly coupled to AUR API + pacman local DB; A3: no Guix analogue possible (AUR-specific tool) | recipe-resolver-260408g pass\n"
     "   - TODO Status: BLOCKED\n"),
    (68045, "davinci-resolve",
     "   - Status: BLOCKED: PROPRIETARY_COMPLEX_EXHAUSTED | A1: proprietary video editor, requires manual download from blackmagicdesign.com (no direct URL); A2: massive ~3GB binary with CUDA/OpenCL deps; A3: complex runtime requiring specific GPU driver versions | recipe-resolver-260408g pass\n"
     "   - TODO Status: BLOCKED\n"),
    (68040, "voxtype",
     "   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | A1: no upstream source found (GitHub/GitLab search yields no results); A2: AUR package has no PKGBUILD or source URL accessible; A3: insufficient information to draft any recipe | recipe-resolver-260408g pass\n"
     "   - TODO Status: BLOCKED\n"),
]


def main():
    with open(SRC, "r") as f:
        lines = f.readlines()

    # Process updates in reverse order so line numbers stay valid
    sorted_updates = sorted(UPDATES, key=lambda x: x[0], reverse=True)

    for line_num, pkg_name, status_text in sorted_updates:
        # Convert 1-indexed line number to 0-indexed
        idx = line_num - 1
        if idx < len(lines):
            # Insert status update AFTER the NEEDS_RECIPE_DESIGN line
            lines.insert(idx + 1, status_text)
            print(f"Updated {pkg_name} at line {line_num}")
        else:
            print(f"WARNING: line {line_num} out of range for {pkg_name}")

    # Write to temp file and atomic move
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(SRC) or ".", suffix=".org.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, SRC)
        print(f"Atomically updated {SRC}")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
