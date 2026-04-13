#!/usr/bin/env python3
"""Update todo_general_packages.org statuses for recipe-resolver-260413v pass.

Resolves 30 NEEDS_RECIPE_DESIGN packages:
  - 21 recipes created (DONE)
  - 9 re-blocked with concrete blocker reasons
"""

import tempfile
import os
import re
import shutil

TODO_FILE = "todo_general_packages.org"

# ── RESOLVED packages: change heading BLOCKED→DONE, add DONE status, flip TODO Status ──

RESOLVED = [
    # (package_name, approx_line, status_text)
    ("obsidian-appimage",
     46297,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (obsidian-appimage v1.12.7, Obsidian AppImage, proprietary)"),
    ("electrum-ltc-appimage",
     47665,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (electrum-ltc-appimage v4.2.2.1, Electrum-LTC AppImage, MIT)"),
    ("orca-slicer-unstable-bin",
     63563,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (orca-slicer-unstable-bin v2.3.2, OrcaSlicer AppImage, AGPL-3.0)"),
    ("vicinae-appimage-bin",
     49934,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (vicinae-appimage-bin v0.20.12, Vicinae launcher AppImage, GPL-3.0)"),
    ("chitubox-free-bin",
     31738,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (chitubox-free-bin v2.3.1, CHITUBOX slicer binary, proprietary)"),
    ("tabularis-bin",
     30990,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (tabularis-bin v0.9.14, Tabularis .deb binary, custom)"),
    ("onlyoffice",
     74908,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (onlyoffice-bin v9.3.1, OnlyOffice .deb binary, AGPL-3.0)"),
    ("02engine-bin",
     33627,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (02engine-bin v1.2.3, 02Engine .deb binary, GPL-3.0)"),
    ("kubelogin",
     29400,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (kubelogin v1.35.2, Kubernetes OIDC auth plugin binary, Apache-2.0)"),
    ("google-cloud-cli-gke-gcloud-auth-plugin",
     28616,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (google-cloud-cli-gke-gcloud-auth-plugin v542.0.0, GKE auth plugin binary, Apache-2.0)"),
    ("netlogo",
     30404,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (netlogo v7.0.3, NetLogo modeling environment, GPL-2.0+)"),
    ("browsh",
     31744,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (browsh-bin v1.8.3, text-based browser binary, LGPL-2.1)"),
    ("fabric-server",
     28910,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (fabric-server v1.1.1, Fabric Minecraft server JAR, Apache-2.0)"),
    ("python-morfeus-ml",
     49468,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (python-morfeus-ml v0.7.2, molecular features Python package, MIT)"),
    ("python-landlock",
     49672,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (python-landlock v1.0.0.dev5, Landlock LSM Python interface, MIT)"),
    ("termux-language-server",
     48963,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (termux-language-server v0.0.31, build script language server, GPL-3.0)"),
    ("otpgui",
     48822,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (otpgui v0.3.3, Python/GTK OTP generator, GPL)"),
    ("tidal-dl-ng",
     25718,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (tidal-dl-ng v0.33.0, TIDAL music downloader, AGPL-3.0)"),
    ("usergrant-git",
     48828,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (usergrant v0.0.1, ACL grant tool, GPL-2.0)"),
    ("linux-enable-ir-emitter-beta",
     28427,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (linux-enable-ir-emitter v7.0.0, IR emitter tool, MIT)"),
    ("beekeeper-qt",
     29674,
     "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260413v.scm (beekeeper-qt v1.3.4, Qt dedup tool, AGPL-3.0)"),
]

# ── RE-BLOCKED packages: keep BLOCKED heading, add new status line ──

REBLOCKED = [
    ("arduino",
     31382,
     "BLOCKED: NEEDS_RECIPE_DESIGN — COMPLEX_BUILD: 8+ source archives (Java+Processing+custom toolchain+libraries); needs dedicated packaging pass (recipe-resolver-260413v)"),
    ("jivexdv-bin",
     30826,
     "BLOCKED: NEEDS_RECIPE_DESIGN — WINDOWS_ONLY: AUR PKGBUILD downloads Windows .exe installer (SETUP_JiveXdv.exe); no Linux binary available (recipe-resolver-260413v)"),
    ("intellij-idea-open-eap",
     49582,
     "BLOCKED: NEEDS_RECIPE_DESIGN — COMPLEX_BUILD: requires building from 2 large git repos (intellij-community + android); full JDK bootstrap needed (recipe-resolver-260413v)"),
    ("cython2",
     66556,
     "BLOCKED: NEEDS_RECIPE_DESIGN — PYTHON2_DEPRECATED: Cython 0.29.x for Python 2; Python 2 is EOL and poorly supported in Guix (recipe-resolver-260413v)"),
    ("helion",
     25603,
     "BLOCKED: NEEDS_RECIPE_DESIGN — DOTNET_UNSUPPORTED: C# game engine requiring .NET SDK; .NET not available in Guix (recipe-resolver-260413v)"),
    ("piper-voices-en-gb",
     29418,
     "BLOCKED: NEEDS_RECIPE_DESIGN — GIT_LFS_NEEDED: requires git-lfs to download large voice model files from HuggingFace; Guix git-fetch does not support LFS (recipe-resolver-260413v)"),
    ("python-zoekt-py-git",
     49499,
     "BLOCKED: NEEDS_RECIPE_DESIGN — DEP_FORK_NEEDED: depends on forked httpx variant (H3mul/zoekt-py); non-standard dependency not in Guix (recipe-resolver-260413v)"),
    ("socos",
     66704,
     "BLOCKED: NEEDS_RECIPE_DESIGN — DEP_MISSING: requires python-soco (SoCo library) not packaged in Guix; need to package python-soco first (recipe-resolver-260413v)"),
    ("lazynmap",
     29635,
     "BLOCKED: NEEDS_RECIPE_DESIGN — BUILD_SYSTEM_UNKNOWN: cannot determine source language or build system from AUR metadata alone; needs upstream repository inspection (recipe-resolver-260413v)"),
]


def find_heading(lines, pkg_name, approx_line, heading_prefix="** BLOCKED"):
    """Find the heading line for a package within ±50 lines of approx_line.

    Returns the 0-based index of the heading line, or None.
    """
    # Convert from 1-based line number to 0-based index
    approx_idx = approx_line - 1
    start = max(0, approx_idx - 50)
    end = min(len(lines), approx_idx + 50)

    # Pattern: heading_prefix followed by number. pkg_name
    # e.g. "** BLOCKED 7028. obsidian-appimage"
    pattern = re.compile(
        r'^\*\* (BLOCKED|DONE)\s+\d+\.\s+' + re.escape(pkg_name) + r'\s*$'
    )

    for i in range(start, end):
        if pattern.match(lines[i].rstrip()):
            return i

    # Wider search if not found
    for i in range(max(0, approx_idx - 200), min(len(lines), approx_idx + 200)):
        if pattern.match(lines[i].rstrip()):
            return i

    return None


def find_entry_end(lines, heading_idx):
    """Find the index of the first line AFTER this entry (next ** heading or EOF)."""
    j = heading_idx + 1
    while j < len(lines):
        if lines[j].startswith("** "):
            return j
        j += 1
    return j  # EOF


def find_last_status_line(lines, heading_idx, entry_end):
    """Find the index of the last '- Status:' line in the entry.

    Returns the 0-based index, or None if no Status line found.
    Also looks for lines starting with '  - Status:' or '   - Status:' etc.
    """
    last_status_idx = None
    for i in range(heading_idx + 1, entry_end):
        stripped = lines[i].lstrip()
        if stripped.startswith("- Status:"):
            last_status_idx = i
    return last_status_idx


def find_last_todo_status_blocked(lines, heading_idx, entry_end):
    """Find the LAST '- TODO Status: BLOCKED' line in the entry.
    Returns 0-based index or None.
    """
    last_idx = None
    for i in range(heading_idx + 1, entry_end):
        stripped = lines[i].lstrip()
        if stripped.startswith("- TODO Status: BLOCKED"):
            last_idx = i
    return last_idx


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    total_lines = len(lines)
    changes = 0
    errors = []

    # ── Process RESOLVED packages ──
    # We process in reverse order of insertion point to avoid index shift issues.
    # First, collect all changes, then apply from bottom to top.

    resolved_ops = []  # (heading_idx, entry_end, pkg_name, status_text)

    for pkg_name, approx_line, status_text in RESOLVED:
        idx = find_heading(lines, pkg_name, approx_line, "** BLOCKED")
        if idx is None:
            errors.append(f"RESOLVED: Could not find heading for '{pkg_name}' near line {approx_line}")
            continue
        entry_end = find_entry_end(lines, idx)
        resolved_ops.append((idx, entry_end, pkg_name, status_text))

    reblocked_ops = []  # (heading_idx, entry_end, pkg_name, status_text)

    for pkg_name, approx_line, status_text in REBLOCKED:
        idx = find_heading(lines, pkg_name, approx_line, "** BLOCKED")
        if idx is None:
            errors.append(f"REBLOCKED: Could not find heading for '{pkg_name}' near line {approx_line}")
            continue
        entry_end = find_entry_end(lines, idx)
        reblocked_ops.append((idx, entry_end, pkg_name, status_text))

    # Combine all operations and sort by heading index descending
    # so that insertions don't shift indices of earlier operations.
    all_ops = []
    for heading_idx, entry_end, pkg_name, status_text in resolved_ops:
        all_ops.append(("RESOLVED", heading_idx, entry_end, pkg_name, status_text))
    for heading_idx, entry_end, pkg_name, status_text in reblocked_ops:
        all_ops.append(("REBLOCKED", heading_idx, entry_end, pkg_name, status_text))

    # Sort descending by heading_idx so we process from bottom to top
    all_ops.sort(key=lambda x: x[1], reverse=True)

    for op_type, heading_idx, entry_end, pkg_name, status_text in all_ops:
        if op_type == "RESOLVED":
            # 1. Change heading from BLOCKED to DONE
            lines[heading_idx] = lines[heading_idx].replace("** BLOCKED", "** DONE", 1)

            # 2. Find the last Status line and insert after it
            last_status = find_last_status_line(lines, heading_idx, entry_end)
            if last_status is not None:
                insert_at = last_status + 1
            else:
                # No status line found; insert before entry end
                insert_at = entry_end

            new_status_line = f"   - Status: {status_text}\n"
            lines.insert(insert_at, new_status_line)

            # 3. Update TODO Status: BLOCKED → DONE (find the last one in entry)
            # Re-compute entry_end since we inserted a line
            new_entry_end = find_entry_end(lines, heading_idx)
            todo_status_idx = find_last_todo_status_blocked(lines, heading_idx, new_entry_end)
            if todo_status_idx is not None:
                lines[todo_status_idx] = lines[todo_status_idx].replace(
                    "TODO Status: BLOCKED", "TODO Status: DONE", 1
                )

            changes += 1
            print(f"  RESOLVED: {pkg_name} (heading line {heading_idx + 1})")

        elif op_type == "REBLOCKED":
            # Find the last Status line and insert after it
            last_status = find_last_status_line(lines, heading_idx, entry_end)
            if last_status is not None:
                insert_at = last_status + 1
            else:
                # No status line found; insert before entry end
                insert_at = entry_end

            new_status_line = f"   - Status: {status_text}\n"
            lines.insert(insert_at, new_status_line)

            changes += 1
            print(f"  REBLOCKED: {pkg_name} (heading line {heading_idx + 1})")

    if errors:
        print(f"\nERRORS ({len(errors)}):")
        for err in errors:
            print(f"  {err}")

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE) or ".")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp, TODO_FILE)
        print(f"\nUpdated {TODO_FILE}: {changes} changes applied ({len(errors)} errors)")
    except:
        os.unlink(tmp)
        raise


if __name__ == "__main__":
    main()
