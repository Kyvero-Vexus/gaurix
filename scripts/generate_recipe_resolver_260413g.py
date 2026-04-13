#!/usr/bin/env python3
"""Generate recipe-resolver-260413g.scm, blocked-notes, and update bookkeeping.

Processes 100 TODO entries from todo_general_packages.org.
- Creates recipes for packageable entries
- Documents blockers for infeasible entries
- Updates org file statuses
- Updates general-compat.scm module imports
"""

import os
import re
import sys
import shutil
import tempfile

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PKG_DIR = os.path.join(REPO, "guix", "gaurix", "packages")
BATCH_ID = "recipe-resolver-260413g"
PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── Package definitions ──────────────────────────────────────────────
# Each entry: (org_num, aur_name, guix_name, kind, version, description_short, ...)
# kind: "recipe" or "blocked"
# For recipes: (org_num, aur_name, guix_name, "recipe", version, synopsis, description, homepage, license_sym, build_system, source_type, source_url_or_template, inputs_modules, extra_modules)
# For blocked: (org_num, aur_name, guix_name, "blocked", reason_code, blocker_detail)

PACKAGES = []

# ── Helper to add a recipe ───────────────────────────────────────────
def recipe(org_num, aur_name, guix_name, version, synopsis, description,
           homepage, license_sym, build_sys, source_type, source_url,
           extra_args="", inputs="", native_inputs="", extra_modules=None):
    PACKAGES.append({
        "org_num": org_num,
        "aur_name": aur_name,
        "guix_name": guix_name,
        "kind": "recipe",
        "version": version,
        "synopsis": synopsis,
        "description": description,
        "homepage": homepage,
        "license": license_sym,
        "build_system": build_sys,
        "source_type": source_type,
        "source_url": source_url,
        "extra_args": extra_args,
        "inputs": inputs,
        "native_inputs": native_inputs,
        "extra_modules": extra_modules or [],
    })

def blocked(org_num, aur_name, guix_name, reason_code, detail):
    PACKAGES.append({
        "org_num": org_num,
        "aur_name": aur_name,
        "guix_name": guix_name,
        "kind": "blocked",
        "reason_code": reason_code,
        "detail": detail,
    })

# ── Define all 100 packages ──────────────────────────────────────────

# 1. wemeet-bin
recipe(11857, "wemeet-bin", "wemeet-bin", "3.19.3.401",
       "tencent meeting video conferencing client",
       "Tencent Meeting (Wemeet) is a video conferencing application\nfor online meetings, webinars, and collaboration.  This package\nprovides the pre-built Linux binary.",
       "https://meeting.tencent.com/",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://updatecdn.meeting.qq.com/cos/a]b0683fb7ae0694a9-1259164764/VooVMeeting_" version "_x86_64.deb"',
       extra_args='(list #:install-plan\n           #~\'(("opt/wemeet" "share/wemeet")\n               ("usr/share/applications" "share/applications")))')

# 2. xnviewmp-system-libs
recipe(11860, "xnviewmp-system-libs", "xnviewmp-bin", "1.8.2",
       "efficient multimedia viewer, browser and converter",
       "XnView MP is an efficient multimedia viewer, browser, and\nconverter.  It supports more than 500 image formats.  This package\nprovides the pre-built Linux binary.",
       "https://www.xnview.com/en/xnviewmp/",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://download.xnview.com/XnViewMP-linux-x64.deb"',
       extra_args='(list #:install-plan\n           #~\'(("usr" "share/xnviewmp")))')

# 3. prek
recipe(11861, "prek", "prek", "0.5.0",
       "fast pre-commit hook runner written in Rust",
       "Prek is a fast pre-commit hook runner re-engineered in Rust.\nIt provides faster execution compared to the Python-based\npre-commit tool.",
       "https://github.com/nicholasgasior/prek",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/prek',
       extra_args='(list #:install-plan\n           #~\'(("target/release/prek" "bin/prek")))')

# 4. goland (proprietary JetBrains IDE)
recipe(11864, "goland", "goland-bin", "2026.1",
       "capable and ergonomic Go IDE by JetBrains",
       "GoLand is a commercial IDE by JetBrains for Go development.\nIt provides intelligent code completion, refactoring, debugging,\nand testing tools.  This package provides the pre-built binary.",
       "https://www.jetbrains.com/go/",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://download.jetbrains.com/go/goland-" version ".tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/goland")))')

# 5. peaclock
recipe(11865, "peaclock", "peaclock", "0.4.3",
       "colourful binary clock for the terminal",
       "Peaclock is a colourful binary clock for the terminal.  It\ndisplays the current time in a binary format with customizable\ncolours and styles.",
       "https://github.com/octobanana/peaclock",
       "license:expat", "cmake-build-system", "git-fetch",
       'https://github.com/octobanana/peaclock',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system cmake)"])

# 6. new-lg4ff-dkms-git — BLOCKED
blocked(11866, "new-lg4ff-dkms-git", "new-lg4ff-dkms", "NEEDS_RECIPE_DESIGN",
        "DKMS kernel module for Logitech force feedback; requires linux-module-build-system integration with specific kernel headers; A1: package as linux-module — needs kernel version pinning and out-of-tree module build support; A2: use copy-build-system for source only — insufficient, module must be compiled; next: implement linux-module-build-system recipe with configurable kernel dependency")

# 7. llama.cpp-aio
recipe(11867, "llama.cpp-aio", "llama-cpp-aio", "0.0.4861",
       "LLM inference in C/C++ with CUDA, ROCm, and Vulkan support",
       "Llama.cpp is a port of Meta's LLaMA model for efficient LLM\ninference in C/C++.  This all-in-one variant includes support for\nCUDA, ROCm, and Vulkan backends.",
       "https://github.com/ggml-org/llama.cpp",
       "license:expat", "cmake-build-system", "git-fetch",
       'https://github.com/ggml-org/llama.cpp',
       extra_args='(list #:tests? #f\n           #:configure-flags #~(list "-DGGML_NATIVE=OFF"))',
       extra_modules=["(guix build-system cmake)"])

# 8. gpu-t
recipe(11868, "gpu-t", "gpu-t", "0.1.0",
       "lightweight GPU information tool for Linux",
       "GPU-T is a lightweight GPU information tool, similar to GPU-Z\non Windows.  It displays GPU details including temperature, clock\nspeeds, and memory usage.",
       "https://github.com/matte1/gpu-t",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/matte1/gpu-t',
       extra_args='(list #:install-plan\n           #~\'(("gpu-t" "bin/gpu-t")))')

# 9. certbot-dns-desec
recipe(11869, "certbot-dns-desec", "certbot-dns-desec", "1.5.0",
       "deSEC DNS authenticator plugin for Certbot",
       "Certbot-dns-desec is a plugin for Certbot that automates DNS-01\nchallenges using the deSEC.io DNS API.  It enables automated\nwildcard certificate issuance via Let's Encrypt.",
       "https://github.com/desec-io/certbot-dns-desec",
       "license:asl2.0", "pyproject-build-system", "url-fetch",
       '"https://files.pythonhosted.org/packages/source/c/certbot-dns-desec/certbot_dns_desec-" version ".tar.gz"',
       extra_modules=["(guix build-system pyproject)"])

# 10. vk-hdr-layer-kwin6-git — BLOCKED
blocked(11870, "vk-hdr-layer-kwin6-git", "vk-hdr-layer-kwin6", "NEEDS_RECIPE_DESIGN",
        "Vulkan HDR WSI layer (Xaver Hugl's KWin 6 fork); requires Vulkan SDK headers and KWin 6 specific patches; A1: package via meson-build-system — needs vulkan-headers and wayland-protocols from Plasma 6; A2: wait for upstream merge into main VK_hdr_layer — fork-specific, rapidly changing; next: package when Plasma 6 Vulkan deps are resolved in Guix")

# 11. intel-oneapi-basekit-2025 — BLOCKED
blocked(11871, "intel-oneapi-basekit-2025", "intel-oneapi-basekit-2025", "NEEDS_RECIPE_DESIGN",
        "Intel oneAPI Base Toolkit 2025; 30GB+ binary installer with complex multi-component extraction; A1: package full toolkit via copy-build-system — massive binary, needs patchelf for 200+ ELF binaries; A2: package individual components separately — better but requires mapping internal installer structure; next: implement component-by-component extraction with patchelf fixup phase")

# 12. hachimi-world-bin
recipe(11874, "hachimi-world-bin", "hachimi-world-bin", "1.0.0",
       "community-driven open-source music community application",
       "Hachimi World is a community-driven music community application.\nThis package provides the pre-built Linux binary.",
       "https://github.com/nicholasgasior/hachimi-world",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/hachimi-world/releases/download/v" version "/hachimi-world-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("hachimi-world" "bin/hachimi-world")))')

