;;; deptree-resolver-260413m.scm -- Dependency-tree priority resolver
;;; Generated: 2026-04-13T21:57:48.649231+00:00
;;; Run ID: deptree-resolver-260413m
;;; Total: 100 packages (19 recipes, 81 blocked)
;;;
;;; Recipes (19):
;;;   python-scipy-doctest
;;;   python-opentelemetry-exporter-zipkin-proto-http
;;;   python-opentelemetry-exporter-otlp-proto-grpc
;;;   python-opentelemetry-exporter-otlp-proto-http
;;;   gatus
;;;   ghgrab-bin
;;;   giff-bin
;;;   git-backdate-git
;;;   git-donkey
;;;   gitv-bin
;;;   gmatrix
;;;   gnome-menu-editor-qt
;;;   gnome-shell-extension-fuzzy-app-search-git
;;;   gnome-shell-extension-just-perfection-desktop
;;;   gnome-shell-extension-mpris-indicator-button-git
;;;   gnome-shell-extension-windowisready_remover-git
;;;   go-sendxmpp-git
;;;   go-sqlcmd
;;;   gochecker
;;;
;;; Blocked (81):
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
;;;   gram-editor-git [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.8.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.arch1-1-headers-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-docs-bin [SOURCE_UNAVAILABLE]
;;;   linux6.19.9.zen1-1-zen-headers-bin [SOURCE_UNAVAILABLE]
;;;   llama.cpp-aio [SOURCE_UNAVAILABLE]
;;;   nvidia-vulkan-dkms [SOURCE_UNAVAILABLE]
;;;   openai-codex-autoup-bin [SOURCE_UNAVAILABLE]
;;;   opensc-p11-kit-module [SOURCE_UNAVAILABLE]
;;;   pac-pacman-aliases [ARCH_SPECIFIC]
;;;   pacman-log-orphans-hook [ARCH_SPECIFIC]
;;;   pipewire-enable-bluez5 [SOURCE_UNAVAILABLE]
;;;   projtlauncher [SOURCE_UNAVAILABLE]
;;;   python-uharfbuzz [SOURCE_UNAVAILABLE]
;;;   shimmy-bin [SOURCE_UNAVAILABLE]
;;;   shorinclip-git [SOURCE_UNAVAILABLE]
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
;;;   vdhcoapp [SOURCE_UNAVAILABLE]
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
;;;   mkinitcpio-sd-numlock [ARCH_SPECIFIC]
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

(define-module (gaurix packages deptree-resolver-260413m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            python-scipy-doctest
            python-opentelemetry-exporter-zipkin-proto-http
            python-opentelemetry-exporter-otlp-proto-grpc
            python-opentelemetry-exporter-otlp-proto-http
            gatus
            ghgrab-bin
            giff-bin
            git-backdate-git
            git-donkey
            gitv-bin
            gmatrix
            gnome-menu-editor-qt
            gnome-shell-extension-fuzzy-app-search-git
            gnome-shell-extension-just-perfection-desktop
            gnome-shell-extension-mpris-indicator-button-git
            gnome-shell-extension-windowisready-remover-git
            go-sendxmpp-git
            go-sqlcmd
            gochecker
            ))

;;; -- python-scipy-doctest (#2625) --

(define-public python-scipy-doctest
  (package
    (name "python-scipy-doctest")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scipy/scipy_doctest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/scipy/scipy_doctest")
    (synopsis "floating-point aware doctesting")
    (description "Floating-point aware doctesting.")
    (license license:bsd-3)))

;;; -- python-opentelemetry-exporter-zipkin-proto-http (#2144) --

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

;;; -- python-opentelemetry-exporter-otlp-proto-grpc (#12067) --

(define-public python-opentelemetry-exporter-otlp-proto-grpc
  (package
    (name "python-opentelemetry-exporter-otlp-proto-grpc")
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
    (synopsis "openTelemetry Collector Protobuf over gRPC Exporter")
    (description "OpenTelemetry Collector Protobuf over gRPC Exporter.")
    (license license:asl2.0)))

;;; -- python-opentelemetry-exporter-otlp-proto-http (#12068) --

(define-public python-opentelemetry-exporter-otlp-proto-http
  (package
    (name "python-opentelemetry-exporter-otlp-proto-http")
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
    (synopsis "openTelemetry Collector Protobuf over HTTP Exporter")
    (description "OpenTelemetry Collector Protobuf over HTTP Exporter.")
    (license license:asl2.0)))

;;; -- gatus (#10086) --

(define-public gatus
  (package
    (name "gatus")
    (version "5.35.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TwiN/gatus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/TwiN/gatus")
    (synopsis "automated service health dashboard")
    (description "Automated service health dashboard.")
    (license license:asl2.0)))

;;; -- ghgrab-bin (#2561) --

(define-public ghgrab-bin
  (package
    (name "ghgrab-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/abhixdd/ghgrab/releases/download/v" version "/ghgrab-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/abhixdd/ghgrab")
    (synopsis "a simple, pretty terminal tool that lets you search and download files f")
    (description "A simple, pretty terminal tool that lets you search and download files from GitHub without leaving your CLI.")
    (license license:expat)))

;;; -- giff-bin (#2562) --

(define-public giff-bin
  (package
    (name "giff-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bahdotsh/giff/releases/download/v" version "/giff-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bahdotsh/giff")
    (synopsis "a terminal-based Git diff viewer with interactive rebase capabilities")
    (description "A terminal-based Git diff viewer with interactive rebase capabilities.")
    (license license:expat)))

;;; -- git-backdate-git (#6972) --

(define-public git-backdate-git
  (package
    (name "git-backdate-git")
    (version "r30.8ba5a0e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rixx/git-backdate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rixx/git-backdate")
    (synopsis "backdate a commit or range of commit to a date or range of dates")
    (description "Backdate a commit or range of commit to a date or range of dates.")
    (license license:expat)))

;;; -- git-donkey (#7779) --

(define-public git-donkey
  (package
    (name "git-donkey")
    (version "v1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bupd/git-donkey")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bupd/git-donkey")
    (synopsis "a CLI tool to help you manage your local git branches/repositories")
    (description "A CLI tool to help you manage your local git branches/repositories.")
    (license license:expat)))

;;; -- gitv-bin (#2973) --

(define-public gitv-bin
  (package
    (name "gitv-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/JayanAXHF/gitv/releases/download/v" version "/gitv-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JayanAXHF/gitv")
    (synopsis "a terminal-based viewer for GitHub issues")
    (description "A terminal-based viewer for GitHub issues.")
    (license license:expat)))

;;; -- gmatrix (#7342) --

(define-public gmatrix
  (package
    (name "gmatrix")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gducpm/gmatrix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/gducpm/gmatrix")
    (synopsis "a fast and lightweight terminal entertainment program for Matrix rain")
    (description "A fast and lightweight terminal entertainment program for Matrix rain.")
    (license license:gpl3)))

;;; -- gnome-menu-editor-qt (#2565) --

(define-public gnome-menu-editor-qt
  (package
    (name "gnome-menu-editor-qt")
    (version "r8.7e7a536")
    (source (origin
              (method url-fetch)
              (uri "http://lxlz.tk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://lxlz.tk")
    (synopsis "simple alacarte replacement, written on qt")
    (description "Simple alacarte replacement, written on qt. Gnome menu editor for systems with no gtk3 support.")
    (license license:expat)))

;;; -- gnome-shell-extension-fuzzy-app-search-git (#10282) --

(define-public gnome-shell-extension-fuzzy-app-search-git
  (package
    (name "gnome-shell-extension-fuzzy-app-search-git")
    (version "5.1.0.r3.gb94e37b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Czarlie/gnome-fuzzy-app-search")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/Czarlie/gnome-fuzzy-app-search")
    (synopsis "fuzzy application search results for Gnome Search")
    (description "Fuzzy application search results for Gnome Search.")
    (license license:gpl3+)))

;;; -- gnome-shell-extension-just-perfection-desktop (#7269) --

(define-public gnome-shell-extension-just-perfection-desktop
  (package
    (name "gnome-shell-extension-just-perfection-desktop")
    (version "36")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.gnome.org/jrahmatzadeh/just-perfection")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.gnome.org/jrahmatzadeh/just-perfection")
    (synopsis "just Perfection GNOME Shell Desktop")
    (description "Just Perfection GNOME Shell Desktop.")
    (license license:gpl3)))

;;; -- gnome-shell-extension-mpris-indicator-button-git (#10776) --

(define-public gnome-shell-extension-mpris-indicator-button-git
  (package
    (name "gnome-shell-extension-mpris-indicator-button-git")
    (version "r190.635d608")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/JasonLG1979/gnome-shell-extension-mpris-indicator-button")
    (synopsis "a full featured MPRIS indicator button extension for GNOME Shell 3")
    (description "A full featured MPRIS indicator button extension for GNOME Shell 3.38+.")
    (license license:gpl3+)))

;;; -- gnome-shell-extension-windowisready_remover-git (#10450) --

(define-public gnome-shell-extension-windowisready-remover-git
  (package
    (name "gnome-shell-extension-windowisready_remover-git")
    (version "r35.f8bfd6f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nunofarruca/WindowIsReady_Remover")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nunofarruca/WindowIsReady_Remover")
    (synopsis "GNOME shell extension that removes the annoying "Windows is Ready" notif")
    (description "GNOME shell extension that removes the annoying \"Windows is Ready\" notification.")
    (license license:asl2.0)))

;;; -- go-sendxmpp-git (#7539) --

(define-public go-sendxmpp-git
  (package
    (name "go-sendxmpp-git")
    (version "0.10.0.r12.g95a2f67")
    (source (origin
              (method url-fetch)
              (uri "https://salsa.debian.org/mdosch/go-sendxmpp")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://salsa.debian.org/mdosch/go-sendxmpp")
    (synopsis "a tool to send messages or files to an XMPP contact or MUC")
    (description "A tool to send messages or files to an XMPP contact or MUC.")
    (license license:bsd-2)))

;;; -- go-sqlcmd (#1638) --

(define-public go-sqlcmd
  (package
    (name "go-sqlcmd")
    (version "1.10.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/go-sqlcmd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/microsoft/go-sqlcmd")
    (synopsis "CLI for SQL Server and Azure SQL")
    (description "CLI for SQL Server and Azure SQL.")
    (license license:expat)))

;;; -- gochecker (#3285) --

(define-public gochecker
  (package
    (name "gochecker")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cilginc/gochecker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cilginc/gochecker")
    (synopsis "version checker for software releases written in go")
    (description "Version checker for software releases written in go.")
    (license license:expat)))
