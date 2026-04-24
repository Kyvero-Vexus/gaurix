#!/usr/bin/env python3
"""
Bookkeeping for deptree-resolver-260424u.

Updates:
1. todo_general_packages.org — status for all 98 packages
2. guix/gaurix/packages/general-compat.scm — add module import
3. guix/gaurix/packages.scm — add pass comment and package exports
4. Write summary report
"""

import json
import os
import re
import tempfile
import shutil

PASS_ID = "deptree-resolver-260424u"
ORG_FILE = "todo_general_packages.org"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
PACKAGES_FILE = "guix/gaurix/packages.scm"

# New recipes: org_number -> (aur_name, guix_name)
NEW_RECIPES = {
    17887: ("oqsprovider-git", "oqs-provider"),
    17889: ("slrn-snapshot-canlock", "slrn-canlock"),
    17810: ("better-control-git", "better-control"),
    17867: ("erwise", "erwise"),
    21782: ("gtk-theme-config", "gtk-theme-config"),
    17879: ("slxfig-snapshot", "slxfig-snapshot"),
    27646: ("vapoursynth-plugin-d2vsource-git", "d2vsource"),
    17927: ("pulseeffects-legacy", "pulseeffects-legacy"),
    17804: ("vinyl-git", "vinyl-theme"),
}

# Already in Guix: org_number -> (aur_name, guix_name, module)
ALREADY_IN_GUIX = {
    26185: ("gcc8", "gcc-toolchain@8", "(gnu packages commencement)"),
    19936: ("boost1.86-libs", "boost", "(gnu packages boost)"),
    20944: ("boost183-libs", "boost", "(gnu packages boost)"),
}

