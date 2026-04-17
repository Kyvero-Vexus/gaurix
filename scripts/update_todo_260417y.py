#!/usr/bin/env python3
"""Update todo_general_packages.org for recipe-resolver-260417y pass."""
import re
import shutil
import tempfile

TODO_FILE = "todo_general_packages.org"
PASS_ID = "recipe-resolver-260417y"

# Packages resolved with recipes (26)
RESOLVED = {
    "perl-cpan-distnameinfo": (72337, "perl-cpan-distnameinfo v0.12, perl-build-system, Artistic-1.0"),
    "perl-const-fast": (None, "perl-const-fast v0.014, perl-build-system, Artistic-1.0"),  # need line
    "perl-data-printer": (72401, "perl-data-printer v1.002001, perl-build-system, Artistic-1.0"),
    "perl-object-pad": (72343, "perl-object-pad v0.825, perl-build-system, Artistic-1.0"),
    "salome-configuration": (67903, "salome-configuration v9.15.0, cmake-build-system, LGPL-2.1+"),
    "janet": (46751, "janet v1.41.2, gnu-build-system (make), MIT"),
    "pyghmi": (46832, "pyghmi v1.6.15, pyproject-build-system, Apache-2.0"),
    "python-uritools": (None, "python-uritools v4.0.3, pyproject-build-system, MIT (new dep for pyhanko-certvalidator)"),
    "python-pyhanko-certvalidator": (68191, "python-pyhanko-certvalidator v0.30.2, pyproject-build-system, MIT"),
    "python-pyhanko": (68185, "python-pyhanko v0.34.1, pyproject-build-system, MIT"),
    "python-certomancer-csc-dummy": (68172, "python-certomancer-csc-dummy v0.4.2, pyproject-build-system, MIT"),
    "python-pdf2doi": (61833, "python-pdf2doi v1.7, pyproject-build-system, MIT"),
    "python-typedunits": (67357, "python-typedunits v0.0.2, pyproject-build-system, Apache-2.0"),
    "python-ompython": (67428, "python-ompython v4.0.1, python-build-system, GPL-3.0+"),
    "anyfetch": (68087, "anyfetch v1.1.0, python/copy, GPL-3.0"),
    "venice-cli-bin": (61408, "venice-cli-bin v0.1.13, copy-build-system, GPL-3.0"),
    "plugdata-bin": (63310, "plugdata-bin v0.9.3-2, copy-build-system, GPL-3.0"),
    "blink-player-bin": (63410, "blink-player-bin v1.0.0-alpha04, copy-build-system (deb), GPL-3.0"),
    "famistudio-bin": (67970, "famistudio-bin v4.5.0, copy-build-system (zip), MIT"),
    "dcvviewer-bin": (67781, "dcvviewer-bin v2024.0.8004, copy-build-system (deb), proprietary"),
    "pdfmerger": (68056, "pdfmerger v1.1.2, cmake-build-system (Qt5), GPL-3.0"),
    "nview": (68281, "nview v0.30, cmake-build-system (Qt6), GPL-2.0"),
    "python-trezor": (72524, "python-trezor v0.20.0, pyproject-build-system, LGPL-3.0"),
    "alsaplayer": (67830, "alsaplayer v0.99.82, gnu-build-system (autotools), GPL-3.0+"),
    "svxlink-sounds-en-us-heather": (67769, "svxlink-sounds-en-us-heather v24.02, copy-build-system, CC-BY-SA-4.0"),
    "adbmanager-bin": (61279, "adbmanager-bin v4.0, copy-build-system (deb), GPL-3.0"),
}

# Packages remaining BLOCKED (4)
BLOCKED = {
    "wirecontrol-git": (67860, "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_GUIX_DEPS: needs libastal-wireplumber (not in Guix); A1: libastal-wireplumber not packaged; A2: Vala+GTK4 build chain with custom lib; A3: no alternative without libastal"),
    "quickbib": (67793, "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_GUIX_DEPS: needs python-doi2bib3 and python-pyqt6 (not in Guix); A1: doi2bib3 not on PyPI; A2: PyQt6 requires SIP/complex build; A3: no simpler alternative"),
    "0xtools": (67909, "BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD: v3.0.3 C components need libbpf/eBPF/clang for kernel tracing; A1: libbpf available but eBPF build untested in Guix; A2: Python-only subset lacks core functionality; A3: kernel version dependency (5.11+)"),
    "python-ompython": (67428, None),  # already resolved above, this is the runtime blocked note
}

