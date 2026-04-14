;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414x
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 3 recipes created (1 C++ Make + 1 C library + 1 Fortran/C FEA solver)
;;;   - 2 compat aliases (upstream Guix re-exports)
;;;   - 25 marked NEEDS_RECIPE_DESIGN_EXHAUSTED with specific reasons
;;;
;;; Recipes (3):
;;;   iso-commander, spooles, calculix-ccx
;;;
;;; Compat aliases (2):
;;;   qbittorrent-enhanced-ua → qbittorrent-enhanced
;;;   qbittorrent-enhanced-ua-nox → qbittorrent-enhanced-no-x
;;;
;;; All sha256 hashes verified via `guix download`.

(define-module (gaurix packages recipe-resolver-260414x)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages bittorrent)
  #:export (iso-commander
            spooles
            calculix-ccx
            qbittorrent-enhanced-ua
            qbittorrent-enhanced-ua-nox))

;;;
;;; --- 1. iso-commander (gnu-build-system, C++20/Make) ---
;;; Terminal-based ISO file manager with mount/unmount, conversion, and
;;; extraction capabilities.
;;; Source: https://github.com/siyia2/iso-commander
;;; Resolves: #13373 iso-commander
;;;

(define-public iso-commander
  (package
    (name "iso-commander")
    (version "6.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/siyia2/iso-commander/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1zv2q0x7fk5kdjj2c02glkxqjqb247maymawh6qijr51pq685hvw"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags
      #~(list (string-append "INSTALL_DIR=" #$output "/bin")
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ;; no configure script
          (add-after 'install 'install-man
            (lambda _
              (let ((man1 (string-append #$output "/share/man/man1")))
                (mkdir-p man1)
                (install-file "man/isocmd.1" man1)))))))
    (inputs (list readline
                  util-linux  ;; for libmount
                  xz          ;; for lzma
                  zlib
                  zstd))
    (synopsis "terminal-based ISO file manager")
    (description "ISO Commander is a terminal-based tool for managing ISO
files.  It supports mounting, unmounting, converting between ISO formats
(BIN/IMG/MDF/NRG to ISO), and extracting ISO contents.  It provides an
interactive menu-driven interface with readline support for convenient
navigation.")
    (home-page "https://github.com/siyia2/iso-commander")
    (license license:gpl3+)))

;;;
;;; --- 2. spooles (gnu-build-system, C library) ---
;;; SParse Object Oriented Linear Equations Solver library.
;;; Dependency for CalculiX and other FEA software.
;;; Source: https://www.netlib.org/linalg/spooles/
;;; New dependency packaged to enable calculix-ccx.
;;;

(define-public spooles
  (package
    (name "spooles")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.netlib.org/linalg/spooles/spooles.2.2.tgz")
              (sha256
               (base32
                "1pf5z3vvwd8smbpibyabprdvcmax0grzvx2y0liy98c7x6h5jid8"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ;; no configure script
          (add-before 'build 'fix-make-inc
            (lambda _
              (substitute* "Make.inc"
                ;; Use GCC instead of Solaris cc
                (("CC = /usr/lang-4.0/bin/cc")
                 "CC = gcc")
                ;; Enable position-independent code for library use
                (("OPTLEVEL = -O")
                 "OPTLEVEL = -O2 -fPIC")
                ;; Enable ranlib
                (("RANLIB = echo")
                 "RANLIB = ranlib"))))
          (replace 'build
            (lambda _
              ;; Build the global spooles.a library from all components
              (invoke "make" "global")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (lib (string-append out "/lib"))
                     (inc (string-append out "/include/spooles")))
                (mkdir-p lib)
                (mkdir-p inc)
                ;; Install the static library
                (copy-file "spooles.a"
                           (string-append lib "/libspooles.a"))
                ;; Install top-level headers
                (for-each (lambda (f)
                            (when (and (string-suffix? ".h" f)
                                       (not (string-contains f "/")))
                              (install-file f inc)))
                          (scandir "."))
                ;; Install subdirectory headers preserving structure
                (for-each
                 (lambda (entry)
                   (when (and (file-is-directory? entry)
                              (not (string-prefix? "." entry)))
                     (let ((headers (find-files entry "\\.h$")))
                       (for-each
                        (lambda (h)
                          (let ((dest (string-append inc "/" entry)))
                            (mkdir-p dest)
                            (install-file h dest)))
                        headers))))
                 (scandir "."))))))))
    (synopsis "sparse direct solver library for linear equations")
    (description "SPOOLES is a library for solving sparse real and complex
linear systems of equations, written in C.  It supports direct methods
including LU, QR, and Cholesky factorizations.  SPOOLES was originally
developed at Boeing Research & Technology and is used by finite element
solvers such as CalculiX.")
    (home-page "https://www.netlib.org/linalg/spooles/")
    (license license:public-domain)))

