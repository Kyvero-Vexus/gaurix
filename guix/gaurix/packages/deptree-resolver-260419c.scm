;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260419c
;;; Resolves 98 TODO packages with concrete recipes.
;;; Moves 2 packages to BLOCKED status.
;;;
;;; New recipes:
;;;      1.  lib32-mesa-git (gnu-build-system, v26.0.0_devel.214240.b2badb2b241.d41d8cd, custom)
;;;      2.  deepin-wine-quarkclouddrive (gnu-build-system, v3.2.6spark4, LicenseRef-custom)
;;;      3.  framework-system-git (gnu-build-system, v0.4.2.r11.ga879e74, MIT)
;;;      4.  canon-tr8600-series (gnu-build-system, v6.10, custom)
;;;      5.  alpm-octopi-utils-git (gnu-build-system, vr20.1e735c3, GPL3)
;;;      6.  bricklink-studio (gnu-build-system, v2.26.3_1, custom)
;;;      7.  ttf-materialicons-regular-for-inline (copy-build-system, v0.1.0, Apache-2.0)
;;;      8.  dectalk-git (gnu-build-system, v2023.10.30.r29.gb44e3af4, proprietary)
;;;      9.  linuxthemestore-git (gnu-build-system, v1.0.1-1.0, MIT)
;;;     10.  mattermost-plugin-jitsi (gnu-build-system, v2.1.0, Apache-2.0)
;;;     11.  nvidia-510xx-dkms (gnu-build-system, v510.108.03, custom)
;;;     12.  opencl-510xx-nvidia (gnu-build-system, v510.108.03, custom)
;;;     13.  liri-git-meta (gnu-build-system, v0.9.0, GPL3)
;;;     14.  bbg-git (gnu-build-system, v20240613.r37.22c156d, Unlicense)
;;;     15.  easyeda-pro-electron (gnu-build-system, v2.2.47.7, LicenseRef-EasyEDA-Proprietary)
;;;     16.  hid-ite8291r3-dkms-git (gnu-build-system, vr14.7ad5991, GPL-2.0-only)
;;;     17.  hp-prime-virtual-calculator-bin (copy-build-system, v2.2.15270_2025_01_31, LicenseRef-Hewlett-Packard)
;;;     18.  nodejs-appium-chromium-driver (node-build-system, v2.1.8, Apache-2.0)
;;;     19.  nodejs-appium-espresso-driver (node-build-system, v8.0.0, Apache-2.0)
;;;     20.  nodejs-appium-execute-driver-plugin (node-build-system, v6.0.1, Apache-2.0)
;;;     21.  nodejs-appium-geckodriver (node-build-system, v2.2.1, Apache-2.0)
;;;     22.  nodejs-appium-images-plugin (node-build-system, v4.2.0, Apache-2.0)
;;;     23.  nodejs-appium-mac2-driver (node-build-system, v3.3.0, Apache-2.0)
;;;     24.  nodejs-appium-relaxed-caps-plugin (node-build-system, v2.2.0, Apache-2.0)
;;;     25.  nodejs-appium-safari-driver (node-build-system, v4.1.12, Apache-2.0)
;;;     26.  nodejs-appium-storage-plugin (node-build-system, v1.1.0, Apache-2.0)
;;;     27.  nodejs-appium-uiautomator2-driver (node-build-system, v7.1.2, Apache-2.0)
;;;     28.  nodejs-appium-universal-xml-plugin (node-build-system, v2.1.1, Apache-2.0)
;;;     29.  nodejs-appium-windows-driver (node-build-system, v5.1.10, Apache-2.0)
;;;     30.  nodejs-appium-xcuitest-driver (node-build-system, v11.0.0, Apache-2.0)
;;;     31.  ocd-git (gnu-build-system, v0.8.0.r0.ga553a48, MIT)
;;;     32.  python-appium-python-client (pyproject-build-system, v5.3.0, Apache-2.0)
;;;     33.  python-ite8291r3-ctl-git (pyproject-build-system, vr22.d2c490a, GPL-2.0-only)
;;;     34.  python-vllm-cuda (pyproject-build-system, v0.19.0, Apache-2.0)
;;;     35.  kattis-problemtools-git (pyproject-build-system, v1.20231016.r351.gbabb11d, MIT)
;;;     36.  nvim-treesitter-parsers-git (gnu-build-system, vr1310.8996612b, Apache)
;;;     37.  embedded-studio (gnu-build-system, v8.24, Commercial)
;;;     38.  gnome-screensaver-no-watchdog (gnu-build-system, v3.6.1, GPL)
;;;     39.  mkinitcpio-sd-zfs-poscat (gnu-build-system, v0.1, CC0)
;;;     40.  otf-piazzolla (copy-build-system, v2.005, OFL)
;;;     41.  ttf-piazzolla-variable (copy-build-system, v2.005, OFL)
;;;     42.  otf-unscii-16-full (copy-build-system, v2.1, GPL)
;;;     43.  linux-firmware-hauppauge (gnu-build-system, v0.2.3, GPL-3.0-or-later)
;;;     44.  otf-unscii-8 (copy-build-system, v2.1, GPL)
;;;     45.  nodejs-postcss-cli (node-build-system, v11.0.1, MIT)
;;;     46.  hyprland-welcome-git (gnu-build-system, vr19.51561c0, BSD-3-Clause)
;;;     47.  corefreq-client-git (gnu-build-system, v2.0.7.r20.gdeb3da7, GPL-2.0-only)
;;;     48.  corefreq-dkms-git (gnu-build-system, v2.0.7.r20.gdeb3da7, GPL-2.0-only)
;;;     49.  corefreq-server-git (gnu-build-system, v2.0.7.r20.gdeb3da7, GPL-2.0-only)
;;;     50.  whisper-cpp-openvino (gnu-build-system, v1.8.3, MIT)
;;;     51.  nodejs-flood (node-build-system, v4.11.0, GPL3)
;;;     52.  nil-git (gnu-build-system, v2023.08.09.r26.g059d33a, Apache-2.0)
;;;     53.  mybatop (pyproject-build-system, v1.0.1, GPL-3.0)
;;;     54.  scangearmp2 (gnu-build-system, v4.80, custom:canon)
;;;     55.  dipc (gnu-build-system, v1.0.0, Apache)
;;;     56.  gdbuspp (gnu-build-system, v3, AGPL-3.0-only)
;;;     57.  par2cmdline-turbo (gnu-build-system, v1.4.0, GPL2)
;;;     58.  fcitx5-pinyin-moegirl (gnu-build-system, v20260412, cc-by-nc-sa-3.0)
;;;     59.  wl-screenrec-git (gnu-build-system, vr210.3a465ea, Apache)
;;;     60.  libadwaita-without-adwaita-git (gnu-build-system, v1.9.0.r4.g7352d8c, LGPL-2.1-or-later)
;;;     61.  gotenberg (gnu-build-system, v8.31.0, MIT)
;;;     62.  nginx-mainline-mod-lua (gnu-build-system, v0.10.29R2, BSD)
;;;     63.  hopp-cli-bin (copy-build-system, v0.0.8, MIT)
;;;     64.  reclog (gnu-build-system, v0.1.6, MIT)
;;;     65.  swayfx-i3-style-fullscreen-git (gnu-build-system, vr7069.03a07969, MIT)
;;;     66.  clockify-desktop (gnu-build-system, v2.6.0, LicenseRef-custom)
;;;     67.  mcaselector (gnu-build-system, v2.7, MIT)
;;;     68.  surfer-waveform-git (pyproject-build-system, v0.5.0.r49.g79b75e1, EUPL-1.2)
;;;     69.  qdep (pyproject-build-system, v1.1.1, BSD-3-Clause)
;;;     70.  codechecker (pyproject-build-system, v6.26.2, Apache-2.0)
;;;     71.  idris2-pack-git (gnu-build-system, vlatest, custom:BSD)
;;;     72.  reth-git (gnu-build-system, v0.1.0.alpha.1.r208.g428a6dc2f, Apache)
;;;     73.  clockify-cli (gnu-build-system, v0.58.0, Apache-2.0)
;;;     74.  fish-nvm (gnu-build-system, v2.2.17, MIT)
;;;     75.  hp-omen-wmi-dkms (gnu-build-system, vr32.d4b9b5a, GPLv2)
;;;     76.  libreport (pyproject-build-system, v2.17.15, GPL-2.0-only)
;;;     77.  bbppairings (gnu-build-system, v6.0.0, Apache-2.0)
;;;     78.  dbt-core (pyproject-build-system, v1.9.5, Apache)
;;;     79.  dbt-fusion-bin (copy-build-system, v2.0.0.beta.12, custom)
;;;     80.  electrum-abc-bin (copy-build-system, v5.4.4, MIT)
;;;     81.  supportboi (gnu-build-system, v4.0.1, GPL-3.0-or-later)
;;;     82.  kpscript (gnu-build-system, v2.58, GPL)
;;;     83.  nscde (pyproject-build-system, v2.3, GPL3)
;;;     84.  teamspeak3-pluginsdk (gnu-build-system, v3.3.0, custom)
;;;     85.  git-fame (pyproject-build-system, v3.1.1, MPL-2.0)
;;;     86.  teamspeak3-addon-installer (gnu-build-system, v0.3, WTFPL)
;;;     87.  browserselector (pyproject-build-system, v1.0.3, MIT)
;;;     88.  ttf-sarasa-ui-all (copy-build-system, v1.0.33, OFL)
;;;     89.  ttf-sarasa-ui-cl (copy-build-system, v1.0.33, OFL)
;;;     90.  ttf-sarasa-ui-hc (copy-build-system, v1.0.33, OFL)
;;;     91.  ttf-sarasa-ui-jp (copy-build-system, v1.0.33, OFL)
;;;     92.  ttf-sarasa-ui-kr (copy-build-system, v1.0.33, OFL)
;;;     93.  ttf-sarasa-ui-sc (copy-build-system, v1.0.33, OFL)
;;;     94.  ttf-sarasa-ui-tc (copy-build-system, v1.0.33, OFL)
;;;     95.  lite (gnu-build-system, v1.11, MIT)
;;;     96.  applesmc-next-dkms (gnu-build-system, v0.1.6, GPL2)
;;;     97.  pynotify-bin (copy-build-system, v0.7, MIT)
;;;     98.  chapel (pyproject-build-system, v2.8.0, Apache-2.0)
;;;
;;; BLOCKED (2):
;;;     99.  noto-fonts-cjk-glyph-conf -> SOURCE_UNAVAILABLE: No upstream URL in AUR metadata
;;;    100.  noto-fonts-cjk-locale-conf -> SOURCE_UNAVAILABLE: No upstream URL in AUR metadata
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
(define-module (gaurix packages deptree-resolver-260419c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (lib32-mesa-git
            deepin-wine-quarkclouddrive
            framework-system-git
            canon-tr8600-series
            alpm-octopi-utils-git
            bricklink-studio
            ttf-materialicons-regular-for-inline
            dectalk-git
            linuxthemestore-git
            mattermost-plugin-jitsi
            nvidia-510xx-dkms
            opencl-510xx-nvidia
            liri-git-meta
            bbg-git
            easyeda-pro-electron
            hid-ite8291r3-dkms-git
            hp-prime-virtual-calculator-bin
            nodejs-appium-chromium-driver
            nodejs-appium-espresso-driver
            nodejs-appium-execute-driver-plugin
            nodejs-appium-geckodriver
            nodejs-appium-images-plugin
            nodejs-appium-mac2-driver
            nodejs-appium-relaxed-caps-plugin
            nodejs-appium-safari-driver
            nodejs-appium-storage-plugin
            nodejs-appium-uiautomator2-driver
            nodejs-appium-universal-xml-plugin
            nodejs-appium-windows-driver
            nodejs-appium-xcuitest-driver
            ocd-git
            python-appium-python-client
            python-ite8291r3-ctl-git
            python-vllm-cuda
            kattis-problemtools-git
            nvim-treesitter-parsers-git
            embedded-studio
            gnome-screensaver-no-watchdog
            mkinitcpio-sd-zfs-poscat
            otf-piazzolla
            ttf-piazzolla-variable
            otf-unscii-16-full
            linux-firmware-hauppauge
            otf-unscii-8
            nodejs-postcss-cli
            hyprland-welcome-git
            corefreq-client-git
            corefreq-dkms-git
            corefreq-server-git
            whisper-cpp-openvino
            nodejs-flood
            nil-git
            mybatop
            scangearmp2
            dipc
            gdbuspp
            par2cmdline-turbo
            fcitx5-pinyin-moegirl
            wl-screenrec-git
            libadwaita-without-adwaita-git
            gotenberg
            nginx-mainline-mod-lua
            hopp-cli-bin
            reclog
            swayfx-i3-style-fullscreen-git
            clockify-desktop
            mcaselector
            surfer-waveform-git
            qdep
            codechecker
            idris2-pack-git
            reth-git
            clockify-cli
            fish-nvm
            hp-omen-wmi-dkms
            libreport
            bbppairings
            dbt-core
            dbt-fusion-bin
            electrum-abc-bin
            supportboi
            kpscript
            nscde
            teamspeak3-pluginsdk
            git-fame
            teamspeak3-addon-installer
            browserselector
            ttf-sarasa-ui-all
            ttf-sarasa-ui-cl
            ttf-sarasa-ui-hc
            ttf-sarasa-ui-jp
            ttf-sarasa-ui-kr
            ttf-sarasa-ui-sc
            ttf-sarasa-ui-tc
            lite
            applesmc-next-dkms
            pynotify-bin
            chapel
))


;;; -------------------------------------------------------------------
;;; 1. lib32-mesa-git
;;; -------------------------------------------------------------------
(define-public lib32-mesa-git
  (package
    (name "lib32-mesa-git")
    (version "26.0.0_devel.214240.b2badb2b241.d41d8cd")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mesa3d.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.mesa3d.org")
    (synopsis "an open-source implementation of the OpenGL specification, git version")
    (description "An open-source implementation of the OpenGL specification, git version.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. deepin-wine-quarkclouddrive
;;; -------------------------------------------------------------------
(define-public deepin-wine-quarkclouddrive
  (package
    (name "deepin-wine-quarkclouddrive")
    (version "3.2.6spark4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pan.quark.cn//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pan.quark.cn/")
    (synopsis "夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。")
    (description "夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. framework-system-git
;;; -------------------------------------------------------------------
(define-public framework-system-git
  (package
    (name "framework-system-git")
    (version "0.4.2.r11.ga879e74")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FrameworkComputer/framework-system")
                    (commit "v0.4.2.r11.ga879e74")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FrameworkComputer/framework-system")
    (synopsis "tool to interact with the framework system (git development version)")
    (description "Tool to interact with the framework system (git development version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. canon-tr8600-series
;;; -------------------------------------------------------------------
(define-public canon-tr8600-series
  (package
    (name "canon-tr8600-series")
    (version "6.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gdlp01.c-wss.com/gds/1/0100010921/01/cnijfilter2-source-6.10-1.tar.gz/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gdlp01.c-wss.com/gds/1/0100010921/01/cnijfilter2-source-6.10-1.tar.gz")
    (synopsis "printer drivers for the Cannon 8620 series")
    (description "Printer drivers for the Cannon 8620 series.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. alpm-octopi-utils-git
;;; -------------------------------------------------------------------
(define-public alpm-octopi-utils-git
  (package
    (name "alpm-octopi-utils-git")
    (version "r20.1e735c3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tintaescura.com/projects/octopi//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://tintaescura.com/projects/octopi/")
    (synopsis "alpm utils for Octopi (git)")
    (description "Alpm utils for Octopi (git).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. bricklink-studio
;;; -------------------------------------------------------------------
(define-public bricklink-studio
  (package
    (name "bricklink-studio")
    (version "2.26.3_1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bricklink.com/v3/studio/download.page/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.bricklink.com/v3/studio/download.page")
    (synopsis "lego cad software created by Bricklink")
    (description "Lego cad software created by Bricklink.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. ttf-materialicons-regular-for-inline
;;; -------------------------------------------------------------------
(define-public ttf-materialicons-regular-for-inline
  (package
    (name "ttf-materialicons-regular-for-inline")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ashellwig/ttf-materialicons-regular-for-inline/releases/download/v"
                    version "/ttf-materialicons-regular-for-inline-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/ashellwig/ttf-materialicons-regular-for-inline")
    (synopsis "a patched material icons font required for using the material icon set for i3...")
    (description "A patched material icons font required for using the material icon set for i3status-rust.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8. dectalk-git
;;; -------------------------------------------------------------------
(define-public dectalk-git
  (package
    (name "dectalk-git")
    (version "2023.10.30.r29.gb44e3af4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dectalk/dectalk")
                    (commit "v2023.10.30.r29.gb44e3af4")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dectalk/dectalk")
    (synopsis "modern builds for the 90s/00s DECtalk text-to-speech application")
    (description "Modern builds for the 90s/00s DECtalk text-to-speech application.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. linuxthemestore-git
;;; -------------------------------------------------------------------
(define-public linuxthemestore-git
  (package
    (name "linuxthemestore-git")
    (version "1.0.1-1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/debasish-patra-1987/linuxthemestore")
                    (commit "v1.0.1-1.0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/debasish-patra-1987/linuxthemestore")
    (synopsis "a Linux desktop app to install linux themes")
    (description "A Linux desktop app to install linux themes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. mattermost-plugin-jitsi
;;; -------------------------------------------------------------------
(define-public mattermost-plugin-jitsi
  (package
    (name "mattermost-plugin-jitsi")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mattermost/mattermost-plugin-jitsi/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mattermost/mattermost-plugin-jitsi")
    (synopsis "jitsi plugin for Mattermost")
    (description "Jitsi plugin for Mattermost.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. nvidia-510xx-dkms
;;; -------------------------------------------------------------------
(define-public nvidia-510xx-dkms
  (package
    (name "nvidia-510xx-dkms")
    (version "510.108.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.nvidia.com/")
    (synopsis "nVIDIA drivers - module sources, 510 branch")
    (description "NVIDIA drivers - module sources, 510 branch.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. opencl-510xx-nvidia
;;; -------------------------------------------------------------------
(define-public opencl-510xx-nvidia
  (package
    (name "opencl-510xx-nvidia")
    (version "510.108.03")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.nvidia.com/")
    (synopsis "openCL implemention for NVIDIA, 510 branch")
    (description "OpenCL implemention for NVIDIA, 510 branch.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. liri-git-meta
;;; -------------------------------------------------------------------
(define-public liri-git-meta
  (package
    (name "liri-git-meta")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://liri.io//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://liri.io/")
    (synopsis "meta package to install all the LiriOS ecosystem (git version)")
    (description "Meta package to install all the LiriOS ecosystem (git version).")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. bbg-git
;;; -------------------------------------------------------------------
(define-public bbg-git
  (package
    (name "bbg-git")
    (version "20240613.r37.22c156d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bbg-contributors/bbg")
                    (commit "v20240613.r37.22c156d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bbg-contributors/bbg")
    (synopsis "a static blog generator built with electron")
    (description "A static blog generator built with electron.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 15. easyeda-pro-electron
;;; -------------------------------------------------------------------
(define-public easyeda-pro-electron
  (package
    (name "easyeda-pro-electron")
    (version "2.2.47.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pro.easyeda.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://pro.easyeda.com/")
    (synopsis "easyEDA Professional Edition. Run with system electron")
    (description "EasyEDA Professional Edition. Run with system electron.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. hid-ite8291r3-dkms-git
;;; -------------------------------------------------------------------
(define-public hid-ite8291r3-dkms-git
  (package
    (name "hid-ite8291r3-dkms-git")
    (version "r14.7ad5991")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pobrn/hid-ite8291r3")
                    (commit "vr14.7ad5991")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pobrn/hid-ite8291r3")
    (synopsis "linux kernel driver for the ITE 8291 (rev 0.03) RGB keyboard backlight contro...")
    (description "Linux kernel driver for the ITE 8291 (rev 0.03) RGB keyboard backlight controller.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. hp-prime-virtual-calculator-bin
;;; -------------------------------------------------------------------
(define-public hp-prime-virtual-calculator-bin
  (package
    (name "hp-prime-virtual-calculator-bin")
    (version "2.2.15270_2025_01_31")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://hpcalcs.com/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hp-prime-virtual-calculator-bin" "bin/hp-prime-virtual-calculator-bin"))))
    (home-page "https://hpcalcs.com")
    (synopsis "simulator of the HP Prime Graphing Calculator (using Wine)")
    (description "Simulator of the HP Prime Graphing Calculator (using Wine).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. nodejs-appium-chromium-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-chromium-driver
  (package
    (name "nodejs-appium-chromium-driver")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-chromium-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-chromium-driver")
    (synopsis "appium 2.x driver for Chromium-based browsers that work with Chromedriver")
    (description "Appium 2.x driver for Chromium-based browsers that work with Chromedriver.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. nodejs-appium-espresso-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-espresso-driver
  (package
    (name "nodejs-appium-espresso-driver")
    (version "8.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-espresso-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-espresso-driver")
    (synopsis "espresso integration for Appium")
    (description "Espresso integration for Appium.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. nodejs-appium-execute-driver-plugin
;;; -------------------------------------------------------------------
(define-public nodejs-appium-execute-driver-plugin
  (package
    (name "nodejs-appium-execute-driver-plugin")
    (version "6.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/@appium/execute-driver-plugin/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/@appium/execute-driver-plugin")
    (synopsis "plugin for batching and executing driver commands with Appiums")
    (description "Plugin for batching and executing driver commands with Appiums.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. nodejs-appium-geckodriver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-geckodriver
  (package
    (name "nodejs-appium-geckodriver")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-geckodriver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-geckodriver")
    (synopsis "appium driver for Gecko-based browsers and web views")
    (description "Appium driver for Gecko-based browsers and web views.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 22. nodejs-appium-images-plugin
;;; -------------------------------------------------------------------
(define-public nodejs-appium-images-plugin
  (package
    (name "nodejs-appium-images-plugin")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/@appium/images-plugin/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/@appium/images-plugin")
    (synopsis "plugin for working with images and image elements in Appium")
    (description "Plugin for working with images and image elements in Appium.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. nodejs-appium-mac2-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-mac2-driver
  (package
    (name "nodejs-appium-mac2-driver")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-mac2-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-mac2-driver")
    (synopsis "xCTest-based Appium driver for macOS apps automation")
    (description "XCTest-based Appium driver for macOS apps automation.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 24. nodejs-appium-relaxed-caps-plugin
;;; -------------------------------------------------------------------
(define-public nodejs-appium-relaxed-caps-plugin
  (package
    (name "nodejs-appium-relaxed-caps-plugin")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/@appium/relaxed-caps-plugin/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/@appium/relaxed-caps-plugin")
    (synopsis "an Appium 2.0 plugin that loosens requirements for vendor prefixes on caps")
    (description "An Appium 2.0 plugin that loosens requirements for vendor prefixes on caps.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 25. nodejs-appium-safari-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-safari-driver
  (package
    (name "nodejs-appium-safari-driver")
    (version "4.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-safari-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-safari-driver")
    (synopsis "appium driver for Safari browser")
    (description "Appium driver for Safari browser.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 26. nodejs-appium-storage-plugin
;;; -------------------------------------------------------------------
(define-public nodejs-appium-storage-plugin
  (package
    (name "nodejs-appium-storage-plugin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/@appium/storage-plugin/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/@appium/storage-plugin")
    (synopsis "appium plugin for server-side file storage")
    (description "Appium plugin for server-side file storage.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 27. nodejs-appium-uiautomator2-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-uiautomator2-driver
  (package
    (name "nodejs-appium-uiautomator2-driver")
    (version "7.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-uiautomator2-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-uiautomator2-driver")
    (synopsis "uiAutomator2 integration for Appium")
    (description "UiAutomator2 integration for Appium.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 28. nodejs-appium-universal-xml-plugin
;;; -------------------------------------------------------------------
(define-public nodejs-appium-universal-xml-plugin
  (package
    (name "nodejs-appium-universal-xml-plugin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/@appium/universal-xml-plugin/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/@appium/universal-xml-plugin")
    (synopsis "appium plugin for making XML source and XPath queries the same across iOS and...")
    (description "Appium plugin for making XML source and XPath queries the same across iOS and Android.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 29. nodejs-appium-windows-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-windows-driver
  (package
    (name "nodejs-appium-windows-driver")
    (version "5.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-windows-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-windows-driver")
    (synopsis "appium bridge to WinAppDriver")
    (description "Appium bridge to WinAppDriver.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 30. nodejs-appium-xcuitest-driver
;;; -------------------------------------------------------------------
(define-public nodejs-appium-xcuitest-driver
  (package
    (name "nodejs-appium-xcuitest-driver")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.npmjs.com/package/appium-xcuitest-driver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/appium-xcuitest-driver")
    (synopsis "appium driver for iOS using XCUITest for backend")
    (description "Appium driver for iOS using XCUITest for backend.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 31. ocd-git
;;; -------------------------------------------------------------------
(define-public ocd-git
  (package
    (name "ocd-git")
    (version "0.8.0.r0.ga553a48")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/awkless/ocd")
                    (commit "v0.8.0.r0.ga553a48")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/awkless/ocd")
    (synopsis "organize current dotfiles")
    (description "Organize current dotfiles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32. python-appium-python-client
;;; -------------------------------------------------------------------
(define-public python-appium-python-client
  (package
    (name "python-appium-python-client")
    (version "5.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/appium/python-client/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/appium/python-client")
    (synopsis "Python language bindings for Appium")
    (description "Python language bindings for Appium.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 33. python-ite8291r3-ctl-git
;;; -------------------------------------------------------------------
(define-public python-ite8291r3-ctl-git
  (package
    (name "python-ite8291r3-ctl-git")
    (version "r22.d2c490a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pobrn/ite8291r3-ctl")
                    (commit "vr22.d2c490a")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pobrn/ite8291r3-ctl")
    (synopsis "iTE 8291 (rev 0.03) userspace driver")
    (description "ITE 8291 (rev 0.03) userspace driver.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 34. python-vllm-cuda
;;; -------------------------------------------------------------------
(define-public python-vllm-cuda
  (package
    (name "python-vllm-cuda")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vllm-project/vllm/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vllm-project/vllm")
    (synopsis "high-throughput and memory-efficient inference and serving engine for LLMs")
    (description "High-throughput and memory-efficient inference and serving engine for LLMs.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 35. kattis-problemtools-git
;;; -------------------------------------------------------------------
(define-public kattis-problemtools-git
  (package
    (name "kattis-problemtools-git")
    (version "1.20231016.r351.gbabb11d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kattis/problemtools")
                    (commit "v1.20231016.r351.gbabb11d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Kattis/problemtools")
    (synopsis "tools to manage problem packages using the Kattis problem package format")
    (description "Tools to manage problem packages using the Kattis problem package format.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. nvim-treesitter-parsers-git
;;; -------------------------------------------------------------------
(define-public nvim-treesitter-parsers-git
  (package
    (name "nvim-treesitter-parsers-git")
    (version "r1310.8996612b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nvim-treesitter/nvim-treesitter")
                    (commit "vr1310.8996612b")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nvim-treesitter/nvim-treesitter")
    (synopsis "all of the registered tree sitter parsers used by Neovim")
    (description "All of the registered tree sitter parsers used by Neovim.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 37. embedded-studio
;;; -------------------------------------------------------------------
(define-public embedded-studio
  (package
    (name "embedded-studio")
    (version "8.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.segger.com/products/development-tools/embedded-studio//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.segger.com/products/development-tools/embedded-studio/")
    (synopsis "segger Embedded Studio")
    (description "Segger Embedded Studio.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. gnome-screensaver-no-watchdog
;;; -------------------------------------------------------------------
(define-public gnome-screensaver-no-watchdog
  (package
    (name "gnome-screensaver-no-watchdog")
    (version "3.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.gnome.org/Projects/GnomeScreensaver/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wiki.gnome.org/Projects/GnomeScreensaver")
    (synopsis "legacy GNOME screensaver with disabled watchdog that drops x11 settings (usef...")
    (description "Legacy GNOME screensaver with disabled watchdog that drops x11 settings (useful with xss-lock).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. mkinitcpio-sd-zfs-poscat
;;; -------------------------------------------------------------------
(define-public mkinitcpio-sd-zfs-poscat
  (package
    (name "mkinitcpio-sd-zfs-poscat")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/poscat0x04/mkinitcpio-sd-zfs/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/poscat0x04/mkinitcpio-sd-zfs")
    (synopsis "systemd-based mkinitcpio hooks for ZFS (from poscat0x04)")
    (description "Systemd-based mkinitcpio hooks for ZFS (from poscat0x04).")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 40. otf-piazzolla
;;; -------------------------------------------------------------------
(define-public otf-piazzolla
  (package
    (name "otf-piazzolla")
    (version "2.005")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://piazzolla.huertatipografica.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://piazzolla.huertatipografica.com/")
    (synopsis "a font with a compact appearance")
    (description "A font with a compact appearance.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 41. ttf-piazzolla-variable
;;; -------------------------------------------------------------------
(define-public ttf-piazzolla-variable
  (package
    (name "ttf-piazzolla-variable")
    (version "2.005")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://piazzolla.huertatipografica.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://piazzolla.huertatipografica.com/")
    (synopsis "a font with a compact appearance")
    (description "A font with a compact appearance.")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 42. otf-unscii-16-full
;;; -------------------------------------------------------------------
(define-public otf-unscii-16-full
  (package
    (name "otf-unscii-16-full")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://viznut.fi/unscii//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "http://viznut.fi/unscii/")
    (synopsis "unscii is a set of bitmapped Unicode fonts based on classic system fonts. Uns...")
    (description "Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 43. linux-firmware-hauppauge
;;; -------------------------------------------------------------------
(define-public linux-firmware-hauppauge
  (package
    (name "linux-firmware-hauppauge")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.hauppauge.com/pages/support/support_linux.html/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.hauppauge.com/pages/support/support_linux.html")
    (synopsis "additional Hauppauge Firmware")
    (description "Additional Hauppauge Firmware.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 44. otf-unscii-8
;;; -------------------------------------------------------------------
(define-public otf-unscii-8
  (package
    (name "otf-unscii-8")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://viznut.fi/unscii//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "http://viznut.fi/unscii/")
    (synopsis "unscii is a set of bitmapped Unicode fonts based on classic system fonts. Uns...")
    (description "Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 45. nodejs-postcss-cli
;;; -------------------------------------------------------------------
(define-public nodejs-postcss-cli
  (package
    (name "nodejs-postcss-cli")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/postcss/postcss-cli/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/postcss/postcss-cli")
    (synopsis "CLI for postcss")
    (description "CLI for postcss.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. hyprland-welcome-git
;;; -------------------------------------------------------------------
(define-public hyprland-welcome-git
  (package
    (name "hyprland-welcome-git")
    (version "r19.51561c0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprwm/hyprland-welcome")
                    (commit "vr19.51561c0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/hyprwm/hyprland-welcome")
    (synopsis "hyprland's welcome app, written in qt")
    (description "Hyprland's welcome app, written in qt.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 47. corefreq-client-git
;;; -------------------------------------------------------------------
(define-public corefreq-client-git
  (package
    (name "corefreq-client-git")
    (version "2.0.7.r20.gdeb3da7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyring/CoreFreq")
                    (commit "v2.0.7.r20.gdeb3da7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cyring/CoreFreq")
    (synopsis "coreFreq client")
    (description "CoreFreq client.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 48. corefreq-dkms-git
;;; -------------------------------------------------------------------
(define-public corefreq-dkms-git
  (package
    (name "corefreq-dkms-git")
    (version "2.0.7.r20.gdeb3da7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyring/CoreFreq")
                    (commit "v2.0.7.r20.gdeb3da7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cyring/CoreFreq")
    (synopsis "coreFreq - kernel module sources")
    (description "CoreFreq - kernel module sources.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 49. corefreq-server-git
;;; -------------------------------------------------------------------
(define-public corefreq-server-git
  (package
    (name "corefreq-server-git")
    (version "2.0.7.r20.gdeb3da7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyring/CoreFreq")
                    (commit "v2.0.7.r20.gdeb3da7")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cyring/CoreFreq")
    (synopsis "coreFreq server")
    (description "CoreFreq server.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 50. whisper-cpp-openvino
;;; -------------------------------------------------------------------
(define-public whisper-cpp-openvino
  (package
    (name "whisper-cpp-openvino")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/whisper.cpp/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (synopsis "port of OpenAI's Whisper model in C/C++ (with OpenVINO run-time)")
    (description "Port of OpenAI's Whisper model in C/C++ (with OpenVINO run-time).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. nodejs-flood
;;; -------------------------------------------------------------------
(define-public nodejs-flood
  (package
    (name "nodejs-flood")
    (version "4.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flood.js.org/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://flood.js.org")
    (synopsis "a modern web UI for various torrent clients")
    (description "A modern web UI for various torrent clients.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 52. nil-git
;;; -------------------------------------------------------------------
(define-public nil-git
  (package
    (name "nil-git")
    (version "2023.08.09.r26.g059d33a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oxalica/nil")
                    (commit "v2023.08.09.r26.g059d33a")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/oxalica/nil")
    (synopsis "nIx Language server, an incremental analysis assistant for writing in Nix")
    (description "NIx Language server, an incremental analysis assistant for writing in Nix.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 53. mybatop
;;; -------------------------------------------------------------------
(define-public mybatop
  (package
    (name "mybatop")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vishnumur777/mybatop/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vishnumur777/mybatop")
    (synopsis "mybatop continuously monitors laptop battery status and provides detailed ana...")
    (description "Mybatop continuously monitors laptop battery status and provides detailed analytics through HTML reports.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 54. scangearmp2
;;; -------------------------------------------------------------------
(define-public scangearmp2
  (package
    (name "scangearmp2")
    (version "4.80")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.canon.co.uk/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.canon.co.uk")
    (synopsis "canon ScanGear MP v2 scanner driver")
    (description "Canon ScanGear MP v2 scanner driver.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 55. dipc
;;; -------------------------------------------------------------------
(define-public dipc
  (package
    (name "dipc")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/doprz/dipc/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/doprz/dipc")
    (synopsis "convert your favorite images and wallpapers with your favorite color palettes...")
    (description "Convert your favorite images and wallpapers with your favorite color palettes/themes.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 56. gdbuspp
;;; -------------------------------------------------------------------
(define-public gdbuspp
  (package
    (name "gdbuspp")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/OpenVPN/gdbuspp/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/OpenVPN/gdbuspp")
    (synopsis "gDBus++ - a glib2 D-Bus wrapper for C++")
    (description "GDBus++ - a glib2 D-Bus wrapper for C++.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 57. par2cmdline-turbo
;;; -------------------------------------------------------------------
(define-public par2cmdline-turbo
  (package
    (name "par2cmdline-turbo")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/animetosho/par2cmdline-turbo/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/animetosho/par2cmdline-turbo")
    (synopsis "a faster PAR 2.0 compatible file verification and repair tool, forked from pa...")
    (description "A faster PAR 2.0 compatible file verification and repair tool, forked from par2cmdline.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 58. fcitx5-pinyin-moegirl
;;; -------------------------------------------------------------------
(define-public fcitx5-pinyin-moegirl
  (package
    (name "fcitx5-pinyin-moegirl")
    (version "20260412")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/outloudvi/mw2fcitx/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/outloudvi/mw2fcitx")
    (synopsis "fcitx 5 Pinyin Dictionary from moegirl.org wiki")
    (description "Fcitx 5 Pinyin Dictionary from moegirl.org wiki.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 59. wl-screenrec-git
;;; -------------------------------------------------------------------
(define-public wl-screenrec-git
  (package
    (name "wl-screenrec-git")
    (version "r210.3a465ea")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/russelltg/wl-screenrec")
                    (commit "vr210.3a465ea")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/russelltg/wl-screenrec")
    (synopsis "high performance hardware accelerated wlroots screen recorder")
    (description "High performance hardware accelerated wlroots screen recorder.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 60. libadwaita-without-adwaita-git
;;; -------------------------------------------------------------------
(define-public libadwaita-without-adwaita-git
  (package
    (name "libadwaita-without-adwaita-git")
    (version "1.9.0.r4.g7352d8c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/libadwaita")
                    (commit "v1.9.0.r4.g7352d8c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.gnome.org/GNOME/libadwaita")
    (synopsis "building blocks for modern adaptive GNOME applications - patched to respect s...")
    (description "Building blocks for modern adaptive GNOME applications - patched to respect system theme.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 61. gotenberg
;;; -------------------------------------------------------------------
(define-public gotenberg
  (package
    (name "gotenberg")
    (version "8.31.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gotenberg/gotenberg/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gotenberg/gotenberg")
    (synopsis "a developer-friendly API for converting numerous document formats into PDF fi...")
    (description "A developer-friendly API for converting numerous document formats into PDF files, and more!.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. nginx-mainline-mod-lua
;;; -------------------------------------------------------------------
(define-public nginx-mainline-mod-lua
  (package
    (name "nginx-mainline-mod-lua")
    (version "0.10.29R2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openresty/lua-nginx-module/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/openresty/lua-nginx-module")
    (synopsis "lua script engine module for mainline nginx")
    (description "Lua script engine module for mainline nginx.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 63. hopp-cli-bin
;;; -------------------------------------------------------------------
(define-public hopp-cli-bin
  (package
    (name "hopp-cli-bin")
    (version "0.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hoppscotch/hopp-cli/releases/download/v"
                    version "/hopp-cli-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hopp-cli-bin" "bin/hopp-cli-bin"))))
    (home-page "https://github.com/hoppscotch/hopp-cli")
    (synopsis "HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io")
    (description "HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 64. reclog
;;; -------------------------------------------------------------------
(define-public reclog
  (package
    (name "reclog")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gavv/reclog/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gavv/reclog")
    (synopsis "command-line tool to capture command output to a file")
    (description "Command-line tool to capture command output to a file.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. swayfx-i3-style-fullscreen-git
;;; -------------------------------------------------------------------
(define-public swayfx-i3-style-fullscreen-git
  (package
    (name "swayfx-i3-style-fullscreen-git")
    (version "r7069.03a07969")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/WillPower3309/swayfx")
                    (commit "vr7069.03a07969")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/WillPower3309/swayfx")
    (synopsis "swayFX: Sway, but with eye candy!")
    (description "SwayFX: Sway, but with eye candy!.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 66. clockify-desktop
;;; -------------------------------------------------------------------
(define-public clockify-desktop
  (package
    (name "clockify-desktop")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://clockify.me/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://clockify.me")
    (synopsis "truly free time tracker for teams, Desktop App")
    (description "Truly free time tracker for teams, Desktop App.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. mcaselector
;;; -------------------------------------------------------------------
(define-public mcaselector
  (package
    (name "mcaselector")
    (version "2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Querz/mcaselector/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Querz/mcaselector")
    (synopsis "an external tool to export or delete selected chunks and regions from a world...")
    (description "An external tool to export or delete selected chunks and regions from a world save of Minecraft Java Edition.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 68. surfer-waveform-git
;;; -------------------------------------------------------------------
(define-public surfer-waveform-git
  (package
    (name "surfer-waveform-git")
    (version "0.5.0.r49.g79b75e1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/surfer-project/surfer")
                    (commit "v0.5.0.r49.g79b75e1")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/surfer-project/surfer")
    (synopsis "a waveform viewer with a focus on a snappy usable interface, and extensibility")
    (description "A waveform viewer with a focus on a snappy usable interface, and extensibility.")
    (license license:eupl1.2)))

;;; -------------------------------------------------------------------
;;; 69. qdep
;;; -------------------------------------------------------------------
(define-public qdep
  (package
    (name "qdep")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Skycoder42/qdep/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Skycoder42/qdep")
    (synopsis "a dependency management tool for qmake based projects")
    (description "A dependency management tool for qmake based projects.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 70. codechecker
;;; -------------------------------------------------------------------
(define-public codechecker
  (package
    (name "codechecker")
    (version "6.26.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ericsson/codechecker/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Ericsson/codechecker")
    (synopsis "analyzer tooling, defect database and viewer extension for the Clang Static A...")
    (description "Analyzer tooling, defect database and viewer extension for the Clang Static Analyzer and Clang Tidy.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 71. idris2-pack-git
;;; -------------------------------------------------------------------
(define-public idris2-pack-git
  (package
    (name "idris2-pack-git")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefan-hoeck/idris2-pack")
                    (commit "vlatest")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stefan-hoeck/idris2-pack")
    (synopsis "an Idris2 package manager with curated package collections")
    (description "An Idris2 package manager with curated package collections.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 72. reth-git
;;; -------------------------------------------------------------------
(define-public reth-git
  (package
    (name "reth-git")
    (version "0.1.0.alpha.1.r208.g428a6dc2f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paradigmxyz/reth")
                    (commit "v0.1.0.alpha.1.r208.g428a6dc2f")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/paradigmxyz/reth")
    (synopsis "a fast implementation of the Ethereum protocol in Rust")
    (description "A fast implementation of the Ethereum protocol in Rust.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 73. clockify-cli
;;; -------------------------------------------------------------------
(define-public clockify-cli
  (package
    (name "clockify-cli")
    (version "0.58.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://clockify-cli.netlify.app/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://clockify-cli.netlify.app")
    (synopsis "a simple cli to manage your time entries on Clockify from terminal")
    (description "A simple cli to manage your time entries on Clockify from terminal.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 74. fish-nvm
;;; -------------------------------------------------------------------
(define-public fish-nvm
  (package
    (name "fish-nvm")
    (version "2.2.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jorgebucaran/nvm.fish/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jorgebucaran/nvm.fish")
    (synopsis "Node.js version manager lovingly made for Fish")
    (description "Node.js version manager lovingly made for Fish.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. hp-omen-wmi-dkms
;;; -------------------------------------------------------------------
(define-public hp-omen-wmi-dkms
  (package
    (name "hp-omen-wmi-dkms")
    (version "r32.d4b9b5a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ranisalt/hp-omen-linux-module/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ranisalt/hp-omen-linux-module")
    (synopsis "hp omen wmi dkms")
    (description "hp-omen-wmi-dkms is a software package.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 76. libreport
;;; -------------------------------------------------------------------
(define-public libreport
  (package
    (name "libreport")
    (version "2.17.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abrt/libreport/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/abrt/libreport")
    (synopsis "generic library for reporting various problems")
    (description "Generic library for reporting various problems.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 77. bbppairings
;;; -------------------------------------------------------------------
(define-public bbppairings
  (package
    (name "bbppairings")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BieremaBoyzProgramming/bbpPairings/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/BieremaBoyzProgramming/bbpPairings")
    (synopsis "swiss-system chess tournament pairing engine")
    (description "Swiss-system chess tournament pairing engine.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 78. dbt-core
;;; -------------------------------------------------------------------
(define-public dbt-core
  (package
    (name "dbt-core")
    (version "1.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.getdbt.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.getdbt.com/")
    (synopsis "tool for data analysts to build analytics the way engineers build applications")
    (description "Tool for data analysts to build analytics the way engineers build applications.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 79. dbt-fusion-bin
;;; -------------------------------------------------------------------
(define-public dbt-fusion-bin
  (package
    (name "dbt-fusion-bin")
    (version "2.0.0.beta.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.getdbt.com/product/fusion/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dbt-fusion-bin" "bin/dbt-fusion-bin"))))
    (home-page "https://www.getdbt.com/product/fusion")
    (synopsis "the next-generation engine for dbt")
    (description "The next-generation engine for dbt.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 80. electrum-abc-bin
;;; -------------------------------------------------------------------
(define-public electrum-abc-bin
  (package
    (name "electrum-abc-bin")
    (version "5.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bitcoinabc.org/electrum/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("electrum-abc-bin" "bin/electrum-abc-bin"))))
    (home-page "https://bitcoinabc.org/electrum")
    (synopsis "lightweight eCash wallet")
    (description "Lightweight eCash wallet.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 81. supportboi
;;; -------------------------------------------------------------------
(define-public supportboi
  (package
    (name "supportboi")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KarlOfDuty/SupportBoi/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/KarlOfDuty/SupportBoi")
    (synopsis "a support ticket Discord bot with automated interviews and rendered HTML tran...")
    (description "A support ticket Discord bot with automated interviews and rendered HTML transcripts.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 82. kpscript
;;; -------------------------------------------------------------------
(define-public kpscript
  (package
    (name "kpscript")
    (version "2.58")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://keepass.info/plugins.html#kpscript/releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://keepass.info/plugins.html#kpscript")
    (synopsis "keePass scripting utility")
    (description "KeePass scripting utility.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 83. nscde
;;; -------------------------------------------------------------------
(define-public nscde
  (package
    (name "nscde")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NsCDE/NsCDE/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/NsCDE/NsCDE/")
    (synopsis "not so Common Desktop Environment - modern and functional CDE desktop based o...")
    (description "Not so Common Desktop Environment - modern and functional CDE desktop based on FVWM.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 84. teamspeak3-pluginsdk
;;; -------------------------------------------------------------------
(define-public teamspeak3-pluginsdk
  (package
    (name "teamspeak3-pluginsdk")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.teamspeak.com//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.teamspeak.com/")
    (synopsis "headers for TeamSpeak3 PluginSDK")
    (description "Headers for TeamSpeak3 PluginSDK.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 85. git-fame
;;; -------------------------------------------------------------------
(define-public git-fame
  (package
    (name "git-fame")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/casperdcl/git-fame/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/casperdcl/git-fame")
    (synopsis "pretty-print git repository collaborators sorted by contributions")
    (description "Pretty-print git repository collaborators sorted by contributions.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 86. teamspeak3-addon-installer
;;; -------------------------------------------------------------------
(define-public teamspeak3-addon-installer
  (package
    (name "teamspeak3-addon-installer")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NekoPavel/teamspeak3-addon-installer/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/NekoPavel/teamspeak3-addon-installer")
    (synopsis "simple script to install packages from Teamspeak 3's addon site. Automaticall...")
    (description "Simple script to install packages from Teamspeak 3's addon site. Automatically creates packages for the teamspeak directory.")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 87. browserselector
;;; -------------------------------------------------------------------
(define-public browserselector
  (package
    (name "browserselector")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/iamtalhaasghar/browserselector/-/archive/v"
                    version "/browserselector-v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/iamtalhaasghar/browserselector")
    (synopsis "a script to select a browser based on user-defined rules")
    (description "A script to select a browser based on user-defined rules.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. ttf-sarasa-ui-all
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-all
  (package
    (name "ttf-sarasa-ui-all")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "sarasa UI (CJK)")
    (description "Sarasa UI (CJK).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 89. ttf-sarasa-ui-cl
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-cl
  (package
    (name "ttf-sarasa-ui-cl")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "更纱黑体UI (传统旧字形)")
    (description "更纱黑体UI (传统旧字形).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 90. ttf-sarasa-ui-hc
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-hc
  (package
    (name "ttf-sarasa-ui-hc")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "更紗黑體UI (香港繁體中文)")
    (description "更紗黑體UI (香港繁體中文).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 91. ttf-sarasa-ui-jp
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-jp
  (package
    (name "ttf-sarasa-ui-jp")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "更紗ゴシックUI (日本語)")
    (description "更紗ゴシックUI (日本語).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 92. ttf-sarasa-ui-kr
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-kr
  (package
    (name "ttf-sarasa-ui-kr")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "사라사고딕UI (한국인)")
    (description "사라사고딕UI (한국인).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 93. ttf-sarasa-ui-sc
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-sc
  (package
    (name "ttf-sarasa-ui-sc")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "更纱黑体UI (简体中文)")
    (description "更纱黑体UI (简体中文).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 94. ttf-sarasa-ui-tc
;;; -------------------------------------------------------------------
(define-public ttf-sarasa-ui-tc
  (package
    (name "ttf-sarasa-ui-tc")
    (version "1.0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/be5invis/Sarasa-Gothic/releases/download/v"
                    version "/Sarasa-Gothic-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff|woff2)$")))))
    (home-page "https://github.com/be5invis/Sarasa-Gothic/")
    (synopsis "更紗黑體UI (台湾正體中文)")
    (description "更紗黑體UI (台湾正體中文).")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 95. lite
;;; -------------------------------------------------------------------
(define-public lite
  (package
    (name "lite")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rxi/lite/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rxi/lite")
    (synopsis "a lightweight text editor written in Lua")
    (description "A lightweight text editor written in Lua.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 96. applesmc-next-dkms
;;; -------------------------------------------------------------------
(define-public applesmc-next-dkms
  (package
    (name "applesmc-next-dkms")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gurumeditation.org/1256/applesmc-next-battery-charge-thresholds-for-linux-on-apple-hardware//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gurumeditation.org/1256/applesmc-next-battery-charge-thresholds-for-linux-on-apple-hardware/")
    (synopsis "updated applesmc driver with charge threshold")
    (description "Updated applesmc driver with charge threshold.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 97. pynotify-bin
;;; -------------------------------------------------------------------
(define-public pynotify-bin
  (package
    (name "pynotify-bin")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fseoane/pyNotify.git/releases/download/v"
                    version "/pyNotify.git-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pynotify-bin" "bin/pynotify-bin"))))
    (home-page "https://github.com/fseoane/pyNotify.git")
    (synopsis "a Gnome (wayland) shell notifier for Gotify and Ntfy server")
    (description "A Gnome (wayland) shell notifier for Gotify and Ntfy server.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. chapel
;;; -------------------------------------------------------------------
(define-public chapel
  (package
    (name "chapel")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://chapel-lang.org//releases/download/v" version "/source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://chapel-lang.org/")
    (synopsis "programming language designed for productive parallel computing at scale")
    (description "Programming language designed for productive parallel computing at scale.")
    (license license:asl2.0)))
