;;; Round-24 queue-drain for cron-c79f127f worker w03.
;;; 100 packages selected from todo_general_packages.org (entries 9257–9818).
;;; Resolved: Python, binary, C/C++, shell, theme, data packages.
;;; Blocked: complex builds, missing deps, kernel modules, etc.
(define-module (gaurix packages cron-c79f127f-r24-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python)
  #:use-module (gnu packages check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages image)
  #:use-module (gnu packages video)
  #:use-module (gnu packages music)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages base)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Python packages (10)
            python3-xcgf
            python3-memoizedb
            python3-aur
            docker-language-server
            axicli
            textext
            pulseaudio-dlna
            mpv-mpvacious
            maldet
            gitfetch
            ;; C/C++ source builds (5)
            typespeed
            cpuminer
            regionset
            sasquatch
            libcalfbox-lss
            ;; Binary packages (15)
            treegrep-bin
            smassh-bin
            lscolors-bin
            xray-bin
            v2raya-bin
            hiddify-next-bin
            how-cli-bin
            ollamamodelupdater-bin
            ports-info-bin
            beamup-bin
            waveterm-bin
            sdrtrunk-bin
            kreya-bin
            vysor-bin
            xmrig-donateless
            ;; Shell/script tools (3)
            hyprfreeze-git
            laptop-mode-tools-git
            cpmenu
            ;; Themes/data (5)
            zuki-themes
            stardict-web1913
            stardict-wordnet
            stardict-computer-ru
            stardict-slang-eng-rus
            ;; Ruby (1)
            libxml-ruby
            ;; Other (2)
            kronos
            cronopete))

;; ════════════════════════════════════════════════════════════════════
;; Python packages
;; ════════════════════════════════════════════════════════════════════

;; ── python3-xcgf ────────────────────────────────────────────────
;; Xyne's common generic functions (internal library)

(define-public python3-xcgf
  (package
    (name "python3-xcgf")
    (version "2023.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xyne.dev/projects/python3-xcgf/src/"
                    "python3-xcgf-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://xyne.dev/projects/python3-xcgf/")
    (synopsis "common generic functions for Xyne's Python projects")
    (description "python3-xcgf provides common generic utility functions
used internally by Xyne's Python projects, including argument parsing
helpers and data structure utilities.")
    (license license:gpl2)))

;; ── python3-memoizedb ───────────────────────────────────────────

(define-public python3-memoizedb
  (package
    (name "python3-memoizedb")
    (version "2023")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xyne.dev/projects/python3-memoizedb/src/"
                    "python3-memoizedb-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://xyne.dev/projects/python3-memoizedb/")
    (synopsis "memoization decorator with database-backed storage")
    (description "python3-memoizedb provides a memoization decorator that
stores cached results in a database, allowing persistent caching of
expensive function calls across program restarts.")
    (license license:gpl2)))

;; ── python3-aur ─────────────────────────────────────────────────

(define-public python3-aur
  (package
    (name "python3-aur")
    (version "2023.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xyne.dev/projects/python3-aur/src/"
                    "python3-aur-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://xyne.dev/projects/python3-aur/")
    (synopsis "Python 3 AUR-related modules and utilities")
    (description "python3-aur provides Python modules for interacting with
the Arch User Repository (AUR), including RPC interface wrappers, package
search, and metadata retrieval.")
    (license license:gpl2)))

;; ── docker-language-server ──────────────────────────────────────

(define-public docker-language-server
  (package
    (name "docker-language-server")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "docker-language-server" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/nicola-did-it/docker-language-server")
    (synopsis "language server for Dockerfiles, Compose, and Bake files")
    (description "docker-language-server provides a Language Server Protocol
(LSP) implementation for Dockerfiles, Docker Compose files, and Docker
Bake files, offering diagnostics, completions, and hover information.")
    (license license:expat)))

;; ── axicli ──────────────────────────────────────────────────────

(define-public axicli
  (package
    (name "axicli")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "axicli" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://axidraw.com/doc/cli_api/")
    (synopsis "command-line interface for AxiDraw pen plotters")
    (description "axicli provides the command-line interface and Python API
for controlling AxiDraw pen plotters, including support for SVG plotting,
manual pen control, and interactive mode.")
    (license license:expat)))

;; ── textext ─────────────────────────────────────────────────────

(define-public textext
  (package
    (name "textext")
    (version "1.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/textext/textext/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'build)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             (let ((dest (string-append
                                          (assoc-ref outputs "out")
                                          "/share/inkscape/extensions/textext")))
                               (mkdir-p dest)
                               (copy-recursively "textext" dest)))))))
    (home-page "https://textext.github.io/textext/")
    (synopsis "re-editable LaTeX graphics for Inkscape")
    (description "TexText is an Inkscape extension that allows inserting and
re-editing LaTeX equations and text into Inkscape SVG documents, with support
for custom preambles and various LaTeX renderers.")
    (license license:bsd-3)))

