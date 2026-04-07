;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   themes, icons, cursors, fonts, plymouth themes, GRUB themes,
;;;   and miscellaneous utilities.

(define-module (gaurix packages recipe-resolver-260407f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages xorg)
  #:export (btop-theme-catppuccin
            catppuccin-konsole-theme-git
            fluent-icon-theme-git
            fluent-cursor-theme-git
            bettergruvbox-gtk-theme
            gruvbox-plus-icon-theme-git
            bibata-cursor-theme
            notwaita-cursor-theme
            plymouth-theme-ecorp-glitch
            plymouth-theme-arch-darwin
            plymouth-theme-psx
            plymouth-theme-pedro-raccoon
            plymouth-theme-arch-ascii
            plymouth-theme-monoarch-refined
            ttf-gabarito
            font-eb-garamond-gaurix
            ocr-fonts
            perl-date-simple
            morewaita-icon-theme
            sddm-silent-theme
            simplex-chat-bin
            simple2d
            distro-grub-themes-arch
            grub-theme-tela-color-1080p-git
            grub-theme-tela-color-2k-git
            grub-theme-tela-color-4k-git
            grub-theme-tela-color-ultrawide-git
            grub-theme-tela-color-ultrawide2k-git
            grub-theme-tela-white-1080p-git
            mint-l-theme))

;;;
;;; ── THEMES ─────────────────────────────────────────────────────────
;;;

;;; 1. btop-theme-catppuccin — Catppuccin theme for btop
(define-public btop-theme-catppuccin
  (package
    (name "btop-theme-catppuccin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/catppuccin/btop/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0j9sj3yi37f5irj5bgl8dcriyclv1saww9rkxn5s061mfsrzviw7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("themes/" "share/btop/themes/"))))
    (home-page "https://github.com/catppuccin/btop")
    (synopsis "soothing pastel Catppuccin theme for btop")
    (description
     "Catppuccin color schemes for the btop system monitor.  Includes four
flavor variants: Latte, Frappe, Macchiato, and Mocha.")
    (license license:expat)))

;;; 2. catppuccin-konsole-theme-git — Catppuccin theme for KDE Konsole
(define-public catppuccin-konsole-theme-git
  (let ((commit "3b64040e3f4ae5afb2347e7be8a38bc3cd8c73a8"))
    (package
      (name "catppuccin-konsole-theme-git")
      (version (string-append "0-0." (string-take commit 7)))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/catppuccin/konsole/archive/"
               commit ".tar.gz"))
         (sha256
          (base32 "1bk8v80ld66gss92wpw39f6xr5qx8n59rslkjacvvm6878vy1b75"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("themes/" "share/konsole/"))))
      (home-page "https://github.com/catppuccin/konsole")
      (synopsis "soothing pastel Catppuccin theme for Konsole")
      (description
       "Catppuccin color schemes for the KDE Konsole terminal emulator.
Includes four flavor variants: Latte, Frappe, Macchiato, and Mocha.")
      (license license:expat))))

;;; 3. bettergruvbox-gtk-theme — Gruvbox-inspired GTK theme
(define-public bettergruvbox-gtk-theme
  (package
    (name "bettergruvbox-gtk-theme")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/SafwanLjd/BetterGruvbox/-/archive/v"
             version "/BetterGruvbox-v" version ".tar.gz"))
       (sha256
        (base32 "10h951fzlsj29zlccm5hh2l12l1yz91cjyc9ihmljg8niwgvlm3b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gtk-2.0" "share/themes/BetterGruvbox/gtk-2.0")
          ("gtk-3.0" "share/themes/BetterGruvbox/gtk-3.0"))))
    (home-page "https://gitlab.com/SafwanLjd/BetterGruvbox")
    (synopsis "elegant dark Gruvbox GTK theme")
    (description
     "BetterGruvbox is a dark GTK theme inspired by the Gruvbox color
palette, based on the Klaus theme.  It supports GTK 2 and GTK 3
applications.")
    (license license:gpl3+)))

