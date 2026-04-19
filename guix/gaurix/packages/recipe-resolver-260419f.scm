;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (13 resolved, 13 definitions):
;;;        1.  grub-theme-tela-color (copy-build-system, v2025.02.27, GPL-3.0+)
;;;        2.  pomo-bin (copy-build-system, v0.11.3, MIT)
;;;        3.  3dstool (cmake-build-system, v1.2.6, MIT)
;;;        4.  gruvbox-dark-icons-gtk (copy-build-system, v1.0.0, GPL-3.0+)
;;;        5.  amdgpu-clocks (copy-build-system, v0.4.0, GPL-2.0)
;;;        6.  foxicons-theme (copy-build-system, v1.1, Unlicense)
;;;        7.  plymouth-theme-hexagon-alt-gruvbox (copy-build-system, v1.0.0, GPL-3.0+)
;;;        8.  r47-bin (copy-build-system, v00.109.03.01b1, GPL-3.0+)
;;;        9.  morewaita-icon-theme (meson-build-system, v47.2, GPL-3.0+)
;;;       10.  notwaita-cursor-theme (copy-build-system, v1.0.1, LGPL-3.0)
;;;       11.  chough-bin (copy-build-system, v1.0.0, MIT)
;;;       12.  weylus-bin (copy-build-system, v0.11.4, AGPL-3.0)
;;;       13.  mkbrr-gui-bin (copy-build-system, v1.19.0, GPL-2.0)
;;;
;;; BLOCKED EXHAUSTED (17):
;;;        1.  podserv-b-git — RUST_VENDORED_DEPS
;;;        2.  swhook — RUST_VENDORED_DEPS
;;;        3.  baremetal-compiler-rt — COMPLEX_BUILD: cross-compiler toolchain
;;;        4.  qxmledit — MISSING_GUIX_DEPS: qt5-scxml, qt5-xmlpatterns
;;;        5.  adbfs-rootless-git — MISSING_GUIX_DEPS: android-tools (adb)
;;;        6.  dafny-bin — DOTNET_REQUIRED
;;;        7.  zerx-lab-fluxdown-bin — PROPRIETARY
;;;        8.  lenovo-print-driver-lj2400-m7400-bin — PROPRIETARY_DRIVER
;;;        9.  fw-fanctrl-rs-git — NIGHTLY_RUST_REQUIRED
;;;       10.  aerothemeplasma-desktop-x11-git — MISSING_DEP_CHAIN: aeroshell ecosystem
;;;       11.  aeroshell-workspace-git — MISSING_DEP_CHAIN: aeroshell-libplasma
;;;       12.  aeroshell-kwin-components-git — MISSING_DEP_CHAIN: aeroshell ecosystem
;;;       13.  keks-meet-server — RUST_VENDORED_DEPS + JS_BUILD
;;;       14.  jellything-git — COMPLEX_BUILD: Rust + esbuild + meson
;;;       15.  hurrycurry-server — COMPLEX_BUILD: Rust + Deno + Godot
;;;       16.  gnix — RUST_VENDORED_DEPS
;;;       17.  wireview-linux — DOTNET_REQUIRED + PROPRIETARY_LICENSE
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg)
  #:export (grub-theme-tela-color
            pomo-bin
            3dstool
            gruvbox-dark-icons-gtk
            amdgpu-clocks
            foxicons-theme
            plymouth-theme-hexagon-alt-gruvbox
            r47-bin
            morewaita-icon-theme
            notwaita-cursor-theme
            chough-bin
            weylus-bin
            mkbrr-gui-bin))

;;; ===================================================================
;;; 1. grub-theme-tela-color --- Flat design GRUB theme
;;; ===================================================================
;;;
;;; Source: https://github.com/vinceliuice/grub2-themes
;;; Tela is a flat-design GRUB boot loader theme with multiple color
;;; variants and resolution options.  This installs the color variant
;;; at 1080p resolution.

