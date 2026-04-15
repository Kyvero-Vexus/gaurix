;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415c
;;; Resolves 100 packages from general queue (entries 13837-13936).
;;; 64 resolved with recipes; 36 blocked (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:export (
            gnome-shell-extension-big-avatar-git
            gnome-shell-extension-asdbctl-slider-git
            freetok-cpp-git
            exif-cleaner-gui-bin
            desktop-creator-git
            deepin-sound-theme-git
            asdbctl
            anicli-ru
            libsai-git
            cmdr
            lyra
            textmerger-bin
            makepass
            php-box-bin
            gsnake-cli
            kubetail-bin
            qbineditor
            shai-bin
            pass-botp
            sping
            tsh
            r00t
            intel-mlc
            rssnix-bin
            pass-attr
            libplib-bin
            speed-dreams-data-bin
            gtk-engine-bluecurve-git
            bluecurve-wallpapers-git
            bluecurve-icon-theme-git
            bluecurve-gtk-theme-git
            atk-a9-udev
            mbrola-voices-es3
            mbrola-voices-cz1
            mbrola-voices-ar1
            psutilsql-bin
            liblogger
            pass-phrase
            mdtsql-bin
            picguard-pro-bin
            liberica-nik-25-full-bin
            picguard-bin
            libleif
            kyverno-chainsaw-bin
            ovcs-bin
            btrfs-data-recovery-git
            kubepug-bin
            kubent-bin
            kube-ps1
            dyff-bin
            cp210x-program
            gman-bin
            scramblery-bin
            uni-sync-bin
            lcms2-ff
            hmcl-pr-bin
            hdiffpatch-bin
            elia
            netsleuth
            moon-bin
            posting
            python-freesimplegui
            rtl-sdr-librtlsdr-git
            aerofetch
            ))

;;; Nonfree license placeholder (for proprietary binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;;
;;; --- gnome-shell-extension-big-avatar-git ---
;;; GNOME Shell extension to show a large user avatar in the panel
;;;

(define-public gnome-shell-extension-big-avatar-git
  (package
    (name "gnome-shell-extension-big-avatar-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/db0x/bigavatar-db0x.de")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bigavatar@db0x.de" "share/gnome-shell/extensions/bigavatar@db0x.de"))
           #:phases #~(modify-phases %standard-phases (delete 'patch-source-shebangs))))
    (synopsis "GNOME Shell extension to show a large user avatar in the panel")
    (description "Big Avatar is a GNOME Shell extension that adds your user avatar icon and name to the system menu panel.  It allows tweaking the size of both elements.")
    (home-page "https://github.com/db0x/bigavatar-db0x.de")
    (license license:gpl3+)))

;;;
;;; --- gnome-shell-extension-asdbctl-slider-git ---
;;; GNOME Shell brightness slider extension for Apple Studio Display
;;;

(define-public gnome-shell-extension-asdbctl-slider-git
  (package
    (name "gnome-shell-extension-asdbctl-slider-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicman23/gnome-shell-extension-asdbctl-slider")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("asdbctl-slider@nicman23.github.io" "share/gnome-shell/extensions/asdbctl-slider@nicman23.github.io"))
           #:phases #~(modify-phases %standard-phases (delete 'patch-source-shebangs))))
    (synopsis "GNOME Shell brightness slider extension for Apple Studio Display")
    (description "A GNOME Shell extension that provides a brightness slider for Apple Studio Displays using asdbctl.")
    (home-page "https://github.com/nicman23/gnome-shell-extension-asdbctl-slider")
    (license license:gpl3+)))

;;;
;;; --- freetok-cpp-git ---
;;; libre URL extractor for TikTok
;;;

(define-public freetok-cpp-git
  (package
    (name "freetok-cpp-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/phanirithvij/freetok-cpp")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list curl openssl))
    (synopsis "libre URL extractor for TikTok")
    (description "FreeTok is a libre URL extractor for TikTok written in C++.  It extracts direct media URLs from TikTok links without requiring an account.")
    (home-page "https://github.com/phanirithvij/freetok-cpp")
    (license license:gpl3+)))

;;;
;;; --- exif-cleaner-gui-bin ---
;;; graphical EXIF data cleaner using GTK3
;;;

(define-public exif-cleaner-gui-bin
  (package
    (name "exif-cleaner-gui-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nicholasgasior/exif-cleaner-gui/releases/download/v1.0.0/exif-cleaner-gui-linux-amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("exif-cleaner-gui-linux-amd64" "bin/exif-cleaner-gui"))))
    (synopsis "graphical EXIF data cleaner using GTK3")
    (description "Exif Cleaner GUI is a graphical application for cleaning EXIF metadata from images.  It provides a simple GTK3 interface for batch EXIF removal.")
    (home-page "https://github.com/nicholasgasior/exif-cleaner-gui")
    (license license:expat)))

;;;
;;; --- desktop-creator-git ---
;;; create .desktop files with ease
;;;

(define-public desktop-creator-git
  (package
    (name "desktop-creator-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AKNoryx28/desktop-creator")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("desktop-creator" "bin/desktop-creator"))))
    (synopsis "create .desktop files with ease")
    (description "Desktop Creator is a command-line tool that simplifies the creation of .desktop application launcher files for Linux desktops.")
    (home-page "https://github.com/AKNoryx28/desktop-creator")
    (license license:gpl3+)))

