#!/usr/bin/env python3
"""
Deterministic update of packages.scm for recipe-resolver-260407m.
Adds #:use-module and #:export entries.
"""
import shutil

PACKAGES_FILE = "guix/gaurix/packages.scm"

NEW_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407m)"
ANCHOR_MODULE = "  #:use-module (gaurix packages recipe-resolver-260407l)"

NEW_EXPORTS = [
    "            ;; recipe-resolver-260407m",
    "            sff",
    "            streamdeck-ui",
    "            zulucrypt",
    "            rankmirrors",
    "            python-vllm",
    "            grass-desktop-node",
    "            python-flash-attention",
    "            tonelib-zoom-bin",
    "            gittyup",
    "            dropbox-cli",
    "            ripcalc",
    "            perl-authen-simple",
    "            intel-media-driver-legacy-bin",
    "            pacman-hook-list-systemd-units",
    "            vcsi",
    "            atproto-pds",
    "            vmware-vmrc",
    "            libwebcam",
    "            v4l2ucp",
    "            glpi-agent",
    "            perl-xml-treepp",
    "            bcc-tools",
    "            python-bcc",
    "            perl-test-compile",
    "            perl-io-capture",
    "            electron6-bin",
    "            jsignpdf",
    "            simutrans-pak192-comic",
    "            perl-http-server-simple-authen",
    "            mermaid-filter",
    "            python-atlassian-api",
    "            wiki-js",
    "            gkrellm-gkfreq",
    "            thunderbird-beta-bin",
    "            replay-sorcery",
    "            kolossus-launcher",
    "            hunspell-hr",
    "            nyrna-bin",
    "            font-work-sans",
    "            font-work-sans-variable",
    "            sway-git-wlroots",
    "            opennebula",
    "            fancontrol-gui",
    "            heaptrack",
    "            trufflehog",
    "            chs",
    "            heroic-gogdl",
    "            xmind",
    "            profile-sync-daemon-librewolf",
    "            code-saturne",
    "            vertex-themes",
    "            alacarte-xfce",
    "            tonelib-jam-bin",
    "            steamrun",
    "            tunescope",
    "            guitarix-vst",
    "            elementary-xfce-icons",
    "            gkleds",
    "            gkrelltop",
    "            gkrellm-themes",
    "            chowbyod-bin",
    "            patchance",
    "            chowcentaur-bin",
    "            nootka",
    "            tuxedo-drivers-dkms",
    "            macintosh-js-bin",
    "            opera-developer",
    "            sslyze",
    "            trelby",
    "            scidb",
    "            tencent-docs-bin",
    "            slang-verilog",
    "            noi-desktop-bin",
    "            jzintv",
    "            kyocera-universal",
    "            intiface-central",
    "            font-sorts-mill-goudy",
    "            go-musicfox-bin",
    "            adminer-editor",
    "            scream",
    "            qt5-styleplugins",
    "            vkd3d-proton-mingw",
    "            pam-ssh",
    "            lenmus",
    "            selinux-refpolicy-arch",
    "            vencord",
    "            chromium-vencord",
    "            firefox-vencord",
    "            firefox-developer-edition-vencord",
    "            librewolf-vencord",
    "            font-udev-gothic",
    "            wofi-power-menu",
    "            slimevr-beta-bin",
    "            terminal-rain-lightning",
    "            syncclipboard-desktop",
    "            wine-discord-ipc-bridge",
    "            vpinball",
    "            qt6-jpegxl-image-plugin",
    "            zls-master-bin",
    "            optimus-manager-qt",
]

def main():
    with open(PACKAGES_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    module_added = False

    for i, line in enumerate(lines):
        new_lines.append(line)

        # Add use-module after the anchor
        if not module_added and line.strip() == ANCHOR_MODULE.strip():
            new_lines.append(NEW_MODULE + "\n")
            module_added = True

    # Find the last closing paren and insert exports before it
    result_lines = new_lines[:]

    last_paren_idx = None
    for idx in range(len(result_lines) - 1, -1, -1):
        if result_lines[idx].strip() == ")":
            last_paren_idx = idx
            break

    if last_paren_idx is not None:
        for j, exp in enumerate(NEW_EXPORTS):
            result_lines.insert(last_paren_idx + j, exp + "\n")

    if not module_added:
        print("WARNING: Could not find anchor module line")

    # Write atomically
    tmp_file = PACKAGES_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(result_lines)
    shutil.move(tmp_file, PACKAGES_FILE)

    print(f"Module added: {module_added}")
    print(f"Exports added at line: {last_paren_idx}")


if __name__ == "__main__":
    main()
