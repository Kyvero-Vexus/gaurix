;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414b
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 11 recipes created (gnu, cmake, meson, copy, python)
;;;   - 1 already packaged in Guix (ghc-nats)
;;;   - 18 re-blocked with EXHAUSTED notes
;;;
;;; Recipes (11):
;;;   mpc-qt, trickle, reframe, slowrx, yarr-bin,
;;;   ab-download-manager-bin, retroforth, jbofihe,
;;;   neovide-bin, abuse, nmgui
;;;
;;; Already in Guix (1):
;;;   haskell-nats (#10700) — ghc-nats v1.1.2 in (gnu packages haskell-xyz)
;;;
;;; Re-blocked (18):
;;;   gksu (#3847) — DEPRECATED_DEAD_DEPS
;;;   omnetpp (#7334) — NON_FREE_LICENSE
;;;   dooble-git (#3684) — QT6_WEBENGINE
;;;   raze (#3832) — COMPLEX_BUILD_NO_BINARY
;;;   codelldb (#3729) — VSCODE_EXTENSION
;;;   alice2-bin (#7457) — PROPRIETARY_LICENSE
;;;   hydrus (#7705) — MASSIVE_PYTHON_DEPS
;;;   gamescope-nvidia (#7302) — NVIDIA_FORK_HEAVY_DEPS
;;;   flameget (#3469) — NO_BUILD_SYSTEM
;;;   faugus-launcher-git (#3844) — MISSING_PYTHON_DEPS
;;;   wl-clipboard-rs (#7303) — CARGO_DEPS_NEEDED
;;;   lapctl (#7345) — CARGO_DEPS_NEEDED
;;;   gitignore-downloader (#7383) — CARGO_DEPS_NEEDED
;;;   upi (#3717) — CARGO_DEPS_NEEDED
;;;   cnmplayer (#7339) — CARGO_DEPS_NEEDED
;;;   swaystatus-git (#7406) — CARGO_DEPS_NEEDED
;;;   libilbm-git (#7708) — DEP_CHAIN_NEEDED
;;;   sip4 (#7296) — DEPRECATED_CUSTOM_LICENSE
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vnc)
  #:use-module (gnu packages xdisorg)
  #:export (mpc-qt
            trickle
            reframe
            slowrx
            yarr-bin
            ab-download-manager-bin
            retroforth
            jbofihe
            neovide-bin
            abuse
            nmgui))

;;; ──────────────────────────────────────────────────────────────────
;;; CMake builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── mpc-qt (#7695) ──
;;; Media Player Classic clone built with Qt6 and libmpv.
;;; CMake build with Qt6 and mpv as main dependencies.

(define-public mpc-qt
  (package
    (name "mpc-qt")
    (version "26.01")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mpc-qt/mpc-qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list mpv qtbase qtsvg))
    (home-page "https://github.com/mpc-qt/mpc-qt")
    (synopsis "media player clone of MPC-HC built with Qt and mpv")
    (description "MPC-Qt is a clone of Media Player Classic Home Cinema
reimplemented using Qt and libmpv.  It provides a familiar interface for
media playback with features such as playlists, subtitle support, video
filters, and configurable keyboard shortcuts.")
    (license license:gpl2)))

;;; ── abuse (#7558) ──
;;; Side-scroller action game, SDL2 port of the classic Abuse.
;;; CMake build with SDL2 and SDL2_mixer dependencies.

(define-public abuse
  (package
    (name "abuse")
    (version "0.9.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Xenoveritas/abuse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list sdl2 sdl2-mixer))
    (home-page "https://github.com/Xenoveritas/abuse")
    (synopsis "side-scrolling action game using SDL2")
    (description "Abuse is a side-scrolling action game originally created by
Crack Dot Com in 1995.  This is an SDL2 port that runs on modern systems.
Players fight through levels of aliens and robots in a dark sci-fi setting
with a mouse-aimed weapon system.")
    (license license:gpl2)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── reframe (#3801) ──
;;; DRM/KMS-based remote desktop server supporting Wayland and NVIDIA.
;;; Meson build with glib, libdrm, gtk4, and optional VNC modules.

(define-public reframe
  (package
    (name "reframe")
    (version "1.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlynxZhou/reframe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list glib gtk libdrm libepoxy libvnc libxkbcommon))
    (home-page "https://github.com/AlynxZhou/reframe")
    (synopsis "DRM/KMS remote desktop streamer for Wayland")
    (description "Reframe is a DRM/KMS-based remote desktop server that works
with Wayland compositors, including those using NVIDIA proprietary drivers.
It captures screen content directly from DRM and streams it over VNC,
providing low-latency remote access without requiring X11.")
    (license license:asl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; GNU / Autotools / Make builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── trickle (#7718) ──
;;; Lightweight userspace bandwidth shaper using LD_PRELOAD.
;;; Classic autotools C build with libevent dependency.

(define-public trickle
  (package
    (name "trickle")
    (version "1.07")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mariusae/trickle")
                    (commit "09a1d955c6554eb7e625c99bf96b2d99ec7db3dc")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list libevent))
    (home-page "https://github.com/mariusae/trickle")
    (synopsis "lightweight userspace bandwidth shaper")
    (description "Trickle is a portable lightweight userspace bandwidth shaper
that works on any Unix-like operating system.  It uses the LD_PRELOAD
mechanism to intercept network system calls and limit upload and download
bandwidth on a per-application basis, without requiring root privileges or
kernel modifications.")
    (license license:bsd-3)))

;;; ── slowrx (#10689) ──
;;; SSTV (Slow Scan Television) decoder for amateur radio.
;;; Simple C project with plain Makefile, uses GTK3 and FFTW3.

(define-public slowrx
  (package
    (name "slowrx")
    (version "0.0.0-git.20240730")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/windytan/slowrx")
                    (commit "ca6d7012ae788b5057646170bd86590a7f68bd69")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'install 'create-dirs
                 (lambda _
                   (mkdir-p (string-append #$output "/bin")))))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ fftw alsa-lib))
    (home-page "https://github.com/windytan/slowrx")
    (synopsis "SSTV decoder for slow-scan television reception")
    (description "slowrx is a program for decoding Slow Scan Television
(SSTV) transmissions.  It provides a GTK+-based interface for receiving
and viewing SSTV images from audio input, supporting multiple SSTV modes
used in amateur radio communications.")
    (license license:isc)))

;;; ── retroforth (#7503) ──
;;; A modern, pragmatic Forth programming language.
;;; Self-bootstrapping pure C project with simple Makefile.

(define-public retroforth
  (package
    (name "retroforth")
    (version "2024.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crcx/retroforth")
                    (commit "0f495f74f65a6303052d76d386b69b5d94749419")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" #$(cc-for-target)))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://retroforth.org/")
    (synopsis "modern pragmatic Forth programming language")
    (description "RETRO is a modern, pragmatic Forth influenced language.
It provides a clean, minimal language with a dual-stack virtual machine and
a unique approach to literate programming.  RETRO is self-bootstrapping
and runs on a portable virtual machine written in C.")
    (license license:isc)))

;;; ── jbofihe (#7549) ──
;;; Parser and glosser for Lojban constructed language text.
;;; C project using custom Perl configure script and Bison.

(define-public jbofihe
  (package
    (name "jbofihe")
    (version "0.44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lojban/jbofihe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "perl" "config.pl"
                           (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (native-inputs (list bison perl))
    (home-page "https://github.com/lojban/jbofihe")
    (synopsis "parser and glosser for the Lojban language")
    (description "jbofihe is a command-line tool for parsing and glossing text
written in Lojban, the constructed logical language.  It can analyze Lojban
sentences, provide word-by-word translations to English, and check grammatical
structure.")
    (license license:gpl2)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── yarr-bin (#7479) ──
;;; Self-hosted RSS reader with web frontend and SQLite backend.
;;; Single Go binary from GitHub releases.

(define-public yarr-bin
  (package
    (name "yarr-bin")
    (version "2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nkanaev/yarr/releases/download/v"
                    version "/yarr_linux_amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yarr" "bin/yarr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nkanaev/yarr")
    (synopsis "self-hosted RSS reader with web interface")
    (description "Yarr (yet another RSS reader) is a self-hosted RSS reader
with a web-based interface.  It stores feeds in an embedded SQLite database
and provides a clean reading experience with keyboard navigation, feed
grouping, and full-text search.")
    (license license:expat)))

;;; ── ab-download-manager-bin (#3778) ──
;;; Multi-threaded download manager with browser integration.
;;; Pre-built Kotlin/Compose Multiplatform application from GitHub.

(define-public ab-download-manager-bin
  (package
    (name "ab-download-manager-bin")
    (version "1.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amir1376/ab-download-manager/releases/"
                    "download/v" version
                    "/ABDownloadManager_" version "_linux_x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/amir1376/ab-download-manager")
    (synopsis "multi-threaded download manager for Linux")
    (description "AB Download Manager is a desktop download manager that
supports multi-threaded downloading for faster speeds, browser integration,
download queues, and scheduling.  It provides a graphical interface built
with Kotlin Compose Multiplatform.")
    (license license:asl2.0)))

;;; ── neovide-bin (#7545) ──
;;; No-nonsense Neovim GUI client with smooth scrolling and animations.
;;; Pre-built Rust binary from GitHub releases.

(define-public neovide-bin
  (package
    (name "neovide-bin")
    (version "0.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neovide/neovide/releases/download/"
                    version "/neovide-linux-x86_64.tar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("neovide" "bin/neovide"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://neovide.dev/")
    (synopsis "graphical Neovim client with smooth scrolling")
    (description "Neovide is a no-nonsense, cross-platform graphical user
interface for Neovim.  It features smooth cursor animations, animated
scrolling, ligature support, and GPU-accelerated rendering via Skia, while
maintaining full compatibility with Neovim's terminal UI features.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── nmgui (#7744) ──
;;; Simple GTK4-based GUI for managing Wi-Fi and network connections.
;;; Python application using PyGObject and nmcli.

(define-public nmgui
  (package
    (name "nmgui")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/s-adi-dev/nmgui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/nmgui")))
                     (mkdir-p share)
                     (copy-recursively "." share)
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/nmgui")
                       (lambda (port)
                         (format port "#!~a~%exec ~a ~a/main.py \"$@\"~%"
                                 (which "bash")
                                 (which "python3")
                                 share)))
                     (chmod (string-append bin "/nmgui") #o755)))))))
    (propagated-inputs (list python-pygobject python-pycairo))
    (inputs (list python gtk))
    (home-page "https://github.com/s-adi-dev/nmgui")
    (synopsis "lightweight GTK4 GUI for NetworkManager")
    (description "nmgui is a simple and lightweight GTK4-based graphical
interface for managing Wi-Fi and network connections through NetworkManager.
It provides an intuitive way to view, connect, and disconnect from wireless
networks without using the command line.")
    (license license:gpl3+)))
