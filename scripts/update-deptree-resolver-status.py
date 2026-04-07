#!/usr/bin/env python3
"""Update todo_general_packages.org for the deptree-resolver run.

Reads the todo file, finds each BLOCKED entry matching a package from
our resolution list, and updates its status to DONE or keeps it BLOCKED
with updated reason codes.
"""

import re
import sys
import tempfile
import shutil
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TODO_FILE = REPO_ROOT / "todo_general_packages.org"

# Packages resolved as DONE with recipes or compat aliases
DONE_PACKAGES = {
    # Compat aliases for upstream Guix packages
    "doas": "DONE: COMPAT_ALIAS | doas -> opendoas (Guix upstream). Recipe in queue-20260407-deptree-resolver.scm.",
    "python-sse-starlette": "DONE: COMPAT_ALIAS | python-sse-starlette already exists in Guix upstream. Alias in queue-20260407-deptree-resolver.scm.",
    "qt5-connectivity": "DONE: COMPAT_ALIAS | qt5-connectivity -> qtconnectivity (Guix upstream). Recipe in queue-20260407-deptree-resolver.scm.",
    "qt5-scxml": "DONE: COMPAT_ALIAS | qt5-scxml -> qtscxml (Guix upstream). Already aliased in general-compat.scm.",
    # Already existing compat aliases
    "openssl-1.1": "DONE: COMPAT_ALIAS | Already aliased in general-compat.scm to upstream openssl.",
    "python312": "DONE: COMPAT_ALIAS | Already aliased in general-compat.scm to upstream python.",
    "xlibre-xserver-common-git": "DONE: COMPAT_ALIAS | Already aliased in general-compat.scm.",
    # Python packages with recipes
    "python-art": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-condense-json": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-m3u8": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-plyer": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-munge": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-wassima": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-pid": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-opencensus": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-materialyoucolor": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-inquirerpy": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm (includes python-pfzy dep).",
    "sqlite-utils": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-uv-dynamic-versioning": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "python-urllib3-future": "DONE: RECIPE_WRITTEN | pyproject-build-system recipe in queue-20260407-deptree-resolver.scm.",
    # C/C++ libraries and tools
    "libjodycode": "DONE: RECIPE_WRITTEN | gnu-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "grepcidr": "DONE: RECIPE_WRITTEN | gnu-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "libmodule": "DONE: RECIPE_WRITTEN | cmake-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "libuvc": "DONE: RECIPE_WRITTEN | cmake-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "auto-auto-complete": "DONE: RECIPE_WRITTEN | gnu-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "httpdirfs": "DONE: RECIPE_WRITTEN | meson-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "arduino-ctags": "DONE: RECIPE_WRITTEN | gnu-build-system recipe in queue-20260407-deptree-resolver.scm.",
    # Data/font/firmware packages
    "redhat-fonts": "DONE: RECIPE_WRITTEN | copy-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "deb2targz": "DONE: RECIPE_WRITTEN | trivial-build-system recipe (Perl script) in queue-20260407-deptree-resolver.scm.",
    "notify-send.sh": "DONE: RECIPE_WRITTEN | gnu-build-system recipe (shell scripts) in queue-20260407-deptree-resolver.scm.",
    "clash-geoip": "DONE: RECIPE_WRITTEN | trivial-build-system recipe (data file) in queue-20260407-deptree-resolver.scm.",
    "keychron-link-udev": "DONE: RECIPE_WRITTEN | trivial-build-system recipe (udev rule) in queue-20260407-deptree-resolver.scm.",
    "ghostty-shell-integration-nightly-bin": "DONE: RECIPE_WRITTEN | copy-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "ghostty-terminfo-nightly-bin": "DONE: RECIPE_WRITTEN | gnu-build-system recipe (tic install) in queue-20260407-deptree-resolver.scm.",
    "xone-dongle-firmware": "DONE: RECIPE_WRITTEN | trivial-build-system placeholder in queue-20260407-deptree-resolver.scm.",
    "xapp-thumbnailers-common": "DONE: RECIPE_WRITTEN | copy-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "cosmic-icons-git": "DONE: RECIPE_WRITTEN | copy-build-system recipe in queue-20260407-deptree-resolver.scm.",
    "xrizer-common": "DONE: RECIPE_WRITTEN | trivial-build-system (config files) in queue-20260407-deptree-resolver.scm.",
    # Binary packages
    "lianwalld-bin": "DONE: RECIPE_WRITTEN | trivial-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "dotnet-runtime-9.0-bin": "DONE: RECIPE_WRITTEN | gnu-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "logmein-hamachi": "DONE: RECIPE_WRITTEN | trivial-build-system placeholder in queue-20260407-deptree-resolver.scm.",
    "elephant": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-archlinuxpkgs-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-bluetooth-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-desktopapplications-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-menus-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-providerlist-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-runner-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-symbols-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-todo-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-unicode-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
    "elephant-websearch-bin": "DONE: RECIPE_WRITTEN | copy-build-system binary recipe in queue-20260407-deptree-resolver.scm.",
}

