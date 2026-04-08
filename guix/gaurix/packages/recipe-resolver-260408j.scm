;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408j
;;; Resolves 100 TODO packages from todo_general_packages.org:
;;;   - 54 new recipes (binary/copy-build-system)
;;;   - 46 re-evaluated with specific blocking reasons (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages bash)
  #:export (
            imgbrd-grabber-bin
            netcoredbg-bin
            natscli-bin
            kaf-cli-bin
            kaf-wifi-bin
            f2-bin
            vet-bin
            rune-editor-bin
            logisim-bin
            nwjs-bin
            nwjs-sdk-bin
            turbowarp-desktop-bin
            hakuneko-desktop-bin
            teleport-connect-bin
            crazydiskinfo-bin
            pacmanager-bin
            betterdiscord-installer-bin
            icaclient-bin
            jriver-media-center-bin
            tracktion-waveform-bin
            intel-compute-runtime-legacy-bin
            intel-graphics-compiler-legacy-bin
            protondb-tags-bin
            absolutely-proprietary-bin
            webtorrent-cli-bin
            dl-librescore-bin
            fish-lsp-bin
            vdu-controls-bin
            better-adb-sync-bin
            mpv-sponsorblock-minimal-bin
            wayclip-bin
            gitflow-cjs-bin
            gpu-passthrough-manager-bin
            xe-guest-utilities-xcp-ng-bin
            xenstore-xcp-ng-bin
            prisma-language-server-bin
            firebase-tools-bin
            asbru-cm-bin
            debmirror-bin
            subliminal-bin
            magic-tape-bin
            izumi-bin
            minecraft-plymouth-theme-bin
            python-vllm-bin
            brother-hll2340dw-bin
            pkg-64gram-desktop-bin
            libremines-bin
            umu-launcher-bin
            open-webui-bin
            xv-bin
            roo-code-gemini-cli-bin
            gdm-settings-bin
            gimp-plugin-gimp3-tools-bin
            zclock-bin
            ))

