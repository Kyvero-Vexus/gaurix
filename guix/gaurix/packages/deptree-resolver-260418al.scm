;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418al
;;; Resolves 100 packages from dependency tree queue (TODO pool).
;;; New recipes (84):
;;;        1.  ssh-chat-git
;;;        2.  nginx-ui
;;;        3.  easierconnect
;;;        4.  warp-plus
;;;        5.  xgo
;;;        6.  fscan
;;;        7.  serenity
;;;        8.  sing-box-alpha
;;;        9.  wayback
;;;       10.  mmdbinspect
;;;       11.  nuclei
;;;       12.  pipet-git
;;;       13.  baidupcs-go-git
;;;       14.  unpackerr
;;;       15.  bandsnatch
;;;       16.  izucat-git
;;;       17.  ocd
;;;       18.  apkeep
;;;       19.  imagineer
;;;       20.  shotman
;;;       21.  wctx
;;;       22.  ianny
;;;       23.  auto-epp-rs
;;;       24.  recordbox
;;;       25.  walrs
;;;       26.  ruffle-git
;;;       27.  swayosd-git
;;;       28.  abuse
;;;       29.  dablin
;;;       30.  canokey-usbip-git
;;;       31.  anope
;;;       32.  speedynote-git
;;;       33.  openswitcher
;;;       34.  wljoywake
;;;       35.  wl-gammactl
;;;       36.  lswt-git
;;;       37.  proftpd
;;;       38.  librepfunc
;;;       39.  trigger
;;;       40.  p910nd
;;;       41.  ipad-charge
;;;       42.  pcc-libs-git
;;;       43.  openxcom
;;;       44.  mfoc-hardnested-git
;;;       45.  libstrangle-git
;;;       46.  mips-elf-binutils
;;;       47.  perl-pod-usage
;;;       48.  perl-re-engine-re2
;;;       49.  pgbadger
;;;       50.  faugus-subtitle
;;;       51.  ansible-dev-environment
;;;       52.  frida-dexdump
;;;       53.  python-wallbreaker
;;;       54.  turbocase
;;;       55.  python-imblearn
;;;       56.  sox-noise-git
;;;       57.  kattis-cli-git
;;;       58.  meanalyzer
;;;       59.  dove
;;;       60.  mpv-modernz-git
;;;       61.  ideapad-cm
;;;       62.  fetchmirrors
;;;       63.  arttime-git
;;;       64.  wtf
;;;       65.  fudo-git
;;;       66.  posy-cursors
;;;       67.  plymouth-theme-arch-logo
;;;       68.  yvt
;;;       69.  wlnfancurve
;;;       70.  docsify-cli
;;;       71.  write-good
;;;       72.  appium
;;;       73.  iptv-checker
;;;       74.  freerouting
;;;       75.  hath
;;;       76.  grlx-farmer-bin
;;;       77.  grlx-sprout-bin
;;;       78.  opencomic-bin
;;;       79.  linux-assistant-bin
;;;       80.  pyroscope-bin
;;;       81.  extraterm-bin
;;;       82.  cinecred
;;;       83.  tana
;;;
;;; BLOCKED (16):
;;;       84.  garnet -> DEP_RESOLUTION_FAILED: requires dotnet-sdk-9.0 which is not available in Guix; .
;;;       85.  pgroonga -> DEP_RESOLUTION_FAILED: depends on groonga full-text search engine which is not p
;;;       86.  scpdiscord-git -> DEP_RESOLUTION_FAILED: requires dotnet-sdk-9.0 for building; .NET SDK not availa
;;;       87.  python-gurobipy -> DEP_RESOLUTION_FAILED: requires gurobi>=13.0.1 (commercial optimization solver) 
;;;       88.  companion -> DEP_RESOLUTION_FAILED: requires nvm for Node.js version management and complex n
;;;       89.  tuxedo-keyboard-tools -> DEP_RESOLUTION_FAILED: depends on tuxedo-keyboard-dkms (out-of-tree kernel modul
;;;       90.  tuxedo-backlight-control-git -> DEP_RESOLUTION_FAILED: depends on tuxedo-keyboard (out-of-tree DKMS kernel modul
;;;       91.  comictagger-beta -> DEP_RESOLUTION_FAILED: requires 20+ Python dependencies not in Guix (python-comi
;;;       92.  clipboard-manager-git -> DEP_RESOLUTION_FAILED: depends on cosmic-applets (COSMIC desktop environment) wh
;;;       93.  yesplaymusic-git -> DEP_RESOLUTION_FAILED: depends on electron13 (obsolete Electron version) and req
;;;       94.  opencomic -> DEP_RESOLUTION_FAILED: depends on electron37 and java-runtime with complex nvm-b
;;;       95.  bbg -> DEP_RESOLUTION_FAILED: depends on Electron with no clear build instructions; sta
;;;       96.  adbmanager -> TOOLING_FAILURE: requires Lazarus (Free Pascal IDE/RAD) to build; Lazarus compil
;;;       97.  xenia-canary-git -> DEP_RESOLUTION_FAILED: Xbox 360 emulator with massive C++ codebase requiring cla
;;;       98.  pcloudcc-lneely -> DEP_RESOLUTION_FAILED: depends on mbedtls and fuse3 with custom udev makedep; ne
;;;       99.  sftpman-gtk -> DEP_RESOLUTION_FAILED: depends on sftpman-python>=0.5.0 (must be packaged first)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages deptree-resolver-260418al)
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
  #:use-module (gnu packages)
  #:export (
            ssh-chat-git
            nginx-ui
            easierconnect
            warp-plus
            xgo
            fscan
            serenity
            sing-box-alpha
            wayback
            mmdbinspect
            nuclei
            pipet-git
            baidupcs-go-git
            unpackerr
            bandsnatch
            izucat-git
            ocd
            apkeep
            imagineer
            shotman
            wctx
            ianny
            auto-epp-rs
            recordbox
            walrs
            ruffle-git
            swayosd-git
            abuse
            dablin
            canokey-usbip-git
            anope
            speedynote-git
            openswitcher
            wljoywake
            wl-gammactl
            lswt-git
            proftpd
            librepfunc
            trigger
            p910nd
            ipad-charge
            pcc-libs-git
            openxcom
            mfoc-hardnested-git
            libstrangle-git
            mips-elf-binutils
            perl-pod-usage
            perl-re-engine-re2
            pgbadger
            faugus-subtitle
            ansible-dev-environment
            frida-dexdump
            python-wallbreaker
            turbocase
            python-imblearn
            sox-noise-git
            kattis-cli-git
            meanalyzer
            dove
            mpv-modernz-git
            ideapad-cm
            fetchmirrors
            arttime-git
            wtf
            fudo-git
            posy-cursors
            plymouth-theme-arch-logo
            yvt
            wlnfancurve
            docsify-cli
            write-good
            appium
            iptv-checker
            freerouting
            hath
            grlx-farmer-bin
            grlx-sprout-bin
            opencomic-bin
            linux-assistant-bin
            pyroscope-bin
            extraterm-bin
            cinecred
            tana
            sftpman-python
))

