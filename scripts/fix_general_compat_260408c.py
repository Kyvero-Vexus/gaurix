#!/usr/bin/env python3
"""
Fix general-compat.scm:
1. Move orphaned export entries (lines before define-module) into the #:export block
2. Add new #:use-module entries for recipe-resolver-260408{b,c,d,e}
3. Add new #:export entries for all new packages
4. Append compat alias definitions at end

This script reads the entire file, reorganizes it, and writes atomically.
"""
import shutil

COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"

NEW_USE_MODULES = [
    "  #:use-module (gaurix packages recipe-resolver-260408b)",
    "  #:use-module (gaurix packages recipe-resolver-260408c)",
    "  #:use-module (gaurix packages recipe-resolver-260408d)",
    "  #:use-module (gaurix packages recipe-resolver-260408e)",
]

NEW_EXPORTS = [
    "            ;; recipe-resolver-260408b re-exports",
    "            otf-atkinson-hyperlegible-next",
    "            ttf-atkinson-hyperlegible-next",
    "            ttf-atkinson-hyperlegible-next-variable",
    "            otf-atkinson-hyperlegible-next-mono",
    "            ttf-atkinson-hyperlegible-next-mono",
    "            ttf-atkinson-hyperlegible-next-mono-variable",
    "            blobmoji",
    "            candy-icons-git",
    "            sweet-folders-icons-git",
    "            gruvbox-icon-theme-git",
    "            breeze-hacked-cursor-theme-git",
    "            grub-theme-tela-white-2k-git",
    "            grub-theme-tela-white-4k-git",
    "            grub2-theme-archxion",
    "            grub2-theme-archlinux",
    "            sound-theme-smooth",
    "            gruvbox-gtk-theme-git",
    "            xfce-theme-cobibird",
    "            fagram-bin",
    "            pixieditor-bin",
    "            android-apktool-bin",
    "            amdgpu-clocks",
    "            python-funk",
    "            nvimpager",
    "            jome",
    "            croaring",
    "            logiops-git",
    "            duckduckgo-chat-cli",
    "            plymouth-theme-hexagon-alt-gruvbox",
    "            puddletag",
    "            ;; recipe-resolver-260408c re-exports",
    "            palemoon-bin",
    "            simplex-desktop-appimage",
    "            alcom-bin",
    "            torrra-bin",
    "            katana-bin",
    "            ytui-bin",
    "            clang-format-static-bin",
    "            easytier-bin",
    "            reshell-bin",
    "            quickserv-bin",
    "            f2-bin",
    "            nfpm-bin",
    "            breaktimer-bin",
    "            activitywatch-bin",
    "            zaproxy-bin",
    "            codename-goose-bin",
    "            flaca-bin",
    "            mcontrolcenter-bin",
    "            soundy-bin",
    "            nimo-bin",
    "            webplotdigitizer-bin",
    "            tunein-cli-bin",
    "            littlenavmap-bin",
    "            tuxedo-webfai-creator-bin",
    "            nethermind-ethereum-bin",
    "            emudeck-bin",
    "            fontbase",
    "            epochcli",
    "            spoofdpi",
    "            smartamp",
    "            qtscrcpy-bin",
    "            implay",
    "            chiaki-ng",
    "            fluent-reader-bin",
    "            ;; recipe-resolver-260408d re-exports",
    "            ttf-wps-fonts",
    "            ttf-rounded-mplus",
    "            behdad-fonts",
    "            shahab-fonts",
    "            iranian-fonts",
    "            tanha-fonts",
    "            ttf-signika",
    "            ttf-merriweather-sans",
    "            ttf-merriweather",
    "            ttf-quintessential",
    "            ttf-readex-pro",
    "            maplemono-ttf-autohint",
    "            ttf-rubik-vf",
    "            ttf-material-icons-git",
    "            phinger-cursors",
    "            catppuccin-gtk-theme-git",
    "            numix-square-icon-theme",
    "            python-pip-search",
    "            python-lsp-ruff",
    "            python-chex",
    "            python-hf-transfer",
    "            python-pynvml",
    "            python-ipware",
    "            python-fugashi",
    "            python-msoffcrypto-tool",
    "            python-gps3",
    "            python-manuf",
    "            nvitop",
    "            angrysearch",
    "            python-vondb",
    "            kcc",
    "            beeref",
    "            ;; recipe-resolver-260408e re-exports",
    "            btrfs-list",
    "            chkboot",
    "            envchain",
    "            lpac",
    "            libeuicc",
    "            minify",
    "            cheat",
    "            quickserve",
    "            dcfldd",
    "            i8kutils",
    "            cmoc",
    "            lwtools",
    "            procmon",
    "            snort",
    "            crowdsec",
    "            tetrs",
    "            bkmr",
    "            stor",
    "            jellyfin-tui",
    "            oblivion-desktop-bin",
    "            siyuan-note-bin",
    "            codex-bin",
    "            gowall",
    "            ;; 260408c-batch compat aliases",
    "            vulkan-icd-loader-git",
    "            bdf-unifont",
    "            fastfetch-gif-git",
    "            libmpv-git",
    "            yaru-sound-theme",
    "            yaru-gtksourceview-theme",
    "            yaru-gnome-shell-theme",
    "            yaru-xfwm4-theme",
    "            yaru-unity-theme",
    "            yaru-metacity-theme",
    "            yaru-session",
]