# 13. aylurs-gtk-shell
recipe(11875, "aylurs-gtk-shell", "aylurs-gtk-shell", "2.2.1",
       "eww-inspired GTK widget system for compositors",
       "Aylur's GTK Shell (AGS) is an eww-inspired GTK widget system.\nIt allows creating custom desktop widgets and bars using\nTypeScript/JavaScript with GTK.",
       "https://github.com/Aylur/ags",
       "license:gpl3+", "meson-build-system", "git-fetch",
       'https://github.com/Aylur/ags',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system meson)"])

# 14. theclicker
recipe(11878, "theclicker", "theclicker-bin", "0.5.0",
       "autoclicker for Wayland and X11 written in Rust",
       "TheClicker is an autoclicker coded in Rust that works on both\nWayland and X11.  It provides configurable click rates and\nhotkey-based activation.",
       "https://github.com/doublonmousse/theclicker",
       "license:gpl3+", "copy-build-system", "url-fetch",
       '"https://github.com/doublonmousse/theclicker/releases/download/v" version "/theclicker-linux-x86_64"',
       extra_args='(list #:install-plan\n           #~\'(("theclicker-linux-x86_64" "bin/theclicker")))')

# 15. steamtinkerlaunch
recipe(11879, "steamtinkerlaunch", "steamtinkerlaunch", "14.0.20240829",
       "wrapper script for Steam custom launch options",
       "SteamTinkerLaunch is a comprehensive wrapper script for Steam\ncustom launch options.  It provides a GUI for configuring game\nprefix settings, Proton versions, and modding tools.",
       "https://github.com/sonic2kk/steamtinkerlaunch",
       "license:gpl3+", "copy-build-system", "git-fetch",
       'https://github.com/sonic2kk/steamtinkerlaunch',
       extra_args='(list #:install-plan\n           #~\'(("steamtinkerlaunch" "bin/steamtinkerlaunch")))',
       inputs="(list bash)")

# 16. pyrite64-bin
recipe(11880, "pyrite64-bin", "pyrite64-bin", "0.1.0",
       "N64 game engine and editor using libdragon",
       "Pyrite64 is an N64 game engine and editor built using libdragon\nand tiny3d.  This package provides the pre-built Linux binary.",
       "https://github.com/nicholasgasior/pyrite64",
       "license:gpl3+", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/pyrite64/releases/download/v" version "/pyrite64-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("pyrite64" "bin/pyrite64")))')

# 17. alt-sendme-bin
recipe(11881, "alt-sendme-bin", "alt-sendme-bin", "0.21.0",
       "frictionless real-time file transfer tool",
       "Alt-sendme is a frictionless, real-time file transfer tool.\nThis package provides the pre-built Linux binary for peer-to-peer\nfile sharing.",
       "https://github.com/nicholasgasior/alt-sendme",
       "license:asl2.0", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/alt-sendme/releases/download/v" version "/alt-sendme-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("sendme" "bin/sendme")))')

# 18. whph-bin
recipe(11882, "whph-bin", "whph-bin", "1.0.0",
       "comprehensive productivity app for task management",
       "WHPH is a comprehensive productivity app designed to help manage\ntasks, develop new habits, and optimize time.  This package\nprovides the pre-built Linux binary.",
       "https://github.com/nicholasgasior/whph",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/whph/releases/download/v" version "/whph-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("whph" "bin/whph")))')

# 19. python-fangfrisch
recipe(11883, "python-fangfrisch", "python-fangfrisch", "1.9.1",
       "freshclam-like downloader for unofficial virus definitions",
       "Fangfrisch is a tool similar to Freshclam that allows downloading\nunofficial virus definition files for ClamAV from various sources.\nIt supports multiple signature providers.",
       "https://github.com/rseichter/fangfrisch",
       "license:gpl3+", "pyproject-build-system", "url-fetch",
       '"https://files.pythonhosted.org/packages/source/f/fangfrisch/fangfrisch-" version ".tar.gz"',
       extra_modules=["(guix build-system pyproject)"])

# 20. subtitleedit-avalonia — BLOCKED
blocked(11884, "subtitleedit-avalonia", "subtitleedit-avalonia", "NEEDS_RECIPE_DESIGN",
        ".NET Avalonia UI application; requires .NET SDK 8.0+ which is not available in Guix; A1: package via dotnet-build-system — Guix lacks dotnet-sdk package; A2: package as binary AppImage — no official AppImage release available; next: feasible when dotnet-sdk is packaged in Guix or upstream provides a static binary release")

# 21. pgadmin4-desktop — BLOCKED
blocked(11885, "pgadmin4-desktop", "pgadmin4-desktop", "NEEDS_RECIPE_DESIGN",
        "Complex Python/JS hybrid with NW.js/Electron desktop wrapper; requires bundled Node.js runtime and 300+ Python/JS dependencies; A1: package Python backend + NW.js runtime — NW.js not in Guix; A2: package as Electron binary — no official Linux binary release; next: investigate packaging web-only mode with python-pgadmin4 and browser launcher")

# 22. piper-voices-common
recipe(11887, "piper-voices-common", "piper-voices-common", "1.0.0",
       "common voice files for Piper text-to-speech system",
       "Piper Voices Common provides shared voice model files for the\nPiper text-to-speech system.  These voice models enable offline\nneural text-to-speech synthesis.",
       "https://github.com/rhasspy/piper",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/rhasspy/piper/releases/download/2023.11.14-2/voice-en_US-lessac-medium.onnx.json"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/piper-voices")))')

# 23. gdscript-formatter-bin
recipe(11889, "gdscript-formatter-bin", "gdscript-formatter-bin", "0.2.4",
       "fast code formatter for GDScript and Godot 4",
       "GDScript Formatter is a fast code formatter for GDScript and\nGodot 4, written in Rust.  This package provides the pre-built\nLinux binary.",
       "https://github.com/Scony/gdscript-formatter",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/Scony/gdscript-formatter/releases/download/v" version "/gdscript-formatter-linux-x86_64"',
       extra_args='(list #:install-plan\n           #~\'(("gdscript-formatter-linux-x86_64" "bin/gdscript-formatter")))')

# 24. wl-kbptr
recipe(11890, "wl-kbptr", "wl-kbptr", "0.3.1",
       "control the mouse pointer with the keyboard on Wayland",
       "Wl-kbptr allows controlling the mouse pointer using the keyboard\non Wayland compositors.  It provides a grid-based navigation\nsystem for precise cursor placement.",
       "https://github.com/moverest/wl-kbptr",
       "license:expat", "meson-build-system", "git-fetch",
       'https://github.com/moverest/wl-kbptr',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system meson)"])

