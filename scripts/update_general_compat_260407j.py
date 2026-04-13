#!/usr/bin/env python3
"""
Deterministic update of general-compat.scm for recipe-resolver-260407j.
Adds #:use-module and #:export entries.
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407j)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407i)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407j re-exports",
    "            brave-bin",
    "            zen-browser-bin",
    "            ventoy-bin",
    "            vscodium-bin",
    "            heroic-games-launcher-bin",
    "            freetube-bin",
    "            zotero-bin",
    "            onlyoffice-bin",
    "            vesktop-bin",
    "            opencode-bin",
    "            arduino-ide-bin",
    "            anytype-bin",
    "            floorp-bin",
    "            jetbrains-toolbox",
    "            spicetify-cli-bin",
    "            helium-browser-bin",
    "            koboldcpp-bin",
    "            jitsi-meet-desktop-bin",
    "            trezor-suite-bin",
    "            ldtk-bin",
    "            mullvad-browser-bin",
    "            rustdesk-bin",
    "            proton-pass-cli-bin",
    "            zoom-bin",
    "            slack-desktop-bin",
    "            mullvad-vpn-bin",
    "            cursor-bin",
    "            proton-pass-bin",
    "            betterbird-bin",
    "            google-chrome-bin",
]

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

        # Add exports before the closing paren of #:export
        # Find a line that contains only ")" and is after #:export section
        # Actually, look for the last export entry before the closing of the module form
        # A simpler approach: add exports just before the first (define
        if not exports_added and line.strip().startswith("(define"):
            # Insert exports before this line
            # Remove the line we just added
            new_lines.pop()
            # Add export entries
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
