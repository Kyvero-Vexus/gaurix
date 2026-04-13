#!/usr/bin/env python3
"""
Update packages.scm, general-compat.scm, and todo_general_packages.org
for deptree-resolver-260408h.
"""

import json
import os
import re
import tempfile

ROOT = "/home/slime/projects/gaurix"
PACKAGES_SCM = os.path.join(ROOT, "guix/gaurix/packages.scm")
GENERAL_COMPAT = os.path.join(ROOT, "guix/gaurix/packages/general-compat.scm")
ORG_FILE = os.path.join(ROOT, "todo_general_packages.org")
SELECTION_JSON = os.path.join(ROOT, "reports/deptree-resolver-260408h-selection.json")
RECIPE_SCM = os.path.join(ROOT, "guix/gaurix/packages/deptree-resolver-260408h.scm")
RUN_ID = "deptree-resolver-260408h"


def load_selection():
    with open(SELECTION_JSON) as f:
        return json.load(f)


def get_defined_packages():
    """Get all define-public names from the recipe .scm."""
    exports = []
    with open(RECIPE_SCM) as f:
        for line in f:
            m = re.match(r"\(define-public\s+([a-z0-9][\w.-]*)", line)
            if m:
                exports.append(m.group(1))
    return exports


def guix_name(aur_name):
    return aur_name.lower().replace("_", "-")


# ── 1. Update packages.scm ─────────────────────────────────────────────

def update_packages_scm(exports):
    """Add #:use-module and #:re-export for the new resolver module."""
    with open(PACKAGES_SCM) as f:
        content = f.read()

    # Check if already added
    if f"(gaurix packages {RUN_ID})" in content:
        print(f"packages.scm: already has {RUN_ID}, skipping")
        return

    # Find the last #:use-module line and add ours after it
    lines = content.split("\n")
    new_lines = []
    last_use_module_idx = -1

    for i, line in enumerate(lines):
        if "#:use-module" in line and "gaurix packages" in line:
            last_use_module_idx = i

    # Find the last #:re-export line
    last_re_export_idx = -1
    for i, line in enumerate(lines):
        if line.strip() and not line.strip().startswith(";"):
            # Look for package name patterns in the re-export section
            pass

    # Strategy: insert use-module after last use-module, add exports to re-export
    use_module_line = f"  #:use-module (gaurix packages {RUN_ID})"
    blocked_notes_line = f"  #:use-module (gaurix packages {RUN_ID}-blocked-notes)"

    inserted_module = False
    inserted_exports = False

    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_module_idx and not inserted_module:
            new_lines.append(use_module_line)
            new_lines.append(blocked_notes_line)
            inserted_module = True

    # Now find the closing paren of #:re-export and add exports before it
    # The re-export section has package names listed one per line
    # Find the last export entry before the closing of the module definition
    result_lines = []
    found_re_export_end = False
    for i, line in enumerate(new_lines):
        # Look for the comment marker for the previous run's exports end
        # and add ours in the same area
        result_lines.append(line)

    # Find where exports are listed (after last use-module, before the closing paren)
    # Look for pattern of bare identifiers that are package exports
    final_lines = []
    added_exports = False
    for i, line in enumerate(result_lines):
        # Find the line just before the closing ) of the define-module
        # Pattern: a line with just ")" or with exports listed
        if not added_exports and i > 0:
            # Check if this is near the end of the re-export section
            # Look for the comment about previous run
            if f";; {RUN_ID}" in line:
                added_exports = True  # already added
        final_lines.append(line)

    # Simpler approach: find the last line that has a bare identifier (export)
    # and add after it
    output_lines = []
    export_comment = f"            ;; {RUN_ID}"
    exports_text = "\n".join(f"            {e}" for e in exports)
    added = False

    for i, line in enumerate(result_lines):
        output_lines.append(line)
        # After the last #:use-module block and before the #:re-export closing
        # find the last export line

    # Most reliable: find last occurrence of a known package name in re-export
    # and add after the block
    # Actually, let's find the pattern: look for "#:re-export" or the section
    # where exports are listed

    # Read the actual structure
    # The file has: (define-module ... #:use-module ... #:re-export (sym1 sym2 ...))
    # Let's find the #:re-export section

    # New approach: just find where to inject
    output = []
    i = 0
    lines = result_lines
    injected = False
    while i < len(lines):
        line = lines[i]
        output.append(line)
        # After finding the last re-export-able line before the module close
        # Look for a line that has ";; deptree-resolver-260408g" (previous run)
        if not injected and ";; deptree-resolver-260408g" in line:
            # Add our exports after this block
            # Scan forward to find the end of its exports
            pass
        i += 1

    # Simplest reliable approach: append before the final closing paren of the file
    # that ends the re-export list
    content_with_module = "\n".join(result_lines)

    # Find the last )) which closes the define-module
    # Insert exports before the last #:re-export closing
    # Actually let's just use a different strategy:
    # Find where the previous run's exports end and add ours

    # Find "deptree-resolver-260408g" section end in re-exports
    prev_run = "deptree-resolver-260408g"
    in_prev_section = False
    insert_idx = None

    for i, line in enumerate(result_lines):
        stripped = line.strip()
        if f";; {prev_run}" in line:
            in_prev_section = True
        elif in_prev_section and stripped.startswith(";;"):
            # New section comment - insert before this
            insert_idx = i
            in_prev_section = False
            break
        elif in_prev_section and (stripped == "" or stripped.startswith("#:") or stripped == ")"):
            insert_idx = i
            in_prev_section = False
            break

    if insert_idx is None:
        # Fallback: find the last line before module close that has an identifier
        for i in range(len(result_lines) - 1, -1, -1):
            stripped = result_lines[i].strip()
            if stripped and not stripped.startswith(";") and stripped not in (")", ""):
                if re.match(r"^[a-z]", stripped):
                    insert_idx = i + 1
                    break

    if insert_idx is not None:
        final = result_lines[:insert_idx]
        final.append(f"            ;; {RUN_ID}")
        for e in exports:
            final.append(f"            {e}")
        final.extend(result_lines[insert_idx:])
    else:
        final = result_lines
        print("WARNING: Could not find insertion point for exports")

    tmp = PACKAGES_SCM + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(final))
    os.replace(tmp, PACKAGES_SCM)
    print(f"packages.scm: updated with {len(exports)} exports")


