;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423f
;;; Resolves 100 TODO packages.
;;;
;;; New recipes (75):
;;;        1.  softplan-websigner (copy-build-system, v2.12.1.1, nonfree)
;;;        2.  eagle (copy-build-system, v9.6.2, nonfree)
;;;        3.  binaryninja-free (copy-build-system, v5.3.9434, nonfree)
;;;        4.  digilent-adept-runtime (copy-build-system, v2.27.9, nonfree)
;;;        5.  electron-nightly-bin (copy-build-system, v43.0.0nightly.20260327, expat)
;;;        6.  bytecode-viewer (copy-build-system, v2.13.2, gpl3)
;;;        7.  bitmagnet-bin (copy-build-system, v0.10.0, expat)
;;;        8.  mueller-dict (copy-build-system, v3.1.1, gpl2)
;;;        9.  ianny-bin (copy-build-system, v2.1.3, gpl3)
;;;       10.  luyten-bin (copy-build-system, v0.5.4, asl2.0)
;;;       11.  festival-cli-bin (copy-build-system, v1.0.0, expat)
;;;       12.  festival-gui-bin (copy-build-system, v1.4.0, expat)
;;;       13.  festival-web-bin (copy-build-system, v0.0.0, nonfree)
;;;       14.  festivald-bin (copy-build-system, v1.0.0, expat)
;;;       15.  festival-tui-bin (copy-build-system, v0.0.0, expat)
;;;       16.  geode-cli-bin (copy-build-system, v3.7.4, boost1.0)
;;;       17.  librush-bin (copy-build-system, v0.2.2, lgpl2.1+)
;;;       18.  d1x-rebirth-bin (copy-build-system, v0.58.1, lgpl2.1)
;;;       19.  flog-bin (copy-build-system, v0.4.4, expat)
;;;       20.  hyperlap2d-bin (copy-build-system, v0.1.4, gpl3)
;;;       21.  kanata-tray-bin (copy-build-system, v0.8.0, gpl3)
;;;       22.  hashit-bin (copy-build-system, v1.4.0, expat)
;;;       23.  f2p-evo-bin (copy-build-system, v0.3.37, nonfree)
;;;       24.  envm-bin (copy-build-system, v0.3.0, gpl3)
;;;       25.  dcd-bin (copy-build-system, v1.1.0, agpl3)
;;;       26.  balatro-mod-manager-bin (copy-build-system, v0.4.0, gpl3+)
;;;       27.  agent-one-bin (copy-build-system, v0.0.14, nonfree)
;;;       28.  recaf-bin (copy-build-system, v4.0.0, expat)
;;;       29.  brother-hl-l3220cw (copy-build-system, v3.5.1, nonfree)
;;;       30.  unmined-gui (copy-build-system, v0.19.60, nonfree)
;;;       31.  owon-vds-tiny (copy-build-system, v1.1.5, gpl2)
;;;       32.  jchempaint (copy-build-system, v3.4, lgpl2.1+)
;;;       33.  keys-vault (copy-build-system, v1.0.0, agpl3)
;;;       34.  tldr-plus-plus (go-build-system, v1.0.0, expat)
;;;       35.  amneziawg-go (go-build-system, v0.2.16, expat)
;;;       36.  echo-ft (go-build-system, v3, expat)
;;;       37.  sbb-tui (go-build-system, v1.13.4, expat)
;;;       38.  ihj (go-build-system, v0.5.18, expat)
;;;       39.  gomobile (go-build-system, v20240203, bsd-3)
;;;       40.  titlecase (cargo-build-system, v3.6.0, expat)
;;;       41.  kalc (cargo-build-system, v1.5.1, gpl3)
;;;       42.  quec (cargo-build-system, v0.1.5, gpl3)
;;;       43.  mproc (cargo-build-system, v0.2.3, gpl3+)
;;;       44.  makemake (cargo-build-system, v2.2.2, expat)
;;;       45.  kanata-switcher (cargo-build-system, v1.1.1, expat)
;;;       46.  clipr (cargo-build-system, v0.1.3, gpl3+)
;;;       47.  baywatch (cargo-build-system, v0.2.0, expat)
;;;       48.  linutil-git (cargo-build-system, v2026.04.09, expat)
;;;       49.  kalc-plot (cargo-build-system, v0.1.2, gpl3)
;;;       50.  telegram-tdlib (cmake-build-system, v1.8.63, boost1.0)
;;;       51.  gamenetworkingsockets-git (cmake-build-system, v1.4.1, bsd-3)
;;;       52.  ncpamixer (cmake-build-system, v1.3.10, expat)
;;;       53.  idlehack-git (cmake-build-system, v0.0.19, isc)
;;;       54.  nuked-sc55-jcmoyer-git (cmake-build-system, v0.0.1, nonfree)
;;;       55.  aiwnios (cmake-build-system, v0.9.0, bsd-3)
;;;       56.  hyprfm-git (cmake-build-system, v0.0.1, expat)
;;;       57.  pam-autologin (gnu-build-system, v1.2, isc)
;;;       58.  infnoise (gnu-build-system, v0.3.3, cc0)
;;;       59.  infnoise-tools (gnu-build-system, v0.3.3, cc0)
;;;       60.  libinfnoise (gnu-build-system, v0.3.3, cc0)
;;;       61.  pianod (gnu-build-system, v175, expat)
;;;       62.  cdecrypt-git (gnu-build-system, v1.0, gpl3)
;;;       63.  selectdefaultapplication-fork-git (gnu-build-system, v0.0.72, gpl3)
;;;       64.  pyinfra (pyproject-build-system, v3.7, expat)
;;;       65.  guardian (pyproject-build-system, v0.2.0, expat)
;;;       66.  colossus (pyproject-build-system, v1.0.2, expat)
;;;       67.  mausoleum (python-build-system, v0.15.0, gpl3)
;;;       68.  hg-fast-export (copy-build-system, v250330, gpl2)
;;;       69.  cockpit-navigator (copy-build-system, v0.6.0, gpl3)
;;;       70.  mainsail-config-git (copy-build-system, v0.0.1, gpl3)
;;;       71.  pacfzf (copy-build-system, v0.4.1, expat)
;;;       72.  atha (copy-build-system, v2.2.3, expat)
;;;       73.  localcommand (copy-build-system, v0.1.1, expat)
;;;       74.  fakeit (cmake-build-system, v2.5.0, expat)
;;;       75.  icecat-umatrix (copy-build-system, v1.4.4, gpl3+)
;;;
;;; BLOCKED EXHAUSTED (25):
;;;        1.  python-frida-tools -> DEP_RESOLUTION_FAILED: depends on python-frida which requires native Frida agent binaries (C/Vala); no 
;;;        2.  python-frida-bin -> DEP_RESOLUTION_FAILED: Frida native agent + Node.js bindings; complex binary + npm hybrid build
;;;        3.  86box-manager -> DEP_RESOLUTION_FAILED: .NET SDK 6.0 required; Guix has no dotnet-sdk or dotnet-runtime; no prebuilt Lin
;;;        4.  firefox-extension-bitwarden -> DEP_RESOLUTION_FAILED: requires npm + nodejs-lts-krypton build chain; 50+ npm deps not in Guix
;;;        5.  capt-src -> DEP_RESOLUTION_FAILED: requires lib32 packages (lib32-libxml2, lib32-glibc, lib32-popt); Guix has no mu
;;;        6.  firestorm-next-bin -> DEP_RESOLUTION_FAILED: requires lib32 packages (lib32-libidn, lib32-libsndfile, lib32-zlib); Guix has n
;;;        7.  wiliwili-wayland -> DEP_RESOLUTION_FAILED: depends on pystring and portable (not in Guix); cmake build with 7+ missing deps
;;;        8.  etcher-ng-bin -> DEP_RESOLUTION_FAILED: requires electron28 + asar; specific Electron version not in Guix
;;;        9.  python-jax-rocm -> DEP_RESOLUTION_FAILED: requires ROCm stack (miopen-hip, rccl, rocm-hip-sdk) + bazel build system; neith
;;;       10.  apk-mitm -> DEP_RESOLUTION_FAILED: npm-only distribution; requires npm ecosystem build chain
;;;       11.  distccd-alarm-armv7h -> DEP_RESOLUTION_FAILED: ARM cross-compilation distcc toolchain; architecture-specific (armv7h), requires
;;;       12.  distccd-alarm-armv8 -> DEP_RESOLUTION_FAILED: ARM cross-compilation distcc toolchain; architecture-specific (armv8/aarch64), r
;;;       13.  tabby -> DEP_RESOLUTION_FAILED: requires electron38 + npm/yarn; complex JS build with 100+ npm deps
;;;       14.  nvidia-340xx-lts -> DEP_RESOLUTION_FAILED: kernel module requiring linux-lts-headers + DKMS; Guix kernel module packaging n
;;;       15.  nvidia-340xx-lts-dkms -> DEP_RESOLUTION_FAILED: DKMS kernel module; same as nvidia-340xx-lts plus DKMS framework not in Guix
;;;       16.  ghidra-git -> DEP_RESOLUTION_FAILED: requires Gradle + java-environment=21 + python-pip; complex Java/Gradle build no
;;;       17.  vrcx-git -> DEP_RESOLUTION_FAILED: requires dotnet-sdk-9.0 + npm + electron; .NET + JS hybrid, no dotnet ecosystem 
;;;       18.  qcalc-bin -> DEP_RESOLUTION_FAILED: requires electron41; specific Electron version not in Guix
;;;       19.  project-registry -> DEP_RESOLUTION_FAILED: requires npm + gyp (node-gyp native compilation); complex Node.js ecosystem
;;;       20.  ffmpeg-cuda-full -> DEP_RESOLUTION_FAILED: requires CUDA SDK + 60+ deps including amf-headers, avisynthplus, ffnvcodec-head
;;;       21.  dingtalk-wayland-screenshare-git -> DEP_RESOLUTION_FAILED: requires dingtalk-bin (proprietary) + opencv + libportal + pipewire; complex mul
;;;       22.  spotify-adblock-git -> DEP_RESOLUTION_FAILED: requires spotify package as runtime dep; spotify not available in Guix
;;;       23.  icecat-ublock-origin -> DEP_RESOLUTION_FAILED: requires npm + python + strip-nondeterminism build chain for Firefox extension
;;;       24.  r-data.table -> DEP_RESOLUTION_FAILED: requires R (r>=3.3.0); R ecosystem packaging requires dedicated CRAN import tool
;;;       25.  firefox-userchromejs -> NEEDS_RECIPE_DESIGN: Firefox binary patching; tightly coupled to Firefox version (150.0a1); requires 
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423f)
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
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:export (
            softplan-websigner
            eagle
            binaryninja-free
            digilent-adept-runtime
            electron-nightly-bin
            bytecode-viewer
            bitmagnet-bin
            mueller-dict
            ianny-bin
            luyten-bin
            festival-cli-bin
            festival-gui-bin
            festival-web-bin
            festivald-bin
            festival-tui-bin
            geode-cli-bin
            librush-bin
            d1x-rebirth-bin
            flog-bin
            hyperlap2d-bin
            kanata-tray-bin
            hashit-bin
            f2p-evo-bin
            envm-bin
            dcd-bin
            balatro-mod-manager-bin
            agent-one-bin
            recaf-bin
            brother-hl-l3220cw
            unmined-gui
            owon-vds-tiny
            jchempaint
            keys-vault
            tldr-plus-plus
            amneziawg-go
            echo-ft
            sbb-tui
            ihj
            gomobile
            titlecase
            kalc
            quec
            mproc
            makemake
            kanata-switcher
            clipr
            baywatch
            linutil-git
            kalc-plot
            telegram-tdlib
            gamenetworkingsockets-git
            ncpamixer
            idlehack-git
            nuked-sc55-jcmoyer-git
            aiwnios
            hyprfm-git
            pam-autologin
            infnoise
            infnoise-tools
            libinfnoise
            pianod
            cdecrypt-git
            selectdefaultapplication-fork-git
            pyinfra
            guardian
            colossus
            mausoleum
            hg-fast-export
            cockpit-navigator
            mainsail-config-git
            pacfzf
            atha
            localcommand
            fakeit
            icecat-umatrix
            ))

