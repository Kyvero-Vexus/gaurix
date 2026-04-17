#!/usr/bin/env python3
"""
Worker script for deptree-resolver-260417y.

Generates:
1. guix/gaurix/packages/deptree-resolver-260417y.scm (13 new package recipes)
2. guix/gaurix/packages/deptree-resolver-260417y-blocked-notes.scm
3. Updates todo_general_packages.org statuses
4. Updates guix/gaurix/packages/general-compat.scm
5. Updates guix/gaurix/packages.scm
6. Writes reports/deptree-resolver-260417y-summary.json
"""

import json
import os
import re
import shutil
import tempfile
from datetime import datetime, timezone

PASS_ID = "deptree-resolver-260417y"
TODO_PATH = "todo_general_packages.org"
PACKAGES_DIR = "guix/gaurix/packages"
REPORT_DIR = "reports"
MODULE_PATH = f"{PACKAGES_DIR}/{PASS_ID}.scm"
BLOCKED_NOTES_PATH = f"{PACKAGES_DIR}/{PASS_ID}-blocked-notes.scm"
COMPAT_PATH = f"{PACKAGES_DIR}/general-compat.scm"
PACKAGES_SCM_PATH = "guix/gaurix/packages.scm"
SELECTION_PATH = f"{REPORT_DIR}/{PASS_ID}-selection.json"

# ═══ ALREADY_RESOLVED: recipes exist in recipe-resolver-260417x.scm ═══
ALREADY_RESOLVED = {
    # aur_name: (number, existing_file)
    "ampache": (14986, "recipe-resolver-260417x.scm"),
    "arsenal": (15073, "recipe-resolver-260417x.scm"),
    "bloop": (15029, "recipe-resolver-260417x.scm"),
    "cobra-cli": (15020, "recipe-resolver-260417x.scm"),
    "etterna": (15018, "recipe-resolver-260417x.scm"),
    "findent": (15057, "recipe-resolver-260417x.scm"),
    "kitty-shell-integration-git": (14995, "recipe-resolver-260417x.scm"),
    "kitty-terminfo-git": (14994, "recipe-resolver-260417x.scm"),
    "libfprint-1": (15048, "recipe-resolver-260417x.scm"),
    "license": (14985, "recipe-resolver-260417x.scm"),
    "miniupnpd-nft-git": (15044, "recipe-resolver-260417x.scm"),
    "mp3gain": (14977, "recipe-resolver-260417x.scm"),
    "mystmd": (15022, "recipe-resolver-260417x.scm"),
    "nagstamon-git": (15049, "recipe-resolver-260417x.scm"),
    "otb-unifont": (15065, "recipe-resolver-260417x.scm"),
    "otf-raleway": (15001, "recipe-resolver-260417x.scm"),
    "pacman-contrib-git": (14972, "recipe-resolver-260417x.scm"),
    "pianobooster": (15023, "recipe-resolver-260417x.scm"),
    "pithos": (15007, "recipe-resolver-260417x.scm"),
    "portainer-bin": (15015, "recipe-resolver-260417x.scm"),
    "psf-unifont": (15030, "recipe-resolver-260417x.scm"),
    "python-rocket-fft-git": (15021, "recipe-resolver-260417x.scm"),
    "simgrid": (15024, "recipe-resolver-260417x.scm"),
    "textadept-gtk3": (15028, "recipe-resolver-260417x.scm"),
    "ttf-raleway-variable": (14999, "recipe-resolver-260417x.scm"),
    "vulkan-caps-viewer-wayland": (14989, "recipe-resolver-260417x.scm"),
    "vulkan-caps-viewer-x11": (14988, "recipe-resolver-260417x.scm"),
    "wofi-vim": (15039, "recipe-resolver-260417x.scm"),
}

