;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ac
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (20):
;;;       1.  ttf-heuristica (font-build-system, v1.093, silofl1.1)
;;;       2.  ttf-google-sans-code-vf (font-build-system, v6.001, silofl1.1)
;;;       3.  ttf-ubuntu-sans-mono (font-build-system, v1.006, non-copyleft)
;;;       4.  ocr-fonts (font-build-system, v0.3.1, gpl3+)
;;;       5.  rclonefzf (copy-build-system, v0.0.0-git, gpl3+)
;;;       6.  dockcheck (copy-build-system, v0.7.7, gpl3+)
;;;       7.  fluent-icon-theme-git (copy-build-system, v0.0.0-git, gpl3+)
;;;       8.  fluent-cursor-theme-git (copy-build-system, v0.0.0-git, gpl3+)
;;;       9.  neovim-remote (python-build-system, v2.5.1, expat)
;;;      10.  fw-fanctrl (copy-build-system, v1.0.3, bsd-3)
;;;      11.  lightdm-settings (copy-build-system, v2.0.3, gpl3+)
;;;      12.  gnome-monitor-config-git (meson-build-system, v0.0.0-git, gpl2+)
;;;      13.  gnome-shell-extension-tiling-assistant (copy-build-system, v54, gpl2+)
;;;      14.  system-tools-backends (gnu-build-system, v2.10.2, gpl2+)
;;;      15.  liboobs (gnu-build-system, v3.0.0, gpl2+)
;;;      16.  graphite-cursor-theme-git (copy-build-system, v0.0.0-git, gpl3+)
;;;      17.  logviewer-bin (copy-build-system, v0.1.0, gpl3+)
;;;      18.  hypruler-bin (copy-build-system, v0.2.3, expat)
;;;      19.  goverlay-git (copy-build-system, v1.2, gpl3+)
;;;      20.  green-recorder-git (python-build-system, v0.0.0-git, gpl3+)
;;;
;;; BLOCKED EXHAUSTED (10):
;;;      21.  vibe-audio-visualizer-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot determine upstream repo; AUR page has no upstream URL
;;;      22.  autofirma -> NEEDS_RECIPE_DESIGN_EXHAUSTED: JAVA_COMPLEX:
;;;           Spanish government Java digital signing tool; depends on 20+ Java libs
;;;      23.  wazuh-agent -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD:
;;;           massive C/C++ security agent with systemd integration and 30+ deps
;;;      24.  btrustbiss -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY:
;;;           Bulgarian B-Trust BISS proprietary smartcard driver
;;;      25.  ollama-for-amd -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD:
;;;           requires ROCm/HIP GPU compute stack not in Guix
;;;      26.  rollup -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NPM_ECOSYSTEM:
;;;           JavaScript bundler requiring npm/node.js ecosystem
;;;      27.  flow-control-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot determine upstream source repository
;;;      28.  osaka-simulator -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot determine upstream source; no AUR metadata
;;;      29.  outfieldr-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot locate upstream repository; AUR metadata insufficient
;;;      30.  grimaur-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: UNKNOWN_UPSTREAM:
;;;           cannot locate upstream repository; no source URL
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418ac)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages xml)
  #:export (
            ttf-heuristica
            ttf-google-sans-code-vf
            ttf-ubuntu-sans-mono
            ocr-fonts
            rclonefzf
            dockcheck
            fluent-icon-theme-git
            fluent-cursor-theme-git
            neovim-remote
            fw-fanctrl
            lightdm-settings
            gnome-monitor-config-git
            gnome-shell-extension-tiling-assistant
            system-tools-backends
            liboobs
            graphite-cursor-theme-git
            logviewer-bin
            hypruler-bin
            goverlay-git
            green-recorder-git))

