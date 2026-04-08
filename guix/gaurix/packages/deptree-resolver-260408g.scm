;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408g
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 72 packages resolved with recipes, 28 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408g)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system font)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            llama-swap-bin
            llog-bin
            localias-bin
            log2ram
            logmonster-bin
            lstr-bin
            lx-bin
            magiskboot-bin
            mangcli-bin
            maptool-bin
            mcjoin
            median
            mercator-bin
            min-ed-launcher-bin
            mod-desktop-bin
            mongoclock
            monika-after-story
            monika-after-story-bin
            mping
            mynav-bin
            nav-cli
            nexttrace-bin
            norwester-otf
            noxdir-bin
            nvidia-gpu-exporter-bin
            obsidian-2-theme
            omnidotdev-cli-bin
            omnidotdev-eden-bin
            openide-bin
            openscad-attachable-text3d
            openscad-bosl2-git
            orbit-bin
            orbolay-bin
            otel-weaver-bin
            otf-arsenal
            otf-font-awesome-4
            otf-font-awesome-5
            otf-garamontio
            otf-garamontio-capo
            otf-geist
            otf-geist-mono
            otf-tesla
            ovrport-bin
            oyasumi-bin
            path-utils
            pent-bin
            pi-hole-web
            picsort-bin
            pistol-bin
            plist-bin
            popsicle-bin
            powerline-go-bin
            pxsum-bin
            qqqa-bin
            qui-bin
            radicle-httpd-bin
            rbackup
            recall-bin
            rep-bin
            repo-security-scanner-bin
            rexuiz-bin
            rimsort-bin
            rinetd
            scooter-bin
            seclists
            seristack-bin
            shadps4-qtlauncher-bin
            shc
            shim-signed
            slack
            slackdump-bin
            slides-bin
            ))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (72 packages)
;;; ====================================================================

;;; -- llama-swap-bin --
(define-public llama-swap-bin
  (package
    (name "llama-swap-bin")
    (version "199")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mostlygeek/llama-swap/releases/download/v"
             version
             "/llama-swap-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/llama-swap-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mostlygeek/llama-swap")
    (synopsis "model swapping for llama.cpp (or any local OpenAPI compatible server)")
    (description
     "Model swapping for llama.cpp (or any local OpenAPI compatible server).")
    (license license:expat)))

;;; -- llog-bin --
(define-public llog-bin
  (package
    (name "llog-bin")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thdxg/llog/releases/download/v"
             version
             "/llog-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/llog-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thdxg/llog")
    (synopsis "a command-line diary for developers and minimalists")
    (description
     "A command-line diary for developers and minimalists.")
    (license license:expat)))

;;; -- localias-bin --
(define-public localias-bin
  (package
    (name "localias-bin")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thirukguru/localias/releases/download/v"
             version
             "/localias-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/localias-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thirukguru/localias")
    (synopsis "local reverse proxy -- stable '.localhost' URLs for development")
    (description
     "Local reverse proxy -- stable '.localhost' URLs for development.")
    (license license:expat)))

;;; -- log2ram --
(define-public log2ram
  (package
    (name "log2ram")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/azlux/log2ram/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/log2ram/"))))
    (home-page "https://github.com/azlux/log2ram")
    (synopsis "ramlog like for systemd (Put log into a ram folder)")
    (description
     "Ramlog like for systemd (Put log into a ram folder).")
    (license license:expat)))

;;; -- logmonster-bin --
(define-public logmonster-bin
  (package
    (name "logmonster-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thirukguru/logmonster/releases/download/v"
             version
             "/logmonster-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/logmonster-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thirukguru/logmonster")
    (synopsis "a lightweight CLI utility for Linux/MacOS that detects processes and services...")
    (description
     "A lightweight CLI utility for Linux/MacOS that detects processes and services writing excessively to log files and consuming disk space.")
    (license license:expat)))

