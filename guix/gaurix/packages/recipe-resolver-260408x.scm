;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260408x
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 7 finalized from recipe-resolver-260408r (already have recipes)
;;;   - 8 binary repacks (copy-build-system)
;;;   - 2 source builds (cmake/gnu-build-system)
;;;   - 3 shell/script packages (copy-build-system)
;;;   - 10 re-evaluated with concrete blocking reasons
;;;
;;; Finalized from recipe-resolver-260408r (7):
;;;   - xdg-terminal-exec: XDG default terminal launcher (shell script)
;;;   - bfg-repo-cleaner: Git repo cleaner (Java jar)
;;;   - whitesur-icon-theme: macOS Big Sur icon theme
;;;   - github-desktop-plus-bin: GitHub Desktop fork (AppImage)
;;;   - seamonkey-bin: internet application suite (binary tarball)
;;;   - dupeguru: duplicate file finder (Python .deb)
;;;   - sourcegit-bin: cross-platform Git GUI (.NET AppImage)
;;;
;;; New recipes (13):
;;;   - clipsync: clipboard synchronization for Wayland (shell scripts)
;;;   - dmenustatus: statusbar for dmenu (C/Make)
;;;   - task-manager: lightweight Linux task manager (C++/CMake)
;;;   - bridge-core-bin: Minecraft Add-On IDE (binary)
;;;   - tmodloader-bin: Terraria mod loader (binary)
;;;   - music-assistant-desktop-bin: Music Assistant companion app (binary)
;;;   - snapmaker-orca-appimage: OrcaSlicer 3D printing tool (AppImage)
;;;   - adb-gui-kit-bin: ADB/Fastboot GUI tool (binary)
;;;   - xapp-appimage-thumbnailer: AppImage thumbnailer (Python/Meson)
;;;   - mev-boost-bin: MEV middleware for Ethereum validators (Go binary)
;;;   - surge-bin: terminal download manager (Go binary)
;;;   - konfyt: digital keyboard workstation (C++/Qt5)
;;;   - alix: interactive alias manager for shells (Python)
;;;
;;; Re-evaluated (blocked with specific reasons, 10):
;;;   - rexit-git: CARGO_DEPS_NOT_AVAILABLE
;;;   - tuack-ng-git: CARGO_DEPS_NOT_AVAILABLE
;;;   - upi: CARGO_DEPS_NOT_AVAILABLE
;;;   - alacritty-nox-git: CARGO_DEPS_NOT_AVAILABLE (variant of upstream)
;;;   - ethtui: CARGO_DEPS_NOT_AVAILABLE
;;;   - oxicord-git: CARGO_DEPS_NOT_AVAILABLE
;;;   - zerobrew-git: CARGO_DEPS_NOT_AVAILABLE
;;;   - archforge-git: ARCH_SPECIFIC + CARGO_DEPS_NOT_AVAILABLE
;;;   - codelldb: COMPLEX_MULTI_TOOL (Rust + LLDB + Node.js)
;;;   - bsky-electron-git: ELECTRON_NOT_IN_GUIX
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408x)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:export (
            ;; shell/script packages
            clipsync
            ;; source builds
            dmenustatus
            task-manager
            konfyt
            ;; binary repacks
            bridge-core-bin
            tmodloader-bin
            music-assistant-desktop-bin
            snapmaker-orca-appimage
            adb-gui-kit-bin
            mev-boost-bin
            surge-bin
            ;; Python
            alix
            ;; thumbnailer
            xapp-appimage-thumbnailer))


