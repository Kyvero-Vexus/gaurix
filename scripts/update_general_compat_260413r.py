#!/usr/bin/env python3
"""Update general-compat.scm: add recipe-resolver-260413r module import and compat aliases."""

import shutil, tempfile, os

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

# Module import to add
NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260413r)\n"

# Compat aliases for -bin packages
BIN_ALIASES = [
    ("cutieascii", "cutieascii-bin"),
    ("mindustry-server", "mindustry-server-bin"),
]

def main():
    with open(COMPAT_FILE, "r") as f:
        content = f.read()

    # 1. Add module import if not present
    if "recipe-resolver-260413r" not in content:
        # Find the last recipe-resolver module import
        marker = "  #:use-module (gaurix packages recipe-resolver-260413p)\n"
        # Also check for 260413q
        if "recipe-resolver-260413q" not in content:
            q_module = "  #:use-module (gaurix packages recipe-resolver-260413q)\n"
            content = content.replace(marker, marker + q_module)
            marker = q_module

        if marker in content:
            content = content.replace(marker, marker + NEW_MODULE)
        else:
            # Try alternative marker
            alt_marker = "  #:use-module (gaurix packages recipe-resolver-260413p-blocked-notes)\n"
            if alt_marker in content:
                content = content.replace(alt_marker, alt_marker + NEW_MODULE)
            else:
                print("ERROR: Could not find insertion point for module import")
                return

    # 2. Add compat aliases section
    if "; --- recipe-resolver-260413r compat aliases ---" not in content:
        # Find end of file (before final closing paren or at EOF)
        # Look for the last compat alias section
        lines = content.split('\n')
        insert_idx = len(lines)

        # Find good insertion point: after last compat alias section
        for i in range(len(lines) - 1, -1, -1):
            if lines[i].strip().startswith("(define-public") or lines[i].strip().startswith("; ---"):
                insert_idx = i + 1
                break

        new_lines = []
        new_lines.append("")
        new_lines.append("; --- recipe-resolver-260413r compat aliases ---")
        for alias, parent in BIN_ALIASES:
            new_lines.append(f'(define-public {alias} (package (inherit {parent}) (name "{alias}")))')

        lines = lines[:insert_idx] + new_lines + lines[insert_idx:]
        content = '\n'.join(lines)

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(COMPAT_FILE))
    try:
        with os.fdopen(fd, "w") as tmp:
            tmp.write(content)
        shutil.move(tmp_path, COMPAT_FILE)
        print(f"Updated {COMPAT_FILE}: added module import + {len(BIN_ALIASES)} compat aliases")
    except:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
