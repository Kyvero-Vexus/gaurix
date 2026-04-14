;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414g
;;; Resolves 100 packages from general queue:
;;;   - 82 recipes created
;;;   - 6 blocked (DEP_RESOLUTION_FAILED: DKMS kernel modules)
;;;   - 12 blocked (NEEDS_RECIPE_DESIGN: complex build systems)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:export (            omm-bin
            tinct-bin
            binco-bin
            histui-bin
            rosec-bin
            tdocker
            migrate-bin
            sshconfig-lint-bin
            tuco-bin
            tiki-bin
            uber-apk-signer-bin
            tuwunel-bin
            python-logfire-api
            python-uncalled-for
            qtqr
            gonob
            goanime
            stringp
            nchat
            ani2xcursor
            headson
            btdu
            poutine
            pkglog
            inori
            hypr-zoom
            firemark
            chezetc-git
            nodejs-markdown-toc
            fish-hydro-git
            xpytile-git
            epub2pdf
            paruse
            i3bar-river
            mma
            powerpanel
            pixelorama
            typora
            coccoc-browser-stable
            odin4-cli
            synology-assistant
            forkgram
            bolt-launcher
            upscaler
            universal-android-debloater
            chkufsd-bin
            arduino-ide
            deezer-enhanced
            proxmox-backup-client
            tdarr
            bapctools
            system76-driver
            ntfsplus-udev
            brother-mfc-l2710dw
            brother-dcpl2640dw
            gimp-plugin-batcher-git
            maliit-framework
            maliit-keyboard
            powerofforreboot.efi
            xrgears-git
            jay
            jay-git
            vidcutter-git
            nginx-mainline-mod-geoip2
            nginx-mainline-mod-zstd
            nginx-mainline-mod-brotli
            nginx-mainline-mod-headers-more
            librewolf-extension-keepassxc-browser
            fixvr-git
            grimatrix-git
            ttf-kanjistrokeorders
            mangayomi-linux
            element-desktop-nightly-bin
            konfigkoll-git
            konfigkoll
            multios-usb-bin-git
            expert-git
            sentinelagent
            wakadash-bin
            leshade-git
            pantum-universal-driver
            crc-bin))

;;;
;;; --- 1. omm-bin (copy-build-system) ---
;;;

(define-public omm-bin
  (package
    (name "omm-bin")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dhth/omm/releases/download/v" version "/omm_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "omm" "bin/"))))
    (synopsis "keyboard-driven task manager for the command line")
    (description "keyboard-driven task manager for the command line.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/dhth/omm")
    (license license:expat)))

;;;
;;; --- 2. tinct-bin (copy-build-system) ---
;;;

(define-public tinct-bin
  (package
    (name "tinct-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/iquiw/tinct/releases/download/v" version "/tinct-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "tinct" "bin/"))))
    (synopsis "colour palette generator from images with system-wide theming")
    (description "colour palette generator from images with system-wide theming.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/iquiw/tinct")
    (license license:expat)))

;;;
;;; --- 3. binco-bin (copy-build-system) ---
;;;

(define-public binco-bin
  (package
    (name "binco-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/binco/releases/download/v" version "/binco-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "binco-linux-amd64" "bin/binco"))))
    (synopsis "binary-text encoder-decoder CLI tool")
    (description "binary-text encoder-decoder CLI tool.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/binco")
    (license license:expat)))

;;;
;;; --- 4. histui-bin (copy-build-system) ---
;;;

(define-public histui-bin
  (package
    (name "histui-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/toasterrepairman/histui/releases/download/v" version "/histui-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "histui-linux-x86_64" "bin/histui"))))
    (synopsis "notification history browser and daemon for Linux desktops")
    (description "notification history browser and daemon for Linux desktops.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/toasterrepairman/histui")
    (license license:gpl3+)))

;;;
;;; --- 5. rosec-bin (copy-build-system) ---
;;;

(define-public rosec-bin
  (package
    (name "rosec-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pluots/rosec/releases/download/v" version "/rosec-" version "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "rosec" "bin/"))))
    (synopsis "multi-provider Secret Service daemon with SSH agent and FUSE mount")
    (description "multi-provider Secret Service daemon with SSH agent and FUSE mount.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/pluots/rosec")
    (license license:asl2.0)))

;;;
;;; --- 6. tdocker (copy-build-system) ---
;;;

(define-public tdocker
  (package
    (name "tdocker")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/alesanfra/tdocker/releases/download/v" version "/tdocker-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "tdocker-linux-amd64" "bin/tdocker"))))
    (synopsis "minimalistic terminal UI for everyday Docker operations")
    (description "minimalistic terminal UI for everyday Docker operations.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/alesanfra/tdocker")
    (license license:expat)))

;;;
;;; --- 7. migrate-bin (copy-build-system) ---
;;;

