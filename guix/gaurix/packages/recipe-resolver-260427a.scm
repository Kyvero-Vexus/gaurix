;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427a
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (

            pdf-simple-sign-git
            pdf-zip
            pdfalto
            pdfcpu-bin
            pdfio
            pdfjumbler-git
            pdfmixtool-git
            pdfquirk
            pdfquirk-git
            pdfrankenstein
            pdfreflow
            pdfscale
            pdftilecut
            pdfutil
            pdfx
            perl-acme-cow
            perl-algorithm-checkdigits
            perl-algorithm-loops
            perl-anyevent-http
            perl-app-cmd
            perl-autobox-core
            perl-build
            perl-business-creditcard
            perl-cam-pdf
            perl-config-std
            perl-config-yaml
            perl-data-hexdumper
            perl-data-walk
            perl-devel-size
            perl-digest-adler32
            perl-file-find-rule-vcs
            perl-file-flat
            perl-file-moreutil
            perl-file-treecreate
            perl-font-freetype
            perl-furl
            perl-html-clean
            perl-html-restrict
            perl-html-tiny
            perl-http-browserdetect
            perl-io-null
            perl-io-socket-timeout
            perl-iterator-simple
            perl-latex-encode
            perl-lazy-utils
            perl-lingua-identify
            perl-lingua-stem-snowball
            perl-log-any-iflog
            perl-log-tree
            perl-marc-charset
            perl-marc-record
            perl-match-simple
            perl-math-bigint
            perl-math-counting
            perl-math-int64
            perl-math-prime-util
            perl-math-prime-util-gmp
            perl-mime-encwords
            perl-mo
            perl-module-release
            perl-net-frame
            perl-net-sftp
            perl-net-websocket-server
            perl-ouch
            perl-parse-functions
            pngphoon
            cursewords
            growpartfs
            fortune-mod-confucius
            fortune-mod-asoiaf
            fortune-mod-darkknight
            fortune-mod-limericks
            fortune-mod-ibash
            paping
            babi
            yeet
            hdiff
            gupload
            fireworkrs
            eddy
            brename-bin
            tuifimanager
            nvrs
            pstack
            carburetor
            anymeal
            jellycli
            jwasm
            pw-volume
            mommy
            cwdiff
            gojq-bin
            charasay-bin
            rascii
            rargs-bin
            rainbowpath-bin
            beefetch
            gengou
            sisyphus
            shq
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; pdf-simple-sign-git --- simple PDF signer
(define-public pdf-simple-sign-git
  (package
    (name "pdf-simple-sign-git")
    (version "v1.1.1.r1.gd4ff9a6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdf-simple-sign-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple PDF signer")
    (description "Simple PDF signer.")
    (home-page "https://git.janouch.name/p/pdf-simple-sign")
    (license license:nonfree)))

;;; pdf-zip --- combines two pdf files into one while taking the pages alternating from ...
(define-public pdf-zip
  (package
    (name "pdf-zip")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdf-zip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "combines two pdf files into one while taking the pages alternating from ...")
    (description "Combines two pdf files into one while taking the pages alternating from one and the other file (shuffling them into each other). Containes a variant reversing the second file before combining.")
    (home-page "https://aur.archlinux.org/packages/pdf-zip")
    (license license:nonfree)))

;;; pdfalto --- pDF to XML ALTO file converter
(define-public pdfalto
  (package
    (name "pdfalto")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfalto.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pDF to XML ALTO file converter")
    (description "PDF to XML ALTO file converter.")
    (home-page "https://github.com/kermitt2/pdfalto")
    (license license:gpl2)))

;;; pdfcpu-bin --- a PDF processor written in Go.
(define-public pdfcpu-bin
  (package
    (name "pdfcpu-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfcpu-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a PDF processor written in Go.")
    (description "A PDF processor written in Go.")
    (home-page "https://pdfcpu.io/")
    (license license:asl2.0)))

;;; pdfio --- simple C library for reading and writing PDF files
(define-public pdfio
  (package
    (name "pdfio")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfio.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple C library for reading and writing PDF files")
    (description "Simple C library for reading and writing PDF files.")
    (home-page "https://github.com/michaelrsweet/pdfio")
    (license license:nonfree)))

;;; pdfjumbler-git --- a simple tool to rearrange/merge/delete/rotate pages from PDF files.
(define-public pdfjumbler-git
  (package
    (name "pdfjumbler-git")
    (version "r60.57c1b5a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfjumbler-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a simple tool to rearrange/merge/delete/rotate pages from PDF files.")
    (description "A simple tool to rearrange/merge/delete/rotate pages from PDF files.")
    (home-page "https://github.com/mgropp/pdfjumbler")
    (license license:gpl3+)))

;;; pdfmixtool-git --- an application to perform common editing operations on PDF files
(define-public pdfmixtool-git
  (package
    (name "pdfmixtool-git")
    (version "r601.3b3f7a4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfmixtool-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "an application to perform common editing operations on PDF files")
    (description "An application to perform common editing operations on PDF files.")
    (home-page "https://www.scarpetta.eu/pdfmixtool")
    (license license:gpl3+)))

;;; pdfquirk --- creating PDFs from images or scanner made easy
(define-public pdfquirk
  (package
    (name "pdfquirk")
    (version "0.95")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfquirk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "creating PDFs from images or scanner made easy")
    (description "Creating PDFs from images or scanner made easy.")
    (home-page "https://dragotin.github.io/quirksite")
    (license license:gpl3+)))

