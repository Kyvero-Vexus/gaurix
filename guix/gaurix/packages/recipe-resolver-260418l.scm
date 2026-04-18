;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418l
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (100):
;;;     1.  meteor (go-build-system, v0.28.2, expat)
;;;     2.  turso (go-build-system, v0.5.3, expat)
;;;     3.  crowdsec-firewall-bouncer-iptables (go-build-system, v0.0.34, expat)
;;;     4.  crowdsec-firewall-bouncer-nftables (go-build-system, v0.0.34, expat)
;;;     5.  rmfakecloud (go-build-system, v0.0.25, agpl3+)
;;;     6.  twitch-cli (go-build-system, v1.1.24, asl2.0)
;;;     7.  bgpq4 (go-build-system, v1.15, bsd-2)
;;;     8.  protoscope (go-build-system, v0.0.1, asl2.0)
;;;     9.  adif-multitool (go-build-system, v0.1.22, asl2.0)
;;;    10.  dockle (go-build-system, v0.4.15, asl2.0)
;;;    11.  oras (go-build-system, v1.3.1, asl2.0)
;;;    12.  mautrix-signal (go-build-system, v0.2604.0, agpl3+)
;;;    13.  mockery (go-build-system, v3.7.0, bsd-3)
;;;    14.  kubectl-slice (go-build-system, v1.4.2, expat)
;;;    15.  fabric-ai (go-build-system, v1.4.375, expat)
;;;    16.  keybase (go-build-system, v6.6.0, bsd-3)
;;;    17.  artem (cargo-build-system, v3.0.0, mpl2.0)
;;;    18.  ttdl (cargo-build-system, v6.0.0, expat)
;;;    19.  bzmenu (cargo-build-system, v0.4.0, gpl3+)
;;;    20.  minidsp-rs (cargo-build-system, v0.1.12, asl2.0)
;;;    21.  yara-x (cargo-build-system, v1.15.0, bsd-3)
;;;    22.  rustowl (cargo-build-system, v0.3.4, mpl2.0)
;;;    23.  timewall (cargo-build-system, v2.1.0, expat)
;;;    24.  shadowenv (cargo-build-system, v3.4.0, expat)
;;;    25.  alass (cargo-build-system, v2.0.0, gpl3+)
;;;    26.  meli (cargo-build-system, v0.8.13, gpl3)
;;;    27.  ff2mpv-rust (cargo-build-system, v1.1.7, gpl3+)
;;;    28.  youtui (cargo-build-system, v0.0.35, expat)
;;;    29.  rusty-man (cargo-build-system, v0.5.0, expat)
;;;    30.  geopard (cargo-build-system, v1.7.0, gpl3+)
;;;    31.  chezmoi-modify-manager (cargo-build-system, v3.7.0, gpl3)
;;;    32.  ttynote (cargo-build-system, v0.1.0, expat)
;;;    33.  newfetch (cargo-build-system, v1.0.0, gpl3+)
;;;    34.  python-langgraph-checkpoint (pyproject-build-system, v4.0.1, expat)
;;;    35.  python-langgraph-sdk (pyproject-build-system, v0.3.9, expat)
;;;    36.  python-langgraph-cli (pyproject-build-system, v0.4.14, expat)
;;;    37.  python-langgraph-prebuilt (pyproject-build-system, v1.0.8, expat)
;;;    38.  python-langgraph-checkpoint-sqlite (pyproject-build-system, v3.0.3, expat)
;;;    39.  python-langgraph (pyproject-build-system, v1.0.10, expat)
;;;    40.  python-aiomax (pyproject-build-system, v2.12.4, expat)
;;;    41.  python-gql (pyproject-build-system, v4.0.0, expat)
;;;    42.  python-zenlib (pyproject-build-system, v3.3.0, gpl2)
;;;    43.  python-sparklines (pyproject-build-system, v0.7.0, expat)
;;;    44.  python-mfusepy (pyproject-build-system, v3.1.1, isc)
;;;    45.  python-pycpio (pyproject-build-system, v1.7.0, gpl2)
;;;    46.  python-aioboto3 (pyproject-build-system, v15.5.0, asl2.0)
;;;    47.  python-pyrr (pyproject-build-system, v0.10.3, bsd-2)
;;;    48.  python-isosurfaces (pyproject-build-system, v0.1.2, expat)
;;;    49.  python-toml-sort (pyproject-build-system, v0.24.4, expat)
;;;    50.  pyzbar (pyproject-build-system, v0.1.9, expat)
;;;    51.  tzupdate (pyproject-build-system, v3.1.0, expat)
;;;    52.  python-anthropic (pyproject-build-system, v0.75.0, expat)
;;;    53.  mkdocs-include-markdown-plugin (pyproject-build-system, v7.2.2, asl2.0)
;;;    54.  fypp (pyproject-build-system, v3.2, bsd-2)
;;;    55.  python-leveldb (pyproject-build-system, v0.201, bsd-3)
;;;    56.  camset (pyproject-build-system, v0.0.21, gpl3+)
;;;    57.  blockdiag (pyproject-build-system, v3.3.0, asl2.0)
;;;    58.  seqdiag (pyproject-build-system, v3.1.0, asl2.0)
;;;    59.  mimeo (pyproject-build-system, v2023, gpl3+)
;;;    60.  changedetection.io (pyproject-build-system, v0.54.9, asl2.0)
;;;    61.  anki-sync-server (pyproject-build-system, v25.09.2, agpl3+)
;;;    62.  systemd-pilot (pyproject-build-system, v3.0, gpl3+)
;;;    63.  thinkfan-cli (pyproject-build-system, v1.0, gpl3+)
;;;    64.  qdocumentview (cmake-build-system, v0.3.0.1, gpl2+)
;;;    65.  paho-mqtt-c (cmake-build-system, v1.3.14, epl2.0)
;;;    66.  paho-mqtt-cpp (cmake-build-system, v1.6.0, epl2.0)
;;;    67.  cutechess (cmake-build-system, v1.4.0, gpl3+)
;;;    68.  pokefinder (cmake-build-system, v4.2.1, gpl3+)
;;;    69.  cargs (cmake-build-system, v1.2.0, expat)
;;;    70.  audiowaveform (cmake-build-system, v1.10.3, gpl3)
;;;    71.  vnote (cmake-build-system, v3.19.2, lgpl3+)
;;;    72.  codelite (cmake-build-system, v18.3.0, gpl2+)
;;;    73.  pdftag (cmake-build-system, v1.0.5, gpl3+)
;;;    74.  mednaffe (cmake-build-system, v0.9.3, gpl3)
;;;    75.  mp3splt-gtk (gnu-build-system, v0.9.3, gpl2+)
;;;    76.  moon-buggy (gnu-build-system, v1.0.51, gpl2+)
;;;    77.  mmv (gnu-build-system, v2.10, gpl2+)
;;;    78.  stressapptest (gnu-build-system, v1.0.11, asl2.0)
;;;    79.  aview (gnu-build-system, v1.3.0rc1, gpl2+)
;;;    80.  find-cursor (gnu-build-system, v1.7, expat)
;;;    81.  netatalk (meson-build-system, v4.4.1, gpl2+)
;;;    82.  miracle-wm (meson-build-system, v0.7.1, gpl3+)
;;;    83.  plank-reloaded (meson-build-system, v0.11.167, gpl3+)
;;;    84.  fontdownloader (meson-build-system, v10.0.0, gpl3+)
;;;    85.  ascii-draw (meson-build-system, v1.3.0, gpl3+)
;;;    86.  televido (meson-build-system, v0.5.0, gpl3+)
;;;    87.  textlint (node-build-system, v15.5.0, expat)
;;;    88.  nodejs-nodemon (node-build-system, v3.1.14, expat)
;;;    89.  aicommits (node-build-system, v3.1.1, expat)
;;;    90.  nodejs-neovim (node-build-system, v5.4.0, expat)
;;;    91.  hdfview-bin (copy-build-system, v3.4.1, non-copyleft)
;;;    92.  zigup-bin (copy-build-system, v2025_05_24, expat)
;;;    93.  openvscode-server-bin (copy-build-system, v1.98.2, expat)
;;;    94.  coursier-bin (copy-build-system, v2.1.24, asl2.0)
;;;    95.  airvpn-suite-beta-bin (copy-build-system, v2.0.0, gpl3)
;;;    96.  marktext-bin (copy-build-system, v0.17.1, expat)
;;;    97.  github-desktop-bin (copy-build-system, v3.4.14, expat)
;;;    98.  frog-ocr-bin (copy-build-system, v1.6.0, expat)
;;;    99.  nym-vpn-app-bin (copy-build-system, v1.27.0, gpl3)
;;;   100.  wayback-machine-downloader (copy-build-system, v2.3.1, expat)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418l)
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
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages elf)
  #:export (
            ;; Go packages
            meteor
            turso
            crowdsec-firewall-bouncer-iptables
            crowdsec-firewall-bouncer-nftables
            rmfakecloud
            twitch-cli
            bgpq4
            protoscope
            adif-multitool
            dockle
            oras
            mautrix-signal
            mockery
            kubectl-slice
            fabric-ai
            keybase
            ;; Cargo packages
            artem
            ttdl
            bzmenu
            minidsp-rs
            yara-x
            rustowl
            timewall
            shadowenv
            alass
            meli
            ff2mpv-rust
            youtui
            rusty-man
            geopard
            chezmoi-modify-manager
            ttynote
            newfetch
            ;; Python packages
            python-langgraph-checkpoint
            python-langgraph-sdk
            python-langgraph-cli
            python-langgraph-prebuilt
            python-langgraph-checkpoint-sqlite
            python-langgraph
            python-aiomax
            python-gql
            python-zenlib
            python-sparklines
            python-mfusepy
            python-pycpio
            python-aioboto3
            python-pyrr
            python-isosurfaces
            python-toml-sort
            pyzbar
            tzupdate
            python-anthropic
            mkdocs-include-markdown-plugin
            fypp
            python-leveldb
            camset
            blockdiag
            seqdiag
            mimeo
            changedetection.io
            anki-sync-server
            systemd-pilot
            thinkfan-cli
            ;; CMake packages
            qdocumentview
            paho-mqtt-c
            paho-mqtt-cpp
            cutechess
            pokefinder
            cargs
            audiowaveform
            vnote
            codelite
            pdftag
            mednaffe
            ;; GNU packages
            mp3splt-gtk
            moon-buggy
            mmv
            stressapptest
            aview
            find-cursor
            ;; Meson packages
            netatalk
            miracle-wm
            plank-reloaded
            fontdownloader
            ascii-draw
            televido
            ;; Node packages
            textlint
            nodejs-nodemon
            aicommits
            nodejs-neovim
            ;; Binary packages
            hdfview-bin
            zigup-bin
            openvscode-server-bin
            coursier-bin
            airvpn-suite-beta-bin
            marktext-bin
            github-desktop-bin
            frog-ocr-bin
            nym-vpn-app-bin
            wayback-machine-downloader
            ))


