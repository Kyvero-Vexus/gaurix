;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413z
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (binary packages, Python packages, C/Meson builds)
;;;   - 0 re-blocked
;;;
;;; Recipes (30):
;;;   wttrbar-bin, primer-bin, tg-ws-proxy-bin, marmite-bin,
;;;   randompass-bin, pipeview-bin, aim-bin, musage-bin, tmmpr-bin,
;;;   kdownload-bin, vtf-thumbnailer-bin, overskride-bin, sfxr-qt-bin,
;;;   stakpak-bin, savestate-bin, camunda-modeler-bin, hardbore-bin,
;;;   kaizen-bin, uiua-bin, jd-gui-bin, way-edges-bin,
;;;   python-portion, python-ssh-lite, i3a, python-rtfunicode,
;;;   python-user-agent, python-asyncer, python-textual-fspicker,
;;;   xdg-desktop-portal-termfilechooser-hunkyburrito,
;;;   qdiskinfo
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages java)
  #:use-module (gnu packages wm)
  #:export (
            ;; Raw/single binary packages
            wttrbar-bin
            primer-bin
            tg-ws-proxy-bin
            marmite-bin
            randompass-bin
            pipeview-bin
            aim-bin
            musage-bin
            tmmpr-bin
            kdownload-bin
            stakpak-bin
            savestate-bin
            kaizen-bin
            uiua-bin
            way-edges-bin
            ;; Tarball binary packages
            camunda-modeler-bin
            sfxr-qt-bin
            overskride-bin
            ;; .deb binary packages
            vtf-thumbnailer-bin
            hardbore-bin
            ;; Java binary packages
            jd-gui-bin
            ;; Python packages
            python-portion
            python-ssh-lite
            i3a
            python-rtfunicode
            python-user-agent
            python-asyncer
            python-textual-fspicker
            ;; C/Meson/CMake builds
            xdg-desktop-portal-termfilechooser-hunkyburrito
            qdiskinfo
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Raw/single binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── wttrbar-bin (#7361) ──

(define-public wttrbar-bin
  (package
    (name "wttrbar-bin")
    (version "0.14.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bjesus/wttrbar/releases/download/"
                    version "/wttrbar"))
              (file-name (string-append name "-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "wttrbar-bin-" #$version)
                "bin/wttrbar"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/wttrbar")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjesus/wttrbar")
    (synopsis "weather indicator for Waybar using wttr.in")
    (description "Wttrbar is a lightweight weather indicator designed for
Waybar.  It fetches weather data from wttr.in and displays it as a
status bar module with configurable formatting and icons.")
    (license license:expat)))

;;; ── primer-bin (#7347) ──

(define-public primer-bin
  (package
    (name "primer-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/armgabrielyan/primer/releases/download/v"
                    version "/primer-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("primer" "bin/primer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/armgabrielyan/primer")
    (synopsis "step-by-step software building with AI coding agents")
    (description "Primer is a command-line tool that helps build real software
step-by-step with Claude, Codex, OpenCode, Gemini, Cursor, and other AI
coding agents.  It manages iterative development workflows.")
    (license license:expat)))

;;; ── tg-ws-proxy-bin (#2826) ──

(define-public tg-ws-proxy-bin
  (package
    (name "tg-ws-proxy-bin")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Flowseal/tg-ws-proxy/releases/download/v"
                    version "/TgWsProxy_linux_amd64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "tg-ws-proxy-bin-" #$version)
                "bin/tg-ws-proxy"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/tg-ws-proxy")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Flowseal/tg-ws-proxy")
    (synopsis "local MTProto proxy server for Telegram")
    (description "TgWsProxy is a local MTProto proxy server for partial
bypassing of Telegram loading restrictions.  It runs as a local service
providing WebSocket-based proxy connectivity for Telegram clients.")
    (license license:expat)))

;;; ── marmite-bin (#7486) ──

(define-public marmite-bin
  (package
    (name "marmite-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rochacbruno/marmite/releases/download/"
                    version "/marmite-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("marmite" "bin/marmite"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rochacbruno.github.io/marmite/")
    (synopsis "static site generator for blogs using Markdown")
    (description "Marmite is a static site generator for blogs.  It converts
Markdown files into a complete website with minimal configuration,
providing themes, RSS feeds, and tag support.")
    (license license:agpl3)))

;;; ── randompass-bin (#7570) ──

(define-public randompass-bin
  (package
    (name "randompass-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mihaigalos/randompass/releases/download/"
                    version "/randompass-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("randompass" "bin/randompass"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mihaigalos/randompass")
    (synopsis "simple static password generator")
    (description "Randompass is a simple command-line tool for generating
random passwords.  It creates cryptographically secure passwords with
configurable length and character sets.")
    (license license:expat)))

;;; ── pipeview-bin (#7587) ──

(define-public pipeview-bin
  (package
    (name "pipeview-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mihaigalos/pipeview/releases/download/"
                    version "/pipeview-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pipeview" "bin/pipeview"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mihaigalos/pipeview")
    (synopsis "command-line pipe inspection utility")
    (description "Pipeview is a command-line pipe inspection utility that
shows real-time throughput and transfer statistics for data flowing
through a Unix pipe, similar to pv but with additional features.")
    (license license:expat)))

;;; ── aim-bin (#7595) ──

(define-public aim-bin
  (package
    (name "aim-bin")
    (version "1.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mihaigalos/aim/releases/download/"
                    version "/aim-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aim" "bin/aim"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mihaigalos/aim")
    (synopsis "command-line download and upload tool with resume")
    (description "Aim is a command-line download and upload tool with resume
support.  It provides fast file transfers with progress indication,
parallel connections, and automatic retry on failure.")
    (license license:expat)))

;;; ── musage-bin (#7578) ──

(define-public musage-bin
  (package
    (name "musage-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mihaigalos/musage/releases/download/"
                    version "/musage-" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("musage" "bin/musage"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mihaigalos/musage")
    (synopsis "command-line memory usage information tool")
    (description "Musage is a command-line tool for displaying memory usage
information.  It shows per-process memory consumption with visual
indicators and sorting options.")
    (license license:expat)))

;;; ── tmmpr-bin (#4450) ──

(define-public tmmpr-bin
  (package
    (name "tmmpr-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tanciaku/tmmpr/releases/download/v"
                    version "/tmmpr-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmmpr" "bin/tmmpr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tanciaku/tmmpr")
    (synopsis "terminal mind mapper")
    (description "Tmmpr is a terminal-based mind mapping application.  It
provides a text user interface for creating, editing, and navigating
mind maps directly from the terminal.")
    (license license:expat)))

;;; ── kdownload-bin (#7425) ──

(define-public kdownload-bin
  (package
    (name "kdownload-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/compiledkernel-idk/kdownload/releases/download/v"
                    version "/kdownload-x86_64-linux"))
              (file-name (string-append name "-" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "kdownload-bin-" #$version)
                "bin/kdownload"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/kdownload")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/compiledkernel-idk/kdownload")
    (synopsis "blazing-fast async segmented file downloader")
    (description "Kdownload is a fast asynchronous segmented file downloader.
It splits downloads into parallel segments for improved throughput and
supports resuming interrupted transfers.")
    (license license:expat)))

;;; ── stakpak-bin (#8392) ──

(define-public stakpak-bin
  (package
    (name "stakpak-bin")
    (version "0.3.73")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stakpak/agent/releases/download/v"
                    version "/stakpak-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stakpak" "bin/stakpak"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://stakpak.dev")
    (synopsis "Terminal-native DevOps agent in Rust")
    (description "Stakpak is a terminal-native DevOps agent written in Rust.
It can run commands, edit files, search documentation, generate
infrastructure-as-code, and manage cloud resources from the terminal.")
    (license license:asl2.0)))

;;; ── savestate-bin (#15525) ──

(define-public savestate-bin
  (package
    (name "savestate-bin")
    (version "1.4.6c")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Matteo842/SaveState/releases/download/"
                    version "/SaveState-" version "-Linux.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("SaveState" "bin/savestate"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-q" (assoc-ref inputs "source"))))
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/savestate")
                          #o755))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Matteo842/SaveState")
    (synopsis "game save backup manager with Steam and emulator support")
    (description "SaveState is a versatile game save backup manager featuring
Steam detection, Minecraft support, drag and drop, desktop shortcuts, and
emulator compatibility.  It helps protect game progress with automated
and manual backups.")
    (license license:gpl3)))

;;; ── kaizen-bin (#7697) ──

(define-public kaizen-bin
  (package
    (name "kaizen-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/serene-brew/kaizen/releases/download/v"
                    version "/Kaizen_v" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kaizen" "bin/kaizen"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/serene-brew/kaizen")
    (synopsis "terminal-based anime streaming and browsing tool")
    (description "Kaizen is a terminal-based anime streaming and browsing tool.
It provides a TUI for searching, browsing, and streaming anime with
integration into mpv for playback.")
    (license license:expat)))

;;; ── uiua-bin (#7205) ──

(define-public uiua-bin
  (package
    (name "uiua-bin")
    (version "0.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uiua-lang/uiua/releases/download/"
                    version "/uiua-bin-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("uiua" "bin/uiua"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-q" (assoc-ref inputs "source")))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.uiua.org/")
    (synopsis "stack-based array programming language")
    (description "Uiua is a stack-based array programming language with a
focus on simplicity, beauty, and tacit code.  It features a unique
character-based syntax and powerful array operations for data processing.")
    (license license:expat)))

;;; ── way-edges-bin (#7579) ──

(define-public way-edges-bin
  (package
    (name "way-edges-bin")
    (version "0.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/way-edges/way-edges/releases/download/"
                    version "/way-edges_linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("target/release/way-edges" "bin/way-edges"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/way-edges/way-edges")
    (synopsis "hidden widget on screen edges for Wayland")
    (description "Way-edges provides hidden widgets on screen edges for
Wayland compositors.  It supports customizable edge panels with buttons,
sliders, and other interactive elements that appear on mouse hover.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Tarball binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── camunda-modeler-bin (#7327) ──

(define-public camunda-modeler-bin
  (package
    (name "camunda-modeler-bin")
    (version "5.45.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/camunda/camunda-modeler/releases/download/v"
                    version "/camunda-modeler-" version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/camunda-modeler/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/camunda/camunda-modeler")
    (synopsis "integrated modeling solution for BPMN, DMN and Forms")
    (description "Camunda Modeler is an integrated modeling solution for
BPMN, DMN, and Forms based on bpmn.io.  It provides a desktop application
for designing business process workflows, decision tables, and forms.")
    (license license:expat)))

;;; ── sfxr-qt-bin (#7455) ──

(define-public sfxr-qt-bin
  (package
    (name "sfxr-qt-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/agateau/sfxr-qt/releases/download/"
                    version "/sfxr-qt-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/agateau/sfxr-qt")
    (synopsis "retro game sound effects generator with Qt interface")
    (description "SFXR-Qt is a Qt port of SFXR, a sound effect generator
for creating retro gaming sound effects.  It provides a graphical
interface for generating, tweaking, and exporting 8-bit style sounds.")
    (license license:expat)))

;;; ── overskride-bin (#7527) ──

(define-public overskride-bin
  (package
    (name "overskride-bin")
    (version "0.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kaii-lb/overskride/releases/download/v"
                    version "/overskride.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kaii-lb/overskride")
    (synopsis "simple yet powerful Bluetooth client")
    (description "Overskride is a simple yet powerful Bluetooth client built
with GTK4 and libadwaita.  It provides a clean interface for managing
Bluetooth connections, pairing devices, and controlling audio devices.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; .deb binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── vtf-thumbnailer-bin (#7220) ──

(define-public vtf-thumbnailer-bin
  (package
    (name "vtf-thumbnailer-bin")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/craftablescience/vtf-thumbnailer/releases/download/v"
                    version "/VTF-Thumbnailer-" version "-Linux.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/craftablescience/vtf-thumbnailer")
    (synopsis "VTF file thumbnail previews for Linux file managers")
    (description "VTF-Thumbnailer adds thumbnail previews for Valve Texture
Format files in Linux file managers.  It generates preview images for
VTF files used in Source engine games like Half-Life 2 and Portal.")
    (license license:expat)))

;;; ── hardbore-bin (#3713) ──

(define-public hardbore-bin
  (package
    (name "hardbore-bin")
    (version "1.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FrogSnot/HardBore/releases/download/v"
                    version "/hardbore_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FrogSnot/HardBore")
    (synopsis "high-performance file manager for Linux")
    (description "HardBore is a high-performance file manager for Linux built
with Tauri.  It provides a modern graphical interface for file browsing,
management, and organization with support for tabs and split views.")
    (license license:agpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Java binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── jd-gui-bin (#7760) ──

(define-public jd-gui-bin
  (package
    (name "jd-gui-bin")
    (version "1.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/QuentiumYT/jd-gui/releases/download/v"
                    version "/jd-gui-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "jd-gui-bin-" #$version)
                ,(string-append "share/java/jd-gui-" #$version ".jar")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/jd-gui-"
                                              #$version ".jar")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/jd-gui")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 jar)))
                     (chmod (string-append bin "/jd-gui") #o755)))))))
    (inputs (list `(,openjdk "jdk")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/QuentiumYT/jd-gui")
    (synopsis "standalone Java decompiler GUI")
    (description "JD-GUI is a standalone graphical utility that displays Java
source code from class files.  It provides a convenient way to browse
and decompile Java bytecode for code analysis and review.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-portion (#7374) ──

(define-public python-portion
  (package
    (name "python-portion")
    (version "2.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AlexandreDecan/portion")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-sortedcontainers))
    (synopsis "data structure and operations for intervals in Python")
    (description
     "Portion is a Python library providing data structures and operations
for intervals.  It supports open, closed, and half-open intervals with set
operations like union, intersection, and complement, as well as
interval dictionaries.")
    (home-page "https://github.com/AlexandreDecan/portion")
    (license license:lgpl3+)))

;;; ── python-ssh-lite (#7432) ──

(define-public python-ssh-lite
  (package
    (name "python-ssh-lite")
    (version "1.9")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ssh-lite" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-graphviz))
    (synopsis "easy encapsulation for paramiko SSH operations")
    (description
     "SSH-Lite is a Python library providing a simplified interface for
common SSH operations using paramiko.  It wraps the paramiko library with
an easy-to-use API for executing remote commands, transferring files,
and managing SSH connections.")
    (home-page "https://github.com/rainydew/ssh-lite")
    (license license:asl2.0)))

;;; ── i3a (#11705) ──

(define-public i3a
  (package
    (name "i3a")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "i3a" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-i3ipc))
    (synopsis "automation scripts for i3 and sway window managers")
    (description
     "I3a is a set of Python scripts for automation of i3 and sway window
manager layouts.  It provides commands for automatic window placement,
workspace management, and layout control via i3ipc.")
    (home-page "https://pypi.org/project/i3a")
    (license license:gpl3)))

;;; ── python-rtfunicode (#7577) ──

(define-public python-rtfunicode
  (package
    (name "python-rtfunicode")
    (version "2.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "rtfunicode" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "encoder for unicode to RTF 1.5 command sequences")
    (description
     "Rtfunicode is a Python library that encodes Unicode strings into RTF
1.5 compatible command sequences.  It handles the conversion of Unicode
characters to their RTF escape representations for document generation.")
    (home-page "https://pypi.org/project/rtfunicode")
    (license license:bsd-2)))

;;; ── python-user-agent (#7576) ──

(define-public python-user-agent
  (package
    (name "python-user-agent")
    (version "0.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "user_agent" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-six))
    (synopsis "random valid web user-agent header generator")
    (description
     "User-agent is a Python library for generating random, valid web
user-agent headers.  It produces realistic browser user-agent strings
for various browsers and platforms, useful for web scraping and testing.")
    (home-page "https://github.com/lorien/user_agent")
    (license license:expat)))

;;; ── python-asyncer (#7532) ──

(define-public python-asyncer
  (package
    (name "python-asyncer")
    (version "0.0.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tiangolo/asyncer")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-pdm-backend))
    (propagated-inputs (list python-anyio python-typing-extensions))
    (synopsis "async and await utilities focused on developer experience")
    (description
     "Asyncer is a Python library providing utilities for async and await,
focused on developer experience.  It simplifies common async patterns
with a clean API for running async functions from sync code and managing
async tasks.")
    (home-page "https://github.com/tiangolo/asyncer")
    (license license:expat)))

;;; ── python-textual-fspicker (#3707) ──

(define-public python-textual-fspicker
  (package
    (name "python-textual-fspicker")
    (version "0.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/davep/textual-fspicker")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-textual))
    (synopsis "file system picker widget for Textual TUI framework")
    (description
     "Textual-fspicker provides file system picker widgets for the Textual
TUI framework.  It includes file open, file save, and directory selection
dialogs that can be integrated into Textual applications.")
    (home-page "https://github.com/davep/textual-fspicker")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/Meson/CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── xdg-desktop-portal-termfilechooser-hunkyburrito (#11537) ──

(define-public xdg-desktop-portal-termfilechooser-hunkyburrito
  (package
    (name "xdg-desktop-portal-termfilechooser-hunkyburrito")
    (version "1.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list xdg-desktop-portal libinih))
    (synopsis "xdg-desktop-portal backend for terminal file choosers")
    (description
     "This is an xdg-desktop-portal backend that launches a terminal file
chooser for file selection dialogs.  It supports lf, nnn, ranger, vifm,
yazi, and other terminal file managers as backends for the portal
file chooser interface.")
    (home-page
     "https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser")
    (license license:expat)))

;;; ── qdiskinfo (#11676) ──

(define-public qdiskinfo
  (package
    (name "qdiskinfo")
    (version "0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/edisionnano/QDiskInfo")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DQT_VERSION_MAJOR=6"
                   "-DENABLE_TRANSLATIONS=ON")))
    (native-inputs (list pkg-config))
    (inputs (list qtbase qtsvg smartmontools))
    (synopsis "CrystalDiskInfo alternative for Linux")
    (description
     "QDiskInfo is a CrystalDiskInfo alternative for Linux.  It provides
a graphical interface for viewing detailed disk health information using
S.M.A.R.T. data, including temperature, power-on hours, and error counts.")
    (home-page "https://github.com/edisionnano/QDiskInfo")
    (license license:gpl3)))
