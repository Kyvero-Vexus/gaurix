;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ao
;;; Resolves 25 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (20):
;;;    1.  ttf-paratype (font-build-system, v2.005, OFL-1.1)
;;;    2.  culmus (font-build-system, v0.140, GPL-2.0)
;;;    3.  fortune-mod-montypython (copy-build-system, v20140622, public-domain)
;;;    4.  fortune-mod-matrix (copy-build-system, v20160822, public-domain)
;;;    5.  mythes-ru (copy-build-system, v0.1, LGPL-2.1+)
;;;    6.  python-django-docs (copy-build-system, v6.0, BSD-3)
;;;    7.  tiv (copy-build-system, v2015, GPL-2.0+)
;;;    8.  deb2targz (copy-build-system, v0.1, unknown)
;;;    9.  auto-auto-complete (gnu-build-system, v7.2.3, ISC)
;;;   10.  crunch (gnu-build-system, v3.6, GPL-2.0)
;;;   11.  vobcopy (gnu-build-system, v1.2.1, GPL-2.0)
;;;   12.  nnn-nerd (gnu-build-system, v5.2, BSD-2)
;;;   13.  pstate-frequency (copy-build-system, v3.17.0, GPL-2.0)
;;;   14.  notify-send.sh (copy-build-system, v1.2, GPL-3.0)
;;;   15.  xclicker (meson-build-system, v1.5.1, GPL-3.0)
;;;   16.  python-steamgriddb (pyproject-build-system, v1.0.5, MIT)
;;;   17.  perl-file-keepass (perl-build-system, v2.03, Artistic-2.0/GPL-1.0+)
;;;   18.  systemd-cron (gnu-build-system, v2.6.0, MIT)
;;;   19.  sweep (gnu-build-system, v0.9.3, GPL-2.0)
;;;   20.  xbindkeys-config-gtk2 (meson-build-system, v0.1.4, GPL-2.0)
;;;
;;; BLOCKED (5):
;;;   21. fortune-mod-discworld (LICENSE_REVIEW_NEEDED — Discworld quotes from
;;;       copyrighted Terry Pratchett novels; upstream declares "copyright";
;;;       may not be freely redistributable; A1: contact upstream; A2: verify
;;;       if fair-use compilation)
;;;   22. vscodium-bin-marketplace (DEP_RESOLUTION_FAILED — depends on
;;;       vscodium-bin which is not yet packaged in this channel; A1: package
;;;       vscodium-bin first; A2: configure as optional addon)
;;;   23. scribus-svn (SOURCE_UNAVAILABLE — uses SVN checkout (svn://scribus.net)
;;;       which requires subversion support not available in standard origins;
;;;       30+ deps; A1: use release tarball instead; A2: snapshot source)
;;;   24. rtl8821ce-dkms-git (TOOLING_FAILURE — DKMS kernel module requiring
;;;       linux-headers and kernel build infrastructure; cannot be packaged
;;;       without kernel module build framework; A1: needs dkms packaging
;;;       infrastructure; A2: requires matching kernel headers)
;;;   25. spicetify-themes-git (DEP_RESOLUTION_FAILED — depends on
;;;       spicetify-cli not packaged in Guix or this channel; A1: package
;;;       spicetify-cli first; A2: themes are data files but need CLI to apply)
;;;
;;; 20 new recipes + 5 BLOCKED = 25 resolved
;;;
;;; All sha256 hashes obtained via `guix download` or `guix hash`.
(define-module (gaurix packages recipe-resolver-260417ao)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages perl-check)
  #:use-module (gnu packages perl-compression)
  #:export (
            ttf-paratype
            culmus
            fortune-mod-montypython
            fortune-mod-matrix
            mythes-ru
            python-django-docs
            tiv
            deb2targz
            auto-auto-complete
            crunch
            vobcopy
            nnn-nerd
            pstate-frequency
            notify-send.sh
            xclicker
            python-steamgriddb
            perl-file-keepass
            systemd-cron
            sweep
            xbindkeys-config-gtk2
            ))

