;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413d
;;; Resolves 100 packages from TODO queue:
;;;   - 67 recipes created
;;;   - 33 blocked with specific reason codes
;;;
;;; Recipes (67):
;;;   - icebar-git (gnu, expat)
;;;   - ruby-install (copy, expat)
;;;   - cine (meson, gpl3+)
;;;   - wifitui-bin (copy, expat)
;;;   - vibe-bin (copy, expat)
;;;   - samrewritten (cmake, gpl3)
;;;   - linuxqq (copy, nonfree)
;;;   - czkawka-cli (cargo, expat)
;;;   - czkawka-gui (cargo, expat)
;;;   - mouse-actions-gui-bin (copy, expat)
;;;   - wluma (cargo, isc)
;;;   - mtkclient (python, gpl3)
;;;   - micyou-bin (copy, expat)
;;;   - atostekid (copy, nonfree)
;;;   - catppuccin-gtk-theme-macchiato (gnu, gpl3+)
;;;   - lidm (gnu, gpl3)
;;;   - ntfysh (go, gpl2)
;;;   - phonon-qt6-mpv (cmake, lgpl2.1)
;;;   - sioyek-dev (cmake, gpl3+)
;;;   - x3dctl (cmake, expat)
;;;   - teamviewer (copy, nonfree)
;;;   - v2rayn-bin (copy, gpl3+)
;;;   - termflix-bin (copy, expat)
;;;   - lavat-git (gnu, expat)
;;;   - clash-party-bin (copy, gpl3+)
;;;   - input-remapper-bin (copy, gpl3)
;;;   - deadlock-modmanager (cargo, gpl3)
;;;   - gitlab-ci-local (copy, expat)
;;;   - ttf-readex-pro-variable (gnu, silofl1.1)
;;;   - bugwarrior (python, gpl3+)
;;;   - betterbird-de-bin (copy, mpl2.0)
;;;   - rate-mirrors-git (cargo, gpl3+)
;;;   - raw-thumbnailer (meson, gpl2+)
;;;   - samsung-unified-driver (copy, nonfree)
;;;   - aseprite (copy, nonfree)
;;;   - octoberctl-bin (copy, gpl3+)
;;;   - legacy-launcher-ely-by (copy, gpl3+)
;;;   - 7zkpxc (copy, gpl3+)
;;;   - pear-desktop (gnu, expat)
;;;   - xray (go, mpl2.0)
;;;   - github-copilot-cli (gnu, nonfree)
;;;   - blogtato (cargo, asl2.0)
;;;   - fetchdots (copy, gpl3+)
;;;   - ensu-bin (copy, agpl3+)
;;;   - gzdoom (cmake, bsd-3)
;;;   - handy-bin (copy, expat)
;;;   - mongoclock (gnu, isc)
;;;   - eidklient-native (copy, nonfree)
;;;   - sherlock-git (python, expat)
;;;   - mtkclient-git (python, gpl3)
;;;   - turing-smart-screen-python (python, gpl3+)
;;;   - airi-bin (copy, expat)
;;;   - coolercontrold-bin (copy, gpl3+)
;;;   - oscar (cmake, gpl3)
;;;   - far2l-git (cmake, gpl2)
;;;   - pinchtab-bin (copy, expat)
;;;   - obs-pwvideo (cmake, gpl2+)
;;;   - packet (cargo, gpl3+)
;;;   - arrpc (copy, expat)
;;;   - spicetify-marketplace-bin (copy, expat)
;;;   - mistral-vibe (python, asl2.0)
;;;   - aider-chat-docs (gnu, asl2.0)
;;;   - ast-firmware (copy, nonfree)
;;;   - lssecret-git (meson, unlicense)
;;;   - spout2pw-bin (python, lgpl2.1)
;;;   - signalbackup-tools-git (cmake, gpl3+)
;;;   - scarlett4-firmware (gnu, nonfree)
;;;
;;; Blocked (33):
;;;   - fresh-editor (NEEDS_RECIPE_DESIGN)
;;;   - sonic-desktop-interface (NEEDS_RECIPE_DESIGN)
;;;   - feishin (NEEDS_RECIPE_DESIGN)
;;;   - slack-electron (NEEDS_RECIPE_DESIGN)
;;;   - wechat-universal-bwrap (NEEDS_RECIPE_DESIGN)
;;;   - krokiet (NEEDS_RECIPE_DESIGN)
;;;   - seerr (NEEDS_RECIPE_DESIGN)
;;;   - modrinth-app (NEEDS_RECIPE_DESIGN)
;;;   - whisper.cpp-hip (DEP_RESOLUTION_FAILED)
;;;   - snapd (NEEDS_RECIPE_DESIGN)
;;;   - plasma6-applets-thermal-monitor-git (NEEDS_RECIPE_DESIGN)
;;;   - nvidia-vulkan-open-dkms (NEEDS_RECIPE_DESIGN)
;;;   - opencl-nvidia-vulkan (NEEDS_RECIPE_DESIGN)
;;;   - lib32-nvidia-vulkan-utils (NEEDS_RECIPE_DESIGN)
;;;   - lib32-opencl-nvidia-vulkan (NEEDS_RECIPE_DESIGN)
;;;   - amneziawg-dkms (NEEDS_RECIPE_DESIGN)
;;;   - virtualbox-ext-oracle (NEEDS_RECIPE_DESIGN)
;;;   - cuda-12.9 (NEEDS_RECIPE_DESIGN)
;;;   - azahar-git (NEEDS_RECIPE_DESIGN)
;;;   - libretro-azahar-git (NEEDS_RECIPE_DESIGN)
;;;   - paccache-hook (NEEDS_RECIPE_DESIGN)
;;;   - pamac-aur (NEEDS_RECIPE_DESIGN)
;;;   - linux-mainline-docs (NEEDS_RECIPE_DESIGN)
;;;   - mkinitcpio-numlock (NEEDS_RECIPE_DESIGN)
;;;   - discord_arch_electron (NEEDS_RECIPE_DESIGN)
;;;   - cider (NEEDS_RECIPE_DESIGN)
;;;   - linuxqq-nt-bwrap (NEEDS_RECIPE_DESIGN)
;;;   - hyprqt6engine (NEEDS_RECIPE_DESIGN)
;;;   - orca-slicer (NEEDS_RECIPE_DESIGN)
;;;   - kanidm (NEEDS_RECIPE_DESIGN)
;;;   - ladybird (NEEDS_RECIPE_DESIGN)
;;;   - pacdiff-pacman-hook-git (NEEDS_RECIPE_DESIGN)
;;;   - r8125-dkms (NEEDS_RECIPE_DESIGN)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413d)
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
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:export (
            icebar-git
            ruby-install
            cine
            wifitui-bin
            vibe-bin
            samrewritten
            linuxqq
            czkawka-cli
            czkawka-gui
            mouse-actions-gui-bin
            wluma
            mtkclient
            micyou-bin
            atostekid
            catppuccin-gtk-theme-macchiato
            lidm
            ntfysh
            phonon-qt6-mpv
            sioyek-dev
            x3dctl
            teamviewer
            v2rayn-bin
            termflix-bin
            lavat-git
            clash-party-bin
            input-remapper-bin
            deadlock-modmanager
            gitlab-ci-local
            ttf-readex-pro-variable
            bugwarrior
            betterbird-de-bin
            rate-mirrors-git
            raw-thumbnailer
            samsung-unified-driver
            aseprite
            octoberctl-bin
            legacy-launcher-ely-by
            7zkpxc
            pear-desktop
            xray
            github-copilot-cli
            blogtato
            fetchdots
            ensu-bin
            gzdoom
            handy-bin
            mongoclock
            eidklient-native
            sherlock-git
            mtkclient-git
            turing-smart-screen-python
            airi-bin
            coolercontrold-bin
            oscar
            far2l-git
            pinchtab-bin
            obs-pwvideo
            packet
            arrpc
            spicetify-marketplace-bin
            mistral-vibe
            aider-chat-docs
            ast-firmware
            lssecret-git
            spout2pw-bin
            signalbackup-tools-git
            scarlett4-firmware
            ))

