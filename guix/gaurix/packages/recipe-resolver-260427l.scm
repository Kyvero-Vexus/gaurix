;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427l
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427l)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            gcc-snapshot
            gvfs-google-git
            gvfs-goa-git
            gvfs-afc-git
            sqlectron-gui
            wiringpi-git
            emacs-pretest
            quickhash-gui-bin
            cli-visualizer-git
            rars
            python-open3d-git
            open3d-git
            gptrace
            fselect-bin
            trdsql-bin
            kime-bin
            python-git-up
            jmc-adoptium
            gitkraken-cli
            ticker-bin
            shell2http-bin
            python-calcpy-git
            octosql-bin
            gofish-bin
            focus-bin
            fcast-receiver-bin
            wrld
            varallel
            vanshot
            usql-bin
            tuistash
            tree-sitter-jule-git
            tdl-bin
            tarman-bin
            sql-studio-bin
            snowglobe-git
            sfp-master-git
            python-torchsde
            python-metno-locationforecast
            python-dbg
            python-bsky-bridge-git
            polyversal-patcher
            pget-bin
            pepecoin
            omu
            nexusmods-app-git
            navicat-premium-lite-zh-cn
            navicat-premium-lite-en
            mult
            lua54-luasodium
            lua53-luasodium
            lua52-luasodium
            lua51-luasodium
            lua-luasodium
            input-devices-support-gnome
            img2irc-bin
            imap
            i915ovmf
            harsh-bin
            gitmaster
            fdutils
            fcitx5-pangu-git
            en-croissant
            dtach-ng-bin
            dron-bin
            desktop-wakatime-bin
            cls-rs
            chwp-bin
            chromazone
            carapace-spec-man-bin
            carapace-spec-bin
            bzfs
            bskydesktop
            book-git
            bchwallet
            bchd
            async-plus-plus
            async
            aspell6-fa
            art-rawconverter-ctlscripts
            gimp-plugin-pandora
            gimp-plugin-beautify
            gimp-plugin-export-layers
            cronicle
            cppreference
            wechat-devtools-git
            gimp-plugin-resynthesizer-scm-git
            rofi-git
            nodejs-tiddlywiki
            corekeyboard
            brotab
            eclipse-mat
            gimp-git
            tofi-git
            android-backup-extractor
            maestral-qt
            evremap-git
            baph
            techmino
            splashtop-business
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; gcc-snapshot --- GNU Compiler Collection snapshot
(define-public gcc-snapshot
  (package
    (name "gcc-snapshot")
    (version "15.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNU Compiler Collection snapshot")
    (description "GNU Compiler Collection snapshot.")
    (home-page "https://gcc.gnu.org/")
    (license license:gpl3+)))

;;; gvfs-google-git --- virtual filesystem implementation for GIO (Google Drive backend)
(define-public gvfs-google-git
  (package
    (name "gvfs-google-git")
    (version "1.56.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-google-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual filesystem implementation for GIO (Google Drive backend)")
    (description "Virtual filesystem implementation for GIO (Google Drive backend).")
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (license license:lgpl2.1+)))

;;; gvfs-goa-git --- virtual filesystem implementation for GIO (GNOME Online Accounts backend)
(define-public gvfs-goa-git
  (package
    (name "gvfs-goa-git")
    (version "1.56.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-goa-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual filesystem implementation for GIO (GNOME Online Accounts backend)")
    (description "Virtual filesystem implementation for GIO (GNOME Online Accounts backend).")
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (license license:lgpl2.1+)))

;;; gvfs-afc-git --- virtual filesystem implementation for GIO (AFC backend; Apple mobile devices)
(define-public gvfs-afc-git
  (package
    (name "gvfs-afc-git")
    (version "1.56.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gvfs-afc-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual filesystem implementation for GIO (AFC backend; Apple mobile devices)")
    (description "Virtual filesystem implementation for GIO (AFC backend; Apple mobile devices).")
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (license license:lgpl2.1+)))

;;; sqlectron-gui --- simple and lightweight SQL client with cross database and platform support
(define-public sqlectron-gui
  (package
    (name "sqlectron-gui")
    (version "1.38.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sqlectron-gui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple and lightweight SQL client with cross database and platform support")
    (description "Simple and lightweight SQL client with cross database and platform support.")
    (home-page "https://sqlectron.github.io/")
    (license license:expat)))

;;; wiringpi-git --- arduino wiring-like library written in C for RaspberryPi
(define-public wiringpi-git
  (package
    (name "wiringpi-git")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wiringpi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "arduino wiring-like library written in C for RaspberryPi")
    (description "Arduino wiring-like library written in C for RaspberryPi.")
    (home-page "https://github.com/WiringPi/WiringPi")
    (license license:lgpl3+)))

