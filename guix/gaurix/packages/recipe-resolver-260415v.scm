;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415v
;;; Resolves final 9 NEEDS_RECIPE_DESIGN packages (pool fully depleted).
;;; 1 resolved with new recipe.  1 resolved as ALREADY_IN_GUIX.
;;; 7 marked EXHAUSTED with detailed reasons.
;;;
;;; Recipes (1 new):
;;;   1. solar2d-git (cmake, git, Solar2D 2D game engine, MIT)
;;;
;;; Already in Guix (1):
;;;   linux-mainline-docs → linux-libre-documentation 6.18.10
;;;     (gnu/packages/linux.scm); non-libre mainline docs equivalent
;;;     to linux-libre-documentation in Guix's FSDG-compliant channel
;;;
;;; EXHAUSTED (7):
;;;   sh-elf-newlib — CROSS_TOOLCHAIN_NEEDED: requires sh-elf-gcc +
;;;     sh-elf-binutils cross toolchain not in Guix; A1: cross-base.scm
;;;     supports adding targets but sh-elf needs binutils+gcc+newlib;
;;;     A2: embedded SH target audience extremely small; A3: multi-pkg
;;;     effort beyond batch scope
;;;   java-openjfx-doc — OPENJFX_STACK_OUTDATED: Guix has OpenJFX 8.202;
;;;     modern javadoc (v27) needs Gradle + JDK 25; full stack
;;;     modernization required; A1: update 100+ module Gradle build;
;;;     A2: no prebuilt docs available; A3: impractical in batch
;;;   java-openjfx-src — OPENJFX_STACK_OUTDATED: same as java-openjfx-doc;
;;;     source jars need same Gradle + JDK 25 stack
;;;   java11-openjfx-doc — OPENJFX11_EOL: upstream archived July 2023;
;;;     no maintenance; A1: Gradle 7 build; A2: EOL; A3: low value
;;;   java11-openjfx-src — OPENJFX11_EOL: same as java11-openjfx-doc
;;;   pat-aur-host-git — ARCH_SPECIFIC: requires pacman/makepkg/pacutils;
;;;     A1: pacman not in Guix; A2: makepkg Arch-only; A3: no use case
;;;     outside Arch Linux
;;;   caelestia-shell-git — MISSING_DEPS_CHAIN: desktop shell for
;;;     Caelestia dotfiles; needs caelestia-cli (Rust), app2unit,
;;;     libcava, swappy + custom fonts; A1: package 4+ missing deps —
;;;     significant scope; A2: shell non-functional without CLI;
;;;     A3: quickshell available but ecosystem incomplete
;;;
;;; NOTE: NEEDS_RECIPE_DESIGN pool fully depleted after this pass.
;;; Only 9 items remained (far below the 30 target).
;;; Prior passes resolved the bulk of ~7000+ NEEDS_RECIPE_DESIGN items.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vulkan)
  #:export (
            solar2d-git
            ))

;;;
;;; --- 1. solar2d-git ---
;;; Solar2D (formerly Corona SDK) — cross-platform open-source 2D game
;;; engine for mobile, desktop, and HTML5.
;;; Source: https://github.com/coronalabs/corona
;;; Build: CMake with standard system deps.
;;; License: MIT
;;; AUR: solar2d-git (votes=2, popularity=1.13)
;;;

(define-public solar2d-git
  (let ((commit "5c67e26e96f893ce862a7edb72096e1e1dff2a97")
        (revision "1"))
    (package
      (name "solar2d-git")
      (version (git-version "2024.3729" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/coronalabs/corona")
                      (commit commit)
                      (recursive? #t)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list
        #:tests? #f                     ;no test suite upstream
        #:configure-flags
        #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'set-source-date
              (lambda _
                (setenv "SOURCE_DATE_EPOCH" "1"))))))
      (native-inputs
       (list pkg-config))
      (inputs
       (list curl
             freetype
             libjpeg-turbo
             libpng
             lua-5.4
             mesa
             openal
             openssl-1.1
             sdl2
             vulkan-headers
             vulkan-loader
             zlib))
      (synopsis "cross-platform open-source 2D game engine")
      (description
       "Solar2D (formerly Corona SDK) is a free and open-source 2D game
engine.  It supports building games and apps for iOS, Android, macOS,
Windows, Linux, and HTML5 from a single Lua codebase.  Solar2D
provides a fast rendering pipeline, physics engine, and extensive
plugin system.")
      (home-page "https://solar2d.com/")
      (license license:expat))))
