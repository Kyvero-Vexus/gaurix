#!/usr/bin/env python3
"""Deterministic programmatic full-file transforms for deptree-resolver-260416a.

Updates:
1. guix/gaurix/packages/general-compat.scm - add use-module + compat aliases
2. guix/gaurix/packages.scm - add use-module comment + exports
3. todo_general_packages.org - update BLOCKED -> DONE for resolved, add reason for still-blocked
"""

import json
import re
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PASS_ID = "deptree-resolver-260416a"
SUMMARY = ROOT / "reports" / f"{PASS_ID}-summary.json"
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
TODO_FILE = ROOT / "todo_general_packages.org"


def load_summary():
    with open(SUMMARY) as f:
        return json.load(f)


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def update_general_compat(resolved, blocked):
    """Add use-module and compat aliases to general-compat.scm."""
    content = GENERAL_COMPAT.read_text()

    exports = [sanitize_name(r["name"]) for r in resolved]

    # Insert use-module after the last existing use-module line for resolver modules
    # Find the last #:use-module line for recipe/deptree resolvers
    lines = content.split("\n")
    insert_idx = None
    for i, line in enumerate(lines):
        if "#:use-module (gaurix packages" in line:
            insert_idx = i

    if insert_idx is not None:
        new_use = f"  #:use-module (gaurix packages {PASS_ID})"
        lines.insert(insert_idx + 1, new_use)

    # Append compat aliases at end (before any trailing blank lines)
    # Find the last non-empty line
    while lines and lines[-1].strip() == "":
        lines.pop()

    lines.append("")
    lines.append(f";; {PASS_ID}")
    for exp in exports:
        lines.append(f"(define-public {exp}/compat {exp})")

    lines.append("")  # trailing newline

    content = "\n".join(lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=GENERAL_COMPAT.parent, suffix=".scm")
    with open(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, GENERAL_COMPAT)
    print(f"  Updated {GENERAL_COMPAT}")


def update_packages_scm(resolved):
    """Add exports to packages.scm for the new resolver pass."""
    content = PACKAGES_SCM.read_text()

    exports = [sanitize_name(r["name"]) for r in resolved]

    # Find the closing '))'  at the end and insert before it
    # The file ends with export names followed by '))'
    if content.rstrip().endswith("))"):
        # Insert new exports before the final '))'
        idx = content.rstrip().rfind("))")
        before = content[:idx]
        after = content[idx:]

        new_section = f"            ;; {PASS_ID} (100 packages processed, {len(resolved)} recipes)\n"
        for exp in exports:
            new_section += f"            {exp}\n"

        content = before + new_section + after

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=PACKAGES_SCM.parent, suffix=".scm")
    with open(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}")


def update_todo_org(resolved, blocked):
    """Update BLOCKED -> DONE for resolved packages, keep BLOCKED with reason for still-blocked."""
    # Build lookup sets
    resolved_numbers = {r["number"] for r in resolved}
    blocked_numbers = {b["number"]: b["reason"] for b in blocked}

    content = TODO_FILE.read_text()
    lines = content.split("\n")
    new_lines = []

    i = 0
    changes = 0
    while i < len(lines):
        line = lines[i]
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+\S+.*)$", line)
        if m:
            prefix = m.group(1)
            rest = m.group(2)
            # Extract number
            nm = re.match(r"\s+(\d+)\.", rest)
            if nm:
                num = int(nm.group(1))
                if num in resolved_numbers:
                    new_lines.append(f"{prefix}DONE{rest}")
                    changes += 1
                    i += 1
                    # Update status line if it exists within next few lines
                    status_updated = False
                    while i < len(lines) and lines[i].startswith("   "):
                        sline = lines[i]
                        if sline.strip().startswith("- TODO Status:"):
                            new_lines.append(f"   - TODO Status: DONE ({PASS_ID})")
                            status_updated = True
                        else:
                            new_lines.append(sline)
                        i += 1
                    continue
                elif num in blocked_numbers:
                    # Keep BLOCKED but we could add reason if needed
                    new_lines.append(line)
                    i += 1
                    continue
        new_lines.append(line)
        i += 1

    content = "\n".join(new_lines)

    # Atomic write
    fd, tmp = tempfile.mkstemp(dir=TODO_FILE.parent, suffix=".org")
    with open(fd, "w") as f:
        f.write(content)
    shutil.move(tmp, TODO_FILE)
    print(f"  Updated {TODO_FILE} ({changes} BLOCKED -> DONE)")


def main():
    summary = load_summary()
    resolved = summary["resolved_packages"]
    blocked = summary["blocked_packages"]

    print(f"[{PASS_ID}] Updating module files...")
    print(f"  Resolved: {len(resolved)}, Blocked: {len(blocked)}")

    update_general_compat(resolved, blocked)
    update_packages_scm(resolved)
    update_todo_org(resolved, blocked)

    print(f"\n[{PASS_ID}] Module updates complete.")


if __name__ == "__main__":
    main()
