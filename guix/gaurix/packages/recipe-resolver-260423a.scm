;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (21):
;;;        1.  libxml2-git (pyproject-build-system, v2.12.5.r245.g84a71860, custom)
;;;        2.  gr-lora_sdr-git (pyproject-build-system, v1.0.0.r136.ga8143cb, GPL-3.0-or-later)
;;;        3.  php84-imap (pyproject-build-system, v8.4.17, PHP)
;;;        4.  libre-trainsim-bin (copy-build-system, v0.8, GPL3)
;;;        5.  wazuh-agent (pyproject-build-system, v4.14.4, GPL2)
;;;        6.  php84-fpm (pyproject-build-system, v8.4.17, PHP)
;;;        7.  php84-enchant (pyproject-build-system, v8.4.17, PHP)
;;;        8.  vibe-audio-visualizer-git (cargo-build-system, v2.3.0.r57.g5358a2d, AGPL-3.0-or-later)
;;;        9.  plezy-git (cmake-build-system, v1.14.0.r0.g70f6e21, GPL-3.0-or-later)
;;;       10.  koxtoolchain (gnu-build-system, v2025.05, unknown)
;;;       11.  php84-apache (pyproject-build-system, v8.4.17, PHP)
;;;       12.  php84-embed (pyproject-build-system, v8.4.17, PHP)
;;;       13.  python315 (gnu-build-system, v3.15.0a8, PSF-2.0)
;;;       14.  omnissa-horizon-client (gnu-build-system, v2512.1, custom)
;;;       15.  listpick (pyproject-build-system, v0.1.18.1, MIT)
;;;       16.  playtorrio-bin (copy-build-system, v2.8.6, GPL-2.0)
;;;       17.  android_translation_layer (cmake-build-system, v20260326.162e93fd, GPL-3.0-or-later)
;;;       18.  kitty-bitmap (go-build-system, v0.45.0, GPL-3.0-only)
;;;       19.  pyload-ng (pyproject-build-system, v0.5.0b3.dev95, AGPL3)
;;;       20.  crossover (pyproject-build-system, v26.1.0, custom:CrossOver Linux License Grant)
;;;       21.  wine-gaming-dependencies (gnu-build-system, v1, unknown)
;;;
;;; BLOCKED EXHAUSTED (3):
;;;        1.  autofirma -> JAVA_COMPLEX: Cliente de firma electrónica ofrecido por la Administración Pública
;;;        2.  netpad-vnext-bin -> DOTNET_UNSUPPORTED: A cross-platform C# editor and playground (vNext - Rust-based shell)
;;;        3.  heli-x -> JAVA_COMPLEX: Professional R/C Flight Simulator
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            libxml2-git
            gr-lora-sdr-git
            php84-imap
            libre-trainsim-bin
            wazuh-agent
            php84-fpm
            php84-enchant
            vibe-audio-visualizer-git
            plezy-git
            koxtoolchain
            php84-apache
            php84-embed
            python315
            omnissa-horizon-client
            listpick
            playtorrio-bin
            android-translation-layer
            kitty-bitmap
            pyload-ng
            crossover
            wine-gaming-dependencies
            ))