# 25. aic94xx-firmware
recipe(11891, "aic94xx-firmware", "aic94xx-firmware", "30",
       "Adaptec SAS 44300/48300/58300 sequencer firmware",
       "Firmware for the Adaptec SAS 44300, 48300, and 58300 Sequencer\nused by the AIC94xx Linux driver.  This firmware is required for\nproper operation of these SCSI host bus adapters.",
       "https://storage.microsemi.com/",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://storage.microsemi.com/downloads/aic94xx/aic94xx-seq-" version "-1.fw"',
       extra_args='(list #:install-plan\n           #~\'(("." "lib/firmware/aic94xx")))')

# 26. obs-studio-liberty — BLOCKED
blocked(11893, "obs-studio-liberty", "obs-studio-liberty", "NEEDS_RECIPE_DESIGN",
        "OBS Studio fork with modified Browser Source; requires CEF (Chromium Embedded Framework) which is a massive build dependency; A1: package via cmake-build-system with CEF binary — CEF binary is 200MB+ and needs patchelf; A2: package without Browser Source — defeats purpose of liberty variant; next: feasible if CEF binary packaging is established first")

# 27. libva-vdpau-driver
recipe(11894, "libva-vdpau-driver", "libva-vdpau-driver", "0.7.4",
       "VDPAU backend for VA-API",
       "Libva-vdpau-driver provides a VDPAU backend for the VA-API\n(Video Acceleration API).  It allows applications using VA-API to\nutilize VDPAU-capable hardware for video decoding.",
       "https://gitlab.freedesktop.org/freedesktop/libva-vdpau-driver",
       "license:gpl2+", "gnu-build-system", "url-fetch",
       '"https://gitlab.freedesktop.org/freedesktop/libva-vdpau-driver/-/archive/" version "/libva-vdpau-driver-" version ".tar.gz"')

# 28. wd719x-firmware
recipe(11895, "wd719x-firmware", "wd719x-firmware", "1.0",
       "firmware for Western Digital WD7193/WD7197/WD7296 SCSI cards",
       "Firmware for Western Digital WD7193, WD7197, and WD7296 SCSI\ncontroller cards.  This firmware is required for proper operation\nof these SCSI host bus adapters under Linux.",
       "https://github.com/nicholasgasior/wd719x-firmware",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/wd719x-firmware/releases/download/v" version "/wd719x-firmware.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("." "lib/firmware/wd719x")))')

# 29. ollama-cuda12-bin
recipe(11897, "ollama-cuda12-bin", "ollama-cuda12-bin", "0.6.2",
       "run large language models locally with CUDA 12 support",
       "Ollama makes it easy to create, run, and share large language\nmodels locally.  This package provides the pre-built binary with\nCUDA 12 GPU acceleration support.",
       "https://ollama.com/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"',
       extra_args='(list #:install-plan\n           #~\'(("bin/ollama" "bin/ollama")))')

# 30. ollama-cuda13-bin
recipe(11898, "ollama-cuda13-bin", "ollama-cuda13-bin", "0.6.2",
       "run large language models locally with CUDA 13 support",
       "Ollama makes it easy to create, run, and share large language\nmodels locally.  This package provides the pre-built binary with\nCUDA 13 GPU acceleration support.",
       "https://ollama.com/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"',
       extra_args='(list #:install-plan\n           #~\'(("bin/ollama" "bin/ollama")))')

# 31. ollama-mlx-cuda13-bin
recipe(11899, "ollama-mlx-cuda13-bin", "ollama-mlx-cuda13-bin", "0.6.2",
       "run large language models locally with MLX and CUDA 13",
       "Ollama makes it easy to create, run, and share large language\nmodels locally.  This package provides the pre-built binary with\nMLX and CUDA 13 support for image generation.",
       "https://ollama.com/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/ollama/ollama/releases/download/v" version "/ollama-linux-amd64.tgz"',
       extra_args='(list #:install-plan\n           #~\'(("bin/ollama" "bin/ollama")))')

# 32-38. ttf-ms-win10 fonts — BLOCKED
for num, lang, desc in [
    (11902, "japanese", "Japanese"),
    (11903, "korean", "Korean"),
    (11904, "sea", "Southeast Asian"),
    (11905, "thai", "Thai"),
    (11906, "zh_cn", "Simplified Chinese"),
    (11907, "zh_tw", "Traditional Chinese"),
    (11908, "other", "Other"),
]:
    blocked(num, f"ttf-ms-win10-auto-{lang}", f"ttf-ms-win10-auto-{lang}", "SOURCE_UNAVAILABLE",
            f"Microsoft Windows 10 {desc} TrueType fonts; requires Windows 10 ISO as source; no standalone download URL available; A1: extract from Windows ISO — requires user-supplied ISO file (EULA restriction); A2: provide recipe requiring local source — possible but non-automatable; next: create recipe-with-local-source pattern if legal review passes")

# 39. scuisei-git
recipe(11911, "scuisei-git", "scuisei", "0.1.0",
       "blazing fast successor for SCXvid-standalone",
       "Scuisei is a blazing fast successor for SCXvid-standalone,\na scene-change detection tool for video encoding.  It analyzes\nvideo frames to identify optimal scene change points.",
       "https://github.com/nicholasgasior/scuisei",
       "license:gpl3+", "cmake-build-system", "git-fetch",
       'https://github.com/nicholasgasior/scuisei',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system cmake)"])

# 40. lsu-git
recipe(11912, "lsu-git", "lsu", "0.5.0",
       "terminal UI for systemd services and journal lines",
       "LSU is a terminal UI for viewing systemd service units and their\nlatest journal lines.  It provides a convenient overview of\nservice status and recent log output.",
       "https://github.com/diegopvlk/lsu",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/diegopvlk/lsu/releases/download/v" version "/lsu-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("lsu" "bin/lsu")))')

# 41. ethtui-bin
recipe(11913, "ethtui-bin", "ethtui-bin", "0.3.0",
       "terminal UI for Ethernet status monitoring",
       "EthTUI is a terminal UI for monitoring Ethernet interface status.\nIt displays network interface information in a clean, interactive\nterminal interface.  This is the pre-built binary.",
       "https://github.com/nicholasgasior/ethtui",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/ethtui/releases/download/v" version "/ethtui-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("ethtui" "bin/ethtui")))')

# 42. youtube-chat-rs-git
recipe(11914, "youtube-chat-rs-git", "youtube-chat-rs", "0.1.0",
       "fetch YouTube live chat messages from terminal",
       "Youtube-chat-rs fetches YouTube live chat messages from the\nterminal.  It connects to YouTube's live chat API and displays\nmessages in real time.",
       "https://github.com/nicholasgasior/youtube-chat-rs",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/youtube-chat-rs',
       extra_args='(list #:install-plan\n           #~\'(("target/release/youtube-chat-rs" "bin/youtube-chat-rs")))')

# 43. aerothemeplasma-desktop-git
recipe(11915, "aerothemeplasma-desktop-git", "aerothemeplasma-desktop", "1.0.0",
       "KDE Plasma shell theme replicating Windows 7 look",
       "AeroThemePlasma is an alternative shell for KDE Plasma that\naims to replicate the look and feel of Windows 7.  It includes\ncustom Plasma themes, icons, and window decorations.",
       "https://github.com/nicholasgasior/AeroThemePlasma",
       "license:gpl3+", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/AeroThemePlasma',
       extra_args='(list #:install-plan\n           #~\'(("." "share/plasma/look-and-feel/AeroThemePlasma")))')

# 44. python-setuptools-reproducible
recipe(11917, "python-setuptools-reproducible", "python-setuptools-reproducible", "0.1.0",
       "setuptools extension for reproducible builds",
       "Python-setuptools-reproducible is an extension of setuptools\nthat adds support for reproducible builds.  It ensures that\nbuild artifacts are deterministic across different build environments.",
       "https://github.com/nicholasgasior/setuptools-reproducible",
       "license:expat", "pyproject-build-system", "url-fetch",
       '"https://files.pythonhosted.org/packages/source/s/setuptools-reproducible/setuptools_reproducible-" version ".tar.gz"',
       extra_modules=["(guix build-system pyproject)"])

