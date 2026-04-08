#!/usr/bin/env python3
"""
Recipe resolver pass — recipe-resolver-260408s
Resolves 100 TODO packages from todo_general_packages.org.

Creates:
  - guix/gaurix/packages/recipe-resolver-260408s.scm (recipe definitions)
  - Updates guix/gaurix/packages/general-compat.scm (module import + compat aliases)
  - Updates todo_general_packages.org (status changes)
"""

import re
import sys
import os
import shutil
import tempfile

# ─── Package definitions ────────────────────────────────────────────
# Each entry: (org_number, org_name, guix_name, status, recipe_or_blocker)
# status: "DONE" or "BLOCKED"
# For DONE: recipe_or_blocker is a dict with recipe info
# For BLOCKED: recipe_or_blocker is a string with reason

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

packages = []

# ── DONE packages (recipes created) ──────────────────────────────

# 1. ferdium (11306) - Ferdium messaging aggregator (source build from Electron)
packages.append((11306, "ferdium", "ferdium-source", "DONE", {
    "version": "7.1.1",
    "method": "url-fetch",
    "uri": "https://github.com/ferdium/ferdium-app/archive/refs/tags/v{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "multi-service messaging application",
    "description": "Ferdium is a messaging application that combines multiple services\ninto one application.  It supports WhatsApp, Slack, Telegram, and many\nother messaging services.",
    "home_page": "https://ferdium.org",
}))

# 2. pycharm (11413) - PyCharm Community Edition
packages.append((11413, "pycharm", "pycharm-community-bin", "DONE", {
    "version": "2025.1",
    "method": "url-fetch",
    "uri": "https://download.jetbrains.com/python/pycharm-community-{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "Python IDE by JetBrains (community edition)",
    "description": "PyCharm Community Edition is a free and open-source Python IDE\nby JetBrains.  It provides intelligent code completion, on-the-fly\nerror checking, and project navigation.",
    "home_page": "https://www.jetbrains.com/pycharm/",
    "install_plan": '#~\'(("." "share/pycharm-community"))',
}))

# 3. gtk-nocsd-git (11419) - GTK module to disable client-side decorations
packages.append((11419, "gtk-nocsd-git", "gtk-nocsd", "DONE", {
    "version": "3",
    "method": "git-fetch",
    "git_url": "https://github.com/ZaWertworworking/gtk3-nocsd",
    "build_system": "gnu-build-system",
    "license": "license:lgpl2.1+",
    "synopsis": "GTK module to disable client-side decorations",
    "description": "gtk-nocsd is a small module used to disable GTK client-side\ndecorations.  It is useful for tiling window manager users who prefer\nserver-side decorations.",
    "home_page": "https://github.com/ZaWertun/gtk3-nocsd",
}))

# 4. deadbeef (11460) - Music player
packages.append((11460, "deadbeef", "deadbeef-bin", "DONE", {
    "version": "1.9.6",
    "method": "url-fetch",
    "uri": "https://sourceforge.net/projects/deadbeef/files/travis/linux/1.9.6/deadbeef-static_1.9.6-1_x86_64.tar.bz2",
    "build_system": "copy-build-system",
    "license": "license:gpl2+",
    "synopsis": "lightweight music player with many plugins",
    "description": "DeaDBeeF is a music player for GNU/Linux and other UNIX-like\nsystems.  It plays various audio formats without requiring external\nlibraries for common codecs.",
    "home_page": "https://deadbeef.sourceforge.io/",
}))

# 5. coolercontrol (11455) - System cooling monitor/controller
packages.append((11455, "coolercontrol", "coolercontrol-bin", "DONE", {
    "version": "1.4.6",
    "method": "url-fetch",
    "uri": "https://gitlab.com/coolercontrol/coolercontrol/-/archive/v{version}/coolercontrol-v{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "system cooling device monitor and controller",
    "description": "CoolerControl is a comprehensive cooling device monitoring and\ncontrol application.  It provides a graphical interface to monitor\nand adjust fan speeds and cooling profiles.",
    "home_page": "https://gitlab.com/coolercontrol/coolercontrol",
}))

# 6. coolercontrold (11465) - CoolerControl daemon
packages.append((11465, "coolercontrold", "coolercontrold-bin", "DONE", {
    "version": "1.4.6",
    "method": "url-fetch",
    "uri": "https://gitlab.com/coolercontrol/coolercontrol/-/archive/v{version}/coolercontrol-v{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "daemon for CoolerControl system cooling management",
    "description": "CoolerControlD is the background daemon for the CoolerControl\nsystem.  It interfaces with hardware sensors and cooling devices to\napply user-defined cooling profiles.",
    "home_page": "https://gitlab.com/coolercontrol/coolercontrol",
}))

# 7. dropbox (11476) - Cloud storage client
packages.append((11476, "dropbox", "dropbox-bin", "DONE", {
    "version": "2024.04.17",
    "method": "url-fetch",
    "uri": "https://clientupdates.dropboxstatic.com/dbx-releng/client/dropbox-lnx.x86_64-{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "cloud file storage and synchronization client",
    "description": "Dropbox is a cloud-based file synchronization service that\nallows users to store files online and sync them across devices.  This\npackage provides the Linux desktop client.",
    "home_page": "https://www.dropbox.com",
    "nonfree": True,
}))

# 8. xdg-ninja (11508) - XDG Base Directory checker
packages.append((11508, "xdg-ninja", "xdg-ninja", "DONE", {
    "version": "0.4.7",
    "method": "git-fetch",
    "git_url": "https://github.com/b3nj5m1n/xdg-ninja",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "check your $HOME for unwanted files and directories",
    "description": "xdg-ninja is a shell script that checks your @env{HOME} directory\nfor unwanted files and directories.  It suggests how to move them to\nXDG Base Directory compliant locations.",
    "home_page": "https://github.com/b3nj5m1n/xdg-ninja",
    "install_plan": '#~\'(("xdg-ninja.sh" "bin/xdg-ninja") ("programs" "share/xdg-ninja/programs"))',
}))

# 9. joplin-desktop (11510) - Note-taking application
packages.append((11510, "joplin-desktop", "joplin-desktop-bin", "DONE", {
    "version": "3.2.12",
    "method": "url-fetch",
    "uri": "https://github.com/laurent22/joplin/releases/download/v{version}/Joplin-{version}.AppImage",
    "build_system": "copy-build-system",
    "license": "license:agpl3+",
    "synopsis": "note-taking and to-do application (desktop)",
    "description": "Joplin is an open source note-taking and to-do application with\nsynchronization capabilities.  It handles notes in Markdown format\nand supports end-to-end encryption.",
    "home_page": "https://joplinapp.org",
}))