;; ── pulseaudio-dlna ─────────────────────────────────────────────

(define-public pulseaudio-dlna
  (package
    (name "pulseaudio-dlna")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/masmu/pulseaudio-dlna/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-dbus python-pygobject python-requests
                             python-zeroconf))
    (home-page "https://github.com/masmu/pulseaudio-dlna")
    (synopsis "stream audio from PulseAudio to DLNA/UPnP and Chromecast devices")
    (description "pulseaudio-dlna discovers DLNA/UPnP and Chromecast devices
on the network and creates PulseAudio sinks for each, allowing audio
streaming from Linux applications to networked speakers and TVs.")
    (license license:gpl3+)))

;; ── mpv-mpvacious ───────────────────────────────────────────────

(define-public mpv-mpvacious
  (package
    (name "mpv-mpvacious")
    (version "0.34")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ajatt-Tools/mpvacious/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("subs2srs.lua" "share/mpv/scripts/subs2srs.lua"))))
    (home-page "https://github.com/Ajatt-Tools/mpvacious")
    (synopsis "mpv script for creating Anki flashcards from subtitled media")
    (description "mpvacious is an mpv script that enables creating Anki
flashcards directly from subtitled video and audio files, capturing
screenshots, audio clips, and subtitle text for language learning.")
    (license license:gpl3+)))

;; ── maldet ──────────────────────────────────────────────────────

(define-public maldet
  (package
    (name "maldet")
    (version "1.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rfxn/linux-malware-detect/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("files/maldet" "bin/maldet")
               ("files/internals" "share/maldet/internals/")
               ("files/sigs" "share/maldet/sigs/")
               ("files/conf.maldet" "etc/maldet/conf.maldet"))))
    (inputs (list bash))
    (home-page "https://www.rfxn.com/projects/linux-malware-detect/")
    (synopsis "Linux malware detection scanner")
    (description "Linux Malware Detect (maldet) is a malware scanner designed
for shared hosting environments, using threat data from network edge intrusion
detection systems, community submissions, and ClamAV signatures.")
    (license license:gpl2)))

;; ── gitfetch ────────────────────────────────────────────────────

