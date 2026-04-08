;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   Atkinson Hyperlegible Next font family (6 variants), Blobmoji emoji font,
;;;   icon/cursor/GRUB/GTK/sound themes, pre-built binaries, shell scripts,
;;;   C/C++ builds (cmake), and Python packages.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:export (otf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next
            ttf-atkinson-hyperlegible-next-variable
            otf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono
            ttf-atkinson-hyperlegible-next-mono-variable
            blobmoji
            candy-icons-git
            sweet-folders-icons-git
            gruvbox-icon-theme-git
            breeze-hacked-cursor-theme-git
            grub-theme-tela-white-2k-git
            grub-theme-tela-white-4k-git
            grub2-theme-archxion
            grub2-theme-archlinux
            sound-theme-smooth
            gruvbox-gtk-theme-git
            xfce-theme-cobibird
            fagram-bin
            pixieditor-bin
            android-apktool-bin
            amdgpu-clocks
            python-funk
            nvimpager
            jome
            croaring
            logiops-git
            duckduckgo-chat-cli
            plymouth-theme-hexagon-alt-gruvbox
            puddletag))

;;;
;;; ── 1. otf-atkinson-hyperlegible-next ───────────────────────────────
;;; Atkinson Hyperlegible Next — OTF files
;;;
(define-public otf-atkinson-hyperlegible-next
  (package
    (name "otf-atkinson-hyperlegible-next")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/googlefonts/atkinson-hyperlegible-next")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/opentype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "\\.otf$"))))))))
    (home-page "https://github.com/googlefonts/atkinson-hyperlegible-next")
    (synopsis "Atkinson Hyperlegible Next font family (OTF)")
    (description
     "Atkinson Hyperlegible Next is a typeface designed by the Braille
Institute to be maximally legible for readers with low vision.  It features
distinctive letterforms that reduce confusion between similar glyphs.  This
package provides the OpenType format files.")
    (license license:silofl1.1)))

;;;
;;; ── 2. ttf-atkinson-hyperlegible-next ───────────────────────────────
;;; Atkinson Hyperlegible Next — TTF files
;;;
(define-public ttf-atkinson-hyperlegible-next
  (package
    (inherit otf-atkinson-hyperlegible-next)
    (name "ttf-atkinson-hyperlegible-next")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "^[^V].*\\.ttf$"))))))))
    (synopsis "Atkinson Hyperlegible Next font family (TTF)")
    (description
     "Atkinson Hyperlegible Next is a typeface designed by the Braille
Institute to be maximally legible for readers with low vision.  It features
distinctive letterforms that reduce confusion between similar glyphs.  This
package provides the TrueType format files.")))

;;;
;;; ── 3. ttf-atkinson-hyperlegible-next-variable ──────────────────────
;;; Atkinson Hyperlegible Next — Variable TTF
;;;
(define-public ttf-atkinson-hyperlegible-next-variable
  (package
    (inherit otf-atkinson-hyperlegible-next)
    (name "ttf-atkinson-hyperlegible-next-variable")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "Variable.*\\.ttf$"))))))))
    (synopsis "Atkinson Hyperlegible Next variable font (TTF)")
    (description
     "Atkinson Hyperlegible Next is a typeface designed by the Braille
Institute to be maximally legible for readers with low vision.  This
package provides the variable-weight TrueType format files.")))

;;;
;;; ── 4. otf-atkinson-hyperlegible-next-mono ──────────────────────────
;;; Atkinson Hyperlegible Next Mono — OTF files
;;;
(define-public otf-atkinson-hyperlegible-next-mono
  (package
    (inherit otf-atkinson-hyperlegible-next)
    (name "otf-atkinson-hyperlegible-next-mono")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/opentype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "Mono.*\\.otf$"))))))))
    (synopsis "Atkinson Hyperlegible Next Mono font (OTF)")
    (description
     "Atkinson Hyperlegible Next Mono is a monospaced companion to the
Atkinson Hyperlegible Next typeface, designed for maximum legibility in
code and terminal environments.  This package provides the OpenType files.")))

;;;
;;; ── 5. ttf-atkinson-hyperlegible-next-mono ──────────────────────────
;;; Atkinson Hyperlegible Next Mono — TTF files
;;;
(define-public ttf-atkinson-hyperlegible-next-mono
  (package
    (inherit otf-atkinson-hyperlegible-next)
    (name "ttf-atkinson-hyperlegible-next-mono")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "Mono[^V]*\\.ttf$"))))))))
    (synopsis "Atkinson Hyperlegible Next Mono font (TTF)")
    (description
     "Atkinson Hyperlegible Next Mono is a monospaced companion to the
Atkinson Hyperlegible Next typeface, designed for maximum legibility in
code and terminal environments.  This package provides the TrueType files.")))

;;;
;;; ── 6. ttf-atkinson-hyperlegible-next-mono-variable ─────────────────
;;; Atkinson Hyperlegible Next Mono — Variable TTF
;;;
(define-public ttf-atkinson-hyperlegible-next-mono-variable
  (package
    (inherit otf-atkinson-hyperlegible-next)
    (name "ttf-atkinson-hyperlegible-next-mono-variable")
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f) (install-file f font-dir))
                               (find-files "." "Mono.*Variable.*\\.ttf$"))))))))
    (synopsis "Atkinson Hyperlegible Next Mono variable font (TTF)")
    (description
     "Atkinson Hyperlegible Next Mono is a monospaced companion to the
Atkinson Hyperlegible Next typeface.  This package provides the
variable-weight TrueType format files.")))

;;;
;;; ── 7. blobmoji ─────────────────────────────────────────────────────
;;; Blob-style emoji font (Noto Emoji fork by C1710)
;;;
(define-public blobmoji
  (package
    (name "blobmoji")
    (version "15.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/C1710/blobmoji/releases/download/v"
             version "/Blobmoji.ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "source")
                   (copy-file source "source/Blobmoji.ttf")
                   (chdir "source")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (install-file "Blobmoji.ttf" font-dir)))))))
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "blob-style emoji font based on Noto Emoji")
    (description
     "Blobmoji is a fork of Google's Noto Color Emoji that restores the
beloved blob-style emoji designs from Android 4.4 through 7.1.  It provides
a full color emoji font in TrueType format.")
    (license license:asl2.0)))

