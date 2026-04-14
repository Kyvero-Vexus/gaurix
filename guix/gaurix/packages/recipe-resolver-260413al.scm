;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413al
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 6 recipes created (gnu, cargo, cmake, pyproject)
;;;   - 24 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (6):
;;;   mod-maxminddb, lianli-linux, moc-pulse, hyprshade,
;;;   llvm-cbe, zlib-ng
;;;
;;; Re-blocked (24):
;;;   dotnet-sdk-preview-bin (#10131) — PROPRIETARY_BINARY
;;;   caddy-cloudflare-l4 (#12711) — META_PACKAGE_XCADDY
;;;   reflector-pacman-hook-git (#12729) — ARCH_SPECIFIC
;;;   magewell-pro-capture-dkms (#12746) — PROPRIETARY_DKMS
;;;   paru-static (#3615) — ARCH_SPECIFIC
;;;   aurto (#3617) — ARCH_SPECIFIC
;;;   linux-xanmod-lts-linux-bin-x64v3 (#3624) — KERNEL_INCOMPATIBLE
;;;   linux-xanmod-linux-bin-x64v3 (#3631) — KERNEL_INCOMPATIBLE
;;;   linux-xanmod-linux-headers-bin-x64v3 (#3632) — KERNEL_INCOMPATIBLE
;;;   ladybird-git (#3633) — COMPLEX_DEPS
;;;   pamac-all (#3636) — ARCH_SPECIFIC
;;;   lazarus-gtk2 (#3644) — MISSING_GUIX_DEPS
;;;   lyrionmusicserver (#3645) — PERL_VERSION_PINNING
;;;   mozillavpn-git (#3962) — BUILD_SYSTEM_TOO_COMPLEX
;;;   vrms-arch (#3994) — ARCH_SPECIFIC
;;;   bilibili (#3997) — ELECTRON_APP
;;;   python-anchor-kr-git (#3246) — NO_LICENSE_ABANDONED
;;;   conky-colors-git (#3249) — DUPLICATE_PACKAGED
;;;   dropdeck-git (#3260) — QUICKSHELL_NOT_IN_GUIX
;;;   qtarcan-git (#3269) — ARCAN_NOT_IN_GUIX
;;;   river-bedload-git (#3209) — ZIG_NOT_IN_GUIX
;;;   fluidplug-git (#3352) — BUILD_PURITY_VIOLATION
;;;   radicle-explorer (#3370) — NPM_ECOSYSTEM
;;;   rofi-polkit-agent-git (#3237) — MISSING_DEP_CHAIN
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413al)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  ;; NOTE: (gnu packages sound) does not exist; alsa-lib is in (gnu packages linux)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:export (mod-maxminddb
            lianli-linux
            moc-pulse
            hyprshade
            llvm-cbe
            zlib-ng))

;;; ──────────────────────────────────────────────────────────────────
;;; GNU builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── mod-maxminddb (#12757) ──
;;; Apache HTTPD module for MaxMind GeoIP2/GeoLite2 database lookups.
;;; Autotools C project from MaxMind.  Dependencies httpd and
;;; libmaxminddb are both available in Guix.

(define-public mod-maxminddb
  (package
    (name "mod-maxminddb")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maxmind/mod_maxminddb")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list httpd libmaxminddb))
    (home-page "https://github.com/maxmind/mod_maxminddb")
    (synopsis "Apache module for MaxMind GeoIP2 database lookups")
    (description "mod_maxminddb is an Apache HTTP Server module that allows
IP address lookups against MaxMind DB files, including GeoIP2 and GeoLite2
databases.  It can set environment variables or HTTP headers based on the
geographic data associated with client IP addresses.")
    (license license:asl2.0)))

;;; ── moc-pulse (#12781) ──
;;; MOC (Music on Console) — ncurses audio player.
;;; Standard autotools C build.  This variant enables PulseAudio output
;;; support.  Upstream: https://moc.daper.net/

(define-public moc-pulse
  (package
    (name "moc-pulse")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.daper.net/pub/soft/moc/stable/moc-"
                                  version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list "--with-pulse"
                   "--without-oss"
                   "--with-alsa"
                   "--with-curl"
                   "--with-ncurses")))
    (native-inputs (list pkg-config))
    (inputs (list ncurses alsa-lib pulseaudio libmad libid3tag curl
                  libtool ffmpeg))
    (home-page "https://moc.daper.net/")
    (synopsis "ncurses console audio player with PulseAudio support")
    (description "MOC (Music on Console) is an ncurses-based console audio
player with a server-client architecture.  This build includes PulseAudio
output support in addition to ALSA.  It supports multiple audio formats
including MP3, Ogg Vorbis, FLAC, and more through decoder plugins.")
    (license license:gpl2+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Cargo builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── lianli-linux (#12752) ──
;;; Open-source replacement for L-Connect 3 — fan control, RGB, and
;;; LCD streaming for Lian Li hardware.  Rust workspace with daemon
;;; and GUI crates.  Communicates via USB HID (hidapi + eudev).

(define-public lianli-linux
  (package
    (name "lianli-linux")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sgtaziz/lian-li-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list hidapi eudev))
    (home-page "https://github.com/sgtaziz/lian-li-linux")
    (synopsis "linux fan control and RGB management for Lian Li hardware")
    (description "Lian Li Linux is an open-source replacement for L-Connect 3,
providing fan speed control, RGB lighting management, and LCD screen streaming
for Lian Li computer case fans and devices.  It communicates with hardware via
USB HID interfaces.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── llvm-cbe (#3258) ──
;;; Resurrected LLVM "C Backend" — translates LLVM IR to C source.
;;; Standard CMake build, links against LLVM 20.  LLVM 20 is now
;;; available in Guix (was blocked at LLVM 18 in prior passes).

(define-public llvm-cbe
  (package
    (name "llvm-cbe")
    (version "20.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JuliaHubOSS/llvm-cbe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLLVM_DIR="
                                  #$(this-package-input "llvm")
                                  "/lib/cmake/llvm"))))
    (inputs (list llvm-20))
    (home-page "https://github.com/JuliaHubOSS/llvm-cbe")
    (synopsis "resurrected LLVM C backend for converting LLVM IR to C")
    (description "LLVM CBE (C Backend) is a resurrected version of the LLVM C
backend that translates LLVM intermediate representation (IR) into C source
code.  It can be used as an LLVM target to compile programs from any
LLVM-supported language to portable C code.")
    (license license:asl2.0)))

;;; ── zlib-ng (#3363, resolves mingw-w64-zlib-ng) ──
;;; Drop-in zlib replacement with SIMD optimizations.
;;; AUR entry is mingw-w64-zlib-ng (cross-compile variant); this
;;; packages native zlib-ng for Guix.

(define-public zlib-ng
  (package
    (name "zlib-ng")
    (version "2.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zlib-ng/zlib-ng")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DZLIB_COMPAT=ON"
                   "-DWITH_GTEST=OFF"
                   "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/zlib-ng/zlib-ng")
    (synopsis "zlib data compression library with SIMD optimizations")
    (description "zlib-ng is a zlib data compression library for use on
next-generation systems.  It is a fork of zlib with performance optimizations
including SIMD instructions for x86-64, ARM, and other architectures.  When
built in compatibility mode, it serves as a drop-in replacement for zlib with
significantly improved compression and decompression throughput.")
    (license license:zlib)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── hyprshade (#7372) ──
;;; Hyprland shader configuration tool.  Standard Python pyproject
;;; build, available on PyPI.  Previously marked EXHAUSTED due to
;;; MISSING_GUIX_DEPS (Hyprland not in Guix), but this is a runtime
;;; dependency — the Python package itself builds without Hyprland.

(define-public hyprshade
  (package
    (name "hyprshade")
    (version "3.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/loqusion/hyprshade")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python))
    (home-page "https://github.com/loqusion/hyprshade")
    (synopsis "hyprland shader configuration tool")
    (description "Hyprshade is a shader configuration tool for the Hyprland
Wayland compositor.  It manages screen shaders such as blue-light filters
and can automatically switch shaders based on time of day, serving as a
replacement for tools like Redshift or Gammastep on Hyprland.")
    (license license:expat)))
