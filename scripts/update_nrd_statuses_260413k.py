#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260413k pass.

23 packages resolved with recipes, 7 blocked with specific reason codes.
"""

import re
import sys
import shutil
import tempfile
import os

ORG_FILE = "todo_general_packages.org"

# Resolved packages: (header_line_1indexed, package_name, resolution_note)
RESOLVED = [
    (30417, "sigscan-bin", "recipe in recipe-resolver-260413k.scm (sigscan-bin v0.2.3, pre-built binary, copy-build-system)"),
    (44203, "ast-grep-bin", "recipe in recipe-resolver-260413k.scm (ast-grep-bin v0.42.1, pre-built binary, copy-build-system)"),
    (45639, "caescript-bin", "recipe in recipe-resolver-260413k.scm (caescript-bin v0.1.0, pre-built binary, copy-build-system)"),
    (45615, "httptap-bin", "recipe in recipe-resolver-260413k.scm (httptap-bin v0.1.1, pre-built binary, copy-build-system)"),
    (44023, "music-player-bin", "recipe in recipe-resolver-260413k.scm (music-player-bin v0.2.0-alpha.14, pre-built binary, copy-build-system)"),
    (30542, "nijiexpose-bin", "recipe in recipe-resolver-260413k.scm (nijiexpose-bin v0.9.0-rc4, pre-built binary, copy-build-system)"),
    (30322, "git-switcher-bin", "recipe in recipe-resolver-260413k.scm (git-switcher-bin v0.6.1, pre-built binary, copy-build-system)"),
    (30505, "tidewave-bin", "recipe in recipe-resolver-260413k.scm (tidewave-bin v0.4.1, AppImage binary, copy-build-system)"),
    (44440, "veracrypt-console-bin", "recipe in recipe-resolver-260413k.scm (veracrypt-console-bin v1.26.14, .deb binary, copy-build-system)"),
    (45651, "logisim-evolution-bin", "recipe in recipe-resolver-260413k.scm (logisim-evolution-bin v4.1.0, JAR wrapper, copy-build-system)"),
    (30113, "ledfx-cc-bin", "recipe in recipe-resolver-260413k.scm (ledfx-cc-bin v2.0.108-b6, AppImage binary, copy-build-system)"),
    (44545, "termtosvg", "recipe in recipe-resolver-260413k.scm (termtosvg v1.1.0, Python, python-build-system)"),
    (44081, "pisek", "recipe in recipe-resolver-260413k.scm (pisek v2.3.2, Python, pyproject-build-system)"),
    (45669, "python-upnpclient", "recipe in recipe-resolver-260413k.scm (python-upnpclient v1.0.3, Python, python-build-system)"),
    (45537, "python-backports.shutil_which", "recipe in recipe-resolver-260413k.scm (python-backports.shutil-which v3.5.2, Python, pyproject-build-system)"),
    (44236, "snapborg", "recipe in recipe-resolver-260413k.scm (snapborg v0.1.1, Python, python-build-system)"),
    (29893, "pam-luks-keyring-unlock", "recipe in recipe-resolver-260413k.scm (pam-luks-keyring-unlock v1.0.1, C, meson-build-system)"),
    (44503, "wlr-dpms-git", "recipe in recipe-resolver-260413k.scm (wlr-dpms v0.1.0, C, gnu-build-system)"),
    (44739, "wl-gears-git", "recipe in recipe-resolver-260413k.scm (wl-gears v0.1.0, C, gnu-build-system)"),
    (30455, "xtatusbar", "recipe in recipe-resolver-260413k.scm (xtatusbar v0.1.0, C, gnu-build-system)"),
    (30536, "xdgctl", "recipe in recipe-resolver-260413k.scm (xdgctl v1.0, C, gnu-build-system)"),
    (44538, "terminalimageviewer", "recipe in recipe-resolver-260413k.scm (terminalimageviewer v1.2.1, C++, gnu-build-system)"),
    (44243, "snoop", "recipe in recipe-resolver-260413k.scm (snoop v0.4.2, Vala/Meson, meson-build-system)"),
]

# Blocked packages: (header_line_1indexed, package_name, block_reason)
BLOCKED = [
    (73288, "exaile", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; MISSING_GUIX_DEPS: python-bsddb not in Guix, 15+ optional deps. See blocked-notes."),
    (29009, "stremio-service-bin", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; MISSING_GUIX_DEPS: libayatana-appindicator not in Guix. See blocked-notes."),
    (44599, "python-foobeef", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; MISSING_GUIX_DEPS: python-aiohttp-sse-client not in Guix. See blocked-notes."),
    (30566, "radiotray-ng-mpris", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; MISSING_GUIX_DEPS: python-mpris-server, python-yacl, radiotray-ng not in Guix. See blocked-notes."),
    (69080, "fprintd-clients-git", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; COMPLEX_BUILD: needs local patches + libsystemd. See blocked-notes."),
    (44510, "fcitx5-pinyin-chinese-idiom", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; MISSING_GUIX_DEPS: python-pypinyin not in Guix. See blocked-notes."),
    (44489, "ksnip", "BLOCKED: NEEDS_RECIPE_DESIGN re-evaluated in recipe-resolver-260413k; VERSION_MISMATCH: Qt5/Qt6 mismatch with kimageannotator in Guix. See blocked-notes."),
]

def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0

    # Merge all entries into one list with action type, sort by line descending
    all_entries = []
    for header_line, pkg_name, note in RESOLVED:
        all_entries.append((header_line, pkg_name, "resolved", note))
    for header_line, pkg_name, block_reason in BLOCKED:
        all_entries.append((header_line, pkg_name, "blocked", block_reason))

    # Sort by header_line DESCENDING so insertions don't shift later entries
    all_entries.sort(key=lambda x: x[0], reverse=True)

    for header_line, pkg_name, action, note in all_entries:
        idx = header_line - 1  # 0-indexed
        if idx >= len(lines):
            print(f"WARNING: line {header_line} out of range for {pkg_name}", file=sys.stderr)
            continue

        header = lines[idx]
        if pkg_name.lower() not in header.lower():
            # Try nearby lines
            found = False
            for offset in range(-3, 4):
                check_idx = idx + offset
                if 0 <= check_idx < len(lines) and pkg_name.lower() in lines[check_idx].lower() and lines[check_idx].startswith("** "):
                    idx = check_idx
                    header = lines[idx]
                    found = True
                    break
            if not found:
                print(f"WARNING: {pkg_name} not found near line {header_line}", file=sys.stderr)
                continue

        if action == "resolved":
            # Update header to DONE if it starts with ** BLOCKED
            if header.startswith("** BLOCKED"):
                lines[idx] = header.replace("** BLOCKED", "** DONE", 1)
                changes += 1

            # Find the right place to add the DONE status line
            insert_idx = None
            for j in range(idx + 1, min(idx + 15, len(lines))):
                if lines[j].startswith("** "):
                    break
                if lines[j].strip().startswith("- Status:"):
                    insert_idx = j + 1
                if lines[j].strip().startswith("- TODO Status:"):
                    lines[j] = "   - TODO Status: DONE\n"
                    changes += 1
                    break

            if insert_idx is not None:
                new_line = f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — {note}\n"
                lines.insert(insert_idx, new_line)
                changes += 1

        elif action == "blocked":
            # Find the right place to add the blocked status line
            insert_idx = None
            for j in range(idx + 1, min(idx + 15, len(lines))):
                if lines[j].startswith("** "):
                    break
                if lines[j].strip().startswith("- Status:"):
                    insert_idx = j + 1
                if lines[j].strip().startswith("- TODO Status:"):
                    break

            if insert_idx is not None:
                new_line = f"   - Status: {note}\n"
                lines.insert(insert_idx, new_line)
                changes += 1

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=".", suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.writelines(lines)
        shutil.move(tmp_path, ORG_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {changes} lines in {ORG_FILE}")
    print(f"  Resolved: {len(RESOLVED)} packages")
    print(f"  Blocked: {len(BLOCKED)} packages")


if __name__ == "__main__":
    main()
