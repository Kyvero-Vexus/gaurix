;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. ent (gnu/make, v1.0, CC-BY-SA-4.0)
;;;   2. dadaengine (gnu/autotools, v1.03, BSD-3)
;;;   3. slibtool (gnu/configure, v0.7.4, MIT)
;;;   4. rgxg (gnu/autotools, v0.1.2, zlib)
;;;   5. awesfx (gnu/autotools, v0.5.2, GPL-2.0)
;;;   6. heapusage (cmake, v2.33, BSD-3)
;;;   7. stackusage (cmake, v1.20, BSD-3)
;;;   8. ntfs2btrfs (cmake, v20250616, GPL-2.0)
;;;   9. libmaddy (cmake/header-only, v1.6.0, MIT)
;;;  10. libbsc (cmake, v3.3.12, Apache-2.0)
;;;  11. tagutil (cmake, v3.1, BSD-2)
;;;  12. ltris2 (gnu/autotools, v2.0.4, GPL-3.0)
;;;  13. simsimd (cmake/header-only, v6.5.16, Apache-2.0)
;;;  14. docformatter (pyproject/poetry, v1.7.7, MIT)
;;;  15. cfv (pyproject, v3.2.0, GPL-2.0+)
;;;  16. bmaptool (pyproject/hatch, v3.9.0, GPL-2.0)
;;;  17. pyglossary (pyproject, v5.3.0, GPL-3.0)
;;;  18. python-shandy-sqlfmt (pyproject/hatch, v0.29.0, Apache-2.0)
;;;  19. perl-compress-raw-lzma (perl, v2.221, GPL+Artistic)
;;;  20. git-store-meta (copy/script, v2.3.7, MIT)
;;;  21. duply (copy/script, v2.5.6, GPL-2.0)
;;;  22. mint-l-theme (copy, v2.0.6, GPL-3.0+)
;;;  23. sound-theme-simple (copy, v1.0, CC-BY-SA-4.0)
;;;  24. pipes-rs-bin (copy/binary, v1.6.4, BlueOak-1.0)
;;;  25. prboom-plus (cmake, v2.6.66, GPL-2.0+)
;;;  26. gearboy (cmake, v3.8.2, GPL-3.0)
;;;  27. somafm-tui (pyproject, v0.6.12, MIT)
;;;  28. python-textual-textarea (pyproject/hatch, v0.17.2, MIT)
;;;  29. gmusicbrowser (gnu/make, v1.1.16, GPL-3.0)
;;;  30. breeze-enhanced (cmake/KDE, v6.4, GPL-3.0)
;;;
;;; 30 recipes written. 0 BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix build-system perl)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:export (
            ent
            dadaengine
            slibtool
            rgxg
            awesfx
            heapusage
            stackusage
            ntfs2btrfs
            libmaddy
            libbsc
            tagutil
            ltris2
            simsimd
            docformatter
            cfv
            bmaptool
            pyglossary
            python-shandy-sqlfmt
            perl-compress-raw-lzma
            git-store-meta
            duply
            mint-l-theme
            sound-theme-simple
            pipes-rs-bin
            prboom-plus
            gearboy
            somafm-tui
            python-textual-textarea
            gmusicbrowser
            breeze-enhanced
            ))

;;; Custom license definitions for non-standard licenses.
(define license:blue-oak-1.0
  ((@@ (guix licenses) license) "Blue Oak Model License 1.0.0"
    "https://blueoakcouncil.org/license/1.0.0"
    "Permissive license designed to be clearly understood"))