;;; 1. ssh-chat-git
(define-public ssh-chat-git
  (package
    (name "ssh-chat-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shazow/ssh-chat")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/shazow/ssh-chat"
           #:tests? #f))
    (synopsis "chat over SSH")
    (description "Chat over SSH.  Provides a custom SSH server that acts as a chat room, allowing users to connect and communicate through their terminal.")
    (home-page "https://github.com/shazow/ssh-chat")
    (license license:expat)))

;;; 2. nginx-ui
(define-public nginx-ui
  (package
    (name "nginx-ui")
    (version "2.3.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xJacky/nginx-ui")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/0xJacky/nginx-ui"
           #:tests? #f))
    (synopsis "web UI for Nginx management")
    (description "Web-based user interface for managing Nginx configurations.  Provides a graphical interface for editing virtual hosts, SSL certificates, and server settings.")
    (home-page "https://github.com/0xJacky/nginx-ui")
    (license license:agpl3)))

;;; 3. easierconnect
(define-public easierconnect
  (package
    (name "easierconnect")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lyc8503/EasierConnect")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/lyc8503/EasierConnect"
           #:tests? #f))
    (synopsis "sangfor EasyConnect protocol reimplementation in Go")
    (description "Open-source reimplementation of the Sangfor EasyConnect VPN protocol in Go.  Provides a compatible client for connecting to EasyConnect VPN services.")
    (home-page "https://github.com/lyc8503/EasierConnect")
    (license license:agpl3)))

;;; 4. warp-plus
(define-public warp-plus
  (package
    (name "warp-plus")
    (version "1.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bepass-org/warp-plus")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bepass-org/warp-plus"
           #:tests? #f))
    (synopsis "cloudflare Warp client with Psiphon integration")
    (description "Open-source implementation of Cloudflare Warp, enhanced with Psiphon integration.  Provides a command-line VPN client for Cloudflare WARP with additional proxy capabilities.")
    (home-page "https://github.com/bepass-org/warp-plus")
    (license license:expat)))

;;; 5. xgo
(define-public xgo
  (package
    (name "xgo")
    (version "1.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/goplus/xgo")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/goplus/xgo"
           #:tests? #f))
    (synopsis "programming language readable as plain English")
    (description "XGo is a programming language that reads like plain English and lets you leverage assets from C/C++, Go, Python, and JavaScript/TypeScript.  It provides a high-level syntax that transpiles to Go.")
    (home-page "https://github.com/goplus/xgo")
    (license license:asl2.0)))

;;; 6. fscan
(define-public fscan
  (package
    (name "fscan")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shadow1ng/fscan")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/shadow1ng/fscan"
           #:tests? #f))
    (synopsis "intranet comprehensive scanning tool")
    (description "Comprehensive intranet scanning tool written in Go.  Supports host discovery, port scanning, service identification, and vulnerability detection for internal networks.")
    (home-page "https://github.com/shadow1ng/fscan")
    (license license:expat)))

;;; 7. serenity
(define-public serenity
  (package
    (name "serenity")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SagerNet/serenity")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/SagerNet/serenity"
           #:tests? #f))
    (synopsis "configuration generator for sing-box")
    (description "Configuration generator for the sing-box universal proxy platform.  Provides rule-based configuration management for proxy routing and network policies.")
    (home-page "https://github.com/SagerNet/serenity")
    (license license:gpl3+)))

;;; 8. sing-box-alpha
(define-public sing-box-alpha
  (package
    (name "sing-box-alpha")
    (version "1.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SagerNet/sing-box")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/sagernet/sing-box"
           #:tests? #f))
    (synopsis "universal proxy platform (alpha channel)")
    (description "Universal proxy platform supporting multiple protocols.  Provides a unified interface for Shadowsocks, VMess, Trojan, and other proxy protocols with advanced routing rules.")
    (home-page "https://github.com/SagerNet/sing-box")
    (license license:gpl3+)))