;;; 4. mint-l-theme — Linux Mint legacy themes
(define-public mint-l-theme
  (package
    (name "mint-l-theme")
    (version "2.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/linuxmint/mint-l-theme/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0liy7c24q42djn3qz91fc4msyqchgfg7zc6yp1md4kgasflm4cv4"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((themes-dir (string-append (assoc-ref outputs "out")
                                               "/share/themes")))
                (copy-recursively "usr/share/themes" themes-dir)))))))
    (native-inputs (list python))
    (home-page "https://github.com/linuxmint/mint-l-theme")
    (synopsis "Mint-L GTK theme for Linux Mint")
    (description
     "Mint-L is a legacy GTK theme for Linux Mint desktops.  It provides
light and dark variants with multiple accent color options for GTK 2,
GTK 3, and Cinnamon.")
    (license license:gpl3+)))

;;; 5. sddm-silent-theme — Highly customizable SDDM theme
(define-public sddm-silent-theme
  (package
    (name "sddm-silent-theme")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/uiriansan/SilentSDDM/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "14d9pvqc76hv5bax4lqh1k4rwcr645bl53dx0qwz41mddlrd1385"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/sddm/themes/silent/"
           #:exclude ("README.md" "LICENSE" ".gitignore")))))
    (home-page "https://github.com/uiriansan/SilentSDDM")
    (synopsis "highly customizable SDDM login theme")
    (description
     "SilentSDDM is a highly customizable theme for the SDDM display
manager.  It features 200+ configuration parameters and supports
Qt6, virtual keyboard, and multimedia backgrounds.")
    (license license:gpl3)))

;;;
;;; ── ICON THEMES ────────────────────────────────────────────────────
;;;

;;; 6. fluent-icon-theme-git — Fluent design icon theme
(define-public fluent-icon-theme-git
  (package
    (name "fluent-icon-theme-git")
    (version "2025-08-21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Fluent-icon-theme/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1qyvmsc34c08bbyjdkd8hwsgd6jlr7gv2bg1h9pnp29ci3ihacsm"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((dest (string-append (assoc-ref outputs "out")
                                         "/share/icons")))
                (setenv "HOME" (getcwd))
                (invoke "bash" "install.sh" "-d" dest "-a")))))))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "fluent design icon theme for Linux desktops")
    (description
     "Fluent icon theme is inspired by Microsoft's Fluent Design System.
It includes multiple color variants for folder icons and covers a
wide range of application icons.")
    (license license:gpl3)))

;;; 7. fluent-cursor-theme-git — Fluent cursor theme (pre-built)
(define-public fluent-cursor-theme-git
  (package
    (name "fluent-cursor-theme-git")
    (version "2025-08-21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Fluent-icon-theme/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1qyvmsc34c08bbyjdkd8hwsgd6jlr7gv2bg1h9pnp29ci3ihacsm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cursors/dist/" "share/icons/Fluent-cursors/cursors/")
          ("cursors/dist-dark/" "share/icons/Fluent-dark-cursors/cursors/"))))
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (synopsis "fluent design cursor theme for Linux desktops")
    (description
     "Fluent cursor theme is inspired by Qogir and based on capitaine-cursors.
It provides light and dark variants of X11 cursor icons with a modern
design.")
    (license license:gpl3)))

;;; 8. gruvbox-plus-icon-theme-git — Gruvbox Plus icon theme
(define-public gruvbox-plus-icon-theme-git
  (package
    (name "gruvbox-plus-icon-theme-git")
    (version "6.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SylEleuth/gruvbox-plus-icon-pack/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0plfxm5pq3hx6cfcw0qkwbk1y1c09j0gwqmzi5fs1svi0bnjnwmb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Gruvbox-Plus-Dark/" "share/icons/Gruvbox-Plus-Dark/"))))
    (home-page "https://github.com/SylEleuth/gruvbox-plus-icon-pack")
    (synopsis "icon theme based on the Gruvbox color palette")
    (description
     "Gruvbox Plus is an icon theme for Linux desktops using the Gruvbox color
palette.  It incorporates design elements from Suru++, OneDark, and
Papirus icon packs, and includes 24 folder color options.")
    (license license:gpl3)))

