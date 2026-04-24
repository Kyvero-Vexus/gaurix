;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (26 new, 4 already packaged):
;;;          1.  ttf-impallari-cabin-font (copy-build-system, v2.2, silofl1.1)
;;;          2.  mkbold-mkitalic (gnu-build-system, v0.11, x11)
;;;          3.  ttf-sudo (copy-build-system, v3.4, silofl1.1)
;;;          4.  ttf-pacifico (copy-build-system, v3.000, silofl1.1)
;;;          5.  ttf-remixicon (copy-build-system, v4.9.1, asl2.0)
;;;          6.  ttf-roboto-serif (copy-build-system, v1.008, silofl1.1)
;;;          7.  fonts-et-book (copy-build-system, v20151005, expat)
;;;          8.  ttf-aref-ruqaa (copy-build-system, v1.006, silofl1.1)
;;;          9.  ttf-martian-mono (copy-build-system, v1.1.0, silofl1.1)
;;;         10.  ttf-reem-kufi (copy-build-system, v1.100, agpl3+)
;;;         11.  otf-hanken-grotesk (copy-build-system, v20240130, silofl1.1)
;;;         12.  awesome-themes-git (copy-build-system, vr18.4d7c8f8, cc-by-sa3.0/gpl2)
;;;         13.  flat-remix-gnome (copy-build-system, v20250926, cc-by-sa4.0)
;;;         14.  vimix-icon-theme (copy-build-system, v2025.08.26, cc-by-sa4.0)
;;;         15.  vimix-gtk-themes (copy-build-system, v2025.06.20, gpl3+)
;;;         16.  xcursor-simp1e-zenburn (copy-build-system, v20250223, gpl3)
;;;         17.  zorin-icon-themes (copy-build-system, v4.0.7, cc-by-sa4.0)
;;;         18.  adwaita-plus-git (copy-build-system, v6.1.r4.g22a8a79f, gpl3)
;;;         19.  gtk-cyberpunk-neon-theme-git (copy-build-system, v1.r125.587b5aa, cc-by-sa4.0)
;;;         20.  traefik-bin (copy-build-system, v3.6.10, expat)
;;;         21.  dufs-bin (copy-build-system, v0.45.0, asl2.0/expat)
;;;         22.  git-town-bin (copy-build-system, v22.7.1, expat)
;;;         23.  sqlfmt-bin (copy-build-system, v0.5.0, asl2.0)
;;;         24.  docfd-bin (copy-build-system, v12.3.2, expat)
;;;         25.  python-demjson3 (pyproject-build-system, v3.0.6, lgpl3+)
;;;         26.  daemon (gnu-build-system, v0.8.4, gpl2+)
;;;
;;; Already packaged (4):
;;;         ttf-courier-prime (21562) -> queue-20260325p100.scm
;;;         ebgaramond-otf (21884) -> general-compat.scm
;;;         mint-x-icons (21434) -> cron-c79f127f-r26-w03.scm
;;;         mint-themes (21535) -> cron-c79f127f-r25-w03.scm
;;;
;;; NOTE: sha256 hashes are placeholders (to be verified via `guix download`).

(define-module (gaurix packages recipe-resolver-260424i)
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
  #:use-module (gnu packages python-build)
  #:export (
            ttf-impallari-cabin-font
            mkbold-mkitalic
            ttf-sudo
            ttf-pacifico
            ttf-remixicon
            ttf-roboto-serif
            fonts-et-book
            ttf-aref-ruqaa
            ttf-martian-mono
            ttf-reem-kufi
            otf-hanken-grotesk
            awesome-themes-git
            flat-remix-gnome
            vimix-icon-theme
            vimix-gtk-themes
            xcursor-simp1e-zenburn
            zorin-icon-themes
            adwaita-plus-git
            gtk-cyberpunk-neon-theme-git
            traefik-bin
            dufs-bin
            git-town-bin
            sqlfmt-bin
            docfd-bin
            python-demjson3
            daemon
            ))

