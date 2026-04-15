;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; General queue drain pass --- deptree-resolver-260415k
;;; Resolves 100 packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415k)
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
            7k-ambition
            7k-ambition-music
            airvpn-suite-bin
            altserver-linux-bin
            argos-translate-gui
            attempt-git
            audiowide-font
            backhand-bin
            bitcoin-cli-bin
            bitcoin-daemon-bin
            bitcoin-qt-bin
            bitcoin-tx-bin
            bitcoin-util-bin
            bitcoin-wallet-bin
            bitwuzla-docs
            bmputil
            bscpylgtv
            ccline-bin
            chadtop-bin
            chamber-bin
            cruise-bin
            cvc5
            datacmd-bin
            dave-gnukem-git
            devtoolbox
            dream-prompter
            dtop-bin
            elevate-git
            envx-bin
            fauxdacious-git
            ffetch
            fjira-bin
            foot-terminfo-git
            frame0
            fzfs-git
            ghost-dl-bin
            ghost-dl-git
            git-today
            go-dsp-guitar-bin
            gog-hollow-knight-silksong
            gospider-bin
            gosqlapi
            goweb
            gtl-bin
            hell-bin
            hostapd-mana-git
            hs80tray
            ios-notif-forward
            json2tsv
            jugglinglab-git
            justdd-bin
            jzintvimgui
            kicad-interactive-html-bom-plugin
            krunner-steam-git
            libmdbx
            libobsidianos-overlays-git
            libtorch-cuda
            logu-bin
            lxtui
            montserrat-otf
            montserrat-ttf
            nowaymouse-git
            pacguard
            paleta
            pam-fprint-grosshack-unlimited-timeout
            pigment
            psiconv
            pycmd-bin
            pyprwall
            python-browser-cookie3
            python-tree-sitter-languages-bin
            python-wayfire
            refind-theme-refind2k-git
            rofi-blocks-git
            rustymeter
            someclick
            spacelaunch
            tageditor-bin
            tape-bin
            tash-bin
            theattyr-bin
            threes
            tldr-lint
            tmparch
            tmpdebian
            tmpfedora
            traefiktop-bin
            ttf-dmcasansserif
            ttf-lxgw-wenkai-nerd
            victorialogs-bin
            visualvault-bin
            wazuh-agent-src
            whisper-cpp-cuda
            wolvenkit-cli-bin
            xed-coreplugins-c
            yukigram-desktop
            zeppossimulator
            zerus-bin
            zipzap
            zlint
            ))

(define-public pycmd-bin
  (package
    (name "pycmd-bin")
    (version "20251112")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pycmd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "front-end for bash")
    (description "Front-end for bash.")
    (home-page "https://github.com/horeah/PyCmd")
    (license license:lgpl3)))

(define-public ccline-bin
  (package
    (name "ccline-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ccline-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A high-performance Claude Code statusline tool written in Rust with Git integ..")
    (description "A high-performance Claude Code statusline tool written in Rust with Git integration and real-time usage tracking.")
    (home-page "https://github.com/Haleclipse/CCometixLine")
    (license license:gpl3+)))

(define-public dave-gnukem-git
  (package
    (name "dave-gnukem-git")
    (version "1.0.2.r18.g78f98dd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/davidjoffe/dave_gnukem")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "2D scrolling platform shooter inspired by Duke Nukem 1")
    (description "2D scrolling platform shooter inspired by Duke Nukem 1.")
    (home-page "https://github.com/davidjoffe/dave_gnukem")
    (license license:gpl2)))

(define-public victorialogs-bin
  (package
    (name "victorialogs-bin")
    (version "1.47.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/victorialogs-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "scalable logging solution designed to be fast and highly efficient")
    (description "Scalable logging solution designed to be fast and highly efficient.")
    (home-page "https://docs.victoriametrics.com/victorialogs/")
    (license license:asl2.0)))

(define-public wazuh-agent-src
  (package
    (name "wazuh-agent-src")
    (version "4.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wazuh-agent-src.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wazuh agent for endpoints providing threat prevention, detection, and respons..")
    (description "Wazuh agent for endpoints providing threat prevention, detection, and response capabilities.")
    (home-page "https://github.com/wazuh/wazuh")
    (license license:gpl2)))

(define-public hostapd-mana-git
  (package
    (name "hostapd-mana-git")
    (version "20240805.8853d5a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sensepost/hostapd-mana")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator with Mana patches")
    (description "IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator with Mana patches.")
    (home-page "https://github.com/sensepost/hostapd-mana")
    (license license:bsd-3)))

(define-public json2tsv
  (package
    (name "json2tsv")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/json2tsv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "JSON to TSV converter")
    (description "JSON to TSV converter.")
    (home-page "https://codemadness.org/json2tsv.html")
    (license license:isc)))