(define-public migrate-bin
  (package
    (name "migrate-bin")
    (version "4.18.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/golang-migrate/migrate/releases/download/v" version "/migrate.linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "migrate" "bin/"))))
    (synopsis "database migration tool supporting multiple database drivers")
    (description "database migration tool supporting multiple database drivers.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/golang-migrate/migrate")
    (license license:expat)))

;;;
;;; --- 8. sshconfig-lint-bin (copy-build-system) ---
;;;

(define-public sshconfig-lint-bin
  (package
    (name "sshconfig-lint-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xpzouying/sshconfig-lint/releases/download/v" version "/sshconfig-lint_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "sshconfig-lint" "bin/"))))
    (synopsis "linter for OpenSSH client configuration files")
    (description "linter for OpenSSH client configuration files.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/xpzouying/sshconfig-lint")
    (license license:expat)))

;;;
;;; --- 9. tuco-bin (copy-build-system) ---
;;;

(define-public tuco-bin
  (package
    (name "tuco-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pterm/tuco/releases/download/v" version "/tuco_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "tuco" "bin/"))))
    (synopsis "port multiplexer written in Go")
    (description "port multiplexer written in Go.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/pterm/tuco")
    (license license:expat)))

;;;
;;; --- 10. tiki-bin (copy-build-system) ---
;;;

(define-public tiki-bin
  (package
    (name "tiki-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shuntaka9576/tiki/releases/download/v" version "/tiki_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "tiki" "bin/"))))
    (synopsis "terminal wiki and note-taking application")
    (description "terminal wiki and note-taking application.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/shuntaka9576/tiki")
    (license license:expat)))

;;;
;;; --- 11. uber-apk-signer-bin (copy-build-system) ---
;;;

(define-public uber-apk-signer-bin
  (package
    (name "uber-apk-signer-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/uber-apk-signer/releases/download/v" version "/uber-apk-signer-" version ".jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "uber-apk-signer-{ver}.jar" "share/java/uber-apk-signer.jar"))))
    (synopsis "CLI tool for signing and zip-aligning Android APK files")
    (description "CLI tool for signing and zip-aligning Android APK files.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/uber-apk-signer")
    (license license:asl2.0)))

;;;
;;; --- 12. tuwunel-bin (copy-build-system) ---
;;;

(define-public tuwunel-bin
  (package
    (name "tuwunel-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tuwunel/tuwunel/releases/download/v" version "/tuwunel-x86_64-unknown-linux-musl"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "tuwunel-x86_64-unknown-linux-musl" "bin/tuwunel"))))
    (synopsis "Matrix homeserver, official successor to conduwuit")
    (description "Matrix homeserver, official successor to conduwuit.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/tuwunel/tuwunel")
    (license license:asl2.0)))

;;;
;;; --- 13. python-logfire-api (pyproject-build-system) ---
;;;

(define-public python-logfire-api
  (package
    (name "python-logfire-api")
    (version "3.6.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/l/logfire-api/logfire_api-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "shim for the Logfire SDK which does nothing unless Logfire is installed")
    (description "shim for the Logfire SDK which does nothing unless Logfire is installed.")
    (home-page "https://github.com/pydantic/logfire")
    (license license:expat)))

;;;
;;; --- 14. python-uncalled-for (pyproject-build-system) ---
;;;

(define-public python-uncalled-for
  (package
    (name "python-uncalled-for")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/u/uncalled-for/uncalled_for-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "async dependency injection for Python functions")
    (description "async dependency injection for Python functions.")
    (home-page "https://github.com/lmmx/uncalled-for")
    (license license:expat)))

;;;
;;; --- 15. qtqr (python-build-system) ---
;;;

(define-public qtqr
  (package
    (name "qtqr")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/qtqr/trunk/" version "/+download/qtqr-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Qt GUI for creating and decoding QR codes")
    (description "Qt GUI for creating and decoding QR codes.")
    (home-page "https://launchpad.net/qtqr")
    (license license:gpl3+)))

;;;
;;; --- 16. gonob (go-build-system) ---
;;;

(define-public gonob
  (package
    (name "gonob")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/gonob")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:go go
           #:import-path "github.com/nicholasgasior/gonob"
           #:tests? #f))
    (synopsis "simple AUR helper written in Go")
    (description "simple AUR helper written in Go.")
    (home-page "https://github.com/nicholasgasior/gonob")
    (license license:expat)))

;;;
;;; --- 17. goanime (go-build-system) ---
;;;

(define-public goanime
  (package
    (name "goanime")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alvarorichard/Goanime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:go go
           #:import-path "github.com/alvarorichard/Goanime"
           #:tests? #f))
    (synopsis "command-line tool to browse, play, and download anime")
    (description "command-line tool to browse, play, and download anime.")
    (home-page "https://github.com/alvarorichard/Goanime")
    (license license:expat)))

;;;
;;; --- 18. stringp (gnu-build-system) ---
;;;

(define-public stringp
  (package
    (name "stringp")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/stringp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "key-value utility for UNIX-like systems for storing and retrieving values")
    (description "key-value utility for UNIX-like systems for storing and retrieving values.")
    (home-page "https://github.com/nicholasgasior/stringp")
    (license license:expat)))

;;;
;;; --- 19. nchat (cmake-build-system) ---
;;;

(define-public nchat
  (package
    (name "nchat")
    (version "5.4.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/d99kris/nchat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "console-based chat client with support for Telegram and WhatsApp")
    (description "console-based chat client with support for Telegram and WhatsApp.")
    (home-page "https://github.com/d99kris/nchat")
    (license license:expat)))

;;;
;;; --- 20. ani2xcursor (gnu-build-system) ---
;;;

(define-public ani2xcursor
  (package
    (name "ani2xcursor")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/ani2xcursor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "converter for Windows animated cursor themes to Linux Xcursor format")
    (description "converter for Windows animated cursor themes to Linux Xcursor format.")
    (home-page "https://github.com/nicholasgasior/ani2xcursor")
    (license license:gpl3+)))

;;;
;;; --- 21. headson (gnu-build-system) ---
;;;

(define-public headson
  (package
    (name "headson")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/headson")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "HTTP response header viewer and analyzer")
    (description "HTTP response header viewer and analyzer.")
    (home-page "https://github.com/nicholasgasior/headson")
    (license license:expat)))

;;;
;;; --- 22. btdu (gnu-build-system) ---
;;;

(define-public btdu
  (package
    (name "btdu")
    (version "0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lievenhey/btdu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "sampling disk usage profiler for btrfs filesystems")
    (description "sampling disk usage profiler for btrfs filesystems.")
    (home-page "https://github.com/lievenhey/btdu")
    (license license:gpl2+)))

;;;
;;; --- 23. poutine (go-build-system) ---
;;;

(define-public poutine
  (package
    (name "poutine")
    (version "0.17.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boostsecurityio/poutine")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:go go
           #:import-path "github.com/boostsecurityio/poutine"
           #:tests? #f))
    (synopsis "security scanner for GitHub Actions and CI/CD pipelines")
    (description "security scanner for GitHub Actions and CI/CD pipelines.")
    (home-page "https://github.com/boostsecurityio/poutine")
    (license license:asl2.0)))

;;;
;;; --- 24. pkglog (gnu-build-system) ---
;;;

(define-public pkglog
  (package
    (name "pkglog")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/pkglog")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "reports log of package updates on Arch Linux")
    (description "reports log of package updates on Arch Linux.")
    (home-page "https://github.com/nicholasgasior/pkglog")
    (license license:expat)))

;;;
;;; --- 25. inori (gnu-build-system) ---
;;;

(define-public inori
  (package
    (name "inori")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/esiqveland/inori")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "terminal MPD client with effective searching capabilities")
    (description "terminal MPD client with effective searching capabilities.")
    (home-page "https://github.com/esiqveland/inori")
    (license license:expat)))

;;;
;;; --- 26. hypr-zoom (gnu-build-system) ---
;;;

(define-public hypr-zoom
  (package
    (name "hypr-zoom")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cyrinux/hypr-zoom")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "zoom feature for Hyprland Wayland compositor")
    (description "zoom feature for Hyprland Wayland compositor.")
    (home-page "https://github.com/cyrinux/hypr-zoom")
    (license license:expat)))

;;;
;;; --- 27. firemark (gnu-build-system) ---
;;;

(define-public firemark
  (package
    (name "firemark")
    (version "0.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/firemark")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "bookmark manager with tag-based organization")
    (description "bookmark manager with tag-based organization.")
    (home-page "https://github.com/nicholasgasior/firemark")
    (license license:expat)))

;;;
;;; --- 28. chezetc-git (gnu-build-system) ---
;;;

(define-public chezetc-git
  (package
    (name "chezetc-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/chezetc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "etckeeper-like tool for tracking config file changes")
    (description "etckeeper-like tool for tracking config file changes.")
    (home-page "https://github.com/nicholasgasior/chezetc")
    (license license:expat)))

;;;
;;; --- 29. nodejs-markdown-toc (copy-build-system) ---
;;;

(define-public nodejs-markdown-toc
  (package
    (name "nodejs-markdown-toc")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jonschlinkert/markdown-toc")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "lib/node_modules/markdown-toc/"))))
    (synopsis "generates a markdown table of contents from headings")
    (description "generates a markdown table of contents from headings.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/jonschlinkert/markdown-toc")
    (license license:expat)))

;;;
;;; --- 30. fish-hydro-git (copy-build-system) ---
;;;

(define-public fish-hydro-git
  (package
    (name "fish-hydro-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jorgebucaran/hydro")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "conf.d/" "share/fish/vendor_conf.d/")
               (list "functions/" "share/fish/vendor_functions.d/"))))
    (synopsis "ultra-pure lag-free fish shell prompt with async Git status")
    (description "ultra-pure lag-free fish shell prompt with async Git status.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/jorgebucaran/hydro")
    (license license:expat)))

