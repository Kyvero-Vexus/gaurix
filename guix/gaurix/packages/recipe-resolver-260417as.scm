;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417as
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (21, including 1 sub-dependency):
;;;    1.  twitch-cli-bin (copy-build-system, v1.1.24, Apache-2.0)
;;;    2.  fast-bin (copy-build-system, v0.0.4, MIT)
;;;    3.  lux-dl-bin (copy-build-system, v0.24.1, MIT)
;;;    4.  cheat-bin (copy-build-system, v5.1.0, MIT)
;;;    5.  spoofdpi-bin (copy-build-system, v1.3.1, Apache-2.0)
;;;    6.  circleci-cli-bin (copy-build-system, v0.1.34950, MIT)
;;;    7.  reader-bin (copy-build-system, v0.5.0, GPL-3.0)
;;;    8.  tvmv-bin (copy-build-system, v0.6.0, GPL-3.0)
;;;    9.  python-exifread (pyproject-build-system, v3.5.1, BSD-3)
;;;   10.  python-colorzero (python-build-system, v2.0, BSD-3)
;;;   11.  python-simber (python-build-system, v0.2.6, MIT)
;;;   12.  python-ratelim (python-build-system, v0.1.6, MIT) [sub-dep]
;;;   13.  python-requirements-detector (pyproject-build-system, v1.5.0, MIT)
;;;   14.  python-itunespy (python-build-system, v1.6.1, MIT)
;;;   15.  python-geocoder (python-build-system, v1.38.1, MIT)
;;;   16.  python-vcstool (python-build-system, v0.3.0, Apache-2.0)
;;;   17.  python-pushbullet.py (python-build-system, v0.12.0, MIT)
;;;   18.  perl-mp3-tag (perl-build-system, v1.16, Artistic-1.0/GPL-1.0+)
;;;   19.  perl-expect (perl-build-system, v1.38, Artistic-1.0/GPL-1.0+)
;;;   20.  perl-rpc-xml (perl-build-system, v0.82, Artistic-1.0/GPL-1.0+)
;;;   21.  perl-linux-desktopfiles (perl-build-system, v0.26, Artistic-2.0)
;;;
;;; ALREADY_RESOLVED (10):
;;;   22.  ffsend-bin — already packaged in channel
;;;   23.  kopia-bin — already packaged in channel
;;;   24.  stack-bin — already packaged in channel
;;;   25.  perl-io-stty — already packaged in channel (recipe-resolver-260417aj)
;;;   26.  perl-crypt-rijndael — already in upstream Guix (gnu/packages/perl.scm)
;;;   27.  perl-extutils-xspp — already in upstream Guix (gnu/packages/perl.scm)
;;;   28.  perl-xml-dom — already in upstream Guix (gnu/packages/xml.scm)
;;;   29.  perl-env-path — already in upstream Guix (gnu/packages/perl.scm)
;;;   30.  perl-posix-strftime-compiler — already in upstream Guix (gnu/packages/perl.scm)
;;;   31.  ruby-archive-tar-minitar — already in upstream Guix as ruby-minitar
;;;
;;; 21 new recipes + 10 ALREADY_RESOLVED = 30 target packages resolved
;;; (python-ratelim is an additional sub-dependency)
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417as)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (
            twitch-cli-bin
            fast-bin
            lux-dl-bin
            cheat-bin
            spoofdpi-bin
            circleci-cli-bin
            reader-bin
            tvmv-bin
            python-exifread
            python-colorzero
            python-simber
            python-ratelim
            python-requirements-detector
            python-itunespy
            python-geocoder
            python-vcstool
            python-pushbullet.py
            perl-mp3-tag
            perl-expect
            perl-rpc-xml
            perl-linux-desktopfiles
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (pre-built binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. twitch-cli-bin — official Twitch CLI tool (pre-built)
;;; -------------------------------------------------------------------
(define-public twitch-cli-bin
  (package
    (name "twitch-cli-bin")
    (version "1.1.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/twitchdev/twitch-cli/releases/download/v"
                    version "/twitch-cli_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "13zd5qvnfam4a537msixm0l0lid4fqr3nqvbv96znrifsnf4xblw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("twitch-cli" "bin/twitch-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Official Twitch CLI for developing on Twitch")
    (description "Twitch CLI is the official command-line interface for the
Twitch platform, providing tools for managing and testing Twitch API
integrations, creating mock events, and streamlining Twitch extension
development workflows.")
    (home-page "https://github.com/twitchdev/twitch-cli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2. fast-bin — CLI speed test using fast.com (pre-built)
;;; -------------------------------------------------------------------
(define-public fast-bin
  (package
    (name "fast-bin")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddo/fast/releases/download/v"
                    version "/fast_linux_amd64"))
              (sha256
               (base32
                "1xlvz02gh5bwf5n3p78nr34d9sw9jrar38x4xxz6f3awq56rcx97"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fast" "bin/fast"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "fast")
              (chmod "fast" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minimal CLI for testing internet speed via fast.com")
    (description "Fast is a minimal, zero-dependency command-line utility for
testing internet download speed from the terminal using Netflix's fast.com
service.")
    (home-page "https://github.com/ddo/fast")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. lux-dl-bin — video download CLI tool (pre-built)
;;; -------------------------------------------------------------------
(define-public lux-dl-bin
  (package
    (name "lux-dl-bin")
    (version "0.24.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/iawia002/lux/releases/download/v"
                    version "/lux_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1r1f6w22xbajlmx4ch5svrfr18fspwmrc98yx4qf2js1ssr5pcww"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lux" "bin/lux"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Fast and simple video download library and CLI tool")
    (description "Lux is a fast and simple video download library and CLI tool
written in Go.  It supports downloading videos from a wide range of websites
and provides options for format selection and concurrent downloads.")
    (home-page "https://github.com/iawia002/lux")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. cheat-bin — interactive cheatsheets CLI (pre-built)
;;; -------------------------------------------------------------------
(define-public cheat-bin
  (package
    (name "cheat-bin")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cheat/cheat/releases/download/"
                    version "/cheat-linux-amd64.gz"))
              (sha256
               (base32
                "0d3v7minbgnwf31yay5gjrym13a73wjfvgwljpl3xmji9mbhb14c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cheat" "bin/cheat"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((gz-file (assoc-ref inputs "source")))
                (invoke "gzip" "-d" "-c" gz-file)
                (unless (file-exists? "cheat")
                  (call-with-output-file "cheat"
                    (lambda (out)
                      (call-with-input-file gz-file
                        (lambda (in)
                          (close-port out)
                          (invoke "sh" "-c"
                                  (string-append "gzip -d -c " gz-file
                                                 " > cheat")))))))
                (chmod "cheat" #o755)))))))
    (native-inputs (list gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Create and view interactive cheatsheets on the command-line")
    (description "Cheat allows you to create and view interactive cheatsheets
on the command-line.  It was designed to help remind system administrators of
options for commands that they use frequently but not frequently enough to
remember.")
    (home-page "https://github.com/cheat/cheat")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. spoofdpi-bin — anti-censorship tool (pre-built)
;;; -------------------------------------------------------------------
(define-public spoofdpi-bin
  (package
    (name "spoofdpi-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xvzc/SpoofDPI/releases/download/v"
                    version "/spoofdpi_" version
                    "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0bv7phvqplg1m3md85rw624mqx3406zd97cap8py9bfx697ba91k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("spoofdpi" "bin/spoofdpi"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Simple and fast anti-censorship tool")
    (description "SpoofDPI is a simple and fast anti-censorship tool written in
Go.  It works by modifying the TLS Client Hello packet to bypass deep packet
inspection without the overhead of a full VPN or proxy.")
    (home-page "https://github.com/xvzc/SpoofDPI")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. circleci-cli-bin — CircleCI command-line interface (pre-built)
;;; -------------------------------------------------------------------
(define-public circleci-cli-bin
  (package
    (name "circleci-cli-bin")
    (version "0.1.34950")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CircleCI-Public/circleci-cli/"
                    "releases/download/v" version
                    "/circleci-cli_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "1jd821csxf7lkinb1l06avm6nnhz9x86gh1ii0c75i8m6h5z8ajj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "circleci-cli_" #$version "_linux_amd64/circleci")
                    "bin/circleci"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Command-line interface for CircleCI")
    (description "The CircleCI CLI provides a command-line interface for
interacting with the CircleCI continuous integration platform.  It supports
validating configurations, running jobs locally, and managing orbs.")
    (home-page "https://github.com/CircleCI-Public/circleci-cli")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. reader-bin — minimal CLI reader for web pages (pre-built)
;;; -------------------------------------------------------------------
(define-public reader-bin
  (package
    (name "reader-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mrusme/reader/releases/download/v"
                    version "/reader_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "195krj554rxbajdz7dxhypqkqxr2kcq63pg17n98js8dpbqf1b97"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("reader" "bin/reader"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lightweight CLI tool for reading web pages in the terminal")
    (description "Reader is a lightweight command-line tool offering better
readability of web pages and EML email files on the terminal.  It extracts
the main content from web pages and renders it as clean, readable text.")
    (home-page "https://github.com/mrusme/reader")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. tvmv-bin — bulk-rename TV episode files (pre-built)
;;; -------------------------------------------------------------------
(define-public tvmv-bin
  (package
    (name "tvmv-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/keithfancher/tvmv/releases/download/"
                    version "/tvmv-" version "-linux64.tar.gz"))
              (sha256
               (base32
                "1fa8ylnzz2f69p6hk0jl2i4x9h8fjbx4rr2fjqbgwk9h88fnb76j"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tvmv" "bin/tvmv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bulk-rename TV episode files with minimal fuss")
    (description "Tvmv is a command-line tool for bulk-renaming TV episode
files.  It looks up episode information from online databases and renames
files to a consistent, organized naming scheme.")
    (home-page "https://github.com/keithfancher/tvmv")
    (license license:gpl3)))


;;; ===================================================================
;;; PYTHON / PYPROJECT BUILD SYSTEMS
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 9. python-exifread — EXIF data extraction from image files
;;; -------------------------------------------------------------------
(define-public python-exifread
  (package
    (name "python-exifread")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "exifread" version))
              (sha256
               (base32
                "1pdfnv271sw1456lx69p569l1g146h1zvi6zfv4l29q6sf08z6cz"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Library to extract EXIF data from image files")
    (description "ExifRead is a Python library for extracting EXIF metadata
from TIFF and JPEG image files.  It supports reading standard EXIF tags as
well as MakerNote data from various camera manufacturers.")
    (home-page "https://github.com/ianare/exif-py")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 10. python-colorzero — color manipulation library
;;; -------------------------------------------------------------------
(define-public python-colorzero
  (package
    (name "python-colorzero")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "colorzero" version))
              (sha256
               (base32
                "0n7bspwzi19dw68r2r9vb7w29pl8yc4wdvzbcjqkgp6hdk1abmg7"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Color manipulation library for Python")
    (description "Colorzero is a color manipulation library for Python
providing a @code{Color} class with methods for color conversion, arithmetic,
and comparison.  It supports RGB, HSV, HSL, and other color spaces.")
    (home-page "https://github.com/waveform80/colorzero")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. python-simber — simple minimal logging library
;;; -------------------------------------------------------------------
(define-public python-simber
  (package
    (name "python-simber")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "simber" version))
              (sha256
               (base32
                "0d8f18f8x37w945m42yg8ad90s2zpmhbbcrzhic9cphvhk56q1ph"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (propagated-inputs (list python-colorama))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Simple minimal logging library for Python")
    (description "Simber is a simple, minimal, and powerful logging library for
Python.  It provides colored log output and configurable log levels with a
straightforward API.")
    (home-page "https://github.com/deepjyoti30/simber")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-ratelim — rate limiting decorator (sub-dep of geocoder)
;;; -------------------------------------------------------------------
(define-public python-ratelim
  (package
    (name "python-ratelim")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ratelim" version))
              (sha256
               (base32
                "07dirdd8y23706110nb0lfz5pzbrcvd9y74h64la3y8igqbk4vc2"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (propagated-inputs (list python-decorator))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Rate-limiting decorator for Python functions")
    (description "Ratelim is a simple Python rate-limiting decorator that
ensures a function is not called more often than a specified interval.  It is
useful for throttling API requests and similar tasks.")
    (home-page "https://github.com/themiurgo/ratelim")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-requirements-detector — Python requirements finder
;;; -------------------------------------------------------------------
(define-public python-requirements-detector
  (package
    (name "python-requirements-detector")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "requirements_detector" version))
              (sha256
               (base32
                "1gnv8sca08dw4sr9iiwr34rksck1ilj6c8g0h4yf7d0s7jkibbj9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f)) ;tests require network access
    (native-inputs (list python-poetry-core))
    (propagated-inputs
     (list python-astroid
           python-packaging
           python-semver))
    (synopsis "Tool to find and list requirements of a Python project")
    (description "Requirements-detector is a Python tool that finds and lists
the requirements of a Python project by inspecting @file{setup.py},
@file{requirements.txt}, @file{pyproject.toml}, and other standard files.")
    (home-page "https://github.com/landscapeio/requirements-detector")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. python-itunespy — iTunes Store API client
;;; -------------------------------------------------------------------
(define-public python-itunespy
  (package
    (name "python-itunespy")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "itunespy" version))
              (sha256
               (base32
                "18q3f9ailr0rb611wj3w7331ghhs0c6dzfk17j6rnxhpxyx4i1sj"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (propagated-inputs
     (list python-requests
           python-pycountry))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Simple library to fetch data from the iTunes Store API")
    (description "Itunespy is a simple Python library for fetching data from
the iTunes Store API.  It provides methods for searching and looking up
content including music, apps, movies, and other media available on the
iTunes Store.")
    (home-page "https://github.com/sleepyfran/itunespy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. python-geocoder — simple and consistent geocoding library
;;; -------------------------------------------------------------------
(define-public python-geocoder
  (package
    (name "python-geocoder")
    (version "1.38.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "geocoder" version))
              (sha256
               (base32
                "1rvpgapvwxhclw6g04gh2gcp26gaz3k0jfs0xq57smv1r5s574n9"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;tests require network access
    (propagated-inputs
     (list python-click
           python-future
           python-ratelim
           python-requests
           python-six))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Simple and consistent geocoding library for Python")
    (description "Geocoder is a simple and consistent geocoding library for
Python.  It provides a unified API for multiple geocoding providers including
Google, Bing, OpenStreetMap, and others, with forward and reverse geocoding
support.")
    (home-page "https://github.com/DenisCarriere/geocoder")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. python-vcstool — multi-repository VCS tool
;;; -------------------------------------------------------------------
(define-public python-vcstool
  (package
    (name "python-vcstool")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "vcstool" version))
              (sha256
               (base32
                "0b7f68q25x9nxqa3xcg32js3qgp4jg99anwy2c7nd1jkw5iskcq4"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;tests require VCS backends
    (propagated-inputs
     (list python-pyyaml
           python-setuptools))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Tool to invoke VCS commands on multiple repositories")
    (description "Vcstool provides a command-line tool to invoke version control
system commands on multiple repositories.  It supports Git, Mercurial,
Subversion, and Bazaar backends and uses a YAML-based repository list format.")
    (home-page "https://github.com/dirk-thomas/vcstool")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 17. python-pushbullet.py — simple Pushbullet client
;;; -------------------------------------------------------------------
(define-public python-pushbullet.py
  (package
    (name "python-pushbullet.py")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pushbullet.py" version))
              (sha256
               (base32
                "0r5fwm9hz8fg9da8dh411bzbhgi4w28v6xk0wjf9f32amzhq6y4i"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f)) ;no test suite in sdist
    (propagated-inputs
     (list python-requests
           python-magic
           python-websocket-client))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Simple Python client for pushbullet.com")
    (description "Pushbullet.py is a simple Python client for the Pushbullet
service.  It provides an API for sending pushes, managing devices, and
receiving real-time notifications via websocket connections.")
    (home-page "https://github.com/rbrcsk/pushbullet.py")
    (license license:expat)))


;;; ===================================================================
;;; PERL-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 18. perl-mp3-tag — MP3 audio file tag reader/writer
;;; -------------------------------------------------------------------
(define-public perl-mp3-tag
  (package
    (name "perl-mp3-tag")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/I/IL/ILYAZ/modules/"
                    "MP3-Tag-" version ".zip"))
              (sha256
               (base32
                "11kv6ylpbq552nziwphwgjbra8bfm40a9dib4sy5c01hma9m0f2h"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f)) ;tests require audio fixtures
    (native-inputs (list unzip))
    (synopsis "Module for reading and writing tags of MP3 audio files")
    (description "MP3::Tag is a Perl module for reading and manipulating tags
of MP3 audio files.  It supports ID3v1, ID3v2, APE tags, and Lyrics3
formats, providing a unified interface for accessing audio file metadata.")
    (home-page "https://metacpan.org/dist/MP3-Tag")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 19. perl-expect — automate CLI terminal interactions
;;; -------------------------------------------------------------------
(define-public perl-expect
  (package
    (name "perl-expect")
    (version "1.38")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/J/JA/JACOBY/"
                    "Expect-" version ".tar.gz"))
              (sha256
               (base32
                "1h462sr5vwp6q901pbmg9rzs0bh7viws1kk77285hy9jbwrlh43v"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f)) ;tests require a real terminal
    (propagated-inputs (list perl-io-tty))
    (synopsis "Automate interactions with command line programs")
    (description "Expect is a Perl module for automating interactions with
command line programs that expose a text terminal interface.  It provides
pattern matching and timeout capabilities for driving interactive programs
programmatically.")
    (home-page "https://metacpan.org/dist/Expect")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 20. perl-rpc-xml — XML-RPC data, client, and server classes
;;; -------------------------------------------------------------------
(define-public perl-rpc-xml
  (package
    (name "perl-rpc-xml")
    (version "0.82")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RJ/RJRAY/"
                    "RPC-XML-" version ".tar.gz"))
              (sha256
               (base32
                "0wwffn9bvny5a9p61ckzk55m083gmlx4r4znjzw3ylvc2c6ynyaj"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f)) ;tests require network access
    (propagated-inputs
     (list perl-http-daemon
           perl-http-message
           perl-libwww
           perl-xml-parser))
    (synopsis "Data, client, and server classes for XML-RPC")
    (description "RPC::XML is a Perl module providing a set of classes for
core data, message, client, and server for the XML-RPC protocol.  It
implements the complete XML-RPC specification for building distributed
applications.")
    (home-page "https://metacpan.org/dist/RPC-XML")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 21. perl-linux-desktopfiles — fast Linux desktop file parser
;;; -------------------------------------------------------------------
(define-public perl-linux-desktopfiles
  (package
    (name "perl-linux-desktopfiles")
    (version "0.26")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/T/TR/TRIZEN/"
                    "Linux-DesktopFiles-" version ".tar.gz"))
              (sha256
               (base32
                "1j58k5ldjs9c72934dj2plgkr1mrbrp73028j2wnzi8gpdcsp7am"))))
    (build-system perl-build-system)
    (native-inputs (list perl-module-build))
    (synopsis "Fast parser for Linux desktop entry files")
    (description "Linux::DesktopFiles is a fast Perl module for parsing Linux
desktop entry files (@file{.desktop} files).  It uses an XS (C) backend for
performance and provides methods for reading, filtering, and iterating over
desktop entries.")
    (home-page "https://metacpan.org/dist/Linux-DesktopFiles")
    (license license:artistic2.0)))
