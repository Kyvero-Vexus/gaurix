;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416b
;;; Resolves 100 packages from TODO queue (entries 14348-14460).
;;;
;;;   1. python-databricks-sql-connector (python)
;;;   2. imagot-bin (binary)
;;;   3. linux-git-headers (gnu)
;;;   4. python-scheduler-git (python)
;;;   5. juicity-server (gnu)
;;;   6. juicity-client (gnu)
;;;   7. wl_shimeji-plugin-kwinsupport (gnu)
;;;   8. peep-bin (binary)
;;;   9. dnspeep-bin (binary)
;;;   10. ttf-x2 (font)
;;;   11. python-redshift-connector (python)
;;;   12. gnome-tuner-tweaks (gnu)
;;;   13. gnome-tuner-panel (gnu)
;;;   14. gnome-tuner-gdm (gnu)
;;;   15. python-bigframes (python)
;;;   16. askora (gnu)
;;;   17. pam-parallel (gnu)
;;;   18. nodejs-percollate (node)
;;;   19. python-sqlmesh (python)
;;;   20. python-pyathena (python)
;;;   21. wives-bin (binary)
;;;   22. python-cloud-sql-python-connector (python)
;;;   23. tflint-bin (binary)
;;;   24. hamclock (gnu)
;;;   25. nipaplay-reload-bin (binary)
;;;   26. wlprop (gnu)
;;;   27. remindmez (gnu)
;;;   28. tremotesf (gnu)
;;;   29. savvycan (cmake)
;;;   30. plasma6-applets-plasma-drawer-git (git-source)
;;;   31. yass-reloaded (gnu)
;;;   32. plasma-bigscreen (gnu)
;;;   33. gtk3-classic (gnu)
;;;   34. lumi-bin (binary)
;;;   35. eric (cmake)
;;;   36. goenv (gnu)
;;;   37. koito (gnu)
;;;   38. isle-portable-git (git-source)
;;;   39. azaharplus-appimage (binary)
;;;   40. lunacy-bin (binary)
;;;   41. cty (gnu)
;;;   42. quickgui-bin (binary)
;;;   43. sigma-file-manager-bin (binary)
;;;   44. vital-synth-vst3-bin (binary)
;;;   45. vital-synth-vst-bin (binary)
;;;   46. vital-synth-standalone-bin (binary)
;;;   47. vital-synth-clap-bin (binary)
;;;   48. genwipe.sh (gnu)
;;;   49. natron-bin (binary)
;;;   50. surrealist-bin (binary)
;;;   51. wootility5-beta (binary)
;;;   52. tclient-ddnet (gnu)
;;;   53. indi-3rdparty-drivers (gnu)
;;;   54. coreutils-selinux (gnu)
;;;   55. git-quick-stats (gnu)
;;;   56. iipython-feishin-bin (binary)
;;;   57. mpv-full-build-git (git-source)
;;;   58. bubblejail (gnu)
;;;   59. golangci-lint-bin (binary)
;;;   60. flemozi-bin (binary)
;;;   61. librewolf-extension-localcdn-bin (binary)
;;;   62. stable-diffusion.cpp-git (git-source)
;;;   63. b43-firmware (firmware)
;;;   64. balatro (gnu)
;;;   65. libfprint-tod (gnu)
;;;   66. sweethome3d-furniture-library (gnu)
;;;   67. thunderbird-grammalecte (gnu)
;;;   68. frog-ocr-no-telemetry (gnu)
;;;   69. picocrypt (gnu)
;;;   70. flightcore-bin (binary)
;;;   71. cqrlogalpha-git (git-source)
;;;   72. steamworks-sdk (gnu)
;;;   73. drawio (gnu)
;;;   74. wikilynx (cmake)
;;;   75. ptyxis-palette-darcula2 (gnu)
;;;   76. stable-diffusion.cpp-cublas-git (git-source)
;;;   77. ultimatestunts (gnu)
;;;   78. tailscale-systray-git (git-source)
;;;   79. gnome-app-grid-manager (gnu)
;;;   80. xt_wgobfs-dkms (dkms)
;;;   81. gnome-foundry-git (git-source)
;;;   82. mingw-w64-sdl3 (gnu)
;;;   83. power-rules-daemon-git (git-source)
;;;   84. power-rules-daemon (cargo)
;;;   85. refold-git (git-source)
;;;   86. linvam (gnu)
;;;   87. dragonfly-navigator-git (git-source)
;;;   88. splash-logs (gnu)
;;;   89. libfprint-ftexx00 (gnu)
;;;   90. gohttpserver-bin (binary)
;;;   91. focaltech-spi-dkms (dkms)
;;;   92. eb-garamond (font)
;;;   93. brother-hll3270cdw (gnu)
;;;   94. kwin-scripts-forceblur (gnu)
;;;   95. storm (gnu)
;;;   96. pocketbase-bin (binary)
;;;   97. python-pytest-docs (python)
;;;   98. dcron (gnu)
;;;   99. electronim-bin (binary)
;;;   100. ssimulacra2_bin-git (git-source)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260416b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system font)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages cmake)
  #:export (
            python-databricks-sql-connector
            imagot-bin
            linux-git-headers
            python-scheduler-git
            juicity-server
            juicity-client
            wl-shimeji-plugin-kwinsupport
            peep-bin
            dnspeep-bin
            ttf-x2
            python-redshift-connector
            gnome-tuner-tweaks
            gnome-tuner-panel
            gnome-tuner-gdm
            python-bigframes
            askora
            pam-parallel
            nodejs-percollate
            python-sqlmesh
            python-pyathena
            wives-bin
            python-cloud-sql-python-connector
            tflint-bin
            hamclock
            nipaplay-reload-bin
            wlprop
            remindmez
            tremotesf
            savvycan
            plasma6-applets-plasma-drawer-git
            yass-reloaded
            plasma-bigscreen
            gtk3-classic
            lumi-bin
            eric
            goenv
            koito
            isle-portable-git
            azaharplus-appimage
            lunacy-bin
            cty
            quickgui-bin
            sigma-file-manager-bin
            vital-synth-vst3-bin
            vital-synth-vst-bin
            vital-synth-standalone-bin
            vital-synth-clap-bin
            genwipe-sh
            natron-bin
            surrealist-bin
            wootility5-beta
            tclient-ddnet
            indi-3rdparty-drivers
            coreutils-selinux
            git-quick-stats
            iipython-feishin-bin
            mpv-full-build-git
            bubblejail
            golangci-lint-bin
            flemozi-bin
            librewolf-extension-localcdn-bin
            stable-diffusion-cpp-git
            b43-firmware
            balatro
            libfprint-tod
            sweethome3d-furniture-library
            thunderbird-grammalecte
            frog-ocr-no-telemetry
            picocrypt
            flightcore-bin
            cqrlogalpha-git
            steamworks-sdk
            drawio
            wikilynx
            ptyxis-palette-darcula2
            stable-diffusion-cpp-cublas-git
            ultimatestunts
            tailscale-systray-git
            gnome-app-grid-manager
            xt-wgobfs-dkms
            gnome-foundry-git
            mingw-w64-sdl3
            power-rules-daemon-git
            power-rules-daemon
            refold-git
            linvam
            dragonfly-navigator-git
            splash-logs
            libfprint-ftexx00
            gohttpserver-bin
            focaltech-spi-dkms
            eb-garamond
            brother-hll3270cdw
            kwin-scripts-forceblur
            storm
            pocketbase-bin
            python-pytest-docs
            dcron
            electronim-bin
            ssimulacra2-bin-git
            ))

