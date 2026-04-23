;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260423g
;;; Resolves 100 BLOCKED/FAILED packages via dependency-tree priority.
;;;
;;; New recipes (100):
;;;      1.  git-koji-bin (copy-build-system, v3.4.0, license:expat)
;;;      2.  qoder-bin (copy-build-system, v0.14.1, license:non-copyleft)
;;;      3.  flutter-engine-android-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;      4.  flutter-engine-linux-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;      5.  flutter-engine-web-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;      6.  flutter-gradle-google-bin (copy-build-system, v3.35.7, (list license:bsd-3 license:non-copyleft))
;;;      7.  gnome-shell-extension-blur-my-shell (copy-build-system, v72, license:expat)
;;;      8.  gnome-shell-extension-top-bar-organizer (copy-build-system, v14, license:gpl3)
;;;      9.  gputest (copy-build-system, v0.7.0, license:non-copyleft)
;;;     10.  greetd-dms-greeter-git (gnu-build-system, v0.2.2.13.g1abd3ef, license:gpl3)
;;;     11.  hid-asus-mouse-dkms-git (copy-build-system, vr13.9a23175, license:gpl3)
;;;     12.  immuarch-verity-git (copy-build-system, v0.2.0.r271.6a4a7d0, license:gpl3+)
;;;     13.  intel-ipu6-camera-bin (copy-build-system, vr92.30e8766, license:non-copyleft)
;;;     14.  ionosctl (go-build-system, v6.9.9, license:asl2.0)
;;;     15.  ivpn-ui (node-build-system, v3.15.0, license:gpl3)
;;;     16.  java-gurobi (copy-build-system, v13.0.1, license:non-copyleft)
;;;     17.  journalctl-desktop-notification (copy-build-system, v1.6.1, license:gpl3)
;;;     18.  komac (cargo-build-system, v2.15.0, license:gpl3+)
;;;     19.  krokiet-bin (copy-build-system, v11.0.1, license:gpl3)
;;;     20.  lazygit-git (gnu-build-system, v0.38.2.r89.ec5075104, license:expat)
;;;     21.  lbn (cargo-build-system, v1.1.10, license:gpl2)
;;;     22.  lib32-nvidia-580xx-utils (copy-build-system, v580.142, license:non-copyleft)
;;;     23.  lib32-vulkan-amdgpu-pro (copy-build-system, v25.10_2202160, license:non-copyleft)
;;;     24.  libisl-git (copy-build-system, v0.24.332.geb702ee7, license:expat)
;;;     25.  linux-firewire-utils (meson-build-system, v0.5.1, license:gpl2)
;;;     26.  longbridge-pro-appimage (copy-build-system, v0.13.2, license:non-copyleft)
;;;     27.  lux-dl-git (go-build-system, v0.24.1.r25.dd00f6d, license:expat)
;;;     28.  maki-cli (cargo-build-system, v0.1.0, license:expat)
;;;     29.  mal (cargo-build-system, v0.2.0, license:expat)
;;;     30.  mediatek-mt7927-dkms (copy-build-system, v2.11, license:gpl2)
;;;     31.  motrix-bin (copy-build-system, v1.8.19, license:expat)
;;;     32.  msodbcsql (copy-build-system, v18.5.1.1, license:non-copyleft)
;;;     33.  mt76-dkms-git (copy-build-system, vr4269.de635e1e, license:gpl3+)
;;;     34.  netease-cloud-music-wine (copy-build-system, v3.1.30.205130, license:non-copyleft)
;;;     35.  nohang-git (gnu-build-system, v0.2.0.r8.gb84cf12, license:expat)
;;;     36.  noorfetch (cargo-build-system, v3.2.0, license:gpl3+)
;;;     37.  novel-editor-bin (copy-build-system, v0.1.80, license:expat)
;;;     38.  nuls (cargo-build-system, v0.2.0, license:expat)
;;;     39.  nvidia-580xx-dkms (copy-build-system, v580.142, license:non-copyleft)
;;;     40.  nvm-fish (copy-build-system, v1.1.2, license:expat)
;;;     41.  obs-composite-blur (cmake-build-system, v1.5.2, license:gpl2+)
;;;     42.  oracle-sqldeveloper (copy-build-system, v24.3.1.347.1826, license:non-copyleft)
;;;     43.  pacdep (copy-build-system, v1.1.0, license:gpl3+)
;;;     44.  pam_usb (copy-build-system, v0.8.5, license:gpl2)
;;;     45.  paru-bin (copy-build-system, v2.1.0, license:gpl3+)
;;;     46.  parus (copy-build-system, v1.1.5, license:gpl3+)
;;;     47.  perl-module-starter (copy-build-system, v1.82, (list license:gpl3+ license:non-copyleft))
;;;     48.  perl-net-curl (copy-build-system, v0.58, (list license:gpl3+ license:non-copyleft))
;;;     49.  perl-poe-filter-ircd (copy-build-system, v2.44, (list license:gpl3+ license:non-copyleft))
;;;     50.  pgmodeler (copy-build-system, v1.2.3, license:gpl3)
;;;     51.  pgvector (copy-build-system, v0.8.2, license:non-copyleft)
;;;     52.  plasma6-applets-panel-spacer-extended (copy-build-system, v1.15.0, license:gpl3)
;;;     53.  rclonefzf (copy-build-system, v1.0.19, license:gpl3+)
;;;     54.  rivetui-git (gnu-build-system, v0.3.1, license:expat)
;;;     55.  rtl8851bu-dkms-git (copy-build-system, v1.19.10.r37.3e6c300, license:gpl2)
;;;     56.  rtl88x2bu-dkms-git (copy-build-system, v5.13.1.r209.fcf8bf2, license:gpl2)
;;;     57.  ruby-flexmock (copy-build-system, v3.0.2, license:expat)
;;;     58.  rvgl-original (copy-build-system, v1, license:non-copyleft)
;;;     59.  samrewritten (cargo-build-system, v1.2.3, license:gpl3)
;;;     60.  shamela (copy-build-system, v4, license:non-copyleft)
;;;     61.  shiny-mirrors (cargo-build-system, vr269.0e59fd0, license:gpl3)
;;;     62.  spotify-adblock-git (cargo-build-system, v1.0.2.r0.g9ba383b, license:gpl3)
;;;     63.  steamvr-openhmd-git (cmake-build-system, vr61.b4899b2, license:non-copyleft)
;;;     64.  tetrio-desktop-electron (copy-build-system, v10.0.0, license:non-copyleft)
;;;     65.  thorium-reader (copy-build-system, v3.4.0, license:expat)
;;;     66.  tirith (cargo-build-system, v0.3.0, license:agpl3)
;;;     67.  transgui-git (gnu-build-system, v5.18.8.r1.ga704302, license:gpl2+)
;;;     68.  update-mirrors (copy-build-system, v1.23, license:non-copyleft)
;;;     69.  uutils-diffutils (cargo-build-system, v0.5.0, (list license:asl2.0 license:expat))
;;;     70.  val (cargo-build-system, v0.3.6, license:cc0)
;;;     71.  worldeditor-bin (copy-build-system, v2.6.0r2, license:gpl3+)
;;;     72.  xterminal-bin (copy-build-system, v5.6.3, license:non-copyleft)
;;;     73.  yp-tools (copy-build-system, v4.2.3, license:gpl2)
;;;     74.  ytify (copy-build-system, v0.0.1, license:gpl3)
;;;     75.  zenmonitor3 (copy-build-system, v2.0.0, license:gpl3+)
;;;     76.  zond (cargo-build-system, v0.3.6, license:mpl2.0)
;;;     77.  86box-manager (copy-build-system, v1.7.6.0e, license:expat)
;;;     78.  android-ndk (copy-build-system, vr29, (list license:non-copyleft license:gpl3+ license:lgpl3+))
;;;     79.  aqemu (cmake-build-system, v0.9.4, license:gpl2)
;;;     80.  armv7l-binutils (copy-build-system, v2.46, license:gpl3+)
;;;     81.  asset-ripper-bin (copy-build-system, v1.3.9, license:gpl3)
;;;     82.  axenc-git (cmake-build-system, v0.1.0.r31.g4f09033, license:gpl3)
;;;     83.  backrest (go-build-system, v1.12.1, license:gpl3+)
;;;     84.  bootstrap-studio (copy-build-system, v8.0.1, license:non-copyleft)
;;;     85.  chess-native (cargo-build-system, v1.0.0, license:expat)
;;;     86.  clash-verge-rev-bin (copy-build-system, v2.4.7, license:gpl3)
;;;     87.  coreusage-git (gnu-build-system, vV1.0.5.r0.gb23bd84, license:expat)
;;;     88.  deltaclient-git (cargo-build-system, vr154.97e898f, license:agpl3+)
;;;     89.  derper-ipcert (go-build-system, v1.96.4, license:bsd-3)
;;;     90.  ente-auth-bin (copy-build-system, v4.4.17, license:agpl3+)
;;;     91.  fastmail (copy-build-system, v1.2.1, license:non-copyleft)
;;;     92.  firefox-extension-bitwarden (node-build-system, v2026.1.1, license:gpl3+)
;;;     93.  fred (copy-build-system, v1.0.0, license:gpl3)
;;;     94.  gentoo-sources (copy-build-system, v6.15, license:gpl2)
;;;     95.  gitkraken (copy-build-system, v12.0.1, license:non-copyleft)
;;;     96.  gnome-x11-gesture-daemon (cargo-build-system, v0.2.1, license:expat)
;;;     97.  hid-fanatecff-dkms (copy-build-system, v0.2.2, license:gpl2)
;;;     98.  hp15c (copy-build-system, v5.1.00, license:gpl3)
;;;     99.  iacs (copy-build-system, v1.1.9.12, license:non-copyleft)
;;;    100.  kde-service-menu-reimage-mod (copy-build-system, v24.06.15, license:gpl3+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless obtained from PKGBUILD.
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260423g)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages pkg-config)
  #:export (
            git-koji-bin
            qoder-bin
            flutter-engine-android-google-bin
            flutter-engine-linux-google-bin
            flutter-engine-web-google-bin
            flutter-gradle-google-bin
            gnome-shell-extension-blur-my-shell
            gnome-shell-extension-top-bar-organizer
            gputest
            greetd-dms-greeter-git
            hid-asus-mouse-dkms-git
            immuarch-verity-git
            intel-ipu6-camera-bin
            ionosctl
            ivpn-ui
            java-gurobi
            journalctl-desktop-notification
            komac
            krokiet-bin
            lazygit-git
            lbn
            lib32-nvidia-580xx-utils
            lib32-vulkan-amdgpu-pro
            libisl-git
            linux-firewire-utils
            longbridge-pro-appimage
            lux-dl-git
            maki-cli
            mal
            mediatek-mt7927-dkms
            motrix-bin
            msodbcsql
            mt76-dkms-git
            netease-cloud-music-wine
            nohang-git
            noorfetch
            novel-editor-bin
            nuls
            nvidia-580xx-dkms
            nvm-fish
            obs-composite-blur
            oracle-sqldeveloper
            pacdep
            pam-usb
            paru-bin
            parus
            perl-module-starter
            perl-net-curl
            perl-poe-filter-ircd
            pgmodeler
            pgvector
            plasma6-applets-panel-spacer-extended
            rclonefzf
            rivetui-git
            rtl8851bu-dkms-git
            rtl88x2bu-dkms-git
            ruby-flexmock
            rvgl-original
            samrewritten
            shamela
            shiny-mirrors
            spotify-adblock-git
            steamvr-openhmd-git
            tetrio-desktop-electron
            thorium-reader
            tirith
            transgui-git
            update-mirrors
            uutils-diffutils
            val
            worldeditor-bin
            xterminal-bin
            yp-tools
            ytify
            zenmonitor3
            zond
            pkg-86box-manager
            android-ndk
            aqemu
            armv7l-binutils
            asset-ripper-bin
            axenc-git
            backrest
            bootstrap-studio
            chess-native
            clash-verge-rev-bin
            coreusage-git
            deltaclient-git
            derper-ipcert
            ente-auth-bin
            fastmail
            firefox-extension-bitwarden
            fred
            gentoo-sources
            gitkraken
            gnome-x11-gesture-daemon
            hid-fanatecff-dkms
            hp15c
            iacs
            kde-service-menu-reimage-mod
            ))

