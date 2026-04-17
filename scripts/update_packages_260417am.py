#!/usr/bin/env python3
"""Deterministic programmatic update for packages.scm and general-compat.scm.
Adds recipe-resolver-260417am re-exports."""

import os
import shutil
import tempfile

PACKAGES_SCM = "guix/gaurix/packages.scm"
COMPAT_SCM = "guix/gaurix/packages/general-compat.scm"

RESOLVER_ID = "recipe-resolver-260417am"
RESOLVER_COMMENT = f";; {RESOLVER_ID} (27 NRD resolved, 5 BLOCKED)"

EXPORTS = [
    "moor-bin",
    "steamguard-cli-bin",
    "vopono-bin",
    "youtubedr-bin",
    "pingme-bin",
    "overmind-bin",
    "sqly-bin",
    "reddix-bin",
    "gowall-bin",
    "tuicr-bin",
    "rres-bin",
    "folderhost-bin",
    "tetrigo-bin",
    "tenere-bin",
    "taskell-bin",
    "gzdoom-bin",
    "vkd3d-proton-bin",
    "crossdirstat-bin",
    "font-ioskeley-mono-unhinted",
    "font-chhsich-nerd",
    "python-pysmart",
    "python-upp",
    "perl-data-password-zxcvbn",
    "alpine-make-rootfs",
    "epub-thumbnailer",
    "zenstates",
    "rust-docs",
]


def update_packages_scm():
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Build the new block
    exports_str = "\n               ".join(EXPORTS)
    block = f"""
{RESOLVER_COMMENT}
(define-module (gaurix packages)
  #:use-module (gaurix packages {RESOLVER_ID})
  #:re-export ({exports_str}))
"""

    new_content = content.rstrip("\n") + "\n" + block

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(PACKAGES_SCM), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        os.replace(tmp, PACKAGES_SCM)
    except:
        os.unlink(tmp)
        raise

    print(f"Updated {PACKAGES_SCM}: added {len(EXPORTS)} re-exports")


def update_compat_scm():
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Check if the module is already imported
    use_module_line = f"#:use-module (gaurix packages {RESOLVER_ID})"
    if use_module_line not in content:
        # Find the last #:use-module line in the module declaration
        # and add our import after it
        lines = content.split("\n")
        last_use_idx = -1
        for i, line in enumerate(lines):
            if "#:use-module" in line and "gaurix packages" in line:
                last_use_idx = i
        if last_use_idx >= 0:
            lines.insert(last_use_idx + 1, f"  {use_module_line}")
            content = "\n".join(lines)

    # Build re-export lines
    re_exports = [f"(re-export {name})" for name in EXPORTS]
    block = f"\n;; {RESOLVER_ID} re-exports\n" + "\n".join(re_exports) + "\n"

    new_content = content.rstrip("\n") + "\n" + block

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=os.path.dirname(COMPAT_SCM), suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        os.replace(tmp, COMPAT_SCM)
    except:
        os.unlink(tmp)
        raise

    print(f"Updated {COMPAT_SCM}: added {len(EXPORTS)} re-exports")


if __name__ == "__main__":
    update_packages_scm()
    update_compat_scm()
    print("Done.")