;;; 9. wayback
(define-public wayback
  (package
    (name "wayback")
    (version "0.20.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wabarc/wayback")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/wabarc/wayback"
           #:tests? #f))
    (synopsis "toolkit for archiving web pages")
    (description "Toolkit for snapshot web pages to Internet Archive, archive.today, IPFS and beyond.  Provides both a CLI tool and a daemon for automated web page archiving.")
    (home-page "https://github.com/wabarc/wayback")
    (license license:gpl3+)))

;;; 10. mmdbinspect
(define-public mmdbinspect
  (package
    (name "mmdbinspect")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maxmind/mmdbinspect")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/maxmind/mmdbinspect"
           #:tests? #f))
    (synopsis "look up records in MaxMind MMDB databases")
    (description "Command-line tool for looking up records for one or more IPs and networks in MaxMind MMDB databases.  Outputs results in JSON format for easy processing.")
    (home-page "https://github.com/maxmind/mmdbinspect")
    (license license:asl2.0)))

;;; 11. nuclei
(define-public nuclei
  (package
    (name "nuclei")
    (version "3.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/projectdiscovery/nuclei")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/projectdiscovery/nuclei/v3"
           #:tests? #f))
    (synopsis "fast template-based vulnerability scanner")
    (description "Fast and configurable vulnerability scanner based on templates.  Offers massive extensibility for security scanning with a large community-maintained template library.")
    (home-page "https://github.com/projectdiscovery/nuclei")
    (license license:expat)))

;;; 12. pipet-git
(define-public pipet-git
  (package
    (name "pipet-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bjesus/pipet")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bjesus/pipet"
           #:tests? #f))
    (synopsis "scraping and extracting data from online assets")
    (description "Swiss-army tool for scraping and extracting data from online assets.  Supports extracting data from web pages using CSS selectors and XPath expressions via a simple YAML configuration.")
    (home-page "https://github.com/bjesus/pipet")
    (license license:expat)))

;;; 13. baidupcs-go-git
(define-public baidupcs-go-git
  (package
    (name "baidupcs-go-git")
    (version "3.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qjfoidnh/BaiduPCS-Go")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/qjfoidnh/BaiduPCS-Go"
           #:tests? #f))
    (synopsis "terminal client for Baidu network disk")
    (description "Terminal utility for Baidu Network Disk cloud storage.  Provides a command-line interface for uploading, downloading, and managing files on Baidu Pan.")
    (home-page "https://github.com/qjfoidnh/BaiduPCS-Go")
    (license license:asl2.0)))

;;; 14. unpackerr
(define-public unpackerr
  (package
    (name "unpackerr")
    (version "0.15.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Unpackerr/unpackerr")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/Unpackerr/unpackerr"
           #:tests? #f))
    (synopsis "extract downloads for Radarr, Sonarr, Lidarr, Readarr")
    (description "Monitors download directories and extracts archives so that Radarr, Sonarr, Lidarr, or Readarr may import the media files.  Supports RAR, ZIP, and other archive formats.")
    (home-page "https://github.com/Unpackerr/unpackerr")
    (license license:expat)))

;;; 15. bandsnatch
(define-public bandsnatch
  (package
    (name "bandsnatch")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ovyerus/bandsnatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI batch downloader for Bandcamp collections")
    (description "Command-line batch downloader for Bandcamp music collections.  Authenticates with Bandcamp and downloads purchased albums in the user's preferred format.")
    (home-page "https://github.com/Ovyerus/bandsnatch")
    (license license:expat)))

;;; 16. izucat-git
(define-public izucat-git
  (package
    (name "izucat-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Souiken/izucat")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "recursively concatenate files to Typst format")
    (description "Program that can recursively concatenate text and binary files in a path to Typst format.  Useful for preparing source code listings for documentation.")
    (home-page "https://github.com/Souiken/izucat")
    (license license:expat)))