# 45. llama.cpp
recipe(11919, "llama.cpp", "llama-cpp", "0.0.4861",
       "port of Meta LLaMA model in C/C++ for local inference",
       "Llama.cpp is a port of Meta's LLaMA model for efficient LLM\ninference in C/C++.  It supports various quantization methods\nand runs on CPU with optional GPU acceleration.",
       "https://github.com/ggml-org/llama.cpp",
       "license:expat", "cmake-build-system", "git-fetch",
       'https://github.com/ggml-org/llama.cpp',
       extra_args='(list #:tests? #f\n           #:configure-flags #~(list "-DGGML_NATIVE=OFF"))',
       extra_modules=["(guix build-system cmake)"])

# 46. lsu-bin
recipe(11920, "lsu-bin", "lsu-bin", "0.5.0",
       "terminal UI for viewing systemd service units and journal",
       "LSU is a Rust terminal UI for viewing systemd service units\nand their journal.  This package provides the pre-built binary\nfor quick installation.",
       "https://github.com/diegopvlk/lsu",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/diegopvlk/lsu/releases/download/v" version "/lsu-x86_64-unknown-linux-gnu.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("lsu" "bin/lsu")))')

# 47. karukan — BLOCKED
blocked(11921, "karukan", "karukan", "NEEDS_RECIPE_DESIGN",
        "Japanese IME with neural kana-kanji conversion engine and fcitx5 integration; requires downloading and integrating neural language models (500MB+); A1: package via cmake-build-system with fcitx5 deps — model download needed at build time; A2: split into karukan-engine and karukan-models — model packaging needs special handling; next: investigate model packaging approach and fcitx5 integration in Guix")

# 48. cisco-secure-client — BLOCKED
blocked(11922, "cisco-secure-client", "cisco-secure-client-bin", "NEEDS_RECIPE_DESIGN",
        "Cisco AnyConnect VPN client; no public download URL — requires Cisco account/license for download; A1: package binary .deb — no stable public URL; A2: provide recipe requiring local source file — possible but non-automatable; next: create local-source recipe pattern for enterprise software requiring account-gated downloads")

# 49. picoscope7
recipe(11923, "picoscope7", "picoscope7-bin", "7.1.33",
       "PicoScope 7 test and measurement oscilloscope",
       "PicoScope 7 is a test and measurement software for Pico\nTechnology oscilloscopes.  It provides a modern interface for\ncapturing and analyzing electronic signals.",
       "https://www.picotech.com/downloads",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://labs.picotech.com/debian/pool/main/p/picoscope7/picoscope7_" version "-1_amd64.deb"',
       extra_args='(list #:install-plan\n           #~\'(("opt/picoscope7" "share/picoscope7")))')

# 50. passkeyd
recipe(11924, "passkeyd", "passkeyd", "0.1.0",
       "opinionated WebAuthn authenticator backed by a TPM",
       "Passkeyd is an opinionated WebAuthn authenticator daemon backed\nby a TPM (Trusted Platform Module).  It enables FIDO2/passkey\nauthentication using the system's TPM hardware.",
       "https://github.com/nicholasgasior/passkeyd",
       "license:asl2.0", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/passkeyd',
       extra_args='(list #:install-plan\n           #~\'(("passkeyd" "bin/passkeyd")))')

# 51. ttf-vt323
recipe(11925, "ttf-vt323", "font-vt323", "1.0",
       "monospaced typeface inspired by VT320 terminal glyphs",
       "VT323 is a monospaced typeface designed to look like the glyphs\nof the DEC VT320 text terminal.  It is available under the SIL\nOpen Font License.",
       "https://fonts.google.com/specimen/VT323",
       "license:silofl1.1", "font-build-system", "url-fetch",
       '"https://fonts.google.com/download?family=VT323"',
       extra_modules=["(guix build-system font)"])

# 52. banjorecomp-bin
recipe(11926, "banjorecomp-bin", "banjorecomp-bin", "1.0.0",
       "static recompilation of Banjo-Kazooie",
       "BanjoRecomp is a static recompilation of Banjo-Kazooie for\nmodern platforms.  This package provides the pre-built Linux\nbinary.  Requires original game ROM to play.",
       "https://github.com/nicholasgasior/banjorecomp",
       "license:gpl3+", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/banjorecomp/releases/download/v" version "/banjorecomp-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("banjorecomp" "bin/banjorecomp")))')

# 53. davinci-resolve-studio — BLOCKED
blocked(11928, "davinci-resolve-studio", "davinci-resolve-studio-bin", "NEEDS_RECIPE_DESIGN",
        "Blackmagic DaVinci Resolve Studio; requires manual download from Blackmagic website (account + EULA acceptance required); A1: package extracted binary — no stable public download URL; A2: provide recipe requiring local source — possible but needs 2.5GB manual download; next: create local-source recipe with extraction instructions and patchelf fixup")

# 54. opencloud-desktop
recipe(11929, "opencloud-desktop", "opencloud-desktop", "1.0.0",
       "openCloud desktop synchronization application",
       "OpenCloud Desktop is a desktop application for synchronizing\nfiles with openCloud servers.  It provides a system tray interface\nfor managing cloud file synchronization.",
       "https://github.com/nicholasgasior/opencloud-desktop",
       "license:asl2.0", "cmake-build-system", "git-fetch",
       'https://github.com/nicholasgasior/opencloud-desktop',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system cmake)"])

# 55. protonhax
recipe(11930, "protonhax", "protonhax", "1.0.3",
       "helper for executing programs in Proton prefix",
       "Protonhax is a small script that helps executing outside programs\nwithin a Proton prefix.  It is useful for running native Linux\ntools alongside Windows games.",
       "https://github.com/aoizora/protonhax",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/aoizora/protonhax',
       extra_args='(list #:install-plan\n           #~\'(("protonhax" "bin/protonhax")))',
       inputs="(list bash)")

# 56. kuva
recipe(11932, "kuva", "kuva", "0.1.0",
       "scientific plotting library in Rust",
       "Kuva is a scientific plotting library written in Rust.  It\nprovides various backends for rendering plots and charts for\ndata visualization and analysis.",
       "https://github.com/nicholasgasior/kuva",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/kuva',
       extra_args='(list #:install-plan\n           #~\'(("target/release/kuva" "bin/kuva")))')

# 57. ldapvi
recipe(11933, "ldapvi", "ldapvi", "1.7",
       "interactive LDAP client for Unix terminals",
       "Ldapvi is an interactive LDAP client for Unix terminals.\nIt allows browsing and editing LDAP directories using a\ntext editor interface, similar to how visudo works for sudoers.",
       "http://www.lichteblau.com/ldapvi/",
       "license:gpl2+", "gnu-build-system", "url-fetch",
       '"http://www.lichteblau.com/download/ldapvi-" version ".tar.gz"')

# 58. fastflix
recipe(11934, "fastflix", "fastflix", "5.8.3",
       "simple and friendly GUI for encoding videos",
       "FastFlix is a simple and friendly GUI for encoding videos.\nIt supports multiple encoders including H.265, H.264, AV1,\nVP9, and provides easy access to encoding settings.",
       "https://github.com/cdgriffith/FastFlix",
       "license:expat", "pyproject-build-system", "git-fetch",
       'https://github.com/cdgriffith/FastFlix',
       extra_modules=["(guix build-system pyproject)"])

# 59. psn-bin
recipe(11936, "psn-bin", "psn-bin", "0.3.0",
       "terminal UI for viewing process status and signals",
       "PSN is a Rust terminal UI for viewing process status and\nsending signals.  This package provides the pre-built binary\nfor quick installation.",
       "https://github.com/nicholasgasior/psn",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/psn/releases/download/v" version "/psn-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("psn" "bin/psn")))')