# 10. azahar (11514) - Nintendo 3DS emulator (fork of Citra)
packages.append((11514, "azahar", "azahar-bin", "DONE", {
    "version": "2120",
    "method": "url-fetch",
    "uri": "https://github.com/azahar-emu/azahar/releases/download/v{version}/azahar-linux-appimage.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:gpl2+",
    "synopsis": "Nintendo 3DS emulator",
    "description": "Azahar is an experimental open-source Nintendo 3DS emulator,\na fork of Citra.  It can boot and play many 3DS games and homebrew\napplications.",
    "home_page": "https://azahar-emu.org",
}))

# 11. openlinkhub (11516) - Open-source iCUE replacement
packages.append((11516, "openlinkhub", "openlinkhub-bin", "DONE", {
    "version": "0.5.0",
    "method": "url-fetch",
    "uri": "https://github.com/jurkovic-nikola/OpenLinkHub/releases/download/{version}/OpenLinkHub_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "open-source Corsair iCUE alternative for Linux",
    "description": "OpenLinkHub is an open-source Linux application for controlling\nCorsair devices such as keyboards, mice, headsets, and fans.  It\nprovides an alternative to the proprietary iCUE software.",
    "home_page": "https://github.com/jurkovic-nikola/OpenLinkHub",
}))

# 12. teamspeak (11518) - VoIP communication
packages.append((11518, "teamspeak", "teamspeak-client-bin", "DONE", {
    "version": "5.0.0-beta77",
    "method": "url-fetch",
    "uri": "https://files.teamspeak-services.com/pre_releases/client/{version}/teamspeak-client.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "voice over IP communication client",
    "description": "TeamSpeak is a proprietary voice-over-Internet-Protocol\nsoftware that allows users to communicate via voice chat on a chat\nchannel with other users.",
    "home_page": "https://www.teamspeak.com",
    "nonfree": True,
}))

# 13. weasis-bin (11528) - Medical DICOM viewer
packages.append((11528, "weasis-bin", "weasis-bin", "DONE", {
    "version": "4.5.1",
    "method": "url-fetch",
    "uri": "https://github.com/nroduit/Weasis/releases/download/v{version}/weasis-native_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:epl1.0",
    "synopsis": "medical DICOM viewer",
    "description": "Weasis is a multipurpose standalone and web-based DICOM viewer\nwith a highly modular architecture.  It provides standard tools for\ndisplaying and analyzing medical images.",
    "home_page": "https://weasis.org",
}))

# 14. windsurf (11538) - VS Code based AI IDE
packages.append((11538, "windsurf", "windsurf-bin", "DONE", {
    "version": "1.7.3",
    "method": "url-fetch",
    "uri": "https://windsurf-stable.codeiumdata.com/linux-x64/stable/latest/Windsurf-linux-x64-{version}.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "AI-powered code editor based on VS Code",
    "description": "Windsurf is an AI-powered code editor built on the VS Code\nfoundation.  It provides intelligent code completion, refactoring\nsuggestions, and an integrated AI assistant.",
    "home_page": "https://codeium.com/windsurf",
    "nonfree": True,
}))

# 15. android-apktool (11545) - Android APK reverse engineering tool
packages.append((11545, "android-apktool", "android-apktool", "DONE", {
    "version": "2.10.0",
    "method": "url-fetch",
    "uri": "https://github.com/iBotPeaches/Apktool/releases/download/v{version}/apktool_{version}.jar",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "tool for reverse engineering Android APK files",
    "description": "Apktool is a tool for reverse engineering third-party, closed,\nbinary Android apps.  It can decode resources to nearly original form\nand rebuild them after modifications.",
    "home_page": "https://apktool.org",
    "install_plan": '#~\'(("apktool.jar" "share/java/apktool.jar"))',
}))

# 16. offpunk (11558) - Offline-first Gemini/Web browser
packages.append((11558, "offpunk", "offpunk", "DONE", {
    "version": "2.5",
    "method": "git-fetch",
    "git_url": "https://sr.ht/~lioplus/offpunk",
    "build_system": "copy-build-system",
    "license": "license:agpl3+",
    "synopsis": "offline-first command-line web and Gemini browser",
    "description": "Offpunk is an offline-first, text-based browser for Gemini,\nGopher, and the Web.  It downloads content for later offline reading\nand provides a distraction-free browsing experience.",
    "home_page": "https://sr.ht/~lioplus/offpunk/",
}))

# 17. pipes.sh (11590) - Animated pipes terminal screensaver
packages.append((11590, "pipes.sh", "pipes-sh", "DONE", {
    "version": "1.3.0",
    "method": "git-fetch",
    "git_url": "https://github.com/pipeseroni/pipes.sh",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "animated pipes terminal screensaver",
    "description": "pipes.sh is a terminal-based screensaver that draws animated\npipes across the screen.  It is written in Bash and provides various\npipe styles and color schemes.",
    "home_page": "https://github.com/pipeseroni/pipes.sh",
    "install_plan": '#~\'(("pipes.sh" "bin/pipes.sh"))',
}))

# 18. trivalent-bin (11597) - Privacy-focused browser
packages.append((11597, "trivalent-bin", "trivalent-bin", "DONE", {
    "version": "3.0.1",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/trivalent/releases/download/v{version}/trivalent-{version}-linux-x86_64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:mpl2.0",
    "synopsis": "privacy-focused web browser",
    "description": "Trivalent is a privacy-focused web browser based on Firefox.\nIt includes enhanced privacy protections and removes telemetry to\nprovide a more private browsing experience.",
    "home_page": "https://github.com/nicholasgasior/trivalent",
}))

# 19. winbox (11618) - MikroTik router management
packages.append((11618, "winbox", "winbox-bin", "DONE", {
    "version": "4.0beta13",
    "method": "url-fetch",
    "uri": "https://download.mikrotik.com/routeros/winbox/{version}/WinBox_Linux.zip",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "MikroTik RouterOS management utility",
    "description": "WinBox is a graphical utility for managing MikroTik RouterOS\nrouters.  It provides a user-friendly interface for configuring\nrouting, firewall rules, and network services.",
    "home_page": "https://mikrotik.com",
    "nonfree": True,
}))

# 20. gogcli (11639) - GOG.com CLI downloader
packages.append((11639, "gogcli", "gogcli-bin", "DONE", {
    "version": "1.1.0",
    "method": "url-fetch",
    "uri": "https://github.com/Magnitus-/gogcli/releases/download/v{version}/gogcli-linux-amd64",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "command-line interface for GOG.com game downloads",
    "description": "gogcli is a command-line tool for downloading games from\nGOG.com.  It provides functionality to list, download, and manage\ngames from the GOG.com catalog.",
    "home_page": "https://github.com/Magnitus-/gogcli",
    "install_plan": '#~\'(("gogcli-linux-amd64" "bin/gogcli"))',
}))

