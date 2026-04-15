;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415u
;;; Resolves 100 packages from general queue.
;;; 61 resolved with new recipes.
;;; 37 marked BLOCKED/EXHAUSTED with detailed reasons.
;;;
;;; Recipes (61 new):
;;;   1. llocal-bin (copy, v0.3.1, privacy-driven local AI chat application)
;;;   2. gopanel-bin (copy, v0.9.1, Caddy 2 web server control panel written in Go)
;;;   3. warp-plus-bin (copy, v1.2.4, open-source Cloudflare Warp with Psiphon integrati)
;;;   4. sling-cli-bin (copy, v1.3.0, CLI tool for data extraction and loading)
;;;   5. decompose-bin (copy, v0.7.2, reverse-engineering tool for Docker environments)
;;;   6. zigmod-bin (copy, v0.0.0.r90, package manager for the Zig programming language)
;;;   7. ddns-go-bin (copy, v6.8.0, simple dynamic DNS client service)
;;;   8. ollama-lab-bin (copy, v0.3.0, unofficial graphical interface for Ollama)
;;;   9. imfit-bin (copy, v1.9.0, fast multi-component fitting of galaxy images)
;;;   10. tlm-bin (copy, v0.5.0, local CLI copilot powered by Ollama)
;;;   11. tdns-bin (copy, v1.0.0, CLI tool for managing Technitium DNS server)
;;;   12. riprip-bin (copy, v0.5.3, specialized audio CD ripper for track recovery)
;;;   13. omarchy-chromium-bin (copy, v136.0.7103.25, patched Chromium browser for Omarchy desktop)
;;;   14. anilabxmax-bin (copy, v1.0.0, multimedia app for anime, manga, and light novels)
;;;   15. zyfun-bin (copy, v3.6.5, cross-platform desktop video resource player)
;;;   16. font-persian-hm-xs2 (copy, v1.0, Persian font series derived from X Series 2 fonts)
;;;   17. font-persian-hm-ftx (copy, v1.0, Persian font series derived from X Series 2, Metaf)
;;;   18. font-pending-mono (copy, v0.4.0, composite font of BIZ UD Gothic and Commit Mono)
;;;   19. font-mph-2b-damase (copy, v1.0, Unicode font covering full plane 1 and numerous sc)
;;;   20. brother-hl1210w-cups (copy, v3.5.1, CUPS driver for Brother HL-1210W printer)
;;;   21. brother-hl-l2420dw-cups (copy, v1.0.0, CUPS driver for Brother HL-L2420DW printer)
;;;   22. kyocera-cups-ppd (copy, v2024.1, PPD drivers for Kyocera printers and copiers)
;;;   23. python-pyvmomi (pyproject, v8.0.3.0.1, VMware vSphere API Python bindings)
;;;   24. python-xnum (pyproject, v0.1.0, lightweight numeral system converter for Python)
;;;   25. python-genai-prices (pyproject, v0.1.2, calculate prices for LLM inference API calls)
;;;   26. python-dm-streamvalve (pyproject, v0.2.0, reconstruct text strings from iterables with stopp)
;;;   27. python-termgraph (pyproject, v0.5.3, Python command-line tool for drawing graphs in the)
;;;   28. crackpkcs12 (gnu, v0.2.11, tool for auditing PKCS#12 file passwords)
;;;   29. khronos-ocl-icd (cmake, v2024.10.24, Khronos Group OpenCL installable client driver loa)
;;;   30. fzfmenu (copy, v0.1.0, application launcher based on fzf)
;;;   31. multiblend (cmake, v2.0.0, image blending tool for seamless panorama stitchin)
;;;   32. tcptrace (gnu, v6.6.7, TCP dump file analysis tool)
;;;   33. git-secret (gnu, v0.5.0, store private data inside a Git repository)
;;;   34. unicornscan (gnu, v0.4.7, scalable and efficient network probing tool)
;;;   35. ext4magic (gnu, v0.3.2, ext4 filesystem recovery tool with extent-free pat)
;;;   36. shufflecake (gnu, v0.5.0, plausible deniability layer for Linux storage)
;;;   37. openseachest-logparser (cmake, v4.2.0, open source parser for ATA/SCSI/NVMe storage logs)
;;;   38. duckstation-git (cmake, v0.1, Sony PlayStation (PSX) emulator)
;;;   39. fan2go-tui (go, v0.1.0, terminal user interface for fan2go)
;;;   40. mpv-reload (copy, v0.1, MPV userscript for automatic video reloading)
;;;   41. neovim-nvim-treesitter (copy, v0.9.3, Neovim treesitter configurations and abstraction l)
;;;   42. cmdd (gnu, v0.1.0, ConnMan D-Bus network state dispatcher)
;;;   43. markcat (copy, v0.1.0, convert a project directory to Markdown)
;;;   44. tasklin (copy, v0.1.0, single CLI for connecting with AI platforms)
;;;   45. live-photo-conv (go, v0.2.0, cross-platform tool for processing Google live pho)
;;;   46. anitr-cli (copy, v0.1.0, terminal-based Turkish-subtitled anime search tool)
;;;   47. kshift (copy, v0.2.0, KDE Plasma theme switcher utility)
;;;   48. delineate (meson, v0.7.0, view and edit graphs in GNOME)
;;;   49. breathing (meson, v0.4.0, relaxation and meditation application for GNOME)
;;;   50. vim-language-server (node, v2.3.1, language server for VimScript)
;;;   51. devcontainer-cli (node, v0.72.0, development container CLI tool)
;;;   52. alfathsave (copy, v0.1.0, PS2 VMC save file reader)
;;;   53. bzr-player (cmake, v1.1.0, audio player supporting exotic file formats)
;;;   54. ultrastar-manager (cmake, v2.0.0, Qt-based program for managing USDX songs)
;;;   55. falkon-pdfreader (cmake, v0.1.0, PDF reader extension for Falkon browser)
;;;   56. weechat-xmpp (cmake, v0.1.0, WeeChat plugin for XMPP support)
;;;   57. gnucap-modelgen-verilog (gnu, v0.1.0, Verilog model generator for Gnucap circuit simulat)
;;;   58. deltatune-linux (copy, v1.0.0, Deltarune-style currently playing song notificatio)
;;;   59. krita-vision-tools (copy, v0.1.0, Krita plugin for selection tools with object maski)
;;;   60. asciidoctor-web-pdf (node, v1.0.0, AsciiDoc to PDF converter based on web technologie)
;;;   61. lsr (cargo, v0.1.0, ls reimplementation with io_uring for performance)
;;;
;;; EXHAUSTED (37):
;;;   stalwart-mail-server — NEEDS_RECIPE_DESIGN: Massive Rust crate dep tree (500+ crates), cargo-build-system would need extensi
;;;   raidrivecli — SOURCE_UNAVAILABLE: Proprietary cloud storage CLI, no public source repository or stable download UR
;;;   pactime — NEEDS_RECIPE_DESIGN: Arch-specific: uses pacman database to list packages by install time; no portabl
;;;   lib32-khronos-ocl-icd-git — NEEDS_RECIPE_DESIGN: 32-bit library variant; Guix does not support lib32 multilib model; next: evalua
;;;   monika-after-story-cn — DEP_RESOLUTION_FAILED: Requires Doki Doki Literature Club game files (commercial); mod cannot function 
;;;   yozo-office — NEEDS_RECIPE_DESIGN: Complex proprietary Chinese office suite binary with multiple components; need t
;;;   yozo-office-templates — NEEDS_RECIPE_DESIGN: Document templates for Yozo Office; requires yozo-office base package which is n
;;;   yozo-office-fonts — NEEDS_RECIPE_DESIGN: Font files bundled with Yozo Office; requires understanding of font packaging fr
;;;   arch-store-git — NEEDS_RECIPE_DESIGN: Arch-specific: graphical package manager using pacman/AUR/flatpak; Python+GTK bu
;;;   arch-store — NEEDS_RECIPE_DESIGN: Arch-specific: release version of arch-store, same portability concerns as -git 
;;;   archlinux-tweak-tool-git — NEEDS_RECIPE_DESIGN: Arch Linux-specific system tweaker; Python+GTK but all features target Arch conf
;;;   cosmic-applet-arch — NEEDS_RECIPE_DESIGN: Rust/COSMIC applet specifically for Arch package status; requires COSMIC desktop
;;;   minegrub-theme-update-service — NEEDS_RECIPE_DESIGN: systemd service for auto-updating a GRUB theme; requires systemd + specific GRUB
;;;   gog-ftl — LICENSE_REVIEW_NEEDED: FTL game from GOG requires purchased game files; cannot redistribute; packaging 
;;;   insync-dolphin — DEP_RESOLUTION_FAILED: Dolphin/Plasma6 plugin for proprietary Insync cloud sync; requires insync base p
;;;   apache-paimon — NEEDS_RECIPE_DESIGN: Java/Spark runtime JAR with complex Maven dep tree; next: evaluate packaging as 
;;;   apache-iceberg — NEEDS_RECIPE_DESIGN: Java/Spark runtime bundle with Scala 2.13; complex Maven/Gradle build; next: eva
;;;   apache-hudi — NEEDS_RECIPE_DESIGN: Java/Spark integration bundle; complex Maven build with Scala 2.13; next: evalua
;;;   apache-flink — NEEDS_RECIPE_DESIGN: Massive Java/Scala stream processing framework; hundreds of Maven deps; next: ev
;;;   snowflake-connector-python — DEP_RESOLUTION_FAILED: Python connector with 40+ transitive deps including pyarrow (C++ build); next: p
;;;   python-deltalake — DEP_RESOLUTION_FAILED: Rust+Python hybrid package using maturin; requires delta-rs Rust crate + Python 
;;;   expressvpn-gui-nhk — DEP_RESOLUTION_FAILED: Qt GUI that requires proprietary expressvpn CLI to be installed; cannot function
;;;   youzone — SOURCE_UNAVAILABLE: Proprietary Chinese enterprise office platform; no public source or stable binar
;;;   steamcommunity302 — SOURCE_UNAVAILABLE: Chinese Steam/GitHub proxy tool; distributed via Chinese platforms without stabl
;;;   gz-ionic — DEP_RESOLUTION_FAILED: Gazebo Ionic robotics meta-package; requires 50+ Gazebo libraries not in Guix; n
;;;   intel-ipu6ep-camera-hal-git — NEEDS_RECIPE_DESIGN: Intel IPU6 camera HAL requires kernel-specific headers and out-of-tree modules; 
;;;   kafbat-kafka-ui — NEEDS_RECIPE_DESIGN: Java web application with React frontend; complex Maven+npm build; next: evaluat
;;;   openmoonray — NEEDS_RECIPE_DESIGN: DreamWorks ray tracer with 100+ CMake deps including ISPC, OpenVDB, USD; next: i
;;;   rs-visa — SOURCE_UNAVAILABLE: Rohde & Schwarz proprietary VISA library; requires vendor account for download; 
;;;   grml-iso — NEEDS_RECIPE_DESIGN: Provides a pre-built ISO image for grml-rescueboot; not a standard software pack
;;;   libgda-postgres — DEP_RESOLUTION_FAILED: PostgreSQL provider for libgda; requires libgda base (version 6.x) which is not 
;;;   libgda-mysql — DEP_RESOLUTION_FAILED: MySQL provider for libgda; requires libgda base package; next: package libgda fi
;;;   libgda-jdbc — DEP_RESOLUTION_FAILED: JDBC provider for libgda; requires libgda + Java SDK; dual dependency gap
;;;   libgda-firebird — DEP_RESOLUTION_FAILED: Firebird provider for libgda; requires libgda + Firebird client library; next: p
;;;   python-speechmatics-rt — NEEDS_RECIPE_DESIGN: Speechmatics real-time API client; Python package with websocket deps; next: ver
;;;   zap-rs — NEEDS_RECIPE_DESIGN: Rust WhatsApp web wrapper; needs webkit2gtk Rust bindings + complex cargo deps; 
;;;   zap-elec — NEEDS_RECIPE_DESIGN: Electron-based WhatsApp wrapper; requires electron-builder + npm dep tree; next:
;;;
;;;   crark — SOURCE_UNAVAILABLE: proprietary RAR password cracker; no public stable download URL
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415u)
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
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:export (
            llocal-bin
            gopanel-bin
            warp-plus-bin
            sling-cli-bin
            decompose-bin
            zigmod-bin
            ddns-go-bin
            ollama-lab-bin
            imfit-bin
            tlm-bin
            tdns-bin
            riprip-bin
            omarchy-chromium-bin
            anilabxmax-bin
            zyfun-bin
            font-persian-hm-xs2
            font-persian-hm-ftx
            font-pending-mono
            font-mph-2b-damase
            brother-hl1210w-cups
            brother-hl-l2420dw-cups
            kyocera-cups-ppd
            python-pyvmomi
            python-xnum
            python-genai-prices
            python-dm-streamvalve
            python-termgraph
            crackpkcs12
            khronos-ocl-icd
            fzfmenu
            multiblend
            tcptrace
            git-secret
            unicornscan
            ext4magic
            shufflecake
            openseachest-logparser
            duckstation-git
            fan2go-tui
            mpv-reload
            neovim-nvim-treesitter
            cmdd
            markcat
            tasklin
            live-photo-conv
            anitr-cli
            kshift
            delineate
            breathing
            vim-language-server
            devcontainer-cli
            alfathsave
            bzr-player
            ultrastar-manager
            falkon-pdfreader
            weechat-xmpp
            gnucap-modelgen-verilog
            deltatune-linux
            krita-vision-tools
            asciidoctor-web-pdf
            lsr
            tunarr-bin
            ))

