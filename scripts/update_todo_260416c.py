#!/usr/bin/env python3
"""Update todo_general_packages.org: change BLOCKED -> DONE for resolved packages,
keep BLOCKED with reason for still-blocked packages.

Uses deterministic full-file transform (read, compute, write temp, atomic move).
"""

import json
import os
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260416c"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
TODO_FILE = ROOT / "todo_general_packages.org"


def main():
    with open(SUMMARY) as f:
        summary = json.load(f)

    resolved_numbers = {p["number"] for p in summary["resolved_packages"]}
    blocked_pkgs = {p["number"]: p for p in summary["blocked_packages"]}

    print(f"[{PASS_ID}] Updating todo: {len(resolved_numbers)} resolved, {len(blocked_pkgs)} still blocked")

    content = TODO_FILE.read_text()
    lines = content.split("\n")
    new_lines = []
    updated = 0

    for line in lines:
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+)(\d+)\.\s+(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            space = m.group(2)
            number = int(m.group(3))
            name = m.group(4)
            rest = m.group(5)

            if number in resolved_numbers:
                new_line = f"{prefix}DONE{space}{number}. {name}{rest}"
                # Add reason tag if not already present
                if PASS_ID not in new_line:
                    new_line = new_line.rstrip()
                    new_line += f"  :{PASS_ID}:recipe-generated:"
                new_lines.append(new_line)
                updated += 1
            elif number in blocked_pkgs:
                reason = blocked_pkgs[number]["reason"]
                new_line = line.rstrip()
                if PASS_ID not in new_line:
                    new_line += f"  :{PASS_ID}:{reason}:"
                new_lines.append(new_line)
            else:
                new_lines.append(line)
        else:
            new_lines.append(line)

    new_content = "\n".join(new_lines)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org.tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(new_content)
        shutil.move(tmp_path, TODO_FILE)
    except:
        os.unlink(tmp_path)
        raise

    print(f"  Updated {updated} packages from BLOCKED -> DONE")
    print(f"  {len(blocked_pkgs)} packages remain BLOCKED with reason codes")


if __name__ == "__main__":
    main()
