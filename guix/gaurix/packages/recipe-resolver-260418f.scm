;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  c-lolcat (gnu-build-system, v1.4, WTFPL)
;;;    2.  celt (gnu-build-system, v0.11.3, BSD-2-Clause)
;;;    3.  uhubctl (gnu-build-system, v2.6.0, GPL-2.0)
;;;    4.  ksh93-git (gnu-build-system, v1.0.10, EPL-1.0)
;;;    5.  libretro-prboom-git (gnu-build-system, v0.0.1, GPL-2.0)
;;;    6.  libretro-neocd-git (gnu-build-system, v0.0.1, LGPL-3.0)
;;;    7.  libretro-fuse-git (gnu-build-system, v0.0.1, GPL-3.0)
;;;    8.  funchook (cmake-build-system, v1.1.3, GPL-2.0)
;;;    9.  vulkanscenegraph (cmake-build-system, v1.1.10, MIT)
;;;   10.  qdia (cmake-build-system, v0.60, AGPL-3.0)
;;;   11.  dolphin-memory-engine (cmake-build-system, v2024.01.24, MIT)
;;;   12.  eternity-engine-git (cmake-build-system, v4.05.04, GPL-3.0)
;;;   13.  inter-doom (cmake-build-system, v8.3, GPL-2.0)
;;;   14.  inter-heretic (cmake-build-system, v8.3, GPL-2.0)
;;;   15.  inter-hexen (cmake-build-system, v8.3, GPL-2.0)
;;;   16.  blobdrop-git (cmake-build-system, v2.1, GPL-3.0)
;;;   17.  obs-noise (cmake-build-system, v1.0.0, GPL-2.0)
;;;   18.  wizstr (cmake-build-system, v2026.1.3, MulanPSL-2.0)
;;;   19.  clad (cmake-build-system, v2.2, LGPL)
;;;   20.  swaylock-plugin (meson-build-system, v1.8.6, MIT)
;;;   21.  linux-router (copy-build-system, v0.7.6, LGPL-2.1)
;;;   22.  faint (copy-build-system, v1.2.0, GPL)
;;;   23.  kraiser (copy-build-system, v1.3, GPL-3.0)
;;;   24.  pass-ln (copy-build-system, v2.1.1, MIT)
;;;   25.  statecraft (copy-build-system, v1.0.2, GPL-3.0)
;;;   26.  git-hash-select (copy-build-system, v1.0.0, MIT)
;;;   27.  passless-boot (copy-build-system, v0.5.2, GPL-3.0)
;;;   28.  latynka-kbd (copy-build-system, v1.0.1, Apache-2.0)
;;;   29.  itch-setup-bin (copy-build-system, v1.27.0, MIT)
;;;   30.  papirus-folders-git (copy-build-system, v1.7.0, LGPL-3.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            c-lolcat
            celt
            uhubctl
            ksh93-git
            libretro-prboom-git
            libretro-neocd-git
            libretro-fuse-git
            funchook
            vulkanscenegraph
            qdia
            dolphin-memory-engine
            eternity-engine-git
            inter-doom
            inter-heretic
            inter-hexen
            blobdrop-git
            obs-noise
            wizstr
            clad
            swaylock-plugin
            linux-router
            faint
            kraiser
            pass-ln
            statecraft
            git-hash-select
            passless-boot
            latynka-kbd
            itch-setup-bin
            papirus-folders-git
            ))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES (source builds)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. c-lolcat --- high-performance implementation of lolcat