;;; pdfquirk-git --- creating PDFs from images or scanner made easy
(define-public pdfquirk-git
  (package
    (name "pdfquirk-git")
    (version "continuous.r18.g3f45dc9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfquirk-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "creating PDFs from images or scanner made easy")
    (description "Creating PDFs from images or scanner made easy.")
    (home-page "https://dragotin.github.io/quirksite")
    (license license:gpl3+)))

;;; pdfrankenstein --- pDF Annotator of Nightmares
(define-public pdfrankenstein
  (package
    (name "pdfrankenstein")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfrankenstein.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pDF Annotator of Nightmares")
    (description "PDF Annotator of Nightmares.")
    (home-page "https://github.com/oxplot/pdfrankenstein")
    (license license:nonfree)))

;;; pdfreflow --- operates on the output of pdftohtml and reflows the texts into paragraphs.
(define-public pdfreflow
  (package
    (name "pdfreflow")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfreflow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "operates on the output of pdftohtml and reflows the texts into paragraphs.")
    (description "Operates on the output of pdftohtml and reflows the texts into paragraphs.")
    (home-page "http://pdfreflow.sourceforge.net/")
    (license license:nonfree)))

;;; pdfscale --- bash Script to Scale and Resize PDFs using Ghostscript
(define-public pdfscale
  (package
    (name "pdfscale")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfscale.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bash Script to Scale and Resize PDFs using Ghostscript")
    (description "Bash Script to Scale and Resize PDFs using Ghostscript.")
    (home-page "https://github.com/tavinus/pdfScale")
    (license license:gpl3+)))

;;; pdftilecut --- pdftilecut lets you sub-divide a PDF page(s) into smaller pages
(define-public pdftilecut
  (package
    (name "pdftilecut")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdftilecut.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pdftilecut lets you sub-divide a PDF page(s) into smaller pages")
    (description "Pdftilecut lets you sub-divide a PDF page(s) into smaller pages.")
    (home-page "https://github.com/oxplot/pdftilecut")
    (license license:nonfree)))

;;; pdfutil --- a utility for PDF document manipulation.
(define-public pdfutil
  (package
    (name "pdfutil")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfutil.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a utility for PDF document manipulation.")
    (description "A utility for PDF document manipulation.")
    (home-page "https://github.com/J-F-Liu/lopdf/tree/master/pdfutil")
    (license license:expat)))

;;; pdfx --- extract text, metadata and references from PDF.
(define-public pdfx
  (package
    (name "pdfx")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdfx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extract text, metadata and references from PDF.")
    (description "Extract text, metadata and references from PDF.")
    (home-page "https://github.com/metachris/pdfx")
    (license license:nonfree)))

;;; perl-acme-cow --- acme_Perfect Perl support for cowsay cowfiles
(define-public perl-acme-cow
  (package
    (name "perl-acme-cow")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-acme-cow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "acme_Perfect Perl support for cowsay cowfiles")
    (description "Acme_Perfect Perl support for cowsay cowfiles.")
    (home-page "https://metacpan.org/pod/Acme::Cow")
    (license license:artistic2.0)))

;;; perl-algorithm-checkdigits --- perl extension to generate and test check digits
(define-public perl-algorithm-checkdigits
  (package
    (name "perl-algorithm-checkdigits")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-algorithm-checkdigits.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl extension to generate and test check digits")
    (description "Perl extension to generate and test check digits.")
    (home-page "https://metacpan.org/release/Algorithm-CheckDigits")
    (license license:artistic2.0)))

;;; perl-algorithm-loops --- algorithm::Loops - looping constructs: NestedLoops, MapCar*, Filter, and...
(define-public perl-algorithm-loops
  (package
    (name "perl-algorithm-loops")
    (version "1.032")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-algorithm-loops.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "algorithm::Loops - looping constructs: NestedLoops, MapCar*, Filter, and...")
    (description "Algorithm::Loops - looping constructs: NestedLoops, MapCar*, Filter, and NextPermute*.")
    (home-page "https://metacpan.org/pod/Algorithm::Loops")
    (license license:gpl3+)))

;;; perl-anyevent-http --- simple but non-blocking HTTP/HTTPS client
(define-public perl-anyevent-http
  (package
    (name "perl-anyevent-http")
    (version "2.25")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-anyevent-http.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple but non-blocking HTTP/HTTPS client")
    (description "Simple but non-blocking HTTP/HTTPS client.")
    (home-page "https://metacpan.org/release/AnyEvent-HTTP")
    (license license:gpl3+)))

;;; perl-app-cmd --- write command line apps with less suffering
(define-public perl-app-cmd
  (package
    (name "perl-app-cmd")
    (version "0.340")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-app-cmd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "write command line apps with less suffering")
    (description "Write command line apps with less suffering.")
    (home-page "https://metacpan.org/release/RJBS/App-Cmd-0.340")
    (license license:artistic2.0)))

