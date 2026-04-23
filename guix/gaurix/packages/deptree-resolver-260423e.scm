;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423e
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  flutter-intellij-patch (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      2.  flutter-target-android (copy-build-system, v3.41.2, (list license:bsd-3 license:non-copyleft))
;;;      3.  distccd-alarm-armv7h (copy-build-system, v15.2.1.20260216, license:gpl3+)
;;;      4.  distccd-alarm-armv8 (copy-build-system, v15.2.1.20260216, license:gpl3+)
;;;      5.  firefox-userchromejs (copy-build-system, v150.0a1, license:mpl2.0)
;;;      6.  qcalc-bin (copy-build-system, v0.12.0, license:expat)
;;;      7.  sunwait (copy-build-system, v0.9.1, license:gpl3)
;;;      8.  sway-desktop-env-hook (copy-build-system, v1.1, license:gpl3)
;;;      9.  sway-desktop-unsupportedgpu-hook (copy-build-system, v1.1, license:gpl3)
;;;     10.  synology-hyper-backup-explorer (copy-build-system, v3.0.1.0156, license:non-copyleft)
;;;     11.  systemd-oomd-defaults (copy-build-system, v253.5, license:lgpl2.1)
;;;     12.  termide-bin (copy-build-system, v0.19.0, license:expat)
;;;     13.  tetrio-desktop (copy-build-system, v10.0.0, license:non-copyleft)
;;;     14.  thinkmorse (copy-build-system, v1.1.0, license:gpl3+)
;;;     15.  tremc (copy-build-system, v0.9.6, license:gpl3+)
;;;     16.  ttf-google-sans-code-vf (font-build-system, v6.001, license:silofl1.1)
;;;     17.  ttf-mac-fonts (font-build-system, v20100901.134, license:non-copyleft)
;;;     18.  tuxedo-drivers-dkms (copy-build-system, v4.22.1, license:gpl2+)
;;;     19.  unreal-tournament-data-archiveorg (copy-build-system, v436, license:non-copyleft)
;;;     20.  vesktop-spoof-pacman-hook (copy-build-system, v1.2, license:gpl3)
;;;     21.  virtualbox-ext-oracle (copy-build-system, v7.2.6, license:non-copyleft)
;;;     22.  waybar-weather (go-build-system, v0.3.0, license:expat)
;;;     23.  wps-office-mime-cn (copy-build-system, v12.1.2.25882, license:non-copyleft)
;;;     24.  wsdd2 (copy-build-system, v1.8.7, license:gpl3+)
;;;     25.  wsl2-ssh-agent (copy-build-system, v0.9.7, license:expat)
;;;     26.  xdg-ninja (copy-build-system, v0.2.0.2, license:expat)
;;;     27.  xr-hardware (copy-build-system, v1.1.1, license:non-copyleft)
;;;     28.  xtables-addons-dkms (copy-build-system, v3.30, license:gpl2)
;;;     29.  yt6801-dkms (copy-build-system, v1.0.31, license:gpl2+)
;;;     30.  zmx (copy-build-system, v0.4.2, license:expat)
;;;     31.  0ad-zh-lang (copy-build-system, va27.0, (list license:gpl2+ license:silofl1.1))
;;;     32.  8188eu-dkms-git (copy-build-system, v5.2.2.4.r838.f42fc9c, license:gpl2)
;;;     33.  amneziawg-dkms (copy-build-system, v1.0.20260329, license:non-copyleft)
;;;     34.  ananicy-cpp-s6 (copy-build-system, v20240920, license:non-copyleft)
;;;     35.  android-platform (copy-build-system, v37.0_r01, license:non-copyleft)
;;;     36.  android-platform-23 (copy-build-system, v6.0_r03, license:non-copyleft)
;;;     37.  apple-sf-script-extension-fonts (font-build-system, v6.0.1.1726709071, license:non-copyleft)
;;;     38.  archlinux-java-run (copy-build-system, v12, license:expat)
;;;     39.  atmosim (cmake-build-system, v2.4.1, license:gpl3+)
;;;     40.  awww-bin (copy-build-system, v0.11.2, license:gpl3+)
;;;     41.  bcachefs-kernel-dkms-git (copy-build-system, v20260302131047.6ebab1b41eda, license:gpl2)
;;;     42.  betterbird-bin (copy-build-system, v140.9.0esr, license:mpl2.0)
;;;     43.  betterbird-de-bin (copy-build-system, v140.9.0esr, license:mpl2.0)
;;;     44.  bleachbit-root (copy-build-system, v1.0.3, license:gpl3+)
;;;     45.  brother-hll2445dw-lpr-bin (copy-build-system, v4.1.0, license:gpl2)
;;;     46.  brscan5 (copy-build-system, v1.5.1_0, (list license:non-copyleft license:gpl3+))
;;;     47.  cheminot (copy-build-system, v2022.01.04, license:non-copyleft)
;;;     48.  cnijfilter2-g3010 (copy-build-system, v5.60, license:non-copyleft)
;;;     49.  code-marketplace (copy-build-system, v1.109.5, license:non-copyleft)
;;;     50.  code-server-marketplace (copy-build-system, v4.16.1, license:non-copyleft)
;;;     51.  com.qq.weixin.work.deepin (copy-build-system, v5.0.0.6008~spark2, license:non-copyleft)
;;;     52.  crepe-bin (copy-build-system, v0.2.2, license:expat)
;;;     53.  cubiomes-viewer (copy-build-system, v4.1.2, license:gpl3)
;;;     54.  ddcci-driver-linux-dkms-git (copy-build-system, v0.4.5.r6.g7f8f8e6, license:gpl2)
;;;     55.  decent-sampler-bin (copy-build-system, v1.21.2, license:non-copyleft)
;;;     56.  downgrade (copy-build-system, v12.0.1, license:gpl3+)
;;;     57.  dstl (cargo-build-system, v0.2.0, license:expat)
;;;     58.  echo-vn-bin (copy-build-system, v1.01, license:non-copyleft)
;;;     59.  emsdk (copy-build-system, v5.0.2, license:expat)
;;;     60.  epson-inkjet-printer-escpr2 (copy-build-system, v1.2.38, (list license:non-copyleft license:lgpl2.0))
;;;     61.  etcher-ng-bin (copy-build-system, v1.19.17, license:asl2.0)
;;;     62.  firefox-developer-edition-vencord-bin (copy-build-system, v1.14.7, license:gpl3)
;;;     63.  firefox-vencord-bin (copy-build-system, v1.14.7, license:gpl3)
;;;     64.  flclashx-git (gnu-build-system, v0.3.1, license:gpl3)
;;;     65.  flow-control-git (gnu-build-system, vr1908.5c84441, license:expat)
;;;     66.  fluent-cursor-theme-git (gnu-build-system, v2025.02.10.r1.g7d20e2d, license:gpl3+)
;;;     67.  flutter-material-fonts-google-bin (font-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;     68.  flutter-sky-engine-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;     69.  fnox-bin (copy-build-system, v1.20.0, license:expat)
;;;     70.  fresh-editor-bin (copy-build-system, v0.2.24, license:gpl2)
;;;     71.  game-devices-udev (copy-build-system, v0.25, license:expat)
;;;     72.  gde-creator-bin (copy-build-system, v1.0.5, license:expat)
;;;     73.  geekbench (copy-build-system, v6.7.0, license:non-copyleft)
;;;     74.  ghk-bin (copy-build-system, v1.0.3, license:expat)
;;;     75.  gnome-shell-extension-logo-menu (copy-build-system, v24.6, license:gpl2)
;;;     76.  gnome-shell-extension-tiling-assistant (copy-build-system, v54, license:gpl2+)
;;;     77.  google-cloud-cli (copy-build-system, v565.0.0, license:asl2.0)
;;;     78.  google-cloud-cli-bq (copy-build-system, v565.0.0, license:asl2.0)
;;;     79.  google-cloud-cli-bundled-python3-unix (copy-build-system, v565.0.0, license:asl2.0)
;;;     80.  google-cloud-cli-component-gke-gcloud-auth-plugin (copy-build-system, v565.0.0, license:asl2.0)
;;;     81.  google-cloud-cli-gsutil (copy-build-system, v565.0.0, license:asl2.0)
;;;     82.  gopreload-git (copy-build-system, vr59.21b08e6, license:gpl3+)
;;;     83.  gpd-fan-driver-dkms-git (copy-build-system, vr43.20251126.49bd324, license:gpl2+)
;;;     84.  grimaur-git (gnu-build-system, vr7.g88ebc08, license:non-copyleft)
;;;     85.  grpcurl (go-build-system, v1.9.3, license:expat)
;;;     86.  gruvbox-plus-icon-theme-git (gnu-build-system, v6.3.0.r2120.gd176a49, license:gpl3)
;;;     87.  heroic-games-launcher-bin (copy-build-system, v2.20.1, license:gpl3)
;;;     88.  hyprland-per-window-layout (cargo-build-system, v2.17, license:gpl3+)
;;;     89.  hypruler (cargo-build-system, v0.2.3, license:expat)
;;;     90.  i386-elf-binutils (copy-build-system, v2.45.1, license:gpl3+)
;;;     91.  keyd-openrc (copy-build-system, v2.5.0.r91.30434c9, license:expat)
;;;     92.  kohighlights (copy-build-system, v2.3.1.0, license:expat)
;;;     93.  kwin-karousel (copy-build-system, v0.16, license:gpl3+)
;;;     94.  lemonade-desktop (node-build-system, v10.2.0, license:asl2.0)
;;;     95.  lib32-opencl-nvidia-580xx (copy-build-system, v580.142, license:non-copyleft)
;;;     96.  libbit4opki (copy-build-system, v1.3.3.2, license:non-copyleft)
;;;     97.  libfprint-2-tod1-broadcom (copy-build-system, v5.15.010.0, license:non-copyleft)
;;;     98.  liboobs (copy-build-system, v3.0.0, license:gpl2)
;;;     99.  librewolf-vencord-bin (copy-build-system, v1.14.7, license:gpl3)
;;;    100.  ltex-ls-plus-bin (copy-build-system, v18.6.1, license:mpl2.0)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            flutter-intellij-patch
            flutter-target-android
            distccd-alarm-armv7h
            distccd-alarm-armv8
            firefox-userchromejs
            qcalc-bin
            sunwait
            sway-desktop-env-hook
            sway-desktop-unsupportedgpu-hook
            synology-hyper-backup-explorer
            systemd-oomd-defaults
            termide-bin
            tetrio-desktop
            thinkmorse
            tremc
            ttf-google-sans-code-vf
            ttf-mac-fonts
            tuxedo-drivers-dkms
            unreal-tournament-data-archiveorg
            vesktop-spoof-pacman-hook
            virtualbox-ext-oracle
            waybar-weather
            wps-office-mime-cn
            wsdd2
            wsl2-ssh-agent
            xdg-ninja
            xr-hardware
            xtables-addons-dkms
            yt6801-dkms
            zmx
            pkg-0ad-zh-lang
            pkg-8188eu-dkms-git
            amneziawg-dkms
            ananicy-cpp-s6
            android-platform
            android-platform-23
            apple-sf-script-extension-fonts
            archlinux-java-run
            atmosim
            awww-bin
            bcachefs-kernel-dkms-git
            betterbird-bin
            betterbird-de-bin
            bleachbit-root
            brother-hll2445dw-lpr-bin
            brscan5
            cheminot
            cnijfilter2-g3010
            code-marketplace
            code-server-marketplace
            com.qq.weixin.work.deepin
            crepe-bin
            cubiomes-viewer
            ddcci-driver-linux-dkms-git
            decent-sampler-bin
            downgrade
            dstl
            echo-vn-bin
            emsdk
            epson-inkjet-printer-escpr2
            etcher-ng-bin
            firefox-developer-edition-vencord-bin
            firefox-vencord-bin
            flclashx-git
            flow-control-git
            fluent-cursor-theme-git
            flutter-material-fonts-google-bin
            flutter-sky-engine-google-bin
            fnox-bin
            fresh-editor-bin
            game-devices-udev
            gde-creator-bin
            geekbench
            ghk-bin
            gnome-shell-extension-logo-menu
            gnome-shell-extension-tiling-assistant
            google-cloud-cli
            google-cloud-cli-bq
            google-cloud-cli-bundled-python3-unix
            google-cloud-cli-component-gke-gcloud-auth-plugin
            google-cloud-cli-gsutil
            gopreload-git
            gpd-fan-driver-dkms-git
            grimaur-git
            grpcurl
            gruvbox-plus-icon-theme-git
            heroic-games-launcher-bin
            hyprland-per-window-layout
            hypruler
            i386-elf-binutils
            keyd-openrc
            kohighlights
            kwin-karousel
            lemonade-desktop
            lib32-opencl-nvidia-580xx
            libbit4opki
            libfprint-2-tod1-broadcom
            liboobs
            librewolf-vencord-bin
            ltex-ls-plus-bin
            ))