;;; ── icebar-git ──────────────────────────────────────────────────
;;; Lightweight Wayland status bar
;;; AUR: icebar-git  →  Guix: icebar-git
;;; Upstream: https://github.com/HaruNashii/Icebar
;;;
(define-public icebar-git
  (package
    (name "icebar-git")
    (version "r155.g9ed70de")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/HaruNashii/Icebar")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "Lightweight Wayland status bar")
    (description
     "Lightweight Wayland status bar")
    (home-page "https://github.com/HaruNashii/Icebar")
    (license license:expat)))

;;; ── ruby-install ────────────────────────────────────────────────
;;; Installs Ruby, JRuby, Rubinius, MRuby or TruffleRuby.
;;; AUR: ruby-install  →  Guix: ruby-install
;;; Upstream: https://github.com/postmodern/ruby-install
;;;
(define-public ruby-install
  (package
    (name "ruby-install")
    (version "0.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/postmodern/ruby-install")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Installs Ruby, JRuby, Rubinius, MRuby or TruffleRuby.")
    (description
     "Installs Ruby, JRuby, Rubinius, MRuby or TruffleRuby.")
    (home-page "https://github.com/postmodern/ruby-install")
    (license license:expat)))

;;; ── cine ────────────────────────────────────────────────────────
;;; Video Player for Linux
;;; AUR: cine  →  Guix: cine
;;; Upstream: https://github.com/diegopvlk/Cine
;;;
(define-public cine
  (package
    (name "cine")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/diegopvlk/Cine")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Video Player for Linux")
    (description
     "Video Player for Linux")
    (home-page "https://github.com/diegopvlk/Cine")
    (license license:gpl3+)))

;;; ── wifitui-bin ─────────────────────────────────────────────────
;;; Fast featureful friendly wifi terminal UI.
;;; AUR: wifitui-bin  →  Guix: wifitui-bin
;;; Upstream: https://github.com/shazow/wifitui
;;;
(define-public wifitui-bin
  (package
    (name "wifitui-bin")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/shazow/wifitui/releases/download/v" version "/wifitui-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "fast featureful friendly wifi terminal UI.")
    (description
     "Fast featureful friendly wifi terminal UI.")
    (home-page "https://github.com/shazow/wifitui")
    (license license:expat)))