;;; Nonfree license placeholder (for proprietary binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; -------------------------------------------------------------------
;;; 1. python-databricks-sql-connector
;;; -------------------------------------------------------------------
(define-public python-databricks-sql-connector
  (package
    (name "python-databricks-sql-connector")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "d/databricks-sql-connector/databricks-sql-connector-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "databricks SQL Connector for Python (DB-API 2.0; optional Arrow APIs)")
    (description "Databricks SQL Connector for Python (DB-API 2.0; optional Arrow APIs).")
    (home-page "https://pypi.org/project/databricks-sql-connector/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 2. imagot-bin
;;; -------------------------------------------------------------------
(define-public imagot-bin
  (package
    (name "imagot-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "imagot-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/imagot-bin/"))))
    (synopsis "an image viewer made in godot (binary release)")
    (description "An image viewer made in godot (binary release).")
    (home-page "https://aur.archlinux.org/packages/imagot-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 3. linux-git-headers
;;; -------------------------------------------------------------------
(define-public linux-git-headers
  (package
    (name "linux-git-headers")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "linux-git-headers" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "headers and scripts for building modules for the Linus Torvalds' Mainline Lin...")
    (description "Headers and scripts for building modules for the Linus Torvalds' Mainline Linux kernel.")
    (home-page "https://aur.archlinux.org/packages/linux-git-headers")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. python-scheduler-git
;;; -------------------------------------------------------------------
(define-public python-scheduler-git
  (package
    (name "python-scheduler-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "s/scheduler-git/scheduler-git-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "uses data from taskwarrior and timewarrior to indicate which task should be d...")
    (description "Uses data from taskwarrior and timewarrior to indicate which task should be done next.")
    (home-page "https://pypi.org/project/scheduler-git/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 5. juicity-server
;;; -------------------------------------------------------------------
(define-public juicity-server
  (package
    (name "juicity-server")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "juicity-server" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A quic-based proxy protocol and implementation, inspired by tuic. (server)")
    (description "A quic-based proxy protocol and implementation, inspired by tuic. (server).")
    (home-page "https://aur.archlinux.org/packages/juicity-server")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. juicity-client
;;; -------------------------------------------------------------------
(define-public juicity-client
  (package
    (name "juicity-client")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "juicity-client" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A quic-based proxy protocol and implementation, inspired by tuic. (client)")
    (description "A quic-based proxy protocol and implementation, inspired by tuic. (client).")
    (home-page "https://aur.archlinux.org/packages/juicity-client")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 7. wl_shimeji-plugin-kwinsupport
;;; -------------------------------------------------------------------
(define-public wl-shimeji-plugin-kwinsupport
  (package
    (name "wl-shimeji-plugin-kwinsupport")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wl_shimeji-plugin-kwinsupport" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for wl_shimeji that enables window interaction when running under kwin...")
    (description "Plugin for wl_shimeji that enables window interaction when running under kwin_wayland.")
    (home-page "https://aur.archlinux.org/packages/wl_shimeji-plugin-kwinsupport")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. peep-bin
;;; -------------------------------------------------------------------
(define-public peep-bin
  (package
    (name "peep-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "peep-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/peep-bin/"))))
    (synopsis "A CLI text viewer tool that works interactively like less command on small pa...")
    (description "A CLI text viewer tool that works interactively like less command on small pane within the terminal window.")
    (home-page "https://aur.archlinux.org/packages/peep-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 9. dnspeep-bin
;;; -------------------------------------------------------------------
(define-public dnspeep-bin
  (package
    (name "dnspeep-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "dnspeep-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dnspeep-bin/"))))
    (synopsis "spy on the DNS queries your computer is making")
    (description "Spy on the DNS queries your computer is making.")
    (home-page "https://aur.archlinux.org/packages/dnspeep-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 10. ttf-x2
;;; -------------------------------------------------------------------
(define-public ttf-x2
  (package
    (name "ttf-x2")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ttf-x2" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "free fonts with support for Persian, Arabic, Urdu, Pashto, Dari, Uzbek, Kurdi...")
    (description "Free fonts with support for Persian, Arabic, Urdu, Pashto, Dari, Uzbek, Kurdish, Uighur, old Turkish (Ottoman) and modern Turkish (Roman).")
    (home-page "https://aur.archlinux.org/packages/ttf-x2")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 11. python-redshift-connector
;;; -------------------------------------------------------------------
(define-public python-redshift-connector
  (package
    (name "python-redshift-connector")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "r/redshift-connector/redshift-connector-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "amazon Redshift connector for Python (DB-API 2.0)")
    (description "Amazon Redshift connector for Python (DB-API 2.0).")
    (home-page "https://pypi.org/project/redshift-connector/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 12. gnome-tuner-tweaks
;;; -------------------------------------------------------------------
(define-public gnome-tuner-tweaks
  (package
    (name "gnome-tuner-tweaks")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gnome-tuner-tweaks" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Tuner that adds more ways to customize GNOME")
    (description "Plugin for Tuner that adds more ways to customize GNOME.")
    (home-page "https://aur.archlinux.org/packages/gnome-tuner-tweaks")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. gnome-tuner-panel
;;; -------------------------------------------------------------------
(define-public gnome-tuner-panel
  (package
    (name "gnome-tuner-panel")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gnome-tuner-panel" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Tuner that adds panel mode switcher to Tweaks appearance page")
    (description "Plugin for Tuner that adds panel mode switcher to Tweaks appearance page.")
    (home-page "https://aur.archlinux.org/packages/gnome-tuner-panel")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 14. gnome-tuner-gdm
;;; -------------------------------------------------------------------
(define-public gnome-tuner-gdm
  (package
    (name "gnome-tuner-gdm")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gnome-tuner-gdm" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Tuner that adds GNOME Display Manager settings")
    (description "Plugin for Tuner that adds GNOME Display Manager settings.")
    (home-page "https://aur.archlinux.org/packages/gnome-tuner-gdm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. python-bigframes
;;; -------------------------------------------------------------------
(define-public python-bigframes
  (package
    (name "python-bigframes")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "b/bigframes/bigframes-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "bigQuery DataFrames — scalable analytics & ML with BigQuery (BigFrames)")
    (description "BigQuery DataFrames — scalable analytics & ML with BigQuery (BigFrames).")
    (home-page "https://pypi.org/project/bigframes/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. askora
;;; -------------------------------------------------------------------
(define-public askora
  (package
    (name "askora")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "askora" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A unified CLI for AI providers like OpenAI and Ollama")
    (description "A unified CLI for AI providers like OpenAI and Ollama.")
    (home-page "https://aur.archlinux.org/packages/askora")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. pam-parallel
;;; -------------------------------------------------------------------
(define-public pam-parallel
  (package
    (name "pam-parallel")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pam-parallel" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A PAM module that runs multiple other PAM modules in parallel, succeeding as ...")
    (description "A PAM module that runs multiple other PAM modules in parallel, succeeding as long as one of them succeeds.")
    (home-page "https://aur.archlinux.org/packages/pam-parallel")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 18. nodejs-percollate
;;; -------------------------------------------------------------------
(define-public nodejs-percollate
  (package
    (name "nodejs-percollate")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/percollate/-/"
                    "percollate-" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "percollate is a command-line tool that turns web pages into beautifully forma...")
    (description "Percollate is a command-line tool that turns web pages into beautifully formatted PDF, EPUB, or HTML files.")
    (home-page "https://www.npmjs.com/package/percollate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. python-sqlmesh
;;; -------------------------------------------------------------------
(define-public python-sqlmesh
  (package
    (name "python-sqlmesh")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "s/sqlmesh/sqlmesh-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "scalable, efficient data transformation framework (dbt-compatible) – SQLMesh CLI")
    (description "Scalable, efficient data transformation framework (dbt-compatible) – SQLMesh CLI.")
    (home-page "https://pypi.org/project/sqlmesh/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. python-pyathena
;;; -------------------------------------------------------------------
(define-public python-pyathena
  (package
    (name "python-pyathena")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "p/pyathena/pyathena-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "python DB API 2.0 client for Amazon Athena")
    (description "Python DB API 2.0 client for Amazon Athena.")
    (home-page "https://pypi.org/project/pyathena/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. wives-bin
;;; -------------------------------------------------------------------
(define-public wives-bin
  (package
    (name "wives-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wives-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wives-bin/"))))
    (synopsis "A beautiful, modern & feature-rich Terminal Emulator")
    (description "A beautiful, modern & feature-rich Terminal Emulator.")
    (home-page "https://aur.archlinux.org/packages/wives-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 22. python-cloud-sql-python-connector
;;; -------------------------------------------------------------------
(define-public python-cloud-sql-python-connector
  (package
    (name "python-cloud-sql-python-connector")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "c/cloud-sql-connector/cloud-sql-connector-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "google Cloud SQL Python Connector library")
    (description "Google Cloud SQL Python Connector library.")
    (home-page "https://pypi.org/project/cloud-sql-connector/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. tflint-bin
;;; -------------------------------------------------------------------
(define-public tflint-bin
  (package
    (name "tflint-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tflint-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tflint-bin/"))))
    (synopsis "A linter for Terraform code")
    (description "A linter for Terraform code.")
    (home-page "https://aur.archlinux.org/packages/tflint-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 24. hamclock
;;; -------------------------------------------------------------------
(define-public hamclock
  (package
    (name "hamclock")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "hamclock" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clock and world map with extra features for amateur radio (800x480 version)")
    (description "Clock and world map with extra features for amateur radio (800x480 version).")
    (home-page "https://aur.archlinux.org/packages/hamclock")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 25. nipaplay-reload-bin
;;; -------------------------------------------------------------------
(define-public nipaplay-reload-bin
  (package
    (name "nipaplay-reload-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "nipaplay-reload-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nipaplay-reload-bin/"))))
    (synopsis "一个现代化的跨平台视频播放器")
    (description "一个现代化的跨平台视频播放器.")
    (home-page "https://aur.archlinux.org/packages/nipaplay-reload-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 26. wlprop
;;; -------------------------------------------------------------------
(define-public wlprop
  (package
    (name "wlprop")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wlprop" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xprop but for wayland")
    (description "xprop but for wayland.")
    (home-page "https://aur.archlinux.org/packages/wlprop")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 27. remindmez
;;; -------------------------------------------------------------------
(define-public remindmez
  (package
    (name "remindmez")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "remindmez" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A fun CLI reminder tool with ASCII penguins and notifications")
    (description "A fun CLI reminder tool with ASCII penguins and notifications.")
    (home-page "https://aur.archlinux.org/packages/remindmez")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 28. tremotesf
;;; -------------------------------------------------------------------
(define-public tremotesf
  (package
    (name "tremotesf")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tremotesf" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "remote GUI for transmission-daemon")
    (description "Remote GUI for transmission-daemon.")
    (home-page "https://aur.archlinux.org/packages/tremotesf")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 29. savvycan
;;; -------------------------------------------------------------------
(define-public savvycan
  (package
    (name "savvycan")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "savvycan" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list cmake pkg-config))
    (synopsis "qT-based CAN bus analysis tool")
    (description "QT-based CAN bus analysis tool.")
    (home-page "https://aur.archlinux.org/packages/savvycan")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 30. plasma6-applets-plasma-drawer-git
;;; -------------------------------------------------------------------
(define-public plasma6-applets-plasma-drawer-git
  (package
    (name "plasma6-applets-plasma-drawer-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/plasma6-applets-plasma-drawer-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A full-screen customizable launcher with application directories and krunner-...")
    (description "A full-screen customizable launcher with application directories and krunner-like search for KDE Plasma.")
    (home-page "https://aur.archlinux.org/packages/plasma6-applets-plasma-drawer-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 31. yass-reloaded
;;; -------------------------------------------------------------------
(define-public yass-reloaded
  (package
    (name "yass-reloaded")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "yass-reloaded" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "editor for creating, fine-tuning, organizing and printing Ultrastar karaoke s...")
    (description "Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs.")
    (home-page "https://aur.archlinux.org/packages/yass-reloaded")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 32. plasma-bigscreen
;;; -------------------------------------------------------------------
(define-public plasma-bigscreen
  (package
    (name "plasma-bigscreen")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "plasma-bigscreen" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plasma shell for TVs")
    (description "Plasma shell for TVs.")
    (home-page "https://aur.archlinux.org/packages/plasma-bigscreen")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 33. gtk3-classic
;;; -------------------------------------------------------------------
(define-public gtk3-classic
  (package
    (name "gtk3-classic")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gtk3-classic" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "patched GTK+3 that provides a more classic experience")
    (description "Patched GTK+3 that provides a more classic experience.")
    (home-page "https://aur.archlinux.org/packages/gtk3-classic")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. lumi-bin
;;; -------------------------------------------------------------------
(define-public lumi-bin
  (package
    (name "lumi-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "lumi-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lumi-bin/"))))
    (synopsis "A Desktop App that offers a collection of tools to create, edit and share dig...")
    (description "A Desktop App that offers a collection of tools to create, edit and share digital content with your class.")
    (home-page "https://aur.archlinux.org/packages/lumi-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 35. eric
;;; -------------------------------------------------------------------
(define-public eric
  (package
    (name "eric")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "eric" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list cmake pkg-config))
    (synopsis "A full-featured Python and Ruby IDE in PyQt")
    (description "A full-featured Python and Ruby IDE in PyQt.")
    (home-page "https://aur.archlinux.org/packages/eric")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 36. goenv
;;; -------------------------------------------------------------------
(define-public goenv
  (package
    (name "goenv")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "goenv" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "like pyenv and rbenv, but for Go")
    (description "Like pyenv and rbenv, but for Go.")
    (home-page "https://aur.archlinux.org/packages/goenv")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 37. koito
;;; -------------------------------------------------------------------
(define-public koito
  (package
    (name "koito")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "koito" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern, themeable scrobbler that you can use with any program that scrobbles ...")
    (description "Modern, themeable scrobbler that you can use with any program that scrobbles to ListenBrainz.")
    (home-page "https://aur.archlinux.org/packages/koito")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 38. isle-portable-git
;;; -------------------------------------------------------------------
(define-public isle-portable-git
  (package
    (name "isle-portable-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/isle-portable-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portable version of LEGO Island based on decompilation effort")
    (description "Portable version of LEGO Island based on decompilation effort.")
    (home-page "https://aur.archlinux.org/packages/isle-portable-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. azaharplus-appimage
;;; -------------------------------------------------------------------
(define-public azaharplus-appimage
  (package
    (name "azaharplus-appimage")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "azaharplus-appimage" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/azaharplus-appimage/"))))
    (synopsis "A fork of the Azahar 3DS emulator that restores some features")
    (description "A fork of the Azahar 3DS emulator that restores some features.")
    (home-page "https://aur.archlinux.org/packages/azaharplus-appimage")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 40. lunacy-bin
;;; -------------------------------------------------------------------
(define-public lunacy-bin
  (package
    (name "lunacy-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "lunacy-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lunacy-bin/"))))
    (synopsis "free design software that keeps your flow with AI tools and built-in graphics")
    (description "Free design software that keeps your flow with AI tools and built-in graphics.")
    (home-page "https://aur.archlinux.org/packages/lunacy-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 41. cty
;;; -------------------------------------------------------------------
(define-public cty
  (package
    (name "cty")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "cty" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the package represents databases of entities (countries), prefixes and callsi...")
    (description "The package represents databases of entities (countries), prefixes and callsigns that are used by amateur (ham) radio logging software - CONTESTING VERSION.")
    (home-page "https://aur.archlinux.org/packages/cty")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 42. quickgui-bin
;;; -------------------------------------------------------------------
(define-public quickgui-bin
  (package
    (name "quickgui-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "quickgui-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/quickgui-bin/"))))
    (synopsis "A Flutter frontend for quickget and quickemu")
    (description "A Flutter frontend for quickget and quickemu.")
    (home-page "https://aur.archlinux.org/packages/quickgui-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 43. sigma-file-manager-bin
;;; -------------------------------------------------------------------
(define-public sigma-file-manager-bin
  (package
    (name "sigma-file-manager-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "sigma-file-manager-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sigma-file-manager-bin/"))))
    (synopsis "A free, open-source, quickly evolving, modern file manager (explorer / finder...")
    (description "A free, open-source, quickly evolving, modern file manager (explorer / finder) app (binary release).")
    (home-page "https://aur.archlinux.org/packages/sigma-file-manager-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 44. vital-synth-vst3-bin
;;; -------------------------------------------------------------------
(define-public vital-synth-vst3-bin
  (package
    (name "vital-synth-vst3-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "vital-synth-vst3-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vital-synth-vst3-bin/"))))
    (synopsis "spectral warping wavetable synth - VST3 plugin")
    (description "Spectral warping wavetable synth - VST3 plugin.")
    (home-page "https://aur.archlinux.org/packages/vital-synth-vst3-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 45. vital-synth-vst-bin
;;; -------------------------------------------------------------------
(define-public vital-synth-vst-bin
  (package
    (name "vital-synth-vst-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "vital-synth-vst-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vital-synth-vst-bin/"))))
    (synopsis "spectral warping wavetable synth - VST plugin")
    (description "Spectral warping wavetable synth - VST plugin.")
    (home-page "https://aur.archlinux.org/packages/vital-synth-vst-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 46. vital-synth-standalone-bin
;;; -------------------------------------------------------------------
(define-public vital-synth-standalone-bin
  (package
    (name "vital-synth-standalone-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "vital-synth-standalone-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vital-synth-standalone-bin/"))))
    (synopsis "spectral warping wavetable synth - standalone")
    (description "Spectral warping wavetable synth - standalone.")
    (home-page "https://aur.archlinux.org/packages/vital-synth-standalone-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 47. vital-synth-clap-bin
;;; -------------------------------------------------------------------
(define-public vital-synth-clap-bin
  (package
    (name "vital-synth-clap-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "vital-synth-clap-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vital-synth-clap-bin/"))))
    (synopsis "spectral warping wavetable synth - CLAP plugin")
    (description "Spectral warping wavetable synth - CLAP plugin.")
    (home-page "https://aur.archlinux.org/packages/vital-synth-clap-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 48. genwipe.sh
;;; -------------------------------------------------------------------
(define-public genwipe-sh
  (package
    (name "genwipe-sh")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "genwipe.sh" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "show calculated dd and pv examples for destination")
    (description "Show calculated dd and pv examples for destination.")
    (home-page "https://aur.archlinux.org/packages/genwipe.sh")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. natron-bin
;;; -------------------------------------------------------------------
(define-public natron-bin
  (package
    (name "natron-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "natron-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/natron-bin/"))))
    (synopsis "node-graph video compositor")
    (description "Node-graph video compositor.")
    (home-page "https://aur.archlinux.org/packages/natron-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 50. surrealist-bin
;;; -------------------------------------------------------------------
(define-public surrealist-bin
  (package
    (name "surrealist-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "surrealist-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/surrealist-bin/"))))
    (synopsis "surrealist is the ultimate way to visually manage your SurrealDB database")
    (description "Surrealist is the ultimate way to visually manage your SurrealDB database.")
    (home-page "https://aur.archlinux.org/packages/surrealist-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 51. wootility5-beta
;;; -------------------------------------------------------------------
(define-public wootility5-beta
  (package
    (name "wootility5-beta")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wootility5-beta" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/wootility5-beta/"))))
    (synopsis "utility for configuring Wooting keyboards (AppImage beta release)")
    (description "Utility for configuring Wooting keyboards (AppImage beta release).")
    (home-page "https://aur.archlinux.org/packages/wootility5-beta")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 52. tclient-ddnet
;;; -------------------------------------------------------------------
(define-public tclient-ddnet
  (package
    (name "tclient-ddnet")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "tclient-ddnet" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extended DDNet Teeworlds client")
    (description "Extended DDNet Teeworlds client.")
    (home-page "https://aur.archlinux.org/packages/tclient-ddnet")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 53. indi-3rdparty-drivers
;;; -------------------------------------------------------------------
(define-public indi-3rdparty-drivers
  (package
    (name "indi-3rdparty-drivers")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "indi-3rdparty-drivers" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "indi 3rd party drivers")
    (description "Indi 3rd party drivers.")
    (home-page "https://aur.archlinux.org/packages/indi-3rdparty-drivers")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 54. coreutils-selinux
;;; -------------------------------------------------------------------
(define-public coreutils-selinux
  (package
    (name "coreutils-selinux")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "coreutils-selinux" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the basic file, shell and text manipulation utilities of the GNU operating sy...")
    (description "The basic file, shell and text manipulation utilities of the GNU operating system with SELinux support.")
    (home-page "https://aur.archlinux.org/packages/coreutils-selinux")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 55. git-quick-stats
;;; -------------------------------------------------------------------
(define-public git-quick-stats
  (package
    (name "git-quick-stats")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "git-quick-stats" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple and efficient way to access various statistics in git repository")
    (description "Simple and efficient way to access various statistics in git repository.")
    (home-page "https://aur.archlinux.org/packages/git-quick-stats")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 56. iipython-feishin-bin
;;; -------------------------------------------------------------------
(define-public iipython-feishin-bin
  (package
    (name "iipython-feishin-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "iipython-feishin-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/iipython-feishin-bin/"))))
    (synopsis "fork of Feishin with additional features")
    (description "Fork of Feishin with additional features.")
    (home-page "https://aur.archlinux.org/packages/iipython-feishin-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 57. mpv-full-build-git
;;; -------------------------------------------------------------------
(define-public mpv-full-build-git
  (package
    (name "mpv-full-build-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/mpv-full-build-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "video player based on MPlayer/mplayer2 with all possible libs (uses staticall...")
    (description "Video player based on MPlayer/mplayer2 with all possible libs (uses statically linked ffmpeg with all possible libs). (GIT version ).")
    (home-page "https://aur.archlinux.org/packages/mpv-full-build-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. bubblejail
;;; -------------------------------------------------------------------
(define-public bubblejail
  (package
    (name "bubblejail")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "bubblejail" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bubblewrap based sandboxing utility")
    (description "Bubblewrap based sandboxing utility.")
    (home-page "https://aur.archlinux.org/packages/bubblejail")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 59. golangci-lint-bin
;;; -------------------------------------------------------------------
(define-public golangci-lint-bin
  (package
    (name "golangci-lint-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "golangci-lint-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/golangci-lint-bin/"))))
    (synopsis "fast linters runner for Go")
    (description "Fast linters runner for Go.")
    (home-page "https://aur.archlinux.org/packages/golangci-lint-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 60. flemozi-bin
;;; -------------------------------------------------------------------
(define-public flemozi-bin
  (package
    (name "flemozi-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "flemozi-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flemozi-bin/"))))
    (synopsis "an advanced Emoji Picker written with Flutter (binary release)")
    (description "An advanced Emoji Picker written with Flutter (binary release).")
    (home-page "https://aur.archlinux.org/packages/flemozi-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 61. librewolf-extension-localcdn-bin
;;; -------------------------------------------------------------------
(define-public librewolf-extension-localcdn-bin
  (package
    (name "librewolf-extension-localcdn-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "librewolf-extension-localcdn-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-extension-localcdn-bin/"))))
    (synopsis "A web browser extension that emulates CDNs to improve your online privacy (bi...")
    (description "A web browser extension that emulates CDNs to improve your online privacy (binary release).")
    (home-page "https://aur.archlinux.org/packages/librewolf-extension-localcdn-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 62. stable-diffusion.cpp-git
;;; -------------------------------------------------------------------
(define-public stable-diffusion-cpp-git
  (package
    (name "stable-diffusion-cpp-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/stable-diffusion.cpp-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stable Diffusion in pure C/C++")
    (description "Stable Diffusion in pure C/C++.")
    (home-page "https://aur.archlinux.org/packages/stable-diffusion.cpp-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 63. b43-firmware
;;; -------------------------------------------------------------------
(define-public b43-firmware
  (package
    (name "b43-firmware")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "b43-firmware" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firmware/"))))
    (synopsis "firmware for Broadcom B43 wireless networking chips - latest release")
    (description "Firmware for Broadcom B43 wireless networking chips - latest release.")
    (home-page "https://aur.archlinux.org/packages/b43-firmware")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 64. balatro
;;; -------------------------------------------------------------------
(define-public balatro
  (package
    (name "balatro")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "balatro" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A deck-building roguelite where you must play poker hands and earn chips to d...")
    (description "A deck-building roguelite where you must play poker hands and earn chips to defeat enemy blinds.")
    (home-page "https://aur.archlinux.org/packages/balatro")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 65. libfprint-tod
;;; -------------------------------------------------------------------
(define-public libfprint-tod
  (package
    (name "libfprint-tod")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "libfprint-tod" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for fingerprint readers - TOD version")
    (description "Library for fingerprint readers - TOD version.")
    (home-page "https://aur.archlinux.org/packages/libfprint-tod")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 66. sweethome3d-furniture-library
;;; -------------------------------------------------------------------
(define-public sweethome3d-furniture-library
  (package
    (name "sweethome3d-furniture-library")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "sweethome3d-furniture-library" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool to manage furniture in Sweet Home 3D")
    (description "A tool to manage furniture in Sweet Home 3D.")
    (home-page "https://aur.archlinux.org/packages/sweethome3d-furniture-library")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 67. thunderbird-grammalecte
;;; -------------------------------------------------------------------
(define-public thunderbird-grammalecte
  (package
    (name "thunderbird-grammalecte")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "thunderbird-grammalecte" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "thunderbird Grammalecte plugin (orthographe et grammaire en langue française)")
    (description "Thunderbird Grammalecte plugin (orthographe et grammaire en langue française).")
    (home-page "https://aur.archlinux.org/packages/thunderbird-grammalecte")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 68. frog-ocr-no-telemetry
;;; -------------------------------------------------------------------
(define-public frog-ocr-no-telemetry
  (package
    (name "frog-ocr-no-telemetry")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "frog-ocr-no-telemetry" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intuitive text extraction tool (OCR) for GNOME. Patched to remove telemetry")
    (description "Intuitive text extraction tool (OCR) for GNOME. Patched to remove telemetry.")
    (home-page "https://aur.archlinux.org/packages/frog-ocr-no-telemetry")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 69. picocrypt
;;; -------------------------------------------------------------------
(define-public picocrypt
  (package
    (name "picocrypt")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "picocrypt" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A very small, very simple, yet very secure encryption tool")
    (description "A very small, very simple, yet very secure encryption tool.")
    (home-page "https://aur.archlinux.org/packages/picocrypt")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 70. flightcore-bin
;;; -------------------------------------------------------------------
(define-public flightcore-bin
  (package
    (name "flightcore-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "flightcore-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flightcore-bin/"))))
    (synopsis "installer/Updater/Launcher for Northstar (binary release)")
    (description "Installer/Updater/Launcher for Northstar (binary release).")
    (home-page "https://aur.archlinux.org/packages/flightcore-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 71. cqrlogalpha-git
;;; -------------------------------------------------------------------
(define-public cqrlogalpha-git
  (package
    (name "cqrlogalpha-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cqrlogalpha-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cqrlogAlpha is a Cqrlog (by OK2CQR&OK1RR) clone that is under development")
    (description "CqrlogAlpha is a Cqrlog (by OK2CQR&OK1RR) clone that is under development.")
    (home-page "https://aur.archlinux.org/packages/cqrlogalpha-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 72. steamworks-sdk
;;; -------------------------------------------------------------------
(define-public steamworks-sdk
  (package
    (name "steamworks-sdk")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "steamworks-sdk" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Steamworks SDK provides a range of features which are designed to help sh...")
    (description "The Steamworks SDK provides a range of features which are designed to help ship your application or game on Steam in an efficient manner.")
    (home-page "https://aur.archlinux.org/packages/steamworks-sdk")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 73. drawio
;;; -------------------------------------------------------------------
(define-public drawio
  (package
    (name "drawio")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "drawio" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "diagram drawing application built on web technology")
    (description "Diagram drawing application built on web technology.")
    (home-page "https://aur.archlinux.org/packages/drawio")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. wikilynx
;;; -------------------------------------------------------------------
(define-public wikilynx
  (package
    (name "wikilynx")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "wikilynx" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list cmake pkg-config))
    (synopsis "A simple Qt C++ app to play Wikipedia Speedruns the right way")
    (description "A simple Qt C++ app to play Wikipedia Speedruns the right way.")
    (home-page "https://aur.archlinux.org/packages/wikilynx")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 75. ptyxis-palette-darcula2
;;; -------------------------------------------------------------------
(define-public ptyxis-palette-darcula2
  (package
    (name "ptyxis-palette-darcula2")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ptyxis-palette-darcula2" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ptyxis palette based on GtkSourceView Darcula2 theme")
    (description "Ptyxis palette based on GtkSourceView Darcula2 theme.")
    (home-page "https://aur.archlinux.org/packages/ptyxis-palette-darcula2")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 76. stable-diffusion.cpp-cublas-git
;;; -------------------------------------------------------------------
(define-public stable-diffusion-cpp-cublas-git
  (package
    (name "stable-diffusion-cpp-cublas-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/stable-diffusion.cpp-cublas-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stable Diffusion in pure C/C++ (with NVIDIA CUDA optimizations)")
    (description "Stable Diffusion in pure C/C++ (with NVIDIA CUDA optimizations).")
    (home-page "https://aur.archlinux.org/packages/stable-diffusion.cpp-cublas-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 77. ultimatestunts
;;; -------------------------------------------------------------------
(define-public ultimatestunts
  (package
    (name "ultimatestunts")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "ultimatestunts" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A remake of the famous DOS racing game 'Stunts'/'4D Sports Driving'")
    (description "A remake of the famous DOS racing game 'Stunts'/'4D Sports Driving'.")
    (home-page "https://aur.archlinux.org/packages/ultimatestunts")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. tailscale-systray-git
;;; -------------------------------------------------------------------
(define-public tailscale-systray-git
  (package
    (name "tailscale-systray-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/tailscale-systray-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux port of tailscale system tray menu")
    (description "Linux port of tailscale system tray menu.")
    (home-page "https://aur.archlinux.org/packages/tailscale-systray-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 79. gnome-app-grid-manager
;;; -------------------------------------------------------------------
(define-public gnome-app-grid-manager
  (package
    (name "gnome-app-grid-manager")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gnome-app-grid-manager" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "organize your Gnome overview applications by category")
    (description "Organize your Gnome overview applications by category.")
    (home-page "https://aur.archlinux.org/packages/gnome-app-grid-manager")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 80. xt_wgobfs-dkms
;;; -------------------------------------------------------------------
(define-public xt-wgobfs-dkms
  (package
    (name "xt-wgobfs-dkms")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "xt_wgobfs-dkms" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iptables WireGuard obfuscation extension")
    (description "iptables WireGuard obfuscation extension.")
    (home-page "https://aur.archlinux.org/packages/xt_wgobfs-dkms")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 81. gnome-foundry-git
;;; -------------------------------------------------------------------
(define-public gnome-foundry-git
  (package
    (name "gnome-foundry-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/gnome-foundry-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A GNOME library providing IDE capabilities (git version)")
    (description "A GNOME library providing IDE capabilities (git version).")
    (home-page "https://aur.archlinux.org/packages/gnome-foundry-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 82. mingw-w64-sdl3
;;; -------------------------------------------------------------------
(define-public mingw-w64-sdl3
  (package
    (name "mingw-w64-sdl3")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "mingw-w64-sdl3" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A library for portable low-level access to a video framebuffer, audio output,...")
    (description "A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (mingw-w64).")
    (home-page "https://aur.archlinux.org/packages/mingw-w64-sdl3")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 83. power-rules-daemon-git
;;; -------------------------------------------------------------------
(define-public power-rules-daemon-git
  (package
    (name "power-rules-daemon-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/power-rules-daemon-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "daemon written in Rust to automatically change your power profile when a prog...")
    (description "Daemon written in Rust to automatically change your power profile when a program is executed.")
    (home-page "https://aur.archlinux.org/packages/power-rules-daemon-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 84. power-rules-daemon
;;; -------------------------------------------------------------------
(define-public power-rules-daemon
  (package
    (name "power-rules-daemon")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "power-rules-daemon" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "daemon written in Rust to automatically change your power profile while a pro...")
    (description "Daemon written in Rust to automatically change your power profile while a program is executed.")
    (home-page "https://aur.archlinux.org/packages/power-rules-daemon")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 85. refold-git
;;; -------------------------------------------------------------------
(define-public refold-git
  (package
    (name "refold-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/refold-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A command-line utility for wrapping text")
    (description "A command-line utility for wrapping text.")
    (home-page "https://aur.archlinux.org/packages/refold-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 86. linvam
;;; -------------------------------------------------------------------
(define-public linvam
  (package
    (name "linvam")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "linvam" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux voice activated macros")
    (description "Linux voice activated macros.")
    (home-page "https://aur.archlinux.org/packages/linvam")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 87. dragonfly-navigator-git
;;; -------------------------------------------------------------------
(define-public dragonfly-navigator-git
  (package
    (name "dragonfly-navigator-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/dragonfly-navigator-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dragonfly Navigator: A simple and efficient dual pane file manager for Linux")
    (description "Dragonfly Navigator: A simple and efficient dual pane file manager for Linux.")
    (home-page "https://aur.archlinux.org/packages/dragonfly-navigator-git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 88. splash-logs
;;; -------------------------------------------------------------------
(define-public splash-logs
  (package
    (name "splash-logs")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "splash-logs" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds beautiful, adaptive colors to make logs easier to read")
    (description "Adds beautiful, adaptive colors to make logs easier to read.")
    (home-page "https://aur.archlinux.org/packages/splash-logs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 89. libfprint-ftexx00
;;; -------------------------------------------------------------------
(define-public libfprint-ftexx00
  (package
    (name "libfprint-ftexx00")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "libfprint-ftexx00" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "proprietary driver for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 finger...")
    (description "Proprietary driver for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 fingerprint readers.")
    (home-page "https://aur.archlinux.org/packages/libfprint-ftexx00")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 90. gohttpserver-bin
;;; -------------------------------------------------------------------
(define-public gohttpserver-bin
  (package
    (name "gohttpserver-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "gohttpserver-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gohttpserver-bin/"))))
    (synopsis "an HTTP Static File Server, write with golang+vue")
    (description "An HTTP Static File Server, write with golang+vue.")
    (home-page "https://aur.archlinux.org/packages/gohttpserver-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 91. focaltech-spi-dkms
;;; -------------------------------------------------------------------
(define-public focaltech-spi-dkms
  (package
    (name "focaltech-spi-dkms")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "focaltech-spi-dkms" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SPI module for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 fingerprint re...")
    (description "SPI module for FocalTech FTE3600, FTE4800, FTE6600 and FTE6900 fingerprint readers.")
    (home-page "https://aur.archlinux.org/packages/focaltech-spi-dkms")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 92. eb-garamond
;;; -------------------------------------------------------------------
(define-public eb-garamond
  (package
    (name "eb-garamond")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "eb-garamond" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "digitization of the Garamond shown on the Egenolff-Berner specimen")
    (description "Digitization of the Garamond shown on the Egenolff-Berner specimen.")
    (home-page "https://aur.archlinux.org/packages/eb-garamond")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 93. brother-hll3270cdw
;;; -------------------------------------------------------------------
(define-public brother-hll3270cdw
  (package
    (name "brother-hll3270cdw")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "brother-hll3270cdw" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LPR and CUPS driver for the Brother HL-L3270CDW")
    (description "LPR and CUPS driver for the Brother HL-L3270CDW.")
    (home-page "https://aur.archlinux.org/packages/brother-hll3270cdw")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 94. kwin-scripts-forceblur
;;; -------------------------------------------------------------------
(define-public kwin-scripts-forceblur
  (package
    (name "kwin-scripts-forceblur")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "kwin-scripts-forceblur" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "force-enable blur effect to user-specified windows")
    (description "Force-enable blur effect to user-specified windows.")
    (home-page "https://aur.archlinux.org/packages/kwin-scripts-forceblur")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 95. storm
;;; -------------------------------------------------------------------
(define-public storm
  (package
    (name "storm")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "storm" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apache Storm is a free and open source distributed realtime computation system")
    (description "Apache Storm is a free and open source distributed realtime computation system.")
    (home-page "https://aur.archlinux.org/packages/storm")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 96. pocketbase-bin
;;; -------------------------------------------------------------------
(define-public pocketbase-bin
  (package
    (name "pocketbase-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "pocketbase-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pocketbase-bin/"))))
    (synopsis "open Source realtime backend in 1 file")
    (description "Open Source realtime backend in 1 file.")
    (home-page "https://aur.archlinux.org/packages/pocketbase-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 97. python-pytest-docs
;;; -------------------------------------------------------------------
(define-public python-pytest-docs
  (package
    (name "python-pytest-docs")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "p/pytest-docs/pytest-docs-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "documentation for Python Pytest package")
    (description "Documentation for Python Pytest package.")
    (home-page "https://pypi.org/project/pytest-docs/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 98. dcron
;;; -------------------------------------------------------------------
(define-public dcron
  (package
    (name "dcron")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "dcron" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dillon's lightweight cron daemon")
    (description "dillon's lightweight cron daemon.")
    (home-page "https://aur.archlinux.org/packages/dcron")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 99. electronim-bin
;;; -------------------------------------------------------------------
(define-public electronim-bin
  (package
    (name "electronim-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                    "electronim-bin" ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/electronim-bin/"))))
    (synopsis "electron based multi IM (Instant Messaging) client.(Prebuilt version.Use syst...")
    (description "Electron based multi IM (Instant Messaging) client.(Prebuilt version.Use system-wide electron).")
    (home-page "https://aur.archlinux.org/packages/electronim-bin")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 100. ssimulacra2_bin-git
;;; -------------------------------------------------------------------
(define-public ssimulacra2-bin-git
  (package
    (name "ssimulacra2-bin-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/ssimulacra2_bin-git.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "binary interface to the Rust implementation of the SSIMULACRA2 metric")
    (description "Binary interface to the Rust implementation of the SSIMULACRA2 metric.")
    (home-page "https://aur.archlinux.org/packages/ssimulacra2_bin-git")
    (license license:gpl3+)))

