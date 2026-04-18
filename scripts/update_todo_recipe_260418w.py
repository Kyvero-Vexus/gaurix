#!/usr/bin/env python3
"""Programmatically update general-compat.scm for recipe-resolver-260418w.

Deterministic full-file transform: read, compute, write temp, atomic move.
Adds #:use-module import and compatibility alias definitions.
"""

import os
import re
import tempfile
import shutil

COMPAT_FILE = "/home/slime/projects/gaurix/guix/gaurix/packages/general-compat.scm"
BATCH_ID = "recipe-resolver-260418w"

# (compat_name, source_name) — for most, they're the same
PACKAGES = [
    ("python-dashtable", "python-dashtable"),
    ("python-certbot-pkcs12", "python-certbot-pkcs12"),
    ("python-spitch", "python-spitch"),
    ("python-invocation-tree", "python-invocation-tree"),
    ("python-dukpy", "python-dukpy"),
    ("python-pyexcel-ezodf", "python-pyexcel-ezodf"),
    ("wallman", "wallman"),
    ("ttf-piazzolla", "ttf-piazzolla"),
    ("stardict-full-eng-rus", "stardict-full-eng-rus"),
    ("xdg-sound", "xdg-sound"),
    ("alttab", "alttab"),
    ("gekkfetch", "gekkfetch"),
    ("jellyfetch", "jellyfetch"),
    ("tombl-bin", "tombl-bin"),
    ("klog-time-tracker-bin", "klog-time-tracker-bin"),
    ("opkssh-bin", "opkssh-bin"),
    ("puma-dev-bin", "puma-dev-bin"),
    ("rqlite-bin", "rqlite-bin"),
    ("wdisplays-persistent", "wdisplays-persistent"),
]


def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    # 1. Add #:use-module line after the last existing #:use-module for
    #    a recipe-resolver or deptree-resolver
    use_module_line = f"  #:use-module (gaurix packages {BATCH_ID})\n"

    # Find the last #:use-module line for a resolver
    last_use_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages' in line and 'resolver' in line:
            last_use_idx = i

    if last_use_idx is not None:
        lines.insert(last_use_idx + 1, use_module_line)
    else:
        # Fallback: insert after the first #:use-module block
        for i, line in enumerate(lines):
            if line.strip().startswith('#:use-module') and 'gaurix' in line:
                last_use_idx = i
        if last_use_idx is not None:
            lines.insert(last_use_idx + 1, use_module_line)

    # 2. Append compat alias definitions at the end
    aliases = []
    aliases.append(f"\n;;; --- {BATCH_ID}: 19 compat aliases ---\n")
    for compat_name, source_name in PACKAGES:
        guix_sym = source_name.replace("-", "-")
        aliases.append(f"(define-public {compat_name}\n")
        aliases.append(f"  (package\n")
        aliases.append(f"    (inherit {source_name})\n")
        aliases.append(f"    (name \"{compat_name}\")))\n\n")

    lines.extend(aliases)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(COMPAT_FILE), suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, COMPAT_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Updated {COMPAT_FILE} with {len(PACKAGES)} compat aliases for {BATCH_ID}")


if __name__ == "__main__":
    main()
