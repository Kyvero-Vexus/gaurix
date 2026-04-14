;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414o
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 48 recipes created
;;;   - 52 blocked with reason codes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414o)
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
  #:export (            aacskeys
            audium
            bluraybackup
            bulk-rename-plus
            conspy
            crocotile3d
            ffbtools-git
            freecell
            grx-bin
            gvst-vst-bin
            hardcode-fixer-git
            hexo-cli
            jit-cli
            kdenlive-appimage-pure
            mpv-manager
            mpv-manager-git
            ninjabrain-bot
            nono-ai
            openvpn-update-resolv-conf-git
            owlry-core
            pat-aur-client-git
            pidcat-python3-git
            powerline-fonts-git
            profile-sync-daemon-zotero
            protonfixes
            pvpn-go
            realitlscanner
            seafile
            sklauncher-bin
            sle-suite-pro-git
            smartdeblur-git
            smtk-obs-git
            snap-sync
            spacebar-client-git
            sqm-scripts
            stable-diffusion-webui-git
            starc-appimage
            starsector-mod-manager-rust
            steamdepotdownloadergui-bin
            sticks-aur
            strace-tui
            structurizr
            swagsh
            temp-throttle
            tokount
            voiden-beta-appimage
            wl-vapi-gen
            yamlresume
            ))