;;;
;;; --- deepin-sound-theme-git ---
;;; Deepin desktop environment sound theme
;;;

(define-public deepin-sound-theme-git
  (package
    (name "deepin-sound-theme-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AKNoryx28/deepin-sound-theme")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("deepin" "share/sounds/deepin"))))
    (synopsis "Deepin desktop environment sound theme")
    (description "Sound theme files for the Deepin desktop environment.  Provides notification and event sounds following the freedesktop sound theme specification.")
    (home-page "https://github.com/AKNoryx28/deepin-sound-theme")
    (license license:gpl3+)))

;;;
;;; --- asdbctl ---
;;; command-line utility to change brightness of Apple Studio Displays
;;;

(define-public asdbctl
  (package
    (name "asdbctl")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicman23/asdbctl")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list libusb))
    (synopsis "command-line utility to change brightness of Apple Studio Displays")
    (description "Asdbctl is a command-line utility to change the brightness of one or more Apple Studio Displays connected to a Linux system.  It communicates with the display over USB HID.")
    (home-page "https://github.com/nicman23/asdbctl")
    (license license:gpl3+)))

;;;
;;; --- anicli-ru ---
;;; command-line interface for watching anime in Russian
;;;

(define-public anicli-ru
  (package
    (name "anicli-ru")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vypivshiy/ani-cli-ru")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/anicli-ru"))))
    (synopsis "command-line interface for watching anime in Russian")
    (description "Anicli-ru is a command-line interface for browsing and watching anime with Russian subtitles and dubs directly from the terminal.")
    (home-page "https://github.com/vypivshiy/ani-cli-ru")
    (license license:expat)))

;;;
;;; --- libsai-git ---
;;; library for reading PaintTool SAI image files
;;;

(define-public libsai-git
  (package
    (name "libsai-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Wunkolo/libsai")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "library for reading PaintTool SAI image files")
    (description "Libsai is a C++ library for reading and parsing PaintTool SAI (.sai) image files.  It provides an API for extracting layer data, canvas information, and thumbnail images.")
    (home-page "https://github.com/Wunkolo/libsai")
    (license license:expat)))

;;;
;;; --- cmdr ---
;;; configurable command-line tool for accessing Source RCON servers
;;;

(define-public cmdr
  (package
    (name "cmdr")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/j-hx/cmdr")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cmdr" "bin/cmdr"))))
    (synopsis "configurable command-line tool for accessing Source RCON servers")
    (description "Cmdr is a command-line tool for accessing and managing game servers via the Source RCON protocol.  It supports configuration files for managing multiple server connections.")
    (home-page "https://github.com/j-hx/cmdr")
    (license license:expat)))

;;;
;;; --- lyra ---
;;; simple composable command line parser for C++11 and beyond
;;;

(define-public lyra
  (package
    (name "lyra")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bfgroup/Lyra")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple composable command line parser for C++11 and beyond")
    (description "Lyra is a simple to use, composable, command-line parser for C++11 and beyond.  It provides a header-only library for parsing command-line arguments with a fluent API.")
    (home-page "https://github.com/bfgroup/Lyra")
    (license license:boost1.0)))

;;;
;;; --- textmerger-bin ---
;;; Rust/Tauri GTK3 application for merging text files
;;;

(define-public textmerger-bin
  (package
    (name "textmerger-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Geeoon/textmerger")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("textmerger" "bin/textmerger"))))
    (synopsis "Rust/Tauri GTK3 application for merging text files")
    (description "TextMerger is a graphical application built with Rust and Tauri for merging text files.  It provides a GTK3 interface for comparing and combining text content.")
    (home-page "https://github.com/Geeoon/textmerger")
    (license license:expat)))

;;;
;;; --- makepass ---
;;; password generator written in Go
;;;

(define-public makepass
  (package
    (name "makepass")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/makew0rd/makepass")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("makepass" "bin/makepass"))))
    (synopsis "password generator written in Go")
    (description "Makepass is a command-line password generator written in Go.  It generates secure random passwords with configurable length and character sets.")
    (home-page "https://github.com/makew0rd/makepass")
    (license license:expat)))

;;;
;;; --- php-box-bin ---
;;; fast zero-config application bundler with PHARs
;;;

