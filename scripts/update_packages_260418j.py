#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260418j.

Deterministic full-file transforms: read, compute, write temp, atomic move.
"""

import json
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
SUMMARY = ROOT / "reports" / "deptree-resolver-260418j-summary.json"
PASS_ID = "deptree-resolver-260418j"

# Load resolved packages from summary
with open(SUMMARY) as f:
    summary = json.load(f)

RESOLVED_PACKAGES = [r["name"].lower().replace("_", "-").replace(".", "-")
                     for r in summary["resolved_packages"]]


def update_packages_scm():
    """Append new re-export block to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = "\n               ".join(RESOLVED_PACKAGES)
    new_block = f"""
;; {PASS_ID} ({len(RESOLVED_PACKAGES)} BLOCKED resolved)
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export ({exports}))
"""

    content += new_block

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                      prefix=".packages-", suffix=".scm",
                                      delete=False)
    try:
        tmp.write(content)
        tmp.close()
        shutil.move(tmp.name, PACKAGES_SCM)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated {PACKAGES_SCM}")


def update_compat_scm():
    """Append re-exports and use-module to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    import_line = f"  #:use-module (gaurix packages {PASS_ID})"
    marker = "  #:use-module (gaurix packages deptree-resolver-260418g)"
    if marker in content:
        content = content.replace(marker, marker + "\n" + import_line)
    else:
        last_use = content.rfind("#:use-module")
        if last_use >= 0:
            eol = content.index("\n", last_use)
            content = content[:eol+1] + import_line + "\n" + content[eol+1:]

    re_exports = f"\n; {PASS_ID}\n"
    for pkg in RESOLVED_PACKAGES:
        re_exports += f"(re-export {pkg})\n"

    content += re_exports

    tmp = tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                      prefix=".compat-", suffix=".scm",
                                      delete=False)
    try:
        tmp.write(content)
        tmp.close()
        shutil.move(tmp.name, COMPAT_SCM)
    except Exception:
        Path(tmp.name).unlink(missing_ok=True)
        raise

    print(f"  Updated {COMPAT_SCM}")


if __name__ == "__main__":
    print(f"[{PASS_ID}] Updating package registry files...")
    update_packages_scm()
    update_compat_scm()
    print("  Done.")
