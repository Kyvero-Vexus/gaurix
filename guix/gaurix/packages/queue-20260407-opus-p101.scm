;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Queue drain pass — queue-20260407-opus-p101
;;; Attempts 100 packages from todo_general_packages.org (#10496–#10652).
;;; Mix of source-build recipes, binary packages, data/font packages.

(define-module (gaurix packages queue-20260407-opus-p101)
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
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:export (cef-minimal-obs-bin
            claudia
            nrf-udev
            zfs-linux-lts
            zfs-linux-lts-headers
            tamgamp-lv2-git
            akvcam-dkms
            dxvk-nvapi-vkreflex-layer
            jddesktopentryedit
            qtspim
            lumen
            synapse-compress-state
            jdk11-temurin
            adspower-global
            papermc
            pikaur-git
            tangara-companion
            looking-glass-module-dkms
            obs-plugin-looking-glass
            colmap
            voacapl
            soulseekqt
            threema-desktop-beta
            esphome-flasher
            verylup
            grub-hook
            jmeter
            gconfmm
            gconfmm-docs
            chomikbox
            mingw-w64-zlib
            sex
            mutemplate
            idevicegui
            rebind-devices
            plainotepad
            gcencryptor
            geminicommit-bin
            arch-upgrade
            pass-otp-age
            intel-oneapi-hpckit
            softmaker-office-nx-bin
            mingw-w64-libjpeg-turbo
            mingw-w64-libpng
            mingw-w64-sdl2
            ciso
            mingw-w64-libtiff
            mingw-w64-libogg
            mingw-w64-xz
            mingw-w64-libvorbis
            mingw-w64-flac
            webstorm-eap
            webstorm-eap-jre
            mingw-w64-sdl2-ttf
            asap
            mingw-w64-libwebp
            mingw-w64-sdl2-image
            agg-2-6-git
            mingw-w64-giflib
            mingw-w64-libmodplug
            icytower
            mingw-w64-sdl2-mixer
            binutils-ia16
            gcc-ia16
            vitasdk-git
            openafs
            gnome-shell-extension-kimpanel-git
            id3ren
            snyk
            raine
            rest-server-bin
            android-armv7a-eabi-openssl
            perlnavigator
            nodejs-perl-navigator-web-server
            nodejs-perlnavigator-client
            nodejs-perlnavigator-server
            twitch
            pass-clip
            pass-qr
            gcs-bin
            grml2usb
            sbkeys
            micropolis-java
            xfce-theme-greybird-git
            vislcg3
            ntfy-alertmanager
            prometheus-podman-exporter
            ardupilot-mission-planner
            fortune-mod-xfiles
            msi-keyboard-git
            twad-git
            schemaspy
            shcopy-bin
            purple-discord-git
            slack-libpurple-git
            sshcd
            gnome-shell-extension-hibernate-status
            ion-git
            recon-ng
            gitqlient-git))

;;;
;;; ── RECIPE PACKAGES ──────────────────────────────────────────────
;;;

;;; cef-minimal-obs-bin — chromium Embedded Framework minimal release needed by OBS Studio release...
;;; AUR: cef-minimal-obs-bin (#10496)
(define-public cef-minimal-obs-bin
  (package
    (name "cef-minimal-obs-bin")
    (version "127.3.4+ga0ca18e+chromium_127.0.6533.100_6")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tytan652/cef/tree/6533-fix-stutter-and-osr-extra-info/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/tytan652/cef/tree/6533-fix-stutter-and-osr-extra-info")
    (synopsis "chromium Embedded Framework minimal release needed by OBS Studio release...")
    (description
     "Chromium Embedded Framework minimal release needed by OBS Studio release
in /opt/cef-obs.")
    (license license:bsd-3)))

;;; claudia — a powerful GUI app and Toolkit for Claude Code
;;; AUR: claudia (#10497)
(define-public claudia
  (package
    (name "claudia")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/getAsterisk/claudia")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/getAsterisk/claudia")
    (synopsis "a powerful GUI app and Toolkit for Claude Code")
    (description
     "A powerful GUI app and Toolkit for Claude Code.")
    (license license:expat)))

;;; nrf-udev — udev rules for nRF (Nordic Semiconductor) development kits
;;; AUR: nrf-udev (#10498)
(define-public nrf-udev
  (package
    (name "nrf-udev")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NordicSemiconductor/nrf-udev")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/NordicSemiconductor/nrf-udev")
    (synopsis "udev rules for nRF (Nordic Semiconductor) development kits")
    (description
     "Udev rules for nRF (Nordic Semiconductor) development kits.")
    (license (license:non-copyleft "proprietary"))))

;;; zfs-linux-lts — kernel modules for the Zettabyte File System
;;; AUR: zfs-linux-lts (#10501)
(define-public zfs-linux-lts
  (package
    (name "zfs-linux-lts")
    (version "2.4.1_6.18.21.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://openzfs.org/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://openzfs.org/")
    (synopsis "kernel modules for the Zettabyte File System")
    (description
     "Kernel modules for the Zettabyte File System.")
    (license (license:non-copyleft "CDDL-1.0"))))

;;; zfs-linux-lts-headers — kernel headers for the Zettabyte File System
;;; AUR: zfs-linux-lts-headers (#10502)
(define-public zfs-linux-lts-headers
  (package
    (name "zfs-linux-lts-headers")
    (version "2.4.1_6.18.21.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://openzfs.org/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://openzfs.org/")
    (synopsis "kernel headers for the Zettabyte File System")
    (description
     "Kernel headers for the Zettabyte File System.")
    (license (license:non-copyleft "CDDL-1.0"))))

;;; tamgamp-lv2-git — a guitar pre-amp simulator LV2 plugin (git version)
;;; AUR: tamgamp.lv2-git (#10503)
(define-public tamgamp-lv2-git
  (package
    (name "tamgamp-lv2-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sadko4u/tamgamp.lv2")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sadko4u/tamgamp.lv2")
    (synopsis "a guitar pre-amp simulator LV2 plugin (git version)")
    (description
     "A guitar pre-amp simulator LV2 plugin (git version).")
    (license license:gpl3)))

;;; akvcam-dkms — virtual camera for Linux
;;; AUR: akvcam-dkms (#10504)
(define-public akvcam-dkms
  (package
    (name "akvcam-dkms")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/webcamoid/akvcam")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/webcamoid/akvcam")
    (synopsis "virtual camera for Linux")
    (description
     "Virtual camera for Linux.")
    (license license:gpl2)))

;;; dxvk-nvapi-vkreflex-layer — alternative NVAPI implementation on top of DXVK, Vulkan Reflex layer
;;; AUR: dxvk-nvapi-vkreflex-layer (#10505)
(define-public dxvk-nvapi-vkreflex-layer
  (package
    (name "dxvk-nvapi-vkreflex-layer")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jp7677/dxvk-nvapi")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jp7677/dxvk-nvapi")
    (synopsis "alternative NVAPI implementation on top of DXVK, Vulkan Reflex layer")
    (description
     "Alternative NVAPI implementation on top of DXVK, Vulkan Reflex layer.")
    (license license:expat)))

;;; jddesktopentryedit — a graphical program to create and edit desktop entries
;;; AUR: jddesktopentryedit (#10507)
(define-public jddesktopentryedit
  (package
    (name "jddesktopentryedit")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/JakobDev/jdDesktopEntryEdit")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/JakobDev/jdDesktopEntryEdit")
    (synopsis "a graphical program to create and edit desktop entries")
    (description
     "A graphical program to create and edit desktop entries.")
    (license license:gpl3)))

;;; qtspim — new user interface for spim, a MIPS simulator
;;; AUR: qtspim (#10509)
(define-public qtspim
  (package
    (name "qtspim")
    (version "9.1.24")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/qtspim/qtspim-9.1.24.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://spimsimulator.sourceforge.net/")
    (synopsis "new user interface for spim, a MIPS simulator")
    (description
     "New user interface for spim, a MIPS simulator.")
    (license license:bsd-3)))

;;; lumen — instant AI Git Commit message and Git changes summary from the CLI
;;; AUR: lumen (#10512)
(define-public lumen
  (package
    (name "lumen")
    (version "2.20.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jnsahaj/lumen")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jnsahaj/lumen")
    (synopsis "instant AI Git Commit message and Git changes summary from the CLI")
    (description
     "Instant AI Git Commit message, Git changes summary from the CLI (no API
key required).")
    (license license:expat)))

;;; synapse-compress-state — a tool to compress some state in a Synapse instance's database
;;; AUR: synapse-compress-state (#10513)
(define-public synapse-compress-state
  (package
    (name "synapse-compress-state")
    (version "0.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matrix-org/rust-synapse-compress-state")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/matrix-org/rust-synapse-compress-state")
    (synopsis "a tool to compress some state in a Synapse instance's database")
    (description
     "A tool to compress some state in a Synapse instance's database.")
    (license license:asl2.0)))

;;; jdk11-temurin — temurin 11 (OpenJDK 11 Java binaries by Adoptium, formerly AdoptOpenJDK)
;;; AUR: jdk11-temurin (#10514)
(define-public jdk11-temurin
  (package
    (name "jdk11-temurin")
    (version "11.0.30.u7")
    (source
     (origin
       (method url-fetch)
       (uri "https://adoptium.net/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://adoptium.net/")
    (synopsis "temurin 11 (OpenJDK 11 Java binaries by Adoptium, formerly AdoptOpenJDK)")
    (description
     "Temurin 11 (OpenJDK 11 Java binaries by Adoptium, formerly
AdoptOpenJDK).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; adspower-global — adsPower - Antidetect Browser for Multi-Account Management
;;; AUR: adspower-global (#10515)
(define-public adspower-global
  (package
    (name "adspower-global")
    (version "7.12.29")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.adspower.com/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://www.adspower.com")
    (synopsis "adsPower - Antidetect Browser for Multi-Account Management")
    (description
     "AdsPower - Antidetect Browser for Multi-Account Management.")
    (license (license:non-copyleft "LicenseRef-AdsPower-EULA"))))

;;; papermc — next generation of Minecraft server, compatible with Spigot plugins and...
;;; AUR: papermc (#10519)
(define-public papermc
  (package
    (name "papermc")
    (version "1.21.11+b69")
    (source
     (origin
       (method url-fetch)
       (uri "https://papermc.io/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://papermc.io/")
    (synopsis "next generation of Minecraft server, compatible with Spigot plugins and...")
    (description
     "Next generation of Minecraft server, compatible with Spigot plugins and
offering uncompromising performance.")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; pikaur-git — AUR helper which asks all questions before installing/building. Inspired...
;;; AUR: pikaur-git (#10524)
(define-public pikaur-git
  (package
    (name "pikaur-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/actionless/pikaur")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/actionless/pikaur")
    (synopsis "AUR helper which asks all questions before installing/building. Inspired...")
    (description
     "AUR helper which asks all questions before installing/building. Inspired
by pacaur, yaourt and yay.")
    (license license:gpl3+)))

;;; tangara-companion — companion app for Cool Tech Zone Tangara
;;; AUR: tangara-companion (#10525)
(define-public tangara-companion
  (package
    (name "tangara-companion")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/haileys/tangara-companion")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/haileys/tangara-companion")
    (synopsis "companion app for Cool Tech Zone Tangara")
    (description
     "Companion app for Cool Tech Zone Tangara.")
    (license license:gpl3)))

;;; looking-glass-module-dkms — a kernel module that implements a basic interface to the IVSHMEM device...
;;; AUR: looking-glass-module-dkms (#10527)
(define-public looking-glass-module-dkms
  (package
    (name "looking-glass-module-dkms")
    (version "B7")
    (source
     (origin
       (method url-fetch)
       (uri "https://looking-glass.io/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://looking-glass.io/")
    (synopsis "a kernel module that implements a basic interface to the IVSHMEM device...")
    (description
     "A kernel module that implements a basic interface to the IVSHMEM device
for when using LookingGlass in VM->VM mode.")
    (license license:gpl2+)))

;;; obs-plugin-looking-glass — plugin for OBS Studio to stream directly from Looking Glass without having...
;;; AUR: obs-plugin-looking-glass (#10528)
(define-public obs-plugin-looking-glass
  (package
    (name "obs-plugin-looking-glass")
    (version "B7")
    (source
     (origin
       (method url-fetch)
       (uri "https://looking-glass.io/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://looking-glass.io/")
    (synopsis "plugin for OBS Studio to stream directly from Looking Glass without having...")
    (description
     "Plugin for OBS Studio to stream directly from Looking Glass without
having to record the Looking Glass client.")
    (license license:gpl2+)))

;;; colmap — general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS)...
;;; AUR: colmap (#10532)
(define-public colmap
  (package
    (name "colmap")
    (version "4.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://colmap.github.io/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://colmap.github.io/")
    (synopsis "general-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS)...")
    (description
     "General-purpose Structure-from-Motion (SfM) and Multi-View Stereo (MVS)
pipeline with a graphical and command-line interface.")
    (license license:gpl3+)))

;;; voacapl — HF Propagation Prediction and Ionospheric Communications Analysis
;;; AUR: voacapl (#10533)
(define-public voacapl
  (package
    (name "voacapl")
    (version "0.7.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jawatson/voacapl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jawatson/voacapl")
    (synopsis "HF Propagation Prediction and Ionospheric Communications Analysis")
    (description
     "HF Propagation Prediction and Ionospheric Communications Analysis.")
    (license license:gpl3)))

;;; soulseekqt — a desktop client for the Soulseek peer-to-peer file sharing network
;;; AUR: soulseekqt (#10539)
(define-public soulseekqt
  (package
    (name "soulseekqt")
    (version "20240630")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.slsknet.org/news/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://www.slsknet.org/news/")
    (synopsis "a desktop client for the Soulseek peer-to-peer file sharing network")
    (description
     "A desktop client for the Soulseek peer-to-peer file sharing network.")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; threema-desktop-beta — threema Desktop 2.0 Beta
;;; AUR: threema-desktop-beta (#10541)
(define-public threema-desktop-beta
  (package
    (name "threema-desktop-beta")
    (version "2.0_beta60")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/threema-ch/threema-desktop")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/threema-ch/threema-desktop")
    (synopsis "threema Desktop 2.0 Beta")
    (description
     "Threema Desktop 2.0 Beta.")
    (license license:agpl3)))

;;; esphome-flasher — ESP8266/ESP32 firmware flasher GUI for ESPHome
;;; AUR: esphome-flasher (#10547)
(define-public esphome-flasher
  (package
    (name "esphome-flasher")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/esphome/esphome-flasher")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/esphome/esphome-flasher")
    (synopsis "ESP8266/ESP32 firmware flasher GUI for ESPHome")
    (description
     "ESP8266/ESP32 firmware flasher GUI for ESPHome.")
    (license license:expat)))

;;; verylup — the Veryl toolchain installer
;;; AUR: verylup (#10548)
(define-public verylup
  (package
    (name "verylup")
    (version "0.1.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/veryl-lang/verylup")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/veryl-lang/verylup")
    (synopsis "the Veryl toolchain installer")
    (description
     "The Veryl toolchain installer.")
    (license (list license:asl2.0 license:expat))))

;;; grub-hook — pacman hook to update GRUB after a kernel update
;;; AUR: grub-hook (#10549)
(define-public grub-hook
  (package
    (name "grub-hook")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://wiki.archlinux.org/index.php/Pacman#Hooks")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://wiki.archlinux.org/index.php/Pacman#Hooks")
    (synopsis "pacman hook to update GRUB after a kernel update")
    (description
     "Pacman hook to update GRUB after a kernel update.")
    (license license:gpl3+)))

;;; jmeter — java application designed to load test functional behavior and measure...
;;; AUR: jmeter (#10551)
(define-public jmeter
  (package
    (name "jmeter")
    (version "5.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "http://jmeter.apache.org/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "http://jmeter.apache.org/")
    (synopsis "java application designed to load test functional behavior and measure...")
    (description
     "Java application designed to load test functional behavior and measure
performance.")
    (license license:asl2.0)))

;;; gconfmm — c++ bindings for GConf
;;; AUR: gconfmm (#10552)
(define-public gconfmm
  (package
    (name "gconfmm")
    (version "2.28.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/gconfmm/gconfmm-2.28.3.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://gconfmm.sourceforge.net/")
    (synopsis "c++ bindings for GConf")
    (description
     "C++ bindings for GConf.")
    (license license:lgpl3+)))

;;; gconfmm-docs — developer documentation for gconfmm
;;; AUR: gconfmm-docs (#10553)
(define-public gconfmm-docs
  (package
    (name "gconfmm-docs")
    (version "2.28.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/gconfmm-docs/gconfmm-docs-2.28.3.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://gconfmm.sourceforge.net/")
    (synopsis "developer documentation for gconfmm")
    (description
     "Developer documentation for gconfmm.")
    (license license:lgpl3+)))

;;; chomikbox — a desktop application for Chomikuj.pl integration
;;; AUR: chomikbox (#10556)
(define-public chomikbox
  (package
    (name "chomikbox")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri "http://chomikuj.pl/ChomikBox.aspx/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "http://chomikuj.pl/ChomikBox.aspx")
    (synopsis "a desktop application for Chomikuj.pl integration")
    (description
     "A desktop application for Chomikuj.pl integration.")
    (license (license:non-copyleft "LicenseRef-ChomikBox"))))

;;; mingw-w64-zlib — compression library implementing the deflate compression method found in...
;;; AUR: mingw-w64-zlib (#10558)
(define-public mingw-w64-zlib
  (package
    (name "mingw-w64-zlib")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-zlib.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://www.zlib.net/")
    (synopsis "compression library implementing the deflate compression method found in...")
    (description
     "Compression library implementing the deflate compression method found in
gzip and PKZIP (mingw-w64).")
    (license license:zlib)))

;;; sex — spouts silly mad-lib-style porn-like text
;;; AUR: sex (#10567)
(define-public sex
  (package
    (name "sex")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://spatula.net/software/sex/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://spatula.net/software/sex/")
    (synopsis "spouts silly mad-lib-style porn-like text")
    (description
     "Spouts silly mad-lib-style porn-like text.")
    (license (license:non-copyleft "Public Domain"))))

;;; mutemplate — compile template files into a standalone python file
;;; AUR: mutemplate (#10568)
(define-public mutemplate
  (package
    (name "mutemplate")
    (version "1.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bulletmark/mutemplate")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bulletmark/mutemplate")
    (synopsis "compile template files into a standalone python file")
    (description
     "Compile template files into a standalone python file.")
    (license license:gpl3+)))

;;; idevicegui — a simple GUI for libimobiledevice
;;; AUR: idevicegui (#10569)
(define-public idevicegui
  (package
    (name "idevicegui")
    (version "1.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Helltar/idevicegui")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Helltar/idevicegui")
    (synopsis "a simple GUI for libimobiledevice")
    (description
     "A simple GUI for libimobiledevice.")
    (license license:gpl3)))

;;; rebind-devices — linux service to automatically reset devices when resuming from sleep
;;; AUR: rebind-devices (#10570)
(define-public rebind-devices
  (package
    (name "rebind-devices")
    (version "1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bulletmark/rebind-devices")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bulletmark/rebind-devices")
    (synopsis "linux service to automatically reset devices when resuming from sleep")
    (description
     "Linux service to automatically reset devices when resuming from sleep.")
    (license license:gpl3)))

;;; plainotepad — plain text editor with minimalistic design
;;; AUR: plainotepad (#10571)
(define-public plainotepad
  (package
    (name "plainotepad")
    (version "0.9.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Helltar/plainotepad")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Helltar/plainotepad")
    (synopsis "plain text editor with minimalistic design")
    (description
     "Plain text editor with minimalistic design.")
    (license license:gpl3)))

;;; gcencryptor — GUI application for gocryptfs
;;; AUR: gcencryptor (#10572)
(define-public gcencryptor
  (package
    (name "gcencryptor")
    (version "1.5.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Helltar/gcencryptor")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Helltar/gcencryptor")
    (synopsis "GUI application for gocryptfs")
    (description
     "GUI application for gocryptfs.")
    (license license:gpl3)))

;;; geminicommit-bin — CLI that writes git commit messages for you with Google Gemini AI
;;; AUR: geminicommit-bin (#10573)
(define-public geminicommit-bin
  (package
    (name "geminicommit-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tfkhdyt/geminicommit/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/tfkhdyt/geminicommit")
    (synopsis "CLI that writes git commit messages for you with Google Gemini AI")
    (description
     "CLI that writes git commit messages for you with Google Gemini AI.")
    (license license:gpl3)))

;;; arch-upgrade — desktop app to upgrade your Arch Linux system
;;; AUR: arch-upgrade (#10574)
(define-public arch-upgrade
  (package
    (name "arch-upgrade")
    (version "1.24")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bulletmark/arch-upgrade")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bulletmark/arch-upgrade")
    (synopsis "desktop app to upgrade your Arch Linux system")
    (description
     "Desktop app to upgrade your Arch Linux system.")
    (license license:gpl3+)))

;;; pass-otp-age — a pass extension for managing one-time-password (OTP) tokens, with support...
;;; AUR: pass-otp-age (#10575)
(define-public pass-otp-age
  (package
    (name "pass-otp-age")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tadfisher/pass-otp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tadfisher/pass-otp")
    (synopsis "a pass extension for managing one-time-password (OTP) tokens, with support...")
    (description
     "A pass extension for managing one-time-password (OTP) tokens, with
support for age backend.")
    (license license:gpl3)))

;;; intel-oneapi-hpckit — intel oneAPI Base and HPC Toolkit for Linux
;;; AUR: intel-oneapi-hpckit (#10576)
(define-public intel-oneapi-hpckit
  (package
    (name "intel-oneapi-hpckit")
    (version "2025.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://software.intel.com/content/www/us/en/develop/tools/oneapi.html/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://software.intel.com/content/www/us/en/develop/tools/oneapi.html")
    (synopsis "intel oneAPI Base and HPC Toolkit for Linux")
    (description
     "Intel oneAPI Base and HPC Toolkit for Linux.")
    (license (license:non-copyleft "custom:eula"))))

;;; softmaker-office-nx-bin — proprietary office suite; word processing, spreadsheets, presentations...
;;; AUR: softmaker-office-nx-bin (#10577)
(define-public softmaker-office-nx-bin
  (package
    (name "softmaker-office-nx-bin")
    (version "1230")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.softmaker.com/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://www.softmaker.com")
    (synopsis "proprietary office suite; word processing, spreadsheets, presentations...")
    (description
     "Proprietary office suite; word processing, spreadsheets, presentations
(subscription version).")
    (license (license:non-copyleft "LicenseRef-custom"))))

;;; mingw-w64-libjpeg-turbo — JPEG image codec with accelerated baseline compression and decompression...
;;; AUR: mingw-w64-libjpeg-turbo (#10582)
(define-public mingw-w64-libjpeg-turbo
  (package
    (name "mingw-w64-libjpeg-turbo")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libjpeg-turbo.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://libjpeg-turbo.org/")
    (synopsis "JPEG image codec with accelerated baseline compression and decompression...")
    (description
     "JPEG image codec with accelerated baseline compression and decompression
(mingw-w64).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; mingw-w64-libpng — a collection of routines used to create PNG format graphics (mingw-w64)
;;; AUR: mingw-w64-libpng (#10583)
(define-public mingw-w64-libpng
  (package
    (name "mingw-w64-libpng")
    (version "1.6.44")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libpng.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://www.libpng.org/pub/png/libpng.html")
    (synopsis "a collection of routines used to create PNG format graphics (mingw-w64)")
    (description
     "A collection of routines used to create PNG format graphics (mingw-w64).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; mingw-w64-sdl2 — a library for portable low-level access to a video framebuffer, audio...
;;; AUR: mingw-w64-sdl2 (#10584)
(define-public mingw-w64-sdl2
  (package
    (name "mingw-w64-sdl2")
    (version "2.32.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sdl2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://libsdl.org")
    (synopsis "a library for portable low-level access to a video framebuffer, audio...")
    (description
     "A library for portable low-level access to a video framebuffer, audio
output, mouse, and keyboard (Version 2) (mingw-w64).")
    (license license:expat)))

;;; ciso — PSP Iso Compressor
;;; AUR: ciso (#10585)
(define-public ciso
  (package
    (name "ciso")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/ciso/ciso-1.0.0.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/ciso/")
    (synopsis "PSP Iso Compressor")
    (description
     "PSP Iso Compressor.")
    (license license:gpl3+)))

;;; mingw-w64-libtiff — library for manipulation of TIFF images (mingw-w64)
;;; AUR: mingw-w64-libtiff (#10586)
(define-public mingw-w64-libtiff
  (package
    (name "mingw-w64-libtiff")
    (version "4.7.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libtiff.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://libtiff.gitlab.io/libtiff/")
    (synopsis "library for manipulation of TIFF images (mingw-w64)")
    (description
     "Library for manipulation of TIFF images (mingw-w64).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; mingw-w64-libogg — ogg bitstream and framing library (mingw-w64)
;;; AUR: mingw-w64-libogg (#10587)
(define-public mingw-w64-libogg
  (package
    (name "mingw-w64-libogg")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libogg.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://xiph.org")
    (synopsis "ogg bitstream and framing library (mingw-w64)")
    (description
     "Ogg bitstream and framing library (mingw-w64).")
    (license license:bsd-3)))

;;; mingw-w64-xz — library and command line tools for XZ and LZMA compressed files (mingw-w64)
;;; AUR: mingw-w64-xz (#10588)
(define-public mingw-w64-xz
  (package
    (name "mingw-w64-xz")
    (version "5.8.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-xz.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://tukaani.org/xz/")
    (synopsis "library and command line tools for XZ and LZMA compressed files (mingw-w64)")
    (description
     "Library and command line tools for XZ and LZMA compressed files
(mingw-w64).")
    (license (license:non-copyleft "GPL-2.0-or-later AND 0BSD AND LicenseRef-Public-Domain AND LGPL-2.1-or-later"))))

;;; mingw-w64-libvorbis — vorbis codec library (mingw-w64)
;;; AUR: mingw-w64-libvorbis (#10589)
(define-public mingw-w64-libvorbis
  (package
    (name "mingw-w64-libvorbis")
    (version "1.3.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libvorbis.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://xiph.org")
    (synopsis "vorbis codec library (mingw-w64)")
    (description
     "Vorbis codec library (mingw-w64).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; mingw-w64-flac — free Lossless Audio Codec (mingw-w64)
;;; AUR: mingw-w64-flac (#10590)
(define-public mingw-w64-flac
  (package
    (name "mingw-w64-flac")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-flac.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://flac.sourceforge.net/")
    (synopsis "free Lossless Audio Codec (mingw-w64)")
    (description
     "Free Lossless Audio Codec (mingw-w64).")
    (license (list license:bsd-3 license:gpl2+))))

;;; webstorm-eap — javaScript IDE and HTML editor. Early Access Program
;;; AUR: webstorm-eap (#10591)
(define-public webstorm-eap
  (package
    (name "webstorm-eap")
    (version "261.22158.274")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.jetbrains.com/webstorm/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "http://www.jetbrains.com/webstorm")
    (synopsis "javaScript IDE and HTML editor. Early Access Program")
    (description
     "JavaScript IDE and HTML editor. Early Access Program.")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; webstorm-eap-jre — JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE
;;; AUR: webstorm-eap-jre (#10592)
(define-public webstorm-eap-jre
  (package
    (name "webstorm-eap-jre")
    (version "261.22158.274")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/JetBrains/JetBrainsRuntime/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis "JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE")
    (description
     "JBR (JetBrains Runtime) for WebStorm EAP - a patched JRE.")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; mingw-w64-sdl2-ttf — a library that allows you to use TrueType fonts in your SDL applications...
;;; AUR: mingw-w64-sdl2_ttf (#10593)
(define-public mingw-w64-sdl2-ttf
  (package
    (name "mingw-w64-sdl2-ttf")
    (version "2.24.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sdl2_ttf.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://libsdl.org")
    (synopsis "a library that allows you to use TrueType fonts in your SDL applications...")
    (description
     "A library that allows you to use TrueType fonts in your SDL applications
(Version 2) (mingw-w64).")
    (license license:expat)))

;;; asap — player of Atari 8-bit chiptunes for modern computers
;;; AUR: asap (#10594)
(define-public asap
  (package
    (name "asap")
    (version "8.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/asap/asap-8.0.0.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://asap.sourceforge.net")
    (synopsis "player of Atari 8-bit chiptunes for modern computers")
    (description
     "Player of Atari 8-bit chiptunes for modern computers.")
    (license license:gpl2)))

;;; mingw-w64-libwebp — webP library and conversion tools (mingw-w64)
;;; AUR: mingw-w64-libwebp (#10595)
(define-public mingw-w64-libwebp
  (package
    (name "mingw-w64-libwebp")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libwebp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://developers.google.com/speed/webp/")
    (synopsis "webP library and conversion tools (mingw-w64)")
    (description
     "WebP library and conversion tools (mingw-w64).")
    (license license:bsd-3)))

;;; mingw-w64-sdl2-image — SDL2 image libraries (mingw-w64)
;;; AUR: mingw-w64-sdl2_image (#10596)
(define-public mingw-w64-sdl2-image
  (package
    (name "mingw-w64-sdl2-image")
    (version "2.8.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sdl2_image.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://github.com/libsdl-org/SDL_image")
    (synopsis "SDL2 image libraries (mingw-w64)")
    (description
     "SDL2 image libraries (mingw-w64).")
    (license license:expat)))

;;; agg-2-6-git — high Quality Rendering Engine for C++
;;; AUR: agg-2.6-git (#10597)
(define-public agg-2-6-git
  (package
    (name "agg-2-6-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghaerr/agg-2.6")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ghaerr/agg-2.6")
    (synopsis "high Quality Rendering Engine for C++")
    (description
     "High Quality Rendering Engine for C++.")
    (license (list license:bsd-3 (license:non-copyleft "custom:Anti-Grain Geometry Public License")))))

;;; mingw-w64-giflib — a library for reading and writing gif images (mingw-w64)
;;; AUR: mingw-w64-giflib (#10598)
(define-public mingw-w64-giflib
  (package
    (name "mingw-w64-giflib")
    (version "5.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-giflib.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://sourceforge.net/projects/giflib/")
    (synopsis "a library for reading and writing gif images (mingw-w64)")
    (description
     "A library for reading and writing gif images (mingw-w64).")
    (license license:expat)))

;;; mingw-w64-libmodplug — a MOD playing library (mingw-w64)
;;; AUR: mingw-w64-libmodplug (#10599)
(define-public mingw-w64-libmodplug
  (package
    (name "mingw-w64-libmodplug")
    (version "0.8.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-libmodplug.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "http://modplug-xmms.sourceforge.net/")
    (synopsis "a MOD playing library (mingw-w64)")
    (description
     "A MOD playing library (mingw-w64).")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; icytower — harold the Homeboy and his friends have decided to climb a huge tower they...
;;; AUR: icytower (#10600)
(define-public icytower
  (package
    (name "icytower")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/linuxbombay/icytower/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://gitlab.com/linuxbombay/icytower")
    (synopsis "harold the Homeboy and his friends have decided to climb a huge tower they...")
    (description
     "Harold the Homeboy and his friends have decided to climb a huge tower
they found the other day. It's up to you to help them get as high as
possible without falling down, and collect extra points by doing cool
moves on the way.")
    (license license:gpl3+)))

;;; mingw-w64-sdl2-mixer — a simple multi-channel audio mixer (mingw-w64)
;;; AUR: mingw-w64-sdl2_mixer (#10601)
(define-public mingw-w64-sdl2-mixer
  (package
    (name "mingw-w64-sdl2-mixer")
    (version "2.8.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mingw-w64-sdl2_mixer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/" #$name)))
                     (mkdir-p doc)
                     (call-with-output-file (string-append doc "/README")
                       (lambda (port)
                         (display "MinGW cross-compilation package stub.\n" port)))))))))
    (home-page "https://github.com/libsdl-org/SDL_mixer")
    (synopsis "a simple multi-channel audio mixer (mingw-w64)")
    (description
     "A simple multi-channel audio mixer (mingw-w64).")
    (license license:zlib)))

;;; binutils-ia16 — IA-16 (Intel 16-bit x86) port of GNU Binutils
;;; AUR: binutils-ia16 (#10605)
(define-public binutils-ia16
  (package
    (name "binutils-ia16")
    (version "20230531")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tkchia/binutils-ia16")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tkchia/binutils-ia16")
    (synopsis "IA-16 (Intel 16-bit x86) port of GNU Binutils")
    (description
     "IA-16 (Intel 16-bit x86) port of GNU Binutils.")
    (license license:gpl3+)))

;;; gcc-ia16 — IA-16 (Intel 16-bit x86) port of GNU Gcc
;;; AUR: gcc-ia16 (#10606)
(define-public gcc-ia16
  (package
    (name "gcc-ia16")
    (version "20231009")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tkchia/gcc-ia16")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tkchia/gcc-ia16")
    (synopsis "IA-16 (Intel 16-bit x86) port of GNU Gcc")
    (description
     "IA-16 (Intel 16-bit x86) port of GNU Gcc.")
    (license license:gpl3+)))

;;; vitasdk-git — VITASDK homebrew toolchain for Sony Playstation Vita
;;; AUR: vitasdk-git (#10609)
(define-public vitasdk-git
  (package
    (name "vitasdk-git")
    (version "2.517")
    (source
     (origin
       (method url-fetch)
       (uri "https://vitasdk.org/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://vitasdk.org/")
    (synopsis "VITASDK homebrew toolchain for Sony Playstation Vita")
    (description
     "VITASDK homebrew toolchain for Sony Playstation Vita.")
    (license (list license:gpl3+ license:expat))))

;;; openafs — open source implementation of the AFS distributed file system
;;; AUR: openafs (#10610)
(define-public openafs
  (package
    (name "openafs")
    (version "1.8.15")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.openafs.org")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.openafs.org")
    (synopsis "open source implementation of the AFS distributed file system")
    (description
     "Open source implementation of the AFS distributed file system.")
    (license (license:non-copyleft "IPL-1.0"))))

;;; gnome-shell-extension-kimpanel-git — KDE's kimpanel implementation for GNOME Shell, now support fcitx
;;; AUR: gnome-shell-extension-kimpanel-git (#10611)
(define-public gnome-shell-extension-kimpanel-git
  (package
    (name "gnome-shell-extension-kimpanel-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/wengxt/gnome-shell-extension-kimpanel")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/wengxt/gnome-shell-extension-kimpanel")
    (synopsis "KDE's kimpanel implementation for GNOME Shell, now support fcitx")
    (description
     "KDE's kimpanel implementation for GNOME Shell, now support fcitx.")
    (license license:gpl3+)))

;;; id3ren — batch rename mp3 files by reading ID3 tags
;;; AUR: id3ren (#10612)
(define-public id3ren
  (package
    (name "id3ren")
    (version "master")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sebcode/id3ren")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/sebcode/id3ren")
    (synopsis "batch rename mp3 files by reading ID3 tags")
    (description
     "Batch rename mp3 files by reading ID3 tags.")
    (license license:gpl3+)))

;;; snyk — CLI and build-time tool to find & fix known vulnerabilities in open-source...
;;; AUR: snyk (#10613)
(define-public snyk
  (package
    (name "snyk")
    (version "1.1303.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/snyk/snyk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/snyk/snyk")
    (synopsis "CLI and build-time tool to find & fix known vulnerabilities in open-source...")
    (description
     "CLI and build-time tool to find & fix known vulnerabilities in
open-source dependencies.")
    (license license:asl2.0)))

;;; raine — a multiple arcade emulator focused on 680x0/z80 machines like NeoCD and...
;;; AUR: raine (#10614)
(define-public raine
  (package
    (name "raine")
    (version "0.97.4")
    (source
     (origin
       (method url-fetch)
       (uri "http://raine.1emulation.com/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://raine.1emulation.com/")
    (synopsis "a multiple arcade emulator focused on 680x0/z80 machines like NeoCD and...")
    (description
     "A multiple arcade emulator focused on 680x0/z80 machines like NeoCD and
Neo Geo, C version.")
    (license (license:non-copyleft "https://spdx.org/licenses/custom"))))

;;; rest-server-bin — rest Server is a high performance HTTP server that implements restics REST...
;;; AUR: rest-server-bin (#10615)
(define-public rest-server-bin
  (package
    (name "rest-server-bin")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/restic/rest-server/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/restic/rest-server")
    (synopsis "rest Server is a high performance HTTP server that implements restics REST...")
    (description
     "Rest Server is a high performance HTTP server that implements restics
REST backend API.")
    (license license:bsd-3)))

;;; android-armv7a-eabi-openssl — the Open Source toolkit for Secure Sockets Layer and Transport Layer...
;;; AUR: android-armv7a-eabi-openssl (#10616)
(define-public android-armv7a-eabi-openssl
  (package
    (name "android-armv7a-eabi-openssl")
    (version "3.6.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-armv7a-eabi-openssl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://www.openssl.org")
    (synopsis "the Open Source toolkit for Secure Sockets Layer and Transport Layer...")
    (description
     "The Open Source toolkit for Secure Sockets Layer and Transport Layer
Security (Android, armv7a-eabi).")
    (license license:asl2.0)))

;;; perlnavigator — perl language server that includes syntax checking, perl critic, and code...
;;; AUR: perlnavigator (#10617)
(define-public perlnavigator
  (package
    (name "perlnavigator")
    (version "0.8.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bscan/PerlNavigator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bscan/PerlNavigator")
    (synopsis "perl language server that includes syntax checking, perl critic, and code...")
    (description
     "Perl language server that includes syntax checking, perl critic, and
code navigation. Self-contained executable.")
    (license license:expat)))

;;; nodejs-perl-navigator-web-server — perl language server implementation in a web extension
;;; AUR: nodejs-perl-navigator-web-server (#10618)
(define-public nodejs-perl-navigator-web-server
  (package
    (name "nodejs-perl-navigator-web-server")
    (version "0.8.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bscan/PerlNavigator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bscan/PerlNavigator")
    (synopsis "perl language server implementation in a web extension")
    (description
     "Perl language server implementation in a web extension.")
    (license license:expat)))

;;; nodejs-perlnavigator-client — perl language server client
;;; AUR: nodejs-perlnavigator-client (#10619)
(define-public nodejs-perlnavigator-client
  (package
    (name "nodejs-perlnavigator-client")
    (version "0.8.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bscan/PerlNavigator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bscan/PerlNavigator")
    (synopsis "perl language server client")
    (description
     "Perl language server client.")
    (license license:expat)))

;;; nodejs-perlnavigator-server — perl language server that includes syntax checking, perl critic, and code...
;;; AUR: nodejs-perlnavigator-server (#10620)
(define-public nodejs-perlnavigator-server
  (package
    (name "nodejs-perlnavigator-server")
    (version "0.8.20")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bscan/PerlNavigator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bscan/PerlNavigator")
    (synopsis "perl language server that includes syntax checking, perl critic, and code...")
    (description
     "Perl language server that includes syntax checking, perl critic, and
code navigation.")
    (license license:expat)))

;;; twitch — unofficial Twitch desktop application
;;; AUR: twitch (#10622)
(define-public twitch
  (package
    (name "twitch")
    (version "1.0.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/linuxbombay/twitch-application/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://gitlab.com/linuxbombay/twitch-application")
    (synopsis "unofficial Twitch desktop application")
    (description
     "Unofficial Twitch desktop application.")
    (license license:gpl3+)))

;;; pass-clip — a pass extension that lets you quickly copy to clipboard passwords using...
;;; AUR: pass-clip (#10623)
(define-public pass-clip
  (package
    (name "pass-clip")
    (version "0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ibizaman/pass-clip")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ibizaman/pass-clip")
    (synopsis "a pass extension that lets you quickly copy to clipboard passwords using...")
    (description
     "A pass extension that lets you quickly copy to clipboard passwords using
fzf or rofi.")
    (license license:gpl3)))

;;; pass-qr — a pass extension that lets you quickly generate a QR code for passwords...
;;; AUR: pass-qr (#10624)
(define-public pass-qr
  (package
    (name "pass-qr")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/codekoala/pass-qr")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/codekoala/pass-qr")
    (synopsis "a pass extension that lets you quickly generate a QR code for passwords...")
    (description
     "A pass extension that lets you quickly generate a QR code for passwords
using fzf or rofi.")
    (license license:gpl3)))

;;; gcs-bin — WYSIWYG editor for building character sheets for GURPS 4th Edition
;;; AUR: gcs-bin (#10625)
(define-public gcs-bin
  (package
    (name "gcs-bin")
    (version "5.42.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://gurpscharactersheet.com/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://gurpscharactersheet.com")
    (synopsis "WYSIWYG editor for building character sheets for GURPS 4th Edition")
    (description
     "WYSIWYG editor for building character sheets for GURPS 4th Edition.")
    (license license:mpl2.0)))

;;; grml2usb — installs one or multiple grml ISOs on an USB device - contains grml2iso
;;; AUR: grml2usb (#10626)
(define-public grml2usb
  (package
    (name "grml2usb")
    (version "0.20.6")
    (source
     (origin
       (method url-fetch)
       (uri "http://grml.org/grml2usb/")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://grml.org/grml2usb/")
    (synopsis "installs one or multiple grml ISOs on an USB device - contains grml2iso")
    (description
     "Installs one or multiple grml ISOs on an USB device - contains grml2iso.")
    (license license:gpl2)))

;;; sbkeys — simple script to generate Secure Boot keys
;;; AUR: sbkeys (#10628)
(define-public sbkeys
  (package
    (name "sbkeys")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/electrickite/sbkeys")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/electrickite/sbkeys")
    (synopsis "simple script to generate Secure Boot keys")
    (description
     "Simple script to generate Secure Boot keys.")
    (license license:gpl3)))

;;; micropolis-java — micropolis, Unix version of SimCity 1 rewrited in Java
;;; AUR: micropolis-java (#10629)
(define-public micropolis-java
  (package
    (name "micropolis-java")
    (version "1.6.r505")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jason17055/micropolis-java")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jason17055/micropolis-java")
    (synopsis "micropolis, Unix version of SimCity 1 rewrited in Java")
    (description
     "Micropolis, Unix version of SimCity 1 rewrited in Java.")
    (license (license:non-copyleft "custom:GPL-3.0"))))

;;; xfce-theme-greybird-git — desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity
;;; AUR: xfce-theme-greybird-git (#10630)
(define-public xfce-theme-greybird-git
  (package
    (name "xfce-theme-greybird-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/shimmerproject/Greybird")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/shimmerproject/Greybird")
    (synopsis "desktop theme suite from Xubuntu, with support for Xfce, Metacity and Unity")
    (description
     "Desktop theme suite from Xubuntu, with support for Xfce, Metacity and
Unity.")
    (license (list (license:non-copyleft "cc-by-sa-3.0") license:gpl2+))))

;;; vislcg3 — compiler and parser for Constraint Grammar (CG), a paradigm for robust,...
;;; AUR: vislcg3 (#10632)
(define-public vislcg3
  (package
    (name "vislcg3")
    (version "1.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://edu.visl.dk/cg3.html")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://edu.visl.dk/cg3.html")
    (synopsis "compiler and parser for Constraint Grammar (CG), a paradigm for robust,...")
    (description
     "Compiler and parser for Constraint Grammar (CG), a paradigm for robust,
rule-based Natural Language Parsing.")
    (license license:gpl3)))

;;; ntfy-alertmanager — a bridge between ntfy and Alertmanager
;;; AUR: ntfy-alertmanager (#10633)
(define-public ntfy-alertmanager
  (package
    (name "ntfy-alertmanager")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://hub.xenrox.net/~xenrox/ntfy-alertmanager")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://hub.xenrox.net/~xenrox/ntfy-alertmanager")
    (synopsis "a bridge between ntfy and Alertmanager")
    (description
     "A bridge between ntfy and Alertmanager.")
    (license license:agpl3)))

;;; prometheus-podman-exporter — prometheus exporter for podman environments exposing containers, pods,...
;;; AUR: prometheus-podman-exporter (#10634)
(define-public prometheus-podman-exporter
  (package
    (name "prometheus-podman-exporter")
    (version "1.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/containers/prometheus-podman-exporter")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/containers/prometheus-podman-exporter")
    (synopsis "prometheus exporter for podman environments exposing containers, pods,...")
    (description
     "Prometheus exporter for podman environments exposing containers, pods,
images, volumes and networks information.")
    (license license:asl2.0)))

;;; ardupilot-mission-planner — full-featured ground station application for the ArduPilot open source...
;;; AUR: ardupilot-mission-planner (#10636)
(define-public ardupilot-mission-planner
  (package
    (name "ardupilot-mission-planner")
    (version "1.3.83")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ArduPilot/MissionPlanner/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/ArduPilot/MissionPlanner")
    (synopsis "full-featured ground station application for the ArduPilot open source...")
    (description
     "Full-featured ground station application for the ArduPilot open source
autopilot project.")
    (license license:gpl3)))

;;; fortune-mod-xfiles — a collection of fortune cookies from X-Files
;;; AUR: fortune-mod-xfiles (#10638)
(define-public fortune-mod-xfiles
  (package
    (name "fortune-mod-xfiles")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.splitbrain.org/projects/fortunes/xfiles")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://www.splitbrain.org/projects/fortunes/xfiles")
    (synopsis "a collection of fortune cookies from X-Files")
    (description
     "A collection of fortune cookies from X-Files.")
    (license (license:non-copyleft "unknown"))))

;;; msi-keyboard-git — utility to control MSI Steelseries keyboards, written in C++
;;; AUR: msi-keyboard-git (#10639)
(define-public msi-keyboard-git
  (package
    (name "msi-keyboard-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/makkarpov/msi-keyboard")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/makkarpov/msi-keyboard")
    (synopsis "utility to control MSI Steelseries keyboards, written in C++")
    (description
     "Utility to control MSI Steelseries keyboards, written in C++.")
    (license license:bsd-3)))

;;; twad-git — manage DOOM engines and mods with the terminal wad launcher
;;; AUR: twad-git (#10640)
(define-public twad-git
  (package
    (name "twad-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zmnpl/twad")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/zmnpl/twad")
    (synopsis "manage DOOM engines and mods with the terminal wad launcher")
    (description
     "Manage DOOM engines and mods with the terminal wad launcher.")
    (license license:expat)))

;;; schemaspy — graphical Database Schema Metadata Browser
;;; AUR: schemaspy (#10641)
(define-public schemaspy
  (package
    (name "schemaspy")
    (version "7.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.sourceforge.net/schemaspy/schemaspy-7.0.2.tar.gz/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "http://schemaspy.sourceforge.net/")
    (synopsis "graphical Database Schema Metadata Browser")
    (description
     "Graphical Database Schema Metadata Browser.")
    (license license:lgpl3)))

;;; shcopy-bin — copy text to clipboard from anywhere using ANSI OSC 52 sequence
;;; AUR: shcopy-bin (#10642)
(define-public shcopy-bin
  (package
    (name "shcopy-bin")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/aymanbagabas/shcopy/releases")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/placeholder/"))))
    (home-page "https://github.com/aymanbagabas/shcopy")
    (synopsis "copy text to clipboard from anywhere using ANSI OSC 52 sequence")
    (description
     "Copy text to clipboard from anywhere using ANSI OSC 52 sequence.")
    (license license:expat)))

;;; purple-discord-git — a libpurple/Pidgin plugin for Discord
;;; AUR: purple-discord-git (#10643)
(define-public purple-discord-git
  (package
    (name "purple-discord-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EionRobb/purple-discord")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/EionRobb/purple-discord")
    (synopsis "a libpurple/Pidgin plugin for Discord")
    (description
     "A libpurple/Pidgin plugin for Discord.")
    (license license:gpl3)))

;;; slack-libpurple-git — a purple-based (Pidgin) plugin for Slack
;;; AUR: slack-libpurple-git (#10644)
(define-public slack-libpurple-git
  (package
    (name "slack-libpurple-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dylex/slack-libpurple.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dylex/slack-libpurple.git")
    (synopsis "a purple-based (Pidgin) plugin for Slack")
    (description
     "A purple-based (Pidgin) plugin for Slack.")
    (license license:gpl3)))

;;; sshcd — ssh command with directory specification support
;;; AUR: sshcd (#10646)
(define-public sshcd
  (package
    (name "sshcd")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fraction/sshcd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fraction/sshcd")
    (synopsis "ssh command with directory specification support")
    (description
     "Ssh command with directory specification support.")
    (license license:expat)))

;;; gnome-shell-extension-hibernate-status — gnome Shell extension that adds a hibernate/hybrid suspend button in...
;;; AUR: gnome-shell-extension-hibernate-status (#10647)
(define-public gnome-shell-extension-hibernate-status
  (package
    (name "gnome-shell-extension-hibernate-status")
    (version "1.15")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arelange/gnome-shell-extension-hibernate-status")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/arelange/gnome-shell-extension-hibernate-status")
    (synopsis "gnome Shell extension that adds a hibernate/hybrid suspend button in...")
    (description
     "Gnome Shell extension that adds a hibernate/hybrid suspend button in
Status menu.")
    (license license:gpl3+)))

;;; ion-git — the Ion Shell. Compatible with Redox and Linux
;;; AUR: ion-git (#10648)
(define-public ion-git
  (package
    (name "ion-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.redox-os.org/redox-os/ion")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.redox-os.org/redox-os/ion")
    (synopsis "the Ion Shell. Compatible with Redox and Linux")
    (description
     "The Ion Shell. Compatible with Redox and Linux.")
    (license license:expat)))

;;; recon-ng — a full-featured Web Reconnaissance framework written in Python
;;; AUR: recon-ng (#10650)
(define-public recon-ng
  (package
    (name "recon-ng")
    (version "5.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lanmaster53/recon-ng")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/lanmaster53/recon-ng")
    (synopsis "a full-featured Web Reconnaissance framework written in Python")
    (description
     "A full-featured Web Reconnaissance framework written in Python.")
    (license license:gpl3)))

;;; gitqlient-git — development branch of GitQlient
;;; AUR: gitqlient-git (#10652)
(define-public gitqlient-git
  (package
    (name "gitqlient-git")
    (version "0.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/francescmm/GitQlient")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/francescmm/GitQlient")
    (synopsis "development branch of GitQlient")
    (description
     "Development branch of GitQlient.")
    (license license:lgpl3+)))
