;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260427q
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260427q)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (
            quickjs-ng
            libimobiledevice-glue-git
            mpv-handler
            llama-benchy
            rpcs3-git
            alacritty-theme-git
            tributary
            normcap
            minecraft-server
            grubforge
            gaur
            telemost
            zapret-git
            python-sentence-transformers
            kavita-bin
            wl-freeze-git
            vapoursynth-plugin-lsmashsource-git
            libkscreen5
            palemoon
            deta-surf
            openvpn3-git
            mnt-reform-qcacld2-firmware
            fluffychat
            sheets-git
            dolltool
            tetro-tui
            ttf-ms-win11
            linuxqq-clipsync-git
            cliphist-tui-git
            gpu-viewer
            insomnia-bin
            python-click-plugins
            thonny
            eduke32
            ryujinx
            python-google-crc32c
            apparmor.d.enforced
            apparmor.d
            pam-rssh
            vivaldi-snapshot-ffmpeg-codecs
            gram-git
            find-the-command
            vital-synth
            pay-respects
            staruml
            java-service-wrapper
            tlrc
            woeusb
            atlauncher
            yt-dlp-drop-in
            python-lzo
            spotube-bin
            plasma6-wallpapers-wallpaper-engine-git
            aconfmgr-git
            guile-g-golf
            diffr
            python-ctranslate2
            ctranslate2
            python-asgi-lifespan
            companion
            audacious-plugins-git
            fileoptimizer-bin
            python-faster-whisper
            libredwg
            artanis
            python-msal
            python-azure-core
            wsjtx
            insync-nautilus
            gruvbox-material-icon-theme-git
            gruvbox-material-gtk-theme-git
            nordzy-cursors
            nvidia-patch-git
            ictree-bin
            activate-linux-git
            snowflake-pt-client
            python-langchain-text-splitters
            python-langchain-core
            xfce4-dev-tools-git
            python-langchain
            cylon
            psf-cozette
            dasel-bin
            xq-bin
            simple-sddm-theme-2-git
            abootimg
            lazpaint-bin
            theforceengine
            expresslrs-configurator-bin
            cpufreqctl
            dosbox-x-sdl2
            asbru-cm-git
            task2
            fanctl-git
            bluetooth-autoconnect
            python-opensearch
            cisco-anyconnect
            r-tinytest
            terminaltexteffects-git
            nerdfetch
            ))

;;; Nonfree/proprietary license placeholder for Gaurix channel
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://spdx.org/licenses/"
    "Proprietary or custom license; see upstream for terms."))

;;; quickjs-ng --- small and embeddable JavaScript engine
(define-public quickjs-ng
  (package
    (name "quickjs-ng")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quickjs-ng.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small and embeddable JavaScript engine")
    (description "Small and embeddable JavaScript engine.")
    (home-page "https://quickjs-ng.github.io/quickjs")
    (license license:expat)))

;;; libimobiledevice-glue-git --- library with common code used by the libraries and tools around the libimobil...
(define-public libimobiledevice-glue-git
  (package
    (name "libimobiledevice-glue-git")
    (version "r46.214bafd")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libimobiledevice-glue-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library with common code used by the libraries and tools around the libimobil...")
    (description "Library with common code used by the libraries and tools around the libimobiledevice project.")
    (home-page "http://www.libimobiledevice.org/")
    (license license:lgpl2.1)))

;;; mpv-handler --- play website videos and songs with mpv & yt-dlp
(define-public mpv-handler
  (package
    (name "mpv-handler")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mpv-handler.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "play website videos and songs with mpv & yt-dlp")
    (description "Play website videos and songs with mpv & yt-dlp.")
    (home-page "https://github.com/akiirui/mpv-handler/")
    (license license:expat)))

;;; llama-benchy --- a simple CLI tool for benchmarking llama.cpp and other LLM inference engines
(define-public llama-benchy
  (package
    (name "llama-benchy")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/llama-benchy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple CLI tool for benchmarking llama.cpp and other LLM inference engines")
    (description "A simple CLI tool for benchmarking llama.cpp and other LLM inference engines.")
    (home-page "https://github.com/eugr/llama-benchy")
    (license license:expat)))

;;; rpcs3-git --- a Sony PlayStation 3 emulator
(define-public rpcs3-git
  (package
    (name "rpcs3-git")
    (version "0.0.40.r19204.4ffeee0344")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rpcs3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Sony PlayStation 3 emulator")
    (description "A Sony PlayStation 3 emulator.")
    (home-page "https://github.com/RPCS3/rpcs3")
    (license license:gpl2)))

