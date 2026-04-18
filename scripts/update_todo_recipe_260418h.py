#!/usr/bin/env python3
"""Update todo_general_packages.org: mark packages as DONE or BLOCKED for recipe-resolver-260418h."""

import os
import re
import tempfile

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"

# Packages to mark DONE: (pkg_num, name, status_note)
DONE_PACKAGES = [
    (5642, "ttf-symbola", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (font-build-system, v14.00, custom license)"),
    (5643, "otf-symbola", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (font-build-system, v14.00, custom license)"),
    (8730, "svxlink-sounds-en_us-heather-16k", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v25.05, GPL-2.0)"),
    (8695, "devkit-env", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (trivial-build-system, v1.0.1, GPL-3.0+)"),
    (8766, "random", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v1.3, MIT)"),
    (8775, "kak-ansi", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v0.2.8, Unlicense)"),
    (8813, "jelly", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v3.5.0, 0BSD)"),
    (6025, "fladder-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v0.10.3, GPL-3.0+)"),
    (7886, "parm-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v0.1.6, GPL-3.0)"),
    (7908, "opendeck-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v2.11.1, GPL-3.0+)"),
    (8045, "vkd3d-proton-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v3.0b, LGPL-2.1+)"),
    (8069, "piliplus-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v2.0.4, GPL-3.0+)"),
    (5956, "hyprshell-bin", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v4.9.5, MIT)"),
    (5578, "python-pandas-docs", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v2.2.3, BSD-3)"),
    (8827, "desktopius", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (meson-build-system, v1.0.8, GPL-3.0+)"),
    (8704, "nextcloud-app-user-usage-report", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v4.0.0, AGPL-3.0+)"),
    (8809, "kak-bundle-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, git, 0BSD)"),
    (8642, "duperemove-service", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v1.1.0, GPL-3.0+)"),
    (5959, "tlp-rdw-systemd", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v1.0.1, GPL-3.0+)"),
    (8754, "mii_emu", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v1.97, MIT)"),
    (6021, "sedutil", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v1.49.13, GPL-3.0+)"),
    (5577, "motion-git", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v4.7.1, GPL-2.0+)"),
    (5987, "nikki-editor", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v0.2.1, MIT)"),
    (8821, "responder", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (pyproject-build-system, v3.1.7.0, GPL-3.0+)"),
    (7991, "libreoffice-extension-h2orestart", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (copy-build-system, v0.7.11, GPL-3.0+)"),
    (7983, "pipewire-module-xrdp", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (gnu-build-system, v0.2, MIT)"),
    (8635, "libnick", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (cmake-build-system, v2025.10.0, GPL-3.0+)"),
    (8731, "maddy", "DONE: NEEDS_RECIPE_DESIGN resolved — recipe in recipe-resolver-260418h.scm (go-build-system, v0.7.1, GPL-3.0+)"),
]

# Packages to mark BLOCKED: (pkg_num, name, status_note)
BLOCKED_PACKAGES = [
    (7867, "gde-creator-bin", "BLOCKED: NEEDS_RECIPE_DESIGN — NO_LICENSE: upstream repo has no license file; GitHub licenseInfo null; AUR says MIT but no upstream evidence"),
    (6000, "rice-switcher", "BLOCKED: NEEDS_RECIPE_DESIGN — UPSTREAM_DELETED: repo S1rEx1/Rice-Switcher returns 404; no forks found; no archive available"),
]


def main():
    # Build lookup dicts: name -> (pkg_num, new_status, note)
    # new_status is "DONE" or "BLOCKED"
    done_lookup = {}
    for pkg_num, name, note in DONE_PACKAGES:
        done_lookup[name] = (pkg_num, "DONE", note)

    blocked_lookup = {}
    for pkg_num, name, note in BLOCKED_PACKAGES:
        blocked_lookup[name] = (pkg_num, "BLOCKED", note)

    # Merge into one lookup
    all_lookup = {}
    all_lookup.update(done_lookup)
    all_lookup.update(blocked_lookup)

    # Build regex patterns for each package
    # Match lines like: ** FAILED 5642. ttf-symbola  or  ** BLOCKED 8695. devkit-env
    # The name needs to be escaped for regex
    patterns = {}
    for name, (pkg_num, new_status, note) in all_lookup.items():
        escaped_name = re.escape(name)
        # Match header line: ** (FAILED|BLOCKED|TODO) <num>. <name> [optional tags/whitespace]
        pattern = re.compile(
            r'^(\*\* )(FAILED|BLOCKED|TODO)( ' + str(pkg_num) + r'\. ' + escaped_name + r')(.*)$'
        )
        patterns[name] = (pattern, pkg_num, new_status, note)

    print(f"Reading {TODO_FILE}...")
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    print(f"Read {len(lines)} lines.")

    modified_headers = 0
    inserted_notes = 0
    modifications = {}  # line_num -> (name, new_status)

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        matched = False

        for name, (pattern, pkg_num, new_status, note) in patterns.items():
            if name in modifications.values():
                continue
            m = pattern.match(line.rstrip('\n'))
            if m:
                prefix = m.group(1)       # "** "
                old_status = m.group(2)    # "FAILED" or "BLOCKED"
                num_and_name = m.group(3)  # " 5642. ttf-symbola"
                rest = m.group(4)          # optional tags etc.

                if new_status == "DONE":
                    # Add tags to header line
                    tag_str = "  :recipe-resolver-260418h:recipe-generated:"
                    new_header = f"{prefix}{new_status}{num_and_name}{tag_str}\n"
                else:
                    # BLOCKED - keep rest as is
                    new_header = f"{prefix}{new_status}{num_and_name}{rest}\n"

                new_lines.append(new_header)
                # Insert the status note on the next line
                note_line = f"   - Status: {note}\n"
                new_lines.append(note_line)

                modified_headers += 1
                inserted_notes += 1
                modifications[i + 1] = name  # 1-indexed line number
                print(f"  Line {i + 1}: {old_status} -> {new_status} for {name} (pkg {pkg_num})")

                matched = True
                break

        if not matched:
            new_lines.append(line)

        i += 1

    print(f"\nModified {modified_headers} header lines.")
    print(f"Inserted {inserted_notes} status note lines.")
    print(f"Total lines changed: {modified_headers + inserted_notes}")

    # Check all packages were found
    found_names = set(modifications.values())
    for name in all_lookup:
        if name not in found_names:
            print(f"  WARNING: Package '{name}' was NOT found!")

    # Write atomically
    dir_name = os.path.dirname(TODO_FILE)
    fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix='.org.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(new_lines)
        os.rename(tmp_path, TODO_FILE)
        print(f"\nAtomically wrote {len(new_lines)} lines to {TODO_FILE}")
    except:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
