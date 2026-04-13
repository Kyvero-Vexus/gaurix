;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413l
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 23 recipes created
;;;   - 7 blocked with specific reason codes
;;;
;;; Recipes (23):
;;;   - font-heuristica (font, silofl1.1)
;;;   - font-gelasio (font, silofl1.1)
;;;   - font-lxgw-wenkai-screen (font, silofl1.1)
;;;   - font-lxgw-fasmart-gothic (font, ipa)
;;;   - font-ubuntu-sans-mono (font, ubuntu-font-1.0)
;;;   - font-blobmoji (font, asl2.0)
;;;   - graphite-cursor-theme (copy, gpl3+)
;;;   - rose-pine-hyprcursor (copy, gpl3+)
;;;   - googledot-cursor-theme (copy, gpl3+)
;;;   - phiola-bin (copy, bsd-2)
;;;   - ionosctl-bin (copy, asl2.0)
;;;   - fhc-bin (copy, gpl3+)
;;;   - hypruler-bin (copy, expat)
;;;   - logviewer-bin (copy, gpl3+)
;;;   - termide-bin (copy, expat)
;;;   - gnome-shell-extension-tiling-assistant (copy, gpl2+)
;;;   - gnome-shell-extension-pop-shell (copy, gpl3+)
;;;   - gnome-shell-extension-logo-menu (copy, gpl2+)
;;;   - gnome-shell-extension-just-perfection (copy, gpl3+)
;;;   - gnome-shell-extension-blur-my-shell (copy, expat)
;;;   - gnome-shell-extension-run-or-raise (copy, gpl3+)
;;;   - gnome-shell-extension-panel-date-format (copy, expat)
;;;   - gnome-shell-extension-media-controls (copy, expat)
;;;
;;; Blocked (7):
;;;   - ttf-gelasio-variable (NO_VERSIONED_RELEASE: GitHub repo has no tags/releases)
;;;   - melonds-bin (COMPLEX_REPACK: AppImage inside zip, needs patchelf + ld-wrapper)
;;;   - keystore-explorer-bin (COMPLEX_REPACK: Java app needs JRE wrapper + desktop integration)
;;;   - gnome-shell-extension-wallpaper-slideshow (UUID_UNVERIFIED: source-only, extension UUID needs verification from metadata.json)
;;;   - gnome-shell-extension-ubuntu-dock (COMPLEX_BUILD: fork of dash-to-dock, requires meson build + gettext + glib-compile-schemas)
;;;   - gnome-shell-extension-top-bar-organizer (COMPLEX_BUILD: requires meson + gettext, GitLab GNOME hosted)
;;;   - gnome-shell-extension-fuzzy-app-search (UUID_UNVERIFIED: GitLab GNOME, source-only, extension UUID needs verification)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            font-heuristica
            font-gelasio
            font-lxgw-wenkai-screen
            font-lxgw-fasmart-gothic
            font-ubuntu-sans-mono
            font-blobmoji
            graphite-cursor-theme
            rose-pine-hyprcursor
            googledot-cursor-theme
            phiola-bin
            ionosctl-bin
            fhc-bin
            hypruler-bin
            logviewer-bin
            termide-bin
            gnome-shell-extension-tiling-assistant
            gnome-shell-extension-pop-shell
            gnome-shell-extension-logo-menu
            gnome-shell-extension-just-perfection
            gnome-shell-extension-blur-my-shell
            gnome-shell-extension-run-or-raise
            gnome-shell-extension-panel-date-format
            gnome-shell-extension-media-controls
            ))

;;;
;;; ── FONTS ──────────────────────────────────────────────────────────
;;;

;;; 1. font-heuristica — Serif Latin & Cyrillic font (Adobe Utopia derivative)
;;; AUR: ttf-heuristica  →  Guix: font-heuristica
;;; Upstream: https://sourceforge.net/projects/heuristica/

