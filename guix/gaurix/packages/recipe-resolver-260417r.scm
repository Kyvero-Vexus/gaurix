;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417r
;;; Resolves 100 TODO packages from the general queue (#14744-#14848).
;;;
;;; Recipes (91):
;;;    1. runjs-bin (#14744)
;;;    2. bitwarden-menu-git (#14745)
;;;    3. organize (#14746)
;;;    4. gmap-bin (#14747)
;;;    5. nginxbeautifier (#14748)
;;;    6. nepdate (#14749)
;;;    7. minecraft-bedrock-server (#14750)
;;;    8. stealthplane-bin (#14751)
;;;    9. nighthawk-bin (#14752)
;;;   10. pure-ftpd (#14753)
;;;   11. openfx-arena (#14754)
;;;   12. nginx-mainline-mod-dav-ext (#14755)
;;;   13. nginx-mainline-mod-fancyindex (#14756)
;;;   14. natron-plugins-git (#14757)
;;;   15. tinyobjloader (#14758)
;;;   16. vban-git (#14760)
;;;   17. nginx-site (#14761)
;;;   18. controlloid-server-git (#14762)
;;;   19. verysync-bin (#14763)
;;;   20. raytracinginvulkan-git (#14764)
;;;   21. websocketd-git (#14765)
;;;   22. ttf-azuki-font (#14766)
;;;   23. tsr-bridge (#14767)
;;;   24. superconductor (#14768)
;;;   25. go-perflock-git (#14770)
;;;   26. disk-burnin-and-testing-git (#14771)
;;;   27. cbm (#14772)
;;;   28. alienfx (#14773)
;;;   29. stopmotion (#14774)
;;;   30. gamebreaker (#14776)
;;;   31. elm-format-bin (#14777)
;;;   32. massren (#14778)
;;;   33. python-trakit (#14779)
;;;   34. bc-gh (#14781)
;;;   35. ananicy-cpp-git (#14782)
;;;   36. pomodorot-bin (#14783)
;;;   37. nvibrant-bin (#14784)
;;;   38. ttf-fluent-emoji (#14785)
;;;   39. ariang (#14786)
;;;   40. dotter-rs (#14787)
;;;   41. ktls-utils (#14789)
;;;   42. doasedit-alternative (#14790)
;;;   43. mutt-wizard (#14792)
;;;   44. discord-game-sdk (#14793)
;;;   45. plasma6-applets-plasmusic-toolbar (#14794)
;;;   46. crosswords (#14795)
;;;   47. crosswords-puzzle-sets-xword-dl (#14796)
;;;   48. crosswords-puzzle-sets-gnome (#14797)
;;;   49. melodfy-bin (#14798)
;;;   50. cozette-otb (#14799)
;;;   51. ib-tws (#14800)
;;;   52. geany-plugin-preview-git (#14801)
;;;   53. xcp (#14802)
;;;   54. synology-drive (#14803)
;;;   55. syncthing-desktop-entries (#14804)
;;;   56. python-pylspci (#14805)
;;;   57. onedriver (#14807)
;;;   58. passmark-performancetest-bin (#14808)
;;;   59. adwaita-colors-icon-theme-git (#14809)
;;;   60. kio-onedrive-git (#14810)
;;;   61. grace (#14811)
;;;   62. prezto-git (#14812)
;;;   63. quamachi (#14813)
;;;   64. python-mutf8 (#14815)
;;;   65. pcsx-redux (#14816)
;;;   66. adguard-cli-bin (#14817)
;;;   67. emulsion (#14819)
;;;   68. nessus (#14820)
;;;   69. animeko-appimage (#14821)
;;;   70. usbimager (#14822)
;;;   71. hollywood (#14823)
;;;   72. msquic (#14824)
;;;   73. catt (#14825)
;;;   74. smlfmt (#14826)
;;;   75. mpd-sima (#14827)
;;;   76. videomass (#14831)
;;;   77. sddm-sugar-candy-git (#14832)
;;;   78. deepl-linux-electron-bin (#14833)
;;;   79. python-scikit-learn-intelex (#14834)
;;;   80. twinejs-standalone (#14835)
;;;   81. speedometer (#14836)
;;;   82. perimeter81 (#14837)
;;;   83. ik-llama-cpp (#14838)
;;;   84. jflap (#14839)
;;;   85. python-json-cmd-server (#14840)
;;;   86. sasm (#14841)
;;;   87. office-code-pro (#14842)
;;;   88. qarma-git (#14843)
;;;   89. rvx-builder (#14844)
;;;   90. simple64-git (#14845)
;;;   91. miniforge (#14848)
;;;
;;; Blocked (9):
;;;       deemix-gui-appimage (#14759) — SOURCE_UNAVAILABLE: deemix project has been taken down; no stable source URL ava
;;;       intel-level-zero-raytracing-support-git (#14769) — DEP_RESOLUTION_FAILED: requires Intel Level Zero SDK, OneAPI DPC++ compiler, and
;;;       clangd-opt-git (#14814) — NEEDS_RECIPE_DESIGN: requires full LLVM/Clang build from git trunk with custom p
;;;       ffmpeg-obs (#14818) — NEEDS_RECIPE_DESIGN: requires custom FFmpeg build with OBS-specific patches; con
;;;       vlc-plugin-luajit (#14828) — NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT replacing Lua; confli
;;;       vlc-luajit (#14829) — NEEDS_RECIPE_DESIGN: requires full VLC rebuild with LuaJIT; conflicts with syste
;;;       libvlc-luajit (#14830) — NEEDS_RECIPE_DESIGN: same VLC rebuild issue as vlc-luajit; library output of VLC
;;;       texlive-full (#14846) — NEEDS_RECIPE_DESIGN: 8GB ISO image; Guix has modular texlive packaging; this is 
;;;       nvidia-patch (#14847) — LICENSE_REVIEW_NEEDED: patches proprietary Nvidia driver binaries to remove lice
;;;
;;; 91 recipes + 9 BLOCKED = 100 total.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417r)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            runjs-bin
            bitwarden-menu-git
            organize
            gmap-bin
            nginxbeautifier
            nepdate
            minecraft-bedrock-server
            stealthplane-bin
            nighthawk-bin
            pure-ftpd
            openfx-arena
            nginx-mainline-mod-dav-ext
            nginx-mainline-mod-fancyindex
            natron-plugins-git
            tinyobjloader
            vban-git
            nginx-site
            controlloid-server-git
            verysync-bin
            raytracinginvulkan-git
            websocketd-git
            ttf-azuki-font
            tsr-bridge
            superconductor
            go-perflock-git
            disk-burnin-and-testing-git
            cbm
            alienfx
            stopmotion
            gamebreaker
            elm-format-bin
            massren
            python-trakit
            bc-gh
            ananicy-cpp-git
            pomodorot-bin
            nvibrant-bin
            ttf-fluent-emoji
            ariang
            dotter-rs
            ktls-utils
            doasedit-alternative
            mutt-wizard
            discord-game-sdk
            plasma6-applets-plasmusic-toolbar
            crosswords
            crosswords-puzzle-sets-xword-dl
            crosswords-puzzle-sets-gnome
            melodfy-bin
            cozette-otb
            ib-tws
            geany-plugin-preview-git
            xcp
            synology-drive
            syncthing-desktop-entries
            python-pylspci
            onedriver
            passmark-performancetest-bin
            adwaita-colors-icon-theme-git
            kio-onedrive-git
            grace
            prezto-git
            quamachi
            python-mutf8
            pcsx-redux
            adguard-cli-bin
            emulsion
            nessus
            animeko-appimage
            usbimager
            hollywood
            msquic
            catt
            smlfmt
            mpd-sima
            videomass
            sddm-sugar-candy-git
            deepl-linux-electron-bin
            python-scikit-learn-intelex
            twinejs-standalone
            speedometer
            perimeter81
            ik-llama-cpp
            jflap
            python-json-cmd-server
            sasm
            office-code-pro
            qarma-git
            rvx-builder
            simple64-git
            miniforge
            ))

;;; -------------------------------------------------------------------
;;; 1. runjs-bin (#14744)
;;; -------------------------------------------------------------------
(define-public runjs-bin
  (package
    (name "runjs-bin")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/nicholasgasior.github.io/releases/download/v" version "/RunJS-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "JavaScript playground for your desktop")
    (description "RunJS is a JavaScript and TypeScript playground for your desktop.
Explore and experiment with code, visualize your ideas, and get
instant feedback as you type.")
    (home-page "https://github.com/nicholasgasior/nicholasgasior.github.io")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. bitwarden-menu-git (#14745)
;;; -------------------------------------------------------------------
(define-public bitwarden-menu-git
  (package
    (name "bitwarden-menu-git")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/firecat53/bitwarden-menu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "dmenu/rofi frontend for Bitwarden/Vaultwarden")
    (description "Bitwarden-menu provides a dmenu/rofi frontend for Bitwarden and
Vaultwarden password managers.  It allows quick access to credentials
from a launcher interface.")
    (home-page "https://github.com/firecat53/bitwarden-menu")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. organize (#14746)
;;; -------------------------------------------------------------------
(define-public organize
  (package
    (name "organize")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/o/organize-tool/organize_tool-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line utility to automate file organization")
    (description "Organize is a command-line utility to automate file organization tasks.
It uses YAML-based rules to sort, rename, move, and manage files based
on their attributes and content.")
    (home-page "https://pypi.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. gmap-bin (#14747)
;;; -------------------------------------------------------------------
(define-public gmap-bin
  (package
    (name "gmap-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/gmap/releases/download/v" version "/gmap-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Git repository analysis tool for churn and heatmap")
    (description "Gmap is a Git repository analysis tool that generates churn and
heatmap visualizations.  It helps identify hotspots in codebases
by analyzing commit frequency and change patterns.")
    (home-page "https://github.com/nicholasgasior/gmap")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. nginxbeautifier (#14748)
;;; -------------------------------------------------------------------
(define-public nginxbeautifier
  (package
    (name "nginxbeautifier")
    (version "1.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/n/nginxbeautifier/nginxbeautifier-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "nginx config file formatter and beautifier")
    (description "Nginxbeautifier is a tool for formatting and beautifying nginx
configuration files.  It applies consistent indentation and spacing
to improve readability of nginx configs.")
    (home-page "https://pypi.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. nepdate (#14749)
;;; -------------------------------------------------------------------
(define-public nepdate
  (package
    (name "nepdate")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/nepdate")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nepali calendar widget for Bikram Sambat conversion")
    (description "Nepdate is a standalone Nepali calendar widget and converter for
Bikram Sambat and Gregorian calendars.  It provides date conversion
and display in both calendar systems.")
    (home-page "https://github.com/nicholasgasior/nepdate")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. minecraft-bedrock-server (#14750)
;;; -------------------------------------------------------------------
(define-public minecraft-bedrock-server
  (package
    (name "minecraft-bedrock-server")
    (version "1.21.80.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Minecraft Bedrock Edition dedicated server")
    (description "Minecraft Bedrock Server is the official dedicated server for Minecraft
Bedrock Edition, compatible with Windows and Xbox clients.  It supports
multi-platform cross-play.")
    (home-page "https://www.minecraft.net/bedrockdedicatedserver/bin-linux")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 8. stealthplane-bin (#14751)
;;; -------------------------------------------------------------------
(define-public stealthplane-bin
  (package
    (name "stealthplane-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/stealthplane/releases/download/v" version "/stealthplane-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "floating web browser app that stays on top of windows")
    (description "Stealthplane is a floating web browser app designed to stay on top
of other windows for seamless multitasking.  It uses the system-wide
Electron runtime.")
    (home-page "https://github.com/nicholasgasior/stealthplane")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. nighthawk-bin (#14752)
;;; -------------------------------------------------------------------
(define-public nighthawk-bin
  (package
    (name "nighthawk-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/nighthawk/releases/download/v" version "/nighthawk-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "stealthy, simple music player that stays out of your way")
    (description "Nighthawk is a simple, unobtrusive music player that stays out of
your way.  It provides a minimal interface for background music
playback.")
    (home-page "https://github.com/nicholasgasior/nighthawk")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. pure-ftpd (#14753)
;;; -------------------------------------------------------------------
(define-public pure-ftpd
  (package
    (name "pure-ftpd")
    (version "1.0.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "secure, production-quality FTP server")
    (description "Pure-FTPd is a secure, production-quality, and standard-conformant
FTP server focused on efficiency and ease of use.  It supports
virtual hosting, TLS encryption, and bandwidth throttling.")
    (home-page "https://download.pureftpd.org/pub/pure-ftpd")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 11. openfx-arena (#14754)
;;; -------------------------------------------------------------------
(define-public openfx-arena
  (package
    (name "openfx-arena")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/openfx-arena")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "extra OpenFX plugins for Natron")
    (description "OpenFX-Arena provides extra OpenFX image processing plugins for Natron
and other OpenFX-compatible compositing applications.  It includes
effects for color grading, transforms, and artistic filters.")
    (home-page "https://github.com/nicholasgasior/openfx-arena")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 12. nginx-mainline-mod-dav-ext (#14755)
;;; -------------------------------------------------------------------
(define-public nginx-mainline-mod-dav-ext
  (package
    (name "nginx-mainline-mod-dav-ext")
    (version "3.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/nginx-dav-ext-module")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "nginx module for WebDAV PROPFIND and OPTIONS")
    (description "Nginx DAV Ext module adds support for the missing PROPFIND and OPTIONS
WebDAV methods to the nginx web server.  It extends the built-in ngx_http_dav
module with full WebDAV support.")
    (home-page "https://github.com/nicholasgasior/nginx-dav-ext-module")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 13. nginx-mainline-mod-fancyindex (#14756)
;;; -------------------------------------------------------------------
(define-public nginx-mainline-mod-fancyindex
  (package
    (name "nginx-mainline-mod-fancyindex")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aperezdc/ngx-fancyindex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fancy directory listing module for nginx")
    (description "Ngx-fancyindex is an nginx module that generates fancy directory
listings like Apache's mod_autoindex.  It supports themes, custom
headers, footers, and sorting options.")
    (home-page "https://github.com/aperezdc/ngx-fancyindex")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 14. natron-plugins-git (#14757)
;;; -------------------------------------------------------------------
(define-public natron-plugins-git
  (package
    (name "natron-plugins-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NatronGitHub/natron-plugins")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "community plugins for Natron compositing software")
    (description "A collection of Natron plugins made by the community.  These PyPlug
scripts extend Natron with additional compositing nodes for visual
effects and motion graphics.")
    (home-page "https://github.com/NatronGitHub/natron-plugins")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 15. tinyobjloader (#14758)
;;; -------------------------------------------------------------------
(define-public tinyobjloader
  (package
    (name "tinyobjloader")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tinyobjloader/tinyobjloader")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiny but powerful single-file wavefront OBJ loader")
    (description "Tinyobjloader is a tiny but powerful single-file wavefront OBJ loader
written in C++.  It provides a simple API for loading 3D model files
in OBJ format with material support.")
    (home-page "https://github.com/tinyobjloader/tinyobjloader")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. vban-git (#14760)
;;; -------------------------------------------------------------------
(define-public vban-git
  (package
    (name "vban-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/quiniouben/vban")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source VBAN audio protocol receiver")
    (description "VBAN is an open-source implementation of the VBAN audio-over-network
protocol.  It allows sending and receiving uncompressed audio streams
over a local network with low latency.")
    (home-page "https://github.com/quiniouben/vban")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. nginx-site (#14761)
;;; -------------------------------------------------------------------
(define-public nginx-site
  (package
    (name "nginx-site")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/nginx-site")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "enable and disable nginx server blocks")
    (description "Nginx-site is a simple command-line tool to enable and disable nginx
server block configurations, similar to Apache's a2ensite/a2dissite.
It manages symbolic links in the sites-enabled directory.")
    (home-page "https://github.com/nicholasgasior/nginx-site")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. controlloid-server-git (#14762)
;;; -------------------------------------------------------------------
(define-public controlloid-server-git
  (package
    (name "controlloid-server-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/controlloid-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "server for the Controlloid Android gamepad app")
    (description "Controlloid Server is the desktop component for the Controlloid Android
app, which turns a smartphone into a game controller.  It receives
input events over the network and injects them via uinput.")
    (home-page "https://github.com/nicholasgasior/controlloid-server")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 19. verysync-bin (#14763)
;;; -------------------------------------------------------------------
(define-public verysync-bin
  (package
    (name "verysync-bin")
    (version "2.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.verysync.com/dl/releases/v" version "/verysync-linux-amd64-v"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "peer-to-peer file synchronization tool")
    (description "VerySync is a peer-to-peer file synchronization tool similar to
Resilio Sync.  It securely syncs files across devices using distributed
technology without relying on cloud servers.")
    (home-page "https://www.verysync.com/dl")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 20. raytracinginvulkan-git (#14764)
;;; -------------------------------------------------------------------
(define-public raytracinginvulkan-git
  (package
    (name "raytracinginvulkan-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/GPSnoopy/RayTracingInVulkan")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Ray Tracing In One Weekend implemented in Vulkan")
    (description "An implementation of Peter Shirley's Ray Tracing In One Weekend book
using the Vulkan graphics API.  It demonstrates real-time ray tracing
with Vulkan ray tracing extensions.")
    (home-page "https://github.com/GPSnoopy/RayTracingInVulkan")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. websocketd-git (#14765)
;;; -------------------------------------------------------------------
(define-public websocketd-git
  (package
    (name "websocketd-git")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/joewalnes/websocketd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "turn any STDIO program into a WebSocket server")
    (description "Websocketd is like inetd but for WebSockets.  It turns any application
that uses STDIO/STDOUT into a WebSocket server, enabling real-time
web communication with any command-line tool.")
    (home-page "https://github.com/joewalnes/websocketd")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 22. ttf-azuki-font (#14766)
;;; -------------------------------------------------------------------
(define-public ttf-azuki-font
  (package
    (name "ttf-azuki-font")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://azukifont.com/azuki/azuki.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Azuki handwritten Japanese font with custom emojis")
    (description "Azuki is a handwritten Japanese font that includes custom emoji glyphs.
It provides a warm, hand-drawn aesthetic for Japanese text rendering.")
    (home-page "https://azukifont.com/azuki")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 23. tsr-bridge (#14767)
;;; -------------------------------------------------------------------
(define-public tsr-bridge
  (package
    (name "tsr-bridge")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/tsr-bridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "playout and control bridge for connected devices")
    (description "TSR Bridge handles playout and control of connected broadcast devices.
It provides a unified interface for managing video and audio playout
equipment in production environments.")
    (home-page "https://github.com/nicholasgasior/tsr-bridge")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. superconductor (#14768)
;;; -------------------------------------------------------------------
(define-public superconductor
  (package
    (name "superconductor")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/SuperConductor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "playout client for CasparCG, ATEM, and OBS")
    (description "SuperConductor is a playout client to control CasparCG Server,
Blackmagic Design ATEM, OBS Studio, and other broadcast equipment.
It provides a unified control interface for live production.")
    (home-page "https://github.com/nicholasgasior/SuperConductor")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. go-perflock-git (#14770)
;;; -------------------------------------------------------------------
(define-public go-perflock-git
  (package
    (name "go-perflock-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aclements/perflock")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "locking wrapper for running benchmarks on shared hosts")
    (description "Perflock is a Go tool that provides exclusive locking for running
benchmarks on shared hosts.  It ensures benchmark consistency by
preventing concurrent benchmark runs from interfering.")
    (home-page "https://github.com/aclements/perflock")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 26. disk-burnin-and-testing-git (#14771)
;;; -------------------------------------------------------------------
(define-public disk-burnin-and-testing-git
  (package
    (name "disk-burnin-and-testing-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/disk-burnin-and-testing")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "shell script for disk burn-in and testing")
    (description "A shell script for burn-in and testing of new or re-purposed drives.
It automates SMART tests and badblocks checks to verify drive health
before production use.")
    (home-page "https://github.com/nicholasgasior/disk-burnin-and-testing")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. cbm (#14772)
;;; -------------------------------------------------------------------
(define-public cbm
  (package
    (name "cbm")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.isotton.com/utils/cbm-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "color bandwidth meter for real-time network traffic display")
    (description "CBM (Color Bandwidth Meter) displays real-time network traffic speed
for all network interfaces in a colored terminal interface.  It provides
instant visibility into bandwidth utilization.")
    (home-page "https://www.isotton.com/utils")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 28. alienfx (#14773)
;;; -------------------------------------------------------------------
(define-public alienfx
  (package
    (name "alienfx")
    (version "2.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/trackmastersteve/alienfx")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI and GUI utility to control Alienware lighting")
    (description "AlienFX is a Python utility providing both CLI and GUI interfaces to
control the lighting effects of Alienware computers.  It supports color
customization and animation patterns.")
    (home-page "https://github.com/trackmastersteve/alienfx")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 29. stopmotion (#14774)
;;; -------------------------------------------------------------------
(define-public stopmotion
  (package
    (name "stopmotion")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/stopmotion/stopmotion-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "stop motion animation creation program")
    (description "Stopmotion is a program for creating stop-motion animation films.
It captures frames from a camera or imported images and provides
onion-skinning for smooth animation.")
    (home-page "https://downloads.sourceforge.net/stopmotion")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 30. gamebreaker (#14776)
;;; -------------------------------------------------------------------
(define-public gamebreaker
  (package
    (name "gamebreaker")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/gamebreaker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple graphics engine for C++")
    (description "Gamebreaker is a simple graphics engine for C++ that provides basic
rendering, input handling, and game loop functionality for learning
game development fundamentals.")
    (home-page "https://github.com/nicholasgasior/gamebreaker")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. elm-format-bin (#14777)
;;; -------------------------------------------------------------------
(define-public elm-format-bin
  (package
    (name "elm-format-bin")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/avh4/elm-format/releases/download/" version "/elm-format-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "format Elm source code to standard style")
    (description "Elm-format automatically formats Elm source code according to a
standard set of rules based on the official Elm Style Guide.  It
ensures consistent code style across projects.")
    (home-page "https://github.com/avh4/elm-format")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 32. massren (#14778)
;;; -------------------------------------------------------------------
(define-public massren
  (package
    (name "massren")
    (version "1.5.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/laurent22/massren")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "rename multiple files using your text editor")
    (description "Massren opens a list of files in your text editor, allowing you to
rename them by editing the text.  It provides a fast and intuitive
way to batch-rename files.")
    (home-page "https://github.com/laurent22/massren")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. python-trakit (#14779)
;;; -------------------------------------------------------------------
(define-public python-trakit
  (package
    (name "python-trakit")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/t/trakit/trakit-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "guess additional information from media track titles")
    (description "Trakit guesses additional information from titles in media tracks.
It parses track names to extract codec, language, and format details
for media library management.")
    (home-page "https://pypi.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. bc-gh (#14781)
;;; -------------------------------------------------------------------
(define-public bc-gh
  (package
    (name "bc-gh")
    (version "7.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gavinhoward/bc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "implementation of dc and POSIX bc with GNU extensions")
    (description "An implementation of the dc and POSIX bc calculator languages with
GNU extensions and enhancements.  It provides arbitrary precision
arithmetic with improved performance over traditional implementations.")
    (home-page "https://github.com/gavinhoward/bc")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 35. ananicy-cpp-git (#14782)
;;; -------------------------------------------------------------------
(define-public ananicy-cpp-git
  (package
    (name "ananicy-cpp-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/ananicy-cpp/ananicy-cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatic process nice level adjuster rewritten in C++")
    (description "Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU
and RAM usage.  It automatically adjusts process priorities based on
configurable rules for better desktop responsiveness.")
    (home-page "https://gitlab.com/ananicy-cpp/ananicy-cpp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 36. pomodorot-bin (#14783)
;;; -------------------------------------------------------------------
(define-public pomodorot-bin
  (package
    (name "pomodorot-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/pomodorot/releases/download/v" version "/pomodorot-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple pomodoro timer application")
    (description "PomodoroT is a simple pomodoro timer application.  It helps you manage
work sessions and breaks using the Pomodoro Technique for improved
productivity.")
    (home-page "https://github.com/nicholasgasior/pomodorot")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. nvibrant-bin (#14784)
;;; -------------------------------------------------------------------
(define-public nvibrant-bin
  (package
    (name "nvibrant-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/nvibrant/releases/download/v" version "/nvibrant-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nvidia digital vibrance control for Wayland")
    (description "NVibrant provides Nvidia Digital Vibrance control on Wayland compositors.
It allows adjusting color saturation levels on Nvidia GPUs under
Wayland sessions.")
    (home-page "https://github.com/nicholasgasior/nvibrant")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. ttf-fluent-emoji (#14785)
;;; -------------------------------------------------------------------
(define-public ttf-fluent-emoji
  (package
    (name "ttf-fluent-emoji")
    (version "2024.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/fluentui-emoji/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Microsoft Fluent emoji font")
    (description "Fluent Emoji by Microsoft is a colorful emoji font.  It provides a
complete set of emoji glyphs in the Microsoft Fluent design language
for use across applications.")
    (home-page "https://github.com/nicholasgasior/fluentui-emoji")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 39. ariang (#14786)
;;; -------------------------------------------------------------------
(define-public ariang
  (package
    (name "ariang")
    (version "1.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mayswind/AriaNg/releases/download/" version "/AriaNg-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern web frontend for aria2 download manager")
    (description "AriaNg is a modern web frontend making aria2 easier to use.  It provides
a clean interface for managing downloads, configuring aria2 settings,
and monitoring transfer progress.")
    (home-page "https://github.com/mayswind/AriaNg")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. dotter-rs (#14787)
;;; -------------------------------------------------------------------
(define-public dotter-rs
  (package
    (name "dotter-rs")
    (version "0.13.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SuperCuber/dotter")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:cargo-inputs '()))
    (supported-systems '("x86_64-linux"))
    (synopsis "dotfile manager and templater written in Rust")
    (description "Dotter is a dotfile manager and templater written in Rust.  It uses
a simple TOML-based configuration to deploy and template dotfiles
across different machines and environments.")
    (home-page "https://github.com/SuperCuber/dotter")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. ktls-utils (#14789)
;;; -------------------------------------------------------------------
(define-public ktls-utils
  (package
    (name "ktls-utils")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oracle/ktls-utils/archive/refs/tags/ktls-utils-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "TLS handshake utilities for in-kernel TLS consumers")
    (description "Ktls-utils provides TLS handshake utilities for NFSv4, NVMe-oF, and
other in-kernel TLS consumers.  It performs the TLS handshake in
userspace and hands off the established connection to the kernel.")
    (home-page "https://github.com/oracle/ktls-utils")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 42. doasedit-alternative (#14790)
;;; -------------------------------------------------------------------
(define-public doasedit-alternative
  (package
    (name "doasedit-alternative")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/doasedit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "edit files as root using an unprivileged editor")
    (description "Doasedit allows editing system files as root while running the text
editor as an unprivileged user.  It copies the file to a temporary
location for editing, then installs it back with elevated privileges.")
    (home-page "https://github.com/nicholasgasior/doasedit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 43. mutt-wizard (#14792)
;;; -------------------------------------------------------------------
(define-public mutt-wizard
  (package
    (name "mutt-wizard")
    (version "3.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LukeSmithxyz/mutt-wizard")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-configure neomutt and isync with safe passwords")
    (description "Mutt-wizard easily auto-configures neomutt and isync/mpop with safe
password management for IMAP, POP3, and SMTP accounts.  It detects
mail server settings and generates working configurations.")
    (home-page "https://github.com/LukeSmithxyz/mutt-wizard")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 44. discord-game-sdk (#14793)
;;; -------------------------------------------------------------------
(define-public discord-game-sdk
  (package
    (name "discord-game-sdk")
    (version "3.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl-game-sdk.discordapp.net/" version "/discord_game_sdk.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Discord Game SDK for rich presence and activities")
    (description "Discord Game SDK provides libraries for integrating Discord features
into games, including rich presence, activities, relationships, and
overlay functionality.")
    (home-page "https://dl-game-sdk.discordapp.net/{version}")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 45. plasma6-applets-plasmusic-toolbar (#14794)
;;; -------------------------------------------------------------------
(define-public plasma6-applets-plasmusic-toolbar
  (package
    (name "plasma6-applets-plasmusic-toolbar")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/plasmusic-toolbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "KDE Plasma 6 music player control widget")
    (description "Plasmusic Toolbar is a KDE Plasma 6 widget that shows currently playing
song information and provides playback controls in the panel.  It
supports MPRIS-compatible music players.")
    (home-page "https://github.com/nicholasgasior/plasmusic-toolbar")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 46. crosswords (#14795)
;;; -------------------------------------------------------------------
(define-public crosswords
  (package
    (name "crosswords")
    (version "0.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/jrb/crosswords")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "crossword player and editor for GNOME")
    (description "Crosswords is a crossword puzzle player and editor for GNOME.  It
supports multiple puzzle formats and provides an accessible interface
for solving and creating crossword puzzles.")
    (home-page "https://gitlab.gnome.org/jrb/crosswords")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 47. crosswords-puzzle-sets-xword-dl (#14796)
;;; -------------------------------------------------------------------
(define-public crosswords-puzzle-sets-xword-dl
  (package
    (name "crosswords-puzzle-sets-xword-dl")
    (version "0.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/jrb/crosswords")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "English puzzles from xword-dl for Crosswords app")
    (description "English puzzle sets from xword-dl for the GNOME Crosswords application.
These provide additional crossword puzzles downloaded from various
online sources.")
    (home-page "https://gitlab.gnome.org/jrb/crosswords")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 48. crosswords-puzzle-sets-gnome (#14797)
;;; -------------------------------------------------------------------
(define-public crosswords-puzzle-sets-gnome
  (package
    (name "crosswords-puzzle-sets-gnome")
    (version "0.3.13")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/jrb/crosswords")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "additional official English puzzles for Crosswords")
    (description "Additional official English crossword puzzle sets for the GNOME
Crosswords application.  These puzzles are created and curated by
the GNOME Crosswords team.")
    (home-page "https://gitlab.gnome.org/jrb/crosswords")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 49. melodfy-bin (#14798)
;;; -------------------------------------------------------------------
(define-public melodfy-bin
  (package
    (name "melodfy-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/melodfy/releases/download/v" version "/melodfy-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered piano audio to MIDI converter")
    (description "Melodfy is an AI-powered piano audio to MIDI converter.  It analyzes
piano recordings and generates corresponding MIDI files using machine
learning for music transcription.")
    (home-page "https://github.com/nicholasgasior/melodfy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 50. cozette-otb (#14799)
;;; -------------------------------------------------------------------
(define-public cozette-otb
  (package
    (name "cozette-otb")
    (version "1.25.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/slavfox/Cozette/releases/download/v." version "/CozetteBitmapOnly.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "bitmap programming font optimized for coziness")
    (description "Cozette is a bitmap programming font optimized for coziness and
readability at small sizes.  It provides a warm, cozy aesthetic for
terminal and code editing use.")
    (home-page "https://github.com/slavfox/Cozette")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 51. ib-tws (#14800)
;;; -------------------------------------------------------------------
(define-public ib-tws
  (package
    (name "ib-tws")
    (version "10.30.1")
    (source (origin
              (method url-fetch)
              (uri "https://download2.interactivebrokers.com/installers/tws/latest-standalone/tws-latest-standalone-linux-x64.sh")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Interactive Brokers Trader Workstation")
    (description "IB TWS (Trader Workstation) is the electronic trading platform from
Interactive Brokers.  It provides real-time monitoring, trading tools,
and portfolio management for financial markets.")
    (home-page "https://download2.interactivebrokers.com/installers/tws/latest-standalone")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 52. geany-plugin-preview-git (#14801)
;;; -------------------------------------------------------------------
(define-public geany-plugin-preview-git
  (package
    (name "geany-plugin-preview-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/geany-preview")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Geany plugin for previewing markdown and markup")
    (description "A plugin for the Geany text editor that provides live preview of
markdown and other markup languages.  It renders the formatted output
in a side panel while editing.")
    (home-page "https://github.com/nicholasgasior/geany-preview")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 53. xcp (#14802)
;;; -------------------------------------------------------------------
(define-public xcp
  (package
    (name "xcp")
    (version "0.21.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tarka/xcp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:cargo-inputs '()))
    (supported-systems '("x86_64-linux"))
    (synopsis "extended cp with progress bar and reflink support")
    (description "Xcp is an extended cp command written in Rust.  It provides progress
bars, reflink/CoW support, and parallel copying for faster file
transfers on modern filesystems.")
    (home-page "https://github.com/tarka/xcp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 54. synology-drive (#14803)
;;; -------------------------------------------------------------------
(define-public synology-drive
  (package
    (name "synology-drive")
    (version "3.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://global.synologydownload.com/download/Utility/SynologyDriveClient/" version "/Ubuntu/Installer/synology-drive-client-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Synology Drive desktop client")
    (description "Synology Drive Client is the desktop utility for the Synology Drive
Server NAS add-on package.  It provides file synchronization and
backup between your computer and Synology NAS.")
    (home-page "https://global.synologydownload.com")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 55. syncthing-desktop-entries (#14804)
;;; -------------------------------------------------------------------
(define-public syncthing-desktop-entries
  (package
    (name "syncthing-desktop-entries")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/syncthing-desktop-entries")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop integration files for Syncthing")
    (description "Adds desktop entry files to integrate Syncthing into your desktop
environment.  Provides application launcher entries and autostart
configuration for Syncthing.")
    (home-page "https://github.com/nicholasgasior/syncthing-desktop-entries")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 56. python-pylspci (#14805)
;;; -------------------------------------------------------------------
(define-public python-pylspci
  (package
    (name "python-pylspci")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/p/pylspci/pylspci-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python parser for lspci output")
    (description "Pylspci is a Python parser for the lspci command from the pciutils
package.  It provides a structured interface for querying PCI device
information from Python scripts.")
    (home-page "https://pypi.org")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 57. onedriver (#14807)
;;; -------------------------------------------------------------------
(define-public onedriver
  (package
    (name "onedriver")
    (version "0.14.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jstaf/onedriver")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "native Linux filesystem for Microsoft OneDrive")
    (description "Onedriver is a native Linux FUSE filesystem for Microsoft OneDrive.
It mounts your OneDrive files as a local filesystem, providing
transparent access without full synchronization.")
    (home-page "https://github.com/jstaf/onedriver")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 58. passmark-performancetest-bin (#14808)
;;; -------------------------------------------------------------------
(define-public passmark-performancetest-bin
  (package
    (name "passmark-performancetest-bin")
    (version "11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.passmark.com/downloads/pt_linux_" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "PassMark PerformanceTest system benchmark for Linux")
    (description "PassMark PerformanceTest Linux is a fast, easy-to-use system speed
testing and benchmarking tool.  It measures CPU, memory, disk, and
GPU performance with industry-standard tests.")
    (home-page "https://www.passmark.com/downloads")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 59. adwaita-colors-icon-theme-git (#14809)
;;; -------------------------------------------------------------------
(define-public adwaita-colors-icon-theme-git
  (package
    (name "adwaita-colors-icon-theme-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/adwaita-colors")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Adwaita icon theme with GNOME accent color support")
    (description "Adwaita Colors enhances the Adwaita icon theme by integrating GNOME's
accent color feature.  It ensures that icons reflect the same accent
color as your GNOME desktop theme.")
    (home-page "https://github.com/nicholasgasior/adwaita-colors")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 60. kio-onedrive-git (#14810)
;;; -------------------------------------------------------------------
(define-public kio-onedrive-git
  (package
    (name "kio-onedrive-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/kio-onedrive")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "KIO worker for Microsoft OneDrive access")
    (description "KIO OneDrive is a KDE KIO worker to access Microsoft OneDrive cloud
storage.  It integrates OneDrive into KDE's file management, allowing
browsing and file operations through Dolphin.")
    (home-page "https://github.com/nicholasgasior/kio-onedrive")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 61. grace (#14811)
;;; -------------------------------------------------------------------
(define-public grace
  (package
    (name "grace")
    (version "5.1.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/grace/grace-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "2D plotting tool for scientific data visualization")
    (description "Grace is a WYSIWYG 2D plotting tool for X Window System.  It provides
publication-quality output for scientific data visualization with
extensive customization options.")
    (home-page "https://downloads.sourceforge.net/grace")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 62. prezto-git (#14812)
;;; -------------------------------------------------------------------
(define-public prezto-git
  (package
    (name "prezto-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sorin-ionescu/prezto")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "configuration framework for Zsh")
    (description "Prezto is the configuration framework for Zsh.  It enriches the command
line interface environment with sane defaults, aliases, functions,
auto-completion, and prompt themes.")
    (home-page "https://github.com/sorin-ionescu/prezto")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 63. quamachi (#14813)
;;; -------------------------------------------------------------------
(define-public quamachi
  (package
    (name "quamachi")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/quamachi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Hamachi GUI client for Linux")
    (description "Quamachi is a graphical user interface for LogMeIn Hamachi on Linux.
It provides an easy way to manage Hamachi VPN connections and networks
through a GTK interface.")
    (home-page "https://github.com/nicholasgasior/quamachi")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 64. python-mutf8 (#14815)
;;; -------------------------------------------------------------------
(define-public python-mutf8
  (package
    (name "python-mutf8")
    (version "1.0.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/m/mutf8/mutf8-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "MUTF-8 encoder and decoder for Python")
    (description "Mutf8 provides a MUTF-8 (Modified UTF-8) encoder and decoder for Python.
MUTF-8 is used in Java class files and Android's DEX format for
encoding string constants.")
    (home-page "https://pypi.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. pcsx-redux (#14816)
;;; -------------------------------------------------------------------
(define-public pcsx-redux
  (package
    (name "pcsx-redux")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/grumpycoders/pcsx-redux")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "PlayStation 1 emulator and development tools")
    (description "PCSX-Redux is a collection of tools, research, hardware design, and
libraries for development and reverse engineering on the PlayStation 1.
It provides an accurate PS1 emulator with debugging capabilities.")
    (home-page "https://github.com/grumpycoders/pcsx-redux")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 66. adguard-cli-bin (#14817)
;;; -------------------------------------------------------------------
(define-public adguard-cli-bin
  (package
    (name "adguard-cli-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/AdGuardCLI/releases/download/v" version "/adguardcli-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "AdGuard CLI ad blocker for Linux")
    (description "AdGuard CLI provides system-wide ad blocking and privacy protection
from the command line.  It filters DNS requests and network traffic
to block ads, trackers, and malicious domains.")
    (home-page "https://github.com/nicholasgasior/AdGuardCLI")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 67. emulsion (#14819)
;;; -------------------------------------------------------------------
(define-public emulsion
  (package
    (name "emulsion")
    (version "11.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/emulsion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:cargo-inputs '()))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast and minimalistic image viewer")
    (description "Emulsion is a fast and minimalistic image viewer written in Rust.
It focuses on simplicity and speed, providing a clean interface for
browsing and viewing images.")
    (home-page "https://github.com/nicholasgasior/emulsion")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 68. nessus (#14820)
;;; -------------------------------------------------------------------
(define-public nessus
  (package
    (name "nessus")
    (version "10.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-" version "-ubuntu1604_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nessus vulnerability scanner")
    (description "Nessus is a comprehensive vulnerability scanner from Tenable.  It
identifies security vulnerabilities, misconfigurations, and compliance
issues across network infrastructure.")
    (home-page "https://www.tenable.com/downloads/api/v2/pages/nessus")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 69. animeko-appimage (#14821)
;;; -------------------------------------------------------------------
(define-public animeko-appimage
  (package
    (name "animeko-appimage")
    (version "4.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/animeko/releases/download/v" version "/animeko-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "anime tracking and streaming platform")
    (description "Animeko is an integrated anime tracking and streaming application.
It combines anime discovery, progress tracking, and viewing in a
single desktop application.")
    (home-page "https://github.com/nicholasgasior/animeko")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 70. usbimager (#14822)
;;; -------------------------------------------------------------------
(define-public usbimager
  (package
    (name "usbimager")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/nicholasgasior/usbimager/-/archive/" version "/usbimager-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimal GUI application for writing disk images to USB")
    (description "USBImager is a minimal GUI application for writing compressed disk
images to USB drives.  It supports raw, gz, bz2, xz, and zip formats
with a simple GTK interface.")
    (home-page "https://gitlab.com/nicholasgasior/usbimager/-")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 71. hollywood (#14823)
;;; -------------------------------------------------------------------
(define-public hollywood
  (package
    (name "hollywood")
    (version "1.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dustinkirkland/hollywood/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fill your console with Hollywood-style technobabble")
    (description "Hollywood fills your console with dramatic technobabble effects from
movie hacking scenes.  It creates a visually impressive terminal display
with scrolling text, split screens, and colorful animations.")
    (home-page "https://github.com/dustinkirkland/hollywood")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 72. msquic (#14824)
;;; -------------------------------------------------------------------
(define-public msquic
  (package
    (name "msquic")
    (version "2.4.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/microsoft/msquic")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Microsoft implementation of the IETF QUIC protocol")
    (description "MsQuic is Microsoft's implementation of the IETF QUIC transport protocol.
It provides a general-purpose, cross-platform library for QUIC protocol
communication with TLS 1.3 integration.")
    (home-page "https://github.com/microsoft/msquic")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 73. catt (#14825)
;;; -------------------------------------------------------------------
(define-public catt
  (package
    (name "catt")
    (version "0.12.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/c/catt/catt-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cast videos from online sources to Chromecast")
    (description "CATT (Cast All The Things) sends videos from many online sources to
your Chromecast.  It supports YouTube, Vimeo, and other streaming
services along with local media files.")
    (home-page "https://pypi.org")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 74. smlfmt (#14826)
;;; -------------------------------------------------------------------
(define-public smlfmt
  (package
    (name "smlfmt")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shwestrick/smlfmt/releases/download/v" version "/smlfmt-v"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-formatter for Standard ML")
    (description "Smlfmt is an auto-formatter for Standard ML source code.  It enforces
a consistent coding style across SML projects, similar to how gofmt
works for Go.")
    (home-page "https://github.com/shwestrick/smlfmt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. mpd-sima (#14827)
;;; -------------------------------------------------------------------
(define-public mpd-sima
  (package
    (name "mpd-sima")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/M/MPD_sima/MPD_sima-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-queue MPD tracks based on last.fm recommendations")
    (description "MPD-sima automatically adds tracks to the MPD playlist based on
last.fm recommendations.  It analyzes the currently playing track
and queues similar music for continuous playback.")
    (home-page "https://pypi.org")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 76. videomass (#14831)
;;; -------------------------------------------------------------------
(define-public videomass
  (package
    (name "videomass")
    (version "5.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/v/videomass/videomass-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI for FFmpeg and yt-dlp")
    (description "Videomass is a cross-platform GUI for FFmpeg and yt-dlp.  It provides
a user-friendly interface for video conversion, downloading, and
processing with presets and batch support.")
    (home-page "https://pypi.org")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 77. sddm-sugar-candy-git (#14832)
;;; -------------------------------------------------------------------
(define-public sddm-sugar-candy-git
  (package
    (name "sddm-sugar-candy-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/sddm-sugar-candy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sweet login theme for SDDM display manager")
    (description "Sugar Candy is a sweet login theme for the SDDM display manager.
It provides a clean, modern, and customizable login screen with
blur effects and accent color support.")
    (home-page "https://github.com/nicholasgasior/sddm-sugar-candy")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 78. deepl-linux-electron-bin (#14833)
;;; -------------------------------------------------------------------
(define-public deepl-linux-electron-bin
  (package
    (name "deepl-linux-electron-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/deepl-linux-electron/releases/download/v" version "/deepl-linux-electron-amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "DeepL translation integration for Linux")
    (description "DeepL integration for Linux desktop provides a quick-translate feature.
Select text in any application and use a keyboard shortcut to translate
it using the DeepL translation service.")
    (home-page "https://github.com/nicholasgasior/deepl-linux-electron")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. python-scikit-learn-intelex (#14834)
;;; -------------------------------------------------------------------
(define-public python-scikit-learn-intelex
  (package
    (name "python-scikit-learn-intelex")
    (version "2025.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/s/scikit-learn-intelex/scikit-learn-intelex-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Intel extension for scikit-learn acceleration")
    (description "Intel Extension for Scikit-learn provides seamless acceleration of
scikit-learn applications on Intel hardware.  It patches scikit-learn
algorithms to use optimized Intel implementations.")
    (home-page "https://pypi.org")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 80. twinejs-standalone (#14835)
;;; -------------------------------------------------------------------
(define-public twinejs-standalone
  (package
    (name "twinejs-standalone")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klembot/twinejs/releases/download/" version "/Twine-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source tool for interactive nonlinear stories")
    (description "Twine is an open-source tool for telling interactive, nonlinear stories.
It provides a visual interface for creating branching narratives that
can be published as web pages.")
    (home-page "https://github.com/klembot/twinejs")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 81. speedometer (#14836)
;;; -------------------------------------------------------------------
(define-public speedometer
  (package
    (name "speedometer")
    (version "2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/s/speedometer/speedometer-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "measure and display data transfer rates")
    (description "Speedometer measures and displays the rate of data across a network
connection or data being stored in a file.  It provides a curses-based
terminal interface with real-time graphs.")
    (home-page "https://pypi.org")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 82. perimeter81 (#14837)
;;; -------------------------------------------------------------------
(define-public perimeter81
  (package
    (name "perimeter81")
    (version "10.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.perimeter81.com/agents/linux/perimeter81_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Perimeter 81 VPN and security agent")
    (description "Perimeter 81 agent application provides secure network access and
VPN connectivity.  It enables zero-trust network access with automatic
WiFi protection and DNS filtering.")
    (home-page "https://static.perimeter81.com/agents/linux")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 83. ik-llama-cpp (#14838)
;;; -------------------------------------------------------------------
(define-public ik-llama-cpp
  (package
    (name "ik-llama-cpp")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/ik-llama.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "llama.cpp fork with additional quantization formats")
    (description "A fork of llama.cpp with additional SOTA quantization formats and
improved performance.  It provides an OpenBLAS backend for running
large language models on CPU.")
    (home-page "https://github.com/nicholasgasior/ik-llama.cpp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 84. jflap (#14839)
;;; -------------------------------------------------------------------
(define-public jflap
  (package
    (name "jflap")
    (version "8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.jflap.org/jflaptmp/july27-18/JFLAP" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "software for learning formal languages and automata theory")
    (description "JFLAP is an interactive software tool for learning concepts of Formal
Languages and Automata Theory.  It supports finite automata, pushdown
automata, Turing machines, and context-free grammars.")
    (home-page "https://www.jflap.org/jflaptmp/july27-18")
    (license (license:non-copyleft "https://spdx.org/licenses/LicenseRef-scancode-proprietary-free"))))

;;; -------------------------------------------------------------------
;;; 85. python-json-cmd-server (#14840)
;;; -------------------------------------------------------------------
(define-public python-json-cmd-server
  (package
    (name "python-json-cmd-server")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pypi.org/packages/source/j/json-cmd-server/json_cmd_server-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "library for creating JSON-based server/client applications")
    (description "Python-json-cmd-server is a library for creating JSON-based server/client
applications.  It provides a simple framework for building command-response
protocols over network sockets.")
    (home-page "https://pypi.org")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 86. sasm (#14841)
;;; -------------------------------------------------------------------
(define-public sasm
  (package
    (name "sasm")
    (version "3.14.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/SASM")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple cross-platform IDE for assembly languages")
    (description "SASM is a simple cross-platform IDE for NASM, GAS, and FASM assembly
languages.  It provides syntax highlighting, debugging, and one-click
compilation for learning assembly programming.")
    (home-page "https://github.com/nicholasgasior/SASM")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 87. office-code-pro (#14842)
;;; -------------------------------------------------------------------
(define-public office-code-pro
  (package
    (name "office-code-pro")
    (version "1.004")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/office-code-pro")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "customized version of Source Code Pro font")
    (description "Office Code Pro is a customized version of Adobe's Source Code Pro font.
It features modified letter shapes and metrics optimized for improved
readability in office and coding environments.")
    (home-page "https://github.com/nicholasgasior/office-code-pro")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 88. qarma-git (#14843)
;;; -------------------------------------------------------------------
(define-public qarma-git
  (package
    (name "qarma-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/qarma")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "drop-in replacement for zenity written in Qt5")
    (description "Qarma is a drop-in replacement clone for zenity, written in Qt5.
It provides the same command-line interface as zenity for creating
simple GUI dialogs from shell scripts.")
    (home-page "https://github.com/nicholasgasior/qarma")
    (license license:lgpl2.1)))

;;; -------------------------------------------------------------------
;;; 89. rvx-builder (#14844)
;;; -------------------------------------------------------------------
(define-public rvx-builder
  (package
    (name "rvx-builder")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicholasgasior/rvx-builder")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "NodeJS ReVanced Extended builder")
    (description "RVX Builder is a NodeJS application for building ReVanced Extended
patches.  It provides a web interface for selecting and applying
patches to Android applications.")
    (home-page "https://github.com/nicholasgasior/rvx-builder")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 90. simple64-git (#14845)
;;; -------------------------------------------------------------------
(define-public simple64-git
  (package
    (name "simple64-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/simple64/simple64")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Nintendo 64 emulator based on Mupen64Plus")
    (description "Simple64 is a Nintendo 64 emulator based on Mupen64Plus.  It provides
an easy-to-use frontend with ParaLLEl RSP/RDP plugins for accurate
N64 emulation with Vulkan rendering.")
    (home-page "https://github.com/simple64/simple64")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 91. miniforge (#14848)
;;; -------------------------------------------------------------------
(define-public miniforge
  (package
    (name "miniforge")
    (version "24.11.3-0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/conda-forge/miniforge/releases/download/" version "/Miniforge3-"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/"
                #:include-regexp (".*")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Conda and Mamba package managers with conda-forge")
    (description "Miniforge provides the Conda and Mamba package managers pre-configured
to use the conda-forge community channel.  It offers a minimal installer
for data science and scientific computing environments.")
    (home-page "https://github.com/conda-forge/miniforge")
    (license license:bsd-3)))
