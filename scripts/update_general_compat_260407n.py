#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for recipe-resolver-260407n.
Adds #:use-module and #:export entries.
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407n)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407m)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407n re-exports",
    "            torrserver-bin",
    "            ov-bin",
    "            tgcp-bin",
    "            tredis-bin",
    "            rjq-bin",
    "            superdb-bin",
    "            pomo-bin",
    "            sq-bin",
    "            plenti-bin",
    "            code-minimap-bin",
    "            terraformer-bin",
    "            kubeshark-bin",
    "            git-brunch-bin",
    "            memtui-bin",
    "            goplaying-bin",
    "            lazyactions-bin",
    "            mmdr-bin",
    "            goful-bin",
    "            tsql-bin",
    "            go-prism-bin",
    "            r-quick-share-bin",
    "            stash-bin",
    "            crush-bin",
    "            mongodb-tools-bin",
    "            open-tv-bin",
    "            querycat-bin",
    "            mods-bin",
    "            zvm-bin",
    "            kyanos-bin",
    "            crab-bin",
]

# Anchor: insert exports after the last export from 260407m batch
ANCHOR_EXPORT = "            ;; deptree-resolver-260407h re-exports"


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

        # Add exports before the deptree-resolver-260407h re-exports section
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

    # Write atomically
    tmp_file = COMPAT_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, COMPAT_FILE)

    print(f"Module import added: {module_added}")
    print(f"Exports added: {exports_added}")


if __name__ == "__main__":
    main()
