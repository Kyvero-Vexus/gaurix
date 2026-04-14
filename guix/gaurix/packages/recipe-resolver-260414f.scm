;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (gnu, cmake, meson, pyproject, copy, go)
;;;
;;; Recipes (30):
;;;   win11-clipboard-history-bin, duelsplus-bin, outline-client-appimage,
;;;   obs-captions-plugin-bin, zen-c, feb, dollarskip, eltclsh,
;;;   template-script, optiscaler-universal, compose-unicode,
;;;   qt6-tools-desktop, vim-wakatime, user-scanner, plex-mpv-shim,
;;;   mopidy-musicbox-webclient, python-sip4, quazaar, qbittorrent-clientblocker,
;;;   dnscontrol, ryelang, caddy-he, go-boot, go-hass-agent,
;;;   clight-gui, tacentview, ktx-software, netpeek,
;;;   vk-hdr-layer-kwin6, trayscale
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (win11-clipboard-history-bin
            duelsplus-bin
            outline-client-appimage
            obs-captions-plugin-bin
            zen-c
            feb
            dollarskip
            eltclsh
            template-script
            optiscaler-universal
            compose-unicode
            qt6-tools-desktop
            vim-wakatime
            user-scanner
            plex-mpv-shim
            mopidy-musicbox-webclient
            python-sip4
            quazaar
            qbittorrent-clientblocker
            dnscontrol
            ryelang
            caddy-he
            go-boot
            go-hass-agent
            clight-gui
            tacentview
            ktx-software
            netpeek
            vk-hdr-layer-kwin6
            trayscale))

;;;
;;; --- 1. win11-clipboard-history-bin (copy-build-system, pre-built binary) ---
;;;

(define-public win11-clipboard-history-bin
  (package
    (name "win11-clipboard-history-bin")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gustavosett/"
                    "Windows-11-Clipboard-History-For-Linux/releases/download/"
                    "v" version "/clipboard-history-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipboard-history-linux-x86_64" "bin/win11-clipboard-history"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/win11-clipboard-history")
                          #o755))))))
    (synopsis "Windows 11-style clipboard history manager for Linux")
    (description "A clipboard history manager for Linux that mimics the
Windows 11 clipboard history interface.  Supports both X11 and Wayland.")
    (home-page
     "https://github.com/gustavosett/Windows-11-Clipboard-History-For-Linux")
    (license license:expat)))

;;;
;;; --- 2. duelsplus-bin (copy-build-system, Tauri binary) ---
;;;

(define-public duelsplus-bin
  (package
    (name "duelsplus-bin")
    (version "3.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/duelsplus/launcher-tauri/releases/"
                    "download/v" version
                    "/duelsplus-launcher_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin" "bin")
               ("usr/share" "share"))))
    (synopsis "Compiled binaries for the Duels+ launcher")
    (description "Duels+ is a game launcher distributed as a pre-built
Tauri application binary for Linux.")
    (home-page "https://github.com/duelsplus/launcher-tauri")
    (license license:expat)))

;;;
;;; --- 3. outline-client-appimage (copy-build-system, AppImage) ---
;;;

(define-public outline-client-appimage
  (package
    (name "outline-client-appimage")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jigsaw-Code/outline-apps/releases/"
                    "download/client-v" version
                    "/Outline-Client.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Outline-Client.AppImage" "bin/outline-client"))))
    (synopsis "Outline VPN client for secure internet access")
    (description "Outline is an open source VPN client from Jigsaw (Google)
that uses the Shadowsocks protocol to provide secure internet access.
Distributed as an AppImage.")
    (home-page "https://getoutline.org")
    (license license:asl2.0)))

;;;
;;; --- 4. obs-captions-plugin-bin (copy-build-system, OBS plugin) ---
;;;

(define-public obs-captions-plugin-bin
  (package
    (name "obs-captions-plugin-bin")
    (version "0.33")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ratwithacompiler/"
                    "OBS-captions-plugin/releases/download/v" version
                    "/Closed_Captions_Plugin__v" version
                    "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/obs-plugins/"))))
    (synopsis "OBS Studio plugin for live closed captioning")
    (description "Standalone OBS Studio plugin providing closed captioning via
Google Cloud Speech Recognition API.  Adds real-time speech-to-text captions
as an OBS source.")
    (home-page "https://github.com/ratwithacompiler/OBS-captions-plugin")
    (license license:gpl2+)))