;;; -------------------------------------------------------------------
(define-public c-lolcat
  (package
    (name "c-lolcat")
    (version "1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jaseg/lolcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                           (string-append "DESTDIR=" #$output)
                           "PREFIX=")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/jaseg/lolcat")
    (synopsis "high-performance implementation of lolcat in C")
    (description "C-lolcat is a high-performance C implementation of the
popular lolcat command, which concatenates files and prints them to
standard output with rainbow coloring.  It is significantly faster than
the Ruby original.")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 2. celt --- low-latency audio communication codec
;;; -------------------------------------------------------------------
(define-public celt
  (package
    (name "celt")
    (version "0.11.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.xiph.org/releases/celt/celt-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libogg))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.xiph.org/xiph/celt/")
    (synopsis "low-latency audio communication codec")
    (description "CELT is an experimental audio codec for use in low-delay
speech and audio communication.  It is designed for low to high bitrates
with algorithmically zero latency.  CELT stands for Constrained Energy
Lapped Transform.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 3. uhubctl --- USB hub per-port power switching control
;;; -------------------------------------------------------------------
(define-public uhubctl
  (package
    (name "uhubctl")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mvp/uhubctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                           (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list libusb))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/mvp/uhubctl")
    (synopsis "control USB per-port power switching on smart USB hubs")
    (description "uhubctl is a utility to control USB per-port power
switching on compatible USB hubs.  It allows you to turn individual USB
ports on and off, which is useful for power-cycling USB devices, saving
energy, and managing USB peripherals programmatically.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 4. ksh93-git --- KornShell 93u+m
;;; -------------------------------------------------------------------
(define-public ksh93-git
  (package
    (name "ksh93-git")
    (version "1.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ksh93/ksh")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (setenv "CC" #$(cc-for-target))
                (invoke "bin/package" "make"
                        (string-append "INSTALLROOT=" out))))))))
    (home-page "https://github.com/ksh93/ksh/")
    (synopsis "KornShell 93u+m, a powerful POSIX-compatible shell")
    (description "KornShell 93u+m is a fork of the original Korn shell
(ksh93) that continues active development.  It is a powerful,
POSIX-compatible shell with advanced scripting capabilities, associative
arrays, floating-point arithmetic, and name reference variables.")
    (license license:epl1.0)))

;;; -------------------------------------------------------------------
;;; 5. libretro-prboom-git --- PrBoom (Doom) libretro core
;;; -------------------------------------------------------------------
(define-public libretro-prboom-git
  (package
    (name "libretro-prboom-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libretro/libretro-prboom")
                    (commit "2ab3b4afa4e2e1bb65d89ec0abfe5b1803de3a3c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib/libretro")))
                (mkdir-p lib)
                (install-file "prboom_libretro.so" lib)))))))
    (home-page "https://github.com/libretro/libretro-prboom")
    (synopsis "PrBoom (Doom/Doom II/Final Doom) libretro core")
    (description "A libretro port of PrBoom, a Doom source port that
plays Doom, Doom II, and Final Doom game data files.  This core enables
playing classic Doom games through any libretro-compatible frontend
such as RetroArch.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 6. libretro-neocd-git --- SNK Neo Geo CD libretro core
;;; -------------------------------------------------------------------
(define-public libretro-neocd-git
  (package
    (name "libretro-neocd-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libretro/neocd_libretro")
                    (commit "5eca2c862a11e0f56b00c1dd12d01a9eb7a41bea")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                           (string-append "CXX=" #$(cxx-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib/libretro")))
                (mkdir-p lib)
                (install-file "neocd_libretro.so" lib)))))))
    (inputs (list zlib libvorbis))
    (home-page "https://github.com/libretro/neocd_libretro")
    (synopsis "SNK Neo Geo CD libretro core")
    (description "A libretro core for emulating the SNK Neo Geo CD
console.  It provides accurate emulation of Neo Geo CD games through
any libretro-compatible frontend such as RetroArch.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 7. libretro-fuse-git --- Fuse ZX Spectrum libretro core
;;; -------------------------------------------------------------------
(define-public libretro-fuse-git
  (package
    (name "libretro-fuse-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libretro/fuse-libretro")
                    (commit "cad85b7c2eab0dd2c93a3b0d1e3e5fec7d25e73a")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags #~(list (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib/libretro")))
                (mkdir-p lib)
                (install-file "fuse_libretro.so" lib)))))))
    (inputs (list zlib))
    (home-page "https://github.com/libretro/fuse-libretro")
    (synopsis "Fuse ZX Spectrum emulator libretro core")
    (description "A libretro port of the Fuse (Free Unix Spectrum
Emulator), which emulates the ZX Spectrum home computer.  This core
enables playing ZX Spectrum software through any libretro-compatible
frontend such as RetroArch.")
    (license license:gpl3)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 8. funchook --- hook function calls at runtime