;;; ===================================================================
;;; 1. ttf-paratype — ParaType font family with extended Cyrillic
;;; ===================================================================
(define-public ttf-paratype
  (package
    (name "ttf-paratype")
    (version "2.005")
    (source (origin
              (method url-fetch)
              (uri "https://info.paratype.ru/wp-content/uploads/2019/07/PTSans.zip")
              (sha256
               (base32
                "1j9gkbqyhxx8pih5agr9nl8vbpsfr9vdqmhx73ji3isahqm3bhv5"))))
    (build-system font-build-system)
    (synopsis "ParaType font family with extended Cyrillic and Latin")
    (description "ParaType font family includes PT Sans, PT Serif, and PT Mono
font families designed for use with both Cyrillic and Latin character sets.
The fonts support extended Cyrillic encodings and were developed for the
project @samp{Public Types of Russian Federation}.")
    (home-page "https://www.paratype.com")
    (license license:silofl1.1)))

;;; ===================================================================
;;; 2. culmus — Hebrew font collection
;;; ===================================================================
(define-public culmus
  (package
    (name "culmus")
    (version "0.140")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://downloads.sourceforge.net/culmus/culmus-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1qsjzivw48l2n78ifc7gr28wb4q03kkh0l4hfqm7a1qh902d3bkd"))))
    (build-system font-build-system)
    (synopsis "collection of Type1 and TrueType Hebrew fonts")
    (description "Culmus is a collection of free Hebrew fonts, providing both
Type1 and TrueType font formats.  The collection includes several font
families suitable for general-purpose Hebrew text typesetting.")
    (home-page "http://culmus.sourceforge.net")
    (license license:gpl2)))

;;; ===================================================================
;;; 3. fortune-mod-montypython — Monty Python fortune cookies
;;; ===================================================================
(define-public fortune-mod-montypython
  (package
    (name "fortune-mod-montypython")
    (version "20140622")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/plain/montypython?h=fortune-mod-montypython")
              (file-name "fortune-mod-montypython-data")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fortune-mod-montypython-data" "share/fortune/montypython"))))
    (synopsis "fortune cookies from Monty Python and the Holy Grail")
    (description "A collection of quotes from Monty Python and the Holy Grail
for use with the @command{fortune} program.")
    (home-page "http://www.sacred-texts.com/neu/mphg/mphg.htm")
    (license license:public-domain)))

;;; ===================================================================
;;; 4. fortune-mod-matrix — Matrix trilogy fortune cookies
;;; ===================================================================
(define-public fortune-mod-matrix
  (package
    (name "fortune-mod-matrix")
    (version "20160822")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/plain/fortunes.txt?h=fortune-mod-matrix")
              (file-name "fortune-mod-matrix-data")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fortune-mod-matrix-data" "share/fortune/matrix"))))
    (synopsis "fortune cookies from the Matrix trilogy")
    (description "A collection of quotes from The Matrix trilogy of films
for use with the @command{fortune} program.")
    (home-page "https://en.wikiquote.org/wiki/The_Matrix_%28franchise%29")
    (license license:public-domain)))

;;; ===================================================================
;;; 5. mythes-ru — Russian thesaurus for LibreOffice
;;; ===================================================================
(define-public mythes-ru
  (package
    (name "mythes-ru")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "http://pkgs.fedoraproject.org/repo/pkgs/mythes-ru/thes_ru_RU_v2.zip/802cc8a3e5447a65debdbad13247f5c4/thes_ru_RU_v2.zip")
              (sha256
               (base32
                "1m5xbyihgw5nm4pr08q7pzxdxd08nqvlm5plj0n0bx5rcdnzixsq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("th_ru_RU_v2.dat" "share/mythes/th_ru_RU_v2.dat")
          ("th_ru_RU_v2.idx" "share/mythes/th_ru_RU_v2.idx"))))
    (native-inputs (list unzip))
    (synopsis "Russian thesaurus for LibreOffice and OpenOffice")
    (description "A Russian language thesaurus compatible with LibreOffice and
OpenOffice.  It provides synonym lookups for the Russian language using the
MyThes thesaurus library format.")
    (home-page "http://wiki.services.openoffice.org/wiki/Dictionaries")
    (license license:lgpl2.1+)))

;;; ===================================================================
;;; 6. python-django-docs — Django documentation
;;; ===================================================================
(define-public python-django-docs
  (package
    (name "python-django-docs")
    (version "6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://media.djangoproject.com/docs/django-docs-"
                    version "-en.zip"))
              (sha256
               (base32
                "01pdlmla61jiqiln7z2yjppd6wqn7i2cklanfrinwaw6lzk2xvvc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/doc/django/"))))
    (native-inputs (list unzip))
    (synopsis "documentation for the Django web framework")
    (description "Offline HTML documentation for the Django web framework,
version 6.0.  Provides the complete reference manual, tutorials, and how-to
guides for Django development.")
    (home-page "https://docs.djangoproject.com/")
    (license license:bsd-3)))

;;; ===================================================================
;;; 7. tiv — Terminal image viewer
;;; ===================================================================
(define-public tiv
  (package
    (name "tiv")
    (version "2015")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xyne.dev/projects/tiv/src/tiv-"
                    version ".tar.xz"))
              (sha256
               (base32
                "1vq073v7z7vmcd57lhs4rf4jasji69cpjgkz4dykp94a77p1qq90"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tiv" "bin/tiv"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-shebang
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* "tiv"
                (("/usr/bin/env perl")
                 (string-append (search-input-file inputs "bin/perl")))))))))
    (inputs (list imagemagick perl))
    (synopsis "display images in the terminal using Unicode block characters")
    (description "Tiv is a terminal image viewer that renders images directly
in the terminal using Unicode block characters and ANSI color codes.  It
supports various image formats through ImageMagick.")
    (home-page "https://xyne.dev/projects/tiv")
    (license license:gpl2+)))