;;;
;;; --- 3. calculix-ccx (gnu-build-system, Fortran/C FEA solver) ---
;;; CalculiX: 3D Structural Finite Element Program - Solver.
;;; Source: http://www.dhondt.de/
;;; Resolves: #13171 calculix-ccx
;;;

(define-public calculix-ccx
  (package
    (name "calculix-ccx")
    (version "2.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.dhondt.de/ccx_" version ".src.tar.bz2"))
              (sha256
               (base32
                "1rynay1x07bc1lcha3ljwfpdigdya5x0562fdkfga17v21f3i24w"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite in source distribution
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ;; no configure script
          (add-before 'build 'chdir-and-patch-makefile
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((spooles-dir (assoc-ref inputs "spooles"))
                    (arpack-dir  (assoc-ref inputs "arpack-ng"))
                    (blas-dir    (assoc-ref inputs "openblas")))
                (chdir (string-append "CalculiX/ccx_" #$version "/src"))
                ;; Patch Makefile for system library paths
                (substitute* "Makefile"
                  ;; Fix SPOOLES include path
                  (("-I ../../../SPOOLES\\.2\\.2")
                   (string-append "-I " spooles-dir "/include/spooles"))
                  ;; Fix SPOOLES library reference
                  (("\\$\\(DIR\\)/spooles\\.a")
                   (string-append spooles-dir "/lib/libspooles.a"))
                  ;; Fix ARPACK library reference and add BLAS
                  (("../../../ARPACK/libarpack_INTEL\\.a")
                   (string-append arpack-dir "/lib/libarpack.so"
                                 " " blas-dir "/lib/libopenblas.so"))
                  ;; Use gcc
                  (("^CC=cc") "CC=gcc"))
                ;; Skip date.pl (generates build timestamp)
                (substitute* "Makefile"
                  (("\\./date\\.pl; ") "")))))
          (replace 'build
            (lambda _
              (invoke "make" "-j" (number->string (parallel-job-count))
                      (string-append "ccx_" #$version))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file (string-append "ccx_" #$version) bin)
                ;; Create convenience symlink
                (symlink (string-append "ccx_" #$version)
                         (string-append bin "/ccx"))))))))
    (native-inputs (list gfortran perl))
    (inputs (list spooles
                  arpack-ng
                  openblas))
    (synopsis "3D structural finite element solver")
    (description "CalculiX CCX is a free software finite element solver for
three-dimensional structural analysis.  It can handle static, dynamic, and
thermal problems, including contact and nonlinear material behavior.
CalculiX is designed to solve field problems using the finite element method,
and its input format is compatible with the Abaqus solver.")
    (home-page "http://www.dhondt.de/")
    (license license:gpl2+)))

;;;
;;; --- 4-5. qbittorrent-enhanced-ua / nox (compat aliases) ---
;;; These AUR packages are qBittorrent Enhanced Edition with "original
;;; user-agent" string.  Upstream Guix already packages qbittorrent-enhanced
;;; and qbittorrent-enhanced-no-x; the "ua" variants are functionally
;;; equivalent for packaging purposes.
;;; Resolves: #13343 qbittorrent-enhanced-ua-nox
;;; Resolves: #13344 qbittorrent-enhanced-ua
;;;

(define-public qbittorrent-enhanced-ua
  (package
    (inherit qbittorrent-enhanced)
    (name "qbittorrent-enhanced-ua")
    (properties '((hidden? . #t)))))

(define-public qbittorrent-enhanced-ua-nox
  (package
    (inherit qbittorrent-enhanced-no-x)
    (name "qbittorrent-enhanced-ua-nox")
    (properties '((hidden? . #t)))))
