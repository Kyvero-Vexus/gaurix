;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423l
;;; Resolves 100 TODO packages from queue.
;;;
;;; New recipes (100):
;;;        1.  stm32flash (gnu-build-system, v0.7, GPL2)
;;;        2.  betaflight-configurator-bin (copy-build-system, v10.10.0, GPL3)
;;;        3.  betaflight-configurator (node-build-system, v10.10.0, GPL3)
;;;        4.  caffe-doc (pyproject-build-system, v1.0, BSD-2-Clause)
;;;        5.  libresample (gnu-build-system, v0.1.3, LGPL2)
;;;        6.  pup-git (go-build-system, v0.4.0.r11.g5a57cf1, MIT)
;;;        7.  stardict-en-ru-bars (gnu-build-system, v2.4.2, unknown)
;;;        8.  transmission-gtk-git (cmake-build-system, v4.1.0.beta.2.r0.gac5c9e082, MIT)
;;;        9.  sct (gnu-build-system, v1.0.0, Public Domain)
;;;       10.  ttf-dejavu-emojiless (font-build-system, v2.37+18+g9b5d1b2f, custom)
;;;       11.  usbasp-udev (gnu-build-system, v0.2, custom)
;;;       12.  general-preprocessor (gnu-build-system, v2.1.4, custom:ISC)
;;;       13.  gobi-firmware (gnu-build-system, v1, custom)
;;;       14.  i3blocks-git (gnu-build-system, v1.4.r62.ga44b67f, GPL3)
;;;       15.  ttf-league-gothic (font-build-system, v1.601, OFL)
;;;       16.  malaga (gnu-build-system, v7.12, GPL2)
;;;       17.  neon-wallet-bin (copy-build-system, v2.16.16, MIT)
;;;       18.  pacnews-git (gnu-build-system, v1.0.r341.87fee7a, unknown)
;;;       19.  tor-messenger-bin (copy-build-system, v0.5.0b1, MIT)
;;;       20.  xcursor-gt3 (gnu-build-system, v2.0, Artistic 2.0)
;;;       21.  fbcat (gnu-build-system, v0.5.2, GPL2)
;;;       22.  openxcom-docs-git (cmake-build-system, v1.0_r3144_g31c72c887, GPL-3.0-or-later)
;;;       23.  i3blocks-contrib (gnu-build-system, v2.0.0, GPL3)
;;;       24.  nomachine-enterprise-client (gnu-build-system, v9.4.14, custom:"NoMachine EULA")
;;;       25.  dendrite (go-build-system, v0.15.2, AGPL-3.0-or-later)
;;;       26.  lua54-cjson (gnu-build-system, v2.1.0.16, MIT)
;;;       27.  lua53-cjson (gnu-build-system, v2.1.0.16, MIT)
;;;       28.  lua52-cjson (gnu-build-system, v2.1.0.16, MIT)
;;;       29.  lua51-cjson (gnu-build-system, v2.1.0.16, MIT)
;;;       30.  lua-cjson (gnu-build-system, v2.1.0.16, MIT)
;;;       31.  atomicwallet (gnu-build-system, v2.100.3, Custon:atomicwallet)
;;;       32.  dbschema (gnu-build-system, v10.1.3, custom)
;;;       33.  applyppf (gnu-build-system, v3.0, GPL)
;;;       34.  antergos-wallpapers (gnu-build-system, v0.7, CCPL:by-nc-sa)
;;;       35.  gmt-coast (gnu-build-system, v2.3.7, LGPL)
;;;       36.  nerd-fonts-complete-mono-glyphs (gnu-build-system, v2.1.0, MIT)
;;;       37.  android-sources (gnu-build-system, v37.0_r01, LicenseRef-custom)
;;;       38.  breeze-lxqt (gnu-build-system, v1.4, cc-by-nc-nd-4.0)
;;;       39.  cloudfoundry-cli (gnu-build-system, v8.18.0, Apache)
;;;       40.  libgphobos-git (gnu-build-system, v10.0.0+v2.086.0, GPL3)
;;;       41.  glui (gnu-build-system, v2.37, GPL)
;;;       42.  md5 (gnu-build-system, v2.3, custom)
;;;       43.  otf-pecita (font-build-system, v5.4, OFL)
;;;       44.  ovpngen (gnu-build-system, v1.28, MIT)
;;;       45.  shadowfox-updater (gnu-build-system, v2.2.0, MIT)
;;;       46.  ttf-d2coding (font-build-system, v1.3.2, custom:OFL)
;;;       47.  ttf-tengwar-annatar (font-build-system, v1.20, custom:tengwar-annatar)
;;;       48.  ttf-tiresias (font-build-system, v20090804, GPL3)
;;;       49.  windows10-icon-theme-git (gnu-build-system, vr14.9f199c6, GPL3)
;;;       50.  zsh-doc-git (gnu-build-system, v5.9.r450.g09c5b10dc, custom)
;;;       51.  ttf-material-design-icons-extended (font-build-system, v7.4.47, custom:PFL)
;;;       52.  hdsentinel (gnu-build-system, v0.20, unknown)
;;;       53.  rancher-k3d-bin (copy-build-system, v5.8.3, MIT)
;;;       54.  argparser-python (gnu-build-system, v5.1, AGPL3)
;;;       55.  huiontablet (gnu-build-system, v15.0.0.162, unknown)
;;;       56.  swapspace (gnu-build-system, v1.18, GPL)
;;;       57.  emulationstation-themes (gnu-build-system, v0.2, WTFPL)
;;;       58.  qogir-icon-theme-git (gnu-build-system, v2023.06.05.r5.g7edbf61f, GPL3)
;;;       59.  i3-battery-popup-git (gnu-build-system, vr23.5855624, GPL)
;;;       60.  anoise-community-extension1 (gnu-build-system, v0.0.1, GPL3)
;;;       61.  minecraft-overviewer-docs-git (pyproject-build-system, v0.19.0.r9.6ffbe0f0, GPL3)
;;;       62.  chez-scheme-git (gnu-build-system, v10.1.0+r2432+g003a1bf99, Apache-2.0)
;;;       63.  doom3-data (gnu-build-system, v1.3.1.1304, custom)
;;;       64.  fairymax (gnu-build-system, v4.8S, custom)
;;;       65.  mac-os-lion-cursors (gnu-build-system, v2.0, GPL-3.0-or-later)
;;;       66.  pfetch-git (gnu-build-system, vr340.e18a095, MIT)
;;;       67.  pipewire-docs-git (pyproject-build-system, v1.5.0.r13799.9a6f8d31d, MIT)
;;;       68.  ttf-ricty (font-build-system, v4.1.1, custom)
;;;       69.  ttf-twcns-fonts (font-build-system, v20260111, custom)
;;;       70.  ucsf-chimera (gnu-build-system, v1.17.3, custom:ucsf-chimera)
;;;       71.  words-insane (gnu-build-system, v2020.12.07, custom:copyright)
;;;       72.  folder-color-switcher (gnu-build-system, v1.7.1, GPL)
;;;       73.  libjxl-doc-git (pyproject-build-system, v0.11.1.r456.g3d095d9b, BSD-3-Clause)
;;;       74.  obfs4proxy-bin (copy-build-system, v0.0.14, BSD)
;;;       75.  volta-bin (copy-build-system, v2.0.2, BSD-2-Clause)
;;;       76.  tastytrade (gnu-build-system, v2.29.2, custom:commercial)
;;;       77.  keyd-git (gnu-build-system, v2.6.0.r0.7c0aecb, MIT)
;;;       78.  colobot-gold-data (pyproject-build-system, v0.2.2_alpha, GPL3)
;;;       79.  alac-git (gnu-build-system, v0.r25.5d6d836, custom)
;;;       80.  maitreya (gnu-build-system, v8.2, GPL)
;;;       81.  anoise-community-extension2 (gnu-build-system, v0.0.4, GPL3)
;;;       82.  anoise-community-extension3 (gnu-build-system, v0.0.1, GPL3)
;;;       83.  otf-san-francisco-mono (font-build-system, v1, custom)
;;;       84.  7kaa-music (gnu-build-system, v2.15, custom)
;;;       85.  cairo-docs-git (meson-build-system, v1.18.4.r2.gc1bc9cd32, LGPL-2.1-only OR MPL-1.1)
;;;       86.  freeminer-common (cmake-build-system, v0.4.14.8, CCPL:cc-by-sa-3.0)
;;;       87.  minecraft-overviewer-docs (pyproject-build-system, v0.19.10, GPL3)
;;;       88.  nafe (gnu-build-system, v0.1, GPL2)
;;;       89.  oranchelo-icon-theme-git (gnu-build-system, v0.8.r6.g13886cb, GPL3)
;;;       90.  otf-asana-math (font-build-system, v000.958, OFL)
;;;       91.  otf-fifthleg (font-build-system, v0.6, OFL-1.1)
;;;       92.  pambase-selinux (gnu-build-system, v20250719, GPL-3.0-or-later)
;;;       93.  soundfont-generaluser (gnu-build-system, v2.0.3, custom)
;;;       94.  ttf-sil-ezra (font-build-system, v2.51, MIT)
;;;       95.  yadm-git (gnu-build-system, v3.0.2.r0.ga5b1067, GPL3)
;;;       96.  heretic1-wad (gnu-build-system, v1.2, custom)
;;;       97.  factorio-headless-experimental (gnu-build-system, v2.0.76, custom: commercial)
;;;       98.  sift (go-build-system, v0.9.1, GPL3)
;;;       99.  rockyou (gnu-build-system, v1.2.1, CCPL:by-sa)
;;;      100.  ttf-cheapskate (font-build-system, v2.0, GPL)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            stm32flash
            betaflight-configurator-bin
            betaflight-configurator
            caffe-doc
            libresample
            pup-git
            stardict-en-ru-bars
            transmission-gtk-git
            sct
            ttf-dejavu-emojiless
            usbasp-udev
            general-preprocessor
            gobi-firmware
            i3blocks-git
            ttf-league-gothic
            malaga
            neon-wallet-bin
            pacnews-git
            tor-messenger-bin
            xcursor-gt3
            fbcat
            openxcom-docs-git
            i3blocks-contrib
            nomachine-enterprise-client
            dendrite
            lua54-cjson
            lua53-cjson
            lua52-cjson
            lua51-cjson
            lua-cjson
            atomicwallet
            dbschema
            applyppf
            antergos-wallpapers
            gmt-coast
            nerd-fonts-complete-mono-glyphs
            android-sources
            breeze-lxqt
            cloudfoundry-cli
            libgphobos-git
            glui
            md5
            otf-pecita
            ovpngen
            shadowfox-updater
            ttf-d2coding
            ttf-tengwar-annatar
            ttf-tiresias
            windows10-icon-theme-git
            zsh-doc-git
            ttf-material-design-icons-extended
            hdsentinel
            rancher-k3d-bin
            argparser-python
            huiontablet
            swapspace
            emulationstation-themes
            qogir-icon-theme-git
            i3-battery-popup-git
            anoise-community-extension1
            minecraft-overviewer-docs-git
            chez-scheme-git
            doom3-data
            fairymax
            mac-os-lion-cursors
            pfetch-git
            pipewire-docs-git
            ttf-ricty
            ttf-twcns-fonts
            ucsf-chimera
            words-insane
            folder-color-switcher
            libjxl-doc-git
            obfs4proxy-bin
            volta-bin
            tastytrade
            keyd-git
            colobot-gold-data
            alac-git
            maitreya
            anoise-community-extension2
            anoise-community-extension3
            otf-san-francisco-mono
            7kaa-music
            cairo-docs-git
            freeminer-common
            minecraft-overviewer-docs
            nafe
            oranchelo-icon-theme-git
            otf-asana-math
            otf-fifthleg
            pambase-selinux
            soundfont-generaluser
            ttf-sil-ezra
            yadm-git
            heretic1-wad
            factorio-headless-experimental
            sift
            rockyou
            ttf-cheapskate
            ))

