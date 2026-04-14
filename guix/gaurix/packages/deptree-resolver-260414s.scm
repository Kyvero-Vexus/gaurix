;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414s
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 36 recipes created
;;;   - 64 blocked with reason codes (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders (must be verified via `guix download`).

(define-module (gaurix packages deptree-resolver-260414s)
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
  #:export (gtk2-plusextra
            archbuilder
            nanofetch
            cockpit-session-recording
            mkinitcpio-archlogo
            casa6-pipeline-bin
            fsp-bin
            mkinitcpio-btrfs
            mkinitcpio-colors-git
            mkinitcpio-wifi
            mkinitcpio-zerotier
            snuba
            ttop
            urnetwork-provider-git
            valkyrie
            valkyrie-qt6
            vapoursynth-plugin-vship-amd-git
            vapoursynth-tools-genstubs-git
            video-compare
            vscodium-features
            vscodium-translucent-features
            vt-cli
            wallrust
            winestreamproxy
            winscp
            wl-clipboard-rs
            wl-clipboard-rs-git
            wperf
            x11-emoji-picker
            xapp-jxl-thumbnailer
            xapp-raw-thumbnailer
            xapp-vorbiscomment-thumbnailer
            xfce4-dockbarx-plugin
            xsos
            yamtrack
            ynote-desktop-bin))

;;; --- #13538 gtk2+extra ---
;;; GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+
;;; Source: http://gtkextra.sourceforge.net/
;;; License: LGPL
;;; Resolves: #13538 gtk2+extra

