;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416h
;;; Resolves 100 TODO packages from queue (81 recipes, 19 BLOCKED).
;;;
;;; Recipes (81):
;;;   1. packemon-git (go, v1.8.3, BSD-2-Clause)
;;;   2. obs-ptz-controls (cmake, v0.18.2, GPL-2.0-or-later)
;;;   3. cxt-bin (copy/binary, v0.1.6, MIT)
;;;   4. pythonqt (cmake, v3.6.0, LGPL-2.1-only)
;;;   5. luajit-openresty (gnu, v2.1.20260311, MIT)
;;;   6. libtorrent-rasterbar-1_2-git (cmake, v1.2.20, BSD-3-Clause)
;;;   7. cloud-hypervisor (cargo, v51.1, Apache-2.0)
;;;   8. libtorrent-rasterbar-2_0-git (cmake, v2.0.11, BSD-3-Clause)
;;;   9. taskvanguard (go, v0.2.8, AGPL-3.0)
;;;   10. mubeng-bin (copy/binary, v0.23.0, Apache-2.0)
;;;   11. clip-editor-bin (copy/binary, v0.2.7, MIT)
;;;   12. arx (pyproject, v1.0.9, MIT)
;;;   13. openvpn-reconnect (copy, v1, ISC)
;;;   14. rdm (meson, v1.4.0, GPL-3.0-only)
;;;   15. hyprdock (cargo, v0.3.7, unknown)
;;;   16. resume-pycli (pyproject, v1.3.3, GPL-3.0)
;;;   17. pam-any-git (cargo, vr12.e776877, unknown)
;;;   18. serv-bin (copy/binary, v1.0.2, MIT)
;;;   19. openbubbles-bin (copy/binary, v1.15.0+161, OBSD)
;;;   20. mite (gnu, v1.4.3, MIT)
;;;   21. weather-cli (go, v1.2.2, GPL)
;;;   22. fastgron-bin (copy/binary, v0.7.7, MIT)
;;;   23. attract-git (gnu, v2.7.0.r31, GPL-3.0)
;;;   24. raspotify-git (copy, v0.47.0, MIT)
;;;   25. obs-studio-themed-git (copy, vr7.2a5db44, GPL-2.0-or-later)
;;;   26. nalla-iptv-bin (copy/binary, v2.0.1, custom)
;;;   27. nuclei-templates (copy, v10.4.2, MIT)
;;;   28. minesweep-rs (cargo, v6.0.54, Apache-2.0)
;;;   29. slibtool-git (gnu, v0.5.34, MIT)
;;;   30. slibtool (gnu, v0.7.4, MIT)
;;;   31. gearboy (cmake, v3.8.2, GPL-3.0)
;;;   32. sherlock-launcher-unstable-git (cargo, v0.1.14, GPL-3.0)
;;;   33. blockstream-app-appimage (copy/binary, v3.2.0, GPL-3.0)
;;;   34. klogg-bin (copy/binary, v22.06, GPL-3.0)
;;;   35. louvre-git (meson, v2.9.0.1, MIT)
;;;   36. louvre-devel-git (meson, v2.9.0.1, MIT)
;;;   37. weka (copy, v3.8.6, GPL)
;;;   38. libeventemitter-nightly (gnu, vnightly_2026_04_16_04_09_55_PM, BSD-3-Clause)
;;;   39. rgxg (gnu, v0.1.2, zlib/libpng)
;;;   40. deadbeef-plugin-lyricbar-git (gnu, vr195.gf6b939b, MIT)
;;;   41. rancher-k3d (go, v5.8.3, MIT)
;;;   42. goose-bin (copy/binary, v3.27.0, MIT)
;;;   43. mediaelch-git (cmake, v2.12.0, LGPL-3.0-or-later)
;;;   44. saber-bin (copy/binary, v1.33.2, GPL-3.0-only)
;;;   45. mkeditor-bin (copy/binary, v3.6.0, MIT)
;;;   46. httpc (gnu, v1.3.0, MIT)
;;;   47. payme-git (go, v1.2.4, MIT)
;;;   48. easytier-gui-bin (copy/binary, v2.4.5, LGPL-3.0-only)
;;;   49. tmux-sessionizer (cargo, v0.5.0, MIT)
;;;   50. deadbeef-plugin-rating (gnu, v1.2, GPL-2.0)
;;;   51. libminiaudiohelpers (gnu, v5.0, MIT)
;;;   52. brename (go, v2.14.0, MIT)
;;;   53. gmusicbrowser (copy, v1.1.16, GPL-3.0)
;;;   54. glsof (copy, v2.4.1, GPL-3.0)
;;;   55. dotgit (pyproject, v2.2.9, unknown)
;;;   56. nyarchassistant-git (meson, v1.2.0, GPL)
;;;   57. gost-v3-bin (copy/binary, v3.2.7.20251122, MIT)
;;;   58. garage-webui-bin (copy/binary, v1.0.9, MIT)
;;;   59. cactus-client (cmake, v1.14, unknown)
;;;   60. transistor-git (cmake, vr10.a1eaf2d3, GPL-3.0-or-later)
;;;   61. nmcurse-rs-git (cargo, vlatest, MIT)
;;;   62. ugrd-git (pyproject, v2.2.0, GPL-2.0-only)
;;;   63. vlc-plugin-pipewire (meson, v3.0, GPL-3.0)
;;;   64. ugrd (pyproject, v2.2.0, GPL-2.0-only)
;;;   65. codellm (copy/binary, v1.101.23707, custom)
;;;   66. diskmonitor (cmake, v0.3.4, GPL-2.0)
;;;   67. ttf-sitelen-seli-kiwen-juniko (copy, v2.1, OFL)
;;;   68. ttf-sitelen-seli-kiwen-asuki (copy, v2.1, OFL)
;;;   69. spreet (cargo, v0.13.1, MIT)
;;;   70. drg_mod_integration-notag-bin (copy/binary, v0.2.14, MIT)
;;;   71. maplemononl-woff2 (copy, v7.9, OFL-1.1)
;;;   72. maplemononl-variable (copy, v7.9, OFL-1.1)
;;;   73. maplemononl-ttf-autohint (copy, v7.9, OFL-1.1)
;;;   74. maplemononl-ttf (copy, v7.9, OFL-1.1)
;;;   75. maplemononl-otf (copy, v7.9, OFL-1.1)
;;;   76. maplemononl-nf-unhinted (copy, v7.9, OFL-1.1)
;;;   77. maplemononl-nf-cn-unhinted (copy, v7.9, OFL-1.1)
;;;   78. maplemononl-nf-cn (copy, v7.9, OFL-1.1)
;;;   79. maplemononl-nf (copy, v7.9, OFL-1.1)
;;;   80. maplemononl-cn-unhinted (copy, v7.9, OFL-1.1)
;;;   81. maplemononl-cn (copy, v7.9, OFL-1.1)
;;;
;;; 81 recipes written. 19 BLOCKED (see todo_general_packages.org).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416h)
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
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages version-control)
  #:export (
            packemon-git
            obs-ptz-controls
            cxt-bin
            pythonqt
            luajit-openresty
            libtorrent-rasterbar-1-2-git
            cloud-hypervisor
            libtorrent-rasterbar-2-0-git
            taskvanguard
            mubeng-bin
            clip-editor-bin
            arx
            openvpn-reconnect
            rdm
            hyprdock
            resume-pycli
            pam-any-git
            serv-bin
            openbubbles-bin
            mite
            weather-cli
            fastgron-bin
            attract-git
            raspotify-git
            obs-studio-themed-git
            nalla-iptv-bin
            nuclei-templates
            minesweep-rs
            slibtool-git
            slibtool
            gearboy
            sherlock-launcher-unstable-git
            blockstream-app-appimage
            klogg-bin
            louvre-git
            louvre-devel-git
            weka
            libeventemitter-nightly
            rgxg
            deadbeef-plugin-lyricbar-git
            rancher-k3d
            goose-bin
            mediaelch-git
            saber-bin
            mkeditor-bin
            httpc
            payme-git
            easytier-gui-bin
            tmux-sessionizer
            deadbeef-plugin-rating
            libminiaudiohelpers
            brename
            gmusicbrowser
            glsof
            dotgit
            nyarchassistant-git
            gost-v3-bin
            garage-webui-bin
            cactus-client
            transistor-git
            nmcurse-rs-git
            ugrd-git
            vlc-plugin-pipewire
            ugrd
            codellm
            diskmonitor
            ttf-sitelen-seli-kiwen-juniko
            ttf-sitelen-seli-kiwen-asuki
            spreet
            drg-mod-integration-notag-bin
            maplemononl-woff2
            maplemononl-variable
            maplemononl-ttf-autohint
            maplemononl-ttf
            maplemononl-otf
            maplemononl-nf-unhinted
            maplemononl-nf-cn-unhinted
            maplemononl-nf-cn
            maplemononl-nf
            maplemononl-cn-unhinted
            maplemononl-cn
            ))

