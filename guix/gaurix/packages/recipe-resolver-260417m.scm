;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417m
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (25):
;;;   1. woff2-misans-gujarati (font/copy, v4.003, custom:xiaomi)
;;;   2. woff2-misans-gurmukhi (font/copy, v4.003, custom:xiaomi)
;;;   3. woff2-misans-khmer (font/copy, v4.003, custom:xiaomi)
;;;   4. woff2-misans-l3 (font/copy, v4.003, custom:xiaomi)
;;;   5. woff2-misans-latin (font/copy, v4.003, custom:xiaomi)
;;;   6. woff2-misans-myanmar (font/copy, v4.003, custom:xiaomi)
;;;   7. woff2-misans-tc (font/copy, v4.003, custom:xiaomi)
;;;   8. woff2-misans-thai (font/copy, v4.003, custom:xiaomi)
;;;   9. woff2-misans-tibetan (font/copy, v4.003, custom:xiaomi)
;;;  10. misans-fontconfig (copy, v4.003, custom:xiaomi)
;;;  11. ttf-gentium-basic (font/copy, v1.102, OFL)
;;;  12. linuxmint-keyring (copy, v2022.06.21, GPL)
;;;  13. perl-module-signature (perl, v0.93, GPL+Artistic)
;;;  14. perl-sub-delete (perl, v1.00003, GPL+Artistic)
;;;  15. engauge (cmake/qt6, v12.9.1, GPL-2.0)
;;;  16. lbforth (gnu/trivial, v20241115, public-domain)
;;;  17. bin86 (gnu/make, v0.16.21, GPL-2.0+)
;;;  18. keyfinder-cli (cmake, v1.2.0, GPL-3.0)
;;;  19. gftp (gnu, v2.9.1b, MIT)
;;;  20. fetchfetch (gnu/make, v2.0.0, GPL-3.0+)
;;;  21. ltunify (gnu/make, v0.3, GPL-3.0+)
;;;  22. soupault-bin (copy/binary, v5.2.0, MIT)
;;;  23. rust-motd-bin (copy/binary, v2.1.2, MIT)
;;;  24. pocket-id-bin (copy/binary, v2.5.0, BSD-3)
;;;  25. pdf-metadata-editor-bin (copy/binary, v4.1.0, MIT)
;;;
;;; Blocked (5):
;;;  26. mchose-ace68-udev — INFEASIBLE_PACKAGING: no source available;
;;;      udev rule is inlined in PKGBUILD, not retrievable from upstream
;;;  27. pickdate — COMPLEX_DEPS: Go module requires full Go module proxy;
;;;      no release tarballs with vendored deps
;;;  28. val — COMPLEX_DEPS: Rust/Cargo crate with many dependencies;
;;;      no vendored release archive available
;;;  29. vimpc-git — NO_STABLE_RELEASE: git-only rolling version;
;;;      autotools bootstrap fails without released tarball
;;;  30. psysh — COMPLEX_DEPS: PHP REPL distributed as phar;
;;;      requires PHP ecosystem not well-supported in Guix
;;;
;;; 25 recipes written. 5 BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (
            woff2-misans-gujarati
            woff2-misans-gurmukhi
            woff2-misans-khmer
            woff2-misans-l3
            woff2-misans-latin
            woff2-misans-myanmar
            woff2-misans-tc
            woff2-misans-thai
            woff2-misans-tibetan
            misans-fontconfig
            ttf-gentium-basic
            linuxmint-keyring
            perl-module-signature
            perl-sub-delete
            engauge-digitizer
            lbforth
            bin86
            keyfinder-cli
            gftp
            fetchfetch
            ltunify
            soupault-bin
            rust-motd-bin
            pocket-id-bin
            pdf-metadata-editor-bin
            ))

;;; Custom license definitions for non-standard licenses.
(define license:misans
  ((@@ (guix licenses) license) "MiSans Font License"
    "https://hyperos.mi.com/font/download"
    "Xiaomi MiSans font intellectual property license"))

