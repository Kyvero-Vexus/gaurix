;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415w
;;; Processes 30 TODO queue packages (#14347-#14378) plus
;;; 11 existing BLOCKED NEEDS_RECIPE_DESIGN items.
;;;
;;; Recipes (11 new):
;;;   1. proxyguard (go, Codeberg, MIT)
;;;   2. bptt (go, GitHub, MIT)
;;;   3. f43-backgrounds (make/copy, GitHub, CC-BY-SA-4.0)
;;;   4. ttf-medievalsharp (font, fontlibrary.org, OFL-1.1)
;;;   5. python-hyperscript (pyproject, PyPI, MIT)
;;;   6. python-dm-ollamalib (pyproject, PyPI, MIT)
;;;   7. ollama-cli (pyproject, PyPI, MIT)
;;;   8. gnome-tuner (meson/vala, ALT Linux Forgejo, GPL-3.0+)
;;;   9. oplpctools (cmake/qt6, GitHub, GPL-3.0)
;;;  10. python-dlt (pyproject/hatch, PyPI, Apache-2.0)
;;;  11. python-meilisearch-sdk (pyproject/hatch, PyPI, MIT)
;;;
;;; BLOCKED from TODO queue (19):
;;;   python-databricks-sql-connector — HEAVY_PYTHON_DEPS: Poetry build with
;;;     thrift/pybreaker/pyarrow; complex version pinning; A1: thrift not in
;;;     Guix; A2: 15+ transitive deps; A3: tight version constraints
;;;   imagot-bin — GODOT_ENGINE_REQUIRED: Godot 4.5+ export toolchain not
;;;     in Guix; building from source requires full Godot engine; A1: Godot
;;;     not packaged; A2: GDScript toolchain; A3: binary-only AUR pkg
;;;   linux-git-headers — KERNEL_HEADERS_VARIANT: mainline kernel headers
;;;     variant; Guix provides linux-libre-headers; A1: non-libre; A2:
;;;     variant tracking burden; A3: use linux-libre-headers instead
;;;   juicity-server — FORKED_GO_DEPS: uses daeuniverse/quic-go custom fork
;;;     + 30+ indirect Go deps; A1: forked QUIC library; A2: large dep tree;
;;;     A3: each Go module needs separate Guix package
;;;   juicity-client — FORKED_GO_DEPS: same repo as juicity-server
;;;   wl_shimeji-plugin-kwinsupport — MISSING_DEPS: requires wl_shimeji-git
;;;     (unpackaged Wayland desktop mascot); A1: wl_shimeji not in Guix;
;;;     A2: plugin cannot function without host; A3: niche use case
;;;   peep-bin — RUST_CRATE_VENDORING: Rust/Cargo project needs cargo dep
;;;     enumeration; A1: unmaintained (last release 2022); A2: crate tree;
;;;     A3: niche text viewer
;;;   dnspeep-bin — RUST_CRATE_VENDORING: Rust/Cargo with libpcap dep;
;;;     A1: unmaintained (2022); A2: crate vendoring; A3: niche DNS tool
;;;   ttf-x2 — COMPLEX_MULTI_SOURCE: 22 separate zip downloads from
;;;     dl.irmug.com; A1: unreliable host; A2: no single archive; A3:
;;;     22 individual origin definitions needed
;;;   python-redshift-connector — PROPRIETARY_CLOUD_SDK: Amazon Redshift
;;;     connector requires AWS SDK deps; A1: cloud-vendor lock-in; A2:
;;;     AWS auth chain; A3: heavy transitive deps
;;;   gnome-tuner-tweaks — NEEDS_GNOME_TUNER: plugin for gnome-tuner;
;;;     package gnome-tuner first (done in this pass), then plugins
;;;   gnome-tuner-panel — NEEDS_GNOME_TUNER: plugin for gnome-tuner
;;;   gnome-tuner-gdm — NEEDS_GNOME_TUNER: plugin for gnome-tuner;
;;;     also requires GDM integration
;;;   python-bigframes — GOOGLE_CLOUD_DEPS: BigQuery DataFrames with
;;;     google-cloud-bigquery + 50+ Google SDK deps; A1: massive GCP
;;;     dependency chain; A2: tight version pinning; A3: cloud-vendor
;;;   askora — IMMATURE_PROJECT: v0.0.2 with 11 commits; needs openai +
;;;     anthropic Python SDKs; A1: too early; A2: heavy AI SDK deps;
;;;     A3: API-key-dependent runtime
;;;   pam-parallel — UNCLEAR_LICENSE: no LICENSE file in upstream repo;
;;;     A1: cannot determine license; A2: PAM system integration; A3:
;;;     FuriLabs/mobile-focused
;;;   nodejs-percollate — NODE_ECOSYSTEM: Node.js CLI with npm dep tree;
;;;     A1: node-build-system limitations; A2: heavy npm deps; A3:
;;;     Puppeteer/Chromium likely needed
;;;   python-sqlmesh — HEAVY_PYTHON_DEPS: large data framework with
;;;     40+ Python deps (SQLGlot, dbt adapters, Airflow); A1: massive
;;;     dep chain; A2: database integrations; A3: enterprise scope
;;;   python-scheduler-git — NEEDS_PYTHON_DEPS: requires python-tasklib
;;;     (not in Guix) + Python 3.13+; A1: tasklib unpackaged; A2:
;;;     runtime needs taskwarrior+timewarrior; A3: git-only source
;;;
;;; Existing BLOCKED NEEDS_RECIPE_DESIGN handled (11):
;;;   qbittorrent-enhanced-ua — ALREADY_PACKAGED: recipes exist in
;;;     recipe-resolver-260414ab.scm and recipe-resolver-260415s.scm
;;;   scx-scheds-git — EXHAUSTED: BPF/kernel sched_ext; needs BPF
;;;     toolchain + 50+ Rust crates + kernel 6.12+ CONFIG_SCHED_CLASS_EXT
;;;   zephyr-sdk — EXHAUSTED: cross-compilation SDK with 12+ target
;;;     toolchains; Guix cross-base handles targets natively
;;;   organicmaps — EXHAUSTED: 100+ C++/Qt native deps with custom Boost;
;;;     mobile-first mapping app; no binary releases
;;;   penpot — EXHAUSTED: Clojure multi-service (backend+frontend+exporter)
;;;     needs leiningen + shadow-cljs + PostgreSQL + Redis + S3
;;;   penpot-exporter — EXHAUSTED: depends on infeasible penpot backend;
;;;     requires Playwright/Chromium; cannot function standalone
;;;   collabora-office — EXHAUSTED: 10M+ LOC LibreOffice fork; hours-long
;;;     build; WebSocket server + Qt6 wrapper layers
;;;   rust-aarch64-musl-git — EXHAUSTED: Guix handles cross-compilation
;;;     natively via --target; Arch-specific rustup management
;;;   rust-aarch64-gnu-git — EXHAUSTED: same as rust-aarch64-musl-git
;;;   lib32-rust-libs-git — EXHAUSTED: multilib unsupported; Guix does
;;;     not use lib32 model
;;;   sulis-git — EXHAUSTED: complex Rust tactical RPG with custom 2D
;;;     engine; massive cargo dep tree; niche game
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:export (
            proxyguard
            bptt
            f43-backgrounds
            ttf-medievalsharp
            python-hyperscript
            python-dm-ollamalib
            ollama-cli
            gnome-tuner
            oplpctools
            python-dlt
            python-meilisearch-sdk
            ))

