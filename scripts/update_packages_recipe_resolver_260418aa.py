#!/usr/bin/env python3
"""
Deterministic programmatic full-file transform for recipe-resolver-260418aa.

Updates:
  1. todo_general_packages.org — status lines for all 100 packages
  2. packages.scm — new define-module block with re-exports
  3. general-compat.scm — use-module import + compat aliases
"""

import re
import os
import shutil
import tempfile

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ORG_FILE = os.path.join(BASE, "todo_general_packages.org")
PACKAGES_SCM = os.path.join(BASE, "guix", "gaurix", "packages.scm")
COMPAT_SCM = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")

RESOLVER_TAG = "recipe-resolver-260418aa"

# 93 resolved packages: (name, version, build-system-desc, license, synopsis)
RESOLVED = [('testssl-sh-git', '3.3dev.snapshot.2602.r8.g87ecc1c', 'copy-build-system', 'gpl2+', 'Testing TLS/SSL encryption (git version)'), ('ipfs-desktop-electron', '0.48.0', 'copy-build-system', 'expat', 'Desktop client for the InterPlanetary File System'), ('minecraft-ttf-git', '1.3', 'copy-build-system', 'expat', 'Pixel-accurate and complete TrueType fonts from Minecraft: Java Edition, g...'), ('netmount', '1.1.2', 'copy-build-system', 'agpl3+', 'Unified management and mounting of cloud storage facilities'), ('pilot-link-git', 'r1930.55c346e3', 'copy-build-system', 'gpl2+', 'A suite of tools for connecting to PalmOS handheld devices'), ('sview-git', 'r1751.ad7cbddf', 'copy-build-system', 'gpl3', 'Stereoscopic 3D video player with OpenGL UI'), ('bellybutton', '1.0.1', 'copy-build-system', 'expat', 'CLI grammar checker for Bash, JS, Python, Go, and Rust'), ('hyprland-toggle-tiling-git', '1.4.1-1.0', 'cmake-build-system', 'gpl3', 'A simple program to toggle tiling and floating modes for windows in the Hy...'), ('ptr89-git', '1.0.4', 'cmake-build-system', 'expat', 'Yet another binary pattern finder'), ('yd-go-git', 'master.4b2621ff', 'copy-build-system', 'gpl3', 'Panel indicator for Yandex-disk CLI daemon (linux)'), ('firefox-stylus', '1.5.46', 'copy-build-system', 'gpl3', 'Easily install themes and skins for many popular sites'), ('websurfx-git', 'v1.0.0.r722.99ec846', 'copy-build-system', 'agpl3', 'An open-source alternative to Searx that provides clean, ad-free, and orga...'), ('gridtracker2', '2.260416.1', 'copy-build-system', 'bsd-3', 'An Amateur Radio Companion'), ('ossutil', '1.7.19', 'copy-build-system', 'expat', 'A user-friendly command-line tool to access AliCloud OSS'), ('qkdisplays', '1.1', 'pyproject-build-system', 'gpl3+', 'A helper tool for quickly configuring a multi-monitor setup'), ('cht-sh-git', 'r819.d2b8697', 'copy-build-system', 'expat', 'The only cheat sheet you need (command line client for cheat.sh)'), ('skyemu-git', '4.r8.g246ba26', 'cmake-build-system', 'expat', 'An emulator for GB, GBC, GBA, and DS'), ('ddctoolbox-git', '2.0.1.r29.g1988c7b', 'copy-build-system', 'gpl3', 'Create and edit DDC headset correction files'), ('ssmsh', '1.4.9', 'copy-build-system', 'expat', 'Interactive shell for the AWS Parameter Store'), ('agbplay-git', 'c1c9e39', 'cmake-build-system', 'gpl3', 'Music player for the most common GBA sound format'), ('dbibackend', '658', 'copy-build-system', 'expat', 'A convenient method for installing games on your Nintendo Switch over USB'), ('usenti', '1.7.10', 'copy-build-system', 'expat', 'Paletted bitmap editor for GBA and NDS development'), ('brother-dcp-l2500d', '3.2.0_1', 'copy-build-system', 'expat', 'LPR and CUPS driver for the Brother DCP-L2500D'), ('gpgme-1', '1.24.3', 'copy-build-system', 'gpl2+', 'C wrapper library for GnuPG - 1.x'), ('transmission3-cli-noupnp', '3.00', 'copy-build-system', 'expat', 'Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'), ('pterodactyl-panel', '1.12.2', 'copy-build-system', 'expat', 'An open-source game server management panel'), ('velocity-xbox360-git', '0.1.0.0.r1326.cf0b84c', 'copy-build-system', 'gpl3', 'A cross-platform application built using the Qt framework which allows you...'), ('gnuplot-headless', '6.0.4', 'copy-build-system', 'expat', 'Plotting package which outputs to PostScript, PNG, GIF, and others, withou...'), ('ida-free', '8.4.240527', 'copy-build-system', 'expat', "Freeware version of the world's smartest and most feature-full disassembler"), ('ksar-bin', '6.0.0', 'copy-build-system', 'bsd-3', 'a sar grapher written in java (actively maintained fork)'), ('gwenview-no-purpose', '25.12.3', 'cmake-build-system', 'gpl2+', 'A fast and easy to use image viewer, without the dependency on purpose. Th...'), ('rime-project-trans-bin', '20231115', 'copy-build-system', 'expat', '跨儿计划 RIME 词典'), ('java21-openjfx', '21.0.5.u0', 'cmake-build-system', 'gpl2', 'Java OpenJFX client application platform (open-source implementation of Ja...'), ('java21-openjfx-doc', '21.0.5.u0', 'cmake-build-system', 'gpl2', 'Java OpenJFX client application platform (open-source implementation of Ja...'), ('java21-openjfx-src', '21.0.5.u0', 'cmake-build-system', 'gpl2', 'Java OpenJFX client application platform (open-source implementation of Ja...'), ('moedict', '1.1.1', 'copy-build-system', 'gpl3+', 'Chinese Dictionary漢語詞典-萌典/mengdian'), ('pomodoro-logger', '0.6.3', 'copy-build-system', 'gpl3', 'A Pomodoro Timer/Logger with Integrated Kanban Board'), ('twin', '0.9.0', 'copy-build-system', 'gpl2', 'A text-mode window environment'), ('otf-beowulfot', '2.000', 'copy-build-system', 'expat', 'an updated version of the widely-used BeowulfOne font'), ('eot-lalezar', '1.003', 'copy-build-system', 'expat', 'A multi-script display typeface for popular culture'), ('ttf-lalezar', '1.003', 'copy-build-system', 'expat', 'A multi-script display typeface for popular culture'), ('woff2-lalezar', '1.003', 'copy-build-system', 'expat', 'A multi-script display typeface for popular culture'), ('chalice', '1.32.0', 'pyproject-build-system', 'asl2.0', 'Python Serverless Microframework for AWS'), ('otf-compagnon', '1.000', 'copy-build-system', 'expat', 'A multi-style typeface inspired by Typewriter specimens, from Velvetyne Ty...'), ('otf-drafting', '1.1', 'copy-build-system', 'expat', 'A monospace font by indestructible type* inspired by typewriters'), ('ttf-drafting-variable', '1.1', 'copy-build-system', 'expat', 'A monospace font by indestructible type* inspired by typewriters'), ('ttf-montagu-slab', '1.000', 'copy-build-system', 'expat', 'a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...'), ('ttf-montagu-slab-variable', '1.000', 'copy-build-system', 'expat', 'a slab-serif display typeface by Florian Karsten inspired by from 19th-cen...'), ('otf-zilla-slab', '1.002', 'copy-build-system', 'expat', "Mozilla's Zilla Slab Type Family"), ('ttf-yanone-kaffeesatz', '2.001', 'copy-build-system', 'expat', 'Reminiscent of 1920s coffee house typography, bridges the gap to present t...'), ('ttf-yanone-kaffeesatz-infinality', '2.001', 'copy-build-system', 'expat', 'Reminiscent of 1920s coffee house typography, bridges the gap to present t...'), ('ltfs-git', '2.4.3.0.10450.r125.gadb3722', 'gnu-build-system', 'bsd-3', 'Linear Tape File System'), ('tail-tray', '0.2.30', 'cmake-build-system', 'gpl3+', 'Tailscale tray menu and UI for the KDE Plasma Desktop'), ('extracker-git', 'r191.face96f', 'copy-build-system', 'asl2.0', 'A highly parallel bittorrent tracker made in Elixir'), ('clickup', '3.5.185', 'copy-build-system', 'expat', 'Desktop app for clickup.com'), ('bricscad', '26.2.03', 'copy-build-system', 'expat', 'CAD Software for People Who Build the Future'), ('whisper-cpp-model-small', '4', 'copy-build-system', 'expat', 'This is an autogenerated file, please see https://github.com/hrehfeld/arch...'), ('impro-visor', '10.2', 'copy-build-system', 'gpl3+', 'Jazz Improvisation Advisor for the Improviser'), ('whisper-cpp-model-tiny', '4', 'copy-build-system', 'expat', 'This is an autogenerated file, please see https://github.com/hrehfeld/arch...'), ('kbfs', '6.6.0', 'copy-build-system', 'bsd-3', 'The Keybase filesystem'), ('keybase-gui', '6.6.0', 'copy-build-system', 'bsd-3', 'GUI frontend for GPG with keybase.io'), ('nouveau-fw', '340.108', 'copy-build-system', 'expat', 'This package provides video & pgraph firmwares for all NVIDIA chipsets tha...'), ('firefox-sync', '20220831', 'copy-build-system', 'gpl3+', 'Speed up Firefox using tmpfs'), ('wayprompt', '0.1.2', 'copy-build-system', 'gpl3', 'Multi-purpose (password-)prompt tool for Wayland (pinentry)'), ('todesk-rpm-bin', '4.8.1.0', 'copy-build-system', 'expat', 'Remote control and team work'), ('forge-gui-desktop', '2.0.09', 'copy-build-system', 'gpl3', 'The Magic: The Gathering Rules Engine (now with Shandalar-style adventure ...'), ('edu-sync', '0.3.2', 'copy-build-system', 'gpl3', 'A command line application for synchronizing the contents of Moodle instan...'), ('digilent-waveforms', '3.24.3', 'copy-build-system', 'expat', 'Digilent WaveForms Application, Runtime and SDK'), ('axosyslog', '4.16.0', 'pyproject-build-system', 'gpl2+', 'Scalable security data processor'), ('ttf-times-new-roman', '2.0', 'copy-build-system', 'expat', 'Times New Roman font from Microsoft'), ('usermin', '2.510', 'copy-build-system', 'expat', 'A web-based user account administration interface'), ('tracy-x11', '0.13.0', 'cmake-build-system', 'bsd-3', 'Real-time, nanosecond resolution frame profiler'), ('flightgear-data-git', '2024.2.0r10907.462fd76a7', 'copy-build-system', 'gpl3+', 'Base data for the flightgear flight simulator'), ('epub-to-audiobook', '0.8.5', 'copy-build-system', 'expat', 'command-line tool to convert EPUB ebooks into audiobooks'), ('mpv-autosubsync-git', 'r124.22cb928', 'copy-build-system', 'expat', 'Automatic subtitle synchronization script for mpv media player'), ('qp-git', '5.108.0.r0.gbf2bf11', 'copy-build-system', 'gpl3', 'qp - query packages. A CLI utility for querying installed packages across ...'), ('muteled', '1.2.2', 'copy-build-system', 'gpl3+', 'A simple script aiming to fix the broken mute LED light on some HP laptop ...'), ('whisper-cpp-model-large-v3-q5-0', '4', 'copy-build-system', 'expat', 'This is an autogenerated file, please see https://github.com/hrehfeld/arch...'), ('adwaita-colors-icon-theme', '2.5', 'copy-build-system', 'gpl3', 'Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s acce...'), ('ioninja', '5.10.2', 'copy-build-system', 'expat', 'Professional all-in-one terminal emulator, sniffer, and protocol analyzer'), ('libggml-cuda-git', '0.9.4.r387.g3e9f2ba', 'cmake-build-system', 'expat', 'Tensor library for machine learning with OpenBLAS + Vulkan + CUDA optimiza...'), ('sherlock-launcher-git', '0.1.13.r3.gd861ea9', 'copy-build-system', 'expat', 'Application launcher for Wayland'), ('geogebra-6-electron', '6.0.920.0', 'copy-build-system', 'expat', 'Dynamic mathematics software with interactive graphics, algebra and spread...'), ('ly-git', '1.3.0.r1.gc6446db', 'copy-build-system', 'expat', 'TUI display manager'), ('gnome-shell-extension-quick-settings-audio-panel', '101', 'copy-build-system', 'gpl3+', 'Quick Settings Audio Panel GNOME Extension'), ('micron-storage-executive-cli', '11.08.082025.00', 'copy-build-system', 'expat', 'Micron Storage Executive Command Line (msecli) for configuring and managin...'), ('text-engine', '0.1.1', 'meson-build-system', 'mpl2.0', 'A lightweight rich-text framework for GTK'), ('detect-it-easy-git', '3.10.r18916.f0655a9', 'copy-build-system', 'expat', 'Detect It Easy, or abbreviated "DIE" is a program for determining types of...'), ('networkd-notify-git', 'r22.9730435', 'copy-build-system', 'gpl3', 'Desktop notification integration for systemd-networkd'), ('gedit-externaltools-plugin', '48.0', 'meson-build-system', 'gpl2+', 'Externaltools plugin for the gedit Text Editor'), ('filius', '2.10.1', 'copy-build-system', 'gpl3+', 'Network simulation program'), ('electricsheep', '3.0.2', 'copy-build-system', 'gpl3+', 'Screensaver that realize the collective dream of sleeping computers from a...'), ('languagetool-ngrams-en', '20150817', 'copy-build-system', 'expat', 'Finding errors using n-gram data, english text')]

