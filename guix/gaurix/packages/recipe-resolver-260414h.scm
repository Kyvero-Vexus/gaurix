;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414h
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 30 recipes created (copy, pyproject, gnu, cmake, go)
;;;
;;; Recipes (30):
;;;   sing-box-bin, prek-bin, uutils-diffutils-bin, czkawka-gui-bin,
;;;   kdotool-bin, elide-bin, catapult-bin, upscayl-bin, koreader-bin,
;;;   proton-mail-bin, the-honkers-railway-launcher-bin, cc-switch-bin,
;;;   whph-bin, peazip-qt-bin, dorion-bin, elysia-bin,
;;;   python-fangfrisch, python-barcode, python-poetry-plugin-shell,
;;;   python-rich-inquirer, python-bump-my-version,
;;;   python-opentelemetry-propagator-jaeger,
;;;   python-opentelemetry-propagator-b3,
;;;   python-opentelemetry-opentracing-shim,
;;;   lug-helper, novafetch, zswap-cli, mihomo-alpha,
;;;   streamlink-twitch-gui-bin, jellyfin-server-bin
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:export (sing-box-bin
            prek-bin
            uutils-diffutils-bin
            czkawka-gui-bin
            kdotool-bin
            elide-bin
            catapult-bin
            upscayl-bin
            koreader-bin
            proton-mail-bin
            the-honkers-railway-launcher-bin
            cc-switch-bin
            whph-bin
            peazip-qt-bin
            dorion-bin
            elysia-bin
            python-fangfrisch
            python-barcode
            python-poetry-plugin-shell
            python-rich-inquirer
            python-bump-my-version
            python-opentelemetry-propagator-jaeger
            python-opentelemetry-propagator-b3
            python-opentelemetry-opentracing-shim
            lug-helper
            novafetch
            zswap-cli
            mihomo-alpha
            streamlink-twitch-gui-bin
            jellyfin-server-bin))

;;;
;;; --- 1. sing-box-bin (copy-build-system, pre-built Go binary) ---
;;;

(define-public sing-box-bin
  (package
    (name "sing-box-bin")
    (version "1.13.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SagerNet/sing-box/releases/download/v"
                    version "/sing-box-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "sing-box-" #$version
                                        "-linux-amd64/sing-box")
                         "bin/"))))
    (synopsis "Universal proxy platform")
    (description "Sing-box is a universal proxy platform that supports
multiple protocols including Shadowsocks, VMess, Trojan, VLESS, and
WireGuard.  It provides a unified interface for managing proxy connections.")
    (home-page "https://sing-box.sagernet.org")
    (license license:gpl3+)))

;;;
;;; --- 2. prek-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public prek-bin
  (package
    (name "prek-bin")
    (version "0.3.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/j178/prek/releases/download/v"
                    version "/prek-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("prek" "bin/"))))
    (synopsis "better pre-commit, re-engineered in Rust")
    (description "Prek is a re-implementation of pre-commit in Rust, providing
faster Git hook management.  It supports the same configuration format as
pre-commit while offering improved performance.")
    (home-page "https://github.com/j178/prek")
    (license license:expat)))

;;;
;;; --- 3. uutils-diffutils-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public uutils-diffutils-bin
  (package
    (name "uutils-diffutils-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/uutils/diffutils/releases/download/v"
                    version "/diffutils-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("diff" "bin/uutils-diff")
               ("cmp" "bin/uutils-cmp")
               ("diff3" "bin/uutils-diff3")
               ("sdiff" "bin/uutils-sdiff"))))
    (synopsis "Rust implementation of diffutils")
    (description "A Rust reimplementation of the GNU diffutils suite (diff,
cmp, diff3, sdiff).  Provides drop-in replacements with improved performance
and memory safety.")
    (home-page "https://github.com/uutils/diffutils")
    (license (list license:asl2.0 license:expat))))