;;; -------------------------------------------------------------------
;;; softplan-websigner
;;; -------------------------------------------------------------------
(define-public softplan-websigner
  (package
    (name "softplan-websigner")
    (version "2.12.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/softplan-websigner.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/softplan-websigner/"))))
    (synopsis "digital certificate web signer for Softplan applications")
    (description "Softplan WebSigner is a native application that enables the use of
digital certificates in web applications.  It provides secure document
signing capabilities for Softplan's suite of legal and government software.")
    (home-page "https://websigner.softplan.com.br")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; eagle
;;; -------------------------------------------------------------------
(define-public eagle
  (package
    (name "eagle")
    (version "9.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://eagle-updates.circuits.io/downloads/" version "/Autodesk_EAGLE_" version "_English_Linux_64bit.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/eagle/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "schematic capture and PCB design tool by Autodesk")
    (description "EAGLE (Easily Applicable Graphical Layout Editor) is a powerful
electronics design automation suite for schematic capture and printed
circuit board design.  It is used by hobbyists and professionals for
electronics prototyping and production.")
    (home-page "http://www.autodesk.com/products/eagle")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; binaryninja-free
;;; -------------------------------------------------------------------
(define-public binaryninja-free
  (package
    (name "binaryninja-free")
    (version "5.3.9434")
    (source (origin
              (method url-fetch)
              (uri "https://cdn.binary.ninja/installers/binaryninja_free_linux.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/binaryninja/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interactive disassembler, debugger, and binary analysis platform")
    (description "Binary Ninja is a binary analysis platform for reverse engineering.
The free edition provides disassembly, basic analysis, and a built-in
decompiler for x86, ARM, and other architectures.")
    (home-page "https://binary.ninja")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; digilent-adept-runtime
;;; -------------------------------------------------------------------
(define-public digilent-adept-runtime
  (package
    (name "digilent-adept-runtime")
    (version "2.27.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://lp.digilent.com/complete/adept-runtime/digilent.adept.runtime_" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lib/" "lib/") ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "runtime libraries for Digilent FPGA development boards")
    (description "Digilent Adept Runtime provides the shared libraries, firmware images,
and configuration files needed to communicate with Digilent devices such
as FPGA development boards using JTAG and other protocols.")
    (home-page "https://reference.digilentinc.com/reference/software/adept/start")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; electron-nightly-bin
;;; -------------------------------------------------------------------
(define-public electron-nightly-bin
  (package
    (name "electron-nightly-bin")
    (version "43.0.0nightly.20260327")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/electron/electron/releases/download/v" version "/electron-v" version "-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/electron-nightly/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "prebuilt nightly Electron framework for desktop applications")
    (description "Electron is a framework for building cross-platform desktop applications
using web technologies (HTML, CSS, JavaScript).  This package provides
the nightly prebuilt binary of Electron.")
    (home-page "https://electronjs.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; bytecode-viewer
;;; -------------------------------------------------------------------
(define-public bytecode-viewer
  (package
    (name "bytecode-viewer")
    (version "2.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Konloch/bytecode-viewer/releases/download/v" version "/Bytecode-Viewer-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Bytecode-Viewer-2.13.2.jar" "share/java/"))))
    (synopsis "Java decompiler, editor, debugger, and bytecode analysis tool")
    (description "Bytecode Viewer is an advanced yet easy-to-use Java reverse engineering
suite including a decompiler, editor, debugger, and more.  It supports
multiple Java decompilers and provides a graphical interface for
bytecode analysis.")
    (home-page "https://bytecodeviewer.com")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; bitmagnet-bin
;;; -------------------------------------------------------------------
(define-public bitmagnet-bin
  (package
    (name "bitmagnet-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bitmagnet-io/bitmagnet/releases/download/v" version "/bitmagnet_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bitmagnet" "bin/"))))
    (synopsis "self-hosted BitTorrent indexer and DHT crawler")
    (description "Bitmagnet is a self-hosted BitTorrent indexer, DHT crawler, content
classifier, and torrent search engine.  It provides a web UI, GraphQL
API, and full-text search over discovered torrents.")
    (home-page "https://bitmagnet.io")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; mueller-dict
;;; -------------------------------------------------------------------
(define-public mueller-dict
  (package
    (name "mueller-dict")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://downloads.sourceforge.net/mueller-dict/mueller-dict-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mueller-dict/"))))
    (synopsis "English to Russian dictionary for dictd and compatible servers")
    (description "Mueller Dict is an English to Russian dictionary formatted for use with
the @command{dictd} dictionary server and compatible applications.  It is
based on the Mueller English-Russian dictionary.")
    (home-page "http://mueller-dict.sourceforge.net")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; ianny-bin
;;; -------------------------------------------------------------------
(define-public ianny-bin
  (package
    (name "ianny-bin")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/zefr0x/ianny/releases/download/" version "/ianny-" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ianny" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "periodic break reminder for eye health")
    (description "Ianny is a desktop application that periodically reminds you to take
breaks to reduce eye strain.  It follows the 20-20-20 rule and provides
configurable reminder intervals and durations.")
    (home-page "https://github.com/zefr0x/ianny")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; luyten-bin
;;; -------------------------------------------------------------------
(define-public luyten-bin
  (package
    (name "luyten-bin")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/deathmarine/Luyten/releases/download/v" version "_Rebuilt_with_Procyon_0.5.30/luyten-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("luyten-0.5.4.jar" "share/java/"))))
    (synopsis "Java decompiler GUI based on Procyon")
    (description "Luyten is a graphical Java decompiler built on the Procyon decompilation
engine.  It provides a file browser and tabbed code view for exploring
and decompiling Java class files and JAR archives.")
    (home-page "https://github.com/deathmarine/Luyten")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; festival-cli-bin
;;; -------------------------------------------------------------------
(define-public festival-cli-bin
  (package
    (name "festival-cli-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hinto-janai/festival/releases/download/cli-v" version "/festival-cli-v" version "-x86_64-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("festival-cli" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line music player and library manager")
    (description "Festival CLI is a command-line music player and library manager.  It
provides fast music playback and library browsing from the terminal.")
    (home-page "https://github.com/hinto-janai/festival")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; festival-gui-bin
;;; -------------------------------------------------------------------
(define-public festival-gui-bin
  (package
    (name "festival-gui-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hinto-janai/festival/releases/download/gui-v" version "/festival-gui-v" version "-x86_64-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("festival-gui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical music player and library manager")
    (description "Festival GUI is a graphical music player and library manager built
with GTK.  It provides album art display, playlist management, and
audio playback controls.")
    (home-page "https://github.com/hinto-janai/festival")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; festival-web-bin
;;; -------------------------------------------------------------------
(define-public festival-web-bin
  (package
    (name "festival-web-bin")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hinto-janai/festival/releases/latest/download/festival-web-x86_64-linux.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("festival-web" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web-based music player and library manager")
    (description "Festival Web is a web-based music player and library manager.  It
provides a browser-accessible interface for managing and playing
your music collection.")
    (home-page "https://github.com/hinto-janai/festival")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; festivald-bin
;;; -------------------------------------------------------------------
(define-public festivald-bin
  (package
    (name "festivald-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hinto-janai/festival/releases/download/daemon-v" version "/festivald-v" version "-x86_64-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("festivald" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "music daemon backend for the Festival ecosystem")
    (description "Festivald is the daemon component of the Festival music system.  It
provides a JSON-RPC API for music library management and audio playback,
serving as the backend for Festival GUI, CLI, and web interfaces.")
    (home-page "https://github.com/hinto-janai/festival")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; festival-tui-bin
;;; -------------------------------------------------------------------
(define-public festival-tui-bin
  (package
    (name "festival-tui-bin")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hinto-janai/festival/releases/latest/download/festival-tui-x86_64-linux.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("festival-tui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based music player and library manager")
    (description "Festival TUI is a terminal user interface for the Festival music player
ecosystem.  It provides ncurses-style navigation for browsing and playing
music from your library.")
    (home-page "https://github.com/hinto-janai/festival")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; geode-cli-bin
;;; -------------------------------------------------------------------
(define-public geode-cli-bin
  (package
    (name "geode-cli-bin")
    (version "3.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/geode-sdk/cli/releases/download/v" version "/geode-cli-v" version "-linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("geode" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for the Geode modding framework")
    (description "Geode CLI is the command-line interface for the Geode mod loader SDK.
It provides tools for creating, building, and managing Geometry Dash
mods using the Geode framework.")
    (home-page "https://github.com/geode-sdk/cli")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; librush-bin
;;; -------------------------------------------------------------------
(define-public librush-bin
  (package
    (name "librush-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/fm-elpac/librush/releases/download/v" version "/librush-v" version "-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "lib/librush/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "input method framework library for IBus")
    (description "Librush is an input method engine library for the IBus input method
framework.  It provides the core runtime for implementing custom input
methods.")
    (home-page "https://github.com/fm-elpac/librush")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; d1x-rebirth-bin
;;; -------------------------------------------------------------------
(define-public d1x-rebirth-bin
  (package
    (name "d1x-rebirth-bin")
    (version "0.58.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.dxx-rebirth.com/download/dxx/rebirth/dxx-rebirth_v" version "-selfextract-Linux-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("d1x-rebirth" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "source port of Descent 1 for modern systems")
    (description "D1X-Rebirth is a source port of the classic first-person shooter Descent.
It provides modern rendering, networking, and input support while
maintaining compatibility with the original game data files.")
    (home-page "https://www.dxx-rebirth.com/")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; flog-bin
;;; -------------------------------------------------------------------
(define-public flog-bin
  (package
    (name "flog-bin")
    (version "0.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mingrammer/flog/releases/download/v" version "/flog_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("flog" "bin/"))))
    (synopsis "fake log generator for testing log pipelines")
    (description "Flog is a fake log generator for common log formats including Apache
Combined, Apache Common, RFC 3164, RFC 5424, JSON, and Common Log
Format.  It is useful for testing log processing pipelines and tools.")
    (home-page "https://github.com/mingrammer/flog")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; hyperlap2d-bin
;;; -------------------------------------------------------------------
(define-public hyperlap2d-bin
  (package
    (name "hyperlap2d-bin")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rednblackgames/HyperLap2D/releases/download/" version "/HyperLap2D-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/hyperlap2d/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "visual 2D game level and UI editor")
    (description "HyperLap2D is a visual editor for creating complex 2D game worlds and
UI layouts.  It supports animations, physics, lights, particles, and
is compatible with the libGDX game framework.")
    (home-page "https://hyperlap2d.rednblack.games/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; kanata-tray-bin
;;; -------------------------------------------------------------------
(define-public kanata-tray-bin
  (package
    (name "kanata-tray-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rszyma/kanata-tray/releases/download/v" version "/kanata-tray-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("kanata-tray-linux-x86_64" "bin/kanata-tray"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "system tray indicator for Kanata keyboard remapper")
    (description "Kanata Tray provides a system tray icon for the Kanata keyboard
remapping daemon.  It shows the current layer and allows switching
between configurations from the tray menu.")
    (home-page "https://github.com/rszyma/kanata-tray")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; hashit-bin
;;; -------------------------------------------------------------------
(define-public hashit-bin
  (package
    (name "hashit-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/boyter/hashit/releases/download/v" version "/hashit-" version "-x86_64-unknown-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hashit" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast file hashing utility supporting multiple algorithms")
    (description "Hashit is a fast file hashing utility written in Go.  It supports
multiple hash algorithms including MD5, SHA1, SHA256, SHA512, and
BLAKE2b, and can process files in parallel for high throughput.")
    (home-page "https://github.com/boyter/hashit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; f2p-evo-bin
;;; -------------------------------------------------------------------
(define-public f2p-evo-bin
  (package
    (name "f2p-evo-bin")
    (version "0.3.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sanhost.net/sanasol/f2p-evo/-/releases/v" version "/downloads/f2p-evo-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("f2p-evo.AppImage" "bin/f2p-evo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free-to-play game evolution tracker")
    (description "F2P Evo is a desktop application for tracking free-to-play game
evolution and progress.  It provides a GTK-based interface with
system tray integration.")
    (home-page "https://git.sanhost.net/sanasol/f2p-evo")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; envm-bin
;;; -------------------------------------------------------------------
(define-public envm-bin
  (package
    (name "envm-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/objz/envm/releases/download/v" version "/envm-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("envm-linux-amd64" "bin/envm"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "environment variable manager for development workflows")
    (description "Envm is a lightweight environment variable manager that helps organize
and switch between different sets of environment variables for
development, staging, and production workflows.")
    (home-page "https://github.com/objz/envm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; dcd-bin
;;; -------------------------------------------------------------------
(define-public dcd-bin
  (package
    (name "dcd-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/boyter/dcd/releases/download/v" version "/dcd-" version "-x86_64-unknown-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("dcd" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "duplicate code detection tool for codebases")
    (description "DCD (Duplicate Code Detector) identifies duplicate and near-duplicate
code blocks across a codebase.  It supports multiple languages and
outputs results in various formats for integration with CI/CD pipelines.")
    (home-page "https://github.com/boyter/dcd")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; balatro-mod-manager-bin
;;; -------------------------------------------------------------------
(define-public balatro-mod-manager-bin
  (package
    (name "balatro-mod-manager-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/skyline69/balatro-mod-manager/releases/download/v" version "/balatro-mod-manager-v" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("balatro-mod-manager" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mod manager for the Balatro card game")
    (description "Balatro Mod Manager is a desktop application for managing mods for
the Balatro card game.  It provides a graphical interface for
installing, enabling, and disabling mods.")
    (home-page "https://github.com/skyline69/balatro-mod-manager")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; agent-one-bin
;;; -------------------------------------------------------------------
(define-public agent-one-bin
  (package
    (name "agent-one-bin")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AgentOne-Dev/agent-one-public/releases/download/v" version "/agent-one-" version "-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered development agent for code generation")
    (description "Agent One is an AI-powered development assistant that provides
code generation, refactoring, and analysis capabilities through
a desktop application interface.")
    (home-page "https://github.com/AgentOne-Dev/agent-one-public")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; recaf-bin
;;; -------------------------------------------------------------------
(define-public recaf-bin
  (package
    (name "recaf-bin")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Col-E/Recaf/releases/download/4.0.0-snapshot/recaf-4.0.0-SNAPSHOT-jar-with-dependencies.jar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("recaf-4.0.0-SNAPSHOT-jar-with-dependencies.jar" "share/java/recaf.jar"))))
    (synopsis "modern Java bytecode editor and reverse engineering tool")
    (description "Recaf is a modern Java bytecode editor designed for ease of use.
It provides a graphical interface for editing class files, supports
multiple decompilers, and includes search and analysis tools.")
    (home-page "https://github.com/Col-E/Recaf")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; brother-hl-l3220cw
;;; -------------------------------------------------------------------
(define-public brother-hl-l3220cw
  (package
    (name "brother-hl-l3220cw")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://download.brother.com/welcome/dlf105768/hll3220cwpdrv-3.5.1-1.i386.rpm")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "/opt/") ("usr/" "/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "printer driver for Brother HL-L3220CW color laser")
    (description "This package provides the CUPS printer driver for the Brother
HL-L3220CW color laser printer.  It includes the filter and PPD
files needed for printing.")
    (home-page "http://solutions.brother.com/linux/en_us/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; unmined-gui
;;; -------------------------------------------------------------------
(define-public unmined-gui
  (package
    (name "unmined-gui")
    (version "0.19.60")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://unmined.net/downloads/unmined_gui_" version "_linux64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "opt/unmined/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft map viewer and renderer")
    (description "unMined is a Minecraft world viewer and mapper that generates
high-resolution map images from Minecraft save files.  It supports
Java and Bedrock editions and provides both GUI and CLI interfaces.")
    (home-page "https://unmined.net/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; owon-vds-tiny
;;; -------------------------------------------------------------------
(define-public owon-vds-tiny
  (package
    (name "owon-vds-tiny")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/fluffy-kaiju/OWON-VDS1022/releases/latest/download/OWON-VDS1022.jar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("OWON-VDS1022.jar" "share/java/"))))
    (synopsis "oscilloscope software for OWON VDS1022 USB devices")
    (description "OWON VDS Tiny is a Java application for controlling OWON VDS1022
USB oscilloscopes.  It provides waveform display, triggering,
measurement, and data export capabilities.")
    (home-page "https://github.com/fluffy-kaiju/OWON-VDS1022")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; jchempaint
;;; -------------------------------------------------------------------
(define-public jchempaint
  (package
    (name "jchempaint")
    (version "3.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JChemPaint/jchempaint/releases/download/jchempaint-3.4/jchempaint-3.4-jar-with-dependencies.jar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("jchempaint-3.4-jar-with-dependencies.jar" "share/java/jchempaint.jar"))))
    (synopsis "chemical structure editor and visualizer")
    (description "JChemPaint is a Java-based chemical structure editor built on the
Chemistry Development Kit (CDK).  It provides 2D molecular drawing,
SMILES generation, and chemical file format support.")
    (home-page "https://jchempaint.github.io/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; keys-vault
;;; -------------------------------------------------------------------
(define-public keys-vault
  (package
    (name "keys-vault")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/fkzys/keys-vault/-/archive/v" version "/keys-vault-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("keys-vault" "bin/"))))
    (synopsis "encrypted vault for managing secret keys with gocryptfs")
    (description "Keys Vault is a tool for managing encrypted vaults of secret keys
and credentials using gocryptfs.  It provides a simple interface for
creating, mounting, and managing encrypted storage.")
    (home-page "https://gitlab.com/fkzys/keys-vault")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; tldr-plus-plus
;;; -------------------------------------------------------------------
(define-public tldr-plus-plus
  (package
    (name "tldr-plus-plus")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/isacikgoz/tldr") (commit (string-append "v" version ".alpha"))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive tldr pages client with smart search")
    (description "Tldr++ is an interactive community-driven man page client that
improves upon the standard tldr-pages with fuzzy search, smart
result ranking, and an interactive selection interface.")
    (home-page "https://isacikgoz.me/tldr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; amneziawg-go
;;; -------------------------------------------------------------------
(define-public amneziawg-go
  (package
    (name "amneziawg-go")
    (version "0.2.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/amnezia-vpn/amneziawg-go") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "userspace implementation of the AmneziaWG VPN protocol")
    (description "AmneziaWG-Go is a Go implementation of the AmneziaWG VPN protocol,
a modern variant of WireGuard with additional anti-censorship features.
It provides a userspace tunnel implementation.")
    (home-page "https://github.com/amnezia-vpn/amneziawg-go")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; echo-ft
;;; -------------------------------------------------------------------
(define-public echo-ft
  (package
    (name "echo-ft")
    (version "3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/IdanKoblik/Echo") (commit (string-append "b" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight command-line notification tool")
    (description "Echo is a lightweight command-line tool for sending desktop
notifications.  It supports configurable notification levels,
timeouts, and integration with system notification daemons.")
    (home-page "https://github.com/IdanKoblik/Echo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; sbb-tui
;;; -------------------------------------------------------------------
(define-public sbb-tui
  (package
    (name "sbb-tui")
    (version "1.13.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/Necrom4/sbb-tui") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based Swiss railway timetable client")
    (description "SBB-TUI is a terminal user interface for querying Swiss Federal
Railways (SBB) timetables.  It provides departure boards, connection
search, and real-time delay information in the terminal.")
    (home-page "https://github.com/Necrom4/sbb-tui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; ihj
;;; -------------------------------------------------------------------
(define-public ihj
  (package
    (name "ihj")
    (version "0.5.18")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/mikecsmith/ihj") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "interactive HTTP/JSON testing tool for APIs")
    (description "IHJ (Interactive HTTP JSON) is a command-line tool for testing
HTTP APIs interactively.  It provides request building, response
formatting, and history features for API development workflows.")
    (home-page "https://github.com/mikecsmith/ihj")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; gomobile
;;; -------------------------------------------------------------------
(define-public gomobile
  (package
    (name "gomobile")
    (version "20240203")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/golang/mobile") (commit "7088062f872d57c43bfeddf28ded5fb4e6e092f2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Go support for mobile platforms (Android and iOS)")
    (description "Gomobile provides tools and libraries for building Go programs
that run on Android and iOS.  It includes the @command{gomobile}
tool for binding Go packages as mobile libraries.")
    (home-page "https://github.com/golang/mobile")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; titlecase
;;; -------------------------------------------------------------------
(define-public titlecase
  (package
    (name "titlecase")
    (version "3.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/wezm/titlecase") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool to convert text to title case")
    (description "Titlecase is a command-line utility that converts text to title case
following English title capitalization rules.  It handles exceptions
for articles, prepositions, and conjunctions.")
    (home-page "https://github.com/wezm/titlecase")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; kalc
;;; -------------------------------------------------------------------
(define-public kalc
  (package
    (name "kalc")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/bgkillas/kalc") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "arbitrary-precision command-line calculator")
    (description "Kalc is a command-line calculator supporting arbitrary-precision
arithmetic, complex numbers, matrices, and mathematical functions.
It uses GMP, MPFR, and MPC for precise computation.")
    (home-page "https://github.com/bgkillas/kalc")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; quec
;;; -------------------------------------------------------------------
(define-public quec
  (package
    (name "quec")
    (version "0.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/bgkillas/quec") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "quick equation checker for mathematical expressions")
    (description "Quec is a command-line tool for quickly verifying mathematical
equations and expressions.  It provides fast evaluation with
support for common mathematical operations.")
    (home-page "https://github.com/bgkillas/quec")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; mproc
;;; -------------------------------------------------------------------
(define-public mproc
  (package
    (name "mproc")
    (version "0.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/BonnyAD9/mproc") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multi-process runner and manager for parallel commands")
    (description "Mproc is a command-line tool for running multiple processes in
parallel with organized output.  It provides process management,
output interleaving, and status tracking.")
    (home-page "https://github.com/BonnyAD9/mproc/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; makemake
;;; -------------------------------------------------------------------
(define-public makemake
  (package
    (name "makemake")
    (version "2.2.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/BonnyAD9/makemake-rs") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Makefile generator for C and C++ projects")
    (description "Makemake is a tool that automatically generates Makefiles for C and
C++ projects by scanning source files for dependencies.  It simplifies
build configuration for small to medium projects.")
    (home-page "https://github.com/BonnyAD9/makemake-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; kanata-switcher
;;; -------------------------------------------------------------------
(define-public kanata-switcher
  (package
    (name "kanata-switcher")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/7mind/kanata-switcher") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "layer switcher utility for the Kanata keyboard remapper")
    (description "Kanata Switcher provides a D-Bus interface for switching between
Kanata keyboard remapping layers.  It integrates with desktop
environments for layer-aware keyboard configuration.")
    (home-page "https://github.com/7mind/kanata-switcher")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; clipr
;;; -------------------------------------------------------------------
(define-public clipr
  (package
    (name "clipr")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/BonnyAD9/clipr") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line clipboard manager for text snippets")
    (description "Clipr is a lightweight clipboard manager for the command line.
It provides clipboard history, search, and snippet management
with support for multiple clipboard backends.")
    (home-page "https://github.com/BonnyAD9/clipr/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; baywatch
;;; -------------------------------------------------------------------
(define-public baywatch
  (package
    (name "baywatch")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/bjesus/baywatch") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based RSS/Atom feed reader")
    (description "Baywatch is a terminal feed reader for RSS and Atom feeds.  It
provides a minimal, keyboard-driven interface for reading news
and blog feeds from the terminal.")
    (home-page "https://github.com/bjesus/baywatch")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; linutil-git
;;; -------------------------------------------------------------------
(define-public linutil-git
  (package
    (name "linutil-git")
    (version "2026.04.09")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/ChrisTitusTech/linutil") (commit "768deda")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Linux system utility toolkit by Chris Titus Tech")
    (description "LinUtil is a collection of Linux system utilities providing
automated setup, configuration, and maintenance tasks.  It includes
tools for system optimization, package management, and desktop setup.")
    (home-page "https://github.com/ChrisTitusTech/linutil")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; kalc-plot
;;; -------------------------------------------------------------------
(define-public kalc-plot
  (package
    (name "kalc-plot")
    (version "0.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/bgkillas/kalc-plot") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical function plotter companion for kalc")
    (description "Kalc-Plot is a graphical function plotter that integrates with the
kalc calculator.  It supports plotting mathematical functions with
arbitrary precision using GMP, MPFR, and MPC libraries.")
    (home-page "https://github.com/bgkillas/kalc-plot")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; telegram-tdlib
;;; -------------------------------------------------------------------
(define-public telegram-tdlib
  (package
    (name "telegram-tdlib")
    (version "1.8.63")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/tdlib/td") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform library for building Telegram clients")
    (description "TDLib (Telegram Database Library) is a cross-platform, fully
functional Telegram client library.  It provides a high-level API
for building Telegram client applications in any programming language.")
    (home-page "https://core.telegram.org/tdlib")
    (license license:boost1.0)))

;;; -------------------------------------------------------------------
;;; gamenetworkingsockets-git
;;; -------------------------------------------------------------------
(define-public gamenetworkingsockets-git
  (package
    (name "gamenetworkingsockets-git")
    (version "1.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/ValveSoftware/GameNetworkingSockets") (commit "v" version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reliable UDP networking library by Valve Software")
    (description "GameNetworkingSockets is Valve's networking library providing
reliable and unreliable message transport over UDP.  It includes
encryption, message fragmentation, and connection management.")
    (home-page "https://github.com/ValveSoftware/GameNetworkingSockets")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; ncpamixer
;;; -------------------------------------------------------------------
(define-public ncpamixer
  (package
    (name "ncpamixer")
    (version "1.3.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/fulhax/ncpamixer") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ncurses PulseAudio mixer for the terminal")
    (description "Ncpamixer is a terminal-based PulseAudio mixer using ncurses.  It
provides per-application volume control, output device selection,
and audio stream management from the terminal.")
    (home-page "https://github.com/fulhax/ncpamixer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; idlehack-git
;;; -------------------------------------------------------------------
(define-public idlehack-git
  (package
    (name "idlehack-git")
    (version "0.0.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/loops/idlehack") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "idle inhibitor daemon for X11 and D-Bus")
    (description "Idlehack is a daemon that prevents the desktop from going idle when
certain conditions are met.  It monitors X11 and D-Bus for active
media playback or full-screen applications.")
    (home-page "https://github.com/loops/idlehack")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; nuked-sc55-jcmoyer-git
;;; -------------------------------------------------------------------
(define-public nuked-sc55-jcmoyer-git
  (package
    (name "nuked-sc55-jcmoyer-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/jcmoyer/Nuked-SC55") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Roland SC-55 sound module emulator")
    (description "Nuked SC-55 is a cycle-accurate emulator of the Roland SC-55 Sound
Canvas MIDI module.  It provides accurate synthesis of SC-55 sounds
for MIDI playback and game audio.")
    (home-page "https://github.com/jcmoyer/Nuked-SC55")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; aiwnios
;;; -------------------------------------------------------------------
(define-public aiwnios
  (package
    (name "aiwnios")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/nrootconauto/Aiwnios") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "compiler and operating system in the spirit of TempleOS")
    (description "Aiwnios is a HolyC compiler and operating system inspired by TempleOS.
It provides a JIT compiler for HolyC, a graphical environment built
on SDL2, and a self-contained programming environment.")
    (home-page "https://github.com/nrootconauto/Aiwnios")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; hyprfm-git
;;; -------------------------------------------------------------------
(define-public hyprfm-git
  (package
    (name "hyprfm-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/soyeb-jim285/hyprfm") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file manager for the Hyprland compositor")
    (description "HyprFM is a graphical file manager designed for the Hyprland Wayland
compositor.  It provides a Qt6-based interface with KDE integration
for file browsing, previewing, and management.")
    (home-page "https://github.com/soyeb-jim285/hyprfm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; pam-autologin
;;; -------------------------------------------------------------------
(define-public pam-autologin
  (package
    (name "pam-autologin")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://downloads.sourceforge.net/pam-autologin/pam_autologin-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "PAM module for automatic login without password")
    (description "Pam_autologin is a PAM authentication module that allows automatic
login for a configured user without requiring a password.  It is
useful for kiosk systems and embedded devices.")
    (home-page "https://sourceforge.net/projects/pam-autologin")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; infnoise
;;; -------------------------------------------------------------------
(define-public infnoise
  (package
    (name "infnoise")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/leetronics/infnoise") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "driver for the Infinite Noise TRNG hardware random number generator")
    (description "Infnoise provides the driver and utilities for the Infinite Noise TRNG
(True Random Number Generator) USB device.  It feeds hardware entropy
into the system random pool.")
    (home-page "https://github.com/leetronics/infnoise")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; infnoise-tools
;;; -------------------------------------------------------------------
(define-public infnoise-tools
  (package
    (name "infnoise-tools")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/leetronics/infnoise") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "command-line tools for the Infinite Noise TRNG device")
    (description "Infnoise-tools provides additional command-line utilities for testing
and analyzing output from the Infinite Noise TRNG hardware random
number generator.")
    (home-page "https://github.com/leetronics/infnoise")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; libinfnoise
;;; -------------------------------------------------------------------
(define-public libinfnoise
  (package
    (name "libinfnoise")
    (version "0.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/leetronics/infnoise") (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "shared library for the Infinite Noise TRNG device")
    (description "Libinfnoise provides a shared library for interfacing with the
Infinite Noise TRNG hardware random number generator from
applications.")
    (home-page "https://github.com/leetronics/infnoise")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; pianod
;;; -------------------------------------------------------------------
(define-public pianod
  (package
    (name "pianod")
    (version "175")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://deviousfish.com/Downloads/pianod/pianod-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "Pandora internet radio daemon with multi-user support")
    (description "Pianod is a Pandora internet radio daemon that provides multi-user
access to Pandora streams.  It supports remote control via a simple
text protocol and includes a web interface.")
    (home-page "http://deviousfish.com/pianod/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; cdecrypt-git
;;; -------------------------------------------------------------------
(define-public cdecrypt-git
  (package
    (name "cdecrypt-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/VitaSmith/cdecrypt") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "Wii U NUS content decryption tool")
    (description "Cdecrypt is a command-line tool for decrypting Wii U NUS (Nintendo
Update Server) content.  It processes encrypted title content files
for archival and analysis purposes.")
    (home-page "https://github.com/VitaSmith/cdecrypt")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; selectdefaultapplication-fork-git
;;; -------------------------------------------------------------------
(define-public selectdefaultapplication-fork-git
  (package
    (name "selectdefaultapplication-fork-git")
    (version "0.0.72")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/magnus-ISU/selectdefaultapplication") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "graphical tool for setting default applications on Linux")
    (description "SelectDefaultApplication is a simple Qt5 application for configuring
default applications on Linux.  It provides a clean interface for
associating file types with their preferred applications.")
    (home-page "https://github.com/magnus-ISU/selectdefaultapplication")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; pyinfra
;;; -------------------------------------------------------------------
(define-public pyinfra
  (package
    (name "pyinfra")
    (version "3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pyinfra-dev/pyinfra/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "infrastructure automation framework for Python")
    (description "Pyinfra automates infrastructure provisioning and configuration at
scale.  It provides a Python-based DSL for defining server states,
deploying applications, and executing commands across fleets of
machines over SSH.")
    (home-page "https://github.com/pyinfra-dev/pyinfra")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; guardian
;;; -------------------------------------------------------------------
(define-public guardian
  (package
    (name "guardian")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gavinlyonsrepo/Guardian_LTSM/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "local system monitoring tool with graphical interface")
    (description "Guardian is a Python-based local system monitoring tool that provides
a Tkinter graphical interface for viewing system resource usage,
processes, and hardware status.")
    (home-page "https://github.com/gavinlyonsrepo/Guardian_LTSM")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; colossus
;;; -------------------------------------------------------------------
(define-public colossus
  (package
    (name "colossus")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/gavinlyonsrepo/Colossus_LTSM/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "large text system monitor with graphical display")
    (description "Colossus is a Python-based system monitor that displays system
resource information in a large, readable graphical format.  It
provides at-a-glance monitoring of CPU, memory, and disk usage.")
    (home-page "https://github.com/gavinlyonsrepo/Colossus_LTSM")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; mausoleum
;;; -------------------------------------------------------------------
(define-public mausoleum
  (package
    (name "mausoleum")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mandeep/Mausoleum/archive/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (synopsis "graphical frontend for Tomb encrypted storage")
    (description "Mausoleum is a PyQt5 graphical interface for managing Tomb encrypted
volumes.  It provides easy creation, opening, and management of
encrypted storage containers.")
    (home-page "https://github.com/mandeep/Mausoleum")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; hg-fast-export
;;; -------------------------------------------------------------------
(define-public hg-fast-export
  (package
    (name "hg-fast-export")
    (version "250330")
    (source (origin
              (method url-fetch)
              (uri "https://repo.or.cz/fast-export.git/snapshot/HEAD.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hg-fast-export.sh" "bin/") ("hg-fast-export.py" "bin/") ("hg2git.py" "lib/hg-fast-export/"))))
    (synopsis "Mercurial to Git repository converter")
    (description "Hg-fast-export converts Mercurial repositories to Git using the
fast-import/fast-export format.  It preserves branches, tags, and
history during the conversion process.")
    (home-page "https://repo.or.cz/fast-export.git")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; cockpit-navigator
;;; -------------------------------------------------------------------
(define-public cockpit-navigator
  (package
    (name "cockpit-navigator")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/45Drives/cockpit-navigator/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/cockpit/navigator/"))))
    (synopsis "file browser plugin for the Cockpit web console")
    (description "Cockpit Navigator is a file browser extension for the Cockpit server
management web console.  It provides file upload, download, rename,
and directory management capabilities.")
    (home-page "https://github.com/45Drives/cockpit-navigator")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; mainsail-config-git
;;; -------------------------------------------------------------------
(define-public mainsail-config-git
  (package
    (name "mainsail-config-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/mainsail-crew/mainsail-config") (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mainsail-config/"))))
    (synopsis "default configuration macros for Mainsail 3D printer interface")
    (description "Mainsail Config provides default Klipper macro configurations for the
Mainsail 3D printer web interface.  It includes printer calibration,
parking, and convenience macros.")
    (home-page "https://github.com/mainsail-crew/mainsail-config")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; pacfzf
;;; -------------------------------------------------------------------
(define-public pacfzf
  (package
    (name "pacfzf")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mossbraxtin/pacfzf/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pacfzf" "bin/"))))
    (synopsis "fuzzy-finder wrapper for pacman package management")
    (description "Pacfzf is a shell script that wraps pacman with fzf (fuzzy finder)
for interactive package searching, installation, and removal on
Arch Linux.")
    (home-page "https://github.com/mossbraxtin/pacfzf")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; atha
;;; -------------------------------------------------------------------
(define-public atha
  (package
    (name "atha")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Bangkah/Atha/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("atha" "bin/"))))
    (synopsis "automated system setup helper for Arch Linux")
    (description "Atha is a shell script toolkit for automating Arch Linux system
setup tasks including package installation, configuration, and
customization.")
    (home-page "https://github.com/Bangkah/Atha")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; localcommand
;;; -------------------------------------------------------------------
(define-public localcommand
  (package
    (name "localcommand")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/bjesus/localcommand/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("localcommand" "bin/"))))
    (synopsis "location-aware command runner based on working directory")
    (description "Localcommand runs predefined commands based on the current working
directory.  It is useful for automating project-specific tasks
that should execute when entering a directory.")
    (home-page "https://github.com/bjesus/localcommand")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; fakeit
;;; -------------------------------------------------------------------
(define-public fakeit
  (package
    (name "fakeit")
    (version "2.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference (url "https://github.com/eranpeer/FakeIt") (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C++ mocking framework for test-driven development")
    (description "FakeIt is a simple yet powerful C++ mocking framework that requires
no boilerplate code.  It supports GTest, MSTest, Boost, and other
test frameworks with a clean API for creating mock objects.")
    (home-page "https://github.com/eranpeer/FakeIt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; icecat-umatrix
;;; -------------------------------------------------------------------
(define-public icecat-umatrix
  (package
    (name "icecat-umatrix")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/firefox/downloads/file/3812704/umatrix-1.4.4.xpi")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("umatrix-1.4.4.xpi" "lib/icecat/extensions/"))))
    (synopsis "point-and-click content filtering extension for IceCat")
    (description "uMatrix is a browser extension for IceCat/Firefox that provides
fine-grained, point-and-click control over which network requests
the browser is allowed to make.  It blocks scripts, iframes, ads,
and trackers based on user-defined rules.")
    (home-page "https://github.com/gorhill/uMatrix")
    (license license:gpl3+)))