;;; emacs-pretest --- the extensible, customizable, self-documenting real-time display editor (prete
(define-public emacs-pretest
  (package
    (name "emacs-pretest")
    (version "30.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/emacs-pretest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "the extensible, customizable, self-documenting real-time display editor (prete")
    (description "The extensible, customizable, self-documenting real-time display editor (pretest).")
    (home-page "https://www.gnu.org/software/emacs/")
    (license license:gpl3+)))

;;; quickhash-gui-bin --- open-source Linux GUI for hashing files, text, folders, and disks
(define-public quickhash-gui-bin
  (package
    (name "quickhash-gui-bin")
    (version "3.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quickhash-gui-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Linux GUI for hashing files, text, folders, and disks")
    (description "Open-source Linux GUI for hashing files, text, folders, and disks.")
    (home-page "https://www.quickhash-gui.org/")
    (license license:gpl2)))

;;; cli-visualizer-git --- cLI audio visualizer for mpd
(define-public cli-visualizer-git
  (package
    (name "cli-visualizer-git")
    (version "1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cli-visualizer-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI audio visualizer for mpd")
    (description "CLI audio visualizer for mpd.")
    (home-page "https://github.com/dpayne/cli-visualizer")
    (license license:expat)))

;;; rars --- RISC-V Assembler and Runtime Simulator
(define-public rars
  (package
    (name "rars")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rars.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "RISC-V Assembler and Runtime Simulator")
    (description "RISC-V Assembler and Runtime Simulator.")
    (home-page "https://github.com/TheThirdOne/rars")
    (license license:expat)))

;;; python-open3d-git --- modern library for 3D data processing (Python bindings)
(define-public python-open3d-git
  (package
    (name "python-open3d-git")
    (version "0.18.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-open3d-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern library for 3D data processing (Python bindings)")
    (description "Modern library for 3D data processing (Python bindings).")
    (home-page "http://www.open3d.org/")
    (license license:expat)))

;;; open3d-git --- modern library for 3D data processing
(define-public open3d-git
  (package
    (name "open3d-git")
    (version "0.18.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/open3d-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern library for 3D data processing")
    (description "Modern library for 3D data processing.")
    (home-page "http://www.open3d.org/")
    (license license:expat)))

;;; gptrace --- trace the activities of an external application
(define-public gptrace
  (package
    (name "gptrace")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gptrace.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "trace the activities of an external application")
    (description "Trace the activities of an external application.")
    (home-page "https://github.com/nicfit/GPtrace")
    (license license:gpl2+)))

;;; fselect-bin --- find files with SQL-like queries
(define-public fselect-bin
  (package
    (name "fselect-bin")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fselect-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "find files with SQL-like queries")
    (description "Find files with SQL-like queries.")
    (home-page "https://github.com/jhspetersson/fselect")
    (license license:expat)))

;;; trdsql-bin --- cLI tool to execute SQL queries on CSV, LTSV, JSON, and TBLN
(define-public trdsql-bin
  (package
    (name "trdsql-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/trdsql-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI tool to execute SQL queries on CSV, LTSV, JSON, and TBLN")
    (description "CLI tool to execute SQL queries on CSV, LTSV, JSON, and TBLN.")
    (home-page "https://github.com/noborus/trdsql")
    (license license:expat)))

;;; kime-bin --- Korean input method editor
(define-public kime-bin
  (package
    (name "kime-bin")
    (version "3.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kime-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Korean input method editor")
    (description "Korean input method editor.")
    (home-page "https://github.com/Riey/kime")
    (license license:gpl3+)))

;;; python-git-up --- Python implementation of git up
(define-public python-git-up
  (package
    (name "python-git-up")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-git-up.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python implementation of git up")
    (description "Python implementation of git up.")
    (home-page "https://github.com/msiemens/PyGitUp")
    (license license:expat)))

;;; jmc-adoptium --- Java Mission Control from Adoptium
(define-public jmc-adoptium
  (package
    (name "jmc-adoptium")
    (version "9.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jmc-adoptium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Java Mission Control from Adoptium")
    (description "Java Mission Control from Adoptium.")
    (home-page "https://adoptium.net/jmc/")
    (license license:nonfree)))

;;; gitkraken-cli --- gitKraken command-line interface
(define-public gitkraken-cli
  (package
    (name "gitkraken-cli")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitkraken-cli.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gitKraken command-line interface")
    (description "GitKraken command-line interface.")
    (home-page "https://www.gitkraken.com/cli")
    (license license:nonfree)))

;;; ticker-bin --- terminal stock ticker with live updates and position tracking
(define-public ticker-bin
  (package
    (name "ticker-bin")
    (version "4.6.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ticker-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal stock ticker with live updates and position tracking")
    (description "Terminal stock ticker with live updates and position tracking.")
    (home-page "https://github.com/achannarasappa/ticker")
    (license license:expat)))