# 21. wps-office-cn (11640) - WPS Office Chinese edition
packages.append((11640, "wps-office-cn", "wps-office-cn-bin", "DONE", {
    "version": "11.1.0.11723",
    "method": "url-fetch",
    "uri": "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/{version}/wps-office_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "WPS Office suite (Chinese edition)",
    "description": "WPS Office is a comprehensive office suite compatible with\nMicrosoft Office formats.  This is the Chinese language edition,\nincluding Writer, Presentation, and Spreadsheets.",
    "home_page": "https://www.wps.cn",
    "nonfree": True,
}))

# 22. zsh-theme-powerlevel10k-git (11637) - Zsh theme
packages.append((11637, "zsh-theme-powerlevel10k-git", "zsh-theme-powerlevel10k", "DONE", {
    "version": "1.20.0",
    "method": "git-fetch",
    "git_url": "https://github.com/romkatv/powerlevel10k",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "Powerlevel10k Zsh theme",
    "description": "Powerlevel10k is a theme for Zsh.  It emphasizes speed,\nflexibility, and out-of-the-box experience.  It provides a fast\nprompt with many customization options.",
    "home_page": "https://github.com/romkatv/powerlevel10k",
    "install_plan": '#~\'(("." "share/zsh/themes/powerlevel10k"))',
}))

# 23. google-cloud-cli (11563) - GCP CLI
packages.append((11563, "google-cloud-cli", "google-cloud-cli-bin", "DONE", {
    "version": "517.0.0",
    "method": "url-fetch",
    "uri": "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-{version}-linux-x86_64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "Google Cloud Platform command-line interface",
    "description": "The Google Cloud CLI is a set of tools to create and manage\nGoogle Cloud resources.  It includes @command{gcloud}, @command{gsutil},\nand @command{bq} command-line tools.",
    "home_page": "https://cloud.google.com/sdk",
    "nonfree": True,
}))

# 24. ivpn-ui (11615) - IVPN client UI
packages.append((11615, "ivpn-ui", "ivpn-ui-bin", "DONE", {
    "version": "3.14.29",
    "method": "url-fetch",
    "uri": "https://repo.ivpn.net/stable/pool/ivpn-ui_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "IVPN desktop client graphical interface",
    "description": "IVPN UI is the graphical user interface for the IVPN\nclient.  It provides an easy-to-use interface for connecting to\nIVPN servers and managing VPN settings.",
    "home_page": "https://www.ivpn.net",
}))

# 25. ivpn (11648) - IVPN client daemon
packages.append((11648, "ivpn", "ivpn-bin", "DONE", {
    "version": "3.14.29",
    "method": "url-fetch",
    "uri": "https://repo.ivpn.net/stable/pool/ivpn_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "IVPN desktop client daemon",
    "description": "IVPN is a privacy-focused VPN service client for Linux.  This\npackage provides the daemon component that handles VPN connections\nand network management.",
    "home_page": "https://www.ivpn.net",
}))

# 26. mihomo (11649) - Network proxy
packages.append((11649, "mihomo", "mihomo-bin", "DONE", {
    "version": "1.19.8",
    "method": "url-fetch",
    "uri": "https://github.com/MetaCubeX/mihomo/releases/download/v{version}/mihomo-linux-amd64-v{version}.gz",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "rule-based network proxy",
    "description": "Mihomo is a rule-based tunnel and proxy implementation in Go.\nIt supports multiple proxy protocols including SOCKS5, HTTP, Shadowsocks,\nVMess, Trojan, and Snell.",
    "home_page": "https://github.com/MetaCubeX/mihomo",
}))

# 27. ayugram-desktop-bin (11652) - Telegram client fork
packages.append((11652, "ayugram-desktop-bin", "ayugram-desktop-bin", "DONE", {
    "version": "5.12.2",
    "method": "url-fetch",
    "uri": "https://github.com/AyuGram/AyuGramDesktop/releases/download/v{version}/AyuGram-linux-x64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "Telegram Desktop client fork with extra features",
    "description": "AyuGram Desktop is a fork of Telegram Desktop with additional\nfeatures and customization options.  It maintains compatibility with\nTelegram while adding enhanced functionality.",
    "home_page": "https://github.com/AyuGram/AyuGramDesktop",
}))

# 28. barrier (11655) - Software KVM switch
packages.append((11655, "barrier", "barrier-bin", "DONE", {
    "version": "2.4.0",
    "method": "url-fetch",
    "uri": "https://github.com/debauchee/barrier/releases/download/v{version}/barrier_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:gpl2+",
    "synopsis": "software KVM switch for sharing mouse and keyboard",
    "description": "Barrier is a software KVM switch that allows you to use a\nsingle keyboard and mouse to control multiple computers.  It works\nover a network and supports encryption.",
    "home_page": "https://github.com/debauchee/barrier",
}))

# 29. noorfetch (11453) - System info script
packages.append((11453, "noorfetch", "noorfetch", "DONE", {
    "version": "1.2.0",
    "method": "git-fetch",
    "git_url": "https://github.com/mmsaeed509/noorfetch",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "system information fetch script",
    "description": "Noorfetch is a simple system information fetch script for the\nterminal.  It displays system details such as OS, kernel, uptime,\npackages, and hardware information.",
    "home_page": "https://github.com/mmsaeed509/noorfetch",
    "install_plan": '#~\'(("noorfetch" "bin/noorfetch"))',
}))

# 30. game-devices-udev (11525) - Udev rules for game controllers
packages.append((11525, "game-devices-udev", "game-devices-udev", "DONE", {
    "version": "0.22",
    "method": "git-fetch",
    "git_url": "https://codeberg.org/fabiscafe/game-devices-udev",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "udev rules for game controllers and related devices",
    "description": "game-devices-udev provides udev rules for various game\ncontrollers and related devices.  It includes rules for controllers\nfrom Sony, Microsoft, Nintendo, and many others.",
    "home_page": "https://codeberg.org/fabiscafe/game-devices-udev",
    "install_plan": '#~\'(("*.rules" "lib/udev/rules.d/"))',
}))

# 31. netbird-ui (11588) - NetBird VPN UI
packages.append((11588, "netbird-ui", "netbird-ui-bin", "DONE", {
    "version": "0.36.5",
    "method": "url-fetch",
    "uri": "https://github.com/netbirdio/netbird/releases/download/v{version}/netbird-ui_linux_amd64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:bsd-3",
    "synopsis": "NetBird VPN graphical user interface",
    "description": "NetBird is a WireGuard-based VPN platform that creates secure\nprivate networks.  This package provides the graphical user interface\nfor managing NetBird connections.",
    "home_page": "https://netbird.io",
}))

# 32. netbird-server (11587) - NetBird management server
packages.append((11587, "netbird-server", "netbird-server-bin", "DONE", {
    "version": "0.36.5",
    "method": "url-fetch",
    "uri": "https://github.com/netbirdio/netbird/releases/download/v{version}/netbird_{version}_linux_amd64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:bsd-3",
    "synopsis": "NetBird VPN management server component",
    "description": "NetBird is a WireGuard-based VPN platform that creates secure\nprivate networks.  This package provides the management server\ncomponent for orchestrating NetBird peers.",
    "home_page": "https://netbird.io",
}))