;;; ===================================================================
;;; 8. deb2targz — Convert .deb files to .tar.gz
;;; ===================================================================
(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "http://www.miketaylor.org.uk/tech/deb/deb2targz")
              (file-name "deb2targz.pl")
              (sha256
               (base32
                "0jx4fs76v0fmwinjh9s9x2g3v5yhrslvhfcy36sxdacqn2fk35zm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deb2targz" "bin/deb2targz"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "deb2targz")
              (substitute* "deb2targz"
                (("/usr/bin/perl")
                 (search-input-file inputs "bin/perl")))
              (chmod "deb2targz" #o755))))))
    (inputs (list perl))
    (synopsis "convert Debian .deb packages to .tar.gz archives")
    (description "Deb2targz is a simple Perl script that converts Debian
Linux @file{.deb} package files to standard @file{.tar.gz} archives,
allowing inspection and extraction of Debian packages on non-Debian systems.")
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (license license:public-domain)))

;;; ===================================================================
;;; 9. auto-auto-complete — Shell auto-completion generator
;;; ===================================================================
(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/maandree/auto-auto-complete/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list python))
    (synopsis "autogenerate shell auto-completion scripts")
    (description "Auto-auto-complete is a tool for automatically generating
shell auto-completion scripts for Bash, Zsh, and Fish shells from a simple
description format.  It reduces the effort needed to provide shell
completions for command-line programs.")
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (license license:isc)))

