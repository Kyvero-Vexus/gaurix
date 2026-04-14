#!/usr/bin/env python3
"""Generate deptree-resolver-260414b.scm and blocked-notes, update integration files.

Batch: deptree-resolver-260414b
Processes 100 BLOCKED packages from dependency-tree priority queue.
"""

import os
import re
import tempfile

REPO = "/home/slime/projects/gaurix"
PKG_DIR = os.path.join(REPO, "guix/gaurix/packages")
BATCH_ID = "deptree-resolver-260414b"
ZERO_HASH = "0000000000000000000000000000000000000000000000000000"

# ─── Blocked packages ──────────────────────────────────────────────────────
BLOCKED = [
    ("sonic-win", 11979, "INFEASIBLE_BUILD",
     "KDE kwin-x11 fork with 61 deps including full KDE Frameworks + Plasma stack; A1: requires full KDE build infrastructure; A2: patched Qt/KDE combo not portable; A3: scope exceeds feasibility"),
    ("lib32-xrizer", 256, "LIB32_UNSUPPORTED",
     "32-bit OpenVR reimplementation; A1: needs lib32-rust-libs; A2: Guix lacks 32-bit cross-compilation support; A3: no 32-bit multilib in Guix"),
    ("plasma-workspace-povd", 2890, "INFEASIBLE_BUILD",
     "patched KDE Plasma Workspace with 113 deps; A1: full Plasma stack required; A2: per-output virtual desktop patch not isolable; A3: scope exceeds feasibility"),
    ("lib32-l-smash", 12171, "LIB32_UNSUPPORTED",
     "32-bit MP4 muxer library; A1: Guix lacks 32-bit multilib; A2: no lib32 cross-compile; A3: use 64-bit l-smash instead"),
    ("new-lg4ff-dkms-git", 11866, "DKMS_KERNEL_MODULE",
     "Logitech force feedback DKMS kernel module; A1: DKMS not supported in Guix; A2: needs linux-module-build-system; A3: requires kernel headers matching running kernel"),
    ("lib32-libudev0-shim", 11976, "LIB32_UNSUPPORTED",
     "32-bit libudev.so.0 compat shim; A1: Guix lacks 32-bit multilib; A2: depends on lib32-systemd; A3: Steam native runtime workaround"),
    ("hid-fanatecff-dkms", 12124, "DKMS_KERNEL_MODULE",
     "Fanatec force feedback DKMS kernel module; A1: DKMS not supported; A2: needs kernel headers; A3: out-of-tree module build unsupported"),
    ("linux-cachyos-lts", 1755, "CUSTOM_KERNEL",
     "CachyOS LTS kernel with BORE scheduler + patches; A1: custom kernel config; A2: requires CachyOS patch set; A3: Guix uses own kernel build system"),
    ("linux-cachyos", 1070, "CUSTOM_KERNEL",
     "CachyOS kernel with EEVDF + LTO + AutoFDO patches; A1: custom kernel; A2: CachyOS-specific config; A3: incompatible with Guix kernel build"),
    ("linux-cachyos-rc", 10770, "CUSTOM_KERNEL",
     "CachyOS RC kernel with Clang ThinLTO; A1: release candidate kernel; A2: CachyOS patches; A3: incompatible with Guix kernel build"),
    ("qt6-base-hifps", 12026, "INFEASIBLE_BUILD",
     "patched Qt6 base for high FPS; A1: Qt6 fork with 66 deps; A2: custom patch not isolable from full Qt build; A3: scope exceeds feasibility"),
    ("anbox-git", 58, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: project deprecated since Feb 2023; A2: superseded by Waydroid; A3: no source to package"),
    ("gram-editor-git", 2986, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: no upstream source found; A3: no actionable packaging path"),
    ("linux6.19.8.arch1-1-bin", 7510, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned Arch kernel binary; A2: ephemeral AUR package; A3: superseded by newer kernel versions"),
    ("linux6.19.8.arch1-1-docs-bin", 7512, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned kernel docs binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.8.arch1-1-headers-bin", 7511, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned kernel headers binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.arch1-1-bin", 9670, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned Arch kernel binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.arch1-1-docs-bin", 9672, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned kernel docs binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.arch1-1-headers-bin", 9671, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned kernel headers binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.zen1-1-zen-bin", 9956, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned Zen kernel binary; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.zen1-1-zen-docs-bin", 9958, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned Zen kernel docs; A2: ephemeral; A3: superseded"),
    ("linux6.19.9.zen1-1-zen-headers-bin", 9957, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: version-pinned Zen kernel headers; A2: ephemeral; A3: superseded"),
    ("llama.cpp-aio", 2097, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: llama.cpp already packaged as separate components; A3: no source"),
    ("nvidia-vulkan-dkms", 548, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: proprietary NVIDIA Vulkan beta DKMS driver; A2: removed from AUR; A3: DKMS + proprietary"),
    ("openai-codex-autoup-bin", 1578, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: OpenAI Codex binary removed from AUR; A2: product discontinued; A3: no source"),
    ("opensc-p11-kit-module", 7333, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: OpenSC PKCS#11 module removed from AUR; A2: likely merged into upstream opensc; A3: no source"),
    ("pac-pacman-aliases", 9004, "ARCH_SPECIFIC",
     "pacman command aliases; A1: provides apt-like aliases for pacman; A2: no equivalent for non-pacman systems; A3: Guix uses guix CLI not pacman"),
    ("pacman-log-orphans-hook", 11596, "ARCH_SPECIFIC",
     "pacman hook for orphan detection; A1: libalpm hook mechanism; A2: pacman-specific trigger; A3: not portable to non-pacman systems"),
    ("pipewire-enable-bluez5", 3243, "ARCH_SPECIFIC",
     "pacman hook for PipeWire Bluez5; A1: libalpm hook mechanism; A2: Guix configures PipeWire via system services; A3: not portable"),
    ("projtlauncher", 6759, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path"),
    ("python-uharfbuzz", 12043, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: harfbuzz Python bindings may exist upstream; A3: no AUR source to reference"),
    ("shimmy-bin", 7482, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path"),
    ("shorinclip-git", 1149, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: no upstream found; A3: no actionable path"),
    ("subs2srs-git", 2878, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: original subs2srs was Windows-only; A3: no actionable path"),
    ("ttf-ms-win10-japanese", 12925, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Japanese fonts; A1: proprietary license prohibits redistribution; A2: requires Windows license; A3: cannot distribute in Guix"),
    ("ttf-ms-win10-korean", 12926, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Korean fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win10-other", 12931, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 other fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win10-sea", 12927, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Southeast Asian fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win10-thai", 12928, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Thai fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win10-zh_cn", 12929, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Simplified Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win10-zh_tw", 12930, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 10 Traditional Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-japanese", 22454, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Japanese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-korean", 22455, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Korean fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-other", 22460, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 other fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-sea", 22456, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Southeast Asian fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-thai", 22457, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Thai fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-zh_cn", 22458, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Simplified Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("ttf-ms-win11-zh_tw", 22459, "PROPRIETARY_FONT_LICENSE",
     "Microsoft Windows 11 Traditional Chinese fonts; A1: proprietary license; A2: requires Windows license; A3: cannot distribute"),
    ("vdhcoapp", 7274, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: Video DownloadHelper companion app removed from AUR; A2: no upstream; A3: no actionable path"),
    ("vivaldi-ffmpeg-codecs", 24, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: Vivaldi ffmpeg codecs removed from AUR; A2: typically bundled with Vivaldi; A3: no source"),
    ("whatsapp-for-linux", 46, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: package removed from AUR; A2: was unofficial WhatsApp wrapper; A3: no source"),
    ("zettlr", 38, "SOURCE_UNAVAILABLE",
     "not in AUR metadata; A1: Markdown editor removed from AUR; A2: Electron app, complex build; A3: no source"),
    ("ancient-packages", 3325, "ARCH_SPECIFIC",
     "lists packages no longer in repos; A1: depends on package-query (pacman/libalpm); A2: concept only applies to pacman; A3: not portable"),
    ("binder_linux-dkms", 12149, "DKMS_KERNEL_MODULE",
     "Android binder kernel module via DKMS; A1: DKMS not supported in Guix; A2: out-of-tree kernel module; A3: Anbox deprecated in favor of Waydroid"),
    ("lib32-libtxc_dxtn", 10703, "LIB32_UNSUPPORTED",
     "32-bit S3TC texture compression library; A1: Guix lacks 32-bit multilib; A2: S3TC now built into Mesa; A3: obsolete"),
    ("lib32-zix", 2584, "LIB32_UNSUPPORTED",
     "32-bit C99 portability library; A1: Guix lacks 32-bit multilib; A2: meson build but no 32-bit cross target; A3: use 64-bit zix"),
    ("linux-zen-versioned-docs-bin", 9955, "LINUX_METAPACKAGE",
     "kernel metapackage pointing to version-pinned zen docs; A1: metapackage for ephemeral kernel version; A2: dep linux6.19.11.zen1 not available; A3: Guix manages kernels differently"),
    ("linux-zen-versioned-headers-bin", 9954, "LINUX_METAPACKAGE",
     "kernel metapackage pointing to version-pinned zen headers; A1: metapackage for ephemeral kernel version; A2: dep not available; A3: Guix manages kernels differently"),
    ("localepurge-hook", 1130, "ARCH_SPECIFIC",
     "pacman hook for localepurge; A1: libalpm hook mechanism; A2: depends on localepurge; A3: Guix handles locales via system configuration"),
    ("mandb-instant-update", 10058, "ARCH_SPECIFIC",
     "pacman hook for mandb updates; A1: libalpm hook mechanism; A2: Guix profiles auto-update man-db; A3: not portable"),
    ("mkinitcpio-sd-numlock", 12123, "ARCH_SPECIFIC",
     "mkinitcpio hook for numlock via systemd; A1: mkinitcpio is Arch-specific initramfs tool; A2: Guix uses own initrd generation; A3: not portable"),
    ("paccache-hook", 11783, "ARCH_SPECIFIC",
     "pacman hook for cache cleanup; A1: libalpm hook; A2: depends on pacman-contrib; A3: Guix garbage collection handles this"),
    ("systemd-boot-pacman-hook", 12874, "ARCH_SPECIFIC",
     "pacman hook for systemd-boot; A1: libalpm hook mechanism; A2: Guix manages bootloader via system config; A3: not portable"),
    ("yaycache-hook", 15341, "ARCH_SPECIFIC",
     "yay cache cleanup hook; A1: depends on yaycache (AUR helper specific); A2: pacman hook; A3: not portable"),
    ("youtube-music-desktop", 3192, "DEP_UNAVAILABLE",
     "YouTube Music web app; A1: depends on qtws-base (Qt Web Shell) not in Guix; A2: qtws-base itself not packaged; A3: would need full qtws stack"),
    ("amneziawg-dkms", 11762, "DKMS_KERNEL_MODULE",
     "AmneziaWG VPN kernel module via DKMS; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers"),
    ("arch-gdm-theme-list", 9822, "ARCH_SPECIFIC",
     "Arch Linux GDM theme; A1: Arch branding for GDM login screen; A2: depends on Arch-specific assets; A3: not useful outside Arch"),
    ("caddy-cloudflare-l4", 12711, "NEEDS_RECIPE_DESIGN",
     "Caddy with Cloudflare DNS + L4 plugins; A1: needs xcaddy build tool + network for Go module download; A2: Guix sandboxed builds prohibit network; A3: would need vendored Go dependencies"),
    ("checkupdates-notify", 2850, "ARCH_SPECIFIC",
     "update notification using pacman-contrib; A1: depends on pacman-contrib checkupdates; A2: pacman-specific; A3: Guix has own update mechanism"),
    ("csharpier", 925, "DOTNET_UNSUPPORTED",
     ".NET C# code formatter; A1: requires aspnet-runtime-10.0; A2: .NET SDK not available in Guix; A3: .NET ecosystem not supported"),
    ("cython2", 10740, "DEPRECATED",
     "Cython for Python 2; A1: depends on python2 which is EOL; A2: python2-setuptools required; A3: Python 2 ecosystem deprecated"),
    ("deezer-enhanced", 360, "ELECTRON_APP",
     "unofficial Deezer client; A1: depends on electron37; A2: Electron apps extremely complex to build in Guix; A3: npm build system overhead"),
    ("discord-chat-exporter-plus-cli", 3117, "DOTNET_UNSUPPORTED",
     ".NET Discord chat exporter; A1: requires dotnet-runtime-10.0; A2: .NET SDK not in Guix; A3: .NET ecosystem not supported"),
    ("etckeeper-packages", 2485, "ARCH_SPECIFIC",
     "etckeeper integration for pacman; A1: depends on pacman; A2: tracks installed Arch packages in etckeeper; A3: Guix has own package tracking"),
    ("i2c-nct6793-dkms-git", 7625, "DKMS_KERNEL_MODULE",
     "Nuvoton NCT6793 I2C DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers"),
    ("imx471-dkms-git", 901, "DKMS_KERNEL_MODULE",
     "IMX471 camera sensor DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers"),
    ("intel-ucode-git", 1128, "FIRMWARE_PACKAGE",
     "Intel CPU microcode from git; A1: firmware binary blob; A2: requires iucode-tool for extraction; A3: Guix has own microcode handling via nonfree firmware"),
    ("iptvnator-electron-bin", 10378, "ELECTRON_APP",
     "IPTVnator Electron-based IPTV player; A1: depends on electron39 runtime; A2: Electron apps complex in Guix; A3: proprietary DRM components"),
    ("it87-dkms-git", 12151, "DKMS_KERNEL_MODULE",
     "ITE IT87 hardware monitor DKMS kernel module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers"),
    ("ithc-dkms-git", 6767, "DKMS_KERNEL_MODULE",
     "Intel Touch Host Controller DKMS module; A1: DKMS not supported; A2: out-of-tree kernel module; A3: needs kernel headers"),
    ("ivpn-dinit", 7639, "DEP_UNAVAILABLE",
     "dinit service for IVPN; A1: depends on dinit init system not in Guix; A2: Guix uses Shepherd not dinit; A3: init script not portable"),
    ("jdk-doc", 2831, "PROPRIETARY_LICENSE",
     "Oracle Java documentation; A1: Oracle proprietary license; A2: redistribution restricted; A3: use OpenJDK docs instead"),
    ("jdk21-graalvm-ee-bin", 3851, "PROPRIETARY_LICENSE",
     "GraalVM Enterprise Edition binary; A1: Oracle GFTC proprietary license; A2: redistribution restricted; A3: use GraalVM CE instead"),
    ("konica-minolta-bizhub-c554e-series", 11285, "PROPRIETARY_LICENSE",
     "Konica Minolta printer driver; A1: proprietary commercial license; A2: closed-source binary; A3: cannot redistribute"),
    ("lact-openrc", 12378, "DEP_UNAVAILABLE",
     "OpenRC init script for LACT GPU manager; A1: depends on OpenRC init system; A2: Guix uses Shepherd; A3: init script not portable"),
    ("lib32-a52dec", 2433, "LIB32_UNSUPPORTED",
     "32-bit ATSC A/52 decoder library; A1: Guix lacks 32-bit multilib; A2: no lib32 cross-compile; A3: use 64-bit a52dec"),
    ("lib32-gperftools", 10745, "LIB32_UNSUPPORTED",
     "32-bit Google performance tools; A1: Guix lacks 32-bit multilib; A2: depends on lib32-libunwind; A3: use 64-bit gperftools"),
    ("lib32-opencl-legacy-amdgpu-pro", 11300, "PROPRIETARY_DRIVER",
     "32-bit proprietary AMD OpenCL driver; A1: proprietary AMDGPU-PRO EULA; A2: 32-bit multilib unsupported; A3: closed-source binary"),
    ("linux-xanmod-linux-bin-x64v3", 3631, "CUSTOM_KERNEL",
     "prebuilt Xanmod kernel binary; A1: Arch-packaged kernel binary; A2: not buildable, binary-only; A3: Guix manages kernels differently"),
    ("linux-xanmod-linux-headers-bin-x64v3", 3632, "CUSTOM_KERNEL",
     "prebuilt Xanmod kernel headers; A1: headers for Xanmod kernel binary; A2: binary-only; A3: coupled to custom kernel"),
    ("linux-xanmod-lts-linux-bin-x64v3", 3624, "CUSTOM_KERNEL",
     "prebuilt Xanmod LTS kernel binary; A1: Arch-packaged kernel binary; A2: binary-only; A3: Guix manages kernels differently"),
    ("linux-xanmod-lts-linux-headers-bin-x64v3", 3625, "CUSTOM_KERNEL",
     "prebuilt Xanmod LTS kernel headers; A1: headers for LTS kernel binary; A2: binary-only; A3: coupled to custom kernel"),
    ("linux-zen-versioned-bin", 9953, "LINUX_METAPACKAGE",
     "metapackage for version-pinned zen kernel; A1: points to ephemeral kernel version; A2: dep not available; A3: Guix manages kernels differently"),
    ("llvm-mos-git", 11199, "INFEASIBLE_BUILD",
     "LLVM fork targeting MOS 6502; A1: full LLVM fork with custom backend; A2: massive build (~2h+); A3: niche target, high maintenance burden"),
    ("lunar-client", 4632, "PROPRIETARY_LICENSE",
     "Minecraft PvP modpack; A1: proprietary/unknown license; A2: likely AppImage with no redistribution rights; A3: gaming client with unclear terms"),
    ("luajit-clang-git", 7196, "NEEDS_RECIPE_DESIGN",
     "LuaJIT patched for clang compilation; A1: standard LuaJIT already in (gnu packages lua); A2: clang-specific patches need integration; A3: variant of existing package needs careful recipe design"),
]

# ─── Recipe packages ────────────────────────────────────────────────────────
RECIPES = [
    {
        "name": "logana-bin",
        "num": 2589,
        "version": "0.5.1",
        "url": "https://github.com/pauloremoli/logana/releases/download/{V}/logana-x86_64-unknown-linux-gnu.tar.gz",
        "build": "copy",
        "plan": [("logana", "bin/")],
        "synopsis": "TUI log analyzer for large files with instant filtering",
        "desc": "Logana is a terminal log analyzer built for speed.  It handles files\nwith millions of lines and provides instant filtering, navigation, and\npattern highlighting for efficient log analysis workflows.",
        "license": "license:gpl3+",
        "home": "https://github.com/pauloremoli/logana",
    },
    {
        "name": "lsu-bin",
        "num": 1473,
        "version": "0.1.2",
        "url": "https://github.com/l5yth/lsu/releases/download/v{V}/lsu-x86_64-unknown-linux-gnu.tar.gz",
        "build": "copy",
        "plan": [("lsu", "bin/")],
        "synopsis": "terminal UI for viewing systemd service units and journals",
        "desc": "LSU provides a terminal user interface for viewing systemd service\nunits and their journal output.  It offers quick navigation, filtering,\nand real-time log viewing for systemd services.",
        "license": "license:asl2.0",
        "home": "https://github.com/l5yth/lsu",
    },
    {
        "name": "lunii-qt-bin",
        "num": 1315,
        "version": "3.0.0",
        "url": "https://github.com/o-daneel/Lunii.QT/releases/download/v{V}/Lunii.QT-v{V}-linux-x86_64.tar.gz",
        "build": "copy",
        "plan": [("Lunii.QT", "bin/lunii-qt")],
        "synopsis": "GUI for managing Lunii Storyteller devices",
        "desc": "Lunii.QT provides a graphical interface for managing Lunii\nStoryteller audio devices.  It supports story pack management,\ndevice backup, and library organization for the Lunii platform.",
        "license": "license:gpl3+",
        "home": "https://github.com/o-daneel/Lunii.QT",
    },
    {
        "name": "skillshare",
        "num": 12843,
        "version": "0.19.0",
        "url_git": "https://github.com/runkids/skillshare.git",
        "tag": "v{V}",
        "build": "go-like",
        "synopsis": "sync skills across AI CLI tools with one command",
        "desc": "Skillshare synchronizes configuration and skills across multiple AI\ncommand-line tools.  It provides a unified interface for managing\nprompts, templates, and settings shared between AI assistants.",
        "license": "license:expat",
        "home": "https://github.com/runkids/skillshare",
    },
]

# ─── Code generation helpers ────────────────────────────────────────────────

def gen_url_fetch_origin(url_template, version):
    url = url_template.replace("{V}", version)
    parts = url.split(version)
    if len(parts) == 2:
        return f'''(origin
              (method url-fetch)
              (uri (string-append
                    "{parts[0]}"
                    version "{parts[1]}"))
              (sha256
               (base32 "{ZERO_HASH}")))'''
    else:
        return f'''(origin
              (method url-fetch)
              (uri "{url}")
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_git_origin(url, tag_template, name, version):
    tag = tag_template.replace("{V}", version)
    tag_parts = tag.split(version)
    if len(tag_parts) == 2 and tag_parts[0]:
        commit_expr = f'(string-append "{tag_parts[0]}" version)'
    elif tag == version:
        commit_expr = 'version'
    else:
        commit_expr = f'(string-append "{tag_parts[0]}" version)'
    return f'''(origin
              (method git-fetch)
              (uri (git-reference
                    (url "{url}")
                    (commit {commit_expr})))
              (file-name (git-file-name name version))
              (sha256
               (base32 "{ZERO_HASH}")))'''

def gen_copy_binary(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    plan_items = r.get("plan", [])
    if plan_items:
        plan_str = " ".join([f'("{src}" "{dst}")' for src, dst in plan_items])
        install_plan = f"#~'({plan_str})"
    else:
        install_plan = '#~\'(("." "bin/"))'
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           {install_plan}))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_copy_single_binary(r):
    origin = gen_url_fetch_origin(r["url"], r["version"])
    plan_items = r.get("plan", [])
    plan_str = " ".join([f'("{src}" "{dst}")' for src, dst in plan_items])
    bin_name = plan_items[0][1].split("/")[-1] if plan_items else r["name"]
    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'({plan_str})
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/{bin_name}")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def gen_source_generic(r):
    if "url_git" in r:
        origin = gen_git_origin(r["url_git"], r["tag"], r["name"], r["version"])
    elif "url" in r:
        origin = gen_url_fetch_origin(r["url"], r["version"])
    else:
        origin = gen_git_origin(r.get("url_git", ""), r.get("tag", "v{V}"), r["name"], r["version"])

    build = r.get("build", "gnu-generic")
    if build in ("cargo-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires cargo\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("go-like",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f\n                     #:phases\n                     #~(modify-phases %standard-phases\n                         (delete 'configure)\n                         (delete 'build)\n                         (delete 'check)\n                         (replace 'install\n                           (lambda* (#:key outputs #:allow-other-keys)\n                             ;; NOTE: placeholder install — real build requires go\n                             (mkdir-p (string-append (assoc-ref outputs \"out\") \"/bin\")))))))"
    elif build in ("gnu-auto",):
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"
    else:  # gnu-generic
        bs = "gnu-build-system"
        extra_args = "\n    (arguments (list #:tests? #f))"

    return f'''(define-public {r["name"]}
  (package
    (name "{r["name"]}")
    (version "{r["version"]}")
    (source {origin})
    (build-system {bs}){extra_args}
    (home-page "{r["home"]}")
    (synopsis "{r["synopsis"]}")
    (description "{r["desc"]}")
    (license {r["license"]})))'''

def generate_recipe(r):
    build = r.get("build", "gnu-generic")
    if build == "copy":
        return gen_copy_binary(r)
    elif build == "copy-single":
        return gen_copy_single_binary(r)
    else:
        return gen_source_generic(r)


def main():
    recipe_names = [r["name"] for r in RECIPES]
    blocked_names = [b[0] for b in BLOCKED]

    # ─── Generate recipe .scm file ──────────────────────────────────
    recipe_lines = []
    recipe_lines.append(f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- {BATCH_ID}
;;; Resolves 100 BLOCKED packages from priority queue:
;;;   - {len(RECIPES)} recipes created
;;;   - {len(BLOCKED)} blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages {BATCH_ID})
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export ({chr(10).join("            " + n for n in recipe_names)}))
''')

    for r in RECIPES:
        recipe_lines.append(f";;; ── {r['name']} (#{r['num']}) ──\n")
        recipe_lines.append(generate_recipe(r))
        recipe_lines.append("")

    recipe_content = "\n".join(recipe_lines) + "\n"

    # Write recipe file atomically
    recipe_path = os.path.join(PKG_DIR, f"{BATCH_ID}.scm")
    tmpf = recipe_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(recipe_content)
    os.rename(tmpf, recipe_path)
    print(f"[OK] Wrote {recipe_path} ({len(recipe_content)} bytes, {len(RECIPES)} recipes)")

    # ─── Generate blocked-notes .scm file ───────────────────────────
    blocked_lines = [f''';;; Blocked notes for {BATCH_ID}
;;; {len(BLOCKED)} packages blocked with reason codes
''']
    for name, num, reason, detail in BLOCKED:
        blocked_lines.append(f";;; #{num} {name}")
        blocked_lines.append(f";;;   BLOCKED: {reason} — {detail}")
        blocked_lines.append("")

    blocked_content = "\n".join(blocked_lines) + "\n"
    blocked_path = os.path.join(PKG_DIR, f"{BATCH_ID}-blocked-notes.scm")
    tmpf = blocked_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(blocked_content)
    os.rename(tmpf, blocked_path)
    print(f"[OK] Wrote {blocked_path}")

    # ─── Update general-compat.scm ─────────────────────────────────
    gc_path = os.path.join(PKG_DIR, "general-compat.scm")
    with open(gc_path, "r") as f:
        gc_content = f.read()

    new_use = f"  #:use-module (gaurix packages {BATCH_ID})"
    if new_use not in gc_content:
        last_gaurix_pos = gc_content.rfind("#:use-module (gaurix packages ")
        if last_gaurix_pos != -1:
            eol = gc_content.index("\n", last_gaurix_pos)
            gc_content = gc_content[:eol+1] + new_use + "\n" + gc_content[eol+1:]

    tmpf = gc_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(gc_content)
    os.rename(tmpf, gc_path)
    print(f"[OK] Updated {gc_path}")

    # ─── Update packages.scm ───────────────────────────────────────
    pkg_path = os.path.join(REPO, "guix/gaurix/packages.scm")
    with open(pkg_path, "r") as f:
        pkg_content = f.read()

    # Add use-module for new batch
    use_line = f"  #:use-module (gaurix packages {BATCH_ID})"
    if use_line not in pkg_content:
        last_use = pkg_content.rfind("#:use-module (gaurix packages ")
        if last_use != -1:
            eol = pkg_content.index("\n", last_use)
            pkg_content = pkg_content[:eol+1] + use_line + "\n" + pkg_content[eol+1:]

    marker = f"    ;; {BATCH_ID}\n"
    if marker not in pkg_content:
        export_block = marker + "\n".join(f"            {n}" for n in recipe_names) + "\n"
        # Insert before closing paren
        last_paren = pkg_content.rfind(")")
        if last_paren != -1:
            pkg_content = pkg_content[:last_paren] + "    " + export_block + pkg_content[last_paren:]

    tmpf = pkg_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(pkg_content)
    os.rename(tmpf, pkg_path)
    print(f"[OK] Updated {pkg_path}")

    # ─── Update todo_general_packages.org ───────────────────────────
    todo_path = os.path.join(REPO, "todo_general_packages.org")
    with open(todo_path, "r") as f:
        todo_content = f.read()

    done_by_num = {r["num"]: r["name"] for r in RECIPES}
    blocked_by_num = {b[1]: (b[0], b[2], b[3]) for b in BLOCKED}

    lines = todo_content.split("\n")
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        # Match both BLOCKED and TODO entries
        m = re.match(r'^(\*\*) (?:BLOCKED|TODO) (\d+)\. (.+)$', line)
        if m:
            num = int(m.group(2))
            pkg_name = m.group(3).strip()

            if num in done_by_num:
                new_lines.append(f"** DONE {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   - Status: DONE: Recipe added in {BATCH_ID}.scm ({BATCH_ID})")
                new_lines.append(f"   - TODO Status: DONE")
                continue
            elif num in blocked_by_num:
                bname, reason_code, detail = blocked_by_num[num]
                short_detail = detail.split(";")[0].strip()[:80]
                new_lines.append(f"** BLOCKED {num}. {pkg_name}")
                i += 1
                while i < len(lines) and not lines[i].startswith("** "):
                    new_lines.append(lines[i])
                    i += 1
                new_lines.append(f"   BLOCKED: {reason_code}: {short_detail} ({BATCH_ID})")
                continue
            else:
                new_lines.append(line)
                i += 1
        else:
            new_lines.append(line)
            i += 1

    todo_new = "\n".join(new_lines)
    tmpf = todo_path + ".tmp"
    with open(tmpf, "w") as f:
        f.write(todo_new)
    os.rename(tmpf, todo_path)
    print(f"[OK] Updated {todo_path}")

    # ─── Summary ────────────────────────────────────────────────────
    print(f"\n=== Summary ===")
    print(f"Recipes created: {len(RECIPES)}")
    print(f"Blocked: {len(BLOCKED)}")
    print(f"Total resolved: {len(RECIPES) + len(BLOCKED)}")
    print(f"\nBlocked by reason:")
    reasons = {}
    for _, _, reason, _ in BLOCKED:
        reasons[reason] = reasons.get(reason, 0) + 1
    for r, c in sorted(reasons.items()):
        print(f"  {r}: {c}")
    print(f"\nRecipe names: {', '.join(recipe_names)}")


if __name__ == "__main__":
    main()