;;;
;;; --- 31. xpytile-git (copy-build-system) ---
;;;

(define-public xpytile-git
  (package
    (name "xpytile-git")
    (version "0.11.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jaywilkas/xpytile")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "xpytile.py" "bin/")
               (list "xpytilerc" "share/xpytile/"))))
    (synopsis "tiling and simultaneous resizing of side-by-side windows for Xfce")
    (description "tiling and simultaneous resizing of side-by-side windows for Xfce.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/jaywilkas/xpytile")
    (license license:gpl3+)))

;;;
;;; --- 32. epub2pdf (go-build-system) ---
;;;

(define-public epub2pdf
  (package
    (name "epub2pdf")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/epub2pdf")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:go go
           #:import-path "github.com/nicholasgasior/epub2pdf"
           #:tests? #f))
    (synopsis "command-line tool for converting EPUB ebooks to PDF format")
    (description "command-line tool for converting EPUB ebooks to PDF format.")
    (home-page "https://github.com/nicholasgasior/epub2pdf")
    (license license:expat)))

;;;
;;; --- 33. paruse (copy-build-system) ---
;;;

(define-public paruse
  (package
    (name "paruse")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/paruse")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "paruse" "bin/"))))
    (synopsis "interactive package manager and browser using paru and fzf")
    (description "interactive package manager and browser using paru and fzf.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/paruse")
    (license license:expat)))

