;;; Dep-tree priority 100 resolution pass — 2026-04-06 (r22-w03 batch b)
;;; 14 recipes: 4 binary packages, 3 cmake/meson C/C++ libs, 2 Python libs,
;;; 2 copy-build plugins, 1 Go proxy, 1 makefile C project, 1 bash script.
(define-module (gaurix packages queue-20260406-blocked-tree-r22w03b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages video)   ;; mpv is in video
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (nordvpn-bin
            lianwall-bin
            ollama-mlx-cuda13-bin
            dotnet-runtime-preview-bin
            mdns-scan
            smpq
            obs-pwvideo
            imsprog
            buildcache
            python-uncalled-for
            python-rapidgzip
            mpv-uosc
            downgrade
            mihomo))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — prebuilt binaries via copy-build-system
;; ═══════════════════════════════════════════════════════════════════

(define-public nordvpn-bin
  (package
    (name "nordvpn-bin")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_"
             version "_amd64.deb"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/sbin/nordvpnd" "sbin/nordvpnd")
               ("usr/bin/nordvpn" "bin/nordvpn"))))
    (home-page "https://nordvpn.com/download/linux/")
    (synopsis "NordVPN CLI tool for Linux")
    (description "NordVPN is a VPN client that provides an encrypted connection
to the NordVPN service.  This package contains the command-line interface and
background daemon for managing VPN connections.")
    (license (license:non-copyleft
              "https://nordvpn.com/terms-of-service/"
              "NordVPN proprietary license"))))

(define-public lianwall-bin
  (package
    (name "lianwall-bin")
    (version "5.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianwall/releases/download/v"
             version "/lianwall-" version "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lianwall" "bin/lianwall"))))
    (home-page "https://github.com/Yueosa/lianwall")
    (synopsis "wallpaper engine based on swww and mpvpaper")
    (description "LianWall is a wallpaper engine based on awww/swww and
mpvpaper.  It provides a command-line interface for setting and managing
desktop wallpapers on Wayland compositors.")
    (license license:expat)))

(define-public ollama-mlx-cuda13-bin
  (package
    (name "ollama-mlx-cuda13-bin")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v"
             version "/ollama-linux-amd64.tgz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/ollama" "bin/ollama"))))
    (home-page "https://github.com/ollama/ollama")
    (synopsis "run large language models locally with CUDA 13 support")
    (description "Ollama allows you to create, run and share large language
models locally.  This binary package includes MLX CUDA 13 support for GPU
acceleration.")
    (license license:expat)))

(define-public dotnet-runtime-preview-bin
  (package
    (name "dotnet-runtime-preview-bin")
    (version "11.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/Runtime/"
             version "-preview.2.25163.2/dotnet-runtime-"
             version "-preview.2.25163.2-linux-x64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dotnet/"))))
    (home-page "https://www.microsoft.com/net/core")
    (synopsis ".NET runtime preview binary distribution")
    (description "The .NET runtime provides the components needed to run
.NET applications.  This is a preview release of the .NET 11 runtime,
distributed as a prebuilt binary.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; C/C++ source builds — cmake, meson, GNU
;; ═══════════════════════════════════════════════════════════════════

(define-public mdns-scan
  (package
    (name "mdns-scan")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://0pointer.de/lennart/projects/mdns-scan/mdns-scan-"
             version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash — run `guix download` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "http://0pointer.de/lennart/projects/mdns-scan/")
    (synopsis "scan mDNS/DNS-SD published services on the local network")
    (description "mdns-scan is a tool for scanning mDNS/DNS-SD published
services on the local network.  It works by sending DNS queries via
multicast and listening for responses from mDNS-enabled devices.")
    (license license:gpl2+)))

(define-public smpq
  (package
    (name "smpq")
    (version "1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ge0rg/smpq")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash — run `guix hash -x --serializer=nar` to obtain
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list zlib bzip2))
    (native-inputs (list pkg-config))
    (home-page "https://launchpad.net/smpq")
    (synopsis "StormLib MPQ archiving utility for Blizzard game files")
    (description "SmpQ is a StormLib MPQ archiving utility designed for full
manipulation of Blizzard MPQ archive files.  MPQ (Mo'PaQ) is an archive format
used by Blizzard Entertainment games.")
    (license license:gpl3)))

(define-public obs-pwvideo
  (package
    (name "obs-pwvideo")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoshinolina/obs-pwvideo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list obs pipewire))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/hoshinolina/obs-pwvideo")
    (synopsis "OBS plugin for generic PipeWire video sources")
    (description "obs-pwvideo is an OBS Studio plugin that provides support for
capturing generic PipeWire video sources.  It allows OBS to use PipeWire-based
video streams as input sources.")
    (license license:gpl2)))

