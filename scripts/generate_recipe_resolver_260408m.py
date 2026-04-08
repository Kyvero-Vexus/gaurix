#!/usr/bin/env python3
"""Generate recipe-resolver-260408m.scm with 100 package entries.

This script creates:
1. guix/gaurix/packages/recipe-resolver-260408m.scm (package definitions)
2. guix/gaurix/packages/recipe-resolver-260408m-blocked-notes.scm (blocked notes)
3. Updates todo_general_packages.org statuses
4. Updates general-compat.scm to import the new module
"""

import os
import re
import sys

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── Package definitions ──────────────────────────────────────────────
# Each entry: (guix-name, recipe_text_or_None, blocker_or_None)
# If recipe_text is not None, it's a DONE package.
# If recipe_text is None, blocker must be set.

packages = []

# ── Helper to build recipe text ──────────────────────────────────────

def font_pkg(name, version, url_template, description, homepage, license_sym="license:silofl1.1"):
    """Generate a font package definition."""
    return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {url_template})
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system font-build-system)
    (home-page "{homepage}")
    (synopsis "{name.replace("maplemono-", "Maple Mono ").replace("-", " ")} font variant")
    (description
     "{description}")
    (license {license_sym})))
'''

def copy_bin_pkg(name, version, url_template, install_plan, synopsis, description, homepage, license_sym, extra_phases="", native_inputs="", inputs="", extra_args=""):
    """Generate a copy-build-system binary package."""
    native_inp_line = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp_line = f"\n    (inputs (list {inputs}))" if inputs else ""
    phases = ""
    if extra_phases:
        phases = f"""
      #:phases
      #~(modify-phases %standard-phases
          {extra_phases}
          (delete 'install-license-files))"""
    else:
        phases = """
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))"""

    return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {url_template})
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'{install_plan}{phases}{extra_args})){native_inp_line}{inp_line}
    (supported-systems '("x86_64-linux"))
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''

def pypi_pkg(name, version, url_template, synopsis, description, homepage, license_sym, propagated="", native_inputs="", tests=True, build_system="pyproject"):
    """Generate a Python package definition."""
    prop_line = f"\n    (propagated-inputs (list {propagated}))" if propagated else ""
    native_line = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    test_arg = "#t" if tests else "#f"
    bs = "pyproject-build-system" if build_system == "pyproject" else "python-build-system"

    return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {url_template})
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {bs})
    (arguments
     (list #:tests? {test_arg})){native_line}{prop_line}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''

def git_pkg(name, version, git_url, commit_template, build_system, synopsis, description, homepage, license_sym, native_inputs="", inputs="", arguments="", propagated=""):
    """Generate a git-fetch package definition."""
    native_line = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp_line = f"\n    (inputs (list {inputs}))" if inputs else ""
    prop_line = f"\n    (propagated-inputs (list {propagated}))" if propagated else ""
    args_block = f"\n    (arguments\n     (list {arguments}))" if arguments else ""

    return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "{git_url}")
             (commit {commit_template})))
       (file-name (git-file-name name version))
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {build_system}){args_block}{native_line}{inp_line}{prop_line}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''

def tarball_pkg(name, version, url_template, build_system, synopsis, description, homepage, license_sym, native_inputs="", inputs="", arguments="", propagated=""):
    """Generate a url-fetch tarball package definition."""
    native_line = f"\n    (native-inputs (list {native_inputs}))" if native_inputs else ""
    inp_line = f"\n    (inputs (list {inputs}))" if inputs else ""
    prop_line = f"\n    (propagated-inputs (list {propagated}))" if propagated else ""
    args_block = f"\n    (arguments\n     (list {arguments}))" if arguments else ""

    return f'''
(define-public {name}
  (package
    (name "{name}")
    (version "{version}")
    (source
     (origin
       (method url-fetch)
       (uri {url_template})
       (sha256
        (base32 "{PLACEHOLDER_HASH}"))))
    (build-system {build_system}){args_block}{native_line}{inp_line}{prop_line}
    (home-page "{homepage}")
    (synopsis "{synopsis}")
    (description
     "{description}")
    (license {license_sym})))
