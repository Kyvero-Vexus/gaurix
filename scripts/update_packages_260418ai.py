#!/usr/bin/env python3
"""Programmatic update of packages.scm and general-compat.scm for recipe-resolver-260418ai.

Deterministic full-file transforms: read, compute, write temp, atomic move.
"""

import tempfile
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"
GENERAL_COMPAT = ROOT / "guix" / "gaurix" / "packages" / "general-compat.scm"
PASS_ID = "recipe-resolver-260418ai"

# Packages exported from the .scm file (Guix-style names with hyphens)
EXPORTS = [
    "ryujinx-bin",
    "hitech-arch-animation",
    "ridecost",
    "jre-jetbrains",
    "dssat-csm-os-git",
    "virt-v2v",
    "marcwel-archive",
    "gpt4all-chat-git",
    "playonlinux",
    "rancher-desktop-bin",
    "duelsplus",
    "anytype-bin",
    "ps7-libps2000",
    "ps7-libps2000a",
    "ps7-libps3000a",
    "ps7-libps4000a",
    "ps7-libps6000",
    "ps7-libusbtc08",
]

RESOLVED_COUNT = len(EXPORTS)
EXHAUSTED_COUNT = 12

# --- Update packages.scm ---
content = PACKAGES_SCM.read_text()

new_section = f"""
;; {PASS_ID} ({RESOLVED_COUNT} NEEDS_RECIPE_DESIGN resolved, {EXHAUSTED_COUNT} EXHAUSTED)
(define-module (gaurix packages)
  #:use-module (gaurix packages {PASS_ID})
  #:re-export (
"""
for exp in EXPORTS:
    new_section += f"               {exp}\n"
new_section += "               ))\n"

content += new_section

tmp = tempfile.NamedTemporaryFile(
    mode="w", dir=PACKAGES_SCM.parent, suffix=".scm", delete=False
)
try:
    tmp.write(content)
    tmp.flush()
    shutil.move(tmp.name, PACKAGES_SCM)
except Exception:
    Path(tmp.name).unlink(missing_ok=True)
    raise

print(f"[{PASS_ID}] Updated packages.scm: added {len(EXPORTS)} re-exports")

# --- Update general-compat.scm ---
content = GENERAL_COMPAT.read_text()

# Find the last #:use-module line to insert new one after
lines = content.split("\n")
last_use_idx = -1
for i, line in enumerate(lines):
    if "#:use-module" in line:
        last_use_idx = i

# Insert new use-module after last one
if last_use_idx >= 0:
    lines.insert(last_use_idx + 1, f"  #:use-module (gaurix packages {PASS_ID})")

# Add re-exports at end
for exp in EXPORTS:
    lines.append(f"(re-export {exp})")

content = "\n".join(lines)

tmp = tempfile.NamedTemporaryFile(
    mode="w", dir=GENERAL_COMPAT.parent, suffix=".scm", delete=False
)
try:
    tmp.write(content)
    tmp.flush()
    shutil.move(tmp.name, GENERAL_COMPAT)
except Exception:
    Path(tmp.name).unlink(missing_ok=True)
    raise

print(f"[{PASS_ID}] Updated general-compat.scm: added use-module + {len(EXPORTS)} re-exports")