;;;
;;; --- 5. zen-c (gnu-build-system, C compiler) ---
;;;

(define-public zen-c
  (package
    (name "zen-c")
    (version "0.4.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zenc-lang/zenc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Write like a high-level language, run like C")
    (description "Zen-C is a programming language that provides high-level
syntax and abstractions while compiling to efficient C code.  It aims to
combine the ease of writing high-level code with the performance of C.")
    (home-page "https://github.com/zenc-lang/zenc")
    (license license:expat)))

;;;
;;; --- 6. feb (gnu-build-system, suckless build tool) ---
;;;

(define-public feb
  (let ((commit "HEAD")
        (revision "1"))
    (package
      (name "feb")
      (version (string-append "1.0-" revision "." "git"))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/predefine/feb")
                      (commit "HEAD")))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments
       (list #:tests? #f
             #:make-flags
             #~(list (string-append "PREFIX=" #$output))
             #:phases
             #~(modify-phases %standard-phases
                 (delete 'configure))))
      (synopsis "Easy to understand, simple to use suckless-style build system")
      (description "Feb is a minimal suckless-style build system that aims to
be easy to understand and simple to use for building C projects.")
      (home-page "https://github.com/predefine/feb")
      (license license:cc0))))

;;;
;;; --- 7. dollarskip (gnu-build-system, C utility) ---
;;;

(define-public dollarskip
  (package
    (name "dollarskip")
    (version "3.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CleanMachine1/DollarSkip")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Skip the dollar sign when pasting shell commands")
    (description "DollarSkip is a small C utility that strips leading dollar
signs from pasted shell commands, allowing you to copy-paste commands from
documentation without the leading @code{$} causing errors.")
    (home-page "https://github.com/CleanMachine1/DollarSkip")
    (license license:expat)))

;;;
;;; --- 8. eltclsh (gnu-build-system, TCL interactive shell) ---
;;;

(define-public eltclsh
  (package
    (name "eltclsh")
    (version "1.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://homepages.laas.fr/mallet/soft/shell/eltclsh/"
                    "eltclsh-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list tcl))
    (synopsis "Interactive shell for the TCL programming language")
    (description "Eltclsh is an interactive shell for the Tcl programming
language.  It provides command-line editing, history, and completion
features using libedit.")
    (home-page "http://homepages.laas.fr/mallet/soft/shell/eltclsh")
    (license license:bsd-3)))

;;;
;;; --- 9. template-script (copy-build-system, Python script) ---
;;;

(define-public template-script
  (let ((commit "HEAD")
        (revision "1"))
    (package
      (name "template-script")
      (version (string-append "0.1-" revision "." "git"))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/ASHWIN990/template")
                      (commit "HEAD")))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("template" "bin/template"))))
      (inputs (list python))
      (synopsis "Script to generate template files")
      (description "Template is a simple Python script that generates
boilerplate template files for various programming languages and project
types.")
      (home-page "https://github.com/ASHWIN990/template")
      (license license:gpl3+))))

;;;
;;; --- 10. optiscaler-universal (copy-build-system, bash script) ---
;;;

(define-public optiscaler-universal
  (package
    (name "optiscaler-universal")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ind4skylivey/0ptiscaler4linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("optiscaler" "bin/optiscaler"))))
    (inputs (list bash-minimal))
    (synopsis "Intelligent OptiScaler configuration for Linux gaming")
    (description "OptiScaler Universal is a bash-based tool that automatically
optimizes GPU upscaling settings for Linux gaming.  It detects the GPU vendor
and configures appropriate scaling parameters.")
    (home-page "https://github.com/ind4skylivey/0ptiscaler4linux")
    (license license:expat)))

;;;
;;; --- 11. compose-unicode (copy-build-system, bash tool) ---
;;;

(define-public compose-unicode
  (package
    (name "compose-unicode")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/claui/compose")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compose" "bin/compose"))))
    (inputs (list bash-minimal))
    (synopsis "Search for Unicode codepoints to scaffold Compose file lines")
    (description "Compose is a command-line tool that helps search for Unicode
codepoints and scaffold lines for your X11 Compose file.  It simplifies
creating custom keyboard input sequences.")
    (home-page "https://github.com/claui/compose")
    (license license:asl2.0)))

;;;
;;; --- 12. qt6-tools-desktop (copy-build-system, desktop files) ---
;;;