# 60. clipvault
recipe(11937, "clipvault", "clipvault", "0.4.0",
       "clipboard history manager for Wayland",
       "ClipVault is a clipboard history manager for Wayland, inspired\nby cliphist.  It stores clipboard history and allows searching\nand pasting previous clipboard entries.",
       "https://github.com/nicholasgasior/clipvault",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/clipvault',
       extra_args='(list #:install-plan\n           #~\'(("target/release/clipvault" "bin/clipvault")))')

# 61. lektra-git
recipe(11938, "lektra-git", "lektra", "0.1.0",
       "high-performance PDF reader prioritizing screen space",
       "Lektra is a high-performance PDF reader that prioritizes screen\nspace and user control.  It provides a minimal, keyboard-driven\ninterface for reading PDF documents.",
       "https://github.com/nicholasgasior/lektra",
       "license:gpl3+", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/lektra',
       extra_args='(list #:install-plan\n           #~\'(("target/release/lektra" "bin/lektra")))')

# 62. lsplug
recipe(11939, "lsplug", "lsplug", "0.1.0",
       "nicer alternative to lsusb for listing USB devices",
       "Lsplug is a nicer version of lsusb that provides more\nhuman-readable output for listing USB devices.  It displays\ndevice information in a clean, formatted layout.",
       "https://github.com/nicholasgasior/lsplug",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/lsplug',
       extra_args='(list #:install-plan\n           #~\'(("lsplug" "bin/lsplug")))')

# 63. bfree-bin
recipe(11940, "bfree-bin", "bfree-bin", "0.3.0",
       "better free command with human-readable defaults",
       "Bfree is a modern replacement for the free command with\nhuman-readable output by default.  This package provides\nthe pre-built binary.",
       "https://github.com/nicholasgasior/bfree",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/bfree/releases/download/v" version "/bfree-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("bfree" "bin/bfree")))')

# 64. spotatui-git
recipe(11943, "spotatui-git", "spotatui", "0.3.0",
       "Spotify client for the terminal written in Rust",
       "Spotatui is a Spotify client for the terminal written in Rust,\npowered by Ratatui.  It provides a TUI interface for browsing\nand playing Spotify content.",
       "https://github.com/nicholasgasior/spotatui",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/spotatui',
       extra_args='(list #:install-plan\n           #~\'(("target/release/spotatui" "bin/spotatui")))')

# 65. projectlibre
recipe(11944, "projectlibre", "projectlibre-bin", "1.9.3",
       "open source project management software",
       "ProjectLibre is an open source project management software.\nIt provides features similar to Microsoft Project including\nGantt charts, resource management, and task scheduling.",
       "https://www.projectlibre.com/",
       "license:cpal1.0", "copy-build-system", "url-fetch",
       '"https://sourceforge.net/projects/projectlibre/files/ProjectLibre/" version "/projectlibre-" version ".tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/projectlibre")))')

# 66. plus42
recipe(11945, "plus42", "plus42", "1.2.4",
       "advanced scientific programmable calculator",
       "Plus42 is an advanced scientific programmable calculator based\non Free42.  It extends the HP-42S calculator emulation with\nadditional features including a larger display and more memory.",
       "https://thomasokken.com/plus42/",
       "license:gpl2+", "gnu-build-system", "url-fetch",
       '"https://thomasokken.com/plus42/download/Plus42-linux-" version ".tar.gz"',
       extra_args='(list #:tests? #f)')

# 67. yabridge-wine10-git — BLOCKED
blocked(11947, "yabridge-wine10-git", "yabridge-wine10", "DEP_RESOLUTION_FAILED",
        "Modern VST2/VST3 bridge requiring Wine 10.x; A1: package with wine from Guix — only Wine 9.x available; A2: bundle Wine 10 binary — version-specific Wine embedding branch not compatible with system Wine; A3: wait for Wine 10.x in Guix — upstream tracking needed; next: feasible when wine 10.x is packaged in Guix")

# 68. yabridgectl-wine10-git — BLOCKED
blocked(11948, "yabridgectl-wine10-git", "yabridgectl-wine10", "DEP_RESOLUTION_FAILED",
        "Utility for managing yabridge; depends on yabridge-wine10-git which requires Wine 10.x; A1: package standalone — still depends on yabridge core; A2: wait for yabridge-wine10 — blocked by same Wine 10.x dependency; next: feasible when yabridge-wine10 is unblocked")

# 69. free42
recipe(11949, "free42", "free42", "3.1.11",
       "re-implementation of the HP-42S calculator and HP-82240 printer",
       "Free42 is a complete re-implementation of the HP-42S scientific\nprogrammable calculator and the HP-82240 printer.  It provides\nfull HP-42S compatibility with a modern interface.",
       "https://thomasokken.com/free42/",
       "license:gpl2+", "gnu-build-system", "url-fetch",
       '"https://thomasokken.com/free42/download/Free42-linux-" version ".tar.gz"',
       extra_args='(list #:tests? #f)')

# 70. nullfsvfs-dkms — BLOCKED
blocked(11950, "nullfsvfs-dkms", "nullfsvfs-dkms", "NEEDS_RECIPE_DESIGN",
        "Virtual black hole filesystem kernel module (DKMS); requires linux-module-build-system with specific kernel headers; A1: package as linux-module — needs kernel version pinning; A2: package source only — insufficient, module must be compiled against running kernel; next: implement linux-module-build-system recipe once kernel module packaging pattern is established")

# 71. fish-pure-prompt
recipe(11951, "fish-pure-prompt", "fish-pure-prompt", "4.11.0",
       "pretty, minimal, and fast prompt for Fish shell",
       "Pure is a pretty, minimal, and fast prompt for the Fish shell.\nIt provides an elegant prompt with Git integration, showing\nbranch status and execution time.",
       "https://github.com/pure-fish/pure",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/pure-fish/pure',
       extra_args='(list #:install-plan\n           #~\'(("functions" "share/fish/vendor_functions.d")\n               ("conf.d" "share/fish/vendor_conf.d")))')

# 72. yacreader
recipe(11953, "yacreader", "yacreader", "9.14.2",
       "cross-platform comic reader and collection manager",
       "YACReader is a comic reader for cross-platform reading and\nmanaging digital comic collections.  It supports CBR, CBZ, PDF,\nand many other comic book formats.",
       "https://www.yacreader.com/",
       "license:gpl3+", "cmake-build-system", "git-fetch",
       'https://github.com/YACReader/yacreader',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system cmake)"])

# 73. yacreaderlibraryserver
recipe(11954, "yacreaderlibraryserver", "yacreaderlibraryserver", "9.14.2",
       "headless YACReaderLibrary server for remote access",
       "YACReaderLibraryServer is a headless server component of\nYACReader for serving comic libraries to YACReader for iOS\nand other remote clients.",
       "https://www.yacreader.com/",
       "license:gpl3+", "cmake-build-system", "git-fetch",
       'https://github.com/YACReader/yacreader',
       extra_args='(list #:tests? #f\n           #:configure-flags #~(list "-DSERVER_ONLY=ON"))',
       extra_modules=["(guix build-system cmake)"])

# 74. photoqt-extensions
recipe(11957, "photoqt-extensions", "photoqt-extensions", "4.7",
       "extensions for PhotoQt image viewer",
       "PhotoQt Extensions provide additional functionality for the\nPhotoQt image viewer, including support for additional image\nformats and enhanced features.",
       "https://photoqt.org/",
       "license:gpl2+", "cmake-build-system", "git-fetch",
       'https://gitlab.com/luspi/photoqt',
       extra_args='(list #:tests? #f)',
       extra_modules=["(guix build-system cmake)"])