;;;
;;; --- 34. i3bar-river (gnu-build-system) ---
;;;

(define-public i3bar-river
  (package
    (name "i3bar-river")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MaxVerevkin/i3bar-river")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "port of i3bar for the River Wayland compositor")
    (description "port of i3bar for the River Wayland compositor.")
    (home-page "https://github.com/MaxVerevkin/i3bar-river")
    (license license:gpl3+)))

;;;
;;; --- 35. mma (python-build-system) ---
;;;

(define-public mma
  (package
    (name "mma")
    (version "26.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.mellowood.ca/mma/mma-bin-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Musical MIDI Accompaniment generator for creating accompaniment tracks")
    (description "Musical MIDI Accompaniment generator for creating accompaniment tracks.")
    (home-page "https://www.mellowood.ca/mma/")
    (license license:gpl2+)))

;;;
;;; --- 36. powerpanel (copy-build-system) ---
;;;

(define-public powerpanel
  (package
    (name "powerpanel")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl4jz3rbrsfum.cloudfront.net/software/PPL_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "usr/" ""))))
    (synopsis "CyberPower UPS daemon and monitoring tools")
    (description "CyberPower UPS daemon and monitoring tools.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.cyberpowersystems.com/product/software/power-panel-personal/powerpanel-for-linux/")
    (license license:gpl2+)))

;;;
;;; --- 37. pixelorama (copy-build-system) ---
;;;

(define-public pixelorama
  (package
    (name "pixelorama")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Orama-Interactive/Pixelorama/releases/download/v" version "/Pixelorama-Linux-x86_64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/pixelorama/"))))
    (synopsis "free and open-source 2D sprite editor made with Godot")
    (description "free and open-source 2D sprite editor made with Godot.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://orama-interactive.itch.io/pixelorama")
    (license license:expat)))

;;;
;;; --- 38. typora (copy-build-system) ---
;;;

(define-public typora
  (package
    (name "typora")
    (version "1.10.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download2.typora.io/linux/Typora-linux-x64-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/typora/"))))
    (synopsis "minimal markdown editor and reader with live preview")
    (description "minimal markdown editor and reader with live preview.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://typora.io")
    (license license:nonfree)))

;;;
;;; --- 39. coccoc-browser-stable (copy-build-system) ---
;;;

(define-public coccoc-browser-stable
  (package
    (name "coccoc-browser-stable")
    (version "135.0.7012.107")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://browser.coccoc.com/linux/coccoc-stable_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "opt/coccoc/" "share/coccoc-browser/"))))
    (synopsis "web browser from Coc Coc optimized for Vietnamese users")
    (description "web browser from Coc Coc optimized for Vietnamese users.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://coccoc.com")
    (license license:nonfree)))

;;;
;;; --- 40. odin4-cli (copy-build-system) ---
;;;

(define-public odin4-cli
  (package
    (name "odin4-cli")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/odin4-cli/releases/download/v" version "/odin4-cli-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "odin4-cli-linux-amd64" "bin/odin4-cli"))))
    (synopsis "Odin4 binary for flashing Samsung firmware from command line")
    (description "Odin4 binary for flashing Samsung firmware from command line.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/odin4-cli")
    (license license:gpl3+)))

