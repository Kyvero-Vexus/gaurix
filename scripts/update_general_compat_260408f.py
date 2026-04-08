#!/usr/bin/env python3
"""Programmatic update of general-compat.scm for recipe-resolver-260408f pass.

Adds:
- Module import for recipe-resolver-260408f
- Export declarations for new compat aliases
- Compat alias definitions at end of file

Uses deterministic full-file transform: read -> compute -> write temp -> atomic move.
"""

import os
import tempfile
import shutil

SRC = "guix/gaurix/packages/general-compat.scm"

# New compat aliases to add (name, inherit-from, comment)
COMPAT_ALIASES = [
    # AUR names -> Guix X11 driver packages
    ("xlibre-input-wacom", "xf86-input-wacom",
     "AUR xlibre-input-wacom -> Guix xf86-input-wacom"),
    ("xlibre-video-fbdev", "xf86-video-fbdev",
     "AUR xlibre-video-fbdev -> Guix xf86-video-fbdev"),
    # AUR ffmpeg variant -> Guix ffmpeg
    ("ffmpeg-amd-full", "ffmpeg",
     "AUR ffmpeg-amd-full -> Guix ffmpeg"),
    # AUR plain names -> existing gaurix -bin packages
    ("slack-desktop", "slack-desktop-bin",
     "AUR slack-desktop -> gaurix slack-desktop-bin"),
    ("oh-my-posh", "oh-my-posh-bin",
     "AUR oh-my-posh -> gaurix oh-my-posh-bin"),
    ("spicetify-cli", "spicetify-cli-bin",
     "AUR spicetify-cli -> gaurix spicetify-cli-bin"),
    ("rustdesk", "rustdesk-bin",
     "AUR rustdesk -> gaurix rustdesk-bin"),
    ("qbittorrent-cli", "qbittorrent-cli-bin",
     "AUR qbittorrent-cli -> gaurix qbittorrent-cli-bin"),
    ("hyprls", "hyprls-bin",
     "AUR hyprls -> gaurix hyprls-bin"),
    ("ffdec", "ffdec-bin",
     "AUR ffdec -> gaurix ffdec-bin"),
]

# New recipe-resolver-260408f packages to re-export
RECIPE_EXPORTS = [
    "logseq-desktop-bin",
    "rider-bin",
    "xnviewmp-bin",
    "tutanota-desktop-bin",
    "shutter-encoder-bin",
    "freefilesync-bin",
    "appimagelauncher-bin",
]

# Compat aliases for the new recipe packages
RECIPE_COMPAT_ALIASES = [
    ("logseq-desktop", "logseq-desktop-bin",
     "AUR logseq-desktop -> gaurix logseq-desktop-bin"),
    ("rider", "rider-bin",
     "AUR rider -> gaurix rider-bin"),
    ("xnviewmp", "xnviewmp-bin",
     "AUR xnviewmp -> gaurix xnviewmp-bin"),
    ("tutanota-desktop", "tutanota-desktop-bin",
     "AUR tutanota-desktop -> gaurix tutanota-desktop-bin"),
    ("shutter-encoder", "shutter-encoder-bin",
     "AUR shutter-encoder -> gaurix shutter-encoder-bin"),
    ("freefilesync", "freefilesync-bin",
     "AUR freefilesync -> gaurix freefilesync-bin"),
    ("appimagelauncher", "appimagelauncher-bin",
     "AUR appimagelauncher -> gaurix appimagelauncher-bin"),
]

def main():
    with open(SRC, "r") as f:
        lines = f.readlines()

    content = "".join(lines)

    # 1. Add module import for recipe-resolver-260408f
    import_line = "  #:use-module (gaurix packages recipe-resolver-260408f)\n"
    if "recipe-resolver-260408f" not in content:
        # Find last recipe-resolver-260408e import
        idx = None
        for i, line in enumerate(lines):
            if "recipe-resolver-260408e)" in line:
                idx = i
        if idx is not None:
            lines.insert(idx + 1, import_line)
            print(f"Inserted module import at line {idx + 2}")

    # 2. Add export declarations
    export_names = (
        [a[0] for a in COMPAT_ALIASES]
        + RECIPE_EXPORTS
        + [a[0] for a in RECIPE_COMPAT_ALIASES]
    )

    # Find last recipe-resolver-260408e re-exports comment
    export_insert_idx = None
    for i, line in enumerate(lines):
        if ";; recipe-resolver-260408e re-exports" in line:
            export_insert_idx = i

    if export_insert_idx is not None and \
       "recipe-resolver-260408f re-exports" not in "".join(lines):
        export_block = "            ;; recipe-resolver-260408f re-exports\n"
        for name in export_names:
            export_block += f"            {name}\n"
        lines.insert(export_insert_idx + 1, export_block)
        print(f"Inserted {len(export_names)} export declarations")

    # 3. Add compat alias definitions at end of file
    if "recipe-resolver-260408f compat aliases" not in "".join(lines):
        alias_block = "\n;; --- recipe-resolver-260408f compat aliases ---\n"

        for name, inherit_from, comment in COMPAT_ALIASES:
            alias_block += f"\n;; {comment}\n"
            alias_block += f"(define-public {name}\n"
            alias_block += f"  (package\n"
            alias_block += f"    (inherit {inherit_from})\n"
            alias_block += f'    (name "{name}")))\n'

        for name, inherit_from, comment in RECIPE_COMPAT_ALIASES:
            alias_block += f"\n;; {comment}\n"
            alias_block += f"(define-public {name}\n"
            alias_block += f"  (package\n"
            alias_block += f"    (inherit {inherit_from})\n"
            alias_block += f'    (name "{name}")))\n'

        lines.append(alias_block)
        print(f"Appended {len(COMPAT_ALIASES) + len(RECIPE_COMPAT_ALIASES)} compat alias definitions")

    # 4. Write to temp file and atomic move
    fd, tmp_path = tempfile.mkstemp(
        dir=os.path.dirname(SRC), suffix=".scm.tmp"
    )
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(lines)
        shutil.move(tmp_path, SRC)
        print(f"Atomically updated {SRC}")
    except Exception:
        os.unlink(tmp_path)
        raise

if __name__ == "__main__":
    main()