;;; Nonfree license placeholder (for non-FOSS binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; -------------------------------------------------------------------
;;; 1. packemon-git
;;; -------------------------------------------------------------------
(define-public packemon-git
  (package
    (name "packemon-git")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddddddO/packemon/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tUI tool for sending and monitoring network packets")
    (description "TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces (development version).  Supports ARP, Ethernet, ICMP, TCP, TLS, UDP.")
    (home-page "https://github.com/ddddddO/packemon")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 2. obs-ptz-controls
;;; -------------------------------------------------------------------
(define-public obs-ptz-controls
  (package
    (name "obs-ptz-controls")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/glikely/obs-ptz/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OBS Studio plugin for PTZ camera control")
    (description "Plugin for OBS Studio to add a PTZ (Pan-Tilt-Zoom) Camera control dock.  Requires OBS >= 31 and Qt6.")
    (home-page "https://obsproject.com/forum/resources/ptz-controls.1284/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 3. cxt-bin
;;; -------------------------------------------------------------------
(define-public cxt-bin
  (package
    (name "cxt-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vaibhav-mattoo/cxt/releases/download/v" version "/cxt-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cxt" "bin/cxt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI tool to aggregate file/directory contents to clipboard for AI context")
    (description "A command-line tool that aggregates file and directory contents into your clipboard, perfect for providing project context to AI chatbots.  Pre-compiled binary.")
    (home-page "https://github.com/vaibhav-mattoo/cxt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. pythonqt
;;; -------------------------------------------------------------------
(define-public pythonqt
  (package
    (name "pythonqt")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MeVisLab/pythonqt/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dynamic Python binding for Qt applications")
    (description "A dynamic Python binding for Qt5 applications.  Provides Qt5 multimedia, SVG, WebKit, declarative, XML patterns, and WebEngine bindings for Python.")
    (home-page "https://github.com/MeVisLab/pythonqt")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 5. luajit-openresty
;;; -------------------------------------------------------------------
(define-public luajit-openresty
  (package
    (name "luajit-openresty")
    (version "2.1.20260311")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openresty/luajit2/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "just-in-time compiler for Lua, OpenResty fork")
    (description "A fork of LuaJIT maintained by OpenResty with additional patches and fixes.  Conflicts with stock LuaJIT package.")
    (home-page "https://github.com/openresty/luajit2")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. libtorrent-rasterbar-1_2-git
;;; -------------------------------------------------------------------
(define-public libtorrent-rasterbar-1-2-git
  (package
    (name "libtorrent-rasterbar-1_2-git")
    (version "1.2.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arvidn/libtorrent#branch=RC_1_2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "feature-complete C++ BitTorrent library (RC_1_2 branch)")
    (description "A feature complete C++ bittorrent library tracking the RC_1_2 git branch.  Conflicts with the main libtorrent-rasterbar package.")
    (home-page "https://www.libtorrent.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 7. cloud-hypervisor
;;; -------------------------------------------------------------------
(define-public cloud-hypervisor
  (package
    (name "cloud-hypervisor")
    (version "51.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cloud-hypervisor/cloud-hypervisor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "virtual Machine Monitor for modern cloud workloads")
    (description "A Virtual Machine Monitor (VMM) for modern Cloud workloads, written in Rust.  Optionally supports virtiofsd for filesystem sharing.")
    (home-page "https://github.com/cloud-hypervisor/cloud-hypervisor")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 8. libtorrent-rasterbar-2_0-git
;;; -------------------------------------------------------------------
(define-public libtorrent-rasterbar-2-0-git
  (package
    (name "libtorrent-rasterbar-2_0-git")
    (version "2.0.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arvidn/libtorrent#branch=RC_2_0")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "feature-complete C++ BitTorrent library (RC_2_0 branch)")
    (description "A feature complete C++ bittorrent library tracking the RC_2_0 git branch.  Conflicts with the main libtorrent-rasterbar package.")
    (home-page "https://www.libtorrent.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 9. taskvanguard
;;; -------------------------------------------------------------------
(define-public taskvanguard
  (package
    (name "taskvanguard")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/taskvanguard/taskvanguard/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM/AI wrapper for TaskWarrior")
    (description "TaskVanguard is an LLM/AI wrapper for TaskWarrior, supporting multiple API providers including OpenAI and Deepseek for AI-assisted task management.")
    (home-page "https://github.com/taskvanguard/taskvanguard")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 10. mubeng-bin
;;; -------------------------------------------------------------------
(define-public mubeng-bin
  (package
    (name "mubeng-bin")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mubeng/mubeng/releases/download/v" version "/mubeng_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mubeng" "bin/mubeng"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast proxy checker and IP rotator")
    (description "An incredibly fast proxy checker and IP rotator.  Pre-compiled binary.  Conflicts with source-built mubeng package.")
    (home-page "https://github.com/mubeng/mubeng")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. clip-editor-bin
;;; -------------------------------------------------------------------
(define-public clip-editor-bin
  (package
    (name "clip-editor-bin")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sn0w12/clip-editor/releases/download/v" version "/clip-editor-linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clip-editor" "bin/clip-editor"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "video clip editor and manager for game clips")
    (description "Edit, manage, and organize your video clips.  Electron-based application with Steam and libvips integration, prebuilt using system electron.  Supports game clipping workflows.")
    (home-page "https://github.com/sn0w12/clip-editor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. arx
;;; -------------------------------------------------------------------
(define-public arx
  (package
    (name "arx")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PhilCauss/arx/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "secure AUR wrapper with LLM-based security analysis")
    (description "A secure Python wrapper around yay (AUR helper) with LLM-based security analysis of packages before installation.  Requires OpenAI API.")
    (home-page "https://github.com/PhilCauss/arx")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. openvpn-reconnect
;;; -------------------------------------------------------------------
(define-public openvpn-reconnect
  (package
    (name "openvpn-reconnect")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/crasm/openvpn-reconnect/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openvpn-reconnect/"))))
    (synopsis "systemd hook for reconnecting OpenVPN after suspend")
    (description "A systemd hook that automatically reconnects OpenVPN after the system resumes from suspend/sleep.")
    (home-page "https://github.com/crasm/openvpn-reconnect")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 14. rdm
;;; -------------------------------------------------------------------
(define-public rdm
  (package
    (name "rdm")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rikaisan/rdm/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Lua-powered dotfile manager")
    (description "A simple yet powerful dotfile manager powered by Lua scripting.  Supports git integration via libgit2 for tracking dotfile changes.")
    (home-page "https://github.com/Rikaisan/rdm")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 15. hyprdock
;;; -------------------------------------------------------------------
(define-public hyprdock
  (package
    (name "hyprdock")
    (version "0.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DashieTM/hyprdock/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "automatic docking tool for Hyprland")
    (description "An automatic docking tool for the Hyprland Wayland compositor, built with Rust.  Uses GTK3 and gtk-layer-shell for rendering.")
    (home-page "https://github.com/DashieTM/hyprdock")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 16. resume-pycli
;;; -------------------------------------------------------------------
(define-public resume-pycli
  (package
    (name "resume-pycli")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://sr.ht/~nka/resume-pycli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "cLI tool for creating and managing resumes")
    (description "A CLI tool to easily set up and manage a new resume using JSON Resume schema.  Supports PDF generation via pdfkit and HTML templating via Jinja.")
    (home-page "https://sr.ht/~nka/resume-pycli")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. pam-any-git
;;; -------------------------------------------------------------------
(define-public pam-any-git
  (package
    (name "pam-any-git")
    (version "r12.e776877")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ChocolateLoverRaj/pam-any")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "PAM module running multiple modules in parallel")
    (description "A PAM module that runs multiple other PAM modules in parallel, succeeding as long as one of them succeeds.  Development git version built with Rust/Cargo.")
    (home-page "https://github.com/ChocolateLoverRaj/pam-any")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 18. serv-bin
;;; -------------------------------------------------------------------
(define-public serv-bin
  (package
    (name "serv-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xonixx/serv/releases/download/v" version "/serv-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("serv" "bin/serv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple file/folder sharing over local network")
    (description "Share files and folders easily over the local network.  Pre-compiled binary.  Conflicts with source-built serv package.")
    (home-page "https://github.com/xonixx/serv")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. openbubbles-bin
;;; -------------------------------------------------------------------
(define-public openbubbles-bin
  (package
    (name "openbubbles-bin")
    (version "1.15.0+161")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenBubbles/openbubbles-app/releases/download/v" version "/openbubbles-linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openbubbles" "bin/openbubbles"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source iMessage client for Linux")
    (description "Open-source iMessage client for Linux built with Flutter/Dart.  Precompiled binary.  Supports notifications, media playback via mpv, and secure credential storage.")
    (home-page "https://github.com/OpenBubbles/openbubbles-app")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 20. mite
;;; -------------------------------------------------------------------
(define-public mite
  (package
    (name "mite")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hanion/mite/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "static site generator with C templates")
    (description "A minimal static site generator using C-based templates for generating HTML sites from source files.")
    (home-page "https://github.com/hanion/mite")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. weather-cli
;;; -------------------------------------------------------------------
(define-public weather-cli
  (package
    (name "weather-cli")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rayrsn/Weather-Cli/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal weather information app written in Go")
    (description "An app for retrieving weather information through the terminal, written in Go.  Provides current conditions and forecasts via CLI.")
    (home-page "https://github.com/Rayrsn/Weather-Cli")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. fastgron-bin
;;; -------------------------------------------------------------------
(define-public fastgron-bin
  (package
    (name "fastgron-bin")
    (version "0.7.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/adamritter/fastgron/releases/download/v" version "/fastgron-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fastgron" "bin/fastgron"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance JSON to GRON converter")
    (description "High-performance JSON to GRON (greppable, flattened JSON) converter.  Pre-compiled binary using curl for HTTP sources.")
    (home-page "https://github.com/adamritter/fastgron")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. attract-git
;;; -------------------------------------------------------------------
(define-public attract-git
  (package
    (name "attract-git")
    (version "2.7.0.r31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mickelson/attract")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "graphical front-end for command-line emulators")
    (description "A graphical front-end for command line emulators that hides the underlying operating system, intended to be controlled with a joystick or gamepad.  Uses SFML2 for rendering.")
    (home-page "http://www.attractmode.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. raspotify-git
;;; -------------------------------------------------------------------
(define-public raspotify-git
  (package
    (name "raspotify-git")
    (version "0.47.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dtcooper/raspotify")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/raspotify-git/"))))
    (synopsis "spotify Connect client that just works")
    (description "A Spotify Connect client built on librespot that just works.  Originally designed for Raspberry Pi but works on any Linux system.")
    (home-page "https://github.com/dtcooper/raspotify")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. obs-studio-themed-git
;;; -------------------------------------------------------------------
(define-public obs-studio-themed-git
  (package
    (name "obs-studio-themed-git")
    (version "r7.2a5db44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/MorsMortium/obs-studio-themed")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/obs-studio-themed-git/"))))
    (synopsis "themed look for OBS Studio")
    (description "A themed look for OBS Studio providing custom visual styling.  Installs as an OBS Studio add-on.")
    (home-page "https://codeberg.org/MorsMortium/obs-studio-themed")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 26. nalla-iptv-bin
;;; -------------------------------------------------------------------
(define-public nalla-iptv-bin
  (package
    (name "nalla-iptv-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Anmol1184/NallaIPTV/releases/download/v" version "/NallaIPTV-linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nalla-iptv" "bin/nalla-iptv"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "IPTV player for M3U playlists with DRM support")
    (description "An Electron-based IPTV Player for M3U playlists with DRM support.  Manages and streams M3U/M3U8 playlists.")
    (home-page "https://github.com/Anmol1184/NallaIPTV")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 27. nuclei-templates
;;; -------------------------------------------------------------------
(define-public nuclei-templates
  (package
    (name "nuclei-templates")
    (version "10.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/nuclei-templates/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nuclei-templates/"))))
    (synopsis "templates for the nuclei security scanner")
    (description "Templates for the nuclei engine to find security vulnerabilities.  A collection of YAML templates for automated security testing.")
    (home-page "https://github.com/projectdiscovery/nuclei-templates")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. minesweep-rs
;;; -------------------------------------------------------------------
(define-public minesweep-rs
  (package
    (name "minesweep-rs")
    (version "6.0.54")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cpcloud/minesweep-rs/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "terminal minesweeper game written in Rust")
    (description "Sweep some mines for fun in this terminal-based minesweeper game written in Rust.  Uses ncurses for display.")
    (home-page "https://github.com/cpcloud/minesweep-rs")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 29. slibtool-git
;;; -------------------------------------------------------------------
(define-public slibtool-git
  (package
    (name "slibtool-git")
    (version "0.5.34")
    (source (origin
              (method url-fetch)
              (uri "http://git.midipix.org/cgit.cgi/slibtool")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "skinny libtool implementation in C (git version)")
    (description "A lightweight, fast libtool implementation written in C.  This is the development git version.  Conflicts with the stable slibtool package.")
    (home-page "http://git.midipix.org/cgit.cgi/slibtool")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. slibtool
;;; -------------------------------------------------------------------
(define-public slibtool
  (package
    (name "slibtool")
    (version "0.7.4")
    (source (origin
              (method url-fetch)
              (uri "http://git.midipix.org/cgit.cgi/slibtool")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "skinny libtool implementation in C")
    (description "A lightweight, fast libtool implementation written in C, designed as a drop-in replacement for GNU libtool.")
    (home-page "http://git.midipix.org/cgit.cgi/slibtool")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. gearboy
;;; -------------------------------------------------------------------
(define-public gearboy
  (package
    (name "gearboy")
    (version "3.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/drhelius/Gearboy/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Game Boy / Game Boy Color emulator")
    (description "A Game Boy and Game Boy Color emulator using SDL3 for graphics and input.  Accurate cycle-based emulation.")
    (home-page "https://github.com/drhelius/Gearboy")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 32. sherlock-launcher-unstable-git
;;; -------------------------------------------------------------------
(define-public sherlock-launcher-unstable-git
  (package
    (name "sherlock-launcher-unstable-git")
    (version "0.1.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/skxxtz/sherlock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "application launcher for Wayland")
    (description "A fast application launcher for Wayland built with Rust.  Uses GTK4 with layer shell, dbus, openssl, and sqlite.  Unstable git version.")
    (home-page "https://github.com/skxxtz/sherlock")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 33. blockstream-app-appimage
;;; -------------------------------------------------------------------
(define-public blockstream-app-appimage
  (package
    (name "blockstream-app-appimage")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Blockstream/green_qt/releases/download/release_" version "/Blockstream-App-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/blockstream-app-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "non-custodial Bitcoin wallet compatible with Blockstream Jade")
    (description "Blockstream App is a non-custodial Bitcoin wallet, compatible with Blockstream Jade hardware wallet.  Distributed as AppImage.")
    (home-page "https://blockstream.com/app/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 34. klogg-bin
;;; -------------------------------------------------------------------
(define-public klogg-bin
  (package
    (name "klogg-bin")
    (version "22.06")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/variar/klogg/releases/download/v" version "/klogg-" version "-Linux.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("klogg" "bin/klogg"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast multi-platform GUI log file browser")
    (description "A multi-platform GUI application for browsing and searching through long and complex log files, combining features of grep, less, and tail.  Pre-compiled binary.")
    (home-page "https://klogg.filimonov.dev")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 35. louvre-git
;;; -------------------------------------------------------------------
(define-public louvre-git
  (package
    (name "louvre-git")
    (version "2.9.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CuarzoSoftware/Louvre")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "high-performance C++ library for building Wayland compositors")
    (description "A high-performance C++ library designed for building Wayland compositors with a strong emphasis on ease of development.  Uses libsrm-git for rendering.")
    (home-page "https://github.com/CuarzoSoftware/Louvre")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. louvre-devel-git
;;; -------------------------------------------------------------------
(define-public louvre-devel-git
  (package
    (name "louvre-devel-git")
    (version "2.9.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CuarzoSoftware/Louvre")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "high-performance C++ library for building Wayland compositors (devel branch)")
    (description "Development branch of Louvre - a high-performance C++ library for building Wayland compositors.  Uses libsrm-devel-git for cutting-edge rendering features.")
    (home-page "https://github.com/CuarzoSoftware/Louvre")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. weka
;;; -------------------------------------------------------------------
(define-public weka
  (package
    (name "weka")
    (version "3.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/weka/files/weka-3-8/" version "/weka-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/weka/"))))
    (synopsis "machine learning algorithms for data mining")
    (description "A collection of machine learning algorithms for data mining tasks, implemented in Java.  Requires Java 11 runtime.")
    (home-page "https://www.cs.waikato.ac.nz/ml/weka/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 38. libeventemitter-nightly
;;; -------------------------------------------------------------------
(define-public libeventemitter-nightly
  (package
    (name "libeventemitter-nightly")
    (version "nightly_2026_04_16_04_09_55_PM")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LesBoys43/libeventemitter/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight NTS C event emitter library")
    (description "A Lightweight, NTS (Non-Thread-Safe), C Event Emitter Library using GLib2.  Nightly build.")
    (home-page "https://github.com/LesBoys43/libeventemitter")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 39. rgxg
;;; -------------------------------------------------------------------
(define-public rgxg
  (package
    (name "rgxg")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rgxg/rgxg/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "regular expression generator")
    (description "ReGular eXpression Generator - a command-line tool and C library for generating regular expressions.  Uses autoconf/automake build system.")
    (home-page "https://rgxg.github.io")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 40. deadbeef-plugin-lyricbar-git
;;; -------------------------------------------------------------------
(define-public deadbeef-plugin-lyricbar-git
  (package
    (name "deadbeef-plugin-lyricbar-git")
    (version "r195.gf6b939b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AsVHEn/deadbeef-lyricbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "DeaDBeeF lyric bar plugin")
    (description "A lyric bar plugin for the DeaDBeeF music player.  Fetches lyrics via curl and displays them in a GTKmm3 sidebar panel.")
    (home-page "https://github.com/AsVHEn/deadbeef-lyricbar")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. rancher-k3d
;;; -------------------------------------------------------------------
(define-public rancher-k3d
  (package
    (name "rancher-k3d")
    (version "5.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/k3d-io/k3d/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "run k3s in Docker for local Kubernetes clusters")
    (description "Little helper to run CNCF's k3s in Docker.  Simplifies creating and managing local Kubernetes clusters using k3d.")
    (home-page "https://github.com/k3d-io/k3d")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 42. goose-bin
;;; -------------------------------------------------------------------
(define-public goose-bin
  (package
    (name "goose-bin")
    (version "3.27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pressly/goose/releases/download/v" version "/goose_linux_x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("goose" "bin/goose"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "database migration tool with SQL and Go function support")
    (description "A database migration tool that supports SQL migrations and Go functions.  Pre-compiled binary.")
    (home-page "https://github.com/pressly/goose")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. mediaelch-git
;;; -------------------------------------------------------------------
(define-public mediaelch-git
  (package
    (name "mediaelch-git")
    (version "2.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Komet/MediaElch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "media manager for Kodi")
    (description "MediaElch is a MediaManager for Kodi.  Manages movies, TV shows, music, and concerts with metadata scraping.  Built with Qt6.")
    (home-page "https://github.com/Komet/MediaElch")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 44. saber-bin
;;; -------------------------------------------------------------------
(define-public saber-bin
  (package
    (name "saber-bin")
    (version "1.33.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/saber-notes/saber/releases/download/v" version "/Saber-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("saber" "bin/saber"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform open-source handwriting app")
    (description "The cross-platform open-source app built for handwriting.  Flutter-based notes application.  Prebuilt binary.")
    (home-page "https://saber.adil.hanney.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 45. mkeditor-bin
;;; -------------------------------------------------------------------
(define-public mkeditor-bin
  (package
    (name "mkeditor-bin")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/versyxdigital/mkeditor/releases/download/v" version "/mkeditor-linux.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mkeditor" "bin/mkeditor"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple Markdown editor using Electron")
    (description "The simple markdown editor built with Electron using Monaco editor and markdown-it.  Prebuilt version using system-wide Electron.")
    (home-page "https://versyxdigital.github.io/mkeditor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. httpc
;;; -------------------------------------------------------------------
(define-public httpc
  (package
    (name "httpc")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Evilur/httpc/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "zero-config HTTP 1.1 server")
    (description "A simple zero-configuration HTTP 1.1 server to use instead of Python's http.server.  Written in C.")
    (home-page "https://github.com/Evilur/httpc")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. payme-git
;;; -------------------------------------------------------------------
(define-public payme-git
  (package
    (name "payme-git")
    (version "1.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jovandeginste/payme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "QR code generator for SEPA payments")
    (description "QR code generator producing ASCII and PNG output for SEPA payments.  Supports BIC, IBAN, and remittance information.")
    (home-page "https://github.com/jovandeginste/payme")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. easytier-gui-bin
;;; -------------------------------------------------------------------
(define-public easytier-gui-bin
  (package
    (name "easytier-gui-bin")
    (version "2.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/EasyTier/EasyTier/releases/download/v" version "/easytier-gui-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("easytier-gui" "bin/easytier-gui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GUI for EasyTier decentralized mesh VPN")
    (description "A simple, decentralized mesh VPN with WireGuard support.  This is the GUI frontend (Tauri-based) binary package.")
    (home-page "https://github.com/EasyTier/EasyTier")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 49. tmux-sessionizer
;;; -------------------------------------------------------------------
(define-public tmux-sessionizer
  (package
    (name "tmux-sessionizer")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jrmoulton/tmux-sessionizer/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "tool for opening git repositories as tmux sessions")
    (description "A tool for opening git repositories as tmux sessions, enabling fast project switching in the terminal.")
    (home-page "https://github.com/jrmoulton/tmux-sessionizer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. deadbeef-plugin-rating
;;; -------------------------------------------------------------------
(define-public deadbeef-plugin-rating
  (package
    (name "deadbeef-plugin-rating")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/splushii/deadbeef-rating/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "DeaDBeeF plugin for rating songs via metadata tag")
    (description "A DeaDBeeF music player plugin for rating songs by editing the metadata tag.  Allows setting star ratings stored in file tags.")
    (home-page "https://github.com/splushii/deadbeef-rating")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 51. libminiaudiohelpers
;;; -------------------------------------------------------------------
(define-public libminiaudiohelpers
  (package
    (name "libminiaudiohelpers")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sol-vin/raylib-cr/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "mini audio helper library for Raylib-cr")
    (description "Mini audio helper library to facilitate audio in Raylib-cr (Crystal language Raylib bindings).  Provides libminiaudiohelpers shared library.")
    (home-page "https://github.com/sol-vin/raylib-cr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. brename
;;; -------------------------------------------------------------------
(define-public brename
  (package
    (name "brename")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shenwei356/brename/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "cross-platform CLI tool for batch renaming via regex")
    (description "A practical cross-platform command-line tool for safely batch renaming files and directories using regular expressions.")
    (home-page "https://github.com/shenwei356/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. gmusicbrowser
;;; -------------------------------------------------------------------
(define-public gmusicbrowser
  (package
    (name "gmusicbrowser")
    (version "1.1.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gmusicbrowser.org/download/gmusicbrowser-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gmusicbrowser/"))))
    (synopsis "open-source jukebox for large music collections")
    (description "Open-source jukebox for large collections of mp3/ogg/flac files, written in Perl.  Supports various audio backends including ALSA, GStreamer, and mpv.")
    (home-page "https://gmusicbrowser.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 54. glsof
;;; -------------------------------------------------------------------
(define-public glsof
  (package
    (name "glsof")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/glsof/files/glsof-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/glsof/"))))
    (synopsis "GUI utilities for the lsof command")
    (description "Two separate GUI utilities (Queries and Filemonitor) providing a graphical interface to the lsof command line utility.  Written in Java.")
    (home-page "http://glsof.sourceforge.net/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 55. dotgit
;;; -------------------------------------------------------------------
(define-public dotgit
  (package
    (name "dotgit")
    (version "2.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kobus-v-schoor/dotgit/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "comprehensive dotfile management solution")
    (description "A comprehensive solution to managing your dotfiles using git.  Python-based tool with optional GPG encryption support.")
    (home-page "https://github.com/kobus-v-schoor/dotgit")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 56. nyarchassistant-git
;;; -------------------------------------------------------------------
(define-public nyarchassistant-git
  (package
    (name "nyarchassistant-git")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NyarchLinux/NyarchAssistant")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "AI assistant for GNOME (Newelle fork)")
    (description "Nyarch Assistant, a fork of Newelle - an AI assistant for GNOME using GTK4/Libadwaita with support for multiple AI backends including OpenAI, Ollama, and Google AI.")
    (home-page "https://github.com/NyarchLinux/NyarchAssistant")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. gost-v3-bin
;;; -------------------------------------------------------------------
(define-public gost-v3-bin
  (package
    (name "gost-v3-bin")
    (version "3.2.7.20251122")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/go-gost/gost/releases/download/v" version "/gost_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gost-v3" "bin/gost-v3"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "gO Simple Tunnel - security tunnel proxy")
    (description "GO Simple Tunnel (GOST) v3 - a simple security tunnel supporting multiple proxy protocols for bypassing censorship and creating VPN-like tunnels.  Pre-compiled binary.")
    (home-page "https://gost.run/en/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 58. garage-webui-bin
;;; -------------------------------------------------------------------
(define-public garage-webui-bin
  (package
    (name "garage-webui-bin")
    (version "1.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/khairul169/garage-webui/releases/download/v" version "/garage-webui-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("garage-webui" "bin/garage-webui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "web UI for Garage decentralized storage")
    (description "Frontend UI for Garage, a decentralized S3-compatible object storage service.  Pre-compiled binary requiring the garage daemon.")
    (home-page "https://github.com/khairul169/garage-webui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 59. cactus-client
;;; -------------------------------------------------------------------
(define-public cactus-client
  (package
    (name "cactus-client")
    (version "1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddnet/ddnet/archive/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "DDRaceNetwork modification with extra features")
    (description "A DDRaceNetwork modification adding new features (Cactus Client fork).  Uses cmake build system with Vulkan rendering support.")
    (home-page "https://cactuss.top/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 60. transistor-git
;;; -------------------------------------------------------------------
(define-public transistor-git
  (package
    (name "transistor-git")
    (version "r10.a1eaf2d3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/driglu4it/transistor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "internet radio player with 50,000+ stations")
    (description "Internet radio player that provides access to a station database with over 50,000 stations.  Built with Qt6/Kirigami framework.")
    (home-page "https://gitlab.com/driglu4it/transistor")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 61. nmcurse-rs-git
;;; -------------------------------------------------------------------
(define-public nmcurse-rs-git
  (package
    (name "nmcurse-rs-git")
    (version "latest")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nhktmdzhg/nmcurse-rs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "curses interface for NetworkManager rewritten in Rust")
    (description "Curses interface for NetworkManager, rewritten in Rust with additional features compared to original nmcurse.  Uses ncurses for display.")
    (home-page "https://github.com/nhktmdzhg/nmcurse-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 62. ugrd-git
;;; -------------------------------------------------------------------
(define-public ugrd-git
  (package
    (name "ugrd-git")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/desultory/ugrd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "minimalistic POSIX initramfs generator (git version)")
    (description "Minimalistic POSIX initramfs generator, designed for encrypted systems.  Git development version.  Provides initramfs generation with optional zstandard compression.")
    (home-page "https://github.com/desultory/ugrd")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 63. vlc-plugin-pipewire
;;; -------------------------------------------------------------------
(define-public vlc-plugin-pipewire
  (package
    (name "vlc-plugin-pipewire")
    (version "3.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.remlab.net/vlc-plugin-pipewire/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "pipeWire audio plugins for VLC")
    (description "PipeWire audio output and capture plugins for the VLC media player.")
    (home-page "https://www.remlab.net/vlc-plugin-pipewire/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 64. ugrd
;;; -------------------------------------------------------------------
(define-public ugrd
  (package
    (name "ugrd")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/desultory/ugrd/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "minimalistic POSIX initramfs generator")
    (description "Minimalistic POSIX initramfs generator, designed for encrypted systems.  Stable release.  Provides initramfs generation with optional zstandard compression.")
    (home-page "https://github.com/desultory/ugrd")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 65. codellm
;;; -------------------------------------------------------------------
(define-public codellm
  (package
    (name "codellm")
    (version "1.101.23707")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abacusai/codellm-releases/releases/download/v" version "/codellm-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/codellm/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI code editor with ChatLLM assistant")
    (description "AI code editor that enhances developer productivity, bundled with the AI super assistant ChatLLM.  Proprietary binary application.")
    (home-page "https://github.com/abacusai/codellm-releases")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 66. diskmonitor
;;; -------------------------------------------------------------------
(define-public diskmonitor
  (package
    (name "diskmonitor")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/papylhomme/diskmonitor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "KDE tools to monitor SMART and MDRaid health status")
    (description "KDE Plasma tools to monitor SMART devices and MDRaid health status.  Uses KDE Frameworks 5 and udisks2.")
    (home-page "https://github.com/papylhomme/diskmonitor")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 67. ttf-sitelen-seli-kiwen-juniko
;;; -------------------------------------------------------------------
(define-public ttf-sitelen-seli-kiwen-juniko
  (package
    (name "ttf-sitelen-seli-kiwen-juniko")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.kreativekorp.com/software/fonts/sitelenselikiwen")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Sitelen Seli Kiwen font for Sitelen Pona - Juniko variant")
    (description "Sitelen Seli Kiwen is a font created specially for the Sitelen Pona writing system used for the Toki Pona language.  Juniko variant.")
    (home-page "https://www.kreativekorp.com/software/fonts/sitelenselikiwen")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 68. ttf-sitelen-seli-kiwen-asuki
;;; -------------------------------------------------------------------
(define-public ttf-sitelen-seli-kiwen-asuki
  (package
    (name "ttf-sitelen-seli-kiwen-asuki")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://www.kreativekorp.com/software/fonts/sitelenselikiwen")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Sitelen Seli Kiwen font for Sitelen Pona - Asuki variant")
    (description "Sitelen Seli Kiwen is a font created specially for the Sitelen Pona writing system used for the Toki Pona language.  Asuki variant.")
    (home-page "https://www.kreativekorp.com/software/fonts/sitelenselikiwen")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 69. spreet
;;; -------------------------------------------------------------------
(define-public spreet
  (package
    (name "spreet")
    (version "0.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flother/spreet/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "create spritesheets from SVGs")
    (description "A command-line tool for creating spritesheets (sprite atlases) from SVG files.  Written in Rust.")
    (home-page "https://github.com/flother/spreet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 70. drg_mod_integration-notag-bin
;;; -------------------------------------------------------------------
(define-public drg-mod-integration-notag-bin
  (package
    (name "drg_mod_integration-notag-bin")
    (version "0.2.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Strappazzon/drg-mint-notag/releases/download/v" version "/drg_mod_integration-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("drg_mod_integration-notag" "bin/drg_mod_integration-notag"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Deep Rock Galactic mod loader (Strappazzon fork)")
    (description "Deep Rock Galactic mod loader and integration tool, Strappazzon fork (no-tag variant).  Pre-compiled binary.")
    (home-page "https://github.com/Strappazzon/drg-mint-notag")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 71. maplemononl-woff2
;;; -------------------------------------------------------------------
(define-public maplemononl-woff2
  (package
    (name "maplemononl-woff2")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-WOFF2.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL font - WOFF2 format")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) variant in WOFF2 format.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 72. maplemononl-variable
;;; -------------------------------------------------------------------
(define-public maplemononl-variable
  (package
    (name "maplemononl-variable")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-Variable.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL font - variable format")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) variable weight variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 73. maplemononl-ttf-autohint
;;; -------------------------------------------------------------------
(define-public maplemononl-ttf-autohint
  (package
    (name "maplemononl-ttf-autohint")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-TTF-AutoHint.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL font - TTF with autohinting")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) TTF variant with autohinting enabled.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 74. maplemononl-ttf
;;; -------------------------------------------------------------------
(define-public maplemononl-ttf
  (package
    (name "maplemononl-ttf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-TTF.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL font - TTF format")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) TTF variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 75. maplemononl-otf
;;; -------------------------------------------------------------------
(define-public maplemononl-otf
  (package
    (name "maplemononl-otf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-OTF.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL font - OTF format")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) OTF variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 76. maplemononl-nf-unhinted
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-unhinted
  (package
    (name "maplemononl-nf-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-NF-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL Nerd Font - unhinted variant")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) Nerd Font unhinted variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 77. maplemononl-nf-cn-unhinted
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-cn-unhinted
  (package
    (name "maplemononl-nf-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-NF-CN-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL Nerd Font CN - unhinted variant")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) Nerd Font with Chinese characters, unhinted variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 78. maplemononl-nf-cn
;;; -------------------------------------------------------------------
(define-public maplemononl-nf-cn
  (package
    (name "maplemononl-nf-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-NF-CN.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL Nerd Font with Chinese characters")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) Nerd Font variant with Chinese character support.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 79. maplemononl-nf
;;; -------------------------------------------------------------------
(define-public maplemononl-nf
  (package
    (name "maplemononl-nf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-NF.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL Nerd Font")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) Nerd Font variant.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 80. maplemononl-cn-unhinted
;;; -------------------------------------------------------------------
(define-public maplemononl-cn-unhinted
  (package
    (name "maplemononl-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-CN-unhinted.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL with Chinese characters - unhinted")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) variant with Chinese characters, unhinted.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 81. maplemononl-cn
;;; -------------------------------------------------------------------
(define-public maplemononl-cn
  (package
    (name "maplemononl-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v" version "/MapleMono-NL-CN.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.(ttf|otf|woff2?)$")))))
    (synopsis "Maple Mono NL with Chinese characters")
    (description "Open source monospace font with round corners, ligatures, and Nerd-Font support for IDE and command line.  NL (No Ligature) variant with Chinese character support.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))