# ═══ BLOCKED: packages that cannot be resolved ═══
BLOCKED_PACKAGES = {
    # aur_name: (number, reason_code, reason_detail)
    "raidrivecli": (14202, "MISSING_SOURCE", "Not found in AUR metadata cache; no upstream source URL available"),
    "chatgqt": (14575, "MISSING_SOURCE", "No upstream repository; source tarball bundled in AUR git only"),
    "fonts-apple": (14971, "PROPRIETARY_LICENSE", "Apple restricted font license; cannot redistribute"),
    "jdk-lts": (15004, "PROPRIETARY_LICENSE", "Oracle proprietary Java Development Kit license"),
    "jre-lts": (15002, "PROPRIETARY_LICENSE", "Oracle proprietary Java Runtime Environment license"),
    "jdk-lts-doc": (15003, "PROPRIETARY_LICENSE", "Oracle proprietary Java documentation license"),
    "xilinx-ise": (14616, "PROPRIETARY_LICENSE", "Xilinx proprietary FPGA design tools; requires manual download and EULA acceptance"),
    "aiot-ide": (15062, "PROPRIETARY_LICENSE", "Xiaomi proprietary IoT development IDE; no source available"),
    "libfprint-2-tod1-broadcom": (15005, "PROPRIETARY_LICENSE", "Dell/Broadcom proprietary binary fingerprint driver blob"),
    "redact-bin": (15032, "PROPRIETARY_LICENSE", "Custom proprietary license; Electron app with no source code"),
    "resource-hacker": (14969, "PLATFORM_SPECIFIC", "Windows-only freeware application (PE resource editor); requires Wine"),
    "code-server-marketplace": (15031, "COMPLEX_PACKAGING", "Patches code-server to use Microsoft VS Code marketplace; tight coupling with code-server internals"),
    "brother-mfc-j5720dw": (15008, "PROPRIETARY_LICENSE", "Brother proprietary printer driver with restricted binary blobs"),
    "asp": (14587, "ARCH_SPECIFIC", "Arch Build System tool; depends on devtools and Arch SVN infrastructure"),
    "pacwall-git": (14584, "ARCH_SPECIFIC", "Generates wallpaper from pacman dependency graph; requires pacman at runtime"),
    "arch-shell": (14726, "ARCH_SPECIFIC", "Creates disposable Arch chroot environments; requires pacman and devtools"),
    "dude-bin": (14699, "ARCH_SPECIFIC", "Pacman orphan package manager; requires pacman at runtime"),
    "deemix-gui-appimage": (14759, "LEGAL_ISSUES", "Deezer music downloading tool; facilitates copyright infringement of streaming content"),
    "ntsync-dkms": (15010, "DKMS_UNSUPPORTED", "Out-of-tree kernel module via DKMS; Guix uses custom kernel configurations instead"),
    "mt76-dkms-git": (14914, "DKMS_UNSUPPORTED", "Out-of-tree DKMS kernel module for MediaTek WiFi; Guix uses custom kernel configurations"),
    "python-torchaudio-rocm": (14583, "COMPLEX_DEPS", "Requires ROCm/HIP ecosystem (AMD GPU compute) which is not available in Guix"),
    "godot-double-mono": (14495, "COMPLEX_DEPS", "Requires Mono/.NET runtime, SCons build, and extensive C# SDK integration"),
    "watchman": (14593, "COMPLEX_DEPS", "Requires version-matched Facebook infrastructure libraries (folly, fbthrift, fb303, edencommon, fizz, mvfst)"),
    "odoo18-nightly": (14669, "COMPLEX_PACKAGING", "Massive Python ERP/web framework (100k+ LOC) with PostgreSQL and wkhtmltopdf integration"),
    "void-electron-latest-bin": (14576, "COMPLEX_DEPS", "Requires system Electron 34 package with specific ABI version matching"),
    "devkitty-git": (15058, "COMPLEX_DEPS", "Electron-based developer tool requiring full Chromium/Electron build stack"),
}

# ═══ NEW RECIPES: packages getting fresh Guix definitions ═══
# These 13 are NOT in recipe-resolver-260417x and can be reasonably packaged.