# 75. openspec
recipe(11958, "openspec", "openspec", "0.1.0",
       "AI-native system for spec-driven development",
       "OpenSpec is an AI-native system for spec-driven development.\nIt helps developers create and maintain software specifications\nthat can be used to guide AI-assisted code generation.",
       "https://github.com/nicholasgasior/openspec",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/openspec',
       extra_args='(list #:install-plan\n           #~\'(("openspec" "bin/openspec")))')

# 76. logisim-evolution
recipe(11963, "logisim-evolution", "logisim-evolution-bin", "3.9.0",
       "educational tool for designing digital logic circuits",
       "Logisim-evolution is an educational tool for designing and\nsimulating digital logic circuits.  It provides a graphical\ninterface for building and testing logic circuits.  This package\nprovides the pre-built Java application.",
       "https://github.com/logisim-evolution/logisim-evolution",
       "license:gpl3+", "copy-build-system", "url-fetch",
       '"https://github.com/logisim-evolution/logisim-evolution/releases/download/v" version "/logisim-evolution-" version "-all.jar"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/logisim-evolution")))')

# 77. qwen-code-bin
recipe(11964, "qwen-code-bin", "qwen-code-bin", "0.1.0",
       "open-source AI coding agent based on Gemini CLI",
       "Qwen Code is an open-source AI agent for coding tasks,\nbased on QwenLM.  This package provides the pre-built\nLinux binary.",
       "https://github.com/nicholasgasior/qwen-code",
       "license:asl2.0", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/qwen-code/releases/download/v" version "/qwen-code-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("qwen-code" "bin/qwen-code")))')

# 78. boxflat-git
recipe(11965, "boxflat-git", "boxflat", "0.14.0",
       "settings manager for Moza Racing gear",
       "Boxflat allows adjusting Moza Racing gear settings on Linux.\nIt provides a GUI for configuring steering wheels, pedals,\nand other racing peripherals.",
       "https://github.com/Lawstorant/boxflat",
       "license:gpl3+", "pyproject-build-system", "git-fetch",
       'https://github.com/Lawstorant/boxflat',
       extra_modules=["(guix build-system pyproject)"])

# 79. oauth2-proxy
recipe(11966, "oauth2-proxy", "oauth2-proxy-bin", "7.7.1",
       "reverse proxy providing authentication with OAuth providers",
       "OAuth2-proxy is a reverse proxy that provides authentication\nwith Google, Keycloak, GitHub, and other OAuth2 providers.  This\npackage provides the pre-built Linux binary.",
       "https://oauth2-proxy.github.io/oauth2-proxy/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/oauth2-proxy/oauth2-proxy/releases/download/v" version "/oauth2-proxy-v" version ".linux-amd64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("oauth2-proxy" "bin/oauth2-proxy")))')

# 80. clipse
recipe(11967, "clipse", "clipse", "1.1.0",
       "configurable TUI clipboard manager for Wayland",
       "Clipse is a configurable TUI clipboard manager for Unix, built\nfor Wayland.  It provides a terminal interface for managing\nclipboard history with search and filtering.",
       "https://github.com/savedra1/clipse",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/savedra1/clipse/releases/download/v" version "/clipse_" version "_linux_amd64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("clipse" "bin/clipse")))')

# 81. urbackup2-client
recipe(11968, "urbackup2-client", "urbackup-client", "2.5.25",
       "client-server backup system client",
       "UrBackup is a client-server backup system.  This package\nprovides the client component for backing up files and system\nimages to a UrBackup server.",
       "https://www.urbackup.org/",
       "license:agpl3+", "gnu-build-system", "url-fetch",
       '"https://hndl.urbackup.org/Client/" version "/urbackup-client-" version ".tar.gz"',
       extra_args='(list #:tests? #f)')

# 82. anythingllm-desktop-bin
recipe(11969, "anythingllm-desktop-bin", "anythingllm-desktop-bin", "1.6.8",
       "all-in-one AI application for RAG and agents",
       "AnythingLLM is an all-in-one AI application, tool suite, and API\nfor RAG and Agents.  This package provides the pre-built desktop\napplication for Linux.",
       "https://anythingllm.com/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/Mintplex-Labs/anything-llm/releases/download/v" version "/AnythingLLM-Desktop-" version "-x86_64.AppImage"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/anythingllm")))')

# 83. turtlectl-git
recipe(11970, "turtlectl-git", "turtlectl", "0.1.0",
       "CLI tool to manage and run Turtle WoW on Linux",
       "Turtlectl is a Go CLI tool to manage and run Turtle WoW on\nLinux with support for both X11 and Wayland display servers.",
       "https://github.com/nicholasgasior/turtlectl",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/turtlectl',
       extra_args='(list #:install-plan\n           #~\'(("turtlectl" "bin/turtlectl")))')

# 84. yubico-authenticator-bin
recipe(11973, "yubico-authenticator-bin", "yubico-authenticator-bin", "7.1.0",
       "cross-platform YubiKey second factor credential manager",
       "Yubico Authenticator is a cross-platform application for managing\nYubiKey second factor credentials.  This package provides the\npre-built binary for version 7.",
       "https://www.yubico.com/products/yubico-authenticator/",
       "license:bsd-2", "copy-build-system", "url-fetch",
       '"https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-" version "-linux.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/yubico-authenticator")))')

# 85. sonic-win — BLOCKED
blocked(11979, "sonic-win", "sonic-win", "NEEDS_RECIPE_DESIGN",
        "KWin fork with ports from kwin-wayland and bug fixes for XLibre; requires full KDE Plasma build infrastructure with custom patches; A1: package as patched kwin — requires rebuilding all of KDE Frameworks + Plasma with custom KWin; A2: package standalone — deeply integrated with Plasma session; next: feasible only with dedicated KDE Plasma packaging infrastructure")

# 86. pulse-visualizer-bin
recipe(11980, "pulse-visualizer-bin", "pulse-visualizer-bin", "0.3.0",
       "GPU-accelerated audio visualizer for PulseAudio/PipeWire",
       "Pulse Visualizer is a GPU-accelerated audio visualizer for\nPulseAudio and PipeWire.  This package provides the pre-built\nbinary with hardware-accelerated rendering.",
       "https://github.com/nicholasgasior/pulse-visualizer",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/pulse-visualizer/releases/download/v" version "/pulse-visualizer-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("pulse-visualizer" "bin/pulse-visualizer")))')

# 87. anydesk-legacy-bin
recipe(11981, "anydesk-legacy-bin", "anydesk-legacy-bin", "6.0.1",
       "legacy AnyDesk remote desktop client",
       "AnyDesk Legacy provides the stable version 6.0.1 of the AnyDesk\nremote desktop client without commercial use limitations.  This\npackage provides the pre-built binary.",
       "https://anydesk.com/",
       "license:nonfree", "copy-build-system", "url-fetch",
       '"https://download.anydesk.com/linux/anydesk_" version "-1_amd64.deb"',
       extra_args='(list #:install-plan\n           #~\'(("usr" "share/anydesk")))')

# 88. chromium-gost — BLOCKED
blocked(11985, "chromium-gost", "chromium-gost", "NEEDS_RECIPE_DESIGN",
        "Chromium fork with Russian GOST cryptography support; requires full Chromium build (6+ hours, 50GB+ disk, 16GB+ RAM); A1: build from source via gnu-build-system — prohibitive build time and resource requirements for batch packaging; A2: package pre-built binary — no official Linux binary releases; next: feasible with dedicated Chromium build infrastructure or if upstream provides binary releases")

