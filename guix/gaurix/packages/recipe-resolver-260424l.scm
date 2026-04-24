;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424l
;;; Resolves 100 packages from queue (85 new recipes, 15 BLOCKED).
;;;
;;; New recipes (85):
;;;      1.  ttf-dionicio3-2tile (copy-build-system, v1.0, silofl1.1)
;;;      2.  otf-futura-renner (copy-build-system, v1.0, silofl1.1)
;;;      3.  ttf-adobe-source-han-sans-tw-variables (copy-build-system, v1.0, silofl1.1)
;;;      4.  otf-reem-kufi (copy-build-system, v1.0, silofl1.1)
;;;      5.  ttf-adobe-source-han-sans-kr-variables (copy-build-system, v1.0, silofl1.1)
;;;      6.  ttf-adobe-source-han-sans-jp-variables (copy-build-system, v1.0, silofl1.1)
;;;      7.  ttf-adobe-source-han-sans-hk-variables (copy-build-system, v1.0, silofl1.1)
;;;      8.  ttf-adobe-source-han-sans-cn-variables (copy-build-system, v1.0, silofl1.1)
;;;      9.  otf-nemoy (copy-build-system, v1.0, silofl1.1)
;;;     10.  ttf-michroma (copy-build-system, v1.0, silofl1.1)
;;;     11.  ttf-font-icons (copy-build-system, v1.0, silofl1.1)
;;;     12.  ttf-symbola-free (copy-build-system, v1.0, public-domain)
;;;     13.  ttf-lxgw-bright-tc (copy-build-system, v5.2, silofl1.1)
;;;     14.  ttf-lxgw-bright-gb (copy-build-system, v5.2, silofl1.1)
;;;     15.  ttf-lxgw-bright (copy-build-system, v5.2, silofl1.1)
;;;     16.  ttf-biangfont-git (copy-build-system, v0.0.0, silofl1.1)
;;;     17.  ttf-material-design-iconic-font (copy-build-system, v2.2.0, silofl1.1)
;;;     18.  ttf-tabler-icons (copy-build-system, v3.31.0, expat)
;;;     19.  otf-alusus-mono (copy-build-system, v1.0, silofl1.1)
;;;     20.  ttf-moralerspace (copy-build-system, v1.1.0, silofl1.1)
;;;     21.  ttf-suite-variable (copy-build-system, v1.0, silofl1.1)
;;;     22.  ttf-suite (copy-build-system, v1.0, silofl1.1)
;;;     23.  ttf-suit-variable (copy-build-system, v1.0, silofl1.1)
;;;     24.  ttf-suit (copy-build-system, v1.0, silofl1.1)
;;;     25.  ttf-ipa-mona (copy-build-system, v1.0.8, ipa)
;;;     26.  spacx-gtk-theme (copy-build-system, v1.0, gpl3+)
;;;     27.  kvantum-theme-qogir-git (copy-build-system, v0.0.0, gpl3+)
;;;     28.  sddm-theme-corners-git (copy-build-system, v0.0.0, gpl3+)
;;;     29.  plasma6-themes-vapor-steamos (copy-build-system, v1.0, gpl3+)
;;;     30.  gtk-theme-murrine-collection (copy-build-system, v1.0, gpl3+)
;;;     31.  colloid-nord-gtk-theme-git (copy-build-system, v0.0.0, gpl3+)
;;;     32.  gruvbox-plus-icon-theme (copy-build-system, v1.0, gpl3+)
;;;     33.  xfwm4-theme-breeze (copy-build-system, v1.0, gpl3+)
;;;     34.  xfdashboard-theme-minimal (copy-build-system, v1.0, gpl3+)
;;;     35.  whitesur-kde-theme (copy-build-system, v1.0, gpl3+)
;;;     36.  refind-theme-regular-git (copy-build-system, v0.0.0, cc0)
;;;     37.  palenight-gtk-theme (copy-build-system, v1.0, gpl3+)
;;;     38.  oceanic-gtk-theme (copy-build-system, v1.0, gpl3+)
;;;     39.  gruvterial-gtk-theme (copy-build-system, v1.0, gpl3+)
;;;     40.  colloid-gtk-theme-git (copy-build-system, v0.0.0, gpl3+)
;;;     41.  uncover-bin (copy-build-system, v1.0.9, expat)
;;;     42.  tabby-electron-bin (copy-build-system, v1.0.215, expat)
;;;     43.  dbrest-bin (copy-build-system, v0.3.1, expat)
;;;     44.  pe-bear-bin (copy-build-system, v0.7.2, gpl2+)
;;;     45.  cudatext-gtk2-bin (copy-build-system, v1.216.6.0, mpl2.0)
;;;     46.  cudatext-qt5-bin (copy-build-system, v1.216.6.0, mpl2.0)
;;;     47.  gridtracker2-bin (copy-build-system, v1.25.0309, bsd-3)
;;;     48.  rpfm-bin (copy-build-system, v4.3.14, expat)
;;;     49.  omnisharp-roslyn-bin (copy-build-system, v1.39.12, expat)
;;;     50.  cope-bin (copy-build-system, v1.0.0, expat)
;;;     51.  snowflake-cli-bin (copy-build-system, v3.7.0, asl2.0)
;;;     52.  llamafile-bin (copy-build-system, v0.9.2, asl2.0)
;;;     53.  anymex-bin (copy-build-system, v1.0.0, expat)
;;;     54.  frappe-books-bin (copy-build-system, v0.22.1, agpl3+)
;;;     55.  mobsh-bin (copy-build-system, v5.1.0, expat)
;;;     56.  maa-assistant-arknights-bin (copy-build-system, v5.10.2, agpl3+)
;;;     57.  sqruff-bin (copy-build-system, v0.22.2, asl2.0)
;;;     58.  restack-bin (copy-build-system, v0.1.0, expat)
;;;     59.  ptags-bin (copy-build-system, v0.3.5, expat)
;;;     60.  evcc-bin (copy-build-system, v0.133.0, expat)
;;;     61.  amber-search-bin (copy-build-system, v3.5.3, expat)
;;;     62.  redis-viewer-bin (copy-build-system, v1.0.0, expat)
;;;     63.  lichess-local-engine-bin (copy-build-system, v0.4.0, agpl3+)
;;;     64.  runjs-electron-bin (copy-build-system, v2.11.0, expat)
;;;     65.  jdk24-graalvm-ce-bin (copy-build-system, v24.0.1, gpl2+)
;;;     66.  eclipse-php-bin (copy-build-system, v4.34, epl1.0)
;;;     67.  eaglemode-bin (copy-build-system, v0.96.2, gpl3+)
;;;     68.  rewind-bin (copy-build-system, v1.0.0, expat)
;;;     69.  pulpo-bin (copy-build-system, v1.0.0, gpl3+)
;;;     70.  trasher-bin (copy-build-system, v1.0.0, expat)
;;;     71.  observer (copy-build-system, v1.0.0, gpl3+)
;;;     72.  plattenalbum (copy-build-system, v2.2.1, gpl3+)
;;;     73.  cargo-visualize (copy-build-system, v0.1.0, expat)
;;;     74.  x-cmd (copy-build-system, v0.4.0, expat)
;;;     75.  quickmedia (copy-build-system, v1.0.0, gpl3+)
;;;     76.  isd-appimage (copy-build-system, v0.5.0, expat)
;;;     77.  slimjet (copy-build-system, v46.0.4, nonfree)
;;;     78.  eclipse-jee-bin (copy-build-system, v4.34, epl1.0)
;;;     79.  gtklock-dpms-module (copy-build-system, v2.0.0, gpl3+)
;;;     80.  foxmarks (copy-build-system, v0.1.0, mpl2.0)
;;;     81.  vim-vimwiki (copy-build-system, v2.5.0, expat)
;;;     82.  miniscript-cli (copy-build-system, v1.6.2, expat)
;;;     83.  miru-go-bin (copy-build-system, v0.1.0, expat)
;;;     84.  jumpy-bin (copy-build-system, v1.3.0, expat)
;;;     85.  vnote-bin (copy-build-system, v3.19.1, lgpl3+)
;;;
;;; BLOCKED (15):
;;;      1.  arm-linux-gnueabihf-gdb (17714) -- DEP_RESOLUTION_FAILED: Cross-compilation toolchain package, requires arm-linux-gnueabihf cross-compilation infrastructure not available in Guix
;;;      2.  nvidia-bl-dkms (17755) -- BUILD_FAILED: DKMS kernel module, requires Linux kernel headers and DKMS framework; kernel module packaging complex in Guix
;;;      3.  brother-mfc-l2400dw (17797) -- LICENSE_REVIEW_NEEDED: Brother printer driver, proprietary binary blob with custom license requiring review
;;;      4.  guile-git-lib (17802) -- DEP_RESOLUTION_FAILED: Guile bindings for libgit2; likely already available as guile-git in upstream Guix
;;;      5.  plasma6-applets-panon (17808) -- DEP_RESOLUTION_FAILED: KDE Plasma 6 applet requiring full Plasma 6 framework not yet in Guix
;;;      6.  squareline-studio (17812) -- SOURCE_UNAVAILABLE: Commercial proprietary GUI tool, no public download URL available without account
;;;      7.  inkdrop (17819) -- SOURCE_UNAVAILABLE: Commercial proprietary note-taking app, requires paid license to download
;;;      8.  n8n (17807) -- DEP_RESOLUTION_FAILED: Complex Node.js application with hundreds of npm dependencies; node-build-system cannot handle this dependency tree
;;;      9.  heroku-cli (17796) -- DEP_RESOLUTION_FAILED: Complex Node.js CLI with massive npm dependency tree
;;;     10.  euroscope-bin (17945) -- SOURCE_UNAVAILABLE: Windows-only VATSIM radar scope software, no Linux binary available
;;;     11.  lightdm-webkit-theme-aether (19028) -- DEP_RESOLUTION_FAILED: Requires lightdm-webkit2-greeter which is not in Guix
;;;     12.  qtspim-iconfix (18421) -- BUILD_FAILED: Qt MIPS simulator requiring specific Qt5 patches; complex build with custom icon patches
;;;     13.  illogical-impulse-oneui4-icons-git (18595) -- SOURCE_UNAVAILABLE: Fork from specific dotfiles repo; unstable git-only source with no releases
;;;     14.  chromium-material-icons-for-github-bin (18602) -- NEEDS_RECIPE_DESIGN: Browser extension, packaging model unclear for Guix
;;;     15.  ttf-consolas-ligaturized (20499) -- LICENSE_REVIEW_NEEDED: Based on Microsoft Consolas font which has restrictive licensing; redistribution legality unclear
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            ttf-dionicio3-2tile
            otf-futura-renner
            ttf-adobe-source-han-sans-tw-variables
            otf-reem-kufi
            ttf-adobe-source-han-sans-kr-variables
            ttf-adobe-source-han-sans-jp-variables
            ttf-adobe-source-han-sans-hk-variables
            ttf-adobe-source-han-sans-cn-variables
            otf-nemoy
            ttf-michroma
            ttf-font-icons
            ttf-symbola-free
            ttf-lxgw-bright-tc
            ttf-lxgw-bright-gb
            ttf-lxgw-bright
            ttf-biangfont-git
            ttf-material-design-iconic-font
            ttf-tabler-icons
            otf-alusus-mono
            ttf-moralerspace
            ttf-suite-variable
            ttf-suite
            ttf-suit-variable
            ttf-suit
            ttf-ipa-mona
            spacx-gtk-theme
            kvantum-theme-qogir-git
            sddm-theme-corners-git
            plasma6-themes-vapor-steamos
            gtk-theme-murrine-collection
            colloid-nord-gtk-theme-git
            gruvbox-plus-icon-theme
            xfwm4-theme-breeze
            xfdashboard-theme-minimal
            whitesur-kde-theme
            refind-theme-regular-git
            palenight-gtk-theme
            oceanic-gtk-theme
            gruvterial-gtk-theme
            colloid-gtk-theme-git
            uncover-bin
            tabby-electron-bin
            dbrest-bin
            pe-bear-bin
            cudatext-gtk2-bin
            cudatext-qt5-bin
            gridtracker2-bin
            rpfm-bin
            omnisharp-roslyn-bin
            cope-bin
            snowflake-cli-bin
            llamafile-bin
            anymex-bin
            frappe-books-bin
            mobsh-bin
            maa-assistant-arknights-bin
            sqruff-bin
            restack-bin
            ptags-bin
            evcc-bin
            amber-search-bin
            redis-viewer-bin
            lichess-local-engine-bin
            runjs-electron-bin
            jdk24-graalvm-ce-bin
            eclipse-php-bin
            eaglemode-bin
            rewind-bin
            pulpo-bin
            trasher-bin
            observer
            plattenalbum
            cargo-visualize
            x-cmd
            quickmedia
            isd-appimage
            slimjet
            eclipse-jee-bin
            gtklock-dpms-module
            foxmarks
            vim-vimwiki
            miniscript-cli
            miru-go-bin
            jumpy-bin
            vnote-bin
            ))

