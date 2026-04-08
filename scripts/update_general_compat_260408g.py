#!/usr/bin/env python3
"""Programmatic update of general-compat.scm for recipe-resolver-260408g pass.

Adds:
- Module import for recipe-resolver-260408g
- Export declarations for new packages and compat aliases
- Compat alias definitions at end of file

Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import tempfile
import shutil

SRC = "guix/gaurix/packages/general-compat.scm"

# New recipe-resolver-260408g packages to re-export
RECIPE_EXPORTS = [
    "android-studio-bin",
    "netbeans-bin",
    "localsend-git",
    "logseq-desktop-git",
    "xlibre-input-wacom-bin",
    "xlibre-video-fbdev-bin",
    "appimagelauncher-git",
    "ffmpeg-amd-full-git",
]

# Compat aliases for the new recipe packages (name, inherit-from, comment)
RECIPE_COMPAT_ALIASES = [
    ("android-studio", "android-studio-bin",
     "AUR android-studio -> gaurix android-studio-bin"),
    ("netbeans", "netbeans-bin",
     "AUR netbeans -> gaurix netbeans-bin"),
]


def main():
    with open(SRC, "r") as f:
        lines = f.readlines()

    content = "".join(lines)

    # 1. Add module import for recipe-resolver-260408g
    import_line = "  #:use-module (gaurix packages recipe-resolver-260408g)\n"
    if "recipe-resolver-260408g" not in content:
        # Find last recipe-resolver-260408f import
        idx = None
        for i, line in enumerate(lines):
            if "recipe-resolver-260408f)" in line:
                idx = i
        if idx is not None:
            lines.insert(idx + 1, import_line)
            print(f"Inserted module import at line {idx + 2}")

    # 2. Add export declarations
    export_names = RECIPE_EXPORTS + [a[0] for a in RECIPE_COMPAT_ALIASES]

    # Find last recipe-resolver-260408f re-exports comment
    export_insert_idx = None
    for i, line in enumerate(lines):
        if ";; recipe-resolver-260408f re-exports" in line:
            export_insert_idx = i

    if export_insert_idx is not None and \
       "recipe-resolver-260408g re-exports" not in "".join(lines):
        # Find end of 260408f export block (next comment or close paren)
        scan = export_insert_idx + 1
        while scan < len(lines):
            stripped = lines[scan].strip()
            if stripped.startswith(";;") or stripped == ")" or stripped.startswith("#:"):
                break
            scan += 1

        export_block = "            ;; recipe-resolver-260408g re-exports\n"
        for name in export_names:
            export_block += f"            {name}\n"
        lines.insert(scan, export_block)
        print(f"Inserted {len(export_names)} export declarations")

    # 3. Add compat alias definitions at end of file
    if "recipe-resolver-260408g compat aliases" not in "".join(lines):
        alias_block = "\n;; --- recipe-resolver-260408g compat aliases ---\n"

        for name, inherit_from, comment in RECIPE_COMPAT_ALIASES:
            alias_block += f"\n;; {comment}\n"
            alias_block += f"(define-public {name}\n"
            alias_block += f"  (package\n"
            alias_block += f"    (inherit {inherit_from})\n"
            alias_block += f'    (name "{name}")))\n'

        lines.append(alias_block)
        print(f"Appended {len(RECIPE_COMPAT_ALIASES)} compat alias definitions")

    # 4. Write to temp file and atomic move
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(SRC), suffix=".scm.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, SRC)
        print(f"Atomically updated {SRC}")
    except Exception:
        os.unlink(tmp_path)
        raise


if __name__ == "__main__":
    main()
