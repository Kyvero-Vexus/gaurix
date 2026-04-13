;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from TODO queue:
;;;   - 6 recipes created
;;;   - 24 blocked with specific reason codes
;;;
;;; Recipes (6):
;;;   - sshm-bin → sshm (Go, MIT, source build)
;;;   - juliaup (Rust/Cargo, MIT)
;;;   - ffmpeg-libfdk_aac → ffmpeg-libfdk-aac (inherit ffmpeg + FDK-AAC)
;;;   - librepods-git → librepods (CMake + Qt6, GPL-3.0)
;;;   - openscq30-cli (Rust/Cargo, GPL-3.0+)
;;;   - shaka-packager-git → shaka-packager (CMake, BSD-3-Clause)
;;;
;;; Blocked (24):
;;;   - illogical-updots (NEEDS_RECIPE_DESIGN — no license, needs unpackaged quickshell)
;;;   - paper-muncher-git (NEEDS_RECIPE_DESIGN — non-standard build system cutekit, needs SDL3)
;;;   - rocm-clang-ocl (NEEDS_RECIPE_DESIGN — deprecated, needs ROCm stack)
;;;   - peerflix (NEEDS_RECIPE_DESIGN — unmaintained, deep npm dep tree)
;;;   - ibus-mozc-ut-full (NEEDS_RECIPE_DESIGN — Bazel not in Guix)
;;;   - fcitx5-mozc-ut-full (NEEDS_RECIPE_DESIGN — Bazel not in Guix)
;;;   - emacs-mozc-ut-full (NEEDS_RECIPE_DESIGN — Bazel not in Guix)
;;;   - mozillavpn (NEEDS_RECIPE_DESIGN — triple-compiler build, Qt6 modules)
;;;   - lceda-pro (NEEDS_RECIPE_DESIGN — proprietary, no source)
;;;   - vapoursynth-plugin-vsakarin-git (NEEDS_RECIPE_DESIGN — VapourSynth not in Guix)
;;;   - freeoffice (NEEDS_RECIPE_DESIGN — proprietary, no source)
;;;   - naps2-bin (NEEDS_RECIPE_DESIGN — .NET build toolchain not in Guix)
;;;   - falcond-profiles (NEEDS_RECIPE_DESIGN — needs falcond, Zig not in Guix)
;;;   - mkinitcpio-sd-zfs (NEEDS_RECIPE_DESIGN — Arch-specific, incompatible with Guix)
;;;   - neohtop-bin (NEEDS_RECIPE_DESIGN — Tauri app, dual Rust+npm build)
;;;   - openscq30-gui (NEEDS_RECIPE_DESIGN — needs COSMIC desktop framework)
;;;   - i915-sriov-dkms (NEEDS_RECIPE_DESIGN — out-of-tree kernel module, DKMS)
;;;   - ytsubconverter-bin (NEEDS_RECIPE_DESIGN — .NET 8.0 not in Guix)
;;;   - lotion (NEEDS_RECIPE_DESIGN — Electron/npm, proprietary service wrapper)
;;;   - ik-llama.cpp-cuda (NEEDS_RECIPE_DESIGN — CUDA proprietary)
;;;   - qt6-wasm (NEEDS_RECIPE_DESIGN — needs Emscripten SDK)
;;;   - electron32 (NEEDS_RECIPE_DESIGN — Chromium infeasible)
;;;   - cnrdrvcups-lb-bin (NEEDS_RECIPE_DESIGN — proprietary binary blobs)
;;;   - mssql-tools (NEEDS_RECIPE_DESIGN — proprietary Microsoft EULA)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:export (
            sshm
            juliaup
            ffmpeg-libfdk-aac
            librepods
            openscq30-cli
            shaka-packager
            ))

