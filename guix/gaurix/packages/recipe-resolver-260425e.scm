;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260425e
;;; Resolves 100 packages (79 recipes, 21 blocked).
;;;
;;; New recipes (79):
;;;      1.  wavey-launcher-git (gnu-build-system, v1.0.1, gpl3+)
;;;      2.  coredns-wgsd-git (go-build-system, v1.11.1, asl2.0)
;;;      3.  modu-git (gnu-build-system, v0.6.0, expat)
;;;      4.  kactus2-git (cmake-build-system, v3.13.3, gpl2+)
;;;      5.  telegram-desktop-dev-bin (copy-build-system, v6.4.1, gpl3+)
;;;      6.  info2man (gnu-build-system, v1.1, expat)
;;;      7.  sdtool-git (gnu-build-system, v0.0.0, expat)
;;;      8.  kindletool (gnu-build-system, v1.6.5, gpl3+)
;;;      9.  zenmap-git (gnu-build-system, v7.98, gpl2+)
;;;     10.  dida-bin (copy-build-system, v8.0.0, nonfree)
;;;     11.  qmplay2-appimage (copy-build-system, v25.09.11, lgpl3.0)
;;;     12.  sipgrep (gnu-build-system, v2.2.0, gpl3+)
;;;     13.  fuse-emulator-utils (gnu-build-system, v1.4.3, gpl2+)
;;;     14.  wluma-git (gnu-build-system, v4.4.0, isc)
;;;     15.  thunderbird-dkimverifier (copy-build-system, v6.2.0, expat)
;;;     16.  luau-git (cmake-build-system, v0.664, expat)
;;;     17.  eepm (gnu-build-system, v3.64.61, agpl3.0)
;;;     18.  dragonfly-bin (copy-build-system, v1.38.0, nonfree)
;;;     19.  crazycat-dvb-firmware (copy-build-system, v20200730, gpl3+)
;;;     20.  veesem (gnu-build-system, v0.1, isc)
;;;     21.  vatis-appimage (copy-build-system, v4.1.0, gpl3+)
;;;     22.  uutils-findutils-git (cargo-build-system, v0.8.0, expat)
;;;     23.  uutils-diffutils-git (cargo-build-system, v0.5.0, expat)
;;;     24.  tdf-git (cargo-build-system, v0.0.0, mpl2.0)
;;;     25.  sqlui-native-bin (copy-build-system, v1.68.5, expat)
;;;     26.  shadowsocks-go (go-build-system, v1.14.0, agpl3.0)
;;;     27.  retro-fuse-git (gnu-build-system, v0.0.0, asl2.0)
;;;     28.  redisfish-bin (copy-build-system, v1.0.2, gpl3+)
;;;     29.  redis-gui-bin (copy-build-system, v2.3.0, expat)
;;;     30.  purrcrypt (gnu-build-system, v0.0.0, expat)
;;;     31.  partfs-git (gnu-build-system, v0.1.0, bsd-3)
;;;     32.  nmap-grab-beacon-config-git (copy-build-system, v0.0.0, expat)
;;;     33.  nmap-automator-git (copy-build-system, v0.0.0, expat)
;;;     34.  ida-pro-beta (copy-build-system, v9.1, nonfree)
;;;     35.  fcitx5-fbterm-git (cmake-build-system, v0.0.0, gpl3+)
;;;     36.  ddflash-git (gnu-build-system, v0.0.0, expat)
;;;     37.  cod-bin (copy-build-system, v0.1.0, asl2.0)
;;;     38.  borked3ds-appimage (copy-build-system, v2025.03.11, gpl2+)
;;;     39.  another-redis-desktop-manager-bin (copy-build-system, v1.7.1, expat)
;;;     40.  amneziawg-tools-git (gnu-build-system, v0.0.0, gpl2+)
;;;     41.  bleachbit-git (gnu-build-system, v0.0.0, gpl3+)
;;;     42.  nm-connection-editor-git (gnu-build-system, v1.37.0, gpl2+)
;;;     43.  nessus-agent (copy-build-system, v11.0.3, nonfree)
;;;     44.  neatimage (copy-build-system, v9.3.2, nonfree)
;;;     45.  ytt (copy-build-system, v0.53.2, asl2.0)
;;;     46.  tal-vocoder-vst3-bin (copy-build-system, v3.0.3, nonfree)
;;;     47.  tal-reverb4-vst3-bin (copy-build-system, v4.0.4, nonfree)
;;;     48.  tal-filter2-vst3-bin (copy-build-system, v3.1.0, nonfree)
;;;     49.  tal-chorus-lx-vst3-bin (copy-build-system, v1.6.3, nonfree)
;;;     50.  python-geohexgrid (pyproject-build-system, v3.0.0, expat)
;;;     51.  python-cutlet (pyproject-build-system, v0.5.0, expat)
;;;     52.  palemoon-i18n-vi (copy-build-system, v33.8.0, mpl2.0)
;;;     53.  palemoon-i18n-kn (copy-build-system, v33.8.0, mpl2.0)
;;;     54.  palemoon-i18n-hi (copy-build-system, v33.8.0, mpl2.0)
;;;     55.  palemoon-i18n-fa (copy-build-system, v33.8.0, mpl2.0)
;;;     56.  klystrack (gnu-build-system, v1.7.6, expat)
;;;     57.  gnome-shell-extension-awesome-tiles-git (copy-build-system, v14, gpl3+)
;;;     58.  gnome-shell-extension-awesome-tiles (copy-build-system, v14, gpl3+)
;;;     59.  ferroxide-git (cargo-build-system, v0.3.1, expat)
;;;     60.  goldendict-cc-cedict-content (copy-build-system, v1.0, cc-by-sa4.0)
;;;     61.  refine-git (gnu-build-system, v0.4.0, gpl3+)
;;;     62.  howdy (gnu-build-system, v2.6.1, expat)
;;;     63.  nvenc (cmake-build-system, v9.14, expat)
;;;     64.  rarsm (copy-build-system, v1.7, expat)
;;;     65.  ripme-bin (copy-build-system, v2.1.20, expat)
;;;     66.  ida-pro (copy-build-system, v9.3.0, nonfree)
;;;     67.  thunar-volman-devel (gnu-build-system, v4.19.1, gpl2+)
;;;     68.  fiji-bin (copy-build-system, v20250302, gpl2+)
;;;     69.  zsh-pure-prompt (copy-build-system, v1.27.1, expat)
;;;     70.  monero-feather-git (cmake-build-system, v2.6.8, bsd-3)
;;;     71.  identme (gnu-build-system, v0.6.0, bsd-0)
;;;     72.  circuit-simulator (copy-build-system, v4.1.0, gpl2+)
;;;     73.  ghidra-desktop (copy-build-system, v2, asl2.0)
;;;     74.  d2x-rebirth-git (cmake-build-system, v0.60.0, gpl3+)
;;;     75.  limo-git (cmake-build-system, v0.0.0, gpl3+)
;;;     76.  thunar-devel (gnu-build-system, v4.21.3, gpl2+)
;;;     77.  neovim-catppuccin (copy-build-system, v2.0.0, expat)
;;;     78.  remind-me-git (cargo-build-system, v2.0.0, expat)
;;;     79.  pkgfile-git (gnu-build-system, v21, expat)
;;;
;;; BLOCKED (21):
;;;      1.  gjs-nohammer -- DEP_RESOLUTION_FAILED
;;;      2.  repacman -- TOOLING_FAILURE
;;;      3.  mesa-minimal-git -- DEP_RESOLUTION_FAILED
;;;      4.  sbctl-initcpio-post-hook -- TOOLING_FAILURE
;;;      5.  pulumi-git -- DEP_RESOLUTION_FAILED
;;;      6.  pikaur-static-git -- TOOLING_FAILURE
;;;      7.  pikaur-static -- TOOLING_FAILURE
;;;      8.  ntpd-rs-git -- DEP_RESOLUTION_FAILED
;;;      9.  nodejs-nestjs-cli -- DEP_RESOLUTION_FAILED
;;;     10.  libarchive-static -- TOOLING_FAILURE
;;;     11.  java-openjfx-nowebkit -- DEP_RESOLUTION_FAILED
;;;     12.  wyc -- SOURCE_UNAVAILABLE
;;;     13.  network-manager-applet-nolibappindicator -- TOOLING_FAILURE
;;;     14.  virtualbox-svn -- DEP_RESOLUTION_FAILED
;;;     15.  virtualbox-ext-oracle-dev -- LICENSE_REVIEW_NEEDED
;;;     16.  modemmanager-dev -- DEP_RESOLUTION_FAILED
;;;     17.  python-google-cloud-speech -- DEP_RESOLUTION_FAILED
;;;     18.  rocketchat-desktop -- DEP_RESOLUTION_FAILED
;;;     19.  urbanterror -- SOURCE_UNAVAILABLE
;;;     20.  dxvk-async-git -- DEP_RESOLUTION_FAILED
;;;     21.  qt5-mqtt -- DEP_RESOLUTION_FAILED
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260425e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            wavey-launcher-git
            coredns-wgsd-git
            modu-git
            kactus2-git
            telegram-desktop-dev-bin
            info2man
            sdtool-git
            kindletool
            zenmap-git
            dida-bin
            qmplay2-appimage
            sipgrep
            fuse-emulator-utils
            wluma-git
            thunderbird-dkimverifier
            luau-git
            eepm
            dragonfly-bin
            crazycat-dvb-firmware
            veesem
            vatis-appimage
            uutils-findutils-git
            uutils-diffutils-git
            tdf-git
            sqlui-native-bin
            shadowsocks-go
            retro-fuse-git
            redisfish-bin
            redis-gui-bin
            purrcrypt
            partfs-git
            nmap-grab-beacon-config-git
            nmap-automator-git
            ida-pro-beta
            fcitx5-fbterm-git
            ddflash-git
            cod-bin
            borked3ds-appimage
            another-redis-desktop-manager-bin
            amneziawg-tools-git
            bleachbit-git
            nm-connection-editor-git
            nessus-agent
            neatimage
            ytt
            tal-vocoder-vst3-bin
            tal-reverb4-vst3-bin
            tal-filter2-vst3-bin
            tal-chorus-lx-vst3-bin
            python-geohexgrid
            python-cutlet
            palemoon-i18n-vi
            palemoon-i18n-kn
            palemoon-i18n-hi
            palemoon-i18n-fa
            klystrack
            gnome-shell-extension-awesome-tiles-git
            gnome-shell-extension-awesome-tiles
            ferroxide-git
            goldendict-cc-cedict-content
            refine-git
            howdy
            nvenc
            rarsm
            ripme-bin
            ida-pro
            thunar-volman-devel
            fiji-bin
            zsh-pure-prompt
            monero-feather-git
            identme
            circuit-simulator
            ghidra-desktop
            d2x-rebirth-git
            limo-git
            thunar-devel
            neovim-catppuccin
            remind-me-git
            pkgfile-git
            ))