;;; ── clipsync ──────────────────────────────────────────────────
;;; Clipboard synchronization script for Wayland compositors
;;; (X11 <--> Wayland clipboard bridging)
;;;
(define-public clipsync
  (package
    (name "clipsync")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SHORiN-KiWATA/clipsync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipsync.sh" "bin/clipsync"))))
    (home-page "https://github.com/SHORiN-KiWATA/clipsync")
    (synopsis "clipboard synchronization between X11 and Wayland")
    (description
     "Clipsync is a clipboard synchronization script for Wayland
compositors.  It bridges the X11 and Wayland clipboards so that
copy-paste works seamlessly between XWayland and native Wayland
applications.")
    (license license:expat)))


;;; ── dmenustatus ──────────────────────────────────────────────
;;; A statusbar for dmenu written in C
;;;
(define-public dmenustatus
  (package
    (name "dmenustatus")
    (version "0.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Quadsam/dmenustatus")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" ,(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/Quadsam/dmenustatus")
    (synopsis "statusbar for dmenu written in C")
    (description
     "Dmenustatus is a lightweight statusbar for dmenu written in C.  It
displays system information such as CPU usage, memory, battery, volume,
and date/time in the dmenu bar.")
    (license license:agpl3+)))


;;; ── task-manager ──────────────────────────────────────────────
;;; A simple Linux task manager inspired by Windows taskmgr
;;;
(define-public task-manager
  (package
    (name "task-manager")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Codiak540/Linux-Task-Manager/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Codiak540/Linux-Task-Manager")
    (synopsis "lightweight task manager for Linux")
    (description
     "Task Manager is a simple, lightweight task manager for Linux inspired
by the Windows task manager.  It provides a graphical interface to view
and manage running processes.")
    (license license:gpl3+)))


;;; ── bridge-core-bin ──────────────────────────────────────────
;;; bridge. The IDE for Minecraft Add-Ons
;;;
(define-public bridge-core-bin
  (package
    (name "bridge-core-bin")
    (version "2.7.54")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bridge-core/editor/releases/download/v"
             version "/bridge-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bridge-core/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bridge-core.app/")
    (synopsis "IDE for Minecraft Bedrock Edition add-ons")
    (description
     "bridge. is a powerful IDE for creating Minecraft Bedrock Edition
add-ons.  It provides syntax highlighting, auto-completions, file
validation, and a rich plugin system for add-on development.  This
package is distributed as a pre-built binary.")
    (license license:gpl3)))


;;; ── tmodloader-bin ──────────────────────────────────────────
;;; Terraria mod loader
;;;
(define-public tmodloader-bin
  (package
    (name "tmodloader-bin")
    (version "2026.02.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tModLoader/tModLoader/releases/download/v"
             version "/tModLoader.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tmodloader/"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tmodloader.net/")
    (synopsis "open-source mod loader for Terraria")
    (description
     "tModLoader is an open-source, community-driven modification and
expansion of the Terraria game.  It provides a modding API and mod
browser for discovering and installing community-created content.
This package is distributed as a pre-built binary.")
    (license license:expat)))


;;; ── music-assistant-desktop-bin ──────────────────────────────
;;; Music Assistant Desktop Companion App
;;;
(define-public music-assistant-desktop-bin
  (package
    (name "music-assistant-desktop-bin")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/music-assistant/desktop-app/releases/download/v"
             version "/music-assistant-desktop_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/music-assistant-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/music-assistant/desktop-app")
    (synopsis "desktop companion app for Music Assistant")
    (description
     "Music Assistant Desktop is the companion desktop application for
Music Assistant, a free and open-source music management solution.
This package is distributed as a pre-built binary from the upstream
project.")
    (license license:asl2.0)))


;;; ── snapmaker-orca-appimage ──────────────────────────────────
;;; OrcaSlicer 3D printer slicer (Snapmaker fork)
;;;
(define-public snapmaker-orca-appimage
  (package
    (name "snapmaker-orca-appimage")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Snapmaker/OrcaSlicer/releases/download/v"
             version "/OrcaSlicer_Linux_V" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("OrcaSlicer.AppImage" "bin/orca-slicer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Snapmaker/OrcaSlicer/")
    (synopsis "g-code generator for 3D printers based on OrcaSlicer")
    (description
     "Snapmaker OrcaSlicer is a g-code generator (slicer) for 3D printers
supporting Bambu, Prusa, Voron, VzBot, RatRig, Creality and other
printer brands.  It is a fork of the OrcaSlicer project with Snapmaker
printer support.  This package is distributed as an AppImage.")
    (license license:agpl3)))


;;; ── adb-gui-kit-bin ──────────────────────────────────────────
;;; A simple, modern GUI for ADB and Fastboot
;;;
(define-public adb-gui-kit-bin
  (package
    (name "adb-gui-kit-bin")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Drenzzz/adb-gui-kit/releases/download/v"
             version "/adb-gui-kit-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/adb-gui-kit/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Drenzzz/adb-gui-kit")
    (synopsis "modern GUI for ADB and Fastboot commands")
    (description
     "ADB GUI Kit is a simple, modern graphical interface for Android Debug
Bridge (ADB) and Fastboot commands.  It simplifies common Android
device management tasks.  This package is distributed as a pre-built
binary from the upstream project.")
    (license (license:non-copyleft
              "https://github.com/Drenzzz/adb-gui-kit/blob/main/LICENSE"
              "Custom license"))))


;;; ── xapp-appimage-thumbnailer ──────────────────────────────
;;; AppImage thumbnailer from Linux Mint
;;;
(define-public xapp-appimage-thumbnailer
  (package
    (name "xapp-appimage-thumbnailer")
    (version "1.2.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linuxmint/xapp-thumbnailers")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("appimage/" "share/xapp-appimage-thumbnailer/"))))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "AppImage thumbnail generator for file managers")
    (description
     "Xapp AppImage Thumbnailer generates thumbnail previews for AppImage
files in file managers.  It extracts the embedded icon from AppImage
files and presents it as the file thumbnail.  Part of the Linux Mint
xapp-thumbnailers collection.")
    (license license:gpl3+)))


;;; ── mev-boost-bin ──────────────────────────────────────────
;;; MEV middleware for Ethereum validators
;;;
(define-public mev-boost-bin
  (package
    (name "mev-boost-bin")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/flashbots/mev-boost/releases/download/v"
             version "/mev-boost_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mev-boost" "bin/mev-boost"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://boost.flashbots.net/")
    (synopsis "MEV-Boost middleware for Ethereum proof-of-stake validators")
    (description
     "MEV-Boost allows Ethereum proof-of-stake validators to access blocks
from a competitive builder marketplace.  It implements the proposer-
builder separation (PBS) scheme for maximizing validator rewards.  This
package is distributed as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── surge-bin ──────────────────────────────────────────────
;;; Blazing fast terminal download manager
;;;
(define-public surge-bin
  (package
    (name "surge-bin")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/surge-downloader/surge/releases/download/v"
             version "/surge_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("surge" "bin/surge"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/surge-downloader/surge")
    (synopsis "blazing fast terminal download manager built in Go")
    (description
     "Surge is a blazing fast, open-source terminal (TUI) download manager
built in Go.  It supports multi-threaded downloading, resumable
transfers, and a clean terminal interface.  This package is distributed
as a pre-built binary from the upstream project.")
    (license license:expat)))


;;; ── konfyt ──────────────────────────────────────────────────
;;; Digital keyboard workstation for Linux
;;;
(define-public konfyt
  (package
    (name "konfyt")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/noedigcode/konfyt/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "http://www.noedig.co.za/konfyt")
    (synopsis "digital keyboard workstation for Linux with MIDI support")
    (description
     "Konfyt is a digital keyboard workstation for Linux that allows
musicians to set up patches with multiple layers of soundfonts,
SFZ instruments, and audio input ports.  It uses JACK for audio
and MIDI routing and supports MIDI filtering and scripting.")
    (license license:gpl3)))


;;; ── alix ──────────────────────────────────────────────────
;;; Interactive alias manager for shells
;;;
(define-public alix
  (package
    (name "alix")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TheDevOpsBlueprint/alix-cli")
             (commit "f355086")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alix/"))))
    (home-page "https://github.com/TheDevOpsBlueprint/alix-cli")
    (synopsis "interactive alias manager for your shell")
    (description
     "Alix is an interactive alias manager for shells.  It provides a TUI
for creating, editing, searching, and organizing shell aliases with
features like fuzzy search and clipboard integration.")
    (license license:expat)))