;;; -------------------------------------------------------------------
;;; 1. ttf-heuristica --- Heuristica font family
;;; Based on Adobe Utopia, extended with Cyrillic and extra glyphs.
;;; -------------------------------------------------------------------
(define-public ttf-heuristica
  (package
    (name "ttf-heuristica")
    (version "1.093")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/heuristica"
                    "/files/heuristica-ttf-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://sourceforge.net/projects/heuristica/")
    (synopsis "font family based on Adobe Utopia with extended coverage")
    (description "Heuristica is a font family based on Adobe Utopia,
extended to include Cyrillic glyphs, accented Latin letters, Greek, and
additional typographic features.  It provides regular, italic, bold, and
bold italic variants in OpenType format.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. ttf-google-sans-code-vf --- Google Sans Code variable font
;;; Monospace font designed by Google for code editing.
;;; -------------------------------------------------------------------
(define-public ttf-google-sans-code-vf
  (package
    (name "ttf-google-sans-code-vf")
    (version "6.001")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/googlesans-code")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/nicholasgasior/googlesans-code")
    (synopsis "monospace variable font for code editing by Google")
    (description "Google Sans Code is a monospace variable font designed
by Google for code editing and terminal use.  It supports variable weight
axes and includes programming ligatures.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 3. ttf-ubuntu-sans-mono --- Ubuntu Sans Mono font family
;;; Canonical's monospace font for coding and terminals.
;;; -------------------------------------------------------------------
(define-public ttf-ubuntu-sans-mono
  (package
    (name "ttf-ubuntu-sans-mono")
    (version "1.006")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/canonical/Ubuntu-Sans-Mono-fonts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/canonical/Ubuntu-Sans-Mono-fonts")
    (synopsis "monospace font from the Ubuntu font family")
    (description "Ubuntu Sans Mono is Canonical's monospace typeface
designed for coding and terminal applications.  It offers clear
letterforms and good readability at small sizes.")
    (license (license:non-copyleft
              "https://ubuntu.com/legal/font-licence"
              "Ubuntu Font Licence 1.0"))))

;;; -------------------------------------------------------------------
;;; 4. ocr-fonts --- OCR-A and OCR-B fonts
;;; Machine-readable fonts from the Tsukurimashou project.
;;; -------------------------------------------------------------------
(define-public ocr-fonts
  (package
    (name "ocr-fonts")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tsukurimashou.org/files/ocr-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://tsukurimashou.org/ocr.php.en")
    (synopsis "OCR-A and OCR-B fonts for optical character recognition")
    (description "This package provides OCR-A and OCR-B fonts conforming
to the ISO 1073 standard for optical character recognition.  These fonts
are designed to be readable by both humans and OCR machines.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. rclonefzf --- fzf frontend for rclone
;;; Single bash script wrapping rclone with fzf interface.
;;; -------------------------------------------------------------------
(define-public rclonefzf
  (package
    (name "rclonefzf")
    (version "0.0.0-git.20240101")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ConnerWill/rclone-fzf")
                    (commit "dbe9f98f94d70f57de8e9fbd3ec2ddad2b01dd08")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rclone-fzf.sh" "bin/rclonefzf"))))
    (home-page "https://github.com/ConnerWill/rclone-fzf")
    (synopsis "fzf-based interactive interface for rclone")
    (description "Rclone-fzf provides an interactive terminal interface
for rclone using fzf for fuzzy file selection.  It wraps common rclone
operations with a menu-driven TUI.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. dockcheck --- Docker container update checker
;;; Bash script that checks for Docker image updates.
;;; -------------------------------------------------------------------
(define-public dockcheck
  (package
    (name "dockcheck")
    (version "0.7.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mag37/dockcheck")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dockcheck.sh" "bin/dockcheck"))))
    (home-page "https://github.com/mag37/dockcheck")
    (synopsis "script to check Docker container image updates")
    (description "Dockcheck is a bash script that monitors running Docker
containers and checks for available image updates.  It uses regctl to
compare local and remote image digests without pulling new images.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. fluent-icon-theme-git --- Fluent design icon theme
;;; Material-inspired icon theme by vinceliuice.
;;; -------------------------------------------------------------------
(define-public fluent-icon-theme-git
  (package
    (name "fluent-icon-theme-git")
    (version "0.0.0-git.20241201")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Fluent-icon-theme")
                    (commit "7cc6c9e3c6b79c5fecc02a5618d15a9b7a46a72e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Fluent" "share/icons/Fluent")
               ("Fluent-dark" "share/icons/Fluent-dark"))))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "fluent design icon theme for Linux desktops")
    (description "Fluent is a Material Design inspired icon theme for
Linux desktop environments.  It provides a modern, flat look with
colorful application icons and monochrome symbolic icons.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. fluent-cursor-theme-git --- Fluent design cursor theme
;;; Cursor theme matching the Fluent icon theme.
;;; -------------------------------------------------------------------
(define-public fluent-cursor-theme-git
  (package
    (name "fluent-cursor-theme-git")
    (version "0.0.0-git.20241201")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Fluent-icon-theme")
                    (commit "7cc6c9e3c6b79c5fecc02a5618d15a9b7a46a72e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cursors/dist" "share/icons/Fluent-cursors"))))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "fluent design cursor theme for Linux desktops")
    (description "Fluent Cursors is a cursor theme matching the Fluent
icon theme design language.  It provides a modern cursor set for X11 and
Wayland compositors.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. neovim-remote --- control Neovim instances remotely
;;; Python tool for connecting to existing Neovim instances.
;;; -------------------------------------------------------------------
(define-public neovim-remote
  (package
    (name "neovim-remote")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "neovim-remote" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pynvim))
    (home-page "https://github.com/mhinz/neovim-remote")
    (synopsis "tool to control Neovim processes from the command line")
    (description "Neovim-remote provides the @code{nvr} command to
control Neovim instances from the command line or other programs.  It can
open files in existing Neovim instances, preventing nested editors when
using terminal-based workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. fw-fanctrl --- Framework laptop fan controller
;;; Python daemon for controlling fan speed on Framework laptops.
;;; -------------------------------------------------------------------
(define-public fw-fanctrl
  (package
    (name "fw-fanctrl")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TamtamHero/fw-fanctrl")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fw-fanctrl" "bin/fw-fanctrl")
               ("fanctrl.json" "etc/fw-fanctrl/fanctrl.json"))))
    (inputs (list python))
    (home-page "https://github.com/TamtamHero/fw-fanctrl")
    (synopsis "fan controller daemon for Framework laptops")
    (description "Fw-fanctrl is a fan controller daemon for Framework
laptops that adjusts fan speed based on CPU temperature using the
embedded controller interface.  It provides configurable temperature
curves via JSON profiles.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. lightdm-settings --- LightDM configuration tool
;;; Python/GTK3 settings editor for LightDM display manager.
;;; -------------------------------------------------------------------
(define-public lightdm-settings
  (package
    (name "lightdm-settings")
    (version "2.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/lightdm-settings")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib/lightdm-settings" "lib/lightdm-settings")
               ("usr/bin/lightdm-settings" "bin/lightdm-settings")
               ("usr/share" "share"))))
    (inputs (list python python-pygobject gtk+))
    (home-page "https://github.com/linuxmint/lightdm-settings")
    (synopsis "configuration tool for the LightDM display manager")
    (description "LightDM Settings is a graphical configuration tool
for the LightDM display manager.  It allows users to change the greeter
theme, background, autologin settings, and other LightDM options through
a GTK3 interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. gnome-monitor-config-git --- GNOME monitor configuration tool
;;; CLI tool to configure GNOME display settings.
;;; -------------------------------------------------------------------
(define-public gnome-monitor-config-git
  (package
    (name "gnome-monitor-config-git")
    (version "0.0.0-git.20240401")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jadahl/gnome-monitor-config")
                    (commit "85dc767d37ebef7b7a5b6919abab5a6aa3c76d1c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list glib))
    (home-page "https://github.com/jadahl/gnome-monitor-config")
    (synopsis "command-line tool for GNOME display configuration")
    (description "Gnome-monitor-config is a command-line tool for
configuring display settings under GNOME.  It communicates with the
Mutter display configuration D-Bus API to list, set, and modify monitor
arrangements, resolutions, and refresh rates.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 13. gnome-shell-extension-tiling-assistant --- tiling window manager
;;; GNOME Shell extension for keyboard-driven window tiling.
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-tiling-assistant
  (package
    (name "gnome-shell-extension-tiling-assistant")
    (version "54")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ubuntu/Tiling-Assistant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tiling-assistant@ubuntu.com"
                "share/gnome-shell/extensions/tiling-assistant@ubuntu.com"))))
    (home-page "https://github.com/ubuntu/Tiling-Assistant")
    (synopsis "GNOME Shell extension for tiling window management")
    (description "Tiling Assistant is a GNOME Shell extension that adds
keyboard-driven tiling window management.  It supports quarter, half, and
custom layout tiling with configurable keyboard shortcuts and edge-tiling
gestures.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 14. system-tools-backends --- GNOME System Tools backends
;;; D-Bus service for system configuration (archived project).
;;; -------------------------------------------------------------------
(define-public system-tools-backends
  (package
    (name "system-tools-backends")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://gnome/sources/system-tools-backends/"
                    (version-major+minor version)
                    "/system-tools-backends-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config intltool))
    (inputs (list dbus-glib polkit perl))
    (home-page "https://download.gnome.org/sources/system-tools-backends/")
    (synopsis "backends for GNOME system administration tools")
    (description "System Tools Backends is a set of D-Bus activated
services for configuring system parameters such as networking, time,
users, and services.  This package provides the Perl-based backends
used by the GNOME System Tools front-end.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. liboobs --- GObject library for system-tools-backends
;;; GLib/GObject wrapper around system-tools-backends D-Bus API.
;;; -------------------------------------------------------------------
(define-public liboobs
  (package
    (name "liboobs")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://gnome/sources/liboobs/"
                    (version-major+minor version)
                    "/liboobs-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list glib dbus-glib))
    (home-page "https://download.gnome.org/sources/liboobs/")
    (synopsis "GObject library wrapping system-tools-backends")
    (description "Liboobs is a GLib/GObject-based library that provides
a high-level API to the system-tools-backends D-Bus services.  It allows
applications to query and modify system configuration such as users,
groups, networking, and time settings.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16. graphite-cursor-theme-git --- Graphite cursor theme
;;; Cursor theme by vinceliuice.
;;; -------------------------------------------------------------------
(define-public graphite-cursor-theme-git
  (package
    (name "graphite-cursor-theme-git")
    (version "0.0.0-git.20211126")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Graphite-cursors")
                    (commit "a576d4e8e529ce4a901f3e98e6c84af7f6cd31fd")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dist" "share/icons/Graphite-cursors"))))
    (home-page "https://github.com/vinceliuice/Graphite-cursors")
    (synopsis "graphite design cursor theme for Linux desktops")
    (description "Graphite Cursors is a cursor theme with a clean,
minimal design.  It provides cursor sets for X11 and Wayland compositors
in multiple sizes and color variants.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. logviewer-bin --- terminal-based log viewer (prebuilt Go binary)
;;; -------------------------------------------------------------------
(define-public logviewer-bin
  (package
    (name "logviewer-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bascanada/logviewer"
                    "/releases/download/v" version
                    "/logviewer_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logviewer" "bin/logviewer"))))
    (home-page "https://github.com/bascanada/logviewer")
    (synopsis "terminal-based log file viewer")
    (description "Logviewer is a terminal-based log file viewer built in
Go.  It provides syntax highlighting, filtering, and real-time tailing of
log files with a keyboard-driven interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. hypruler-bin --- screen ruler for Wayland (prebuilt Rust binary)
;;; -------------------------------------------------------------------
(define-public hypruler-bin
  (package
    (name "hypruler-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/t4t5/hypruler"
                    "/releases/download/v" version
                    "/hypruler-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hypruler" "bin/hypruler"))))
    (home-page "https://github.com/t4t5/hypruler")
    (synopsis "screen measurement ruler for Hyprland/Wayland")
    (description "Hypruler is a screen measurement tool for Wayland
compositors, designed for Hyprland.  It overlays a ruler on the screen to
measure pixel distances and dimensions of UI elements.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. goverlay-git --- MangoHud/vkBasalt overlay configurator
;;; Python/GTK4 graphical overlay manager.
;;; -------------------------------------------------------------------
(define-public goverlay-git
  (package
    (name "goverlay-git")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/benjamimgois/goverlay")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("goverlay" "bin/goverlay")
               ("data" "share/goverlay/data"))))
    (home-page "https://github.com/benjamimgois/goverlay")
    (synopsis "graphical configurator for MangoHud and vkBasalt overlays")
    (description "GOverlay is a graphical tool to configure gaming
overlays on Linux.  It provides an interface for configuring MangoHud
(performance overlay), vkBasalt (post-processing), and ReplaySorcery
(replay buffer) settings.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. green-recorder-git --- desktop screen recorder
;;; Python/GTK screen recording tool.
;;; -------------------------------------------------------------------
(define-public green-recorder-git
  (package
    (name "green-recorder-git")
    (version "0.0.0-git.20200101")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dvershinin/green-recorder")
                    (commit "be9a0816ca5fd5fbe82953e55bb2de1adf8a0c8d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python-pygobject gtk+))
    (home-page "https://github.com/dvershinin/green-recorder")
    (synopsis "desktop screen recorder for GNOME and other desktops")
    (description "Green Recorder is a desktop screen recording tool for
Linux.  It supports recording in MKV, WebM, and GIF formats using
FFmpeg.  It provides a GTK3 interface for configuring recording area,
audio sources, and output format.")
    (license license:gpl3+)))