;;;
;;; --- 4. czkawka-gui-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public czkawka-gui-bin
  (package
    (name "czkawka-gui-bin")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qarmin/czkawka/releases/download/"
                    version "/linux_czkawka_gui_heif"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("linux_czkawka_gui_heif" "bin/czkawka_gui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/czkawka_gui")
                          #o755))))))
    (inputs (list gtk4 libheif))
    (synopsis "find and manage duplicate files, empty folders, similar images")
    (description "Czkawka is a tool for finding duplicates, empty folders,
temporary files, similar images, and other file system lint.  This binary
package includes HEIF image format support.")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:expat)))

;;;
;;; --- 5. kdotool-bin (copy-build-system, pre-built binary) ---
;;;

(define-public kdotool-bin
  (package
    (name "kdotool-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jinliu/kdotool/releases/download/v"
                    version "/kdotool"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kdotool" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/kdotool")
                          #o755))))))
    (synopsis "xdotool clone for KDE Wayland")
    (description "Kdotool is a command-line tool for automating KDE Wayland
window management.  It provides xdotool-like functionality through the KDE
D-Bus interface for window search, activation, and manipulation.")
    (home-page "https://github.com/jinliu/kdotool")
    (license license:asl2.0)))

;;;
;;; --- 6. elide-bin (copy-build-system, pre-built GraalVM binary) ---
;;;

(define-public elide-bin
  (package
    (name "elide-bin")
    (version "1.0.0-beta10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/elide-dev/elide/releases/download/v"
                    version "/elide-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elide" "bin/"))))
    (synopsis "fast batteries-included runtime for Kotlin, JS, TypeScript, Python")
    (description "Elide is a polyglot runtime combining support for Kotlin,
JavaScript, TypeScript, and Python in a single fast binary.  Built on
GraalVM, it enables cross-language interop and fast startup times.")
    (home-page "https://elide.dev")
    (license license:expat)))

;;;
;;; --- 7. catapult-bin (copy-build-system, pre-built binary) ---
;;;

(define-public catapult-bin
  (package
    (name "catapult-bin")
    (version "25.10a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qrrk/Catapult/releases/download/v"
                    version "/Catapult-v" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("catapult" "bin/"))))
    (inputs (list sdl2 sdl2-image sdl2-mixer sdl2-ttf))
    (synopsis "cross-platform launcher for Cataclysm: DDA and BN")
    (description "Catapult is a graphical launcher for the roguelike games
Cataclysm: Dark Days Ahead and Cataclysm: Bright Nights.  It manages game
installations, mods, tilesets, and soundpacks.")
    (home-page "https://github.com/qrrk/Catapult")
    (license license:expat)))

;;;
;;; --- 8. upscayl-bin (copy-build-system, AppImage) ---
;;;

(define-public upscayl-bin
  (package
    (name "upscayl-bin")
    (version "2.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/upscayl/upscayl/releases/download/v"
                    version "/upscayl-" version "-linux.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "upscayl-" #$version
                                        "-linux.AppImage")
                         "bin/upscayl"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/upscayl")
                          #o755))))))
    (synopsis "free and open source AI image upscaler")
    (description "Upscayl is a cross-platform AI image upscaler that uses
open-source AI models to enhance and upscale images.  It supports various
upscaling algorithms and runs locally using Vulkan GPU acceleration.")
    (home-page "https://upscayl.org")
    (license license:agpl3)))

;;;
;;; --- 9. koreader-bin (copy-build-system, pre-built binary) ---
;;;

(define-public koreader-bin
  (package
    (name "koreader-bin")
    (version "2026.03")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/koreader/koreader/releases/download/v"
                    version "/koreader-" version
                    "-amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib")
               ("usr/bin" "bin")
               ("usr/share" "share"))))
    (inputs (list sdl2))
    (synopsis "ebook reader for PDF, DjVu, EPUB, FB2 and more")
    (description "KOReader is a document viewer for E Ink devices and
desktops.  It supports PDF, DjVu, EPUB, FB2, CBZ, and many other formats
with customizable rendering, dictionary lookup, and cloud sync.")
    (home-page "https://koreader.rocks")
    (license license:agpl3)))

;;;
;;; --- 10. proton-mail-bin (copy-build-system, Electron .deb) ---
;;;

(define-public proton-mail-bin
  (package
    (name "proton-mail-bin")
    (version "1.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://proton.me/download/mail/linux/"
                    "ProtonMail-desktop-beta.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib" "lib")
               ("usr/bin" "bin")
               ("usr/share" "share"))))
    (synopsis "Proton Mail and Calendar desktop application")
    (description "The official desktop application for Proton Mail and Proton
Calendar.  Provides native desktop integration with system tray, notifications,
and offline access for the Proton encrypted email service.")
    (home-page "https://proton.me/mail")
    (license license:gpl3+)))

;;;
;;; --- 11. the-honkers-railway-launcher-bin (copy-build-system, pre-built) ---
;;;

