#!/usr/bin/env python3
"""
Update packages.scm to add #:use-module and #:export entries for
recipe-resolver-260408c, 260408d, and 260408e.
"""
import shutil

PKG_FILE = "guix/gaurix/packages.scm"

ANCHOR_USE_MODULE = "  #:use-module (gaurix packages recipe-resolver-260408b)"
NEW_USE_MODULES = [
    "  #:use-module (gaurix packages recipe-resolver-260408c)",
    "  #:use-module (gaurix packages recipe-resolver-260408d)",
    "  #:use-module (gaurix packages recipe-resolver-260408e)",
]

NEW_EXPORTS = [
    "            ;; recipe-resolver-260408c",
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
    "            ;; recipe-resolver-260408d",
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
    "            ;; recipe-resolver-260408e",
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
]


def main():
    with open(PKG_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    use_module_added = False
    exports_added = False

    for line in lines:
        stripped = line.rstrip("\n")

        # Add use-module entries
        if not use_module_added and stripped.strip() == ANCHOR_USE_MODULE.strip():
            new_lines.append(line)
            for mod in NEW_USE_MODULES:
                new_lines.append(mod + "\n")
            use_module_added = True
            continue

        # Add exports before the final closing )
        # The file ends with a single ) on its own line
        if not exports_added and stripped.strip() == ")" and stripped.startswith(")"):
            for exp in NEW_EXPORTS:
                new_lines.append(exp + "\n")
            new_lines.append(line)
            exports_added = True
            continue

        new_lines.append(line)

    tmp = PKG_FILE + ".tmp"
    with open(tmp, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp, PKG_FILE)

    print(f"Use-module added: {use_module_added}")
    print(f"Exports added: {exports_added}")


if __name__ == "__main__":
    main()