;;; alacritty-theme-git --- collection of Alacritty color schemes
(define-public alacritty-theme-git
  (package
    (name "alacritty-theme-git")
    (version "1:r219.5f906a4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/alacritty-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "collection of Alacritty color schemes")
    (description "Collection of Alacritty color schemes.")
    (home-page "https://github.com/alacritty/alacritty-theme")
    (license license:asl2.0)))

;;; tributary --- a high-performance, Rhythmbox-style media manager with unified local and remo...
(define-public tributary
  (package
    (name "tributary")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tributary.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a high-performance, Rhythmbox-style media manager with unified local and remo...")
    (description "A high-performance, Rhythmbox-style media manager with unified local and remote backends.")
    (home-page "https://github.com/jm2/tributary")
    (license license:gpl3+)))

;;; normcap --- oCR powered screen-capture tool to capture information instead of images
(define-public normcap
  (package
    (name "normcap")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/normcap.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oCR powered screen-capture tool to capture information instead of images")
    (description "OCR powered screen-capture tool to capture information instead of images.")
    (home-page "https://dynobo.github.io/normcap")
    (license license:gpl3+)))

;;; minecraft-server --- minecraft server unit files, script, and jar
(define-public minecraft-server
  (package
    (name "minecraft-server")
    (version "26.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/minecraft-server.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minecraft server unit files, script, and jar")
    (description "Minecraft server unit files, script, and jar.")
    (home-page "https://minecraft.net/")
    (license license:nonfree)))

;;; grubforge --- a terminal UI for managing and customizing the GRUB bootloader — safely, intu...
(define-public grubforge
  (package
    (name "grubforge")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grubforge.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal UI for managing and customizing the GRUB bootloader — safely, intu...")
    (description "A terminal UI for managing and customizing the GRUB bootloader — safely, intuitively, and beautifully.")
    (home-page "https://github.com/jetomev/grubforge")
    (license license:gpl3)))

;;; gaur --- a beautiful, interactive TUI for Arch Linux package management
(define-public gaur
  (package
    (name "gaur")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gaur.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a beautiful, interactive TUI for Arch Linux package management")
    (description "A beautiful, interactive TUI for Arch Linux package management.")
    (home-page "https://github.com/prbhtkumr/gaur")
    (license license:gpl3)))

;;; telemost --- yandex video conferencing client (Wine). Camera and screen sharing may not wo...
(define-public telemost
  (package
    (name "telemost")
    (version "2.29.4.8139")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/telemost.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "yandex video conferencing client (Wine). Camera and screen sharing may not wo...")
    (description "Yandex video conferencing client (Wine). Camera and screen sharing may not work under Wine.")
    (home-page "https://telemost.yandex.com")
    (license license:nonfree)))

;;; zapret-git --- bypass deep packet inspection
(define-public zapret-git
  (package
    (name "zapret-git")
    (version "70.6.r7.gb12b1a5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zapret-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bypass deep packet inspection")
    (description "Bypass deep packet inspection.")
    (home-page "https://github.com/bol-van/zapret")
    (license license:expat)))