(define-public the-honkers-railway-launcher-bin
  (package
    (name "the-honkers-railway-launcher-bin")
    (version "1.14.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/an-anime-team/"
                    "the-honkers-railway-launcher/releases/download/"
                    version "/the-honkers-railway-launcher"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("the-honkers-railway-launcher"
                "bin/the-honkers-railway-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append
                           (assoc-ref outputs "out")
                           "/bin/the-honkers-railway-launcher")
                          #o755))))))
    (synopsis "launcher for a specific anime game with auto-patching")
    (description "A launcher for a specific anime game that provides
auto-patching, Discord RPC integration, and time tracking.  Built with
GTK4 and libadwaita for a native Linux desktop experience.")
    (home-page
     "https://github.com/an-anime-team/the-honkers-railway-launcher")
    (license license:gpl3+)))

;;;
;;; --- 12. cc-switch-bin (copy-build-system, Tauri binary) ---
;;;

(define-public cc-switch-bin
  (package
    (name "cc-switch-bin")
    (version "3.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/farion1231/cc-switch/releases/"
                    "download/v" version
                    "/cc-switch_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin" "bin")
               ("usr/share" "share"))))
    (synopsis "all-in-one assistant tool for Claude Code, Codex and Gemini CLI")
    (description "CC Switch is a cross-platform desktop application for
managing multiple AI coding assistants including Claude Code, Codex, and
Gemini CLI.  Built with Tauri for a lightweight native experience.")
    (home-page "https://github.com/farion1231/cc-switch")
    (license license:expat)))

;;;
;;; --- 13. whph-bin (copy-build-system, Flutter binary) ---
;;;

(define-public whph-bin
  (package
    (name "whph-bin")
    (version "0.22.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ahmet-cetinkaya/whph/releases/"
                    "download/v" version "/whph-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("whph" "bin/"))))
    (synopsis "productivity app for tasks, habits, and time management")
    (description "WHPH is a comprehensive productivity application for
managing tasks, developing new habits, and optimizing time.  Built with
Flutter for a cross-platform native desktop experience.")
    (home-page "https://github.com/ahmet-cetinkaya/whph")
    (license license:gpl3)))

;;;
;;; --- 14. peazip-qt-bin (copy-build-system, pre-built binary) ---
;;;

(define-public peazip-qt-bin
  (package
    (name "peazip-qt-bin")
    (version "11.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peazip/PeaZip/releases/download/"
                    version "/peazip_" version
                    ".LINUX.Qt6-1.x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/peazip/"))))
    (synopsis "file manager and archiver with Qt6 interface")
    (description "PeaZip is a free file archiver and file manager.  It
supports over 200 archive formats including 7z, RAR, TAR, and ZIP, and
provides encryption, file splitting, and checksum verification features.")
    (home-page "https://peazip.github.io")
    (license license:lgpl3+)))

;;;
;;; --- 15. dorion-bin (copy-build-system, Tauri binary) ---
;;;

(define-public dorion-bin
  (package
    (name "dorion-bin")
    (version "6.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SpikeHD/Dorion/releases/download/v"
                    version "/Dorion_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin" "bin")
               ("usr/share" "share"))))
    (synopsis "tiny alternative Discord client with themes and plugins")
    (description "Dorion is a lightweight alternative Discord client built
with Tauri.  It offers a smaller resource footprint, faster startup, and
support for themes, plugins, and custom CSS.")
    (home-page "https://github.com/SpikeHD/Dorion")
    (license license:gpl3+)))

;;;
;;; --- 16. elysia-bin (copy-build-system, pre-built binary) ---
;;;

