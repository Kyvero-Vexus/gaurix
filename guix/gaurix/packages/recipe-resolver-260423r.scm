;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (30):
;;;        1.  amaranth-font (font-build-system, v1.0.0, OFL-1.1)
;;;        2.  ttf-everson-mono (font-build-system, v7.0.1b, custom)
;;;        3.  ttf-atarismall (font-build-system, v2.2, custom)
;;;        4.  ttf-spectralsc (font-build-system, v2.005, OFL-1.1)
;;;        5.  otf-spectralsc (font-build-system, v2.005, OFL-1.1)
;;;        6.  ttf-impallari-dancing-script (font-build-system, v3.000, OFL-1.1)
;;;        7.  ttf-impallari-dosis (font-build-system, v1.9, OFL-1.1)
;;;        8.  profont-otb (font-build-system, v1.0.1, MIT)
;;;        9.  otf-xcharter (font-build-system, v1.26, LPPL-1.3c)
;;;       10.  ttf-gidole (font-build-system, v0.7, OFL-1.1)
;;;       11.  python-paginate (pyproject-build-system, v0.5.7, MIT)
;;;       12.  python-single-version (pyproject-build-system, v1.6.0, MIT)
;;;       13.  python-deluge-client (pyproject-build-system, v1.10.2, MIT)
;;;       14.  python-rtf-tokenize (pyproject-build-system, v1.0.1, GPL-2.0+)
;;;       15.  python-simplematch (pyproject-build-system, v1.4, MIT)
;;;       16.  python-simplepush (pyproject-build-system, v2.2.4, MIT)
;;;       17.  python-simple-pid (pyproject-build-system, v2.0.1, MIT)
;;;       18.  python-nameparser (pyproject-build-system, v1.1.3, LGPL-2.1+)
;;;       19.  python-ntplib (pyproject-build-system, v0.4.0, MIT)
;;;       20.  python-xerox (pyproject-build-system, v0.4.1, MIT)
;;;       21.  termsaver (pyproject-build-system, v0.5.1, GPL-3.0+)
;;;       22.  con2fbmap (gnu-build-system, v2.1.0, GPL-2.0+)
;;;       23.  grits-formatter (gnu-build-system, v0.3.0, MIT)
;;;       24.  gitnapped (pyproject-build-system, v0.1.4, AGPL-3.0)
;;;       25.  gentoo-color-bash (copy-build-system, v2025.08.18, GPL-2.0+)
;;;       26.  galette (gnu-build-system, v0.1, MIT)
;;;       27.  althttpd (gnu-build-system, v2024.11.14, public-domain)
;;;       28.  gscreenshot (pyproject-build-system, v3.11.1, GPL-2.0+)
;;;       29.  bootchart2 (gnu-build-system, v0.14.9, GPL-3.0+)
;;;       30.  mkaudiocdrimg (gnu-build-system, v1.2.1, AGPL-3.0+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            amaranth-font
            ttf-everson-mono
            ttf-atarismall
            ttf-spectralsc
            otf-spectralsc
            ttf-impallari-dancing-script
            ttf-impallari-dosis
            profont-otb
            otf-xcharter
            ttf-gidole
            python-paginate
            python-single-version
            python-deluge-client
            python-rtf-tokenize
            python-simplematch
            python-simplepush
            python-simple-pid
            python-nameparser
            python-ntplib
            python-xerox
            termsaver
            con2fbmap
            grits-formatter
            gitnapped
            gentoo-color-bash
            galette
            althttpd
            gscreenshot
            bootchart2
            mkaudiocdrimg
            ))