;;; -------------------------------------------------------------------
;;; Helper: MiSans WOFF2 font package template
;;; All MiSans Global WOFF2 fonts come from the same archive.
;;; -------------------------------------------------------------------
(define (make-misans-woff2-package variant-name subfolder-name)
  (package
    (name (string-append "woff2-misans-" variant-name))
    (version "4.003")
    (source (origin
              (method url-fetch)
              (uri "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip")
              (file-name (string-append "MiSansGlobal_ALL-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "MiSans " #$subfolder-name)
                         "share/fonts/woff2/"
                         #:include-regexp '("\\.woff2$")))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'unpack-inner
                 (lambda _
                   (for-each (lambda (zip)
                               (invoke "unzip" "-o" zip))
                             (find-files "." "\\.zip$")))))))
    (native-inputs (list unzip))
    (synopsis (string-append "MiSans Global " subfolder-name " WOFF2 fonts"))
    (description "MiSans Global is a multilingual font family led by Xiaomi
and co-created with Mona font and Han Yi font.  This package provides the
WOFF2 web font files for a specific language variant, suitable for web
rendering and system use.")
    (home-page "https://hyperos.mi.com/font/download")
    (license license:misans)))

;;; -------------------------------------------------------------------
;;; 1. woff2-misans-gujarati
;;; -------------------------------------------------------------------
(define-public woff2-misans-gujarati
  (make-misans-woff2-package "gujarati" "Gujarati"))

;;; -------------------------------------------------------------------
;;; 2. woff2-misans-gurmukhi
;;; -------------------------------------------------------------------
(define-public woff2-misans-gurmukhi
  (make-misans-woff2-package "gurmukhi" "Gurmukhi"))

;;; -------------------------------------------------------------------
;;; 3. woff2-misans-khmer
;;; -------------------------------------------------------------------
(define-public woff2-misans-khmer
  (make-misans-woff2-package "khmer" "Khmer"))

;;; -------------------------------------------------------------------
;;; 4. woff2-misans-l3
;;; -------------------------------------------------------------------
(define-public woff2-misans-l3
  (make-misans-woff2-package "l3" "L3"))

;;; -------------------------------------------------------------------
;;; 5. woff2-misans-latin
;;; -------------------------------------------------------------------
(define-public woff2-misans-latin
  (make-misans-woff2-package "latin" "Latin"))

;;; -------------------------------------------------------------------
;;; 6. woff2-misans-myanmar
;;; -------------------------------------------------------------------
(define-public woff2-misans-myanmar
  (make-misans-woff2-package "myanmar" "Myanmar"))

;;; -------------------------------------------------------------------
;;; 7. woff2-misans-tc
;;; -------------------------------------------------------------------
(define-public woff2-misans-tc
  (make-misans-woff2-package "tc" "TC"))

;;; -------------------------------------------------------------------
;;; 8. woff2-misans-thai
;;; -------------------------------------------------------------------
(define-public woff2-misans-thai
  (make-misans-woff2-package "thai" "Thai"))

;;; -------------------------------------------------------------------
;;; 9. woff2-misans-tibetan
;;; -------------------------------------------------------------------
(define-public woff2-misans-tibetan
  (make-misans-woff2-package "tibetan" "Tibetan"))

;;; -------------------------------------------------------------------
;;; 10. misans-fontconfig — fontconfig configuration for MiSans
;;; -------------------------------------------------------------------
(define-public misans-fontconfig
  (package
    (name "misans-fontconfig")
    (version "4.003")
    (source #f)
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (delete 'unpack)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (conf-dir (string-append out "/share/fontconfig/conf.avail"))
                          (conf-def (string-append out "/share/fontconfig/conf.default")))
                     (mkdir-p conf-dir)
                     (mkdir-p conf-def)
                     (call-with-output-file (string-append conf-dir "/75-misans.conf")
                       (lambda (port)
                         (display "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE fontconfig SYSTEM \"../fonts.dtd\">
<fontconfig>
    <alias>
        <family>Mi Sans</family>
        <prefer><family>Mi Sans</family></prefer>
    </alias>
</fontconfig>\n" port)))
                     (symlink "../conf.avail/75-misans.conf"
                              (string-append conf-def "/75-misans.conf"))))))))
    (inputs (list fontconfig))
    (synopsis "fontconfig configuration for MiSans Global fonts")
    (description "This package provides fontconfig configuration for the MiSans
Global font family by Xiaomi, enabling proper font selection and fallback
behavior for the Mi Sans typeface.")
    (home-page "https://hyperos.mi.com/font/download")
    (license license:misans)))

