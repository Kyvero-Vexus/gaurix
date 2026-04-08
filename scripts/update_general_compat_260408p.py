#!/usr/bin/env python3
"""
Deterministic programmatic update of general-compat.scm for recipe-resolver-260408p.

Adds:
  1. #:use-module entry for recipe-resolver-260408p
  2. #:export entries for compat aliases
  3. Compat alias definitions at end of file

All transforms: read → compute → write temp → atomic move.
"""

import os
import sys
import tempfile
import shutil

TARGET = os.path.join(
    os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
    "guix", "gaurix", "packages", "general-compat.scm"
)

# --- 1. use-module entry ---
USE_MODULE_ANCHOR = "  #:use-module (gaurix packages recipe-resolver-260408o)"
USE_MODULE_NEW = "  #:use-module (gaurix packages recipe-resolver-260408p)"

# --- 2. export entries (add before closing )) ) ---
EXPORT_ANCHOR = "            ))"
EXPORT_NEW_LINES = """\
            ;; recipe-resolver-260408p compat aliases
            otf-geist
            ttf-geist
            ttf-geist-variable
            otf-geist-mono
            ttf-geist-mono
            ttf-geist-mono-variable
            sddm-theme-elegant-archlinux-git
            brokefetch-git
            vhd2vl-git
            sc-git"""

# --- 3. compat alias definitions ---
COMPAT_ALIASES = """
; --- recipe-resolver-260408p compat aliases ---

;; AUR otf-geist -> gaurix font-geist
(define-public otf-geist (package (inherit font-geist) (name "otf-geist")))

;; AUR ttf-geist -> gaurix font-geist
(define-public ttf-geist (package (inherit font-geist) (name "ttf-geist")))

;; AUR ttf-geist-variable -> gaurix font-geist
(define-public ttf-geist-variable (package (inherit font-geist) (name "ttf-geist-variable")))

;; AUR otf-geist-mono -> gaurix font-geist-mono
(define-public otf-geist-mono (package (inherit font-geist-mono) (name "otf-geist-mono")))

;; AUR ttf-geist-mono -> gaurix font-geist-mono
(define-public ttf-geist-mono (package (inherit font-geist-mono) (name "ttf-geist-mono")))

;; AUR ttf-geist-mono-variable -> gaurix font-geist-mono
(define-public ttf-geist-mono-variable (package (inherit font-geist-mono) (name "ttf-geist-mono-variable")))

;; AUR sddm-theme-elegant-archlinux-git -> gaurix sddm-theme-elegant-archlinux
(define-public sddm-theme-elegant-archlinux-git (package (inherit sddm-theme-elegant-archlinux) (name "sddm-theme-elegant-archlinux-git")))

;; AUR brokefetch-git -> gaurix brokefetch
(define-public brokefetch-git (package (inherit brokefetch) (name "brokefetch-git")))

;; AUR vhd2vl-git -> gaurix vhd2vl
(define-public vhd2vl-git (package (inherit vhd2vl) (name "vhd2vl-git")))

;; AUR sc-git -> gaurix sc
(define-public sc-git (package (inherit sc) (name "sc-git")))
"""


def main():
    with open(TARGET, "r") as f:
        content = f.read()

    # Check idempotence
    if "recipe-resolver-260408p" in content:
        print("Already applied, skipping.")
        return

    lines = content.split("\n")
    new_lines = []

    use_module_inserted = False
    export_inserted = False

    for line in lines:
        # Insert #:use-module after anchor
        if not use_module_inserted and line == USE_MODULE_ANCHOR:
            new_lines.append(line)
            new_lines.append(USE_MODULE_NEW)
            use_module_inserted = True
            continue

        # Insert export entries before closing ))
        if not export_inserted and line.strip() == "))":
            # Check if this is the export closing (line number > 1000)
            current_idx = len(new_lines)
            if current_idx > 1000:
                new_lines.append(EXPORT_NEW_LINES)
                new_lines.append(line)
                export_inserted = True
                continue

        new_lines.append(line)

    # Append compat alias definitions at end
    result = "\n".join(new_lines)
    if result.endswith("\n"):
        result = result.rstrip("\n") + "\n"
    result += COMPAT_ALIASES

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

    # Verify
    if not use_module_inserted:
        print("WARNING: use-module anchor not found!", file=sys.stderr)
    if not export_inserted:
        print("WARNING: export closing )) not found!", file=sys.stderr)


if __name__ == "__main__":
    main()
