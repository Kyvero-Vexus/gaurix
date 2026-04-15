;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 18 resolved with recipes; 12 exhausted (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            aeolus-next-vst3-bin
            linux-firmware-qlogic-git
            linux-firmware-bnx2x-git
            rofi-gpaste-git
            android-tv-remote
            python-foobeef
            ripdrag
            pwmenu-git
            oxicord-git
            bar-daemon
            qwhitesurgtkdecorations-qt6
            aeroshell-smod-git
            aeroshell-smodglow-x11-git
            plasma6-wallpapers-smart-video-wallpaper-reborn-git
            flowtime
            flameget
            neovim-later
            lyrionmusicserver
            ))

;;;
;;; --- 1. aeolus-next-vst3-bin ---
;;; Aeolus pipe organ synthesizer plugin (VST3 binary).
;;;

(define-public aeolus-next-vst3-bin
  (package
    (name "aeolus-next-vst3-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Archie3d/aeolus_plugin/releases/download/v"
                    version "/AeolusPlugin-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("AeolusPlugin.vst3" "lib/vst3/AeolusPlugin.vst3"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "pipe organ synthesizer VST3 plugin based on Aeolus")
    (description "Aeolus Next is a VST3 plugin implementation of the Aeolus
pipe organ synthesizer.  It provides realistic organ sound synthesis using
additive synthesis with multiple stops and ranks, suitable for use in any
VST3-compatible digital audio workstation.")
    (home-page "https://github.com/Archie3d/aeolus_plugin")
    (license license:gpl3+)))

;;;
;;; --- 2. linux-firmware-qlogic-git ---
;;; QLogic device firmware files extracted from linux-firmware.
;;;

(define-public linux-firmware-qlogic-git
  (package
    (name "linux-firmware-qlogic-git")
    (version "20250311")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qlogic" "lib/firmware/qlogic")
               ("qed" "lib/firmware/qed"))))
    (synopsis "firmware files for QLogic network and storage adapters")
    (description "This package provides firmware files for QLogic network
adapters and storage controllers, extracted from the upstream linux-firmware
repository.  Includes firmware for QLogic Fibre Channel, iSCSI, and Ethernet
adapters.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 3. linux-firmware-bnx2x-git ---
;;; Broadcom NetXtreme II firmware files from linux-firmware.
;;;

(define-public linux-firmware-bnx2x-git
  (package
    (name "linux-firmware-bnx2x-git")
    (version "20250311")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bnx2x" "lib/firmware/bnx2x"))))
    (synopsis "firmware for Broadcom NetXtreme II 10Gb network adapters")
    (description "This package provides firmware files for Broadcom
NetXtreme II (bnx2x) 10 Gigabit Ethernet adapters, extracted from the
upstream linux-firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 4. rofi-gpaste-git ---
;;; Rofi frontend for GPaste clipboard manager.
;;;

(define-public rofi-gpaste-git
  (package
    (name "rofi-gpaste-git")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yusufaktepe/rofi-gpaste")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rofi-gpaste" "bin/rofi-gpaste"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (wrap-program (string-append out "/bin/rofi-gpaste")
                       `("PATH" prefix
                         ,(map (lambda (p)
                                 (string-append (assoc-ref inputs p) "/bin"))
                               '("bash" "xclip" "xdotool"))))))))))
    (inputs (list bash xclip xdotool))
    (synopsis "rofi frontend for GPaste clipboard manager")
    (description "Rofi-gpaste provides a rofi-based interface to the GPaste
clipboard manager.  It allows browsing, searching, and selecting clipboard
history entries through rofi's fuzzy-matching interface.")
    (home-page "https://github.com/yusufaktepe/rofi-gpaste")
    (license license:gpl2+)))

;;;
;;; --- 5. android-tv-remote ---
;;; GTK4 remote control application for Android TV devices.
;;;

(define-public android-tv-remote
  (package
    (name "android-tv-remote")
    (version "0.1.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/erenseymen/android-tv-remote")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; no test suite
    (propagated-inputs
     (list python-pygobject python-psutil))
    (inputs (list gtk libadwaita))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "GTK4 remote control for Android TV devices")
    (description "Android TV Remote is a GTK4-based application for
controlling Android TV devices from a Linux desktop.  It uses ADB shell
protocol to send remote control commands and supports device discovery,
pairing, and key input.")
    (home-page "https://github.com/erenseymen/android-tv-remote")
    (license license:gpl3+)))

;;;
;;; --- 6. python-foobeef ---
;;; Python library to control Beefweb-compatible music players.
;;;

(define-public python-foobeef
  (package
    (name "python-foobeef")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ada-Kru/pyfoobeef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ; tests require running beefweb server
    (propagated-inputs
     (list python-urllib3 python-aiohttp))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "control Beefweb clients such as Foobar2000 and DeaDBeeF")
    (description "Pyfoobeef is a Python library for controlling music players
that support the Beefweb plugin API, such as Foobar2000 and DeaDBeeF.  It
provides both synchronous and asynchronous interfaces for playback control,
playlist management, and media library browsing.")
    (home-page "https://github.com/Ada-Kru/pyfoobeef")
    (license license:expat)))

;;;
;;; --- 7. ripdrag ---
;;; Drag and drop files to and from the terminal.
;;;

(define-public ripdrag
  (package
    (name "ripdrag")
    (version "0.4.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nik012003/ripdrag")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (inputs (list gtk glib))
    (native-inputs (list pkg-config))
    (synopsis "drag and drop files to and from the terminal")
    (description "Ripdrag is a lightweight application that lets you drag and
drop files to and from the terminal.  It provides an intuitive GTK4 window
that appears when invoked, allowing file transfer between terminal and
graphical applications via drag-and-drop.")
    (home-page "https://github.com/nik012003/ripdrag")
    (license license:gpl3)))

;;;
;;; --- 8. pwmenu-git ---
;;; Launcher-driven PipeWire audio manager.
;;;

(define-public pwmenu-git
  (package
    (name "pwmenu-git")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/e-tho/pwmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (inputs (list pipewire))
    (native-inputs (list pkg-config clang))
    (synopsis "launcher-driven audio manager for PipeWire")
    (description "Pwmenu is a launcher-driven audio manager for Linux that
interfaces with PipeWire.  It provides an interactive menu for managing audio
sinks, sources, volume levels, and default devices through launchers like
rofi, wofi, or dmenu.")
    (home-page "https://github.com/e-tho/pwmenu")
    (license license:gpl3+)))

;;;
;;; --- 9. oxicord-git ---
;;; Vim-native Discord TUI for terminal enthusiasts.
;;;

(define-public oxicord-git
  (package
    (name "oxicord-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmobile/oxicord")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (inputs (list dbus openssl))
    (native-inputs (list pkg-config))
    (synopsis "vim-native Discord terminal user interface")
    (description "Oxicord is a terminal-based Discord client written in Rust
with Vim-style keybindings.  It provides a lightweight, keyboard-driven
interface for Discord messaging, designed for terminal enthusiasts who prefer
modal editing workflows.")
    (home-page "https://github.com/linuxmobile/oxicord")
    (license license:gpl3)))

;;;
;;; --- 10. bar-daemon (bar_daemon) ---
;;; Async event-driven status bar daemon for Linux.
;;;

(define-public bar-daemon
  (package
    (name "bar-daemon")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tmforshaw/bar_daemon")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (synopsis "async event-driven status bar daemon for Linux")
    (description "Bar_daemon is an asynchronous, event-driven status bar
daemon for Linux.  It monitors system state (audio via WirePlumber,
brightness, Bluetooth, battery) and outputs formatted status information
for consumption by status bars like Waybar or i3bar.")
    (home-page "https://github.com/tmforshaw/bar_daemon")
    (license license:expat)))

;;;
;;; --- 11. qwhitesurgtkdecorations-qt6 ---
;;; Qt6 decoration plugin implementing WhiteSur-gtk-like client-side decorations.
;;;

(define-public qwhitesurgtkdecorations-qt6
  (package
    (name "qwhitesurgtkdecorations-qt6")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtwayland qtsvg))
    (native-inputs (list pkg-config))
    (synopsis "Qt6 client-side decoration plugin with WhiteSur GTK style")
    (description "QWhiteSurGtkDecorations is a Qt6 Wayland client-side
decoration plugin that provides window decorations matching the WhiteSur GTK
theme.  It renders macOS-style traffic light window buttons on Qt6
Wayland applications.")
    (home-page "https://github.com/FengZhongShaoNian/QWhiteSurGtkDecorations")
    (license license:lgpl2.1)))

;;;
;;; --- 12. aeroshell-smod-git ---
;;; KDecoration3 decoration engine for AeroShell-based desktops.
;;;

(define-public aeroshell-smod-git
  (package
    (name "aeroshell-smod-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/smod")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs (list kconfig kcoreaddons kdecoration ki18n
                  qtbase))
    (native-inputs (list extra-cmake-modules pkg-config))
    (synopsis "KDecoration3 engine for AeroShell desktops")
    (description "AeroShell SMOD is a KDE KDecoration3 window decoration
engine that provides Aero-style window decorations for KDE Plasma desktops.
It renders translucent glass-like title bars inspired by Windows Aero.")
    (home-page "https://github.com/aeroshell-desktop/smod")
    (license license:agpl3+)))

;;;
;;; --- 13. aeroshell-smodglow-x11-git ---
;;; Decoration button glow effect for SMOD decorations.
;;;

(define-public aeroshell-smodglow-x11-git
  (package
    (name "aeroshell-smodglow-x11-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aeroshell-desktop/smod")
                    (commit "main")))
              (file-name (git-file-name "aeroshell-smodglow-x11" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
                   "-DBUILD_SMODGLOW_X11=ON")))
    (inputs (list kcoreaddons qtbase libepoxy))
    (native-inputs (list extra-cmake-modules pkg-config))
    (synopsis "decoration button glow effect for AeroShell SMOD")
    (description "AeroShell SMODGlow X11 provides animated glow effects on
window decoration buttons for the AeroShell SMOD KDE decoration engine.
It renders hover and click glow animations on the close, maximize, and
minimize buttons under X11.")
    (home-page "https://github.com/aeroshell-desktop/smod")
    (license license:agpl3+)))

;;;
;;; --- 14. plasma6-wallpapers-smart-video-wallpaper-reborn-git ---
;;; KDE Plasma 6 video wallpaper plugin.
;;;

(define-public plasma6-wallpapers-smart-video-wallpaper-reborn-git
  (package
    (name "plasma6-wallpapers-smart-video-wallpaper-reborn-git")
    (version "5.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtdeclarative qtmultimedia
                  plasma-framework))
    (native-inputs (list extra-cmake-modules pkg-config))
    (synopsis "smart video wallpaper plugin for KDE Plasma 6")
    (description "Plasma Smart Video Wallpaper Reborn is a KDE Plasma 6
wallpaper plugin that allows setting video files as animated desktop
wallpapers.  It supports various video formats, playback speed control,
and integrates with Plasma's wallpaper settings interface.")
    (home-page "https://github.com/luisbocanegra/plasma-smart-video-wallpaper-reborn")
    (license license:gpl3+)))

;;;
;;; --- 15. flowtime ---
;;; GNOME productivity timer using the Flowtime technique.
;;;

(define-public flowtime
  (package
    (name "flowtime")
    (version "6.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Diego-Ivan/Flowtime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:glib-or-gtk? #t))
    (inputs (list libadwaita libxml2 gtk glib))
    (native-inputs (list pkg-config
                         gettext-minimal
                         `(,glib "bin")    ; glib-compile-schemas
                         vala))
    (synopsis "GNOME productivity timer using the Flowtime technique")
    (description "Flowtime is a GNOME application that implements the
Flowtime productivity technique.  Unlike the Pomodoro method, Flowtime
lets you work as long as you are focused and then take a proportional
break.  It tracks work and break periods with notifications.")
    (home-page "https://github.com/Diego-Ivan/Flowtime")
    (license license:gpl3+)))

;;;
;;; --- 16. flameget ---
;;; GTK4 download manager wrapping Aria2, Curl, and Wget.
;;;

(define-public flameget
  (package
    (name "flameget")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/C-Yassin/flameget")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("flameget" "share/flameget")
               ("flameget.desktop" "share/applications/flameget.desktop"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (python (search-input-file inputs "bin/python3")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/flameget")
                       (lambda ()
                         (format #t "#!~a~%import sys; sys.path.insert(0, '~a/share/flameget'); exec(open('~a/share/flameget/main.py').read())~%"
                                 python out out)))
                     (chmod (string-append bin "/flameget") #o755)))))))
    (propagated-inputs
     (list python python-pygobject python-flask))
    (inputs (list gtk))
    (synopsis "GTK4 download manager wrapping aria2, curl, and wget")
    (description "FlameGet is a GTK4-based graphical download manager for
Linux.  It provides a user-friendly interface for managing downloads using
aria2, curl, or wget as backends, with support for concurrent downloads,
pause/resume, and speed limiting.")
    (home-page "https://github.com/C-Yassin/flameget")
    (license license:expat)))

;;;
;;; --- 17. neovim-later ---
;;; Neovim following dev branch (at least monthly updates).
;;;

(define-public neovim-later
  (package
    (inherit neovim)
    (name "neovim-later")
    (version "0.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neovim/neovim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (synopsis "extensible text editor, development branch builds")
    (description "This package provides a more recent build of Neovim,
following the upstream development branch with at least monthly updates.
Neovim is a refactored Vim with better defaults, a built-in LSP client,
Lua scripting, and an extensible architecture.")))

;;;
;;; --- 18. lyrionmusicserver ---
;;; Lyrion Music Server (formerly Logitech Media Server / Slimserver).
;;;

(define-public lyrionmusicserver
  (package
    (name "lyrionmusicserver")
    (version "9.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LMS-Community/slimserver")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lyrionmusicserver"
                #:exclude ("Dockerfile" ".github" ".git")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (perl (search-input-file inputs "bin/perl")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/lyrionmusicserver")
                       (lambda ()
                         (format #t "#!/bin/sh~%exec ~a ~a/share/lyrionmusicserver/slimserver.pl \"$@\"~%"
                                 perl out)))
                     (chmod (string-append bin "/lyrionmusicserver") #o755)))))))
    (inputs (list perl zlib))
    (synopsis "Lyrion Music Server for Squeezebox and compatible players")
    (description "Lyrion Music Server (formerly Logitech Media Server,
Slimserver) is a streaming audio server for Squeezebox hardware and
compatible software players.  It supports music library management,
internet radio, podcasts, and plugins.  It serves audio over the network
to Squeezebox devices and software clients.")
    (home-page "https://github.com/LMS-Community/slimserver")
    (license license:gpl2)))
