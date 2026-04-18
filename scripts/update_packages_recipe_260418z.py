#!/usr/bin/env python3
"""
Deterministic programmatic full-file transform for recipe-resolver-260418z.

Updates:
  1. todo_general_packages.org — status lines for all 38 packages
  2. packages.scm — new define-module block with re-exports
  3. general-compat.scm — use-module import + compat aliases + re-exports
"""

import re
import sys
import os
import shutil
import tempfile

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ORG_FILE = os.path.join(BASE, "todo_general_packages.org")
PACKAGES_SCM = os.path.join(BASE, "guix", "gaurix", "packages.scm")
COMPAT_SCM = os.path.join(BASE, "guix", "gaurix", "packages", "general-compat.scm")

RESOLVER_TAG = "recipe-resolver-260418z"

# 30 resolved packages: (name, version, build-system-desc, license, synopsis)
RESOLVED = [
    ("jdk21-temurin", "21.0.10+7", "copy-build-system", "gpl2+", "Eclipse Temurin JDK 21 binary"),
    ("java17-openjfx-bin", "17.0.12", "copy-build-system", "gpl2", "OpenJFX 17 prebuilt modules"),
    ("bindiff", "8", "copy-build-system", "asl2.0", "BinDiff binary analysis comparison tool"),
    ("electronwmd-bin", "0.5.2", "copy-build-system", "gpl2", "ElectronWMD Web MiniDisc client"),
    ("clash-verge-rev-autobuild-bin", "2.4.8", "copy-build-system", "gpl3", "Clash Verge Rev proxy GUI"),
    ("anime-games-launcher-bin", "2.0.0", "copy-build-system", "gpl3", "Anime games launcher"),
    ("plymouth-theme-mikuboot-git", "0.0.0-git", "copy-build-system", "expat", "Miku boot splash theme for Plymouth"),
    ("fonts-meta-base", "1", "trivial-build-system", "gpl3+", "Meta-package for base font collection"),
    ("libtrash", "3.9", "gnu-build-system", "gpl2+", "LD_PRELOAD trash library"),
    ("ntfsprogs-plus-git", "0.9.15", "gnu-build-system", "gpl2+", "Enhanced NTFS utilities"),
    ("scolorpicker-legacy", "1.2.1", "cmake-build-system", "isc", "Simple color picker"),
    ("gpgfrontend", "2.1.10", "cmake-build-system", "gpl3+", "OpenPGP crypto tool GUI"),
    ("cervisia", "25.04.3", "cmake-build-system", "gpl2+", "KDE CVS frontend"),
    ("hyprqt6engine-git", "0.0.0-git", "cmake-build-system", "bsd-3", "Hyprland Qt6 QPA backend"),
    ("libresplit-git", "0.0.0-git", "meson-build-system", "gpl3+", "Speedrun split timer"),
    ("linux-enable-ir-emitter", "6.1.2", "meson-build-system", "expat", "Enable IR emitters for face recognition"),
    ("gpu-screen-recorder-git", "5.12.4", "meson-build-system", "gpl3", "GPU-accelerated screen recorder"),
    ("libinput-no-gestures", "1.29.0", "meson-build-system", "expat", "Libinput with gestures disabled"),
    ("python-aioice", "0.10.2", "pyproject-build-system", "bsd-3", "ICE protocol for asyncio"),
    ("taskfile-to-tasks-python-git", "1.0.2", "pyproject-build-system", "expat", "Taskfile to VS Code tasks converter"),
    ("green-recorder", "3.2.10", "pyproject-build-system", "gpl3", "Wayland/X11 desktop recorder"),
    ("sot", "6.0.1", "pyproject-build-system", "expat", "Stack Overflow in terminal"),
    ("marimo", "0.23.1", "pyproject-build-system", "asl2.0", "Reactive Python notebook"),
    ("srtodo-git", "0.0.0-git", "copy-build-system", "expat", "Simple Rust todo manager"),
    ("btrfs-desktop-notification-git", "0.0.0-git", "copy-build-system", "gpl3", "Btrfs usage desktop notifications"),
    ("lunarvim-git", "1.4.0", "copy-build-system", "gpl3", "IDE layer for Neovim"),
    ("go-prism", "1.3.0", "go-build-system", "expat", "Syntax highlighting for Go"),
    ("gnome-shell-extension-space-bar-git", "37", "copy-build-system", "gpl3+", "GNOME Shell workspace indicator"),
    ("python-zxing-cpp", "3.0.0", "pyproject-build-system", "asl2.0", "Python bindings for zxing-cpp"),
    ("hid-velocityone-multi-shift", "0.1.0", "pyproject-build-system", "gpl2+", "Turtle Beach VelocityOne Multi Shift HID driver"),
]

# 8 blocked packages: (name, reason_code, detail)
BLOCKED = [
    ("smpeg0", "SDL1_LEGACY", "SDL 1.x MPEG library; source only via icculus.org SVN (likely offline)"),
    ("waybar-updates", "ARCH_SPECIFIC_DEPS", "depends on pacman-contrib (Arch Linux-specific)"),
    ("moomoo", "PROPRIETARY_PLATFORM", "proprietary Futu trading platform binary"),
    ("fbthrift", "COMPLEX_DEPS", "needs fizz/folly/mvfst Facebook C++ libs not in Guix"),
    ("dopamine", "ELECTRON_NPM_COMPLEX", "Electron37 + nvm + npm with 200+ node_modules"),
    ("ytify", "NODE_NPM_COMPLEX", "Node.js + npm web app build"),
    ("rofi-games", "CARGO_DEPS_NEEDED", "Rust/Cargo + just build runner + crate enumeration needed"),
    ("hypruler", "CARGO_DEPS_NEEDED", "Rust/Cargo screen ruler, needs crate enumeration"),
]

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


