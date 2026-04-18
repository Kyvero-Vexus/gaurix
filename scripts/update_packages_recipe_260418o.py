#!/usr/bin/env python3
"""Add recipe-resolver-260418o to general-compat.scm (deterministic full-file transform)."""

import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260418o)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260418h)"

def main():
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    if "recipe-resolver-260418o" in content:
        print("recipe-resolver-260418o already in general-compat.scm, skipping")
        return

    # Insert after the last recipe-resolver module line
    # Find the anchor (recipe-resolver-260418h) and insert after it
    if ANCHOR_MODULE in content:
        content = content.replace(
            ANCHOR_MODULE,
            ANCHOR_MODULE + "\n" + NEW_MODULE
        )
    else:
        # Fallback: insert before the first (guix packages) line
        content = content.replace(
            "  #:use-module (guix packages)",
            NEW_MODULE + "\n  #:use-module (guix packages)"
        )

    tmp = COMPAT_FILE + ".tmp"
    with open(tmp, 'w') as f:
        f.write(content)
    shutil.move(tmp, COMPAT_FILE)
    print(f"Added recipe-resolver-260418o to {COMPAT_FILE}")

if __name__ == '__main__':
    main()