;;; -------------------------------------------------------------------
;;; 11. ttf-gentium-basic — SIL Gentium Basic font family
;;; -------------------------------------------------------------------
(define-public ttf-gentium-basic
  (package
    (name "ttf-gentium-basic")
    (version "1.102")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://software.sil.org/downloads/r/gentium/"
                    "GentiumBasic_"
                    (string-join (string-split version #\.) "")
                    ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/gentium-basic/"
                #:include-regexp ("\\.ttf$")))))
    (native-inputs (list unzip))
    (synopsis "fonts based on the original Gentium design with added weights")
    (description "Gentium Basic is a font family by SIL International based on
the original Gentium design, extended with bold and bold italic weights.  It
provides clean, readable typefaces suitable for a wide range of languages using
Latin and Cyrillic scripts.")
    (home-page "https://software.sil.org/gentium/")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 12. linuxmint-keyring — Linux Mint archive GnuPG keys
;;; -------------------------------------------------------------------
(define-public linuxmint-keyring
  (package
    (name "linuxmint-keyring")
    (version "2022.06.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/"
                    "linuxmint-keyring_" version "_all.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr/share" (string-append out "/share"))))))))
    (native-inputs (list binutils))
    (synopsis "GnuPG keys of the Linux Mint repository")
    (description "This package provides the GnuPG keys used to authenticate
packages from the Linux Mint repositories.  These keys are needed to verify
the integrity and authenticity of packages downloaded from Linux Mint
package archives.")
    (home-page "https://linuxmint.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. perl-module-signature — Perl module signature manipulation
;;; -------------------------------------------------------------------
(define-public perl-module-signature
  (package
    (name "perl-module-signature")
    (version "0.93")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/T/TI/TIMLEGGE/"
                    "Module-Signature-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/Module-Signature")
    (synopsis "module signature file manipulation for Perl")
    (description "Module::Signature provides functions to create, verify, and
manipulate SIGNATURE files for Perl distributions.  It supports cryptographic
verification of module integrity using GnuPG or the Digest family of modules.")
    (license (list license:perl-license license:cc0))))

;;; -------------------------------------------------------------------
;;; 14. perl-sub-delete — Perl module for deleting subroutines
;;; -------------------------------------------------------------------
(define-public perl-sub-delete
  (package
    (name "perl-sub-delete")
    (version "1.00003")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/D/DJ/DJERIUS/"
                    "Sub-Delete-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/dist/Sub-Delete")
    (synopsis "delete subroutines from Perl symbol tables")
    (description "Sub::Delete provides a mechanism to completely remove
subroutines from the Perl symbol table.  Unlike simply undefining a sub, this
module ensures the symbol table entry is fully cleaned up, which is useful for
metaprogramming and test isolation.")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 15. engauge-digitizer — data point extraction from graph images
;;; -------------------------------------------------------------------
(define-public engauge-digitizer
  (package
    (name "engauge-digitizer")
    (version "12.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/akhuettel/engauge-digitizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_PREFIX_PATH="
                                  #$(this-package-input "qtbase")))))
    (inputs
     (list fftw
           libjpeg-turbo
           libpng
           openjpeg
           poppler-qt6
           qtbase))
    (native-inputs (list pkg-config qttools-6))
    (synopsis "extract data points from images of graphs")
    (description "Engauge Digitizer is an application for extracting numeric
data from images of graphs.  It supports automatic and manual point matching,
curve fitting, axis calibration, and export to CSV and other formats.  Useful
for recovering data from scanned publications and screenshots.")
    (home-page "https://markummitchell.github.io/engauge-digitizer/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 16. lbforth — minimal Forth compiler in C
;;; -------------------------------------------------------------------
(define-public lbforth
  (package
    (name "lbforth")
    (version "20241115")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DosWorld/lbforth")
                    (commit (string-append "RELEASE-" version))))
              (file-name (git-file-name name version))
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
                   (invoke "gcc" "-o" "lbforth" "lbforth.c")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "lbforth" bin)))))))
    (synopsis "minimal Forth compiler written in C")
    (description "lbForth is a minimal Forth language compiler implemented in a
single C source file.  It provides a compact, educational implementation of
the Forth programming language suitable for learning compiler construction
and embedded systems programming.")
    (home-page "https://github.com/DosWorld/lbforth")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 17. bin86 — 8086 assembler and loader
;;; -------------------------------------------------------------------
(define-public bin86
  (package
    (name "bin86")
    (version "0.16.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sources.archlinux.org/other/packages/dev86/"
                    "bin86-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "complete 8086 assembler and linker")
    (description "bin86 provides @code{as86} and @code{ld86}, a complete 8086
assembler and linker.  They are used to build 16-bit x86 code, including real
mode boot loaders and legacy DOS-compatible programs.  The assembler supports
Intel-style syntax.")
    (home-page "https://v3.sk/~lkundrak/dev86/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 18. keyfinder-cli — musical key estimation CLI
;;; -------------------------------------------------------------------
(define-public keyfinder-cli
  (package
    (name "keyfinder-cli")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/evanpurkhiser/keyfinder-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ffmpeg fftw libkeyfinder))
    (native-inputs (list pkg-config))
    (synopsis "estimate the musical key of audio files from the command line")
    (description "keyfinder-cli estimates the musical key of audio files using
the libKeyFinder library and FFmpeg for decoding.  It supports many audio
formats and outputs the detected key in standard musical notation, which is
useful for DJs and music producers organizing their libraries.")
    (home-page "https://github.com/evanpurkhiser/keyfinder-cli")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. gftp — multithreaded FTP client
;;; -------------------------------------------------------------------
(define-public gftp
  (package
    (name "gftp")
    (version "2.9.1b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/masneyb/gftp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'autogen
                 (lambda _
                   (invoke "autoreconf" "-fi"))))))
    (inputs (list gtk+-2 openssl readline))
    (native-inputs (list autoconf automake intltool libtool pkg-config))
    (synopsis "multithreaded FTP, FTPS, HTTP, HTTPS, and SSH client for GTK")
    (description "gFTP is a multithreaded file transfer client for Unix-like
systems.  It supports FTP, FTPS, HTTP, HTTPS, SSH, and local file transfers
through both a GTK+ graphical interface and a text-mode interface.  Features
include bookmarks, file transfer queuing, and directory caching.")
    (home-page "https://www.gftp.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. fetchfetch — fetch info about fetch tools
;;; -------------------------------------------------------------------
(define-public fetchfetch
  (package
    (name "fetchfetch")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spenserblack/fetchfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "display information about installed fetch tools")
    (description "fetchfetch is a small utility that detects and displays
information about system information fetch tools (such as neofetch, fastfetch,
screenfetch, etc.) installed on your system.  It is a meta-fetch tool that
fetches info about your fetch tools.")
    (home-page "https://github.com/spenserblack/fetchfetch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. ltunify — Logitech Unifying device pairing tool
;;; -------------------------------------------------------------------
(define-public ltunify
  (package
    (name "ltunify")
    (version "0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.lekensteyn.nl/ltunify.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list "ltunify")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "ltunify" bin)))))))
    (synopsis "command-line tool to pair Logitech Unifying receivers")
    (description "ltunify is a command-line utility for managing Logitech
Unifying receivers.  It can list paired devices, pair new devices, and unpair
existing ones.  The tool communicates directly with the receiver via HID,
providing an alternative to Logitech's proprietary software.")
    (home-page "https://lekensteyn.nl/logitech-unifying.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. soupault-bin — static site generator (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public soupault-bin
  (package
    (name "soupault-bin")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PataphysicalSociety/soupault/releases/"
                    "download/" version "/soupault-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("soupault" "bin/soupault"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "static website generator based on HTML element tree rewriting")
    (description "Soupault is a static website generator that works by
manipulating HTML element trees rather than using templates.  It can insert
content, extract metadata, generate tables of contents, and transform pages
using Lua plugins.  It treats HTML as a first-class data structure.")
    (home-page "https://soupault.app/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. rust-motd-bin — MOTD generation (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public rust-motd-bin
  (package
    (name "rust-motd-bin")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rust-motd/rust-motd/releases/download/v"
                    version "/rust-motd-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rust-motd" "bin/rust-motd"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "beautiful and useful MOTD generation with zero runtime dependencies")
    (description "rust-motd generates attractive message-of-the-day (MOTD)
banners for terminal login sessions.  It displays system information including
uptime, filesystem usage, last login, weather, and more in a configurable,
colorful format with zero runtime dependencies.")
    (home-page "https://github.com/rust-motd/rust-motd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. pocket-id-bin — lightweight OIDC provider (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public pocket-id-bin
  (package
    (name "pocket-id-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pocket-id/pocket-id/releases/download/v"
                    version "/pocket-id-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pocket-id" "bin/pocket-id"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple and easy-to-use OpenID Connect provider")
    (description "Pocket ID is a lightweight, self-hosted OpenID Connect (OIDC)
identity provider.  It offers passkey-based authentication, a simple admin
interface, and easy integration with reverse proxies and other services that
support OIDC for single sign-on.")
    (home-page "https://pocket-id.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 25. pdf-metadata-editor-bin — PDF metadata editor (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public pdf-metadata-editor-bin
  (package
    (name "pdf-metadata-editor-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicofrand/pdf-metadata-editor/releases/"
                    "download/v" version "/pdf-metadata-editor_" version
                    "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop application for viewing and editing PDF metadata")
    (description "PDF Metadata Editor is a cross-platform desktop application
for viewing and editing metadata stored in PDF files.  It provides a simple
graphical interface to modify document properties such as title, author,
subject, keywords, creation date, and other XMP metadata fields.")
    (home-page "https://github.com/zaro/pdf-metadata-editor")
    (license license:expat)))
