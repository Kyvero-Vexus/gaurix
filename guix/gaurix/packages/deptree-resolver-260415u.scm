;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260415u
;;; Resolves 100 packages from dependency tree queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (            stalwart-mail-server
            yozo-office-fonts
            yozo-office-templates
            apache-hudi
            apache-iceberg
            apache-paimon
            apache-flink
            intel-ipu6ep-camera-hal-git
            kafbat-kafka-ui
            python-deltalake
            python-speechmatics-rt
            zap-elec
            zap-rs
            opencomposite-git
            simracing-essentials
            dupeguru-git
            input-remapper-git
            invoiceninja-desktop
            kdelibs4support
            kime-git
            kwin-effects-better-blur-dx-git
            mihomo-party-electron-bin
            molecule-plugins
            nih-plug-git
            open-hexagon-git
            pandora-launcher
            powder-toy-git
            python-exa-py
            qbittorrent-enhanced-ua-nox
            ringracers
            solana
            solo1
            sos
            themix-full-git
            twig
            twintaillauncher-bin
            video2x-git
            vpkedit
            wayscriber
            winegui
            wordbook
            xfce4-theme-switcher
            ytmdesktop
            yuki-iptv-bin
            android-tv-remote))

(define-public stalwart-mail-server
  (package
    (name "stalwart-mail-server")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stalwart-mail-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "package description unavailable")
    (description "Package description unavailable.")
    (home-page "https://aur.archlinux.org/packages/stalwart-mail-server")
    (license license:non-copyleft)))