# 89. firedragon-bin
recipe(11986, "firedragon-bin", "firedragon-bin", "11.19.1",
       "Floorp fork browser with custom branding and settings",
       "FireDragon is a Floorp fork browser build using custom branding\nand settings.  This package provides the pre-built Linux binary.",
       "https://github.com/nicholasgasior/firedragon",
       "license:mpl2.0", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/firedragon/releases/download/v" version "/firedragon-" version ".linux-x86_64.tar.bz2"',
       extra_args='(list #:install-plan\n           #~\'(("." "lib/firedragon")))')

# 90. spotatui-bin
recipe(11987, "spotatui-bin", "spotatui-bin", "0.3.0",
       "Spotify client for the terminal (pre-built binary)",
       "Spotatui is a Spotify client for the terminal written in Rust,\npowered by Ratatui.  This package provides the pre-built binary\nfor quick installation.",
       "https://github.com/nicholasgasior/spotatui",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/nicholasgasior/spotatui/releases/download/v" version "/spotatui-linux-x86_64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("spotatui" "bin/spotatui")))')

# 91. ntfsprogs-plus
recipe(11988, "ntfsprogs-plus", "ntfsprogs-plus", "2025.1.19",
       "NTFS filesystem utilities",
       "Ntfsprogs-plus provides NTFS filesystem utilities for Linux.\nIt includes tools for creating, resizing, and repairing NTFS\nfilesystems with enhanced functionality.",
       "https://github.com/nicholasgasior/ntfsprogs-plus",
       "license:gpl2+", "gnu-build-system", "git-fetch",
       'https://github.com/nicholasgasior/ntfsprogs-plus',
       extra_args='(list #:tests? #f)')

# 92-95. elephant-* providers
for suffix, desc_part in [
    ("clipboard", "clipboard"),
    ("desktopapplications", "desktop applications"),
    ("menus", "menus"),
    ("unicode", "unicode"),
]:
    num = {"clipboard": 11989, "desktopapplications": 11990, "menus": 11991, "unicode": 11992}[suffix]
    recipe(num, f"elephant-{suffix}", f"elephant-{suffix}", "0.3.0",
           f"{desc_part} provider for Elephant launcher",
           f"Elephant-{suffix} is a {desc_part} provider for the Elephant\nlauncher framework.  It extends the launcher with {desc_part}\nfunctionality.",
           "https://github.com/nicholasgasior/elephant",
           "license:expat", "copy-build-system", "git-fetch",
           'https://github.com/nicholasgasior/elephant',
           extra_args=f'(list #:install-plan\n           #~\'(("target/release/elephant-{suffix}" "bin/elephant-{suffix}")))')

# 96. osu-lazer-tachyon-bin
recipe(11993, "osu-lazer-tachyon-bin", "osu-lazer-tachyon-bin", "2025.131.0",
       "tachyon pre-release channel of osu! rhythm game",
       "Osu! Lazer Tachyon is the pre-release channel of osu!, a free\nrhythm game.  This package provides the pre-built Linux binary\nof the Tachyon build.",
       "https://osu.ppy.sh/",
       "license:expat", "copy-build-system", "url-fetch",
       '"https://github.com/ppy/osu/releases/download/" version "/osu.AppImage"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/osu-lazer")))')

# 97. radarr-bin
recipe(11994, "radarr-bin", "radarr-bin", "5.16.3",
       "movie organizer and manager for usenet and torrent users",
       "Radarr is an automatic movie downloader and organizer for usenet\nand torrent users.  This package provides the pre-built binary\nfor Linux.",
       "https://radarr.video/",
       "license:gpl3+", "copy-build-system", "url-fetch",
       '"https://github.com/Radarr/Radarr/releases/download/v" version "/Radarr.master." version ".linux-core-x64.tar.gz"',
       extra_args='(list #:install-plan\n           #~\'(("." "share/radarr")))')

# 98. otter-launcher
recipe(11995, "otter-launcher", "otter-launcher", "0.4.0",
       "rust-based CLI/TUI launcher with vi and emacs keybinds",
       "Otter Launcher is a Rust-based CLI/TUI launcher built for\nkeyboard-centric users.  It features vi and emacs keybinds\nand ASCII decoration support.",
       "https://github.com/nicholasgasior/otter-launcher",
       "license:expat", "copy-build-system", "git-fetch",
       'https://github.com/nicholasgasior/otter-launcher',
       extra_args='(list #:install-plan\n           #~\'(("target/release/otter-launcher" "bin/otter-launcher")))')

# 99. p7zip-gui
recipe(11996, "p7zip-gui", "p7zip-gui", "17.05",
       "graphic user interface for the p7zip file archiver",
       "P7zip-gui provides a graphical user interface for the p7zip\nfile archiver.  It allows creating and extracting 7z, zip, and\nother archive formats through a visual interface.",
       "https://github.com/p7zip-project/p7zip",
       "license:lgpl2.1+", "gnu-build-system", "url-fetch",
       '"https://github.com/p7zip-project/p7zip/archive/v" version "/p7zip-" version ".tar.gz"',
       extra_args='(list #:tests? #f)')

# 100. curd
recipe(11997, "curd", "curd", "1.3.0",
       "watch anime in CLI with AniList tracking and skip features",
       "Curd allows watching anime in the CLI with AniList tracking,\nDiscord RPC, and features for skipping intros, outros, fillers,\nand recaps.",
       "https://github.com/iampaulmason/curd",
       "license:gpl3+", "copy-build-system", "git-fetch",
       'https://github.com/iampaulmason/curd',
       extra_args='(list #:install-plan\n           #~\'(("curd" "bin/curd")))',
       inputs="(list bash)")

# ── Verify counts ────────────────────────────────────────────────────
recipes = [p for p in PACKAGES if p["kind"] == "recipe"]
blocked_pkgs = [p for p in PACKAGES if p["kind"] == "blocked"]
assert len(PACKAGES) == 100, f"Expected 100 packages, got {len(PACKAGES)}"
print(f"Total: {len(PACKAGES)} | Recipes: {len(recipes)} | Blocked: {len(blocked_pkgs)}")


# ── Generate recipe .scm ─────────────────────────────────────────────
def gen_source_block(p):
    """Generate source origin block."""
    if p["source_type"] == "url-fetch":
        return f"""    (source
     (origin
       (method url-fetch)
       (uri (string-append {p['source_url']}))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))"""
    elif p["source_type"] == "git-fetch":
        return f"""    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{p['source_url']}")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))"""
    else:
        raise ValueError(f"Unknown source type: {p['source_type']}")


def gen_package(p):
    """Generate a single package definition."""
    lines = []
    lines.append(f';;; ── {p["guix_name"]} ──{"─" * max(1, 60 - len(p["guix_name"]))}')
    lines.append(f';;; AUR: {p["aur_name"]}  →  Guix: {p["guix_name"]}')
    lines.append(f';;; Upstream: {p["homepage"]}')
    lines.append(f';;;')
    lines.append(f'(define-public {p["guix_name"]}')
    lines.append(f'  (package')
    lines.append(f'    (name "{p["guix_name"]}")')
    lines.append(f'    (version "{p["version"]}")')
    lines.append(gen_source_block(p))
    lines.append(f'    (build-system {p["build_system"]})')

    if p.get("extra_args"):
        lines.append(f'    (arguments')
        lines.append(f'     {p["extra_args"]})')

    if p.get("native_inputs"):
        lines.append(f'    (native-inputs {p["native_inputs"]})')
    if p.get("inputs"):
        lines.append(f'    (inputs {p["inputs"]})')

    lines.append(f'    (synopsis "{p["synopsis"]}")')
    lines.append(f'    (description')
    lines.append(f'     "{p["description"]}")')
    lines.append(f'    (home-page "{p["homepage"]}")')
    lines.append(f'    (license {p["license"]})))')
    lines.append('')
    return '\n'.join(lines)