;;; perl-autobox-core --- provide core functions to autoboxed scalars, arrays and hashes
(define-public perl-autobox-core
  (package
    (name "perl-autobox-core")
    (version "1.33")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-autobox-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "provide core functions to autoboxed scalars, arrays and hashes")
    (description "Provide core functions to autoboxed scalars, arrays and hashes.")
    (home-page "https://metacpan.org/release/autobox-Core")
    (license license:gpl3+)))

;;; perl-build --- compile and install perl
(define-public perl-build
  (package
    (name "perl-build")
    (version "1.31")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-build.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "compile and install perl")
    (description "Compile and install perl.")
    (home-page "https://github.com/tokuhirom/Perl-Build")
    (license license:gpl3+)))

;;; perl-business-creditcard --- validate/generate credit card checksums/names
(define-public perl-business-creditcard
  (package
    (name "perl-business-creditcard")
    (version "0.39")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-business-creditcard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "validate/generate credit card checksums/names")
    (description "Validate/generate credit card checksums/names.")
    (home-page "https://metacpan.org/release/IVAN/Business-CreditCard-0.39")
    (license license:artistic2.0)))

;;; perl-cam-pdf --- pDF manipulation library
(define-public perl-cam-pdf
  (package
    (name "perl-cam-pdf")
    (version "1.60")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-cam-pdf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pDF manipulation library")
    (description "PDF manipulation library.")
    (home-page "http://search.cpan.org/dist/Algorithm-CheckDigits/")
    (license license:artistic2.0)))

;;; perl-config-std --- config::Std - Load and save configuration files in a standard format
(define-public perl-config-std
  (package
    (name "perl-config-std")
    (version "0.903")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-config-std.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "config::Std - Load and save configuration files in a standard format")
    (description "Config::Std - Load and save configuration files in a standard format.")
    (home-page "https://metacpan.org/release/Config-Std")
    (license license:gpl3+)))

;;; perl-config-yaml --- simple configuration automation
(define-public perl-config-yaml
  (package
    (name "perl-config-yaml")
    (version "1.42")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-config-yaml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple configuration automation")
    (description "Simple configuration automation.")
    (home-page "http://search.cpan.org/dist/Config-YAML")
    (license license:gpl3+)))

;;; perl-data-hexdumper --- perl CPAN Data::Hexdumper - Make binary data human-readable
(define-public perl-data-hexdumper
  (package
    (name "perl-data-hexdumper")
    (version "3.0001")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-data-hexdumper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl CPAN Data::Hexdumper - Make binary data human-readable")
    (description "Perl CPAN Data::Hexdumper - Make binary data human-readable.")
    (home-page "https://metacpan.org/release/Data-Hexdumper")
    (license license:artistic2.0)))

;;; perl-data-walk --- perl CPAN Data::Walk - Traverse Perl data structures.
(define-public perl-data-walk
  (package
    (name "perl-data-walk")
    (version "2.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-data-walk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl CPAN Data::Walk - Traverse Perl data structures.")
    (description "Perl CPAN Data::Walk - Traverse Perl data structures.")
    (home-page "https://metacpan.org/release/Data-Walk")
    (license license:gpl3+)))

;;; perl-devel-size --- perl extension for finding the memory usage of Perl variables
(define-public perl-devel-size
  (package
    (name "perl-devel-size")
    (version "0.87")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-devel-size.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl extension for finding the memory usage of Perl variables")
    (description "Perl extension for finding the memory usage of Perl variables.")
    (home-page "https://metacpan.org/release/Devel-Size")
    (license license:nonfree)))

;;; perl-digest-adler32 --- the Adler-32 checksum
(define-public perl-digest-adler32
  (package
    (name "perl-digest-adler32")
    (version "0.03")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-digest-adler32.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the Adler-32 checksum")
    (description "The Adler-32 checksum.")
    (home-page "http://search.cpan.org/dist/Digest-Adler32")
    (license license:gpl3+)))

;;; perl-file-find-rule-vcs --- file::Find::Rule::VCS - Exclude files/directories for Version Control Sy...
(define-public perl-file-find-rule-vcs
  (package
    (name "perl-file-find-rule-vcs")
    (version "1.09")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-file-find-rule-vcs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "file::Find::Rule::VCS - Exclude files/directories for Version Control Sy...")
    (description "File::Find::Rule::VCS - Exclude files/directories for Version Control Systems.")
    (home-page "https://metacpan.org/release/File-Find-Rule-VCS/")
    (license license:gpl3+)))

;;; perl-file-flat --- implements a flat filesystem
(define-public perl-file-flat
  (package
    (name "perl-file-flat")
    (version "1.07")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-file-flat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "implements a flat filesystem")
    (description "Implements a flat filesystem.")
    (home-page "https://metacpan.org/release/File-Flat")
    (license license:gpl3+)))

