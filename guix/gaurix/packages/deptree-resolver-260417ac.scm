;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260417ac
;;; Resolves BLOCKED packages with verified GitHub/upstream releases.
;;;
;;; Recipes (14):
;;;   1. bazecor-bin (copy/AppImage, v1.8.3, GPL-3.0)
;;;   2. astra-music-bin (copy/AppImage, v0.5.2-beta, GPL-3.0)
;;;   3. openscad-snapshot-appimage (copy/AppImage, v2025.06.12, GPL-2.0)
;;;   4. browservice-bin (copy/AppImage, v0.9.12.2, MIT)
;;;   5. kh-melonmix-bin (copy/zip-AppImage, v0.8.2, GPL-3.0)
;;;   6. yomikiru-bin (copy/deb-extract, v2.24.0, MIT)
;;;   7. mandarine-bin (copy/AppImage, v1.3.0, GPL-2.0+)
;;;   8. aethertune-bin (copy/binary, v0.5.1, MIT)
;;;   9. alman-bin (copy/binary, v0.1.2, MIT)
;;;  10. ferroxide-bin (copy/binary, v0.5.0, MIT)
;;;  11. wavey-launcher-bin (copy/binary, v1.0.1, GPL-3.0)
;;;  12. refind-btrfs-snapshots-bin (copy/binary, v0.0.9, GPL-3.0)
;;;  13. elastic-dashboard-bin (copy/zip, v2026.1.2, MIT)
;;;  14. forge-gui-desktop-bin (copy/java, v2.0.11, GPL-3.0)
;;;
;;; 14 recipes written. 45 remain BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260417ac)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:export (
            bazecor-bin
            astra-music-bin
            openscad-snapshot-appimage
            browservice-bin
            kh-melonmix-bin
            yomikiru-bin
            mandarine-bin
            aethertune-bin
            alman-bin
            ferroxide-bin
            wavey-launcher-bin
            refind-btrfs-snapshots-bin
            elastic-dashboard-bin
            forge-gui-desktop-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. bazecor-bin — Dygma keyboard configurator (AppImage)
;;; -------------------------------------------------------------------
(define-public bazecor-bin
  (package
    (name "bazecor-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dygmalab/Bazecor/releases/download/v"
                    version "/Bazecor-" version "-x64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bazecor.AppImage" "bin/bazecor"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "bazecor.AppImage")
                   (chmod "bazecor.AppImage" #o755))))))
    (synopsis "graphical configurator for Dygma keyboards")
    (description "Bazecor is the graphical configurator application for Dygma
Raise and Defy keyboards.  It provides key remapping, macro creation, LED
color customization, and firmware updates.  This package provides the
pre-built AppImage binary.")
    (home-page "https://github.com/Dygmalab/Bazecor")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. astra-music-bin — Audiophile music player (AppImage)
;;; -------------------------------------------------------------------
(define-public astra-music-bin
  (package
    (name "astra-music-bin")
    (version "0.5.2-beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Boof2015/astra/releases/download/v"
                    version "/Astra-" version "-Linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("astra.AppImage" "bin/astra-music"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "astra.AppImage")
                   (chmod "astra.AppImage" #o755))))))
    (synopsis "audiophile music player with advanced visualization")
    (description "Astra is an audiophile-grade music player with advanced
audio visualization features.  This package provides the pre-built
AppImage binary.")
    (home-page "https://github.com/Boof2015/astra")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. openscad-snapshot-appimage — OpenSCAD snapshot (AppImage)
;;; -------------------------------------------------------------------
(define-public openscad-snapshot-appimage
  (package
    (name "openscad-snapshot-appimage")
    (version "2025.06.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.openscad.org/snapshots/OpenSCAD-"
                    version ".ai25773-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openscad.AppImage" "bin/openscad-snapshot"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "openscad.AppImage")
                   (chmod "openscad.AppImage" #o755))))))
    (synopsis "programmers solid 3D CAD modeller (snapshot)")
    (description "OpenSCAD is a software for creating solid 3D CAD objects
using a script-based programming language.  This package provides the
development snapshot as a pre-built AppImage.")
    (home-page "https://www.openscad.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. browservice-bin — Browse modern web on historical browsers
;;; -------------------------------------------------------------------
(define-public browservice-bin
  (package
    (name "browservice-bin")
    (version "0.9.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ttalvitie/browservice/releases/download/v"
                    version "/browservice-v" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("browservice.AppImage" "bin/browservice"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "browservice.AppImage")
                   (chmod "browservice.AppImage" #o755))))))
    (synopsis "browse the modern web on historical browsers")
    (description "Browservice is a web proxy that enables using modern websites
on historical browsers.  It runs a CEF-based headless browser and streams
the rendered pages as images to legacy browsers.  This package provides
the pre-built AppImage.")
    (home-page "https://github.com/ttalvitie/browservice")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. kh-melonmix-bin — Kingdom Hearts DS remaster emulator
;;; -------------------------------------------------------------------
(define-public kh-melonmix-bin
  (package
    (name "kh-melonmix-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vitor251093/KHMelonMix/releases/download/v"
                    version "/MelonMix-appimage-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.AppImage$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-appimage
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (for-each (lambda (f) (chmod f #o755))
                               (find-files bin "\\.AppImage$"))))))))
    (synopsis "MelonDS fork for Kingdom Hearts DS remastering")
    (description "KH MelonMix is a fork of MelonDS focused on remastering
Kingdom Hearts: 358/2 Days and Re:coded.  It provides enhanced graphics
rendering and quality-of-life improvements.  This package provides the
pre-built AppImage.")
    (home-page "https://github.com/vitor251093/KHMelonMix")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. yomikiru-bin — Offline manga/comic reader (Electron)
;;; -------------------------------------------------------------------
(define-public yomikiru-bin
  (package
    (name "yomikiru-bin")
    (version "2.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mienaiyami/yomikiru/releases/download/v"
                    version "/Yomikiru-v" version "-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list #:install-plan
           #~'(("opt/" "share/")
                ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")
                   #t))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/yomikiru/yomikiru")
                              (string-append bin "/yomikiru"))))))))
    (synopsis "offline desktop reader for manga, comics, and novels")
    (description "Yomikiru is an offline desktop reader for manga, comics,
webtoons, and novels.  It offers a customizable reading experience with
extensive settings, keyboard shortcuts, themes, and layouts.  This package
provides the pre-built Electron binary.")
    (home-page "https://github.com/mienaiyami/yomikiru")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. mandarine-bin — 3DS emulator (AppImage)
;;; -------------------------------------------------------------------
(define-public mandarine-bin
  (package
    (name "mandarine-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ptyfyre/mandarine-neo/releases/download/r"
                    version "/mandarine-linux-appimage-20260415-3f023d0.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("\\.AppImage$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-appimage
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (for-each (lambda (f) (chmod f #o755))
                               (find-files bin "\\.AppImage$"))))))))
    (synopsis "3DS emulator (Citra fork with enhancements)")
    (description "Mandarine is a fork of the Citra 3DS emulator with tweaks
and enhancements for improved performance and compatibility.  This package
provides the pre-built AppImage binary.")
    (home-page "https://github.com/ptyfyre/mandarine-neo")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 8. aethertune-bin — Terminal internet radio player
;;; -------------------------------------------------------------------
(define-public aethertune-bin
  (package
    (name "aethertune-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nevermore23274/AetherTune/releases/download/v"
                    version "/AetherTune-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aethertune" "bin/aethertune"))))
    (synopsis "terminal-based internet radio player with visualization")
    (description "AetherTune is a terminal-based internet radio player with
real-time audio visualization, built in Rust.  It provides an interactive
TUI for browsing and playing internet radio stations.  This package provides
the pre-built binary.")
    (home-page "https://github.com/nevermore23274/AetherTune")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. alman-bin — Intelligent shell alias manager
;;; -------------------------------------------------------------------
(define-public alman-bin
  (package
    (name "alman-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vaibhav-mattoo/alman/releases/download/v"
                    version "/alman-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("alman" "bin/alman"))))
    (synopsis "intelligent alias manager with TUI")
    (description "Alman is an intelligent alias manager with a TUI for managing
shell aliases.  It provides intelligent suggestions based on command history
to help create and organize aliases efficiently.  This package provides the
pre-built static binary.")
    (home-page "https://github.com/vaibhav-mattoo/alman")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. ferroxide-bin — ProtonMail bridge (CardDAV/IMAP/SMTP)
;;; -------------------------------------------------------------------
(define-public ferroxide-bin
  (package
    (name "ferroxide-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/acheong08/ferroxide/releases/download/v"
                    version "/ferroxide"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ferroxide" "bin/ferroxide"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "ferroxide")
                   (chmod "ferroxide" #o755))))))
    (synopsis "third-party ProtonMail CardDAV, IMAP and SMTP bridge")
    (description "Ferroxide is a hard fork of Hydroxide, providing a
third-party, open-source ProtonMail bridge that exposes CardDAV, IMAP,
and SMTP interfaces.  It allows using ProtonMail with standard email
clients.  This package provides the pre-built Go binary.")
    (home-page "https://github.com/acheong08/ferroxide")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. wavey-launcher-bin — Anime game launcher
;;; -------------------------------------------------------------------
(define-public wavey-launcher-bin
  (package
    (name "wavey-launcher-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/an-anime-team/wavey-launcher/releases/download/"
                    version "/wavey-launcher"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wavey-launcher" "bin/wavey-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs source #:allow-other-keys)
                   (copy-file source "wavey-launcher")
                   (chmod "wavey-launcher" #o755))))))
    (synopsis "launcher for anime games with auto-patching")
    (description "Wavey Launcher is a game launcher with auto-patching,
Discord RPC integration, and time tracking for certain anime games.
This package provides the pre-built binary.")
    (home-page "https://github.com/an-anime-team/wavey-launcher")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. refind-btrfs-snapshots-bin — rEFInd boot entries for btrfs
;;; -------------------------------------------------------------------
(define-public refind-btrfs-snapshots-bin
  (package
    (name "refind-btrfs-snapshots-bin")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jmylchreest/refind-btrfs-snapshots/releases/download/v"
                    version "/refind-btrfs-snapshots_" version
                    "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("refind-btrfs-snapshots" "bin/refind-btrfs-snapshots"))))
    (synopsis "generate rEFInd boot entries for btrfs snapshots")
    (description "refind-btrfs-snapshots generates rEFInd boot manager entries
for btrfs snapshots, enabling boot into previous system states.  This
package provides the pre-built Go binary.")
    (home-page "https://github.com/jmylchreest/refind-btrfs-snapshots")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. elastic-dashboard-bin — FRC robotics dashboard
;;; -------------------------------------------------------------------
(define-public elastic-dashboard-bin
  (package
    (name "elastic-dashboard-bin")
    (version "2026.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Gold872/elastic_dashboard/releases/download/v"
                    version "/Elastic-Linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/elastic-dashboard/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (let ((wrapper (string-append bin "/elastic-dashboard")))
                       (call-with-output-file wrapper
                         (lambda (port)
                           (format port "#!/bin/sh~%exec ~a/share/elastic-dashboard/elastic_dashboard \"$@\"~%"
                                   out)))
                       (chmod wrapper #o755))))))))
    (synopsis "simple and modern dashboard for FRC robotics")
    (description "Elastic Dashboard is a simple and modern dashboard for
FIRST Robotics Competition (FRC) teams.  It provides real-time telemetry
visualization and robot control interfaces.  This package provides the
pre-built Linux binary.")
    (home-page "https://frc-elastic.gitbook.io/docs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. forge-gui-desktop-bin — Magic: The Gathering AI opponent
;;; -------------------------------------------------------------------
(define-public forge-gui-desktop-bin
  (package
    (name "forge-gui-desktop-bin")
    (version "2.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Card-Forge/forge/releases/download/forge-"
                    version "/forge-installer-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list icedtea))
    (arguments
     (list #:install-plan
           #~'(("." "share/forge/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (let ((wrapper (string-append bin "/forge")))
                       (call-with-output-file wrapper
                         (lambda (port)
                           (format port "#!/bin/sh~%exec ~a -jar ~a/share/forge/forge.jar \"$@\"~%"
                                   java out)))
                       (chmod wrapper #o755))))))))
    (synopsis "Magic: The Gathering with computer AI opponents")
    (description "Forge is an implementation of Magic: The Gathering that lets
you play against computer AI opponents.  It supports thousands of cards
and multiple game formats.  This package provides the pre-built Java
application.")
    (home-page "https://github.com/Card-Forge/forge")
    (license license:gpl3)))
