;;; Queue drain 2026-04-06 NRD30b — resolve 30 NEEDS_RECIPE_DESIGN packages.
;;; 9 recipes: 3 binary (Go/Rust), 2 source builds (C/Make, CMake/Qt6),
;;; 1 Python package, 1 Java JAR, 2 fonts.
;;; 2 compat aliases in general-compat.scm.
;;; 19 re-blocked with detailed notes.
(define-module (gaurix packages queue-20260406-nrd30b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (oh-my-posh-bin
            hyprls-bin
            protonup-rs-bin
            mew
            pixelterm-c
            efibooteditor
            rofimoji
            ffdec
            ttf-octicons))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. oh-my-posh-bin ──────────────────────────────────────────────
;; Cross-platform prompt theme engine (Go static binary)

(define-public oh-my-posh-bin
  (package
    (name "oh-my-posh-bin")
    (version "29.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v"
                    version "/posh-linux-amd64"))
              (sha256
               (base32 "0rchq52mwymwi90f3xhqy988ycf15dfq4684qkv4gy841hald3q0"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (copy-file #$source (string-append bin "/oh-my-posh"))
                 (chmod (string-append bin "/oh-my-posh") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ohmyposh.dev")
    (synopsis "cross-platform prompt theme engine for any shell")
    (description "Oh My Posh is a prompt theme engine for any shell.  It renders
rich prompt segments with icons, git status indicators, language version
displays, and other contextual information.  It supports Bash, Zsh, Fish,
PowerShell, and other shells.")
    (license license:expat)))

;; ── 2. hyprls-bin ──────────────────────────────────────────────────
;; Language Server Protocol server for Hyprland config files

(define-public hyprls-bin
  (package
    (name "hyprls-bin")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hyprland-community/hyprls/releases/download/v"
                    version "/hyprls-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0j6xyq7dfg87l4vigqar2kin6vyl6ijjprawj9hy3ps5qh8wpbh2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprls" "bin/hyprls"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyprland-community/hyprls")
    (synopsis "language server for Hyprland configuration files")
    (description "Hyprls is a Language Server Protocol (LSP) implementation for
Hyprland compositor configuration files.  It provides autocompletion,
diagnostics, and hover information for Hyprland config syntax in supported
editors.")
    (license license:expat)))

;; ── 3. protonup-rs-bin ─────────────────────────────────────────────
;; CLI tool for managing Proton-GE and Wine-GE (Rust static binary)

(define-public protonup-rs-bin
  (package
    (name "protonup-rs-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/auyer/Protonup-rs/releases/download/v"
                    version "/protonup-rs-linux-amd64.tar.gz"))
              (sha256
               (base32 "1bd5hlsz363hv690bwjvj7y3s42x5rl4b0nmmlw6ffdlrdjz7bim"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("protonup-rs" "bin/protonup-rs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/auyer/Protonup-rs")
    (synopsis "CLI tool for managing Proton-GE and Wine-GE installations")
    (description "Protonup-rs is a command-line tool for installing and managing
GE-Proton (for Steam) and Wine-GE (for Lutris) compatibility layers.  It
automates downloading and installing the latest versions of these custom
Proton/Wine builds.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Source-built packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 4. mew ─────────────────────────────────────────────────────────
;; Wayland dynamic menu (dmenu port for Wayland)

(define-public mew
  (package
    (name "mew")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/sewn/mew/archive/" version ".tar.gz"))
              (sha256
               (base32 "02y7hc2rddwxnkqws316j6j5z9dv5jxji0zd4wipjpvc5jwjyi81"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc"))
                   (string-append "PKG_CONFIG="
                                  (or (getenv "PKG_CONFIG") "pkg-config")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config wayland-protocols))
    (inputs (list fcft libxkbcommon pixman wayland))
    (home-page "https://codeberg.org/sewn/mew")
    (synopsis "dynamic menu for Wayland compositors")
    (description "Mew is a dynamic menu for Wayland compositors, inspired by
dmenu.  It provides a simple, efficient launcher and menu interface that
integrates with Wayland's layer-shell protocol for use with compositors
such as Sway, Hyprland, and River.")
    (license license:expat)))

;; ── 5. pixelterm-c ─────────────────────────────────────────────────
;; Terminal image/video/PDF browser using Chafa

(define-public pixelterm-c
  (package
    (name "pixelterm-c")
    (version "1.7.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zouyonghe/PixelTerm-C/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1p010kmvx0jlil9iiwk4yvys5zr2hn9165pzb0zs7bipfv7b9il2"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc"))
                   (string-append "PKG_CONFIG="
                                  (or (getenv "PKG_CONFIG") "pkg-config")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list chafa ffmpeg gdk-pixbuf glib mupdf))
    (home-page "https://github.com/zouyonghe/PixelTerm-C")
    (synopsis "terminal image, video, and PDF browser using Chafa")
    (description "PixelTerm-C is a high-performance terminal media browser
written in C.  It renders images, videos, and PDF documents directly in
the terminal using the Chafa library for character-based pixel output,
with FFmpeg for video decoding and MuPDF for PDF rendering.")
    (license license:lgpl3+)))

;; ── 6. efibooteditor ──────────────────────────────────────────────
;; Qt-based UEFI boot entry editor

(define-public efibooteditor
  (package
    (name "efibooteditor")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Neverous/efibooteditor/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1syjw3pmaih0s03gprfjby5pl9vsxkm89hsn2cnjfbyqbjbm43mi"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs (list pkg-config))
    (inputs (list efivar qtbase qtsvg zlib))
    (home-page "https://github.com/Neverous/efibooteditor")
    (synopsis "GUI editor for UEFI boot entries")
    (description "EFIBootEditor is a graphical application for viewing and
editing UEFI boot manager entries.  It provides a user-friendly Qt interface
for managing boot order, creating new boot entries, and modifying existing
UEFI boot configurations without using command-line tools.")
    (license license:lgpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. rofimoji ────────────────────────────────────────────────────
;; Emoji/character picker for rofi and wofi

(define-public rofimoji
  (package
    (name "rofimoji")
    (version "6.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/r/rofimoji/rofimoji-"
                    version ".tar.gz"))
              (sha256
               (base32 "09ajnfkrdsdifrjpg5xs0dwd98yb3znhl6bpnlhnyc1dkc89l8hn"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-configargparse))
    (inputs (list rofi))
    (home-page "https://github.com/fdw/rofimoji")
    (synopsis "emoji and character picker for rofi and wofi")
    (description "Rofimoji is an emoji and special character picker that
integrates with rofi and wofi launchers.  It supports Unicode emoji,
mathematical symbols, Nerd Font icons, and other character sets with
search and recent-usage tracking.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Java packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 8. ffdec ───────────────────────────────────────────────────────
;; JPEXS Free Flash Decompiler

(define-public ffdec
  (package
    (name "ffdec")
    (version "25.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version"
                    version "/ffdec_" version ".zip"))
              (sha256
               (base32 "0khydbb25av2rsi55i6i5xw4c159bq2vgwpzb481cprns5bcsf8b"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out     #$output)
                      (bin     (string-append out "/bin"))
                      (lib     (string-append out "/lib/ffdec"))
                      (unzip   (string-append #$(this-package-native-input "unzip")
                                              "/bin/unzip"))
                      (java    (string-append #$(this-package-input "openjdk")
                                              "/bin/java"))
                      (tmp     (string-append (or (getenv "TMPDIR") "/tmp")
                                              "/ffdec-src")))
                 (mkdir-p tmp)
                 (invoke unzip "-q" #$source "-d" tmp)
                 (mkdir-p lib)
                 (mkdir-p bin)
                 ;; Install all JAR files and lib directory
                 (for-each (lambda (f)
                             (when (string-suffix? ".jar" f)
                               (copy-file (string-append tmp "/" f)
                                          (string-append lib "/" (basename f)))))
                           (scandir tmp))
                 (when (file-exists? (string-append tmp "/lib"))
                   (copy-recursively (string-append tmp "/lib")
                                     (string-append lib "/lib")))
                 ;; Create wrapper script
                 (call-with-output-file (string-append bin "/ffdec")
                   (lambda (port)
                     (format port "#!~a/bin/bash~%exec ~a -jar ~a/ffdec.jar \"$@\"~%"
                             #$(this-package-input "bash-minimal")
                             java
                             lib)))
                 (chmod (string-append bin "/ffdec") #o755)))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal (list openjdk17 "jdk")))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://github.com/jindrapetrik/jpexs-decompiler")
    (synopsis "open-source Flash SWF decompiler and editor")
    (description "JPEXS Free Flash Decompiler (FFDec) is a tool for inspecting,
decompiling, and editing Adobe Flash SWF files.  It can extract and modify
ActionScript, shapes, images, sounds, fonts, and other resources embedded
in SWF files.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Font packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 9. ttf-octicons ────────────────────────────────────────────────
;; GitHub's Octicons icon font

(define-public ttf-octicons
  (package
    (name "ttf-octicons")
    (version "19.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/primer/octicons/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1bjrfsyfcr3da88njqhv56fs2n57kdgv104v0zqis6lp9dy658rk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("icons" "share/icons/octicons"))))
    (home-page "https://github.com/primer/octicons")
    (synopsis "GitHub's icon set for user interfaces")
    (description "Octicons is GitHub's official icon set.  It includes scalable
SVG icons designed for use in web and desktop applications, covering common
UI actions, file types, and GitHub-specific concepts.")
    (license license:expat)))
