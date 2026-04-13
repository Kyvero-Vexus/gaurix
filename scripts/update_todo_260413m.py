#!/usr/bin/env python3
"""Update todo_general_packages.org: mark 100 entries (12100-12206) as DONE or BLOCKED."""

import re, shutil, tempfile, os

TODO_FILE = "/home/slime/projects/gaurix/todo_general_packages.org"
BATCH_ID = "recipe-resolver-260413m"

# Entries that are BLOCKED with reason codes
BLOCKED_ENTRIES = {
    12116: "DEP_RESOLUTION_FAILED: requires libalpm (Arch pacman library) not in Guix",
    12117: "DEP_RESOLUTION_FAILED: Arch-specific systemd-boot + dracut integration",
    12123: "DEP_RESOLUTION_FAILED: Arch-specific mkinitcpio hook",
    12124: "DEP_RESOLUTION_FAILED: DKMS kernel module requires kernel headers",
    12130: "DEP_RESOLUTION_FAILED: Arch-specific pacman hook",
    12131: "SOURCE_UNAVAILABLE: proprietary UT99 game data required",
    12139: "DEP_RESOLUTION_FAILED: DKMS kernel module",
    12149: "DEP_RESOLUTION_FAILED: DKMS kernel module for Android binder",
    12151: "DEP_RESOLUTION_FAILED: DKMS kernel module for ITE chips",
    12153: "NEEDS_RECIPE_DESIGN: complex build with protobuf + Qt + custom UT dictionaries",
    12163: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12164: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12166: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12167: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12168: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12170: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12171: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12172: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12181: "SOURCE_UNAVAILABLE: VRChat haptics, no Linux binary available",
    12184: "DEP_RESOLUTION_FAILED: Arch-branded GRUB theme, not applicable to Guix",
    12200: "DEP_RESOLUTION_FAILED: Guix lacks multilib/32-bit library support",
    12201: "NEEDS_RECIPE_DESIGN: complex Django app with 50+ Python deps",
}

# All TODO entries in our batch (12100-12206, excluding already DONE/BLOCKED)
ALL_ENTRIES = [
    12100, 12101, 12102, 12103, 12104, 12105, 12106, 12107, 12108, 12109,
    12110, 12111, 12112, 12113, 12114, 12115, 12116, 12117, 12118, 12119,
    12120, 12121, 12122, 12123, 12124, 12125, 12126, 12127, 12128, 12129,
    12130, 12131, 12132, 12133, 12134, 12135, 12136, 12137, 12138, 12139,
    12141, 12142, 12143, 12145, 12146, 12148, 12149, 12150, 12151, 12152,
    12153, 12154, 12155, 12156, 12157, 12158, 12159, 12160, 12161, 12162,
    12163, 12164, 12166, 12167, 12168, 12170, 12171, 12172, 12173, 12174,
    12175, 12176, 12177, 12178, 12179, 12180, 12181, 12182, 12183, 12184,
    12185, 12186, 12187, 12188, 12189, 12190, 12191, 12192, 12193, 12194,
    12195, 12196, 12198, 12199, 12200, 12201, 12202, 12204, 12205, 12206,
]

def main():
    with open(TODO_FILE, "r") as f:
        content = f.read()

    done_count = 0
    blocked_count = 0

    for entry_num in ALL_ENTRIES:
        # Match the entry header: ** TODO <num>. <name>
        pattern = rf'(\*\* )TODO( {entry_num}\. \S+)'

        if entry_num in BLOCKED_ENTRIES:
            reason = BLOCKED_ENTRIES[entry_num]
            replacement = rf'\1BLOCKED\2'
            content_new = re.sub(pattern, replacement, content, count=1)
            if content_new != content:
                content = content_new
                # Add status line after the entry
                status_line = f"   - Status: BLOCKED: {reason} ({BATCH_ID})"
                # Find the TODO Status line and update it
                todo_status_pattern = rf'(   - TODO Status: )TODO(\n.*?(?=\n\*\* |\Z))'
                # Actually, let's just add a status line before TODO Status
                entry_pattern = rf'(\*\* BLOCKED {entry_num}\. \S+\n(?:.*\n)*?)(   - TODO Status: )TODO'
                def replace_blocked(m):
                    return m.group(1) + f"   - Status: BLOCKED: {reason} ({BATCH_ID})\n" + m.group(2) + "BLOCKED"
                content = re.sub(entry_pattern, replace_blocked, content, count=1)
                blocked_count += 1
        else:
            replacement = rf'\1DONE\2'
            content_new = re.sub(pattern, replacement, content, count=1)
            if content_new != content:
                content = content_new
                # Update TODO Status and add status line
                entry_pattern = rf'(\*\* DONE {entry_num}\. (\S+)\n(?:.*\n)*?)(   - TODO Status: )TODO'
                def replace_done(m):
                    pkg_name = m.group(2)
                    return m.group(1) + f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})\n" + m.group(3) + "DONE"
                content = re.sub(entry_pattern, replace_done, content, count=1)
                done_count += 1

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(TODO_FILE))
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.write(content)
        shutil.move(tmp_path, TODO_FILE)
        print(f"Updated {TODO_FILE}: {done_count} DONE, {blocked_count} BLOCKED")
    except:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
