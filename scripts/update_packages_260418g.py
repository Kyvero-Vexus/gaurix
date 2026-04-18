#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260418g.

Deterministic full-file transform: read, compute, write temp, atomic move.
"""

import json
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418g-summary.json"
PASS_ID = "deptree-resolver-260418g"

with open(SUMMARY) as f:
    summary = json.load(f)

resolved = summary["resolved_packages"]
resolved_count = len(resolved)
blocked_count = summary["blocked"]


def update_packages_scm():
    """Add pass comment and re-export names to packages.scm."""
    with open(PACKAGES_SCM) as f:
        content = f.read()

    # Add pass comment after the last pass comment
    pass_comment = f"            ;; {PASS_ID}: {resolved_count} BLOCKED resolved, {blocked_count} remain BLOCKED"

    # Find insertion point for pass comment (after last ;; comment in header)
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith(";;") and "resolver-" in line:
            insert_idx = i + 1

    if insert_idx:
        lines.insert(insert_idx, pass_comment)

    # Add package names before closing ))
    new_exports = [r["name"] for r in resolved if r["name"] != "libgksu"]  # libgksu is a helper dep
    for i, line in enumerate(lines):
        if line.strip() == "))":
            for name in reversed(new_exports):
                lines.insert(i, f"               {name}")
            break

    new_content = "\n".join(lines)

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                      prefix=".packages-", suffix=".scm",
                                      delete=False)
    try:
        tmp.write(new_content)
        tmp.close()
        shutil.move(tmp.name, PACKAGES_SCM)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated {PACKAGES_SCM}: added {len(new_exports)} exports + pass comment")


def update_compat_scm():
    """Add use-module and re-exports for the new pass."""
    with open(COMPAT_SCM) as f:
        content = f.read()

    lines = content.split("\n")

    # Add use-module import near end of use-module block
    use_module_line = f"  #:use-module (gaurix packages {PASS_ID})"

    # Find last #:use-module line
    last_use_idx = None
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_idx = i

    if last_use_idx is not None:
        lines.insert(last_use_idx + 1, use_module_line)

    # Add re-exports at end
    export_names = [r["name"] for r in resolved]
    re_exports = [f"(re-export {name})" for name in export_names]

    # Find last re-export line
    last_reexport_idx = None
    for i, line in enumerate(lines):
        if line.startswith("(re-export"):
            last_reexport_idx = i

    if last_reexport_idx is not None:
        for j, line in enumerate(re_exports):
            lines.insert(last_reexport_idx + 1 + j, line)

    new_content = "\n".join(lines)

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                      prefix=".general-compat-", suffix=".scm",
                                      delete=False)
    try:
        tmp.write(new_content)
        tmp.close()
        shutil.move(tmp.name, COMPAT_SCM)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated {COMPAT_SCM}: added use-module + {len(re_exports)} re-exports")


if __name__ == "__main__":
    print(f"[{PASS_ID}] Updating packages.scm and general-compat.scm...")
    update_packages_scm()
    update_compat_scm()
    print(f"[{PASS_ID}] Done!")
