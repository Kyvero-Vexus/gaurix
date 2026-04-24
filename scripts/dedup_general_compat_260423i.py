#!/usr/bin/env python3
"""
Deduplicate re-exports in general-compat.scm.
Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"


def main():
    with open(GENERAL_COMPAT, "r") as f:
        lines = f.readlines()

    output = []
    seen_re_exports = set()
    seen_use_modules = set()
    dupes_removed = 0

    for line in lines:
        stripped = line.strip()

        # Deduplicate (re-export ...) lines
        if stripped.startswith("(re-export "):
            if stripped in seen_re_exports:
                dupes_removed += 1
                continue
            seen_re_exports.add(stripped)

        # Deduplicate #:use-module lines
        if "#:use-module" in stripped:
            if stripped in seen_use_modules:
                dupes_removed += 1
                continue
            seen_use_modules.add(stripped)

        output.append(line)

    # Write atomically
    with tempfile.NamedTemporaryFile(mode="w", dir=GENERAL_COMPAT.parent,
                                      delete=False, suffix=".tmp") as tmp:
        tmp.writelines(output)
        tmp_path = Path(tmp.name)
    shutil.move(str(tmp_path), str(GENERAL_COMPAT))

    print(f"Deduplicated general-compat.scm: removed {dupes_removed} duplicate lines")
    print(f"  Unique re-exports: {len(seen_re_exports)}")
    print(f"  Unique use-modules: {len(seen_use_modules)}")


if __name__ == "__main__":
    main()