;;; -------------------------------------------------------------------
;;; 5762. flutter-intellij-patch --- flutter SDK component - IntelliJ Flutter plugin hotfix
;;; -------------------------------------------------------------------
(define-public flutter-intellij-patch
  (package
    (name "flutter-intellij-patch")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - IntelliJ Flutter plugin hotfix")
    (description "Flutter SDK component - IntelliJ Flutter plugin hotfix.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 5761. flutter-target-android --- flutter SDK component - android target files
;;; -------------------------------------------------------------------
(define-public flutter-target-android
  (package
    (name "flutter-target-android")
    (version "3.41.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK component - android target files")
    (description "Flutter SDK component - android target files.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 17285. distccd-alarm-armv7h --- official toolchain for Arch ARM builds via distcc on x86_64 volunteers
;;; -------------------------------------------------------------------
(define-public distccd-alarm-armv7h
  (package
    (name "distccd-alarm-armv7h")
    (version "15.2.1.20260216")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/graysky2/distccd-alarm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official toolchain for Arch ARM builds via distcc on x86_64 volunteers")
    (description "Official toolchain for Arch ARM builds via distcc on x86_64 volunteers.")
    (home-page "https://github.com/graysky2/distccd-alarm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17286. distccd-alarm-armv8 --- official toolchain for Arch ARM builds via distcc on x86_64 volunteers
;;; -------------------------------------------------------------------
(define-public distccd-alarm-armv8
  (package
    (name "distccd-alarm-armv8")
    (version "15.2.1.20260216")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/graysky2/distccd-alarm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official toolchain for Arch ARM builds via distcc on x86_64 volunteers")
    (description "Official toolchain for Arch ARM builds via distcc on x86_64 volunteers.")
    (home-page "https://github.com/graysky2/distccd-alarm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17262. firefox-userchromejs --- patching Firefox to enable JS injection (userchrome-js)
;;; -------------------------------------------------------------------
(define-public firefox-userchromejs
  (package
    (name "firefox-userchromejs")
    (version "150.0a1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/onemen/TabMixPlus/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "patching Firefox to enable JS injection (userchrome-js)")
    (description "Patching Firefox to enable JS injection (userchrome-js).")
    (home-page "https://github.com/onemen/TabMixPlus")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17326. qcalc-bin --- quasar Calculator.(Prebuilt version.Use system-wide electron)
;;; -------------------------------------------------------------------
(define-public qcalc-bin
  (package
    (name "qcalc-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/from104/qcalc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quasar Calculator.(Prebuilt version.Use system-wide electron)")
    (description "Quasar Calculator.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/from104/qcalc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9527. sunwait --- calculate sunrise/sunset times with civil, nautical, astronomical and ...
;;; -------------------------------------------------------------------
(define-public sunwait
  (package
    (name "sunwait")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.risacher.org/sunwait/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "calculate sunrise/sunset times with civil, nautical, astronomical and custom ...")
    (description "Calculate sunrise/sunset times with civil, nautical, astronomical and custom twilights.")
    (home-page "https://www.risacher.org/sunwait/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15493. sway-desktop-env-hook --- adds XDG_CURRENT_DESKTOP, XDG_SESSION_DESKTOP and XDG_SESSION_TYPE def...
;;; -------------------------------------------------------------------
(define-public sway-desktop-env-hook
  (package
    (name "sway-desktop-env-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds XDG_CURRENT_DESKTOP, XDG_SESSION_DESKTOP and XDG_SESSION_TYPE definition...")
    (description "Adds XDG_CURRENT_DESKTOP, XDG_SESSION_DESKTOP and XDG_SESSION_TYPE definitions to sway.desktop!.")
    (home-page "https://aur.archlinux.org/packages/sway-desktop-env-hook")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15494. sway-desktop-unsupportedgpu-hook --- adds --unsupported-gpu to sway.desktop!
;;; -------------------------------------------------------------------
(define-public sway-desktop-unsupportedgpu-hook
  (package
    (name "sway-desktop-unsupportedgpu-hook")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds --unsupported-gpu to sway.desktop!")
    (description "Adds --unsupported-gpu to sway.desktop!.")
    (home-page "https://aur.archlinux.org/packages/sway-desktop-unsupportedgpu-hook")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8086. synology-hyper-backup-explorer --- a desktop tool for browsing, decrypting, and extracting different vers...
;;; -------------------------------------------------------------------
(define-public synology-hyper-backup-explorer
  (package
    (name "synology-hyper-backup-explorer")
    (version "3.0.1.0156")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.synology.com/en-global/releaseNote/HyperBackupExplorer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a desktop tool for browsing, decrypting, and extracting different versions of...")
    (description "A desktop tool for browsing, decrypting, and extracting different versions of backup data in Hyper Backup repositories.")
    (home-page "https://www.synology.com/en-global/releaseNote/HyperBackupExplorer")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7445. systemd-oomd-defaults --- configuration files for systemd-oomd
;;; -------------------------------------------------------------------
(define-public systemd-oomd-defaults
  (package
    (name "systemd-oomd-defaults")
    (version "253.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://src.fedoraproject.org/rpms/systemd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "configuration files for systemd-oomd")
    (description "Configuration files for systemd-oomd.")
    (home-page "https://src.fedoraproject.org/rpms/systemd")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 5542. termide-bin --- cross-platform terminal IDE, file manager and virtual terminal (binary...
;;; -------------------------------------------------------------------
(define-public termide-bin
  (package
    (name "termide-bin")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/termide/termide/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform terminal IDE, file manager and virtual terminal (binary release)")
    (description "Cross-platform terminal IDE, file manager and virtual terminal (binary release).")
    (home-page "https://github.com/termide/termide")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 992. tetrio-desktop --- tETR.IO desktop client
;;; -------------------------------------------------------------------
(define-public tetrio-desktop
  (package
    (name "tetrio-desktop")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tetr.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tETR.IO desktop client")
    (description "TETR.IO desktop client.")
    (home-page "https://tetr.io/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8489. thinkmorse --- a Bash script for blinking the ThinkPad lid LED in Morse code
;;; -------------------------------------------------------------------
(define-public thinkmorse
  (package
    (name "thinkmorse")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sr.ht/~fijarom/thinkmorse/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Bash script for blinking the ThinkPad lid LED in Morse code")
    (description "A Bash script for blinking the ThinkPad lid LED in Morse code.")
    (home-page "https://sr.ht/~fijarom/thinkmorse/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9492. tremc --- curses interface client for Transmission
;;; -------------------------------------------------------------------
(define-public tremc
  (package
    (name "tremc")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tremc/tremc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "curses interface client for Transmission")
    (description "Curses interface client for Transmission.")
    (home-page "https://github.com/tremc/tremc")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5708. ttf-google-sans-code-vf --- google Sans Code font family (Variable weight, TTF)
;;; -------------------------------------------------------------------
(define-public ttf-google-sans-code-vf
  (package
    (name "ttf-google-sans-code-vf")
    (version "6.001")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/googlefonts/googlesans-code/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Sans Code font family (Variable weight, TTF)")
    (description "Google Sans Code font family (Variable weight, TTF).")
    (home-page "https://github.com/googlefonts/googlesans-code")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 8473. ttf-mac-fonts --- mac fonts including Lucida Grande, Apple Garamond and other fonts from...
;;; -------------------------------------------------------------------
(define-public ttf-mac-fonts
  (package
    (name "ttf-mac-fonts")
    (version "20100901.134")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.apple.com/safari/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mac fonts including Lucida Grande, Apple Garamond and other fonts from Apple")
    (description "Mac fonts including Lucida Grande, Apple Garamond and other fonts from Apple.")
    (home-page "https://www.apple.com/safari/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11527. tuxedo-drivers-dkms --- tUXEDO Computers kernel module drivers for keyboard, keyboard backligh...
;;; -------------------------------------------------------------------
(define-public tuxedo-drivers-dkms
  (package
    (name "tuxedo-drivers-dkms")
    (version "4.22.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tUXEDO Computers kernel module drivers for keyboard, keyboard backlight & gen...")
    (description "TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface.")
    (home-page "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 3518. unreal-tournament-data-archiveorg --- unreal Tournament 99 (GOTY) data from Archive.org ISO
;;; -------------------------------------------------------------------
(define-public unreal-tournament-data-archiveorg
  (package
    (name "unreal-tournament-data-archiveorg")
    (version "436")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://archive.org/details/ut-goty/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unreal Tournament 99 (GOTY) data from Archive.org ISO")
    (description "Unreal Tournament 99 (GOTY) data from Archive.org ISO.")
    (home-page "https://archive.org/details/ut-goty")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15505. vesktop-spoof-pacman-hook --- adds '--user-agent-os windows' to the desktop file after vesktop updat...
;;; -------------------------------------------------------------------
(define-public vesktop-spoof-pacman-hook
  (package
    (name "vesktop-spoof-pacman-hook")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds '--user-agent-os windows' to the desktop file after vesktop updates, for...")
    (description "Adds '--user-agent-os windows' to the desktop file after vesktop updates, for those using VPNs being blocked by Discord's recent Linux VPN bans!.")
    (home-page "https://aur.archlinux.org/packages/vesktop-spoof-pacman-hook")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1888. virtualbox-ext-oracle --- oracle VM VirtualBox Extension Pack
;;; -------------------------------------------------------------------
(define-public virtualbox-ext-oracle
  (package
    (name "virtualbox-ext-oracle")
    (version "7.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.virtualbox.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oracle VM VirtualBox Extension Pack")
    (description "Oracle VM VirtualBox Extension Pack.")
    (home-page "https://www.virtualbox.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8491. waybar-weather --- a waybar weather module with automatic geolocation lookup
;;; -------------------------------------------------------------------
(define-public waybar-weather
  (package
    (name "waybar-weather")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/wneessen/waybar-weather/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/wneessen/waybar-weather"))
    (synopsis "a waybar weather module with automatic geolocation lookup")
    (description "A waybar weather module with automatic geolocation lookup.")
    (home-page "https://github.com/wneessen/waybar-weather")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 163. wps-office-mime-cn --- mime files provided by Kingsoft Office (WPS Office) cn version
;;; -------------------------------------------------------------------
(define-public wps-office-mime-cn
  (package
    (name "wps-office-mime-cn")
    (version "12.1.2.25882")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://linux.wps.cn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mime files provided by Kingsoft Office (WPS Office) cn version")
    (description "Mime files provided by Kingsoft Office (WPS Office) cn version.")
    (home-page "https://linux.wps.cn")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 725. wsdd2 --- wSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shar...
;;; -------------------------------------------------------------------
(define-public wsdd2
  (package
    (name "wsdd2")
    (version "1.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Netgear/wsdd2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares disc...")
    (description "WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts.")
    (home-page "https://github.com/Netgear/wsdd2")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8399. wsl2-ssh-agent --- a bridge from WSL2 ssh client to Windows ssh-agent.exe service
;;; -------------------------------------------------------------------
(define-public wsl2-ssh-agent
  (package
    (name "wsl2-ssh-agent")
    (version "0.9.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mame/wsl2-ssh-agent/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a bridge from WSL2 ssh client to Windows ssh-agent.exe service")
    (description "A bridge from WSL2 ssh client to Windows ssh-agent.exe service.")
    (home-page "https://github.com/mame/wsl2-ssh-agent")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2301. xdg-ninja --- a shell script which checks your $HOME for unwanted files and director...
;;; -------------------------------------------------------------------
(define-public xdg-ninja
  (package
    (name "xdg-ninja")
    (version "0.2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/b3nj5m1n/xdg-ninja/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a shell script which checks your $HOME for unwanted files and directories")
    (description "A shell script which checks your $HOME for unwanted files and directories.")
    (home-page "https://github.com/b3nj5m1n/xdg-ninja")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1642. xr-hardware --- udev rules for accessing XR (VR and AR) hardware devices
;;; -------------------------------------------------------------------
(define-public xr-hardware
  (package
    (name "xr-hardware")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.freedesktop.org/monado/utilities/xr-hardware/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rules for accessing XR (VR and AR) hardware devices")
    (description "Udev rules for accessing XR (VR and AR) hardware devices.")
    (home-page "https://gitlab.freedesktop.org/monado/utilities/xr-hardware/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16501. xtables-addons-dkms --- dKMS for additional extensions for Xtables packet filter present in th...
;;; -------------------------------------------------------------------
(define-public xtables-addons-dkms
  (package
    (name "xtables-addons-dkms")
    (version "3.30")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://inai.de/projects/xtables-addons/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dKMS for additional extensions for Xtables packet filter present in the Linux...")
    (description "DKMS for additional extensions for Xtables packet filter present in the Linux kernel.")
    (home-page "https://inai.de/projects/xtables-addons/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8641. yt6801-dkms --- kernel module for Motorcomm YT6801 ethernet controller (DKMS)
;;; -------------------------------------------------------------------
(define-public yt6801-dkms
  (package
    (name "yt6801-dkms")
    (version "1.0.31")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.motor-comm.com/product/ethernet-control-chip/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for Motorcomm YT6801 ethernet controller (DKMS)")
    (description "Kernel module for Motorcomm YT6801 ethernet controller (DKMS).")
    (home-page "https://www.motor-comm.com/product/ethernet-control-chip")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2284. zmx --- session persistence for terminal processes
;;; -------------------------------------------------------------------
(define-public zmx
  (package
    (name "zmx")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://zmx.sh/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "session persistence for terminal processes")
    (description "Session persistence for terminal processes.")
    (home-page "https://zmx.sh/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8404. 0ad-zh-lang --- chinese Fonts and Translations For 0ad
;;; -------------------------------------------------------------------
(define-public pkg-0ad-zh-lang
  (package
    (name "0ad-zh-lang")
    (version "a27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://play0ad.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "chinese Fonts and Translations For 0ad")
    (description "Chinese Fonts and Translations For 0ad.")
    (home-page "https://play0ad.com/")
    (license (list license:gpl2+ license:silofl1.1))))

;;; -------------------------------------------------------------------
;;; 16289. 8188eu-dkms-git --- standalone driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN
;;; -------------------------------------------------------------------
(define-public pkg-8188eu-dkms-git
  (package
    (name "8188eu-dkms-git")
    (version "5.2.2.4.r838.f42fc9c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lwfinger/rtl8188eu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN")
    (description "Standalone driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN.")
    (home-page "https://github.com/lwfinger/rtl8188eu")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 1653. amneziawg-dkms --- amneziaWG is a contemporary version of the popular VPN protocol, WireG...
;;; -------------------------------------------------------------------
(define-public amneziawg-dkms
  (package
    (name "amneziawg-dkms")
    (version "1.0.20260329")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "amneziaWG is a contemporary version of the popular VPN protocol, WireGuard")
    (description "AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard.")
    (home-page "https://github.com/amnezia-vpn/amneziawg-linux-kernel-module")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16598. ananicy-cpp-s6 --- s6-rc service scripts for ananicy-cpp
;;; -------------------------------------------------------------------
(define-public ananicy-cpp-s6
  (package
    (name "ananicy-cpp-s6")
    (version "20240920")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unknown/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "s6-rc service scripts for ananicy-cpp")
    (description "S6-rc service scripts for ananicy-cpp.")
    (home-page "https://aur.archlinux.org/packages/ananicy-cpp-s6")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8355. android-platform --- android SDK Platform, latest API
;;; -------------------------------------------------------------------
(define-public android-platform
  (package
    (name "android-platform")
    (version "37.0_r01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://developer.android.com/sdk/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android SDK Platform, latest API")
    (description "Android SDK Platform, latest API.")
    (home-page "http://developer.android.com/sdk/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 22944. android-platform-23 --- android SDK Platform, API-23
;;; -------------------------------------------------------------------
(define-public android-platform-23
  (package
    (name "android-platform-23")
    (version "6.0_r03")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://developer.android.com/sdk/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android SDK Platform, API-23")
    (description "Android SDK Platform, API-23.")
    (home-page "http://developer.android.com/sdk/index.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8455. apple-sf-script-extension-fonts --- apple SF Script Extensions, including SF Arabic, SF Armenian, SF Georg...
;;; -------------------------------------------------------------------
(define-public apple-sf-script-extension-fonts
  (package
    (name "apple-sf-script-extension-fonts")
    (version "6.0.1.1726709071")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.apple.com/fonts/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apple SF Script Extensions, including SF Arabic, SF Armenian, SF Georgian, an...")
    (description "Apple SF Script Extensions, including SF Arabic, SF Armenian, SF Georgian, and SF Hebrew.")
    (home-page "https://developer.apple.com/fonts/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12875. archlinux-java-run --- java Application Launcher for Arch Linux
;;; -------------------------------------------------------------------
(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/michaellass/archlinux-java-run/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "java Application Launcher for Arch Linux")
    (description "Java Application Launcher for Arch Linux.")
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7928. atmosim --- a CLI maxcap calculator for Space Station 14
;;; -------------------------------------------------------------------
(define-public atmosim
  (package
    (name "atmosim")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Ilya246/atmosim/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a CLI maxcap calculator for Space Station 14")
    (description "A CLI maxcap calculator for Space Station 14.")
    (home-page "https://github.com/Ilya246/atmosim")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 2278. awww-bin --- pre-compiled binary of awww, wallpaper daemon for Wayland
;;; -------------------------------------------------------------------
(define-public awww-bin
  (package
    (name "awww-bin")
    (version "0.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/LGFae/awww/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pre-compiled binary of awww, wallpaper daemon for Wayland")
    (description "Pre-compiled binary of awww, wallpaper daemon for Wayland.")
    (home-page "https://codeberg.org/LGFae/awww")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12139. bcachefs-kernel-dkms-git --- bcachefs DKMS module from upstream bcachefs kernel sources
;;; -------------------------------------------------------------------
(define-public bcachefs-kernel-dkms-git
  (package
    (name "bcachefs-kernel-dkms-git")
    (version "20260302131047.6ebab1b41eda")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koverstreet/bcachefs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bcachefs DKMS module from upstream bcachefs kernel sources")
    (description "Bcachefs DKMS module from upstream bcachefs kernel sources.")
    (home-page "https://github.com/koverstreet/bcachefs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 11324. betterbird-bin --- eN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Th...
;;; -------------------------------------------------------------------
(define-public betterbird-bin
  (package
    (name "betterbird-bin")
    (version "140.9.0esr")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.betterbird.eu/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbi...")
    (description "EN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.")
    (home-page "https://www.betterbird.eu/index.html")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 1331. betterbird-de-bin --- gERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, T...
;;; -------------------------------------------------------------------
(define-public betterbird-de-bin
  (package
    (name "betterbird-de-bin")
    (version "140.9.0esr")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.betterbird.eu/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderb...")
    (description "GERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.")
    (home-page "https://www.betterbird.eu/index.html")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 8434. bleachbit-root --- run bleachbit as root for cleaning system files
;;; -------------------------------------------------------------------
(define-public bleachbit-root
  (package
    (name "bleachbit-root")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bleachbit.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run bleachbit as root for cleaning system files")
    (description "Run bleachbit as root for cleaning system files.")
    (home-page "https://www.bleachbit.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7893. brother-hll2445dw-lpr-bin --- lPR driver for Brother HL-L2445DW printer
;;; -------------------------------------------------------------------
(define-public brother-hll2445dw-lpr-bin
  (package
    (name "brother-hll2445dw-lpr-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=hll2445dw_eu_as/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lPR driver for Brother HL-L2445DW printer")
    (description "LPR driver for Brother HL-L2445DW printer.")
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=hll2445dw_eu_as")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2292. brscan5 --- sANE drivers from Brother for compatible models
;;; -------------------------------------------------------------------
(define-public brscan5
  (package
    (name "brscan5")
    (version "1.5.1_0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://support.brother.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sANE drivers from Brother for compatible models")
    (description "SANE drivers from Brother for compatible models.")
    (home-page "http://support.brother.com")
    (license (list license:non-copyleft license:gpl3+))))

;;; -------------------------------------------------------------------
;;; 5970. cheminot --- application de gestion d'horaire de l'ETS (license unknown)
;;; -------------------------------------------------------------------
(define-public cheminot
  (package
    (name "cheminot")
    (version "2022.01.04")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cheminotjws.etsmtl.ca/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application de gestion d'horaire de l'ETS (license unknown)")
    (description "Application de gestion d'horaire de l'ETS (license unknown).")
    (home-page "https://cheminotjws.etsmtl.ca/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5926. cnijfilter2-g3010 --- canon InkJet Printer Driver, PIXMA G3010 series (PIXMA G3410, PIXMA G3...
;;; -------------------------------------------------------------------
(define-public cnijfilter2-g3010
  (package
    (name "cnijfilter2-g3010")
    (version "5.60")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://th.canon/en/support/PIXMA%20G3010/model/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "canon InkJet Printer Driver, PIXMA G3010 series (PIXMA G3410, PIXMA G3411, PI...")
    (description "Canon InkJet Printer Driver, PIXMA G3010 series (PIXMA G3410, PIXMA G3411, PIXMA G3415, PIXMA G3510, PIXMA G3515, PIXMA G4410, PIXMA G4411, PIXMA G4510, PIXMA G4511).")
    (home-page "https://th.canon/en/support/PIXMA%20G3010/model")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1884. code-marketplace --- enable vscode marketplace in Code OSS
;;; -------------------------------------------------------------------
(define-public code-marketplace
  (package
    (name "code-marketplace")
    (version "1.109.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://marketplace.visualstudio.com/vscode/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable vscode marketplace in Code OSS")
    (description "Enable vscode marketplace in Code OSS.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15031. code-server-marketplace --- enable vscode marketplace in code-server
;;; -------------------------------------------------------------------
(define-public code-server-marketplace
  (package
    (name "code-server-marketplace")
    (version "4.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://marketplace.visualstudio.com/vscode/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enable vscode marketplace in code-server")
    (description "Enable vscode marketplace in code-server.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15919. com.qq.weixin.work.deepin --- deepin Wine 版企业微信 | Deepin-wine Wecom
;;; -------------------------------------------------------------------
(define-public com.qq.weixin.work.deepin
  (package
    (name "com.qq.weixin.work.deepin")
    (version "5.0.0.6008~spark2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "deepin Wine 版企业微信 | Deepin-wine Wecom")
    (description "Deepin Wine 版企业微信 | Deepin-wine Wecom.")
    (home-page "https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5937. crepe-bin --- a grep-like text search tool that highlights matches instead of filter...
;;; -------------------------------------------------------------------
(define-public crepe-bin
  (package
    (name "crepe-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/brunoribeiro/crepe/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a grep-like text search tool that highlights matches instead of filtering lines")
    (description "A grep-like text search tool that highlights matches instead of filtering lines.")
    (home-page "https://github.com/brunoribeiro/crepe")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8446. cubiomes-viewer --- an efficient graphical Minecraft seed finder and map viewer
;;; -------------------------------------------------------------------
(define-public cubiomes-viewer
  (package
    (name "cubiomes-viewer")
    (version "4.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Cubitect/cubiomes-viewer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an efficient graphical Minecraft seed finder and map viewer")
    (description "An efficient graphical Minecraft seed finder and map viewer.")
    (home-page "https://github.com/Cubitect/cubiomes-viewer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15757. ddcci-driver-linux-dkms-git --- a pair of Linux kernel drivers for DDC/CI monitors (DKMS) - git versio...
;;; -------------------------------------------------------------------
(define-public ddcci-driver-linux-dkms-git
  (package
    (name "ddcci-driver-linux-dkms-git")
    (version "0.4.5.r6.g7f8f8e6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a pair of Linux kernel drivers for DDC/CI monitors (DKMS) - git version")
    (description "A pair of Linux kernel drivers for DDC/CI monitors (DKMS) - git version.")
    (home-page "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7079. decent-sampler-bin --- a sampling plugin that allows you to play samples in the Decent Sample...
;;; -------------------------------------------------------------------
(define-public decent-sampler-bin
  (package
    (name "decent-sampler-bin")
    (version "1.21.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.decentsamples.com/product/decent-sampler-plugin/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sampling plugin that allows you to play samples in the Decent Sampler format")
    (description "A sampling plugin that allows you to play samples in the Decent Sampler format.")
    (home-page "https://www.decentsamples.com/product/decent-sampler-plugin/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11328. downgrade --- bash script for downgrading one or more packages to a version in your ...
;;; -------------------------------------------------------------------
(define-public downgrade
  (package
    (name "downgrade")
    (version "12.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/archlinux-downgrade/downgrade/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bash script for downgrading one or more packages to a version in your cache o...")
    (description "Bash script for downgrading one or more packages to a version in your cache or the A.L.A.")
    (home-page "https://github.com/archlinux-downgrade/downgrade")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5963. dstl --- a fast, keyboard-driven TUI application launcher with fuzzy search
;;; -------------------------------------------------------------------
(define-public dstl
  (package
    (name "dstl")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/saltnpepper97/dstl/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, keyboard-driven TUI application launcher with fuzzy search")
    (description "A fast, keyboard-driven TUI application launcher with fuzzy search.")
    (home-page "https://github.com/saltnpepper97/dstl")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7151. echo-vn-bin --- a horror visual novel about a small, isolated, desert town located som...
;;; -------------------------------------------------------------------
(define-public echo-vn-bin
  (package
    (name "echo-vn-bin")
    (version "1.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://echoproject.itch.io/echo/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a horror visual novel about a small, isolated, desert town located somewhere ...")
    (description "A horror visual novel about a small, isolated, desert town located somewhere in the southwestern states. (bundled Ren'Py).")
    (home-page "https://echoproject.itch.io/echo")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1810. emsdk --- the Emscripten SDK
;;; -------------------------------------------------------------------
(define-public emsdk
  (package
    (name "emsdk")
    (version "5.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/emscripten-core/emsdk/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Emscripten SDK")
    (description "The Emscripten SDK.")
    (home-page "https://github.com/emscripten-core/emsdk")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1825. epson-inkjet-printer-escpr2 --- epson Inkjet Printer Driver 2 (ESC/P-R) for Linux
;;; -------------------------------------------------------------------
(define-public epson-inkjet-printer-escpr2
  (package
    (name "epson-inkjet-printer-escpr2")
    (version "1.2.38")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "epson Inkjet Printer Driver 2 (ESC/P-R) for Linux")
    (description "Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux.")
    (home-page "https://support.epson.net/linux/Printer/LSB_distribution_pages/en/escpr2.php")
    (license (list license:non-copyleft license:lgpl2.0))))

;;; -------------------------------------------------------------------
;;; 17273. etcher-ng-bin --- flash OS images to SD cards & USB drives, safely and easily - Custom, ...
;;; -------------------------------------------------------------------
(define-public etcher-ng-bin
  (package
    (name "etcher-ng-bin")
    (version "1.19.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Alex313031/etcher-ng/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flash OS images to SD cards & USB drives, safely and easily - Custom, debloated")
    (description "Flash OS images to SD cards & USB drives, safely and easily - Custom, debloated.")
    (home-page "https://github.com/Alex313031/etcher-ng")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8439. firefox-developer-edition-vencord-bin --- the cutest Discord client mod
;;; -------------------------------------------------------------------
(define-public firefox-developer-edition-vencord-bin
  (package
    (name "firefox-developer-edition-vencord-bin")
    (version "1.14.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://vencord.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest Discord client mod")
    (description "The cutest Discord client mod.")
    (home-page "https://vencord.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8438. firefox-vencord-bin --- the cutest Discord client mod
;;; -------------------------------------------------------------------
(define-public firefox-vencord-bin
  (package
    (name "firefox-vencord-bin")
    (version "1.14.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://vencord.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest Discord client mod")
    (description "The cutest Discord client mod.")
    (home-page "https://vencord.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8465. flclashx-git --- [Pre-release] Fork of FlClash | A multi-platform proxy client based on...
;;; -------------------------------------------------------------------
(define-public flclashx-git
  (package
    (name "flclashx-git")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pluralplay/FlClashX")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "[Pre-release] Fork of FlClash | A multi-platform proxy client based on ClashM...")
    (description "[Pre-release] Fork of FlClash | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free.")
    (home-page "https://github.com/pluralplay/FlClashX")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8034. flow-control-git --- a programmer's text editor
;;; -------------------------------------------------------------------
(define-public flow-control-git
  (package
    (name "flow-control-git")
    (version "r1908.5c84441")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neurocyte/flow")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a programmer's text editor")
    (description "A programmer's text editor.")
    (home-page "https://github.com/neurocyte/flow")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8824. fluent-cursor-theme-git --- an x-cursor theme inspired by Qogir theme and based on capitaine-curso...
;;; -------------------------------------------------------------------
(define-public fluent-cursor-theme-git
  (package
    (name "fluent-cursor-theme-git")
    (version "2025.02.10.r1.g7d20e2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinceliuice/Fluent-icon-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "an x-cursor theme inspired by Qogir theme and based on capitaine-cursors")
    (description "An x-cursor theme inspired by Qogir theme and based on capitaine-cursors.")
    (home-page "https://github.com/vinceliuice/Fluent-icon-theme")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8153. flutter-material-fonts-google-bin --- flutter SDK artifacts (binary from Google) - material fonts
;;; -------------------------------------------------------------------
(define-public flutter-material-fonts-google-bin
  (package
    (name "flutter-material-fonts-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - material fonts")
    (description "Flutter SDK artifacts (binary from Google) - material fonts.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 8152. flutter-sky-engine-google-bin --- flutter SDK artifacts (binary from Google) - sky-engine
;;; -------------------------------------------------------------------
(define-public flutter-sky-engine-google-bin
  (package
    (name "flutter-sky-engine-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - sky-engine")
    (description "Flutter SDK artifacts (binary from Google) - sky-engine.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 6015. fnox-bin --- fort Knox for your secrets
;;; -------------------------------------------------------------------
(define-public fnox-bin
  (package
    (name "fnox-bin")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jdx/fnox/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fort Knox for your secrets")
    (description "Fort Knox for your secrets.")
    (home-page "https://github.com/jdx/fnox")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2229. fresh-editor-bin --- a lightweight, fast terminal-based text editor with LSP support and Ty...
;;; -------------------------------------------------------------------
(define-public fresh-editor-bin
  (package
    (name "fresh-editor-bin")
    (version "0.2.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sinelaw.github.io/fresh/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight, fast terminal-based text editor with LSP support and TypeScrip...")
    (description "A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins.")
    (home-page "https://sinelaw.github.io/fresh/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2276. game-devices-udev --- udev rules for controllers
;;; -------------------------------------------------------------------
(define-public game-devices-udev
  (package
    (name "game-devices-udev")
    (version "0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/fabiscafe/game-devices-udev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "udev rules for controllers")
    (description "Udev rules for controllers.")
    (home-page "https://codeberg.org/fabiscafe/game-devices-udev")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7867. gde-creator-bin --- gDE-Creator is a modern CLI tool that automatically search steam datab...
;;; -------------------------------------------------------------------
(define-public gde-creator-bin
  (package
    (name "gde-creator-bin")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gmzr0/gde-creator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gDE-Creator is a modern CLI tool that automatically search steam database, fe...")
    (description "GDE-Creator is a modern CLI tool that automatically search steam database, fetch name and icons and generate compliant .desktop file in your Linux system.")
    (home-page "https://github.com/gmzr0/gde-creator")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6022. geekbench --- a cross-platform benchmark that measures processor and memory performa...
;;; -------------------------------------------------------------------
(define-public geekbench
  (package
    (name "geekbench")
    (version "6.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.geekbench.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform benchmark that measures processor and memory performance")
    (description "A cross-platform benchmark that measures processor and memory performance.")
    (home-page "https://www.geekbench.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5579. ghk-bin --- gitHub helper — push code with ease
;;; -------------------------------------------------------------------
(define-public ghk-bin
  (package
    (name "ghk-bin")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bymehul/ghk/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gitHub helper — push code with ease")
    (description "GitHub helper — push code with ease.")
    (home-page "https://github.com/bymehul/ghk")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5888. gnome-shell-extension-logo-menu --- quick access menu for the GNOME panel that help ease the workflow for ...
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-logo-menu
  (package
    (name "gnome-shell-extension-logo-menu")
    (version "24.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Aryan20/Logomenu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quick access menu for the GNOME panel that help ease the workflow for newcome...")
    (description "Quick access menu for the GNOME panel that help ease the workflow for newcomers and power users alike.")
    (home-page "https://github.com/Aryan20/Logomenu")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5731. gnome-shell-extension-tiling-assistant --- a GNOME Shell extension which adds a Windows-like snap assist to the G...
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-tiling-assistant
  (package
    (name "gnome-shell-extension-tiling-assistant")
    (version "54")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Leleat/Tiling-Assistant/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GNOME Shell extension which adds a Windows-like snap assist to the GNOME de...")
    (description "A GNOME Shell extension which adds a Windows-like snap assist to the GNOME desktop.")
    (home-page "https://github.com/Leleat/Tiling-Assistant")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 1859. google-cloud-cli --- a core set of command-line tools for the Google Cloud Platform. Includ...
;;; -------------------------------------------------------------------
(define-public google-cloud-cli
  (package
    (name "google-cloud-cli")
    (version "565.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cloud.google.com/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a core set of command-line tools for the Google Cloud Platform. Includes only...")
    (description "A core set of command-line tools for the Google Cloud Platform. Includes only gcloud core (with beta and alpha commands), gcloud-crc32c and man pages.")
    (home-page "https://cloud.google.com/cli/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1858. google-cloud-cli-bq --- bigQuery Command Line Tool
;;; -------------------------------------------------------------------
(define-public google-cloud-cli-bq
  (package
    (name "google-cloud-cli-bq")
    (version "565.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cloud.google.com/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bigQuery Command Line Tool")
    (description "BigQuery Command Line Tool.")
    (home-page "https://cloud.google.com/cli/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1857. google-cloud-cli-bundled-python3-unix --- gcloud Bundled Python 3.12
;;; -------------------------------------------------------------------
(define-public google-cloud-cli-bundled-python3-unix
  (package
    (name "google-cloud-cli-bundled-python3-unix")
    (version "565.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cloud.google.com/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gcloud Bundled Python 3.12")
    (description "Gcloud Bundled Python 3.12.")
    (home-page "https://cloud.google.com/cli/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1856. google-cloud-cli-component-gke-gcloud-auth-plugin --- gke-gcloud-auth-plugin
;;; -------------------------------------------------------------------
(define-public google-cloud-cli-component-gke-gcloud-auth-plugin
  (package
    (name "google-cloud-cli-component-gke-gcloud-auth-plugin")
    (version "565.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cloud.google.com/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gke-gcloud-auth-plugin")
    (description "Gke-gcloud-auth-plugin.")
    (home-page "https://cloud.google.com/cli/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1855. google-cloud-cli-gsutil --- cloud Storage Command Line Tool: gsutil is not the recommended CLI for...
;;; -------------------------------------------------------------------
(define-public google-cloud-cli-gsutil
  (package
    (name "google-cloud-cli-gsutil")
    (version "565.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cloud.google.com/cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cloud Storage Command Line Tool: gsutil is not the recommended CLI for Cloud ...")
    (description "Cloud Storage Command Line Tool: gsutil is not the recommended CLI for Cloud Storage.")
    (home-page "https://cloud.google.com/cli/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7138. gopreload-git --- preloads files needed for given programs
;;; -------------------------------------------------------------------
(define-public gopreload-git
  (package
    (name "gopreload-git")
    (version "r59.21b08e6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://forums.gentoo.org/viewtopic-t-622085-highlight-preload.html")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "preloads files needed for given programs")
    (description "Preloads files needed for given programs.")
    (home-page "http://forums.gentoo.org/viewtopic-t-622085-highlight-preload.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16130. gpd-fan-driver-dkms-git --- fan hwmon speed report and speed control driver for GPD Win Mini, GPD ...
;;; -------------------------------------------------------------------
(define-public gpd-fan-driver-dkms-git
  (package
    (name "gpd-fan-driver-dkms-git")
    (version "r43.20251126.49bd324")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cryolitia/gpd-fan-driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fan hwmon speed report and speed control driver for GPD Win Mini, GPD Win Max...")
    (description "Fan hwmon speed report and speed control driver for GPD Win Mini, GPD Win Max2 and GPD Win 4 laptops. Latest git checkout. Includes a command line control utility.")
    (home-page "https://github.com/Cryolitia/gpd-fan-driver")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 5781. grimaur-git --- lightweight AUR helper that uses the official AUR git mirror
;;; -------------------------------------------------------------------
(define-public grimaur-git
  (package
    (name "grimaur-git")
    (version "r7.g88ebc08")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ryk4rd/grimaur")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "lightweight AUR helper that uses the official AUR git mirror")
    (description "Lightweight AUR helper that uses the official AUR git mirror.")
    (home-page "https://github.com/ryk4rd/grimaur")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8407. grpcurl --- like cURL, but for gRPC: Command-line tool for interacting with gRPC s...
;;; -------------------------------------------------------------------
(define-public grpcurl
  (package
    (name "grpcurl")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fullstorydev/grpcurl/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/fullstorydev/grpcurl"))
    (synopsis "like cURL, but for gRPC: Command-line tool for interacting with gRPC servers")
    (description "Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers.")
    (home-page "https://github.com/fullstorydev/grpcurl")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8111. gruvbox-plus-icon-theme-git --- icon theme based on Gruvbox color scheme
;;; -------------------------------------------------------------------
(define-public gruvbox-plus-icon-theme-git
  (package
    (name "gruvbox-plus-icon-theme-git")
    (version "6.3.0.r2120.gd176a49")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SylEleuth/gruvbox-plus-icon-pack")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "icon theme based on Gruvbox color scheme")
    (description "Icon theme based on Gruvbox color scheme.")
    (home-page "https://github.com/SylEleuth/gruvbox-plus-icon-pack")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11325. heroic-games-launcher-bin --- an Open source Launcher for Epic, Amazon and GOG Games
;;; -------------------------------------------------------------------
(define-public heroic-games-launcher-bin
  (package
    (name "heroic-games-launcher-bin")
    (version "2.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://heroicgameslauncher.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an Open source Launcher for Epic, Amazon and GOG Games")
    (description "An Open source Launcher for Epic, Amazon and GOG Games.")
    (home-page "https://heroicgameslauncher.com/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5740. hyprland-per-window-layout --- per window keyboard layout (language) for Hyprland wayland compositor
;;; -------------------------------------------------------------------
(define-public hyprland-per-window-layout
  (package
    (name "hyprland-per-window-layout")
    (version "2.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/coffebar/hyprland-per-window-layout/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "per window keyboard layout (language) for Hyprland wayland compositor")
    (description "Per window keyboard layout (language) for Hyprland wayland compositor.")
    (home-page "https://github.com/coffebar/hyprland-per-window-layout")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5624. hypruler --- measure anything on your screen
;;; -------------------------------------------------------------------
(define-public hypruler
  (package
    (name "hypruler")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/t4t5/hypruler/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "measure anything on your screen")
    (description "Measure anything on your screen.")
    (home-page "https://github.com/t4t5/hypruler")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31402. i386-elf-binutils --- gNU binutils for the i386- toolchain
;;; -------------------------------------------------------------------
(define-public i386-elf-binutils
  (package
    (name "i386-elf-binutils")
    (version "2.45.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/binutils/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNU binutils for the i386- toolchain")
    (description "GNU binutils for the i386- toolchain.")
    (home-page "https://www.gnu.org/software/binutils")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8145. keyd-openrc --- a key remapping daemon for linux
;;; -------------------------------------------------------------------
(define-public keyd-openrc
  (package
    (name "keyd-openrc")
    (version "2.5.0.r91.30434c9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rvaiya/keyd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a key remapping daemon for linux")
    (description "A key remapping daemon for linux.")
    (home-page "https://github.com/rvaiya/keyd")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5973. kohighlights --- utility for viewing Koreader's highlights and/or export them to simple...
;;; -------------------------------------------------------------------
(define-public kohighlights
  (package
    (name "kohighlights")
    (version "2.3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.noembryo.com/apps.php?kohighlights/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility for viewing Koreader's highlights and/or export them to simple text, ...")
    (description "Utility for viewing Koreader's highlights and/or export them to simple text, html, csv or markdown files.")
    (home-page "http://www.noembryo.com/apps.php?kohighlights")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1799. kwin-karousel --- kWin tiling script with scrolling
;;; -------------------------------------------------------------------
(define-public kwin-karousel
  (package
    (name "kwin-karousel")
    (version "0.16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/peterfajdiga/karousel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kWin tiling script with scrolling")
    (description "KWin tiling script with scrolling.")
    (home-page "https://github.com/peterfajdiga/karousel/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1639. lemonade-desktop --- lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)
;;; -------------------------------------------------------------------
(define-public lemonade-desktop
  (package
    (name "lemonade-desktop")
    (version "10.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lemonade-sdk/lemonade/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lemonade: Local LLM Serving with GPU and NPU acceleration (GUI)")
    (description "Lemonade: Local LLM Serving with GPU and NPU acceleration (GUI).")
    (home-page "https://github.com/lemonade-sdk/lemonade/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 1830. lib32-opencl-nvidia-580xx --- openCL implemention for NVIDIA (32-bit) (580xx)
;;; -------------------------------------------------------------------
(define-public lib32-opencl-nvidia-580xx
  (package
    (name "lib32-opencl-nvidia-580xx")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openCL implemention for NVIDIA (32-bit) (580xx)")
    (description "OpenCL implemention for NVIDIA (32-bit) (580xx).")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8765. libbit4opki --- bit4ID Oberthur Middleware (Smart Card driver)
;;; -------------------------------------------------------------------
(define-public libbit4opki
  (package
    (name "libbit4opki")
    (version "1.3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.bit4id.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bit4ID Oberthur Middleware (Smart Card driver)")
    (description "Bit4ID Oberthur Middleware (Smart Card driver).")
    (home-page "http://www.bit4id.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15005. libfprint-2-tod1-broadcom --- proprietary driver for the fingerprint reader on the Dell Latitude 730...
;;; -------------------------------------------------------------------
(define-public libfprint-2-tod1-broadcom
  (package
    (name "libfprint-2-tod1-broadcom")
    (version "5.15.010.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary driver for the fingerprint reader on the Dell Latitude 7300 - dir...")
    (description "Proprietary driver for the fingerprint reader on the Dell Latitude 7300 - direct from Dell's Ubuntu repo.")
    (home-page "https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5559. liboobs --- gObject based interface to system-tools-backends - shared library
;;; -------------------------------------------------------------------
(define-public liboobs
  (package
    (name "liboobs")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://directory.fsf.org/wiki/Liboobs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gObject based interface to system-tools-backends - shared library")
    (description "GObject based interface to system-tools-backends - shared library.")
    (home-page "https://directory.fsf.org/wiki/Liboobs")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8440. librewolf-vencord-bin --- the cutest Discord client mod
;;; -------------------------------------------------------------------
(define-public librewolf-vencord-bin
  (package
    (name "librewolf-vencord-bin")
    (version "1.14.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://vencord.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest Discord client mod")
    (description "The cutest Discord client mod.")
    (home-page "https://vencord.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2200. ltex-ls-plus-bin --- lTeX Language Server: LSP language server for LanguageTool with suppor...
;;; -------------------------------------------------------------------
(define-public ltex-ls-plus-bin
  (package
    (name "ltex-ls-plus-bin")
    (version "18.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ltex-plus/ltex-ls-plus/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lTeX Language Server: LSP language server for LanguageTool with support for L...")
    (description "LTeX Language Server: LSP language server for LanguageTool with support for LaTeX, Markdown, and others (fork of ltex-ls).")
    (home-page "https://github.com/ltex-plus/ltex-ls-plus")
    (license license:mpl2.0)))