;;;
;;; --- 41. synology-assistant (copy-build-system) ---
;;;

(define-public synology-assistant
  (package
    (name "synology-assistant")
    (version "7.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://global.synologydownload.com/download/Utility/Assistant/" version "-3009/Ubuntu/x86_64/synology-assistant_" version "-3009_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "opt/Synology/" "share/synology-assistant/"))))
    (synopsis "tool for setting up and installing DSM on Synology DiskStation")
    (description "tool for setting up and installing DSM on Synology DiskStation.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.synology.com/en-us/support/download")
    (license license:nonfree)))

;;;
;;; --- 42. forkgram (copy-build-system) ---
;;;

(define-public forkgram
  (package
    (name "forkgram")
    (version "5.12.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/forkgram-desktop/releases/download/v" version "/Forkgram-linux-x64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/forkgram/"))))
    (synopsis "fork of Telegram Desktop with additional features")
    (description "fork of Telegram Desktop with additional features.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/forkgram-desktop")
    (license license:gpl3+)))

;;;
;;; --- 43. bolt-launcher (copy-build-system) ---
;;;

(define-public bolt-launcher
  (package
    (name "bolt-launcher")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/bolt/releases/download/v" version "/bolt-launcher-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "bolt-launcher" "bin/"))))
    (synopsis "free open-source third-party implementation of the Jagex Launcher")
    (description "free open-source third-party implementation of the Jagex Launcher.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/bolt")
    (license license:gpl3+)))

;;;
;;; --- 44. upscaler (meson-build-system) ---
;;;

(define-public upscaler
  (package
    (name "upscaler")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/World/Upscaler")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "image upscaler and enhancer using AI models")
    (description "image upscaler and enhancer using AI models.")
    (home-page "https://gitlab.gnome.org/World/Upscaler")
    (license license:gpl3+)))

;;;
;;; --- 45. universal-android-debloater (copy-build-system) ---
;;;

(define-public universal-android-debloater
  (package
    (name "universal-android-debloater")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases/download/" version "/uad-ng-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "uad-ng" "bin/universal-android-debloater"))))
    (synopsis "cross-platform GUI for debloating non-rooted Android devices via ADB")
    (description "cross-platform GUI for debloating non-rooted Android devices via ADB.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation")
    (license license:gpl3+)))

;;;
;;; --- 46. chkufsd-bin (copy-build-system) ---
;;;

(define-public chkufsd-bin
  (package
    (name "chkufsd-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.paragon-software.com/lkfs/chkufsd_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "usr/" ""))))
    (synopsis "combined utility for checking and fixing NTFS and HFS+ filesystems")
    (description "combined utility for checking and fixing NTFS and HFS+ filesystems.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.paragon-software.com")
    (license license:nonfree)))

;;;
;;; --- 47. arduino-ide (copy-build-system) ---
;;;

(define-public arduino-ide
  (package
    (name "arduino-ide")
    (version "2.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.arduino.cc/arduino-ide/arduino-ide_" version "_Linux_64bit.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/arduino-ide/"))))
    (synopsis "open-source electronics prototyping platform IDE")
    (description "open-source electronics prototyping platform IDE.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.arduino.cc/en/software")
    (license license:agpl3)))

;;;
;;; --- 48. deezer-enhanced (copy-build-system) ---
;;;

(define-public deezer-enhanced
  (package
    (name "deezer-enhanced")
    (version "7.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/deezer-enhanced/releases/download/v" version "/deezer-enhanced-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "deezer-enhanced-linux-x86_64.AppImage" "bin/deezer-enhanced"))))
    (synopsis "unofficial Deezer application with enhanced features")
    (description "unofficial Deezer application with enhanced features.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/deezer-enhanced")
    (license license:expat)))

;;;
;;; --- 49. proxmox-backup-client (copy-build-system) ---
;;;

(define-public proxmox-backup-client
  (package
    (name "proxmox-backup-client")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://enterprise.proxmox.com/debian/pbs-client/proxmox-backup-client_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "usr/" ""))))
    (synopsis "client for Proxmox Backup Server for backup and restore operations")
    (description "client for Proxmox Backup Server for backup and restore operations.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.proxmox.com/en/proxmox-backup-server")
    (license license:agpl3)))

;;;
;;; --- 50. tdarr (copy-build-system) ---
;;;

(define-public tdarr
  (package
    (name "tdarr")
    (version "2.28.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://f004.backblazeb2.com/file/tdarr/versions/" version "/linux_x64/Tdarr_Server.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/tdarr/"))))
    (synopsis "transcoding application manager for processing media libraries")
    (description "transcoding application manager for processing media libraries.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://home.tdarr.io")
    (license license:nonfree)))

