#!/usr/bin/env python3
"""Update bookkeeping for deptree-resolver-260413p.
Deterministic full-file transforms for packages.scm, general-compat.scm, and org file.
"""

import re
import shutil
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
RUN_ID = "deptree-resolver-260413p"

# New exports from the recipe file
NEW_EXPORTS = [
    "kvantum-theme-catppuccin-git",
    "kvantum-theme-libadwaita-git",
    "larn",
    "latin-words",
    "lazyjira-git",
    "lfe",
    "libiff-git",
    "libreelec-dvb-firmware-git",
    "libreoffice-extension-languagetool",
    "libtifiles",
]

# Resolved packages: name -> org number (from actual BLOCKED entries)
RESOLVED = {
    "kvantum-theme-catppuccin-git": 1538,
    "kvantum-theme-libadwaita-git": 8902,
    "larn": 763,
    "latin-words": 10233,
    "lazyjira-git": 2581,
    "lfe": 2769,
    "libiff-git": 7707,
    "libreelec-dvb-firmware-git": 10416,
    "libreoffice-extension-languagetool": 1970,
    "libtifiles": 3183,
}

# Still-blocked packages with reason codes (only the new ones from this batch)
NEW_BLOCKED = {
    "lact-openrc": ("DEP_UNAVAILABLE: OpenRC init system not available in Guix", 12378),
    "lib32-a52dec": ("LIB32_UNSUPPORTED", 2433),
    "lib32-gperftools": ("LIB32_UNSUPPORTED", 10745),
    "lib32-opencl-legacy-amdgpu-pro": ("LIB32_UNSUPPORTED + PROPRIETARY_LICENSE: AMD EULA", 11300),
    "linux-xanmod-linux-bin-x64v3": ("LINUX_KERNEL_BINARY: prebuilt kernel, not suitable for Guix", 3631),
    "linux-xanmod-linux-headers-bin-x64v3": ("LINUX_KERNEL_BINARY: prebuilt kernel headers", 3632),
}


def update_packages_scm():
    """Add new exports to packages.scm."""
    path = REPO_ROOT / "guix" / "gaurix" / "packages.scm"
    content = path.read_text()

    # Find the closing paren - add new exports before it
    lines = content.rstrip().split('\n')
    # Find last line that is just ')'
    insert_idx = None
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == ')':
            insert_idx = i
            break

    if insert_idx is not None:
        new_lines = [f"            ;; {RUN_ID}"]
        new_lines.extend(f"            {name}" for name in NEW_EXPORTS)
        lines[insert_idx:insert_idx] = new_lines

    content = '\n'.join(lines) + '\n'

    tmp = tempfile.NamedTemporaryFile(mode='w', dir=path.parent, suffix='.tmp', delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, str(path))
    print(f"Updated {path}")


def update_general_compat_scm():
    """Add use-module for the new resolver and any compat aliases."""
    path = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
    content = path.read_text()

    # Add #:use-module for the new resolver
    use_line = f"  #:use-module (gaurix packages {RUN_ID})"
    if use_line not in content:
        # Find the last deptree-resolver use-module
        insert_after = "  #:use-module (gaurix packages deptree-resolver-260413n)"
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
        f'(define-public lazyjira (package (inherit lazyjira-git) (name "lazyjira")))',
        f'(define-public libiff (package (inherit libiff-git) (name "libiff")))',
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
                # Change BLOCKED to DONE and append status
                new_line = line.replace(f"** BLOCKED {num}.", f"** DONE {num}.")
                # Also update the header bracket if present
                result.append(new_line)
                i += 1
                # Copy remaining lines of entry until next heading
                while i < len(lines) and not lines[i].startswith("** "):
                    result.append(lines[i])
                    i += 1
                # Add resolution note before next heading
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
    update_packages_scm()
    update_general_compat_scm()
    update_org_file()
    print("All bookkeeping updates complete.")
