#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260407n.
Adds #:use-module and #:export entries.
"""
import shutil

PKG_FILE = "guix/gaurix/packages.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407n)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407m)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407n",
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


def main():
    with open(PKG_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    module_added = False
    exports_added = False

    for i, line in enumerate(lines):
        # Add use-module after anchor
        if not module_added and line.strip() == ANCHOR_MODULE.strip():
            new_lines.append(line)
            new_lines.append(NEW_MODULE + "\n")
            module_added = True
            continue

        # Add exports before the closing paren of the module form
        # The file ends with a single ")" line
        if not exports_added and line.strip() == ")" and i > len(lines) - 5:
            for exp in NEW_EXPORTS:
                new_lines.append(exp + "\n")
            new_lines.append(line)
            exports_added = True
            continue

        new_lines.append(line)

    if not module_added:
        print("WARNING: Could not find anchor module line to add use-module")
    if not exports_added:
        print("WARNING: Could not find position to add exports")

    # Write atomically
    tmp_file = PKG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, PKG_FILE)

    print(f"Module import added: {module_added}")
    print(f"Exports added: {exports_added}")


if __name__ == "__main__":
    main()