;;; 9. morewaita-icon-theme — Expanded Adwaita companion icon theme
(define-public morewaita-icon-theme
  (package
    (name "morewaita-icon-theme")
    (version "49")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/somepaulo/MoreWaita/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0j5vjvngcr3g4kz1lcmi4ni2vfarpbh0j6h78f5j4k91m730m81k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("scalable/" "share/icons/MoreWaita/scalable/")
          ("symbolic/" "share/icons/MoreWaita/symbolic/")
          ("index.theme" "share/icons/MoreWaita/index.theme"))))
    (home-page "https://github.com/somepaulo/MoreWaita")
    (synopsis "expanded Adwaita-styled companion icon theme")
    (description
     "MoreWaita is an icon theme that provides extra Adwaita-styled icons for
popular applications to complement GNOME Shell's default icon set.  It
supports 500+ applications.")
    (license license:gpl3)))

;;;
;;; ── CURSOR THEMES ──────────────────────────────────────────────────
;;;

;;; 10. bibata-cursor-theme — Material design cursor theme (pre-built)
(define-public bibata-cursor-theme
  (package
    (name "bibata-cursor-theme")
    (version "2.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ful1e5/Bibata_Cursor/releases/download/v"
             version "/Bibata-Modern-Classic.tar.xz"))
       (sha256
        (base32 "1n2nnniijv9hys7ag58lqxikp405545pdpkpbqpz1gjv9s39ad3x"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Bibata-Modern-Classic/"))))
    (home-page "https://github.com/ful1e5/Bibata_Cursor")
    (synopsis "material design cursor theme")
    (description
     "Bibata is an open source, compact, and material-designed cursor set.
This package installs the Modern Classic (black) variant.  The Bibata
family includes Modern and Original styles in Amber, Classic, and Ice
color options.")
    (license license:gpl3)))

;;; 11. notwaita-cursor-theme — Adwaita-inspired cursor theme (pre-built)
(define-public notwaita-cursor-theme
  (package
    (name "notwaita-cursor-theme")
    (version "1.0.0-alpha1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ful1e5/notwaita-cursor/releases/download/v"
             version "/Notwaita.tar.xz"))
       (sha256
        (base32 "1wkcsh1182krmpsq4vaw15cc85dfcyzvvkzgc7h63ap2cjf8v4lk"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Notwaita/"))))
    (home-page "https://github.com/ful1e5/notwaita-cursor")
    (synopsis "cursor theme inspired by GNOME Adwaita icons")
    (description
     "NotWaita is a cursor theme inspired by the Adwaita icons from the GNOME
project.  It supports HiDPI displays and provides multiple color variants
including standard, black, white, and gray.")
    (license license:lgpl3)))

;;;
;;; ── PLYMOUTH THEMES ────────────────────────────────────────────────
;;;

;;; 12. plymouth-theme-ecorp-glitch — E-Corp glitch Plymouth theme
(define-public plymouth-theme-ecorp-glitch
  (let ((commit "0bdfe0da437d6c001a31b280bc212b5c0dd3ef67"))
    (package
      (name "plymouth-theme-ecorp-glitch")
      (version (string-append "0-0." (string-take commit 7)))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/hrshbh/plymouth-themes/archive/"
               commit ".tar.gz"))
         (sha256
          (base32 "1x4bwiyf5nx4gxwac6jwrpy7f3dzpra2g38afkrcmja1jjcc39q2"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("ecorp-glitch/" "share/plymouth/themes/ecorp-glitch/"))))
      (home-page "https://github.com/hrshbh/plymouth-themes")
      (synopsis "E-Corp glitch animation Plymouth boot theme")
      (description
       "A Plymouth boot theme featuring the E-Corp glitch animation from
Mr. Robot.  Part of a collection of themed Plymouth boot screens.")
      (license license:gpl3))))

;;; 13. plymouth-theme-arch-darwin — macOS-style Arch Plymouth theme
(define-public plymouth-theme-arch-darwin
  (let ((commit "232c87ca5822a3fccc025510c1630e577ed0e0f6"))
    (package
      (name "plymouth-theme-arch-darwin")
      (version (string-append "0-0." (string-take commit 7)))
      (source
       (origin
         (method url-fetch)
         (uri (string-append
               "https://github.com/armoredvortex/plymouth-theme-arch-darwin/archive/"
               commit ".tar.gz"))
         (sha256
          (base32 "1rqwznwxf7k91cirh2hvlzq0z3qazr72dgb3ijxlrf6lx89bmzcj"))))
      (build-system copy-build-system)
      (arguments
       (list
        #:install-plan
        #~'(("arch-darwin.plymouth"
             "share/plymouth/themes/arch-darwin/arch-darwin.plymouth")
            ("assets/" "share/plymouth/themes/arch-darwin/assets/"))))
      (home-page "https://github.com/armoredvortex/plymouth-theme-arch-darwin")
      (synopsis "macOS-style Plymouth splash screen for Arch Linux")
      (description
       "A Plymouth boot theme providing a Darwin (macOS-inspired) splash screen
with Arch Linux branding.")
      (license license:expat))))

;;; 14. plymouth-theme-psx — PlayStation boot Plymouth theme
(define-public plymouth-theme-psx
  (package
    (name "plymouth-theme-psx")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nullgemm/plymouth_psx/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1raxr4magyc3smsg5fwfxcvg4amsych7zk438f4wkly97xfv858m"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/plymouth/themes/psx/"
           #:exclude ("LICENSE" "README.md" ".gitignore")))))
    (home-page "https://github.com/nullgemm/plymouth_psx")
    (synopsis "PlayStation boot simulation Plymouth theme")
    (description
     "A Plymouth boot theme that simulates the PlayStation (PSX) boot screen
animation.  Uses Plymouth's two-step module with animated PNG frames.")
    (license license:wtfpl2)))

;;; 15. plymouth-theme-pedro-raccoon — Pedro Raccoon Plymouth theme
(define-public plymouth-theme-pedro-raccoon
  (package
    (name "plymouth-theme-pedro-raccoon")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FilaCo/plymouth-theme-pedro-raccoon/releases/download/v"
             version "/pedro-raccoon.zip"))
       (sha256
        (base32 "1pky496f29a10919gx4kjhmg46nk9ndlgx1bysbp3h0an1mfkl42"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("." "share/plymouth/themes/pedro-raccoon/"
           #:exclude ("LICENSE" "README.md")))))
    (home-page "https://github.com/FilaCo/plymouth-theme-pedro-raccoon")
    (synopsis "Pedro raccoon Plymouth boot theme")
    (description
     "A simple Plymouth boot theme featuring the Pedro raccoon meme
animation.")
    (license license:expat)))

;;; 16. plymouth-theme-arch-ascii — ASCII art Arch Plymouth theme
(define-public plymouth-theme-arch-ascii
  (package
    (name "plymouth-theme-arch-ascii")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tn3w/plymouth-theme-arch-ascii/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0dddr964cq6lbblliagkfp52xdmxrw8a929kjcvagdsfhxkycidb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("arch-ascii-art.plymouth"
           "share/plymouth/themes/arch-ascii-art/arch-ascii-art.plymouth")
          ("arch-ascii-art.script"
           "share/plymouth/themes/arch-ascii-art/arch-ascii-art.script"))))
    (home-page "https://github.com/tn3w/plymouth-theme-arch-ascii")
    (synopsis "rainbow ASCII art Plymouth theme for Arch Linux")
    (description
     "A Plymouth boot theme featuring a centered rainbow-colored Arch Linux
ASCII art logo with password input functionality.  Designed for LUKS
encryption unlock screens.")
    (license license:expat)))

;;; 17. plymouth-theme-monoarch-refined — Refined Monoarch Plymouth theme
(define-public plymouth-theme-monoarch-refined
  (package
    (name "plymouth-theme-monoarch-refined")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/iam-vasanth/monoarch-refined/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1mdm697z1yssdslharw0q1291i2wsnnjy0f55y8i5106w7sgxya1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("monoarch-refined/" "share/plymouth/themes/monoarch-refined/"))))
    (home-page "https://github.com/iam-vasanth/monoarch-refined")
    (synopsis "refined monochrome Arch Linux Plymouth boot theme")
    (description
     "Monoarch Refined is a Plymouth boot theme with a centered layout and
clean password prompt.  It features a monochrome Arch aesthetic and
supports resolutions from 720p to 8K.")
    (license license:expat)))

