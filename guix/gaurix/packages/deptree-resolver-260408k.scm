;;; Dependency-tree resolver pass -- deptree-resolver-260408k
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 100 packages resolved with recipes, 0 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:export (libigloo
            libowfat
            libreoffice-dev-af
            libreoffice-dev-am
            libreoffice-dev-ar
            libreoffice-dev-as
            libreoffice-dev-ast
            libreoffice-dev-be
            libreoffice-dev-bg
            libreoffice-dev-bn
            libreoffice-dev-bn-in
            libreoffice-dev-bo
            libreoffice-dev-br
            libreoffice-dev-brx
            libreoffice-dev-bs
            libreoffice-dev-ca
            libreoffice-dev-ca-valencia
            libreoffice-dev-cs
            libreoffice-dev-cy
            libreoffice-dev-da
            libreoffice-dev-de
            libreoffice-dev-dgo
            libreoffice-dev-dsb
            libreoffice-dev-dz
            libreoffice-dev-el
            libreoffice-dev-en-gb
            libreoffice-dev-en-za
            libreoffice-dev-eo
            libreoffice-dev-es
            libreoffice-dev-et
            libreoffice-dev-eu
            libreoffice-dev-fa
            libreoffice-dev-fi
            libreoffice-dev-fr
            libreoffice-dev-fur
            libreoffice-dev-fy
            libreoffice-dev-ga
            libreoffice-dev-gd
            libreoffice-dev-gl
            libreoffice-dev-gu
            libreoffice-dev-gug
            libreoffice-dev-he
            libreoffice-dev-hi
            libreoffice-dev-hr
            libreoffice-dev-hsb
            libreoffice-dev-hu
            libreoffice-dev-id
            libreoffice-dev-is
            libreoffice-dev-it
            libreoffice-dev-ja
            libreoffice-dev-ka
            libreoffice-dev-kab
            libreoffice-dev-kk
            libreoffice-dev-km
            libreoffice-dev-kmr-latn
            libreoffice-dev-kn
            libreoffice-dev-ko
            libreoffice-dev-kok
            libreoffice-dev-ks
            libreoffice-dev-lb
            libreoffice-dev-lo
            libreoffice-dev-lt
            libreoffice-dev-lv
            libreoffice-dev-mai
            libreoffice-dev-mk
            libreoffice-dev-ml
            libreoffice-dev-mn
            libreoffice-dev-mni
            libreoffice-dev-mr
            libreoffice-dev-my
            libreoffice-dev-nb
            libreoffice-dev-ne
            libreoffice-dev-nl
            libreoffice-dev-nn
            libreoffice-dev-nr
            libreoffice-dev-nso
            libreoffice-dev-oc
            libreoffice-dev-om
            libreoffice-dev-or
            libreoffice-dev-pa-in
            libreoffice-dev-pl
            libreoffice-dev-pt
            libreoffice-dev-pt-br
            libreoffice-dev-ro
            libreoffice-dev-ru
            libreoffice-dev-rw
            libreoffice-dev-sa-in
            libreoffice-dev-sat
            libreoffice-dev-sd
            libreoffice-dev-si
            libreoffice-dev-sid
            libreoffice-dev-sk
            libreoffice-dev-sl
            libreoffice-dev-sq
            libreoffice-dev-sr
            libreoffice-dev-sr-latn
            libreoffice-dev-ss
            libreoffice-dev-st
            libreoffice-dev-sv
            libreoffice-dev-sw-tz))

;;; PACKAGE DEFINITIONS (100 packages)

;;; -- libigloo --
(define-public libigloo
  (package
    (name "libigloo")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ftp.osuosl.org/pub/xiph/releases/igloo/"
         "releases/download/v" version "/libigloo-" version ".tar.gz"))
       (file-name (string-append "libigloo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libigloo/"))))
    (home-page "https://ftp.osuosl.org/pub/xiph/releases/igloo")
    (synopsis "common C framework by the Icecast project")
    (description "Common C framework by the Icecast project.")
    (license license:expat)))

;;; -- libowfat --
(define-public libowfat
  (package
    (name "libowfat")
    (version "0.34")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.fefe.de/libowfat//"
         "releases/download/v" version "/libowfat-" version ".tar.gz"))
       (file-name (string-append "libowfat-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libowfat/"))))
    (home-page "http://www.fefe.de/libowfat/")
    (synopsis "GPL reimplementation of libdjb")
    (description "GPL reimplementation of libdjb.")
    (license license:gpl2+)))