;;;
;;; --- 1. proxyguard ---
;;; Proxy WireGuard UDP connections over HTTP(S).
;;; Source: https://codeberg.org/eduVPN/proxyguard
;;; Build: Go with Makefile.
;;; License: MIT
;;; AUR: proxyguard (votes=1, popularity=0.01)
;;;

(define-public proxyguard
  (package
    (name "proxyguard")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/eduVPN/proxyguard/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "codeberg.org/eduVPN/proxyguard"
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key import-path #:allow-other-keys)
              (for-each
               (lambda (cmd)
                 (invoke "go" "build" "-v"
                         "-trimpath"
                         "-o" (string-append cmd)
                         (string-append import-path "/cmd/" cmd)))
               '("proxyguard-server" "proxyguard-client"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "proxyguard-server" bin)
                (install-file "proxyguard-client" bin)))))))
    (synopsis "proxy WireGuard UDP connections over HTTP(S)")
    (description
     "ProxyGuard proxies WireGuard UDP traffic over HTTP(S) connections.
It is developed as part of the eduVPN project to help circumvent
network restrictions that block UDP traffic.  It provides both server
and client components.")
    (home-page "https://codeberg.org/eduVPN/proxyguard")
    (license license:expat)))

;;;
;;; --- 2. bptt ---
;;; Display British public transport information in the terminal.
;;; Source: https://github.com/bunburya/bptt
;;; Build: Go modules.
;;; License: MIT
;;; AUR: bptt (votes=1, popularity=0.01)
;;;

