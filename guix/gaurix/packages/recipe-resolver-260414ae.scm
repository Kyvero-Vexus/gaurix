;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414ae
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 8 new recipes (5 binary, 3 source)
;;;   - 3 resolved via existing recipes (calculix-ccx, deezer-enhanced-git, waterfox)
;;;   - 19 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with concrete reasons
;;;
;;; NOTE: All sha256 hashes are placeholders pending verification via
;;; `guix download`.

(define-module (gaurix packages recipe-resolver-260414ae)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:export (ksnip-bin
            veracrypt-bin
            hyprshell-bin
            youtube-dl-gui-bin
            norisk-client-launcher-nvidia-bin
            neural-amp-modeler-lv2
            ultimate-tic-tac-toe
            plasma-gamemode))

;;; waterfox-bin already exists in recipe-resolver-260412b.scm (v6.0.4).
;;; #11701 waterfox resolved via existing recipe.

;;;
;;; --- 1. ksnip-bin (copy-build-system) ---
;;; Screenshot and annotation tool.  AppImage from GitHub releases.
;;; Resolves #6811 ksnip-git.
;;; Source: https://github.com/ksnip/ksnip
;;;

(define-public ksnip-bin
  (package
    (name "ksnip-bin")
    (version "1.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ksnip/ksnip/releases/download/v"
                    version "/ksnip-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ksnip.AppImage" "bin/ksnip"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "ksnip.AppImage")
                     (chmod "ksnip.AppImage" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ksnip/ksnip")
    (synopsis "cross-platform screenshot and annotation tool")
    (description "Ksnip is a Qt-based screenshot tool that provides annotation
functionality including lines, arrows, rectangles, ellipses, text, and
blur/pixelate effects.  It supports multiple capture modes including
rectangular, full-screen, and window capture.  This package provides the
prebuilt AppImage binary.")
    (license license:gpl2+)))

;;;
;;; --- 3. veracrypt-bin (copy-build-system) ---
;;; Disk encryption tool.  AppImage from GitHub releases.
;;; Resolves #6797 veracrypt-git.
;;; Source: https://github.com/veracrypt/VeraCrypt
;;;

(define-public veracrypt-bin
  (package
    (name "veracrypt-bin")
    (version "1.26.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/veracrypt/VeraCrypt/releases/download/"
                    "VeraCrypt_" version
                    "/VeraCrypt-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("veracrypt.AppImage" "bin/veracrypt"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "veracrypt.AppImage")
                     (chmod "veracrypt.AppImage" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.veracrypt.fr/")
    (synopsis "disk encryption tool based on TrueCrypt")
    (description "VeraCrypt is a disk encryption tool that creates encrypted
volumes, partitions, and entire drives.  It provides on-the-fly encryption
with support for AES, Serpent, Twofish, Camellia, and Kuznyechik ciphers,
as well as combinations thereof.  This package provides the prebuilt
AppImage binary for x86_64 Linux.")
    ;; VeraCrypt License based on TrueCrypt License 3.0 + Apache 2.0
    (license (license:non-copyleft
              "https://www.veracrypt.fr/en/VeraCrypt%20License.html"
              "VeraCrypt License"))))

;;;
;;; --- 4. hyprshell-bin (copy-build-system) ---
;;; GTK4-based window switcher/launcher for Hyprland.
;;; Prebuilt binary from GitHub releases.
;;; Resolves #7519 hyprshell.
;;; Source: https://github.com/h3rmt/hyprshell
;;;

(define-public hyprshell-bin
  (package
    (name "hyprshell-bin")
    (version "4.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H3rmt/hyprshell/releases/download/v"
                    version "/hyprshell-" version "-x86_64.tar.zst"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprshell" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/h3rmt/hyprshell")
    (synopsis "GTK4-based window switcher and application launcher for Hyprland")
    (description "Hyprshell is a modern GTK4-based window switcher and
application launcher designed for the Hyprland Wayland compositor.  It provides
fast application launching, window switching, and customizable appearance.
This package provides prebuilt binaries for x86_64 Linux.")
    (license license:expat)))

;;;
;;; --- 5. youtube-dl-gui-bin (copy-build-system) ---
;;; Cross-platform GUI for youtube-dl/yt-dlp.  AppImage from GitHub.
;;; Resolves #7671 youtube-dl-gui.
;;; Source: https://github.com/StefanLobbenmeier/youtube-dl-gui
;;;

(define-public youtube-dl-gui-bin
  (package
    (name "youtube-dl-gui-bin")
    (version "2.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StefanLobbenmeier/youtube-dl-gui"
                    "/releases/download/v" version
                    "/Open-Video-Downloader-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("youtube-dl-gui.AppImage" "bin/youtube-dl-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "youtube-dl-gui.AppImage")
                     (chmod "youtube-dl-gui.AppImage" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/StefanLobbenmeier/youtube-dl-gui")
    (synopsis "cross-platform graphical interface for yt-dlp")
    (description "Open Video Downloader (youtube-dl-gui) is a graphical
interface for yt-dlp (formerly youtube-dl) built with Electron and Node.js.
It provides a user-friendly way to download videos from YouTube and many
other websites.  This package provides the prebuilt AppImage binary.")
    (license license:agpl3+)))

;;;
;;; --- 6. norisk-client-launcher-nvidia-bin (copy-build-system) ---
;;; NoRisk Minecraft client launcher (nvidia variant).  AppImage from GitHub.
;;; Resolves #7203 norisk-client-launcher-nvidia.
;;; Source: https://github.com/NoRiskClient/noriskclient-launcher
;;;

(define-public norisk-client-launcher-nvidia-bin
  (package
    (name "norisk-client-launcher-nvidia-bin")
    (version "0.6.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NoRiskClient/noriskclient-launcher"
                    "/releases/download/v" version
                    "/NoRiskClient-Linux.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("norisk-client.AppImage" "bin/norisk-client-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "norisk-client.AppImage")
                     (chmod "norisk-client.AppImage" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://norisk.gg/")
    (synopsis "NoRisk Minecraft client launcher")
    (description "NoRisk Client is a Minecraft client launcher built with
Tauri that provides enhanced gameplay features and modifications.  This
package provides the prebuilt AppImage binary for Linux, including the
NVIDIA variant with appropriate GPU runtime support.")
    (license license:gpl3)))

;;;
;;; --- 7. neural-amp-modeler-lv2 (cmake-build-system) ---
;;; Neural Amp Modeler LV2 plugin for guitar amp simulation.
;;; Resolves #11070 neural-amp-modeler-lv2.
;;; Source: https://github.com/mikeoliphant/neural-amp-modeler-lv2
;;;

(define-public neural-amp-modeler-lv2
  (package
    (name "neural-amp-modeler-lv2")
    (version "0.1.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikeoliphant/neural-amp-modeler-lv2")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config))
    (inputs (list lv2))
    (home-page "https://github.com/mikeoliphant/neural-amp-modeler-lv2")
    (synopsis "neural amp modeler LV2 plugin for guitar tone simulation")
    (description "Neural Amp Modeler LV2 is a plugin for simulating guitar
amplifier tones using neural network models.  It loads @file{.nam} model
files trained from real amplifier captures and runs them in real-time as
an LV2 audio plugin, compatible with hosts like Ardour, Carla, and
JACK-based pedalboards.")
    (license license:gpl3)))

;;;
;;; --- 8. ultimate-tic-tac-toe (meson-build-system) ---
;;; GNOME/GTK4 ultimate tic-tac-toe game.
;;; Resolves #7624 ultimate-tic-tac-toe-git.
;;; Source: https://github.com/Nokse22/ultimate-tic-tac-toe
;;;

(define-public ultimate-tic-tac-toe
  (package
    (name "ultimate-tic-tac-toe")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nokse22/ultimate-tic-tac-toe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t
           #:tests? #f))  ;; no test suite
    (native-inputs
     (list blueprint-compiler
           desktop-file-utils
           gettext-minimal
           (@ (gnu packages glib) glib)
           pkg-config))
    (inputs
     (list gtk
           libadwaita
           python
           python-pygobject))
    (home-page "https://github.com/Nokse22/ultimate-tic-tac-toe")
    (synopsis "ultimate tic-tac-toe game for GNOME")
    (description "Ultimate Tic Tac Toe is a strategic variant of the classic
game where each cell contains a smaller tic-tac-toe board.  Built with
GTK4 and libadwaita, it integrates with the GNOME desktop and provides
a clean, modern interface for playing against another human locally.")
    (license license:gpl3)))

;;;
;;; --- 9. plasma-gamemode (cmake-build-system) ---
;;; GameMode UI for KDE Plasma Desktop.
;;; Resolves #7677 plasma-gamemode-git.
;;; Source: https://invent.kde.org/sitter/plasma-gamemode
;;;

(define-public plasma-gamemode
  (package
    (name "plasma-gamemode")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://invent.kde.org/sitter/plasma-gamemode.git")
                    (commit "4d603583e1e86f93d51c9a2a6e2e37daab119d57")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_CXX_STANDARD=20"))))
    (native-inputs
     (list extra-cmake-modules
           gettext-minimal))
    (inputs
     (list gamemode
           kcoreaddons
           kdbusaddons
           kdeclarative
           ki18n
           kirigami
           libplasma
           qtbase
           qtdeclarative))
    (home-page "https://invent.kde.org/sitter/plasma-gamemode")
    (synopsis "gameMode UI applet for KDE Plasma desktop")
    (description "Plasma GameMode provides a Plasma widget that shows the
current state of Feral Interactive's GameMode daemon.  It displays whether
GameMode is active and which processes have requested performance
optimizations, integrating with the KDE Plasma system tray.")
    (license license:bsd-3)))