# 7 blocked packages: (name, reason_code, detail)
BLOCKED = [('vmware-workstation-noxsave', 'SOURCE_UNAVAILABLE', 'requires VMware Workstation proprietary installer bundle as source'), ('archcraft-pkg', 'DEP_RESOLUTION_FAILED', 'Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem'), ('wineasio32', 'DEP_RESOLUTION_FAILED', '32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix'), ('gdal-libkml-filegdb', 'DEP_RESOLUTION_FAILED', 'GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb'), ('python-gdal-libkml-filegdb', 'DEP_RESOLUTION_FAILED', 'GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb'), ('opencl-nvidia-340xx', 'SOURCE_UNAVAILABLE', 'OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available'), ('lineageos-devel', 'DEP_RESOLUTION_FAILED', 'meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools')]

# Org update mapping: (entry_num, aur_name, guix_name)
ORG_RESOLVED = [(16294, 'testssl.sh-git', 'testssl-sh-git'), (16295, 'ipfs-desktop-electron', 'ipfs-desktop-electron'), (16300, 'minecraft-ttf-git', 'minecraft-ttf-git'), (16301, 'netmount', 'netmount'), (16302, 'pilot-link-git', 'pilot-link-git'), (16305, 'sview-git', 'sview-git'), (16307, 'bellybutton', 'bellybutton'), (16308, 'hyprland-toggle-tiling-git', 'hyprland-toggle-tiling-git'), (16310, 'ptr89-git', 'ptr89-git'), (16312, 'yd-go-git', 'yd-go-git'), (16316, 'firefox-stylus', 'firefox-stylus'), (16317, 'websurfx-git', 'websurfx-git'), (16319, 'gridtracker2', 'gridtracker2'), (16321, 'ossutil', 'ossutil'), (16322, 'qkdisplays', 'qkdisplays'), (16328, 'cht.sh-git', 'cht-sh-git'), (16330, 'skyemu-git', 'skyemu-git'), (16331, 'ddctoolbox-git', 'ddctoolbox-git'), (16333, 'ssmsh', 'ssmsh'), (16335, 'agbplay-git', 'agbplay-git'), (16337, 'dbibackend', 'dbibackend'), (16338, 'usenti', 'usenti'), (16340, 'brother-dcp-l2500d', 'brother-dcp-l2500d'), (16341, 'gpgme-1', 'gpgme-1'), (16342, 'transmission3-cli-noupnp', 'transmission3-cli-noupnp'), (16347, 'pterodactyl-panel', 'pterodactyl-panel'), (16350, 'velocity-xbox360-git', 'velocity-xbox360-git'), (16351, 'gnuplot-headless', 'gnuplot-headless'), (16355, 'ida-free', 'ida-free'), (16356, 'ksar_bin', 'ksar-bin'), (16357, 'gwenview-no-purpose', 'gwenview-no-purpose'), (16358, 'rime-project-trans-bin', 'rime-project-trans-bin'), (16360, 'java21-openjfx', 'java21-openjfx'), (16361, 'java21-openjfx-doc', 'java21-openjfx-doc'), (16362, 'java21-openjfx-src', 'java21-openjfx-src'), (16366, 'moedict', 'moedict'), (16368, 'pomodoro-logger', 'pomodoro-logger'), (16372, 'twin', 'twin'), (16373, 'otf-beowulfot', 'otf-beowulfot'), (16379, 'eot-lalezar', 'eot-lalezar'), (16382, 'ttf-lalezar', 'ttf-lalezar'), (16384, 'woff2-lalezar', 'woff2-lalezar'), (16385, 'chalice', 'chalice'), (16386, 'otf-compagnon', 'otf-compagnon'), (16390, 'otf-drafting', 'otf-drafting'), (16393, 'ttf-drafting-variable', 'ttf-drafting-variable'), (16394, 'ttf-montagu-slab', 'ttf-montagu-slab'), (16395, 'ttf-montagu-slab-variable', 'ttf-montagu-slab-variable'), (16396, 'otf-zilla-slab', 'otf-zilla-slab'), (16399, 'ttf-yanone-kaffeesatz', 'ttf-yanone-kaffeesatz'), (16400, 'ttf-yanone-kaffeesatz-infinality', 'ttf-yanone-kaffeesatz-infinality'), (16403, 'ltfs-git', 'ltfs-git'), (16407, 'tail-tray', 'tail-tray'), (16411, 'extracker-git', 'extracker-git'), (16415, 'clickup', 'clickup'), (16425, 'bricscad', 'bricscad'), (16432, 'whisper.cpp-model-small', 'whisper-cpp-model-small'), (16433, 'impro-visor', 'impro-visor'), (16438, 'whisper.cpp-model-tiny', 'whisper-cpp-model-tiny'), (16439, 'kbfs', 'kbfs'), (16441, 'keybase-gui', 'keybase-gui'), (16444, 'nouveau-fw', 'nouveau-fw'), (16445, 'firefox-sync', 'firefox-sync'), (16450, 'wayprompt', 'wayprompt'), (16451, 'todesk-rpm-bin', 'todesk-rpm-bin'), (16454, 'forge-gui-desktop', 'forge-gui-desktop'), (16456, 'edu-sync', 'edu-sync'), (16457, 'digilent.waveforms', 'digilent-waveforms'), (16458, 'axosyslog', 'axosyslog'), (16459, 'ttf-times-new-roman', 'ttf-times-new-roman'), (16464, 'usermin', 'usermin'), (16465, 'tracy-x11', 'tracy-x11'), (16466, 'flightgear-data-git', 'flightgear-data-git'), (16467, 'epub_to_audiobook', 'epub-to-audiobook'), (16474, 'mpv-autosubsync-git', 'mpv-autosubsync-git'), (16477, 'qp-git', 'qp-git'), (16478, 'muteled', 'muteled'), (16481, 'whisper.cpp-model-large-v3-q5_0', 'whisper-cpp-model-large-v3-q5-0'), (16485, 'adwaita-colors-icon-theme', 'adwaita-colors-icon-theme'), (16486, 'ioninja', 'ioninja'), (16487, 'libggml-cuda-git', 'libggml-cuda-git'), (16492, 'sherlock-launcher-git', 'sherlock-launcher-git'), (16496, 'geogebra-6-electron', 'geogebra-6-electron'), (16497, 'ly-git', 'ly-git'), (16502, 'gnome-shell-extension-quick-settings-audio-panel', 'gnome-shell-extension-quick-settings-audio-panel'), (16503, 'micron-storage-executive-cli', 'micron-storage-executive-cli'), (16504, 'text-engine', 'text-engine'), (16505, 'detect-it-easy-git', 'detect-it-easy-git'), (16507, 'networkd-notify-git', 'networkd-notify-git'), (16508, 'gedit-externaltools-plugin', 'gedit-externaltools-plugin'), (16512, 'filius', 'filius'), (16513, 'electricsheep', 'electricsheep'), (16517, 'languagetool-ngrams-en', 'languagetool-ngrams-en')]
ORG_BLOCKED = [(16296, 'vmware-workstation-noxsave', 'vmware-workstation-noxsave', 'SOURCE_UNAVAILABLE', 'requires VMware Workstation proprietary installer bundle as source'), (16359, 'archcraft-pkg', 'archcraft-pkg', 'DEP_RESOLUTION_FAILED', 'Arch Linux-specific packaging utility; depends on pacman/makepkg ecosystem'), (16414, 'wineasio32', 'wineasio32', 'DEP_RESOLUTION_FAILED', '32-bit Wine ASIO bridge; requires lib32-glibc and 32-bit Wine multilib not available in Guix'), (16417, 'gdal-libkml-filegdb', 'gdal-libkml-filegdb', 'DEP_RESOLUTION_FAILED', 'GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb'), (16418, 'python-gdal-libkml-filegdb', 'python-gdal-libkml-filegdb', 'DEP_RESOLUTION_FAILED', 'GDAL variant requiring ESRI FileGDB SDK proprietary library; complex dep chain with libkml+filegdb'), (16469, 'opencl-nvidia-340xx', 'opencl-nvidia-340xx', 'SOURCE_UNAVAILABLE', 'OpenCL for legacy NVIDIA 340xx driver; driver EOL, source URLs no longer available'), (16472, 'lineageos-devel', 'lineageos-devel', 'DEP_RESOLUTION_FAILED', 'meta-package for Android/LineageOS build environment; depends on android-sdk, repo, and dozens of Android-specific tools')]