;;; ── vibe-bin ────────────────────────────────────────────────────
;;; Transcribe audio / video offline using OpenAI Whisper
;;; AUR: vibe-bin  →  Guix: vibe-bin
;;; Upstream: https://thewh1teagle.github.io/vibe/
;;;
(define-public vibe-bin
  (package
    (name "vibe-bin")
    (version "3.0.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://thewh1teagle.github.io/vibe/"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Transcribe audio / video offline using OpenAI Whisper")
    (description
     "Transcribe audio / video offline using OpenAI Whisper")
    (home-page "https://thewh1teagle.github.io/vibe/")
    (license license:expat)))

;;; ── samrewritten ────────────────────────────────────────────────
;;; Unlock achievements and stats on Steam, and more!
;;; AUR: samrewritten  →  Guix: samrewritten
;;; Upstream: https://github.com/PaulCombal/SamRewritten
;;;
(define-public samrewritten
  (package
    (name "samrewritten")
    (version "1.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PaulCombal/SamRewritten")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Unlock achievements and stats on Steam, and more!")
    (description
     "Unlock achievements and stats on Steam, and more!")
    (home-page "https://github.com/PaulCombal/SamRewritten")
    (license license:gpl3)))

;;; ── linuxqq ─────────────────────────────────────────────────────
;;; New Linux QQ based on Electron
;;; AUR: linuxqq  →  Guix: linuxqq
;;; Upstream: https://im.qq.com/linuxqq
;;;
(define-public linuxqq
  (package
    (name "linuxqq")
    (version "3.2.27.47354")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://im.qq.com/linuxqq/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "New Linux QQ based on Electron")
    (description
     "New Linux QQ based on Electron")
    (home-page "https://im.qq.com/linuxqq")
    (license nonguix-license:nonfree)))

;;; ── czkawka-cli ─────────────────────────────────────────────────
;;; Multi functional app to find duplicates, empty folders, similar images etc. (CLI
;;; AUR: czkawka-cli  →  Guix: czkawka-cli
;;; Upstream: https://github.com/qarmin/czkawka
;;;
(define-public czkawka-cli
  (package
    (name "czkawka-cli")
    (version "11.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/qarmin/czkawka")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Multi functional app to find duplicates, empty folders, similar images etc. (CLI")
    (description
     "Multi functional app to find duplicates, empty folders, similar images etc. (CLI)")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:expat)))

;;; ── czkawka-gui ─────────────────────────────────────────────────
;;; Multi functional app to find duplicates, empty folders, similar images etc. (Des
;;; AUR: czkawka-gui  →  Guix: czkawka-gui
;;; Upstream: https://github.com/qarmin/czkawka
;;;
(define-public czkawka-gui
  (package
    (name "czkawka-gui")
    (version "11.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/qarmin/czkawka")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Multi functional app to find duplicates, empty folders, similar images etc. (Des")
    (description
     "Multi functional app to find duplicates, empty folders, similar images etc. (Desktop App)")
    (home-page "https://github.com/qarmin/czkawka")
    (license license:expat)))

;;; ── mouse-actions-gui-bin ───────────────────────────────────────
;;; Use your mouse to execute commands, for X11 and Wayland. You can use gestures, h
;;; AUR: mouse-actions-gui-bin  →  Guix: mouse-actions-gui-bin
;;; Upstream: https://github.com/jersou/mouse-actions
;;;
(define-public mouse-actions-gui-bin
  (package
    (name "mouse-actions-gui-bin")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/jersou/mouse-actions/releases/download/v" version "/mouse-actions-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "use your mouse to execute commands, for X11 and Wayland. You can use gestures, h")
    (description
     "Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the GUI version but you can still use CLI!")
    (home-page "https://github.com/jersou/mouse-actions")
    (license license:expat)))

;;; ── wluma ───────────────────────────────────────────────────────
;;; Automatic brightness adjustment based on screen contents and ALS
;;; AUR: wluma  →  Guix: wluma
;;; Upstream: https://github.com/maximbaz/wluma
;;;
(define-public wluma
  (package
    (name "wluma")
    (version "4.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/maximbaz/wluma")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Automatic brightness adjustment based on screen contents and ALS")
    (description
     "Automatic brightness adjustment based on screen contents and ALS")
    (home-page "https://github.com/maximbaz/wluma")
    (license license:isc)))

;;; ── mtkclient ───────────────────────────────────────────────────
;;; Unofficial MTK reverse engineering and flash tool
;;; AUR: mtkclient  →  Guix: mtkclient
;;; Upstream: https://github.com/bkerler/mtkclient
;;;
(define-public mtkclient
  (package
    (name "mtkclient")
    (version "2.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bkerler/mtkclient")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Unofficial MTK reverse engineering and flash tool")
    (description
     "Unofficial MTK reverse engineering and flash tool")
    (home-page "https://github.com/bkerler/mtkclient")
    (license license:gpl3)))

;;; ── micyou-bin ──────────────────────────────────────────────────
;;; Turn your Android device into a high-quality wireless microphone for your PC
;;; AUR: micyou-bin  →  Guix: micyou-bin
;;; Upstream: https://github.com/LanRhyme/MicYou
;;;
(define-public micyou-bin
  (package
    (name "micyou-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/LanRhyme/MicYou/releases/download/v" version "/MicYou-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Turn your Android device into a high-quality wireless microphone for your PC")
    (description
     "Turn your Android device into a high-quality wireless microphone for your PC")
    (home-page "https://github.com/LanRhyme/MicYou")
    (license license:expat)))

;;; ── atostekid ───────────────────────────────────────────────────
;;; New desktop application for Finnish electronic ID cards
;;; AUR: atostekid  →  Guix: atostekid
;;; Upstream: https://dvv.fi/en/linux-versions
;;;
(define-public atostekid
  (package
    (name "atostekid")
    (version "4.4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://dvv.fi/en/linux-versions/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "New desktop application for Finnish electronic ID cards")
    (description
     "New desktop application for Finnish electronic ID cards")
    (home-page "https://dvv.fi/en/linux-versions")
    (license nonguix-license:nonfree)))

;;; ── catppuccin-gtk-theme-macchiato ──────────────────────────────
;;; Soothing pastel theme for GTK - Macchiato
;;; AUR: catppuccin-gtk-theme-macchiato  →  Guix: catppuccin-gtk-theme-macchiato
;;; Upstream: https://github.com/catppuccin/gtk
;;;
(define-public catppuccin-gtk-theme-macchiato
  (package
    (name "catppuccin-gtk-theme-macchiato")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/catppuccin/gtk")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "soothing pastel theme for GTK - Macchiato")
    (description
     "Soothing pastel theme for GTK - Macchiato")
    (home-page "https://github.com/catppuccin/gtk")
    (license license:gpl3+)))

;;; ── lidm ────────────────────────────────────────────────────────
;;; A fully colorful customizable TUI display manager made in C. (build latest tag)
;;; AUR: lidm  →  Guix: lidm
;;; Upstream: https://github.com/javalsai/lidm
;;;
(define-public lidm
  (package
    (name "lidm")
    (version "2.0.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/javalsai/lidm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "A fully colorful customizable TUI display manager made in C. (build latest tag)")
    (description
     "A fully colorful customizable TUI display manager made in C. (build latest tag)")
    (home-page "https://github.com/javalsai/lidm")
    (license license:gpl3)))

;;; ── ntfysh ──────────────────────────────────────────────────────
;;; Send push notifications to your phone or desktop using PUT/POST
;;; AUR: ntfysh  →  Guix: ntfysh
;;; Upstream: https://ntfy.sh
;;;
(define-public ntfysh
  (package
    (name "ntfysh")
    (version "2.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://ntfy.sh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Send push notifications to your phone or desktop using PUT/POST")
    (description
     "Send push notifications to your phone or desktop using PUT/POST")
    (home-page "https://ntfy.sh")
    (license license:gpl2)))

;;; ── phonon-qt6-mpv ──────────────────────────────────────────────
;;; Phonon MPV backend for Qt6
;;; AUR: phonon-qt6-mpv  →  Guix: phonon-qt6-mpv
;;; Upstream: https://github.com/OpenProgger/phonon-mpv
;;;
(define-public phonon-qt6-mpv
  (package
    (name "phonon-qt6-mpv")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenProgger/phonon-mpv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "phonon MPV backend for Qt6")
    (description
     "Phonon MPV backend for Qt6")
    (home-page "https://github.com/OpenProgger/phonon-mpv")
    (license license:lgpl2.1)))

;;; ── sioyek-dev ──────────────────────────────────────────────────
;;; PDF viewer for research papers and technical books (development branch)
;;; AUR: sioyek-dev  →  Guix: sioyek-dev
;;; Upstream: https://github.com/ahrm/sioyek
;;;
(define-public sioyek-dev
  (package
    (name "sioyek-dev")
    (version "2.0.0.r1086.g719e2070")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ahrm/sioyek")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "pDF viewer for research papers and technical books (development branch)")
    (description
     "PDF viewer for research papers and technical books (development branch)")
    (home-page "https://github.com/ahrm/sioyek")
    (license license:gpl3+)))

;;; ── x3dctl ──────────────────────────────────────────────────────
;;; Lightweight utility for AMD X3D mode switching, IRQ steering, and per-process po
;;; AUR: x3dctl  →  Guix: x3dctl
;;; Upstream: https://github.com/GrandBIRDLizard/X3Dctl
;;;
(define-public x3dctl
  (package
    (name "x3dctl")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/GrandBIRDLizard/X3Dctl")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Lightweight utility for AMD X3D mode switching, IRQ steering, and per-process po")
    (description
     "Lightweight utility for AMD X3D mode switching, IRQ steering, and per-process policy")
    (home-page "https://github.com/GrandBIRDLizard/X3Dctl")
    (license license:expat)))

;;; ── teamviewer ──────────────────────────────────────────────────
;;; All-In-One Software for Remote Support and Online Meetings
;;; AUR: teamviewer  →  Guix: teamviewer
;;; Upstream: https://www.teamviewer.com/en/download/portal/linux/
;;;
(define-public teamviewer
  (package
    (name "teamviewer")
    (version "15.74.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.teamviewer.com/en/download/portal/linux//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "all-In-One Software for Remote Support and Online Meetings")
    (description
     "All-In-One Software for Remote Support and Online Meetings")
    (home-page "https://www.teamviewer.com/en/download/portal/linux/")
    (license nonguix-license:nonfree)))

;;; ── v2rayn-bin ──────────────────────────────────────────────────
;;; A GUI client for Windows and Linux, support Xray core and others
;;; AUR: v2rayn-bin  →  Guix: v2rayn-bin
;;; Upstream: https://github.com/2dust/v2rayN
;;;
(define-public v2rayn-bin
  (package
    (name "v2rayn-bin")
    (version "7.19.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/2dust/v2rayN/releases/download/v" version "/v2rayN-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "A GUI client for Windows and Linux, support Xray core and others")
    (description
     "A GUI client for Windows and Linux, support Xray core and others")
    (home-page "https://github.com/2dust/v2rayN")
    (license license:gpl3+)))

;;; ── termflix-bin ────────────────────────────────────────────────
;;; Terminal animation player with many procedurally generated animations, multiple 
;;; AUR: termflix-bin  →  Guix: termflix-bin
;;; Upstream: https://github.com/paulrobello/termflix
;;;
(define-public termflix-bin
  (package
    (name "termflix-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/paulrobello/termflix/releases/download/v" version "/termflix-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Terminal animation player with many procedurally generated animations, multiple ")
    (description
     "Terminal animation player with many procedurally generated animations, multiple render modes, and true color support")
    (home-page "https://github.com/paulrobello/termflix")
    (license license:expat)))

;;; ── lavat-git ───────────────────────────────────────────────────
;;; Little program that simulates a lava lamp in the terminal.
;;; AUR: lavat-git  →  Guix: lavat-git
;;; Upstream: https://github.com/AngelJumbo/lavat.git
;;;
(define-public lavat-git
  (package
    (name "lavat-git")
    (version "r13.5d2629c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AngelJumbo/lavat.git")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "Little program that simulates a lava lamp in the terminal.")
    (description
     "Little program that simulates a lava lamp in the terminal.")
    (home-page "https://github.com/AngelJumbo/lavat.git")
    (license license:expat)))

;;; ── clash-party-bin ─────────────────────────────────────────────
;;; A Clash client with party features (Rebranded as Mihomo Party)
;;; AUR: clash-party-bin  →  Guix: clash-party-bin
;;; Upstream: https://github.com/mihomo-party-org/clash-party
;;;
(define-public clash-party-bin
  (package
    (name "clash-party-bin")
    (version "1.9.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mihomo-party-org/clash-party/releases/download/v" version "/clash-party-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "A Clash client with party features (Rebranded as Mihomo Party)")
    (description
     "A Clash client with party features (Rebranded as Mihomo Party)")
    (home-page "https://github.com/mihomo-party-org/clash-party")
    (license license:gpl3+)))

;;; ── input-remapper-bin ──────────────────────────────────────────
;;; A tool to change and program the mapping of your input device buttons.(Prebuilt 
;;; AUR: input-remapper-bin  →  Guix: input-remapper-bin
;;; Upstream: https://github.com/sezanzeb/input-remapper/
;;;
(define-public input-remapper-bin
  (package
    (name "input-remapper-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/sezanzeb/input-remapper/releases/download/v" version "/input-remapper-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "A tool to change and program the mapping of your input device buttons.(Prebuilt ")
    (description
     "A tool to change and program the mapping of your input device buttons.(Prebuilt version)")
    (home-page "https://github.com/sezanzeb/input-remapper/")
    (license license:gpl3)))

;;; ── deadlock-modmanager ─────────────────────────────────────────
;;; A mod manager for the Valve game Deadlock
;;; AUR: deadlock-modmanager  →  Guix: deadlock-modmanager
;;; Upstream: https://github.com/deadlock-mod-manager/deadlock-mod-manager
;;;
(define-public deadlock-modmanager
  (package
    (name "deadlock-modmanager")
    (version "0.17.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/deadlock-mod-manager/deadlock-mod-manager")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A mod manager for the Valve game Deadlock")
    (description
     "A mod manager for the Valve game Deadlock")
    (home-page "https://github.com/deadlock-mod-manager/deadlock-mod-manager")
    (license license:gpl3)))

;;; ── gitlab-ci-local ─────────────────────────────────────────────
;;; Run gitlab pipelines locally as shell executor or docker executor
;;; AUR: gitlab-ci-local  →  Guix: gitlab-ci-local
;;; Upstream: https://github.com/firecow/gitlab-ci-local
;;;
(define-public gitlab-ci-local
  (package
    (name "gitlab-ci-local")
    (version "4.64.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/firecow/gitlab-ci-local/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Run gitlab pipelines locally as shell executor or docker executor")
    (description
     "Run gitlab pipelines locally as shell executor or docker executor")
    (home-page "https://github.com/firecow/gitlab-ci-local")
    (license license:expat)))

;;; ── ttf-readex-pro-variable ─────────────────────────────────────
;;; World-script expansion of Lexend font family
;;; AUR: ttf-readex-pro-variable  →  Guix: ttf-readex-pro-variable
;;; Upstream: https://github.com/ThomasJockin/readexpro
;;;
(define-public ttf-readex-pro-variable
  (package
    (name "ttf-readex-pro-variable")
    (version "1.204")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ThomasJockin/readexpro")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "World-script expansion of Lexend font family")
    (description
     "World-script expansion of Lexend font family")
    (home-page "https://github.com/ThomasJockin/readexpro")
    (license license:silofl1.1)))

;;; ── bugwarrior ──────────────────────────────────────────────────
;;; Pull github, bitbucket, and trac issues into taskwarrior
;;; AUR: bugwarrior  →  Guix: bugwarrior
;;; Upstream: https://bugwarrior.readthedocs.io
;;;
(define-public bugwarrior
  (package
    (name "bugwarrior")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://bugwarrior.readthedocs.io")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Pull github, bitbucket, and trac issues into taskwarrior")
    (description
     "Pull github, bitbucket, and trac issues into taskwarrior")
    (home-page "https://bugwarrior.readthedocs.io")
    (license license:gpl3+)))

;;; ── betterbird-de-bin ───────────────────────────────────────────
;;; GERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird
;;; AUR: betterbird-de-bin  →  Guix: betterbird-de-bin
;;; Upstream: https://www.betterbird.eu/index.html
;;;
(define-public betterbird-de-bin
  (package
    (name "betterbird-de-bin")
    (version "140.9.0esr")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.betterbird.eu/index.html"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "gERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird")
    (description
     "GERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will.")
    (home-page "https://www.betterbird.eu/index.html")
    (license license:mpl2.0)))

;;; ── rate-mirrors-git ────────────────────────────────────────────
;;; Everyday-use client-side map-aware mirror ranking tool
;;; AUR: rate-mirrors-git  →  Guix: rate-mirrors-git
;;; Upstream: https://github.com/westandskif/rate-mirrors
;;;
(define-public rate-mirrors-git
  (package
    (name "rate-mirrors-git")
    (version "0.28.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/westandskif/rate-mirrors")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "everyday-use client-side map-aware mirror ranking tool")
    (description
     "Everyday-use client-side map-aware mirror ranking tool")
    (home-page "https://github.com/westandskif/rate-mirrors")
    (license license:gpl3+)))

;;; ── raw-thumbnailer ─────────────────────────────────────────────
;;; A lightweight and fast raw image thumbnailer that can be used by file managers.
;;; AUR: raw-thumbnailer  →  Guix: raw-thumbnailer
;;; Upstream: https://gitlab.gnome.org/World/gnome-raw-thumbnailer/
;;;
(define-public raw-thumbnailer
  (package
    (name "raw-thumbnailer")
    (version "48.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.gnome.org/World/gnome-raw-thumbnailer")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "A lightweight and fast raw image thumbnailer that can be used by file managers.")
    (description
     "A lightweight and fast raw image thumbnailer that can be used by file managers.")
    (home-page "https://gitlab.gnome.org/World/gnome-raw-thumbnailer/")
    (license license:gpl2+)))

;;; ── samsung-unified-driver ──────────────────────────────────────
;;; Samsung Unified Linux Driver for printers and scanners.
;;; AUR: samsung-unified-driver  →  Guix: samsung-unified-driver
;;; Upstream: http://www.samsung.com
;;;
(define-public samsung-unified-driver
  (package
    (name "samsung-unified-driver")
    (version "1.00.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://www.samsung.com/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Samsung Unified Linux Driver for printers and scanners.")
    (description
     "Samsung Unified Linux Driver for printers and scanners.")
    (home-page "http://www.samsung.com")
    (license nonguix-license:nonfree)))

;;; ── aseprite ────────────────────────────────────────────────────
;;; Create animated sprites and pixel art
;;; AUR: aseprite  →  Guix: aseprite
;;; Upstream: https://www.aseprite.org/
;;;
(define-public aseprite
  (package
    (name "aseprite")
    (version "1.3.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.aseprite.org//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Create animated sprites and pixel art")
    (description
     "Create animated sprites and pixel art")
    (home-page "https://www.aseprite.org/")
    (license nonguix-license:nonfree)))

;;; ── octoberctl-bin ──────────────────────────────────────────────
;;; The official October Linux management utility
;;; AUR: octoberctl-bin  →  Guix: octoberctl-bin
;;; Upstream: https://github.com/october-os/octoberctl
;;;
(define-public octoberctl-bin
  (package
    (name "octoberctl-bin")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/october-os/octoberctl/releases/download/v" version "/octoberctl-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "The official October Linux management utility")
    (description
     "The official October Linux management utility")
    (home-page "https://github.com/october-os/octoberctl")
    (license license:gpl3+)))

;;; ── legacy-launcher-ely-by ──────────────────────────────────────
;;; Legacy launcher version from ely.by
;;; AUR: legacy-launcher-ely.by  →  Guix: legacy-launcher-ely-by
;;; Upstream: https://llaun.ch/
;;;
(define-public legacy-launcher-ely-by
  (package
    (name "legacy-launcher-ely-by")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://llaun.ch//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "legacy launcher version from ely.by")
    (description
     "Legacy launcher version from ely.by")
    (home-page "https://llaun.ch/")
    (license license:gpl3+)))

;;; ── 7zkpxc ──────────────────────────────────────────────────────
;;; Secure 7-Zip wrapper with KeePassXC integration
;;; AUR: 7zkpxc  →  Guix: 7zkpxc
;;; Upstream: https://github.com/lxstig/7zkpxc
;;;
(define-public 7zkpxc
  (package
    (name "7zkpxc")
    (version "2.9.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxstig/7zkpxc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Secure 7-Zip wrapper with KeePassXC integration")
    (description
     "Secure 7-Zip wrapper with KeePassXC integration")
    (home-page "https://github.com/lxstig/7zkpxc")
    (license license:gpl3+)))

;;; ── pear-desktop ────────────────────────────────────────────────
;;; Extension for music player
;;; AUR: pear-desktop  →  Guix: pear-desktop
;;; Upstream: https://github.com/pear-devs/pear-desktop
;;;
(define-public pear-desktop
  (package
    (name "pear-desktop")
    (version "3.11.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pear-devs/pear-desktop")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "Extension for music player")
    (description
     "Extension for music player")
    (home-page "https://github.com/pear-devs/pear-desktop")
    (license license:expat)))

;;; ── xray ────────────────────────────────────────────────────────
;;; The best v2ray-core, with XTLS support
;;; AUR: xray  →  Guix: xray
;;; Upstream: https://github.com/XTLS/Xray-core
;;;
(define-public xray
  (package
    (name "xray")
    (version "26.2.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/XTLS/Xray-core")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "The best v2ray-core, with XTLS support")
    (description
     "The best v2ray-core, with XTLS support")
    (home-page "https://github.com/XTLS/Xray-core")
    (license license:mpl2.0)))

;;; ── github-copilot-cli ──────────────────────────────────────────
;;; GitHub Copilot CLI brings the power of Copilot coding agent directly to your ter
;;; AUR: github-copilot-cli  →  Guix: github-copilot-cli
;;; Upstream: https://github.com/github/copilot-cli
;;;
(define-public github-copilot-cli
  (package
    (name "github-copilot-cli")
    (version "1.0.19")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/github/copilot-cli")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "GitHub Copilot CLI brings the power of Copilot coding agent directly to your ter")
    (description
     "GitHub Copilot CLI brings the power of Copilot coding agent directly to your terminal.")
    (home-page "https://github.com/github/copilot-cli")
    (license nonguix-license:nonfree)))

;;; ── blogtato ────────────────────────────────────────────────────
;;; A CLI RSS/Atom feed reader inspired by Taskwarrior
;;; AUR: blogtato  →  Guix: blogtato
;;; Upstream: https://github.com/kantord/blogtato
;;;
(define-public blogtato
  (package
    (name "blogtato")
    (version "0.1.23")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kantord/blogtato")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A CLI RSS/Atom feed reader inspired by Taskwarrior")
    (description
     "A CLI RSS/Atom feed reader inspired by Taskwarrior")
    (home-page "https://github.com/kantord/blogtato")
    (license license:asl2.0)))

;;; ── fetchdots ───────────────────────────────────────────────────
;;; Fetch and manage dotfiles using FetchDots
;;; AUR: fetchdots  →  Guix: fetchdots
;;; Upstream: https://fetchdots.net
;;;
(define-public fetchdots
  (package
    (name "fetchdots")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://fetchdots.net")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Fetch and manage dotfiles using FetchDots")
    (description
     "Fetch and manage dotfiles using FetchDots")
    (home-page "https://fetchdots.net")
    (license license:gpl3+)))

;;; ── ensu-bin ────────────────────────────────────────────────────
;;; Ente's local LLM app - private, offline AI chat (Tauri)
;;; AUR: ensu-bin  →  Guix: ensu-bin
;;; Upstream: https://ente.io/blog/ensu/
;;;
(define-public ensu-bin
  (package
    (name "ensu-bin")
    (version "0.1.15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://ente.io/blog/ensu/"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Ente's local LLM app - private, offline AI chat (Tauri)")
    (description
     "Ente's local LLM app - private, offline AI chat (Tauri)")
    (home-page "https://ente.io/blog/ensu/")
    (license license:agpl3+)))

;;; ── gzdoom ──────────────────────────────────────────────────────
;;; Feature centric port for all Doom engine games
;;; AUR: gzdoom  →  Guix: gzdoom
;;; Upstream: http://www.zdoom.org/
;;;
(define-public gzdoom
  (package
    (name "gzdoom")
    (version "4.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "http://www.zdoom.org")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Feature centric port for all Doom engine games")
    (description
     "Feature centric port for all Doom engine games")
    (home-page "http://www.zdoom.org/")
    (license license:bsd-3)))

;;; ── handy-bin ───────────────────────────────────────────────────
;;; A free, open source, and extensible speech-to-text application that works comple
;;; AUR: handy-bin  →  Guix: handy-bin
;;; Upstream: https://handy.computer/
;;;
(define-public handy-bin
  (package
    (name "handy-bin")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://handy.computer/"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "A free, open source, and extensible speech-to-text application that works comple")
    (description
     "A free, open source, and extensible speech-to-text application that works completely offline")
    (home-page "https://handy.computer/")
    (license license:expat)))

;;; ── mongoclock ──────────────────────────────────────────────────
;;; Just a humongous clock for the terminal
;;; AUR: mongoclock  →  Guix: mongoclock
;;; Upstream: https://codeberg.org/maandree/mongoclock
;;;
(define-public mongoclock
  (package
    (name "mongoclock")
    (version "3.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/mongoclock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "Just a humongous clock for the terminal")
    (description
     "Just a humongous clock for the terminal")
    (home-page "https://codeberg.org/maandree/mongoclock")
    (license license:isc)))

;;; ── eidklient-native ────────────────────────────────────────────
;;; Slovak eID Client - uses system-provided libraries, supports Wayland, …
;;; AUR: eidklient-native  →  Guix: eidklient-native
;;; Upstream: https://www.slovensko.sk/
;;;
(define-public eidklient-native
  (package
    (name "eidklient-native")
    (version "5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.slovensko.sk//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Slovak eID Client - uses system-provided libraries, supports Wayland, …")
    (description
     "Slovak eID Client - uses system-provided libraries, supports Wayland, …")
    (home-page "https://www.slovensko.sk/")
    (license nonguix-license:nonfree)))

;;; ── sherlock-git ────────────────────────────────────────────────
;;; Hunt down social media accounts by username across social networks
;;; AUR: sherlock-git  →  Guix: sherlock-git
;;; Upstream: https://github.com/sherlock-project/sherlock
;;;
(define-public sherlock-git
  (package
    (name "sherlock-git")
    (version "r2442.7e87a88")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sherlock-project/sherlock")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Hunt down social media accounts by username across social networks")
    (description
     "Hunt down social media accounts by username across social networks")
    (home-page "https://github.com/sherlock-project/sherlock")
    (license license:expat)))

;;; ── mtkclient-git ───────────────────────────────────────────────
;;; Unofficial MTK reverse engineering and flash tool
;;; AUR: mtkclient-git  →  Guix: mtkclient-git
;;; Upstream: https://github.com/bkerler/mtkclient
;;;
(define-public mtkclient-git
  (package
    (name "mtkclient-git")
    (version "2.1.3.r18.g0fdbe49")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bkerler/mtkclient")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Unofficial MTK reverse engineering and flash tool")
    (description
     "Unofficial MTK reverse engineering and flash tool")
    (home-page "https://github.com/bkerler/mtkclient")
    (license license:gpl3)))

;;; ── turing-smart-screen-python ──────────────────────────────────
;;; A Python system monitor program and an abstraction library for small IPS USB-C (
;;; AUR: turing-smart-screen-python  →  Guix: turing-smart-screen-python
;;; Upstream: https://github.com/mathoudebine/turing-smart-screen-python
;;;
(define-public turing-smart-screen-python
  (package
    (name "turing-smart-screen-python")
    (version "3.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mathoudebine/turing-smart-screen-python")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A Python system monitor program and an abstraction library for small IPS USB-C (")
    (description
     "A Python system monitor program and an abstraction library for small IPS USB-C (UART) displays (Unofficial open-source alternative version)")
    (home-page "https://github.com/mathoudebine/turing-smart-screen-python")
    (license license:gpl3+)))

;;; ── airi-bin ────────────────────────────────────────────────────
;;; 💖🧸 Self hosted, you owned Grok Companion, a container of souls of waifu, cyber l
;;; AUR: airi-bin  →  Guix: airi-bin
;;; Upstream: https://airi.moeru.ai/docs/
;;;
(define-public airi-bin
  (package
    (name "airi-bin")
    (version "0.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://airi.moeru.ai/docs/"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "💖🧸 Self hosted, you owned Grok Companion, a container of souls of waifu, cyber l")
    (description
     "💖🧸 Self hosted, you owned Grok Companion, a container of souls of waifu, cyber livings to bring them into our worlds, wishing to achieve Neuro-sama's altitude.(Prebuilt version.Use system-wide electron)")
    (home-page "https://airi.moeru.ai/docs/")
    (license license:expat)))

;;; ── coolercontrold-bin ──────────────────────────────────────────
;;; A program to monitor and control your cooling devices: daemon (binary release)
;;; AUR: coolercontrold-bin  →  Guix: coolercontrold-bin
;;; Upstream: https://gitlab.com/coolercontrol/coolercontrol
;;;
(define-public coolercontrold-bin
  (package
    (name "coolercontrold-bin")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/coolercontrol/coolercontrol/-/releases/v" version "/downloads/" name "-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "A program to monitor and control your cooling devices: daemon (binary release)")
    (description
     "A program to monitor and control your cooling devices: daemon (binary release)")
    (home-page "https://gitlab.com/coolercontrol/coolercontrol")
    (license license:gpl3+)))

;;; ── oscar ───────────────────────────────────────────────────────
;;; Open-source, cross platform, sleep tracking software with a focus on monitoring 
;;; AUR: oscar  →  Guix: oscar
;;; Upstream: https://gitlab.com/CrimsonNape/OSCAR-code
;;;
(define-public oscar
  (package
    (name "oscar")
    (version "1.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/CrimsonNape/OSCAR-code")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Open-source, cross platform, sleep tracking software with a focus on monitoring ")
    (description
     "Open-source, cross platform, sleep tracking software with a focus on monitoring CPAP treatment. Fork of the sleepyhead project.")
    (home-page "https://gitlab.com/CrimsonNape/OSCAR-code")
    (license license:gpl3)))

;;; ── far2l-git ───────────────────────────────────────────────────
;;; Linux port of FAR v2
;;; AUR: far2l-git  →  Guix: far2l-git
;;; Upstream: https://github.com/elfmz/far2l
;;;
(define-public far2l-git
  (package
    (name "far2l-git")
    (version "r7201.59d2e230d")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/elfmz/far2l")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Linux port of FAR v2")
    (description
     "Linux port of FAR v2")
    (home-page "https://github.com/elfmz/far2l")
    (license license:gpl2)))

;;; ── pinchtab-bin ────────────────────────────────────────────────
;;; High-performance browser automation bridge and multi-instance orchestrator with 
;;; AUR: pinchtab-bin  →  Guix: pinchtab-bin
;;; Upstream: https://github.com/pinchtab/pinchtab
;;;
(define-public pinchtab-bin
  (package
    (name "pinchtab-bin")
    (version "0.8.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pinchtab/pinchtab/releases/download/v" version "/pinchtab-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "High-performance browser automation bridge and multi-instance orchestrator with ")
    (description
     "High-performance browser automation bridge and multi-instance orchestrator with advanced stealth injection and real-time dashboard.")
    (home-page "https://github.com/pinchtab/pinchtab")
    (license license:expat)))

;;; ── obs-pwvideo ─────────────────────────────────────────────────
;;; OBS Plugin for generic PipeWire video sources
;;; AUR: obs-pwvideo  →  Guix: obs-pwvideo
;;; Upstream: https://github.com/hoshinolina/obs-pwvideo
;;;
(define-public obs-pwvideo
  (package
    (name "obs-pwvideo")
    (version "0.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hoshinolina/obs-pwvideo")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "OBS Plugin for generic PipeWire video sources")
    (description
     "OBS Plugin for generic PipeWire video sources")
    (home-page "https://github.com/hoshinolina/obs-pwvideo")
    (license license:gpl2+)))

;;; ── packet ──────────────────────────────────────────────────────
;;; A Quick Share client for Linux
;;; AUR: packet  →  Guix: packet
;;; Upstream: https://github.com/nozwock/packet
;;;
(define-public packet
  (package
    (name "packet")
    (version "0.5.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nozwock/packet")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "A Quick Share client for Linux")
    (description
     "A Quick Share client for Linux")
    (home-page "https://github.com/nozwock/packet")
    (license license:gpl3+)))

;;; ── arrpc ───────────────────────────────────────────────────────
;;; Open Discord RPC server for atypical setups
;;; AUR: arrpc  →  Guix: arrpc
;;; Upstream: https://arrpc.openasar.dev/
;;;
(define-public arrpc
  (package
    (name "arrpc")
    (version "3.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://arrpc.openasar.dev")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Open Discord RPC server for atypical setups")
    (description
     "Open Discord RPC server for atypical setups")
    (home-page "https://arrpc.openasar.dev/")
    (license license:expat)))

;;; ── spicetify-marketplace-bin ───────────────────────────────────
;;; Spicetify app that integrates a marketplace for extensions, themes and snippets
;;; AUR: spicetify-marketplace-bin  →  Guix: spicetify-marketplace-bin
;;; Upstream: https://github.com/spicetify/spicetify-marketplace
;;;
(define-public spicetify-marketplace-bin
  (package
    (name "spicetify-marketplace-bin")
    (version "1.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/spicetify/spicetify-marketplace/releases/download/v" version "/spicetify-marketplace-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "Spicetify app that integrates a marketplace for extensions, themes and snippets")
    (description
     "Spicetify app that integrates a marketplace for extensions, themes and snippets")
    (home-page "https://github.com/spicetify/spicetify-marketplace")
    (license license:expat)))

;;; ── mistral-vibe ────────────────────────────────────────────────
;;; Minimal CLI coding agent by Mistral
;;; AUR: mistral-vibe  →  Guix: mistral-vibe
;;; Upstream: https://github.com/mistralai/mistral-vibe
;;;
(define-public mistral-vibe
  (package
    (name "mistral-vibe")
    (version "2.7.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mistralai/mistral-vibe")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Minimal CLI coding agent by Mistral")
    (description
     "Minimal CLI coding agent by Mistral")
    (home-page "https://github.com/mistralai/mistral-vibe")
    (license license:asl2.0)))

;;; ── aider-chat-docs ─────────────────────────────────────────────
;;; AI pair programming in your terminal
;;; AUR: aider-chat-docs  →  Guix: aider-chat-docs
;;; Upstream: https://github.com/Aider-AI/aider
;;;
(define-public aider-chat-docs
  (package
    (name "aider-chat-docs")
    (version "0.86.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Aider-AI/aider")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "aI pair programming in your terminal")
    (description
     "AI pair programming in your terminal")
    (home-page "https://github.com/Aider-AI/aider")
    (license license:asl2.0)))

;;; ── ast-firmware ────────────────────────────────────────────────
;;; Aspeed VGA module from the IPMI
;;; AUR: ast-firmware  →  Guix: ast-firmware
;;; Upstream: https://www.supermicro.com/support/faqs/faq.cfm?faq=26876
;;;
(define-public ast-firmware
  (package
    (name "ast-firmware")
    (version "501")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/" #:include-regexp (".*")))))
    (synopsis "aspeed VGA module from the IPMI")
    (description
     "Aspeed VGA module from the IPMI")
    (home-page "https://www.supermicro.com/support/faqs/faq.cfm?faq=26876")
    (license nonguix-license:nonfree)))

;;; ── lssecret-git ────────────────────────────────────────────────
;;; utility to list all secret items in a secret service using libsecret
;;; AUR: lssecret-git  →  Guix: lssecret-git
;;; Upstream: https://gitlab.com/GrantMoyer/lssecret
;;;
(define-public lssecret-git
  (package
    (name "lssecret-git")
    (version "r10.20fd771")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/GrantMoyer/lssecret")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "utility to list all secret items in a secret service using libsecret")
    (description
     "utility to list all secret items in a secret service using libsecret")
    (home-page "https://gitlab.com/GrantMoyer/lssecret")
    (license license:unlicense)))

;;; ── spout2pw-bin ────────────────────────────────────────────────
;;; Spout2 to PipeWire bridge
;;; AUR: spout2pw-bin  →  Guix: spout2pw-bin
;;; Upstream: https://github.com/hoshinolina/spout2pw
;;;
(define-public spout2pw-bin
  (package
    (name "spout2pw-bin")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hoshinolina/spout2pw/releases/download/v" version "/spout2pw-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Spout2 to PipeWire bridge")
    (description
     "Spout2 to PipeWire bridge")
    (home-page "https://github.com/hoshinolina/spout2pw")
    (license license:lgpl2.1)))

;;; ── signalbackup-tools-git ──────────────────────────────────────
;;; Tool to work with Signal Backup files
;;; AUR: signalbackup-tools-git  →  Guix: signalbackup-tools-git
;;; Upstream: https://github.com/bepaald/signalbackup-tools
;;;
(define-public signalbackup-tools-git
  (package
    (name "signalbackup-tools-git")
    (version "20241106.1.r0.g242c983")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bepaald/signalbackup-tools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (synopsis "Tool to work with Signal Backup files")
    (description
     "Tool to work with Signal Backup files")
    (home-page "https://github.com/bepaald/signalbackup-tools")
    (license license:gpl3+)))

;;; ── scarlett4-firmware ──────────────────────────────────────────
;;; Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20
;;; AUR: scarlett4-firmware  →  Guix: scarlett4-firmware
;;; Upstream: https://github.com/geoffreybennett/scarlett4-firmware
;;;
(define-public scarlett4-firmware
  (package
    (name "scarlett4-firmware")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/geoffreybennett/scarlett4-firmware")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               )))
    (native-inputs (list pkg-config))
    (synopsis "firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20")
    (description
     "Firmware for Focusrite Scarlett 4th Gen 16i16, 18i16, 18i20")
    (home-page "https://github.com/geoffreybennett/scarlett4-firmware")
    (license nonguix-license:nonfree)))