(define-public grub-theme-tela-color
  (package
    (name "grub-theme-tela-color")
    (version "2025.02.27")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/grub2-themes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("common/" "share/grub/themes/tela-color/")
               ("config/" "share/grub/themes/tela-color/config/")
               ("backgrounds/1080p/background-tela.jpg"
                "share/grub/themes/tela-color/background.jpg"))))
    (home-page "https://github.com/vinceliuice/grub2-themes")
    (synopsis "flat design theme for the GRUB boot loader")
    (description "Tela is a flat-design theme for the GRUB boot loader.  It
provides a clean, modern interface with icon support for various operating
systems.  This package installs the color variant.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 2. pomo-bin --- TUI Pomodoro timer
;;; ===================================================================
;;;
;;; Source: https://github.com/Bahaaio/pomo
;;; A customizable TUI Pomodoro timer with ASCII art and progress bar.

(define-public pomo-bin
  (package
    (name "pomo-bin")
    (version "0.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Bahaaio/pomo/releases/download/v"
                    version "/pomo-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pomo-linux-amd64" "bin/pomo"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pomo")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bahaaio/pomo")
    (synopsis "customizable TUI Pomodoro timer with ASCII art")
    (description "Pomo is a terminal-based Pomodoro timer featuring ASCII art,
a progress bar, and desktop notifications.  It helps manage work sessions
using the Pomodoro technique with customizable durations.")
    (license license:expat)))

;;; ===================================================================
;;; 3. 3dstool --- All-in-one tool for 3DS ROM extraction/creation
;;; ===================================================================
;;;
;;; Source: https://github.com/dnasdw/3dstool
;;; A CLI tool for extracting and creating Nintendo 3DS ROM files.

(define-public 3dstool
  (package
    (name "3dstool")
    (version "1.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dnasdw/3dstool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (inputs (list curl openssl zlib))
    (home-page "https://github.com/dnasdw/3dstool")
    (synopsis "tool for extracting and creating Nintendo 3DS ROM files")
    (description "3dstool is a command-line tool for extracting and creating
Nintendo 3DS ROM container formats including CCI, CXI, CFA, ExeFS, and
RomFS.  It supports various operations on 3DS file system structures.")
    (license license:expat)))

;;; ===================================================================
;;; 4. gruvbox-dark-icons-gtk --- Gruvbox dark icon theme for GTK
;;; ===================================================================
;;;
;;; Source: https://github.com/jmattheis/gruvbox-dark-icons-gtk
;;; GTK icon theme using the Gruvbox dark color palette.

(define-public gruvbox-dark-icons-gtk
  (package
    (name "gruvbox-dark-icons-gtk")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jmattheis/gruvbox-dark-icons-gtk")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/gruvbox-dark/"
                #:exclude ("README.md" "LICENSE" ".git" ".github")))))
    (home-page "https://github.com/jmattheis/gruvbox-dark-icons-gtk")
    (synopsis "gruvbox dark icon theme for GTK desktops")
    (description "A GTK desktop icon theme using the Gruvbox dark color
palette.  It provides application, file type, and status icons styled
with the Gruvbox dark color scheme.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 5. amdgpu-clocks --- Script to control AMDGPU power states
;;; ===================================================================
;;;
;;; Source: https://github.com/sibradzic/amdgpu-clocks
;;; A simple bash script to set custom power states on AMDGPU-driven GPUs.

(define-public amdgpu-clocks
  (package
    (name "amdgpu-clocks")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sibradzic/amdgpu-clocks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amdgpu-clocks" "bin/amdgpu-clocks"))))
    (inputs (list bash))
    (home-page "https://github.com/sibradzic/amdgpu-clocks")
    (synopsis "script to control power states of AMDGPU-driven GPUs")
    (description "Amdgpu-clocks is a bash script that sets custom power
states on AMD GPUs using the AMDGPU kernel driver.  It reads
configuration from a file and applies clock frequency and voltage
settings for the GPU core, memory, and power profile.")
    (license license:gpl2)))

;;; ===================================================================
;;; 6. foxicons-theme --- Linux desktop icon theme
;;; ===================================================================
;;;
;;; Source: https://github.com/SzponerZoli/foxicons-theme
;;; A collection of multi-sized icons organized as a Linux desktop theme.

(define-public foxicons-theme
  (package
    (name "foxicons-theme")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SzponerZoli/foxicons-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/foxicons/"
                #:exclude ("README.md" "LICENSE" ".git" ".github")))))
    (home-page "https://github.com/SzponerZoli/foxicons-theme")
    (synopsis "multi-sized Linux desktop icon theme")
    (description "Foxicons is a collection of multi-sized icons organized
as a Linux desktop icon theme.  It provides application, mime type, and
status icons in multiple sizes.")
    (license license:unlicense)))

;;; ===================================================================
;;; 7. plymouth-theme-hexagon-alt-gruvbox --- Gruvbox Plymouth theme
;;; ===================================================================
;;;
;;; Source: https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox
;;; A Gruvbox recolorization of the hexagon Plymouth boot splash theme.

(define-public plymouth-theme-hexagon-alt-gruvbox
  (package
    (name "plymouth-theme-hexagon-alt-gruvbox")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hexagon_alt_gruvbox/"
                "share/plymouth/themes/hexagon-alt-gruvbox/"))))
    (inputs (list plymouth))
    (home-page "https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox")
    (synopsis "gruvbox-colored hexagon Plymouth boot splash theme")
    (description "A Plymouth boot splash theme based on the hexagon
animation pattern, recolorized with the Gruvbox color palette.  It
provides an animated boot screen with hexagonal geometry in Gruvbox
dark tones.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 8. r47-bin --- Emulator for the R47 pocket calculator
;;; ===================================================================
;;;
;;; Source: https://47calc.com
;;; Binary release of the R47 RPN pocket calculator emulator with GTK3 GUI.

(define-public r47-bin
  (package
    (name "r47-bin")
    (version "00.109.03.01b1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://47calc.com/downloads/R47-"
                    version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("r47" "bin/r47"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/r47")
                          #o755))))))
    (inputs (list gtk+ cairo pulseaudio))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "emulator for the R47 RPN pocket calculator")
    (description "R47 is an emulator for a Reverse Polish Notation (RPN)
pocket calculator.  It provides a GTK3-based graphical interface that
faithfully reproduces the behavior and appearance of the R47 calculator.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 9. morewaita-icon-theme --- Expanded Adwaita companion icon theme
;;; ===================================================================
;;;
;;; Source: https://github.com/somepaulo/MoreWaita
;;; An expanded Adwaita-styled companion icon theme with extra icons
;;; for third-party applications.

(define-public morewaita-icon-theme
  (package
    (name "morewaita-icon-theme")
    (version "47.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/somepaulo/MoreWaita")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (home-page "https://github.com/somepaulo/MoreWaita")
    (synopsis "expanded Adwaita-styled companion icon theme")
    (description "MoreWaita is an icon theme that provides additional
Adwaita-styled icons for third-party applications that do not ship their
own symbolic or full-color icons matching the GNOME design language.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 10. notwaita-cursor-theme --- Adwaita-inspired cursor theme
;;; ===================================================================
;;;
;;; Source: https://github.com/ful1e5/notwaita-cursor
;;; A cursor theme inspired by the Adwaita icons from GNOME.

(define-public notwaita-cursor-theme
  (package
    (name "notwaita-cursor-theme")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ful1e5/notwaita-cursor/releases/download/v"
                    version "/Notwaita-Black.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Notwaita-Black/"))))
    (home-page "https://github.com/ful1e5/notwaita-cursor")
    (synopsis "cursor theme inspired by Adwaita icons from GNOME")
    (description "Notwaita is a cursor theme inspired by the Adwaita icons
from the GNOME desktop environment.  It provides a modern, clean cursor
set with multiple size variants and animation support.")
    (license license:lgpl3)))

;;; ===================================================================
;;; 11. chough-bin --- Fast ASR CLI using Parakeet
;;; ===================================================================
;;;
;;; Source: https://github.com/hyperpuncher/chough
;;; A fast automatic speech recognition CLI tool using the Parakeet
;;; TDT model.  Distributed as a pre-built binary.

(define-public chough-bin
  (package
    (name "chough-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hyperpuncher/chough/releases/download/v"
                    version "/chough-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chough" "bin/chough"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/chough")
                          #o755))))))
    (inputs (list ffmpeg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast automatic speech recognition CLI tool")
    (description "Chough is a command-line tool for fast automatic speech
recognition (ASR) using the Parakeet TDT model.  It can transcribe audio
and video files to text, with support for various input formats via
@code{ffmpeg}.")
    (license license:expat)))

;;; ===================================================================
;;; 12. weylus-bin --- Use tablet as graphic tablet on your computer
;;; ===================================================================
;;;
;;; Source: https://github.com/H-M-H/Weylus
;;; Weylus turns a tablet into a graphic tablet or touch screen for
;;; your computer.  Distributed as a pre-built binary.

(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H-M-H/Weylus/releases/download/v"
                    version "/linux.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("weylus" "bin/weylus"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/weylus")
                          #o755))))))
    (inputs (list libxtst
                  libxcursor
                  libxinerama
                  libxrandr))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as a graphic tablet or touch screen")
    (description "Weylus turns a tablet or smartphone into a graphic
tablet or touch screen for your computer.  It streams the desktop to
a browser on the tablet and relays touch input back, enabling pressure-
sensitive drawing in applications like GIMP or Krita.")
    (license license:agpl3)))

;;; ===================================================================
;;; 13. mkbrr-gui-bin --- GUI for creating and inspecting torrent files
;;; ===================================================================
;;;
;;; Source: https://github.com/autobrr/mkbrr
;;; A tool to create, modify, and inspect .torrent files, distributed
;;; as a pre-built binary with a GTK/WebKit GUI.

(define-public mkbrr-gui-bin
  (package
    (name "mkbrr-gui-bin")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/autobrr/mkbrr/releases/download/v"
                    version "/mkbrr-gui_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mkbrr-gui" "bin/mkbrr-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mkbrr-gui")
                          #o755))))))
    (inputs (list gtk+
                  webkitgtk-with-libsoup2
                  glib))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/autobrr/mkbrr")
    (synopsis "GUI for creating, modifying, and inspecting torrent files")
    (description "Mkbrr is a tool to create, modify, and inspect
@code{.torrent} files.  This package provides the graphical user interface
version built with Tauri (GTK/WebKit).  It supports creating torrents from
files or directories, modifying tracker lists, and inspecting torrent
metadata.")
    (license license:gpl2)))