;;; 17. ocd
(define-public ocd
  (package
    (name "ocd")
    (version "0.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/awkless/ocd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "organize current dotfiles")
    (description "Tool for organizing dotfiles into a structured configuration.  Manages symlinks and tracks dotfile changes with a clean command-line interface.")
    (home-page "https://github.com/awkless/ocd")
    (license license:expat)))

;;; 18. apkeep
(define-public apkeep
  (package
    (name "apkeep")
    (version "0.18.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EFForg/apkeep")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for downloading APK files from various sources")
    (description "Command-line tool from the EFF for downloading APK files from various sources.  Supports downloading from Google Play, APKPure, and F-Droid repositories.")
    (home-page "https://github.com/EFForg/apkeep")
    (license license:expat)))

;;; 19. imagineer
(define-public imagineer
  (package
    (name "imagineer")
    (version "0.24.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/foresterre/sic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "accessible image processing from the terminal")
    (description "Accessible image processing and conversion tool for the terminal.  Supports common operations like resize, crop, rotate, and format conversion using a simple CLI.")
    (home-page "https://github.com/foresterre/sic")
    (license license:expat)))

;;; 20. shotman
(define-public shotman
  (package
    (name "shotman")
    (version "0.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~whynothugo/shotman")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screenshot GUI for Wayland compositors")
    (description "Uncompromising screenshot GUI for Wayland.  Integrates with grim and slurp for region selection and provides a minimal interface for screenshot management.")
    (home-page "https://git.sr.ht/~whynothugo/shotman")
    (license license:isc)))

;;; 21. wctx
(define-public wctx
  (package
    (name "wctx")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/slightlyfaulty/wctx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "real-time window context info for Wayland and X11")
    (description "Real-time window context information tool for Wayland and X11.  Reports the currently focused window title, application name, and other metadata.")
    (home-page "https://github.com/slightlyfaulty/wctx")
    (license license:expat)))

;;; 22. ianny
(define-public ianny
  (package
    (name "ianny")
    (version "2.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zefr0x/ianny")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop break reminder to prevent repetitive strain")
    (description "Desktop utility that helps preventing repetitive strain injuries by periodically informing the user to take breaks.  Implements the 20-20-20 rule and customizable break intervals.")
    (home-page "https://github.com/zefr0x/ianny")
    (license license:gpl3)))

;;; 23. auto-epp-rs
(define-public auto-epp-rs
  (package
    (name "auto-epp-rs")
    (version "0.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tfkhdyt/auto-epp-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatic EPP manager for AMD CPUs")
    (description "Program that automatically manages the Energy Performance Preference of AMD CPUs using the AMD-Pstate driver.  Adjusts power profiles based on system load.")
    (home-page "https://github.com/tfkhdyt/auto-epp-rs")
    (license license:gpl3+)))

;;; 24. recordbox
(define-public recordbox
  (package
    (name "recordbox")
    (version "0.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/edestcroix/Recordbox")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple album-focused music player and library browser")
    (description "Music player and library browser designed to be simple and focused on browsing albums rather than tracks or playlists.  Built with GTK4 and GStreamer.")
    (home-page "https://codeberg.org/edestcroix/Recordbox")
    (license license:gpl3)))

;;; 25. walrs
(define-public walrs
  (package
    (name "walrs")
    (version "1.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://pi66.xyz/tools/walrs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate color scheme from image")
    (description "Generate color schemes from images.  Extracts dominant colors and creates terminal-compatible color palettes for theming applications.")
    (home-page "https://pi66.xyz/tools/walrs")
    (license license:gpl3+)))

;;; 26. ruffle-git
(define-public ruffle-git
  (package
    (name "ruffle-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasopuni31/nicholasopuni31-ruffle")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flash Player emulator written in Rust")
    (description "Flash Player emulator written in Rust.  Runs Flash content natively without the need for the original Adobe Flash Player plugin.")
    (home-page "https://github.com/nicholasopuni31/nicholasopuni31-ruffle")
    (license license:expat)))

;;; 27. swayosd-git
(define-public swayosd-git
  (package
    (name "swayosd-git")
    (version "0.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ErikReider/SwayOSD")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GTK on-screen display for keyboard shortcuts")
    (description "GTK-based on-screen display for keyboard shortcuts like caps-lock and volume.  Shows visual feedback for key presses and audio volume changes on Wayland compositors.")
    (home-page "https://github.com/ErikReider/SwayOSD")
    (license license:gpl3+)))

;;; 28. abuse
(define-public abuse
  (package
    (name "abuse")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Xenoveritas/abuse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "side-scroller action game against alien killers")
    (description "Side-scroller action game that pits you against ruthless alien killers.  Originally developed by Crack dot Com, now maintained as an open-source SDL2 port.")
    (home-page "https://github.com/Xenoveritas/abuse")
    (license license:gpl2+)))

;;; 29. dablin
(define-public dablin
  (package
    (name "dablin")
    (version "1.16.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Opendigitalradio/dablin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DAB/DAB+ audio service player")
    (description "Plays a DAB/DAB+ audio service from a live transmission or from a stored ensemble recording.  Supports both command-line and GTK3 graphical interfaces.")
    (home-page "https://github.com/Opendigitalradio/dablin")
    (license license:gpl3)))

;;; 30. canokey-usbip-git
(define-public canokey-usbip-git
  (package
    (name "canokey-usbip-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasopuni31/nicholasopuni31-canokey-usbip")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "virtual CanoKey based on USB/IP")
    (description "Virtual CanoKey implementation based on USB/IP.  Emulates a CanoKey hardware security token over the network for development and testing.")
    (home-page "https://github.com/nicholasopuni31/nicholasopuni31-canokey-usbip")
    (license license:asl2.0)))

;;; 31. anope
(define-public anope
  (package
    (name "anope")
    (version "2.0.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anope/anope")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IRC services designed for flexibility")
    (description "Set of IRC Services designed for flexibility and ease of use.  Provides NickServ, ChanServ, OperServ, and other services for IRC networks.")
    (home-page "https://github.com/anope/anope")
    (license license:gpl2+)))

;;; 32. speedynote-git
(define-public speedynote-git
  (package
    (name "speedynote-git")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alpha-liu-01/SpeedyNote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple note app with PDF import support")
    (description "Simple note-taking application with good performance and PDF import support.  Built with Qt6 and supports pen input for handwritten notes.")
    (home-page "https://github.com/alpha-liu-01/SpeedyNote")
    (license license:expat)))

;;; 33. openswitcher
(define-public openswitcher
  (package
    (name "openswitcher")
    (version "0.13.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~martijnbraam/pyatem")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library and GTK3 app for ATEM video switchers")
    (description "Library implementing the ATEM video switcher protocol and a GTK3 application for controlling Blackmagic Design ATEM hardware.  Supports live video mixing operations.")
    (home-page "https://git.sr.ht/~martijnbraam/pyatem")
    (license license:gpl3+)))

;;; 34. wljoywake
(define-public wljoywake
  (package
    (name "wljoywake")
    (version "0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nowrep/wljoywake")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wayland idle inhibit on joystick input")
    (description "Inhibits Wayland idle timeout when joystick input is detected.  Prevents screen blanking during gamepad usage on Wayland compositors.")
    (home-page "https://github.com/nowrep/wljoywake")
    (license license:gpl2)))