;;; perl-file-moreutil --- file-related utilities
(define-public perl-file-moreutil
  (package
    (name "perl-file-moreutil")
    (version "0.628")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-file-moreutil.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "file-related utilities")
    (description "File-related utilities.")
    (home-page "https://metacpan.org/release/File-MoreUtil")
    (license license:gpl3+)))

;;; perl-file-treecreate --- recursively create a directory tree
(define-public perl-file-treecreate
  (package
    (name "perl-file-treecreate")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-file-treecreate.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "recursively create a directory tree")
    (description "Recursively create a directory tree.")
    (home-page "https://metacpan.org/release/File-TreeCreate")
    (license license:expat)))

;;; perl-font-freetype --- read font files and render glyphs from Perl using FreeType2
(define-public perl-font-freetype
  (package
    (name "perl-font-freetype")
    (version "0.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-font-freetype.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "read font files and render glyphs from Perl using FreeType2")
    (description "Read font files and render glyphs from Perl using FreeType2.")
    (home-page "https://metacpan.org/release/Font-FreeType")
    (license license:gpl3+)))

;;; perl-furl --- lightning-fast URL fetcher
(define-public perl-furl
  (package
    (name "perl-furl")
    (version "3.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-furl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightning-fast URL fetcher")
    (description "Lightning-fast URL fetcher.")
    (home-page "https://metacpan.org/release/Furl")
    (license license:gpl3+)))

;;; perl-html-clean --- cleans up HTML code for web browsers, not humans
(define-public perl-html-clean
  (package
    (name "perl-html-clean")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-html-clean.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cleans up HTML code for web browsers, not humans")
    (description "Cleans up HTML code for web browsers, not humans.")
    (home-page "https://metacpan.org/release/HTML-Clean")
    (license license:gpl3+)))

;;; perl-html-restrict --- strip unwanted HTML tags and attributes
(define-public perl-html-restrict
  (package
    (name "perl-html-restrict")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-html-restrict.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "strip unwanted HTML tags and attributes")
    (description "Strip unwanted HTML tags and attributes.")
    (home-page "https://metacpan.org/pod/HTML::Restrict")
    (license license:artistic2.0)))

;;; perl-html-tiny --- lightweight, dependency free HTML/XML generation
(define-public perl-html-tiny
  (package
    (name "perl-html-tiny")
    (version "1.08")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-html-tiny.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight, dependency free HTML/XML generation")
    (description "Lightweight, dependency free HTML/XML generation.")
    (home-page "https://metacpan.org/release/ARISTOTLE/HTML-Tiny-1.08")
    (license license:artistic2.0)))

;;; perl-http-browserdetect --- determine Web browser, version, and platform from an HTTP user agent string
(define-public perl-http-browserdetect
  (package
    (name "perl-http-browserdetect")
    (version "3.45")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-http-browserdetect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "determine Web browser, version, and platform from an HTTP user agent string")
    (description "Determine Web browser, version, and platform from an HTTP user agent string.")
    (home-page "https://metacpan.org/dist/HTTP-BrowserDetect")
    (license license:artistic2.0)))

;;; perl-io-null --- iO::Null - class for null filehandles
(define-public perl-io-null
  (package
    (name "perl-io-null")
    (version "1.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-io-null.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "iO::Null - class for null filehandles")
    (description "IO::Null - class for null filehandles.")
    (home-page "http://search.cpan.org/dist/IO-Null/")
    (license license:gpl3+)))

;;; perl-io-socket-timeout --- iO::Socket with read/write timeout
(define-public perl-io-socket-timeout
  (package
    (name "perl-io-socket-timeout")
    (version "0.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-io-socket-timeout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "iO::Socket with read/write timeout")
    (description "IO::Socket with read/write timeout.")
    (home-page "https://metacpan.org/release/IO-Socket-Timeout")
    (license license:gpl3+)))

;;; perl-iterator-simple --- simple iterator and utilities
(define-public perl-iterator-simple
  (package
    (name "perl-iterator-simple")
    (version "0.07")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-iterator-simple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple iterator and utilities")
    (description "Simple iterator and utilities.")
    (home-page "https://metacpan.org/dist/Iterator-Simple")
    (license license:artistic2.0)))

;;; perl-latex-encode --- encode characters for LaTeX formatting
(define-public perl-latex-encode
  (package
    (name "perl-latex-encode")
    (version "0.092.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-latex-encode.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "encode characters for LaTeX formatting")
    (description "Encode characters for LaTeX formatting.")
    (home-page "https://metacpan.org/dist/LaTeX-Encode")
    (license license:artistic2.0)))

;;; perl-lazy-utils --- oRKUN's collection of utility functions Lazy::Util
(define-public perl-lazy-utils
  (package
    (name "perl-lazy-utils")
    (version "1.22")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-lazy-utils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "oRKUN's collection of utility functions Lazy::Util")
    (description "ORKUN's collection of utility functions Lazy::Util.")
    (home-page "https://metacpan.org/release/Lazy-Utils")
    (license license:gpl3+)))

;;; perl-lingua-identify --- language identification
(define-public perl-lingua-identify
  (package
    (name "perl-lingua-identify")
    (version "0.56")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-lingua-identify.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "language identification")
    (description "Language identification.")
    (home-page "https://metacpan.org/release/Lingua-Identify")
    (license license:gpl3+)))

;;; perl-lingua-stem-snowball --- perl/CPAN Module Lingua::Stem::Snowball: Perl interface to Snowball stem...
(define-public perl-lingua-stem-snowball
  (package
    (name "perl-lingua-stem-snowball")
    (version "0.952")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-lingua-stem-snowball.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl/CPAN Module Lingua::Stem::Snowball: Perl interface to Snowball stem...")
    (description "Perl/CPAN Module Lingua::Stem::Snowball: Perl interface to Snowball stemmers.")
    (home-page "https://metacpan.org/release/Lingua-Stem-Snowball")
    (license license:gpl3+)))

;;; perl-log-any-iflog --- load Log::Any only if "logging is enabled"
(define-public perl-log-any-iflog
  (package
    (name "perl-log-any-iflog")
    (version "0.090")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-log-any-iflog.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "load Log::Any only if "logging is enabled"")
    (description "Load Log::Any only if "logging is enabled".")
    (home-page "https://metacpan.org/release/Log-Any-IfLOG")
    (license license:gpl3+)))

