;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417y
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (27):
;;;    1. perl-cpan-distnameinfo (perl, v0.12, Artistic-1.0)
;;;    2. perl-const-fast (perl, v0.014, Artistic-1.0)
;;;    3. perl-data-printer (perl, v1.002001, Artistic-1.0)
;;;    4. perl-object-pad (perl, v0.825, Artistic-1.0)
;;;    5. salome-configuration (cmake, v9.15.0, LGPL-2.1+)
;;;    6. janet (gnu/make, v1.41.2, MIT)
;;;    7. pyghmi (pyproject, v1.6.15, Apache-2.0)
;;;    8. python-uritools (pyproject, v4.0.3, MIT)
;;;    9. python-pyhanko-certvalidator (pyproject, v0.30.2, MIT)
;;;   10. python-pyhanko (pyproject, v0.34.1, MIT)
;;;   11. python-certomancer-csc-dummy (pyproject, v0.4.2, MIT)
;;;   12. python-pdf2doi (pyproject, v1.7, MIT)
;;;   13. python-typedunits (pyproject, v0.0.2, Apache-2.0)
;;;   14. python-ompython (python, v4.0.1, GPL-3.0+)
;;;   15. anyfetch (python/copy, rolling, GPL-3.0)
;;;   16. venice-cli-bin (copy/binary, v0.1.13, GPL-3.0)
;;;   17. plugdata-bin (copy/binary, v0.9.3-2, GPL-3.0)
;;;   18. blink-player-bin (copy/binary, v1.0.0-alpha04, GPL-3.0)
;;;   19. famistudio-bin (copy/binary, v4.5.0, MIT)
;;;   20. dcvviewer-bin (copy/binary, v2024.0.8004, proprietary)
;;;   21. pdfmerger (cmake/qt5, v1.1.2, GPL-3.0)
;;;   22. nview (cmake/qt6, v0.30, GPL-2.0)
;;;   23. python-trezor (pyproject, v0.20.0, LGPL-3.0)
;;;   24. alsaplayer (gnu, git, GPL-3.0+)
;;;   25. svxlink-sounds-en-us-heather (copy, v24.02, CC-BY-SA-4.0)
;;;   26. adbmanager-bin (copy/binary, v4.0, GPL-3.0)
;;;
;;; Blocked (4):
;;;   27. wirecontrol-git — BLOCKED: MISSING_GUIX_DEPS (needs libastal-wireplumber, not in Guix)
;;;   28. quickbib — BLOCKED: MISSING_GUIX_DEPS (needs python-doi2bib3, python-pyqt6)
;;;   29. 0xtools — BLOCKED: COMPLEX_BUILD (needs libbpf/eBPF/clang for C components)
;;;   30. python-ompython — BLOCKED: MISSING_RUNTIME (needs OpenModelica runtime, not in Guix)
;;;
;;; 26 recipes + 4 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages perl-web)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xml)
  #:export (
            perl-cpan-distnameinfo
            perl-const-fast
            perl-data-printer
            perl-object-pad
            salome-configuration
            janet
            pyghmi
            python-uritools
            python-pyhanko-certvalidator
            python-pyhanko
            python-certomancer-csc-dummy
            python-pdf2doi
            python-typedunits
            python-ompython
            anyfetch
            venice-cli-bin
            plugdata-bin
            blink-player-bin
            famistudio-bin
            dcvviewer-bin
            pdfmerger
            nview
            python-trezor
            alsaplayer
            svxlink-sounds-en-us-heather
            adbmanager-bin
            ))

;;; Nonfree license helper (used by dcvviewer-bin)
(define nonfree-license
  ((@@ (guix licenses) license) "nonfree"
    "https://www.amazondcv.com/"
    "Nonfree/proprietary license; see upstream for terms."))