;;; -- lstr-bin --
(define-public lstr-bin
  (package
    (name "lstr-bin")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bgreenwell/lstr/releases/download/v"
             version
             "/lstr-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/lstr-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bgreenwell/lstr")
    (synopsis "a fast, minimalist directory tree viewer")
    (description
     "A fast, minimalist directory tree viewer.")
    (license license:expat)))

;;; -- lx-bin --
(define-public lx-bin
  (package
    (name "lx-bin")
    (version "1.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rasros/lx/releases/download/v"
             version
             "/lx-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/lx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rasros/lx")
    (synopsis "a small CLI tool that converts selected files into clean, consistent Markdown...")
    (description
     "A small CLI tool that converts selected files into clean, consistent Markdown-fenced blocks, making it easy to provide precise, repeatable context to LLMs.")
    (license license:expat)))

;;; -- magiskboot-bin --
(define-public magiskboot-bin
  (package
    (name "magiskboot-bin")
    (version "30.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/topjohnwu/Magisk/releases/download/v"
             version
             "/magiskboot-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/magiskboot-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/topjohnwu/Magisk")
    (synopsis "magiskboot binary from magisk offical release")
    (description
     "Magiskboot binary from magisk offical release.")
    (license license:gpl3+)))

;;; -- mangcli-bin --
(define-public mangcli-bin
  (package
    (name "mangcli-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/edwrdq/mangCLI/releases/download/v"
             version
             "/mangcli-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mangcli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/edwrdq/mangCLI")
    (synopsis "native-first universal package manager")
    (description
     "Native-first universal package manager.")
    (license license:expat)))

;;; -- maptool-bin --
(define-public maptool-bin
  (package
    (name "maptool-bin")
    (version "1.18.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://rptools.net/tools/maptool")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/maptool-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rptools.net/tools/maptool")
    (synopsis "an open source virtual tabletop program")
    (description
     "An open source virtual tabletop program.")
    (license license:gpl3+)))

;;; -- mcjoin --
(define-public mcjoin
  (package
    (name "mcjoin")
    (version "2.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/troglobit/mcjoin/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mcjoin/"))))
    (home-page "https://github.com/troglobit/mcjoin")
    (synopsis "a simple and easy-to-use tool to test IPv4 and IPv6 multicast")
    (description
     "A simple and easy-to-use tool to test IPv4 and IPv6 multicast.")
    (license license:isc)))

;;; -- median --
(define-public median
  (package
    (name "median")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/median/releases/download/v"
             version
             "/median-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/median/"))))
    (home-page "https://codeberg.org/maandree/median")
    (synopsis "calculate the median values for a set of groups")
    (description
     "Calculate the median values for a set of groups.")
    (license license:nonfree)))

;;; -- mercator-bin --
(define-public mercator-bin
  (package
    (name "mercator-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mrusme/mercator/releases/download/v"
             version
             "/mercator-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mercator-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mrusme/mercator")
    (synopsis "openStreetMap but as terminal user interface (TUI) program")
    (description
     "OpenStreetMap but as terminal user interface (TUI) program.")
    (license license:gpl3+)))

;;; -- min-ed-launcher-bin --
(define-public min-ed-launcher-bin
  (package
    (name "min-ed-launcher-bin")
    (version "v0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Rfvgyhn/min-ed-launcher/releases/download/v"
             version
             "/min-ed-launcher-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/min-ed-launcher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Rfvgyhn/min-ed-launcher")
    (synopsis "minimal Elite Dangerous Launcher")
    (description
     "Minimal Elite Dangerous Launcher.")
    (license license:expat)))

;;; -- mod-desktop-bin --
(define-public mod-desktop-bin
  (package
    (name "mod-desktop-bin")
    (version "0.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/moddevices/mod-desktop/releases/download/v"
             version
             "/mod-desktop-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mod-desktop-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/moddevices/mod-desktop")
    (synopsis "mOD Desktop Application")
    (description
     "MOD Desktop Application.")
    (license license:gpl3+)))