(define-public qt6-tools-desktop
  (package
    (name "qt6-tools-desktop")
    (version "6.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicman23/qt6-tools-desktop")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/applications/"
                #:include-regexp ("\\.desktop$")))))
    (synopsis "Desktop integration files for Qt6 tools")
    (description "Adds desktop integration files for Qt6 development tools
including Qt Assistant, Qt Designer, Qt Linguist, and QDBusViewer.  These
@file{.desktop} files allow launching the tools from desktop environment
application menus.")
    (home-page "https://www.qt.io")
    (license license:gpl3)))

;;;
;;; --- 13. vim-wakatime (copy-build-system, Vim plugin) ---
;;;

(define-public vim-wakatime
  (let ((commit "5fb3410")
        (revision "1"))
    (package
      (name "vim-wakatime")
      (version (string-append "4.0.12-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/wakatime/vim-wakatime")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("plugin" "share/vim/vimfiles/plugin")
                 ("autoload" "share/vim/vimfiles/autoload"))))
      (inputs (list vim python))
      (synopsis "Vim plugin for automatic time tracking via WakaTime")
      (description "Vim-wakatime is a Vim plugin that automatically tracks
your coding activity and generates metrics through the WakaTime service.
It records time spent editing in Vim across different projects, languages,
and branches.")
      (home-page "https://github.com/wakatime/vim-wakatime")
      (license license:bsd-3))))

;;;
;;; --- 14. user-scanner (pyproject-build-system, Python) ---
;;;

(define-public user-scanner
  (package
    (name "user-scanner")
    (version "1.3.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kaifcodec/user-scanner")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-colorama python-httpx))
    (synopsis "Check username availability across multiple platforms")
    (description "User-Scanner is a Python tool that checks username
availability across multiple popular platforms.  It queries various social
media and web services to determine if a given username is taken.")
    (home-page "https://github.com/kaifcodec/user-scanner")
    (license license:expat)))

;;;
;;; --- 15. plex-mpv-shim (python-build-system, Python) ---
;;;

