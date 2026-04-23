;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423i
;;; Resolves 100 TODO/NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (100):
;;;        1.  cyrus-imapd-docs (gnu-build-system, v3.12.2, BSD-Attribution-HPND-disclaimer)
;;;        2.  otf-gfs (font-build-system, v20250820, custom)
;;;        3.  ttf-oxygen (cmake-build-system, v5.4.3, custom:GPL+FE)
;;;        4.  gtk-arc-flatabulous-theme-git (gnu-build-system, vr905.6658eac, GPL3)
;;;        5.  libvterm-bzr (gnu-build-system, vr755, MIT)
;;;        6.  underscorejs (gnu-build-system, v1.13.7, MIT)
;;;        7.  s (go-build-system, v0.7.5, MIT)
;;;        8.  ldraw-parts-library (gnu-build-system, v20250401, CCPL: cc-by-2.0)
;;;        9.  hunspell-ca (gnu-build-system, v3.0.9, GPL2)
;;;       10.  bdf-tamzen-font-git (gnu-build-system, v1.11.6.r1.3255e82, custom)
;;;       11.  otb-tamzen-font-git (gnu-build-system, v1.11.6.r1.3255e82, custom)
;;;       12.  pcf-tamzen-font-git (gnu-build-system, v1.11.6.r1.3255e82, custom)
;;;       13.  psf-tamzen-font-git (gnu-build-system, v1.11.6.r1.3255e82, custom)
;;;       14.  ttf-tamzen-font-git (font-build-system, v1.11.6.r1.3255e82, custom)
;;;       15.  xlhtml (gnu-build-system, v0.5.1, GPL)
;;;       16.  hunspell-pt_pt (gnu-build-system, v20251001, GPL)
;;;       17.  kicad-library-sparkfun-git (cmake-build-system, vV_0.5.r31.ge23396a, CC-BY-SA 4.0)
;;;       18.  daa2iso (gnu-build-system, v0.1.7e, GPL)
;;;       19.  freefonts (gnu-build-system, v0.10, custom)
;;;       20.  flatwoken-icons-git (gnu-build-system, vr669.aa7b4a4, CCPL:by-sa-4.0)
;;;       21.  libopenmpt-doc-svn (gnu-build-system, v0.7.r16685, BSD)
;;;       22.  openrc-arch-services-git (gnu-build-system, vr29.2a1af95, GPL-2.0-only)
;;;       23.  plata-theme (gnu-build-system, v0.9.9, CCPL)
;;;       24.  evopop-icon-theme (gnu-build-system, v0.11, CC-BY-4.0)
;;;       25.  voikko-fi (pyproject-build-system, v2.5, GPL2)
;;;       26.  afio (gnu-build-system, v2.5.2, custom)
;;;       27.  ttf-weather-icons (font-build-system, v2.0.12, custom:"OFL")
;;;       28.  libcrossguid-git (cmake-build-system, v0.2.2.r52.gca1bf4b, MIT)
;;;       29.  libxkbcommon-doc-git (meson-build-system, v1.4.1_r2102.g57af9cb, custom)
;;;       30.  mythes-pt-br (gnu-build-system, v20100528, unknown)
;;;       31.  sutils-git (gnu-build-system, v35, custom:UNLICENSE)
;;;       32.  ttf-nanumgothic_coding (font-build-system, v2.5, custom:OFL)
;;;       33.  paxctl (gnu-build-system, v0.9, GPL)
;;;       34.  freeipa-client-common (pyproject-build-system, v4.13.1, GPL-3.0-only)
;;;       35.  facetimehd-firmware (gnu-build-system, v1.43_5, LicenseRef-Apple)
;;;       36.  urbanlifestyle-sddm-theme (gnu-build-system, v0.4.4, GPL3)
;;;       37.  ttf2eot (gnu-build-system, v0.0.3, GPL)
;;;       38.  scsiadd (gnu-build-system, v1.97, GPL2)
;;;       39.  keyfuzz (gnu-build-system, v0.2, GPL2)
;;;       40.  blokator (cargo-build-system, v0.5.3, GPL3)
;;;       41.  caffe-doc-git (pyproject-build-system, v1.0.r136.g9b8915401, BSD-2-Clause)
;;;       42.  gnome-shell-extension-coverflow-alt-tab (gnu-build-system, v83, GPL)
;;;       43.  lubuntu-artwork (gnu-build-system, v25.10.3, GPL)
;;;       44.  meanwhile-docs (gnu-build-system, v1.1.1, LGPL3)
;;;       45.  otf-inconsolata-powerline-git (font-build-system, vr202.e80e3eb, OFL)
;;;       46.  srb2-data (gnu-build-system, v2.2.15, custom)
;;;       47.  torch7-cwrap-git (gnu-build-system, vr35.dbd0a62, custom)
;;;       48.  nordic-theme-git (gnu-build-system, v2.2.0.r52.g75dd1fc, GPL)
;;;       49.  gobi-loader (gnu-build-system, v0.7, GPL2)
;;;       50.  hstr-git (gnu-build-system, v2.3.r3.g6507ac7, Apache)
;;;       51.  obsetlayout (gnu-build-system, v1.0, unknown)
;;;       52.  stardict-en-cz (gnu-build-system, v20210401, FDL)
;;;       53.  tcc-git (gnu-build-system, v0.9.27.r797.g4e0e9b8, LGPL2.1)
;;;       54.  ttf-beteckna (font-build-system, v0.5, GPL-3.0-or-later WITH Font-exception-2.0)
;;;       55.  ttf-mikachan (font-build-system, v9.1, custom)
;;;       56.  bbswitch-git (gnu-build-system, vv0.8, GPL)
;;;       57.  rainbarf-git (gnu-build-system, v20140404, GPL)
;;;       58.  portmaster-legacy-bin (copy-build-system, v1.0.0, AGPL3)
;;;       59.  nordic-standard-buttons-theme (gnu-build-system, v2.2.0, GPL3)
;;;       60.  nordic-polar-standard-buttons-theme (gnu-build-system, v2.2.0, GPL3)
;;;       61.  nordic-darker-theme (gnu-build-system, v2.2.0, GPL3)
;;;       62.  nordic-bluish-accent-theme (gnu-build-system, v2.2.0, GPL3)
;;;       63.  nordic-bluish-accent-standard-buttons-theme (gnu-build-system, v2.2.0, GPL3)
;;;       64.  cppreference-qt (gnu-build-system, v20250209, CCPL:cc-by-sa)
;;;       65.  arc (gnu-build-system, v5.21q, GPL)
;;;       66.  gstreamer-docs-git (cargo-build-system, v1.24.0.r37.g95bafc4934, BSD-2-Clause OR MIT OR LGPL-2.1-or-later)
;;;       67.  gtk-theme-windows10 (gnu-build-system, v3.2.1, GPL)
;;;       68.  quartus-free-devinfo-arria_lite (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       69.  quartus-free-devinfo-cyclone (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       70.  quartus-free-devinfo-cyclone10lp (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       71.  quartus-free-devinfo-cyclonev (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       72.  quartus-free-devinfo-max (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       73.  quartus-free-devinfo-max10 (gnu-build-system, v25.1.0.1129, LicenseRef-QuartusPrime)
;;;       74.  ttf-mononoki-git (font-build-system, vr108.2e74b72, custom:OFL)
;;;       75.  nordic-theme (gnu-build-system, v2.2.0, GPL3)
;;;       76.  orchis-theme-git (gnu-build-system, v2025.04.25.r0.g5b73376, GPL-3.0-or-later)
;;;       77.  orchis-nord-theme-git (gnu-build-system, v2025.04.25.r0.g5b73376, GPL-3.0-or-later)
;;;       78.  orchis-dracula-theme-git (gnu-build-system, v2025.04.25.r0.g5b73376, GPL-3.0-or-later)
;;;       79.  open-dyslexic-fonts (font-build-system, v0.91.12, OFL-1.1-RFN)
;;;       80.  adapta-backgrounds (meson-build-system, v0.5.3.1, CCPL)
;;;       81.  nvidia-sdk (gnu-build-system, v13.0.19, LicenseRef-custom)
;;;       82.  nvidia-sdk-doc (gnu-build-system, v13.0.19, LicenseRef-custom)
;;;       83.  ttf-essays (font-build-system, v2.100, LGPL)
;;;       84.  ttf-humor-sans (font-build-system, v1.0, custom)
;;;       85.  numix-gtk-theme (gnu-build-system, v2.6.7, GPL3)
;;;       86.  lscolors-git (gnu-build-system, vr259.03e66df, PerlArtistic)
;;;       87.  nerd-fonts-git (gnu-build-system, v3.0.0.r30.g58504d670, MIT)
;;;       88.  amd-zen-ucode-platomav (gnu-build-system, vr348, custom)
;;;       89.  aur-out-of-date (go-build-system, v3.2.0, GPL-3.0-only)
;;;       90.  dict-freedict-eng-deu (gnu-build-system, v1.9_fd1, AGPL3)
;;;       91.  xinput_calibrator (gnu-build-system, v0.7.5, MIT)
;;;       92.  tmux-mem-cpu-load-git (cmake-build-system, v3.7.0.r29.gdf71d21, Apache-2.0)
;;;       93.  terminus-font-ll2-td1 (pyproject-build-system, v4.49.1, custom:OFL)
;;;       94.  xmlindent (gnu-build-system, v0.2.17, GPL)
;;;       95.  kbdlight (gnu-build-system, v1.3, BSD)
;;;       96.  leiningen-completions (gnu-build-system, v2.10.0, EPL)
;;;       97.  numix-themes-darkblue (gnu-build-system, v2.6.7, GPL3)
;;;       98.  xi-core-git (cargo-build-system, vr314.72295fa, Apache)
;;;       99.  rcm (gnu-build-system, v1.3.6, BSD)
;;;      100.  pvs-studio (gnu-build-system, v7.41.103683.741, custom:pvs-studio)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            cyrus-imapd-docs
            otf-gfs
            ttf-oxygen
            gtk-arc-flatabulous-theme-git
            libvterm-bzr
            underscorejs
            s
            ldraw-parts-library
            hunspell-ca
            bdf-tamzen-font-git
            otb-tamzen-font-git
            pcf-tamzen-font-git
            psf-tamzen-font-git
            ttf-tamzen-font-git
            xlhtml
            hunspell-pt-pt
            kicad-library-sparkfun-git
            daa2iso
            freefonts
            flatwoken-icons-git
            libopenmpt-doc-svn
            openrc-arch-services-git
            plata-theme
            evopop-icon-theme
            voikko-fi
            afio
            ttf-weather-icons
            libcrossguid-git
            libxkbcommon-doc-git
            mythes-pt-br
            sutils-git
            ttf-nanumgothic-coding
            paxctl
            freeipa-client-common
            facetimehd-firmware
            urbanlifestyle-sddm-theme
            ttf2eot
            scsiadd
            keyfuzz
            blokator
            caffe-doc-git
            gnome-shell-extension-coverflow-alt-tab
            lubuntu-artwork
            meanwhile-docs
            otf-inconsolata-powerline-git
            srb2-data
            torch7-cwrap-git
            nordic-theme-git
            gobi-loader
            hstr-git
            obsetlayout
            stardict-en-cz
            tcc-git
            ttf-beteckna
            ttf-mikachan
            bbswitch-git
            rainbarf-git
            portmaster-legacy-bin
            nordic-standard-buttons-theme
            nordic-polar-standard-buttons-theme
            nordic-darker-theme
            nordic-bluish-accent-theme
            nordic-bluish-accent-standard-buttons-theme
            cppreference-qt
            arc
            gstreamer-docs-git
            gtk-theme-windows10
            quartus-free-devinfo-arria-lite
            quartus-free-devinfo-cyclone
            quartus-free-devinfo-cyclone10lp
            quartus-free-devinfo-cyclonev
            quartus-free-devinfo-max
            quartus-free-devinfo-max10
            ttf-mononoki-git
            nordic-theme
            orchis-theme-git
            orchis-nord-theme-git
            orchis-dracula-theme-git
            open-dyslexic-fonts
            adapta-backgrounds
            nvidia-sdk
            nvidia-sdk-doc
            ttf-essays
            ttf-humor-sans
            numix-gtk-theme
            lscolors-git
            nerd-fonts-git
            amd-zen-ucode-platomav
            aur-out-of-date
            dict-freedict-eng-deu
            xinput-calibrator
            tmux-mem-cpu-load-git
            terminus-font-ll2-td1
            xmlindent
            kbdlight
            leiningen-completions
            numix-themes-darkblue
            xi-core-git
            rcm
            pvs-studio
            ))

;;; -------------------------------------------------------------------
;;; 1. cyrus-imapd-docs --- documentation for the Cyrus IMAP server
;;; -------------------------------------------------------------------
(define-public cyrus-imapd-docs
  (package
    (name "cyrus-imapd-docs")
    (version "3.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.cyrusimap.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the Cyrus IMAP server")
    (description "Documentation for the Cyrus IMAP server.")
    (home-page "https://www.cyrusimap.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2. otf-gfs --- selection of open type fonts from the Greek Font Society
;;; -------------------------------------------------------------------
(define-public otf-gfs
  (package
    (name "otf-gfs")
    (version "20250820")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.greekfontsociety-gfs.gr/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "selection of open type fonts from the Greek Font Society")
    (description "Selection of open type fonts from the Greek Font Society.")
    (home-page "http://www.greekfontsociety-gfs.gr")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 3. ttf-oxygen --- a desktop/gui font family for integrated use with the KDE desktop
;;; -------------------------------------------------------------------
(define-public ttf-oxygen
  (package
    (name "ttf-oxygen")
    (version "5.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://projects.kde.org/projects/kde/workspace/oxygen-fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a desktop/gui font family for integrated use with the KDE desktop")
    (description "A desktop/gui font family for integrated use with the KDE desktop.")
    (home-page "https://projects.kde.org/projects/kde/workspace/oxygen-fonts")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 4. gtk-arc-flatabulous-theme-git --- arc theme with Flatabulous window controls
;;; -------------------------------------------------------------------
(define-public gtk-arc-flatabulous-theme-git
  (package
    (name "gtk-arc-flatabulous-theme-git")
    (version "r905.6658eac")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andreisergiu98/arc-flatabulous-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arc theme with Flatabulous window controls")
    (description "Arc theme with Flatabulous window controls.")
    (home-page "https://github.com/andreisergiu98/arc-flatabulous-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. libvterm-bzr --- abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator
;;; -------------------------------------------------------------------
(define-public libvterm-bzr
  (package
    (name "libvterm-bzr")
    (version "r755")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.leonerd.org.uk/code/libvterm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator")
    (description "Abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator.")
    (home-page "http://www.leonerd.org.uk/code/libvterm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. underscorejs --- underscore is a utility-belt library for JavaScript that provides a lot o...
;;; -------------------------------------------------------------------
(define-public underscorejs
  (package
    (name "underscorejs")
    (version "1.13.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://underscorejs.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "underscore is a utility-belt library for JavaScript that provides a lot o...")
    (description "Underscore is a utility-belt library for JavaScript that provides a lot of the functional programming support that you would expect in Prototype.js (or Ruby), but without extending any of the built-in JavaScript objects.")
    (home-page "https://underscorejs.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. s --- web search from the terminal. Supports over 50 providers including google...
;;; -------------------------------------------------------------------
(define-public s
  (package
    (name "s")
    (version "0.7.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/s")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/zquestz/s"
      #:tests? #f))
    (synopsis "web search from the terminal. Supports over 50 providers including google...")
    (description "Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow.")
    (home-page "https://github.com/zquestz/s")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. ldraw-parts-library --- a collection of LDraw-format CAD files representing many of LEGO bricks p...
;;; -------------------------------------------------------------------
(define-public ldraw-parts-library
  (package
    (name "ldraw-parts-library")
    (version "20250401")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://library.ldraw.org/updates/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of LDraw-format CAD files representing many of LEGO bricks p...")
    (description "A collection of LDraw-format CAD files representing many of LEGO bricks produced.")
    (home-page "https://library.ldraw.org/updates")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 9. hunspell-ca --- catalan hunspell dictionaries. Includes Valencian ca_ES-valencia
;;; -------------------------------------------------------------------
(define-public hunspell-ca
  (package
    (name "hunspell-ca")
    (version "3.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.softcatala.org/corrector/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "catalan hunspell dictionaries. Includes Valencian ca_ES-valencia")
    (description "Catalan hunspell dictionaries. Includes Valencian ca_ES-valencia.")
    (home-page "http://www.softcatala.org/corrector")
    (license (list license:gpl2 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 10. bdf-tamzen-font-git --- monospaced bitmap font for console and X11 (tamsyn-font fork)(BDF font)
;;; -------------------------------------------------------------------
(define-public bdf-tamzen-font-git
  (package
    (name "bdf-tamzen-font-git")
    (version "1.11.6.r1.3255e82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunaku/tamzen-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monospaced bitmap font for console and X11 (tamsyn-font fork)(BDF font)")
    (description "Monospaced bitmap font for console and X11 (tamsyn-font fork)(BDF font).")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11. otb-tamzen-font-git --- monospaced bitmap font for console and X11 (tamsyn-font fork)(OTB font)
;;; -------------------------------------------------------------------
(define-public otb-tamzen-font-git
  (package
    (name "otb-tamzen-font-git")
    (version "1.11.6.r1.3255e82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunaku/tamzen-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monospaced bitmap font for console and X11 (tamsyn-font fork)(OTB font)")
    (description "Monospaced bitmap font for console and X11 (tamsyn-font fork)(OTB font).")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12. pcf-tamzen-font-git --- monospaced bitmap font for console and X11 (tamsyn-font fork)(PCF font)
;;; -------------------------------------------------------------------
(define-public pcf-tamzen-font-git
  (package
    (name "pcf-tamzen-font-git")
    (version "1.11.6.r1.3255e82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunaku/tamzen-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monospaced bitmap font for console and X11 (tamsyn-font fork)(PCF font)")
    (description "Monospaced bitmap font for console and X11 (tamsyn-font fork)(PCF font).")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 13. psf-tamzen-font-git --- monospaced bitmap font for console and X11 (tamsyn-font fork)(PSF font)
;;; -------------------------------------------------------------------
(define-public psf-tamzen-font-git
  (package
    (name "psf-tamzen-font-git")
    (version "1.11.6.r1.3255e82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunaku/tamzen-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monospaced bitmap font for console and X11 (tamsyn-font fork)(PSF font)")
    (description "Monospaced bitmap font for console and X11 (tamsyn-font fork)(PSF font).")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14. ttf-tamzen-font-git --- monospaced bitmap font for console and X11 (tamsyn-font fork)(TTF font)
;;; -------------------------------------------------------------------
(define-public ttf-tamzen-font-git
  (package
    (name "ttf-tamzen-font-git")
    (version "1.11.6.r1.3255e82")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sunaku/tamzen-font")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospaced bitmap font for console and X11 (tamsyn-font fork)(TTF font)")
    (description "Monospaced bitmap font for console and X11 (tamsyn-font fork)(TTF font).")
    (home-page "https://github.com/sunaku/tamzen-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15. xlhtml --- an Excel spreadsheet (.xls) and PowerPoint (.ppt) to HTML converter
;;; -------------------------------------------------------------------
(define-public xlhtml
  (package
    (name "xlhtml")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://chicago.sourceforge.net/xlhtml//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Excel spreadsheet (.xls) and PowerPoint (.ppt) to HTML converter")
    (description "An Excel spreadsheet (.xls) and PowerPoint (.ppt) to HTML converter.")
    (home-page "http://chicago.sourceforge.net/xlhtml/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. hunspell-pt_pt --- portuguese (European, post-orthographic agreement) hunspell dictionaries
;;; -------------------------------------------------------------------
(define-public hunspell-pt-pt
  (package
    (name "hunspell-pt-pt")
    (version "20251001")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese (European, post-orthographic agreement) hunspell dictionaries")
    (description "Portuguese (European, post-orthographic agreement) hunspell dictionaries.")
    (home-page "https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/")
    (license (list license:gpl3+ license:lgpl3+ license:mpl2.0))))

;;; -------------------------------------------------------------------
;;; 17. kicad-library-sparkfun-git --- sparkFun's KiCad Libraries
;;; -------------------------------------------------------------------
(define-public kicad-library-sparkfun-git
  (package
    (name "kicad-library-sparkfun-git")
    (version "V_0.5.r31.ge23396a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sparkfun/SparkFun-KiCad-Libraries")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sparkFun's KiCad Libraries")
    (description "SparkFun's KiCad Libraries.")
    (home-page "https://github.com/sparkfun/SparkFun-KiCad-Libraries")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 18. daa2iso --- converts DAA files (used by PowerISO) to ISO
;;; -------------------------------------------------------------------
(define-public daa2iso
  (package
    (name "daa2iso")
    (version "0.1.7e")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aluigi.altervista.org/mytoolz.htm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converts DAA files (used by PowerISO) to ISO")
    (description "Converts DAA files (used by PowerISO) to ISO.")
    (home-page "http://aluigi.altervista.org/mytoolz.htm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. freefonts --- a set of free Type1 fonts
;;; -------------------------------------------------------------------
(define-public freefonts
  (package
    (name "freefonts")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.gimp.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of free Type1 fonts")
    (description "A set of free Type1 fonts.")
    (home-page "http://www.gimp.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 20. flatwoken-icons-git --- flat, long-shadow icon themes derived from the AwOken Token-style iconset
;;; -------------------------------------------------------------------
(define-public flatwoken-icons-git
  (package
    (name "flatwoken-icons-git")
    (version "r669.aa7b4a4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alecive/FlatWoken")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flat, long-shadow icon themes derived from the AwOken Token-style iconset")
    (description "Flat, long-shadow icon themes derived from the AwOken Token-style iconset.")
    (home-page "https://github.com/alecive/FlatWoken")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 21. libopenmpt-doc-svn --- library to decode tracked music files (modules) into a raw PCM audio stre...
;;; -------------------------------------------------------------------
(define-public libopenmpt-doc-svn
  (package
    (name "libopenmpt-doc-svn")
    (version "0.7.r16685")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lib.openmpt.org/libopenmpt//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to decode tracked music files (modules) into a raw PCM audio stre...")
    (description "Library to decode tracked music files (modules) into a raw PCM audio stream (documentation) (svn version).")
    (home-page "https://lib.openmpt.org/libopenmpt/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 22. openrc-arch-services-git --- arch Linux service scripts for openrc
;;; -------------------------------------------------------------------
(define-public openrc-arch-services-git
  (package
    (name "openrc-arch-services-git")
    (version "r29.2a1af95")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/andrewgregory/openrc-arch-services")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arch Linux service scripts for openrc")
    (description "Arch Linux service scripts for openrc.")
    (home-page "https://github.com/andrewgregory/openrc-arch-services")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 23. plata-theme --- a Gtk+ theme based on Material Design Refresh
;;; -------------------------------------------------------------------
(define-public plata-theme
  (package
    (name "plata-theme")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/tista500/plata-theme/-/archive/v" version "/plata-theme-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Gtk+ theme based on Material Design Refresh")
    (description "A Gtk+ theme based on Material Design Refresh.")
    (home-page "https://gitlab.com/tista500/plata-theme")
    (license (list license:non-copyleft license:gpl2))))

;;; -------------------------------------------------------------------
;;; 24. evopop-icon-theme --- icon theme from Solus OS and Budgie Desktop
;;; -------------------------------------------------------------------
(define-public evopop-icon-theme
  (package
    (name "evopop-icon-theme")
    (version "0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/solus-cold-storage/evopop-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "icon theme from Solus OS and Budgie Desktop")
    (description "Icon theme from Solus OS and Budgie Desktop.")
    (home-page "https://github.com/solus-cold-storage/evopop-icon-theme")
    (license license:cc-by4.0)))

;;; -------------------------------------------------------------------
;;; 25. voikko-fi --- finnish dictionary for libvoikko based spell checkers
;;; -------------------------------------------------------------------
(define-public voikko-fi
  (package
    (name "voikko-fi")
    (version "2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://voikko.puimula.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "finnish dictionary for libvoikko based spell checkers")
    (description "Finnish dictionary for libvoikko based spell checkers.")
    (home-page "http://voikko.puimula.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. afio --- archiver & backup program with builtin compression
;;; -------------------------------------------------------------------
(define-public afio
  (package
    (name "afio")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://members.chello.nl/~k.holtman/afio.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "archiver & backup program with builtin compression")
    (description "Archiver & backup program with builtin compression.")
    (home-page "http://members.chello.nl/~k.holtman/afio.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 27. ttf-weather-icons --- icon font with 222 weather themed icons
;;; -------------------------------------------------------------------
(define-public ttf-weather-icons
  (package
    (name "ttf-weather-icons")
    (version "2.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://erikflowers.github.io/weather-icons//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "icon font with 222 weather themed icons")
    (description "Icon font with 222 weather themed icons.")
    (home-page "https://erikflowers.github.io/weather-icons/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 28. libcrossguid-git --- lightweight cross platform C++ GUID/UUID library
;;; -------------------------------------------------------------------
(define-public libcrossguid-git
  (package
    (name "libcrossguid-git")
    (version "0.2.2.r52.gca1bf4b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graeme-hill/crossguid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight cross platform C++ GUID/UUID library")
    (description "Lightweight cross platform C++ GUID/UUID library.")
    (home-page "https://github.com/graeme-hill/crossguid")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. libxkbcommon-doc-git --- API documentation for libxkbcommon
;;; -------------------------------------------------------------------
(define-public libxkbcommon-doc-git
  (package
    (name "libxkbcommon-doc-git")
    (version "1.4.1_r2102.g57af9cb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://xkbcommon.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "API documentation for libxkbcommon")
    (description "API documentation for libxkbcommon.")
    (home-page "https://xkbcommon.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 30. mythes-pt-br --- portuguese (Brazil) thesaurus
;;; -------------------------------------------------------------------
(define-public mythes-pt-br
  (package
    (name "mythes-pt-br")
    (version "20100528")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://extensions.services.openoffice.org/en/node/6213/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese (Brazil) thesaurus")
    (description "Portuguese (Brazil) thesaurus.")
    (home-page "http://extensions.services.openoffice.org/en/node/6213")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 31. sutils-git --- small command-line utilities
;;; -------------------------------------------------------------------
(define-public sutils-git
  (package
    (name "sutils-git")
    (version "35")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/baskerville/sutils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small command-line utilities")
    (description "Small command-line utilities.")
    (home-page "https://github.com/baskerville/sutils")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 32. ttf-nanumgothic_coding --- nanum series fixed width TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-nanumgothic-coding
  (package
    (name "ttf-nanumgothic-coding")
    (version "2.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/naver/nanumfont")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "nanum series fixed width TrueType fonts")
    (description "Nanum series fixed width TrueType fonts.")
    (home-page "https://github.com/naver/nanumfont")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 33. paxctl --- manages various PaX related program header flags for Elf32, Elf64, binaries
;;; -------------------------------------------------------------------
(define-public paxctl
  (package
    (name "paxctl")
    (version "0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://pax.grsecurity.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manages various PaX related program header flags for Elf32, Elf64, binaries")
    (description "Manages various PaX related program header flags for Elf32, Elf64, binaries.")
    (home-page "http://pax.grsecurity.net")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. freeipa-client-common --- common files used by IPA client
;;; -------------------------------------------------------------------
(define-public freeipa-client-common
  (package
    (name "freeipa-client-common")
    (version "4.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.freeipa.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "common files used by IPA client")
    (description "Common files used by IPA client.")
    (home-page "http://www.freeipa.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 35. facetimehd-firmware --- firmware for the FacetimeHD (Broadcom 1570) PCIe webcam
;;; -------------------------------------------------------------------
(define-public facetimehd-firmware
  (package
    (name "facetimehd-firmware")
    (version "1.43_5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/facetimehd-firmware")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for the FacetimeHD (Broadcom 1570) PCIe webcam")
    (description "Firmware for the FacetimeHD (Broadcom 1570) PCIe webcam.")
    (home-page "None")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 36. urbanlifestyle-sddm-theme --- a simple and colorful SDDM theme
;;; -------------------------------------------------------------------
(define-public urbanlifestyle-sddm-theme
  (package
    (name "urbanlifestyle-sddm-theme")
    (version "0.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple and colorful SDDM theme")
    (description "A simple and colorful SDDM theme.")
    (home-page "https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 37. ttf2eot --- utility to convert TTF files to EOT
;;; -------------------------------------------------------------------
(define-public ttf2eot
  (package
    (name "ttf2eot")
    (version "0.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wget/ttf2eot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to convert TTF files to EOT")
    (description "Utility to convert TTF files to EOT.")
    (home-page "https://github.com/wget/ttf2eot")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 38. scsiadd --- command-line tool for hot add and hot remove SCSI devices from your Linux
;;; -------------------------------------------------------------------
(define-public scsiadd
  (package
    (name "scsiadd")
    (version "1.97")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://llg.cubic.org/tools//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool for hot add and hot remove SCSI devices from your Linux")
    (description "Command-line tool for hot add and hot remove SCSI devices from your Linux.")
    (home-page "http://llg.cubic.org/tools/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 39. keyfuzz --- a Utility for manipulating the scancode/keycode translation tables of key...
;;; -------------------------------------------------------------------
(define-public keyfuzz
  (package
    (name "keyfuzz")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://0pointer.de/lennart/projects/keyfuzz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Utility for manipulating the scancode/keycode translation tables of key...")
    (description "A Utility for manipulating the scancode/keycode translation tables of keyboard drivers.")
    (home-page "http://0pointer.de/lennart/projects/keyfuzz")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 40. blokator --- simple system-wide adblocker
;;; -------------------------------------------------------------------
(define-public blokator
  (package
    (name "blokator")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/Tomkoid/blokator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple system-wide adblocker")
    (description "Simple system-wide adblocker.")
    (home-page "https://codeberg.org/Tomkoid/blokator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 41. caffe-doc-git --- a deep learning framework made with expression, speed, and modularity in ...
;;; -------------------------------------------------------------------
(define-public caffe-doc-git
  (package
    (name "caffe-doc-git")
    (version "1.0.r136.g9b8915401")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://caffe.berkeleyvision.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a deep learning framework made with expression, speed, and modularity in ...")
    (description "A deep learning framework made with expression, speed, and modularity in mind (cpu only, documentation, git version).")
    (home-page "https://caffe.berkeleyvision.org/")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 42. gnome-shell-extension-coverflow-alt-tab --- replacement of Alt-Tab, iterates through windows in a cover-flow manner
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-coverflow-alt-tab
  (package
    (name "gnome-shell-extension-coverflow-alt-tab")
    (version "83")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dsheeler/CoverflowAltTab")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "replacement of Alt-Tab, iterates through windows in a cover-flow manner")
    (description "Replacement of Alt-Tab, iterates through windows in a cover-flow manner.")
    (home-page "https://github.com/dsheeler/CoverflowAltTab")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 43. lubuntu-artwork --- artwork of Lubuntu
;;; -------------------------------------------------------------------
(define-public lubuntu-artwork
  (package
    (name "lubuntu-artwork")
    (version "25.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://wiki.ubuntu.com/Lubuntu/Artwork/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "artwork of Lubuntu")
    (description "Artwork of Lubuntu.")
    (home-page "http://wiki.ubuntu.com/Lubuntu/Artwork")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 44. meanwhile-docs --- library for connecting to an IBM Sametime community
;;; -------------------------------------------------------------------
(define-public meanwhile-docs
  (package
    (name "meanwhile-docs")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/obriencj/meanwhile")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for connecting to an IBM Sametime community")
    (description "Library for connecting to an IBM Sametime community.")
    (home-page "https://github.com/obriencj/meanwhile")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 45. otf-inconsolata-powerline-git --- inconsolata for Powerline
;;; -------------------------------------------------------------------
(define-public otf-inconsolata-powerline-git
  (package
    (name "otf-inconsolata-powerline-git")
    (version "r202.e80e3eb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/powerline/fonts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "inconsolata for Powerline")
    (description "Inconsolata for Powerline.")
    (home-page "https://github.com/powerline/fonts")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 46. srb2-data --- data files for Sonic Robo Blast 2
;;; -------------------------------------------------------------------
(define-public srb2-data
  (package
    (name "srb2-data")
    (version "2.2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.srb2.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "data files for Sonic Robo Blast 2")
    (description "Data files for Sonic Robo Blast 2.")
    (home-page "http://www.srb2.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 47. torch7-cwrap-git --- tool to aid wrapping C functions to be used from Lua
;;; -------------------------------------------------------------------
(define-public torch7-cwrap-git
  (package
    (name "torch7-cwrap-git")
    (version "r35.dbd0a62")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/torch/cwrap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool to aid wrapping C functions to be used from Lua")
    (description "Tool to aid wrapping C functions to be used from Lua.")
    (home-page "https://github.com/torch/cwrap")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 48. nordic-theme-git --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-theme-git
  (package
    (name "nordic-theme-git")
    (version "2.2.0.r52.g75dd1fc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. gobi-loader --- loader for gobi wwan chipset firmware
;;; -------------------------------------------------------------------
(define-public gobi-loader
  (package
    (name "gobi-loader")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.codon.org.uk/~mjg59/gobi_loader/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "loader for gobi wwan chipset firmware")
    (description "Loader for gobi wwan chipset firmware.")
    (home-page "http://www.codon.org.uk/~mjg59/gobi_loader")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 50. hstr-git --- bash and Zsh shell history suggest box - easily view, navigate, search an...
;;; -------------------------------------------------------------------
(define-public hstr-git
  (package
    (name "hstr-git")
    (version "2.3.r3.g6507ac7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dvorka/hstr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bash and Zsh shell history suggest box - easily view, navigate, search an...")
    (description "Bash and Zsh shell history suggest box - easily view, navigate, search and manage your command history.")
    (home-page "https://github.com/dvorka/hstr")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 51. obsetlayout --- a simple tool to set the desktop layout in Openbox
;;; -------------------------------------------------------------------
(define-public obsetlayout
  (package
    (name "obsetlayout")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://openbox.org/wiki/Help:FAQ#How_do_I_put_my_desktops_into_a_grid_layout_instead_of_a_single_row.3F/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple tool to set the desktop layout in Openbox")
    (description "A simple tool to set the desktop layout in Openbox.")
    (home-page "http://openbox.org/wiki/Help:FAQ#How_do_I_put_my_desktops_into_a_grid_layout_instead_of_a_single_row.3F")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 52. stardict-en-cz --- GNU/FDL English-Czech dictionary for StarDict
;;; -------------------------------------------------------------------
(define-public stardict-en-cz
  (package
    (name "stardict-en-cz")
    (version "20210401")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.svobodneslovniky.cz//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNU/FDL English-Czech dictionary for StarDict")
    (description "GNU/FDL English-Czech dictionary for StarDict.")
    (home-page "https://www.svobodneslovniky.cz/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 53. tcc-git --- tiny C Compiler
;;; -------------------------------------------------------------------
(define-public tcc-git
  (package
    (name "tcc-git")
    (version "0.9.27.r797.g4e0e9b8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://bellard.org/tcc/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tiny C Compiler")
    (description "Tiny C Compiler.")
    (home-page "https://bellard.org/tcc/")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 54. ttf-beteckna --- a geometric sans serif typeface inspired by the popular Futura
;;; -------------------------------------------------------------------
(define-public ttf-beteckna
  (package
    (name "ttf-beteckna")
    (version "0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jeffmcneill/beteckna")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a geometric sans serif typeface inspired by the popular Futura")
    (description "A geometric sans serif typeface inspired by the popular Futura.")
    (home-page "https://github.com/jeffmcneill/beteckna")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 55. ttf-mikachan --- handwritten Japanese font family with a cute, playful vibe
;;; -------------------------------------------------------------------
(define-public ttf-mikachan
  (package
    (name "ttf-mikachan")
    (version "9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mia-lab.com/mf//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "handwritten Japanese font family with a cute, playful vibe")
    (description "Handwritten Japanese font family with a cute, playful vibe.")
    (home-page "https://www.mia-lab.com/mf/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 56. bbswitch-git --- kernel module allowing to switch dedicated graphics card on Optimus lapto...
;;; -------------------------------------------------------------------
(define-public bbswitch-git
  (package
    (name "bbswitch-git")
    (version "v0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bumblebee-Project/bbswitch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module allowing to switch dedicated graphics card on Optimus lapto...")
    (description "Kernel module allowing to switch dedicated graphics card on Optimus laptops (Git version).")
    (home-page "https://github.com/Bumblebee-Project/bbswitch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. rainbarf-git --- CPU/RAM stats chart for tmux & screen
;;; -------------------------------------------------------------------
(define-public rainbarf-git
  (package
    (name "rainbarf-git")
    (version "20140404")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://freecode.com/projects/rainbarf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CPU/RAM stats chart for tmux & screen")
    (description "CPU/RAM stats chart for tmux & screen.")
    (home-page "http://freecode.com/projects/rainbarf")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. portmaster-legacy-bin --- privacy Suite and Firewall v1 (Legacy) - For latest Portmaster, use portm...
;;; -------------------------------------------------------------------
(define-public portmaster-legacy-bin
  (package
    (name "portmaster-legacy-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://safing.io/portmaster")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("portmaster-legacy-bin" "bin/portmaster-legacy-bin"))))
    (synopsis "privacy Suite and Firewall v1 (Legacy) - For latest Portmaster, use portm...")
    (description "Privacy Suite and Firewall v1 (Legacy) - For latest Portmaster, use portmaster-bin package.")
    (home-page "https://safing.io/portmaster")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 59. nordic-standard-buttons-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-standard-buttons-theme
  (package
    (name "nordic-standard-buttons-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 60. nordic-polar-standard-buttons-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-polar-standard-buttons-theme
  (package
    (name "nordic-polar-standard-buttons-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 61. nordic-darker-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-darker-theme
  (package
    (name "nordic-darker-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 62. nordic-bluish-accent-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-bluish-accent-theme
  (package
    (name "nordic-bluish-accent-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 63. nordic-bluish-accent-standard-buttons-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-bluish-accent-standard-buttons-theme
  (package
    (name "nordic-bluish-accent-standard-buttons-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 64. cppreference-qt --- a complete reference for the features in the C++ Standard Library, for qt...
;;; -------------------------------------------------------------------
(define-public cppreference-qt
  (package
    (name "cppreference-qt")
    (version "20250209")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://en.cppreference.com/w/Cppreference:Archives#Unofficial_Release/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a complete reference for the features in the C++ Standard Library, for qt...")
    (description "A complete reference for the features in the C++ Standard Library, for qt help.")
    (home-page "https://en.cppreference.com/w/Cppreference:Archives#Unofficial_Release")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 65. arc --- arc file archiver and compressor. Long since superceeded by zip/unzip but...
;;; -------------------------------------------------------------------
(define-public arc
  (package
    (name "arc")
    (version "5.21q")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sourceforge.net/projects/arc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arc file archiver and compressor. Long since superceeded by zip/unzip but...")
    (description "Arc file archiver and compressor. Long since superceeded by zip/unzip but useful if have old .arc files need to unpack.")
    (home-page "http://sourceforge.net/projects/arc")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 66. gstreamer-docs-git --- gStreamer Multimedia Framework (Git version) - documentation
;;; -------------------------------------------------------------------
(define-public gstreamer-docs-git
  (package
    (name "gstreamer-docs-git")
    (version "1.24.0.r37.g95bafc4934")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://gstreamer.freedesktop.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gStreamer Multimedia Framework (Git version) - documentation")
    (description "GStreamer Multimedia Framework (Git version) - documentation.")
    (home-page "http://gstreamer.freedesktop.org/")
    (license (list license:non-copyleft license:cc-by-sa4.0 license:lgpl2.1+ license:expat))))

;;; -------------------------------------------------------------------
;;; 67. gtk-theme-windows10 --- GTK 3.x Theme that looks like the Windows 10 default theme
;;; -------------------------------------------------------------------
(define-public gtk-theme-windows10
  (package
    (name "gtk-theme-windows10")
    (version "3.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/B00merang-Project/Windows-10")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK 3.x Theme that looks like the Windows 10 default theme")
    (description "GTK 3.x Theme that looks like the Windows 10 default theme.")
    (home-page "https://github.com/B00merang-Project/Windows-10")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 68. quartus-free-devinfo-arria_lite --- quartus Prime Lite - devinfo files for arria_lite
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-arria-lite
  (package
    (name "quartus-free-devinfo-arria-lite")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for arria_lite")
    (description "Quartus Prime Lite - devinfo files for arria_lite.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 69. quartus-free-devinfo-cyclone --- quartus Prime Lite - devinfo files for cyclone
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-cyclone
  (package
    (name "quartus-free-devinfo-cyclone")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for cyclone")
    (description "Quartus Prime Lite - devinfo files for cyclone.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 70. quartus-free-devinfo-cyclone10lp --- quartus Prime Lite - devinfo files for cyclone10lp
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-cyclone10lp
  (package
    (name "quartus-free-devinfo-cyclone10lp")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for cyclone10lp")
    (description "Quartus Prime Lite - devinfo files for cyclone10lp.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 71. quartus-free-devinfo-cyclonev --- quartus Prime Lite - devinfo files for cyclonev
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-cyclonev
  (package
    (name "quartus-free-devinfo-cyclonev")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for cyclonev")
    (description "Quartus Prime Lite - devinfo files for cyclonev.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 72. quartus-free-devinfo-max --- quartus Prime Lite - devinfo files for max
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-max
  (package
    (name "quartus-free-devinfo-max")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for max")
    (description "Quartus Prime Lite - devinfo files for max.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 73. quartus-free-devinfo-max10 --- quartus Prime Lite - devinfo files for max10
;;; -------------------------------------------------------------------
(define-public quartus-free-devinfo-max10
  (package
    (name "quartus-free-devinfo-max10")
    (version "25.1.0.1129")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://fpgasoftware.intel.com/?edition=lite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quartus Prime Lite - devinfo files for max10")
    (description "Quartus Prime Lite - devinfo files for max10.")
    (home-page "http://fpgasoftware.intel.com/?edition=lite")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 74. ttf-mononoki-git --- monospace font for programmers, successor of monoOne
;;; -------------------------------------------------------------------
(define-public ttf-mononoki-git
  (package
    (name "ttf-mononoki-git")
    (version "r108.2e74b72")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/madmalik/mononoki")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospace font for programmers, successor of monoOne")
    (description "Monospace font for programmers, successor of monoOne.")
    (home-page "https://github.com/madmalik/mononoki")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 75. nordic-theme --- nord-derived themes for GTK and other platforms
;;; -------------------------------------------------------------------
(define-public nordic-theme
  (package
    (name "nordic-theme")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EliverLara/Nordic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 76. orchis-theme-git --- a Material Design theme for GNOME/GTK based desktop environments
;;; -------------------------------------------------------------------
(define-public orchis-theme-git
  (package
    (name "orchis-theme-git")
    (version "2025.04.25.r0.g5b73376")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Orchis-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Material Design theme for GNOME/GTK based desktop environments")
    (description "A Material Design theme for GNOME/GTK based desktop environments.")
    (home-page "https://github.com/vinceliuice/Orchis-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 77. orchis-nord-theme-git --- a Material Design theme for GNOME/GTK based desktop environments. (nord v...
;;; -------------------------------------------------------------------
(define-public orchis-nord-theme-git
  (package
    (name "orchis-nord-theme-git")
    (version "2025.04.25.r0.g5b73376")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Orchis-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Material Design theme for GNOME/GTK based desktop environments. (nord v...")
    (description "A Material Design theme for GNOME/GTK based desktop environments. (nord variant).")
    (home-page "https://github.com/vinceliuice/Orchis-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. orchis-dracula-theme-git --- a Material Design theme for GNOME/GTK based desktop environments. (dracul...
;;; -------------------------------------------------------------------
(define-public orchis-dracula-theme-git
  (package
    (name "orchis-dracula-theme-git")
    (version "2025.04.25.r0.g5b73376")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Orchis-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Material Design theme for GNOME/GTK based desktop environments. (dracul...")
    (description "A Material Design theme for GNOME/GTK based desktop environments. (dracula variant).")
    (home-page "https://github.com/vinceliuice/Orchis-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 79. open-dyslexic-fonts --- typeface that uses typeface shapes & features to help offset some visual ...
;;; -------------------------------------------------------------------
(define-public open-dyslexic-fonts
  (package
    (name "open-dyslexic-fonts")
    (version "0.91.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://forge.hackers.town/antijingoist/opendyslexic/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "typeface that uses typeface shapes & features to help offset some visual ...")
    (description "Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia.")
    (home-page "https://forge.hackers.town/antijingoist/opendyslexic")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 80. adapta-backgrounds --- wallpaper collection for adapta-project
;;; -------------------------------------------------------------------
(define-public adapta-backgrounds
  (package
    (name "adapta-backgrounds")
    (version "0.5.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adapta-project/adapta-backgrounds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wallpaper collection for adapta-project")
    (description "Wallpaper collection for adapta-project.")
    (home-page "https://github.com/adapta-project/adapta-backgrounds")
    (license (list license:non-copyleft license:gpl2))))

;;; -------------------------------------------------------------------
;;; 81. nvidia-sdk --- NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs)
;;; -------------------------------------------------------------------
(define-public nvidia-sdk
  (package
    (name "nvidia-sdk")
    (version "13.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/nvidia-video-codec-sdk//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs)")
    (description "NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs).")
    (home-page "https://developer.nvidia.com/nvidia-video-codec-sdk/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 82. nvidia-sdk-doc --- NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (documentation)
;;; -------------------------------------------------------------------
(define-public nvidia-sdk-doc
  (package
    (name "nvidia-sdk-doc")
    (version "13.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.nvidia.com/nvidia-video-codec-sdk//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (documentation)")
    (description "NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (documentation).")
    (home-page "https://developer.nvidia.com/nvidia-video-codec-sdk/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 83. ttf-essays --- a font based on the typeface used in a 1743 English translation of Montai...
;;; -------------------------------------------------------------------
(define-public ttf-essays
  (package
    (name "ttf-essays")
    (version "2.100")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.thibault.org/fonts/essays//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font based on the typeface used in a 1743 English translation of Montai...")
    (description "A font based on the typeface used in a 1743 English translation of Montaigne's Essays.")
    (home-page "https://www.thibault.org/fonts/essays/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 84. ttf-humor-sans --- xkcd styled sans-serif typeface
;;; -------------------------------------------------------------------
(define-public ttf-humor-sans
  (package
    (name "ttf-humor-sans")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xkcdsucks.blogspot.com.au/2009/03/xkcdsucks-is-proud-to-present-humor.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "xkcd styled sans-serif typeface")
    (description "Xkcd styled sans-serif typeface.")
    (home-page "http://xkcdsucks.blogspot.com.au/2009/03/xkcdsucks-is-proud-to-present-humor.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 85. numix-gtk-theme --- a flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)
;;; -------------------------------------------------------------------
(define-public numix-gtk-theme
  (package
    (name "numix-gtk-theme")
    (version "2.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/numixproject/numix-gtk-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)")
    (description "A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce).")
    (home-page "https://github.com/numixproject/numix-gtk-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 86. lscolors-git --- colorize the output of the \"ls\" shell command via LS_COLORS
;;; -------------------------------------------------------------------
(define-public lscolors-git
  (package
    (name "lscolors-git")
    (version "r259.03e66df")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trapd00r/LS_COLORS")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "colorize the output of the \"ls\" shell command via LS_COLORS")
    (description "Colorize the output of the \\\"ls\\\" shell command via LS_COLORS.")
    (home-page "https://github.com/trapd00r/LS_COLORS")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 87. nerd-fonts-git --- iconic font aggregator, collection, and patcher: 34 patched fonts (77k va...
;;; -------------------------------------------------------------------
(define-public nerd-fonts-git
  (package
    (name "nerd-fonts-git")
    (version "3.0.0.r30.g58504d670")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ryanoasis/nerd-fonts")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iconic font aggregator, collection, and patcher: 34 patched fonts (77k va...")
    (description "Iconic font aggregator, collection, and patcher: 34 patched fonts (77k variations). Includes popular glyph collections such as Font Awesome & fonts such as Hack.")
    (home-page "https://github.com/ryanoasis/nerd-fonts")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. amd-zen-ucode-platomav --- microcode update image for AMD Zen CPUs (family 17h, 19h, 1Ah) from plato...
;;; -------------------------------------------------------------------
(define-public amd-zen-ucode-platomav
  (package
    (name "amd-zen-ucode-platomav")
    (version "r348")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/platomav/CPUMicrocodes")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microcode update image for AMD Zen CPUs (family 17h, 19h, 1Ah) from plato...")
    (description "Microcode update image for AMD Zen CPUs (family 17h, 19h, 1Ah) from platomav's github.")
    (home-page "https://github.com/platomav/CPUMicrocodes")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 89. aur-out-of-date --- determines out-of-date AUR packages
;;; -------------------------------------------------------------------
(define-public aur-out-of-date
  (package
    (name "aur-out-of-date")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simon04/aur-out-of-date")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/simon04/aur-out-of-date"
      #:tests? #f))
    (synopsis "determines out-of-date AUR packages")
    (description "Determines out-of-date AUR packages.")
    (home-page "https://github.com/simon04/aur-out-of-date")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 90. dict-freedict-eng-deu --- english -> German dictionary for dictd et al. from FreeDict.org
;;; -------------------------------------------------------------------
(define-public dict-freedict-eng-deu
  (package
    (name "dict-freedict-eng-deu")
    (version "1.9_fd1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://freedict.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "english -> German dictionary for dictd et al. from FreeDict.org")
    (description "English -> German dictionary for dictd et al. from FreeDict.org.")
    (home-page "https://freedict.org/")
    (license (list license:agpl3+ license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 91. xinput_calibrator --- generic touchscreen calibration program for X.Org
;;; -------------------------------------------------------------------
(define-public xinput-calibrator
  (package
    (name "xinput-calibrator")
    (version "0.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.freedesktop.org/wiki/Software/xinput_calibrator//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generic touchscreen calibration program for X.Org")
    (description "Generic touchscreen calibration program for X.Org.")
    (home-page "http://www.freedesktop.org/wiki/Software/xinput_calibrator/")
    (license (list license:expat license:x11))))

;;; -------------------------------------------------------------------
;;; 92. tmux-mem-cpu-load-git --- CPU, RAM memory, and load monitor for use with tmux
;;; -------------------------------------------------------------------
(define-public tmux-mem-cpu-load-git
  (package
    (name "tmux-mem-cpu-load-git")
    (version "3.7.0.r29.gdf71d21")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thewtex/tmux-mem-cpu-load")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CPU, RAM memory, and load monitor for use with tmux")
    (description "CPU, RAM memory, and load monitor for use with tmux.")
    (home-page "https://github.com/thewtex/tmux-mem-cpu-load")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 93. terminus-font-ll2-td1 --- monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I...
;;; -------------------------------------------------------------------
(define-public terminus-font-ll2-td1
  (package
    (name "terminus-font-ll2-td1")
    (version "4.49.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://terminus-font.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I...")
    (description "Monospace bitmap font (for X11 and console) with ll2 patch (pass the il1I test) and td1 patch (centered ascii tilde).")
    (home-page "http://terminus-font.sourceforge.net/")
    (license (list license:non-copyleft license:gpl2))))

;;; -------------------------------------------------------------------
;;; 94. xmlindent --- XML stream reformatter written in ANSI C
;;; -------------------------------------------------------------------
(define-public xmlindent
  (package
    (name "xmlindent")
    (version "0.2.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xmlindent.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "XML stream reformatter written in ANSI C")
    (description "XML stream reformatter written in ANSI C.")
    (home-page "http://xmlindent.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 95. kbdlight --- a very simple application that changes MacBooks' keyboard backlight level
;;; -------------------------------------------------------------------
(define-public kbdlight
  (package
    (name "kbdlight")
    (version "1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WhyNotHugo/kbdlight")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a very simple application that changes MacBooks' keyboard backlight level")
    (description "A very simple application that changes MacBooks' keyboard backlight level.")
    (home-page "https://github.com/WhyNotHugo/kbdlight")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 96. leiningen-completions --- completion scripts for leiningen
;;; -------------------------------------------------------------------
(define-public leiningen-completions
  (package
    (name "leiningen-completions")
    (version "2.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/technomancy/leiningen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "completion scripts for leiningen")
    (description "Completion scripts for leiningen.")
    (home-page "https://github.com/technomancy/leiningen")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 97. numix-themes-darkblue --- a flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (...
;;; -------------------------------------------------------------------
(define-public numix-themes-darkblue
  (package
    (name "numix-themes-darkblue")
    (version "2.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/numixproject/numix-gtk-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (...")
    (description "A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (Dark Blue Variant).")
    (home-page "https://github.com/numixproject/numix-gtk-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 98. xi-core-git --- a modern editor with a backend written in Rust
;;; -------------------------------------------------------------------
(define-public xi-core-git
  (package
    (name "xi-core-git")
    (version "r314.72295fa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/xi-editor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern editor with a backend written in Rust")
    (description "A modern editor with a backend written in Rust.")
    (home-page "https://github.com/google/xi-editor")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 99. rcm --- rc file (dotfiles) management
;;; -------------------------------------------------------------------
(define-public rcm
  (package
    (name "rcm")
    (version "1.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thoughtbot/rcm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rc file (dotfiles) management")
    (description "Rc file (dotfiles) management.")
    (home-page "https://github.com/thoughtbot/rcm")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 100. pvs-studio --- static code analyzer for C and C++
;;; -------------------------------------------------------------------
(define-public pvs-studio
  (package
    (name "pvs-studio")
    (version "7.41.103683.741")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.pvs-studio.com/en/pvs-studio/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static code analyzer for C and C++")
    (description "Static code analyzer for C and C++.")
    (home-page "http://www.pvs-studio.com/en/pvs-studio")
    (license license:non-copyleft)))
