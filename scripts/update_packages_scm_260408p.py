#!/usr/bin/env python3
"""
Deterministic programmatic update of packages.scm for recipe-resolver-260408p.

Adds:
  1. #:use-module entry for recipe-resolver-260408p
  2. #:re-export entries for all exported packages

All transforms: read → compute → write temp → atomic move.
"""

import os
import tempfile
import shutil

TARGET = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "guix", "gaurix", "packages.scm"
)

# Anchor: insert use-module after recipe-resolver-260408o
USE_MODULE_ANCHOR = "  #:use-module (gaurix packages recipe-resolver-260408o)"
USE_MODULE_NEW = "  #:use-module (gaurix packages recipe-resolver-260408p)"

# Exported packages from recipe-resolver-260408p
EXPORTED_PACKAGES = [
    "font-geist",
    "font-geist-mono",
    "profile-sync-daemon-zen",
    "sddm-theme-elegant-archlinux",
    "brokefetch",
    "empiriqa-bin",
    "tuitube-bin",
    "nosy-bin",
    "stto-bin",
    "ptui-bin",
    "terminal-fireworks",
    "deadlock-server-picker",
    "borse",
    "vhd2vl",
    "xcman",
    "pp-pager",
    "xtest-utility",
    "blacklist-check",
    "sc",
    "fujprog",
    "nautilus-code",
    "litestream",
    "resticprofile",
]

# Anchor: insert re-exports before closing )
CLOSING_PAREN = ")"


def main():
    with open(TARGET, "r") as f:
        content = f.read()

    if "recipe-resolver-260408p" in content:
        print("Already applied, skipping.")
        return

    lines = content.split("\n")
    new_lines = []

    use_module_inserted = False

    for line in lines:
        if not use_module_inserted and line == USE_MODULE_ANCHOR:
            new_lines.append(line)
            new_lines.append(USE_MODULE_NEW)
            use_module_inserted = True
            continue
        new_lines.append(line)

    # Add re-export entries before the final closing paren
    result = "\n".join(new_lines)

    # Find last ) and insert before it
    last_close = result.rstrip().rfind(")")
    if last_close > 0:
        export_block = "            ;; recipe-resolver-260408p\n"
        for pkg in EXPORTED_PACKAGES:
            export_block += f"            {pkg}\n"
        result = result[:last_close] + export_block + result[last_close:]

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(TARGET), suffix=".scm.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.write(result)
        shutil.move(tmp_path, TARGET)
        print(f"Updated {TARGET}")
    except:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
