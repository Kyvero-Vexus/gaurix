#!/usr/bin/env python3
"""Deterministic programmatic update for packages.scm and general-compat.scm.

Adds recipe-resolver-260416j module import and exports to both files.
Uses read→compute→write-temp→atomic-move pattern.
"""

import os
import shutil
import tempfile

REPO = "/home/slime/projects/gaurix"
PACKAGES_SCM = os.path.join(REPO, "guix/gaurix/packages.scm")
COMPAT_SCM = os.path.join(REPO, "guix/gaurix/packages/general-compat.scm")

NEW_MODULE = "recipe-resolver-260416j"
EXPORTS = [
    "ent",
    "dadaengine",
    "slibtool",
    "rgxg",
    "awesfx",
    "heapusage",
    "stackusage",
    "ntfs2btrfs",
    "libmaddy",
    "libbsc",
    "tagutil",
    "ltris2",
    "simsimd",
    "docformatter",
    "cfv",
    "bmaptool",
    "pyglossary",
    "python-shandy-sqlfmt",
    "perl-compress-raw-lzma",
    "git-store-meta",
    "duply",
    "mint-l-theme",
    "sound-theme-simple",
    "pipes-rs-bin",
    "prboom-plus",
    "gearboy",
    "somafm-tui",
    "python-textual-textarea",
    "gmusicbrowser",
    "breeze-enhanced",
]


def atomic_write(path, content):
    """Write content to a temp file then atomically move to path."""
    dirname = os.path.dirname(path)
    fd, tmp = tempfile.mkstemp(dir=dirname, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except Exception:
        os.unlink(tmp)
        raise


def update_packages_scm():
    """Add use-module and re-export entries to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # 1. Add #:use-module after recipe-resolver-260416i
    use_line = "  #:use-module (gaurix packages recipe-resolver-260416i)"
    new_use = f"  #:use-module (gaurix packages {NEW_MODULE})"
    if new_use not in content:
        content = content.replace(
            use_line,
            use_line + "\n" + new_use,
        )

    # 2. Add re-exports after the mandelbulber2 line in the #:re-export block
    export_marker = "            mandelbulber2\n))"
    export_lines = "\n".join(
        f"            {name}" for name in EXPORTS
    )
    new_block = (
        "            mandelbulber2\n"
        f"            ;;; {NEW_MODULE} recipes\n"
        f"{export_lines}\n"
        "))"
    )
    if NEW_MODULE not in content:
        content = content.replace(export_marker, new_block)

    atomic_write(PACKAGES_SCM, content)
    print(f"Updated {PACKAGES_SCM}")


def update_compat_scm():
    """Add use-module and re-export entries to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # 1. Add #:use-module after deptree-resolver-260416j
    use_line = "  #:use-module (gaurix packages deptree-resolver-260416j)"
    new_use = f"  #:use-module (gaurix packages {NEW_MODULE})"
    if new_use not in content:
        content = content.replace(
            use_line,
            use_line + "\n" + new_use,
        )

    # 2. Add re-exports at the end of the file
    reexport_lines = "\n".join(
        f"(re-export {name})" for name in EXPORTS
    )
    new_section = (
        f"\n;; {NEW_MODULE} recipes\n"
        f"{reexport_lines}\n"
    )
    if NEW_MODULE + " recipes" not in content:
        content = content.rstrip("\n") + new_section

    atomic_write(COMPAT_SCM, content)
    print(f"Updated {COMPAT_SCM}")


if __name__ == "__main__":
    update_packages_scm()
    update_compat_scm()
    print("Done.")
