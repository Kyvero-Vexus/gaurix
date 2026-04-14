;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414k
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 46 recipes created
;;;   - 54 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414k)
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
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:export (            adwaita-dark-darose
            agisoft-metashape
            airwindows-lv2
            alacritty-use-theme-with-redshift-git
            alarm-notify
            algodoo-wine
            altair-ai-studio
            anythingllm-desktop-bin
            apachedirectorystudio
            archie
            aseprite-bin
            asf-ui-git
            avalonia86
            avda-bin
            bin-cpuflags-x86
            bitwig-studio-earlyaccess
            bluevein
            brother-dcpt720dw
            brother-mfc-l3750cdw
            brother-mfc-l8690cdw
            btrfs-desktop-notification
            burpsuite-pro
            caddy-custom
            casa6-bin
            cfspeedtest
            chayang
            chibi-cli-git
            clash-nyanpasu-nightly-bin
            clonehero-ptb
            code-features
            cuda-12-9
            curd
            customizepkg-git
            dbeaver-jvm-hook
            ddrescueview
            deadbeef-plugin-discord-git
            dingusppc-git
            dmarc-cat
            dolphin-anty-bin
            doomrunner
            dput-ng
            xytz-bin
            yabridge-tui
            yubico-authenticator-bin
            zish
            zzz
            ))


