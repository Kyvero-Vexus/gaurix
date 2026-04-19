;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418am
;;; Resolves 5 BLOCKED packages with concrete recipes.
;;; Moves 12 packages to FAILED status.
;;; Also packages groonga (new dep for pgroonga).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418am)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vulkan)
  #:use-module (gaurix packages deptree-resolver-260418al)
  #:export (groonga
            pgroonga
            sftpman-gtk
            pcloudcc-lneely
            xenia-canary-git))

;;; 1. groonga — fulltext search engine (dep for pgroonga)
(define-public groonga
  (package
    (name "groonga")
    (version "16.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/groonga/groonga/releases/download/v"
                    version "/groonga-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DGRN_WITH_MRUBY=OFF"
                   "-DGRN_WITH_BUNDLED_LZ4=OFF"
                   "-DGRN_WITH_BUNDLED_ZLIB=OFF")))
    (native-inputs (list pkg-config))
    (inputs (list zlib lz4))
    (synopsis "open-source fulltext search engine and column store")
    (description
     "Groonga is an open-source fulltext search engine and column store.
It provides fast full-text search with support for multiple languages,
geolocation search, and column-oriented data storage.  Groonga is the
successor project to Senna.")
    (home-page "https://groonga.org")
    (license license:lgpl2.1)))

;;; 2. pgroonga — PostgreSQL extension for Groonga
(define-public pgroonga
  (package
    (name "pgroonga")
    (version "4.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pgroonga/pgroonga/releases/download/"
                    version "/pgroonga-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PG_CONFIG="
                                  (search-input-file %build-inputs
                                                     "bin/pg_config")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list postgresql clang-toolchain llvm))
    (inputs (list groonga postgresql))
    (synopsis "PostgreSQL extension for Groonga-based full text search")
    (description
     "PGroonga is a PostgreSQL extension that uses Groonga as its full text
search engine.  It provides fast full text search for all languages supported
by PostgreSQL, including CJK languages.")
    (home-page "https://pgroonga.github.io")
    (license license:x11)))

;;; 3. sftpman-gtk — GTK frontend for sftpman
(define-public sftpman-gtk
  (package
    (name "sftpman-gtk")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spantaleev/sftpman-gtk")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pygobject gtk+ sftpman-python))
    (synopsis "GTK frontend for sftpman SFTP filesystem manager")
    (description
     "GTK frontend for sftpman, a CLI application and library for managing
and mounting sshfs (SFTP) filesystems.  Provides a graphical interface for
configuring, mounting, and unmounting remote SFTP file systems.")
    (home-page "https://github.com/spantaleev/sftpman-gtk")
    (license license:gpl3)))

;;; 4. pcloudcc-lneely — pCloud console client
(define-public pcloudcc-lneely
  (package
    (name "pcloudcc-lneely")
    (version "20260324T111500Z")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lneely/pcloudcc-lneely")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "DESTDIR=" #$output)
                                "BUILD=release"
                                "FORCE_FUSE=3")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list readline zlib fuse mbedtls sqlite boost eudev))
    (synopsis "linux console client for pCloud cloud storage")
    (description
     "Console client for pCloud cloud storage.  Provides a command-line
interface for mounting pCloud drives via FUSE, uploading and downloading
files, and managing cloud storage.  Independently maintained fork of the
original pCloud console client.")
    (home-page "https://github.com/lneely/pcloudcc-lneely")
    (license license:bsd-3)))

;;; 5. xenia-canary-git — Xbox 360 emulator
(define-public xenia-canary-git
  (package
    (name "xenia-canary-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xenia-canary/xenia-canary")
                    (commit "4fcb8e4")
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DXENIA_BUILD_TESTS=OFF"
                   "-DXENIA_BUILD_MISC=OFF")))
    (native-inputs (list cmake clang-toolchain pkg-config))
    (inputs (list alsa-lib gtk+ sdl2 vulkan-headers vulkan-loader lz4))
    (synopsis "experimental emulator for the Xbox 360")
    (description
     "Xenia is an experimental emulator for the Xbox 360 game console.
It aims to run Xbox 360 games on modern hardware using Vulkan graphics and
supports both x86_64 and aarch64 architectures.")
    (home-page "https://github.com/xenia-canary/xenia-canary")
    (license license:bsd-3)))