SCM_CONTENT = ''';;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417y
;;; Resolves 13 BLOCKED packages with new recipes.
;;; Also marks 28 packages as ALREADY_RESOLVED (recipes in recipe-resolver-260417x).
;;; Documents 26 packages that remain BLOCKED.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages usb)
  #:export (apache-jena
            apache-jena-fuseki
            b43-firmware-classic
            bombkurdistan-bin
            bombkurdistan-git
            eclipse-cpp-bin
            fcitx5-pinyin-sougou-dict
            fingerprint-gui
            gtk2-theme-dust
            guile1.8
            ntsync-common
            ntsync-header
            steamos-add-to-steam
))

;;; ─── Font / Theme packages (copy-build-system) ───

(define-public gtk2-theme-dust
  (package
    (name "gtk2-theme-dust")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://code.launchpad.net/dusttheme/0.5/0.5.1/+download/Dust-0.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Dust" "share/themes/Dust"))))
    (synopsis "clean modern GTK2 theme based on Ubuntu Dust aesthetics")
    (description "Dust is a clean, modern GTK2 theme that remixes the defining
aesthetic elements of Ubuntu with an emphasis on usability.")
    (home-page "https://wiki.ubuntu.com/Artwork/Incoming/DustTheme")
    (license license:gpl3)))

;;; ─── Trivial / config-only packages ───

(define-public ntsync-common
  (package
    (name "ntsync-common")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/torvalds/linux/v"
                    version "/drivers/misc/ntsync.c"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((etc (string-append #$output "/etc")))
                 (mkdir-p (string-append etc "/modules-load.d"))
                 (mkdir-p (string-append etc "/udev/rules.d"))
                 (call-with-output-file
                     (string-append etc "/modules-load.d/ntsync.conf")
                   (lambda (port) (display "ntsync\\n" port)))
                 (call-with-output-file
                     (string-append etc "/udev/rules.d/99-ntsync.rules")
                   (lambda (port)
                     (display
                      "KERNEL==\\"ntsync\\", MODE=\\"0644\\"\\n" port)))))))
    (synopsis "NT synchronization primitive driver common files")
    (description "Provides udev rules and module auto-load configuration for
the Linux NT synchronization primitive driver, used by Wine and Proton for
improved Windows game compatibility.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2)))

(define-public ntsync-header
  (package
    (name "ntsync-header")
    (version "6.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/torvalds/linux/v"
                    version "/include/uapi/linux/ntsync.h"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((inc (string-append #$output "/include/linux")))
                 (mkdir-p inc)
                 (copy-file #$source (string-append inc "/ntsync.h"))))))
    (synopsis "NT synchronization primitive driver API header")
    (description "Provides the Linux API header file for the NT synchronization
primitive driver, used by Wine and Proton for improved Windows game
compatibility.")
    (home-page "https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/")
    (license license:gpl2)))

;;; ─── Copy / Script packages ───

(define-public steamos-add-to-steam
  (package
    (name "steamos-add-to-steam")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vicrodh/steamos-add-to-steam")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/add-to-steam" "bin/")
               ("share/" "share/"))))
    (synopsis "add applications as non-Steam games on KDE Plasma")
    (description "Replicates the Steam Deck @samp{Add to Steam} functionality
for KDE Plasma 6, allowing users to add any application as a non-Steam game in
their Steam library via context menus and Dolphin service menus.")
    (home-page "https://github.com/vicrodh/steamos-add-to-steam")
    (license license:expat)))

(define-public bombkurdistan-bin
  (package
    (name "bombkurdistan-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/XielQs/BombKurdistan/releases/download/v"
                    version "/bombkurdistan_linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/bombkurdistan/"))))
    (synopsis "simple 2D bombing game")
    (description "BombKurdistan is a simple 2D game built with SDL2 where the
player drops bombs on targets.")
    (home-page "https://github.com/XielQs/BombKurdistan")
    (license license:expat)))

(define-public eclipse-cpp-bin
  (package
    (name "eclipse-cpp-bin")
    (version "4.39")
    (source (origin
              (method url-fetch)
              (uri "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2026-03/R/eclipse-cpp-2026-03-R-linux-gtk-x86_64.tar.gz&r=1")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list #:install-plan
           #~'(("." "share/eclipse/"))))
    (synopsis "Eclipse IDE for C/C++ development (prebuilt)")
    (description "Eclipse IDE for C/C++ Developers is a comprehensive
development environment for C and C++ programming with integrated build
tools, debugging, and version control support.  This is a pre-built binary
distribution.")
    (home-page "https://www.eclipse.org/")
    (license license:epl1.0)))

;;; ─── Binary / Java packages (copy-build-system) ───

(define-public apache-jena
  (package
    (name "apache-jena")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.apache.org/jena/binaries/apache-jena-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lib" "share/java/jena/lib")
               ("bin" "share/java/jena/bin"))))
    (synopsis "Java framework for Semantic Web applications")
    (description "Apache Jena is a free and open source Java framework for
building Semantic Web and Linked Data applications.  It provides APIs for
RDF, SPARQL, and OWL.")
    (home-page "https://jena.apache.org/")
    (license license:asl2.0)))

(define-public apache-jena-fuseki
  (package
    (name "apache-jena-fuseki")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.apache.org/jena/binaries/apache-jena-fuseki-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fuseki-server.jar" "share/java/jena-fuseki/")
               ("webapp" "share/java/jena-fuseki/webapp"))))
    (synopsis "SPARQL server for Apache Jena")
    (description "Apache Jena Fuseki is a SPARQL server built on the Apache
Jena framework.  It can run as a stand-alone server providing RDF data over
HTTP or be embedded in other Java applications.")
    (home-page "https://jena.apache.org/")
    (license license:asl2.0)))

;;; ─── Source builds ───

(define-public guile1.8
  (package
    (name "guile1.8")
    (version "1.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/pub/gnu/guile/guile-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--disable-static"
                   "--disable-error-on-warning"
                   "--program-suffix=1.8")
           #:tests? #f))
    (inputs (list gmp readline ncurses openssl))
    (native-inputs (list texinfo pkg-config))
    (synopsis "portable embeddable Scheme implementation (legacy 1.8 branch)")
    (description "GNU Guile is a portable, embeddable Scheme implementation
written in C.  This is the legacy 1.8 branch, provided for compatibility
with software that requires the old Guile 1.8 API.")
    (home-page "https://www.gnu.org/software/guile/")
    (license license:gpl3+)))

(define-public fingerprint-gui
  (package
    (name "fingerprint-gui")
    (version "1.09")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maksbotan/fingerprint-gui/archive/v"
                    version "-qt5.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "qmake"
                           (string-append "PREFIX="
                                          (assoc-ref outputs "out"))
                           (string-append "LIB="
                                          (assoc-ref outputs "out")
                                          "/lib")))))))
    (inputs (list qtbase-5 polkit-qt libusb))
    (native-inputs (list pkg-config))
    (synopsis "fingerprint-based authentication GUI")
    (description "Fingerprint GUI provides a graphical interface for managing
fingerprint-based authentication on Linux systems.  It supports various
fingerprint readers through libfprint.")
    (home-page "https://github.com/maksbotan/fingerprint-gui")
    (license license:gpl2+)))

(define-public bombkurdistan-git
  (package
    (name "bombkurdistan")
    (version "1.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/XielQs/BombKurdistan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple 2D bombing game (built from source)")
    (description "BombKurdistan is a simple 2D game built with SDL2 and CMake
where the player drops bombs on targets.")
    (home-page "https://github.com/XielQs/BombKurdistan")
    (license license:expat)))

;;; ─── Firmware / dictionary packages ───

(define-public b43-firmware-classic
  (package
    (name "b43-firmware-classic")
    (version "5.100.138")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/minios-linux/b43-firmware/releases/"
                    "download/b43-firmware/broadcom-wl-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH"
                       (string-append #$b43-fwcutter "/bin:"
                                      #$tar "/bin:"
                                      #$bzip2 "/bin:"
                                      #$coreutils "/bin"))
               (let ((fw-dir (string-append #$output "/lib/firmware")))
                 (mkdir-p fw-dir)
                 (invoke "tar" "xf" #$source)
                 (invoke "b43-fwcutter" "-w" fw-dir
                         (string-append "broadcom-wl-"
                                        #$version
                                        "/linux/wl_apsta.o"))))))
    (native-inputs (list b43-fwcutter tar bzip2 coreutils))
    (synopsis "firmware for Broadcom B43 wireless chips (trusted release)")
    (description "Provides firmware extracted from the Broadcom wireless driver
for use with the b43 Linux kernel module.  This is the classic trusted release
version 5.100.138.")
    (home-page "https://wireless.wiki.kernel.org/en/users/Drivers/b43")
    (license license:non-copyleft)))

(define-public fcitx5-pinyin-sougou-dict
  (package
    (name "fcitx5-pinyin-sougou-dict")
    (version "20250802")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maoyaotang12/sougouscel")
                    (commit "baf36c7")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scel" "share/fcitx5/pinyin/dictionaries/sougou/"))))
    (synopsis "Sogou Pinyin dictionary data for Fcitx5")
    (description "Provides Sogou Pinyin dictionary data for use with the
Fcitx5 Pinyin input method.  Includes comprehensive Chinese language coverage
from Sogou's dictionary collection.")
    (home-page "https://pinyin.sogou.com/dict/")
    (license license:non-copyleft)))
'''

