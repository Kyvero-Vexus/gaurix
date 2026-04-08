;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 13 new recipes (go/cmake/meson/pyproject/copy/gnu build systems)
;;;   - 17 re-evaluated with specific blocking reasons
;;;
;;; Re-evaluated packages (blocked with specific reasons):
;;;   - input-remapper (#4208): 10+ Python deps not in Guix (python-evdev,
;;;     python-dasbus, python-pydbus, python-psutil, etc.)
;;;   - starcal (#3982): many Python deps not in Guix (python-cachetools,
;;;     python-igraph, python-httplib2) + GTK3 sourceview
;;;   - openlinkhub-git (#4214): requires Go >=1.25.0, newer than Guix Go
;;;   - x2goserver (#3942): 30+ Perl deps (perl-dbd-sqlite, perl-capture-tiny,
;;;     perl-config-simple, etc.), flagged out-of-date in AUR
;;;   - aeth-git (#3979): Haskell/Cabal build infra needed (GHC, cabal-install)
;;;   - yazi-git (#4218): Rust with 100+ crate deps, needs full cargo vendoring
;;;   - opentaiko (#3966): .NET runtime required, not bootstrapped in Guix
;;;   - xerahs-git (#3969): .NET SDK 10.0 + Avalonia UI, not bootstrapped in Guix
;;;   - openclaw-git (#3955): requires Bun + PNPM Node.js tooling, incomplete in Guix
;;;   - note-gen (#3976): Tauri app needing both Rust cargo + Node.js npm chains
;;;   - tome4-ashes_of_urhrok (#3986): custom license DLC addon, unclear redistribution
;;;   - basedpyright (#4185): npm + UV Python build dependency chain
;;;   - telepresence2 (#4196): Go with complex vendored deps + fuse2 build reqs
;;;   - skyscraper-simulator (#3980): needs deprecated libpng12 + jxrlib, not in Guix
;;;   - notify-complete (#4018): Rust with cargo deps needing vendored crate hashes
;;;   - clipboard-sync (#4169): Rust with cargo deps needing vendored crate hashes
;;;   - dev-janitor-bin (#4017): Tauri .deb binary needing webkit2gtk-4.1 + deb extraction
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:export (
            ;; New recipes
            fdir
            puny-manager
            netinfo
            python-django-docs
            gollama
            andcli
            pstate-frequency
            stdexec
            playit-bin
            scrutiny
            scrutiny-collector
            mousam
            pam-fprint-grosshack))

;;;
;;; ── fdir ──────────────────────────────────────────────────
;;; Filesystem search language CLI (Python)
;;;
(define-public fdir
  (package
    (name "fdir")
    (version "3.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/VG-dev1/fdir")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;; no test suite in release
    (native-inputs
     (list python-setuptools python-wheel))
    (home-page "https://github.com/VG-dev1/fdir")
    (synopsis "search language for your filesystem")
    (description
     "Fdir is a command-line tool that provides a search language for your
filesystem.  It allows finding files and directories using intuitive query
patterns and filters with support for regular expressions.")
    (license license:expat)))

;;;
;;; ── puny-manager ──────────────────────────────────────────
;;; Minimal CLI password manager
;;;
(define-public puny-manager
  (package
    (name "puny-manager")
    (version "1.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Vaspyyy/puny-manager")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-cryptography))
    (home-page "https://github.com/Vaspyyy/puny-manager")
    (synopsis "minimal local CLI password manager with encrypted vault")
    (description
     "Puny Manager is a minimal, local command-line password manager that
stores credentials in an encrypted vault using the cryptography library.
It provides a simple interface for managing passwords without cloud
dependency.")
    (license license:expat)))

;;;
;;; ── netinfo ──────────────────────────────────────────────────
;;; Network and system information CLI
;;;
(define-public netinfo
  (package
    (name "netinfo")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Bangkah/netinfo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-requests))
    (home-page "https://github.com/Bangkah/netinfo")
    (synopsis "professional CLI tool to display network and system information")
    (description
     "Netinfo is a command-line tool that displays detailed network and system
information including IP address, ASN, ISP, geolocation, and other
connectivity details.  It queries external services to provide comprehensive
network diagnostics.")
    (license license:expat)))

;;;
;;; ── python-django-docs ──────────────────────────────────────
;;; Django web framework documentation
;;;
(define-public python-django-docs
  (package
    (name "python-django-docs")
    (version "6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://media.djangoproject.com/docs/django-docs-"
             version "-en.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/django/"))))
    (home-page "https://docs.djangoproject.com/")
    (synopsis "documentation for the Django web framework")
    (description
     "This package provides offline documentation for the Django web
framework.  It includes the full reference manual, tutorials, how-to
guides, and API documentation in HTML format.")
    (license license:bsd-3)))

;;;
;;; ── gollama ──────────────────────────────────────────────────
;;; TUI for managing Ollama models
;;;
(define-public gollama
  (package
    (name "gollama")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sammcj/gollama/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/sammcj/gollama"
           #:install-source? #f
           #:tests? #f))  ;; tests require network + Ollama
    (home-page "https://github.com/sammcj/gollama")
    (synopsis "TUI for managing Ollama models")
    (description
     "Gollama is a terminal user interface for managing Ollama models.  It
provides an interactive interface to list, inspect, pull, push, copy, and
delete Ollama language models from the command line.")
    (license license:expat)))

;;;
;;; ── andcli ──────────────────────────────────────────────────
;;; 2FA TUI for the shell
;;;
(define-public andcli
  (package
    (name "andcli")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tjblackheart/andcli/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/tjblackheart/andcli"
           #:install-source? #f
           #:tests? #f))
    (home-page "https://github.com/tjblackheart/andcli")
    (synopsis "two-factor authentication TUI for the shell")
    (description
     "Andcli is a terminal user interface for managing two-factor
authentication codes.  It reads OTP secrets and generates time-based
one-time passwords directly in the terminal, supporting multiple accounts
and clipboard integration.")
    (license license:expat)))

;;;
;;; ── pstate-frequency ──────────────────────────────────────────
;;; Intel P-state frequency control
;;;
(define-public pstate-frequency
  (package
    (name "pstate-frequency")
    (version "3.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pyamsoft/pstate-frequency")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   "DESTDIR=")
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))  ;; no configure script
    (home-page "https://github.com/pyamsoft/pstate-frequency")
    (synopsis "easily control Intel p-state driver on Linux")
    (description
     "Pstate-frequency is a command-line tool to easily control the Intel
p-state CPU frequency scaling driver on Linux.  It allows setting CPU
governor modes, adjusting frequency scaling limits, and managing power
profiles for Intel processors.")
    (license license:gpl2)))

;;;
;;; ── stdexec ──────────────────────────────────────────────────
;;; C++ Senders reference implementation (P2300)
;;;
(define-public stdexec
  (package
    (name "stdexec")
    (version "2026.03.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NVIDIA/stdexec")
             (commit (string-append "nvhpc-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DSTDEXEC_BUILD_TESTS=OFF"
                   "-DSTDEXEC_BUILD_EXAMPLES=OFF")))
    (home-page "https://github.com/NVIDIA/stdexec")
    (synopsis "reference implementation of C++ Senders asynchronous model")
    (description
     "Stdexec is the reference implementation of the C++ Senders asynchronous
programming model (P2300).  It provides a standard framework for composing
and executing asynchronous operations using sender/receiver patterns,
targeting inclusion in the C++ standard library.")
    (license license:asl2.0)))

;;;
;;; ── playit-bin ──────────────────────────────────────────────
;;; Tunneling agent for sharing game servers (pre-built binary)
;;;
(define-public playit-bin
  (package
    (name "playit-bin")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/playit-cloud/playit-agent/releases/download/v"
             version "/playit-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("playit" "bin/playit"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "playit")
                   (chmod "playit" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/playit-cloud/playit-agent")
    (synopsis "tunneling agent for sharing game servers publicly")
    (description
     "Playit is a tunneling agent that allows users to share game servers
and other network services publicly without port forwarding.  It creates
a secure tunnel to the playit.gg network, assigning a public address to
local services.")
    (license license:bsd-2)))

;;;
;;; ── scrutiny ──────────────────────────────────────────────────
;;; S.M.A.R.T disk monitoring dashboard
;;;
(define-public scrutiny
  (package
    (name "scrutiny")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AnalogJ/scrutiny/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/analogj/scrutiny"
           #:install-source? #f
           #:tests? #f))  ;; tests require InfluxDB
    (home-page "https://github.com/AnalogJ/scrutiny")
    (synopsis "hard drive S.M.A.R.T monitoring with historical trends")
    (description
     "Scrutiny is a hard drive health monitoring tool that collects S.M.A.R.T
data, provides historical trend analysis, and applies real-world failure
thresholds.  It includes a web dashboard and API server for viewing disk
health across multiple machines.")
    (license license:expat)))

;;;
;;; ── scrutiny-collector ──────────────────────────────────────
;;; S.M.A.R.T data collector for Scrutiny
;;;
(define-public scrutiny-collector
  (package
    (name "scrutiny-collector")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AnalogJ/scrutiny/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append "scrutiny-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path
           "github.com/analogj/scrutiny/collector/cmd/collector-metrics"
           #:unpack-path "github.com/analogj/scrutiny"
           #:install-source? #f
           #:tests? #f))
    (inputs (list smartmontools))
    (home-page "https://github.com/AnalogJ/scrutiny")
    (synopsis "S.M.A.R.T data collector agent for Scrutiny dashboard")
    (description
     "Scrutiny Collector is the data collection agent for the Scrutiny
hard drive monitoring system.  It runs on each monitored machine, gathers
S.M.A.R.T data from local drives using smartmontools, and reports metrics
to the central Scrutiny server.")
    (license license:expat)))

;;;
;;; ── mousam ──────────────────────────────────────────────────
;;; GTK4 weather application
;;;
(define-public mousam
  (package
    (name "mousam")
    (version "1.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/amit9838/mousam")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config))
    (inputs
     (list libadwaita))
    (propagated-inputs
     (list python-pygobject
           python-pycairo
           python-requests))
    (home-page "https://github.com/amit9838/mousam")
    (synopsis "weather at a glance for the GNOME desktop")
    (description
     "Mousam is a GTK4/Libadwaita weather application for the GNOME desktop.
It displays current weather conditions, forecasts, and weather maps with a
clean, modern interface.  Data is sourced from Open-Meteo.")
    (license license:gpl3+)))

;;;
;;; ── pam-fprint-grosshack ──────────────────────────────────
;;; PAM module for simultaneous fingerprint+password auth
;;;
(define-public pam-fprint-grosshack
  (package
    (name "pam-fprint-grosshack")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicovince/pam-fprint-grosshack")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))  ;; tests need pam_wrapper + dbus session
    (native-inputs (list pkg-config))
    (inputs
     (list fprintd
           glib
           dbus-glib
           linux-pam
           polkit
           elogind))
    (home-page "https://github.com/nicovince/pam-fprint-grosshack")
    (synopsis "PAM module for simultaneous fingerprint and password auth")
    (description
     "Pam-fprint-grosshack is a PAM module that enables simultaneous
fingerprint and password authentication on Linux.  It allows users to
authenticate using either their fingerprint via fprintd or their password,
accepting whichever succeeds first.")
    (license license:gpl2+)))