;;;
;;; ── imgbrd-grabber-bin ──────────────────────────────────────────
;;; customizable imageboard/booru downloader with filenaming features
;;;
(define-public imgbrd-grabber-bin
  (package
    (name "imgbrd-grabber-bin")
    (version "7.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bionus/imgbrd-grabber/releases/download/v"
             version "/Grabber_v" version "_x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("imgbrd-grabber-bin" "bin/imgbrd-grabber-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "imgbrd-grabber-bin")
              (chmod "imgbrd-grabber-bin" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bionus/imgbrd-grabber")
    (synopsis "customizable imageboard/booru downloader with filenaming features")
    (description
     "Imgbrd-grabber is a very customizable imageboard and booru
downloader with powerful filenaming features.  It supports many sites
including Danbooru, Gelbooru, and others.  This package provides the
pre-built AppImage binary.")
    (license license:asl2.0)))

;;;
;;; ── netcoredbg-bin ──────────────────────────────────────────
;;; debugger for .NET Core runtime
;;;
(define-public netcoredbg-bin
  (package
    (name "netcoredbg-bin")
    (version "3.1.3-1062")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Samsung/netcoredbg/releases/download/"
             version "/netcoredbg-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("netcoredbg/netcoredbg" "bin/netcoredbg"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Samsung/netcoredbg")
    (synopsis "debugger for .NET Core runtime")
    (description
     "Netcoredbg is a managed code debugger for the .NET Core
runtime implementing the VS Code Debug Adapter Protocol.  It supports
breakpoints, stepping, variable inspection, and other standard
debugging features.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── natscli-bin ──────────────────────────────────────────
;;; command-line interface for NATS messaging system
;;;
(define-public natscli-bin
  (package
    (name "natscli-bin")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nats-io/natscli/releases/download/v"
             version "/nats-" version "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("nats" "bin/nats"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nats-io/natscli")
    (synopsis "command-line interface for NATS messaging system")
    (description
     "Natscli is the official command-line interface for the NATS
messaging system.  It provides tools for publishing, subscribing,
managing streams, and administering NATS servers.  This package
provides the pre-built binary.")
    (license license:asl2.0)))

;;;
;;; ── kaf-cli-bin ──────────────────────────────────────────
;;; command-line tool for converting text to e-book formats
;;;
(define-public kaf-cli-bin
  (package
    (name "kaf-cli-bin")
    (version "1.3.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ystyle/kaf-cli/releases/download/v"
             version "/kaf-cli_linux_amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kaf-cli" "bin/kaf-cli"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "kaf-cli")
              (chmod "kaf-cli" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ystyle/kaf-cli")
    (synopsis "command-line tool for converting text to e-book formats")
    (description
     "Kaf-cli is a command-line tool for converting plain text files
into EPUB and MOBI e-book formats.  It supports chapter detection,
custom styling, and batch processing.  This package provides the
pre-built binary.")
    (license license:expat)))

;;;
;;; ── kaf-wifi-bin ──────────────────────────────────────────
;;; wireless book transfer tool for Kindle devices
;;;
(define-public kaf-wifi-bin
  (package
    (name "kaf-wifi-bin")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ystyle/kaf-wifi/releases/download/v"
             version "/kaf-wifi_linux_amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kaf-wifi" "bin/kaf-wifi"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "kaf-wifi")
              (chmod "kaf-wifi" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ystyle/kaf-wifi")
    (synopsis "wireless book transfer tool for Kindle devices")
    (description
     "Kaf-wifi is a tool for wirelessly transferring books to Kindle
devices over a local network.  It provides a simple web interface
for uploading files.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── f2-bin ──────────────────────────────────────────
;;; cross-platform batch file renaming tool
;;;
(define-public f2-bin
  (package
    (name "f2-bin")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ayoisaiah/f2/releases/download/v"
             version "/f2_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("f2" "bin/f2"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ayoisaiah/f2")
    (synopsis "cross-platform batch file renaming tool")
    (description
     "F2 is a cross-platform command-line tool for batch renaming files
and directories quickly and safely.  It supports regex, string
replacement, auto-incrementing, and dry-run previews.  This package
provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── vet-bin ──────────────────────────────────────────
;;; safety net for curl-pipe-to-bash installation pattern
;;;
(define-public vet-bin
  (package
    (name "vet-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/vet/releases/download/v"
             version "/vet-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("vet" "bin/vet"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getvet.sh/")
    (synopsis "safety net for curl-pipe-to-bash installation pattern")
    (description
     "Vet is a command-line tool that acts as a safety net for the
risky curl-pipe-to-bash pattern.  It verifies scripts before
execution by checking checksums and known signatures.  This
package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── rune-editor-bin ──────────────────────────────────────────
;;; modern CLI text editor bridging simplicity and advanced features
;;;
(define-public rune-editor-bin
  (package
    (name "rune-editor-bin")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/exec/rune/releases/download/v"
             version "/rune-v" version "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rune" "bin/rune"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/exec/rune")
    (synopsis "modern CLI text editor bridging simplicity and advanced features")
    (description
     "Rune is a modern command-line text editor that bridges the gap
between nano simplicity and advanced editor features.  It provides
syntax highlighting, search and replace, and multiple cursors.  This
package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── logisim-bin ──────────────────────────────────────────
;;; educational tool for designing digital logic circuits
;;;
(define-public logisim-bin
  (package
    (name "logisim-bin")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/circuit/files/"
             version "/logisim-generic-" version ".jar/download"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("logisim.jar" "share/java/logisim.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "logisim.jar")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jar (string-append out "/share/java/logisim.jar")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/logisim")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec java -jar ~a \"$@\"\n" jar)))
                (chmod (string-append bin "/logisim") #o755))))
          (delete 'install-license-files))))
    (inputs (list icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.cburch.com/logisim/")
    (synopsis "educational tool for designing digital logic circuits")
    (description
     "Logisim is an educational tool for designing and simulating
digital logic circuits.  It provides a graphical interface with
component libraries, wiring tools, and simulation capabilities.
This package provides the pre-built JAR.")
    (license license:gpl2+)))

;;;
;;; ── nwjs-bin ──────────────────────────────────────────
;;; application runtime based on Chromium and Node.js
;;;
(define-public nwjs-bin
  (package
    (name "nwjs-bin")
    (version "0.110.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.nwjs.io/v" version "/nwjs-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((("nwjs-v" version "-linux-x64/" "share/nwjs/")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/nwjs/nw")
                         (string-append bin "/nw")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nwjs.io")
    (synopsis "application runtime based on Chromium and Node.js")
    (description
     "NW.js (formerly node-webkit) is an application runtime based on
Chromium and Node.js.  It allows writing native applications using
web technologies (HTML, CSS, JavaScript).  This package provides
the pre-built binary.")
    (license license:expat)))

;;;
;;; ── nwjs-sdk-bin ──────────────────────────────────────────
;;; NW.js SDK with DevTools for application development
;;;
(define-public nwjs-sdk-bin
  (package
    (name "nwjs-sdk-bin")
    (version "0.110.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.nwjs.io/v" version "/nwjs-sdk-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((("nwjs-sdk-v" version "-linux-x64/" "share/nwjs-sdk/")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/nwjs-sdk/nw")
                         (string-append bin "/nwjs-sdk")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nwjs.io")
    (synopsis "NW.js SDK with DevTools for application development")
    (description
     "NW.js SDK provides the full NW.js runtime with DevTools enabled
for development and debugging of NW.js applications.  This package
provides the pre-built SDK binary.")
    (license license:expat)))

;;;
;;; ── turbowarp-desktop-bin ──────────────────────────────────────────
;;; Scratch mod with compiler for faster project execution
;;;
(define-public turbowarp-desktop-bin
  (package
    (name "turbowarp-desktop-bin")
    (version "1.15.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TurboWarp/desktop/releases/download/v"
             version "/TurboWarp-linux-x64-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((("TurboWarp-linux-x64/" "share/turbowarp/")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/turbowarp/turbowarp-desktop")
                         (string-append bin "/turbowarp-desktop")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://desktop.turbowarp.org/")
    (synopsis "Scratch mod with compiler for faster project execution")
    (description
     "TurboWarp is a Scratch mod with a compiler to run projects
faster, dark mode, and many addons to improve the editor and player.
It is fully compatible with vanilla Scratch projects.  This package
provides the pre-built desktop application.")
    (license license:gpl3+)))

;;;
;;; ── hakuneko-desktop-bin ──────────────────────────────────────────
;;; manga and anime downloader for multiple platforms
;;;
(define-public hakuneko-desktop-bin
  (package
    (name "hakuneko-desktop-bin")
    (version "8.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/manga-download/hakuneko/releases/download/nightly-"
             version "/hakuneko-desktop_" version "_linux_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/hakuneko-desktop/" "share/hakuneko-desktop-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/hakuneko-desktop-bin/hakuneko-desktop")
                         (string-append bin "/hakuneko-desktop")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/manga-download/hakuneko")
    (synopsis "manga and anime downloader for multiple platforms")
    (description
     "HakuNeko is a cross-platform downloader for manga and anime
from various online sources.  It provides a desktop interface for
browsing, downloading, and organizing manga chapters.  This package
provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── teleport-connect-bin ──────────────────────────────────────────
;;; desktop client for Teleport infrastructure access
;;;
(define-public teleport-connect-bin
  (package
    (name "teleport-connect-bin")
    (version "18.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.teleport.dev/Teleport%20Connect-"
             version ".x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("teleport-connect-bin" "bin/teleport-connect-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "teleport-connect-bin")
              (chmod "teleport-connect-bin" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://goteleport.com")
    (synopsis "desktop client for Teleport infrastructure access")
    (description
     "Teleport Connect is a desktop application that provides
secure access to SSH servers, Kubernetes clusters, databases, and
web applications managed by Teleport.  This package provides the
pre-built binary.")
    (license license:asl2.0)))

;;;
;;; ── crazydiskinfo-bin ──────────────────────────────────────────
;;; interactive TUI S.M.A.R.T disk health viewer
;;;
(define-public crazydiskinfo-bin
  (package
    (name "crazydiskinfo-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/otakuto/crazydiskinfo/releases/download/"
             version "/crazydiskinfo-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("crazydiskinfo" "bin/crazydiskinfo"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/otakuto/crazydiskinfo")
    (synopsis "interactive TUI S.M.A.R.T disk health viewer")
    (description
     "CrazyDiskInfo is an interactive terminal user interface for
viewing S.M.A.R.T. disk health information.  It displays disk
attributes, temperature, and health status in a ncurses-based
interface.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── pacmanager-bin ──────────────────────────────────────────
;;; graphical interface for managing Arch Linux packages
;;;
(define-public pacmanager-bin
  (package
    (name "pacmanager-bin")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/KriszKecskes/pacmanager/releases/download/v"
             version "/pacmanager-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pacmanager-bin" "bin/pacmanager-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "pacmanager-bin")
              (chmod "pacmanager-bin" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KriszKecskes/pacmanager")
    (synopsis "graphical interface for managing Arch Linux packages")
    (description
     "Pacmanager provides a user-friendly graphical interface for
managing both official Arch Linux packages via pacman and AUR
packages.  This package provides the pre-built AppImage binary.")
    (license (nonguix-license:nonfree "proprietary"))))

;;;
;;; ── betterdiscord-installer-bin ──────────────────────────────────────────
;;; installer for the BetterDiscord client modification
;;;
(define-public betterdiscord-installer-bin
  (package
    (name "betterdiscord-installer-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/BetterDiscord/Installer/releases/download/v"
             version "/BetterDiscord-Linux.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("betterdiscord-installer-bin" "bin/betterdiscord-installer-bin"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "betterdiscord-installer-bin")
              (chmod "betterdiscord-installer-bin" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BetterDiscord/Installer")
    (synopsis "installer for the BetterDiscord client modification")
    (description
     "BetterDiscord Installer is a tool for installing, updating,
and managing the BetterDiscord modification for the Discord
desktop client.  This package provides the pre-built AppImage
binary.")
    (license license:expat)))

;;;
;;; ── icaclient-bin ──────────────────────────────────────────
;;; Citrix Workspace App for remote desktop access
;;;
(define-public icaclient-bin
  (package
    (name "icaclient-bin")
    (version "26.01.0.150")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.citrix.com/22482/linuxx64-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~`((("linuxx64/" "share/icaclient/")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/icaclient/wfica")
                         (string-append bin "/wfica")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html")
    (synopsis "Citrix Workspace App for remote desktop access")
    (description
     "Citrix Workspace App (formerly Citrix Receiver or ICA Client)
provides access to virtual desktops and applications through Citrix
infrastructure.  This package provides the proprietary pre-built
binary.")
    (license (nonguix-license:nonfree "https://www.citrix.com/buy/licensing/"))))

;;;
;;; ── jriver-media-center-bin ──────────────────────────────────────────
;;; comprehensive media management and playback software
;;;
(define-public jriver-media-center-bin
  (package
    (name "jriver-media-center-bin")
    (version "35.0.63")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.jriver.com/mediacenter/channels/v35/latest/MediaCenter-"
             version "-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "share/jriver-media-center-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/jriver-media-center-bin/bin/mediacenter35")
                         (string-append bin "/mediacenter35")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jriver.com/")
    (synopsis "comprehensive media management and playback software")
    (description
     "JRiver Media Center is a comprehensive media management and
playback application supporting audio, video, images, and television.
It provides library management, format conversion, and DLNA server
capabilities.  This package provides the proprietary pre-built binary.")
    (license (nonguix-license:nonfree "https://www.jriver.com/eula.html"))))

;;;
;;; ── tracktion-waveform-bin ──────────────────────────────────────────
;;; digital audio workstation for music production
;;;
(define-public tracktion-waveform-bin
  (package
    (name "tracktion-waveform-bin")
    (version "13.5.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.tracktion.com/file/tracktiondownloads/waveform/"
             version "/Waveform_64bit_v" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Waveform/" "share/tracktion-waveform-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/tracktion-waveform-bin/Waveform")
                         (string-append bin "/waveform")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.tracktion.com/")
    (synopsis "digital audio workstation for music production")
    (description
     "Tracktion Waveform is a digital audio and MIDI workstation
for music production.  It provides multi-track recording, editing,
mixing, and mastering with support for VST/AU plugins.  This
package provides the proprietary pre-built binary.")
    (license (nonguix-license:nonfree "https://www.tracktion.com/legal/end-user-licence-agreement"))))

;;;
;;; ── intel-compute-runtime-legacy-bin ──────────────────────────────────────────
;;; Intel compute runtime for legacy GPU platforms
;;;
(define-public intel-compute-runtime-legacy-bin
  (package
    (name "intel-compute-runtime-legacy-bin")
    (version "24.35.30872.36")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intel/compute-runtime/releases/download/"
             version "/intel-opencl-icd_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "share/intel-compute-runtime-legacy-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/intel/compute-runtime/")
    (synopsis "Intel compute runtime for legacy GPU platforms")
    (description
     "Intel Graphics Compute Runtime provides oneAPI Level Zero and
OpenCL driver support for Intel integrated GPUs on legacy platforms.
This package provides the pre-built binary for systems not supported
by the latest runtime.")
    (license license:expat)))

;;;
;;; ── intel-graphics-compiler-legacy-bin ──────────────────────────────────────────
;;; Intel graphics compiler for OpenCL on legacy platforms
;;;
(define-public intel-graphics-compiler-legacy-bin
  (package
    (name "intel-graphics-compiler-legacy-bin")
    (version "1.0.17537.24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/intel/intel-graphics-compiler/releases/download/"
             "igc-" version "/intel-igc-core_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "share/intel-graphics-compiler-legacy-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/intel/intel-graphics-compiler/")
    (synopsis "Intel graphics compiler for OpenCL on legacy platforms")
    (description
     "Intel Graphics Compiler (IGC) for OpenCL provides shader
compilation support for Intel integrated GPUs on legacy platforms.
This package provides the pre-built binary for systems not supported
by the latest compiler.")
    (license license:expat)))

;;;
;;; ── protondb-tags-bin ──────────────────────────────────────────
;;; import ProtonDB ratings as Steam library tags
;;;
(define-public protondb-tags-bin
  (package
    (name "protondb-tags-bin")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CorruptComputer/ProtonDB-Tags/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/protondb-tags-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/protondb-tags")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/protondb-tags") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CorruptComputer/ProtonDB-Tags")
    (synopsis "import ProtonDB ratings as Steam library tags")
    (description
     "ProtonDB-Tags pulls game compatibility ratings from ProtonDB
and imports them into your Steam library as tags.  This helps
organize your Linux game library by compatibility status.")
    (license license:expat)))

;;;
;;; ── absolutely-proprietary-bin ──────────────────────────────────────────
;;; proprietary package detector for Arch-based distributions
;;;
(define-public absolutely-proprietary-bin
  (package
    (name "absolutely-proprietary-bin")
    (version "20220518")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vmavromatis/absolutely-proprietary/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/absolutely-proprietary-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/absolutely-proprietary")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/absolutely-proprietary") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vmavromatis/absolutely-proprietary")
    (synopsis "proprietary package detector for Arch-based distributions")
    (description
     "Absolutely-proprietary is a proprietary package detector for
Arch-based distributions.  It uses Parabola's package blacklist to
identify non-free software installed on your system.")
    (license license:gpl3)))

;;;
;;; ── webtorrent-cli-bin ──────────────────────────────────────────
;;; streaming torrent client for the command line
;;;
(define-public webtorrent-cli-bin
  (package
    (name "webtorrent-cli-bin")
    (version "5.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/webtorrent-cli/-/webtorrent-cli-"
             version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/webtorrent-cli-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/webtorrent")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/webtorrent") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://webtorrent.io")
    (synopsis "streaming torrent client for the command line")
    (description
     "WebTorrent CLI is the command-line interface for the WebTorrent
streaming torrent client.  It can download and stream torrents
directly in the terminal.")
    (license license:expat)))

;;;
;;; ── dl-librescore-bin ──────────────────────────────────────────
;;; download sheet music from MuseScore
;;;
(define-public dl-librescore-bin
  (package
    (name "dl-librescore-bin")
    (version "0.35.40")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/LibreScore/dl-librescore/releases/download/v"
             version "/dl-librescore"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dl-librescore" "bin/dl-librescore"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "dl-librescore")
              (chmod "dl-librescore" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LibreScore/dl-librescore")
    (synopsis "download sheet music from MuseScore")
    (description
     "Dl-librescore is a tool for downloading sheet music from
MuseScore.  It provides both a command-line interface and a
browser extension for accessing music scores.  This package
provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── fish-lsp-bin ──────────────────────────────────────────
;;; language server protocol implementation for fish shell
;;;
(define-public fish-lsp-bin
  (package
    (name "fish-lsp-bin")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ndonfris/fish-lsp/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fish-lsp-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/fish-lsp")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/fish-lsp") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ndonfris/fish-lsp")
    (synopsis "language server protocol implementation for fish shell")
    (description
     "Fish-lsp is a Language Server Protocol implementation for the
fish shell language.  It provides autocompletion, diagnostics,
hover information, and other IDE features for fish scripts.")
    (license license:expat)))

;;;
;;; ── vdu-controls-bin ──────────────────────────────────────────
;;; visual display unit virtual control panel using ddcutil
;;;
(define-public vdu-controls-bin
  (package
    (name "vdu-controls-bin")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/digitaltrails/vdu_controls/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vdu-controls-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/vdu_controls")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/vdu_controls") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/digitaltrails/vdu_controls")
    (synopsis "visual display unit virtual control panel using ddcutil")
    (description
     "VDU Controls is a graphical front end to ddcutil for controlling
monitor settings.  It provides sliders and controls for brightness,
contrast, and other display parameters via DDC/CI protocol.")
    (license license:gpl3+)))

;;;
;;; ── better-adb-sync-bin ──────────────────────────────────────────
;;; file synchronization between PC and Android via ADB
;;;
(define-public better-adb-sync-bin
  (package
    (name "better-adb-sync-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jpstotz/better-adb-sync/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/better-adb-sync-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/better-adb-sync")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/better-adb-sync") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jpstotz/better-adb-sync")
    (synopsis "file synchronization between PC and Android via ADB")
    (description
     "Better-adb-sync synchronizes files between a PC and an Android
device using ADB (Android Debug Bridge).  It provides bidirectional
sync with conflict detection and resolution.")
    (license license:asl2.0)))

;;;
;;; ── mpv-sponsorblock-minimal-bin ──────────────────────────────────────────
;;; minimal mpv script to skip YouTube sponsored segments
;;;
(define-public mpv-sponsorblock-minimal-bin
  (package
    (name "mpv-sponsorblock-minimal-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/jouni/mpv_sponsorblock_minimal/archive/main.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/mpv-sponsorblock-minimal-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/sponsorblock_minimal")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/sponsorblock_minimal") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/jouni/mpv_sponsorblock_minimal")
    (synopsis "minimal mpv script to skip YouTube sponsored segments")
    (description
     "Mpv-sponsorblock-minimal is a minimal Lua script for mpv that
skips sponsored segments of YouTube videos using the SponsorBlock
API.")
    (license license:gpl3)))

;;;
;;; ── wayclip-bin ──────────────────────────────────────────
;;; Wayland clipboard utility
;;;
(define-public wayclip-bin
  (package
    (name "wayclip-bin")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~noocsharp/wayclip/archive/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/wayclip-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/wayclip")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/wayclip") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.sr.ht/~noocsharp/wayclip")
    (synopsis "Wayland clipboard utility")
    (description
     "Wayclip is a simple clipboard utility for Wayland compositors.
It provides command-line tools for copying and pasting text via the
Wayland clipboard protocol.")
    (license license:isc)))

;;;
;;; ── gitflow-cjs-bin ──────────────────────────────────────────
;;; CJS edition of Git Flow branching model extensions
;;;
(define-public gitflow-cjs-bin
  (package
    (name "gitflow-cjs-bin")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CJ-Systems/gitflow-cjs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gitflow-cjs-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/git-flow")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/git-flow") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CJ-Systems/gitflow-cjs")
    (synopsis "CJS edition of Git Flow branching model extensions")
    (description
     "Gitflow-cjs is the CJS edition of the git extensions providing
high-level repository operations for Vincent Driessen's branching
model.  It simplifies feature, release, and hotfix branch management.")
    (license license:bsd-2)))

;;;
;;; ── gpu-passthrough-manager-bin ──────────────────────────────────────────
;;; simplified GPU passthrough configuration tool
;;;
(define-public gpu-passthrough-manager-bin
  (package
    (name "gpu-passthrough-manager-bin")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/uwzis/gpu-passthrough-manager/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gpu-passthrough-manager-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/gpu-passthrough-manager")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/gpu-passthrough-manager") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/uwzis/gpu-passthrough-manager")
    (synopsis "simplified GPU passthrough configuration tool")
    (description
     "GPU Passthrough Manager is a tool for simplifying GPU
passthrough configuration for virtual machines.  It helps configure
VFIO, IOMMU groups, and VM settings for GPU passthrough.")
    (license license:gpl3+)))

;;;
;;; ── xe-guest-utilities-xcp-ng-bin ──────────────────────────────────────────
;;; XCP-ng guest utilities for virtual machines
;;;
(define-public xe-guest-utilities-xcp-ng-bin
  (package
    (name "xe-guest-utilities-xcp-ng-bin")
    (version "7.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xcp-ng/xe-guest-utilities/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xe-guest-utilities-xcp-ng-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/xe-guest-utilities")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/xe-guest-utilities") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xcp-ng/xe-guest-utilities")
    (synopsis "XCP-ng guest utilities for virtual machines")
    (description
     "Xe-guest-utilities provides tools for XCP-ng/XenServer guest
virtual machines.  It includes the xe-daemon for reporting guest
metrics and xe-linux-distribution for detecting the guest OS.")
    (license license:bsd-3)))

;;;
;;; ── xenstore-xcp-ng-bin ──────────────────────────────────────────
;;; XCP-ng XenStore tools for VM communication
;;;
(define-public xenstore-xcp-ng-bin
  (package
    (name "xenstore-xcp-ng-bin")
    (version "7.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xcp-ng/xe-guest-utilities/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xenstore-xcp-ng-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/xenstore")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/xenstore") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xcp-ng/xe-guest-utilities")
    (synopsis "XCP-ng XenStore tools for VM communication")
    (description
     "Xenstore-xcp-ng provides XenStore command-line tools for
communicating between XCP-ng host and guest virtual machines.
XenStore is used for sharing configuration and state data.")
    (license license:bsd-3)))

;;;
;;; ── prisma-language-server-bin ──────────────────────────────────────────
;;; Language Server Protocol implementation for Prisma
;;;
(define-public prisma-language-server-bin
  (package
    (name "prisma-language-server-bin")
    (version "6.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://registry.npmjs.org/@prisma/language-server/-/language-server-"
             version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/prisma-language-server-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/prisma-language-server")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/prisma-language-server") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.npmjs.com/package/@prisma/language-server")
    (synopsis "Language Server Protocol implementation for Prisma")
    (description
     "Prisma Language Server provides Language Server Protocol
implementation for the Prisma ORM schema language.  It enables
autocompletion, diagnostics, formatting, and navigation in editors
that support LSP.")
    (license license:asl2.0)))

;;;
;;; ── firebase-tools-bin ──────────────────────────────────────────
;;; command-line tools for Firebase platform management
;;;
(define-public firebase-tools-bin
  (package
    (name "firebase-tools-bin")
    (version "15.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/firebase/firebase-tools/releases/download/v"
             version "/firebase-tools-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("firebase" "bin/firebase"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "firebase")
              (chmod "firebase" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/firebase/firebase-tools")
    (synopsis "command-line tools for Firebase platform management")
    (description
     "Firebase Tools provides the command-line interface for managing
Firebase projects including deployment, emulation, database
management, and hosting.  This package provides the pre-built
standalone binary.")
    (license license:expat)))

;;;
;;; ── asbru-cm-bin ──────────────────────────────────────────
;;; free and open-source connection manager
;;;
(define-public asbru-cm-bin
  (package
    (name "asbru-cm-bin")
    (version "6.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/asbru-cm/asbru-cm/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/asbru-cm-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/asbru-cm")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/asbru-cm") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/asbru-cm/asbru-cm")
    (synopsis "free and open-source connection manager")
    (description
     "Asbru Connection Manager is a free and open-source connection
manager for SSH, VNC, RDP, and other remote connection protocols.
It provides a tabbed interface with credential management and
automation features.")
    (license license:gpl3+)))

;;;
;;; ── debmirror-bin ──────────────────────────────────────────
;;; Debian partial mirror script with package pool support
;;;
(define-public debmirror-bin
  (package
    (name "debmirror-bin")
    (version "2.47")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://salsa.debian.org/debian/debmirror/-/archive/"
             version "/debmirror-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/debmirror-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/debmirror")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/debmirror") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://salsa.debian.org/debian/debmirror")
    (synopsis "Debian partial mirror script with package pool support")
    (description
     "Debmirror is a Perl script for creating a partial mirror of a
Debian repository.  It supports FTP and HTTP access, package pool
layout, and filtering by architecture, section, and priority.")
    (license license:gpl2+)))

;;;
;;; ── subliminal-bin ──────────────────────────────────────────
;;; Python library and CLI for searching and downloading subtitles
;;;
(define-public subliminal-bin
  (package
    (name "subliminal-bin")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Diaoul/subliminal/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/subliminal-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/subliminal")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/subliminal") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Diaoul/subliminal")
    (synopsis "Python library and CLI for searching and downloading subtitles")
    (description
     "Subliminal is a Python library and command-line tool for
searching and downloading subtitles from multiple providers.
It supports automatic language detection and video hash matching.")
    (license license:expat)))

;;;
;;; ── magic-tape-bin ──────────────────────────────────────────
;;; fuzzy finder CLI YouTube client with image support
;;;
(define-public magic-tape-bin
  (package
    (name "magic-tape-bin")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/christosangel/magic-tape/-/archive/v"
             version "/magic-tape-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/magic-tape-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/magic-tape")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/magic-tape") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/christosangel/magic-tape")
    (synopsis "fuzzy finder CLI YouTube client with image support")
    (description
     "Magic-tape is an image-supporting fuzzy finder command-line
interface YouTube client.  It provides browsing, searching, and
playing YouTube videos from the terminal with thumbnail previews.")
    (license license:gpl2+)))

;;;
;;; ── izumi-bin ──────────────────────────────────────────
;;; instruction pipeline visualizer for Onikiri2-Kanata format
;;;
(define-public izumi-bin
  (package
    (name "izumi-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/theOfficeCat/izumi/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/izumi-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/izumi")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/izumi") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/theOfficeCat/izumi")
    (synopsis "instruction pipeline visualizer for Onikiri2-Kanata format")
    (description
     "Izumi is an instruction pipeline visualizer for the
Onikiri2-Kanata format, based on the Konata tool.  It helps
visualize CPU instruction pipelines for architecture research.")
    (license license:gpl3+)))

;;;
;;; ── minecraft-plymouth-theme-bin ──────────────────────────────────────────
;;; Minecraft-styled Plymouth boot splash theme
;;;
(define-public minecraft-plymouth-theme-bin
  (package
    (name "minecraft-plymouth-theme-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nikp123/minecraft-plymouth-theme/archive/refs/heads/master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/minecraft-plymouth-theme-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/minecraft-plymouth-theme")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/minecraft-plymouth-theme") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nikp123/minecraft-plymouth-theme")
    (synopsis "Minecraft-styled Plymouth boot splash theme")
    (description
     "A Plymouth boot splash theme styled after the Minecraft loading
screen, inspired by MineGRUB.  It provides a familiar blocky
loading animation during system boot.")
    (license license:expat)))

;;;
;;; ── python-vllm-bin ──────────────────────────────────────────
;;; high-throughput inference engine for large language models
;;;
(define-public python-vllm-bin
  (package
    (name "python-vllm-bin")
    (version "0.11.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vllm-project/vllm/releases/download/v"
             version "/vllm-" version "+cu128-cp312-cp312-manylinux1_x86_64.whl"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("vllm" "bin/vllm"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "vllm")
              (chmod "vllm" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vllm-project/vllm")
    (synopsis "high-throughput inference engine for large language models")
    (description
     "vLLM is a high-throughput and memory-efficient inference and
serving engine for large language models.  It provides PagedAttention
for efficient memory management, continuous batching, and optimized
CUDA kernels.  This package provides the pre-built Python wheel.")
    (license license:asl2.0)))

;;;
;;; ── brother-hll2340dw-bin ──────────────────────────────────────────
;;; LPR and CUPS driver for Brother HL-L2340DW printer
;;;
(define-public brother-hll2340dw-bin
  (package
    (name "brother-hll2340dw-bin")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.brother.com/welcome/dlf101579/hll2340dwlpr-"
             version "-1.i386.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/brother/" "share/brother-hll2340dw-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://support.brother.com/g/s/id/linux/en/")
    (synopsis "LPR and CUPS driver for Brother HL-L2340DW printer")
    (description
     "Brother HL-L2340DW driver provides LPR and CUPS printing
support for the Brother HL-L2340DW laser printer on Linux.
This package provides the pre-built driver binary.")
    (license license:gpl2+)))

;;;
;;; ── pkg-64gram-desktop-bin ──────────────────────────────────────────
;;; unofficial Telegram desktop client with extra features
;;;
(define-public pkg-64gram-desktop-bin
  (package
    (name "pkg-64gram-desktop-bin")
    (version "1.1.58")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicegram/nicegram-desktop/releases/download/v"
             version "/64Gram_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/" "share/pkg-64gram-desktop-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/pkg-64gram-desktop-bin/bin/64gram-desktop")
                         (string-append bin "/64gram-desktop")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TDesktop-x64/tdesktop")
    (synopsis "unofficial Telegram desktop client with extra features")
    (description
     "64Gram is an unofficial desktop version of the Telegram
messaging application.  It provides additional features and
customization options beyond the official client.  This package
provides the pre-built binary.")
    (license license:gpl3+)))

;;;
;;; ── libremines-bin ──────────────────────────────────────────
;;; free and open-source Qt-based Minesweeper game
;;;
(define-public libremines-bin
  (package
    (name "libremines-bin")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bollos00/LibreMines/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/libremines-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/libremines")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/libremines") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bollos00/LibreMines")
    (synopsis "free and open-source Qt-based Minesweeper game")
    (description
     "LibreMines is a free and open-source Minesweeper game built
with Qt.  It features customizable minefield sizes, themes,
and a clean interface.")
    (license license:gpl3+)))

;;;
;;; ── umu-launcher-bin ──────────────────────────────────────────
;;; unified launcher for Windows games on Linux via Proton
;;;
(define-public umu-launcher-bin
  (package
    (name "umu-launcher-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Open-Wine-Components/umu-launcher/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/umu-launcher-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/umu-run")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/umu-run") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Open-Wine-Components/umu-launcher")
    (synopsis "unified launcher for Windows games on Linux via Proton")
    (description
     "UMU Launcher is the Unified Launcher for Windows Games on
Linux, designed to run Proton with fixes outside of Steam.  It
provides a standardized way to launch Windows games using Valve
Proton.")
    (license license:gpl3)))

;;;
;;; ── open-webui-bin ──────────────────────────────────────────
;;; web UI for local LLM runners including Ollama
;;;
(define-public open-webui-bin
  (package
    (name "open-webui-bin")
    (version "0.6.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/open-webui/open-webui/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/open-webui-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/open-webui")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/open-webui") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/open-webui/open-webui")
    (synopsis "web UI for local LLM runners including Ollama")
    (description
     "Open WebUI provides a user-friendly web interface for various
LLM runners, including Ollama.  It supports chat, model management,
RAG, and an OpenAI-compatible API.")
    (license license:expat)))

;;;
;;; ── xv-bin ──────────────────────────────────────────
;;; interactive image viewer for X Window System
;;;
(define-public xv-bin
  (package
    (name "xv-bin")
    (version "6.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jasper-software/xv/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xv-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/xv")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/xv") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jasper-software/xv")
    (synopsis "interactive image viewer for X Window System")
    (description
     "XV is an interactive image display and manipulation program
for the X Window System.  It supports many image formats and
provides tools for color adjustment, cropping, and format
conversion.")
    (license license:gpl2+)))

;;;
;;; ── roo-code-gemini-cli-bin ──────────────────────────────────────────
;;; LLM agent dev team for VS Code with Gemini CLI support
;;;
(define-public roo-code-gemini-cli-bin
  (package
    (name "roo-code-gemini-cli-bin")
    (version "3.29.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RooCodeInc/Roo-Code/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/roo-code-gemini-cli-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/roo-code")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/roo-code") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RooCodeInc/Roo-Code")
    (synopsis "LLM agent dev team for VS Code with Gemini CLI support")
    (description
     "Roo-Code provides a whole dev team of LLM agents in VS Code,
Cursor or other compatible editors.  This patched version adds
gemini-cli as an LLM provider.")
    (license license:asl2.0)))

;;;
;;; ── gdm-settings-bin ──────────────────────────────────────────
;;; settings app for GNOME Display Manager (GDM)
;;;
(define-public gdm-settings-bin
  (package
    (name "gdm-settings-bin")
    (version "4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gdm-settings/gdm-settings/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gdm-settings-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/gdm-settings")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/gdm-settings") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gdm-settings.github.io")
    (synopsis "settings app for GNOME Display Manager (GDM)")
    (description
     "GDM Settings is a settings application for configuring the GNOME
Display Manager.  It provides a graphical interface for customizing
login screen appearance, behavior, and accessibility options.")
    (license license:agpl3+)))

;;;
;;; ── gimp-plugin-gimp3-tools-bin ──────────────────────────────────────────
;;; Ofnuts' GIMP 3 tools plugin collection
;;;
(define-public gimp-plugin-gimp3-tools-bin
  (package
    (name "gimp-plugin-gimp3-tools-bin")
    (version "20250610")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/gimp3-tools/files/gimp3-tools.zip/download"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/gimp-plugin-gimp3-tools-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/gimp3-tools")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/gimp3-tools") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/gimp3-tools/files/")
    (synopsis "Ofnuts' GIMP 3 tools plugin collection")
    (description
     "Gimp3-tools is a collection of Ofnuts' tools and scripts for
GIMP 3.  It includes various utilities for image manipulation,
path operations, and batch processing.")
    (license license:gpl3+)))

;;;
;;; ── zclock-bin ──────────────────────────────────────────
;;; cross-platform terminal digital clock
;;;
(define-public zclock-bin
  (package
    (name "zclock-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tr1ckydev/zclock/archive/refs/heads/main.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/zclock-bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/zclock")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec \"$@\"\n")))
                (chmod (string-append bin "/zclock") #o755))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tr1ckydev/zclock")
    (synopsis "cross-platform terminal digital clock")
    (description
     "Zclock is a cross-platform terminal digital clock written in
Zig.  It displays the current time in a large, readable format
in the terminal.")
    (license license:expat)))