;;; perl-log-tree --- perl/CPAN Module Log::Tree - lightweight but highly configuration loggin...
(define-public perl-log-tree
  (package
    (name "perl-log-tree")
    (version "0.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-log-tree.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl/CPAN Module Log::Tree - lightweight but highly configuration loggin...")
    (description "Perl/CPAN Module Log::Tree - lightweight but highly configuration logging class.")
    (home-page "https://metacpan.org/release/Log-Tree")
    (license license:artistic2.0)))

;;; perl-marc-charset --- perl/CPAN Module MARC::Charset: convert MARC-8 encoded strings to UTF-8
(define-public perl-marc-charset
  (package
    (name "perl-marc-charset")
    (version "1.35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-marc-charset.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl/CPAN Module MARC::Charset: convert MARC-8 encoded strings to UTF-8")
    (description "Perl/CPAN Module MARC::Charset: convert MARC-8 encoded strings to UTF-8.")
    (home-page "https://metacpan.org/release/MARC-Charset")
    (license license:gpl3+)))

;;; perl-marc-record --- perl/CPAN Module MARC::Record: Perl extension for handling MARC records
(define-public perl-marc-record
  (package
    (name "perl-marc-record")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-marc-record.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl/CPAN Module MARC::Record: Perl extension for handling MARC records")
    (description "Perl/CPAN Module MARC::Record: Perl extension for handling MARC records.")
    (home-page "https://metacpan.org/release/MARC-Record")
    (license license:gpl3+)))

;;; perl-match-simple --- perl match::simple CPAN module
(define-public perl-match-simple
  (package
    (name "perl-match-simple")
    (version "0.012")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-match-simple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl match::simple CPAN module")
    (description "Perl match::simple CPAN module.")
    (home-page "http://search.cpan.org/dist/match-simple/")
    (license license:nonfree)))

;;; perl-math-bigint --- math::BigInt - Arbitrary size integer/float math package
(define-public perl-math-bigint
  (package
    (name "perl-math-bigint")
    (version "2.005003")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-bigint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "math::BigInt - Arbitrary size integer/float math package")
    (description "Math::BigInt - Arbitrary size integer/float math package.")
    (home-page "https://metacpan.org/release/Math-BigInt")
    (license license:gpl3+)))

;;; perl-math-counting --- perl module for combinatorial counting operations
(define-public perl-math-counting
  (package
    (name "perl-math-counting")
    (version "0.1307")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-counting.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl module for combinatorial counting operations")
    (description "Perl module for combinatorial counting operations.")
    (home-page "https://metacpan.org/release/Math-Counting")
    (license license:gpl3+)))

;;; perl-math-int64 --- manipulate 64 bits integers in Perl
(define-public perl-math-int64
  (package
    (name "perl-math-int64")
    (version "0.57")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-int64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "manipulate 64 bits integers in Perl")
    (description "Manipulate 64 bits integers in Perl.")
    (home-page "http://search.cpan.org/dist/Math-Int64")
    (license license:gpl3+)))

;;; perl-math-prime-util --- math::Prime::Util - utilities related to prime numbers, including fast s...
(define-public perl-math-prime-util
  (package
    (name "perl-math-prime-util")
    (version "0.74")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-prime-util.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "math::Prime::Util - utilities related to prime numbers, including fast s...")
    (description "Math::Prime::Util - utilities related to prime numbers, including fast sieves and factoring (ntheory).")
    (home-page "https://metacpan.org/release/Math-Prime-Util")
    (license license:gpl3+)))

;;; perl-math-prime-util-gmp --- math::Prime::Util::GMP - utilities related to prime numbers and factorin...
(define-public perl-math-prime-util-gmp
  (package
    (name "perl-math-prime-util-gmp")
    (version "0.53")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-math-prime-util-gmp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "math::Prime::Util::GMP - utilities related to prime numbers and factorin...")
    (description "Math::Prime::Util::GMP - utilities related to prime numbers and factoring, using GMP.")
    (home-page "https://metacpan.org/release/Math-Prime-Util-GMP")
    (license license:gpl3+)))

