;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418p
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (75):
;;;     1.  otf-alegreya (copy-build-system, v2.009, silofl1.1)
;;;     2.  ttf-alegreya (copy-build-system, v2.009, silofl1.1)
;;;     3.  otf-bebas-neue (copy-build-system, v2.000, silofl1.1)
;;;     4.  otf-gnutypewriter (copy-build-system, v20120115, gpl3+)
;;;     5.  otf-chunk (copy-build-system, v1.000, silofl1.1)
;;;     6.  otf-chomsky (copy-build-system, v1.2.1, silofl1.1)
;;;     7.  otf-churchslavonic (copy-build-system, v3.1, silofl1.1)
;;;     8.  otf-exo (copy-build-system, v1.0, silofl1.1)
;;;     9.  otf-lalezar (copy-build-system, v1.000, silofl1.1)
;;;     10.  ttf-lalezar (copy-build-system, v1.000, silofl1.1)
;;;     11.  otf-compagnon (copy-build-system, v1.0, silofl1.1)
;;;     12.  otf-daubenton (copy-build-system, v1.0, silofl1.1)
;;;     13.  ttf-daubenton (copy-build-system, v1.0, silofl1.1)
;;;     14.  otf-drafting (copy-build-system, v1.0, silofl1.1)
;;;     15.  otf-montagu-slab (copy-build-system, v1.0, silofl1.1)
;;;     16.  otf-zilla-slab (copy-build-system, v1.002, silofl1.1)
;;;     17.  otf-yanone-kaffeesatz (copy-build-system, v2.004, silofl1.1)
;;;     18.  otf-shantell-sans (copy-build-system, v1.010, silofl1.1)
;;;     19.  otf-fanwood (copy-build-system, v1.1, silofl1.1)
;;;     20.  otf-sn-pro (copy-build-system, v1.0, silofl1.1)
;;;     21.  otf-kermit (copy-build-system, v1.0, silofl1.1)
;;;     22.  ttf-old-timey-mono (copy-build-system, v1.0, silofl1.1)
;;;     23.  otf-secuela (copy-build-system, v1.0, silofl1.1)
;;;     24.  ttf-geosans-light (copy-build-system, v1.0, cc0)
;;;     25.  woff2-intel-one-mono (copy-build-system, v1.4.0, silofl1.1)
;;;     26.  otf-beowulfot (copy-build-system, v1.0, silofl1.1)
;;;     27.  otf-lora-cyrillic (copy-build-system, v3.005, silofl1.1)
;;;     28.  ttf-lora-cyrillic (copy-build-system, v3.005, silofl1.1)
;;;     29.  otf-marta (copy-build-system, v1.0, silofl1.1)
;;;     30.  otf-ronduit-capitals (copy-build-system, v1.0, silofl1.1)
;;;     31.  otf-srbija-sans (copy-build-system, v1.0, silofl1.1)
;;;     32.  ttf-shantell-sans-variable (copy-build-system, v1.010, silofl1.1)
;;;     33.  ttf-secuela (copy-build-system, v1.0, silofl1.1)
;;;     34.  ttf-secuela-variable (copy-build-system, v1.0, silofl1.1)
;;;     35.  afetch (gnu, v2.1.0, expat)
;;;     36.  amfora (go, v1.10.0, expat)
;;;     37.  clipse (go, v1.1.0, expat)
;;;     38.  pplatex (cmake, v1.2, gpl3+)
;;;     39.  bdsync (gnu, v0.11.2, gpl2+)
;;;     40.  zram-init (copy, v12.2, gpl2+)
;;;     41.  opentracker (gnu, v0.0.1, bsd-0)
;;;     42.  wxhexeditor (gnu, v0.24, gpl2+)
;;;     43.  pnginfo (go, v1.0, expat)
;;;     44.  mkcue (gnu, v1.1, gpl2+)
;;;     45.  hashes (meson, v0.1.0, gpl3+)
;;;     46.  artha (gnu, v1.0.5, gpl2+)
;;;     47.  protoscope (go, v0.3.1, asl2.0)
;;;     48.  tor-ctrl (copy, v0.4.8, expat)
;;;     49.  dong (go, v0.5.0, expat)
;;;     50.  boatswain (meson, v0.4.0, gpl3+)
;;;     51.  lnk (copy, v0.3.3, gpl3+)
;;;     52.  memorize (meson, v0.7.0, gpl3+)
;;;     53.  ponysay (copy, v3.0.3, gpl3+)
;;;     54.  colorsearch (copy, v0.1.0, expat)
;;;     55.  newscheck (copy, v1.0.0, gpl2+)
;;;     56.  highscore (meson, v47.0, gpl3+)
;;;     57.  flam3 (gnu, v3.1.1, gpl3+)
;;;     58.  crengine-ng (cmake, v0.9.8, gpl2+)
;;;     59.  ocesql (gnu, v1.3.1, lgpl2.1+)
;;;     60.  idsk (cmake, v0.20, expat)
;;;     61.  refind-btrfs (pyproject, v0.7.0, gpl3+)
;;;     62.  gsocket (gnu, v1.4.43, bsd-2)
;;;     63.  python-obsws (pyproject, v1.0, expat)
;;;     64.  python-pywavefront (pyproject, v1.3.3, bsd-3)
;;;     65.  mkdocs-exclude (pyproject, v1.0.2, asl2.0)
;;;     66.  dnstwist (pyproject, v20240812, asl2.0)
;;;     67.  python-rtslib-fb (pyproject, v2.1.76, asl2.0)
;;;     68.  aspell-dict-sl (gnu, v0.60.0, lgpl2.1+)
;;;     69.  aspell-dict-sr (gnu, v0.02, lgpl2.1+)
;;;     70.  fortune-mod-bofh-excuses (copy, v1.2, public-domain)
;;;     71.  fortune-mod-vimtips (copy, v1.0, gpl3+)
;;;     72.  funny-manpages (copy, v1.3, public-domain)
;;;     73.  hunspell-ru-aot (copy, v0.4.0, lgpl2.1+)
;;;     74.  hyphen-pl (copy, v4.0, lgpl2.1+)
;;;     75.  words-sv (copy, v2.0, lgpl2.1+)
;;;
;;; BLOCKED (25):
;;;     76.  sway-desktop-env-hook -> NEEDS_RECIPE_DESIGN: pacman hook; A1: Arch-specific post-install hook mechanism not applicable to Gui
;;;     77.  sway-desktop-unsupportedgpu-hook -> NEEDS_RECIPE_DESIGN: pacman hook; A1: Arch-specific pacman hook for GPU detection; A2: not a standalo
;;;     78.  vesktop-spoof-pacman-hook -> NEEDS_RECIPE_DESIGN: pacman hook; A1: Arch-specific pacman hook for Vesktop; A2: not a standalone pac
;;;     79.  lib32-vulkan-icd-loader-git -> DEP_RESOLUTION_FAILED: multilib; A1: Guix does not support 32-bit compatibility libraries; A2: would re
;;;     80.  looking-glass-module-dkms-git -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS kernel modules require kernel build infrastructure; A2: 
;;;     81.  lib32-glibc-git -> DEP_RESOLUTION_FAILED: multilib; A1: Guix does not support 32-bit compatibility glibc; A2: requires cro
;;;     82.  ddcci-driver-linux-dkms-git -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS kernel module for DDC/CI monitor control; A2: requires k
;;;     83.  com.qq.weixin.work.deepin -> NEEDS_RECIPE_DESIGN: Deepin Wine wrapper; A1: requires Deepin Wine compatibility layer not in Guix; A
;;;     84.  homeassistant-supervised -> DEP_RESOLUTION_FAILED: requires systemd+Docker; A1: Home Assistant Supervised depends on systemd and Do
;;;     85.  linux-zencjk -> NEEDS_RECIPE_DESIGN: custom kernel; A1: custom Linux kernel variant with CJK patches; A2: requires fu
;;;     86.  linux-zencjk-headers -> DEP_RESOLUTION_FAILED: kernel headers for linux-zencjk; A1: depends on linux-zencjk kernel; A2: kernel 
;;;     87.  corefreq-dkms -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS kernel module for CPU monitoring; A2: requires kernel he
;;;     88.  gpd-fan-driver-dkms-git -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS driver for GPD device fan control; A2: requires kernel b
;;;     89.  hid-asus-mouse-dkms-git -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS driver for ASUS mouse HID devices; A2: requires kernel h
;;;     90.  lib32-wayland-git -> DEP_RESOLUTION_FAILED: multilib; A1: 32-bit Wayland library; A2: Guix does not support multilib; A3: us
;;;     91.  gentoo-sources -> NEEDS_RECIPE_DESIGN: Gentoo kernel sources; A1: Gentoo-specific kernel source packaging; A2: not appl
;;;     92.  snd-pcsp-dkms -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS kernel module for PC speaker sound; A2: requires kernel 
;;;     93.  python-google-cloud-texttospeech -> DEP_RESOLUTION_FAILED: deep Google Cloud deps; A1: requires google-cloud-core, google-api-core, grpcio 
;;;     94.  vmware-workstation-noxsave -> NEEDS_RECIPE_DESIGN: VMware variant; A1: proprietary VMware Workstation with kernel patches; A2: requ
;;;     95.  linux-bcachefs-git -> NEEDS_RECIPE_DESIGN: custom kernel; A1: Linux kernel with bcachefs filesystem patches; A2: full kerne
;;;     96.  linux-bcachefs-git-headers -> DEP_RESOLUTION_FAILED: depends on linux-bcachefs-git; A1: kernel headers for bcachefs kernel; A2: block
;;;     97.  lib32-libxpm -> DEP_RESOLUTION_FAILED: multilib; A1: 32-bit libXpm library; A2: Guix does not support multilib; A3: use
;;;     98.  xtables-addons-dkms -> NEEDS_RECIPE_DESIGN: kernel module; A1: DKMS netfilter extension modules; A2: requires kernel headers
;;;     99.  linux-xanmod-bore -> NEEDS_RECIPE_DESIGN: custom kernel; A1: XanMod kernel with BORE scheduler; A2: full kernel build requ
;;;     100.  linux-xanmod-bore-headers -> DEP_RESOLUTION_FAILED: depends on linux-xanmod-bore; A1: headers for XanMod BORE kernel; A2: blocked on
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418p)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xml)
  #:export (
            otf-alegreya
            ttf-alegreya
            otf-bebas-neue
            otf-gnutypewriter
            otf-chunk
            otf-chomsky
            otf-churchslavonic
            otf-exo
            otf-lalezar
            ttf-lalezar
            otf-compagnon
            otf-daubenton
            ttf-daubenton
            otf-drafting
            otf-montagu-slab
            otf-zilla-slab
            otf-yanone-kaffeesatz
            otf-shantell-sans
            otf-fanwood
            otf-sn-pro
            otf-kermit
            ttf-old-timey-mono
            otf-secuela
            ttf-geosans-light
            woff2-intel-one-mono
            otf-beowulfot
            otf-lora-cyrillic
            ttf-lora-cyrillic
            otf-marta
            otf-ronduit-capitals
            otf-srbija-sans
            ttf-shantell-sans-variable
            ttf-secuela
            ttf-secuela-variable
            afetch
            amfora
            clipse
            pplatex
            bdsync
            zram-init
            opentracker
            wxhexeditor
            pnginfo
            mkcue
            hashes
            artha
            protoscope
            tor-ctrl
            dong
            boatswain
            lnk
            memorize
            ponysay
            colorsearch
            newscheck
            highscore
            flam3
            crengine-ng
            ocesql
            idsk
            refind-btrfs
            gsocket
            python-obsws
            python-pywavefront
            mkdocs-exclude
            dnstwist
            python-rtslib-fb
            aspell-dict-sl
            aspell-dict-sr
            fortune-mod-bofh-excuses
            fortune-mod-vimtips
            funny-manpages
            hunspell-ru-aot
            hyphen-pl
            words-sv
            ))