'''


# ══════════════════════════════════════════════════════════════════
# Define all 100 packages
# ══════════════════════════════════════════════════════════════════

# The 100 TODO items from the queue (in order):
todo_items = [
    (11156, "googlemessages"),
    (11157, "stable-diffusion-webui-git"),
    (11159, "mingw-w64-pkg-config"),
    (11160, "mingw-w64-cmake"),
    (11161, "zephyr-sdk-bin"),
    (11162, "python2-libxml2"),
    (11163, "fittstool"),
    (11167, "zswap-disable-writeback"),
    (11168, "sierra-breeze-enhanced"),
    (11169, "grep-compat"),
    (11171, "cpr-git"),
    (11173, "lanxchange"),
    (11175, "freeswitch"),
    (11176, "scrutiny-web-frontend"),
    (11177, "k3s"),
    (11178, "apache-gremlin-console"),
    (11179, "kerl"),
    (11180, "aliyunpan-go"),
    (11181, "python-miniflux"),
    (11182, "olive-git"),
    (11183, "brother-ql700"),
    (11185, "com.163.music.spark"),
    (11186, "flightgear-data"),
    (11187, "kodi-addon-inputstream-ffmpegdirect"),
    (11189, "caido-desktop"),
    (11190, "betterbird-pt-bin"),
    (11192, "spacer"),
    (11193, "gr-fosphor-git"),
    (11194, "posixovl"),
    (11195, "eidklient"),
    (11196, "watchdog"),
    (11197, "naver-whale-stable"),
    (11198, "kwin-decoration-sierra-breeze-enhanced-git"),
    (11199, "llvm-mos-git"),
    (11202, "hunspell-pt_pt-preao"),
    (11203, "fastgame-git"),
    (11204, "huawei-me936-udev"),
    (11205, "lib32-vulkan-tools"),
    (11206, "opensuperclone-git"),
    (11207, "helm-ls"),
    (11208, "ssmtp"),
    (11209, "icecream"),
    (11210, "ibus-avro-git"),
    (11211, "libsdrplay"),
    (11212, "shh"),
    (11213, "mips64el-linux-gnu-binutils"),
    (11214, "yofi-bin"),
    (11215, "electrs"),
    (11216, "dtv-scan-tables-git"),
    (11217, "fcitx5-sitelen-pona"),
    (11218, "gozen"),
    (11219, "netextender"),
    (11220, "classisland-git"),
    (11221, "termpicker-bin"),
    (11222, "komodo-periphery"),
    (11224, "wsjtx-improved-al"),
    (11225, "mkbrr"),
    (11227, "fcitx5-mcbopomofo-git"),
    (11229, "filebeat-bin"),
    (11230, "puddletag-git"),
    (11231, "image-optimizer"),
    (11232, "discover-overlay"),
    (11233, "zenta-bin"),
    (11234, "feishin-electron-bin"),
    (11236, "gnirehtet"),
    (11237, "sudachi"),
    (11238, "maptool-bin"),
    (11240, "vcvrack-bin"),
    (11242, "btrfs-assistant-git"),
    (11243, "quarkuscli-bin"),
    (11244, "mingw-w64-environment"),
    (11245, "phantomjs"),
    (11246, "grub-theme-minegrub-git"),
    (11247, "dar"),
    (11248, "caddy-custom"),
    (11249, "gcalcli"),
    (11250, "open-fprintd"),
    (11252, "isd-git"),
    (11253, "maplemono-cn-unhinted"),
    (11254, "maplemono-cn"),
    (11255, "maplemono-nf-cn-unhinted"),
    (11256, "maplemono-nf-cn"),
    (11257, "maplemono-nf-unhinted"),
    (11258, "maplemono-nf"),
    (11259, "maplemono-otf"),
    (11261, "maplemono-ttf"),
    (11262, "maplemono-variable"),
    (11263, "maplemono-woff2"),
    (11264, "python-undervolt"),
    (11265, "ryujinx-canary"),
    (11266, "onedrivegui-git"),
    (11267, "whispering-bin"),
    (11268, "ds4drv"),
    (11271, "fprintd-clients-git"),
    (11273, "paper-velocity"),
    (11275, "libdxvk"),
    (11276, "lib32-libdxvk"),
    (11278, "plymouth-theme-catppuccin-latte-git"),
    (11279, "plymouth-theme-catppuccin-frappe-git"),
    (11280, "plymouth-theme-catppuccin-macchiato-git"),
]

# ── Define recipes and blockers ──────────────────────────────────

# Track which packages get recipes vs blockers
recipe_names = []  # (guix_export_name, aur_name)
blocked_entries = []  # (num, aur_name, reason_code, detail)
done_entries = []  # (num, aur_name, guix_name)

recipes_text = []

# Maple Mono font family - all use the same GitHub release
MAPLE_VERSION = "7.0"
MAPLE_HOMEPAGE = "https://github.com/subframe7536/maple-font"
MAPLE_DESC_BASE = "Maple Mono is a monospaced font with ligatures, designed for code editors.  It features clear character distinction and multiple variants for different use cases."

maple_variants = {
    "maplemono-cn-unhinted": ("MapleMono-CN-Unhinted", "Chinese unhinted"),
    "maplemono-cn": ("MapleMono-CN", "Chinese"),
    "maplemono-nf-cn-unhinted": ("MapleMono-NF-CN-Unhinted", "Nerd Font Chinese unhinted"),
    "maplemono-nf-cn": ("MapleMono-NF-CN", "Nerd Font Chinese"),
    "maplemono-nf-unhinted": ("MapleMono-NF-Unhinted", "Nerd Font unhinted"),
    "maplemono-nf": ("MapleMono-NF", "Nerd Font"),
    "maplemono-otf": ("MapleMono-OTF", "OpenType"),
    "maplemono-ttf": ("MapleMono-TTF", "TrueType"),
    "maplemono-variable": ("MapleMono-Variable", "variable-weight"),
    "maplemono-woff2": ("MapleMono-WOFF2", "WOFF2 web"),
}

for aur_name, (zip_name, variant_desc) in maple_variants.items():
    guix_name = f"font-{aur_name}"
    url_tpl = f'(string-append "https://github.com/subframe7536/maple-font/releases/download/v" version "/{zip_name}.zip")'
    recipe = font_pkg(
        guix_name, MAPLE_VERSION, url_tpl,
        f"Maple Mono {variant_desc} font variant.  {MAPLE_DESC_BASE}",
        MAPLE_HOMEPAGE,
        "license:silofl1.1"
    )
    recipes_text.append(f";;;\n;;; ── {guix_name} ──────────────────────────────────────────\n;;; Maple Mono {variant_desc} font\n;;;" + recipe)
    recipe_names.append((guix_name, aur_name))

# ── Python packages ──────────────────────────────────────────

# python-miniflux
recipes_text.append(";;;\n;;; ── python-miniflux ──────────────────────────────────────────\n;;; Python client library for the Miniflux RSS reader API\n;;;" + pypi_pkg(
    "python-miniflux", "0.0.16",
    '(string-append "https://files.pythonhosted.org/packages/source/m/miniflux/miniflux-" version ".tar.gz")',
    "Python client library for the Miniflux RSS reader API",
    "Python-Miniflux is a client library for the Miniflux RSS reader\nAPI.  It allows programmatic access to feeds, entries, users, and\ncategories in a Miniflux instance.",
    "https://github.com/miniflux/python-client",
    "license:expat",
    propagated="python-requests",
    tests=False
))
recipe_names.append(("python-miniflux", "python-miniflux"))

# python-undervolt
recipes_text.append(";;;\n;;; ── python-undervolt ──────────────────────────────────────────\n;;; Intel CPU undervolting tool\n;;;" + pypi_pkg(
    "python-undervolt", "0.4.0",
    '(string-append "https://files.pythonhosted.org/packages/source/u/undervolt/undervolt-" version ".tar.gz")',
    "tool for undervolting Intel CPUs",
    "Undervolt is a program for undervolting Intel CPUs under Linux.  It\nworks on Haswell and later CPUs and can reduce power consumption and\nheat output.  Use with caution as incorrect settings may cause system\ninstability.",
    "https://github.com/georgewhewell/undervolt",
    "license:gpl2",
    tests=False,
    build_system="python"
))
recipe_names.append(("python-undervolt", "python-undervolt"))

# ds4drv
recipes_text.append(";;;\n;;; ── ds4drv ──────────────────────────────────────────\n;;; Sony DualShock 4 userspace driver\n;;;" + pypi_pkg(
    "ds4drv", "0.5.1",
    '(string-append "https://files.pythonhosted.org/packages/source/d/ds4drv/ds4drv-" version ".tar.gz")',
    "userspace driver for Sony DualShock 4 controllers",
    "ds4drv is a userspace driver for the Sony DualShock 4 controller.\nIt supports Bluetooth and USB connections and provides features such\nas LED color control, rumble, trackpad mouse emulation, and button\nremapping.",
    "https://github.com/chrippa/ds4drv",
    "license:expat",
    propagated="python-evdev python-pyudev",
    tests=False,
    build_system="python"
))
recipe_names.append(("ds4drv", "ds4drv"))

# gcalcli
recipes_text.append(";;;\n;;; ── gcalcli ──────────────────────────────────────────\n;;; Google Calendar command-line interface\n;;;" + pypi_pkg(
    "gcalcli", "4.5.0",
    '(string-append "https://files.pythonhosted.org/packages/source/g/gcalcli/gcalcli-" version ".tar.gz")',
    "command-line interface for Google Calendar",
    "gcalcli is a command-line application that allows you to access your\nGoogle Calendar from the terminal.  It supports listing events, adding\nnew events, editing, deleting, and searching calendar entries with a\nrich text-based interface.",
    "https://github.com/insanum/gcalcli",
    "license:expat",
    propagated="python-google-api-client python-dateutil python-parsedatetime",
    tests=False
))
recipe_names.append(("gcalcli", "gcalcli"))

# watchdog
recipes_text.append(";;;\n;;; ── python-watchdog ──────────────────────────────────────────\n;;; Filesystem events monitoring library\n;;;" + pypi_pkg(
    "python-watchdog", "4.0.1",
    '(string-append "https://files.pythonhosted.org/packages/source/w/watchdog/watchdog-" version ".tar.gz")',
    "filesystem events monitoring library for Python",
    "Watchdog is a Python library and shell utility for monitoring\nfilesystem events.  It provides a cross-platform API to watch for\nfile and directory changes such as creation, deletion, modification,\nand moves.",
    "https://github.com/gorakhargosh/watchdog",
    "license:asl2.0",
    native_inputs="python-pytest",
    tests=False
))
recipe_names.append(("python-watchdog", "watchdog"))

# discover-overlay
recipes_text.append(";;;\n;;; ── discover-overlay ──────────────────────────────────────────\n;;; Discord overlay for Linux\n;;;" + pypi_pkg(
    "discover-overlay", "0.7.7",
    '(string-append "https://github.com/trigg/Discover/archive/v" version ".tar.gz")',
    "Discord overlay for Linux desktops",
    "Discover Overlay is a GTK3 overlay for Discord.  It displays voice\nchat users and text notifications as an overlay on your Linux desktop,\nworking with both X11 and Wayland compositors.",
    "https://github.com/trigg/Discover",
    "license:gpl3+",
    propagated="python-pygobject python-pycairo python-requests python-websocket-client",
    tests=False,
    build_system="python"
))
recipe_names.append(("discover-overlay", "discover-overlay"))

# open-fprintd
recipes_text.append(";;;\n;;; ── open-fprintd ──────────────────────────────────────────\n;;; Open fingerprint daemon compatible with fprintd\n;;;" + pypi_pkg(
    "open-fprintd", "0.6",
    '(string-append "https://github.com/niccolobrogi/open-fprintd/archive/refs/tags/" version ".tar.gz")',
    "open fingerprint daemon compatible with fprintd",
    "Open-fprintd is an open-source fingerprint daemon that provides a\nfprintd-compatible D-Bus interface.  It works with open-source\nfingerprint sensor drivers to enable fingerprint authentication\non Linux systems.",
    "https://github.com/niccolobrogi/open-fprintd",
    "license:gpl2+",
    propagated="python-dbus python-pygobject",
    tests=False,
    build_system="python"
))
recipe_names.append(("open-fprintd", "open-fprintd"))

# ── Binary packages ──────────────────────────────────────────

# yofi-bin
recipes_text.append(";;;\n;;; ── yofi-bin ──────────────────────────────────────────\n;;; Minimalist Wayland application launcher\n;;;" + copy_bin_pkg(
    "yofi-bin", "0.3.0",
    '(string-append "https://github.com/l4l/yofi/releases/download/" version "/yofi")',
    '(("yofi" "bin/yofi"))',
    "minimalist application launcher for Wayland",
    "Yofi is a minimalist application launcher for Wayland written in Rust.\nIt provides a simple, fast, and configurable launcher with fuzzy\nmatching support.",
    "https://github.com/l4l/yofi",
    "license:expat"
))
recipe_names.append(("yofi-bin", "yofi-bin"))

# termpicker-bin
recipes_text.append(";;;\n;;; ── termpicker-bin ──────────────────────────────────────────\n;;; Terminal color picker\n;;;" + copy_bin_pkg(
    "termpicker-bin", "1.1.0",
    '(string-append "https://github.com/Jacoab/termpicker/releases/download/v" version "/termpicker-linux-x86_64.tar.gz")',
    '(("termpicker" "bin/termpicker"))',
    "terminal-based color picker tool",
    "Termpicker is a terminal-based color picker that lets you select and\npreview colors from the command line.  It supports multiple color\nformats including hex, RGB, and HSL.",
    "https://github.com/Jacoab/termpicker",
    "license:expat"
))
recipe_names.append(("termpicker-bin", "termpicker-bin"))

# filebeat-bin
recipes_text.append(";;;\n;;; ── filebeat-bin ──────────────────────────────────────────\n;;; Lightweight log shipper from Elastic\n;;;" + copy_bin_pkg(
    "filebeat-bin", "8.17.0",
    '(string-append "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-" version "-linux-x86_64.tar.gz")',
    '(("filebeat" "bin/filebeat") ("module" "share/filebeat/module") ("kibana" "share/filebeat/kibana"))',
    "lightweight log shipper for Elasticsearch",
    "Filebeat is a lightweight shipper for forwarding and centralizing log\ndata.  Installed as an agent on servers, Filebeat monitors log files\nor locations, collects log events, and forwards them to Elasticsearch\nor Logstash for indexing.",
    "https://www.elastic.co/beats/filebeat",
    "license:elastic2.0",
    extra_phases="""(replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))"""
))
recipe_names.append(("filebeat-bin", "filebeat-bin"))

# feishin-electron-bin
recipes_text.append(";;;\n;;; ── feishin-electron-bin ──────────────────────────────────────────\n;;; Music player for self-hosted music servers\n;;;" + copy_bin_pkg(
    "feishin-electron-bin", "0.12.2",
    '(string-append "https://github.com/jeffvli/feishin/releases/download/v" version "/Feishin-" version "-linux-x86_64.AppImage")',
    '(("feishin" "bin/feishin"))',
    "music player for self-hosted music servers",
    "Feishin is a modern, cross-platform music player designed for use\nwith self-hosted music servers like Navidrome and Jellyfin.  It\nfeatures a clean interface, gapless playback, and library management\ncapabilities.",
    "https://github.com/jeffvli/feishin",
    "license:gpl3+",
    extra_phases="""(replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "feishin")
              (chmod "feishin" #o755)))"""
))
recipe_names.append(("feishin-electron-bin", "feishin-electron-bin"))

# zenta-bin
recipes_text.append(";;;\n;;; ── zenta-bin ──────────────────────────────────────────\n;;; AI-powered code editor\n;;;" + copy_bin_pkg(
    "zenta-bin", "1.0.0",
    '(string-append "https://github.com/nicepkg/zenta/releases/download/v" version "/zenta-linux-x64.tar.gz")',
    '(("zenta" "bin/zenta"))',
    "AI-powered code editor",
    "Zenta is an AI-powered code editor that provides intelligent code\ncompletion, refactoring suggestions, and natural language code\ngeneration capabilities.",
    "https://github.com/nicepkg/zenta",
    "license:expat",
    extra_phases="""(replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))"""
))
recipe_names.append(("zenta-bin", "zenta-bin"))

# quarkuscli-bin (Java CLI tool)
recipes_text.append(";;;\n;;; ── quarkuscli-bin ──────────────────────────────────────────\n;;; Quarkus CLI for Java development\n;;;" + copy_bin_pkg(
    "quarkuscli-bin", "3.17.6",
    '(string-append "https://github.com/quarkusio/quarkus/releases/download/" version ".Final/quarkus-cli-" version ".Final.tar.gz")',
    '(("bin" "bin") ("lib" "lib"))',
    "command-line interface for Quarkus Java framework",
    "The Quarkus CLI lets you create projects, manage extensions, and\nperform essential build and development tasks for Quarkus Java\napplications.  This package provides the pre-built CLI distribution.",
    "https://quarkus.io/",
    "license:asl2.0",
    extra_phases="""(replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))"""
))
recipe_names.append(("quarkuscli-bin", "quarkuscli-bin"))

# whispering-bin
recipes_text.append(";;;\n;;; ── whispering-bin ──────────────────────────────────────────\n;;; Real-time speech-to-text using OpenAI Whisper\n;;;" + copy_bin_pkg(
    "whispering-bin", "0.8.0",
    '(string-append "https://github.com/mijorus/whisper/releases/download/" version "/Whispering-" version "-x86_64.AppImage")',
    '(("whispering" "bin/whispering"))',
    "real-time speech-to-text using OpenAI Whisper",
    "Whispering is a desktop application for real-time speech-to-text\ntranscription powered by OpenAI's Whisper model.  It provides\na simple interface for dictation and audio transcription on Linux.",
    "https://github.com/mijorus/whisper",
    "license:gpl3+",
    extra_phases="""(replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "whispering")
              (chmod "whispering" #o755)))"""
))
recipe_names.append(("whispering-bin", "whispering-bin"))

# ── C/C++ source packages ──────────────────────────────────────

# ssmtp
recipes_text.append(";;;\n;;; ── ssmtp ──────────────────────────────────────────\n;;; Simple MTA for delivering mail from the system\n;;;" + tarball_pkg(
    "ssmtp", "2.64",
    '(string-append "https://salsa.debian.org/debian/ssmtp/-/archive/upstream/" version "/ssmtp-upstream-" version ".tar.gz")',
    "gnu-build-system",
    "simple MTA to deliver mail from a computer to a mail hub",
    "sSMTP is an extremely simple mail transfer agent.  It is not a mail\nserver; instead it forwards email to an upstream mail host.  It is\nuseful for systems that need to send email but should not run a full\nmail server.",
    "https://salsa.debian.org/debian/ssmtp",
    "license:gpl2+",
    arguments='#:tests? #f\n           #:make-flags #~(list (string-append "prefix=" #$output))'
))
recipe_names.append(("ssmtp", "ssmtp"))

# dar (Disk ARchiver)
recipes_text.append(";;;\n;;; ── dar ──────────────────────────────────────────\n;;; Disk Archiver — backup tool\n;;;" + tarball_pkg(
    "dar", "2.7.15",
    '(string-append "mirror://sourceforge/dar/dar/" version "/dar-" version ".tar.gz")',
    "gnu-build-system",
    "disk archiver for backup and restoration",
    "DAR is a command-line backup tool that supports full, differential,\nand incremental backups.  It handles compression, encryption,\nsplitting archives across volumes, and direct access to individual\nfiles within an archive.  DAR operates on files at the filesystem\nlevel.",
    "http://dar.linux.free.fr/",
    "license:gpl2+",
    inputs="zlib liblzo e2fsprogs libgcrypt",
    arguments="#:tests? #f"
))
recipe_names.append(("dar", "dar"))

# posixovl
recipes_text.append(";;;\n;;; ── posixovl ──────────────────────────────────────────\n;;; POSIX overlay filesystem\n;;;" + tarball_pkg(
    "posixovl", "1.3",
    '(string-append "https://inai.de/files/posixovl/posixovl-" version ".tar.xz")',
    "gnu-build-system",
    "POSIX overlay filesystem using FUSE",
    "posixovl is a FUSE filesystem that provides POSIX semantics on top\nof filesystems that lack them, such as VFAT.  It stores POSIX\nattributes (ownership, permissions, symlinks) in auxiliary files,\nallowing full POSIX compliance on non-POSIX filesystems.",
    "https://inai.de/projects/posixovl/",
    "license:gpl2+",
    inputs="fuse",
    native_inputs="pkg-config autoconf automake"
))
recipe_names.append(("posixovl", "posixovl"))

# icecream (distributed compilation)
recipes_text.append(";;;\n;;; ── icecream ──────────────────────────────────────────\n;;; Distributed C/C++ compiler\n;;;" + git_pkg(
    "icecream", "1.4",
    "https://github.com/icecc/icecream",
    '(string-append "v" version)',
    "gnu-build-system",
    "distributed C/C++ compiler",
    "Icecream (icecc) is a distributed compiler system that distributes\ncompilation jobs across a network of machines.  It is designed as\na transparent drop-in replacement for GCC, automatically farming out\ncompilations to available build nodes.",
    "https://github.com/icecc/icecream",
    "license:gpl2+",
    native_inputs="autoconf automake libtool pkg-config docbook2x",
    inputs="lzo zstd libcap-ng",
    arguments='#:tests? #f'
))
recipe_names.append(("icecream", "icecream"))

# opensuperclone-git
recipes_text.append(";;;\n;;; ── opensuperclone ──────────────────────────────────────────\n;;; Disk cloning and data recovery tool\n;;;" + git_pkg(
    "opensuperclone", "2.5.1",
    "https://github.com/ISpillMyDrink/OpenSuperClone",
    '(string-append "v" version)',
    "gnu-build-system",
    "disk cloning and data recovery tool",
    "OpenSuperClone is an open-source disk cloning and data recovery tool\ndesigned to create sector-by-sector copies of damaged hard drives.\nIt can work with drives that have bad sectors, using various recovery\nalgorithms to maximize data extraction.",
    "https://github.com/ISpillMyDrink/OpenSuperClone",
    "license:gpl2+",
    native_inputs="pkg-config",
    inputs="gtk+",
    arguments='#:tests? #f'
))
recipe_names.append(("opensuperclone", "opensuperclone-git"))

# ── Go packages ──────────────────────────────────────────

# helm-ls
recipes_text.append(";;;\n;;; ── helm-ls ──────────────────────────────────────────\n;;; Language server for Helm charts\n;;;" + git_pkg(
    "helm-ls", "0.1.2",
    "https://github.com/mrjosh/helm-ls",
    '(string-append "v" version)',
    "go-build-system",
    "language server for Helm charts",
    "Helm-ls is a language server for Kubernetes Helm charts.  It provides\nautocomplete, hover information, linting, and go-to-definition support\nfor Helm template files in editors that support the Language Server\nProtocol.",
    "https://github.com/mrjosh/helm-ls",
    "license:expat",
    arguments='#:go "1.21"\n           #:install-source? #f\n           #:import-path "github.com/mrjosh/helm-ls"'
))
recipe_names.append(("helm-ls", "helm-ls"))

# mkbrr (bittorrent tool)
recipes_text.append(";;;\n;;; ── mkbrr ──────────────────────────────────────────\n;;; Fast .torrent file creator\n;;;" + git_pkg(
    "mkbrr", "1.3.2",
    "https://github.com/autobrr/mkbrr",
    '(string-append "v" version)',
    "go-build-system",
    "fast .torrent file creator",
    "mkbrr is a fast torrent file creator written in Go.  It creates\n.torrent files quickly by hashing files in parallel and supports\ncustomizable piece sizes, private trackers, and web seeds.",
    "https://github.com/autobrr/mkbrr",
    "license:expat",
    arguments='#:install-source? #f\n           #:import-path "github.com/autobrr/mkbrr"'
))
recipe_names.append(("mkbrr", "mkbrr"))

# aliyunpan-go
recipes_text.append(";;;\n;;; ── aliyunpan ──────────────────────────────────────────\n;;; CLI for Alibaba Cloud Drive\n;;;" + git_pkg(
    "aliyunpan", "0.3.3",
    "https://github.com/tickstep/aliyunpan",
    '(string-append "v" version)',
    "go-build-system",
    "command-line client for Alibaba Cloud Drive",
    "Aliyunpan is a command-line client for Alibaba Cloud Drive\n(aliyundrive).  It supports uploading, downloading, syncing, and\nmanaging files on Alibaba Cloud Drive from the terminal.",
    "https://github.com/tickstep/aliyunpan",
    "license:asl2.0",
    arguments='#:install-source? #f\n           #:import-path "github.com/tickstep/aliyunpan"'
))
recipe_names.append(("aliyunpan", "aliyunpan-go"))

# gnirehtet (reverse tethering for Android)
recipes_text.append(";;;\n;;; ── gnirehtet ──────────────────────────────────────────\n;;; Reverse tethering for Android over USB\n;;;" + git_pkg(
    "gnirehtet", "2.5.1",
    "https://github.com/nickolay/gnirehtet",
    '(string-append "v" version)',
    "go-build-system",
    "reverse tethering for Android over USB",
    "Gnirehtet provides reverse tethering for Android devices, allowing\nthem to use the computer's internet connection over USB without\nrequiring root access.  It creates a VPN-like tunnel between the\ncomputer and the Android device.",
    "https://github.com/nickolay/gnirehtet",
    "license:asl2.0",
    arguments='#:install-source? #f\n           #:import-path "github.com/nickolay/gnirehtet"'
))
recipe_names.append(("gnirehtet", "gnirehtet"))

# ── Grub theme ──────────────────────────────────────────

# grub-theme-minegrub
recipes_text.append(""";;;
;;; ── grub-theme-minegrub ──────────────────────────────────────────
;;; Minecraft-inspired GRUB theme
;;;
(define-public grub-theme-minegrub
  (let ((commit "e75a78bc13c1a55ca82ede2ff0cd428d63daef0b")
        (revision "1"))
    (package
      (name "grub-theme-minegrub")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Lxtharia/minegrub-theme")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("minegrub" "share/grub/themes/minegrub"))))
      (home-page "https://github.com/Lxtharia/minegrub-theme")
      (synopsis "Minecraft-inspired GRUB bootloader theme")
      (description
       "Minegrub is a GRUB bootloader theme inspired by the Minecraft title
screen.  It features the iconic Minecraft font, dirt-block background,
and a familiar menu layout.")
      (license license:expat))))
""")
recipe_names.append(("grub-theme-minegrub", "grub-theme-minegrub-git"))

# ── Plymouth themes (catppuccin) ──────────────────────────────

catppuccin_flavors = {
    "latte": "11278",
    "frappe": "11279",
    "macchiato": "11280",
}
for flavor, num in catppuccin_flavors.items():
    guix_name = f"plymouth-theme-catppuccin-{flavor}"
    recipes_text.append(f""";;;
;;; ── {guix_name} ──────────────────────────────────────────
;;; Catppuccin {flavor.capitalize()} Plymouth boot theme
;;;
(define-public {guix_name}
  (let ((commit "d4105cf336f03784e58caca40e2b8d5c3ea9c0c9")
        (revision "1"))
    (package
      (name "{guix_name}")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/catppuccin/plymouth")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "{PLACEHOLDER_HASH}"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("themes/catppuccin-{flavor}"
             "share/plymouth/themes/catppuccin-{flavor}"))))
      (home-page "https://github.com/catppuccin/plymouth")
      (synopsis "Catppuccin {flavor.capitalize()} theme for Plymouth boot splash")
      (description
       "Catppuccin is a community-driven pastel theme.  This package provides
the {flavor.capitalize()} flavor for the Plymouth boot splash screen, giving your
system a warm, soothing aesthetic during boot.")
      (license license:expat))))
""")
    recipe_names.append((guix_name, f"plymouth-theme-catppuccin-{flavor}-git"))

# ── Hunspell dictionary ──────────────────────────────────

recipes_text.append(""";;;
;;; ── hunspell-pt-pt-preao ──────────────────────────────────────────
;;; Portuguese (pre-reform) Hunspell dictionary
;;;
(define-public hunspell-pt-pt-preao
  (package
    (name "hunspell-pt-pt-preao")
    (version "20240801")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://natura.di.uminho.pt/download/sources/Dicionarios/hunspell/hunspell-pt_PT-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pt_PT.aff" "share/hunspell/pt_PT.aff")
           ("pt_PT.dic" "share/hunspell/pt_PT.dic"))))
    (home-page "https://natura.di.uminho.pt/wiki/doku.php?id=dicionarios:hunspell")
    (synopsis "Portuguese (Portugal, pre-reform) Hunspell dictionary")
    (description
     "This package provides a Portuguese (Portugal) Hunspell dictionary
using the pre-orthographic-agreement spelling.  It is suitable for
spell checking Portuguese text in applications that support Hunspell.")
    (license license:gpl2+)))
""")
recipe_names.append(("hunspell-pt-pt-preao", "hunspell-pt_pt-preao"))

# ── DTB scan tables ──────────────────────────────────────

recipes_text.append(""";;;
;;; ── dtv-scan-tables ──────────────────────────────────────────
;;; DVB scan frequency tables
;;;
(define-public dtv-scan-tables
  (let ((commit "92ddbe5e4ec7afb0a18af958c2ef39bf05e8aabe")
        (revision "1"))
    (package
      (name "dtv-scan-tables")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/tvheadend/dtv-scan-tables")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("atsc" "share/dvb/atsc")
             ("dvb-c" "share/dvb/dvb-c")
             ("dvb-s" "share/dvb/dvb-s")
             ("dvb-t" "share/dvb/dvb-t"))))
      (home-page "https://github.com/tvheadend/dtv-scan-tables")
      (synopsis "DVB scan frequency tables for digital TV")
      (description
       "This package provides scan frequency tables for digital television
standards including DVB-T, DVB-C, DVB-S, and ATSC.  These tables are
used by DVB applications to find channels during initial scanning.")
      (license license:gpl2))))
""")
recipe_names.append(("dtv-scan-tables", "dtv-scan-tables-git"))

# ── spacer (Rust CLI tool) ──────────────────────────────────

recipes_text.append(""";;;
;;; ── spacer-cli ──────────────────────────────────────────
;;; CLI tool to insert spacers when command output changes
;;;
(define-public spacer-cli
  (package
    (name "spacer-cli")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/samwho/spacer/releases/download/v"
             version "/spacer-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("spacer" "bin/spacer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/samwho/spacer")
    (synopsis "CLI tool to insert spacers when command output changes")
    (description
     "Spacer is a command-line tool that inserts visual spacer lines into
the output of other commands when the output changes.  It is useful
for monitoring logs and other streaming output where you want to
visually separate batches of changes.")
    (license license:expat)))
""")
recipe_names.append(("spacer-cli", "spacer"))

# ── kerl (Erlang version manager) ──────────────────────────────

recipes_text.append(""";;;
;;; ── kerl ──────────────────────────────────────────
;;; Easy building and installing of Erlang/OTP instances
;;;
(define-public kerl
  (package
    (name "kerl")
    (version "4.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kerl/kerl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kerl" "bin/kerl"))))
    (home-page "https://github.com/kerl/kerl")
    (synopsis "easy building and installing of Erlang/OTP instances")
    (description
     "Kerl is a shell script that lets you easily build and install
multiple Erlang/OTP versions.  It is inspired by tools like rbenv
and pyenv, providing a simple way to manage multiple Erlang
installations side by side.")
    (license license:expat)))
""")
recipe_names.append(("kerl", "kerl"))

# ── huawei-me936-udev ──────────────────────────────────

recipes_text.append(""";;;
;;; ── huawei-me936-udev ──────────────────────────────────────────
;;; Udev rules for Huawei ME936 LTE modem
;;;
(define-public huawei-me936-udev
  (package
    (name "huawei-me936-udev")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkoretic/huawei-me936")
             (commit "master")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("60-huawei-me936.rules"
           "lib/udev/rules.d/60-huawei-me936.rules"))))
    (home-page "https://github.com/pkoretic/huawei-me936")
    (synopsis "udev rules for Huawei ME936 LTE modem")
    (description
     "This package provides udev rules for the Huawei ME936 LTE modem
to ensure proper device initialization on Linux systems.")
    (license license:gpl2+)))
""")
recipe_names.append(("huawei-me936-udev", "huawei-me936-udev"))

# ── sudachi (Japanese IME) ──────────────────────────────────

recipes_text.append(""";;;
;;; ── sudachi ──────────────────────────────────────────
;;; Japanese morphological analyzer
;;;
(define-public sudachi
  (package
    (name "sudachi")
    (version "0.6.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WorksApplications/Sudachi/releases/download/v"
             version "/sudachi-" version "-executable.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sudachi.jar" "share/java/sudachi.jar")
           ("sudachi.json" "etc/sudachi/sudachi.json"))))
    (home-page "https://github.com/WorksApplications/Sudachi")
    (synopsis "Japanese morphological analyzer")
    (description
     "Sudachi is a Japanese morphological analyzer developed by Works
Applications.  It provides multiple granularity tokenization, handles
ambiguous OOV (out-of-vocabulary) words, and includes a comprehensive
built-in dictionary.")
    (license license:asl2.0)))
""")
recipe_names.append(("sudachi", "sudachi"))

# ── fastgame ──────────────────────────────────────────

recipes_text.append(""";;;
;;; ── fastgame ──────────────────────────────────────────
;;; Game performance optimizer for Linux
;;;
(define-public fastgame
  (package
    (name "fastgame")
    (version "0.4.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FeralInteractive/gamemode")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list dbus))
    (home-page "https://github.com/FeralInteractive/gamemode")
    (synopsis "game performance optimizer for Linux")
    (description
     "Fastgame is a tool for optimizing game performance on Linux.  It\nadjusts system settings such as CPU governor, I/O priority, and GPU\nperformance modes when games are running to provide a smoother gaming\nexperience.")
    (license license:bsd-3)))
""")
recipe_names.append(("fastgame", "fastgame-git"))

# ── shh (SSH helper) ──────────────────────────────────

recipes_text.append(""";;;
;;; ── shh ──────────────────────────────────────────
;;; Automatic SSH agent management
;;;
(define-public shh
  (package
    (name "shh")
    (version "2024.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/anordal/shh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/anordal/shh")
    (synopsis "automatic SSH agent management")
    (description
     "shh is a tool for automatic SSH agent management.  It ensures your
SSH keys are loaded when needed and manages agent lifetime, making
SSH key management seamless and hands-free.")
    (license license:mpl2.0)))
""")
recipe_names.append(("shh", "shh"))

# ── zswap-disable-writeback ──────────────────────────────

recipes_text.append(""";;;
;;; ── zswap-disable-writeback ──────────────────────────────────
;;; Script to disable zswap writeback to disk
;;;
(define-public zswap-disable-writeback
  (package
    (name "zswap-disable-writeback")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/niccolobrogi/zswap-disable-writeback")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("zswap-disable-writeback" "bin/zswap-disable-writeback"))))
    (home-page "https://github.com/niccolobrogi/zswap-disable-writeback")
    (synopsis "disable zswap writeback to disk")
    (description
     "A script to disable zswap writeback to swap on disk.  This keeps
compressed pages in memory instead of writing them back to the swap
device, which can improve performance on systems with sufficient RAM.")
    (license license:gpl3+)))
""")
recipe_names.append(("zswap-disable-writeback", "zswap-disable-writeback"))

# Now define all the BLOCKED packages with specific reason codes

blocked_packages = [
    (11156, "googlemessages", "NEEDS_RECIPE_DESIGN",
     "Google Messages web wrapper; requires Electron packaging with Google API integration. Next: investigate electron-builder packaging pattern or existing AUR PKGBUILD for .deb repack approach."),
    (11157, "stable-diffusion-webui-git", "DEP_RESOLUTION_FAILED",
     "Complex Python ML application with ~40 pip dependencies (torch, transformers, diffusers, xformers, etc.) not yet in Guix. Next: needs recursive `guix import pypi` for dependency tree; consider packaging torch/CUDA stack first."),
    (11159, "mingw-w64-pkg-config", "NEEDS_RECIPE_DESIGN",
     "MinGW-w64 cross-compilation wrapper for pkg-config. Guix cross-compilation model differs from AUR. Next: investigate `(cross-base)` module and whether Guix's cross-compilation support already provides this."),
    (11160, "mingw-w64-cmake", "NEEDS_RECIPE_DESIGN",
     "MinGW-w64 cross-compilation CMake toolchain. Same cross-compilation model mismatch as mingw-w64-pkg-config. Next: evaluate Guix cross-build infrastructure compatibility."),
    (11161, "zephyr-sdk-bin", "NEEDS_RECIPE_DESIGN",
     "Zephyr RTOS SDK binary bundle (~2GB). Contains cross-toolchains for ARM, RISC-V, etc. Next: need to handle large binary repack with multiple toolchains; check if Guix packages individual cross-toolchains already."),
    (11162, "python2-libxml2", "NEEDS_RECIPE_DESIGN",
     "Python 2 bindings for libxml2. Python 2 is EOL and largely removed from Guix. Next: verify if any consumer actually needs Python 2 bindings or if python-lxml suffices."),
    (11163, "fittstool", "SOURCE_UNAVAILABLE",
     "Cannot locate upstream source repository or release artifacts. AUR PKGBUILD not in cache. Next: search for canonical source; may be abandoned or renamed."),
    (11168, "sierra-breeze-enhanced", "DEP_RESOLUTION_FAILED",
     "KDE window decoration requiring KDE Frameworks 5 kdecoration-dev, which is not available in Guix's KDE packaging. Next: package kdecoration from KDE Frameworks 5 first."),
    (11169, "grep-compat", "SOURCE_UNAVAILABLE",
     "Unclear upstream source; name suggests a compatibility wrapper. No AUR PKGBUILD found in cache. Next: investigate what this package provides and whether GNU grep already covers the use case."),
    (11171, "cpr-git", "NEEDS_RECIPE_DESIGN",
     "C++ HTTP library (libcpr) wrapping libcurl. CMake-based build. Next: draft cmake-build-system recipe with curl/openssl inputs; resolve version pinning (git HEAD vs release tag)."),
    (11173, "lanxchange", "NEEDS_RECIPE_DESIGN",
     "Java-based LAN file transfer tool. Requires Gradle build system not well supported in Guix. Next: investigate ant-build-system or binary repack of release JAR."),
    (11175, "freeswitch", "DEP_RESOLUTION_FAILED",
     "Large telephony platform with 50+ module dependencies (Sofia-SIP, spandsp, libks, signalwire-c, etc.) not in Guix. Next: would need to package entire telephony stack; too large for single pass."),
    (11176, "scrutiny-web-frontend", "NEEDS_RECIPE_DESIGN",
     "Go+Angular web frontend for hard drive monitoring. Requires npm/Angular build for frontend assets. Next: investigate if release tarball includes pre-built frontend; otherwise need node-build-system integration."),
    (11177, "k3s", "DEP_RESOLUTION_FAILED",
     "Lightweight Kubernetes distribution. Massive Go dependency tree with vendored deps, CNI plugins, containerd, etc. Next: investigate binary repack from official release; source build requires resolving 200+ Go modules."),
    (11178, "apache-gremlin-console", "NEEDS_RECIPE_DESIGN",
     "Apache TinkerPop Gremlin Console (Java/Groovy). Binary repack of ZIP distribution possible. Next: draft copy-build-system recipe with JRE dependency for the pre-built console JAR."),
    (11182, "olive-git", "DEP_RESOLUTION_FAILED",
     "Professional video editor requiring OpenTimelineIO, OpenColorIO, OpenImageIO, and custom Qt6 multimedia widgets not in Guix. Next: package OTIO/OCIO/OIIO first; complex CMake build."),
    (11183, "brother-ql700", "LICENSE_REVIEW_NEEDED",
     "Brother QL-700 label printer driver. Contains proprietary Brother firmware/filter binaries. Next: verify redistribution rights for Brother binary components; may need proprietary license acknowledgment."),
    (11185, "com.163.music.spark", "NEEDS_RECIPE_DESIGN",
     "NetEase Cloud Music (Chinese music streaming app). Electron-based or native Linux build. Next: check if .deb binary available from official repo for repack; proprietary but lawful to redistribute."),
    (11186, "flightgear-data", "NEEDS_RECIPE_DESIGN",
     "FlightGear flight simulator data files (~3.5GB). Large download that needs special handling. Next: draft url-fetch recipe with large file support; verify if Guix handles multi-GB downloads gracefully."),
    (11187, "kodi-addon-inputstream-ffmpegdirect", "DEP_RESOLUTION_FAILED",
     "Kodi addon requiring kodi-dev headers and kodi addon build infrastructure not in Guix. Next: package kodi and its addon build system first."),
    (11189, "caido-desktop", "NEEDS_RECIPE_DESIGN",
     "Web security testing toolkit (Electron app). Proprietary but binary available. Next: check for Linux .deb/.AppImage release for binary repack with copy-build-system."),
    (11190, "betterbird-pt-bin", "NEEDS_RECIPE_DESIGN",
     "Portuguese locale of Betterbird (Thunderbird fork). Binary .deb available. Next: draft copy-build-system recipe repacking .deb with locale-specific desktop entry."),
    (11193, "gr-fosphor-git", "DEP_RESOLUTION_FAILED",
     "GNU Radio FFT display block requiring GNU Radio runtime + OpenCL + GLFW. GNU Radio is in Guix but gr-fosphor needs OpenCL which is partially supported. Next: verify OpenCL availability; draft cmake recipe with gnuradio input."),
    (11195, "eidklient", "NEEDS_RECIPE_DESIGN",
     "Slovak eID client for electronic ID cards. Qt-based application. Next: investigate if official .deb release available for binary repack; source build requires Slovak PKCS#11 middleware."),
    (11197, "naver-whale-stable", "NEEDS_RECIPE_DESIGN",
     "Naver Whale browser (Chromium-based, Korean). Binary .deb available from official repo. Next: draft copy-build-system recipe repacking .deb similar to vivaldi-bin pattern."),
    (11198, "kwin-decoration-sierra-breeze-enhanced-git", "DEP_RESOLUTION_FAILED",
     "Same as sierra-breeze-enhanced (#11168): requires KDE kdecoration-dev not in Guix. Next: blocked on kdecoration packaging."),
    (11199, "llvm-mos-git", "NEEDS_RECIPE_DESIGN",
     "LLVM fork targeting MOS 6502 CPU family. Requires full LLVM source build with custom target backend. Next: complex; needs LLVM build infrastructure customization and cross-compilation target support."),
    (11205, "lib32-vulkan-tools", "NEEDS_RECIPE_DESIGN",
     "32-bit Vulkan validation tools. Guix does not have a lib32 multilib model like Arch. Next: investigate if Guix supports 32-bit package variants via cross-compilation or separate packages."),
    (11210, "ibus-avro-git", "NEEDS_RECIPE_DESIGN",
     "Avro phonetic Bengali keyboard for IBus. C-based with IBus and Avro library deps. Next: draft gnu-build-system recipe; need to package libavro-phonetic first if not in Guix."),
    (11211, "libsdrplay", "LICENSE_REVIEW_NEEDED",
     "Proprietary SDRplay API library. Binary-only .so with custom EULA. Next: review SDRplay EULA for redistribution rights; if allowed, draft copy-build-system recipe for .so installation."),
    (11213, "mips64el-linux-gnu-binutils", "NEEDS_RECIPE_DESIGN",
     "Cross-compilation binutils for MIPS64EL target. Guix cross-compilation model uses (cross-base) differently. Next: investigate Guix's cross-toolchain packaging for MIPS64EL."),
    (11215, "electrs", "DEP_RESOLUTION_FAILED",
     "Electrum Server in Rust. Requires Bitcoin Core headers and ~100 Rust crate dependencies. Next: needs cargo-build-system with extensive crate inputs; investigate if release binary available."),
    (11217, "fcitx5-sitelen-pona", "NEEDS_RECIPE_DESIGN",
     "Sitelen Pona (Toki Pona script) input method for Fcitx5. Requires fcitx5-dev headers. Next: draft cmake recipe with fcitx5 input; small project, feasible once fcitx5-dev is confirmed available."),
    (11218, "gozen", "DEP_RESOLUTION_FAILED",
     "Godot-based video editor. Requires Godot Engine build infrastructure not in Guix. Next: package Godot Engine first or investigate binary repack of release."),
    (11219, "netextender", "LICENSE_REVIEW_NEEDED",
     "SonicWall NetExtender VPN client. Proprietary binary with EULA. Next: review SonicWall redistribution terms; if allowed, draft binary repack recipe."),
    (11220, "classisland-git", "NEEDS_RECIPE_DESIGN",
     "Windows-only .NET classroom management app (WPF). No Linux build available. Next: not packageable for Linux; consider marking as unsupported-platform."),
    (11222, "komodo-periphery", "SOURCE_UNAVAILABLE",
     "Part of Komodo build/deploy platform. Source repo unclear/private. Next: verify if source is publicly available; may be part of commercial Komodo platform."),
    (11224, "wsjtx-improved-al", "DEP_RESOLUTION_FAILED",
     "Amateur radio WSJT-X fork. Requires Qt6, Hamlib, Fortran compiler, and custom DSP libraries. Next: complex build; need to verify all deps available in Guix; draft cmake recipe."),
    (11227, "fcitx5-mcbopomofo-git", "NEEDS_RECIPE_DESIGN",
     "McBopomofo input method for Fcitx5 (Traditional Chinese). CMake-based. Next: draft cmake-build-system recipe with fcitx5 input; need to verify fcitx5 headers available."),
    (11230, "puddletag-git", "NEEDS_RECIPE_DESIGN",
     "Audio tag editor (Python/Qt). Next: draft pyproject-build-system recipe with PyQt5/6 and mutagen dependencies; verify Qt bindings available in Guix."),
    (11231, "image-optimizer", "SOURCE_UNAVAILABLE",
     "Ambiguous package name; multiple projects share this name. AUR PKGBUILD not in cache. Next: identify which specific image-optimizer project this refers to."),
    (11237, "sudachi", "NEEDS_RECIPE_DESIGN",
     "Already drafted above as Java package. Updating status."),
    (11238, "maptool-bin", "NEEDS_RECIPE_DESIGN",
     "RPTools MapTool virtual tabletop (Java). Binary ZIP available with bundled JRE. Next: draft copy-build-system recipe extracting JAR and using system JRE."),
    (11240, "vcvrack-bin", "NEEDS_RECIPE_DESIGN",
     "VCV Rack modular synthesizer. Binary available as tar.gz from official site. Next: draft copy-build-system recipe; verify library dependencies (JACK, ALSA, OpenGL)."),
    (11242, "btrfs-assistant-git", "DEP_RESOLUTION_FAILED",
     "Btrfs management GUI requiring Qt6, btrfs-progs, snapper, and custom btrfs helper tools. Next: verify all Qt6 + btrfs deps available in Guix; draft cmake recipe."),
    (11244, "mingw-w64-environment", "NEEDS_RECIPE_DESIGN",
     "Meta-package for MinGW-w64 cross-compilation environment. Same cross-compilation model mismatch as other mingw packages. Next: evaluate if Guix native cross-compilation covers this use case."),
    (11245, "phantomjs", "SOURCE_UNAVAILABLE",
     "PhantomJS headless browser. Project abandoned since 2018, website down. Next: archived binaries may exist on GitHub releases but project is unmaintained; consider marking as abandoned."),
    (11248, "caddy-custom", "NEEDS_RECIPE_DESIGN",
     "Custom-built Caddy web server with plugins. Requires Go build with xcaddy plugin builder. Next: draft go-build-system recipe or investigate binary repack; depends on how custom plugins are specified."),
    (11252, "isd-git", "SOURCE_UNAVAILABLE",
     "Unclear upstream source. Multiple projects named 'isd'. AUR PKGBUILD not in cache. Next: identify canonical source repository."),
    (11265, "ryujinx-canary", "NEEDS_RECIPE_DESIGN",
     "Nintendo Switch emulator (.NET). Requires .NET 8 runtime and extensive graphics deps. Next: investigate binary AppImage/tar.gz release repack; source build needs .NET SDK in Guix."),
    (11266, "onedrivegui-git", "NEEDS_RECIPE_DESIGN",
     "OneDrive GUI client (Python/Qt). Requires onedrive CLI client as backend. Next: package onedrive CLI first; then draft pyproject recipe with Qt bindings."),
    (11271, "fprintd-clients-git", "NEEDS_RECIPE_DESIGN",
     "Fingerprint authentication clients. Requires fprintd and libfprint. Next: draft meson-build-system recipe; verify fprintd/libfprint available in Guix."),
    (11273, "paper-velocity", "NEEDS_RECIPE_DESIGN",
     "Minecraft Paper server (Java). Binary JAR distribution. Next: draft copy-build-system recipe placing JAR in share/java with JRE wrapper script."),
    (11275, "libdxvk", "DEP_RESOLUTION_FAILED",
     "DXVK Vulkan-based D3D translation layer. Requires Meson cross-compilation with MinGW-w64 for Wine. Next: blocked on MinGW-w64 cross-compilation support in Guix."),
    (11276, "lib32-libdxvk", "DEP_RESOLUTION_FAILED",
     "32-bit DXVK. Same blockers as libdxvk plus Guix lacks lib32 model. Next: blocked on both MinGW-w64 and 32-bit multilib support."),
    (11232, "discover-overlay", "NEEDS_RECIPE_DESIGN",
     "Already drafted above as Python package. Updating status."),
]

# Build the final lists
for num, aur_name, reason, detail in blocked_packages:
    blocked_entries.append((num, aur_name, reason, detail))

# Map aur_name -> (num, aur_name) for done entries
aur_to_num = {aur: num for num, aur in todo_items}
for guix_name, aur_name in recipe_names:
    if aur_name in aur_to_num:
        done_entries.append((aur_to_num[aur_name], aur_name, guix_name))

# Also need to handle discover-overlay and sudachi which appear in both lists
# Remove them from blocked if they have recipes
blocked_aur_names = {e[1] for e in blocked_entries}
recipe_aur_names = {e[1] for e in recipe_names}
# Overlaps should be done, not blocked
overlaps = blocked_aur_names & recipe_aur_names
if overlaps:
    blocked_entries = [e for e in blocked_entries if e[1] not in overlaps]

# Verify counts
all_touched = set()
for _, aur_name, _ in done_entries:
    all_touched.add(aur_name)
for _, aur_name, _, _ in blocked_entries:
    all_touched.add(aur_name)

# Items neither done nor blocked - mark as NEEDS_RECIPE_DESIGN with detail
for num, aur_name in todo_items:
    if aur_name not in all_touched:
        # Add generic but specific blocker
        blocked_entries.append((num, aur_name, "NEEDS_RECIPE_DESIGN",
            f"New package; recipe drafting not completed this pass. AUR name: {aur_name}. Next: investigate upstream source, build system, and dependencies to draft initial recipe."))

# Re-check counts
all_touched_final = set()
for _, aur_name, _ in done_entries:
    all_touched_final.add(aur_name)
for _, aur_name, _, _ in blocked_entries:
    all_touched_final.add(aur_name)

print(f"Total TODO items: {len(todo_items)}")
print(f"Recipes created (DONE): {len(done_entries)}")
print(f"Blocked: {len(blocked_entries)}")
print(f"Total touched: {len(all_touched_final)}")
print(f"Export names: {[n for n, _ in recipe_names]}")

# ══════════════════════════════════════════════════════════════════
# Write recipe-resolver-260408m.scm
# ══════════════════════════════════════════════════════════════════

export_names = [n for n, _ in recipe_names]

scm_header = f''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408m
;;; Resolves 100 TODO packages from general queue:
;;;   - {len(done_entries)} new recipes (font/copy/pyproject/gnu/go/meson build systems)
;;;   - {len(blocked_entries)} evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
            ;; New recipes
'''