;;; perl-mime-encwords --- deal with RFC 2047 encoded words (improved)
(define-public perl-mime-encwords
  (package
    (name "perl-mime-encwords")
    (version "1.015.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-mime-encwords.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "deal with RFC 2047 encoded words (improved)")
    (description "Deal with RFC 2047 encoded words (improved).")
    (home-page "https://metacpan.org/pod/MIME::EncWords")
    (license license:artistic2.0)))

;;; perl-mo --- no description available
(define-public perl-mo
  (package
    (name "perl-mo")
    (version "0.40")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-mo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "no description available")
    (description "No description available.")
    (home-page "https://metacpan.org/release/Mo")
    (license license:gpl3+)))

;;; perl-module-release --- module::Releases - automate software releases
(define-public perl-module-release
  (package
    (name "perl-module-release")
    (version "2.133")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-module-release.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "module::Releases - automate software releases")
    (description "Module::Releases - automate software releases.")
    (home-page "https://metacpan.org/release/Module-Release/")
    (license license:gpl3+)))

;;; perl-net-frame --- the base framework for frame crafting
(define-public perl-net-frame
  (package
    (name "perl-net-frame")
    (version "1.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-net-frame.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the base framework for frame crafting")
    (description "The base framework for frame crafting.")
    (home-page "https://metacpan.org/release/Net-Frame")
    (license license:gpl3+)))

;;; perl-net-sftp --- secure File Transfer Protocol client
(define-public perl-net-sftp
  (package
    (name "perl-net-sftp")
    (version "0.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-net-sftp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "secure File Transfer Protocol client")
    (description "Secure File Transfer Protocol client.")
    (home-page "http://search.cpan.org/~dbrobins/Net-SFTP/")
    (license license:nonfree)))

;;; perl-net-websocket-server --- a straightforward Perl WebSocket server with minimal dependencies.
(define-public perl-net-websocket-server
  (package
    (name "perl-net-websocket-server")
    (version "0.004000")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-net-websocket-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a straightforward Perl WebSocket server with minimal dependencies.")
    (description "A straightforward Perl WebSocket server with minimal dependencies.")
    (home-page "https://metacpan.org/release/Net-WebSocket-Server")
    (license license:gpl3+)))

;;; perl-ouch --- perl module for exceptions that don't hurt
(define-public perl-ouch
  (package
    (name "perl-ouch")
    (version "0.0501")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-ouch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "perl module for exceptions that don't hurt")
    (description "Perl module for exceptions that don't hurt.")
    (home-page "https://metacpan.org/release/Ouch")
    (license license:gpl3+)))

;;; perl-parse-functions --- parse-Functions - list all the functions in source code
(define-public perl-parse-functions
  (package
    (name "perl-parse-functions")
    (version "0.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-parse-functions.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "parse-Functions - list all the functions in source code")
    (description "Parse-Functions - list all the functions in source code.")
    (home-page "http://search.cpan.org/dist/Parse-Functions/")
    (license license:gpl3+)))

;;; pngphoon --- create monochromatic image displaying the current phase of the moon
(define-public pngphoon
  (package
    (name "pngphoon")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pngphoon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "create monochromatic image displaying the current phase of the moon")
    (description "Create monochromatic image displaying the current phase of the moon.")
    (home-page "https://git.h8u.de/svolli/pngphoon")
    (license license:bsd-2)))

;;; cursewords --- terminal-based crossword puzzle solver
(define-public cursewords
  (package
    (name "cursewords")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cursewords.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based crossword puzzle solver")
    (description "Terminal-based crossword puzzle solver.")
    (home-page "https://github.com/thisisparker/cursewords")
    (license license:nonfree)))

;;; growpartfs --- extends a partition to fill available space
(define-public growpartfs
  (package
    (name "growpartfs")
    (version "1.00")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/growpartfs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extends a partition to fill available space")
    (description "Extends a partition to fill available space.")
    (home-page "https://aur.archlinux.org/packages/growpartfs")
    (license license:gpl3+)))

;;; fortune-mod-confucius --- fortune cookies: Confucius sayings.)
(define-public fortune-mod-confucius
  (package
    (name "fortune-mod-confucius")
    (version "20200529")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-confucius.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fortune cookies: Confucius sayings.)")
    (description "Fortune cookies: Confucius sayings.).")
    (home-page "https://billy.wolfe.casa/fortunes/confucius")
    (license license:wtfpl2)))

;;; fortune-mod-asoiaf --- fortune cookies from A Song of Ice and Fire series
(define-public fortune-mod-asoiaf
  (package
    (name "fortune-mod-asoiaf")
    (version "20150916")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-asoiaf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fortune cookies from A Song of Ice and Fire series")
    (description "Fortune cookies from A Song of Ice and Fire series.")
    (home-page "https://github.com/pronoid/fortune-mod-asoiaf")
    (license license:expat)))