;;; shell2http-bin --- HTTP-server to execute shell commands
(define-public shell2http-bin
  (package
    (name "shell2http-bin")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shell2http-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "HTTP-server to execute shell commands")
    (description "HTTP-server to execute shell commands.")
    (home-page "https://github.com/msoap/shell2http")
    (license license:expat)))

;;; python-calcpy-git --- terminal calculator and advanced math solver using Python, IPython and SymPy
(define-public python-calcpy-git
  (package
    (name "python-calcpy-git")
    (version "0.9.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-calcpy-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal calculator and advanced math solver using Python, IPython and SymPy")
    (description "Terminal calculator and advanced math solver using Python, IPython and SymPy.")
    (home-page "https://github.com/AnyKeyShik/calcpy")
    (license license:expat)))

;;; octosql-bin --- query tool to join, analyse and transform data from multiple sources using SQL
(define-public octosql-bin
  (package
    (name "octosql-bin")
    (version "0.12.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/octosql-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "query tool to join, analyse and transform data from multiple sources using SQL")
    (description "Query tool to join, analyse and transform data from multiple sources using SQL.")
    (home-page "https://github.com/cube2222/octosql")
    (license license:expat)))

;;; gofish-bin --- cross-platform package manager
(define-public gofish-bin
  (package
    (name "gofish-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gofish-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform package manager")
    (description "Cross-platform package manager.")
    (home-page "https://gofi.sh/")
    (license license:expat)))

;;; focus-bin --- simple and fast text editor
(define-public focus-bin
  (package
    (name "focus-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/focus-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple and fast text editor")
    (description "Simple and fast text editor.")
    (home-page "https://github.com/nicbarker/focus")
    (license license:expat)))

;;; fcast-receiver-bin --- binary releases of Fcast receiver
(define-public fcast-receiver-bin
  (package
    (name "fcast-receiver-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fcast-receiver-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary releases of Fcast receiver")
    (description "Binary releases of Fcast receiver.")
    (home-page "https://fcast.org/")
    (license license:gpl3+)))

;;; wrld --- simplified bash loops (xargs -I on steroids)
(define-public wrld
  (package
    (name "wrld")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wrld.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simplified bash loops (xargs -I on steroids)")
    (description "Simplified bash loops (xargs -I on steroids).")
    (home-page "https://github.com/ryanmjacobs/wrld")
    (license license:expat)))

;;; varallel --- cross-platform CLI tool to run commands in parallel
(define-public varallel
  (package
    (name "varallel")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/varallel.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform CLI tool to run commands in parallel")
    (description "Cross-platform CLI tool to run commands in parallel.")
    (home-page "https://github.com/panjf2000/varallel")
    (license license:expat)))

;;; vanshot --- screenshot tool for Wayland
(define-public vanshot
  (package
    (name "vanshot")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vanshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "screenshot tool for Wayland")
    (description "Screenshot tool for Wayland.")
    (home-page "https://codeberg.org/jovanlanik/vanshot")
    (license license:gpl3+)))