COMPAT_ALIAS_CODE = """
;; --- recipe-resolver-260408b compat aliases ---
;; (all 30 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408c compat aliases ---
;; (all 34 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408d compat aliases ---
;; (all 32 packages are new definitions with no AUR name aliases needed)

;; --- recipe-resolver-260408e compat aliases ---
;; (all 23 packages are new definitions with no AUR name aliases needed)

;; --- 260408c-batch compat aliases (AUR names -> Guix packages) ---

(define-public vulkan-icd-loader-git
  (package
    (inherit vulkan-loader)
    (name "vulkan-icd-loader-git")))

(define-public bdf-unifont
  (package
    (inherit font-gnu-unifont)
    (name "bdf-unifont")))

(define-public fastfetch-gif-git
  (package
    (inherit fastfetch)
    (name "fastfetch-gif-git")))

(define-public libmpv-git
  (package
    (inherit mpv)
    (name "libmpv-git")))

(define-public yaru-sound-theme
  (package
    (inherit yaru-theme)
    (name "yaru-sound-theme")))

(define-public yaru-gtksourceview-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gtksourceview-theme")))

(define-public yaru-gnome-shell-theme
  (package
    (inherit yaru-theme)
    (name "yaru-gnome-shell-theme")))

(define-public yaru-xfwm4-theme
  (package
    (inherit yaru-theme)
    (name "yaru-xfwm4-theme")))

(define-public yaru-unity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-unity-theme")))

(define-public yaru-metacity-theme
  (package
    (inherit yaru-theme)
    (name "yaru-metacity-theme")))

(define-public yaru-session
  (package
    (inherit yaru-theme)
    (name "yaru-session")))
"""


def main():
    with open(COMPAT_FILE, "r") as f:
        lines = f.readlines()

    # Phase 1: Find the define-module line and separate orphaned lines
    define_module_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith("(define-module"):
            define_module_idx = i
            break

    if define_module_idx is None:
        print("ERROR: could not find (define-module ...)")
        return

    orphaned_lines = lines[:define_module_idx]
    module_lines = lines[define_module_idx:]

    # Extract orphaned export names (non-comment, non-blank lines)
    orphaned_exports = []
    for line in orphaned_lines:
        stripped = line.strip()
        if stripped and not stripped.startswith(";;"):
            orphaned_exports.append("            " + stripped)

    print(f"Found {len(orphaned_exports)} orphaned export entries to reintegrate")

    # Phase 2: Process module_lines
    new_lines = []
    use_module_added = False
    exports_added = False
    anchor_use = "  #:use-module (gaurix packages deptree-resolver-260408a)"

    for i, line in enumerate(module_lines):
        stripped = line.rstrip("\n")

        # Add new use-module entries after anchor
        if not use_module_added and stripped.strip() == anchor_use.strip():
            new_lines.append(line)
            for mod in NEW_USE_MODULES:
                new_lines.append(mod + "\n")
            use_module_added = True
            continue

        # Add all export entries before the closing ))
        if not exports_added and stripped.strip() == "))":
            # First, add the orphaned exports
            if orphaned_exports:
                new_lines.append("            ;; re-integrated orphaned exports\n")
                for exp in orphaned_exports:
                    new_lines.append(exp + "\n")
            # Then add new batch exports
            for exp in NEW_EXPORTS:
                new_lines.append(exp + "\n")
            # Now the closing ))
            new_lines.append(line)
            exports_added = True
            continue

        new_lines.append(line)

    # Phase 3: Append compat alias code at end
    while new_lines and new_lines[-1].strip() == "":
        new_lines.pop()
    new_lines.append("\n")
    new_lines.append(COMPAT_ALIAS_CODE)

    # Atomic write
    tmp_file = COMPAT_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, COMPAT_FILE)

    print(f"Use-module added: {use_module_added}")
    print(f"Exports added: {exports_added}")
    print(f"Orphaned lines fixed: {len(orphaned_exports) > 0}")
    print(f"Compat aliases appended")

    if not use_module_added:
        print(f"WARNING: anchor not found: {anchor_use}")
    if not exports_added:
        print("WARNING: closing )) not found")


if __name__ == "__main__":
    main()