;;; ── sshm ──────────────────────────────────────────────────────
;;; Interactive TUI SSH connection manager
;;; AUR: sshm-bin  →  Guix: sshm (built from source)
;;; Upstream: https://github.com/Gu1llaum-3/sshm (Go, MIT)
;;;
(define-public sshm
  (package
    (name "sshm")
    (version "1.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Gu1llaum-3/sshm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Gu1llaum-3/sshm"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/Gu1llaum-3/sshm")
    (synopsis "interactive TUI SSH connection manager")
    (description
     "sshm is a terminal user interface application for managing SSH
connections.  It provides features such as port forwarding, tagging,
history tracking, and SSH config file management.  Uses Bubble Tea for
the interactive interface.")
    (license license:expat)))

;;; ── juliaup ───────────────────────────────────────────────────
;;; Cross-platform Julia version manager and installer
;;; AUR: juliaup  →  Guix: juliaup (Cargo, MIT)
;;; Upstream: https://github.com/JuliaLang/juliaup
;;; Note: Version manager that downloads Julia at runtime;
;;;   philosophically at odds with Guix's package management,
;;;   but the tool itself is open-source and buildable.
;;;
(define-public juliaup
  (package
    (name "juliaup")
    (version "1.19.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JuliaLang/juliaup")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/JuliaLang/juliaup")
    (synopsis "cross-platform Julia version manager")
    (description
     "Juliaup is a cross-platform installer and version manager for the Julia
programming language.  It allows managing multiple Julia versions, switching
between release channels, and keeping installations up to date.  Note that
Juliaup downloads Julia binaries at runtime; on Guix systems, prefer using
@code{guix install julia} for declarative version management.")
    (license license:expat)))

;;; ── ffmpeg-libfdk-aac ─────────────────────────────────────────
;;; FFmpeg variant with Fraunhofer FDK AAC encoder
;;; AUR: ffmpeg-libfdk_aac  →  Guix: ffmpeg-libfdk-aac
;;; Inherits from Guix's ffmpeg, adds --enable-libfdk-aac --enable-nonfree
;;; Note: Resulting binary is not freely redistributable under GPL.
;;;
(define-public ffmpeg-libfdk-aac
  (package
    (inherit ffmpeg)
    (name "ffmpeg-libfdk-aac")
    (arguments
     (substitute-keyword-arguments (package-arguments ffmpeg)
       ((#:configure-flags flags)
        #~(append #$flags
                  (list "--enable-libfdk-aac"
                        "--enable-nonfree")))))
    (inputs
     (modify-inputs (package-inputs ffmpeg)
       (prepend libfdk)))
    (synopsis "audio/video converter with Fraunhofer FDK AAC encoder")
    (description
     "This variant of FFmpeg includes the Fraunhofer FDK AAC encoder,
providing high-quality AAC audio encoding.  The FDK AAC library is
considered one of the highest-quality AAC encoders available.  Note that
the resulting binary is not freely redistributable due to the nonfree
FDK AAC license combined with FFmpeg's GPL.")))

;;; ── librepods ─────────────────────────────────────────────────
;;; Apple AirPods integration for Linux desktops
;;; AUR: librepods-git  →  Guix: librepods (CMake + Qt6, GPL-3.0)
;;; Upstream: https://github.com/kavishdevar/librepods
;;;
(define-public librepods
  (package
    (name "librepods")
    (version "0.2.0-alpha.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kavishdevar/librepods")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list qtbase qtconnectivity qtmultimedia
                  pulseaudio openssl))
    (home-page "https://github.com/kavishdevar/librepods")
    (synopsis "Apple AirPods integration for Linux desktops")
    (description
     "LibrePods provides Apple AirPods Pro 2 features on Linux, including
noise control, ear detection, battery status, and hearing aid features.
It communicates with AirPods over Bluetooth Low Energy using a Qt6-based
desktop application.")
    (license license:gpl3+)))

;;; ── openscq30-cli ─────────────────────────────────────────────
;;; Command-line tool for controlling Soundcore headphones
;;; AUR: openscq30-cli  →  Guix: openscq30-cli (Cargo, GPL-3.0+)
;;; Upstream: https://github.com/Oppzippy/OpenSCQ30
;;;
(define-public openscq30-cli
  (package
    (name "openscq30-cli")
    (version "2.6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Oppzippy/OpenSCQ30")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:cargo-build-flags #~'("--release" "-p" "openscq30_cli")))
    (native-inputs (list pkg-config))
    (inputs (list dbus sqlite))
    (home-page "https://github.com/Oppzippy/OpenSCQ30")
    (synopsis "command-line tool for controlling Soundcore headphones")
    (description
     "OpenSCQ30 CLI provides a command-line interface for controlling
Soundcore headphones and earbuds settings, including equalizer profiles,
active noise cancellation modes, and ambient sound control over
Bluetooth.")
    (license license:gpl3+)))

;;; ── shaka-packager ────────────────────────────────────────────
;;; Media packaging SDK for DASH and HLS streaming
;;; AUR: shaka-packager-git  →  Guix: shaka-packager (CMake, BSD-3-Clause)
;;; Upstream: https://github.com/shaka-project/shaka-packager
;;;
(define-public shaka-packager
  (package
    (name "shaka-packager")
    (version "3.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/shaka-project/shaka-packager")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (native-inputs (list pkg-config))
    (inputs (list curl protobuf zlib))
    (home-page "https://github.com/shaka-project/shaka-packager")
    (synopsis "media packaging SDK for DASH and HLS streaming")
    (description
     "Shaka Packager is a media packaging and development framework for VOD
and live DASH and HLS applications, supporting Common Encryption for
Widevine and other DRM systems.  It can prepare media content for online
streaming with adaptive bitrate support.")
    (license license:bsd-3)))