(define-public font-heuristica
  (package
    (name "font-heuristica")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/heuristica/heuristica-ttf-"
                    version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "https://sourceforge.net/projects/heuristica/")
    (synopsis "serif Latin and Cyrillic font derived from Adobe Utopia")
    (description "Heuristica is a serif font family derived from the Adobe Utopia
typeface.  It provides Regular, Italic, Bold, and Bold-Italic styles covering
Latin and Cyrillic character sets.  Designed by Andrey V. Panov, it extends
Utopia with additional glyphs and improved hinting.")
    (license license:silofl1.1)))

;;; 2. font-gelasio — Serif font metric-compatible with Georgia
;;; AUR: ttf-gelasio  →  Guix: font-gelasio
;;; Upstream: https://github.com/SorkinType/Gelasio

(define-public font-gelasio
  (package
    (name "font-gelasio")
    (version "1.008")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SorkinType/Gelasio")
                    (commit "67a58e647fbd1ee2a44955fc0b442a9f32e21212")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/SorkinType/Gelasio")
    (synopsis "serif font family metric-compatible with Georgia")
    (description "Gelasio is a serif font family designed as a metric-compatible
alternative to Georgia.  It includes Regular, Italic, Bold, and Bold-Italic
styles with both static and variable font files.  Designed by Eben Sorkin
and released under the SIL Open Font License.")
    (license license:silofl1.1)))

;;; 3. font-lxgw-wenkai-screen — LXGW WenKai screen-optimized Chinese font
;;; AUR: ttf-lxgw-wenkai-screen  →  Guix: font-lxgw-wenkai-screen
;;; Upstream: https://github.com/lxgw/LxgwWenKai-Screen

(define-public font-lxgw-wenkai-screen
  (package
    (name "font-lxgw-wenkai-screen")
    (version "1.520")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwWenKai-Screen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/lxgw/LxgwWenKai-Screen")
    (synopsis "screen-optimized Chinese font based on LXGW WenKai")
    (description "LXGW WenKai Screen is a screen-optimized variant of the LXGW
WenKai Chinese font family with enhanced stroke weight for improved
readability on displays.  It includes both the full character set version
and a variant with Roboto Latin glyphs.")
    (license license:silofl1.1)))

;;; 4. font-lxgw-fasmart-gothic — LXGW Fasmart Gothic Chinese font
;;; AUR: ttf-lxgw-fasmart-gothic  →  Guix: font-lxgw-fasmart-gothic
;;; Upstream: https://github.com/lxgw/LxgwFasmartGothic

(define-public font-lxgw-fasmart-gothic
  (package
    (name "font-lxgw-fasmart-gothic")
    (version "1.201")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwFasmartGothic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/lxgw/LxgwFasmartGothic")
    (synopsis "Chinese gothic font based on 03 Smart Font UI")
    (description "LXGW Fasmart Gothic is a Chinese gothic font derived from the
03 Smart Font UI typeface.  It features horizontally compressed letterforms
with a stable and fashionable appearance, new Latin glyphs and kana, and
covers CJK Unified Ideographs.  Released under the IPA Font License.")
    (license license:ipa)))

;;; 5. font-ubuntu-sans-mono — Ubuntu Sans Mono font family
;;; AUR: ttf-ubuntu-sans-mono  →  Guix: font-ubuntu-sans-mono
;;; Upstream: https://github.com/canonical/Ubuntu-Sans-Mono-fonts

(define-public font-ubuntu-sans-mono
  (package
    (name "font-ubuntu-sans-mono")
    (version "1.006")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/canonical/Ubuntu-Sans-Mono-fonts"
                    "/releases/download/v" version
                    "/UbuntuSansMono-fonts-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "https://github.com/canonical/Ubuntu-Sans-Mono-fonts")
    (synopsis "monospaced font from the Ubuntu Sans font family")
    (description "Ubuntu Sans Mono is the monospaced variant of the Ubuntu Sans
font family by Canonical.  It is designed for terminal emulators, code
editors, and other fixed-width contexts.  Includes Regular, Italic, Bold,
and Bold-Italic styles with variable font support.")
    (license (license:non-copyleft
              "https://ubuntu.com/legal/font-licence"
              "Ubuntu Font Licence 1.0"))))

;;; 6. font-blobmoji — Blob-style emoji font (Blobmoji, C1710 fork)
;;; AUR: noto-fonts-emoji-blob  →  Guix: font-blobmoji
;;; Upstream: https://github.com/C1710/blobmoji

(define-public font-blobmoji
  (package
    (name "font-blobmoji")
    (version "15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/C1710/blobmoji/releases/download/v"
                    version "/Blobmoji.ttf"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (copy-file (assoc-ref %build-inputs "source")
                                (string-append font-dir "/Blobmoji.ttf"))))))))
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "blob-style emoji font based on Google Noto emoji")
    (description "Blobmoji is a fork of Google's Noto Color Emoji that brings
back the beloved blob-style emoji designs.  It provides a full set of Unicode
emoji in the distinctive rounded blob style that was used in older Android
versions.  Compatible with modern emoji standards.")
    (license license:asl2.0)))

