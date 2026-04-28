#!/usr/bin/env python3
"""
Programmatically add recipe-resolver-260427q to general-compat.scm
using full-file read/transform/write approach (per repo rules 8-10).
"""
import json
import shutil
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
RESOLVER_ID = "recipe-resolver-260427q"
REPORT = ROOT / "reports" / f"{RESOLVER_ID}-selection.json"

def main():
    # Load the package list
    with open(REPORT) as f:
        report = json.load(f)

    pkg_names = [p['guix_name'] for p in report['packages']]

    # Read current file
    content = COMPAT.read_text()
    lines = content.split('\n')

    # Find the right place to insert the #:use-module line
    # It should go after the first existing #:use-module line
    use_module_line = f"  #:use-module (gaurix packages {RESOLVER_ID})"

    # Check if already present
    if RESOLVER_ID in content:
        print(f"  {RESOLVER_ID} already in general-compat.scm, skipping use-module insertion")
    else:
        # Insert after the (define-module line, before the first existing #:use-module
        insert_idx = None
        for i, line in enumerate(lines):
            if line.strip().startswith('#:use-module'):
                insert_idx = i
                break

        if insert_idx is not None:
            lines.insert(insert_idx, use_module_line)
            print(f"  Inserted #:use-module at line {insert_idx + 1}")
        else:
            print("  ERROR: Could not find insertion point for #:use-module")
            return False

    # Find where to insert re-exports - at the end of the file, before closing paren if any
    # Look for the last re-export line
    last_reexport_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith('(re-export'):
            last_reexport_idx = i

    if last_reexport_idx is not None:
        # Insert after the last re-export
        new_reexports = []
        for name in pkg_names:
            reexport_line = f"(re-export {name})"
            if reexport_line not in content:
                new_reexports.append(reexport_line)

        if new_reexports:
            # Insert all new re-exports after the last existing one
            for j, reexport in enumerate(new_reexports):
                lines.insert(last_reexport_idx + 1 + j, reexport)
            print(f"  Inserted {len(new_reexports)} re-export lines")
        else:
            print("  All re-exports already present")
    else:
        # Append at end
        for name in pkg_names:
            lines.append(f"(re-export {name})")
        print(f"  Appended {len(pkg_names)} re-export lines at end of file")

    # Write to temp file, then atomic move
    new_content = '\n'.join(lines)
    with tempfile.NamedTemporaryFile(mode='w', dir=COMPAT.parent, suffix='.scm',
                                      delete=False) as tmp:
        tmp.write(new_content)
        tmp_path = Path(tmp.name)

    shutil.move(str(tmp_path), str(COMPAT))
    print(f"  Updated {COMPAT} ({len(lines)} lines)")
    return True

if __name__ == '__main__':
    success = main()
    if not success:
        exit(1)
