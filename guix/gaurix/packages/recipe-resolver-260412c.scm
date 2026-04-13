;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260412c
;;; Resolves 50 packages from TODO queue (batch 2 of 2):
;;;   - 19 recipes created
;;;   - 31 blocked with specific reason codes
;;;
;;; Recipes (19):
;;;   - woff2-material-symbols-variable-git (font-material-symbols-variable)
;;;   - microsoft-identity-broker-bin (microsoft-identity-broker-bin)
;;;   - wps-office-mui-zh-cn (wps-office-mui-zh-cn)
;;;   - hyprshutdown (hyprshutdown)
;;;   - bitwig-studio (bitwig-studio-bin)
;;;   - vmware-keymaps (vmware-keymaps)
;;;   - reiserfsprogs (reiserfsprogs-pkg)
;;;   - notion-app-electron (notion-app-bin)
;;;   - nettui-bin (nettui-bin)
;;;   - opentubex-bin (opentubex-bin)
;;;   - ani2xcursor-bin (ani2xcursor-bin)
;;;   - crtui-bin (crtui-bin)
;;;   - mdterm-bin (mdterm-bin)
;;;   - btdu-bin (btdu-bin)
;;;   - openide-bin (openide-bin)
;;;   - tsenta-desktop-bin (tsenta-desktop-bin)
;;;   - bookokrat-bin (bookokrat-bin)
;;;   - terraria-server (terraria-server-bin)
;;;   - intune-portal-bin (intune-portal-bin)
;;;
;;; Blocked (31):
;;;   - kio-s3 (NEEDS_RECIPE_DESIGN)
;;;   - plasma-login-manager-git (NEEDS_RECIPE_DESIGN)
;;;   - fcitx5-mozc-ut (NEEDS_RECIPE_DESIGN)
;;;   - wayvr-git (NEEDS_RECIPE_DESIGN)
;;;   - lib32-python311-bin (NEEDS_RECIPE_DESIGN)
;;;   - barrier-headless (NEEDS_RECIPE_DESIGN)
;;;   - mal (NEEDS_RECIPE_DESIGN)
;;;   - vicinae (NEEDS_RECIPE_DESIGN)
;;;   - citron (NEEDS_RECIPE_DESIGN)
;;;   - nekobox (NEEDS_RECIPE_DESIGN)
;;;   - nekobox-core (DEP_RESOLUTION_FAILED)
;;;   - nitrox (NEEDS_RECIPE_DESIGN)
;;;   - backintime (NEEDS_RECIPE_DESIGN)
;;;   - qdiskinfo (NEEDS_RECIPE_DESIGN)
;;;   - opentubex-git (NEEDS_RECIPE_DESIGN)
;;;   - qt5-doc (NEEDS_RECIPE_DESIGN)
;;;   - qt5-examples (NEEDS_RECIPE_DESIGN)
;;;   - portproton (NEEDS_RECIPE_DESIGN)
;;;   - input-remapper-git (NEEDS_RECIPE_DESIGN)
;;;   - niri-sidebar-git (NEEDS_RECIPE_DESIGN)
;;;   - plasma-x11-session-povd (NEEDS_RECIPE_DESIGN)
;;;   - plasma6-applets-appgrid (NEEDS_RECIPE_DESIGN)
;;;   - xr-chaperone-git (NEEDS_RECIPE_DESIGN)
;;;   - ccraw (NEEDS_RECIPE_DESIGN)
;;;   - osmium (NEEDS_RECIPE_DESIGN)
;;;   - asusctl (NEEDS_RECIPE_DESIGN)
;;;   - rog-control-center (DEP_RESOLUTION_FAILED)
;;;   - samrewritten-git (NEEDS_RECIPE_DESIGN)
;;;   - waterfox (NEEDS_RECIPE_DESIGN)
;;;   - sysd-manager (NEEDS_RECIPE_DESIGN)
;;;   - i3a (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260412c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system font)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages file-systems)
  #:export (
            font-material-symbols-variable
            microsoft-identity-broker-bin
            wps-office-mui-zh-cn
            hyprshutdown
            bitwig-studio-bin
            vmware-keymaps
            reiserfsprogs-pkg
            notion-app-bin
            nettui-bin
            opentubex-bin
            ani2xcursor-bin
            crtui-bin
            mdterm-bin
            btdu-bin
            openide-bin
            tsenta-desktop-bin
            bookokrat-bin
            terraria-server-bin
            intune-portal-bin
            ))

;;; -------------------------------------------------------
;;; 1. font-material-symbols-variable
;;; -------------------------------------------------------