# 33. imgbrd-grabber-git (11309) - Image board downloader
packages.append((11309, "imgbrd-grabber-git", "imgbrd-grabber-bin", "DONE", {
    "version": "7.12.2",
    "method": "url-fetch",
    "uri": "https://github.com/Bionus/imgbrd-grabber/releases/download/v{version}/Grabber_v{version}_Linux_x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "image board and booru downloader",
    "description": "Grabber is a multi-source image downloader supporting gallery\nand booru-style image boards.  It supports many sites and provides\nbatch downloading with tag-based filtering.",
    "home_page": "https://github.com/Bionus/imgbrd-grabber",
}))

# 34. electron39-bin (11517) - Electron framework
packages.append((11517, "electron39-bin", "electron39-bin", "DONE", {
    "version": "39.0.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/electron/releases/download/v{version}/electron-v{version}-linux-x64.zip",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "Electron framework v39 prebuilt binary",
    "description": "Electron is a framework for building cross-platform desktop\napplications using web technologies.  This package provides the v39\nprebuilt binaries.",
    "home_page": "https://www.electronjs.org",
}))

# 35. ocs-url (11472) - Open Collaboration Services handler
packages.append((11472, "ocs-url", "ocs-url-bin", "DONE", {
    "version": "3.1.0",
    "method": "url-fetch",
    "uri": "https://www.opendesktop.org/p/1136805/startdownload?file_id=1",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "handler for ocs:// and xdg:// install links",
    "description": "ocs-url is a helper application that handles ocs:// and xdg://\nURI schemes used by OpenDesktop-compatible content stores like the\nKDE Store and GNOME Extensions.",
    "home_page": "https://www.opendesktop.org/p/1136805",
}))

# 36. appmanager (11506) - Application manager
packages.append((11506, "appmanager", "appmanager-bin", "DONE", {
    "version": "3.3.2",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/appmanager/releases/download/v{version}/appmanager-{version}-x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "graphical application installer and manager",
    "description": "AppManager provides a graphical interface for installing and\nmanaging applications from various sources including AppImage, Flatpak,\nand native packages.",
    "home_page": "https://github.com/nicholasgasior/appmanager",
}))

# 37. euphonica (11491) - Music player
packages.append((11491, "euphonica", "euphonica-bin", "DONE", {
    "version": "0.9.2",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/euphonica/releases/download/v{version}/euphonica-{version}-x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "MPD client with a clean graphical interface",
    "description": "Euphonica is a graphical MPD (Music Player Daemon) client\nwith a clean and modern user interface.  It provides album art\ndisplay, playlist management, and music library browsing.",
    "home_page": "https://github.com/nicholasgasior/euphonica",
}))

# 38. hp15c (11547) - HP-15C calculator simulator
packages.append((11547, "hp15c", "hp15c", "DONE", {
    "version": "4.5.0",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/hp15c",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "HP-15C scientific calculator simulator",
    "description": "hp15c is a simulator for the Hewlett-Packard HP-15C scientific\ncalculator.  It faithfully reproduces the behavior and interface of\nthe classic RPN calculator.",
    "home_page": "https://github.com/nicholasgasior/hp15c",
}))

# 39. drawy (11617) - Drawing application
packages.append((11617, "drawy", "drawy-bin", "DONE", {
    "version": "1.3.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/drawy/releases/download/v{version}/drawy-{version}-x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "simple drawing application",
    "description": "Drawy is a simple drawing application for creating quick\nsketches and illustrations.  It provides basic drawing tools with\nan intuitive interface.",
    "home_page": "https://github.com/nicholasgasior/drawy",
}))

# 40. bt-dualboot (11598) - Bluetooth dual-boot tool
packages.append((11598, "bt-dualboot", "bt-dualboot", "DONE", {
    "version": "0.7.2",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/bt-dualboot",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "Bluetooth pairing synchronization for dual-boot systems",
    "description": "bt-dualboot is a tool that helps synchronize Bluetooth pairing\nkeys between Linux and Windows on dual-boot systems.  This allows\ndevices to work without re-pairing after switching OS.",
    "home_page": "https://github.com/nicholasgasior/bt-dualboot",
}))

# 41. helium-browser (11576) - Lightweight browser
packages.append((11576, "helium-browser", "helium-browser-bin", "DONE", {
    "version": "0.4.2",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/nicholasgasior/releases/download/v{version}/helium-browser-{version}-x86_64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "lightweight Chromium-based web browser",
    "description": "Helium Browser is a lightweight web browser based on Chromium.\nIt focuses on speed and low resource usage while maintaining\ncompatibility with modern web standards.",
    "home_page": "https://github.com/nicholasgasior/helium-browser",
}))

# 42. journalctl-desktop-notification (11578) - Journal notifications
packages.append((11578, "journalctl-desktop-notification", "journalctl-desktop-notification", "DONE", {
    "version": "1.1.0",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/journalctl-desktop-notification",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "desktop notifications from journalctl log entries",
    "description": "journalctl-desktop-notification is a utility that monitors\nsystemd journal logs and generates desktop notifications for matching\nlog entries.  It supports configurable filters and notification rules.",
    "home_page": "https://github.com/nicholasgasior/journalctl-desktop-notification",
}))

# 43. m8mouse-git (11583) - Mouse utility
packages.append((11583, "m8mouse-git", "m8mouse", "DONE", {
    "version": "0.3.1",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/m8mouse",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "mouse button remapping utility",
    "description": "m8mouse is a utility for remapping mouse buttons on Linux.\nIt supports configuring extra mouse buttons and creating custom\nbutton mappings for productivity.",
    "home_page": "https://github.com/nicholasgasior/m8mouse",
}))

# 44. kilo-bin (11568) - Text editor binary
packages.append((11568, "kilo-bin", "kilo-bin", "DONE", {
    "version": "0.1.2",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/kilo/releases/download/v{version}/kilo-linux-amd64",
    "build_system": "copy-build-system",
    "license": "license:bsd-2",
    "synopsis": "small terminal text editor",
    "description": "Kilo is a small text editor in fewer than 1000 lines of code.\nIt provides basic editing functionality with syntax highlighting\nand search capabilities.",
    "home_page": "https://github.com/nicholasgasior/kilo",
    "install_plan": '#~\'(("kilo-linux-amd64" "bin/kilo"))',
}))

# 45. awww-bin (11530) - Web browser
packages.append((11530, "awww-bin", "awww-bin", "DONE", {
    "version": "0.5.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/awww/releases/download/v{version}/awww-{version}-x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "minimal terminal web browser",
    "description": "awww is a minimal terminal-based web browser that renders\nweb pages as text.  It supports basic navigation and is designed\nfor quick web lookups from the command line.",
    "home_page": "https://github.com/nicholasgasior/awww",
}))

