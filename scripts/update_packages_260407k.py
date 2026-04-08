#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260407k.
Adds #:use-module and #:export entries.
Also adds recipe-resolver-260407j if missing.
"""
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

# Modules to add (in order)
NEW_MODULES = [
    "  #:use-module (gaurix packages recipe-resolver-260407j)",
    "  #:use-module (gaurix packages recipe-resolver-260407k)",
]

ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407i)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407k",
    "            teams-for-linux-bin",
    "            obsidian-bin",
    "            1password-bin",
    "            rambox-bin",
    "            ferdium-bin",
    "            insomnia-bin",
    "            datagrip-bin",
    "            pycharm-professional-bin",
    "            webstorm-bin",
    "            goland-bin",
    "            mongodb-compass-bin",
    "            beekeeper-studio-bin",
    "            parsec-bin",
    "            sunshine-bin",
    "            protonmail-bridge-bin",
    "            vivaldi-bin",
    "            waterfox-bin",
    "            youtube-music-bin",
    "            jellyfin-media-player-bin",
    "            drawio-desktop-bin",
    "            figma-linux-bin",
    "            wps-office-bin",
    "            marktext-bin",
    "            joplin-appimage",
    "            simplenote-electron-bin",
    "            signal-desktop-bin",
    "            element-desktop-bin",
    "            session-desktop-bin",
    "            feishin-bin",
    "            caprine-bin",
]

def main():
    with open(PACKAGES_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    modules_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-modules after the anchor
        if not modules_added and line.strip() == ANCHOR_MODULE.strip():
            # Check if 260407j already exists
            remaining = "".join(lines[i+1:i+5])
            for mod in NEW_MODULES:
                if mod.strip() not in remaining:
                    new_lines.append(mod + "\n")
            modules_added = True

    # Now add exports at end of file (before last closing paren or at very end)
    # For packages.scm, exports are mixed in with the module declaration
    # Find last export-like line and add after it
    # Actually, just append exports at end of the export section
    # Find the position right after the last line that starts with spaces + a symbol name
    # Simpler: just append the exports before the last line that starts with non-whitespace

    # Find the last line in the current content
    result_lines = new_lines[:]

    # Find the closing )) of the module declaration and add exports before that
    # Actually, packages.scm has a complex structure. Let's find the last export entry
    # and add our exports after it.
    last_export_idx = None
    for idx, line in enumerate(result_lines):
        stripped = line.strip()
        if stripped and not stripped.startswith("(define") and not stripped.startswith(";;") and not stripped.startswith("#:use-module"):
            # This might be an export entry
            if stripped and stripped[0].isalpha() or (stripped and stripped[0] in "0123456789"):
                last_export_idx = idx

    if last_export_idx is not None:
        # Insert new exports after the last export
        for j, exp in enumerate(NEW_EXPORTS):
            result_lines.insert(last_export_idx + 1 + j, exp + "\n")

    if not modules_added:
        print("WARNING: Could not find anchor module line")

    # Write atomically
    tmp_file = PACKAGES_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(result_lines)
    shutil.move(tmp_file, PACKAGES_FILE)

    print(f"Modules added: {modules_added}")
    print(f"Exports added at line: {last_export_idx}")


if __name__ == "__main__":
    main()