;;; -------------------------------------------------------------------
;;; 1. amaranth-font --- friendly upright italic typeface
;;; -------------------------------------------------------------------
(define-public amaranth-font
  (package
    (name "amaranth-font")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasjross/Amaranth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "friendly upright italic typeface")
    (description "Amaranth is a friendly upright italic design with a slight
contrast and distinctive curves.  Designed for Google Fonts by Gesine Todt.")
    (home-page "https://fonts.google.com/specimen/Amaranth")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. ttf-everson-mono --- simple, elegant, monowidth font
;;; -------------------------------------------------------------------
(define-public ttf-everson-mono
  (package
    (name "ttf-everson-mono")
    (version "7.0.1b")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.evertype.com/emono/EversonMono-"
                                  version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "simple, elegant, monowidth font")
    (description "Everson Mono is a simple, elegant, monowidth font with wide
Unicode coverage.  It is designed by Michael Everson and covers many scripts
and symbol blocks.")
    (home-page "https://www.evertype.com/emono/")
    (license (license:non-copyleft
              "https://www.evertype.com/emono/licence.html"
              "Everson Mono font license"))))

;;; -------------------------------------------------------------------
;;; 3. ttf-atarismall --- very small 4x8 font for Atari 800
;;; -------------------------------------------------------------------
(define-public ttf-atarismall
  (package
    (name "ttf-atarismall")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.aiei.ch/atari/atarismall-"
                                  version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "very small 4x8 font for Atari 800 terminal emulator")
    (description "Atarismall is a very small 4x8 pixel font, originally
designed for the Atari 800 terminal emulator.  Useful for maximizing
screen real estate on small displays.")
    (home-page "http://www.aiei.ch/atari/")
    (license (license:non-copyleft
              "http://www.aiei.ch/atari/"
              "Atarismall font license"))))

;;; -------------------------------------------------------------------
;;; 4. ttf-spectralsc --- screen-first serif font face (small caps, TTF)
;;; -------------------------------------------------------------------
(define-public ttf-spectralsc
  (package
    (name "ttf-spectralsc")
    (version "2.005")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasjross/Spectral")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((dir (string-append (assoc-ref outputs "out")
                                             "/share/fonts/truetype")))
                     (mkdir-p dir)
                     (for-each (lambda (f)
                                 (install-file f dir))
                               (find-files "." "SpectralSC.*\\.ttf$"))))))))
    (synopsis "screen-first serif font face (small caps, TTF)")
    (description "Spectral SC is the small caps variant of the Spectral font
family.  It is a screen-first serif typeface designed for comfortable reading
at small and medium sizes.  Designed by Production Type for Google Fonts.")
    (home-page "https://fonts.google.com/specimen/Spectral+SC")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 5. otf-spectralsc --- screen-first serif font face (small caps, OTF)
;;; -------------------------------------------------------------------
(define-public otf-spectralsc
  (package
    (inherit ttf-spectralsc)
    (name "otf-spectralsc")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((dir (string-append (assoc-ref outputs "out")
                                             "/share/fonts/opentype")))
                     (mkdir-p dir)
                     (for-each (lambda (f)
                                 (install-file f dir))
                               (find-files "." "SpectralSC.*\\.otf$"))))))))
    (synopsis "screen-first serif font face (small caps, OTF)")
    (description "Spectral SC is the small caps variant of the Spectral font
family in OpenType format.  It is a screen-first serif typeface designed for
comfortable reading at small and medium sizes.  Designed by Production Type
for Google Fonts.")
    (home-page "https://fonts.google.com/specimen/Spectral+SC")))

