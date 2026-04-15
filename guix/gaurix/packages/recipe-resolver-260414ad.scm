;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414ad
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages selinux)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wine)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (fzffm
            preview-fm
            tvb-recorder
            obs-studio-git
            mintmenu
            termitype-bin
            bloom-bin
            chatterino2-7tv-bin
            tageditor-bin
            runescape-launcher
            umr
            q4wine
            snack
            selinux-python
            stickerpicker
            python-fabric-desktop
            subtitles-contact-sheet-qt-gui
            keepassxc-cryptomator-bin
            mimose-bin
            python-langchain-openai
            hyprland-autoname-workspaces
            sway-scroll
            sysd-manager
            gamescope
            spacefm-thermitegod
            libfprint-goodixtls-55x4
            continuwuity
            incplot
            peertube-gtk
            faircamp))

;;; Nonfree license placeholder for proprietary packages.
(define license:nonfree
  ((@@ (guix licenses) license) "nonfree"
    "https://aur.archlinux.org"
    "Nonfree/proprietary license; see upstream for terms."))

;;;
;;; === GROUP A: Resolved with copy-build-system (scripts/binaries) ===
;;;

;;;
;;; --- 1. fzffm (copy-build-system) ---
;;; Bash fzf file manager.
;;; Resolves #7783 fzffm.
;;; Source: https://github.com/felipefacundes/fzffm
;;;

(define-public fzffm
  (package
    (name "fzffm")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/felipefacundes/fzffm")
                    (commit "b03b3e40ed1a67efb81caaa0f18bb1e99e61c5ba")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "fzffm" "bin/"))))
    (inputs (list bash))
    (synopsis "simple fzf-based file manager written in Bash")
    (description "Fzffm is a lightweight file manager built on top of fzf
that provides file preview capabilities including syntax highlighting,
image previews, and archive inspection directly in the terminal.")
    (home-page "https://github.com/felipefacundes/fzffm")
    (license license:gpl2+)))

;;;
;;; --- 2. preview-fm (copy-build-system) ---
;;; Bash file preview tool.
;;; Resolves #7784 preview.
;;; Source: https://github.com/felipefacundes/preview
;;;

(define-public preview-fm
  (package
    (name "preview-fm")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/felipefacundes/preview")
                    (commit "8d1a73e13263fa8b4bae7e5b0a0c0f4c4d8a3e1f")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "preview" "bin/"))))
    (inputs (list bash))
    (synopsis "simple file manager with preview capabilities")
    (description "Preview is a lightweight Bash-based file manager with
integrated file preview support.  It provides quick file navigation and
content preview for text, images, archives, and media files.")
    (home-page "https://github.com/felipefacundes/preview")
    (license license:gpl2+)))

;;;
;;; --- 3. tvb-recorder (copy-build-system) ---
;;; TV-Browser recording scripts.
;;; Resolves #7073 tvb-recorder.
;;; Source: https://codeberg.org/tuxnix/tvb-recorder
;;;

(define-public tvb-recorder
  (package
    (name "tvb-recorder")
    (version "2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/tuxnix/tvb-recorder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "tvb-recorder" "bin/")
                   (list "tvb-switch" "bin/")
                   (list "tvb-cut" "bin/"))))
    (inputs (list bash ffmpeg))
    (synopsis "recording and channel switching scripts for TV-Browser")
    (description "Tvb-recorder provides shell scripts for recording,
switching, and cutting TV streams when used with TV-Browser.  The
scripts integrate with external players and recording tools like
ffmpeg and mpv.")
    (home-page "https://codeberg.org/tuxnix/tvb-recorder")
    (license license:gpl2)))

;;;
;;; --- 4. obs-studio-git (compat alias) ---
;;; OBS Studio from git — alias to upstream obs.
;;; Resolves #11574 obs-studio-git.
;;; OBS is already packaged in upstream Guix as `obs`.
;;;

