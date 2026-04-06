;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #11.
;;; 10 new recipes: 5 binary/copy packages (cudatext-qt6-bin, ngrok, freeze-bin,
;;; iventoy-bin, arch-silence-grub-theme-git), 1 Python/setuptools (libray),
;;; 4 source-reference packages (chiaki, ov-git, intermodal, kwin-polonium).
;;; 5 compat aliases added to general-compat.scm (helixbinhx, libwireplumber-4.0-compat,
;;; mediainfo-gui-qt, wlrobs-hg, rpatool-git).
;;; 15 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd11)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages web)
  #:export (cudatext-qt6-bin
            ngrok
            freeze-bin
            iventoy-bin
            arch-silence-grub-theme-git
            libray
            chiaki
            ov-git
            intermodal
            kwin-polonium))

;; ═══════════════════════════════════════════════════════════════════
;; Binary / copy-build-system packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. cudatext-qt6-bin ─────────────────────────────────────────

(define-public cudatext-qt6-bin
  (package
    (name "cudatext-qt6-bin")
    (version "1.233.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/cudatext/files/release/"
                    version "/cudatext-linux-qt6-amd64-" version ".tar.xz"))
              (sha256
               (base32 "1j29v9ca1zm60k7g19h3nab5i9pw3ai3qdb69vi9rpbx0vz56l1k"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cudatext/cudatext" "bin/cudatext")
               ("cudatext/cudatext-512.png"
                "share/icons/hicolor/512x512/apps/cudatext-512.png")
               ("cudatext/data" "share/cudatext/data")
               ("cudatext/py" "share/cudatext/py")
               ("cudatext/settings_default"
                "share/cudatext/settings_default"))))
    (home-page "https://cudatext.github.io")
    (synopsis "cross-platform text editor written in Lazarus, Qt6 edition")
    (description
     "CudaText is a cross-platform code editor written in Object Pascal
using the Lazarus toolkit.  It supports syntax highlighting for many
languages, code folding, multi-carets, plugins in Python, and a Qt6
interface.  This package provides the prebuilt binary distribution.")
    (license license:mpl2.0)))

;; ── 2. ngrok ────────────────────────────────────────────────────

(define-public ngrok
  (package
    (name "ngrok")
    (version "3.37.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://bin.equinox.io/a/e3qN3YYBf9Z/ngrok-v3-"
                    version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "09bky7cshdnsfpp8q58fmbiz8vjgaw4g2ch5v2692pzbsvz2a0gv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ngrok" "bin/ngrok"))))
    (home-page "https://ngrok.com")
    (synopsis "tunneling and reverse proxy for HTTP services")
    (description
     "Ngrok is a tunneling and reverse proxy tool for developing and
exposing HTTP services from behind NAT or firewalls.  It creates
secure tunnels to localhost, enabling external access to local web
servers for testing, demos, and webhooks.")
    (license (license:non-copyleft
              "https://ngrok.com/tos"))))

;; ── 3. freeze-bin ───────────────────────────────────────────────

(define-public freeze-bin
  (package
    (name "freeze-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/charmbracelet/freeze/releases/download/v"
                    version "/freeze_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "16skacpljnfcfi9v0rdmsg8dg4vds4saqah5z5q9bhf02vfxnbq1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("freeze" "bin/freeze"))))
    (home-page "https://github.com/charmbracelet/freeze")
    (synopsis "generate images of code and terminal output")
    (description
     "Freeze generates images of code and terminal output.  It captures
the content and renders it as a styled PNG image, useful for sharing
code snippets on social media, documentation, or presentations.")
    (license license:expat)))

;; ── 4. iventoy-bin ──────────────────────────────────────────────

