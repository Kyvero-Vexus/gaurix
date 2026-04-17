;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417w
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (27):
;;;    1. argagg (cmake, v0.4.7, MIT)
;;;    2. reproc (cmake, v14.2.5, MIT)
;;;    3. gklib (cmake, v5.1.1, Apache-2.0)
;;;    4. bsc-m03 (cmake, v0.5.5, GPL-3.0)
;;;    5. peakperf (cmake, git, MIT)
;;;    6. googerteller (cmake, git, MIT)
;;;    7. grub-shusher (meson, git, BSD-2)
;;;    8. lz4json (gnu, git, BSD-2)
;;;    9. rig (gnu, v1.11, GPL-2.0+)
;;;   10. physlock (gnu, v13, GPL-2.0+)
;;;   11. pick (gnu, v4.0.0, MIT)
;;;   12. xavs (gnu, v0.1.55, GPL-2.0+)
;;;   13. acpilight (gnu, v1.2, GPL-3.0)
;;;   14. imgp (gnu, v2.8, GPL-3.0+)
;;;   15. espionage (pyproject, v1.0.0, BSD-3)
;;;   16. python-sphinxcontrib-pdfembed (pyproject, git, BSD-2)
;;;   17. python-cirq-aqt (pyproject, v1.6.1, Apache-2.0)
;;;   18. python-cirq-ionq (pyproject, v1.6.1, Apache-2.0)
;;;   19. python-cirq-pasqal (pyproject, v1.6.1, Apache-2.0)
;;;   20. python-cirq-web (pyproject, v1.6.1, Apache-2.0)
;;;   21. psst-bin (copy/binary, rolling, MIT)
;;;   22. discord-chat-exporter-cli-bin (copy/binary, v2.47.1, MIT)
;;;   23. twitter-media-downloader-bin (copy/binary, v1.15.0, MIT)
;;;   24. antu-icon-theme (copy, git, CC-BY-SA-4.0)
;;;   25. dwmbar (copy, git, GPL-3.0)
;;;   26. sysinfo (copy, v0.1.4, MIT)
;;;   27. maclean (copy, git, public-domain)
;;;
;;; Blocked (3):
;;;   28. plasma-mobile-sounds — BLOCKED: SOURCE_UNAVAILABLE (KDE GitLab requires auth)
;;;   29. komodo-engine — BLOCKED: SOURCE_UNAVAILABLE (download URL 404)
;;;   30. edk2-ovmf-fedora — BLOCKED: COMPLEX_PACKAGING (RPM source needs rpm2cpio)
;;;
;;; 27 recipes + 3 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sphinx)
  #:export (
            argagg
            reproc
            gklib
            bsc-m03
            peakperf
            googerteller
            grub-shusher
            lz4json
            rig
            physlock
            pick-fuzzy
            xavs
            acpilight
            imgp
            espionage
            python-sphinxcontrib-pdfembed
            python-cirq-aqt
            python-cirq-ionq
            python-cirq-pasqal
            python-cirq-web
            psst-bin
            discord-chat-exporter-cli-bin
            twitter-media-downloader-bin
            antu-icon-theme
            dwmbar
            sysinfo-display
            maclean
            ))