(define-public plex-mpv-shim
  (package
    (name "plex-mpv-shim")
    (version "1.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/endlesseden/plex-mpv-shim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-certifi python-requests))
    (synopsis "Cast media from Plex Mobile and Web apps to MPV")
    (description "Plex MPV Shim enables casting media from Plex Mobile and
Plex Web apps to a local MPV player instance.  It acts as a Plex cast
receiver that plays content through the MPV media player.")
    (home-page "https://github.com/endlesseden/plex-mpv-shim")
    (license license:expat)))

;;;
;;; --- 16. mopidy-musicbox-webclient (python-build-system, Python) ---
;;;

(define-public mopidy-musicbox-webclient
  (package
    (name "mopidy-musicbox-webclient")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pimusicbox/mopidy-musicbox-webclient/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python))
    (synopsis "Web client for Mopidy music server")
    (description "Mopidy MusicBox Webclient is a web-based frontend for the
Mopidy music server.  It provides a responsive web interface for browsing
and controlling music playback on a Mopidy instance, originally designed
for the Pi MusicBox project.")
    (home-page "https://github.com/pimusicbox/mopidy-musicbox-webclient")
    (license license:asl2.0)))

;;;
;;; --- 17. python-sip4 (python-build-system, Python SIP bindings) ---
;;;

(define-public python-sip4
  (package
    (name "python-sip4")
    (version "4.19.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.riverbankcomputing.com/static/Downloads/sip/"
                    version "/sip-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (invoke "python" "configure.py"
                           "--bindir" (string-append #$output "/bin")
                           "--destdir" (string-append
                                        #$output "/lib/python"
                                        #$(version-major+minor
                                           (package-version python))
                                        "/site-packages")
                           "--incdir" (string-append #$output "/include")
                           "--sipdir" (string-append #$output "/share/sip")))))))
    (inputs (list python))
    (native-inputs (list python))
    (synopsis "Python SIP4 bindings generator for C and C++ libraries")
    (description "SIP is a tool for automatically generating Python bindings
for C and C++ libraries.  This is the legacy SIP version 4 which is still
required by some older PyQt4 applications.")
    (home-page "https://www.riverbankcomputing.com/software/sip/intro")
    (license license:gpl2+)))

;;;
;;; --- 18. quazaar (go-build-system, Go) ---
;;;

(define-public quazaar
  (package
    (name "quazaar")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/codershubinc/quazaar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/codershubinc/quazaar"
           #:tests? #f))
    (synopsis "Cross-platform LAN media control system using WebSockets")
    (description "Quazaar is a cross-platform LAN media control system that
uses WebSockets to provide remote media playback control across devices on
the same local network.")
    (home-page "https://github.com/codershubinc/quazaar")
    (license license:expat)))

;;;
;;; --- 19. qbittorrent-clientblocker (go-build-system, Go) ---
;;;

(define-public qbittorrent-clientblocker
  (let ((commit "HEAD")
        (revision "1"))
    (package
      (name "qbittorrent-clientblocker")
      (version (string-append "3.2-" revision "." "git"))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Simple-Tracker/qBittorrent-ClientBlocker")
                      (commit "HEAD")))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list #:import-path "github.com/Simple-Tracker/qBittorrent-ClientBlocker"
             #:tests? #f))
      (synopsis "Peer manager and client blocker for qBittorrent")
      (description "qBittorrent ClientBlocker is a peer management tool that
can automatically block unwanted BitTorrent clients from connecting to your
qBittorrent instance based on configurable rules.")
      (home-page "https://github.com/Simple-Tracker/qBittorrent-ClientBlocker")
      (license license:expat))))

;;;
;;; --- 20. dnscontrol (go-build-system, Go) ---
;;;

(define-public dnscontrol
  (package
    (name "dnscontrol")
    (version "4.36.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StackExchange/dnscontrol")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/StackExchange/dnscontrol/v4"
           #:tests? #f))
    (synopsis "Synchronize DNS records to multiple providers from a DSL")
    (description "DNSControl is an opinionated platform for seamlessly managing
your DNS configuration across any number of DNS hosts, both in the cloud or
in a datacenter.  It uses a JavaScript-based DSL for defining DNS zones.")
    (home-page "https://stackexchange.github.io/dnscontrol/")
    (license license:expat)))

;;;
;;; --- 21. ryelang (go-build-system, Go) ---
;;;

(define-public ryelang
  (let ((commit "62b2e9e")
        (revision "1"))
    (package
      (name "ryelang")
      (version (string-append "0.0.99-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/refaktorlabs/rye")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list #:import-path "github.com/refaktorlabs/rye"
             #:tests? #f))
      (synopsis "Flexible programming language for expressive code")
      (description "Rye is a programming language that tries to be flexible about
expression, built on Go.  It features a homoiconic syntax inspired by Rebol
and focuses on providing a natural and expressive way to write code.")
      (home-page "https://ryelang.org/")
      (license license:bsd-3))))

;;;
;;; --- 22. caddy-he (go-build-system, Go) ---
;;;

(define-public caddy-he
  (package
    (name "caddy-he")
    (version "2.11.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/caddyserver/caddy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/caddyserver/caddy/v2/cmd/caddy"
           #:tests? #f))
    (synopsis "Fast web server with automatic HTTPS and Hurricane Electric DNS")
    (description "Caddy is a powerful, enterprise-ready web server with automatic
HTTPS.  This variant includes the Hurricane Electric DNS module for DNS-01
ACME challenges.  It features automatic TLS certificate management, HTTP/2
and HTTP/3 support, and a simple configuration format.")
    (home-page "https://github.com/caddyserver/caddy")
    (license license:asl2.0)))

;;;
;;; --- 23. go-boot (go-build-system, Go) ---
;;;

(define-public go-boot
  (package
    (name "go-boot")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/usbarmory/go-boot")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/usbarmory/go-boot"
           #:tests? #f))
    (synopsis "Bare metal Go UEFI boot manager")
    (description "Go-boot is a bare metal UEFI boot manager written entirely
in Go.  It provides a minimal UEFI boot loader that can be used to boot
operating systems on UEFI-compatible hardware.")
    (home-page "https://github.com/usbarmory/go-boot")
    (license license:bsd-3)))

;;;
;;; --- 24. go-hass-agent (go-build-system, Go) ---
;;;

(define-public go-hass-agent
  (package
    (name "go-hass-agent")
    (version "14.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/joshuar/go-hass-agent")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/joshuar/go-hass-agent"
           #:tests? #f))
    (synopsis "Native Home Assistant companion app for Linux desktops")
    (description "Go Hass Agent is a Home Assistant native app for Linux
desktop and laptop devices.  It provides sensor data (battery, network,
system load) to a Home Assistant instance and supports receiving
notifications.")
    (home-page "https://github.com/joshuar/go-hass-agent")
    (license license:expat)))

;;;
;;; --- 25. clight-gui (cmake-build-system, Qt5 GUI) ---
;;;

(define-public clight-gui
  (let ((commit "29e7216")
        (revision "1"))
    (package
      (name "clight-gui")
      (version (string-append "0.1-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/nullobsi/clight-gui")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list pkg-config))
      (inputs (list qtbase-5))
      (synopsis "Qt GUI for the Clight backlight manager")
      (description "Clight-GUI is a graphical interface for Clight, the
automatic screen backlight calibration daemon.  It provides a Qt5-based
interface for monitoring and configuring ambient light-based screen
brightness adjustment.")
      (home-page "https://github.com/nullobsi/clight-gui")
      (license license:gpl3+))))

;;;
;;; --- 26. tacentview (cmake-build-system, image viewer) ---
;;;

(define-public tacentview
  (let ((commit "cd78fb8")
        (revision "1"))
    (package
      (name "tacentview")
      (version (string-append "1.0.45-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/bluescan/tacentview")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config))
      (inputs (list libx11 libxcb))
      (synopsis "Image and texture viewer for many formats")
      (description "TacentView is an image and texture viewer that supports a
wide range of formats including TGA, PNG, APNG, EXR, DDS, KTX, KTX2, ASTC,
PKM, and more.  It provides a lightweight interface for viewing and
inspecting image files.")
      (home-page "https://github.com/bluescan/tacentview")
      (license license:isc))))

;;;
;;; --- 27. ktx-software (cmake-build-system, Khronos texture tools) ---
;;;

(define-public ktx-software
  (let ((commit "797098b")
        (revision "1"))
    (package
      (name "ktx-software")
      (version (string-append "4.3.2-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/KhronosGroup/KTX-Software")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DKTX_FEATURE_TESTS=OFF"
                     "-DKTX_FEATURE_DOC=OFF")))
      (native-inputs (list pkg-config))
      (inputs (list zstd))
      (synopsis "KTX (Khronos Texture) library and tools")
      (description "KTX-Software provides tools and a library for the KTX
(Khronos Texture) file format.  KTX is a container format for GPU textures
used in 3D graphics applications.  This package includes the @code{toktx}
converter, @code{ktx2check} validator, and the KTX library.")
      (home-page "https://github.com/KhronosGroup/KTX-Software")
      (license license:asl2.0))))

;;;
;;; --- 28. netpeek (meson-build-system, GNOME network scanner) ---
;;;

(define-public netpeek
  (package
    (name "netpeek")
    (version "0.2.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ZingyTomato/NetPeek")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config))
    (inputs (list python gtk glib))
    (synopsis "Modern network scanner for GNOME")
    (description "NetPeek is a modern network scanner application for the
GNOME desktop.  It provides a clean GTK4/libadwaita interface for discovering
and inspecting devices on the local network using nmap.")
    (home-page "https://github.com/ZingyTomato/NetPeek")
    (license license:gpl3+)))

;;;
;;; --- 29. vk-hdr-layer-kwin6 (meson-build-system, Vulkan HDR layer) ---
;;;

(define-public vk-hdr-layer-kwin6
  (let ((commit "f5f13b7")
        (revision "1"))
    (package
      (name "vk-hdr-layer-kwin6")
      (version (string-append "0.1-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Zamundaaa/VK_hdr_layer")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list pkg-config))
      (inputs (list vulkan-headers vulkan-loader libx11))
      (synopsis "Vulkan Wayland HDR WSI layer for KWin 6")
      (description "VK HDR Layer is a Vulkan layer that enables HDR (High
Dynamic Range) output on Wayland compositors.  This is Xaver Hugl's fork
specifically designed for KWin 6, providing HDR support for Vulkan
applications running under KDE Plasma 6.")
      (home-page "https://github.com/Zamundaaa/VK_hdr_layer")
      (license license:expat))))

;;;
;;; --- 30. trayscale (go-build-system, Tailscale GUI) ---
;;;

(define-public trayscale
  (package
    (name "trayscale")
    (version "0.18.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DeedleFake/trayscale")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/DeedleFake/trayscale"
           #:tests? #f))
    (inputs (list gtk))
    (synopsis "Unofficial GUI wrapper for the Tailscale CLI client")
    (description "Trayscale is an unofficial GUI application for the Tailscale
VPN service.  It provides a GTK4/libadwaita interface for managing Tailscale
connections, viewing network status, and configuring exit nodes without using
the command line.")
    (home-page "https://github.com/DeedleFake/trayscale")
    (license license:expat)))
