#!/usr/bin/env python3
"""Programmatic, deterministic update of packages.scm and general-compat.scm
for deptree-resolver-260414s pass.

Reads existing files, appends new re-exports and compat aliases, writes temp files,
then atomically moves them into place.
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260414s"

PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def get_recipe_guix_names(summary):
    """Get list of guix_name for all recipes."""
    return [r["guix_name"] for r in summary["recipes"]]


def get_compat_aliases(summary):
    """Generate compat aliases for -bin/-git variants."""
    aliases = []
    for r in summary["recipes"]:
        aur = r["aur_name"]
        gn = r["guix_name"]
        if aur.endswith("-bin"):
            base = re.sub(r'-bin$', '', aur)
            base_guix = base.lower().replace("_", "-").replace("+", "-plus").replace(".", "-")
            base_guix = re.sub(r'-+', '-', base_guix).strip('-')
            if base_guix != gn:
                aliases.append((base_guix, gn))
        elif aur.endswith("-git"):
            base = re.sub(r'-git$', '', aur)
            base_guix = base.lower().replace("_", "-").replace("+", "-plus").replace(".", "-")
            base_guix = re.sub(r'-+', '-', base_guix).strip('-')
            if base_guix != gn:
                aliases.append((base_guix, gn))
    return aliases


def update_packages_scm(guix_names):
    """Append re-export block to packages.scm."""
    content = PACKAGES_SCM.read_text()

    # Build new re-export block
    block = f"\n;; {PASS_ID}\n"
    block += "(define-module (gaurix packages)\n"
    block += f"  #:use-module (gaurix packages {PASS_ID})\n"
    block += "  #:re-export ("
    block += "\n               ".join(guix_names)
    block += "))\n"

    new_content = content + block

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".scm")
    try:
        os.write(fd, new_content.encode())
        os.close(fd)
        shutil.move(tmp, PACKAGES_SCM)
        print(f"Updated {PACKAGES_SCM} (+{len(guix_names)} re-exports)")
    except Exception:
        os.close(fd)
        os.unlink(tmp)
        raise


def update_compat_scm(aliases):
    """Append compat alias block to general-compat.scm."""
    if not aliases:
        print("No compat aliases needed")
        return

    content = COMPAT_SCM.read_text()

    block = f"\n;; --- {PASS_ID} compat aliases ---\n"
    for base_name, source_name in aliases:
        block += f'(define-public {base_name} (package (inherit {source_name}) (name "{base_name}")))\n'

    new_content = content + block

    fd, tmp = tempfile.mkstemp(dir=COMPAT_SCM.parent, suffix=".scm")
    try:
        os.write(fd, new_content.encode())
        os.close(fd)
        shutil.move(tmp, COMPAT_SCM)
        print(f"Updated {COMPAT_SCM} (+{len(aliases)} compat aliases)")
    except Exception:
        os.close(fd)
        os.unlink(tmp)
        raise


def main():
    summary = load_summary()
    guix_names = get_recipe_guix_names(summary)
    aliases = get_compat_aliases(summary)

    print(f"Pass: {PASS_ID}")
    print(f"Recipes: {len(guix_names)}")
    print(f"Compat aliases: {len(aliases)}")

    update_packages_scm(guix_names)
    update_compat_scm(aliases)

    print("\nDone.")


if __name__ == "__main__":
    main()