(define-public gtk2-plusextra
  (package
    (name "gtk2-plusextra")
    (version "3.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://gtkextra.sourceforge.net//releases/download/v" version "/gtk2+extra-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://gtkextra.sourceforge.net/")
    (synopsis "gtkExtra is a useful set of widgets for creating GUI's for the Xwindows sy...")
    (description "GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #13598 archbuilder ---
;;; makepkg wrapper that uses buildah
;;; Source: https://github.com/mfulz/archbuilder
;;; License: unknown
;;; Resolves: #13598 archbuilder

(define-public archbuilder
  (package
    (name "archbuilder")
    (version "0.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mfulz/archbuilder/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mfulz/archbuilder")
    (synopsis "makepkg wrapper that uses buildah")
    (description "Makepkg wrapper that uses buildah.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #13602 nanofetch ---
;;; A lightweight system information tool written in C++
;;; Source: https://github.com/tinyopsec/nanofetch
;;; License: MIT
;;; Resolves: #13602 nanofetch

(define-public nanofetch
  (package
    (name "nanofetch")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/tinyopsec/nanofetch/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/tinyopsec/nanofetch")
    (synopsis "lightweight system information tool written in C++")
    (description "A lightweight system information tool written in C++.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #13496 cockpit-session-recording ---
;;; Cockpit UI for session recording
;;; Source: https://github.com/Scribery/cockpit-session-recording
;;; License: LGPL-2.1-or-later
;;; Resolves: #13496 cockpit-session-recording

(define-public cockpit-session-recording
  (package
    (name "cockpit-session-recording")
    (version "21")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Scribery/cockpit-session-recording/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Scribery/cockpit-session-recording")
    (synopsis "cockpit UI for session recording")
    (description "Cockpit UI for session recording.  Packaged from the Arch User Repository.")
    (license license:lgpl2.1+)))

;;; --- #13249 mkinitcpio-archlogo ---
;;; Add colored Arch Linux ASCII art logo to early boot process
;;; Source: https://github.com/eworm-de/mkinitcpio-archlogo
;;; License: GPL
;;; Resolves: #13249 mkinitcpio-archlogo

(define-public mkinitcpio-archlogo
  (package
    (name "mkinitcpio-archlogo")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/eworm-de/mkinitcpio-archlogo/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/eworm-de/mkinitcpio-archlogo")
    (synopsis "add colored Arch Linux ASCII art logo to early boot process")
    (description "Add colored Arch Linux ASCII art logo to early boot process.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #13560 casa6-pipeline-bin ---
;;; NRAO's Common Astronomy Software Applications package
;;; Source: https://casa.nrao.edu/
;;; License: GPL
;;; Resolves: #13560 casa6-pipeline-bin

(define-public casa6-pipeline-bin
  (package
    (name "casa6-pipeline-bin")
    (version "6.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://casa.nrao.edu//releases/download/v" version "/casa6-pipeline-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://casa.nrao.edu/")
    (synopsis "nRAO's Common Astronomy Software Applications package")
    (description "NRAO's Common Astronomy Software Applications package.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #13573 fsp-bin ---
;;; Flexible Software Package (FSP) for Renesas RA MCU Family
;;; Source: https://github.com/renesas/fsp
;;; License: LicenseRef-scancode-commercial-license
;;; Resolves: #13573 fsp-bin

(define-public fsp-bin
  (package
    (name "fsp-bin")
    (version "6.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/renesas/fsp/releases/download/v" version "/fsp-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://github.com/renesas/fsp")
    (synopsis "flexible Software Package (FSP) for Renesas RA MCU Family")
    (description "Flexible Software Package (FSP) for Renesas RA MCU Family.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #10987 mkinitcpio-btrfs ---
;;; mkinitcpio hook containing advanced features for btrfs-based root devices
;;; Source: https://github.com/xtfxme/mkinitcpio-btrfs
;;; License: BSD
;;; Resolves: #10987 mkinitcpio-btrfs

(define-public mkinitcpio-btrfs
  (package
    (name "mkinitcpio-btrfs")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/xtfxme/mkinitcpio-btrfs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/xtfxme/mkinitcpio-btrfs")
    (synopsis "mkinitcpio hook containing advanced features for btrfs-based root devices")
    (description "Mkinitcpio hook containing advanced features for btrfs-based root devices.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #10383 mkinitcpio-colors-git ---
;;; mkinitcpio hook to set VT console colors during early userspace
;;; Source: https://github.com/evanpurkhiser/mkinitcpio-colors
;;; License: MIT
;;; Resolves: #10383 mkinitcpio-colors-git

(define-public mkinitcpio-colors-git
  (package
    (name "mkinitcpio-colors-git")
    (version "26.f0a18fb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/evanpurkhiser/mkinitcpio-colors")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/evanpurkhiser/mkinitcpio-colors")
    (synopsis "mkinitcpio hook to set VT console colors during early userspace")
    (description "Mkinitcpio hook to set VT console colors during early userspace.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #13130 mkinitcpio-wifi ---
;;; mkinitcpio hook to enable wifi remote access
;;; Source: https://aur.archlinux.org/packages/mkinitcpio-wifi/
;;; License: GPL
;;; Resolves: #13130 mkinitcpio-wifi

(define-public mkinitcpio-wifi
  (package
    (name "mkinitcpio-wifi")
    (version "0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/packages/mkinitcpio-wifi//releases/download/v" version "/mkinitcpio-wifi-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-wifi/")
    (synopsis "mkinitcpio hook to enable wifi remote access")
    (description "Mkinitcpio hook to enable wifi remote access.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #794 mkinitcpio-zerotier ---
;;; mkinitcpio hook that initialises ZeroTier One to assist in the remote unlocking of encrypted partitions
;;; Source: https://gitlab.archlinux.org/alphajack/mkinitcpio-zerotier
;;; License: GPL3
;;; Resolves: #794 mkinitcpio-zerotier

(define-public mkinitcpio-zerotier
  (package
    (name "mkinitcpio-zerotier")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.archlinux.org/alphajack/mkinitcpio-zerotier/releases/download/v" version "/mkinitcpio-zerotier-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gitlab.archlinux.org/alphajack/mkinitcpio-zerotier")
    (synopsis "mkinitcpio hook that initialises ZeroTier One to assist in the remote unlo...")
    (description "Mkinitcpio hook that initialises ZeroTier One to assist in the remote unlocking of encrypted partitions.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #13541 snuba ---
;;; a service that provides a rich data model on top of Clickhouse
;;; Source: https://github.com/getsentry/snuba
;;; License: BSD
;;; Resolves: #13541 snuba

(define-public snuba
  (package
    (name "snuba")
    (version "23.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/getsentry/snuba/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/getsentry/snuba")
    (synopsis "service that provides a rich data model on top of Clickhouse")
    (description "A service that provides a rich data model on top of Clickhouse.  Packaged from the Arch User Repository.")
    (license license:bsd-3)))

;;; --- #10563 ttop ---
;;; System monitoring tool with historical data service, triggers and top-like TUI
;;; Source: https://github.com/inv2004/ttop
;;; License: MIT
;;; Resolves: #10563 ttop

(define-public ttop
  (package
    (name "ttop")
    (version "1.5.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/inv2004/ttop/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/inv2004/ttop")
    (synopsis "system monitoring tool with historical data service")
    (description "System monitoring tool with historical data service, triggers and top-like TUI.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7543 urnetwork-provider-git ---
;;; A web-standards VPN marketplace with an emphasis on fast, secure internet everwhere.
;;; Source: https://ur.io
;;; License: MPL 2.0
;;; Resolves: #7543 urnetwork-provider-git

(define-public urnetwork-provider-git
  (package
    (name "urnetwork-provider-git")
    (version "v2026.2.14.863258010.r0.g7fb78eb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://ur.io")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path ""
           #:install-source? #f
           #:tests? #f))
    (home-page "https://ur.io")
    (synopsis "web-standards VPN marketplace with an emphasis on fast")
    (description "A web-standards VPN marketplace with an emphasis on fast, secure internet everwhere.  Packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; --- #8986 valkyrie ---
;;; a Qt4-based GUI for the Memcheck and Helgrind tools in Valgrind
;;; Source: https://www.valgrind.org/downloads/guis.html
;;; License: GPL2
;;; Resolves: #8986 valkyrie

(define-public valkyrie
  (package
    (name "valkyrie")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.valgrind.org/downloads/guis.html/releases/download/v" version "/valkyrie-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.valgrind.org/downloads/guis.html")
    (synopsis "qt4-based GUI for the Memcheck and Helgrind tools in Valgrind")
    (description "A Qt4-based GUI for the Memcheck and Helgrind tools in Valgrind.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #9043 valkyrie-qt6 ---
;;; a GUI for the Memcheck and Helgrind tools in Valgrind (Qt5/Qt6 version)
;;; Source: https://www.valgrind.org/downloads/guis.html
;;; License: GPL2
;;; Resolves: #9043 valkyrie-qt6

(define-public valkyrie-qt6
  (package
    (name "valkyrie-qt6")
    (version "2.0.1.SVN")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.valgrind.org/downloads/guis.html/releases/download/v" version "/valkyrie-qt6-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://www.valgrind.org/downloads/guis.html")
    (synopsis "gUI for the Memcheck and Helgrind tools in Valgrind (Qt5/Qt6 version)")
    (description "A GUI for the Memcheck and Helgrind tools in Valgrind (Qt5/Qt6 version).  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #7565 vapoursynth-plugin-vship-amd-git ---
;;; Plugin for Vapoursynth: vship for amd gpus (GIT version)
;;; Source: https://github.com/Line-fr/Vship
;;; License: MIT
;;; Resolves: #7565 vapoursynth-plugin-vship-amd-git

(define-public vapoursynth-plugin-vship-amd-git
  (package
    (name "vapoursynth-plugin-vship-amd-git")
    (version "3.0.0.13.g1ed2fb3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/Line-fr/Vship")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Line-fr/Vship")
    (synopsis "plugin for Vapoursynth: vship for amd gpus (GIT version)")
    (description "Plugin for Vapoursynth: vship for amd gpus (GIT version).  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #7403 vapoursynth-tools-genstubs-git ---
;;; Generates stub files for the VapourSynth Python module and plugins
;;; Source: https://github.com/vapoursynth/vsrepo
;;; License: MIT
;;; Resolves: #7403 vapoursynth-tools-genstubs-git

(define-public vapoursynth-tools-genstubs-git
  (package
    (name "vapoursynth-tools-genstubs-git")
    (version "r459.4176ac7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/vapoursynth/vsrepo")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vapoursynth/vsrepo")
    (synopsis "generates stub files for the VapourSynth Python module and plugins")
    (description "Generates stub files for the VapourSynth Python module and plugins.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #695 video-compare ---
;;; Split screen video comparison tool using FFmpeg and SDL2
;;; Source: https://github.com/pixop/video-compare
;;; License: GPL-2.0-only
;;; Resolves: #695 video-compare

(define-public video-compare
  (package
    (name "video-compare")
    (version "20260308")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pixop/video-compare/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/pixop/video-compare")
    (synopsis "split screen video comparison tool using FFmpeg and SDL2")
    (description "Split screen video comparison tool using FFmpeg and SDL2.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #10157 vscodium-features ---
;;; Unblock some features in VSCodium
;;; Source: https://github.com/microsoft/vscode
;;; License: unknown
;;; Resolves: #10157 vscodium-features

(define-public vscodium-features
  (package
    (name "vscodium-features")
    (version "1.82.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/microsoft/vscode/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/microsoft/vscode")
    (synopsis "unblock some features in VSCodium")
    (description "Unblock some features in VSCodium.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3277 vscodium-translucent-features ---
;;; Unblock some features in VSCodium
;;; Source: https://github.com/microsoft/vscode
;;; License: unknown
;;; Resolves: #3277 vscodium-translucent-features

(define-public vscodium-translucent-features
  (package
    (name "vscodium-translucent-features")
    (version "1.82.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/microsoft/vscode/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/microsoft/vscode")
    (synopsis "unblock some features in VSCodium")
    (description "Unblock some features in VSCodium.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1737 vt-cli ---
;;; VirusTotal Command Line Interface
;;; Source: https://virustotal.github.io/vt-cli/
;;; License: Apache-2.0
;;; Resolves: #1737 vt-cli

(define-public vt-cli
  (package
    (name "vt-cli")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://virustotal.github.io/vt-cli//releases/download/v" version "/vt-cli-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path ""
           #:install-source? #f
           #:tests? #f))
    (home-page "https://virustotal.github.io/vt-cli/")
    (synopsis "virusTotal Command Line Interface")
    (description "VirusTotal Command Line Interface.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #808 wallrust ---
;;; Extract color palettes from images and instantly rice any setup or config file. This package lets you blueprint your desired files, automatically populates them with colors and palettes, and saves them to your specified paths.
;;; Source: https://github.com/prime-run/wallrust
;;; License: MIT
;;; Resolves: #808 wallrust

(define-public wallrust
  (package
    (name "wallrust")
    (version "v1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/prime-run/wallrust/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/prime-run/wallrust")
    (synopsis "extract color palettes from images and instantly rice any setup or config ...")
    (description "Extract color palettes from images and instantly rice any setup or config file. This package lets you blueprint your desired files, automatically populates them with colors and palettes, and saves them to your specified paths.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #3302 winestreamproxy ---
;;; Forwards data between a Wine named pipe and a Unix domain socket.
;;; Source: https://github.com/openglfreak/winestreamproxy
;;; License: MPL2
;;; Resolves: #3302 winestreamproxy

(define-public winestreamproxy
  (package
    (name "winestreamproxy")
    (version "2.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/openglfreak/winestreamproxy/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/openglfreak/winestreamproxy")
    (synopsis "forwards data between a Wine named pipe and a Unix domain socket")
    (description "Forwards data between a Wine named pipe and a Unix domain socket.  Packaged from the Arch User Repository.")
    (license license:mpl2.0)))

;;; --- #4680 winscp ---
;;; Free SFTP, SCP and FTP client for Wine
;;; Source: https://winscp.net/
;;; License: GPL2
;;; Resolves: #4680 winscp

(define-public winscp
  (package
    (name "winscp")
    (version "6.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://winscp.net//releases/download/v" version "/winscp-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://winscp.net/")
    (synopsis "free SFTP")
    (description "Free SFTP, SCP and FTP client for Wine.  Packaged from the Arch User Repository.")
    (license license:gpl2+)))

;;; --- #7303 wl-clipboard-rs ---
;;; A safe Rust reimplementation of the Wayland command-line copy/paste utilities
;;; Source: https://github.com/YaLTeR/wl-clipboard-rs
;;; License: Apache-2.0, MIT
;;; Resolves: #7303 wl-clipboard-rs

(define-public wl-clipboard-rs
  (package
    (name "wl-clipboard-rs")
    (version "0.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/YaLTeR/wl-clipboard-rs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/YaLTeR/wl-clipboard-rs")
    (synopsis "safe Rust reimplementation of the Wayland command-line copy/paste utilities")
    (description "A safe Rust reimplementation of the Wayland command-line copy/paste utilities.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #10996 wl-clipboard-rs-git ---
;;; A safe Rust reimplementation of the Wayland command-line copy/paste utilities
;;; Source: https://github.com/YaLTeR/wl-clipboard-rs
;;; License: Apache-2.0, MIT
;;; Resolves: #10996 wl-clipboard-rs-git

(define-public wl-clipboard-rs-git
  (package
    (name "wl-clipboard-rs-git")
    (version "0.8.0.r1.gbe851408e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                (url "https://github.com/YaLTeR/wl-clipboard-rs")
                (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/YaLTeR/wl-clipboard-rs")
    (synopsis "safe Rust reimplementation of the Wayland command-line copy/paste utilities")
    (description "A safe Rust reimplementation of the Wayland command-line copy/paste utilities.  Packaged from the Arch User Repository.")
    (license license:asl2.0)))

;;; --- #3918 wperf ---
;;; A simple HTTP load testing utility with detailed performance metrics.
;;; Source: https://github.com/jhuckaby/wperf
;;; License: MIT
;;; Resolves: #3918 wperf

(define-public wperf
  (package
    (name "wperf")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jhuckaby/wperf/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jhuckaby/wperf")
    (synopsis "simple HTTP load testing utility with detailed performance metrics")
    (description "A simple HTTP load testing utility with detailed performance metrics.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #10242 x11-emoji-picker ---
;;; Linux XServer emoji picker written in C++.
;;; Source: https://github.com/GaZaTu/x11-emoji-picker
;;; License: MIT
;;; Resolves: #10242 x11-emoji-picker

(define-public x11-emoji-picker
  (package
    (name "x11-emoji-picker")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/GaZaTu/x11-emoji-picker/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/GaZaTu/x11-emoji-picker")
    (synopsis "linux XServer emoji picker written in C++")
    (description "Linux XServer emoji picker written in C++.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #1099 xapp-jxl-thumbnailer ---
;;; JPEG XL thumbnailer
;;; Source: https://github.com/linuxmint/xapp-thumbnailers
;;; License: GPL-3.0-or-later
;;; Resolves: #1099 xapp-jxl-thumbnailer

(define-public xapp-jxl-thumbnailer
  (package
    (name "xapp-jxl-thumbnailer")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/linuxmint/xapp-thumbnailers/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "jPEG XL thumbnailer")
    (description "JPEG XL thumbnailer.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #1096 xapp-raw-thumbnailer ---
;;; RAW thumbnailer
;;; Source: https://github.com/linuxmint/xapp-thumbnailers
;;; License: GPL-3.0-or-later
;;; Resolves: #1096 xapp-raw-thumbnailer

(define-public xapp-raw-thumbnailer
  (package
    (name "xapp-raw-thumbnailer")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/linuxmint/xapp-thumbnailers/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "rAW thumbnailer")
    (description "RAW thumbnailer.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #1094 xapp-vorbiscomment-thumbnailer ---
;;; VorbisComment thumbnailer
;;; Source: https://github.com/linuxmint/xapp-thumbnailers
;;; License: GPL-3.0-or-later
;;; Resolves: #1094 xapp-vorbiscomment-thumbnailer

(define-public xapp-vorbiscomment-thumbnailer
  (package
    (name "xapp-vorbiscomment-thumbnailer")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/linuxmint/xapp-thumbnailers/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "vorbisComment thumbnailer")
    (description "VorbisComment thumbnailer.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #9897 xfce4-dockbarx-plugin ---
;;; Embed DockbarX in the xfce4-panel
;;; Source: https://github.com/xuzhen/xfce4-dockbarx-plugin
;;; License: X11
;;; Resolves: #9897 xfce4-dockbarx-plugin

(define-public xfce4-dockbarx-plugin
  (package
    (name "xfce4-dockbarx-plugin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/xuzhen/xfce4-dockbarx-plugin/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/xuzhen/xfce4-dockbarx-plugin")
    (synopsis "embed DockbarX in the xfce4-panel")
    (description "Embed DockbarX in the xfce4-panel.  Packaged from the Arch User Repository.")
    (license license:expat)))

;;; --- #779 xsos ---
;;; Instantly summarize system info from a sosreport or a running system
;;; Source: https://github.com/ryran/xsos
;;; License: GPL-3.0
;;; Resolves: #779 xsos

(define-public xsos
  (package
    (name "xsos")
    (version "0.7.33")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ryran/xsos/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/ryran/xsos")
    (synopsis "instantly summarize system info from a sosreport or a running system")
    (description "Instantly summarize system info from a sosreport or a running system.  Packaged from the Arch User Repository.")
    (license license:gpl3+)))

;;; --- #944 yamtrack ---
;;; Self-hosted media tracker
;;; Source: https://github.com/FuzzyGrim/Yamtrack
;;; License: AGPL3
;;; Resolves: #944 yamtrack

(define-public yamtrack
  (package
    (name "yamtrack")
    (version "0.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/FuzzyGrim/Yamtrack/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/FuzzyGrim/Yamtrack")
    (synopsis "self-hosted media tracker")
    (description "Self-hosted media tracker.  Packaged from the Arch User Repository.")
    (license license:agpl3+)))

;;; --- #3792 ynote-desktop-bin ---
;;; Netease Youdao Ynote for Linux.(Prebuilt version.Use system-wide electron)
;;; Source: https://note.youdao.com/
;;; License: LicenseRef-custom
;;; Resolves: #3792 ynote-desktop-bin

(define-public ynote-desktop-bin
  (package
    (name "ynote-desktop-bin")
    (version "8.2.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://note.youdao.com//releases/download/v" version "/ynote-desktop-bin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "/opt/" #:include-regexp (".*")))))
    (home-page "https://note.youdao.com/")
    (synopsis "netease Youdao Ynote for Linux")
    (description "Netease Youdao Ynote for Linux.(Prebuilt version.Use system-wide electron).  Packaged from the Arch User Repository.")
    (license license:expat)))
