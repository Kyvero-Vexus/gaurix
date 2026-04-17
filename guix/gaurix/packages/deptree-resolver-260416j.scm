;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260416j
;;; Resolves 2 BLOCKED packages from dependency tree queue:
;;;   - sh-elf-newlib (#7617): SuperH bare-metal newlib C library
;;;   - sh-elf-gcc (#7648): SuperH bare-metal GCC cross-compiler
;;;
;;; Bootstrap chain: sh-elf-binutils (DONE) -> sh-elf-gcc-bootstrap (new)
;;;   -> sh-elf-newlib -> sh-elf-gcc (full, with C++ and newlib)
;;;
;;; BLOCKED pool exhausted: only 3 entries remained, 1 stays BLOCKED (raidrivecli).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260416j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages mpc)
  #:use-module (gnu packages compression)
  #:use-module (gaurix packages cron-c79f127f-r26-w03)
  #:export (sh-elf-gcc-bootstrap
            sh-elf-newlib
            sh-elf-gcc))

;;; ── sh-elf-gcc-bootstrap ──────────────────────────────────────────
;;; Bootstrap GCC cross-compiler (C only, no libc) for SuperH bare-metal.
;;; Required to break the circular dependency: newlib needs gcc, gcc needs newlib.
;;; This builds a minimal C-only GCC without any C library support,
;;; sufficient to compile newlib.

(define-public sh-elf-gcc-bootstrap
  (package
    (name "sh-elf-gcc-bootstrap")
    (version "14.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/gcc/gcc-"
                                  version "/gcc-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:out-of-source? #t
      #:configure-flags
      #~(list "--target=sh-elf"
              (string-append "--prefix=" #$output)
              "--enable-languages=c"
              "--without-headers"
              "--with-newlib"
              "--disable-shared"
              "--disable-threads"
              "--disable-libssp"
              "--disable-libgomp"
              "--disable-libmudflap"
              "--disable-libquadmath"
              "--disable-decimal-float"
              "--disable-nls"
              "--disable-tls"
              "--with-gnu-as"
              "--with-gnu-ld"
              "--disable-multilib")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'set-paths 'augment-target-tools
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "PATH"
                      (string-append
                       (search-input-directory inputs "bin")
                       ":" (getenv "PATH"))))))))
    (native-inputs (list sh-elf-binutils))
    (inputs (list gmp mpfr libmpc))
    (synopsis "bootstrap GCC cross-compiler for SuperH bare-metal (C only)")
    (description "Minimal GCC cross-compiler targeting sh-elf (SuperH
bare-metal).  Supports only the C language and has no C library.  Used to
bootstrap the build of newlib for SuperH, after which a full GCC with C++
support can be built.")
    (home-page "https://gcc.gnu.org/")
    (license license:gpl3+)))

;;; ── sh-elf-newlib ─────────────────────────────────────────────────
;;; Newlib C standard library for SuperH bare-metal.
;;; Built using the bootstrap GCC (C only) and sh-elf-binutils.
;;; Source from official sourceware.org release tarball.

(define-public sh-elf-newlib
  (package
    (name "sh-elf-newlib")
    (version "4.5.0.20241231")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceware.org/pub/newlib/newlib-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:out-of-source? #t
      #:configure-flags
      #~(list "--target=sh-elf"
              (string-append "--prefix=" #$output)
              "--enable-newlib-io-long-long"
              "--enable-newlib-io-c99-formats"
              "--enable-newlib-register-fini"
              "--enable-newlib-retargetable-locking"
              "--disable-newlib-supplied-syscalls"
              "--disable-nls")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'set-paths 'set-cross-environment
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "PATH"
                      (string-append
                       (search-input-directory inputs "bin")
                       ":" (getenv "PATH")))
              (setenv "CFLAGS_FOR_TARGET"
                      "-g -O2 -ffunction-sections -fdata-sections"))))))
    (native-inputs (list sh-elf-binutils sh-elf-gcc-bootstrap))
    (synopsis "C standard library for SuperH bare-metal embedded systems")
    (description "Newlib is a C standard library implementation intended for
use on embedded systems.  This package provides newlib built for the sh-elf
target (SuperH bare-metal), supporting I/O with long long and C99 format
specifiers.")
    (home-page "https://www.sourceware.org/newlib/")
    (license license:bsd-3)))

;;; ── sh-elf-gcc ────────────────────────────────────────────────────
;;; Full GCC cross-compiler for SuperH bare-metal with C and C++ support.
;;; Built with newlib linked in, providing libgcc and libstdc++.
;;; Follows the AUR PKGBUILD pattern for sh-elf-gcc.

(define-public sh-elf-gcc
  (package
    (name "sh-elf-gcc")
    (version "15.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/gcc/gcc-"
                                  version "/gcc-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:out-of-source? #t
      #:configure-flags
      #~(list "--target=sh-elf"
              (string-append "--prefix=" #$output)
              (string-append "--with-sysroot=" #$sh-elf-newlib "/sh-elf")
              (string-append "--with-native-system-header-dir=/include")
              "--enable-languages=c,c++"
              "--enable-plugins"
              "--disable-decimal-float"
              "--disable-libffi"
              "--disable-libgomp"
              "--disable-libmudflap"
              "--disable-libquadmath"
              "--disable-libssp"
              "--disable-libstdcxx-pch"
              "--disable-nls"
              "--disable-threads"
              "--disable-tls"
              "--with-gnu-as"
              "--with-gnu-ld"
              "--with-system-zlib"
              "--with-newlib"
              "--disable-multilib"
              "--enable-gnu-indirect-function")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'set-paths 'augment-target-tools
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "PATH"
                      (string-append
                       (search-input-directory inputs "bin")
                       ":" (getenv "PATH")))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "make"
                      "install-gcc"
                      "install-target-libgcc"
                      "install-target-libstdc++-v3"))))))
    (native-inputs (list sh-elf-binutils))
    (inputs (list sh-elf-newlib gmp mpfr libmpc zlib))
    (synopsis "GCC cross-compiler for SuperH bare-metal with C and C++")
    (description "The GNU Compiler Collection configured as a cross-compiler
targeting sh-elf (SuperH bare-metal).  Supports C and C++ with newlib as
the C library.  Provides @code{libgcc} and @code{libstdc++} for the
target.")
    (home-page "https://gcc.gnu.org/")
    (license license:gpl3+)))
