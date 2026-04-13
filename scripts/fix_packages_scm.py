#!/usr/bin/env python3
"""Deterministic full-file transform for packages.scm.

Extracts all #:use-module declarations, deduplicates them,
and rebuilds the file with clean structure.
"""

import re
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PACKAGES_SCM = ROOT / "guix" / "gaurix" / "packages.scm"

with open(PACKAGES_SCM, "r") as f:
    content = f.read()

# Extract all #:use-module declarations from anywhere in the file
# They can appear as:
#   #:use-module (gaurix packages foo)
#   or embedded in #:export sections
modules = set()
for m in re.finditer(r'#:use-module\s+\(([^)]+)\)', content):
    mod = m.group(1).strip()
    modules.add(mod)

# Sort modules for deterministic output
# Group: gaurix packages first, then others
gaurix_mods = sorted([m for m in modules if m.startswith("gaurix packages")])
other_mods = sorted([m for m in modules if not m.startswith("gaurix packages")])

# Rebuild file
lines = []
lines.append(";;; Package namespace convenience module for Gaurix.")
lines.append("(define-module (gaurix packages)")

for mod in gaurix_mods:
    lines.append(f"  #:use-module ({mod})")

for mod in other_mods:
    lines.append(f"  #:use-module ({mod})")

lines.append(")")
lines.append("")

output = "\n".join(lines)

# Write atomically
tmp = PACKAGES_SCM.with_suffix('.tmp')
with open(tmp, "w") as f:
    f.write(output)
shutil.move(str(tmp), str(PACKAGES_SCM))

print(f"Rebuilt {PACKAGES_SCM}")
print(f"  {len(gaurix_mods)} gaurix modules")
print(f"  {len(other_mods)} other modules")
print(f"  Total: {len(modules)} modules")
