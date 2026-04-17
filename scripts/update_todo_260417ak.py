#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260417ak pass.

Deterministic: read → compute → write temp → atomic move.
"""

import re
import shutil
import tempfile
from pathlib import Path

PASS_ID = "deptree-resolver-260417ak"
ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = ROOT / "todo_general_packages.org"

# Packages resolved in this pass
RESOLVED = {
    14576: ("void-electron-latest-bin", "v1.99.30044", "binary-generic"),
    14575: ("chatgqt", "v2.2", "binary-aur-git"),
    15032: ("redact-bin", "v0.21.18", "binary-generic"),
}

# Packages remaining BLOCKED with updated reason codes
BLOCKED = {
    14202: "MISSING_SOURCE: Not in AUR cache; no upstream source.  Re-confirmed in 260417ak pass",
    16018: "PROPRIETARY_LICENSE: Microsoft Office 365 font license prohibits redistribution",
    14971: "PROPRIETARY_LICENSE: Apple license forbids redistribution.  Re-confirmed in 260417ak pass",
    15346: "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Re-confirmed in 260417ak pass",
    15347: "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Re-confirmed in 260417ak pass",
    15348: "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Re-confirmed in 260417ak pass",
    15031: "MISSING_DEPENDENCY: Requires code-server not in Guix.  Re-confirmed in 260417ak pass",
    15005: "PROPRIETARY_LICENSE: Proprietary Broadcom binary blob; depends on libfprint-tod not in Guix.  Re-confirmed in 260417ak pass",
    15010: "DKMS_UNSUPPORTED: Out-of-tree DKMS module; upstream in Linux >= 6.14.  Re-confirmed in 260417ak pass",
    14669: "MASSIVE_SCALE: 500+ Python pip dependencies; nightly URL not versioned.  Re-confirmed in 260417ak pass",
    14726: "ARCH_SPECIFIC: Requires mkarchroot from devtools.  Re-confirmed in 260417ak pass",
    14699: "ARCH_SPECIFIC: Links against libalpm (pacman).  Re-confirmed in 260417ak pass",
    14914: "DKMS_UNSUPPORTED: Out-of-tree DKMS kernel module; already in mainline Linux.  Re-confirmed in 260417ak pass",
    15189: "ARCH_SPECIFIC: TUI frontend for paru (AUR helper).  Re-confirmed in 260417ak pass",
    14584: "ARCH_SPECIFIC: Core logic uses libalpm (pacman database API).  Re-confirmed in 260417ak pass",
    15139: "PROPRIETARY: Commercial game requiring purchase; no redistributable archive.  Re-confirmed in 260417ak pass",
    14587: "ARCH_SPECIFIC: Requires devtools and Arch SVN.  Re-confirmed in 260417ak pass",
    14759: "LEGAL_ISSUES: Facilitates copyright infringement; dead project.  Re-confirmed in 260417ak pass",
    15131: "NVIDIA_DEPENDENCY: Requires NVIDIA CUDA + nvidia-open-dkms + custom kernel module.  Re-confirmed in 260417ak pass",
    15008: "PROPRIETARY_LICENSE: i386 binary blobs; requires lib32-glibc.  Re-confirmed in 260417ak pass",
    15058: "COMPLEX_DEPS: Electron app; npm deps violate deterministic builds.  Re-confirmed in 260417ak pass",
    14616: "PROPRIETARY_LICENSE: Requires manual download and EULA acceptance.  Re-confirmed in 260417ak pass",
    14583: "COMPLEX_DEPS: ROCm ecosystem not available in Guix.  Re-confirmed in 260417ak pass",
    14495: "COMPLEX_DEPS: Requires dotnet-sdk-8.0 + nuget + scons; massive build.  Re-confirmed in 260417ak pass",
    15062: "PROPRIETARY_LICENSE: Xiaomi proprietary IDE; requires manual download from iot.mi.com.  Re-confirmed in 260417ak pass",
}

HEADING_PATTERN = re.compile(r'^(\*\* )(BLOCKED|DONE|TODO|FAILED|SKIPPED)( \d+\.)')


def process_todo():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    output = []
    i = 0
    resolved_count = 0
    blocked_updated = 0

    while i < len(lines):
        line = lines[i]
        m = HEADING_PATTERN.match(line)

        if m:
            # Extract package number
            num_match = re.search(r'(\d+)\.', line)
            if num_match:
                num = int(num_match.group(1))

                if num in RESOLVED:
                    # Change BLOCKED → DONE and add status line
                    pkg_name, version, method = RESOLVED[num]
                    new_line = line.replace('** BLOCKED ', '** DONE ', 1)
                    # Truncate the heading at the first colon after the tag
                    # Keep the basic "** DONE NNNNN. name" format
                    heading_match = re.match(r'^(\*\* DONE \d+\.\s+\S+)', new_line)
                    if heading_match:
                        new_line = heading_match.group(1) + '\n'
                    output.append(new_line)

                    # Collect existing sub-lines
                    i += 1
                    sub_lines = []
                    while i < len(lines) and not lines[i].startswith('** '):
                        sub_lines.append(lines[i])
                        i += 1

                    # Add new status line at top of sub-lines
                    status_line = (
                        f"   - Status: DONE: recipe in {PASS_ID}.scm "
                        f"({pkg_name} {version}, {method}) ({PASS_ID})\n"
                    )
                    output.append(status_line)
                    # Add TODO Status line
                    output.append(f"   - TODO Status: DONE\n")
                    # Keep existing sub-lines
                    for sl in sub_lines:
                        # Skip old TODO Status lines to avoid duplicates
                        if sl.strip().startswith('- TODO Status:'):
                            continue
                        output.append(sl)

                    resolved_count += 1
                    continue

                elif num in BLOCKED and m.group(2) == 'BLOCKED':
                    # Keep as BLOCKED, add updated status note
                    output.append(line)
                    i += 1

                    # Collect existing sub-lines
                    sub_lines = []
                    while i < len(lines) and not lines[i].startswith('** '):
                        sub_lines.append(lines[i])
                        i += 1

                    # Add new status line at top
                    reason = BLOCKED[num]
                    status_line = (
                        f"   - Status: BLOCKED: {reason} ({PASS_ID})\n"
                    )
                    output.append(status_line)
                    for sl in sub_lines:
                        output.append(sl)

                    blocked_updated += 1
                    continue

        output.append(line)
        i += 1

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(
        dir=str(ROOT), prefix='.todo_update_', suffix='.org')
    try:
        with open(fd, 'w') as f:
            f.writelines(output)
        shutil.move(tmp_path, str(TODO_FILE))
    except:
        import os
        os.unlink(tmp_path)
        raise

    print(f"Updated {TODO_FILE.name}:")
    print(f"  Resolved: {resolved_count} (BLOCKED → DONE)")
    print(f"  Blocked updated: {blocked_updated}")


if __name__ == '__main__':
    process_todo()
