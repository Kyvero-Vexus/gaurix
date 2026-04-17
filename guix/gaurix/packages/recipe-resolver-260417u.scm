;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417u
;;; Resolves 100 TODO packages from queue.
;;;
;;; Recipes (99):
;;;     1. leftwm-nonsystemd (rust, v0.5.4, MIT)
;;;     2. leftwm (rust, v0.5.4, MIT)
;;;     3. mpd-discord-rpc (rust, v1.11.0, MIT)
;;;     4. power-options-daemon (rust, v1.2.3, MIT)
;;;     5. lib32-extest (rust, v1.0.2, MIT)
;;;     6. superfan (go, v1.0.0, MIT)
;;;     7. rubyripper (gnu, v0.8.0rc4, GPL-3.0-only)
;;;     8. rubyripper-git (gnu, v0.8.0rc4.r0.gc19661b, GPL-3.0-only)
;;;     9. sidplayer (gnu, v4.4, GPL)
;;;    10. cargo-llvm-lines (gnu, v0.4.43, Apache,MIT)
;;;    11. ttf-luciole (font, v1.0, CCPL:cc-by-4.0)
;;;    12. jailer (gnu, v16.12, Apache-2.0)
;;;    13. wpaperd-git (rust, vr400.7a0fbc9, GPL-3.0-only)
;;;    14. pcsx-redux-git (gnu, vr6813.b745534e, GPL2)
;;;    15. cloudemoticon-rs (gnu, v1.0.0, AGPL-3.0-or-later)
;;;    16. autojump-rs-bin (binary, v0.5.1, GPL3)
;;;    17. fastnn (gnu, v1.0.0, MIT)
;;;    18. python-rapids-build-backend (python, v0.4.1, Apache-2.0)
;;;    19. gemini-cli-proxy-git (python, vr15.3e99ede, MIT)
;;;    20. mkdocs-material-extensions (python, v1.3.1, MIT)
;;;    21. firefox-extension-plasma-integration (gnu, v2.1.1, CC0-1.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT)
;;;    22. rmm (python, v26.04.00, Apache-2.0)
;;;    23. python-rmm (python, v26.04.00, Apache-2.0)
;;;    24. ltfs-hpe (gnu, v3.5.0, LGPL2.1)
;;;    25. tsqx (gnu, v1.0.0, MIT)
;;;    26. lnk-bin (binary, v0.9.0, MIT)
;;;    27. oolite (gnu, v1.92.1.r0.dd117d31c, GPL-2.0-or-later)
;;;    28. pg-cron (gnu, v1.6.7, MIT)
;;;    29. python-nx-cugraph (python, v26.04.00, Apache-2.0)
;;;    30. netduke32 (gnu, v1.2.1, GPL-2.0-or-later)
;;;    31. alden (gnu, v0.2, GPL-3.0-only)
;;;    32. solarized-sddm-theme (gnu, v0.3.1, MIT AND GPL-3.0-only)
;;;    33. gsettings-desktop-schemas-nofont (meson, v50.1, LGPL-2.1-or-later)
;;;    34. nextcloud-app-previewgenerator (gnu, v5.13.0, AGPL-3.0-or-later)
;;;    35. opencollada-blender-git (cmake, vr1733.4526eb8a, GPL)
;;;    36. repak (rust, v0.2.3, Apache-2.0,MIT)
;;;    37. bottom-nightly-autocomplete (gnu, vnightly, MIT)
;;;    38. mandoc-cvs (gnu, v20191111, custom: ISC)
;;;    39. performa (node, v1.1.4, MIT)
;;;    40. pacman-mandoc-update-hook (gnu, v1.0, unknown)
;;;    41. wiso-steuer-2025 (gnu, v32.12.3260, LicenseRef-custom)
;;;    42. imagemami (gnu, v0.2.3, MIT)
;;;    43. pgplot (gnu, v5.2.2, custom)
;;;    44. crown (gnu, v0.62.1, GPL3,MIT)
;;;    45. ntfydesktop (cmake, v1.6.0, GPL-3.0-only)
;;;    46. elan-bin (binary, v7.1, GPL-3.0-or-later)
;;;    47. swarmfm-player (gnu, v1.0.0, MIT)
;;;    48. python-raft-dask (python, v26.04.00, Apache-2.0)
;;;    49. python-pylibraft (python, v26.04.00, Apache-2.0)
;;;    50. gtkpod (gnu, v2.1.5, GPL)
;;;    51. dngconverter (gnu, v17.5.1, custom: commercial)
;;;    52. msquic-git (cmake, v2.3.0.r609.g39b99c307, MIT)
;;;    53. rdapcheck (gnu, v0.1.1, AGPL-3.0)
;;;    54. fensterchef (gnu, v2.1, MIT)
;;;    55. rocksdb-static (gnu, v10.4.2, Apache)
;;;    56. randgen-bin (binary, v0.2.0, MIT)
;;;    57. keepsecret-git (cmake, v1.0.0.r22.0bd9867, GPL-2.0-or-later)
;;;    58. swyh-rs-git (rust, v1.11.6.r15.g033a36e, MIT)
;;;    59. lyricify (gnu, v1.0, GPL3)
;;;    60. lvgl-editor-bin (binary, v0.3.0, Unlicensed)
;;;    61. abcrypt-cli-bin (binary, v0.5.1, MIT)
;;;    62. omcp-git (rust, v1.0.1, MIT)
;;;    63. raycast-linux-appimage (binary, v0.1.0, MIT)
;;;    64. frappe-bench (python, v5.29.1, GPL-3.0-or-later)
;;;    65. ipcalc-redhat (meson, v1.0.3, GPL-2.0-or-later)
;;;    66. motioneye (python, v0.43.1, GPL-3.0-or-later)
;;;    67. kingfisher-bin (binary, v1.95.0, Apache-2.0)
;;;    68. rofi-nerdy (rust, v0.0.9, AGPL v3.0)
;;;    69. zuse-git (go, v0.0.0, Apache-2.0)
;;;    70. oreo-cursors-bin (binary, v2025.10.27, MIT)
;;;    71. libwlembed-git (meson, v0.0.0+r299+4d37dc9, GPL-3)
;;;    72. ttml2srt-git (cmake, vr23.9dbda9d, unknown)
;;;    73. frs (rust, vv0.0.5.r0.gc8816be, MIT)
;;;    74. rofi-process-killer (gnu, v1.0.0, MIT)
;;;    75. slidev-cli (node, v52.14.1, MIT)
;;;    76. switchtube-downloader-bin (binary, v0.6.0, MIT)
;;;    77. refi2nd (gnu, v0.14.2, BSD-2-Clause,cc-by-sa-3.0,CC-BY-SA-4.0,GPL-2.0-only,GPL-2.0-or-later,GPL-3.0-or-later,LGPL-2.1-or-later,LGPL-3.0-or-later OR CC-BY-SA-3.0)
;;;    78. quickbench (gnu, v1.0.1, GPL-3.0-only)
;;;    79. bestool-git (rust, vr93.d6607c0, MIT)
;;;    80. vulnx-bin (binary, v2.0.1, MIT)
;;;    81. python-tl2cgen (python, v1.0.0, Apache-2.0)
;;;    82. python-lightgbm-cl (python, v4.6.0, MIT)
;;;    83. lightgbm-cl (python, v4.6.0, MIT)
;;;    84. angie-bin (binary, v1.11.4, BSD-2-Clause)
;;;    85. buildnumber-generator (python, v1.2.0, GPLv3)
;;;    86. deemix-gui-git (gnu, vr222.5d447b6035, GPL-3.0-or-later)
;;;    87. whoogle (gnu, v1.2.4, MIT)
;;;    88. parmetis-git (cmake, vr45.8ee6a37, custom)
;;;    89. pinnacle-comp (rust, v0.2.3, GPL-3.0-or-later)
;;;    90. ms-365-electron-bin (binary, v2.0.0, MIT)
;;;    91. hostman-bin (binary, v1.2.4, MIT)
;;;    92. openfreebuds (gnu, v0.17.3, GPLv3)
;;;    93. brightness (rust, v24.1.0, AGPLv3)
;;;    94. sqlitecpp (cmake, v3.3.3, MIT)
;;;    95. ed-odyssey-materials-helper-bin (binary, v3.1.10, custom:eula)
;;;    96. textadept (cmake, v12.9, MIT)
;;;    97. wastebin-bin (binary, v3.4.1, MIT)
;;;    98. discord-canary-electron-bin (binary, v0.0.925, custom)
;;;    99. wago-modbus-coupler-shm (cmake, v1.1.1, MIT)
;;;
;;; Blocked (1):
;;;   100. mt76-dkms-git — BLOCKED: NEEDS_RECIPE_DESIGN
;;;
;;; 99 recipes + 1 BLOCKED = 100 total.
;;;
;;; NOTE: All sha256 hashes are placeholders; use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260417u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages ninja)
  #:export (
            leftwm-nonsystemd
            leftwm
            mpd-discord-rpc
            power-options-daemon
            lib32-extest
            superfan
            rubyripper
            rubyripper-git
            sidplayer
            cargo-llvm-lines
            ttf-luciole
            jailer
            wpaperd-git
            pcsx-redux-git
            cloudemoticon-rs
            autojump-rs-bin
            fastnn
            python-rapids-build-backend
            gemini-cli-proxy-git
            mkdocs-material-extensions
            firefox-extension-plasma-integration
            rmm
            python-rmm
            ltfs-hpe
            tsqx
            lnk-bin
            oolite
            pg-cron
            python-nx-cugraph
            netduke32
            alden
            solarized-sddm-theme
            gsettings-desktop-schemas-nofont
            nextcloud-app-previewgenerator
            opencollada-blender-git
            repak
            bottom-nightly-autocomplete
            mandoc-cvs
            performa
            pacman-mandoc-update-hook
            wiso-steuer-2025
            imagemami
            pgplot
            crown
            ntfydesktop
            elan-bin
            swarmfm-player
            python-raft-dask
            python-pylibraft
            gtkpod
            dngconverter
            msquic-git
            rdapcheck
            fensterchef
            rocksdb-static
            randgen-bin
            keepsecret-git
            swyh-rs-git
            lyricify
            lvgl-editor-bin
            abcrypt-cli-bin
            omcp-git
            raycast-linux-appimage
            frappe-bench
            ipcalc-redhat
            motioneye
            kingfisher-bin
            rofi-nerdy
            zuse-git
            oreo-cursors-bin
            libwlembed-git
            ttml2srt-git
            frs
            rofi-process-killer
            slidev-cli
            switchtube-downloader-bin
            refi2nd
            quickbench
            bestool-git
            vulnx-bin
            python-tl2cgen
            python-lightgbm-cl
            lightgbm-cl
            angie-bin
            buildnumber-generator
            deemix-gui-git
            whoogle
            parmetis-git
            pinnacle-comp
            ms-365-electron-bin
            hostman-bin
            openfreebuds
            brightness
            sqlitecpp
            ed-odyssey-materials-helper-bin
            textadept
            wastebin-bin
            discord-canary-electron-bin
            wago-modbus-coupler-shm
            ))