;;; -------------------------------------------------------------------
;;; 1. ent — pseudorandom number sequence test
;;; -------------------------------------------------------------------
(define-public ent
  (package
    (name "ent")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.fourmilab.ch/random/random.zip")
              (file-name (string-append "ent-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "make" "-C" "src")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "src/ent" bin)))))))
    (native-inputs (list unzip))
    (synopsis "pseudorandom number sequence test program")
    (description "ENT applies various tests to sequences of bytes to evaluate
whether they appear random.  It reports entropy, chi-square distribution,
arithmetic mean, Monte Carlo value for pi, and serial correlation
coefficient.")
    (home-page "https://www.fourmilab.ch/random/")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 2. dadaengine — random text generator from grammars
;;; -------------------------------------------------------------------
(define-public dadaengine
  (package
    (name "dadaengine")
    (version "1.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dev.null.org/dadaengine/dada-"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list flex))
    (synopsis "system for generating random text from grammars")
    (description "The Dada Engine is a system for generating random text from
recursive grammars.  It uses the @code{pb} language to describe patterns that
can produce Dadaist or other procedurally generated prose, poetry, and
structured text.")
    (home-page "https://dev.null.org/dadaengine/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 3. slibtool — strong libtool implementation in C
;;; -------------------------------------------------------------------
(define-public slibtool
  (package
    (name "slibtool")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dl.foss21.org/slibtool/slibtool-"
                                  version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fast drop-in replacement for GNU libtool written in C")
    (description "Slibtool is a strong libtool implementation written entirely
in C.  It is designed as a fast, portable, drop-in replacement for GNU libtool
for building shared and static libraries on POSIX systems.")
    (home-page "https://dev.midipix.org/cross/slibtool")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. rgxg — regular expression generator
;;; -------------------------------------------------------------------
(define-public rgxg
  (package
    (name "rgxg")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rgxg/rgxg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake libtool))
    (synopsis "generate extended regular expressions for number ranges and CIDR blocks")
    (description "Rgxg is a C library and command-line tool that generates
extended regular expressions.  It can produce patterns that match number
ranges, CIDR network blocks, and arbitrary character ranges, useful for
firewall rules, input validation, and search patterns.")
    (home-page "https://rgxg.github.io/")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 5. awesfx — ALSA SoundFont utility programs
;;; -------------------------------------------------------------------
(define-public awesfx
  (package
    (name "awesfx")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tiwai/awesfx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake libtool))
    (inputs (list alsa-lib))
    (synopsis "utilities for loading SoundFont files into AWE32 and ALSA Emux drivers")
    (description "Awesfx provides utilities for loading SoundFont files into
AWE32, SBLive, and ALSA Emux WaveTable sound drivers.  The primary tool is
@command{asfxload} which manages SoundFont banks for hardware synthesis.")
    (home-page "https://github.com/tiwai/awesfx")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 6. heapusage — lightweight heap memory profiler
;;; -------------------------------------------------------------------
(define-public heapusage
  (package
    (name "heapusage")
    (version "2.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/d99kris/heapusage/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight tool for finding heap memory errors in Linux applications")
    (description "Heapusage is a lightweight tool for detecting heap memory
errors including leaks, double frees, use-after-free, and buffer overflows
in Linux applications.  It works by intercepting memory allocation functions
via @code{LD_PRELOAD}.")
    (home-page "https://github.com/d99kris/heapusage")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7. stackusage — thread stack usage profiler
;;; -------------------------------------------------------------------
(define-public stackusage
  (package
    (name "stackusage")
    (version "1.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/d99kris/stackusage/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "measure stack usage of threads in Linux applications")
    (description "Stackusage is a lightweight tool for measuring stack usage of
individual threads in Linux applications.  It helps tune stack sizes for
resource-constrained or embedded environments by reporting actual stack
consumption at runtime.")
    (home-page "https://github.com/d99kris/stackusage")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 8. ntfs2btrfs — in-place NTFS to btrfs converter
;;; -------------------------------------------------------------------
(define-public ntfs2btrfs
  (package
    (name "ntfs2btrfs")
    (version "20250616")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maharmstone/ntfs2btrfs/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list fmt zlib lzo zstd))
    (synopsis "in-place converter from NTFS to btrfs filesystem")
    (description "Ntfs2btrfs performs in-place conversion of Microsoft NTFS
filesystems to the open-source btrfs filesystem.  It preserves data and
metadata in a single pass without requiring additional disk space for the
conversion, optionally compressing data with zlib, LZO, or Zstandard.")
    (home-page "https://github.com/maharmstone/ntfs2btrfs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 9. libmaddy — C++ header-only Markdown to HTML parser
;;; -------------------------------------------------------------------
(define-public libmaddy
  (package
    (name "libmaddy")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/progsource/maddy/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DMADDY_BUILD_WITH_TESTS=OFF")))
    (synopsis "header-only C++ Markdown to HTML parser library")
    (description "Maddy is a C++14 header-only library for parsing Markdown
into HTML.  It depends only on the C++ standard library and supports
paragraphs, headings, lists, emphasis, links, images, code blocks,
and tables.")
    (home-page "https://github.com/progsource/maddy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. libbsc — high-performance block-sorting compressor
;;; -------------------------------------------------------------------
(define-public libbsc
  (package
    (name "libbsc")
    (version "3.3.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IlyaGrebnov/libbsc/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "high-performance block-sorting lossless data compression library")
    (description "Libbsc is a high-performance data compression library that uses
block-sorting algorithms including Burrows-Wheeler transform, sorted rank
transform, and Lempel-Ziv prediction.  It achieves compression ratios
competitive with LZMA and PPMd while maintaining fast decompression.")
    (home-page "https://github.com/IlyaGrebnov/libbsc")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. tagutil — scriptable audio tag editor
;;; -------------------------------------------------------------------
(define-public tagutil
  (package
    (name "tagutil")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kaworu/tagutil/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libyaml jansson flac taglib libvorbis))
    (synopsis "scriptable command-line tool for editing music file tags")
    (description "Tagutil is a command-line tool for reading, writing, and
editing audio file tags.  It supports FLAC, Ogg Vorbis, and TagLib-compatible
formats with output in YAML and JSON.  Tag operations can be scripted for
batch processing of music collections.")
    (home-page "https://github.com/kaworu/tagutil")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 12. ltris2 — Tetris clone with full HD and smooth animations
;;; -------------------------------------------------------------------
(define-public ltris2
  (package
    (name "ltris2")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/lgames/ltris2-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list sdl2 sdl2-mixer sdl2-image sdl2-ttf))
    (synopsis "Tetris clone with full HD view and smooth animations")
    (description "LTris2 is a Tetris clone built with SDL2 featuring a full HD
view, smooth piece animations, configurable key bindings, and various game
modes including marathon and sprint.  It supports background music and sound
effects through SDL2_mixer.")
    (home-page "https://lgames.sourceforge.io/LTris/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. simsimd — SIMD-accelerated vector distance functions
;;; -------------------------------------------------------------------
(define-public simsimd
  (package
    (name "simsimd")
    (version "6.5.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ashvardanian/SimSIMD/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DSIMSIMD_BUILD_TESTS=OFF"
                   "-DSIMSIMD_BUILD_BENCHMARKS=OFF")))
    (synopsis "SIMD-accelerated vector distance and similarity functions")
    (description "SimSIMD is a zero-dependency C99 header-only library
providing SIMD-accelerated vector distance and similarity functions including
dot products, cosine similarity, Euclidean distance, and more.  It supports
x86 AVX/AVX2/AVX-512, ARM NEON/SVE, and scalar fallback.")
    (home-page "https://github.com/ashvardanian/SimSIMD")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. docformatter — Python docstring formatter for PEP 257
;;; -------------------------------------------------------------------
(define-public docformatter
  (package
    (name "docformatter")
    (version "1.7.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "docformatter" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-poetry-core))
    (propagated-inputs (list python-charset-normalizer))
    (synopsis "automatically format Python docstrings to follow PEP 257")
    (description "Docformatter is a tool that automatically formats Python
docstrings to conform to PEP 257 conventions.  It wraps long lines, fixes
indentation, and standardizes docstring formatting across a codebase,
similar to how Black formats code.")
    (home-page "https://github.com/PyCQA/docformatter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. cfv — checksum file verifier and creator
;;; -------------------------------------------------------------------
(define-public cfv
  (package
    (name "cfv")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cfv-project/cfv/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "utility to test and create checksum verification files")
    (description "Cfv is a command-line utility that verifies and creates
checksum files in many formats including SFV, MD5, SHA1, SHA256, SHA512,
CRC, and BitTorrent.  It can recursively verify directory trees and
supports batch operations.")
    (home-page "https://github.com/cfv-project/cfv")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16. bmaptool — block map based copying tool
;;; -------------------------------------------------------------------
(define-public bmaptool
  (package
    (name "bmaptool")
    (version "3.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yoctoproject/bmaptool/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list gpgme))
    (synopsis "fast and reliable block-map-based image flashing tool")
    (description "Bmaptool uses block map files to efficiently copy or flash
large image files by writing only the mapped (non-sparse) blocks.  This
dramatically speeds up the process of flashing OS images to SD cards or
USB drives compared to @command{dd}.")
    (home-page "https://github.com/yoctoproject/bmaptool")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. pyglossary — dictionary and glossary converter
;;; -------------------------------------------------------------------
(define-public pyglossary
  (package
    (name "pyglossary")
    (version "5.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ilius/pyglossary/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dictionary and glossary file converter supporting 40+ formats")
    (description "PyGlossary converts between dictionary and glossary file
formats for use with open-source dictionary applications.  It supports over 40
formats including StarDict, Babylon, XDXF, Lingoes, ABBYY Lingvo, Kobo,
AppleDict, and many more.")
    (home-page "https://github.com/ilius/pyglossary")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. python-shandy-sqlfmt — opinionated SQL formatter
;;; -------------------------------------------------------------------
(define-public python-shandy-sqlfmt
  (package
    (name "python-shandy-sqlfmt")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "shandy_sqlfmt" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-click python-tqdm python-platformdirs
                             python-jinja2))
    (synopsis "opinionated SQL formatter for dbt and analytics SQL")
    (description "Sqlfmt is an opinionated SQL formatter designed for dbt
projects and analytics SQL.  It produces consistently formatted SQL similar
to how Black formats Python code, supporting Jinja-templated SQL and multiple
SQL dialects.")
    (home-page "https://sqlfmt.com")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. perl-compress-raw-lzma — low-level Perl LZMA interface
;;; -------------------------------------------------------------------
(define-public perl-compress-raw-lzma
  (package
    (name "perl-compress-raw-lzma")
    (version "2.221")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/P/PM/PMQS/Compress-Raw-Lzma-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (inputs (list xz))
    (synopsis "low-level Perl interface to the lzma compression library")
    (description "Compress::Raw::Lzma provides a low-level Perl interface to
the lzma and xz compression libraries.  It supports reading and writing
lzma, lzip, and xz compressed data streams, forming the foundation for
higher-level Perl compression modules.")
    (home-page "https://metacpan.org/dist/Compress-Raw-Lzma")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 20. git-store-meta — store and apply file metadata for git
;;; -------------------------------------------------------------------
(define-public git-store-meta
  (package
    (name "git-store-meta")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/danny0838/git-store-meta/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-store-meta.pl" "bin/git-store-meta"))))
    (inputs (list perl git))
    (synopsis "store and restore file metadata in git repositories")
    (description "Git-store-meta is a lightweight Perl script that stores file
metadata (modification time, access time, permissions, owner, group, and ACLs)
alongside a git repository.  It can save metadata on pre-commit and restore it
on post-checkout to preserve timestamps and permissions across clones.")
    (home-page "https://github.com/danny0838/git-store-meta")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. duply — shell frontend for duplicity backups
;;; -------------------------------------------------------------------
(define-public duply
  (package
    (name "duply")
    (version "2.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/ftplicity/duply%20%28simple%20duplicity%29/"
                    "2.5.x/duply_" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("duply" "bin/duply"))))
    (inputs (list bash duplicity gnupg))
    (synopsis "shell frontend for duplicity encrypted incremental backups")
    (description "Duply is a shell frontend for the duplicity backup tool.  It
simplifies encrypted incremental backup management through named profiles,
pre/post scripts, and batch commands.  Duply handles GnuPG key management
and supports all duplicity backends for local and remote storage.")
    (home-page "https://duply.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 22. mint-l-theme — Linux Mint legacy flat GTK theme
;;; -------------------------------------------------------------------
(define-public mint-l-theme
  (package
    (name "mint-l-theme")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-l-theme/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/themes" "share/themes"))))
    (synopsis "legacy flat GTK theme collection for Linux Mint")
    (description "Mint-L-Theme is a collection of legacy flat GTK themes for
Linux Mint in multiple color variations including green, aqua, blue, grey,
orange, pink, purple, red, sand, and teal.  It provides consistent theming
across GTK2 and GTK3 applications.")
    (home-page "https://github.com/linuxmint/mint-l-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. sound-theme-simple — complete freedesktop sound theme
;;; -------------------------------------------------------------------
(define-public sound-theme-simple
  (package
    (name "sound-theme-simple")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/spsf64/simple/releases/download/1/simple-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sounds/simple"
                #:exclude ("LICENSE" "README.md")))))
    (synopsis "complete freedesktop system sound theme with 70+ events")
    (description "Simple is a system sound theme following the freedesktop
sound theme specification.  It provides over 70 event sounds covering
desktop actions, notifications, alerts, and input feedback, adapted from
the Smooth sound theme.")
    (home-page "https://github.com/spsf64/simple")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 24. pipes-rs-bin — animated terminal pipes screensaver
;;; -------------------------------------------------------------------
(define-public pipes-rs-bin
  (package
    (name "pipes-rs-bin")
    (version "1.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lhvy/pipes-rs/releases/download/v"
                    version "/pipes-rs-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pipes-rs" "bin/pipes-rs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "animated terminal pipes screensaver written in Rust")
    (description "Pipes-rs is an over-engineered rewrite of @command{pipes.sh}
in Rust.  It renders animated pipes flowing across the terminal with
configurable colors, styles, turn probability, delay, and number of
simultaneous pipes.")
    (home-page "https://github.com/lhvy/pipes-rs")
    (license license:blue-oak-1.0)))

;;; -------------------------------------------------------------------
;;; 25. prboom-plus — advanced Doom source port
;;; -------------------------------------------------------------------
(define-public prboom-plus
  (package
    (name "prboom-plus")
    (version "2.6.66")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coelckers/prboom-plus/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-S" (getcwd) "/prboom2"))))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 sdl2-image sdl2-mixer sdl2-net
                  mesa glu
                  pcre zlib
                  libmad libvorbis fluidsynth portmidi
                  alsa-lib))
    (synopsis "advanced source port of the classic Doom engine")
    (description "PrBoom-plus is an enhanced source port of id Software's Doom
engine with OpenGL rendering, high-resolution support, demo compatibility,
network multiplayer, and extensive modding support.  It plays Doom, Doom II,
and compatible WAD files.")
    (home-page "https://github.com/coelckers/prboom-plus")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 26. gearboy — Game Boy and Game Boy Color emulator
;;; -------------------------------------------------------------------
(define-public gearboy
  (package
    (name "gearboy")
    (version "3.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/drhelius/Gearboy/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "CXX=" #$(cxx-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'chdir-platform
                 (lambda _
                   (chdir "platforms/linux")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "gearboy" bin)))))))
    (inputs (list sdl3 mesa))
    (synopsis "accurate Game Boy and Game Boy Color emulator")
    (description "Gearboy is an accuracy-focused Game Boy, Game Boy Color, and
Super Game Boy emulator.  It features cycle-accurate CPU emulation, accurate
memory timing, MBC support (MBC1 through MBC5 plus HuC1 and HuC3), and a
built-in debugger with memory viewer and disassembler.")
    (home-page "https://github.com/drhelius/Gearboy")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. somafm-tui — terminal UI for SomaFM internet radio
;;; -------------------------------------------------------------------
(define-public somafm-tui
  (package
    (name "somafm-tui")
    (version "0.6.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zsh-ncursed/somafm_tui/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-requests python-mpv mpv))
    (synopsis "terminal user interface for SomaFM internet radio")
    (description "SomaFM TUI is a terminal-based internet radio client for
SomaFM stations.  It uses mpv as the audio backend and supports stream
buffering, 21 color themes, favorites, and track notifications.  All
SomaFM channels are available with multiple stream quality options.")
    (home-page "https://github.com/zsh-ncursed/somafm_tui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. python-textual-textarea — TextArea widget for Textual TUI
;;; -------------------------------------------------------------------
(define-public python-textual-textarea
  (package
    (name "python-textual-textarea")
    (version "0.17.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "textual_textarea" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-textual python-pyperclip))
    (synopsis "text area widget with VS Code keybindings for Textual TUI apps")
    (description "Textual-textarea provides a full-featured text area widget
for Textual terminal user interface applications.  It includes VS Code-like
keyboard shortcuts, syntax highlighting via tree-sitter, clipboard
integration, and file open/save operations.")
    (home-page "https://github.com/tconbeer/textual-textarea")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. gmusicbrowser — jukebox for large music collections
;;; -------------------------------------------------------------------
(define-public gmusicbrowser
  (package
    (name "gmusicbrowser")
    (version "1.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/squentin/gmusicbrowser/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "make" "install"
                           (string-append "prefix="
                                          (assoc-ref outputs "out"))))))))
    (inputs (list perl perl-gtk2 mpg321 vorbis-tools))
    (synopsis "highly customizable jukebox for large music collections")
    (description "Gmusicbrowser is a highly customizable open-source jukebox
for managing and playing large collections of music files in mp3, ogg, flac,
and mpc formats.  It features a tabbed layout, queue management, album art,
playlist modes, filters, smart shuffle, and a customizable interface with
multiple layout options.")
    (home-page "https://github.com/squentin/gmusicbrowser")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. breeze-enhanced — enhanced KDE Breeze window decoration
;;; -------------------------------------------------------------------
(define-public breeze-enhanced
  (package
    (name "breeze-enhanced")
    (version "6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tsujan/BreezeEnhanced/archive/refs/tags/V"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list kdecoration kcmutils ki18n kguiaddons kwindowsystem
                  qtbase))
    (synopsis "KDE Breeze window decoration with configurable title bar gradient")
    (description "BreezeEnhanced is a fork of the KDE Breeze window decoration
theme that adds configurable title-bar background gradients, opacity settings,
and other visual enhancements.  It integrates with KDE Plasma 6 system
settings for easy customization.")
    (home-page "https://github.com/tsujan/BreezeEnhanced")
    (license license:gpl3)))
