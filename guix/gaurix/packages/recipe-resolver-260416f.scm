;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. postman-bin (copy/binary, v12.5.6, proprietary)
;;;   2. mimose-bin (copy/binary, v1.9.6, proprietary)
;;;   3. lutris-live-bin (copy/binary, v0.5.22, GPL-3.0)
;;;   4. flaresolverr-bin (copy/binary, v3.4.6, MIT)
;;;   5. positron-ide-devel-bin (copy/binary, v2026.04.0.269, Elastic-2.0)
;;;   6. wps-office-365-edu-fonts (copy/fonts, v12.1.2.23578, proprietary)
;;;   7. vcvrack (copy/binary, v2.6.6, GPL-3.0+)
;;;   8. orca-slicer (copy/binary, v2.3.1, AGPL-3.0)
;;;   9. maestral (pyproject, v1.9.5, MIT)
;;;  10. oterm (pyproject, v0.14.7, MIT)
;;;  11. backup-warden (pyproject, v1.0.15, GPL-3.0)
;;;  12. python-mlflow — BLOCKED: hybrid JS+Python build (yarn + pyproject)
;;;  13. qmplay2 (cmake, v25.09.11, LGPL)
;;;  14. 86box-git (cmake, v5.3, GPL-2.0+)
;;;  15. cdesktopenv (gnu, v2.5.3, LGPL-2.1+)
;;;  16. bottles-git (meson, v62.0, GPL-3.0)
;;;  17. sway-scroll (meson, v1.12.8, MIT)
;;;  18. nautilus-typeahead (meson, v50.1, GPL-3.0+)
;;;  19. somewm-git (meson, v0.5.0, GPL-3.0+)
;;;  20. apollo (cmake, v0.4.8, GPL-3.0)
;;;  21. gopher64-git (cargo, v1.1.15, GPL-3.0)
;;;  22. linuxcnc (gnu, v2.9.8, GPL-2.0)
;;;  23. sunshine (cmake, v2025.924.154138, GPL-3.0)
;;;  24. gamescope-nvidia — BLOCKED: many vendored submodules + NVIDIA patches
;;;  25. dsnote — BLOCKED: downloads models during build (Vosk), violates sandbox
;;;  26. citron (cmake, v2026.02.1, GPL-2.0+)
;;;  27. xemu-git (cmake/meson, v0.8.134, GPL-2.0)
;;;  28. syca (gnu, v1.7, GPL)
;;;  29. idescriptor-git (cmake, latest, AGPL-3.0+)
;;;  30. rog-perf-tuner-git — BLOCKED: hybrid CMake+pnpm, pip during build
;;;
;;; 26 recipes written. 4 BLOCKED (python-mlflow, gamescope-nvidia, dsnote, rog-perf-tuner-git).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cairo)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages music)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pango)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages web)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            postman-bin
            mimose-bin
            lutris-live-bin
            flaresolverr-bin
            positron-ide-devel-bin
            wps-office-365-edu-fonts
            vcvrack
            orca-slicer
            maestral
            oterm
            backup-warden
            qmplay2
            86box-git
            cdesktopenv
            bottles-git
            sway-scroll
            nautilus-typeahead
            somewm-git
            apollo
            gopher64-git
            linuxcnc
            sunshine
            citron
            xemu-git
            syca
            idescriptor-git
            ))

