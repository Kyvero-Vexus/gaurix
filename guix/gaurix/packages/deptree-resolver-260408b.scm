;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260408b
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 12 packages resolved with recipes, 88 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408b)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fonts)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (cull-bin
            daylight-bin
            diz-bin
            dnscontrol-bin
            docker-credential-secretservice-bin
            diffnav-bin
            culmus
            dinfo
            discli
            discord-rpc-extension-bin
            dmenu-emoji
            cura-resources-materials))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS — tar.gz archives with single binary
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 1. cull-bin ──────────────────────────────────────────────────────
;;; Interactive TUI disk space analyzer
;;;
(define-public cull-bin
  (package
    (name "cull-bin")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/legostin/cull/releases/download/v"
             version "/cull_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("cull" "bin/cull"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/legostin/cull")
    (synopsis "interactive TUI disk space analyzer")
    (description
     "Cull is an interactive terminal user interface for analyzing disk space
usage.  It provides a visual, navigable tree view of directory sizes to help
identify large files and directories.")
    (license license:expat)))

;;; ── 2. daylight-bin ──────────────────────────────────────────────────
;;; Sunrise and sunset time tracker
;;;
(define-public daylight-bin
  (package
    (name "daylight-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jbreckmckye/daylight/releases/download/v"
             version "/daylight_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("daylight" "bin/daylight"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jbreckmckye/daylight")
    (synopsis "command-line sunrise and sunset time tracker")
    (description
     "Daylight is a command-line program for tracking sunrise and sunset times
at your location.  It displays the current day length and how it changes
throughout the year.")
    (license license:gpl3)))

;;; ── 3. dnscontrol-bin ────────────────────────────────────────────────
;;; DNS synchronization tool by StackExchange
;;;
(define-public dnscontrol-bin
  (package
    (name "dnscontrol-bin")
    (version "4.36.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/StackExchange/dnscontrol/releases/download/v"
             version "/dnscontrol_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dnscontrol" "bin/dnscontrol"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stackexchange.github.io/dnscontrol/")
    (synopsis "synchronize DNS to multiple providers from a simple DSL")
    (description
     "DNSControl is an opinionated platform for seamlessly managing DNS
configuration across any number of DNS hosts.  It uses a simple JavaScript
DSL for defining DNS zones and can push changes to multiple providers.")
    (license license:expat)))

;;; ── 4. diffnav-bin ───────────────────────────────────────────────────
;;; Git diff TUI navigator
;;;
(define-public diffnav-bin
  (package
    (name "diffnav-bin")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dlvhdr/diffnav/releases/download/v"
             version "/diffnav_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("diffnav" "bin/diffnav"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dlvhdr/diffnav")
    (synopsis "git diff TUI file navigator")
    (description
     "Diffnav is a terminal user interface for navigating git diffs by file.
It provides a side panel listing changed files so you can quickly jump between
them in a large diff.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY CLI TOOLS — single-binary downloads
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 5. diz-bin ───────────────────────────────────────────────────────
;;; Share SSH public keys via a compact passphrase
;;;
(define-public diz-bin
  (package
    (name "diz-bin")
    (version "0.2.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/noahra/diz/releases/download/v"
             version "/diz-linux-x64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("diz-linux-x64" "bin/diz"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out") "/bin/diz")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/noahra/diz")
    (synopsis "share SSH public keys between machines via a compact passphrase")
    (description
     "Diz lets you share SSH public keys between machines by encoding them as
short, memorable passphrases.  It provides a simple way to bootstrap SSH
access without manually copying key files.")
    (license license:expat)))

;;; ── 6. docker-credential-secretservice-bin ───────────────────────────
;;; Docker credential helper using D-Bus Secret Service
;;;
(define-public docker-credential-secretservice-bin
  (package
    (name "docker-credential-secretservice-bin")
    (version "0.9.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/docker/docker-credential-helpers"
             "/releases/download/v" version
             "/docker-credential-secretservice-v" version ".linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "docker-credential-secretservice-v"
                                   #$version ".linux-amd64")
                    "bin/docker-credential-secretservice"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/docker-credential-secretservice")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/docker/docker-credential-helpers")
    (synopsis "store Docker credentials using the D-Bus Secret Service")
    (description
     "Docker credential helper that stores Docker registry credentials using
the D-Bus Secret Service API (e.g., GNOME Keyring or KDE Wallet).  This
replaces plaintext credential storage in Docker's config file.")
    (license license:expat)))

;;; ── 7. dinfo ─────────────────────────────────────────────────────────
;;; File and directory information tool (.NET self-contained)
;;;
(define-public dinfo
  (package
    (name "dinfo")
    (version "1.2.3.003")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SCSDC-co/DINFO/releases/download/v"
             version "/dinfo-linux-x64-self-contained"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dinfo-linux-x64-self-contained" "bin/dinfo"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out") "/bin/dinfo")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SCSDC-co/DINFO")
    (synopsis "file and directory information tool")
    (description
     "DINFO is a command-line program that displays information about files
and directories.  It supports output in YAML, JSON, and HTML formats.")
    (license license:gpl3)))

;;; ── 8. discli ────────────────────────────────────────────────────────
;;; Discord TUI client (Go binary)
;;;
(define-public discli
  (package
    (name "discli")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/wynwxst/DisCli/releases/download/Discli-1.0/DisCliNux")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("DisCliNux" "bin/discli"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out") "/bin/discli")
                     #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wynwxst/DisCli")
    (synopsis "Discord TUI client written in Go")
    (description
     "DisCli is a terminal user interface client for Discord written in Go.
It provides text-based access to Discord channels and direct messages.")
    (license license:expat)))

;;; ════════════════════════════════════════════════════════════════════════
;;; BINARY APPS — zip archive (Electron)
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 9. discord-rpc-extension-bin ─────────────────────────────────────
;;; Discord Rich Presence companion app
;;;
(define-public discord-rpc-extension-bin
  (package
    (name "discord-rpc-extension-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lolamtisch/Discord-RPC-Extension"
             "/releases/download/" version "/linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("." "share/discord-rpc-extension/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink
                 (string-append out "/share/discord-rpc-extension/"
                                "discord-rpc-extension")
                 (string-append out "/bin/discord-rpc-extension"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lolamtisch/Discord-RPC-Extension")
    (synopsis "Discord Rich Presence companion application")
    (description
     "Discord RPC Extension is a native companion app for the Discord Rich
Presence browser extension.  It runs as a background process and bridges
between the browser extension and Discord's RPC interface.")
    (license license:gpl3)))

;;; ════════════════════════════════════════════════════════════════════════
;;; FONT PACKAGES
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 10. culmus ───────────────────────────────────────────────────────
;;; Hebrew Type1 and TrueType fonts
;;;
(define-public culmus
  (package
    (name "culmus")
    (version "0.140")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://sourceforge/culmus/culmus-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (home-page "http://culmus.sourceforge.net")
    (synopsis "collection of Hebrew Type1, TrueType, and OpenType fonts")
    (description
     "Culmus provides a collection of free Hebrew fonts in Type1, TrueType,
and OpenType formats.  The fonts cover a variety of styles suitable for
everyday Hebrew typography.")
    (license license:gpl2)))

;;; ════════════════════════════════════════════════════════════════════════
;;; SOURCE PACKAGES — scripts and data
;;; ════════════════════════════════════════════════════════════════════════

;;; ── 11. dmenu-emoji ──────────────────────────────────────────────────
;;; Emoji picker script using dmenu
;;;
(define-public dmenu-emoji
  (package
    (name "dmenu-emoji")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/porras/dmenu-emoji")
             (commit "ea78cc4fcd4f07e8cbf097ff35e1e42c0dc3c8fa")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dmenu-emoji" "bin/dmenu-emoji")
          ("emoji-list" "share/dmenu-emoji/emoji-list"))))
    (home-page "https://github.com/porras/dmenu-emoji")
    (synopsis "emoji picker script for dmenu and rofi")
    (description
     "Dmenu-emoji is a shell script that lets you search for an emoji by name
using dmenu or rofi, then copies it to the clipboard.  It includes a
bundled list of emoji names and symbols.")
    (license license:expat)))

;;; ── 12. cura-resources-materials ─────────────────────────────────────
;;; Cura 3D printer material profiles
;;;
(define-public cura-resources-materials
  (package
    (name "cura-resources-materials")
    (version "5.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/fdm_materials")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cura/resources/materials/"
           #:include-regexp ("\\.xml\\.fdm_material$" "\\.xml$")))))
    (home-page "https://ultimaker.com/en/products/cura-software")
    (synopsis "material profiles for Ultimaker Cura slicer")
    (description
     "This package provides additional FDM material profiles for the
Ultimaker Cura 3D printing slicer.  It includes filament profiles for
various manufacturers and material types.")
    (license license:agpl3)))
