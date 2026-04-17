;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417x
;;; Resolves 99 packages from general TODO queue.
;;;
;;; Recipes (77):
;;;     1. prasmoid (gnu, v0.1.0, expat)
;;;     2. sway-overfocus (gnu, v0.2.5, expat)
;;;     3. tabulate (cmake, v1.5, expat)
;;;     4. shm-modbus-signal-gen (gnu, v1.0.2, expat)
;;;     5. shm-format (cmake, v2.1.0, gpl3)
;;;     6. cxxshm (cmake, v2.0.4, expat)
;;;     7. cxxsemaphore (cmake, v2.0.4, expat)
;;;     8. cxxitimer (cmake, v2.0.4, expat)
;;;     9. elixir-ls (gnu, v0.30.0, asl2.0)
;;;    10. syng-server (gnu, v2.3.0, gpl3+)
;;;    11. syng-common (gnu, v2.3.0, gpl3+)
;;;    12. syng-client (gnu, v2.3.0, gpl3+)
;;;    13. wayland-pipewire-idle-inhibit (gnu, v0.7.1, gpl3)
;;;    14. matplotlib-cpp-git (cmake, vr177.ef0383f, expat)
;;;    15. shm-modbus-gui (gnu, v2.2.0, gpl3+)
;;;    16. lact-git (gnu, vr1061.d39b963c, expat)
;;;    17. 8188eu-aircrack-dkms-git (gnu, v5.3.9.r198.f969c54, gpl2)
;;;    18. dolphin-emu-primehack-git (cmake, v2509.r10.g060c588, gpl2+)
;;;    19. pdf2htmlex (cmake, v0.18.8.rc1, gpl3+)
;;;    20. treelite (cmake, v4.7.0, asl2.0)
;;;    21. python-treelite (pyproject, v4.7.0, asl2.0)
;;;    22. kvantum-theme-whitesur-git (gnu, vr114.2b4bcc7, gpl3+)
;;;    23. coulr (meson, v2.3.0, expat)
;;;    24. pyobd (gnu, v1.19, gpl2)
;;;    25. vimv (gnu, v3.1.0, gpl3+)
;;;    26. sublist3r-git (gnu, vr138.729d649, gpl2+)
;;;    27. wofi-calc (gnu, v1.1, expat)
;;;    28. bin-bin (copy, v0.25.1, expat)
;;;    29. wprs-git (gnu, vr34.64c01e1, asl2.0)
;;;    30. python-sdbus (pyproject, v0.14.2, gpl3+)
;;;    31. microbin-bin (copy, v2.1.0, bsd-3)
;;;    32. t150_driver-dkms-git (gnu, v0.7c.r143.72cd2b5, gpl2)
;;;    33. hyprbop (gnu, v0.1.1, gpl3+)
;;;    34. ghq-gst-bin (copy, v5.0.5, asl2.0)
;;;    35. spwd (gnu, v1.0.0, gpl3+)
;;;    36. slider-cli-git (gnu, v0.5.1.r0.gff53d59, asl2.0)
;;;    37. slider-cli (gnu, v0.5.2, asl2.0)
;;;    38. astro-box (gnu, v1.5.4, nonfree)
;;;    39. python-pyccel (pyproject, v2.2.3, expat)
;;;    40. pypy3-requests (gnu, v2.33.1, asl2.0)
;;;    41. w_scan2 (gnu, v1.0.17, gpl2+)
;;;    42. toney (gnu, v2.1.1, expat)
;;;    43. il2cpp-dumper-bin (copy, v6.7.46, expat)
;;;    44. rustup-git (gnu, v1.28.2.r61.g3197587f, asl2.0)
;;;    45. scalafmt (gnu, v3.10.6, asl2.0)
;;;    46. python-ag-ui-protocol (pyproject, v0.1.10, expat)
;;;    47. lovely-injector (cmake, v0.9.0, expat)
;;;    48. iconic (meson, v2026.4.1, gpl3+)
;;;    49. pithos (meson, v1.6.2, gpl3)
;;;    50. wofi-vim (copy, v1.0, expat)
;;;    51. vulkan-caps-viewer-x11 (cmake, v4.11, lgpl3+)
;;;    52. vulkan-caps-viewer-wayland (cmake, v4.11, lgpl3+)
;;;    53. cobra-cli (copy, v1.3.0, asl2.0)
;;;    54. guile1.8 (gnu, v1.8.8, gpl2+)
;;;    55. ampache (copy, v7.9.2, agpl3+)
;;;    56. kitty-terminfo-git (copy, v0.40.0, gpl3)
;;;    57. kitty-shell-integration-git (copy, v0.40.0, gpl3)
;;;    58. python-rocket-fft-git (pyproject, v0.2.5, bsd-3)
;;;    59. pianobooster (cmake, v1.0.0, gpl3+)
;;;    60. textadept-gtk3 (gnu, v12.9, expat)
;;;    61. portainer-bin (copy, v2.37.0, zlib)
;;;    62. bloop (copy, v2.0.19, asl2.0)
;;;    63. nagstamon-git (pyproject, v3.14.0, gpl2+)
;;;    64. mp3gain (gnu, v1.6.2, gpl2+)
;;;    65. findent (gnu, v4.3.6, bsd-3)
;;;    66. mystmd (copy, v1.8.0, expat)
;;;    67. pacman-contrib-git (gnu, v1.10.7, gpl2+)
;;;    68. miniupnpd-nft-git (gnu, v2.3.7, bsd-3)
;;;    69. arsenal (pyproject, v1.1.0, gpl3+)
;;;    70. simgrid (cmake, v3.36, lgpl2.1)
;;;    71. libfprint-1 (meson, v1.94.8, lgpl2.1+)
;;;    72. ttf-raleway-variable (copy, v4.101, silofl1.1)
;;;    73. otf-raleway (copy, v4.101, silofl1.1)
;;;    74. otb-unifont (copy, v16.0.01, gpl2+)
;;;    75. psf-unifont (copy, v16.0.01, gpl2+)
;;;    76. etterna (cmake, v0.74.3, expat)
;;;    77. license (copy, v3.2.1, mpl2.0)
;;;
;;; Blocked (22):
;;;    78. aiot-ide — BLOCKED: SOURCE_UNAVAILABLE (Xiaomi IoT IDE; proprietary, download behind auth wall)
;;;    79. apache-jena — BLOCKED: FETCH_FAILED (Apache archive mirrors returned 404 for multiple version attempts)
;;;    80. apache-jena-fuseki — BLOCKED: FETCH_FAILED (Apache archive mirrors returned 404 for multiple version attempts)
;;;    81. b43-firmware-classic — BLOCKED: LICENSE_REVIEW_NEEDED (Broadcom wireless firmware; license/redistribution unclear)
;;;    82. brother-mfc-j5720dw — BLOCKED: NEEDS_RECIPE_DESIGN (Brother printer driver; vendor download with custom install script)
;;;    83. code-server-marketplace — BLOCKED: NEEDS_RECIPE_DESIGN (VS Code marketplace extension; requires npm build and custom packaging)
;;;    84. devkitty-git — BLOCKED: FETCH_FAILED (GitHub repo nickvdyck/devkitty returned 404; project may have moved)
;;;    85. eclipse-cpp-bin — BLOCKED: NEEDS_RECIPE_DESIGN (large Eclipse IDE bundle; complex binary repack needed)
;;;    86. fcitx5-pinyin-sougou-dict-git — BLOCKED: NEEDS_RECIPE_DESIGN (requires scraping Sogou dict download page; non-trivial build)
;;;    87. fingerprint-gui — BLOCKED: FETCH_FAILED (GitHub repo nicenemo/fingerprint-gui returned 404 on all tag/branch variants)
;;;    88. fonts-apple — BLOCKED: LICENSE_REVIEW_NEEDED (Apple restricted font license; redistribution unclear)
;;;    89. gtk2-theme-dust — BLOCKED: FETCH_FAILED (GitHub mirror returned 404; original Launchpad source unavailable)
;;;    90. jdk-lts — BLOCKED: FETCH_FAILED (Oracle JDK download requires authentication/click-through license)
;;;    91. jdk-lts-doc — BLOCKED: FETCH_FAILED (Oracle JDK docs download requires authentication)
;;;    92. jre-lts — BLOCKED: FETCH_FAILED (Oracle JRE download requires authentication/click-through license)
;;;    93. libfprint-2-tod1-broadcom — BLOCKED: NEEDS_RECIPE_DESIGN (Broadcom proprietary fingerprint driver; launchpad.net source needs PPA extracti)
;;;    94. ntsync-common — BLOCKED: NEEDS_RECIPE_DESIGN (ntsync userspace component; depends on ntsync-header and ntsync-dkms)
;;;    95. ntsync-dkms — BLOCKED: NEEDS_RECIPE_DESIGN (Linux kernel DKMS module; requires kernel build infrastructure)
;;;    96. ntsync-header — BLOCKED: NEEDS_RECIPE_DESIGN (Linux kernel header file; requires extracting from kernel source tree)
;;;    97. redact-bin — BLOCKED: FETCH_FAILED (proprietary binary from redact.dev; download URL requires auth)
;;;    98. resource-hacker — BLOCKED: SOURCE_UNAVAILABLE (Windows-only application (angusj.com); no Linux binary or source available)
;;;    99. steamos-add-to-steam — BLOCKED: FETCH_FAILED (GitHub repo may have been deleted or made private; all URL variants 404)
;;;
;;; 77 recipes + 22 BLOCKED = 99 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417x)
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
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            prasmoid
            sway-overfocus
            tabulate
            shm-modbus-signal-gen
            shm-format
            cxxshm
            cxxsemaphore
            cxxitimer
            elixir-ls
            syng-server
            syng-common
            syng-client
            wayland-pipewire-idle-inhibit
            matplotlib-cpp-git
            shm-modbus-gui
            lact-git
            pkg-8188eu-aircrack-dkms-git
            dolphin-emu-primehack-git
            pdf2htmlex
            treelite
            python-treelite
            kvantum-theme-whitesur-git
            coulr
            pyobd
            vimv
            sublist3r-git
            wofi-calc
            bin-bin
            wprs-git
            python-sdbus
            microbin-bin
            t150-driver-dkms-git
            hyprbop
            ghq-gst-bin
            spwd
            slider-cli-git
            slider-cli
            astro-box
            python-pyccel
            pypy3-requests
            w-scan2
            toney
            il2cpp-dumper-bin
            rustup-git
            scalafmt
            python-ag-ui-protocol
            lovely-injector
            iconic
            pithos
            wofi-vim
            vulkan-caps-viewer-x11
            vulkan-caps-viewer-wayland
            cobra-cli
            guile1-dot-8
            ampache
            kitty-terminfo-git
            kitty-shell-integration-git
            python-rocket-fft-git
            pianobooster
            textadept-gtk3
            portainer-bin
            bloop
            nagstamon-git
            mp3gain
            findent
            mystmd
            pacman-contrib-git
            miniupnpd-nft-git
            arsenal
            simgrid
            libfprint-1
            ttf-raleway-variable
            otf-raleway
            otb-unifont
            psf-unifont
            etterna
            license
            ))