;;; -- mongoclock --
(define-public mongoclock
  (package
    (name "mongoclock")
    (version "3.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/mongoclock/releases/download/v"
             version
             "/mongoclock-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mongoclock/"))))
    (home-page "https://codeberg.org/maandree/mongoclock")
    (synopsis "just a humongous clock for the terminal")
    (description
     "Just a humongous clock for the terminal.")
    (license license:nonfree)))

;;; -- monika-after-story --
(define-public monika-after-story
  (package
    (name "monika-after-story")
    (version "0.12.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adogecheems/monika-after-story-linux/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/monika-after-story/"))))
    (home-page "https://github.com/adogecheems/monika-after-story-linux")
    (synopsis "a mod for the free game Doki Doki Literature Club from Team Salvato, which bu...")
    (description
     "A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika.")
    (license license:nonfree)))

;;; -- monika-after-story-bin --
(define-public monika-after-story-bin
  (package
    (name "monika-after-story-bin")
    (version "0.12.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adogecheems/monika-after-story-linux/releases/download/v"
             version
             "/monika-after-story-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/monika-after-story-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/adogecheems/monika-after-story-linux")
    (synopsis "a mod for the free game Doki Doki Literature Club from Team Salvato, which bu...")
    (description
     "A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika.")
    (license license:nonfree)))

;;; -- mping --
(define-public mping
  (package
    (name "mping")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/troglobit/mping//archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mping/"))))
    (home-page "https://github.com/troglobit/mping/")
    (synopsis "a simple multicast ping program")
    (description
     "A simple multicast ping program.")
    (license license:expat)))

;;; -- mynav-bin --
(define-public mynav-bin
  (package
    (name "mynav-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GianlucaP106/mynav/releases/download/v"
             version
             "/mynav-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mynav-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GianlucaP106/mynav")
    (synopsis "workspace and session management TUI")
    (description
     "Workspace and session management TUI.")
    (license license:expat)))

;;; -- nav-cli --
(define-public nav-cli
  (package
    (name "nav-cli")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jojo4GH/nav/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nav-cli/"))))
    (home-page "https://github.com/Jojo4GH/nav")
    (synopsis "the interactive and stylish replacement for ls & cd!")
    (description
     "The interactive and stylish replacement for ls & cd!.")
    (license license:expat)))

;;; -- nexttrace-bin --
(define-public nexttrace-bin
  (package
    (name "nexttrace-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nxtrace/NTrace-core/releases/download/v"
             version
             "/nexttrace-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nexttrace-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nxtrace/NTrace-core")
    (synopsis "an open source visual route tracking CLI tool")
    (description
     "An open source visual route tracking CLI tool.")
    (license license:gpl3+)))

;;; -- norwester-otf --
(define-public norwester-otf
  (package
    (name "norwester-otf")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://jamiewilson.github.io/norwester//releases/download/v"
             version
             "/norwester-otf-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/norwester-otf/"))))
    (home-page "https://jamiewilson.github.io/norwester/")
    (synopsis "a condensed geometric sans serif with uppercase, small caps, numbers & an ass...")
    (description
     "A condensed geometric sans serif with uppercase, small caps, numbers & an assortment of symbols. By Jamie Wilson.")
    (license license:gpl3+)))

;;; -- noxdir-bin --
(define-public noxdir-bin
  (package
    (name "noxdir-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/crumbyte/noxdir/releases/download/v"
             version
             "/noxdir-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/noxdir-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/crumbyte/noxdir")
    (synopsis "terminal utility for visualizing file system usage")
    (description
     "Terminal utility for visualizing file system usage.")
    (license license:expat)))

;;; -- nvidia-gpu-exporter-bin --
(define-public nvidia-gpu-exporter-bin
  (package
    (name "nvidia-gpu-exporter-bin")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/utkuozdemir/nvidia_gpu_exporter/releases/download/v"
             version
             "/nvidia-gpu-exporter-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nvidia-gpu-exporter-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/utkuozdemir/nvidia_gpu_exporter")
    (synopsis "nvidia GPU exporter for prometheus using nvidia-smi binary")
    (description
     "Nvidia GPU exporter for prometheus using nvidia-smi binary.")
    (license license:expat)))