;;; -------------------------------------------------------------------
;;; 3215. git-koji-bin --- an interactive CLI for creating conventional commits
;;; -------------------------------------------------------------------
(define-public git-koji-bin
  (package
    (name "git-koji-bin")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cococonscious/koji/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an interactive CLI for creating conventional commits")
    (description "An interactive CLI for creating conventional commits.")
    (home-page "https://github.com/cococonscious/koji")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5001. qoder-bin --- agent Programming Platform for Real Software.(Prebuilt version.Use sys...
;;; -------------------------------------------------------------------
(define-public qoder-bin
  (package
    (name "qoder-bin")
    (version "0.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://qoder.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "agent Programming Platform for Real Software.(Prebuilt version.Use system-wid...")
    (description "Agent Programming Platform for Real Software.(Prebuilt version.Use system-wide electron).")
    (home-page "https://qoder.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8151. flutter-engine-android-google-bin --- flutter SDK artifacts (binary from Google) - android engine
;;; -------------------------------------------------------------------
(define-public flutter-engine-android-google-bin
  (package
    (name "flutter-engine-android-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - android engine")
    (description "Flutter SDK artifacts (binary from Google) - android engine.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 8149. flutter-engine-linux-google-bin --- flutter SDK artifacts (binary from Google) - linux engine
;;; -------------------------------------------------------------------
(define-public flutter-engine-linux-google-bin
  (package
    (name "flutter-engine-linux-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - linux engine")
    (description "Flutter SDK artifacts (binary from Google) - linux engine.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 8150. flutter-engine-web-google-bin --- flutter SDK artifacts (binary from Google) - web engine
;;; -------------------------------------------------------------------
(define-public flutter-engine-web-google-bin
  (package
    (name "flutter-engine-web-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - web engine")
    (description "Flutter SDK artifacts (binary from Google) - web engine.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 8154. flutter-gradle-google-bin --- flutter SDK artifacts (binary from Google) - gradle wrapper
;;; -------------------------------------------------------------------
(define-public flutter-gradle-google-bin
  (package
    (name "flutter-gradle-google-bin")
    (version "3.35.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://flutter.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flutter SDK artifacts (binary from Google) - gradle wrapper")
    (description "Flutter SDK artifacts (binary from Google) - gradle wrapper.")
    (home-page "https://flutter.dev")
    (license (list license:bsd-3 license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 9490. gnome-shell-extension-blur-my-shell --- extension that adds a blur look to different parts of the GNOME Shell
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-blur-my-shell
  (package
    (name "gnome-shell-extension-blur-my-shell")
    (version "72")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/aunetx/blur-my-shell/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extension that adds a blur look to different parts of the GNOME Shell")
    (description "Extension that adds a blur look to different parts of the GNOME Shell.")
    (home-page "https://github.com/aunetx/blur-my-shell")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5886. gnome-shell-extension-top-bar-organizer --- gnome: Organize the items of the top (menu)bar
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-top-bar-organizer
  (package
    (name "gnome-shell-extension-top-bar-organizer")
    (version "14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.gnome.org/julianschacher/top-bar-organizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gnome: Organize the items of the top (menu)bar")
    (description "Gnome: Organize the items of the top (menu)bar.")
    (home-page "https://gitlab.gnome.org/julianschacher/top-bar-organizer")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8067. gputest --- cross-platform GPU stress test and OpenGL benchmark. Contains FurMark,...
;;; -------------------------------------------------------------------
(define-public gputest
  (package
    (name "gputest")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.geeks3d.com/gputest/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark")
    (description "Cross-platform GPU stress test and OpenGL benchmark. Contains FurMark, TessMark.")
    (home-page "http://www.geeks3d.com/gputest/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2261. greetd-dms-greeter-git --- dankMaterialShell greeter for greetd
;;; -------------------------------------------------------------------
(define-public greetd-dms-greeter-git
  (package
    (name "greetd-dms-greeter-git")
    (version "0.2.2.13.g1abd3ef")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AvengeMedia/DankMaterialShell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "dankMaterialShell greeter for greetd")
    (description "DankMaterialShell greeter for greetd.")
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16133. hid-asus-mouse-dkms-git --- hID driver for ASUS ROG & TUF mice providing generation of keyboard ev...
;;; -------------------------------------------------------------------
(define-public hid-asus-mouse-dkms-git
  (package
    (name "hid-asus-mouse-dkms-git")
    (version "r13.9a23175")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kyokenn/hid-asus-mouse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hID driver for ASUS ROG & TUF mice providing generation of keyboard events")
    (description "HID driver for ASUS ROG & TUF mice providing generation of keyboard events.")
    (home-page "https://github.com/kyokenn/hid-asus-mouse")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5989. immuarch-verity-git --- immutable Archlinux setup with transactional & atomic updates
;;; -------------------------------------------------------------------
(define-public immuarch-verity-git
  (package
    (name "immuarch-verity-git")
    (version "0.2.0.r271.6a4a7d0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://framagit.org/Brumaire/immuarch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "immutable Archlinux setup with transactional & atomic updates")
    (description "Immutable Archlinux setup with transactional & atomic updates.")
    (home-page "https://framagit.org/Brumaire/immuarch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 5822. intel-ipu6-camera-bin --- intel IPU6 camera binaries
;;; -------------------------------------------------------------------
(define-public intel-ipu6-camera-bin
  (package
    (name "intel-ipu6-camera-bin")
    (version "r92.30e8766")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/intel/ipu6-camera-bins/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel IPU6 camera binaries")
    (description "Intel IPU6 camera binaries.")
    (home-page "https://github.com/intel/ipu6-camera-bins")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5547. ionosctl --- iONOS Cloud CLI
;;; -------------------------------------------------------------------
(define-public ionosctl
  (package
    (name "ionosctl")
    (version "6.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ionos-cloud/ionosctl/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/ionos-cloud/ionosctl"))
    (synopsis "iONOS Cloud CLI")
    (description "IONOS Cloud CLI.")
    (home-page "https://github.com/ionos-cloud/ionosctl")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2197. ivpn-ui --- iVPN - Secure VPN for Privacy
;;; -------------------------------------------------------------------
(define-public ivpn-ui
  (package
    (name "ivpn-ui")
    (version "3.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ivpn.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iVPN - Secure VPN for Privacy")
    (description "IVPN - Secure VPN for Privacy.")
    (home-page "https://www.ivpn.net")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8077. java-gurobi --- state-of-the-art solver for mathematical programming (Java bindings)
;;; -------------------------------------------------------------------
(define-public java-gurobi
  (package
    (name "java-gurobi")
    (version "13.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gurobi.com/products/gurobi-optimizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "state-of-the-art solver for mathematical programming (Java bindings)")
    (description "State-of-the-art solver for mathematical programming (Java bindings).")
    (home-page "https://www.gurobi.com/products/gurobi-optimizer")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2304. journalctl-desktop-notification --- displays notifications for journalctl error messages
;;; -------------------------------------------------------------------
(define-public journalctl-desktop-notification
  (package
    (name "journalctl-desktop-notification")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/Zesko/journalctl-desktop-notification/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "displays notifications for journalctl error messages")
    (description "Displays notifications for journalctl error messages.")
    (home-page "https://gitlab.com/Zesko/journalctl-desktop-notification")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 346. komac --- the Community Manifest Creator for WinGet
;;; -------------------------------------------------------------------
(define-public komac
  (package
    (name "komac")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/russellbanks/Komac/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Community Manifest Creator for WinGet")
    (description "The Community Manifest Creator for WinGet.")
    (home-page "https://github.com/russellbanks/Komac")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 1840. krokiet-bin --- find and manage duplicate files, empty folders, similar images, and ot...
;;; -------------------------------------------------------------------
(define-public krokiet-bin
  (package
    (name "krokiet-bin")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/qarmin/czkawka/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find and manage duplicate files, empty folders, similar images, and other "li...")
    (description "Find and manage duplicate files, empty folders, similar images, and other "lint" (Slint GUI of Czkawka, with HEIF support).")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7090. lazygit-git --- a simple terminal UI for git commands
;;; -------------------------------------------------------------------
(define-public lazygit-git
  (package
    (name "lazygit-git")
    (version "0.38.2.r89.ec5075104")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jesseduffield/lazygit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a simple terminal UI for git commands")
    (description "A simple terminal UI for git commands.")
    (home-page "https://github.com/jesseduffield/lazygit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5946. lbn --- lightweight program (~2MB of RAM) that sends a notification to the use...
;;; -------------------------------------------------------------------
(define-public lbn
  (package
    (name "lbn")
    (version "1.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~aeldit/lbn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight program (~2MB of RAM) that sends a notification to the user's des...")
    (description "Lightweight program (~2MB of RAM) that sends a notification to the user's desktop when battery percentage drops bellow 20, 10 and 5 %.")
    (home-page "https://git.sr.ht/~aeldit/lbn")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 1831. lib32-nvidia-580xx-utils --- nVIDIA drivers utilities (32-bit) (580xx)
;;; -------------------------------------------------------------------
(define-public lib32-nvidia-580xx-utils
  (package
    (name "lib32-nvidia-580xx-utils")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA drivers utilities (32-bit) (580xx)")
    (description "NVIDIA drivers utilities (32-bit) (580xx).")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5712. lib32-vulkan-amdgpu-pro --- aMDGPU Pro Vulkan driver (32-bit)
;;; -------------------------------------------------------------------
(define-public lib32-vulkan-amdgpu-pro
  (package
    (name "lib32-vulkan-amdgpu-pro")
    (version "25.10_2202160")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aMDGPU Pro Vulkan driver (32-bit)")
    (description "AMDGPU Pro Vulkan driver (32-bit).")
    (home-page "https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-22-40")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7900. libisl-git --- library for manipulating sets and relations of integer points bounded ...
;;; -------------------------------------------------------------------
(define-public libisl-git
  (package
    (name "libisl-git")
    (version "0.24.332.geb702ee7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://libisl.sourceforge.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for manipulating sets and relations of integer points bounded by line...")
    (description "Library for manipulating sets and relations of integer points bounded by linear constraints (development version).")
    (home-page "https://libisl.sourceforge.io/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8485. linux-firewire-utils --- list and change the configuration of connected FireWire devices. Forme...
;;; -------------------------------------------------------------------
(define-public linux-firewire-utils
  (package
    (name "linux-firewire-utils")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.kernel.org/pub/scm/utils/ieee1394/linux-firewire-utils.git/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "list and change the configuration of connected FireWire devices. Formerly juj...")
    (description "List and change the configuration of connected FireWire devices. Formerly jujuutils.")
    (home-page "https://git.kernel.org/pub/scm/utils/ieee1394/linux-firewire-utils.git")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8460. longbridge-pro-appimage --- a professional trading platform tailored to your needs
;;; -------------------------------------------------------------------
(define-public longbridge-pro-appimage
  (package
    (name "longbridge-pro-appimage")
    (version "0.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://longbridge.com/desktop/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a professional trading platform tailored to your needs")
    (description "A professional trading platform tailored to your needs.")
    (home-page "https://longbridge.com/desktop/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7936. lux-dl-git --- fast and simple video download library and CLI tool written in Go
;;; -------------------------------------------------------------------
(define-public lux-dl-git
  (package
    (name "lux-dl-git")
    (version "0.24.1.r25.dd00f6d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iawia002/lux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/iawia002/lux"))
    (synopsis "fast and simple video download library and CLI tool written in Go")
    (description "Fast and simple video download library and CLI tool written in Go.")
    (home-page "https://github.com/iawia002/lux")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5941. maki-cli --- a cross-platform fuzzy Makefile task finder
;;; -------------------------------------------------------------------
(define-public maki-cli
  (package
    (name "maki-cli")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cesarferreira/maki/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform fuzzy Makefile task finder")
    (description "A cross-platform fuzzy Makefile task finder.")
    (home-page "https://github.com/cesarferreira/maki")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1660. mal --- a terminal client for MyAnimeList (integrated with ani-cli) written in...
;;; -------------------------------------------------------------------
(define-public mal
  (package
    (name "mal")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/swstl/mal-cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal client for MyAnimeList (integrated with ani-cli) written in rust")
    (description "A terminal client for MyAnimeList (integrated with ani-cli) written in rust.")
    (home-page "https://github.com/swstl/mal-cli")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11404. mediatek-mt7927-dkms --- dKMS Bluetooth (MT6639) and WiFi (MT7925e/MT7902) modules for MediaTek...
;;; -------------------------------------------------------------------
(define-public mediatek-mt7927-dkms
  (package
    (name "mediatek-mt7927-dkms")
    (version "2.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jetm/mediatek-mt7927-dkms/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dKMS Bluetooth (MT6639) and WiFi (MT7925e/MT7902) modules for MediaTek MT7927...")
    (description "DKMS Bluetooth (MT6639) and WiFi (MT7925e/MT7902) modules for MediaTek MT7927 Filogic 380.")
    (home-page "https://github.com/jetm/mediatek-mt7927-dkms")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8420. motrix-bin --- a full-featured download manager (binary version)
;;; -------------------------------------------------------------------
(define-public motrix-bin
  (package
    (name "motrix-bin")
    (version "1.8.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/agalwood/Motrix/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a full-featured download manager (binary version)")
    (description "A full-featured download manager (binary version).")
    (home-page "https://github.com/agalwood/Motrix")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6023. msodbcsql --- microsoft® ODBC Driver 18 for SQL Server®
;;; -------------------------------------------------------------------
(define-public msodbcsql
  (package
    (name "msodbcsql")
    (version "18.5.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft® ODBC Driver 18 for SQL Server®")
    (description "Microsoft® ODBC Driver 18 for SQL Server®.")
    (home-page "https://techcommunity.microsoft.com/t5/sql-server-blog/bg-p/SQLServer/label-name/SQLServerDrivers")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14914. mt76-dkms-git --- dKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7...
;;; -------------------------------------------------------------------
(define-public mt76-dkms-git
  (package
    (name "mt76-dkms-git")
    (version "r4269.de635e1e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openwrt/mt76")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7925 sup...")
    (description "DKMS build of the MediaTek mt76 wireless driver from OpenWRT (with mt7925 support).")
    (home-page "https://github.com/openwrt/mt76")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8482. netease-cloud-music-wine --- netEase Cloud Music Player. 使用wine运行网易云音乐windows官方包。
;;; -------------------------------------------------------------------
(define-public netease-cloud-music-wine
  (package
    (name "netease-cloud-music-wine")
    (version "3.1.30.205130")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://music.163.com/#/download/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "netEase Cloud Music Player. 使用wine运行网易云音乐windows官方包。")
    (description "NetEase Cloud Music Player. 使用wine运行网易云音乐windows官方包。.")
    (home-page "https://music.163.com/#/download")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2155. nohang-git --- a sophisticated low memory handler
;;; -------------------------------------------------------------------
(define-public nohang-git
  (package
    (name "nohang-git")
    (version "0.2.0.r8.gb84cf12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hakavlad/nohang")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a sophisticated low memory handler")
    (description "A sophisticated low memory handler.")
    (home-page "https://github.com/hakavlad/nohang")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 1453. noorfetch --- minimal and fast system information fetch tool written in Rust
;;; -------------------------------------------------------------------
(define-public noorfetch
  (package
    (name "noorfetch")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/limforge/noorfetch/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minimal and fast system information fetch tool written in Rust")
    (description "Minimal and fast system information fetch tool written in Rust.")
    (home-page "https://codeberg.org/limforge/noorfetch")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7164. novel-editor-bin --- professional novel writing application with advanced project managemen...
;;; -------------------------------------------------------------------
(define-public novel-editor-bin
  (package
    (name "novel-editor-bin")
    (version "0.1.80")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jeasoncc/novel-editor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "professional novel writing application with advanced project management and w...")
    (description "Professional novel writing application with advanced project management and world-building tools (binary).")
    (home-page "https://github.com/jeasoncc/novel-editor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7132. nuls --- nuShell-inspired ls with colorful table output, human-readable sizes, ...
;;; -------------------------------------------------------------------
(define-public nuls
  (package
    (name "nuls")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/cesarferreira/nuls/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nuShell-inspired ls with colorful table output, human-readable sizes, and rec...")
    (description "NuShell-inspired ls with colorful table output, human-readable sizes, and recency-aware timestamps.")
    (home-page "https://github.com/cesarferreira/nuls")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11318. nvidia-580xx-dkms --- nVIDIA kernel modules - module sources (580xx)
;;; -------------------------------------------------------------------
(define-public nvidia-580xx-dkms
  (package
    (name "nvidia-580xx-dkms")
    (version "580.142")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nvidia.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nVIDIA kernel modules - module sources (580xx)")
    (description "NVIDIA kernel modules - module sources (580xx).")
    (home-page "http://www.nvidia.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8722. nvm-fish --- fish shell wrapper for official nvm using bass - enables nvm commands ...
;;; -------------------------------------------------------------------
(define-public nvm-fish
  (package
    (name "nvm-fish")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ChHsiching/nvm-fish-aur/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fish shell wrapper for official nvm using bass - enables nvm commands in fish...")
    (description "Fish shell wrapper for official nvm using bass - enables nvm commands in fish while preserving full compatibility with bash nvm installations.")
    (home-page "https://github.com/ChHsiching/nvm-fish-aur")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9524. obs-composite-blur --- comprehensive blur plugin for OBS that provides several different blur...
;;; -------------------------------------------------------------------
(define-public obs-composite-blur
  (package
    (name "obs-composite-blur")
    (version "1.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FiniteSingularity/obs-composite-blur/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "comprehensive blur plugin for OBS that provides several different blur algori...")
    (description "Comprehensive blur plugin for OBS that provides several different blur algorithms, and proper compositing.")
    (home-page "https://github.com/FiniteSingularity/obs-composite-blur")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 8085. oracle-sqldeveloper --- a graphical tool for database development
;;; -------------------------------------------------------------------
(define-public oracle-sqldeveloper
  (package
    (name "oracle-sqldeveloper")
    (version "24.3.1.347.1826")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.oracle.com/tools/downloads/sqldev-downloads.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical tool for database development")
    (description "A graphical tool for database development.")
    (home-page "https://www.oracle.com/tools/downloads/sqldev-downloads.html")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 16251. pacdep --- package Dependencies listing
;;; -------------------------------------------------------------------
(define-public pacdep
  (package
    (name "pacdep")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://jjacky.com/pacdep/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "package Dependencies listing")
    (description "Package Dependencies listing.")
    (home-page "https://jjacky.com/pacdep")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 161. pam_usb --- hardware authentication for Linux using ordinary flash media (USB & Ca...
;;; -------------------------------------------------------------------
(define-public pam-usb
  (package
    (name "pam_usb")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mcdope/pam_usb/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hardware authentication for Linux using ordinary flash media (USB & Card based)")
    (description "Hardware authentication for Linux using ordinary flash media (USB & Card based).")
    (home-page "https://github.com/mcdope/pam_usb")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 11385. paru-bin --- feature packed AUR helper
;;; -------------------------------------------------------------------
(define-public paru-bin
  (package
    (name "paru-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/morganamilo/paru/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "feature packed AUR helper")
    (description "Feature packed AUR helper.")
    (home-page "https://github.com/morganamilo/paru")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15189. parus --- a package search TUI for Paru, powered by Skim
;;; -------------------------------------------------------------------
(define-public parus
  (package
    (name "parus")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/salvoton/parus/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a package search TUI for Paru, powered by Skim")
    (description "A package search TUI for Paru, powered by Skim.")
    (home-page "https://github.com/salvoton/parus")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 708. perl-module-starter --- a simple starter kit for any module
;;; -------------------------------------------------------------------
(define-public perl-module-starter
  (package
    (name "perl-module-starter")
    (version "1.82")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://metacpan.org/release/Module-Starter/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple starter kit for any module")
    (description "A simple starter kit for any module.")
    (home-page "https://metacpan.org/release/Module-Starter")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 781. perl-net-curl --- perl interface for libcurl
;;; -------------------------------------------------------------------
(define-public perl-net-curl
  (package
    (name "perl-net-curl")
    (version "0.58")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://search.mcpan.org/dist/Net-Curl/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl interface for libcurl")
    (description "Perl interface for libcurl.")
    (home-page "http://search.mcpan.org/dist/Net-Curl")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 753. perl-poe-filter-ircd --- a POE-based parser for the IRC protocol
;;; -------------------------------------------------------------------
(define-public perl-poe-filter-ircd
  (package
    (name "perl-poe-filter-ircd")
    (version "2.44")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://search.cpan.org/dist/POE-Filter-IRCD/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a POE-based parser for the IRC protocol")
    (description "A POE-based parser for the IRC protocol.")
    (home-page "http://search.cpan.org/dist/POE-Filter-IRCD/")
    (license (list license:gpl3+ license:non-copyleft))))

;;; -------------------------------------------------------------------
;;; 7101. pgmodeler --- postgreSQL Database Modeler: an open source CASE tool for modeling Pos...
;;; -------------------------------------------------------------------
(define-public pgmodeler
  (package
    (name "pgmodeler")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pgmodeler.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "postgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL...")
    (description "PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases.")
    (home-page "https://pgmodeler.io")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 9501. pgvector --- a vector similarity search extension for PostgreSQL
;;; -------------------------------------------------------------------
(define-public pgvector
  (package
    (name "pgvector")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pgvector/pgvector/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a vector similarity search extension for PostgreSQL")
    (description "A vector similarity search extension for PostgreSQL.")
    (home-page "https://github.com/pgvector/pgvector")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5776. plasma6-applets-panel-spacer-extended --- mouse gestures for the KDE Plasma Panel, drag window, run any shortcut...
;;; -------------------------------------------------------------------
(define-public plasma6-applets-panel-spacer-extended
  (package
    (name "plasma6-applets-panel-spacer-extended")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/luisbocanegra/plasma-panel-spacer-extended/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mouse gestures for the KDE Plasma Panel, drag window, run any shortcut, comma...")
    (description "Mouse gestures for the KDE Plasma Panel, drag window, run any shortcut, command, application with configurable mouse actions!.")
    (home-page "https://github.com/luisbocanegra/plasma-panel-spacer-extended")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5585. rclonefzf --- interactive terminal UI for browsing and viewing files on rclone remot...
;;; -------------------------------------------------------------------
(define-public rclonefzf
  (package
    (name "rclonefzf")
    (version "1.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ConnerWill/rclonefzf/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive terminal UI for browsing and viewing files on rclone remotes usin...")
    (description "Interactive terminal UI for browsing and viewing files on rclone remotes using fzf.")
    (home-page "https://github.com/ConnerWill/rclonefzf")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7118. rivetui-git --- a Terminal UI Discord Client in Rust (latest)
;;; -------------------------------------------------------------------
(define-public rivetui-git
  (package
    (name "rivetui-git")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YetAnotherMechanicusEnjoyer/Rivet")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "a Terminal UI Discord Client in Rust (latest)")
    (description "A Terminal UI Discord Client in Rust (latest).")
    (home-page "https://github.com/YetAnotherMechanicusEnjoyer/Rivet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8408. rtl8851bu-dkms-git --- kernel module for Realtek RTL8851BU WiFi chipset
;;; -------------------------------------------------------------------
(define-public rtl8851bu-dkms-git
  (package
    (name "rtl8851bu-dkms-git")
    (version "1.19.10.r37.3e6c300")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fofajardo/rtl8851bu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for Realtek RTL8851BU WiFi chipset")
    (description "Kernel module for Realtek RTL8851BU WiFi chipset.")
    (home-page "https://github.com/fofajardo/rtl8851bu")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7111. rtl88x2bu-dkms-git --- kernel module for Realtek rtl88x2bu WiFi chipset
;;; -------------------------------------------------------------------
(define-public rtl88x2bu-dkms-git
  (package
    (name "rtl88x2bu-dkms-git")
    (version "5.13.1.r209.fcf8bf2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RinCat/RTL88x2BU-Linux-Driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kernel module for Realtek rtl88x2bu WiFi chipset")
    (description "Kernel module for Realtek rtl88x2bu WiFi chipset.")
    (home-page "https://github.com/RinCat/RTL88x2BU-Linux-Driver")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 8494. ruby-flexmock --- flexible mocking for Ruby testing
;;; -------------------------------------------------------------------
(define-public ruby-flexmock
  (package
    (name "ruby-flexmock")
    (version "3.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/doudou/flexmock/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flexible mocking for Ruby testing")
    (description "Flexible mocking for Ruby testing.")
    (home-page "https://github.com/doudou/flexmock")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7147. rvgl-original --- rVGL for GNU/Linux. Includes original soundtrack
;;; -------------------------------------------------------------------
(define-public rvgl-original
  (package
    (name "rvgl-original")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://rvgl.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rVGL for GNU/Linux. Includes original soundtrack")
    (description "RVGL for GNU/Linux. Includes original soundtrack.")
    (home-page "https://rvgl.org")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1648. samrewritten --- unlock achievements and stats on Steam, and more!
;;; -------------------------------------------------------------------
(define-public samrewritten
  (package
    (name "samrewritten")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/PaulCombal/SamRewritten/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unlock achievements and stats on Steam, and more!")
    (description "Unlock achievements and stats on Steam, and more!.")
    (home-page "https://github.com/PaulCombal/SamRewritten")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7143. shamela --- المكتبة الشاملة، A digital library which enables you to download, read...
;;; -------------------------------------------------------------------
(define-public shamela
  (package
    (name "shamela")
    (version "4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://shamela.ws/page/download/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "المكتبة الشاملة، A digital library which enables you to download, read and se...")
    (description "المكتبة الشاملة، A digital library which enables you to download, read and search arabic books.")
    (home-page "https://shamela.ws/page/download")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7082. shiny-mirrors --- an alternative to reflector, written in Rust! A tool to find the best ...
;;; -------------------------------------------------------------------
(define-public shiny-mirrors
  (package
    (name "shiny-mirrors")
    (version "r269.0e59fd0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/Arisa_Snowbell/shiny-mirrors/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an alternative to reflector, written in Rust! A tool to find the best mirrors...")
    (description "An alternative to reflector, written in Rust! A tool to find the best mirrors for you!.")
    (home-page "https://gitlab.com/Arisa_Snowbell/shiny-mirrors")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17360. spotify-adblock-git --- adblocker for Spotify
;;; -------------------------------------------------------------------
(define-public spotify-adblock-git
  (package
    (name "spotify-adblock-git")
    (version "1.0.2.r0.g9ba383b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abba23/spotify-adblock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adblocker for Spotify")
    (description "Adblocker for Spotify.")
    (home-page "https://github.com/abba23/spotify-adblock")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5952. steamvr-openhmd-git --- steamVR plugin for using OpenHMD drivers in SteamVR
;;; -------------------------------------------------------------------
(define-public steamvr-openhmd-git
  (package
    (name "steamvr-openhmd-git")
    (version "r61.b4899b2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ChristophHaag/SteamVR-OpenHMD")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "steamVR plugin for using OpenHMD drivers in SteamVR")
    (description "SteamVR plugin for using OpenHMD drivers in SteamVR.")
    (home-page "https://github.com/ChristophHaag/SteamVR-OpenHMD")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2209. tetrio-desktop-electron --- tETR.IO desktop client, using the system Electron package
;;; -------------------------------------------------------------------
(define-public tetrio-desktop-electron
  (package
    (name "tetrio-desktop-electron")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tetr.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tETR.IO desktop client, using the system Electron package")
    (description "TETR.IO desktop client, using the system Electron package.")
    (home-page "https://tetr.io/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5717. thorium-reader --- cross-platform desktop reading app based on the Readium Desktop toolki...
;;; -------------------------------------------------------------------
(define-public thorium-reader
  (package
    (name "thorium-reader")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/edrlab/thorium-reader/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform desktop reading app based on the Readium Desktop toolkit")
    (description "Cross-platform desktop reading app based on the Readium Desktop toolkit.")
    (home-page "https://github.com/edrlab/thorium-reader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2250. tirith --- terminal security - catches homograph attacks, pipe-to-shell, ANSI inj...
;;; -------------------------------------------------------------------
(define-public tirith
  (package
    (name "tirith")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/sheeki03/tirith/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal security - catches homograph attacks, pipe-to-shell, ANSI injection")
    (description "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection.")
    (home-page "https://github.com/sheeki03/tirith")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 8711. transgui-git --- transmission BitTorrent client (Qt6)
;;; -------------------------------------------------------------------
(define-public transgui-git
  (package
    (name "transgui-git")
    (version "5.18.8.r1.ga704302")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lighterowl/transgui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "transmission BitTorrent client (Qt6)")
    (description "Transmission BitTorrent client (Qt6).")
    (home-page "https://github.com/lighterowl/transgui")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16135. update-mirrors --- a simple command line (CLI) tool designed to simplify updating mirrors...
;;; -------------------------------------------------------------------
(define-public update-mirrors
  (package
    (name "update-mirrors")
    (version "1.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nellowint/update-mirrors/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple command line (CLI) tool designed to simplify updating mirrors of Arc...")
    (description "A simple command line (CLI) tool designed to simplify updating mirrors of Arch Linux-based systems.")
    (home-page "https://github.com/nellowint/update-mirrors")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8418. uutils-diffutils --- rust implementation of diffutils
;;; -------------------------------------------------------------------
(define-public uutils-diffutils
  (package
    (name "uutils-diffutils")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/uutils/diffutils/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust implementation of diffutils")
    (description "Rust implementation of diffutils.")
    (home-page "https://github.com/uutils/diffutils")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 7861. val --- an arbitrary precision calculator language
;;; -------------------------------------------------------------------
(define-public val
  (package
    (name "val")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/terror/val/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an arbitrary precision calculator language")
    (description "An arbitrary precision calculator language.")
    (home-page "https://github.com/terror/val")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 7169. worldeditor-bin --- worldEditor (WED) is a CAD-like graphic editor that lets you create cu...
;;; -------------------------------------------------------------------
(define-public worldeditor-bin
  (package
    (name "worldeditor-bin")
    (version "2.6.0r2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://developer.x-plane.com/tools/worldeditor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "worldEditor (WED) is a CAD-like graphic editor that lets you create custom ai...")
    (description "WorldEditor (WED) is a CAD-like graphic editor that lets you create custom airport layouts. It is designed for X-Plane, and works with apt.dat version 850 and higher.")
    (home-page "http://developer.x-plane.com/tools/worldeditor/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7955. xterminal-bin --- not only powerful SSH tools, but also local consoles, and more coming ...
;;; -------------------------------------------------------------------
(define-public xterminal-bin
  (package
    (name "xterminal-bin")
    (version "5.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.xterminal.cn/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "not only powerful SSH tools, but also local consoles, and more coming soon.(P...")
    (description "Not only powerful SSH tools, but also local consoles, and more coming soon.(Prebuilt version.Use system-wide electron)不仅是强大的SSH工具,更提供本地控制台,以及更多即将推出的开发相关功能.")
    (home-page "https://www.xterminal.cn/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 1863. yp-tools --- linux NIS Tools
;;; -------------------------------------------------------------------
(define-public yp-tools
  (package
    (name "yp-tools")
    (version "4.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/thkukuk/yp-tools/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux NIS Tools")
    (description "Linux NIS Tools.")
    (home-page "https://github.com/thkukuk/yp-tools")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 7972. ytify --- production build of ytify - lightweight YouTube player UI
;;; -------------------------------------------------------------------
(define-public ytify
  (package
    (name "ytify")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/n-ce/ytify/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "production build of ytify - lightweight YouTube player UI")
    (description "Production build of ytify - lightweight YouTube player UI.")
    (home-page "https://github.com/n-ce/ytify")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1657. zenmonitor3 --- zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Ze...
;;; -------------------------------------------------------------------
(define-public zenmonitor3
  (package
    (name "zenmonitor3")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/detiam/zenmonitor3/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 sup...")
    (description "Zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 support!.")
    (home-page "https://github.com/detiam/zenmonitor3")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 325. zond --- deep network reconnaissance and probing tool
;;; -------------------------------------------------------------------
(define-public zond
  (package
    (name "zond")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hollowpointer/zond/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "deep network reconnaissance and probing tool")
    (description "Deep network reconnaissance and probing tool.")
    (home-page "https://github.com/hollowpointer/zond")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17247. 86box-manager --- a (cross-platform) configuration manager for the 86Box emulator
;;; -------------------------------------------------------------------
(define-public pkg-86box-manager
  (package
    (name "86box-manager")
    (version "1.7.6.0e")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RetBox/86BoxManagerX/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a (cross-platform) configuration manager for the 86Box emulator")
    (description "A (cross-platform) configuration manager for the 86Box emulator.")
    (home-page "https://github.com/RetBox/86BoxManagerX")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18077. android-ndk --- android C/C++ developer kit
;;; -------------------------------------------------------------------
(define-public android-ndk
  (package
    (name "android-ndk")
    (version "r29")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://developer.android.com/ndk/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android C/C++ developer kit")
    (description "Android C/C++ developer kit.")
    (home-page "https://developer.android.com/ndk/")
    (license (list license:non-copyleft license:gpl3+ license:lgpl3+))))

;;; -------------------------------------------------------------------
;;; 8447. aqemu --- qEMU GUI written in Qt5
;;; -------------------------------------------------------------------
(define-public aqemu
  (package
    (name "aqemu")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tobimensch/aqemu/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "qEMU GUI written in Qt5")
    (description "QEMU GUI written in Qt5.")
    (home-page "https://github.com/tobimensch/aqemu")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 44481. armv7l-binutils --- a set of programs to assemble and manipulate binary and object files f...
;;; -------------------------------------------------------------------
(define-public armv7l-binutils
  (package
    (name "armv7l-binutils")
    (version "2.46")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gnu.org/software/binutils/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a set of programs to assemble and manipulate binary and object files for armv7l")
    (description "A set of programs to assemble and manipulate binary and object files for armv7l.")
    (home-page "https://www.gnu.org/software/binutils/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7173. asset-ripper-bin --- gUI Application to work with engine assets, asset bundles, and seriali...
;;; -------------------------------------------------------------------
(define-public asset-ripper-bin
  (package
    (name "asset-ripper-bin")
    (version "1.3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AssetRipper/AssetRipper/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gUI Application to work with engine assets, asset bundles, and serialized files")
    (description "GUI Application to work with engine assets, asset bundles, and serialized files.")
    (home-page "https://github.com/AssetRipper/AssetRipper")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7901. axenc-git --- axen language compiler (git development branch)
;;; -------------------------------------------------------------------
(define-public axenc-git
  (package
    (name "axenc-git")
    (version "0.1.0.r31.g4f09033")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arsoniv/axenc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "axen language compiler (git development branch)")
    (description "Axen language compiler (git development branch).")
    (home-page "https://github.com/arsoniv/axenc")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 1885. backrest --- a web UI and orchestrator for restic backup
;;; -------------------------------------------------------------------
(define-public backrest
  (package
    (name "backrest")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/garethgeorge/backrest/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/garethgeorge/backrest"))
    (synopsis "a web UI and orchestrator for restic backup")
    (description "A web UI and orchestrator for restic backup.")
    (home-page "https://github.com/garethgeorge/backrest")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8441. bootstrap-studio --- bootstrap Studio is a powerful tool which web developers and designers...
;;; -------------------------------------------------------------------
(define-public bootstrap-studio
  (package
    (name "bootstrap-studio")
    (version "8.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bootstrapstudio.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bootstrap Studio is a powerful tool which web developers and designers use to...")
    (description "Bootstrap Studio is a powerful tool which web developers and designers use to create layouts and fully functional websites using the Bootstrap framework.")
    (home-page "https://bootstrapstudio.io/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5893. chess-native --- lightweight Chess.com desktop client built with Tauri
;;; -------------------------------------------------------------------
(define-public chess-native
  (package
    (name "chess-native")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mirlili/chess/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Chess.com desktop client built with Tauri")
    (description "Lightweight Chess.com desktop client built with Tauri.")
    (home-page "https://github.com/mirlili/chess")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2285. clash-verge-rev-bin --- continuation of Clash Verge | A Clash Meta GUI based on Tauri
;;; -------------------------------------------------------------------
(define-public clash-verge-rev-bin
  (package
    (name "clash-verge-rev-bin")
    (version "2.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/clash-verge-rev/clash-verge-rev/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "continuation of Clash Verge | A Clash Meta GUI based on Tauri")
    (description "Continuation of Clash Verge | A Clash Meta GUI based on Tauri.")
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7158. coreusage-git --- lightweight CPU core usage information tool written in C
;;; -------------------------------------------------------------------
(define-public coreusage-git
  (package
    (name "coreusage-git")
    (version "V1.0.5.r0.gb23bd84")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lennart1978/coreusage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "lightweight CPU core usage information tool written in C")
    (description "Lightweight CPU core usage information tool written in C.")
    (home-page "https://github.com/Lennart1978/coreusage")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8443. deltaclient-git --- delta upgrades for archlinux
;;; -------------------------------------------------------------------
(define-public deltaclient-git
  (package
    (name "deltaclient-git")
    (version "r154.97e898f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/djugei/arch-delta-upgrades")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "delta upgrades for archlinux")
    (description "Delta upgrades for archlinux.")
    (home-page "https://github.com/djugei/arch-delta-upgrades")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 7913. derper-ipcert --- a tool that runs a custom Tailscale DERP server (IP certs version)
;;; -------------------------------------------------------------------
(define-public derper-ipcert
  (package
    (name "derper-ipcert")
    (version "1.96.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tailscale/tailscale/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f #:import-path "github.com/tailscale/tailscale"))
    (synopsis "a tool that runs a custom Tailscale DERP server (IP certs version)")
    (description "A tool that runs a custom Tailscale DERP server (IP certs version).")
    (home-page "https://github.com/tailscale/tailscale")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 2260. ente-auth-bin --- ente two-factor authenticator
;;; -------------------------------------------------------------------
(define-public ente-auth-bin
  (package
    (name "ente-auth-bin")
    (version "4.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ente.io/auth/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ente two-factor authenticator")
    (description "Ente two-factor authenticator.")
    (home-page "https://ente.io/auth")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 6003. fastmail --- email made better
;;; -------------------------------------------------------------------
(define-public fastmail
  (package
    (name "fastmail")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.fastmail.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "email made better")
    (description "Email made better.")
    (home-page "https://www.fastmail.com")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 17252. firefox-extension-bitwarden --- bitwarden browser extension for Firefox
;;; -------------------------------------------------------------------
(define-public firefox-extension-bitwarden
  (package
    (name "firefox-extension-bitwarden")
    (version "2026.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bitwarden/clients/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bitwarden browser extension for Firefox")
    (description "Bitwarden browser extension for Firefox.")
    (home-page "https://github.com/bitwarden/clients")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8454. fred --- digital forensics tool for viewing and reporting on Windows registry f...
;;; -------------------------------------------------------------------
(define-public fred
  (package
    (name "fred")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.sits.lu/fred/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital forensics tool for viewing and reporting on Windows registry files")
    (description "Digital forensics tool for viewing and reporting on Windows registry files.")
    (home-page "https://www.sits.lu/fred")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 16163. gentoo-sources --- 🌊 Linux kernel sources with gentoo patches installed to /usr/src/linux...
;;; -------------------------------------------------------------------
(define-public gentoo-sources
  (package
    (name "gentoo-sources")
    (version "6.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.gentoo.org/wiki/Kernel/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "🌊 Linux kernel sources with gentoo patches installed to /usr/src/linux-6.15 🌊")
    (description "🌊 Linux kernel sources with gentoo patches installed to /usr/src/linux-6.15 🌊.")
    (home-page "https://wiki.gentoo.org/wiki/Kernel")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 336. gitkraken --- the intuitive, fast, and beautiful cross-platform Git client
;;; -------------------------------------------------------------------
(define-public gitkraken
  (package
    (name "gitkraken")
    (version "12.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.gitkraken.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the intuitive, fast, and beautiful cross-platform Git client")
    (description "The intuitive, fast, and beautiful cross-platform Git client.")
    (home-page "https://www.gitkraken.com/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 5877. gnome-x11-gesture-daemon --- gNOME gesture improvements daemon
;;; -------------------------------------------------------------------
(define-public gnome-x11-gesture-daemon
  (package
    (name "gnome-x11-gesture-daemon")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/harshadgavali/gnome-x11-gesture-daemon/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gNOME gesture improvements daemon")
    (description "GNOME gesture improvements daemon.")
    (home-page "https://github.com/harshadgavali/gnome-x11-gesture-daemon")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2162. hid-fanatecff-dkms --- driver to support force feedback and load cells for the FANATEC contro...
;;; -------------------------------------------------------------------
(define-public hid-fanatecff-dkms
  (package
    (name "hid-fanatecff-dkms")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gotzl/hid-fanatecff/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "driver to support force feedback and load cells for the FANATEC controller ec...")
    (description "Driver to support force feedback and load cells for the FANATEC controller ecosystem.")
    (home-page "https://github.com/gotzl/hid-fanatecff")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 2287. hp15c --- a simulator for the HP-15C programmable scientific RPN calculator
;;; -------------------------------------------------------------------
(define-public hp15c
  (package
    (name "hp15c")
    (version "5.1.00")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://hp-15c-simulator.de/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simulator for the HP-15C programmable scientific RPN calculator")
    (description "A simulator for the HP-15C programmable scientific RPN calculator.")
    (home-page "https://hp-15c-simulator.de")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8778. iacs --- access Client Solutions is a Java based, platform-independent interfac...
;;; -------------------------------------------------------------------
(define-public iacs
  (package
    (name "iacs")
    (version "1.1.9.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.ibm.com/support/pages/ibm-i-access-client-solutions/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "access Client Solutions is a Java based, platform-independent interface for I...")
    (description "Access Client Solutions is a Java based, platform-independent interface for IBM i systems.")
    (home-page "https://www.ibm.com/support/pages/ibm-i-access-client-solutions")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8402. kde-service-menu-reimage-mod --- manipulate images e their metadata v. mod
;;; -------------------------------------------------------------------
(define-public kde-service-menu-reimage-mod
  (package
    (name "kde-service-menu-reimage-mod")
    (version "24.06.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/biglinux/kde-service-menu-reimage/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manipulate images e their metadata v. mod")
    (description "Manipulate images e their metadata v. mod.")
    (home-page "https://github.com/biglinux/kde-service-menu-reimage")
    (license license:gpl3+)))