;;; -------------------------------------------------------------------
;;; 6. ttf-impallari-dancing-script --- lively casual script font
;;; -------------------------------------------------------------------
(define-public ttf-impallari-dancing-script
  (package
    (name "ttf-impallari-dancing-script")
    (version "3.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/impallari/DancingScript")
                    (commit "b845ea7ee0710cd3b72e87cc67e4b16079d3a643")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "lively casual script font by Pablo Impallari")
    (description "Dancing Script is a lively casual script where the letters
bounce and change size slightly.  Capitals are big, and go below the
baseline.  Designed by Pablo Impallari.")
    (home-page "https://github.com/impallari/DancingScript")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 7. ttf-impallari-dosis --- simple, rounded, sans serif font
;;; -------------------------------------------------------------------
(define-public ttf-impallari-dosis
  (package
    (name "ttf-impallari-dosis")
    (version "1.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/impallari/Dosis")
                    (commit "2c73691d54cdbb3ad39bd21d0e62fc7d2d362b93")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "simple, rounded, sans serif font by Pablo Impallari")
    (description "Dosis is a very simple, rounded, sans serif font family.
It has seven weights and is well suited for display and body text.  Designed
by Pablo Impallari and Edgar Tolentino.")
    (home-page "https://github.com/impallari/Dosis")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 8. profont-otb --- small bitmap font for programming (OTB)
;;; -------------------------------------------------------------------
(define-public profont-otb
  (package
    (name "profont-otb")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tobiasjung.name/downloadfile.php?"
                                  "file=profont-otb-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "small bitmap font for programming (OTB format)")
    (description "ProFont is a small, crisp bitmap font designed for
programming.  It is highly legible at small sizes and optimized for code
readability.  This package provides the OpenType Bitmap (OTB) version.")
    (home-page "https://tobiasjung.name/profont/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. otf-xcharter --- extension of Bitstream Charter (OTF)
;;; -------------------------------------------------------------------
(define-public otf-xcharter
  (package
    (name "otf-xcharter")
    (version "1.26")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mirrors.ctan.org/fonts/xcharter.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((dir (string-append (assoc-ref outputs "out")
                                             "/share/fonts/opentype")))
                     (mkdir-p dir)
                     (for-each (lambda (f)
                                 (install-file f dir))
                               (find-files "." "\\.otf$"))))))))
    (synopsis "extension of Bitstream Charter with small caps and old-style figures")
    (description "XCharter is an extension of Bitstream Charter, providing
small caps, oldstyle figures and superior figures in all four styles.  It also
includes Cyrillic and Greek coverage.")
    (home-page "https://www.ctan.org/pkg/xcharter")
    (license license:lppl1.3c)))

;;; -------------------------------------------------------------------
;;; 10. ttf-gidole --- open source modern DIN typeface
;;; -------------------------------------------------------------------
(define-public ttf-gidole
  (package
    (name "ttf-gidole")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasjross/Gidole-Nerd-Font/releases/download/v1.0/GidoleFont.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "open source modern DIN typeface")
    (description "Gidole is an open source modern DIN typeface.  It is
designed to be clean, geometric, and highly legible for both display and body
text applications.")
    (home-page "https://gidole.github.io/")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 11. python-paginate --- simple Python pagination module
;;; -------------------------------------------------------------------
(define-public python-paginate
  (package
    (name "python-paginate")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "paginate" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple Python pagination module")
    (description "Paginate is a Python module that splits any kind of sequence
or collection into individual pages for display.  It provides a @code{Page}
class that can be iterated over and queried for pagination metadata.")
    (home-page "https://github.com/Signum/paginate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-single-version --- version string utility for Poetry projects
;;; -------------------------------------------------------------------
(define-public python-single-version
  (package
    (name "python-single-version")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "single_version" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "version string utility for Poetry-style Python projects")
    (description "Single-version is a small utility to define version strings
for Poetry-style Python projects.  It reads the version from the installed
package metadata, allowing a single source of truth for the version number.")
    (home-page "https://github.com/hongquan/single-version")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-deluge-client --- simple Python Deluge RPC client
;;; -------------------------------------------------------------------
(define-public python-deluge-client
  (package
    (name "python-deluge-client")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "deluge-client" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple Python client for the Deluge BitTorrent daemon")
    (description "Deluge-client is a lightweight Python library for
communicating with the Deluge BitTorrent daemon via its RPC protocol.  It
supports both the old and new RPC protocols.")
    (home-page "https://github.com/JohnDoee/deluge-client")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. python-rtf-tokenize --- simple RTF tokenizer for Python
;;; -------------------------------------------------------------------
(define-public python-rtf-tokenize
  (package
    (name "python-rtf-tokenize")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rtf_tokenize" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple RTF tokenizer for Python")
    (description "Rtf-tokenize is a simple Python package for tokenizing RTF
(Rich Text Format) documents.  It breaks RTF content into tokens for further
processing or conversion.")
    (home-page "https://github.com/benoit-pierre/rtf_tokenize")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. python-simplematch --- minimal string pattern matching for Python
;;; -------------------------------------------------------------------
(define-public python-simplematch
  (package
    (name "python-simplematch")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "simplematch" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minimal, readable string pattern matching for Python")
    (description "Simplematch provides minimal, super readable string pattern
matching for Python.  It uses a simple @code{@{name@}} placeholder syntax to
match and extract parts of strings.")
    (home-page "https://github.com/tfeldmann/simplematch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. python-simplepush --- Python library for simplepush.io
;;; -------------------------------------------------------------------
(define-public python-simplepush
  (package
    (name "python-simplepush")
    (version "2.2.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "simplepush" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python library for simplepush.io push notifications")
    (description "Simplepush is a Python library for sending push
notifications via the simplepush.io service.  It provides a simple API for
sending encrypted and unencrypted push messages to mobile devices.")
    (home-page "https://github.com/simplepush/simplepush-python")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. python-simple-pid --- simple PID controller for Python
;;; -------------------------------------------------------------------
(define-public python-simple-pid
  (package
    (name "python-simple-pid")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "simple_pid" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple and easy to use PID controller for Python")
    (description "Simple-pid provides a simple and easy to use PID
(proportional-integral-derivative) controller implemented in Python.  It
supports features like output clamping, integral windup prevention, and
sample time specification.")
    (home-page "https://github.com/m-lundberg/simple-pid")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. python-nameparser --- human name parsing module for Python
;;; -------------------------------------------------------------------
(define-public python-nameparser
  (package
    (name "python-nameparser")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "nameparser" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python module for parsing human names")
    (description "Nameparser is a Python module for parsing human names into
their individual components: title, first name, middle name, last name, and
suffix.  It handles a wide variety of name formats and edge cases.")
    (home-page "https://github.com/derek73/python-nameparser")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 19. python-ntplib --- NTP client library for Python
;;; -------------------------------------------------------------------
(define-public python-ntplib
  (package
    (name "python-ntplib")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "ntplib" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple interface to query NTP servers from Python")
    (description "Ntplib provides a simple interface to query NTP (Network
Time Protocol) servers from Python.  It can send NTP requests and parse the
responses, providing access to time offset, delay, and other NTP parameters.")
    (home-page "https://github.com/cf-natali/ntplib")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. python-xerox --- simple copy+paste module for Python
;;; -------------------------------------------------------------------
(define-public python-xerox
  (package
    (name "python-xerox")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "xerox" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple copy and paste module for Python")
    (description "Xerox is a simple Python module for copying text to and
from the system clipboard.  It works on Linux (using xclip or xsel), macOS,
and Windows.")
    (home-page "https://github.com/kennethreitz/xerox")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. termsaver --- simple text-based terminal screensaver
;;; -------------------------------------------------------------------
(define-public termsaver
  (package
    (name "termsaver")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brunobraga/termsaver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple text-based terminal screensaver")
    (description "Termsaver is a simple text-based terminal screensaver for
UNIX-like systems.  It provides multiple screensaver modes including matrix
rain, clock, random text, and more.")
    (home-page "https://github.com/brunobraga/termsaver")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. con2fbmap --- console to framebuffer device mapping tool
;;; -------------------------------------------------------------------
(define-public con2fbmap
  (package
    (name "con2fbmap")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://deb.debian.org/debian/pool/main/f/fbset/"
                    "fbset_2.1.orig.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (install-file "con2fbmap" bin)))))))
    (synopsis "shows and sets mapping between consoles and framebuffer devices")
    (description "Con2fbmap shows and sets the mapping between Linux virtual
consoles and framebuffer devices.  It is part of the fbset package and allows
redirecting console output to different framebuffer devices.")
    (home-page "https://sources.debian.org/src/fbset/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 23. grits-formatter --- simple line-text formatter for live logs
;;; -------------------------------------------------------------------
(define-public grits-formatter
  (package
    (name "grits-formatter")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/solidiquis/grits")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                                (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "simple line-text formatter for parsing and formatting live logs")
    (description "Grits is a simple line-text formatter that makes it easy to
parse, filter, and format live logs and other line-oriented text streams.")
    (home-page "https://github.com/solidiquis/grits")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. gitnapped --- find out why you did not sleep
;;; -------------------------------------------------------------------
(define-public gitnapped
  (package
    (name "gitnapped")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Solexma/gitnapped")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find out why you did not sleep")
    (description "Gitnapped analyzes your Git commit history to show what you
were working on during late-night hours.  It helps track your coding habits
and identify patterns in your work schedule.")
    (home-page "https://github.com/Solexma/gitnapped")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 25. gentoo-color-bash --- Gentoo-style color terminal and bash prompt
;;; -------------------------------------------------------------------
(define-public gentoo-color-bash
  (package
    (name "gentoo-color-bash")
    (version "2025.08.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GentooColorBash/gentoo-color-bash")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gentoo-color-bash/"
                #:include-regexp (".*\\.sh$" ".*\\.bash$")))))
    (synopsis "Gentoo-style color terminal and bash command prompt")
    (description "Gentoo-color-bash provides a Gentoo-style colorized terminal
and bash command prompt.  It enhances the terminal appearance with colors for
different elements like the username, hostname, and current directory.")
    (home-page "https://www.gentoo.org")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 26. galette --- GAL assembler for the 21st century
;;; -------------------------------------------------------------------
(define-public galette
  (package
    (name "galette")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simon-frankau/galette")
                    (commit "af52987")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                                (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "GAL assembler for the 21st century")
    (description "Galette is a modern GAL (Generic Array Logic) assembler.
It compiles fuse maps for programmable logic devices from a high-level
description language.")
    (home-page "https://github.com/simon-frankau/galette")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. althttpd --- small, simple, stand-alone HTTP server
;;; -------------------------------------------------------------------
(define-public althttpd
  (package
    (name "althttpd")
    (version "2024.11.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sqlite.org/althttpd/tarball/"
                                  "althttpd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "althttpd" bin)))))))
    (synopsis "small, simple, stand-alone HTTP server")
    (description "Althttpd is a small, simple, stand-alone HTTP server from
the SQLite project.  It is designed to be lightweight and easy to deploy for
serving static content and CGI scripts.")
    (home-page "https://sqlite.org/althttpd/")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 28. gscreenshot --- simple screenshot tool with multiple backends
;;; -------------------------------------------------------------------
(define-public gscreenshot
  (package
    (name "gscreenshot")
    (version "3.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thenaterhood/gscreenshot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple screenshot tool supporting multiple backends")
    (description "Gscreenshot is a simple screenshot tool for Linux that
supports multiple screenshot backends including scrot, ImageMagick, and
xdg-screenshot.  It provides both a GTK graphical interface and a command
line interface.")
    (home-page "https://github.com/thenaterhood/gscreenshot")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 29. bootchart2 --- boot process performance visualization
;;; -------------------------------------------------------------------
(define-public bootchart2
  (package
    (name "bootchart2")
    (version "0.14.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xrmx/bootchart")
                    (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "CC=" #$(cc-for-target))
                                (string-append "DESTDIR=" #$output)
                                "prefix=/")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "boot process performance visualization")
    (description "Bootchart2 is a tool for performance analysis and
visualization of the GNU/Linux boot process.  It collects resource usage
data during boot and generates a chart showing the boot process timeline.")
    (home-page "https://github.com/xrmx/bootchart")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 30. mkaudiocdrimg --- make audio CD-R image from media files
;;; -------------------------------------------------------------------
(define-public mkaudiocdrimg
  (package
    (name "mkaudiocdrimg")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/tallero/mkaudiocdrimg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
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
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "mkaudiocdrimg" bin)))))))
    (synopsis "make audio CD-R images from media files")
    (description "Mkaudiocdrimg creates audio CD-R images from various media
file formats.  It converts and assembles audio files into a format suitable
for burning to CD-R media.")
    (home-page "https://gitlab.com/tallero/mkaudiocdrimg")
    (license license:agpl3+)))
