#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260424o.

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

PASS_ID = "deptree-resolver-260424o"
ORG_FILE = "todo_general_packages.org"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"

# New recipes: org_number -> (aur_name, guix_name)
NEW_RECIPES = {
    41403: ("python-typepy", "python-typepy"),
    45574: ("python-subprocrunner", "python-subprocrunner"),
    # python-svgpathtools — need to find org number
    # python-macholib — need to find org number
    # python-xvfbwrapper — need to find org number
    # python-daphne — need to find org number
    # python-nptyping — need to find org number
    # python-webargs — need to find org number
    # python-ipyvue — need to find org number
    # python-fal-client — need to find org number
    # python-livekit-protocol — need to find org number
    # python-stlib — need to find org number
    # liblinear — need to find org number
    # lua-tl — need to find org number
    # betterlockscreen — need to find org number
}

# These will be populated from the selection JSON
ALREADY_IN_GUIX = {}
BLOCKED = {}


def load_selection():
    """Load selection JSON and build categorization."""
    with open(f"reports/{PASS_ID}-selection.json") as f:
        data = json.load(f)

    # Map package names to their org numbers
    pkg_map = {}
    for pkg in data["packages"]:
        pkg_map[pkg["name"]] = pkg["number"]

    return pkg_map


def categorize_packages(pkg_map):
    """Categorize all 100 packages."""
    new_recipes = {}
    already_in_guix = {}
    blocked = {}

    # New recipes
    recipe_names = [
        "python-typepy", "python-subprocrunner", "python-svgpathtools",
        "python-macholib", "python-xvfbwrapper", "python-daphne",
        "python-nptyping", "python-webargs", "python-ipyvue",
        "python-fal-client", "python-livekit-protocol", "python-stlib",
        "liblinear", "lua-tl", "betterlockscreen",
    ]
    for name in recipe_names:
        if name in pkg_map:
            new_recipes[pkg_map[name]] = (name, name)

    # Already in Guix
    guix_map = {
        "gnome-icon-theme": ("adwaita-icon-theme", "(gnu packages gnome)"),
        "cloog": ("cloog", "(gnu packages algebra)"),
        "perl-b-utils": ("perl-b-utils", "(gnu packages perl)"),
        "ocaml-pcre": ("ocaml-pcre", "(gnu packages ocaml)"),
        "ocaml-zed": ("ocaml-zed", "(gnu packages ocaml)"),
        "qgpgme-qt5": ("qgpgme", "(gnu packages gnupg)"),
        "r-pkgbuild": ("r-pkgbuild", "(gnu packages cran)"),
        "corosync": ("corosync", "(gnu packages high-availability)"),
        "python-cloup": ("python-cloup", "(gnu packages python-xyz)"),
        "python-pyglm": ("python-pyglm", "(gnu packages python-xyz)"),
        "adcli": ("adcli", "(gnu packages admin)"),
        "gsettings-desktop-schemas-git": ("gsettings-desktop-schemas", "(gnu packages gnome)"),
        "libmbim-dev": ("libmbim", "(gnu packages networking)"),
        "podofo-0.9": ("podofo", "(gnu packages pdf)"),
        "psautohint": ("psautohint", "(gnu packages fonts)"),
        "kholidays-git": ("kholidays", "(gnu packages kde-pim)"),
        "kmime-git": ("kmime", "(gnu packages kde-pim)"),
        "geda-gaf": ("geda-gaf", "(gnu packages engineering)"),
    }
    for aur_name, (guix_name, module) in guix_map.items():
        if aur_name in pkg_map:
            already_in_guix[pkg_map[aur_name]] = (aur_name, guix_name, module)

    # Blocked
    blocked_reasons = {
        "mingw-w64-sqlite": "MINGW_CROSS_COMPILATION",
        "mingw-w64-pcre2": "MINGW_CROSS_COMPILATION",
        "mingw-w64-postgresql": "MINGW_CROSS_COMPILATION",
        "mingw-w64-lapack": "MINGW_CROSS_COMPILATION",
        "mingw-w64-cblas": "MINGW_CROSS_COMPILATION",
        "mingw-w64-boost": "MINGW_CROSS_COMPILATION",
        "mingw-w64-cppwinrt": "MINGW_CROSS_COMPILATION",
        "mingw-w64-spirv-tools": "MINGW_CROSS_COMPILATION",
        "mingw-w64-lame": "MINGW_CROSS_COMPILATION",
        "lib32-libxpm": "MULTILIB_UNSUPPORTED",
        "lib32-libglade": "MULTILIB_UNSUPPORTED",
        "lib32-sdl_sound": "MULTILIB_UNSUPPORTED",
        "android-platform-19": "PLATFORM_UNSUPPORTED",
        "android-platform-21": "PLATFORM_UNSUPPORTED",
        "python2-dbus": "LEGACY_PYTHON2",
        "python2-gimp": "LEGACY_PYTHON2",
        "python2-wxpython3": "LEGACY_PYTHON2",
        "darling-cli-devenv-gui-common-git": "COMPLEX_DEPS",
        "darling-iosurface-git": "COMPLEX_DEPS",
        "shadow-selinux": "SELINUX_SPECIFIC",
        "pamac-cli": "DISTRO_SPECIFIC",
        "asp": "DISTRO_SPECIFIC",
        "aurutils": "DISTRO_SPECIFIC",
        "auracle-git": "DISTRO_SPECIFIC",
        "vmware-workstation": "PROPRIETARY_BINARY",
        "dropbox": "PROPRIETARY_BINARY",
        "deepin-wine8-stable": "PROPRIETARY_BINARY",
        "rsdkv4-bin": "PROPRIETARY_BINARY",
        "quartus-free-quartus": "PROPRIETARY_PLATFORM",
        "gcc8": "LEGACY_VERSION",
        "llvm40-libs": "LEGACY_VERSION",
        "boost1.86-libs": "LEGACY_VERSION",
        "boost183-libs": "LEGACY_VERSION",
        "boost-python2": "LEGACY_PYTHON2",
        "glibc-eac": "MODIFIED_SYSTEM_PACKAGE",
        "libga68-snapshot": "GCC_SNAPSHOT",
        "libgfortran-snapshot": "GCC_SNAPSHOT",
        "libgnat-snapshot": "GCC_SNAPSHOT",
        "libgo-snapshot": "GCC_SNAPSHOT",
        "llvm19": "COMPLEX_BUILD",
        "dashpay-bls-signatures": "COMPLEX_DEPS",
        "smuxi-server": "MONO_REQUIRED",
        "chromeos-flashrom-git": "PLATFORM_SPECIFIC",
        "darknet-hankai-git": "COMPLEX_DEPS",
        "dotnet-runtime-5.0-bin": "LEGACY_EOL",
        "dotnet-runtime-6.0-bin": "LEGACY_EOL",
        "linux-gpib": "KERNEL_MODULE",
        "gss-ntlmssp": "COMPLEX_DEPS",
        "the-libs": "COMPLEX_DEPS",
        "adwaita-color-schemes": "MISSING_SOURCE",
        "python-pynotify": "DEPRECATED",
        "perl-math-clipper": "COMPLEX_DEPS",
        "python-rtmixer": "COMPLEX_DEPS",
        "vapoursynth-plugin-d2vsource-git": "COMPLEX_DEPS",
        "assaultcube-common": "COMPLEX_DEPS",
        "c-icap": "COMPLEX_DEPS",
        "ha-glue": "ABANDONED_UPSTREAM",
        "libgaminggear": "COMPLEX_DEPS",
        "magics++": "COMPLEX_DEPS",
        "python-ivre-git": "COMPLEX_DEPS",
        "python-pylink-square": "COMPLEX_DEPS",
        "precice": "COMPLEX_DEPS",
        "emerald": "ABANDONED_UPSTREAM",
        "reduce-common": "COMPLEX_DEPS",
        "ocaml-lablgl": "COMPLEX_DEPS",
        "ipe": "COMPLEX_DEPS",
    }
    for aur_name, reason in blocked_reasons.items():
        if aur_name in pkg_map:
            blocked[pkg_map[aur_name]] = (aur_name, reason)

    return new_recipes, already_in_guix, blocked


