;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424r
;;; Resolves 99 packages from TODO queue.
;;; 1 packages blocked.
;;;
;;; New recipes (99):
;;;        1.  bililive-recorder-bin (#3014, copy-build-system, v2.17.3, GPL3)
;;;        2.  mas (#3025, gnu-build-system, v1.42b300, GPL-2.0-only)
;;;        3.  solv-bin (#4422, copy-build-system, v0.18.2, MIT)
;;;        4.  sticker-convert (#4467, gnu-build-system, v2.20.0.0, GPLv2)
;;;        5.  notwaita-cursor-theme (#7764, gnu-build-system, v1.0.0_alpha1, LGPL-3.0-only)
;;;        6.  gyr-bin (#8259, copy-build-system, v0.1.5, BSD-2-Clause)
;;;        7.  rres-bin (#8260, copy-build-system, v0.1.5, GPLv3)
;;;        8.  sqly-bin (#8264, copy-build-system, v0.15.0, Apache-2.0)
;;;        9.  pingme-bin (#8273, copy-build-system, v0.2.6, MIT)
;;;       10.  gup-bin (#8275, copy-build-system, v1.1.4, Apache-2.0)
;;;       11.  youtubedr-bin (#8310, copy-build-system, v2.10.6, MIT)
;;;       12.  ssh2incus-bin (#8317, copy-build-system, v0.10, GPL-3.0-only)
;;;       13.  mockoon-bin (#8322, copy-build-system, v9.6.1, MIT)
;;;       14.  shaka-packager-bin (#8324, copy-build-system, v3.7.0, BSD-3-Clause)
;;;       15.  xiaomitool-v2 (#8353, gnu-build-system, v20.7.28, custom)
;;;       16.  cmake3-bin (#8396, copy-build-system, v3.31.6, custom)
;;;       17.  syncthing-bin (#10281, copy-build-system, v2.0.16, MPL2)
;;;       18.  torrra-bin (#10939, copy-build-system, v2.0.6, MIT)
;;;       19.  ttf-wps-fonts (#10956, font-build-system, v2.0, custom:eula)
;;;       20.  reshell-bin (#10963, copy-build-system, v0.1.0_1544, Apache-2.0)
;;;       21.  easytier-bin (#10964, copy-build-system, v2.6.1, Apache License 2.0)
;;;       22.  bdf-unifont (#10990, gnu-build-system, v17.0.03, custom, GPL2)
;;;       23.  ytui-bin (#11008, copy-build-system, v1.0.1, MIT)
;;;       24.  clang-format-static-bin (#11011, copy-build-system, v15.2da3e7b, Unlicense)
;;;       25.  lwtools (#11016, gnu-build-system, v4.24, GPL3)
;;;       26.  quickserv-bin (#11050, copy-build-system, v1667356893:0.3.0, MIT)
;;;       27.  activitywatch-bin (#11072, copy-build-system, v0.13.2, MPL2)
;;;       28.  flaca-bin (#11095, copy-build-system, v3.6.2, WTFPL)
;;;       29.  f2-bin (#11106, copy-build-system, v2.2.2, MIT)
;;;       30.  codename-goose-bin (#11141, copy-build-system, v1.32.0, Apache-2.0)
;;;       31.  nfpm-bin (#11142, copy-build-system, v2.46.3, MIT)
;;;       32.  phinger-cursors (#11150, gnu-build-system, v2.1, CC-BY-SA-4.0)
;;;       33.  zswap-disable-writeback (#11167, gnu-build-system, v1, 0BSD)
;;;       34.  termpicker-bin (#11221, copy-build-system, v1.5.1, beerware)
;;;       35.  filebeat-bin (#11229, copy-build-system, v9.2.3, custom:Elastic)
;;;       36.  zenta-bin (#11233, copy-build-system, v1.1.0, MIT)
;;;       37.  mingw-w64-environment (#11244, gnu-build-system, v1, BSD)
;;;       38.  maplemono-cn-unhinted (#11253, gnu-build-system, v7.9, OFL-1.1)
;;;       39.  maplemono-cn (#11254, gnu-build-system, v7.9, OFL-1.1)
;;;       40.  maplemono-nf-cn-unhinted (#11255, gnu-build-system, v7.9, OFL-1.1)
;;;       41.  maplemono-nf-cn (#11256, gnu-build-system, v7.9, OFL-1.1)
;;;       42.  maplemono-nf-unhinted (#11257, gnu-build-system, v7.9, OFL-1.1)
;;;       43.  maplemono-nf (#11258, gnu-build-system, v7.9, OFL-1.1)
;;;       44.  maplemono-otf (#11259, gnu-build-system, v7.9, OFL-1.1)
;;;       45.  maplemono-ttf-autohint (#11260, gnu-build-system, v7.9, OFL-1.1)
;;;       46.  maplemono-ttf (#11261, gnu-build-system, v7.9, OFL-1.1)
;;;       47.  ttf-signika (#11282, font-build-system, v2.003, OFL-1.1-no-RFN)
;;;       48.  ttf-merriweather-sans (#11290, font-build-system, v2.001, OFL-1.1-RFN)
;;;       49.  ttf-merriweather (#11292, font-build-system, v1:2.100, custom:SIL Open Font License v1.1)
;;;       50.  ttf-quintessential (#11294, font-build-system, v1.001, custom:SIL Open Font License v1.1)
;;;       51.  ttf-rubik-vf (#11540, font-build-system, v2.3.0, OFL)
;;;       52.  witr-bin (#11613, copy-build-system, v0.3.1, Apache-2.0)
;;;       53.  ttf-material-icons-git (#11625, font-build-system, v4.0.0.r119.gc51274e9, Apache-2.0)
;;;       54.  ttf-material-symbols-variable-git (#11626, font-build-system, v4.0.0.r119.gc51274e9, Apache-2.0)
;;;       55.  wifitui-bin (#11716, copy-build-system, v0.10.0, MIT)
;;;       56.  v2rayn-bin (#11751, copy-build-system, v7.20.4, GPL3)
;;;       57.  lavat-git (#11754, gnu-build-system, v1:r13.5d2629c, MIT)
;;;       58.  ttf-readex-pro (#11774, font-build-system, v1.204, OFL-1.1-RFN)
;;;       59.  ttf-readex-pro-variable (#11775, font-build-system, v1.204, OFL-1.1-RFN)
;;;       60.  samsung-unified-driver-common (#11784, gnu-build-system, v1.00.39, custom:samsung)
;;;       61.  mongoclock (#11808, gnu-build-system, v3.1.6, custom:ISC)
;;;       62.  ast-firmware (#11841, gnu-build-system, v501, custom)
;;;       63.  spout2pw-bin (#11848, copy-build-system, v0.2.3, LGPL-2.1-only)
;;;       64.  scarlett4-firmware (#11850, gnu-build-system, v1:1.0, custom:Focusrite)
;;;       65.  ttf-mononoki (#12252, font-build-system, v1.6, custom:OFL)
;;;       66.  ttf-recursive (#12263, font-build-system, v1.085, OFL)
;;;       67.  piperig-bin (#12405, copy-build-system, v0.4.1, MIT)
;;;       68.  airwindows-consolidated-bin (#12502, copy-build-system, v2026.04.19.7f5a66c, GPL3)
;;;       69.  taws-bin (#13260, copy-build-system, v1.2.1, MIT)
;;;       70.  magiskboot-bin (#13286, copy-build-system, v30.7, GPL-3.0)
;;;       71.  ttf-iosevka (#13322, font-build-system, v34.4.0, OFL)
;;;       72.  portal-bin (#13399, copy-build-system, v1.2.3, MIT)
;;;       73.  yandex-cloud-cli-bin (#13405, copy-build-system, v1.3.0, unknown)
;;;       74.  wasm-pack-bin (#13413, copy-build-system, v0.14.0, Apache-2.0, MIT)
;;;       75.  ssh-dashboard-bin (#13424, copy-build-system, v0.0.9, MIT)
;;;       76.  lstf-bin (#13463, copy-build-system, v0.7.2, Apache-2.0)
;;;       77.  filecraft-cli-bin (#13485, copy-build-system, v1.1.0, MIT)
;;;       78.  drift-bin (#13488, copy-build-system, v1.0.1, MIT)
;;;       79.  org-stats-bin (#13588, copy-build-system, v1.12.2, MIT)
;;;       80.  waitup-bin (#13599, copy-build-system, v0.4.3, MIT)
;;;       81.  riffdiff-bin (#13609, copy-build-system, v3.6.1, MIT)
;;;       82.  packrinth-bin (#13635, copy-build-system, v0.8.3, MIT)
;;;       83.  hcledit-bin (#13659, copy-build-system, v0.2.17, MIT)
;;;       84.  slick-bin (#13662, copy-build-system, v0.0.19, BSD-2-Clause)
;;;       85.  pokesay-bin (#13688, copy-build-system, v0.18.3, BSD-3-Clause)
;;;       86.  glab-component-generator-bin (#13695, copy-build-system, v0.10.0, MIT)
;;;       87.  ratatui-docs (#14149, gnu-build-system, v0.29.0, MIT)
;;;       88.  mult-bin (#14150, copy-build-system, v0.3.0, MIT)
;;;       89.  snapsr-bin (#14165, copy-build-system, v0.0.1, MIT)
;;;       90.  ktlint-compose-rules (#14186, gnu-build-system, v0.5.7, Apache-2.0)
;;;       91.  gophertube-bin (#14197, copy-build-system, v2.8.2, GPL-3.0-only)
;;;       92.  ardopcf-bin (#14206, copy-build-system, v1.0.4.1.3, MIT)
;;;       93.  arashi-icon-theme (#14207, gnu-build-system, v25.10, CC-BY-4.0)
;;;       94.  gh-dash-bin (#14230, copy-build-system, v4.23.2, MIT)
;;;       95.  mite (#14484, gnu-build-system, v1.4.3, MIT)
;;;       96.  goose-bin (#14515, copy-build-system, v3.27.0, MIT)
;;;       97.  gost-v3-bin (#14534, copy-build-system, v3.2.7.20251122, MIT)
;;;       98.  codellm (#14544, gnu-build-system, v1.101.23707, custom)
;;;       99.  ttf-miracode (#14791, font-build-system, v1.0, OFL-1.1)
;;;
;;; BLOCKED (1):
;;;        1.  huawei-me936-udev (#11204) -- SOURCE_UNAVAILABLE: no upstream URL in AUR metadata

(define-module (gaurix packages recipe-resolver-260424r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
)


;; Helper for nonfree/custom licenses
(define (nonfree uri)
  (license:license "nonfree" uri
    "This is a nonfree license."))


(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.17.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Bililive/BililiveRecorder/releases/download/v2.17.3/bililive-recorder-bin-2.17.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bililive-recorder-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制")
    (description "B站录播姬 | BiliBili Stream Recorder | 哔哩哔哩直播录制.")
    (home-page "https://github.com/Bililive/BililiveRecorder")
    (license license:gpl3)))

(define-public mas
  (package
    (name "mas")
    (version "1.42b300")
    (source (origin
              (method url-fetch)
              (uri "http://john.ccac.rwth-aachen.de:8000/as/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "macro cross-assembler (asl) for various processors and microcontrollers")
    (description "Macro cross-assembler (asl) for various processors and microcontrollers.")
    (home-page "http://john.ccac.rwth-aachen.de:8000/as/")
    (license license:gpl2)))

(define-public solv-bin
  (package
    (name "solv-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/aegoroff/solv/releases/download/v0.18.2/solv-bin-0.18.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/solv-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sOLution Validation tool that analyzes Microsoft Visual Studio solutions (b...")
    (description "SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release).")
    (home-page "https://github.com/aegoroff/solv")
    (license license:expat)))

(define-public sticker-convert
  (package
    (name "sticker-convert")
    (version "2.20.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/laggykiller/sticker-convert")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao...")
    (description "Convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage. Written in Python.")
    (home-page "https://github.com/laggykiller/sticker-convert")
    (license license:gpl2)))

(define-public notwaita-cursor-theme
  (package
    (name "notwaita-cursor-theme")
    (version "1.0.0_alpha1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ful1e5/notwaita-cursor")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A cursor theme inspired by the Adwaita icons from the GNOME Project for Win...")
    (description "A cursor theme inspired by the Adwaita icons from the GNOME Project for Windows and Linux with HiDPI support.")
    (home-page "https://github.com/ful1e5/notwaita-cursor")
    (license license:lgpl3)))

(define-public gyr-bin
  (package
    (name "gyr-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://sr.ht/~nkeor/gyr")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gyr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version)")
    (description "Blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version).")
    (home-page "https://sr.ht/~nkeor/gyr")
    (license license:bsd-2)))

(define-public rres-bin
  (package
    (name "rres-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://sr.ht/~nkeor/rres")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/rres-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A xrandr replacement to gather display resolutions")
    (description "A xrandr replacement to gather display resolutions.")
    (home-page "https://sr.ht/~nkeor/rres")
    (license license:gpl3)))

(define-public sqly-bin
  (package
    (name "sqly-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nao1215/sqly/releases/download/v0.15.0/sqly-bin-0.15.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sqly-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "eaisly execute SQL against CSV/TSV/LTSV/JSON and Microsoft Excel™ with shell")
    (description "Eaisly execute SQL against CSV/TSV/LTSV/JSON and Microsoft Excel™ with shell.")
    (home-page "https://github.com/nao1215/sqly")
    (license license:asl2.0)))

(define-public pingme-bin
  (package
    (name "pingme-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://pingme.lmno.pk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pingme-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pingMe is a CLI tool which provides the ability to send messages or alerts ...")
    (description "PingMe is a CLI tool which provides the ability to send messages or alerts to multiple messaging platforms & email (official binary).")
    (home-page "https://pingme.lmno.pk")
    (license license:expat)))

(define-public gup-bin
  (package
    (name "gup-bin")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nao1215/gup/releases/download/v1.1.4/gup-bin-1.1.4-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gup-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "update binaries installed by "go install" with goroutines")
    (description "Update binaries installed by \"go install\" with goroutines.")
    (home-page "https://github.com/nao1215/gup")
    (license license:asl2.0)))

(define-public youtubedr-bin
  (package
    (name "youtubedr-bin")
    (version "2.10.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kkdai/youtube/releases/download/v2.10.6/youtubedr-bin-2.10.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/youtubedr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "download YouTube videos")
    (description "Download YouTube videos.")
    (home-page "https://github.com/kkdai/youtube")
    (license license:expat)))

(define-public ssh2incus-bin
  (package
    (name "ssh2incus-bin")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri "https://ssh2incus.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ssh2incus-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SSH server for Incus instances")
    (description "SSH server for Incus instances.")
    (home-page "https://ssh2incus.com/")
    (license license:gpl3)))

(define-public mockoon-bin
  (package
    (name "mockoon-bin")
    (version "9.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://mockoon.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mockoon-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mockoon is the easiest and quickest way to run mock APIs locally")
    (description "Mockoon is the easiest and quickest way to run mock APIs locally.")
    (home-page "https://mockoon.com/")
    (license license:expat)))

(define-public shaka-packager-bin
  (package
    (name "shaka-packager-bin")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/shaka-project/shaka-packager/releases/download/v3.7.0/shaka-packager-bin-3.7.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/shaka-packager-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool and a media packaging SDK for DASH and HLS packaging and encryption")
    (description "A tool and a media packaging SDK for DASH and HLS packaging and encryption.")
    (home-page "https://github.com/shaka-project/shaka-packager")
    (license license:bsd-3)))

(define-public xiaomitool-v2
  (package
    (name "xiaomitool-v2")
    (version "20.7.28")
    (source (origin
              (method url-fetch)
              (uri "https://www.xiaomitool.com/V2/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modding of Xiaomi devices made easy for everyone")
    (description "Modding of Xiaomi devices made easy for everyone.")
    (home-page "https://www.xiaomitool.com/V2/")
    (license (license:nonfree "custom"))))

(define-public cmake3-bin
  (package
    (name "cmake3-bin")
    (version "3.31.6")
    (source (origin
              (method url-fetch)
              (uri "https://cmake.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cmake3-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform open-source make system")
    (description "A cross-platform open-source make system.")
    (home-page "https://cmake.org")
    (license (license:nonfree "custom"))))

(define-public syncthing-bin
  (package
    (name "syncthing-bin")
    (version "2.0.16")
    (source (origin
              (method url-fetch)
              (uri "https://syncthing.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/syncthing-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open Source Continuous Replication / Cluster Synchronization Thing: binary")
    (description "Open Source Continuous Replication / Cluster Synchronization Thing: binary.")
    (home-page "https://syncthing.net/")
    (license license:mpl2.0)))

(define-public torrra-bin
  (package
    (name "torrra-bin")
    (version "2.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/stabldev/torrra/releases/download/v2.0.6/torrra-bin-2.0.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/torrra-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Python tool that lets you find and download torrents without leaving your...")
    (description "A Python tool that lets you find and download torrents without leaving your CLI.")
    (home-page "https://github.com/stabldev/torrra")
    (license license:expat)))

(define-public ttf-wps-fonts
  (package
    (name "ttf-wps-fonts")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ferion11/ttf-wps-fonts")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "symbol fonts required by wps-office")
    (description "Symbol fonts required by wps-office.")
    (home-page "https://github.com/ferion11/ttf-wps-fonts")
    (license (license:nonfree "custom:eula"))))

(define-public reshell-bin
  (package
    (name "reshell-bin")
    (version "0.1.0_1544")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ClementNerma/ReShell/releases/download/v0.1.0_1544/reshell-bin-0.1.0_1544-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/reshell-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A modern shell for the future")
    (description "A modern shell for the future.")
    (home-page "https://github.com/ClementNerma/ReShell")
    (license license:asl2.0)))

(define-public easytier-bin
  (package
    (name "easytier-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/EasyTier/EasyTier/releases/download/v2.6.1/easytier-bin-2.6.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/easytier-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "由Rust和Tokio驱动，一个简单、安全、去中心化的内网穿透VPN组网方案")
    (description "由Rust和Tokio驱动，一个简单、安全、去中心化的内网穿透VPN组网方案.")
    (home-page "https://github.com/EasyTier/EasyTier")
    (license license:asl2.0)))

(define-public bdf-unifont
  (package
    (name "bdf-unifont")
    (version "17.0.03")
    (source (origin
              (method url-fetch)
              (uri "https://ftp.gnu.org/gnu/unifont")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNU Unifont Glyphs")
    (description "GNU Unifont Glyphs.")
    (home-page "https://ftp.gnu.org/gnu/unifont")
    (license (list (license:nonfree "custom") license:gpl2))))

(define-public ytui-bin
  (package
    (name "ytui-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/banh-canh/ytui/releases/download/v1.0.1/ytui-bin-1.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ytui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ytui is a TUI tool that allows users to query videos on youtube and play th...")
    (description "Ytui is a TUI tool that allows users to query videos on youtube and play them in their local player.")
    (home-page "https://github.com/banh-canh/ytui")
    (license license:expat)))

(define-public clang-format-static-bin
  (package
    (name "clang-format-static-bin")
    (version "15.2da3e7b")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/muttleyxd/clang-tools-static-binaries/releases/download/v15.2da3e7b/clang-format-static-bin-15.2da3e7b-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clang-format-static-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "clang-format x86_64 static binaries (3.9, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12....")
    (description "Clang-format x86_64 static binaries (3.9, 4, 5, 6, 7, 8, 9, 10, 11, 12, 12.0.1, 13, 14, 15, 16, 17, 18, 19, 20).")
    (home-page "https://github.com/muttleyxd/clang-tools-static-binaries")
    (license license:unlicense)))

(define-public lwtools
  (package
    (name "lwtools")
    (version "4.24")
    (source (origin
              (method url-fetch)
              (uri "http://www.lwtools.ca/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors")
    (description "Cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors.")
    (home-page "http://www.lwtools.ca/")
    (license license:gpl3)))

(define-public quickserv-bin
  (package
    (name "quickserv-bin")
    (version "1667356893:0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jstrieb/quickserv/releases/download/v1667356893:0.3.0/quickserv-bin-1667356893:0.3.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/quickserv-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "dangerously user-friendly web server for quick prototyping and hackathons")
    (description "Dangerously user-friendly web server for quick prototyping and hackathons.")
    (home-page "https://github.com/jstrieb/quickserv")
    (license license:expat)))

(define-public activitywatch-bin
  (package
    (name "activitywatch-bin")
    (version "0.13.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ActivityWatch/activitywatch/releases/download/v0.13.2/activitywatch-bin-0.13.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/activitywatch-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "track how you spend time on your computer. Simple, extensible, no third par...")
    (description "Track how you spend time on your computer. Simple, extensible, no third parties.")
    (home-page "https://github.com/ActivityWatch/activitywatch")
    (license license:mpl2.0)))

(define-public flaca-bin
  (package
    (name "flaca-bin")
    (version "3.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Blobfolio/flaca/releases/download/v3.6.2/flaca-bin-3.6.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/flaca-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lossless GIF, JPEG and PNG optimizer, written in Rust")
    (description "Lossless GIF, JPEG and PNG optimizer, written in Rust.")
    (home-page "https://github.com/Blobfolio/flaca")
    (license license:wtfpl2)))

(define-public f2-bin
  (package
    (name "f2-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ayoisaiah/f2/releases/download/v2.2.2/f2-bin-2.2.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/f2-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform command-line tool for batch renaming files and directories q...")
    (description "Cross-platform command-line tool for batch renaming files and directories quickly and safely.")
    (home-page "https://github.com/ayoisaiah/f2")
    (license license:expat)))

(define-public codename-goose-bin
  (package
    (name "codename-goose-bin")
    (version "1.32.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/aaif-goose/goose/releases/download/v1.32.0/codename-goose-bin-1.32.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/codename-goose-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open-source, extensible AI agent that goes beyond code suggestions - ins...")
    (description "An open-source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM.")
    (home-page "https://github.com/aaif-goose/goose")
    (license license:asl2.0)))

(define-public nfpm-bin
  (package
    (name "nfpm-bin")
    (version "2.46.3")
    (source (origin
              (method url-fetch)
              (uri "https://nfpm.goreleaser.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nfpm-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "nFPM is Not FPM - a simple deb, rpm, apk, ipk, and arch linux packager writ...")
    (description "NFPM is Not FPM - a simple deb, rpm, apk, ipk, and arch linux packager written in Go.")
    (home-page "https://nfpm.goreleaser.com")
    (license license:expat)))

(define-public phinger-cursors
  (package
    (name "phinger-cursors")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/phisch/phinger-cursors")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "most likely the most over-engineered cursor theme")
    (description "Most likely the most over-engineered cursor theme.")
    (home-page "https://github.com/phisch/phinger-cursors")
    (license license:cc-by-sa4.0)))

(define-public zswap-disable-writeback
  (package
    (name "zswap-disable-writeback")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/zswap-disable-writeback")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "disable zswap writeback using systemd cgroup configuration")
    (description "Disable zswap writeback using systemd cgroup configuration.")
    (home-page "https://aur.archlinux.org/packages/zswap-disable-writeback")
    (license license:bsd-0)))

(define-public termpicker-bin
  (package
    (name "termpicker-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ChausseBenjamin/termpicker/releases/download/v1.5.1/termpicker-bin-1.5.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/termpicker-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A color picker for the terminal")
    (description "A color picker for the terminal.")
    (home-page "https://github.com/ChausseBenjamin/termpicker")
    (license (license:nonfree "beerware"))))

(define-public filebeat-bin
  (package
    (name "filebeat-bin")
    (version "9.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.elastic.co/beats/filebeat")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/filebeat-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "filebeat sends log files to Logstash or directly to Elasticsearch")
    (description "Filebeat sends log files to Logstash or directly to Elasticsearch.")
    (home-page "https://www.elastic.co/beats/filebeat")
    (license (license:nonfree "custom:Elastic"))))

(define-public zenta-bin
  (package
    (name "zenta-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/e6a5/zenta/releases/download/v1.1.0/zenta-bin-1.1.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zenta-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mindfulness for terminal users")
    (description "Mindfulness for terminal users.")
    (home-page "https://github.com/e6a5/zenta")
    (license license:expat)))

(define-public mingw-w64-environment
  (package
    (name "mingw-w64-environment")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "http://fedoraproject.org/wiki/MinGW")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "script providing common environment variables and functions for MinGW (ming...")
    (description "Script providing common environment variables and functions for MinGW (mingw-w64).")
    (home-page "http://fedoraproject.org/wiki/MinGW")
    (license license:bsd-3)))

(define-public maplemono-cn-unhinted
  (package
    (name "maplemono-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-cn
  (package
    (name "maplemono-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-nf-cn-unhinted
  (package
    (name "maplemono-nf-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-nf-cn
  (package
    (name "maplemono-nf-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-nf-unhinted
  (package
    (name "maplemono-nf-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-nf
  (package
    (name "maplemono-nf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-otf
  (package
    (name "maplemono-otf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-ttf-autohint
  (package
    (name "maplemono-ttf-autohint")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemono-ttf
  (package
    (name "maplemono-ttf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public ttf-signika
  (package
    (name "ttf-signika")
    (version "2.003")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/googlefonts/Signika")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "sans-serif typeface from Google by Anna Giedryś")
    (description "Sans-serif typeface from Google by Anna Giedryś.")
    (home-page "https://github.com/googlefonts/Signika")
    (license (license:nonfree "OFL-1.1-no-RFN"))))

(define-public ttf-merriweather-sans
  (package
    (name "ttf-merriweather-sans")
    (version "2.001")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SorkinType/Merriweather-Sans")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "A sans-serif typeface that is pleasant to read on screens by Sorkin Type Co")
    (description "A sans-serif typeface that is pleasant to read on screens by Sorkin Type Co.")
    (home-page "https://github.com/SorkinType/Merriweather-Sans")
    (license (license:nonfree "OFL-1.1-RFN"))))

(define-public ttf-merriweather
  (package
    (name "ttf-merriweather")
    (version "1:2.100")
    (source (origin
              (method url-fetch)
              (uri "http://sorkintype.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "A typeface that is pleasant to read on screens by Sorkin Type Co")
    (description "A typeface that is pleasant to read on screens by Sorkin Type Co.")
    (home-page "http://sorkintype.com/")
    (license (license:nonfree "custom:SIL Open Font License v1.1"))))

(define-public ttf-quintessential
  (package
    (name "ttf-quintessential")
    (version "1.001")
    (source (origin
              (method url-fetch)
              (uri "https://fonts.google.com/specimen/Quintessential")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "calligraphic typeface from Google by Brian J. Bonislawsky")
    (description "Calligraphic typeface from Google by Brian J. Bonislawsky.")
    (home-page "https://fonts.google.com/specimen/Quintessential")
    (license (license:nonfree "custom:SIL Open Font License v1.1"))))

(define-public ttf-rubik-vf
  (package
    (name "ttf-rubik-vf")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/googlefonts/rubik")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "A sans serif font family with slightly rounded corners: variable font version")
    (description "A sans serif font family with slightly rounded corners: variable font version.")
    (home-page "https://github.com/googlefonts/rubik")
    (license license:silofl1.1)))

(define-public witr-bin
  (package
    (name "witr-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pranshuparmar/witr/releases/download/v0.3.1/witr-bin-0.3.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/witr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Linux CLI tool that explains the causal chain behind running processes")
    (description "A Linux CLI tool that explains the causal chain behind running processes.")
    (home-page "https://github.com/pranshuparmar/witr")
    (license license:asl2.0)))

(define-public ttf-material-icons-git
  (package
    (name "ttf-material-icons-git")
    (version "4.0.0.r119.gc51274e9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/material-design-icons")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "material Design icons by Google - classic fonts")
    (description "Material Design icons by Google - classic fonts.")
    (home-page "https://github.com/google/material-design-icons")
    (license license:asl2.0)))

(define-public ttf-material-symbols-variable-git
  (package
    (name "ttf-material-symbols-variable-git")
    (version "4.0.0.r119.gc51274e9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/material-design-icons")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "material Design icons by Google - variable fonts")
    (description "Material Design icons by Google - variable fonts.")
    (home-page "https://github.com/google/material-design-icons")
    (license license:asl2.0)))

(define-public wifitui-bin
  (package
    (name "wifitui-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/shazow/wifitui/releases/download/v0.10.0/wifitui-bin-0.10.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wifitui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast featureful friendly wifi terminal UI")
    (description "Fast featureful friendly wifi terminal UI.")
    (home-page "https://github.com/shazow/wifitui")
    (license license:expat)))

(define-public v2rayn-bin
  (package
    (name "v2rayn-bin")
    (version "7.20.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/2dust/v2rayN/releases/download/v7.20.4/v2rayn-bin-7.20.4-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/v2rayn-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A GUI client for Windows and Linux, support Xray core and others")
    (description "A GUI client for Windows and Linux, support Xray core and others.")
    (home-page "https://github.com/2dust/v2rayN")
    (license license:gpl3)))

(define-public lavat-git
  (package
    (name "lavat-git")
    (version "1:r13.5d2629c")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AngelJumbo/lavat.git")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "little program that simulates a lava lamp in the terminal")
    (description "Little program that simulates a lava lamp in the terminal.")
    (home-page "https://github.com/AngelJumbo/lavat.git")
    (license license:expat)))

(define-public ttf-readex-pro
  (package
    (name "ttf-readex-pro")
    (version "1.204")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ThomasJockin/readexpro")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "world-script expansion of Lexend font family")
    (description "World-script expansion of Lexend font family.")
    (home-page "https://github.com/ThomasJockin/readexpro")
    (license (license:nonfree "OFL-1.1-RFN"))))

(define-public ttf-readex-pro-variable
  (package
    (name "ttf-readex-pro-variable")
    (version "1.204")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ThomasJockin/readexpro")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "world-script expansion of Lexend font family")
    (description "World-script expansion of Lexend font family.")
    (home-page "https://github.com/ThomasJockin/readexpro")
    (license (license:nonfree "OFL-1.1-RFN"))))

(define-public samsung-unified-driver-common
  (package
    (name "samsung-unified-driver-common")
    (version "1.00.39")
    (source (origin
              (method url-fetch)
              (uri "http://www.samsung.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "samsung Unified Linux Driver (common files)")
    (description "Samsung Unified Linux Driver (common files).")
    (home-page "http://www.samsung.com")
    (license (license:nonfree "custom:samsung"))))

(define-public mongoclock
  (package
    (name "mongoclock")
    (version "3.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/maandree/mongoclock")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "just a humongous clock for the terminal")
    (description "Just a humongous clock for the terminal.")
    (home-page "https://codeberg.org/maandree/mongoclock")
    (license (license:nonfree "custom:ISC"))))

(define-public ast-firmware
  (package
    (name "ast-firmware")
    (version "501")
    (source (origin
              (method url-fetch)
              (uri "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aspeed VGA module from the IPMI")
    (description "Aspeed VGA module from the IPMI.")
    (home-page "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876")
    (license (license:nonfree "custom"))))

(define-public spout2pw-bin
  (package
    (name "spout2pw-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hoshinolina/spout2pw/releases/download/v0.2.3/spout2pw-bin-0.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/spout2pw-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "spout2 to PipeWire bridge")
    (description "Spout2 to PipeWire bridge.")
    (home-page "https://github.com/hoshinolina/spout2pw")
    (license license:lgpl2.1)))

(define-public scarlett4-firmware
  (package
    (name "scarlett4-firmware")
    (version "1:1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/geoffreybennett/scarlett4-firmware")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20")
    (description "Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20.")
    (home-page "https://github.com/geoffreybennett/scarlett4-firmware")
    (license (license:nonfree "custom:Focusrite"))))

(define-public ttf-mononoki
  (package
    (name "ttf-mononoki")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://madmalik.github.io/mononoki/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "monospace font for programmers, successor of monoOne")
    (description "Monospace font for programmers, successor of monoOne.")
    (home-page "https://madmalik.github.io/mononoki/")
    (license (license:nonfree "custom:OFL"))))

(define-public ttf-recursive
  (package
    (name "ttf-recursive")
    (version "1.085")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/arrowtype/recursive")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "A variable type family built for better code & UI")
    (description "A variable type family built for better code & UI.")
    (home-page "https://github.com/arrowtype/recursive")
    (license license:silofl1.1)))

(define-public piperig-bin
  (package
    (name "piperig-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/joarhal/piperig/releases/download/v0.4.1/piperig-bin-0.4.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/piperig-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "declarative pipeline runner for shell scripts. Define steps, params, and lo...")
    (description "Declarative pipeline runner for shell scripts. Define steps, params, and loops in YAML — piperig expands and executes.")
    (home-page "https://github.com/joarhal/piperig")
    (license license:expat)))

(define-public airwindows-consolidated-bin
  (package
    (name "airwindows-consolidated-bin")
    (version "2026.04.19.7f5a66c")
    (source (origin
              (method url-fetch)
              (uri "https://www.airwindows.com/consolidated/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/airwindows-consolidated-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the entirety of the Airwindows collection as LV2, VST3, and CLAP")
    (description "The entirety of the Airwindows collection as LV2, VST3, and CLAP.")
    (home-page "https://www.airwindows.com/consolidated/")
    (license license:gpl3)))

(define-public taws-bin
  (package
    (name "taws-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/huseyinbabal/taws/releases/download/v1.2.1/taws-bin-1.2.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/taws-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A terminal-based AWS resource viewer and manager")
    (description "A terminal-based AWS resource viewer and manager.")
    (home-page "https://github.com/huseyinbabal/taws")
    (license license:expat)))

(define-public magiskboot-bin
  (package
    (name "magiskboot-bin")
    (version "30.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/topjohnwu/Magisk/releases/download/v30.7/magiskboot-bin-30.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/magiskboot-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "magiskboot binary from magisk offical release")
    (description "Magiskboot binary from magisk offical release.")
    (home-page "https://github.com/topjohnwu/Magisk")
    (license license:gpl3)))

(define-public ttf-iosevka
  (package
    (name "ttf-iosevka")
    (version "34.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://typeof.net/Iosevka/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "typeface family designed for coding, terminal use and technical documents")
    (description "Typeface family designed for coding, terminal use and technical documents.")
    (home-page "https://typeof.net/Iosevka/")
    (license license:silofl1.1)))

(define-public portal-bin
  (package
    (name "portal-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ZinoKader/portal/releases/download/v1.2.3/portal-bin-1.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/portal-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "quick and easy command-line file transfer utility from any computer to another")
    (description "Quick and easy command-line file transfer utility from any computer to another.")
    (home-page "https://github.com/ZinoKader/portal")
    (license license:expat)))

(define-public yandex-cloud-cli-bin
  (package
    (name "yandex-cloud-cli-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://yandex.cloud/en/docs/cli/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yandex-cloud-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "yandex.Cloud CLI")
    (description "Yandex.Cloud CLI.")
    (home-page "https://yandex.cloud/en/docs/cli/")
    (license (license:nonfree "unknown"))))

(define-public wasm-pack-bin
  (package
    (name "wasm-pack-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wasm-bindgen/wasm-pack/releases/download/v0.14.0/wasm-pack-bin-0.14.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wasm-pack-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "your favorite Rust -> Wasm workflow tool")
    (description "Your favorite Rust -> Wasm workflow tool.")
    (home-page "https://github.com/wasm-bindgen/wasm-pack")
    (license (list license:asl2.0 license:expat))))

(define-public ssh-dashboard-bin
  (package
    (name "ssh-dashboard-bin")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AlpinDale/ssh-dashboard/releases/download/v0.0.9/ssh-dashboard-bin-0.0.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ssh-dashboard-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "monitor GPU/CPU Usage on SSH servers, with NVIDIA and AMD")
    (description "Monitor GPU/CPU Usage on SSH servers, with NVIDIA and AMD.")
    (home-page "https://github.com/AlpinDale/ssh-dashboard")
    (license license:expat)))

(define-public lstf-bin
  (package
    (name "lstf-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/yuuki/lstf/releases/download/v0.7.2/lstf-bin-0.7.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lstf-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the aggregated TCP flows printer in Linux")
    (description "The aggregated TCP flows printer in Linux.")
    (home-page "https://github.com/yuuki/lstf")
    (license license:asl2.0)))

(define-public filecraft-cli-bin
  (package
    (name "filecraft-cli-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/murtazapatel89100/Filecraft/releases/download/v1.1.0/filecraft-cli-bin-1.1.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/filecraft-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fileCraft CLI organizer (prebuilt binary)")
    (description "FileCraft CLI organizer (prebuilt binary).")
    (home-page "https://github.com/murtazapatel89100/Filecraft")
    (license license:expat)))

(define-public drift-bin
  (package
    (name "drift-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/phlx0/drift/releases/download/v1.0.1/drift-bin-1.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/drift-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal screensaver and idle visualizer with animated scenes")
    (description "Terminal screensaver and idle visualizer with animated scenes.")
    (home-page "https://github.com/phlx0/drift")
    (license license:expat)))

(define-public org-stats-bin
  (package
    (name "org-stats-bin")
    (version "1.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/caarlos0/org-stats/releases/download/v1.12.2/org-stats-bin-1.12.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/org-stats-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "get the contributor stats summary from all repositories of any given organi...")
    (description "Get the contributor stats summary from all repositories of any given organization.")
    (home-page "https://github.com/caarlos0/org-stats")
    (license license:expat)))

(define-public waitup-bin
  (package
    (name "waitup-bin")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/creaked/waitup/releases/download/v0.4.3/waitup-bin-0.4.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/waitup-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A utility to check when a system/service becomes available (RDP/SSH/Port)")
    (description "A utility to check when a system/service becomes available (RDP/SSH/Port).")
    (home-page "https://github.com/creaked/waitup")
    (license license:expat)))

(define-public riffdiff-bin
  (package
    (name "riffdiff-bin")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/walles/riff/releases/download/v3.6.1/riffdiff-bin-3.6.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/riffdiff-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A diff filter highlighting which line parts have changed")
    (description "A diff filter highlighting which line parts have changed.")
    (home-page "https://github.com/walles/riff")
    (license license:expat)))

(define-public packrinth-bin
  (package
    (name "packrinth-bin")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri "https://packrinth.thijzert.nl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/packrinth-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for creating and maintaining your own Minecraft modpack")
    (description "CLI tool for creating and maintaining your own Minecraft modpack.")
    (home-page "https://packrinth.thijzert.nl")
    (license license:expat)))

(define-public hcledit-bin
  (package
    (name "hcledit-bin")
    (version "0.2.17")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/minamijoyo/hcledit/releases/download/v0.2.17/hcledit-bin-0.2.17-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hcledit-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A command line editor for HCL")
    (description "A command line editor for HCL.")
    (home-page "https://github.com/minamijoyo/hcledit")
    (license license:expat)))

(define-public slick-bin
  (package
    (name "slick-bin")
    (version "0.0.19")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mcandre/slick/releases/download/v0.0.19/slick-bin-0.0.19-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/slick-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A CI-ready shell language syntax checker")
    (description "A CI-ready shell language syntax checker.")
    (home-page "https://github.com/mcandre/slick")
    (license license:bsd-2)))

(define-public pokesay-bin
  (package
    (name "pokesay-bin")
    (version "0.18.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tmck-code/pokesay/releases/download/v0.18.3/pokesay-bin-0.18.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pokesay-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "print pokemon in the CLI! An adaptation of the classic 'cowsay'")
    (description "Print pokemon in the CLI! An adaptation of the classic 'cowsay'.")
    (home-page "https://github.com/tmck-code/pokesay")
    (license license:bsd-3)))

(define-public glab-component-generator-bin
  (package
    (name "glab-component-generator-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/peschmae/glab-component-generator/releases/download/v0.10.0/glab-component-generator-bin-0.10.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/glab-component-generator-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "small Golang CLI to generate README for Gitlab CI components")
    (description "Small Golang CLI to generate README for Gitlab CI components.")
    (home-page "https://github.com/peschmae/glab-component-generator")
    (license license:expat)))

(define-public ratatui-docs
  (package
    (name "ratatui-docs")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri "https://ratatui.rs")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for Ratatui Rust package")
    (description "Documentation for Ratatui Rust package.")
    (home-page "https://ratatui.rs")
    (license license:expat)))

(define-public mult-bin
  (package
    (name "mult-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dhth/mult/releases/download/v0.3.0/mult-bin-0.3.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mult-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "run a command multiple times and glance at the outputs via a TUI")
    (description "Run a command multiple times and glance at the outputs via a TUI.")
    (home-page "https://github.com/dhth/mult")
    (license license:expat)))

(define-public snapsr-bin
  (package
    (name "snapsr-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/BeastieNate5/snapsr/releases/download/v0.0.1/snapsr-bin-0.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/snapsr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to snapshot and restore custom file setups with ease")
    (description "CLI tool to snapshot and restore custom file setups with ease.")
    (home-page "https://github.com/BeastieNate5/snapsr")
    (license license:expat)))

(define-public ktlint-compose-rules
  (package
    (name "ktlint-compose-rules")
    (version "0.5.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mrmans0n/compose-rules")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lint rules for ktlint/detekt aimed to contribute to a healthier usage of Co...")
    (description "Lint rules for ktlint/detekt aimed to contribute to a healthier usage of Compose. Actively maintained and evolved fork of the Twitter Compose rules.")
    (home-page "https://github.com/mrmans0n/compose-rules")
    (license license:asl2.0)))

(define-public gophertube-bin
  (package
    (name "gophertube-bin")
    (version "2.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KrishnaSSH/gophertube/releases/download/v2.8.2/gophertube-bin-2.8.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gophertube-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal terminal YouTube client with mpv, fzf, and chafa previews")
    (description "Minimal terminal YouTube client with mpv, fzf, and chafa previews.")
    (home-page "https://github.com/KrishnaSSH/gophertube")
    (license license:gpl3)))

(define-public ardopcf-bin
  (package
    (name "ardopcf-bin")
    (version "1.0.4.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pflarue/ardop/releases/download/v1.0.4.1.3/ardopcf-bin-1.0.4.1.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ardopcf-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ardopcf is an Open-Source cross-platform implmentation of Ardop")
    (description "Ardopcf is an Open-Source cross-platform implmentation of Ardop.")
    (home-page "https://github.com/pflarue/ardop")
    (license license:expat)))

(define-public arashi-icon-theme
  (package
    (name "arashi-icon-theme")
    (version "25.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/0hStormy/Arashi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arashi a smooth, modern icon set with a twist!")
    (description "Arashi a smooth, modern icon set with a twist!.")
    (home-page "https://github.com/0hStormy/Arashi")
    (license license:cc-by4.0)))

(define-public gh-dash-bin
  (package
    (name "gh-dash-bin")
    (version "4.23.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dlvhdr/gh-dash/releases/download/v4.23.2/gh-dash-bin-4.23.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gh-dash-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A beautiful CLI dashboard extension for GitHub to display pull requests and...")
    (description "A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about.")
    (home-page "https://github.com/dlvhdr/gh-dash")
    (license license:expat)))

(define-public mite
  (package
    (name "mite")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hanion/mite")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "static site generator with C templates")
    (description "Static site generator with C templates.")
    (home-page "https://github.com/hanion/mite")
    (license license:expat)))

(define-public goose-bin
  (package
    (name "goose-bin")
    (version "3.27.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pressly/goose/releases/download/v3.27.0/goose-bin-3.27.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goose-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A database migration tool. Supports SQL migrations and Go functions")
    (description "A database migration tool. Supports SQL migrations and Go functions.")
    (home-page "https://github.com/pressly/goose")
    (license license:expat)))

(define-public gost-v3-bin
  (package
    (name "gost-v3-bin")
    (version "3.2.7.20251122")
    (source (origin
              (method url-fetch)
              (uri "https://gost.run/en/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gost-v3-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GO Simple Tunnel - A simple security tunnel")
    (description "GO Simple Tunnel - A simple security tunnel.")
    (home-page "https://gost.run/en/")
    (license license:expat)))

(define-public codellm
  (package
    (name "codellm")
    (version "1.101.23707")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abacusai/codellm-releases")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AI code editor that enhances developer productivity, bundled with the AI su...")
    (description "AI code editor that enhances developer productivity, bundled with the AI super assistant, ChatLLM.")
    (home-page "https://github.com/abacusai/codellm-releases")
    (license (license:nonfree "custom"))))

(define-public ttf-miracode
  (package
    (name "ttf-miracode")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/IdreesInc/Miracode")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "A sharp, readable, vector-y version of Monocraft, the monospace programming...")
    (description "A sharp, readable, vector-y version of Monocraft, the monospace programming font based on Minecraft.")
    (home-page "https://github.com/IdreesInc/Miracode")
    (license license:silofl1.1)))