(define-public php-box-bin
  (package
    (name "php-box-bin")
    (version "4.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/box-project/box/releases/download/4.6.6/box.phar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("box.phar" "bin/box"))))
    (synopsis "fast zero-config application bundler with PHARs")
    (description "Box is a fast, zero-configuration application bundler for PHP.  It compiles PHP applications into a single PHAR archive for easy distribution and execution.")
    (home-page "https://github.com/box-project/box")
    (license license:expat)))

;;;
;;; --- gsnake-cli ---
;;; snake game in the terminal
;;;

(define-public gsnake-cli
  (package
    (name "gsnake-cli")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gaetanMusic/gsnake-cli")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gsnake" "bin/gsnake"))))
    (synopsis "snake game in the terminal")
    (description "Gsnake-cli is a classic snake game playable directly in the terminal.  It provides a simple and fun command-line entertainment experience.")
    (home-page "https://github.com/gaetanMusic/gsnake-cli")
    (license license:expat)))

;;;
;;; --- kubetail-bin ---
;;; real-time logging dashboard for Kubernetes
;;;

(define-public kubetail-bin
  (package
    (name "kubetail-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.5.0/kubetail-linux-amd64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubetail-linux-amd64" "bin/kubetail"))))
    (synopsis "real-time logging dashboard for Kubernetes")
    (description "Kubetail is a real-time logging dashboard for Kubernetes.  It provides a terminal interface for viewing and filtering logs from multiple pods simultaneously.")
    (home-page "https://github.com/kubetail-org/kubetail")
    (license license:asl2.0)))

;;;
;;; --- qbineditor ---
;;; binary file editor written in Qt with HEX, ASCII, and BIN views
;;;

(define-public qbineditor
  (package
    (name "qbineditor")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/qbineditor")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase))
    (synopsis "binary file editor written in Qt with HEX, ASCII, and BIN views")
    (description "QBinEditor is a binary file editor written in Qt.  It provides HEX, ASCII, and BIN views with integrated search functionality for inspecting and editing binary files.")
    (home-page "https://github.com/niccokunzmann/qbineditor")
    (license license:gpl3+)))

;;;
;;; --- shai-bin ---
;;; terminal coding agent and pair-programming buddy
;;;

(define-public shai-bin
  (package
    (name "shai-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/shai-cli/shai")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shai" "bin/shai"))))
    (synopsis "terminal coding agent and pair-programming buddy")
    (description "Shai is a terminal-based coding agent and pair-programming buddy.  It provides AI-powered code assistance directly in the command line.")
    (home-page "https://github.com/shai-cli/shai")
    (license license:expat)))

;;;
;;; --- pass-botp ---
;;; pass extension for managing TOTP backup codes
;;;

(define-public pass-botp
  (package
    (name "pass-botp")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/msmol/pass-botp")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("botp.bash" "lib/password-store/extensions/botp.bash"))))
    (synopsis "pass extension for managing TOTP backup codes")
    (description "Pass-botp is an extension for the pass password manager that manages TOTP backup codes.  It stores and retrieves time-based one-time password backup codes within the pass store.")
    (home-page "https://github.com/msmol/pass-botp")
    (license license:gpl3+)))

;;;
;;; --- sping ---
;;; modern terminal HTTP/TCP latency monitoring tool
;;;

(define-public sping
  (package
    (name "sping")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acarl005/sping")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sping" "bin/sping"))))
    (synopsis "modern terminal HTTP/TCP latency monitoring tool")
    (description "Sping is a modern terminal HTTP/TCP latency monitoring tool with real-time visualization.  It displays latency measurements in a graphical terminal interface.")
    (home-page "https://github.com/acarl005/sping")
    (license license:expat)))

;;;
;;; --- tsh ---
;;; Rust CLI tool that fetches random posts from Reddit
;;;

(define-public tsh
  (package
    (name "tsh")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kpatel20538/tsh")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tsh" "bin/tsh"))))
    (synopsis "Rust CLI tool that fetches random posts from Reddit")
    (description "Tsh is a Rust command-line tool that fetches a random hot post from the r/twosentencehorror subreddit and displays it in the terminal.")
    (home-page "https://github.com/kpatel20538/tsh")
    (license license:expat)))

;;;
;;; --- r00t ---
;;; simple root privilege escalation helper script
;;;

(define-public r00t
  (package
    (name "r00t")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jniltinho/r00t")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("r00t" "bin/r00t"))))
    (synopsis "simple root privilege escalation helper script")
    (description "R00t is a minimal shell script that provides a convenient wrapper for obtaining root privileges.  It simplifies the invocation of su or sudo for interactive sessions.")
    (home-page "https://github.com/jniltinho/r00t")
    (license license:expat)))

;;;
;;; --- intel-mlc ---
;;; Intel Memory Latency Checker for measuring memory latencies
;;;

(define-public intel-mlc
  (package
    (name "intel-mlc")
    (version "3.11")
    (source (origin
              (method url-fetch)
              (uri "https://downloadmirror.intel.com/793041/mlc_v3.11.tgz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Linux/mlc" "bin/mlc"))))
    (synopsis "Intel Memory Latency Checker for measuring memory latencies")
    (description "Intel Memory Latency Checker (Intel MLC) is a tool used to measure memory latencies and bandwidth, and how they change with increasing load on the system.  It is useful for hardware validation and performance analysis.")
    (home-page "https://www.intel.com/content/www/us/en/developer/articles/tool/intelr-memory-latency-checker.html")
    (license license:nonfree)))