;;;
;;; ── 8. candy-icons-git ──────────────────────────────────────────────
;;; Sweet gradient SVG/PNG icon theme
;;;
(define-public candy-icons-git
  (package
    (name "candy-icons-git")
    (version "0.0.0-1.83512fb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EliverLara/candy-icons")
             (commit "83512fb4b9823e8e0bac5a41d7e0f05f2f07a58d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/candy-icons"
                #:exclude ("README.md" "LICENSE" ".git")))))
    (home-page "https://github.com/EliverLara/candy-icons")
    (synopsis "sweet gradient icon theme for Linux desktops")
    (description
     "Candy Icons is a colorful icon theme featuring gradient-style SVG and
PNG icons.  It provides coverage for many popular applications and
integrates well with the Sweet GTK theme family.")
    (license license:gpl3+)))

;;;
;;; ── 9. sweet-folders-icons-git ──────────────────────────────────────
;;; Sweet folder icon theme
;;;
(define-public sweet-folders-icons-git
  (package
    (name "sweet-folders-icons-git")
    (version "0.0.0-1.40a5d36")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EliverLara/Sweet-folders")
             (commit "40a5d366e365bb6fcb6aacc91c0437b1bfbb0e0a")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Sweet-folders"
                #:exclude ("README.md" "LICENSE" ".git")))))
    (home-page "https://github.com/EliverLara/Sweet-folders")
    (synopsis "sweet folder icon theme for Linux desktops")
    (description
     "Sweet-folders provides colorful folder icons that complement the
Sweet and Candy icon themes.  It can be used as a standalone icon theme or
layered on top of another icon set.")
    (license license:gpl3+)))

;;;
;;; ── 10. gruvbox-icon-theme-git ──────────────────────────────────────
;;; Gruvbox Plus icon pack
;;;
(define-public gruvbox-icon-theme-git
  (package
    (name "gruvbox-icon-theme-git")
    (version "0.0.0-1.5d2e1d0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SylEleuth/gruvbox-plus-icon-pack")
             (commit "5d2e1d08bbe00e455df96cfc2bdf44ee1d3b1b84")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Gruvbox-Plus-Dark" "share/icons/Gruvbox-Plus-Dark"))))
    (home-page "https://github.com/SylEleuth/gruvbox-plus-icon-pack")
    (synopsis "gruvbox-themed icon pack for Linux desktops")
    (description
     "Gruvbox Plus is an icon theme for Linux desktops inspired by the
Gruvbox color scheme.  It provides dark and light variants with SVG icons
for many popular applications.")
    (license license:gpl3+)))

;;;
;;; ── 11. breeze-hacked-cursor-theme-git ──────────────────────────────
;;; Modified Breeze cursor theme
;;;
(define-public breeze-hacked-cursor-theme-git
  (package
    (name "breeze-hacked-cursor-theme-git")
    (version "0.0.0-1.79dcc89")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/clayrisser/breeze-hacked-cursor-theme")
             (commit "79dcc896a18a6b35f2d4b54ecd93c3edfd3e7d82")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Breeze_Hacked" "share/icons/Breeze_Hacked"))))
    (home-page "https://github.com/clayrisser/breeze-hacked-cursor-theme")
    (synopsis "modified Breeze cursor theme with improved visibility")
    (description
     "Breeze Hacked is a modified version of KDE's Breeze cursor theme
with enhanced visibility and slightly larger cursors for high-DPI displays.
It maintains the clean Breeze aesthetic while being easier to spot.")
    (license license:gpl2)))

;;;
;;; ── 12. grub-theme-tela-white-2k-git ────────────────────────────────
;;; GRUB Tela theme — white 2K variant
;;;
(define-public grub-theme-tela-white-2k-git
  (package
    (name "grub-theme-tela-white-2k-git")
    (version "2025-07-23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vinceliuice/grub2-themes")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("common" "share/grub/themes/tela-white-2k/")
               ("config/theme-2k.txt"
                "share/grub/themes/tela-white-2k/theme.txt")
               ("backgrounds/2k/background-tela.jpg"
                "share/grub/themes/tela-white-2k/background.jpg")
               ("assets/assets-white/select-2k"
                "share/grub/themes/tela-white-2k/select-2k")
               ("assets/assets-white/info-2k.png"
                "share/grub/themes/tela-white-2k/info-2k.png"))))
    (home-page "https://github.com/vinceliuice/grub2-themes")
    (synopsis "Tela GRUB theme — white 2K variant")
    (description
     "A flat design GRUB bootloader theme from the Tela theme collection
by Vinceliuice.  This is the white color variant optimized for 2K (1440p)
resolution displays.")
    (license license:gpl3+)))

;;;
;;; ── 13. grub-theme-tela-white-4k-git ────────────────────────────────
;;; GRUB Tela theme — white 4K variant
;;;
(define-public grub-theme-tela-white-4k-git
  (package
    (inherit grub-theme-tela-white-2k-git)
    (name "grub-theme-tela-white-4k-git")
    (arguments
     (list #:install-plan
           #~'(("common" "share/grub/themes/tela-white-4k/")
               ("config/theme-4k.txt"
                "share/grub/themes/tela-white-4k/theme.txt")
               ("backgrounds/4k/background-tela.jpg"
                "share/grub/themes/tela-white-4k/background.jpg")
               ("assets/assets-white/select-4k"
                "share/grub/themes/tela-white-4k/select-4k")
               ("assets/assets-white/info-4k.png"
                "share/grub/themes/tela-white-4k/info-4k.png"))))
    (synopsis "Tela GRUB theme — white 4K variant")
    (description
     "A flat design GRUB bootloader theme from the Tela theme collection
by Vinceliuice.  This is the white color variant optimized for 4K (2160p)
resolution displays.")))

;;;
;;; ── 14. grub2-theme-archxion ────────────────────────────────────────
;;; Arch Linux GRUB2 Archxion theme
;;;
(define-public grub2-theme-archxion
  (package
    (name "grub2-theme-archxion")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ochurlaud/grub2-themes-archlinux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Archxion" "share/grub/themes/Archxion"))))
    (home-page "https://github.com/ochurlaud/grub2-themes-archlinux")
    (synopsis "Archxion GRUB2 theme inspired by Arch Linux")
    (description
     "Archxion is a clean GRUB2 bootloader theme with an Arch Linux
aesthetic.  It features a dark background with the Arch Linux logo and
modern typography for the boot menu.")
    (license license:gpl2)))

;;;
;;; ── 15. grub2-theme-archlinux ───────────────────────────────────────
;;; Arch Linux GRUB2 theme
;;;
(define-public grub2-theme-archlinux
  (package
    (inherit grub2-theme-archxion)
    (name "grub2-theme-archlinux")
    (arguments
     (list #:install-plan
           #~'(("Archlinux" "share/grub/themes/Archlinux"))))
    (synopsis "Arch Linux GRUB2 bootloader theme")
    (description
     "A GRUB2 bootloader theme featuring the Arch Linux branding and
color scheme.  It provides a clean, minimal boot menu appearance.")))

;;;
;;; ── 16. sound-theme-smooth ──────────────────────────────────────────
;;; Smooth XDG sound theme
;;;
(define-public sound-theme-smooth
  (package
    (name "sound-theme-smooth")
    (version "0.0.0-1.0e6d33c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicklarosa/smooth-sound-theme")
             (commit "0e6d33cbfc39a285d0e3fb6fcf3c2bde93add1bc")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sounds/Smooth"
                #:exclude ("README.md" "LICENSE" ".git")))))
    (home-page "https://github.com/nicklarosa/smooth-sound-theme")
    (synopsis "smooth XDG desktop sound theme")
    (description
     "Smooth is an XDG-compatible desktop sound theme providing pleasant,
unobtrusive notification and event sounds for Linux desktop environments.")
    (license license:cc-by-sa4.0)))

;;;
;;; ── 17. gruvbox-gtk-theme-git ───────────────────────────────────────
;;; Gruvbox GTK theme
;;;
(define-public gruvbox-gtk-theme-git
  (package
    (name "gruvbox-gtk-theme-git")
    (version "0.0.0-1.b00cbfb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Fausto-Korpsvansen/Gruvbox-GTK-Theme")
             (commit "b00cbfbc16e9da72e3dd2038f6a55f0a7c0e3e55")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Gruvbox-Dark" "share/themes/Gruvbox-Dark")
               ("Gruvbox-Dark-BL" "share/themes/Gruvbox-Dark-BL"))))
    (home-page "https://github.com/Fausto-Korpsvansen/Gruvbox-GTK-Theme")
    (synopsis "gruvbox color scheme GTK theme")
    (description
     "A GTK theme based on the Gruvbox color scheme, providing dark and
borderless variants for GTK3 and GTK4 applications.")
    (license license:gpl3+)))

;;;
;;; ── 18. xfce-theme-cobibird ─────────────────────────────────────────
;;; Cobibird XFCE/GTK theme
;;;
(define-public xfce-theme-cobibird
  (package
    (name "xfce-theme-cobibird")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicklarosa/cobibird-xfce-theme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/Cobibird"
                #:exclude ("README.md" "LICENSE" ".git")))))
    (home-page "https://github.com/nicklarosa/cobibird-xfce-theme")
    (synopsis "Cobibird GTK theme for XFCE desktops")
    (description
     "Cobibird is a clean GTK theme designed primarily for the XFCE desktop
environment.  It features a modern flat design with consistent styling
across GTK2 and GTK3 applications.")
    (license license:gpl3+)))

;;;
;;; ── 19. fagram-bin ──────────────────────────────────────────────────
;;; Fagram Telegram desktop client (pre-built binary)
;;;
(define-public fagram-bin
  (package
    (name "fagram-bin")
    (version "5.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicevision/fagram-desktop/releases/download/"
             version "/fagram-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Fagram" "bin/fagram"))))
    (home-page "https://github.com/nicevision/fagram-desktop")
    (synopsis "Fagram Telegram desktop client (pre-built binary)")
    (description
     "Fagram is a modified Telegram Desktop client with additional features
and customizations.  This package provides the pre-built Linux binary.")
    (license license:gpl3+)))

;;;
;;; ── 20. pixieditor-bin ──────────────────────────────────────────────
;;; PixiEditor pixel art editor (pre-built binary)
;;;
(define-public pixieditor-bin
  (package
    (name "pixieditor-bin")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PixiEditor/PixiEditor/releases/download/"
             version "/PixiEditor-" version "-amd64-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pixieditor"
                #:exclude ("README.md" "LICENSE")))))
    (home-page "https://pixieditor.net")
    (synopsis "pixel art editor for Linux (pre-built binary)")
    (description
     "PixiEditor is a lightweight pixel art editor built with .NET.  It
supports layers, animations, color palettes, and various drawing tools for
creating pixel art.  This package provides the pre-built Linux binary.")
    (license license:expat)))

;;;
;;; ── 21. android-apktool-bin ─────────────────────────────────────────
;;; APK reverse engineering tool (Java JAR binary)
;;;
(define-public android-apktool-bin
  (package
    (name "android-apktool-bin")
    (version "2.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_"
             version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("apktool.jar" "share/java/apktool.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (mkdir-p ".")
              (copy-file source "apktool.jar")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jar (string-append out "/share/java/apktool.jar"))
                     (java (search-input-file inputs "bin/java")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/apktool")
                  (lambda (port)
                    (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            java jar)))
                (chmod (string-append bin "/apktool") #o755)))))))
    (inputs (list bash `(,icedtea "jdk")))
    (home-page "https://apktool.org/")
    (synopsis "reverse engineering tool for Android APK files")
    (description
     "Apktool is a tool for reverse engineering Android application packages
(APK files).  It can decode resources to nearly original form and rebuild
them after modifications.  Useful for analyzing, debugging, and localizing
Android apps.")
    (license license:asl2.0)))

;;;
;;; ── 22. amdgpu-clocks ──────────────────────────────────────────────
;;; AMD GPU clock/voltage control script
;;;
(define-public amdgpu-clocks
  (package
    (name "amdgpu-clocks")
    (version "0.0.0-1.9061273")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sibradzic/amdgpu-clocks")
             (commit "9061273e3ce05e7b3e5bf75bd0e7f2a153ba5fe9")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amdgpu-clocks" "bin/amdgpu-clocks"))))
    (inputs (list bash))
    (home-page "https://github.com/sibradzic/amdgpu-clocks")
    (synopsis "AMD GPU custom clock and voltage control script")
    (description
     "Amdgpu-clocks is a Bash script that allows setting custom power states
(clock frequencies and voltages) for AMD GPUs using the amdgpu Linux kernel
driver's sysfs interface.  It can read and apply power profiles at boot or
on demand.")
    (license license:gpl2)))

;;;
;;; ── 23. python-funk ─────────────────────────────────────────────────
;;; Python test doubles library
;;;
(define-public python-funk
  (package
    (name "python-funk")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/f/funk/funk-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/funk/")
    (synopsis "Python test doubles library for creating stubs and mocks")
    (description
     "Funk is a Python library for creating test doubles including stubs,
mocks, and fakes.  It provides a clean API for setting up expectations and
verifying interactions in unit tests.")
    (license license:bsd-2)))

;;;
;;; ── 24. nvimpager ───────────────────────────────────────────────────
;;; Use Neovim as a pager
;;;
(define-public nvimpager
  (package
    (name "nvimpager")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lucc/nvimpager/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))
      #:tests? #f))
    (inputs (list bash))
    (home-page "https://github.com/lucc/nvimpager")
    (synopsis "use Neovim as a pager to view man pages and command output")
    (description
     "Nvimpager uses Neovim's built-in syntax highlighting to display files
and man pages in a terminal pager.  It can be used as a replacement for
@command{less} or @command{more} with full Neovim color support.")
    (license license:bsd-2)))

;;;
;;; ── 25. jome ────────────────────────────────────────────────────────
;;; Small emoji picker using Qt5
;;;
(define-public jome
  (package
    (name "jome")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/eepp/jome/releases/download/v"
             version "/jome-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5 qtsvg-5))
    (home-page "https://github.com/eepp/jome")
    (synopsis "small emoji picker application using Qt")
    (description
     "Jome is a lightweight emoji picker for Linux desktops.  It provides a
searchable grid of emoji that can be quickly inserted into any application
via clipboard or stdout.  Built with Qt for a native desktop experience.")
    (license license:gpl2+)))

;;;
;;; ── 26. croaring ────────────────────────────────────────────────────
;;; CRoaring: Roaring bitmaps in C (and C++)
;;;
(define-public croaring
  (package
    (name "croaring")
    (version "4.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RoaringBitmap/CRoaring/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release"
              "-DBUILD_SHARED_LIBS=ON"
              "-DROARING_BUILD_LTO=OFF")
      #:tests? #f))
    (home-page "https://roaringbitmap.org/")
    (synopsis "roaring bitmaps in C and C++ for compressed integer sets")
    (description
     "CRoaring is a C/C++ implementation of Roaring Bitmaps, a compressed
bitmap data structure for fast set operations on integer sets.  It is used
in databases, search engines, and other data-intensive applications for
efficient union, intersection, and membership tests.")
    (license (list license:asl2.0 license:expat))))

;;;
;;; ── 27. logiops-git ─────────────────────────────────────────────────
;;; Logitech device configuration daemon
;;;
(define-public logiops-git
  (package
    (name "logiops-git")
    (version "0.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PixlOne/logiops")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list eudev libconfig glib libevdev))
    (home-page "https://github.com/PixlOne/logiops")
    (synopsis "Logitech HID++ device configuration daemon")
    (description
     "LogiOps is an unofficial userspace driver and configuration daemon for
Logitech mice and keyboards that use the HID++ protocol.  It allows
customizing button actions, scroll behavior, DPI settings, and SmartShift
sensitivity through a simple configuration file.")
    (license license:gpl3+)))

;;;
;;; ── 28. duckduckgo-chat-cli ─────────────────────────────────────────
;;; CLI interface for DuckDuckGo AI chat
;;;
(define-public duckduckgo-chat-cli
  (package
    (name "duckduckgo-chat-cli")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/benoitpetit/duckduckgo-chat-cli"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ddg-chat.sh" "bin/ddg-chat"))))
    (inputs (list bash curl))
    (home-page "https://github.com/benoitpetit/duckduckgo-chat-cli")
    (synopsis "command-line interface for DuckDuckGo AI chat")
    (description
     "A simple shell script that provides command-line access to DuckDuckGo's
AI chat service.  It supports multiple AI models and allows interactive
conversations from the terminal.")
    (license license:expat)))

;;;
;;; ── 29. plymouth-theme-hexagon-alt-gruvbox ──────────────────────────
;;; Gruvbox-colored hexagon Plymouth boot theme
;;;
(define-public plymouth-theme-hexagon-alt-gruvbox
  (package
    (name "plymouth-theme-hexagon-alt-gruvbox")
    (version "0.0.0-1.a7c5f38")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/murkl/plymouth-theme-hexagon-alt")
             (commit "a7c5f38aa67c2c8b1e839c9e32b73d9fa5bce9de")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hexagon_alt_gruvbox"
                "share/plymouth/themes/hexagon_alt_gruvbox"))))
    (home-page "https://github.com/murkl/plymouth-theme-hexagon-alt")
    (synopsis "gruvbox-colored hexagonal Plymouth boot splash theme")
    (description
     "A Plymouth boot splash theme featuring animated hexagonal patterns in
the Gruvbox color palette.  It provides a modern, geometric animation during
system startup.")
    (license license:gpl3+)))

;;;
;;; ── 30. puddletag ───────────────────────────────────────────────────
;;; Audio file tag editor (like Mp3tag for Linux)
;;;
(define-public puddletag
  (package
    (name "puddletag")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/puddletag/puddletag/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python))
    (inputs (list python-pyqt))
    (propagated-inputs (list python-mutagen python-configobj))
    (home-page "https://docs.puddletag.net/")
    (synopsis "audio file tag editor for Linux similar to Mp3tag")
    (description
     "Puddletag is a feature-rich audio file tag editor for Linux, inspired
by Mp3tag for Windows.  It supports editing tags for MP3, Ogg Vorbis, FLAC,
MP4, WMA, and other audio formats.  Features include batch editing, tag
sources, scripting, and a spreadsheet-like interface.")
    (license license:gpl3+)))