# Line numbers where packages appear - map pkg name to todo line numbers
# We need to find the actual lines dynamically
def update_todo():
    with open(TODO_FILE, 'r') as f:
        lines = f.readlines()

    # Build index of package headings
    pkg_lines = {}
    for i, line in enumerate(lines):
        m = re.match(r'\*\* (?:FAILED|BLOCKED|DONE) (\d+)\. (.+)', line)
        if m:
            pkg_name = m.group(2).strip().split(' ')[0]
            # Remove tags like :recipe-resolver-260417w:recipe-generated:
            pkg_name = re.sub(r'\s+:.*$', '', pkg_name)
            if pkg_name not in pkg_lines:
                pkg_lines[pkg_name] = []
            pkg_lines[pkg_name].append(i)

    updates = []  # list of (line_index, new_status_line)

    # For RESOLVED packages: add DONE status and change heading to DONE
    for pkg_name, (hint_line, desc) in RESOLVED.items():
        if pkg_name in pkg_lines:
            for idx in pkg_lines[pkg_name]:
                heading = lines[idx]
                # Only process headings still marked FAILED/BLOCKED
                if '** FAILED' in heading or '** BLOCKED' in heading:
                    # Change heading to DONE with tag
                    new_heading = heading.replace('** FAILED', '** DONE').replace('** BLOCKED', '** DONE')
                    if f':{PASS_ID}:' not in new_heading:
                        new_heading = new_heading.rstrip()
                        if not new_heading.endswith(':'):
                            new_heading += f'  :{PASS_ID}:recipe-generated:'
                        else:
                            new_heading += f'{PASS_ID}:recipe-generated:'
                        new_heading += '\n'
                    updates.append((idx, 'heading', new_heading))

                    # Find where to insert status line (after last status line in block)
                    j = idx + 1
                    last_status_line = idx
                    while j < len(lines) and not lines[j].startswith('** '):
                        if '- Status:' in lines[j]:
                            last_status_line = j
                        j += 1
                    status_text = f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in {PASS_ID}.scm ({desc}) ({PASS_ID})\n"
                    updates.append((last_status_line, 'insert_after', status_text))
                    break  # Only update first occurrence

    # For BLOCKED packages (wirecontrol-git, quickbib, 0xtools): add exhausted status
    for pkg_name, (hint_line, status) in BLOCKED.items():
        if status is None:
            continue  # python-ompython is handled as resolved
        if pkg_name in pkg_lines:
            for idx in pkg_lines[pkg_name]:
                heading = lines[idx]
                if '** FAILED' in heading or '** BLOCKED' in heading:
                    j = idx + 1
                    last_status_line = idx
                    while j < len(lines) and not lines[j].startswith('** '):
                        if '- Status:' in lines[j]:
                            last_status_line = j
                        j += 1
                    status_text = f"   - Status: {status} ({PASS_ID})\n"
                    updates.append((last_status_line, 'insert_after', status_text))
                    break

    # Apply updates (sort by line number descending to avoid index shifts)
    updates.sort(key=lambda x: x[0], reverse=True)

    for line_idx, action, content in updates:
        if action == 'heading':
            lines[line_idx] = content
        elif action == 'insert_after':
            lines.insert(line_idx + 1, content)

    # Atomic write
    with tempfile.NamedTemporaryFile(mode='w', dir='.', delete=False, suffix='.tmp') as tmp:
        tmp.writelines(lines)
        tmp_path = tmp.name
    shutil.move(tmp_path, TODO_FILE)

    print(f"Updated {len(updates)} entries in {TODO_FILE}")

if __name__ == '__main__':
    update_todo()