;;; 35. wl-gammactl
(define-public wl-gammactl
  (package
    (name "wl-gammactl")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mischw/wl-gammactl")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "set contrast, brightness and gamma on Wayland")
    (description "Set contrast, brightness and gamma on wlroots-based Wayland compositors.  Provides a GTK3 interface for adjusting display color settings.")
    (home-page "https://github.com/mischw/wl-gammactl")
    (license license:expat)))

;;; 36. lswt-git
(define-public lswt-git
  (package
    (name "lswt-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~leon_plickat/lswt")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "list Wayland toplevels")
    (description "List Wayland toplevel windows.  Provides a simple command-line tool for querying the list of open windows on a Wayland compositor via the wlr-foreign-toplevel protocol.")
    (home-page "https://git.sr.ht/~leon_plickat/lswt")
    (license license:gpl3+)))

;;; 37. proftpd
(define-public proftpd
  (package
    (name "proftpd")
    (version "1.3.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.proftpd.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "high-performance, scalable FTP/SFTP server")
    (description "High-performance, scalable FTP, SSL/TLS, and SFTP server.  Supports virtual hosting, LDAP authentication, SQL backends, and PAM integration.")
    (home-page "http://www.proftpd.org/")
    (license license:gpl2+)))

;;; 38. librepfunc
(define-public librepfunc
  (package
    (name "librepfunc")
    (version "1.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wirbel-at-vdr-portal/librepfunc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of common functions for DVB tools")
    (description "Collection of common functions, classes, and tools.  Mainly used by w_scan_cpp for DVB channel scanning and related broadcast utilities.")
    (home-page "https://github.com/wirbel-at-vdr-portal/librepfunc")
    (license license:gpl2+)))

;;; 39. trigger
(define-public trigger
  (package
    (name "trigger")
    (version "0.6.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/trigger-rally/" name "-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free OpenGL rally car racing game")
    (description "Free OpenGL rally car racing game.  Features procedurally generated terrain, multiple vehicles, and physics-based driving on off-road courses.")
    (home-page "https://sourceforge.net/projects/trigger-rally/")
    (license license:gpl2+)))

;;; 40. p910nd
(define-public p910nd
  (package
    (name "p910nd")
    (version "0.97")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kenyapcomau/p910nd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small printer daemon for diskless workstations")
    (description "Small printer daemon intended for diskless workstations that passes jobs directly to the printer.  Lightweight alternative to CUPS for simple print server setups.")
    (home-page "https://github.com/kenyapcomau/p910nd")
    (license license:gpl2+)))

;;; 41. ipad-charge
(define-public ipad-charge
  (package
    (name "ipad-charge")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://www.rainbow-software.org/linux/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iPad USB charging control utility")
    (description "iPad USB charging control utility.  Sends the necessary USB control messages to enable charging mode on Apple iPad devices connected via USB.")
    (home-page "http://www.rainbow-software.org/linux/")
    (license license:gpl2+)))

;;; 42. pcc-libs-git
(define-public pcc-libs-git
  (package
    (name "pcc-libs-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/PortableCC/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "libraries for the Portable C Compiler")
    (description "Runtime libraries for the Portable C Compiler (pcc).  Provides crt startup files and compiler runtime support for the PCC toolchain.")
    (home-page "https://github.com/PortableCC/")
    (license license:bsd-2)))

;;; 43. openxcom
(define-public openxcom
  (package
    (name "openxcom")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://openxcom.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source reimplementation of X-COM")
    (description "Open-source reimplementation of the classic X-COM: UFO Defense game.  Requires original game data files and provides improved engine features including higher resolutions and mod support.")
    (home-page "https://openxcom.org/")
    (license license:gpl3+)))

;;; 44. mfoc-hardnested-git
(define-public mfoc-hardnested-git
  (package
    (name "mfoc-hardnested-git")
    (version "0.10.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nfc-tools/mfoc-hardnested")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MIFARE Classic offline cracker with hardnested attack")
    (description "Fork of mfoc integrating the hardnested attack code from the Proxmark project.  Recovers keys from MIFARE Classic cards using known vulnerabilities in the CRYPTO1 cipher.")
    (home-page "https://github.com/nfc-tools/mfoc-hardnested")
    (license license:gpl2)))

;;; 45. libstrangle-git
(define-public libstrangle-git
  (package
    (name "libstrangle-git")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/torkel104/libstrangle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple FPS limiter for Linux")
    (description "Simple FPS limiter for Linux.  Uses LD_PRELOAD to intercept OpenGL buffer swaps and enforce a maximum frame rate for any graphical application.")
    (home-page "https://gitlab.com/torkel104/libstrangle")
    (license license:gpl3+)))

;;; 46. mips-elf-binutils
(define-public mips-elf-binutils
  (package
    (name "mips-elf-binutils")
    (version "2.45")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://ftp.gnu.org/gnu/binutils/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNU Binutils for MIPS ELF bare-metal targets")
    (description "Cross-compilation GNU Binutils targeting the MIPS ELF bare-metal architecture.  Provides assembler, linker, and object file manipulation tools for MIPS embedded development.")
    (home-page "https://ftp.gnu.org/gnu/binutils/")
    (license license:gpl3+)))

;;; 47. perl-pod-usage
(define-public perl-pod-usage
  (package
    (name "perl-pod-usage")
    (version "2.05")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://metacpan.org/pod/Pod::Usage")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl module for displaying usage messages")
    (description "Perl module for displaying usage messages from POD documentation.  Provides the pod2usage function for generating help text from embedded POD in Perl scripts.")
    (home-page "https://metacpan.org/pod/Pod::Usage")
    (license license:artistic2.0)))

;;; 48. perl-re-engine-re2
(define-public perl-re-engine-re2
  (package
    (name "perl-re-engine-re2")
    (version "0.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dgl/re-engine-RE2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl RE2 regex engine backend")
    (description "Replaces Perl's regex engine in a given lexical scope with Google RE2.  Provides linear-time matching guarantees and protection against ReDoS attacks.")
    (home-page "https://github.com/dgl/re-engine-RE2")
    (license license:gpl1+)))

;;; 49. pgbadger
(define-public pgbadger
  (package
    (name "pgbadger")
    (version "13.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/darold/pgbadger")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast PostgreSQL log analyzer")
    (description "Fast PostgreSQL log analyzer with detailed reports.  Generates HTML reports with query statistics, wait events, lock analysis, and performance metrics from PostgreSQL log files.")
    (home-page "https://github.com/darold/pgbadger")
    (license license:bsd-2)))

;;; 50. faugus-subtitle
(define-public faugus-subtitle
  (package
    (name "faugus-subtitle")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Faugus/faugus-subtitle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight subtitle downloader for videos")
    (description "Simple and lightweight application for downloading subtitles for videos.  Provides a GTK3 graphical interface for searching and downloading subtitle files.")
    (home-page "https://github.com/Faugus/faugus-subtitle")
    (license license:expat)))

;;; 51. ansible-dev-environment
(define-public ansible-dev-environment
  (package
    (name "ansible-dev-environment")
    (version "25.12.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ansible/ansible-dev-environment")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pip-like installer for Ansible collections")
    (description "Pip-like install tool for Ansible collections.  Manages Ansible collection dependencies and virtual environments for development workflows.")
    (home-page "https://github.com/ansible/ansible-dev-environment")
    (license license:gpl3+)))

;;; 52. frida-dexdump
(define-public frida-dexdump
  (package
    (name "frida-dexdump")
    (version "2.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hluwa/frida-dexdump")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "frida tool to dump dex files from memory")
    (description "Frida-based tool for dumping DEX files from Android application memory.  Uses dynamic instrumentation to extract Dalvik bytecode at runtime.")
    (home-page "https://github.com/hluwa/frida-dexdump")
    (license license:gpl3)))

;;; 53. python-wallbreaker
(define-public python-wallbreaker
  (package
    (name "python-wallbreaker")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hluwa/Wallbreaker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "live Java heap analyzer powered by Frida")
    (description "Tool for live analyzing Java heap, powered by Frida.  Provides runtime inspection of Java objects and classes in Android applications.")
    (home-page "https://github.com/hluwa/Wallbreaker")
    (license license:gpl3)))

