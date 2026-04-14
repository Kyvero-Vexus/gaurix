;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ah
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 20 recipes created (binary repacks, C source, Python, data, Meson libs)
;;;   - 10 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (20):
;;;   pkl-bin, doppler-cli-bin, goldwarden-bin, tsm-bin,
;;;   pseint-bin, zimage-ncnn-vulkan-bin, openbuilds-control-bin,
;;;   throne-bin, pdx-unlimiter-bin, seadrive-gui-bin,
;;;   carbonyl-bin, wayscriber-configurator-bin,
;;;   rime-nushu, vbx, fw-fanctrl, packwitch-manager,
;;;   libastal-river, libastal-tray,
;;;   material-kwin-decoration, invader
;;;
;;; Re-blocked (10):
;;;   wiso-steuer-2026 (#3733) — PROPRIETARY_WINE
;;;   dolphin-anty-bin (#3735) — PROPRIETARY
;;;   vscodium-bin-marketplace (#3761) — TOS_VIOLATION
;;;   linux-g14 (#3762) — KERNEL_INCOMPATIBLE
;;;   playdate-sdk (#3814) — PROPRIETARY
;;;   gnome-system-tools (#7365) — DISCONTINUED
;;;   mandb-ondemand (#4043) — ARCH_SPECIFIC
;;;   sage-numerical-backends-gurobi (#4053) — PROPRIETARY_DEP
;;;   mingw-w64-gtk3 (#4057) — CROSS_COMPILE_TOOLCHAIN
;;;   tomcat8 (#3709) — EOL_SOFTWARE
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ah)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg)
  #:export (pkl-bin
            doppler-cli-bin
            goldwarden-bin
            tsm-bin
            pseint-bin
            zimage-ncnn-vulkan-bin
            openbuilds-control-bin
            throne-bin
            pdx-unlimiter-bin
            seadrive-gui-bin
            carbonyl-bin
            wayscriber-configurator-bin
            rime-nushu
            vbx
            fw-fanctrl
            packwitch-manager
            libastal-river
            libastal-tray
            material-kwin-decoration
            invader))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── pkl-bin (#7386) ──
;;; Configuration-as-code language by Apple with validation and tooling.

(define-public pkl-bin
  (package
    (name "pkl-bin")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/apple/pkl/releases/download/"
                    version "/pkl-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pkl-linux-amd64" "bin/pkl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pkl")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pkl-lang.org/")
    (synopsis "configuration-as-code language with built-in validation")
    (description "Pkl is a configuration language by Apple that provides
rich validation, IDE support, and code generation.  It compiles to JSON,
YAML, Property Lists, and other formats.  Pkl catches configuration errors
before deployment through its type system and constraint expressions.")
    (license license:asl2.0)))

;;; ── doppler-cli-bin (#7337) ──
;;; CLI for Doppler cloud secrets and environment variable management.

(define-public doppler-cli-bin
  (package
    (name "doppler-cli-bin")
    (version "3.75.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DopplerHQ/cli/releases/download/"
                    version "/doppler_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("doppler" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.doppler.com/docs/cli")
    (synopsis "CLI client for Doppler secrets management platform")
    (description "The Doppler CLI provides a unified interface for managing
secrets and environment variables across development, staging, and production
environments.  It integrates with the Doppler cloud platform to inject secrets
into any process without modifying application code.")
    (license license:asl2.0)))

;;; ── goldwarden-bin (#7381) ──
;;; Bitwarden-compatible desktop client with SSH agent and autotype.

(define-public goldwarden-bin
  (package
    (name "goldwarden-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/quexten/goldwarden/releases/download/v"
                    version "/goldwarden_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/quexten/goldwarden")
    (synopsis "Bitwarden-compatible desktop integration client")
    (description "Goldwarden is a Bitwarden-compatible password manager client
with SSH agent integration, desktop autotype, browser biometrics support, and
system credential storage.  It runs as a daemon and integrates with desktop
environments for seamless password management.")
    (license license:expat)))

;;; ── tsm-bin (#7354) ──
;;; Terminal session manager for tmux and zellij.

(define-public tsm-bin
  (package
    (name "tsm-bin")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/adibhanna/tsm/releases/download/v"
                    version "/tsm_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tsm" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/adibhanna/tsm")
    (synopsis "terminal session manager for tmux and zellij")
    (description "Tsm is a terminal session manager that simplifies working
with tmux and zellij.  It provides a fuzzy-finder interface for creating,
switching, and managing terminal multiplexer sessions from any directory.")
    (license license:expat)))

;;; ── pseint-bin (#3731) ──
;;; Educational pseudocode IDE for learning programming.

(define-public pseint-bin
  (package
    (name "pseint-bin")
    (version "20250314")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/pseint/files/"
                    version "/pseint-l64-" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pseint/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/pseint")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/share/pseint/pseint \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/pseint") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pseint.sourceforge.net/")
    (synopsis "pseudocode interpreter for learning programming")
    (description "PSeInt is an educational tool for learning programming
fundamentals using pseudocode in Spanish.  It provides a simple IDE with
syntax highlighting, flowchart generation, and step-by-step execution,
making it popular in Latin American educational institutions.")
    (license license:gpl2)))

;;; ── zimage-ncnn-vulkan-bin (#4020) ──
;;; AI image generator using ncnn with Vulkan GPU acceleration.

(define-public zimage-ncnn-vulkan-bin
  (package
    (name "zimage-ncnn-vulkan-bin")
    (version "20260215")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nihui/zimage-ncnn-vulkan/releases/download/"
                    version "/zimage-ncnn-vulkan-" version "-linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zimage-ncnn-vulkan" "bin/")
               ("models/" "share/zimage-ncnn-vulkan/models/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)
                   (chdir "zimage-ncnn-vulkan-20260215-linux"))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nihui/zimage-ncnn-vulkan")
    (synopsis "AI image generation using ncnn with Vulkan acceleration")
    (description "Zimage-ncnn-vulkan is a native C++ implementation of the
Z-Image model using the ncnn inference framework with Vulkan GPU acceleration.
It generates images without requiring Python or PyTorch, running efficiently
on GPUs via the Vulkan compute API.")
    (license license:asl2.0)))

;;; ── openbuilds-control-bin (#3960) ──
;;; Desktop interface for Grbl-based CNC machines.

(define-public openbuilds-control-bin
  (package
    (name "openbuilds-control-bin")
    (version "1.0.390")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenBuilds/OpenBuilds-CONTROL/"
                    "releases/download/v" version
                    "/OpenBuildsCONTROL-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("OpenBuildsCONTROL.AppImage" "bin/openbuilds-control"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "OpenBuildsCONTROL.AppImage")
                   (chmod "OpenBuildsCONTROL.AppImage" #o755)))
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/openbuilds-control")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://software.openbuilds.com/")
    (synopsis "desktop CNC controller for Grbl-based machines")
    (description "OpenBuilds CONTROL is a desktop application for controlling
Grbl-based CNC machines.  It provides real-time machine status, jog controls,
probe wizards, and G-code sending capabilities with a user-friendly interface
for hobbyist and professional CNC operators.")
    (license license:gpl3)))

;;; ── throne-bin (#7377) ──
;;; Qt-based cross-platform GUI proxy manager using sing-box.

(define-public throne-bin
  (package
    (name "throne-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/throneproj/Throne/releases/download/"
                    version "/Throne-" version
                    "-debian-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/throneproj/Throne")
    (synopsis "Qt-based GUI proxy manager with sing-box backend")
    (description "Throne is a cross-platform proxy management tool built with
Qt6 and the sing-box core.  It supports multiple proxy protocols including
VLESS, VMess, Shadowsocks, Trojan, and Hysteria, providing a graphical
interface for configuring and switching between proxy servers.")
    (license license:gpl3+)))

;;; ── pdx-unlimiter-bin (#7373) ──
;;; Savegame manager and editor for Paradox grand strategy games.

(define-public pdx-unlimiter-bin
  (package
    (name "pdx-unlimiter-bin")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/crschnick/pdx_unlimiter/releases/download/"
                    version "/pdx-unlimiter-installer-linux-x86_64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/pdx_unlimiter/bin/pdx_unlimiter")
                              (string-append bin "/pdx-unlimiter"))))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/crschnick/pdx_unlimiter")
    (synopsis "savegame manager and editor for Paradox strategy games")
    (description "Pdx Unlimiter is a savegame manager, editor, and converter
for Paradox Interactive grand strategy games including Europa Universalis IV,
Crusader Kings III, Hearts of Iron IV, Stellaris, and Victoria 3.  It provides
Ironman save editing, achievement compatibility checking, and save conversion.")
    (license license:gpl3)))

;;; ── seadrive-gui-bin (#8387) ──
;;; Seafile virtual drive client for cloud file synchronization.

(define-public seadrive-gui-bin
  (package
    (name "seadrive-gui-bin")
    (version "3.0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sos-ch-dk-2.exo.io/seafile-downloads/"
                    "SeaDrive-x86_64-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("SeaDrive.AppImage" "bin/seadrive-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "SeaDrive.AppImage")
                   (chmod "SeaDrive.AppImage" #o755)))
               (add-after 'install 'fix-permissions
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/seadrive-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.seafile.com/")
    (synopsis "Seafile virtual drive client with GUI")
    (description "SeaDrive is a virtual drive client for the Seafile cloud
storage platform.  It maps Seafile libraries as a virtual disk drive, allowing
on-demand file access without full synchronization.  Files are cached locally
as they are accessed, saving disk space while providing seamless cloud access.")
    (license license:asl2.0)))

;;; ── carbonyl-bin (#3662) ──
;;; Chromium-based browser that renders in the terminal.

(define-public carbonyl-bin
  (package
    (name "carbonyl-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fathyb/carbonyl/releases/download/v"
                    version "/carbonyl.linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("carbonyl" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)
                   (chdir "carbonyl-0.0.3"))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fathyb/carbonyl")
    (synopsis "Chromium-based browser that renders in the terminal")
    (description "Carbonyl is a Chromium-based browser built to run inside a
terminal.  It renders web pages as text, images, and video directly in the
terminal at up to 60 frames per second, supporting CSS, WebGL, and modern
web standards without requiring a graphical display server.")
    (license license:bsd-3)))

;;; ── wayscriber-configurator-bin (#7388) ──
;;; GUI configurator for the wayscriber screen annotation tool.

(define-public wayscriber-configurator-bin
  (package
    (name "wayscriber-configurator-bin")
    (version "0.9.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/devmobasa/wayscriber/releases/download/v"
                    version "/wayscriber-configurator-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/devmobasa/wayscriber")
    (synopsis "GUI configurator for the wayscriber annotation tool")
    (description "Wayscriber Configurator provides a graphical interface for
configuring the wayscriber screen annotation tool.  Built with the Iced GUI
framework in Rust, it allows users to customize annotation settings, hotkeys,
and drawing tools for Wayland-native screen annotation.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Data packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── rime-nushu (#3704) ──
;;; RIME input method schema and dictionary for Nushu script.

(define-public rime-nushu
  (package
    (name "rime-nushu")
    (version "0.0.0.20200722")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nushu-script/rime-nushu")
                    (commit "d1f37bde1ef5b17a4e525393e2e26638e7e3be69")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rime-data/"
                #:include-regexp (".*\\.yaml$" ".*\\.dict\\.yaml$")))))
    (home-page "https://github.com/nushu-script/rime-nushu")
    (synopsis "RIME input method schema for Nushu script")
    (description "This package provides RIME input method engine schema files
and dictionaries for typing Nushu script, a syllabic writing system historically
used by women in Jiangyong County, Hunan, China.  It covers 396 Unicode Nushu
characters defined in the Unicode Standard.")
    (license license:unlicense)))

;;; ──────────────────────────────────────────────────────────────────
;;; Source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── vbx (#7359) ──
;;; CLI tool that plays mechanical keyboard sounds on every keystroke.

(define-public vbx
  (package
    (name "vbx")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/S4NKALP/vbx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list pulseaudio json-c libsndfile libinput libevdev))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/S4NKALP/vbx")
    (synopsis "mechanical keyboard sound effects for every keystroke")
    (description "Vbx monitors keyboard input devices and plays mechanical
keyboard sound effects on every keystroke.  It runs as a background daemon
using PulseAudio for audio output, with configurable sound profiles for
different key types.")
    (license license:expat)))

;;; ── fw-fanctrl (#7326) ──
;;; Fan control service for Framework laptops.

(define-public fw-fanctrl
  (package
    (name "fw-fanctrl")
    (version "1.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TamtamHero/fw-fanctrl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python))
    (home-page "https://github.com/TamtamHero/fw-fanctrl")
    (synopsis "fan speed control daemon for Framework laptops")
    (description "Fw-fanctrl is a service for controlling the fan speed on
Framework laptops.  It provides customizable speed curves based on CPU
temperature, with profiles for different usage scenarios such as quiet
operation, balanced performance, and maximum cooling.")
    (license license:bsd-3)))

;;; ── packwitch-manager (#4021) ──
;;; Minecraft modpack creation and management tool.

(define-public packwitch-manager
  (package
    (name "packwitch-manager")
    (version "0.2b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/packwitch/packwitch/releases/download/"
                    version "/manager-" version ".tar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/packwitch-manager/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java"))
                          (jar (string-append out "/share/packwitch-manager/manager.jar")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/packwitch-manager")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a -jar ~a \"$@\"~%" java jar)))
                     (chmod (string-append bin "/packwitch-manager") #o755)))))))
    (inputs (list (list openjdk21 "jdk")))
    (home-page "https://codeberg.org/packwitch/packwitch")
    (synopsis "Minecraft modpack creation and management CLI")
    (description "Packwitch Manager is a command-line tool for creating,
managing, and distributing Minecraft modpacks.  It handles mod dependencies,
version resolution, and modpack packaging for distribution to players.")
    (license license:lgpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds (libastal suite)
;;; ──────────────────────────────────────────────────────────────────

;;; ── libastal-river (#8369) ──
;;; Astal library for River wayland compositor status.

(define-public libastal-river
  (package
    (name "libastal-river")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "7498aa13e8f2e1dcb90ab1b67eb0564de547d41a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/river"))))))
    (inputs (list glib json-glib wayland))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala
                         wayland-protocols))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for querying River wayland compositor status")
    (description "Libastal-river provides a GObject-based library and CLI tool
for monitoring and interacting with the River tiling Wayland compositor.  It
exposes workspace, output, and window state through a convenient API for
building desktop widgets and status bars.")
    (license license:lgpl2.1)))

;;; ── libastal-tray (#8370) ──
;;; Astal library for system tray management.

(define-public libastal-tray
  (package
    (name "libastal-tray")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "7498aa13e8f2e1dcb90ab1b67eb0564de547d41a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subproject
                 (lambda _
                   (chdir "lib/tray"))))))
    (inputs (list glib json-glib gtk+))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gobject-introspection
                         vala))
    (home-page "https://aylur.github.io/astal/")
    (synopsis "library for managing the system tray via StatusNotifierItem")
    (description "Libastal-tray provides a GObject-based library and CLI tool
for managing system tray icons using the StatusNotifierItem D-Bus protocol.
It allows desktop widgets and panels to display and interact with application
tray icons in a toolkit-agnostic way.")
    (license license:lgpl2.1)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── material-kwin-decoration (#7371) ──
;;; Material Design window decoration for KWin.

(define-public material-kwin-decoration
  (package
    (name "material-kwin-decoration")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/guiodic/material-decoration")
                    (commit "c8b0e28e1d1e58b46f45cd50a9fc0a2f2a05c10a")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list extra-cmake-modules
                  kdecoration
                  kcoreaddons
                  kguiaddons
                  kconfigwidgets
                  kwindowsystem
                  ki18n
                  kiconthemes
                  qtbase-5))
    (native-inputs (list extra-cmake-modules pkg-config))
    (home-page "https://github.com/guiodic/material-decoration")
    (synopsis "Material Design window decoration theme for KWin")
    (description "Material Decoration provides a Material Design-inspired
window decoration theme for the KWin window manager.  It features a modern
flat appearance with Locally Integrated Menus (LIM) support, rounded corners,
and customizable accent colors matching the desktop color scheme.")
    (license license:gpl2+)))

;;; ── invader (#4049) ──
;;; Open-source modding toolkit for Halo: Combat Evolved.

(define-public invader
  (package
    (name "invader")
    (version "0.54.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SnowyMouse/invader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (inputs (list sdl2
                  libtiff
                  libvorbis
                  libsamplerate
                  zlib
                  qtbase-5))
    (native-inputs (list pkg-config python))
    (home-page "https://github.com/SnowyMouse/invader")
    (synopsis "open-source modding toolkit for Halo: Combat Evolved")
    (description "Invader is an open-source toolkit for creating and
modifying Halo: Combat Evolved maps and assets.  It provides command-line
tools for compiling maps, extracting tags, building bitmaps, and converting
between tag formats, offering a complete modding pipeline independent of
the original Halo Editing Kit.")
    (license license:gpl3)))
