#!/usr/bin/env python3
"""Update bookkeeping for deptree-resolver-260413q.
Deterministic full-file transforms for general-compat.scm and org file.
"""

import re
import shutil
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
RUN_ID = "deptree-resolver-260413q"

# New exports from the recipe file
NEW_EXPORTS = [
    "chromium-gost",
    "dvdisaster-speed47-git",
    "fallout1-ce-game",
    "locale-en-ru",
    "localsend-go",
    "xcaddy",
    "xr-passthrough-layer-git",
]

# Resolved packages: name -> org number (BLOCKED entries that got recipes)
RESOLVED = {
    "chromium-gost": 757,
    "dvdisaster-speed47-git": 12692,
    "fallout1-ce-game": 12753,
    "locale-en_ru": 10385,
    "localsend-go": 10205,
    "xcaddy": 10559,
    "xr-passthrough-layer-git": 12741,
}

# Newly blocked packages with reason codes (only ones not already annotated)
# These are packages newly entering this batch that weren't in 260413p
NEW_BLOCKED = {
    "linux-xanmod-lts-linux-bin-x64v3": ("LINUX_KERNEL_BINARY: prebuilt LTS kernel", 3624),
    "linux-xanmod-lts-linux-headers-bin-x64v3": ("LINUX_KERNEL_BINARY: prebuilt LTS kernel headers", 3625),
    "llvm-mos-git": ("INFEASIBLE_BUILD: entire LLVM fork for 6502, massive cmake build from git HEAD", 11199),
}


def update_general_compat_scm():
    """Add use-module for the new resolver and any compat aliases."""
    path = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
    content = path.read_text()

    # Add #:use-module for the new resolver
    use_line = f"  #:use-module (gaurix packages {RUN_ID})"
    if use_line not in content:
        # Find the last deptree-resolver use-module
        insert_after = "  #:use-module (gaurix packages deptree-resolver-260413p)"
        if insert_after in content:
            content = content.replace(
                insert_after,
                insert_after + "\n" + use_line
            )
        else:
            content = content.replace(
                "  #:use-module (guix packages)",
                use_line + "\n  #:use-module (guix packages)"
            )

    # Add compat aliases at the end
    aliases = [
        '(define-public dvdisaster-speed47 (package (inherit dvdisaster-speed47-git) (name "dvdisaster-speed47")))',
        '(define-public locale-en_ru (package (inherit locale-en-ru) (name "locale-en_ru")))',
        '(define-public xr-passthrough-layer (package (inherit xr-passthrough-layer-git) (name "xr-passthrough-layer")))',
    ]

    alias_block = f"\n;; --- {RUN_ID} compat aliases ---\n" + "\n".join(aliases) + "\n"
    content = content.rstrip() + alias_block

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=path.parent, suffix='.tmp', delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, str(path))
    print(f"Updated {path}")


def update_org_file():
    """Update todo_general_packages.org: BLOCKED -> DONE for resolved packages,
    add reason codes for newly blocked packages."""
    path = REPO_ROOT / "todo_general_packages.org"
    lines = path.read_text().split('\n')

    result = []
    i = 0
    resolved_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]

        # Check for resolved packages
        matched = False
        for name, num in RESOLVED.items():
            pattern = f"** BLOCKED {num}. {name}"
            if line.strip().startswith(pattern):
                # Change BLOCKED to DONE
                new_line = line.replace(f"** BLOCKED {num}.", f"** DONE {num}.")
                result.append(new_line)
                i += 1
                # Copy remaining lines of entry until next heading
                while i < len(lines) and not lines[i].startswith("** "):
                    result.append(lines[i])
                    i += 1
                # Add resolution note
                result.append(f"   - Status: DONE: Recipe added in {RUN_ID}.scm ({RUN_ID})")
                result.append("")
                resolved_count += 1
                matched = True
                break

        if matched:
            continue

        # Check for newly blocked packages
        for name, (reason, num) in NEW_BLOCKED.items():
            pattern = f"** BLOCKED {num}. {name}"
            if line.strip().startswith(pattern):
                # Update header to include reason
                if "[BLOCKED:" not in line:
                    new_line = line.rstrip() + f" [BLOCKED: {reason}]"
                    result.append(new_line)
                else:
                    result.append(line)
                i += 1
                # Copy remaining lines of entry until next heading
                while i < len(lines) and not lines[i].startswith("** "):
                    result.append(lines[i])
                    i += 1
                result.append(f"   - Status: BLOCKED: {reason} ({RUN_ID})")
                result.append("")
                blocked_count += 1
                matched = True
                break

        if matched:
            continue

        result.append(line)
        i += 1

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=path.parent, suffix='.tmp', delete=False)
    tmp.write('\n'.join(result))
    tmp.close()
    shutil.move(tmp.name, str(path))
    print(f"Updated {path} (resolved={resolved_count}, newly_blocked={blocked_count})")


if __name__ == '__main__':
    update_general_compat_scm()
    update_org_file()
    print("All bookkeeping updates complete.")