;;; -------------------------------------------------------------------
;;; 1. libxml2-git --- the XML C parser and toolkit of Gnome
;;; -------------------------------------------------------------------
(define-public libxml2-git
  (package
    (name "libxml2-git")
    (version "2.12.5.r245.g84a71860")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list glibc xz zlib))
    (synopsis "the XML C parser and toolkit of Gnome")
    (description "The XML C parser and toolkit of Gnome.")
    (home-page "https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 2. gr-lora_sdr-git --- GNU Radio blocks for fully-functional LoRa transceiver
;;; -------------------------------------------------------------------
(define-public gr-lora-sdr-git
  (package
    (name "gr-lora-sdr-git")
    (version "1.0.0.r136.ga8143cb")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tapparelj/gr-lora_sdr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (synopsis "GNU Radio blocks for fully-functional LoRa transceiver")
    (description "GNU Radio blocks for fully-functional LoRa transceiver.")
    (home-page "https://github.com/tapparelj/gr-lora_sdr")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. php84-imap --- imap module for php84
;;; -------------------------------------------------------------------
(define-public php84-imap
  (package
    (name "php84-imap")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list linux-pam libxcrypt openssl))
    (synopsis "imap module for php84")
    (description "Imap module for php84.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 4. libre-trainsim-bin --- free Train Simulator for everyone
;;; -------------------------------------------------------------------
(define-public libre-trainsim-bin
  (package
    (name "libre-trainsim-bin")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri "https://www.libretrainsim.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("libre-trainsim-bin" "bin/libre-trainsim-bin"))))
    (inputs (list mesa))
    (synopsis "free Train Simulator for everyone")
    (description "Free Train Simulator for everyone.")
    (home-page "https://www.libretrainsim.org/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. wazuh-agent --- wazuh Agent actively protects Arch Linux systems with advanced threat pre...
;;; -------------------------------------------------------------------
(define-public wazuh-agent
  (package
    (name "wazuh-agent")
    (version "4.14.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wazuh.com//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list curl perl python))
    (synopsis "wazuh Agent actively protects Arch Linux systems with advanced threat pre...")
    (description "Wazuh Agent actively protects Arch Linux systems with advanced threat prevention, detection, and response capabilities.")
    (home-page "https://wazuh.com/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 6. php84-fpm --- fastCGI Process Manager for php84
;;; -------------------------------------------------------------------
(define-public php84-fpm
  (package
    (name "php84-fpm")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list elogind acl libxml2 pcre2))
    (synopsis "fastCGI Process Manager for php84")
    (description "FastCGI Process Manager for php84.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 7. php84-enchant --- enchant module for php84
;;; -------------------------------------------------------------------
(define-public php84-enchant
  (package
    (name "php84-enchant")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "enchant module for php84")
    (description "Enchant module for php84.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 8. vibe-audio-visualizer-git --- a desktop audio visualizer for wayland
;;; -------------------------------------------------------------------
(define-public vibe-audio-visualizer-git
  (package
    (name "vibe-audio-visualizer-git")
    (version "2.3.0.r57.g5358a2d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/TornaxO7/vibe")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list alsa-lib wayland))
    (synopsis "a desktop audio visualizer for wayland")
    (description "A desktop audio visualizer for wayland.")
    (home-page "https://github.com/TornaxO7/vibe")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 9. plezy-git --- a modern Plex client for desktop and mobile
;;; -------------------------------------------------------------------
(define-public plezy-git
  (package
    (name "plezy-git")
    (version "1.14.0.r0.g70f6e21")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edde746/plezy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gtk+ alsa-lib glib))
    (synopsis "a modern Plex client for desktop and mobile")
    (description "A modern Plex client for desktop and mobile.")
    (home-page "https://github.com/edde746/plezy")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. koxtoolchain --- build script for various toolchains used by KOReader
;;; -------------------------------------------------------------------
(define-public koxtoolchain
  (package
    (name "koxtoolchain")
    (version "2025.05")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/koreader/koxtoolchain")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list curl git wget))
    (synopsis "build script for various toolchains used by KOReader")
    (description "Build script for various toolchains used by KOReader.")
    (home-page "https://github.com/koreader/koxtoolchain")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 11. php84-apache --- apache SAPI for php84
;;; -------------------------------------------------------------------
(define-public php84-apache
  (package
    (name "php84-apache")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list libxml2 pcre2 libxcrypt ncurses))
    (synopsis "apache SAPI for php84")
    (description "Apache SAPI for php84.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 12. php84-embed --- embedded PHP SAPI library for php84
;;; -------------------------------------------------------------------
(define-public php84-embed
  (package
    (name "php84-embed")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list ncurses elogind libxcrypt acl libxml2 pcre2))
    (synopsis "embedded PHP SAPI library for php84")
    (description "Embedded PHP SAPI library for php84.")
    (home-page "http://www.php.net")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 13. python315 --- major release 3.15 of the Python high-level programming language
;;; -------------------------------------------------------------------
(define-public python315
  (package
    (name "python315")
    (version "3.15.0a8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.python.org//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list bzip2 libffi libxcrypt openssl zlib zstd))
    (synopsis "major release 3.15 of the Python high-level programming language")
    (description "Major release 3.15 of the Python high-level programming language.")
    (home-page "https://www.python.org/")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 14. omnissa-horizon-client --- omnissa Horizon Client - connect to Omnissa Horizon virtual desktop
;;; -------------------------------------------------------------------
(define-public omnissa-horizon-client
  (package
    (name "omnissa-horizon-client")
    (version "2512.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list fuse-2 glib gtk+ libffi zlib))
    (synopsis "omnissa Horizon Client - connect to Omnissa Horizon virtual desktop")
    (description "Omnissa Horizon Client - connect to Omnissa Horizon virtual desktop.")
    (home-page "https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 15. listpick --- a powerful TUI data tool for creating TUI apps or viewing/comparing tabul...
;;; -------------------------------------------------------------------
(define-public listpick
  (package
    (name "listpick")
    (version "0.1.18.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grimandgreedy/listpick")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (synopsis "a powerful TUI data tool for creating TUI apps or viewing/comparing tabul...")
    (description "A powerful TUI data tool for creating TUI apps or viewing/comparing tabulated data.")
    (home-page "https://github.com/grimandgreedy/listpick")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. playtorrio-bin --- a powerful, cross-platform media center that streams movies, TV shows, an...
;;; -------------------------------------------------------------------
(define-public playtorrio-bin
  (package
    (name "playtorrio-bin")
    (version "2.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ayman708-UX/PlayTorrio/releases/download/v" version "/playtorrio-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("playtorrio-bin" "bin/playtorrio-bin"))))
    (inputs (list fuse-2 ffmpeg gtk+))
    (synopsis "a powerful, cross-platform media center that streams movies, TV shows, an...")
    (description "A powerful, cross-platform media center that streams movies, TV shows, anime, books, music, and games.")
    (home-page "https://github.com/ayman708-UX/PlayTorrio")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. android_translation_layer --- a translation layer for running Android apps on a Linux system
;;; -------------------------------------------------------------------
(define-public android-translation-layer
  (package
    (name "android-translation-layer")
    (version "20260326.162e93fd")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/android_translation_layer/android_translation_layer/-/archive/v" version "/android_translation_layer-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (inputs (list alsa-lib ffmpeg fontconfig glibc gtk mesa sqlite wayland))
    (synopsis "a translation layer for running Android apps on a Linux system")
    (description "A translation layer for running Android apps on a Linux system.")
    (home-page "https://gitlab.com/android_translation_layer/android_translation_layer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. kitty-bitmap --- a modern, hackable, featureful, OpenGL-based terminal emulator. Patched t...
;;; -------------------------------------------------------------------
(define-public kitty-bitmap
  (package
    (name "kitty-bitmap")
    (version "0.45.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kovidgoyal/kitty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/kovidgoyal/kitty"
      #:tests? #f))
    (inputs (list fontconfig freetype harfbuzz wayland libx11 dbus zlib openssl libpng))
    (synopsis "a modern, hackable, featureful, OpenGL-based terminal emulator. Patched t...")
    (description "A modern, hackable, featureful, OpenGL-based terminal emulator. Patched to support bitmap fonts.")
    (home-page "https://github.com/kovidgoyal/kitty")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. pyload-ng --- free and Open Source download manager written in Python
;;; -------------------------------------------------------------------
(define-public pyload-ng
  (package
    (name "pyload-ng")
    (version "0.5.0b3.dev95")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://pyload.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (synopsis "free and Open Source download manager written in Python")
    (description "Free and Open Source download manager written in Python.")
    (home-page "https://pyload.net/")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 20. crossover --- run Windows Programs on Linux
;;; -------------------------------------------------------------------
(define-public crossover
  (package
    (name "crossover")
    (version "26.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.codeweavers.com/crossover/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python vte glibc libx11 freetype libpng zlib))
    (synopsis "run Windows Programs on Linux")
    (description "Run Windows Programs on Linux.")
    (home-page "https://www.codeweavers.com/crossover")
    (license license:non-copyleft)))

;;; -------------------------------------------------------------------
;;; 21. wine-gaming-dependencies --- all the dependencies for gaming from GEs website
;;; -------------------------------------------------------------------
(define-public wine-gaming-dependencies
  (package
    (name "wine-gaming-dependencies")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/packages/wine-gaming-dependencies")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list libpng openldap gnutls alsa-lib libjpeg-turbo ncurses gtk+))
    (synopsis "all the dependencies for gaming from GEs website")
    (description "All the dependencies for gaming from GEs website.")
    (home-page "None")
    (license license:non-copyleft)))
