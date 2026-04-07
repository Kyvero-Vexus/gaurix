;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   pre-built binary CLI tools and desktop applications.

(define-module (gaurix packages recipe-resolver-260407g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:export (topgrade-bin
            decomp-toolkit-bin
            kubefwd-bin
            shortwave-mpris-bin
            try-rs-bin
            omnidotdev-terminal-bin
            dodo-bin
            the-platinum-searcher-bin
            couik-bin
            ttylag-bin
            nekot-bin
            steamfetch-bin
            openlinkhub-bin
            dotstate-bin
            ferrite-bin
            worktrunk-bin
            rgrc-bin
            grpcurl-bin
            beszel-agent-bin
            models-bin
            caire-bin
            hadlink-bin
            goxe-bin
            devpod-bin
            gitprompt-bin
            stitchmd-bin
            wallchemy-bin
            kopia-bin
            dnslookup-bin
            converternow-bin))

;;;
;;; ── 1. topgrade-bin ────────────────────────────────────────────────
;;; System updater that upgrades all the things
;;;
(define-public topgrade-bin
  (package
    (name "topgrade-bin")
    (version "17.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/topgrade-rs/topgrade/releases/download/v"
             version "/topgrade-v" version
             "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1kydpkydj8r48mddyiy50zybbp8mc0fx12yhwivfd7mmsg531y01"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("topgrade" "bin/topgrade"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/topgrade-rs/topgrade")
    (synopsis "upgrade all the things")
    (description
     "Topgrade detects which tools you use and runs the appropriate commands
to update them.  It supports package managers, programming language
toolchains, firmware, and more.")
    (license license:gpl3)))

;;;
;;; ── 2. decomp-toolkit-bin ──────────────────────────────────────────
;;; GameCube & Wii decompilation toolkit
;;;
(define-public decomp-toolkit-bin
  (package
    (name "decomp-toolkit-bin")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/encounter/decomp-toolkit/releases/download/v"
             version "/dtk-linux-x86_64"))
       (sha256
        (base32 "12r1bk24akykrq9p3f89vr15crbi8kgjv03jp375q4sm97h6xv4c"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/decomp-toolkit"))
            (chmod (string-append bin "/decomp-toolkit") #o755)
            (symlink "decomp-toolkit" (string-append bin "/dtk"))
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/encounter/decomp-toolkit")
    (synopsis "GameCube and Wii decompilation toolkit")
    (description
     "A collection of tools for working with GameCube and Wii game
binaries.  Includes DOL/REL processing, symbol analysis, and
decompilation support.")
    (license (list license:expat license:asl2.0))))

;;;
;;; ── 3. kubefwd-bin ─────────────────────────────────────────────────
;;; Kubernetes port-forwarding utility
;;;
(define-public kubefwd-bin
  (package
    (name "kubefwd-bin")
    (version "1.25.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/txn2/kubefwd/releases/download/v"
             version "/kubefwd_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1wil2lk4n5zj61ddrrwvmnwqwmzi63wcgk35j8ci28b71mpmjyq4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kubefwd" "bin/kubefwd"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/txn2/kubefwd")
    (synopsis "port forward Kubernetes pods to local machine")
    (description
     "Kubefwd is a command line utility that bulk forwards services in one
or more namespaces so that developers can access them locally using
their cluster DNS names.")
    (license license:asl2.0)))

;;;
;;; ── 4. shortwave-mpris-bin ─────────────────────────────────────────
;;; Internet radio player with MPRIS and DLNA/Cast support
;;;
(define-public shortwave-mpris-bin
  (package
    (name "shortwave-mpris-bin")
    (version "5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ixnewton/Shortwave-MPRIS/releases/download/v"
             version "/shortwave-mpris-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "15zmj2mk470aapc90vflxjzdix242x9yrhh78cskw0iwrmbskry3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("shortwave" "bin/shortwave")
          ("shortwave-mpris.desktop" "share/applications/shortwave-mpris.desktop")
          ("de.haeckerfelix.Shortwave.gresource"
           "share/shortwave/de.haeckerfelix.Shortwave.gresource"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ixnewton/Shortwave-MPRIS")
    (synopsis "internet radio player with MPRIS and DLNA support")
    (description
     "Shortwave MPRIS is an internet radio player with extended MPRIS
support, DLNA/UPnP and Google Cast device support, plus an FFmpeg
proxy for incompatible streams.")
    (license license:gpl3)))

;;;
;;; ── 5. try-rs-bin ──────────────────────────────────────────────────
;;; CLI tool to manage temporary projects
;;;
(define-public try-rs-bin
  (package
    (name "try-rs-bin")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tassiovirginio/try-rs/releases/download/v"
             version "/try-rs-v" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "08mr6db0kxbxxd8c38smh2x30dsgg2ikzyb9vwxv00n354jb305v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("try-rs" "bin/try-rs"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tassiovirginio/try-rs")
    (synopsis "CLI tool to manage temporary projects")
    (description
     "Try-rs is a CLI tool designed to manage the chaos of temporary
projects.  Create, list, and clean up throwaway project directories.")
    (license license:expat)))

;;;
;;; ── 6. omnidotdev-terminal-bin ─────────────────────────────────────
;;; GPU-accelerated terminal emulator
;;;
(define-public omnidotdev-terminal-bin
  (package
    (name "omnidotdev-terminal-bin")
    (version "0.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/omnidotdev/terminal/releases/download/v"
             version "/omni-terminal-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "181js58gs61khdgy5yw46wxnij7ll215r7ahpzs5cvf7ijf7pn6c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("omni-terminal" "bin/omni-terminal"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/omnidotdev/terminal")
    (synopsis "GPU-accelerated terminal emulator")
    (description
     "Omni Terminal is a GPU-accelerated terminal emulator built to run
everywhere.  Pre-built binary release.")
    (license license:expat)))

;;;
;;; ── 7. dodo-bin ────────────────────────────────────────────────────
;;; Fast PDF reader built with Qt and MuPDF
;;;
(define-public dodo-bin
  (package
    (name "dodo-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dheerajshenoy/dodo/releases/download/v"
             version "/dodo_" version "_amd64.deb"))
       (sha256
        (base32 "0wzipsyb2g2ba6jc9b5s37dldrmfmd9cniq5ishsird49dp2x0s5"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list patchelf))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "/bin/ar")))
            ;; Extract deb
            (invoke ar "x" src)
            ;; Extract data tarball
            (when (file-exists? "data.tar.zst")
              (invoke (search-input-file %build-inputs "/bin/zstd")
                      "-d" "data.tar.zst"))
            (when (file-exists? "data.tar.xz")
              (invoke (search-input-file %build-inputs "/bin/xz")
                      "-d" "data.tar.xz"))
            (invoke (search-input-file %build-inputs "/bin/tar")
                    "xf" (if (file-exists? "data.tar") "data.tar" "data.tar.gz"))
            (mkdir-p bin)
            (when (file-exists? "usr/bin/dodo")
              (copy-file "usr/bin/dodo" (string-append bin "/dodo"))
              (chmod (string-append bin "/dodo") #o755))
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dheerajshenoy/dodo")
    (synopsis "fast PDF reader built with Qt and MuPDF")
    (description
     "Dodo is a fast and configurable PDF reader built with Qt and MuPDF.
Pre-built binary from upstream Debian package.")
    (license license:agpl3+)))

;;;
;;; ── 8. the-platinum-searcher-bin ───────────────────────────────────
;;; Code search tool similar to ag and ripgrep
;;;
(define-public the-platinum-searcher-bin
  (package
    (name "the-platinum-searcher-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/monochromegane/the_platinum_searcher/"
             "releases/download/v" version "/pt_linux_amd64.tar.gz"))
       (sha256
        (base32 "1n2yg79wq1hg176vw038c62cv426lbf3ld41spcdvvx4bslsya99"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pt_linux_amd64/pt" "bin/pt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/monochromegane/the_platinum_searcher")
    (synopsis "code search tool similar to ag and ripgrep")
    (description
     "The Platinum Searcher (pt) is a code search tool similar to ack,
The Silver Searcher (ag), and ripgrep (rg).  Written in Go for
speed and portability.")
    (license license:expat)))

;;;
;;; ── 9. couik-bin ───────────────────────────────────────────────────
;;; TUI typing game
;;;
(define-public couik-bin
  (package
    (name "couik-bin")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Fadilix/couik/releases/download/v"
             version "/couik_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0wyn2hmdg7rhlz67pphhv0nnjkvhgn8g8m3njyzpy6cygd9f9xpl"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("couik" "bin/couik"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Fadilix/couik")
    (synopsis "fast TUI typing game written in Go")
    (description
     "Couik is a fast TUI typing game written in Go.  Practice your
typing speed and accuracy directly in the terminal.")
    (license license:expat)))

;;;
;;; ── 10. ttylag-bin ─────────────────────────────────────────────────
;;; Simulate laggy terminal connections
;;;
(define-public ttylag-bin
  (package
    (name "ttylag-bin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cbrunnkvist/ttylag/releases/download/"
             version "/ttylag_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "1ih4bp0d5vcybk1sgpcm1ks557c7sz1nfa485v9ynz4c64lxn3hs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ttylag" "bin/ttylag"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cbrunnkvist/ttylag")
    (synopsis "simulate laggy SSH or serial terminal connections")
    (description
     "Ttylag lets you simulate laggy SSH, flaky 3G, or 9600 baud serial
links for local terminal applications.  Useful for testing how
programs handle slow connections.")
    (license license:expat)))

;;;
;;; ── 11. nekot-bin ──────────────────────────────────────────────────
;;; Portable terminal AI interface
;;;
(define-public nekot-bin
  (package
    (name "nekot-bin")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/BalanceBalls/nekot/releases/download/v"
             version "/nekot_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "186sdfav49j7mrdbin8xcfii0c5fd3ib03ky0gsr77x7l5yhwqy6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nekot" "bin/nekot"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BalanceBalls/nekot")
    (synopsis "portable terminal AI interface")
    (description
     "Nekot is a portable terminal AI interface.  Chat with language
models directly from your terminal.")
    (license license:expat)))

;;;
;;; ── 12. steamfetch-bin ─────────────────────────────────────────────
;;; Display Steam stats in terminal
;;;
(define-public steamfetch-bin
  (package
    (name "steamfetch-bin")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unhappychoice/steamfetch/releases/download/v"
             version "/steamfetch-v" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0wb7mri3z9ijzg3q5hlh5660rq4c7i8rj9i2jbhlrp9ny6041jnr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("steamfetch" "bin/steamfetch"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unhappychoice/steamfetch")
    (synopsis "display Steam gaming stats in the terminal")
    (description
     "Steamfetch is like neofetch but for Steam.  Display your Steam
gaming stats, playtime, and library information in the terminal.")
    (license license:isc)))

;;;
;;; ── 13. openlinkhub-bin ────────────────────────────────────────────
;;; Corsair iCUE LINK Hub controller for Linux
;;;
(define-public openlinkhub-bin
  (package
    (name "openlinkhub-bin")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jurkovic-nikola/OpenLinkHub/releases/download/"
             version "/OpenLinkHub_" version "_amd64.tar.gz"))
       (sha256
        (base32 "1srga1icrbjwy9awrx3bzka37f42h4m6ynrm3jq9g102bzn7dj48"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("OpenLinkHub" "bin/openlinkhub"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jurkovic-nikola/OpenLinkHub")
    (synopsis "open source Corsair iCUE LINK Hub controller for Linux")
    (description
     "OpenLinkHub is an open source Linux interface for iCUE LINK Hub and
other Corsair AIOs and hubs.  Control RGB lighting and fan speeds.")
    (license license:gpl3)))

;;;
;;; ── 14. dotstate-bin ───────────────────────────────────────────────
;;; Modern dotfile manager
;;;
(define-public dotstate-bin
  (package
    (name "dotstate-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/serkanyersen/dotstate/releases/download/v"
             version "/dotstate-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "1dvkv33l0diz9di07bsfpc3g6czvmxr8nchzcblnlxaa2783cap0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dotstate" "bin/dotstate"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/serkanyersen/dotstate")
    (synopsis "modern and secure dotfile manager")
    (description
     "Dotstate is a modern, secure, and user-friendly dotfile manager.
Track and synchronize your configuration files across machines.")
    (license license:expat)))

;;;
;;; ── 15. ferrite-bin ────────────────────────────────────────────────
;;; Lightweight text editor for structured formats
;;;
(define-public ferrite-bin
  (package
    (name "ferrite-bin")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OlaProeis/Ferrite/releases/download/v"
             version "/ferrite-linux-x64.tar.gz"))
       (sha256
        (base32 "1g6j6jhya43pwbw5ahl3g40wwjyfb3p917mji3lkaaqa8b7agbpi"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ferrite" "bin/ferrite"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OlaProeis/Ferrite")
    (synopsis "fast lightweight text editor for Markdown, JSON, and YAML")
    (description
     "Ferrite is a fast, lightweight text editor for Markdown, JSON, YAML,
and TOML files.  Pre-built binary release.")
    (license license:expat)))

;;;
;;; ── 16. worktrunk-bin ──────────────────────────────────────────────
;;; Git worktree management CLI
;;;
(define-public worktrunk-bin
  (package
    (name "worktrunk-bin")
    (version "0.30.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/max-sixty/worktrunk/releases/download/v"
             version "/worktrunk-x86_64-unknown-linux-musl.tar.xz"))
       (sha256
        (base32 "1n902z3fh8zhaba9khjivxaz5sf86fzs2i7dahqcqas38bk7cp2s"))))
    (build-system copy-build-system)
    (native-inputs (list xz))
    (arguments
     (list
      #:install-plan
      #~'(("wt" "bin/wt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/max-sixty/worktrunk")
    (synopsis "CLI for git worktree management")
    (description
     "Worktrunk is a CLI for git worktree management, designed for running
AI agents in parallel.  Simplifies creating and managing worktrees.")
    (license (list license:expat license:asl2.0))))

;;;
;;; ── 17. rgrc-bin ───────────────────────────────────────────────────
;;; Rusty Generic Colouriser
;;;
(define-public rgrc-bin
  (package
    (name "rgrc-bin")
    (version "0.6.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lazywalker/rgrc/releases/download/v"
             version "/rgrc-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "078x4pam626q0hqfmp886hqi35vsv59hjl7wgfbdbwk8f6wr5k5p"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rgrc" "bin/rgrc"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lazywalker/rgrc")
    (synopsis "rusty generic colouriser like grc but faster")
    (description
     "RGRC (Rusty Generic Colouriser) is like grc but faster and with more
features.  Colorize the output of any command in the terminal.")
    (license license:expat)))

;;;
;;; ── 18. grpcurl-bin ────────────────────────────────────────────────
;;; Like cURL but for gRPC
;;;
(define-public grpcurl-bin
  (package
    (name "grpcurl-bin")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fullstorydev/grpcurl/releases/download/v"
             version "/grpcurl_" version "_linux_x86_64.tar.gz"))
       (sha256
        (base32 "1mfi24xx4vcxlxkqgfwjkpil44jganpb6dl7xxrwyz3qhlmbc9m9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("grpcurl" "bin/grpcurl"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fullstorydev/grpcurl")
    (synopsis "command-line tool for interacting with gRPC servers")
    (description
     "Grpcurl is like cURL but for gRPC.  It is a command-line tool that
lets you interact with gRPC servers, inspect services, and invoke
RPCs.")
    (license license:expat)))

;;;
;;; ── 19. beszel-agent-bin ───────────────────────────────────────────
;;; Lightweight monitoring agent
;;;
(define-public beszel-agent-bin
  (package
    (name "beszel-agent-bin")
    (version "0.18.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/henrygd/beszel/releases/download/v"
             version "/beszel-agent_linux_amd64_glibc.tar.gz"))
       (sha256
        (base32 "052kpzbpb9a852gjkbh7s62vg9x58qr75wvgx9s0km3c7rhmp1xf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("beszel-agent" "bin/beszel-agent"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/henrygd/beszel")
    (synopsis "lightweight server monitoring agent")
    (description
     "Beszel agent is a lightweight monitoring agent that collects system
metrics and reports them to a Beszel hub for dashboard visualization.")
    (license license:expat)))

;;;
;;; ── 20. models-bin ─────────────────────────────────────────────────
;;; TUI for browsing AI models and benchmarks
;;;
(define-public models-bin
  (package
    (name "models-bin")
    (version "0.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arimxyer/models/releases/download/v"
             version "/models-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1qdr4gqbldfy90j9jdgs4q6zwnhlhbv744ca6wi5628fv6x22j1k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("models" "bin/models"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arimxyer/models")
    (synopsis "TUI and CLI for browsing AI models and benchmarks")
    (description
     "Models is a fast TUI and CLI for browsing AI models, benchmarks, and
coding agents.  Compare model capabilities from the terminal.")
    (license license:expat)))

;;;
;;; ── 21. caire-bin ──────────────────────────────────────────────────
;;; Content-aware image resizing
;;;
(define-public caire-bin
  (package
    (name "caire-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/esimov/caire/releases/download/v"
             version "/caire-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "193zd6zcg00brjbfcdj4mkhs0s1mb2h0g42cwizwlwdfxwfj48xp"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("caire" "bin/caire"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/esimov/caire")
    (synopsis "content-aware image resize using seam carving")
    (description
     "Caire is a content-aware image resize library and CLI based on seam
carving.  Intelligently resize images while preserving important
visual content.")
    (license license:expat)))

;;;
;;; ── 22. hadlink-bin ────────────────────────────────────────────────
;;; URL shortener with formally verified core
;;;
(define-public hadlink-bin
  (package
    (name "hadlink-bin")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Jbsco/hadlink/releases/download/v"
             version "/hadlink-linux-x64.tar.gz"))
       (sha256
        (base32 "02qx6rg6pkh4dg70j0pnlhf6vmyyy66fyivpk53hs0k8jl2g9a73"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hadlink-shorten" "bin/hadlink-shorten")
          ("hadlink-redirect" "bin/hadlink-redirect"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Jbsco/hadlink")
    (synopsis "high-assurance URL shortener with verified SPARK core")
    (description
     "Hadlink is a high-assurance URL shortener with a formally verified
SPARK core.  Includes both the shortening service and redirect
server as separate binaries.")
    (license license:agpl3+)))

;;;
;;; ── 23. goxe-bin ───────────────────────────────────────────────────
;;; Log reduction tool
;;;
(define-public goxe-bin
  (package
    (name "goxe-bin")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DumbNoxx/goxe/releases/download/v"
             version "/goxe_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0wfbkk1vs59ydknb1mb3z5jcvr8mw17r3b2s3wil67w338zsy9r2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("goxe" "bin/goxe"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DumbNoxx/goxe")
    (synopsis "log reduction tool that normalizes and aggregates messages")
    (description
     "Goxe is a log reduction tool that normalizes, filters, and aggregates
repeated messages to reduce noise and storage.  Useful for
high-volume log processing.")
    (license license:asl2.0)))

;;;
;;; ── 24. devpod-bin ─────────────────────────────────────────────────
;;; Open-source Codespaces alternative
;;;
(define-public devpod-bin
  (package
    (name "devpod-bin")
    (version "0.6.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/loft-sh/devpod/releases/download/v"
             version "/DevPod_linux_x86_64.tar.gz"))
       (sha256
        (base32 "1as2q3adxhx00c4kww7yzxgjrk58yrq0v5q4frq4aapr4qrxcnvc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("devpod-cli" "bin/devpod-cli")
          ("dev-pod-desktop" "bin/dev-pod-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/loft-sh/devpod")
    (synopsis "open-source Codespaces alternative, client-only")
    (description
     "DevPod is Codespaces but open-source, client-only, and
unopinionated.  Create reproducible developer environments on any
infrastructure.")
    (license license:mpl2.0)))

;;;
;;; ── 25. gitprompt-bin ──────────────────────────────────────────────
;;; Informative git prompt for zsh and bash
;;;
(define-public gitprompt-bin
  (package
    (name "gitprompt-bin")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abhinav/gitprompt/releases/download/v"
             version "/gitprompt_" version "_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "06bahnc2q1bs7np5153y9vhfyd04xsha1w3fvls3vfyjpvms02m7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gitprompt" "bin/gitprompt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abhinav/gitprompt")
    (synopsis "informative git prompt for zsh and bash")
    (description
     "Gitprompt provides an informative git prompt for zsh and bash.
Shows branch, status, ahead/behind, and other useful git information.")
    (license license:expat)))

;;;
;;; ── 26. stitchmd-bin ───────────────────────────────────────────────
;;; Stitch Markdown files together
;;;
(define-public stitchmd-bin
  (package
    (name "stitchmd-bin")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abhinav/stitchmd/releases/download/v"
             version "/stitchmd-linux-amd64.tar.gz"))
       (sha256
        (base32 "03dx2vcxg7drdci8kvlmmqsfdj3zr9nrsfdjs8ljqazj4b57rjhg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("stitchmd" "bin/stitchmd"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abhinav/stitchmd")
    (synopsis "stitch multiple Markdown files into one document")
    (description
     "Stitchmd stitches multiple Markdown files together into a single
document.  Useful for combining documentation from multiple sources.")
    (license license:gpl2)))

;;;
;;; ── 27. wallchemy-bin ──────────────────────────────────────────────
;;; CLI wallpaper fetcher
;;;
(define-public wallchemy-bin
  (package
    (name "wallchemy-bin")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/davenicholson-xyz/wallchemy/releases/download/v"
             version "/wallchemy-linux-amd64-v" version ".tar.gz"))
       (sha256
        (base32 "10zmp1sh1syw0955v4xp8c2as85cfi07bp3w0fajjzla7pr080x7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("wallchemy" "bin/wallchemy"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/davenicholson-xyz/wallchemy")
    (synopsis "CLI tool for fetching wallpapers from wallhaven.cc")
    (description
     "Wallchemy is a CLI tool for fetching wallpapers from wallhaven.cc.
Search and download high-quality wallpapers from the terminal.")
    (license license:expat)))

;;;
;;; ── 28. kopia-bin ──────────────────────────────────────────────────
;;; Backup tool with encryption and deduplication
;;;
(define-public kopia-bin
  (package
    (name "kopia-bin")
    (version "0.22.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kopia/kopia/releases/download/v"
             version "/kopia_" version "_linux_amd64.deb"))
       (sha256
        (base32 "1s95blmnd98davvg91db9lfyzqs04pvbqjrjfaz3kg0af63nfmsc"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar  (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip")))
            (invoke ar "x" src)
            (invoke tar "xf" "data.tar.gz")
            (mkdir-p bin)
            (copy-file "usr/bin/kopia" (string-append bin "/kopia"))
            (chmod (string-append bin "/kopia") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kopia/kopia")
    (synopsis "cross-platform backup tool with encryption and deduplication")
    (description
     "Kopia is a cross-platform backup tool with fast incremental backups,
client-side end-to-end encryption, compression, deduplication, and
cloud storage support.")
    (license license:asl2.0)))

;;;
;;; ── 29. dnslookup-bin ──────────────────────────────────────────────
;;; DNS lookup utility
;;;
(define-public dnslookup-bin
  (package
    (name "dnslookup-bin")
    (version "1.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ameshkov/dnslookup/releases/download/v"
             version "/dnslookup-linux-amd64-v" version ".tar.gz"))
       (sha256
        (base32 "0chrr6av1pgx668vq4y2nrhary91pw499px2j4anmzhpifypzvv5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dnslookup" "bin/dnslookup"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ameshkov/dnslookup")
    (synopsis "simple DNS lookup utility supporting DoH, DoT, and DoQ")
    (description
     "Dnslookup is a simple command-line utility to make DNS lookups.
Supports DNS-over-HTTPS, DNS-over-TLS, DNS-over-QUIC, and
DNSCrypt protocols.")
    (license license:expat)))

;;;
;;; ── 30. converternow-bin ───────────────────────────────────────────
;;; Unit converter application
;;;
(define-public converternow-bin
  (package
    (name "converternow-bin")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ferraridamiano/ConverterNOW/releases/download/v"
             version "/converternow-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0mas1sa8inxnibl5v2n90bip75jw7ylvv45bd3wqv0w7nzh7qais"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (opt (string-append out "/opt/converternow"))
                 (bin (string-append out "/bin"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (src (assoc-ref %build-inputs "source")))
            (invoke tar (string-append "--use-compress-program=" gzip)
                    "-xf" src)
            (mkdir-p opt)
            (copy-recursively "converternow-linux-x86_64" opt)
            (mkdir-p bin)
            (chmod (string-append opt "/converternow") #o755)
            (symlink (string-append opt "/converternow")
                     (string-append bin "/converternow"))
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ferraridamiano/ConverterNOW")
    (synopsis "unit converter application for Linux")
    (description
     "ConverterNOW is a unit converter application that is easy, immediate,
and multi-platform.  Convert between hundreds of units across many
categories.")
    (license license:gpl3+)))
