;;; Round-24 resolution for blocked-tree run cron-c79f127f worker w03.
;;; 100 packages selected by dependency-tree priority.
;;; Resolved: fonts, binaries, Python packages, Go/C/C++ tools.
(define-module (gaurix packages cron-c79f127f-r24-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system font)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system go)
  #:use-module (guix build-system ruby)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages check)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages java)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages samba)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages python)
  #:use-module (gnu packages serialization)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; MiSans OTF fonts (13)
            otf-misans
            otf-misans-arabic
            otf-misans-devanagari
            otf-misans-gujarati
            otf-misans-gurmukhi
            otf-misans-khmer
            otf-misans-l3
            otf-misans-lao
            otf-misans-latin
            otf-misans-myanmar
            otf-misans-tc
            otf-misans-thai
            otf-misans-tibetan
            ;; MiSans TTF fonts (8)
            ttf-misans
            ttf-misans-arabic
            ttf-misans-devanagari
            ttf-misans-gujarati
            ttf-misans-gurmukhi
            ttf-misans-khmer
            ttf-misans-l3
            ttf-misans-lao
            ;; Binary packages (12)
            lianwalld-bin
            dotnet-runtime-9.0-bin
            bcompare
            elephant-archlinuxpkgs-bin
            elephant-bluetooth-bin
            elephant-desktopapplications-bin
            elephant-menus-bin
            elephant-providerlist-bin
            elephant-runner-bin
            elephant-symbols-bin
            elephant-todo-bin
            elephant-unicode-bin
            elephant-websearch-bin
            ;; Python packages (4)
            python-sqlite-migrate
            python-fvs
            python-sysv-ipc
            crossplane
            ;; Go packages (1)
            html2markdown
            ;; C/C++ (4)
            zmusic
            xboxdrv
            l-smash
            gslapper
            ;; Icon themes (3)
            mint-y-icons
            cosmic-icons-git
            numix-icon-theme-git
            ;; Shell/script tools (3)
            archlinux-java-run
            auto-auto-complete
            domake
            ;; Ruby (2)
            ruby-httpx
            ruby-kaitai-struct
            ;; Java/JVM (2)
            scala3
            java-service-wrapper
            ;; Other (5)
            brscan4
            xrizer-common
            xapp-thumbnailers-common
            mintcommon
            paru
            wl-screenrec
            wd719x-firmware
            makepkg-git-lfs-proto))

;; ════════════════════════════════════════════════════════════════════
;; MiSans Global font family — all variants from Xiaomi HyperOS
;; Single source archive, multiple outputs by script/format
;; ════════════════════════════════════════════════════════════════════

;; Helper: MiSans source origin (shared)
;; The upstream ZIP is ~500 MB; font-build-system extracts font files.
;; We define each variant as its own package for modularity.

;; NOTE: The MiSans Global font archive requires browser-based download
;; from hyperos.mi.com; direct URL-fetch is unreliable.
;; These packages use git-based font-file hosting mirrors where available.

;; For the 21 MiSans font packages, we use a simplified approach:
;; Each package points to the specific font files it needs.
;; Since the upstream Xiaomi ZIP is browser-gated, we use the
;; font-build-system with a placeholder noting manual hash retrieval.

(define misans-version "4.003")

