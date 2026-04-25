;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425k: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   spyder-line-profiler
   fatrace-minimal
   verso-git
   fortune-mod-anti-jokes-git
   tnylpo-git
   cn-com-10jqka
   btrfs-progs-git
   gala-git
   keepassc
   alpine-git
   ffdiaporama
   hunspell-uk
   nutstore
   mist-icon-theme
   zhcon
   vim-go
   telegram-purple-git
   audacious-vortigo-themes
   betterlockscreen-git
   fusioninventory-agent
   intelpwm-udev
   php81-opcache
   compiz-manager
   flood-git
   pacfoster
   quickbms
   pcaudiolib-git
   wally
   mgba-sdl-git
   gweled
   perl-find-lib
   openhantek6022
   git-cal-git
   mtproxy-git
   vgrep
   openni2
   rakarrack-docs
   landdown-git
   energyplus
   hypr-git
   palemoon-gtk3-bin
   nanopond
   xmr-stak-nvidia-git
   veroroute
   aqemu-git
   d2vwitch-git
   farragone
   light-locker-git
   moksha-module-engage-git
   php56-imagick
   rsiedit-bin
   openage
   arm-linux-gnueabi-binutils
   espeakup-git
   realcugan-ncnn-vulkan-git
   mpack
   bambootracker-git
   glportal
   magnetico-bin
   minecraft-c
   mshr
   ocarina
   otf-gandhifamily
   play-emu-git
   prelockd
   python-inotifyrecursive
   uenv
   vim-sxhkdrc-git
   otf-libre-caslon
   ts-bugreport
   vim-dart-plugin-git
   w3perl
   zentile
   lossless-adapter-manager
   jdk21-openj9-bin
   git-tools-git
   mshv
   bertini-parallel
   birtty
   perl-webservice-musicbrainz
   perl-http-request-ascgi
   kxstitch
   guile-sqlite3
   python-louvain
   guile-dbd-postgresql
   perl-catalyst-component-instancepercontext
   r-munsell
   r-quantreg
   cavecube-bin
   eternallands
   fbc-git
   frece-git
   houserat
   ipe-tools-git
   kibot
   kwin6-effects-burn-my-windows
   linux-test-project
   konversation-theme-matchama
   mbtserver
   mkpwd
   ))

;;; spyder-line-profiler — Plugin for the Spyder IDE that integrates the Python line pr
(define-public spyder-line-profiler
  (package
    (name "spyder-line-profiler")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://docs.spyder-ide.org/current/plugins/lineprofiler.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.spyder-ide.org/current/plugins/lineprofiler.html")
    (synopsis "plugin for the Spyder IDE that integrates the Python line profiler")
    (description "Plugin for the Spyder IDE that integrates the Python line profiler.")
    (license license:expat)))

;;; fatrace-minimal — Reports file access events from running processes. Without p
(define-public fatrace-minimal
  (package
    (name "fatrace-minimal")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/martinpitt/fatrace/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/martinpitt/fatrace")
    (synopsis "reports file access events from running processes. Without powertop and pytho")
    (description "Reports file access events from running processes. Without powertop and python dependency; i.e. without the 'power-usage.")
    (license license:gpl3+)))

;;; verso-git — A web browser that plays old world blues to build new world 
(define-public verso-git
  (package
    (name "verso-git")
    (version "20250324.052031.d567c169")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/versotile-org/verso/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/versotile-org/verso")
    (synopsis "a web browser that plays old world blues to build new world hope")
    (description "A web browser that plays old world blues to build new world hope.")
    (license (list license:asl2.0 license:expat))))

