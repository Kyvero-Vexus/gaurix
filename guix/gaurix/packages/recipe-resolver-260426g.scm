;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260426g: 100 packages attempted (100 recipes, 0 blocked)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260426g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   element-desktop-blur-me-not
   munt-qt
   qtvkbd
   comlink
   vundle-git
   eclipse-texlipse
   caja-dropbox
   bittriprunner-hib
   brother-hll2350dw
   coolreader3-git
   zork3
   fortune-mod-it
   discwrapper
   sonar-scanner
   ftl-sdk
   xininfo-git
   scale2x
   latex-enumitem
   stanc
   otf-manjari
   blheli-configurator-bin
   openrazer-meta-git
   perl-filehandle-unget
   kodi-addon-stream
   tass64
   blockmap-git
   lemonbar-clicks-git
   quake3-defrag-maps
   torch7-cutorch-git
   multiwinia
   mapcrafter-git
   ueyed
   rhythmbox-tray-icon-git
   console-tdm-git
   hideit-sh-git
   myget
   qytdl
   vim-tabular-git
   pict-rs
   antimicrox-git
   devrantron
   elm-format-0-17-bin
   inkscape-generate-palette
   mbrola-voices-it2
   passed-git
   qscrabble3d
   thinkpad-p14s
   wwwoffle-svn
   jriver-media-center24
   tesseract-data-bos-git
   fireurl
   totp
   sentrum-bin
   avirusnamedtom-hib
   xoscope
   dbacl
   trackballs
   yadifa
   cinnamon-doc
   digital-assets
   fityk-git
   gtkmagnetic
   kim-api
   lua51-unix
   nemo-qml-plugin-dbus
   pass-sshaskpass-git
   pyromaths
   reg
   sunvox-1-x
   vscode-codicons-git
   vacuum-im
   python-distribution
   litra-autotoggle
   git-treeflow-bin
   arkenfox-hook-git
   prowlarr-develop
   world-of-goo-2
   ontake-himitsu-git
   vim-everforest-git
   aria2-config-script
   liri-text-git
   compiler-rt19
   ansible-docs-git
   boardmix-uos
   cchat-gtk-git
   conmon-git
   deepin-wine-cntv-cbox
   sync-worktrees
   drumrox
   excite-cli
   foobar2000-component-uie-typefind-bin
   git-now-git
   gpufetch-git
   homed-automation
   r-fpc
   r-scatterplot3d
   intercal
   keyplusd-git
   libewf-git
   lout-dejavu-git
   ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; element-desktop-blur-me-not — Auto-enable Wayland (ozone) for element-desktop
(define-public element-desktop-blur-me-not
  (package
    (name "element-desktop-blur-me-not")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/element-desktop-blur-me-not.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/pkgbase/electron-blur-me-not")
    (synopsis "auto-enable Wayland (ozone) for element-desktop")
    (description "Auto-enable Wayland (ozone) for element-desktop.")
    (license license:asl2.0)))

;;; munt-qt — Software synthesizer emulating pre-GM MIDI devices such as the Roland 
(define-public munt-qt
  (package
    (name "munt-qt")
    (version "2.7.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/munt-qt.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://munt.sourceforge.net")
    (synopsis "software synthesizer emulating pre-GM MIDI devices such as the Roland...")
    (description "Software synthesizer emulating pre-GM MIDI devices such as the Roland MT-32, CM-32L, CM-64 and LAPC-I (Qt GUI application).")
    (license license:gpl2+)))

;;; qtvkbd — A virtual keyboard
(define-public qtvkbd
  (package
    (name "qtvkbd")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtvkbd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Alexander-r/qtvkbd")
    (synopsis "a virtual keyboard")
    (description "A virtual keyboard.")
    (license license:gpl3)))

;;; comlink — An experimental IRC client
(define-public comlink
  (package
    (name "comlink")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/comlink.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rockorager/comlink")
    (synopsis "an experimental IRC client")
    (description "An experimental IRC client.")
    (license license:expat)))

;;; vundle-git — Plug-in manager for Vim
(define-public vundle-git
  (package
    (name "vundle-git")
    (version "0.10.2.605.fef1c2f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vundle-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VundleVim/Vundle.vim")
    (synopsis "plug-in manager for Vim")
    (description "Plug-in manager for Vim.")
    (license license:expat)))

;;; eclipse-texlipse — LaTeX support plugin for Eclipse IDE
(define-public eclipse-texlipse
  (package
    (name "eclipse-texlipse")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-texlipse.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://projects.eclipse.org/projects/science.texlipse")
    (synopsis "laTeX support plugin for Eclipse IDE")
    (description "LaTeX support plugin for Eclipse IDE.")
    (license license:nonfree)))

;;; caja-dropbox — Dropbox extension for Caja file manager
(define-public caja-dropbox
  (package
    (name "caja-dropbox")
    (version "1.28.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/caja-dropbox.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mate-desktop/caja-dropbox")
    (synopsis "dropbox extension for Caja file manager")
    (description "Dropbox extension for Caja file manager.")
    (license license:nonfree)))

