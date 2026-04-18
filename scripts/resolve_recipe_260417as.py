#!/usr/bin/env python3
"""Mark 30 packages as resolved by recipe-resolver-260417as in todo_general_packages.org."""

import os
import re
import tempfile
import shutil

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
PASS_ID = "recipe-resolver-260417as"

# NEW RECIPE packages: (package_name, details_string)
NEW_RECIPE = [
    ("twitch-cli-bin", "v1.1.24, copy-build-system, Apache-2.0"),
    ("fast-bin", "v0.0.4, copy-build-system, MIT"),
    ("lux-dl-bin", "v0.24.1, copy-build-system, MIT"),
    ("cheat-bin", "v5.1.0, copy-build-system, MIT"),
    ("spoofdpi-bin", "v1.3.1, copy-build-system, Apache-2.0"),
    ("circleci-cli-bin", "v0.1.34950, copy-build-system, MIT"),
    ("reader-bin", "v0.5.0, copy-build-system, GPL-3.0"),
    ("tvmv-bin", "v0.6.0, copy-build-system, GPL-3.0"),
    ("python-exifread", "v3.5.1, pyproject-build-system, BSD-3"),
    ("python-colorzero", "v2.0, python-build-system, BSD-3"),
    ("python-simber", "v0.2.6, python-build-system, MIT"),
    ("python-requirements-detector", "v1.5.0, pyproject-build-system, MIT"),
    ("python-itunespy", "v1.6.1, python-build-system, MIT"),
    ("python-geocoder", "v1.38.1, python-build-system, MIT"),
    ("python-vcstool", "v0.3.0, python-build-system, Apache-2.0"),
    ("python-pushbullet.py", "v0.12.0, python-build-system, MIT"),
    ("perl-mp3-tag", "v1.16, perl-build-system, Artistic/GPL"),
    ("perl-expect", "v1.38, perl-build-system, Artistic/GPL"),
    ("perl-rpc-xml", "v0.82, perl-build-system, Artistic/GPL"),
    ("perl-linux-desktopfiles", "v0.26, perl-build-system, Artistic-2.0"),
]

# ALREADY_RESOLVED packages: (package_name, details_string)
ALREADY_RESOLVED = [
    ("ffsend-bin", "already packaged in gaurix channel"),
    ("kopia-bin", "already packaged in gaurix channel"),
    ("stack-bin", "already packaged in gaurix channel"),
    ("perl-io-stty", "already packaged in channel (recipe-resolver-260417aj)"),
    ("perl-crypt-rijndael", "already in upstream Guix (gnu/packages/perl.scm)"),
    ("perl-extutils-xspp", "already in upstream Guix (gnu/packages/perl.scm)"),
    ("perl-xml-dom", "already in upstream Guix (gnu/packages/xml.scm)"),
    ("perl-env-path", "already in upstream Guix (gnu/packages/perl.scm)"),
    ("perl-posix-strftime-compiler", "already in upstream Guix (gnu/packages/perl.scm)"),
    ("ruby-archive-tar-minitar", "already in upstream Guix as ruby-minitar"),
]


def main():
    with open(TODO_FILE, "r") as f:
        lines = f.readlines()

    header_re = re.compile(r'^(\*\* )(FAILED|TODO)( \d+\.\s+)(.+)$')

    updated_count = 0
    not_found = []

    # Build combined package list with status lines
    all_packages = []
    for pkg_name, details in NEW_RECIPE:
        status_line = (
            f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — "
            f"recipe in {PASS_ID}.scm "
            f"({details}) "
            f"({PASS_ID})\n"
        )
        all_packages.append((pkg_name, status_line))

    for pkg_name, details in ALREADY_RESOLVED:
        status_line = (
            f"   - Status: DONE: ALREADY_RESOLVED: "
            f"{details} "
            f"({PASS_ID})\n"
        )
        all_packages.append((pkg_name, status_line))

    for pkg_name, status_line in all_packages:
        # Find all header indices for this package
        indices = []
        for i, line in enumerate(lines):
            m = header_re.match(line.rstrip('\n'))
            if m:
                header_pkg = m.group(4).strip()
                if header_pkg == pkg_name:
                    indices.append(i)

        if not indices:
            not_found.append(pkg_name)
            continue

        # Process from bottom to top so insertions don't shift earlier line numbers
        for idx in reversed(indices):
            # 1. Change FAILED/TODO to DONE in the header
            line = lines[idx]
            new_line = re.sub(r'^(\*\* )(FAILED|TODO)', r'\1DONE', line)
            lines[idx] = new_line

            # 2. Find the end of this entry (next "** " header or EOF)
            j = idx + 1
            while j < len(lines):
                if lines[j].startswith('** '):
                    break
                j += 1

            # Walk backwards from j to skip trailing blank lines
            k = j - 1
            while k > idx and lines[k].strip() == '':
                k -= 1
            # k is the last content line; insert after it
            insert_at = k + 1

            lines.insert(insert_at, status_line)
            updated_count += 1

    # Write atomically via tempfile + move
    dir_name = os.path.dirname(TODO_FILE)
    fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix='.tmp')
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp_path, TODO_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {updated_count} entries for {len(all_packages) - len(not_found)} packages.")
    if not_found:
        print(f"NOT FOUND ({len(not_found)}): {', '.join(not_found)}")
    else:
        print("All packages found and updated.")


if __name__ == "__main__":
    main()