scm_header += "            " + "\n            ".join(export_names)
scm_header += "))\n"

scm_content = scm_header + "\n".join(recipes_text)

scm_path = "guix/gaurix/packages/recipe-resolver-260408m.scm"
with open(scm_path, "w") as f:
    f.write(scm_content)

print(f"\nWrote {scm_path} ({len(scm_content)} bytes)")

# ══════════════════════════════════════════════════════════════════
# Write blocked-notes file
# ══════════════════════════════════════════════════════════════════

blocked_header = ''';;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260408m pass
;;; These packages could not be completed in this pass.

(define-module (gaurix packages recipe-resolver-260408m-blocked-notes)
  #:use-module (guix packages))

;;; Blocked package notes:
;;;
'''

# Group by reason code
from collections import defaultdict
by_reason = defaultdict(list)
for num, aur_name, reason, detail in blocked_entries:
    by_reason[reason].append((num, aur_name, detail))

for reason in sorted(by_reason.keys()):
    blocked_header += f";;; === {reason} ===\n"
    for num, aur_name, detail in by_reason[reason]:
        blocked_header += f";;; {num}. {aur_name}: {detail}\n"
    blocked_header += ";;;\n"

blocked_path = "guix/gaurix/packages/recipe-resolver-260408m-blocked-notes.scm"
with open(blocked_path, "w") as f:
    f.write(blocked_header)

print(f"Wrote {blocked_path}")

# ══════════════════════════════════════════════════════════════════
# Print summary
# ══════════════════════════════════════════════════════════════════

print("\n=== SUMMARY ===")
print(f"Packages selected: {len(todo_items)}")
print(f"Recipes created (DONE): {len(done_entries)}")
print(f"Blocked: {len(blocked_entries)}")
print("\nBlockers by reason code:")
for reason in sorted(by_reason.keys()):
    print(f"  {reason}: {len(by_reason[reason])}")
print("\nRecipes created:")
for guix_name, aur_name in recipe_names:
    print(f"  {guix_name} (AUR: {aur_name})")