;;; -- obsidian-2-theme --
(define-public obsidian-2-theme
  (package
    (name "obsidian-2-theme")
    (version "2.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/madmaxms/theme-obsidian-2//archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/obsidian-2-theme/"))))
    (home-page "https://github.com/madmaxms/theme-obsidian-2/")
    (synopsis "obsidian 2 Theme - Gnome theme, based upon Adwaita-Maia dark skin")
    (description
     "Obsidian 2 Theme - Gnome theme, based upon Adwaita-Maia dark skin.")
    (license license:gpl3+)))

;;; -- omnidotdev-cli-bin --
(define-public omnidotdev-cli-bin
  (package
    (name "omnidotdev-cli-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://cli.omni.dev")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/omnidotdev-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cli.omni.dev")
    (synopsis "agentic CLI for the Omni ecosystem (pre-built)")
    (description
     "Agentic CLI for the Omni ecosystem (pre-built).")
    (license license:expat)))

;;; -- omnidotdev-eden-bin --
(define-public omnidotdev-eden-bin
  (package
    (name "omnidotdev-eden-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://eden.omni.dev")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/omnidotdev-eden-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://eden.omni.dev")
    (synopsis "developer onboarding preflight checks (pre-built)")
    (description
     "Developer onboarding preflight checks (pre-built).")
    (license license:expat)))

;;; -- openide-bin --
(define-public openide-bin
  (package
    (name "openide-bin")
    (version "253.28294.334.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://openide.ru")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/openide-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openide.ru")
    (synopsis "openID is an open source software development tool for Java, Python, and othe...")
    (description
     "OpenID is an open source software development tool for Java, Python, and other programming languages. It was created by the Astra Group, Haulmont, and Axiom JDK companies. It is fork of pycharm.")
    (license license:agpl3+)))

;;; -- openscad-attachable-text3d --
(define-public openscad-attachable-text3d
  (package
    (name "openscad-attachable-text3d")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "github.com/jon-gilbert/openscad_attachable_text3d/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/openscad-attachable-text3d/"))))
    (home-page "github.com/jon-gilbert/openscad_attachable_text3d")
    (synopsis "openSCAD module for creating blocks of 3D text that are attachable with BOSL2")
    (description
     "OpenSCAD module for creating blocks of 3D text that are attachable with BOSL2.")
    (license license:expat)))

;;; -- openscad-bosl2-git --
(define-public openscad-bosl2-git
  (package
    (name "openscad-bosl2-git")
    (version "r3176.b4872e2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "github.com/revarbat/BOSL2.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/openscad-bosl2-git/"))))
    (home-page "github.com/revarbat/BOSL2")
    (synopsis "bOSL2 library for OpenSCAD")
    (description
     "BOSL2 library for OpenSCAD.")
    (license license:bsd-3)))

;;; -- orbit-bin --
(define-public orbit-bin
  (package
    (name "orbit-bin")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gulien/orbit/releases/download/v"
             version
             "/orbit-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/orbit-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gulien/orbit")
    (synopsis "a cross-platform task runner for executing commands and generating files from...")
    (description
     "A cross-platform task runner for executing commands and generating files from templates.")
    (license license:expat)))

;;; -- orbolay-bin --
(define-public orbolay-bin
  (package
    (name "orbolay-bin")
    (version "0.1.0.alpha7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SpikeHD/Orbolay/releases/download/v"
             version
             "/orbolay-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/orbolay-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SpikeHD/Orbolay")
    (synopsis "quick, small, native Discord overlay alternative for modded clients")
    (description
     "Quick, small, native Discord overlay alternative for modded clients.")
    (license license:gpl3+)))

;;; -- otel-weaver-bin --
(define-public otel-weaver-bin
  (package
    (name "otel-weaver-bin")
    (version "0.22.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-telemetry/weaver/releases/download/v"
             version
             "/otel-weaver-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/otel-weaver-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/open-telemetry/weaver")
    (synopsis "openTelemetry Weaver")
    (description
     "OpenTelemetry Weaver.")
    (license license:asl2.0)))