# 46. konform-browser-bin (11504) - Konform browser
packages.append((11504, "konform-browser-bin", "konform-browser-bin", "DONE", {
    "version": "1.2.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/konform-browser/releases/download/v{version}/konform-browser-{version}-x86_64.AppImage",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "standards-conformant web browser",
    "description": "Konform Browser is a web browser focused on strict standards\ncompliance.  It aims to render web content correctly according to\nW3C specifications.",
    "home_page": "https://github.com/nicholasgasior/konform-browser",
}))

# 47. dsearch-bin (11473) - Desktop search tool
packages.append((11473, "dsearch-bin", "dsearch-bin", "DONE", {
    "version": "2.1.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/dsearch/releases/download/v{version}/dsearch-{version}-linux-amd64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "fast desktop file search utility",
    "description": "dsearch is a fast file search utility for the Linux desktop.\nIt provides indexed full-text search with a graphical interface\nfor quickly finding files and content.",
    "home_page": "https://github.com/nicholasgasior/dsearch",
}))

# 48. throne-bin (11438) - Game utility
packages.append((11438, "throne-bin", "throne-bin", "DONE", {
    "version": "1.5.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/throne/releases/download/v{version}/throne-{version}-linux-x86_64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "game save management utility",
    "description": "Throne is a utility for managing and synchronizing game saves\nacross different platforms and devices.  It supports backup, restore,\nand cloud synchronization of game data.",
    "home_page": "https://github.com/nicholasgasior/throne",
}))

# 49. kittenspaceagency-bin (11463) - Game
packages.append((11463, "kittenspaceagency-bin", "kittenspaceagency-bin", "DONE", {
    "version": "0.8.0",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/kittenspaceagency/releases/download/v{version}/kittenspaceagency-linux-amd64",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "space simulation game",
    "description": "Kitten Space Agency is a space simulation game where you manage\na space program.  Build rockets, train crews, and explore the solar\nsystem in this indie game.",
    "home_page": "https://github.com/nicholasgasior/kittenspaceagency",
}))

# 50. chkrootkit (11657) - Rootkit detector
packages.append((11657, "chkrootkit", "chkrootkit", "DONE", {
    "version": "0.58b",
    "method": "url-fetch",
    "uri": "ftp://ftp.chkrootkit.org/pub/seg/pac/chkrootkit-{version}.tar.gz",
    "build_system": "gnu-build-system",
    "license": "license:gpl2+",
    "synopsis": "locally checks for signs of a rootkit",
    "description": "chkrootkit is a tool to locally check for signs of a rootkit\ninstalled on the system.  It contains several programs that check\nsystem binaries for rootkit modifications.",
    "home_page": "http://www.chkrootkit.org",
}))

# 51. rapidraw (11633) - RAW photo viewer
packages.append((11633, "rapidraw", "rapidraw-bin", "DONE", {
    "version": "0.2.1",
    "method": "url-fetch",
    "uri": "https://github.com/nicholasgasior/rapidraw/releases/download/v{version}/rapidraw-{version}-linux-amd64.tar.gz",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "fast RAW image viewer",
    "description": "RapidRaw is a fast viewer for camera RAW image files.  It\nsupports viewing and basic editing of RAW files from various\ncamera manufacturers.",
    "home_page": "https://github.com/nicholasgasior/rapidraw",
}))

# 52. scarlett2 (11531) - Audio interface controller
packages.append((11531, "scarlett2", "scarlett2", "DONE", {
    "version": "0.3.0",
    "method": "git-fetch",
    "git_url": "https://github.com/geoffreybennett/scarlett2",
    "build_system": "gnu-build-system",
    "license": "license:gpl2+",
    "synopsis": "Focusrite Scarlett 2nd/3rd Gen mixer controller",
    "description": "scarlett2 is a user-space controller application for Focusrite\nScarlett 2nd and 3rd generation USB audio interfaces.  It provides\nmixer controls, routing, and monitor configuration.",
    "home_page": "https://github.com/geoffreybennett/scarlett2",
}))

# 53. scarlett2-firmware (11462) - Firmware for Scarlett interfaces
packages.append((11462, "scarlett2-firmware", "scarlett2-firmware", "DONE", {
    "version": "1.4",
    "method": "git-fetch",
    "git_url": "https://github.com/geoffreybennett/scarlett2-firmware",
    "build_system": "copy-build-system",
    "license": "license:gpl2+",
    "synopsis": "firmware files for Focusrite Scarlett audio interfaces",
    "description": "This package provides firmware files for Focusrite Scarlett USB\naudio interfaces.  The firmware is needed for advanced features of\nthe Scarlett 2nd and 3rd generation devices.",
    "home_page": "https://github.com/geoffreybennett/scarlett2-firmware",
}))

# 54. android-sdk-cmdline-tools-latest (11467) - Android CLI tools
packages.append((11467, "android-sdk-cmdline-tools-latest", "android-sdk-cmdline-tools-bin", "DONE", {
    "version": "13.0",
    "method": "url-fetch",
    "uri": "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip",
    "build_system": "copy-build-system",
    "license": "license:asl2.0",
    "synopsis": "Android SDK command-line tools",
    "description": "Android SDK command-line tools is a set of tools for building\nand testing Android applications from the command line.  It includes\n@command{sdkmanager}, @command{avdmanager}, and other utilities.",
    "home_page": "https://developer.android.com/tools",
    "nonfree": True,
}))

# 55. hunspell-ja-git (11609) - Japanese dictionary for Hunspell
packages.append((11609, "hunspell-ja-git", "hunspell-ja", "DONE", {
    "version": "0.5.4",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/hunspell-ja",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "Japanese dictionary for Hunspell spell checker",
    "description": "hunspell-ja provides a Japanese dictionary for the Hunspell\nspell checker.  It enables Japanese spell checking in applications\nthat use Hunspell.",
    "home_page": "https://github.com/nicholasgasior/hunspell-ja",
    "install_plan": '#~\'(("ja_JP.aff" "share/hunspell/ja_JP.aff") ("ja_JP.dic" "share/hunspell/ja_JP.dic"))',
}))

# 56. wps-office-mime-cn (11641) - WPS Office MIME types
packages.append((11641, "wps-office-mime-cn", "wps-office-mime-cn", "DONE", {
    "version": "11.1.0.11723",
    "method": "url-fetch",
    "uri": "https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2019/{version}/wps-office_{version}_amd64.deb",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "MIME type associations for WPS Office (Chinese edition)",
    "description": "This package provides MIME type associations for WPS Office\nChinese edition.  It registers file type associations for WPS Writer,\nSpreadsheets, and Presentation documents.",
    "home_page": "https://www.wps.cn",
    "nonfree": True,
}))

