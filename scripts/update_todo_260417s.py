#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260417s.
Marks 30 NEEDS_RECIPE_DESIGN packages as resolved.

The file format is:
** DONE NNN. package-name
   - Source List: ...
   - Status: NEEDS_RECIPE_DESIGN: ...
   - Difficulty: unknown
   - TODO Status: BLOCKED

We need to update:
1. "- Status: NEEDS_RECIPE_DESIGN: ..." -> "- Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260417s.scm"
2. "- TODO Status: BLOCKED" -> "- TODO Status: DONE"
"""

import re
import os
import tempfile
import shutil

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TODO_FILE = os.path.join(REPO, "todo_general_packages.org")

# Package names resolved in this pass
RESOLVED = {
    "stack-bin": "copy-build-system binary from GitHub commercialhaskell/stack",
    "kapp": "copy-build-system binary from GitHub carvel-dev/kapp",
    "ymp-bin": "copy-build-system binary from GitHub trap251/ymp",
    "ttypr-bin": "copy-build-system binary from GitHub tanciaku/ttypr",
    "keifu-bin": "copy-build-system binary from GitHub trasta298/keifu",
    "dredge-bin": "copy-build-system binary from GitHub DeprecatedLuar/dredge-cargo",
    "canvas-downloader-bin": "copy-build-system binary from GitHub aik2mlj/canvas-downloader",
    "repeater-bin": "copy-build-system binary from GitHub shaankhosla/repeater",
    "rip-go-bin": "copy-build-system binary from GitHub roniel-rhack/rip-go",
    "dynocsv": "copy-build-system binary from GitHub zshamrock/dynocsv",
    "mpwall": "copy-build-system binary from GitHub Lamess-UI/mpwall",
    "ov": "copy-build-system binary from GitHub noborus/ov",
    "asciinema-agg": "copy-build-system binary from GitHub asciinema/agg",
    "seanime": "copy-build-system binary from GitHub 5rahim/seanime",
    "subsurface-appimage": "copy-build-system AppImage from GitHub subsurface/subsurface",
    "git-mr": "copy-build-system shell script from GitLab glensc/git-mr",
    "arkenfox-user.js": "copy-build-system config from GitHub arkenfox/user.js",
    "byedpi": "gnu-build-system C source from GitHub hufrea/byedpi",
    "bsdiff": "gnu-build-system C source from GitHub mendsley/bsdiff",
    "yash": "gnu-build-system C source from GitHub magicant/yash",
    "activate-linux": "gnu-build-system C source from GitHub MrGlockenspiel/activate-linux",
    "pyupgrade": "pyproject-build-system from PyPI",
    "python-pythondialog": "pyproject-build-system from PyPI",
    "python-sysv-ipc": "pyproject-build-system from PyPI",
    "ttf-b612": "copy-build-system font from GitHub polarsys/b612",
    "mint-y-icons": "copy-build-system icon theme from GitHub linuxmint/mint-y-icons",
    "mint-x-icons": "copy-build-system icon theme from GitHub linuxmint/mint-x-icons",
    "prometheus-apcupsd-exporter": "gnu-build-system Go source from GitHub mdlayher/apcupsd_exporter",
    "smooth": "gnu-build-system C++ source from GitHub enzo1982/smooth",
    "corrscope": "pyproject-build-system from GitHub corrscope/corrscope",
}


def update_todo():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    updated = 0
    remaining = dict(RESOLVED)  # Copy so we can track what's left

    i = 0
    while i < len(lines):
        line = lines[i]
        # Check for heading with package name: "** DONE NNN. package-name"
        heading_match = re.match(r'\*\* (?:DONE|BLOCKED|TODO) (\d+)\. (.+?)(?:\s*\[.*\])?\s*$', line)
        if heading_match:
            pkg_num = heading_match.group(1)
            pkg_name = heading_match.group(2).strip()

            if pkg_name in remaining:
                build_note = remaining[pkg_name]
                # Scan the next few lines for Status and TODO Status
                for j in range(i + 1, min(i + 12, len(lines))):
                    sline = lines[j]
                    # Update Status line containing NEEDS_RECIPE_DESIGN
                    if "NEEDS_RECIPE_DESIGN" in sline and "Status:" in sline:
                        lines[j] = f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260417s.scm ({build_note})\n"
                    # Update TODO Status: BLOCKED -> DONE
                    if re.match(r'\s+- TODO Status:\s*BLOCKED\s*$', sline):
                        lines[j] = "   - TODO Status: DONE\n"

                del remaining[pkg_name]
                updated += 1
        i += 1

    # Report any not found
    for name in remaining:
        print(f"  WARNING: Could not find '{name}' in todo file")

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
        print(f"Updated {updated} / {len(RESOLVED)} entries in todo_general_packages.org")
    except:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    update_todo()
