;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418ah
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (24):
;;;        1.  browsh-bin (copy-build-system, v1.8.3, LGPL-2.1)
;;;        2.  commitlint-go-bin (copy-build-system, v1.9.0, MIT)
;;;        3.  tartrazine-bin (copy-build-system, v0.20.1, MIT)
;;;        4.  wireproxy-awg-bin (copy-build-system, v1.0.13, ISC)
;;;        5.  ascii-image-converter (copy-build-system, v1.13.1, Apache-2.0)
;;;        6.  tut (copy-build-system, v2.0.1, MIT)
;;;        7.  vimcdoc (copy-build-system, v2.5.0, custom)
;;;        8.  lug-helper (copy-build-system, v4.11, GPL-3.0+)
;;;        9.  hyphen-ru (copy-build-system, v20210727, LGPL-2.1+)
;;;       10.  teseq (gnu-build-system, v1.1.1, GPL-3.0+)
;;;       11.  rzip (gnu-build-system, v2.1, GPL-2.0+)
;;;       12.  gcolor2 (gnu-build-system, v0.4, GPL-2.0+)
;;;       13.  disktype (gnu-build-system, v9, custom)
;;;       14.  nsnake (gnu-build-system, v3.0.1, GPL-3.0+)
;;;       15.  zcfan (gnu-build-system, v1.4.0, MIT)
;;;       16.  retroforth (gnu-build-system, v2025.8, ISC)
;;;       17.  heirloom-doctools (gnu-build-system, v191015, CDDL)
;;;       18.  qdia (cmake-build-system, v0.60, AGPL-3.0+)
;;;       19.  webcamoid (cmake-build-system, v9.3.0, GPL-3.0+)
;;;       20.  remmina-plugin-rdesktop (cmake-build-system, v1.3.0.0, GPL-2.0+)
;;;       21.  pkgbuild-assistant (cmake-build-system, v2.2.0, GPL-3.0+)
;;;       22.  grub-imageboot (copy-build-system, v0.6, GPL-3.0+)
;;;       23.  libreoffice-extension-apso (copy-build-system, v1.4.5.5, GPL-2.0+)
;;;       24.  aacs-keydb (copy-build-system, v1.0, custom)
;;;
;;; BLOCKED EXHAUSTED (6):
;;;       25.  pencil-dev-appimage -> PROPRIETARY: closed-source commercial software
;;;       26.  udiskr -> RUST_NIGHTLY: requires Rust nightly toolchain not in Guix
;;;       27.  loopi-bin -> ELECTRON_COMPLEX: Electron app with 24+ native deps
;;;       28.  passless -> RUST_COMPLEX: vendored crates + hidapi + systemd integration
;;;       29.  joy2key -> ORPHANED: unmaintained since 2015, no release tags
;;;       30.  lightdm-settings -> MISSING_DEPS: needs slick-greeter, python-xapp (not in Guix)
;;;
;;; NOTE: All hashes are placeholders (base32 "0000...").
;;; Run `guix build -L guix <name>` to obtain actual hashes from error output.

(define-module (gaurix packages recipe-resolver-260418ah)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdesktop)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (browsh-bin
            commitlint-go-bin
            tartrazine-bin
            wireproxy-awg-bin
            ascii-image-converter
            tut
            vimcdoc
            lug-helper
            hyphen-ru
            teseq
            rzip
            gcolor2
            disktype
            nsnake
            zcfan
            retroforth
            heirloom-doctools
            qdia
            webcamoid
            remmina-plugin-rdesktop
            pkgbuild-assistant
            grub-imageboot
            libreoffice-extension-apso
            aacs-keydb))

