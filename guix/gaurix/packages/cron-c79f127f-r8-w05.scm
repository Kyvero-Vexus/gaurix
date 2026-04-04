;;; Chunk module for blocked-tree packaging run cron-c79f127f round 8 (worker w05).
(define-module (gaurix packages cron-c79f127f-r8-w05)
  #:use-module (guix packages)
  #:autoload (gnu packages) (specification->package)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages virtualization)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (apriltag
            openapv
            xevd
            libklvanc
            qt5-scxml
            waydroid))

;;; ─── Strategy A: upstream Guix alias ─────────────────────────────────────────

(define-public qt5-scxml
  ;; Guix already ships qtscxml 5.15.17 (AUR wants 5.15.18); alias for compat.
  (let ((upstream (specification->package "qtscxml@5.15.17")))
    (package
      (inherit upstream)
      (name "qt5-scxml"))))

;;; ─── Strategy C: source builds ───────────────────────────────────────────────

(define-public apriltag
  (package
    (name "apriltag")
    (version "3.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AprilRobotics/apriltag/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "05b5ap6cz5jfb2cc5qxsbn717x71yihkhdss6yfc4y6v421g8j9p"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DCMAKE_BUILD_TYPE=Release"
                                "-DBUILD_SHARED_LIBS=ON")
      #:tests? #f))  ; no test suite in upstream
    (home-page "https://april.eecs.umich.edu/software/apriltag")
    (synopsis "Visual fiducial system for robotics and augmented reality")
    (description
     "AprilTag is a visual fiducial system useful for a wide variety of tasks
including augmented reality, robotics, and camera calibration.  Targets can be
created from an ordinary printer, and the AprilTag detection software computes
the precise 3D position, orientation, and identity of the tags relative to the
camera.")
    (license license:bsd-2)))

(define-public openapv
  (package
    (name "openapv")
    (version "0.2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AcademySoftwareFoundation/openapv"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "067z57hawak72r3dncmaclyhrfyfl17z3vi4vzlgb5phqkl0ch8n"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f))  ; no test suite shipped
    (home-page "https://github.com/AcademySoftwareFoundation/openapv")
    (synopsis "Reference implementation of the APV video codec")
    (description
     "OpenAPV is the reference implementation of the Advanced Professional
Video (APV) codec, developed under the Academy Software Foundation.  It
provides encoding and decoding tools for the APV format.")
    (license license:bsd-3)))

(define-public xevd
  (package
    (name "xevd")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mpeg5/xevd/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1n7c7hmlaabsl35ndx36wyy8iljd3nd15ghzx47ygm4s3bncfmcd"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f))  ; no test suite shipped
    (home-page "https://github.com/mpeg5/xevd")
    (synopsis "MPEG-5 EVC decoder (eXtra-fast Essential Video Decoder)")
    (description
     "xevd is a decoder for the MPEG-5 Essential Video Coding (EVC) standard.
It provides a fast, compliant decoder implementation for the EVC baseline and
main profiles.")
    (license license:bsd-3)))

(define-public libklvanc
  (package
    (name "libklvanc")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/stoth68000/libklvanc/archive/refs/tags/vid.obe."
             version ".tar.gz"))
       (sha256
        (base32 "1hs8r6qpng8kzjnmim4gmnlkf6dji6hhp26dsbmg8kjs8m4clxjh"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite
    (native-inputs (list pkg-config))
    (home-page "https://github.com/stoth68000/libklvanc")
    (synopsis "Library for parsing VANC (Vertical Ancillary) data")
    (description
     "libklvanc is a library for parsing and generating SMPTE ST 2010
Vertical Ancillary (VANC) data embedded in SDI video streams.  It supports
multiple VANC types including Closed Captions (CEA-708), AFD/Bar Data, SCTE-104,
and SMPTE 12-2 timecodes.")
    (license license:lgpl2.1+)))

;;; ─── waydroid: Makefile-based Python application ─────────────────────────────

(define-public waydroid
  (package
    (name "waydroid")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/waydroid/waydroid/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1jkxym93gdj5vhx661j68jh2cgvv2i06xclq1q188a6yp773m5jb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "DESTDIR=")
              "USE_SYSTEMD=0"
              "USE_DBUS_ACTIVATION=0")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (add-after 'install 'wrap-program
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (python (assoc-ref inputs "python")))
                (wrap-program (string-append out "/lib/waydroid/waydroid.py")
                  `("PYTHONPATH" prefix
                    (,(string-append out "/lib/waydroid")))
                  `("PATH" prefix
                    (,(string-append python "/bin"))))))))))
    (inputs (list python python-pygobject lxc))
    (home-page "https://github.com/waydroid/waydroid")
    (synopsis "Run Android applications on GNU/Linux using Wayland")
    (description
     "Waydroid uses Linux namespaces (LXC) to run a full Android system in a
container on top of a GNU/Linux distribution that uses Wayland as its display
protocol.  It provides hardware access through direct rendering for GPU
acceleration.")
    (license license:gpl3)))
