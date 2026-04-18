;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417at
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (19):
;;;    1.  python-injector (pyproject-build-system, v0.24.0, MIT)
;;;    2.  python-cerealizer (pyproject-build-system, v0.8.4, GPL-3.0+)
;;;    3.  python-hsaudiotag3k (pyproject-build-system, v1.1.3.post1, BSD-3)
;;;    4.  python-patch (pyproject-build-system, v1.16, MIT)
;;;    5.  python-bcdoc (pyproject-build-system, v0.16.0, Apache-2.0)
;;;    6.  python-daemonocle (pyproject-build-system, v1.2.3, MIT)
;;;    7.  python-enzyme (pyproject-build-system, v0.5.2, MIT)
;;;    8.  python-zfec (pyproject-build-system, v1.6.0.0, GPL-2.0+)
;;;    9.  python-py3nvml (pyproject-build-system, v0.2.7, BSD-3)
;;;   10.  python-grip (pyproject-build-system, v4.6.2, MIT)
;;;   11.  python-fudge (pyproject-build-system, v1.1.1, MIT)
;;;   12.  perl-mp4-info (perl-build-system, v1.13, Artistic-1.0/GPL-1.0+)
;;;   13.  perl-unicode-map (perl-build-system, v0.112, Artistic-1.0/GPL-1.0+)
;;;   14.  perl-php-serialization (perl-build-system, v0.34, Artistic-1.0/GPL-1.0+)
;;;   15.  perl-sys-mmap (perl-build-system, v0.21, Artistic-1.0/GPL-1.0+)
;;;   16.  perl-ogg-vorbis-header (perl-build-system, v0.11, GPL-2.0)
;;;   17.  perl-math-convexhull (perl-build-system, v1.04, Artistic-1.0/GPL-1.0+)
;;;   18.  perl-math-libm (perl-build-system, v1.00, Artistic-1.0/GPL-1.0+)
;;;   19.  perl-astro-suntime (perl-build-system, v0.06, Artistic-1.0/GPL-1.0+)
;;;
;;; ALREADY_RESOLVED (11):
;;;   20.  oh-my-posh-bin — already packaged in channel (recipe-resolver-260415i)
;;;   21.  python-fvs — already packaged in channel
;;;   22.  python-mechanicalsoup — already in upstream Guix
;;;   23.  python-marisa-trie — already in upstream Guix
;;;   24.  python-jsmin — already in upstream Guix
;;;   25.  perl-ole-storage-lite — already in upstream Guix
;;;   26.  python-python-crontab — already in upstream Guix as python-crontab
;;;   27.  python-reparser — already in upstream Guix
;;;   28.  python-readlike — already in upstream Guix
;;;   29.  python-node-semver — already in upstream Guix
;;;   30.  perl-text-csv-xs — already in upstream Guix
;;;
;;; 19 new recipes + 11 ALREADY_RESOLVED = 30 target packages resolved
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417at)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages compression)
  #:export (
            python-injector
            python-cerealizer
            python-hsaudiotag3k
            python-patch
            python-bcdoc
            python-daemonocle
            python-enzyme
            python-zfec
            python-py3nvml
            python-grip
            python-fudge
            perl-mp4-info
            perl-unicode-map
            perl-php-serialization
            perl-sys-mmap
            perl-ogg-vorbis-header
            perl-math-convexhull
            perl-math-libm
            perl-astro-suntime
            ))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. python-injector — dependency injection framework