;;; fortune-mod-darkknight --- fortune cookies: The Dark Knight (Movie).
(define-public fortune-mod-darkknight
  (package
    (name "fortune-mod-darkknight")
    (version "20091218")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-darkknight.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fortune cookies: The Dark Knight (Movie).")
    (description "Fortune cookies: The Dark Knight (Movie).")
    (home-page "http://www.moviequotedb.com/movies/dark-knight-the.html")
    (license license:nonfree)))

;;; fortune-mod-limericks --- a collection of really funny and perverse limericks.
(define-public fortune-mod-limericks
  (package
    (name "fortune-mod-limericks")
    (version "2021.08.21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-limericks.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a collection of really funny and perverse limericks.")
    (description "A collection of really funny and perverse limericks.")
    (home-page "https://billy.wolfe.casa/fortunes/limericks")
    (license license:wtfpl2)))

;;; fortune-mod-ibash --- a collection of quotes for fortune-mod from http://ibash.org.ru
(define-public fortune-mod-ibash
  (package
    (name "fortune-mod-ibash")
    (version "2022.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-ibash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a collection of quotes for fortune-mod from http://ibash.org.ru")
    (description "A collection of quotes for fortune-mod from http://ibash.org.ru.")
    (home-page "http://ibash.org.ru")
    (license license:nonfree)))

;;; paping --- tCP port testing, emulating the functionality of ping (port ping)
(define-public paping
  (package
    (name "paping")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paping.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tCP port testing, emulating the functionality of ping (port ping)")
    (description "TCP port testing, emulating the functionality of ping (port ping).")
    (home-page "https://code.google.com/archive/p/paping/")
    (license license:expat)))

;;; babi --- a text editor, eventually...
(define-public babi
  (package
    (name "babi")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/babi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a text editor, eventually...")
    (description "A text editor, eventually...")
    (home-page "https://github.com/asottile/babi")
    (license license:expat)))

;;; yeet --- a minimalistic pacman wrapper written in bash
(define-public yeet
  (package
    (name "yeet")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yeet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a minimalistic pacman wrapper written in bash")
    (description "A minimalistic pacman wrapper written in bash.")
    (home-page "https://github.com/gamemaker1/yeet")
    (license license:gpl3+)))