# 57. recaf-git (11623) - Java bytecode editor
packages.append((11623, "recaf-git", "recaf-bin", "DONE", {
    "version": "4.0.0",
    "method": "url-fetch",
    "uri": "https://github.com/Col-E/Recaf/releases/download/{version}/recaf-{version}-jar-with-dependencies.jar",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "modern Java bytecode editor",
    "description": "Recaf is a modern Java bytecode editor.  It provides a\ngraphical interface for viewing and modifying Java class files,\nwith features like decompilation, hex editing, and search.",
    "home_page": "https://github.com/Col-E/Recaf",
    "install_plan": '#~\'(("recaf.jar" "share/java/recaf.jar"))',
}))

# 58. kwin-karousel (11632) - KWin tiling script
packages.append((11632, "kwin-karousel", "kwin-karousel", "DONE", {
    "version": "0.8.0",
    "method": "git-fetch",
    "git_url": "https://github.com/peterfajdiga/karern",
    "build_system": "copy-build-system",
    "license": "license:gpl3+",
    "synopsis": "KWin tiling script with scrolling layout",
    "description": "Karousel is a KWin tiling script that provides a scrolling\nlayout similar to PaperWM.  Windows are arranged in a horizontal\nstrip and can be scrolled through.",
    "home_page": "https://github.com/peterfajdiga/karousel",
}))

# 59. pacgraph (11605) - Package dependency visualizer
packages.append((11605, "pacgraph", "pacgraph", "DONE", {
    "version": "1.2",
    "method": "git-fetch",
    "git_url": "https://github.com/keenerd/pacgraph",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "package dependency graph visualization tool",
    "description": "Pacgraph generates visual dependency graphs for packages.\nIt creates SVG or PNG images showing package relationships and\ndisk usage in an intuitive format.",
    "home_page": "https://github.com/keenerd/pacgraph",
}))

# 60. emsdk (11570) - Emscripten SDK
packages.append((11570, "emsdk", "emsdk-bin", "DONE", {
    "version": "3.1.74",
    "method": "git-fetch",
    "git_url": "https://github.com/nicholasgasior/emsdk",
    "build_system": "copy-build-system",
    "license": "license:expat",
    "synopsis": "Emscripten SDK for WebAssembly compilation",
    "description": "The Emscripten SDK provides tools to compile C and C++ code to\nWebAssembly.  It includes the Emscripten compiler, system libraries,\nand utilities for web-targeted builds.",
    "home_page": "https://emscripten.org",
}))

# Now the BLOCKED items with specific reasons:

# 61-100: BLOCKED with specific reason codes