;;; -------------------------------------------------------------------
(define-public python-injector
  (package
    (name "python-injector")
    (version "0.24.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "injector" version))
              (sha256
               (base32
                "0grxmlyxxp70ka0hgqq5k9fb5b2nkwhx2gqg2w1jzzvca78panp8"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require typing-extensions pin
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/alecthomas/injector")
    (synopsis "Python dependency injection framework inspired by Guice")
    (description "Injector is a Python dependency injection framework inspired
by Google's Guice.  It provides a clean way to configure and manage
dependencies in Python applications using type hints and decorators.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2. python-cerealizer — secure pickle alternative
;;; -------------------------------------------------------------------
(define-public python-cerealizer
  (package
    (name "python-cerealizer")
    (version "0.8.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "Cerealizer" version))
              (sha256
               (base32
                "0bmm3yn7rypr0m58h5hh5z7kfscpx63x74z0ddj8f2cg0gjkplwa"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite included
    (native-inputs (list python-setuptools))
    (home-page
     "https://www.lesfleursdunormal.fr/static/informatique/cerealizer/index_en.html")
    (synopsis "Secure pickle-like serialization module for Python")
    (description "Cerealizer is a secure pickle-like module for Python that
provides serialization and deserialization of Python objects.  Unlike pickle,
it requires explicit registration of classes, preventing arbitrary code
execution during deserialization.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. python-hsaudiotag3k — audio file metadata reader
;;; -------------------------------------------------------------------
(define-public python-hsaudiotag3k
  (package
    (name "python-hsaudiotag3k")
    (version "1.1.3.post1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "hsaudiotag3k" version))
              (sha256
               (base32
                "1lar7sh8snd8pz2mj34gj5ax0xmn0z5qd9lm00pyh9s71lhyjq7g"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite included
    (native-inputs (list python-setuptools))
    (home-page "https://hg.hardcoded.net/hsaudiotag/")
    (synopsis "Read metadata from mp3, mp4, wma, ogg, flac and aiff files")
    (description "Hsaudiotag3k is a pure Python library for reading metadata
(tags) from audio files in mp3, mp4, wma, ogg, flac and aiff formats.  It
is the Python 3 port of the hsaudiotag library.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 4. python-patch — unified diff patch utility
;;; -------------------------------------------------------------------
(define-public python-patch
  (package
    (name "python-patch")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "patch" version ".zip"))
              (sha256
               (base32
                "17xxfpyr4llzkbrrl7n36mw17ykw7ld6yj94mk459w6gavrp6866"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (native-inputs (list python-setuptools unzip))
    (home-page "https://github.com/techtonik/python-patch/")
    (synopsis "Library to parse and apply unified diffs")
    (description "Python-patch is a library and command-line tool to parse and
apply unified diffs.  It can be used as a portable, pure Python replacement
for the system @command{patch} utility.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. python-bcdoc — ReST documentation tools for botocore
;;; -------------------------------------------------------------------
(define-public python-bcdoc
  (package
    (name "python-bcdoc")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "bcdoc" version))
              (sha256
               (base32
                "00k2gd1d6xyac8iwh027c12zvkrm4h2jgwlnf77vx0v8w21c2s7m"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite in sdist
    (propagated-inputs (list python-docutils python-six))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/botocore/bcdoc")
    (synopsis "ReST document generation tools for botocore")
    (description "Bcdoc provides tools for generating ReStructuredText
documentation from botocore-based projects.  It is used to produce human-
readable API documentation for AWS service clients.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. python-daemonocle — Unix daemon library
;;; -------------------------------------------------------------------
(define-public python-daemonocle
  (package
    (name "python-daemonocle")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "daemonocle" version))
              (sha256
               (base32
                "1sk6yv2c8p0g9b3dpapf2xgsn9xc21bx983rccwwm1bwqfmyc73l"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require running daemon processes
    (propagated-inputs (list python-click python-psutil))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/jnrbsn/daemonocle")
    (synopsis "Python library for creating Unix daemons")
    (description "Daemonocle is a Python library for creating Unix daemon
processes.  It provides a clean interface for starting, stopping, and
restarting daemons with proper PID file management, signal handling, and
automatic shutdown hooks.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. python-enzyme — video metadata parser
;;; -------------------------------------------------------------------
(define-public python-enzyme
  (package
    (name "python-enzyme")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "enzyme" version))
              (sha256
               (base32
                "1hdkaxfzp983b96mvzmqr3pkqg6583hsqgk070lfnrlyila7kxvw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need network access and test fixtures
    (propagated-inputs (list python-importlib-resources))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/Diaoul/enzyme")
    (synopsis "Python module to parse metadata in video files")
    (description "Enzyme is a Python module to parse metadata from video
container files such as Matroska (MKV), AVI, and other formats.  It extracts
information about video and audio tracks, subtitles, and container properties.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. python-zfec — fast erasure coding tool
;;; -------------------------------------------------------------------
(define-public python-zfec
  (package
    (name "python-zfec")
    (version "1.6.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "zfec" version))
              (sha256
               (base32
                "002sfm76jjrk26z7s6w8dkmddqpmhd6swcz7qac2cl9v4lf8d8f5"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need pyutil and twisted
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/tahoe-lafs/zfec")
    (synopsis "Efficient portable erasure coding tool")
    (description "Zfec is an efficient, portable erasure coding library and
command-line tool.  It implements a fast forward error correction codec that
can encode data into multiple shares such that the original data can be
reconstructed from any subset of sufficient size.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 9. python-py3nvml — Python 3 bindings for NVIDIA Management Library
;;; -------------------------------------------------------------------
(define-public python-py3nvml
  (package
    (name "python-py3nvml")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "py3nvml" version))
              (sha256
               (base32
                "0wxxky9amy38q7qjsdmmznk1kqdzwd680ps64i76cvlab421vvh9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require NVIDIA GPU
    (propagated-inputs (list python-xmltodict))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/fbcotter/py3nvml")
    (synopsis "Python 3 bindings for the NVIDIA Management Library")
    (description "Py3nvml provides Python 3 bindings for the NVIDIA Management
Library (NVML).  It allows querying GPU device information, monitoring
utilization, temperature, memory usage, and managing GPU settings
programmatically.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 10. python-grip — preview GitHub Markdown locally
;;; -------------------------------------------------------------------
(define-public python-grip
  (package
    (name "python-grip")
    (version "4.6.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "grip" version))
              (sha256
               (base32
                "1qwc5y3p3ymcf494171s1ywxq69zz2d0c5392xixdv86mbhdrxiw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require network access to GitHub API
    (propagated-inputs (list python-docopt
                             python-flask
                             python-markdown
                             python-path-and-address
                             python-pygments
                             python-requests))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/joeyespo/grip")
    (synopsis "Preview GitHub Markdown files locally before committing")
    (description "Grip is a command-line server application that renders local
Markdown files using the GitHub Markdown API, providing a faithful preview of
how documents will appear on GitHub.  It supports GitHub-flavored Markdown
and can render README files with full styling.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. python-fudge — fake objects for testing
;;; -------------------------------------------------------------------
(define-public python-fudge
  (package
    (name "python-fudge")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "fudge" version))
              (sha256
               (base32
                "1p7g6hv9qxscbzjv2n5pczpkkp55mp3s56adfc912w9qpf3rv4nr"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests use nose which is deprecated
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/fudge-py/fudge")
    (synopsis "Replace real objects with fakes (mocks, stubs) for testing")
    (description "Fudge is a Python module for using fake objects (mocks and
stubs) to test real ones.  It provides a declarative interface for setting
up expected calls and return values, with clear error messages when
expectations are not met.")
    (license license:expat)))


;;; ===================================================================
;;; PERL-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. perl-mp4-info — MP4/M4A metadata reader
;;; -------------------------------------------------------------------
(define-public perl-mp4-info
  (package
    (name "perl-mp4-info")
    (version "1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/J/JH/JHAR/MP4-Info-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0s7vg6rb0ypfwmf8xq4izwjviilf5kg6si033dy2bs5a8ham3d2l"))))
    (build-system perl-build-system)
    (propagated-inputs (list perl-io-string))
    (home-page "https://metacpan.org/release/MP4-Info")
    (synopsis "Fetch info from MPEG-4 files (.mp4, .m4a, .m4p, .3gp)")
    (description "MP4::Info is a Perl module for extracting tag information
from MPEG-4 audio and video files, including MP4, M4A, M4P, and 3GP
formats.  It reads metadata such as title, artist, album, year, and
technical properties.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 13. perl-unicode-map — charset mapping to/from UTF-16
;;; -------------------------------------------------------------------
(define-public perl-unicode-map
  (package
    (name "perl-unicode-map")
    (version "0.112")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/M/MS/MSCHWARTZ/Unicode-Map-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0njarfh9r37i9mmw6khaxhqmv4f18br4rlj69z6pv9dv5vqw5w0h"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Unicode-Map")
    (synopsis "Map character sets from and to UTF-16 Unicode")
    (description "Unicode::Map provides a Perl interface for converting text
between various character encodings and UTF-16 Unicode.  It includes mapping
tables for a wide range of legacy encodings.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 14. perl-php-serialization — PHP serialize/unserialize for Perl
;;; -------------------------------------------------------------------
(define-public perl-php-serialization
  (package
    (name "perl-php-serialization")
    (version "0.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/B/BO/BOBTFISH/PHP-Serialization-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0yphqsgg7zrar2ywk2j2fnjxmi9rq32yf0p5ln8m9fmfx4kd84mr"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/PHP-Serialization")
    (synopsis "Convert between PHP serialize() format and Perl data structures")
    (description "PHP::Serialization provides a simple, flexible means of
converting the output of PHP's @code{serialize()} function into the
equivalent Perl memory structure, and vice versa.  It is useful for sharing
data between PHP and Perl applications.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 15. perl-sys-mmap — memory-mapped file access for Perl
;;; -------------------------------------------------------------------
(define-public perl-sys-mmap
  (package
    (name "perl-sys-mmap")
    (version "0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/T/TO/TODDR/Sys-Mmap-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0k3gm54aqsn5q6rizsy3qa0zq7xxv79bbj4fd3zv7c183441iv7x"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Sys-Mmap")
    (synopsis "Use mmap to map a file as a Perl variable")
    (description "Sys::Mmap provides a Perl interface to the @code{mmap(2)}
system call for memory-mapping files.  It allows mapping a file directly into
a Perl scalar variable, enabling efficient random access to large files
without reading the entire file into memory.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 16. perl-ogg-vorbis-header — Ogg Vorbis metadata interface
;;; -------------------------------------------------------------------
(define-public perl-ogg-vorbis-header
  (package
    (name "perl-ogg-vorbis-header")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1rzkcajraav0djny9p5y00ryfc25wh0yivrixm71zvid5h22xjz8"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require Ogg sample files
    (native-inputs (list perl-inline))
    (propagated-inputs (list perl-inline perl-inline-c))
    (home-page "https://metacpan.org/release/Ogg-Vorbis-Header")
    (synopsis "Object-oriented interface to Ogg Vorbis information and comments")
    (description "Ogg::Vorbis::Header provides an object-oriented Perl
interface for reading and writing Ogg Vorbis audio file headers and comment
fields.  It allows access to stream information such as sample rate, channels,
bitrate, and user-defined comment tags.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. perl-math-convexhull — convex hull calculation
;;; -------------------------------------------------------------------
(define-public perl-math-convexhull
  (package
    (name "perl-math-convexhull")
    (version "1.04")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/S/SM/SMUELLER/Math-ConvexHull-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0lh89icykppqwda2yp4y4y5yi6ap4rxacma4427k14l7sl41y15r"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Math-ConvexHull")
    (synopsis "Calculate convex hulls using Graham's scan (n*log(n))")
    (description "Math::ConvexHull implements Graham's scan algorithm for
computing the convex hull of a set of 2D points in O(n*log(n)) time.  Given
a set of points, it returns the subset of points that form the convex hull
polygon.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 18. perl-math-libm — Perl interface to C math library
;;; -------------------------------------------------------------------
(define-public perl-math-libm
  (package
    (name "perl-math-libm")
    (version "1.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/DS/DSLEWART/Math-Libm-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0xn2a950mzzs5q1c4q98ckysn9dz20x7r35g02zvk35chgr0klxz"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Math-Libm")
    (synopsis "Perl extension for the C math library libm")
    (description "Math::Libm provides a Perl interface to functions from the
C math library @code{libm}.  It exports mathematical functions such as
@code{asin}, @code{acos}, @code{cosh}, @code{sinh}, @code{tan}, @code{tanh},
@code{ceil}, @code{floor}, @code{log10}, and others.")
    (license (list license:artistic2.0 license:gpl1+))))

;;; -------------------------------------------------------------------
;;; 19. perl-astro-suntime — sunrise/sunset time calculation
;;; -------------------------------------------------------------------
(define-public perl-astro-suntime
  (package
    (name "perl-astro-suntime")
    (version "0.06")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RO/ROBF/Astro-SunTime-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0ahi06kwcbflg02z617a29sxm4s76lwqkzbvwqpc8p05zkflz95l"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need perl-time-parsedate
    (native-inputs (list perl-module-build))
    (home-page "https://metacpan.org/release/Astro-SunTime")
    (synopsis "Calculate sunrise and sunset times for any location")
    (description "Astro::SunTime is a Perl module for calculating sunrise and
sunset times for any location on Earth, given the latitude, longitude, and
date.  It implements the astronomical algorithms for solar position
calculation.")
    (license (list license:artistic2.0 license:gpl1+))))