;;; -------------------------------------------------------------------
(define-public funchook
  (package
    (name "funchook")
    (version "1.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kubo/funchook")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kubo/funchook")
    (synopsis "library for hooking function calls by inserting jump instructions")
    (description "Funchook is a library that hooks function calls by
inserting jump instructions at runtime.  It supports x86, x86_64, and
ARM64 architectures and can intercept calls to any function in a
running process for instrumentation, debugging, or modification.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 9. vulkanscenegraph --- Vulkan & C++17 scene graph
;;; -------------------------------------------------------------------
(define-public vulkanscenegraph
  (package
    (name "vulkanscenegraph")
    (version "1.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vsg-dev/VulkanSceneGraph")
                    (commit (string-append "VulkanSceneGraph-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (inputs (list libxcb vulkan-loader))
    (native-inputs (list pkg-config vulkan-headers glslang))
    (home-page "https://github.com/vsg-dev/VulkanSceneGraph")
    (synopsis "Vulkan and C++17 based scene graph library")
    (description "VulkanSceneGraph (VSG) is a high-performance scene
graph library built on Vulkan and modern C++17.  It provides a
cross-platform framework for developing graphics applications with
Vulkan, featuring a clean API, automatic memory management, and
multi-threaded rendering support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. qdia --- simple schematic/diagram editor
;;; -------------------------------------------------------------------
(define-public qdia
  (package
    (name "qdia")
    (version "0.60")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunderme/qdia")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtsvg))
    (native-inputs (list qttools-5))
    (home-page "https://github.com/sunderme/qdia")
    (synopsis "simple schematic and diagram editor")
    (description "QDia is a simple schematic and diagram editor
inspired by xcircuit.  It focuses on producing quick diagrams with
high-quality vector graphics output, supporting components, wires,
and text annotations for electronic circuit and flowchart diagrams.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 11. dolphin-memory-engine --- Dolphin emulator memory searcher
;;; -------------------------------------------------------------------
(define-public dolphin-memory-engine
  (package
    (name "dolphin-memory-engine")
    (version "2024.01.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aldelaro5/dolphin-memory-engine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtsvg))
    (home-page "https://github.com/aldelaro5/dolphin-memory-engine")
    (synopsis "memory value scanner and editor for the Dolphin emulator")
    (description "Dolphin Memory Engine is a memory scanner and editor
designed for use with the Dolphin GameCube/Wii emulator.  It allows
searching, viewing, and modifying memory values in emulated games,
similar to Cheat Engine but specialized for Dolphin.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. eternity-engine-git --- advanced Doom port
;;; -------------------------------------------------------------------
(define-public eternity-engine-git
  (package
    (name "eternity-engine-git")
    (version "4.05.04")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/team-eternity/eternity")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list sdl2 sdl2-mixer sdl2-net zlib))
    (home-page "http://eternity.youfailit.net/")
    (synopsis "advanced Doom source port with vanilla compatibility")
    (description "The Eternity Engine is an advanced Doom source port
that maintains compatibility with vanilla Doom while adding modern
features.  It supports Doom, Doom II, Heretic, and custom WADs with
enhancements like portals, polyobjects, and extended map formats.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. inter-doom --- International Doom source port
;;; -------------------------------------------------------------------
(define-public inter-doom
  (package
    (name "inter-doom")
    (version "8.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JNechaevsky/international-doom")
                    (commit (string-append "doom-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_DOOM=ON"
                   "-DCMAKE_BUILD_HERETIC=OFF"
                   "-DCMAKE_BUILD_HEXEN=OFF")))
    (inputs (list sdl2 sdl2-mixer sdl2-net libsamplerate fluidsynth))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/JNechaevsky/international-doom")
    (synopsis "functional and simple Doom source port")
    (description "International Doom is a small, functional, and simple
Doom source port with numerous quality-of-life improvements, visual
enhancements, and support for multiple languages.  It maintains
compatibility with vanilla Doom while providing a modern experience.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. inter-heretic --- International Heretic source port
;;; -------------------------------------------------------------------
(define-public inter-heretic
  (package
    (inherit inter-doom)
    (name "inter-heretic")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_DOOM=OFF"
                   "-DCMAKE_BUILD_HERETIC=ON"
                   "-DCMAKE_BUILD_HEXEN=OFF")))
    (synopsis "functional and simple Heretic source port")
    (description "International Heretic is a small, functional, and
simple Heretic source port with quality-of-life improvements and
visual enhancements.  It is based on the International Doom project
and provides the same modern features for Heretic gameplay.")))

;;; -------------------------------------------------------------------
;;; 15. inter-hexen --- International Hexen source port
;;; -------------------------------------------------------------------
(define-public inter-hexen
  (package
    (inherit inter-doom)
    (name "inter-hexen")
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_DOOM=OFF"
                   "-DCMAKE_BUILD_HERETIC=OFF"
                   "-DCMAKE_BUILD_HEXEN=ON")))
    (synopsis "functional and simple Hexen source port")
    (description "International Hexen is a small, functional, and
simple Hexen source port with quality-of-life improvements and
visual enhancements.  It is based on the International Doom project
and provides the same modern features for Hexen gameplay.")))

;;; -------------------------------------------------------------------
;;; 16. blobdrop-git --- drag and drop files from terminal
;;; -------------------------------------------------------------------
(define-public blobdrop-git
  (package
    (name "blobdrop-git")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vimpostor/blobdrop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtdeclarative qtsvg xcb-util-wm))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/vimpostor/blobdrop")
    (synopsis "drag and drop files directly from the terminal")
    (description "Blobdrop is a lightweight utility that allows you to
drag and drop files directly from the terminal.  Simply pass file paths
as arguments and a minimal window appears from which you can drag the
files into any application.  Works with both X11 and Wayland.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. obs-noise --- advanced masking plugin for OBS
;;; -------------------------------------------------------------------
(define-public obs-noise
  (package
    (name "obs-noise")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FiniteSingularity/obs-noise")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list obs))
    (home-page "https://github.com/FiniteSingularity/obs-noise")
    (synopsis "advanced noise masking plugin for OBS Studio")
    (description "OBS Noise is an advanced masking plugin for OBS
Studio that generates procedural noise patterns.  It can be used for
creating dynamic transitions, overlays, and visual effects during
live streaming or recording sessions.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 18. wizstr --- C++ string processing library
;;; -------------------------------------------------------------------
(define-public wizstr
  (package
    (name "wizstr")
    (version "2026.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitee.com/libbylg/str")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitee.com/libbylg/str")
    (synopsis "C++ string processing library")
    (description "Wizstr is a C++ string processing library providing
convenient functions for string manipulation, splitting, joining,
trimming, and conversion.  It aims to offer a simple and efficient API
for common string operations in C++ projects.")
    (license (license:non-copyleft
              "https://license.coscl.org.cn/MulanPSL2/"
              "Mulan Permissive Software License v2"))))

;;; -------------------------------------------------------------------
;;; 19. clad --- automatic differentiation for C++
;;; -------------------------------------------------------------------
(define-public clad
  (package
    (name "clad")
    (version "2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vgvassilev/clad")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list llvm clang))
    (native-inputs (list python))
    (home-page "https://github.com/vgvassilev/clad")
    (synopsis "automatic differentiation plugin for C++")
    (description "Clad is a Clang plugin that enables automatic
differentiation of C++ code.  It generates derivative functions at
compile time using source code transformation, supporting forward
and reverse mode differentiation for scientific computing and machine
learning applications.")
    (license license:lgpl2.1+)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. swaylock-plugin --- swaylock fork with plugin support
;;; -------------------------------------------------------------------
(define-public swaylock-plugin
  (package
    (name "swaylock-plugin")
    (version "1.8.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mstoeckl/swaylock-plugin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list wayland
                  cairo
                  linux-pam
                  libxkbcommon
                  glib
                  gdk-pixbuf))
    (native-inputs (list pkg-config wayland-protocols))
    (home-page "https://github.com/mstoeckl/swaylock-plugin")
    (synopsis "swaylock fork supporting custom wallpaper drawing programs")
    (description "Swaylock-plugin is a fork of swaylock, the screen
locker for Wayland compositors, that supports custom wallpaper drawing
programs as plugins.  This allows users to display dynamic content
such as animated backgrounds or custom graphics on the lock screen.")
    (license license:expat)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (scripts, data, binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. linux-router --- set Linux as router in one command
;;; -------------------------------------------------------------------
(define-public linux-router
  (package
    (name "linux-router")
    (version "0.7.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/garywill/linux-router")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lnxrouter" "bin/lnxrouter"))))
    (inputs (list bash procps iproute dnsmasq iptables))
    (home-page "https://github.com/garywill/linux-router")
    (synopsis "set Linux as router in one command")
    (description "Linux Router is a shell script that sets up a Linux
machine as a router, access point, or repeater with a single command.
It configures NAT, DHCP, DNS forwarding, and optionally WiFi AP using
hostapd, supporting both IPv4 and IPv6.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 22. faint --- extensible TUI fuzzy file explorer
;;; -------------------------------------------------------------------
(define-public faint
  (package
    (name "faint")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/salman-abedin/faint")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("faint" "bin/faint"))))
    (inputs (list bash fzf))
    (home-page "https://github.com/salman-abedin/faint")
    (synopsis "extensible TUI fuzzy file explorer")
    (description "Faint is a lightweight, extensible TUI fuzzy file
explorer that uses fzf for interactive file selection.  It provides
a quick way to navigate the filesystem with fuzzy matching and can be
customized through shell configuration.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. kraiser --- run or raise apps on KDE Plasma Wayland
;;; -------------------------------------------------------------------
(define-public kraiser
  (package
    (name "kraiser")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dmnmsc/kraiser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kraiser" "bin/kraiser"))))
    (inputs (list bash))
    (home-page "https://github.com/dmnmsc/kraiser")
    (synopsis "run or raise applications on KDE Plasma Wayland")
    (description "Kraiser is a shell script that implements run-or-raise
functionality for KDE Plasma on Wayland using kdotool.  If the target
application is already running, it focuses its window; otherwise, it
launches a new instance.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. pass-ln --- pass extension for creating symbolic links
;;; -------------------------------------------------------------------
(define-public pass-ln
  (package
    (name "pass-ln")
    (version "2.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/radian-software/pass-ln")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ln.bash" "lib/password-store/extensions/ln.bash"))))
    (inputs (list password-store coreutils))
    (home-page "https://github.com/radian-software/pass-ln")
    (synopsis "pass extension for creating symbolic links between entries")
    (description "pass-ln is an extension for the pass password manager
that adds the @command{pass ln} subcommand for creating symbolic links
between password store entries.  This allows you to reference the same
password from multiple paths without duplication.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. statecraft --- CLI directory structure creator
;;; -------------------------------------------------------------------
(define-public statecraft
  (package
    (name "statecraft")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PhrozenByte/statecraft")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("statecraft" "bin/statecraft"))))
    (inputs (list bash coreutils util-linux))
    (home-page "https://github.com/PhrozenByte/statecraft")
    (synopsis "CLI tool to create complex directory structures via scripts")
    (description "StateCraft is a CLI tool for creating complex
directory structures via declarative scripts on Linux.  It reads a
specification file and creates the described directory hierarchy with
appropriate permissions and ownership.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 26. git-hash-select --- git hash selector with fzf
;;; -------------------------------------------------------------------
(define-public git-hash-select
  (package
    (name "git-hash-select")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/roddyrap/git-hash-select")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-hash-select" "bin/git-hash-select"))))
    (inputs (list bash git-minimal fzf util-linux))
    (home-page "https://github.com/roddyrap/git-hash-select")
    (synopsis "interactive git commit hash selector using fzf")
    (description "Git-hash-select is a utility that provides an
interactive interface for selecting git commit hashes using fzf.
It integrates with shell key bindings to allow quick selection of
commit hashes during git operations.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. passless-boot --- passwordless reboot with LUKS
;;; -------------------------------------------------------------------
(define-public passless-boot
  (package
    (name "passless-boot")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Marcool04/passless-boot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("passless-boot" "bin/passless-boot"))))
    (inputs (list bash cryptsetup))
    (home-page "https://gitlab.com/Marcool04/passless-boot")
    (synopsis "one-time passwordless reboot on LUKS-encrypted root")
    (description "Passless-boot allows performing a one-time
passwordless reboot on a system with LUKS-encrypted root partition.
It temporarily stores the LUKS key for the next boot, avoiding the
need to re-enter the passphrase after an intentional reboot.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. latynka-kbd --- Ukrainian Latin keyboard layout
;;; -------------------------------------------------------------------
(define-public latynka-kbd
  (package
    (name "latynka-kbd")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vitalijr2/latynka-kbd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ua-latynka" "share/X11/xkb/symbols/ua-latynka"))))
    (home-page "https://github.com/vitalijr2/latynka-kbd")
    (synopsis "Ukrainian Latin keyboard layout for X11")
    (description "Latynka-kbd provides a Ukrainian Latin keyboard
layout for X11 based on the Ukrainian National Latinization standard.
It allows typing Ukrainian text using a Latin character set, which can
be useful for systems without Cyrillic font support.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 29. itch-setup-bin --- itch.io desktop app installer
;;; -------------------------------------------------------------------
(define-public itch-setup-bin
  (package
    (name "itch-setup-bin")
    (version "1.27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://broth.itch.zone/itch-setup/linux-amd64/"
                    version "/itch-setup"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("itch-setup" "bin/itch-setup"))))
    (inputs (list gtk+))
    (home-page "https://itch.io/")
    (synopsis "installer for the itch.io desktop application")
    (description "itch-setup is the official installer and updater for
the itch.io desktop application.  It bootstraps the itch desktop client,
which provides a launcher for discovering, downloading, and managing
indie games from the itch.io platform.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. papirus-folders-git --- change Papirus icon theme folder colors
;;; -------------------------------------------------------------------
(define-public papirus-folders-git
  (package
    (name "papirus-folders-git")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PapirusDevelopmentTeam/papirus-folders")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("papirus-folders" "bin/papirus-folders"))))
    (inputs (list bash))
    (home-page "https://github.com/PapirusDevelopmentTeam/papirus-folders")
    (synopsis "change the color of folders in the Papirus icon theme")
    (description "Papirus-folders is a script that allows changing the
color of folder icons in the Papirus icon theme.  It supports multiple
predefined color schemes and can be applied system-wide or per-user,
customizing the appearance of file manager folder icons.")
    (license license:lgpl3)))