(define-public elevate-git
  (package
    (name "elevate-git")
    (version "7.2.2.r3.gdf9e2ce")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://thomaschampagne.github.io/elevate-docs/")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A sport app to 'Elevate' your training experience and goals! Track your fitne..")
    (description "A sport app to 'Elevate' your training experience and goals! Track your fitness and progressions over time. Analyse deeper your activities. And more...Use system-wide electron.")
    (home-page "https://thomaschampagne.github.io/elevate-docs/")
    (license license:mpl2.0)))

(define-public pacguard
  (package
    (name "pacguard")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pacguard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "check installed packages against Arch Security Tracker for known vulnerabilities")
    (description "Check installed packages against Arch Security Tracker for known vulnerabilities.")
    (home-page "https://github.com/blackXploit-404/pacguard")
    (license license:expat)))

(define-public paleta
  (package
    (name "paleta")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paleta.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extract the dominant colors from any image")
    (description "Extract the dominant colors from any image.")
    (home-page "https://github.com/nate-xyz/paleta")
    (license license:gpl3+)))

(define-public gosqlapi
  (package
    (name "gosqlapi")
    (version "0.0.48")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gosqlapi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "turns any SQL database into a RESTful API")
    (description "Turns any SQL database into a RESTful API.")
    (home-page "https://github.com/elgs/gosqlapi")
    (license license:expat)))

(define-public rofi-blocks-git
  (package
    (name "rofi-blocks-git")
    (version "r170.d75a9da")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OmarCastro/rofi-blocks")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rofi modi for controlling rofi content through communication with an external..")
    (description "Rofi modi for controlling rofi content through communication with an external program.")
    (home-page "https://github.com/OmarCastro/rofi-blocks")
    (license license:gpl3+)))

(define-public python-tree-sitter-languages-bin
  (package
    (name "python-tree-sitter-languages-bin")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-tree-sitter-languages-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Bindings for Tree Sitter with All Languages")
    (description "Python Bindings for Tree Sitter with All Languages.")
    (home-page "https://github.com/grantjenks/py-tree-sitter-languages")
    (license license:asl2.0)))

(define-public go-dsp-guitar-bin
  (package
    (name "go-dsp-guitar-bin")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/go-dsp-guitar-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A cross-platform multichannel multi-effects processor for electric guitars an..")
    (description "A cross-platform multichannel multi-effects processor for electric guitars and other instruments.(Prebuilt version).")
    (home-page "https://github.com/andrepxx/go-dsp-guitar")
    (license license:asl2.0)))

(define-public pigment
  (package
    (name "pigment")
    (version "0.5.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pigment.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extract color palettes from your images")
    (description "Extract color palettes from your images.")
    (home-page "https://github.com/Jeffser/Pigment")
    (license license:gpl3+)))

(define-public fjira-bin
  (package
    (name "fjira-bin")
    (version "1.5.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fjira-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fjira - Fuzzy finder and TUI application for Jira")
    (description "Fjira - Fuzzy finder and TUI application for Jira.")
    (home-page "https://github.com/mk-5/fjira")
    (license license:agpl3)))

(define-public refind-theme-refind2k-git
  (package
    (name "refind-theme-refind2k-git")
    (version "r49.da28a55")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/2KAbhishek/refind2k")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A minimalist dark theme for rEFInd")
    (description "A minimalist dark theme for rEFInd.")
    (home-page "https://github.com/2KAbhishek/refind2k")
    (license license:expat)))

(define-public ios-notif-forward
  (package
    (name "ios-notif-forward")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ios-notif-forward.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "forward notifications from Apple devices to your desktop")
    (description "Forward notifications from Apple devices to your desktop.")
    (home-page "https://github.com/impiaaa/ios-notif-forward")
    (license license:expat)))