;;; python-sentence-transformers --- embeddings, Retrieval, and Reranking
(define-public python-sentence-transformers
  (package
    (name "python-sentence-transformers")
    (version "5.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-sentence-transformers.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "embeddings, Retrieval, and Reranking")
    (description "Embeddings, Retrieval, and Reranking.")
    (home-page "https://github.com/UKPLab/sentence-transformers")
    (license license:asl2.0)))

;;; kavita-bin --- self hosted ebook and comic reader
(define-public kavita-bin
  (package
    (name "kavita-bin")
    (version "0.8.9.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kavita-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "self hosted ebook and comic reader")
    (description "Self hosted ebook and comic reader.")
    (home-page "https://www.kavitareader.com/")
    (license license:gpl3)))

;;; wl-freeze-git --- wl-freeze is a community-driven utility to suspend a game process (and other ...
(define-public wl-freeze-git
  (package
    (name "wl-freeze-git")
    (version "2.0.1.r1.53475ba")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wl-freeze-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wl-freeze is a community-driven utility to suspend a game process (and other ...")
    (description "Wl-freeze is a community-driven utility to suspend a game process (and other programs) in Wayland compositors.")
    (home-page "https://github.com/Zerodya/wl-freeze")
    (license license:gpl3+)))

;;; vapoursynth-plugin-lsmashsource-git --- plugin for Vapoursynth: lsmashsource (GIT version)
(define-public vapoursynth-plugin-lsmashsource-git
  (package
    (name "vapoursynth-plugin-lsmashsource-git")
    (version "1194.0.0.0.5.gf41e8d5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-lsmashsource-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugin for Vapoursynth: lsmashsource (GIT version)")
    (description "Plugin for Vapoursynth: lsmashsource (GIT version).")
    (home-page "https://forum.doom9.org/showthread.php?t=167435")
    (license license:gpl3+)))

;;; libkscreen5 --- kDE screen management software
(define-public libkscreen5
  (package
    (name "libkscreen5")
    (version "5.27.12")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libkscreen5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kDE screen management software")
    (description "KDE screen management software.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:gpl3+)))

;;; palemoon --- open source web browser based on Firefox focusing on efficiency
(define-public palemoon
  (package
    (name "palemoon")
    (version "1:34.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/palemoon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source web browser based on Firefox focusing on efficiency")
    (description "Open source web browser based on Firefox focusing on efficiency.")
    (home-page "https://www.palemoon.org/")
    (license license:mpl2.0)))

;;; deta-surf --- deta Surf, an AI notebook that brings all your files and the web directly int...
(define-public deta-surf
  (package
    (name "deta-surf")
    (version "1.4.6_beta.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deta-surf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "deta Surf, an AI notebook that brings all your files and the web directly int...")
    (description "Deta Surf, an AI notebook that brings all your files and the web directly into your stream of thought.")
    (home-page "https://deta.surf")
    (license license:asl2.0)))

;;; openvpn3-git --- openVPN 3 Linux client
(define-public openvpn3-git
  (package
    (name "openvpn3-git")
    (version "27.r0.gf0c5ff7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openvpn3-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "openVPN 3 Linux client")
    (description "OpenVPN 3 Linux client.")
    (home-page "https://codeberg.org/OpenVPN/openvpn3-linux")
    (license license:agpl3)))

;;; mnt-reform-qcacld2-firmware --- firmware, config, and modprobe config for MNT Reform qcacld2 Wi-Fi
(define-public mnt-reform-qcacld2-firmware
  (package
    (name "mnt-reform-qcacld2-firmware")
    (version "20251018.277339b9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mnt-reform-qcacld2-firmware.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "firmware, config, and modprobe config for MNT Reform qcacld2 Wi-Fi")
    (description "Firmware, config, and modprobe config for MNT Reform qcacld2 Wi-Fi.")
    (home-page "https://source.mnt.re/reform/qcacld2")
    (license license:nonfree)))

;;; fluffychat --- the cutest instant messenger in the [matrix]
(define-public fluffychat
  (package
    (name "fluffychat")
    (version "2.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fluffychat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the cutest instant messenger in the [matrix]")
    (description "The cutest instant messenger in the [matrix].")
    (home-page "https://github.com/krille-chan/fluffychat")
    (license license:agpl3)))

;;; sheets-git --- terminal based spreadsheet tool (git release)
(define-public sheets-git
  (package
    (name "sheets-git")
    (version "r38.7beaf1a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sheets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal based spreadsheet tool (git release)")
    (description "Terminal based spreadsheet tool (git release).")
    (home-page "https://github.com/maaslalani/sheets")
    (license license:expat)))

;;; dolltool --- a simple dollcode encoder, decoder, and generator inside your terminal
(define-public dolltool
  (package
    (name "dolltool")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dolltool.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple dollcode encoder, decoder, and generator inside your terminal")
    (description "A simple dollcode encoder, decoder, and generator inside your terminal.")
    (home-page "https://git.gay/ika4422/dolltool")
    (license license:gpl3+)))

;;; tetro-tui --- a terminal-based but modern tetromino-stacking game that is very customizable...
(define-public tetro-tui
  (package
    (name "tetro-tui")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tetro-tui.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal-based but modern tetromino-stacking game that is very customizable...")
    (description "A terminal-based but modern tetromino-stacking game that is very customizable and cross-platform.")
    (home-page "https://github.com/Strophox/tetro-tui")
    (license license:expat)))

;;; ttf-ms-win11 --- microsoft Windows 11 TrueType fonts
(define-public ttf-ms-win11
  (package
    (name "ttf-ms-win11")
    (version "10.0.26200.8246")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-win11.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Windows 11 TrueType fonts")
    (description "Microsoft Windows 11 TrueType fonts.")
    (home-page "http://www.microsoft.com/typography/fonts/product.aspx?PID=164")
    (license license:nonfree)))

;;; linuxqq-clipsync-git --- 修复Linuxqq以Wayland运行时的剪贴板异常。
(define-public linuxqq-clipsync-git
  (package
    (name "linuxqq-clipsync-git")
    (version "r23.a1d662a")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/linuxqq-clipsync-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "修复Linuxqq以Wayland运行时的剪贴板异常。")
    (description "修复Linuxqq以Wayland运行时的剪贴板异常。.")
    (home-page "https://github.com/SHORiN-KiWATA/linuxqq-clipsync")
    (license license:expat)))

;;; cliphist-tui-git --- a wayland clipboard TUI based on fzf and cliphist. Use chafa for image previe...
(define-public cliphist-tui-git
  (package
    (name "cliphist-tui-git")
    (version "r49.g745410d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cliphist-tui-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a wayland clipboard TUI based on fzf and cliphist. Use chafa for image previe...")
    (description "A wayland clipboard TUI based on fzf and cliphist. Use chafa for image preview.")
    (home-page "https://github.com/SHORiN-KiWATA/cliphist-tui")
    (license license:expat)))

;;; gpu-viewer --- a frontend to glxinfo and vulkaninfo
(define-public gpu-viewer
  (package
    (name "gpu-viewer")
    (version "3.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gpu-viewer.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a frontend to glxinfo and vulkaninfo")
    (description "A frontend to glxinfo and vulkaninfo.")
    (home-page "https://github.com/arunsivaramanneo/GPU-Viewer/")
    (license license:gpl3+)))

;;; insomnia-bin --- aPI Client and Design Platform for GraphQL and REST
(define-public insomnia-bin
  (package
    (name "insomnia-bin")
    (version "1:12.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/insomnia-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "aPI Client and Design Platform for GraphQL and REST")
    (description "API Client and Design Platform for GraphQL and REST.")
    (home-page "https://insomnia.rest")
    (license license:asl2.0)))

;;; python-click-plugins --- an extension module for click to enable registering CLI commands via setuptoo...
(define-public python-click-plugins
  (package
    (name "python-click-plugins")
    (version "1.1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-click-plugins.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an extension module for click to enable registering CLI commands via setuptoo...")
    (description "An extension module for click to enable registering CLI commands via setuptools entry-points.")
    (home-page "https://github.com/click-contrib/click-plugins")
    (license license:bsd-3)))

;;; thonny --- python IDE for beginners
(define-public thonny
  (package
    (name "thonny")
    (version "4.1.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/thonny.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python IDE for beginners")
    (description "Python IDE for beginners.")
    (home-page "https://thonny.org")
    (license license:expat)))

;;; eduke32 --- an advanced Duke Nukem 3D source port
(define-public eduke32
  (package
    (name "eduke32")
    (version "20260203.r10664_ba6b7bb1d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eduke32.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced Duke Nukem 3D source port")
    (description "An advanced Duke Nukem 3D source port.")
    (home-page "http://eduke32.com/")
    (license license:nonfree)))

;;; ryujinx --- experimental Nintendo Switch Emulator written in C#
(define-public ryujinx
  (package
    (name "ryujinx")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ryujinx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "experimental Nintendo Switch Emulator written in C#")
    (description "Experimental Nintendo Switch Emulator written in C#.")
    (home-page "https://git.ryujinx.app/ryubing/ryujinx")
    (license license:expat)))

;;; python-google-crc32c --- wraps Google's crc32c library into a Python wrapper
(define-public python-google-crc32c
  (package
    (name "python-google-crc32c")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-google-crc32c.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "wraps Google's crc32c library into a Python wrapper")
    (description "Wraps Google's crc32c library into a Python wrapper.")
    (home-page "https://github.com/googleapis/python-crc32c")
    (license license:asl2.0)))

;;; apparmor.d.enforced --- full set of apparmor profiles (enforced mode)
(define-public apparmor.d.enforced
  (package
    (name "apparmor.d.enforced")
    (version "0.4907.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apparmor.d.enforced.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full set of apparmor profiles (enforced mode)")
    (description "Full set of apparmor profiles (enforced mode).")
    (home-page "https://github.com/roddhjav/apparmor.d")
    (license license:gpl2)))

;;; apparmor.d --- full set of apparmor profiles (complain mode)
(define-public apparmor.d
  (package
    (name "apparmor.d")
    (version "0.4907.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/apparmor.d.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "full set of apparmor profiles (complain mode)")
    (description "Full set of apparmor profiles (complain mode).")
    (home-page "https://github.com/roddhjav/apparmor.d")
    (license license:gpl2)))

;;; pam-rssh --- a PAM module that provides ssh-agent based authentication
(define-public pam-rssh
  (package
    (name "pam-rssh")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pam_rssh.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a PAM module that provides ssh-agent based authentication")
    (description "A PAM module that provides ssh-agent based authentication.")
    (home-page "https://github.com/z4yx/pam_rssh")
    (license license:expat)))

;;; vivaldi-snapshot-ffmpeg-codecs --- additional support for proprietary codecs for vivaldi-snapshot
(define-public vivaldi-snapshot-ffmpeg-codecs
  (package
    (name "vivaldi-snapshot-ffmpeg-codecs")
    (version "148.0.7778.43")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vivaldi-snapshot-ffmpeg-codecs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "additional support for proprietary codecs for vivaldi-snapshot")
    (description "Additional support for proprietary codecs for vivaldi-snapshot.")
    (home-page "https://chromium.googlesource.com/chromium/third_party/ffmpeg")
    (license license:lgpl2.1+)))

;;; gram-git --- a code editor for humanoid apes and grumpy toads
(define-public gram-git
  (package
    (name "gram-git")
    (version ".r0.geb4318f")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gram-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a code editor for humanoid apes and grumpy toads")
    (description "A code editor for humanoid apes and grumpy toads.")
    (home-page "https://gram.liten.app/")
    (license license:agpl3+)))

;;; find-the-command --- advanced command-not-found hook for bash, fish and zsh using the power of pac...
(define-public find-the-command
  (package
    (name "find-the-command")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/find-the-command.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced command-not-found hook for bash, fish and zsh using the power of pac...")
    (description "Advanced command-not-found hook for bash, fish and zsh using the power of pacman.")
    (home-page "https://github.com/pkasemir/find-the-command")
    (license license:wtfpl2)))

;;; vital-synth --- spectral warping wavetable synth. Manual download of .deb installer required
(define-public vital-synth
  (package
    (name "vital-synth")
    (version "1.5.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vital-synth.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "spectral warping wavetable synth. Manual download of .deb installer required")
    (description "Spectral warping wavetable synth. Manual download of .deb installer required.")
    (home-page "https://vital.audio")
    (license license:nonfree)))

;;; pay-respects --- command suggestions, command-not-found and thefuck replacement written in Rus...
(define-public pay-respects
  (package
    (name "pay-respects")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pay-respects.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command suggestions, command-not-found and thefuck replacement written in Rus...")
    (description "Command suggestions, command-not-found and thefuck replacement written in Rust (All modules).")
    (home-page "https://github.com/iffse/pay-respects")
    (license license:agpl3+)))

;;; staruml --- a sophisticated software modeler
(define-public staruml
  (package
    (name "staruml")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/staruml.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a sophisticated software modeler")
    (description "A sophisticated software modeler.")
    (home-page "http://staruml.io/")
    (license license:nonfree)))

;;; java-service-wrapper --- enables a Java Application to be run as a Windows Service or Unix Daemon
(define-public java-service-wrapper
  (package
    (name "java-service-wrapper")
    (version "3.6.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/java-service-wrapper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "enables a Java Application to be run as a Windows Service or Unix Daemon")
    (description "Enables a Java Application to be run as a Windows Service or Unix Daemon.")
    (home-page "https://wrapper.tanukisoftware.com/doc/english/introduction.html")
    (license license:nonfree)))

;;; tlrc --- official tldr client written in Rust
(define-public tlrc
  (package
    (name "tlrc")
    (version "1.13.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tlrc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official tldr client written in Rust")
    (description "Official tldr client written in Rust.")
    (home-page "https://github.com/tldr-pages/tlrc")
    (license license:expat)))

;;; woeusb --- a Linux program to create Windows USB stick installer from a Windows DVD or a...
(define-public woeusb
  (package
    (name "woeusb")
    (version "5.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/woeusb.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Linux program to create Windows USB stick installer from a Windows DVD or a...")
    (description "A Linux program to create Windows USB stick installer from a Windows DVD or an image.")
    (home-page "https://github.com/WoeUSB/WoeUSB")
    (license license:gpl3)))

;;; atlauncher --- a launcher for Minecraft which integrates multiple different modpacks to allo...
(define-public atlauncher
  (package
    (name "atlauncher")
    (version "3.4.40.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/atlauncher.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a launcher for Minecraft which integrates multiple different modpacks to allo...")
    (description "A launcher for Minecraft which integrates multiple different modpacks to allow you to download and install modpacks easily and quickly.")
    (home-page "https://github.com/ATLauncher/ATLauncher")
    (license license:gpl3)))

;;; yt-dlp-drop-in --- provide both youtube-dl command and python imports using yt-dlp
(define-public yt-dlp-drop-in
  (package
    (name "yt-dlp-drop-in")
    (version "2026.03.17")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/yt-dlp-drop-in.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provide both youtube-dl command and python imports using yt-dlp")
    (description "Provide both youtube-dl command and python imports using yt-dlp.")
    (home-page "https://aur.archlinux.org/packages/yt-dlp-drop-in")
    (license license:unlicense)))

;;; python-lzo --- python bindings for the LZO data compression library
(define-public python-lzo
  (package
    (name "python-lzo")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-lzo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for the LZO data compression library")
    (description "Python bindings for the LZO data compression library.")
    (home-page "https://pypi.python.org/pypi/python-lzo")
    (license license:gpl2)))

;;; spotube-bin --- open source Music client that doesn't require Premium nor uses Electron! Avai...
(define-public spotube-bin
  (package
    (name "spotube-bin")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/spotube-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source Music client that doesn't require Premium nor uses Electron! Avai...")
    (description "Open source Music client that doesn't require Premium nor uses Electron! Available for both desktop & mobile!.")
    (home-page "https://spotube.krtirtho.dev")
    (license license:bsd-3)))

;;; plasma6-wallpapers-wallpaper-engine-git --- a simple kde wallpaper plugin integrating wallpaper engine
(define-public plasma6-wallpapers-wallpaper-engine-git
  (package
    (name "plasma6-wallpapers-wallpaper-engine-git")
    (version "0.5.4.r118.gf1b86e1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma6-wallpapers-wallpaper-engine-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a simple kde wallpaper plugin integrating wallpaper engine")
    (description "A simple kde wallpaper plugin integrating wallpaper engine.")
    (home-page "https://github.com/catsout/wallpaper-engine-kde-plugin")
    (license license:gpl2)))

;;; aconfmgr-git --- a configuration manager for Arch Linux
(define-public aconfmgr-git
  (package
    (name "aconfmgr-git")
    (version "r634.ca09eea")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aconfmgr-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a configuration manager for Arch Linux")
    (description "A configuration manager for Arch Linux.")
    (home-page "https://github.com/CyberShadow/aconfmgr")
    (license license:expat)))

;;; guile-g-golf --- a library for developing modern applications (GTK) in Guile Scheme
(define-public guile-g-golf
  (package
    (name "guile-g-golf")
    (version "0.8.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/guile-g-golf.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a library for developing modern applications (GTK) in Guile Scheme")
    (description "A library for developing modern applications (GTK) in Guile Scheme.")
    (home-page "https://www.gnu.org/software/g-golf/learn.html")
    (license license:gpl3+)))

;;; diffr --- word-by-word diff highlighting tool
(define-public diffr
  (package
    (name "diffr")
    (version "0.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/diffr.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "word-by-word diff highlighting tool")
    (description "Word-by-word diff highlighting tool.")
    (home-page "https://github.com/mookid/diffr")
    (license license:expat)))

;;; python-ctranslate2 --- a Python library for efficient inference with Transformer models
(define-public python-ctranslate2
  (package
    (name "python-ctranslate2")
    (version "4.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-ctranslate2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Python library for efficient inference with Transformer models")
    (description "A Python library for efficient inference with Transformer models.")
    (home-page "https://github.com/OpenNMT/CTranslate2")
    (license license:expat)))

;;; ctranslate2 --- a C++ library for efficient inference with Transformer models
(define-public ctranslate2
  (package
    (name "ctranslate2")
    (version "4.7.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ctranslate2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a C++ library for efficient inference with Transformer models")
    (description "A C++ library for efficient inference with Transformer models.")
    (home-page "https://github.com/OpenNMT/CTranslate2")
    (license license:expat)))

;;; python-asgi-lifespan --- programmatic startup/shutdown of ASGI apps
(define-public python-asgi-lifespan
  (package
    (name "python-asgi-lifespan")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-asgi-lifespan.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "programmatic startup/shutdown of ASGI apps")
    (description "Programmatic startup/shutdown of ASGI apps.")
    (home-page "https://github.com/florimondmanca/asgi-lifespan")
    (license license:expat)))

;;; companion --- control software for the Elgato Streamdeck with a focus on broadcasting
(define-public companion
  (package
    (name "companion")
    (version "4.2.5")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/companion.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "control software for the Elgato Streamdeck with a focus on broadcasting")
    (description "Control software for the Elgato Streamdeck with a focus on broadcasting.")
    (home-page "https://github.com/bitfocus/companion")
    (license license:nonfree)))

;;; audacious-plugins-git --- plugins for Audacious (git version)
(define-public audacious-plugins-git
  (package
    (name "audacious-plugins-git")
    (version "1:4.5.1.r88.gf00109c94")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/audacious-plugins-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "plugins for Audacious (git version)")
    (description "Plugins for Audacious (git version).")
    (home-page "https://audacious-media-player.org/")
    (license license:bsd-3)))

;;; fileoptimizer-bin --- lossless file size optimizer supporting multiple formats
(define-public fileoptimizer-bin
  (package
    (name "fileoptimizer-bin")
    (version "17.10.2857")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fileoptimizer-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "lossless file size optimizer supporting multiple formats")
    (description "Lossless file size optimizer supporting multiple formats.")
    (home-page "https://nikkhokkho.sourceforge.io/?page=FileOptimizer")
    (license license:gpl3+)))

;;; python-faster-whisper --- faster Whisper transcription with CTranslate2
(define-public python-faster-whisper
  (package
    (name "python-faster-whisper")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-faster-whisper.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "faster Whisper transcription with CTranslate2")
    (description "Faster Whisper transcription with CTranslate2.")
    (home-page "https://github.com/SYSTRAN/faster-whisper")
    (license license:expat)))

;;; libredwg --- a free C library to handle DWG files
(define-public libredwg
  (package
    (name "libredwg")
    (version "0.13.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libredwg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free C library to handle DWG files")
    (description "A free C library to handle DWG files.")
    (home-page "https://gnu.org/software/libredwg/")
    (license license:gpl3)))

;;; artanis --- a fast monolithic web-framework of Scheme
(define-public artanis
  (package
    (name "artanis")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/artanis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a fast monolithic web-framework of Scheme")
    (description "A fast monolithic web-framework of Scheme.")
    (home-page "https://artanis.dev/")
    (license license:gpl3)))

;;; python-msal --- authenticate with Microsoft Entra (Azure Active Directory) accounts using OAu...
(define-public python-msal
  (package
    (name "python-msal")
    (version "1.32.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-msal.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "authenticate with Microsoft Entra (Azure Active Directory) accounts using OAu...")
    (description "Authenticate with Microsoft Entra (Azure Active Directory) accounts using OAuth2 and OpenID Connect.")
    (home-page "https://github.com/AzureAD/microsoft-authentication-library-for-python")
    (license license:expat)))

;;; python-azure-core --- microsoft Azure Core Shared Client Library for Python
(define-public python-azure-core
  (package
    (name "python-azure-core")
    (version "1.39.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-azure-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "microsoft Azure Core Shared Client Library for Python")
    (description "Microsoft Azure Core Shared Client Library for Python.")
    (home-page "https://github.com/Azure/azure-sdk-for-python")
    (license license:expat)))

;;; wsjtx --- software for Amateur Radio Weak-Signal Communication (JT9 and JT65)
(define-public wsjtx
  (package
    (name "wsjtx")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/wsjtx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software for Amateur Radio Weak-Signal Communication (JT9 and JT65)")
    (description "Software for Amateur Radio Weak-Signal Communication (JT9 and JT65).")
    (home-page "https://sourceforge.net/projects/wsjt/")
    (license license:gpl3)))

;;; insync-nautilus --- python extension and icons for integrating Insync with Nautilus
(define-public insync-nautilus
  (package
    (name "insync-nautilus")
    (version "3.9.5.60024")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/insync-nautilus.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python extension and icons for integrating Insync with Nautilus")
    (description "Python extension and icons for integrating Insync with Nautilus.")
    (home-page "https://www.insynchq.com/downloads")
    (license license:nonfree)))

;;; gruvbox-material-icon-theme-git --- gruvbox Material icon theme
(define-public gruvbox-material-icon-theme-git
  (package
    (name "gruvbox-material-icon-theme-git")
    (version "r14.cc255d43")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gruvbox-material-icon-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gruvbox Material icon theme")
    (description "Gruvbox Material icon theme.")
    (home-page "https://github.com/sainnhe/gruvbox-material-gtk")
    (license license:expat)))

;;; gruvbox-material-gtk-theme-git --- gruvbox Material theme for GTK, Gnome, Cinnamon, XFCE, Unity and Plank
(define-public gruvbox-material-gtk-theme-git
  (package
    (name "gruvbox-material-gtk-theme-git")
    (version "r14.cc255d43")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gruvbox-material-gtk-theme-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gruvbox Material theme for GTK, Gnome, Cinnamon, XFCE, Unity and Plank")
    (description "Gruvbox Material theme for GTK, Gnome, Cinnamon, XFCE, Unity and Plank.")
    (home-page "https://github.com/sainnhe/gruvbox-material-gtk")
    (license license:expat)))

;;; nordzy-cursors --- cursor theme using the Nord color palette and based on Vimix and cz-Viator
(define-public nordzy-cursors
  (package
    (name "nordzy-cursors")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nordzy-cursors.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cursor theme using the Nord color palette and based on Vimix and cz-Viator")
    (description "Cursor theme using the Nord color palette and based on Vimix and cz-Viator.")
    (home-page "https://gitlab.com/gboehm/Nordzy-cursors")
    (license license:gpl3)))

;;; nvidia-patch-git --- apply nvidia-patch by keylase automatically, unlock nvfbc and nvenc limit
(define-public nvidia-patch-git
  (package
    (name "nvidia-patch-git")
    (version "r1083.ac0afeb")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nvidia-patch-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apply nvidia-patch by keylase automatically, unlock nvfbc and nvenc limit")
    (description "Apply nvidia-patch by keylase automatically, unlock nvfbc and nvenc limit.")
    (home-page "https://github.com/keylase/nvidia-patch")
    (license license:nonfree)))

;;; ictree-bin --- like tree but interactive
(define-public ictree-bin
  (package
    (name "ictree-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ictree-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "like tree but interactive")
    (description "Like tree but interactive.")
    (home-page "https://nikitaivanovv.github.io/ictree")
    (license license:gpl3+)))

;;; activate-linux-git --- the 'Activate Windows' watermark ported to Linux with Xlib and cairo in C
(define-public activate-linux-git
  (package
    (name "activate-linux-git")
    (version "r376.347a579")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/activate-linux-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the 'Activate Windows' watermark ported to Linux with Xlib and cairo in C")
    (description "The 'Activate Windows' watermark ported to Linux with Xlib and cairo in C.")
    (home-page "https://github.com/MrGlockenspiel/activate-linux")
    (license license:gpl3)))

;;; snowflake-pt-client --- snowflake is a pluggable transport that proxies traffic through temporary pro...
(define-public snowflake-pt-client
  (package
    (name "snowflake-pt-client")
    (version "2.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/snowflake-pt-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "snowflake is a pluggable transport that proxies traffic through temporary pro...")
    (description "Snowflake is a pluggable transport that proxies traffic through temporary proxies using WebRTC.")
    (home-page "https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/wikis/home")
    (license license:bsd-3)))

;;; python-langchain-text-splitters --- langChain text splitting utilities
(define-public python-langchain-text-splitters
  (package
    (name "python-langchain-text-splitters")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-langchain-text-splitters.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "langChain text splitting utilities")
    (description "LangChain text splitting utilities.")
    (home-page "https://github.com/langchain-ai/langchain/tree/master/libs/text-splitters")
    (license license:expat)))

;;; python-langchain-core --- building applications with LLMs through composability
(define-public python-langchain-core
  (package
    (name "python-langchain-core")
    (version "1.2.27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-langchain-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "building applications with LLMs through composability")
    (description "Building applications with LLMs through composability.")
    (home-page "https://github.com/langchain-ai/langchain/tree/master/libs/core")
    (license license:expat)))

;;; xfce4-dev-tools-git --- the Xfce development tools
(define-public xfce4-dev-tools-git
  (package
    (name "xfce4-dev-tools-git")
    (version "4.20.0.r15.g0b950ed")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xfce4-dev-tools-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Xfce development tools")
    (description "The Xfce development tools.")
    (home-page "https://gitlab.xfce.org/xfce/xfce4-dev-tools")
    (license license:gpl2+)))

;;; python-langchain --- building applications with LLMs through composability
(define-public python-langchain
  (package
    (name "python-langchain")
    (version "1.2.15")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-langchain.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "building applications with LLMs through composability")
    (description "Building applications with LLMs through composability.")
    (home-page "https://github.com/langchain-ai/langchain/tree/master/libs/langchain")
    (license license:expat)))

;;; cylon --- updates, Maintenance, backup and system checks in a menu driven TUI written i...
(define-public cylon
  (package
    (name "cylon")
    (version "6.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cylon.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "updates, Maintenance, backup and system checks in a menu driven TUI written i...")
    (description "Updates, Maintenance, backup and system checks in a menu driven TUI written in Bash.")
    (home-page "https://github.com/gavinlyonsrepo/cylon")
    (license license:gpl3+)))

;;; psf-cozette --- a bitmap programming font optimized for coziness, console version (PSF format...
(define-public psf-cozette
  (package
    (name "psf-cozette")
    (version "1.24.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psf-cozette.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a bitmap programming font optimized for coziness, console version (PSF format...")
    (description "A bitmap programming font optimized for coziness, console version (PSF format).")
    (home-page "https://github.com/slavfox/Cozette")
    (license license:expat)))

;;; dasel-bin --- query and update data structures from the command line
(define-public dasel-bin
  (package
    (name "dasel-bin")
    (version "3.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dasel-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "query and update data structures from the command line")
    (description "Query and update data structures from the command line.")
    (home-page "https://github.com/TomWright/dasel")
    (license license:expat)))

;;; xq-bin --- command-line XML and HTML beautifier and content extractor
(define-public xq-bin
  (package
    (name "xq-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xq-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line XML and HTML beautifier and content extractor")
    (description "Command-line XML and HTML beautifier and content extractor.")
    (home-page "https://github.com/sibprogrammer/xq")
    (license license:expat)))

;;; simple-sddm-theme-2-git --- simple theme variant for the SDDM Login Manager using Qt6
(define-public simple-sddm-theme-2-git
  (package
    (name "simple-sddm-theme-2-git")
    (version "_")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/simple-sddm-theme-2-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple theme variant for the SDDM Login Manager using Qt6")
    (description "Simple theme variant for the SDDM Login Manager using Qt6.")
    (home-page "https://github.com/JaKooLit/simple-sddm-2")
    (license license:gpl3)))

;;; abootimg --- a tool to read/write/update old android boot images
(define-public abootimg
  (package
    (name "abootimg")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/abootimg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to read/write/update old android boot images")
    (description "A tool to read/write/update old android boot images.")
    (home-page "https://github.com/ggrandou/abootimg")
    (license license:gpl3+)))

;;; lazpaint-bin --- image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal)....
(define-public lazpaint-bin
  (package
    (name "lazpaint-bin")
    (version "7.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lazpaint-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal)....")
    (description "Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal). Binary release (GTK2).")
    (home-page "https://lazpaint.github.io/")
    (license license:gpl3)))

;;; theforceengine --- modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the fut...
(define-public theforceengine
  (package
    (name "theforceengine")
    (version "1.22.420")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/theforceengine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the fut...")
    (description "Modern "Jedi Engine" replacement supporting Dark Forces, mods, and in the future Outlaws.")
    (home-page "https://theforceengine.github.io/")
    (license license:gpl2)))

;;; expresslrs-configurator-bin --- cross platform configuration & build tool for the ExpressLRS radio link
(define-public expresslrs-configurator-bin
  (package
    (name "expresslrs-configurator-bin")
    (version "1.7.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/expresslrs-configurator-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross platform configuration & build tool for the ExpressLRS radio link")
    (description "Cross platform configuration & build tool for the ExpressLRS radio link.")
    (home-page "https://github.com/ExpressLRS/ExpressLRS-Configurator")
    (license license:gpl3+)))

;;; cpufreqctl --- a intel_pstate CPU freq controller for regular user (extracted from extension...
(define-public cpufreqctl
  (package
    (name "cpufreqctl")
    (version "10.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cpufreqctl.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a intel_pstate CPU freq controller for regular user (extracted from extension...")
    (description "A intel_pstate CPU freq controller for regular user (extracted from extension 'CPU Power Manager for Gnome').")
    (home-page "https://github.com/martin31821/cpupower")
    (license license:gpl3+)))

;;; dosbox-x-sdl2 --- x86 emulator with builtin DOS, with patches and more features
(define-public dosbox-x-sdl2
  (package
    (name "dosbox-x-sdl2")
    (version "2026.03.29")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dosbox-x-sdl2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "x86 emulator with builtin DOS, with patches and more features")
    (description "X86 emulator with builtin DOS, with patches and more features.")
    (home-page "http://dosbox-x.com")
    (license license:gpl2+)))

;;; asbru-cm-git --- a free and open-source connection manager. master branch
(define-public asbru-cm-git
  (package
    (name "asbru-cm-git")
    (version "v6.4.1.r0.g001d217")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asbru-cm-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a free and open-source connection manager. master branch")
    (description "A free and open-source connection manager. master branch.")
    (home-page "https://github.com/asbru-cm/asbru-cm")
    (license license:gpl3)))

;;; task2 --- taskwarrior 2.X, a command-line todo list manager (prior to its breaking-chan...
(define-public task2
  (package
    (name "task2")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/task2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "taskwarrior 2.X, a command-line todo list manager (prior to its breaking-chan...")
    (description "Taskwarrior 2.X, a command-line todo list manager (prior to its breaking-change rewrite of version 3.0).")
    (home-page "https://taskwarrior.org/")
    (license license:expat)))

;;; fanctl-git --- replacement for fancontrol with more approachable and powerful config interfa...
(define-public fanctl-git
  (package
    (name "fanctl-git")
    (version "0.5.1.r2.578f7d1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fanctl-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "replacement for fancontrol with more approachable and powerful config interfa...")
    (description "Replacement for fancontrol with more approachable and powerful config interface.")
    (home-page "https://gitlab.com/mcoffin/fanctl")
    (license license:gpl3)))

;;; bluetooth-autoconnect --- a service to automatically connect to all paired and trusted bluetooth device...
(define-public bluetooth-autoconnect
  (package
    (name "bluetooth-autoconnect")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bluetooth-autoconnect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a service to automatically connect to all paired and trusted bluetooth device...")
    (description "A service to automatically connect to all paired and trusted bluetooth devices.")
    (home-page "https://github.com/jrouleau/bluetooth-autoconnect")
    (license license:expat)))

;;; python-opensearch --- python Client for OpenSearch
(define-public python-opensearch
  (package
    (name "python-opensearch")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-opensearch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python Client for OpenSearch")
    (description "Python Client for OpenSearch.")
    (home-page "https://github.com/opensearch-project/opensearch-py")
    (license license:asl2.0)))

;;; cisco-anyconnect --- cisco AnyConnect Secure Mobility Client
(define-public cisco-anyconnect
  (package
    (name "cisco-anyconnect")
    (version "4.10.08029")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cisco-anyconnect.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cisco AnyConnect Secure Mobility Client")
    (description "Cisco AnyConnect Secure Mobility Client.")
    (home-page "https://www.cisco.com/c/en/us/support/security/anyconnect-secure-mobility-client-v4-x/model.html")
    (license license:nonfree)))

;;; r-tinytest --- lightweight and Feature Complete Unit Testing Framework
(define-public r-tinytest
  (package
    (name "r-tinytest")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/r-tinytest.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight and Feature Complete Unit Testing Framework")
    (description "Lightweight and Feature Complete Unit Testing Framework.")
    (home-page "https://cran.r-project.org/package=tinytest")
    (license license:gpl3)))

;;; terminaltexteffects-git --- visual effects engine applied to text in the terminal
(define-public terminaltexteffects-git
  (package
    (name "terminaltexteffects-git")
    (version "0.14.2.r20.g7760ef2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/terminaltexteffects-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual effects engine applied to text in the terminal")
    (description "Visual effects engine applied to text in the terminal.")
    (home-page "https://github.com/ChrisBuilds/terminaltexteffects")
    (license license:expat)))

;;; nerdfetch --- a POSIX fetch using NerdFonts
(define-public nerdfetch
  (package
    (name "nerdfetch")
    (version "8.5.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nerdfetch.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a POSIX fetch using NerdFonts")
    (description "A POSIX fetch using NerdFonts.")
    (home-page "https://github.com/thatonecalculator/NerdFetch")
    (license license:expat)))