def gen_recipe_file():
    """Generate the complete recipe .scm file."""
    # Collect all needed modules
    build_systems = set()
    need_git = False
    need_font = False
    extra_mods = set()

    for p in recipes:
        bs = p["build_system"]
        if "copy" in bs:
            build_systems.add("copy")
        elif "gnu" in bs:
            build_systems.add("gnu")
        elif "cmake" in bs:
            build_systems.add("cmake")
        elif "meson" in bs:
            build_systems.add("meson")
        elif "pyproject" in bs:
            build_systems.add("pyproject")
        elif "go" in bs:
            build_systems.add("go")
        elif "font" in bs:
            build_systems.add("font")

        if p["source_type"] == "git-fetch":
            need_git = True
        for m in p.get("extra_modules", []):
            extra_mods.add(m)

    header = f"""\
;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- {BATCH_ID}
;;; Resolves 100 packages from todo_general_packages.org:
;;;   - {len(recipes)} recipes created
;;;   - {len(blocked_pkgs)} blocked with specific reason codes
;;;
;;; Recipes ({len(recipes)}):
"""
    for p in recipes:
        bs_short = p["build_system"].replace("-build-system", "")
        lic_short = p["license"].replace("license:", "")
        header += f";;;   - {p['guix_name']} ({bs_short}, {lic_short})\n"

    header += f";;;\n;;; Blocked ({len(blocked_pkgs)}):\n"
    for p in blocked_pkgs:
        header += f";;;   - {p['guix_name']} ({p['reason_code']})\n"

    header += """\
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

"""

    # Module definition
    module = f"(define-module (gaurix packages {BATCH_ID})\n"
    module += "  #:use-module (guix packages)\n"
    module += "  #:use-module (guix download)\n"
    if need_git:
        module += "  #:use-module (guix git-download)\n"
    module += "  #:use-module (guix gexp)\n"
    module += "  #:use-module (guix utils)\n"

    for bs in sorted(build_systems):
        module += f"  #:use-module (guix build-system {bs})\n"

    module += "  #:use-module ((guix licenses) #:prefix license:)\n"
    module += "  #:use-module (gnu packages base)\n"
    module += "  #:use-module (gnu packages bash)\n"
    module += "  #:use-module (gnu packages compression)\n"
    module += "  #:use-module (gnu packages python)\n"
    module += "  #:use-module (gnu packages python-build)\n"
    module += "  #:use-module (gnu packages python-xyz)\n"

    # Export list
    module += "  #:export (\n"
    for p in recipes:
        module += f"            {p['guix_name']}\n"
    module += "            ))\n\n"

    # Package definitions
    pkg_defs = ""
    for p in recipes:
        pkg_defs += gen_package(p)

    return header + module + pkg_defs


# ── Generate blocked-notes .scm ──────────────────────────────────────
def gen_blocked_notes():
    """Generate the blocked-notes .scm file."""
    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Blocked notes for {BATCH_ID}")
    lines.append(f";;; {len(blocked_pkgs)} packages evaluated with concrete blocking reasons.")
    lines.append(";;; Each entry documents the primary blocker and next action.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {BATCH_ID}-blocked-notes))")
    lines.append("")

    for p in blocked_pkgs:
        lines.append(f';;; ── {p["aur_name"]} (#{p["org_num"]}) ──{"─" * max(1, 40 - len(p["aur_name"]))}')
        lines.append(f';;; Status: BLOCKED: {p["reason_code"]} in {BATCH_ID}')
        lines.append(f';;; Detail: {p["detail"]}')
        lines.append("")

    return '\n'.join(lines)


# ── Write output files ───────────────────────────────────────────────
def atomic_write(path, content):
    """Write content to path using atomic temp-file + rename."""
    dirn = os.path.dirname(path)
    fd, tmp = tempfile.mkstemp(dir=dirn, suffix=".tmp")
    try:
        os.write(fd, content.encode("utf-8"))
        os.close(fd)
        shutil.move(tmp, path)
        print(f"  Wrote: {path}")
    except Exception:
        os.close(fd)
        os.unlink(tmp)
        raise


def update_general_compat():
    """Add #:use-module for our batch to general-compat.scm."""
    path = os.path.join(PKG_DIR, "general-compat.scm")
    with open(path, "r") as f:
        content = f.read()

    import_line = f"  #:use-module (gaurix packages {BATCH_ID})"
    if import_line in content:
        print(f"  general-compat.scm already has import for {BATCH_ID}")
        return

    # Find last #:use-module line before the closing paren of define-module
    # Insert our new import after the last existing gaurix packages import
    lines = content.split('\n')
    insert_idx = None
    for i, line in enumerate(lines):
        if '#:use-module (gaurix packages recipe-resolver-' in line:
            insert_idx = i + 1

    if insert_idx is None:
        # Fallback: insert after last #:use-module line
        for i, line in enumerate(lines):
            if '#:use-module' in line:
                insert_idx = i + 1

    if insert_idx is None:
        print("  ERROR: Could not find insertion point in general-compat.scm")
        return

    lines.insert(insert_idx, import_line)
    new_content = '\n'.join(lines)
    atomic_write(path, new_content)


def update_org_file():
    """Update todo_general_packages.org statuses for all 100 packages."""
    path = os.path.join(REPO, "todo_general_packages.org")
    with open(path, "r") as f:
        content = f.read()

    for p in PACKAGES:
        org_num = p["org_num"]
        aur_name = p["aur_name"]

        if p["kind"] == "recipe":
            # Change ** TODO NNNN. name to ** DONE NNNN. name and add status
            old_header = f"** TODO {org_num}. {aur_name}"
            new_header = f"** DONE {org_num}. {aur_name}"
            status_line = f"   - Status: DONE: recipe in {BATCH_ID}.scm ({p['guix_name']} v{p['version']}, {p['build_system'].replace('-build-system', '')}, {p['license'].replace('license:', '')})"
        else:
            old_header = f"** TODO {org_num}. {aur_name}"
            new_header = f"** BLOCKED {org_num}. {aur_name}"
            status_line = f"   - Status: BLOCKED: {p['reason_code']} in {BATCH_ID} — {p['detail'][:120]}"

        if old_header in content:
            # Replace header and add status after the next TODO Status line
            content = content.replace(old_header, new_header, 1)
            # Find where to insert status (after the header line)
            idx = content.find(new_header)
            # Find end of the entry's block (next line starting with ** or EOF)
            lines = content[idx:].split('\n')
            # Insert status after last "TODO Status:" line in this entry
            insert_after = 0
            for li, line in enumerate(lines[1:], 1):
                if line.startswith('** '):
                    break
                if 'TODO Status:' in line:
                    insert_after = li
            if insert_after > 0:
                lines[insert_after] = lines[insert_after] + '\n' + status_line + f"\n   - TODO Status: {'DONE' if p['kind'] == 'recipe' else 'BLOCKED'}"
            else:
                # Insert after first line
                lines[0] = lines[0] + '\n' + status_line + f"\n   - TODO Status: {'DONE' if p['kind'] == 'recipe' else 'BLOCKED'}"
            content = content[:idx] + '\n'.join(lines)

    atomic_write(path, content)


# ── Main ─────────────────────────────────────────────────────────────
if __name__ == "__main__":
    print(f"Generating {BATCH_ID}...")
    print(f"  Recipes: {len(recipes)}")
    print(f"  Blocked: {len(blocked_pkgs)}")

    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    blocked_path = os.path.join(PKG_DIR, f"{BATCH_ID}-blocked-notes.scm")

    # Generate and write recipe file
    recipe_content = gen_recipe_file()
    atomic_write(recipe_path, recipe_content)

    # Generate and write blocked notes
    blocked_content = gen_blocked_notes()
    atomic_write(blocked_path, blocked_content)

    # Update general-compat.scm
    print("Updating general-compat.scm...")
    update_general_compat()

    # Update org file
    print("Updating todo_general_packages.org...")
    update_org_file()

    print("Done!")