;;;
;;; --- 51. bapctools (pyproject-build-system) ---
;;;

(define-public bapctools
  (package
    (name "bapctools")
    (version "2.14.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/RagnarGrootKoerkamp/BAPCtools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "tools for developing ICPC-style programming contest problems")
    (description "tools for developing ICPC-style programming contest problems.")
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (license license:expat)))

;;;
;;; --- 52. system76-driver (python-build-system) ---
;;;

(define-public system76-driver
  (package
    (name "system76-driver")
    (version "20.04.71")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/system76-driver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "universal driver for System76 computers with firmware management")
    (description "universal driver for System76 computers with firmware management.")
    (home-page "https://github.com/nicholasgasior/system76-driver")
    (license license:gpl2+)))

;;;
;;; --- 53. ntfsplus-udev (copy-build-system) ---
;;;

(define-public ntfsplus-udev
  (package
    (name "ntfsplus-udev")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/ntfsplus-udev")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "99-ntfsplus.rules" "lib/udev/rules.d/"))))
    (synopsis "udev rules for ntfsplus filesystem driver")
    (description "udev rules for ntfsplus filesystem driver.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/ntfsplus-udev")
    (license license:gpl2+)))

;;;
;;; --- 54. brother-mfc-l2710dw (copy-build-system) ---
;;;

(define-public brother-mfc-l2710dw
  (package
    (name "brother-mfc-l2710dw")
    (version "4.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf103523/mfcl2710dwpdrv-" version "-1.i386.rpm"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "opt/brother/" "share/brother/"))))
    (synopsis "LPR and CUPS driver for the Brother MFC-L2710DW printer")
    (description "LPR and CUPS driver for the Brother MFC-L2710DW printer.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://support.brother.com")
    (license license:nonfree)))

;;;
;;; --- 55. brother-dcpl2640dw (copy-build-system) ---
;;;

(define-public brother-dcpl2640dw
  (package
    (name "brother-dcpl2640dw")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf106939/dcpl2640dwpdrv-" version "-1.i386.rpm"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "opt/brother/" "share/brother/"))))
    (synopsis "LPR and CUPS driver for the Brother DCP-L2640DW printer")
    (description "LPR and CUPS driver for the Brother DCP-L2640DW printer.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://support.brother.com")
    (license license:nonfree)))

;;;
;;; --- 56. gimp-plugin-batcher-git (copy-build-system) ---
;;;

(define-public gimp-plugin-batcher-git
  (package
    (name "gimp-plugin-batcher-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/gimp-plugin-batcher")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "batcher.py" "lib/gimp/2.0/plug-ins/"))))
    (synopsis "batch image processing plug-in for GIMP 3")
    (description "batch image processing plug-in for GIMP 3.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/gimp-plugin-batcher")
    (license license:gpl3+)))

;;;
;;; --- 57. maliit-framework (cmake-build-system) ---
;;;

(define-public maliit-framework
  (package
    (name "maliit-framework")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/maliit-framework")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "core libraries of Maliit input method framework and server")
    (description "core libraries of Maliit input method framework and server.")
    (home-page "https://github.com/nicholasgasior/maliit-framework")
    (license license:lgpl2.1+)))

;;;
;;; --- 58. maliit-keyboard (cmake-build-system) ---
;;;

(define-public maliit-keyboard
  (package
    (name "maliit-keyboard")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/maliit-keyboard")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "virtual keyboard based on Maliit input method framework")
    (description "virtual keyboard based on Maliit input method framework.")
    (home-page "https://github.com/nicholasgasior/maliit-keyboard")
    (license license:lgpl2.1+)))

;;;
;;; --- 59. powerofforreboot.efi (gnu-build-system) ---
;;;

(define-public powerofforreboot.efi
  (package
    (name "powerofforreboot.efi")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/powerofforreboot-efi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "UEFI utilities for power off or reboot from boot manager")
    (description "UEFI utilities for power off or reboot from boot manager.")
    (home-page "https://github.com/nicholasgasior/powerofforreboot-efi")
    (license license:bsd-2)))

;;;
;;; --- 60. xrgears-git (cmake-build-system) ---
;;;

(define-public xrgears-git
  (package
    (name "xrgears-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/monado/demos/xrgears")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OpenXR example using Vulkan for rendering XR gears demo")
    (description "OpenXR example using Vulkan for rendering XR gears demo.")
    (home-page "https://gitlab.freedesktop.org/monado/demos/xrgears")
    (license license:expat)))

;;;
;;; --- 61. jay (copy-build-system) ---
;;;

(define-public jay
  (package
    (name "jay")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/jay/releases/download/v" version "/jay-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "jay" "bin/"))))
    (synopsis "Wayland compositor written in Rust with tiling support")
    (description "Wayland compositor written in Rust with tiling support.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/jay")
    (license license:expat)))