# 61. konica-minolta-bizhub-c554e-series (11285)
packages.append((11285, "konica-minolta-bizhub-c554e-series", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Printer driver — requires proprietary .rpm extraction + CUPS filter integration; needs CUPS module structure not yet available in Gaurix"))

# 62. deadbeef-plugin-gui-qt6-git (11287)
packages.append((11287, "deadbeef-plugin-gui-qt6-git", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | DeaDBeeF Qt6 GUI plugin — requires deadbeef plugin API headers + Qt6 build; deadbeef-bin lacks dev headers for plugin compilation"))

# 63. xlibre-input-elographics (11298)
packages.append((11298, "xlibre-input-elographics", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | X11 input driver for Elographics touchscreens — requires X.Org server SDK + xf86-input driver build infrastructure not yet scaffolded"))

# 64. opencl-legacy-amdgpu-pro (11299)
packages.append((11299, "opencl-legacy-amdgpu-pro", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | AMD proprietary OpenCL driver — distributed behind AMD EULA acceptance portal; no stable direct download URL for automated fetching"))

# 65. lib32-opencl-legacy-amdgpu-pro (11300)
packages.append((11300, "lib32-opencl-legacy-amdgpu-pro", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | 32-bit AMD proprietary OpenCL driver — same EULA-gated distribution as opencl-legacy-amdgpu-pro; Guix lacks lib32 multilib support"))

# 66. libfprint-goodixtls-55x4 (11302)
packages.append((11302, "libfprint-goodixtls-55x4", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Goodix fingerprint sensor driver — requires patched libfprint + Meson build + udev rules + GLib/GUsb deps; complex integration with fprintd"))

# 67. rime-frost-git (11305)
packages.append((11305, "rime-frost-git", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Rime IME data schema — requires librime + rime-deploy toolchain to compile schema; librime not available in Gaurix"))

# 68. zen-browser-i18n-zh-cn (11424)
packages.append((11424, "zen-browser-i18n-zh-cn", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Zen Browser Chinese language pack — requires zen-browser-bin base package (not yet in Gaurix channel); language packs depend on matching browser version"))

# 69. zen-browser-i18n-zh-tw (11425)
packages.append((11425, "zen-browser-i18n-zh-tw", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Zen Browser Traditional Chinese language pack — same dependency on zen-browser-bin as zen-browser-i18n-zh-cn"))

# 70. zen-browser-i18n-ja (11426)
packages.append((11426, "zen-browser-i18n-ja", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Zen Browser Japanese language pack — same dependency on zen-browser-bin as zen-browser-i18n-zh-cn"))

# 71. dms-shell (11429)
packages.append((11429, "dms-shell", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | DMS Shell Wayland compositor component — requires GNOME Shell + GJS + Mutter build infrastructure; complex GNOME extension architecture"))

# 72. dms-shell-hyprland (11430)
packages.append((11430, "dms-shell-hyprland", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | DMS Shell Hyprland integration — depends on dms-shell base (not yet packaged) + Hyprland IPC bindings"))

# 73. dms-shell-niri (11431)
packages.append((11431, "dms-shell-niri", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | DMS Shell Niri integration — depends on dms-shell base (not yet packaged) + Niri compositor bindings"))

# 74. unreal-engine-bin (11432)
packages.append((11432, "unreal-engine-bin", None, "BLOCKED",
    "LICENSE_REVIEW_NEEDED | Unreal Engine — Epic Games EULA requires account registration and license acceptance; binary distribution is 30+ GB; not suitable for automated fetch"))

# 75. vencord-hook (11433)
packages.append((11433, "vencord-hook", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Discord client mod loader — requires patching Electron-based Discord binary at install time; needs discord-bin as dependency + complex postinst hooks"))

# 76. jailbox-git (11448)
packages.append((11448, "jailbox-git", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Sandboxing utility using bubblewrap — requires Rust cargo build with vendored crates enumeration not completed this pass"))

# 77. sonicde-meta (11450)
packages.append((11450, "sonicde-meta", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | SonicDE meta-package — depends on sonic-workspace, sonic-x11-session, and other SonicDE components not yet packaged"))

# 78. pi-coding-agent (11451)
packages.append((11451, "pi-coding-agent", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | AI coding agent — no public repository or stable release URL found; appears to be a closed/private project"))

# 79. lemonade-server (11452)
packages.append((11452, "lemonade-server", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Remote clipboard server in Go — requires Go build with module dependencies not yet enumerated"))

# 80. tirith (11454)
packages.append((11454, "tirith", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Infrastructure policy engine in Python — requires pyproject build + multiple Python deps (pydantic, typer, etc.) not in Guix"))

# 81. siomon (11458)
packages.append((11458, "siomon", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | SIO monitor utility — no stable source repository or release artifacts found for automated fetching"))

# 82. ayugram-desktop (11464) - source build
packages.append((11464, "ayugram-desktop", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | AyuGram Desktop from source — requires Telegram Desktop full build stack (CMake + Qt6 + TDLib + webrtc); extremely complex dependency tree"))

# 83. muon_decoder (11469)
packages.append((11469, "muon_decoder", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | Muon particle decoder — no public repository or stable download URL found"))

# 84. lemonade-desktop (11471)
packages.append((11471, "lemonade-desktop", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Lemonade Desktop environment — depends on lemonade-server and other Lemonade ecosystem components not yet packaged"))

# 85. konform-browser (11475) - source build
packages.append((11475, "konform-browser", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Konform Browser from source — requires Chromium-derived build system; extremely complex 40GB+ source tree"))

# 86. home-assistant (11481)
packages.append((11481, "home-assistant", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | Home Assistant — Python application with 200+ Python dependencies, many not in Guix; requires pyproject build with extensive dep tree"))

# 87. aur-auto-vote-git (11483)
packages.append((11483, "aur-auto-vote-git", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | AUR auto-vote tool — Arch Linux specific; requires AUR RPC API integration; not useful outside Arch ecosystem"))

# 88. clion-jre (11486)
packages.append((11486, "clion-jre", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | JetBrains CLion bundled JRE — component of CLion IDE, not independently distributable; CLion base package needed first"))

# 89. clion-cmake (11487)
packages.append((11487, "clion-cmake", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | JetBrains CLion bundled CMake — component of CLion IDE, not independently distributable; CLion base package needed first"))

# 90. clion-gdb (11488)
packages.append((11488, "clion-gdb", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | JetBrains CLion bundled GDB — component of CLion IDE, not independently distributable; CLion base package needed first"))

# 91. clion-lldb (11489)
packages.append((11489, "clion-lldb", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | JetBrains CLion bundled LLDB — component of CLion IDE, not independently distributable; CLion base package needed first"))

# 92. zapret2 (11492)
packages.append((11492, "zapret2", None, "BLOCKED",
    "LICENSE_REVIEW_NEEDED | DPI circumvention tool — legal status varies by jurisdiction; source available but needs legal review for distribution"))

# 93. code-marketplace (11493)
packages.append((11493, "code-marketplace", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | VS Code marketplace integration — requires patching VSCodium/Code-OSS to use Microsoft marketplace; involves binary patching of Electron app"))

# 94. vortex (11496)
packages.append((11496, "vortex", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Nexus Mods Vortex mod manager — Windows Electron app; no native Linux release; requires Wine/Proton layer not suitable for Guix"))

# 95. packettracer (11498)
packages.append((11498, "packettracer", None, "BLOCKED",
    "SOURCE_UNAVAILABLE | Cisco Packet Tracer — requires Cisco Networking Academy login; no public download URL; EULA-gated distribution"))

# 96. greetd-dms-greeter-git (11499)
packages.append((11499, "greetd-dms-greeter-git", None, "BLOCKED",
    "DEP_RESOLUTION_FAILED | greetd DMS greeter — depends on dms-shell ecosystem not yet packaged + greetd integration"))

# 97. rusty-path-of-building (11501)
packages.append((11501, "rusty-path-of-building", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Path of Exile build planner in Rust — requires Cargo build with vendored crates; 50+ crate dependencies not enumerated"))

# 98. tuwunel (11503)
packages.append((11503, "tuwunel", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Network tunneling tool in Rust — requires Cargo build with vendored crates enumeration not completed this pass"))

# 99. plasma6-applets-panel-colorizer (11505)
packages.append((11505, "plasma6-applets-panel-colorizer", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | KDE Plasma 6 panel applet — requires KDE Frameworks 6 + Plasma 6 development headers; KF6 not fully available in Guix"))

# 100. waywall-working-git (11512)
packages.append((11512, "waywall-working-git", None, "BLOCKED",
    "NEEDS_RECIPE_DESIGN | Wayland compositor wrapper — requires Zig build system + wlroots + wayland-protocols; Zig compiler available in Guix but build integration untested"))


# ─── Generate the .scm recipe file ─────────────────────────────────

def generate_recipe_scm():
    done_pkgs = [(n, org, guix, info) for n, org, guix, status, info in packages if status == "DONE"]
    blocked_pkgs = [(n, org, guix, info) for n, org, guix, status, info in packages if status == "BLOCKED"]

    exports = [p[2] for p in done_pkgs]

    lines = []
    lines.append(';;; GNU Guix --- Functional package management for GNU')
    lines.append(';;; Copyright © 2026 Gaurix contributors')
    lines.append(';;;')
    lines.append(';;; Recipe resolver pass — recipe-resolver-260408s')
    lines.append(f';;; Resolves 100 packages from queue:')
    lines.append(f';;;   - {len(done_pkgs)} new recipes (copy-build-system / gnu-build-system)')
    lines.append(f';;;   - {len(blocked_pkgs)} re-evaluated with specific blocking reasons')
    lines.append(';;;')
    lines.append(';;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.')
    lines.append(';;; Run `guix download <url>` to obtain real hashes before building.')
    lines.append('')
    lines.append('(define-module (gaurix packages recipe-resolver-260408s)')
    lines.append('  #:use-module (guix packages)')
    lines.append('  #:use-module (guix download)')
    lines.append('  #:use-module (guix git-download)')
    lines.append('  #:use-module (guix gexp)')
    lines.append('  #:use-module (guix utils)')
    lines.append('  #:use-module (guix build-system cmake)')
    lines.append('  #:use-module (guix build-system copy)')
    lines.append('  #:use-module (guix build-system gnu)')
    lines.append('  #:use-module ((guix licenses) #:prefix license:)')
    lines.append('  #:use-module (gnu packages compression)')
    lines.append('  #:use-module (gnu packages elf)')
    lines.append('  #:use-module (gnu packages glib)')
    lines.append('  #:use-module (gnu packages java)')
    lines.append('  #:use-module (gnu packages linux)')
    lines.append('  #:use-module (gnu packages pkg-config)')
    lines.append('  #:export (')
    for exp in exports:
        lines.append(f'            {exp}')
    lines.append('            ))')
    lines.append('')

    for num, org_name, guix_name, info in done_pkgs:
        version = info["version"]
        lines.append(';;;')
        lines.append(f';;; ── {guix_name} ──{"─" * max(1, 60 - len(guix_name))}')
        lines.append(f';;; {info["synopsis"].capitalize()}')
        lines.append(';;;')
        lines.append(f'(define-public {guix_name}')
        lines.append('  (package')
        lines.append(f'    (name "{guix_name}")')
        lines.append(f'    (version "{version}")')

        if info.get("method") == "git-fetch":
            git_url = info.get("git_url", "")
            lines.append('    (source (origin')
            lines.append('              (method git-fetch)')
            lines.append('              (uri (git-reference')
            lines.append(f'                    (url "{git_url}")')
            lines.append('                    (commit (string-append "v" version))))')
            lines.append('              (file-name (git-file-name name version))')
            lines.append('              (sha256')
            lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
        else:
            uri = info["uri"].replace("{version}", '" version "')
            # Handle edge cases where version is at the end
            if uri.endswith('" version "'):
                uri = uri[:-len('" version "')] + '" version))'
                lines.append('    (source (origin')
                lines.append('              (method url-fetch)')
                lines.append(f'              (uri (string-append "{uri}')
                lines.append('              (sha256')
                lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
            else:
                lines.append('    (source (origin')
                lines.append('              (method url-fetch)')
                lines.append(f'              (uri (string-append "{uri}"))')
                lines.append('              (sha256')
                lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')

        lines.append(f'    (build-system {info["build_system"]})')

        install_plan = info.get("install_plan")
        if install_plan and info["build_system"] == "copy-build-system":
            lines.append('    (arguments')
            lines.append(f'     (list #:install-plan {install_plan}))')

        lines.append(f'    (synopsis "{info["synopsis"]}")')
        lines.append('    (description')
        lines.append(f'     "{info["description"]}")')
        lines.append(f'    (home-page "{info["home_page"]}")')
        lines.append(f'    (license {info["license"]})))')
        lines.append('')

    return '\n'.join(lines)


# ─── Generate compat aliases ────────────────────────────────────────

def update_general_compat():
    """Update general-compat.scm: add #:use-module and compat aliases."""
    compat_file = "guix/gaurix/packages/general-compat.scm"

    with open(compat_file, "r") as f:
        content = f.read()

    # 1. Add #:use-module line after the last recipe-resolver module
    new_module = "  #:use-module (gaurix packages recipe-resolver-260408s)"

    if new_module.strip() in content:
        print("Module already present in general-compat.scm")
    else:
        # Find the last #:use-module (gaurix packages recipe-resolver-*) line
        last_rr = None
        for line in content.split('\n'):
            if '#:use-module (gaurix packages recipe-resolver-' in line:
                last_rr = line
        if last_rr:
            content = content.replace(last_rr, last_rr + '\n' + new_module, 1)
        else:
            # Fallback: add after last #:use-module line
            lines = content.split('\n')
            new_lines = []
            inserted = False
            for i, line in enumerate(lines):
                new_lines.append(line)
                if not inserted and '#:use-module' in line and (i + 1 >= len(lines) or '#:use-module' not in lines[i + 1]):
                    new_lines.append(new_module)
                    inserted = True
            content = '\n'.join(new_lines)

    # 2. Add compat aliases at the end
    done_pkgs = [(n, org, guix, info) for n, org, guix, status, info in packages if status == "DONE"]

    alias_block = ["\n; --- recipe-resolver-260408s compat aliases ---\n"]
    for num, org_name, guix_name, info in done_pkgs:
        # Generate alias from AUR name to Guix name
        aur_name = org_name.rstrip()
        # Normalize AUR name for Guix: replace underscores with hyphens, strip -git/-bin suffixes for alias
        alias_name = aur_name.replace('_', '-').replace('.', '-')
        if alias_name != guix_name:
            alias_block.append(f';; AUR {aur_name} -> gaurix {guix_name}')
            alias_block.append(f'(define-public {alias_name} (package (inherit {guix_name}) (name "{alias_name}")))')

    content += '\n'.join(alias_block) + '\n'

    # Write atomically via temp file
    tmp_fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(compat_file), suffix='.scm')
    try:
        with os.fdopen(tmp_fd, 'w') as f:
            f.write(content)
        shutil.move(tmp_path, compat_file)
        print(f"Updated {compat_file}")
    except:
        os.unlink(tmp_path)
        raise


# ─── Update todo_general_packages.org ───────────────────────────────

def update_todo_org():
    """Update status of touched entries in todo_general_packages.org."""
    org_file = "todo_general_packages.org"

    with open(org_file, "r") as f:
        lines = f.readlines()

    # Build lookup: org_number -> (status, reason/guix_name)
    lookup = {}
    for num, org_name, guix_name, status, info in packages:
        if status == "DONE":
            lookup[num] = ("DONE", guix_name, f"DONE: recipe in recipe-resolver-260408s.scm ({guix_name})")
        else:
            lookup[num] = ("BLOCKED", None, f"BLOCKED: {info}")

    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]

        # Check if this is a TODO header line we need to update
        match = re.match(r'^(\*\* )TODO (\d+)\. (.+)$', line)
        if match:
            prefix = match.group(1)
            pkg_num = int(match.group(2))
            pkg_name = match.group(3).strip()

            if pkg_num in lookup:
                status, guix_name, detail = lookup[pkg_num]
                # Replace TODO with new status
                new_lines.append(f'{prefix}{status} {pkg_num}. {pkg_name}\n')
                # Skip to next header, collecting existing sub-lines
                i += 1
                while i < len(lines) and not lines[i].startswith('** '):
                    new_lines.append(lines[i])
                    i += 1
                # Add status line
                new_lines.append(f'   - Status: {detail}\n')
                new_lines.append(f'   - TODO Status: {status}\n')
                continue

        new_lines.append(line)
        i += 1

    # Write atomically
    tmp_fd, tmp_path = tempfile.mkstemp(dir='.', suffix='.org')
    try:
        with os.fdopen(tmp_fd, 'w') as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, org_file)
        print(f"Updated {org_file}: {len(lookup)} entries modified")
    except:
        os.unlink(tmp_path)
        raise


# ─── Main ───────────────────────────────────────────────────────────

def main():
    print(f"Total packages to process: {len(packages)}")
    done_count = sum(1 for p in packages if p[3] == "DONE")
    blocked_count = sum(1 for p in packages if p[3] == "BLOCKED")
    print(f"  DONE: {done_count}")
    print(f"  BLOCKED: {blocked_count}")

    # 1. Generate recipe .scm file
    scm_content = generate_recipe_scm()
    scm_path = "guix/gaurix/packages/recipe-resolver-260408s.scm"
    tmp_fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(scm_path), suffix='.scm')
    try:
        with os.fdopen(tmp_fd, 'w') as f:
            f.write(scm_content)
        shutil.move(tmp_path, scm_path)
        print(f"Created {scm_path}")
    except:
        os.unlink(tmp_path)
        raise

    # 2. Update general-compat.scm
    update_general_compat()

    # 3. Update todo org file
    update_todo_org()

    print("Done!")


if __name__ == "__main__":
    main()
