#!/usr/bin/env python3
"""
Deterministic full-file transform for general-compat.scm:
1. Add #:use-module line for recipe-resolver-260418h after the 260418g line.
2. Append re-export statements for recipe-resolver-260418h at end of file.

Uses atomic file operations (write temp, os.rename).
"""

import os
import sys
import tempfile

TARGET = "/home/slime/projects/gaurix/guix/gaurix/packages/general-compat.scm"

# --- Read ---
with open(TARGET, "r") as f:
    lines = f.readlines()

print(f"Read {len(lines)} lines from {TARGET}")

# --- Transform 1: Insert #:use-module line ---
ANCHOR_IMPORT = "  #:use-module (gaurix packages recipe-resolver-260418g)\n"
NEW_IMPORT    = "  #:use-module (gaurix packages recipe-resolver-260418h)\n"

import_inserted = False
new_lines = []
for line in lines:
    new_lines.append(line)
    if line == ANCHOR_IMPORT:
        new_lines.append(NEW_IMPORT)
        import_inserted = True

if not import_inserted:
    print(f"ERROR: Could not find anchor line: {ANCHOR_IMPORT.strip()!r}", file=sys.stderr)
    sys.exit(1)

print("Transform 1: inserted #:use-module line after recipe-resolver-260418g")

# --- Transform 2: Append re-export block ---
RE_EXPORT_BLOCK = """
;;; recipe-resolver-260418h
(re-export ttf-symbola)
(re-export otf-symbola)
(re-export svxlink-sounds-en-us-heather-16k)
(re-export devkit-env)
(re-export random)
(re-export kak-ansi)
(re-export jelly)
(re-export fladder-bin)
(re-export parm-bin)
(re-export opendeck-bin)
(re-export vkd3d-proton-bin)
(re-export piliplus-bin)
(re-export hyprshell-bin)
(re-export python-pandas-docs)
(re-export desktopius)
(re-export nextcloud-app-user-usage-report)
(re-export kak-bundle-git)
(re-export duperemove-service)
(re-export tlp-rdw-systemd)
(re-export mii-emu)
(re-export sedutil)
(re-export motion-git)
(re-export nikki-editor)
(re-export responder)
(re-export libreoffice-extension-h2orestart)
(re-export pipewire-module-xrdp)
(re-export libnick)
(re-export maddy)
"""

# Ensure the existing content ends with a newline before appending
content = "".join(new_lines)
if not content.endswith("\n"):
    content += "\n"
content += RE_EXPORT_BLOCK

print("Transform 2: appended re-export block (28 packages)")

# --- Atomic write ---
dir_name = os.path.dirname(TARGET)
fd, tmp_path = tempfile.mkstemp(dir=dir_name, suffix=".scm.tmp")
try:
    with os.fdopen(fd, "w") as tmp_f:
        tmp_f.write(content)
    os.rename(tmp_path, TARGET)
    print(f"Atomic rename: {tmp_path} -> {TARGET}")
except:
    os.unlink(tmp_path)
    raise

# --- Verify ---
with open(TARGET, "r") as f:
    final = f.read()

final_lines = final.splitlines()
print(f"Final file: {len(final_lines)} lines")

# Check 1: import line present
if "  #:use-module (gaurix packages recipe-resolver-260418h)" in final:
    print("VERIFY OK: #:use-module line for recipe-resolver-260418h found")
else:
    print("VERIFY FAIL: #:use-module line for recipe-resolver-260418h NOT found", file=sys.stderr)
    sys.exit(1)

# Check 2: re-export block present
if "(re-export maddy)" in final and ";;; recipe-resolver-260418h" in final:
    print("VERIFY OK: re-export block for recipe-resolver-260418h found")
else:
    print("VERIFY FAIL: re-export block for recipe-resolver-260418h NOT found", file=sys.stderr)
    sys.exit(1)

# Check 3: ordering — import line comes right after 260418g
import_idx_g = None
import_idx_h = None
for i, line in enumerate(final_lines):
    if line.strip() == "#:use-module (gaurix packages recipe-resolver-260418g)":
        import_idx_g = i
    if line.strip() == "#:use-module (gaurix packages recipe-resolver-260418h)":
        import_idx_h = i
if import_idx_g is not None and import_idx_h is not None and import_idx_h == import_idx_g + 1:
    print(f"VERIFY OK: import lines adjacent at lines {import_idx_g+1} and {import_idx_h+1}")
else:
    print(f"VERIFY WARN: import ordering unexpected (g={import_idx_g}, h={import_idx_h})", file=sys.stderr)

print("\nAll transforms applied and verified successfully.")