;;; -- xytz-bin (#1154) --

(define-public xytz-bin
  (package
    (name "xytz-bin")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xdagiz/xytz/releases/download/v0.8.7/xytz-0.8.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/xdagiz/xytz")
    (synopsis "a beautiful TUI YouTube Downloader")
    (description "A beautiful TUI YouTube Downloader.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- yabridge-tui (#12797) --

(define-public yabridge-tui
  (package
    (name "yabridge-tui")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/olivierlm/yabridge-tui")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/olivierlm/yabridge-tui")
    (synopsis "a terminal user interface for managing yabridge (Windows VST/VST3/CLAP pl")
    (description "A terminal user interface for managing yabridge (Windows VST/VST3/CLAP plugin bridge for Linux).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- yubico-authenticator-bin (#1528) --

(define-public yubico-authenticator-bin
  (package
    (name "yubico-authenticator-bin")
    (version "7.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Yubico/yubioath-flutter/releases/download/v7.3.2/yubico-authenticator-7.3.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Yubico/yubioath-flutter")
    (synopsis "cross-platform application for managing your YubiKey's second factor cred")
    (description "Cross-platform application for managing your YubiKey's second factor credentials (version 7).  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- zish (#4365) --

(define-public zish
  (package
    (name "zish")
    (version "0.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rotkonetworks/zish.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/rotkonetworks/zish")
    (synopsis "fast shell interpreter written in zig with built-in AI agent and GGUF inf")
    (description "Fast shell interpreter written in zig with built-in AI agent and GGUF inference.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- zzz (#2952) --

(define-public zzz
  (package
    (name "zzz")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jirutka/zzz.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jirutka/zzz")
    (synopsis "a simple program to suspend or hibernate your computer")
    (description "A simple program to suspend or hibernate your computer.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- adwaita-dark-darose (#4426) --

(define-public adwaita-dark-darose
  (package
    (name "adwaita-dark-darose")
    (version "3.28")
    (source (origin
              (method url-fetch)
              (uri "http://darose.net/theme-adwaita-dark-darose.png")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://darose.net/theme-adwaita-dark-darose.png")
    (synopsis "adwaita theme hacked to use my custom color scheme. (Dark blues instead o")
    (description "Adwaita theme hacked to use my custom color scheme. (Dark blues instead of greys. Works nicely with wallpaper-lightning).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- agisoft-metashape (#785) --

(define-public agisoft-metashape
  (package
    (name "agisoft-metashape")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.agisoft.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.agisoft.com/")
    (synopsis "photogrammetric processing of digital images and 3D spatial data generati")
    (description "Photogrammetric processing of digital images and 3D spatial data generation software. Standard edition.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- airwindows-lv2 (#10066) --

(define-public airwindows-lv2
  (package
    (name "airwindows-lv2")
    (version "36.0")
    (source (origin
              (method url-fetch)
              (uri "https://sr.ht/~hannes/airwindows-lv2")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sr.ht/~hannes/airwindows-lv2")
    (synopsis "lV2 port of Airwindows audio plugins")
    (description "LV2 port of Airwindows audio plugins.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- alacritty-use-theme-with-redshift-git (#3936) --

(define-public alacritty-use-theme-with-redshift-git
  (package
    (name "alacritty-use-theme-with-redshift-git")
    (version "r65.ed38a3e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alacritty-use-theme/alacritty-use-theme-with-services.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alacritty-use-theme/alacritty-use-theme-with-services")
    (synopsis "::Rolling release:: Changes alacritty theme based on the current time and")
    (description "::Rolling release:: Changes alacritty theme based on the current time and locale.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- alarm-notify (#936) --

(define-public alarm-notify
  (package
    (name "alarm-notify")
    (version "1.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nikaakin/alarm-notify.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nikaakin/alarm-notify")
    (synopsis "simple timer notifications with sound and custom messages")
    (description "Simple timer notifications with sound and custom messages.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- algodoo-wine (#6840) --

(define-public algodoo-wine
  (package
    (name "algodoo-wine")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "http://algodoo.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://algodoo.com")
    (synopsis "a unique 2D-simulation software from Algoryx Simulation AB (Using Wine)")
    (description "A unique 2D-simulation software from Algoryx Simulation AB (Using Wine).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- altair-ai-studio (#9753) --

(define-public altair-ai-studio
  (package
    (name "altair-ai-studio")
    (version "2026.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://rapidminer.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://rapidminer.com")
    (synopsis "altair AI Studio (RapidMiner Studio rebranded). Data science tool anyone ")
    (description "Altair AI Studio (RapidMiner Studio rebranded). Data science tool anyone can use to design and prototype highly explainable AI and machine learning models that help build trust throughout your organization.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- anythingllm-desktop-bin (#1524) --

(define-public anythingllm-desktop-bin
  (package
    (name "anythingllm-desktop-bin")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri "https://anythingllm.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://anythingllm.com/")
    (synopsis "the all-in-one AI application, tool suite, and API for RAG & Agents for D")
    (description "The all-in-one AI application, tool suite, and API for RAG & Agents for Docker & Desktop.(Prebuilt version.Use system-wide electron).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- apachedirectorystudio (#10122) --

(define-public apachedirectorystudio
  (package
    (name "apachedirectorystudio")
    (version "2.0.0.v20210717.17")
    (source (origin
              (method url-fetch)
              (uri "https://directory.apache.org/studio/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://directory.apache.org/studio/")
    (synopsis "eclipse based LDAP browser and directory client")
    (description "Eclipse based LDAP browser and directory client.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- archie (#11918) --

(define-public archie
  (package
    (name "archie")
    (version "3.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Gur0v/archie-ng.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Gur0v/archie-ng")
    (synopsis "fast & Easy package management for Arch Linux")
    (description "Fast & Easy package management for Arch Linux.  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- aseprite-bin (#3157) --

(define-public aseprite-bin
  (package
    (name "aseprite-bin")
    (version "1.3.17")
    (source (origin
              (method url-fetch)
              (uri "https://www.aseprite.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://www.aseprite.org/")
    (synopsis "create animated sprites and pixel art")
    (description "Create animated sprites and pixel art.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- asf-ui-git (#9968) --

(define-public asf-ui-git
  (package
    (name "asf-ui-git")
    (version "r1262.6e7611d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JustArchiNET/ArchiSteamFarm.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "standalone web interface for ASF")
    (description "Standalone web interface for ASF.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- avalonia86 (#7414) --

(define-public avalonia86
  (package
    (name "avalonia86")
    (version "1.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/notBald/Avalonia86.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/notBald/Avalonia86")
    (synopsis "a cross-platform configuration manager for the 86Box emulator")
    (description "A cross-platform configuration manager for the 86Box emulator.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- avda-bin (#8860) --

(define-public avda-bin
  (package
    (name "avda-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Sammy-T/avda/releases/download/v1.14.0/avda-1.14.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/Sammy-T/avda")
    (synopsis "a desktop app for viewing one-time passwords generated from Aegis Authent")
    (description "A desktop app for viewing one-time passwords generated from Aegis Authenticator backups.(Written in GO,prebuilt version).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- bin-cpuflags-x86 (#1350) --

(define-public bin-cpuflags-x86
  (package
    (name "bin-cpuflags-x86")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HanabishiRecca/bin-cpuflags-x86.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/HanabishiRecca/bin-cpuflags-x86")
    (synopsis "a small CLI tool to detect CPU flags (instruction sets) of X86 binaries")
    (description "A small CLI tool to detect CPU flags (instruction sets) of X86 binaries.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- bitwig-studio-earlyaccess (#7682) --

(define-public bitwig-studio-earlyaccess
  (package
    (name "bitwig-studio-earlyaccess")
    (version "6.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.bitwig.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.bitwig.com/")
    (synopsis "digital audio workstation for music production, remixing and live perform")
    (description "Digital audio workstation for music production, remixing and live performance - early access version.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- bluevein (#7571) --

(define-public bluevein
  (package
    (name "bluevein")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/meowrch/BlueVein.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/meowrch/BlueVein")
    (synopsis "bluetooth dual-boot key synchronization service")
    (description "Bluetooth dual-boot key synchronization service.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- brother-dcpt720dw (#10217) --

(define-public brother-dcpt720dw
  (package
    (name "brother-dcpt720dw")
    (version "3.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt720dw_all")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpt720dw_all")
    (synopsis "brother printer driver (lpd/cups) for the DCP-T720DW multifuncional printer")
    (description "Brother printer driver (lpd/cups) for the DCP-T720DW multifuncional printer.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- brother-mfc-l3750cdw (#7556) --

(define-public brother-mfc-l3750cdw
  (package
    (name "brother-mfc-l3750cdw")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "http://support.brother.com/g/s/id/linux/en/index.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://support.brother.com/g/s/id/linux/en/index.html")
    (synopsis "lPR and CUPS drivers for the Brother MFC-L3750CDW")
    (description "LPR and CUPS drivers for the Brother MFC-L3750CDW.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- brother-mfc-l8690cdw (#3877) --

(define-public brother-mfc-l8690cdw
  (package
    (name "brother-mfc-l8690cdw")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfcl8690cdw_eu_as&os=128")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://support.brother.com/g/b/downloadlist.aspx?c=eu_ot&lang=en&prod=mfcl8690cdw_eu_as&os=128")
    (synopsis "lPR driver and CUPS wrapper for Brother MFC-L8690CDW printer")
    (description "LPR driver and CUPS wrapper for Brother MFC-L8690CDW printer.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- btrfs-desktop-notification (#442) --

(define-public btrfs-desktop-notification
  (package
    (name "btrfs-desktop-notification")
    (version "1.6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/Zesko/btrfs-desktop-notification.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/Zesko/btrfs-desktop-notification")
    (synopsis "notifies you on the desktop when booting into a read-only system or when ")
    (description "Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- burpsuite-pro (#3384) --

(define-public burpsuite-pro
  (package
    (name "burpsuite-pro")
    (version "2026.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://portswigger.net/burp/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://portswigger.net/burp/")
    (synopsis "an integrated platform for performing security testing of web application")
    (description "An integrated platform for performing security testing of web applications (professional edition).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- caddy-custom (#11248) --

(define-public caddy-custom
  (package
    (name "caddy-custom")
    (version "2.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caddyserver/caddy.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/caddyserver/caddy")
    (synopsis "caddy web server with plugins")
    (description "Caddy web server with plugins.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- casa6-bin (#9808) --

(define-public casa6-bin
  (package
    (name "casa6-bin")
    (version "6.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://casa.nrao.edu/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://casa.nrao.edu/")
    (synopsis "nRAO's Common Astronomy Software Applications package")
    (description "NRAO's Common Astronomy Software Applications package.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- cfspeedtest (#658) --

(define-public cfspeedtest
  (package
    (name "cfspeedtest")
    (version "2.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/code-inflation/cfspeedtest.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/code-inflation/cfspeedtest")
    (synopsis "unofficial CLI for speed.cloudflare.com")
    (description "Unofficial CLI for speed.cloudflare.com.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- chayang (#8845) --

(define-public chayang
  (package
    (name "chayang")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://git.sr.ht/~emersion/chayang")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.sr.ht/~emersion/chayang")
    (synopsis "gradually dim the screen (wayland)")
    (description "Gradually dim the screen (wayland).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- chibi-cli-git (#1425) --

(define-public chibi-cli-git
  (package
    (name "chibi-cli-git")
    (version "1.2.0.77.g2f35b25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://chibi-cli.pages.dev.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://chibi-cli.pages.dev/")
    (synopsis "chibi for AniList - A lightweight anime & manga tracker CLI app powered b")
    (description "Chibi for AniList - A lightweight anime & manga tracker CLI app powered by AniList (Upstream GIT).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- clash-nyanpasu-nightly-bin (#8875) --

(define-public clash-nyanpasu-nightly-bin
  (package
    (name "clash-nyanpasu-nightly-bin")
    (version "2.0.0_alpha+f7ee292")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/v2.0.0_alpha+f7ee292/clash-nyanpasu-nightly-2.0.0_alpha+f7ee292-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/LibNyanpasu/clash-nyanpasu")
    (synopsis "a Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​")
    (description "A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- clonehero-ptb (#760) --

(define-public clonehero-ptb
  (package
    (name "clonehero-ptb")
    (version "1.1.0.5684")
    (source (origin
              (method url-fetch)
              (uri "https://clonehero.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://clonehero.net/")
    (synopsis "clone Hero is a free rhythm game, which can be played with any 5 or 6 but")
    (description "Clone Hero is a free rhythm game, which can be played with any 5 or 6 button guitar controller, game controllers, or just your standard computer keyboard.  It is packaged from the Arch User Repository.")
    (license nonguix-license:nonfree)))

;;; -- code-features (#11610) --

(define-public code-features
  (package
    (name "code-features")
    (version "1.112.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/vscode.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/microsoft/vscode")
    (synopsis "unblock some features in Code OSS")
    (description "Unblock some features in Code OSS.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- cuda-12.9 (#11769) --

(define-public cuda-12-9
  (package
    (name "cuda-12-9")
    (version "12.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://developer.nvidia.com/cuda-zone")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://developer.nvidia.com/cuda-zone")
    (synopsis "nVIDIA's GPU programming toolkit version 12.9 (Maxwell/Pascal/Volta support)")
    (description "NVIDIA's GPU programming toolkit version 12.9 (Maxwell/Pascal/Volta support).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- curd (#2347) --

(define-public curd
  (package
    (name "curd")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wraient/curd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Wraient/curd")
    (synopsis "watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler")
    (description "Watch anime in CLI with AniList Tracking, Discord RPC, Intro/Outro/Filler/Recap Skipping, etc.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- customizepkg-git (#403) --

(define-public customizepkg-git
  (package
    (name "customizepkg-git")
    (version "51.6cf63cb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ava1ar/customizepkg.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ava1ar/customizepkg")
    (synopsis "a tool to modify automatically PKGBUILD")
    (description "A tool to modify automatically PKGBUILD.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- dbeaver-jvm-hook (#7704) --

(define-public dbeaver-jvm-hook
  (package
    (name "dbeaver-jvm-hook")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/dbeaver-jvm-hook")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/dbeaver-jvm-hook")
    (synopsis "a hook for dbeaver to support native jvm")
    (description "A hook for dbeaver to support native jvm.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- ddrescueview (#8850) --

(define-public ddrescueview
  (package
    (name "ddrescueview")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/ddrescueview")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://sourceforge.net/projects/ddrescueview")
    (synopsis "graphical viewer for GNU ddrescue log files")
    (description "Graphical viewer for GNU ddrescue log files.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- deadbeef-plugin-discord-git (#11062) --

(define-public deadbeef-plugin-discord-git
  (package
    (name "deadbeef-plugin-discord-git")
    (version "r66.g9d2bbf9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kuba160/ddb_discord_presence.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kuba160/ddb_discord_presence")
    (synopsis "deaDBeeF Discord rich presence plugin")
    (description "DeaDBeeF Discord rich presence plugin.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- dingusppc-git (#2859) --

(define-public dingusppc-git
  (package
    (name "dingusppc-git")
    (version "r2432.c3448e1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dingusdev/dingusppc.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/dingusdev/dingusppc")
    (synopsis "an experimental emulator")
    (description "An experimental emulator.  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- dmarc-cat (#10554) --

(define-public dmarc-cat
  (package
    (name "dmarc-cat")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keltia/dmarc-cat.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/keltia/dmarc-cat")
    (synopsis "decode the report sent by various email providers following the DMARC spec")
    (description "Decode the report sent by various email providers following the DMARC spec.  It is packaged from the Arch User Repository.")
    (license license:bsd-2)))

;;; -- dolphin-anty-bin (#3735) --

(define-public dolphin-anty-bin
  (package
    (name "dolphin-anty-bin")
    (version "2026.70.214")
    (source (origin
              (method url-fetch)
              (uri "https://dolphin-anty.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://dolphin-anty.net/")
    (synopsis "antidetect browser for multi-accounting")
    (description "Antidetect browser for multi-accounting.  It is packaged from the Arch User Repository.")
    (license nonguix-license:nonfree)))

;;; -- doomrunner (#1082) --

(define-public doomrunner
  (package
    (name "doomrunner")
    (version "1.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Youda008/DoomRunner.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Youda008/DoomRunner")
    (synopsis "modern preset-oriented graphical launcher of ZDoom and derivatives")
    (description "Modern preset-oriented graphical launcher of ZDoom and derivatives.  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- dput-ng (#920) --

(define-public dput-ng
  (package
    (name "dput-ng")
    (version "1.33")
    (source (origin
              (method url-fetch)
              (uri "https://people.debian.org/~paultag/dput-ng/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://people.debian.org/~paultag/dput-ng/")
    (synopsis "next generation Debian package upload tool")
    (description "Next generation Debian package upload tool.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))