;;; bittriprunner-hib — BIT.TRIP RUNNER, a music/rhythm-based action platformer (Humble Bundle
(define-public bittriprunner-hib
  (package
    (name "bittriprunner-hib")
    (version "1.0.4+h20120927")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bittriprunner-hib.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://bittripgame.com/bittrip-runner.html")
    (synopsis "bIT.TRIP RUNNER, a music/rhythm-based action platformer (Humble Bundl...")
    (description "BIT.TRIP RUNNER, a music/rhythm-based action platformer (Humble Bundle/Store version).")
    (license license:nonfree)))

;;; brother-hll2350dw — Brother HL-L2350DW CUPS driver
(define-public brother-hll2350dw
  (package
    (name "brother-hll2350dw")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-hll2350dw.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.brother.com")
    (synopsis "brother HL-L2350DW CUPS driver")
    (description "Brother HL-L2350DW CUPS driver.")
    (license license:nonfree)))

;;; coolreader3-git — E-book reader for Linux
(define-public coolreader3-git
  (package
    (name "coolreader3-git")
    (version "r4097.1e07d15")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/coolreader3-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://sourceforge.net/projects/crengine/")
    (synopsis "e-book reader for Linux")
    (description "E-book reader for Linux.")
    (license license:gpl2)))

;;; zork3 — Zork III adventure game (for Infocom's z-code interpreter)
(define-public zork3
  (package
    (name "zork3")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zork3.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://infocom.elsewhere.org/scheyen/")
    (synopsis "zork III adventure game (for Infocom's z-code interpreter)")
    (description "Zork III adventure game (for Infocom's z-code interpreter).")
    (license license:nonfree)))

;;; fortune-mod-it — Collection of Italian fortune cookie files
(define-public fortune-mod-it
  (package
    (name "fortune-mod-it")
    (version "1.99")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fortune-mod-it.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.fortune-it.net/")
    (synopsis "collection of Italian fortune cookie files")
    (description "Collection of Italian fortune cookie files.")
    (license license:nonfree)))

;;; discwrapper — a cover designer for home-made discs
(define-public discwrapper
  (package
    (name "discwrapper")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/discwrapper.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://sourceforge.net/projects/discwrapper")
    (synopsis "a cover designer for home-made discs")
    (description "A cover designer for home-made discs.")
    (license license:gpl3+)))

;;; sonar-scanner — Generic CLI tool to launch project analysis on SonarQube servers
(define-public sonar-scanner
  (package
    (name "sonar-scanner")
    (version "8.0.1.6346")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sonar-scanner.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/")
    (synopsis "generic CLI tool to launch project analysis on SonarQube servers")
    (description "Generic CLI tool to launch project analysis on SonarQube servers.")
    (license license:gpl3+)))

;;; ftl-sdk — Software Development Kit for Mixer's FTL Protocol
(define-public ftl-sdk
  (package
    (name "ftl-sdk")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ftl-sdk.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Scrumplex/ftl-sdk")
    (synopsis "software Development Kit for Mixer's FTL Protocol")
    (description "Software Development Kit for Mixer's FTL Protocol.")
    (license license:expat)))

;;; xininfo-git — Small helper program for monitor layouts.
(define-public xininfo-git
  (package
    (name "xininfo-git")
    (version "42.0bd94ad")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xininfo-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DaveDavenport/xininfo")
    (synopsis "small helper program for monitor layouts")
    (description "Small helper program for monitor layouts.")
    (license license:gpl3+)))

;;; scale2x — Bitmap scaling algorithm that improves the resolution of a PNG
(define-public scale2x
  (package
    (name "scale2x")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/scale2x.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://scale2x.sourceforge.net/")
    (synopsis "bitmap scaling algorithm that improves the resolution of a PNG")
    (description "Bitmap scaling algorithm that improves the resolution of a PNG.")
    (license license:gpl3+)))

;;; latex-enumitem — Customize the three basic lists (enumerate, itemize and description)
(define-public latex-enumitem
  (package
    (name "latex-enumitem")
    (version "3.11")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/latex-enumitem.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.ctan.org/tex-archive/macros/latex/contrib/enumitem")
    (synopsis "customize the three basic lists (enumerate, itemize and description)")
    (description "Customize the three basic lists (enumerate, itemize and description).")
    (license license:nonfree)))

;;; stanc — A package for obtaining Bayesian inference using the No-U-Turn sampler
(define-public stanc
  (package
    (name "stanc")
    (version "2.38.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stanc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mc-stan.org/")
    (synopsis "a package for obtaining Bayesian inference using the No-U-Turn sample...")
    (description "A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo.")
    (license license:bsd-3)))

;;; otf-manjari — Malayalam unicode font with rounded terminals suitable for body text.
(define-public otf-manjari
  (package
    (name "otf-manjari")
    (version "2.200")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/otf-manjari.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://smc.org.in/fonts")
    (synopsis "malayalam unicode font with rounded terminals suitable for body text")
    (description "Malayalam unicode font with rounded terminals suitable for body text.")
    (license license:nonfree)))

;;; blheli-configurator-bin — Crossplatform configuration tool for BLHeli based ESCs
(define-public blheli-configurator-bin
  (package
    (name "blheli-configurator-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blheli-configurator-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/blheli-configurator/blheli-configurator")
    (synopsis "crossplatform configuration tool for BLHeli based ESCs")
    (description "Crossplatform configuration tool for BLHeli based ESCs.")
    (license license:gpl3)))

;;; openrazer-meta-git — Meta package for installing all required openrazer packages.
(define-public openrazer-meta-git
  (package
    (name "openrazer-meta-git")
    (version "3.8.0.r34.gd52042ab")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openrazer-meta-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openrazer.github.io")
    (synopsis "meta package for installing all required openrazer packages")
    (description "Meta package for installing all required openrazer packages.")
    (license license:gpl2+)))

;;; perl-filehandle-unget — FileHandle which supports multi-byte unget
(define-public perl-filehandle-unget
  (package
    (name "perl-filehandle-unget")
    (version "0.1634")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-filehandle-unget.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://search.cpan.org/dist/FileHandle-Unget")
    (synopsis "fileHandle which supports multi-byte unget")
    (description "FileHandle which supports multi-byte unget.")
    (license license:gpl2)))

;;; kodi-addon-stream — A cross-platform XBMC addon designed with the goal of delivering HD co
(define-public kodi-addon-stream
  (package
    (name "kodi-addon-stream")
    (version "1.4.6RC3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kodi-addon-stream.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/brysonreece/Stream/")
    (synopsis "a cross-platform XBMC addon designed with the goal of delivering HD c...")
    (description "A cross-platform XBMC addon designed with the goal of delivering HD content from all across the web.")
    (license license:gpl3)))

;;; tass64 — Cross assembler (TASS/TASM) targeting the MOS 65xx series of micro pro
(define-public tass64
  (package
    (name "tass64")
    (version "1.60.3243")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tass64.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tass64.sourceforge.net/")
    (synopsis "cross assembler (TASS/TASM) targeting the MOS 65xx series of micro pr...")
    (description "Cross assembler (TASS/TASM) targeting the MOS 65xx series of micro processors (6502/6510/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02/4510).")
    (license license:gpl2+)))

;;; blockmap-git — Minecraft map viewer/renderer
(define-public blockmap-git
  (package
    (name "blockmap-git")
    (version "2.4.0.r0.d47e3d4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/blockmap-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Minecraft-Technik-Wiki/BlockMap")
    (synopsis "minecraft map viewer/renderer")
    (description "Minecraft map viewer/renderer.")
    (license license:expat)))

;;; lemonbar-clicks-git — A lightweight xcb based bar with ported xft support, support to specif
(define-public lemonbar-clicks-git
  (package
    (name "lemonbar-clicks-git")
    (version "1.3.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lemonbar-clicks-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ph111p/bar")
    (synopsis "a lightweight xcb based bar with ported xft support, support to speci...")
    (description "A lightweight xcb based bar with ported xft support, support to specify outputs, support for unlimited clickable areas and support for longer input.")
    (license license:expat)))

;;; quake3-defrag-maps — Map packs for the DeFRaG Quake3 modification.
(define-public quake3-defrag-maps
  (package
    (name "quake3-defrag-maps")
    (version "20091031")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quake3-defrag-maps.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://q3df.org/")
    (synopsis "map packs for the DeFRaG Quake3 modification")
    (description "Map packs for the DeFRaG Quake3 modification.")
    (license license:nonfree)))

;;; torch7-cutorch-git — A CUDA backend for Torch7
(define-public torch7-cutorch-git
  (package
    (name "torch7-cutorch-git")
    (version "r1026.5e9d86c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/torch7-cutorch-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/torch/cutorch")
    (synopsis "a CUDA backend for Torch7")
    (description "A CUDA backend for Torch7.")
    (license license:bsd-3)))

;;; multiwinia — Challenge your opponent to a game of stick-man slaughter (game sold se
(define-public multiwinia
  (package
    (name "multiwinia")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/multiwinia.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.introversion.co.uk/multiwinia/")
    (synopsis "challenge your opponent to a game of stick-man slaughter (game sold s...")
    (description "Challenge your opponent to a game of stick-man slaughter (game sold separately).")
    (license license:nonfree)))

;;; mapcrafter-git — A High Performance Minecraft Map Renderer
(define-public mapcrafter-git
  (package
    (name "mapcrafter-git")
    (version "v.2.3.1.r0.g68eb131")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mapcrafter-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://mapcrafter.org")
    (synopsis "a High Performance Minecraft Map Renderer")
    (description "A High Performance Minecraft Map Renderer.")
    (license license:gpl3+)))

;;; ueyed — IDS uEye camera daemon (USB and ethernet)
(define-public ueyed
  (package
    (name "ueyed")
    (version "4.96.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ueyed.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://en.ids-imaging.com")
    (synopsis "iDS uEye camera daemon (USB and ethernet)")
    (description "IDS uEye camera daemon (USB and ethernet).")
    (license license:nonfree)))

;;; rhythmbox-tray-icon-git — Restores the tray icon functionality from the 0.x series.
(define-public rhythmbox-tray-icon-git
  (package
    (name "rhythmbox-tray-icon-git")
    (version "3abf81c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rhythmbox-tray-icon-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://github.com/mendhak/rhythmbox-tray-icon")
    (synopsis "restores the tray icon functionality from the 0.x series")
    (description "Restores the tray icon functionality from the 0.x series.")
    (license license:gpl3)))

;;; console-tdm-git — Console display manager based on CDM
(define-public console-tdm-git
  (package
    (name "console-tdm-git")
    (version "1:r2.1a7788c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/console-tdm-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://github.com/dopsi/console-tdm")
    (synopsis "console display manager based on CDM")
    (description "Console display manager based on CDM.")
    (license license:gpl3+)))

;;; hideit-sh-git — Automagically hide/show a window
(define-public hideit-sh-git
  (package
    (name "hideit-sh-git")
    (version "r43.b99d6b4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hideit.sh-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tadly/hideIt.sh")
    (synopsis "automagically hide/show a window")
    (description "Automagically hide/show a window.")
    (license license:gpl3)))

;;; myget — Multi-thread downloader accelerator for GNU/Linux (fork)
(define-public myget
  (package
    (name "myget")
    (version "1.1.2.r13.g796185d")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/myget.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://myget.sourceforge.net")
    (synopsis "multi-thread downloader accelerator for GNU/Linux (fork)")
    (description "Multi-thread downloader accelerator for GNU/Linux (fork).")
    (license license:gpl2)))

;;; qytdl — Basic PyQt5 frontend to Youtube-DL
(define-public qytdl
  (package
    (name "qytdl")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qytdl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jahendrie/qytdl")
    (synopsis "basic PyQt5 frontend to Youtube-DL")
    (description "Basic PyQt5 frontend to Youtube-DL.")
    (license license:gpl3)))

;;; vim-tabular-git — Vim script for text filtering and alignment
(define-public vim-tabular-git
  (package
    (name "vim-tabular-git")
    (version "1.0.0.r1.g00e1e7f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-tabular-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/godlygeek/tabular")
    (synopsis "vim script for text filtering and alignment")
    (description "Vim script for text filtering and alignment.")
    (license license:bsd-3)))

;;; pict-rs — A simple image hosting service
(define-public pict-rs
  (package
    (name "pict-rs")
    (version "0.5.19")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pict-rs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.asonix.dog/asonix/pict-rs")
    (synopsis "a simple image hosting service")
    (description "A simple image hosting service.")
    (license license:agpl3)))

;;; antimicrox-git — Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad
(define-public antimicrox-git
  (package
    (name "antimicrox-git")
    (version "3.5.1.r10.g805a323c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/antimicrox-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AntiMicroX/antimicroX")
    (synopsis "map keyboard and mouse actions to gamepad buttons, inspired by qjoypa...")
    (description "Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad. Antimicro fork.")
    (license license:gpl3+)))

;;; devrantron — DevRant client written in ReactJS
(define-public devrantron
  (package
    (name "devrantron")
    (version "1.5.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devrantron.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tahnik/devrantron")
    (synopsis "devRant client written in ReactJS")
    (description "DevRant client written in ReactJS.")
    (license license:asl2.0)))

;;; elm-format-0-17-bin — Format Elm source code according to a standard set of rules based on t
(define-public elm-format-0-17-bin
  (package
    (name "elm-format-0-17-bin")
    (version "0.6.1_alpha")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/elm-format-0.17-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/avh4/elm-format")
    (synopsis "format Elm source code according to a standard set of rules based on ...")
    (description "Format Elm source code according to a standard set of rules based on the official Elm Style Guide.")
    (license license:nonfree)))

;;; inkscape-generate-palette — Inkscape extension to generate color palettes
(define-public inkscape-generate-palette
  (package
    (name "inkscape-generate-palette")
    (version "4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/inkscape-generate-palette.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/olibia/inkscape-generate-palette")
    (synopsis "inkscape extension to generate color palettes")
    (description "Inkscape extension to generate color palettes.")
    (license license:gpl3+)))

;;; mbrola-voices-it2 — An Italian female voice for the MBROLA synthesizer
(define-public mbrola-voices-it2
  (package
    (name "mbrola-voices-it2")
    (version "1:15.6fa9693")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mbrola-voices-it2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/numediart/MBROLA-voices/")
    (synopsis "an Italian female voice for the MBROLA synthesizer")
    (description "An Italian female voice for the MBROLA synthesizer.")
    (license license:nonfree)))

;;; passed-git — A simple script to modify password store entries with sed commands
(define-public passed-git
  (package
    (name "passed-git")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/passed-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jreinert/passed")
    (synopsis "a simple script to modify password store entries with sed commands")
    (description "A simple script to modify password store entries with sed commands.")
    (license license:nonfree)))

;;; qscrabble3d — Highly customizable Scrabble game (classic, SuperScrabble, 3D games) -
(define-public qscrabble3d
  (package
    (name "qscrabble3d")
    (version "3.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qscrabble3d.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/scrabble/")
    (synopsis "highly customizable Scrabble game (classic, SuperScrabble, 3D games) ...")
    (description "Highly customizable Scrabble game (classic, SuperScrabble, 3D games) - Qt version.")
    (license license:gpl3+)))

;;; thinkpad-p14s — Utilities and dependencies for a Thinkpad P14s laptop
(define-public thinkpad-p14s
  (package
    (name "thinkpad-p14s")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thinkpad-p14s.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rnestler/archpkg-thinkpad-p14s")
    (synopsis "utilities and dependencies for a Thinkpad P14s laptop")
    (description "Utilities and dependencies for a Thinkpad P14s laptop.")
    (license license:gpl3+)))

;;; wwwoffle-svn — Simple caching proxy server with special features (request, recursive 
(define-public wwwoffle-svn
  (package
    (name "wwwoffle-svn")
    (version "1:2.9j+svn2260.d20241022")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wwwoffle-svn.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gedanken.org.uk/software/wwwoffle/")
    (synopsis "simple caching proxy server with special features (request, recursive...")
    (description "Simple caching proxy server with special features (request, recursive fetch, subscription, modify HTML, ...) for use with dial-up internet links. Includes startup scripts for OpenRC, System V init, systemd.")
    (license license:gpl2)))

;;; jriver-media-center24 — The Most Comprehensive Media Software
(define-public jriver-media-center24
  (package
    (name "jriver-media-center24")
    (version "24.0.78")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jriver-media-center24.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.jriver.com/")
    (synopsis "the Most Comprehensive Media Software")
    (description "The Most Comprehensive Media Software.")
    (license license:nonfree)))

;;; tesseract-data-bos-git — Trained language data for tesseract OCR Engine
(define-public tesseract-data-bos-git
  (package
    (name "tesseract-data-bos-git")
    (version "4.1.0.r0.g4767ea9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tesseract-data-bos-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tesseract-ocr/tessdata")
    (synopsis "trained language data for tesseract OCR Engine")
    (description "Trained language data for tesseract OCR Engine.")
    (license license:asl2.0)))

;;; fireurl — Fixing the firejail URL open issue
(define-public fireurl
  (package
    (name "fireurl")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fireurl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rusty-snake/fireurl")
    (synopsis "fixing the firejail URL open issue")
    (description "Fixing the firejail URL open issue.")
    (license license:expat)))

;;; totp — A tiny command line utility to generate OTP tokens
(define-public totp
  (package
    (name "totp")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/totp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/angt/totp")
    (synopsis "a tiny command line utility to generate OTP tokens")
    (description "A tiny command line utility to generate OTP tokens.")
    (license license:bsd-3)))

;;; sentrum-bin — Daemon that monitors watch-only bitcoin wallets
(define-public sentrum-bin
  (package
    (name "sentrum-bin")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sentrum-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sommerfelddev/sentrum")
    (synopsis "daemon that monitors watch-only bitcoin wallets")
    (description "Daemon that monitors watch-only bitcoin wallets.")
    (license license:expat)))

;;; avirusnamedtom-hib — A Virus Named TOM, a fast-paced action-puzzler (Humble Bundle version)
(define-public avirusnamedtom-hib
  (package
    (name "avirusnamedtom-hib")
    (version "0+h20131019")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/avirusnamedtom-hib.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.avirusnamedtom.com/")
    (synopsis "a Virus Named TOM, a fast-paced action-puzzler (Humble Bundle version)")
    (description "A Virus Named TOM, a fast-paced action-puzzler (Humble Bundle version).")
    (license license:nonfree)))

;;; xoscope — A digital oscilloscope using input from a sound card. This package doe
(define-public xoscope
  (package
    (name "xoscope")
    (version "2.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xoscope.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://xoscope.sourceforge.net/")
    (synopsis "a digital oscilloscope using input from a sound card. This package do...")
    (description "A digital oscilloscope using input from a sound card. This package does not support COMEDI devices.")
    (license license:gpl2+)))

;;; dbacl — Digramic Bayesian classifier
(define-public dbacl
  (package
    (name "dbacl")
    (version "1.14.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dbacl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://dbacl.sourceforge.net/")
    (synopsis "digramic Bayesian classifier")
    (description "Digramic Bayesian classifier.")
    (license license:gpl3+)))

;;; trackballs — Simple game similar to the classical game Marble Madness on the Amiga 
(define-public trackballs
  (package
    (name "trackballs")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trackballs.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://trackballs.github.io/")
    (synopsis "simple game similar to the classical game Marble Madness on the Amiga...")
    (description "Simple game similar to the classical game Marble Madness on the Amiga in the 80's.")
    (license license:gpl3+)))

;;; yadifa — lightweight authoritative Name Server with DNSSEC capabilities
(define-public yadifa
  (package
    (name "yadifa")
    (version "2.6.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yadifa.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.yadifa.eu")
    (synopsis "lightweight authoritative Name Server with DNSSEC capabilities")
    (description "Lightweight authoritative Name Server with DNSSEC capabilities.")
    (license license:bsd-3)))

;;; cinnamon-doc — Code documentation for various Cinnamon components.
(define-public cinnamon-doc
  (package
    (name "cinnamon-doc")
    (version "6.6.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cinnamon-doc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://packages.linuxmint.com/pool/backport/c/cinnamon")
    (synopsis "code documentation for various Cinnamon components")
    (description "Code documentation for various Cinnamon components.")
    (license license:gpl3+)))

;;; digital-assets — Cryptocurrencies prices and statistics
(define-public digital-assets
  (package
    (name "digital-assets")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/digital-assets.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/fgrabenstaetter/digital-assets")
    (synopsis "cryptocurrencies prices and statistics")
    (description "Cryptocurrencies prices and statistics.")
    (license license:gpl3)))

;;; fityk-git — A program for nonlinear fitting of analytical functions to data.
(define-public fityk-git
  (package
    (name "fityk-git")
    (version "r1713.d3bd1341")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fityk-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://fityk.nieto.pl/")
    (synopsis "a program for nonlinear fitting of analytical functions to data")
    (description "A program for nonlinear fitting of analytical functions to data.")
    (license license:gpl2)))

;;; gtkmagnetic — An interpreter for British text adventures by Magnetic Scrolls.
(define-public gtkmagnetic
  (package
    (name "gtkmagnetic")
    (version "2.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtkmagnetic.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mirror.ifarchive.org/indexes/if-archive/magnetic-scrolls/interpreters/magnetic/")
    (synopsis "an interpreter for British text adventures by Magnetic Scrolls")
    (description "An interpreter for British text adventures by Magnetic Scrolls.")
    (license license:gpl2+)))

;;; kim-api — Online framework for reliable, reproducible and portable molecular sim
(define-public kim-api
  (package
    (name "kim-api")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kim-api.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openkim.org")
    (synopsis "online framework for reliable, reproducible and portable molecular si...")
    (description "Online framework for reliable, reproducible and portable molecular simulations.")
    (license license:nonfree)))

;;; lua51-unix — Lua bindings for common *nix system APIs
(define-public lua51-unix
  (package
    (name "lua51-unix")
    (version "20190403")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua51-unix.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wahern/lunix")
    (synopsis "lua bindings for common *nix system APIs")
    (description "Lua bindings for common *nix system APIs.")
    (license license:expat)))

;;; nemo-qml-plugin-dbus — Provides types to access D-Bus from QML
(define-public nemo-qml-plugin-dbus
  (package
    (name "nemo-qml-plugin-dbus")
    (version "2.1.35")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nemo-qml-plugin-dbus.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sailfishos/nemo-qml-plugin-dbus")
    (synopsis "provides types to access D-Bus from QML")
    (description "Provides types to access D-Bus from QML.")
    (license license:gpl2+)))

;;; pass-sshaskpass-git — Get ssh passphrase from pass
(define-public pass-sshaskpass-git
  (package
    (name "pass-sshaskpass-git")
    (version "18.698346b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pass-sshaskpass-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jlesquembre/pass-sshaskpass")
    (synopsis "get ssh passphrase from pass")
    (description "Get ssh passphrase from pass.")
    (license license:gpl2)))

;;; pyromaths — French program to create mathematical exercises and models, cli versio
(define-public pyromaths
  (package
    (name "pyromaths")
    (version "18.9.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pyromaths.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/pyromaths")
    (synopsis "french program to create mathematical exercises and models, cli version")
    (description "French program to create mathematical exercises and models, cli version.")
    (license license:gpl3)))

;;; reg — Docker registry v2 command line client and repo listing generator with
(define-public reg
  (package
    (name "reg")
    (version "0.16.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/reg.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/genuinetools/reg")
    (synopsis "docker registry v2 command line client and repo listing generator wit...")
    (description "Docker registry v2 command line client and repo listing generator with security checks.")
    (license license:expat)))

;;; sunvox-1-x — Small, fast and powerful modular synthesizer with pattern-based sequen
(define-public sunvox-1-x
  (package
    (name "sunvox-1-x")
    (version "1.9.6c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunvox-1.x.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://warmplace.ru/soft/sunvox/")
    (synopsis "small, fast and powerful modular synthesizer with pattern-based seque...")
    (description "Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker).")
    (license license:nonfree)))

;;; vscode-codicons-git — The icon font for Visual Studio Code
(define-public vscode-codicons-git
  (package
    (name "vscode-codicons-git")
    (version "0.0.35.r49.eaa0306")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vscode-codicons-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://microsoft.github.io/vscode-codicons/dist/codicon.html")
    (synopsis "the icon font for Visual Studio Code")
    (description "The icon font for Visual Studio Code.")
    (license license:nonfree)))

;;; vacuum-im — Crossplatform Jabber/XMPP client
(define-public vacuum-im
  (package
    (name "vacuum-im")
    (version "1.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vacuum-im.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.vacuum-im.org/")
    (synopsis "crossplatform Jabber/XMPP client")
    (description "Crossplatform Jabber/XMPP client.")
    (license license:gpl3)))

;;; python-distribution — Short, simple, direct scripts for creating ASCII graphical histograms 
(define-public python-distribution
  (package
    (name "python-distribution")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-distribution.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wizzat/distribution")
    (synopsis "short, simple, direct scripts for creating ASCII graphical histograms...")
    (description "Short, simple, direct scripts for creating ASCII graphical histograms in the terminal.")
    (license license:gpl2)))

;;; litra-autotoggle — Automatically turn your Logitech Litra device on when your webcam turn
(define-public litra-autotoggle
  (package
    (name "litra-autotoggle")
    (version "1.2.0.0.g83f9222")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/litra-autotoggle.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timrogers/litra-autotoggle")
    (synopsis "automatically turn your Logitech Litra device on when your webcam tur...")
    (description "Automatically turn your Logitech Litra device on when your webcam turns on, and off when your webcam turns off.")
    (license license:expat)))

;;; git-treeflow-bin — A terminal UI for managing git worktrees
(define-public git-treeflow-bin
  (package
    (name "git-treeflow-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-treeflow-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cKreymborg/git-treeflow")
    (synopsis "a terminal UI for managing git worktrees")
    (description "A terminal UI for managing git worktrees.")
    (license license:expat)))

;;; arkenfox-hook-git — Post-install hook to update the arkenfox user.js
(define-public arkenfox-hook-git
  (package
    (name "arkenfox-hook-git")
    (version "r2.2c3c397")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arkenfox-hook-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aartoni/arkenfox-hooks")
    (synopsis "post-install hook to update the arkenfox user.js")
    (description "Post-install hook to update the arkenfox user.js.")
    (license license:unlicense)))

;;; prowlarr-develop — Indexer manager/proxy for usenet and torrent users (develop branch)
(define-public prowlarr-develop
  (package
    (name "prowlarr-develop")
    (version "2.3.6.5351")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prowlarr-develop.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://prowlarr.com")
    (synopsis "indexer manager/proxy for usenet and torrent users (develop branch)")
    (description "Indexer manager/proxy for usenet and torrent users (develop branch).")
    (license license:gpl3+)))

;;; world-of-goo-2 — Build bridges, grow towers, terraform terrain, and fuel flying machine
(define-public world-of-goo-2
  (package
    (name "world-of-goo-2")
    (version "13211.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/world-of-goo-2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://worldofgoo2.com")
    (synopsis "build bridges, grow towers, terraform terrain, and fuel flying machin...")
    (description "Build bridges, grow towers, terraform terrain, and fuel flying machines in the followup to World of Goo.")
    (license license:nonfree)))

;;; ontake-himitsu-git — A tiny command line 2FA TOTP client.
(define-public ontake-himitsu-git
  (package
    (name "ontake-himitsu-git")
    (version "r10.g1840670")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ontake-himitsu-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.ontake.dev/go/himitsu")
    (synopsis "a tiny command line 2FA TOTP client")
    (description "A tiny command line 2FA TOTP client.")
    (license license:gpl3)))

;;; vim-everforest-git — Comfortable & Pleasant Color Scheme
(define-public vim-everforest-git
  (package
    (name "vim-everforest-git")
    (version "0.1.3.r35.g2dd7dd9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vim-everforest-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sainnhe/everforest")
    (synopsis "comfortable & Pleasant Color Scheme")
    (description "Comfortable & Pleasant Color Scheme.")
    (license license:expat)))

;;; aria2-config-script — 一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。
(define-public aria2-config-script
  (package
    (name "aria2-config-script")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aria2-config-script.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/aria2-config-script")
    (synopsis "一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。")
    (description "一个自动配置Aria2的脚本，自动创建、启动服务，可直接搭配浏览器插件使用。.")
    (license license:gpl3+)))

;;; liri-text-git — Advanced text editor built in accordance with Material Design
(define-public liri-text-git
  (package
    (name "liri-text-git")
    (version "r324.404d021")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liri-text-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://liri.io")
    (synopsis "advanced text editor built in accordance with Material Design")
    (description "Advanced text editor built in accordance with Material Design.")
    (license license:gpl3)))

;;; compiler-rt19 — Compiler runtime libraries for clang 19
(define-public compiler-rt19
  (package
    (name "compiler-rt19")
    (version "19.1.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/compiler-rt19.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://compiler-rt.llvm.org/")
    (synopsis "compiler runtime libraries for clang 19")
    (description "Compiler runtime libraries for clang 19.")
    (license license:asl2.0)))

;;; ansible-docs-git — HTML documentation of Ansible
(define-public ansible-docs-git
  (package
    (name "ansible-docs-git")
    (version "1:2.11.0b4.r1446.g95df5cb740c")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ansible-docs-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ansible/ansible")
    (synopsis "hTML documentation of Ansible")
    (description "HTML documentation of Ansible.")
    (license license:gpl3)))

;;; boardmix-uos — Online collaborative whiteboard software.
(define-public boardmix-uos
  (package
    (name "boardmix-uos")
    (version "1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/boardmix-uos.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://boardmix.cn/")
    (synopsis "online collaborative whiteboard software")
    (description "Online collaborative whiteboard software.")
    (license license:nonfree)))

;;; cchat-gtk-git — Gtk frontend for cchat.
(define-public cchat-gtk-git
  (package
    (name "cchat-gtk-git")
    (version "r123.776b58b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cchat-gtk-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/diamondburned/cchat-gtk")
    (synopsis "gtk frontend for cchat")
    (description "Gtk frontend for cchat.")
    (license license:gpl3)))

;;; conmon-git — OCI container runtime monitor (git)
(define-public conmon-git
  (package
    (name "conmon-git")
    (version "2.0.30_dev.r387.g018c40e")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/conmon-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/containers/conmon.git")
    (synopsis "oCI container runtime monitor (git)")
    (description "OCI container runtime monitor (git).")
    (license license:asl2.0)))

;;; deepin-wine-cntv-cbox — CGTN CBox on Deepin Wine 6
(define-public deepin-wine-cntv-cbox
  (package
    (name "deepin-wine-cntv-cbox")
    (version "6.0.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deepin-wine-cntv-cbox.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://app.cctv.com/")
    (synopsis "cGTN CBox on Deepin Wine 6")
    (description "CGTN CBox on Deepin Wine 6.")
    (license license:nonfree)))

;;; sync-worktrees — Git cli tool for managing worktrees
(define-public sync-worktrees
  (package
    (name "sync-worktrees")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sync-worktrees.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coderaiser/cloudcmd")
    (synopsis "git cli tool for managing worktrees")
    (description "Git cli tool for managing worktrees.")
    (license license:expat)))

;;; drumrox — Drumrox is LV2 drum machine that supports Hydrogen, Drumrox and SFZ dr
(define-public drumrox
  (package
    (name "drumrox")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/drumrox.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psemiletov/drumrox")
    (synopsis "drumrox is LV2 drum machine that supports Hydrogen, Drumrox and SFZ d...")
    (description "Drumrox is LV2 drum machine that supports Hydrogen, Drumrox and SFZ drumkits.")
    (license license:gpl3+)))

;;; excite-cli — A Terminal-Based Citation Generator
(define-public excite-cli
  (package
    (name "excite-cli")
    (version "v0.2.0_alpha")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/excite-cli.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "git+https://github.com/nshan651/excite-cli")
    (synopsis "a Terminal-Based Citation Generator")
    (description "A Terminal-Based Citation Generator.")
    (license license:gpl3)))

;;; foobar2000-component-uie-typefind-bin — A Columns UI search bar for foobar2000
(define-public foobar2000-component-uie-typefind-bin
  (package
    (name "foobar2000-component-uie-typefind-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foobar2000-component-uie-typefind-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.foobar2000.org/components/view/foo_uie_typefind")
    (synopsis "a Columns UI search bar for foobar2000")
    (description "A Columns UI search bar for foobar2000.")
    (license license:nonfree)))

;;; git-now-git — A temporary commit tool for git
(define-public git-now-git
  (package
    (name "git-now-git")
    (version "20131020")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-now-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/iwata/git-now")
    (synopsis "a temporary commit tool for git")
    (description "A temporary commit tool for git.")
    (license license:gpl3+)))

;;; gpufetch-git — Simple yet fancy GPU architecture fetching tool
(define-public gpufetch-git
  (package
    (name "gpufetch-git")
    (version "0.10.r0.gf4a96ce")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpufetch-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Dr-Noob/gpufetch")
    (synopsis "simple yet fancy GPU architecture fetching tool")
    (description "Simple yet fancy GPU architecture fetching tool.")
    (license license:expat)))

;;; homed-automation — HOMEd Automation is simple service for home automations
(define-public homed-automation
  (package
    (name "homed-automation")
    (version "1.2.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/homed-automation.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.homed.dev/")
    (synopsis "hOMEd Automation is simple service for home automations")
    (description "HOMEd Automation is simple service for home automations.")
    (license license:gpl3)))

;;; r-fpc — Flexible Procedures for Clustering
(define-public r-fpc
  (package
    (name "r-fpc")
    (version "2.2.14")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-fpc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cran.r-project.org/package=fpc")
    (synopsis "flexible Procedures for Clustering")
    (description "Flexible Procedures for Clustering.")
    (license license:gpl3+)))

;;; r-scatterplot3d — 3D Scatter Plot
(define-public r-scatterplot3d
  (package
    (name "r-scatterplot3d")
    (version "0.3.45")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-scatterplot3d.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cran.r-project.org/package=scatterplot3d")
    (synopsis "3D Scatter Plot")
    (description "3D Scatter Plot.")
    (license license:gpl2)))

;;; intercal — INTERCAL compiler
(define-public intercal
  (package
    (name "intercal")
    (version "0.31")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/intercal.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://catb.org/esr/intercal/")
    (synopsis "iNTERCAL compiler")
    (description "INTERCAL compiler.")
    (license license:gpl2)))

;;; keyplusd-git — keyboard remapping tool that emulates keyplus firmware
(define-public keyplusd-git
  (package
    (name "keyplusd-git")
    (version "0.4.0a1.r2.g9793bd3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/keyplusd-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ahtn/keyplus/tree/master/ports/linux")
    (synopsis "keyboard remapping tool that emulates keyplus firmware")
    (description "Keyboard remapping tool that emulates keyplus firmware.")
    (license license:expat)))

;;; libewf-git — Library to access the Expert Witness Compression Format (EWF)
(define-public libewf-git
  (package
    (name "libewf-git")
    (version "20231119.r3.gf5aa2e2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libewf-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/libyal/libewf")
    (synopsis "library to access the Expert Witness Compression Format (EWF)")
    (description "Library to access the Expert Witness Compression Format (EWF).")
    (license license:gpl3+)))

;;; lout-dejavu-git — AFM files and KOI8-R mapping for DejaVu TrueType fonts for Lout
(define-public lout-dejavu-git
  (package
    (name "lout-dejavu-git")
    (version "61b4690")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lout-dejavu-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/i-kuzmin/lout-dejavu")
    (synopsis "aFM files and KOI8-R mapping for DejaVu TrueType fonts for Lout")
    (description "AFM files and KOI8-R mapping for DejaVu TrueType fonts for Lout.")
    (license license:gpl3)))