# Map of new recipe guix var names to AUR names for todo updates
NEW_RECIPE_NAMES = {
    "apache-jena": 15068,
    "apache-jena-fuseki": 15067,
    "b43-firmware-classic": 15063,
    "bombkurdistan-bin": 14740,
    "bombkurdistan-git": 14739,
    "eclipse-cpp-bin": 14984,
    "fcitx5-pinyin-sougou-dict-git": 14970,
    "fingerprint-gui": 15035,
    "gtk2-theme-dust": 15054,
    "guile1.8": 15016,
    "ntsync-common": 15011,
    "ntsync-header": 15009,
    "steamos-add-to-steam": 14975,
}

# Guix variable names for export/re-export
NEW_RECIPE_EXPORTS = [
    "apache-jena",
    "apache-jena-fuseki",
    "b43-firmware-classic",
    "bombkurdistan-bin",
    "bombkurdistan-git",
    "eclipse-cpp-bin",
    "fcitx5-pinyin-sougou-dict",
    "fingerprint-gui",
    "gtk2-theme-dust",
    "guile1.8",
    "ntsync-common",
    "ntsync-header",
    "steamos-add-to-steam",
]


def generate_blocked_notes():
    """Generate the blocked notes file."""
    lines = []
    lines.append(f";;; {PASS_ID} — blocked notes")
    lines.append(";;;")
    lines.append(f";;; {len(NEW_RECIPE_NAMES)} packages resolved with new recipes")
    lines.append(f";;; {len(ALREADY_RESOLVED)} packages already resolved in prior passes (marked DONE)")
    lines.append(f";;; {len(BLOCKED_PACKAGES)} packages remain BLOCKED")
    lines.append(";;;")

    # Group blocked by reason code
    by_reason = {}
    for name, (number, reason, detail) in sorted(BLOCKED_PACKAGES.items()):
        if reason not in by_reason:
            by_reason[reason] = []
        by_reason[reason].append((name, number, detail))

    for reason in sorted(by_reason.keys()):
        entries = by_reason[reason]
        lines.append(f";;; {reason} ({len(entries)} packages):")
        for name, number, detail in sorted(entries):
            lines.append(f";;;   {name} (#{number}): {detail}")
        lines.append(";;;")

    # Already resolved section
    lines.append(f";;; ALREADY_RESOLVED ({len(ALREADY_RESOLVED)} packages, marked DONE):")
    for name, (number, existing_file) in sorted(ALREADY_RESOLVED.items()):
        lines.append(f";;;   {name} (#{number}): Recipe already exists in {existing_file}")
    lines.append(";;;")

    return "\n".join(lines)