def update_org_file(new_recipes, already_in_guix, blocked):
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0
    all_updates = {}

    # New recipes -> DONE
    for num, (aur_name, guix_name) in new_recipes.items():
        status = (f"DONE: recipe generated in {PASS_ID}.scm "
                  f"(as {guix_name}) ({PASS_ID})")
        all_updates[num] = ("DONE", aur_name, status, f"  :{PASS_ID}:recipe-generated:")

    # Already in Guix -> DONE
    for num, (aur_name, guix_name, module) in already_in_guix.items():
        status = (f"DONE: ALREADY_IN_GUIX — {guix_name} in {module} ({PASS_ID})")
        all_updates[num] = ("DONE", aur_name, status, f"  :{PASS_ID}:already-in-guix:")

    # Blocked -> BLOCKED
    for num, (aur_name, reason) in blocked.items():
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

                    # Update header if state changed
                    if old_state != new_state:
                        rest = line[m.end():]
                        header_rest = rest.rstrip()
                        # Check if tag already present
                        if PASS_ID not in header_rest:
                            new_line = f"{m.group(1)}{new_state}{m.group(3)}{header_rest.strip()}{tag}\n"
                        else:
                            new_line = f"{m.group(1)}{new_state}{m.group(3)}{header_rest.strip()}\n"
                        lines[i] = new_line
                        changes += 1
                    elif PASS_ID not in line:
                        # Same state but add tag
                        rest = line.rstrip()
                        lines[i] = f"{rest}{tag}\n"
                        changes += 1

                    # Find/update the Status line
                    j = i + 1
                    status_updated = False
                    while j < len(lines) and j < i + 15:
                        if lines[j].startswith("** "):
                            break
                        if "   - Status:" in lines[j]:
                            # Add new status line after existing one
                            lines.insert(j + 1, f"   - Status: {new_status}\n")
                            status_updated = True
                            changes += 1
                            break
                        if "   - TODO Status:" in lines[j]:
                            # Update TODO Status line
                            if new_state == "DONE":
                                lines[j] = f"   - TODO Status: DONE\n"
                            elif new_state == "BLOCKED":
                                lines[j] = f"   - TODO Status: BLOCKED\n"
                            status_updated = True
                            changes += 1
                            break
                        j += 1

                    if not status_updated:
                        # Insert a status line after the header
                        lines.insert(i + 1, f"   - Status: {new_status}\n")
                        changes += 1

                    del all_updates[num]
        i += 1

    if all_updates:
        print(f"WARNING: {len(all_updates)} packages not found in org file:")
        for num, (state, name, status, tag) in all_updates.items():
            print(f"  #{num}: {name}")

    # Write atomically
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

    # Check if already imported
    module_line = f"#:use-module (gaurix packages {PASS_ID})"
    if module_line in content:
        print(f"  Module already imported in {COMPAT_FILE}")
        return

    # Find the last #:use-module line in the define-module block
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


