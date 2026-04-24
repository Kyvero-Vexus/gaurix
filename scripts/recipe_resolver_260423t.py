#!/usr/bin/env python3
"""
recipe-resolver-260423t: Update bookkeeping files for 30 NEEDS_RECIPE_DESIGN packages.

Updates:
1. todo_general_packages.org — status lines for all 30 packages
2. guix/gaurix/packages.scm — add use-module and re-exports
3. guix/gaurix/packages/general-compat.scm — add use-module and re-exports
"""

import re
import os
import sys
import tempfile
import shutil

PASS_ID = "recipe-resolver-260423t"

ORG_FILE = "todo_general_packages.org"
PACKAGES_SCM = "guix/gaurix/packages.scm"
GENERAL_COMPAT = "guix/gaurix/packages/general-compat.scm"

# New recipes written in this pass
NEW_RECIPES = [
    "ttf-comfortaa",
    "python-convertdate",
    "zdbsp",
    "xst",
    "gpp",
    "everforest-gtk-theme-git",
    "python-telegram-send",
    "python-pyvis",
    "python-sioyek",
    "liboqs",
    "openssh-askpass-qt",
    "quickbib",
    "netcheck",
    "scalpel-git",
]

# Already packaged in prior passes (org number -> (pkg_name, recipe_file, recipe_name))
ALREADY_PACKAGED = {
    5994: ("python-types-waitress", "recipe-resolver-260408w", "python-types-waitress"),
    5920: ("python-cyclopts", "recipe-resolver-260416e", "python-cyclopts"),
    5572: ("python-myvaillant", "recipe-resolver-260415r", "python-myvaillant"),
    3005: ("wl-mpris-idle-inhibit", "recipe-resolver-260418k", "wl-mpris-idle-inhibit"),
    8687: ("terminal-rain-lightning", "recipe-resolver-260407m", "terminal-rain-lightning"),
    5638: ("smpeg0", "recipe-resolver-260415d", "smpeg0"),
    26836: ("nutty-git", "recipe-resolver-260419e", "nutty"),
    18201: ("gh-dash", "deptree-resolver-260418ab", "gh-dash-bin"),
}

# Blocked packages (org number -> (pkg_name, reason))
BLOCKED = {
    20407: ("sigi", "BLOCKED: NEEDS_RECIPE_DESIGN — RUST_CARGO_NO_PREBUILT: Rust/Cargo package; no pre-built x86_64-linux binaries; cargo-build-system requires enumerating all crate dependencies (recipe-resolver-260423t)"),
    8016: ("rofi-games", "BLOCKED: NEEDS_RECIPE_DESIGN — RUST_CARGO_NO_PREBUILT: Rust/Cargo package with Rofi plugin API; no pre-built binaries available on GitHub releases (recipe-resolver-260423t)"),
    38496: ("greetd-tuigreet-fork-git", "BLOCKED: NEEDS_RECIPE_DESIGN — RUST_CARGO_NO_PREBUILT: Rust/Cargo TUI greeter fork; no pre-built binaries on release page (recipe-resolver-260423t)"),
    18339: ("phpactor", "BLOCKED: NEEDS_RECIPE_DESIGN — PHP_COMPOSER_ECOSYSTEM: PHP/Composer project with 50+ deps; no composer-build-system in Guix; no .phar binary on releases (recipe-resolver-260423t)"),
}