(define-public elysia-bin
  (package
    (name "elysia-bin")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dawn.wine/elysia/elysia/releases/download/v"
                    version "/elysia-" version
                    "-x86_64-linux.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("elysia" "bin/"))))
    (synopsis "universal anime game launcher supporting Wine and Proton")
    (description "Elysia is a universal launcher for anime games on Linux.
It supports Wine and Proton for running Windows games, with automatic
configuration and prefix management.")
    (home-page "https://dawn.wine/elysia/elysia")
    (license license:gpl3)))

;;;
;;; --- 17. python-fangfrisch (pyproject-build-system) ---
;;;

(define-public python-fangfrisch
  (package
    (name "python-fangfrisch")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/f/"
                    "fangfrisch/fangfrisch-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-requests python-sqlalchemy))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "freshclam-like utility for unofficial ClamAV signatures")
    (description "Fangfrisch is a tool for downloading unofficial virus
definition files for ClamAV.  It manages signature sources from providers
like SaneSecurity, URLHaus, and others, similar to freshclam.")
    (home-page "https://rseichter.github.io/fangfrisch/")
    (license license:gpl3+)))

;;;
;;; --- 18. python-barcode (pyproject-build-system) ---
;;;

(define-public python-barcode
  (package
    (name "python-barcode")
    (version "0.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "python-barcode/python_barcode-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools-scm python-setuptools python-wheel))
    (synopsis "create standard barcodes with Python")
    (description "Python-barcode provides barcode generation in Python with
no external dependencies.  It supports EAN-8, EAN-13, EAN-14, UPC-A, JAN,
ISBN-10, ISBN-13, ISSN, Code 39, Code 128, PZN, ITF, GS1-128, and more.")
    (home-page "https://github.com/WhyNotHugo/python-barcode")
    (license license:expat)))

;;;
;;; --- 19. python-poetry-plugin-shell (pyproject-build-system) ---
;;;

(define-public python-poetry-plugin-shell
  (package
    (name "python-poetry-plugin-shell")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/"
                    "poetry-plugin-shell/poetry_plugin_shell-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-poetry))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Poetry plugin that runs subshell with virtualenv activated")
    (description "A Poetry plugin that replaces the removed @code{poetry shell}
command.  It spawns a subshell with the project's virtual environment
activated, providing isolated dependency management.")
    (home-page "https://github.com/python-poetry/poetry-plugin-shell")
    (license license:expat)))

;;;
;;; --- 20. python-rich-inquirer (pyproject-build-system) ---
;;;

(define-public python-rich-inquirer
  (package
    (name "python-rich-inquirer")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/r/"
                    "rich-inquirer/rich_inquirer-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-rich))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "interactive CLI prompts using Rich and readchar")
    (description "Rich-inquirer provides interactive command-line prompts
using the Rich library for beautiful terminal output.  It supports selection
lists, checkboxes, and text input with customizable styling.")
    (home-page "https://github.com/chosey0/rich-inquirer")
    (license license:expat)))

;;;
;;; --- 21. python-bump-my-version (pyproject-build-system) ---
;;;

(define-public python-bump-my-version
  (package
    (name "python-bump-my-version")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/b/"
                    "bump-my-version/bump_my_version-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-click python-pydantic python-rich
                             python-tomlkit))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "command-line tool for updating version strings in projects")
    (description "Bump My Version is a small command-line tool to simplify
releasing software by updating all version strings in a project.  It supports
semantic versioning, Git integration, and configurable version patterns.")
    (home-page "https://github.com/callowayproject/bump-my-version")
    (license license:expat)))

;;;
;;; --- 22. python-opentelemetry-propagator-jaeger (pyproject-build-system) ---
;;;

(define-public python-opentelemetry-propagator-jaeger
  (package
    (name "python-opentelemetry-propagator-jaeger")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/o/"
                    "opentelemetry-propagator-jaeger/"
                    "opentelemetry_propagator_jaeger-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-opentelemetry-api))
    (native-inputs (list python-hatchling))
    (synopsis "OpenTelemetry Jaeger propagator")
    (description "This package provides the Jaeger trace context propagator
for OpenTelemetry Python.  It enables distributed tracing context propagation
using the Jaeger format across service boundaries.")
    (home-page
     "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;;
;;; --- 23. python-opentelemetry-propagator-b3 (pyproject-build-system) ---
;;;

(define-public python-opentelemetry-propagator-b3
  (package
    (name "python-opentelemetry-propagator-b3")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/o/"
                    "opentelemetry-propagator-b3/"
                    "opentelemetry_propagator_b3-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-deprecated python-opentelemetry-api))
    (native-inputs (list python-hatchling))
    (synopsis "OpenTelemetry B3 propagator")
    (description "This package provides the B3 trace context propagator for
OpenTelemetry Python.  It enables distributed tracing context propagation
using the Zipkin B3 format across service boundaries.")
    (home-page
     "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;;
;;; --- 24. python-opentelemetry-opentracing-shim (pyproject-build-system) ---
;;;

(define-public python-opentelemetry-opentracing-shim
  (package
    (name "python-opentelemetry-opentracing-shim")
    (version "1.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/o/"
                    "opentelemetry-opentracing-shim/"
                    "opentelemetry_opentracing_shim-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-deprecated python-opentelemetry-api))
    (native-inputs (list python-hatchling))
    (synopsis "OpenTracing shim for OpenTelemetry")
    (description "This package provides a compatibility shim that allows
OpenTracing instrumentation to work with OpenTelemetry.  It bridges the
OpenTracing API to the OpenTelemetry SDK for gradual migration.")
    (home-page
     "https://github.com/open-telemetry/opentelemetry-python")
    (license license:asl2.0)))

;;;
;;; --- 25. lug-helper (copy-build-system, Bash script) ---
;;;

(define-public lug-helper
  (package
    (name "lug-helper")
    (version "4.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/starcitizen-lug/lug-helper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lug-helper.sh" "bin/lug-helper"))))
    (inputs (list bash curl))
    (synopsis "Star Citizen Linux Users Group helper script")
    (description "LUG Helper is a Bash script that assists with managing
Star Citizen on Linux.  It handles Wine/DXVK runner installation, prefix
management, and other configuration tasks for the game.")
    (home-page "https://github.com/starcitizen-lug/lug-helper")
    (license license:gpl3+)))

;;;
;;; --- 26. novafetch (copy-build-system, pre-built Rust binary) ---
;;;

(define-public novafetch
  (package
    (name "novafetch")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ninso112/NovaFetch/releases/download/v"
                    version "/novafetch-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("novafetch" "bin/"))))
    (synopsis "blazing fast, customizable CLI system information tool")
    (description "NovaFetch is a system information tool written in Rust that
displays system details in the terminal.  It is designed for speed and
supports customizable output formatting.")
    (home-page "https://github.com/Ninso112/NovaFetch")
    (license license:gpl3+)))

;;;
;;; --- 27. zswap-cli (cmake-build-system, C++) ---
;;;

(define-public zswap-cli
  (package
    (name "zswap-cli")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xvitaly/zswap-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "command-line tool to control ZSwap Linux kernel module")
    (description "Zswap-cli is a command-line utility for managing the ZSwap
Linux kernel module.  It allows viewing and modifying ZSwap parameters such
as compression algorithm, memory pool, and enabled status.")
    (home-page "https://github.com/xvitaly/zswap-cli")
    (license license:expat)))

;;;
;;; --- 28. mihomo-alpha (go-build-system, Go proxy) ---
;;;

(define-public mihomo-alpha
  (let ((commit "c60750d")
        (revision "1"))
    (package
      (name "mihomo-alpha")
      (version (string-append "1.19.0-" revision "." commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/MetaCubeX/mihomo")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list #:import-path "github.com/metacubex/mihomo"
             #:tests? #f
             #:install-source? #f))
      (synopsis "universal proxy platform (formerly Clash.Meta)")
      (description "Mihomo (formerly Clash.Meta) is a rule-based tunnel in Go
that supports multiple proxy protocols including Shadowsocks, VMess, Trojan,
and WireGuard.  It provides advanced routing, DNS interception, and traffic
management capabilities.")
      (home-page "https://github.com/MetaCubeX/mihomo")
      (license license:expat))))

;;;
;;; --- 29. streamlink-twitch-gui-bin (copy-build-system, NW.js binary) ---
;;;

(define-public streamlink-twitch-gui-bin
  (package
    (name "streamlink-twitch-gui-bin")
    (version "2.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/streamlink/streamlink-twitch-gui/"
                    "releases/download/v" version
                    "/streamlink-twitch-gui-v" version
                    "-linux64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/streamlink-twitch-gui/"))))
    (synopsis "multi-platform Twitch.tv browser for Streamlink")
    (description "Streamlink Twitch GUI is a graphical interface for browsing
Twitch.tv streams and launching them in a media player via Streamlink.  It
provides channel management, notifications, and stream quality selection.")
    (home-page
     "https://github.com/streamlink/streamlink-twitch-gui")
    (license license:expat)))

;;;
;;; --- 30. jellyfin-server-bin (copy-build-system, pre-built binary) ---
;;;

(define-public jellyfin-server-bin
  (package
    (name "jellyfin-server-bin")
    (version "10.11.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo.jellyfin.org/files/server/linux/stable/v"
                    version "/amd64/jellyfin-server_" version
                    "-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jellyfin" "bin/")
               ("." "lib/jellyfin/"))))
    (synopsis "Jellyfin media server backend")
    (description "Jellyfin is the free software media system that puts you
in control of managing and streaming your media.  This package provides the
server backend that can serve media to Jellyfin clients.")
    (home-page "https://jellyfin.org")
    (license license:gpl2)))
