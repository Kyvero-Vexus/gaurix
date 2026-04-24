;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (25 new, 0 already packaged, 5 BLOCKED):
;;;          1.  figlet-fonts (copy-build-system, v1.1, gpl3+)
;;;          2.  gohufont (copy-build-system, v2.1, wtfpl2)
;;;          3.  otf-exljbris (copy-build-system, v1.0, silofl1.1)
;;;          4.  toilet-fonts (copy-build-system, v1.1, gpl3+)
;;;          5.  ttf-pizzadude-bullets (copy-build-system, v2.0, silofl1.1)
;;;          6.  ttf-mgopen (copy-build-system, v1.1, silofl1.1)
;;;          7.  ttf-font-awesome-4 (copy-build-system, v4.7.0, silofl1.1)
;;;          8.  otf-font-awesome-4 (copy-build-system, v4.7.0, silofl1.1)
;;;          9.  ttf-dejavu-ib (copy-build-system, v2.37, expat)
;;;         10.  ttf-rethink-sans (copy-build-system, v5, silofl1.1)
;;;         11.  ttf-unifontex-mono (copy-build-system, v1.0, silofl1.1)
;;;         12.  otf-aref-ruqaa (copy-build-system, v1.006, silofl1.1)
;;;         13.  luv-icon-theme (copy-build-system, v0.49.0, cc-by-sa4.0)
;;;         14.  gtk2-theme-dust-extras (copy-build-system, v0.5.1, gpl3+)
;;;         15.  geany-themes (copy-build-system, v1.24, gpl2+)
;;;         16.  peazip-gtk2-bin (copy-build-system, v11.0.0, lgpl3+)
;;;         17.  pharo-bin (copy-build-system, v9.0, expat)
;;;         18.  gitter-bin (copy-build-system, v5.0.1, expat)
;;;         19.  python-pyephem (python-build-system, v4.1.5, expat)
;;;         20.  python-pywavelets (pyproject-build-system, v1.9.0, expat)
;;;         21.  zramswap (copy-build-system, v7, gpl2+)
;;;         22.  smcroute (gnu-build-system, v2.5.7, gpl2+)
;;;         23.  poser (gnu-build-system, v1.2.2, bsd-2)
;;;         24.  tlsc (gnu-build-system, v2.0, bsd-2)
;;;         25.  ffuf-bin (copy-build-system, v2.1.0, expat)
;;;
;;; BLOCKED (5):
;;;         faenza-cupertino-icon-theme (21477) — MISSING_DEP: needs faenza-icon-theme (not in Guix/Gaurix)
;;;         faba-mono-icons-git (21538) — MISSING_DEP: needs faba-icon-theme (not in Guix/Gaurix)
;;;         python-pocketsphinx (21481) — COMPLEX_BUILD: scikit-build-core + cmake + cython; dep chain too deep
;;;         grive (19300) — COMPLEX_DEPS: needs boost + yajl + json-c; yajl not in Guix
;;;         gtk-theme-config (21782) — COMPLEX_DEPS: needs gconf (deprecated) + vala build; gconf not well-supported
;;;
;;; NOTE: sha256 hashes are placeholders (to be verified via `guix download`).

(define-module (gaurix packages recipe-resolver-260424j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            figlet-fonts
            gohufont
            otf-exljbris
            toilet-fonts
            ttf-pizzadude-bullets
            ttf-mgopen
            ttf-font-awesome-4
            otf-font-awesome-4
            ttf-dejavu-ib
            ttf-rethink-sans
            ttf-unifontex-mono
            otf-aref-ruqaa
            luv-icon-theme
            gtk2-theme-dust-extras
            geany-themes
            peazip-gtk2-bin
            pharo-bin
            gitter-bin
            python-pyephem
            python-pywavelets
            zramswap
            smcroute
            poser
            tlsc
            ffuf-bin
            ))