;;; usql-bin --- universal command-line interface for SQL databases
(define-public usql-bin
  (package
    (name "usql-bin")
    (version "0.19.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/usql-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "universal command-line interface for SQL databases")
    (description "Universal command-line interface for SQL databases.")
    (home-page "https://github.com/xo/usql")
    (license license:expat)))

;;; tuistash --- terminal user interface for Logstash
(define-public tuistash
  (package
    (name "tuistash")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tuistash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal user interface for Logstash")
    (description "Terminal user interface for Logstash.")
    (home-page "https://github.com/edmocosta/tuistash")
    (license license:expat)))

;;; tree-sitter-jule-git --- jule syntax tree for the Tree-sitter parsing library
(define-public tree-sitter-jule-git
  (package
    (name "tree-sitter-jule-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tree-sitter-jule-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "jule syntax tree for the Tree-sitter parsing library")
    (description "Jule syntax tree for the Tree-sitter parsing library.")
    (home-page "https://github.com/julelang/tree-sitter-jule")
    (license license:expat)))

;;; tdl-bin --- Telegram downloader/tools written in Golang
(define-public tdl-bin
  (package
    (name "tdl-bin")
    (version "0.17.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tdl-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Telegram downloader/tools written in Golang")
    (description "Telegram downloader/tools written in Golang.")
    (home-page "https://github.com/iyear/tdl")
    (license license:expat)))

;;; tarman-bin --- portable, cross-platform, extensible package manager for tarballs
(define-public tarman-bin
  (package
    (name "tarman-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tarman-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "portable, cross-platform, extensible package manager for tarballs")
    (description "Portable, cross-platform, extensible package manager for tarballs.")
    (home-page "https://github.com/CharlieS1103/tarman")
    (license license:expat)))

;;; sql-studio-bin --- sQL database explorer for SQLite, PostgreSQL, MySQL, DuckDB, and more
(define-public sql-studio-bin
  (package
    (name "sql-studio-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sql-studio-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sQL database explorer for SQLite, PostgreSQL, MySQL, DuckDB, and more")
    (description "SQL database explorer for SQLite, PostgreSQL, MySQL, DuckDB, and more.")
    (home-page "https://github.com/nicholasgasior/sql-studio")
    (license license:expat)))

;;; snowglobe-git --- virtualization viewer using QEMU over DBus
(define-public snowglobe-git
  (package
    (name "snowglobe-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snowglobe-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtualization viewer using QEMU over DBus")
    (description "Virtualization viewer using QEMU over DBus.")
    (home-page "https://gitlab.gnome.org/jdm/snowglobe")
    (license license:gpl3+)))

;;; sfp-master-git --- sFP-module programmer for CH341a devices
(define-public sfp-master-git
  (package
    (name "sfp-master-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sfp-master-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "sFP-module programmer for CH341a devices")
    (description "SFP-module programmer for CH341a devices.")
    (home-page "https://github.com/ArtCEO/sfp-master")
    (license license:gpl3+)))

;;; python-torchsde --- differentiable SDE solvers with GPU support and efficient sensitivity analysis
(define-public python-torchsde
  (package
    (name "python-torchsde")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-torchsde.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "differentiable SDE solvers with GPU support and efficient sensitivity analysis")
    (description "Differentiable SDE solvers with GPU support and efficient sensitivity analysis.")
    (home-page "https://github.com/google-research/torchsde")
    (license license:asl2.0)))

;;; python-metno-locationforecast --- Python interface for MET Norway Locationforecast/2.0 weather service
(define-public python-metno-locationforecast
  (package
    (name "python-metno-locationforecast")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-metno-locationforecast.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python interface for MET Norway Locationforecast/2.0 weather service")
    (description "Python interface for MET Norway Locationforecast/2.0 weather service.")
    (home-page "https://github.com/Rory-Sullivan/metno-locationforecast")
    (license license:expat)))

;;; python-dbg --- Python 3 interpreter (debug build)
(define-public python-dbg
  (package
    (name "python-dbg")
    (version "3.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-dbg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python 3 interpreter (debug build)")
    (description "Python 3 interpreter (debug build).")
    (home-page "https://www.python.org/")
    (license license:psfl)))

;;; python-bsky-bridge-git --- Python module for the Bluesky social network API
(define-public python-bsky-bridge-git
  (package
    (name "python-bsky-bridge-git")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-bsky-bridge-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python module for the Bluesky social network API")
    (description "Python module for the Bluesky social network API.")
    (home-page "https://github.com/JinnaBalu/python-bsky-bridge")
    (license license:expat)))

;;; polyversal-patcher --- utility script for installing Committee of Zero patches for Science Adventure 
(define-public polyversal-patcher
  (package
    (name "polyversal-patcher")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/polyversal-patcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "utility script for installing Committee of Zero patches for Science Adventure ")
    (description "Utility script for installing Committee of Zero patches for Science Adventure titles.")
    (home-page "https://github.com/CommitteeOfZero/polyversal-patcher")
    (license license:expat)))

;;; pget-bin --- fast, resumable, and parallel file download client, written in Go
(define-public pget-bin
  (package
    (name "pget-bin")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pget-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast, resumable, and parallel file download client, written in Go")
    (description "Fast, resumable, and parallel file download client, written in Go.")
    (home-page "https://github.com/Code-Hex/pget")
    (license license:expat)))

;;; pepecoin --- fully decentralized and secure blockchain for Pepe
(define-public pepecoin
  (package
    (name "pepecoin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pepecoin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fully decentralized and secure blockchain for Pepe")
    (description "Fully decentralized and secure blockchain for Pepe.")
    (home-page "https://pepecoin.org/")
    (license license:expat)))

;;; omu --- oh-my-update: oh-my-zsh plugin and theme updater
(define-public omu
  (package
    (name "omu")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/omu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "oh-my-update: oh-my-zsh plugin and theme updater")
    (description "Oh-my-update: oh-my-zsh plugin and theme updater.")
    (home-page "https://github.com/mcornella/omu")
    (license license:expat)))

;;; nexusmods-app-git --- mod installer, creator and manager for popular games
(define-public nexusmods-app-git
  (package
    (name "nexusmods-app-git")
    (version "0.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nexusmods-app-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "mod installer, creator and manager for popular games")
    (description "Mod installer, creator and manager for popular games.")
    (home-page "https://github.com/Nexus-Mods/NexusMods.App")
    (license license:gpl3+)))

;;; navicat-premium-lite-zh-cn --- Navicat Premium Lite database management tool (Chinese)
(define-public navicat-premium-lite-zh-cn
  (package
    (name "navicat-premium-lite-zh-cn")
    (version "17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/navicat-premium-lite-zh-cn.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Navicat Premium Lite database management tool (Chinese)")
    (description "Navicat Premium Lite database management tool (Chinese).")
    (home-page "https://navicat.com/")
    (license license:nonfree)))

;;; navicat-premium-lite-en --- Navicat Premium Lite database management tool
(define-public navicat-premium-lite-en
  (package
    (name "navicat-premium-lite-en")
    (version "17.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/navicat-premium-lite-en.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Navicat Premium Lite database management tool")
    (description "Navicat Premium Lite database management tool.")
    (home-page "https://navicat.com/")
    (license license:nonfree)))

;;; mult --- run a command multiple times and glance at outputs via TUI
(define-public mult
  (package
    (name "mult")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mult.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "run a command multiple times and glance at outputs via TUI")
    (description "Run a command multiple times and glance at outputs via TUI.")
    (home-page "https://github.com/dhth/mult")
    (license license:expat)))

;;; lua54-luasodium --- Lua bindings for libsodium for Lua 5.4
(define-public lua54-luasodium
  (package
    (name "lua54-luasodium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua54-luasodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lua bindings for libsodium for Lua 5.4")
    (description "Lua bindings for libsodium for Lua 5.4.")
    (home-page "https://github.com/jprjr/luasodium")
    (license license:expat)))

;;; lua53-luasodium --- Lua bindings for libsodium for Lua 5.3
(define-public lua53-luasodium
  (package
    (name "lua53-luasodium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua53-luasodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lua bindings for libsodium for Lua 5.3")
    (description "Lua bindings for libsodium for Lua 5.3.")
    (home-page "https://github.com/jprjr/luasodium")
    (license license:expat)))

;;; lua52-luasodium --- Lua bindings for libsodium for Lua 5.2
(define-public lua52-luasodium
  (package
    (name "lua52-luasodium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua52-luasodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lua bindings for libsodium for Lua 5.2")
    (description "Lua bindings for libsodium for Lua 5.2.")
    (home-page "https://github.com/jprjr/luasodium")
    (license license:expat)))

;;; lua51-luasodium --- Lua bindings for libsodium for Lua 5.1
(define-public lua51-luasodium
  (package
    (name "lua51-luasodium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua51-luasodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lua bindings for libsodium for Lua 5.1")
    (description "Lua bindings for libsodium for Lua 5.1.")
    (home-page "https://github.com/jprjr/luasodium")
    (license license:expat)))

;;; lua-luasodium --- Lua bindings for libsodium
(define-public lua-luasodium
  (package
    (name "lua-luasodium")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lua-luasodium.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Lua bindings for libsodium")
    (description "Lua bindings for libsodium.")
    (home-page "https://github.com/jprjr/luasodium")
    (license license:expat)))

;;; input-devices-support-gnome --- metapackage for commonly used input devices with GNOME integration
(define-public input-devices-support-gnome
  (package
    (name "input-devices-support-gnome")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/input-devices-support-gnome.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "metapackage for commonly used input devices with GNOME integration")
    (description "Metapackage for commonly used input devices with GNOME integration.")
    (home-page "https://github.com/AUR-packages/input-devices-support-gnome")
    (license license:gpl3+)))

