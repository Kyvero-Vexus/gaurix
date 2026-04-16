;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. crark (copy/binary, v5.5, unknown/proprietary)
;;;   2. rs-visa (copy/.deb, v5.12.9, proprietary)
;;;   3. visual-studio-code-live-bin (copy/tar.gz, v0.44.1, nonfree)
;;;   4. tartube (pyproject, v2.5.197, LGPL-2.1+)
;;;   5. remarshal (pyproject, v1.3.0, MIT)
;;;   6. gpu-viewer (meson, v3.32, GPL-3.0+)
;;;   7. lue-reader-git (pyproject, v0.3.1, GPL-3.0+)
;;;   8. turtle (pyproject, v0.14, GPL-3.0+)
;;;   9. snowflake-connector-python (pyproject, v3.17.1, Apache-2.0)
;;;  10. bauh (pyproject, v0.10.7, zlib)
;;;  11. normcap (pyproject, v0.6.0, AGPL-3.0+)
;;;  12. mujoco (copy/tar.gz, v3.7.0, Apache-2.0)
;;;  13. vbam-sdl (cmake, v2.2.3, GPL-2.0)
;;;  14. ecwolf-git (cmake, v1.3.3, GPL-2.0+)
;;;  15. spaghettikart (cmake, v1.0.0, MIT)
;;;  16. bind-utils-standalone (gnu, v9.20.22, MPL-2.0)
;;;  17. droidcam (gnu, v2.1.5, GPL-2.0+)
;;;  18. wiiudownloader (copy/binary, v2.89, GPL-3.0+)
;;;  19. nulloy (gnu, v0.9.9, GPL-3.0)
;;;  20. pulsemeeter-git (pyproject, v2.0.0, MIT)
;;;  21. foldingathome (copy/binary, v8.5.5, GPL-3.0+)
;;;  22. xawtv (gnu, v3.107, GPL-2.0+)
;;;  23. isd-git (pyproject, v0.5.1, GPL-3.0+)
;;;  24. c47 (meson, v00.109.03.01b1, GPL-3.0+)
;;;  25. ldapvi (gnu, v1.8, GPL-2.0)
;;;  26. boxflat-git (pyproject, v1.0.0, GPL-3.0+)
;;;  27. katvan (cmake, v0.12.0, GPL-3.0+)
;;;  28. qimgv-qt6-kde-git (cmake, v1.0.3, GPL-3.0+)
;;;  29. pandora-launcher-git (copy/binary, v2.6.0, MIT)
;;;  30. vita3k-git (copy/AppImage, latest, GPL-2.0+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages video)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages music)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages hunspell)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages libffi)
  #:export (
            crark
            rs-visa
            visual-studio-code-live-bin
            tartube
            remarshal
            gpu-viewer
            lue-reader-git
            turtle-git-manager
            snowflake-connector-python
            bauh
            normcap
            mujoco-bin
            vbam-sdl
            ecwolf-git
            spaghettikart
            bind-utils-standalone
            droidcam
            wiiudownloader-bin
            nulloy
            pulsemeeter-git
            foldingathome-bin
            xawtv
            isd-git
            c47
            ldapvi
            boxflat-git
            katvan
            qimgv-qt6-kde-git
            pandora-launcher-bin
            vita3k-bin
            ))