# Blocked: org_number -> (aur_name, reason)
BLOCKED = {
    19246: ("elp", "SOURCE_UNAVAILABLE"),
    11204: ("huawei-me936-udev", "SOURCE_UNAVAILABLE"),
    17812: ("squareline-studio", "SOURCE_UNAVAILABLE"),
    17945: ("euroscope-bin", "SOURCE_UNAVAILABLE"),
    17819: ("inkdrop", "SOURCE_UNAVAILABLE"),
    17468: ("bakkesmod-steam", "PLATFORM_UNSUPPORTED"),
    28671: ("android-platform-19", "ANDROID_SDK_PLATFORM"),
    23109: ("android-platform-21", "ANDROID_SDK_PLATFORM"),
    17797: ("brother-mfc-l2400dw", "NON_DISTRIBUTABLE"),
    20499: ("ttf-consolas-ligaturized", "NON_DISTRIBUTABLE"),
    17502: ("lib32-opencl-nvidia-390xx", "MULTILIB_UNSUPPORTED"),
    45410: ("lib32-libglade", "MULTILIB_UNSUPPORTED"),
    16491: ("lib32-libxpm", "MULTILIB_UNSUPPORTED"),
    22729: ("lib32-sdl_sound", "MULTILIB_UNSUPPORTED"),
    17255: ("capt-src", "MULTILIB_UNSUPPORTED"),
    17261: ("firestorm-next-bin", "MULTILIB_UNSUPPORTED"),
    17424: ("etlegacy32-mod", "MULTILIB_UNSUPPORTED"),
    17880: ("libch343ser-git", "KERNEL_MODULE"),
    20547: ("linux-gpib", "KERNEL_MODULE"),
    17912: ("libfprint-2-tod1-broadcom-cv3plus", "PROPRIETARY_BINARY"),
    2254: ("dropbox", "PROPRIETARY_BINARY"),
    17860: ("realvnc-rvnc-connect", "PROPRIETARY_BINARY"),
    35454: ("deepin-wine8-stable", "PROPRIETARY_BINARY"),
    1833: ("vmware-workstation", "PROPRIETARY_BINARY"),
    34115: ("mingw-w64-cblas", "MINGW_CROSS_COMPILATION"),
    34113: ("mingw-w64-lapack", "MINGW_CROSS_COMPILATION"),
    25121: ("mingw-w64-sqlite", "MINGW_CROSS_COMPILATION"),
    23783: ("mingw-w64-boost", "MINGW_CROSS_COMPILATION"),
    43750: ("mingw-w64-cppwinrt", "MINGW_CROSS_COMPILATION"),
    26805: ("mingw-w64-pcre2", "MINGW_CROSS_COMPILATION"),
    42666: ("mingw-w64-spirv-tools", "MINGW_CROSS_COMPILATION"),
    24572: ("mingw-w64-postgresql", "MINGW_CROSS_COMPILATION"),
    34112: ("mingw-w64-lame", "MINGW_CROSS_COMPILATION"),
    17970: ("electron23-bin", "OLD_ELECTRON"),
    17796: ("heroku-cli", "DEP_RESOLUTION_FAILED"),
    19028: ("lightdm-webkit-theme-aether", "DEP_RESOLUTION_FAILED"),
    17807: ("n8n", "DEP_RESOLUTION_FAILED"),
    17755: ("nvidia-bl-dkms", "KERNEL_MODULE"),
    17862: ("pacpak-git", "DISTRO_SPECIFIC"),
    17897: ("chromium-extension-arch-search", "DISTRO_SPECIFIC"),
    17940: ("pamac-cli", "DISTRO_SPECIFIC"),
    17822: ("python-pypi2pkgbuild", "DISTRO_SPECIFIC"),
    11354: ("aurutils", "DISTRO_SPECIFIC"),
    2160: ("auracle-git", "DISTRO_SPECIFIC"),
    14587: ("asp", "DISTRO_SPECIFIC"),
    17873: ("texmacs-pure", "MISSING_DEP"),
    17948: ("eclipse-pydev", "MISSING_DEP"),
    41720: ("smuxi-server", "MISSING_DEP"),
    22333: ("emerald", "MISSING_DEP"),
    17808: ("plasma6-applets-panon", "MISSING_DEP"),
    17433: ("clash-for-windows-chinese", "ABANDONED_UPSTREAM"),
    25153: ("python2-wxpython3", "LEGACY_PYTHON2"),
    37854: ("python2-dbus", "LEGACY_PYTHON2"),
    23210: ("python2-gimp", "LEGACY_PYTHON2"),
    37225: ("boost-python2", "LEGACY_PYTHON2"),
    18421: ("qtspim-iconfix", "BUILD_FAILED"),
    17921: ("zfs-linux-hardened-headers", "KERNEL_SPECIFIC"),
    17920: ("zfs-linux-rt-headers", "KERNEL_SPECIFIC"),
    17919: ("zfs-linux-git-headers", "KERNEL_SPECIFIC"),
    17909: ("kamilsss655-uv-k5-firmware-custom-git", "CROSS_COMPILATION"),
    17825: ("esp8266-rtos-sdk", "CROSS_COMPILATION"),
    17440: ("factorio-space-age-experimental", "NON_DISTRIBUTABLE"),
    35628: ("llvm40-libs", "OLD_VERSION_VARIANT"),
    33221: ("dotnet-runtime-5.0-bin", "EOL_VERSION"),
    32716: ("dotnet-runtime-6.0-bin", "EOL_VERSION"),
    44133: ("reduce-common", "COMPLEX_BUILD"),
    22584: ("perl-math-clipper", "COMPLEX_BUILD"),
    17933: ("anyrun-git", "COMPLEX_BUILD"),
    24418: ("shadow-selinux", "COMPLEX_BUILD"),
    17833: ("rpfm-git", "COMPLEX_BUILD"),
    17914: ("deadbeef-git", "COMPLEX_BUILD"),
    17814: ("audacious-plugins-git", "COMPLEX_BUILD"),
    21233: ("python-pylink-square", "COMPLEX_BUILD"),
    17824: ("envoyproxy", "COMPLEX_BUILD"),
    24719: ("glibc-eac", "COMPLEX_DEPS"),
    17925: ("freetube-electron-git", "COMPLEX_DEPS"),
    22161: ("darling-cli-devenv-gui-common-git", "COMPLEX_DEPS"),
    22171: ("darling-iosurface-git", "COMPLEX_DEPS"),
    19629: ("libga68-snapshot", "GCC_SNAPSHOT"),
    19625: ("libgfortran-snapshot", "GCC_SNAPSHOT"),
    19623: ("libgnat-snapshot", "GCC_SNAPSHOT"),
    19622: ("libgo-snapshot", "GCC_SNAPSHOT"),
    17278: ("python-jax-rocm", "ROCM_DEPENDENCY"),
    23279: ("quartus-free-quartus", "PROPRIETARY_PLATFORM"),
    17346: ("ffmpeg-cuda-full", "CUDA_DEPENDENCY"),
    17937: ("illogical-impulse-ags", "COMPLEX_BUILD"),
}