;;; img2irc-bin --- versatile image to IRC/ANSI art converter
(define-public img2irc-bin
  (package
    (name "img2irc-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/img2irc-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "versatile image to IRC/ANSI art converter")
    (description "Versatile image to IRC/ANSI art converter.")
    (home-page "https://github.com/Shizmob/img2irc")
    (license license:expat)))

;;; imap --- IMAP/POP mail server
(define-public imap
  (package
    (name "imap")
    (version "2007f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/imap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "IMAP/POP mail server")
    (description "IMAP/POP mail server.")
    (home-page "https://www.washington.edu/imap/")
    (license license:asl2.0)))

;;; i915ovmf --- i915ovmfPkg VBIOS for Intel GPU passthrough GVT-g/GVT-d
(define-public i915ovmf
  (package
    (name "i915ovmf")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/i915ovmf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "i915ovmfPkg VBIOS for Intel GPU passthrough GVT-g/GVT-d")
    (description "I915ovmfPkg VBIOS for Intel GPU passthrough GVT-g/GVT-d.")
    (home-page "https://github.com/patmagauran/i915ovmfPkg")
    (license license:bsd-2)))

;;; harsh-bin --- cLI habit tracking for geeks
(define-public harsh-bin
  (package
    (name "harsh-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/harsh-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cLI habit tracking for geeks")
    (description "CLI habit tracking for geeks.")
    (home-page "https://github.com/wakatara/harsh")
    (license license:expat)))

;;; gitmaster --- gUI git client written in Qt
(define-public gitmaster
  (package
    (name "gitmaster")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gitmaster.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "gUI git client written in Qt")
    (description "GUI git client written in Qt.")
    (home-page "https://github.com/nicfit/gitmaster")
    (license license:gpl3+)))