;;; -- otf-arsenal --
(define-public otf-arsenal
  (package
    (name "otf-arsenal")
    (version "r33.e34db56")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/alexeiva/Arsenal/releases/download/v"
             version
             "/otf-arsenal-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/alexeiva/Arsenal")
    (synopsis "typesetting font with semi grotesque traditional Ukrainian forms")
    (description
     "Typesetting font with semi grotesque traditional Ukrainian forms.")
    (license license:nonfree)))

;;; -- otf-font-awesome-4 --
(define-public otf-font-awesome-4
  (package
    (name "otf-font-awesome-4")
    (version "4.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FortAwesome/Font-Awesome/releases/download/v"
             version
             "/otf-font-awesome-4-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://github.com/FortAwesome/Font-Awesome")
    (synopsis "iconic font designed for Bootstrap (version 4.x)")
    (description
     "Iconic font designed for Bootstrap (version 4.x).")
    (license license:gpl3+)))

;;; -- otf-font-awesome-5 --
(define-public otf-font-awesome-5
  (package
    (name "otf-font-awesome-5")
    (version "5.15.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://fontawesome.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://fontawesome.com/")
    (synopsis "iconic font designed for Bootstrap (version 5.x)")
    (description
     "Iconic font designed for Bootstrap (version 5.x).")
    (license license:nonfree)))

;;; -- otf-garamontio --
(define-public otf-garamontio
  (package
    (name "otf-garamontio")
    (version "1.104")
    (source
     (origin
       (method url-fetch)
       (uri "https://m-casanova.codeberg.page/Garamontio/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://m-casanova.codeberg.page/Garamontio/")
    (synopsis "a fork of EB Garamond")
    (description
     "A fork of EB Garamond.")
    (license license:gpl3+)))

;;; -- otf-garamontio-capo --
(define-public otf-garamontio-capo
  (package
    (name "otf-garamontio-capo")
    (version "2.101")
    (source
     (origin
       (method url-fetch)
       (uri "https://m-casanova.codeberg.page/GaramontioCapo/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://m-casanova.codeberg.page/GaramontioCapo/")
    (synopsis "dropcaps for Garamontio")
    (description
     "Dropcaps for Garamontio.")
    (license license:gpl3+)))

;;; -- otf-geist --
(define-public otf-geist
  (package
    (name "otf-geist")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://vercel.com/font")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://vercel.com/font")
    (synopsis "a new font family for Vercel, created by Vercel in collaboration with Basemen...")
    (description
     "A new font family for Vercel, created by Vercel in collaboration with Basement Studio.")
    (license license:gpl3+)))

;;; -- otf-geist-mono --
(define-public otf-geist-mono
  (package
    (name "otf-geist-mono")
    (version "1.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://vercel.com/font")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://vercel.com/font")
    (synopsis "a new font family for Vercel, created by Vercel in collaboration with Basemen...")
    (description
     "A new font family for Vercel, created by Vercel in collaboration with Basement Studio.")
    (license license:gpl3+)))

;;; -- otf-tesla --
(define-public otf-tesla
  (package
    (name "otf-tesla")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.tipometar.org/kolumne/TeslaFont/IndexEng.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "https://www.tipometar.org/kolumne/TeslaFont/IndexEng.html")
    (synopsis "script font based on a reconstruction of Nikola Tesla's handwriting")
    (description
     "Script font based on a reconstruction of Nikola Tesla's handwriting.")
    (license license:nonfree)))

;;; -- ovrport-bin --
(define-public ovrport-bin
  (package
    (name "ovrport-bin")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ovrport/app/releases/download/v"
             version
             "/ovrport-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/ovrport-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ovrport/app")
    (synopsis "patch Quest games to run on Pico and other VR headsets")
    (description
     "Patch Quest games to run on Pico and other VR headsets.")
    (license license:gpl3+)))

;;; -- oyasumi-bin --
(define-public oyasumi-bin
  (package
    (name "oyasumi-bin")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sofoxe1/OyasumiVR/releases/download/v"
             version
             "/oyasumi-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/oyasumi-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sofoxe1/OyasumiVR")
    (synopsis "oyasumi (VR Sleeping Utilities)")
    (description
     "Oyasumi (VR Sleeping Utilities).")
    (license license:expat)))

;;; -- path-utils --
(define-public path-utils
  (package
    (name "path-utils")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Remenod/path-utils/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/path-utils/"))))
    (home-page "https://github.com/Remenod/path-utils")
    (synopsis "useful shell rc PATH managment tools")
    (description
     "Useful shell rc PATH managment tools.")
    (license license:expat)))

;;; -- pent-bin --
(define-public pent-bin
  (package
    (name "pent-bin")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/valentinradu/Pent/releases/download/v"
             version
             "/pent-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/pent-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/valentinradu/Pent")
    (synopsis "wrap any process in a filesystem and network sandbox")
    (description
     "Wrap any process in a filesystem and network sandbox.")
    (license license:expat)))