;;; hdiff --- c/C++ library and CLI tool for Diff & Patch between binary files or dire...
(define-public hdiff
  (package
    (name "hdiff")
    (version "4.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hdiff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "c/C++ library and CLI tool for Diff & Patch between binary files or dire...")
    (description "C/C++ library and CLI tool for Diff & Patch between binary files or directories.")
    (home-page "https://github.com/sisong/HDiffPatch")
    (license license:expat)))

;;; gupload --- simple HTTP server to transfer files between machines on the local network
(define-public gupload
  (package
    (name "gupload")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gupload.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple HTTP server to transfer files between machines on the local network")
    (description "Simple HTTP server to transfer files between machines on the local network.")
    (home-page "https://github.com/alexcoder04/gupload")
    (license license:nonfree)))

;;; fireworkrs --- fireworks in your terminal!
(define-public fireworkrs
  (package
    (name "fireworkrs")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fireworkrs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fireworks in your terminal!")
    (description "Fireworks in your terminal!.")
    (home-page "https://github.com/crisidev/fireworkrs")
    (license license:expat)))

;;; eddy --- simple & fast CLI file encryption tool
(define-public eddy
  (package
    (name "eddy")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eddy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple & fast CLI file encryption tool")
    (description "Simple & fast CLI file encryption tool.")
    (home-page "https://github.com/70sh1/eddy")
    (license license:expat)))

;;; brename-bin --- a practical cross-platform command-line tool for safely batch renaming f...
(define-public brename-bin
  (package
    (name "brename-bin")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brename-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a practical cross-platform command-line tool for safely batch renaming f...")
    (description "A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression.")
    (home-page "https://github.com/shenwei356/brename")
    (license license:expat)))

;;; tuifimanager --- a cross-platform terminal-based termux-oriented file manager
(define-public tuifimanager
  (package
    (name "tuifimanager")
    (version "5.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuifimanager.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a cross-platform terminal-based termux-oriented file manager")
    (description "A cross-platform terminal-based termux-oriented file manager.")
    (home-page "https://github.com/GiorgosXou/TUIFIManager")
    (license license:gpl3+)))

;;; nvrs --- fast new version checker for software releases
(define-public nvrs
  (package
    (name "nvrs")
    (version "0.1.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvrs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast new version checker for software releases")
    (description "Fast new version checker for software releases.")
    (home-page "https://github.com/adamperkowski/nvrs")
    (license license:expat)))

;;; pstack --- print stack traces from running processes, or core files.
(define-public pstack
  (package
    (name "pstack")
    (version "2.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pstack.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "print stack traces from running processes, or core files.")
    (description "Print stack traces from running processes, or core files.")
    (home-page "https://github.com/peadar/pstack")
    (license license:nonfree)))

;;; carburetor --- graphical settings app for tractor in GTK
(define-public carburetor
  (package
    (name "carburetor")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/carburetor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical settings app for tractor in GTK")
    (description "Graphical settings app for tractor in GTK.")
    (home-page "https://framagit.org/tractor/carburetor")
    (license license:gpl3+)))

;;; anymeal --- recipe management software. Supports MealMaster recipes, import, export,...
(define-public anymeal
  (package
    (name "anymeal")
    (version "1.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anymeal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "recipe management software. Supports MealMaster recipes, import, export,...")
    (description "Recipe management software. Supports MealMaster recipes, import, export, search, display, edit, and printing them.")
    (home-page "https://github.com/wedesoft/anymeal")
    (license license:gpl3+)))

;;; jellycli --- terminal music player for Jellyfin.
(define-public jellycli
  (package
    (name "jellycli")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jellycli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal music player for Jellyfin.")
    (description "Terminal music player for Jellyfin.")
    (home-page "https://github.com/tryffel/jellycli")
    (license license:gpl3+)))

;;; jwasm --- a free MASM-compatible assembler
(define-public jwasm
  (package
    (name "jwasm")
    (version "2.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jwasm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a free MASM-compatible assembler")
    (description "A free MASM-compatible assembler.")
    (home-page "https://github.com/Baron-von-Riedesel/JWasm")
    (license license:nonfree)))

;;; pw-volume --- basic interface to PipeWire volume controls
(define-public pw-volume
  (package
    (name "pw-volume")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pw-volume.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "basic interface to PipeWire volume controls")
    (description "Basic interface to PipeWire volume controls.")
    (home-page "https://github.com/smasher164/pw-volume")
    (license license:expat)))

;;; mommy --- mommy's here to support you~
(define-public mommy
  (package
    (name "mommy")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mommy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mommy's here to support you~")
    (description "Mommy's here to support you~.")
    (home-page "https://github.com/fwdekker/mommy")
    (license license:unlicense)))

;;; cwdiff --- a wrapper for wdiff to provide colorized output
(define-public cwdiff
  (package
    (name "cwdiff")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cwdiff.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a wrapper for wdiff to provide colorized output")
    (description "A wrapper for wdiff to provide colorized output.")
    (home-page "https://github.com/junghans/cwdiff.git")
    (license license:gpl3+)))

;;; gojq-bin --- pure Go implementation of jq
(define-public gojq-bin
  (package
    (name "gojq-bin")
    (version "0.12.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gojq-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pure Go implementation of jq")
    (description "Pure Go implementation of jq.")
    (home-page "https://github.com/itchyny/gojq")
    (license license:expat)))

;;; charasay-bin --- the future of cowsay 🐮! Colorful characters saying something 🗨️.
(define-public charasay-bin
  (package
    (name "charasay-bin")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/charasay-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the future of cowsay 🐮! Colorful characters saying something 🗨️.")
    (description "The future of cowsay 🐮! Colorful characters saying something 🗨️.")
    (home-page "https://github.com/latipun7/charasay")
    (license license:expat)))

;;; rascii --- advanced image to ASCII art tool & crate written in Rust crabrocket.
(define-public rascii
  (package
    (name "rascii")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rascii.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "advanced image to ASCII art tool & crate written in Rust crabrocket.")
    (description "Advanced image to ASCII art tool & crate written in Rust crabrocket.")
    (home-page "https://github.com/UTFeight/RASCII")
    (license license:expat)))

;;; rargs-bin --- a kind of xargs + awk with pattern-matching support
(define-public rargs-bin
  (package
    (name "rargs-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rargs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "a kind of xargs + awk with pattern-matching support")
    (description "A kind of xargs + awk with pattern-matching support.")
    (home-page "https://github.com/lotabout/rargs")
    (license license:expat)))

;;; rainbowpath-bin --- program for making paths pretty.
(define-public rainbowpath-bin
  (package
    (name "rainbowpath-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rainbowpath-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "program for making paths pretty.")
    (description "Program for making paths pretty.")
    (home-page "https://github.com/Soft/rainbowpath")
    (license license:expat)))

;;; beefetch --- neofetch clone written in Go with the ability to display 🐝
(define-public beefetch
  (package
    (name "beefetch")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/beefetch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "neofetch clone written in Go with the ability to display 🐝")
    (description "Neofetch clone written in Go with the ability to display 🐝.")
    (home-page "https://github.com/mirdukkkkk/beefetch")
    (license license:gpl3)))

;;; gengou --- find japanese era names / era years
(define-public gengou
  (package
    (name "gengou")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gengou.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "find japanese era names / era years")
    (description "Find japanese era names / era years.")
    (home-page "https://github.com/hachiya-kurisu/gengou")
    (license license:bsd-2)))

;;; sisyphus --- convert gemtext to html or markdown
(define-public sisyphus
  (package
    (name "sisyphus")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sisyphus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert gemtext to html or markdown")
    (description "Convert gemtext to html or markdown.")
    (home-page "https://github.com/hachiya-kurisu/sisyphus")
    (license license:bsd-2)))

;;; shq --- shell queue
(define-public shq
  (package
    (name "shq")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shq.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "shell queue")
    (description "Shell queue.")
    (home-page "https://codeberg.org/tippfehlr/shq")
    (license license:expat)))