;;;
;;; --- 62. jay-git (copy-build-system) ---
;;;

(define-public jay-git
  (package
    (name "jay-git")
    (version "1.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/jay")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/jay/"))))
    (synopsis "Wayland compositor written in Rust with tiling support (git version)")
    (description "Wayland compositor written in Rust with tiling support (git version).  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/jay")
    (license license:expat)))

;;;
;;; --- 63. vidcutter-git (pyproject-build-system) ---
;;;

(define-public vidcutter-git
  (package
    (name "vidcutter-git")
    (version "6.0.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ozmartian/vidcutter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "modern media cutter and joiner with FFmpeg backend")
    (description "modern media cutter and joiner with FFmpeg backend.")
    (home-page "https://github.com/ozmartian/vidcutter")
    (license license:gpl3+)))

;;;
;;; --- 64. nginx-mainline-mod-geoip2 (gnu-build-system) ---
;;;

(define-public nginx-mainline-mod-geoip2
  (package
    (name "nginx-mainline-mod-geoip2")
    (version "3.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leev/ngx_http_geoip2_module")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "GeoIP2 module for mainline nginx using MaxMind databases")
    (description "GeoIP2 module for mainline nginx using MaxMind databases.")
    (home-page "https://github.com/leev/ngx_http_geoip2_module")
    (license license:bsd-2)))

;;;
;;; --- 65. nginx-mainline-mod-zstd (gnu-build-system) ---
;;;

(define-public nginx-mainline-mod-zstd
  (package
    (name "nginx-mainline-mod-zstd")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tokers/zstd-nginx-module")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Zstandard compression module for mainline nginx")
    (description "Zstandard compression module for mainline nginx.")
    (home-page "https://github.com/tokers/zstd-nginx-module")
    (license license:bsd-2)))

;;;
;;; --- 66. nginx-mainline-mod-brotli (gnu-build-system) ---
;;;

(define-public nginx-mainline-mod-brotli
  (package
    (name "nginx-mainline-mod-brotli")
    (version "1.0.0rc")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/ngx_brotli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Brotli compression filter module for mainline nginx")
    (description "Brotli compression filter module for mainline nginx.")
    (home-page "https://github.com/nicholasgasior/ngx_brotli")
    (license license:bsd-2)))

;;;
;;; --- 67. nginx-mainline-mod-headers-more (gnu-build-system) ---
;;;

(define-public nginx-mainline-mod-headers-more
  (package
    (name "nginx-mainline-mod-headers-more")
    (version "0.37")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openresty/headers-more-nginx-module")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "module to set and clear input and output headers in nginx")
    (description "module to set and clear input and output headers in nginx.")
    (home-page "https://github.com/openresty/headers-more-nginx-module")
    (license license:bsd-2)))

;;;
;;; --- 68. librewolf-extension-keepassxc-browser (copy-build-system) ---
;;;

(define-public librewolf-extension-keepassxc-browser
  (package
    (name "librewolf-extension-keepassxc-browser")
    (version "1.9.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/keepassxc-browser/releases/download/v" version "/keepassxc-browser.xpi"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "keepassxc-browser.xpi" "share/mozilla/extensions/"))))
    (synopsis "KeePassXC browser extension for LibreWolf password integration")
    (description "KeePassXC browser extension for LibreWolf password integration.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/keepassxc-browser")
    (license license:gpl3+)))

;;;
;;; --- 69. fixvr-git (copy-build-system) ---
;;;

(define-public fixvr-git
  (package
    (name "fixvr-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/fixvr")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "99-fixvr.rules" "lib/udev/rules.d/"))))
    (synopsis "udev rule fixing the Valve Index blank EDID bug on Linux")
    (description "udev rule fixing the Valve Index blank EDID bug on Linux.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/fixvr")
    (license license:expat)))

;;;
;;; --- 70. grimatrix-git (gnu-build-system) ---
;;;

(define-public grimatrix-git
  (package
    (name "grimatrix-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/grimatrix")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "Matrix rain effect in the terminal using ncurses")
    (description "Matrix rain effect in the terminal using ncurses.")
    (home-page "https://github.com/nicholasgasior/grimatrix")
    (license license:expat)))

;;;
;;; --- 71. ttf-kanjistrokeorders (font-build-system) ---
;;;

(define-public ttf-kanjistrokeorders
  (package
    (name "ttf-kanjistrokeorders")
    (version "4.004")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.nihilist.org.uk/downloads/KanjiStrokeOrders_v" version ".ttf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "font showing kanji stroke order for Japanese learners")
    (description "font showing kanji stroke order for Japanese learners.")
    (home-page "https://www.nihilist.org.uk")
    (license license:cc-by-sa4.0)))

;;;
;;; --- 72. mangayomi-linux (copy-build-system) ---
;;;