(define-public fzfs-git
  (package
    (name "fzfs-git")
    (version "r20.5d756b5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dakhnod/fzfs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flipper Zero filesystem driver")
    (description "Flipper Zero filesystem driver.")
    (home-page "https://github.com/dakhnod/fzfs")
    (license license:non-copyleft)))

(define-public gtl-bin
  (package
    (name "gtl-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtl-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transforms text into properly capitalized titles according to the Chicago Man..")
    (description "Transforms text into properly capitalized titles according to the Chicago Manual of Style.")
    (home-page "https://github.com/keircn/gtl")
    (license license:expat)))

(define-public kicad-interactive-html-bom-plugin
  (package
    (name "kicad-interactive-html-bom-plugin")
    (version "2.11.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kicad-interactive-html-bom-plugin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive HTML BOM generation plugin for KiCAD")
    (description "Interactive HTML BOM generation plugin for KiCAD.")
    (home-page "https://github.com/openscopeproject/InteractiveHtmlBom")
    (license license:expat)))

(define-public theattyr-bin
  (package
    (name "theattyr-bin")
    (version "0.1.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/theattyr-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A terminal theater for playing VT100 art and animations")
    (description "A terminal theater for playing VT100 art and animations.")
    (home-page "https://github.com/orhun/theattyr")
    (license license:asl2.0)))

(define-public ttf-dmcasansserif
  (package
    (name "ttf-dmcasansserif")
    (version "9.0_20252")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-dmcasansserif.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "general purpose sans serif font metric-compatible with Microsoft Consolas")
    (description "General purpose sans serif font metric-compatible with Microsoft Consolas.")
    (home-page "https://typedesign.replit.app")
    (license license:unlicense)))

(define-public lxtui
  (package
    (name "lxtui")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxtui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A modern terminal user interface for managing LXC/LXD containers with intuiti..")
    (description "A modern terminal user interface for managing LXC/LXD containers with intuitive keyboard shortcuts.")
    (home-page "https://github.com/FoleyBridge-Solutions/lxtui")
    (license license:expat)))

(define-public spacelaunch
  (package
    (name "spacelaunch")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spacelaunch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "help keep track of upcoming rocket launches")
    (description "Help keep track of upcoming rocket launches.")
    (home-page "https://gitlab.com/elescoute/spacelaunch")
    (license license:gpl3+)))

(define-public traefiktop-bin
  (package
    (name "traefiktop-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/traefiktop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A TUI for visualizing Traefik routing")
    (description "A TUI for visualizing Traefik routing.")
    (home-page "https://github.com/darksworm/traefiktop")
    (license license:non-copyleft)))

(define-public zeppossimulator
  (package
    (name "zeppossimulator")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zeppossimulator.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zepp OS simulator")
    (description "Zepp OS simulator.")
    (home-page "https://zeppos.com/developer/simulator/")
    (license license:non-copyleft)))