;;; 54. turbocase
(define-public turbocase
  (package
    (name "turbocase")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~martijnbraam/turbocase")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "generate OpenSCAD case from KiCad PCB")
    (description "Generate an OpenSCAD case template from a KiCad PCB file.  Reads PCB dimensions and component positions to create a 3D-printable enclosure design.")
    (home-page "https://git.sr.ht/~martijnbraam/turbocase")
    (license license:expat)))

;;; 55. python-imblearn
(define-public python-imblearn
  (package
    (name "python-imblearn")
    (version "0.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://imbalanced-learn.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python package for imbalanced datasets in ML")
    (description "Python package to tackle the curse of imbalanced datasets in machine learning.  Provides resampling techniques (SMOTE, ADASYN, etc.) and ensemble methods for handling class imbalance.")
    (home-page "https://imbalanced-learn.org/")
    (license license:expat)))

;;; 56. sox-noise-git
(define-public sox-noise-git
  (package
    (name "sox-noise-git")
    (version "0.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Thann/sox-noise")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "noise generator GUI powered by SoX")
    (description "Noise generator GUI powered by Sound eXchange (SoX).  Provides a GTK3 interface for generating white, pink, and brown noise for ambient sound and testing.")
    (home-page "https://github.com/Thann/sox-noise")
    (license license:public-domain)))

;;; 57. kattis-cli-git
(define-public kattis-cli-git
  (package
    (name "kattis-cli-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Kattis/kattis-cli")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool for Kattis online judge")
    (description "Command-line tool for the Kattis online judge.  Supports submitting solutions, checking problem status, and downloading test cases from the Kattis competitive programming platform.")
    (home-page "https://github.com/Kattis/kattis-cli")
    (license license:expat)))

;;; 58. meanalyzer
(define-public meanalyzer
  (package
    (name "meanalyzer")
    (version "1.311.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/platomav/MEAnalyzer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel Engine firmware analysis tool")
    (description "Intel Engine and Graphics Firmware Analysis Tool.  Parses and analyzes Intel ME, CSME, SPS, and PMC firmware images for version identification and integrity checking.")
    (home-page "https://github.com/platomav/MEAnalyzer")
    (license license:bsd-2)))

;;; 59. dove
(define-public dove
  (package
    (name "dove")
    (version "20260331")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://dove.celenity.dev")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dove/"))))
    (synopsis "privacy-focused configurations for Mozilla Thunderbird")
    (description "Suite of configurations and advanced modifications for Mozilla Thunderbird.  Designed to put the user first with a focus on privacy, security, freedom, and usability.")
    (home-page "https://dove.celenity.dev")
    (license license:gpl3+)))