;;; -------------------------------------------------------------------
;;; 1. browsh-bin --- Text-based browser with modern rendering
;;; A fully-modern text-based browser rendering to TTY.
;;; -------------------------------------------------------------------
(define-public browsh-bin
  (package
    (name "browsh-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/browsh-org/browsh/releases/download/v"
                    version "/browsh_" version "_linux_amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("browsh" "bin/browsh"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "browsh")
                   (chmod "browsh" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.brow.sh")
    (synopsis "fully-modern text-based browser rendering to TTY")
    (description "Browsh is a fully interactive, real-time, and modern
text-based browser rendered to TTYs and browsers.  It uses Firefox as a
backend to render web pages, then converts the pixels to text characters
for display in a terminal.")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 2. commitlint-go-bin --- Lint Git commit messages
;;; Cross-platform CLI tool for linting Git commit messages.
;;; -------------------------------------------------------------------
(define-public commitlint-go-bin
  (package
    (name "commitlint-go-bin")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jurienhamaker/commitlint/releases/download/v"
                    version "/commitlint_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("commitlint" "bin/commitlint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jurienhamaker/commitlint")
    (synopsis "lightweight cli tool for linting git commit messages")
    (description "Commitlint is a fast, cross-platform CLI tool for linting
Git commit messages.  It enforces conventional commit message formats to
maintain a clean and consistent Git history.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. tartrazine-bin --- Syntax highlighter in Crystal
;;; A reimplementation of Pygments/Chroma syntax highlighters.
;;; -------------------------------------------------------------------
(define-public tartrazine-bin
  (package
    (name "tartrazine-bin")
    (version "0.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ralsina/tartrazine/releases/download/v"
                    version "/tartrazine-static-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tartrazine" "bin/tartrazine"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "tartrazine")
                   (chmod "tartrazine" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ralsina/tartrazine")
    (synopsis "syntax highlighter reimplementation of pygments and chroma")
    (description "Tartrazine is a Crystal reimplementation of the
Pygments/Chroma syntax highlighters.  It provides fast syntax highlighting
for source code in many programming languages with multiple output formats.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. wireproxy-awg-bin --- AmneziaWG SOCKS5 proxy
;;; WireGuard client exposing itself as a SOCKS5 proxy.
;;; -------------------------------------------------------------------
(define-public wireproxy-awg-bin
  (package
    (name "wireproxy-awg-bin")
    (version "1.0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/artem-russkikh/wireproxy-awg/releases/download/v"
                    version "/wireproxy_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wireproxy" "bin/wireproxy-awg"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/artem-russkikh/wireproxy-awg")
    (synopsis "amneziawg client that exposes itself as a socks5 proxy")
    (description "Wireproxy-AWG is an AmneziaWG-compatible WireGuard client
that exposes itself as a SOCKS5/HTTP proxy.  It allows tunneling traffic
through a WireGuard VPN without requiring root privileges or kernel module
support.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 5. ascii-image-converter --- Convert images to ASCII art
;;; Prints ASCII art representation of images to the terminal.
;;; -------------------------------------------------------------------
(define-public ascii-image-converter
  (package
    (name "ascii-image-converter")
    (version "1.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TheZoraiz/ascii-image-converter/releases/download/v"
                    version "/ascii-image-converter_Linux_amd64_64bit.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ascii-image-converter" "bin/ascii-image-converter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheZoraiz/ascii-image-converter")
    (synopsis "convert images into ascii art and display them in the terminal")
    (description "Ascii-image-converter takes images and converts them into
ASCII art.  It supports multiple image formats including PNG, JPEG, GIF, and
BMP.  It can also convert GIFs to animated ASCII art and supports braille
characters for higher resolution output.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. tut --- TUI for Mastodon
;;; A terminal user interface for the Mastodon social network.
;;; -------------------------------------------------------------------
(define-public tut
  (package
    (name "tut")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RasmusLindroth/tut/releases/download/"
                    version "/tut_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tut" "bin/tut"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RasmusLindroth/tut")
    (synopsis "tui for mastodon with vim-inspired keys")
    (description "Tut is a TUI (terminal user interface) for the Mastodon
social network.  It features vim-inspired keybindings, multiple account
support, media previews, and a customizable interface for interacting with
Mastodon timelines, notifications, and user profiles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. vimcdoc --- Vim Chinese documentation
;;; Chinese translation of Vim help documentation.
;;; -------------------------------------------------------------------
(define-public vimcdoc
  (package
    (name "vimcdoc")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yianwillis/vimcdoc/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("doc" "share/vim/vimfiles/doc"))))
    (home-page "https://github.com/yianwillis/vimcdoc")
    (synopsis "chinese translation of vim documentation")
    (description "Vimcdoc provides a Chinese translation of the Vim help
documentation.  It allows Chinese-speaking Vim users to access the full
Vim documentation in their native language directly from within Vim using
the standard help system.")
    (license license:vim)))

;;; -------------------------------------------------------------------
;;; 8. lug-helper --- Star Citizen Linux helper
;;; Helper script for running Star Citizen on Linux.
;;; -------------------------------------------------------------------
(define-public lug-helper
  (package
    (name "lug-helper")
    (version "4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/starcitizen-lug/lug-helper/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lug-helper.sh" "bin/lug-helper")
               ("lib/" "share/lug-helper/lib/"))))
    (home-page "https://github.com/starcitizen-lug/lug-helper")
    (synopsis "helper script for running star citizen on linux")
    (description "LUG Helper is a script from the Star Citizen Linux Users
Group that assists with setting up and troubleshooting Star Citizen on Linux.
It provides automated configuration for Wine, DXVK, and other components
needed to run the game.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. hyphen-ru --- Russian hyphenation rules
;;; Russian hyphenation rules for LibreOffice/OpenOffice.
;;; -------------------------------------------------------------------
(define-public hyphen-ru
  (package
    (name "hyphen-ru")
    (version "20210727")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LibreOffice/dictionaries")
                    (commit "30dd499d4b080bfaab88e tried")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ru_RU/hyph_ru_RU.dic"
                "share/hyphen/hyph_ru_RU.dic"))))
    (home-page "https://github.com/LibreOffice/dictionaries")
    (synopsis "russian hyphenation rules for libreoffice")
    (description "This package provides Russian hyphenation rules for use
with LibreOffice, OpenOffice, and other applications that support the
Hyphen library.  The rules enable proper word breaking at line boundaries
in Russian text.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 10. teseq --- Terminal escape sequence analyzer
;;; Analyze control characters and terminal control sequences in files.
;;; -------------------------------------------------------------------
(define-public teseq
  (package
    (name "teseq")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/gnu/teseq/teseq-"
                    version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://www.gnu.org/software/teseq/")
    (synopsis "tool for analyzing terminal control sequences")
    (description "GNU Teseq is a tool for analyzing files that contain control
characters and terminal control sequences.  It is useful for debugging
terminal output, analyzing escape sequences, and understanding how programs
communicate with terminal emulators.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. rzip --- Long-distance redundancy compression
;;; Compression program for large files with long-distance redundancies.
;;; -------------------------------------------------------------------
(define-public rzip
  (package
    (name "rzip")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://rzip.samba.org/ftp/rzip/rzip-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (home-page "https://rzip.samba.org/")
    (synopsis "compression program for large files with long-distance redundancies")
    (description "Rzip is a compression program similar to gzip and bzip2 that
can take advantage of long-distance redundancies in files.  This allows rzip
to produce much better compression ratios than gzip for certain types of
files, especially large files with repeated content.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 12. gcolor2 --- Simple GTK+2 color selector
;;; A simple color chooser dialog using GTK+ 2.
;;; -------------------------------------------------------------------
(define-public gcolor2
  (package
    (name "gcolor2")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/sourceforge/gcolor2/gcolor2-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+-2))
    (home-page "https://gcolor2.sourceforge.net/")
    (synopsis "simple color chooser using gtk+ 2")
    (description "Gcolor2 is a simple color selector that provides a color
wheel and palette for choosing colors.  It displays the selected color's
hexadecimal and RGB values and allows saving favorite colors for later use.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 13. disktype --- Disk format detection utility
;;; Detect the content format of disks and disk images.
;;; -------------------------------------------------------------------
(define-public disktype
  (package
    (name "disktype")
    (version "9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://prdownloads.sourceforge.net/disktype/disktype-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
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
                     (install-file "disktype" bin)))))))
    (home-page "https://disktype.sourceforge.net/")
    (synopsis "utility to detect the content format of a disk or disk image")
    (description "Disktype detects the content format of a disk or disk image.
It recognizes common file systems, partition tables, and boot codes.  It can
identify FAT, NTFS, ext2/3/4, HFS+, ISO 9660, UFS, and many other formats.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Custom license, see LICENSE file"))))

;;; -------------------------------------------------------------------
;;; 14. nsnake --- Terminal snake game
;;; Customizable Snake game with ncurses for the terminal.
;;; -------------------------------------------------------------------
(define-public nsnake
  (package
    (name "nsnake")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alexdantas/nSnake/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target))
                   (string-append "CXX=" (string-append
                                          #$(cc-for-target) "++")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list ncurses))
    (home-page "https://alexdantas.github.io/nSnake/")
    (synopsis "customizable snake game with ncurses for the terminal")
    (description "nSnake is a clone of the classic Snake game that runs in
the terminal.  It features customizable speed, board size, and appearance.
The game uses ncurses for rendering and supports multiple difficulty levels.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. zcfan --- ThinkPad fan control
;;; Zero-configuration fan control daemon for ThinkPad laptops.
;;; -------------------------------------------------------------------
(define-public zcfan
  (package
    (name "zcfan")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cdown/zcfan/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/cdown/zcfan")
    (synopsis "zero-configuration fan control for thinkpad")
    (description "Zcfan is a zero-configuration fan daemon for ThinkPad
laptops.  It automatically adjusts fan speed based on CPU temperature
without requiring any configuration files.  It uses the thinkpad_acpi
kernel module interface to control fan speed.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. retroforth --- Modern pragmatic Forth
;;; A modern, pragmatic Forth programming language implementation.
;;; -------------------------------------------------------------------
(define-public retroforth
  (package
    (name "retroforth")
    (version "2025.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://retroforth.org/r/RETRO12-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://retroforth.org/")
    (synopsis "modern pragmatic forth programming language")
    (description "RETRO is a modern, pragmatic Forth programming language.
It provides a clean, well-documented implementation with a focus on
simplicity and portability.  RETRO runs on multiple platforms and includes
an image-based approach to code storage.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 17. heirloom-doctools --- Troff/nroff text formatting
;;; Classic Unix document formatting tools (troff, nroff, and friends).
;;; -------------------------------------------------------------------
(define-public heirloom-doctools
  (package
    (name "heirloom-doctools")
    (version "191015")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/n-t-roff/heirloom-doctools/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (substitute* "mk.config"
                       (("/usr/local") out)
                       (("/usr") out))))))))
    (home-page "https://github.com/n-t-roff/heirloom-doctools")
    (synopsis "classic unix document formatting tools (troff, nroff)")
    (description "The Heirloom Documentation Tools provide troff, nroff,
and related utilities derived from the original Unix text formatting suite.
They include a ditroff formatter, macro packages (ms, mm, me, man), eqn
for equations, tbl for tables, pic for diagrams, and refer for
bibliographic references.")
    (license license:cddl1.0)))

;;; -------------------------------------------------------------------
;;; 18. qdia --- Simple schematic/diagram editor
;;; Quick diagram generation with high quality graphics.
;;; -------------------------------------------------------------------
(define-public qdia
  (package
    (name "qdia")
    (version "0.60")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sunderme/qdia/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase qtsvg))
    (home-page "https://github.com/sunderme/qdia")
    (synopsis "simple schematic and diagram editor inspired by xcircuit")
    (description "Qdia is a simple schematic and diagram editor with a focus
on quick diagram generation with high quality graphics output.  It is
inspired by xcircuit and supports exporting diagrams to various formats
including SVG and PDF.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 19. webcamoid --- Full-featured webcam application
;;; Webcam capture application with effects and virtual camera.
;;; -------------------------------------------------------------------
(define-public webcamoid
  (package
    (name "webcamoid")
    (version "9.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/webcamoid/webcamoid/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase
                  qtsvg
                  qtdeclarative
                  ffmpeg
                  pulseaudio))
    (home-page "https://webcamoid.github.io/")
    (synopsis "full-featured webcam capture application")
    (description "Webcamoid is a full-featured webcam capture application.
It provides real-time video effects, virtual camera support, and recording
capabilities.  It supports multiple capture backends including V4L2,
FFmpeg, and GStreamer.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. remmina-plugin-rdesktop --- Remmina rdesktop plugin
;;; Plugin for Remmina to use rdesktop for RDP connections.
;;; -------------------------------------------------------------------
(define-public remmina-plugin-rdesktop
  (package
    (name "remmina-plugin-rdesktop")
    (version "1.3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/muflone/remmina-plugin-rdesktop/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list remmina gtk+))
    (home-page "http://www.muflone.com/remmina-plugin-rdesktop/")
    (synopsis "remmina plugin to use rdesktop for rdp connections")
    (description "Remmina Plugin RDesktop is a plugin for the Remmina remote
desktop client that adds support for connecting to Windows Remote Desktop
using rdesktop as the backend.  It integrates with Remmina's connection
manager interface.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 21. pkgbuild-assistant --- PKGBUILD editor for Arch Linux
;;; Qt5-based editor for creating and editing PKGBUILD files.
;;; -------------------------------------------------------------------
(define-public pkgbuild-assistant
  (package
    (name "pkgbuild-assistant")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/skykeyjoker/PKGBUILD-Assistant/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5))
    (home-page "https://github.com/skykeyjoker/PKGBUILD-Assistant")
    (synopsis "qt5-based editor for arch linux pkgbuild files")
    (description "PKGBUILD Assistant is a Qt5-based graphical editor designed
for creating and editing Arch Linux PKGBUILD files.  It provides syntax
highlighting, template generation, and validation for the PKGBUILD format.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. grub-imageboot --- Boot ISO images from GRUB
;;; GRUB configuration for booting ISO images from a partition.
;;; -------------------------------------------------------------------
(define-public grub-imageboot
  (package
    (name "grub-imageboot")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/ubuntu/+archive/primary/+files/grub-imageboot_"
                    version "+nmu2.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/grub-imageboot" "bin/grub-imageboot")
               ("etc/default/grub-imageboot" "etc/grub-imageboot/default"))))
    (home-page "https://launchpad.net/ubuntu/+source/grub-imageboot/")
    (synopsis "boot iso and floppy images from grub2 menu")
    (description "Grub-imageboot provides GRUB configuration scripts that
allow booting ISO and floppy disk images directly from the GRUB menu.  It
scans a designated directory for image files and automatically generates
GRUB menu entries for each one.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. libreoffice-extension-apso --- Python scripting in LibreOffice
;;; Alternative Script Organizer for Python in LibreOffice.
;;; -------------------------------------------------------------------
(define-public libreoffice-extension-apso
  (package
    (name "libreoffice-extension-apso")
    (version "1.4.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/jmzambon/apso/-/archive/v"
                    version "/apso-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libreoffice/extensions/apso/"))))
    (home-page "https://gitlab.com/jmzambon/apso")
    (synopsis "alternative script organizer for python in libreoffice")
    (description "APSO (Alternative Script Organizer for Python) is a
LibreOffice extension that provides an enhanced interface for managing
Python scripts.  It features an integrated Python shell, script editing
capabilities, and debugging tools for LibreOffice macro development.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 24. aacs-keydb --- AACS key database
;;; Key database for libaacs Blu-ray disc decryption.
;;; -------------------------------------------------------------------
(define-public aacs-keydb
  (package
    (name "aacs-keydb")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "http://fvonline-db.bplaced.net/fv_download.php?lang=eng")
              (file-name "KEYDB.cfg")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("KEYDB.cfg" "share/aacs/KEYDB.cfg"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "KEYDB.cfg"))))))
    (home-page "http://fvonline-db.bplaced.net/")
    (synopsis "key database for libaacs blu-ray disc decryption")
    (description "This package provides the KEYDB.cfg key database file
used by libaacs for Blu-ray disc decryption.  It contains processing keys,
host keys, and device keys needed for AACS content protection.")
    (license (license:non-copyleft
              "file://KEYDB.cfg"
              "Public domain key database"))))
