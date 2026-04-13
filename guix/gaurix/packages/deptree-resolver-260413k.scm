;;; deptree-resolver-260413k.scm -- Dependency-tree priority resolver
;;; Generated: 2026-04-13T19:22:41.273601+00:00
;;; Run ID: deptree-resolver-260413k
;;; Total: 100 packages (8 recipes, 92 blocked)
;;;
;;; Recipes (8):
;;;   wps-office-365-fonts
;;;   falcon-sensor
;;;   fastfind-bin
;;;   faubox
;;;   fbctrl
;;;   fcitx5-pinyin-chinese-idiom
;;;   fist-bin
;;;   fittstool
;;;
;;; Blocked (92):
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
;;;   wps-office-365-edu-fonts [NEEDS_RECIPE_DESIGN]
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
;;;   famitracker [NEEDS_RECIPE_DESIGN]
;;;   feroxbuster [NEEDS_RECIPE_DESIGN]
;;;

(define-module (gaurix packages deptree-resolver-260413k)
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
            wps-office-365-fonts
            falcon-sensor
            fastfind-bin
            faubox
            fbctrl
            fcitx5-pinyin-chinese-idiom
            fist-bin
            fittstool
            ))

;;; -- wps-office-365-fonts (#2350) --

(define-public wps-office-365-fonts
  (package
    (name "wps-office-365-fonts")
    (version "12.1.2.24730")
    (source (origin
              (method url-fetch)
              (uri "https://365.wps.cn/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://365.wps.cn/")
    (synopsis "WPS Office, is an office productivity suite")
    (description "WPS Office, is an office productivity suite.")
    (license license:expat)))

;;; -- falcon-sensor (#8832) --

(define-public falcon-sensor
  (package
    (name "falcon-sensor")
    (version "7.32.0")
    (source (origin
              (method url-fetch)
              (uri "https://falcon.crowdstrike.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://falcon.crowdstrike.com/")
    (synopsis "crowdStrike Falcon Sensor for Linux")
    (description "CrowdStrike Falcon Sensor for Linux.")
    (license license:expat)))

;;; -- fastfind-bin (#2550) --

(define-public fastfind-bin
  (package
    (name "fastfind-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/RobertFlexx/fastfind/releases/download/v" version "/fastfind-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/RobertFlexx/fastfind")
    (synopsis "fast, smart file search with fuzzy matching and natural language queries")
    (description "Fast, smart file search with fuzzy matching and natural language queries.")
    (license license:expat)))

;;; -- faubox (#2851) --

(define-public faubox
  (package
    (name "faubox")
    (version "23.4.100")
    (source (origin
              (method url-fetch)
              (uri "https://www.doku.faubox.rrze.fau.eu/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.doku.faubox.rrze.fau.eu/")
    (synopsis "FAU file synchronization client")
    (description "FAU file synchronization client.")
    (license license:expat)))

;;; -- fbctrl (#1062) --

(define-public fbctrl
  (package
    (name "fbctrl")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://babelize.org/fbctrl.php")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://babelize.org/fbctrl.php")
    (synopsis "a lightweight utility to switch the windows or desktops on top of any compa...")
    (description "a lightweight utility to switch the windows or desktops on top of any compatible window manager like fluxbox, blackbox or openbox.")
    (license license:gpl2)))

;;; -- fcitx5-pinyin-chinese-idiom (#6814) --

(define-public fcitx5-pinyin-chinese-idiom
  (package
    (name "fcitx5-pinyin-chinese-idiom")
    (version "20200930")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kienyew/fcitx5-pinyin-chinese-idiom")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Kienyew/fcitx5-pinyin-chinese-idiom")
    (synopsis "fcitx 5 Pinyin Chinese Idiom Dictionary")
    (description "Fcitx 5 Pinyin Chinese Idiom Dictionary.")
    (license license:expat)))

;;; -- fist-bin (#2551) --

(define-public fist-bin
  (package
    (name "fist-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Squirreljetpack/fist/releases/download/v" version "/fist-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/Squirreljetpack/fist")
    (synopsis "A fast and intuitive search tool for the filesystem")
    (description "A fast and intuitive search tool for the filesystem.")
    (license license:expat)))

;;; -- fittstool (#11163) --

(define-public fittstool
  (package
    (name "fittstool")
    (version "master")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jeanCarloMachado/fittstool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jeanCarloMachado/fittstool")
    (synopsis "this utility allows you to do just that - bind commands to mouse button eve...")
    (description "This utility allows you to do just that - bind commands to mouse button events on the screen corners, via a simple and concise configuration file.")
    (license license:expat)))