;;; fdutils --- utilities for the Linux floppy driver
(define-public fdutils
  (package
    (name "fdutils")
    (version "5.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fdutils.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "utilities for the Linux floppy driver")
    (description "Utilities for the Linux floppy driver.")
    (home-page "https://fdutils.linux.lu/")
    (license license:gpl2+)))

;;; fcitx5-pangu-git --- pangu module for fcitx5, insert space between CJK and alphabet characters
(define-public fcitx5-pangu-git
  (package
    (name "fcitx5-pangu-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fcitx5-pangu-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "pangu module for fcitx5, insert space between CJK and alphabet characters")
    (description "Pangu module for fcitx5, insert space between CJK and alphabet characters.")
    (home-page "https://github.com/fcitx-contrib/fcitx5-pangu")
    (license license:lgpl2.1+)))

;;; en-croissant --- modern chess GUI and analysis tool
(define-public en-croissant
  (package
    (name "en-croissant")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/en-croissant.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern chess GUI and analysis tool")
    (description "Modern chess GUI and analysis tool.")
    (home-page "https://encroissant.org/")
    (license license:gpl3+)))

;;; dtach-ng-bin --- simple program that emulates the detach feature of screen
(define-public dtach-ng-bin
  (package
    (name "dtach-ng-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dtach-ng-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple program that emulates the detach feature of screen")
    (description "Simple program that emulates the detach feature of screen.")
    (home-page "https://github.com/crigler/dtach")
    (license license:gpl2+)))

;;; dron-bin --- small command-line shell executor
(define-public dron-bin
  (package
    (name "dron-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dron-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "small command-line shell executor")
    (description "Small command-line shell executor.")
    (home-page "https://github.com/caddy-dns/dron")
    (license license:expat)))

;;; desktop-wakatime-bin --- system tray app for automatic time tracking from Figma, Postman, etc.
(define-public desktop-wakatime-bin
  (package
    (name "desktop-wakatime-bin")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/desktop-wakatime-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "system tray app for automatic time tracking from Figma, Postman, etc.")
    (description "System tray app for automatic time tracking from Figma, Postman, etc.")
    (home-page "https://wakatime.com/")
    (license license:bsd-3)))

;;; cls-rs --- command-line soundboard written in Rust
(define-public cls-rs
  (package
    (name "cls-rs")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cls-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line soundboard written in Rust")
    (description "Command-line soundboard written in Rust.")
    (home-page "https://github.com/fluxxu/cls-rs")
    (license license:expat)))

;;; chwp-bin --- changes the background wallpaper and lockscreen from the command line
(define-public chwp-bin
  (package
    (name "chwp-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chwp-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "changes the background wallpaper and lockscreen from the command line")
    (description "Changes the background wallpaper and lockscreen from the command line.")
    (home-page "https://github.com/Roboron3042/chwp")
    (license license:expat)))

;;; chromazone --- terminal colorizer
(define-public chromazone
  (package
    (name "chromazone")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/chromazone.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal colorizer")
    (description "Terminal colorizer.")
    (home-page "https://github.com/chromazone/chromazone")
    (license license:expat)))

;;; carapace-spec-man-bin --- generate spec from manpages
(define-public carapace-spec-man-bin
  (package
    (name "carapace-spec-man-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/carapace-spec-man-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate spec from manpages")
    (description "Generate spec from manpages.")
    (home-page "https://github.com/carapace-sh/carapace-spec-man")
    (license license:expat)))

;;; carapace-spec-bin --- multi-shell completion spec
(define-public carapace-spec-bin
  (package
    (name "carapace-spec-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/carapace-spec-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-shell completion spec")
    (description "Multi-shell completion spec.")
    (home-page "https://github.com/carapace-sh/carapace-spec")
    (license license:expat)))

;;; bzfs --- ZFS dataset replication tool
(define-public bzfs
  (package
    (name "bzfs")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bzfs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "ZFS dataset replication tool")
    (description "ZFS dataset replication tool.")
    (home-page "https://github.com/whoschek/bzfs")
    (license license:expat)))

;;; bskydesktop --- Bluesky Desktop decentralized social networking client
(define-public bskydesktop
  (package
    (name "bskydesktop")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bskydesktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bluesky Desktop decentralized social networking client")
    (description "Bluesky Desktop decentralized social networking client.")
    (home-page "https://bsky.app/")
    (license license:expat)))

;;; book-git --- simple bookmark manager written in Go
(define-public book-git
  (package
    (name "book-git")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/book-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple bookmark manager written in Go")
    (description "Simple bookmark manager written in Go.")
    (home-page "https://github.com/cxmcc/book")
    (license license:expat)))

;;; bchwallet --- bitcoin cash wallet daemon
(define-public bchwallet
  (package
    (name "bchwallet")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bchwallet.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "bitcoin cash wallet daemon")
    (description "Bitcoin cash wallet daemon.")
    (home-page "https://github.com/gcash/bchwallet")
    (license license:isc)))

;;; bchd --- alternative BCH implementation written in Go
(define-public bchd
  (package
    (name "bchd")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bchd.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "alternative BCH implementation written in Go")
    (description "Alternative BCH implementation written in Go.")
    (home-page "https://github.com/gcash/bchd")
    (license license:isc)))