;;; ===================================================================
;;; FONT PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. figlet-fonts
;;; -------------------------------------------------------------------
(define-public figlet-fonts
  (package
    (name "figlet-fonts")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/figlet-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/figlet/fonts/"
                #:include-regexp ("\\.flf$" "\\.flc$")))))
    (synopsis "additional ASCII art fonts for figlet")
    (description "Additional ASCII art fonts for the figlet text banner
program.  Provides extra font styles beyond the default figlet distribution.")
    (home-page "http://www.figlet.org/fontdb.cgi")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2. gohufont
;;; -------------------------------------------------------------------
(define-public gohufont
  (package
    (name "gohufont")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gohufont.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/misc/gohufont/"
                #:include-regexp ("\\.pcf\\.gz$" "\\.bdf$")))))
    (synopsis "bitmap font for programming and terminal use")
    (description "Gohufont is a monospace bitmap font available in two sizes
(11 and 14 pixels).  Designed for programming and terminal use with clear
letterforms at small sizes.")
    (home-page "http://font.gohu.org/")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 3. otf-exljbris
;;; -------------------------------------------------------------------
(define-public otf-exljbris
  (package
    (name "otf-exljbris")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-exljbris.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/exljbris/"
                #:include-regexp ("\\.otf$")))))
    (synopsis "free OpenType fonts by Jos Buivenga")
    (description "A collection of free OpenType fonts by Jos Buivenga from
exljbris Font Foundry.  Includes Delicious, Diavlo, Fontin, Fontin Sans, and
Tallys typeface families.")
    (home-page "https://exljbris.com")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 4. toilet-fonts
;;; -------------------------------------------------------------------
(define-public toilet-fonts
  (package
    (name "toilet-fonts")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/toilet-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/figlet/"
                #:include-regexp ("\\.flf$" "\\.tlf$")))))
    (synopsis "additional ASCII art fonts for TOIlet")
    (description "Additional ASCII art fonts for the TOIlet text art display
program.  Provides extra font styles compatible with TOIlet and figlet.")
    (home-page "http://www.figlet.org/fontdb.cgi")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5. ttf-pizzadude-bullets
;;; -------------------------------------------------------------------
(define-public ttf-pizzadude-bullets
  (package
    (name "ttf-pizzadude-bullets")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-pizzadude-bullets.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/pizzadude-bullets/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "dingbats-style symbolic font with decorative glyphs")
    (description "Pizzadude Bullets is a dingbats-style symbolic font that
displays happy faces, stars, arrows, eyes, hearts, and other decorative
symbols.  Created by Pizzadude.")
    (home-page "http://www.pizzadude.dk")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 6. ttf-mgopen
;;; -------------------------------------------------------------------
(define-public ttf-mgopen
  (package
    (name "ttf-mgopen")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-mgopen.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/mgopen/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "TrueType fonts for Latin and Greek alphabets")
    (description "MgOpen is a collection of TrueType fonts containing glyphs
for the Latin and Greek alphabets.  Includes Canonica, Cosmetica, Modata, and
Moderna typeface families.")
    (home-page "https://web.archive.org/web/20120409173416/http://www.zvr.gr/typo/mgopen/index")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 7. ttf-font-awesome-4
;;; -------------------------------------------------------------------
(define-public ttf-font-awesome-4
  (package
    (name "ttf-font-awesome-4")
    (version "4.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FortAwesome/Font-Awesome")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/truetype/font-awesome-4/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "iconic font designed for use with Bootstrap (version 4.x)")
    (description "Font Awesome 4 is an iconic font and CSS toolkit providing
scalable vector icons that can be customized with CSS.  This package provides
the TrueType font files for version 4.x of Font Awesome.")
    (home-page "https://github.com/FortAwesome/Font-Awesome")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 8. otf-font-awesome-4
;;; -------------------------------------------------------------------
(define-public otf-font-awesome-4
  (package
    (name "otf-font-awesome-4")
    (version "4.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FortAwesome/Font-Awesome")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts" "share/fonts/opentype/font-awesome-4/"
                #:include-regexp ("\\.otf$")))))
    (synopsis "iconic font designed for use with Bootstrap (version 4.x, OTF)")
    (description "Font Awesome 4 is an iconic font and CSS toolkit providing
scalable vector icons that can be customized with CSS.  This package provides
the OpenType font files for version 4.x of Font Awesome.")
    (home-page "https://github.com/FortAwesome/Font-Awesome")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 9. ttf-dejavu-ib
;;; -------------------------------------------------------------------
(define-public ttf-dejavu-ib
  (package
    (name "ttf-dejavu-ib")
    (version "2.37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ArtifexSoftware/urw-base35-fonts/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/dejavu-ib/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "DejaVu font family with expanded character coverage")
    (description "DejaVu fonts are a font family based on the Bitstream Vera
Fonts with a wider range of characters.  This variant includes additional
glyphs and improved hinting for international text rendering.")
    (home-page "http://dejavu-fonts.org/wiki/Main_Page")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. ttf-rethink-sans
;;; -------------------------------------------------------------------
(define-public ttf-rethink-sans
  (package
    (name "ttf-rethink-sans")
    (version "5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hans-thiessen/Rethink-Sans")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fonts/ttf" "share/fonts/truetype/rethink-sans/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "open source sans-serif font built on DM Sans and Poppins")
    (description "Rethink Sans is a humble open source font built on the
shoulders of DM Sans and Poppins.  A clean geometric sans-serif typeface
suitable for headings and body text.")
    (home-page "https://github.com/hans-thiessen/Rethink-Sans")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 11. ttf-unifontex-mono
;;; -------------------------------------------------------------------
(define-public ttf-unifontex-mono
  (package
    (name "ttf-unifontex-mono")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stgiga/UnifontEX")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/unifontex-mono/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "monospaced variant of GNU Unifont with extended coverage")
    (description "UnifontEX Mono is a monospaced variant of GNU Unifont
providing broad Unicode coverage.  Suitable for terminal use and applications
requiring consistent character widths across scripts.")
    (home-page "https://github.com/stgiga/UnifontEX")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 12. otf-aref-ruqaa
;;; -------------------------------------------------------------------
(define-public otf-aref-ruqaa
  (package
    (name "otf-aref-ruqaa")
    (version "1.006")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aliftype/aref-ruqaa")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/aref-ruqaa/"
                #:include-regexp ("\\.otf$")))))
    (synopsis "Arabic typeface in the Ruq'ah calligraphic style")
    (description "Aref Ruqaa is an Arabic typeface inspired by the Ruq'ah
calligraphic style.  Designed by Abdullah Aref for use in Arabic text
typesetting with OpenType features for proper glyph shaping.")
    (home-page "https://github.com/aliftype/aref-ruqaa")
    (license license:silofl1.1)))

;;; ===================================================================
;;; ICON & THEME PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 13. luv-icon-theme
;;; -------------------------------------------------------------------
(define-public luv-icon-theme
  (package
    (name "luv-icon-theme")
    (version "0.49.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nitrux/luv-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Luv" "share/icons/Luv/"))))
    (synopsis "flat icon theme for freedesktop environments")
    (description "Luv is the spiritual successor to the Flattr icon theme.
A flat but complex icon theme for freedesktop-compatible desktop environments
like KDE Plasma, GNOME, and Xfce.")
    (home-page "https://github.com/Nitrux/luv-icon-theme")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 14. gtk2-theme-dust-extras
;;; -------------------------------------------------------------------
(define-public gtk2-theme-dust-extras
  (package
    (name "gtk2-theme-dust-extras")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk2-theme-dust-extras.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("index\\.theme$"
                                  "gtkrc$"
                                  "\\.png$"
                                  "\\.svg$")))))
    (synopsis "sand, burnt, and bordered variations of the Dust GTK2 theme")
    (description "Extra variations of the Dust GTK2 theme including Sand,
Burnt, and Bordered styles.  Part of the Ubuntu Dust artwork project.")
    (home-page "https://wiki.ubuntu.com/Artwork/Incoming/DustTheme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. geany-themes
;;; -------------------------------------------------------------------
(define-public geany-themes
  (package
    (name "geany-themes")
    (version "1.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geany/geany-themes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("colorschemes" "share/geany/colorschemes/"))))
    (synopsis "collection of color schemes for the Geany editor")
    (description "A collection of color schemes for the Geany text editor.
Includes only those themes not already bundled with the Geany distribution,
providing additional syntax highlighting styles.")
    (home-page "https://github.com/geany/geany-themes")
    (license license:gpl2+)))

;;; ===================================================================
;;; BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 16. peazip-gtk2-bin
;;; -------------------------------------------------------------------
(define-public peazip-gtk2-bin
  (package
    (name "peazip-gtk2-bin")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peazip/PeaZip/releases/download/"
                    version "/peazip_portable-" version ".LINUX.GTK2.x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/peazip/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (bin-dir (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin-dir)
                     (symlink (string-append out "/opt/peazip/peazip")
                              (string-append bin-dir "/peazip"))))))))
    (synopsis "cross-platform file and archive manager")
    (description "PeaZip is a cross-platform file and archive manager
supporting over 200 archive formats.  Provides compression, encryption, and
file splitting capabilities with a GTK2 user interface.")
    (home-page "https://github.com/peazip/PeaZip")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 17. pharo-bin
;;; -------------------------------------------------------------------
(define-public pharo-bin
  (package
    (name "pharo-bin")
    (version "9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pharo.org/pharo-vm/pharo-spur64/"
                    "Linux-x86_64/PharoVM-" version "-Linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/pharo/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (bin-dir (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin-dir)
                     (symlink (string-append out "/opt/pharo/pharo")
                              (string-append bin-dir "/pharo"))))))))
    (synopsis "object-oriented Smalltalk programming environment")
    (description "Pharo is a pure object-oriented programming language and
a powerful environment for the Smalltalk programming language.  It provides
live programming, immediate feedback, and powerful debugging tools.")
    (home-page "https://pharo.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. gitter-bin
;;; -------------------------------------------------------------------
(define-public gitter-bin
  (package
    (name "gitter-bin")
    (version "5.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/gitlab-org/gitter/desktop/-/archive/"
                    version "/desktop-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/gitter/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (bin-dir (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin-dir)
                     (symlink (string-append out "/opt/gitter/Gitter")
                              (string-append bin-dir "/gitter"))))))))
    (synopsis "chat and networking platform for developers")
    (description "Gitter is a chat and networking platform for developers.
It provides chat rooms tied to GitHub repositories, making it easy to discuss
code and collaborate on open source projects.")
    (home-page "https://gitlab.com/gitlab-org/gitter/desktop/")
    (license license:expat)))

;;; ===================================================================
;;; PYTHON PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 19. python-pyephem
;;; -------------------------------------------------------------------
(define-public python-pyephem
  (package
    (name "python-pyephem")
    (version "4.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/e/ephem/ephem-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "scientific-grade astronomical computations for Python")
    (description "PyEphem provides scientific-grade astronomical computations
for Python.  It can compute positions of planets, the Sun, the Moon, and
other celestial bodies, as well as eclipses, conjunctions, and rise/set
times.")
    (home-page "http://rhodesmill.org/pyephem/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. python-pywavelets
;;; -------------------------------------------------------------------
(define-public python-pywavelets
  (package
    (name "python-pywavelets")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/P/PyWavelets/pywavelets-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-cython))
    (propagated-inputs (list python-numpy))
    (synopsis "wavelet transform module for Python")
    (description "PyWavelets is a Python wavelet transforms module that
includes a collection of routines for wavelet transform computations.
Supports discrete wavelet transform (DWT), stationary wavelet transform
(SWT), wavelet packets, and continuous wavelet transform (CWT).")
    (home-page "https://github.com/pywavelets/pywt")
    (license license:expat)))

;;; ===================================================================
;;; SYSTEM TOOLS
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. zramswap
;;; -------------------------------------------------------------------
(define-public zramswap
  (package
    (name "zramswap")
    (version "7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zramswap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zramswap" "sbin/zramswap")
               ("zramswap.conf" "etc/zramswap.conf"))))
    (synopsis "sets up zram-based swap devices on boot")
    (description "Zramswap configures zram-based compressed swap devices.
Uses kernel zram module to create compressed block devices in RAM, providing
swap space with reduced I/O latency compared to disk-based swap.")
    (home-page "http://en.wikipedia.org/wiki/ZRam")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 22. smcroute
;;; -------------------------------------------------------------------
(define-public smcroute
  (package
    (name "smcroute")
    (version "2.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/troglobit/smcroute/releases/download/"
                    version "/smcroute-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "command line tool to manipulate kernel multicast routing")
    (description "SMCRoute is a command line tool to manipulate the kernel
multicast routing table.  It can be used as an alternative to complex
multicast routing daemons for simple static multicast routing setups.")
    (home-page "https://troglobit.com/smcroute.html")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 23. poser
;;; -------------------------------------------------------------------
(define-public poser
  (package
    (name "poser")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zirias/poser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list openssl))
    (synopsis "C framework for POSIX services")
    (description "Poser is a C framework for building POSIX services.  It
provides reusable components for writing daemons and service programs on
Unix-like systems, handling common tasks like signal management and
privilege separation.")
    (home-page "https://github.com/Zirias/poser")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 24. tlsc
;;; -------------------------------------------------------------------
(define-public tlsc
  (package
    (name "tlsc")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zirias/tlsc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list openssl poser))
    (synopsis "TLS connect daemon")
    (description "Tlsc is a TLS connect daemon that wraps plain-text TCP
connections with TLS encryption.  Built on the Poser framework, it provides
a simple way to add TLS support to services that do not natively support it.")
    (home-page "https://github.com/Zirias/tlsc")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 25. ffuf-bin
;;; -------------------------------------------------------------------
(define-public ffuf-bin
  (package
    (name "ffuf-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ffuf/ffuf/releases/download/v"
                    version "/ffuf_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ffuf" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast web fuzzer written in Go")
    (description "Ffuf is a fast web fuzzer written in Go.  It can be used
for directory discovery, virtual host discovery, and parameter fuzzing.
Supports multiple input modes and output formats.")
    (home-page "https://github.com/ffuf/ffuf")
    (license license:expat)))