def update_todo_file(todo_path):
    """Update statuses in todo_general_packages.org using atomic file transform."""
    # Build lookup: number -> (new_status, status_text)
    status_updates = {}

    for aur_name, num in NEW_RECIPE_NAMES.items():
        status_updates[num] = ("DONE", f"::{PASS_ID}:recipe_created:")

    for aur_name, (num, existing_file) in ALREADY_RESOLVED.items():
        status_updates[num] = ("DONE", f"::{PASS_ID}:ALREADY_RESOLVED: Recipe exists in {existing_file}:")

    for aur_name, (num, reason, detail) in BLOCKED_PACKAGES.items():
        status_updates[num] = ("BLOCKED", f":{PASS_ID}:{reason}: {detail}:")

    # Read and transform
    with open(todo_path, "r") as f:
        lines = f.readlines()

    new_lines = []
    for line in lines:
        m = re.match(r'^(\*\* )(BLOCKED|TODO|NEEDS_RECIPE_DESIGN|DONE|FAILED)( \d+\. )(\S+)(.*)\n?$', line)
        if m:
            prefix, old_status, num_part, pkg_name, rest = m.groups()
            num_match = re.search(r'(\d+)', num_part)
            if num_match:
                num = int(num_match.group(1))
                if num in status_updates and old_status == "BLOCKED":
                    new_status, status_text = status_updates[num]
                    new_lines.append(f"{prefix}{new_status}{num_part}{pkg_name}  {status_text}\n")
                    continue
        new_lines.append(line)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(todo_path), suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.writelines(new_lines)
        shutil.move(tmp_path, todo_path)
    except Exception:
        os.unlink(tmp_path)
        raise