;;;
;;; ── CURSOR THEMES ──────────────────────────────────────────────────
;;;

;;; 7. graphite-cursor-theme — Graphite-inspired cursor theme
;;; AUR: graphite-cursor-theme-git  →  Guix: graphite-cursor-theme
;;; Upstream: https://github.com/vinceliuice/Graphite-cursors

(define-public graphite-cursor-theme
  (package
    (name "graphite-cursor-theme")
    (version "2021-11-26")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vinceliuice/Graphite-cursors/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dist/" "share/icons/Graphite-cursors/cursors/")
               ("dist-dark/" "share/icons/Graphite-dark-cursors/cursors/")
               ("dist-light/" "share/icons/Graphite-light-cursors/cursors/"))))
    (home-page "https://github.com/vinceliuice/Graphite-cursors")
    (synopsis "cursor theme inspired by the Graphite GTK theme")
    (description "Graphite cursors is an X11 cursor theme inspired by the
Graphite GTK theme.  It provides light, dark, and nord variants with a
clean, modern design.  Pre-built cursor files are included for direct
installation.")
    (license license:gpl3)))

;;; 8. rose-pine-hyprcursor — Rosé Pine themed Hyprcursor cursors
;;; AUR: rose-pine-hyprcursor  →  Guix: rose-pine-hyprcursor
;;; Upstream: https://github.com/ndom91/rose-pine-hyprcursor

(define-public rose-pine-hyprcursor
  (package
    (name "rose-pine-hyprcursor")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ndom91/rose-pine-hyprcursor/releases/download/v"
                    version "/rose-pine-cursor-hyprcursor_" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/rose-pine-hyprcursor/"))))
    (home-page "https://github.com/ndom91/rose-pine-hyprcursor")
    (synopsis "cursor theme with Rosé Pine colors for Hyprcursor")
    (description "Rose Pine Hyprcursor is a remix of the BreezeX cursor theme
with Rosé Pine color palette, packaged for the Hyprcursor cursor
protocol.  It provides cursors compatible with Hyprland's native cursor
rendering system.")
    (license license:gpl3+)))

;;; 9. googledot-cursor-theme — Google-inspired cursor theme
;;; AUR: googledot-cursor-theme  →  Guix: googledot-cursor-theme
;;; Upstream: https://github.com/ful1e5/Google_Cursor

(define-public googledot-cursor-theme
  (package
    (name "googledot-cursor-theme")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ful1e5/Google_Cursor/releases/download/v"
                    version "/GoogleDot-Black.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/GoogleDot-Black/"))))
    (home-page "https://github.com/ful1e5/Google_Cursor")
    (synopsis "cursor theme inspired by Google's Material Design")
    (description "GoogleDot is an X11 cursor theme inspired by Google's
Material Design cursor style.  This package provides the black variant
with a clean, minimal design suitable for modern Linux desktops.")
    (license license:gpl3+)))

;;;
;;; ── BINARY PACKAGES ────────────────────────────────────────────────
;;;

;;; 10. phiola-bin — Fast audio player, recorder, converter
;;; AUR: phiola-bin  →  Guix: phiola-bin
;;; Upstream: https://github.com/stsaz/phiola