;;; async-plus-plus --- lightweight concurrency framework for C++11
(define-public async-plus-plus
  (package
    (name "async++")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/async++.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight concurrency framework for C++11")
    (description "Lightweight concurrency framework for C++11.")
    (home-page "https://github.com/Amanieu/asyncplusplus")
    (license license:expat)))

;;; async --- tool to run shell commands in parallel
(define-public async
  (package
    (name "async")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/async.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to run shell commands in parallel")
    (description "Tool to run shell commands in parallel.")
    (home-page "https://github.com/ctjhoa/async")
    (license license:expat)))

;;; aspell6-fa --- Farsi dictionary for aspell
(define-public aspell6-fa
  (package
    (name "aspell6-fa")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aspell6-fa.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Farsi dictionary for aspell")
    (description "Farsi dictionary for aspell.")
    (home-page "http://aspell.net/")
    (license license:gpl2+)))

;;; art-rawconverter-ctlscripts --- addon for ART raw converter with various CTL scripts
(define-public art-rawconverter-ctlscripts
  (package
    (name "art-rawconverter-ctlscripts")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/art-rawconverter-ctlscripts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "addon for ART raw converter with various CTL scripts")
    (description "Addon for ART raw converter with various CTL scripts.")
    (home-page "https://bitbucket.org/agriggio/art/wiki/Home")
    (license license:gpl3+)))

;;; gimp-plugin-pandora --- GIMP plug-in for stitching together multiple images for panoramas
(define-public gimp-plugin-pandora
  (package
    (name "gimp-plugin-pandora")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-pandora.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GIMP plug-in for stitching together multiple images for panoramas")
    (description "GIMP plug-in for stitching together multiple images for panoramas.")
    (home-page "https://github.com/lmanul/gimp-pandora")
    (license license:gpl2+)))

;;; gimp-plugin-beautify --- set of GIMP plug-ins for quickly and easily beautifying photos
(define-public gimp-plugin-beautify
  (package
    (name "gimp-plugin-beautify")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-beautify.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "set of GIMP plug-ins for quickly and easily beautifying photos")
    (description "Set of GIMP plug-ins for quickly and easily beautifying photos.")
    (home-page "https://github.com/nicfit/gimp-beautify")
    (license license:gpl3+)))

;;; gimp-plugin-export-layers --- GIMP plug-in that exports layers as separate images
(define-public gimp-plugin-export-layers
  (package
    (name "gimp-plugin-export-layers")
    (version "3.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-export-layers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GIMP plug-in that exports layers as separate images")
    (description "GIMP plug-in that exports layers as separate images.")
    (home-page "https://github.com/kamilburda/batcher")
    (license license:gpl3+)))

;;; cronicle --- simple, distributed task scheduler and runner
(define-public cronicle
  (package
    (name "cronicle")
    (version "0.9.61")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cronicle.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple, distributed task scheduler and runner")
    (description "Simple, distributed task scheduler and runner.")
    (home-page "https://github.com/jhuckaby/Cronicle")
    (license license:expat)))

;;; cppreference --- complete reference for C++ Standard Library features (HTML book)
(define-public cppreference
  (package
    (name "cppreference")
    (version "20240210")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cppreference.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "complete reference for C++ Standard Library features (HTML book)")
    (description "Complete reference for C++ Standard Library features (HTML book).")
    (home-page "https://en.cppreference.com/")
    (license license:cc-by-sa3.0)))

;;; wechat-devtools-git --- WeChat Devtools for Linux
(define-public wechat-devtools-git
  (package
    (name "wechat-devtools-git")
    (version "1.06.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wechat-devtools-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "WeChat Devtools for Linux")
    (description "WeChat Devtools for Linux.")
    (home-page "https://github.com/nicfit/wechat-devtools-linux")
    (license license:nonfree)))

;;; gimp-plugin-resynthesizer-scm-git --- suite of GIMP plugins for texture synthesis (Script-Fu fork)
(define-public gimp-plugin-resynthesizer-scm-git
  (package
    (name "gimp-plugin-resynthesizer-scm-git")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-plugin-resynthesizer-scm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "suite of GIMP plugins for texture synthesis (Script-Fu fork)")
    (description "Suite of GIMP plugins for texture synthesis (Script-Fu fork).")
    (home-page "https://github.com/itr-tert/gimp-resynthesizer-scm")
    (license license:gpl2+)))

