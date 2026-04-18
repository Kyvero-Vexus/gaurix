#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260418ad.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import json
import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418ad-summary.json"
PASS_ID = "deptree-resolver-260418ad"


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def update_packages_scm():
    """Add exports and pass comment to packages.scm."""
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = summary["resolved_packages"]
    if not resolved:
        print("  No resolved packages to add to packages.scm")
        return

    new_exports = [sanitize_name(p["name"]) for p in resolved]

    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")
    insert_idx = None
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == "))":
            insert_idx = i
            break

    if insert_idx is None:
        print("  ERROR: Could not find closing )) in packages.scm")
        return

    new_lines = [
        f"            ;; {PASS_ID} ({len(resolved)} FAILED resolved)",
    ]
    for exp in new_exports:
        new_lines.append(f"               {exp}")

    lines = lines[:insert_idx] + new_lines + lines[insert_idx:]
    new_content = "\n".join(lines)

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=ROOT / "guix" / "gaurix",
                                      suffix='.scm', delete=False)
    tmp.write(new_content)
    tmp.close()
    shutil.move(tmp.name, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM} (+{len(new_exports)} exports)")


def update_general_compat_scm():
    """Add module import and re-exports to general-compat.scm."""
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved = summary["resolved_packages"]
    if not resolved:
        print("  No resolved packages to add to general-compat.scm")
        return

    new_exports = [sanitize_name(p["name"]) for p in resolved]

    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Find the last #:use-module line and add after it
    last_use_module_idx = None
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx is None:
        print("  ERROR: Could not find #:use-module lines in general-compat.scm")
        return

    module_import = f"  #:use-module (gaurix packages {PASS_ID})"
    lines.insert(last_use_module_idx + 1, module_import)

    # Add re-export definitions at the end
    re_exports = []
    re_exports.append(f"")
    re_exports.append(f";;; Re-exports from {PASS_ID}")
    for exp in new_exports:
        matching = [p for p in resolved if sanitize_name(p["name"]) == exp]
        if matching:
            pkg_name = matching[0]["name"]
        else:
            pkg_name = exp
        re_exports.append(f"")
        re_exports.append(f"(define-public {exp}")
        re_exports.append(f"  (package")
        re_exports.append(f"    (inherit {exp})")
        re_exports.append(f'    (name "{pkg_name}")))')

    lines.extend(re_exports)
    new_content = "\n".join(lines)

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=ROOT / "guix" / "gaurix" / "packages",
                                      suffix='.scm', delete=False)
    tmp.write(new_content)
    tmp.close()
    shutil.move(tmp.name, COMPAT_SCM)
    print(f"  Updated {COMPAT_SCM} (+1 import, +{len(new_exports)} re-exports)")


def main():
    print(f"[{PASS_ID}] Updating packages.scm and general-compat.scm")
    update_packages_scm()
    update_general_compat_scm()


if __name__ == "__main__":
    main()