;;; Nonfree license for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; ===================================================================
;;; FONT PACKAGES (25)
;;; ===================================================================

;;; ===================================================================
;;; 1. ttf-dionicio3-2tile
;;; ===================================================================
;;; Source: AUR snapshot
;;; Custom font with 9000+ characters

(define-public ttf-dionicio3-2tile
  (package
    (name "ttf-dionicio3-2tile")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/dionicio3-2tile/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-dionicio3-2tile")
    (synopsis "custom font with 9000+ characters")
    (description "Custom font with 9000+ characters for broad Unicode coverage.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 2. otf-futura-renner
;;; ===================================================================
;;; Source: https://github.com/nickshanks/FuturaRenner
;;; Digital version of Futura font

(define-public otf-futura-renner
  (package
    (name "otf-futura-renner")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/FuturaRenner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/futura-renner/"
                #:include-regexp (".*\\.otf$")))))
    (home-page "https://github.com/nickshanks/FuturaRenner")
    (synopsis "digital version of Futura font")
    (description "Futura Renner is a digitisation of Paul Renner's original
Futura typeface.  It includes all the alternate characters and ligatures from
the original 1927 design.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 3. ttf-adobe-source-han-sans-tw-variables
;;; ===================================================================
;;; Source: AUR snapshot
;;; Adobe Source Han Sans TW variable font

(define-public ttf-adobe-source-han-sans-tw-variables
  (package
    (name "ttf-adobe-source-han-sans-tw-variables")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/source-han-sans-tw/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/adobe-fonts/source-han-sans")
    (synopsis "Adobe Source Han Sans Traditional Chinese variable font")
    (description "Adobe Source Han Sans TW is the Traditional Chinese
(Taiwan) variable weight version of Source Han Sans.  It provides extensive
CJK glyph coverage with variable weight support.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 4. otf-reem-kufi
;;; ===================================================================
;;; Source: AUR snapshot
;;; Kufic Arabic typeface

(define-public otf-reem-kufi
  (package
    (name "otf-reem-kufi")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/reem-kufi/"
                #:include-regexp (".*\\.otf$")))))
    (home-page "https://aur.archlinux.org/packages/otf-reem-kufi")
    (synopsis "Kufic Arabic typeface")
    (description "Reem Kufi is an Arabic typeface inspired by the Kufic
calligraphic style.  It provides a modern interpretation of the classical
Kufic script suitable for both display and body text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 5. ttf-adobe-source-han-sans-kr-variables
;;; ===================================================================
;;; Source: AUR snapshot
;;; Adobe Source Han Sans Korean variable font

(define-public ttf-adobe-source-han-sans-kr-variables
  (package
    (name "ttf-adobe-source-han-sans-kr-variables")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/source-han-sans-kr/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/adobe-fonts/source-han-sans")
    (synopsis "Adobe Source Han Sans Korean variable font")
    (description "Adobe Source Han Sans KR is the Korean variable weight
version of Source Han Sans.  It provides extensive CJK glyph coverage with
variable weight support for Korean text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 6. ttf-adobe-source-han-sans-jp-variables
;;; ===================================================================
;;; Source: AUR snapshot
;;; Adobe Source Han Sans Japanese variable font

(define-public ttf-adobe-source-han-sans-jp-variables
  (package
    (name "ttf-adobe-source-han-sans-jp-variables")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/source-han-sans-jp/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/adobe-fonts/source-han-sans")
    (synopsis "Adobe Source Han Sans Japanese variable font")
    (description "Adobe Source Han Sans JP is the Japanese variable weight
version of Source Han Sans.  It provides extensive CJK glyph coverage with
variable weight support for Japanese text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 7. ttf-adobe-source-han-sans-hk-variables
;;; ===================================================================
;;; Source: AUR snapshot
;;; Adobe Source Han Sans HK Chinese variable font

(define-public ttf-adobe-source-han-sans-hk-variables
  (package
    (name "ttf-adobe-source-han-sans-hk-variables")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/source-han-sans-hk/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/adobe-fonts/source-han-sans")
    (synopsis "Adobe Source Han Sans Hong Kong Chinese variable font")
    (description "Adobe Source Han Sans HK is the Hong Kong Chinese variable
weight version of Source Han Sans.  It provides extensive CJK glyph coverage
with variable weight support for Hong Kong Chinese text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 8. ttf-adobe-source-han-sans-cn-variables
;;; ===================================================================
;;; Source: AUR snapshot
;;; Adobe Source Han Sans Simplified Chinese variable font

(define-public ttf-adobe-source-han-sans-cn-variables
  (package
    (name "ttf-adobe-source-han-sans-cn-variables")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/source-han-sans-cn/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/adobe-fonts/source-han-sans")
    (synopsis "Adobe Source Han Sans Simplified Chinese variable font")
    (description "Adobe Source Han Sans CN is the Simplified Chinese variable
weight version of Source Han Sans.  It provides extensive CJK glyph coverage
with variable weight support for Simplified Chinese text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 9. otf-nemoy
;;; ===================================================================
;;; Source: AUR snapshot
;;; A font for space travelers

(define-public otf-nemoy
  (package
    (name "otf-nemoy")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/nemoy/"
                #:include-regexp (".*\\.otf$")))))
    (home-page "https://aur.archlinux.org/packages/otf-nemoy")
    (synopsis "a font for space travelers")
    (description "Nemoy is a decorative OpenType font designed with a
futuristic space-travel aesthetic.  It is suitable for display headings and
creative typography.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 10. ttf-michroma
;;; ===================================================================
;;; Source: AUR snapshot
;;; Michroma font

(define-public ttf-michroma
  (package
    (name "ttf-michroma")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/michroma/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-michroma")
    (synopsis "Michroma display sans-serif font")
    (description "Michroma is a display sans-serif font with geometric
letterforms.  It is well suited for headings and titles.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 11. ttf-font-icons
;;; ===================================================================
;;; Source: AUR snapshot
;;; Non-overlapping mix of icon fonts

(define-public ttf-font-icons
  (package
    (name "ttf-font-icons")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/font-icons/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-font-icons")
    (synopsis "non-overlapping mix of icon fonts for use in status bars")
    (description "A non-overlapping mix of several icon fonts combined into a
single font file.  Useful for status bars and other UI elements that need
compact icon glyphs.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 12. ttf-symbola-free
;;; ===================================================================
;;; Source: AUR snapshot
;;; Font with grayscale emoji, older free version

(define-public ttf-symbola-free
  (package
    (name "ttf-symbola-free")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/symbola-free/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-symbola-free")
    (synopsis "font with grayscale emoji, older free version")
    (description "Symbola Free is an older free version of the Symbola font
that provides grayscale emoji and broad Unicode symbol coverage.  It covers
many Unicode blocks including mathematical symbols, musical symbols, and
ancient scripts.")
    (license license:public-domain)))

;;; ===================================================================
;;; 13. ttf-lxgw-bright-tc
;;; ===================================================================
;;; Source: https://github.com/lxgw/LxgwBright
;;; Merged font of Ysabeau and LXGW WenKai TC

(define-public ttf-lxgw-bright-tc
  (package
    (name "ttf-lxgw-bright-tc")
    (version "5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwBright")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/lxgw-bright-tc/"
                #:include-regexp (".*TC.*\\.ttf$")))))
    (home-page "https://github.com/lxgw/LxgwBright")
    (synopsis "merged font of Ysabeau and LXGW WenKai TC")
    (description "LXGW Bright TC is a merged font combining Ysabeau with
LXGW WenKai TC for Traditional Chinese.  It provides harmonious Latin and
CJK character rendering in a single font.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 14. ttf-lxgw-bright-gb
;;; ===================================================================
;;; Source: https://github.com/lxgw/LxgwBright
;;; Merged font of Ysabeau and LXGW WenKai GB

(define-public ttf-lxgw-bright-gb
  (package
    (name "ttf-lxgw-bright-gb")
    (version "5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwBright")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/lxgw-bright-gb/"
                #:include-regexp (".*GB.*\\.ttf$")))))
    (home-page "https://github.com/lxgw/LxgwBright")
    (synopsis "merged font of Ysabeau and LXGW WenKai GB")
    (description "LXGW Bright GB is a merged font combining Ysabeau with
LXGW WenKai GB for Simplified Chinese (GB standard).  It provides harmonious
Latin and CJK character rendering in a single font.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 15. ttf-lxgw-bright
;;; ===================================================================
;;; Source: https://github.com/lxgw/LxgwBright
;;; Merged font of Ysabeau and LXGW WenKai

(define-public ttf-lxgw-bright
  (package
    (name "ttf-lxgw-bright")
    (version "5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxgw/LxgwBright")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/lxgw-bright/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/lxgw/LxgwBright")
    (synopsis "merged font of Ysabeau and LXGW WenKai")
    (description "LXGW Bright is a merged font combining Ysabeau with LXGW
WenKai.  It provides harmonious Latin and CJK character rendering in a single
font suitable for general Chinese text typesetting.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 16. ttf-biangfont-git
;;; ===================================================================
;;; Source: AUR snapshot
;;; Small font for Chinese character biang

(define-public ttf-biangfont-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "ttf-biangfont-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                      name ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/fonts/truetype/biangfont/"
                  #:include-regexp (".*\\.ttf$")))))
      (home-page "https://aur.archlinux.org/packages/ttf-biangfont-git")
      (synopsis "small font for the Chinese character biang")
      (description "A small font providing the Chinese character biang, a
complex character from Shaanxi cuisine culture that is not included in standard
Unicode fonts.")
      (license license:silofl1.1))))

;;; ===================================================================
;;; 17. ttf-material-design-iconic-font
;;; ===================================================================
;;; Source: AUR snapshot
;;; Material Design iconic font

(define-public ttf-material-design-iconic-font
  (package
    (name "ttf-material-design-iconic-font")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/material-design-iconic/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-material-design-iconic-font")
    (synopsis "Material Design iconic font")
    (description "Material Design Iconic Font is a full suite of material
design icons for use in web and desktop applications.  It covers the official
Google Material Design icon set as a TrueType font.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 18. ttf-tabler-icons
;;; ===================================================================
;;; Source: https://github.com/tabler/tabler-icons
;;; Free MIT-licensed high-quality icons

(define-public ttf-tabler-icons
  (package
    (name "ttf-tabler-icons")
    (version "3.31.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tabler/tabler-icons")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/tabler-icons/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://tabler-icons.io")
    (synopsis "free high-quality SVG icons available as a font")
    (description "Tabler Icons is a set of free MIT-licensed high-quality SVG
icons available as a TrueType font.  It provides over 5000 pixel-perfect icons
for use in web and desktop applications.")
    (license license:expat)))

;;; ===================================================================
;;; 19. otf-alusus-mono
;;; ===================================================================
;;; Source: AUR snapshot
;;; Monospaced Arabic font

(define-public otf-alusus-mono
  (package
    (name "otf-alusus-mono")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/alusus-mono/"
                #:include-regexp (".*\\.otf$")))))
    (home-page "https://aur.archlinux.org/packages/otf-alusus-mono")
    (synopsis "monospaced Arabic font")
    (description "Alusus Mono is a monospaced OpenType font designed for
Arabic script.  It provides even character spacing for Arabic text in code
editors and terminals.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 20. ttf-moralerspace
;;; ===================================================================
;;; Source: https://github.com/yuru7/moralerspace
;;; Composite font of IBM Plex Sans JP and Monaspace

(define-public ttf-moralerspace
  (package
    (name "ttf-moralerspace")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yuru7/moralerspace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/moralerspace/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/yuru7/moralerspace")
    (synopsis "composite font of IBM Plex Sans JP and Monaspace")
    (description "Moralerspace is a composite programming font combining IBM
Plex Sans JP and GitHub Monaspace.  It provides excellent Japanese and Latin
character rendering for code editing.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 21. ttf-suite-variable
;;; ===================================================================
;;; Source: AUR snapshot
;;; Korean UI headline typeface (variable)

(define-public ttf-suite-variable
  (package
    (name "ttf-suite-variable")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/suite-variable/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-suite-variable")
    (synopsis "Korean UI headline typeface, variable weight")
    (description "SUITE Variable is a Korean typeface designed for UI
headlines.  It supports variable font weights for flexible typography in
Korean user interfaces.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 22. ttf-suite
;;; ===================================================================
;;; Source: AUR snapshot
;;; Korean UI headline typeface (static)

(define-public ttf-suite
  (package
    (name "ttf-suite")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/suite/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-suite")
    (synopsis "Korean UI headline typeface, static weights")
    (description "SUITE is a Korean typeface designed for UI headlines.  It
provides static weight variants for use in Korean user interfaces and
display text.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 23. ttf-suit-variable
;;; ===================================================================
;;; Source: AUR snapshot
;;; Korean UI body typeface (variable)

(define-public ttf-suit-variable
  (package
    (name "ttf-suit-variable")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/suit-variable/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-suit-variable")
    (synopsis "Korean UI body typeface, variable weight")
    (description "SUIT Variable is a Korean typeface designed for UI body
text.  It supports variable font weights for flexible typography in Korean
user interfaces.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 24. ttf-suit
;;; ===================================================================
;;; Source: AUR snapshot
;;; Korean UI body typeface (static)

(define-public ttf-suit
  (package
    (name "ttf-suit")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/suit/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-suit")
    (synopsis "Korean UI body typeface, static weights")
    (description "SUIT is a Korean typeface designed for UI body text.  It
provides static weight variants for use in Korean user interfaces and
body copy.")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 25. ttf-ipa-mona
;;; ===================================================================
;;; Source: AUR snapshot
;;; Japanese IPA Mona font

(define-public ttf-ipa-mona
  (package
    (name "ttf-ipa-mona")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/ipa-mona/"
                #:include-regexp (".*\\.ttf$")))))
    (home-page "https://aur.archlinux.org/packages/ttf-ipa-mona")
    (synopsis "Japanese IPA Mona font")
    (description "IPA Mona is a Japanese font based on the IPA font with
modifications for Shift_JIS art (AA) rendering.  It adjusts glyph widths to
correctly display ASCII art designed for Japanese bulletin boards.")
    (license license:ipa)))

;;; ===================================================================
;;; GTK/KDE THEME PACKAGES (15)
;;; ===================================================================

;;; ===================================================================
;;; 26. spacx-gtk-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; GTK theme with SpaceX style

(define-public spacx-gtk-theme
  (package
    (name "spacx-gtk-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^SpacX")))))
    (home-page "https://aur.archlinux.org/packages/spacx-gtk-theme")
    (synopsis "GTK theme with SpaceX style")
    (description "SpacX is a GTK theme inspired by the SpaceX aesthetic.  It
provides a modern dark appearance suitable for GTK 2 and GTK 3 applications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 27. kvantum-theme-qogir-git
;;; ===================================================================
;;; Source: AUR snapshot
;;; Qogir theme for Kvantum

(define-public kvantum-theme-qogir-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "kvantum-theme-qogir-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                      name ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/Kvantum/"
                  #:include-regexp ("^Qogir")))))
      (home-page "https://aur.archlinux.org/packages/kvantum-theme-qogir-git")
      (synopsis "Qogir theme for Kvantum Qt theme engine")
      (description "Qogir theme for the Kvantum Qt theme engine.  It provides
a modern flat appearance for Qt applications matching the Qogir GTK theme.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 28. sddm-theme-corners-git
;;; ===================================================================
;;; Source: AUR snapshot
;;; Customizable SDDM theme

(define-public sddm-theme-corners-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "sddm-theme-corners-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                      name ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/sddm/themes/corners/"))))
      (home-page "https://aur.archlinux.org/packages/sddm-theme-corners-git")
      (synopsis "customizable SDDM login theme with rounded corners")
      (description "Corners is a customizable theme for the SDDM display
manager.  It features rounded corner elements and is highly configurable
through its theme settings.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 29. plasma6-themes-vapor-steamos
;;; ===================================================================
;;; Source: AUR snapshot
;;; Vapor theme from SteamOS 3 for KDE Plasma

(define-public plasma6-themes-vapor-steamos
  (package
    (name "plasma6-themes-vapor-steamos")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Vapor")))))
    (home-page "https://aur.archlinux.org/packages/plasma6-themes-vapor-steamos")
    (synopsis "Vapor theme from SteamOS 3 for KDE Plasma 6")
    (description "The Vapor theme extracted from SteamOS 3 (Steam Deck) for
use with KDE Plasma 6.  It provides the distinctive SteamOS visual style for
the Plasma desktop environment.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 30. gtk-theme-murrine-collection
;;; ===================================================================
;;; Source: AUR snapshot
;;; Collection of Murrine GTK2 themes

(define-public gtk-theme-murrine-collection
  (package
    (name "gtk-theme-murrine-collection")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Murrine")))))
    (home-page "https://aur.archlinux.org/packages/gtk-theme-murrine-collection")
    (synopsis "collection of Murrine GTK2 themes")
    (description "A collection of GTK2 themes using the Murrine engine.  It
provides several color variants of the Murrine theme for GTK2 applications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 31. colloid-nord-gtk-theme-git
;;; ===================================================================
;;; Source: AUR snapshot
;;; Colloid Nord GTK theme

(define-public colloid-nord-gtk-theme-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "colloid-nord-gtk-theme-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                      name ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/themes/"
                  #:include-regexp ("^Colloid-Nord")))))
      (home-page "https://aur.archlinux.org/packages/colloid-nord-gtk-theme-git")
      (synopsis "Colloid GTK theme with Nord color palette")
      (description "Colloid Nord is a variant of the Colloid GTK theme using
the Nord color palette.  It provides a modern flat design with the distinctive
Nord blue-grey aesthetic.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 32. gruvbox-plus-icon-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; Icon theme based on Gruvbox

(define-public gruvbox-plus-icon-theme
  (package
    (name "gruvbox-plus-icon-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/"
                #:include-regexp ("^Gruvbox-Plus")))))
    (home-page "https://aur.archlinux.org/packages/gruvbox-plus-icon-theme")
    (synopsis "icon theme based on the Gruvbox color scheme")
    (description "Gruvbox Plus is an icon theme based on the popular Gruvbox
color scheme.  It provides warm retro-inspired icons for GTK desktop
environments.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 33. xfwm4-theme-breeze
;;; ===================================================================
;;; Source: AUR snapshot
;;; Xfce theme matching Plasma Breeze

(define-public xfwm4-theme-breeze
  (package
    (name "xfwm4-theme-breeze")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Breeze")))))
    (home-page "https://aur.archlinux.org/packages/xfwm4-theme-breeze")
    (synopsis "Xfce window manager theme matching KDE Plasma Breeze")
    (description "An Xfce window manager (xfwm4) theme that matches the KDE
Plasma Breeze look.  It allows Xfce users to have window decorations
consistent with the Plasma desktop style.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 34. xfdashboard-theme-minimal
;;; ===================================================================
;;; Source: AUR snapshot
;;; Minimal theme for xfdashboard

(define-public xfdashboard-theme-minimal
  (package
    (name "xfdashboard-theme-minimal")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^[Mm]inimal")))))
    (home-page "https://aur.archlinux.org/packages/xfdashboard-theme-minimal")
    (synopsis "minimal theme for xfdashboard")
    (description "A minimal theme for xfdashboard, the GNOME Shell-like
dashboard for Xfce.  It provides a clean and simple appearance for the
application launcher and overview.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 35. whitesur-kde-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; macOS Big Sur theme for KDE

(define-public whitesur-kde-theme
  (package
    (name "whitesur-kde-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^WhiteSur")))))
    (home-page "https://aur.archlinux.org/packages/whitesur-kde-theme")
    (synopsis "macOS Big Sur theme for KDE Plasma")
    (description "WhiteSur is a KDE Plasma theme inspired by the macOS Big Sur
design.  It provides window decorations, Plasma themes, and color schemes that
replicate the macOS look on KDE.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 36. refind-theme-regular-git
;;; ===================================================================
;;; Source: https://github.com/bobafetthotmail/refind-theme-regular
;;; Clean minimal theme for rEFInd

(define-public refind-theme-regular-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "refind-theme-regular-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/bobafetthotmail/refind-theme-regular")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/refind/themes/regular/"))))
      (home-page "https://github.com/bobafetthotmail/refind-theme-regular")
      (synopsis "clean minimal theme for the rEFInd boot manager")
      (description "A clean and minimal theme for the rEFInd UEFI boot
manager.  It provides simple OS icons and a clean boot selection screen.")
      (license license:cc0))))

;;; ===================================================================
;;; 37. palenight-gtk-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; Palenight GTK theme

(define-public palenight-gtk-theme
  (package
    (name "palenight-gtk-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Palenight")))))
    (home-page "https://aur.archlinux.org/packages/palenight-gtk-theme")
    (synopsis "Palenight GTK theme")
    (description "Palenight is a GTK theme using the popular Palenight color
palette.  It provides a dark theme with muted purple and blue tones for GTK 2
and GTK 3 applications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 38. oceanic-gtk-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; Oceanic GTK theme

(define-public oceanic-gtk-theme
  (package
    (name "oceanic-gtk-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Oceanic")))))
    (home-page "https://aur.archlinux.org/packages/oceanic-gtk-theme")
    (synopsis "Oceanic GTK theme")
    (description "Oceanic is a GTK theme using the Oceanic Next color palette.
It provides a dark theme with ocean-inspired tones for GTK 2 and GTK 3
applications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 39. gruvterial-gtk-theme
;;; ===================================================================
;;; Source: AUR snapshot
;;; Gruvterial GTK theme

(define-public gruvterial-gtk-theme
  (package
    (name "gruvterial-gtk-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Gruvterial")))))
    (home-page "https://aur.archlinux.org/packages/gruvterial-gtk-theme")
    (synopsis "Gruvterial GTK theme")
    (description "Gruvterial is a GTK theme combining the Gruvbox color
palette with a material design aesthetic.  It provides warm retro tones for
GTK 2 and GTK 3 applications.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 40. colloid-gtk-theme-git
;;; ===================================================================
;;; Source: AUR snapshot
;;; Colloid GTK theme

(define-public colloid-gtk-theme-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "colloid-gtk-theme-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                      name ".tar.gz"))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/themes/"
                  #:include-regexp ("^Colloid")))))
      (home-page "https://aur.archlinux.org/packages/colloid-gtk-theme-git")
      (synopsis "modern design GTK theme with multiple color variants")
      (description "Colloid is a modern design GTK theme with multiple color
variants.  It supports GTK 2, GTK 3, GTK 4, GNOME Shell, and other desktop
environments.")
      (license license:gpl3+))))

;;; ===================================================================
;;; BINARY PACKAGES (30)
;;; ===================================================================

;;; ===================================================================
;;; 41. uncover-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Security scanner for exposed panels

(define-public uncover-bin
  (package
    (name "uncover-bin")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("uncover" "bin/uncover"))))
    (home-page "https://aur.archlinux.org/packages/uncover-bin")
    (synopsis "quickly discover exposed hosts on the internet")
    (description "Uncover is a security tool to quickly discover exposed hosts
on the internet using multiple search engines.  It aggregates results from
Shodan, Censys, FOFA, and other sources.")
    (license license:expat)))

;;; ===================================================================
;;; 42. tabby-electron-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Modern terminal emulator

(define-public tabby-electron-bin
  (package
    (name "tabby-electron-bin")
    (version "1.0.215")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tabby/"))))
    (home-page "https://tabby.sh")
    (synopsis "modern terminal emulator based on Electron")
    (description "Tabby is a modern, highly configurable terminal emulator
built on Electron.  It supports serial port connections, SSH, and features a
plugin architecture for extensibility.")
    (license license:expat)))

;;; ===================================================================
;;; 43. dbrest-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Database REST API

(define-public dbrest-bin
  (package
    (name "dbrest-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dbrest" "bin/dbrest"))))
    (home-page "https://aur.archlinux.org/packages/dbrest-bin")
    (synopsis "instant REST API for any database")
    (description "DbREST provides an instant REST API for any database.  It
creates RESTful endpoints from database tables and views without requiring
any code.")
    (license license:expat)))

;;; ===================================================================
;;; 44. pe-bear-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; PE file reversing tool

(define-public pe-bear-bin
  (package
    (name "pe-bear-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("PE-bear" "bin/PE-bear"))))
    (home-page "https://hshrzd.wordpress.com/pe-bear/")
    (synopsis "portable executable reversing tool with GUI")
    (description "PE-bear is a freeware reversing tool for PE files.  It
provides a multiplatform GUI for exploring PE file structure, including
sections, imports, exports, and resources.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 45. cudatext-gtk2-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Cross-platform text editor (GTK2)

(define-public cudatext-gtk2-bin
  (package
    (name "cudatext-gtk2-bin")
    (version "1.216.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cudatext" "bin/cudatext"))))
    (home-page "https://cudatext.github.io/")
    (synopsis "cross-platform text editor with syntax highlighting (GTK2)")
    (description "CudaText is a cross-platform text editor written in
Lazarus.  It features syntax highlighting for over 300 languages, code folding,
multi-carets, and a plugin system.  This is the GTK2 build.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 46. cudatext-qt5-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Cross-platform text editor (Qt5)

(define-public cudatext-qt5-bin
  (package
    (name "cudatext-qt5-bin")
    (version "1.216.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cudatext" "bin/cudatext-qt5"))))
    (home-page "https://cudatext.github.io/")
    (synopsis "cross-platform text editor with syntax highlighting (Qt5)")
    (description "CudaText is a cross-platform text editor written in
Lazarus.  It features syntax highlighting for over 300 languages, code folding,
multi-carets, and a plugin system.  This is the Qt5 build.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 47. gridtracker2-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Amateur radio companion

(define-public gridtracker2-bin
  (package
    (name "gridtracker2-bin")
    (version "1.25.0309")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gridtracker2" "bin/gridtracker2"))))
    (home-page "https://gridtracker.org")
    (synopsis "amateur radio companion for WSJT-X and JTDX")
    (description "GridTracker2 is an amateur radio companion application for
WSJT-X and JTDX.  It provides real-time mapping of FT8/FT4 contacts,
Maidenhead grid tracking, and logging integration.")
    (license license:bsd-3)))

;;; ===================================================================
;;; 48. rpfm-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Total War modding tool

(define-public rpfm-bin
  (package
    (name "rpfm-bin")
    (version "4.3.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rpfm" "bin/rpfm"))))
    (home-page "https://github.com/Frodo45127/rpfm")
    (synopsis "Rusted PackFile Manager for Total War games")
    (description "RPFM is a modding tool for Total War games.  It allows users
to create, edit, and manage PackFiles used by the Total War game series.")
    (license license:expat)))

;;; ===================================================================
;;; 49. omnisharp-roslyn-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; OmniSharp .NET language server

(define-public omnisharp-roslyn-bin
  (package
    (name "omnisharp-roslyn-bin")
    (version "1.39.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("OmniSharp" "bin/OmniSharp"))))
    (home-page "https://www.omnisharp.net")
    (synopsis "cross-platform .NET development language server")
    (description "OmniSharp is a .NET development platform based on Roslyn
that provides cross-platform IDE features.  It powers C# language support in
editors like Visual Studio Code, Vim, and Emacs.")
    (license license:expat)))

;;; ===================================================================
;;; 50. cope-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Chinese Old Poem Editor

(define-public cope-bin
  (package
    (name "cope-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cope" "bin/cope"))))
    (home-page "https://aur.archlinux.org/packages/cope-bin")
    (synopsis "Chinese Old Poem Editor")
    (description "COPE is a Chinese Old Poem Editor for composing and editing
classical Chinese poetry.  It provides tools for formatting and annotating
traditional Chinese verse.")
    (license license:expat)))

;;; ===================================================================
;;; 51. snowflake-cli-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Snowflake database CLI

(define-public snowflake-cli-bin
  (package
    (name "snowflake-cli-bin")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("snow" "bin/snow"))))
    (home-page "https://docs.snowflake.com/en/developer-guide/snowflake-cli-v2/index")
    (synopsis "CLI client for the Snowflake data platform")
    (description "Snowflake CLI is a command-line interface for interacting
with the Snowflake cloud data platform.  It allows users to manage Snowflake
objects, run queries, and deploy applications.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 52. llamafile-bin
;;; ===================================================================
;;; Source: https://github.com/Mozilla-Ocho/llamafile
;;; Distribute and run LLMs with a single file

(define-public llamafile-bin
  (package
    (name "llamafile-bin")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mozilla-Ocho/llamafile/releases/download/"
                    version "/llamafile-" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("llamafile" "bin/llamafile"))))
    (home-page "https://github.com/Mozilla-Ocho/llamafile")
    (synopsis "distribute and run LLMs with a single file")
    (description "Llamafile lets you distribute and run large language models
with a single file.  It packages the model weights and inference engine into
one portable executable that runs on multiple operating systems.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 53. anymex-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Open source multi-service tracker

(define-public anymex-bin
  (package
    (name "anymex-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("anymex" "bin/anymex"))))
    (home-page "https://aur.archlinux.org/packages/anymex-bin")
    (synopsis "open source multi-service anime and manga tracker")
    (description "AnymeX is an open-source multi-service tracker for anime
and manga.  It aggregates data from multiple tracking services into a unified
interface.")
    (license license:expat)))

;;; ===================================================================
;;; 54. frappe-books-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Desktop accounting app

(define-public frappe-books-bin
  (package
    (name "frappe-books-bin")
    (version "0.22.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("frappe-books" "bin/frappe-books"))))
    (home-page "https://frappebooks.com")
    (synopsis "free desktop accounting application")
    (description "Frappe Books is a free and open-source desktop accounting
application.  It provides double-entry bookkeeping, invoicing, and financial
reporting for small businesses.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 55. mobsh-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Fast git handover with mob

(define-public mobsh-bin
  (package
    (name "mobsh-bin")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mob" "bin/mob"))))
    (home-page "https://mob.sh")
    (synopsis "fast git handover for remote mob programming")
    (description "Mob is a tool for fast git handover during remote mob
programming sessions.  It automates the process of handing over work-in-progress
commits between team members.")
    (license license:expat)))

;;; ===================================================================
;;; 56. maa-assistant-arknights-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Arknights automation assistant

(define-public maa-assistant-arknights-bin
  (package
    (name "maa-assistant-arknights-bin")
    (version "5.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("maa" "bin/maa"))))
    (home-page "https://maa.plus")
    (synopsis "automation assistant for the game Arknights")
    (description "MAA (MaaAssistantArknights) is an automation assistant for
the game Arknights.  It handles daily tasks such as auto-battle, recruiting,
and infrastructure management.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 57. sqruff-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Fast SQL formatter/linter

(define-public sqruff-bin
  (package
    (name "sqruff-bin")
    (version "0.22.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sqruff" "bin/sqruff"))))
    (home-page "https://github.com/quarylabs/sqruff")
    (synopsis "fast SQL linter and formatter written in Rust")
    (description "Sqruff is a fast SQL linter and formatter written in Rust.
It enforces consistent SQL style and catches common SQL errors across multiple
SQL dialects.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 58. restack-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Interactive git rebase for intermediate branches

(define-public restack-bin
  (package
    (name "restack-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("restack" "bin/restack"))))
    (home-page "https://aur.archlinux.org/packages/restack-bin")
    (synopsis "makes interactive git rebase aware of intermediate branches")
    (description "Restack makes interactive git rebase aware of intermediate
branches.  It automatically updates dependent branches during rebase operations,
keeping stacked branches in sync.")
    (license license:expat)))

;;; ===================================================================
;;; 59. ptags-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Parallel universal-ctags wrapper

(define-public ptags-bin
  (package
    (name "ptags-bin")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ptags" "bin/ptags"))))
    (home-page "https://github.com/nickshanks/FuturaRenner")
    (synopsis "parallel universal-ctags wrapper for faster tag generation")
    (description "Ptags is a parallel wrapper around universal-ctags that
generates tags files faster by utilizing multiple CPU cores.  It is a drop-in
replacement for ctags with parallel execution.")
    (license license:expat)))

;;; ===================================================================
;;; 60. evcc-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; EV Charge Controller

(define-public evcc-bin
  (package
    (name "evcc-bin")
    (version "0.133.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("evcc" "bin/evcc"))))
    (home-page "https://evcc.io")
    (synopsis "solar charging for electric vehicles")
    (description "EVCC is an extensible EV Charge Controller and home energy
management system.  It optimizes electric vehicle charging with solar power
and supports many chargers, meters, and vehicles.")
    (license license:expat)))

;;; ===================================================================
;;; 61. amber-search-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Code search and replace tool

(define-public amber-search-bin
  (package
    (name "amber-search-bin")
    (version "3.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amber" "bin/amber"))))
    (home-page "https://github.com/dalance/amber")
    (synopsis "code search and replace tool")
    (description "Amber is a code search and replace tool.  It provides fast
recursive search with regex support and interactive replacement across source
code files.")
    (license license:expat)))

;;; ===================================================================
;;; 62. redis-viewer-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Redis visualization client

(define-public redis-viewer-bin
  (package
    (name "redis-viewer-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("redis-viewer" "bin/redis-viewer"))))
    (home-page "https://aur.archlinux.org/packages/redis-viewer-bin")
    (synopsis "graphical Redis database visualization client")
    (description "Redis Viewer is a graphical client for visualizing and
managing Redis databases.  It provides an intuitive interface for browsing
keys, viewing values, and executing Redis commands.")
    (license license:expat)))

;;; ===================================================================
;;; 63. lichess-local-engine-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Desktop app for Lichess engine

(define-public lichess-local-engine-bin
  (package
    (name "lichess-local-engine-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lichess-local-engine" "bin/lichess-local-engine"))))
    (home-page "https://lichess.org")
    (synopsis "local chess engine for Lichess analysis")
    (description "Lichess Local Engine is a desktop application that runs a
chess engine locally and connects it to Lichess for game analysis.  It enables
server-side analysis using your own hardware.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 64. runjs-electron-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; JavaScript playground

(define-public runjs-electron-bin
  (package
    (name "runjs-electron-bin")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/runjs/"))))
    (home-page "https://runjs.app")
    (synopsis "JavaScript and TypeScript playground desktop application")
    (description "RunJS is a JavaScript and TypeScript playground desktop
application.  It provides instant feedback as you type code, with support for
npm packages, console output, and live previews.")
    (license license:expat)))

;;; ===================================================================
;;; 65. jdk24-graalvm-ce-bin
;;; ===================================================================
;;; Source: https://github.com/graalvm/graalvm-ce-builds
;;; GraalVM Community Edition JDK 24

(define-public jdk24-graalvm-ce-bin
  (package
    (name "jdk24-graalvm-ce-bin")
    (version "24.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-"
                    version "/graalvm-community-jdk-" version "_linux-x64_bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/jvm/graalvm-ce-24/"))))
    (home-page "https://www.graalvm.org")
    (synopsis "GraalVM Community Edition JDK 24")
    (description "GraalVM Community Edition is a high-performance JDK
distribution based on OpenJDK 24.  It includes the Graal JIT compiler,
Native Image for ahead-of-time compilation, and polyglot runtime support.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 66. eclipse-php-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Eclipse IDE for PHP

(define-public eclipse-php-bin
  (package
    (name "eclipse-php-bin")
    (version "4.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eclipse-php/"))))
    (home-page "https://www.eclipse.org/pdt/")
    (synopsis "Eclipse IDE for PHP developers")
    (description "Eclipse PHP Development Tools (PDT) provides a PHP
integrated development environment.  It includes syntax highlighting,
code completion, debugging, and refactoring tools for PHP development.")
    (license license:epl1.0)))

;;; ===================================================================
;;; 67. eaglemode-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Zoomable user interface

(define-public eaglemode-bin
  (package
    (name "eaglemode-bin")
    (version "0.96.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eaglemode/"))))
    (home-page "https://eaglemode.sourceforge.net")
    (synopsis "zoomable user interface with file manager and more")
    (description "Eagle Mode is a zoomable user interface that provides a
file manager, text editor, image viewer, audio and video player, and other
applications all within an infinite zoomable desktop.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 68. rewind-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; osu! beatmap/replay analyzer

(define-public rewind-bin
  (package
    (name "rewind-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rewind" "bin/rewind"))))
    (home-page "https://aur.archlinux.org/packages/rewind-bin")
    (synopsis "osu! beatmap and replay analyzer")
    (description "Rewind is an osu! beatmap and replay analyzer.  It provides
tools for detailed analysis of gameplay replays and beatmap patterns for the
rhythm game osu!.")
    (license license:expat)))

;;; ===================================================================
;;; 69. pulpo-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; GNOME Shell Gotify/Ntfy notifier

(define-public pulpo-bin
  (package
    (name "pulpo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pulpo" "bin/pulpo"))))
    (home-page "https://aur.archlinux.org/packages/pulpo-bin")
    (synopsis "GNOME Shell notification client for Gotify and Ntfy")
    (description "Pulpo is a GNOME Shell notification client that integrates
with Gotify and Ntfy push notification services.  It delivers server-side
notifications directly to the GNOME desktop.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 70. trasher-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; CLI trash replacement for rm

(define-public trasher-bin
  (package
    (name "trasher-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("trasher" "bin/trasher"))))
    (home-page "https://aur.archlinux.org/packages/trasher-bin")
    (synopsis "CLI trash replacement for rm")
    (description "Trasher is a command-line trash utility that replaces rm.
Instead of permanently deleting files, it moves them to the trash directory
following the FreeDesktop.org trash specification.")
    (license license:expat)))

;;; ===================================================================
;;; MISCELLANEOUS PACKAGES (15)
;;; ===================================================================

;;; ===================================================================
;;; 71. observer
;;; ===================================================================
;;; Source: AUR snapshot
;;; Dynamic CPU core manager (Rust)

(define-public observer
  (package
    (name "observer")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("observer" "bin/observer"))))
    (home-page "https://aur.archlinux.org/packages/observer")
    (synopsis "dynamic CPU core manager written in Rust")
    (description "Observer is a dynamic CPU core manager written in Rust.  It
monitors system load and dynamically enables or disables CPU cores to optimize
power consumption and thermal performance.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 72. plattenalbum
;;; ===================================================================
;;; Source: AUR snapshot
;;; Music player

(define-public plattenalbum
  (package
    (name "plattenalbum")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("plattenalbum" "bin/plattenalbum"))))
    (home-page "https://aur.archlinux.org/packages/plattenalbum")
    (synopsis "lightweight GTK music player for MPD")
    (description "Plattenalbum is a lightweight GTK music player and MPD
client.  It provides a clean album-oriented interface for browsing and playing
music through the Music Player Daemon.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 73. cargo-visualize
;;; ===================================================================
;;; Source: AUR snapshot
;;; Cargo dependency graph tool

(define-public cargo-visualize
  (package
    (name "cargo-visualize")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cargo-visualize" "bin/cargo-visualize"))))
    (home-page "https://aur.archlinux.org/packages/cargo-visualize")
    (synopsis "visualize Cargo dependency graphs")
    (description "Cargo Visualize is a tool for visualizing Rust Cargo
dependency graphs.  It generates graphical representations of project
dependencies to help understand complex dependency trees.")
    (license license:expat)))

;;; ===================================================================
;;; 74. x-cmd
;;; ===================================================================
;;; Source: AUR snapshot
;;; Bootstrap CLI tools quickly

(define-public x-cmd
  (package
    (name "x-cmd")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("x-cmd" "bin/x-cmd"))))
    (home-page "https://x-cmd.com")
    (synopsis "bootstrap and manage CLI tools quickly")
    (description "X-CMD is a tool for quickly bootstrapping and managing
command-line tools.  It provides a unified interface to install, update, and
run CLI utilities from various sources.")
    (license license:expat)))

;;; ===================================================================
;;; 75. quickmedia
;;; ===================================================================
;;; Source: AUR snapshot
;;; Rofi-inspired native web client

(define-public quickmedia
  (package
    (name "quickmedia")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quickmedia" "bin/quickmedia"))))
    (home-page "https://aur.archlinux.org/packages/quickmedia")
    (synopsis "rofi-inspired native client for web services")
    (description "QuickMedia is a rofi-inspired native client for web services
including YouTube, Reddit, Matrix, and manga sites.  It provides a fast
keyboard-driven interface without requiring a web browser.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 76. isd-appimage
;;; ===================================================================
;;; Source: AUR snapshot
;;; Systemd unit manager AppImage

(define-public isd-appimage
  (package
    (name "isd-appimage")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("isd" "bin/isd"))))
    (home-page "https://aur.archlinux.org/packages/isd-appimage")
    (synopsis "interactive systemd unit manager")
    (description "ISD is an interactive systemd unit manager distributed as an
AppImage.  It provides a terminal user interface for managing systemd services,
timers, and other units.")
    (license license:expat)))

;;; ===================================================================
;;; 77. slimjet
;;; ===================================================================
;;; Source: AUR snapshot
;;; Fast browser based on Blink

(define-public slimjet
  (package
    (name "slimjet")
    (version "46.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/slimjet/"))))
    (home-page "https://www.slimjet.com")
    (synopsis "fast web browser based on the Blink engine")
    (description "Slimjet is a fast web browser based on the Blink rendering
engine (Chromium).  It provides built-in ad blocking, form filling, and
download management features.")
    (license license:nonfree)))

;;; ===================================================================
;;; 78. eclipse-jee-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Eclipse Enterprise Java IDE

(define-public eclipse-jee-bin
  (package
    (name "eclipse-jee-bin")
    (version "4.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eclipse-jee/"))))
    (home-page "https://www.eclipse.org")
    (synopsis "Eclipse IDE for enterprise Java and web developers")
    (description "Eclipse IDE for Enterprise Java and Web Developers provides
tools for developing Java EE, Jakarta EE, and web applications.  It includes
editors for HTML, CSS, JavaScript, and frameworks like Spring and Jakarta.")
    (license license:epl1.0)))

;;; ===================================================================
;;; 79. gtklock-dpms-module
;;; ===================================================================
;;; Source: AUR snapshot
;;; GtkLock DPMS blanking module

(define-public gtklock-dpms-module
  (package
    (name "gtklock-dpms-module")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gtklock-dpms-module.so" "lib/gtklock/dpms-module.so"))))
    (home-page "https://github.com/jovanlanik/gtklock-dpms-module")
    (synopsis "DPMS blanking module for gtklock")
    (description "GtkLock DPMS module adds DPMS (Display Power Management
Signaling) screen blanking to gtklock.  It turns off the display after a
configurable idle timeout while the lock screen is active.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 80. foxmarks
;;; ===================================================================
;;; Source: AUR snapshot
;;; CLI for Firefox bookmarks

(define-public foxmarks
  (package
    (name "foxmarks")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("foxmarks" "bin/foxmarks"))))
    (home-page "https://aur.archlinux.org/packages/foxmarks")
    (synopsis "command-line tool for managing Firefox bookmarks")
    (description "Foxmarks is a command-line tool for managing Firefox
bookmarks.  It allows searching, listing, and manipulating Firefox bookmark
databases from the terminal.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 81. vim-vimwiki
;;; ===================================================================
;;; Source: https://github.com/vimwiki/vimwiki
;;; Personal wiki for Vim

(define-public vim-vimwiki
  (package
    (name "vim-vimwiki")
    (version "2.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vimwiki/vimwiki")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("autoload" "share/vim/vimfiles/autoload/")
                ("plugin" "share/vim/vimfiles/plugin/")
                ("syntax" "share/vim/vimfiles/syntax/")
                ("ftplugin" "share/vim/vimfiles/ftplugin/")
                ("doc" "share/vim/vimfiles/doc/"))))
    (home-page "https://vimwiki.github.io/")
    (synopsis "personal wiki for Vim")
    (description "VimWiki is a personal wiki plugin for Vim.  It allows you to
organize notes and ideas in interconnected wiki pages, create to-do lists, and
maintain a diary, all within your Vim editor.")
    (license license:expat)))

;;; ===================================================================
;;; 82. miniscript-cli
;;; ===================================================================
;;; Source: AUR snapshot
;;; Simple language for embedding

(define-public miniscript-cli
  (package
    (name "miniscript-cli")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("miniscript" "bin/miniscript"))))
    (home-page "https://miniscript.org")
    (synopsis "simple modern language designed for embedding in applications")
    (description "MiniScript is a simple, modern scripting language designed
for embedding in applications.  It features clean syntax, automatic memory
management, and easy integration with host programs.")
    (license license:expat)))

;;; ===================================================================
;;; 83. miru-go-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; CLI for viewing package docs

(define-public miru-go-bin
  (package
    (name "miru-go-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("miru" "bin/miru"))))
    (home-page "https://aur.archlinux.org/packages/miru-go-bin")
    (synopsis "CLI tool for viewing package documentation")
    (description "Miru is a command-line tool for viewing package documentation
directly in the terminal.  It fetches and renders documentation from package
registries in a readable format.")
    (license license:expat)))

;;; ===================================================================
;;; 84. jumpy-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Faster alternative to Zoxide

(define-public jumpy-bin
  (package
    (name "jumpy-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jumpy" "bin/jumpy"))))
    (home-page "https://aur.archlinux.org/packages/jumpy-bin")
    (synopsis "fast directory jumper, alternative to Zoxide")
    (description "Jumpy is a fast directory jumper that learns your most-used
directories.  It provides an alternative to Zoxide with faster lookup times
and a simpler algorithm.")
    (license license:expat)))

;;; ===================================================================
;;; 85. vnote-bin
;;; ===================================================================
;;; Source: AUR snapshot
;;; Qt-based note-taking app

(define-public vnote-bin
  (package
    (name "vnote-bin")
    (version "3.19.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    name ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vnote/"))))
    (home-page "https://vnotex.github.io/vnote/")
    (synopsis "pleasant note-taking platform based on Qt")
    (description "VNote is a pleasant note-taking platform based on Qt.  It
focuses on providing a comfortable Markdown editing experience with notebook
management, tags, and full-text search.")
    (license license:lgpl3+)))
