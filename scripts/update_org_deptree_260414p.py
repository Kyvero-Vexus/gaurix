#!/usr/bin/env python3
"""Update todo_general_packages.org for deptree-resolver-260414p results.

Reads the org file, applies status changes for all 100 selected packages,
writes to a temp file, then atomically replaces the original.
"""

import re
import os
import tempfile
import shutil

ORG_FILE = "todo_general_packages.org"

# Packages resolved with recipes → DONE
resolved = {
    9830: ("typioca-git", "DONE", "[RESOLVED: deptree-resolver-260414p — Go typing tester, go-build-system]"),
    10101: ("zig-master-bin", "DONE", "[RESOLVED: deptree-resolver-260414p — Zig binary, copy-build-system v0.14.1]"),
    3239: ("scap-security-guide", "DONE", "[RESOLVED: deptree-resolver-260414p — SCAP security profiles, cmake-build-system v0.1.78]"),
}

# Packages staying BLOCKED with updated/confirmed reason codes
blocked_updates = {
    # MISSING_SOURCE
    58: ("anbox-git", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; project discontinued, successor Waydroid exists]"),
    2986: ("gram-editor-git", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    7510: ("linux6.19.8.arch1-1-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel binary; removed from AUR]"),
    7512: ("linux6.19.8.arch1-1-docs-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel docs binary; removed from AUR]"),
    7511: ("linux6.19.8.arch1-1-headers-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel headers binary; removed from AUR]"),
    9670: ("linux6.19.9.arch1-1-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel binary; removed from AUR]"),
    9672: ("linux6.19.9.arch1-1-docs-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel docs binary; removed from AUR]"),
    9671: ("linux6.19.9.arch1-1-headers-bin", "[BLOCKED: MISSING_SOURCE: versioned kernel headers binary; removed from AUR]"),
    9956: ("linux6.19.9.zen1-1-zen-bin", "[BLOCKED: MISSING_SOURCE: versioned zen kernel binary; removed from AUR]"),
    9958: ("linux6.19.9.zen1-1-zen-docs-bin", "[BLOCKED: MISSING_SOURCE: versioned zen kernel docs binary; removed from AUR]"),
    9957: ("linux6.19.9.zen1-1-zen-headers-bin", "[BLOCKED: MISSING_SOURCE: versioned zen kernel headers binary; removed from AUR]"),
    2097: ("llama.cpp-aio", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    13452: ("nodejs-ripencli", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    548: ("nvidia-vulkan-dkms", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; NVIDIA proprietary driver]"),
    1578: ("openai-codex-autoup-bin", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    7333: ("opensc-p11-kit-module", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    13442: ("pinapp", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    6759: ("projtlauncher", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    7482: ("shimmy-bin", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    1149: ("shorinclip-git", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    24: ("vivaldi-ffmpeg-codecs", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    46: ("whatsapp-for-linux", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),
    38: ("zettlr", "[BLOCKED: MISSING_SOURCE: not in AUR metadata; no upstream source available]"),

    # NON_DISTRIBUTABLE - Microsoft fonts
    380: ("ttf-ms-win10-auto", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 proprietary fonts]"),
    11901: ("ttf-ms-win10-auto", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 proprietary fonts]"),
    379: ("ttf-ms-win10-auto-japanese", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Japanese proprietary fonts]"),
    11902: ("ttf-ms-win10-auto-japanese", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Japanese proprietary fonts]"),
    378: ("ttf-ms-win10-auto-korean", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Korean proprietary fonts]"),
    11903: ("ttf-ms-win10-auto-korean", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Korean proprietary fonts]"),
    377: ("ttf-ms-win10-auto-other", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Other proprietary fonts]"),
    11908: ("ttf-ms-win10-auto-other", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Other proprietary fonts]"),
    376: ("ttf-ms-win10-auto-sea", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 SE Asian proprietary fonts]"),
    11904: ("ttf-ms-win10-auto-sea", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 SE Asian proprietary fonts]"),
    375: ("ttf-ms-win10-auto-thai", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Thai proprietary fonts]"),
    11905: ("ttf-ms-win10-auto-thai", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Thai proprietary fonts]"),
    374: ("ttf-ms-win10-auto-zh_cn", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Simplified Chinese proprietary fonts]"),
    11906: ("ttf-ms-win10-auto-zh_cn", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Simplified Chinese proprietary fonts]"),
    373: ("ttf-ms-win10-auto-zh_tw", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Traditional Chinese proprietary fonts]"),
    11907: ("ttf-ms-win10-auto-zh_tw", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 10 Traditional Chinese proprietary fonts]"),
    8928: ("ttf-ms-win11-fod-auto-arab", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Arabic proprietary fonts]"),
    8927: ("ttf-ms-win11-fod-auto-beng", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Bengali proprietary fonts]"),
    8926: ("ttf-ms-win11-fod-auto-cans", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD CANS proprietary fonts]"),
    8925: ("ttf-ms-win11-fod-auto-cher", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Cherokee proprietary fonts]"),
    8924: ("ttf-ms-win11-fod-auto-deva", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Devanagari proprietary fonts]"),
    8923: ("ttf-ms-win11-fod-auto-ethi", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Ethiopic proprietary fonts]"),
    8922: ("ttf-ms-win11-fod-auto-gujr", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Gujarati proprietary fonts]"),
    8921: ("ttf-ms-win11-fod-auto-guru", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Gurmukhi proprietary fonts]"),
    8920: ("ttf-ms-win11-fod-auto-hans", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Simplified Chinese proprietary fonts]"),
    8943: ("ttf-ms-win11-fod-auto-hant", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Traditional Chinese proprietary fonts]"),
    8942: ("ttf-ms-win11-fod-auto-hebr", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Hebrew proprietary fonts]"),
    8941: ("ttf-ms-win11-fod-auto-jpan", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Japanese proprietary fonts]"),
    8940: ("ttf-ms-win11-fod-auto-khmr", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Khmer proprietary fonts]"),
    8939: ("ttf-ms-win11-fod-auto-knda", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Kannada proprietary fonts]"),
    8938: ("ttf-ms-win11-fod-auto-kore", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Korean proprietary fonts]"),
    8937: ("ttf-ms-win11-fod-auto-laoo", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Lao proprietary fonts]"),
    8936: ("ttf-ms-win11-fod-auto-mlym", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Malayalam proprietary fonts]"),
    8935: ("ttf-ms-win11-fod-auto-orya", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Oriya proprietary fonts]"),
    8934: ("ttf-ms-win11-fod-auto-paneuropean", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Pan-European proprietary fonts]"),
    8933: ("ttf-ms-win11-fod-auto-sinh", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Sinhala proprietary fonts]"),
    8932: ("ttf-ms-win11-fod-auto-syrc", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Syriac proprietary fonts]"),
    8931: ("ttf-ms-win11-fod-auto-taml", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Tamil proprietary fonts]"),
    8930: ("ttf-ms-win11-fod-auto-telu", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Telugu proprietary fonts]"),
    8929: ("ttf-ms-win11-fod-auto-thai", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Windows 11 FOD Thai proprietary fonts]"),
    500: ("ttf-vista-fonts", "[BLOCKED: NON_DISTRIBUTABLE: Microsoft Vista/Office 2007 proprietary fonts]"),
    1534: ("nerd-fonts-apple", "[BLOCKED: PROPRIETARY_FONT_LICENSE: Apple fonts patched with Nerd Fonts]"),

    # NEEDS_RECIPE_DESIGN_EXHAUSTED
    9402: ("gd-tools-git", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: GoldenDict tools (C++/xmake); xmake not in Guix]"),
    10469: ("insomnia", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: HTTP client; Electron/npm ecosystem]"),
    11667: ("nekobox", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: Qt6 proxy GUI; C++/Qt6/Go hybrid]"),
    644: ("nekobox", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: Qt6 proxy GUI; same as #11667]"),
    11668: ("nekobox-core", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: proxy core; Go/C++ hybrid with sing-box]"),
    643: ("nekobox-core", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: proxy core; same as #11668]"),
    460: ("penpot-frontend", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: design tool frontend; ClojureScript/npm]"),
    13307: ("penpot-frontend", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: design tool frontend; same as #460]"),
    746: ("redisinsight", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: Redis GUI; Electron/npm]"),
    3720: ("spacebar-git", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: Discord-compatible server; Node.js/npm]"),
    7052: ("tosu-git", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: osu! memory reader; Node.js/pnpm]"),
    12841: ("antiafk-rbx-sober", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_DEPENDENCY: requires Sober Flatpak]"),
    2524: ("antiafk-rbx-sober", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: FLATPAK_DEPENDENCY: requires Sober Flatpak for Roblox]"),
    25171: ("sickrage-git", "[BLOCKED: DEP_RESOLUTION_FAILED: TV show PVR; Python virtualenv, unmaintained]"),
    4107: ("affine", "[BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_ECOSYSTEM: Electron knowledge base app]"),

    # COMPLEX_BUILD_DEPS
    11086: ("java-openjfx-doc", "[BLOCKED: COMPLEX_BUILD_DEPS: Java OpenJFX 27 docs; requires gradle]"),
    11087: ("java-openjfx-src", "[BLOCKED: COMPLEX_BUILD_DEPS: Java OpenJFX 27 source; requires gradle]"),
    2836: ("java11-openjfx-doc", "[BLOCKED: COMPLEX_BUILD_DEPS: Java 11 OpenJFX docs; requires gradle7]"),
    13139: ("java11-openjfx-doc", "[BLOCKED: COMPLEX_BUILD_DEPS: Java 11 OpenJFX docs; requires gradle7]"),
    2837: ("java11-openjfx-src", "[BLOCKED: COMPLEX_BUILD_DEPS: Java 11 OpenJFX source; requires gradle7]"),
    13140: ("java11-openjfx-src", "[BLOCKED: COMPLEX_BUILD_DEPS: Java 11 OpenJFX source; requires gradle7]"),
    7201: ("linux-libre-hardened-docs", "[BLOCKED: COMPLEX_BUILD_DEPS: Linux-libre hardened docs; kernel build + Sphinx/Rust]"),
    7515: ("linux-lts515-docs", "[BLOCKED: COMPLEX_BUILD_DEPS: Linux LTS 5.15.x docs; kernel build infrastructure]"),
    1593: ("linux-mainline-docs", "[BLOCKED: COMPLEX_BUILD_DEPS: Linux mainline kernel docs; kernel build + Sphinx/Rust]"),
    11796: ("linux-mainline-docs", "[BLOCKED: COMPLEX_BUILD_DEPS: Linux mainline kernel docs; duplicate of #1593]"),
    4701: ("monado-doc", "[BLOCKED: COMPLEX_BUILD_DEPS: OpenXR Monado docs; doxygen + many runtime deps]"),

    # ARCH_SPECIFIC
    3615: ("paru-static", "[BLOCKED: ARCH_SPECIFIC: static binary of paru AUR helper; wraps pacman]"),
    10393: ("nosystemd-boot-artix", "[BLOCKED: ARCH_SPECIFIC: Artix-specific systemd-boot replacement]"),
    9971: ("nextcloud-app-impersonate", "[BLOCKED: ARCH_SPECIFIC: Nextcloud PHP app; server config, not standalone package]"),

    # DKMS
    10154: ("ajantv2-dkms", "[BLOCKED: DKMS_KERNEL_MODULE: AJA NTV2 video capture; requires kernel source tree]"),

    # CROSS_COMPILE
    7617: ("sh-elf-newlib", "[BLOCKED: CROSS_COMPILE_UNSUPPORTED: SuperH embedded newlib; requires sh-elf cross-compiler]"),
}


def main():
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    # Build a set of all numbers to update
    all_nums = set(resolved.keys()) | set(blocked_updates.keys())
    changes = 0

    new_lines = []
    for line in lines:
        modified = False

        # Check for resolved packages → change to DONE
        for num, (name, status, reason) in resolved.items():
            pattern = r'^(\*\* )BLOCKED( ' + str(num) + r'\. ' + re.escape(name) + r').*'
            m = re.match(pattern, line)
            if m:
                new_line = f"** {status}{m.group(2)} {reason}\n"
                new_lines.append(new_line)
                modified = True
                changes += 1
                break

        if modified:
            continue

        # Check for blocked packages → update reason code
        for num, (name, reason) in blocked_updates.items():
            pattern = r'^(\*\* BLOCKED ' + str(num) + r'\. ' + re.escape(name) + r').*'
            m = re.match(pattern, line)
            if m:
                new_line = f"** BLOCKED {num}. {name} {reason}\n"
                new_lines.append(new_line)
                modified = True
                changes += 1
                break

        if not modified:
            new_lines.append(line)

    # Write atomically
    fd, tmp_path = tempfile.mkstemp(suffix=".org", dir=".")
    try:
        with os.fdopen(fd, "w") as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, ORG_FILE)
    except Exception:
        os.unlink(tmp_path)
        raise

    print(f"Updated {changes} lines in {ORG_FILE}")
    print(f"  Resolved: {len(resolved)} packages → DONE")
    print(f"  Updated reason codes: {changes - len(resolved)} packages")


if __name__ == "__main__":
    main()