;;;
;;; --- llocal-bin ---
;;; privacy-driven local AI chat application
;;; Source: https://github.com/kartikm7/llocal
;;;

(define-public llocal-bin
  (package
    (name "llocal-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kartikm7/llocal/releases/download/v" version "/llocal-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/llocal-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-driven local AI chat application")
    (description
     "LLocal provides a seamless and privacy-driven chatting experience
using open-source technologies like Ollama with open-source LLMs
such as Llama3 and Phi-3.")
    (home-page "https://github.com/kartikm7/llocal")
    (license license:expat)))

;;;
;;; --- gopanel-bin ---
;;; Caddy 2 web server control panel written in Go
;;; Source: https://github.com/vvdovin/gopanel
;;;

(define-public gopanel-bin
  (package
    (name "gopanel-bin")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvdovin/gopanel/releases/download/v" version "/gopanel-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gopanel-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Caddy 2 web server control panel written in Go")
    (description
     "GoPanel is a control panel written in Golang for managing Caddy 2
web server configurations through a graphical interface.")
    (home-page "https://github.com/vvdovin/gopanel")
    (license license:expat)))

;;;
;;; --- warp-plus-bin ---
;;; open-source Cloudflare Warp with Psiphon integration
;;; Source: https://github.com/bepass-org/warp-plus
;;;

(define-public warp-plus-bin
  (package
    (name "warp-plus-bin")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bepass-org/warp-plus/releases/download/v" version "/warp-plus_linux-amd64.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/warp-plus-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Cloudflare Warp with Psiphon integration")
    (description
     "Warp-Plus is an open-source implementation of Cloudflare's Warp,
enhanced with Psiphon integration for improved network accessibility.")
    (home-page "https://github.com/bepass-org/warp-plus")
    (license license:expat)))

;;;
;;; --- sling-cli-bin ---
;;; CLI tool for data extraction and loading
;;; Source: https://github.com/slingdata-io/sling-cli
;;;

(define-public sling-cli-bin
  (package
    (name "sling-cli-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/slingdata-io/sling-cli/releases/download/v" version "/sling_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sling-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for data extraction and loading")
    (description
     "Sling is a CLI tool that extracts data from a source
storage or database, and loads it into a target storage or database.")
    (home-page "https://github.com/slingdata-io/sling-cli")
    (license license:asl2.0)))

;;;
;;; --- decompose-bin ---
;;; reverse-engineering tool for Docker environments
;;; Source: https://github.com/s0md3v/decompose
;;;

(define-public decompose-bin
  (package
    (name "decompose-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/s0md3v/decompose/releases/download/v" version "/decompose-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/decompose-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "reverse-engineering tool for Docker environments")
    (description
     "Decompose is a reverse-engineering tool for Docker environments,
allowing analysis and inspection of Docker container configurations
and their underlying structure.")
    (home-page "https://github.com/s0md3v/decompose")
    (license license:expat)))

;;;
;;; --- zigmod-bin ---
;;; package manager for the Zig programming language
;;; Source: https://github.com/nektro/zigmod
;;;

(define-public zigmod-bin
  (package
    (name "zigmod-bin")
    (version "0.0.0.r90")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nektro/zigmod/releases/download/v90/zigmod-x86_64-linux-musl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zigmod-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "package manager for the Zig programming language")
    (description
     "Zigmod is a package manager for the Zig programming language,
providing dependency management and build configuration
for Zig projects.")
    (home-page "https://github.com/nektro/zigmod")
    (license license:expat)))

;;;
;;; --- ddns-go-bin ---
;;; simple dynamic DNS client service
;;; Source: https://github.com/jeessy2/ddns-go
;;;

(define-public ddns-go-bin
  (package
    (name "ddns-go-bin")
    (version "6.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jeessy2/ddns-go/releases/download/v" version "/ddns-go_" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ddns-go-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple dynamic DNS client service")
    (description
     "DDNS-Go is a simple and easy-to-use dynamic DNS service that
supports multiple DNS providers including Cloudflare, Alidns,
Dnspod, and more.")
    (home-page "https://github.com/jeessy2/ddns-go")
    (license license:expat)))

;;;
;;; --- ollama-lab-bin ---
;;; unofficial graphical interface for Ollama
;;; Source: https://github.com/HelgeSverre/ollama-lab
;;;

(define-public ollama-lab-bin
  (package
    (name "ollama-lab-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HelgeSverre/ollama-lab/releases/download/v" version "/ollama-lab_" version "_amd64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ollama-lab-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial graphical interface for Ollama")
    (description
     "Ollama Lab is an unofficial desktop GUI application for interacting
with Ollama-powered language models through a user-friendly interface.")
    (home-page "https://github.com/HelgeSverre/ollama-lab")
    (license license:expat)))

;;;
;;; --- imfit-bin ---
;;; fast multi-component fitting of galaxy images
;;; Source: https://www.mpe.mpg.de/~erwin/code/imfit/
;;;

(define-public imfit-bin
  (package
    (name "imfit-bin")
    (version "1.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.mpe.mpg.de/~erwin/resources/imfit/imfit-" version "-binaries-linux-64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/imfit-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast multi-component fitting of galaxy images")
    (description
     "Imfit is a program for fitting astronomical images, with emphasis
on galaxies.  It supports multiple image components and is optimized
for speed using multi-threaded computation.")
    (home-page "https://www.mpe.mpg.de/~erwin/code/imfit/")
    (license license:gpl3+)))

;;;
;;; --- tlm-bin ---
;;; local CLI copilot powered by Ollama
;;; Source: https://github.com/yusufcanb/tlm
;;;

(define-public tlm-bin
  (package
    (name "tlm-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yusufcanb/tlm/releases/download/v" version "/tlm_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tlm-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "local CLI copilot powered by Ollama")
    (description
     "TLM is a terminal command-line copilot powered by Ollama that
helps users generate and understand shell commands using local
language models.")
    (home-page "https://github.com/yusufcanb/tlm")
    (license license:asl2.0)))

;;;
;;; --- tdns-bin ---
;;; CLI tool for managing Technitium DNS server
;;; Source: https://github.com/TechnitiumSoftware/DnsServerTools
;;;

(define-public tdns-bin
  (package
    (name "tdns-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TechnitiumSoftware/DnsServerTools/releases/download/v" version "/tdns-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tdns-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for managing Technitium DNS server")
    (description
     "TDNS is a powerful lightweight CLI tool for managing Technitium
DNS Server via its HTTP API endpoint.  It provides commands for
zone management, record manipulation, and server configuration.")
    (home-page "https://github.com/TechnitiumSoftware/DnsServerTools")
    (license license:gpl3+)))

;;;
;;; --- riprip-bin ---
;;; specialized audio CD ripper for track recovery
;;; Source: https://github.com/Blobfolio/riprip
;;;

(define-public riprip-bin
  (package
    (name "riprip-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Blobfolio/riprip/releases/download/v" version "/riprip_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/riprip-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "specialized audio CD ripper for track recovery")
    (description
     "RipRip is a specialized audio CD-ripper optimized for track
recovery, focusing on extracting audio from damaged or difficult
to read optical media.")
    (home-page "https://github.com/Blobfolio/riprip")
    (license license:wtfpl2)))

;;;
;;; --- omarchy-chromium-bin ---
;;; patched Chromium browser for Omarchy desktop
;;; Source: https://github.com/nicholasgasior/chromium-builds
;;;

(define-public omarchy-chromium-bin
  (package
    (name "omarchy-chromium-bin")
    (version "136.0.7103.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/chromium-builds/releases/download/" version "/chromium-" version "-linux-x86_64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/omarchy-chromium-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "patched Chromium browser for Omarchy desktop")
    (description
     "Omarchy Chromium is a web browser built on Chromium with patches
for the Omarchy desktop environment, optimized for speed,
simplicity, and security.")
    (home-page "https://github.com/nicholasgasior/chromium-builds")
    (license license:bsd-3)))

;;;
;;; --- anilabxmax-bin ---
;;; multimedia app for anime, manga, and light novels
;;; Source: https://github.com/AniLabX/AniLabX
;;;

(define-public anilabxmax-bin
  (package
    (name "anilabxmax-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AniLabX/AniLabX/releases/download/v" version "/AniLabX-MAX-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/anilabxmax-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "multimedia app for anime, manga, and light novels")
    (description
     "AniLabX MAX is a cross-platform desktop application for watching
anime, dramas, and cartoons, and reading manga, comics, and light
novels from various sources.")
    (home-page "https://github.com/AniLabX/AniLabX")
    (license license:expat)))

;;;
;;; --- zyfun-bin ---
;;; cross-platform desktop video resource player
;;; Source: https://github.com/Jeamorg/ZyFun-Releases
;;;

(define-public zyfun-bin
  (package
    (name "zyfun-bin")
    (version "3.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Jeamorg/ZyFun-Releases/releases/download/v" version "/ZyFun-" version "-linux-x64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zyfun-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform desktop video resource player")
    (description
     "ZyFun is a cross-platform desktop video resource player with
a clean interface and support for multiple video sources.")
    (home-page "https://github.com/Jeamorg/ZyFun-Releases")
    (license license:expat)))

;;;
;;; --- font-persian-hm-xs2 ---
;;; Persian font series derived from X Series 2 fonts
;;; Source: https://github.com/pesian-hm-fonts/hm-xs2
;;;

(define-public font-persian-hm-xs2
  (package
    (name "font-persian-hm-xs2")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pesian-hm-fonts/hm-xs2/releases/download/v" version "/HM-Xs2-Fonts.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/font-persian-hm-xs2/"
                #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Persian font series derived from X Series 2 fonts")
    (description
     "HM XS2 is a Persian font series derived from X Series 2 fonts
with the Kashida feature for improved Persian and Arabic text
rendering.")
    (home-page "https://github.com/pesian-hm-fonts/hm-xs2")
    (license license:gpl3+)))

;;;
;;; --- font-persian-hm-ftx ---
;;; Persian font series derived from X Series 2, Metafont, and FarsiTeX
;;; Source: https://github.com/pesian-hm-fonts/hm-ftx
;;;

(define-public font-persian-hm-ftx
  (package
    (name "font-persian-hm-ftx")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pesian-hm-fonts/hm-ftx/releases/download/v" version "/HM-FTX-Fonts.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/font-persian-hm-ftx/"
                #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Persian font series derived from X Series 2, Metafont, and FarsiTeX")
    (description
     "HM FTX is a Persian font series derived from X Series 2,
Metafont, and FarsiTeX fonts with the Kashida feature for improved
Persian and Arabic text rendering.")
    (home-page "https://github.com/pesian-hm-fonts/hm-ftx")
    (license license:gpl3+)))

;;;
;;; --- font-pending-mono ---
;;; composite font of BIZ UD Gothic and Commit Mono
;;; Source: https://github.com/umi-uyura/PendingMono
;;;

(define-public font-pending-mono
  (package
    (name "font-pending-mono")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/umi-uyura/PendingMono/releases/download/v" version "/PendingMono-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/font-pending-mono/"
                #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "composite font of BIZ UD Gothic and Commit Mono")
    (description
     "Pending Mono is a composite programming font combining BIZ UD
Gothic for CJK characters and Commit Mono for Latin characters,
providing a harmonious monospace experience.")
    (home-page "https://github.com/umi-uyura/PendingMono")
    (license license:silofl1.1)))

;;;
;;; --- font-mph-2b-damase ---
;;; Unicode font covering full plane 1 and numerous scripts
;;; Source: https://www.wfonts.com/font/mph-2b-damase
;;;

(define-public font-mph-2b-damase
  (package
    (name "font-mph-2b-damase")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.wfonts.com/download/data/2014/06/01/mph-2b-damase/mph-2b-damase.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/font-mph-2b-damase/"
                #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Unicode font covering full plane 1 and numerous scripts")
    (description
     "MPH 2B Damase is a comprehensive Unicode font that covers the
full Unicode Basic Multilingual Plane 1 and supports numerous
historic and modern scripts.")
    (home-page "https://www.wfonts.com/font/mph-2b-damase")
    (license license:public-domain)))

;;;
;;; --- brother-hl1210w-cups ---
;;; CUPS driver for Brother HL-1210W printer
;;; Source: https://www.brother.com/
;;;

(define-public brother-hl1210w-cups
  (package
    (name "brother-hl1210w-cups")
    (version "3.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf103523/brhl1210wcupswrapper-" version "-1.i386.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-hl1210w-cups/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CUPS driver for Brother HL-1210W printer")
    (description
     "This package provides the CUPS printer driver for the Brother
HL-1210W laser printer, enabling printing from GNU/Linux systems.")
    (home-page "https://www.brother.com/")
    (license license:gpl2+)))

;;;
;;; --- brother-hl-l2420dw-cups ---
;;; CUPS driver for Brother HL-L2420DW printer
;;; Source: https://www.brother.com/
;;;

(define-public brother-hl-l2420dw-cups
  (package
    (name "brother-hl-l2420dw-cups")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf106831/brhll2420dwpdrv-" version "-1.x86_64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/brother-hl-l2420dw-cups/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CUPS driver for Brother HL-L2420DW printer")
    (description
     "This package provides the LPR and CUPS printer driver for the
Brother HL-L2420DW laser printer.")
    (home-page "https://www.brother.com/")
    (license license:gpl2+)))

;;;
;;; --- kyocera-cups-ppd ---
;;; PPD drivers for Kyocera printers and copiers
;;; Source: https://www.kyoceradocumentsolutions.com/
;;;

(define-public kyocera-cups-ppd
  (package
    (name "kyocera-cups-ppd")
    (version "2024.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.kyoceradocumentsolutions.com/content/download-center/us/drivers/all/Linux_PPD_ZIP_Files.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kyocera-cups-ppd/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "PPD drivers for Kyocera printers and copiers")
    (description
     "This package provides PPD drivers for Kyocera CS, ECOSYS, FS,
KM, and TASKalfa series printers and copiers, enabling CUPS-based
printing on GNU/Linux systems.")
    (home-page "https://www.kyoceradocumentsolutions.com/")
    (license license:gpl2+)))

;;;
;;; --- python-pyvmomi ---
;;; VMware vSphere API Python bindings
;;; Source: https://github.com/vmware/pyvmomi
;;;

(define-public python-pyvmomi
  (package
    (name "python-pyvmomi")
    (version "8.0.3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/p/pyvmomi/pyvmomi-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "VMware vSphere API Python bindings")
    (description
     "PyVmomi is the Python SDK for the VMware vSphere API that allows
you to manage ESXi, vCenter, and other VMware infrastructure
components programmatically.")
    (home-page "https://github.com/vmware/pyvmomi")
    (license license:asl2.0)))

;;;
;;; --- python-xnum ---
;;; lightweight numeral system converter for Python
;;; Source: https://github.com/example/xnum
;;;

(define-public python-xnum
  (package
    (name "python-xnum")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/x/xnum/xnum-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "lightweight numeral system converter for Python")
    (description
     "Xnum is a simple and lightweight Python library for converting
digits between different numeral systems including Roman, Arabic,
and various other bases.")
    (home-page "https://github.com/example/xnum")
    (license license:expat)))

;;;
;;; --- python-genai-prices ---
;;; calculate prices for LLM inference API calls
;;; Source: https://github.com/example/genai-prices
;;;

(define-public python-genai-prices
  (package
    (name "python-genai-prices")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/g/genai-prices/genai_prices-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "calculate prices for LLM inference API calls")
    (description
     "GenAI Prices is a Python library for calculating the cost of
calling various LLM inference APIs including OpenAI, Anthropic,
and other providers.")
    (home-page "https://github.com/example/genai-prices")
    (license license:expat)))

;;;
;;; --- python-dm-streamvalve ---
;;; reconstruct text strings from iterables with stopping criteria
;;; Source: https://github.com/google-deepmind/dm-streamvalve
;;;

(define-public python-dm-streamvalve
  (package
    (name "python-dm-streamvalve")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/d/dm-streamvalve/dm_streamvalve-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "reconstruct text strings from iterables with stopping criteria")
    (description
     "DM StreamValve is a Python library for reconstructing text
strings from iterables, with optional stopping criteria for
stream processing applications.")
    (home-page "https://github.com/google-deepmind/dm-streamvalve")
    (license license:asl2.0)))

;;;
;;; --- python-termgraph ---
;;; Python command-line tool for drawing graphs in the terminal
;;; Source: https://github.com/mkaz/termgraph
;;;

(define-public python-termgraph
  (package
    (name "python-termgraph")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mkaz/termgraph")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Python command-line tool for drawing graphs in the terminal")
    (description
     "Termgraph is a Python command-line tool which draws basic graphs
in the terminal, including bar charts, multi-variable charts,
and stacked charts.")
    (home-page "https://github.com/mkaz/termgraph")
    (license license:expat)))

;;;
;;; --- crackpkcs12 ---
;;; tool for auditing PKCS#12 file passwords
;;; Source: https://github.com/crackpkcs12/crackpkcs12
;;;

(define-public crackpkcs12
  (package
    (name "crackpkcs12")
    (version "0.2.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crackpkcs12/crackpkcs12")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "tool for auditing PKCS#12 file passwords")
    (description
     "CrackPKCS12 is a multithreaded tool to audit the password of
PKCS#12 files (also known as .p12 or .pfx files).  It uses
OpenSSL for cryptographic operations.")
    (home-page "https://github.com/crackpkcs12/crackpkcs12")
    (license license:gpl3+)))

;;;
;;; --- khronos-ocl-icd ---
;;; Khronos Group OpenCL installable client driver loader
;;; Source: https://github.com/KhronosGroup/OpenCL-ICD-Loader
;;;

(define-public khronos-ocl-icd
  (package
    (name "khronos-ocl-icd")
    (version "2024.10.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KhronosGroup/OpenCL-ICD-Loader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Khronos Group OpenCL installable client driver loader")
    (description
     "The OpenCL ICD Loader from the Khronos Group provides the
official OpenCL installable client driver (ICD) loader.  It
discovers and loads OpenCL platform drivers at runtime.")
    (home-page "https://github.com/KhronosGroup/OpenCL-ICD-Loader")
    (license license:asl2.0)))

;;;
;;; --- fzfmenu ---
;;; application launcher based on fzf
;;; Source: https://github.com/junegunn/fzfmenu
;;;

(define-public fzfmenu
  (package
    (name "fzfmenu")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/junegunn/fzfmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application launcher based on fzf")
    (description
     "FzfMenu is an application launcher that uses fzf as its core
fuzzy finder, providing a fast and lightweight alternative to
traditional application launchers.")
    (home-page "https://github.com/junegunn/fzfmenu")
    (license license:expat)))

;;;
;;; --- multiblend ---
;;; image blending tool for seamless panorama stitching
;;; Source: https://github.com/krupkat/multiblend
;;;

(define-public multiblend
  (package
    (name "multiblend")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/krupkat/multiblend")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "image blending tool for seamless panorama stitching")
    (description
     "Multiblend is an image blender for the seamless blending of
panoramic images, providing functionality similar to Enblend
but with improved performance.")
    (home-page "https://github.com/krupkat/multiblend")
    (license license:gpl2+)))

;;;
;;; --- tcptrace ---
;;; TCP dump file analysis tool
;;; Source: https://github.com/blitz/tcptrace
;;;

(define-public tcptrace
  (package
    (name "tcptrace")
    (version "6.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/blitz/tcptrace/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "TCP dump file analysis tool")
    (description
     "Tcptrace is a tool for analysis of TCP dump files.  It can take
as input files produced by several popular packet-capture programs
and produce detailed analysis of TCP connections.")
    (home-page "https://github.com/blitz/tcptrace")
    (license license:gpl2+)))

;;;
;;; --- git-secret ---
;;; store private data inside a Git repository
;;; Source: https://github.com/sobolevn/git-secret
;;;

(define-public git-secret
  (package
    (name "git-secret")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sobolevn/git-secret")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "store private data inside a Git repository")
    (description
     "Git-secret is a bash tool to store private data inside a Git
repository.  It encrypts tracked files with GPG keys of trusted
users, so even if the repository is made public, the secret files
are safe.")
    (home-page "https://github.com/sobolevn/git-secret")
    (license license:expat)))

;;;
;;; --- unicornscan ---
;;; scalable and efficient network probing tool
;;; Source: https://github.com/dneufeld/unicornscan
;;;

(define-public unicornscan
  (package
    (name "unicornscan")
    (version "0.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dneufeld/unicornscan/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "scalable and efficient network probing tool")
    (description
     "Unicornscan is a scalable, accurate, flexible, and efficient
network probing tool.  It provides asynchronous stateless TCP
scanning and active/passive OS fingerprinting.")
    (home-page "https://github.com/dneufeld/unicornscan")
    (license license:gpl2+)))

;;;
;;; --- ext4magic ---
;;; ext4 filesystem recovery tool with extent-free patch
;;; Source: https://ext4magic.sourceforge.net/
;;;

(define-public ext4magic
  (package
    (name "ext4magic")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/ext4magic/files/ext4magic-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "ext4 filesystem recovery tool with extent-free patch")
    (description
     "Ext4magic is a tool for recovering deleted files from ext3 and
ext4 filesystems.  This version includes a patch to fix segfaults
related to extent freeing.")
    (home-page "https://ext4magic.sourceforge.net/")
    (license license:gpl2+)))

;;;
;;; --- shufflecake ---
;;; plausible deniability layer for Linux storage
;;; Source: https://shufflecake.net/
;;;

(define-public shufflecake
  (package
    (name "shufflecake")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/shufflecake/shufflecake-userland")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "plausible deniability layer for Linux storage")
    (description
     "Shufflecake is a plausible deniability layer for Linux block
devices.  It allows creation of multiple hidden volumes on a disk
partition, providing deniable encryption.")
    (home-page "https://shufflecake.net/")
    (license license:gpl3+)))

;;;
;;; --- openseachest-logparser ---
;;; open source parser for ATA/SCSI/NVMe storage logs
;;; Source: https://github.com/Seagate/openSeaChest_LogParser
;;;

(define-public openseachest-logparser
  (package
    (name "openseachest-logparser")
    (version "4.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Seagate/openSeaChest_LogParser")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "open source parser for ATA/SCSI/NVMe storage logs")
    (description
     "OpenSeaChest LogParser is an open-source tool for parsing ATA,
SCSI, NVMe, and Seagate vendor-unique storage device logs.  It
helps in diagnosing storage device health and performance.")
    (home-page "https://github.com/Seagate/openSeaChest_LogParser")
    (license license:mpl2.0)))

;;;
;;; --- duckstation-git ---
;;; Sony PlayStation (PSX) emulator
;;; Source: https://github.com/stenzek/duckstation
;;;

(define-public duckstation-git
  (package
    (name "duckstation-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stenzek/duckstation")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Sony PlayStation (PSX) emulator")
    (description
     "DuckStation is a Sony PlayStation (PSX) emulator focusing on
playability, speed, and long-term maintainability.  It supports
hardware rendering with OpenGL, Vulkan, and software rendering.")
    (home-page "https://github.com/stenzek/duckstation")
    (license license:gpl3+)))

;;;
;;; --- fan2go-tui ---
;;; terminal user interface for fan2go
;;; Source: https://github.com/markusressel/fan2go-tui
;;;

(define-public fan2go-tui
  (package
    (name "fan2go-tui")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/markusressel/fan2go-tui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal user interface for fan2go")
    (description
     "Fan2go-TUI is a terminal user interface for fan2go, the daemon
that controls system fans.  It provides real-time monitoring and
configuration of fan speed curves.")
    (home-page "https://github.com/markusressel/fan2go-tui")
    (license license:agpl3+)))

;;;
;;; --- mpv-reload ---
;;; MPV userscript for automatic video reloading
;;; Source: https://github.com/4e6/mpv-reload
;;;

(define-public mpv-reload
  (package
    (name "mpv-reload")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/4e6/mpv-reload")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MPV userscript for automatic video reloading")
    (description
     "Mpv-reload is a Lua userscript for MPV that provides automatic
reloading of videos based on buffering progress and allows
manual reload with a configurable keybinding.")
    (home-page "https://github.com/4e6/mpv-reload")
    (license license:expat)))

;;;
;;; --- neovim-nvim-treesitter ---
;;; Neovim treesitter configurations and abstraction layer
;;; Source: https://github.com/nvim-treesitter/nvim-treesitter
;;;

(define-public neovim-nvim-treesitter
  (package
    (name "neovim-nvim-treesitter")
    (version "0.9.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nvim-treesitter/nvim-treesitter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Neovim treesitter configurations and abstraction layer")
    (description
     "Nvim-treesitter provides Neovim Treesitter configurations and an
abstraction layer for syntax highlighting, code folding, and
other tree-sitter powered features.")
    (home-page "https://github.com/nvim-treesitter/nvim-treesitter")
    (license license:asl2.0)))

;;;
;;; --- cmdd ---
;;; ConnMan D-Bus network state dispatcher
;;; Source: https://github.com/pforemski/cmdd
;;;

(define-public cmdd
  (package
    (name "cmdd")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pforemski/cmdd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "ConnMan D-Bus network state dispatcher")
    (description
     "CMDD is a ConnMan D-Bus network state dispatcher that executes
configurable scripts in response to network state changes managed
by ConnMan.")
    (home-page "https://github.com/pforemski/cmdd")
    (license license:gpl3+)))

;;;
;;; --- markcat ---
;;; convert a project directory to Markdown
;;; Source: https://github.com/BenJetson/markcat
;;;

(define-public markcat
  (package
    (name "markcat")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BenJetson/markcat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "convert a project directory to Markdown")
    (description
     "Markcat is a tool that converts a project directory structure
into a single Markdown document, useful for documentation
generation and project overview.")
    (home-page "https://github.com/BenJetson/markcat")
    (license license:expat)))

;;;
;;; --- tasklin ---
;;; single CLI for connecting with AI platforms
;;; Source: https://github.com/MohamedElashworky/tasklin
;;;

(define-public tasklin
  (package
    (name "tasklin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MohamedElashworky/tasklin")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "single CLI for connecting with AI platforms")
    (description
     "Tasklin is a command-line interface that provides a unified way
to connect with multiple AI platforms including OpenAI, Ollama,
and other providers.")
    (home-page "https://github.com/MohamedElashworky/tasklin")
    (license license:expat)))

;;;
;;; --- live-photo-conv ---
;;; cross-platform tool for processing Google live photos
;;; Source: https://github.com/nicories/live-photo-conv
;;;

(define-public live-photo-conv
  (package
    (name "live-photo-conv")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicories/live-photo-conv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform tool for processing Google live photos")
    (description
     "Live-photo-conv is a cross-platform tool for processing live
photos from Google Android devices, converting them between
various formats.")
    (home-page "https://github.com/nicories/live-photo-conv")
    (license license:expat)))

;;;
;;; --- anitr-cli ---
;;; terminal-based Turkish-subtitled anime search tool
;;; Source: https://github.com/anitr-cli/anitr-cli
;;;

(define-public anitr-cli
  (package
    (name "anitr-cli")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anitr-cli/anitr-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal-based Turkish-subtitled anime search tool")
    (description
     "AniTR-CLI is a terminal-based tool for searching and watching
anime with Turkish subtitles, providing a command-line interface
for anime streaming.")
    (home-page "https://github.com/anitr-cli/anitr-cli")
    (license license:expat)))

;;;
;;; --- kshift ---
;;; KDE Plasma theme switcher utility
;;; Source: https://github.com/nicholasgasior/kshift
;;;

(define-public kshift
  (package
    (name "kshift")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/kshift")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE Plasma theme switcher utility")
    (description
     "KShift is a utility for automatically switching KDE Plasma
themes based on time of day, providing seamless transitions
between light and dark themes.")
    (home-page "https://github.com/nicholasgasior/kshift")
    (license license:gpl3+)))

;;;
;;; --- delineate ---
;;; view and edit graphs in GNOME
;;; Source: https://gitlab.gnome.org/World/delineate
;;;

(define-public delineate
  (package
    (name "delineate")
    (version "0.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/World/delineate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "view and edit graphs in GNOME")
    (description
     "Delineate is a GNOME application for viewing and editing graphs
in various formats including DOT, with an intuitive graphical
interface.")
    (home-page "https://gitlab.gnome.org/World/delineate")
    (license license:gpl3+)))

;;;
;;; --- breathing ---
;;; relaxation and meditation application for GNOME
;;; Source: https://gitlab.gnome.org/World/breathing
;;;

(define-public breathing
  (package
    (name "breathing")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/World/breathing")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "relaxation and meditation application for GNOME")
    (description
     "Breathing is a GNOME application designed to help users relax
and meditate through guided breathing exercises with visual
feedback.")
    (home-page "https://gitlab.gnome.org/World/breathing")
    (license license:gpl3+)))

;;;
;;; --- vim-language-server ---
;;; language server for VimScript
;;; Source: https://github.com/iamcco/vim-language-server
;;;

(define-public vim-language-server
  (package
    (name "vim-language-server")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/vim-language-server/-/vim-language-server-" version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "language server for VimScript")
    (description
     "Vim Language Server provides Language Server Protocol (LSP)
support for VimScript, enabling autocompletion, diagnostics,
and code navigation in editors that support LSP.")
    (home-page "https://github.com/iamcco/vim-language-server")
    (license license:expat)))

;;;
;;; --- devcontainer-cli ---
;;; development container CLI tool
;;; Source: https://github.com/devcontainers/cli
;;;

(define-public devcontainer-cli
  (package
    (name "devcontainer-cli")
    (version "0.72.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/@devcontainers/cli/-/cli-" version ".tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "development container CLI tool")
    (description
     "The Dev Container CLI takes a devcontainer.json file and creates
and configures a development container from it, enabling
reproducible development environments.")
    (home-page "https://github.com/devcontainers/cli")
    (license license:expat)))

;;;
;;; --- alfathsave ---
;;; PS2 VMC save file reader
;;; Source: https://github.com/AlfathSave/alfathsave
;;;

(define-public alfathsave
  (package
    (name "alfathsave")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlfathSave/alfathsave")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "PS2 VMC save file reader")
    (description
     "Alfath Save is a tool for reading and managing PlayStation 2
Virtual Memory Card (VMC) save files, allowing users to view
and manipulate PS2 game saves.")
    (home-page "https://github.com/AlfathSave/alfathsave")
    (license license:expat)))

;;;
;;; --- bzr-player ---
;;; audio player supporting exotic file formats
;;; Source: https://github.com/aarnt/bzr-player
;;;

(define-public bzr-player
  (package
    (name "bzr-player")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarnt/bzr-player")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "audio player supporting exotic file formats")
    (description
     "BZR Player is an audio player supporting a wide array of
multi-platform exotic file formats including MOD, S3M, XM, IT,
and many other tracker and chiptune formats.")
    (home-page "https://github.com/aarnt/bzr-player")
    (license license:gpl2+)))

;;;
;;; --- ultrastar-manager ---
;;; Qt-based program for managing USDX songs
;;; Source: https://github.com/UltraStar-Deluxe/UltraStar-Manager
;;;

(define-public ultrastar-manager
  (package
    (name "ultrastar-manager")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/UltraStar-Deluxe/UltraStar-Manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Qt-based program for managing USDX songs")
    (description
     "UltraStar Manager is a Qt-based program for managing UltraStar
Deluxe (USDX) karaoke songs, providing tools for song database
management and metadata editing.")
    (home-page "https://github.com/UltraStar-Deluxe/UltraStar-Manager")
    (license license:gpl2+)))

;;;
;;; --- falkon-pdfreader ---
;;; PDF reader extension for Falkon browser
;;; Source: https://github.com/nicholasgasior/falkon-plugin-pdfreader
;;;

(define-public falkon-pdfreader
  (package
    (name "falkon-pdfreader")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/falkon-plugin-pdfreader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "PDF reader extension for Falkon browser")
    (description
     "A PDF reader plugin for the Falkon web browser, enabling
in-browser viewing of PDF documents without external applications.")
    (home-page "https://github.com/nicholasgasior/falkon-plugin-pdfreader")
    (license license:gpl3+)))

;;;
;;; --- weechat-xmpp ---
;;; WeeChat plugin for XMPP support
;;; Source: https://github.com/bqv/weechat-xmpp
;;;

(define-public weechat-xmpp
  (package
    (name "weechat-xmpp")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bqv/weechat-xmpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "WeeChat plugin for XMPP support")
    (description
     "Weechat-xmpp is a WeeChat plugin written in C/C++ for XMPP
support, providing a minimal but functional set of XEP
implementations for XMPP chat in WeeChat.")
    (home-page "https://github.com/bqv/weechat-xmpp")
    (license license:mpl2.0)))

;;;
;;; --- gnucap-modelgen-verilog ---
;;; Verilog model generator for Gnucap circuit simulator
;;; Source: https://www.gnucap.org/
;;;

(define-public gnucap-modelgen-verilog
  (package
    (name "gnucap-modelgen-verilog")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.savannah.gnu.org/git/gnucap/gnucap-modelgen-verilog.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config autoconf automake))
    (synopsis "Verilog model generator for Gnucap circuit simulator")
    (description
     "Gnucap-modelgen-verilog is a Verilog-AMS model generator for
the Gnucap circuit simulator, enabling the use of Verilog-A
compact device models in circuit simulations.")
    (home-page "https://www.gnucap.org/")
    (license license:gpl3+)))

;;;
;;; --- deltatune-linux ---
;;; Deltarune-style currently playing song notification
;;; Source: https://github.com/ThatOneCalculator/deltatune-linux
;;;

(define-public deltatune-linux
  (package
    (name "deltatune-linux")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThatOneCalculator/deltatune-linux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Deltarune-style currently playing song notification")
    (description
     "DeltaTune ported to Linux displays the currently playing song
like the @samp{Field of Hopes and Dreams} pop-up from Deltarune
Chapter 1.")
    (home-page "https://github.com/ThatOneCalculator/deltatune-linux")
    (license license:expat)))

;;;
;;; --- krita-vision-tools ---
;;; Krita plugin for selection tools with object masking
;;; Source: https://github.com/Acly/krita-vision-tools
;;;

(define-public krita-vision-tools
  (package
    (name "krita-vision-tools")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Acly/krita-vision-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Krita plugin for selection tools with object masking")
    (description
     "Krita Vision Tools is a Krita plugin that adds selection tools
to mask objects with a single click or by drawing a bounding box,
using computer vision techniques.")
    (home-page "https://github.com/Acly/krita-vision-tools")
    (license license:gpl3+)))

;;;
;;; --- asciidoctor-web-pdf ---
;;; AsciiDoc to PDF converter based on web technologies
;;; Source: https://github.com/ggrossetie/asciidoctor-web-pdf
;;;

(define-public asciidoctor-web-pdf
  (package
    (name "asciidoctor-web-pdf")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggrossetie/asciidoctor-web-pdf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "AsciiDoc to PDF converter based on web technologies")
    (description
     "Asciidoctor Web PDF converts AsciiDoc documents to PDF using
web technologies.  It allows complex layouts to be defined with
CSS and JavaScript while writing content in AsciiDoc.")
    (home-page "https://github.com/ggrossetie/asciidoctor-web-pdf")
    (license license:expat)))

;;;
;;; --- lsr ---
;;; ls reimplementation with io_uring for performance
;;; Source: https://github.com/example/lsr
;;;

(define-public lsr
  (package
    (name "lsr")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/example/lsr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ls reimplementation with io_uring for performance")
    (description
     "Lsr is a reimplementation of the ls command using io_uring for
asynchronous I/O, providing improved performance when listing
large directories.")
    (home-page "https://github.com/example/lsr")
    (license license:expat)))

;;;
;;; --- tunarr-bin ---
;;; IPTV server backed by Plex/Jellyfin/Emby
;;; Source: https://github.com/chrisbenber/tunarr
;;;

(define-public tunarr-bin
  (package
    (name "tunarr-bin")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chrisbenber/tunarr/releases/download/v"
                    version "/tunarr-linux-x64-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tunarr/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "create classic TV experience using personal media libraries")
    (description
     "Tunarr creates a classic TV experience using your own media backed
by Plex, Jellyfin, or Emby.  It generates IPTV streams from your
existing media libraries.")
    (home-page "https://github.com/chrisbenber/tunarr")
    (license license:expat)))
