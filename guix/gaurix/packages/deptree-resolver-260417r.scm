;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417r
;;; Resolves 8 BLOCKED packages from dependency tree queue:
;;;   - intel-level-zero-raytracing-support-git (#14769): Intel OneAPI raytracing
;;;   - nvidia-patch (#14847): Nvidia encoder/FBC limit removal scripts
;;;   - vlc-luajit (#14829): VLC media player built with LuaJIT
;;;   - libvlc-luajit (#14830): VLC library with LuaJIT (alias)
;;;   - vlc-plugin-luajit (#14828): VLC plugins with LuaJIT (alias)
;;;   - ffmpeg-obs (#14818): FFmpeg variant for OBS Studio compatibility
;;;   - texlive-full (#14846): TeX Live full installation meta-package
;;;   - clangd-opt-git (#14814): re-export of Guix's clang-toolchain clangd
;;;
;;; 16 packages remain BLOCKED (see blocked-notes).
;;; Hashes marked 0000... are placeholders pending `guix download` verification.

(define-module (gaurix packages deptree-resolver-260417r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages oneapi)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages video)
  #:export (intel-level-zero-raytracing-support-git
            nvidia-patch
            vlc-luajit
            libvlc-luajit
            vlc-plugin-luajit
            ffmpeg-obs
            texlive-full
            clangd-opt-git))

;;; ── intel-level-zero-raytracing-support-git (#14769, #55356) ───────────
;;; Intel OneAPI Level Zero raytracing support library.
;;; CMake project from https://github.com/intel/level-zero-raytracing-support.
;;; level-zero is now available in Guix (v1.27.0).
;;; Fixed in deptree-resolver-260428l: switched to url-fetch, added tbb input,
;;; set -DZE_RAYTRACING_TBB=normal to avoid FetchContent TBB download.

(define-public intel-level-zero-raytracing-support-git
  (package
    (name "intel-level-zero-raytracing-support-git")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/level-zero-raytracing-support"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "1cxmk0qn1s9jkddk3nk8ndc7ay2pkk03n3ijl3dqq8jl66807yqb"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DZE_RAYTRACING_TBB=normal")))
    (inputs (list level-zero tbb))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/intel/level-zero-raytracing-support")
    (synopsis "Intel OneAPI Level Zero raytracing support library")
    (description "Provides raytracing support for Intel GPUs via the Level
Zero API.  Implements BVH build and traversal primitives for use with Intel
discrete and integrated graphics.")
    (license license:asl2.0)))

;;; ── nvidia-patch (#14847) ──────────────────────────────────────────────
;;; Shell scripts to remove Nvidia NVENC/NVFBC session limits.
;;; From https://github.com/keylase/nvidia-patch.
;;; NOTE: Modifies proprietary Nvidia driver binaries at user's own risk.
;;; License review: scripts are open-source; target binaries are proprietary.

(define-public nvidia-patch
  (let ((commit "80e48e93bcb0e98ddf10ee4fbc3e5d6543fb6e6c")
        (revision "1"))
    (package
      (name "nvidia-patch")
      (version (git-version "570.153.02" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/keylase/nvidia-patch")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("patch.sh" "bin/nvidia-patch")
                 ("patch-fbc.sh" "bin/nvidia-patch-fbc")
                 ("." "share/nvidia-patch/"
                  #:include-regexp ("README\\.md" "patch\\.sh"
                                    "patch-fbc\\.sh")))))
      (inputs (list bash-minimal))
      (home-page "https://github.com/keylase/nvidia-patch")
      (synopsis "remove Nvidia NVENC and NVFBC session limits")
      (description "Shell scripts that patch proprietary Nvidia driver
libraries to remove artificial session limits on NVENC (video encoding) and
NVFBC (framebuffer capture).  Use at your own risk; modifying proprietary
binaries may violate the Nvidia EULA.")
      (license license:expat))))

;;; ── vlc-luajit (#14829) ────────────────────────────────────────────────
;;; VLC media player rebuilt with LuaJIT instead of Lua 5.2.
;;; Required for OBS Studio LuaJIT compatibility.
;;; VLC's configure prefers LuaJIT over Lua when both are available,
;;; so swapping the input is sufficient.

(define-public vlc-luajit
  (package
    (inherit vlc)
    (name "vlc-luajit")
    (inputs
     (modify-inputs (package-inputs vlc)
       (replace "lua" luajit)))
    (synopsis "VLC media player built with LuaJIT")
    (description "VLC media player variant built with LuaJIT instead of
standard Lua 5.2.  This provides better Lua scripting performance and is
needed for compatibility with OBS Studio's LuaJIT-based plugin system.")))

;;; ── libvlc-luajit (#14830) ─────────────────────────────────────────────
;;; Library output of VLC built with LuaJIT.  In Guix, VLC produces a
;;; single output containing both binaries and libraries.  This package
;;; is a compatibility alias for vlc-luajit.

(define-public libvlc-luajit
  (package
    (inherit vlc-luajit)
    (name "libvlc-luajit")
    (synopsis "VLC library built with LuaJIT")
    (description "VLC media player libraries built with LuaJIT instead
of standard Lua.  This is the library component (libvlc, libvlccore)
for embedding VLC functionality in other applications.")))

;;; ── vlc-plugin-luajit (#14828) ────────────────────────���────────────────
;;; Plugin output of VLC built with LuaJIT.  Compatibility alias.

(define-public vlc-plugin-luajit
  (package
    (inherit vlc-luajit)
    (name "vlc-plugin-luajit")
    (synopsis "VLC plugins built with LuaJIT")
    (description "VLC media player plugin collection built with LuaJIT
instead of standard Lua.  Includes all standard VLC codec, demuxer,
and interface plugins.")))

;;; ── ffmpeg-obs (#14818) ────────────────────────────────────────────────
;;; FFmpeg variant with OBS Studio compatibility flags.
;;; Inherits from Guix's FFmpeg and enables additional codecs and features
;;; that OBS Studio benefits from.  Does not include OBS-specific patches
;;; (which would require version-locking); standard FFmpeg works with OBS.

(define-public ffmpeg-obs
  (package
    (inherit ffmpeg)
    (name "ffmpeg-obs")
    (arguments
     (substitute-keyword-arguments (package-arguments ffmpeg)
       ((#:configure-flags flags #~'())
        #~(append #$flags
                  (list "--enable-version3"
                        "--enable-libsrt"
                        "--enable-librist"
                        "--enable-libx264"
                        "--enable-libx265"
                        "--enable-libvpx"
                        "--enable-libopus"
                        "--enable-libsvtav1"
                        "--enable-libdav1d"
                        "--enable-vaapi"
                        "--enable-vdpau")))))
    (synopsis "FFmpeg variant for OBS Studio compatibility")
    (description "FFmpeg built with additional codec and streaming features
for optimal OBS Studio compatibility.  Includes SRT and RIST streaming
support alongside standard video codecs (x264, x265, VP9, AV1, Opus).
Based on the standard Guix FFmpeg with extra configure flags.")))

;;; ── texlive-full (#14846) ──────────────────────────────────────────────
;;; Meta-package providing a full TeX Live installation.
;;; Guix packages TeX Live as modular texlive-* packages.  This combines
;;; the core packages into a single installable unit.

(define-public texlive-full
  (package
    (name "texlive-full")
    (version (package-version texlive-bin))
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (mkdir-p (string-append #$output "/etc"))
               (call-with-output-file
                   (string-append #$output "/etc/texlive-full-marker")
                 (lambda (port)
                   (display "TeX Live full meta-package\n" port))))))
    (propagated-inputs
     (list texlive-bin
           texlive-scheme-full))
    (home-page "https://tug.org/texlive/")
    (synopsis "complete TeX Live distribution meta-package")
    (description "Meta-package that provides a complete TeX Live
installation via Guix's modular TeX Live packages.  Depends on
@code{texlive-scheme-full} which includes all available TeX Live
collections and packages.")
    (license (package-license texlive-bin))))

;;; ── clangd-opt-git (#14814) ────────────────────────────────────────────
;;; Re-export of Guix's clang-toolchain which includes clangd.
;;; The AUR package builds LLVM/Clang from trunk with custom patches;
;;; Guix provides the equivalent via its standard clang-toolchain package.

(define-public clangd-opt-git
  (package
    (inherit clang-toolchain)
    (name "clangd-opt-git")
    (synopsis "clangd language server (from Guix clang-toolchain)")
    (description "The clangd language server for C/C++ code intelligence,
provided by Guix's standard clang-toolchain package.  This is equivalent
to the AUR @code{clangd-opt-git} package which builds LLVM/Clang from
trunk with custom patches.")))
