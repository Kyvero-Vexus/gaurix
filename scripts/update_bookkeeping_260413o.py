#!/usr/bin/env python3
"""Update bookkeeping for deptree-resolver-260413o.
- Update todo_general_packages.org: mark 16 resolved packages as DONE
- Update general-compat.scm: add new module import
- Update packages.scm: add new module import (if needed)
"""

import re
import sys
import shutil
import tempfile
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ORG_FILE = REPO_ROOT / "todo_general_packages.org"
COMPAT_FILE = REPO_ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"

RUN_ID = "deptree-resolver-260413o"

# Packages resolved with recipes (BLOCKED -> DONE)
RESOLVED_PACKAGES = {
    "inkscape-open-symbols-git": "DONE: recipe in deptree-resolver-260413o.scm (inkscape-open-symbols-git v1.2.1, copy-build-system, MIT)",
    "inori": "DONE: recipe in deptree-resolver-260413o.scm (inori v0.3.0, cargo-build-system, GPL-3.0)",
    "inotify-info": "DONE: recipe in deptree-resolver-260413o.scm (inotify-info v0.0.4, gnu-build-system, MIT)",
    "ipscan": "DONE: recipe in deptree-resolver-260413o.scm (ipscan v3.9.3, copy-build-system, GPL-2.0)",
    "jasm-bin": "DONE: recipe in deptree-resolver-260413o.scm (jasm-bin v0.7.0, copy-build-system, MIT)",
    "jid": "DONE: recipe in deptree-resolver-260413o.scm (jid v0.7.6, go-build-system, MIT)",
    "journald-broker": "DONE: recipe in deptree-resolver-260413o.scm (journald-broker v0.7.0, cargo-build-system, GPL-3.0+)",
    "k3s": "DONE: recipe in deptree-resolver-260413o.scm (k3s-bin v1.35.2+k3s1, copy-build-system, Apache-2.0)",
    "k6": "DONE: recipe in deptree-resolver-260413o.scm (k6 v1.7.1, go-build-system, AGPL-3.0+)",
    "kak-tree-sitter": "DONE: recipe in deptree-resolver-260413o.scm (kak-tree-sitter v3.2.0, cargo-build-system, BSD-3-Clause)",
    "kaval-bin": "DONE: recipe in deptree-resolver-260413o.scm (kaval-bin v0.1.0, copy-build-system, MIT)",
    "kdrive-bin": "DONE: recipe in deptree-resolver-260413o.scm (kdrive-bin v3.8.2.6, copy-build-system, GPL-2.0)",
    "kicad-library-espressif-git": "DONE: recipe in deptree-resolver-260413o.scm (kicad-library-espressif-git v0.1, copy-build-system, CC-BY-SA-4.0)",
    "klein-bin": "DONE: recipe in deptree-resolver-260413o.scm (klein-bin v0.6.0, copy-build-system, Apache-2.0)",
    "krep-git": "DONE: recipe in deptree-resolver-260413o.scm (krep-git v2.2.0, gnu-build-system, BSD-2-Clause)",
    "kumono": "DONE: recipe in deptree-resolver-260413o.scm (kumono v0.77.0, cargo-build-system, MIT-0)",
}


def update_org_file():
    """Update org file: change BLOCKED to DONE for resolved packages."""
    print(f"Reading {ORG_FILE}...", file=sys.stderr)
    with open(ORG_FILE, 'r') as f:
        lines = f.readlines()

    changed = 0
    i = 0
    while i < len(lines):
        for pkg_name, status_text in RESOLVED_PACKAGES.items():
            pattern = re.compile(
                r'^(\*\* )BLOCKED( \d+\. ' + re.escape(pkg_name) + r')$'
            )
            m = pattern.match(lines[i].rstrip('\n'))
            if m:
                lines[i] = f"{m.group(1)}DONE{m.group(2)}\n"
                # Update the Status line if it exists within next 5 lines
                for j in range(i + 1, min(i + 8, len(lines))):
                    if lines[j].strip().startswith('- Status:'):
                        lines[j] = f"   - Status: {status_text}\n"
                        break
                    if lines[j].strip().startswith('- TODO Status:'):
                        lines[j] = f"   - TODO Status: DONE\n"
                        break
                changed += 1
                break
        i += 1

    print(f"Updated {changed} packages from BLOCKED -> DONE", file=sys.stderr)

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=ORG_FILE.parent, suffix='.org')
    try:
        with open(fd, 'w') as f:
            f.writelines(lines)
        shutil.move(tmp_path, ORG_FILE)
        print(f"Wrote {ORG_FILE}", file=sys.stderr)
    except Exception:
        Path(tmp_path).unlink(missing_ok=True)
        raise


def update_general_compat():
    """Add the new module import to general-compat.scm."""
    print(f"Reading {COMPAT_FILE}...", file=sys.stderr)
    with open(COMPAT_FILE, 'r') as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {RUN_ID})"

    if new_import in content:
        print("Module already imported in general-compat.scm", file=sys.stderr)
        return

    # Find the last #:use-module line for gaurix packages deptree-resolver
    # and add after it
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages deptree-resolver-' in line:
            insert_idx = i

    if insert_idx is None:
        # Fallback: find any gaurix packages use-module
        for i, line in enumerate(lines):
            if '#:use-module (gaurix packages' in line:
                insert_idx = i

    if insert_idx is not None:
        lines.insert(insert_idx + 1, new_import)
        content = '\n'.join(lines)

        fd, tmp_path = tempfile.mkstemp(dir=COMPAT_FILE.parent, suffix='.scm')
        try:
            with open(fd, 'w') as f:
                f.write(content)
            shutil.move(tmp_path, COMPAT_FILE)
            print(f"Added module import to {COMPAT_FILE}", file=sys.stderr)
        except Exception:
            Path(tmp_path).unlink(missing_ok=True)
            raise
    else:
        print("WARNING: Could not find insertion point for module import", file=sys.stderr)


def main():
    update_org_file()
    update_general_compat()
    print("\nDone!", file=sys.stderr)


if __name__ == '__main__':
    main()