;;; -------------------------------------------------------------------
;;; 1. otf-alegreya --- elegant serif typeface for comfortable reading
;;; -------------------------------------------------------------------
(define-public otf-alegreya
  (package
    (name "otf-alegreya")
    (version "2.009")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/huertatipografica/Alegreya/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-alegreya/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/huertatipografica/Alegreya")
    (synopsis "elegant serif typeface for comfortable reading")
    (description "Alegreya is a serif typeface family designed by Juan Pablo del Peral
for Huerta Tipografica.  It provides Regular, Bold, Italic, and other
weights intended for literature and long reading texts with a calligraphic
feel.  This package provides the OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 2. ttf-alegreya --- elegant serif typeface for comfortable reading (TTF)
;;; -------------------------------------------------------------------
(define-public ttf-alegreya
  (package
    (name "ttf-alegreya")
    (version "2.009")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/huertatipografica/Alegreya/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-alegreya/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/huertatipografica/Alegreya")
    (synopsis "elegant serif typeface for comfortable reading (TTF)")
    (description "Alegreya is a serif typeface family designed by Juan Pablo del Peral
for Huerta Tipografica.  It provides Regular, Bold, Italic, and other
weights intended for literature and long reading texts.  This package
provides the TrueType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 3. otf-bebas-neue --- sans-serif display font for headlines and titling
;;; -------------------------------------------------------------------
(define-public otf-bebas-neue
  (package
    (name "otf-bebas-neue")
    (version "2.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dharmatype/Bebas-Neue")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-bebas-neue/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/dharmatype/Bebas-Neue")
    (synopsis "sans-serif display font for headlines and titling")
    (description "Bebas Neue is a sans-serif display typeface by Ryoichi Tsunekawa of
Dharma Type.  It is designed for headlines, captions, and titling work.
The font provides Regular, Bold, Light, Book, and Thin weights in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 4. otf-gnutypewriter --- free font imitating a real typewriter
;;; -------------------------------------------------------------------
(define-public otf-gnutypewriter
  (package
    (name "otf-gnutypewriter")
    (version "20120115")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholastrm/gnutypewriter-fonts")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-gnutypewriter/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nicholastrm/gnutypewriter-fonts")
    (synopsis "free font imitating a real typewriter")
    (description "GNU Typewriter is a free font that imitates the look of text typed on
a classic typewriter.  It includes irregularities and imperfections that
give documents an authentic typewritten appearance.  Provided in OpenType
format.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 5. otf-chunk --- ultra-bold slab serif typeface
;;; -------------------------------------------------------------------
(define-public otf-chunk
  (package
    (name "otf-chunk")
    (version "1.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theleagueof/chunk")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-chunk/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/theleagueof/chunk")
    (synopsis "ultra-bold slab serif typeface")
    (description "Chunk is an ultra-bold slab serif typeface designed by Meredith Mandel
for The League of Moveable Type.  It is suited for large headlines and
display text where a strong visual impact is desired.  Provided in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 6. otf-chomsky --- font in the style of the New York Times masthead
;;; -------------------------------------------------------------------
(define-public otf-chomsky
  (package
    (name "otf-chomsky")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ctrlcctrlv/chomsky/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-chomsky/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/ctrlcctrlv/chomsky")
    (synopsis "font in the style of the New York Times masthead")
    (description "Chomsky is a display font designed by Fredrick Brennan in the
blackletter style of the New York Times masthead.  It provides a full
alphabet with ligatures and special characters.  Provided in OpenType
format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 7. otf-churchslavonic --- Unicode-encoded OpenType fonts for Church Slavonic
;;; -------------------------------------------------------------------
(define-public otf-churchslavonic
  (package
    (name "otf-churchslavonic")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/typiconman/fonts-cu/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-churchslavonic/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/typiconman/fonts-cu")
    (synopsis "Unicode-encoded OpenType fonts for Church Slavonic")
    (description "A collection of Unicode-encoded OpenType fonts for typesetting Church
Slavonic texts.  The fonts include Ponomar, Fedorovsk, Menaion, and other
faces designed for liturgical and scholarly use.  They support the full
Church Slavonic character repertoire.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 8. otf-exo --- geometric sans-serif typeface family
;;; -------------------------------------------------------------------
(define-public otf-exo
  (package
    (name "otf-exo")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NDISCOVER/Exo-1.0")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-exo/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/NDISCOVER/Exo-1.0")
    (synopsis "geometric sans-serif typeface family")
    (description "Exo is a contemporary geometric sans-serif typeface designed by
Natanael Gama.  It tries to convey a technological and futuristic
feeling while keeping an elegant design.  The family includes nine
weights with matching italics.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 9. otf-lalezar --- bold display typeface for Arabic and Latin scripts
;;; -------------------------------------------------------------------
(define-public otf-lalezar
  (package
    (name "otf-lalezar")
    (version "1.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AliSadli/Lalezar")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-lalezar/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/AliSadli/Lalezar")
    (synopsis "bold display typeface for Arabic and Latin scripts")
    (description "Lalezar is a bold display typeface by Borna Izadpanah designed for
both Arabic and Latin scripts.  Its heavy strokes and compact design
make it well-suited for posters, headlines, and display usage.
Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 10. ttf-lalezar --- bold display typeface for Arabic and Latin scripts (TTF)
;;; -------------------------------------------------------------------
(define-public ttf-lalezar
  (package
    (name "ttf-lalezar")
    (version "1.000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AliSadli/Lalezar")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-lalezar/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/AliSadli/Lalezar")
    (synopsis "bold display typeface for Arabic and Latin scripts (TTF)")
    (description "Lalezar is a bold display typeface by Borna Izadpanah designed for
both Arabic and Latin scripts.  Its heavy strokes and compact design
make it well-suited for posters, headlines, and display usage.
Provided in TrueType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 11. otf-compagnon --- multifaceted typeface family by Velvetyne
;;; -------------------------------------------------------------------
(define-public otf-compagnon
  (package
    (name "otf-compagnon")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/Compagnon")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-compagnon/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/Compagnon")
    (synopsis "multifaceted typeface family by Velvetyne")
    (description "Compagnon is a multifaceted typeface family created by Juliette Dupin,
Julien Music, Léa Lacroix, Luna Music, and Valentin Papon for the
Velvetyne Type Foundry.  The family provides contrasting styles from
Roman to Italic, Light to Bold.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 12. otf-daubenton --- naturalist-inspired typeface by Velvetyne
;;; -------------------------------------------------------------------
(define-public otf-daubenton
  (package
    (name "otf-daubenton")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/Daubenton")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-daubenton/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/Daubenton")
    (synopsis "naturalist-inspired typeface by Velvetyne")
    (description "Daubenton is a serif typeface by Jérémy Landes for Velvetyne Type
Foundry, inspired by the naturalist Louis-Jean-Marie Daubenton.  It
provides a classical serif design with contemporary refinements.
Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 13. ttf-daubenton --- naturalist-inspired typeface by Velvetyne (TTF)
;;; -------------------------------------------------------------------
(define-public ttf-daubenton
  (package
    (name "ttf-daubenton")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/Daubenton")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-daubenton/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/Daubenton")
    (synopsis "naturalist-inspired typeface by Velvetyne (TTF)")
    (description "Daubenton is a serif typeface by Jérémy Landes for Velvetyne Type
Foundry.  This package provides the TrueType format of the Daubenton
typeface for use with desktop applications and web projects.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 14. otf-drafting --- monospaced typeface inspired by technical drawing
;;; -------------------------------------------------------------------
(define-public otf-drafting
  (package
    (name "otf-drafting")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/DraftingMono")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-drafting/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/DraftingMono")
    (synopsis "monospaced typeface inspired by technical drawing")
    (description "Drafting Mono is a monospaced typeface inspired by technical drawing
lettering.  It is designed for code editors and terminals while
maintaining the aesthetic of architectural drafting.  Provided in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 15. otf-montagu-slab --- optically-sized serif slab typeface
;;; -------------------------------------------------------------------
(define-public otf-montagu-slab
  (package
    (name "otf-montagu-slab")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/MontaguSlab")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-montagu-slab/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/MontaguSlab")
    (synopsis "optically-sized serif slab typeface")
    (description "Montagu Slab is an optically-sized serif slab typeface by Florian
Karsten, distributed via Google Fonts.  It provides variable optical
size and weight axes for flexible typographic control.  Provided in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 16. otf-zilla-slab --- Mozilla's open-source slab serif typeface
;;; -------------------------------------------------------------------
(define-public otf-zilla-slab
  (package
    (name "otf-zilla-slab")
    (version "1.002")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/ZillaSlab")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-zilla-slab/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/ZillaSlab")
    (synopsis "Mozilla's open-source slab serif typeface")
    (description "Zilla Slab is the core typeface for the Mozilla brand identity,
designed by Typotheque.  It is a contemporary slab serif with five
weights plus matching italics.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 17. otf-yanone-kaffeesatz --- narrow display typeface for headlines
;;; -------------------------------------------------------------------
(define-public otf-yanone-kaffeesatz
  (package
    (name "otf-yanone-kaffeesatz")
    (version "2.004")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yanone/kaffeesatz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-yanone-kaffeesatz/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/yanone/kaffeesatz")
    (synopsis "narrow display typeface for headlines")
    (description "Yanone Kaffeesatz is a narrow sans-serif display typeface designed
by Jan Gerner (Yanone).  It provides four weights (ExtraLight, Light,
Regular, Bold) and is well-suited for headlines and poster work.
Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 18. otf-shantell-sans --- marker-style handwriting sans-serif typeface
;;; -------------------------------------------------------------------
(define-public otf-shantell-sans
  (package
    (name "otf-shantell-sans")
    (version "1.010")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arrowtype/shantell-sans")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-shantell-sans/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/arrowtype/shantell-sans")
    (synopsis "marker-style handwriting sans-serif typeface")
    (description "Shantell Sans is a marker-style sans-serif typeface designed by
Arrow Type for Shantell Martin.  It provides a casual hand-drawn
aesthetic suitable for both display and text sizes, with variable
font support.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 19. otf-fanwood --- serif text face inspired by Fairfield
;;; -------------------------------------------------------------------
(define-public otf-fanwood
  (package
    (name "otf-fanwood")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theleagueof/fanwood")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-fanwood/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/theleagueof/fanwood")
    (synopsis "serif text face inspired by Fairfield")
    (description "Fanwood is a serif typeface designed by Barry Schwartz for The League
of Moveable Type, inspired by Rudolph Ruzicka's Fairfield.  It provides
Regular and Italic styles suited for book and magazine text.  Provided in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 20. otf-sn-pro --- grotesk typeface for user interfaces
;;; -------------------------------------------------------------------
(define-public otf-sn-pro
  (package
    (name "otf-sn-pro")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/SNPro")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-sn-pro/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/SNPro")
    (synopsis "grotesk typeface for user interfaces")
    (description "SN Pro is a grotesk typeface family designed for user interface design
and coding.  It provides a clean, modern aesthetic with excellent
readability at small sizes.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 21. otf-kermit --- display typeface by Velvetyne Type Foundry
;;; -------------------------------------------------------------------
(define-public otf-kermit
  (package
    (name "otf-kermit")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/Kermit")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-kermit/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/Kermit")
    (synopsis "display typeface by Velvetyne Type Foundry")
    (description "Kermit is a display typeface by Jérémy Landes for the Velvetyne Type
Foundry.  It is a playful and expressive face suited for headlines
and poster work.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 22. ttf-old-timey-mono --- monospaced typeface with a vintage feel
;;; -------------------------------------------------------------------
(define-public ttf-old-timey-mono
  (package
    (name "ttf-old-timey-mono")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/OldTimeyMono")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-old-timey-mono/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/OldTimeyMono")
    (synopsis "monospaced typeface with a vintage feel")
    (description "Old Timey Mono is a monospaced typeface with a vintage, retro feel
for terminals and code editors.  Provided in TrueType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 23. otf-secuela --- geometric sans-serif typeface family
;;; -------------------------------------------------------------------
(define-public otf-secuela
  (package
    (name "otf-secuela")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/defharo/secuela")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-secuela/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/defharo/secuela")
    (synopsis "geometric sans-serif typeface family")
    (description "Secuela is a geometric sans-serif typeface designed by Fernando Haro.
It provides a clean, modern look with various weights suitable for
headlines and body text.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 24. ttf-geosans-light --- geometric sans-serif light typeface
;;; -------------------------------------------------------------------
(define-public ttf-geosans-light
  (package
    (name "ttf-geosans-light")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://dl.dafont.com/dl/?f=geo_sans_light")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-geosans-light/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://www.dafont.com/geo-sans-light.font")
    (synopsis "geometric sans-serif light typeface")
    (description "Geo Sans Light is a clean geometric sans-serif typeface by Manfred
Klein.  It features consistent letterforms with even stroke widths
suited for display and headline use.  Provided in TrueType format.")
    (license license:cc0)))
;;; -------------------------------------------------------------------
;;; 25. woff2-intel-one-mono --- Intel One Mono typeface in WOFF2 format
;;; -------------------------------------------------------------------
(define-public woff2-intel-one-mono
  (package
    (name "woff2-intel-one-mono")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/intel-one-mono/archive/refs/tags/V" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/woff2-intel-one-mono/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/intel/intel-one-mono")
    (synopsis "Intel One Mono typeface in WOFF2 format")
    (description "Intel One Mono is an expressive monospaced font family designed by
Frere-Jones Type for Intel.  It prioritizes legibility, especially
for code editing.  This package provides the WOFF2 web font format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 26. otf-beowulfot --- randomized outline display typeface
;;; -------------------------------------------------------------------
(define-public otf-beowulfot
  (package
    (name "otf-beowulfot")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/letterror/BeowulfOT")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-beowulfot/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/letterror/BeowulfOT")
    (synopsis "randomized outline display typeface")
    (description "BeowulfOT is a digital interpretation of the original LettError
Beowulf typeface with randomized outlines using OpenType variation.
Each rendering produces slightly different letterforms.  Provided in
OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 27. otf-lora-cyrillic --- well-balanced contemporary serif with Cyrillic support
;;; -------------------------------------------------------------------
(define-public otf-lora-cyrillic
  (package
    (name "otf-lora-cyrillic")
    (version "3.005")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyrealtype/Lora-Cyrillic")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-lora-cyrillic/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/cyrealtype/Lora-Cyrillic")
    (synopsis "well-balanced contemporary serif with Cyrillic support")
    (description "Lora Cyrillic is a well-balanced contemporary serif typeface by
Cyreal with roots in calligraphy.  This version extends the Lora family
with full Cyrillic character support.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 28. ttf-lora-cyrillic --- well-balanced contemporary serif with Cyrillic support (TTF)
;;; -------------------------------------------------------------------
(define-public ttf-lora-cyrillic
  (package
    (name "ttf-lora-cyrillic")
    (version "3.005")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyrealtype/Lora-Cyrillic")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-lora-cyrillic/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/cyrealtype/Lora-Cyrillic")
    (synopsis "well-balanced contemporary serif with Cyrillic support (TTF)")
    (description "Lora Cyrillic is a well-balanced contemporary serif typeface by
Cyreal with Cyrillic character support.  Provided in TrueType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 29. otf-marta --- serif typeface for comfortable reading
;;; -------------------------------------------------------------------
(define-public otf-marta
  (package
    (name "otf-marta")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/Marta")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-marta/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/Marta")
    (synopsis "serif typeface for comfortable reading")
    (description "Marta is a serif typeface designed for comfortable reading in print
and on screen.  It provides a balanced design with generous x-height.
Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 30. otf-ronduit-capitals --- display capitals typeface by Velvetyne
;;; -------------------------------------------------------------------
(define-public otf-ronduit-capitals
  (package
    (name "otf-ronduit-capitals")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velvetyne/Ronduit")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-ronduit-capitals/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/velvetyne/Ronduit")
    (synopsis "display capitals typeface by Velvetyne")
    (description "Ronduit Capitals is a display capitals typeface by Sébastien Bihan
for Velvetyne Type Foundry.  It provides decorative uppercase letters
for headlines and titling.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 31. otf-srbija-sans --- sans-serif typeface with Serbian Cyrillic support
;;; -------------------------------------------------------------------
(define-public otf-srbija-sans
  (package
    (name "otf-srbija-sans")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/SrbijaSans")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf-srbija-sans/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/nickshanks/SrbijaSans")
    (synopsis "sans-serif typeface with Serbian Cyrillic support")
    (description "Srbija Sans is a sans-serif typeface with full Serbian Cyrillic
character support.  It provides clean letterforms suitable for both
display and body text.  Provided in OpenType format.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 32. ttf-shantell-sans-variable --- marker-style handwriting sans-serif (variable TTF)
;;; -------------------------------------------------------------------
(define-public ttf-shantell-sans-variable
  (package
    (name "ttf-shantell-sans-variable")
    (version "1.010")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arrowtype/shantell-sans")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-shantell-sans-variable/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/arrowtype/shantell-sans")
    (synopsis "marker-style handwriting sans-serif (variable TTF)")
    (description "Shantell Sans Variable is the variable font version of the Shantell
Sans typeface by Arrow Type.  It provides continuous weight and italic
axes in a single TrueType variable font file.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 33. ttf-secuela --- geometric sans-serif typeface family (TTF)
;;; -------------------------------------------------------------------
(define-public ttf-secuela
  (package
    (name "ttf-secuela")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/defharo/secuela")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-secuela/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/defharo/secuela")
    (synopsis "geometric sans-serif typeface family (TTF)")
    (description "Secuela is a geometric sans-serif typeface by Fernando Haro.  This
package provides the TrueType format for desktop use.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 34. ttf-secuela-variable --- geometric sans-serif typeface family (variable TTF)
;;; -------------------------------------------------------------------
(define-public ttf-secuela-variable
  (package
    (name "ttf-secuela-variable")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/defharo/secuela")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf-secuela-variable/"
                #:include-regexp ("\\.(otf|ttf|woff|woff2)$")))))
    (home-page "https://github.com/defharo/secuela")
    (synopsis "geometric sans-serif typeface family (variable TTF)")
    (description "Secuela Variable is the variable font version of the Secuela
typeface by Fernando Haro.  It provides continuous weight axis in
a single TrueType variable font file.")
    (license license:silofl1.1)))
;;; -------------------------------------------------------------------
;;; 35. afetch --- minimal system information fetcher
;;; -------------------------------------------------------------------
(define-public afetch
  (package
    (name "afetch")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/13-CF/afetch")
                    (commit "v2.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/13-CF/afetch")
    (synopsis "minimal system information fetcher")
    (description "Afetch is a minimal system information fetcher written in C.  It
displays basic system details like kernel, uptime, packages, and shell
in a compact and colorful terminal output.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 36. amfora --- Gemini protocol browser for the terminal
;;; -------------------------------------------------------------------
(define-public amfora
  (package
    (name "amfora")
    (version "1.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/makeworld-the-better-one/amfora")
                    (commit "v1.10.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:import-path "github.com/makeworld-the-better-one/amfora"))
    (home-page "https://github.com/makeworld-the-better-one/amfora")
    (synopsis "Gemini protocol browser for the terminal")
    (description "Amfora is a terminal browser for the Gemini protocol.  It features
bookmarks, subscriptions, TOFU certificate verification, and client
certificate support.  It renders Gemini pages with color and style.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 37. clipse --- clipboard manager with TUI interface
;;; -------------------------------------------------------------------
(define-public clipse
  (package
    (name "clipse")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/savedra1/clipse")
                    (commit "v1.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:import-path "github.com/savedra1/clipse"))
    (home-page "https://github.com/savedra1/clipse")
    (synopsis "clipboard manager with TUI interface")
    (description "Clipse is a configurable clipboard manager for Unix systems with a
terminal user interface.  It provides clipboard history, image support,
and Wayland/X11 compatibility.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 38. pplatex --- pretty-print LaTeX error messages
;;; -------------------------------------------------------------------
(define-public pplatex
  (package
    (name "pplatex")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefanhepp/pplatex")
                    (commit "v1.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefanhepp/pplatex")
    (synopsis "pretty-print LaTeX error messages")
    (description "Pplatex is a tool that reformats LaTeX compiler output to make error
messages more readable.  It filters and highlights errors, warnings,
and bad boxes for easier debugging of TeX documents.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 39. bdsync --- synchronize block devices over a network
;;; -------------------------------------------------------------------
(define-public bdsync
  (package
    (name "bdsync")
    (version "0.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TargetHolding/bdsync")
                    (commit "v0.11.2")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/TargetHolding/bdsync")
    (synopsis "synchronize block devices over a network")
    (description "Bdsync synchronizes block devices over a network.  It generates a
patch file of differences between local and remote block devices,
similar to how rsync works for files.  Designed for database and
LVM snapshots.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 40. zram-init --- initialize zram devices with optimal settings
;;; -------------------------------------------------------------------
(define-public zram-init
  (package
    (name "zram-init")
    (version "12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vaeth/zram-init/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("sbin/zram-init" "sbin/zram-init"))))
    (home-page "https://github.com/vaeth/zram-init/archive/refs/tags/v{version}.tar.gz")
    (synopsis "initialize zram devices with optimal settings")
    (description "Zram-init is a script to initialize zram devices for compressed swap
and tmpfs.  It sets up compressed block devices in RAM for improved
performance on systems with limited physical memory.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 41. opentracker --- open and free BitTorrent tracker
;;; -------------------------------------------------------------------
(define-public opentracker
  (package
    (name "opentracker")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://erdgeist.org/gitweb/opentracker")
                    (commit "v0.0.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://erdgeist.org/arts/software/opentracker/")
    (synopsis "open and free BitTorrent tracker")
    (description "Opentracker is a free and open BitTorrent tracker project.  It aims
for minimal resource usage and is designed to run in a POSIX compliant
environment.  It supports both UDP and HTTP tracker protocols.")
    (license license:isc)))
;;; -------------------------------------------------------------------
;;; 42. wxhexeditor --- hex editor for large files using wxWidgets
;;; -------------------------------------------------------------------
(define-public wxhexeditor
  (package
    (name "wxhexeditor")
    (version "0.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EUA/wxHexEditor")
                    (commit "v0.24")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/EUA/wxHexEditor")
    (synopsis "hex editor for large files using wxWidgets")
    (description "wxHexEditor is a free hex editor that can handle very large files
with minimal memory usage.  It features a wxWidgets GUI with
side-by-side hex and text views, data comparison, checksum
calculation, and multi-language support.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 43. pnginfo --- display metadata and text chunks from PNG files
;;; -------------------------------------------------------------------
(define-public pnginfo
  (package
    (name "pnginfo")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/binyamin/pnginfo")
                    (commit "v1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:import-path "github.com/binyamin/pnginfo"))
    (home-page "https://github.com/binyamin/pnginfo")
    (synopsis "display metadata and text chunks from PNG files")
    (description "Pnginfo is a command-line tool that extracts and displays metadata
and text chunks embedded in PNG image files.  It provides a simple
way to inspect PNG file properties.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 44. mkcue --- generate CUE sheets from a disc image
;;; -------------------------------------------------------------------
(define-public mkcue
  (package
    (name "mkcue")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Daemondia/mkcue/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Daemondia/mkcue/archive/refs/tags/{version}.tar.gz")
    (synopsis "generate CUE sheets from a disc image")
    (description "Mkcue generates CUE sheet files from CD disc images.  It reads the
table-of-contents data embedded in BIN/ISO images and produces a
corresponding CUE file.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 45. hashes --- hash algorithm identification GUI using GTK4
;;; -------------------------------------------------------------------
(define-public hashes
  (package
    (name "hashes")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Xminent/hashes")
                    (commit "v0.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Xminent/hashes")
    (synopsis "hash algorithm identification GUI using GTK4")
    (description "Hashes is a GTK4 application that identifies hash algorithms from
hash strings.  It provides a simple graphical interface built with
libadwaita for recognizing MD5, SHA, bcrypt, and other hash formats.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 46. artha --- free cross-platform English thesaurus
;;; -------------------------------------------------------------------
(define-public artha
  (package
    (name "artha")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/artha-org/artha/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/artha-org/artha/archive/refs/tags/v{version}.tar.gz")
    (synopsis "free cross-platform English thesaurus")
    (description "Artha is a free cross-platform English thesaurus based on WordNet.
It provides a handy interface to look up words and their relationships:
synonyms, antonyms, derivatives, and related terms.  It features
global hotkey support for quick lookups.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 47. protoscope --- protobuf wire format inspection tool
;;; -------------------------------------------------------------------
(define-public protoscope
  (package
    (name "protoscope")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/protocolbuffers/protoscope")
                    (commit "v0.3.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:import-path "github.com/protocolbuffers/protoscope"))
    (home-page "https://github.com/protocolbuffers/protoscope")
    (synopsis "protobuf wire format inspection tool")
    (description "Protoscope is a tool for inspecting and editing the Protocol Buffers
wire format.  It can decode raw protobuf bytes into a human-readable
format and re-encode edited output back into binary.")
    (license license:asl2.0)))
;;; -------------------------------------------------------------------
;;; 48. tor-ctrl --- command-line tool to control Tor via its control port
;;; -------------------------------------------------------------------
(define-public tor-ctrl
  (package
    (name "tor-ctrl")
    (version "0.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nyxnor/tor-ctrl")
                    (commit "v0.4.8")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("tor-ctrl" "bin/tor-ctrl"))))
    (home-page "https://github.com/nyxnor/tor-ctrl")
    (synopsis "command-line tool to control Tor via its control port")
    (description "Tor-ctrl is a shell script that communicates with the Tor process
via its control port.  It allows sending raw control protocol commands
for circuit inspection, stream management, and configuration changes.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 49. dong --- command-line currency converter
;;; -------------------------------------------------------------------
(define-public dong
  (package
    (name "dong")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mkuchak/dong")
                    (commit "v0.5.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:import-path "github.com/mkuchak/dong"))
    (home-page "https://github.com/mkuchak/dong")
    (synopsis "command-line currency converter")
    (description "Dong is a fast command-line currency converter that fetches live
exchange rates.  It supports conversion between many world currencies
and provides formatted output for terminal use.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 50. boatswain --- control Elgato Stream Deck devices on GNOME
;;; -------------------------------------------------------------------
(define-public boatswain
  (package
    (name "boatswain")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/World/boatswain")
                    (commit "v0.4.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.gnome.org/World/boatswain")
    (synopsis "control Elgato Stream Deck devices on GNOME")
    (description "Boatswain is a GNOME application for controlling Elgato Stream Deck
devices.  It provides a graphical interface to configure buttons,
assign actions, and manage pages for Stream Deck hardware.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 51. lnk --- parser for Windows shortcut (.lnk) files
;;; -------------------------------------------------------------------
(define-public lnk
  (package
    (name "lnk")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lcorbasson/lnk")
                    (commit "v0.3.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("lnk" "bin/lnk"))))
    (home-page "https://github.com/lcorbasson/lnk")
    (synopsis "parser for Windows shortcut (.lnk) files")
    (description "Lnk is a command-line tool that parses and displays information from
Windows shortcut (.lnk) files.  It can extract target paths, arguments,
working directory, and other metadata from LNK format files.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 52. memorize --- flashcard application for GNOME
;;; -------------------------------------------------------------------
(define-public memorize
  (package
    (name "memorize")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/memorize")
                    (commit "v0.7.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickshanks/memorize")
    (synopsis "flashcard application for GNOME")
    (description "Memorize is a GNOME flashcard application for spaced-repetition
learning.  It provides a clean interface built with GTK4 and
libadwaita for creating and studying flashcard decks.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 53. ponysay --- cowsay reimplementation for ponies
;;; -------------------------------------------------------------------
(define-public ponysay
  (package
    (name "ponysay")
    (version "3.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erkin/ponysay")
                    (commit "v3.0.3")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("ponysay" "bin/ponysay") ("ponythink" "bin/ponythink") ("share" "share/"))))
    (home-page "https://github.com/erkin/ponysay")
    (synopsis "cowsay reimplementation for ponies")
    (description "Ponysay is a reimplementation of cowsay that uses ponies from
My Little Pony: Friendship is Magic.  It displays messages spoken
by colorful ASCII art ponies in the terminal.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 54. colorsearch --- color-highlighted search in terminal output
;;; -------------------------------------------------------------------
(define-public colorsearch
  (package
    (name "colorsearch")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zibri/colorsearch")
                    (commit "v0.1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("colorsearch" "bin/colorsearch"))))
    (home-page "https://github.com/Zibri/colorsearch")
    (synopsis "color-highlighted search in terminal output")
    (description "Colorsearch is a command-line tool that highlights search terms in
color within terminal output.  It wraps grep with color support for
easier visual identification of matches.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 55. newscheck --- Usenet newsgroup binary post checker
;;; -------------------------------------------------------------------
(define-public newscheck
  (package
    (name "newscheck")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/resstracker/newscheck")
                    (commit "v1.0.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("newscheck" "bin/newscheck"))))
    (home-page "https://github.com/resstracker/newscheck")
    (synopsis "Usenet newsgroup binary post checker")
    (description "Newscheck checks Usenet newsgroups for binary posts and reports
completion status.  It provides a quick overview of available content
in configured newsgroup servers.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 56. highscore --- retro gaming frontend for GNOME
;;; -------------------------------------------------------------------
(define-public highscore
  (package
    (name "highscore")
    (version "47.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/World/highscore")
                    (commit "v47.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.gnome.org/World/highscore")
    (synopsis "retro gaming frontend for GNOME")
    (description "Highscore is a GNOME application for playing retro games.  It uses
libretro cores to emulate classic game consoles and provides a clean
GTK4 and libadwaita interface for managing and playing game ROMs.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 57. flam3 --- fractal flame algorithm library and tools
;;; -------------------------------------------------------------------
(define-public flam3
  (package
    (name "flam3")
    (version "3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scottdraves/flam3")
                    (commit "v3.1.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/scottdraves/flam3")
    (synopsis "fractal flame algorithm library and tools")
    (description "Flam3 is the reference implementation of the fractal flame algorithm
by Scott Draves.  It renders fractal flames as high-quality images and
animations, used for generative art and visual effects.  It provides
both a library and command-line rendering tools.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 58. crengine-ng --- cross-platform e-book rendering engine
;;; -------------------------------------------------------------------
(define-public crengine-ng
  (package
    (name "crengine-ng")
    (version "0.9.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/crengine-ng")
                    (commit "v0.9.8")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickshanks/crengine-ng")
    (synopsis "cross-platform e-book rendering engine")
    (description "CREngine-NG is a cross-platform e-book rendering engine derived from
CoolReader.  It supports EPUB, FB2, DOC, TXT, HTML, RTF, and other
formats.  It provides a C++ library for building e-book reader
applications.")
    (license license:gpl2+)))
;;; -------------------------------------------------------------------
;;; 59. ocesql --- COBOL embedded SQL preprocessor
;;; -------------------------------------------------------------------
(define-public ocesql
  (package
    (name "ocesql")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickshanks/Open-COBOL-ESQL")
                    (commit "v1.3.1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nickshanks/Open-COBOL-ESQL")
    (synopsis "COBOL embedded SQL preprocessor")
    (description "OCESQL is an open-source COBOL embedded SQL preprocessor compatible
with GnuCOBOL.  It processes EXEC SQL statements in COBOL source
code and translates them into COBOL calls to database access routines.")
    (license license:lgpl2.1+)))
;;; -------------------------------------------------------------------
;;; 60. idsk --- Amstrad CPC DSK disk image manipulation tool
;;; -------------------------------------------------------------------
(define-public idsk
  (package
    (name "idsk")
    (version "0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cpcsdk/idsk")
                    (commit "v0.20")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cpcsdk/idsk")
    (synopsis "Amstrad CPC DSK disk image manipulation tool")
    (description "iDSK is a command-line tool for manipulating Amstrad CPC DSK
disk images.  It can list, extract, insert, and delete files from DSK
images used with CPC emulators.  Written in C++.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 61. refind-btrfs --- generate rEFInd boot stanzas for btrfs snapshots
;;; -------------------------------------------------------------------
(define-public refind-btrfs
  (package
    (name "refind-btrfs")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Venom1991/refind-btrfs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Venom1991/refind-btrfs/archive/refs/tags/v{version}.tar.gz")
    (synopsis "generate rEFInd boot stanzas for btrfs snapshots")
    (description "Refind-btrfs generates rEFInd boot manager manual boot stanzas
from btrfs snapshots.  It allows booting into btrfs snapshots
via the rEFInd boot manager for system recovery.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 62. gsocket --- global socket toolkit for secure connections
;;; -------------------------------------------------------------------
(define-public gsocket
  (package
    (name "gsocket")
    (version "1.4.43")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hackerschoice/gsocket")
                    (commit "v1.4.43")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/hackerschoice/gsocket")
    (synopsis "global socket toolkit for secure connections")
    (description "Global Socket allows two hosts behind NAT/firewall to establish
a TCP connection with each other without requiring a public IP
address.  It uses the Global Socket Relay Network for connectivity.")
    (license license:bsd-2)))
;;; -------------------------------------------------------------------
;;; 63. python-obsws --- Python library for OBS WebSocket protocol
;;; -------------------------------------------------------------------
(define-public python-obsws
  (package
    (name "python-obsws")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Elektordi/obs-websocket-py/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Elektordi/obs-websocket-py/archive/refs/tags/v{version}.tar.gz")
    (synopsis "Python library for OBS WebSocket protocol")
    (description "Python-obsws is a Python library that provides a client for the
OBS Studio WebSocket protocol.  It allows controlling OBS Studio
programmatically from Python scripts for scene switching, streaming
control, and other automation tasks.")
    (license license:expat)))
;;; -------------------------------------------------------------------
;;; 64. python-pywavefront --- read Wavefront 3D OBJ files in Python
;;; -------------------------------------------------------------------
(define-public python-pywavefront
  (package
    (name "python-pywavefront")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pywavefront/PyWavefront/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pywavefront/PyWavefront/archive/refs/tags/{version}.tar.gz")
    (synopsis "read Wavefront 3D OBJ files in Python")
    (description "PyWavefront reads Wavefront 3D object files (OBJ, MTL) and provides
Python data structures for vertices, normals, texture coordinates,
and materials.  It supports visualization with Pyglet.")
    (license license:bsd-3)))
;;; -------------------------------------------------------------------
;;; 65. mkdocs-exclude --- MkDocs plugin to exclude files from documentation
;;; -------------------------------------------------------------------
(define-public mkdocs-exclude
  (package
    (name "mkdocs-exclude")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/apenwarr/mkdocs-exclude/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/apenwarr/mkdocs-exclude/archive/refs/tags/v{version}.tar.gz")
    (synopsis "MkDocs plugin to exclude files from documentation")
    (description "Mkdocs-exclude is a MkDocs plugin that lets you exclude specific
files and directories from your built documentation site using glob
patterns.  Useful for excluding drafts, templates, and other non-public
content.")
    (license license:asl2.0)))
;;; -------------------------------------------------------------------
;;; 66. dnstwist --- domain name permutation engine for DNS fuzzing
;;; -------------------------------------------------------------------
(define-public dnstwist
  (package
    (name "dnstwist")
    (version "20240812")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/elceef/dnstwist")
                    (commit "v20240812")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/elceef/dnstwist")
    (synopsis "domain name permutation engine for DNS fuzzing")
    (description "Dnstwist is a domain name permutation engine for detecting typosquatting,
phishing, and corporate espionage.  It generates lookalike domains using
various algorithmic techniques and checks their DNS, MX, SMTP, and HTTP
responses.")
    (license license:asl2.0)))
;;; -------------------------------------------------------------------
;;; 67. python-rtslib-fb --- Python library for Linux-IO target configuration
;;; -------------------------------------------------------------------
(define-public python-rtslib-fb
  (package
    (name "python-rtslib-fb")
    (version "2.1.76")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/open-iscsi/rtslib-fb/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/open-iscsi/rtslib-fb/archive/refs/tags/v{version}.tar.gz")
    (synopsis "Python library for Linux-IO target configuration")
    (description "Rtslib-fb is a Python library for configuring the Linux SCSI target
subsystem (LIO).  It provides an object model for managing storage
targets, backends, LUNs, portals, and ACLs used in iSCSI, Fibre
Channel, and other SCSI transports.")
    (license license:asl2.0)))
;;; -------------------------------------------------------------------
;;; 68. aspell-dict-sl --- Slovenian dictionary for GNU Aspell
;;; -------------------------------------------------------------------
(define-public aspell-dict-sl
  (package
    (name "aspell-dict-sl")
    (version "0.60.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/gnu/aspell/dict/sl/aspell6-sl-0.60-0.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ftp.gnu.org/gnu/aspell/dict/sl/aspell6-sl-0.60-0.tar.bz2")
    (synopsis "Slovenian dictionary for GNU Aspell")
    (description "This package provides a Slovenian language dictionary for the GNU
Aspell spell checker.  It includes comprehensive word lists for
Slovenian language spell-checking.")
    (license license:lgpl2.1+)))
;;; -------------------------------------------------------------------
;;; 69. aspell-dict-sr --- Serbian dictionary for GNU Aspell
;;; -------------------------------------------------------------------
(define-public aspell-dict-sr
  (package
    (name "aspell-dict-sr")
    (version "0.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.gnu.org/gnu/aspell/dict/sr/aspell6-sr-0.02.tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ftp.gnu.org/gnu/aspell/dict/sr/aspell6-sr-0.02.tar.bz2")
    (synopsis "Serbian dictionary for GNU Aspell")
    (description "This package provides a Serbian language dictionary for the GNU
Aspell spell checker.  It includes word lists in both Cyrillic and
Latin scripts for Serbian language spell-checking.")
    (license license:lgpl2.1+)))
;;; -------------------------------------------------------------------
;;; 70. fortune-mod-bofh-excuses --- BOFH excuses for the fortune program
;;; -------------------------------------------------------------------
(define-public fortune-mod-bofh-excuses
  (package
    (name "fortune-mod-bofh-excuses")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IgnorantGuru/fortune-mod-bofh-excuses/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("bofh-excuses" "share/fortune/bofh-excuses") ("bofh-excuses.dat" "share/fortune/bofh-excuses.dat"))))
    (home-page "https://github.com/IgnorantGuru/fortune-mod-bofh-excuses/archive/refs/heads/master.tar.gz")
    (synopsis "BOFH excuses for the fortune program")
    (description "A collection of Bastard Operator From Hell (BOFH) excuses packaged
for use with the fortune program.  Provides humorous system
administrator excuses for service outages and failures.")
    (license license:public-domain)))
;;; -------------------------------------------------------------------
;;; 71. fortune-mod-vimtips --- Vim tips for the fortune program
;;; -------------------------------------------------------------------
(define-public fortune-mod-vimtips
  (package
    (name "fortune-mod-vimtips")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hobbestigrou/fortune-mod-vimtips/archive/refs/heads/master.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("vimtips" "share/fortune/vimtips") ("vimtips.dat" "share/fortune/vimtips.dat"))))
    (home-page "https://github.com/hobbestigrou/fortune-mod-vimtips/archive/refs/heads/master.tar.gz")
    (synopsis "Vim tips for the fortune program")
    (description "A collection of Vim editor tips and tricks packaged for use with the
fortune program.  Displays random Vim tips when called with the
fortune command.")
    (license license:gpl3+)))
;;; -------------------------------------------------------------------
;;; 72. funny-manpages --- collection of humorous manual pages
;;; -------------------------------------------------------------------
(define-public funny-manpages
  (package
    (name "funny-manpages")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.debian.org/debian/pool/main/f/funny-manpages/funny-manpages_" version ".orig.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("man/" "share/man/"))))
    (home-page "https://ftp.debian.org/debian/pool/main/f/funny-manpages/funny-manpages_{version}.orig.tar.gz")
    (synopsis "collection of humorous manual pages")
    (description "A collection of humorous Unix manual pages including classics like
celibacy(5), condom(1), date(langstrumpf), and other parody man pages.
Provided as a lighthearted addition to the man page collection.")
    (license license:public-domain)))
;;; -------------------------------------------------------------------
;;; 73. hunspell-ru-aot --- Russian dictionary for Hunspell from AOT project
;;; -------------------------------------------------------------------
(define-public hunspell-ru-aot
  (package
    (name "hunspell-ru-aot")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickshanks/hunspell-ru-aot/archive/refs/heads/main.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("ru_RU.dic" "share/hunspell/ru_RU.dic") ("ru_RU.aff" "share/hunspell/ru_RU.aff"))))
    (home-page "https://github.com/nickshanks/hunspell-ru-aot/archive/refs/heads/main.tar.gz")
    (synopsis "Russian dictionary for Hunspell from AOT project")
    (description "Russian language dictionary for the Hunspell spell checker, derived
from the AOT (Automatic Object Text) project.  Provides comprehensive
Russian word lists including declensions and conjugations.")
    (license license:lgpl2.1+)))
;;; -------------------------------------------------------------------
;;; 74. hyphen-pl --- Polish hyphenation patterns for LibreOffice
;;; -------------------------------------------------------------------
(define-public hyphen-pl
  (package
    (name "hyphen-pl")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickshanks/hyphen-pl/archive/refs/heads/main.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("hyph_pl_PL.dic" "share/hyphen/hyph_pl_PL.dic"))))
    (home-page "https://github.com/nickshanks/hyphen-pl/archive/refs/heads/main.tar.gz")
    (synopsis "Polish hyphenation patterns for LibreOffice")
    (description "Polish language hyphenation patterns for use with LibreOffice,
OpenOffice, and other applications using the Hunspell hyphenation
library.")
    (license license:lgpl2.1+)))
;;; -------------------------------------------------------------------
;;; 75. words-sv --- Swedish word list for spell-checking
;;; -------------------------------------------------------------------
(define-public words-sv
  (package
    (name "words-sv")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nickshanks/words-sv/archive/refs/heads/main.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("words" "share/dict/swedish"))))
    (home-page "https://github.com/nickshanks/words-sv/archive/refs/heads/main.tar.gz")
    (synopsis "Swedish word list for spell-checking")
    (description "A comprehensive Swedish word list suitable for use with spell-checking
programs and text processing tools.  Provides the standard Swedish
vocabulary.")
    (license license:lgpl2.1+)))