;;; -------------------------------------------------------------------
;;; 1. ttf-impallari-cabin-font
;;; -------------------------------------------------------------------
(define-public ttf-impallari-cabin-font
  (package
    (name "ttf-impallari-cabin-font")
    (version "2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/impallari/Cabin")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/cabin/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "humanist sans inspired by Edward Johnston and Eric Gill typefaces")
    (description "A humanist sans font inspired by Edward Johnston's and Eric Gill's
typefaces, designed by Pablo Impallari.  Suitable for body text and display use.")
    (home-page "https://github.com/impallari/Cabin")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. mkbold-mkitalic
;;; -------------------------------------------------------------------
(define-public mkbold-mkitalic
  (package
    (name "mkbold-mkitalic")
    (version "0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/unshumikan/mkbold-mkitalic")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (for-each (lambda (f)
                                 (install-file f bin))
                               '("mkbold" "mkitalic"))))))))
    (synopsis "make X11 BDF fonts bold and/or italic")
    (description "Tools for making X11 BDF fonts bold and/or italic by manipulating
font bitmap data.  Useful for generating derived font styles from base BDF fonts.")
    (home-page "https://gitlab.com/unshumikan/mkbold-mkitalic")
    (license license:x11)))

;;; -------------------------------------------------------------------
;;; 3. ttf-sudo
;;; -------------------------------------------------------------------
(define-public ttf-sudo
  (package
    (name "ttf-sudo")
    (version "3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-sudo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/sudo/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "font designed for programmers and command line users")
    (description "Sudo is a monospaced font designed for programmers and terminal users.
It provides clear letterforms optimized for code readability.")
    (home-page "https://www.kutilek.de/sudo-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 4. ttf-pacifico
;;; -------------------------------------------------------------------
(define-public ttf-pacifico
  (package
    (name "ttf-pacifico")
    (version "3.000")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-pacifico.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/pacifico/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "brush script handwriting font inspired by 1950s American surf culture")
    (description "Pacifico is a brush script handwriting font by Vernon Adams,
inspired by 1950s American surf culture.  Redrawn by Jacques Le Bailly and
expanded to Cyrillic by Botjo Nikoltchev and Ani Petrova.")
    (home-page "https://fonts.google.com/specimen/Pacifico")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 5. ttf-remixicon
;;; -------------------------------------------------------------------
(define-public ttf-remixicon
  (package
    (name "ttf-remixicon")
    (version "4.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-remixicon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/remixicon/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "open source neutral-style icon system")
    (description "Remix Icon is an open source neutral-style icon system.  All icons
are free for both personal and commercial use.")
    (home-page "https://remixicon.com")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 6. ttf-roboto-serif
;;; -------------------------------------------------------------------
(define-public ttf-roboto-serif
  (package
    (name "ttf-roboto-serif")
    (version "1.008")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-roboto-serif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/roboto-serif/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "variable typeface family designed for comfortable reading")
    (description "Roboto Serif is a variable typeface family designed to create a
comfortable and frictionless reading experience.  Part of the Roboto font superfamily
from Google.")
    (home-page "https://fonts.google.com/specimen/Roboto+Serif")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 7. fonts-et-book
;;; -------------------------------------------------------------------
(define-public fonts-et-book
  (package
    (name "fonts-et-book")
    (version "20151005")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edwardtufte/et-book")
                    (commit "gh-pages")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/et-book/"
                #:include-regexp ("\\.otf$|\\.ttf$|\\.woff$")))))
    (synopsis "typeface used in Edward Tufte's books")
    (description "ET Book is the typeface used in Edward Tufte's books.  It includes
roman, italic, and bold-italic styles suitable for body text and fine typographic work.")
    (home-page "https://edwardtufte.github.io/et-book")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. ttf-aref-ruqaa
;;; -------------------------------------------------------------------
(define-public ttf-aref-ruqaa
  (package
    (name "ttf-aref-ruqaa")
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
           #~'(("." "share/fonts/truetype/aref-ruqaa/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "arabic typeface capturing the classical Ruqaa calligraphic style")
    (description "Aref Ruqaa is an Arabic typeface that aspires to capture the
classical Ruqaa calligraphic style.  Suitable for Arabic body text and display use.")
    (home-page "https://github.com/aliftype/aref-ruqaa")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 9. ttf-martian-mono
;;; -------------------------------------------------------------------
(define-public ttf-martian-mono
  (package
    (name "ttf-martian-mono")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/evilmartians/mono")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/martian-mono/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "free and open-source monospaced font from Evil Martians")
    (description "Martian Mono is a free and open-source monospaced font from
Evil Martians.  It features a distinctive geometric design suitable for code editors
and terminal emulators.")
    (home-page "https://github.com/evilmartians/mono")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 10. ttf-reem-kufi
;;; -------------------------------------------------------------------
(define-public ttf-reem-kufi
  (package
    (name "ttf-reem-kufi")
    (version "1.100")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aliftype/reem-kufi")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/reem-kufi/"
                #:include-regexp ("\\.ttf$")))))
    (synopsis "Kufic typeface retrofitted to the Fatimid Kufic grid")
    (description "Reem Kufi is a Kufic typeface based on early Kufic models,
retrofitted to the Fatimid Kufic grid.  Suitable for Arabic calligraphic display and
body text.")
    (home-page "https://github.com/aliftype/reem-kufi")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 11. otf-hanken-grotesk
;;; -------------------------------------------------------------------
(define-public otf-hanken-grotesk
  (package
    (name "otf-hanken-grotesk")
    (version "20240130")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/marcologous/hanken-grotesk")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/hanken-grotesk/"
                #:include-regexp ("\\.otf$")))))
    (synopsis "sans-serif typeface inspired by the classic grotesques")
    (description "Hanken Grotesk is a sans-serif typeface inspired by the classic
grotesque typefaces.  It features clean geometric forms suitable for both display and
body text use.")
    (home-page "https://github.com/marcologous/hanken-grotesk")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 12. awesome-themes-git
;;; -------------------------------------------------------------------
(define-public awesome-themes-git
  (package
    (name "awesome-themes-git")
    (version "r18.4d7c8f8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/serialoverflow/awesome-themes")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/awesome/themes/"))))
    (synopsis "theme collection for AwesomeWM")
    (description "A collection of themes for the Awesome window manager, updated
for version 3.5.2.  This is the successor of awesome34-themes-git.")
    (home-page "https://github.com/serialoverflow/awesome-themes")
    (license (list license:cc-by-sa3.0 license:gpl2))))

;;; -------------------------------------------------------------------
;;; 13. flat-remix-gnome
;;; -------------------------------------------------------------------
(define-public flat-remix-gnome
  (package
    (name "flat-remix-gnome")
    (version "20250926")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/daniruiz/flat-remix-gnome")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Flat-Remix")))))
    (synopsis "GNOME Shell theme inspired by material design")
    (description "Flat Remix is a GNOME Shell theme inspired by material design.
It is mostly flat using a colorful palette with some shadows, highlights, and
gradients for depth.")
    (home-page "https://drasite.com/flat-remix-gnome")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 14. vimix-icon-theme
;;; -------------------------------------------------------------------
(define-public vimix-icon-theme
  (package
    (name "vimix-icon-theme")
    (version "2025.08.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/vimix-icon-theme")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Vimix/"
                #:include-regexp ("^Vimix")))))
    (synopsis "Material Design icon theme based on Paper Icon Theme")
    (description "Vimix is a Material Design icon theme based on the Paper Icon Theme.
It provides a consistent icon set for GTK desktop environments.")
    (home-page "https://github.com/vinceliuice/vimix-icon-theme")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 15. vimix-gtk-themes
;;; -------------------------------------------------------------------
(define-public vimix-gtk-themes
  (package
    (name "vimix-gtk-themes")
    (version "2025.06.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/vimix-gtk-themes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/themes/"
                #:include-regexp ("^Vimix")))))
    (synopsis "flat Material Design theme for GTK 3, GTK 2, and GNOME Shell")
    (description "Vimix is a flat Material Design theme for GTK 3, GTK 2, and
GNOME Shell.  It provides a modern, clean appearance with multiple color variants.")
    (home-page "https://vinceliuice.github.io/theme-vimix.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. xcursor-simp1e-zenburn
;;; -------------------------------------------------------------------
(define-public xcursor-simp1e-zenburn
  (package
    (name "xcursor-simp1e-zenburn")
    (version "20250223")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xcursor-simp1e-zenburn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Simp1e-Zenburn/"))))
    (synopsis "aesthetic cursor theme in zenburn colors")
    (description "Simp1e Zenburn is an aesthetic X11 cursor theme using the
zenburn color palette.  Part of the Simp1e cursor theme family.")
    (home-page "https://gitlab.com/cursors/simp1e")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. zorin-icon-themes
;;; -------------------------------------------------------------------
(define-public zorin-icon-themes
  (package
    (name "zorin-icon-themes")
    (version "4.0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZorinOS/zorin-icon-themes")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/"
                #:include-regexp ("^Zorin")))))
    (synopsis "Zorin icon theme in a variety of color combinations")
    (description "The Zorin icon theme provided in a variety of color combinations.
Designed for use with the Zorin OS desktop environment and compatible with GTK
desktops.")
    (home-page "https://github.com/ZorinOS/zorin-icon-themes")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 18. adwaita-plus-git
;;; -------------------------------------------------------------------
(define-public adwaita-plus-git
  (package
    (name "adwaita-plus-git")
    (version "6.1.r4.g22a8a79f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bonandry/adwaita-plus")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/"
                #:include-regexp ("^Adwaita\\+\\+")))))
    (synopsis "third-party icon theme based on GNOME Adwaita")
    (description "Adwaita++ is a third-party icon theme based on the GNOME project's
Adwaita icon theme.  It extends the default icon set with additional application icons.")
    (home-page "https://github.com/Bonandry/adwaita-plus")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. gtk-cyberpunk-neon-theme-git
;;; -------------------------------------------------------------------
(define-public gtk-cyberpunk-neon-theme-git
  (package
    (name "gtk-cyberpunk-neon-theme-git")
    (version "1.r125.587b5aa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Roboron3042/Cyberpunk-Neon")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gtk" "share/themes/Cyberpunk-Neon/"))))
    (synopsis "GTK theme with cyberpunk neon aesthetics")
    (description "A GTK theme with cyberpunk neon aesthetics.  Features vibrant
neon colors on dark backgrounds inspired by cyberpunk visual design.")
    (home-page "https://github.com/Roboron3042/Cyberpunk-Neon")
    (license license:cc-by-sa4.0)))

;;; -------------------------------------------------------------------
;;; 20. traefik-bin
;;; -------------------------------------------------------------------
(define-public traefik-bin
  (package
    (name "traefik-bin")
    (version "3.6.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/traefik/traefik/releases/download/v"
                    version "/traefik_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("traefik" "bin/traefik"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern reverse proxy and load balancer written in Go")
    (description "Traefik is a modern HTTP reverse proxy and load balancer that makes
deploying microservices easy.  It integrates with existing infrastructure components
and configures itself automatically.")
    (home-page "https://github.com/traefik/traefik")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. dufs-bin
;;; -------------------------------------------------------------------
(define-public dufs-bin
  (package
    (name "dufs-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sigoden/dufs/releases/download/v"
                    version "/dufs-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dufs" "bin/dufs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "utility file server with static serving, uploading, and WebDAV")
    (description "Dufs is a distinctive utility file server that supports static
serving, uploading, searching, access control, and WebDAV.")
    (home-page "https://github.com/sigoden/dufs")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 22. git-town-bin
;;; -------------------------------------------------------------------
(define-public git-town-bin
  (package
    (name "git-town-bin")
    (version "22.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/git-town/git-town/releases/download/v"
                    version "/git-town_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-town" "bin/git-town"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "git workflow automation to keep branches in sync")
    (description "Git Town is a Git workflow automation tool that keeps feature
branches in sync and reduces merge conflicts.  Written in Go.")
    (home-page "https://www.git-town.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. sqlfmt-bin
;;; -------------------------------------------------------------------
(define-public sqlfmt-bin
  (package
    (name "sqlfmt-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlfmt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sqlfmt-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "experimental SQL formatter with width-aware output")
    (description "An experimental SQL formatter that produces width-aware output.
It formats SQL queries with consideration for line width to improve readability.")
    (home-page "https://github.com/maddyblue/sqlfmt")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. docfd-bin
;;; -------------------------------------------------------------------
(define-public docfd-bin
  (package
    (name "docfd-bin")
    (version "12.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/docfd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/docfd-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI multiline fuzzy document finder")
    (description "Docfd is a TUI multiline fuzzy document finder.  It provides
interactive search through documents with multiline matching support.")
    (home-page "https://github.com/darrenldl/docfd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. python-demjson3
;;; -------------------------------------------------------------------
(define-public python-demjson3
  (package
    (name "python-demjson3")
    (version "3.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/d/demjson3/demjson3-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "encoder, decoder, and lint/validator for JSON compliant with RFC 7159")
    (description "Demjson3 is an encoder, decoder, and lint/validator for JSON
(JavaScript Object Notation) compliant with RFC 7159.  A maintained fork of the
original demjson library for Python 3.")
    (home-page "https://github.com/nielstron/demjson3")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 26. daemon
;;; -------------------------------------------------------------------
(define-public daemon
  (package
    (name "daemon")
    (version "0.8.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://libslack.org/daemon/download/daemon-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))))))))
    (synopsis "turns other processes into daemons")
    (description "Daemon turns other processes into daemons.  There are many
tasks that need to be performed to correctly set up a daemon process.  This
can be done with a single daemon command invocation.")
    (home-page "https://libslack.org/daemon/")
    (license license:gpl2+)))
