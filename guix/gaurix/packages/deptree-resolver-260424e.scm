;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424e
;;; Resolves 8 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (3):
;;;      1.  otf-anti (font-build-system, v4.00, license:agpl3+)
;;;      2.  otf-avara (font-build-system, v1.000, license:silofl1.1)
;;;      3.  ttf-amiri-typewriter (font-build-system, v1.1, license:silofl1.1)
;;;
;;; ALREADY_IN_GUIX (5):
;;;      1.  python-roman → python-roman v5.2 in (gnu packages python-xyz)
;;;      2.  electron33 → electron v33.4.11 in (nongnu packages electron)
;;;      3.  electron29 → electron v29.4.6 in (nongnu packages electron)
;;;      4.  gcc5 → gcc-toolchain v5.5.0 in (gnu packages commencement)
;;;      5.  gcc8-libs → gcc-toolchain v8.5.0 in (gnu packages commencement)
;;;
;;; Remaining BLOCKED: 36 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (otf-anti
            otf-avara
            ttf-amiri-typewriter))

;;; -- otf-anti --
;;; Cryptic and playful Arabic typeface by Khaled Hosny (aliftype).
;;; Source: GitHub release (zip containing OTF files).
;;; License: AGPL-3.0+

(define-public otf-anti
  (package
    (name "otf-anti")
    (version "4.00")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aliftype/anti/releases/download/v"
                    version "/Anti-4.0.zip"))
              (sha256
               (base32 "01panhan8pd341b67p42mrf0zbj53bmcjkiy8s54j4p5j6qlcri7"))))
    (build-system font-build-system)
    (home-page "https://github.com/aliftype/anti")
    (synopsis "Cryptic and playful Arabic typeface")
    (description "Anti is a cryptic and playful Arabic typeface by Khaled Hosny.
It features unconventional letter forms designed for creative and artistic
use rather than standard text setting.")
    (license license:agpl3+)))

;;; -- otf-avara --
;;; Curveless transitional serif typeface from Velvetyne Type Foundry.
;;; Source: GitLab archive (contains built OTF files in fonts/ directory).
;;; License: SIL Open Font License 1.1

(define-public otf-avara
  (package
    (name "otf-avara")
    (version "1.000")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/velvetyne/Avara/-/archive/"
                    "c0dee5aed1135a5adb3dea0aafe5de1b31e0903c"
                    "/avara-" version ".tar.bz2"))
              (sha256
               (base32 "0dp1c5jph0dvw6azf030sfz8jahp7x8lq29lhn8yv70y67h15dfq"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/avara")
    (synopsis "Transitional serif curveless typeface")
    (description "Avara is a typeface from Velvetyne Type Foundry using a
curveless design based on a square grid.  All curves are replaced by
straight-line segments, giving the letters a distinctive geometric
appearance while remaining readable as a serif face.")
    (license license:silofl1.1)))

;;; -- ttf-amiri-typewriter --
;;; Mono-width companion to the Amiri Arabic font family.
;;; Source: GitHub release (zip containing TTF files).
;;; License: SIL Open Font License 1.1

(define-public ttf-amiri-typewriter
  (package
    (name "ttf-amiri-typewriter")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aliftype/amiri-typewriter"
                    "/releases/download/v" version
                    "/AmiriTypewriter-" version ".zip"))
              (sha256
               (base32 "1arzyc05izk18i1xvdrk142bs8shwlhp1dma52a5z5gl2csacnlq"))))
    (build-system font-build-system)
    (home-page "https://github.com/aliftype/amiri-typewriter")
    (synopsis "Mono-width companion to the Amiri font family")
    (description "Amiri Typewriter is a mono-width Arabic typeface designed
as a companion to the Amiri font family.  It provides a typewriter-style
appearance for Arabic text with consistent character widths suitable for
code and tabular layouts.")
    (license license:silofl1.1)))
