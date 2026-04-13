;;; deptree-resolver-260413j.scm -- Dependency-tree priority resolver
;;; Generated: 2026-04-13T18:05:34.427615+00:00
;;; Run ID: deptree-resolver-260413j
;;; Total: 100 packages (11 recipes, 89 blocked)
;;;
;;; Recipes (11):
;;;   ente-desktop-bin
;;;   envtrace-bin
;;;   eperiodique
;;;   epsonscan2-non-free-plugin
;;;   eso-addons-manager-bin
;;;   ethtui-bin
;;;   etr-bin
;;;   exiled-exchange-2-bin
;;;   extramaus
;;;   fackr-bin
;;;   fake86-git
;;;
;;; Blocked (89):
;;;   nvidia-utils-beta [NEEDS_RECIPE_DESIGN]
;;;   python-opentelemetry-exporter-otlp-proto-common [NEEDS_RECIPE_DESIGN]
;;;   sonic-win [NEEDS_RECIPE_DESIGN]
;;;   lib32-xrizer [NEEDS_RECIPE_DESIGN]
;;;   plasma-workspace-povd [NEEDS_RECIPE_DESIGN]
;;;   lib32-l-smash [NEEDS_RECIPE_DESIGN]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [NEEDS_RECIPE_DESIGN]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   yabridgectl-wine10-git [NEEDS_RECIPE_DESIGN]
;;;   linux-cachyos-lts [DKMS_KERNEL_MODULE]
;;;   python-opentelemetry-exporter-zipkin-proto-http [NEEDS_RECIPE_DESIGN]
;;;   linux-cachyos [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-rc [DKMS_KERNEL_MODULE]
;;;   qt6-base-hifps [NEEDS_RECIPE_DESIGN]
;;;   anbox-git [SOURCE_UNAVAILABLE]
;;;   chromium-gost [NEEDS_RECIPE_DESIGN]
;;;   linux6.19.8.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-headers-bin [SOURCE_UNAVAILABLE]
;;;   nvidia-vulkan-dkms [SOURCE_UNAVAILABLE]
;;;   openai-codex-autoup-bin [SOURCE_UNAVAILABLE]
;;;   opensc-p11-kit-module [SOURCE_UNAVAILABLE]
;;;   pac-pacman-aliases [ARCH_SPECIFIC]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC]
;;;   pipewire-enable-bluez5 [ARCH_SPECIFIC]
;;;   projtlauncher [SOURCE_UNAVAILABLE]
;;;   shimmy-bin [SOURCE_UNAVAILABLE]
;;;   subs2srs-git [SOURCE_UNAVAILABLE]
;;;   ttf-ms-win10-japanese [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win10-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-japanese [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-korean [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-other [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-sea [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-thai [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_cn [PROPRIETARY_FONT_LICENSE]
;;;   ttf-ms-win11-zh_tw [PROPRIETARY_FONT_LICENSE]
;;;   vivaldi-ffmpeg-codecs [SOURCE_UNAVAILABLE]
;;;   whatsapp-for-linux [SOURCE_UNAVAILABLE]
;;;   zettlr [SOURCE_UNAVAILABLE]
;;;   ancient-packages [ARCH_SPECIFIC]
;;;   binder_linux-dkms [DKMS_KERNEL_MODULE]
;;;   lib32-libtxc_dxtn [NEEDS_RECIPE_DESIGN]
;;;   lib32-zix [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-docs-bin [NEEDS_RECIPE_DESIGN]
;;;   linux-zen-versioned-headers-bin [NEEDS_RECIPE_DESIGN]
;;;   localepurge-hook [ARCH_SPECIFIC]
;;;   mandb-instant-update [ARCH_SPECIFIC]
;;;   mkinitcpio-sd-numlock [NEEDS_RECIPE_DESIGN]
;;;   oopz [NEEDS_RECIPE_DESIGN]
;;;   paccache-hook [ARCH_SPECIFIC]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC]
;;;   yaycache-hook [ARCH_SPECIFIC]
;;;   youtube-music-desktop [NEEDS_RECIPE_DESIGN]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   arch-gdm-theme-list [ARCH_SPECIFIC]
;;;   brother-cups-wrapper-common [NEEDS_RECIPE_DESIGN]
;;;   brother-mfc-l2710dw [NEEDS_RECIPE_DESIGN]
;;;   ccase [NEEDS_RECIPE_DESIGN]
;;;   ccusage [NEEDS_RECIPE_DESIGN]
;;;   checkupdates-notify [ARCH_SPECIFIC]
;;;   claude-agent-acp [NEEDS_RECIPE_DESIGN]
;;;   critique [NEEDS_RECIPE_DESIGN]
;;;   csharpier [NEEDS_RECIPE_DESIGN]
;;;   cython2 [NEEDS_RECIPE_DESIGN]
;;;   deezer-enhanced [NEEDS_RECIPE_DESIGN]
;;;   dinit-edit-git [NEEDS_RECIPE_DESIGN]
;;;   discord-chat-exporter-plus-cli [NEEDS_RECIPE_DESIGN]
;;;   doasedit-nhk [NEEDS_RECIPE_DESIGN]
;;;   elephant-bitwarden [NEEDS_RECIPE_DESIGN]
;;;   elephant-calc [NEEDS_RECIPE_DESIGN]
;;;   elephant-files [NEEDS_RECIPE_DESIGN]
;;;   elephant-niriactions [NEEDS_RECIPE_DESIGN]
;;;   elephant-nirisessions [NEEDS_RECIPE_DESIGN]
;;;   elephant-snippets [NEEDS_RECIPE_DESIGN]
;;;   elephant-windows [NEEDS_RECIPE_DESIGN]
;;;   etckeeper-packages [ARCH_SPECIFIC]
;;;

(define-module (gaurix packages deptree-resolver-260413j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            ente-desktop-bin
            envtrace-bin
            eperiodique
            epsonscan2-non-free-plugin
            eso-addons-manager-bin
            ethtui-bin
            etr-bin
            exiled-exchange-2-bin
            extramaus
            fackr-bin
            fake86-git
            ))

;;; ── ente-desktop-bin (#2330) ──

(define-public ente-desktop-bin
  (package
    (name "ente-desktop-bin")
    (version "1.7.22")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ente-io/photos-desktop/releases/download/v" version "/photos-desktop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/ente-io/photos-desktop")
    (synopsis "desktop app for ente Photos")
    (description "Desktop app for ente Photos.(Prebuilt version).")
    (license license:gpl3)))

;;; ── envtrace-bin (#1413) ──

(define-public envtrace-bin
  (package
    (name "envtrace-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FlerAlex/envtrace/releases/download/v" version "/envtrace-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/FlerAlex/envtrace")
    (synopsis "trace where environment variables are defined and modified through shell st...")
    (description "Trace where environment variables are defined and modified through shell startup sequences.")
    (license license:expat)))

;;; ── eperiodique (#756) ──

(define-public eperiodique
  (package
    (name "eperiodique")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "http://sourceforge.net/projects/eperiodique/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://sourceforge.net/projects/eperiodique/")
    (synopsis "A simple Periodic Table Of Elements viewer using the EFL")
    (description "A simple Periodic Table Of Elements viewer using the EFL.")
    (license license:bsd-3)))

;;; ── epsonscan2-non-free-plugin (#406) ──

(define-public epsonscan2-non-free-plugin
  (package
    (name "epsonscan2-non-free-plugin")
    (version "1.0.0.6")
    (source (origin
              (method url-fetch)
              (uri "http://support.epson.net/linux/en/epsonscan2.php")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://support.epson.net/linux/en/epsonscan2.php")
    (synopsis "plugins for Epson Scan 2")
    (description "Plugins for Epson Scan 2.")
    (license license:expat)))

;;; ── eso-addons-manager-bin (#4546) ──

(define-public eso-addons-manager-bin
  (package
    (name "eso-addons-manager-bin")
    (version "0.4.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/arviceblot/eso-addons/releases/download/v" version "/eso-addons-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/arviceblot/eso-addons")
    (synopsis "cross platform addon manager for the Elder Scrolls Online")
    (description "Cross platform addon manager for the Elder Scrolls Online.")
    (license license:expat)))

;;; ── ethtui-bin (#2099) ──

(define-public ethtui-bin
  (package
    (name "ethtui-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/skibidiandulka/ethtui/releases/download/v" version "/ethtui-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/skibidiandulka/ethtui")
    (synopsis "TUI for Ethernet status (Omarchy-style)")
    (description "TUI for Ethernet status (Omarchy-style).")
    (license license:gpl3)))

;;; ── etr-bin (#2549) ──

(define-public etr-bin
  (package
    (name "etr-bin")
    (version "1.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tkjaer/etr/releases/download/v" version "/etr-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/tkjaer/etr")
    (synopsis "ETR - ECMP Traceroute")
    (description "ETR - ECMP Traceroute.")
    (license license:expat)))

;;; ── exiled-exchange-2-bin (#10340) ──

(define-public exiled-exchange-2-bin
  (package
    (name "exiled-exchange-2-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://kvan7.github.io/Exiled-Exchange-2/download")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://kvan7.github.io/Exiled-Exchange-2/download")
    (synopsis "path of Exile 2 trading app for price checking")
    (description "Path of Exile 2 trading app for price checking.")
    (license license:expat)))

;;; ── extramaus (#4235) ──

(define-public extramaus
  (package
    (name "extramaus")
    (version "20121220")
    (source (origin
              (method url-fetch)
              (uri "http://dodger-tools.sourceforge.net/cms/index.php?id=100000201")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://dodger-tools.sourceforge.net/cms/index.php?id=100000201")
    (synopsis "workaround to always show mouse cursor under x11")
    (description "workaround to always show mouse cursor under x11.")
    (license license:gpl3+)))

;;; ── fackr-bin (#4577) ──

(define-public fackr-bin
  (package
    (name "fackr-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tenseleyFlow/fackr/releases/download/v" version "/fackr-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/tenseleyFlow/fackr")
    (synopsis "terminal text editor written in Rust - facsimile reimplementation")
    (description "Terminal text editor written in Rust - facsimile reimplementation.")
    (license license:expat)))

;;; ── fake86-git (#7551) ──

(define-public fake86-git
  (package
    (name "fake86-git")
    (version "2020.05.09.gd275349")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lgblgblgb/fake86")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/lgblgblgb/fake86.git")
    (synopsis "an 8086 PC emulator written in C - git version")
    (description "An 8086 PC emulator written in C - git version.")
    (license license:gpl2)))
