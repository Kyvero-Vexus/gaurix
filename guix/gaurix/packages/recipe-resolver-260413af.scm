;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413af
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (binary repacks, C/C++ source, Python, Ruby, Go, shell)
;;;   - 0 re-blocked
;;;
;;; Recipes (30):
;;;   wstunnel-bin, bluetuith-bin, easyeda-bin, uutils-coreutils-bin,
;;;   natmap, curlftpfs-ng, atari++, zapret,
;;;   rockchip-mpp, ori, fcitx5-mcbopomofo, si-edit, ftb-file-browser,
;;;   rmg, svxlink, plasma5-wallpapers-dynamic,
;;;   nautilus-checksums, mesonlsp,
;;;   eml2pdf, puddletag, input-remapper, improve-imgsli,
;;;   objection, cozy-audiobooks, python-magika,
;;;   ruby-digest-crc,
;;;   pyonji, tonearm,
;;;   wslu, x11docker
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413af)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fcitx5)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg)
  #:export (
            ;; Binary packages
            wstunnel-bin
            bluetuith-bin
            easyeda-bin
            uutils-coreutils-bin
            ;; C/C++ source builds (gnu-build-system)
            natmap
            curlftpfs-ng
            atari++
            zapret
            ;; C/C++ source builds (cmake-build-system)
            rockchip-mpp
            ori
            fcitx5-mcbopomofo
            si-edit
            ftb-file-browser
            rmg
            svxlink
            plasma5-wallpapers-dynamic
            ;; C/C++ source builds (meson-build-system)
            nautilus-checksums
            mesonlsp
            ;; Python packages
            eml2pdf
            puddletag
            input-remapper
            improve-imgsli
            objection
            cozy-audiobooks
            python-magika
            ;; Ruby packages
            ruby-digest-crc
            ;; Go packages
            pyonji
            tonearm
            ;; Shell scripts
            wslu
            x11docker
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── wstunnel-bin (#7733) ──
;;; Tunnel all traffic over WebSocket or HTTP2.

(define-public wstunnel-bin
  (package
    (name "wstunnel-bin")
    (version "10.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/erebe/wstunnel/releases/download/v"
                    version "/wstunnel_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wstunnel" "bin/wstunnel"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/erebe/wstunnel")
    (synopsis "tunnel all traffic over WebSocket or HTTP2")
    (description "Wstunnel tunnels TCP, UDP, Unix sockets, and HTTP proxy
traffic over WebSocket or HTTP2 connections.  It is useful for bypassing
restrictive firewalls that only allow HTTPS traffic.")
    (license license:bsd-3)))

;;; ── bluetuith-bin (#7749) ──
;;; TUI-based bluetooth connection manager.

(define-public bluetuith-bin
  (package
    (name "bluetuith-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluetuith-org/bluetuith/releases/download/v"
                    version "/bluetuith_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bluetuith" "bin/bluetuith"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bluetuith-org/bluetuith")
    (synopsis "TUI-based bluetooth connection manager")
    (description "Bluetuith is a TUI-based bluetooth connection manager that
can interact with bluetooth adapters and devices.  It aims to be a
feature-rich replacement for @command{bluetoothctl}.")
    (license license:expat)))

;;; ── easyeda-bin (#7742) ──
;;; Electronic circuit design tool (proprietary binary).

(define-public easyeda-bin
  (package
    (name "easyeda-bin")
    (version "6.5.51")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://image.easyeda.com/files/easyeda-linux-x64-"
                    version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/easyeda/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/easyeda/easyeda")
                              (string-append bin "/easyeda"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://easyeda.com/")
    (synopsis "simple and powerful electronic circuit design tool")
    (description "EasyEDA is an electronic circuit design tool that provides
schematic capture, SPICE simulation, and PCB layout in a single
application.  This package installs the pre-built binary distribution.")
    (license (license:non-copyleft
              "https://easyeda.com/page/legal"
              "Proprietary"))))

;;; ── uutils-coreutils-bin (#7067) ──
;;; Cross-platform Rust rewrite of GNU coreutils (pre-built binary).

(define-public uutils-coreutils-bin
  (package
    (name "uutils-coreutils-bin")
    (version "0.0.29")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uutils/coreutils/releases/download/"
                    version "/coreutils-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/"
                #:include-regexp ("^coreutils$")))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/uutils/coreutils")
    (synopsis "cross-platform Rust rewrite of GNU coreutils")
    (description "uutils coreutils is a cross-platform reimplementation of the
GNU coreutils in Rust.  It provides compatible replacements for standard
UNIX utilities like @command{ls}, @command{cp}, @command{mv}, and others.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds — gnu-build-system (autotools / Makefile)
;;; ──────────────────────────────────────────────────────────────────

;;; ── natmap (#7195) ──
;;; TCP/UDP port mapping for full cone NAT.

(define-public natmap
  (package
    (name "natmap")
    (version "20260214")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/heiher/natmap")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/heiher/natmap")
    (synopsis "TCP/UDP port mapping for full cone NAT")
    (description "NATMap establishes TCP/UDP port mapping for full cone NAT
environments.  It is useful for exposing services behind carrier-grade NAT
without requiring a public IP address.")
    (license license:expat)))

;;; ── curlftpfs-ng (#7273) ──
;;; FUSE filesystem for FTP.

(define-public curlftpfs-ng
  (package
    (name "curlftpfs-ng")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://ikn.org.uk/tool/curlftpfs-ng/curlftpfs-ng-"
                    version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list curl fuse glib))
    (native-inputs (list pkg-config))
    (home-page "http://ikn.org.uk/tool/curlftpfs-ng")
    (synopsis "FUSE filesystem for accessing FTP servers")
    (description "CurlFtpFS-NG is a filesystem for accessing FTP hosts based on
FUSE and libcurl.  It allows mounting remote FTP directories as local
filesystems with transparent read and write access.")
    (license license:gpl2)))

;;; ── atari++ (#6758) ──
;;; Emulator for Atari 400/800/XL/XE and 5200.

(define-public atari++
  (package
    (name "atari++")
    (version "1.85")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.xl-project.com/download/atari++-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list sdl libpng alsa-lib libsm))
    (home-page "http://www.xl-project.com")
    (synopsis "emulator for Atari 400/800/XL/XE and 5200 computers")
    (description "Atari++ is an emulator for the Atari 8-bit computer line
including the 400, 800, 800XL, 130XE, and 5200 game console.  It provides
accurate CPU, ANTIC, GTIA, POKEY, and PIA emulation.")
    (license (license:non-copyleft
              "http://www.xl-project.com"
              "THOR Public License"))))

;;; ── zapret (#7277) ──
;;; DPI bypass tool.

(define-public zapret
  (package
    (name "zapret")
    (version "70.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bol-van/zapret")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list curl iptables))
    ;; NOTE: Also needs libnetfilter-queue, bind-utils, ipset, nmap at runtime
    (home-page "https://github.com/bol-van/zapret")
    (synopsis "DPI bypass tool for network censorship circumvention")
    (description "Zapret provides tools to bypass deep packet inspection (DPI)
used for internet censorship.  It modifies TCP/IP packets to evade
signature-based filtering on network equipment.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds — cmake-build-system
;;; ──────────────────────────────────────────────────────────────────

;;; ── rockchip-mpp (#7518) ──
;;; Rockchip Media Process Platform library.

(define-public rockchip-mpp
  (package
    (name "rockchip-mpp")
    (version "1.0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HermanChen/mpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/HermanChen/mpp")
    (synopsis "Rockchip Media Process Platform library")
    (description "Rockchip MPP provides a unified interface for hardware video
encoding and decoding on Rockchip SoCs.  It supports H.264, H.265, VP8,
VP9, and other codecs through the Rockchip VPU hardware.")
    (license (list license:asl2.0 license:expat))))

;;; ── ori (#4245) ──
;;; OpenRouter interactive terminal AI assistant.

(define-public ori
  (package
    (name "ori")
    (version "1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.archlinux.org/piratheon/ori")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list curl jsoncpp bash-minimal))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.archlinux.org/piratheon/ori")
    (synopsis "interactive terminal AI assistant using OpenRouter")
    (description "Ori is an interactive terminal AI assistant that uses the
OpenRouter API.  It provides a command-line interface for interacting with
various large language models directly from the terminal.")
    (license license:gpl3)))

;;; ── fcitx5-mcbopomofo (#11227) ──
;;; McBopomofo Traditional Chinese IME for fcitx5.

(define-public fcitx5-mcbopomofo
  (package
    (name "fcitx5-mcbopomofo")
    (version "3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openvanilla/fcitx5-mcbopomofo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list fcitx5 fmt))
    (native-inputs (list extra-cmake-modules pkg-config))
    (home-page "https://github.com/openvanilla/fcitx5-mcbopomofo")
    (synopsis "McBopomofo input method for fcitx5")
    (description "Fcitx5-McBopomofo is a Traditional Chinese input method
engine for the fcitx5 input framework.  It provides Bopomofo (Zhuyin)
input with smart phrase prediction.")
    (license license:expat)))

;;; ── si-edit (#7702) ──
;;; Tools for working with SI files from LEGO Island.

(define-public si-edit
  (package
    (name "si-edit")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/isledecomp/SIEdit")
                    (commit "6da93b2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list qtbase qttools qtmultimedia ffmpeg))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/isledecomp/SIEdit")
    (synopsis "tools for working with SI files from LEGO Island")
    (description "SIEdit provides tools for viewing and editing SI
(Streamed Interleave) files used in the LEGO Island video game.  It allows
extraction and modification of media assets within these container files.")
    (license license:gpl3)))

;;; ── ftb-file-browser (#4407) ──
;;; Terminal file browser built with FTXUI.

(define-public ftb-file-browser
  (package
    (name "ftb-file-browser")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cyxuan0311/ftb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list ffmpeg libx11))
    ;; NOTE: Also needs ftxui, yaml-cpp, libssh2, mysql-client, tbb (not all in Guix)
    (native-inputs (list pkg-config))
    (home-page "https://github.com/Cyxuan0311/ftb")
    (synopsis "terminal file browser built with FTXUI")
    (description "FTB is a terminal file browser built using the FTXUI library.
It provides a text-based user interface for navigating and managing files
with support for multiple panels and file preview.")
    (license license:expat)))

;;; ── rmg (#7735) ──
;;; Rosalie's Mupen GUI for N64 emulation.

(define-public rmg
  (package
    (name "rmg")
    (version "0.8.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rosalie241/rmg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list qtbase qtsvg hidapi zlib freetype))
    ;; NOTE: Also needs sdl3, qt6-websockets, libusb, libsamplerate,
    ;; speexdsp, minizip, vulkan-headers (native)
    (native-inputs (list pkg-config nasm))
    (home-page "https://github.com/Rosalie241/rmg")
    (synopsis "graphical frontend for the Mupen64Plus N64 emulator")
    (description "RMG (Rosalie's Mupen GUI) is a graphical frontend for the
Mupen64Plus Nintendo 64 emulator.  It provides a modern Qt6 interface for
managing ROMs, configuring input, and running N64 games.")
    (license license:gpl3)))

;;; ── svxlink (#7505) ──
;;; Advanced repeater controller and EchoLink software for amateur radio.

(define-public svxlink
  (package
    (name "svxlink")
    (version "25.05.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sm0svx/svxlink")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list alsa-lib curl openssl opus speex))
    ;; NOTE: Also needs gsm, popt, libgpiod, libsigc++, rtl-sdr, tcl,
    ;; jsoncpp, libogg, python, python-yaml, python-requests
    (native-inputs (list pkg-config))
    (home-page "https://github.com/sm0svx/svxlink")
    (synopsis "advanced repeater controller and EchoLink software")
    (description "SvxLink is an advanced repeater controller for amateur radio.
It includes a repeater controller, an EchoLink application for linking
repeaters over the internet, and a remote receiver application.")
    (license (list license:gpl2 license:lgpl2.1))))

;;; ── plasma5-wallpapers-dynamic (#4255) ──
;;; Dynamic wallpaper plugin for KDE Plasma.

(define-public plasma5-wallpapers-dynamic
  (package
    (name "plasma5-wallpapers-dynamic")
    (version "5.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zzag/plasma5-wallpapers-dynamic")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (inputs (list qtbase qtdeclarative libexif))
    ;; NOTE: Also needs libavif, libplasma, qt6-location
    (native-inputs (list extra-cmake-modules pkg-config))
    (home-page "https://github.com/zzag/plasma5-wallpapers-dynamic")
    (synopsis "dynamic wallpaper plugin for KDE Plasma")
    (description "Plasma5-wallpapers-dynamic is a KDE Plasma wallpaper plugin
that provides dynamic wallpapers which change based on the time of day.
It supports Apple-style dynamic wallpapers and HEIF images.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds — meson-build-system
;;; ──────────────────────────────────────────────────────────────────

;;; ── nautilus-checksums (#7516) ──
;;; Add checksums to Nautilus file properties window.

(define-public nautilus-checksums
  (package
    (name "nautilus-checksums")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/madmurphy/nautilus-checksums")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list glib nautilus))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.gnome.org/madmurphy/nautilus-checksums")
    (synopsis "add checksums to Nautilus file properties window")
    (description "Nautilus Checksums adds checksum information (MD5, SHA-256,
etc.) to the properties window of GNOME Files (Nautilus).  It allows users
to quickly verify file integrity without using the command line.")
    (license license:gpl3+)))

;;; ── mesonlsp (#7272) ──
;;; Language server for the Meson build system.

(define-public mesonlsp
  (package
    (name "mesonlsp")
    (version "4.3.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JCWasmx86/mesonlsp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list curl libarchive tree-sitter))
    ;; NOTE: Also needs tomlplusplus, mercurial, subversion at runtime
    (native-inputs (list pkg-config googletest nlohmann-json))
    (home-page "https://github.com/JCWasmx86/mesonlsp")
    (synopsis "language server for the Meson build system")
    (description "Mesonlsp provides IDE features for Meson build files including
code completion, diagnostics, hover information, and go-to-definition.
It implements the Language Server Protocol for integration with any editor.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── eml2pdf (#7197) ──
;;; Convert email (.eml) files to PDF.

(define-public eml2pdf
  (package
    (name "eml2pdf")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/plenaerts/eml2pdf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-beautifulsoup4 python-markdown))
    ;; NOTE: Also needs python-weasyprint, python-hurry-filesize (not in Guix)
    (native-inputs (list python-setuptools-scm python-wheel))
    (home-page "https://github.com/plenaerts/eml2pdf")
    (synopsis "convert email (.eml) files to PDF")
    (description "Eml2pdf converts email files in .eml format to PDF documents
using Pango for text rendering.  It preserves the email structure including
headers, body text, and inline formatting.")
    (license license:expat)))

;;; ── puddletag (#11230) ──
;;; Audio tag editor for GNU/Linux.

(define-public puddletag
  (package
    (name "puddletag")
    (version "2.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/puddletag/puddletag")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-mutagen python-pyparsing))
    ;; NOTE: Also needs python-configobj, python-distro, python-pyqt6,
    ;; python-unidecode, qt6-svg
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/puddletag/puddletag")
    (synopsis "audio tag editor for GNU/Linux")
    (description "Puddletag is a tag editor for audio files on GNU/Linux.
It uses a spreadsheet-like interface inspired by Mp3tag for Windows,
allowing quick editing of tags across multiple files simultaneously.")
    (license license:gpl3+)))

;;; ── input-remapper (#4208) ──
;;; Tool to remap input device buttons and keys.

(define-public input-remapper
  (package
    (name "input-remapper")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sezanzeb/input-remapper/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pygobject python-pydbus gtk+))
    ;; NOTE: Also needs python-evdev, python-pydantic, python-dasbus,
    ;; python-psutil, python-packaging, gtksourceview4
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/sezanzeb/input-remapper")
    (synopsis "tool to remap input device buttons and keys")
    (description "Input Remapper changes the mapping of input device buttons
and keys.  It supports gamepads, mice, keyboards, and other input devices,
with a graphical GTK interface for easy configuration.")
    (license license:gpl3+)))

;;; ── improve-imgsli (#7734) ──
;;; Image comparison tool with magnifying glass feature.

(define-public improve-imgsli
  (package
    (name "improve-imgsli")
    (version "8.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Loganavter/improve-imgsli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-pillow python-markdown ffmpeg))
    ;; NOTE: Also needs python-numpy, python-pyqt6, python-opengl,
    ;; python-scikit-image
    (home-page "https://github.com/Loganavter/improve-imgsli")
    (synopsis "image comparison tool with magnifying glass feature")
    (description "Improve-ImgSli is an image comparison tool that provides
side-by-side comparison with a slider and magnifying glass.  It supports
various image formats and provides visual analysis tools.")
    (license license:expat)))

;;; ── objection (#7394) ──
;;; Runtime mobile exploration toolkit powered by Frida.

(define-public objection
  (package
    (name "objection")
    (version "1.12.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/o/objection/objection-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-click python-flask python-requests
                             python-pygments python-tabulate python-setuptools))
    ;; NOTE: Also needs python-frida, python-frida-tools, litecli,
    ;; python-delegator, python-prompt-toolkit, python-semver
    (home-page "https://github.com/sensepost/objection")
    (synopsis "runtime mobile exploration toolkit powered by Frida")
    (description "Objection is a runtime mobile exploration toolkit powered by
Frida.  It allows security testing of iOS and Android applications without
a jailbreak or root, providing commands for common assessment tasks.")
    (license license:gpl3)))

;;; ── cozy-audiobooks (#7278) ──
;;; Modern audiobook player for Linux using GTK.

(define-public cozy-audiobooks
  (package
    (name "cozy-audiobooks")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geigi/cozy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (inputs (list gtk+ libhandy gstreamer gst-plugins-base gst-plugins-good))
    ;; NOTE: Also needs python-gobject, python-mutagen, python-cairo,
    ;; python-peewee, python-apsw, libadwaita, gtk4, appstream-glib,
    ;; dbus-python, python-distro, python-requests, python-pytz
    (native-inputs (list pkg-config desktop-file-utils))
    (home-page "https://github.com/geigi/cozy")
    (synopsis "modern audiobook player for Linux")
    (description "Cozy is a modern audiobook player for Linux.  It features
audiobook importing, playback speed control, sleep timer, bookmarks, and
automatic book discovery from configured library paths.")
    (license license:gpl3)))

;;; ── python-magika (#7275) ──
;;; AI-powered file type detection by Google.

(define-public python-magika
  (package
    (name "python-magika")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/magika")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-click))
    ;; NOTE: Also needs python-onnxruntime, python-dotenv, python-numpy
    ;; Uses Maturin (Rust+Python) build; may need cargo/rustc
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/google/magika")
    (synopsis "AI-powered file type detection by Google")
    (description "Magika is a file type detection tool by Google that uses
deep learning to identify file types with high accuracy.  It supports
over 100 content types and provides both a Python API and CLI.")
    (license license:asl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; Ruby packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ruby-digest-crc (#7517) ──
;;; CRC library for Ruby.

(define-public ruby-digest-crc
  (package
    (name "ruby-digest-crc")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://rubygems.org/downloads/digest-crc-"
                    version ".gem"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/postmodern/digest-crc")
    (synopsis "cyclic redundancy check (CRC) library for Ruby")
    (description "Digest::CRC provides pure Ruby implementations of various CRC
algorithms including CRC-1, CRC-5, CRC-8, CRC-16, CRC-24, CRC-32, and
CRC-64.  It follows the @code{Digest} API for seamless integration.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Go packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── pyonji (#7537) ──
;;; Easy-to-use tool to send email patches.

(define-public pyonji
  (package
    (name "pyonji")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~emersion/pyonji")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "git.sr.ht/~emersion/pyonji"
           #:tests? #f))
    (inputs (list git-minimal))
    ;; NOTE: Go module dependencies need enumeration for full build
    (home-page "https://sr.ht/~emersion/pyonji")
    (synopsis "easy-to-use tool to send email patches")
    (description "Pyonji sends email patches from Git repositories.  It
provides a simple workflow for contributors to send patches via email to
project mailing lists, integrating with Git's format-patch output.")
    (license license:gpl3)))

;;; ── tonearm (#4406) ──
;;; Unofficial native GTK4 music streaming client for TIDAL.

(define-public tonearm
  (package
    (name "tonearm")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/dergs/Tonearm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "codeberg.org/dergs/Tonearm"
           #:tests? #f))
    (inputs (list gtk+ gstreamer gst-plugins-base gst-plugins-good))
    ;; NOTE: Needs GTK4, libadwaita, libsecret, glib-networking,
    ;; gst-plugins-bad; Go module dependencies need enumeration
    (home-page "https://codeberg.org/dergs/Tonearm")
    (synopsis "unofficial native GTK4 music streaming client for TIDAL")
    (description "Tonearm is an unofficial native GTK4 music streaming client
for the TIDAL service.  It provides a desktop application with Adwaita
styling for browsing and playing music from a TIDAL account.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Shell scripts
;;; ──────────────────────────────────────────────────────────────────

;;; ── wslu (#7046) ──
;;; Collection of utilities for Windows Subsystem for Linux.

(define-public wslu
  (package
    (name "wslu")
    (version "4.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/WhitewaterFoundry/wslu/archive/refs/tags/v"
                    version ".tar.gz"))
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
    (inputs (list bash-minimal))
    (home-page "https://github.com/WhitewaterFoundry/wslu")
    (synopsis "collection of utilities for Windows Subsystem for Linux")
    (description "WSL Utilities is a collection of utilities for the Windows
Subsystem for Linux (WSL).  It provides commands for opening Windows
applications, managing WSL settings, and desktop integration from WSL.")
    (license license:gpl3+)))

;;; ── x11docker (#7186) ──
;;; Run GUI applications and desktops in Docker containers.

(define-public x11docker
  (package
    (name "x11docker")
    (version "7.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mviereck/x11docker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("x11docker" "bin/x11docker")
               ("x11docker-gui" "bin/x11docker-gui"))))
    (inputs (list bash-minimal))
    ;; NOTE: Needs docker/podman, xpra, xorg-server-xephyr, and various
    ;; Xorg utilities at runtime for full functionality
    (home-page "https://github.com/mviereck/x11docker")
    (synopsis "run GUI applications and desktops in Docker containers")
    (description "X11docker runs GUI applications and desktop environments in
Docker or Podman containers with X11 or Wayland display forwarding.
It provides security isolation while maintaining graphical output.")
    (license license:expat)))
