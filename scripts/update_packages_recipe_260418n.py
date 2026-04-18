#!/usr/bin/env python3
"""Deterministic full-file transform for recipe-resolver-260418n.

Updates general-compat.scm and packages.scm to include the new module.
"""
import shutil
import tempfile
import os

REPO = "/home/slime/projects/gaurix"

NEW_MODULE = "recipe-resolver-260418n"
NEW_PACKAGES = [
    "plasmazones-bin",
    "rustdesk-bin",
    "qt-sudo",
    "clamav-gui",
    "namp",
    "samsung-ssd-fwupdate",
    "prefixer",
    "appimagelauncher-bin",
    "millennium-bin",
]

# --- general-compat.scm ---
def update_general_compat():
    path = os.path.join(REPO, "guix/gaurix/packages/general-compat.scm")
    with open(path, "r") as f:
        lines = f.readlines()

    # 1) Add #:use-module after recipe-resolver-260418m
    new_lines = []
    for line in lines:
        new_lines.append(line)
        if "recipe-resolver-260418m)" in line and "#:use-module" in line:
            new_lines.append(
                f"  #:use-module (gaurix packages {NEW_MODULE})\n"
            )

    # 2) Add re-exports at end of file (before final newline)
    # Find the last re-export line and append after it
    last_reexport_idx = -1
    for i, line in enumerate(new_lines):
        if line.strip().startswith("(re-export "):
            last_reexport_idx = i

    if last_reexport_idx >= 0:
        block = [f"\n;; {NEW_MODULE}\n"]
        for pkg in NEW_PACKAGES:
            block.append(f"(re-export {pkg})\n")
        new_lines = (
            new_lines[: last_reexport_idx + 1]
            + block
            + new_lines[last_reexport_idx + 1 :]
        )

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(path), suffix=".scm")
    with os.fdopen(fd, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp, path)
    print(f"Updated {path}: +1 use-module, +{len(NEW_PACKAGES)} re-exports")


# --- packages.scm ---
def update_packages():
    path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(path, "r") as f:
        content = f.read()

    # Append new section at end of file
    exports = "\n".join(f"               {pkg}" for pkg in NEW_PACKAGES)
    block = f"""
;; {NEW_MODULE} (9 NRD resolved, 1 ALREADY_IN_GUIX, 20 EXHAUSTED)
(define-module (gaurix packages)
  #:use-module (gaurix packages {NEW_MODULE})
  #:re-export ({exports}))
"""
    content = content.rstrip() + "\n" + block

    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(path), suffix=".scm")
    with os.fdopen(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, path)
    print(f"Updated {path}: +1 module section with {len(NEW_PACKAGES)} exports")


if __name__ == "__main__":
    update_general_compat()
    update_packages()
    print("Done.")