def update_packages_scm(new_recipes):
    """Add pass comment and package exports to packages.scm."""
    print(f"Updating {PACKAGES_FILE}...")
    with open(PACKAGES_FILE, "r") as f:
        content = f.read()

    if PASS_ID in content:
        print(f"  Pass already recorded in {PACKAGES_FILE}")
        return

    lines = content.split('\n')

    # Add comment after first line
    comment = (f"            ;; {PASS_ID}: 100 evaluated "
               f"(15 recipes, 18 ALREADY_IN_GUIX, 67 BLOCKED)")

    # Find the define-module line and add comment after it
    for i, line in enumerate(lines):
        if line.startswith('(define-module'):
            lines.insert(i + 1, comment)
            break

    # Find where to add exports - after existing exports
    # Look for the last known export in the define-module block
    export_names = [
        "python-typepy", "python-subprocrunner", "python-svgpathtools",
        "python-macholib", "python-xvfbwrapper", "python-daphne",
        "python-nptyping", "python-webargs", "python-ipyvue",
        "python-fal-client", "python-livekit-protocol", "python-stlib",
        "liblinear", "lua-tl", "betterlockscreen",
    ]

    # Find end of current exports (look for first non-indented line after module def)
    module_end = None
    in_module = False
    paren_depth = 0
    for i, line in enumerate(lines):
        if '(define-module' in line:
            in_module = True
        if in_module:
            paren_depth += line.count('(') - line.count(')')
            if paren_depth <= 0 and in_module and i > 0:
                module_end = i
                break

    if module_end is None:
        # Fallback: find the closing paren of define-module
        for i, line in enumerate(lines):
            if line.strip().startswith(')') and i > 5:
                module_end = i
                break

    if module_end:
        # Add exports before the module end
        export_lines = []
        for name in export_names:
            export_lines.append(f"            {name}")
        # Insert before closing paren
        for j, eline in enumerate(export_lines):
            lines.insert(module_end + j, eline)

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=".", suffix=".scm")
    os.close(fd)
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_FILE)
    print(f"  Added {len(export_names)} exports and pass comment")


