;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ak
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (3):
;;;        1.  opendeck (copy-build-system, v2.11.1, GPL-3.0+)
;;;        2.  norisk-client-launcher (copy-build-system, v0.6.19, GPL-3.0)
;;;        3.  python314-freethreaded (gnu-build-system, v3.14.4, PSF-2.0)
;;;
;;; BLOCKED EXHAUSTED (27):
;;;        4.  ps7_libps4000 -> PROPRIETARY: PicoScope SDK custom license
;;;        5.  ps7_libps3000 -> PROPRIETARY: PicoScope SDK custom license
;;;        6.  ps7_libps5000a -> PROPRIETARY: PicoScope SDK custom license
;;;        7.  ps7_libps5000 -> PROPRIETARY: PicoScope SDK custom license
;;;        8.  ps7_libps6000a -> PROPRIETARY: PicoScope SDK custom license
;;;        9.  pixel-fx-companion-app -> PROPRIETARY: custom license Electron app
;;;       10.  ripcord-arch-libs -> PROPRIETARY: custom license Discord client
;;;       11.  biu-tauri-bin -> NON_FOSS: PolyForm-Noncommercial-1.0.0
;;;       12.  iceweasel -> COMPLEX_BUILD: Firefox fork, exceeds batch scope
;;;       13.  xterminal-bin -> PROPRIETARY: custom license + electron40 dep
;;;       14.  brother-mfc-9970cdw -> PROPRIETARY: Brother commercial license
;;;       15.  futubull-desktop-bin -> PROPRIETARY: trading platform
;;;       16.  dyad-git -> NON_FOSS: FSL-1.1 (Functional Source License)
;;;       17.  idplugclassic-ro-cei-bin -> PROPRIETARY: custom license
;;;       18.  barmer-ecare-bin -> PROPRIETARY: proprietary medical app
;;;       19.  pacsea-git -> DISTRO_SPECIFIC: depends on pacman
;;;       20.  picotron -> PROPRIETARY: commercial game engine
;;;       21.  ccstudio -> PROPRIETARY: TI TSPA + lib32 dep
;;;       22.  pamac-tray-icon-plasma -> DISTRO_SPECIFIC: depends on libpamac
;;;       23.  nomachine -> PROPRIETARY: custom EULA remote desktop
;;;       24.  realvnc-vnc-viewer -> PROPRIETARY: custom license VNC client
;;;       25.  gputest -> PROPRIETARY: freeware, no redistribution
;;;       26.  kontur-talk -> PROPRIETARY: enterprise video conferencing
;;;       27.  termius -> PROPRIETARY: custom license SSH client
;;;       28.  java-gurobi -> PROPRIETARY: Gurobi EULA
;;;       29.  r-gurobi -> PROPRIETARY: Gurobi EULA
;;;       30.  xp-pen-tablet -> PROPRIETARY: custom license driver
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages recipe-resolver-260418ak)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages python)
  #:export (opendeck
            norisk-client-launcher
            python314-freethreaded))

;;; -------------------------------------------------------------------
;;; 1. opendeck --- Stream controller desktop application (prebuilt)
;;; Cross-platform application for stream controller devices (Elgato
;;; Stream Deck compatible).
;;; -------------------------------------------------------------------
(define-public opendeck
  (package
    (name "opendeck")
    (version "2.11.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nekename/OpenDeck/releases/download/v"
                    version "/opendeck_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))
           #:install-plan
           #~'(("usr/bin" "bin/")
               ("usr/share" "share/"))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nekename/OpenDeck")
    (synopsis "desktop application for stream controller devices")
    (description "OpenDeck is a cross-platform desktop application that
provides functionality for stream controller devices such as the Elgato
Stream Deck.  It allows configuring buttons, actions, and integrations
for streaming and productivity workflows.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. norisk-client-launcher --- Minecraft mod client launcher (prebuilt)
;;; Open-source Minecraft mod client launcher with Tauri frontend.
;;; -------------------------------------------------------------------
(define-public norisk-client-launcher
  (package
    (name "norisk-client-launcher")
    (version "0.6.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NoRiskClient/noriskclient-launcher"
                    "/releases/download/v" version
                    "/NoRiskClient-Linux.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))
           #:install-plan
           #~'(("usr/bin" "bin/")
               ("usr/share" "share/"))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://norisk.gg/")
    (synopsis "open-source Minecraft mod client launcher")
    (description "NoRisk Client is an open-source Minecraft mod client
launcher built with Tauri.  It provides a graphical interface for managing
Minecraft mod installations, profiles, and game launching.  The launcher
itself is free software; Minecraft assets are downloaded separately at
runtime.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. python314-freethreaded --- Python 3.14 without the GIL
;;; Free-threaded CPython 3.14 build with the GIL disabled for true
;;; multi-threaded Python execution.
;;; -------------------------------------------------------------------
(define-public python314-freethreaded
  (package
    (inherit python-3.12)
    (name "python314-freethreaded")
    (version "3.14.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.python.org/ftp/python/" version
                    "/Python-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (substitute-keyword-arguments (package-arguments python-3.12)
       ((#:configure-flags flags #~'())
        #~(append #$flags (list "--disable-gil")))))
    (synopsis "Python 3.14 interpreter with free-threading (no GIL)")
    (description "This is a build of CPython 3.14 with the Global Interpreter
Lock (GIL) disabled, enabling true multi-threaded Python execution.  The
free-threaded build allows multiple threads to execute Python bytecode
simultaneously without GIL contention.  This is an experimental feature
as of Python 3.14; some C extensions may not be thread-safe.")))