;;; -------------------------------------------------------------------
;;; 1. argagg — simple C++ command-line argument parser (header-only)
;;; -------------------------------------------------------------------
(define-public argagg
  (package
    (name "argagg")
    (version "0.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vietjtnguyen/argagg/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0z1zrx1rjghix7vk85sgsc2djjfs6ffz2whcflb2gsr88680nx2y"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; header-only library, no test target
    (synopsis "simple C++ command-line argument/option parser")
    (description "Argagg is a simple, header-only C++ argument/option parser
that supports long options, short options, positional arguments, and
automatic help message generation.  It requires only C++11 and has no
external dependencies.")
    (home-page "https://github.com/vietjtnguyen/argagg")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. reproc — cross-platform C/C++ library for external processes
;;; -------------------------------------------------------------------
(define-public reproc
  (package
    (name "reproc")
    (version "14.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DaanDeMeyer/reproc/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1s3yvk1mdwkwdgvn6h1ickwkj54g7hkdljn546w381y8rzh7nik9"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DREPROC++=ON"
                   "-DBUILD_SHARED_LIBS=ON")))
    (synopsis "cross-platform C/C++ library for managing external processes")
    (description "Reproc (Redirected Process) is a cross-platform C/C++99/C++11
library that simplifies starting, stopping, and communicating with external
programs.  It provides both C and C++ APIs for redirecting stdin, stdout,
and stderr of child processes.")
    (home-page "https://github.com/DaanDeMeyer/reproc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. gklib — helper routines library for graph partitioning
;;; -------------------------------------------------------------------
(define-public gklib
  (package
    (name "gklib")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KarypisLab/GKlib/archive/refs/tags/"
                    "METIS-v" version "-DistDGL-0.5.tar.gz"))
              (sha256
               (base32
                "0cxqyh7js6a3cgyjspyvnkm8wd6al9xm7s8am97hydj27lw0vajj"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test target
    (synopsis "helper routines library used by METIS and related software")
    (description "GKlib is a library of helper routines and frameworks used
by METIS, ParMETIS, and other graph partitioning software from the
Karypis Lab.  It provides data structures, sorting, string processing,
file I/O, and memory management utilities.")
    (home-page "https://github.com/KarypisLab/GKlib")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. bsc-m03 — high-performance block-sorting data compressor
;;; -------------------------------------------------------------------
(define-public bsc-m03
  (package
    (name "bsc-m03")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IlyaGrebnov/bsc-m03/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1vk18c4989by4rdpk1ii8dhn7a8finhxpizsp0g6awddjx7rbib2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test target
    (synopsis "high-performance block-sorting data compressor")
    (description "BSC-M03 is a high-performance lossless data compressor
based on block-sorting compression.  It achieves strong compression ratios
while maintaining reasonable compression and decompression speeds.")
    (home-page "https://github.com/IlyaGrebnov/bsc-m03")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. peakperf — achieve peak performance on x86 CPUs
;;; -------------------------------------------------------------------
(define-public peakperf
  (package
    (name "peakperf")
    (version "0.0.0")  ;; git snapshot, no tagged release
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Dr-Noob/peakperf/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0i4ax5di0m3wnkphhanx48lbr8fsh3kyb77ckdfbrg3saaqqdh94"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; benchmark tool, no test suite
    (synopsis "tool to measure peak FLOPS on x86 CPUs")
    (description "Peakperf is a benchmarking tool that measures the peak
floating-point performance (FLOPS) of x86 CPUs.  It uses hand-optimized
assembly kernels to stress-test the FPU and vector units, reporting
achievable peak performance for various instruction sets including
SSE, AVX, AVX2, and AVX-512.")
    (home-page "https://github.com/Dr-Noob/peakperf")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. googerteller — audible feedback on Google browsing
;;; -------------------------------------------------------------------
(define-public googerteller
  (package
    (name "googerteller")
    (version "0.0.0")  ;; git snapshot, no tagged release
    (source (origin
              (method url-fetch)
              (uri "https://github.com/berthubert/googerteller/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "1d704bhr37i7ar8qdz1j8ikyja9d9n7cqwyndb06v79rdcq7a7wc"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list pcaudiolib tcpdump))
    (synopsis "audible feedback on how much browsing feeds into Google")
    (description "Googerteller provides audible feedback on just how much
of your browsing feeds into Google.  It monitors network traffic and plays
a short beep whenever data is sent to a Google IP address range, making
the extent of Google's data collection tangible.")
    (home-page "https://github.com/berthubert/googerteller")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. grub-shusher — utilities to patch GRUB for silent boot
;;; -------------------------------------------------------------------
(define-public grub-shusher
  (package
    (name "grub-shusher")
    (version "0.0.0")  ;; git snapshot, no tagged release
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ccontavalli/grub-shusher/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1mp1fpc33fn12c6m3cbr8sam4caakihf0nh11x5i5gl9ai2lrs8y"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (synopsis "utilities to patch GRUB for silent boot")
    (description "Grub-shusher provides utilities to patch GRUB bootloader
binaries to suppress the boot menu and messages, enabling a fully silent
boot experience on Linux systems.")
    (home-page "https://github.com/ccontavalli/grub-shusher")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 8. lz4json — decompress tool for Mozilla lz4json format
;;; -------------------------------------------------------------------
(define-public lz4json
  (package
    (name "lz4json")
    (version "2.0.0")  ;; git snapshot, no tagged release
    (source (origin
              (method url-fetch)
              (uri "https://github.com/andikleen/lz4json/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "01b5h4ci69an1dj6pkkqga8fgl56qmxha4xw7i87w1w98pkgy22y"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; no configure script
    (inputs (list lz4))
    (synopsis "decompress tool for Mozilla lz4json format")
    (description "Lz4json is a small C utility to decompress files in the
Mozilla lz4json format, which is used by Firefox for bookmarks backups
and session restore files.  It reads lz4json from stdin or a file and
writes decompressed JSON to stdout.")
    (home-page "https://github.com/andikleen/lz4json")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 9. rig — random identity generator
;;; -------------------------------------------------------------------
(define-public rig
  (package
    (name "rig")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/rig/rig/" version
                    "/rig-" version ".tar.gz"))
              (sha256
               (base32
                "1f3snysjqqlpk2kgvm5p2icrj4lsdymccmn3igkc2f60smqckgq0"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'install 'create-dirs
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (mkdir-p (string-append out "/share/rig"))))))))
    (synopsis "random identity generator")
    (description "RIG (Random Identity Generator) generates random but
plausible personal identities including names, addresses, and phone
numbers.  It is useful for testing databases, filling out web forms,
and other situations where realistic but fake data is needed.")
    (home-page "https://rig.sourceforge.net/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 10. physlock — lightweight Linux console locking tool
;;; -------------------------------------------------------------------
(define-public physlock
  (package
    (name "physlock")
    (version "13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xyb3rt/physlock/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1mjbfxqngnl57zjw3gnwxf0j4f6a6f8l66x08wg18vwi3rm73r4s"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; no configure script
    (inputs (list linux-pam))
    (synopsis "lightweight Linux console locking tool")
    (description "Physlock is a lightweight screen locking tool for Linux
console sessions.  Unlike vlock, it locks all virtual terminals and
requires only PAM authentication to unlock, providing physical security
for unattended terminals.")
    (home-page "https://github.com/xyb3rt/physlock")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 11. pick — fuzzy search tool for the command line
;;; -------------------------------------------------------------------
(define-public pick-fuzzy
  (package
    (name "pick-fuzzy")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mptre/pick/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1b7xhxgyll2migqc2rsvmr7k3vjn7fzpls2svb3687f2p1r16ay6"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list ncurses))
    (synopsis "fuzzy search tool for the command line")
    (description "Pick is a fuzzy search tool for the command line.  It
reads a list of choices from stdin and presents them to the user for
interactive fuzzy selection.  The selected choice is printed to stdout,
making it composable with other Unix tools via pipes.")
    (home-page "https://github.com/mptre/pick")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. xavs — audio video standard of China encoder/decoder
;;; -------------------------------------------------------------------
(define-public xavs
  (package
    (name "xavs")
    (version "0.1.55")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/xavs/xavs-" version ".tar.bz2"))
              (sha256
               (base32
                "0ygd9xhszc74af1aagnk6bzf2l7gxi48v7h5z91bavn1mb8s8bg4"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list yasm))
    (synopsis "encoder and decoder for the Audio Video Standard of China")
    (description "XAVS implements a high-quality encoder and decoder for
the Audio Video Standard (AVS) of China.  AVS is a national standard
for video compression comparable to H.264/AVC, used primarily in Chinese
digital television broadcasting.")
    (home-page "https://xavs.sourceforge.net/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 13. acpilight — xbacklight replacement based on ACPI
;;; -------------------------------------------------------------------
(define-public acpilight
  (package
    (name "acpilight")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/wavexx/acpilight/-/archive/v"
                    version "/acpilight-v" version ".tar.gz"))
              (sha256
               (base32
                "1mc4dgssj8si8f67wc611zhf7chfp164k7v2h998v4byw6j53fz5"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "prefix=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; Makefile-only project
    (inputs (list python))
    (synopsis "backward-compatible xbacklight replacement based on ACPI")
    (description "Acpilight is a backward-compatible replacement for the
xbacklight utility that uses the ACPI interface to control backlight
brightness instead of relying on X11 RandR.  This makes it work
reliably on modern hardware where xbacklight often fails.")
    (home-page "https://gitlab.com/wavexx/acpilight")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. imgp — multi-core batch image resizer and rotator
;;; -------------------------------------------------------------------
(define-public imgp
  (package
    (name "imgp")
    (version "2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jarun/imgp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1gbw9qgadhzxgrl2za868vmqsza6c9bs9a2nx6d47i0hl5blyjci"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; Makefile-only project
    (inputs (list python python-pillow))
    (synopsis "multi-core batch image resizer and rotator")
    (description "Imgp is a command-line image resizer and rotator that
supports multi-core parallel processing.  It can batch-resize and
rotate JPEG and PNG images while preserving EXIF metadata.  It uses
Python Pillow for image processing and supports percentage-based and
absolute dimension resizing.")
    (home-page "https://github.com/jarun/imgp")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. espionage — ESP8266/ESP32 firmware analysis toolkit
;;; -------------------------------------------------------------------
(define-public espionage
  (package
    (name "espionage")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/serene-brew/ESPionage/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0b4ljpff5qr1wsjvm0vqxjgdqfhfssfb0a04f77aj6qz9ycxba1v"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "ESP8266 and ESP32 firmware binary analysis toolkit")
    (description "ESPionage is a Python toolkit for analyzing ESP8266 and
ESP32 firmware binaries.  It can parse, extract, and examine firmware
images to identify components, configuration data, and potential
security issues in IoT device firmware.")
    (home-page "https://github.com/serene-brew/ESPionage")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 16. python-sphinxcontrib-pdfembed — Sphinx PDF embedding extension
;;; -------------------------------------------------------------------
(define-public python-sphinxcontrib-pdfembed
  (package
    (name "python-sphinxcontrib-pdfembed")
    (version "0.0.0")  ;; git snapshot, no tagged release
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SuperKogito/sphinxcontrib-pdfembed/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0c7a07djkcz46imj66n8gshfd29hfysi8w0dq58nfi3ccbgvifib"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-sphinx))
    (synopsis "sphinx extension to embed PDF files in web pages")
    (description "Sphinxcontrib-pdfembed is a Sphinx extension that allows
embedding PDF files directly into generated HTML documentation pages.
It provides a simple directive to include PDF viewers in Sphinx-built
documentation.")
    (home-page "https://github.com/SuperKogito/sphinxcontrib-pdfembed")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; Cirq quantum computing sub-packages (17-20)
;;; All share the same monorepo source; each builds from a subdirectory.
;;; -------------------------------------------------------------------

;;; Shared source for all Cirq sub-packages
(define cirq-source
  (origin
    (method url-fetch)
    (uri "https://github.com/quantumlib/Cirq/archive/refs/tags/v1.6.1.tar.gz")
    (sha256
     (base32
      "0xcln1hnfh2w5afasbv2ls94wavabv5sizh94qmmlyshx9z5dnk5"))))

;;; -------------------------------------------------------------------
;;; 17. python-cirq-aqt — Cirq sub-package for AQT integration
;;; -------------------------------------------------------------------
(define-public python-cirq-aqt
  (package
    (name "python-cirq-aqt")
    (version "1.6.1")
    (source cirq-source)
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subpackage
                 (lambda _
                   (chdir "cirq-aqt"))))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "cirq sub-package for Alpine Quantum Technologies integration")
    (description "Cirq-aqt provides integration between Google's Cirq quantum
computing framework and Alpine Quantum Technologies (AQT) trapped-ion
quantum computers.  It enables running Cirq circuits on AQT hardware
through their cloud API.")
    (home-page "https://github.com/quantumlib/Cirq")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 18. python-cirq-ionq — Cirq sub-package for IonQ integration
;;; -------------------------------------------------------------------
(define-public python-cirq-ionq
  (package
    (name "python-cirq-ionq")
    (version "1.6.1")
    (source cirq-source)
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subpackage
                 (lambda _
                   (chdir "cirq-ionq"))))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "cirq sub-package for IonQ quantum computer integration")
    (description "Cirq-ionq provides integration between Google's Cirq quantum
computing framework and IonQ trapped-ion quantum computers.  It enables
submitting and running Cirq circuits on IonQ hardware through their
cloud service API.")
    (home-page "https://github.com/quantumlib/Cirq")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. python-cirq-pasqal — Cirq sub-package for Pasqal integration
;;; -------------------------------------------------------------------
(define-public python-cirq-pasqal
  (package
    (name "python-cirq-pasqal")
    (version "1.6.1")
    (source cirq-source)
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subpackage
                 (lambda _
                   (chdir "cirq-pasqal"))))))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "cirq sub-package for Pasqal neutral-atom quantum integration")
    (description "Cirq-pasqal provides integration between Google's Cirq
quantum computing framework and Pasqal neutral-atom quantum processors.
It enables defining and running quantum circuits on Pasqal's hardware
platform through their API.")
    (home-page "https://github.com/quantumlib/Cirq")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. python-cirq-web — Cirq web visualization sub-package
;;; -------------------------------------------------------------------
(define-public python-cirq-web
  (package
    (name "python-cirq-web")
    (version "1.6.1")
    (source cirq-source)
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-subpackage
                 (lambda _
                   (chdir "cirq-web"))))))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "cirq web-based circuit visualization tools")
    (description "Cirq-web provides web-based visualization tools for
Google's Cirq quantum computing framework.  It enables interactive
3D rendering and visualization of quantum circuits and Bloch spheres
in web browsers.")
    (home-page "https://github.com/quantumlib/Cirq")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. psst-bin — fast Spotify client with native GUI (pre-built)
;;; -------------------------------------------------------------------
(define-public psst-bin
  (package
    (name "psst-bin")
    (version "2025.12.20")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jpochyla/psst/releases/download/rolling/psst-linux-x86_64")
              (sha256
               (base32
                "0hvmrhy14vadcnx94zl8s19g1hi0rn33zs54vjgwjvbbc96crl2n"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/psst-gui")
                   (chmod "src/psst-gui" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("psst-gui" "bin/psst-gui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast Spotify client with native GUI")
    (description "Psst is a fast and multi-platform Spotify client with a
native GUI built using the Druid toolkit.  It provides a lightweight
alternative to the official Spotify client with lower resource usage.
This package installs the pre-built Linux binary.")
    (home-page "https://github.com/jpochyla/psst")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. discord-chat-exporter-cli-bin — Discord chat log exporter
;;; -------------------------------------------------------------------
(define-public discord-chat-exporter-cli-bin
  (package
    (name "discord-chat-exporter-cli-bin")
    (version "2.47.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tyrrrz/DiscordChatExporter"
                    "/releases/download/" version
                    "/DiscordChatExporter.Cli.linux-x64.zip"))
              (sha256
               (base32
                "0sfffrz19s86qv1i6z5hwfsskizmgjsmf23qsgn3d65f4fxqzm1f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("DiscordChatExporter.Cli" "bin/discord-chat-exporter"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "exports Discord chat logs to a file")
    (description "DiscordChatExporter is a command-line tool that exports
Discord channel chat logs to HTML, JSON, CSV, or plain text files.
It supports exporting from DMs, group chats, and server channels.
This package installs the self-contained .NET binary for Linux.")
    (home-page "https://github.com/Tyrrrz/DiscordChatExporter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. twitter-media-downloader-bin — Twitter media downloader (Go)
;;; -------------------------------------------------------------------
(define-public twitter-media-downloader-bin
  (package
    (name "twitter-media-downloader-bin")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mmpx12/twitter-media-downloader"
                    "/releases/download/v" version
                    "/twitter-media-downloader-v" version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "1fif4v9mhk53z6r2cnpgl9g62933l3k5lkcl9sajfzcw99v6jd1w"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("twitter-media-downloader" "bin/twitter-media-downloader"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to download media from Twitter/X posts")
    (description "Twitter-media-downloader is a command-line tool written
in Go that downloads images and videos from Twitter (X) posts.  It
supports batch downloading, thread media extraction, and various
output formats.  This package installs the pre-built binary.")
    (home-page "https://github.com/mmpx12/twitter-media-downloader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. antu-icon-theme — smooth icon theme for Plasma Desktop
;;; -------------------------------------------------------------------
(define-public antu-icon-theme
  (package
    (name "antu-icon-theme")
    (version "0.0.0")  ;; git snapshot
    (source (origin
              (method url-fetch)
              (uri "https://github.com/fabianalexisinostroza/Antu-icons/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1aznw4wjgpy5n367wci0xrm3392rcwasghfaj4xhj2i70q1wy0wf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Antu/"
                    #:include-regexp (".*\\.svg$" ".*\\.png$"
                                     "index\\.theme")))))
    (synopsis "smooth icon theme designed for KDE Plasma Desktop")
    (description "Antu is a smooth, modern icon theme designed for the KDE
Plasma Desktop environment.  It provides a comprehensive set of icons
with clean lines and vibrant colors, covering applications, actions,
file types, and system components.")
    (home-page "https://github.com/fabianalexisinostroza/Antu-icons")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 25. dwmbar — simple and modular status bar for dwm
;;; -------------------------------------------------------------------
(define-public dwmbar
  (package
    (name "dwmbar")
    (version "0.0.0")  ;; git snapshot
    (source (origin
              (method url-fetch)
              (uri "https://github.com/thytom/dwmbar/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1h7jhsxw7gx4y51gy6hkpl1wl3fw58j6wwqbry905hf7xca0pvsw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dwmbar" "bin/dwmbar")
               ("modules/" "share/dwmbar/modules/"))))
    (inputs (list bash))
    (synopsis "simple and modular status bar for dwm")
    (description "Dwmbar is a simple and modular status bar for the dwm
window manager.  It is written in shell script and supports customizable
modules for displaying system information such as CPU usage, memory,
battery, volume, and date/time in the dwm status bar.")
    (home-page "https://github.com/thytom/dwmbar")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 26. sysinfo-display — system information display tool
;;; -------------------------------------------------------------------
(define-public sysinfo-display
  (package
    (name "sysinfo-display")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IngoMeyer441/sysinfo/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ibqcc95klh76caf805sf1qvdcqqzl0zyacwycn259j40yacxvj6"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sysinfo" "bin/sysinfo"))))
    (inputs (list bash gawk))
    (synopsis "compact system information display tool")
    (description "Sysinfo shows system information like hardware configuration
and resource usage in a compact, clearly arranged, and visually pleasing
style.  It is a lightweight shell script that displays CPU, memory,
disk, network, and OS information in the terminal.")
    (home-page "https://github.com/IngoMeyer441/sysinfo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. maclean — safe cleaning script for Linux
;;; -------------------------------------------------------------------
(define-public maclean
  (package
    (name "maclean")
    (version "0.0.0")  ;; git snapshot
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/cscs/maclean/-/archive/main/maclean-main.tar.gz")
              (sha256
               (base32
                "1yw72nq2bj1w7n44h2r9wyisv1nfzp6xf5vf9r24i4qq2ry17bdg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("maclean" "bin/maclean"))))
    (synopsis "safe cleaning script for Linux systems")
    (description "Maclean is a script to automate relatively safe cleaning
activities for Linux users.  It removes common temporary files, caches,
and unnecessary data while being careful not to delete anything
important or irreversible.")
    (home-page "https://gitlab.com/cscs/maclean")
    (license license:public-domain)))