# =====================================================================
# 1. Update todo_general_packages.org
# =====================================================================
def update_org():
    print(f"[1/3] Updating {ORG_FILE} ...")
    with open(ORG_FILE, "r") as f:
        lines = f.readlines()

    resolved_map = {r[0]: r for r in RESOLVED}
    blocked_map = {b[0]: b for b in BLOCKED}
    all_names = set(RESOLVED_NAMES + BLOCKED_NAMES)

    # Build index: package name -> headline line number (0-based)
    pkg_lines = {}
    headline_re = re.compile(r"^\*\* (?:FAILED|DONE) \d+\.\s+(\S+)")
    for i, line in enumerate(lines):
        m = headline_re.match(line)
        if m:
            name = m.group(1)
            if name in all_names and name not in pkg_lines:
                pkg_lines[name] = i

    missing = all_names - set(pkg_lines.keys())
    if missing:
        print(f"  WARNING: Could not find entries for: {missing}")

    # Process in reverse order so line indices don't shift
    updates = sorted(pkg_lines.items(), key=lambda x: x[1], reverse=True)

    for name, idx in updates:
        headline = lines[idx]

        if name in resolved_map:
            _, ver, bsys, lic, syn = resolved_map[name]
            # Change ** FAILED to ** DONE
            lines[idx] = headline.replace("** FAILED", "** DONE", 1)
            # Build new status line
            status_line = (
                f"   - Status: DONE: NEEDS_RECIPE_DESIGN resolved — recipe in "
                f"{RESOLVER_TAG}.scm ({name} v{ver}, {bsys}, {syn}, {lic}) "
                f"({RESOLVER_TAG})\n"
            )
        elif name in blocked_map:
            _, reason, detail = blocked_map[name]
            status_line = (
                f"   - Status: BLOCKED: NEEDS_RECIPE_DESIGN_EXHAUSTED — "
                f"{reason}: {detail} ({RESOLVER_TAG})\n"
            )
        else:
            continue

        # Find insertion point: after the last "   - " line in the entry
        insert_at = idx + 1
        while insert_at < len(lines):
            l = lines[insert_at]
            if l.startswith("** ") or l.startswith("* "):
                break
            if l.strip() == "":
                # blank line might be end of entry or just spacing
                # check if next non-blank is a new headline
                break
            insert_at += 1

        # Insert status line just before the end of this entry
        lines.insert(insert_at, status_line)

    atomic_write(ORG_FILE, "".join(lines))
    found = len(pkg_lines)
    print(f"  Updated {found}/{len(all_names)} entries ({len(RESOLVED)} resolved, {len(BLOCKED)} blocked)")


# =====================================================================
# 2. Update packages.scm
# =====================================================================
def update_packages_scm():
    print(f"[2/3] Updating {PACKAGES_SCM} ...")
    with open(PACKAGES_SCM, "r") as f:
        content = f.read()

    exports = "\n".join(f"               {name}" for name in RESOLVED_NAMES)
    block = (
        f"\n;; {RESOLVER_TAG} (30 NRD resolved, 8 BLOCKED)\n"
        f"(define-module (gaurix packages)\n"
        f"  #:use-module (gaurix packages {RESOLVER_TAG})\n"
        f"  #:re-export (\n"
        f"{exports}\n"
        f"               ))\n"
    )

    content = content.rstrip("\n") + "\n" + block
    atomic_write(PACKAGES_SCM, content)
    print(f"  Appended define-module block with {len(RESOLVED_NAMES)} re-exports")


# =====================================================================
# 3. Update general-compat.scm
# =====================================================================
def update_compat_scm():
    print(f"[3/3] Updating {COMPAT_SCM} ...")
    with open(COMPAT_SCM, "r") as f:
        content = f.read()

    # Add #:use-module line after the last recipe-resolver use-module
    # Find the line `#:use-module (gaurix packages recipe-resolver-260418y)`
    # and insert after it
    import_line = f"  #:use-module (gaurix packages {RESOLVER_TAG})"
    last_recipe_re = re.compile(
        r"(  #:use-module \(gaurix packages recipe-resolver-260418y\))"
    )
    if last_recipe_re.search(content):
        content = last_recipe_re.sub(
            r"\1\n" + import_line,
            content,
        )
    else:
        print("  WARNING: Could not find recipe-resolver-260418y import anchor")
        # Fallback: insert before first #:use-module (guix
        content = content.replace(
            "  #:use-module (guix packages)",
            import_line + "\n  #:use-module (guix packages)",
            1,
        )

    # Append compat aliases at end of file
    aliases = []
    aliases.append(f"\n\n;;; --- {RESOLVER_TAG}: 30 compat aliases ---\n")
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


# =====================================================================
# Main
# =====================================================================
if __name__ == "__main__":
    update_org()
    update_packages_scm()
    update_compat_scm()
    print("\nAll updates complete.")