# ── 2. Update general-compat.scm ──────────────────────────────────────

def update_general_compat(selection, exports):
    """Add compat aliases for font and name-mismatch packages."""
    with open(GENERAL_COMPAT) as f:
        content = f.read()

    if f"; --- {RUN_ID}" in content:
        print(f"general-compat.scm: already has {RUN_ID}, skipping")
        return

    # Add use-module for our recipe module
    use_module = f"  #:use-module (gaurix packages {RUN_ID})"

    lines = content.split("\n")

    # Insert use-module after last existing use-module
    new_lines = []
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_idx = i

    for i, line in enumerate(lines):
        new_lines.append(line)
        if i == last_use_idx:
            new_lines.append(use_module)

    # Build compat aliases
    # For fonts: ttf-X -> font-X (AUR name -> guix name)
    aliases = []
    resolved_names = selection.get("resolved", [])
    for aur_name in resolved_names:
        gname = guix_name(aur_name)
        # Font alias: ttf-foo -> font-foo
        if aur_name.startswith("ttf-") or aur_name.startswith("otf-"):
            font_gname = "font-" + gname[4:]  # strip ttf-/otf- prefix
            # The define-public in recipe uses font- prefix, so alias from aur name
            if font_gname in exports:
                aliases.append((gname, font_gname))
        # Other name mismatches
        elif gname != aur_name and gname in exports:
            aliases.append((aur_name, gname))

    if not aliases:
        # Just write with the module import
        tmp = GENERAL_COMPAT + ".tmp"
        with open(tmp, "w") as f:
            f.write("\n".join(new_lines))
        os.replace(tmp, GENERAL_COMPAT)
        print("general-compat.scm: updated (module import only, no new aliases)")
        return

    # Add alias definitions at end of file
    alias_lines = [f"\n; --- {RUN_ID} compat aliases ---"]
    for aur_name, gname in aliases:
        alias_lines.append(
            f'(define-public {aur_name} (package (inherit {gname}) (name "{aur_name}")))'
        )

    new_lines.extend(alias_lines)

    tmp = GENERAL_COMPAT + ".tmp"
    with open(tmp, "w") as f:
        f.write("\n".join(new_lines))
    os.replace(tmp, GENERAL_COMPAT)
    print(f"general-compat.scm: updated with {len(aliases)} aliases")


# ── 3. Update org file ────────────────────────────────────────────────

def update_org_file(selection):
    """Update BLOCKED -> DONE for resolved, add block reasons for newly blocked."""
    resolved = set(selection.get("resolved", []))
    blocked_map = {}
    # Load blocked details from the blocked notes
    blocked_names = set(selection.get("blocked", []))

    # Map package names to their org numbers from selection
    pkg_numbers = {}
    for item in selection.get("selected", []):
        pkg_numbers[item["package"]] = item["org_number"]

    with open(ORG_FILE) as f:
        lines = f.readlines()

    new_lines = []
    i = 0
    resolved_count = 0
    blocked_count = 0

    while i < len(lines):
        line = lines[i]
        # Match BLOCKED heading
        m = re.match(r"^(\*\*\s+)BLOCKED(\s+\d+\.\s+)(\S+)(.*)", line)
        if m:
            prefix = m.group(1)
            num_part = m.group(2)
            name = m.group(3)
            rest = m.group(4)

            if name in resolved:
                # Change BLOCKED -> DONE
                new_line = f"{prefix}DONE{num_part}{name}{rest}\n"
                new_lines.append(new_line)
                resolved_count += 1
                # Add status note after the heading
                i += 1
                # Skip existing content lines until next heading
                while i < len(lines) and not lines[i].startswith("**"):
                    new_lines.append(lines[i])
                    i += 1
                # Insert resolved status note
                new_lines.insert(len(new_lines), f"   - TODO Status: DONE ({RUN_ID})\n")
                continue
            elif name in blocked_names:
                blocked_count += 1
                new_lines.append(line)
                i += 1
                continue
            else:
                new_lines.append(line)
                i += 1
                continue
        else:
            new_lines.append(line)
            i += 1

    tmp = ORG_FILE + ".tmp"
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    os.replace(tmp, ORG_FILE)
    print(f"org file: {resolved_count} resolved (BLOCKED->DONE), {blocked_count} blocked noted")


# ── MAIN ────────────────────────────────────────────────────────────────

def main():
    selection = load_selection()
    exports = get_defined_packages()

    print(f"=== Updating for {RUN_ID} ===")
    print(f"Resolved: {len(selection['resolved'])}")
    print(f"Blocked: {len(selection['blocked'])}")
    print(f"Exports: {len(exports)}")
    print()

    update_packages_scm(exports)
    update_general_compat(selection, exports)
    update_org_file(selection)

    print("\nDone!")


if __name__ == "__main__":
    main()