# Packages that remain BLOCKED with updated reasons
BLOCKED_UPDATES = {
    "archlinux-java-run": "BLOCKED: ARCH_SPECIFIC_TOOL | Arch Linux Java launcher depending on Arch-specific /usr/lib/jvm paths. Not applicable to Guix.",
    "yay": "BLOCKED: ARCH_SPECIFIC_TOOL | Pacman wrapper and AUR helper. Requires pacman and AUR infrastructure. Not applicable to Guix.",
    "paru": "BLOCKED: ARCH_SPECIFIC_TOOL | Feature-packed AUR helper. Requires pacman and AUR infrastructure. Not applicable to Guix.",
    "waydroid": "BLOCKED: MISSING_ANDROID_RUNTIME | Requires full Android system image, lxc, and custom kernel patches. Not feasible for Guix.",
    "hyprtoolkit-git": "BLOCKED: MISSING_GUIX_DEPS | Requires hyprutils, hyprwayland-scanner, aquamarine — Hyprland ecosystem libs not in Guix.",
    "wayfire": "BLOCKED: MISSING_GUIX_DEPS | Requires wf-config and specific wlroots version. Complex 3D compositor.",
    "llvm-libs-minimal-git": "BLOCKED: BUILD_COMPLEXITY | LLVM trunk git HEAD. Massive build (50+ GB RAM, hours of compile). Not suitable for reproducible packaging.",
    "mips64-linux-gnu-linux-api-headers": "BLOCKED: CROSS_COMPILATION_TARGET | MIPS64 kernel headers. Guix handles cross-compilation via its own cross-base module.",
    "gtk-sharp-2": "BLOCKED: MISSING_GUIX_DEPS | GTK2 C# bindings requiring Mono runtime which is not in Guix.",
    "foobar2000": "BLOCKED: PROPRIETARY_WINE_APP | Windows audio player requiring Wine. Complex Wine application packaging.",
    "libelectron": "BLOCKED: META_PACKAGE_COMPLEX | Meta-package for Electron. Electron build is extremely complex (~4GB source, custom Chromium).",
    "mozc": "BLOCKED: BUILD_COMPLEXITY | Google Japanese Input with Bazel build. Bazel integration with Guix is unsolved.",
    "xboxdrv": "BLOCKED: MISSING_GUIX_DEPS | Userspace Xbox gamepad driver. Needs dbus-glib and scons build system investigation.",
    "radicle-node": "BLOCKED: MISSING_RUST_CRATES | Rust p2p code collab stack. Many Rust crate deps not available in Guix.",
    "qtutilities-qt6": "BLOCKED: MISSING_GUIX_DEPS | Qt6 utilities requiring cpp-utilities (c++utilities) not in Guix.",
    "qmc2-common-git": "BLOCKED: BUILD_COMPLEXITY | Qt MAME frontend. Requires MAME headers and custom qmake build.",
    "vscodium-translucent": "BLOCKED: BUILD_COMPLEXITY | VSCodium with translucency patches. Requires full Electron/Chromium build pipeline.",
    "ros2-arch-deps": "BLOCKED: META_PACKAGE_COMPLEX | Meta-package for ROS2 build deps (44 deps). ROS2 ecosystem needs dedicated effort.",
    "sonic-win": "BLOCKED: BUILD_COMPLEXITY | KWin fork with 55 deps. Requires full KDE Plasma build infrastructure.",
    "rvgl-bin": "BLOCKED: PROPRIETARY_BINARY | Re-Volt rewrite. Proprietary game with custom license and complex runtime deps.",
    "tuxedo-drivers-dkms": "BLOCKED: KERNEL_MODULE_DKMS | TUXEDO keyboard kernel module. DKMS not applicable; Guix uses different kernel module mechanism.",
    "libfmod": "BLOCKED: PROPRIETARY_BINARY | FMOD audio engine. Proprietary binary-only distribution.",
    "tailscale": "BLOCKED: MISSING_GO_DEPS | Tailscale VPN. Go project requiring WireGuard + many Go modules not in Guix.",
    "tosu": "BLOCKED: PROPRIETARY_BINARY | osu! memory reader. Binary-only distribution, no source available.",
    "ruby-http-2": "BLOCKED: MISSING_RUBY_DEPS | Pure-Ruby HTTP/2 implementation. Requires Ruby packaging infrastructure.",
    "scala3": "BLOCKED: BUILD_COMPLEXITY | Scala 3 compiler. JVM project with sbt build, requires self-hosted compilation.",
    "kaitai-struct-compiler": "BLOCKED: BUILD_COMPLEXITY | Binary format compiler. JVM/Scala project with sbt build.",
    "java-service-wrapper": "BLOCKED: PROPRIETARY_LICENSE | Tanuki Java service wrapper with mixed GPL2 + proprietary community license.",
    "lib32-l-smash": "BLOCKED: LIB32_NOT_APPLICABLE | 32-bit MP4 muxer. lib32-* convention not applicable to Guix.",
    "libticables": "BLOCKED: MISSING_GUIX_DEPS | TI calculator cable library. Depends on deprecated libglade.",
    "libtifiles": "BLOCKED: MISSING_GUIX_DEPS | TI calculator file format library. Depends on blocked libticables.",
    "heidisql": "BLOCKED: PROPRIETARY_WINE_APP | Windows SQL tool requiring Wine.",
    "jre25-temurin": "BLOCKED: DOWNLOAD_FAILURE | Adoptium JRE 25 binaries not yet released (early access). URL returns 404.",
    "acestream-engine": "BLOCKED: PROPRIETARY_BINARY | Proprietary streaming engine requiring Python 2 (EOL).",
    "brscan4": "BLOCKED: PROPRIETARY_BINARY | Brother scanner SANE drivers. Proprietary binary with non-free license.",
    "upd72020x-fw": "BLOCKED: PROPRIETARY_FIRMWARE | Renesas USB 3.0 chipset firmware. Proprietary, redistribution restricted.",
    "wd719x-firmware": "BLOCKED: PROPRIETARY_FIRMWARE | Western Digital SCSI card firmware. Proprietary binary blobs.",
    "noto-fonts-emoji-blob": "BLOCKED: FONT_FORK_COMPLEX | Blob emoji variant. Requires custom emoji build pipeline from SVG sources.",
    "localepurge": "BLOCKED: ARCH_SPECIFIC_TOOL | Locale removal script. Relies on Arch/Debian filesystem layout. Guix handles locales via profiles.",
    "ttf-gabarito-git": "BLOCKED: DOWNLOAD_FAILURE | Font from git. No cached PKGBUILD and source URL unknown.",
    "cosmic-randr-git": "BLOCKED: MISSING_RUST_CRATES | COSMIC display output tool. Rust with cosmic-randr-shell crate not in Guix.",
    "zmusic": "BLOCKED: MISSING_GUIX_DEPS | GZDoom music library. Complex cmake with custom audio library integration.",
    "wl-screenrec": "BLOCKED: MISSING_RUST_CRATES | Wayland screen recorder. Mixed Rust/meson build with complex deps.",
    "gslapper": "BLOCKED: DOWNLOAD_FAILURE | Wayland wallpaper utility. GitHub releases not found (404).",
    "genders": "BLOCKED: DOWNLOAD_FAILURE | LLNL cluster config database. GitHub release URL not found (404).",
    "python-materialyoucolor": None,  # skip, it's DONE
}