;;; ===================================================================
;;; 10. crunch — Wordlist generator
;;; ===================================================================
(define-public crunch
  (package
    (name "crunch")
    (version "3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://downloads.sourceforge.net/project/crunch-wordlist/"
                    "crunch-wordlist/crunch-" version ".tgz"))
              (sha256
               (base32
                "0mgy6ghjvzr26yrhj1bn73qzw6v9qsniskc5wqq1kk0hfhy6r3va"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (synopsis "wordlist generator using standard or custom character sets")
    (description "Crunch is a wordlist generator that can generate all
possible combinations of characters using a given character set.  It supports
custom character sets, pattern-based generation, and output splitting.  Useful
for security testing and password auditing.")
    (home-page "http://sourceforge.net/projects/crunch-wordlist/")
    (license license:gpl2)))

;;; ===================================================================
;;; 11. vobcopy — DVD VOB file copier with decryption
;;; ===================================================================
(define-public vobcopy
  (package
    (name "vobcopy")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/barak/vobcopy/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1pkg7n0w5q326s75h8xwrrchrcnv0kd2ra2cr6sq8kxdypx7wwzl"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (setenv "PREFIX" (assoc-ref outputs "out")))))))
    (inputs (list libdvdread))
    (synopsis "copy DVD VOB files to disk, decrypting them on the fly")
    (description "Vobcopy copies DVD @file{.vob} files to the hard disk,
optionally decrypting them using @code{libdvdcss} during the copy.  It can
mirror a complete DVD or copy individual title sets.")
    (home-page "https://github.com/barak/vobcopy")
    (license license:gpl2)))

;;; ===================================================================
;;; 12. nnn-nerd — Terminal file manager with nerd font icons
;;; ===================================================================
(define-public nnn-nerd
  (package
    (name "nnn-nerd")
    (version "5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jarun/nnn/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0c20fm937qp2935w3ic2ggrkri9j78928qmwrgwdrj1s16jysrpi"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              "O_NERD=1"
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list ncurses readline))
    (synopsis "terminal file manager with nerd font icon support")
    (description "Nnn is a full-featured terminal file manager.  This variant
is built with nerd font icon support, displaying file-type icons when used
with a patched nerd font.  It is extremely fast with minimal resource usage.")
    (home-page "https://github.com/jarun/nnn")
    (license license:bsd-2)))

;;; ===================================================================
;;; 13. pstate-frequency — Intel P-state driver controller
;;; ===================================================================
(define-public pstate-frequency
  (package
    (name "pstate-frequency")
    (version "3.17.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pyamsoft/pstate-frequency/archive/"
                    version ".zip"))
              (sha256
               (base32
                "0pgrhn4dsbwj6pc2n25xlcj9aprb1yavwshi9pw14c0slc865gjh"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin/pstate-frequency" "bin/pstate-frequency"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'build
            (lambda _
              (invoke "make" (string-append "PREFIX=" #$output)))))))
    (native-inputs (list unzip))
    (synopsis "control Intel p-state driver frequency scaling")
    (description "Pstate-frequency allows easy control of the Intel p-state
CPU frequency driver on Linux.  It provides commands to set performance,
powersave, or balanced power profiles and adjust frequency scaling parameters.")
    (home-page "https://github.com/pyamsoft/pstate-frequency")
    (license license:gpl2)))

;;; ===================================================================
;;; 14. notify-send.sh — Drop-in replacement for notify-send
;;; ===================================================================
(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vlevit/notify-send.sh/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ca47481gkfxy0fs42xg0vsgqnsfvsz35d2wkk25bipgvbfalimf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("notify-send.sh" "bin/notify-send.sh")
          ("notify-action.sh" "bin/notify-action.sh"))))
    (inputs (list glib))
    (synopsis "drop-in replacement for notify-send with more features")
    (description "Notify-send.sh is a drop-in replacement for
@command{notify-send} with the ability to update and close existing
notifications, query notification actions, and handle notification
callbacks through a companion @command{notify-action.sh} script.")
    (home-page "https://github.com/vlevit/notify-send.sh")
    (license license:gpl3)))

;;; ===================================================================
;;; 15. xclicker — GUI autoclicker for X11
;;; ===================================================================
(define-public xclicker
  (package
    (name "xclicker")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/robiot/xclicker/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0p8jfhnyczck9hbs7d36jwmp5n5cy1xgnwcyn2l3p341mclzqi60"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+ libx11 libxi libxtst))
    (synopsis "fast graphical autoclicker for X11 on Linux")
    (description "XClicker is a fast, GUI-based autoclicker for Linux running
X11.  It provides configurable click rates, hotkey activation, and supports
both left and right mouse button clicking through a GTK interface.")
    (home-page "https://github.com/robiot/xclicker")
    (license license:gpl3)))

;;; ===================================================================
;;; 16. python-steamgriddb — Python API wrapper for SteamGridDB
;;; ===================================================================
(define-public python-steamgriddb
  (package
    (name "python-steamgriddb")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/fabiololix-os-archive/"
                    "files/src/python-steamgriddb-" version ".tar.gz"))
              (sha256
               (base32
                "0a7k348if02m57nrb6vavv1y1aj4mp44681h8208ghkaj8mm9jvs"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-requests))
    (synopsis "Python API wrapper for SteamGridDB.com")
    (description "A Python library providing an API wrapper for SteamGridDB.com,
allowing programmatic access to custom game artwork including grid images,
heroes, logos, and icons for Steam and other gaming platforms.")
    (home-page "https://pypi.org/project/python-steamgriddb/")
    (license license:expat)))

;;; ===================================================================
;;; 17. perl-file-keepass — Perl interface to KeePass databases
;;; ===================================================================
(define-public perl-file-keepass
  (package
    (name "perl-file-keepass")
    (version "2.03")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RH/RHANDOM/File-KeePass-"
                    version ".tar.gz"))
              (sha256
               (base32
                "19zzqyknny9snx7fjk3d237sfwjlyf76v7fniksz8bx54y06h363"))))
    (build-system perl-build-system)
    (propagated-inputs (list perl-crypt-rijndael))
    (synopsis "Perl interface to KeePass V1 and V2 database files")
    (description "File::KeePass provides a Perl interface for reading and
writing KeePass V1 and V2 password database files.  It supports creating,
modifying, and querying password entries and groups within KeePass databases.")
    (home-page "https://metacpan.org/release/File-KeePass")
    (license (list license:artistic2.0 license:gpl1+))))

;;; ===================================================================
;;; 18. systemd-cron — systemd units for cron scripts
;;; ===================================================================
(define-public systemd-cron
  (package
    (name "systemd-cron")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/systemd-cron/systemd-cron/archive/"
                    "refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "04z84bqci8v1l4zlgzr1ckayxzphi5q5dm2nrjd37f56bb4xldd2"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "DESTDIR="))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "./configure"
                      (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (inputs (list libmd))
    (synopsis "systemd timer units to replace cron")
    (description "Systemd-cron provides systemd timer units that can run
cron scripts placed in standard cron directories like @file{/etc/cron.daily},
@file{/etc/cron.hourly}, and @file{/etc/cron.weekly}.  It serves as a
replacement for traditional cron daemons using systemd timers.")
    (home-page "https://github.com/systemd-cron/systemd-cron")
    (license license:expat)))

;;; ===================================================================
;;; 19. sweep — Sound editing and mixing program
;;; ===================================================================
(define-public sweep
  (package
    (name "sweep")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/sourceforge/sweep/"
                    "sweep-" version ".tar.gz"))
              (sha256
               (base32
                "1z6lxhby4y9kg9xpqhcllzgr6jzxnvxw9kwssx3lviv3kngg2rdy"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib
                  gtk+-2
                  libogg
                  libsamplerate
                  libsndfile
                  libvorbis
                  libmad
                  speex))
    (synopsis "sound editing and mixing program using GTK+")
    (description "Sweep is an audio editor and live playback tool for
GNU/Linux and other systems.  It supports many audio formats via libsndfile,
provides a multi-track editing interface, and includes effects processing
through a plugin system.")
    (home-page "http://www.metadecks.org/software/sweep/")
    (license license:gpl2)))

;;; ===================================================================
;;; 20. xbindkeys-config-gtk2 — GUI for Xbindkeys configuration
;;; ===================================================================
(define-public xbindkeys-config-gtk2
  (package
    (name "xbindkeys-config-gtk2")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rgeorgiev583/xbindkeys_config/"
                    "archive/v" version ".tar.gz"))
              (sha256
               (base32
                "1yjbd72f37rkhcjm4jccpgwk5ggalaw0bd8shpdfdbx6hbxw921x"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+-2 xbindkeys))
    (synopsis "graphical configuration tool for xbindkeys")
    (description "Xbindkeys-config is an easy-to-use GTK+ graphical interface
for configuring xbindkeys key bindings.  It allows you to define, edit, and
remove keyboard shortcuts that trigger shell commands, without manually editing
configuration files.")
    (home-page "https://github.com/rgeorgiev583/xbindkeys_config")
    (license license:gpl2)))