def update_org_file():
    """Update todo_general_packages.org with status changes."""
    print(f"Reading {ORG_FILE}...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    changes = 0
    all_updates = {}

    # New recipes -> DONE
    for num, (aur_name, guix_name) in NEW_RECIPES.items():
        status = (f"DONE: recipe generated in {PASS_ID}.scm "
                  f"(as {guix_name}) ({PASS_ID})")
        all_updates[num] = ("DONE", aur_name, status, f"  :{PASS_ID}:recipe-generated:")

    # Already in Guix -> DONE
    for num, (aur_name, guix_name, module) in ALREADY_IN_GUIX.items():
        status = (f"DONE: ALREADY_IN_GUIX — {guix_name} in {module} ({PASS_ID})")
        all_updates[num] = ("DONE", aur_name, status, f"  :{PASS_ID}:already-in-guix:")

    # Blocked -> BLOCKED (keep BLOCKED, add updated reason)
    for num, val in BLOCKED.items():
        if val is None:
            continue
        aur_name, reason = val
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

                    # Find/update the Status line
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

    # Add comment after first line of define-module
    comment = (f"            ;; {PASS_ID}: 98 BLOCKED evaluated "
               f"({len(NEW_RECIPES)} recipes, {len(ALREADY_IN_GUIX)} ALREADY_IN_GUIX, "
               f"{len(BLOCKED)} remain BLOCKED)")

    for i, line in enumerate(lines):
        if line.startswith('(define-module'):
            lines.insert(i + 1, comment)
            break

    # Find where to add exports - look for closing paren of module def
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
        for i, line in enumerate(lines):
            if line.strip() == ')' and i > 5:
                module_end = i
                break

    export_names = [guix_name for _, guix_name in NEW_RECIPES.values()]
    # Also add dep packages
    export_names.extend(["liboqs", "libcanlock-usenet"])

    if module_end:
        export_lines = []
        for name in sorted(export_names):
            export_lines.append(f"            {name}")
        for j, eline in enumerate(export_lines):
            lines.insert(module_end + j, eline)

    content = '\n'.join(lines)

    fd, tmp = tempfile.mkstemp(dir=".", suffix=".scm")
    os.close(fd)
    with open(tmp, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_FILE)
    print(f"  Added {len(export_names)} exports and pass comment")


def update_general_compat_reexports():
    """Add re-exports for new recipes to general-compat.scm."""
    print(f"Updating {COMPAT_FILE} with re-exports...")
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    export_names = [guix_name for _, guix_name in NEW_RECIPES.values()]
    export_names.extend(["liboqs", "libcanlock-usenet"])

    # Find where to add re-exports - at end of file before final blank lines
    lines = content.rstrip('\n').split('\n')

    # Add re-exports
    new_lines = [f"\n; {PASS_ID} recipes"]
    for name in sorted(export_names):
        reexport = f"(re-export {name})"
        if reexport not in content:
            new_lines.append(reexport)

    if len(new_lines) > 1:
        lines.extend(new_lines)
        content = '\n'.join(lines) + '\n'

        fd, tmp = tempfile.mkstemp(dir=".", suffix=".scm")
        os.close(fd)
        with open(tmp, "w") as f:
            f.write(content)
        shutil.move(tmp, COMPAT_FILE)
        print(f"  Added {len(new_lines) - 1} re-exports")
    else:
        print(f"  All re-exports already present")


def write_reports():
    """Write summary report."""
    summary = {
        "timestamp": "2026-04-24T18:00:00+00:00",
        "run_id": PASS_ID,
        "total_blocked_before": 98,
        "total_evaluated": len(NEW_RECIPES) + len(ALREADY_IN_GUIX) + len(BLOCKED),
        "recipes_created": len(NEW_RECIPES) + 2,  # +2 for liboqs, libcanlock deps
        "already_in_guix": len(ALREADY_IN_GUIX),
        "remaining_blocked": len(BLOCKED),
        "total_blocked_after": 98 - len(NEW_RECIPES) - len(ALREADY_IN_GUIX),
        "recipe_file": f"guix/gaurix/packages/{PASS_ID}.scm",
        "blocked_notes_file": f"guix/gaurix/packages/{PASS_ID}-blocked-notes.scm",
        "tree_artifacts": {
            "json": "reports/blocked-dependency-tree.json",
            "md": "reports/blocked-dependency-tree.md"
        },
        "recipe_names": [guix_name for _, guix_name in NEW_RECIPES.values()] + ["liboqs", "libcanlock-usenet"],
        "already_in_guix_names": {
            str(k): f"{v[0]} -> {v[1]} in {v[2]}"
            for k, v in ALREADY_IN_GUIX.items()
        },
        "blocking_reasons_summary": {},
    }

    # Group blocked by reason
    for num, val in BLOCKED.items():
        if val is None:
            continue
        name, reason = val
        if reason not in summary["blocking_reasons_summary"]:
            summary["blocking_reasons_summary"][reason] = 0
        summary["blocking_reasons_summary"][reason] += 1

    report_path = f"reports/{PASS_ID}-summary.json"
    with open(report_path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote {report_path}")


if __name__ == "__main__":
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    print(f"Working directory: {os.getcwd()}")
    print(f"Pass: {PASS_ID}")
    print()

    update_org_file()
    print()
    update_general_compat()
    print()
    update_general_compat_reexports()
    print()
    update_packages_scm()
    print()
    write_reports()

    print()
    print("=== Summary ===")
    print(f"New recipes: {len(NEW_RECIPES)} (+2 dep packages = {len(NEW_RECIPES) + 2} total)")
    for num, (aur, guix) in sorted(NEW_RECIPES.items()):
        print(f"  #{num}: {aur} -> {guix}")
    print(f"Already in Guix: {len(ALREADY_IN_GUIX)}")
    for num, (aur, guix, mod) in sorted(ALREADY_IN_GUIX.items()):
        print(f"  #{num}: {aur} -> {guix} in {mod}")
    print(f"Blocked: {len(BLOCKED)}")
    reason_counts = {}
    for num, val in BLOCKED.items():
        if val is None:
            continue
        name, reason = val
        reason_counts[reason] = reason_counts.get(reason, 0) + 1
    for reason, count in sorted(reason_counts.items(), key=lambda x: -x[1]):
        print(f"  {reason}: {count}")
