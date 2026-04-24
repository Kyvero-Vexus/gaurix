;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (30):
;;;         1.  wealthfolio-bin (copy-build-system, v3.2.1, AGPL-3.0)
;;;         2.  jhentai-bin (copy-build-system, v8.0.12, Apache-2.0)
;;;         3.  tinygo-bin (copy-build-system, v0.41.1, BSD-3-Clause)
;;;         4.  seekr-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;         5.  fladder-bin (copy-build-system, v0.10.3, GPL-3.0)
;;;         6.  nanokvm-usb-bin (copy-build-system, v1.1.4, GPL-3.0)
;;;         7.  openterfaceqt-bin (copy-build-system, v0.5.22, AGPL-3.0)
;;;         8.  tonkeeper-wallet-bin (copy-build-system, v4.5.0, Apache-2.0)
;;;         9.  netwatch-tui (copy-build-system, v0.13.0, MIT)
;;;        10.  iris-bin (copy-build-system, v1.3.6, MIT)
;;;        11.  presto-bin (copy-build-system, v0.1.11, MIT)
;;;        12.  leap-bin (copy-build-system, v0.6.1, MIT)
;;;        13.  ffhuman-bin (copy-build-system, v1.0.7, MIT)
;;;        14.  whis-bin (copy-build-system, v0.7.2, MIT)
;;;        15.  yoyo-evolve-bin (copy-build-system, v0.1.8, MIT)
;;;        16.  go-mitmproxy-bin (copy-build-system, v1.8.11, MIT)
;;;        17.  kotlin-language-server-bin (copy-build-system, v1.3.13, MIT)
;;;        18.  ktfmt-bin (copy-build-system, v0.62, Apache-2.0)
;;;        19.  lettuceai-bin (copy-build-system, v1.2.1, AGPL-3.0)
;;;        20.  anythingllm-bin (copy-build-system, v1.4.0, MIT)
;;;        21.  hyprshell-bin (copy-build-system, v4.9.5, MIT)
;;;        22.  c-lolcat (gnu-build-system, v1.5, WTFPL)
;;;        23.  python-luhncheck (pyproject-build-system, v2.3.0, MIT)
;;;        24.  linux-router (copy-build-system, v0.8.1, LGPL-2.1)
;;;        25.  pass-ln (copy-build-system, v2.1.1, MIT)
;;;        26.  reboot-to-windows (copy-build-system, v1.5, GPL-3.0)
;;;        27.  dosh-docker-shell (copy-build-system, v9, LGPL-2.1)
;;;        28.  domake (copy-build-system, v3, LGPL-2.1)
;;;        29.  sedutil (gnu-build-system, v1.20.0, GPL-3.0)
;;;        30.  funchook (cmake-build-system, v1.1.3, GPL-2.0+)
;;;
;;; NOTE: sha256 hashes are REAL (obtained via `guix download`).

(define-module (gaurix packages recipe-resolver-260424g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages java)
  #:use-module (gnu packages bash)
  #:export (
            wealthfolio-bin
            jhentai-bin
            tinygo-bin
            seekr-bin
            fladder-bin
            nanokvm-usb-bin
            openterfaceqt-bin
            tonkeeper-wallet-bin
            netwatch-tui
            iris-bin
            presto-bin
            leap-bin
            ffhuman-bin
            whis-bin
            yoyo-evolve-bin
            go-mitmproxy-bin
            kotlin-language-server-bin
            ktfmt-bin
            lettuceai-bin
            anythingllm-bin
            hyprshell-bin
            c-lolcat
            python-luhncheck
            linux-router
            pass-ln
            reboot-to-windows
            dosh-docker-shell
            domake
            sedutil
            funchook
            ))