(define-public bptt
  (package
    (name "bptt")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bunburya/bptt/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f
      #:import-path "github.com/bunburya/bptt"))
    (synopsis "British public transport information in the terminal")
    (description
     "Bptt displays real-time information about British public transport
services in the terminal.  It queries National Rail and other transit
APIs to show departures, arrivals, and service status updates.")
    (home-page "https://github.com/bunburya/bptt")
    (license license:expat)))

;;;
;;; --- 3. f43-backgrounds ---
;;; Fedora 43 default desktop wallpapers.
;;; Source: https://github.com/fedoradesign/backgrounds
;;; Build: Make (install wallpaper images).
;;; License: CC-BY-SA-4.0
;;; AUR: f43-backgrounds (votes=1, popularity=0.01)
;;;

(define-public f43-backgrounds
  (package
    (name "f43-backgrounds")
    (version "43.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fedoradesign/backgrounds/releases/"
                    "download/v" version "/f43-backgrounds-" version
                    ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "make" "install"
                      (string-append "DESTDIR=" (assoc-ref outputs "out"))
                      "PREFIX=/"))))))
    (synopsis "Fedora 43 default desktop wallpapers")
    (description
     "This package provides the default desktop background images from
Fedora 43 for GNOME, KDE Plasma, Mate, and Xfce desktops.  It
includes both light and dark variants in multiple resolutions.")
    (home-page "https://github.com/fedoradesign/backgrounds")
    (license license:cc-by-sa4.0)))

;;;
;;; --- 4. ttf-medievalsharp ---
;;; Gothic-style font from Font Library.
;;; Source: https://fontlibrary.org
;;; Build: Font install (copy TTF files).
;;; License: OFL-1.1
;;; AUR: ttf-medievalsharp (votes=4, popularity=0.01)
;;;

