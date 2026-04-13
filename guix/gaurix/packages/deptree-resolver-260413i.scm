;;; deptree-resolver-260413i.scm -- Dependency-tree priority resolver
;;; Generated: 2026-04-13T16:49:19.368725+00:00
;;; Run ID: deptree-resolver-260413i
;;; Total: 100 packages (12 recipes, 88 blocked)
;;;
;;; Recipes (12):
;;;   czkawka-cli-bin
;;;   darya-bin
;;;   deadbranch-bin
;;;   ded
;;;   devbox-bin
;;;   dict-gcide
;;;   dosbox-pure-unleashed-bin
;;;   dotnet-host-bin
;;;   ds
;;;   dusage-bin
;;;   eden-bin
;;;   eden-preview-bin
;;;
;;; Blocked (88):
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
;;;   dasel [NEEDS_RECIPE_DESIGN]
;;;   deezer-enhanced [NEEDS_RECIPE_DESIGN]
;;;   dinit-edit-git [NEEDS_RECIPE_DESIGN]
;;;   discord-chat-exporter-plus-cli [NEEDS_RECIPE_DESIGN]
;;;   doasedit-nhk [NEEDS_RECIPE_DESIGN]
;;;   dupe-krill [NEEDS_RECIPE_DESIGN]
;;;   dust-git [NEEDS_RECIPE_DESIGN]
;;;   elephant-bitwarden [NEEDS_RECIPE_DESIGN]
;;;   elephant-calc [NEEDS_RECIPE_DESIGN]
;;;   elephant-files [NEEDS_RECIPE_DESIGN]
;;;   elephant-niriactions [NEEDS_RECIPE_DESIGN]
;;;

(define-module (gaurix packages deptree-resolver-260413i)
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
            czkawka-cli-bin
            darya-bin
            deadbranch-bin
            ded
            devbox-bin
            dict-gcide
            dosbox-pure-unleashed-bin
            dotnet-host-bin
            ds
            dusage-bin
            eden-bin
            eden-preview-bin
            ))

;;; ── czkawka-cli-bin (#1351) ──

(define-public czkawka-cli-bin
  (package
    (name "czkawka-cli-bin")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/qarmin/czkawka/releases/download/v" version "/czkawka-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/qarmin/czkawka")
    (synopsis "find and manage duplicate files, empty folders, similar images, and other "...")
    (description "Find and manage duplicate files, empty folders, similar images, and other \"lint\" (CLI).")
    (license license:expat)))

;;; ── darya-bin (#7340) ──

(define-public darya-bin
  (package
    (name "darya-bin")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mrkatebzadeh/darya/releases/download/v" version "/darya-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/mrkatebzadeh/darya")
    (synopsis "disk usage explorer with a TUI and live treemap")
    (description "Disk usage explorer with a TUI and live treemap.")
    (license license:expat)))

;;; ── deadbranch-bin (#2794) ──

(define-public deadbranch-bin
  (package
    (name "deadbranch-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/armgabrielyan/deadbranch/releases/download/v" version "/deadbranch-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/armgabrielyan/deadbranch")
    (synopsis "clean up stale git branches safely")
    (description "Clean up stale git branches safely.")
    (license license:expat)))

;;; ── ded (#6763) ──

(define-public ded
  (package
    (name "ded")
    (version "20250928")
    (source (origin
              (method url-fetch)
              (uri "https://invisible-island.net/ded/ded.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://invisible-island.net/ded/ded.html")
    (synopsis "directory editor, file manager similar to Emacs dired")
    (description "directory editor, file manager similar to Emacs dired.")
    (license license:bsd-3)))

;;; ── devbox-bin (#1723) ──

(define-public devbox-bin
  (package
    (name "devbox-bin")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.jetpack.io/devbox/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://www.jetpack.io/devbox/")
    (synopsis "A command-line tool that lets you easily create isolated shells for develop...")
    (description "A command-line tool that lets you easily create isolated shells for development.(Written in Go.Prebuilt version).")
    (license license:asl2.0)))

;;; ── dict-gcide (#1030) ──

(define-public dict-gcide
  (package
    (name "dict-gcide")
    (version "0.54")
    (source (origin
              (method url-fetch)
              (uri "https://gcide.gnu.org.ua/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gcide.gnu.org.ua/")
    (synopsis "GNU version of the Collaborative International Dictionary of English for di...")
    (description "GNU version of the Collaborative International Dictionary of English for dictd et al.")
    (license license:gpl3+)))

;;; ── dosbox-pure-unleashed-bin (#7540) ──

(define-public dosbox-pure-unleashed-bin
  (package
    (name "dosbox-pure-unleashed-bin")
    (version "1.0_preview5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/schellingb/dosbox-pure-unleashed/releases/download/v" version "/dosbox-pure-unleashed-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/schellingb/dosbox-pure-unleashed")
    (synopsis "DOSBox reimagined with a friendly interface, ZIP loading and save states")
    (description "DOSBox reimagined with a friendly interface, ZIP loading and save states.")
    (license license:gpl2)))

;;; ── dotnet-host-bin (#1271) ──

(define-public dotnet-host-bin
  (package
    (name "dotnet-host-bin")
    (version "10.0.5.sdk201")
    (source (origin
              (method url-fetch)
              (uri "https://www.microsoft.com/net/core")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis "A generic driver for the")
    (description "A generic driver for the .NET Core Command Line Interface (binary).")
    (license license:expat)))

;;; ── ds (#7183) ──

(define-public ds
  (package
    (name "ds")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/moviuro/ds")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/moviuro/ds")
    (synopsis "A simple script that "does something"")
    (description "A simple script that \"does something\".")
    (license license:wtfpl2)))

;;; ── dusage-bin (#7582) ──

(define-public dusage-bin
  (package
    (name "dusage-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mihaigalos/dusage/releases/download/v" version "/dusage-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/mihaigalos/dusage")
    (synopsis "A command line disk usage information tool")
    (description "A command line disk usage information tool.")
    (license license:expat)))

;;; ── eden-bin (#1317) ──

(define-public eden-bin
  (package
    (name "eden-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://git.eden-emu.dev/eden-emu/eden")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://git.eden-emu.dev/eden-emu/eden")
    (synopsis "the Eden Nintendo Switch emulator AppImage")
    (description "The Eden Nintendo Switch emulator AppImage.")
    (license license:gpl3+)))

;;; ── eden-preview-bin (#2692) ──

(define-public eden-preview-bin
  (package
    (name "eden-preview-bin")
    (version "0.2.0_rc")
    (source (origin
              (method url-fetch)
              (uri "https://git.eden-emu.dev/eden-emu/eden")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://git.eden-emu.dev/eden-emu/eden")
    (synopsis "the Eden Nintendo Switch emulator AppImage for preview builds such as relea...")
    (description "The Eden Nintendo Switch emulator AppImage for preview builds such as release candiates using the amd64-gcc-standard version.")
    (license license:gpl3+)))