# Exhausted packages (org number -> (pkg_name, reason))
EXHAUSTED = {
    4787: ("gprname", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — ADA_CIRCULAR_BOOTSTRAP: gprbuild component requires itself to build; A1: bootstrap with minimal gprbuild fails without Ada compiler chain; A2: no pre-built binary for Guix; A3: gprname cannot be separated from gprbuild (recipe-resolver-260423t)"),
    7866: ("adblock2privoxy", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — HASKELL_DEEP_DEPS: orphaned Haskell/Cabal project needing 20+ unpackaged Haskell libs; A1: haskell-build-system blocked by missing deps; A2: no static binary available; A3: alternative tool (privoxy-blocklist) exists (recipe-resolver-260423t)"),
    18980: ("thunar-extended", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — CUSTOM_PATCH_MAINTENANCE: requires maintaining version-specific patches against upstream Thunar; A1: patches not published; A2: patches break on Thunar updates; A3: contribute upstream out of scope (recipe-resolver-260423t)"),
    8104: ("cassette", "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — GNOME46_DEPS: Vala/GNOME app needing libadwaita >=1.5 and blueprint-compiler not in Guix; A1: meson blocked by missing GNOME 46+ deps; A2: flatpak not suitable; A3: wait for GNOME 46 in Guix (recipe-resolver-260423t)"),
}

# New recipe org number -> (pkg_name, details)
NEW_RECIPE_ORG = {
    19177: ("ttf-comfortaa", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (ttf-comfortaa v3.105, rounded geometric sans-serif font, font-build-system, OFL-1.1) (recipe-resolver-260423t)"),
    33442: ("python-convertdate", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (python-convertdate v2.4.1, calendar system conversion, pyproject-build-system, MIT) (recipe-resolver-260423t)"),
    18551: ("zdbsp", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (zdbsp v1.19, ZDoom BSP node builder, cmake-build-system, GPL-2.0) (recipe-resolver-260423t)"),
    38277: ("xst", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (xst v0.9, st terminal fork, gnu-build-system, MIT) (recipe-resolver-260423t)"),
    17839: ("gpp-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (gpp v2.28, general-purpose preprocessor, gnu-build-system, LGPL-3.0+) (recipe-resolver-260423t)"),
    30610: ("everforest-gtk-theme-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (everforest-gtk-theme-git, GTK theme, copy-build-system, GPL-3.0) (recipe-resolver-260423t)"),
    5282: ("python-telegram-send", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (python-telegram-send v0.39.2, Telegram CLI messenger, pyproject-build-system, GPL-3.0+) (recipe-resolver-260423t)"),
    8790: ("python-pyvis", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (python-pyvis v0.3.2, network graph visualization, pyproject-build-system, BSD-3-Clause) (recipe-resolver-260423t)"),
    18783: ("python-sioyek", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (python-sioyek v0.31.11, Sioyek PDF viewer Python interface, pyproject-build-system, GPL-3.0) (recipe-resolver-260423t)"),
    8052: ("liboqs", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (liboqs v0.15.0, post-quantum crypto library, cmake-build-system, MIT) (recipe-resolver-260423t)"),
    8029: ("openssh-askpass", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (openssh-askpass-qt v2.1.0, Qt SSH passphrase dialog, cmake-build-system, GPL-2.0+) (recipe-resolver-260423t)"),
    8734: ("quickbib", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (quickbib v0.7.2, DOI/arXiv to BibTeX tool, meson-build-system, GPL-3.0) (recipe-resolver-260423t)"),
    8070: ("netcheck", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (netcheck v1.10.1, network connectivity checker, pyproject-build-system, GPL-2.0+) (recipe-resolver-260423t)"),
    21582: ("scalpel-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260423t.scm (scalpel-git v2.0, file carving tool, gnu-build-system, Apache-2.0) (recipe-resolver-260423t)"),
}


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0

    # Build lookup of all packages to update
    all_updates = {}
    for num, (name, status) in NEW_RECIPE_ORG.items():
        all_updates[num] = ("DONE", name, status)
    for num, (name, recipe_file, recipe_name) in ALREADY_PACKAGED.items():
        status = f"DONE: NEEDS_RECIPE_DESIGN resolved — ALREADY_PACKAGED_PRIOR: recipe exists in {recipe_file}.scm (as {recipe_name}) (recipe-resolver-260423t)"
        all_updates[num] = ("DONE", name, status)
    for num, (name, reason) in BLOCKED.items():
        all_updates[num] = ("FAILED", name, reason)
    for num, (name, reason) in EXHAUSTED.items():
        all_updates[num] = ("FAILED", name, reason)

    i = 0
    while i < len(lines):
        line = lines[i]
        # Match header lines like "** FAILED 5920. python-cyclopts" or "** TODO 33442. python-convertdate"
        m = re.match(r'^(\*\* )(FAILED|TODO|DONE)( \d+\. )', line)
        if m:
            # Extract the number
            num_match = re.search(r'(\d+)\.', m.group(3))
            if num_match:
                num = int(num_match.group(1))
                if num in all_updates:
                    new_state, pkg_name, new_status = all_updates[num]
                    # Update header state
                    old_state = m.group(2)
                    if new_state == "DONE" and old_state != "DONE":
                        rest = line[m.end():]
                        # Add recipe-resolver tag to header if resolving
                        tag = f"  :recipe-resolver-260423t:recipe-generated:"
                        header_rest = rest.rstrip()
                        # Remove existing tags
                        header_rest = re.sub(r'\s+:[\w-]+:', '', header_rest)
                        new_line = f"{m.group(1)}DONE{m.group(3)}{header_rest.strip()}{tag}\n"
                        lines[i] = new_line
                        changes += 1

                    # Find the Status: line and update/add it
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
                        # Look for any Status line to update
                        j = i + 1
                        while j < len(lines) and j < i + 10:
                            if lines[j].startswith("** "):
                                break
                            if "   - Status:" in lines[j]:
                                # Append new status after existing
                                lines.insert(j + 1, f"   - Status: {new_status}\n")
                                status_updated = True
                                changes += 1
                                break
                            j += 1

                    if not status_updated:
                        # Add status line after header
                        lines.insert(i + 1, f"   - Status: {new_status}\n")
                        changes += 1

                    del all_updates[num]
        i += 1

    if all_updates:
        print(f"WARNING: {len(all_updates)} packages not found in org file: {list(all_updates.keys())}")

    # Write atomically
    fd, tmp = tempfile.mkstemp(dir=".", suffix=".org")
    os.close(fd)
    with open(tmp, "w") as f:
        f.writelines(lines)
    shutil.move(tmp, ORG_FILE)
    print(f"Updated {ORG_FILE}: {changes} changes")


def update_packages_scm():
    """Add use-module and re-export block to packages.scm."""
    print(f"Reading {PACKAGES_SCM}...")
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    block = f"""
;; {PASS_ID} (22 NEEDS_RECIPE_DESIGN resolved, 8 BLOCKED)
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export (
               ttf-comfortaa
               python-convertdate
               zdbsp
               xst
               gpp
               everforest-gtk-theme-git
               python-telegram-send
               python-pyvis
               python-sioyek
               liboqs
               openssh-askpass-qt
               quickbib
               netcheck
               scalpel-git
               ))
"""

    content += block

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM) or ".", suffix=".scm")
    os.close(fd)
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_SCM)
    print(f"Updated {PACKAGES_SCM}")


def update_general_compat():
    """Add use-module and re-export lines to general-compat.scm."""
    print(f"Reading {GENERAL_COMPAT}...")
    with open(GENERAL_COMPAT, "r") as f:
        content = f.read()

    # Add use-module near the top (after existing use-modules)
    # Find the last #:use-module line in the define-module block
    lines = content.split("\n")

    # Find where to insert the use-module
    last_use_module_idx = -1
    for idx, line in enumerate(lines):
        if "#:use-module" in line and "gaurix packages" in line:
            last_use_module_idx = idx

    if last_use_module_idx == -1:
        # Find any #:use-module line
        for idx, line in enumerate(lines):
            if "#:use-module" in line:
                last_use_module_idx = idx

    if last_use_module_idx >= 0:
        lines.insert(last_use_module_idx + 1,
                      f"  #:use-module (gaurix packages {PASS_ID})")
    else:
        print("WARNING: Could not find insertion point for use-module")
        return

    # Add re-export lines at the end
    re_exports = [
        "",
        f";; {PASS_ID}",
    ]
    for name in NEW_RECIPES:
        re_exports.append(f"(re-export {name})")

    lines.extend(re_exports)

    content = "\n".join(lines)

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(GENERAL_COMPAT), suffix=".scm")
    os.close(fd)
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, GENERAL_COMPAT)
    print(f"Updated {GENERAL_COMPAT}")


def write_reports():
    """Write summary report."""
    import json

    summary = {
        "pass_id": PASS_ID,
        "date": "2026-04-23",
        "resolved_new_recipes": len(NEW_RECIPES),
        "resolved_already_packaged": len(ALREADY_PACKAGED),
        "total_resolved": len(NEW_RECIPES) + len(ALREADY_PACKAGED),
        "blocked": len(BLOCKED),
        "exhausted": len(EXHAUSTED),
        "total": len(NEW_RECIPES) + len(ALREADY_PACKAGED) + len(BLOCKED) + len(EXHAUSTED),
        "new_recipes": NEW_RECIPES,
        "already_packaged": {str(k): v[0] for k, v in ALREADY_PACKAGED.items()},
        "blocked_packages": {str(k): v[0] for k, v in BLOCKED.items()},
        "exhausted_packages": {str(k): v[0] for k, v in EXHAUSTED.items()},
    }

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print(f"Working directory: {os.getcwd()}")

    update_org_file()
    update_packages_scm()
    update_general_compat()
    write_reports()

    print(f"\nDone! {PASS_ID} bookkeeping complete.")
    print(f"  Resolved: {len(NEW_RECIPES)} new + {len(ALREADY_PACKAGED)} already-packaged = {len(NEW_RECIPES) + len(ALREADY_PACKAGED)}")
    print(f"  Blocked: {len(BLOCKED)}")
    print(f"  Exhausted: {len(EXHAUSTED)}")
    print(f"  Total: {len(NEW_RECIPES) + len(ALREADY_PACKAGED) + len(BLOCKED) + len(EXHAUSTED)}")