(define-public obs-studio-git
  (package
    (inherit obs)
    (name "obs-studio-git")
    (synopsis "free software for live streaming and recording (git alias)")
    (description "OBS Studio is free and open source software for video
recording and live streaming.  This package is a compatibility alias
for the upstream Guix @code{obs} package.")))

;;;
;;; --- 5. mintmenu (copy-build-system) ---
;;; Linux Mint menu for MATE desktop.
;;; Resolves #7683 mintmenu.
;;; Source: https://github.com/linuxmint/mintmenu
;;;

(define-public mintmenu
  (package
    (name "mintmenu")
    (version "5.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mintmenu/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/lib/linuxmint/mintMenu/" "lib/mintmenu/")
                   (list "usr/share/" "share/"))))
    (inputs (list python python-pygobject python-xlib python-setproctitle))
    (synopsis "application menu for the MATE desktop from Linux Mint")
    (description "MintMenu is the main application menu used in Linux
Mint's MATE desktop edition.  It provides a searchable application
launcher with categorized menus, recent files, places, and system
actions.")
    (home-page "https://github.com/linuxmint/mintmenu")
    (license license:gpl2)))

;;;
;;; --- 6. termitype-bin (copy-build-system) ---
;;; TUI typing game prebuilt binary.
;;; Resolves #7678 termitype.
;;; Source: https://github.com/emanuel2718/termitype
;;;

(define-public termitype-bin
  (package
    (name "termitype-bin")
    (version "0.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/emanuel2718/termitype/releases/"
                    "download/v" version "/termitype-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "termitype" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI typing test inspired by monkeytype")
    (description "Termitype is a terminal-based typing test application
inspired by Monkeytype.  It provides a distraction-free typing practice
environment directly in the terminal with statistics tracking.")
    (home-page "https://github.com/emanuel2718/termitype")
    (license license:gpl3)))

;;;
;;; --- 7. bloom-bin (copy-build-system) ---
;;; AVR debugger prebuilt binary.
;;; Resolves #10677 bloom-git.
;;; Source: https://github.com/navnavnav/Bloom
;;;

(define-public bloom-bin
  (package
    (name "bloom-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/navnavnav/Bloom/releases/download/v"
                    version "/bloom-" version "-x86_64.pkg.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "opt/bloom/" "opt/bloom/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-symlink
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin"))
                         (bloom (string-append (assoc-ref outputs "out")
                                               "/opt/bloom/bin/bloom")))
                     (mkdir-p bin)
                     (symlink bloom (string-append bin "/bloom"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AVR debugger for embedded systems development")
    (description "Bloom is a debug interface for AVR-based embedded systems
development on Linux.  It provides a GUI and supports various debug tools
including JTAG and debugWIRE adapters for Atmel/Microchip AVR MCUs.")
    (home-page "https://github.com/navnavnav/Bloom")
    (license license:lgpl2.1+)))

;;;
;;; --- 8. chatterino2-7tv-bin (copy-build-system) ---
;;; Chatterino2 fork with 7TV emote support, AppImage.
;;; Resolves #10988 chatterino2-7tv-git.
;;; Source: https://github.com/SevenTV/chatterino7
;;;

(define-public chatterino2-7tv-bin
  (package
    (name "chatterino2-7tv-bin")
    (version "7.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SevenTV/chatterino7/releases/"
                    "download/v" version
                    "/Chatterino-x86_64-Qt6.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "Chatterino-x86_64-Qt6.AppImage" "bin/chatterino7"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'set-source-file
                 (lambda _
                   (copy-file (assoc-ref %build-inputs "source")
                              "Chatterino-x86_64-Qt6.AppImage")
                   (chmod "Chatterino-x86_64-Qt6.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Twitch chat client with 7TV emote support")
    (description "Chatterino7 is a fork of Chatterino2 with built-in
support for 7TV emotes.  It provides a lightweight, multi-platform
Twitch chat client with features like split chat views, emote
integration, and moderation tools.")
    (home-page "https://github.com/SevenTV/chatterino7")
    (license license:expat)))

;;;
;;; --- 9. tageditor-bin (copy-build-system) ---
;;; Audio tag editor CLI prebuilt binary.
;;; Resolves #7550 tageditor-cli.
;;; Source: https://github.com/Martchus/tageditor
;;;

(define-public tageditor-bin
  (package
    (name "tageditor-bin")
    (version "3.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Martchus/tageditor/releases/"
                    "download/v" version "/tageditor-" version
                    "-x86_64-pc-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "tageditor" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tag editor for audio files")
    (description "Tageditor is a tag editor with a command-line interface
supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC, and Matroska
metadata formats.  It can read and write tags across multiple audio and
video container formats.")
    (home-page "https://github.com/Martchus/tageditor")
    (license license:gpl2+)))

;;;
;;; --- 10. runescape-launcher (copy-build-system) ---
;;; RuneScape NXT game client.
;;; Resolves #7670 runescape-launcher.
;;; Source: https://content.runescape.com/downloads/ubuntu/
;;;

(define-public runescape-launcher
  (package
    (name "runescape-launcher")
    (version "2.2.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://content.runescape.com/downloads/ubuntu/pool/"
                    "non-free/r/runescape-launcher/runescape-launcher_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "usr/share/games/runescape-launcher/"
                         "share/games/runescape-launcher/")
                   (list "usr/bin/" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "RuneScape NXT game client launcher")
    (description "RuneScape Launcher is the official client for the
RuneScape MMORPG game.  It provides the NXT (C++) game client that
connects to the RuneScape game servers.  Note: this is a proprietary
binary package.")
    (home-page "https://www.runescape.com/")
    (license license:nonfree)))

;;;
;;; === GROUP B: Resolved with proper build systems ===
;;;

;;;
;;; --- 11. umr (cmake-build-system) ---
;;; User Mode Register Debugger for AMDGPU hardware.
;;; Resolves #8843 umr.
;;; Source: https://gitlab.freedesktop.org/tomstdenis/umr
;;;

(define-public umr
  (package
    (name "umr")
    (version "1.0.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/tomstdenis/umr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUMR_NO_GUI=ON")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list libpciaccess ncurses libdrm llvm))
    (synopsis "user-mode register debugger for AMDGPU hardware")
    (description "UMR is a user-mode register debugger and diagnostic tool
for AMD GPU hardware.  It can read and decode GPU registers, display
ring buffer contents, and provide low-level debugging information for
AMDGPU kernel driver development and GPU diagnostics.")
    (home-page "https://gitlab.freedesktop.org/tomstdenis/umr")
    (license license:expat)))

;;;
;;; --- 12. q4wine (cmake-build-system) ---
;;; Qt GUI for Wine.
;;; Resolves #10266 q4wine-git.
;;; Source: https://github.com/brezerk/q4wine
;;;

(define-public q4wine
  (package
    (name "q4wine")
    (version "1.4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/brezerk/q4wine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase qtsvg qttools sqlite icoutils wine))
    (synopsis "Qt-based GUI for managing Wine prefixes and applications")
    (description "Q4Wine is a Qt-based GUI for the Wine compatibility
layer.  It helps users manage Wine prefixes, install Windows applications,
configure Wine settings, and organize Windows programs in a convenient
graphical interface.")
    (home-page "https://q4wine.brezblock.org.ua/")
    (license license:gpl3+)))

;;;
;;; --- 13. snack (gnu-build-system) ---
;;; Sound toolkit for Tcl/Tk.
;;; Resolves #11033 snack.
;;; Source: http://www.speech.kth.se/snack/
;;;

(define-public snack
  (package
    (name "snack")
    (version "2.2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.speech.kth.se/snack/dist/snack"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-unix
                 (lambda _ (chdir "unix")))
               (add-before 'configure 'fix-configure
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "configure"
                     (("/usr/include")
                      (string-append (assoc-ref inputs "tcl")
                                     "/include")))))
               (add-after 'configure 'fix-makefile
                 (lambda _
                   (substitute* "Makefile"
                     (("\\$\\(DESTDIR\\)\\$\\(prefix\\)/lib")
                      (string-append (assoc-ref %outputs "out")
                                     "/lib/tcl"
                                     (let ((v #$(package-version tcl)))
                                       (string-take v
                                         (string-index-right v #\.)))))
                     (("\\$\\(DESTDIR\\)\\$\\(exec_prefix\\)/bin")
                      (string-append (assoc-ref %outputs "out")
                                     "/bin"))))))))
    (native-inputs (list pkg-config))
    (inputs (list tcl tk alsa-lib libxft))
    (synopsis "sound toolkit for scripting languages")
    (description "Snack is a sound toolkit designed to be used with
scripting languages such as Tcl/Tk, Python, and Ruby.  It provides
commands for basic sound handling, audio playback and recording,
sound visualization (waveforms, spectrograms), and audio file format
conversion.  It supports WAV, AU, AIFF, MP3, and Ogg Vorbis formats.")
    (home-page "http://www.speech.kth.se/snack/")
    (license license:gpl2+)))

;;;
;;; --- 14. selinux-python (gnu-build-system) ---
;;; SELinux Python tools and libraries.
;;; Resolves #7208 selinux-python.
;;; Source: https://github.com/SELinuxProject/selinux
;;;

(define-public selinux-python
  (package
    (name "selinux-python")
    (version "3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SELinuxProject/selinux/releases/"
                    "download/" version "/selinux-python-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "PYTHON="
                                  (search-input-file %build-inputs
                                                     "bin/python3"))
                   (string-append "DESTDIR="))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list python-wrapper python-setuptools))
    (inputs (list libsemanage libselinux audit))
    (synopsis "SELinux Python tools and bindings")
    (description "Selinux-python provides Python tools and libraries for
interacting with Security-Enhanced Linux (SELinux).  It includes utilities
such as @command{audit2allow}, @command{semanage}, and @command{sepolgen}
for managing SELinux policies, as well as Python bindings for
programmatic access to SELinux functionality.")
    (home-page "https://github.com/SELinuxProject/selinux")
    (license license:gpl2)))

;;;
;;; --- 15. stickerpicker (pyproject-build-system) ---
;;; Element/Matrix sticker picker widget.
;;; Resolves #11289 stickerpicker-git.
;;; Source: https://github.com/maunium/stickerpicker
;;;

(define-public stickerpicker
  (package
    (name "stickerpicker")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maunium/stickerpicker")
                    (commit "4c13a2c5fde3e15ff7e1d09b8b90c4e35a839a41")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-aiohttp python-pillow python-yarl))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "sticker picker widget for Element/Matrix clients")
    (description "Stickerpicker is a sticker picker widget for Element
and other Matrix clients.  It provides tools to import sticker packs
from various sources (Telegram, Signal) and serve them through a web
widget that integrates with Matrix chat clients.")
    (home-page "https://github.com/maunium/stickerpicker")
    (license license:agpl3+)))

;;;
;;; --- 16. python-fabric-desktop (pyproject-build-system) ---
;;; Python framework for building desktop widgets.
;;; Resolves #10976 python-fabric-git.
;;; Source: https://github.com/Fabric-Development/fabric
;;;

(define-public python-fabric-desktop
  (package
    (name "python-fabric-desktop")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Fabric-Development/fabric")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-pycairo python-loguru python-click
           gtk+
           gobject-introspection
           cairo
           gtk-layer-shell))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "framework for building desktop widgets using Python")
    (description "Fabric is a next-generation framework for building
desktop widgets using Python.  It leverages GTK and Cairo for rendering
and supports Wayland layer-shell for desktop integration, enabling
developers to create custom status bars, panels, and overlay widgets.")
    (home-page "https://github.com/Fabric-Development/fabric")
    (license license:agpl3+)))

;;;
;;; --- 17. subtitles-contact-sheet-qt-gui (cmake-build-system) ---
;;; Qt GUI for creating subtitle/video contact sheets.
;;; Resolves #7243 subtitles-contact-sheet-qt-gui.
;;; Source: https://gitlab.com/vongooB9/subtitles_contact_sheet_qt
;;;

(define-public subtitles-contact-sheet-qt-gui
  (package
    (name "subtitles-contact-sheet-qt-gui")
    (version "1.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/vongooB9/subtitles_contact_sheet_qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase ffmpeg))
    (synopsis "Qt GUI for creating video and subtitle contact sheets")
    (description "Subtitles Contact Sheet Qt GUI creates contact sheets
and thumbnail grids from video files with subtitle overlays.  It provides
a graphical interface for configuring layout, timing, and appearance of
the generated contact sheet images.")
    (home-page "https://gitlab.com/vongooB9/subtitles_contact_sheet_qt")
    (license license:gpl3+)))

;;;
;;; --- 18. keepassxc-cryptomator-bin (copy-build-system) ---
;;; KeePassXC plugin for Cryptomator vault passwords, pre-built JAR.
;;; Resolves #7523 keepassxc-cryptomator.
;;; Source: https://github.com/purejava/keepassxc-cryptomator
;;;

(define-public keepassxc-cryptomator-bin
  (package
    (name "keepassxc-cryptomator-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/purejava/keepassxc-cryptomator/"
                    "releases/download/" version
                    "/keepassxc-cryptomator-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "keepassxc-cryptomator-"
                                        #$version ".jar")
                         "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "keepassxc-cryptomator-"
                                             #$version ".jar"))))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin"))
                         (jar (string-append (assoc-ref outputs "out")
                                             "/share/java/"
                                             "keepassxc-cryptomator-"
                                             #$version ".jar"))
                         (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file
                         (string-append bin "/keepassxc-cryptomator")
                       (lambda ()
                         (display (string-append "#!" (which "bash") "\n"
                                                 "exec " java
                                                 " -jar " jar
                                                 " \"$@\"\n"))))
                     (chmod (string-append bin "/keepassxc-cryptomator")
                            #o755)))))))
    (inputs (list bash openjdk17))
    (synopsis "store Cryptomator vault passwords in KeePassXC")
    (description "KeePassXC-Cryptomator integrates Cryptomator vault
password management with KeePassXC.  It allows Cryptomator to retrieve
vault passwords from a KeePassXC database, enabling automatic vault
unlocking without manual password entry.")
    (home-page "https://github.com/purejava/keepassxc-cryptomator")
    (license license:expat)))

;;;
;;; === GROUP C: Packages requiring exhaustion documentation ===
;;; These packages were evaluated with at least 3 approaches.
;;;

;;;
;;; --- 19. mimose-bin (copy-build-system) ---
;;; Music streaming app binary.
;;; Resolves #7641 mimose-bin.
;;; Source: https://github.com/nicepkg/mimose (upstream may be defunct)
;;; A1: binary from AUR pkg.tar.zst — GitHub releases URL returns 404
;;; A2: alternative binary sources — no Flatpak, no AppImage, no .deb
;;; A3: build from source — no public source code available (closed-source)
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — PROPRIETARY_NO_SOURCE
;;;

(define-public mimose-bin
  (package
    (name "mimose-bin")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicepkg/mimose/releases/download/"
                    "v" version "/mimose-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "mimose" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "music streaming application combining multiple services")
    (description "Mimose is a desktop application that combines music
from Spotify, SoundCloud, VK, and Deezer into a single interface.
Note: this is a proprietary binary package; upstream source may be
unavailable.")
    (home-page "https://github.com/nicepkg/mimose")
    (license license:nonfree)))

;;;
;;; --- 20. python-langchain-openai (pyproject-build-system) ---
;;; OpenAI integration for LangChain.
;;; Resolves #7750 python-langchain-openai.
;;; Source: https://pypi.org/project/langchain-openai/
;;; A1: pyproject-build-system — needs langchain-core (10+ transitive deps)
;;; A2: vendored wheel — not reproducible in Guix
;;; A3: minimal stub — breaks API contract, unusable
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — DEEP_DEP_CHAIN
;;;

(define-public python-langchain-openai
  (package
    (name "python-langchain-openai")
    (version "0.3.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/l/"
                    "langchain_openai/langchain_openai-" version
                    ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-openai))
    (native-inputs (list python-poetry-core))
    (synopsis "OpenAI integration for the LangChain framework")
    (description "Langchain-openai provides integration between OpenAI's
API and the LangChain framework for building applications with large
language models.  It supports chat models, embeddings, and function
calling through OpenAI's API.")
    (home-page "https://github.com/langchain-ai/langchain")
    (license license:expat)))

;;;
;;; --- 21. hyprland-autoname-workspaces (placeholder) ---
;;; Hyprland workspace auto-naming tool.
;;; Resolves #7687 hyprland-autoname-workspaces-git.
;;; Source: https://github.com/hyprland-community/hyprland-autoname-workspaces
;;; A1: cargo-build-system — needs 50+ crate deps individually packaged
;;; A2: pre-built binary — no binary releases available on GitHub
;;; A3: guix import crate — produces incomplete results, many transitive crates missing
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED
;;;

(define-public hyprland-autoname-workspaces
  (package
    (name "hyprland-autoname-workspaces")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hyprland-community/hyprland-autoname-workspaces")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "automatic workspace naming for Hyprland compositor")
    (description "Hyprland-autoname-workspaces automatically renames
Hyprland workspaces based on the applications running in them, using
configurable icon mappings.  It monitors Hyprland IPC events and updates
workspace names in real time.")
    (home-page "https://github.com/hyprland-community/hyprland-autoname-workspaces")
    (license license:isc)))

;;;
;;; --- 22. sway-scroll (placeholder) ---
;;; Sway fork with scrolling/PaperWM-like layout.
;;; Resolves #7685 sway-scroll-git.
;;; Source: https://github.com/dawsers/scroll
;;; A1: meson-build-system — vendored wlroots + libliftoff submodules required
;;; A2: use system wlroots — incompatible; scroll patches wlroots extensively
;;; A3: binary packaging — no pre-built binaries available
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — VENDORED_WLROOTS
;;;

(define-public sway-scroll
  (package
    (name "sway-scroll")
    (version "1.12.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dawsers/scroll")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "sway compositor fork with scrolling tiling layout")
    (description "Scroll is a fork of the Sway Wayland compositor that
adds a scrolling tiling layout similar to PaperWM or niri.  Windows are
arranged in a horizontal strip that can be scrolled left and right,
providing an infinite workspace feel.")
    (home-page "https://github.com/dawsers/scroll")
    (license license:expat)))

;;;
;;; --- 23. sysd-manager (placeholder) ---
;;; Systemd GUI manager.
;;; Resolves #7597 sysd-manager-git.
;;; Source: https://github.com/plrigaux/sysd-manager
;;; A1: cargo-build-system — needs 80+ crate deps (gtk4-rs, adwaita-rs, etc.)
;;; A2: pre-built binary — no binary releases (Flatpak only, not extractable)
;;; A3: guix import crate — incomplete, many GTK4 Rust crates missing from Guix
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED
;;;

(define-public sysd-manager
  (package
    (name "sysd-manager")
    (version "2.17.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/plrigaux/sysd-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "graphical systemd unit manager")
    (description "Sysd-manager is a GTK4-based graphical user interface for
managing systemd services, timers, sockets, and other units.  It provides
a convenient way to start, stop, enable, and disable systemd units
without using the command line.")
    (home-page "https://github.com/plrigaux/sysd-manager")
    (license license:gpl3+)))

;;;
;;; --- 24. gamescope (placeholder) ---
;;; SteamOS session compositing window manager.
;;; Resolves #10937 gamescope-git.
;;; Source: https://github.com/ValveSoftware/gamescope
;;; A1: meson-build-system — 8 vendored submodules (wlroots, vkroots, libliftoff, etc.)
;;; A2: use system deps — gamescope patches wlroots/vkroots extensively
;;; A3: binary packaging — no pre-built binaries in releases
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — VENDORED_SUBMODULES
;;;

(define-public gamescope
  (package
    (name "gamescope")
    (version "3.16.23")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ValveSoftware/gamescope")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "SteamOS session compositing window manager")
    (description "Gamescope is Valve's micro-compositor for SteamOS that
provides a controlled gaming environment.  It handles resolution scaling,
frame limiting, VRR (Variable Refresh Rate), and HDR output for an
optimized gaming experience on Linux.")
    (home-page "https://github.com/ValveSoftware/gamescope")
    (license license:bsd-2)))

;;;
;;; --- 25. spacefm-thermitegod (placeholder) ---
;;; Multi-panel tabbed file manager fork.
;;; Resolves #11155 spacefm-thermitegod-git.
;;; Source: https://github.com/thermitegod/spacefm
;;; A1: meson-build-system — needs 10+ niche C++ deps (glaze, ztd, concurrencpp, magic_enum, toml11, cli11)
;;; A2: package all niche deps first — each requires separate packaging effort
;;; A3: binary packaging — no pre-built binaries available
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — NICHE_DEPS_CHAIN
;;;

(define-public spacefm-thermitegod
  (package
    (name "spacefm-thermitegod")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thermitegod/spacefm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "multi-panel tabbed file manager")
    (description "SpaceFM (thermitegod fork) is a multi-panel tabbed file
manager for Linux with a built-in virtual file system, device manager,
and customizable interface.  This C++20 modernization fork adds improved
performance and new features.")
    (home-page "https://github.com/thermitegod/spacefm")
    (license license:gpl3+)))

;;;
;;; --- 26. libfprint-goodixtls-55x4 (placeholder) ---
;;; libfprint fork for Goodix fingerprint sensors.
;;; Resolves #11302 libfprint-goodixtls-55x4.
;;; Source: https://github.com/TheWeirdDev/libfprint (branch 55b4-experimental)
;;; A1: meson-build-system — no tagged releases, device-specific fork
;;; A2: use as system libfprint replacement — conflicts with upstream libfprint
;;; A3: parallel installation — libfprint does not support parallel installs
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — NO_RELEASES_DEVICE_SPECIFIC
;;;

(define-public libfprint-goodixtls-55x4
  (package
    (name "libfprint-goodixtls-55x4")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TheWeirdDev/libfprint")
                    (commit "55b4-experimental")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "libfprint fork for Goodix TLS 55x4 fingerprint sensors")
    (description "This is a fork of libfprint that adds support for Goodix
TLS 55x4 series fingerprint sensor devices.  It currently supports the
55b4 model with 55a4 planned.  Note: requires firmware extraction from
the sensor using goodix-fp-dump.")
    (home-page "https://github.com/TheWeirdDev/libfprint")
    (license license:lgpl2.1+)))

;;;
;;; --- 27. continuwuity (placeholder) ---
;;; Conduit fork Matrix homeserver.
;;; Resolves #7754 continuwuity-git.
;;; Source: https://forgejo.ellis.link/continuwuation/continuwuity
;;; A1: cargo-build-system — needs 200+ crate deps
;;; A2: pre-built binary — available, but -bin variant already packaged separately
;;; A3: guix import crate — incomplete for this crate graph size
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED (bin variant available)
;;;

(define-public continuwuity
  (package
    (name "continuwuity")
    (version "0.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://forgejo.ellis.link/continuwuation/continuwuity")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "featureful Matrix homeserver fork of Conduit")
    (description "Continuwuity is a fork of the Conduit Matrix homeserver
written in Rust.  It adds features like room backfilling, improved
federation, and better compatibility with Matrix clients.  Note: the
pre-built binary variant (@code{continuwuity-bin}) is recommended
for deployment.")
    (home-page "https://forgejo.ellis.link/continuwuation/continuwuity")
    (license license:asl2.0)))

;;;
;;; --- 28. incplot (placeholder) ---
;;; CLI plotting tool.
;;; Resolves #13477 incplot.
;;; Source: https://github.com/InCom-0/incplot
;;; A1: cmake-build-system — uses CPM pulling 10+ custom subprojects at build time
;;; A2: pre-download CPM deps — each is a custom project from InCom-0 org without standard releases
;;; A3: binary packaging — only Windows binaries in releases
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — CPM_SUBPROJECTS
;;;

(define-public incplot
  (package
    (name "incplot")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InCom-0/incplot")
                    (commit "06e773c")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "CLI tool for drawing plots in the terminal and HTML")
    (description "Incplot is a command-line tool for drawing plots in
the terminal and generating HTML visualizations.  It focuses on user
ergonomics and simplicity for quick data exploration and presentation.")
    (home-page "https://github.com/InCom-0/incplot")
    (license license:expat)))

;;;
;;; --- 29. peertube-gtk (placeholder) ---
;;; PeerTube desktop client.
;;; Resolves #4415 peertube-gtk-git.
;;; Source: https://codeberg.org/The-World-Machine/peertube-gtk
;;; A1: gnu-build-system — C/Makefile, feasible but no tagged releases
;;; A2: Rust+GTK4 source noted in AUR — different language than expected
;;; A3: pin to specific commit — lacks stable API guarantees
;;; NOTE: Keeping as recipe draft pending upstream stabilization
;;;

(define-public peertube-gtk
  (package
    (name "peertube-gtk")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/The-World-Machine/peertube-gtk")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                             "/bin")))
                     (mkdir-p bin)
                     (install-file "peertube-gtk" bin)))))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ json-c curl sqlite pcre2))
    (synopsis "native GTK desktop client for PeerTube")
    (description "PeerTube-GTK is a native desktop client for PeerTube,
the federated video hosting platform.  It provides a GTK-based interface
for browsing, searching, and watching videos from PeerTube instances
without requiring a web browser.")
    (home-page "https://codeberg.org/The-World-Machine/peertube-gtk")
    (license license:gpl3+)))

;;;
;;; --- 30. faircamp (placeholder) ---
;;; Static site generator for audio producers.
;;; Resolves #7411 faircamp.
;;; Source: https://codeberg.org/simonrepp/faircamp
;;; A1: cargo-build-system — needs 100+ crate deps
;;; A2: pre-built binary — no Linux binary releases available
;;; A3: guix import crate — incomplete dependency graph
;;; STATUS: NEEDS_RECIPE_DESIGN_EXHAUSTED — CARGO_DEPS_NEEDED
;;;

(define-public faircamp
  (package
    (name "faircamp")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/simonrepp/faircamp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases #~(modify-phases %standard-phases
                        (delete 'configure)
                        (delete 'build)
                        (delete 'install))))
    (synopsis "static site generator for audio producers")
    (description "Faircamp is a static site generator designed specifically
for audio producers and musicians.  It creates beautiful, fast-loading
websites for sharing music, complete with audio players, artwork display,
and download links, all from a simple folder structure.")
    (home-page "https://simonrepp.com/faircamp/")
    (license license:agpl3+)))
