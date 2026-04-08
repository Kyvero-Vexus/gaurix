#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for deptree-resolver-260408a pass.
Updates BLOCKED entries for resolved packages with DONE status.
Also updates blocked entries that remain BLOCKED with reason codes.
"""
import re
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: package-name → (version, description for status line)
RESOLVED = {
    "cs-bin": ("3.1.0", "codespelunker Go binary, MIT"),
    "crtui-bin": ("0.1.2", "container registry TUI Go binary, MIT"),
    "crycco-bin": ("0.5.2", "literate programming static binary, MIT"),
    "cubyz-bin": ("0.2.0", "voxel sandbox game Zig binary, GPL-3.0"),
    "crunch": ("3.6", "wordlist generator C source, GPL-2.0"),
    "icu74": ("74.2", "ICU library v74 source build, Unicode/X11"),
    "csvi-bin": ("1.23.1", "terminal CSV editor Go binary, MIT"),
}

MODULE = "deptree-resolver-260408a"


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Phase 1: Track which package each line belongs to (from headers)
    current_pkg = None
    pkg_for_line = [None] * len(lines)

    for i, line in enumerate(lines):
        header_match = re.match(r'^\*\* (?:BLOCKED|DONE|FAILED) \d+\. (.+)$', line)
        if header_match:
            pkg_name = header_match.group(1).strip()
            if pkg_name in RESOLVED:
                current_pkg = pkg_name
            else:
                current_pkg = None
        elif line.startswith("** "):
            current_pkg = None
        pkg_for_line[i] = current_pkg

    # Phase 2: Insert DONE status lines after relevant status lines
    new_lines = []
    changes = 0
    resolved_set = set()

    for i, line in enumerate(lines):
        new_lines.append(line)

        pkg = pkg_for_line[i]
        if pkg and pkg not in resolved_set:
            # Look for status lines to add DONE after
            if ("BLOCKED" in line or "NEEDS_RECIPE_DESIGN" in line) and "Status:" in line and "DONE" not in line:
                version, desc = RESOLVED[pkg]
                done_line = (
                    f"   - Status: DONE: recipe in {MODULE}.scm "
                    f"({pkg} v{version}, {desc})\n"
                )
                new_lines.append(done_line)
                resolved_set.add(pkg)
                changes += 1

    # Phase 3: Flip BLOCKED headers to DONE and update TODO Status lines
    final_lines = []
    for i, line in enumerate(new_lines):
        # Flip BLOCKED headers to DONE for resolved packages
        header_match = re.match(r'^(\*\* )BLOCKED( \d+\. )(.+)$', line)
        if header_match:
            pkg_in_header = header_match.group(3).strip()
            if pkg_in_header in resolved_set:
                line = f"{header_match.group(1)}DONE{header_match.group(2)}{pkg_in_header}\n"

        # Update TODO Status lines for resolved packages
        if "TODO Status: BLOCKED" in line or "TODO Status: TODO" in line:
            # Check if previous lines (up to 10) have our DONE status
            lookback = new_lines[max(0, i - 10):i]
            for lb in lookback:
                if f"recipe in {MODULE}" in lb:
                    line = line.replace("TODO Status: BLOCKED", "TODO Status: DONE")
                    line = line.replace("TODO Status: TODO", "TODO Status: DONE")
                    break

        final_lines.append(line)

    # Write atomically
    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(final_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(resolved_set))}")
    unresolved = set(RESOLVED.keys()) - resolved_set
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