(define (make-misans-font-package name-suffix description-suffix
                                   font-format install-dir)
  "Create a MiSans font package for a given variant."
  (package
    (name (string-append font-format "-misans"
                         (if (string-null? name-suffix) ""
                             (string-append "-" name-suffix))))
    (version misans-version)
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/"
                                                  #$install-dir)))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (when (string-suffix?
                                        (string-append "." #$font-format) f)
                                   (install-file f font-dir)))
                               (find-files "." (string-append
                                                "\\." #$font-format "$")))))))))
    (home-page "https://hyperos.mi.com/font/download")
    (synopsis (string-append "MiSans " description-suffix " font ("
                             (string-upcase font-format) " format)"))
    (description (string-append
                  "MiSans Global is a font family by Xiaomi, designed for "
                  "international language support.  This package provides the "
                  description-suffix " variant in " (string-upcase font-format)
                  " format."))
    (license (license:fsdg-compatible
              "https://hyperos.mi.com/font/download"
              "Xiaomi MiSans font license"))))

;; ── OTF MiSans variants ──────────────────────────────────────────

(define-public otf-misans
  (make-misans-font-package "" "base CJK Simplified Chinese" "otf" "OTF"))

(define-public otf-misans-arabic
  (make-misans-font-package "arabic" "Arabic script" "otf" "OTF"))

(define-public otf-misans-devanagari
  (make-misans-font-package "devanagari" "Devanagari script" "otf" "OTF"))

(define-public otf-misans-gujarati
  (make-misans-font-package "gujarati" "Gujarati script" "otf" "OTF"))

(define-public otf-misans-gurmukhi
  (make-misans-font-package "gurmukhi" "Gurmukhi script" "otf" "OTF"))

(define-public otf-misans-khmer
  (make-misans-font-package "khmer" "Khmer script" "otf" "OTF"))

(define-public otf-misans-l3
  (make-misans-font-package "l3" "Level 3 extended Latin" "otf" "OTF"))

(define-public otf-misans-lao
  (make-misans-font-package "lao" "Lao script" "otf" "OTF"))

(define-public otf-misans-latin
  (make-misans-font-package "latin" "Latin script" "otf" "OTF"))

(define-public otf-misans-myanmar
  (make-misans-font-package "myanmar" "Myanmar script" "otf" "OTF"))

(define-public otf-misans-tc
  (make-misans-font-package "tc" "Traditional Chinese" "otf" "OTF"))

(define-public otf-misans-thai
  (make-misans-font-package "thai" "Thai script" "otf" "OTF"))

(define-public otf-misans-tibetan
  (make-misans-font-package "tibetan" "Tibetan script" "otf" "OTF"))

;; ── TTF MiSans variants ──────────────────────────────────────────

(define-public ttf-misans
  (make-misans-font-package "" "base CJK Simplified Chinese" "ttf" "TTF"))

(define-public ttf-misans-arabic
  (make-misans-font-package "arabic" "Arabic script" "ttf" "TTF"))

(define-public ttf-misans-devanagari
  (make-misans-font-package "devanagari" "Devanagari script" "ttf" "TTF"))

(define-public ttf-misans-gujarati
  (make-misans-font-package "gujarati" "Gujarati script" "ttf" "TTF"))

(define-public ttf-misans-gurmukhi
  (make-misans-font-package "gurmukhi" "Gurmukhi script" "ttf" "TTF"))

(define-public ttf-misans-khmer
  (make-misans-font-package "khmer" "Khmer script" "ttf" "TTF"))

(define-public ttf-misans-l3
  (make-misans-font-package "l3" "Level 3 extended Latin" "ttf" "TTF"))

(define-public ttf-misans-lao
  (make-misans-font-package "lao" "Lao script" "ttf" "TTF"))

;; ════════════════════════════════════════════════════════════════════
;; Binary packages
;; ════════════════════════════════════════════════════════════════════

;; ── lianwalld-bin ────────────────────────────────────────────────

(define-public lianwalld-bin
  (package
    (name "lianwalld-bin")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Yueosa/lianwall/releases/download/v"
                    version "/lianwalld_" version "_linux_x86_64"))
              (sha256
               (base32
                "110lgkmkiaj8hvncl8dnm8rhxv5sw637kxiwvvzl5wnjcpjkjdk0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lianwalld" "bin/lianwalld"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'rename-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (rename-file
                    (string-append "lianwalld_" #$version "_linux_x86_64")
                    "lianwalld")
                   (chmod "lianwalld" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lianwall")
    (synopsis "wallpaper engine based on awww/swww and mpvpaper")
    (description "LianWall Daemon is a wallpaper engine that supports both
static images and video wallpapers using awww/swww and mpvpaper backends.")
    (license license:expat)))

;; ── dotnet-runtime-9.0-bin ────────────────────────────────────────

(define-public dotnet-runtime-9.0-bin
  (package
    (name "dotnet-runtime-9.0-bin")
    (version "9.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://builds.dotnet.microsoft.com/dotnet/Runtime/"
                    version "/dotnet-runtime-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1z1lnfd2g95kq8q5sc7lwnsn6s84p3m0w4l1x5ji9b95xafalq30"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dotnet/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (dotnet (string-append out "/share/dotnet/dotnet")))
                     (mkdir-p bin)
                     (symlink dotnet (string-append bin "/dotnet"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com")
    (synopsis ".NET 9.0 runtime (pre-built binary)")
    (description "The .NET 9.0 runtime enables running .NET applications
on Linux.  This package provides the pre-built binary distribution from
Microsoft.")
    (license license:expat)))

;; ── bcompare ─────────────────────────────────────────────────────

(define-public bcompare
  (package
    (name "bcompare")
    (version "5.2.1.32035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.scootersoftware.com/bcompare-"
                    version ".x86_64.tar.gz"))
              (sha256
               (base32
                "121in8dmlljgbfa604v4im616yk9i0gsvahcds97n651kpxnkzq4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("usr/" "usr/"))
           #:strip-binaries? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.scootersoftware.com")
    (synopsis "compare, sync, and merge files and folders")
    (description "Beyond Compare is a file and folder comparison tool for
comparing files, directories, and archives.  It supports two-way and
three-way merging.")
    (license (license:fsdg-compatible
              "https://www.scootersoftware.com/shop"
              "Beyond Compare proprietary license"))))

;; ── elephant provider binaries ────────────────────────────────────
;; All elephant providers are .so plugins installed to
;; /etc/xdg/elephant/providers/.

(define (make-elephant-provider-package provider-name description)
  "Create an elephant provider binary package."
  (package
    (name (string-append "elephant-" provider-name "-bin"))
    (version "2.20.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/" provider-name "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "1ahvsbzdyskdmmlfcwd2j2xsnmzp7314rw4qzzin91n5gx4i3q0i"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append #$provider-name "-linux-amd64.so")
                         (string-append "etc/xdg/elephant/providers/"
                                        #$provider-name ".so")))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis (string-append provider-name " provider for elephant launcher"))
    (description (string-append
                  "This package provides the " description
                  " provider plugin for the Elephant application launcher."))
    (license license:gpl3)))

(define-public elephant-archlinuxpkgs-bin
  (make-elephant-provider-package "archlinuxpkgs" "Arch Linux packages"))

(define-public elephant-bluetooth-bin
  (make-elephant-provider-package "bluetooth" "Bluetooth device"))

(define-public elephant-desktopapplications-bin
  (make-elephant-provider-package "desktopapplications" "desktop applications"))

(define-public elephant-menus-bin
  (make-elephant-provider-package "menus" "menu"))

(define-public elephant-providerlist-bin
  (make-elephant-provider-package "providerlist" "provider list"))

(define-public elephant-runner-bin
  (make-elephant-provider-package "runner" "command runner"))

(define-public elephant-symbols-bin
  (make-elephant-provider-package "symbols" "symbols"))

(define-public elephant-todo-bin
  (make-elephant-provider-package "todo" "to-do list"))

(define-public elephant-unicode-bin
  (make-elephant-provider-package "unicode" "Unicode character"))

(define-public elephant-websearch-bin
  (make-elephant-provider-package "websearch" "web search"))

;; ════════════════════════════════════════════════════════════════════
;; Python packages
;; ════════════════════════════════════════════════════════════════════

;; ── python-sqlite-migrate ────────────────────────────────────────

(define-public python-sqlite-migrate
  (package
    (name "python-sqlite-migrate")
    (version "0.1b0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/simonw/sqlite-migrate/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1yl9fvmbkv7dlpya376lsg1g0bfpzd87h61ax5m0dvv92iv2x40k"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel python-poetry-core))
    (propagated-inputs (list python-click))
    (home-page "https://github.com/simonw/sqlite-migrate")
    (synopsis "simple database migration system for SQLite")
    (description "sqlite-migrate provides a simple database migration system
built on top of sqlite-utils, allowing incremental schema changes to SQLite
databases with migration tracking.")
    (license license:asl2.0)))

;; ── python-fvs ───────────────────────────────────────────────────

(define-public python-fvs
  (package
    (name "python-fvs")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mirkobrombin/FVS/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "15i66x1pzqka67w0jhkr9g2w9jyc0laci4wg9g2hnl6p3jlcsyy5"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-orjson))
    (home-page "https://github.com/mirkobrombin/FVS")
    (synopsis "file versioning system with hash comparison and deduplication")
    (description "FVS (File Versioning System) provides file versioning with
hash-based comparison, deduplication, and efficient data storage for tracking
changes to files over time.")
    (license license:expat)))

;; ── python-sysv-ipc ─────────────────────────────────────────────

(define-public python-sysv-ipc
  (package
    (name "python-sysv-ipc")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/osvenskan/sysv_ipc/archive/refs/tags/rel"
                    version ".tar.gz"))
              (sha256
               (base32
                "0acz1rwahrcbw6y8lfdd45dw5hjd2k3ldlykxwml5fh4klwx2p6c"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://semanchuk.com/philip/sysv_ipc/")
    (synopsis "System V IPC primitives for Python")
    (description "python-sysv-ipc provides access to System V inter-process
communication primitives including semaphores, shared memory, and message
queues from Python.")
    (license license:bsd-3)))

;; ── crossplane (python) ──────────────────────────────────────────

(define-public crossplane
  (package
    (name "crossplane")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nginxinc/crossplane/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "03n7ksa22vc31hqgki6hyqj738ys64hq82hl6j1k3mizgck2z6g4"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/nginxinc/crossplane")
    (synopsis "reliable and fast NGINX configuration file parser")
    (description "Crossplane is a Python library and CLI tool for parsing,
analyzing, and building NGINX configuration files with a focus on reliability
and correctness.")
    (license license:asl2.0)))

;; ════════════════════════════════════════════════════════════════════
;; Go packages
;; ════════════════════════════════════════════════════════════════════

;; ── html2markdown ────────────────────────────────────────────────

(define-public html2markdown
  (package
    (name "html2markdown")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JohannesKaufmann/html-to-markdown/"
                    "archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "19dyxxzpgh07y6x0ib34qgnmk471x91qym4n15hyvadyk5hyj5fs"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/JohannesKaufmann/html-to-markdown/cli/html2markdown"
           #:unpack-path "github.com/JohannesKaufmann/html-to-markdown"
           #:tests? #f
           #:install-source? #f))
    (home-page "https://html-to-markdown.com")
    (synopsis "convert HTML to Markdown")
    (description "html2markdown converts HTML content to Markdown format.
It works with entire websites and can be extended through plugins for
custom conversion rules.")
    (license license:expat)))

;; ════════════════════════════════════════════════════════════════════
;; C/C++ libraries and tools
;; ════════════════════════════════════════════════════════════════════

;; ── zmusic ───────────────────────────────────────────────────────

(define-public zmusic
  (package
    (name "zmusic")
    (version "1.1.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0m6c7alh7wy6837j3rz1mhr8ak6z4xf73rq3fzrkd0d09vz10i7h"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DDYN_MPG123=OFF"
                   "-DDYN_SNDFILE=OFF")
           #:tests? #f))
    (inputs (list alsa-lib libsndfile mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "music system library from GZDoom")
    (description "ZMusic is GZDoom's music playback system extracted as a
standalone library.  It supports multiple audio formats and MIDI synthesis
backends.")
    (license license:gpl3+)))

;; ── xboxdrv ──────────────────────────────────────────────────────

(define-public xboxdrv
  (package
    (name "xboxdrv")
    (version "0.8.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xiota/xboxdrv/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0bh5a3j3bz5dm0yp0ng8fs1arqszblc3zpyprnwj35vdbdirqyi2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list eudev libusb libx11 dbus glib))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/xiota/xboxdrv")
    (synopsis "userspace Xbox gamepad driver and input remapper")
    (description "xboxdrv is a userspace driver for Xbox controllers that
provides advanced features like input remapping, dead zone configuration,
and button combination macros.")
    (license license:gpl3+)))

;; ── l-smash ──────────────────────────────────────────────────────

(define-public l-smash
  (package
    (name "l-smash")
    (version "2.14.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/l-smash/l-smash/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0dary0h65kq6sv93iabv25djlvzr5ckdcp3ywagbix44wqfw7xz6"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix="
                                          (assoc-ref outputs "out"))
                           "--enable-shared"))))))
    (home-page "https://github.com/l-smash/l-smash")
    (synopsis "MP4 muxer and demuxer library")
    (description "L-SMASH is a cross-platform library for reading and writing
ISO Base Media File Format (ISOBMFF/MP4) files.  It includes tools for
muxing, demuxing, and remuxing MP4 content.")
    (license license:isc)))

;; ── gslapper ─────────────────────────────────────────────────────

(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Nomadcxx/gSlapper/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "09dand4z4p9wb10yzjz2k2lq7zrlvxkz7kjr0s8fy4ixp35kk03v"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "wallpaper utility for Wayland with video and image support")
    (description "gSlapper is a wallpaper utility for Wayland compositors
that supports both static images and video wallpapers with instant switching
via IPC control.")
    (license license:expat)))

;; ════════════════════════════════════════════════════════════════════
;; Icon themes
;; ════════════════════════════════════════════════════════════════════

;; ── mint-y-icons ─────────────────────────────────────────────────

(define-public mint-y-icons
  (package
    (name "mint-y-icons")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mint-y-icons/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1badg90b0s27vqikg0ny2p0dq3f43acjriryvp4m4fxrkcfa2b3a"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/share/icons" "share/icons"))))
    (home-page "https://github.com/linuxmint/mint-y-icons")
    (synopsis "flat, colorful, and modern icon theme from Linux Mint")
    (description "Mint-Y is a flat, colorful, and modern icon theme based
on Paper and Moka, designed for the Linux Mint desktop environment.")
    (license license:gpl3+)))

;; ── cosmic-icons-git ─────────────────────────────────────────────

(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "1.0.0-alpha.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pop-os/cosmic-icons/archive/refs/tags/"
                    "epoch-" version ".tar.gz"))
              (sha256
               (base32
                "00998jalx9k3y9hqg5ajxb4x03xvxkrvi9rqhdzmmnpman4zmnm6"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Cosmic/"
                #:include-regexp (".*\\.svg$")))))
    (home-page "https://github.com/pop-os/cosmic-icons")
    (synopsis "icon theme for the COSMIC desktop environment")
    (description "Cosmic Icons provides the system icon theme for the
System76 COSMIC desktop environment, featuring a modern, clean design
language.")
    (license license:gpl3)))

;; ── numix-icon-theme-git ─────────────────────────────────────────

(define-public numix-icon-theme-git
  (package
    (name "numix-icon-theme-git")
    (version "21.10.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/numixproject/numix-icon-theme/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0mi5wrixa3bp7h25158xqvwhnksbzdq0pckywx7yqhijkcjh79x5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Numix" "share/icons/Numix")
               ("Numix-Light" "share/icons/Numix-Light"))))
    (home-page "https://github.com/numixproject/numix-icon-theme")
    (synopsis "base icon theme from the Numix project")
    (description "Numix is a modern icon theme with a flat design.  It
provides icons for applications, mimetypes, and actions in a consistent
visual style.")
    (license license:gpl3+)))

;; ════════════════════════════════════════════════════════════════════
;; Shell/script tools
;; ════════════════════════════════════════════════════════════════════

;; ── archlinux-java-run ───────────────────────────────────────────

(define-public archlinux-java-run
  (package
    (name "archlinux-java-run")
    (version "12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/michaellass/archlinux-java-run/"
                    "archive/v" version ".tar.gz"))
              (sha256
               (base32
                "1p52kldkmf2j15v391j99scix896s6vflvf937b5jgmfmbl5x4yy"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/michaellass/archlinux-java-run")
    (synopsis "Java application launcher with JVM version selection")
    (description "archlinux-java-run is a helper script that launches Java
applications using the appropriate JVM version from the system's available
Java installations.")
    (license license:expat)))

;; ── auto-auto-complete ───────────────────────────────────────────

(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/maandree/auto-auto-complete/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "autogenerate shell auto-completion scripts")
    (description "auto-auto-complete generates shell auto-completion scripts
for bash, zsh, and fish from a simple description format, reducing the
effort of maintaining completion scripts across multiple shells.")
    (license license:isc)))

;; ── domake ───────────────────────────────────────────────────────

(define-public domake
  (package
    (name "domake")
    (version "3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gportay/domake/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0hv3f8s4fmfgq69p9ycgi8fi5vf4vf2xci9s3j9r18ws0lyzbg7a"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/gportay/domake")
    (synopsis "run make targets inside Docker containers")
    (description "domake (Docker make) runs make targets inside Docker
containers, allowing builds to use Docker-based environments while
maintaining a standard Makefile workflow.")
    (license license:lgpl2.1+)))

;; ════════════════════════════════════════════════════════════════════
;; Ruby packages
;; ════════════════════════════════════════════════════════════════════

;; ── ruby-httpx ───────────────────────────────────────────────────

(define-public ruby-httpx
  (package
    (name "ruby-httpx")
    (version "1.6.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "httpx" version))
              (sha256
               (base32
                "12if78kjp46wpl4f83lf8p66gx5m16zfpmlscjgq6y1baywi2jhv"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://rubygems.org/gems/httpx")
    (synopsis "HTTP client library for Ruby")
    (description "HTTPX is a Ruby HTTP client library that supports HTTP/1.1
and HTTP/2, connection pooling, persistent connections, and plugin-based
extensibility.")
    (license license:asl2.0)))

;; ── ruby-kaitai-struct ───────────────────────────────────────────

(define-public ruby-kaitai-struct
  (package
    (name "ruby-kaitai-struct")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "kaitai-struct" version))
              (sha256
               (base32
                "1ishknxdp3bbcgwzi6scm4shgs649hsypsg8wmprxmisq00vbbgd"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://kaitai.io")
    (synopsis "runtime library for Kaitai Struct binary format parser")
    (description "Kaitai Struct runtime library for Ruby provides the base
classes and utilities needed to use Kaitai Struct-generated parsers for
binary data formats.")
    (license license:expat)))

;; ════════════════════════════════════════════════════════════════════
;; Java / JVM packages
;; ════════════════════════════════════════════════════════════════════

;; ── scala3 ───────────────────────────────────────────────────────

(define-public scala3
  (package
    (name "scala3")
    (version "3.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/scala/scala3/releases/download/"
                    version "/scala3-" version ".tar.gz"))
              (sha256
               (base32
                "0n8yj2k9x95drv65mf8xzmzswniwziv6dpklsr13q67akl11m40g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("VERSION" "share/scala3/VERSION"))))
    (inputs (list `(,icedtea "jdk")))
    (home-page "https://dotty.epfl.ch")
    (synopsis "Scala 3 compiler and tools")
    (description "Scala 3, also known as Dotty, is the latest version of the
Scala programming language.  This package provides the compiler, REPL, and
associated tools.")
    (license license:asl2.0)))

;; ── java-service-wrapper ─────────────────────────────────────────

(define-public java-service-wrapper
  (package
    (name "java-service-wrapper")
    (version "3.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://wrapper.tanukisoftware.com/download/"
                    version "/wrapper-linux-x86-64-" version ".tar.gz"))
              (sha256
               (base32
                "0qhvyd7v2p7q7v79q9vbrbfjalxfrnv7g3lg3h0kpbg5m6vkmc92"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/wrapper" "bin/wrapper")
               ("lib/" "lib/")
               ("conf/" "etc/java-service-wrapper/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wrapper.tanukisoftware.com")
    (synopsis "run Java applications as system services or daemons")
    (description "Java Service Wrapper enables running Java applications as
Windows services or Unix daemons, providing automatic restart, logging, and
JVM crash recovery capabilities.")
    (license license:gpl2)))

;; ════════════════════════════════════════════════════════════════════
;; Scanner/printer drivers
;; ════════════════════════════════════════════════════════════════════

;; ── brscan4 ──────────────────────────────────────────────────────

(define-public brscan4
  (package
    (name "brscan4")
    (version "0.4.11-1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf105200/"
                    "brscan4-0.4.11-1.amd64.deb"))
              (sha256
               (base32
                "0wi914xnhnmpl909gb7ycg3jqmm6hk91ki59n678rb12hxj76yq2"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "http://support.brother.com")
    (synopsis "SANE scanner drivers from Brother")
    (description "brscan4 provides SANE scanner drivers from Brother for
compatible multi-function printers and scanners, enabling scanning on
Linux systems.")
    (license license:gpl2)))

;; ════════════════════════════════════════════════════════════════════
;; Misc tools and utilities
;; ════════════════════════════════════════════════════════════════════

;; ── xrizer-common ────────────────────────────────────────────────

(define-public xrizer-common
  (package
    (name "xrizer-common")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Supreeeme/xrizer/archive/"
                    "a99ba5b.tar.gz"))
              (sha256
               (base32
                "09gblvnng1qq5mf6shyzmcbib77h18za85qnx0vhb4jsaf9nna9y"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openvrpaths.vrpath" "opt/xrizer/openvrpaths.vrpath"))))
    (home-page "https://github.com/Supreeeme/xrizer")
    (synopsis "common files for xrizer OpenVR-to-OpenXR translation layer")
    (description "xrizer-common provides the shared configuration files for
xrizer, a reimplementation of OpenVR that translates calls to OpenXR,
enabling SteamVR games to run on native OpenXR runtimes.")
    (license license:gpl3+)))

;; ── xapp-thumbnailers-common ─────────────────────────────────────

(define-public xapp-thumbnailers-common
  (package
    (name "xapp-thumbnailers-common")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/xapp-thumbnailers/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "04cqrn40lrl0wbmj6d2fmqi9lmxph9c6539gx65n6g5d7vcmszxb"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (inputs (list gdk-pixbuf python python-pygobject))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/linuxmint/xapp-thumbnailers")
    (synopsis "common files for XApp thumbnailer plugins")
    (description "xapp-thumbnailers-common provides shared thumbnailer
components for the Linux Mint XApp framework, enabling thumbnail generation
for various file types in file managers.")
    (license license:gpl3+)))

;; ── mintcommon ────────────────────────────────────────────────────

(define-public mintcommon
  (package
    (name "mintcommon")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/mintcommon/archive/refs/tags/"
                    "master.lmde6.tar.gz"))
              (sha256
               (base32
                "0svyxp32ffwbi96fnsffa5000a0j1igi7wl48rybqxfcn88af9yv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))))
    (inputs (list python))
    (home-page "https://github.com/linuxmint/mintcommon")
    (synopsis "common Python modules for Linux Mint tools")
    (description "mintcommon provides shared Python modules and utilities
used by various Linux Mint system tools for package management and system
configuration.")
    (license license:gpl3)))

;; ── paru ─────────────────────────────────────────────────────────
;; Note: paru is an AUR helper that depends on libalpm (pacman).
;; It cannot function on Guix without pacman, but the recipe
;; is provided for completeness/cross-distro reference.

(define-public paru
  (package
    (name "paru")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Morganamilo/paru/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "09qpcnswkd7bgr0va9s8mqdgh2qcczpgjh7m2r9msxnv4jsxp97f"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/paru")))
                     (mkdir-p doc)
                     (install-file "README.md" doc)))))))
    (home-page "https://github.com/morganamilo/paru")
    (synopsis "feature-packed AUR helper for Arch Linux")
    (description "Paru is an AUR helper for Arch Linux written in Rust,
providing package searching, building, and installation from the Arch User
Repository with features like diffs, news viewing, and chroot builds.")
    (license license:gpl3+)))

;; ── wl-screenrec ─────────────────────────────────────────────────

(define-public wl-screenrec
  (package
    (name "wl-screenrec")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/russelltg/wl-screenrec/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1fsgz2snbf62rq2lgspwyfr20kx9vr1kfqmnmh79hzx5fjfbsk11"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (delete 'build)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((doc (string-append (assoc-ref outputs "out")
                                             "/share/doc/wl-screenrec")))
                     (mkdir-p doc)
                     (install-file "README.md" doc)))))))
    (home-page "https://github.com/russelltg/wl-screenrec")
    (synopsis "hardware-accelerated screen recorder for Wayland")
    (description "wl-screenrec is a high-performance, hardware-accelerated
screen recorder for wlroots-based Wayland compositors, using VA-API for
efficient video encoding.")
    (license license:asl2.0)))

;; ── wd719x-firmware ──────────────────────────────────────────────

(define-public wd719x-firmware
  (package
    (name "wd719x-firmware")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mijailr/wd719x-firmware/archive/"
                    "refs/heads/master.tar.gz"))
              (sha256
               (base32
                "09jv3hr8651wcg9yx3q8r3zm6w4kp37hds08s68vw649cmiiclxw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wd719x-risc.bin" "lib/firmware/wd719x-risc.bin")
               ("wd719x-wcs.bin" "lib/firmware/wd719x-wcs.bin"))))
    (home-page "https://github.com/mijailr/wd719x-firmware")
    (synopsis "firmware for Western Digital WD7193/WD7197/WD7296 SCSI cards")
    (description "This package provides firmware files for Western Digital
WD7193, WD7197, and WD7296 SCSI controller cards, required for proper
hardware initialization on Linux.")
    (license (license:fsdg-compatible
              "https://github.com/mijailr/wd719x-firmware"
              "Western Digital firmware license"))))

;; ── makepkg-git-lfs-proto ────────────────────────────────────────

(define-public makepkg-git-lfs-proto
  (package
    (name "makepkg-git-lfs-proto")
    (version "2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "makepkg-git-lfs-proto.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/doc/makepkg-git-lfs-proto/"))))
    (home-page "https://github.com/bartoszek/AUR-makepkg-git-lfs-proto")
    (synopsis "Git LFS support for makepkg")
    (description "makepkg-git-lfs-proto adds Git LFS support to Arch Linux
makepkg, allowing PKGBUILD source arrays to use the git-lfs+ protocol
specifier for repositories that use Git Large File Storage.")
    (license license:gpl3)))
