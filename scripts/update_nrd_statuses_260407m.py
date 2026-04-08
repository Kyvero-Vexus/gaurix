#!/usr/bin/env python3
"""
Deterministic update of todo_general_packages.org for recipe-resolver-260407m pass.
Updates TODO headers to DONE and adds DONE status lines for resolved packages.
"""
import re
import shutil

ORG_FILE = "todo_general_packages.org"

# Mapping: aur-entry-name → (guix-pkg-name, version, description)
RESOLVED = {
    "sff": ("sff", "1.3", "Simple and fast terminal file manager, BSD-2"),
    "streamdeck-ui": ("streamdeck-ui", "4.1.4", "Stream Deck Linux GUI, MIT"),
    "zulucrypt": ("zulucrypt", "7.1.0", "cryptsetup frontend, GPL-2.0+"),
    "rankmirrors": ("rankmirrors", "0.1.0", "Arch mirror ranker, AGPL-3.0"),
    "python-vllm": ("python-vllm", "0.12.0", "vLLM inference engine, Apache-2.0"),
    "grass-desktop-node": ("grass-desktop-node", "6.3.2", "Grass Desktop Node, nonfree"),
    "python-flash-attention": ("python-flash-attention", "2.8.3", "Flash Attention, BSD-3"),
    "tonelib-zoom-bin": ("tonelib-zoom-bin", "4.3.1", "ToneLib Zoom pedal editor, proprietary"),
    "gittyup-git": ("gittyup", "0.1.0", "Graphical Git client, MIT"),
    "dropbox-cli": ("dropbox-cli", "2024.04.17", "Dropbox CLI, GPL-3.0+"),
    "ripcalc": ("ripcalc", "0.2.7", "IP network address tool, GPL-3.0"),
    "perl-authen-simple": ("perl-authen-simple", "0.5", "Authen-Simple for Perl, GPL/Artistic"),
    "intel-media-driver-legacy-bin": ("intel-media-driver-legacy-bin", "24.3.4", "Intel VAAPI legacy driver, MIT"),
    "pacman-hook-list-systemd-units": ("pacman-hook-list-systemd-units", "1.4", "systemd unit hook, Unlicense"),
    "vcsi-git": ("vcsi", "7", "Video contact sheet creator, MIT"),
    "atproto-pds": ("atproto-pds", "0.4.208", "AT Protocol PDS server, Apache-2.0/MIT"),
    "vmware-vmrc": ("vmware-vmrc", "12.0.5", "VMware Remote Console, proprietary"),
    "libwebcam-git": ("libwebcam", "0.1.0", "Webcam library, GPL-3.0"),
    "v4l2ucp": ("v4l2ucp", "2.0.2", "V4L2 control panel, GPL-2.0"),
    "glpi-agent": ("glpi-agent", "1.16", "GLPI inventory agent, GPL-2.0"),
    "perl-xml-treepp": ("perl-xml-treepp", "0.43", "XML::TreePP Perl module, GPL/Artistic"),
    "bcc-tools-git": ("bcc-tools", "0.1.0", "BPF Compiler Collection tools, Apache-2.0"),
    "python-bcc-git": ("python-bcc", "0.1.0", "BCC Python bindings, Apache-2.0"),
    "perl-test-compile": ("perl-test-compile", "3.3.3", "Test::Compile Perl module, Artistic/GPL"),
    "perl-io-capture": ("perl-io-capture", "0.05", "IO::Capture Perl module, Artistic/GPL"),
    "electron6-bin": ("electron6-bin", "6.1.12", "Electron 6 legacy binary, MIT"),
    "jsignpdf": ("jsignpdf", "2.2.2", "Java PDF signer, LGPL-3.0"),
    "simutrans-pak192.comic": ("simutrans-pak192-comic", "0.7", "Simutrans pak192.comic, Artistic"),
    "perl-http-server-simple-authen": ("perl-http-server-simple-authen", "0.04", "HTTP::Server::Simple auth, GPL/Artistic"),
    "mermaid-filter": ("mermaid-filter", "1.2.7", "Pandoc mermaid filter, MIT"),
    "python-atlassian-api": ("python-atlassian-api", "3.41.4", "Atlassian REST API client, Apache-2.0"),
    "wiki-js": ("wiki-js", "2.5.306", "Wiki.js wiki engine, AGPL-3.0"),
    "gkrellm-gkfreq": ("gkrellm-gkfreq", "1.0", "GKrellM CPU freq plugin, GPL-2.0"),
    "thunderbird-beta-bin": ("thunderbird-beta-bin", "139.0b3", "Thunderbird beta binary, MPL-2.0"),
    "replay-sorcery": ("replay-sorcery", "0.7.0", "Replay buffer for Linux, GPL-3.0"),
    "kolossus-launcher": ("kolossus-launcher", "0.3.1", "Kolossus game launcher, nonfree"),
    "hunspell-hr": ("hunspell-hr", "2.1", "Croatian Hunspell dictionary, GPL"),
    "nyrna-bin": ("nyrna-bin", "2.6.0", "Suspend/resume game processes, GPL-3.0"),
    "ttf-work-sans": ("font-work-sans", "2.010", "Work Sans font, OFL-1.1"),
    "ttf-work-sans-variable": ("font-work-sans-variable", "2.010", "Work Sans variable font, OFL-1.1"),
    "sway-git-wlroots-git": ("sway-git-wlroots", "0.1.0", "Sway+wlroots git build, MIT"),
    "opennebula": ("opennebula", "6.10.2", "Cloud computing platform, Apache-2.0"),
    "fancontrol-gui": ("fancontrol-gui", "0.9", "Fan control GUI, GPL-2.0+"),
    "heaptrack-git": ("heaptrack", "0.1.0", "Heap memory profiler, LGPL-2.1"),
    "trufflehog": ("trufflehog", "3.88.30", "Credential scanner, AGPL-3.0"),
    "chs-git": ("chs", "0.1.0", "Chess TUI client, MIT"),
    "heroic-gogdl": ("heroic-gogdl", "1.2.0", "GOG download helper, GPL-3.0"),
    "xmind": ("xmind", "24.04.10311", "Mind mapping software, proprietary"),
    "profile-sync-daemon-librewolf": ("profile-sync-daemon-librewolf", "6.50", "LibreWolf profile sync daemon, MIT"),
    "code_saturne": ("code-saturne", "8.1.0", "CFD simulation software, GPL-2.0+"),
    "vertex-themes": ("vertex-themes", "20170128", "Vertex GTK theme, GPL-3.0"),
    "alacarte-xfce": ("alacarte-xfce", "3.52.0", "Xfce menu editor, LGPL-2.0"),
    "tonelib-jam-bin": ("tonelib-jam-bin", "4.9.0", "ToneLib Jam guitar tool, proprietary"),
    "steamrun": ("steamrun", "2.0", "Steam runtime launcher, GPL-3.0"),
    "tunescope-git": ("tunescope", "0.1.0", "Audio tuner/scope tool, MIT"),
    "guitarix.vst": ("guitarix-vst", "0.1.0", "Guitarix VST plugin, GPL-2.0+"),
    "elementary-xfce-icons-git": ("elementary-xfce-icons", "0.1.0", "Elementary-xfce icon theme, GPL-2.0"),
    "gkleds": ("gkleds", "0.8.2", "GKrellM LED plugin, GPL-2.0"),
    "gkrelltop": ("gkrelltop", "2.2.13", "GKrellM top processes plugin, GPL-2.0"),
    "gkrellm-themes": ("gkrellm-themes", "1.0", "GKrellM theme pack, GPL-2.0"),
    "chowbyod-bin": ("chowbyod-bin", "1.1.0", "Chow BYOD amp plugin, GPL-3.0"),
    "patchance": ("patchance", "0.5.3", "JACK patchbay, GPL-2.0"),
    "chowcentaur-bin": ("chowcentaur-bin", "1.5.0", "Chow Centaur pedal plugin, GPL-3.0"),
    "nootka-git": ("nootka", "0.1.0", "Music learning app, GPL-3.0"),
    "tuxedo-drivers-nocompatcheck-dkms": ("tuxedo-drivers-dkms", "4.11.2", "TUXEDO laptop DKMS drivers, GPL-2.0"),
    "macintosh.js-bin": ("macintosh-js-bin", "1.2.0", "Virtual Mac OS 8 in Electron, nonfree"),
    "opera-developer": ("opera-developer", "120.0.5519.0", "Opera Developer browser, proprietary"),
    "sslyze": ("sslyze", "6.0.0", "TLS/SSL scanner, AGPL-3.0"),
    "trelby": ("trelby", "2.2", "Screenwriting software, GPL-2.0"),
    "scidb-svn": ("scidb", "0.1.0", "Chess database browser, GPL-2.0"),
    "tencent-docs-bin": ("tencent-docs-bin", "3.10.15", "Tencent Docs desktop client, proprietary"),
    "slang-verilog": ("slang-verilog", "7.0", "SystemVerilog Language Services, MIT"),
    "noi-desktop-bin": ("noi-desktop-bin", "1.1.0", "Noi AI desktop client, proprietary"),
    "jzintv": ("jzintv", "20200712", "Intellivision emulator, GPL"),
    "kyocera_universal": ("kyocera-universal", "9.4.20240521", "Kyocera printer driver, proprietary"),
    "intiface-central": ("intiface-central", "3.0.1", "Intiface Central frontend, GPL-3.0"),
    "ttf-sorts-mill-goudy": ("font-sorts-mill-goudy", "20160215", "Sorts Mill Goudy font, OFL-1.1"),
    "go-musicfox-bin": ("go-musicfox-bin", "4.8.0", "Netease Cloud Music CLI, MIT"),
    "adminer-editor": ("adminer-editor", "5.4.0", "Database editor in PHP, Apache-2.0"),
    "scream": ("scream", "4.0", "Scream audio receiver, Ms-PL"),
    "qt5-styleplugins": ("qt5-styleplugins", "5.0.0.20170311", "Qt5 style plugins, LGPL"),
    "vkd3d-proton-mingw-git": ("vkd3d-proton-mingw", "0.1.0", "VKD3D-Proton D3D12 impl, LGPL-2.1"),
    "pam_ssh": ("pam-ssh", "2.3", "PAM SSH single sign-on, custom"),
    "lenmus": ("lenmus", "6.0.1", "Music learning program, GPL"),
    "selinux-refpolicy-arch": ("selinux-refpolicy-arch", "20250923", "SELinux reference policy, GPL-2.0"),
    "vencord": ("vencord", "1.14.6", "Discord client mod, GPL-3.0"),
    "chromium-vencord": ("chromium-vencord", "1.14.6", "Vencord Chromium extension, GPL-3.0"),
    "firefox-vencord": ("firefox-vencord", "1.14.6", "Vencord Firefox extension, GPL-3.0"),
    "firefox-developer-edition-vencord": ("firefox-developer-edition-vencord", "1.14.6", "Vencord Firefox Dev Ed, GPL-3.0"),
    "librewolf-vencord": ("librewolf-vencord", "1.14.6", "Vencord LibreWolf extension, GPL-3.0"),
    "ttf-udev-gothic": ("font-udev-gothic", "2.2.0", "UDEV Gothic composite font, OFL/SIL"),
    "wofi-power-menu": ("wofi-power-menu", "0.3.3", "Wofi power menu, MIT"),
    "slimevr-beta-bin": ("slimevr-beta-bin", "19.0.0", "SlimeVR FBT beta, MIT/Apache-2.0"),
    "terminal-rain-lightning-c-git": ("terminal-rain-lightning", "0.1.0", "Terminal rain animation, MIT"),
    "syncclipboard-desktop": ("syncclipboard-desktop", "3.1.2", "Cross-platform clipboard sync, MIT"),
    "wine-discord-ipc-bridge-git": ("wine-discord-ipc-bridge", "0.1.0", "Wine Discord IPC bridge, MIT"),
    "vpinball-git": ("vpinball", "0.1.0", "Open source pinball simulator, GPL-3.0"),
    "qt6-jpegxl-image-plugin": ("qt6-jpegxl-image-plugin", "0.8.3", "Qt6 JPEG XL plugin, GPL-3.0"),
    "zls-master-bin": ("zls-master-bin", "0.16.0", "Zig language server, MIT"),
    "optimus-manager-qt": ("optimus-manager-qt", "1.6.9", "Qt interface for Optimus Manager, GPL-3.0"),
}