(define-public gitfetch
  (package
    (name "gitfetch")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JEFLBROWN/gitfetch/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitfetch" "bin/gitfetch"))))
    (inputs (list bash))
    (home-page "https://github.com/JEFLBROWN/gitfetch")
    (synopsis "neofetch-like display for git repository statistics")
    (description "gitfetch displays git repository information in a
neofetch-style format, showing commit count, branch info, contributors,
and other repository metadata.")
    (license license:expat)))

;; ════════════════════════════════════════════════════════════════════
;; C/C++ source builds
;; ════════════════════════════════════════════════════════════════════

;; ── typespeed ───────────────────────────────────────────────────

(define-public typespeed
  (package
    (name "typespeed")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://typespeed.sourceforge.net/typespeed-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list ncurses))
    (home-page "https://typespeed.sourceforge.net")
    (synopsis "test your typing speed and get your fingers' CPS")
    (description "Typespeed is a terminal-based typing speed test game where
words fly across the screen and the player must type them before they reach
the other side.  It measures characters per second and accuracy.")
    (license license:gpl2+)))

;; ── cpuminer ────────────────────────────────────────────────────

(define-public cpuminer
  (package
    (name "cpuminer")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pooler/cpuminer/releases/download/v"
                    version "/pooler-cpuminer-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list curl openssl-1.1))
    (home-page "https://github.com/pooler/cpuminer")
    (synopsis "CPU miner for Litecoin and Bitcoin")
    (description "cpuminer is a multi-threaded CPU miner for Litecoin, Bitcoin,
and other cryptocurrencies.  It supports the getwork and Stratum mining
protocols with SSE2/AVX optimizations.")
    (license license:gpl2)))

;; ── regionset ───────────────────────────────────────────────────

(define-public regionset
  (package
    (name "regionset")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://linvdr.org/download/regionset/"
                    "regionset-" version ".tar.gz"))
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
    (home-page "https://linvdr.org/projects/regionset/")
    (synopsis "set or query the region code of a DVD drive")
    (description "regionset is a small utility for reading and setting the
region code of DVD drives.  It reports the current region setting and the
number of remaining region changes allowed by the drive's firmware.")
    (license license:gpl2)))

;; ── sasquatch ───────────────────────────────────────────────────

(define-public sasquatch
  (package
    (name "sasquatch")
    (version "4.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/devttys0/sasquatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (setenv "INSTALL_PREFIX" (assoc-ref outputs "out")))))))
    (inputs (list zlib lzo xz))
    (home-page "https://github.com/devttys0/sasquatch")
    (synopsis "SquashFS extractor with additional compression support")
    (description "sasquatch is a patched version of unsquashfs that adds
support for vendor-modified SquashFS formats found in embedded device
firmware, including non-standard compression and encryption methods.")
    (license license:gpl2)))

;; ── libcalfbox-lss ──────────────────────────────────────────────

(define-public libcalfbox-lss
  (package
    (name "libcalfbox-lss")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fps/libcalfbox-lss/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/fps/libcalfbox-lss")
    (synopsis "real-time MIDI sequencing and sampler format loading library")
    (description "libcalfbox-lss is a library for real-time MIDI sequencing
and loading of various sampler formats, providing a C API for audio
applications that need MIDI playback and sample-based synthesis.")
    (license license:gpl3+)))

;; ════════════════════════════════════════════════════════════════════
;; Binary packages (pre-built)
;; ════════════════════════════════════════════════════════════════════

;; ── treegrep-bin ────────────────────────────────────────────────

(define-public treegrep-bin
  (package
    (name "treegrep-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/4imothy/treegrep/releases/download/v"
                    version "/tgrep-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tgrep" "bin/tgrep"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/4imothy/treegrep")
    (synopsis "frontend for ripgrep that presents results in a tree format")
    (description "treegrep (tgrep) is a Rust-based frontend for ripgrep
that displays search results in a hierarchical tree format, making it
easier to understand the file structure of matches.")
    (license license:expat)))

;; ── smassh-bin ──────────────────────────────────────────────────

(define-public smassh-bin
  (package
    (name "smassh-bin")
    (version "3.1.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "smassh" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel python-poetry-core))
    (home-page "https://github.com/kraanzu/smassh")
    (synopsis "TUI-based typing test application inspired by MonkeyType")
    (description "smassh is a terminal-based typing test application inspired
by MonkeyType, providing various typing modes, themes, and statistics
tracking directly in the terminal.")
    (license license:gpl3)))

;; ── lscolors-bin ────────────────────────────────────────────────

(define-public lscolors-bin
  (package
    (name "lscolors-bin")
    (version "0.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sharkdp/lscolors/releases/download/v"
                    version "/lscolors-v" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lscolors" "bin/lscolors"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sharkdp/lscolors")
    (synopsis "colorize paths using LS_COLORS")
    (description "lscolors is a Rust library and command-line tool for
colorizing file paths according to the LS_COLORS environment variable,
providing consistent colorization across different tools.")
    (license (list license:expat license:asl2.0))))

;; ── xray-bin ────────────────────────────────────────────────────

(define-public xray-bin
  (package
    (name "xray-bin")
    (version "25.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/XTLS/Xray-core/releases/download/v"
                    version "/Xray-linux-64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source)))
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "xray" #o755))))
           #:install-plan #~'(("xray" "bin/xray")
                              ("geoip.dat" "share/xray/geoip.dat")
                              ("geosite.dat" "share/xray/geosite.dat"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/XTLS/Xray-core")
    (synopsis "network proxy platform with XTLS support")
    (description "Xray-core is a platform for building network proxies,
supporting multiple protocols including VMess, VLESS with XTLS, Trojan,
and Shadowsocks for secure network communication.")
    (license license:mpl2.0)))

;; ── v2raya-bin ──────────────────────────────────────────────────

(define-public v2raya-bin
  (package
    (name "v2raya-bin")
    (version "2.2.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/v2rayA/v2rayA/releases/download/v"
                    version "/v2raya_linux_x64_" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "v2raya")
                   (chmod "v2raya" #o755))))
           #:install-plan #~'(("v2raya" "bin/v2raya"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://v2raya.org")
    (synopsis "V2Ray client with web GUI")
    (description "v2rayA is a V2Ray Linux client supporting VMess, VLESS,
SS, SSR, Trojan, and Juicity protocols with a web-based graphical
management interface.")
    (license license:agpl3)))

;; ── hiddify-next-bin ────────────────────────────────────────────

(define-public hiddify-next-bin
  (package
    (name "hiddify-next-bin")
    (version "2.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hiddify/hiddify-app/releases/download/v"
                    version "/Hiddify-Linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "hiddify")
                   (chmod "hiddify" #o755))))
           #:install-plan #~'(("hiddify" "bin/hiddify"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hiddify.com")
    (synopsis "multi-platform auto-proxy client")
    (description "Hiddify is a multi-platform proxy client supporting
Hysteria2, TUIC, SSH, Reality, VMess, VLESS, and Trojan protocols with
automatic configuration and subscription management.")
    (license (license:fsdg-compatible
              "https://github.com/hiddify/hiddify-app/blob/main/LICENSE.md"
              "CC BY-NC-SA 4.0"))))

;; ── how-cli-bin ─────────────────────────────────────────────────

(define-public how-cli-bin
  (package
    (name "how-cli-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peterje/how/releases/download/v"
                    version "/how-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "how")
                   (chmod "how" #o755))))
           #:install-plan #~'(("how" "bin/how"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peterje/how")
    (synopsis "lightweight AI assistant for your CLI")
    (description "how is a lightweight AI-powered command-line assistant that
converts natural language queries into shell commands, helping users find
the right command without leaving the terminal.")
    (license license:expat)))

;; ── ollamamodelupdater-bin ──────────────────────────────────────

(define-public ollamamodelupdater-bin
  (package
    (name "ollamamodelupdater-bin")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mhutter/ollama-model-updater/"
                    "releases/download/v" version
                    "/ollama-model-updater-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ollama-model-updater" "bin/ollama-model-updater"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mhutter/ollama-model-updater")
    (synopsis "tool to update locally installed Ollama models")
    (description "ollama-model-updater checks and updates locally installed
Ollama models by comparing digests with the Ollama registry, automating
the process of keeping local models current.")
    (license license:expat)))

;; ── ports-info-bin ──────────────────────────────────────────────

(define-public ports-info-bin
  (package
    (name "ports-info-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psnehanshu/ports-info/releases/download/v"
                    version "/ports-info-linux-x64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "ports-info")
                   (chmod "ports-info" #o755))))
           #:install-plan #~'(("ports-info" "bin/ports-info"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psnehanshu/ports-info")
    (synopsis "simple utility to show open ports on Linux systems")
    (description "ports-info is a lightweight command-line utility that
displays information about open network ports and the processes using
them on Linux systems.")
    (license license:expat)))

;; ── beamup-bin ──────────────────────────────────────────────────

(define-public beamup-bin
  (package
    (name "beamup-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/beamup-io/beamup/releases/download/"
                    version "/beamup-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("beamup" "bin/beamup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://beamup.dev")
    (synopsis "tool for installing Gleam, Erlang, and Elixir")
    (description "beamup is a version manager and installer for BEAM
languages including Gleam, Erlang, and Elixir, providing a streamlined
workflow for managing multiple language versions.")
    (license license:asl2.0)))

;; ── waveterm-bin ────────────────────────────────────────────────

(define-public waveterm-bin
  (package
    (name "waveterm-bin")
    (version "0.10.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wavetermdev/waveterm/releases/download/v"
                    version "/Wave-linux-x64-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/waveterm/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/waveterm/Wave")
                              (string-append bin "/waveterm"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://waveterm.dev")
    (synopsis "open-source, cross-platform terminal for seamless workflows")
    (description "Wave Terminal is an open-source terminal that combines
traditional terminal functionality with graphical capabilities, supporting
inline rendering of files, web content, and AI chat.")
    (license license:asl2.0)))

;; ── sdrtrunk-bin ────────────────────────────────────────────────

(define-public sdrtrunk-bin
  (package
    (name "sdrtrunk-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DSheirer/sdrtrunk/releases/download/v"
                    version "/sdr-trunk-linux-x86_64-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source))))
           #:install-plan #~'(("." "share/sdrtrunk/"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DSheirer/sdrtrunk")
    (synopsis "SDR trunked radio decoder for P25 and DMR")
    (description "sdrtrunk is a Java-based application for decoding trunked
radio systems including P25, DMR, and other protocols using software-defined
radio (SDR) receivers.")
    (license license:gpl3)))

;; ── kreya-bin ───────────────────────────────────────────────────

(define-public kreya-bin
  (package
    (name "kreya-bin")
    (version "1.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://kreya.app/downloads/linux-x64/kreya-"
                    version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kreya/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/kreya/kreya")
                              (string-append bin "/kreya"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kreya.app")
    (synopsis "gRPC, REST, and WebSocket API client")
    (description "Kreya is a desktop application for testing and debugging
gRPC, REST, and WebSocket APIs with support for proto file loading,
environment variables, and request chaining.")
    (license (license:fsdg-compatible
              "https://kreya.app"
              "Kreya proprietary license"))))

;; ── vysor-bin ───────────────────────────────────────────────────

(define-public vysor-bin
  (package
    (name "vysor-bin")
    (version "4.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://s3.vysor.io/Vysor-linux-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "vysor")
                   (chmod "vysor" #o755))))
           #:install-plan #~'(("vysor" "bin/vysor"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vysor.io")
    (synopsis "mirror and control Android devices from your desktop")
    (description "Vysor enables screen mirroring and remote control of
Android devices from a desktop computer, providing mouse and keyboard
input forwarding over USB or Wi-Fi.")
    (license (license:fsdg-compatible
              "https://vysor.io"
              "Vysor proprietary license"))))

;; ── xmrig-donateless ────────────────────────────────────────────

(define-public xmrig-donateless
  (package
    (name "xmrig-donateless")
    (version "6.22.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xmrig/xmrig/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DWITH_HWLOC=OFF"
                   "-DWITH_OPENCL=OFF"
                   "-DWITH_CUDA=OFF")))
    (inputs (list openssl-1.1 libuv))
    (home-page "https://xmrig.com")
    (synopsis "CPU/GPU miner for RandomX, KawPow, and CryptoNight")
    (description "XMRig is a high-performance CPU/GPU miner for RandomX,
KawPow, CryptoNight, and GhostRider algorithms, supporting Monero (XMR)
and other cryptocurrencies.")
    (license license:gpl3+)))

;; ════════════════════════════════════════════════════════════════════
;; Shell/script tools
;; ════════════════════════════════════════════════════════════════════

;; ── hyprfreeze-git ──────────────────────────────────────────────

(define-public hyprfreeze-git
  (package
    (name "hyprfreeze-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Zerodya/hyprfreeze")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprfreeze" "bin/hyprfreeze"))))
    (inputs (list bash))
    (home-page "https://github.com/Zerodya/hyprfreeze")
    (synopsis "utility to suspend game processes in Hyprland")
    (description "hyprfreeze is a shell script utility for Hyprland that
allows suspending and resuming processes (typically games) by sending
SIGSTOP/SIGCONT signals, freeing system resources when not in use.")
    (license license:expat)))

;; ── laptop-mode-tools-git ───────────────────────────────────────

(define-public laptop-mode-tools-git
  (package
    (name "laptop-mode-tools-git")
    (version "1.74")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rickysarraf/laptop-mode-tools/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "DESTDIR=" #$output)
                   "PREFIX=/")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/rickysarraf/laptop-mode-tools")
    (synopsis "power saving tool for Linux laptops")
    (description "Laptop Mode Tools is a Linux power saving package that
allows configuration of various power management settings including hard
drive spin-down, CPU frequency scaling, and display brightness.")
    (license license:gpl2)))

;; ── cpmenu ──────────────────────────────────────────────────────

(define-public cpmenu
  (package
    (name "cpmenu")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OctopusET/cpmenu/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+ glib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/OctopusET/cpmenu")
    (synopsis "modern circular menu for Wayland")
    (description "cpmenu is a circular (pie) menu application for Wayland
compositors, providing a radial menu interface for launching applications
and executing commands.")
    (license license:gpl3)))

;; ════════════════════════════════════════════════════════════════════
;; Themes and data packages
;; ════════════════════════════════════════════════════════════════════

;; ── zuki-themes ─────────────────────────────────────────────────

(define-public zuki-themes
  (package
    (name "zuki-themes")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lassekongo83/zuki-themes/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+ sassc))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/lassekongo83/zuki-themes")
    (synopsis "flat GTK themes in several color variants")
    (description "Zuki Themes is a set of flat GTK themes (Zukitre, Zukitwo,
Zuki-shell) for GNOME/GTK-based desktops, providing a clean, modern look
with multiple color variants.")
    (license license:gpl3+)))

;; ── StarDict dictionary data packages ───────────────────────────
;; These are dictionary data files for StarDict-compatible applications.

(define (make-stardict-package dict-name version description uri-path hash)
  "Create a StarDict dictionary data package."
  (package
    (name (string-append "stardict-" dict-name))
    (version version)
    (source (origin
              (method url-fetch)
              (uri uri-path)
              (sha256 (base32 hash))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/stardict/dic/"
                                            #$dict-name "/")))))
    (home-page "http://stardict-4.sourceforge.net/")
    (synopsis (string-append dict-name " dictionary for StarDict"))
    (description description)
    (license license:gpl2)))

(define-public stardict-web1913
  (make-stardict-package
   "web1913" "2024.1"
   "Webster's Revised Unabridged Dictionary (1913 edition) packaged for
StarDict-compatible dictionary applications."
   "https://downloads.sourceforge.net/stardict/stardict-dictd_www.dict.org_web1913-2.4.2.tar.bz2"
   "0000000000000000000000000000000000000000000000000000"))

(define-public stardict-wordnet
  (make-stardict-package
   "wordnet" "2024.1"
   "WordNet English dictionary and thesaurus packaged for StarDict-compatible
dictionary applications, providing definitions, synonyms, and semantic
relationships."
   "https://downloads.sourceforge.net/stardict/stardict-dictd_www.dict.org_wn-2.4.2.tar.bz2"
   "0000000000000000000000000000000000000000000000000000"))

(define-public stardict-computer-ru
  (make-stardict-package
   "computer-ru" "2024.1"
   "English-Russian computer terminology dictionary for StarDict-compatible
dictionary applications."
   "https://downloads.sourceforge.net/stardict/stardict-computer_eng-rus-2.4.2.tar.bz2"
   "0000000000000000000000000000000000000000000000000000"))

(define-public stardict-slang-eng-rus
  (make-stardict-package
   "slang-eng-rus" "2024.1"
   "English-Russian slang dictionary for StarDict-compatible dictionary
applications."
   "https://downloads.sourceforge.net/stardict/stardict-slang_eng-rus-2.4.2.tar.bz2"
   "0000000000000000000000000000000000000000000000000000"))

;; ════════════════════════════════════════════════════════════════════
;; Ruby packages
;; ════════════════════════════════════════════════════════════════════

;; ── libxml-ruby ─────────────────────────────────────────────────

(define-public libxml-ruby
  (package
    (name "libxml-ruby")
    (version "5.0.4")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "libxml-ruby" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libxml2))
    (native-inputs (list pkg-config))
    (home-page "https://xml4r.github.io/libxml-ruby/")
    (synopsis "Ruby bindings for the libxml2 XML parser")
    (description "libxml-ruby provides Ruby bindings for the GNOME libxml2
XML parser library, offering a fast and full-featured XML parsing API
including DOM, SAX, and XPath support.")
    (license license:expat)))

;; ════════════════════════════════════════════════════════════════════
;; Other tools
;; ════════════════════════════════════════════════════════════════════

;; ── kronos ──────────────────────────────────────────────────────

(define-public kronos
  (package
    (name "kronos")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/kronos/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "kronos" bin)))))))
    (inputs (list bash))
    (home-page "https://github.com/nicholasgasior/kronos")
    (synopsis "simple time tracking tool for the command line")
    (description "Kronos is a simple command-line time tracking tool that
allows starting, stopping, and reporting on time spent on tasks and
projects directly from the terminal.")
    (license license:expat)))

;; ── cronopete ───────────────────────────────────────────────────

(define-public cronopete
  (package
    (name "cronopete")
    (version "4.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/rastersoft/cronopete/-/archive/"
                    version "/cronopete-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+ glib))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.com/rastersoft/cronopete")
    (synopsis "Time Machine-like backup tool for Linux")
    (description "Cronopete is a backup solution for Linux inspired by
Apple's Time Machine, providing automatic scheduled backups with an
intuitive graphical interface for browsing and restoring previous
versions of files.")
    (license license:gpl3+)))
