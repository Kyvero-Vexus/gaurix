#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for deptree-resolver-260408a.
Adds #:use-module and #:export entries.
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

NEW_MODULE = "  #:use-module (gaurix packages deptree-resolver-260408a)"
ANCHOR_MODULE = "  #:use-module (gaurix packages deptree-resolver-260407h)"

NEW_EXPORTS = [
    "            ;; deptree-resolver-260408a re-exports",
    "            cs-bin",
    "            crtui-bin",
    "            crycco-bin",
    "            cubyz-bin",
    "            crunch",
    "            icu74",
    "            csvi-bin-260408a",
]

# Anchor: insert exports after the last export from recipe-resolver-260407o batch
ANCHOR_EXPORT = ";; ─── deptree-resolver-260407 compat aliases ───"


def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    module_added = False
    exports_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-module after the anchor
        if not module_added and line.strip() == ANCHOR_MODULE.strip():
            new_lines.append(NEW_MODULE + "\n")
            module_added = True

        # Add exports before the compat aliases section
        if not exports_added and line.strip() == ANCHOR_EXPORT.strip():
            # Remove the line we just added, insert exports before it
            new_lines.pop()
            for exp in NEW_EXPORTS:
                new_lines.append(exp + "\n")
            new_lines.append(line)
            exports_added = True

    if not module_added:
        print("WARNING: Could not find anchor module line to add use-module")
    if not exports_added:
        print("WARNING: Could not find position to add exports")

    # Append compat aliases note
    new_lines.append("\n;; ─── deptree-resolver-260408a compat aliases ───\n")
    new_lines.append(";; (all 7 packages re-exported directly from deptree-resolver-260408a, no aliases needed)\n")

    # Write atomically
    tmp_file = COMPAT_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, COMPAT_FILE)

    print(f"Module import added: {module_added}")
    print(f"Exports added: {exports_added}")


if __name__ == "__main__":
    main()
