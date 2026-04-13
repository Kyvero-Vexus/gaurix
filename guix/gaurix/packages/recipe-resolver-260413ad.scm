;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413ad
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (binary repacks, C/C++ source builds, Python, Perl, fonts)
;;;   - 0 re-blocked
;;;
;;; Recipes (30):
;;;   sublime-text-4-bin, mullvad-browser-bin, rojo-bin, perch-bin,
;;;   sherut-bin, tickit-sync-bin, mediamtx-bin, librespeed-cli-bin,
;;;   kubecolor-bin, petbottle-bin, pyrite64-bin, qidi-studio-appimage,
;;;   postman-live-bin, wezterm-nightly-bin,
;;;   tty-clock, jrnlc, media-downloader, libopenrazer,
;;;   tinc-pre, dreamchess, nvi-multibyte, tuipaper,
;;;   stacer, ttf-monocraft,
;;;   caffeine-ng, cpupower-gui,
;;;   perl-cpan-uploader,
;;;   tchap-desktop-bin, docker-credential-secretservice-bin,
;;;   optomizer
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (
            ;; Binary tarball/AppImage packages
            sublime-text-4-bin
            mullvad-browser-bin
            rojo-bin
            perch-bin
            sherut-bin
            tickit-sync-bin
            mediamtx-bin
            librespeed-cli-bin
            kubecolor-bin
            petbottle-bin
            pyrite64-bin
            qidi-studio-appimage
            postman-live-bin
            wezterm-nightly-bin
            tchap-desktop-bin
            docker-credential-secretservice-bin
            optomizer
            ;; C/C++ source builds
            tty-clock
            jrnlc
            media-downloader
            libopenrazer
            tinc-pre
            dreamchess
            nvi-multibyte
            tuipaper
            stacer
            ;; Font
            ttf-monocraft
            ;; Python packages
            caffeine-ng
            cpupower-gui
            ;; Perl packages
            perl-cpan-uploader
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary tarball/AppImage packages
;;; All use copy-build-system.
;;; ──────────────────────────────────────────────────────────────────

;;; ── sublime-text-4-bin (#282) ──
;;; Sophisticated text editor for code, HTML, and prose.

(define-public sublime-text-4-bin
  (package
    (name "sublime-text-4-bin")
    (version "4200")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.sublimetext.com/"
                    "sublime_text_build_" version "_x64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/sublime_text/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/sublime_text/sublime_text")
                              (string-append bin "/subl"))))))))
    (home-page "https://www.sublimetext.com")
    (synopsis "sophisticated text editor for code, markup and prose")
    (description "Sublime Text is a sophisticated text editor for code, markup
and prose.  It features a slick user interface, extraordinary features and
amazing performance.")
    (license (license:non-copyleft
              "https://www.sublimetext.com/eula"
              "Proprietary"))))

;;; ── mullvad-browser-bin (#441) ──
;;; Privacy-focused web browser from Mullvad VPN and the Tor Project.

(define-public mullvad-browser-bin
  (package
    (name "mullvad-browser-bin")
    (version "15.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.mullvad.net/browser/"
                    version "/mullvad-browser-linux-x86_64-"
                    version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/mullvad-browser/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/mullvad-browser/Browser/start-mullvad-browser")
                              (string-append bin "/mullvad-browser"))))))))
    (home-page "https://mullvad.net/browser")
    (synopsis "privacy-focused web browser by Mullvad VPN and Tor Project")
    (description "Mullvad Browser is a privacy-focused web browser developed
in collaboration between Mullvad VPN and the Tor Project.  It is designed to
minimize tracking and fingerprinting without using the Tor network.")
    (license license:mpl2.0)))