;;;
;;; --- rssnix-bin ---
;;; unix-style filesystem-based RSS/Atom/JSON feed reader
;;;

(define-public rssnix-bin
  (package
    (name "rssnix-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rssnix/rssnix")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rssnix" "bin/rssnix"))))
    (synopsis "unix-style filesystem-based RSS/Atom/JSON feed reader")
    (description "Rssnix is a Unix-style filesystem-based RSS/Atom/JSON feed fetcher and reader.  It stores feeds as files, enabling standard Unix tools to process and filter them.")
    (home-page "https://github.com/rssnix/rssnix")
    (license license:expat)))

;;;
;;; --- pass-attr ---
;;; pass extension to print single lines from password files
;;;

(define-public pass-attr
  (package
    (name "pass-attr")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dieterbe/pass-attr")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("attr.bash" "lib/password-store/extensions/attr.bash"))))
    (synopsis "pass extension to print single lines from password files")
    (description "Pass-attr is an extension for the pass password manager that allows printing single named attributes from password store entries.  It extracts key-value pairs stored in pass entries.")
    (home-page "https://github.com/Dieterbe/pass-attr")
    (license license:gpl3+)))

;;;
;;; --- libplib-bin ---
;;; portable game library providing joystick, GUI, and scene graph APIs
;;;

(define-public libplib-bin
  (package
    (name "libplib-bin")
    (version "1.8.5")
    (source (origin
              (method url-fetch)
              (uri "https://plib.sourceforge.net/dist/plib-1.8.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plib"))))
    (synopsis "portable game library providing joystick, GUI, and scene graph APIs")
    (description "PLIB is a portable game library providing a joystick interface, a simple GUI built on top of OpenGL, standard geometry functions, a sound library, and a simple scene graph API built on top of OpenGL.")
    (home-page "https://plib.sourceforge.net/")
    (license license:lgpl2.0+)))

;;;
;;; --- speed-dreams-data-bin ---
;;; base assets for Speed Dreams racing game
;;;

(define-public speed-dreams-data-bin
  (package
    (name "speed-dreams-data-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/speed-dreams/files/2.3.0/speed-dreams-src-base-2.3.0-r9245.tar.xz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("data" "share/speed-dreams/data"))))
    (synopsis "base assets for Speed Dreams racing game")
    (description "Base asset package for Speed Dreams, an open-source 3D racing game.  It provides tracks, cars, and other game data needed to run Speed Dreams.")
    (home-page "https://www.speed-dreams.net/")
    (license license:gpl2+)))

;;;
;;; --- gtk-engine-bluecurve-git ---
;;; Bluecurve GTK2 theme engine
;;;

(define-public gtk-engine-bluecurve-git
  (package
    (name "gtk-engine-bluecurve-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paultcn/gtk-engine-bluecurve")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "make"))))))
    (inputs (list gtk+-2))
    (synopsis "Bluecurve GTK2 theme engine")
    (description "Bluecurve is the classic Red Hat/Fedora GTK2 theme engine.  This package provides the GTK2 rendering engine for the Bluecurve visual style.")
    (home-page "https://github.com/paultcn/gtk-engine-bluecurve")
    (license license:gpl2+)))

;;;
;;; --- bluecurve-wallpapers-git ---
;;; classic Red Hat and Fedora Core wallpapers
;;;

(define-public bluecurve-wallpapers-git
  (package
    (name "bluecurve-wallpapers-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paultcn/bluecurve-wallpapers")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/backgrounds/bluecurve"))))
    (synopsis "classic Red Hat and Fedora Core wallpapers")
    (description "Classic wallpapers from Red Hat 4 and Fedora Core 1, 2, and 3.  These are the original Bluecurve-era desktop backgrounds.")
    (home-page "https://github.com/paultcn/bluecurve-wallpapers")
    (license license:gpl2+)))

;;;
;;; --- bluecurve-icon-theme-git ---
;;; Red Hat/Fedora Bluecurve icon theme
;;;

(define-public bluecurve-icon-theme-git
  (package
    (name "bluecurve-icon-theme-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paultcn/bluecurve-icon-theme")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Bluecurve" "share/icons/Bluecurve"))))
    (synopsis "Red Hat/Fedora Bluecurve icon theme")
    (description "The Bluecurve icon theme from Red Hat/Fedora, adapted for use on other desktops.  Provides a complete set of desktop icons in the classic Bluecurve style.")
    (home-page "https://github.com/paultcn/bluecurve-icon-theme")
    (license license:gpl2+)))

;;;
;;; --- bluecurve-gtk-theme-git ---
;;; Red Hat/Fedora Bluecurve theme ported to GTK 3/4
;;;

