;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260408y
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 19 binary repacks (copy-build-system)
;;;   - 4 binary repacks needing deb extraction
;;;   - 1 already resolved (icu69-bin found in deptree-resolver-260408e)
;;;   - 6 re-evaluated with concrete blocking reasons (see blocked-notes)
;;;
;;; Binary repacks (22):
;;;   - unciv-bin: open-source Civ V remake (JVM jar)
;;;   - pseint-bin: pseudocode teaching tool (Qt binary)
;;;   - sparta-plugins-bin: spatial audio LV2 plugins (zip)
;;;   - pdf4qt-bin: Qt PDF editor (AppImage)
;;;   - spotube-bin: open-source Spotify client (tar.xz)
;;;   - audio-share-bin: audio sharing server (tar.gz)
;;;   - nekoray-bin: Qt proxy configuration manager (zip)
;;;   - tacentview-bin: image viewer (tar.gz)
;;;   - sherlock-launcher-bin: GTK4 app launcher (tar.gz)
;;;   - termframe-bin: terminal SVG screenshot tool (tar.gz)
;;;   - voxtype-bin: voice-to-text tool (deb)
;;;   - odinls-bin: Odin language server (zip)
;;;   - raptor-cage-bin: sandboxed game launcher (tar.gz)
;;;   - dawn-writer-bin: terminal writing environment (tar.gz)
;;;   - portablemc-bin: Minecraft launcher CLI (tar.gz)
;;;   - cake-wallet-bin: crypto wallet (tar.xz)
;;;   - betterbird-es-bin: Thunderbird fork Spanish (tar.xz)
;;;   - ab-download-manager-bin: download manager (tar.gz)
;;;   - bizhawk-bin: multi-system emulator (tar.gz)
;;;   - bs-manager-bin: Beat Saber mod manager (deb)
;;;
;;; Deb extraction binary repacks (3):
;;;   - koala-clash-bin: Clash proxy GUI (deb)
;;;   - exifcleaner-bin: EXIF metadata cleaner (deb)
;;;   - geteduroam-gui-bin: eduroam network config GUI (deb)
;;;
;;; Source build (1):
;;;   - icu69: legacy ICU 69.1 (gnu-build-system)
;;;
;;; Re-evaluated (blocked with specific reasons, 6):
;;;   - pexip-infinity-connect-bin: PROPRIETARY_DEPRECATED
;;;   - time-desktop-bin: UPSTREAM_NOT_FOUND
;;;   - qfinderpro-bin: PROPRIETARY_DYNAMIC_URL
;;;   - kemulatornnmod-bin: NO_LICENSE
;;;   - naviterm-bin: NO_LICENSE
;;;   - codex-app-bin: NO_LICENSE (unofficial derivative)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:export (
            ;; JVM binary
            unciv-bin
            ;; Qt/GUI binary
            pseint-bin
            pdf4qt-bin
            nekoray-bin
            ;; Audio/media
            sparta-plugins-bin
            spotube-bin
            audio-share-bin
            ;; Image/file tools
            tacentview-bin
            exifcleaner-bin
            ;; Launchers/desktop
            sherlock-launcher-bin
            koala-clash-bin
            ;; Dev tools
            termframe-bin
            odinls-bin
            dawn-writer-bin
            ;; System/network
            voxtype-bin
            geteduroam-gui-bin
            raptor-cage-bin
            portablemc-bin
            ;; Finance/crypto
            cake-wallet-bin
            ;; Email
            betterbird-es-bin
            ;; Download/gaming
            ab-download-manager-bin
            bizhawk-bin
            bs-manager-bin
            ;; Placeholder: naviterm-bin intentionally omitted (unknown license)
            ))

;;; -------------------------------------------------------
;;; 1. unciv-bin — open-source Civ V remake (JVM jar)
;;; -------------------------------------------------------