;;; ── rojo-bin (#1376) ──
;;; Roblox development sync tool.

(define-public rojo-bin
  (package
    (name "rojo-bin")
    (version "7.7.0-rc.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rojo-rbx/rojo/releases/download/v"
                    version "/rojo-" version "-linux-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rojo" "bin/rojo"))))
    (home-page "https://rojo.space")
    (synopsis "professional-grade Roblox development sync tool")
    (description "Rojo enables Roblox developers to use professional-grade
software engineering tools.  It synchronizes files on the filesystem with
Roblox Studio, allowing use of external text editors and version control.")
    (license license:mpl2.0)))

;;; ── perch-bin (#1384) ──
;;; Terminal social client for Mastodon and Bluesky.

(define-public perch-bin
  (package
    (name "perch-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ricardodantas/perch/releases/download/v"
                    version "/perch-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("perch" "bin/perch"))))
    (home-page "https://github.com/ricardodantas/perch")
    (synopsis "terminal social client for Mastodon and Bluesky")
    (description "Perch is a beautiful terminal-based social media client that
supports Mastodon and Bluesky.  It provides a TUI interface for browsing feeds,
posting, and interacting with social networks from the command line.")
    (license license:gpl3)))

;;; ── sherut-bin (#1373) ──
;;; Lightweight tool that exposes shell commands as HTTP endpoints.

(define-public sherut-bin
  (package
    (name "sherut-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/petereon/sherut/releases/download/v"
                    version "/sherut-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sherut" "bin/sherut"))))
    (home-page "https://github.com/petereon/sherut")
    (synopsis "expose shell commands as HTTP endpoints")
    (description "Sherut is a lightweight tool that exposes shell commands as
HTTP endpoints.  It allows you to create simple HTTP APIs from shell scripts
and commands without writing server code.")
    (license license:expat)))

;;; ── tickit-sync-bin (#1369) ──
;;; Self-hosted sync server for Tickit task manager.

(define-public tickit-sync-bin
  (package
    (name "tickit-sync-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ricardodantas/tickit-sync/releases/download/v"
                    version "/tickit-sync-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tickit-sync" "bin/tickit-sync"))))
    (home-page "https://github.com/ricardodantas/tickit-sync")
    (synopsis "self-hosted sync server for Tickit task manager")
    (description "Tickit Sync is a self-hosted synchronization server for the
Tickit task manager application.  It enables syncing tasks across multiple
devices without relying on third-party cloud services.")
    (license license:gpl3)))

;;; ── mediamtx-bin (#426) ──
;;; Ready-to-use RTSP/RTMP/LL-HLS/WebRTC media server.

(define-public mediamtx-bin
  (package
    (name "mediamtx-bin")
    (version "1.17.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bluenviron/mediamtx/releases/download/v"
                    version "/mediamtx_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mediamtx" "bin/mediamtx")
               ("mediamtx.yml" "etc/mediamtx/mediamtx.yml"))))
    (home-page "https://github.com/bluenviron/mediamtx")
    (synopsis "ready-to-use RTSP/RTMP/LL-HLS/WebRTC media server and proxy")
    (description "MediaMTX is a ready-to-use and zero-dependency real-time
media server and media proxy that allows to publish, read, proxy, record and
playback video and audio streams.  It supports RTSP, RTMP, LL-HLS, WebRTC,
SRT, and other protocols.")
    (license license:expat)))