;;; ===================================================================
;;; GO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. meteor --- conventional commit message generator
;;; -------------------------------------------------------------------
(define-public meteor
  (package
    (name "meteor")
    (version "0.28.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stefanlogue/meteor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/stefanlogue/meteor"
           #:tests? #f))
    (home-page "https://github.com/stefanlogue/meteor")
    (synopsis "CLI tool for generating conventional commit messages")
    (description "Meteor is a command-line tool that helps generate
conventional commit messages.  It provides an interactive interface
for composing structured commit messages following the Conventional
Commits specification.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. turso --- Turso database CLI
;;; -------------------------------------------------------------------
(define-public turso
  (package
    (name "turso")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tursodatabase/turso")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/tursodatabase/turso"
           #:tests? #f))
    (home-page "https://github.com/tursodatabase/turso")
    (synopsis "CLI tool for Turso database management")
    (description "Turso is a command-line interface for managing Turso
databases, a distributed SQLite-compatible database platform.  It provides
tools for creating, managing, and querying databases.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. crowdsec-firewall-bouncer-iptables --- CrowdSec iptables bouncer
;;; -------------------------------------------------------------------
(define-public crowdsec-firewall-bouncer-iptables
  (package
    (name "crowdsec-firewall-bouncer-iptables")
    (version "0.0.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crowdsecurity/cs-firewall-bouncer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/crowdsecurity/cs-firewall-bouncer"
           #:tests? #f))
    (home-page "https://doc.crowdsec.net/docs/bouncers/firewall/")
    (synopsis "CrowdSec bouncer for iptables firewall")
    (description "This CrowdSec bouncer integrates with iptables to
automatically block IP addresses identified as malicious by CrowdSec.
It reads decisions from the CrowdSec Local API and creates firewall
rules accordingly.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. crowdsec-firewall-bouncer-nftables --- CrowdSec nftables bouncer
;;; -------------------------------------------------------------------
(define-public crowdsec-firewall-bouncer-nftables
  (package
    (name "crowdsec-firewall-bouncer-nftables")
    (version "0.0.34")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crowdsecurity/cs-firewall-bouncer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/crowdsecurity/cs-firewall-bouncer"
           #:tests? #f))
    (home-page "https://doc.crowdsec.net/docs/bouncers/firewall/")
    (synopsis "CrowdSec bouncer for nftables firewall")
    (description "This CrowdSec bouncer integrates with nftables to
automatically block IP addresses identified as malicious by CrowdSec.
It reads decisions from the CrowdSec Local API and creates firewall
rules accordingly.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. rmfakecloud --- reMarkable fake cloud server
;;; -------------------------------------------------------------------
(define-public rmfakecloud
  (package
    (name "rmfakecloud")
    (version "0.0.25")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ddvk/rmfakecloud")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/ddvk/rmfakecloud"
           #:tests? #f))
    (home-page "https://github.com/ddvk/rmfakecloud")
    (synopsis "fake cloud sync server for reMarkable tablets")
    (description "Rmfakecloud is a self-hosted cloud synchronization
server for reMarkable tablets.  It allows users to sync their documents
without relying on the official reMarkable cloud service.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 6. twitch-cli --- official Twitch developer CLI
;;; -------------------------------------------------------------------
(define-public twitch-cli
  (package
    (name "twitch-cli")
    (version "1.1.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/twitchdev/twitch-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/twitchdev/twitch-cli"
           #:tests? #f))
    (home-page "https://github.com/twitchdev/twitch-cli")
    (synopsis "official Twitch CLI tool for developers")
    (description "Twitch CLI is the official command-line interface from
Twitch for developers.  It provides tools for testing EventSub and other
Twitch API features locally during development.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. bgpq4 --- BGP filtering automation
;;; -------------------------------------------------------------------
(define-public bgpq4
  (package
    (name "bgpq4")
    (version "1.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bgp/bgpq4")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/bgp/bgpq4"
           #:tests? #f))
    (home-page "https://github.com/bgp/bgpq4")
    (synopsis "BGP filtering automation tool")
    (description "Bgpq4 is a tool for generating router configurations
such as prefix-lists, extended access-lists, and policy-statement terms
for various vendors based on IRR data.  It queries RADB, RIPE, APNIC,
and other registries.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 8. protoscope --- protobuf wire format inspector
;;; -------------------------------------------------------------------
(define-public protoscope
  (package
    (name "protoscope")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/protocolbuffers/protoscope")
                    (commit "8e7a6aafa2c9958527b1e0747e66e1bfff045819")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/protocolbuffers/protoscope"
           #:tests? #f))
    (home-page "https://github.com/protocolbuffers/protoscope")
    (synopsis "protobuf wire format inspection tool")
    (description "Protoscope is a tool for inspecting Protocol Buffer
wire format data.  It can decode raw protobuf bytes into a human-readable
text format and re-encode text back into wire format.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. adif-multitool --- ADIF amateur radio log tool
;;; -------------------------------------------------------------------
(define-public adif-multitool
  (package
    (name "adif-multitool")
    (version "0.1.22")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/flwyd/adif-multitool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/flwyd/adif-multitool"
           #:tests? #f))
    (home-page "https://github.com/flwyd/adif-multitool")
    (synopsis "command-line tool for ADIF amateur radio log files")
    (description "ADIF Multitool is a command-line tool for manipulating
ADIF (Amateur Data Interchange Format) log files used by amateur radio
operators.  It supports merging, filtering, and converting log entries.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 10. dockle --- container image linter
;;; -------------------------------------------------------------------
(define-public dockle
  (package
    (name "dockle")
    (version "0.4.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/goodwithtech/dockle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/goodwithtech/dockle"
           #:tests? #f))
    (home-page "https://github.com/goodwithtech/dockle")
    (synopsis "container image linter for security best practices")
    (description "Dockle is a container image linter that checks for
security best practices, CIS benchmarks, and Dockerfile best practices.
It helps ensure container images follow security and operational guidelines.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. oras --- OCI Registry As Storage CLI
;;; -------------------------------------------------------------------
(define-public oras
  (package
    (name "oras")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oras-project/oras")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "oras.land/oras/cmd/oras"
           #:unpack-path "oras.land/oras"
           #:tests? #f))
    (home-page "https://github.com/oras-project/oras")
    (synopsis "OCI Registry As Storage command-line tool")
    (description "ORAS (OCI Registry As Storage) is a command-line tool
for pushing and pulling OCI artifacts to and from OCI-conformant registries.
It enables using container registries as generic artifact stores.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 12. mautrix-signal --- Signal-Matrix bridge
;;; -------------------------------------------------------------------
(define-public mautrix-signal
  (package
    (name "mautrix-signal")
    (version "0.2604.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mautrix/signal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "go.mau.fi/mautrix-signal"
           #:tests? #f))
    (home-page "https://github.com/mautrix/signal")
    (synopsis "Signal-Matrix double puppeting bridge")
    (description "Mautrix-signal is a Matrix-Signal bridge that enables
bidirectional messaging between Signal and Matrix.  It supports double
puppeting, message history, and media transfer.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 13. mockery --- Go mock code autogenerator
;;; -------------------------------------------------------------------
(define-public mockery
  (package
    (name "mockery")
    (version "3.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vektra/mockery")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/vektra/mockery/v3"
           #:unpack-path "github.com/vektra/mockery"
           #:tests? #f))
    (home-page "https://vektra.github.io/mockery")
    (synopsis "mock code autogenerator for Go interfaces")
    (description "Mockery provides the ability to easily generate mocks
for Go interfaces using the stretchr/testify/mock package.  It removes
the boilerplate coding required to create mock implementations.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 14. kubectl-slice --- YAML manifest splitter
;;; -------------------------------------------------------------------
(define-public kubectl-slice
  (package
    (name "kubectl-slice")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/patrickdappollonio/kubectl-slice")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/patrickdappollonio/kubectl-slice"
           #:tests? #f))
    (home-page "https://github.com/patrickdappollonio/kubectl-slice")
    (synopsis "kubectl plugin to split YAML manifests into files")
    (description "Kubectl-slice is a kubectl plugin that splits Kubernetes
YAML manifests into individual files.  It supports splitting by resource
type, name, or other criteria for easier management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. fabric-ai --- AI augmentation framework
;;; -------------------------------------------------------------------
(define-public fabric-ai
  (package
    (name "fabric-ai")
    (version "1.4.375")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/danielmiessler/fabric")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/danielmiessler/fabric"
           #:tests? #f))
    (home-page "https://github.com/danielmiessler/fabric")
    (synopsis "AI augmentation framework for command-line workflows")
    (description "Fabric is an open-source framework for augmenting
humans using AI.  It provides a modular framework for solving specific
problems using a crowdsourced set of AI prompts that can be used anywhere.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. keybase --- encrypted messaging client
;;; -------------------------------------------------------------------
(define-public keybase
  (package
    (name "keybase")
    (version "6.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/keybase/client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/keybase/client/go/keybase"
           #:unpack-path "github.com/keybase/client"
           #:tests? #f))
    (home-page "https://keybase.io")
    (synopsis "end-to-end encrypted messaging and filesystem client")
    (description "Keybase is a key directory and end-to-end encrypted
messaging and file sharing platform.  It maps social media identities
to encryption keys for easy verification of identity.")
    (license license:bsd-3)))


;;; ===================================================================
;;; CARGO-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 17. artem --- image to ASCII art converter
;;; -------------------------------------------------------------------
(define-public artem
  (package
    (name "artem")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/finefindus/artem")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/finefindus/artem")
    (synopsis "convert images to ASCII art in the terminal")
    (description "Artem is a command-line tool written in Rust that converts
images to ASCII art.  It supports various output formats including plain
text, HTML, and ANSI-colored terminal output.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 18. ttdl --- terminal todo list manager
;;; -------------------------------------------------------------------
(define-public ttdl
  (package
    (name "ttdl")
    (version "6.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VladimirMarkelov/ttdl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/VladimirMarkelov/ttdl")
    (synopsis "terminal todo list manager with todo.txt support")
    (description "TTDL is a terminal-based todo list manager that supports
the todo.txt format.  It provides filtering, sorting, tagging, and
recurring tasks with a simple command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. bzmenu --- Bluetooth menu for Wayland
;;; -------------------------------------------------------------------
(define-public bzmenu
  (package
    (name "bzmenu")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e-tho/bzmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "Bluetooth manager menu for Wayland compositors")
    (description "Bzmenu is a Bluetooth manager menu designed for Wayland
compositors.  It provides a simple interface for scanning, pairing,
connecting, and disconnecting Bluetooth devices.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. minidsp-rs --- MiniDSP control interface
;;; -------------------------------------------------------------------
(define-public minidsp-rs
  (package
    (name "minidsp-rs")
    (version "0.1.12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mrene/minidsp-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mrene/minidsp-rs")
    (synopsis "control interface for MiniDSP audio processors")
    (description "Minidsp-rs provides a command-line interface and library
for controlling MiniDSP audio processors.  It supports setting volume,
mute, input source, and filter parameters via USB or network.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. yara-x --- next-gen YARA pattern matching
;;; -------------------------------------------------------------------
(define-public yara-x
  (package
    (name "yara-x")
    (version "1.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VirusTotal/yara-x")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/VirusTotal/yara-x")
    (synopsis "next generation of YARA pattern matching tool")
    (description "YARA-X is a complete rewrite of YARA in Rust, providing
pattern matching capabilities for malware researchers and security
analysts.  It supports a rich set of patterns including hex strings,
text strings, regular expressions, and conditions.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 22. rustowl --- Rust ownership visualizer
;;; -------------------------------------------------------------------
(define-public rustowl
  (package
    (name "rustowl")
    (version "0.3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cordx56/rustowl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cordx56/rustowl")
    (synopsis "ownership and lifetime visualizer for Rust")
    (description "RustOwl is a tool that visualizes ownership and lifetimes
in Rust programs.  It helps developers understand borrow checker behavior
by providing visual representations of how ownership moves through code.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 23. timewall --- dynamic wallpaper setter
;;; -------------------------------------------------------------------
(define-public timewall
  (package
    (name "timewall")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bcyran/timewall")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bcyran/timewall")
    (synopsis "time-based dynamic wallpaper setter for Linux")
    (description "Timewall is a tool for setting dynamic wallpapers that
change based on the time of day.  It supports Apple HEIF dynamic
wallpapers and provides smooth transitions between different times.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. shadowenv --- directory-specific environment manager
;;; -------------------------------------------------------------------
(define-public shadowenv
  (package
    (name "shadowenv")
    (version "3.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Shopify/shadowenv")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://shopify.github.io/shadowenv")
    (synopsis "reversible directory-specific environment variable manager")
    (description "Shadowenv provides directory-specific environment variables
with the unique feature of being fully reversible.  When you leave a
directory, all environment changes are cleanly undone, unlike tools
like direnv.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. alass --- automatic subtitle synchronization
;;; -------------------------------------------------------------------
(define-public alass
  (package
    (name "alass")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kaegi/alass")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kaegi/alass")
    (synopsis "automatic subtitle synchronization tool")
    (description "Alass (Automatic Language-Agnostic Subtitle Synchronization)
automatically corrects subtitle timing to match the audio of a video
file.  It works by analyzing audio patterns and does not require
knowledge of the language.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 26. meli --- terminal mail client
;;; -------------------------------------------------------------------
(define-public meli
  (package
    (name "meli")
    (version "0.8.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.meli.delivery/meli/meli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://meli.delivery/")
    (synopsis "terminal mail client with JMAP, IMAP, and notmuch support")
    (description "Meli is a terminal-based email client that supports
JMAP, IMAP, Maildir, mbox, and notmuch backends.  It features a
langstroth-style interface, threading, and extensive configuration options.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. ff2mpv-rust --- browser-to-mpv native messaging host
;;; -------------------------------------------------------------------
(define-public ff2mpv-rust
  (package
    (name "ff2mpv-rust")
    (version "1.1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ryze312/ff2mpv-rust")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ryze312/ff2mpv-rust")
    (synopsis "native messaging host for opening browser videos in mpv")
    (description "Ff2mpv-rust is a native messaging host written in Rust
that allows opening video URLs from a web browser directly in the mpv
media player.  It is a fast replacement for the original Python version.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. youtui --- TUI for YouTube Music
;;; -------------------------------------------------------------------
(define-public youtui
  (package
    (name "youtui")
    (version "0.0.35")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nick42d/youtui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nick42d/youtui")
    (synopsis "TUI for YouTube Music with browsing and playback")
    (description "Youtui is a terminal user interface application for
YouTube Music.  It allows browsing, searching, and playing music from
YouTube Music directly in the terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. rusty-man --- Rust documentation viewer
;;; -------------------------------------------------------------------
(define-public rusty-man
  (package
    (name "rusty-man")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~ireas/rusty-man")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://sr.ht/~ireas/rusty-man")
    (synopsis "man-like viewer for Rust documentation")
    (description "Rusty-man is a command-line viewer for Rust documentation.
It renders rustdoc HTML documentation in the terminal, providing a
man-page-like experience for browsing Rust crate documentation.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. geopard --- Gemini protocol browser
;;; -------------------------------------------------------------------
(define-public geopard
  (package
    (name "geopard")
    (version "1.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicohman/geopard")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://ranfdev.com/projects/geopard")
    (synopsis "colorful Gemini protocol browser in the terminal")
    (description "Geopard is a terminal-based browser for the Gemini
protocol.  It provides colorful rendering of Gemini pages with support
for bookmarks, history, and TOFU certificate management.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 31. chezmoi-modify-manager --- chezmoi modify script tool
;;; -------------------------------------------------------------------
(define-public chezmoi-modify-manager
  (package
    (name "chezmoi-modify-manager")
    (version "3.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VorpalBlade/chezmoi_modify_manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/VorpalBlade/chezmoi_modify_manager")
    (synopsis "tool for managing chezmoi modify scripts")
    (description "Chezmoi-modify-manager is a tool that helps manage
modify scripts for the chezmoi dotfile manager.  It provides a structured
way to handle INI-style configuration file modifications.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 32. ttynote --- minimalist terminal notes
;;; -------------------------------------------------------------------
(define-public ttynote
  (package
    (name "ttynote")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/selfAnnihilator/ttynote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/selfAnnihilator/ttynote")
    (synopsis "minimalist terminal note-taking application")
    (description "Ttynote is a minimalist note-taking application for the
terminal.  It provides a simple interface for creating, editing, and
organizing text notes from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. newfetch --- system information tool
;;; -------------------------------------------------------------------
(define-public newfetch
  (package
    (name "newfetch")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/atrexian/newfetch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/atrexian/newfetch")
    (synopsis "system information fetch tool for the terminal")
    (description "Newfetch is a system information fetching tool that
displays system details in the terminal.  It shows information such as
OS, kernel, CPU, memory, and more in a compact format.")
    (license license:gpl3+)))


;;; ===================================================================
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 34. python-langgraph-checkpoint --- LangGraph checkpoint library
;;; -------------------------------------------------------------------
(define-public python-langgraph-checkpoint
  (package
    (name "python-langgraph-checkpoint")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph_checkpoint" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "checkpoint library for LangGraph state persistence")
    (description "Langgraph-checkpoint provides the checkpoint interface
and implementations for LangGraph, enabling state persistence across
graph execution steps in LLM agent workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. python-langgraph-sdk --- LangGraph Python SDK
;;; -------------------------------------------------------------------
(define-public python-langgraph-sdk
  (package
    (name "python-langgraph-sdk")
    (version "0.3.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph_sdk" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "Python SDK for interacting with LangGraph Platform")
    (description "The LangGraph SDK provides a Python client for interacting
with the LangGraph Platform API.  It allows programmatic control of
LangGraph deployments and graph executions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. python-langgraph-cli --- LangGraph CLI
;;; -------------------------------------------------------------------
(define-public python-langgraph-cli
  (package
    (name "python-langgraph-cli")
    (version "0.4.14")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph_cli" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "command-line interface for LangGraph Platform")
    (description "The LangGraph CLI provides command-line tools for
managing LangGraph Platform deployments, including building, testing,
and deploying LangGraph applications.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. python-langgraph-prebuilt --- LangGraph prebuilt components
;;; -------------------------------------------------------------------
(define-public python-langgraph-prebuilt
  (package
    (name "python-langgraph-prebuilt")
    (version "1.0.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph_prebuilt" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "prebuilt components for LangGraph agents")
    (description "Langgraph-prebuilt provides ready-to-use components
for building LangGraph agents, including prebuilt agent architectures,
tool calling patterns, and common workflow templates.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. python-langgraph-checkpoint-sqlite --- LangGraph SQLite backend
;;; -------------------------------------------------------------------
(define-public python-langgraph-checkpoint-sqlite
  (package
    (name "python-langgraph-checkpoint-sqlite")
    (version "3.0.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph_checkpoint_sqlite" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "SQLite checkpoint backend for LangGraph")
    (description "This package provides a SQLite-based checkpoint backend
for LangGraph, enabling lightweight local state persistence for
LLM agent workflows without requiring an external database.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. python-langgraph --- stateful LLM application library
;;; -------------------------------------------------------------------
(define-public python-langgraph
  (package
    (name "python-langgraph")
    (version "1.0.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "langgraph" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/langchain-ai/langgraph")
    (synopsis "library for building stateful LLM agent applications")
    (description "LangGraph is a library for building stateful, multi-actor
applications with LLMs.  It extends the LangChain framework with support
for cycles, persistence, and human-in-the-loop workflows using a graph
abstraction.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. python-aiomax --- async HTTP client library
;;; -------------------------------------------------------------------
(define-public python-aiomax
  (package
    (name "python-aiomax")
    (version "2.12.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aiomax" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dpnspn/aiomax")
    (synopsis "async Python HTTP client library")
    (description "Aiomax is an asynchronous HTTP client library for Python
built on asyncio.  It provides a high-level API for making HTTP requests
with connection pooling and session management.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. python-gql --- GraphQL client for Python
;;; -------------------------------------------------------------------
(define-public python-gql
  (package
    (name "python-gql")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gql" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/graphql-python/gql")
    (synopsis "GraphQL client for Python with sync and async support")
    (description "Gql is a GraphQL client for Python that supports both
synchronous and asynchronous transports.  It provides query validation,
variables, subscriptions, and multiple transport backends including HTTP,
WebSocket, and aiohttp.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. python-zenlib --- Python utility library
;;; -------------------------------------------------------------------
(define-public python-zenlib
  (package
    (name "python-zenlib")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "zenlib" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/desultory/zenlib")
    (synopsis "Python utility library for common operations")
    (description "Zenlib is a Python utility library that provides helper
classes and functions for common programming tasks, including logging,
configuration management, and system interaction utilities.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 43. python-sparklines --- terminal sparkline generator
;;; -------------------------------------------------------------------
(define-public python-sparklines
  (package
    (name "python-sparklines")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "sparklines" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/deeplook/sparklines")
    (synopsis "generate sparklines in the terminal")
    (description "Sparklines is a Python library for generating Unicode
sparkline charts in the terminal.  It converts lists of numbers into
compact visual representations using Unicode block characters.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 44. python-mfusepy --- Python FUSE bindings
;;; -------------------------------------------------------------------
(define-public python-mfusepy
  (package
    (name "python-mfusepy")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mfusepy" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mxmlnkn/mfusepy")
    (synopsis "Python FUSE bindings library using ctypes")
    (description "Mfusepy provides Python bindings for FUSE (Filesystem
in Userspace) using ctypes.  It is a maintained fork of fusepy that adds
support for macFUSE and fixes various issues.")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 45. python-pycpio --- Python CPIO archive library
;;; -------------------------------------------------------------------
(define-public python-pycpio
  (package
    (name "python-pycpio")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pycpio" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/desultory/pycpio")
    (synopsis "Python library for CPIO archives")
    (description "Pycpio is a Python library for creating and reading CPIO
archives.  It supports the newc CPIO format and provides both a library
API and command-line tools for working with CPIO files.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 46. python-aioboto3 --- async wrapper for boto3
;;; -------------------------------------------------------------------
(define-public python-aioboto3
  (package
    (name "python-aioboto3")
    (version "15.5.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "aioboto3" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/terricain/aioboto3")
    (synopsis "async/await wrapper around boto3 AWS SDK")
    (description "Aioboto3 is an async/await wrapper around the boto3
AWS SDK for Python.  It allows using AWS services with asyncio, providing
the same API as boto3 but with non-blocking I/O.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 47. python-pyrr --- 3D math library
;;; -------------------------------------------------------------------
(define-public python-pyrr
  (package
    (name "python-pyrr")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyrr" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/adamlwgriffiths/Pyrr")
    (synopsis "3D mathematical operations library for Python")
    (description "Pyrr is a Python library providing 3D mathematical
functions including matrices, vectors, quaternions, and geometric
operations commonly needed in 3D graphics programming.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 48. python-isosurfaces --- isosurface computation library
;;; -------------------------------------------------------------------
(define-public python-isosurfaces
  (package
    (name "python-isosurfaces")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "isosurfaces" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jared-hughes/isosurfaces")
    (synopsis "library for computing isosurfaces of functions")
    (description "Isosurfaces is a Python library for computing
isosurfaces (contour surfaces) of mathematical functions.  It provides
efficient algorithms for extracting level sets from scalar fields.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 49. python-toml-sort --- TOML file sorter
;;; -------------------------------------------------------------------
(define-public python-toml-sort
  (package
    (name "python-toml-sort")
    (version "0.24.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "toml_sort" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pappasam/toml-sort")
    (synopsis "command-line tool for sorting TOML files")
    (description "Toml-sort is a command-line utility and Python library
for sorting TOML files.  It alphabetically sorts keys and sections while
preserving comments and formatting.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. pyzbar --- barcode reader wrapper
;;; -------------------------------------------------------------------
(define-public pyzbar
  (package
    (name "pyzbar")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyzbar" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/NaturalHistoryMuseum/pyzbar")
    (synopsis "Python wrapper for the zbar barcode reader")
    (description "Pyzbar is a Python wrapper around the zbar C library for
reading barcodes and QR codes from images.  It supports a wide variety
of barcode symbologies and works with PIL/Pillow images.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. tzupdate --- timezone updater via IP geolocation
;;; -------------------------------------------------------------------
(define-public tzupdate
  (package
    (name "tzupdate")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "tzupdate" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cdown/tzupdate")
    (synopsis "set system timezone based on IP geolocation")
    (description "Tzupdate is a tool that automatically sets the system
timezone based on IP geolocation.  It queries geolocation services to
determine the current timezone and updates the system clock accordingly.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. python-anthropic --- Anthropic API SDK
;;; -------------------------------------------------------------------
(define-public python-anthropic
  (package
    (name "python-anthropic")
    (version "0.75.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "anthropic" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/anthropics/anthropic-sdk-python")
    (synopsis "official Python SDK for the Anthropic API")
    (description "The Anthropic Python SDK provides convenient access to
the Anthropic REST API from Python applications.  It includes typed
request and response objects, streaming support, and async clients
for the Claude family of AI models.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. mkdocs-include-markdown-plugin --- MkDocs include plugin
;;; -------------------------------------------------------------------
(define-public mkdocs-include-markdown-plugin
  (package
    (name "mkdocs-include-markdown-plugin")
    (version "7.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mkdocs_include_markdown_plugin" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mondeja/mkdocs-include-markdown-plugin")
    (synopsis "MkDocs plugin to include Markdown files")
    (description "This MkDocs plugin provides directives to include content
from other Markdown files in your documentation.  It supports including
entire files or specific sections with line range selection.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 54. fypp --- Fortran metaprogramming preprocessor
;;; -------------------------------------------------------------------
(define-public fypp
  (package
    (name "fypp")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "fypp" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://fypp.readthedocs.io/")
    (synopsis "Fortran metaprogramming preprocessor")
    (description "Fypp is a Python-powered preprocessor for Fortran that
provides metaprogramming capabilities such as conditional compilation,
loop unrolling, and template-style generic programming using Python
expressions embedded in Fortran source code.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 55. python-leveldb --- Python LevelDB bindings
;;; -------------------------------------------------------------------
(define-public python-leveldb
  (package
    (name "python-leveldb")
    (version "0.201")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "leveldb" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rjpower/py-leveldb")
    (synopsis "Python bindings for LevelDB key-value store")
    (description "Python-leveldb provides Python bindings for Google's
LevelDB fast key-value storage library.  It offers a Pythonic API for
creating, reading, writing, and iterating over LevelDB databases.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 56. camset --- V4L2 camera settings GUI
;;; -------------------------------------------------------------------
(define-public camset
  (package
    (name "camset")
    (version "0.0.21")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "camset" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/azeam/camset")
    (synopsis "GUI tool for configuring V4L2 camera settings")
    (description "Camset is a GTK-based graphical tool for configuring
V4L2 camera settings.  It provides a user-friendly interface for adjusting
brightness, contrast, white balance, and other camera parameters.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. blockdiag --- block diagram generator
;;; -------------------------------------------------------------------
(define-public blockdiag
  (package
    (name "blockdiag")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "blockdiag" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/yuzutech/blockdiag")
    (synopsis "simple block diagram image generator")
    (description "Blockdiag generates block diagram images from simple
text definitions.  It supports automatic layout, grouping, and various
output formats including PNG, SVG, and PDF.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 58. seqdiag --- sequence diagram generator
;;; -------------------------------------------------------------------
(define-public seqdiag
  (package
    (name "seqdiag")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "seqdiag" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/arenevier/seqdiag")
    (synopsis "simple sequence diagram image generator")
    (description "Seqdiag generates sequence diagram images from simple
text definitions.  It supports automatic layout, self-referencing,
edge labels, and various output formats including PNG, SVG, and PDF.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 59. mimeo --- XDG MIME association tool
;;; -------------------------------------------------------------------
(define-public mimeo
  (package
    (name "mimeo")
    (version "2023")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://xyne.dev/projects/mimeo/src/mimeo-"
                    version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://xyne.dev/projects/mimeo")
    (synopsis "XDG MIME application association tool")
    (description "Mimeo is a tool for managing XDG MIME type associations.
It can determine file types and open files with the appropriate
application based on MIME type configuration.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 60. changedetection.io --- web page change detector
;;; -------------------------------------------------------------------
(define-public changedetection.io
  (package
    (name "changedetection.io")
    (version "0.54.9")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "changedetection.io" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dgtlmoon/changedetection.io")
    (synopsis "web page change detection and notification service")
    (description "Changedetection.io is a self-hosted web page change
detection and notification service.  It monitors web pages for changes
and sends alerts via email, Discord, Slack, and other channels.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 61. anki-sync-server --- self-hosted Anki sync server
;;; -------------------------------------------------------------------
(define-public anki-sync-server
  (package
    (name "anki-sync-server")
    (version "25.09.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "anki" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ankitects/anki")
    (synopsis "self-hosted sync server for Anki flashcards")
    (description "Anki-sync-server provides a self-hosted synchronization
server for the Anki flashcard application.  It allows users to sync their
flashcard collections without using AnkiWeb.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 62. systemd-pilot --- systemd service manager GUI
;;; -------------------------------------------------------------------
(define-public systemd-pilot
  (package
    (name "systemd-pilot")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "systemd-pilot" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mfat/systemd-pilot")
    (synopsis "GUI tool for managing systemd services")
    (description "Systemd-pilot is a graphical tool for managing systemd
services.  It provides a user-friendly interface for starting, stopping,
enabling, and disabling systemd units.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 63. thinkfan-cli --- ThinkPad fan controller CLI
;;; -------------------------------------------------------------------
(define-public thinkfan-cli
  (package
    (name "thinkfan-cli")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "thinkfan-cli" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rahmedi/thinkfan-cli")
    (synopsis "command-line tool for controlling ThinkPad fan speed")
    (description "Thinkfan-cli is a command-line tool for manually
controlling the fan speed on Lenovo ThinkPad laptops.  It provides
direct control over fan speed levels through the thinkpad_acpi kernel
module.")
    (license license:gpl3+)))


;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 64. qdocumentview --- Qt document viewer widget
;;; -------------------------------------------------------------------
(define-public qdocumentview
  (package
    (name "qdocumentview")
    (version "0.3.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/extraqt/qdocumentview")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.com/extraqt/qdocumentview")
    (synopsis "Qt document viewer widget for PDF and other formats")
    (description "QDocumentView is a Qt widget for viewing PDF and other
document formats.  It provides zooming, panning, and page navigation
functionality that can be embedded in Qt applications.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 65. paho-mqtt-c --- Eclipse Paho MQTT C library
;;; -------------------------------------------------------------------
(define-public paho-mqtt-c
  (package
    (name "paho-mqtt-c")
    (version "1.3.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eclipse/paho.mqtt.c")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.eclipse.org/paho/")
    (synopsis "Eclipse Paho MQTT C client library")
    (description "The Eclipse Paho MQTT C client library provides an
MQTT client in ANSI C.  It supports MQTT v3.1, v3.1.1, and v5.0 with
synchronous and asynchronous APIs, SSL/TLS, and automatic reconnect.")
    (license license:epl2.0)))

;;; -------------------------------------------------------------------
;;; 66. paho-mqtt-cpp --- Eclipse Paho MQTT C++ library
;;; -------------------------------------------------------------------
(define-public paho-mqtt-cpp
  (package
    (name "paho-mqtt-cpp")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eclipse/paho.mqtt.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list paho-mqtt-c))
    (home-page "https://github.com/eclipse/paho.mqtt.cpp")
    (synopsis "Eclipse Paho MQTT C++ client library")
    (description "The Eclipse Paho MQTT C++ client library provides a
modern C++ wrapper around the Paho C library.  It supports MQTT v3.1,
v3.1.1, and v5.0 with a clean object-oriented API.")
    (license license:epl2.0)))

;;; -------------------------------------------------------------------
;;; 67. cutechess --- chess game and engine manager
;;; -------------------------------------------------------------------
(define-public cutechess
  (package
    (name "cutechess")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cutechess/cutechess")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/cutechess/cutechess")
    (synopsis "graphical chess game and engine tournament manager")
    (description "Cute Chess is a graphical user interface and command-line
tool for playing chess and managing engine-vs-engine tournaments.  It
supports UCI and xboard protocols and various time controls.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 68. pokefinder --- Pokemon RNG tool
;;; -------------------------------------------------------------------
(define-public pokefinder
  (package
    (name "pokefinder")
    (version "4.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Admiral-Fish/PokeFinder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Admiral-Fish/PokeFinder")
    (synopsis "cross-platform Pokemon RNG tool")
    (description "PokeFinder is a cross-platform RNG (Random Number
Generator) tool for Pokemon games.  It helps researchers predict and
manipulate in-game random outcomes across multiple Pokemon generations.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 69. cargs --- C command-line argument parser
;;; -------------------------------------------------------------------
(define-public cargs
  (package
    (name "cargs")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/likle/cargs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://likle.github.io/cargs/")
    (synopsis "lightweight C command-line argument parser")
    (description "Cargs is a lightweight command-line argument parsing
library for C.  It provides a simple API for defining options with
long and short forms, automatic help generation, and value parsing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 70. audiowaveform --- audio waveform generator
;;; -------------------------------------------------------------------
(define-public audiowaveform
  (package
    (name "audiowaveform")
    (version "1.10.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bbc/audiowaveform")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/bbc/audiowaveform")
    (synopsis "tool for generating audio waveform data and images")
    (description "Audiowaveform is a C++ tool from the BBC for generating
waveform data and images from audio files.  It supports MP3, WAV, FLAC,
and Ogg Vorbis input and can produce PNG images or JSON/binary data files.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 71. vnote --- note-taking with Markdown
;;; -------------------------------------------------------------------
(define-public vnote
  (package
    (name "vnote")
    (version "3.19.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vnotex/vnote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://vnotex.github.io/vnote/en_us/")
    (synopsis "note-taking application with Markdown support")
    (description "VNote is a Qt-based note-taking application focused on
Markdown.  It provides in-place preview, syntax highlighting, diagrams,
math formulas, and a notebook-based organization system.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 72. codelite --- C/C++ IDE
;;; -------------------------------------------------------------------
(define-public codelite
  (package
    (name "codelite")
    (version "18.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eranif/codelite")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codelite.org/")
    (synopsis "cross-platform C/C++ and PHP IDE")
    (description "CodeLite is an open-source, cross-platform IDE for C,
C++, PHP, and Node.js.  It features code completion, debugging, refactoring,
Git integration, and support for various compilers and build systems.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 73. pdftag --- PDF metadata editor
;;; -------------------------------------------------------------------
(define-public pdftag
  (package
    (name "pdftag")
    (version "1.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arrufat/pdftag")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/arrufat/pdftag")
    (synopsis "command-line tool for editing PDF metadata tags")
    (description "Pdftag is a command-line tool for viewing and editing
PDF metadata tags such as title, author, subject, and keywords.  It uses
the Poppler library for PDF handling.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. mednaffe --- Mednafen front-end
;;; -------------------------------------------------------------------
(define-public mednaffe
  (package
    (name "mednaffe")
    (version "0.9.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AmatCoder/mednaffe")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AmatCoder/mednaffe")
    (synopsis "GTK front-end for the Mednafen emulator")
    (description "Mednaffe is a GTK-based graphical front-end for the
Mednafen multi-system emulator.  It provides a user-friendly interface
for configuring and launching games across various retro gaming platforms.")
    (license license:gpl3)))


;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 75. mp3splt-gtk --- GTK GUI for mp3splt
;;; -------------------------------------------------------------------
(define-public mp3splt-gtk
  (package
    (name "mp3splt-gtk")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/mp3splt/mp3splt-gtk-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://mp3splt.sourceforge.net")
    (synopsis "GTK GUI for mp3splt audio file splitter")
    (description "Mp3splt-gtk is a GTK graphical interface for mp3splt,
a tool that splits MP3, Ogg Vorbis, and FLAC files without decoding.
It supports splitting by silence detection, fixed intervals, or CUE
sheet track points.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 76. moon-buggy --- text-mode driving game
;;; -------------------------------------------------------------------
(define-public moon-buggy
  (package
    (name "moon-buggy")
    (version "1.0.51")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://m.seehuhn.de/programs/moon-buggy-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://seehuhn.de/comp/moon-buggy")
    (synopsis "text-mode side-scrolling buggy driving game")
    (description "Moon-buggy is a simple character-graphics game where you
drive a buggy across the moon's surface, jumping over craters and shooting
aliens.  It runs in any text terminal.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 77. mmv --- mass file mover/renamer
;;; -------------------------------------------------------------------
(define-public mmv
  (package
    (name "mmv")
    (version "2.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rrthomas/mmv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/rrthomas/mmv")
    (synopsis "tool for mass moving and renaming files")
    (description "Mmv is a command-line tool for mass moving, copying,
appending, and linking files using wildcard patterns.  It provides
a safe way to perform bulk file operations with collision detection.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 78. stressapptest --- memory and CPU stress tester
;;; -------------------------------------------------------------------
(define-public stressapptest
  (package
    (name "stressapptest")
    (version "1.0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stressapptest/stressapptest")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stressapptest/stressapptest")
    (synopsis "memory and CPU stress test tool from Google")
    (description "Stressapptest (Stressful Application Test) is a tool
from Google designed to stress test memory and CPU subsystems.  It
maximizes data throughput to find hardware defects including memory
errors, cache issues, and thermal problems.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 79. aview --- ASCII art image viewer
;;; -------------------------------------------------------------------
(define-public aview
  (package
    (name "aview")
    (version "1.3.0rc1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mfgimenez/aview")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://aa-project.sourceforge.net/aview/")
    (synopsis "ASCII art image viewer using the AAlib library")
    (description "Aview is an ASCII art image viewer that uses the AAlib
library to render images as text characters in the terminal.  It supports
various image formats and provides zooming and panning.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 80. find-cursor --- X11 cursor highlighter
;;; -------------------------------------------------------------------
(define-public find-cursor
  (package
    (name "find-cursor")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arp242/find-cursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure))))
    (home-page "https://github.com/arp242/find-cursor")
    (synopsis "simple X11 cursor highlighter for presentations")
    (description "Find-cursor is a simple tool that highlights the X11
cursor position with a large animated circle.  It is useful for
presentations and screencasts where the cursor may be hard to see.")
    (license license:expat)))


;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 81. netatalk --- Apple Filing Protocol server
;;; -------------------------------------------------------------------
(define-public netatalk
  (package
    (name "netatalk")
    (version "4.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Netatalk/netatalk")
                    (commit (string-append "netatalk-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://netatalk.io")
    (synopsis "Apple Filing Protocol file server")
    (description "Netatalk is a free and open-source implementation of
the Apple Filing Protocol (AFP).  It allows Unix-like systems to serve
as file servers for Macintosh computers, supporting Time Machine
backups and Spotlight search.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 82. miracle-wm --- tiling Wayland compositor
;;; -------------------------------------------------------------------
(define-public miracle-wm
  (package
    (name "miracle-wm")
    (version "0.7.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/miracle-wm-org/miracle-wm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/miracle-wm-org/miracle-wm")
    (synopsis "tiling Wayland compositor based on Mir")
    (description "Miracle-wm is a tiling Wayland compositor built on top
of Canonical's Mir display server library.  It provides automatic tiling
window management with support for workspaces and floating windows.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 83. plank-reloaded --- dock application
;;; -------------------------------------------------------------------
(define-public plank-reloaded
  (package
    (name "plank-reloaded")
    (version "0.11.167")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/plank-reloaded")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/zquestz/plank-reloaded")
    (synopsis "dock application for Linux desktops")
    (description "Plank Reloaded is a simple, lightweight dock for Linux
desktops.  It provides a macOS-style application launcher dock with
support for launchers, window previews, and themes.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 84. fontdownloader --- GTK font installer
;;; -------------------------------------------------------------------
(define-public fontdownloader
  (package
    (name "fontdownloader")
    (version "10.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GustavoPeredo/font-downloader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/GustavoPeredo/font-downloader")
    (synopsis "GTK application for downloading and installing fonts")
    (description "Font Downloader is a GTK application that allows users
to browse, preview, and install fonts from Google Fonts.  It provides
a simple interface for discovering and managing fonts.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 85. ascii-draw --- GTK ASCII art drawing
;;; -------------------------------------------------------------------
(define-public ascii-draw
  (package
    (name "ascii-draw")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nokse22/ascii-draw")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Nokse22/ascii-draw")
    (synopsis "GTK application for drawing ASCII art")
    (description "ASCII Draw is a GTK4 application for drawing ASCII art.
It provides tools for drawing lines, rectangles, text, and freeform
shapes using ASCII characters in a canvas interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 86. televido --- German public TV streaming
;;; -------------------------------------------------------------------
(define-public televido
  (package
    (name "televido")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/d-k-bo/televido")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/d-k-bo/televido")
    (synopsis "GTK application for watching German public TV streams")
    (description "Televido is a GTK4 application for browsing and watching
content from German public television media libraries (Mediathek).  It
supports ARD, ZDF, and other German public broadcasters.")
    (license license:gpl3+)))


;;; ===================================================================
;;; NODE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 87. textlint --- natural language linting framework
;;; -------------------------------------------------------------------
(define-public textlint
  (package
    (name "textlint")
    (version "15.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/textlint/-/textlint-"
                    version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'build))))
    (home-page "https://github.com/textlint/textlint")
    (synopsis "pluggable natural language linting framework")
    (description "Textlint is a pluggable linting framework for natural
language text.  It checks prose for style issues, grammar errors, and
custom rules defined by plugins, similar to how ESLint works for code.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. nodejs-nodemon --- Node.js auto-restart tool
;;; -------------------------------------------------------------------
(define-public nodejs-nodemon
  (package
    (name "nodejs-nodemon")
    (version "3.1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/nodemon/-/nodemon-"
                    version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'build))))
    (home-page "https://nodemon.io")
    (synopsis "tool for automatically restarting Node.js applications")
    (description "Nodemon is a development utility that monitors files
in a Node.js project and automatically restarts the application when
file changes are detected.  It works with any Node.js application.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 89. aicommits --- AI-powered commit message generator
;;; -------------------------------------------------------------------
(define-public aicommits
  (package
    (name "aicommits")
    (version "3.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nutlope/aicommits")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'build))))
    (home-page "https://github.com/Nutlope/aicommits")
    (synopsis "AI-powered tool for generating Git commit messages")
    (description "AICommits is a CLI tool that uses AI to generate
meaningful Git commit messages based on staged changes.  It analyzes
the diff and produces conventional commit messages automatically.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 90. nodejs-neovim --- Neovim Node.js client
;;; -------------------------------------------------------------------
(define-public nodejs-neovim
  (package
    (name "nodejs-neovim")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/neovim/-/neovim-"
                    version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'build))))
    (home-page "https://github.com/neovim/node-client")
    (synopsis "Neovim client library and host for Node.js plugins")
    (description "This package provides a Node.js client for the Neovim
editor.  It enables writing Neovim plugins in JavaScript or TypeScript
and serves as the remote plugin host for Node.js-based Neovim plugins.")
    (license license:expat)))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (BINARIES)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 91. hdfview-bin --- HDF file viewer (binary)
;;; -------------------------------------------------------------------
(define-public hdfview-bin
  (package
    (name "hdfview-bin")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HDFGroup/hdfview/releases/download/v"
                    version "/HDFView-" version
                    "-Linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hdfview/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HDFGroup/hdfview")
    (synopsis "visual tool for browsing HDF5 and HDF4 files")
    (description "HDFView is a visual tool for browsing and editing HDF5
and HDF4 files.  It provides a tree-based interface for navigating
hierarchical data structures and viewing datasets as tables or images.")
    (license (license:non-copyleft
              "https://github.com/HDFGroup/hdfview/blob/master/LICENSE"
              "HDF Group BSD-style license"))))

;;; -------------------------------------------------------------------
;;; 92. zigup-bin --- Zig version manager (binary)
;;; -------------------------------------------------------------------
(define-public zigup-bin
  (package
    (name "zigup-bin")
    (version "2025_05_24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marler8997/zigup/releases/download/"
                    version "/x86_64-linux.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("zigup" "bin/zigup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marler8997/zigup")
    (synopsis "Zig language version manager")
    (description "Zigup is a version manager for the Zig programming
language.  It allows installing, switching between, and managing multiple
Zig compiler versions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 93. openvscode-server-bin --- VS Code server (binary)
;;; -------------------------------------------------------------------
(define-public openvscode-server-bin
  (package
    (name "openvscode-server-bin")
    (version "1.98.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gitpod-io/openvscode-server/releases/"
                    "download/openvscode-server-v" version
                    "/openvscode-server-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/openvscode-server/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gitpod-io/openvscode-server")
    (synopsis "open-source VS Code server for browser-based editing")
    (description "OpenVSCode Server is an open-source version of VS Code
that runs as a server, enabling browser-based code editing.  It provides
the full VS Code experience accessible through a web browser.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 94. coursier-bin --- Scala artifact fetcher (binary)
;;; -------------------------------------------------------------------
(define-public coursier-bin
  (package
    (name "coursier-bin")
    (version "2.1.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coursier/coursier/releases/download/v"
                    version "/cs-x86_64-pc-linux.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cs-x86_64-pc-linux" "bin/cs"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'make-executable
                 (lambda _
                   (chmod "cs-x86_64-pc-linux" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://get-coursier.io")
    (synopsis "Scala artifact fetching and launcher tool")
    (description "Coursier is a Scala artifact fetching tool that can
resolve and download Maven/Ivy dependencies.  It also serves as a
launcher for Scala applications and manages Scala tool installations.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 95. airvpn-suite-beta-bin --- AirVPN client suite (binary)
;;; -------------------------------------------------------------------
(define-public airvpn-suite-beta-bin
  (package
    (name "airvpn-suite-beta-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://eddie.website/repository/eddie3/tar/"
                    "AirVPN-Suite-x86_64-" version "-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/airvpn-suite/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://airvpn.org/linux/suite")
    (synopsis "VPN client suite for AirVPN service")
    (description "AirVPN Suite is the official VPN client suite for the
AirVPN service.  It provides OpenVPN and WireGuard-based VPN connectivity
with a command-line interface for managing connections.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 96. marktext-bin --- Markdown editor (binary)
;;; -------------------------------------------------------------------
(define-public marktext-bin
  (package
    (name "marktext-bin")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marktext/marktext/releases/download/v"
                    version "/marktext-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("marktext-x86_64.AppImage" "bin/marktext"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/marktext")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.marktext.cc")
    (synopsis "Markdown editor focused on speed and usability")
    (description "Mark Text is a free and open-source Markdown editor
focused on speed and usability.  It provides real-time preview, focus
mode, typewriter mode, and supports CommonMark, GitHub Flavored
Markdown, and math expressions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 97. github-desktop-bin --- GitHub Desktop for Linux (binary)
;;; -------------------------------------------------------------------
(define-public github-desktop-bin
  (package
    (name "github-desktop-bin")
    (version "3.4.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shiftkey/desktop/releases/download/"
                    "release-" version "-linux2/"
                    "GitHubDesktop-linux-amd64-" version "-linux2.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/github-desktop/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://desktop.github.com")
    (synopsis "GitHub Desktop application for Linux")
    (description "GitHub Desktop is a graphical Git client that simplifies
working with GitHub repositories.  This is the community-maintained
Linux fork providing the same features as the official macOS and Windows
versions.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. frog-ocr-bin --- OCR text extraction tool (binary)
;;; -------------------------------------------------------------------
(define-public frog-ocr-bin
  (package
    (name "frog-ocr-bin")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TenderOwl/Frog/releases/download/"
                    version "/Frog-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "Frog-" #$version "-x86_64.AppImage")
                         "bin/frog-ocr"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/frog-ocr")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getfrog.app")
    (synopsis "OCR text extraction tool with GTK interface")
    (description "Frog is a text extraction tool that uses OCR (Optical
Character Recognition) to extract text from images and screen regions.
It provides a simple GTK interface for quick text capture.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 99. nym-vpn-app-bin --- Nym VPN client (binary)
;;; -------------------------------------------------------------------
(define-public nym-vpn-app-bin
  (package
    (name "nym-vpn-app-bin")
    (version "1.27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nymtech/nym-vpn-client/releases/"
                    "download/nym-vpn-app-v" version
                    "/nym-vpn-app_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nym-vpn-app/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nymtech/nym-vpn-client")
    (synopsis "VPN client for the Nym mixnet privacy network")
    (description "Nym VPN App is a VPN client for the Nym privacy network.
It routes traffic through a decentralized mixnet that provides strong
metadata protection beyond what traditional VPNs offer.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 100. wayback-machine-downloader --- Wayback Machine downloader
;;; -------------------------------------------------------------------
(define-public wayback-machine-downloader
  (package
    (name "wayback-machine-downloader")
    (version "2.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hartator/wayback-machine-downloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/wayback-machine-downloader/"))))
    (home-page "https://github.com/hartator/wayback-machine-downloader")
    (synopsis "tool for downloading websites from the Wayback Machine")
    (description "Wayback Machine Downloader is a tool for downloading
entire websites from the Internet Archive's Wayback Machine.  It can
reconstruct website snapshots from archived versions.")
    (license license:expat)))
