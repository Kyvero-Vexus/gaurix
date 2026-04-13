#!/usr/bin/env python3
"""Add recipe-resolver-260413k to general-compat.scm."""

import tempfile
import shutil
import os

COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"

# use-module to add
NEW_MODULE = "(gaurix packages recipe-resolver-260413k)"

# Compat aliases (AUR name -> Guix variable, for cases where names differ)
COMPAT_ALIASES = [
    # ("aur-name", "guix-variable")
    ("pisek-git", "pisek"),
    ("wlr-dpms-git", "wlr-dpms"),
    ("wl-gears-git", "wl-gears"),
    ("xdgctl-git", "xdgctl"),
    ("ksnip-git", "snoop"),  # NOT ksnip, just skip this - ksnip is blocked
]
# Actually only the ones that are RESOLVED and have different AUR names
COMPAT_ALIASES = [
    ("pisek-git", "pisek"),
    ("wlr-dpms-git", "wlr-dpms"),
    ("wl-gears-git", "wl-gears"),
    ("xdgctl-git", "xdgctl"),
]


def main():
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add use-module near the top (after the last existing use-module line)
    lines = content.split("\n")
    last_use_module_idx = 0
    for i, line in enumerate(lines):
        if line.strip().startswith("#:use-module"):
            last_use_module_idx = i

    if last_use_module_idx > 0:
        lines.insert(last_use_module_idx + 1, f"  #:use-module {NEW_MODULE}")

    # Add compat aliases at the end
    lines.append("")
    lines.append("; --- recipe-resolver-260413k compat aliases ---")
    for aur_name, guix_var in COMPAT_ALIASES:
        lines.append(f'(define-public {aur_name} (package (inherit {guix_var}) (name "{aur_name}")))')

    content = "\n".join(lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_SCM), suffix=".scm.tmp")
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.write(content)
        shutil.move(tmp_path, COMPAT_SCM)
    except:
        os.unlink(tmp_path)
        raise

    print(f"Updated {COMPAT_SCM}: added 1 module import and {len(COMPAT_ALIASES)} compat aliases")


if __name__ == "__main__":
    main()