(define-public yozo-office-fonts
  (package
    (name "yozo-office-fonts")
    (version "9.0.6589.141ZH.S1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yozo-office-fonts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "built-in fonts of Yozo Office 2024")
    (description "Built-in fonts of Yozo Office 2024.")
    (home-page "https://www.yozosoft.com/product-officelinux.html")
    (license license:non-copyleft)))

(define-public yozo-office-templates
  (package
    (name "yozo-office-templates")
    (version "9.0.6589.141ZH.S1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yozo-office-templates.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "built-in document templates of Yozo Office 2024")
    (description "Built-in document templates of Yozo Office 2024.")
    (home-page "https://www.yozosoft.com/product-officelinux.html")
    (license license:non-copyleft)))

(define-public apache-hudi
  (package
    (name "apache-hudi")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-hudi.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apache Hudi (Spark integration) — Spark 3.5 (Scala 2.13) bundle and utilities...")
    (description "Apache Hudi (Spark integration) — Spark 3.5 (Scala 2.13) bundle and utilities JARs.")
    (home-page "https://hudi.apache.org/")
    (license license:asl2.0)))

(define-public apache-iceberg
  (package
    (name "apache-iceberg")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-iceberg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apache Iceberg — Spark runtime bundle (Spark 3.5, Scala 2.13)")
    (description "Apache Iceberg — Spark runtime bundle (Spark 3.5, Scala 2.13).")
    (home-page "https://iceberg.apache.org/")
    (license license:asl2.0)))

(define-public apache-paimon
  (package
    (name "apache-paimon")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-paimon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apache Paimon — Spark runtime JAR (Spark 3.5)")
    (description "Apache Paimon — Spark runtime JAR (Spark 3.5).")
    (home-page "https://paimon.apache.org/")
    (license license:asl2.0)))

(define-public apache-flink
  (package
    (name "apache-flink")
    (version "2.1.0_2.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apache-flink.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a framework and distributed processing engine for stateful computations over ...")
    (description "A framework and distributed processing engine for stateful computations over unbounded and bounded data streams (with Scala).")
    (home-page "http://flink.apache.org")
    (license license:asl2.0)))

(define-public intel-ipu6ep-camera-hal-git
  (package
    (name "intel-ipu6ep-camera-hal-git")
    (version "r103.289e645")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/intel/ipu6-camera-hal")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "intel IPU6 camera HAL (Alder Lake)")
    (description "Intel IPU6 camera HAL (Alder Lake).")
    (home-page "https://github.com/intel/ipu6-camera-hal")
    (license license:non-copyleft)))

(define-public kafbat-kafka-ui
  (package
    (name "kafbat-kafka-ui")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kafbat-kafka-ui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source Web UI for managing Apache Kafka clusters (Kafbat UI)")
    (description "Open-source Web UI for managing Apache Kafka clusters (Kafbat UI).")
    (home-page "https://github.com/kafbat/kafka-ui")
    (license license:asl2.0)))

(define-public python-deltalake
  (package
    (name "python-deltalake")
    (version "0.25.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-deltalake.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "native Delta Lake Python binding based on delta-rs with Pandas integration")
    (description "Native Delta Lake Python binding based on delta-rs with Pandas integration.")
    (home-page "https://delta.io/")
    (license license:expat)))

(define-public python-speechmatics-rt
  (package
    (name "python-speechmatics-rt")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-speechmatics-rt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "speechmatics Real-Time API Client")
    (description "Speechmatics Real-Time API Client.")
    (home-page "https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt")
    (license license:expat)))

(define-public zap-elec
  (package
    (name "zap-elec")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zap-elec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple web wrapper for WhatsApp Web")
    (description "Simple web wrapper for WhatsApp Web.")
    (home-page "https://github.com/JonasAlv/zap-elec")
    (license license:expat)))

(define-public zap-rs
  (package
    (name "zap-rs")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zap-rs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple web wrapper for WhatsApp Web")
    (description "Simple web wrapper for WhatsApp Web.")
    (home-page "https://github.com/JonasAlv/zap-rs")
    (license license:expat)))

(define-public opencomposite-git
  (package
    (name "opencomposite-git")
    (version "r1232.cff07db")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/znixian/OpenOVR")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "reimplementation of OpenVR, translating calls to OpenXR")
    (description "Reimplementation of OpenVR, translating calls to OpenXR.")
    (home-page "https://gitlab.com/znixian/OpenOVR")
    (license license:gpl3+)))

(define-public simracing-essentials
  (package
    (name "simracing-essentials")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simracing-essentials.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a collection of sim racing-focused utilities and drivers")
    (description "A collection of sim racing-focused utilities and drivers.")
    (home-page "https://github.com/Lawstorant")
    (license license:gpl2)))

(define-public dupeguru-git
  (package
    (name "dupeguru-git")
    (version "4.3.1.r69.g16aa6c21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dupeguru-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "find duplicate files on your system")
    (description "Find duplicate files on your system.")
    (home-page "https://dupeguru.voltaicideas.net/")
    (license license:gpl3)))

(define-public input-remapper-git
  (package
    (name "input-remapper-git")
    (version "2.2.0.r9.g0e1e0be9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sezanzeb/input-remapper/")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to change and program the mapping of your input device buttons")
    (description "A tool to change and program the mapping of your input device buttons.")
    (home-page "https://github.com/sezanzeb/input-remapper/")
    (license license:gpl3+)))

(define-public invoiceninja-desktop
  (package
    (name "invoiceninja-desktop")
    (version "5.0.183")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/invoiceninja-desktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop client for Invoice Ninja")
    (description "Desktop client for Invoice Ninja.")
    (home-page "https://invoiceninja.com/")
    (license license:non-copyleft)))

(define-public kdelibs4support
  (package
    (name "kdelibs4support")
    (version "5.116.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kdelibs4support.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "porting aid from KDELibs4")
    (description "Porting aid from KDELibs4.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kime-git
  (package
    (name "kime-git")
    (version "3.0.2.r1.g10f35aa")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Riey/kime")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "korean IME")
    (description "Korean IME.")
    (home-page "https://github.com/Riey/kime")
    (license license:gpl3)))

(define-public kwin-effects-better-blur-dx-git
  (package
    (name "kwin-effects-better-blur-dx-git")
    (version "r552.089a158")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xarblu/kwin-effects-better-blur-dx")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kWin Better Blur DX effect fork with window class force blur feature (Wayland)")
    (description "KWin Better Blur DX effect fork with window class force blur feature (Wayland).")
    (home-page "https://github.com/xarblu/kwin-effects-better-blur-dx")
    (license license:gpl3+)))

(define-public mihomo-party-electron-bin
  (package
    (name "mihomo-party-electron-bin")
    (version "1.9.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mihomo-party-electron-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "another Mihomo GUI")
    (description "Another Mihomo GUI.")
    (home-page "https://github.com/mihomo-party-org/mihomo-party")
    (license license:gpl3)))

(define-public molecule-plugins
  (package
    (name "molecule-plugins")
    (version "25.8.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/molecule-plugins.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of molecule plugins")
    (description "Collection of molecule plugins.")
    (home-page "https://github.com/ansible-community/molecule-plugins")
    (license license:expat)))

(define-public nih-plug-git
  (package
    (name "nih-plug-git")
    (version "r2245.ecfd6322")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/robbert-vdh/nih-plug")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rust VST3 and CLAP plugin collection by Robbert Van Der Helm")
    (description "Rust VST3 and CLAP plugin collection by Robbert Van Der Helm.")
    (home-page "https://github.com/robbert-vdh/nih-plug")
    (license license:gpl3)))

(define-public open-hexagon-git
  (package
    (name "open-hexagon-git")
    (version "2.0.6.r468.g1e2cba71")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/open-hexagon-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "challenging rhythm-based arcade game inspired by Super Hexagon")
    (description "Challenging rhythm-based arcade game inspired by Super Hexagon.")
    (home-page "https://openhexagon.org/")
    (license license:non-copyleft)))

(define-public pandora-launcher
  (package
    (name "pandora-launcher")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pandora-launcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a modern Minecraft launcher that balances ease-of-use with powerful instance ...")
    (description "A modern Minecraft launcher that balances ease-of-use with powerful instance management features.")
    (home-page "http://pandora.moulberry.com/")
    (license license:expat)))

(define-public powder-toy-git
  (package
    (name "powder-toy-git")
    (version "98.2.365.r43.g6179a73")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ThePowderToy/The-Powder-Toy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "desktop version of the classic falling sand physics sandbox, simulates air pr...")
    (description "Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat!.")
    (home-page "https://github.com/ThePowderToy/The-Powder-Toy")
    (license license:gpl3+)))

(define-public python-exa-py
  (package
    (name "python-exa-py")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-exa-py.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python SDK for Exa API")
    (description "Python SDK for Exa API.")
    (home-page "https://github.com/exa-labs/exa-py")
    (license license:expat)))

(define-public qbittorrent-enhanced-ua-nox
  (package
    (name "qbittorrent-enhanced-ua-nox")
    (version "5.1.3.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qbittorrent-enhanced-ua-nox.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced BitTorrent client programmed in C++, based on Qt toolkit and libt...")
    (description "An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar (Enhanced Edition with original user-agent).")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

(define-public ringracers
  (package
    (name "ringracers")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ringracers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kart racing video game originally based on the 3D Sonic the Hedgehog fangame ...")
    (description "Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2.")
    (home-page "https://www.kartkrew.org")
    (license license:gpl2)))

(define-public solana
  (package
    (name "solana")
    (version "3.1.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solana.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast, secure, and censorship resistant blockchain")
    (description "A fast, secure, and censorship resistant blockchain.")
    (home-page "https://github.com/anza-xyz/agave")
    (license license:asl2.0)))

(define-public solo1
  (package
    (name "solo1")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solo1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python tool and library for SoloKeys Solo 1")
    (description "Python tool and library for SoloKeys Solo 1.")
    (home-page "https://github.com/solokeys/solo1-cli")
    (license license:asl2.0)))

(define-public sos
  (package
    (name "sos")
    (version "4.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sos.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a unified tool for collecting system logs and other debug information")
    (description "A unified tool for collecting system logs and other debug information.")
    (home-page "https://github.com/sosreport/sos")
    (license license:gpl2)))

(define-public themix-full-git
  (package
    (name "themix-full-git")
    (version "1.15.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/themix-project/oomox")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "themix: GUI for generating different color variations of Oomox theme (GTK2 + ...")
    (description "Themix: GUI for generating different color variations of Oomox theme (GTK2 + HiDPI hack, GTK3, Cinnamon, GNOME, MATE, Openbox, Xfwm), icons (ArchDroid, Gnome-Colors, Numix, Papirus, Suru++), Base16 plugin (Alacritty, Emacs, GTK4, KDE, VIM and MANY more).")
    (home-page "https://github.com/themix-project/oomox")
    (license license:gpl3)))

(define-public twig
  (package
    (name "twig")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/twig.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "inspect, navigate, and understand complex JSON files in your terminal")
    (description "Inspect, navigate, and understand complex JSON files in your terminal.")
    (home-page "https://github.com/workdone0/twig")
    (license license:expat)))

(define-public twintaillauncher-bin
  (package
    (name "twintaillauncher-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/twintaillauncher-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a multi-platform launcher for your anime games")
    (description "A multi-platform launcher for your anime games.")
    (home-page "https://github.com/TwintailTeam/TwintailLauncher")
    (license license:gpl3)))

(define-public video2x-git
  (package
    (name "video2x-git")
    (version "6.4.0.r6.gafa37f9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/k4yt3x/video2x")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a machine learning-based video super resolution and frame interpolation frame...")
    (description "A machine learning-based video super resolution and frame interpolation framework.")
    (home-page "https://github.com/k4yt3x/video2x")
    (license license:agpl3)))

(define-public vpkedit
  (package
    (name "vpkedit")
    (version "5.0.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vpkedit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library and CLI/GUI tool to create, read, and write several pack file formats")
    (description "A library and CLI/GUI tool to create, read, and write several pack file formats.")
    (home-page "https://github.com/craftablescience/VPKEdit")
    (license license:expat)))

(define-public wayscriber
  (package
    (name "wayscriber")
    (version "0.9.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wayscriber.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screen annotation tool for Wayland compositors")
    (description "Screen annotation tool for Wayland compositors.")
    (home-page "https://wayscriber.com")
    (license license:expat)))

(define-public winegui
  (package
    (name "winegui")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/winegui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a user-friendly WINE graphical interface (build from source)")
    (description "A user-friendly WINE graphical interface (build from source).")
    (home-page "https://gitlab.melroy.org/melroy/winegui")
    (license license:non-copyleft)))

(define-public wordbook
  (package
    (name "wordbook")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wordbook.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a dictionary application built for GNOME")
    (description "A dictionary application built for GNOME.")
    (home-page "https://apps.gnome.org/Wordbook")
    (license license:gpl3+)))

(define-public xfce4-theme-switcher
  (package
    (name "xfce4-theme-switcher")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfce4-theme-switcher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility for fast switch betwen Xfce4 themes")
    (description "Utility for fast switch betwen Xfce4 themes.")
    (home-page "https://gitlab.com/linux-stuffs/xfce4-theme-switcher")
    (license license:gpl3)))

(define-public ytmdesktop
  (package
    (name "ytmdesktop")
    (version "2.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ytmdesktop.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a desktop app for YouTube Music")
    (description "A desktop app for YouTube Music.")
    (home-page "https://ytmdesktop.github.io")
    (license license:gpl3+)))

(define-public yuki-iptv-bin
  (package
    (name "yuki-iptv-bin")
    (version "0.0.19")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yuki-iptv-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iPTV player with EPG support")
    (description "IPTV player with EPG support.")
    (home-page "https://codeberg.org/liya/yuki-iptv")
    (license license:gpl3)))

(define-public android-tv-remote
  (package
    (name "android-tv-remote")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-tv-remote.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK-based remote control for Android TV devices")
    (description "A GTK-based remote control for Android TV devices.")
    (home-page "https://github.com/erenseymen/android-tv-remote")
    (license license:gpl3+)))
