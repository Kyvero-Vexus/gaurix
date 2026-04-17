#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260417aj.

Deterministic full-file transforms: read, compute, write temp, atomic move.
"""

import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260417aj"

RESOLVED_PACKAGES = [
    "gizmosql-bin",
    "mdatp-bin",
    "plexamp-bin",
    "cryptpad",
    "amsel-suite-bin",
    "python-jupyterlab-variableinspector",
    "python-libipld-git",
    "115-browser-bin",
    "python-optking",
    "magicq",
    "python-tensorstore-bin",
    "unofficial-homestuck-collection-bin",
]


def update_packages_scm():
    """Append new re-export block to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = "\n               ".join(RESOLVED_PACKAGES)
    new_block = f"""
;; {PASS_ID} (12 BLOCKED resolved)
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

    # Add use-module after the last known use-module line
    import_line = f"  #:use-module (gaurix packages {PASS_ID})"
    marker = "  #:use-module (gaurix packages recipe-resolver-260417ai)"
    if marker in content:
        content = content.replace(marker, marker + "\n" + import_line)
    else:
        # Fallback: add after last #:use-module in the header
        last_use = content.rfind("#:use-module")
        if last_use >= 0:
            eol = content.index("\n", last_use)
            content = content[:eol+1] + import_line + "\n" + content[eol+1:]

    # Append re-exports at the end
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