(define-public phiola-bin
  (package
    (name "phiola-bin")
    (version "2.7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stsaz/phiola/releases/download/v"
                    version "/phiola-" version "-linux-amd64.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list zstd))
    (arguments
     (list #:install-plan
           #~'(("phiola" "bin/phiola"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast audio player, recorder, and converter")
    (description "Phiola is a fast audio player, recorder, and converter for
the command line.  It supports multiple audio formats and provides low-latency
playback via ALSA, PulseAudio, or JACK.")
    (home-page "https://github.com/stsaz/phiola")
    (license license:bsd-2)))

;;; 11. ionosctl-bin — IONOS Cloud CLI
;;; AUR: ionosctl-bin  →  Guix: ionosctl-bin
;;; Upstream: https://github.com/ionos-cloud/ionosctl

(define-public ionosctl-bin
  (package
    (name "ionosctl-bin")
    (version "6.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ionos-cloud/ionosctl/releases/download/v"
                    version "/ionosctl-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ionosctl" "bin/ionosctl"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for IONOS Cloud services")
    (description "Ionosctl is the official command-line interface for managing
IONOS Cloud infrastructure.  It provides commands for provisioning and
managing virtual data centers, servers, volumes, load balancers, and
other cloud resources.")
    (home-page "https://github.com/ionos-cloud/ionosctl")
    (license license:asl2.0)))

;;; 12. fhc-bin — Fast HTTP Checker
;;; AUR: fhc-bin  →  Guix: fhc-bin
;;; Upstream: https://github.com/Edu4rdSHL/fhc

(define-public fhc-bin
  (package
    (name "fhc-bin")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Edu4rdSHL/fhc/releases/download/"
                    version "/fhc-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("fhc" "bin/fhc"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast HTTP status checker for URLs")
    (description "FHC (Fast HTTP Checker) is a command-line tool for quickly
checking the HTTP status of a list of URLs.  It performs concurrent requests
and reports response status codes, useful for reconnaissance and bulk URL
validation.")
    (home-page "https://github.com/Edu4rdSHL/fhc")
    (license license:gpl3+)))

;;; 13. hypruler-bin — Screen measurement tool for Hyprland
;;; AUR: hypruler-bin  →  Guix: hypruler-bin
;;; Upstream: https://github.com/t4t5/hypruler

(define-public hypruler-bin
  (package
    (name "hypruler-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/t4t5/hypruler/releases/download/v"
                    version "/hypruler"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hypruler" "bin/hypruler"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "hypruler")
                   (chmod "hypruler" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "measure anything on your screen in Hyprland")
    (description "Hypruler is a screen measurement tool for the Hyprland
Wayland compositor.  It lets you measure distances, areas, and angles
directly on your screen using an overlay.")
    (home-page "https://github.com/t4t5/hypruler")
    (license license:expat)))

;;; 14. logviewer-bin — CLI log client for multiple sources
;;; AUR: logviewer-bin  →  Guix: logviewer-bin
;;; Upstream: https://github.com/bascanada/logviewer

(define-public logviewer-bin
  (package
    (name "logviewer-bin")
    (version "0.1.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bascanada/logviewer/releases/download/v"
                    version "/logviewer_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logviewer" "bin/logviewer"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI log viewer for Splunk, Kubernetes, and Docker")
    (description "Logviewer is a command-line log client that aggregates logs
from multiple sources including Splunk, Kubernetes pods, and Docker
containers.  It provides a unified interface for tailing and searching
log streams.")
    (home-page "https://github.com/bascanada/logviewer")
    (license license:gpl3+)))

;;; 15. termide-bin — Cross-platform terminal IDE and file manager
;;; AUR: termide-bin  →  Guix: termide-bin
;;; Upstream: https://github.com/termide/termide

(define-public termide-bin
  (package
    (name "termide-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/termide/termide/releases/download/"
                    version "/termide-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("termide" "bin/termide"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform terminal IDE and file manager")
    (description "Termide is a cross-platform terminal-based IDE and file
manager.  It provides an integrated development environment within the
terminal, combining a text editor, file browser, and virtual terminal
in a single application.")
    (home-page "https://github.com/termide/termide")
    (license license:expat)))

;;;
;;; ── GNOME SHELL EXTENSIONS ─────────────────────────────────────────
;;;

;;; 16. gnome-shell-extension-tiling-assistant — Windows-like snap assist
;;; AUR: gnome-shell-extension-tiling-assistant  →  Guix: gnome-shell-extension-tiling-assistant
;;; Upstream: https://github.com/ubuntu/Tiling-Assistant
;;; UUID: tiling-assistant@leleat-on-github

(define-public gnome-shell-extension-tiling-assistant
  (package
    (name "gnome-shell-extension-tiling-assistant")
    (version "54")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ubuntu/Tiling-Assistant/releases/download/v"
                    version "/tiling-assistant%40leleat-on-github.shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/tiling-assistant@leleat-on-github/"))))
    (synopsis "Windows-like snap assist for GNOME Shell")
    (description "Tiling Assistant is a GNOME Shell extension that adds
Windows-like snap assist and tiling window management features to the
GNOME desktop.  It provides edge tiling, quarter tiling, and a snap
assist popup for organizing windows.")
    (home-page "https://github.com/ubuntu/Tiling-Assistant")
    (license license:gpl2+)))

;;; 17. gnome-shell-extension-pop-shell — Pop!_OS tiling window manager
;;; AUR: gnome-shell-extension-pop-shell-git  →  Guix: gnome-shell-extension-pop-shell
;;; Upstream: https://github.com/pop-os/shell
;;; UUID: pop-shell@system76.com

(define-public gnome-shell-extension-pop-shell
  (package
    (name "gnome-shell-extension-pop-shell")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pop-os/shell/releases/download/"
                    version "/pop-shell%40system76.com_" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/pop-shell@system76.com/"))))
    (synopsis "tiling window management extension for GNOME Shell")
    (description "Pop Shell is a GNOME Shell extension by System76 that
provides advanced tiling window management features.  It adds keyboard-driven
window tiling, stacking, and a launcher overlay inspired by the Pop!_OS
desktop experience.")
    (home-page "https://github.com/pop-os/shell")
    (license license:gpl3+)))

;;; 18. gnome-shell-extension-logo-menu — Quick access panel menu
;;; AUR: gnome-shell-extension-logo-menu  →  Guix: gnome-shell-extension-logo-menu
;;; Upstream: https://github.com/Aryan20/Logomenu
;;; UUID: logomenu@aryan_k

(define-public gnome-shell-extension-logo-menu
  (package
    (name "gnome-shell-extension-logo-menu")
    (version "24.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Aryan20/Logomenu/releases/download/v"
                    version "_100326/logomenu%40aryan_k.shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/logomenu@aryan_k/"))))
    (synopsis "quick access menu for the GNOME panel")
    (description "Logo Menu is a GNOME Shell extension that replaces the
Activities button with a customizable logo that opens a quick access
menu.  It provides shortcuts to system settings, power options, and
frequently used applications.")
    (home-page "https://github.com/Aryan20/Logomenu")
    (license license:gpl2+)))

;;; 19. gnome-shell-extension-just-perfection — Desktop customization
;;; AUR: gnome-shell-extension-just-perfection-desktop  →  Guix: gnome-shell-extension-just-perfection
;;; Upstream: https://gitlab.gnome.org/jrahmatzadeh/just-perfection
;;; UUID: just-perfection-desktop@just-perfection

(define-public gnome-shell-extension-just-perfection
  (package
    (name "gnome-shell-extension-just-perfection")
    (version "36")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://extensions.gnome.org/extension-data/"
                    "just-perfection-desktopjust-perfection.v"
                    version ".shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/just-perfection-desktop@just-perfection/"))))
    (synopsis "GNOME Shell desktop customization extension")
    (description "Just Perfection is a GNOME Shell extension that provides
extensive customization options for the GNOME desktop.  It allows tweaking
the visibility and behavior of UI elements including the panel, dash,
overview, workspace switcher, and more.")
    (home-page "https://gitlab.gnome.org/jrahmatzadeh/just-perfection")
    (license license:gpl3+)))

;;; 20. gnome-shell-extension-blur-my-shell — Blur effects for GNOME Shell
;;; AUR: gnome-shell-extension-blur-my-shell  →  Guix: gnome-shell-extension-blur-my-shell
;;; Upstream: https://github.com/aunetx/blur-my-shell
;;; UUID: blur-my-shell@aunetx

(define-public gnome-shell-extension-blur-my-shell
  (package
    (name "gnome-shell-extension-blur-my-shell")
    (version "67")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://extensions.gnome.org/extension-data/"
                    "blur-my-shellaunetx.v"
                    version ".shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/blur-my-shell@aunetx/"))))
    (synopsis "blur effect for GNOME Shell UI elements")
    (description "Blur My Shell is a GNOME Shell extension that adds a blur
effect to different parts of the GNOME Shell interface, including the
overview, panel, dash, and lock screen.  It provides configurable blur
sigma, brightness, and per-component settings.")
    (home-page "https://github.com/aunetx/blur-my-shell")
    (license license:gpl3+)))

;;; 21. gnome-shell-extension-run-or-raise — Launch or focus windows
;;; AUR: gnome-shell-extension-run-or-raise  →  Guix: gnome-shell-extension-run-or-raise
;;; Upstream: https://github.com/CZ-NIC/run-or-raise
;;; UUID: run-or-raise@edvard.cz

(define-public gnome-shell-extension-run-or-raise
  (package
    (name "gnome-shell-extension-run-or-raise")
    (version "44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CZ-NIC/run-or-raise/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/run-or-raise@edvard.cz/"
                #:exclude ("README.md" "LICENSE" ".github" "Makefile"
                           "screenshots" "docs")))))
    (synopsis "launch or focus window shortcuts for GNOME Shell")
    (description "Run or Raise is a GNOME Shell extension that lets you
define keyboard shortcuts that either launch an application or focus its
existing window.  Shortcuts are defined in a simple text configuration
file, enabling fast window switching without a mouse.")
    (home-page "https://github.com/CZ-NIC/run-or-raise")
    (license license:gpl3+)))