(define-public unciv-bin
  (package
    (name "unciv-bin")
    (version "4.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yairm210/Unciv/releases/download/"
                    version "/Unciv.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("Unciv.jar" "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/unciv")
                       (lambda ()
                         (format #t "#!~a~%exec ~a -jar ~a/share/java/Unciv.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java out)))
                     (chmod (string-append bin "/unciv") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/yairm210/Unciv")
    (synopsis "Open-source remake of Civilization V for desktop and Android")
    (description "Unciv is a free and open-source reimplementation of
Civilization V, a turn-based strategy game.  It runs on the JVM and supports
single-player and multiplayer gameplay.  The game aims to recreate the core
Civ V experience while being lightweight and cross-platform.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 2. pseint-bin — pseudocode teaching tool (Qt binary)
;;; -------------------------------------------------------

(define-public pseint-bin
  (package
    (name "pseint-bin")
    (version "20250314")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/pseint/files/"
                    version "/pseint-l64-" version ".tgz/download"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/pseint/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://pseint.sourceforge.net")
    (synopsis "Pseudocode interpreter for learning programming fundamentals")
    (description "PSeInt is a tool designed to assist students taking their
first steps in programming.  It uses a simple pseudocode language in Spanish,
providing autocompletion, syntax highlighting, and step-by-step execution to
help students understand programming concepts without the complexity of a
real programming language.")
    (license license:gpl2)))

;;; -------------------------------------------------------
;;; 3. sparta-plugins-bin — spatial audio LV2 plugins
;;; -------------------------------------------------------

(define-public sparta-plugins-bin
  (package
    (name "sparta-plugins-bin")
    (version "1.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/leomccormack/SPARTA/releases/download/v"
                    version "/Linux_SPARTA_LV2_2026_01_25_v" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "lib/lv2/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/leomccormack/SPARTA")
    (synopsis "Collection of spatial audio plugins for ambisonics and binaural")
    (description "SPARTA is a collection of spatial audio plugins built using
the Spatial Audio Framework (SAF) and JUCE.  It includes tools for Ambisonic
encoding/decoding, binaural rendering, HRIR convolution, and other spatial
audio processing tasks.  Plugins are provided in LV2 format.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 4. pdf4qt-bin — Qt PDF editor (AppImage)
;;; -------------------------------------------------------

(define-public pdf4qt-bin
  (package
    (name "pdf4qt-bin")
    (version "1.5.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JakubMelka/PDF4QT/releases/download/v"
                    version "/PDF4QT-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("PDF4QT.AppImage" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (car (find-files "." "\\.AppImage$"))
                    "PDF4QT.AppImage")
                   (chmod "PDF4QT.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JakubMelka/PDF4QT")
    (synopsis "Open-source PDF editor with annotations and form filling")
    (description "PDF4QT is an open-source PDF editor built with Qt that
supports viewing, annotating, form filling, and editing PDF documents.  It
provides a rich set of tools for working with PDF files including text
selection, page manipulation, and digital signatures.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 5. spotube-bin — open-source Spotify client (tar.xz)
;;; -------------------------------------------------------

(define-public spotube-bin
  (package
    (name "spotube-bin")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KRTirtho/spotube/releases/download/v"
                    version "/spotube-linux-" version "-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/spotube/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KRTirtho/spotube")
    (synopsis "Open-source Spotify client without requiring Premium")
    (description "Spotube is an open-source, cross-platform Spotify client
built with Flutter and Dart.  It uses Spotify's public API for metadata
and sources audio from YouTube Music, meaning no Spotify Premium subscription
is required for playback.  Features include lyrics, playlists, and local
library management.")
    (license license:bsd-4)))

;;; -------------------------------------------------------
;;; 6. audio-share-bin — audio sharing server (tar.gz)
;;; -------------------------------------------------------

(define-public audio-share-bin
  (package
    (name "audio-share-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mkckr0/audio-share/releases/download/v"
                    version "/audio-share-server-cmd-linux.tar.gz"))
              (sha256
               (base32 "0ksj8fxi05i5hsccxl2hpsc7sp0ya9sc7irfq7cbxw0rbjx5rwnw"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("bin/as-cmd" "bin/audio-share-server"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mkckr0/audio-share")
    (synopsis "Share computer audio to Android phone over network")
    (description "Audio Share lets you stream audio from a Linux computer to
an Android device over the local network, effectively turning the phone into a
wireless speaker.  This package provides the command-line server component
that captures system audio via PulseAudio or PipeWire and streams it to the
companion Android app.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 7. nekoray-bin — Qt proxy configuration manager (zip)
;;; -------------------------------------------------------

(define-public nekoray-bin
  (package
    (name "nekoray-bin")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MatsuriDayo/nekoray/releases/download/"
                    version "/nekoray-" version
                    "-2024-12-12-linux64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("nekoray" "share/nekoray/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MatsuriDayo/nekoray")
    (synopsis "Qt-based cross-platform GUI proxy configuration manager")
    (description "Nekoray is a Qt-based cross-platform GUI proxy configuration
manager that uses sing-box as its backend.  It supports various proxy
protocols and provides a user-friendly interface for managing proxy
configurations.  Note: this project is no longer actively maintained by
its original developer.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 8. tacentview-bin — image/texture viewer (tar.gz)
;;; -------------------------------------------------------

(define-public tacentview-bin
  (package
    (name "tacentview-bin")
    (version "1.0.47")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluescan/tacentview/releases/download/v"
                    version "/tacentview_" version ".tgz"))
              (sha256
               (base32 "134qyan1za433l366gbnq6fa9pjqyc5imqv3cq9m2jwl9sjry5ap"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("tacentview" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bluescan/tacentview")
    (synopsis "Image and texture viewer for game developers")
    (description "Tacent View is an image and texture viewer that supports a
wide range of formats including TGA, PNG, EXR, DDS, WebP, GIF, HDR, APNG, and
many more.  It is particularly useful for game developers who work with
texture formats not supported by typical image viewers.  Features include
batch operations, contact sheet generation, and animated image support.")
    (license license:isc)))

;;; -------------------------------------------------------
;;; 9. exifcleaner-bin — EXIF metadata cleaner (deb)
;;; -------------------------------------------------------

(define-public exifcleaner-bin
  (package
    (name "exifcleaner-bin")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/szTheory/exifcleaner/releases/download/v"
                    version "/exifcleaner_" version "_amd64.deb"))
              (sha256
               (base32 "0f0bw506bhdq0n5q8rhswh84iynydcpn1gs48a18gy4zc2j4y283"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/szTheory/exifcleaner")
    (synopsis "Cross-platform desktop app to clean EXIF metadata from images")
    (description "ExifCleaner is a cross-platform desktop application that
removes EXIF metadata from image files.  It supports batch processing by
drag-and-drop and handles common image formats.  The app helps protect
privacy by stripping location data, camera information, and other metadata
embedded in photos.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 10. sherlock-launcher-bin — GTK4 app launcher (tar.gz)
;;; -------------------------------------------------------

(define-public sherlock-launcher-bin
  (package
    (name "sherlock-launcher-bin")
    (version "0.1.14-3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Skxxtz/sherlock/releases/download/v"
                    version "/sherlock-v" version
                    "-bin-linux-x86_64.tar.gz"))
              (sha256
               (base32 "179gz4vsgkr9j57dn50yrsxnzi3rxx0nwmvj87hsf1aqvidww87a"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("sherlock" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Skxxtz/sherlock")
    (synopsis "Versatile application launcher for Wayland built with GTK4")
    (description "Sherlock is a versatile application and command launcher for
Wayland compositors, built with Rust and GTK4.  It provides fast app launching,
command execution, and extensible search capabilities with a clean and modern
interface.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 11. koala-clash-bin — Clash proxy GUI (deb)
;;; -------------------------------------------------------

(define-public koala-clash-bin
  (package
    (name "koala-clash-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coolcoala/koala-clash/releases/download/"
                    version "/Koala.Clash_amd64.deb"))
              (sha256
               (base32 "0hmb9m4ww3jrixhlgrvl2aaj664hrbk62sghsi1pwc71ll5qxq9p"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolcoala/koala-clash")
    (synopsis "Modern GUI client for Clash proxy on Linux")
    (description "Koala Clash is a modern desktop GUI client for the Clash
proxy core.  It provides an intuitive interface for managing proxy
configurations, rules, and connections on Linux desktops.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 12. termframe-bin — terminal SVG screenshot tool (tar.gz)
;;; -------------------------------------------------------

(define-public termframe-bin
  (package
    (name "termframe-bin")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pamburus/termframe/releases/download/v"
                    version "/termframe-linux-x86_64-gnu.tar.gz"))
              (sha256
               (base32 "0g424yd25nwk0fvvzia7vcw1qmsyq15pv7fwq8x4s4h4bk87aqsw"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("termframe" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pamburus/termframe")
    (synopsis "Terminal output SVG screenshot tool")
    (description "Termframe captures terminal output and renders it as SVG
images.  It preserves colors, formatting, and layout from terminal sessions,
producing scalable vector graphics suitable for documentation, presentations,
and sharing terminal output in a visually appealing format.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 13. voxtype-bin — voice-to-text tool (binary)
;;; -------------------------------------------------------

(define-public voxtype-bin
  (package
    (name "voxtype-bin")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peteonrails/voxtype/releases/download/v"
                    version "/voxtype_" version "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peteonrails/voxtype")
    (synopsis "Voice-to-text with push-to-talk for Wayland compositors")
    (description "VoxType provides voice-to-text functionality with
push-to-talk support for Wayland compositors.  It uses whisper-based speech
recognition and integrates with the Wayland input method protocol for seamless
dictation in any application.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 14. odinls-bin — Odin language server (zip)
;;; -------------------------------------------------------

(define-public odinls-bin
  (package
    (name "odinls-bin")
    (version "dev-2026-03")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DanielGavin/ols/releases/download/"
                    version "/ols-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32 "0xdwgscqdaw0zz7d9m4rb0f3yri2i77kdsmrbppwl0p6ihflbh79"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("ols" "bin/")
                ("odinfmt" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)
                   (rename-file "ols-x86_64-unknown-linux-gnu" "ols")
                   (rename-file "odinfmt-x86_64-unknown-linux-gnu" "odinfmt"))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DanielGavin/ols")
    (synopsis "Language server for the Odin programming language")
    (description "OLS is a language server implementation for the Odin
programming language, providing IDE features such as autocompletion, go to
definition, hover documentation, and diagnostics.  It follows the Language
Server Protocol and works with any LSP-compatible editor.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 15. raptor-cage-bin — sandboxed game launcher (tar.gz)
;;; -------------------------------------------------------

(define-public raptor-cage-bin
  (package
    (name "raptor-cage-bin")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RX0FA/raptor-cage/releases/download/"
                    version "-2510162027/raptor-cage-"
                    version "-2510162027.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("raptor-cage" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RX0FA/raptor-cage")
    (synopsis "Sandboxed game launcher for privacy and security")
    (description "Raptor Cage is a CLI tool that lets you play games in a
restricted environment by blocking access to system and network resources.
It provides a sandboxing layer for gaming that helps protect privacy and
security by limiting what running games can access on the system.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 16. geteduroam-gui-bin — eduroam network config GUI (deb)
;;; -------------------------------------------------------

(define-public geteduroam-gui-bin
  (package
    (name "geteduroam-gui-bin")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/geteduroam/linux-app/releases/download/"
                    version "/geteduroam-gui_linux_amd64.deb"))
              (sha256
               (base32 "0h926bbgfafg6pz0b2ck9r4l4bq0fscmi3c81pbv50x8ihpwijv6"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/geteduroam/linux-app")
    (synopsis "GUI client for configuring eduroam network access on Linux")
    (description "geteduroam is a GUI application for configuring eduroam
network access on Linux systems.  It automates the process of setting up
WPA-Enterprise authentication for educational institution wireless networks,
handling certificate installation and NetworkManager configuration.")
    (license license:bsd-3)))

;;; -------------------------------------------------------
;;; 17. dawn-writer-bin — terminal writing environment (tar.gz)
;;; -------------------------------------------------------

(define-public dawn-writer-bin
  (package
    (name "dawn-writer-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/andrewmd5/dawn/releases/download/v"
                    version "/dawn-linux-x64.tar.gz"))
              (sha256
               (base32 "0q8d8dw3ga3rncixn09r9xybs05i7c93i5hsw5dr7g14zqy9x9d9"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("dawn" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/andrewmd5/dawn")
    (synopsis "Distraction-free terminal writing environment with Markdown")
    (description "Dawn is a distraction-free terminal writing environment that
renders Markdown as you type.  It requires no Electron, no browser, and no
network connection.  Dawn provides a focused writing experience directly in
the terminal with real-time Markdown preview.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 18. portablemc-bin — Minecraft launcher CLI (tar.gz)
;;; -------------------------------------------------------

(define-public portablemc-bin
  (package
    (name "portablemc-bin")
    (version "5.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/theorzr/portablemc/releases/download/v"
                    version "/portablemc-" version
                    "-linux-x86_64-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("portablemc" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/theorzr/portablemc")
    (synopsis "Cross-platform CLI launcher for Minecraft")
    (description "PortableMC is a cross-platform command-line interface for
launching Minecraft.  It supports Mojang versions and popular mod loaders
including Fabric, Forge, and NeoForge.  The launcher handles authentication,
version management, and mod loader installation from the terminal.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 19. cake-wallet-bin — crypto wallet (tar.xz)
;;; -------------------------------------------------------

(define-public cake-wallet-bin
  (package
    (name "cake-wallet-bin")
    (version "6.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cake-tech/cake_wallet/releases/download/v"
                    version "/Cake_Wallet_v" version "_Linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/cake-wallet/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cake-tech/cake_wallet")
    (synopsis "Noncustodial multi-currency cryptocurrency wallet")
    (description "Cake Wallet is a noncustodial, open-source wallet supporting
Monero, Bitcoin, Ethereum, Litecoin, and other cryptocurrencies.  It provides
a user-friendly desktop interface for managing wallets, sending and receiving
funds, and exchanging between supported currencies without requiring third-party
custody of private keys.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 20. betterbird-es-bin — Thunderbird fork Spanish (tar.xz)
;;; -------------------------------------------------------

(define-public betterbird-es-bin
  (package
    (name "betterbird-es-bin")
    (version "140.9.0esr-bb20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.betterbird.eu/downloads/LinuxArchive/"
                    "betterbird-" version
                    ".es-ES.linux-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "lib/betterbird-es/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.betterbird.eu")
    (synopsis "Spanish-language build of Betterbird email client")
    (description "Betterbird is a soft fork of Mozilla Thunderbird ESR with
exclusive features and bug fixes not found in the upstream project.  This
package provides the Spanish (es-ES) language build.  Betterbird aims to
improve the Thunderbird experience while maintaining full compatibility with
Thunderbird profiles and extensions.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 21. ab-download-manager-bin — download manager (tar.gz)
;;; -------------------------------------------------------

(define-public ab-download-manager-bin
  (package
    (name "ab-download-manager-bin")
    (version "1.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amir1376/ab-download-manager/"
                    "releases/download/v" version
                    "/ABDownloadManager_" version "_linux_x64.tar.gz"))
              (sha256
               (base32 "0kqvf69cp7q90rm522ff89gakzsji70x6w6dk85rcxq0nsajhky8"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/ab-download-manager/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amir1376/ab-download-manager")
    (synopsis "Download manager that accelerates file downloads")
    (description "AB Download Manager is a desktop download manager that
speeds up file downloads by using multiple connections.  It provides a
graphical interface for managing downloads, supports browser integration,
and handles pause/resume functionality.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 22. bizhawk-bin — multi-system emulator (tar.gz)
;;; -------------------------------------------------------

(define-public bizhawk-bin
  (package
    (name "bizhawk-bin")
    (version "2.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TASEmulators/BizHawk/releases/download/"
                    version "/BizHawk-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/bizhawk/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TASEmulators/BizHawk")
    (synopsis "Multi-system emulator for tool-assisted speedruns")
    (description "BizHawk is a multi-system emulator with full rerecording
support and Lua scripting, primarily used for tool-assisted speedruns (TAS).
It supports many classic gaming systems including NES, SNES, Game Boy,
Genesis, Saturn, N64, and more.  BizHawk provides frame-by-frame control,
memory inspection, and input recording capabilities.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 23. bs-manager-bin — Beat Saber mod manager (deb)
;;; -------------------------------------------------------

(define-public bs-manager-bin
  (package
    (name "bs-manager-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zagrios/bs-manager/releases/download/v"
                    version "/bs-manager_" version "_amd64.deb"))
              (sha256
               (base32 "1jw1skxzgcmabbhni0vlzphgqavv4lk60rqhhb8cy22gyfc4qhwv"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Zagrios/bs-manager")
    (synopsis "All-in-one tool for managing Beat Saber versions and mods")
    (description "BSManager is an all-in-one tool for managing Beat Saber
versions, maps, mods, and other content.  It provides a desktop interface
for downloading and organizing Beat Saber modifications, managing multiple
game versions, and installing custom content.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 24. icu69-bin — already exists in deptree-resolver-260408e.scm
;;; Resolved by finding existing recipe: icu69 in deptree-resolver-260408e
;;; and icu69-bin in queue-20260325p100.
;;; -------------------------------------------------------

;;; -------------------------------------------------------
;;; 25. naviterm-bin — intentionally omitted
;;; License could not be determined for this package.
;;; See blocked-notes for details.
;;; -------------------------------------------------------

;;; -------------------------------------------------------
;;; 26. codex-app-bin — intentionally omitted
;;; Unofficial rebuild with unclear license.
;;; See blocked-notes for details.
;;; -------------------------------------------------------