(define-public imsprog
  (package
    (name "imsprog")
    (version "1.8.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bigbigmdm/imsprog")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list qtbase-5 libusb))
    (native-inputs (list pkg-config cmake))
    (home-page "https://github.com/bigbigmdm/imsprog")
    (synopsis "EEPROM/flash chip programmer for CH341a devices")
    (description "IMSProg is a GUI programmer for I2C, SPI and MicroWire
EEPROM/flash chips using CH341a USB devices.  It supports reading, writing,
erasing, and verifying a wide range of memory chips.")
    (license license:gpl2+)))

(define-public buildcache
  (package
    (name "buildcache")
    (version "0.31.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/bits-n-bites/buildcache")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list openssl zlib))
    (native-inputs (list pkg-config))
    (home-page "https://gitlab.com/bits-n-bites/buildcache")
    (synopsis "advanced compiler accelerator and build cache")
    (description "BuildCache is a compiler accelerator that caches compilation
results.  It wraps the compiler and stores the output of compilations so that
identical compilations can be served from the cache.")
    (license license:zlib)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

(define-public python-uncalled-for
  (package
    (name "python-uncalled-for")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uncalled_for" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-hatchling))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/chrisguidry/uncalled-for/")
    (synopsis "async dependency injection for Python functions")
    (description "Uncalled-for provides async dependency injection for Python
functions.  It enables declarative dependency resolution and injection for
asynchronous and synchronous Python code.")
    (license license:expat)))

(define-public python-rapidgzip
  (package
    (name "python-rapidgzip")
    (version "0.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rapidgzip" version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-cython python-setuptools))
    (propagated-inputs (list python-numpy))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mxmlnkn/rapidgzip")
    (synopsis "parallelized gzip decoder with seek capability")
    (description "Rapidgzip is a parallelized gzip decoder that supports
random seek access to gzip files.  It can decompress gzip files significantly
faster than standard gzip by utilizing multiple CPU cores.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Copy/plugin packages
;; ═══════════════════════════════════════════════════════════════════

(define-public mpv-uosc
  (package
    (name "mpv-uosc")
    (version "5.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tomasklaen/uosc")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/uosc" "share/mpv/scripts/uosc/")
               ("src/uosc.conf" "share/mpv/script-opts/uosc.conf"))))
    (home-page "https://github.com/tomasklaen/uosc")
    (synopsis "feature-rich minimalist proximity-based UI for mpv")
    (description "uosc is a feature-rich minimalist proximity-based user
interface for the mpv media player.  It provides an on-screen controller
with elements that appear based on cursor proximity.")
    (license license:lgpl2.1+)))

(define-public downgrade
  (package
    (name "downgrade")
    (version "12.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/archlinux-downgrade/downgrade")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list bash))
    (arguments
     (list #:install-plan
           #~'(("downgrade" "bin/downgrade"))))
    (home-page "https://github.com/archlinux-downgrade/downgrade")
    (synopsis "bash script for downgrading Arch Linux packages")
    (description "Downgrade is a Bash script for downgrading one or more Arch
Linux packages to a version in the local cache or the Arch Linux Archive.
Note: this tool is Arch-specific and provided for reference.")
    (license license:gpl2)))

;; ═══════════════════════════════════════════════════════════════════
;; Go package
;; ═══════════════════════════════════════════════════════════════════

(define-public mihomo
  (package
    (name "mihomo")
    (version "1.19.22")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/MetaCubeX/mihomo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/MetaCubeX/mihomo"
           #:tests? #f))
    (home-page "https://github.com/MetaCubeX/mihomo")
    (synopsis "rule-based network proxy with multiple protocol support")
    (description "Mihomo (formerly Clash.Meta) is a rule-based network proxy
supporting multiple protocols including Shadowsocks, VMess, Trojan, VLESS,
WireGuard, Hysteria, and others.  It features a RESTful API for runtime
configuration.")
    (license license:gpl3)))