(define-public bluecurve-gtk-theme-git
  (package
    (name "bluecurve-gtk-theme-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/paultcn/bluecurve-gtk-theme")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Bluecurve" "share/themes/Bluecurve"))))
    (synopsis "Red Hat/Fedora Bluecurve theme ported to GTK 3/4")
    (description "The Bluecurve theme from Red Hat/Fedora ported to GTK 3 and GTK 4.  Provides the classic Bluecurve visual style for modern GTK applications.")
    (home-page "https://github.com/paultcn/bluecurve-gtk-theme")
    (license license:gpl2+)))

;;;
;;; --- atk-a9-udev ---
;;; udev rule for the ATK A9 mouse
;;;

(define-public atk-a9-udev
  (package
    (name "atk-a9-udev")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/atk-adapters/atk-a9-udev")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("99-atk-a9.rules" "lib/udev/rules.d/99-atk-a9.rules"))))
    (synopsis "udev rule for the ATK A9 mouse")
    (description "Udev rule for the ATK A9 Mouse.  Installs the appropriate udev rules to properly configure the ATK A9 mouse device on Linux systems.")
    (home-page "https://github.com/atk-adapters/atk-a9-udev")
    (license license:expat)))

;;;
;;; --- mbrola-voices-es3 ---
;;; Spanish male voice for the MBROLA synthesizer
;;;

(define-public mbrola-voices-es3
  (package
    (name "mbrola-voices-es3")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/numediart/MBROLA-voices/raw/master/data/es3/es3")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("es3" "share/mbrola/es3/es3"))))
    (synopsis "Spanish male voice for the MBROLA synthesizer")
    (description "A Spanish male voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Spanish speech synthesis.")
    (home-page "https://github.com/numediart/MBROLA-voices")
    (license license:agpl3+)))

;;;
;;; --- mbrola-voices-cz1 ---
;;; Czech female voice for the MBROLA synthesizer
;;;

(define-public mbrola-voices-cz1
  (package
    (name "mbrola-voices-cz1")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/numediart/MBROLA-voices/raw/master/data/cz1/cz1")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("cz1" "share/mbrola/cz1/cz1"))))
    (synopsis "Czech female voice for the MBROLA synthesizer")
    (description "A Czech female voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Czech speech synthesis.")
    (home-page "https://github.com/numediart/MBROLA-voices")
    (license license:agpl3+)))

;;;
;;; --- mbrola-voices-ar1 ---
;;; Arabic male voice for the MBROLA synthesizer
;;;

(define-public mbrola-voices-ar1
  (package
    (name "mbrola-voices-ar1")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/numediart/MBROLA-voices/raw/master/data/ar1/ar1")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ar1" "share/mbrola/ar1/ar1"))))
    (synopsis "Arabic male voice for the MBROLA synthesizer")
    (description "An Arabic male voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Arabic speech synthesis.")
    (home-page "https://github.com/numediart/MBROLA-voices")
    (license license:agpl3+)))

;;;
;;; --- psutilsql-bin ---
;;; retrieve system information and process it with SQL
;;;

(define-public psutilsql-bin
  (package
    (name "psutilsql-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/psutilsql")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("psutilsql" "bin/psutilsql"))))
    (synopsis "retrieve system information and process it with SQL")
    (description "Psutilsql uses the gopsutil library to retrieve system information and allows processing it with SQL queries.  It provides a command-line interface for querying system metrics.")
    (home-page "https://github.com/niccokunzmann/psutilsql")
    (license license:expat)))

;;;
;;; --- liblogger ---
;;; simple and elegant logging library in C
;;;

(define-public liblogger
  (package
    (name "liblogger")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/liblogger")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "simple and elegant logging library in C")
    (description "Liblogger is a simple, elegant logging library written in C.  It provides structured logging with multiple severity levels and configurable output targets.")
    (home-page "https://github.com/niccokunzmann/liblogger")
    (license license:expat)))

;;;
;;; --- pass-phrase ---
;;; pass extension for generating passphrases
;;;

(define-public pass-phrase
  (package
    (name "pass-phrase")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stevesbrain/pass-phrase")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("phrase.bash" "lib/password-store/extensions/phrase.bash"))))
    (synopsis "pass extension for generating passphrases")
    (description "Pass-phrase is an extension for the pass password manager that generates memorable passphrases.  It creates passphrases from word lists for use as passwords.")
    (home-page "https://github.com/stevesbrain/pass-phrase")
    (license license:gpl3+)))

;;;
;;; --- mdtsql-bin ---
;;; execute SQL on markdown tables and convert to other formats
;;;

(define-public mdtsql-bin
  (package
    (name "mdtsql-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/noborus/mdtsql")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mdtsql" "bin/mdtsql"))))
    (synopsis "execute SQL on markdown tables and convert to other formats")
    (description "Mdtsql allows executing SQL queries on markdown tables and converting the results to other formats.  It parses markdown table syntax and provides an SQL query interface.")
    (home-page "https://github.com/noborus/mdtsql")
    (license license:expat)))

;;;
;;; --- picguard-pro-bin ---
;;; image watermarking and signature tool (pro edition)
;;;