;;; ── librespeed-cli-bin (#2404) ──
;;; Command line client for LibreSpeed speed tests.

(define-public librespeed-cli-bin
  (package
    (name "librespeed-cli-bin")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/librespeed/speedtest-cli/releases/download/v"
                    version "/librespeed-cli_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("librespeed-cli" "bin/librespeed-cli"))))
    (home-page "https://github.com/librespeed/speedtest-cli")
    (synopsis "command line client for LibreSpeed speed test")
    (description "LibreSpeed CLI is a command line interface for performing
internet speed tests using LibreSpeed servers.  It can test download speed,
upload speed, and latency against self-hosted or public LibreSpeed instances.")
    (license license:lgpl3)))

;;; ── kubecolor-bin (#488) ──
;;; Colorize kubectl output.

(define-public kubecolor-bin
  (package
    (name "kubecolor-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kubecolor/kubecolor/releases/download/v"
                    version "/kubecolor_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubecolor" "bin/kubecolor"))))
    (home-page "https://github.com/kubecolor/kubecolor")
    (synopsis "colorize your kubectl output")
    (description "Kubecolor colorizes your kubectl command output.  It wraps
kubectl and automatically adds color highlighting to make the output more
readable, without changing any of the original output content.")
    (license license:expat)))

;;; ── petbottle-bin (#1383) ──
;;; Local note-taking application.

(define-public petbottle-bin
  (package
    (name "petbottle-bin")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rumata01/Petbottle-public/releases/download/v"
                    version "/petbottle_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (copy-recursively "usr" out)))))))
    (native-inputs (list binutils))
    (home-page "https://github.com/Rumata01/Petbottle-public")
    (synopsis "local note-taking application")
    (description "Petbottle is a local note-taking application with a GTK
and WebKit-based interface.  It provides a simple way to create and organize
notes stored locally on your machine.")
    (license license:asl2.0)))

;;; ── pyrite64-bin (#1380) ──
;;; N64 game engine and editor using libdragon.

(define-public pyrite64-bin
  (package
    (name "pyrite64-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/HailToDodongo/pyrite64/releases/download/v"
                    version "/pyrite64-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pyrite64" "bin/pyrite64"))))
    (home-page "https://github.com/HailToDodongo/pyrite64")
    (synopsis "N64 game engine and editor using libdragon")
    (description "Pyrite64 is an N64 game engine and editor built on top of
libdragon and tiny3d.  It provides tools for creating Nintendo 64 homebrew
games with a modern editor interface.")
    (license license:expat)))

;;; ── qidi-studio-appimage (#1378) ──
;;; 3D printer slicer for QiDi printers (AppImage).

(define-public qidi-studio-appimage
  (package
    (name "qidi-studio-appimage")
    (version "2.05.01.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/QIDITECH/QIDIStudio/releases/download/v"
                    version "/QIDIStudio_Linux_V" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("QIDIStudio.AppImage" "bin/qidi-studio"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "QIDIStudio.AppImage")
                   (chmod "QIDIStudio.AppImage" #o755))))))
    (home-page "https://github.com/QIDITECH/QIDIStudio")
    (synopsis "3D printer slicer for QiDi printers")
    (description "QIDIStudio is a professional 3D printer slicing software
specifically designed for QiDi 3D printers.  It provides an optimized slicing
workflow with pre-configured profiles for QiDi printer models.")
    (license license:gpl3)))

;;; ── postman-live-bin (#1382) ──
;;; API development platform (live/latest version).

(define-public postman-live-bin
  (package
    (name "postman-live-bin")
    (version "12.5.6")
    (source (origin
              (method url-fetch)
              (uri "https://dl.pstmn.io/download/latest/linux_64")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/Postman/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/Postman/Postman")
                              (string-append bin "/postman"))))))))
    (home-page "https://www.getpostman.com")
    (synopsis "API platform for building and using APIs")
    (description "Postman is an API platform for designing, building, testing,
and documenting APIs.  It provides tools for sending HTTP requests, organizing
API collections, writing tests, and collaborating with teams.")
    (license (license:non-copyleft
              "https://www.postman.com/legal/terms/"
              "Proprietary"))))

;;; ── wezterm-nightly-bin (#3436) ──
;;; GPU-accelerated terminal emulator and multiplexer (nightly).

(define-public wezterm-nightly-bin
  (package
    (name "wezterm-nightly-bin")
    (version "20240203.110809")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wez/wezterm/releases/download/nightly/"
                    "WezTerm-nightly-Ubuntu20.04.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wezterm.AppImage" "bin/wezterm"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "wezterm.AppImage")
                   (chmod "wezterm.AppImage" #o755))))))
    (home-page "https://wezfurlong.org/wezterm/")
    (synopsis "GPU-accelerated cross-platform terminal emulator")
    (description "WezTerm is a GPU-accelerated cross-platform terminal emulator
and multiplexer written in Rust.  It supports ligatures, color emoji, tabs,
multiplexing, SSH integration, serial port connections, and has a built-in
domain-specific scripting language for configuration.")
    (license license:expat)))

;;; ── tchap-desktop-bin (#3727) ──
;;; Desktop app for Tchap (French government messaging).

(define-public tchap-desktop-bin
  (package
    (name "tchap-desktop-bin")
    (version "4.19.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/niclas2109/tchap-desktop/releases/download/v"
                    version "/tchap-desktop-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/tchap-desktop/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/tchap-desktop/tchap-desktop")
                              (string-append bin "/tchap-desktop"))))))))
    (home-page "https://github.com/tchapgouv/tchap-desktop")
    (synopsis "desktop client for Tchap messaging platform")
    (description "Tchap Desktop is the desktop application for Tchap, the
secure messaging platform used by the French government.  It provides
end-to-end encrypted messaging based on the Matrix protocol.")
    (license license:expat)))