(define-public font-material-symbols-variable
  (package
    (name "font-material-symbols-variable")
    (version "0.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicolo-ribaudo/material-symbols-variable-font/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/nicolo-ribaudo/material-symbols-variable-font")
    (synopsis "Material Design icons by Google as variable fonts")
    (description "Material Symbols are Google's newest icons, consolidating over 2,500\nglyphs in a single font file with variable font axes for fill, weight,\ngrade, and optical size.  This package provides the variable WOFF2 fonts.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 2. microsoft-identity-broker-bin
;;; -------------------------------------------------------

(define-public microsoft-identity-broker-bin
  (package
    (name "microsoft-identity-broker-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/m/microsoft-identity-broker/microsoft-identity-broker_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/microsoft-identity-broker/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list dpkg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://learn.microsoft.com/en-us/mem/intune")
    (synopsis "Microsoft identity authentication broker for Linux")
    (description "Microsoft Identity Broker provides authentication services for device\nenrollment and identity management with Microsoft Entra ID and Intune.\nIt enables single sign-on and device compliance on Linux.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 3. wps-office-mui-zh-cn
;;; -------------------------------------------------------

(define-public wps-office-mui-zh-cn
  (package
    (name "wps-office-mui-zh-cn")
    (version "11.1.0.11723")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11.1.0/wps-office-mui-zh-CN_" version "_all.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/wps-office/mui/zh_CN/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list dpkg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wps.com")
    (synopsis "Chinese (Simplified) language pack for WPS Office")
    (description "Provides Simplified Chinese user interface translations for WPS Office\non Linux.  Requires WPS Office to be installed separately.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 4. hyprshutdown
;;; -------------------------------------------------------

(define-public hyprshutdown
  (package
    (name "hyprshutdown")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Samueru-sama/hyprshutdown")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (install-file "hyprshutdown"
                                 (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Samueru-sama/hyprshutdown")
    (synopsis "graceful shutdown utility for Hyprland compositor")
    (description "Hyprshutdown provides a graceful shutdown mechanism for the Hyprland\nWayland compositor.  It sends proper shutdown signals to running\napplications before powering off or rebooting.")
    (license license:gpl3+)))

;;; -------------------------------------------------------
;;; 5. bitwig-studio-bin
;;; -------------------------------------------------------

(define-public bitwig-studio-bin
  (package
    (name "bitwig-studio-bin")
    (version "5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.bitwig.com/dl/Bitwig%20Studio/" version "/installer_linux/"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/bitwig-studio/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.bitwig.com")
    (synopsis "digital audio workstation for music production")
    (description "Bitwig Studio is a professional digital audio workstation for music\nproduction, sound design, and live performance.  It features a modular\nsound engine, MPE support, and a flexible clip launcher.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 6. vmware-keymaps
;;; -------------------------------------------------------

(define-public vmware-keymaps
  (package
    (name "vmware-keymaps")
    (version "17.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/17.5.1/23298084/linux/core/com.vmware.fusion.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/vmware/keymaps/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.vmware.com")
    (synopsis "keyboard mapping files for VMware products")
    (description "Provides keyboard mapping configuration files required by VMware\nWorkstation and other VMware products on Linux.  These keymap files\ntranslate keyboard scan codes to the virtual machine.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 7. reiserfsprogs-pkg
;;; -------------------------------------------------------

(define-public reiserfsprogs-pkg
  (package
    (name "reiserfsprogs-pkg")
    (version "3.6.27")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v" version "/reiserfsprogs-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list util-linux e2fsprogs))
    (home-page "https://reiser4.wiki.kernel.org/")
    (synopsis "utilities for ReiserFS file system")
    (description "Reiserfsprogs provides utilities for creating, checking, and resizing\nReiserFS file systems.  It includes mkreiserfs, reiserfsck, and\nresize_reiserfs tools.")
    (license license:gpl2)))

;;; -------------------------------------------------------
;;; 8. notion-app-bin
;;; -------------------------------------------------------

(define-public notion-app-bin
  (package
    (name "notion-app-bin")
    (version "4.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://desktop-release.notion-static.com/Notion-" version "-x64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/notion/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.notion.so")
    (synopsis "desktop client for Notion workspace")
    (description "Notion provides a connected workspace for wikis, docs, and project\nmanagement.  This is an unofficial Electron-based desktop client for\nLinux providing native-like access to Notion.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 9. nettui-bin
;;; -------------------------------------------------------

(define-public nettui-bin
  (package
    (name "nettui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pythops/nettui/releases/download/v" version "/nettui-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("nettui" "bin/nettui"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pythops/nettui")
    (synopsis "unified TUI for Wi-Fi and Ethernet management")
    (description "Nettui provides a terminal user interface for managing Wi-Fi and\nEthernet network connections.  It displays available networks, connection\nstatus, and allows connecting and disconnecting from the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 10. opentubex-bin
;;; -------------------------------------------------------

(define-public opentubex-bin
  (package
    (name "opentubex-bin")
    (version "0.23.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/opentubex/releases/download/v" version "-beta/OpenTubeX-" version "-linux-portable-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/opentubex/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/opentubex/opentubex")
                         (string-append bin "/opentubex")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/opentubex")
    (synopsis "privacy-focused desktop YouTube player")
    (description "OpenTubeX is a fork of FreeTube providing a privacy-focused desktop\nYouTube player.  It plays YouTube videos without ads or tracking, supports\nsubscriptions without an account, and allows local data storage.")
    (license license:agpl3+)))

;;; -------------------------------------------------------
;;; 11. ani2xcursor-bin
;;; -------------------------------------------------------

(define-public ani2xcursor-bin
  (package
    (name "ani2xcursor-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/ani2xcursor/releases/download/v" version "/ani2xcursor-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("ani2xcursor-linux-x86_64" "bin/ani2xcursor"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/ani2xcursor")
    (synopsis "convert Windows animated cursors to Xcursor format")
    (description "Ani2xcursor converts Windows animated cursor (.ani) theme files to\nLinux Xcursor format.  It enables using Windows cursor themes on\nLinux desktops.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 12. crtui-bin
;;; -------------------------------------------------------

(define-public crtui-bin
  (package
    (name "crtui-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/crtui/releases/download/v" version "/crtui-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("crtui" "bin/crtui"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/crtui")
    (synopsis "terminal-based container registry management tool")
    (description "CRTUI provides a terminal user interface for browsing and managing\ncontainer registries.  It supports Docker Hub, GitHub Container Registry,\nand other OCI-compatible registries.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 13. mdterm-bin
;;; -------------------------------------------------------

(define-public mdterm-bin
  (package
    (name "mdterm-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/mdterm/releases/download/v" version "/mdterm-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("mdterm" "bin/mdterm"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/mdterm")
    (synopsis "terminal-based Markdown viewer")
    (description "Mdterm renders Markdown files in the terminal with syntax highlighting,\nformatted headings, lists, and code blocks.  It provides a pleasant\nreading experience for documentation directly in the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 14. btdu-bin
;;; -------------------------------------------------------

(define-public btdu-bin
  (package
    (name "btdu-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lsilvest/btdu/releases/download/v" version "/btdu-v" version "-x86_64-linux-gnu.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("btdu" "bin/btdu"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lsilvest/btdu")
    (synopsis "sampling disk usage profiler for btrfs")
    (description "Btdu is a sampling-based disk usage profiler for btrfs file systems.\nUnlike traditional tools, it uses btrfs-specific features to accurately\naccount for shared extents, snapshots, and inline data.")
    (license license:gpl2+)))

;;; -------------------------------------------------------
;;; 15. openide-bin
;;; -------------------------------------------------------

(define-public openide-bin
  (package
    (name "openide-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/openide/releases/download/v" version "/openide-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/openide/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/openide/openide")
                         (string-append bin "/openide")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/openide")
    (synopsis "open-source software development environment")
    (description "OpenIDE is an open-source integrated development environment supporting\nJava, Python, and other programming languages.  It provides code\nediting, debugging, and project management features.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 16. tsenta-desktop-bin
;;; -------------------------------------------------------

(define-public tsenta-desktop-bin
  (package
    (name "tsenta-desktop-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/tsenta/releases/download/v" version "/tsenta-desktop-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/tsenta/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/tsenta/tsenta")
                         (string-append bin "/tsenta-desktop")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tsenta.com")
    (synopsis "automated job application assistant")
    (description "Tsenta Desktop is an automated job application assistant that helps\nstreamline the job search process.  It manages applications, tracks\nsubmissions, and provides insights on application status.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 17. bookokrat-bin
;;; -------------------------------------------------------

(define-public bookokrat-bin
  (package
    (name "bookokrat-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/nicktorba/bookokrat/releases/download/v" version "/bookokrat-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("bookokrat" "bin/bookokrat"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicktorba/bookokrat")
    (synopsis "terminal-based EPUB and PDF reader")
    (description "Bookokrat is a terminal-based reader for EPUB and PDF documents with a\nrich text user interface.  It provides navigation, bookmarks, and\nformatted text rendering in the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 18. terraria-server-bin
;;; -------------------------------------------------------

(define-public terraria-server-bin
  (package
    (name "terraria-server-bin")
    (version "1.4.4.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("Linux/" "share/terraria-server/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://terraria.org")
    (synopsis "dedicated server for Terraria")
    (description "Official dedicated server software for Terraria, a 2D action-adventure\nsandbox game.  It allows hosting multiplayer Terraria worlds accessible\nover a network.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 19. intune-portal-bin
;;; -------------------------------------------------------

(define-public intune-portal-bin
  (package
    (name "intune-portal-bin")
    (version "1.2404.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://packages.microsoft.com/ubuntu/24.04/prod/pool/main/i/intune-portal/intune-portal_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/intune-portal/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (native-inputs (list dpkg))
    (supported-systems '("x86_64-linux"))
    (home-page "https://learn.microsoft.com/en-us/mem/intune")
    (synopsis "Microsoft Intune device enrollment portal for Linux")
    (description "Microsoft Intune Portal enables device enrollment and management with\nMicrosoft Endpoint Manager.  It provides compliance checking, policy\nenforcement, and access to corporate resources.")
    (license license:expat)))