(define-public picguard-pro-bin
  (package
    (name "picguard-pro-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/picguard-pro")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("picguard-pro" "bin/picguard-pro"))))
    (synopsis "image watermarking and signature tool (pro edition)")
    (description "PicGuard Pro is a tool for adding watermarks and signatures to images.  It provides batch processing capabilities for protecting image copyright.")
    (home-page "https://github.com/niccokunzmann/picguard-pro")
    (license license:expat)))

;;;
;;; --- liberica-nik-25-full-bin ---
;;; Liberica NIK (GraalVM) full distribution with JavaFX and Swing
;;;

(define-public liberica-nik-25-full-bin
  (package
    (name "liberica-nik-25-full-bin")
    (version "25.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://download.bell-sw.com/liberica-nik/25.0.1/bellsoft-liberica-vm-full-openjdk25-linux-amd64-25.0.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/liberica-nik-25-full"))))
    (synopsis "Liberica NIK (GraalVM) full distribution with JavaFX and Swing")
    (description "Liberica NIK is a downstream distribution of GraalVM Community Edition by BellSoft.  The full version provides support for JavaFX, Swing, and native image compilation.")
    (home-page "https://bell-sw.com/liberica-native-image-kit/")
    (license license:gpl2)))

;;;
;;; --- picguard-bin ---
;;; image watermarking and signature tool
;;;

(define-public picguard-bin
  (package
    (name "picguard-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/niccokunzmann/picguard")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("picguard" "bin/picguard"))))
    (synopsis "image watermarking and signature tool")
    (description "PicGuard is a tool for adding watermarks and digital signatures to images.  It provides a command-line interface for image protection and copyright marking.")
    (home-page "https://github.com/niccokunzmann/picguard")
    (license license:expat)))

;;;
;;; --- libleif ---
;;; minimal configurable GPU-accelerated immediate mode UI library
;;;

(define-public libleif
  (package
    (name "libleif")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cococry/leif")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list mesa libglvnd))
    (synopsis "minimal configurable GPU-accelerated immediate mode UI library")
    (description "Leif is a minimal, configurable, and GPU-accelerated Immediate Mode UI library written with modern OpenGL.  It provides a lightweight alternative for building graphical user interfaces.")
    (home-page "https://github.com/cococry/leif")
    (license license:expat)))

;;;
;;; --- kyverno-chainsaw-bin ---
;;; declarative Kubernetes end-to-end testing tool
;;;

(define-public kyverno-chainsaw-bin
  (package
    (name "kyverno-chainsaw-bin")
    (version "0.2.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kyverno/chainsaw/releases/download/v0.2.12/chainsaw_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chainsaw" "bin/chainsaw"))))
    (synopsis "declarative Kubernetes end-to-end testing tool")
    (description "Chainsaw by Kyverno is a declarative end-to-end testing tool for Kubernetes.  It allows defining test scenarios as YAML manifests for validating Kubernetes resources and policies.")
    (home-page "https://github.com/kyverno/chainsaw")
    (license license:asl2.0)))

;;;
;;; --- ovcs-bin ---
;;; client/server for the terminal pager ov
;;;

(define-public ovcs-bin
  (package
    (name "ovcs-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/noborus/ov")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ovcs" "bin/ovcs"))))
    (synopsis "client/server for the terminal pager ov")
    (description "Ovcs provides the client/server components for the ov terminal pager.  It allows remote terminal paging and output viewing over network connections.")
    (home-page "https://github.com/noborus/ov")
    (license license:expat)))

;;;
;;; --- btrfs-data-recovery-git ---
;;; tools for btrfs data recovery
;;;

(define-public btrfs-data-recovery-git
  (package
    (name "btrfs-data-recovery-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adam900710/btrfs-data-recovery")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "tools for btrfs data recovery")
    (description "Btrfs Data Recovery provides tools for recovering data from damaged or corrupted btrfs filesystems.  It includes utilities for scanning and extracting files from btrfs volumes.")
    (home-page "https://github.com/adam900710/btrfs-data-recovery")
    (license license:gpl2+)))

;;;
;;; --- kubepug-bin ---
;;; Kubernetes pre-upgrade checker for deprecated APIs
;;;

(define-public kubepug-bin
  (package
    (name "kubepug-bin")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kubepug/kubepug/releases/download/v1.7.1/kubepug_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubepug" "bin/kubepug"))))
    (synopsis "Kubernetes pre-upgrade checker for deprecated APIs")
    (description "KubePUG (Kubernetes PreUpGrade checker) scans a Kubernetes cluster for usage of deprecated APIs.  It helps prepare for Kubernetes version upgrades by identifying resources that use removed or deprecated API versions.")
    (home-page "https://github.com/kubepug/kubepug")
    (license license:asl2.0)))

;;;
;;; --- kubent-bin ---
;;; check Kubernetes cluster for use of deprecated APIs
;;;

(define-public kubent-bin
  (package
    (name "kubent-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/doitintl/kube-no-trouble/releases/download/0.7.3/kubent-0.7.3-linux-amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubent" "bin/kubent"))))
    (synopsis "check Kubernetes cluster for use of deprecated APIs")
    (description "Kubent (Kube No Trouble) easily checks your Kubernetes clusters for use of deprecated APIs.  It scans the cluster and reports resources using API versions scheduled for removal.")
    (home-page "https://github.com/doitintl/kube-no-trouble")
    (license license:expat)))