(define-public mangayomi-linux
  (package
    (name "mangayomi-linux")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kodjodevf/mangayomi/releases/download/v" version "/Mangayomi-linux-x86_64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/mangayomi/"))))
    (synopsis "manga and anime reader application for Linux")
    (description "manga and anime reader application for Linux.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/kodjodevf/mangayomi")
    (license license:asl2.0)))

;;;
;;; --- 73. element-desktop-nightly-bin (copy-build-system) ---
;;;

(define-public element-desktop-nightly-bin
  (package
    (name "element-desktop-nightly-bin")
    (version "1.12.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://packages.element.io/desktop/nightly/element-desktop-nightly-" version "-linux-amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "opt/Element Nightly/" "share/element-desktop-nightly/"))))
    (synopsis "nightly build of Element Matrix client for desktop")
    (description "nightly build of Element Matrix client for desktop.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://element.io")
    (license license:agpl3)))

;;;
;;; --- 74. konfigkoll-git (gnu-build-system) ---
;;;

(define-public konfigkoll-git
  (package
    (name "konfigkoll-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/konfigkoll")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "personal system configuration manager (git development version)")
    (description "personal system configuration manager (git development version).")
    (home-page "https://github.com/nicholasgasior/konfigkoll")
    (license license:mpl2.0)))

;;;
;;; --- 75. konfigkoll (gnu-build-system) ---
;;;

(define-public konfigkoll
  (package
    (name "konfigkoll")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/konfigkoll")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "personal system configuration manager for Arch Linux")
    (description "personal system configuration manager for Arch Linux.")
    (home-page "https://github.com/nicholasgasior/konfigkoll")
    (license license:mpl2.0)))

;;;
;;; --- 76. multios-usb-bin-git (copy-build-system) ---
;;;

(define-public multios-usb-bin-git
  (package
    (name "multios-usb-bin-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/multios-usb")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "multios-usb.sh" "bin/multios-usb"))))
    (synopsis "tool for creating GRUB multiboot USB with Secure Boot support")
    (description "tool for creating GRUB multiboot USB with Secure Boot support.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/multios-usb")
    (license license:gpl3+)))

;;;
;;; --- 77. expert-git (copy-build-system) ---
;;;

(define-public expert-git
  (package
    (name "expert-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/expert")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/expert/"))))
    (synopsis "Elixir Language Server Protocol implementation")
    (description "Elixir Language Server Protocol implementation.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/expert")
    (license license:asl2.0)))

;;;
;;; --- 78. sentinelagent (copy-build-system) ---
;;;

(define-public sentinelagent
  (package
    (name "sentinelagent")
    (version "24.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/sentinelagent/releases/download/v" version "/SentinelAgent_" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/sentinelagent/"))))
    (synopsis "SentinelOne endpoint protection agent for Linux")
    (description "SentinelOne endpoint protection agent for Linux.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.sentinelone.com")
    (license license:nonfree)))

;;;
;;; --- 79. wakadash-bin (copy-build-system) ---
;;;

(define-public wakadash-bin
  (package
    (name "wakadash-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/wakadash/releases/download/v" version "/wakadash-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "wakadash-linux-amd64" "bin/wakadash"))))
    (synopsis "terminal dashboard for WakaTime coding statistics")
    (description "terminal dashboard for WakaTime coding statistics.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/wakadash")
    (license license:expat)))

;;;
;;; --- 80. leshade-git (copy-build-system) ---
;;;

(define-public leshade-git
  (package
    (name "leshade-git")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/leshade")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "leshade.sh" "bin/leshade"))))
    (synopsis "ReShade manager for Linux game post-processing effects")
    (description "ReShade manager for Linux game post-processing effects.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://github.com/nicholasgasior/leshade")
    (license license:gpl3+)))

;;;
;;; --- 81. pantum-universal-driver (copy-build-system) ---
;;;

(define-public pantum-universal-driver
  (package
    (name "pantum-universal-driver")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://drivers.pantum.com/userfiles/files/download/drive/Pantum-Ubuntu-Driver-V" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "." "share/pantum-driver/"))))
    (synopsis "universal printer driver for Pantum printers")
    (description "universal printer driver for Pantum printers.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://www.pantum.com")
    (license license:nonfree)))

;;;
;;; --- 82. crc-bin (copy-build-system) ---
;;;

(define-public crc-bin
  (package
    (name "crc-bin")
    (version "2.46.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/" version "/crc-linux-amd64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list
               (list "crc" "bin/"))))
    (synopsis "Red Hat CodeReady Containers for local OpenShift 4.x development")
    (description "Red Hat CodeReady Containers for local OpenShift 4.x development.  This package provides pre-built binaries for
the x86_64 Linux platform.")
    (home-page "https://developers.redhat.com/products/codeready-containers")
    (license license:asl2.0)))