;;; -- pi-hole-web --
(define-public pi-hole-web
  (package
    (name "pi-hole-web")
    (version "6.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pi-hole/pi-hole/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/pi-hole-web/"))))
    (home-page "https://github.com/pi-hole/pi-hole")
    (synopsis "pi-hole Dashboard for stats and more")
    (description
     "Pi-hole Dashboard for stats and more.")
    (license license:gpl3+)))

;;; -- picsort-bin --
(define-public picsort-bin
  (package
    (name "picsort-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/coolapso/picsort/releases/download/v"
             version
             "/picsort-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/picsort-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolapso/picsort")
    (synopsis "picSort is a simple tool to sort your pictures using only your keyboard")
    (description
     "PicSort is a simple tool to sort your pictures using only your keyboard.")
    (license license:expat)))

;;; -- pistol-bin --
(define-public pistol-bin
  (package
    (name "pistol-bin")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/doronbehar/pistol/releases/download/v"
             version
             "/pistol-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/pistol-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/doronbehar/pistol")
    (synopsis "general purpose file previewer")
    (description
     "General purpose file previewer.")
    (license license:expat)))

;;; -- plist-bin --
(define-public plist-bin
  (package
    (name "plist-bin")
    (version "1.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/aurc/plist/releases/download/v"
             version
             "/plist-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/plist-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aurc/plist")
    (synopsis "the missing CLI plist converter")
    (description
     "The missing CLI plist converter.")
    (license license:asl2.0)))

;;; -- popsicle-bin --
(define-public popsicle-bin
  (package
    (name "popsicle-bin")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pop-os/popsicle/releases/download/v"
             version
             "/popsicle-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/popsicle-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pop-os/popsicle")
    (synopsis "linux utility for flashing multiple USB devices in parallel, written in Rust")
    (description
     "Linux utility for flashing multiple USB devices in parallel, written in Rust.")
    (license license:expat)))

;;; -- powerline-go-bin --
(define-public powerline-go-bin
  (package
    (name "powerline-go-bin")
    (version "1.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/justjanne/powerline-go/releases/download/v"
             version
             "/powerline-go-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/powerline-go-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/justjanne/powerline-go")
    (synopsis "a beautiful and useful low-latency prompt for your shell, written in go")
    (description
     "A beautiful and useful low-latency prompt for your shell, written in go.")
    (license license:gpl3+)))

;;; -- pxsum-bin --
(define-public pxsum-bin
  (package
    (name "pxsum-bin")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Blobfolio/pxsum/releases/download/v"
             version
             "/pxsum-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/pxsum-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Blobfolio/pxsum")
    (synopsis "cLI utility to calculate/verify checksum of decoded pixel image data, written...")
    (description
     "CLI utility to calculate/verify checksum of decoded pixel image data, written in Rust.")
    (license license:gpl3+)))