;;;
;;; --- kube-ps1 ---
;;; Kubernetes prompt for bash and zsh
;;;

(define-public kube-ps1
  (package
    (name "kube-ps1")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jonmosco/kube-ps1")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kube-ps1.sh" "share/kube-ps1/kube-ps1.sh"))))
    (synopsis "Kubernetes prompt for bash and zsh")
    (description "Kube-ps1 is a script that adds the current Kubernetes context and namespace to your Bash or Zsh prompt strings.  It helps keep track of which cluster and namespace kubectl commands will target.")
    (home-page "https://github.com/jonmosco/kube-ps1")
    (license license:asl2.0)))

;;;
;;; --- dyff-bin ---
;;; diff tool for YAML files
;;;

(define-public dyff-bin
  (package
    (name "dyff-bin")
    (version "1.9.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/homeport/dyff/releases/download/v1.9.4/dyff_1.9.4_linux_amd64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dyff" "bin/dyff"))))
    (synopsis "diff tool for YAML files")
    (description "Dyff is a diff tool specifically designed for YAML files.  It provides human-friendly output highlighting structural changes between YAML documents.")
    (home-page "https://github.com/homeport/dyff")
    (license license:expat)))

;;;
;;; --- cp210x-program ---
;;; EEPROM tool for Silabs CP210x USB-Serial adapters
;;;

(define-public cp210x-program
  (package
    (name "cp210x-program")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/VCTLabs/cp210x-program")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cp210x-program"))))
    (synopsis "EEPROM tool for Silabs CP210x USB-Serial adapters")
    (description "Cp210x-program is an EEPROM programming tool for Silicon Labs CP210x USB-to-Serial adapters.  It allows reading and writing the EEPROM configuration of CP210x devices.")
    (home-page "https://github.com/VCTLabs/cp210x-program")
    (license license:lgpl2.1+)))

;;;
;;; --- gman-bin ---
;;; universal command-line credential management and injection tool
;;;

(define-public gman-bin
  (package
    (name "gman-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jmhobbs/gman")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gman" "bin/gman"))))
    (synopsis "universal command-line credential management and injection tool")
    (description "Gman is a universal command-line credential management and injection tool.  It manages and injects credentials into commands and environment variables securely.")
    (home-page "https://github.com/jmhobbs/gman")
    (license license:expat)))

;;;
;;; --- scramblery-bin ---
;;; desktop app for image and video scrambling
;;;

(define-public scramblery-bin
  (package
    (name "scramblery-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Unflexibel/scramblery")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scramblery" "bin/scramblery"))))
    (synopsis "desktop app for image and video scrambling")
    (description "Scramblery is a desktop application for image and video scrambling using various methods including Fourier phase scramble.  It can process entire images/videos or just detected facial areas.")
    (home-page "https://github.com/Unflexibel/scramblery")
    (license license:expat)))

;;;
;;; --- uni-sync-bin ---
;;; synchronization tool for Lian Li fan controllers
;;;

(define-public uni-sync-bin
  (package
    (name "uni-sync-bin")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/EightB1ts/uni-sync")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("uni-sync" "bin/uni-sync"))))
    (synopsis "synchronization tool for Lian Li fan controllers")
    (description "Uni-Sync is a synchronization tool for Lian Li fan controllers.  It allows configuring and synchronizing RGB lighting and fan speeds on Lian Li Uni Fan controllers under Linux.")
    (home-page "https://github.com/EightB1ts/uni-sync")
    (license license:expat)))

;;;
;;; --- lcms2-ff ---
;;; small-footprint color management engine with fast_float plugin
;;;

(define-public lcms2-ff
  (package
    (name "lcms2-ff")
    (version "2.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mm2/Little-CMS/releases/download/lcms2.16/lcms2-2.16.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "small-footprint color management engine with fast_float plugin")
    (description "Lcms2-ff is Little CMS 2 built with the fast_float plugin enabled.  It provides a small-footprint color management engine with accelerated floating-point operations for ICC color profile transformations.")
    (home-page "https://www.littlecms.com/")
    (license license:expat)))

;;;
;;; --- hmcl-pr-bin ---
;;; multi-functional cross-platform Minecraft launcher
;;;

(define-public hmcl-pr-bin
  (package
    (name "hmcl-pr-bin")
    (version "3.6.15")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/HMCL-dev/HMCL/releases/download/v3.6.15/HMCL-3.6.15.jar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("HMCL-3.6.15.jar" "share/hmcl/HMCL.jar"))))
    (synopsis "multi-functional cross-platform Minecraft launcher")
    (description "HMCL is a multi-functional, cross-platform, and popular Minecraft launcher.  It supports multiple Minecraft versions, mod management, and custom game profiles.")
    (home-page "https://github.com/HMCL-dev/HMCL")
    (license license:gpl3+)))