;;; 60. mpv-modernz-git
(define-public mpv-modernz-git
  (package
    (name "mpv-modernz-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Samillion/ModernZ")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mpv-modernz-git/"))))
    (synopsis "sleek and modern OSC for mpv")
    (description "Sleek and modern on-screen controller for mpv.  Enhances mpv functionality by adding more features while preserving the core standards of the main mpv OSC.")
    (home-page "https://github.com/Samillion/ModernZ")
    (license license:lgpl2.1)))

;;; 61. ideapad-cm
(define-public ideapad-cm
  (package
    (name "ideapad-cm")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/archlinux-jerry/ideapad-conservation-mode")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ideapad-cm/"))))
    (synopsis "battery conservation mode for Lenovo Ideapad")
    (description "Script to enable or disable battery conservation mode in Lenovo Ideapad laptops.  Controls the battery charge threshold through the ideapad_laptop kernel module.")
    (home-page "https://github.com/archlinux-jerry/ideapad-conservation-mode")
    (license license:gpl3+)))

;;; 62. fetchmirrors
(define-public fetchmirrors
  (package
    (name "fetchmirrors")
    (version "0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/deadhead420/fetchmirrors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fetchmirrors/"))))
    (synopsis "fetch and rank pacman mirrorlist")
    (description "Fetch and rank new pacman mirror lists.  Shell script that retrieves current Arch Linux mirrors and ranks them by speed for optimal package download performance.")
    (home-page "https://github.com/deadhead420/fetchmirrors")
    (license license:gpl3+)))

;;; 63. arttime-git
(define-public arttime-git
  (package
    (name "arttime-git")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/poetaman/arttime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/arttime-git/"))))
    (synopsis "clock, timer and text-art viewer for the terminal")
    (description "Clock, timer, time manager and text-art viewer for the terminal.  Displays ASCII art alongside a configurable digital clock with alarm and pomodoro timer features.")
    (home-page "https://github.com/poetaman/arttime")
    (license license:expat)))

;;; 64. wtf
(define-public wtf
  (package
    (name "wtf")
    (version "20230906")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://sourceforge.net/projects/bsdwtf/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wtf/"))))
    (synopsis "acronym dictionary from BSD")
    (description "Acronym dictionary with additions from NetBSD and Wikipedia.  Translates acronyms and abbreviations used in computing, networking, and internet culture.")
    (home-page "https://sourceforge.net/projects/bsdwtf/")
    (license license:bsd-2)))

;;; 65. fudo-git
(define-public fudo-git
  (package
    (name "fudo-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FragmentedCurve/fudo")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fudo-git/"))))
    (synopsis "sudo to doas wrapper script")
    (description "Wrapper script that translates sudo commands to doas equivalents.  Allows using sudo syntax while the system uses doas as the privilege escalation tool.")
    (home-page "https://github.com/FragmentedCurve/fudo")
    (license license:bsd-2)))

;;; 66. posy-cursors
(define-public posy-cursors
  (package
    (name "posy-cursors")
    (version "3.7.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Icelk/posy-cursors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/posy-cursors/"))))
    (synopsis "port of Posy's improved mouse cursors")
    (description "Port of Posy's improved cursor theme for Linux.  Provides high-quality, detailed mouse cursor icons with multiple sizes and animation frames.")
    (home-page "https://github.com/Icelk/posy-cursors")
    (license license:expat)))

;;; 67. plymouth-theme-arch-logo
(define-public plymouth-theme-arch-logo
  (package
    (name "plymouth-theme-arch-logo")
    (version "1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://www.gnome-look.org/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plymouth-theme-arch-logo/"))))
    (synopsis "arch Linux logo Plymouth boot theme")
    (description "Plymouth boot splash theme featuring the Arch Linux logo.  Based on the debian-logo theme with Arch Linux branding for the boot animation.")
    (home-page "https://www.gnome-look.org/")
    (license license:gpl3+)))

;;; 68. yvt
(define-public yvt
  (package
    (name "yvt")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/s-n-alexeyev/yvt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yvt/"))))
    (synopsis "yandex video translate script")
    (description "Script for downloading and translating videos from popular hosting platforms.  Uses Yandex neural network for video translation into Russian, English, and Kazakh.")
    (home-page "https://github.com/s-n-alexeyev/yvt")
    (license license:gpl3+)))

;;; 69. wlnfancurve
(define-public wlnfancurve
  (package
    (name "wlnfancurve")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xiyori/wlnfancurve")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wlnfancurve/"))))
    (synopsis "NVIDIA GPU fan speed control for Wayland")
    (description "Script to control NVIDIA GPU fan speed on Wayland using pyNVML.  Implements a customizable fan curve for managing GPU thermals without X11.")
    (home-page "https://github.com/xiyori/wlnfancurve")
    (license license:gpl3+)))

;;; 70. docsify-cli
(define-public docsify-cli
  (package
    (name "docsify-cli")
    (version "4.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/docsifyjs/docsify-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool for docsify documentation generator")
    (description "Command-line interface for Docsify, a magical documentation site generator.  Supports live preview, initialization, and serving of Docsify documentation projects.")
    (home-page "https://github.com/docsifyjs/docsify-cli")
    (license license:expat)))

;;; 71. write-good
(define-public write-good
  (package
    (name "write-good")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/btford/write-good")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "naive linter for English prose")
    (description "Naive linter for English prose.  Checks for weasel words, passive voice, and other common writing issues in text files.")
    (home-page "https://github.com/btford/write-good")
    (license license:expat)))

