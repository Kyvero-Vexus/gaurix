;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416e
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. ttf-gentium-basic (font/copy, v1.102, OFL)
;;;   2. ocr-fonts (font/copy, v0.3.1, Other/free)
;;;   3. passless-bin (copy, v0.10.1, GPL)
;;;   4. interspec-bin (copy, v1.0.13, LGPL)
;;;   5. lazymake-bin (copy, v0.4.1, MIT)
;;;   6. oxlint-bin (copy, v1.60.0, MIT)
;;;   7. oxfmt-bin (copy, v0.45.0, MIT)
;;;   8. crepe-bin (copy, v0.2.2, MIT)
;;;   9. rust-motd-bin (copy, v2.1.2, MIT)
;;;  10. pass-secret-service-bin (copy, v0.6.0, GPL-3.0+)
;;;  11. runst-bin (copy, v0.1.4, Apache-2.0)
;;;  12. dietpdf-bin (copy, v1.0.0, BSD-3)
;;;  13. ipscan-bin (copy, v3.9.2, GPL-2.0)
;;;  14. usrgrp-manager-bin (copy, v0.3.0, MIT)
;;;  15. js-util-bin (copy, v1.24.0, MIT)
;;;  16. fnox-bin (copy, v1.20.0, MIT)
;;;  17. bluevein-bin (copy, v1.0.2, GPL-3.0)
;;;  18. steam-cloud-file-manager-bin (copy, v1.3.3, GPL-3.0)
;;;  19. tauno-serial-plotter-bin (python/copy, v1.20.2, GPL-3.0)
;;;  20. cleanuparr-bin (copy, v2.9.7, GPL-3.0+)
;;;  21. fw-fanctrl (pyproject, v1.0.4, BSD-3)
;;;  22. python-cyclopts (pyproject, v3.16.2, Apache-2.0)
;;;  23. python-pyproject-patcher (pyproject, v0.3.0, Apache-2.0)
;;;  24. system-tools-backends (gnu, v2.10.2, GPL)
;;;  25. liboobs (gnu, v3.0.0, GPL-2.0)
;;;  26. kitty-bitmap — BLOCKED: complex build with many custom patches
;;;  27. asus-5606-fan-state — BLOCKED: cargo-build-system needs crate deps
;;;  28. bigedit — BLOCKED: cargo-build-system needs crate deps
;;;  29. rovr (pyproject, v0.8.1, MIT)
;;;  30. proton-drive-sync-prerelease-bin (copy, v0.2.5beta.2, GPL-3.0)
;;;
;;; 27 recipes written. 3 BLOCKED (kitty-bitmap, asus-5606-fan-state, bigedit).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (
            ttf-gentium-basic
            ocr-fonts
            passless-bin
            interspec-bin
            lazymake-bin
            oxlint-bin
            oxfmt-bin
            crepe-bin
            rust-motd-bin
            pass-secret-service-bin
            runst-bin
            dietpdf-bin
            ipscan-bin
            usrgrp-manager-bin
            js-util-bin
            fnox-bin
            bluevein-bin
            steam-cloud-file-manager-bin
            tauno-serial-plotter-bin
            cleanuparr-bin
            fw-fanctrl
            python-cyclopts
            python-pyproject-patcher
            system-tools-backends
            liboobs
            rovr
            proton-drive-sync-prerelease-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. ttf-gentium-basic — SIL Gentium Basic font family
;;; -------------------------------------------------------------------
(define-public ttf-gentium-basic
  (package
    (name "ttf-gentium-basic")
    (version "1.102")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://software.sil.org/downloads/r/gentium/GentiumBasic_"
                    (string-join (string-split version #\.) "")
                    ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append "GentiumBasic_"
                                       #$(string-join
                                          (string-split version #\.) ""))))
               (list (list dir "share/fonts/truetype/gentium-basic/"
                           #:include-regexp '("\\.ttf$"))))))
    (native-inputs (list unzip))
    (synopsis "font family based on the original Gentium design")
    (description "Gentium Basic is a font family based on the original Gentium
design with additional weights.  It provides Regular, Bold, Italic, and Bold
Italic faces, covering Latin and Cyrillic scripts.  Designed by SIL
International for readability in body text and academic publications.")
    (home-page "https://software.sil.org/gentium/")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. ocr-fonts — free OCR-A and OCR-B fonts
;;; -------------------------------------------------------------------
(define-public ocr-fonts
  (package
    (name "ocr-fonts")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tsukurimashou.org/files/ocr-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append "ocr-" #$version)))
               (list (list dir "share/fonts/truetype/ocr/"
                           #:include-regexp '("\\.ttf$"))
                     (list dir "share/fonts/opentype/ocr/"
                           #:include-regexp '("\\.otf$"))))))
    (native-inputs (list unzip))
    (synopsis "free versions of OCR-A and OCR-B fonts")
    (description "This package provides free implementations of the OCR-A and
OCR-B fonts, designed for optical character recognition systems.  The fonts
conform to ISO 1073-1 (OCR-A) and ISO 1073-2 (OCR-B) standards and are
suitable for documents requiring machine-readable text.")
    (home-page "https://tsukurimashou.org/ocr.php.en")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 3. passless-bin — virtual FIDO2 device and passkey utility
;;; -------------------------------------------------------------------
(define-public passless-bin
  (package
    (name "passless-bin")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pando85/passless/releases/download/v"
                    version "/passless-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("passless" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual FIDO2 device and passkey utility")
    (description "Passless is a virtual FIDO2 device and client utility that
makes passkeys easy to use.  It provides a software-based FIDO2 authenticator
for passwordless authentication without requiring a physical security key.")
    (home-page "https://github.com/pando85/passless")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. interspec-bin — spectral radiation analysis software
;;; -------------------------------------------------------------------
(define-public interspec-bin
  (package
    (name "interspec-bin")
    (version "1.0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sandialabs/InterSpec/releases/download/v"
                    version "/InterSpec-linux-x64_v" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("InterSpec-linux-x64/" "opt/InterSpec/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/InterSpec/InterSpec")
                              (string-append out "/bin/InterSpec"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "spectral radiation analysis software")
    (description "InterSpec is a spectral radiation analysis tool developed by
Sandia National Laboratories.  It provides interactive visualization and
analysis of gamma-ray spectra, supporting peak fitting, nuclide
identification, shielding calculations, and activity estimation.")
    (home-page "https://sandialabs.github.io/InterSpec/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 5. lazymake-bin — TUI for Makefiles
;;; -------------------------------------------------------------------
(define-public lazymake-bin
  (package
    (name "lazymake-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rshelekhov/lazymake/releases/download/v"
                    version "/lazymake_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazymake" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern TUI for Makefiles with interactive target selection")
    (description "Lazymake is a modern terminal user interface for Makefiles.
It provides interactive target selection, dependency visualization, and
command safety analysis, making it easier to navigate and execute targets
in complex Makefiles.")
    (home-page "https://github.com/rshelekhov/lazymake")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. oxlint-bin — high-performance JavaScript/TypeScript linter
;;; -------------------------------------------------------------------
(define-public oxlint-bin
  (package
    (name "oxlint-bin")
    (version "1.60.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oxc-project/oxc/releases/download/apps_v"
                    version "/oxlint-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oxlint-x86_64-unknown-linux-gnu" "bin/oxlint"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance linter for JavaScript and TypeScript")
    (description "Oxlint is a high-performance linter for JavaScript and
TypeScript built on the Oxc compiler stack.  It is designed as a faster
drop-in alternative to ESLint for common lint rules, providing instant
feedback with minimal configuration.")
    (home-page "https://oxc.rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. oxfmt-bin — high-performance JavaScript formatter
;;; -------------------------------------------------------------------
(define-public oxfmt-bin
  (package
    (name "oxfmt-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              ;; oxfmt is released alongside oxlint from the oxc-project repo
              (uri (string-append
                    "https://github.com/oxc-project/oxc/releases/download/"
                    "apps_v1.60.0"
                    "/oxfmt-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oxfmt-x86_64-unknown-linux-gnu" "bin/oxfmt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance formatter for the JavaScript ecosystem")
    (description "Oxfmt is a high-performance code formatter for JavaScript,
TypeScript, JSX, and TSX built on the Oxc compiler stack.  It aims to be a
faster alternative to Prettier while producing compatible output.")
    (home-page "https://oxc.rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. crepe-bin — grep-like tool that highlights matches
;;; -------------------------------------------------------------------
(define-public crepe-bin
  (package
    (name "crepe-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brunoribeiro/crepe/releases/download/v"
                    version "/crepe-" version "-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "crepe-" #$version "-linux-amd64")
                         "bin/crepe"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/crepe")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "grep-like text search tool that highlights matches")
    (description "Crepe is a grep-like text search tool that highlights matches
instead of filtering lines.  It shows the full file content with matched
patterns visually emphasized, making it easy to see matches in context.")
    (home-page "https://github.com/brunoribeiro/crepe")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. rust-motd-bin — beautiful MOTD generation
;;; -------------------------------------------------------------------
(define-public rust-motd-bin
  (package
    (name "rust-motd-bin")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rust-motd/rust-motd/releases/download/v"
                    version "/rust-motd-" version
                    "-archlinux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rust-motd" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "beautiful MOTD generation with zero runtime dependencies")
    (description "Rust-motd generates beautiful, informative message of the day
(MOTD) banners for terminal sessions.  It displays system information such as
uptime, load average, disk usage, and weather in a visually appealing
format with zero runtime dependencies.")
    (home-page "https://github.com/rust-motd/rust-motd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. pass-secret-service-bin — freedesktop secrets provider
;;; -------------------------------------------------------------------
(define-public pass-secret-service-bin
  (package
    (name "pass-secret-service-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/grimsteel/pass-secret-service/"
                    "releases/download/v" version
                    "/pass-secret-service-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pass-secret-service-x86_64" "bin/pass-secret-service"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/pass-secret-service")
                          #o755))))))
    (inputs (list dbus))
    (supported-systems '("x86_64-linux"))
    (synopsis "freedesktop.secrets provider with a pass backend")
    (description "Pass-secret-service is an implementation of the
org.freedesktop.secrets D-Bus API backed by the standard Unix password
manager @command{pass}.  It allows applications that use the libsecret
API to store and retrieve secrets from a pass password store.")
    (home-page "https://github.com/grimsteel/pass-secret-service")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. runst-bin — dead simple notification daemon
;;; -------------------------------------------------------------------
(define-public runst-bin
  (package
    (name "runst-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/orhun/runst/releases/download/v"
                    version "/runst-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "runst-" #$version "/runst")
                         "bin/"))))
    (inputs (list dbus pango))
    (supported-systems '("x86_64-linux"))
    (synopsis "dead simple notification daemon")
    (description "Runst is a lightweight notification daemon for Linux.  It
listens for D-Bus desktop notifications and displays them using Pango for
text rendering.  It focuses on simplicity and minimal resource usage.")
    (home-page "https://github.com/orhun/runst")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 12. dietpdf-bin — reduce PDF file size
;;; -------------------------------------------------------------------
(define-public dietpdf-bin
  (package
    (name "dietpdf-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zigazou/dietpdf-haskell/releases/"
                    "download/v" version "/dietpdf_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils tar gzip))
    (inputs (list libjpeg-turbo imagemagick))
    (supported-systems '("x86_64-linux"))
    (synopsis "reduce PDF file size")
    (description "DietPDF is a tool for reducing PDF file sizes.  It analyzes
and optimizes PDF internals including recompressing images, removing
redundant objects, and streamlining the file structure to achieve
significant size reductions.")
    (home-page "https://github.com/Zigazou/dietpdf-haskell")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 13. ipscan-bin — Angry IP Scanner network scanner
;;; -------------------------------------------------------------------
(define-public ipscan-bin
  (package
    (name "ipscan-bin")
    (version "3.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/angryip/ipscan/releases/download/"
                    version "/ipscan-linux64-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "ipscan-linux64-" #$version ".jar")
                         "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/ipscan-linux64-"
                                              #$version ".jar")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/ipscan")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec java -jar ~a \"$@\"\n"
                                 jar)))
                     (chmod (string-append bin "/ipscan") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source cross-platform network scanner")
    (description "Angry IP Scanner is an open-source and cross-platform network
scanner designed for speed and simplicity.  It scans IP addresses and ports,
resolves hostnames, detects MAC addresses, and exports results in multiple
formats.  It requires a Java runtime environment.")
    (home-page "https://angryip.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. usrgrp-manager-bin — TUI for UNIX user/group management
;;; -------------------------------------------------------------------
(define-public usrgrp-manager-bin
  (package
    (name "usrgrp-manager-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Firstp1ck/UsrGrp-Manager-TUI/"
                    "releases/download/v" version "/usrgrp-manager"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usrgrp-manager" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/usrgrp-manager")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "keyboard-driven TUI for UNIX user and group management")
    (description "UsrGrp Manager is a keyboard-driven terminal user interface
for viewing and managing UNIX users and groups.  It provides an interactive
list of users and groups with options to add, modify, and remove entries
without memorizing command-line flags.")
    (home-page "https://github.com/Firstp1ck/UsrGrp-Manager-TUI")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. js-util-bin — fast JavaScript runner built on QuickJS
;;; -------------------------------------------------------------------
(define-public js-util-bin
  (package
    (name "js-util-bin")
    (version "1.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/5hubham5ingh/js-util/releases/"
                    "download/v" version "/js"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("js" "bin/js-util"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/js-util")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast JavaScript runner built on QuickJS")
    (description "JS-Util is a fast, lightweight, battery-included JavaScript
runner built on QuickJS.  It provides a command-line interface for executing
JavaScript files and one-liners with built-in modules for file I/O, HTTP,
child processes, and other system operations.")
    (home-page "https://github.com/5hubham5ingh/js-util")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. fnox-bin — Fort Knox for your secrets
;;; -------------------------------------------------------------------
(define-public fnox-bin
  (package
    (name "fnox-bin")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jdx/fnox/releases/download/v"
                    version "/fnox-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fnox" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "encrypted secrets manager")
    (description "Fnox is a command-line secrets manager that securely stores
and retrieves sensitive data.  It encrypts secrets at rest and provides a
simple interface for managing credentials, API keys, and other sensitive
information.")
    (home-page "https://github.com/jdx/fnox")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. bluevein-bin — Bluetooth dual-boot key sync
;;; -------------------------------------------------------------------
(define-public bluevein-bin
  (package
    (name "bluevein-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/meowrch/BlueVein/releases/download/v"
                    version "/bluevein-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bluevein-linux-x86_64" "bin/bluevein"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/bluevein")
                          #o755))))))
    (inputs (list dbus))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bluetooth dual-boot key synchronization service")
    (description "BlueVein synchronizes Bluetooth pairing keys between
dual-boot operating systems.  It reads pairing keys from one OS and writes
them to the other, allowing Bluetooth devices to work seamlessly across
both installations without re-pairing.")
    (home-page "https://github.com/meowrch/BlueVein")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. steam-cloud-file-manager-bin — manage Steam cloud saves
;;; -------------------------------------------------------------------
(define-public steam-cloud-file-manager-bin
  (package
    (name "steam-cloud-file-manager-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Fldicoahkiin/SteamCloudFileManager/"
                    "releases/download/v" version
                    "/SteamCloudFileManager-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("steam-cloud-file-manager" "bin/"))))
    (inputs (list gtk+ webkitgtk))
    (supported-systems '("x86_64-linux"))
    (synopsis "manage and view Steam cloud save files")
    (description "Steam Cloud File Manager is a utility for managing and
viewing Steam cloud save files.  It provides a graphical interface to browse,
download, upload, and delete cloud saves for Steam games, useful for
backup and troubleshooting save data issues.")
    (home-page "https://github.com/Fldicoahkiin/SteamCloudFileManager")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. tauno-serial-plotter-bin — serial plotter for Arduino
;;; -------------------------------------------------------------------
(define-public tauno-serial-plotter-bin
  (package
    (name "tauno-serial-plotter-bin")
    (version "1.20.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/taunoe/tauno-serial-plotter/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((srcdir (string-append "tauno-serial-plotter-" #$version)))
               (list (list (string-append srcdir "/src") "share/tauno-serial-plotter/")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/tauno-serial-plotter")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec python3 ~a/share/tauno-serial-plotter/main.py \"$@\"\n"
                                 out)))
                     (chmod (string-append bin "/tauno-serial-plotter") #o755)))))))
    (inputs (list python))
    (supported-systems '("x86_64-linux"))
    (synopsis "serial plotter for Arduino and embedded devices")
    (description "Tauno Serial Plotter is a desktop serial data plotter for
Arduino and other embedded devices.  It reads data from serial ports and
displays real-time plots, making it useful for debugging sensor data and
monitoring embedded system outputs.")
    (home-page "https://github.com/taunoe/tauno-serial-plotter")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. cleanuparr-bin — automated cleanup for Sonarr/Radarr
;;; -------------------------------------------------------------------
(define-public cleanuparr-bin
  (package
    (name "cleanuparr-bin")
    (version "2.9.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Cleanuparr/Cleanuparr/releases/"
                    "download/v" version "/Cleanuparr-" version
                    "-linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Cleanuparr" "bin/cleanuparr"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/cleanuparr")
                          #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "automated cleanup tool for Sonarr, Radarr, and download clients")
    (description "Cleanuparr automates the cleanup of unwanted or blocked files
in Sonarr, Radarr, and supported download clients like qBittorrent, Deluge,
and Transmission.  It monitors for stalled or failed downloads and
automatically removes them to keep media management clean.")
    (home-page "https://github.com/Cleanuparr/Cleanuparr")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. fw-fanctrl — Framework Laptop fan controller
;;; -------------------------------------------------------------------
(define-public fw-fanctrl
  (package
    (name "fw-fanctrl")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TamtamHero/fw-fanctrl/archive/refs/"
                    "tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-watchdog python-jsonschema))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "fan controller service for Framework Laptops")
    (description "fw-fanctrl is a service for controlling the fan speed on
Framework Laptops.  It reads temperature sensors and applies configurable
fan curves to balance cooling performance and noise levels.  It uses
the Framework embedded controller tool for direct hardware communication.")
    (home-page "https://github.com/TamtamHero/fw-fanctrl")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 22. python-cyclopts — modern CLI framework for Python
;;; -------------------------------------------------------------------
(define-public python-cyclopts
  (package
    (name "python-cyclopts")
    (version "3.16.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/c/cyclopts/"
                    "cyclopts-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-attrs python-docstring-parser python-rich))
    (native-inputs
     (list python-hatchling python-wheel))
    (synopsis "modern command-line interface framework for Python")
    (description "Cyclopts is a modern, intuitive command-line interface
framework for Python.  It uses type annotations to generate CLI parsers
automatically, supports subcommands, parameter validation, and rich
help formatting with minimal boilerplate code.")
    (home-page "https://github.com/BrianPugh/cyclopts")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. python-pyproject-patcher — patch pyproject.toml in place
;;; -------------------------------------------------------------------
(define-public python-pyproject-patcher
  (package
    (name "python-pyproject-patcher")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/claui/pyproject-patcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-tomlkit))
    (native-inputs
     (list python-hatchling python-wheel))
    (synopsis "convenience functions to patch pyproject.toml in place")
    (description "Pyproject-patcher provides a collection of convenience
functions to programmatically modify @file{pyproject.toml} files in place.
It supports reading, modifying, and writing TOML configuration while
preserving formatting and comments.")
    (home-page "https://github.com/claui/pyproject-patcher")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. system-tools-backends — GNOME/MATE system administration
;;; -------------------------------------------------------------------
(define-public system-tools-backends
  (package
    (name "system-tools-backends")
    (version "2.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://ftp.gnome.org/pub/gnome/sources/"
                    name "/2.10/" name "-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list (string-append "--prefix=" #$output)
                   "--disable-static")
           #:tests? #f))
    (inputs
     (list dbus-glib perl polkit))
    (native-inputs
     (list intltool pkg-config perl))
    (synopsis "backends for GNOME and MATE system administration tools")
    (description "System Tools Backends provides the backend infrastructure
for GNOME and MATE system administration tools.  It handles privileged
operations like user management, network configuration, time settings,
and service management through a D-Bus interface with PolicyKit
authorization.")
    (home-page "http://system-tools-backends.freedesktop.org/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 25. liboobs — GObject interface to system-tools-backends
;;; -------------------------------------------------------------------
(define-public liboobs
  (package
    (name "liboobs")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.gnome.org/sources/" name "/3.0/"
                    name "-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:configure-flags
           #~(list (string-append "--prefix=" #$output)
                   "--disable-static")
           #:tests? #f))
    (inputs
     (list glib dbus-glib))
    (native-inputs
     (list pkg-config))
    (synopsis "GObject-based interface to system-tools-backends")
    (description "Liboobs is a GObject-based library that provides a
programming interface to system-tools-backends.  It allows applications to
query and modify system configuration (users, groups, network, time) through
a clean object-oriented API built on GLib and D-Bus.")
    (home-page "https://directory.fsf.org/wiki/Liboobs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. rovr — post-modern terminal file explorer
;;; -------------------------------------------------------------------
(define-public rovr
  (package
    (name "rovr")
    (version "0.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NSPC911/rovr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-rich python-pillow python-psutil python-platformdirs
           python-send2trash))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "post-modern terminal file explorer")
    (description "Rovr is a terminal file explorer built with Python Textual.
It provides a modern, keyboard-driven interface for browsing and managing
files with features including file previews, image thumbnails, archive
browsing, and customizable key bindings.")
    (home-page "https://github.com/NSPC911/rovr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. proton-drive-sync-prerelease-bin — Proton Drive sync client
;;; -------------------------------------------------------------------
(define-public proton-drive-sync-prerelease-bin
  (package
    (name "proton-drive-sync-prerelease-bin")
    (version "0.2.5beta.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DamianB-BitFlipper/proton-drive-sync/"
                    "releases/download/v0.2.5-beta.2/"
                    "proton-drive-sync-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("proton-drive-sync" "bin/"))))
    (inputs (list libsecret))
    (supported-systems '("x86_64-linux"))
    (synopsis "sync local directories to Proton Drive cloud storage")
    (description "Proton Drive Sync synchronizes local directories to Proton
Drive cloud storage.  It provides bidirectional syncing with end-to-end
encryption, maintaining a local copy of files stored in Proton Drive.
This is a prerelease version.")
    (home-page "https://github.com/DamianB-BitFlipper/proton-drive-sync")
    (license license:gpl3)))