(define-public airvpn-suite-bin
  (package
    (name "airvpn-suite-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/airvpn-suite-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "airVPN client software collection including Bluetit, Goldcrest and Hummingbir..")
    (description "AirVPN client software collection including Bluetit, Goldcrest and Hummingbird – prebuilt stable.")
    (home-page "https://airvpn.org/linux/suite")
    (license license:gpl3+)))

(define-public jzintvimgui
  (package
    (name "jzintvimgui")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jzintvimgui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A cross-platform GUI for jzIntv")
    (description "A cross-platform GUI for jzIntv.")
    (home-page "https://github.com/jenergy/jzIntvImGui")
    (license license:expat)))

(define-public dtop-bin
  (package
    (name "dtop-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dtop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal dashboard for Docker")
    (description "Terminal dashboard for Docker.")
    (home-page "https://github.com/amir20/dtop")
    (license license:expat)))

(define-public chadtop-bin
  (package
    (name "chadtop-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chadtop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "TUI process and resource monitor")
    (description "TUI process and resource monitor.")
    (home-page "https://github.com/ethanrutt/chadtop")
    (license license:gpl3)))

(define-public yukigram-desktop
  (package
    (name "yukigram-desktop")
    (version "6.7.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yukigram-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A patch-based Telegram Desktop fork,with features from 64Gram")
    (description "A patch-based Telegram Desktop fork,with features from 64Gram.")
    (home-page "https://github.com/yukigram/yukigram")
    (license license:gpl3+)))

(define-public jugglinglab-git
  (package
    (name "jugglinglab-git")
    (version "1.6.7.r183.g3dac62f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jugglinglab-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A program for animating juggling patterns")
    (description "A program for animating juggling patterns.")
    (home-page "https://jugglinglab.org/")
    (license license:non-copyleft)))

(define-public attempt-git
  (package
    (name "attempt-git")
    (version "1.0.1.r0.gc083e94")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MaxBondABE/attempt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for retrying fallible commands (development version)")
    (description "CLI tool for retrying fallible commands (development version).")
    (home-page "https://github.com/MaxBondABE/attempt")
    (license license:unlicense)))

(define-public libobsidianos-overlays-git
  (package
    (name "libobsidianos-overlays-git")
    (version "r3.b74d866")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Obsidian-OS/overlays")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "obsidianOS's Overlay library for overlaying ObsidianOS Extensions without Ove..")
    (description "ObsidianOS's Overlay library for overlaying ObsidianOS Extensions without OverlayFS.")
    (home-page "https://github.com/Obsidian-OS/overlays")
    (license license:expat)))

(define-public cvc5
  (package
    (name "cvc5")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cvc5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an open-source automatic theorem prover for Satisfiability Modulo Theories (S..")
    (description "An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems.")
    (home-page "https://github.com/cvc5/cvc5")
    (license license:non-copyleft)))

(define-public goweb
  (package
    (name "goweb")
    (version "0.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goweb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi domain/host web server written in Golang")
    (description "Multi domain/host web server written in Golang.")
    (home-page "https://github.com/elgs/goweb")
    (license license:expat)))

(define-public someclick
  (package
    (name "someclick")
    (version "48.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/someclick.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "patched kgx (GNOME Console): right-click to copy/paste (as in Windows)")
    (description "Patched kgx (GNOME Console): right-click to copy/paste (as in Windows).")
    (home-page "https://github.com/ndiuky/someclick")
    (license license:gpl3+)))

(define-public tape-bin
  (package
    (name "tape-bin")
    (version "3.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tape-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "take notes without bloat")
    (description "Take notes without bloat.")
    (home-page "https://github.com/results-may-vary-org/tape")
    (license license:gpl3+)))

(define-public git-today
  (package
    (name "git-today")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/git-today.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool to recap your daily git work")
    (description "A tool to recap your daily git work.")
    (home-page "https://github.com/bitSheriff/git-today")
    (license license:expat)))

(define-public libmdbx
  (package
    (name "libmdbx")
    (version "0.13.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmdbx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "one of the fastest compact key-value ACID database without WAL, which surpass..")
    (description "One of the fastest compact key-value ACID database without WAL, which surpasses the legendary LMDB in terms of reliability, features and performance. At the end of 2024 MDBX was chosen by all modern Ethereum nodes as a storage engine.")
    (home-page "https://libmdbx.dqdkfa.ru/")
    (license license:non-copyleft)))

(define-public krunner-steam-git
  (package
    (name "krunner-steam-git")
    (version "r17.b86af5d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xTibor/krunner-steam.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "launch Steam games from Krunner")
    (description "Launch Steam games from Krunner.")
    (home-page "https://github.com/xTibor/krunner-steam.git")
    (license license:non-copyleft)))

(define-public altserver-linux-bin
  (package
    (name "altserver-linux-bin")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/altserver-linux-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enables an AltServer-compatible server for sideloading apps on Linux")
    (description "Enables an AltServer-compatible server for sideloading apps on Linux.")
    (home-page "https://github.com/NyaMisty/AltServer-Linux")
    (license license:gpl3+)))

(define-public datacmd-bin
  (package
    (name "datacmd-bin")
    (version "0.0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/datacmd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fastest and coolest way to turn raw data into stunning terminal dashboards")
    (description "Fastest and coolest way to turn raw data into stunning terminal dashboards.")
    (home-page "https://github.com/VincenzoManto/Datacmd")
    (license license:expat)))

(define-public visualvault-bin
  (package
    (name "visualvault-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/visualvault-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based media file organizer")
    (description "Terminal-based media file organizer.")
    (home-page "https://github.com/mikeleppane/visualvault")
    (license license:expat)))

(define-public chamber-bin
  (package
    (name "chamber-bin")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chamber-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A secure, local-first secrets manager")
    (description "A secure, local-first secrets manager.")
    (home-page "https://github.com/mikeleppane/chamber")
    (license license:expat)))

(define-public envx-bin
  (package
    (name "envx-bin")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/envx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A powerful and secure environment variable manager")
    (description "A powerful and secure environment variable manager.")
    (home-page "https://github.com/mikeleppane/envx")
    (license license:expat)))

(define-public gospider-bin
  (package
    (name "gospider-bin")
    (version "1.1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gospider-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast web spider written in Go")
    (description "Fast web spider written in Go.")
    (home-page "https://github.com/jaeles-project/gospider")
    (license license:expat)))

(define-public bitcoin-wallet-bin
  (package
    (name "bitcoin-wallet-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-wallet-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - Wallet")
    (description "A peer-to-peer network based digital currency - Wallet.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public bitcoin-util-bin
  (package
    (name "bitcoin-util-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-util-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - Utility")
    (description "A peer-to-peer network based digital currency - Utility.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public bitcoin-tx-bin
  (package
    (name "bitcoin-tx-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-tx-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - Transaction tool")
    (description "A peer-to-peer network based digital currency - Transaction tool.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public bitcoin-qt-bin
  (package
    (name "bitcoin-qt-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-qt-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - Qt")
    (description "A peer-to-peer network based digital currency - Qt.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public bitcoin-daemon-bin
  (package
    (name "bitcoin-daemon-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-daemon-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - Daemon")
    (description "A peer-to-peer network based digital currency - Daemon.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public bitcoin-cli-bin
  (package
    (name "bitcoin-cli-bin")
    (version "30.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitcoin-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A peer-to-peer network based digital currency - RPC client")
    (description "A peer-to-peer network based digital currency - RPC client.")
    (home-page "https://bitcoincore.org/")
    (license license:expat)))

(define-public justdd-bin
  (package
    (name "justdd-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/justdd-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "justDD - Simple graphical USB image writer for Linux and Windows ISOs (pre-bu..")
    (description "JustDD - Simple graphical USB image writer for Linux and Windows ISOs (pre-built binary).")
    (home-page "https://github.com/xxanqw/justdd")
    (license license:gpl3+)))

(define-public bitwuzla-docs
  (package
    (name "bitwuzla-docs")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bitwuzla-docs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for the Bitwuzla SMT solver")
    (description "Documentation for the Bitwuzla SMT solver.")
    (home-page "https://bitwuzla.github.io")
    (license license:expat)))

(define-public devtoolbox
  (package
    (name "devtoolbox")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/devtoolbox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "development tools at your fingertips")
    (description "Development tools at your fingertips.")
    (home-page "https://github.com/aleiepure/devtoolbox")
    (license license:cc0)))

(define-public audiowide-font
  (package
    (name "audiowide-font")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audiowide-font.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audiowide is a sans serif, technology styled, typeface composed of soft corne..")
    (description "Audiowide is a sans serif, technology styled, typeface composed of soft corner tubular forms. With vague nods to letter styles like that of Handel Gothic and the Converse logo.")
    (home-page "http://www.astigmatic.com")
    (license license:non-copyleft)))

(define-public 7k-ambition-music
  (package
    (name "7k-ambition-music")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/7k-ambition-music.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "music set for Seven Kingdoms: Ambition")
    (description "Music set for Seven Kingdoms: Ambition.")
    (home-page "https://seven-kingdoms-ambition.sourceforge.io/")
    (license license:non-copyleft)))

(define-public 7k-ambition
  (package
    (name "7k-ambition")
    (version "3.2.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/7k-ambition.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "seven Kingdoms: Ambition is a real-time game of epic strategy and empire buil..")
    (description "Seven Kingdoms: Ambition is a real-time game of epic strategy and empire building featuring economy management, warfare, and intrigue. It is an updated and enhanced version of 7kaa (7K: Ancient Adversaries) featuring numerous fixes and improvements.")
    (home-page "https://seven-kingdoms-ambition.sourceforge.io/")
    (license license:gpl2+)))

(define-public argos-translate-gui
  (package
    (name "argos-translate-gui")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/argos-translate-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical user interface for Argos Translate")
    (description "Graphical user interface for Argos Translate.")
    (home-page "https://www.argosopentech.com")
    (license license:expat)))

(define-public wolvenkit-cli-bin
  (package
    (name "wolvenkit-cli-bin")
    (version "8.17.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wolvenkit-cli-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A modding tool for Cyberpunk 2077")
    (description "A modding tool for Cyberpunk 2077.")
    (home-page "https://github.com/WolvenKit/WolvenKit")
    (license license:gpl3+)))

(define-public ghost-dl-bin
  (package
    (name "ghost-dl-bin")
    (version "v1.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ghost-dl-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kingdom Hearts Insider Game OST Archive Dowloader CLI")
    (description "Kingdom Hearts Insider Game OST Archive Dowloader CLI.")
    (home-page "https://github.com/TheElevatedOne/ghost-dl")
    (license license:gpl3+)))

(define-public tmpfedora
  (package
    (name "tmpfedora")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmpfedora.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary Fedora")
    (description "Part of the tmplinux suite. Temporary Fedora.")
    (home-page "https://github.com/TheOddCell/tmpfedora")
    (license license:expat)))

(define-public foot-terminfo-git
  (package
    (name "foot-terminfo-git")
    (version "1.25.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/foot-terminfo-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "alternative terminfo files for the foot terminal emulator, with additional no..")
    (description "Alternative terminfo files for the foot terminal emulator, with additional non-standard capabilities.")
    (home-page "https://codeberg.org/dnkl/foot")
    (license license:expat)))

(define-public tageditor-bin
  (package
    (name "tageditor-bin")
    (version "3.9.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tageditor-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (i..")
    (description "A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska.")
    (home-page "https://github.com/Martchus/tageditor")
    (license license:gpl2+)))

(define-public ffetch
  (package
    (name "ffetch")
    (version "0.2.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ffetch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool to fetch system info")
    (description "CLI tool to fetch system info.")
    (home-page "https://github.com/0l3d/ffetch")
    (license license:gpl3+)))

(define-public tmpdebian
  (package
    (name "tmpdebian")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmpdebian.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary Debian")
    (description "Part of the tmplinux suite. Temporary Debian.")
    (home-page "https://github.com/TheOddCell/tmpdebian")
    (license license:expat)))

(define-public logu-bin
  (package
    (name "logu-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/logu-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extract patterns from unstructured log messages")
    (description "Extract patterns from unstructured log messages.")
    (home-page "https://github.com/ynqa/logu")
    (license license:expat)))

(define-public pyprwall
  (package
    (name "pyprwall")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pyprwall.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple wallpaper manager for Hyprland that syncs wallpapers between hyprpap..")
    (description "A simple wallpaper manager for Hyprland that syncs wallpapers between hyprpaper and hyprlock.")
    (home-page "https://github.com/reeshavmainali/pyprwall")
    (license license:gpl3+)))

(define-public tmparch
  (package
    (name "tmparch")
    (version "3.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tmparch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary Arch Linux")
    (description "Part of the tmplinux suite. Temporary Arch Linux.")
    (home-page "https://github.com/TheOddCell/tmparch")
    (license license:expat)))

(define-public nowaymouse-git
  (package
    (name "nowaymouse-git")
    (version "r0.g0000000")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Neal-Ning/nowaymouse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "control mouse position, movements and actions with keyboard on wlroots-based ..")
    (description "Control mouse position, movements and actions with keyboard on wlroots-based wayland compositors.")
    (home-page "https://github.com/Neal-Ning/nowaymouse")
    (license license:gpl3+)))

(define-public bmputil
  (package
    (name "bmputil")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bmputil.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool for managing and flashing Black Magic Probe firmware")
    (description "A tool for managing and flashing Black Magic Probe firmware.")
    (home-page "https://github.com/blackmagic-debug/bmputil")
    (license license:non-copyleft)))

(define-public xed-coreplugins-c
  (package
    (name "xed-coreplugins-c")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xed-coreplugins-c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xed plugins: textsize, joinlines and bracketcompletion rewritten in C (fixing..")
    (description "Xed plugins: textsize, joinlines and bracketcompletion rewritten in C (fixing libpeas problems).")
    (home-page "https://codeberg.org/ItsZariep/xed-coreplugins-c")
    (license license:gpl3+)))

(define-public tash-bin
  (package
    (name "tash-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tash-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "S[tash] content that you can access later")
    (description "S[tash] content that you can access later.")
    (home-page "https://github.com/dhth/tash")
    (license license:expat)))

(define-public zerus-bin
  (package
    (name "zerus-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zerus-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight binary to download only project required crates for offline crate..")
    (description "Lightweight binary to download only project required crates for offline crates.io mirror.")
    (home-page "https://github.com/wcampbell0x2a/zerus")
    (license license:asl2.0)))

(define-public zlint
  (package
    (name "zlint")
    (version "0.7.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zlint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A linter for the Zig programming language")
    (description "A linter for the Zig programming language.")
    (home-page "https://github.com/DonIsaac/zlint")
    (license license:expat)))

(define-public psiconv
  (package
    (name "psiconv")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psiconv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "converts Psion 5(MX) files to more commonly used file formats")
    (description "Converts Psion 5(MX) files to more commonly used file formats.")
    (home-page "http://software.frodo.looijaard.name/psiconv/")
    (license license:gpl3+)))

(define-public backhand-bin
  (package
    (name "backhand-bin")
    (version "0.25.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/backhand-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "read, create and modify SquashFS File Systems")
    (description "Read, create and modify SquashFS File Systems.")
    (home-page "https://github.com/wcampbell0x2a/backhand")
    (license license:asl2.0)))

(define-public rustymeter
  (package
    (name "rustymeter")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rustymeter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A rust-based egui application to operate your OWON XDM multimeters from your ..")
    (description "A rust-based egui application to operate your OWON XDM multimeters from your PC without the need for NI VISA.")
    (home-page "https://github.com/markusdd/rusty_meter")
    (license license:expat)))

(define-public gog-hollow-knight-silksong
  (package
    (name "gog-hollow-knight-silksong")
    (version "1.0.30000")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gog-hollow-knight-silksong.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "action-adventure set in a kingdom ruled by silk and song. GOG version")
    (description "Action-adventure set in a kingdom ruled by silk and song. GOG version.")
    (home-page "https://www.gog.com/en/game/hollow_knight_silksong")
    (license license:non-copyleft)))

(define-public pam-fprint-grosshack-unlimited-timeout
  (package
    (name "pam-fprint-grosshack-unlimited-timeout")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pam-fprint-grosshack-unlimited-timeout.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PAM module enabling simultaneous fingerprint (fprintd) and password authentic..")
    (description "PAM module enabling simultaneous fingerprint (fprintd) and password authentication, with unlimited timeout support.")
    (home-page "https://fprint.freedesktop.org/")
    (license license:gpl2+)))

(define-public dream-prompter
  (package
    (name "dream-prompter")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dream-prompter.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AI-powered GIMP plugin for image generation and editing using multiple Replic..")
    (description "AI-powered GIMP plugin for image generation and editing using multiple Replicate models.")
    (home-page "https://github.com/zquestz/dream-prompter")
    (license license:expat)))

(define-public bscpylgtv
  (package
    (name "bscpylgtv")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bscpylgtv.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to control webOS based LG TV devices")
    (description "Library to control webOS based LG TV devices.")
    (home-page "https://github.com/chros73/bscpylgtv")
    (license license:expat)))

(define-public threes
  (package
    (name "threes")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/threes.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool for bringing up tailscale connected virtual machines")
    (description "A tool for bringing up tailscale connected virtual machines.")
    (home-page "https://code.fatlads.lol/threes/threes")
    (license license:bsd-3)))

(define-public montserrat-ttf
  (package
    (name "montserrat-ttf")
    (version "7.222")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/montserrat-ttf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky")
    (description "Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky.")
    (home-page "https://github.com/JulietaUla/Montserrat")
    (license license:non-copyleft)))

(define-public montserrat-otf
  (package
    (name "montserrat-otf")
    (version "7.222")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/montserrat-otf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky")
    (description "Geometric font with Cyrillic and extended Latin support by Julieta Ulanovsky.")
    (home-page "https://github.com/JulietaUla/Montserrat")
    (license license:non-copyleft)))

(define-public cruise-bin
  (package
    (name "cruise-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cruise-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cruise is a powerful, intuitive, and fully-featured container management TUI")
    (description "Cruise is a powerful, intuitive, and fully-featured container management TUI.")
    (home-page "https://cruise-org.github.io")
    (license license:asl2.0)))

(define-public ttf-lxgw-wenkai-nerd
  (package
    (name "ttf-lxgw-wenkai-nerd")
    (version "1.522")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-lxgw-wenkai-nerd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LXGW WenKai patched with Nerd Font glyphs")
    (description "LXGW WenKai patched with Nerd Font glyphs.")
    (home-page "https://github.com/Yikai-Liao/LxgwWenKaiNerdFont")
    (license license:non-copyleft)))

(define-public libtorch-cuda
  (package
    (name "libtorch-cuda")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libtorch-cuda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pyTorch C++ API")
    (description "PyTorch C++ API.")
    (home-page "https://pytorch.org/")
    (license license:bsd-3)))

(define-public hell-bin
  (package
    (name "hell-bin")
    (version "r20240711")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hell-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "haskell-based shell scripting language")
    (description "Haskell-based shell scripting language.")
    (home-page "https://github.com/chrisdone/hell")
    (license license:bsd-3)))

(define-public ghost-dl-git
  (package
    (name "ghost-dl-git")
    (version "v1.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheElevatedOne/ghost-dl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kingdom Hearts Insider Game OST Archive Dowloader CLI")
    (description "Kingdom Hearts Insider Game OST Archive Dowloader CLI.")
    (home-page "https://github.com/TheElevatedOne/ghost-dl")
    (license license:gpl3+)))

(define-public frame0
  (package
    (name "frame0")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/frame0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Balsamiq-alternative wireframming tool for modern apps")
    (description "A Balsamiq-alternative wireframming tool for modern apps.")
    (home-page "https://frame0.app")
    (license license:non-copyleft)))

(define-public whisper-cpp-cuda
  (package
    (name "whisper-cpp-cuda")
    (version "1.8.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/whisper.cpp-cuda.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "port of OpenAI's Whisper model in C/C++ (with NVIDIA CUDA optimizations)")
    (description "Port of OpenAI's Whisper model in C/C++ (with NVIDIA CUDA optimizations).")
    (home-page "https://github.com/ggerganov/whisper.cpp")
    (license license:expat)))

(define-public python-browser-cookie3
  (package
    (name "python-browser-cookie3")
    (version "0.20.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-browser-cookie3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "loads cookies used by your web browser into a cookiejar object")
    (description "Loads cookies used by your web browser into a cookiejar object.")
    (home-page "https://github.com/borisbabic/browser_cookie3")
    (license license:expat)))

(define-public tldr-lint
  (package
    (name "tldr-lint")
    (version "0.0.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tldr-lint.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "validate tldr pages")
    (description "Validate tldr pages.")
    (home-page "https://github.com/tldr-pages/tldr-lint")
    (license license:expat)))

(define-public python-wayfire
  (package
    (name "python-wayfire")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-wayfire.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wayfire compositor library")
    (description "Wayfire compositor library.")
    (home-page "https://github.com/WayfireWM/pywayfire")
    (license license:non-copyleft)))

(define-public fauxdacious-git
  (package
    (name "fauxdacious-git")
    (version "4.6.r709")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fauxdacious-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "audacious Audioplayer fork, adds DVD & video play, and much more (git version)")
    (description "Audacious Audioplayer fork, adds DVD & video play, and much more (git version).")
    (home-page "https://wildstar84.wordpress.com/fauxdacious/")
    (license license:bsd-3)))

(define-public zipzap
  (package
    (name "zipzap")
    (version "0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zipzap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "shell tool for jumping across directories in terminals")
    (description "Shell tool for jumping across directories in terminals.")
    (home-page "https://github.com/27Co/ZipZap")
    (license license:expat)))

(define-public hs80tray
  (package
    (name "hs80tray")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hs80tray.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tray indicator for Corsair HS80 Headset")
    (description "Tray indicator for Corsair HS80 Headset.")
    (home-page "https://github.com/robertoszek/hs80tray")
    (license license:expat)))
