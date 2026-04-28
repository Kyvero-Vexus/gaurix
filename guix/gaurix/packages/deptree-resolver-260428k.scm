;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428k
;;; 100 BLOCKED evaluated, 1 resolved to DONE, 0 new dependency packages.
;;; 1 new recipe total:
;;;   vegastrike-engine-git → DONE
;;; 99 remain BLOCKED (intractable categories confirmed).
;;;
;;; Key findings this pass:
;;; - vegastrike-engine-git: CMake C++ space sim, all deps in Guix
;;;   (boost, SDL2, OpenAL, freeglut, GTK3, libvorbis, GLU, Python).
;;;   Latest stable release v0.9.1 (2025-05-23). GPL-3.0.
;;; - All other 99 packages remain intractable: proprietary (16),
;;;   DKMS kernel modules (11), distro-specific (10), MinGW cross (10),
;;;   complex deps (10), abandoned (6), multilib (5), non-distributable (5),
;;;   arch-specific (5), kernel headers (4), platform-unsupported (4),
;;;   SELinux (1), legacy Python2 (2), hardware-specific (1),
;;;   GCC snapshot (1), newly categorized (8).
;;;
;;; Verification: upstream Guix checked for all 100 (none found).
;;; Key deps available: boost=1.89.0, freeglut=3.4.0, openal=1.23.1,
;;;   sdl2=2.30.8, glu=9.0.2, libvorbis=1.3.7, gtk+=3.24.51.
;;;
;;; See deptree-resolver-260428k-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xiph)
  #:export (vegastrike-engine-git))

;;; ========================================================================
;;; RESOLVED: vegastrike-engine-git
;;; ========================================================================
;;; Previously BLOCKED (no fail reason assigned).
;;; Vega Strike is an open-source 3D space flight simulator.
;;; All dependencies confirmed in upstream Guix.
;;; CMake build, source in engine/ subdirectory.
;;; Latest stable release: v0.9.1 (2025-05-23).

(define-public vegastrike-engine-git
  (package
    (name "vegastrike-engine-git")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vegastrike/Vega-Strike-Engine-Source"
             "/archive/v" version ".tar.gz"))
       (sha256
        (base32 "03xzznkkrs3call44c0bwf2jiziwp1y9wni9374fwgrjix6s8mqg"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite in upstream
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'enter-engine-dir
            (lambda _
              ;; CMakeLists.txt is in the engine/ subdirectory
              (chdir "engine"))))))
    (native-inputs (list pkg-config))
    (inputs
     (list boost
           freeglut
           glu
           gtk+
           libvorbis
           openal
           python
           sdl2))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source 3D space flight simulator engine")
    (description
     "Vega Strike is an open-source 3D space flight simulator that allows
players to explore, trade, and fight in the vast openness of space.  The
engine features a massive universe with multiple star systems, dynamic
gameplay with intelligent AI, and extensive modding support.")
    (home-page "https://www.vega-strike.org")
    (license license:gpl3)))