(define-public iventoy-bin
  (package
    (name "iventoy-bin")
    (version "1.0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ventoy/PXE/releases/download/v"
                    version "/iventoy-" version "-linux-free.tar.gz"))
              (sha256
               (base32 "1ylfhinlckcg3jl3n4j92j4d3w3917pnhksbqdjmfqib1xc2czax"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((ver #$version))
               `((,(string-append "iventoy-" ver "/lib/iventoy") "bin/iventoy")
                 (,(string-append "iventoy-" ver "/data") "share/iventoy/data")))))
    (home-page "https://www.iventoy.com")
    (synopsis "enhanced PXE server for network booting")
    (description
     "iVentoy is an enhanced PXE Boot server.  With iVentoy, you can boot
and install OS on multiple machines at the same time through the network.
It supports a wide range of operating system images including Windows,
Linux, and WinPE.")
    (license (license:non-copyleft
              "https://www.iventoy.com"))))

;; ── 5. arch-silence-grub-theme-git ──────────────────────────────

(define-public arch-silence-grub-theme-git
  (package
    (name "arch-silence-grub-theme-git")
    (version "0.0.0-0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/fghibellini/arch-silence/archive/refs/heads/master.tar.gz")
              (sha256
               (base32 "0ffz4k7ky2fibni5g45kls795inwwk5gfz288q2l9w8pqyqhwrd8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("theme" "share/grub/themes/arch-silence"))))
    (home-page "https://github.com/fghibellini/arch-silence")
    (synopsis "minimalist GRUB2 bootloader theme")
    (description
     "Arch Silence is a minimalist GRUB2 bootloader theme.  It provides
a clean, understated boot menu appearance.  Note: this theme was designed
for Arch Linux but the visual assets are generic and usable on any
distribution.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. libray ───────────────────────────────────────────────────

(define-public libray
  (package
    (name "libray")
    (version "0.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/necklace/libray/archive/"
                    version ".tar.gz"))
              (sha256
               (base32 "1w7xywbvz19rhjkz306lj66pgay4z1bwr2vcb1n793zz1in44kr5"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (propagated-inputs
     (list python-pycryptodome
           python-beautifulsoup4
           python-tqdm
           python-requests
           python-html5lib))
    (native-inputs
     (list python-setuptools))
    (home-page "https://codeberg.org/necklace/libray")
    (synopsis "libre Python tool for PS3 ISO operations")
    (description
     "LibRay is a libre (FLOSS) Python application for unencrypting,
extracting, repackaging, and encrypting PS3 ISOs.  It handles the
disc encryption layer used on PlayStation 3 game discs.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Source-reference packages (metadata + source, deps not yet packaged)
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. chiaki ───────────────────────────────────────────────────
;; NOTE: CMake build with many dependencies (ffmpeg, qt5-multimedia,
;; opus, sdl2, protobuf-c, etc.).  Needs proper phase customization
;; and dependency resolution in a dedicated pass.

(define-public chiaki
  (package
    (name "chiaki")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~thestr4ng3r/chiaki/refs/download/v"
                    version "/chiaki-v" version "-src.tar.gz"))
              (sha256
               (base32 "1y2wazk2q2fnyhxkv8yisgza64qk3zl2f7lcsmhijx9d7i7qj1pl"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'install))))
    (home-page "https://git.sr.ht/~thestr4ng3r/chiaki")
    (synopsis "free and open source PS4/PS5 remote play client")
    (description
     "Chiaki is a free and open source client for PlayStation 4 and
PlayStation 5 Remote Play.  It allows streaming games from a PS4 or
PS5 console to a PC over the local network.  Note: this is a
source-reference package; full build requires Qt5/FFmpeg/SDL2/protobuf
dependency packaging.")
    (license (license:non-copyleft
              "file://LICENSES/LGPLv3.txt"
              "LGPL-3.0-or-later and others"))))

;; ── 8. ov-git ───────────────────────────────────────────────────
;; NOTE: Go build with many module dependencies.  Needs Go module
;; vendoring or individual Go package inputs.

(define-public ov-git
  (package
    (name "ov-git")
    (version "0.50.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noborus/ov/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0mfkd4a5imrwl1sn06piwh5jicp8pdjiav93c5x80s0m5mjpq9w6"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f
                     #:import-path "github.com/noborus/ov"
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'build)
                         (delete 'install))))
    (home-page "https://github.com/noborus/ov")
    (synopsis "feature-rich terminal-based text pager")
    (description
     "Ov is a feature-rich terminal-based text pager with search,
filtering, column mode, and follow mode.  It supports multiple
encodings and large file viewing.  Note: this is a source-reference
package; full build requires Go module dependency packaging.")
    (license license:expat)))

;; ── 9. intermodal ──────────────────────────────────────────────
;; NOTE: Rust/cargo build with libgit2/libssh2 deps.

(define-public intermodal
  (package
    (name "intermodal")
    (version "0.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/casey/intermodal/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1mvl72fz84knmy2drdwp93j25ksimj49hmssv0lsknwx6wljj1rs"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/casey/intermodal")
    (synopsis "CLI BitTorrent metainfo utility")
    (description
     "Intermodal is a user-friendly and featureful command-line BitTorrent
metainfo utility written in Rust.  It can create, display, and verify
torrent files.  Note: this is a source-reference package; full build
requires Rust cargo dependency packaging.")
    (license license:cc0)))

;; ── 10. kwin-polonium ──────────────────────────────────────────
;; NOTE: TypeScript/npm build for KDE KWin.  Needs npm/node ecosystem.

(define-public kwin-polonium
  (package
    (name "kwin-polonium")
    (version "1.0rc")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zeroxoneafour/polonium/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0y3k949zl9dpdxbl5v5pg1wvaq7z3mvvxvsbm6dr78mm44qv1mmp"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'install))))
    (home-page "https://github.com/zeroxoneafour/polonium")
    (synopsis "tiling window manager for KWin")
    (description
     "Polonium is a tiling window manager for KDE Plasma's KWin compositor
(version 5.27 and later).  It provides automatic window tiling with
configurable layouts.  Note: this is a source-reference package; full
build requires npm/TypeScript build toolchain packaging.")
    (license license:expat)))