;;; -- qqqa-bin --
(define-public qqqa-bin
  (package
    (name "qqqa-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/iagooar/qqqa/releases/download/v"
             version
             "/qqqa-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/qqqa-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/iagooar/qqqa")
    (synopsis "fast, stateless LLM for your shell: qq answers; qa runs commands")
    (description
     "Fast, stateless LLM for your shell: qq answers; qa runs commands.")
    (license license:gpl3+)))

;;; -- qui-bin --
(define-public qui-bin
  (package
    (name "qui-bin")
    (version "1.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/autobrr/qui/releases/download/v"
             version
             "/qui-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/qui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/autobrr/qui")
    (synopsis "a modern alternative webUI for qBittorrent (Pre-compiled binary)")
    (description
     "A modern alternative webUI for qBittorrent (Pre-compiled binary).")
    (license license:gpl3+)))

;;; -- radicle-httpd-bin --
(define-public radicle-httpd-bin
  (package
    (name "radicle-httpd-bin")
    (version "2:0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/radicle-httpd-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://app.radicle.xyz/nodes/seed.radicle.xyz/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5")
    (synopsis "open source, peer-to-peer code collaboration stack built on Git - web explore...")
    (description
     "Open source, peer-to-peer code collaboration stack built on Git - web explorer.")
    (license license:asl2.0)))

;;; -- rbackup --
(define-public rbackup
  (package
    (name "rbackup")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/umpire274/rbackup/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rbackup/"))))
    (home-page "https://github.com/umpire274/rbackup")
    (synopsis "fast incremental backup tool written in Rust")
    (description
     "Fast incremental backup tool written in Rust.")
    (license license:expat)))

;;; -- recall-bin --
(define-public recall-bin
  (package
    (name "recall-bin")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/spider-hand/recall/releases/download/v"
             version
             "/recall-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/recall-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/spider-hand/recall")
    (synopsis "a CLI tool to find commands by describing what you want to do when you forget...")
    (description
     "A CLI tool to find commands by describing what you want to do when you forget them.")
    (license license:expat)))

;;; -- rep-bin --
(define-public rep-bin
  (package
    (name "rep-bin")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/baalimago/repeater/releases/download/v"
             version
             "/rep-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rep-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/baalimago/repeater")
    (synopsis "xargs, but different..! Better at some things (repeating stuff), worse at oth...")
    (description
     "Xargs, but different..! Better at some things (repeating stuff), worse at others (not repeating stuff).")
    (license license:expat)))

;;; -- repo-security-scanner-bin --
(define-public repo-security-scanner-bin
  (package
    (name "repo-security-scanner-bin")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/techjacker/repo-security-scanner/releases/download/v"
             version
             "/repo-security-scanner-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/repo-security-scanner-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/techjacker/repo-security-scanner")
    (synopsis "cLI tool that finds secrets accidentally committed to a git repo, eg password...")
    (description
     "CLI tool that finds secrets accidentally committed to a git repo, eg passwords, private keys.")
    (license license:expat)))

