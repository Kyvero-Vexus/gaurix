#!/usr/bin/env python3
"""
Deterministic programmatic update of packages.scm and general-compat.scm
for deptree-resolver-260408b.

Adds module references for:
- deptree-resolver-260408b
- deptree-resolver-260408b-blocked-notes
"""

import re
import tempfile
import shutil

BASE = "guix/gaurix/packages"
PACKAGES_SCM = f"{BASE}/../packages.scm"  # guix/gaurix/packages.scm
COMPAT_SCM = f"{BASE}/general-compat.scm"

NEW_MODULES = [
    "(gaurix packages deptree-resolver-260408b)",
    "(gaurix packages deptree-resolver-260408b-blocked-notes)",
]

NEW_COMPAT_MODULES = [
    "(gaurix packages deptree-resolver-260408b)",
]

EXPORTED_VARS = [
    "cull-bin",
    "daylight-bin",
    "diz-bin",
    "dnscontrol-bin",
    "docker-credential-secretservice-bin",
    "diffnav-bin",
    "culmus",
    "dinfo",
    "discli",
    "discord-rpc-extension-bin",
    "dmenu-emoji",
    "cura-resources-materials",
]


def update_packages_scm():
    """Add #:use-module lines for new modules to packages.scm."""
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    # Check if already added
    if "deptree-resolver-260408b)" in content:
        print(f"  {PACKAGES_SCM}: already contains deptree-resolver-260408b, skipping")
        return

    # Find the last #:use-module line before the closing paren of define-module
    lines = content.split('\n')
    result = []
    inserted = False

    for i, line in enumerate(lines):
        result.append(line)
        # Insert after the last existing deptree-resolver or recipe-resolver module
        if not inserted and '#:use-module (gaurix packages' in line:
            # Look ahead to see if next line is also a use-module or closing paren
            if i + 1 < len(lines):
                next_line = lines[i + 1].strip()
                # If next line is NOT a use-module for gaurix packages, insert here
                if not next_line.startswith('#:use-module (gaurix packages'):
                    # Check if this is in the module section (not re-export)
                    for mod in NEW_MODULES:
                        result.append(f"  #:use-module {mod}")
                    inserted = True

    if not inserted:
        # Fallback: insert before the closing ) of define-module
        result2 = []
        for line in result:
            if line.strip() == ')' and not inserted:
                # Check if previous non-empty line is a use-module
                for mod in NEW_MODULES:
                    result2.append(f"  #:use-module {mod}")
                inserted = True
            result2.append(line)
        result = result2

    content = '\n'.join(result)

    # Also add re-exported variable names at the end of the re-export list
    # Find the closing ) of the top-level module form that has the variable names
    # Just append them before the final )
    if EXPORTED_VARS[0] not in content:
        # Find the last line before the final ")" that contains variable names
        lines = content.split('\n')
        result = []
        for i, line in enumerate(lines):
            if line.strip() == ')' and i == len(lines) - 1:
                # This is the final closing paren
                for var in EXPORTED_VARS:
                    result.append(f"            {var}")
                result.append(f"            ;; deptree-resolver-260408b")
            result.append(line)
        content = '\n'.join(result)

    tmp = tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.scm',
                                      delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, PACKAGES_SCM)
    print(f"  Updated {PACKAGES_SCM}")


def update_general_compat():
    """Add #:use-module for new package module to general-compat.scm."""
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    if "deptree-resolver-260408b)" in content:
        print(f"  {COMPAT_SCM}: already contains deptree-resolver-260408b, skipping")
        return

    # Find last gaurix packages use-module in the define-module form
    lines = content.split('\n')
    result = []
    inserted = False

    for i, line in enumerate(lines):
        result.append(line)
        # Insert after the last gaurix packages module reference in the header
        if (not inserted
            and '#:use-module (gaurix packages' in line
            and i + 1 < len(lines)
            and '#:use-module (gaurix packages' not in lines[i + 1]):
            for mod in NEW_COMPAT_MODULES:
                result.append(f"  #:use-module {mod}")
            inserted = True

    if not inserted:
        # Fallback: insert after first gaurix packages line
        result2 = []
        for i, line in enumerate(result):
            result2.append(line)
            if (not inserted and '#:use-module (gaurix packages' in line):
                for mod in NEW_COMPAT_MODULES:
                    result2.append(f"  #:use-module {mod}")
                inserted = True
        result = result2

    content = '\n'.join(result)

    tmp = tempfile.NamedTemporaryFile(mode='w', dir='.', suffix='.scm',
                                      delete=False)
    tmp.write(content)
    tmp.close()
    shutil.move(tmp.name, COMPAT_SCM)
    print(f"  Updated {COMPAT_SCM}")


if __name__ == "__main__":
    print("Updating packages.scm...")
    update_packages_scm()
    print("Updating general-compat.scm...")
    update_general_compat()
    print("Done.")