# Remove entries that are actually DONE
for k in list(BLOCKED_UPDATES.keys()):
    if BLOCKED_UPDATES[k] is None:
        del BLOCKED_UPDATES[k]

HEADING_RE = re.compile(r"^(\*\*\s+)(BLOCKED)(\s+\d+\.\s+)(.+?)\s*$")


def main():
    text = TODO_FILE.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

    done_count = 0
    blocked_update_count = 0
    processed = set()

    out_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        m = HEADING_RE.match(line)
        if m:
            pkg_name = m.group(4).strip()
            pkg_lower = pkg_name.lower()

            if pkg_name in DONE_PACKAGES and pkg_name not in processed:
                # Change BLOCKED to DONE
                new_heading = f"{m.group(1)}DONE{m.group(3)}{pkg_name}\n"
                out_lines.append(new_heading)
                processed.add(pkg_name)
                i += 1

                # Update Status line (next few lines)
                status_updated = False
                while i < len(lines):
                    if lines[i].startswith("** "):
                        break  # hit next heading
                    if lines[i].strip().startswith("- Status:") and not status_updated:
                        out_lines.append(f"   - Status: {DONE_PACKAGES[pkg_name]}\n")
                        status_updated = True
                        i += 1
                        continue
                    if lines[i].strip().startswith("- TODO Status:"):
                        out_lines.append(f"   - TODO Status: DONE\n")
                        i += 1
                        continue
                    out_lines.append(lines[i])
                    i += 1
                done_count += 1
                continue

            elif pkg_name in BLOCKED_UPDATES and pkg_name not in processed:
                # Keep BLOCKED but update status reason
                out_lines.append(line)
                processed.add(pkg_name)
                i += 1

                status_updated = False
                while i < len(lines):
                    if lines[i].startswith("** "):
                        break
                    if lines[i].strip().startswith("- Status:") and not status_updated:
                        out_lines.append(f"   - Status: {BLOCKED_UPDATES[pkg_name]}\n")
                        status_updated = True
                        i += 1
                        continue
                    out_lines.append(lines[i])
                    i += 1
                blocked_update_count += 1
                continue

        out_lines.append(line)
        i += 1

    # Write atomically
    tmp = TODO_FILE.with_suffix(".org.tmp")
    tmp.write_text("".join(out_lines), encoding="utf-8")
    shutil.move(str(tmp), str(TODO_FILE))

    print(f"Updated {done_count} packages to DONE", file=sys.stderr)
    print(f"Updated {blocked_update_count} BLOCKED packages with new reasons", file=sys.stderr)
    print(f"Total processed: {len(processed)}", file=sys.stderr)

    # Report what was missed
    all_targets = set(DONE_PACKAGES.keys()) | set(BLOCKED_UPDATES.keys())
    missed = all_targets - processed
    if missed:
        print(f"Not found in todo file: {sorted(missed)}", file=sys.stderr)


if __name__ == "__main__":
    main()
