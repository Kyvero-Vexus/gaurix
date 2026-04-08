#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260408a pass.
Appends DONE status lines to NEEDS_RECIPE_DESIGN entries for resolved packages.
"""
import re
import sys
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: package-name -> (version, description for status line)
RESOLVED = {
    "fortune-mod-futurama": ("0.2", "Futurama fortune cookies, copy-build-system"),
    "fortune-mod-firefly": ("3.0.0", "Firefly fortune cookies, copy-build-system"),
    "fortune-mod-matrix": ("20160822", "Matrix trilogy fortune cookies, copy-build-system"),
    "fortune-mod-archer": ("4.2", "Archer fortune cookies, copy-build-system"),
    "fortune-mod-hackers": ("1", "Hackers movie fortune cookies, copy-build-system"),
    "fortune-mod-iasip": ("1", "IASIP fortune cookies, copy-build-system"),
    "gruvbox-dark-icons-gtk": ("1.0.0", "Gruvbox dark GTK icon theme, copy-build-system"),
    "posy-improved-cursors": ("1.6", "Posy cursor themes, copy-build-system"),
    "zaread-git": ("0.0.1", "lightweight ebook reader bash script, copy-build-system"),
    "kfr": ("7.0.1", "C++ DSP framework, cmake-build-system"),
    "namefix-git": ("1.0.0", "filename sanitizer bash script, copy-build-system"),
    "osslsigncode": ("2.12", "Authenticode signing tool, cmake-build-system"),
    "3dstool": ("1.2.6", "3DS ROM extraction tool, cmake-build-system"),
    "signalbackup-tools-git": ("20241106.1", "Signal Backup tool, cmake-build-system"),
    "xclicker": ("1.5.1", "GUI autoclicker, meson-build-system"),
    "xbindkeys_config-gtk2": ("0.1.4", "GTK2 xbindkeys config, meson-build-system"),
    "cls": ("1.0", "terminal screen clear utility, trivial-build-system"),
    "nb": ("7.25.2", "CLI note-taking app, copy-build-system"),
    "most-snapshot": ("5.3.0.8", "terminal pager, gnu-build-system"),
    "rpcapd": ("1.10.5", "remote packet capture daemon, gnu-build-system"),
    "scrapfetch-git": ("0.0.1", "C system info fetcher, gnu-build-system"),
    "ctpv-git": ("0.0.1", "terminal previews for lf, gnu-build-system"),
    "mcbash": ("0.8.6", "IPTV MAC scanner, copy-build-system"),
    "air-bin": ("1.65.0", "Go live-reload binary, copy-build-system"),
    "meta-package-manager-bin": ("6.2.1", "package manager wrapper binary, trivial-build-system"),
    "xremap-niri-bin": ("0.15.0", "Niri key remapper binary, trivial-build-system"),
    "continuwuity-bin": ("0.5.6", "Matrix homeserver binary, trivial-build-system"),
    "twitch-downloader-bin": ("1.56.2", "Twitch VOD downloader binary, trivial-build-system"),
    "maretf-bin": ("0.10.2", "VTF file utility binary, trivial-build-system"),
    "kopia-ui-bin": ("0.22.3", "backup tool from .deb, trivial-build-system"),
}

MODULE = "recipe-resolver-260408a"

def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    changes = 0
    resolved_set = set()

    for i, line in enumerate(lines):
        new_lines.append(line)

        if "NEEDS_RECIPE_DESIGN" in line and "DONE" not in line:
            for pkg_name, (version, desc) in RESOLVED.items():
                if pkg_name in line and pkg_name not in resolved_set:
                    done_line = (
                        f"   - Status: DONE: recipe in {MODULE}.scm "
                        f"({pkg_name} v{version}, {desc})\n"
                    )
                    new_lines.append(done_line)
                    resolved_set.add(pkg_name)
                    changes += 1
                    break

    final_lines = []
    for i, line in enumerate(new_lines):
        header_match = re.match(r'^(\*\* )(BLOCKED|FAILED)( \d+\. )(.+)$', line)
        if header_match:
            pkg_in_header = header_match.group(4).strip()
            if pkg_in_header in RESOLVED:
                line = f"{header_match.group(1)}DONE{header_match.group(3)}{pkg_in_header}\n"

        if "TODO Status: BLOCKED" in line or "TODO Status: FAILED" in line:
            lookback = new_lines[max(0, i-10):i]
            for lb in lookback:
                if f"recipe in {MODULE}" in lb:
                    line = re.sub(r"TODO Status: (BLOCKED|FAILED)", "TODO Status: DONE", line)
                    break

        final_lines.append(line)

    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(final_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} NEEDS_RECIPE_DESIGN entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(resolved_set))}")
    unresolved = set(RESOLVED.keys()) - resolved_set
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