;;; ── docker-credential-secretservice-bin (#434) ──
;;; Docker credential helper using Secret Service API.

(define-public docker-credential-secretservice-bin
  (package
    (name "docker-credential-secretservice-bin")
    (version "0.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/docker/docker-credential-helpers"
                    "/releases/download/v" version
                    "/docker-credential-secretservice-v" version
                    ".linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("docker-credential-secretservice" "bin/docker-credential-secretservice"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "docker-credential-secretservice")
                   (chmod "docker-credential-secretservice" #o755))))))
    (home-page "https://github.com/docker/docker-credential-helpers")
    (synopsis "Docker credential helper using Secret Service API")
    (description "Docker Credential Secretservice is a program to use the
Secret Service API (via D-Bus) to keep Docker credentials safe.  It integrates
with GNOME Keyring and KDE Wallet for secure credential storage.")
    (license license:expat)))

;;; ── optomizer (#1386) ──
;;; System optimizer Java application.

(define-public optomizer
  (package
    (name "optomizer")
    (version "3.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AlphaWolf6940/Optomizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/optomizer/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/optomizer")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec ~a -jar ~a/share/optomizer/Optomizer.jar \"$@\"\n"
                                 java out)))
                     (chmod (string-append bin "/optomizer") #o755)))))))
    (inputs (list openjdk))
    (home-page "https://github.com/AlphaWolf6940/Optomizer")
    (synopsis "system optimizer Java application")
    (description "Optomizer is a Java-based system optimization application.
It provides various utilities for system maintenance and performance tuning
through a graphical user interface.")
    (license license:expat)))

;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── tty-clock (#510) ──
;;; Digital clock in terminal using ncurses.

(define-public tty-clock
  (package
    (name "tty-clock")
    (version "2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xorg62/tty-clock")
                    (commit (string-append "v" version))))
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
               (delete 'configure))))
    (inputs (list ncurses))
    (home-page "https://github.com/xorg62/tty-clock")
    (synopsis "digital clock in the terminal")
    (description "tty-clock is a digital clock rendered in the terminal using
ncurses.  It displays a large, configurable clock with options for 12/24 hour
format, colors, date display, and various positioning options.")
    (license license:bsd-2)))

;;; ── jrnlc (#435) ──
;;; Fast, minimal, terminal-based journaling tool in C++.

(define-public jrnlc
  (package
    (name "jrnlc")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/manjunathamajety/jrnlc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/manjunathamajety/jrnlc")
    (synopsis "fast, minimal, terminal-based journaling tool")
    (description "jrnlc is a fast, minimal, terminal-based journaling tool
written in C++.  It stores journal entries as plain text files, providing
a simple and efficient way to maintain a personal journal from the command
line.")
    (license license:expat)))

;;; ── media-downloader (#2744) ──
;;; Qt/C++ front-end to yt-dlp and other downloaders.

(define-public media-downloader
  (package
    (name "media-downloader")
    (version "5.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mhogomchungu/media-downloader")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase))
    (home-page "https://github.com/mhogomchungu/media-downloader")
    (synopsis "Qt/C++ front end to yt-dlp and other download tools")
    (description "Media Downloader is a Qt/C++ graphical front end for yt-dlp,
youtube-dl, gallery-dl, lux, you-get, svtplay-dl, aria2c, wget, and safari
books.  It provides a user-friendly interface for downloading media from
various online sources.")
    (license license:gpl2+)))

;;; ── libopenrazer (#507) ──
;;; Qt wrapper around D-Bus API from OpenRazer.

(define-public libopenrazer
  (package
    (name "libopenrazer")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/z3ntu/libopenrazer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/z3ntu/libopenrazer")
    (synopsis "Qt library for OpenRazer D-Bus interface")
    (description "Libopenrazer is a Qt wrapper library around the D-Bus API
provided by OpenRazer.  It simplifies interaction with OpenRazer for querying
and configuring Razer peripherals such as keyboards, mice, and other devices.")
    (license license:gpl3)))

;;; ── tinc-pre (#1061) ──
;;; VPN daemon (pre-release version).

(define-public tinc-pre
  (package
    (name "tinc-pre")
    (version "1.1pre18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.tinc-vpn.org/packages/"
                    "tinc-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake))
    (inputs (list lzo zlib openssl miniupnpc))
    (home-page "https://www.tinc-vpn.org/")
    (synopsis "VPN daemon with automatic full mesh routing")
    (description "Tinc is a Virtual Private Network (VPN) daemon that uses
tunnelling and encryption to create a secure private network between hosts
on the Internet.  This pre-release version includes new features like
automatic full mesh routing and improved crypto.")
    (license license:gpl2+)))

;;; ── dreamchess (#919) ──
;;; Open source 3D chess game with Dreamer engine.

(define-public dreamchess
  (package
    (name "dreamchess")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dreamchess/dreamchess")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list sdl2 sdl2-image sdl2-mixer
                  glew glu mesa expat))
    (native-inputs (list flex bison pkg-config))
    (home-page "https://github.com/dreamchess/dreamchess")
    (synopsis "open source 3D chess game")
    (description "DreamChess is an open source chess game featuring 3D OpenGL
graphics.  It includes its own chess engine called Dreamer and supports
various themes, difficulty levels, and a user-friendly interface for playing
chess.")
    (license license:gpl3)))

;;; ── nvi-multibyte (#422) ──
;;; nvi editor with multibyte character support.

(define-public nvi-multibyte
  (package
    (name "nvi-multibyte")
    (version "1.81.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "git://repo.or.cz/nvi.git")
                    (commit "4336e3e72cf4de8085e046ea3eab4eaa8f221412")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'chdir-dist
                 (lambda _
                   (chdir "dist"))))))
    (inputs (list ncurses))
    (home-page "https://repo.or.cz/nvi.git")
    (synopsis "nvi editor with multibyte character support")
    (description "This is a fork of the nvi text editor with added support for
multibyte character encodings.  It is compatible with the original nvi/ex
feature set while supporting UTF-8 and other wide character encodings.")
    (license license:bsd-3)))

;;; ── tuipaper (#359) ──
;;; TUI wallpaper manager and setter for Wayland.

(define-public tuipaper
  (package
    (name "tuipaper")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aethstetic/tuipaper")
                    (commit (string-append "v" version))))
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
               (delete 'configure))))
    (inputs (list wayland))
    (native-inputs (list pkg-config wayland-protocols))
    (home-page "https://github.com/aethstetic/tuipaper")
    (synopsis "TUI wallpaper manager and setter for Wayland")
    (description "Tuipaper is a TUI-based wallpaper manager and setter for
Wayland compositors.  It provides a terminal user interface for browsing
and setting desktop wallpapers on Wayland sessions.")
    (license license:expat)))

;;; ── stacer (#4217) ──
;;; Linux system optimizer and monitoring tool.

(define-public stacer
  (package
    (name "stacer")
    (version "1.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/oguzhaninan/Stacer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase qtcharts qtsvg))
    (native-inputs (list pkg-config))
    (home-page "https://oguzhaninan.github.io/Stacer-Web/")
    (synopsis "Linux system optimizer and monitoring tool")
    (description "Stacer is an open source system optimizer and application
monitor that helps users manage their Linux system.  It provides a clean GUI
for managing startup applications, cleaning caches, monitoring resources,
and managing system services.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Font packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── ttf-monocraft (#3786) ──
;;; Minecraft-inspired monospace programming font.

(define-public ttf-monocraft
  (package
    (name "ttf-monocraft")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/IdreesInc/Monocraft/releases/download/v"
                    version "/Monocraft.ttf"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Monocraft.ttf" "share/fonts/truetype/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "Monocraft.ttf"))))))
    (home-page "https://github.com/IdreesInc/Monocraft")
    (synopsis "Minecraft-inspired monospace programming font")
    (description "Monocraft is a monospace programming font inspired by the
typeface used in the Minecraft video game.  It provides a pixel-art aesthetic
while remaining functional as a monospace font for coding.")
    (license license:silofl1.1)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── caffeine-ng (#278) ──
;;; Status bar app to inhibit screensaver and sleep.

(define-public caffeine-ng
  (package
    (name "caffeine-ng")
    (version "4.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/WhyNotHugo/caffeine-ng")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list python
                  python-pygobject
                  python-click
                  python-setproctitle
                  gtk+
                  libnotify))
    (native-inputs (list pkg-config
                         python-wrapper))
    (home-page "https://codeberg.org/WhyNotHugo/caffeine-ng")
    (synopsis "status bar application to inhibit screensaver and sleep")
    (description "Caffeine-ng is a status bar application that can temporarily
inhibit the screensaver and sleep mode.  It is useful for preventing the screen
from going blank during presentations, video playback, or other activities
that should not be interrupted.")
    (license license:gpl3)))

;;; ── cpupower-gui (#203) ──
;;; GUI utility for setting CPU frequency limits.

(define-public cpupower-gui
  (package
    (name "cpupower-gui")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vagnum08/cpupower-gui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (inputs (list python
                  python-pygobject
                  python-dbus
                  gtk+
                  polkit
                  libhandy))
    (native-inputs (list pkg-config
                         desktop-file-utils
                         python-wrapper
                         gettext-minimal
                         glib))
    (home-page "https://github.com/vagnum08/cpupower-gui")
    (synopsis "GUI utility to set CPU frequency limits")
    (description "Cpupower-gui is a graphical utility for configuring CPU
frequency scaling.  It provides a clean interface for setting CPU frequency
limits and governors, allowing users to control power consumption and
performance of their processor.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Perl packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── perl-cpan-uploader (#209) ──
;;; Upload distributions to CPAN.

(define-public perl-cpan-uploader
  (package
    (name "perl-cpan-uploader")
    (version "0.103019")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/R/RJ/RJBS/"
                    "CPAN-Uploader-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (propagated-inputs
     (list perl-getopt-long-descriptive
           perl-http-message
           perl-lwp-protocol-https))
    (home-page "https://metacpan.org/release/CPAN-Uploader")
    (synopsis "upload distributions to the CPAN")
    (description "CPAN::Uploader provides tools for uploading Perl
distributions to CPAN (the Comprehensive Perl Archive Network).  It includes
a command-line tool @command{cpan-upload} and a Perl API for programmatic
uploads.")
    (license license:perl-license)))