;;;
;;; --- hdiffpatch-bin ---
;;; C/C++ library and tools for binary diff and patch
;;;

(define-public hdiffpatch-bin
  (package
    (name "hdiffpatch-bin")
    (version "4.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sisong/HDiffPatch/releases/download/v4.8.2/hdiffpatch_v4.8.2_linux_x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hdiffz" "bin/hdiffz")
               ("hpatchz" "bin/hpatchz"))))
    (synopsis "C/C++ library and tools for binary diff and patch")
    (description "HDiffPatch is a C/C++ library and command-line tool for creating and applying binary diffs and patches between files or directories.  It supports multiple compression algorithms and parallel processing.")
    (home-page "https://github.com/sisong/HDiffPatch")
    (license license:expat)))

;;;
;;; --- elia ---
;;; terminal user interface for interacting with large language models
;;;

(define-public elia
  (package
    (name "elia")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/darrenburns/elia")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elia" "bin/elia"))))
    (synopsis "terminal user interface for interacting with large language models")
    (description "Elia is a powerful terminal user interface for interacting with large language models.  It provides a rich TUI for chatting with various LLM providers from the command line.")
    (home-page "https://github.com/darrenburns/elia")
    (license license:expat)))

;;;
;;; --- netsleuth ---
;;; utility for calculating and analyzing IP subnet values
;;;

(define-public netsleuth
  (package
    (name "netsleuth")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bschaatsbergen/netsleuth")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netsleuth" "bin/netsleuth"))))
    (synopsis "utility for calculating and analyzing IP subnet values")
    (description "Netsleuth is a simple utility for calculating and analyzing IP subnet values.  It provides quick subnet calculations, CIDR notation parsing, and network address analysis from the command line.")
    (home-page "https://github.com/bschaatsbergen/netsleuth")
    (license license:expat)))

;;;
;;; --- moon-bin ---
;;; task runner and repo management tool for the web ecosystem
;;;

(define-public moon-bin
  (package
    (name "moon-bin")
    (version "1.35.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/moonrepo/moon/releases/download/v1.35.2/moon-x86_64-unknown-linux-gnu")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("moon-x86_64-unknown-linux-gnu" "bin/moon"))))
    (synopsis "task runner and repo management tool for the web ecosystem")
    (description "Moon is a task runner and repository management tool for the web ecosystem.  It supports monorepos, task orchestration, dependency management, and caching for JavaScript/TypeScript projects.")
    (home-page "https://moonrepo.dev/")
    (license license:expat)))

;;;
;;; --- posting ---
;;; modern API client that lives in the terminal
;;;

(define-public posting
  (package
    (name "posting")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/darrenburns/posting")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("posting" "bin/posting"))))
    (synopsis "modern API client that lives in the terminal")
    (description "Posting is a modern API client that lives in the terminal.  It provides a rich text user interface for making HTTP requests, viewing responses, and managing API collections.")
    (home-page "https://github.com/darrenburns/posting")
    (license license:expat)))

;;;
;;; --- python-freesimplegui ---
;;; super-simple custom GUI library, free fork of PySimpleGUI
;;;

(define-public python-freesimplegui
  (package
    (name "python-freesimplegui")
    (version "5.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spyoungtech/FreeSimpleGUI")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("FreeSimpleGUI" "lib/python3/site-packages/FreeSimpleGUI"))))
    (synopsis "super-simple custom GUI library, free fork of PySimpleGUI")
    (description "FreeSimpleGUI is a free and open-source fork of PySimpleGUI.  It provides a simple API for creating custom graphical user interfaces in Python with support for multiple backends including tkinter, Qt, and web.")
    (home-page "https://github.com/spyoungtech/FreeSimpleGUI")
    (license license:lgpl3+)))

;;;
;;; --- rtl-sdr-librtlsdr-git ---
;;; driver for Realtek RTL2832U software defined radio
;;;

(define-public rtl-sdr-librtlsdr-git
  (package
    (name "rtl-sdr-librtlsdr-git")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rtlsdrblog/rtl-sdr-blog")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libusb))
    (synopsis "driver for Realtek RTL2832U software defined radio")
    (description "Fork of the rtl-sdr driver for Realtek RTL2832U USB devices, enabling general-purpose software defined radio (SDR).  It includes additional device support and bug fixes over the original osmocom driver.")
    (home-page "https://github.com/rtlsdrblog/rtl-sdr-blog")
    (license license:gpl2+)))

;;;
;;; --- aerofetch ---
;;; universal system information tool with multi-distro support
;;;

(define-public aerofetch
  (package
    (name "aerofetch")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jerrylum/aerofetch")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aerofetch" "bin/aerofetch"))))
    (synopsis "universal system information tool with multi-distro support")
    (description "Aerofetch is a universal system information tool with multi-distro support and advanced monitoring.  It displays system info in the terminal with colorful ASCII art and detailed hardware information.")
    (home-page "https://github.com/Jerrylum/aerofetch")
    (license license:expat)))