;;; -------------------------------------------------------------------
;;; 1. postman-bin — API development and testing platform
;;; -------------------------------------------------------------------
(define-public postman-bin
  (package
    (name "postman-bin")
    (version "12.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.pstmn.io/download/version/"
                    version "/linux64"))
              (file-name (string-append "postman-" version "-linux64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Postman" "opt/postman/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/postman/Postman")
                              (string-append out "/bin/postman"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "build, test, and document APIs faster")
    (description "Postman is a collaboration platform for API development.  It
provides tools for designing, testing, documenting, and monitoring APIs, with
support for REST, GraphQL, gRPC, and WebSocket protocols.")
    (home-page "https://www.getpostman.com")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 2. mimose-bin — multi-service music streaming client
;;; -------------------------------------------------------------------
(define-public mimose-bin
  (package
    (name "mimose-bin")
    (version "1.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/0xhkamori/mimose-binaries/releases/download/"
                    "v1.9.6-20251211-173322/mimose-" version
                    "-1-x86_64.pkg.tar.zst"))
              (file-name (string-append "mimose-" version ".pkg.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt" "opt/")
               ("usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "tar" "--zstd" "-xf" source))))))
    (native-inputs (list zstd))
    (supported-systems '("x86_64-linux"))
    (synopsis "music app combining Spotify, SoundCloud, VK, and Deezer")
    (description "Mimose is a desktop application that combines multiple music
streaming services including Spotify, SoundCloud, VK, and Deezer into a single
unified interface.  It provides a convenient way to access music across
platforms without switching between apps.")
    (home-page "https://mimose.site")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 3. lutris-live-bin — open gaming platform (binary)
;;; -------------------------------------------------------------------
(define-public lutris-live-bin
  (package
    (name "lutris-live-bin")
    (version "0.5.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lutris/lutris/releases/download/v"
                    version "/lutris_" version "_all.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (inputs
     (list python python-requests python-pillow python-yaml
           python-lxml python-dbus python-pygobject
           gtk+ webkitgtk-with-libsoup2))
    (synopsis "open gaming platform for GNU/Linux")
    (description "Lutris is an open gaming platform for GNU/Linux.  It provides
a unified interface for installing and managing games from various sources
including Steam, GOG, Humble Bundle, and custom installers, with support for
Wine, DOSBox, and other compatibility layers.")
    (home-page "https://lutris.net")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. flaresolverr-bin — proxy to bypass Cloudflare protection
;;; -------------------------------------------------------------------
(define-public flaresolverr-bin
  (package
    (name "flaresolverr-bin")
    (version "3.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FlareSolverr/FlareSolverr/releases/download/v"
                    version "/flaresolverr_linux_x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("flaresolverr" "opt/flaresolverr/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/flaresolverr/flaresolverr")
                              (string-append out "/bin/flaresolverr"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "proxy server to bypass Cloudflare and DDoS-GUARD protection")
    (description "FlareSolverr is a proxy server that starts a browser instance
to solve Cloudflare challenges and DDoS-GUARD protection pages.  It returns
the cookies and page content, allowing automated tools like web scrapers and
media managers to access protected websites.")
    (home-page "https://github.com/FlareSolverr/FlareSolverr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. positron-ide-devel-bin — data science IDE (VS Code fork)
;;; -------------------------------------------------------------------
(define-public positron-ide-devel-bin
  (package
    (name "positron-ide-devel-bin")
    (version "2026.04.0.269")
    (source (origin
              (method url-fetch)
              (uri (let ((ver (string-join
                               (string-split version #\.)
                               "-" 3)))
                     (string-append
                      "https://cdn.posit.co/positron/releases/deb/x86_64/"
                      "Positron-" version "-x64.deb")))
              (file-name (string-append "positron-" version "-x64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "next-generation data science IDE built on VS Code")
    (description "Positron is a next-generation data science IDE built by Posit
on the VS Code platform.  It provides an extensible, polyglot environment for
writing code and exploring data in Python and R, with integrated variable
explorer, data viewer, plot pane, and connection manager.")
    (home-page "https://github.com/posit-dev/positron")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 6. wps-office-365-edu-fonts — WPS Office education font set
;;; -------------------------------------------------------------------
(define-public wps-office-365-edu-fonts
  (package
    (name "wps-office-365-edu-fonts")
    (version "12.1.2.23578")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pubwps-wps365-obs.wpscdn.cn/download/Linux/365edu/"
                    version "/wps-office_" version
                    ".AK.preload.sw.withsn_amd64.deb"))
              (file-name (string-append "wps-office-365-edu-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/fonts" "share/fonts/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"
                           "--wildcards" "*/fonts/*"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "fonts bundled with WPS Office 365 Education edition")
    (description "This package provides the font collection bundled with WPS
Office 365 Education edition.  It includes various Chinese and Latin typefaces
used by WPS Writer, Presentation, and Spreadsheets for document compatibility.")
    (home-page "https://365.wps.cn/edu/home")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 7. vcvrack — open-source Eurorack modular synthesizer simulator
;;; -------------------------------------------------------------------
(define-public vcvrack
  (package
    (name "vcvrack")
    (version "2.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://vcvrack.com/downloads/RackFree-"
                    version "-lin-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Rack2Free" "opt/vcvrack/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/vcvrack/Rack")
                              (string-append out "/bin/vcvrack"))))))))
    (native-inputs (list unzip))
    (inputs (list alsa-lib mesa zenity))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Eurorack modular synthesizer simulator")
    (description "VCV Rack is an open-source virtual Eurorack modular
synthesizer.  It allows building virtual modular synthesizer patches using a
large library of modules that emulate real Eurorack hardware, supporting audio
synthesis, processing, and sequencing.")
    (home-page "https://vcvrack.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. orca-slicer — G-code generator for 3D printers
;;; -------------------------------------------------------------------
(define-public orca-slicer
  (package
    (name "orca-slicer")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SoftFever/OrcaSlicer/releases/download/v"
                    version "/OrcaSlicer_Linux_AppImage_Ubuntu2404_V"
                    version ".AppImage"))
              (file-name (string-append "orca-slicer-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("squashfs-root/usr" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "orca-slicer.AppImage")
                   (chmod "orca-slicer.AppImage" #o755)
                   (invoke "./orca-slicer.AppImage" "--appimage-extract"))))))
    (inputs (list mesa glu gtk+ cairo gstreamer gst-plugins-base))
    (supported-systems '("x86_64-linux"))
    (synopsis "G-code generator for 3D printers")
    (description "Orca Slicer is an open-source G-code generator for 3D
printers.  It supports a wide range of printers including Bambu Lab, Prusa,
Voron, and Creality machines, providing advanced slicing features, multi-color
printing support, and an intuitive user interface for preparing 3D prints.")
    (home-page "https://github.com/SoftFever/OrcaSlicer")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 9. maestral — lightweight Dropbox client
;;; -------------------------------------------------------------------
(define-public maestral
  (package
    (name "maestral")
    (version "1.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SamSchott/maestral")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-click python-dropbox python-fasteners
           python-keyring python-packaging python-pathspec
           python-requests python-rich python-watchdog))
    (synopsis "lightweight open-source Dropbox client for GNU/Linux")
    (description "Maestral is a lightweight, open-source Dropbox client written
in Python.  It provides efficient synchronization with selective sync support,
a command-line interface, and optional system tray integration, while using
fewer resources than the official Dropbox client.")
    (home-page "https://github.com/SamSchott/maestral")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. oterm — text-based terminal client for Ollama
;;; -------------------------------------------------------------------
(define-public oterm
  (package
    (name "oterm")
    (version "0.14.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggozad/oterm")
                    (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs
     (list python-pydantic python-rich python-typer
           python-pillow python-packaging python-httpx
           python-aiosqlite python-dotenv))
    (synopsis "text-based terminal client for Ollama")
    (description "Oterm is a text-based terminal user interface for interacting
with Ollama language models.  It provides chat sessions with history, model
management, image input support, and tool-calling capabilities, all within a
keyboard-driven terminal interface.")
    (home-page "https://github.com/ggozad/oterm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. backup-warden — backup management tool
;;; -------------------------------------------------------------------
(define-public backup-warden
  (package
    (name "backup-warden")
    (version "1.0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/charles-001/backup-warden")
                    (commit (string-append version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel python-poetry-core))
    (propagated-inputs
     (list python-dateutil python-requests python-tabulate
           python-packaging python-paramiko python-boto3))
    (synopsis "streamline backup management with ease")
    (description "Backup Warden is a backup management tool that simplifies
the process of organizing, monitoring, and maintaining backups.  It supports
retention policies, multiple storage backends including S3 and SFTP, Slack
notifications, and flexible configuration for automated backup lifecycle
management.")
    (home-page "https://github.com/charles-001/backup-warden")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. python-mlflow — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: hybrid JavaScript + Python build (yarn frontend + pyproject
;;; backend).  The AUR PKGBUILD uses `yarn install && yarn run build`
;;; inside mlflow/server/js/ before building the Python wheel.  This
;;; requires network access during build for npm/yarn dependencies,
;;; which is incompatible with the Guix build sandbox.  Would need all
;;; JS dependencies pre-fetched and vendored, which is not feasible
;;; without a dedicated node importer pass.

;;; -------------------------------------------------------------------
;;; 13. qmplay2 — video and audio player
;;; -------------------------------------------------------------------
(define-public qmplay2
  (package
    (name "qmplay2")
    (version "25.09.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zaps166/QMPlay2/releases/download/"
                    version "/QMPlay2-src-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUSE_GIT_VERSION=OFF"
                   "-DUSE_PCH=ON"
                   "-DUSE_GLSLC=OFF")
           #:tests? #f))
    (native-inputs (list pkg-config ninja qttools-5))
    (inputs
     (list qtbase-5 qtsvg-5 qtdeclarative-5
           ffmpeg libass mesa libva alsa-lib
           taglib pulseaudio pipewire))
    (synopsis "video and audio player supporting many formats and codecs")
    (description "QMPlay2 is a video and audio player that can play most
formats and codecs.  It features an integrated YouTube browser, module-based
audio visualizations, chiptune playback, CD audio support, and subtitle
rendering.  It uses FFmpeg and Qt for broad format and platform support.")
    (home-page "https://github.com/zaps166/QMPlay2")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 14. 86box-git — emulator for classic IBM PC clones
;;; -------------------------------------------------------------------
(define-public 86box-git
  (package
    (name "86box-git")
    (version "5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/86Box/86Box")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUSE_QT6=ON")
           #:tests? #f))
    (native-inputs (list pkg-config extra-cmake-modules ninja))
    (inputs
     (list qtbase fluidsynth libslirp openal sdl2
           freetype libevdev libpng libsndfile
           libx11 wayland zlib))
    (synopsis "emulator for classic IBM PC clones")
    (description "86Box is an emulator for classic IBM PC compatibles and clones,
covering machines from 1981 through the Pentium II era.  It provides accurate
emulation of period-correct CPUs, chipsets, graphics cards, sound cards, and
network adapters, making it suitable for running vintage operating systems and
software.")
    (home-page "https://86box.net/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. cdesktopenv — Common Desktop Environment
;;; -------------------------------------------------------------------
(define-public cdesktopenv
  (package
    (name "cdesktopenv")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/cdesktopenv/src/"
                    "cde-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=gcc -std=c90"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "sh" "autogen.sh"))))))
    (native-inputs (list autoconf automake libtool bison))
    (inputs
     (list bash libx11 libxau libxext libxinerama libxmu libxpm
           libxrender libxss libxt ncurses openmotif tcl
           ksh libjpeg-turbo libtirpc pam))
    (synopsis "classic UNIX desktop environment")
    (description "The Common Desktop Environment (CDE) is the classic
commercial UNIX desktop environment, originally developed as a joint effort by
HP, IBM, Novell, and Sun.  It provides a complete desktop with file manager,
text editor, terminal emulator, calendar, and other productivity tools in a
traditional Motif-based interface.")
    (home-page "http://sourceforge.net/projects/cdesktopenv/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 16. bottles-git — Wine prefix manager
;;; -------------------------------------------------------------------
(define-public bottles-git
  (package
    (name "bottles-git")
    (version "62.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bottlesdevs/Bottles/archive/refs/tags/"
                    version ".tar.gz"))
              (file-name (string-append "bottles-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f
                     #:glib-or-gtk? #t))
    (native-inputs (list pkg-config blueprint-compiler ninja
                         gettext-minimal `(,glib "bin")))
    (inputs
     (list gtk libadwaita python python-pygobject python-requests
           python-yaml python-pycurl libportal
           dconf imagemagick webkitgtk))
    (synopsis "easily manage Wine prefixes using environments")
    (description "Bottles is a graphical application that makes it easy to
manage Wine prefixes on GNU/Linux.  It provides pre-configured environments
for gaming and software, with support for dependency management, version
switching, and various compatibility tweaks for running Windows applications.")
    (home-page "https://usebottles.com/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. sway-scroll — Wayland compositor with scrolling layout
;;; -------------------------------------------------------------------
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
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-Dwerror=false"
                   "-Db_ndebug=true")
           #:tests? #f))
    (native-inputs (list pkg-config scdoc wayland-protocols))
    (inputs
     (list cairo json-c libdrm libevdev libinput libxcb
           libxkbcommon pango pcre2 pixman wayland
           seatd mesa luajit))
    (synopsis "Wayland compositor with scrolling layout like PaperWM")
    (description "Sway-scroll is a fork of the Sway Wayland compositor that
adds a scrolling window layout similar to PaperWM or niri.  Windows are
arranged in a horizontally scrolling strip, providing an infinite virtual
workspace that can be navigated by scrolling left and right through the window
arrangement.")
    (home-page "https://github.com/dawsers/scroll")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. nautilus-typeahead — GNOME file manager with type-ahead find
;;; -------------------------------------------------------------------
(define-public nautilus-typeahead
  (package
    (name "nautilus-typeahead")
    (version "50.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/nautilus.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-Ddocs=false"
                   "-Dselinux=disabled")
           #:tests? #f))
    (native-inputs
     (list pkg-config `(,glib "bin") gobject-introspection
           gettext-minimal desktop-file-utils))
    (inputs
     (list cairo dconf glib gdk-pixbuf graphene gtk
           libadwaita libportal gstreamer gst-plugins-base
           pango tracker))
    (synopsis "GNOME file manager with restored type-ahead find")
    (description "This is a patched version of GNOME Nautilus, the default file
manager for the GNOME desktop, which restores the type-ahead find feature for
keyboard navigation.  Typing characters immediately filters the file list,
matching the behavior users expect from traditional file managers.")
    (home-page "https://apps.gnome.org/Nautilus/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. somewm-git — AwesomeWM ported to Wayland
;;; -------------------------------------------------------------------
(define-public somewm-git
  (package
    (name "somewm-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trip-zip/somewm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-Dwerror=false"
                   "-Db_sanitize=none")
           #:tests? #f))
    (native-inputs (list pkg-config wayland-protocols))
    (inputs
     (list cairo dbus gdk-pixbuf glib libdrm libinput
           libxcb libxkbcommon luajit pango pixman
           seatd vulkan-loader wayland))
    (synopsis "AwesomeWM ported to Wayland with 100% Lua API compatibility")
    (description "SomeWM is a port of AwesomeWM to the Wayland display protocol.
It provides 100% Lua API compatibility with AwesomeWM, allowing users to reuse
their existing configurations and widget code while gaining native Wayland
support, modern input handling, and improved security.")
    (home-page "https://github.com/trip-zip/somewm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. apollo — self-hosted game streaming server
;;; -------------------------------------------------------------------
(define-public apollo
  (package
    (name "apollo")
    (version "0.4.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ClassicOldSong/Apollo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DSUNSHINE_ENABLE_CUDA=OFF"
                   "-DSUNSHINE_ENABLE_WAYLAND=ON"
                   "-DSUNSHINE_ENABLE_X11=ON"
                   "-DSUNSHINE_ENABLE_DRM=ON")))
    (native-inputs (list pkg-config cmake ninja))
    (inputs
     (list boost curl gtk+ libcap libdrm libevdev
           avahi libnotify libva miniupnpc
           numactl openssl opus pulseaudio
           wayland libx11 libxcb libxfixes libxrandr
           mesa))
    (synopsis "self-hosted game stream server for Moonlight")
    (description "Apollo is a self-hosted game streaming server, forked from
Sunshine, that supports the Moonlight client protocol.  It enables streaming
games and applications from a host PC to other devices on the network with low
latency, supporting hardware-accelerated encoding via VAAPI and NVENC.")
    (home-page "https://github.com/ClassicOldSong/Apollo")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 21. gopher64-git — Nintendo 64 emulator
;;; -------------------------------------------------------------------
(define-public gopher64-git
  (package
    (name "gopher64-git")
    (version "1.1.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gopher64/gopher64")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "target/release/gopher64" bin)))))))
    (native-inputs (list pkg-config cmake))
    (inputs
     (list fontconfig freetype vulkan-loader alsa-lib
           libdrm wayland libxkbcommon mesa))
    (synopsis "Nintendo 64 emulator written in Rust")
    (description "Gopher64 is a Nintendo 64 emulator written in Rust.  It uses
the parallel-rdp library for accurate RDP (Reality Display Processor)
emulation via Vulkan compute shaders, providing high-fidelity rendering of N64
graphics with good performance.")
    (home-page "https://github.com/gopher64/gopher64/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. linuxcnc — CNC machine controller
;;; -------------------------------------------------------------------
(define-public linuxcnc
  (package
    (name "linuxcnc")
    (version "2.9.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LinuxCNC/linuxcnc/archive/refs/tags/v"
                    version ".tar.gz"))
              (file-name (string-append "linuxcnc-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--with-realtime=uspace"
                   "--without-libmodbus"
                   "--disable-gtk2")
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'enter-src
                 (lambda _
                   (chdir "src")))
               (replace 'bootstrap
                 (lambda _
                   (invoke "sh" "autogen.sh"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config intltool
           asciidoc))
    (inputs
     (list python gtk+ libusb libxss boost readline
           tcl tk libtirpc gstreamer))
    (synopsis "controls CNC machines including mills, lathes, and 3D printers")
    (description "LinuxCNC is a real-time software system for controlling CNC
machines such as milling machines, lathes, plasma cutters, routers, 3D
printers, and robotic arms.  It provides a complete motion control system with
G-code interpreter, trajectory planner, and hardware abstraction layer
supporting a wide range of motion control hardware.")
    (home-page "https://linuxcnc.org/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 23. sunshine — self-hosted game stream host for Moonlight
;;; -------------------------------------------------------------------
(define-public sunshine
  (package
    (name "sunshine")
    (version "2025.924.154138")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LizardByte/Sunshine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DSUNSHINE_ENABLE_CUDA=OFF"
                   "-DSUNSHINE_ENABLE_WAYLAND=ON"
                   "-DSUNSHINE_ENABLE_X11=ON"
                   "-DSUNSHINE_ENABLE_DRM=ON")))
    (native-inputs (list pkg-config cmake))
    (inputs
     (list avahi curl boost libcap libdrm libevdev
           libnotify libva libx11 libxcb libxfixes
           libxrandr libxtst miniupnpc numactl openssl
           opus pulseaudio mesa))
    (synopsis "self-hosted game stream host for Moonlight")
    (description "Sunshine is a self-hosted game streaming server that works
with Moonlight clients.  It enables low-latency streaming of games and desktop
applications from a host PC to other devices, supporting hardware-accelerated
video encoding via VAAPI, NVENC, and AMF, with both Wayland and X11 capture.")
    (home-page "https://app.lizardbyte.dev/Sunshine")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 24. gamescope-nvidia — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: requires 7+ vendored git submodules (wlroots, libliftoff,
;;; libdisplay-info, vkroots, openvr, reshade, SPIRV-Headers) that
;;; must be fetched individually with specific commits.  The PKGBUILD
;;; also applies multiple NVIDIA-specific patches from GitHub PRs and
;;; gists.  This level of submodule management and patch wrangling
;;; exceeds what can be reliably automated in a single recipe pass.
;;; Would require a dedicated dependency-packaging effort first.

;;; -------------------------------------------------------------------
;;; 25. dsnote — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: CMake build downloads Vosk speech recognition models during
;;; the build phase (-DDOWNLOAD_VOSK=ON), which requires network access
;;; and violates the Guix build sandbox.  Also builds FFmpeg internally
;;; and has experimental CUDA support.  Would need Vosk packaged
;;; separately and the download steps patched out, plus internal FFmpeg
;;; build replaced with system FFmpeg dependency.

;;; -------------------------------------------------------------------
;;; 26. citron — Nintendo Switch emulator
;;; -------------------------------------------------------------------
(define-public citron
  (package
    (name "citron")
    (version "2026.02.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.citron-emu.org/citron/emulator.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_QT6=ON"
                   "-DUSE_SYSTEM_SDL2=ON"
                   "-DUSE_SYSTEM_FFMPEG=ON"
                   "-DUSE_SYSTEM_ENET=ON"
                   "-DUSE_SYSTEM_OPUS=ON"
                   "-DUSE_SYSTEM_LIBUSB=ON"
                   "-DUSE_SYSTEM_ZLIB=ON"
                   "-DUSE_SYSTEM_ZSTD=ON")))
    (native-inputs
     (list pkg-config cmake ninja nlohmann-json glslang
           qttools vulkan-headers))
    (inputs
     (list qtbase qtwebengine boost ffmpeg sdl2 libusb
           enet opus lz4 zlib zstd openssl openal
           fmt speexdsp))
    (synopsis "Nintendo Switch emulator (yuzu fork)")
    (description "Citron is a Nintendo Switch emulator forked from yuzu.  It
provides experimental emulation of the Nintendo Switch hardware, supporting
many commercial titles with Vulkan and OpenGL rendering backends, shader
caching, and multiplayer support.")
    (home-page "https://citron-emu.org")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 27. xemu-git — original Xbox emulator
;;; -------------------------------------------------------------------
(define-public xemu-git
  (package
    (name "xemu-git")
    (version "0.8.134")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xemu-project/xemu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--audio-drv-list=sdl"
                   "--disable-docs"
                   "--disable-werror"
                   "--enable-pie"
                   "--target-list=i386-softmmu"
                   (string-append "--extra-cflags=-DXBOX=1"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key parallel-build? #:allow-other-keys)
                   (invoke "make"
                           (string-append
                            "-j" (number->string
                                  (if parallel-build?
                                      (parallel-job-count) 1)))
                           "qemu-system-i386"))))))
    (native-inputs (list pkg-config python meson ninja cmake))
    (inputs
     (list curl glib mesa libepoxy libpcap sdl2
           libslirp libusb openssl pixman zlib))
    (synopsis "original Xbox emulator based on QEMU")
    (description "Xemu is a free and open-source emulator for the original
Microsoft Xbox, built on a fork of QEMU.  It provides low-level hardware
emulation of the Xbox's custom Nvidia NV2A GPU, Intel Pentium III CPU, and
peripheral devices, enabling accurate emulation of original Xbox games.")
    (home-page "https://xemu.app/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 28. syca — alternative to sudo using Ruby and PAM
;;; -------------------------------------------------------------------
(define-public syca
  (package
    (name "syca")
    (version "1.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xraincandy/syca")
                    (commit (string-append "v" version))))
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
                   (invoke "gcc" "syca-helper.c" "-o" "syca-helper")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (install-file "syca" bin)
                     (install-file "syca-helper" bin)
                     (install-file "syca-pam-auth.py" bin)))))))
    (inputs (list ruby python))
    (synopsis "alternative privilege elevation tool using Ruby and PAM")
    (description "Syca is an alternative to sudo that provides privilege
elevation using Ruby and Python PAM authentication.  It includes a setuid
helper binary for executing commands with elevated privileges and a PAM-based
authentication module for verifying user credentials.")
    (home-page "https://github.com/0xraincandy/syca")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 29. idescriptor-git — cross-platform iDevice management tool
;;; -------------------------------------------------------------------
(define-public idescriptor-git
  (package
    (name "idescriptor-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/iDescriptor/iDescriptor")
                    (commit "6d86243")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config cmake))
    (inputs
     (list qtbase libimobiledevice libusbmuxd
           libplist openssl curl zlib))
    (synopsis "free and open-source cross-platform iDevice management tool")
    (description "iDescriptor is a free, open-source, and cross-platform tool
for managing Apple iOS devices.  It provides device information display, app
management, file browsing, backup and restore functionality, and other device
management features without requiring iTunes or Finder.")
    (home-page "https://github.com/iDescriptor/iDescriptor")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 30. rog-perf-tuner-git — BLOCKED
;;; -------------------------------------------------------------------
;;; Reason: hybrid CMake + pnpm/npm build system with pip install
;;; commands during build phase.  The PKGBUILD runs
;;; `pip install --break-system-packages asyncio pyyaml` during build,
;;; which is incompatible with Guix's isolated build sandbox.  Also
;;; requires pnpm for JavaScript frontend components and uses
;;; git submodule update with network access.  Would need all JS and
;;; Python dependencies pre-packaged and the build system patched
;;; to avoid network access.
