;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407l
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   mix of binary packages (AppImage, .deb, tar.gz, single-binary),
;;;   source builds (C/C++, Python), fonts, themes, and Rust apps.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260407l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages image)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages games)
  #:export (pipette-desktop-bin
            elyprismlauncher-bin
            lianpkg-gui-bin
            gb-studio-bin
            velo-bin
            webtunnel-client-bin
            hytale-downloader-bin
            sonarr-bin
            ffstudio-bin
            undertalemodtool-bin
            thorium-browser-avx2-bin
            tonelib-gfx-bin
            mateengine-bin
            msdf-atlas-gen
            gnuclad
            bsd-leave
            pidgin-libnotify
            binauralplayer
            python-rofi
            dotctl
            sxhkhm
            myapps
            toad-ai
            font-chocolate-classical-sans
            nordic-darker-standard-buttons-theme
            catppuccin-qt5ct
            fairy-stockfish
            shiru-lv2
            tanin
            swaycons))

;;;
;;; ── 1. pipette-desktop-bin ─────────────────────────────────────────────
;;; Electron-based keymap editor for Vial-powered keyboards
;;;
(define-public pipette-desktop-bin
  (package
    (name "pipette-desktop-bin")
    (version "0.3.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/darakuneko/pipette-desktop/releases/download/v"
             version "/Pipette-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/pipette-desktop"))
            (chmod (string-append bin "/pipette-desktop") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/darakuneko/pipette-desktop")
    (synopsis "keymap editor for Vial-powered keyboards")
    (description
     "Pipette Desktop is an Electron-based GUI application for editing
keymaps on Vial-compatible keyboards.  It provides a visual interface
for configuring key bindings, layers, and macros.")
    (license license:gpl3+)))

;;;
;;; ── 2. elyprismlauncher-bin ────────────────────────────────────────────
;;; Prism Launcher fork with Ely.by account support (Minecraft)
;;;
(define-public elyprismlauncher-bin
  (package
    (name "elyprismlauncher-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ElyPrismLauncher/ElyPrismLauncher/releases/download/"
             version "/ElyPrismLauncher-Linux-Qt6-Portable-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/ElyPrismLauncher" "bin/elyprismlauncher")
               ("share" "share"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ElyPrismLauncher/ElyPrismLauncher")
    (synopsis "Minecraft launcher with Ely.by account integration")
    (description
     "ElyPrismLauncher is a fork of Prism Launcher that adds integrated
support for Ely.by accounts.  It provides a feature-rich interface for
managing Minecraft instances, mods, and resource packs.")
    (license license:gpl3+)))

;;;
;;; ── 3. lianpkg-gui-bin ────────────────────────────────────────────────
;;; Flutter GUI for Wallpaper Engine resource extraction
;;;
(define-public lianpkg-gui-bin
  (package
    (name "lianpkg-gui-bin")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianpkg/releases/download/v"
             version "/lianpkg-gui_" version "_linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/lianpkg-gui"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/unpack")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin")))
            (invoke #$(file-append tar "/bin/tar") "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/lianpkg-gui")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/lianpkg-gui")
                     (string-append bin "/lianpkg-gui"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lianpkg")
    (synopsis "GUI tool for extracting Wallpaper Engine resources")
    (description
     "LianPkg GUI is a Flutter-based application for extracting, unpacking,
and converting Wallpaper Engine @file{.pkg} archives and @file{.tex}
texture files.")
    (license license:gpl3+)))

;;;
;;; ── 4. gb-studio-bin ───────────────────────────────────────────────────
;;; Drag-and-drop retro Game Boy game creator
;;;
(define-public gb-studio-bin
  (package
    (name "gb-studio-bin")
    (version "4.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chrismaltby/gb-studio/releases/download/v"
             version "/gb-studio-linux-debian.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/gb-studio"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/GB Studio")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/gb-studio")
                     (string-append bin "/gb-studio"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gbstudio.dev")
    (synopsis "drag-and-drop retro game creator for Game Boy")
    (description
     "GB Studio is a quick and easy drag-and-drop game creator for the
Nintendo Game Boy.  It allows building games with no programming knowledge
using a visual scripting system, and exports real Game Boy ROM files.")
    (license license:expat)))

;;;
;;; ── 5. velo-bin ────────────────────────────────────────────────────────
;;; Keyboard-first desktop email client built with Tauri
;;;
(define-public velo-bin
  (package
    (name "velo-bin")
    (version "0.4.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/avihaymenahem/velo/releases/download/velo-v"
             version "/Velo_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/velo"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir out)))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://velomail.app")
    (synopsis "keyboard-first desktop email client")
    (description
     "Velo is an open-source desktop email client built with Tauri that
emphasizes keyboard-driven navigation.  It provides a fast, lightweight
interface for managing email accounts.")
    (license license:asl2.0)))

;;;
;;; ── 6. webtunnel-client-bin ────────────────────────────────────────────
;;; Tor Pluggable Transport based on HTTP Upgrade
;;;
(define-public webtunnel-client-bin
  (package
    (name "webtunnel-client-bin")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/a15355447898a/webtunnel/releases/download/"
             version "/client"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/webtunnel-client"))
            (chmod (string-append bin "/webtunnel-client") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/webtunnel")
    (synopsis "tor pluggable transport using HTTP upgrade mechanism")
    (description
     "WebTunnel is a Tor Pluggable Transport based on HTTPT (HTTP Upgrade)
that disguises Tor traffic as regular HTTP traffic to circumvent
censorship.  This package provides the pre-built client binary.")
    (license license:expat)))

;;;
;;; ── 7. hytale-downloader-bin ───────────────────────────────────────────
;;; CLI downloader for Hytale game assets
;;;
(define-public hytale-downloader-bin
  (package
    (name "hytale-downloader-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloader.hytale.com/hytale-downloader.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/unpack")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (mkdir-p bin)
            (let ((binary (string-append tmp "/hytale-downloader-linux-amd64")))
              (when (file-exists? binary)
                (install-file binary bin)
                (chmod (string-append bin "/hytale-downloader-linux-amd64") #o755)
                (symlink (string-append bin "/hytale-downloader-linux-amd64")
                         (string-append bin "/hytale-downloader"))))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hytale.com")
    (synopsis "downloader for Hytale game assets")
    (description
     "Hytale Downloader is a CLI tool for downloading and managing Hytale
game assets and client files on Linux.")
    ;; Proprietary/custom license.
    (license #f)))

;;;
;;; ── 8. sonarr-bin ──────────────────────────────────────────────────────
;;; Smart PVR for newsgroup and BitTorrent users (TV series)
;;;
(define-public sonarr-bin
  (package
    (name "sonarr-bin")
    (version "4.0.17.2952")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://services.sonarr.tv/v1/update/main/download"
             "?version=" version "&os=linux&runtime=netcore&arch=x64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (lib (string-append out "/lib/sonarr"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/unpack")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin")))
            (invoke #$(file-append tar "/bin/tar") "-xf" src "-C" tmp
                    "--strip-components=1")
            (copy-recursively tmp lib)
            (mkdir-p bin)
            (with-output-to-file (string-append bin "/sonarr")
              (lambda ()
                (display (string-append "#!/bin/sh\nexec "
                                        lib "/Sonarr \"$@\"\n"))))
            (chmod (string-append bin "/sonarr") #o755)
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sonarr.tv")
    (synopsis "smart PVR for TV series management and automation")
    (description
     "Sonarr is a PVR for Usenet and BitTorrent users that can monitor
multiple RSS feeds for new episodes of TV shows, automatically grab,
sort, and rename them.  It includes a web interface for managing
downloads and library organization.")
    (license license:gpl3+)))

;;;
;;; ── 9. ffstudio-bin ────────────────────────────────────────────────────
;;; Graphical node-based frontend for FFmpeg
;;;
(define-public ffstudio-bin
  (package
    (name "ffstudio-bin")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Draver93/ff-studio/releases/download/v"
             version "/FFStudio_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/ffstudio"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir out)))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ffstudio.app")
    (synopsis "graphical node-based FFmpeg frontend")
    (description
     "FFStudio is a graphical desktop application that provides a node-based
visual interface for building FFmpeg processing pipelines.  Users can
construct complex media conversion workflows by connecting processing
nodes in a graph editor.")
    (license license:gpl3+)))

;;;
;;; ── 10. undertalemodtool-bin ───────────────────────────────────────────
;;; Tool for modding and decompiling Undertale and GameMaker games
;;;
(define-public undertalemodtool-bin
  (package
    (name "undertalemodtool-bin")
    (version "0.8.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/UnderminersTeam/UndertaleModTool/releases/download/"
             version "/UTMT_CLI_v" version "-Ubuntu.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (lib (string-append out "/lib/undertalemodtool"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/unpack")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip "/bin/unzip") src "-d" tmp)
            (mkdir-p lib)
            (copy-recursively tmp lib)
            (mkdir-p bin)
            (let ((cli (string-append lib "/UTMT_CLI")))
              (when (file-exists? cli)
                (chmod cli #o755)
                (symlink cli (string-append bin "/utmt-cli"))))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://underminersteam.github.io")
    (synopsis "tool for modding and decompiling GameMaker games")
    (description
     "UndertaleModTool (UTMT) is the most complete tool for modding,
decompiling, and unpacking Undertale and other GameMaker Studio games.
This package provides the CLI variant for Linux.")
    (license license:gpl3+)))

;;;
;;; ── 11. thorium-browser-avx2-bin ───────────────────────────────────────
;;; Chromium fork focused on speed with AVX2 optimizations
;;;
(define-public thorium-browser-avx2-bin
  (package
    (name "thorium-browser-avx2-bin")
    (version "138.0.7204.303")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicehash/nicehash-os-archive/releases/download/"
             "nicehash/thorium-browser_" version "-1_amd64.deb"))
       ;; Alternative: use the official RPM or .deb from Alex313031/thorium.
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/thorium"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/chromium.org/thorium")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/thorium-browser")
                     (string-append bin "/thorium-browser"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://thorium.rocks")
    (synopsis "chromium fork with AVX2 optimizations for speed")
    (description
     "Thorium Browser is a Chromium fork focused on performance
optimizations.  This build requires AVX2 CPU instruction support and
includes compiler-level optimizations for faster page rendering and
JavaScript execution.")
    ;; Chromium BSD-style license.
    (license license:bsd-3)))

;;;
;;; ── 12. tonelib-gfx-bin ────────────────────────────────────────────────
;;; Guitar amp and effects modeling studio
;;;
(define-public tonelib-gfx-bin
  (package
    (name "tonelib-gfx-bin")
    (version "4.9.0")
    (source
     (origin
       (method url-fetch)
       ;; Unversioned URL — always serves latest.
       (uri "https://www.tonelib.net/download/ToneLib-GFX-amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/tonelib-gfx"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/tonelib-gfx")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/ToneLib-GFX")
                     (string-append bin "/tonelib-gfx"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tonelib.net/gfx-overview/")
    (synopsis "guitar amp and effects modeling studio")
    (description
     "ToneLib GFX is a complete guitar effects processor simulator that
models various amplifiers, cabinets, and effects pedals.  It provides
a signal chain editor for building custom guitar tones.")
    ;; Proprietary.
    (license #f)))

;;;
;;; ── 13. mateengine-bin ─────────────────────────────────────────────────
;;; Desktop Mate alternative (VRM desktop pet, Unity-based)
;;;
(define-public mateengine-bin
  (package
    (name "mateengine-bin")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Marksonthegamer/Mate-Engine-Linux-Port"
             "/releases/download/Public-Release-X" version
             "_4_hotfix/MateEngineX_" version "_4_hotfix.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/mateengine"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/unpack")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin")))
            (invoke #$(file-append tar "/bin/tar") "-xf" src "-C" tmp)
            (copy-recursively tmp opt)
            (mkdir-p bin)
            (let ((exe (string-append opt "/MateEngineX.x86_64")))
              (when (file-exists? exe)
                (chmod exe #o755)
                (symlink exe (string-append bin "/mateengine"))))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Marksonthegamer/Mate-Engine-Linux-Port")
    (synopsis "desktop companion pet application (Desktop Mate alternative)")
    (description
     "MateEngine is a Linux port of a Desktop Mate alternative that provides
VRM-based desktop pet companions.  Built with the Unity engine, it renders
animated 3D characters on the desktop.")
    ;; Custom MateEngine Pro License.
    (license #f)))

;;;
;;; ── 14. msdf-atlas-gen ─────────────────────────────────────────────────
;;; Multi-channel signed distance field font atlas generator
;;;
(define-public msdf-atlas-gen
  (package
    (name "msdf-atlas-gen")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Chlumsky/msdf-atlas-gen/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DMSDF_ATLAS_MSDFGEN_EXTERNAL=OFF"
                   "-DMSDF_ATLAS_NO_ARTERY_FONT=ON"
                   "-DMSDF_ATLAS_USE_SKIA=OFF"
                   "-DMSDF_ATLAS_USE_VCPKG=OFF")
           #:tests? #f))
    (inputs (list freetype libpng zlib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Chlumsky/msdf-atlas-gen")
    (synopsis "multi-channel signed distance field font atlas generator")
    (description
     "MSDF Atlas Gen generates font atlases using multi-channel signed
distance fields (MSDF).  These atlases enable high-quality text rendering
at arbitrary scales in GPU-accelerated applications and game engines.")
    (license license:expat)))

;;;
;;; ── 15. gnuclad ────────────────────────────────────────────────────────
;;; Cladogram/timeline tree generator for Linux distribution timelines
;;;
(define-public gnuclad
  (package
    (name "gnuclad")
    (version "0.2.4.p1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FabioLolix/gnuclad/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake))
    (home-page "https://github.com/FabioLolix/gnuclad")
    (synopsis "cladogram and timeline tree generator")
    (description
     "gnuclad generates cladogram-style timeline trees from CSV data.  It is
primarily used for creating Linux and BSD distribution timeline charts,
producing output in SVG and other formats.")
    (license license:gpl3+)))

;;;
;;; ── 16. bsd-leave ──────────────────────────────────────────────────────
;;; BSD leave command — reminds you when it is time to leave
;;;
(define-public bsd-leave
  (package
    (name "bsd-leave")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://ftp.de.debian.org/debian/pool/main/l/leave/leave_"
             version ".orig.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gcc" "-o" "leave" "leave.c")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (man (string-append out "/share/man/man1")))
                     (install-file "leave" bin)
                     (mkdir-p man)
                     (when (file-exists? "leave.1")
                       (install-file "leave.1" man))))))))
    (home-page "https://packages.debian.org/leave")
    (synopsis "BSD reminder utility that tells you when to leave")
    (description
     "The @command{leave} command waits until the specified time, then
reminds you that you have to leave.  It is useful for setting reminders
from the command line without external tools.")
    (license license:bsd-3)))

;;;
;;; ── 17. pidgin-libnotify ───────────────────────────────────────────────
;;; Pidgin plugin for desktop notifications via libnotify
;;;
(define-public pidgin-libnotify
  (package
    (name "pidgin-libnotify")
    (version "0.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.sourceforge.net/gaim-libnotify/"
             name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list pidgin libnotify gtk+-2))
    (native-inputs (list pkg-config intltool))
    (home-page "http://gaim-libnotify.sourceforge.net")
    (synopsis "desktop notification plugin for Pidgin messenger")
    (description
     "Pidgin-libnotify is a plugin for the Pidgin instant messaging client
that uses libnotify to display desktop notification popups when contacts
sign on, send messages, or other events occur.")
    (license license:gpl2+)))

;;;
;;; ── 18. binauralplayer ─────────────────────────────────────────────────
;;; Media player with binaural beat (brainwave audio) generation
;;;
(define-public binauralplayer
  (package
    (name "binauralplayer")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alamahant/BinauralPlayer/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtmultimedia qtsvg))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/alamahant/BinauralPlayer")
    (synopsis "media player with binaural beat audio generation")
    (description
     "BinauralPlayer is a media player that combines traditional audio
playback with binaural beat generation.  It can produce frequency
differences between left and right audio channels to create brainwave
entrainment effects for relaxation and focus.")
    (license license:gpl3)))

;;;
;;; ── 19. python-rofi ────────────────────────────────────────────────────
;;; Python module for creating simple GUIs with Rofi
;;;
(define-public python-rofi
  (package
    (name "python-rofi")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bcbnz/python-rofi/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/bcbnz/python-rofi")
    (synopsis "python module for making simple GUIs with Rofi")
    (description
     "Python-rofi is a Python module that provides a simple interface for
creating graphical selection dialogs using Rofi, the dmenu replacement.
It supports text entry, selection lists, and error/status messages.")
    (license license:expat)))

;;;
;;; ── 20. dotctl ─────────────────────────────────────────────────────────
;;; Simple dotfiles/shell configuration switcher
;;;
(define-public dotctl
  (package
    (name "dotctl")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xZepyx/dotctl/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (install-file "src/dotctl.py" bin)
                     (rename-file (string-append bin "/dotctl.py")
                                  (string-append bin "/dotctl"))
                     (chmod (string-append bin "/dotctl") #o755)))))))
    (inputs (list python))
    (home-page "https://github.com/xZepyx/dotctl")
    (synopsis "simple dotfiles and shell configuration switcher")
    (description
     "dotctl is a command-line utility for switching between different
dotfile configurations and shell setups.  It manages symlinks and
configuration files to enable quick environment switching.")
    (license license:expat)))

;;;
;;; ── 21. sxhkhm ─────────────────────────────────────────────────────────
;;; Parse and display sxhkd keybindings for fuzzy-find lookup
;;;
(define-public sxhkhm
  (package
    (name "sxhkhm")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fiskhest/sxhkd-helper-menu/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/fiskhest/sxhkd-helper-menu")
    (synopsis "parse and display sxhkd keybindings for fuzzy-find")
    (description
     "sxhkhm (sxhkd helper menu) parses sxhkd configuration files and
displays keybindings in a format suitable for piping to fzf, rofi, or
dmenu.  This enables quick fuzzy-find lookup of hotkey definitions.")
    (license license:bsd-2)))

;;;
;;; ── 22. myapps ─────────────────────────────────────────────────────────
;;; GTK4/Libadwaita tool for listing installed applications
;;;
(define-public myapps
  (package
    (name "myapps")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicolettas-muggelbude/myapps/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python python-pygobject gtk))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/nicolettas-muggelbude/myapps")
    (synopsis "GTK4 tool for listing and managing installed applications")
    (description
     "MyApps is a GTK4/Libadwaita application that lists and manages
installed desktop applications on Linux.  It provides a clean interface
for browsing, searching, and organizing application entries.")
    (license license:gpl3+)))

;;;
;;; ── 23. toad-ai ────────────────────────────────────────────────────────
;;; Unified AI interface for the terminal
;;;
(define-public toad-ai
  (package
    (name "toad-ai")
    (version "0.6.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/batrachianai/toad/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/batrachianai/toad")
    (synopsis "unified AI interface for the terminal")
    (description
     "Toad is a terminal-based interface that unifies access to multiple AI
providers.  It supports various AI backends and provides a consistent
command-line experience for interacting with large language models.")
    (license license:agpl3+)))

;;;
;;; ── 24. font-chocolate-classical-sans ──────────────────────────────────
;;; Traditional Chinese font based on Source Han Sans
;;;
(define-public font-chocolate-classical-sans
  (package
    (name "font-chocolate-classical-sans")
    (version "1.001")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MoonlitOwen/ChocolateSans")
             (commit "da53f36e4d09712999369a0f62c698958e5f513c")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/MoonlitOwen/ChocolateSans")
    (synopsis "traditional Chinese font with classical glyph forms")
    (description
     "Chocolate Classical Sans is a traditional Chinese font based on Source
Han Sans that features inherited (classical) glyph forms.  It provides
an alternative rendering style suitable for traditional Chinese text.")
    (license license:silofl1.1)))

;;;
;;; ── 25. nordic-darker-standard-buttons-theme ───────────────────────────
;;; Nordic GTK dark theme with standard window buttons (Nord palette)
;;;
(define-public nordic-darker-standard-buttons-theme
  (package
    (name "nordic-darker-standard-buttons-theme")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EliverLara/Nordic")
             (commit "8df624b84bd93db8039cf8a0a4f81cb81f0f9ae6")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/Nordic-darker-standard-buttons"
                #:exclude ("README.md" ".gitignore" "LICENSE")))))
    (home-page "https://github.com/EliverLara/Nordic")
    (synopsis "nordic GTK dark theme with standard window buttons")
    (description
     "Nordic is a GTK3.20+ theme using the Nord color palette.  This variant
provides a darker appearance with standard (non-macOS-style) window
control buttons.  It supports GTK3, GTK4, and various desktop
environments.")
    (license license:gpl3+)))

;;;
;;; ── 26. catppuccin-qt5ct ───────────────────────────────────────────────
;;; Catppuccin pastel color scheme for qt5ct and qt6ct
;;;
(define-public catppuccin-qt5ct
  (package
    (name "catppuccin-qt5ct")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/catppuccin/qt5ct")
             (commit "cb58530ec5e98e0371f33debc67455e98eb6e59f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("themes/" "share/qt5ct/colors/")
               ("themes/" "share/qt6ct/colors/"))))
    (home-page "https://github.com/catppuccin/qt5ct")
    (synopsis "catppuccin pastel color scheme for qt5ct and qt6ct")
    (description
     "Catppuccin for qt5ct provides the Catppuccin soothing pastel color
scheme as configuration files for qt5ct and qt6ct.  It includes all four
Catppuccin flavors: Latte, Frappe, Macchiato, and Mocha.")
    (license license:expat)))

;;;
;;; ── 27. fairy-stockfish ────────────────────────────────────────────────
;;; Chess variant engine supporting many fairy chess variants
;;;
(define-public fairy-stockfish
  (package
    (name "fairy-stockfish")
    (version "14.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fairy-stockfish/Fairy-Stockfish")
             (commit (string-append "fairy_sf_" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   "ARCH=x86-64"
                   "-C" "src"
                   (string-append "CXX=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "src/stockfish" bin)
                     (rename-file (string-append bin "/stockfish")
                                  (string-append bin "/fairy-stockfish"))))))))
    (home-page "https://github.com/fairy-stockfish/Fairy-Stockfish")
    (synopsis "chess variant engine supporting many fairy chess games")
    (description
     "Fairy-Stockfish is a chess variant engine derived from Stockfish that
supports a wide range of fairy chess variants including Xiangqi, Shogi,
Janggi, Makruk, Crazyhouse, Atomic chess, and many others.  It implements
the UCI protocol for compatibility with standard chess GUIs.")
    (license license:gpl3+)))

;;;
;;; ── 28. shiru-lv2 ──────────────────────────────────────────────────────
;;; LV2 audio plugins ported from Shiru's chiptune VST plugins
;;;
(define-public shiru-lv2
  (package
    (name "shiru-lv2")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/linuxmao-org/shiru-plugins")
             (commit "e6d8816bea88e3b5e2cb33a9ef8e51cba37e59db")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list lv2))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/linuxmao-org/shiru-plugins")
    (synopsis "LV2 audio plugins ported from Shiru's chiptune VSTs")
    (description
     "Shiru LV2 is a collection of LV2 audio plugins ported from Shiru's
original chiptune VST synthesizers.  The collection includes various
chip-style sound generators useful for creating retro and 8-bit style
audio in LV2-compatible digital audio workstations.")
    ;; WTFPL (Do What The F*** You Want To Public License).
    (license license:wtfpl2)))

;;;
;;; ── 29. tanin ──────────────────────────────────────────────────────────
;;; TUI ambient sound and noise generator
;;;
(define-public tanin
  (package
    (name "tanin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AnonMiraj/Tanin/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           ;; NOTE: cargo-inputs need to be enumerated via `guix import crate`.
           ;; This recipe provides the structural design; cargo dependencies
           ;; must be added before building.
           ))
    (home-page "https://github.com/AnonMiraj/Tanin")
    (synopsis "TUI ambient sound and noise generator")
    (description
     "Tanin is a terminal user interface application for generating ambient
sounds and noise.  It provides various noise profiles including white
noise, rain, and other ambient sounds for concentration and relaxation.")
    (license license:expat)))

;;;
;;; ── 30. swaycons ───────────────────────────────────────────────────────
;;; Automatically set window icons in Sway using Nerd Fonts
;;;
(define-public swaycons
  (package
    (name "swaycons")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/allie-wake-up/swaycons/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           ;; NOTE: cargo-inputs need to be enumerated via `guix import crate`.
           ;; This recipe provides the structural design; cargo dependencies
           ;; must be added before building.
           ))
    (home-page "https://github.com/allie-wake-up/swaycons")
    (synopsis "automatically set window icons in Sway compositor")
    (description
     "Swaycons automatically sets window icons in the Sway Wayland compositor
using Nerd Font glyphs.  It monitors window events and assigns appropriate
icons based on the application class, providing a visually consistent
desktop experience.")
    (license license:expat)))