;;; -- pat-aur-client-git (#13378) --

(define-public pat-aur-client-git
  (package
    (name "pat-aur-client-git")
    (version "r542.9b72a20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/patlefort/pat-aur.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/patlefort/pat-aur")
    (synopsis "aUR helper and tool to build Arch Linux packages in clean containers. (cl")
    (description "AUR helper and tool to build Arch Linux packages in clean containers. (client only).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- wl-vapi-gen (#13410) --

(define-public wl-vapi-gen
  (package
    (name "wl-vapi-gen")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/kotontrion/wl-vapi-gen")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/kotontrion/wl-vapi-gen")
    (synopsis "generate vala bindings for wayland protocols")
    (description "Generate vala bindings for wayland protocols.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- owlry-core (#13450) --

(define-public owlry-core
  (package
    (name "owlry-core")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://somegit.dev/Owlibou/owlry")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://somegit.dev/Owlibou/owlry")
    (synopsis "core daemon for the Owlry application launcher — manages plugins, provide")
    (description "Core daemon for the Owlry application launcher — manages plugins, providers, and search.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- seafile (#13382) --

(define-public seafile
  (package
    (name "seafile")
    (version "9.0.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haiwen/seafile.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/haiwen/seafile")
    (synopsis "an online file storage and collaboration tool")
    (description "An online file storage and collaboration tool.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- crocotile3d (#13372) --

(define-public crocotile3d
  (package
    (name "crocotile3d")
    (version "2.6.8")
    (source (origin
              (method url-fetch)
              (uri "https://www.crocotile3d.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.crocotile3d.com/")
    (synopsis "tile-based 3D modeling application")
    (description "Tile-based 3D modeling application.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- swagsh (#13423) --

(define-public swagsh
  (package
    (name "swagsh")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/takashialpha/swagsh.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/takashialpha/swagsh")
    (synopsis "a really small shell that aims to be fast and posix-compatible")
    (description "A really small shell that aims to be fast and posix-compatible.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- voiden-beta-appimage (#13415) --

(define-public voiden-beta-appimage
  (package
    (name "voiden-beta-appimage")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://voiden.md")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://voiden.md")
    (synopsis "voiden Beta API Client")
    (description "Voiden Beta API Client.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- conspy (#13386) --

(define-public conspy
  (package
    (name "conspy")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri "https://conspy.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://conspy.sourceforge.net/")
    (synopsis "remote control of Linux virtual consoles")
    (description "Remote control of Linux virtual consoles.  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- freecell (#13385) --

(define-public freecell
  (package
    (name "freecell")
    (version "1.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ostrosablin/freecell.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ostrosablin/freecell")
    (synopsis "a console (ncurses) version of the popular solitaire game Freecell")
    (description "A console (ncurses) version of the popular solitaire game Freecell.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- grx-bin (#13481) --

(define-public grx-bin
  (package
    (name "grx-bin")
    (version "4.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://grx.electronicloud.app/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://grx.electronicloud.app/")
    (synopsis "fastest Web Gerber Renderer.(Prebuilt version.Use system-wide electron)")
    (description "Fastest Web Gerber Renderer.(Prebuilt version.Use system-wide electron).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- hardcode-fixer-git (#13384) --

(define-public hardcode-fixer-git
  (package
    (name "hardcode-fixer-git")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Foggalong/hardcode-fixer.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Foggalong/hardcode-fixer")
    (synopsis "fixes Hardcoded Icons")
    (description "Fixes Hardcoded Icons.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- kdenlive-appimage-pure (#13474) --

(define-public kdenlive-appimage-pure
  (package
    (name "kdenlive-appimage-pure")
    (version "25.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.kdenlive.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.kdenlive.org")
    (synopsis "a non-linear video editor for Linux using the MLT video framework (AppIma")
    (description "A non-linear video editor for Linux using the MLT video framework (AppImage build).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- mpv-manager (#13459) --

(define-public mpv-manager
  (package
    (name "mpv-manager")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://gitgud.io/mike/mpv-manager")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitgud.io/mike/mpv-manager")
    (synopsis "mPV media player installer and manager with Web UI, TUI, and CLI modes")
    (description "MPV media player installer and manager with Web UI, TUI, and CLI modes.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- ninjabrain-bot (#13453) --

(define-public ninjabrain-bot
  (package
    (name "ninjabrain-bot")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ninjabrain1/Ninjabrain-Bot.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Ninjabrain1/Ninjabrain-Bot")
    (synopsis "stronghold calculator for Minecraft Speedrunning")
    (description "Stronghold calculator for Minecraft Speedrunning.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- profile-sync-daemon-zotero (#13440) --

(define-public profile-sync-daemon-zotero
  (package
    (name "profile-sync-daemon-zotero")
    (version "2023.08.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/graysky2/profile-sync-daemon.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/graysky2/profile-sync-daemon/blob/master/common/browsers/firefox")
    (synopsis "zotero support for profile-sync-daemon")
    (description "Zotero support for profile-sync-daemon.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- protonfixes (#13398) --

(define-public protonfixes
  (package
    (name "protonfixes")
    (version "1.0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simons-public/protonfixes.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/simons-public/protonfixes")
    (synopsis "a module for applying fixes at runtime to unsupported games with Steam Pr")
    (description "A module for applying fixes at runtime to unsupported games with Steam Proton without changing game installation files.  It is packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; -- temp-throttle (#13390) --

(define-public temp-throttle
  (package
    (name "temp-throttle")
    (version "3.02")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Sepero/temp-throttle.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Sepero/temp-throttle")
    (synopsis "a shell script for throttling system CPU frequency based on a desired max")
    (description "A shell script for throttling system CPU frequency based on a desired maximum temperature.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- audium (#13504) --

(define-public audium
  (package
    (name "audium")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/takashialpha/audium.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/takashialpha/audium")
    (synopsis "terminal music app built in Rust")
    (description "Terminal music app built in Rust.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- bulk-rename-plus (#13374) --

(define-public bulk-rename-plus
  (package
    (name "bulk-rename-plus")
    (version "2.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/siyia2/bulk-rename-plus.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/siyia2/bulk-rename-plus")
    (synopsis "tiny yet Powerful Non-Interactive Bulk Renamer, written in C++")
    (description "Tiny yet Powerful Non-Interactive Bulk Renamer, written in C++.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- ffbtools-git (#13394) --

(define-public ffbtools-git
  (package
    (name "ffbtools-git")
    (version "r63.414c38a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/berarma/ffbtools.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/berarma/ffbtools")
    (synopsis "set of tools for FFB testing and debugging on GNU/Linux")
    (description "Set of tools for FFB testing and debugging on GNU/Linux.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- gvst-vst-bin (#13480) --

(define-public gvst-vst-bin
  (package
    (name "gvst-vst-bin")
    (version "20240925")
    (source (origin
              (method url-fetch)
              (uri "https://gvst.uk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://gvst.uk")
    (synopsis "gVST Plugin Suite")
    (description "GVST Plugin Suite.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- hexo-cli (#13387) --

(define-public hexo-cli
  (package
    (name "hexo-cli")
    (version "4.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.npmjs.com/package/hexo-cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.npmjs.com/package/hexo-cli")
    (synopsis "command line interface for Hexo")
    (description "Command line interface for Hexo.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- mpv-manager-git (#13457) --

(define-public mpv-manager-git
  (package
    (name "mpv-manager-git")
    (version "1.2.0.r0.g2e76e96")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitgud.io/mike/mpv-manager.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitgud.io/mike/mpv-manager")
    (synopsis "mPV media player installer and manager with Web UI, TUI, and CLI modes (git)")
    (description "MPV media player installer and manager with Web UI, TUI, and CLI modes (git).  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- pidcat-python3-git (#13443) --

(define-public pidcat-python3-git
  (package
    (name "pidcat-python3-git")
    (version "2.1.0.r16.61cd1ee")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JakeWharton/pidcat.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/JakeWharton/pidcat")
    (synopsis "pidcat is a colored logcat script with improved readability that only sho")
    (description "Pidcat is a colored logcat script with improved readability that only shows log entries for a specific Android package.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- realitlscanner (#13397) --

(define-public realitlscanner
  (package
    (name "realitlscanner")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/XTLS/RealiTLScanner.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/XTLS/RealiTLScanner")
    (synopsis "a TLS server scanner for Reality")
    (description "A TLS server scanner for Reality.  It is packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; -- tokount (#13420) --

(define-public tokount
  (package
    (name "tokount")
    (version "2.1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/velox-sh/tokount.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/velox-sh/tokount")
    (synopsis "the fastest line counter for codebases")
    (description "The fastest line counter for codebases.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- yamlresume (#13406) --

(define-public yamlresume
  (package
    (name "yamlresume")
    (version "0.12.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yamlresume/yamlresume.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/yamlresume/yamlresume")
    (synopsis "resumes as code in YAML")
    (description "Resumes as code in YAML.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- aacskeys (#13395) --

(define-public aacskeys
  (package
    (name "aacskeys")
    (version "0.4.0f")
    (source (origin
              (method url-fetch)
              (uri "http://cyberside.net.ee/ripping/BD_DeviceKeys")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://cyberside.net.ee/ripping/BD_DeviceKeys")
    (synopsis "a library and program to retrieve decryption keys for HD discs")
    (description "A library and program to retrieve decryption keys for HD discs.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- bluraybackup (#13498) --

(define-public bluraybackup
  (package
    (name "bluraybackup")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://git.golem.linux.it/matteobin/bluraybackup")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://git.golem.linux.it/matteobin/bluraybackup")
    (synopsis "command line program to backup Blu-ray Disc Movies (BDMV), inspired by dv")
    (description "Command line program to backup Blu-ray Disc Movies (BDMV), inspired by dvdbackup.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- jit-cli (#13475) --

(define-public jit-cli
  (package
    (name "jit-cli")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cesarferreira/jit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cesarferreira/jit")
    (synopsis "a CLI for fetching JIRA issue summaries, details, and current sprint tickets")
    (description "A CLI for fetching JIRA issue summaries, details, and current sprint tickets.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- nono-ai (#13451) --

(define-public nono-ai
  (package
    (name "nono-ai")
    (version "0.33.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/always-further/nono.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/always-further/nono")
    (synopsis "secure, kernel-enforced sandbox for AI agents, MCP servers and LLM worklo")
    (description "Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- openvpn-update-resolv-conf-git (#13371) --

(define-public openvpn-update-resolv-conf-git
  (package
    (name "openvpn-update-resolv-conf-git")
    (version "r46.2485e9d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alfredopalhares/openvpn-update-resolv-conf.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/alfredopalhares/openvpn-update-resolv-conf")
    (synopsis "OpenVPN Update resolvconf")
    (description "OpenVPN Update resolvconf.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- powerline-fonts-git (#13381) --

(define-public powerline-fonts-git
  (package
    (name "powerline-fonts-git")
    (version "r202.e80e3eb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/powerline/fonts.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/powerline/fonts")
    (synopsis "patched fonts for Powerline users")
    (description "Patched fonts for Powerline users.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- pvpn-go (#13437) --

(define-public pvpn-go
  (package
    (name "pvpn-go")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YourDoritos/pVPN.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/YourDoritos/pVPN")
    (synopsis "proton VPN client with TUI for Linux (WireGuard + Stealth)")
    (description "Proton VPN client with TUI for Linux (WireGuard + Stealth).  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- sklauncher-bin (#3162) --

(define-public sklauncher-bin
  (package
    (name "sklauncher-bin")
    (version "3.2.18")
    (source (origin
              (method url-fetch)
              (uri "https://skmedix.pl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://skmedix.pl")
    (synopsis "secure and modern Minecraft Launcher")
    (description "Secure and modern Minecraft Launcher.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- sle-suite-pro-git (#7198) --

(define-public sle-suite-pro-git
  (package
    (name "sle-suite-pro-git")
    (version "0.0.3.r4.ge55939a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wikilift/sle-suite-pro.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wikilift/sle-suite-pro")
    (synopsis "advanced tool for SLE cards")
    (description "Advanced tool for SLE cards.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- smartdeblur-git (#25174) --

(define-public smartdeblur-git
  (package
    (name "smartdeblur-git")
    (version "20130530.24f4ab5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://yuzhikov.com/articles/BlurredImagesRestoration1.htm.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://yuzhikov.com/articles/BlurredImagesRestoration1.htm")
    (synopsis "a smart deblur program made by Y. Vladimir")
    (description "A smart deblur program made by Y. Vladimir.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- smtk-obs-git (#3296) --

(define-public smtk-obs-git
  (package
    (name "smtk-obs-git")
    (version "r4.5b25d2e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/denizkose/smtk-obs.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/denizkose/smtk-obs")
    (synopsis "a lightweight OBS Browser Source overlay for showmethekey using Bun and W")
    (description "A lightweight OBS Browser Source overlay for showmethekey using Bun and WebSockets.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- snap-sync (#8945) --

(define-public snap-sync
  (package
    (name "snap-sync")
    (version "0.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wesbarnett/snap-sync.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/wesbarnett/snap-sync")
    (synopsis "use snapper snapshots to backup to external drive")
    (description "Use snapper snapshots to backup to external drive.  It is packaged from the Arch User Repository.")
    (license license:gpl2)))

;;; -- spacebar-client-git (#3719) --

(define-public spacebar-client-git
  (package
    (name "spacebar-client-git")
    (version "r415.79345f7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spacebarchat/client.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/spacebarchat/client")
    (synopsis "open source, themeable and extendable discord-compatible native Spacebar ")
    (description "Open source, themeable and extendable discord-compatible native Spacebar client.  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- sqm-scripts (#1115) --

(define-public sqm-scripts
  (package
    (name "sqm-scripts")
    (version "1.7.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tohojo/sqm-scripts.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/tohojo/sqm-scripts")
    (synopsis "sQM scripts traffic shaper")
    (description "SQM scripts traffic shaper.  It is packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; -- stable-diffusion-webui-git (#11157) --

(define-public stable-diffusion-webui-git
  (package
    (name "stable-diffusion-webui-git")
    (version "1.9.4.r0.gfeee37d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AUTOMATIC1111/stable-diffusion-webui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/AUTOMATIC1111/stable-diffusion-webui")
    (synopsis "stable Diffusion Web UI (AUTOMATIC1111)")
    (description "Stable Diffusion Web UI (AUTOMATIC1111).  It is packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; -- starc-appimage (#1358) --

(define-public starc-appimage
  (package
    (name "starc-appimage")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://starc.app/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://starc.app/")
    (synopsis "intuitive writing app with smart features and a streamlined process for f")
    (description "Intuitive writing app with smart features and a streamlined process for film, TV, radio, stage and more.  It is packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; -- starsector-mod-manager-rust (#823) --

(define-public starsector-mod-manager-rust
  (package
    (name "starsector-mod-manager-rust")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://atlanticaccent.github.io/starsector-mod-manager-rust/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://atlanticaccent.github.io/starsector-mod-manager-rust/")
    (synopsis "a mod manager for the game Starsector")
    (description "A mod manager for the game Starsector.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- steamdepotdownloadergui-bin (#7336) --

(define-public steamdepotdownloadergui-bin
  (package
    (name "steamdepotdownloadergui-bin")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mmvanheusden/SteamDepotDownloaderGUI/releases/download/v3.2.0/steamdepotdownloadergui-3.2.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
                     #~'((".", "share/" #:include-regexp (".*")))))
    (home-page "https://github.com/mmvanheusden/SteamDepotDownloaderGUI")
    (synopsis "🎮⌛Downgrade Steam games to older versions with ease using DepotDownloader")
    (description "🎮⌛Downgrade Steam games to older versions with ease using DepotDownloader.(Prebuilt version).  It is packaged from the Arch User Repository.")
    (license license:gpl3)))

;;; -- sticks-aur (#7189) --

(define-public sticks-aur
  (package
    (name "sticks-aur")
    (version "0.3.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mAmineChniti/sticks.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mAmineChniti/sticks")
    (synopsis "a tool for managing C and C++ projects")
    (description "A tool for managing C and C++ projects.  It is packaged from the Arch User Repository.")
    (license license:expat)))

;;; -- strace-tui (#820) --

(define-public strace-tui
  (package
    (name "strace-tui")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Rodrigodd/strace-tui.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Rodrigodd/strace-tui")
    (synopsis "a terminal user interface (TUI) for visualizing and exploring strace output")
    (description "A terminal user interface (TUI) for visualizing and exploring strace output.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; -- structurizr (#819) --

(define-public structurizr
  (package
    (name "structurizr")
    (version "2026.03.06")
    (source (origin
              (method url-fetch)
              (uri "https://structurizr.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://structurizr.com/")
    (synopsis "software architecture models as code")
    (description "Software architecture models as code.  It is packaged from the Arch User Repository.")
    (license license:asl2.0)))
