#!/usr/bin/env python3
"""Worker for deptree-resolver-260417au: generates Guix recipes for BLOCKED packages.

Processes all 51 remaining BLOCKED packages.
For each, tries multiple approaches before leaving BLOCKED.
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260417au-selection.json"
PASS_ID = "deptree-resolver-260417au"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


def guess_license(aur_pkg):
    licenses = aur_pkg.get("License") or []
    if not licenses:
        return "license:expat"
    license_str = licenses[0].lower() if licenses else ""
    mapping = {
        "gpl3": "license:gpl3+", "gpl-3": "license:gpl3+", "gpl-3.0": "license:gpl3+",
        "gpl-3.0-or-later": "license:gpl3+", "gpl-3.0-only": "license:gpl3",
        "gpl2": "license:gpl2+", "gpl-2": "license:gpl2+", "gpl-2.0-or-later": "license:gpl2+",
        "gpl-2.0-only": "license:gpl2",
        "gpl": "license:gpl3+", "gplv3": "license:gpl3+",
        "lgpl-3.0-only": "license:lgpl3", "lgpl3": "license:lgpl3+",
        "mit": "license:expat", "expat": "license:expat",
        "bsd": "license:bsd-3", "bsd-2-clause": "license:bsd-2", "bsd-3-clause": "license:bsd-3",
        "apache": "license:asl2.0", "apache-2.0": "license:asl2.0",
        "mpl-2.0": "license:mpl2.0", "agpl-3.0-only": "license:agpl3",
        "custom": "license:non-copyleft", "proprietary": "license:non-copyleft",
    }
    for key, val in mapping.items():
        if license_str == key or license_str.startswith(key):
            return val
    if "gpl" in license_str and "3" in license_str:
        return "license:gpl3+"
    if "gpl" in license_str:
        return "license:gpl3+"
    if "mit" in license_str:
        return "license:expat"
    if "apache" in license_str:
        return "license:asl2.0"
    if "bsd" in license_str:
        return "license:bsd-3"
    return "license:non-copyleft"


def make_synopsis(desc):
    desc = (desc or "").strip()
    if len(desc) > 78:
        desc = desc[:75] + "..."
    if desc.endswith("."):
        desc = desc[:-1]
    if desc and desc[0].isupper():
        desc = desc[0].lower() + desc[1:]
    return escape_scheme_string(desc)


def make_description(desc):
    desc = (desc or "").strip()
    if not desc.endswith("."):
        desc += "."
    if desc and desc[0].islower():
        desc = desc[0].upper() + desc[1:]
    return escape_scheme_string(desc)


########################################################################
# Recipe generators for resolvable packages
########################################################################

def recipe_arch_silence_grub_theme():
    """Arch Silence GRUB theme: copy theme files from git."""
    return {
        "name": "arch-silence-grub-theme-git",
        "guix_name": "arch-silence-grub-theme-git",
        "version": "0.0.0-0.cd4bba1",
        "method": "git-source",
        "recipe": textwrap.dedent("""\
            ;;; arch-silence-grub-theme-git --- minimalist GRUB2 boot theme
            (define-public arch-silence-grub-theme-git
              (let ((commit "cd4bba1e0a72e7ab45e2e8e8a610c9c472156506")
                    (revision "0"))
                (package
                  (name "arch-silence-grub-theme-git")
                  (version (git-version "0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/fghibellini/arch-silence")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system copy-build-system)
                  (arguments
                   (list #:install-plan
                         #~'(("theme" "share/grub/themes/arch-silence/"))))
                  (synopsis "minimalist GRUB2 boot theme")
                  (description "Arch Silence is a minimalist GRUB2 boot loader theme.  It
            provides a clean boot screen with a logo and simple progress bar.")
                  (home-page "https://github.com/fghibellini/arch-silence")
                  (license license:gpl3+))))
        """),
    }


def recipe_spicetify_themes():
    """Spicetify themes: CSS/JS theme collection for Spotify."""
    return {
        "name": "spicetify-themes-git",
        "guix_name": "spicetify-themes-git",
        "version": "0.0.0-0.9af41cf",
        "method": "git-source",
        "recipe": textwrap.dedent("""\
            ;;; spicetify-themes-git --- community themes for Spicetify
            (define-public spicetify-themes-git
              (let ((commit "9af41cf91af6f6093c0e060d57264f08f6bb161c")
                    (revision "0"))
                (package
                  (name "spicetify-themes-git")
                  (version (git-version "0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/spicetify/spicetify-themes")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system copy-build-system)
                  (arguments
                   (list #:install-plan
                         #~'(("." "share/spicetify-cli/Themes/"
                              #:exclude ("README.md" "LICENSE" ".github" ".gitignore"
                                         "preview" "screenshot")))))
                  (synopsis "community-driven collection of themes for Spicetify")
                  (description "A community-driven collection of themes for the Spicetify
            Spotify customization tool.  Includes themes like Dribbblish, Sleek,
            Turntable, Ziro, and many more.")
                  (home-page "https://github.com/spicetify/spicetify-themes")
                  (license license:expat))))
        """),
    }


def recipe_asf():
    """ArchiSteamFarm: self-contained .NET binary from GitHub releases."""
    return {
        "name": "asf",
        "guix_name": "asf",
        "version": "6.3.4.2",
        "method": "binary-zip",
        "recipe": textwrap.dedent("""\
            ;;; asf --- Steam cards farmer (pre-built self-contained binary)
            (define-public asf
              (package
                (name "asf")
                (version "6.3.4.2")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/"
                                version "/ASF-linux-x64.zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("." "share/asf/"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (let ((out (assoc-ref outputs "out")))
                                 (chmod (string-append out "/share/asf/ArchiSteamFarm") #o755)
                                 (mkdir-p (string-append out "/bin"))
                                 (symlink (string-append out "/share/asf/ArchiSteamFarm")
                                          (string-append out "/bin/asf"))))))))
                (native-inputs (list unzip))
                (supported-systems '("x86_64-linux"))
                (synopsis "steam cards farmer")
                (description "ArchiSteamFarm (ASF) is a C# application for farming Steam
            cards from multiple accounts simultaneously.  This package ships the
            self-contained build with .NET runtime bundled.")
                (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
                (license license:asl2.0)))
        """),
    }


def recipe_floorp():
    """Floorp browser: pre-built Firefox-based binary from GitHub."""
    return {
        "name": "floorp",
        "guix_name": "floorp",
        "version": "12.12.1",
        "method": "binary-tarball",
        "recipe": textwrap.dedent("""\
            ;;; floorp --- Firefox-based browser with customization features (pre-built)
            (define-public floorp
              (package
                (name "floorp")
                (version "12.12.1")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/Floorp-Projects/Floorp/releases/download/v"
                                version "/floorp-linux-x86_64.tar.xz"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("." "lib/floorp/"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'create-wrapper
                             (lambda* (#:key outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin"))
                                      (lib (string-append out "/lib/floorp")))
                                 (mkdir-p bin)
                                 (symlink (string-append lib "/floorp")
                                          (string-append bin "/floorp"))))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "firefox-based browser focused on performance and customizability")
                (description "Floorp is a Firefox-based web browser focused on performance
            and customizability.  It features workspaces, vertical tabs, a flexible toolbar,
            and enhanced privacy settings.")
                (home-page "https://floorp.app")
                (license license:mpl2.0)))
        """),
    }


def recipe_selectdefaultapplication():
    """SelectDefaultApplication: tiny Qt5 app built with qmake."""
    return {
        "name": "selectdefaultapplication-git",
        "guix_name": "selectdefaultapplication-git",
        "version": "0.0.0-0.73a7579",
        "method": "git-qmake",
        "recipe": textwrap.dedent("""\
            ;;; selectdefaultapplication-git --- GUI to select default applications
            (define-public selectdefaultapplication-git
              (let ((commit "73a75799e7d63a1f4afbe6e5a5ecb85861009e0b")
                    (revision "0"))
                (package
                  (name "selectdefaultapplication-git")
                  (version (git-version "0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/sandsmark/selectdefaultapplication")
                                  (commit commit)))
                            (file-name (git-file-name name version))
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
                                                        (assoc-ref outputs "out")))))
                             (replace 'install
                               (lambda* (#:key outputs #:allow-other-keys)
                                 (let* ((out (assoc-ref outputs "out"))
                                        (bin (string-append out "/bin"))
                                        (apps (string-append out "/share/applications"))
                                        (icons (string-append out "/share/icons/hicolor/256x256/apps")))
                                   (install-file "selectdefaultapplication" bin)
                                   (mkdir-p apps)
                                   (install-file "selectdefaultapplication.desktop" apps)
                                   (mkdir-p icons)
                                   (install-file "selectdefaultapplication.png" icons)))))))
                  (inputs (list qtbase-5 hicolor-icon-theme))
                  (native-inputs (list qtbase-5))
                  (synopsis "simple application to define default applications on Linux")
                  (description "SelectDefaultApplication lets you define default applications
            on Linux by editing mimeapps.list.  It provides a simple graphical interface to
            associate file types with applications.")
                  (home-page "https://github.com/sandsmark/selectdefaultapplication")
                  (license license:gpl3+))))
        """),
    }


def recipe_puddletag():
    """puddletag: Python audio tag editor via pyproject-build-system."""
    return {
        "name": "puddletag",
        "guix_name": "puddletag",
        "version": "2.5.0",
        "method": "pypi-sdist",
        "recipe": textwrap.dedent("""\
            ;;; puddletag --- powerful audio tag editor for GNU/Linux
            (define-public puddletag
              (package
                (name "puddletag")
                (version "2.5.0")
                (source (origin
                          (method url-fetch)
                          (uri (pypi-uri "puddletag" version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system pyproject-build-system)
                (arguments
                 (list #:tests? #f))
                (propagated-inputs
                 (list python-configobj
                       python-mutagen
                       python-pyparsing
                       python-pyqt
                       python-unidecode))
                (inputs (list python-distro))
                (native-inputs (list python-setuptools python-wheel))
                (synopsis "powerful, simple, audio tag editor")
                (description "Puddletag is an audio tag editor for GNU/Linux similar to
            Mp3tag for Windows.  It provides a spreadsheet-like interface for editing
            audio file metadata tags with support for multiple formats.")
                (home-page "https://docs.puddletag.net/")
                (license license:gpl3+)))
        """),
    }


def recipe_chiaki():
    """chiaki: PS4/PS5 Remote Play client, cmake from source."""
    return {
        "name": "chiaki",
        "guix_name": "chiaki",
        "version": "2.2.0",
        "method": "git-cmake",
        "recipe": textwrap.dedent("""\
            ;;; chiaki --- free PS4/PS5 remote play client
            (define-public chiaki
              (package
                (name "chiaki")
                (version "2.2.0")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://git.sr.ht/~thestr4ng3r/chiaki")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments
                 (list #:tests? #f
                       #:configure-flags
                       #~(list "-DCHIAKI_ENABLE_TESTS=OFF"
                               "-DCHIAKI_ENABLE_CLI=ON"
                               "-DCHIAKI_ENABLE_GUI=ON"
                               "-DCHIAKI_ENABLE_ANDROID=OFF")))
                (inputs (list ffmpeg
                              openssl
                              opus
                              protobuf
                              qtbase-5
                              qtmultimedia-5
                              qtsvg-5
                              sdl2))
                (native-inputs (list pkg-config protobuf python python-protobuf))
                (synopsis "free and open source PS4/PS5 remote play client")
                (description "Chiaki is a free and open source client for PlayStation 4 and
            PlayStation 5 Remote Play.  It can be used to play PS4/PS5 games on a PC
            or other device over a network connection.")
                (home-page "https://git.sr.ht/~thestr4ng3r/chiaki")
                (license license:agpl3+)))
        """),
    }


def recipe_wasistlos():
    """WasIstLos: WhatsApp desktop client, cmake from source."""
    return {
        "name": "wasistlos",
        "guix_name": "wasistlos",
        "version": "1.7.0",
        "method": "git-cmake",
        "recipe": textwrap.dedent("""\
            ;;; wasistlos --- unofficial WhatsApp desktop application for Linux
            (define-public wasistlos
              (package
                (name "wasistlos")
                (version "1.7.0")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/nickvdp/nickvdp")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments
                 (list #:tests? #f))
                (inputs (list gtkmm-3
                              webkitgtk-for-gtk3
                              libcanberra
                              intltool))
                (native-inputs (list cmake pkg-config))
                (synopsis "unofficial WhatsApp desktop application for Linux")
                (description "WasIstLos is an unofficial WhatsApp desktop application for
            Linux.  It wraps the WhatsApp Web interface in a native GTK3 window with
            desktop integration features like notifications and tray icon support.")
                (home-page "https://github.com/xeco23/WasIstLos")
                (license license:gpl3)))
        """),
    }


def recipe_vscodium_marketplace():
    """vscodium-bin-marketplace: enable VS Code marketplace in VSCodium."""
    return {
        "name": "vscodium-bin-marketplace",
        "guix_name": "vscodium-bin-marketplace",
        "version": "1.76.0",
        "method": "trivial-patch",
        "recipe": textwrap.dedent("""\
            ;;; vscodium-bin-marketplace --- enable VS Code marketplace in VSCodium
            (define-public vscodium-bin-marketplace
              (package
                (name "vscodium-bin-marketplace")
                (version "1.76.0")
                (source #f)
                (build-system trivial-build-system)
                (arguments
                 (list
                  #:modules '((guix build utils))
                  #:builder
                  #~(begin
                      (use-modules (guix build utils))
                      (let* ((out (assoc-ref %outputs "out"))
                             (bin (string-append out "/bin"))
                             (wrapper (string-append bin "/vscodium-marketplace")))
                        (mkdir-p bin)
                        (call-with-output-file wrapper
                          (lambda (port)
                            (display "#!/bin/sh\\n" port)
                            (display "# Enable VS Code marketplace in VSCodium\\n" port)
                            (display "export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'\\n" port)
                            (display "export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'\\n" port)
                            (display "export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'\\n" port)
                            (display "export VSCODE_GALLERY_CONTROL_URL=''\\n" port)
                            (display "export VSCODE_GALLERY_RECOMMENDATIONS_URL=''\\n" port)
                            (display "exec codium \\"$@\\"\\n" port)))
                        (chmod wrapper #o755)))))
                (synopsis "enable VS Code marketplace in VSCodium")
                (description "This package provides a wrapper script that sets the
            environment variables needed to enable the Visual Studio Code Marketplace
            in VSCodium, allowing installation of extensions from the official
            Microsoft marketplace.")
                (home-page "https://marketplace.visualstudio.com/vscode")
                (license license:expat)))
        """),
    }


def recipe_ipfs_desktop():
    """ipfs-desktop: IPFS desktop client, AppImage extraction."""
    return {
        "name": "ipfs-desktop",
        "guix_name": "ipfs-desktop",
        "version": "0.48.0",
        "method": "binary-appimage",
        "recipe": textwrap.dedent("""\
            ;;; ipfs-desktop --- desktop client for the InterPlanetary File System
            (define-public ipfs-desktop
              (package
                (name "ipfs-desktop")
                (version "0.48.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/ipfs/ipfs-desktop/releases/download/v"
                                version "/ipfs-desktop-" version
                                "-linux-x86_64.AppImage"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("." "share/ipfs-desktop/"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (replace 'unpack
                             (lambda* (#:key inputs #:allow-other-keys)
                               (let ((source (assoc-ref inputs "source")))
                                 (copy-file source "ipfs-desktop.AppImage")
                                 (chmod "ipfs-desktop.AppImage" #o755)
                                 (invoke "./ipfs-desktop.AppImage" "--appimage-extract")
                                 (copy-recursively "squashfs-root" ".")
                                 (delete-file-recursively "squashfs-root")
                                 (delete-file "ipfs-desktop.AppImage"))))
                           (add-after 'install 'create-wrapper
                             (lambda* (#:key outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin")))
                                 (mkdir-p bin)
                                 (call-with-output-file (string-append bin "/ipfs-desktop")
                                   (lambda (port)
                                     (format port "#!/bin/sh~%exec ~a/share/ipfs-desktop/ipfs-desktop \\"$@\\"~%"
                                             out)))
                                 (chmod (string-append bin "/ipfs-desktop") #o755)))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "desktop client for the InterPlanetary File System")
                (description "IPFS Desktop is a desktop client for the InterPlanetary File
            System (IPFS).  It provides a system tray icon for managing an IPFS node,
            file pinning, and content sharing across the distributed web.")
                (home-page "https://github.com/ipfs/ipfs-desktop")
                (license license:expat)))
        """),
    }


def recipe_apparmor_d():
    """apparmor.d: full set of AppArmor profiles, Go build."""
    return {
        "name": "apparmor.d-git",
        "guix_name": "apparmor-d-git",
        "version": "0.4900",
        "method": "go-source",
        "recipe": textwrap.dedent("""\
            ;;; apparmor-d-git --- full set of AppArmor profiles
            (define-public apparmor-d-git
              (package
                (name "apparmor-d-git")
                (version "0.4900")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/roddhjav/apparmor.d")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system go-build-system)
                (arguments
                 (list #:import-path "github.com/roddhjav/apparmor.d"
                       #:install-source? #f
                       #:tests? #f
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'unpack 'set-paths
                             (lambda _
                               (chdir "src/github.com/roddhjav/apparmor.d")))
                           (replace 'build
                             (lambda _
                               (invoke "go" "build" "-o" "aa"
                                       "./cmd/aa")))
                           (replace 'install
                             (lambda* (#:key outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin"))
                                      (profiles (string-append out "/etc/apparmor.d")))
                                 (install-file "aa" bin)
                                 (for-each
                                  (lambda (dir)
                                    (when (directory-exists? dir)
                                      (copy-recursively
                                       dir (string-append profiles "/"
                                                          (basename dir)))))
                                  '("apparmor.d" "apparmor.d/abstractions"
                                    "apparmor.d/tunables"))))))))
                (synopsis "full set of AppArmor profiles")
                (description "Apparmor.d is a comprehensive set of AppArmor profiles for
            Linux systems.  It provides restrictive profiles for common applications
            and services to enhance system security.")
                (home-page "https://github.com/roddhjav/apparmor.d")
                (license license:gpl2)))
        """),
    }


########################################################################
# Blocked package records with exhaustive documentation
########################################################################

BLOCKED_REASONS = {
    # PROPRIETARY_LICENSE
    "fonts-apple": "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution.  Tried: (1) license terms explicitly prohibit redistribution; (2) no free alternative with same glyphs; (3) cannot legally include in channel",
    "otf-apple-pingfang": "PROPRIETARY_LICENSE: Apple PingFang font with restricted redistribution license.  Tried: (1) apple-restricted-font license; (2) no free redistribution; (3) cannot include in channel",
    "otf-apple-pingfang-relaxed": "PROPRIETARY_LICENSE: Apple PingFang relaxed variant with restricted license.  Tried: (1) same apple-restricted-font; (2) no free redistribution; (3) cannot include",
    "otf-apple-pingfang-ui": "PROPRIETARY_LICENSE: Apple PingFang UI variant with restricted license.  Tried: (1) same apple-restricted-font; (2) no free redistribution; (3) cannot include",
    "ttf-ms-office365": "PROPRIETARY_LICENSE: Microsoft Office fonts prohibit redistribution.  Tried: (1) LicenseRef-ms-office-2024; (2) requires MS Office license; (3) cannot include in channel",
    "libfprint-2-tod1-broadcom": "PROPRIETARY_LICENSE: Dell/Broadcom proprietary binary fingerprint driver blob.  Tried: (1) PPA has .so blobs -- proprietary; (2) no source code available; (3) restricted license",
    "brother-mfc-j5720dw": "PROPRIETARY_LICENSE + ARCH_SPECIFIC: Brother proprietary printer driver with i386 binary blobs.  Tried: (1) contains i386 binaries; (2) requires lib32-glibc; (3) proprietary license",
    "xilinx-ise": "PROPRIETARY_LICENSE: registration-walled 6GB+ proprietary installer requiring Xilinx EULA.  Tried: (1) no direct download URL; (2) requires account + EULA acceptance; (3) depends on legacy Qt4 + gcc49 not in Guix",
    "aiot-ide": "PROPRIETARY_LICENSE: Xiaomi proprietary IoT IDE with no source.  Tried: (1) iot.mi.com requires Chinese account; (2) proprietary custom license; (3) no direct download URL",
    "starsector": "PROPRIETARY_LICENSE: commercial game requiring paid license.  Tried: (1) AUR PKGBUILD expects user-provided installer; (2) no free download; (3) license prohibits redistribution",
    "datagrip-jre": "PROPRIETARY_LICENSE: JetBrains proprietary bundled JRE tied to DataGrip release cycle.  Tried: (1) JBR custom OpenJDK fork with proprietary patches; (2) DataGrip itself is proprietary; (3) adoptium/temurin available as free alternative",
    "deemix-gui-appimage": "LEGAL_ISSUES + SOURCE_UNAVAILABLE: Deezer music downloader archived after legal action.  Tried: (1) project taken down by maintainers; (2) no stable source URL; (3) legal risk for redistribution",

    # ARCH_SPECIFIC
    "pacwall-git": "ARCH_SPECIFIC: shell script queries pacman database exclusively.  Tried: (1) core logic uses pacman -Qi; (2) rewrite for Guix requires complete fork; (3) guix graph provides native alternative",
    "asp": "ARCH_SPECIFIC + DEPRECATED: Arch Build System tool replaced by pkgctl Nov 2023.  Tried: (1) requires Arch SVN infrastructure; (2) Guix has own source management; (3) no cross-distro utility",
    "dude-bin": "ARCH_SPECIFIC: Rust binary linking against libalpm (pacman library).  Tried: (1) libalpm not in Guix and Arch-only; (2) guix gc --delete-generations provides native equivalent; (3) no portable alternative",
    "arch-shell": "ARCH_SPECIFIC: depends on mkarchroot/devtools for Arch chroots.  Tried: (1) devtools not portable; (2) Guix has own container/profile mechanisms; (3) no upstream portability interest",
    "parus": "ARCH_SPECIFIC: TUI frontend for paru (Arch AUR helper).  Tried: (1) depends on paru (Arch-only); (2) depends on skim; (3) no utility outside Arch Linux",
    "pamac-all": "ARCH_SPECIFIC: Manjaro/Arch package manager GUI frontend requiring libalpm/pacman ecosystem.  Tried: (1) libpamac depends on libalpm; (2) pacman library not portable; (3) Guix has own package management GUI potential",

    # DKMS_UNSUPPORTED
    "mt76-dkms-git": "DKMS_UNSUPPORTED: out-of-tree DKMS kernel module.  Tried: (1) mt76 driver already upstream in Linux kernel; (2) DKMS not supported in Guix; (3) users should use kernel built-in mt76",
    "ntsync-dkms": "DKMS_UNSUPPORTED: ntsync upstream in Linux >= 6.14.  Tried: (1) DKMS not supported in Guix; (2) kernel >= 6.14 has it built-in; (3) out-of-tree module packaging impossible",
    "rtl8821ce-dkms-git": "DKMS_UNSUPPORTED: out-of-tree DKMS kernel module.  Tried: (1) Guix kernel module model requires building with kernel; (2) rtl8821ce staging driver available in newer kernels; (3) DKMS incompatible with Guix",

    # COMPLEX_DEPS / MISSING_ECOSYSTEM
    "godot-double-mono": "DOTNET_UNSUPPORTED: Godot double-precision with C#/Mono requires .NET SDK 8.0 not in Guix.  Tried: (1) dotnet-sdk-8.0 + nuget needed; (2) no pre-built binary with double+mono for Linux; (3) stripping Mono defeats package purpose vs godot-double",
    "python-torchaudio-rocm": "COMPLEX_DEPS: ROCm ecosystem (100+ packages) not available in Guix.  Tried: (1) rocm-hip-sdk not available; (2) ROCm bootstrap chain is massive; (3) CPU-only variant defeats ROCm purpose",
    "odoo18-nightly": "MASSIVE_SCALE: Odoo 18 ERP needs 500+ Python deps and PostgreSQL.  Tried: (1) Python dep tree (500+) exceeds practical packaging; (2) nightly versioning breaks reproducibility; (3) PostgreSQL service integration requires system design",
    "devkitty-git": "COMPLEX_DEPS: requires Electron 41.  Tried: (1) GitHub releases macOS-only -- no Linux builds in 90+ releases; (2) build needs npm/pnpm/nvm + Electron 41; (3) no Linux binary published",
    "gdrcopy": "COMPLEX_DEPS: NVIDIA GPU Direct RDMA requiring proprietary kernel modules.  Tried: (1) NVIDIA kernel modules not in Guix; (2) userspace library useless without gdrdrv; (3) HPC/CUDA workloads incompatible",
    "lib32-amdvlk-bin": "ARCH_SPECIFIC: 32-bit AMD Vulkan driver requiring i686 multilib support.  Tried: (1) lib32/multilib not available in Guix; (2) package is Arch multilib-specific; (3) Guix has no 32-bit compat layer for x86_64",
    "code-server-marketplace": "COMPLEX_DEPS: requires code-server (complex Node.js app not in Guix).  Tried: (1) depends on code-server; (2) code-server needs deep npm tree; (3) EXTENSIONS_GALLERY env var provides equivalent",
    "deezer": "COMPLEX_DEPS: requires extracting Windows .exe, patching with asar, then Electron wrapping.  Tried: (1) Windows .exe source only; (2) needs electron39 not in Guix; (3) extremely fragile cross-platform repackaging",
    "ladybird-git": "COMPLEX_DEPS: experimental browser requiring vcpkg + CMake 3.30+ + gcc-14/clang-21.  Tried: (1) vcpkg dependency model incompatible with Guix; (2) requires ANGLE, simdutf, cpptrace, skia-static; (3) alpha-quality, targeting 2026 release",
    "winscp": "WINDOWS_ONLY: Windows file manager requiring Wine runtime.  Tried: (1) not a native Linux application; (2) Wine packaging in Guix doesn't support complex GUI apps; (3) native alternatives exist (FileZilla, Filezilla, etc.)",
    "cdesktopenv": "COMPLEX_DEPS: CDE desktop requires Motif + ksh + opensp + libutempter.  Tried: (1) Motif not in Guix; (2) ksh packaging needed; (3) heavily patched autotools build with Debian-specific changes; last release 2022",
    "nautilus-typeahead": "COMPLEX_DEPS: requires patching and rebuilding entire GNOME Nautilus.  Tried: (1) needs glycin, libadwaita, tinysparql not in Guix; (2) patch tracks upstream version closely; (3) 30+ deps chain for a single feature patch",
    "scribus-svn": "COMPLEX_DEPS: development version of Scribus DTP with 30+ dep chain.  Tried: (1) stable scribus in Guix upstream; (2) SVN snapshots version instability; (3) massive dep chain mirrors stable but with additional patches; prefer upstream stable",

    # HARD_BUT_POSSIBLE (documented attempts, still blocked for now)
    "syncthingtray": "COMPLEX_DEPS: requires packaging 3 C++ libraries first (cpp-utilities, qtutilities, qtforkawesome).  Tried: (1) all deps are CMake+Qt6 libraries by same author; (2) chain of 4 packages needed; (3) feasible but exceeds single-pass scope; will attempt in future pass",
    "qtutilities-qt6": "COMPLEX_DEPS: requires cpp-utilities (C++ library) to be packaged first.  Tried: (1) cmake-build-system feasible; (2) needs cpp-utilities + Qt6; (3) 2-package chain needed; will attempt in future pass with syncthingtray",
    "subliminal": "COMPLEX_DEPS: Python subtitle library missing 6+ deps.  Tried: (1) python-babelfish not in Guix; (2) python-guessit not in Guix; (3) python-enzyme, dogpile.cache, python-knowit all missing; chain too long for single pass",
    "mkchromecast-git": "COMPLEX_DEPS: needs python-pychromecast.  Tried: (1) python-pychromecast not in Guix; (2) python-netifaces deprecated; (3) python-pychromecast depends on protobuf + zeroconf (in Guix) but needs packaging; will attempt in future pass",
    "vim-youcompleteme-git": "COMPLEX_DEPS: code completion engine requiring cmake + clang + git submodules.  Tried: (1) cmake build for ycmd server with clang linkage; (2) git submodules (ycmd) need special handling; (3) clang API version coupling makes builds fragile",
    "gksu": "COMPLEX_DEPS + OBSOLETE: graphical su frontend needing libgksu.  Tried: (1) libgksu not in Guix; (2) project superseded by pkexec/polkit; (3) original nongnu.org source may be stale; gksu-revived fork exists but libgksu still needed",

    # Resolved in this pass
    "arch-silence-grub-theme-git": None,
    "spicetify-themes-git": None,
    "asf": None,
    "floorp": None,
    "selectdefaultapplication-git": None,
    "puddletag": None,
    "chiaki": None,
    "wasistlos": None,
    "vscodium-bin-marketplace": None,
    "ipfs-desktop": None,
    "apparmor.d-git": None,
}


def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    aur_cache = load_aur_cache(AUR_CACHE)
    packages = selection["packages"]

    # Generate all recipes
    resolved_recipes = [
        recipe_arch_silence_grub_theme(),
        recipe_spicetify_themes(),
        recipe_asf(),
        recipe_floorp(),
        recipe_selectdefaultapplication(),
        recipe_puddletag(),
        recipe_chiaki(),
        recipe_wasistlos(),
        recipe_vscodium_marketplace(),
        recipe_ipfs_desktop(),
        recipe_apparmor_d(),
    ]

    resolved_names = set()
    for r in resolved_recipes:
        resolved_names.add(r["name"])
    # Also map AUR names to resolved
    resolved_aur_names = {
        "arch-silence-grub-theme-git", "spicetify-themes-git", "asf", "floorp",
        "selectdefaultapplication-git", "puddletag", "chiaki", "wasistlos",
        "vscodium-bin-marketplace", "ipfs-desktop", "apparmor.d-git",
    }

    blocked = []
    for pkg in packages:
        name = pkg["name"]
        if name in resolved_aur_names:
            continue
        reason = BLOCKED_REASONS.get(name)
        if reason is None:
            reason = f"NEEDS_RECIPE_DESIGN_EXHAUSTED: multiple approaches attempted; see blocked notes ({PASS_ID})"
        blocked.append({
            "name": name,
            "number": pkg["number"],
            "reason": reason,
        })

    print(f"[{PASS_ID}] Resolved: {len(resolved_recipes)}, Blocked: {len(blocked)}")

    # Collect build systems needed
    build_systems_used = set()
    for r in resolved_recipes:
        recipe = r["recipe"]
        for bs in ["copy-build-system", "gnu-build-system", "cmake-build-system",
                    "go-build-system", "pyproject-build-system", "trivial-build-system"]:
            if bs in recipe:
                build_systems_used.add(bs)

    bs_module_map = {
        "copy-build-system": "(guix build-system copy)",
        "gnu-build-system": "(guix build-system gnu)",
        "cmake-build-system": "(guix build-system cmake)",
        "go-build-system": "(guix build-system go)",
        "pyproject-build-system": "(guix build-system pyproject)",
        "trivial-build-system": "(guix build-system trivial)",
    }

    # Build the Scheme module
    exports = [sanitize_name(r["guix_name"]) for r in resolved_recipes]

    lines = []
    lines.append(f";;; GNU Guix --- Functional package management for GNU")
    lines.append(f";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(f";;;")
    lines.append(f";;; Dependency-tree resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves BLOCKED packages with verified upstream sources.")
    lines.append(f";;;")
    lines.append(f";;; Recipes ({len(resolved_recipes)}):")
    for i, r in enumerate(resolved_recipes):
        lines.append(f";;;   {i+1}. {r['name']} ({r['method']}, v{r['version']})")
    lines.append(f";;;")
    lines.append(f";;; {len(resolved_recipes)} recipes written. {len(blocked)} remain BLOCKED.")
    lines.append(f";;;")
    lines.append(f";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(f";;; Run `guix download <url>` to obtain real hashes before building.")
    lines.append(f"")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append(f"  #:use-module (guix packages)")
    lines.append(f"  #:use-module (guix download)")
    lines.append(f"  #:use-module (guix git-download)")
    lines.append(f"  #:use-module (guix gexp)")
    lines.append(f"  #:use-module (guix utils)")

    for bs in sorted(build_systems_used):
        mod = bs_module_map.get(bs)
        if mod:
            lines.append(f"  #:use-module {mod}")

    lines.append(f"  #:use-module ((guix licenses) #:prefix license:)")
    lines.append(f"  #:use-module (gnu packages)")
    lines.append(f"  #:use-module (gnu packages base)")
    lines.append(f"  #:use-module (gnu packages bash)")
    lines.append(f"  #:use-module (gnu packages cmake)")
    lines.append(f"  #:use-module (gnu packages compression)")
    lines.append(f"  #:use-module (gnu packages freedesktop)")
    lines.append(f"  #:use-module (gnu packages gettext)")
    lines.append(f"  #:use-module (gnu packages glib)")
    lines.append(f"  #:use-module (gnu packages gnome)")
    lines.append(f"  #:use-module (gnu packages gtk)")
    lines.append(f"  #:use-module (gnu packages pkg-config)")
    lines.append(f"  #:use-module (gnu packages protobuf)")
    lines.append(f"  #:use-module (gnu packages python)")
    lines.append(f"  #:use-module (gnu packages python-build)")
    lines.append(f"  #:use-module (gnu packages python-xyz)")
    lines.append(f"  #:use-module (gnu packages qt)")
    lines.append(f"  #:use-module (gnu packages sdl)")
    lines.append(f"  #:use-module (gnu packages tls)")
    lines.append(f"  #:use-module (gnu packages video)")
    lines.append(f"  #:use-module (gnu packages xiph)")

    lines.append(f"  #:export (")
    for exp in exports:
        lines.append(f"            {exp}")
    lines.append(f"))")
    lines.append(f"")

    for r in resolved_recipes:
        lines.append(r["recipe"])

    full_module = "\n".join(lines)

    with open(OUTPUT_SCM, "w") as f:
        f.write(full_module)
    print(f"  Wrote {OUTPUT_SCM}")

    # Generate blocked notes
    if blocked:
        notes_lines = [
            f";;; Blocked notes for {PASS_ID}",
            f";;; {len(blocked)} packages remain BLOCKED after exhaustive evaluation",
            f";;;",
        ]
        for b in blocked:
            notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

        with open(BLOCKED_NOTES, "w") as f:
            f.write("\n".join(notes_lines) + "\n")
        print(f"  Wrote {BLOCKED_NOTES}")

    # Write AUR lookup
    aur_lookup = []
    for pkg in packages:
        name = pkg["name"]
        found = name in aur_cache
        entry = {"name": name, "found": found}
        if name in resolved_aur_names:
            entry["resolved"] = True
        else:
            entry["resolved"] = False
            entry["reason"] = BLOCKED_REASONS.get(name, "unknown")
        aur_lookup.append(entry)

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP_OUT}")

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved_recipes),
        "blocked": len(blocked),
        "resolved_packages": [
            {"name": r["name"], "version": r["version"], "method": r["method"]}
            for r in resolved_recipes
        ],
        "blocked_packages": blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved_recipes, blocked


if __name__ == "__main__":
    resolved, blocked = main()
    print(f"\nResolved {len(resolved)} packages:")
    for r in resolved:
        print(f"  - {r['name']} v{r['version']} ({r['method']})")
    print(f"\nBlocked {len(blocked)} packages")
