#!/usr/bin/env python3
"""Update packages.scm and general-compat.scm for deptree-resolver-260417au.

Uses deterministic programmatic full-file transforms (read, compute, write temp, atomic move).
"""

import re
import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
COMPAT_SCM = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "deptree-resolver-260417au"

# New packages resolved in this pass
NEW_PACKAGES = [
    "arch-silence-grub-theme-git",
    "spicetify-themes-git",
    "asf",
    "floorp",
    "selectdefaultapplication-git",
    "puddletag",
    "chiaki",
    "wasistlos",
    "vscodium-bin-marketplace",
    "ipfs-desktop",
    "apparmor-d-git",
]

PASS_COMMENT = f"            ;; {PASS_ID} (11 BLOCKED resolved: 11 new recipes)"


def update_packages_scm():
    """Add pass comment and new exports to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Find the last pass comment line (;; deptree-resolver-* or ;; recipe-resolver-*)
    last_comment_idx = None
    for i, line in enumerate(lines):
        if re.match(r"\s+;;\s+(deptree|recipe)-resolver-", line):
            last_comment_idx = i

    if last_comment_idx is None:
        print("ERROR: Could not find pass comment lines in packages.scm")
        return False

    # Insert new pass comment after the last one
    lines.insert(last_comment_idx + 1, PASS_COMMENT)

    # Find where exports end (look for the closing paren of the module)
    # The exports are just bare symbols after the comments
    # Find the last export line (before first non-export, non-comment line)
    # Actually, the file has bare package names as exports in the define-module

    # Remove packages that might have been listed as blocked-related exports
    # (e.g., scribus-svn was listed but might be removed if we now have it resolved)

    # Find the end of the define-module's export list
    # Just append our new packages before the closing `)` if it exists
    # Or find where the last package name is and add after it

    # The structure is:
    # (define-module (gaurix packages)
    #   ;; comments
    #   package-name1
    #   package-name2
    #   ...)
    # Then re-export statements

    # Let's find where the bare package names end
    # They follow the comments and are just bare identifiers
    # After the define-module block, there are (module-re-export! ...) calls

    # Find insertion point: after the last exported package name
    # Package names are bare identifiers on lines after comments
    last_pkg_idx = None
    in_exports = False
    for i, line in enumerate(lines):
        stripped = line.strip()
        if re.match(r"^\s+;;\s+(deptree|recipe)-resolver-", line):
            in_exports = True
            continue
        if in_exports and stripped and not stripped.startswith(";"):
            if re.match(r"^[a-zA-Z][a-zA-Z0-9_.-]*$", stripped):
                last_pkg_idx = i
            elif stripped.startswith("("):
                # End of exports section
                break

    if last_pkg_idx is None:
        print("ERROR: Could not find package export section in packages.scm")
        return False

    # Insert new packages after last existing one
    # Note: since we inserted the comment earlier, last_pkg_idx may have shifted by 1
    last_pkg_idx += 1  # Adjust for inserted comment line

    for j, pkg in enumerate(sorted(NEW_PACKAGES)):
        lines.insert(last_pkg_idx + 1 + j, f"            {pkg}")

    new_content = "\n".join(lines)

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=PACKAGES_SCM.parent,
                                      suffix=".scm", delete=False)
    try:
        tmp.write(new_content)
        tmp.close()
        shutil.move(tmp.name, PACKAGES_SCM)
    except:
        import os
        os.unlink(tmp.name)
        raise

    print(f"  Updated {PACKAGES_SCM}")
    print(f"    Added pass comment + {len(NEW_PACKAGES)} package exports")
    return True


def update_compat_scm():
    """Add #:use-module for the new pass to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    lines = content.split("\n")

    # Find the last deptree-resolver use-module line
    last_deptree_idx = None
    for i, line in enumerate(lines):
        if f"#:use-module (gaurix packages deptree-resolver-" in line:
            last_deptree_idx = i

    if last_deptree_idx is None:
        print("ERROR: Could not find deptree-resolver import in general-compat.scm")
        return False

    # Insert new module after the last deptree-resolver import
    new_import = f"  #:use-module (gaurix packages {PASS_ID})"
    lines.insert(last_deptree_idx + 1, new_import)

    new_content = "\n".join(lines)

    # Atomic write
    tmp = tempfile.NamedTemporaryFile(mode="w", dir=COMPAT_SCM.parent,
                                      suffix=".scm", delete=False)
    try:
        tmp.write(new_content)
        tmp.close()
        shutil.move(tmp.name, COMPAT_SCM)
    except:
        import os
        os.unlink(tmp.name)
        raise

    print(f"  Updated {COMPAT_SCM}")
    print(f"    Added #:use-module for {PASS_ID}")
    return True


def main():
    print(f"[{PASS_ID}] Updating packages.scm and general-compat.scm...")
    ok1 = update_packages_scm()
    ok2 = update_compat_scm()
    if ok1 and ok2:
        print(f"[{PASS_ID}] All module files updated successfully.")
    else:
        print(f"[{PASS_ID}] WARNING: Some updates failed!")


if __name__ == "__main__":
    main()