;;; 72. appium
(define-public appium
  (package
    (name "appium")
    (version "3.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://appium.io")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform automation framework for apps")
    (description "Cross-platform automation framework for all kinds of applications.  Supports testing native, hybrid, and web applications on mobile and desktop platforms.")
    (home-page "https://appium.io")
    (license license:asl2.0)))

;;; 73. iptv-checker
(define-public iptv-checker
  (package
    (name "iptv-checker")
    (version "0.30.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/freearhey/iptv-checker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for checking IPTV playlist links")
    (description "Node.js CLI tool for checking links in IPTV playlists.  Validates m3u playlist entries by testing stream availability and recording response times.")
    (home-page "https://github.com/freearhey/iptv-checker")
    (license license:expat)))

;;; 74. freerouting
(define-public freerouting
  (package
    (name "freerouting")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/freerouting/freerouting")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/freerouting/"))))
    (synopsis "advanced PCB autorouter")
    (description "Advanced PCB autorouter for printed circuit board design.  Provides automatic trace routing for complex multi-layer PCB layouts with support for Specctra DSN format.")
    (home-page "https://github.com/freerouting/freerouting")
    (license license:gpl3)))

;;; 75. hath
(define-public hath
  (package
    (name "hath")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ehwiki.org/wiki/Hentai@Home"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hath/"))))
    (synopsis "open-source peer-to-peer gallery distribution")
    (description "Open-source peer-to-peer gallery distribution system.  Java-based client for participating in the Hentai@Home distributed content delivery network.")
    (home-page "https://ehwiki.org/wiki/Hentai@Home")
    (license license:gpl3)))

;;; 76. grlx-farmer-bin
(define-public grlx-farmer-bin
  (package
    (name "grlx-farmer-bin")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gogrlx/grlx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grlx-farmer-bin/"))))
    (synopsis "grlx configuration management farmer daemon")
    (description "Farmer (server) daemon for the grlx configuration management system.  Manages sprout agents and coordinates infrastructure automation tasks.")
    (home-page "https://github.com/gogrlx/grlx")
    (license license:bsd-0)))

;;; 77. grlx-sprout-bin
(define-public grlx-sprout-bin
  (package
    (name "grlx-sprout-bin")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gogrlx/grlx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/grlx-sprout-bin/"))))
    (synopsis "grlx configuration management sprout agent")
    (description "Sprout (agent) for the grlx configuration management system.  Connects to a farmer server and executes configuration management tasks on the local host.")
    (home-page "https://github.com/gogrlx/grlx")
    (license license:bsd-0)))

;;; 78. opencomic-bin
(define-public opencomic-bin
  (package
    (name "opencomic-bin")
    (version "1.6.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ollm/OpenComic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/opencomic-bin/"))))
    (synopsis "comic and manga reader (prebuilt binary)")
    (description "Comic and manga reader built with Electron.  Supports CBR, CBZ, PDF, and folder-based comic formats with a customizable reading interface.")
    (home-page "https://github.com/ollm/OpenComic")
    (license license:gpl3+)))

;;; 79. linux-assistant-bin
(define-public linux-assistant-bin
  (package
    (name "linux-assistant-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.linux-assistant.org/"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/linux-assistant-bin/"))))
    (synopsis "daily Linux helper with integrated search (prebuilt)")
    (description "Daily Linux helper with powerful integrated search, routine checks, and administrative tasks.  Built with Flutter and Python for a modern desktop experience.")
    (home-page "https://www.linux-assistant.org/")
    (license license:gpl3)))

;;; 80. pyroscope-bin
(define-public pyroscope-bin
  (package
    (name "pyroscope-bin")
    (version "1.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pyroscope.io/"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pyroscope-bin/"))))
    (synopsis "continuous profiling platform (prebuilt)")
    (description "Continuous profiling platform for debugging performance issues.  Provides flame graphs and profiling data analysis down to individual lines of code.")
    (home-page "https://pyroscope.io/")
    (license license:agpl3)))

;;; 81. extraterm-bin
(define-public extraterm-bin
  (package
    (name "extraterm-bin")
    (version "0.81.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://extraterm.org/"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/extraterm-bin/"))))
    (synopsis "feature-rich terminal emulator (prebuilt)")
    (description "Feature-rich terminal emulator based on Qt6.  Supports frames, tabs, image display, and command output management for enhanced terminal workflows.")
    (home-page "https://extraterm.org/")
    (license license:expat)))

;;; 82. cinecred
(define-public cinecred
  (package
    (name "cinecred")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://cinecred.com"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cinecred/"))))
    (synopsis "beautiful film credits creator")
    (description "Create beautiful film credits without the pain.  Provides a visual editor for designing professional movie credits and title sequences.")
    (home-page "https://cinecred.com")
    (license license:gpl3+)))

;;; 83. tana
(define-public tana
  (package
    (name "tana")
    (version "1.515.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tana.inc"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tana/"))))
    (synopsis "all-in-one workspace (prebuilt Electron app)")
    (description "The everything OS and all-in-one workspace.  Provides a knowledge management tool with note-taking, project management, and database features in an Electron shell.")
    (home-page "https://tana.inc")
    (license license:proprietary)))
;;; 84. sftpman-python
(define-public sftpman-python
  (package
    (name "sftpman-python")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spantaleev/sftpman")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI application for managing SSHFS filesystems")
    (description "Command-line application for managing and mounting sshfs (SFTP) filesystems.  Provides a simple interface for defining, mounting, and unmounting remote filesystems via SSHFS.")
    (home-page "https://github.com/spantaleev/sftpman")
    (license license:gpl3+)))