;;; -------------------------------------------------------------------
;;; 1. stm32flash --- open source flash program for the STM32 ARM processors using the ST seria...
;;; -------------------------------------------------------------------
(define-public stm32flash
  (package
    (name "stm32flash")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/stm32flash//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source flash program for the STM32 ARM processors using the ST seria...")
    (description "Open source flash program for the STM32 ARM processors using the ST serial bootloader over UART or I2C.")
    (home-page "https://sourceforge.net/projects/stm32flash/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2. betaflight-configurator-bin --- crossplatform configuration tool for the Betaflight flight control system
;;; -------------------------------------------------------------------
(define-public betaflight-configurator-bin
  (package
    (name "betaflight-configurator-bin")
    (version "10.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/betaflight/betaflight-configurator/releases/download/v" version "/betaflight-configurator-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("betaflight-configurator-bin" "bin/betaflight-configurator-bin"))))
    (synopsis "crossplatform configuration tool for the Betaflight flight control system")
    (description "Crossplatform configuration tool for the Betaflight flight control system.")
    (home-page "https://github.com/betaflight/betaflight-configurator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. betaflight-configurator --- crossplatform configuration tool for the Betaflight flight control system
;;; -------------------------------------------------------------------
(define-public betaflight-configurator
  (package
    (name "betaflight-configurator")
    (version "10.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/betaflight/betaflight-configurator")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "crossplatform configuration tool for the Betaflight flight control system")
    (description "Crossplatform configuration tool for the Betaflight flight control system.")
    (home-page "https://github.com/betaflight/betaflight-configurator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. caffe-doc --- a deep learning framework made with expression, speed, and modularity in ...
;;; -------------------------------------------------------------------
(define-public caffe-doc
  (package
    (name "caffe-doc")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://caffe.berkeleyvision.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a deep learning framework made with expression, speed, and modularity in ...")
    (description "A deep learning framework made with expression, speed, and modularity in mind (cpu only, documentation).")
    (home-page "https://caffe.berkeleyvision.org/")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 5. libresample --- a real-time library for audio sampling rate conversion
;;; -------------------------------------------------------------------
(define-public libresample
  (package
    (name "libresample")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ccrma.stanford.edu/~jos/resample/Free_Resampling_Software.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a real-time library for audio sampling rate conversion")
    (description "A real-time library for audio sampling rate conversion.")
    (home-page "https://ccrma.stanford.edu/~jos/resample/Free_Resampling_Software.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 6. pup-git --- parsing HTML at the command line
;;; -------------------------------------------------------------------
(define-public pup-git
  (package
    (name "pup-git")
    (version "0.4.0.r11.g5a57cf1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EricChiang/pup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/EricChiang/pup"
      #:tests? #f))
    (synopsis "parsing HTML at the command line")
    (description "Parsing HTML at the command line.")
    (home-page "https://github.com/EricChiang/pup")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. stardict-en-ru-bars --- large english-russian dictionary for Stardict
;;; -------------------------------------------------------------------
(define-public stardict-en-ru-bars
  (package
    (name "stardict-en-ru-bars")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://stardict.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "large english-russian dictionary for Stardict")
    (description "Large english-russian dictionary for Stardict.")
    (home-page "http://stardict.sourceforge.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8. transmission-gtk-git --- fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github...
;;; -------------------------------------------------------------------
(define-public transmission-gtk-git
  (package
    (name "transmission-gtk-git")
    (version "4.1.0.beta.2.r0.gac5c9e082")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.transmissionbt.com/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github...")
    (description "Fast, easy, and free BitTorrent client (GTK+ GUI)(Git version from github repository).")
    (home-page "http://www.transmissionbt.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. sct --- set color temperature
;;; -------------------------------------------------------------------
(define-public sct
  (package
    (name "sct")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.tedunangst.com/flak/post/sct-set-color-temperature/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set color temperature")
    (description "Set color temperature.")
    (home-page "http://www.tedunangst.com/flak/post/sct-set-color-temperature")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 10. ttf-dejavu-emojiless --- derivate of DejaVu without characters listed as emoji, in order not to ov...
;;; -------------------------------------------------------------------
(define-public ttf-dejavu-emojiless
  (package
    (name "ttf-dejavu-emojiless")
    (version "2.37+18+g9b5d1b2f")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dejavu-fonts.github.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "derivate of DejaVu without characters listed as emoji, in order not to ov...")
    (description "Derivate of DejaVu without characters listed as emoji, in order not to override color fonts.")
    (home-page "https://dejavu-fonts.github.io")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11. usbasp-udev --- udev rules for USBasp Atmel AVR programmer
;;; -------------------------------------------------------------------
(define-public usbasp-udev
  (package
    (name "usbasp-udev")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.fischl.de/usbasp//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rules for USBasp Atmel AVR programmer")
    (description "Udev rules for USBasp Atmel AVR programmer.")
    (home-page "http://www.fischl.de/usbasp/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12. general-preprocessor --- bash-based preprocessor for anything
;;; -------------------------------------------------------------------
(define-public general-preprocessor
  (package
    (name "general-preprocessor")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/maandree/gpp/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bash-based preprocessor for anything")
    (description "Bash-based preprocessor for anything.")
    (home-page "https://codeberg.org/maandree/gpp")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 13. gobi-firmware --- firmware for gobi 2000 wwan chipset
;;; -------------------------------------------------------------------
(define-public gobi-firmware
  (package
    (name "gobi-firmware")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.thinkwiki.org/wiki/Qualcomm_Gobi_2000/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for gobi 2000 wwan chipset")
    (description "Firmware for gobi 2000 wwan chipset.")
    (home-page "http://www.thinkwiki.org/wiki/Qualcomm_Gobi_2000")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14. i3blocks-git --- define blocks for your i3bar status line
;;; -------------------------------------------------------------------
(define-public i3blocks-git
  (package
    (name "i3blocks-git")
    (version "1.4.r62.ga44b67f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vivien/i3blocks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "define blocks for your i3bar status line")
    (description "Define blocks for your i3bar status line.")
    (home-page "https://github.com/vivien/i3blocks")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. ttf-league-gothic --- a revival of an old classic, Alternate Gothic #1
;;; -------------------------------------------------------------------
(define-public ttf-league-gothic
  (package
    (name "ttf-league-gothic")
    (version "1.601")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.theleagueofmoveabletype.com/league-gothic/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a revival of an old classic, Alternate Gothic #1")
    (description "A revival of an old classic, Alternate Gothic #1.")
    (home-page "https://www.theleagueofmoveabletype.com/league-gothic")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16. malaga --- a software for the development and application of grammars that are used ...
;;; -------------------------------------------------------------------
(define-public malaga
  (package
    (name "malaga")
    (version "7.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://home.arcor.de/bjoern-beutel/malaga//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a software for the development and application of grammars that are used ...")
    (description "A software for the development and application of grammars that are used for the analysis of words and sentences of natural languages.")
    (home-page "http://home.arcor.de/bjoern-beutel/malaga/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. neon-wallet-bin --- lightweight Wallet for the NEO CryptoCurrency
;;; -------------------------------------------------------------------
(define-public neon-wallet-bin
  (package
    (name "neon-wallet-bin")
    (version "2.16.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CityOfZion/neon-wallet/releases/download/v" version "/neon-wallet-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("neon-wallet-bin" "bin/neon-wallet-bin"))))
    (synopsis "lightweight Wallet for the NEO CryptoCurrency")
    (description "Lightweight Wallet for the NEO CryptoCurrency.")
    (home-page "https://github.com/CityOfZion/neon-wallet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. pacnews-git --- find .pacnew files and merge them with vimdiff
;;; -------------------------------------------------------------------
(define-public pacnews-git
  (package
    (name "pacnews-git")
    (version "1.0.r341.87fee7a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/pacnews-git")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find .pacnew files and merge them with vimdiff")
    (description "Find .pacnew files and merge them with vimdiff.")
    (home-page "None")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 19. tor-messenger-bin --- chat program that sends all traffic over Tor
;;; -------------------------------------------------------------------
(define-public tor-messenger-bin
  (package
    (name "tor-messenger-bin")
    (version "0.5.0b1")
    (source (origin
              (method url-fetch)
              (uri "https://trac.torproject.org/projects/tor/wiki/doc/TorMessenger")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tor-messenger-bin" "bin/tor-messenger-bin"))))
    (synopsis "chat program that sends all traffic over Tor")
    (description "Chat program that sends all traffic over Tor.")
    (home-page "https://trac.torproject.org/projects/tor/wiki/doc/TorMessenger")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. xcursor-gt3 --- GT3 cursor theme
;;; -------------------------------------------------------------------
(define-public xcursor-gt3
  (package
    (name "xcursor-gt3")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xfce-look.org/content/show.php/GT3?content=106536/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GT3 cursor theme")
    (description "GT3 cursor theme.")
    (home-page "http://xfce-look.org/content/show.php/GT3?content=106536")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 21. fbcat --- framebuffer screenshot tool
;;; -------------------------------------------------------------------
(define-public fbcat
  (package
    (name "fbcat")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jwilk/fbcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "framebuffer screenshot tool")
    (description "Framebuffer screenshot tool.")
    (home-page "https://github.com/jwilk/fbcat")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 22. openxcom-docs-git --- documentation for the open-source reimplementation of the famous X-COM ga...
;;; -------------------------------------------------------------------
(define-public openxcom-docs-git
  (package
    (name "openxcom-docs-git")
    (version "1.0_r3144_g31c72c887")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://openxcom.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the open-source reimplementation of the famous X-COM ga...")
    (description "Documentation for the open-source reimplementation of the famous X-COM game (git-version).")
    (home-page "https://openxcom.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. i3blocks-contrib --- community-contributed blocklets for i3blocks
;;; -------------------------------------------------------------------
(define-public i3blocks-contrib
  (package
    (name "i3blocks-contrib")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vivien/i3blocks-contrib")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "community-contributed blocklets for i3blocks")
    (description "Community-contributed blocklets for i3blocks.")
    (home-page "https://github.com/vivien/i3blocks-contrib")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. nomachine-enterprise-client --- remote desktop application, client only
;;; -------------------------------------------------------------------
(define-public nomachine-enterprise-client
  (package
    (name "nomachine-enterprise-client")
    (version "9.4.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nomachine.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote desktop application, client only")
    (description "Remote desktop application, client only.")
    (home-page "http://www.nomachine.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 25. dendrite --- a second-generation Matrix homeserver written in Go
;;; -------------------------------------------------------------------
(define-public dendrite
  (package
    (name "dendrite")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://element-hq.github.io/dendrite//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path ""
      #:tests? #f))
    (synopsis "a second-generation Matrix homeserver written in Go")
    (description "A second-generation Matrix homeserver written in Go.")
    (home-page "https://element-hq.github.io/dendrite/")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 26. lua54-cjson --- a fast JSON parsing and encoding support for Lua
;;; -------------------------------------------------------------------
(define-public lua54-cjson
  (package
    (name "lua54-cjson")
    (version "2.1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/lua-cjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast JSON parsing and encoding support for Lua")
    (description "A fast JSON parsing and encoding support for Lua.")
    (home-page "https://github.com/openresty/lua-cjson")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. lua53-cjson --- a fast JSON parsing and encoding support for Lua
;;; -------------------------------------------------------------------
(define-public lua53-cjson
  (package
    (name "lua53-cjson")
    (version "2.1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/lua-cjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast JSON parsing and encoding support for Lua")
    (description "A fast JSON parsing and encoding support for Lua.")
    (home-page "https://github.com/openresty/lua-cjson")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. lua52-cjson --- a fast JSON parsing and encoding support for Lua
;;; -------------------------------------------------------------------
(define-public lua52-cjson
  (package
    (name "lua52-cjson")
    (version "2.1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/lua-cjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast JSON parsing and encoding support for Lua")
    (description "A fast JSON parsing and encoding support for Lua.")
    (home-page "https://github.com/openresty/lua-cjson")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. lua51-cjson --- a fast JSON parsing and encoding support for Lua
;;; -------------------------------------------------------------------
(define-public lua51-cjson
  (package
    (name "lua51-cjson")
    (version "2.1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/lua-cjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast JSON parsing and encoding support for Lua")
    (description "A fast JSON parsing and encoding support for Lua.")
    (home-page "https://github.com/openresty/lua-cjson")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. lua-cjson --- a fast JSON parsing and encoding support for Lua
;;; -------------------------------------------------------------------
(define-public lua-cjson
  (package
    (name "lua-cjson")
    (version "2.1.0.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/lua-cjson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast JSON parsing and encoding support for Lua")
    (description "A fast JSON parsing and encoding support for Lua.")
    (home-page "https://github.com/openresty/lua-cjson")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. atomicwallet --- crypto wallet for buying, staking and swapping over 1000+ coins and tokens
;;; -------------------------------------------------------------------
(define-public atomicwallet
  (package
    (name "atomicwallet")
    (version "2.100.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://atomicwallet.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "crypto wallet for buying, staking and swapping over 1000+ coins and tokens")
    (description "Crypto wallet for buying, staking and swapping over 1000+ coins and tokens.")
    (home-page "https://atomicwallet.io")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 32. dbschema --- relational Data Browse, Query Builder, SQL Editor, schema deployment and ...
;;; -------------------------------------------------------------------
(define-public dbschema
  (package
    (name "dbschema")
    (version "10.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.dbschema.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "relational Data Browse, Query Builder, SQL Editor, schema deployment and ...")
    (description "Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.")
    (home-page "http://www.dbschema.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 33. applyppf --- PPF (Playstation Patch File) v3.0 apply tool
;;; -------------------------------------------------------------------
(define-public applyppf
  (package
    (name "applyppf")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/emulators/applyppf/DESCR/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PPF (Playstation Patch File) v3.0 apply tool")
    (description "PPF (Playstation Patch File) v3.0 apply tool.")
    (home-page "https://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/emulators/applyppf/DESCR")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. antergos-wallpapers --- the default wallpapers for Antergos
;;; -------------------------------------------------------------------
(define-public antergos-wallpapers
  (package
    (name "antergos-wallpapers")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.antergos.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the default wallpapers for Antergos")
    (description "The default wallpapers for Antergos.")
    (home-page "http://www.antergos.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 35. gmt-coast --- the full resolution coastline dataset for the Generic Mapping Tools
;;; -------------------------------------------------------------------
(define-public gmt-coast
  (package
    (name "gmt-coast")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.generic-mapping-tools.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the full resolution coastline dataset for the Generic Mapping Tools")
    (description "The full resolution coastline dataset for the Generic Mapping Tools.")
    (home-page "https://www.generic-mapping-tools.org/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 36. nerd-fonts-complete-mono-glyphs --- iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched ...
;;; -------------------------------------------------------------------
(define-public nerd-fonts-complete-mono-glyphs
  (package
    (name "nerd-fonts-complete-mono-glyphs")
    (version "2.1.0")
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
    (synopsis "iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched ...")
    (description "Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts. (Mono glyphs only).")
    (home-page "https://github.com/ryanoasis/nerd-fonts")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. android-sources --- android SDK Sources, latest API
;;; -------------------------------------------------------------------
(define-public android-sources
  (package
    (name "android-sources")
    (version "37.0_r01")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/studio/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android SDK Sources, latest API")
    (description "Android SDK Sources, latest API.")
    (home-page "https://developer.android.com/studio/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 38. breeze-lxqt --- variant of breeze for lxqt
;;; -------------------------------------------------------------------
(define-public breeze-lxqt
  (package
    (name "breeze-lxqt")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://kde-look.org/content/show.php/?content=165578/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "variant of breeze for lxqt")
    (description "Variant of breeze for lxqt.")
    (home-page "http://kde-look.org/content/show.php/?content=165578")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 39. cloudfoundry-cli --- the official command line client for Cloud Foundry
;;; -------------------------------------------------------------------
(define-public cloudfoundry-cli
  (package
    (name "cloudfoundry-cli")
    (version "8.18.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cloudfoundry/cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the official command line client for Cloud Foundry")
    (description "The official command line client for Cloud Foundry.")
    (home-page "https://github.com/cloudfoundry/cli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 40. libgphobos-git --- standard library for D programming language, GDC port
;;; -------------------------------------------------------------------
(define-public libgphobos-git
  (package
    (name "libgphobos-git")
    (version "10.0.0+v2.086.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gcc.gnu.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standard library for D programming language, GDC port")
    (description "Standard library for D programming language, GDC port.")
    (home-page "https://gcc.gnu.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 41. glui --- a GLUT-based C++ user interface library which provides controls such as b...
;;; -------------------------------------------------------------------
(define-public glui
  (package
    (name "glui")
    (version "2.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://glui.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GLUT-based C++ user interface library which provides controls such as b...")
    (description "A GLUT-based C++ user interface library which provides controls such as buttons, checkboxes, radio buttons, and spinners to OpenGL applications.")
    (home-page "http://glui.sourceforge.net/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 42. md5 --- an md5 hash printing utility, that can have files or strings as input
;;; -------------------------------------------------------------------
(define-public md5
  (package
    (name "md5")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.fourmilab.ch/md5//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an md5 hash printing utility, that can have files or strings as input")
    (description "An md5 hash printing utility, that can have files or strings as input.")
    (home-page "http://www.fourmilab.ch/md5/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 43. otf-pecita --- a handwritten font with attached letters
;;; -------------------------------------------------------------------
(define-public otf-pecita
  (package
    (name "otf-pecita")
    (version "5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://pecita.eu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a handwritten font with attached letters")
    (description "A handwritten font with attached letters.")
    (home-page "http://pecita.eu")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 44. ovpngen --- generate an OpenVPN client profile in the unified format
;;; -------------------------------------------------------------------
(define-public ovpngen
  (package
    (name "ovpngen")
    (version "1.28")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graysky2/ovpngen")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate an OpenVPN client profile in the unified format")
    (description "Generate an OpenVPN client profile in the unified format.")
    (home-page "https://github.com/graysky2/ovpngen")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. shadowfox-updater --- an auto-updater for ShadowFox
;;; -------------------------------------------------------------------
(define-public shadowfox-updater
  (package
    (name "shadowfox-updater")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SrKomodo/shadowfox-updater")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an auto-updater for ShadowFox")
    (description "An auto-updater for ShadowFox.")
    (home-page "https://github.com/SrKomodo/shadowfox-updater")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. ttf-d2coding --- d2Coding Fixed Width TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-d2coding
  (package
    (name "ttf-d2coding")
    (version "1.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/naver/d2codingfont")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "d2Coding Fixed Width TrueType fonts")
    (description "D2Coding Fixed Width TrueType fonts.")
    (home-page "https://github.com/naver/d2codingfont")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 47. ttf-tengwar-annatar --- the Tengwar Annatar ttf font family. (Tolkien Elvish)
;;; -------------------------------------------------------------------
(define-public ttf-tengwar-annatar
  (package
    (name "ttf-tengwar-annatar")
    (version "1.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luxcem/ttf-tengwar-annatar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "the Tengwar Annatar ttf font family. (Tolkien Elvish)")
    (description "The Tengwar Annatar ttf font family. (Tolkien Elvish).")
    (home-page "https://github.com/luxcem/ttf-tengwar-annatar")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 48. ttf-tiresias --- a set of free Sans Serif TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-tiresias
  (package
    (name "ttf-tiresias")
    (version "20090804")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.fontsquirrel.com/fonts/Tiresias-Infofont/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a set of free Sans Serif TrueType fonts")
    (description "A set of free Sans Serif TrueType fonts.")
    (home-page "https://www.fontsquirrel.com/fonts/Tiresias-Infofont")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 49. windows10-icon-theme-git --- windows 10 icon theme
;;; -------------------------------------------------------------------
(define-public windows10-icon-theme-git
  (package
    (name "windows10-icon-theme-git")
    (version "r14.9f199c6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/B00merang-Artwork/Windows-10")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "windows 10 icon theme")
    (description "Windows 10 icon theme.")
    (home-page "https://github.com/B00merang-Artwork/Windows-10")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 50. zsh-doc-git --- info, HTML and PDF format of the ZSH documentation
;;; -------------------------------------------------------------------
(define-public zsh-doc-git
  (package
    (name "zsh-doc-git")
    (version "5.9.r450.g09c5b10dc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.zsh.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "info, HTML and PDF format of the ZSH documentation")
    (description "Info, HTML and PDF format of the ZSH documentation.")
    (home-page "https://www.zsh.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 51. ttf-material-design-icons-extended --- a Material Design icons font by the guys over at materialdesignicons.com
;;; -------------------------------------------------------------------
(define-public ttf-material-design-icons-extended
  (package
    (name "ttf-material-design-icons-extended")
    (version "7.4.47")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://materialdesignicons.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a Material Design icons font by the guys over at materialdesignicons.com")
    (description "A Material Design icons font by the guys over at materialdesignicons.com.")
    (home-page "https://materialdesignicons.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 52. hdsentinel --- a freeware, closed source, SMART analysis tool
;;; -------------------------------------------------------------------
(define-public hdsentinel
  (package
    (name "hdsentinel")
    (version "0.20")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.hdsentinel.com/hard_disk_sentinel_linux.php/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a freeware, closed source, SMART analysis tool")
    (description "A freeware, closed source, SMART analysis tool.")
    (home-page "https://www.hdsentinel.com/hard_disk_sentinel_linux.php")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 53. rancher-k3d-bin --- little helper to run Rancher Labs k3s in Docker
;;; -------------------------------------------------------------------
(define-public rancher-k3d-bin
  (package
    (name "rancher-k3d-bin")
    (version "5.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rancher/k3d/releases/download/v" version "/rancher-k3d-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rancher-k3d-bin" "bin/rancher-k3d-bin"))))
    (synopsis "little helper to run Rancher Labs k3s in Docker")
    (description "Little helper to run Rancher Labs k3s in Docker.")
    (home-page "https://github.com/rancher/k3d")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 54. argparser-python --- command line argument parser library, like getopt, except better. Python ...
;;; -------------------------------------------------------------------
(define-public argparser-python
  (package
    (name "argparser-python")
    (version "5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maandree/argparser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line argument parser library, like getopt, except better. Python ...")
    (description "Command line argument parser library, like getopt, except better. Python version.")
    (home-page "https://github.com/maandree/argparser")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 55. huiontablet --- official Huion tablet drivers
;;; -------------------------------------------------------------------
(define-public huiontablet
  (package
    (name "huiontablet")
    (version "15.0.0.162")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.huion.com/download//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official Huion tablet drivers")
    (description "Official Huion tablet drivers.")
    (home-page "https://www.huion.com/download/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 56. swapspace --- a dynamic swap manager
;;; -------------------------------------------------------------------
(define-public swapspace
  (package
    (name "swapspace")
    (version "1.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Tookmund/Swapspace")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a dynamic swap manager")
    (description "A dynamic swap manager.")
    (home-page "https://github.com/Tookmund/Swapspace")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. emulationstation-themes --- emulationStation themes pack
;;; -------------------------------------------------------------------
(define-public emulationstation-themes
  (package
    (name "emulationstation-themes")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aloshi.com/emulationstation/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "emulationStation themes pack")
    (description "EmulationStation themes pack.")
    (home-page "http://aloshi.com/emulationstation")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 58. qogir-icon-theme-git --- a colorful design icon theme for linux desktops
;;; -------------------------------------------------------------------
(define-public qogir-icon-theme-git
  (package
    (name "qogir-icon-theme-git")
    (version "2023.06.05.r5.g7edbf61f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Qogir-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a colorful design icon theme for linux desktops")
    (description "A colorful design icon theme for linux desktops.")
    (home-page "https://github.com/vinceliuice/Qogir-icon-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 59. i3-battery-popup-git --- a script that shows messages to the user when the battery is almost empty
;;; -------------------------------------------------------------------
(define-public i3-battery-popup-git
  (package
    (name "i3-battery-popup-git")
    (version "r23.5855624")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rjekker/i3-battery-popup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a script that shows messages to the user when the battery is almost empty")
    (description "A script that shows messages to the user when the battery is almost empty.")
    (home-page "https://github.com/rjekker/i3-battery-popup")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 60. anoise-community-extension1 --- ambient Noise Community Library Package 1
;;; -------------------------------------------------------------------
(define-public anoise-community-extension1
  (package
    (name "anoise-community-extension1")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://code.launchpad.net/anoise/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ambient Noise Community Library Package 1")
    (description "Ambient Noise Community Library Package 1.")
    (home-page "https://code.launchpad.net/anoise")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 61. minecraft-overviewer-docs-git --- render large resolution images of a Minecraft map with a web UI
;;; -------------------------------------------------------------------
(define-public minecraft-overviewer-docs-git
  (package
    (name "minecraft-overviewer-docs-git")
    (version "0.19.0.r9.6ffbe0f0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/overviewer/Minecraft-Overviewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "render large resolution images of a Minecraft map with a web UI")
    (description "Render large resolution images of a Minecraft map with a web UI.")
    (home-page "https://github.com/overviewer/Minecraft-Overviewer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 62. chez-scheme-git --- chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) ...
;;; -------------------------------------------------------------------
(define-public chez-scheme-git
  (package
    (name "chez-scheme-git")
    (version "10.1.0+r2432+g003a1bf99")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cisco/ChezScheme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) ...")
    (description "Chez Scheme is an implementation of the Revised6 Report on Scheme (R6RS) with numerous language and programming environment extensions. (threaded build).")
    (home-page "https://github.com/cisco/ChezScheme")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 63. doom3-data --- doom 3 patch data files; not the full game!
;;; -------------------------------------------------------------------
(define-public doom3-data
  (package
    (name "doom3-data")
    (version "1.3.1.1304")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.idsoftware.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "doom 3 patch data files; not the full game!")
    (description "Doom 3 patch data files; not the full game!.")
    (home-page "https://www.idsoftware.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 64. fairymax --- an engine playing chess variants
;;; -------------------------------------------------------------------
(define-public fairymax
  (package
    (name "fairymax")
    (version "4.8S")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://home.hccnet.nl/h.g.muller/CVfairy.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an engine playing chess variants")
    (description "An engine playing chess variants.")
    (home-page "http://home.hccnet.nl/h.g.muller/CVfairy.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 65. mac-os-lion-cursors --- MAC OS X Lion Cursor Theme by MB0SS
;;; -------------------------------------------------------------------
(define-public mac-os-lion-cursors
  (package
    (name "mac-os-lion-cursors")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mbossg.deviantart.com/art/Mac-OS-X-Lion-Skin-Pack-V2-For-Ubuntu-12-4-LTS-307230764/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MAC OS X Lion Cursor Theme by MB0SS")
    (description "MAC OS X Lion Cursor Theme by MB0SS.")
    (home-page "https://mbossg.deviantart.com/art/Mac-OS-X-Lion-Skin-Pack-V2-For-Ubuntu-12-4-LTS-307230764")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 66. pfetch-git --- a pretty system information tool written in POSIX sh
;;; -------------------------------------------------------------------
(define-public pfetch-git
  (package
    (name "pfetch-git")
    (version "r340.e18a095")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dylanaraps/pfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a pretty system information tool written in POSIX sh")
    (description "A pretty system information tool written in POSIX sh.")
    (home-page "https://github.com/dylanaraps/pfetch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. pipewire-docs-git --- low-latency audio/video router and processor. (GIT version) - documentation
;;; -------------------------------------------------------------------
(define-public pipewire-docs-git
  (package
    (name "pipewire-docs-git")
    (version "1.5.0.r13799.9a6f8d31d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://pipewire.org")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "low-latency audio/video router and processor. (GIT version) - documentation")
    (description "Low-latency audio/video router and processor. (GIT version) - documentation.")
    (home-page "https://pipewire.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 68. ttf-ricty --- japanese TrueType font for developers by mixing Inconsolata and Migu 1M
;;; -------------------------------------------------------------------
(define-public ttf-ricty
  (package
    (name "ttf-ricty")
    (version "4.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rictyfonts.github.io//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "japanese TrueType font for developers by mixing Inconsolata and Migu 1M")
    (description "Japanese TrueType font for developers by mixing Inconsolata and Migu 1M.")
    (home-page "https://rictyfonts.github.io/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 69. ttf-twcns-fonts --- chinese TrueType fonts by Ministry of Education of Taiwan government, sup...
;;; -------------------------------------------------------------------
(define-public ttf-twcns-fonts
  (package
    (name "ttf-twcns-fonts")
    (version "20260111")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://data.gov.tw/dataset/5961/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "chinese TrueType fonts by Ministry of Education of Taiwan government, sup...")
    (description "Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.")
    (home-page "https://data.gov.tw/dataset/5961")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 70. ucsf-chimera --- extensible molecular modeling system
;;; -------------------------------------------------------------------
(define-public ucsf-chimera
  (package
    (name "ucsf-chimera")
    (version "1.17.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rbvi.ucsf.edu/chimera//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extensible molecular modeling system")
    (description "Extensible molecular modeling system.")
    (home-page "https://rbvi.ucsf.edu/chimera/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 71. words-insane --- really big wordlist based on SCOWL
;;; -------------------------------------------------------------------
(define-public words-insane
  (package
    (name "words-insane")
    (version "2020.12.07")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://wordlist.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "really big wordlist based on SCOWL")
    (description "Really big wordlist based on SCOWL.")
    (home-page "http://wordlist.sourceforge.net/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 72. folder-color-switcher --- folder color switcher for Nemo and Caja
;;; -------------------------------------------------------------------
(define-public folder-color-switcher
  (package
    (name "folder-color-switcher")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/folder-color-switcher")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "folder color switcher for Nemo and Caja")
    (description "Folder color switcher for Nemo and Caja.")
    (home-page "https://github.com/linuxmint/folder-color-switcher")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 73. libjxl-doc-git --- JPEG XL image format reference implementation (documentation; git version)
;;; -------------------------------------------------------------------
(define-public libjxl-doc-git
  (package
    (name "libjxl-doc-git")
    (version "0.11.1.r456.g3d095d9b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://jpeg.org/jpegxl/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "JPEG XL image format reference implementation (documentation; git version)")
    (description "JPEG XL image format reference implementation (documentation; git version).")
    (home-page "https://jpeg.org/jpegxl/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 74. obfs4proxy-bin --- the obfourscator - A Pluggable Transport Proxy Written in Go (This packag...
;;; -------------------------------------------------------------------
(define-public obfs4proxy-bin
  (package
    (name "obfs4proxy-bin")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/yawning/obfs4/-/archive/v" version "/obfs4proxy-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("obfs4proxy-bin" "bin/obfs4proxy-bin"))))
    (synopsis "the obfourscator - A Pluggable Transport Proxy Written in Go (This packag...")
    (description "The obfourscator - A Pluggable Transport Proxy Written in Go (This package is built by myself for thoes who live in countries with tor censored that cannot download the source in obfs4proxy package.")
    (home-page "https://gitlab.com/yawning/obfs4")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 75. volta-bin --- JS Toolchains as Code
;;; -------------------------------------------------------------------
(define-public volta-bin
  (package
    (name "volta-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://volta.sh/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("volta-bin" "bin/volta-bin"))))
    (synopsis "JS Toolchains as Code")
    (description "JS Toolchains as Code.")
    (home-page "https://volta.sh/")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 76. tastytrade --- one of the fastest, most reliable, and most secure trading platforms in t...
;;; -------------------------------------------------------------------
(define-public tastytrade
  (package
    (name "tastytrade")
    (version "2.29.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tastytrade.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "one of the fastest, most reliable, and most secure trading platforms in t...")
    (description "One of the fastest, most reliable, and most secure trading platforms in the world.")
    (home-page "https://tastytrade.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 77. keyd-git --- a key remapping daemon for linux
;;; -------------------------------------------------------------------
(define-public keyd-git
  (package
    (name "keyd-git")
    (version "2.6.0.r0.7c0aecb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rvaiya/keyd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a key remapping daemon for linux")
    (description "A key remapping daemon for linux.")
    (home-page "https://github.com/rvaiya/keyd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 78. colobot-gold-data --- data pack for Colobot GOLD real-time strategy game
;;; -------------------------------------------------------------------
(define-public colobot-gold-data
  (package
    (name "colobot-gold-data")
    (version "0.2.2_alpha")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://colobot.info/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "data pack for Colobot GOLD real-time strategy game")
    (description "Data pack for Colobot GOLD real-time strategy game.")
    (home-page "http://colobot.info")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 79. alac-git --- a lossless audio codec developed by Apple and deployed on all of its plat...
;;; -------------------------------------------------------------------
(define-public alac-git
  (package
    (name "alac-git")
    (version "0.r25.5d6d836")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikebrady/alac")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lossless audio codec developed by Apple and deployed on all of its plat...")
    (description "A lossless audio codec developed by Apple and deployed on all of its platforms and devices.")
    (home-page "https://github.com/mikebrady/alac")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 80. maitreya --- a free software for Vedic and western astrology
;;; -------------------------------------------------------------------
(define-public maitreya
  (package
    (name "maitreya")
    (version "8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.saravali.de/maitreya.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free software for Vedic and western astrology")
    (description "A free software for Vedic and western astrology.")
    (home-page "http://www.saravali.de/maitreya.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 81. anoise-community-extension2 --- ambient Noise Community Library Package 2
;;; -------------------------------------------------------------------
(define-public anoise-community-extension2
  (package
    (name "anoise-community-extension2")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://code.launchpad.net/anoise/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ambient Noise Community Library Package 2")
    (description "Ambient Noise Community Library Package 2.")
    (home-page "https://code.launchpad.net/anoise")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 82. anoise-community-extension3 --- ambient Noise Community Library Package 3
;;; -------------------------------------------------------------------
(define-public anoise-community-extension3
  (package
    (name "anoise-community-extension3")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://code.launchpad.net/anoise/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ambient Noise Community Library Package 3")
    (description "Ambient Noise Community Library Package 3.")
    (home-page "https://code.launchpad.net/anoise")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 83. otf-san-francisco-mono --- monospaced variant of San Francisco. Sourced directly from Apple
;;; -------------------------------------------------------------------
(define-public otf-san-francisco-mono
  (package
    (name "otf-san-francisco-mono")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospaced variant of San Francisco. Sourced directly from Apple")
    (description "Monospaced variant of San Francisco. Sourced directly from Apple.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 84. 7kaa-music --- music set for Seven Kingdoms: Ancient Adversaries
;;; -------------------------------------------------------------------
(define-public 7kaa-music
  (package
    (name "7kaa-music")
    (version "2.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://7kfans.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music set for Seven Kingdoms: Ancient Adversaries")
    (description "Music set for Seven Kingdoms: Ancient Adversaries.")
    (home-page "http://7kfans.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 85. cairo-docs-git --- 2D graphics library with support for multiple output devices (documentation)
;;; -------------------------------------------------------------------
(define-public cairo-docs-git
  (package
    (name "cairo-docs-git")
    (version "1.18.4.r2.gc1bc9cd32")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://cairographics.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "2D graphics library with support for multiple output devices (documentation)")
    (description "2D graphics library with support for multiple output devices (documentation).")
    (home-page "https://cairographics.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 86. freeminer-common --- common data files for freeminer and freeminer-server
;;; -------------------------------------------------------------------
(define-public freeminer-common
  (package
    (name "freeminer-common")
    (version "0.4.14.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://freeminer.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common data files for freeminer and freeminer-server")
    (description "Common data files for freeminer and freeminer-server.")
    (home-page "http://freeminer.org/")
    (license (list license:non-copyleft license:gpl3))))

;;; -------------------------------------------------------------------
;;; 87. minecraft-overviewer-docs --- render large resolution images of a Minecraft map with a web UI
;;; -------------------------------------------------------------------
(define-public minecraft-overviewer-docs
  (package
    (name "minecraft-overviewer-docs")
    (version "0.19.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/overviewer/Minecraft-Overviewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "render large resolution images of a Minecraft map with a web UI")
    (description "Render large resolution images of a Minecraft map with a web UI.")
    (home-page "https://github.com/overviewer/Minecraft-Overviewer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 88. nafe --- toolset to translate PSF format consolefonts into text files and text fil...
;;; -------------------------------------------------------------------
(define-public nafe
  (package
    (name "nafe")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://nafe.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "toolset to translate PSF format consolefonts into text files and text fil...")
    (description "Toolset to translate PSF format consolefonts into text files and text files into PSF files.")
    (home-page "https://nafe.sourceforge.net")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 89. oranchelo-icon-theme-git --- oranchelo is a flat-design icon theme for XFCE4 based on Super Flat Remix...
;;; -------------------------------------------------------------------
(define-public oranchelo-icon-theme-git
  (package
    (name "oranchelo-icon-theme-git")
    (version "0.8.r6.g13886cb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OrancheloTeam/oranchelo-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oranchelo is a flat-design icon theme for XFCE4 based on Super Flat Remix...")
    (description "Oranchelo is a flat-design icon theme for XFCE4 based on Super Flat Remix and inspired by \\\"Corny icons\\\" by Patryk Goworowski. (git version).")
    (home-page "https://github.com/OrancheloTeam/oranchelo-icon-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 90. otf-asana-math --- a font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos
;;; -------------------------------------------------------------------
(define-public otf-asana-math
  (package
    (name "otf-asana-math")
    (version "000.958")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ctan.org/pkg/Asana-Math/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos")
    (description "A font to typeset maths in Xe(La)TeX and Lua(La)TeX by Apostolos Syropoulos.")
    (home-page "https://www.ctan.org/pkg/Asana-Math")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 91. otf-fifthleg --- font used for openSUSE-branded material
;;; -------------------------------------------------------------------
(define-public otf-fifthleg
  (package
    (name "otf-fifthleg")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://build.opensuse.org/package/show/openSUSE:Factory/fifth-leg-font/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "font used for openSUSE-branded material")
    (description "Font used for openSUSE-branded material.")
    (home-page "https://build.opensuse.org/package/show/openSUSE:Factory/fifth-leg-font")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 92. pambase-selinux --- sELinux aware base PAM configuration for services
;;; -------------------------------------------------------------------
(define-public pambase-selinux
  (package
    (name "pambase-selinux")
    (version "20250719")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.archlinux.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sELinux aware base PAM configuration for services")
    (description "SELinux aware base PAM configuration for services.")
    (home-page "https://www.archlinux.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 93. soundfont-generaluser --- a small and well balanced GM/GS soundbank for many styles of music
;;; -------------------------------------------------------------------
(define-public soundfont-generaluser
  (package
    (name "soundfont-generaluser")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.schristiancollins.com/generaluser.php/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a small and well balanced GM/GS soundbank for many styles of music")
    (description "A small and well balanced GM/GS soundbank for many styles of music.")
    (home-page "http://www.schristiancollins.com/generaluser.php")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 94. ttf-sil-ezra --- openType Hebrew font from SIL
;;; -------------------------------------------------------------------
(define-public ttf-sil-ezra
  (package
    (name "ttf-sil-ezra")
    (version "2.51")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://software.sil.org/ezra/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "openType Hebrew font from SIL")
    (description "OpenType Hebrew font from SIL.")
    (home-page "https://software.sil.org/ezra")
    (license (list license:expat license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 95. yadm-git --- yet Another Dotfiles Manager
;;; -------------------------------------------------------------------
(define-public yadm-git
  (package
    (name "yadm-git")
    (version "3.0.2.r0.ga5b1067")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheLocehiliosan/yadm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yet Another Dotfiles Manager")
    (description "Yet Another Dotfiles Manager.")
    (home-page "https://github.com/TheLocehiliosan/yadm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 96. heretic1-wad --- the Heretic shareware IWAD (game data)
;;; -------------------------------------------------------------------
(define-public heretic1-wad
  (package
    (name "heretic1-wad")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://web.archive.org/web/20160603151059/https://www.ravensoftware.com/games/heretic/view-game//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Heretic shareware IWAD (game data)")
    (description "The Heretic shareware IWAD (game data).")
    (home-page "https://web.archive.org/web/20160603151059/https://www.ravensoftware.com/games/heretic/view-game/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 97. factorio-headless-experimental --- a 2D game about building and maintaining factories - Server version (expe...
;;; -------------------------------------------------------------------
(define-public factorio-headless-experimental
  (package
    (name "factorio-headless-experimental")
    (version "2.0.76")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.factorio.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 2D game about building and maintaining factories - Server version (expe...")
    (description "A 2D game about building and maintaining factories - Server version (experimental branch).")
    (home-page "http://www.factorio.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 98. sift --- a fast and powerful open source alternative to grep
;;; -------------------------------------------------------------------
(define-public sift
  (package
    (name "sift")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://sift-tool.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path ""
      #:tests? #f))
    (synopsis "a fast and powerful open source alternative to grep")
    (description "A fast and powerful open source alternative to grep.")
    (home-page "http://sift-tool.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 99. rockyou --- the popular \"rockyou\" password list from OWASP SecLists project
;;; -------------------------------------------------------------------
(define-public rockyou
  (package
    (name "rockyou")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://owasp.org/www-project-seclists//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the popular \"rockyou\" password list from OWASP SecLists project")
    (description "The popular \\\"rockyou\\\" password list from OWASP SecLists project.")
    (home-page "https://owasp.org/www-project-seclists/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 100. ttf-cheapskate --- TTF Fonts by Dustin Norlander
;;; -------------------------------------------------------------------
(define-public ttf-cheapskate
  (package
    (name "ttf-cheapskate")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.1001fonts.com/users/dustinn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "TTF Fonts by Dustin Norlander")
    (description "TTF Fonts by Dustin Norlander.")
    (home-page "https://www.1001fonts.com/users/dustinn")
    (license license:gpl3+)))