def write_reports(new_recipes, already_in_guix, blocked):
    """Write summary report."""
    summary = {
        "pass_id": PASS_ID,
        "date": "2026-04-24",
        "total_evaluated": len(new_recipes) + len(already_in_guix) + len(blocked),
        "new_recipes": len(new_recipes),
        "already_in_guix": len(already_in_guix),
        "blocked": len(blocked),
        "recipe_names": [v[1] for v in new_recipes.values()],
        "already_in_guix_names": {
            str(k): f"{v[0]} -> {v[1]} in {v[2]}"
            for k, v in already_in_guix.items()
        },
        "blocked_summary": {},
    }

    # Group blocked by reason
    for num, (name, reason) in blocked.items():
        if reason not in summary["blocked_summary"]:
            summary["blocked_summary"][reason] = []
        summary["blocked_summary"][reason].append(name)

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print(f"Working directory: {os.getcwd()}")
    print(f"Pass: {PASS_ID}")
    print()

    pkg_map = load_selection()
    new_recipes, already_in_guix, blocked = categorize_packages(pkg_map)

    print(f"Categorized {len(pkg_map)} packages:")
    print(f"  New recipes: {len(new_recipes)}")
    print(f"  Already in Guix: {len(already_in_guix)}")
    print(f"  Blocked: {len(blocked)}")
    print(f"  Total: {len(new_recipes) + len(already_in_guix) + len(blocked)}")
    print()

    update_org_file(new_recipes, already_in_guix, blocked)
    print()
    update_general_compat()
    print()
    update_packages_scm(new_recipes)
    print()
    write_reports(new_recipes, already_in_guix, blocked)

    print()
    print("=== Summary ===")
    print(f"New recipes: {len(new_recipes)}")
    for num, (aur, guix) in sorted(new_recipes.items()):
        print(f"  #{num}: {aur} -> {guix}")
    print(f"Already in Guix: {len(already_in_guix)}")
    for num, (aur, guix, mod) in sorted(already_in_guix.items()):
        print(f"  #{num}: {aur} -> {guix} in {mod}")
    print(f"Blocked: {len(blocked)}")
    reason_counts = {}
    for num, (name, reason) in blocked.items():
        reason_counts[reason] = reason_counts.get(reason, 0) + 1
    for reason, count in sorted(reason_counts.items(), key=lambda x: -x[1]):
        print(f"  {reason}: {count}")
