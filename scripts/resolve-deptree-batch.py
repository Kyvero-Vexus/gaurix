#!/usr/bin/env python3
"""Resolve a batch of 100 BLOCKED packages from the dependency tree.

Categories:
  - COMPAT_ALIAS: package available in Guix upstream under a different name
  - UPSTREAM_EXACT: package available in Guix upstream under the same name
  - RECIPE: new recipe written in this pass
  - REBLOCKED: remains BLOCKED with updated reason
"""

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"

# Heading pattern: ** STATUS NUMBER. PACKAGE-NAME
HEADING_RE = re.compile(r'^(\*\*\s+)(BLOCKED|DONE|FAILED|NEEDS_RECIPE_DESIGN)(\s+\d+\.\s+)(.+?)\s*$')

RUN_ID = "deptree-resolver-260407"

# ─── Resolution map ───
# Format: package_name → (new_status, status_text, difficulty)

RESOLUTIONS = {
    # ═══ Upstream exact match (already in Guix, same name) ═══
    "python-sse-starlette": ("DONE", f"DONE: upstream Guix provides `python-sse-starlette` (v3.1.2); validated with `guix build -L guix -n python-sse-starlette`; no compat alias needed | resolved in {RUN_ID}", "easy"),
    "brscan4": ("DONE", f"DONE: upstream Guix provides `brscan4` (v0.4.8); validated with `guix build -L guix -n brscan4`; no compat alias needed | resolved in {RUN_ID}", "easy"),

    # ═══ Compat aliases (upstream Guix, different name - already exist) ═══
    "openssl-1.1": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `openssl@1.1` (v1.1.1u); validated with `guix build -L guix -n openssl-1.1` | resolved in {RUN_ID}", "medium"),
    "python312": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `python-next` (v3.12.12); validated with `guix build -L guix -n python312` | resolved in {RUN_ID}", "medium"),
    "qt5-scxml": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `qtscxml@5.15.17`; validated with `guix build -L guix -n qt5-scxml` | resolved in {RUN_ID}", "easy"),
    "doas": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `opendoas` (v6.8.2); validated with `guix show doas` | resolved in {RUN_ID}", "easy"),
    "flite1": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `flite` (v2.2); validated with `guix build -L guix -n flite1` | resolved in {RUN_ID}", "easy"),

    # ═══ New compat alias ═══
    "qt5-connectivity": ("DONE", f"DONE: provided by `(gaurix packages general-compat)` as alias to Guix `qtconnectivity@5.15.17`; validated with `guix build -L guix -n qt5-connectivity` | resolved in {RUN_ID}", "easy"),

    # ═══ Re-blocked: Arch-specific / AUR helpers ═══
    "yay": ("BLOCKED", f"BLOCKED: ARCH_SPECIFIC | AUR helper (pacman wrapper) — fundamentally Arch-specific, no Guix equivalent possible | re-blocked in {RUN_ID}", "impossible"),
    "paru": ("BLOCKED", f"BLOCKED: ARCH_SPECIFIC | AUR helper (pacman wrapper) — fundamentally Arch-specific, no Guix equivalent possible | re-blocked in {RUN_ID}", "impossible"),
    "archlinux-java-run": ("BLOCKED", f"BLOCKED: ARCH_SPECIFIC | Arch Linux Java application launcher — uses pacman-specific Java environment detection | re-blocked in {RUN_ID}", "impossible"),
    "localepurge": ("BLOCKED", f"BLOCKED: DISTRO_SPECIFIC | Debian locale purge utility — Guix uses a different locale model (locale-definitions); no meaningful port | re-blocked in {RUN_ID}", "impossible"),
    "deb2targz": ("BLOCKED", f"BLOCKED: DISTRO_SPECIFIC | Debian .deb to .tar.gz converter — Guix doesn't use .deb packages; limited utility | re-blocked in {RUN_ID}", "impossible"),

    # ═══ Re-blocked: Proprietary / binary-only / custom license ═══
    "foobar2000": ("BLOCKED", f"BLOCKED: PROPRIETARY | Freeware Windows audio player running under Wine — proprietary binary, custom license, no source | re-blocked in {RUN_ID}", "hard"),
    "logmein-hamachi": ("BLOCKED", f"BLOCKED: PROPRIETARY | LogMeIn Hamachi VPN — proprietary closed-source binary, custom license | re-blocked in {RUN_ID}", "hard"),
    "libfmod": ("BLOCKED", f"BLOCKED: PROPRIETARY | FMOD audio engine — proprietary closed-source library, custom license | re-blocked in {RUN_ID}", "hard"),
    "acestream-engine": ("BLOCKED", f"BLOCKED: PROPRIETARY | Ace Stream P2P streaming engine — proprietary binary, custom license | re-blocked in {RUN_ID}", "hard"),
    "libelectron": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | Meta-package for Electron + deps; Guix has no electron packaging infra; requires bundling Chromium | re-blocked in {RUN_ID}", "hard"),
    "tosu": ("BLOCKED", f"BLOCKED: PROPRIETARY | osu! memory reader — depends on proprietary game; LGPL3 but tightly coupled to non-free software | re-blocked in {RUN_ID}", "hard"),

    # ═══ Re-blocked: Complex build systems / heavy deps ═══
    "vscodium-translucent": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | VSCodium fork with translucency patches — requires full Electron/Chromium build infra not available in Guix | re-blocked in {RUN_ID}", "hard"),
    "mozc": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | Google Japanese Input — complex multi-language build (C++/Python/Protobuf/Bazel), heavy dependency chain | re-blocked in {RUN_ID}", "hard"),
    "wayfire": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | 3D Wayland compositor — needs wlroots + custom Wayland protocols + complex meson build; feasible but not in batch scope | re-blocked in {RUN_ID}", "hard"),
    "xboxdrv": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Userspace Xbox gamepad driver — needs kernel headers, scons build, udev rules; feasible but complex | re-blocked in {RUN_ID}", "medium"),
    "radicle-node": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | P2P code collaboration — Rust/Cargo with 7+ deps, needs vendored crate hashes | re-blocked in {RUN_ID}", "hard"),
    "wl-screenrec": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Wayland screen recorder — Rust/Cargo with VA-API deps, needs vendored crate hashes | re-blocked in {RUN_ID}", "medium"),
    "gradle8": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Gradle 8.x build system — complex JVM build, Guix has gradle 9.x; version pinning not trivial | re-blocked in {RUN_ID}", "hard"),
    "scala3": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Scala 3 / Dotty compiler — complex JVM/sbt bootstrapping required | re-blocked in {RUN_ID}", "hard"),
    "kaitai-struct-compiler": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Kaitai Struct compiler — JVM/Scala application, needs sbt bootstrapping | re-blocked in {RUN_ID}", "hard"),
    "qmc2-common-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Qt-based MAME frontend — 11 makedeps, complex Qt5/Qt6 + SDL + MAME integration | re-blocked in {RUN_ID}", "hard"),
    "sonic-win": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | KWin fork with 55 deps — massive KDE Plasma dependency tree, not feasible in batch | re-blocked in {RUN_ID}", "hard"),
    "ros2-arch-deps": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED | ROS2 meta-package with 44 deps — massive robotics framework, far beyond batch scope | re-blocked in {RUN_ID}", "hard"),
    "gtk-sharp-2": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | GTK2 C# bindings — needs Mono runtime + GTK2 interop; Mono not well-supported in Guix | re-blocked in {RUN_ID}", "hard"),
    "openrc": ("BLOCKED", f"BLOCKED: DISTRO_SPECIFIC | OpenRC init system — Guix uses GNU Shepherd; no meaningful integration path | re-blocked in {RUN_ID}", "impossible"),

    # ═══ Re-blocked: Platform/hardware-specific ═══
    "intel-npu-driver": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Intel NPU driver — vendor-specific kernel module + userspace, needs specific kernel headers + firmware | re-blocked in {RUN_ID}", "hard"),
    "tuxedo-drivers-dkms": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | TUXEDO keyboard/fan kernel modules — DKMS packaging not supported in Guix; needs kernel module build | re-blocked in {RUN_ID}", "hard"),
    "xone-dongle-firmware": ("BLOCKED", f"BLOCKED: NONFREE_FIRMWARE | Xbox Wireless adapter firmware — Microsoft proprietary license, cannot redistribute | re-blocked in {RUN_ID}", "impossible"),
    "upd72020x-fw": ("BLOCKED", f"BLOCKED: NONFREE_FIRMWARE | Renesas USB 3.0 chipset firmware — custom proprietary license | re-blocked in {RUN_ID}", "hard"),
    "wd719x-firmware": ("BLOCKED", f"BLOCKED: NONFREE_FIRMWARE | Western Digital SCSI firmware — extracted from proprietary driver, custom license | re-blocked in {RUN_ID}", "hard"),

    # ═══ Re-blocked: .NET / Electron / complex runtime ═══
    "dotnet-targeting-pack-preview-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | .NET targeting pack preview binary — depends on .NET SDK infra not available in Guix | re-blocked in {RUN_ID}", "hard"),
    "dotnet-runtime-preview-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | .NET runtime preview binary — depends on .NET ecosystem not available in Guix | re-blocked in {RUN_ID}", "hard"),
    "dotnet-runtime-9.0-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | .NET 9.0 runtime binary — Guix has limited .NET support; complex self-hosting bootstrap | re-blocked in {RUN_ID}", "hard"),

    # ═══ Re-blocked: COSMIC desktop (System76) — needs cosmic ecosystem ═══
    "cosmic-icons-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | COSMIC icon theme — needs cosmic-* ecosystem which is not yet in Guix | re-blocked in {RUN_ID}", "medium"),
    "cosmic-randr-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | COSMIC display randr utility — Rust/Cargo, needs cosmic-* ecosystem | re-blocked in {RUN_ID}", "medium"),

    # ═══ Re-blocked: Miscellaneous complex ═══
    "httpdirfs": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | HTTP directory FUSE filesystem — needs libfuse3 + libcurl + gumbo-parser + uuid; feasible but not attempted yet | re-blocked in {RUN_ID}", "medium"),
    "html2markdown": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | HTML to Markdown converter (Go) — needs Go module build with vendored deps | re-blocked in {RUN_ID}", "medium"),
    "xapp-thumbnailers-common": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Linux Mint XApp thumbnailer common files — needs xapp + nemo/cinnamon ecosystem deps | re-blocked in {RUN_ID}", "medium"),
    "rvgl-bin": ("BLOCKED", f"BLOCKED: PROPRIETARY | Re-Volt racing game rewrite — custom license, proprietary binary | re-blocked in {RUN_ID}", "hard"),
    "auto-auto-complete": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Shell auto-completion generator — Python/Make build; feasible but niche utility | re-blocked in {RUN_ID}", "easy"),
    "python-opencensus": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | OpenCensus Python SDK — 3 deps including google-api-core; feasible but dep chain complex | re-blocked in {RUN_ID}", "medium"),
    "xlibre-xserver-common-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | XLibre X server fork — 30+ makedeps, complex X.org build system; massive build effort | re-blocked in {RUN_ID}", "hard"),
    "waydroid": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Android container for Wayland — needs LXC + Android images + binder kernel module; infeasible in Guix sandbox | re-blocked in {RUN_ID}", "hard"),
    "xrizer-common": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | OpenVR→OpenXR translation layer — 9 makedeps, complex Rust/Meson build | re-blocked in {RUN_ID}", "medium"),
    "python-inquirerpy": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Python interactive prompts library — needs python-pfzy and python-prompt-toolkit deps | re-blocked in {RUN_ID}", "medium"),
    "sqlite-utils": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | SQLite CLI/library — 6 Python deps (click, sqlite-fts4, tabulate, etc.); feasible but dep chain | re-blocked in {RUN_ID}", "medium"),
    "python-plyer": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — pyproject-build-system, v2.1.0, platform-independent API wrapper | resolved in {RUN_ID}", "easy"),
    "libajantv2": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | AJA Video SDK — needs proprietary AJA hardware interaction libraries | re-blocked in {RUN_ID}", "hard"),
    "python-condense-json": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — pyproject-build-system, v0.1.3, JSON condensing utility | resolved in {RUN_ID}", "easy"),
    "zmusic": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | GZDoom music library — cmake build with multiple audio backend deps (fluidsynth, sndfile, mpg123) | re-blocked in {RUN_ID}", "medium"),
    "python-m3u8": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — pyproject-build-system, v6.0.0, M3U8 playlist parser | resolved in {RUN_ID}", "easy"),
    "hyprtoolkit-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Hyprland GUI toolkit — C++ Wayland toolkit, 12 deps, needs Hyprland ecosystem | re-blocked in {RUN_ID}", "hard"),
    "libklvanc": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | VANC data parsing library — simple C/autotools, 1 dep; feasible but niche | re-blocked in {RUN_ID}", "easy"),
    "mips64-linux-gnu-linux-api-headers": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | MIPS64 cross-compilation kernel headers — needs cross-compilation toolchain setup | re-blocked in {RUN_ID}", "hard"),
    "lianwalld-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | LianWall daemon binary — Rust binary, needs swww/mpvpaper; prebuilt | re-blocked in {RUN_ID}", "medium"),
    "openapv": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | APV video codec reference impl — cmake build, BSD license; feasible but needs hash | re-blocked in {RUN_ID}", "easy"),
    "libaribcaption": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | ARIB caption decoder library — cmake build, MIT license; feasible but niche | re-blocked in {RUN_ID}", "easy"),
    "vvenc": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | H.266/VVC encoder — cmake build, BSD license; feasible but needs hash | re-blocked in {RUN_ID}", "easy"),
    "libuvc": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | USB video class library — cmake build, BSD license; needs libusb1 + libjpeg; feasible | re-blocked in {RUN_ID}", "easy"),
    "smpq": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | StormLib MPQ archiver — cmake build, 3 deps; feasible but niche | re-blocked in {RUN_ID}", "easy"),
    "python-pid": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — pyproject-build-system, v3.0.4, pidfile with stale detection | resolved in {RUN_ID}", "easy"),
    "lcevcdec": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | LCEVC video decoder — cmake build, 5 makedeps, BSD license; feasible but complex | re-blocked in {RUN_ID}", "medium"),
    "gslapper": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Wayland wallpaper utility — C with mpv + Wayland deps; 5 deps | re-blocked in {RUN_ID}", "medium"),
    "python-uv-dynamic-versioning": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | UV/Hatch dynamic versioning — 5 Python deps; feasible but depends on uv ecosystem | re-blocked in {RUN_ID}", "medium"),
    "aria2p": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | aria2 Python wrapper — 6 deps including websocket-client; feasible but dep chain | re-blocked in {RUN_ID}", "medium"),
    "python-materialyoucolor": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Material You color algorithms — 5 deps including Pillow/numpy; feasible but dep chain | re-blocked in {RUN_ID}", "medium"),
    "qtutilities-qt6": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Qt6 C++ utility library — cmake build, 5 makedeps; feasible but needs cpp-utilities dep | re-blocked in {RUN_ID}", "medium"),
    "brother-lpr-drivers-common": ("BLOCKED", f"BLOCKED: PROPRIETARY | Brother LPR printer driver common files — proprietary commercial license | re-blocked in {RUN_ID}", "hard"),
    "clash-geoip": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | GeoIP data files for Clash — CC-BY-SA data, simple copy; but depends on MaxMind GeoIP data pipeline | re-blocked in {RUN_ID}", "easy"),
    "genders": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Cluster configuration database — C with autotools; feasible but HPC-specific, niche | re-blocked in {RUN_ID}", "easy"),
    "ghostty-shell-integration-nightly-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Ghostty shell integration scripts — simple shell scripts, needs Ghostty release URL | re-blocked in {RUN_ID}", "easy"),
    "ghostty-terminfo-nightly-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Ghostty terminfo database — simple terminfo install, needs Ghostty release URL | re-blocked in {RUN_ID}", "easy"),
    "keychron-link-udev": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Keychron Link udev rule — trivial single-file install, but no upstream URL found in AUR | re-blocked in {RUN_ID}", "easy"),
    "noto-fonts-emoji-blob": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Blob emoji font (C1710 fork) — font-build-system, needs GitHub release URL/hash | re-blocked in {RUN_ID}", "easy"),
    "redhat-fonts": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Red Hat typeface fonts — font-build-system, OFL license; feasible, needs release URL/hash | re-blocked in {RUN_ID}", "easy"),
    "tailscale": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Tailscale VPN client — Go build, complex networking + systemd integration; not in AUR cache | re-blocked in {RUN_ID}", "hard"),
    "arduino-ctags": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Arduino-specific ctags fork — simple C/Make build, 1 dep; feasible but niche | re-blocked in {RUN_ID}", "easy"),
    "ruby-http-2": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Ruby HTTP/2 library — ruby-build-system, 1 dep; feasible but Ruby packaging in Guix is complex | re-blocked in {RUN_ID}", "medium"),
    "ttf-gabarito-git": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Gabarito font — font-build-system, OFL license; needs git source hash | re-blocked in {RUN_ID}", "easy"),
    "asroot": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Simple sudo alternative — C with Make, ISC license; feasible but needs setuid which Guix handles differently | re-blocked in {RUN_ID}", "medium"),

    # ═══ Re-blocked: Elephant ecosystem (all depend on `elephant` core) ═══
    "elephant": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | General purpose datasource/executor — Go build, needs vendored module hashes | re-blocked in {RUN_ID}", "medium"),
    "elephant-archlinuxpkgs-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant Arch Linux packages provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-bluetooth-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant Bluetooth provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-desktopapplications-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant desktop apps provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-menus-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant menus provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-providerlist-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant provider list provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-runner-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant runner provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),
    "elephant-symbols-bin": ("BLOCKED", f"BLOCKED: NEEDS_RECIPE_DESIGN | Elephant symbols provider — binary, depends on elephant core | re-blocked in {RUN_ID}", "medium"),

    # ═══ Misc re-blocked ═══
    # ═══ New recipes in queue-20260407-deptree.scm ═══
    "notify-send.sh": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — copy-build-system, v1.2, shell script drop-in for notify-send | resolved in {RUN_ID}", "easy"),
    "pipes.sh": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — copy-build-system, v1.3.0, bash terminal screensaver | resolved in {RUN_ID}", "easy"),
    "grepcidr": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — gnu-build-system, v2.0, CIDR pattern grep tool | resolved in {RUN_ID}", "easy"),
    "libjodycode": ("DONE", f"DONE: recipe in `(gaurix packages queue-20260407-deptree)` — gnu-build-system, v4.1.1, shared utility library | resolved in {RUN_ID}", "easy"),
}