RESOLVED_NAMES = [r[0] for r in RESOLVED]
BLOCKED_NAMES = [b[0] for b in BLOCKED]


def atomic_write(path, content):
    """Write content to path atomically via temp file + rename."""
    dirname = os.path.dirname(path)
    fd, tmp = tempfile.mkstemp(dir=dirname, suffix=".tmp")
    try:
        with os.fdopen(fd, "w") as f:
            f.write(content)
        shutil.move(tmp, path)
    except:
        os.unlink(tmp)
        raise


def update_org():
    print(f"[1/3] Updating {ORG_FILE} ...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Build mapping of org entry numbers to line indices
    resolved_nums = {num: (aur_name, gname) for num, aur_name, gname in ORG_RESOLVED}
    blocked_nums = {num: (aur_name, gname, reason, detail) for num, aur_name, gname, reason, detail in ORG_BLOCKED}
    all_nums = set(resolved_nums.keys()) | set(blocked_nums.keys())

    # Find entries by their TODO number
    headline_re = re.compile(r"^\*\* TODO (\d+)\.")
    pkg_lines = {}
    for i, line in enumerate(lines):
        m = headline_re.match(line)
        if m:
            entry_num = int(m.group(1))
            if entry_num in all_nums and entry_num not in pkg_lines:
                pkg_lines[entry_num] = i

    missing = all_nums - set(pkg_lines.keys())
    if missing:
        print(f"  WARNING: Could not find entries for numbers: {missing}")

    # Process in reverse order
    updates = sorted(pkg_lines.items(), key=lambda x: x[1], reverse=True)

    for entry_num, idx in updates:
        headline = lines[idx]

        if entry_num in resolved_nums:
            aur_name, gname = resolved_nums[entry_num]
            # Change ** TODO to ** DONE
            lines[idx] = headline.replace("** TODO", "** DONE", 1)
            status_line = (
                f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in "
                f"{RESOLVER_TAG}.scm ({gname}, RECIPE: Guix recipe created) "
                f"({RESOLVER_TAG})\n"
            )
        elif entry_num in blocked_nums:
            aur_name, gname, reason, detail = blocked_nums[entry_num]
            lines[idx] = headline.replace("** TODO", "** DONE", 1)
            status_line = (
                f"   - Status: BLOCKED: {reason} — "
                f"{detail} ({RESOLVER_TAG})\n"
            )
        else:
            continue

        # Find insertion point
        insert_at = idx + 1
        while insert_at < len(lines):
            l = lines[insert_at]
            if l.startswith("** ") or l.startswith("* "):
                break
            if l.strip() == "":
                break
            insert_at += 1

        lines.insert(insert_at, status_line)

    atomic_write(ORG_FILE, "".join(lines))
    found = len(pkg_lines)
    print(f"  Updated {found}/{len(all_nums)} entries ({len(RESOLVED)} resolved, {len(BLOCKED)} blocked)")


def update_packages_scm():
    print(f"[2/3] Updating {PACKAGES_SCM} ...")
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = "\n".join(f"               {name}" for name in RESOLVED_NAMES)
    block = (
        f"\n;; {RESOLVER_TAG} ({len(RESOLVED)} NRD resolved, {len(BLOCKED)} BLOCKED)\n"
        f"(define-module (gaurix packages)\n"
        f"  #:use-module (gaurix packages {RESOLVER_TAG})\n"
        f"  #:re-export (\n"
        f"{exports}\n"
        f"               ))\n"
    )

    content = content.rstrip("\n") + "\n" + block
    atomic_write(PACKAGES_SCM, content)
    print(f"  Appended define-module block with {len(RESOLVED_NAMES)} re-exports")


def update_compat_scm():
    print(f"[3/3] Updating {COMPAT_SCM} ...")
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add #:use-module line after the last recipe-resolver use-module
    import_line = f"  #:use-module (gaurix packages {RESOLVER_TAG})"
    last_recipe_re = re.compile(
        r"(  #:use-module \(gaurix packages recipe-resolver-260418z\))"
    )
    if last_recipe_re.search(content):
        content = last_recipe_re.sub(
            r"\1\n" + import_line,
            content,
        )
    else:
        print(f"  WARNING: Could not find recipe-resolver-260418z import anchor")
        content = content.replace(
            "  #:use-module (guix packages)",
            import_line + "\n  #:use-module (guix packages)",
            1,
        )

    # Append compat aliases at end of file
    aliases = []
    aliases.append(f"\n\n;;; --- {RESOLVER_TAG}: {len(RESOLVED)} compat aliases ---\n")
    for name in RESOLVED_NAMES:
        aliases.append(
            f"\n(define-public {name}\n"
            f"  (package\n"
            f"    (inherit {name})\n"
            f"    (name \"{name}\")))\n"
        )

    content = content.rstrip("\n") + "\n" + "".join(aliases)
    atomic_write(COMPAT_SCM, content)
    print(f"  Added #:use-module import + {len(RESOLVED_NAMES)} compat aliases")


if __name__ == "__main__":
    update_org()
    update_packages_scm()
    update_compat_scm()
    print("\nAll updates complete.")