;;; -------------------------------------------------------------------
;;; 1. wealthfolio-bin --- private desktop investment tracker
;;; -------------------------------------------------------------------
(define-public wealthfolio-bin
  (package
    (name "wealthfolio-bin")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/afadil/wealthfolio/releases/download/v"
                    version "/Wealthfolio_" version "_amd64.AppImage"))
              (sha256
               (base32 "1ir7n45gsylac4qsalgw9vc6wcj6hkrkxkpivv9q8wvjaynjl5xp"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wealthfolio" "bin/wealthfolio"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (copy-file source "wealthfolio")
                     (chmod "wealthfolio" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Private and secure desktop investment tracking application")
    (description "Wealthfolio is a beautiful, private, and secure desktop
application for tracking investments.  It runs locally and keeps financial
data on the user's machine.")
    (home-page "https://wealthfolio.app")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 2. jhentai-bin --- cross-platform manga reader app
;;; -------------------------------------------------------------------
(define-public jhentai-bin
  (package
    (name "jhentai-bin")
    (version "8.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jiangtian616/JHenTai/releases/download/v"
                    version "/JHenTai-" version "+308-Linux-x64.deb"))
              (sha256
               (base32 "072g5jmslgd4927g4m692machrapzxcvqm52v64ll63vcx3zb4fa"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Cross-platform manga app built with Flutter")
    (description "JHenTai is a cross-platform manga reading application
built with Flutter.  It supports browsing, downloading, and reading manga
from various sources.")
    (home-page "https://github.com/jiangtian616/JHenTai")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. tinygo-bin --- Go compiler for microcontrollers and WASM
;;; -------------------------------------------------------------------
(define-public tinygo-bin
  (package
    (name "tinygo-bin")
    (version "0.41.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tinygo-org/tinygo/releases/download/v"
                    version "/tinygo" version ".linux-amd64.tar.gz"))
              (sha256
               (base32 "149ys9s49vcqfr27sbfgnqzld33yw0xx2hs1k9iyyvip7bcx2mp1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tinygo/bin/" "bin/")
               ("tinygo/lib/" "lib/")
               ("tinygo/pkg/" "share/tinygo/pkg/")
               ("tinygo/src/" "share/tinygo/src/")
               ("tinygo/targets/" "share/tinygo/targets/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Go compiler for microcontrollers, WebAssembly, and CLI tools")
    (description "TinyGo is a Go compiler intended for use in small places
such as microcontrollers, WebAssembly (WASM/WASI), and command-line tools.
It reuses libraries used by the Go language tools alongside LLVM to provide
an alternative Go compiler.")
    (home-page "https://tinygo.org")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 4. seekr-bin --- multi-purpose OSINT toolkit
;;; -------------------------------------------------------------------
(define-public seekr-bin
  (package
    (name "seekr-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/seekr-osint/seekr/releases/download/"
                    version "/seekr_" version "_linux_amd64"))
              (sha256
               (base32 "0i7a9vdb9wj08xccy9q139zvs1437r4b2bhpmznwl4mm26yfhgkd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seekr" "bin/seekr"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (copy-file source "seekr")
                     (chmod "seekr" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Multi-purpose OSINT toolkit with a web interface")
    (description "Seekr is an open-source OSINT toolkit for gathering and
managing information from various sources.  It provides a neat web interface
for investigations.")
    (home-page "https://github.com/seekr-osint/seekr")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. fladder-bin --- Jellyfin frontend built with Flutter
;;; -------------------------------------------------------------------
(define-public fladder-bin
  (package
    (name "fladder-bin")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DonutWare/Fladder/releases/download/v"
                    version "/Fladder-Linux-" version ".zip"))
              (sha256
               (base32 "0k833v21lzmg34m0mijha5pmsw76q04dd9m7021v7zr6f9m6i6m4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fladder" "bin/fladder"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-and-prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-o" (assoc-ref inputs "source"))
                   (chmod "fladder" #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Cross-platform Jellyfin frontend built with Flutter")
    (description "Fladder is a modern, cross-platform media client for
Jellyfin media servers, built with Flutter for a native experience on
desktop and mobile platforms.")
    (home-page "https://github.com/DonutWare/Fladder")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. nanokvm-usb-bin --- finger-sized 4K USB KVM
;;; -------------------------------------------------------------------
(define-public nanokvm-usb-bin
  (package
    (name "nanokvm-usb-bin")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sipeed/NanoKVM-USB/releases/download/v"
                    version "/NanoKVM-USB-" version "-linux-amd64.deb"))
              (sha256
               (base32 "0hy1iisfw5f88py76qr9j3qxwn4zplgw1s2r581h2sdz1p31xara"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Finger-sized 4K USB KVM application")
    (description "NanoKVM USB is a desktop application for the Sipeed
NanoKVM USB device, a finger-sized 4K USB KVM that allows remote control
of computers and servers.")
    (home-page "https://github.com/sipeed/NanoKVM-USB")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. openterfaceqt-bin --- Openterface Mini-KVM host application
;;; -------------------------------------------------------------------
(define-public openterfaceqt-bin
  (package
    (name "openterfaceqt-bin")
    (version "0.5.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TechxArtisanStudio/Openterface_QT/releases/download/"
                    version "/openterfaceQT_linux_amd64.deb"))
              (sha256
               (base32 "1mmm8nr9g380llpinl51n1ihbdmapnh6adfzdyr0cjkk0g2bfr32"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Openterface Mini-KVM host application for Linux")
    (description "OpenterfaceQT is the host application for the Openterface
Mini-KVM device.  It provides keyboard, video, and mouse control over USB
for headless computers and servers.")
    (home-page "https://openterface.com")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 8. tonkeeper-wallet-bin --- TON blockchain wallet
;;; -------------------------------------------------------------------
(define-public tonkeeper-wallet-bin
  (package
    (name "tonkeeper-wallet-bin")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tonkeeper/tonkeeper-web/releases/download/v"
                    version "/tonkeeper_" version "_amd64.deb"))
              (sha256
               (base32 "14x646s5hbvpv1prcgx7vbp54smlx07whzzl484h1h1s24387b8g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Non-custodial TON crypto wallet and dApp gateway")
    (description "Tonkeeper is an open-source, multi-platform, non-custodial
wallet for the TON blockchain.  It provides a gateway to blockchain
decentralized applications.")
    (home-page "https://tonkeeper.com")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. netwatch-tui --- real-time network diagnostics in the terminal
;;; -------------------------------------------------------------------
(define-public netwatch-tui
  (package
    (name "netwatch-tui")
    (version "0.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/matthart1983/netwatch/releases/download/v"
                    version "/netwatch-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1znhjn31yfmcnyid099axlvxbw2cvkb9r281523ks1564fa29l9b"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netwatch" "bin/netwatch"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Real-time network diagnostics in the terminal")
    (description "Netwatch is a TUI application providing real-time network
diagnostics with zero configuration.  One command gives instant visibility
into network connections, latency, and throughput.")
    (home-page "https://github.com/matthart1983/netwatch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. iris-bin --- fast minimal file management engine
;;; -------------------------------------------------------------------
(define-public iris-bin
  (package
    (name "iris-bin")
    (version "1.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ereinaimer/iris/releases/download/v"
                    version "/iris-linux-amd64"))
              (sha256
               (base32 "1j8l6f8mbfrd9rk1gpwnxh8br32a46kwzcf0p2rmvkigl2d1mfq5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iris" "bin/iris"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (copy-file source "iris")
                     (chmod "iris" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Fast, minimal, config-driven file management engine")
    (description "Iris is a fast, minimal, config-driven file management
engine built in Rust.  It provides efficient file operations through
a streamlined interface.")
    (home-page "https://github.com/ereinaimer/iris")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. presto-bin --- dependency manager for PHP
;;; -------------------------------------------------------------------
(define-public presto-bin
  (package
    (name "presto-bin")
    (version "0.1.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/paramientos/presto/releases/download/v"
                    version "/presto-linux-amd64"))
              (sha256
               (base32 "0cmwwl978kxqsk9hf7s5hv731npfsy3bbs0k6x0dzm8sbrk1dcdn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("presto" "bin/presto"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (copy-file source "presto")
                     (chmod "presto" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dependency manager for PHP, drop-in replacement for Composer")
    (description "Presto is a dependency manager for PHP that serves as
a drop-in replacement for Composer with improved performance.")
    (home-page "https://github.com/paramientos/presto")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. leap-bin --- SSH connection manager
;;; -------------------------------------------------------------------
(define-public leap-bin
  (package
    (name "leap-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/paramientos/leap/releases/download/v"
                    version "/leap-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "1vchn01yr73ri3dqy68x445689638rdckzcfba0n9a02kixf1ahx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("leap" "bin/leap"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SSH connection manager")
    (description "Leap is an SSH connection manager that simplifies managing
and connecting to multiple SSH hosts from the command line.")
    (home-page "https://github.com/paramientos/leap")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. ffhuman-bin --- human-friendly FFmpeg wrapper
;;; -------------------------------------------------------------------
(define-public ffhuman-bin
  (package
    (name "ffhuman-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alpbak/ffhuman/releases/download/v"
                    version "/ffhuman-linux-x86_64.tar.gz"))
              (sha256
               (base32 "12983jxpkczk946mdgfssazrh3kx8bfm2nr87irwzx56gkygp5cw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ffhuman" "bin/ffhuman"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Human-friendly command-line wrapper around FFmpeg")
    (description "FFhuman provides a simple, human-friendly command-line
interface to FFmpeg.  It translates natural descriptions of media operations
into FFmpeg commands.")
    (home-page "https://github.com/alpbak/ffhuman")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. whis-bin --- voice-to-text CLI for the terminal
;;; -------------------------------------------------------------------
(define-public whis-bin
  (package
    (name "whis-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/frankdierolf/whis/releases/download/v"
                    version "/whis-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1k02b73nlqg6k9fagraa9c567qq33zikxbv4rbqcybvswx54ihzx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("whis" "bin/whis"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Voice-to-text CLI for terminal users")
    (description "Whis is a voice-to-text command-line tool for terminal
users.  It captures microphone input and converts speech to text using
local or remote transcription models.")
    (home-page "https://github.com/frankdierolf/whis")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. yoyo-evolve-bin --- self-evolving AI coding agent
;;; -------------------------------------------------------------------
(define-public yoyo-evolve-bin
  (package
    (name "yoyo-evolve-bin")
    (version "0.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yologdev/yoyo-evolve/releases/download/v"
                    version "/yoyo-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0w0743dgpvw6glz7pwcp6ndqs9d1dz29pv9vfdbi6vwainyvvqi3"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yoyo" "bin/yoyo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Self-evolving AI coding agent for the terminal")
    (description "Yoyo is a free, open-source CLI coding assistant that uses
AI models to help with software development tasks directly from the
terminal.")
    (home-page "https://github.com/yologdev/yoyo-evolve")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. go-mitmproxy-bin --- man-in-the-middle proxy in Go
;;; -------------------------------------------------------------------
(define-public go-mitmproxy-bin
  (package
    (name "go-mitmproxy-bin")
    (version "1.8.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lqqyt2423/go-mitmproxy/releases/download/v"
                    version "/go-mitmproxy_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "088l2vfci0x09qna4rz6ksqkdlhch7mv6hadjzsvwwdy64swwwfz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("go-mitmproxy" "bin/go-mitmproxy"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Man-in-the-middle proxy implemented in Go")
    (description "Go-mitmproxy is a mitmproxy implementation in Go that can
intercept, parse, monitor, and modify HTTP/HTTPS traffic for debugging
and analysis.")
    (home-page "https://github.com/lqqyt2423/go-mitmproxy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. kotlin-language-server-bin --- Kotlin LSP server
;;; -------------------------------------------------------------------
(define-public kotlin-language-server-bin
  (package
    (name "kotlin-language-server-bin")
    (version "1.3.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fwcd/kotlin-language-server/releases/download/"
                    version "/server.zip"))
              (sha256
               (base32 "1lmnv6r4x8mhk28bh9bwrn244slcknyp2q83d5w7qc3v10fxgrsg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("server/bin/" "bin/")
               ("server/lib/" "lib/kotlin-language-server/"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Kotlin language server providing IDE features via LSP")
    (description "Kotlin Language Server provides code completion,
diagnostics, go-to-definition, and other IDE features for any editor
supporting the Language Server Protocol.")
    (home-page "https://github.com/fwcd/kotlin-language-server")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. ktfmt-bin --- Kotlin code formatter by Facebook
;;; -------------------------------------------------------------------
(define-public ktfmt-bin
  (package
    (name "ktfmt-bin")
    (version "0.62")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/facebook/ktfmt/releases/download/v"
                    version "/ktfmt-" version "-with-dependencies.jar"))
              (sha256
               (base32 "0rcrdfw39rf4cpnp2qb59zl0ak2pnbdxdx5xya37zli0ynhzk6zk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ktfmt.jar" "share/java/ktfmt.jar")
               ("ktfmt" "bin/ktfmt"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source"))
                         (java (search-input-file inputs "bin/java")))
                     (copy-file source "ktfmt.jar")
                     (with-output-to-file "ktfmt"
                       (lambda ()
                         (format #t "#!/bin/sh~%exec ~a -jar ~a/share/java/ktfmt.jar \"$@\"~%"
                                 java #$output)))
                     (chmod "ktfmt" #o755)))))))
    (inputs (list openjdk))
    (synopsis "Kotlin code formatter that reformats source to conventions")
    (description "ktfmt is a program by Facebook that reformats Kotlin source
code to comply with common community conventions.  It provides consistent
formatting without manual style decisions.")
    (home-page "https://facebook.github.io/ktfmt/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. lettuceai-bin --- privacy-first AI roleplay and storytelling
;;; -------------------------------------------------------------------
(define-public lettuceai-bin
  (package
    (name "lettuceai-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LettuceAI/app/releases/download/"
                    "desktop-release-" version "/linux-cpu.zip"))
              (sha256
               (base32 "0i8wl1snj2rpw2hclhl11kil79i3ymyvyq5pkkvnn3r3qcdf3fd3"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lettuceai/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-o" (assoc-ref inputs "source")))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Privacy-first AI roleplay and storytelling application")
    (description "LettuceAI is a privacy-first AI application for roleplay
and storytelling with long-term memory, custom characters, and support
for over 20 AI providers.")
    (home-page "https://lettuce.ai")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 20. anythingllm-bin --- all-in-one AI desktop application
;;; -------------------------------------------------------------------
(define-public anythingllm-bin
  (package
    (name "anythingllm-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mintplex-Labs/anything-llm/releases/download/v"
                    version "/AnythingLLMDesktop.AppImage"))
              (sha256
               (base32 "18k523dgja0bqhk5bsqyc2h2j492n3hfdkrjs21kplvyy7ajwh61"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("anythingllm" "bin/anythingllm"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'prepare
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (copy-file source "anythingllm")
                     (chmod "anythingllm" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "All-in-one AI productivity desktop application")
    (description "AnythingLLM is an all-in-one AI desktop application that
runs locally and supports multiple LLM providers.  It provides document
Q&A, agents, and other AI-powered features with privacy-first design.")
    (home-page "https://anythingllm.com")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. hyprshell-bin --- GTK4 window switcher for Hyprland
;;; -------------------------------------------------------------------
(define-public hyprshell-bin
  (package
    (name "hyprshell-bin")
    (version "4.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H3rmt/hyprshell/releases/download/v"
                    version "/hyprshell-" version "-x86_64.tar.zst"))
              (sha256
               (base32 "0131zahqif2hdxkk1sa5gzmh9f8z5rqbx5nrw0y2ii1mmppn4lmz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hyprshell" "bin/hyprshell"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "tar" "--zstd" "-xf"
                           (assoc-ref inputs "source")))))))
    (native-inputs (list zstd))
    (supported-systems '("x86_64-linux"))
    (synopsis "GTK4 window switcher and application launcher for Hyprland")
    (description "Hyprshell is a modern GTK4-based window switcher and
application launcher designed specifically for the Hyprland Wayland
compositor.")
    (home-page "https://github.com/H3rmt/hyprshell")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. c-lolcat --- high-performance rainbow text in C
;;; -------------------------------------------------------------------
(define-public c-lolcat
  (package
    (name "c-lolcat")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jaseg/lolcat/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1x8l9gn1gzzhwwbw71y422npy0r2f1z6xl80wlmabgg0j3nrpxra"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "High-performance C implementation of lolcat")
    (description "C-lolcat is a high-performance implementation of lolcat
written in C.  It outputs text in rainbow colors on the terminal, much
faster than the original Ruby version.")
    (home-page "https://github.com/jaseg/lolcat")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 23. python-luhncheck --- Luhn algorithm validator
;;; -------------------------------------------------------------------
(define-public python-luhncheck
  (package
    (name "python-luhncheck")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/l/luhncheck/"
                    "luhncheck-" version ".tar.gz"))
              (sha256
               (base32 "0132q9c9gl2v4jhsqc3wjzccr3qlscggvyg48jvmjx1y3hi8mi6d"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Validator for identification numbers using Luhn algorithm")
    (description "Luhncheck is a simple validator and generator for
identification numbers based on the Luhn algorithm, commonly used for
credit card numbers, IMEI numbers, and other identifiers.")
    (home-page "https://github.com/dralshehri/luhncheck")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. linux-router --- set up a Linux router in one command
;;; -------------------------------------------------------------------
(define-public linux-router
  (package
    (name "linux-router")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/garywill/linux-router/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1974dn612c8agyc6vcclq86k3xqrv1br7hcic1f09vbisk7ch5pl"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lnxrouter" "bin/lnxrouter"))))
    (inputs (list bash))
    (synopsis "Set Linux as router in one command")
    (description "Linux-router lets you set up a Linux machine as a router
with a single command.  It supports Internet sharing, redsocks transparent
proxy, Wi-Fi hotspot, IPv6, and routing for VMs and containers.")
    (home-page "https://github.com/garywill/linux-router")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 25. pass-ln --- pass extension for symbolic links
;;; -------------------------------------------------------------------
(define-public pass-ln
  (package
    (name "pass-ln")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/radian-software/pass-ln/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0djrr6ljvh3w0cg98zv1nym0l29pf7ymqgkx6sndw7bwphad3zvz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ln.bash" "lib/password-store/extensions/ln.bash"))))
    (synopsis "Pass extension for creating symbolic links")
    (description "Pass-ln is an extension for the pass password manager that
adds support for creating symbolic links within the password store,
enabling password aliases and shared credentials.")
    (home-page "https://github.com/radian-software/pass-ln")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. reboot-to-windows --- quickly reboot to Windows from Linux
;;; -------------------------------------------------------------------
(define-public reboot-to-windows
  (package
    (name "reboot-to-windows")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Wartybix/Reboot-To-Windows/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1faf5pqd08rkqkfigfzfg4rxc6k0xg0515azby17ngy0hhng8qyi"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("reboot-to-windows.sh" "bin/reboot-to-windows"))))
    (synopsis "Quickly reboot to Windows from Linux via UEFI")
    (description "Reboot-To-Windows is a shell script that allows quickly
rebooting to Windows from a dual-boot Linux system by setting the UEFI
boot entry, bypassing the boot menu.")
    (home-page "https://github.com/Wartybix/Reboot-To-Windows")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. dosh-docker-shell --- Docker-powered shell environment
;;; -------------------------------------------------------------------
(define-public dosh-docker-shell
  (package
    (name "dosh-docker-shell")
    (version "9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gportay/dosh/releases/download/"
                    version "/dosh_" version "_all.deb"))
              (sha256
               (base32 "0mrq34f84y2r4amg4abpcxsfc0xivjqsiaq510fb1b8k0l0ajaz9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (synopsis "Docker shell --- run commands in containers transparently")
    (description "Dosh (Docker Shell) is an sh-compatible frontend for
Docker that runs commands in a container with the current working directory
bind-mounted.  It provides a seamless containerized shell experience.")
    (home-page "https://github.com/gportay/dosh")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 28. domake --- Docker Make CLI plugin
;;; -------------------------------------------------------------------
(define-public domake
  (package
    (name "domake")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gportay/domake/releases/download/"
                    version "/domake_" version "_all.deb"))
              (sha256
               (base32 "1vhds3grc4fhhjwr9f34nlg9a3gl98fvr8kd4ybfv5q89753sz6c"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (invoke "ar" "x" source)
                     (invoke "tar" "xf" "data.tar.xz")))))))
    (native-inputs (list tar))
    (synopsis "Docker Make CLI plugin for running make in containers")
    (description "Domake is a Docker Make CLI plugin that runs @command{make}
using @command{dosh} as the default shell, executing builds inside Docker
containers for reproducible build environments.")
    (home-page "https://github.com/gportay/domake")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 29. sedutil --- self-encrypting drive management utility
;;; -------------------------------------------------------------------
(define-public sedutil
  (package
    (name "sedutil")
    (version "1.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Drive-Trust-Alliance/sedutil/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1ws4gairynf8i33qvz7ilyv645l7dj7gbrn4ynk8zydyrf9nn0c8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda _
                   (invoke "autoreconf" "-fi")))
               (add-after 'configure 'real-configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (synopsis "TCG OPAL self-encrypting drive management utility")
    (description "Sedutil is a utility for managing self-encrypting drives
(SEDs) that conform to the TCG OPAL standard.  It allows setting up
hardware encryption, managing passwords, and locking/unlocking drives.")
    (home-page "https://github.com/Drive-Trust-Alliance/sedutil")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. funchook --- function hooking library for C
;;; -------------------------------------------------------------------
(define-public funchook
  (package
    (name "funchook")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kubo/funchook/releases/download/v"
                    version "/funchook-" version ".tar.gz"))
              (sha256
               (base32 "1xafrbdcr4i94gafkwzfs5gw8dzfrxz9c1p0nrrw31i3blpni7fl"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DFUNCHOOK_DISASM=distorm")))
    (synopsis "Function hooking library for injecting jumps at runtime")
    (description "Funchook is a library for hooking function calls by
inserting jump instructions at runtime.  It supports x86, x86_64, and
ARM64 architectures for intercepting and redirecting function calls.")
    (home-page "https://github.com/kubo/funchook")
    (license license:gpl2+)))