;;; -------------------------------------------------------------------
;;; 1. perl-cpan-distnameinfo — extract CPAN dist name and version
;;; -------------------------------------------------------------------
(define-public perl-cpan-distnameinfo
  (package
    (name "perl-cpan-distnameinfo")
    (version "0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/G/GB/GBARR/"
                    "CPAN-DistnameInfo-" version ".tar.gz"))
              (sha256
               (base32
                "0d94kx596w7k328cvq4y96z1gz12hdhn3z1mklkbrb7fyzlzn91g"))))
    (build-system perl-build-system)
    (synopsis "extract distribution name and version from a CPAN filename")
    (description "CPAN::DistnameInfo extracts the distribution name and
version number from a CPAN distribution filename.  It handles both new-style
and old-style naming conventions used on CPAN.")
    (home-page "https://metacpan.org/dist/CPAN-DistnameInfo")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 2. perl-const-fast — facility for creating read-only scalars, arrays, hashes
;;; -------------------------------------------------------------------
(define-public perl-const-fast
  (package
    (name "perl-const-fast")
    (version "0.014")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/L/LE/LEONT/"
                    "Const-Fast-" version ".tar.gz"))
              (sha256
               (base32
                "1nwlldgrx86yn7y6a53cqgvzm2ircsvxg1addahlcy6510x9a1gq"))))
    (build-system perl-build-system)
    (native-inputs (list perl-module-build-tiny))
    (propagated-inputs (list perl-sub-exporter-progressive))
    (synopsis "facility for creating read-only scalars, arrays, and hashes")
    (description "Const::Fast provides a simple way to make read-only
(constant) Perl scalars, arrays, and hashes.  Unlike Readonly, it makes truly
read-only variables that are faster to access because they use Perl's native
read-only mechanism.")
    (home-page "https://metacpan.org/dist/Const-Fast")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 3. perl-data-printer — colored pretty-print of Perl data structures
;;; -------------------------------------------------------------------
(define-public perl-data-printer
  (package
    (name "perl-data-printer")
    (version "1.002001")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/G/GA/GARU/"
                    "Data-Printer-" version ".tar.gz"))
              (sha256
               (base32
                "0x1vdydmj0yp681w0f2nkdxv2h4wa2py002af88clppqxlljsacn"))))
    (build-system perl-build-system)
    (propagated-inputs
     (list perl-clone-pp
           perl-file-homedir
           perl-package-stash
           perl-sort-naturally))
    (synopsis "colored pretty-print of Perl data structures and objects")
    (description "Data::Printer formats and displays Perl data structures
and objects in a human-readable, colored format for debugging purposes.  It
provides rich output for references, objects, regular expressions, and code
references, with customizable colors and formatting options.")
    (home-page "https://metacpan.org/dist/Data-Printer")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 4. perl-object-pad — simple syntax for lexical field-based objects
;;; -------------------------------------------------------------------
(define-public perl-object-pad
  (package
    (name "perl-object-pad")
    (version "0.825")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/P/PE/PEVANS/"
                    "Object-Pad-" version ".tar.gz"))
              (sha256
               (base32
                "18xijgzi6k6wkvmdscgm0fpcdmkm3cnj1r4zybwmnnjhnr1lka1z"))))
    (build-system perl-build-system)
    (native-inputs
     (list perl-module-build perl-test-simple))
    (propagated-inputs
     (list perl-xs-parse-keyword
           perl-xs-parse-sublike))
    (synopsis "simple syntax for lexical field-based objects in Perl")
    (description "Object::Pad provides a simple syntax for writing
object-oriented Perl code using lexical fields.  It implements the core
features of the Corinna proposal, providing @code{class}, @code{field},
@code{method}, and related keywords for building structured classes.")
    (home-page "https://metacpan.org/dist/Object-Pad")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 5. salome-configuration — Salome CMake macros library
;;; -------------------------------------------------------------------
(define-public salome-configuration
  (package
    (name "salome-configuration")
    (version "9.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SalomePlatform/configuration/"
                    "archive/refs/tags/V"
                    (string-join (string-split version #\.) "_")
                    ".tar.gz"))
              (sha256
               (base32
                "1xwqz7avz8n3i9v6hv429jfllzy84zhlgpm87k0gp0vk2rx3dp81"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; CMake macros only, no test target
    (synopsis "CMake macros and configuration for the Salome platform")
    (description "Salome-Configuration provides CMake macros, modules, and
configuration files used by the Salome numerical simulation platform.  It
includes detection routines for various third-party libraries, common build
options, and platform-specific settings.")
    (home-page "https://github.com/SalomePlatform/configuration")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 6. janet — functional and imperative programming language
;;; -------------------------------------------------------------------
(define-public janet
  (package
    (name "janet")
    (version "1.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/janet-lang/janet/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "09dpq0v566cwnhhw9y5rsrry8knczsg0319nwk8ykxlhnzhrg3hn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:test-target "test"
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; uses plain Makefile, no configure
    (synopsis "functional and imperative programming language")
    (description "Janet is a functional and imperative programming language
and bytecode interpreter.  It provides a lightweight, embeddable core with
features including closures, fibers, dynamic typing, PEG parsing, and easy
C interop.  Janet can be used as a scripting language or to build standalone
executables.")
    (home-page "https://janet-lang.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. pyghmi — pure Python IPMI client library
;;; -------------------------------------------------------------------
(define-public pyghmi
  (package
    (name "pyghmi")
    (version "1.6.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "pyghmi/pyghmi-" version ".tar.gz"))
              (sha256
               (base32
                "0dgm74rvwfg8a7vss4pqg9r5b188swixd9yachzzizf04qvavavm"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require IPMI hardware
    (propagated-inputs
     (list python-cryptography
           python-dateutil
           python-six))
    (native-inputs
     (list python-pbr
           python-setuptools
           python-wheel))
    (synopsis "pure Python IPMI client library")
    (description "Pyghmi is a pure Python library for managing servers using
IPMI (Intelligent Platform Management Interface).  It provides a high-level
API for controlling power, reading sensors, configuring BIOS settings, and
performing firmware updates on BMC-equipped servers.")
    (home-page "https://opendev.org/x/pyghmi")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8. python-uritools — URI parsing and composition (RFC 3986)
;;; -------------------------------------------------------------------
(define-public python-uritools
  (package
    (name "python-uritools")
    (version "4.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/u/"
                    "uritools/uritools-" version ".tar.gz"))
              (sha256
               (base32
                "1hivmsycmvmymavx29295bfqxk5a75sr3ynmx564cjf8m61a21pf"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "URI parsing and composition tools for Python (RFC 3986)")
    (description "Uritools provides functions for parsing, classifying,
composing, and resolving URIs, URI references, and IRIs according to RFC 3986
and RFC 3987.  It is a replacement for parts of the standard library
@code{urllib.parse} with stricter RFC compliance.")
    (home-page "https://github.com/tkem/uritools")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. python-pyhanko-certvalidator — X.509 certificate validation
;;; -------------------------------------------------------------------
(define-public python-pyhanko-certvalidator
  (package
    (name "python-pyhanko-certvalidator")
    (version "0.30.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "pyhanko-certvalidator/pyhanko_certvalidator-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0s3pqzpq4ll74bpdddq9b5i7rcwx0i6fnclva8s0g2s4h1knvkxw"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need network and OCSP/CRL services
    (propagated-inputs
     (list python-asn1crypto
           python-oscrypto
           python-cryptography
           python-uritools
           python-requests))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "X.509 certificate and certificate path validation library")
    (description "Pyhanko-certvalidator is a Python library for validating
X.509 certificates and certification paths.  It supports CRL and OCSP
checking, name constraints, policy validation, and is used as the certificate
validation backend for the pyHanko PDF signing library.")
    (home-page "https://github.com/MatthiasValvekens/certvalidator")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. python-pyhanko — PDF signing and stamping
;;; -------------------------------------------------------------------
(define-public python-pyhanko
  (package
    (name "python-pyhanko")
    (version "0.34.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "pyHanko/pyhanko-" version ".tar.gz"))
              (sha256
               (base32
                "05hjs4d1crnjsp180zqh0593z6km6kw24gx9381pwq315xaqihm4"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need additional test certs and fixtures
    (propagated-inputs
     (list python-asn1crypto
           python-tzlocal
           python-pyhanko-certvalidator
           python-requests
           python-pyyaml
           python-cryptography
           python-lxml
           python-click))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "sign and stamp PDF files")
    (description "PyHanko is a Python library and command-line tool for
signing and stamping PDF files.  It supports PAdES, CMS, and PKCS#11-based
signatures, certificate chain validation, timestamps, document security
stores, and visual signature appearances.")
    (home-page "https://github.com/MatthiasValvekens/pyHanko")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. python-certomancer-csc-dummy — demo CSC server for testing
;;; -------------------------------------------------------------------
(define-public python-certomancer-csc-dummy
  (package
    (name "python-certomancer-csc-dummy")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/c/"
                    "certomancer-csc-dummy/certomancer_csc_dummy-"
                    version ".tar.gz"))
              (sha256
               (base32
                "02va6x49zkijm0lbk16zvgm3kn0yp6q7yyv84i8vs8gs0wcnr09z"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need certomancer test infrastructure
    (propagated-inputs
     (list python-asn1crypto
           python-cryptography
           python-aiohttp))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Certomancer-based demo CSC server for integration tests")
    (description "Certomancer-csc-dummy is a Certomancer-based demo
implementation of the Cloud Signature Consortium (CSC) API.  It provides a
test server for integration testing of remote signing workflows as defined
by the CSC specification.")
    (home-page "https://github.com/MatthiasValvekens/certomancer-csc-dummy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. python-pdf2doi — extract DOIs from PDF files
;;; -------------------------------------------------------------------
(define-public python-pdf2doi
  (package
    (name "python-pdf2doi")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "pdf2doi/pdf2doi-" version ".tar.gz"))
              (sha256
               (base32
                "0bmzg5bby8s48ly7qpnhwz8zyc2rlg48p32qgibyz5wkwny5gljl"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need network to query DOI APIs
    (propagated-inputs
     (list python-requests))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "extract DOIs from PDF files automatically")
    (description "Pdf2doi is a Python tool that extracts Digital Object
Identifiers (DOIs) and arXiv identifiers from PDF files.  It queries
Crossref, Semantic Scholar, and arXiv APIs to validate and retrieve
bibliographic metadata for academic papers.")
    (home-page "https://github.com/MicheleCotrufo/pdf2doi")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-typedunits — fast units and dimensions library
;;; -------------------------------------------------------------------
(define-public python-typedunits
  (package
    (name "python-typedunits")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/quantumlib/TypedUnits/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "027vfffrfspj3n8jp6niqbjrd8jcnrvcn4q3pv2q5pc08mjg7drk"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require pytest fixtures not bundled
    (propagated-inputs
     (list python-attrs
           python-numpy
           python-protobuf
           python-pyparsing))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "fast units and dimensions library with static type checking")
    (description "TypedUnits is a Python library for working with physical
units and dimensions.  It provides a type-safe system for dimensional analysis
with support for static dimensionality checking, making it suitable for
scientific computing and physics simulations.")
    (home-page "https://github.com/quantumlib/TypedUnits")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. python-ompython — OpenModelica Python API interface
;;; -------------------------------------------------------------------
(define-public python-ompython
  (package
    (name "python-ompython")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenModelica/OMPython/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0sz9cbzkpnck8i3jq4isr1vfzkp1zdpvrvk2r57rwm8m84xqgmcg"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require OpenModelica runtime
    (propagated-inputs
     (list python-numpy
           python-psutil
           python-pyparsing))
    (native-inputs
     (list python-setuptools))
    (synopsis "OpenModelica Python API interface")
    (description "OMPython is the Python scripting interface for
OpenModelica, providing access to the OpenModelica Compiler (OMC) and
simulation runtime.  It allows loading, simulating, and analyzing Modelica
models from Python scripts.")
    (home-page "https://github.com/OpenModelica/OMPython")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. anyfetch — system information fetch utility
;;; -------------------------------------------------------------------
(define-public anyfetch
  (package
    (name "anyfetch")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Senya44ka/anyfetch/"
                    "archive/refs/heads/main.tar.gz"))
              (sha256
               (base32
                "09aix0h7wkcghiyy59cicwxxs7yq4w98giiv4lkarm5108mzfa7r"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/python"
                                              #$(version-major+minor
                                                 (package-version python))
                                              "/site-packages/anyfetch")))
                     (mkdir-p bin)
                     (mkdir-p lib)
                     (for-each (lambda (f)
                                 (install-file f lib))
                               (find-files "." "\\.py$"))
                     (let ((wrapper (string-append bin "/anyfetch")))
                       (call-with-output-file wrapper
                         (lambda (port)
                           (format port "#!~a~%import sys~%sys.path.insert(0, '~a')~%exec(open('~a/anyfetch.py').read())~%"
                                   (which "python3") lib lib)))
                       (chmod wrapper #o755))))))))
    (propagated-inputs
     (list python-psutil
           python-requests
           python-colorama
           python-distro))
    (synopsis "system information fetch utility with custom ASCII art")
    (description "Anyfetch is a system information fetcher that displays
system details alongside ASCII art.  It supports custom ASCII art uploads
via a web interface and shows information about the OS, kernel, CPU, memory,
and uptime.")
    (home-page "https://github.com/Senya44ka/anyfetch")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16. venice-cli-bin — CLI for venice.ai (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public venice-cli-bin
  (package
    (name "venice-cli-bin")
    (version "0.1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/api/v4/projects/76426846/"
                    "packages/generic/venice-cli/v" version
                    "/venice-linux-amd64"))
              (sha256
               (base32
                "15kys2in2r9rm3aqy4nhpf9nhb0800xc7rsr4cl7498am0r87i9g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("venice-linux-amd64" "bin/venice-cli"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/venice-cli")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for venice.ai")
    (description "Venice-cli is a command-line tool for interacting with the
venice.ai privacy-focused AI platform.  It provides interactive chat
sessions, model selection, and conversation management from the terminal.")
    (home-page "https://gitlab.com/Plague_Doctor/venice-cli")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. plugdata-bin — Pure Data with JUCE GUI (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public plugdata-bin
  (package
    (name "plugdata-bin")
    (version "0.9.3-2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://plugdata-team.github.io/plugdata/"
                    "releases/download/v" version
                    "/plugdata-Arch-x64.tar.xz"))
              (sha256
               (base32
                "024fgbzd67awmz89l2m4zlbl64rwksb9xv03hh5vy6mv01gn72ld"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/lib/" "lib/")
               ("usr/share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "plugin wrapper for Pure Data with a modern GUI")
    (description "Plugdata is a plugin wrapper around Pure Data that adds
a modern JUCE-based graphical interface.  It allows patching and running
Pure Data audio graphs as standalone applications or as VST3/CLAP/LV2
plugins inside digital audio workstations.")
    (home-page "https://plugdata.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. blink-player-bin — Jellyfin client (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public blink-player-bin
  (package
    (name "blink-player-bin")
    (version "1.0.0-alpha04")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/prayag17/Blink/releases/download/v"
                    version "/Blink_1.0.0-alpha.4_amd64.deb"))
              (sha256
               (base32
                "0wpliwd239d753v90i6sn99cmngk6wjhrv1254801daa66rx504j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern desktop Jellyfin client built with Tauri")
    (description "Blink is a modern desktop client for the Jellyfin media
server.  Built with Tauri and React, it provides a clean interface for
browsing and streaming media from a self-hosted Jellyfin instance.")
    (home-page "https://github.com/prayag17/Blink")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. famistudio-bin — NES/Famicom music editor (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public famistudio-bin
  (package
    (name "famistudio-bin")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BleuBleu/FamiStudio/releases/download/"
                    version "/FamiStudio"
                    (string-delete #\. version)
                    "-LinuxAMD64.zip"))
              (sha256
               (base32
                "0gq9dh6wa8j10i6q7p5fcgmvyi5iz8g33ars3wi8siv1rjcn8wdh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/famistudio/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/famistudio")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/famistudio")
                       (lambda (port)
                         (format port "#!/bin/sh\nexec ~a/FamiStudio \"$@\"\n"
                                 share)))
                     (chmod (string-append bin "/famistudio") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "music editor for the Nintendo Entertainment System")
    (description "FamiStudio is a music editor and tracker for creating
authentic NES/Famicom music.  It features a piano-roll interface, instrument
editing, FamiTracker import, and export to multiple formats including NSF,
ROM, WAV, and MP3.")
    (home-page "https://famistudio.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. dcvviewer-bin — NICE DCV remote desktop viewer (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public dcvviewer-bin
  (package
    (name "dcvviewer-bin")
    (version "2024.0.8004")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://d1uj6qtbmh3dt5.cloudfront.net/2024.0/Clients/"
                    "nice-dcv-viewer_" version
                    "-1_amd64.ubuntu2404.deb"))
              (sha256
               (base32
                "16vyzfcxrh3anrp92xd9x0s7glhv091j9z9bn6wwmpj23p15n9f8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "NICE DCV remote desktop viewer client")
    (description "NICE DCV Viewer is the client application for connecting
to NICE DCV (formerly Amazon DCV) remote desktop sessions.  It supports
high-performance streaming of graphics-intensive applications with adaptive
encoding, USB device forwarding, and multi-monitor support.")
    (home-page "https://www.amazondcv.com/")
    ;; NICE DCV is proprietary/commercial
    (license nonfree-license)))

;;; -------------------------------------------------------------------
;;; 21. pdfmerger — Qt frontend for pdfunite
;;; -------------------------------------------------------------------
(define-public pdfmerger
  (package
    (name "pdfmerger")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/gBischof/pdfmerger/-/archive/v"
                    version "/pdfmerger-v" version ".tar.gz"))
              (sha256
               (base32
                "052p8nnj3g2xg8nish88xvzlplnhhbl0ggr3yximc8k40h3qyy73"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test target
    (inputs (list qtbase-5))
    (native-inputs (list qttools-5))
    (synopsis "simple Qt frontend for merging PDF files")
    (description "PDFMerger is a lightweight graphical tool for merging
multiple PDF files into one.  It provides a drag-and-drop interface built
with Qt5 and uses pdfunite from the Poppler utilities as its backend.")
    (home-page "https://gitlab.com/gBischof/pdfmerger")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. nview — minimalistic image viewer
;;; -------------------------------------------------------------------
(define-public nview
  (package
    (name "nview")
    (version "0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/d99kris/nview/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0snn1q6chrifs0awddql28ssp03vks3anf2gi9014z4a7yhzmzh5"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test target
    (inputs (list qtbase imagemagick))
    (synopsis "minimalistic image viewer")
    (description "Nview is a minimalistic image viewer for Linux that
supports a wide range of image formats via ImageMagick.  It provides basic
viewing features including zoom, pan, rotation, and slideshow mode in a
lightweight Qt-based interface.")
    (home-page "https://github.com/d99kris/nview")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 23. python-trezor — Python library for TREZOR hardware wallet
;;; -------------------------------------------------------------------
(define-public python-trezor
  (package
    (name "python-trezor")
    (version "0.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/t/"
                    "trezor/trezor-" version ".tar.gz"))
              (sha256
               (base32
                "0115xq821pa96zr06z4cb40r267748l41vxx79kic9sv64h8w2ac"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require connected hardware
    (propagated-inputs
     (list python-click
           python-construct
           python-construct-classes
           python-cryptography
           python-ecdsa
           python-mnemonic
           python-protobuf
           python-requests
           python-attrs
           python-typing-extensions))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python library for communicating with TREZOR hardware wallets")
    (description "Python-trezor is the official Python client library for
communicating with TREZOR hardware cryptocurrency wallets.  It provides
command-line tools and a Python API for signing transactions, managing
accounts, and updating firmware on Trezor devices.")
    (home-page "https://github.com/trezor/trezor-firmware")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 24. alsaplayer — multi-threaded PCM player
;;; -------------------------------------------------------------------
(define-public alsaplayer
  (package
    (name "alsaplayer")
    (version "0.99.82")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alsaplayer/alsaplayer/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1k7pqh3ymwhh70cv6v3zzy2nw2ys663dpd1ym7d02kx3l2w0i8zc"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (inputs
     (list alsa-lib))
    (synopsis "multi-threaded PCM audio player for ALSA")
    (description "AlsaPlayer is a heavily multi-threaded PCM player that
exercises the ALSA library and driver subsystem.  It features real-time
visual scopes, playlist management, and a plugin architecture for input
formats, output methods, and visualization effects.")
    (home-page "https://github.com/alsaplayer/alsaplayer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. svxlink-sounds-en-us-heather — SvxLink voice files
;;; -------------------------------------------------------------------
(define-public svxlink-sounds-en-us-heather
  (package
    (name "svxlink-sounds-en-us-heather")
    (version "24.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sm0svx/svxlink-sounds-en_US-heather/"
                    "releases/download/" version
                    "/svxlink-sounds-en_US-heather-16k-" version ".tar.bz2"))
              (sha256
               (base32
                "1367ddkqnli9sygbzs7hmds8y5p4a0106hypxisdaqh2fgsq9fwm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/svxlink/sounds/en_US/heather/"))))
    (synopsis "English voice pack for SvxLink (Heather, 16kHz)")
    (description "This package provides the English (US) voice recordings
by Heather for the SvxLink amateur radio repeater system.  The audio files
are sampled at 16kHz and cover all standard SvxLink voice prompts for
EchoLink, parrot, and repeater logic modules.")
    (home-page "https://github.com/sm0svx/svxlink-sounds-en_US-heather")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 26. adbmanager-bin — ADB manager for Android devices (prebuilt)
;;; -------------------------------------------------------------------
(define-public adbmanager-bin
  (package
    (name "adbmanager-bin")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AKotov-dev/adbmanager/releases/"
                    "download/v" version "/adbmanager_" version
                    "-0.mrx9_amd64.deb"))
              (sha256
               (base32
                "1j0p0h52yis896bmb91l8rs0ppqfavcwr431gxp09cblpyhdp27b"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical ADB manager for Android devices")
    (description "ADBManager is a graphical tool for managing Android devices
via ADB (Android Debug Bridge).  It provides a user-friendly interface for
file transfer, app installation, screen mirroring, and device control without
using the command line.")
    (home-page "https://github.com/AKotov-dev/adbmanager")
    (license license:gpl3)))