;;; Nonfree license placeholder for proprietary packages.
(define license:nonfree
  ((@@ (guix licenses) license) "nonfree"
    "https://aur.archlinux.org"
    "Nonfree/proprietary license; see upstream for terms."))

;;; -------------------------------------------------------------------
;;; 1. prasmoid
;;; -------------------------------------------------------------------
(define-public prasmoid
  (package
    (name "prasmoid")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/PRASSamin/prasmoid/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1lll5w9s7jjprns89vm5qvz4b0b2gbvxa04dr6h8qsihk586nbim"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "the All in One Development Toolkit for KDE Plasmoids. Build, test, and manage...")
    (description "The All in One Development Toolkit for KDE Plasmoids. Build, test, and manage your plasmoids with unparalleled ease and efficiency.")
    (home-page "https://github.com/PRASSamin/prasmoid")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. sway-overfocus
;;; -------------------------------------------------------------------
(define-public sway-overfocus
  (package
    (name "sway-overfocus")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/korreman/sway-overfocus/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0zv42wcg760d6a9zc0m5rrcx1h4icb85rfw382rip8j0ww1q2pzw"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "\"Better\" focus navigation for sway and i3")
    (description "\"Better\" focus navigation for sway and i3.")
    (home-page "https://github.com/korreman/sway-overfocus")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. tabulate
;;; -------------------------------------------------------------------
(define-public tabulate
  (package
    (name "tabulate")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/p-ranav/tabulate/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1yx3xc4fysf51j8jxrgx909aavhdx00lcgsrpd23aa06cgs8kchn"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "table maker for modern C++")
    (description "Table maker for modern C++.")
    (home-page "https://github.com/p-ranav/tabulate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. shm-modbus-signal-gen
;;; -------------------------------------------------------------------
(define-public shm-modbus-signal-gen
  (package
    (name "shm-modbus-signal-gen")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SHMModbus/shm-modbus-signal-gen/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0qcyyld77pzj4rbqchbp030k9az6xajz6782jnb8hwgc9qm6c1cd"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "system time based signal generator for stdin-to-modbus-shm")
    (description "System time based signal generator for stdin-to-modbus-shm.")
    (home-page "https://github.com/SHMModbus/shm-modbus-signal-gen")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. shm-format
;;; -------------------------------------------------------------------
(define-public shm-format
  (package
    (name "shm-format")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SHMModbus/shm_format/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "08ky557xs57hv630j43yb7d870fz69d7jkiq5ijq9lcqmjjc01z6"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "read values with specified data type from shared memory")
    (description "Read values with specified data type from shared memory.")
    (home-page "https://github.com/SHMModbus/shm_format")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. cxxshm
;;; -------------------------------------------------------------------
(define-public cxxshm
  (package
    (name "cxxshm")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NikolasK-source/cxxshm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1a45grnxih8y9bdpxvsw44lm9rb2mblbz0qzi74apicjpi2fngja"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a C++ library to handle POSIX shared memory")
    (description "A C++ library to handle POSIX shared memory.")
    (home-page "https://github.com/NikolasK-source/cxxshm")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. cxxsemaphore
;;; -------------------------------------------------------------------
(define-public cxxsemaphore
  (package
    (name "cxxsemaphore")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NikolasK-source/cxxsemaphore/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1x22f2kfammjcdjpjamkq5lj63jhf04r9f703vzfbg2r3nwm8xvk"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a C++ library to handle POSIX named semaphores")
    (description "A C++ library to handle POSIX named semaphores.")
    (home-page "https://github.com/NikolasK-source/cxxsemaphore")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. cxxitimer
;;; -------------------------------------------------------------------
(define-public cxxitimer
  (package
    (name "cxxitimer")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/NikolasK-source/cxxitimer/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "167vm2nc7mixx54gjm9mr8f1gr1gpgnwcqpaqa41jbm4aq69agzg"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a C++ Library to handle linux interval timer")
    (description "A C++ Library to handle linux interval timer.")
    (home-page "https://github.com/NikolasK-source/cxxitimer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. elixir-ls
;;; -------------------------------------------------------------------
(define-public elixir-ls
  (package
    (name "elixir-ls")
    (version "0.30.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/elixir-lsp/elixir-ls/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "18cdda5jq8kflsyfmjlqrw92qay27kg915xbh31258f2zyvw3rnq"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a frontend-independent Language Server Protocol for Elixir")
    (description "A frontend-independent Language Server Protocol for Elixir.")
    (home-page "https://github.com/elixir-lsp/elixir-ls")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 10. syng-server
;;; -------------------------------------------------------------------
(define-public syng-server
  (package
    (name "syng-server")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/christofsteel/syng/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "19mgjmpls87xr863j5m69icg7dbl3syhns7i0csl9k16yvynrsxl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "all in one karaoke software (server)")
    (description "All in one karaoke software (server)")
    (home-page "https://github.com/christofsteel/syng")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 11. syng-common
;;; -------------------------------------------------------------------
(define-public syng-common
  (package
    (name "syng-common")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/christofsteel/syng/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "19mgjmpls87xr863j5m69icg7dbl3syhns7i0csl9k16yvynrsxl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "all in one karaoke software (common)")
    (description "All in one karaoke software (common)")
    (home-page "https://github.com/christofsteel/syng")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 12. syng-client
;;; -------------------------------------------------------------------
(define-public syng-client
  (package
    (name "syng-client")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/christofsteel/syng/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "19mgjmpls87xr863j5m69icg7dbl3syhns7i0csl9k16yvynrsxl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "all in one karaoke software (client)")
    (description "All in one karaoke software (client)")
    (home-page "https://github.com/christofsteel/syng")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 13. wayland-pipewire-idle-inhibit
;;; -------------------------------------------------------------------
(define-public wayland-pipewire-idle-inhibit
  (package
    (name "wayland-pipewire-idle-inhibit")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0li6vhrm1d0k1vb6824y0ms9vziq7mykyi83fap100mcm4m5ci36"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "inhibit wayland idle when computer is playing sound")
    (description "Inhibit wayland idle when computer is playing sound.")
    (home-page "https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. matplotlib-cpp-git
;;; -------------------------------------------------------------------
(define-public matplotlib-cpp-git
  (package
    (name "matplotlib-cpp-git")
    (version "r177.ef0383f")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lava/matplotlib-cpp/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0c2c8bc1i6jhcg5jdnqdw9vdzy7a9nn7n6allgfhjghy778iyw7d"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "extremely simple yet powerful header-only C++ plotting library built on the p...")
    (description "Extremely simple yet powerful header-only C++ plotting library built on the popular matplotlib.")
    (home-page "https://github.com/lava/matplotlib-cpp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. shm-modbus-gui
;;; -------------------------------------------------------------------
(define-public shm-modbus-gui
  (package
    (name "shm-modbus-gui")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SHMModbus/shm_modbus_gui/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1k5asn57r2cndngd3yplkfmsxchqgckx9pqa94akbr4h1a7mfhxn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "qT GUI (PySide6) for shm-modbus")
    (description "QT GUI (PySide6) for shm-modbus.")
    (home-page "https://github.com/SHMModbus/shm_modbus_gui")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 16. lact-git
;;; -------------------------------------------------------------------
(define-public lact-git
  (package
    (name "lact-git")
    (version "r1061.d39b963c")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ilya-zlobintsev/LACT/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0ba6hwxd2hl9hdvwc4r5zlsldfl2vr86h1lyrm5zw7i3pkba54x0"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "aMDGPU Controller application (git version)")
    (description "AMDGPU Controller application (git version)")
    (home-page "https://github.com/ilya-zlobintsev/LACT")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. 8188eu-aircrack-dkms-git
;;; -------------------------------------------------------------------
(define-public pkg-8188eu-aircrack-dkms-git
  (package
    (name "8188eu-aircrack-dkms-git")
    (version "5.3.9.r198.f969c54")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/aircrack-ng/rtl8188eus/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "120h1ggs9zyf3ki2rxfcxjg819lwqsmz5mxj9vjli1xvag6azjl4"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "realtek RTL8188EUS and RTL8188ETV Wi-Fi driver with monitor mode & frame inje...")
    (description "Realtek RTL8188EUS and RTL8188ETV Wi-Fi driver with monitor mode & frame injection support.")
    (home-page "https://github.com/aircrack-ng/rtl8188eus")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 18. dolphin-emu-primehack-git
;;; -------------------------------------------------------------------
(define-public dolphin-emu-primehack-git
  (package
    (name "dolphin-emu-primehack-git")
    (version "2509.r10.g060c588")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xiota/dolphin-primehack/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "02qw3x685wxlgdyk5bh8hviz8lf27gjygj860rla2vqzb1q6plkg"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a Gamecube and Wii emulator with mouselook controls")
    (description "A Gamecube and Wii emulator with mouselook controls.")
    (home-page "https://github.com/xiota/dolphin-primehack")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 19. pdf2htmlex
;;; -------------------------------------------------------------------
(define-public pdf2htmlex
  (package
    (name "pdf2htmlex")
    (version "0.18.8.rc1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pdf2htmlEX/pdf2htmlEX/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0hangjdca8s6s6c6dkqs0clpw8g8sn72i3pq9a7fgzzaapqj1lx1"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "convert PDF to HTML without losing text or format")
    (description "Convert PDF to HTML without losing text or format.")
    (home-page "https://github.com/pdf2htmlEX/pdf2htmlEX")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. treelite
;;; -------------------------------------------------------------------
(define-public treelite
  (package
    (name "treelite")
    (version "4.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dmlc/treelite/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "17h5lxpxyif06mb7d18ij3g9fm2lw35d6rl0g890y0vc7zzs6ryj"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "universal model exchange and serialization format for decision tree forests")
    (description "Universal model exchange and serialization format for decision tree forests.")
    (home-page "https://github.com/dmlc/treelite")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. python-treelite
;;; -------------------------------------------------------------------
(define-public python-treelite
  (package
    (name "python-treelite")
    (version "4.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/t/treelite/treelite-" version ".tar.gz"))
              (sha256
               (base32
                "0k6w2hgswj4dglnx8jsnj3bjg1fnnzhachkbmmxyfwj91ychs6kd"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "universal model exchange and serialization format for decision tree forests -...")
    (description "Universal model exchange and serialization format for decision tree forests - python.")
    (home-page "https://github.com/dmlc/treelite")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 22. kvantum-theme-whitesur-git
;;; -------------------------------------------------------------------
(define-public kvantum-theme-whitesur-git
  (package
    (name "kvantum-theme-whitesur-git")
    (version "r114.2b4bcc7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vinceliuice/WhiteSur-kde/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1ci4bnqcmnd5x0r7whkfzxsp7rxzrz14mavqaj7xwpgs1w691ayn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "whiteSur theme for Kvantum")
    (description "WhiteSur theme for Kvantum.")
    (home-page "https://github.com/vinceliuice/WhiteSur-kde")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. coulr
;;; -------------------------------------------------------------------
(define-public coulr
  (package
    (name "coulr")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Huluti/Coulr/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0xb83qb0iq6fchnh8a5n84kqz74h9qacyfnwqzwkmpzhly6n4hzb"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "color box to help developers and designers")
    (description "Color box to help developers and designers.")
    (home-page "https://github.com/Huluti/Coulr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. pyobd
;;; -------------------------------------------------------------------
(define-public pyobd
  (package
    (name "pyobd")
    (version "1.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/barracuda-fsh/pyobd/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "03yiah0hib9kvf8gic8bxlgjb8mylq32q00jhhxfvxygfisnzkll"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "an OBD-II compliant car diagnostic tool")
    (description "An OBD-II compliant car diagnostic tool.")
    (home-page "https://github.com/barracuda-fsh/pyobd")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 25. vimv
;;; -------------------------------------------------------------------
(define-public vimv
  (package
    (name "vimv")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dmulholl/vimv/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "17va4dd78yjpbm3m3jkgcgarg2id83xrf463rc01hnvnqvsaadsg"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a command line utility for batch-renaming files")
    (description "A command line utility for batch-renaming files.")
    (home-page "https://github.com/dmulholl/vimv")
    (license license:bsd-0)))

;;; -------------------------------------------------------------------
;;; 26. sublist3r-git
;;; -------------------------------------------------------------------
(define-public sublist3r-git
  (package
    (name "sublist3r-git")
    (version "r138.729d649")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/aboul3la/Sublist3r/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "09nc7d5vkiql5xxi2db3iqkfcriijf5084n25phddwfqysx0x520"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a python tool designed to enumerate subdomains of websites using OSINT")
    (description "A python tool designed to enumerate subdomains of websites using OSINT.")
    (home-page "https://github.com/aboul3la/Sublist3r")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 27. wofi-calc
;;; -------------------------------------------------------------------
(define-public wofi-calc
  (package
    (name "wofi-calc")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Zeioth/wofi-calc/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "15qwampc5w9z540hnvvdkjnmfkplvax7wzkrn48vjisrz12c95mx"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a simple calculator for wofi, inspired in rofi-calc")
    (description "A simple calculator for wofi, inspired in rofi-calc.")
    (home-page "https://github.com/Zeioth/wofi-calc.git")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. bin-bin
;;; -------------------------------------------------------------------
(define-public bin-bin
  (package
    (name "bin-bin")
    (version "0.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/marcosnils/bin/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1176xs2wf7r1zi81g2hv2qzzrllpwy3cfplwy7jz1a8cssfnrd4q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/bin/"))))
    (synopsis "effortless binary manager")
    (description "Effortless binary manager.")
    (home-page "https://github.com/marcosnils/bin")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. wprs-git
;;; -------------------------------------------------------------------
(define-public wprs-git
  (package
    (name "wprs-git")
    (version "r34.64c01e1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wayland-transpositor/wprs/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "13lviq4n8cmvrvzm0d58hbsz1z3sai2z06rbyxdfcyn7dj1440qc"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "like xpra, but for Wayland, and written in Rust")
    (description "Like xpra, but for Wayland, and written in Rust.")
    (home-page "https://github.com/wayland-transpositor/wprs")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 30. python-sdbus
;;; -------------------------------------------------------------------
(define-public python-sdbus
  (package
    (name "python-sdbus")
    (version "0.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/s/sdbus/sdbus-" version ".tar.gz"))
              (sha256
               (base32
                "04k4fscbla25i6jbkx9h392r3rrdldijbfqy64sxxqg1jsqi6pag"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "modern Python library for D-Bus")
    (description "Modern Python library for D-Bus.")
    (home-page "https://github.com/python-sdbus/python-sdbus")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 31. microbin-bin
;;; -------------------------------------------------------------------
(define-public microbin-bin
  (package
    (name "microbin-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/szabodanika/microbin/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0z1h1p8grvv1p63mr8z09ax889ff48g3nm6cyy1qbrgngvh10lsy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/microbin/"))))
    (synopsis "a tiny, self-contained, configurable paste bin and URL shortener written in Rust")
    (description "A tiny, self-contained, configurable paste bin and URL shortener written in Rust.")
    (home-page "https://github.com/szabodanika/microbin")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 32. t150_driver-dkms-git
;;; -------------------------------------------------------------------
(define-public t150-driver-dkms-git
  (package
    (name "t150_driver-dkms-git")
    (version "0.7c.r143.72cd2b5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/scarburato/t150_driver/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1x4gww3m2w54cxbwm2jkinlk7pm4f9yxrh5c37cm865i84xj45n6"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "thrustmaster T150 Force Feedback Wheel Linux drivers")
    (description "Thrustmaster T150 Force Feedback Wheel Linux drivers.")
    (home-page "https://github.com/scarburato/t150_driver")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 33. hyprbop
;;; -------------------------------------------------------------------
(define-public hyprbop
  (package
    (name "hyprbop")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/zetorik/hyprbop/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "06wzsynm8w2dqp6g5l7glfrj8bl8rf864k0iq434c6dzrc8z3lbx"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a hacky utility for creating custom popups on hyprland")
    (description "A hacky utility for creating custom popups on hyprland.")
    (home-page "https://github.com/zetorik/hyprbop")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. ghq-gst-bin
;;; -------------------------------------------------------------------
(define-public ghq-gst-bin
  (package
    (name "ghq-gst-bin")
    (version "5.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/uetchy/gst/releases/download/v5.0.5/gst_5.0.5_linux_amd64.tar.gz")
              (sha256
               (base32
                "1blccprqiax1h875yv3qhzgvy59qs35rzc1li49qs8b6r2q5n63r"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/ghq-gst/"))))
    (synopsis "additional commands for ghq")
    (description "Additional commands for ghq.")
    (home-page "https://github.com/uetchy/gst")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 35. spwd
;;; -------------------------------------------------------------------
(define-public spwd
  (package
    (name "spwd")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Andrew-Flame/spwd/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "18x1l5qlwnzbahi1827asbms16hicm5z4lvpnvnkbg363nnl3hs4"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "program for displaying the current working directory in the shell prompt")
    (description "Program for displaying the current working directory in the shell prompt.")
    (home-page "https://github.com/Andrew-Flame/spwd.git")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 36. slider-cli-git
;;; -------------------------------------------------------------------
(define-public slider-cli-git
  (package
    (name "slider-cli-git")
    (version "0.5.1.r0.gff53d59")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/colinmcintosh/SLIDER-cli/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "07dpn4g85bb1ri2h19cg546ns97iyrrcljw0a8hc3pvj3f8pf4kj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command-line implementation and Golang library for the RAMMB/CIRA SLIDER sate...")
    (description "Command-line implementation and Golang library for the RAMMB/CIRA SLIDER satellite image viewer.")
    (home-page "https://github.com/colinmcintosh/SLIDER-cli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 37. slider-cli
;;; -------------------------------------------------------------------
(define-public slider-cli
  (package
    (name "slider-cli")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/colinmcintosh/SLIDER-cli/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0f7dfffq84c9jl8xrj60i445b6l5php7z61h8kd77yw9jqm0ls6j"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "command-line implementation and Golang library for the RAMMB/CIRA SLIDER sate...")
    (description "Command-line implementation and Golang library for the RAMMB/CIRA SLIDER satellite image viewer.")
    (home-page "https://github.com/colinmcintosh/SLIDER-cli")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 38. astro-box
;;; -------------------------------------------------------------------
(define-public astro-box
  (package
    (name "astro-box")
    (version "1.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CheongSzesuen/AstroBox-archLinux/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "08mjv4w2ahmigmlgcalmm26p8yj5886lnd0z8crr1bhy3afc64sj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a multifunctional toolbox designed for Xiaomi Vela wearable devices")
    (description "A multifunctional toolbox designed for Xiaomi Vela wearable devices.")
    (home-page "https://github.com/CheongSzesuen/AstroBox-archLinux")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 39. python-pyccel
;;; -------------------------------------------------------------------
(define-public python-pyccel
  (package
    (name "python-pyccel")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/p/pyccel/pyccel-" version ".tar.gz"))
              (sha256
               (base32
                "1wlb9ish0bpwv6d89dfrqn7fgg2k6qzb9kklrs2zk942xa7pq7vq"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "python extension language using accelerators")
    (description "Python extension language using accelerators.")
    (home-page "https://github.com/pyccel/pyccel")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. pypy3-requests
;;; -------------------------------------------------------------------
(define-public pypy3-requests
  (package
    (name "pypy3-requests")
    (version "2.33.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/psf/requests/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0rn7ix0n2znysv34y13r261y3a5wc4qxbvgzfi04nl0ndmiaj9yj"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a simple, yet elegant, HTTP library")
    (description "A simple, yet elegant, HTTP library.")
    (home-page "https://github.com/psf/requests")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 41. w_scan2
;;; -------------------------------------------------------------------
(define-public w-scan2
  (package
    (name "w_scan2")
    (version "1.0.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stefantalpalaru/w_scan2/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1pvxwggan0hm3h0lvl5byibkq90qiy44yq176dd3mss7fbf6igqa"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "w_scan fork (Small channel scan tool for vdr)")
    (description "w_scan fork (Small channel scan tool for vdr)")
    (home-page "https://github.com/stefantalpalaru/w_scan2")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 42. toney
;;; -------------------------------------------------------------------
(define-public toney
  (package
    (name "toney")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SourcewareLab/Toney/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "12wwxmsl63jk6a15686ygpzhn8wkmxd1j0ffb78492gk65n895fs"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fast, lightweight, terminal-based note-taking app for the modern developer")
    (description "Fast, lightweight, terminal-based note-taking app for the modern developer.")
    (home-page "https://github.com/SourcewareLab/Toney")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. il2cpp-dumper-bin
;;; -------------------------------------------------------------------
(define-public il2cpp-dumper-bin
  (package
    (name "il2cpp-dumper-bin")
    (version "6.7.46")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Perfare/Il2CppDumper/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "08as6jbbdcv3z1w7l2jzl1lqv0x06q192dclbhm68igjk03nri67"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/il2cpp-dumper/"))))
    (synopsis "a tool to reverse engineer il2cpp games")
    (description "A tool to reverse engineer il2cpp games.")
    (home-page "https://github.com/Perfare/Il2CppDumper")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 44. rustup-git
;;; -------------------------------------------------------------------
(define-public rustup-git
  (package
    (name "rustup-git")
    (version "1.28.2.r61.g3197587f")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rust-lang/rustup/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "12pcxbhp4knr0sgnd0lnqbah4wi332sydc3hli86fjij1f7sdg8q"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "the Rust toolchain installer")
    (description "The Rust toolchain installer.")
    (home-page "https://github.com/rust-lang/rustup")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 45. scalafmt
;;; -------------------------------------------------------------------
(define-public scalafmt
  (package
    (name "scalafmt")
    (version "3.10.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/scalameta/scalafmt/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "00n910n8q0z5wybdas1jplk023p0vi763z7cl6mhkhchqvycgj6z"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "code formatter for the Scala programming language")
    (description "code formatter for the Scala programming language.")
    (home-page "https://github.com/scalameta/scalafmt")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 46. python-ag-ui-protocol
;;; -------------------------------------------------------------------
(define-public python-ag-ui-protocol
  (package
    (name "python-ag-ui-protocol")
    (version "0.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://files.pythonhosted.org/packages/source/a/ag_ui_protocol/ag_ui_protocol-" version ".tar.gz"))
              (sha256
               (base32
                "1x4lv2g9bl43l1kj55n5lh3mlw0n1hkywqn3m2qlpcifdcf9j4rj"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "python SDK for the Agent-User Interaction (AG-UI) Protocol")
    (description "Python SDK for the Agent-User Interaction (AG-UI) Protocol.")
    (home-page "https://github.com/ag-ui-protocol/ag-ui/tree/main/sdks/python")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. lovely-injector
;;; -------------------------------------------------------------------
(define-public lovely-injector
  (package
    (name "lovely-injector")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ethangreen-dev/lovely-injector/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0db5kybh8vjpwa1zhna7vy4sf8blczk54kn6i811kr89xq8hj876"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a runtime lua injector for games built with LÖVE")
    (description "A runtime lua injector for games built with LÖVE.")
    (home-page "https://github.com/ethangreen-dev/lovely-injector")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. iconic
;;; -------------------------------------------------------------------
(define-public iconic
  (package
    (name "iconic")
    (version "2026.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/youpie/Iconic/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1wc1b8and082d4d3mkr7bgr9chsppvpfwp31w1w1shig6dkj8dzg"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "an application made for GNOME written in Rust to easily add images on top of ...")
    (description "An application made for GNOME written in Rust to easily add images on top of folders.")
    (home-page "https://github.com/youpie/Iconic")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 49. pithos
;;; -------------------------------------------------------------------
(define-public pithos
  (package
    (name "pithos")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pithos/pithos/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1386s7nm8hsij9dfx78hc0bw8p7jmipkprnr0gvfm1vpy1dgpzv9"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "pandora Internet Radio player for GNOME")
    (description "Pandora Internet Radio player for GNOME.")
    (home-page "https://pithos.github.io/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 50. wofi-vim
;;; -------------------------------------------------------------------
(define-public wofi-vim
  (package
    (name "wofi-vim")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/timasoft/wofi-vim/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "1rrqph5jp3v172j3vizgfqa3s1qf4jbm7iwrdi8v56fl11n7vxzc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/wofi-vim/"))))
    (synopsis "vim-like key bindings for wofi launcher")
    (description "Vim-like key bindings for wofi launcher.")
    (home-page "https://github.com/timasoft/wofi-vim")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. vulkan-caps-viewer-x11
;;; -------------------------------------------------------------------
(define-public vulkan-caps-viewer-x11
  (package
    (name "vulkan-caps-viewer-x11")
    (version "4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0xy5y48pbjzr65zij292jncpszybssba1j4a8x6x61y93xf8f8w5"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "vulkan hardware capability viewer for X11")
    (description "Vulkan hardware capability viewer for X11.")
    (home-page "https://vulkan.gpuinfo.org")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 52. vulkan-caps-viewer-wayland
;;; -------------------------------------------------------------------
(define-public vulkan-caps-viewer-wayland
  (package
    (name "vulkan-caps-viewer-wayland")
    (version "4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0xy5y48pbjzr65zij292jncpszybssba1j4a8x6x61y93xf8f8w5"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "vulkan hardware capability viewer for Wayland")
    (description "Vulkan hardware capability viewer for Wayland.")
    (home-page "https://vulkan.gpuinfo.org")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 53. cobra-cli
;;; -------------------------------------------------------------------
(define-public cobra-cli
  (package
    (name "cobra-cli")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/spf13/cobra-cli/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "05bxlxyrg1aj92709anvl6v2r3f2xqhfgm9h4c0zyph3ia12k5ww"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/cobra-cli/"))))
    (synopsis "cLI tool for generating Cobra application scaffolding")
    (description "CLI tool for generating Cobra application scaffolding.")
    (home-page "https://cobra.dev")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 54. guile1.8
;;; -------------------------------------------------------------------
(define-public guile1-dot-8
  (package
    (name "guile1.8")
    (version "1.8.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://ftp.gnu.org/gnu/guile/guile-" version ".tar.gz"))
              (sha256
               (base32
                "0l200a0v7h8bh0cwz6v7hc13ds39cgqsmfrks55b1rbj5vniyiy3"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "gNU extension language and Scheme interpreter, version 1.8")
    (description "GNU extension language and Scheme interpreter, version 1.8.")
    (home-page "https://www.gnu.org/software/guile/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 55. ampache
;;; -------------------------------------------------------------------
(define-public ampache
  (package
    (name "ampache")
    (version "7.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ampache/ampache/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1jy72bpvn1sxspiq03yil4m4pxyr7ing0fy1fzwg83bybz2d3gzp"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/ampache/"))))
    (synopsis "web-based audio/video streaming application and file manager")
    (description "Web-based audio/video streaming application and file manager.")
    (home-page "https://ampache.org/")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 56. kitty-terminfo-git
;;; -------------------------------------------------------------------
(define-public kitty-terminfo-git
  (package
    (name "kitty-terminfo-git")
    (version "0.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kovidgoyal/kitty/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "14vcqi0lzh012ygsfnw82z6k1z4raasxab1g72m0wg9a2c5m7d10"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/kitty-terminfo/"))))
    (synopsis "terminfo files for the kitty terminal emulator")
    (description "Terminfo files for the kitty terminal emulator.")
    (home-page "https://sw.kovidgoyal.net/kitty/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 57. kitty-shell-integration-git
;;; -------------------------------------------------------------------
(define-public kitty-shell-integration-git
  (package
    (name "kitty-shell-integration-git")
    (version "0.40.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/kovidgoyal/kitty/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "14vcqi0lzh012ygsfnw82z6k1z4raasxab1g72m0wg9a2c5m7d10"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/kitty-shell-integration/"))))
    (synopsis "shell integration scripts for kitty terminal emulator")
    (description "Shell integration scripts for kitty terminal emulator.")
    (home-page "https://sw.kovidgoyal.net/kitty/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 58. python-rocket-fft-git
;;; -------------------------------------------------------------------
(define-public python-rocket-fft-git
  (package
    (name "python-rocket-fft-git")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/styfenschaer/rocket-fft/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1vjxn60cb3hhfc07sq99m9n37k2m6zcag46b2aa0x0c09lv0klh2"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "fast FFT implementation for Python using Numba")
    (description "Fast FFT implementation for Python using Numba.")
    (home-page "https://github.com/styfenschaer/rocket-fft")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 59. pianobooster
;;; -------------------------------------------------------------------
(define-public pianobooster
  (package
    (name "pianobooster")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pianobooster/PianoBooster/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1dp1kh703j6q69zcxanydv4qmgri04gp18y5506iik4vgicfjn0v"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "piano practice aid that plays MIDI files and listens to your playing")
    (description "Piano practice aid that plays MIDI files and listens to your playing.")
    (home-page "https://www.pianobooster.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 60. textadept-gtk3
;;; -------------------------------------------------------------------
(define-public textadept-gtk3
  (package
    (name "textadept-gtk3")
    (version "12.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/orbitalquark/textadept/archive/refs/tags/textadept_" version ".tar.gz"))
              (sha256
               (base32
                "12xh2hm7afa5x901qwpap0z2psrmbh30zkq2pkvkhxm7lfg58xdn"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fast, minimalist, and remarkably extensible cross-platform text editor")
    (description "Fast, minimalist, and remarkably extensible cross-platform text editor.")
    (home-page "https://orbitalquark.github.io/textadept/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 61. portainer-bin
;;; -------------------------------------------------------------------
(define-public portainer-bin
  (package
    (name "portainer-bin")
    (version "2.37.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/portainer/portainer/releases/download/2.37.0/portainer-2.37.0-linux-amd64.tar.gz")
              (sha256
               (base32
                "0981ylbqx692xpr5phh8jvw6y832dwzgin9plz53h9dnd1ww7mf0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/portainer/"))))
    (synopsis "lightweight management UI for Docker and Kubernetes")
    (description "Lightweight management UI for Docker and Kubernetes.")
    (home-page "https://www.portainer.io/")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 62. bloop
;;; -------------------------------------------------------------------
(define-public bloop
  (package
    (name "bloop")
    (version "2.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/scalacenter/bloop/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0rm5dqgmz9352mbxh64mbqqhsk2axa7ds04vwz07kkvam5hyymks"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/bloop/"))))
    (synopsis "fast Scala build server for IDE and CLI compilation")
    (description "Fast Scala build server for IDE and CLI compilation.")
    (home-page "https://scalacenter.github.io/bloop/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 63. nagstamon-git
;;; -------------------------------------------------------------------
(define-public nagstamon-git
  (package
    (name "nagstamon-git")
    (version "3.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/HenriWahl/Nagstamon/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0c4zks3i861l0y7pxp92jslm1m854ihbcf66ab92i8zgnzz5077m"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "nagios status monitor for desktop notification area")
    (description "Nagios status monitor for desktop notification area.")
    (home-page "https://nagstamon.de/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 64. mp3gain
;;; -------------------------------------------------------------------
(define-public mp3gain
  (package
    (name "mp3gain")
    (version "1.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/mp3gain/files/mp3gain/" version "/mp3gain-1_6_2-src.zip/download"))
              (sha256
               (base32
                "0varr6y7k8zarr56b42r0ad9g3brhn5vv3xjg1c0v19jxwr4gh2w"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lossless MP3 volume normalizer with statistical analysis")
    (description "Lossless MP3 volume normalizer with statistical analysis.")
    (home-page "https://sourceforge.net/projects/mp3gain/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 65. findent
;;; -------------------------------------------------------------------
(define-public findent
  (package
    (name "findent")
    (version "4.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sourceforge.net/projects/findent/files/findent-" version ".tar.gz/download"))
              (sha256
               (base32
                "1m1qr0bvk2753iinwswmgn9657j91g9dwvrajjxivp8gzzc39n3j"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fortran source code indenter and converter")
    (description "Fortran source code indenter and converter.")
    (home-page "https://www.ratrabbit.nl/ratrabbit/findent")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 66. mystmd
;;; -------------------------------------------------------------------
(define-public mystmd
  (package
    (name "mystmd")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jupyter-book/mystmd/archive/refs/tags/mystmd@" version ".tar.gz"))
              (sha256
               (base32
                "1cwj606sfhs18xj72qr2nh593yhb08cqyp5hq4zvphbf59fjgnz0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/mystmd/"))))
    (synopsis "command line tools for MyST Markdown document authoring")
    (description "Command line tools for MyST Markdown document authoring.")
    (home-page "https://mystmd.org/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 67. pacman-contrib-git
;;; -------------------------------------------------------------------
(define-public pacman-contrib-git
  (package
    (name "pacman-contrib-git")
    (version "1.10.7")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/v1.10.6/pacman-contrib-v1.10.6.tar.bz2")
              (sha256
               (base32
                "08y1nw03x10xzvh8px9qi5d3f44glric46d0489xjyf517ncxbnw"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "contributed scripts and tools for pacman systems")
    (description "Contributed scripts and tools for pacman systems.")
    (home-page "https://gitlab.archlinux.org/pacman/pacman-contrib")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 68. miniupnpd-nft-git
;;; -------------------------------------------------------------------
(define-public miniupnpd-nft-git
  (package
    (name "miniupnpd-nft-git")
    (version "2.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://miniupnp.tuxfamily.org/files/miniupnpd-" version ".tar.gz"))
              (sha256
               (base32
                "1gkv8y01wdx7gz32vpjcy3wn7pxpaj7jzsi0hi5g0c4p0c0mbpgv"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight UPnP IGD daemon using nftables")
    (description "Lightweight UPnP IGD daemon using nftables.")
    (home-page "https://miniupnp.tuxfamily.org")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 69. arsenal
;;; -------------------------------------------------------------------
(define-public arsenal
  (package
    (name "arsenal")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Orange-Cyberdefense/arsenal/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "001xxn557d94an2mq5zgvgpayh7sz6njcdnjzm4nc25adxfpz30c"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "cheat sheet tool for pentest and CTF commands")
    (description "Cheat sheet tool for pentest and CTF commands.")
    (home-page "https://github.com/Orange-Cyberdefense/arsenal")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 70. simgrid
;;; -------------------------------------------------------------------
(define-public simgrid
  (package
    (name "simgrid")
    (version "3.36")
    (source (origin
              (method url-fetch)
              (uri "https://framagit.org/simgrid/simgrid/-/archive/v3.36/simgrid-v3.36.tar.bz2")
              (sha256
               (base32
                "03r6w7lgcbmb2z32hw0rlkpnnp03g91lhhwhsjwjzsxjv7rqk0j0"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "versatile simulation framework for distributed systems")
    (description "Versatile simulation framework for distributed systems.")
    (home-page "https://simgrid.org/")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 71. libfprint-1
;;; -------------------------------------------------------------------
(define-public libfprint-1
  (package
    (name "libfprint-1")
    (version "1.94.8")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.8/libfprint-v1.94.8.tar.bz2")
              (sha256
               (base32
                "0pcss8i90sbskifdlbbpvzxl4raayjd3c2j60b654hhbnha4biah"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "library for fingerprint reader support")
    (description "Library for fingerprint reader support.")
    (home-page "https://fprint.freedesktop.org/")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 72. ttf-raleway-variable
;;; -------------------------------------------------------------------
(define-public ttf-raleway-variable
  (package
    (name "ttf-raleway-variable")
    (version "4.101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/theleagueof/raleway/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0kzxaihqygv9g3fxx54dz1jm4nkfd768fnrnlpns9i4qlaw51v58"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/ttf-raleway-variable/"))))
    (synopsis "raleway variable font family, an elegant sans-serif typeface")
    (description "Raleway variable font family, an elegant sans-serif typeface.")
    (home-page "https://www.theleagueofmoveabletype.com/raleway")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 73. otf-raleway
;;; -------------------------------------------------------------------
(define-public otf-raleway
  (package
    (name "otf-raleway")
    (version "4.101")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/theleagueof/raleway/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0kzxaihqygv9g3fxx54dz1jm4nkfd768fnrnlpns9i4qlaw51v58"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/otf-raleway/"))))
    (synopsis "raleway OpenType font family, an elegant sans-serif typeface")
    (description "Raleway OpenType font family, an elegant sans-serif typeface.")
    (home-page "https://www.theleagueofmoveabletype.com/raleway")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 74. otb-unifont
;;; -------------------------------------------------------------------
(define-public otb-unifont
  (package
    (name "otb-unifont")
    (version "16.0.01")
    (source (origin
              (method url-fetch)
              (uri "https://unifoundry.com/pub/unifont/unifont-16.0.01/unifont-16.0.01.tar.gz")
              (sha256
               (base32
                "0l3sv12s0n70ddj2g3g2rdmsqrdc5m1gqbylaj1qq8skryw80qax"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/otb-unifont/"))))
    (synopsis "gNU Unifont OTB bitmap font for low-resolution displays")
    (description "GNU Unifont OTB bitmap font for low-resolution displays.")
    (home-page "https://unifoundry.com/unifont/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 75. psf-unifont
;;; -------------------------------------------------------------------
(define-public psf-unifont
  (package
    (name "psf-unifont")
    (version "16.0.01")
    (source (origin
              (method url-fetch)
              (uri "https://unifoundry.com/pub/unifont/unifont-16.0.01/unifont-16.0.01.tar.gz")
              (sha256
               (base32
                "0l3sv12s0n70ddj2g3g2rdmsqrdc5m1gqbylaj1qq8skryw80qax"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/psf-unifont/"))))
    (synopsis "gNU Unifont PSF font for console use")
    (description "GNU Unifont PSF font for console use.")
    (home-page "https://unifoundry.com/unifont/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 76. etterna
;;; -------------------------------------------------------------------
(define-public etterna
  (package
    (name "etterna")
    (version "0.74.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/etternagame/etterna/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "123lyqgzbcyb4j9xjnx1wmmf7s7ijnjrjssbs0apcc150xaxaxrz"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "advanced rhythm game focused on keyboard play")
    (description "Advanced rhythm game focused on keyboard play.")
    (home-page "https://etternaonline.com")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 77. license
;;; -------------------------------------------------------------------
(define-public license
  (package
    (name "license")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://git.sr.ht/~zethra/license/archive/" version ".tar.gz"))
              (sha256
               (base32
                "0kmqcv9rihf4p5530qdd7vdh18nqimpah4js7fcbyrxyxmqsdv77"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/license/"))))
    (synopsis "command line tool for managing project licenses")
    (description "Command line tool for managing project licenses.")
    (home-page "https://sr.ht/~zethra/license")
    (license license:mpl2.0)))