;;; Nonfree/proprietary packages use (license #f) per repo convention.

;;; ===================================================================
;;; 1. wavey-launcher-git
;;; ===================================================================
;;; Source: https://github.com/literallyfiro/wavey-launcher
;;; A launcher for a specific anime game

(define-public wavey-launcher-git
  (let ((commit "4b427c5e092a9e97074f76175923db4d74aa3a57")
        (revision "0"))
    (package
      (name "wavey-launcher-git")
      (version (git-version "1.0.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/literallyfiro/wavey-launcher")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/literallyfiro/wavey-launcher")
      (synopsis "launcher for a specific anime game")
      (description "A launcher for a specific anime game.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 2. coredns-wgsd-git
;;; ===================================================================
;;; Source: https://github.com/jwhited/wgsd
;;; DNS server with wgsd module

(define-public coredns-wgsd-git
  (let ((commit "ae90fde523376ef96a00d855a7b708b6c954eb33")
        (revision "0"))
    (package
      (name "coredns-wgsd-git")
      (version (git-version "1.11.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jwhited/wgsd")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/jwhited/wgsd")
      (synopsis "dNS server with wgsd module")
      (description "DNS server with wgsd module for WireGuard service discovery.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 3. modu-git
;;; ===================================================================
;;; Source: https://github.com/Cyteon/modu
;;; Simple interpreted programming language

(define-public modu-git
  (let ((commit "a990e098417cb30828130f8c09936d22ba41b695")
        (revision "0"))
    (package
      (name "modu-git")
      (version (git-version "0.6.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Cyteon/modu")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/Cyteon/modu")
      (synopsis "simple interpreted programming language")
      (description "Simple interpreted programming language.")
      (license license:expat))))

;;; ===================================================================
;;; 4. kactus2-git
;;; ===================================================================
;;; Source: https://research.tuni.fi/system-on-chip/tools/
;;; IP-XACT-based ASIC/FPGA design tool

(define-public kactus2-git
  (let ((commit "8ba09742a0bfc70304cda7732f0d2cd44d425dae")
        (revision "0"))
    (package
      (name "kactus2-git")
      (version (git-version "3.13.3" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kactus2/kactus2dev")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://research.tuni.fi/system-on-chip/tools/")
      (synopsis "iP-XACT-based ASIC/FPGA design tool")
      (description "IP-XACT-based ASIC/FPGA design tool for hardware component
management and IP reuse.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 5. telegram-desktop-dev-bin
;;; ===================================================================
;;; Source: https://desktop.telegram.org
;;; Telegram desktop dev static binaries

(define-public telegram-desktop-dev-bin
  (package
    (name "telegram-desktop-dev-bin")
    (version "6.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://updates.tdesktop.com/tlinux/tsetup." version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://desktop.telegram.org")
    (synopsis "telegram desktop dev static binaries")
    (description "Telegram desktop development build, provided as prebuilt static
binaries for Linux.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 6. info2man
;;; ===================================================================
;;; Source: http://www.cskk.ezoshosting.com/cs/css/info2pod.html
;;; info to man page converter

(define-public info2man
  (package
    (name "info2man")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.cskk.ezoshosting.com/cs/css/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.cskk.ezoshosting.com/cs/css/info2pod.html")
    (synopsis "info to man page converter")
    (description "Converts GNU info documents to Unix man page format.")
    (license license:expat)))

;;; ===================================================================
;;; 7. sdtool-git
;;; ===================================================================
;;; Source: https://github.com/BertoldVdb/sdtool
;;; SD card write protection flag manager

(define-public sdtool-git
  (let ((commit "428939eed9189d82d7c89ca39281f39963a4ce5c")
        (revision "0"))
    (package
      (name "sdtool-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BertoldVdb/sdtool")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/BertoldVdb/sdtool")
      (synopsis "sD card write protection flag manager")
      (description "Tool for managing the write protection flag on SD cards.")
      (license license:expat))))

;;; ===================================================================
;;; 8. kindletool
;;; ===================================================================
;;; Source: https://github.com/NiLuJe/KindleTool
;;; Kindle update creator/extractor

(define-public kindletool
  (package
    (name "kindletool")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NiLuJe/KindleTool/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/NiLuJe/KindleTool")
    (synopsis "kindle update creator and extractor")
    (description "Tool for creating and extracting Kindle firmware update packages.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 9. zenmap-git
;;; ===================================================================
;;; Source: https://github.com/nmap/nmap
;;; Graphical Nmap frontend

(define-public zenmap-git
  (let ((commit "ada168af5e80c9dba396a04b14935d21015d6c99")
        (revision "0"))
    (package
      (name "zenmap-git")
      (version (git-version "7.98" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nmap/nmap")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nmap/nmap")
      (synopsis "graphical Nmap frontend and network scanner")
      (description "Zenmap is the official graphical user interface for the Nmap
network scanner.  It provides an interactive GUI for running scans and viewing
results.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 10. dida-bin
;;; ===================================================================
;;; Source: https://dida365.com/home
;;; Dida todo list client (proprietary)

(define-public dida-bin
  (package
    (name "dida-bin")
    (version "8.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://dida365.com/download/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://dida365.com/home")
    (synopsis "dida todo list client")
    (description "Dida365 is a todo list and task management client for desktop.")
    (license (license:non-copyleft
              "https://dida365.com/about/tos"
              "Proprietary — Dida365 Terms of Service"))))

;;; ===================================================================
;;; 11. qmplay2-appimage
;;; ===================================================================
;;; Source: https://github.com/zaps166/QMPlay2
;;; Video/audio player AppImage

(define-public qmplay2-appimage
  (package
    (name "qmplay2-appimage")
    (version "25.09.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zaps166/QMPlay2/releases/download/"
                    version "/QMPlay2-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/zaps166/QMPlay2")
    (synopsis "video and audio player AppImage")
    (description "QMPlay2 is a video and audio player that can play most formats
and codecs.  This package provides the AppImage build.")
    (license license:lgpl3+)))

;;; ===================================================================
;;; 12. sipgrep
;;; ===================================================================
;;; Source: https://github.com/sipcapture/sipgrep
;;; SIP protocol packet sniffer

(define-public sipgrep
  (package
    (name "sipgrep")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sipcapture/sipgrep/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sipcapture/sipgrep")
    (synopsis "sIP protocol packet sniffer")
    (description "Sipgrep is a command-line tool for sniffing, capturing, and
exploring SIP protocol traffic on network interfaces.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 13. fuse-emulator-utils
;;; ===================================================================
;;; Source: http://fuse-emulator.sourceforge.net
;;; ZX Spectrum emulator utils

(define-public fuse-emulator-utils
  (package
    (name "fuse-emulator-utils")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/fuse-emulator/files/fuse-utils/"
                    version "/fuse-utils-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://fuse-emulator.sourceforge.net")
    (synopsis "zX Spectrum emulator utilities")
    (description "Utility programs for the Fuse ZX Spectrum emulator, including
tape and disk image manipulation tools.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 14. wluma-git
;;; ===================================================================
;;; Source: https://github.com/maximbaz/wluma
;;; Auto brightness adjustment for Wayland

(define-public wluma-git
  (let ((commit "5c58bce64e88ad667bab87dae2d97090a7098708")
        (revision "0"))
    (package
      (name "wluma-git")
      (version (git-version "4.4.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maximbaz/wluma")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/maximbaz/wluma")
      (synopsis "automatic brightness adjustment for Wayland")
      (description "Wluma is a daemon that automatically adjusts screen brightness
based on ambient light sensor readings on Wayland compositors.")
      (license license:isc))))

;;; ===================================================================
;;; 15. thunderbird-dkimverifier
;;; ===================================================================
;;; Source: https://github.com/lieser/dkim_verifier
;;; Thunderbird DKIM verifier addon

(define-public thunderbird-dkimverifier
  (package
    (name "thunderbird-dkimverifier")
    (version "6.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lieser/dkim_verifier/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lieser/dkim_verifier")
    (synopsis "thunderbird DKIM signature verifier addon")
    (description "DKIM Verifier is a Thunderbird addon that verifies DKIM
signatures on email messages to help detect forged sender addresses.")
    (license license:expat)))

;;; ===================================================================
;;; 16. luau-git
;;; ===================================================================
;;; Source: https://github.com/luau-lang/luau
;;; Fast gradually typed Lua-derived language

(define-public luau-git
  (let ((commit "4850cef31e2fc423639c9a2e0380e4e67bb2512f")
        (revision "0"))
    (package
      (name "luau-git")
      (version (git-version "0.664" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luau-lang/luau")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/luau-lang/luau")
      (synopsis "fast gradually typed Lua-derived language")
      (description "Luau is a fast, small, safe, gradually typed embeddable
scripting language derived from Lua.  It is used by Roblox and can be used
standalone.")
      (license license:expat))))

;;; ===================================================================
;;; 17. eepm
;;; ===================================================================
;;; Source: https://github.com/Etersoft/eepm/
;;; Universal interface package manager

(define-public eepm
  (package
    (name "eepm")
    (version "3.64.61")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Etersoft/eepm/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Etersoft/eepm/")
    (synopsis "universal interface package manager")
    (description "EEPM (Etersoft EPM) is a universal command-line interface
for various Linux package managers, providing a unified interface across
different distributions.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 18. dragonfly-bin
;;; ===================================================================
;;; Source: https://dragonflydb.io/
;;; Modern in-memory Redis-compatible datastore

(define-public dragonfly-bin
  (package
    (name "dragonfly-bin")
    (version "1.38.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dragonflydb/dragonfly/releases/download/v"
                    version "/dragonfly-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://dragonflydb.io/")
    (synopsis "modern in-memory Redis-compatible datastore")
    (description "Dragonfly is a modern in-memory datastore that is fully
compatible with Redis and Memcached APIs.  It offers better performance and
memory efficiency.  This package provides prebuilt binaries.")
    (license (license:non-copyleft
              "https://github.com/dragonflydb/dragonfly/blob/main/LICENSE.md"
              "BSL 1.1 — Business Source License"))))

;;; ===================================================================
;;; 19. crazycat-dvb-firmware
;;; ===================================================================
;;; Source: https://github.com/crazycat69/media_build
;;; DVB firmware from CrazyCat

(define-public crazycat-dvb-firmware
  (package
    (name "crazycat-dvb-firmware")
    (version "20200730")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/crazycat69/media_build/archive/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/crazycat69/media_build")
    (synopsis "dVB firmware files from CrazyCat")
    (description "DVB firmware files from the CrazyCat media_build project for
various digital TV tuner hardware.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 20. veesem
;;; ===================================================================
;;; Source: https://github.com/sp1187/veesem/
;;; V.Smile emulator

(define-public veesem
  (package
    (name "veesem")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sp1187/veesem/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sp1187/veesem/")
    (synopsis "v.Smile console emulator")
    (description "Veesem is an emulator for the V.Smile educational game console.")
    (license license:isc)))

;;; ===================================================================
;;; 21. vatis-appimage
;;; ===================================================================
;;; Source: https://vatis.app
;;; vATIS ATIS Solution for VATSIM AppImage

(define-public vatis-appimage
  (package
    (name "vatis-appimage")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vatis-project/vatis/releases/download/v"
                    version "/vATIS-" version "-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://vatis.app")
    (synopsis "vATIS ATIS solution for VATSIM network")
    (description "vATIS is an ATIS (Automatic Terminal Information Service)
generation solution for the VATSIM online flight simulation network.  This
package provides the AppImage build.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 22. uutils-findutils-git
;;; ===================================================================
;;; Source: https://github.com/uutils/findutils
;;; Rust findutils implementation

(define-public uutils-findutils-git
  (let ((commit "5b924c08da5a0bcf25a7507f7cbda5e882304748")
        (revision "0"))
    (package
      (name "uutils-findutils-git")
      (version (git-version "0.8.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/findutils")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/uutils/findutils")
      (synopsis "rust implementation of GNU findutils")
      (description "Cross-platform Rust rewrite of the GNU findutils suite,
providing @command{find}, @command{xargs}, and related utilities.")
      (license license:expat))))

;;; ===================================================================
;;; 23. uutils-diffutils-git
;;; ===================================================================
;;; Source: https://github.com/uutils/diffutils
;;; Rust diffutils implementation

(define-public uutils-diffutils-git
  (let ((commit "470b85b4ad0083f0a6fdb3a8137f224c4b498ed1")
        (revision "0"))
    (package
      (name "uutils-diffutils-git")
      (version (git-version "0.5.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/uutils/diffutils")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/uutils/diffutils")
      (synopsis "rust implementation of GNU diffutils")
      (description "Cross-platform Rust rewrite of the GNU diffutils suite,
providing @command{diff}, @command{cmp}, and related utilities.")
      (license license:expat))))

;;; ===================================================================
;;; 24. tdf-git
;;; ===================================================================
;;; Source: https://github.com/itsjunetime/tdf
;;; Terminal PDF viewer

(define-public tdf-git
  (let ((commit "91a75cf93cbf3a66fdb86d4b06b5983f64c4c3ce")
        (revision "0"))
    (package
      (name "tdf-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/itsjunetime/tdf")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/itsjunetime/tdf")
      (synopsis "terminal PDF viewer")
      (description "TDF is a terminal-based PDF viewer that renders PDF documents
directly in the terminal.")
      (license license:mpl2.0))))

;;; ===================================================================
;;; 25. sqlui-native-bin
;;; ===================================================================
;;; Source: https://synle.github.io/sqlui-native/
;;; SQL UI client AppImage

(define-public sqlui-native-bin
  (package
    (name "sqlui-native-bin")
    (version "1.68.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedoc/sqlui-native/releases/download/v"
                    version "/sqlui-native-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://synle.github.io/sqlui-native/")
    (synopsis "cross-platform SQL client AppImage")
    (description "SQLUI Native is a cross-platform desktop SQL client supporting
multiple database backends.  This package provides the AppImage build.")
    (license license:expat)))

;;; ===================================================================
;;; 26. shadowsocks-go
;;; ===================================================================
;;; Source: https://github.com/database64128/shadowsocks-go
;;; Shadowsocks proxy in Go

(define-public shadowsocks-go
  (package
    (name "shadowsocks-go")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/database64128/shadowsocks-go/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/database64128/shadowsocks-go")
    (synopsis "shadowsocks proxy implementation in Go")
    (description "A Go implementation of the Shadowsocks protocol for encrypted
proxy connections.")
    (license license:agpl3+)))

;;; ===================================================================
;;; 27. retro-fuse-git
;;; ===================================================================
;;; Source: https://github.com/jaylogue/retro-fuse
;;; FUSE for ancient Unix filesystems

(define-public retro-fuse-git
  (let ((commit "3b7fe52fb93e60b3352332b936b83ae46a3875d5")
        (revision "0"))
    (package
      (name "retro-fuse-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jaylogue/retro-fuse")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/jaylogue/retro-fuse")
      (synopsis "fUSE filesystem driver for ancient Unix filesystems")
      (description "Retro-fuse provides FUSE drivers for mounting historical Unix
filesystem formats, allowing access to disk images from early Unix systems.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 28. redisfish-bin
;;; ===================================================================
;;; Source: https://github.com/Kuari/RedisFish
;;; Redis GUI client

(define-public redisfish-bin
  (package
    (name "redisfish-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Kuari/RedisFish/releases/download/v"
                    version "/RedisFish-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Kuari/RedisFish")
    (synopsis "redis GUI client")
    (description "RedisFish is a graphical desktop client for managing and
browsing Redis databases.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 29. redis-gui-bin
;;; ===================================================================
;;; Source: https://github.com/ekvedaras/redis-gui
;;; Redis desktop manager GUI

(define-public redis-gui-bin
  (package
    (name "redis-gui-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ekvedaras/redis-gui/releases/download/v"
                    version "/redis-gui-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ekvedaras/redis-gui")
    (synopsis "redis desktop manager GUI")
    (description "Redis GUI is a graphical desktop manager for browsing and
managing Redis key-value stores.")
    (license license:expat)))

;;; ===================================================================
;;; 30. purrcrypt
;;; ===================================================================
;;; Source: https://github.com/vxfemboy/purrcrypt
;;; Encryption disguised as cat/dog sounds

(define-public purrcrypt
  (let ((commit "edc8cc0bc9a57428f8c230dc1bddfbf32ebf0b80")
        (revision "0"))
    (package
      (name "purrcrypt")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vxfemboy/purrcrypt")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/vxfemboy/purrcrypt")
      (synopsis "encryption disguised as cat and dog sounds")
      (description "Purrcrypt is a novelty encryption tool that encodes and
decodes data using cat and dog sound representations.")
      (license license:expat))))

;;; ===================================================================
;;; 31. partfs-git
;;; ===================================================================
;;; Source: https://github.com/braincorp/partfs
;;; FUSE for accessing disk partitions

(define-public partfs-git
  (let ((commit "41f18b38ab17572d61d95ebfdd1c8a15ab06cf50")
        (revision "0"))
    (package
      (name "partfs-git")
      (version (git-version "0.1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/braincorp/partfs")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/braincorp/partfs")
      (synopsis "fUSE filesystem for accessing disk partitions")
      (description "Partfs is a FUSE-based filesystem that allows mounting
individual partitions from a disk image file without requiring root access.")
      (license license:bsd-3))))

;;; ===================================================================
;;; 32. nmap-grab-beacon-config-git
;;; ===================================================================
;;; Source: https://github.com/whickey-r7/grab_beacon_config
;;; NMAP Cobalt Strike beacon config script

(define-public nmap-grab-beacon-config-git
  (let ((commit "6310f437c803e8506fa0890eac6a51ea3368fc44")
        (revision "0"))
    (package
      (name "nmap-grab-beacon-config-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/whickey-r7/grab_beacon_config")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/whickey-r7/grab_beacon_config")
      (synopsis "nmap script to extract Cobalt Strike beacon configurations")
      (description "An Nmap NSE script that extracts and displays Cobalt Strike
beacon configuration data from target hosts.")
      (license license:expat))))

;;; ===================================================================
;;; 33. nmap-automator-git
;;; ===================================================================
;;; Source: https://github.com/21y4d/nmapAutomator
;;; nmap automation wrapper for pentesting

(define-public nmap-automator-git
  (let ((commit "77572853694e43432da450b49c873d5487db78bd")
        (revision "0"))
    (package
      (name "nmap-automator-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/21y4d/nmapAutomator")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/21y4d/nmapAutomator")
      (synopsis "nmap automation wrapper for penetration testing")
      (description "nmapAutomator is a shell script that automates common nmap
scanning workflows for penetration testing and network reconnaissance.")
      (license license:expat))))

;;; ===================================================================
;;; 34. ida-pro-beta
;;; ===================================================================
;;; Source: https://github.com/vctv/IDA-Pro/releases
;;; IDA Pro disassembler (beta, proprietary)

(define-public ida-pro-beta
  (package
    (name "ida-pro-beta")
    (version "9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vctv/IDA-Pro/releases/download/"
                    version "/ida-pro-" version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/vctv/IDA-Pro/releases")
    (synopsis "iDA Pro disassembler beta release")
    (description "IDA Pro is an interactive disassembler and debugger for reverse
engineering binary executables.  This is the beta release.")
    (license (license:non-copyleft
              "https://hex-rays.com/ida-pro/"
              "Proprietary — Hex-Rays IDA Pro license"))))

;;; ===================================================================
;;; 35. fcitx5-fbterm-git
;;; ===================================================================
;;; Source: https://github.com/fcitx/fcitx5-fbterm
;;; fbterm support for fcitx5

(define-public fcitx5-fbterm-git
  (let ((commit "f200f1b1aa0149b91a8227388c3f53cf8ef102eb")
        (revision "0"))
    (package
      (name "fcitx5-fbterm-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fcitx/fcitx5-fbterm")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/fcitx/fcitx5-fbterm")
      (synopsis "fbterm support for fcitx5 input method framework")
      (description "Provides fbterm (framebuffer terminal) support for the
fcitx5 input method framework, enabling input method usage in the Linux
framebuffer console.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 36. ddflash-git
;;; ===================================================================
;;; Source: https://github.com/zvova7890/ddflash
;;; USB flash writer tool

(define-public ddflash-git
  (let ((commit "88a2ad5837fd919d4e097c74552aa93a225a80b6")
        (revision "0"))
    (package
      (name "ddflash-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zvova7890/ddflash")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/zvova7890/ddflash")
      (synopsis "uSB flash writer tool")
      (description "Ddflash is a tool for writing disk images to USB flash
drives.")
      (license license:expat))))

;;; ===================================================================
;;; 37. cod-bin
;;; ===================================================================
;;; Source: https://github.com/dim-an/cod
;;; Completion daemon for bash/zsh

(define-public cod-bin
  (package
    (name "cod-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dim-an/cod/releases/download/v"
                    version "/cod-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dim-an/cod")
    (synopsis "completion daemon for bash and zsh")
    (description "Cod is a completion daemon that generates shell completions by
learning from @code{--help} output of commands, supporting both Bash and Zsh.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 38. borked3ds-appimage
;;; ===================================================================
;;; Source: https://github.com/Borked3DS/Borked3DS
;;; Nintendo 3DS Emulator AppImage

(define-public borked3ds-appimage
  (package
    (name "borked3ds-appimage")
    (version "2025.03.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Borked3DS/Borked3DS/releases/download/"
                    version "/Borked3DS-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Borked3DS/Borked3DS")
    (synopsis "nintendo 3DS emulator AppImage")
    (description "Borked3DS is a Nintendo 3DS emulator fork.  This package
provides the AppImage build for Linux x86_64.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 39. another-redis-desktop-manager-bin
;;; ===================================================================
;;; Source: https://github.com/qishibo/AnotherRedisDesktopManager
;;; Redis desktop manager GUI AppImage

(define-public another-redis-desktop-manager-bin
  (package
    (name "another-redis-desktop-manager-bin")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v"
                    version "/Another-Redis-Desktop-Manager-linux-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/qishibo/AnotherRedisDesktopManager")
    (synopsis "redis desktop manager GUI")
    (description "Another Redis Desktop Manager is a fast, stable, and
user-friendly GUI client for managing Redis databases.  This package provides
the AppImage build.")
    (license license:expat)))

;;; ===================================================================
;;; 40. amneziawg-tools-git
;;; ===================================================================
;;; Source: https://github.com/amnezia-vpn/amneziawg-tools
;;; AmneziaWG VPN tools

(define-public amneziawg-tools-git
  (let ((commit "e43c012caed361dafc23d17e51eb458e0e3f4d54")
        (revision "0"))
    (package
      (name "amneziawg-tools-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/amnezia-vpn/amneziawg-tools")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/amnezia-vpn/amneziawg-tools")
      (synopsis "amneziaWG VPN userspace tools")
      (description "Userspace tools for configuring and managing AmneziaWG VPN
tunnels, a censorship-resistant fork of WireGuard.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 41. bleachbit-git
;;; ===================================================================
;;; Source: https://www.bleachbit.org/
;;; Disk space cleaner / privacy tool

(define-public bleachbit-git
  (let ((commit "9106f1cce2f6c60160c2a70ff8a3bb44b4ac17cd")
        (revision "0"))
    (package
      (name "bleachbit-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bleachbit/bleachbit")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://www.bleachbit.org/")
      (synopsis "disk space cleaner and privacy tool")
      (description "BleachBit frees disk space and guards your privacy by
cleaning cache, cookies, temporary files, logs, and other unnecessary data
from applications and the system.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 42. nm-connection-editor-git
;;; ===================================================================
;;; Source: http://www.gnome.org/projects/NetworkManager/
;;; NetworkManager GUI connection editor

(define-public nm-connection-editor-git
  (let ((commit "68ba1fa25fe91b53f4129eac50fe23cabec8d531")
        (revision "0"))
    (package
      (name "nm-connection-editor-git")
      (version (git-version "1.37.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/network-manager-applet.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "http://www.gnome.org/projects/NetworkManager/")
      (synopsis "networkManager GUI connection editor")
      (description "nm-connection-editor is a graphical tool for creating and
editing NetworkManager connection profiles.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 43. nessus-agent
;;; ===================================================================
;;; Source: https://www.tenable.com/downloads/nessus-agents
;;; Nessus vulnerability scanner agent (proprietary)

(define-public nessus-agent
  (package
    (name "nessus-agent")
    (version "11.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.tenable.com/downloads/api/v2/pages/nessus-agents/files/"
                    "NessusAgent-" version "-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.tenable.com/downloads/nessus-agents")
    (synopsis "nessus vulnerability scanner agent")
    (description "Nessus Agent is a lightweight vulnerability scanner that runs
on endpoints to perform local assessments and report to a Nessus Manager or
Tenable.io instance.")
    (license (license:non-copyleft
              "https://www.tenable.com/legal"
              "Proprietary — Tenable Nessus license"))))

;;; ===================================================================
;;; 44. neatimage
;;; ===================================================================
;;; Source: https://ni.neatvideo.com/
;;; Image noise reduction tool (proprietary)

(define-public neatimage
  (package
    (name "neatimage")
    (version "9.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ni.neatvideo.com/download/" name "-" version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://ni.neatvideo.com/")
    (synopsis "image noise reduction tool")
    (description "Neat Image is a digital image noise reduction tool that removes
noise and grain from photographs while preserving detail.")
    (license (license:non-copyleft
              "https://ni.neatvideo.com/legal"
              "Proprietary — Neat Image license"))))

;;; ===================================================================
;;; 45. ytt
;;; ===================================================================
;;; Source: https://carvel.dev/ytt
;;; YAML templating tool

(define-public ytt
  (package
    (name "ytt")
    (version "0.53.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/carvel-dev/ytt/releases/download/v"
                    version "/ytt-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://carvel.dev/ytt")
    (synopsis "yAML templating tool")
    (description "Ytt is a YAML templating tool that works on YAML structures
instead of text, providing a reliable way to template and overlay Kubernetes
and other YAML configurations.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 46. tal-vocoder-vst3-bin
;;; ===================================================================
;;; Source: https://tal-software.com/products/tal-vocoder
;;; TAL Vocoder VST3 plugin (EULA)

(define-public tal-vocoder-vst3-bin
  (package
    (name "tal-vocoder-vst3-bin")
    (version "3.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tal-software.com/downloads/TAL-Vocoder-"
                    version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://tal-software.com/products/tal-vocoder")
    (synopsis "tAL Vocoder VST3 audio plugin")
    (description "TAL-Vocoder is a vintage vocoder emulation VST3 plugin with
many unique features for audio production.")
    (license (license:non-copyleft
              "https://tal-software.com/products/tal-vocoder"
              "Proprietary — TAL Software EULA"))))

;;; ===================================================================
;;; 47. tal-reverb4-vst3-bin
;;; ===================================================================
;;; Source: https://tal-software.com/tal-reverb-4
;;; TAL Reverb 4 VST3 plugin (EULA)

(define-public tal-reverb4-vst3-bin
  (package
    (name "tal-reverb4-vst3-bin")
    (version "4.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tal-software.com/downloads/TAL-Reverb-4-"
                    version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://tal-software.com/tal-reverb-4")
    (synopsis "tAL Reverb 4 VST3 audio plugin")
    (description "TAL-Reverb-4 is a high quality plate reverb VST3 plugin with a
modulated vintage reverb sound for audio production.")
    (license (license:non-copyleft
              "https://tal-software.com/tal-reverb-4"
              "Proprietary — TAL Software EULA"))))

;;; ===================================================================
;;; 48. tal-filter2-vst3-bin
;;; ===================================================================
;;; Source: https://tal-software.com/products/tal-filter
;;; TAL Filter 2 VST3 plugin (EULA)

(define-public tal-filter2-vst3-bin
  (package
    (name "tal-filter2-vst3-bin")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tal-software.com/downloads/TAL-Filter-2-"
                    version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://tal-software.com/products/tal-filter")
    (synopsis "tAL Filter 2 VST3 audio plugin")
    (description "TAL-Filter-2 is a host-synced filter module VST3 plugin with
different filter types and panorama effects for audio production.")
    (license (license:non-copyleft
              "https://tal-software.com/products/tal-filter"
              "Proprietary — TAL Software EULA"))))

;;; ===================================================================
;;; 49. tal-chorus-lx-vst3-bin
;;; ===================================================================
;;; Source: https://tal-software.com/products/tal-chorus-lx
;;; TAL Chorus LX VST3 plugin (EULA)

(define-public tal-chorus-lx-vst3-bin
  (package
    (name "tal-chorus-lx-vst3-bin")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tal-software.com/downloads/TAL-Chorus-LX-"
                    version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://tal-software.com/products/tal-chorus-lx")
    (synopsis "tAL Chorus LX VST3 audio plugin")
    (description "TAL-Chorus-LX is a Juno-60 chorus emulation VST3 plugin that
provides lush stereo chorus effects for audio production.")
    (license (license:non-copyleft
              "https://tal-software.com/products/tal-chorus-lx"
              "Proprietary — TAL Software EULA"))))

;;; ===================================================================
;;; 50. python-geohexgrid
;;; ===================================================================
;;; Source: https://github.com/mrcagney/geohexgrid
;;; Python geographic hexagon grid library

(define-public python-geohexgrid
  (package
    (name "python-geohexgrid")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mrcagney/geohexgrid/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mrcagney/geohexgrid")
    (synopsis "python geographic hexagon grid library")
    (description "GeoHexGrid is a Python library for creating and working with
geographic hexagonal grids for spatial analysis and visualization.")
    (license license:expat)))

;;; ===================================================================
;;; 51. python-cutlet
;;; ===================================================================
;;; Source: https://github.com/polm/cutlet
;;; Python romaji converter

(define-public python-cutlet
  (package
    (name "python-cutlet")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/polm/cutlet/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/polm/cutlet")
    (synopsis "python Japanese to romaji converter")
    (description "Cutlet is a Python library for converting Japanese text to
romaji (Latin alphabet) using customizable romanization systems.")
    (license license:expat)))

;;; ===================================================================
;;; 52. palemoon-i18n-vi
;;; ===================================================================
;;; Source: https://addons.palemoon.org/language-packs/
;;; Vietnamese language pack for Pale Moon

(define-public palemoon-i18n-vi
  (package
    (name "palemoon-i18n-vi")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://addons.palemoon.org/language-packs/vi-" version ".xpi"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://addons.palemoon.org/language-packs/")
    (synopsis "vietnamese language pack for Pale Moon")
    (description "Vietnamese language pack for the Pale Moon web browser.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 53. palemoon-i18n-kn
;;; ===================================================================
;;; Source: https://addons.palemoon.org/language-packs/
;;; Kannada language pack for Pale Moon

(define-public palemoon-i18n-kn
  (package
    (name "palemoon-i18n-kn")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://addons.palemoon.org/language-packs/kn-" version ".xpi"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://addons.palemoon.org/language-packs/")
    (synopsis "kannada language pack for Pale Moon")
    (description "Kannada language pack for the Pale Moon web browser.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 54. palemoon-i18n-hi
;;; ===================================================================
;;; Source: https://addons.palemoon.org/language-packs/
;;; Hindi language pack for Pale Moon

(define-public palemoon-i18n-hi
  (package
    (name "palemoon-i18n-hi")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://addons.palemoon.org/language-packs/hi-" version ".xpi"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://addons.palemoon.org/language-packs/")
    (synopsis "hindi language pack for Pale Moon")
    (description "Hindi language pack for the Pale Moon web browser.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 55. palemoon-i18n-fa
;;; ===================================================================
;;; Source: https://addons.palemoon.org/language-packs/
;;; Persian language pack for Pale Moon

(define-public palemoon-i18n-fa
  (package
    (name "palemoon-i18n-fa")
    (version "33.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://addons.palemoon.org/language-packs/fa-" version ".xpi"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://addons.palemoon.org/language-packs/")
    (synopsis "persian language pack for Pale Moon")
    (description "Persian (Farsi) language pack for the Pale Moon web browser.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 56. klystrack
;;; ===================================================================
;;; Source: http://kometbomb.github.io/klystrack/
;;; Chiptune music tracker

(define-public klystrack
  (package
    (name "klystrack")
    (version "1.7.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kometbomb/klystrack/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://kometbomb.github.io/klystrack/")
    (synopsis "chiptune music tracker")
    (description "Klystrack is a tracker for making chiptune-style music.  It
features a built-in synthesizer with support for various waveforms, effects,
and modulation.")
    (license license:expat)))

;;; ===================================================================
;;; 57. gnome-shell-extension-awesome-tiles-git
;;; ===================================================================
;;; Source: https://github.com/velitasali/gnome-awesome-tiles-extension
;;; GNOME tiling extension (git)

(define-public gnome-shell-extension-awesome-tiles-git
  (let ((commit "cd286ff85beb7a1744a3978a095c10f94e5eda51")
        (revision "0"))
    (package
      (name "gnome-shell-extension-awesome-tiles-git")
      (version (git-version "14" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velitasali/gnome-awesome-tiles-extension")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/velitasali/gnome-awesome-tiles-extension")
      (synopsis "gNOME Shell tiling window management extension")
      (description "Awesome Tiles is a GNOME Shell extension that adds tiling
window management capabilities for snapping and organizing windows.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 58. gnome-shell-extension-awesome-tiles
;;; ===================================================================
;;; Source: https://github.com/velitasali/gnome-awesome-tiles-extension
;;; GNOME tiling extension

(define-public gnome-shell-extension-awesome-tiles
  (package
    (name "gnome-shell-extension-awesome-tiles")
    (version "14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/velitasali/gnome-awesome-tiles-extension/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/velitasali/gnome-awesome-tiles-extension")
    (synopsis "gNOME Shell tiling window management extension")
    (description "Awesome Tiles is a GNOME Shell extension that adds tiling
window management capabilities for snapping and organizing windows.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 59. ferroxide-git
;;; ===================================================================
;;; Source: https://github.com/acheong08/ferroxide
;;; ProtonMail CardDAV/IMAP/SMTP bridge fork

(define-public ferroxide-git
  (let ((commit "064cf2e660368b28950b9c8378a2c0346cc0b65e")
        (revision "0"))
    (package
      (name "ferroxide-git")
      (version (git-version "0.3.1" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acheong08/ferroxide")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/acheong08/ferroxide")
      (synopsis "protonMail CardDAV/IMAP/SMTP bridge fork")
      (description "Ferroxide is a fork of the ProtonMail bridge providing
CardDAV, IMAP, and SMTP access to ProtonMail accounts from standard email
clients.")
      (license license:expat))))

;;; ===================================================================
;;; 60. goldendict-cc-cedict-content
;;; ===================================================================
;;; Source: https://www.mdbg.net/chinese/dictionary?page=cedict
;;; CC-CEDICT dict for GoldenDict

(define-public goldendict-cc-cedict-content
  (package
    (name "goldendict-cc-cedict-content")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.mdbg.net/chinese/export/cedict/cedict_1_0_ts_utf-8_mdbg.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.mdbg.net/chinese/dictionary?page=cedict")
    (synopsis "cC-CEDICT Chinese-English dictionary for GoldenDict")
    (description "CC-CEDICT is a community-maintained Chinese-English dictionary
formatted for use with GoldenDict and other dictionary applications.")
    (license license:cc-by-sa4.0)))

;;; ===================================================================
;;; 61. refine-git
;;; ===================================================================
;;; Source: https://gitlab.gnome.org/TheEvilSkeleton/Refine
;;; GNOME tweaking tool

(define-public refine-git
  (let ((commit "53ac87b0ca0101c99fea3575719d92bd6ce14fd3")
        (revision "0"))
    (package
      (name "refine-git")
      (version (git-version "0.4.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/TheEvilSkeleton/Refine")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://gitlab.gnome.org/TheEvilSkeleton/Refine")
      (synopsis "gNOME desktop tweaking tool")
      (description "Refine is a GNOME desktop environment tweaking tool that
allows users to adjust advanced settings not exposed in the standard Settings
application.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 62. howdy
;;; ===================================================================
;;; Source: https://github.com/boltgolt/howdy
;;; Windows Hello face auth for Linux

(define-public howdy
  (package
    (name "howdy")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/boltgolt/howdy/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/boltgolt/howdy")
    (synopsis "windows Hello style face authentication for Linux")
    (description "Howdy provides Windows Hello style facial authentication for
Linux.  It uses infrared cameras and face recognition to authenticate users
via PAM.")
    (license license:expat)))

;;; ===================================================================
;;; 63. nvenc
;;; ===================================================================
;;; Source: https://github.com/rigaya/NVEnc
;;; NVIDIA video encoder CLI

(define-public nvenc
  (package
    (name "nvenc")
    (version "9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rigaya/NVEnc/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rigaya/NVEnc")
    (synopsis "nVIDIA hardware video encoder CLI tool")
    (description "NVEnc is a command-line tool for hardware-accelerated video
encoding using NVIDIA GPUs via the NVENC API.")
    (license license:expat)))

;;; ===================================================================
;;; 64. rarsm
;;; ===================================================================
;;; Source: https://github.com/privat/rars
;;; RISC-V assembler and runtime simulator

(define-public rarsm
  (package
    (name "rarsm")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/privat/rars/releases/download/v"
                    version "/rars_" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/privat/rars")
    (synopsis "rISC-V assembler and runtime simulator")
    (description "RARS is a RISC-V Assembler and Runtime Simulator for
educational use, supporting the RV32I base instruction set and extensions.")
    (license license:expat)))

;;; ===================================================================
;;; 65. ripme-bin
;;; ===================================================================
;;; Source: https://github.com/RipMeApp/ripme
;;; Bulk album downloader

(define-public ripme-bin
  (package
    (name "ripme-bin")
    (version "2.1.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RipMeApp/ripme/releases/download/"
                    version "/ripme.jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/RipMeApp/ripme")
    (synopsis "bulk album downloader for various websites")
    (description "RipMe is a Java-based album ripper that downloads image and
video albums from various websites in bulk.")
    (license license:expat)))

;;; ===================================================================
;;; 66. ida-pro
;;; ===================================================================
;;; Source: https://hex-rays.com/ida-pro
;;; IDA Pro disassembler (proprietary)

(define-public ida-pro
  (package
    (name "ida-pro")
    (version "9.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://hex-rays.com/ida-pro/download/" name "-" version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://hex-rays.com/ida-pro")
    (synopsis "iDA Pro interactive disassembler")
    (description "IDA Pro is an interactive disassembler and debugger widely used
for reverse engineering, malware analysis, and vulnerability research.")
    (license (license:non-copyleft
              "https://hex-rays.com/ida-pro/"
              "Proprietary — Hex-Rays IDA Pro license"))))

;;; ===================================================================
;;; 67. thunar-volman-devel
;;; ===================================================================
;;; Source: https://goodies.xfce.org/projects/thunar-plugins/thunar-volman
;;; Thunar volume manager (dev)

(define-public thunar-volman-devel
  (package
    (name "thunar-volman-devel")
    (version "4.19.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://archive.xfce.org/src/xfce/thunar-volman/"
                    (version-major+minor version) "/thunar-volman-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://goodies.xfce.org/projects/thunar-plugins/thunar-volman")
    (synopsis "thunar volume manager development version")
    (description "Thunar Volume Manager provides automatic management of
removable devices and media for the Xfce desktop environment.  This is the
development version.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 68. fiji-bin
;;; ===================================================================
;;; Source: http://fiji.sc/
;;; ImageJ distribution for scientific imaging

(define-public fiji-bin
  (package
    (name "fiji-bin")
    (version "20250302")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.imagej.net/fiji/archive/"
                    version "/fiji-linux64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://fiji.sc/")
    (synopsis "imageJ distribution for scientific image analysis")
    (description "Fiji is a distribution of ImageJ bundled with many plugins for
scientific image analysis.  This package provides the prebuilt binary
distribution.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 69. zsh-pure-prompt
;;; ===================================================================
;;; Source: https://github.com/sindresorhus/pure
;;; Minimal ZSH prompt

(define-public zsh-pure-prompt
  (package
    (name "zsh-pure-prompt")
    (version "1.27.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sindresorhus/pure/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/sindresorhus/pure")
    (synopsis "minimal and fast Zsh prompt")
    (description "Pure is a pretty, minimal, and fast Zsh prompt that displays
useful information like git branch, working directory, and command execution
time.")
    (license license:expat)))

;;; ===================================================================
;;; 70. monero-feather-git
;;; ===================================================================
;;; Source: https://featherwallet.org
;;; Monero desktop wallet

(define-public monero-feather-git
  (let ((commit "f4f8a6edab7c1311db3ff1bf9c847cb71921d7b7")
        (revision "0"))
    (package
      (name "monero-feather-git")
      (version (git-version "2.6.8" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/feather-wallet/feather")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://featherwallet.org")
      (synopsis "monero desktop wallet")
      (description "Feather is a free and open-source Monero desktop wallet
focused on privacy, speed, and ease of use.")
      (license license:bsd-3))))

;;; ===================================================================
;;; 71. identme
;;; ===================================================================
;;; Source: https://www.ident.me
;;; Public IP lookup tool

(define-public identme
  (package
    (name "identme")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/identme/identme/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.ident.me")
    (synopsis "public IP address lookup tool")
    (description "Identme is a simple tool for looking up your public IP address
from the command line using the ident.me service.")
    (license license:bsd-0)))

;;; ===================================================================
;;; 72. circuit-simulator
;;; ===================================================================
;;; Source: http://www.falstad.com/circuit
;;; Electronic circuit simulator

(define-public circuit-simulator
  (package
    (name "circuit-simulator")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.falstad.com/circuit/offline/circuitjs1-linux64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://www.falstad.com/circuit")
    (synopsis "electronic circuit simulator")
    (description "Circuit Simulator is an interactive electronic circuit
simulator that runs in a graphical interface, supporting a wide variety of
analog and digital components.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 73. ghidra-desktop
;;; ===================================================================
;;; Source: https://ghidra-sre.org/
;;; Ghidra reverse engineering (desktop icon)

(define-public ghidra-desktop
  (package
    (name "ghidra-desktop")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ghidra-sre.org/" name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://ghidra-sre.org/")
    (synopsis "desktop integration files for Ghidra reverse engineering suite")
    (description "Provides desktop entry files and icons for the Ghidra software
reverse engineering suite developed by the NSA.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 74. d2x-rebirth-git
;;; ===================================================================
;;; Source: https://www.dxx-rebirth.com/
;;; Descent 2 engine source port

(define-public d2x-rebirth-git
  (let ((commit "ce89459ae1987a74cc721b2e769c6b2facf5b8fa")
        (revision "0"))
    (package
      (name "d2x-rebirth-git")
      (version (git-version "0.60.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dxx-rebirth/dxx-rebirth")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://www.dxx-rebirth.com/")
      (synopsis "descent 2 engine source port")
      (description "D2X-Rebirth is a source port of the Descent 2 game engine,
providing modern platform support, OpenGL rendering, and quality-of-life
improvements.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 75. limo-git
;;; ===================================================================
;;; Source: https://github.com/limo-app/limo/
;;; Qt-based mod manager

(define-public limo-git
  (let ((commit "ab12e3dd9ec1ed7163a3d9b0e71a8192de53ff6e")
        (revision "0"))
    (package
      (name "limo-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/limo-app/limo")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/limo-app/limo/")
      (synopsis "qt-based mod manager for games")
      (description "Limo is a Qt-based mod manager that helps organize, install,
and manage game modifications.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 76. thunar-devel
;;; ===================================================================
;;; Source: https://thunar.xfce.org
;;; Xfce file manager (dev version)

(define-public thunar-devel
  (package
    (name "thunar-devel")
    (version "4.21.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://archive.xfce.org/src/xfce/thunar/"
                    (version-major+minor version) "/thunar-" version ".tar.bz2"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://thunar.xfce.org")
    (synopsis "xfce file manager development version")
    (description "Thunar is the Xfce file manager, designed for speed and ease
of use.  This is the development version.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 77. neovim-catppuccin
;;; ===================================================================
;;; Source: https://github.com/catppuccin/nvim
;;; Catppuccin theme for Neovim

(define-public neovim-catppuccin
  (package
    (name "neovim-catppuccin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/catppuccin/nvim/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/catppuccin/nvim")
    (synopsis "catppuccin color scheme for Neovim")
    (description "Catppuccin is a soothing pastel color scheme for Neovim with
four flavor variants: Latte, Frappe, Macchiato, and Mocha.")
    (license license:expat)))

;;; ===================================================================
;;; 78. remind-me-git
;;; ===================================================================
;;; Source: https://github.com/carrotfarmer/remindme
;;; Lightweight CLI reminders

(define-public remind-me-git
  (let ((commit "63a310883b59619714fa2d325176026b1dff68c3")
        (revision "0"))
    (package
      (name "remind-me-git")
      (version (git-version "2.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/carrotfarmer/remindme")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/carrotfarmer/remindme")
      (synopsis "lightweight CLI reminder tool")
      (description "RemindMe is a lightweight command-line tool for setting and
managing reminders, written in Rust.")
      (license license:expat))))

;;; ===================================================================
;;; 79. pkgfile-git
;;; ===================================================================
;;; Source: https://github.com/falconindy/pkgfile
;;; pacman .files metadata explorer

(define-public pkgfile-git
  (let ((commit "06b6f433ff9b70f08c2c9660458c626e50a69dd1")
        (revision "0"))
    (package
      (name "pkgfile-git")
      (version (git-version "21" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/falconindy/pkgfile")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/falconindy/pkgfile")
      (synopsis "pacman .files metadata explorer")
      (description "Pkgfile is a tool for searching which package provides a given
file in pacman-based repositories using .files metadata.")
      (license license:expat))))
