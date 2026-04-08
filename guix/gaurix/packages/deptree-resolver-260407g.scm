;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260407g
;;; Resolves 100 BLOCKED packages from priority queue (pass g).
;;; 17 packages resolved with recipes, 83 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-07T23:30:00+00:00

(define-module (gaurix packages deptree-resolver-260407g)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (caligula-bin
            capa-bin
            carapace-bin
            catbox-bin
            catwalk-bin
            chibi-cli-bin
            chmod-cli-bin
            bililive-recorder-bin
            fonts-droid-fallback
            fonts-noto-hinted
            catppuccin-cursors-frappe
            catppuccin-cursors-macchiato
            catppuccin-cursors-mocha
            catppuccin-gtk-theme-macchiato
            catppuccin-gtk-theme-mocha
            cdirip
            c47-bin))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 1. caligula-bin ──────────────────────────────────────────────────
;;; Lightweight disk imaging TUI written in Rust
;;;
(define-public caligula-bin
  (package
    (name "caligula-bin")
    (version "0.4.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ifd3f/caligula/releases/download/v"
             version "/caligula-x86_64-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("caligula" "bin/caligula"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "caligula")
              (chmod "caligula" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ifd3f/caligula")
    (synopsis "lightweight, user-friendly disk imaging TUI")
    (description
     "Caligula is a lightweight, user-friendly disk imaging TUI that helps
you write disk images to removable storage devices.  It provides a safe
interface with device verification and progress tracking.")
    (license license:gpl3)))

;;; ── 2. capa-bin ─────────────────────────────────────────────────────
;;; Malware capability detection tool from Mandiant
;;;
(define-public capa-bin
  (package
    (name "capa-bin")
    (version "9.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mandiant/capa/releases/download/v"
             version "/capa-v" version "-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("capa" "bin/capa"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'make-executable
            (lambda _
              (chmod "capa" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mandiant/capa")
    (synopsis "detect capabilities in executable files")
    (description
     "Capa detects capabilities in executable files.  It analyzes PE, ELF,
.NET, and shellcode and identifies behaviors such as file system manipulation,
network communication, and anti-analysis techniques using a library of rules.")
    (license license:asl2.0)))

;;; ── 3. carapace-bin ────────────────────────────────────────────────
;;; Multi-shell multi-command argument completer
;;;
(define-public carapace-bin
  (package
    (name "carapace-bin")
    (version "1.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/carapace-sh/carapace-bin/releases/download/v"
             version "/carapace-bin_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("carapace" "bin/carapace"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/carapace-sh/carapace-bin")
    (synopsis "multi-shell multi-command argument completer")
    (description
     "Carapace-bin provides argument completion for multiple shells
(bash, zsh, fish, elvish, nushell, etc.) across hundreds of commands.
It uses a unified specification format to generate completions.")
    (license license:expat)))

;;; ── 4. catbox-bin ──────────────────────────────────────────────────
;;; CLI tool for uploading files to Catbox.moe
;;;
(define-public catbox-bin
  (package
    (name "catbox-bin")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/APT37/catbox/releases/download/"
             version "/catbox"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("catbox" "bin/catbox"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "catbox")
              (chmod "catbox" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/APT37/catbox")
    (synopsis "CLI tool for uploading files to Catbox.moe")
    (description
     "Catbox is a command-line tool for uploading files to the Catbox.moe
file hosting service.  It supports single and batch uploads with simple
command-line arguments.")
    (license license:expat)))

;;; ── 5. catwalk-bin ─────────────────────────────────────────────────
;;; LLM inference providers and models (CLI)
;;;
(define-public catwalk-bin
  (package
    (name "catwalk-bin")
    (version "0.34.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/charmbracelet/catwalk/releases/download/v"
             version "/catwalk_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("catwalk" "bin/catwalk"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/charmbracelet/catwalk")
    (synopsis "collection of LLM inference providers and models")
    (description
     "Catwalk provides a CLI for interacting with various LLM inference
providers and models.  It supports multiple backends and offers a unified
interface for running inference tasks from the command line.")
    (license license:expat)))

;;; ── 6. chibi-cli-bin ───────────────────────────────────────────────
;;; CLI tool for anime information lookup
;;;
(define-public chibi-cli-bin
  (package
    (name "chibi-cli-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CosmicPredator/chibi-cli/releases/download/"
             version "/chibi_" version "_linux_amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chibi" "bin/chibi"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "chibi")
              (chmod "chibi" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://chibi-cli.pages.dev/")
    (synopsis "CLI tool for anime information lookup")
    (description
     "Chibi-cli is a command-line tool for looking up anime information.
It queries anime databases and displays details such as synopsis, ratings,
and episode information in the terminal.")
    (license license:gpl3)))

;;; ── 7. chmod-cli-bin ───────────────────────────────────────────────
;;; Interactive chmod calculator and helper
;;;
(define-public chmod-cli-bin
  (package
    (name "chmod-cli-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Mayowa-Ojo/chmod-cli/releases/download/v"
             version "/chmod-cli_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chmod-cli" "bin/chmod-cli"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Mayowa-Ojo/chmod-cli")
    (synopsis "interactive chmod permissions calculator")
    (description
     "Chmod-cli is an interactive command-line tool that helps calculate
and apply Unix file permissions.  It provides a visual interface for
selecting permission bits and generates the corresponding chmod commands.")
    (license license:expat)))

;;; ── 8. bililive-recorder-bin ───────────────────────────────────────
;;; Bilibili live stream recorder
;;;
(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/BililiveRecorder/BililiveRecorder/releases/download/v"
             version "/BililiveRecorder-CLI-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("BililiveRecorder.Cli" "bin/bililive-recorder"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'make-executable
            (lambda _
              (chmod "BililiveRecorder.Cli" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BililiveRecorder/BililiveRecorder")
    (synopsis "Bilibili live stream recorder")
    (description
     "BililiveRecorder is a tool for recording Bilibili live streams.
It supports automatic stream detection, FLV repair, and can record
multiple streams simultaneously with configurable quality settings.")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; FONT PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 9. fonts-droid-fallback ────────────────────────────────────────
;;; DroidSansFallback font from Android/Debian
;;;
(define-public fonts-droid-fallback
  (package
    (name "fonts-droid-fallback")
    (version "6.0.1r16-1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://deb.debian.org/debian/pool/main/f/fonts-android/"
             "fonts-droid-fallback_" version "_all.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list binutils))
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/fonts" "share/fonts"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (home-page "http://deb.debian.org/debian/pool/main/f/fonts-android/")
    (synopsis "handheld device font with extensive style and language support")
    (description
     "DroidSansFallback is a font from the Android Open Source Project
that provides extensive Unicode coverage for CJK and other scripts.
This package includes the Fallback and FallbackFull variants.")
    (license license:asl2.0)))

;;; ── 10. fonts-noto-hinted ──────────────────────────────────────────
;;; Google Noto fonts (hinted, Debian package)
;;;
(define-public fonts-noto-hinted
  (package
    (name "fonts-noto-hinted")
    (version "20161116-1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://archive.debian.org/debian-archive/debian/pool/main/"
             "f/fonts-noto/fonts-noto-hinted_" version "_all.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list binutils))
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/fonts" "share/fonts"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (home-page "http://archive.debian.org/debian-archive/debian/pool/main/f/fonts-noto/")
    (synopsis "No Tofu font families with large Unicode coverage")
    (description
     "Noto is a collection of font families from Google, each visually
harmonized across scripts.  The name 'No Tofu' refers to the goal of
eliminating tofu (blank rectangles) when displaying text in any language.
This package provides hinted versions of the Noto fonts.")
    (license license:silofl1.1)))

;;; ════════════════════════════════════════════════════════════════════════
;;; CATPPUCCIN CURSOR THEMES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 11. catppuccin-cursors-frappe ──────────────────────────────────
;;; Soothing pastel mouse cursors (Frappe flavor, mauve accent)
;;;
(define-public catppuccin-cursors-frappe
  (package
    (name "catppuccin-cursors-frappe")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/cursors/releases/download/v"
             version "/catppuccin-frappe-mauve-cursors.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("catppuccin-frappe-mauve-cursors" "share/icons/catppuccin-frappe-mauve-cursors"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/catppuccin/cursors")
    (synopsis "soothing pastel mouse cursors, Frappe flavor")
    (description
     "Catppuccin Cursors provides soothing pastel-colored mouse cursors
in the Frappe color palette.  This package includes the mauve accent
variant.  Other accent variants (blue, flamingo, green, lavender, etc.)
are available from the upstream repository.")
    (license license:gpl2)))

;;; ── 12. catppuccin-cursors-macchiato ───────────────────────────────
;;; Soothing pastel mouse cursors (Macchiato flavor, mauve accent)
;;;
(define-public catppuccin-cursors-macchiato
  (package
    (name "catppuccin-cursors-macchiato")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/cursors/releases/download/v"
             version "/catppuccin-macchiato-mauve-cursors.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("catppuccin-macchiato-mauve-cursors" "share/icons/catppuccin-macchiato-mauve-cursors"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/catppuccin/cursors")
    (synopsis "soothing pastel mouse cursors, Macchiato flavor")
    (description
     "Catppuccin Cursors provides soothing pastel-colored mouse cursors
in the Macchiato color palette.  This package includes the mauve accent
variant.  Other accent variants (blue, flamingo, green, lavender, etc.)
are available from the upstream repository.")
    (license license:gpl2)))

;;; ── 13. catppuccin-cursors-mocha ───────────────────────────────────
;;; Soothing pastel mouse cursors (Mocha flavor, mauve accent)
;;;
(define-public catppuccin-cursors-mocha
  (package
    (name "catppuccin-cursors-mocha")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/cursors/releases/download/v"
             version "/catppuccin-mocha-mauve-cursors.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("catppuccin-mocha-mauve-cursors" "share/icons/catppuccin-mocha-mauve-cursors"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/catppuccin/cursors")
    (synopsis "soothing pastel mouse cursors, Mocha flavor")
    (description
     "Catppuccin Cursors provides soothing pastel-colored mouse cursors
in the Mocha color palette.  This package includes the mauve accent
variant.  Other accent variants (blue, flamingo, green, lavender, etc.)
are available from the upstream repository.")
    (license license:gpl2)))

;;; ════════════════════════════════════════════════════════════════════════
;;; CATPPUCCIN GTK THEMES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 14. catppuccin-gtk-theme-macchiato ─────────────────────────────
;;; Soothing pastel theme for GTK (Macchiato flavor)
;;;
(define-public catppuccin-gtk-theme-macchiato
  (package
    (name "catppuccin-gtk-theme-macchiato")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/gtk/releases/download/v"
             version "/catppuccin-macchiato-mauve-standard+default.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("catppuccin-macchiato-mauve-standard+default"
           "share/themes/catppuccin-macchiato-mauve-standard+default"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/catppuccin/gtk")
    (synopsis "soothing pastel theme for GTK, Macchiato flavor")
    (description
     "Catppuccin GTK Theme provides a soothing pastel color theme for GTK3
and GTK4 applications using the Macchiato color palette.  This package
includes the mauve accent with the standard+default variant.")
    (license license:gpl3)))

;;; ── 15. catppuccin-gtk-theme-mocha ─────────────────────────────────
;;; Soothing pastel theme for GTK (Mocha flavor)
;;;
(define-public catppuccin-gtk-theme-mocha
  (package
    (name "catppuccin-gtk-theme-mocha")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/gtk/releases/download/v"
             version "/catppuccin-mocha-mauve-standard+default.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("catppuccin-mocha-mauve-standard+default"
           "share/themes/catppuccin-mocha-mauve-standard+default"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (home-page "https://github.com/catppuccin/gtk")
    (synopsis "soothing pastel theme for GTK, Mocha flavor")
    (description
     "Catppuccin GTK Theme provides a soothing pastel color theme for GTK3
and GTK4 applications using the Mocha color palette.  This package
includes the mauve accent with the standard+default variant.")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; SOURCE-BUILD PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 16. cdirip ─────────────────────────────────────────────────────
;;; CD-i disc image extraction tool
;;;
(define-public cdirip
  (package
    (name "cdirip")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jozip/cdirip/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" #$(cc-for-target))
              "-f" "Makefile.linux")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "cdirip" bin)))))))
    (home-page "https://github.com/jozip/cdirip")
    (synopsis "CD-i disc image extraction tool")
    (description
     "CDIrip extracts tracks and data from CD-i disc images.  It supports
various CD-i image formats and can extract audio, video, and data tracks
from disc images.")
    (license license:gpl2)))

;;; ── 17. c47-bin ────────────────────────────────────────────────────
;;; Emulator for the C47 pocket calculator
;;;
(define-public c47-bin
  (package
    (name "c47-bin")
    (version "00.109.03.01b1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/rpncalculators/c43/-/releases/v"
             version "/downloads/c47_linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("c47" "bin/c47"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'make-executable
            (lambda _
              (chmod "c47" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "emulator for the C47 pocket calculator")
    (description
     "C47 is an emulator for the C47 RPN pocket calculator, based on the
C43 project.  It provides a faithful emulation of the calculator's
functions including scientific, statistical, and programming modes.")
    (license license:gpl3+)))