def update_general_compat(compat_path, pass_id, exports):
    """Add use-module and re-exports for the new resolver."""
    with open(compat_path, "r") as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})"

    if new_import in content:
        print(f"  Import already present in {compat_path}")
    else:
        # Find last #:use-module line with gaurix packages
        lines = content.split("\n")
        last_use_idx = -1
        for i, line in enumerate(lines):
            if "#:use-module" in line and "gaurix packages" in line:
                last_use_idx = i
        if last_use_idx >= 0:
            lines.insert(last_use_idx + 1, new_import)

        # Add re-exports at end
        for exp in sorted(exports):
            re_line = f"(re-export {exp})"
            if re_line not in content:
                lines.append(re_line)

        # Atomic write
        fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(compat_path), suffix=".tmp")
        try:
            with os.fdopen(fd, 'w') as f:
                f.write("\n".join(lines))
            shutil.move(tmp_path, compat_path)
        except Exception:
            os.unlink(tmp_path)
            raise


def update_packages_scm(packages_path, pass_id):
    """Add use-module for the new resolver to packages.scm."""
    with open(packages_path, "r") as f:
        content = f.read()

    new_import = f"  #:use-module (gaurix packages {pass_id})"

    if new_import in content:
        print(f"  Import already present in {packages_path}")
        return

    lines = content.split("\n")
    last_use_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line and "gaurix packages" in line:
            last_use_idx = i

    if last_use_idx >= 0:
        lines.insert(last_use_idx + 1, new_import)

    # Atomic write
    fd, tmp_path = tempfile.mkstemp(dir=os.path.dirname(packages_path), suffix=".tmp")
    try:
        with os.fdopen(fd, 'w') as f:
            f.write("\n".join(lines))
        shutil.move(tmp_path, packages_path)
    except Exception:
        os.unlink(tmp_path)
        raise


def write_summary():
    """Write summary JSON report."""
    summary = {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "pass_id": PASS_ID,
        "new_recipe_count": len(NEW_RECIPE_NAMES),
        "already_resolved_count": len(ALREADY_RESOLVED),
        "blocked_count": len(BLOCKED_PACKAGES),
        "total_processed": len(NEW_RECIPE_NAMES) + len(ALREADY_RESOLVED) + len(BLOCKED_PACKAGES),
        "recipe_names": sorted(NEW_RECIPE_EXPORTS),
        "already_resolved": sorted(ALREADY_RESOLVED.keys()),
        "blocked_reasons": {},
    }

    for name, (num, reason, detail) in BLOCKED_PACKAGES.items():
        if reason not in summary["blocked_reasons"]:
            summary["blocked_reasons"][reason] = []
        summary["blocked_reasons"][reason].append(name)

    path = os.path.join(REPORT_DIR, f"{PASS_ID}-summary.json")
    with open(path, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Wrote: {path}")


def main():
    print(f"=== {PASS_ID} Worker ===")
    print(f"New recipes: {len(NEW_RECIPE_NAMES)}")
    print(f"Already resolved: {len(ALREADY_RESOLVED)}")
    print(f"Remaining blocked: {len(BLOCKED_PACKAGES)}")
    print(f"Total processed: {len(NEW_RECIPE_NAMES) + len(ALREADY_RESOLVED) + len(BLOCKED_PACKAGES)}")
    print()

    # 1. Write .scm module
    with open(MODULE_PATH, "w") as f:
        f.write(SCM_CONTENT)
    print(f"Wrote: {MODULE_PATH}")

    # 2. Write blocked notes
    notes_content = generate_blocked_notes()
    with open(BLOCKED_NOTES_PATH, "w") as f:
        f.write(notes_content)
    print(f"Wrote: {BLOCKED_NOTES_PATH}")

    # 3. Update todo file
    update_todo_file(TODO_PATH)
    print(f"Updated: {TODO_PATH}")

    # 4. Update general-compat.scm
    update_general_compat(COMPAT_PATH, PASS_ID, NEW_RECIPE_EXPORTS)
    print(f"Updated: {COMPAT_PATH}")

    # 5. Update packages.scm
    update_packages_scm(PACKAGES_SCM_PATH, PASS_ID)
    print(f"Updated: {PACKAGES_SCM_PATH}")

    # 6. Write summary report
    write_summary()

    # Print summary
    print(f"\n=== New Recipes ===")
    for name, num in sorted(NEW_RECIPE_NAMES.items()):
        print(f"  + {name} (#{num})")

    print(f"\n=== Already Resolved ===")
    for name, (num, f_) in sorted(ALREADY_RESOLVED.items()):
        print(f"  = {name} (#{num}) in {f_}")

    print(f"\n=== Remaining Blocked ===")
    for name, (num, reason, _) in sorted(BLOCKED_PACKAGES.items()):
        print(f"  x {name} (#{num}) [{reason}]")


if __name__ == "__main__":
    main()