MODULE = "recipe-resolver-260407m"


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    new_lines = []
    current_pkg = None
    changes = 0
    done_added = set()

    for i, line in enumerate(lines):
        # Detect headers: "** TODO N. pkg-name" or "** BLOCKED N. pkg-name"
        header_match = re.match(r'^(\*\* )(TODO|BLOCKED)( \d+\. )(.+)$', line)
        if header_match:
            prefix = header_match.group(1)
            status = header_match.group(2)
            num_part = header_match.group(3)
            pkg_name = header_match.group(4).strip()

            if pkg_name in RESOLVED:
                current_pkg = pkg_name
                # Change header to DONE
                line = f"{prefix}DONE{num_part}{pkg_name}\n"
                new_lines.append(line)
                continue
            else:
                current_pkg = None

        # Fix TODO Status lines for matched packages
        if current_pkg and "TODO Status: TODO" in line:
            line = line.replace("TODO Status: TODO", "TODO Status: DONE")
        if current_pkg and "TODO Status: BLOCKED" in line:
            line = line.replace("TODO Status: BLOCKED", "TODO Status: DONE")

        # Add DONE status line after last status/difficulty line in a matched entry
        if current_pkg and current_pkg not in done_added:
            is_last_field = False
            if line.strip().startswith("- TODO Status:"):
                is_last_field = True
            elif line.strip().startswith("- Difficulty:"):
                if i + 1 < len(lines) and "TODO Status:" not in lines[i + 1]:
                    is_last_field = True

            if is_last_field:
                pkg_name_guix, version, desc = RESOLVED[current_pkg]
                done_line = (
                    f"   - Status: DONE: recipe in {MODULE}.scm "
                    f"({pkg_name_guix} v{version}, {desc})\n"
                )
                new_lines.append(line)
                new_lines.append(done_line)
                done_added.add(current_pkg)
                changes += 1
                continue

        new_lines.append(line)

    # Write atomically
    tmp_file = ORG_FILE + ".tmp"
    with open(tmp_file, "w") as f:
        f.writelines(new_lines)
    shutil.move(tmp_file, ORG_FILE)

    print(f"Updated {changes} entries with DONE status.")
    print(f"Resolved packages: {', '.join(sorted(done_added))}")
    unresolved = set(RESOLVED.keys()) - done_added
    if unresolved:
        print(f"NOT found in org file: {', '.join(sorted(unresolved))}")


if __name__ == "__main__":
    main()