;;; Nonfree license placeholder (for proprietary binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; -------------------------------------------------------------------
;;; 1. crark — RAR password cracker (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public crark
  (package
    (name "crark")
    (version "5.5")
    (source (origin
              (method url-fetch)
              (uri "http://www.crark.net/download/crark55-linux.rar")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("crark" "bin/crark")
               ("crark-hp" "bin/crark-hp"))))
    (synopsis "command-line RAR password recovery tool")
    (description "cRARk is a freeware utility for recovering passwords of
RAR/WinRAR archives.  It supports GPU-accelerated cracking via CUDA and
OpenCL for significantly faster recovery.")
    (home-page "http://www.crark.net/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 2. rs-visa — Rohde & Schwarz VISA library (binary .deb repackage)
;;; -------------------------------------------------------------------
(define-public rs-visa
  (package
    (name "rs-visa")
    (version "5.12.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://scdn.rohde-schwarz.com/ur/pws/dl_downloads/"
                    "dl_application/application_notes/1dc02___rs_v/"
                    "rsvisa_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib")
               ("usr/include" "include")
               ("usr/share" "share"))))
    (synopsis "Rohde & Schwarz VISA instrument control library")
    (description "RS VISA is a proprietary implementation of the Virtual
Instrument Software Architecture (VISA) standard from Rohde & Schwarz.
It provides libraries and tools for controlling test and measurement
instruments over GPIB, USB, LAN, and serial interfaces.")
    (home-page "https://www.rohde-schwarz.com/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 3. visual-studio-code-live-bin — VS Code auto-updating binary
;;; -------------------------------------------------------------------
(define-public visual-studio-code-live-bin
  (package
    (name "visual-studio-code-live-bin")
    (version "0.44.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://update.code.visualstudio.com/"
                    version "/linux-x64/stable"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vscode-live"))))
    (synopsis "Visual Studio Code editor (auto-updating binary)")
    (description "Visual Studio Code is a lightweight source-code editor by
Microsoft with support for debugging, syntax highlighting, intelligent code
completion, snippets, and code refactoring.  This is the auto-updating
binary release.")
    (home-page "https://code.visualstudio.com/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 4. tartube — GUI front-end for youtube-dl/yt-dlp
;;; -------------------------------------------------------------------
(define-public tartube
  (package
    (name "tartube")
    (version "2.5.197")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/axcore/tartube")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests python-pygobject))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list gtk+))
    (synopsis "GUI front-end for youtube-dl and yt-dlp video downloaders")
    (description "Tartube is a graphical front-end for youtube-dl, yt-dlp, and
other compatible video downloaders.  It allows managing downloads with a
point-and-click interface, organizing videos into folders, and scheduling
downloads.")
    (home-page "https://github.com/axcore/tartube")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 5. remarshal — convert between CBOR, JSON, MessagePack, TOML, YAML
;;; -------------------------------------------------------------------
(define-public remarshal
  (package
    (name "remarshal")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dbohdan/remarshal")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pyyaml python-toml))
    (native-inputs
     (list python-poetry-core python-wheel))
    (synopsis "convert between CBOR, JSON, MessagePack, TOML, and YAML")
    (description "Remarshal converts between CBOR, JSON, MessagePack, TOML,
and YAML formats.  It can be used as a command-line tool or as a Python
library for data serialization format conversion.")
    (home-page "https://github.com/dbohdan/remarshal")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. gpu-viewer — front-end for GPU information tools
;;; -------------------------------------------------------------------
(define-public gpu-viewer
  (package
    (name "gpu-viewer")
    (version "3.32")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/arunsivaramanneo/GPU-Viewer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list gtk python python-pygobject))
    (native-inputs
     (list pkg-config gettext-minimal))
    (synopsis "graphical front-end for OpenGL, Vulkan, and OpenCL info")
    (description "GPU-Viewer is a GTK4/Adwaita front-end that displays
information from glxinfo, vulkaninfo, clinfo, and other GPU diagnostic
tools in a graphical interface.")
    (home-page "https://github.com/arunsivaramanneo/GPU-Viewer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7. lue-reader-git — terminal eBook reader with TTS
;;; -------------------------------------------------------------------
(define-public lue-reader-git
  (package
    (name "lue-reader-git")
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/superstarryeyes/lue")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-rich))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "terminal eBook reader with text-to-speech support")
    (description "Lue is a terminal-based eBook reader with text-to-speech
support.  It can read EPUB, PDF, DOCX, RTF, Markdown, and plain text
files directly in the terminal with TTS narration via edge-tts.")
    (home-page "https://github.com/superstarryeyes/lue")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. turtle — manage git repositories in Nautilus
;;; -------------------------------------------------------------------
(define-public turtle-git-manager
  (package
    (name "turtle-git-manager")
    (version "0.14")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/philippun1/turtle")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-pygit2))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list libadwaita))
    (synopsis "manage git repositories with dialogs in Nautilus")
    (description "Turtle integrates git repository management into the
GNOME Nautilus file manager.  It provides easy-to-use dialogs for common
git operations like commit, push, pull, branching, and viewing diffs.")
    (home-page "https://gitlab.gnome.org/philippun1/turtle")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. snowflake-connector-python — Snowflake DB-API 2.0 connector
;;; -------------------------------------------------------------------
(define-public snowflake-connector-python
  (package
    (name "snowflake-connector-python")
    (version "3.17.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/snowflakedb/snowflake-connector-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests python-urllib3 python-cryptography
           python-pyopenssl python-cffi python-certifi))
    (native-inputs
     (list python-setuptools python-wheel python-cython))
    (synopsis "Snowflake data warehouse Python connector (DB-API 2.0)")
    (description "The Snowflake Connector for Python provides a Python
DB-API 2.0 compliant interface for connecting to Snowflake data warehouse.
It supports standard SQL queries, bulk data loading, and integration with
pandas DataFrames.")
    (home-page "https://github.com/snowflakedb/snowflake-connector-python")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 10. bauh — graphical application manager
;;; -------------------------------------------------------------------
(define-public bauh
  (package
    (name "bauh")
    (version "0.10.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vinifmor/bauh")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-requests python-pyyaml python-dateutil))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "graphical interface for managing Linux applications")
    (description "Bauh is a graphical interface for managing applications
from multiple packaging formats including AppImage, Flatpak, and Snap.
It provides a unified search, install, update, and removal interface.")
    (home-page "https://github.com/vinifmor/bauh")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 11. normcap — OCR-powered screen capture tool
;;; -------------------------------------------------------------------
(define-public normcap
  (package
    (name "normcap")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dynobo/normcap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-hatchling python-wheel))
    (inputs
     (list leptonica))
    (synopsis "OCR-powered screen-capture tool for text extraction")
    (description "NormCap captures a portion of the screen and uses OCR
(optical character recognition) to extract text from the captured area.
It supports multiple languages and outputs text to the clipboard.")
    (home-page "https://github.com/dynobo/normcap")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 12. mujoco-bin — physics simulator (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public mujoco-bin
  (package
    (name "mujoco-bin")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/google-deepmind/mujoco/releases/download/"
                    version "/mujoco-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "bin")
               ("lib" "lib")
               ("include" "include")
               ("share" "share"))))
    (synopsis "multi-joint dynamics with contact physics simulator")
    (description "MuJoCo (Multi-Joint dynamics with Contact) is a general
purpose physics engine that aims to facilitate research and development in
robotics, biomechanics, graphics and animation, machine learning, and
other areas that demand fast and accurate simulation of articulated
structures interacting with their environment.")
    (home-page "https://www.mujoco.org")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 13. vbam-sdl — Nintendo Game Boy Advance emulator (SDL)
;;; -------------------------------------------------------------------
(define-public vbam-sdl
  (package
    (name "vbam-sdl")
    (version "2.2.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/visualboyadvance-m/visualboyadvance-m")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_SDL=ON"
                   "-DENABLE_WX=OFF"
                   "-DENABLE_LINK=ON")))
    (inputs
     (list sdl2 libpng zlib mesa openal ffmpeg))
    (native-inputs
     (list pkg-config))
    (synopsis "Nintendo Game Boy Advance emulator (SDL interface)")
    (description "VisualBoyAdvance-M is a Game Boy, Game Boy Color, and
Game Boy Advance emulator.  This build uses the SDL interface for a
lightweight command-line and windowed experience without wxWidgets.")
    (home-page "https://visualboyadvance-m.org")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 14. ecwolf-git — enhanced Wolfenstein 3D source port
;;; -------------------------------------------------------------------
(define-public ecwolf-git
  (package
    (name "ecwolf-git")
    (version "1.3.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ArcadeRenegade/ecwolf")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list sdl2 sdl2-mixer sdl2-net libjpeg-turbo zlib))
    (native-inputs
     (list pkg-config))
    (synopsis "enhanced source port of Wolfenstein 3D")
    (description "ECWolf is an advanced source port of Wolfenstein 3D and
Spear of Destiny, based on Wolf4SDL.  It provides modern features like
widescreen support, high resolution rendering, modern controls, and
enhanced modding capabilities while preserving classic gameplay.")
    (home-page "http://maniacsvault.net/ecwolf")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. spaghettikart — Mario Kart 64 native port
;;; -------------------------------------------------------------------
(define-public spaghettikart
  (package
    (name "spaghettikart")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HarbourMasters/SpaghettiKart")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list sdl2 sdl2-net libpng zlib))
    (native-inputs
     (list pkg-config))
    (synopsis "unofficial native PC port of Mario Kart 64")
    (description "SpaghettiKart is an unofficial native PC port of Mario
Kart 64 by the Harbour Masters team.  It features modern rendering,
widescreen support, high frame rates, and quality-of-life improvements
while preserving the original gameplay.  A legal ROM dump is required.")
    (home-page "https://github.com/HarbourMasters/SpaghettiKart")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. bind-utils-standalone — DNS client utilities from BIND
;;; -------------------------------------------------------------------
(define-public bind-utils-standalone
  (package
    (name "bind-utils-standalone")
    (version "9.20.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.isc.org/isc/bind9/"
                    version "/bind-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--without-python"
                   "--disable-linux-caps")))
    (inputs
     (list openssl readline ncurses zlib))
    (native-inputs
     (list pkg-config))
    (synopsis "DNS client utilities: dig, host, nslookup, nsupdate, delv")
    (description "This package provides the DNS client utilities from ISC
BIND: @command{dig}, @command{host}, @command{nslookup}, @command{nsupdate},
@command{delv}, and @command{mdig}.  These are standalone tools for querying
DNS servers and managing DNS records without installing the full BIND server.")
    (home-page "https://www.isc.org/bind/")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 17. droidcam — use phone as a webcam
;;; -------------------------------------------------------------------
(define-public droidcam
  (package
    (name "droidcam")
    (version "2.1.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dev47apps/droidcam-linux-client")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs
     (list ffmpeg gtk+ libjpeg-turbo speex alsa-lib))
    (native-inputs
     (list pkg-config))
    (synopsis "turn your Android/iOS phone into a Linux webcam")
    (description "DroidCam turns your Android or iOS phone into a webcam for
your Linux computer.  It connects over WiFi or USB and creates a V4L2
loopback device that can be used with any video conferencing or streaming
application.")
    (home-page "https://github.com/dev47apps/droidcam-linux-client")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 18. wiiudownloader-bin — Wii U encrypted file downloader
;;; -------------------------------------------------------------------
(define-public wiiudownloader-bin
  (package
    (name "wiiudownloader-bin")
    (version "2.89")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Xpl0itU/WiiUDownloader/releases/download/v"
                    version "/WiiUDownloader-" version "-linux-amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("WiiUDownloader" "bin/WiiUDownloader"))))
    (synopsis "download encrypted Wii U files from Nintendo servers")
    (description "WiiUDownloader allows downloading encrypted Wii U game and
update files from Nintendo's official content delivery servers.  It provides
a GTK3 graphical interface for browsing and downloading titles.")
    (home-page "https://github.com/Xpl0itU/WiiUDownloader")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 19. nulloy — music player with waveform progress bar
;;; -------------------------------------------------------------------
(define-public nulloy
  (package
    (name "nulloy")
    (version "0.9.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nulloy/nulloy/releases/download/"
                    version "/nulloy-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))))))))
    (inputs
     (list gstreamer gst-plugins-base gst-plugins-good
           qtbase-5 taglib zlib))
    (native-inputs
     (list pkg-config))
    (synopsis "music player with a waveform progress bar")
    (description "Nulloy is a lightweight music player with a unique waveform
progress bar that shows the audio waveform of the currently playing track.
It uses GStreamer for audio playback and supports tag reading via TagLib.")
    (home-page "http://nulloy.com/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 20. pulsemeeter-git — PulseAudio/PipeWire audio routing
;;; -------------------------------------------------------------------
(define-public pulsemeeter-git
  (package
    (name "pulsemeeter-git")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/theRealCarneiro/pulsemeeter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list gtk+ pulseaudio))
    (synopsis "PulseAudio and PipeWire audio routing application")
    (description "PulseMeeter is a GTK-based audio routing application for
PulseAudio and PipeWire.  It provides a graphical interface for managing
virtual audio sinks and sources, routing audio between applications, and
applying effects to audio streams.")
    (home-page "https://github.com/theRealCarneiro/pulsemeeter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. foldingathome-bin — distributed computing client (binary)
;;; -------------------------------------------------------------------
(define-public foldingathome-bin
  (package
    (name "foldingathome-bin")
    (version "8.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/foldingathome/fah-client-bastet/"
                    "releases/download/v" version
                    "/fah-client_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin" "bin")
               ("usr/share" "share"))))
    (synopsis "Folding@home distributed computing client")
    (description "Folding@home is a distributed computing project for
simulating protein dynamics, including the process of protein folding and
the movements of proteins implicated in a variety of diseases.  This
package provides the client software that runs simulations on your
computer to contribute to scientific research.")
    (home-page "https://foldingathome.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 22. xawtv — X11 TV viewer application
;;; -------------------------------------------------------------------
(define-public xawtv
  (package
    (name "xawtv")
    (version "3.107")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://linuxtv.org/downloads/xawtv/xawtv-"
                    version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list libx11 libxaw libxv libxrandr libxinerama
           libxft mesa alsa-lib))
    (native-inputs
     (list pkg-config autoconf automake))
    (synopsis "X11 television viewer and video capture application")
    (description "XawTV is an X11-based TV viewer application for Video4Linux
devices.  It supports analog TV tuners, webcams, and other V4L2 capture
devices.  The package also includes several utilities for video capture
and format conversion.")
    (home-page "https://linuxtv.org/wiki/index.php/Xawtv")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 23. isd-git — interactive TUI for systemd units
;;; -------------------------------------------------------------------
(define-public isd-git
  (package
    (name "isd-git")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/isd-project/isd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pyyaml))
    (native-inputs
     (list python-hatchling python-wheel))
    (inputs
     (list elogind))
    (synopsis "interactive TUI for managing systemd units")
    (description "ISD is an interactive terminal user interface for managing
systemd units.  It provides a Textual-based TUI with fuzzy search, real-time
status monitoring, journal viewing, and unit management (start, stop,
restart, enable, disable) capabilities.")
    (home-page "https://github.com/isd-project/isd")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 24. c47 — RPN pocket calculator emulator
;;; -------------------------------------------------------------------
(define-public c47
  (package
    (name "c47")
    (version "00.109.03.01b1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/rpncalculators/c43")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list gtk+ glib cairo gmp))
    (native-inputs
     (list pkg-config python))
    (synopsis "emulator for the C47 RPN scientific pocket calculator")
    (description "C47 is a GTK-based emulator for the C47 RPN (Reverse Polish
Notation) scientific pocket calculator.  It faithfully reproduces the
calculator's interface and functionality, supporting complex number
arithmetic, matrix operations, statistical functions, and programmability.")
    (home-page "https://47calc.com")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. ldapvi — interactive LDAP client for terminals
;;; -------------------------------------------------------------------
(define-public ldapvi
  (package
    (name "ldapvi")
    (version "1.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ldapvi/ldapvi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list glib openssl ncurses readline))
    (native-inputs
     (list autoconf automake pkg-config))
    (synopsis "interactive LDAP client for Unix terminals")
    (description "ldapvi is an interactive LDAP client for Unix terminals.
It lets you view and update LDAP entries using a text editor, similar to
how @command{edquota} works for disk quotas.  It supports LDIF format
for import/export and provides shell-like command-line editing.")
    (home-page "https://github.com/ldapvi/ldapvi")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 26. boxflat-git — Moza Racing settings manager
;;; -------------------------------------------------------------------
(define-public boxflat-git
  (package
    (name "boxflat-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Lawstorant/boxflat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-pyyaml python-pycairo))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list gtk libadwaita eudev))
    (synopsis "adjust Moza Racing wheel and pedal settings on Linux")
    (description "Boxflat is a GTK4/Adwaita application for adjusting Moza
Racing hardware settings on Linux.  It communicates with Moza Racing
wheels, pedals, and other peripherals via serial protocol to configure
force feedback, sensitivity, dead zones, and other parameters.")
    (home-page "https://github.com/Lawstorant/boxflat")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. katvan — editor for Typst files with RTL support
;;; -------------------------------------------------------------------
(define-public katvan
  (package
    (name "katvan")
    (version "0.12.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/IgKh/katvan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list qtbase hunspell libarchive))
    (native-inputs
     (list pkg-config))
    (synopsis "editor for Typst files with right-to-left text support")
    (description "Katvan is a bare-bones editor for Typst document markup
files with a bias for right-to-left (RTL) text editing.  It provides
syntax highlighting, spell checking via Hunspell, and a live preview
of the rendered Typst document.")
    (home-page "https://katvan.app")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. qimgv-qt6-kde-git — Qt6 image viewer
;;; -------------------------------------------------------------------
(define-public qimgv-qt6-kde-git
  (package
    (name "qimgv-qt6-kde-git")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/easymodo/qimgv")
                    (commit (string-append "v" version "-alpha"))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list qtbase libexif))
    (native-inputs
     (list pkg-config))
    (synopsis "fast, configurable Qt6 image viewer with video support")
    (description "qimgv is a fast and configurable Qt6 image viewer with video
playback support via mpv.  It features a minimal interface, keyboard-driven
navigation, basic image editing, and support for common image formats
including animated GIFs and WebP.")
    (home-page "https://github.com/easymodo/qimgv")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. pandora-launcher-bin — Minecraft launcher (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public pandora-launcher-bin
  (package
    (name "pandora-launcher-bin")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moulberry/pandora-launcher/releases/download/v"
                    version "/pandora-launcher-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pandora-launcher-linux-x86_64" "bin/pandora-launcher"))))
    (synopsis "modern Minecraft launcher for Linux")
    (description "Pandora Launcher is a modern Minecraft launcher that
balances ease-of-use with powerful features.  It supports multiple instances,
mod management, and provides a clean interface for managing Minecraft
installations on Linux.")
    (home-page "http://pandora.moulberry.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. vita3k-bin — PlayStation Vita emulator (binary)
;;; -------------------------------------------------------------------
(define-public vita3k-bin
  (package
    (name "vita3k-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vita3K/Vita3K/releases/download/v"
                    version "/Vita3K-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Vita3K-x86_64.AppImage" "bin/vita3k"))))
    (synopsis "experimental PlayStation Vita emulator")
    (description "Vita3K is an experimental open-source PlayStation Vita
emulator for Linux.  It aims to provide accurate emulation of the PS Vita
hardware and can run a growing number of commercial and homebrew titles.
A legal firmware and game dumps are required.")
    (home-page "https://github.com/Vita3K/Vita3K")
    (license license:gpl2+)))