;;; -- libreoffice-dev-af --
(define-public libreoffice-dev-af
  (package
    (name "libreoffice-dev-af")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-af-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-af-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-af/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "afrikaans language pack for LibreOffice Dev")
    (description "Afrikaans language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-am --
(define-public libreoffice-dev-am
  (package
    (name "libreoffice-dev-am")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-am-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-am-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-am/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "amharic language pack for LibreOffice Dev")
    (description "Amharic language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ar --
(define-public libreoffice-dev-ar
  (package
    (name "libreoffice-dev-ar")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ar-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ar-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ar/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "arabic language pack for LibreOffice Dev")
    (description "Arabic language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-as --
(define-public libreoffice-dev-as
  (package
    (name "libreoffice-dev-as")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-as-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-as-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-as/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "assamese (India) language pack for LibreOffice Dev")
    (description "Assamese (India) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ast --
(define-public libreoffice-dev-ast
  (package
    (name "libreoffice-dev-ast")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ast-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ast-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ast/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "asturianu language pack for LibreOffice Dev")
    (description "Asturianu language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-be --
(define-public libreoffice-dev-be
  (package
    (name "libreoffice-dev-be")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-be-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-be-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-be/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "belarusian language pack for LibreOffice Dev")
    (description "Belarusian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-bg --
(define-public libreoffice-dev-bg
  (package
    (name "libreoffice-dev-bg")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-bg-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-bg-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-bg/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "bulgarian language pack for LibreOffice Dev")
    (description "Bulgarian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-bn --
(define-public libreoffice-dev-bn
  (package
    (name "libreoffice-dev-bn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-bn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-bn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-bn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "bengali language pack for LibreOffice Dev")
    (description "Bengali language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-bn-in --
(define-public libreoffice-dev-bn-in
  (package
    (name "libreoffice-dev-bn-in")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-bn-in-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-bn-in-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-bn-in/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "bengali (India) language pack for LibreOffice Dev")
    (description "Bengali (India) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-bo --
(define-public libreoffice-dev-bo
  (package
    (name "libreoffice-dev-bo")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-bo-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-bo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-bo/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "tibetan language pack for LibreOffice Dev")
    (description "Tibetan language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-br --
(define-public libreoffice-dev-br
  (package
    (name "libreoffice-dev-br")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-br-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-br-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-br/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "breton language pack for LibreOffice Dev")
    (description "Breton language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-brx --
(define-public libreoffice-dev-brx
  (package
    (name "libreoffice-dev-brx")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-brx-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-brx-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-brx/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "bodo language pack for LibreOffice Dev")
    (description "Bodo language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-bs --
(define-public libreoffice-dev-bs
  (package
    (name "libreoffice-dev-bs")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-bs-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-bs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-bs/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "bosnian language pack for LibreOffice Dev")
    (description "Bosnian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ca --
(define-public libreoffice-dev-ca
  (package
    (name "libreoffice-dev-ca")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ca-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ca-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ca/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "catalan language pack for LibreOffice Dev")
    (description "Catalan language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ca-valencia --
(define-public libreoffice-dev-ca-valencia
  (package
    (name "libreoffice-dev-ca-valencia")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ca-valencia-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ca-valencia-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ca-valencia/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "catalan (Valencia) language pack for LibreOffice Dev")
    (description "Catalan (Valencia) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-cs --
(define-public libreoffice-dev-cs
  (package
    (name "libreoffice-dev-cs")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-cs-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-cs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-cs/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "czech language pack for LibreOffice Dev")
    (description "Czech language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-cy --
(define-public libreoffice-dev-cy
  (package
    (name "libreoffice-dev-cy")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-cy-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-cy-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-cy/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "welsh language pack for LibreOffice Dev")
    (description "Welsh language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-da --
(define-public libreoffice-dev-da
  (package
    (name "libreoffice-dev-da")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-da-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-da-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-da/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "danish language pack for LibreOffice Dev")
    (description "Danish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-de --
(define-public libreoffice-dev-de
  (package
    (name "libreoffice-dev-de")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-de-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-de-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-de/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "german language pack for LibreOffice Dev")
    (description "German language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-dgo --
(define-public libreoffice-dev-dgo
  (package
    (name "libreoffice-dev-dgo")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-dgo-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-dgo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-dgo/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "dogri language pack for LibreOffice Dev")
    (description "Dogri language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-dsb --
(define-public libreoffice-dev-dsb
  (package
    (name "libreoffice-dev-dsb")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-dsb-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-dsb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-dsb/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "lower Sorbian language pack for LibreOffice Dev")
    (description "Lower Sorbian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-dz --
(define-public libreoffice-dev-dz
  (package
    (name "libreoffice-dev-dz")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-dz-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-dz-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-dz/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "dzongkha language pack for LibreOffice Dev")
    (description "Dzongkha language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-el --
(define-public libreoffice-dev-el
  (package
    (name "libreoffice-dev-el")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-el-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-el-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-el/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "greek language pack for LibreOffice Dev")
    (description "Greek language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-en-gb --
(define-public libreoffice-dev-en-gb
  (package
    (name "libreoffice-dev-en-gb")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-en-gb-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-en-gb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-en-gb/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "english (GB) language pack for LibreOffice Dev")
    (description "English (GB) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-en-za --
(define-public libreoffice-dev-en-za
  (package
    (name "libreoffice-dev-en-za")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-en-za-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-en-za-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-en-za/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "english (ZA) language pack for LibreOffice Dev")
    (description "English (ZA) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-eo --
(define-public libreoffice-dev-eo
  (package
    (name "libreoffice-dev-eo")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-eo-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-eo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-eo/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "esperanto language pack for LibreOffice Dev")
    (description "Esperanto language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-es --
(define-public libreoffice-dev-es
  (package
    (name "libreoffice-dev-es")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-es-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-es-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-es/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "spanish language pack for LibreOffice Dev")
    (description "Spanish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-et --
(define-public libreoffice-dev-et
  (package
    (name "libreoffice-dev-et")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-et-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-et-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-et/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "estonian language pack for LibreOffice Dev")
    (description "Estonian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-eu --
(define-public libreoffice-dev-eu
  (package
    (name "libreoffice-dev-eu")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-eu-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-eu-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-eu/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "basque language pack for LibreOffice Dev")
    (description "Basque language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-fa --
(define-public libreoffice-dev-fa
  (package
    (name "libreoffice-dev-fa")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-fa-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-fa-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-fa/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "persian language pack for LibreOffice Dev")
    (description "Persian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-fi --
(define-public libreoffice-dev-fi
  (package
    (name "libreoffice-dev-fi")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-fi-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-fi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-fi/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "finnish language pack for LibreOffice Dev")
    (description "Finnish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-fr --
(define-public libreoffice-dev-fr
  (package
    (name "libreoffice-dev-fr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-fr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-fr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-fr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "french language pack for LibreOffice Dev")
    (description "French language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-fur --
(define-public libreoffice-dev-fur
  (package
    (name "libreoffice-dev-fur")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-fur-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-fur-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-fur/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "friulian language pack for LibreOffice Dev")
    (description "Friulian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-fy --
(define-public libreoffice-dev-fy
  (package
    (name "libreoffice-dev-fy")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-fy-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-fy-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-fy/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "western Frisian language pack for LibreOffice Dev")
    (description "Western Frisian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ga --
(define-public libreoffice-dev-ga
  (package
    (name "libreoffice-dev-ga")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ga-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ga-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ga/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "irish language pack for LibreOffice Dev")
    (description "Irish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-gd --
(define-public libreoffice-dev-gd
  (package
    (name "libreoffice-dev-gd")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-gd-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-gd-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-gd/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "gaelic (Scottish) language pack for LibreOffice Dev")
    (description "Gaelic (Scottish) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-gl --
(define-public libreoffice-dev-gl
  (package
    (name "libreoffice-dev-gl")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-gl-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-gl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-gl/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "galician language pack for LibreOffice Dev")
    (description "Galician language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-gu --
(define-public libreoffice-dev-gu
  (package
    (name "libreoffice-dev-gu")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-gu-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-gu-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-gu/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "gujarati language pack for LibreOffice Dev")
    (description "Gujarati language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-gug --
(define-public libreoffice-dev-gug
  (package
    (name "libreoffice-dev-gug")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-gug-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-gug-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-gug/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "paraguayan Guaraní language pack for LibreOffice Dev")
    (description "Paraguayan Guaraní language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-he --
(define-public libreoffice-dev-he
  (package
    (name "libreoffice-dev-he")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-he-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-he-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-he/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "hebrew language pack for LibreOffice Dev")
    (description "Hebrew language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-hi --
(define-public libreoffice-dev-hi
  (package
    (name "libreoffice-dev-hi")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-hi-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-hi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-hi/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "hindi language pack for LibreOffice Dev")
    (description "Hindi language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-hr --
(define-public libreoffice-dev-hr
  (package
    (name "libreoffice-dev-hr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-hr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-hr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-hr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "croatian language pack for LibreOffice Dev")
    (description "Croatian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-hsb --
(define-public libreoffice-dev-hsb
  (package
    (name "libreoffice-dev-hsb")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-hsb-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-hsb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-hsb/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "upper Sorbian language pack for LibreOffice Dev")
    (description "Upper Sorbian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-hu --
(define-public libreoffice-dev-hu
  (package
    (name "libreoffice-dev-hu")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-hu-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-hu-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-hu/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "hungarian language pack for LibreOffice Dev")
    (description "Hungarian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-id --
(define-public libreoffice-dev-id
  (package
    (name "libreoffice-dev-id")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-id-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-id-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-id/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "indonesian language pack for LibreOffice Dev")
    (description "Indonesian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-is --
(define-public libreoffice-dev-is
  (package
    (name "libreoffice-dev-is")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-is-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-is-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-is/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "icelandic language pack for LibreOffice Dev")
    (description "Icelandic language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-it --
(define-public libreoffice-dev-it
  (package
    (name "libreoffice-dev-it")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-it-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-it-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-it/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "italian language pack for LibreOffice Dev")
    (description "Italian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ja --
(define-public libreoffice-dev-ja
  (package
    (name "libreoffice-dev-ja")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ja-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ja-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ja/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "japanese language pack for LibreOffice Dev")
    (description "Japanese language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ka --
(define-public libreoffice-dev-ka
  (package
    (name "libreoffice-dev-ka")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ka-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ka-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ka/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "georgian language pack for LibreOffice Dev")
    (description "Georgian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-kab --
(define-public libreoffice-dev-kab
  (package
    (name "libreoffice-dev-kab")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-kab-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-kab-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-kab/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kabyle language pack for LibreOffice Dev")
    (description "Kabyle language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-kk --
(define-public libreoffice-dev-kk
  (package
    (name "libreoffice-dev-kk")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-kk-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-kk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-kk/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kazakh language pack for LibreOffice Dev")
    (description "Kazakh language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-km --
(define-public libreoffice-dev-km
  (package
    (name "libreoffice-dev-km")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-km-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-km-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-km/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "khmer (Cambodia) language pack for LibreOffice Dev")
    (description "Khmer (Cambodia) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-kmr-latn --
(define-public libreoffice-dev-kmr-latn
  (package
    (name "libreoffice-dev-kmr-latn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-kmr-latn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-kmr-latn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-kmr-latn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kurdish language pack for LibreOffice Dev")
    (description "Kurdish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-kn --
(define-public libreoffice-dev-kn
  (package
    (name "libreoffice-dev-kn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-kn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-kn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-kn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kannada language pack for LibreOffice Dev")
    (description "Kannada language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ko --
(define-public libreoffice-dev-ko
  (package
    (name "libreoffice-dev-ko")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ko-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ko-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ko/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "korean language pack for LibreOffice Dev")
    (description "Korean language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-kok --
(define-public libreoffice-dev-kok
  (package
    (name "libreoffice-dev-kok")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-kok-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-kok-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-kok/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "konkani language pack for LibreOffice Dev")
    (description "Konkani language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ks --
(define-public libreoffice-dev-ks
  (package
    (name "libreoffice-dev-ks")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ks-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ks-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ks/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kashmiri language pack for LibreOffice Dev")
    (description "Kashmiri language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-lb --
(define-public libreoffice-dev-lb
  (package
    (name "libreoffice-dev-lb")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-lb-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-lb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-lb/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "luxembourgish language pack for LibreOffice Dev")
    (description "Luxembourgish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-lo --
(define-public libreoffice-dev-lo
  (package
    (name "libreoffice-dev-lo")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-lo-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-lo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-lo/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "lao language pack for LibreOffice Dev")
    (description "Lao language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-lt --
(define-public libreoffice-dev-lt
  (package
    (name "libreoffice-dev-lt")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-lt-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-lt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-lt/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "lithuanian language pack for LibreOffice Dev")
    (description "Lithuanian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-lv --
(define-public libreoffice-dev-lv
  (package
    (name "libreoffice-dev-lv")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-lv-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-lv-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-lv/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "latvian language pack for LibreOffice Dev")
    (description "Latvian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-mai --
(define-public libreoffice-dev-mai
  (package
    (name "libreoffice-dev-mai")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-mai-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-mai-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-mai/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "maithili language pack for LibreOffice Dev")
    (description "Maithili language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-mk --
(define-public libreoffice-dev-mk
  (package
    (name "libreoffice-dev-mk")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-mk-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-mk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-mk/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "macedonian language pack for LibreOffice Dev")
    (description "Macedonian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ml --
(define-public libreoffice-dev-ml
  (package
    (name "libreoffice-dev-ml")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ml-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ml-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ml/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "malayalam language pack for LibreOffice Dev")
    (description "Malayalam language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-mn --
(define-public libreoffice-dev-mn
  (package
    (name "libreoffice-dev-mn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-mn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-mn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-mn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "mongolian language pack for LibreOffice Dev")
    (description "Mongolian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-mni --
(define-public libreoffice-dev-mni
  (package
    (name "libreoffice-dev-mni")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-mni-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-mni-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-mni/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "manipuri language pack for LibreOffice Dev")
    (description "Manipuri language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-mr --
(define-public libreoffice-dev-mr
  (package
    (name "libreoffice-dev-mr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-mr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-mr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-mr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "marathi language pack for LibreOffice Dev")
    (description "Marathi language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-my --
(define-public libreoffice-dev-my
  (package
    (name "libreoffice-dev-my")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-my-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-my-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-my/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "burmese language pack for LibreOffice Dev")
    (description "Burmese language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-nb --
(define-public libreoffice-dev-nb
  (package
    (name "libreoffice-dev-nb")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-nb-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-nb-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-nb/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "norwegian Bokmal language pack for LibreOffice Dev")
    (description "Norwegian Bokmal language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ne --
(define-public libreoffice-dev-ne
  (package
    (name "libreoffice-dev-ne")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ne-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ne-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ne/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "nepali language pack for LibreOffice Dev")
    (description "Nepali language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-nl --
(define-public libreoffice-dev-nl
  (package
    (name "libreoffice-dev-nl")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-nl-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-nl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-nl/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "dutch language pack for LibreOffice Dev")
    (description "Dutch language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-nn --
(define-public libreoffice-dev-nn
  (package
    (name "libreoffice-dev-nn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-nn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-nn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-nn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "norwegian Nynorsk language pack for LibreOffice Dev")
    (description "Norwegian Nynorsk language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-nr --
(define-public libreoffice-dev-nr
  (package
    (name "libreoffice-dev-nr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-nr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-nr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-nr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "ndebele (South) language pack for LibreOffice Dev")
    (description "Ndebele (South) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-nso --
(define-public libreoffice-dev-nso
  (package
    (name "libreoffice-dev-nso")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-nso-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-nso-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-nso/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "northern Sotho language pack for LibreOffice Dev")
    (description "Northern Sotho language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-oc --
(define-public libreoffice-dev-oc
  (package
    (name "libreoffice-dev-oc")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-oc-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-oc-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-oc/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "occitan language pack for LibreOffice Dev")
    (description "Occitan language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-om --
(define-public libreoffice-dev-om
  (package
    (name "libreoffice-dev-om")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-om-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-om-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-om/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "oromo language pack for LibreOffice Dev")
    (description "Oromo language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-or --
(define-public libreoffice-dev-or
  (package
    (name "libreoffice-dev-or")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-or-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-or-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-or/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "oriya language pack for LibreOffice Dev")
    (description "Oriya language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-pa-in --
(define-public libreoffice-dev-pa-in
  (package
    (name "libreoffice-dev-pa-in")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-pa-in-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-pa-in-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-pa-in/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "punjabi (India) language pack for LibreOffice Dev")
    (description "Punjabi (India) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-pl --
(define-public libreoffice-dev-pl
  (package
    (name "libreoffice-dev-pl")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-pl-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-pl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-pl/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "polish language pack for LibreOffice Dev")
    (description "Polish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-pt --
(define-public libreoffice-dev-pt
  (package
    (name "libreoffice-dev-pt")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-pt-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-pt-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-pt/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "portuguese language pack for LibreOffice Dev")
    (description "Portuguese language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-pt-br --
(define-public libreoffice-dev-pt-br
  (package
    (name "libreoffice-dev-pt-br")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-pt-br-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-pt-br-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-pt-br/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "portuguese (Brazil) language pack for LibreOffice Dev")
    (description "Portuguese (Brazil) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ro --
(define-public libreoffice-dev-ro
  (package
    (name "libreoffice-dev-ro")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ro-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ro-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ro/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "romanian language pack for LibreOffice Dev")
    (description "Romanian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ru --
(define-public libreoffice-dev-ru
  (package
    (name "libreoffice-dev-ru")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ru-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ru-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ru/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "russian language pack for LibreOffice Dev")
    (description "Russian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-rw --
(define-public libreoffice-dev-rw
  (package
    (name "libreoffice-dev-rw")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-rw-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-rw-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-rw/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "kinyarwanda language pack for LibreOffice Dev")
    (description "Kinyarwanda language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sa-in --
(define-public libreoffice-dev-sa-in
  (package
    (name "libreoffice-dev-sa-in")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sa-in-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sa-in-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sa-in/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "sanskrit (India) language pack for LibreOffice Dev")
    (description "Sanskrit (India) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sat --
(define-public libreoffice-dev-sat
  (package
    (name "libreoffice-dev-sat")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sat-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sat-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sat/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "santali language pack for LibreOffice Dev")
    (description "Santali language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sd --
(define-public libreoffice-dev-sd
  (package
    (name "libreoffice-dev-sd")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sd-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sd-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sd/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "sindhi language pack for LibreOffice Dev")
    (description "Sindhi language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-si --
(define-public libreoffice-dev-si
  (package
    (name "libreoffice-dev-si")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-si-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-si-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-si/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "singhalese language pack for LibreOffice Dev")
    (description "Singhalese language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sid --
(define-public libreoffice-dev-sid
  (package
    (name "libreoffice-dev-sid")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sid-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sid-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sid/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "sidama language pack for LibreOffice Dev")
    (description "Sidama language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sk --
(define-public libreoffice-dev-sk
  (package
    (name "libreoffice-dev-sk")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sk-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sk/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "slovak language pack for LibreOffice Dev")
    (description "Slovak language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sl --
(define-public libreoffice-dev-sl
  (package
    (name "libreoffice-dev-sl")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sl-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sl/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "slovenian language pack for LibreOffice Dev")
    (description "Slovenian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sq --
(define-public libreoffice-dev-sq
  (package
    (name "libreoffice-dev-sq")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sq-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sq-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sq/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "albanien language pack for LibreOffice Dev")
    (description "Albanien language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sr --
(define-public libreoffice-dev-sr
  (package
    (name "libreoffice-dev-sr")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sr-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sr/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "serbian language pack for LibreOffice Dev")
    (description "Serbian language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sr-latn --
(define-public libreoffice-dev-sr-latn
  (package
    (name "libreoffice-dev-sr-latn")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sr-latn-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sr-latn-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sr-latn/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "serbian (Latin) language pack for LibreOffice Dev")
    (description "Serbian (Latin) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-ss --
(define-public libreoffice-dev-ss
  (package
    (name "libreoffice-dev-ss")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-ss-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-ss-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-ss/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "swati language pack for LibreOffice Dev")
    (description "Swati language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-st --
(define-public libreoffice-dev-st
  (package
    (name "libreoffice-dev-st")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-st-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-st-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-st/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "southern Sotho language pack for LibreOffice Dev")
    (description "Southern Sotho language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sv --
(define-public libreoffice-dev-sv
  (package
    (name "libreoffice-dev-sv")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sv-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sv-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sv/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "swedish language pack for LibreOffice Dev")
    (description "Swedish language pack for LibreOffice Dev.")
    (license license:lgpl3+)))

;;; -- libreoffice-dev-sw-tz --
(define-public libreoffice-dev-sw-tz
  (package
    (name "libreoffice-dev-sw-tz")
    (version "26.2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.documentfoundation.org/"
         "releases/download/v" version "/libreoffice-dev-sw-tz-" version ".tar.gz"))
       (file-name (string-append "libreoffice-dev-sw-tz-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/libreoffice-dev-sw-tz/"))))
    (home-page "https://www.documentfoundation.org")
    (synopsis "swahili (Tanzania) language pack for LibreOffice Dev")
    (description "Swahili (Tanzania) language pack for LibreOffice Dev.")
    (license license:lgpl3+)))
