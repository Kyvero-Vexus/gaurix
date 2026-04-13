;;; deptree-resolver-260413l.scm -- Dependency-tree priority resolver
;;; Generated: 2026-04-13T20:42:31.501301+00:00
;;; Run ID: deptree-resolver-260413l
;;; Total: 100 packages (24 recipes, 76 blocked)
;;;
;;; Recipes (24):
;;;   python-opentelemetry-exporter-otlp-proto-common
;;;   python-opentelemetry-exporter-zipkin-proto-http
;;;   brother-cups-wrapper-common
;;;   brother-mfc-l2710dw
;;;   ccase
;;;   dinit-edit-git
;;;   doasedit-nhk
;;;   elephant-bitwarden
;;;   elephant-calc
;;;   elephant-files
;;;   elephant-niriactions
;;;   elephant-nirisessions
;;;   elephant-snippets
;;;   elephant-windows
;;;   feroxbuster
;;;   flyctl
;;;   fm-git
;;;   fmlib
;;;   folder-declutter-bin
;;;   fortitude-bin
;;;   freelens-bin
;;;   fsid
;;;   ftr-site-config-git
;;;   gasroot
;;;
;;; Blocked (76):
;;;   nvidia-utils-beta [NEEDS_RECIPE_DESIGN]
;;;   sonic-win [NEEDS_RECIPE_DESIGN]
;;;   lib32-xrizer [LIB32_UNSUPPORTED]
;;;   plasma-workspace-povd [NEEDS_RECIPE_DESIGN]
;;;   lib32-l-smash [LIB32_UNSUPPORTED]
;;;   new-lg4ff-dkms-git [DKMS_KERNEL_MODULE]
;;;   lib32-libudev0-shim [LIB32_UNSUPPORTED]
;;;   hid-fanatecff-dkms [DKMS_KERNEL_MODULE]
;;;   yabridgectl-wine10-git [NEEDS_RECIPE_DESIGN]
;;;   linux-cachyos-lts [DKMS_KERNEL_MODULE]
;;;   linux-cachyos [DKMS_KERNEL_MODULE]
;;;   linux-cachyos-rc [DKMS_KERNEL_MODULE]
;;;   qt6-base-hifps [NEEDS_RECIPE_DESIGN]
;;;   anbox-git [SOURCE_UNAVAILABLE]
;;;   chromium-gost [INFEASIBLE_BUILD]
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
;;;   pipewire-enable-bluez5 [SOURCE_UNAVAILABLE]
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
;;;   lib32-libtxc_dxtn [LIB32_UNSUPPORTED]
;;;   lib32-zix [LIB32_UNSUPPORTED]
;;;   linux-zen-versioned-docs-bin [DKMS_KERNEL_MODULE]
;;;   linux-zen-versioned-headers-bin [DKMS_KERNEL_MODULE]
;;;   localepurge-hook [SOURCE_UNAVAILABLE]
;;;   mandb-instant-update [SOURCE_UNAVAILABLE]
;;;   mkinitcpio-sd-numlock [SOURCE_UNAVAILABLE]
;;;   oopz [ELECTRON_APP]
;;;   paccache-hook [ARCH_SPECIFIC]
;;;   systemd-boot-pacman-hook [ARCH_SPECIFIC]
;;;   yaycache-hook [SOURCE_UNAVAILABLE]
;;;   youtube-music-desktop [SOURCE_UNAVAILABLE]
;;;   amneziawg-dkms [DKMS_KERNEL_MODULE]
;;;   arch-gdm-theme-list [SOURCE_UNAVAILABLE]
;;;   ccusage [NEEDS_RECIPE_DESIGN]
;;;   checkupdates-notify [ARCH_SPECIFIC]
;;;   claude-agent-acp [NEEDS_RECIPE_DESIGN]
;;;   critique [NEEDS_RECIPE_DESIGN]
;;;   csharpier [DOTNET_UNSUPPORTED]
;;;   cython2 [NEEDS_RECIPE_DESIGN]
;;;   deezer-enhanced [ELECTRON_APP]
;;;   discord-chat-exporter-plus-cli [DOTNET_UNSUPPORTED]
;;;   etckeeper-packages [ARCH_SPECIFIC]
;;;   famitracker [NEEDS_RECIPE_DESIGN]
;;;