;;;
;;; ── FONTS ──────────────────────────────────────────────────────────
;;;

;;; 18. ttf-gabarito — Gabarito geometric sans-serif font
(define-public ttf-gabarito
  (package
    (name "ttf-gabarito")
    (version "1.000")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/naipefoundry/gabarito/releases/download/v"
             version "/gabarito-fonts.zip"))
       (sha256
        (base32 "0bvqrxlh2dj8lgb6cb5ljjcm37la997l43h14930iwqa9di0gx11"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "geometric sans-serif typeface with six weights")
    (description
     "Gabarito is a geometric sans-serif typeface designed for a Brazilian
online learning platform.  It includes six weights from Regular to Black,
logic and set theory symbols, scientific notation, math operators, and
Roman numerals.  Available on Google Fonts.")
    (license license:silofl1.1)))

;;; 19. font-eb-garamond-gaurix — EB Garamond historical typeface
(define-public font-eb-garamond-gaurix
  (package
    (name "font-eb-garamond")
    (version "0.016-nightly")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/georgd/EB-Garamond/releases/download/nightly/EBGaramond.zip")
       (sha256
        (base32 "07s13ypxysimzfg5b9rkf1c6gk7l6w9zm1v3m9iyj2jp5zhqs3ph"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "https://github.com/georgd/EB-Garamond")
    (synopsis "digitization of Claude Garamont's humanist typeface")
    (description
     "EB Garamond is a revival of Claude Garamont's famous humanist typeface
from the mid-16th century, based on the Egenolff-Berner specimen of 1592.
It covers Latin, Greek, and Cyrillic scripts in regular, italic, bold,
and bold-italic styles.")
    (license license:silofl1.1)))

;;; 20. ocr-fonts — Free OCR-A and OCR-B fonts
(define-public ocr-fonts
  (package
    (name "ocr-fonts")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://tsukurimashou.org/files/ocr-" version ".zip"))
       (sha256
        (base32 "1gwr8ciahz3di6zl3vkh8l2sx2xrcyh9c2d2hg6262gfzp66y4sq"))))
    (build-system font-build-system)
    (native-inputs (list unzip))
    (home-page "https://tsukurimashou.org/ocr.php.en")
    (synopsis "free OCR-A and OCR-B fonts")
    (description
     "Free versions of the OCR-A and OCR-B fonts used for machine-readable text.
OCR-A is the font used on ISBNs; OCR-B is used for UPC/EAN barcode
human-readable digits.  Created from Metafont sources converted to
MetaType1 format.")
    (license license:public-domain)))

;;;
;;; ── GRUB THEMES ────────────────────────────────────────────────────
;;;

;;; Base source for all Tela GRUB themes
(define grub2-themes-source
  (origin
    (method url-fetch)
    (uri "https://github.com/vinceliuice/grub2-themes/archive/refs/tags/2025-07-23.tar.gz")
    (sha256
     (base32 "0abwss2ygvrf51p3sfrpz76l7qlfd0r12ng3zyblbngdr3yd043y"))))

;;; Helper to create a GRUB Tela theme variant
(define* (make-grub-tela-theme #:key variant-name theme icon-style resolution)
  (package
    (name variant-name)
    (version "2025-07-23")
    (source grub2-themes-source)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (tar (assoc-ref %build-inputs "tar"))
                 (gzip (assoc-ref %build-inputs "gzip"))
                 (out (assoc-ref %outputs "out"))
                 (theme-dir (string-append out "/share/grub/themes/"
                                           #$theme))
                 (icon-res (string-append #$resolution))
                 ;; For select assets, map resolution to nearest supported
                 (select-res (cond
                              ((member #$resolution '("ultrawide" "ultrawide2k"))
                               "2k")
                              (else #$resolution))))
            (setenv "PATH" (string-append tar "/bin:" gzip "/bin"))
            (invoke "tar" "xzf" source)
            (mkdir-p theme-dir)
            ;; Copy fonts
            (for-each
             (lambda (f)
               (copy-file f (string-append theme-dir "/" (basename f))))
             (find-files
              (string-append "grub2-themes-" #$version "/common") "\\.pf2$"))
            ;; Copy theme.txt config
            (copy-file
             (string-append "grub2-themes-" #$version
                            "/config/theme-" #$resolution ".txt")
             (string-append theme-dir "/theme.txt"))
            ;; Copy background
            (copy-file
             (string-append "grub2-themes-" #$version
                            "/backgrounds/" #$resolution
                            "/background-" #$theme ".jpg")
             (string-append theme-dir "/background.jpg"))
            ;; Copy icons
            (let ((icon-src (string-append "grub2-themes-" #$version
                                           "/assets/assets-" #$icon-style
                                           "/icons-" icon-res "/")))
              (when (file-exists? icon-src)
                (copy-recursively icon-src
                                  (string-append theme-dir "/icons/"))))
            ;; Copy select images
            (let ((sel-src (string-append "grub2-themes-" #$version
                                          "/assets/assets-select/select-"
                                          select-res "/")))
              (when (file-exists? sel-src)
                (for-each
                 (lambda (f)
                   (copy-file f (string-append theme-dir "/" (basename f))))
                 (find-files sel-src "\\.png$"))))
            ;; Copy info image if available
            (let ((info-file (string-append "grub2-themes-" #$version
                                            "/assets/info-" icon-res ".png")))
              (when (file-exists? info-file)
                (copy-file info-file
                           (string-append theme-dir "/info.png"))))))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/vinceliuice/grub2-themes")
    (synopsis (string-append "Tela GRUB theme (" icon-style ", " resolution ")"))
    (description
     (string-append "A modern GRUB2 boot theme from the Tela collection by "
                    "vinceliuice.  This variant uses " icon-style " icons at "
                    resolution " resolution."))
    (license license:gpl3)))

;;; 21-26. GRUB Tela theme variants
(define-public grub-theme-tela-color-1080p-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-color-1080p-git"
   #:theme "tela" #:icon-style "color" #:resolution "1080p"))

(define-public grub-theme-tela-color-2k-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-color-2k-git"
   #:theme "tela" #:icon-style "color" #:resolution "2k"))

(define-public grub-theme-tela-color-4k-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-color-4k-git"
   #:theme "tela" #:icon-style "color" #:resolution "4k"))

(define-public grub-theme-tela-color-ultrawide-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-color-ultrawide-git"
   #:theme "tela" #:icon-style "color" #:resolution "ultrawide"))

(define-public grub-theme-tela-color-ultrawide2k-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-color-ultrawide2k-git"
   #:theme "tela" #:icon-style "color" #:resolution "ultrawide2k"))

(define-public grub-theme-tela-white-1080p-git
  (make-grub-tela-theme
   #:variant-name "grub-theme-tela-white-1080p-git"
   #:theme "tela" #:icon-style "white" #:resolution "1080p"))

;;; 27. distro-grub-themes-arch — Arch Linux GRUB theme
(define-public distro-grub-themes-arch
  (package
    (name "distro-grub-themes-arch")
    (version "3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AdisonCavani/distro-grub-themes/releases/download/v"
             version "/arch-linux.tar"))
       (sha256
        (base32 "02w5mvzcq6x1d3hz6vxkdx0yybw7xfpg6b0l0divzmvcdnabp2g5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/grub/themes/arch-linux/"))))
    (home-page "https://github.com/AdisonCavani/distro-grub-themes")
    (synopsis "Arch Linux GRUB2 boot theme")
    (description
     "A GRUB2 theme with Arch Linux branding from the distro-grub-themes
collection.  Includes background, icons, and font assets for a polished
boot screen.")
    (license license:gpl3)))

;;;
;;; ── MISCELLANEOUS ──────────────────────────────────────────────────
;;;

;;; 28. perl-date-simple — Simple date object for Perl
(define-public perl-date-simple
  (package
    (name "perl-date-simple")
    (version "3.03")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://cpan/authors/id/I/IZ/IZUT/Date-Simple-"
             version ".tar.gz"))
       (sha256
        (base32 "016x17r9wi6ffdc4idwirzd1sxqcb4lmq5fn2aiq25nf2iir5899"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/Date-Simple")
    (synopsis "simple date object for Perl")
    (description
     "Date::Simple provides a simple date object for Perl.  It handles basic
date arithmetic, formatting, and parsing with a straightforward
object-oriented interface.")
    (license (list license:artistic2.0 license:gpl3+))))

;;; 29. simple2d — Simple 2D graphics library
(define-public simple2d
  (package
    (name "simple2d")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/simple2d/simple2d/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1ciagqd7qals7bdrvkgk9qsiw6f7a92c383kygc4dy442sg2zzkj"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs
     (list sdl2 sdl2-image sdl2-mixer sdl2-ttf
           mesa glew))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/simple2d/simple2d")
    (synopsis "simple 2D graphics library using SDL and OpenGL")
    (description
     "Simple 2D is a small library for creating 2D applications in C.
It provides a straightforward API for drawing shapes, sprites, and text
using SDL2 and OpenGL 3.3+.")
    (license license:expat)))

;;; 30. simplex-chat-bin — SimpleX Chat CLI (pre-built binary)
(define-public simplex-chat-bin
  (package
    (name "simplex-chat-bin")
    (version "6.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/simplex-chat/simplex-chat/releases/download/v"
             version "/simplex-chat-ubuntu-24_04-x86_64"))
       (sha256
        (base32 "1h5pxlpha5g9qk1rny28lnwc7s750a60253zppildkvy52lizzs8"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (patchelf (string-append
                            (assoc-ref %build-inputs "patchelf") "/bin/patchelf"))
                 (glibc (assoc-ref %build-inputs "glibc"))
                 (ld-so (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                 (out (assoc-ref %outputs "out"))
                 (bin-dir (string-append out "/bin"))
                 (bin (string-append bin-dir "/simplex-chat")))
            (mkdir-p bin-dir)
            (copy-file source bin)
            (chmod bin #o755)
            (invoke patchelf "--set-interpreter" ld-so bin)))))
    (native-inputs (list patchelf))
    (inputs (list glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://simplex.chat")
    (synopsis "private-by-design chat platform CLI")
    (description
     "SimpleX Chat is a messaging platform focused on privacy, using
the SimpleX messaging protocol which does not use user identifiers.
This package provides the pre-built command-line interface.")
    (license license:agpl3+)))