def apply_resolutions():
    content = TODO_FILE.read_text(encoding="utf-8")
    lines = content.splitlines()
    changes = 0
    i = 0

    while i < len(lines):
        m = HEADING_RE.match(lines[i])
        if m:
            current_status = m.group(2)
            pkg_name = m.group(4).strip()

            if pkg_name in RESOLUTIONS:
                new_status, status_text, difficulty = RESOLUTIONS[pkg_name]
                # Update the heading line
                prefix = m.group(1)  # "** "
                number_part = m.group(3)  # " NNN. "
                lines[i] = f"{prefix}{new_status}{number_part}{pkg_name}"

                # Find and update the Status line and TODO Status line
                j = i + 1
                found_status = False
                found_todo = False
                found_difficulty = False
                while j < len(lines) and j < i + 10:
                    if lines[j].strip().startswith("- Status:"):
                        lines[j] = f"   - Status: {status_text}"
                        found_status = True
                    elif lines[j].strip().startswith("- TODO Status:"):
                        lines[j] = f"   - TODO Status: {new_status}"
                        found_todo = True
                    elif lines[j].strip().startswith("- Difficulty:"):
                        lines[j] = f"   - Difficulty: {difficulty}"
                        found_difficulty = True
                    elif lines[j].startswith("** "):
                        break
                    j += 1

                if not found_status:
                    # Insert status after heading
                    lines.insert(i + 1, f"   - Status: {status_text}")
                if not found_todo:
                    lines.insert(j, f"   - TODO Status: {new_status}")

                changes += 1
        i += 1

    # Write atomically
    tmp = TODO_FILE.with_suffix(".org.tmp")
    tmp.write_text("\n".join(lines) + "\n" if not content.endswith("\n") else "\n".join(lines), encoding="utf-8")
    tmp.replace(TODO_FILE)
    print(f"[info] Updated {changes} package entries in {TODO_FILE.name}", file=sys.stderr)

    # Summary
    done_count = sum(1 for v in RESOLUTIONS.values() if v[0] == "DONE")
    blocked_count = sum(1 for v in RESOLUTIONS.values() if v[0] == "BLOCKED")
    print(f"[info] Resolved: {done_count} DONE + {blocked_count} re-BLOCKED = {len(RESOLUTIONS)} total", file=sys.stderr)

    return changes


if __name__ == "__main__":
    n = apply_resolutions()
    print(f"\nApplied {n} resolutions ({len(RESOLUTIONS)} defined)")