(define-module (gaurix packages deptree-resolver-260413l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            python-opentelemetry-exporter-otlp-proto-common
            python-opentelemetry-exporter-zipkin-proto-http
            brother-cups-wrapper-common
            brother-mfc-l2710dw
            ccase
            dinit-edit-git
            doasedit-nhk
            elephant-bitwarden
            elephant-calc
            elephant-files
            elephant-niriactions
            elephant-nirisessions
            elephant-snippets
            elephant-windows
            feroxbuster
            flyctl
            fm-git
            fmlib
            folder-declutter-bin
            fortitude-bin
            freelens-bin
            fsid
            ftr-site-config-git
            gasroot
            ))

;;; -- python-opentelemetry-exporter-otlp-proto-common (#12066) --

(define-public python-opentelemetry-exporter-otlp-proto-common
  (package
    (name "python-opentelemetry-exporter-otlp-proto-common")
    (version "1.40.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-telemetry/opentelemetry-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "openTelemetry Protobuf encoding")
    (description "OpenTelemetry Protobuf encoding.")
    (license license:asl2.0)))

;;; -- python-opentelemetry-exporter-zipkin-proto-http (#12072) --

(define-public python-opentelemetry-exporter-zipkin-proto-http
  (package
    (name "python-opentelemetry-exporter-zipkin-proto-http")
    (version "1.40.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/open-telemetry/opentelemetry-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "zipkin Span Protobuf Exporter for OpenTelemetry")
    (description "Zipkin Span Protobuf Exporter for OpenTelemetry.")
    (license license:asl2.0)))

;;; -- brother-cups-wrapper-common (#9816) --

(define-public brother-cups-wrapper-common
  (package
    (name "brother-cups-wrapper-common")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "http://solutions.brother.com/linux/en_us/index.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://solutions.brother.com/linux/en_us/index.html")
    (synopsis "this package provides common files for some of the Brother cups wrapper ")
    (description "This package provides common files for some of the Brother cups wrapper packages.")
    (license license:gpl3+)))

;;; -- brother-mfc-l2710dw (#2714) --

(define-public brother-mfc-l2710dw
  (package
    (name "brother-mfc-l2710dw")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri "http://solutions.brother.com/linux/en_us/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://solutions.brother.com/linux/en_us/")
    (synopsis "LPR and CUPS driver for the Brother MFC-L2710DW")
    (description "LPR and CUPS driver for the Brother MFC-L2710DW.")
    (license license:expat)))

;;; -- ccase (#2499) --

(define-public ccase
  (package
    (name "ccase")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rutrum/ccase")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rutrum/ccase")
    (synopsis "a command line utility for converting between string cases")
    (description "A command line utility for converting between string cases.")
    (license license:expat)))

;;; -- dinit-edit-git (#923) --

(define-public dinit-edit-git
  (package
    (name "dinit-edit-git")
    (version "v0.20.0.r46.g227df92")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/davmac314/dinit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/davmac314/dinit"
           #:tests? #f))
    (home-page "https://github.com/davmac314/dinit")
    (synopsis "list and edit dinit service files by name (no more scouring the folders)")
    (description "List and edit dinit service files by name (no more scouring the folders).")
    (license license:expat)))

;;; -- doasedit-nhk (#6753) --

(define-public doasedit-nhk
  (package
    (name "doasedit-nhk")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nhktmdzhg/doasedit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nhktmdzhg/doasedit")
    (synopsis "a Rust implementation of doasedit - edit files as root using an unprivil")
    (description "A Rust implementation of doasedit - edit files as root using an unprivileged editor.")
    (license license:expat)))

;;; -- elephant-bitwarden (#915) --

(define-public elephant-bitwarden
  (package
    (name "elephant-bitwarden")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "bitwarden provider for elephant")
    (description "Bitwarden provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-calc (#273) --

(define-public elephant-calc
  (package
    (name "elephant-calc")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "calc provider for elephant")
    (description "Calc provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-files (#272) --

(define-public elephant-files
  (package
    (name "elephant-files")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "files provider for elephant")
    (description "Files provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-niriactions (#912) --

(define-public elephant-niriactions
  (package
    (name "elephant-niriactions")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "niriactions provider for elephant")
    (description "Niriactions provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-nirisessions (#911) --

(define-public elephant-nirisessions
  (package
    (name "elephant-nirisessions")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "nirisessions provider for elephant")
    (description "Nirisessions provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-snippets (#910) --

(define-public elephant-snippets
  (package
    (name "elephant-snippets")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "snippets provider for elephant")
    (description "Snippets provider for elephant.")
    (license license:gpl3+)))

;;; -- elephant-windows (#909) --

(define-public elephant-windows
  (package
    (name "elephant-windows")
    (version "2.20.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abenz1267/elephant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/abenz1267/elephant"
           #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "windows provider for elephant")
    (description "Windows provider for elephant.")
    (license license:gpl3+)))

;;; -- feroxbuster (#9875) --

(define-public feroxbuster
  (package
    (name "feroxbuster")
    (version "2.13.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/epi052/feroxbuster")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/epi052/feroxbuster")
    (synopsis "a fast, simple, recursive content discovery tool written in Rust")
    (description "A fast, simple, recursive content discovery tool written in Rust.")
    (license license:expat)))

;;; -- flyctl (#641) --

(define-public flyctl
  (package
    (name "flyctl")
    (version "0.4.30")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/superfly/flyctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/superfly/flyctl"
           #:tests? #f))
    (home-page "https://github.com/superfly/flyctl")
    (synopsis "command line tools for fly")
    (description "Command line tools for fly.io services.")
    (license license:asl2.0)))

;;; -- fm-git (#9301) --

(define-public fm-git
  (package
    (name "fm-git")
    (version "r117.807309c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/knipferrc/fm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/knipferrc/fm"
           #:tests? #f))
    (home-page "https://github.com/knipferrc/fm")
    (synopsis "a terminal based file manager")
    (description "A terminal based file manager.")
    (license license:expat)))

;;; -- fmlib (#7561) --

(define-public fmlib
  (package
    (name "fmlib")
    (version "1.4")
    (source (origin
              (method url-fetch)
              (uri "https://dmsmith.lmu.build/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://dmsmith.lmu.build/")
    (synopsis "a fortran multiple-precision arithmetic library")
    (description "A fortran multiple-precision arithmetic library.")
    (license license:expat)))

;;; -- folder-declutter-bin (#1409) --

(define-public folder-declutter-bin
  (package
    (name "folder-declutter-bin")
    (version "0.4.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ricardodantas/folder-declutter/releases/download/v" version "/folder-declutter-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/ricardodantas/folder-declutter")
    (synopsis "a folder declutter program that delete files after some pre-defined time")
    (description "A folder declutter program that delete files after some pre-defined time.")
    (license license:asl2.0)))

;;; -- fortitude-bin (#10335) --

(define-public fortitude-bin
  (package
    (name "fortitude-bin")
    (version "0.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/PlasmaFAIR/fortitude/releases/download/v" version "/fortitude-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://github.com/PlasmaFAIR/fortitude")
    (synopsis "a Blazingly Fast Fortran linter, inspired by (and built upon) Ruff")
    (description "A Blazingly Fast Fortran linter, inspired by (and built upon) Ruff.")
    (license license:expat)))

;;; -- freelens-bin (#9054) --

(define-public freelens-bin
  (package
    (name "freelens-bin")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://freelens.app/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (home-page "https://freelens.app/")
    (synopsis "free Open Source Kubernetes IDE")
    (description "Free Open Source Kubernetes IDE.")
    (license license:expat)))

;;; -- fsid (#3716) --

(define-public fsid
  (package
    (name "fsid")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skorotkiewicz/fsid")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/skorotkiewicz/fsid")
    (synopsis "a self-contained identifier for files and directories")
    (description "A self-contained identifier for files and directories.")
    (license license:expat)))

;;; -- ftr-site-config-git (#544) --

(define-public ftr-site-config-git
  (package
    (name "ftr-site-config-git")
    (version "2025.12.1.r3746.g44ec894")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fivefilters/ftr-site-config")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fivefilters/ftr-site-config")
    (synopsis "full-Text RSS: Site-specific article extraction rules (development version)")
    (description "Full-Text RSS: Site-specific article extraction rules (development version).")
    (license license:cc0)))

;;; -- gasroot (#3718) --

(define-public gasroot
  (package
    (name "gasroot")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/maandree/gasroot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/maandree/gasroot")
    (synopsis "a graphical, simple alternative to sudo and doas")
    (description "A graphical, simple alternative to sudo and doas.")
    (license license:expat)))
