#!/usr/bin/env python3
"""Programmatically update packages.scm and general-compat.scm for recipe-resolver-260417y."""
import shutil
import tempfile

PACKAGES_SCM = "guix/gaurix/packages.scm"
COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"

# New package symbols exported from recipe-resolver-260417y
NEW_PACKAGES = [
    "perl-cpan-distnameinfo",
    "perl-const-fast",
    "perl-data-printer",
    "perl-object-pad",
    "salome-configuration",
    "janet",
    "pyghmi",
    "python-uritools",
    "python-pyhanko-certvalidator",
    "python-pyhanko",
    "python-certomancer-csc-dummy",
    "python-pdf2doi",
    "python-typedunits",
    "python-ompython",
    "anyfetch",
    "venice-cli-bin",
    "plugdata-bin",
    "blink-player-bin",
    "famistudio-bin",
    "dcvviewer-bin",
    "pdfmerger",
    "nview",
    "python-trezor",
    "alsaplayer",
    "svxlink-sounds-en-us-heather",
    "adbmanager-bin",
]

PASS_COMMENT = "            ;; recipe-resolver-260417y (26 NRD resolved, 4 BLOCKED)\n"
MODULE_IMPORT = "  #:use-module (gaurix packages recipe-resolver-260417y)\n"


def update_packages_scm():
    """Add new exports to packages.scm (before closing paren)."""
    with open(PACKAGES_SCM, 'r') as f:
        content = f.read()

    lines = content.split('\n')

    # Find the line with the closing )) of the module export list
    # The file structure is:
    # (define-module (gaurix packages)
    #     ;; comments
    #     symbol1
    #     symbol2
    #     ...
    #     last-symbol
    #     ))
    #
    # Find the last )) line
    close_idx = None
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == '))':
            close_idx = i
            break

    if close_idx is None:
        raise ValueError("Could not find closing )) in packages.scm")

    # Insert the pass comment and new exports before ))
    new_lines = [PASS_COMMENT.rstrip()]
    for pkg in NEW_PACKAGES:
        new_lines.append(f"            {pkg}")

    # Insert before the ))
    for j, new_line in enumerate(new_lines):
        lines.insert(close_idx + j, new_line)

    new_content = '\n'.join(lines)

    with tempfile.NamedTemporaryFile(mode='w', dir='.', delete=False, suffix='.tmp') as tmp:
        tmp.write(new_content)
        tmp_path = tmp.name
    shutil.move(tmp_path, PACKAGES_SCM)
    print(f"Updated {PACKAGES_SCM}: added {len(NEW_PACKAGES)} exports")


def update_compat_scm():
    """Add module import and re-exports to general-compat.scm."""
    with open(COMPAT_SCM, 'r') as f:
        lines = f.readlines()

    # 1. Add #:use-module import after the last gaurix recipe-resolver import
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages recipe-resolver-' in line:
            last_use_module_idx = i

    if last_use_module_idx is None:
        raise ValueError("Could not find recipe-resolver use-module lines in general-compat.scm")

    lines.insert(last_use_module_idx + 1, MODULE_IMPORT)

    # 2. Add re-exports at the end (before any trailing newline)
    # Find the last non-empty line
    last_idx = len(lines) - 1
    while last_idx > 0 and lines[last_idx].strip() == '':
        last_idx -= 1

    re_exports = []
    for pkg in NEW_PACKAGES:
        re_exports.append(f"(re-export {pkg})\n")

    # Insert after last non-empty line
    for j, re_exp in enumerate(re_exports):
        lines.insert(last_idx + 1 + j, re_exp)

    with tempfile.NamedTemporaryFile(mode='w', dir='.', delete=False, suffix='.tmp') as tmp:
        tmp.writelines(lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, COMPAT_SCM)
    print(f"Updated {COMPAT_SCM}: added module import and {len(NEW_PACKAGES)} re-exports")


if __name__ == '__main__':
    update_packages_scm()
    update_compat_scm()