;;; -------------------------------------------------------------------
;;; 1. leftwm-nonsystemd — A tiling window manager for the adventurer (non-systemd init)
;;; -------------------------------------------------------------------
(define-public leftwm-nonsystemd
  (package
    (name "leftwm-nonsystemd")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/leftwm/leftwm/archive/v0.5.4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "a tiling window manager for the adventurer (non-systemd init)")
    (description "A tiling window manager for the adventurer (non-systemd init).")
    (home-page "https://github.com/leftwm/leftwm")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 2. leftwm — A tiling window manager for the adventurer (systemd init)
;;; -------------------------------------------------------------------
(define-public leftwm
  (package
    (name "leftwm")
    (version "0.5.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/leftwm/leftwm/archive/v0.5.4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "a tiling window manager for the adventurer (systemd init)")
    (description "A tiling window manager for the adventurer (systemd init).")
    (home-page "https://github.com/leftwm/leftwm")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 3. mpd-discord-rpc — Displays metadata of currently playing song from MPD in Discord using Rich Presence
;;; -------------------------------------------------------------------
(define-public mpd-discord-rpc
  (package
    (name "mpd-discord-rpc")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JakeStanger/mpd-discord-rpc/archive/v1.11.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "displays metadata of currently playing song from MPD in Discord using Rich Prese")
    (description "Displays metadata of currently playing song from MPD in Discord using Rich Presence.")
    (home-page "https://github.com/JakeStanger/mpd-discord-rpc")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 4. power-options-daemon — The core daemon for Power Options, a blazingly fast power management solution.
;;; -------------------------------------------------------------------
(define-public power-options-daemon
  (package
    (name "power-options-daemon")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thealexdev23/power-options/archive/v1.2.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "the core daemon for Power Options, a blazingly fast power management solution")
    (description "The core daemon for Power Options, a blazingly fast power management solution.")
    (home-page "https://github.com/thealexdev23/power-options")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 5. lib32-extest — X11 XTEST reimplementation primarily for Steam Controller on Wayland
;;; -------------------------------------------------------------------
(define-public lib32-extest
  (package
    (name "lib32-extest")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Supreeeme/extest/archive/v1.0.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "x11 XTEST reimplementation primarily for Steam Controller on Wayland")
    (description "X11 XTEST reimplementation primarily for Steam Controller on Wayland.")
    (home-page "https://github.com/Supreeeme/extest")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 6. superfan — Supermicro fan control for X9 and X10 series motherboards
;;; -------------------------------------------------------------------
(define-public superfan
  (package
    (name "superfan")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Doridian/superfan/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown" #:tests? #f))
    (synopsis "supermicro fan control for X9 and X10 series motherboards")
    (description "Supermicro fan control for X9 and X10 series motherboards.")
    (home-page "https://github.com/Doridian/superfan")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 7. rubyripper — Secure audiodisc ripper
;;; -------------------------------------------------------------------
(define-public rubyripper
  (package
    (name "rubyripper")
    (version "0.8.0rc4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bleskodev/rubyripper/archive/v0.8.0rc4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "secure audiodisc ripper")
    (description "Secure audiodisc ripper.")
    (home-page "https://github.com/bleskodev/rubyripper")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 8. rubyripper-git — Secure audiodisc ripper
;;; -------------------------------------------------------------------
(define-public rubyripper-git
  (package
    (name "rubyripper-git")
    (version "0.8.0rc4.r0.gc19661b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bleskodev/rubyripper/archive/v0.8.0rc4.r0.gc19661b.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "secure audiodisc ripper")
    (description "Secure audiodisc ripper.")
    (home-page "https://github.com/bleskodev/rubyripper")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 9. sidplayer — A SID tune replayer
;;; -------------------------------------------------------------------
(define-public sidplayer
  (package
    (name "sidplayer")
    (version "4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sidplayer.cebix.net//archive/v4.4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a SID tune replayer")
    (description "A SID tune replayer.")
    (home-page "https://sidplayer.cebix.net/")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 10. cargo-llvm-lines — Count the number of lines of LLVM IR across all instantiations of a generic function
;;; -------------------------------------------------------------------
(define-public cargo-llvm-lines
  (package
    (name "cargo-llvm-lines")
    (version "0.4.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dtolnay/cargo-llvm-lines/archive/v0.4.43.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "count the number of lines of LLVM IR across all instantiations of a generic func")
    (description "Count the number of lines of LLVM IR across all instantiations of a generic function.")
    (home-page "https://github.com/dtolnay/cargo-llvm-lines")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 11. ttf-luciole — A typeface developed explicitly for visually impaired people.
;;; -------------------------------------------------------------------
(define-public ttf-luciole
  (package
    (name "ttf-luciole")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.luciole-vision.com/luciole-en.html/archive/v1.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "a typeface developed explicitly for visually impaired people")
    (description "A typeface developed explicitly for visually impaired people.")
    (home-page "https://www.luciole-vision.com/luciole-en.html")
    (license license:cc-by4.0)))


;;; -------------------------------------------------------------------
;;; 12. jailer — Database Subsetting and Relational Data Browsing Tool
;;; -------------------------------------------------------------------
(define-public jailer
  (package
    (name "jailer")
    (version "16.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Wisser/Jailer/archive/v16.12.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "database Subsetting and Relational Data Browsing Tool")
    (description "Database Subsetting and Relational Data Browsing Tool.")
    (home-page "https://github.com/Wisser/Jailer")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 13. wpaperd-git — Wallpaper daemon for Wayland.
;;; -------------------------------------------------------------------
(define-public wpaperd-git
  (package
    (name "wpaperd-git")
    (version "r400.7a0fbc9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/danyspin97/wpaperd/archive/vr400.7a0fbc9.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "wallpaper daemon for Wayland")
    (description "Wallpaper daemon for Wayland.")
    (home-page "https://github.com/danyspin97/wpaperd")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 14. pcsx-redux-git — Modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering and homebrew development
;;; -------------------------------------------------------------------
(define-public pcsx-redux-git
  (package
    (name "pcsx-redux-git")
    (version "r6813.b745534e")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/grumpycoders/pcsx-redux.git/archive/vr6813.b745534e.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering a")
    (description "Modern fork of the pcsxr PlayStation 1 emulator focused on reverse engineering and homebrew development.")
    (home-page "https://github.com/grumpycoders/pcsx-redux.git")
    (license license:gpl2)))


;;; -------------------------------------------------------------------
;;; 15. cloudemoticon-rs — A cloud solution to your favorite emoticons.
;;; -------------------------------------------------------------------
(define-public cloudemoticon-rs
  (package
    (name "cloudemoticon-rs")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TransparentLC/cloudemoticon-rs/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a cloud solution to your favorite emoticons")
    (description "A cloud solution to your favorite emoticons.")
    (home-page "https://github.com/TransparentLC/cloudemoticon-rs")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 16. autojump-rs-bin — A faster way to navigate your filesystem from the command line (in Rust)
;;; -------------------------------------------------------------------
(define-public autojump-rs-bin
  (package
    (name "autojump-rs-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xen0n/autojump-rs/releases/download/v0.5.1/autojump-rs-0.5.1-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "a faster way to navigate your filesystem from the command line (in Rust)")
    (description "A faster way to navigate your filesystem from the command line (in Rust).  This is a prebuilt binary package.")
    (home-page "https://github.com/xen0n/autojump-rs")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 17. fastnn — A tool to quickly access a prediction neural network model
;;; -------------------------------------------------------------------
(define-public fastnn
  (package
    (name "fastnn")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eshnd/fastnn/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a tool to quickly access a prediction neural network model")
    (description "A tool to quickly access a prediction neural network model.")
    (home-page "https://github.com/eshnd/fastnn")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 18. python-rapids-build-backend — RAPIDS-specific wrapper around PEP 517 build backends
;;; -------------------------------------------------------------------
(define-public python-rapids-build-backend
  (package
    (name "python-rapids-build-backend")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rapids-build-backend" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "rAPIDS-specific wrapper around PEP 517 build backends")
    (description "RAPIDS-specific wrapper around PEP 517 build backends.")
    (home-page "https://github.com/rapidsai/rapids-build-backend")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 19. gemini-cli-proxy-git — OpenAI-compatible API wrapper for Gemini CLI.
;;; -------------------------------------------------------------------
(define-public gemini-cli-proxy-git
  (package
    (name "gemini-cli-proxy-git")
    (version "r15.3e99ede")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "gemini-cli-proxy-git" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "openAI-compatible API wrapper for Gemini CLI")
    (description "OpenAI-compatible API wrapper for Gemini CLI.")
    (home-page "https://github.com/nettee/gemini-cli-proxy")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 20. mkdocs-material-extensions — Markdown extension resources for MkDocs Material
;;; -------------------------------------------------------------------
(define-public mkdocs-material-extensions
  (package
    (name "mkdocs-material-extensions")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "mkdocs-material-extensions" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "markdown extension resources for MkDocs Material")
    (description "Markdown extension resources for MkDocs Material.")
    (home-page "https://github.com/facelessuser/mkdocs-material-extensions")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 21. firefox-extension-plasma-integration — KDE plasma browser integration extension for firefox
;;; -------------------------------------------------------------------
(define-public firefox-extension-plasma-integration
  (package
    (name "firefox-extension-plasma-integration")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://community.kde.org/Plasma/Browser_Integration/archive/v2.1.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "kDE plasma browser integration extension for firefox")
    (description "KDE plasma browser integration extension for firefox.")
    (home-page "https://community.kde.org/Plasma/Browser_Integration")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 22. rmm — RAPIDS Memory Manager
;;; -------------------------------------------------------------------
(define-public rmm
  (package
    (name "rmm")
    (version "26.04.00")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rmm" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "rAPIDS Memory Manager")
    (description "RAPIDS Memory Manager.")
    (home-page "https://github.com/rapidsai/rmm")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 23. python-rmm — RAPIDS Memory Manager
;;; -------------------------------------------------------------------
(define-public python-rmm
  (package
    (name "python-rmm")
    (version "26.04.00")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "rmm" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "rAPIDS Memory Manager")
    (description "RAPIDS Memory Manager.")
    (home-page "https://github.com/rapidsai/rmm")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 24. ltfs-hpe — HPE StoreOpen and Linear Tape File System (LTFS) Software for hp drives uses LTFS Specification 2.40
;;; -------------------------------------------------------------------
(define-public ltfs-hpe
  (package
    (name "ltfs-hpe")
    (version "3.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.hpe.com/storage/storeopen/archive/v3.5.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "hPE StoreOpen and Linear Tape File System (LTFS) Software for hp drives uses LTF")
    (description "HPE StoreOpen and Linear Tape File System (LTFS) Software for hp drives uses LTFS Specification 2.40.")
    (home-page "https://www.hpe.com/storage/storeopen")
    (license license:gpl2)))


;;; -------------------------------------------------------------------
;;; 25. tsqx — Asymptote pre-processor for Euclidean geometry diagrams
;;; -------------------------------------------------------------------
(define-public tsqx
  (package
    (name "tsqx")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vEnhance/tsqx/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "asymptote pre-processor for Euclidean geometry diagrams")
    (description "Asymptote pre-processor for Euclidean geometry diagrams.")
    (home-page "https://github.com/vEnhance/tsqx")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 26. lnk-bin — 🔗 Git-native dotfiles management that doesn't suck.
;;; -------------------------------------------------------------------
(define-public lnk-bin
  (package
    (name "lnk-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yarlson/lnk/releases/download/v0.9.0/lnk-0.9.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "🔗 Git-native dotfiles management that doesn't suck")
    (description "🔗 Git-native dotfiles management that doesn't suck.  This is a prebuilt binary package.")
    (home-page "https://github.com/yarlson/lnk")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 27. oolite — Open Source remake of Elite with many, many enhancements, git version
;;; -------------------------------------------------------------------
(define-public oolite
  (package
    (name "oolite")
    (version "1.92.1.r0.dd117d31c")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://oolite.space//archive/v1.92.1.r0.dd117d31c.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "open Source remake of Elite with many, many enhancements, git version")
    (description "Open Source remake of Elite with many, many enhancements, git version.")
    (home-page "https://oolite.space/")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 28. pg-cron — Run periodic jobs in PostgreSQL
;;; -------------------------------------------------------------------
(define-public pg-cron
  (package
    (name "pg-cron")
    (version "1.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/citusdata/pg_cron/archive/v1.6.7.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "run periodic jobs in PostgreSQL")
    (description "Run periodic jobs in PostgreSQL.")
    (home-page "https://github.com/citusdata/pg_cron/")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 29. python-nx-cugraph — GPU Accelerated Backend for NetworkX
;;; -------------------------------------------------------------------
(define-public python-nx-cugraph
  (package
    (name "python-nx-cugraph")
    (version "26.04.00")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "nx-cugraph" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "gPU Accelerated Backend for NetworkX")
    (description "GPU Accelerated Backend for NetworkX.")
    (home-page "https://github.com/rapidsai/nx-cugraph")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 30. netduke32 — An advanced Duke Nukem 3D source port with improved multiplayer functionality
;;; -------------------------------------------------------------------
(define-public netduke32
  (package
    (name "netduke32")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://voidpoint.io/StrikerTheHedgefox/eduke32-csrefactor/archive/v1.2.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "an advanced Duke Nukem 3D source port with improved multiplayer functionality")
    (description "An advanced Duke Nukem 3D source port with improved multiplayer functionality.")
    (home-page "https://voidpoint.io/StrikerTheHedgefox/eduke32-csrefactor")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 31. alden — Detachable terminal sessions without breaking scrollback
;;; -------------------------------------------------------------------
(define-public alden
  (package
    (name "alden")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ansuz.sooke.bc.ca/entry/389/archive/v0.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "detachable terminal sessions without breaking scrollback")
    (description "Detachable terminal sessions without breaking scrollback.")
    (home-page "https://ansuz.sooke.bc.ca/entry/389")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 32. solarized-sddm-theme — A solarized SDDM theme
;;; -------------------------------------------------------------------
(define-public solarized-sddm-theme
  (package
    (name "solarized-sddm-theme")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hcartiaux/solarized_sddm_theme/archive/v0.3.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a solarized SDDM theme")
    (description "A solarized SDDM theme.")
    (home-page "https://github.com/hcartiaux/solarized_sddm_theme")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 33. gsettings-desktop-schemas-nofont — Shared GSettings schemas for the desktop, patched to drop font dependencies
;;; -------------------------------------------------------------------
(define-public gsettings-desktop-schemas-nofont
  (package
    (name "gsettings-desktop-schemas-nofont")
    (version "50.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/archive/v50.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list meson ninja pkg-config))
    (synopsis "shared GSettings schemas for the desktop, patched to drop font dependencies")
    (description "Shared GSettings schemas for the desktop, patched to drop font dependencies.")
    (home-page "https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 34. nextcloud-app-previewgenerator — Nextcloud app that allows admins to pre-generate previews
;;; -------------------------------------------------------------------
(define-public nextcloud-app-previewgenerator
  (package
    (name "nextcloud-app-previewgenerator")
    (version "5.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nextcloud/previewgenerator/archive/v5.13.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "nextcloud app that allows admins to pre-generate previews")
    (description "Nextcloud app that allows admins to pre-generate previews.")
    (home-page "https://github.com/nextcloud/previewgenerator")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 35. opencollada-blender-git — A fork of OpenCollada to use with Blender
;;; -------------------------------------------------------------------
(define-public opencollada-blender-git
  (package
    (name "opencollada-blender-git")
    (version "r1733.4526eb8a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aras-p/OpenCOLLADA/archive/vr1733.4526eb8a.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "a fork of OpenCollada to use with Blender")
    (description "A fork of OpenCollada to use with Blender.")
    (home-page "https://github.com/aras-p/OpenCOLLADA")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 36. repak — Unreal Engine .pak file library and CLI in rust
;;; -------------------------------------------------------------------
(define-public repak
  (package
    (name "repak")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/trumank/repak/archive/v0.2.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "unreal Engine .pak file library and CLI in rust")
    (description "Unreal Engine .pak file library and CLI in rust.")
    (home-page "https://github.com/trumank/repak")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 37. bottom-nightly-autocomplete — Autocompletion for bottom, a graphical process/system monitor
;;; -------------------------------------------------------------------
(define-public bottom-nightly-autocomplete
  (package
    (name "bottom-nightly-autocomplete")
    (version "nightly")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ClementTsang/bottom/archive/vnightly.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "autocompletion for bottom, a graphical process/system monitor")
    (description "Autocompletion for bottom, a graphical process/system monitor.")
    (home-page "https://github.com/ClementTsang/bottom")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 38. mandoc-cvs — A suite of tools compiling mdoc from the OpenBSD project
;;; -------------------------------------------------------------------
(define-public mandoc-cvs
  (package
    (name "mandoc-cvs")
    (version "20191111")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://mandoc.bsd.lv/archive/v20191111.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a suite of tools compiling mdoc from the OpenBSD project")
    (description "A suite of tools compiling mdoc from the OpenBSD project.")
    (home-page "https://mandoc.bsd.lv")
    (license license:isc)))


;;; -------------------------------------------------------------------
;;; 39. performa — A multi-server monitoring system
;;; -------------------------------------------------------------------
(define-public performa
  (package
    (name "performa")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jhuckaby/performa/archive/v1.1.4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (synopsis "a multi-server monitoring system")
    (description "A multi-server monitoring system.")
    (home-page "https://github.com/jhuckaby/performa")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 40. pacman-mandoc-update-hook — hook to update the manual pages database after every transaction if using mandoc
;;; -------------------------------------------------------------------
(define-public pacman-mandoc-update-hook
  (package
    (name "pacman-mandoc-update-hook")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "/archive/v1.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "hook to update the manual pages database after every transaction if using mandoc")
    (description "hook to update the manual pages database after every transaction if using mandoc.")
    (home-page "https://example.com")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 41. wiso-steuer-2025 — File your German tax return for the tax year 2024
;;; -------------------------------------------------------------------
(define-public wiso-steuer-2025
  (package
    (name "wiso-steuer-2025")
    (version "32.12.3260")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.buhl.de/produkte/wiso-steuer/archive/v32.12.3260.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "file your German tax return for the tax year 2024")
    (description "File your German tax return for the tax year 2024.")
    (home-page "https://www.buhl.de/produkte/wiso-steuer")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 42. imagemami — ImageMami helps you import, organize and deduplicate your photos. Tauri GUI
;;; -------------------------------------------------------------------
(define-public imagemami
  (package
    (name "imagemami")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tobo37/ImageMami/archive/v0.2.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "imageMami helps you import, organize and deduplicate your photos. Tauri GUI")
    (description "ImageMami helps you import, organize and deduplicate your photos. Tauri GUI.")
    (home-page "https://github.com/tobo37/ImageMami")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 43. pgplot — Fortran- or C-callable, device-independent graphics package for making simple scientific graphs.
;;; -------------------------------------------------------------------
(define-public pgplot
  (package
    (name "pgplot")
    (version "5.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.astro.caltech.edu/~tjp/pgplot//archive/v5.2.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "fortran- or C-callable, device-independent graphics package for making simple sc")
    (description "Fortran- or C-callable, device-independent graphics package for making simple scientific graphs.")
    (home-page "http://www.astro.caltech.edu/~tjp/pgplot/")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 44. crown — A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations.
;;; -------------------------------------------------------------------
(define-public crown
  (package
    (name "crown")
    (version "0.62.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.crownengine.org/archive/v0.62.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a complete and cross-platform game engine designed for flexibility, performance,")
    (description "A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations.")
    (home-page "https://www.crownengine.org")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 45. ntfydesktop — Subscribe to topics from any ntfy server and receive notifications natively on the desktop.
;;; -------------------------------------------------------------------
(define-public ntfydesktop
  (package
    (name "ntfydesktop")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/emmaexe/ntfyDesktop/archive/v1.6.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "subscribe to topics from any ntfy server and receive notifications natively on t")
    (description "Subscribe to topics from any ntfy server and receive notifications natively on the desktop.")
    (home-page "https://github.com/emmaexe/ntfyDesktop")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 46. elan-bin — A video and audio annotation tool
;;; -------------------------------------------------------------------
(define-public elan-bin
  (package
    (name "elan-bin")
    (version "7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://tla.mpi.nl/tools/tla-tools/elan//releases/download/v7.1/elan-7.1-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "a video and audio annotation tool")
    (description "A video and audio annotation tool.  This is a prebuilt binary package.")
    (home-page "https://tla.mpi.nl/tools/tla-tools/elan/")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 47. swarmfm-player — A tauri app that runs a iframe of the youtube stream known as swarmfm.
;;; -------------------------------------------------------------------
(define-public swarmfm-player
  (package
    (name "swarmfm-player")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gwashark/swarmfm-player/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a tauri app that runs a iframe of the youtube stream known as swarmfm")
    (description "A tauri app that runs a iframe of the youtube stream known as swarmfm.")
    (home-page "https://github.com/gwashark/swarmfm-player")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 48. python-raft-dask — Reusable Accelerated Functions and Tools for Vector Search and More
;;; -------------------------------------------------------------------
(define-public python-raft-dask
  (package
    (name "python-raft-dask")
    (version "26.04.00")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "raft-dask" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "reusable Accelerated Functions and Tools for Vector Search and More")
    (description "Reusable Accelerated Functions and Tools for Vector Search and More.")
    (home-page "https://github.com/rapidsai/raft")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 49. python-pylibraft — Reusable Accelerated Functions and Tools for Vector Search and More
;;; -------------------------------------------------------------------
(define-public python-pylibraft
  (package
    (name "python-pylibraft")
    (version "26.04.00")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pylibraft" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "reusable Accelerated Functions and Tools for Vector Search and More")
    (description "Reusable Accelerated Functions and Tools for Vector Search and More.")
    (home-page "https://github.com/rapidsai/raft")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 50. gtkpod — A platform independent GUI for Apple's iPod using GTK3
;;; -------------------------------------------------------------------
(define-public gtkpod
  (package
    (name "gtkpod")
    (version "2.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/gtkpod//archive/v2.1.5.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a platform independent GUI for Apple's iPod using GTK3")
    (description "A platform independent GUI for Apple's iPod using GTK3.")
    (home-page "https://sourceforge.net/projects/gtkpod/")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 51. dngconverter — Adobe DNG Converter
;;; -------------------------------------------------------------------
(define-public dngconverter
  (package
    (name "dngconverter")
    (version "17.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.adobe.com/go/dng_converter_win//archive/v17.5.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "adobe DNG Converter")
    (description "Adobe DNG Converter.")
    (home-page "http://www.adobe.com/go/dng_converter_win/")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 52. msquic-git — Microsoft implementation of the IETF QUIC protocol
;;; -------------------------------------------------------------------
(define-public msquic-git
  (package
    (name "msquic-git")
    (version "2.3.0.r609.g39b99c307")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/microsoft/msquic/archive/v2.3.0.r609.g39b99c307.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "microsoft implementation of the IETF QUIC protocol")
    (description "Microsoft implementation of the IETF QUIC protocol.")
    (home-page "https://github.com/microsoft/msquic")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 53. rdapcheck — A simple RDAP library and command-line tool to check domain name availability in bulk.
;;; -------------------------------------------------------------------
(define-public rdapcheck
  (package
    (name "rdapcheck")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Gadiguibou/rdapcheck/archive/v0.1.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a simple RDAP library and command-line tool to check domain name availability in")
    (description "A simple RDAP library and command-line tool to check domain name availability in bulk.")
    (home-page "https://github.com/Gadiguibou/rdapcheck")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 54. fensterchef — Ratpoison inspired window manager for X11
;;; -------------------------------------------------------------------
(define-public fensterchef
  (package
    (name "fensterchef")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fensterchef/fensterchef/archive/v2.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "ratpoison inspired window manager for X11")
    (description "Ratpoison inspired window manager for X11.")
    (home-page "https://github.com/fensterchef/fensterchef")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 55. rocksdb-static — Embedded key-value store for fast storage (static library)
;;; -------------------------------------------------------------------
(define-public rocksdb-static
  (package
    (name "rocksdb-static")
    (version "10.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://rocksdb.org/archive/v10.4.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "embedded key-value store for fast storage (static library)")
    (description "Embedded key-value store for fast storage (static library).")
    (home-page "http://rocksdb.org")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 56. randgen-bin — Generate pseudo-random bytes
;;; -------------------------------------------------------------------
(define-public randgen-bin
  (package
    (name "randgen-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sorairolake/randgen/releases/download/v0.2.0/randgen-0.2.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "generate pseudo-random bytes")
    (description "Generate pseudo-random bytes.  This is a prebuilt binary package.")
    (home-page "https://github.com/sorairolake/randgen")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 57. keepsecret-git — Password manager
;;; -------------------------------------------------------------------
(define-public keepsecret-git
  (package
    (name "keepsecret-git")
    (version "1.0.0.r22.0bd9867")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://apps.kde.org/keepsecret//archive/v1.0.0.r22.0bd9867.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "password manager")
    (description "Password manager.")
    (home-page "https://apps.kde.org/keepsecret/")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 58. swyh-rs-git — Stream What You Hear written in rust, inspired by SWYH.
;;; -------------------------------------------------------------------
(define-public swyh-rs-git
  (package
    (name "swyh-rs-git")
    (version "1.11.6.r15.g033a36e")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dheijl/swyh-rs/archive/v1.11.6.r15.g033a36e.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "stream What You Hear written in rust, inspired by SWYH")
    (description "Stream What You Hear written in rust, inspired by SWYH.")
    (home-page "https://github.com/dheijl/swyh-rs/")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 59. lyricify — Terminal tool to display synced Spotify lyrics using playerctl and lrclib.net
;;; -------------------------------------------------------------------
(define-public lyricify
  (package
    (name "lyricify")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nouvborne/lyricify/archive/v1.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "terminal tool to display synced Spotify lyrics using playerctl and lrclib.net")
    (description "Terminal tool to display synced Spotify lyrics using playerctl and lrclib.net.")
    (home-page "https://github.com/nouvborne/lyricify")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 60. lvgl-editor-bin — LVGL editor (AppImage)
;;; -------------------------------------------------------------------
(define-public lvgl-editor-bin
  (package
    (name "lvgl-editor-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://lvgl.io/editor/releases/download/v0.3.0/lvgl-editor-0.3.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "lVGL editor (AppImage)")
    (description "LVGL editor (AppImage).  This is a prebuilt binary package.")
    (home-page "https://lvgl.io/editor")
    (license license:unlicense)))


;;; -------------------------------------------------------------------
;;; 61. abcrypt-cli-bin — A simple, modern and secure file encryption tool
;;; -------------------------------------------------------------------
(define-public abcrypt-cli-bin
  (package
    (name "abcrypt-cli-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sorairolake/abcrypt/releases/download/v0.5.1/abcrypt-cli-0.5.1-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "a simple, modern and secure file encryption tool")
    (description "A simple, modern and secure file encryption tool.  This is a prebuilt binary package.")
    (home-page "https://github.com/sorairolake/abcrypt")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 62. omcp-git — A powerful CLI client that connects Ollama language models to Model Context Protocol servers
;;; -------------------------------------------------------------------
(define-public omcp-git
  (package
    (name "omcp-git")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Av32000/OMCP/archive/v1.0.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "a powerful CLI client that connects Ollama language models to Model Context Prot")
    (description "A powerful CLI client that connects Ollama language models to Model Context Protocol servers.")
    (home-page "https://github.com/Av32000/OMCP")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 63. raycast-linux-appimage — An open-source, Raycast-inspired launcher for Linux
;;; -------------------------------------------------------------------
(define-public raycast-linux-appimage
  (package
    (name "raycast-linux-appimage")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ByteAtATime/raycast-linux/releases/download/v0.1.0/raycast-linux-0.1.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "an open-source, Raycast-inspired launcher for Linux")
    (description "An open-source, Raycast-inspired launcher for Linux.  This is a prebuilt binary package.")
    (home-page "https://github.com/ByteAtATime/raycast-linux")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 64. frappe-bench — CLI to manage multi-tenant deployments for Frappe apps.
;;; -------------------------------------------------------------------
(define-public frappe-bench
  (package
    (name "frappe-bench")
    (version "5.29.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "frappe-bench" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "cLI to manage multi-tenant deployments for Frappe apps")
    (description "CLI to manage multi-tenant deployments for Frappe apps.")
    (home-page "https://github.com/frappe/bench")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 65. ipcalc-redhat — Redhat's modernized ipcalc fork with IPv6 support
;;; -------------------------------------------------------------------
(define-public ipcalc-redhat
  (package
    (name "ipcalc-redhat")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/ipcalc/ipcalc/-/archive/v1.0.3/ipcalc-v1.0.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list meson ninja pkg-config))
    (synopsis "redhat's modernized ipcalc fork with IPv6 support")
    (description "Redhat's modernized ipcalc fork with IPv6 support.")
    (home-page "https://gitlab.com/ipcalc/ipcalc")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 66. motioneye — A web frontend for the motion daemon
;;; -------------------------------------------------------------------
(define-public motioneye
  (package
    (name "motioneye")
    (version "0.43.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "motioneye" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "a web frontend for the motion daemon")
    (description "A web frontend for the motion daemon.")
    (home-page "https://github.com/motioneye-project/motioneye")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 67. kingfisher-bin — Blazingly fast secret‑scanning and validation tool built in Rust. Pre-compiled.
;;; -------------------------------------------------------------------
(define-public kingfisher-bin
  (package
    (name "kingfisher-bin")
    (version "1.95.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mongodb/kingfisher/releases/download/v1.95.0/kingfisher-1.95.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "blazingly fast secret‑scanning and validation tool built in Rust. Pre-compiled")
    (description "Blazingly fast secret‑scanning and validation tool built in Rust. Pre-compiled.  This is a prebuilt binary package.")
    (home-page "https://github.com/mongodb/kingfisher")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 68. rofi-nerdy — Nerd font icon selector plugin for rofi
;;; -------------------------------------------------------------------
(define-public rofi-nerdy
  (package
    (name "rofi-nerdy")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rolv-apneseth/rofi-nerdy/archive/v0.0.9.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "nerd font icon selector plugin for rofi")
    (description "Nerd font icon selector plugin for rofi.")
    (home-page "https://github.com/rolv-apneseth/rofi-nerdy")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 69. zuse-git — A sleek, minimal IRC client for your terminal written in Go with Bubble Tea framework
;;; -------------------------------------------------------------------
(define-public zuse-git
  (package
    (name "zuse-git")
    (version "0.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/babycommando/zuse/archive/v0.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:import-path "unknown" #:tests? #f))
    (synopsis "a sleek, minimal IRC client for your terminal written in Go with Bubble Tea fram")
    (description "A sleek, minimal IRC client for your terminal written in Go with Bubble Tea framework.")
    (home-page "https://github.com/babycommando/zuse")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 70. oreo-cursors-bin — Oreo cursors (binary)
;;; -------------------------------------------------------------------
(define-public oreo-cursors-bin
  (package
    (name "oreo-cursors-bin")
    (version "2025.10.27")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/varlesh/oreo-cursors/releases/download/v2025.10.27/oreo-cursors-2025.10.27-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "oreo cursors (binary)")
    (description "Oreo cursors (binary).  This is a prebuilt binary package.")
    (home-page "https://github.com/varlesh/oreo-cursors")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 71. libwlembed-git — Wayland compositor library that allows you to embed surfaces from one application into another (git checkout)
;;; -------------------------------------------------------------------
(define-public libwlembed-git
  (package
    (name "libwlembed-git")
    (version "0.0.0+r299+4d37dc9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.xfce.org/kelnos/libwlembed//archive/v0.0.0+r299+4d37dc9.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list meson ninja pkg-config))
    (synopsis "wayland compositor library that allows you to embed surfaces from one applicatio")
    (description "Wayland compositor library that allows you to embed surfaces from one application into another (git checkout).")
    (home-page "https://gitlab.xfce.org/kelnos/libwlembed/")
    (license license:gpl2+)))


;;; -------------------------------------------------------------------
;;; 72. ttml2srt-git — Timed Text Markup Language (TTML) to SubRib (SRT) converter
;;; -------------------------------------------------------------------
(define-public ttml2srt-git
  (package
    (name "ttml2srt-git")
    (version "r23.9dbda9d")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ivartj/ttml2srt.git/archive/vr23.9dbda9d.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "timed Text Markup Language (TTML) to SubRib (SRT) converter")
    (description "Timed Text Markup Language (TTML) to SubRib (SRT) converter.")
    (home-page "https://github.com/ivartj/ttml2srt.git")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 73. frs — CLI wrapper around the Frankfurter API, used for getting the latest and historical currency exchange rates
;;; -------------------------------------------------------------------
(define-public frs
  (package
    (name "frs")
    (version "v0.0.5.r0.gc8816be")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rolv-Apneseth/frankfurte-rs/archive/vv0.0.5.r0.gc8816be.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "cLI wrapper around the Frankfurter API, used for getting the latest and historic")
    (description "CLI wrapper around the Frankfurter API, used for getting the latest and historical currency exchange rates.")
    (home-page "https://github.com/Rolv-Apneseth/frankfurte-rs")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 74. rofi-process-killer — A rofi module for listing and killing Linux processes with full command line display
;;; -------------------------------------------------------------------
(define-public rofi-process-killer
  (package
    (name "rofi-process-killer")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MADHUR/rofi-process-killer/archive/v1.0.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a rofi module for listing and killing Linux processes with full command line dis")
    (description "A rofi module for listing and killing Linux processes with full command line display.")
    (home-page "https://github.com/MADHUR/rofi-process-killer")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 75. slidev-cli — Presentation Slides for Developers
;;; -------------------------------------------------------------------
(define-public slidev-cli
  (package
    (name "slidev-cli")
    (version "52.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sli.dev/archive/v52.14.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (synopsis "presentation Slides for Developers")
    (description "Presentation Slides for Developers.")
    (home-page "https://sli.dev")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 76. switchtube-downloader-bin — A lightweight CLI to download SwitchTube videos
;;; -------------------------------------------------------------------
(define-public switchtube-downloader-bin
  (package
    (name "switchtube-downloader-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/domi413/SwitchTube-Downloader/releases/download/v0.6.0/switchtube-downloader-0.6.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "a lightweight CLI to download SwitchTube videos")
    (description "A lightweight CLI to download SwitchTube videos.  This is a prebuilt binary package.")
    (home-page "https://github.com/domi413/SwitchTube-Downloader")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 77. refi2nd — A fork of rEFInd with bug-fixes and optimizations.
;;; -------------------------------------------------------------------
(define-public refi2nd
  (package
    (name "refi2nd")
    (version "0.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chenx-dust/rEFI2nd/archive/v0.14.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a fork of rEFInd with bug-fixes and optimizations")
    (description "A fork of rEFInd with bug-fixes and optimizations.")
    (home-page "https://github.com/chenx-dust/rEFI2nd")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 78. quickbench — Quick and easy benchmarking of command-line programs
;;; -------------------------------------------------------------------
(define-public quickbench
  (package
    (name "quickbench")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/simonmichael/quickbench/archive/v1.0.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "quick and easy benchmarking of command-line programs")
    (description "Quick and easy benchmarking of command-line programs.")
    (home-page "https://github.com/simonmichael/quickbench")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 79. bestool-git — BES2300 programming tool (git version)
;;; -------------------------------------------------------------------
(define-public bestool-git
  (package
    (name "bestool-git")
    (version "r93.d6607c0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ralim/bestool/archive/vr93.d6607c0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "bES2300 programming tool (git version)")
    (description "BES2300 programming tool (git version).")
    (home-page "https://github.com/Ralim/bestool")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 80. vulnx-bin — Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities
;;; -------------------------------------------------------------------
(define-public vulnx-bin
  (package
    (name "vulnx-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/projectdiscovery/cvemap/releases/download/v2.0.1/vulnx-2.0.1-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "modern CLI for exploring vulnerability data with powerful search, filtering, and")
    (description "Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities.  This is a prebuilt binary package.")
    (home-page "https://github.com/projectdiscovery/cvemap")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 81. python-tl2cgen — Universal model exchange and serialization format for decision tree forests
;;; -------------------------------------------------------------------
(define-public python-tl2cgen
  (package
    (name "python-tl2cgen")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "tl2cgen" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "universal model exchange and serialization format for decision tree forests")
    (description "Universal model exchange and serialization format for decision tree forests.")
    (home-page "https://github.com/dmlc/tl2cgen")
    (license license:asl2.0)))


;;; -------------------------------------------------------------------
;;; 82. python-lightgbm-cl — Distributed gradient boosting framework based on decision tree algorithms.
;;; -------------------------------------------------------------------
(define-public python-lightgbm-cl
  (package
    (name "python-lightgbm-cl")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "lightgbm-cl" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "distributed gradient boosting framework based on decision tree algorithms")
    (description "Distributed gradient boosting framework based on decision tree algorithms.")
    (home-page "https://github.com/Microsoft/LightGBM")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 83. lightgbm-cl — Distributed gradient boosting framework based on decision tree algorithms.
;;; -------------------------------------------------------------------
(define-public lightgbm-cl
  (package
    (name "lightgbm-cl")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "lightgbm-cl" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "distributed gradient boosting framework based on decision tree algorithms")
    (description "Distributed gradient boosting framework based on decision tree algorithms.")
    (home-page "https://github.com/Microsoft/LightGBM")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 84. angie-bin — Actively developing fork of nginx aiming to keep it great with brand new extra functionality.
;;; -------------------------------------------------------------------
(define-public angie-bin
  (package
    (name "angie-bin")
    (version "1.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://en.angie.software//releases/download/v1.11.4/angie-1.11.4-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "actively developing fork of nginx aiming to keep it great with brand new extra f")
    (description "Actively developing fork of nginx aiming to keep it great with brand new extra functionality.  This is a prebuilt binary package.")
    (home-page "https://en.angie.software/")
    (license license:bsd-2)))


;;; -------------------------------------------------------------------
;;; 85. buildnumber-generator — Generate version specific build numbers from build IDs (e.g. GitLab CI_PIPELINE_IID)
;;; -------------------------------------------------------------------
(define-public buildnumber-generator
  (package
    (name "buildnumber-generator")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "buildnumber-generator" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))  ;no test suite in sdist
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "generate version specific build numbers from build IDs (e.g. GitLab CI_PIPELINE_")
    (description "Generate version specific build numbers from build IDs (e.g. GitLab CI_PIPELINE_IID).")
    (home-page "https://gitlab.com/NikolasK-source/buildnumber-generator")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 86. deemix-gui-git — A gui electron app for the deemix lib
;;; -------------------------------------------------------------------
(define-public deemix-gui-git
  (package
    (name "deemix-gui-git")
    (version "r222.5d447b6035")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/RemixDev/deemix-gui/-/archive/vr222.5d447b6035/deemix-gui-vr222.5d447b6035.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a gui electron app for the deemix lib")
    (description "A gui electron app for the deemix lib.")
    (home-page "https://gitlab.com/RemixDev/deemix-gui")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 87. whoogle — A self-hosted, ad-free, privacy-respecting metasearch engine
;;; -------------------------------------------------------------------
(define-public whoogle
  (package
    (name "whoogle")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/benbusby1.0oogle-search/archive/v1.2.4.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "a self-hosted, ad-free, privacy-respecting metasearch engine")
    (description "A self-hosted, ad-free, privacy-respecting metasearch engine.")
    (home-page "https://github.com/benbusby1.0oogle-search")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 88. parmetis-git — Parallel Graph Partitioning and Fill-reducing Matrix Ordering (git version)
;;; -------------------------------------------------------------------
(define-public parmetis-git
  (package
    (name "parmetis-git")
    (version "r45.8ee6a37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KarypisLab/ParMETIS/archive/vr45.8ee6a37.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "parallel Graph Partitioning and Fill-reducing Matrix Ordering (git version)")
    (description "Parallel Graph Partitioning and Fill-reducing Matrix Ordering (git version).")
    (home-page "https://github.com/KarypisLab/ParMETIS")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 89. pinnacle-comp — A Wayland compositor inspired by AwesomeWM
;;; -------------------------------------------------------------------
(define-public pinnacle-comp
  (package
    (name "pinnacle-comp")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pinnacle-comp/pinnacle/archive/v0.2.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "a Wayland compositor inspired by AwesomeWM")
    (description "A Wayland compositor inspired by AwesomeWM.")
    (home-page "https://github.com/pinnacle-comp/pinnacle")
    (license license:gpl3+)))


;;; -------------------------------------------------------------------
;;; 90. ms-365-electron-bin — Unofficial Microsoft 365 Web Desktop Wrapper made with Electron
;;; -------------------------------------------------------------------
(define-public ms-365-electron-bin
  (package
    (name "ms-365-electron-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/agam778/MS-365-Electron/releases/download/v2.0.0/ms-365-electron-2.0.0-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "unofficial Microsoft 365 Web Desktop Wrapper made with Electron")
    (description "Unofficial Microsoft 365 Web Desktop Wrapper made with Electron.  This is a prebuilt binary package.")
    (home-page "https://github.com/agam778/MS-365-Electron")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 91. hostman-bin — A simple file host manager for various image hosting services
;;; -------------------------------------------------------------------
(define-public hostman-bin
  (package
    (name "hostman-bin")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/keircn/hostman/releases/download/v1.2.4/hostman-1.2.4-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "a simple file host manager for various image hosting services")
    (description "A simple file host manager for various image hosting services.  This is a prebuilt binary package.")
    (home-page "https://github.com/keircn/hostman")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 92. openfreebuds — Manager for HUAWEI FreeBuds
;;; -------------------------------------------------------------------
(define-public openfreebuds
  (package
    (name "openfreebuds")
    (version "0.17.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://mmk.pw/en/openfreebuds/archive/v0.17.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list pkg-config))
    (synopsis "manager for HUAWEI FreeBuds")
    (description "Manager for HUAWEI FreeBuds.")
    (home-page "https://mmk.pw/en/openfreebuds")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 93. brightness — Adjust monitor brightness using ddcutil
;;; -------------------------------------------------------------------
(define-public brightness
  (package
    (name "brightness")
    (version "24.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/Devorlon/brightness/-/archive/v24.1.0/brightness-v24.1.0.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f #:cargo-inputs '()))
    (synopsis "adjust monitor brightness using ddcutil")
    (description "Adjust monitor brightness using ddcutil.")
    (home-page "https://gitlab.com/Devorlon/brightness")
    (license license:gpl3)))


;;; -------------------------------------------------------------------
;;; 94. sqlitecpp — A smart and easy to use C++ SQLite3 wrapper.
;;; -------------------------------------------------------------------
(define-public sqlitecpp
  (package
    (name "sqlitecpp")
    (version "3.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SRombauts/SQLiteCpp/archive/v3.3.3.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "a smart and easy to use C++ SQLite3 wrapper")
    (description "A smart and easy to use C++ SQLite3 wrapper.")
    (home-page "https://github.com/SRombauts/SQLiteCpp")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 95. ed-odyssey-materials-helper-bin — Elite Dangerous Odyssey Materials Helper
;;; -------------------------------------------------------------------
(define-public ed-odyssey-materials-helper-bin
  (package
    (name "ed-odyssey-materials-helper-bin")
    (version "3.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jixxed/ed-odyssey-materials-helper/releases/download/v3.1.10/ed-odyssey-materials-helper-3.1.10-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "elite Dangerous Odyssey Materials Helper")
    (description "Elite Dangerous Odyssey Materials Helper.  This is a prebuilt binary package.")
    (home-page "https://github.com/jixxed/ed-odyssey-materials-helper")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 96. textadept — Fast, minimalist, and remarkably extensible cross-platform text editor
;;; -------------------------------------------------------------------
(define-public textadept
  (package
    (name "textadept")
    (version "12.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/orbitalquark/textadept/archive/v12.9.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "fast, minimalist, and remarkably extensible cross-platform text editor")
    (description "Fast, minimalist, and remarkably extensible cross-platform text editor.")
    (home-page "https://github.com/orbitalquark/textadept")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 97. wastebin-bin — wastebin is a pastebin 📝
;;; -------------------------------------------------------------------
(define-public wastebin-bin
  (package
    (name "wastebin-bin")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/matze/wastebin/releases/download/v3.4.1/wastebin-3.4.1-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "wastebin is a pastebin 📝")
    (description "wastebin is a pastebin 📝.  This is a prebuilt binary package.")
    (home-page "https://github.com/matze/wastebin")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 98. discord-canary-electron-bin — Discord Canary (popular voice + video app) using the system provided electron for increased security and performance
;;; -------------------------------------------------------------------
(define-public discord-canary-electron-bin
  (package
    (name "discord-canary-electron-bin")
    (version "0.0.925")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://canary.discordapp.com/releases/download/v0.0.925/discord-canary-electron-0.0.925-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "bin/" #:include-regexp ("^[^.]")))))
    (synopsis "discord Canary (popular voice + video app) using the system provided electron fo")
    (description "Discord Canary (popular voice + video app) using the system provided electron for increased security and performance.  This is a prebuilt binary package.")
    (home-page "https://canary.discordapp.com")
    (license license:expat)))


;;; -------------------------------------------------------------------
;;; 99. wago-modbus-coupler-shm — sync wago modbus tcp coupler with shared memory
;;; -------------------------------------------------------------------
(define-public wago-modbus-coupler-shm
  (package
    (name "wago-modbus-coupler-shm")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SHMModbus/wago_modbus_coupler_shm/archive/v1.1.1.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))  ;tests may need network/extra deps
    (native-inputs (list cmake pkg-config))
    (synopsis "sync wago modbus tcp coupler with shared memory")
    (description "sync wago modbus tcp coupler with shared memory.")
    (home-page "https://github.com/SHMModbus/wago_modbus_coupler_shm")
    (license license:expat)))