;;; 22. gnome-shell-extension-panel-date-format — Custom panel date format
;;; AUR: gnome-shell-extension-panel-date-format  →  Guix: gnome-shell-extension-panel-date-format
;;; Upstream: https://github.com/KEIII/gnome-shell-panel-date-format
;;; UUID: panel-date-format@keiii.github.io

(define-public gnome-shell-extension-panel-date-format
  (package
    (name "gnome-shell-extension-panel-date-format")
    (version "24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KEIII/gnome-shell-panel-date-format"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/panel-date-format@keiii.github.io/"
                #:exclude ("README.md" "LICENSE" ".github" "Makefile"
                           "screenshots")))))
    (synopsis "customize the date format on the GNOME panel")
    (description "Panel Date Format is a GNOME Shell extension that allows
customizing the date and time format displayed on the top panel.  It uses
GLib date format strings, giving full control over which components are
shown and how they are formatted.")
    (home-page "https://github.com/KEIII/gnome-shell-panel-date-format")
    (license license:expat)))

;;; 23. gnome-shell-extension-media-controls — Media playback controls
;;; AUR: gnome-shell-extension-media-controls  →  Guix: gnome-shell-extension-media-controls
;;; Upstream: https://github.com/sakithb/media-controls
;;; UUID: mediacontrols@cliffniff.github.com

(define-public gnome-shell-extension-media-controls
  (package
    (name "gnome-shell-extension-media-controls")
    (version "60")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://extensions.gnome.org/extension-data/"
                    "mediacontrolscliffniff.github.com.v"
                    version ".shell-extension.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell/extensions/mediacontrols@cliffniff.github.com/"))))
    (synopsis "media playback controls for the GNOME panel")
    (description "Media Controls is a GNOME Shell extension that displays
media playback information and controls on the top panel.  It shows the
currently playing track with artist and title, and provides play/pause,
next, and previous buttons for any MPRIS-compatible media player.")
    (home-page "https://github.com/sakithb/media-controls")
    (license license:expat)))