;;; fortune-mod-anti-jokes-git — Anti-jokes fortune cookies
(define-public fortune-mod-anti-jokes-git
  (package
    (name "fortune-mod-anti-jokes-git")
    (version "r1.cc15045")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/gandag/fortune-anti-jokes/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/fortune-mod-anti-jokes-git"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gandag/fortune-anti-jokes")
    (synopsis "anti-jokes fortune cookies")
    (description "Anti-jokes fortune cookies.")
    (license #f)))

;;; tnylpo-git — A utility to run programs written for CP/M-80.
(define-public tnylpo-git
  (package
    (name "tnylpo-git")
    (version "r210.0eea604")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/gbrein/tnylpo/-/archive/v" version "/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/tnylpo-git"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/gbrein/tnylpo")
    (synopsis "a utility to run programs written for CP/M-80")
    (description "A utility to run programs written for CP/M-80.")
    (license #f)))

;;; cn-com-10jqka — cn.com.10jqka(royalflush/tonghuashun/同花顺) - a tool for scann
(define-public cn-com-10jqka
  (package
    (name "cn.com.10jqka")
    (version "2.7.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.10jqka.com.cn")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/cn.com.10jqka"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.10jqka.com.cn")
    (synopsis "cn.com.10jqka(royalflush/tonghuashun/同花顺) - a tool for scanning the stock inf")
    (description "Cn.com.10jqka(royalflush/tonghuashun/同花顺) - a tool for scanning the stock infomation.")
    (license #f)))

;;; btrfs-progs-git — Btrfs filesystem utilities
(define-public btrfs-progs-git
  (package
    (name "btrfs-progs-git")
    (version "7426_6.12_r59_ge162294e")
    (source
     (origin
       (method url-fetch)
       (uri "https://btrfs.wiki.kernel.org/index.php/Main_Page")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://btrfs.wiki.kernel.org/index.php/Main_Page")
    (synopsis "btrfs filesystem utilities")
    (description "Btrfs filesystem utilities.")
    (license license:gpl2)))

;;; gala-git — The Pantheon Window Manager
(define-public gala-git
  (package
    (name "gala-git")
    (version "8.0.1.r13.ga31eab4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/elementary/gala/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/elementary/gala")
    (synopsis "the Pantheon Window Manager")
    (description "The Pantheon Window Manager.")
    (license license:gpl3+)))

;;; keepassc — KeePassC is a curses-based password manager compatible to Ke
(define-public keepassc
  (package
    (name "keepassc")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://raymontag.github.com/keepassc")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://raymontag.github.com/keepassc")
    (synopsis "keePassC is a curses-based password manager compatible to KeePass v.1.x and K")
    (description "KeePassC is a curses-based password manager compatible to KeePass v.1.x and KeePassX.")
    (license license:gpl3+)))

;;; alpine-git — Fork of the PINE mail client (git)
(define-public alpine-git
  (package
    (name "alpine-git")
    (version "2.26.0.678.267cba3")
    (source
     (origin
       (method url-fetch)
       (uri "https://alpineapp.email/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alpineapp.email/")
    (synopsis "fork of the PINE mail client (git)")
    (description "Fork of the PINE mail client (git).")
    (license license:asl2.0)))

;;; ffdiaporama — Movie creator from photos and video clips
(define-public ffdiaporama
  (package
    (name "ffdiaporama")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://ffdiaporama.tuxfamily.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://ffdiaporama.tuxfamily.org")
    (synopsis "movie creator from photos and video clips")
    (description "Movie creator from photos and video clips.")
    (license license:gpl2+)))

;;; hunspell-uk — Ukrainian spelling dictionary
(define-public hunspell-uk
  (package
    (name "hunspell-uk")
    (version "6.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/brown-uk/dict_uk/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/hunspell-uk"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/brown-uk/dict_uk")
    (synopsis "ukrainian spelling dictionary")
    (description "Ukrainian spelling dictionary.")
    (license (list license:cc-by-sa4.0 license:gpl3+))))

;;; nutstore — a cloud service that lets you sync and share files anywhere.
(define-public nutstore
  (package
    (name "nutstore")
    (version "6.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.jianguoyun.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/nutstore"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jianguoyun.com/")
    (synopsis "a cloud service that lets you sync and share files anywhere")
    (description "A cloud service that lets you sync and share files anywhere.")
    (license #f)))

;;; mist-icon-theme — Mist icon theme
(define-public mist-icon-theme
  (package
    (name "mist-icon-theme")
    (version "3.0.0+20+gaaba3bb")
    (source
     (origin
       (method url-fetch)
       (uri "https://wiki.gnome.org/Design")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Design")
    (synopsis "mist icon theme")
    (description "Mist icon theme.")
    (license license:gpl3+)))

;;; zhcon — A Fast CJK Virtual Console
(define-public zhcon
  (package
    (name "zhcon")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://downloads.sourceforge.net/zhco/zhco-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://zhcon.sourceforge.net")
    (synopsis "a Fast CJK Virtual Console")
    (description "A Fast CJK Virtual Console.")
    (license license:gpl3+)))

;;; vim-go — Go development plugin for Vim
(define-public vim-go
  (package
    (name "vim-go")
    (version "1.29")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/fatih/vim-go/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fatih/vim-go")
    (synopsis "go development plugin for Vim")
    (description "Go development plugin for Vim.")
    (license license:bsd-3)))

;;; telegram-purple-git — Adds support for Telegram to Pidgin, Adium, Finch and other 
(define-public telegram-purple-git
  (package
    (name "telegram-purple-git")
    (version "1.4.7.r2.g5a98a34")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/majn/telegram-purple/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/majn/telegram-purple")
    (synopsis "adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based m")
    (description "Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers.")
    (license license:gpl3+)))

;;; audacious-vortigo-themes — Vortigo themes for Audacious
(define-public audacious-vortigo-themes
  (package
    (name "audacious-vortigo-themes")
    (version "20080531")
    (source
     (origin
       (method url-fetch)
       (uri "http://gnome-look.org/content/show.php/Vortigo+++%28+3D%2BVU%2BBeryl%2BDock+%29?content=55440")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/audacious-vortigo-themes"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://gnome-look.org/content/show.php/Vortigo+++%28+3D%2BVU%2BBeryl%2BDock+%29?content=55440")
    (synopsis "vortigo themes for Audacious")
    (description "Vortigo themes for Audacious.")
    (license license:gpl3+)))

;;; betterlockscreen-git — A simple lock script for i3lock-color
(define-public betterlockscreen-git
  (package
    (name "betterlockscreen-git")
    (version "v4.1.0.r0.ga4eeddf")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/betterlockscreen/betterlockscreen/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/betterlockscreen-git"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/betterlockscreen/betterlockscreen")
    (synopsis "a simple lock script for i3lock-color")
    (description "A simple lock script for i3lock-color.")
    (license license:expat)))

;;; fusioninventory-agent — An application for keeping track of the hardware and softwar
(define-public fusioninventory-agent
  (package
    (name "fusioninventory-agent")
    (version "2.6")
    (source
     (origin
       (method url-fetch)
       (uri "http://fusioninventory.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://fusioninventory.org")
    (synopsis "an application for keeping track of the hardware and software")
    (description "An application for keeping track of the hardware and software.")
    (license license:gpl3+)))

;;; intelpwm-udev — UDEV rules for setting backlight PWM frequency on Intel HD G
(define-public intelpwm-udev
  (package
    (name "intelpwm-udev")
    (version "20180831")
    (source
     (origin
       (method url-fetch)
       (uri "http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/intelpwm-udev"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://devbraindom.blogspot.com/2013/03/eliminate-led-screen-flicker-with-intel.html")
    (synopsis "uDEV rules for setting backlight PWM frequency on Intel HD Graphics")
    (description "UDEV rules for setting backlight PWM frequency on Intel HD Graphics.")
    (license license:gpl3+)))

;;; php81-opcache — opcache zend module for php81
(define-public php81-opcache
  (package
    (name "php81-opcache")
    (version "8.1.34")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.php.net")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.php.net")
    (synopsis "opcache zend module for php81")
    (description "Opcache zend module for php81.")
    (license #f)))

;;; compiz-manager — Compiz Fusion Starter Program
(define-public compiz-manager
  (package
    (name "compiz-manager")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.compiz.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/compiz-manager"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.compiz.org/")
    (synopsis "compiz Fusion Starter Program")
    (description "Compiz Fusion Starter Program.")
    (license license:gpl3+)))

;;; flood-git — A modern web UI for various torrent clients with a Node.js b
(define-public flood-git
  (package
    (name "flood-git")
    (version "4.9.0.r2.g0931304")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jesec/flood/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jesec/flood")
    (synopsis "a modern web UI for various torrent clients with a Node.js backend and React ")
    (description "A modern web UI for various torrent clients with a Node.js backend and React frontend.")
    (license license:gpl3)))

;;; pacfoster — A cleaning script similar to 'debfoster', using the pacman b
(define-public pacfoster
  (package
    (name "pacfoster")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://bbs.archlinux.org/viewtopic.php?pid=834436")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bbs.archlinux.org/viewtopic.php?pid=834436")
    (synopsis "a cleaning script similar to 'debfoster', using the pacman build system")
    (description "A cleaning script similar to 'debfoster', using the pacman build system.")
    (license license:gpl3+)))

;;; quickbms — Files extractor and reimporter, archives and file formats pa
(define-public quickbms
  (package
    (name "quickbms")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://aluigi.altervista.org/quickbms.htm")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://aluigi.altervista.org/quickbms.htm")
    (synopsis "files extractor and reimporter, archives and file formats parser, advanced to")
    (description "Files extractor and reimporter, archives and file formats parser, advanced tool for reversers and power users and much m.")
    (license license:gpl2+)))

;;; pcaudiolib-git — Portable C Audio Library (development version)
(define-public pcaudiolib-git
  (package
    (name "pcaudiolib-git")
    (version "1.2.r9.g494e7cd")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/espeak-ng/pcaudiolib/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/espeak-ng/pcaudiolib")
    (synopsis "portable C Audio Library (development version)")
    (description "Portable C Audio Library (development version).")
    (license license:gpl3+)))

;;; wally — Qt4 desktop wallpaper changer, using multiple online and off
(define-public wally
  (package
    (name "wally")
    (version "2.4.5")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.becrux.com/index.php?page=projects&name=wally")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.becrux.com/index.php?page=projects&name=wally")
    (synopsis "qt4 desktop wallpaper changer, using multiple online and offline sources")
    (description "Qt4 desktop wallpaper changer, using multiple online and offline sources.")
    (license license:gpl3+)))

;;; mgba-sdl-git — A Nintendo Gameboy Advance Emulator focusing on both speed a
(define-public mgba-sdl-git
  (package
    (name "mgba-sdl-git")
    (version "0.11.0.r8409.5d92c3ca0")
    (source
     (origin
       (method url-fetch)
       (uri "http://mgba.io/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://mgba.io/")
    (synopsis "a Nintendo Gameboy Advance Emulator focusing on both speed and accuracy (git ")
    (description "A Nintendo Gameboy Advance Emulator focusing on both speed and accuracy (git build).")
    (license license:mpl2.0)))

;;; gweled — A puzzle game similar to Bejeweled or Diamond Mine
(define-public gweled
  (package
    (name "gweled")
    (version "1.0.beta1")
    (source
     (origin
       (method url-fetch)
       (uri "https://gweled.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gweled.org")
    (synopsis "a puzzle game similar to Bejeweled or Diamond Mine")
    (description "A puzzle game similar to Bejeweled or Diamond Mine.")
    (license license:gpl2+)))

;;; perl-find-lib — Helper to smartly find libs to use in the filesystem tree
(define-public perl-find-lib
  (package
    (name "perl-find-lib")
    (version "1.04")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cpan.metacpan.org/authors/id/.../find-lib-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://search.cpan.org/dist/Find-Lib")
    (synopsis "helper to smartly find libs to use in the filesystem tree")
    (description "Helper to smartly find libs to use in the filesystem tree.")
    (license (list license:gpl3+ license:artistic2.0))))

;;; openhantek6022 — A DSO software for Hantek USB digital signal oscilloscopes 6
(define-public openhantek6022
  (package
    (name "openhantek6022")
    (version "3.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/OpenHantek/OpenHantek6022/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenHantek/OpenHantek6022")
    (synopsis "a DSO software for Hantek USB digital signal oscilloscopes 6022BE/BL")
    (description "A DSO software for Hantek USB digital signal oscilloscopes 6022BE/BL.")
    (license license:gpl3+)))

;;; git-cal-git — github like contributions calendar on terminal
(define-public git-cal-git
  (package
    (name "git-cal-git")
    (version "r96.b3bb376")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/k4rthik/git-cal/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/k4rthik/git-cal")
    (synopsis "github like contributions calendar on terminal")
    (description "Github like contributions calendar on terminal.")
    (license license:expat)))

;;; mtproxy-git — Proxy server for Telegram messaging app
(define-public mtproxy-git
  (package
    (name "mtproxy-git")
    (version "47.dc0c7f3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/TelegramMessenger/MTProxy/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TelegramMessenger/MTProxy")
    (synopsis "proxy server for Telegram messaging app")
    (description "Proxy server for Telegram messaging app.")
    (license (list license:gpl2+ license:lgpl2.1+))))

;;; vgrep — pager for grep, git-grep, ripgrep and similar, allows for op
(define-public vgrep
  (package
    (name "vgrep")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vrothberg/vgrep/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vrothberg/vgrep")
    (synopsis "pager for grep, git-grep, ripgrep and similar, allows for opening the indexed")
    (description "Pager for grep, git-grep, ripgrep and similar, allows for opening the indexed file locations in a user-specified editor.")
    (license license:gpl3+)))

;;; openni2 — Framework for sensor-based Natural Interaction
(define-public openni2
  (package
    (name "openni2")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/occipital/OpenNI2/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/openni2"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/occipital/OpenNI2/")
    (synopsis "framework for sensor-based Natural Interaction")
    (description "Framework for sensor-based Natural Interaction.")
    (license license:asl2.0)))

;;; rakarrack-docs — Versatile guitar multi-effects processor (documentation)
(define-public rakarrack-docs
  (package
    (name "rakarrack-docs")
    (version "0.6.2+r194+ga620840")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://downloads.sourceforge.net/rakarrack-docs/rakarrack-docs-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/rakarrack-docs"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rakarrack.sourceforge.net")
    (synopsis "versatile guitar multi-effects processor (documentation)")
    (description "Versatile guitar multi-effects processor (documentation).")
    (license license:gpl2)))

;;; landdown-git — Simple shell script sandbox (development version)
(define-public landdown-git
  (package
    (name "landdown-git")
    (version "r27.g9161be8")
    (source
     (origin
       (method url-fetch)
       (uri "https://git.sr.ht/~marcc/landdown")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~marcc/landdown")
    (synopsis "simple shell script sandbox (development version)")
    (description "Simple shell script sandbox (development version).")
    (license license:eupl1.2)))

;;; energyplus — A building energy simulation engine to model energy and wate
(define-public energyplus
  (package
    (name "energyplus")
    (version "9.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://apps1.eere.energy.gov/buildings/energyplus/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/energyplus"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://apps1.eere.energy.gov/buildings/energyplus/")
    (synopsis "a building energy simulation engine to model energy and water use in building")
    (description "A building energy simulation engine to model energy and water use in buildings.")
    (license license:gpl3+)))

;;; hypr-git — Hypr is a Linux tiling window manager for Xorg. It's written
(define-public hypr-git
  (package
    (name "hypr-git")
    (version "0.0.r328.fac4928")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vaxerski/Hypr/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vaxerski/Hypr")
    (synopsis "hypr is a Linux tiling window manager for Xorg. It's written in XCB with mode")
    (description "Hypr is a Linux tiling window manager for Xorg. It's written in XCB with modern C++ and aims to provide easily readable .")
    (license license:bsd-3)))

;;; palemoon-gtk3-bin — Open source web browser based on Firefox focusing on efficie
(define-public palemoon-gtk3-bin
  (package
    (name "palemoon-gtk3-bin")
    (version "33.9.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://linux.palemoon.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/palemoon-gtk3-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://linux.palemoon.org/")
    (synopsis "open source web browser based on Firefox focusing on efficiency")
    (description "Open source web browser based on Firefox focusing on efficiency.")
    (license (list license:gpl3+ license:lgpl3+ license:mpl2.0))))

;;; nanopond — A teeny tiny artificial life virtual machine
(define-public nanopond
  (package
    (name "nanopond")
    (version "1.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://web.archive.org/web/20171017223720/http://adam.ierymenko.name:80/nanopond.shtml")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://web.archive.org/web/20171017223720/http://adam.ierymenko.name:80/nanopond.shtml")
    (synopsis "a teeny tiny artificial life virtual machine")
    (description "A teeny tiny artificial life virtual machine.")
    (license license:gpl3+)))

;;; xmr-stak-nvidia-git — Free Monero RandomX Miner and unified CryptoNight miner (CUD
(define-public xmr-stak-nvidia-git
  (package
    (name "xmr-stak-nvidia-git")
    (version "2.10.8.r0.g67cf951")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/fireice-uk/xmr-stak/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fireice-uk/xmr-stak")
    (synopsis "free Monero RandomX Miner and unified CryptoNight miner (CUDA)")
    (description "Free Monero RandomX Miner and unified CryptoNight miner (CUDA).")
    (license license:gpl3+)))

;;; veroroute — Qt based Veroboard/Perfboard/PCB layout and routing applicat
(define-public veroroute
  (package
    (name "veroroute")
    (version "2.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://downloads.sourceforge.net/veroroute/veroroute-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/veroroute")
    (synopsis "qt based Veroboard/Perfboard/PCB layout and routing application")
    (description "Qt based Veroboard/Perfboard/PCB layout and routing application.")
    (license license:gpl3+)))

;;; aqemu-git — QEMU GUI written in Qt (Qt5 rewrite)
(define-public aqemu-git
  (package
    (name "aqemu-git")
    (version "v0.9.2.r101.g34ca8ce")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tobimensch/aqemu/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tobimensch/aqemu")
    (synopsis "qEMU GUI written in Qt (Qt5 rewrite)")
    (description "QEMU GUI written in Qt (Qt5 rewrite).")
    (license license:gpl2+)))

;;; d2vwitch-git — Cross-platform D2V creator. (GIT version)
(define-public d2vwitch-git
  (package
    (name "d2vwitch-git")
    (version "5.5.gf002376")
    (source
     (origin
       (method url-fetch)
       (uri "http://forum.doom9.org/showthread.php?t=173090")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://forum.doom9.org/showthread.php?t=173090")
    (synopsis "cross-platform D2V creator. (GIT version)")
    (description "Cross-platform D2V creator. (GIT version).")
    (license (list license:isc license:lgpl2.1+))))

;;; farragone — Batch file renamer for programmers
(define-public farragone
  (package
    (name "farragone")
    (version "0.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "http://ikn.org.uk/app/farragone")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://ikn.org.uk/app/farragone")
    (synopsis "batch file renamer for programmers")
    (description "Batch file renamer for programmers.")
    (license license:gpl3+)))

;;; light-locker-git — A simple session locker
(define-public light-locker-git
  (package
    (name "light-locker-git")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/the-cavalry/light-locker/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/the-cavalry/light-locker")
    (synopsis "a simple session locker")
    (description "A simple session locker.")
    (license license:gpl2+)))

;;; moksha-module-engage-git — Moksha engage module built from git sources
(define-public moksha-module-engage-git
  (package
    (name "moksha-module-engage-git")
    (version "ece5d09")
    (source
     (origin
       (method url-fetch)
       (uri "http://mokshadesktop.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://mokshadesktop.org")
    (synopsis "moksha engage module built from git sources")
    (description "Moksha engage module built from git sources.")
    (license license:bsd-3)))

;;; php56-imagick — PHP extension for IMagick
(define-public php56-imagick
  (package
    (name "php56-imagick")
    (version "3.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://pecl.php.net/package/imagick")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://pecl.php.net/package/imagick")
    (synopsis "pHP extension for IMagick")
    (description "PHP extension for IMagick.")
    (license #f)))

;;; rsiedit-bin — C# GUI application for manipulation of RSI files used in SS1
(define-public rsiedit-bin
  (package
    (name "rsiedit-bin")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/space-wizards/RSIEdit/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/rsiedit-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/space-wizards/RSIEdit")
    (synopsis "c# GUI application for manipulation of RSI files used in SS14")
    (description "C# GUI application for manipulation of RSI files used in SS14.")
    (license license:expat)))

;;; openage — A free (as in freedom) clone of the Age of Empires II engine
(define-public openage
  (package
    (name "openage")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://openage.sft.mx/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openage.sft.mx/")
    (synopsis "a free (as in freedom) clone of the Age of Empires II engine")
    (description "A free (as in freedom) clone of the Age of Empires II engine.")
    (license license:gpl3+)))

;;; arm-linux-gnueabi-binutils — A set of programs to assemble and manipulate binary and obje
(define-public arm-linux-gnueabi-binutils
  (package
    (name "arm-linux-gnueabi-binutils")
    (version "2.46.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.gnu.org/software/binutils/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gnu.org/software/binutils/")
    (synopsis "a set of programs to assemble and manipulate binary and object files for the ")
    (description "A set of programs to assemble and manipulate binary and object files for the ARM GNU EABI little-endian target.")
    (license license:gpl3+)))

;;; espeakup-git — Allows the Speakup screen review system to use the espeak-ng
(define-public espeakup-git
  (package
    (name "espeakup-git")
    (version "0.90.r5.ge858481")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/linux-speakup/espeakup/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linux-speakup/espeakup")
    (synopsis "allows the Speakup screen review system to use the espeak-ng synthesizer (dev")
    (description "Allows the Speakup screen review system to use the espeak-ng synthesizer (development version).")
    (license license:gpl3+)))

;;; realcugan-ncnn-vulkan-git — ncnn implementation of Real-CUGAN converter. Runs fast on In
(define-public realcugan-ncnn-vulkan-git
  (package
    (name "realcugan-ncnn-vulkan-git")
    (version "20220318.r0.gf1271a2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nihui/realcugan-ncnn-vulkan/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nihui/realcugan-ncnn-vulkan")
    (synopsis "ncnn implementation of Real-CUGAN converter. Runs fast on Intel / AMD / Nvidi")
    (description "Ncnn implementation of Real-CUGAN converter. Runs fast on Intel / AMD / Nvidia / Apple-Silicon with Vulkan API.")
    (license license:expat)))

;;; mpack — Utilities for encoding and decoding binaries files in MIME f
(define-public mpack
  (package
    (name "mpack")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "http://ftp.andrew.cmu.edu/pub/mpack/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/mpack"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://ftp.andrew.cmu.edu/pub/mpack/")
    (synopsis "utilities for encoding and decoding binaries files in MIME format mail messag")
    (description "Utilities for encoding and decoding binaries files in MIME format mail messages.")
    (license license:gpl3+)))

;;; bambootracker-git — YM2608 (OPNA) music tracker
(define-public bambootracker-git
  (package
    (name "bambootracker-git")
    (version "0.4.5.r85.g4af2db7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/rerrahkr/BambooTracker/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rerrahkr/BambooTracker")
    (synopsis "yM2608 (OPNA) music tracker")
    (description "YM2608 (OPNA) music tracker.")
    (license license:gpl2+)))

;;; glportal — OpenGL puzzle game inspired by Portal
(define-public glportal
  (package
    (name "glportal")
    (version "0.0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://glportal.de/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://glportal.de/")
    (synopsis "openGL puzzle game inspired by Portal")
    (description "OpenGL puzzle game inspired by Portal.")
    (license #f)))

;;; magnetico-bin — Autonomous (self-hosted) BitTorrent DHT search engine suite.
(define-public magnetico-bin
  (package
    (name "magnetico-bin")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/boramalper/magnetico/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/magnetico-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/boramalper/magnetico")
    (synopsis "autonomous (self-hosted) BitTorrent DHT search engine suite")
    (description "Autonomous (self-hosted) BitTorrent DHT search engine suite.")
    (license license:agpl3+)))

;;; minecraft-c — Minecraft Classic 0.0.30a reimplemented in C.
(define-public minecraft-c
  (package
    (name "minecraft-c")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/johnpayne-dev/MinecraftC/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/johnpayne-dev/MinecraftC")
    (synopsis "minecraft Classic 0.0.30a reimplemented in C")
    (description "Minecraft Classic 0.0.30a reimplemented in C.")
    (license license:expat)))

;;; mshr — Mesh generation component of FEniCS (stable).
(define-public mshr
  (package
    (name "mshr")
    (version "2019.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://bitbucket.org/fenics-project/mshr/get/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bitbucket.org/fenics-project/mshr")
    (synopsis "mesh generation component of FEniCS (stable)")
    (description "Mesh generation component of FEniCS (stable).")
    (license license:gpl3+)))

;;; ocarina — A simple GTK+ and GStreamer based music player.
(define-public ocarina
  (package
    (name "ocarina")
    (version "6.5.10")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.nowheycreamery.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nowheycreamery.com/")
    (synopsis "a simple GTK+ and GStreamer based music player")
    (description "A simple GTK+ and GStreamer based music player.")
    (license license:gpl2+)))

;;; otf-gandhifamily — Gandhi Sans and Serif font family by Cristóbal Henestrosa an
(define-public otf-gandhifamily
  (package
    (name "otf-gandhifamily")
    (version "1.001")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.tipografiagandhi.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/otf-gandhifamily"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.tipografiagandhi.com/")
    (synopsis "gandhi Sans and Serif font family by Cristóbal Henestrosa and Raúl Plancarte ")
    (description "Gandhi Sans and Serif font family by Cristóbal Henestrosa and Raúl Plancarte for Librería Gandhi (OpenType).")
    (license #f)))

;;; play-emu-git — Play! is an experimental Playstation 2 emulator
(define-public play-emu-git
  (package
    (name "play-emu-git")
    (version "0.69.r21.g0c426757c")
    (source
     (origin
       (method url-fetch)
       (uri "https://purei.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://purei.org/")
    (synopsis "play! is an experimental Playstation 2 emulator")
    (description "Play! is an experimental Playstation 2 emulator.")
    (license license:expat)))

;;; prelockd — Lock executables, shared libraries in memory to improve resp
(define-public prelockd
  (package
    (name "prelockd")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hakavlad/prelockd/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hakavlad/prelockd")
    (synopsis "lock executables, shared libraries in memory to improve responsiveness")
    (description "Lock executables, shared libraries in memory to improve responsiveness.")
    (license license:expat)))

;;; python-inotifyrecursive — Simple recursive inotify watches for Python
(define-public python-inotifyrecursive
  (package
    (name "python-inotifyrecursive")
    (version "0.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/letorbi/inotifyrecursive/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/letorbi/inotifyrecursive")
    (synopsis "simple recursive inotify watches for Python")
    (description "Simple recursive inotify watches for Python.")
    (license license:lgpl3)))

;;; uenv — Useful scripts, systemd timer/service units and their config
(define-public uenv
  (package
    (name "uenv")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://sleepmap.de/software/uenv")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/uenv"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sleepmap.de/software/uenv")
    (synopsis "useful scripts, systemd timer/service units and their configuration")
    (description "Useful scripts, systemd timer/service units and their configuration.")
    (license license:gpl3+)))

;;; vim-sxhkdrc-git — Vim syntax for sxhkd's configuration files
(define-public vim-sxhkdrc-git
  (package
    (name "vim-sxhkdrc-git")
    (version "20150405")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/baskerville/vim-sxhkdrc/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/vim-sxhkdrc-git"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/baskerville/vim-sxhkdrc")
    (synopsis "vim syntax for sxhkd's configuration files")
    (description "Vim syntax for sxhkd's configuration files.")
    (license #f)))

;;; otf-libre-caslon — A free Caslon font designed by Pablo Impallari
(define-public otf-libre-caslon
  (package
    (name "otf-libre-caslon")
    (version "1.002")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.impallari.com/librecaslon")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/otf-libre-caslon"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.impallari.com/librecaslon")
    (synopsis "a free Caslon font designed by Pablo Impallari")
    (description "A free Caslon font designed by Pablo Impallari.")
    (license #f)))

;;; ts-bugreport — Bug reporter for the* apps
(define-public ts-bugreport
  (package
    (name "ts-bugreport")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vicr123/ts-polkitagent/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vicr123/ts-polkitagent")
    (synopsis "bug reporter for the* apps")
    (description "Bug reporter for the* apps.")
    (license license:gpl3+)))

;;; vim-dart-plugin-git — Syntax highlighting for Dart in Vim
(define-public vim-dart-plugin-git
  (package
    (name "vim-dart-plugin-git")
    (version "0.1.0.r42.g940adde")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/dart-lang/dart-vim-plugin/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/vim-dart-plugin-git"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dart-lang/dart-vim-plugin")
    (synopsis "syntax highlighting for Dart in Vim")
    (description "Syntax highlighting for Dart in Vim.")
    (license license:bsd-3)))

;;; w3perl — W3Perl is a free and comprehensive logfile analyzer for Web 
(define-public w3perl
  (package
    (name "w3perl")
    (version "3.20")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.w3perl.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.w3perl.com")
    (synopsis "w3Perl is a free and comprehensive logfile analyzer for Web / FTP / Squid and")
    (description "W3Perl is a free and comprehensive logfile analyzer for Web / FTP / Squid and Mail servers.")
    (license license:gpl3+)))

;;; zentile — On-demand tiling for Openbox, Xfce and other EWMH Complaint 
(define-public zentile
  (package
    (name "zentile")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/blrsn/zentile/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/blrsn/zentile")
    (synopsis "on-demand tiling for Openbox, Xfce and other EWMH Complaint Window Managers")
    (description "On-demand tiling for Openbox, Xfce and other EWMH Complaint Window Managers.")
    (license license:expat)))

;;; lossless-adapter-manager — Management application for the Input Integrety Lossless Adap
(define-public lossless-adapter-manager
  (package
    (name "lossless-adapter-manager")
    (version "2.53")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.input-integrity.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/lossless-adapter-manager"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.input-integrity.com/")
    (synopsis "management application for the Input Integrety Lossless Adapter Gamecube adap")
    (description "Management application for the Input Integrety Lossless Adapter Gamecube adapter.")
    (license #f)))

;;; jdk21-openj9-bin — IBM Semeru OpenJ9 with openjdk21
(define-public jdk21-openj9-bin
  (package
    (name "jdk21-openj9-bin")
    (version "21.0.10.1b7.1_openj9_0.57.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.ibm.com/languages/java/semeru-runtimes/downloads")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/jdk21-openj9-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.ibm.com/languages/java/semeru-runtimes/downloads")
    (synopsis "iBM Semeru OpenJ9 with openjdk21")
    (description "IBM Semeru OpenJ9 with openjdk21.")
    (license #f)))

;;; git-tools-git — Assorted git tools, including git-restore-mtime
(define-public git-tools-git
  (package
    (name "git-tools-git")
    (version "2022.12.r6.gfaba1cd")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/MestreLion/git-tools/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MestreLion/git-tools")
    (synopsis "assorted git tools, including git-restore-mtime")
    (description "Assorted git tools, including git-restore-mtime.")
    (license license:gpl3+)))

;;; mshv — Amateur radio software by LZ2HV for digital modes MSK, JTMS,
(define-public mshv
  (package
    (name "mshv")
    (version "270")
    (source
     (origin
       (method url-fetch)
       (uri "http://lz2hv.org/mshv")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://lz2hv.org/mshv")
    (synopsis "amateur radio software by LZ2HV for digital modes MSK, JTMS, FSK, ISCAT, JT6M")
    (description "Amateur radio software by LZ2HV for digital modes MSK, JTMS, FSK, ISCAT, JT6M, FT8/4, JT65, PI4, Q65.")
    (license license:gpl3+)))

;;; bertini-parallel — Homotopy continuation solver for systems of polynomial equat
(define-public bertini-parallel
  (package
    (name "bertini-parallel")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://bertini.nd.edu")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bertini.nd.edu")
    (synopsis "homotopy continuation solver for systems of polynomial equations (parallel ve")
    (description "Homotopy continuation solver for systems of polynomial equations (parallel version with OpenMPI).")
    (license #f)))

;;; birtty — Try not to crash that bird
(define-public birtty
  (package
    (name "birtty")
    (version "18.06")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.uninformativ.de/git/birtty/file/README.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/birtty"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.uninformativ.de/git/birtty/file/README.html")
    (synopsis "try not to crash that bird")
    (description "Try not to crash that bird.")
    (license license:expat)))

;;; perl-webservice-musicbrainz — Web service API to MusicBrainz database
(define-public perl-webservice-musicbrainz
  (package
    (name "perl-webservice-musicbrainz")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cpan.metacpan.org/authors/id/.../webservice-musicbrainz-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://metacpan.org/release/WebService-MusicBrainz")
    (synopsis "web service API to MusicBrainz database")
    (description "Web service API to MusicBrainz database.")
    (license license:artistic2.0)))

;;; perl-http-request-ascgi — Set up a CGI environment from an HTTP::Request
(define-public perl-http-request-ascgi
  (package
    (name "perl-http-request-ascgi")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cpan.metacpan.org/authors/id/.../http-request-ascgi-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://search.cpan.org/dist/HTTP-Request-AsCGI")
    (synopsis "set up a CGI environment from an HTTP::Request")
    (description "Set up a CGI environment from an HTTP::Request.")
    (license (list license:gpl3+ license:artistic2.0))))

;;; kxstitch — The program that lets you create cross stitch patterns and c
(define-public kxstitch
  (package
    (name "kxstitch")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://userbase.kde.org/KXStitch")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://userbase.kde.org/KXStitch")
    (synopsis "the program that lets you create cross stitch patterns and charts")
    (description "The program that lets you create cross stitch patterns and charts.")
    (license license:gpl3+)))

;;; guile-sqlite3 — Guile bindings for the SQLite3 database engine
(define-public guile-sqlite3
  (package
    (name "guile-sqlite3")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://notabug.org/guile-sqlite3/guile-sqlite3")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://notabug.org/guile-sqlite3/guile-sqlite3")
    (synopsis "guile bindings for the SQLite3 database engine")
    (description "Guile bindings for the SQLite3 database engine.")
    (license license:lgpl3+)))

;;; python-louvain — Louvain algorithm for community detection
(define-public python-louvain
  (package
    (name "python-louvain")
    (version "0.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/taynaud/python-louvain/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/taynaud/python-louvain")
    (synopsis "louvain algorithm for community detection")
    (description "Louvain algorithm for community detection.")
    (license license:bsd-3)))

;;; guile-dbd-postgresql — guile-dbi database driver postgresql
(define-public guile-dbd-postgresql
  (package
    (name "guile-dbd-postgresql")
    (version "2.1.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eestrada/guile-dbi/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eestrada/guile-dbi/tree/master/guile-dbd-postgresql")
    (synopsis "guile-dbi database driver postgresql")
    (description "Guile-dbi database driver postgresql.")
    (license license:gpl2+)))

;;; perl-catalyst-component-instancepercontext — Moose role to create only one instance of component per cont
(define-public perl-catalyst-component-instancepercontext
  (package
    (name "perl-catalyst-component-instancepercontext")
    (version "0.001001")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cpan.metacpan.org/authors/id/.../catalyst-component-instancepercontext-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://search.cpan.org/dist/Catalyst-Component-InstancePerContext")
    (synopsis "moose role to create only one instance of component per context")
    (description "Moose role to create only one instance of component per context.")
    (license (list license:gpl3+ license:artistic2.0))))

;;; r-munsell — Utilities for Using Munsell Colours
(define-public r-munsell
  (package
    (name "r-munsell")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cran.r-project.org/src/contrib/munsell_" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cran.r-project.org/package=munsell")
    (synopsis "utilities for Using Munsell Colours")
    (description "Utilities for Using Munsell Colours.")
    (license license:expat)))

;;; r-quantreg — Quantile Regression
(define-public r-quantreg
  (package
    (name "r-quantreg")
    (version "6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://cran.r-project.org/src/contrib/quantreg_" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cran.r-project.org/package=quantreg")
    (synopsis "quantile Regression")
    (description "Quantile Regression.")
    (license license:gpl2+)))

;;; cavecube-bin — An in-development Minecraft/Infiniminer clone
(define-public cavecube-bin
  (package
    (name "cavecube-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/PQCraft/CaveCube/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/cavecube-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/PQCraft/CaveCube")
    (synopsis "an in-development Minecraft/Infiniminer clone")
    (description "An in-development Minecraft/Infiniminer clone.")
    (license license:boost1.0)))

;;; eternallands — A free 3D MMORPG game with thousands of on-line players
(define-public eternallands
  (package
    (name "eternallands")
    (version "1.9.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.eternal-lands.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.eternal-lands.com/")
    (synopsis "a free 3D MMORPG game with thousands of on-line players")
    (description "A free 3D MMORPG game with thousands of on-line players.")
    (license #f)))

;;; fbc-git — FreeBASIC Compiler (Development version)
(define-public fbc-git
  (package
    (name "fbc-git")
    (version "1.09.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.freebasic.net")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.freebasic.net")
    (synopsis "freeBASIC Compiler (Development version)")
    (description "FreeBASIC Compiler (Development version).")
    (license (list license:gpl2+ license:lgpl3+))))

;;; frece-git — Frecency sorted database
(define-public frece-git
  (package
    (name "frece-git")
    (version "1.0.6.r0.g41d11ec")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/YodaEmbedding/frece/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YodaEmbedding/frece")
    (synopsis "frecency sorted database")
    (description "Frecency sorted database.")
    (license license:expat)))

;;; houserat — Notifies when known devices connect to the network
(define-public houserat
  (package
    (name "houserat")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/drrlvn/houserat/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/drrlvn/houserat")
    (synopsis "notifies when known devices connect to the network")
    (description "Notifies when known devices connect to the network.")
    (license license:gpl3+)))

;;; ipe-tools-git — Tools for Ipe: pdftoipe, figtoipe, ipe5toxml, svgtoipe
(define-public ipe-tools-git
  (package
    (name "ipe-tools-git")
    (version "git")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/otfried/ipe-tools/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/otfried/ipe-tools")
    (synopsis "tools for Ipe: pdftoipe, figtoipe, ipe5toxml, svgtoipe")
    (description "Tools for Ipe: pdftoipe, figtoipe, ipe5toxml, svgtoipe.")
    (license #f)))

;;; kibot — KiCad automation utility
(define-public kibot
  (package
    (name "kibot")
    (version "1.8.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://files.pythonhosted.org/packages/source/k/kibo/kibo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pypi.org/project/kibot")
    (synopsis "kiCad automation utility")
    (description "KiCad automation utility.")
    (license license:agpl3+)))

;;; kwin6-effects-burn-my-windows — Disintegrate your windows with style.
(define-public kwin6-effects-burn-my-windows
  (package
    (name "kwin6-effects-burn-my-windows")
    (version "47")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Schneegans/Burn-My-Windows/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/kwin6-effects-burn-my-windows"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Schneegans/Burn-My-Windows")
    (synopsis "disintegrate your windows with style")
    (description "Disintegrate your windows with style.")
    (license license:gpl3+)))

;;; linux-test-project — Collection of tools for testing the Linux kernel and related
(define-public linux-test-project
  (package
    (name "linux-test-project")
    (version "20230929")
    (source
     (origin
       (method url-fetch)
       (uri "https://linux-test-project.github.io/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://linux-test-project.github.io/")
    (synopsis "collection of tools for testing the Linux kernel and related features")
    (description "Collection of tools for testing the Linux kernel and related features.")
    (license license:gpl2+)))

;;; konversation-theme-matchama — Matcha theme for Konversation
(define-public konversation-theme-matchama
  (package
    (name "konversation-theme-matchama")
    (version "r265.8525e05")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/cscs/matchama-kde/-/archive/v" version "/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/konversation-theme-matchama"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/cscs/matchama-kde")
    (synopsis "matcha theme for Konversation")
    (description "Matcha theme for Konversation.")
    (license license:gpl3+)))

;;; mbtserver — Memory-based tagger-generator and tagger server.
(define-public mbtserver
  (package
    (name "mbtserver")
    (version "0.17")
    (source
     (origin
       (method url-fetch)
       (uri "https://languagemachines.github.io/mbt")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://languagemachines.github.io/mbt")
    (synopsis "memory-based tagger-generator and tagger server")
    (description "Memory-based tagger-generator and tagger server.")
    (license license:gpl3+)))

;;; mkpwd — Command line password generator
(define-public mkpwd
  (package
    (name "mkpwd")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.o-schroeder.de/projects/mkpwd")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/mkpwd"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.o-schroeder.de/projects/mkpwd")
    (synopsis "command line password generator")
    (description "Command line password generator.")
    (license license:gpl3+)))