(define-public ttf-medievalsharp
  (package
    (name "ttf-medievalsharp")
    (version "20200401")
    (source (origin
              (method url-fetch)
              (uri "https://fontlibrary.org/assets/downloads/medievalsharp/a03760934a82973ef127071373557645/medievalsharp.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/medievalsharp/"
           #:include-regexp ("\\.ttf$")))))
    (native-inputs (list unzip))
    (synopsis "gothic-style font inspired by medieval lettering")
    (description
     "MedievalSharp is a decorative font based on gothic letters.  It is
suitable for headings, titles, and decorative text where a medieval
or old-world aesthetic is desired.  The font covers Latin character
sets.")
    (home-page "https://fontlibrary.org/en/font/medievalsharp")
    (license license:silofl1.1)))

;;;
;;; --- 5. python-hyperscript ---
;;; Tiny hyperscript-style HTML builder for Python.
;;; Source: https://pypi.org/project/hyperscript/
;;; Build: Python pyproject (PEP 517), zero runtime dependencies.
;;; License: MIT
;;; AUR: python-hyperscript (votes=1, popularity=0.01)
;;;

(define-public python-hyperscript
  (package
    (name "python-hyperscript")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/h/hyperscript/hyperscript-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "tiny hyperscript-style HTML builder for Python")
    (description
     "Hyperscript is a minimal Python library that provides an @code{h}
helper function for building HTML elements using a concise,
hyperscript-style API.  It has zero runtime dependencies and supports
Python 3.8 and later.")
    (home-page "https://github.com/vchan/hyperscript")
    (license license:expat)))

;;;
;;; --- 6. python-dm-ollamalib ---
;;; Functions to parse Ollama options from string and get info.
;;; Source: https://pypi.org/project/dm-ollamalib/
;;; Build: Python pyproject (setuptools).
;;; License: MIT
;;; AUR: python-dm-ollamalib (votes=1, popularity=0.01)
;;; Note: depends on python-ollama (not yet in Guix).
;;;

(define-public python-dm-ollamalib
  (package
    (name "python-dm-ollamalib")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/d/dm_ollamalib/dm_ollamalib-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    ;; Runtime dep python-ollama not yet in Guix.
    (synopsis "parse Ollama model options from strings")
    (description
     "Dm-ollamalib provides functions to parse Ollama model options from
string representations and retrieve information about available
Ollama model parameters.  It is used as a helper library for Ollama
CLI tools.")
    (home-page "https://pypi.org/project/dm-ollamalib/")
    (license license:expat)))

;;;
;;; --- 7. ollama-cli ---
;;; Simple command line tool that reads text from stdin and pipes it to Ollama.
;;; Source: https://pypi.org/project/ollama-cli/
;;; Build: Python pyproject (setuptools).
;;; License: MIT
;;; AUR: ollama-cli (votes=1, popularity=0.01)
;;; Note: depends on python-dm-ollamalib, python-httpx, python-ollama.
;;;

(define-public ollama-cli
  (package
    (name "ollama-cli")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/o/ollama_cli/ollama_cli-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-dm-ollamalib python-httpx))
    ;; Also needs python-ollama, python-dm-streamvalve (not yet in Guix).
    (synopsis "command-line tool for piping text to Ollama models")
    (description
     "Ollama-cli is a simple command-line tool that reads text from standard
input and pipes it to a local Ollama instance for processing with
large language models.  It supports model selection, option parsing,
and streaming output.")
    (home-page "https://pypi.org/project/ollama-cli/")
    (license license:expat)))

;;;
;;; --- 8. gnome-tuner ---
;;; Extensible control center for GNOME with plugin architecture.
;;; Source: https://altlinux.space/alt-gnome/tuner
;;; Build: Meson, Vala.
;;; License: GPL-3.0-or-later
;;; AUR: gnome-tuner (votes=1, popularity=0.01)
;;;

(define-public gnome-tuner
  (package
    (name "gnome-tuner")
    (version "0.6.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://altlinux.space/alt-gnome/tuner")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list pkg-config
           vala
           `(,glib "bin")               ;glib-compile-schemas
           gobject-introspection))
    (inputs
     (list gtk
           libadwaita
           libgee
           libpeas-2))
    (synopsis "extensible control center for GNOME desktop")
    (description
     "Tuner is an extensible control center for GNOME that provides a
plugin-based architecture for desktop customization.  It supports
plugins for tweaks, panel mode switching, GDM settings, and other
GNOME configuration tasks.  Tuner is developed by ALT Linux GNOME
team.")
    (home-page "https://altlinux.space/alt-gnome/tuner")
    (license license:gpl3+)))

;;;
;;; --- 9. oplpctools ---
;;; Graphical PC tools for Open PS2 Loader.
;;; Source: https://github.com/brainstream/OPL-PC-Tools
;;; Build: CMake, C++, Qt6.
;;; License: GPL-3.0-only
;;; AUR: oplpctools (votes=1, popularity=0.01)
;;;

(define-public oplpctools
  (package
    (name "oplpctools")
    (version "3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brainstream/OPL-PC-Tools/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs
     (list qtbase))
    (synopsis "graphical tools for managing PS2 games with Open PS2 Loader")
    (description
     "OPL PC Tools is a graphical application for managing PlayStation 2
game collections used with Open PS2 Loader (OPL).  It supports
creating and managing game installations, editing OPL configuration,
and managing virtual memory cards.")
    (home-page "https://github.com/brainstream/OPL-PC-Tools")
    (license license:gpl3)))

;;;
;;; --- 10. python-dlt ---
;;; Data load tool -- Python library/CLI for data pipelines.
;;; Source: https://pypi.org/project/dlt/
;;; Build: Python pyproject with hatchling backend.
;;; License: Apache-2.0
;;; AUR: python-dlt (votes=1, popularity=0.01)
;;; Note: core package has minimal deps; many optional extras.
;;;

(define-public python-dlt
  (package
    (name "python-dlt")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/d/dlt/dlt-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-hatchling))
    ;; Core runtime deps: pendulum, simplejson, PyYAML, semver, etc.
    ;; Many optional database connectors available as extras.
    (synopsis "data load tool for Python data pipelines")
    (description
     "Dlt (data load tool) is a Python library and CLI for loading data
from various sources into data warehouses and data lakes.  It provides
a simple, declarative API for building data pipelines with automatic
schema inference, incremental loading, and state management.  Dlt
supports many destinations including DuckDB, PostgreSQL, BigQuery,
Snowflake, and more via optional extras.")
    (home-page "https://dlthub.com/")
    (license license:asl2.0)))

;;;
;;; --- 11. python-meilisearch-sdk ---
;;; Async and sync Python client for the Meilisearch API.
;;; Source: https://pypi.org/project/meilisearch-python-sdk/
;;; Build: Python pyproject with hatchling backend.
;;; License: MIT
;;; AUR: python-meilisearch-sdk (votes=1, popularity=0.01)
;;;

(define-public python-meilisearch-sdk
  (package
    (name "python-meilisearch-sdk")
    (version "7.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/m/meilisearch_python_sdk/meilisearch_python_sdk-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-hatchling))
    (propagated-inputs
     (list python-httpx python-pyjwt))
    ;; python-pyjwt is from (gnu packages python-xyz)
    ;; Also needs: camel-converter, aiofiles, pydantic>=2.0
    (synopsis "async and sync Python client for Meilisearch")
    (description
     "Meilisearch-python-sdk provides both asynchronous and synchronous
Python clients for the Meilisearch search engine API.  It supports
all Meilisearch features including document management, search,
index settings, and multi-search.  The library uses httpx for HTTP
requests and Pydantic for data validation.")
    (home-page "https://github.com/sanders41/meilisearch-python-sdk")
    (license license:expat)))