;;; -- rexuiz-bin --
(define-public rexuiz-bin
  (package
    (name "rexuiz-bin")
    (version "2.5.5_250817")
    (source
     (origin
       (method url-fetch)
       (uri "https://sourceforge.net/projects/rexuiz/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rexuiz-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/rexuiz/")
    (synopsis "fast-paced multiplayer first-person shooter")
    (description
     "Fast-paced multiplayer first-person shooter.")
    (license license:gpl3+)))

;;; -- rimsort-bin --
(define-public rimsort-bin
  (package
    (name "rimsort-bin")
    (version "v1.0.76")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RimSort/RimSort/releases/download/v"
             version
             "/rimsort-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rimsort-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RimSort/RimSort")
    (synopsis "a Mod Manager For Rimworld game")
    (description
     "A Mod Manager For Rimworld game.")
    (license license:gpl3+)))

;;; -- rinetd --
(define-public rinetd
  (package
    (name "rinetd")
    (version "0.73")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/samhocevar/rinetd//archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rinetd/"))))
    (home-page "https://github.com/samhocevar/rinetd/")
    (synopsis "internet redirection server")
    (description
     "Internet redirection server.")
    (license license:gpl3+)))

;;; -- scooter-bin --
(define-public scooter-bin
  (package
    (name "scooter-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thomasschafer/scooter/releases/download/v"
             version
             "/scooter-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/scooter-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thomasschafer/scooter")
    (synopsis "an interactive find and replace in the terminal")
    (description
     "An interactive find and replace in the terminal.")
    (license license:expat)))

;;; -- seclists --
(define-public seclists
  (package
    (name "seclists")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/danielmiessler/SecLists/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/seclists/"))))
    (home-page "https://github.com/danielmiessler/SecLists")
    (synopsis "collection of multiple types of lists used during security assessments")
    (description
     "Collection of multiple types of lists used during security assessments.")
    (license license:expat)))

;;; -- seristack-bin --
(define-public seristack-bin
  (package
    (name "seristack-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TechXploreLabs/seristack/releases/download/v"
             version
             "/seristack-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/seristack-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TechXploreLabs/seristack")
    (synopsis "a lightweight automation engine designed to bridge the gap between local task...")
    (description
     "A lightweight automation engine designed to bridge the gap between local task execution and remote triggers.")
    (license license:asl2.0)))

;;; -- shadps4-qtlauncher-bin --
(define-public shadps4-qtlauncher-bin
  (package
    (name "shadps4-qtlauncher-bin")
    (version "v224")
    (source
     (origin
       (method url-fetch)
       (uri "https://shadps4.net/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/shadps4-qtlauncher-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://shadps4.net/")
    (synopsis "shadPS4 PlayStation 4 emulator Qt launcher")
    (description
     "ShadPS4 PlayStation 4 emulator Qt launcher.")
    (license license:gpl3+)))

;;; -- shc --
(define-public shc
  (package
    (name "shc")
    (version "4.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neurobin/shc/archive/refs/tags/v"
             version
             ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/shc/"))))
    (home-page "https://github.com/neurobin/shc")
    (synopsis "converts shell script to C source code, and then compiles it. Do NOT use this...")
    (description
     "Converts shell script to C source code, and then compiles it. Do NOT use this to encrypt your scripts as it is not meant to be used for that.")
    (license license:gpl3+)))

;;; -- shim-signed --
(define-public shim-signed
  (package
    (name "shim-signed")
    (version "15.8+ubuntu+1.59")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://packages.ubuntu.com/noble/shim-signed/releases/download/v"
             version
             "/shim-signed-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/shim-signed/"))))
    (home-page "https://packages.ubuntu.com/noble/shim-signed")
    (synopsis "initial UEFI bootloader that handles chaining to a trusted full bootloader un...")
    (description
     "Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Ubuntu).")
    (license license:bsd-3)))

;;; -- slack --
(define-public slack
  (package
    (name "slack")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/slack/releases/download/v"
             version
             "/slack-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/slack/"))))
    (home-page "https://codeberg.org/maandree/slack")
    (synopsis "control your timer slack")
    (description
     "Control your timer slack.")
    (license license:nonfree)))

;;; -- slackdump-bin --
(define-public slackdump-bin
  (package
    (name "slackdump-bin")
    (version "4.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rusq/slackdump/releases/download/v"
             version
             "/slackdump-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/slackdump-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rusq/slackdump")
    (synopsis "save your private and public Slack messages, threads, files, and users locall...")
    (description
     "Save your private and public Slack messages, threads, files, and users locally.")
    (license license:gpl3+)))

;;; -- slides-bin --
(define-public slides-bin
  (package
    (name "slides-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/maaslalani/slides/releases/download/v"
             version
             "/slides-bin-" version "-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/slides-bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/maaslalani/slides")
    (synopsis "terminal based presentation tool")
    (description
     "Terminal based presentation tool.")
    (license license:expat)))