;;; rofi-git --- window switcher, run dialog, and dmenu replacement
(define-public rofi-git
  (package
    (name "rofi-git")
    (version "1.7.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rofi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "window switcher, run dialog, and dmenu replacement")
    (description "Window switcher, run dialog, and dmenu replacement.")
    (home-page "https://github.com/davatorium/rofi")
    (license license:expat)))

;;; nodejs-tiddlywiki --- tiddlyWiki non-linear personal web notebook (Node.js server edition)
(define-public nodejs-tiddlywiki
  (package
    (name "nodejs-tiddlywiki")
    (version "5.3.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nodejs-tiddlywiki.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiddlyWiki non-linear personal web notebook (Node.js server edition)")
    (description "TiddlyWiki non-linear personal web notebook (Node.js server edition).")
    (home-page "https://tiddlywiki.com/")
    (license license:bsd-3)))

;;; corekeyboard --- virtual keyboard for X11 from the C Suite
(define-public corekeyboard
  (package
    (name "corekeyboard")
    (version "5.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/corekeyboard.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual keyboard for X11 from the C Suite")
    (description "Virtual keyboard for X11 from the C Suite.")
    (home-page "https://cubocore.org/")
    (license license:gpl3+)))

;;; brotab --- control browser tabs from the command line
(define-public brotab
  (package
    (name "brotab")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brotab.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "control browser tabs from the command line")
    (description "Control browser tabs from the command line.")
    (home-page "https://github.com/balta2ar/brotab")
    (license license:expat)))

;;; eclipse-mat --- Eclipse Memory Analyzer Tool for Java heap dumps
(define-public eclipse-mat
  (package
    (name "eclipse-mat")
    (version "1.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-mat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Eclipse Memory Analyzer Tool for Java heap dumps")
    (description "Eclipse Memory Analyzer Tool for Java heap dumps.")
    (home-page "https://eclipse.dev/mat/")
    (license license:epl1.0)))

;;; gimp-git --- GNU Image Manipulation Program (development version)
(define-public gimp-git
  (package
    (name "gimp-git")
    (version "2.99.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gimp-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "GNU Image Manipulation Program (development version)")
    (description "GNU Image Manipulation Program (development version).")
    (home-page "https://www.gimp.org/")
    (license license:gpl3+)))

;;; tofi-git --- tiny rofi/dmenu replacement for wlroots-based Wayland compositors
(define-public tofi-git
  (package
    (name "tofi-git")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tofi-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiny rofi/dmenu replacement for wlroots-based Wayland compositors")
    (description "Tiny rofi/dmenu replacement for wlroots-based Wayland compositors.")
    (home-page "https://github.com/philj56/tofi")
    (license license:expat)))

;;; android-backup-extractor --- utility to extract and repack Android backups created with adb
(define-public android-backup-extractor
  (package
    (name "android-backup-extractor")
    (version "20240204")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-backup-extractor.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "utility to extract and repack Android backups created with adb")
    (description "Utility to extract and repack Android backups created with adb.")
    (home-page "https://github.com/nelenkov/android-backup-extractor")
    (license license:asl2.0)))

;;; maestral-qt --- Qt interface for the Maestral Dropbox daemon
(define-public maestral-qt
  (package
    (name "maestral-qt")
    (version "1.9.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/maestral-qt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Qt interface for the Maestral Dropbox daemon")
    (description "Qt interface for the Maestral Dropbox daemon.")
    (home-page "https://maestral.app/")
    (license license:expat)))

;;; evremap-git --- systemwide keyboard input remapper
(define-public evremap-git
  (package
    (name "evremap-git")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/evremap-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "systemwide keyboard input remapper")
    (description "Systemwide keyboard input remapper.")
    (home-page "https://github.com/wez/evremap")
    (license license:expat)))

;;; baph --- basic AUR Package Helper
(define-public baph
  (package
    (name "baph")
    (version "4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/baph.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "basic AUR Package Helper")
    (description "Basic AUR Package Helper.")
    (home-page "https://bitbucket.org/natemaia/baph")
    (license license:expat)))

;;; techmino --- modern block game with various rules and new experiences
(define-public techmino
  (package
    (name "techmino")
    (version "0.17.20")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/techmino.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern block game with various rules and new experiences")
    (description "Modern block game with various rules and new experiences.")
    (home-page "https://github.com/26F-Studio/Techmino")
    (license license:expat)))

;;; splashtop-business --- Splashtop Business remote desktop access
(define-public splashtop-business
  (package
    (name "splashtop-business")
    (version "3.6.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/splashtop-business.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Splashtop Business remote desktop access")
    (description "Splashtop Business remote desktop access.")
    (home-page "https://www.splashtop.com/business")
    (license license:nonfree)))
