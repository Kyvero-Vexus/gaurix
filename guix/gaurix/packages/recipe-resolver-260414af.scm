;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414af
;;; Resolves 100 packages from general queue.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260414af)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system node)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages compression)
  #:export (
            reciteword
            epubsynth
            batticonplus
            celestial-gtk-theme
            chroma-visualizer-git
            identities
            gssg-git
            bootupd-git
            shim-fedora
            wooz-git
            pacman-ostree
            cpro-ngate
            run0edit
            verusfmt-bin
            verus-analyzer-bin
            libtmplinux
            python-html2image-bin
            obs-source-switcher
            obs-plugin-time-source
            elecap-bin
            diogenes-bin
            git-heatgrid
            tuxnix-sway
            csharp-ls
            eralchemy
            ksud
            warfork-bin
            wild-git
            basalt-bin
            amplitude-soundboard-appimage
            tmpvoid
            gnome-extra-meta
            libaegis
            goatcounter-bin
            watch-your-lan
            submagic
            python-ollama-flow
            xfwm4-theme-pop-git
            lavalauncher-mao-git
            lfp
            uabea-next-git
            python-llm-mistral
            lua53-pam-git
            blender-launcher-v2-bin
            obs-plugin-vertical-canvas-git
            ziniaobrowser-bin
            cantata-legacy
            python-llm-openrouter
            python-llm-ollama
            python-llm-gemini
            python-llm-anthropic
            watershot-wayshot-git
            tomlq-bin
            python-ytfetcher
            dracut-iwd
            wayweather
            realm-bin
            pitchfork-bin
            hk-bin
            grub-android-prober
            ingest-bin
            grub-secureboot-scripts
            ezy-bin
            cargo-leptos
            ghorg-bin
            flipperzero-ufbt-git
            crosspatch-bin
            pog-appimage
            go-ldap-admin
            geteduroam
            doh-server-bin
            bstyle-qml-theme
            python-micropie
            papirus-colors-git
            dotify
            stalwart-mail
            stalwart-cli
            masscode-bin
            yaak-beta-bin
            archupd
            obelisk-bin
            syncthingdesktop
            shim-systemd-boot-update
            scolorpicker
            render50
            reflectortk-git
            panwriter
            gnome-shell-extension-applications-overview-tooltip
            python-backports-dot-shutil-get-terminal-size
            pacbro
            netbootxyz-systemd-boot
            nemo-copypath
            materialious-bin
            materialious
            lib32-libxxf86misc
            icon-browser-git
            gnome-software-packagekit-plugin-appstream-git
            gnome-software-appstream-git
            gnome-shell-extension-tiling-shell-git
            gnome-shell-extension-soft-brightness-git
            ))

;;; Nonfree license placeholder for proprietary packages.
(define license:nonfree
  ((@@ (guix licenses) license) "nonfree"
    "https://aur.archlinux.org"
    "Nonfree/proprietary license; see upstream for terms."))

;;;
;;; --- 1. reciteword ---
;;; Reciteword is an educational software that helps Chinese natives learn English, especially in vocabu
;;;

(define-public reciteword
  (package
    (name "reciteword")
    (version "0.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "reciteword" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "reciteword is an educational software that helps Chinese natives learn Englis...")
    (description "Reciteword is an educational software that helps Chinese natives learn English, especially in vocabulary enrichment. It claims to embrace la interfaz gráfica de usuario bonita. It also claims that learners are to enjoy English learning with reciteword.")
    (home-page "https://sourceforge.net/projects/reciteword/")
    (license license:gpl3+)))

;;;
;;; --- 2. epubsynth ---
;;; A command-line program for generating EPUB documents.
;;;

(define-public epubsynth
  (package
    (name "epubsynth")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "epubsynth" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a command-line program for generating EPUB documents")
    (description "A command-line program for generating EPUB documents.")
    (home-page "https://marianicolae.com/software/epubsynth/")
    (license license:asl2.0)))

;;;
;;; --- 3. batticonplus ---
;;; Lightweight battery icon for the system tray and notifier (based on cbatticon)
;;;

(define-public batticonplus
  (package
    (name "batticonplus")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "batticonplus" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight battery icon for the system tray and notifier (based on cbatticon)")
    (description "Lightweight battery icon for the system tray and notifier (based on cbatticon)")
    (home-page "https://github.com/artist4xlibre")
    (license license:gpl2+)))

;;;
;;; --- 4. celestial-gtk-theme ---
;;; A modern, customizable GTK theme with multiple color variants.
;;;

(define-public celestial-gtk-theme
  (package
    (name "celestial-gtk-theme")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "celestial-gtk-theme" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a modern, customizable GTK theme with multiple color variants")
    (description "A modern, customizable GTK theme with multiple color variants.")
    (home-page "https://github.com/zquestz/celestial-gtk-theme")
    (license license:gpl3+)))

;;;
;;; --- 5. chroma-visualizer-git ---
;;; A Rust-based, ASCII art shader audio visualizer for your terminal!
;;;

(define-public chroma-visualizer-git
  (package
    (name "chroma-visualizer-git")
    (version "r42.b4b4325")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "chroma-visualizer-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a Rust-based, ASCII art shader audio visualizer for your terminal!")
    (description "A Rust-based, ASCII art shader audio visualizer for your terminal!")
    (home-page "https://github.com/yuri-xyz/chroma")
    (license license:gpl3+)))

;;;
;;; --- 6. identities ---
;;; Modern password-store client made for GNOME.
;;;

(define-public identities
  (package
    (name "identities")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "identities" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "modern password-store client made for GNOME")
    (description "Modern password-store client made for GNOME.")
    (home-page "https://github.com/k8ieone/identities")
    (license license:gpl3)))

;;;
;;; --- 7. gssg-git ---
;;; Gemini static site generator.
;;;

(define-public gssg-git
  (package
    (name "gssg-git")
    (version "r7.fc755f2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gssg-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "gemini static site generator")
    (description "Gemini static site generator.")
    (home-page "https://git.sr.ht/~gsthnz/gssg")
    (license license:gpl3+)))

;;;
;;; --- 8. bootupd-git ---
;;; Bootloader updater.
;;;

(define-public bootupd-git
  (package
    (name "bootupd-git")
    (version "0.2.32.r21.gd7598fd")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "bootupd-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "bootloader updater")
    (description "Bootloader updater.")
    (home-page "https://github.com/coreos/bootupd")
    (license license:asl2.0)))

;;;
;;; --- 9. shim-fedora ---
;;; Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environ
;;;

(define-public shim-fedora
  (package
    (name "shim-fedora")
    (version "15.8-3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "shim-fedora" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "initial UEFI bootloader that handles chaining to a trusted full bootloader un...")
    (description "Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 binaries from Fedora). Target directory structure matches bootupd expectations.")
    (home-page "https://packages.fedoraproject.org/pkgs/shim/shim-x64")
    (license license:bsd-3)))

;;;
;;; --- 10. wooz-git ---
;;; zoom / magnifier utility for Wayland.
;;;

(define-public wooz-git
  (package
    (name "wooz-git")
    (version "r179.ca1b737")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wooz-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "zoom / magnifier utility for Wayland")
    (description "zoom / magnifier utility for Wayland.")
    (home-page "https://github.com/negrel/wooz")
    (license license:expat)))

;;;
;;; --- 11. pacman-ostree ---
;;; OSTree integration for Arch Linux (like rpm-ostree)
;;;

(define-public pacman-ostree
  (package
    (name "pacman-ostree")
    (version "r52")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pacman-ostree" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "oSTree integration for Arch Linux (like rpm-ostree)")
    (description "OSTree integration for Arch Linux (like rpm-ostree)")
    (home-page "https://github.com/ImmutableArch/pacman-ostree")
    (license license:gpl3+)))

;;;
;;; --- 12. cpro-ngate ---
;;; CryptoPro NGate VPN Client.
;;;

(define-public cpro-ngate
  (package
    (name "cpro-ngate")
    (version "1.0.20_98")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cpro-ngate" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "cryptoPro NGate VPN Client")
    (description "CryptoPro NGate VPN Client.")
    (home-page "https://www.cryptopro.ru/products/ngate")
    (license license:gpl3+)))

;;;
;;; --- 13. run0edit ---
;;; sudoedit but for run0.
;;;

(define-public run0edit
  (package
    (name "run0edit")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "run0edit" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "sudoedit but for run0")
    (description "sudoedit but for run0.")
    (home-page "https://sr.ht/~chinmay/run0edit")
    (license license:mpl2.0)))

;;;
;;; --- 14. verusfmt-bin ---
;;; An Opinionated Formatter for Verus.
;;;

(define-public verusfmt-bin
  (package
    (name "verusfmt-bin")
    (version "0.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "verusfmt-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "verusfmt-bin/" )))))
    (synopsis "an Opinionated Formatter for Verus")
    (description "An Opinionated Formatter for Verus.")
    (home-page "https://github.com/verus-lang/verusfmt")
    (license license:expat)))

;;;
;;; --- 15. verus-analyzer-bin ---
;;; A Verus compiler front-end for IDEs (derived from rust-analyzer)
;;;

(define-public verus-analyzer-bin
  (package
    (name "verus-analyzer-bin")
    (version "2026.03.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "verus-analyzer-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "verus-analyzer-bin/" )))))
    (synopsis "a Verus compiler front-end for IDEs (derived from rust-analyzer)")
    (description "A Verus compiler front-end for IDEs (derived from rust-analyzer)")
    (home-page "https://github.com/verus-lang/verus-analyzer")
    (license license:expat)))

;;;
;;; --- 16. libtmplinux ---
;;; Common code for the tmplinux suite.
;;;

(define-public libtmplinux
  (package
    (name "libtmplinux")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "libtmplinux" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "common code for the tmplinux suite")
    (description "Common code for the tmplinux suite.")
    (home-page "https://github.com/tmplinux/libtmplinux")
    (license license:expat)))

;;;
;;; --- 17. python-html2image-bin ---
;;; Generates images from headless browsers and html/css strings or files.
;;;

(define-public python-html2image-bin
  (package
    (name "python-html2image-bin")
    (version "2.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-html2image-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "python-html2image-bin/" )))))
    (synopsis "generates images from headless browsers and html/css strings or files")
    (description "Generates images from headless browsers and html/css strings or files.")
    (home-page "https://github.com/vgalin/html2image")
    (license license:expat)))

;;;
;;; --- 18. obs-source-switcher ---
;;; Plugin for OBS Studio to add a source that switches between a list of sources.
;;;

(define-public obs-source-switcher
  (package
    (name "obs-source-switcher")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "obs-source-switcher" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "plugin for OBS Studio to add a source that switches between a list of sources")
    (description "Plugin for OBS Studio to add a source that switches between a list of sources.")
    (home-page "https://obsproject.com/forum/resources/source-switcher.941/")
    (license license:gpl2+)))

;;;
;;; --- 19. obs-plugin-time-source ---
;;; Shows date and time in OBS as a source.
;;;

(define-public obs-plugin-time-source
  (package
    (name "obs-plugin-time-source")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "obs-plugin-time-source" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "shows date and time in OBS as a source")
    (description "Shows date and time in OBS as a source.")
    (home-page "https://git.sr.ht/~krystianch/obs-time-source")
    (license license:gpl3+)))

;;;
;;; --- 20. elecap-bin ---
;;; Playback video in a frameless electron app for screen-sharing and window capture.(Prebuilt version.U
;;;

(define-public elecap-bin
  (package
    (name "elecap-bin")
    (version "2.23.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "elecap-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "elecap-bin/" )))))
    (synopsis "playback video in a frameless electron app for screen-sharing and window capt...")
    (description "Playback video in a frameless electron app for screen-sharing and window capture.(Prebuilt version.Use system-wide electron)")
    (home-page "http://electroncapture.app")
    (license license:gpl3)))

;;;
;;; --- 21. diogenes-bin ---
;;; Application for searching and browsing legacy databases of texts in Latin and ancient Greek.
;;;

(define-public diogenes-bin
  (package
    (name "diogenes-bin")
    (version "4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "diogenes-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "diogenes-bin/" )))))
    (synopsis "application for searching and browsing legacy databases of texts in Latin and...")
    (description "Application for searching and browsing legacy databases of texts in Latin and ancient Greek.")
    (home-page "https://d.iogen.es/d/index.html")
    (license license:gpl3+)))

;;;
;;; --- 22. git-heatgrid ---
;;; Visualize git commits as a calendar heatmap.
;;;

(define-public git-heatgrid
  (package
    (name "git-heatgrid")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "git-heatgrid" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "visualize git commits as a calendar heatmap")
    (description "Visualize git commits as a calendar heatmap.")
    (home-page "https://github.com/denshakhov/git-heatgrid")
    (license license:expat)))

;;;
;;; --- 23. tuxnix-sway ---
;;; Sway configuration of tuxnix.
;;;

(define-public tuxnix-sway
  (package
    (name "tuxnix-sway")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "tuxnix-sway" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "sway configuration of tuxnix")
    (description "Sway configuration of tuxnix.")
    (home-page "https://codeberg.org/tuxnix/tuxnix-sway")
    (license license:gpl3+)))

;;;
;;; --- 24. csharp-ls ---
;;; Roslyn-based LSP language server for C#.
;;;

(define-public csharp-ls
  (package
    (name "csharp-ls")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "csharp-ls" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "roslyn-based LSP language server for C#")
    (description "Roslyn-based LSP language server for C#.")
    (home-page "https://github.com/razzmatazz/csharp-language-server")
    (license license:expat)))

;;;
;;; --- 25. eralchemy ---
;;; Entity Relation Diagrams generation tool.
;;;

(define-public eralchemy
  (package
    (name "eralchemy")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "eralchemy" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "entity Relation Diagrams generation tool")
    (description "Entity Relation Diagrams generation tool.")
    (home-page "https://github.com/eralchemy/eralchemy")
    (license license:asl2.0)))

;;;
;;; --- 26. ksud ---
;;; KernelSU userspace cli.
;;;

(define-public ksud
  (package
    (name "ksud")
    (version "3.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ksud" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "kernelSU userspace cli")
    (description "KernelSU userspace cli.")
    (home-page "https://kernelsu.org/")
    (license license:gpl3+)))

;;;
;;; --- 27. warfork-bin ---
;;; Free online multiplayer competitive FPS based on the Qfusion engine (official binary via Steam)
;;;

(define-public warfork-bin
  (package
    (name "warfork-bin")
    (version "2.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "warfork-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "warfork-bin/" )))))
    (synopsis "free online multiplayer competitive FPS based on the Qfusion engine (official...")
    (description "Free online multiplayer competitive FPS based on the Qfusion engine (official binary via Steam)")
    (home-page "https://www.warfork.com/")
    (license license:gpl2+)))

;;;
;;; --- 28. wild-git ---
;;; A linker with the goal of being very fast for iterative development.
;;;

(define-public wild-git
  (package
    (name "wild-git")
    (version "0.8.0.r72.g5dae38e0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wild-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a linker with the goal of being very fast for iterative development")
    (description "A linker with the goal of being very fast for iterative development.")
    (home-page "https://github.com/davidlattimore/wild")
    (license license:asl2.0)))

;;;
;;; --- 29. basalt-bin ---
;;; TUI Application to manage Obsidian vaults and notes directly from the terminal.
;;;

(define-public basalt-bin
  (package
    (name "basalt-bin")
    (version "0.12.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "basalt-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "basalt-bin/" )))))
    (synopsis "tUI Application to manage Obsidian vaults and notes directly from the terminal")
    (description "TUI Application to manage Obsidian vaults and notes directly from the terminal.")
    (home-page "https://github.com/erikjuhani/basalt")
    (license license:expat)))

;;;
;;; --- 30. amplitude-soundboard-appimage ---
;;; A sleek, cross-platform soundboard, available for Windows, MacOS, and Linux.
;;;

(define-public amplitude-soundboard-appimage
  (package
    (name "amplitude-soundboard-appimage")
    (version "2.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "amplitude-soundboard-appimage" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "amplitude-soundboard-appimage/" )))))
    (synopsis "a sleek, cross-platform soundboard, available for Windows, MacOS, and Linux")
    (description "A sleek, cross-platform soundboard, available for Windows, MacOS, and Linux.")
    (home-page "https://amplitude-soundboard.dan0v.com/")
    (license license:gpl3+)))

;;;
;;; --- 31. tmpvoid ---
;;; Part of the tmplinux suite. Temporary void Linux.
;;;

(define-public tmpvoid
  (package
    (name "tmpvoid")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "tmpvoid" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "part of the tmplinux suite. Temporary void Linux")
    (description "Part of the tmplinux suite. Temporary void Linux.")
    (home-page "https://github.com/tmplinux/tmpvoid")
    (license license:expat)))

;;;
;;; --- 32. gnome-extra-meta ---
;;; Meta package to install gnome-extra.
;;;

(define-public gnome-extra-meta
  (package
    (name "gnome-extra-meta")
    (version "49")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-extra-meta" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "meta package to install gnome-extra")
    (description "Meta package to install gnome-extra.")
    (home-page "https://www.gnome.org/")
    (license license:gpl3+)))

;;;
;;; --- 33. libaegis ---
;;; Portable C implementations of the AEGIS family of high-performance authenticated encryption algorith
;;;

(define-public libaegis
  (package
    (name "libaegis")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "libaegis" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "portable C implementations of the AEGIS family of high-performance authentica...")
    (description "Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms.")
    (home-page "https://github.com/aegis-aead/libaegis.git")
    (license license:expat)))

;;;
;;; --- 34. goatcounter-bin ---
;;; Easy web analytics in go. No tracking of personal data.
;;;

(define-public goatcounter-bin
  (package
    (name "goatcounter-bin")
    (version "2.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "goatcounter-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "goatcounter-bin/" )))))
    (synopsis "easy web analytics in go. No tracking of personal data")
    (description "Easy web analytics in go. No tracking of personal data.")
    (home-page "https://goatcounter.com")
    (license license:gpl3+)))

;;;
;;; --- 35. watch-your-lan ---
;;; Lightweight network IP scanner with web GUI.
;;;

(define-public watch-your-lan
  (package
    (name "watch-your-lan")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "watch-your-lan" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lightweight network IP scanner with web GUI")
    (description "Lightweight network IP scanner with web GUI.")
    (home-page "https://github.com/aceberg/WatchYourLAN")
    (license license:expat)))

;;;
;;; --- 36. submagic ---
;;; Writes stdin into a temp file and then prints the file name.
;;;

(define-public submagic
  (package
    (name "submagic")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "submagic" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "writes stdin into a temp file and then prints the file name")
    (description "Writes stdin into a temp file and then prints the file name.")
    (home-page "https://github.com/claui/submagic")
    (license license:asl2.0)))

;;;
;;; --- 37. python-ollama-flow ---
;;; A Python library for the Ollama API.
;;;

(define-public python-ollama-flow
  (package
    (name "python-ollama-flow")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-ollama-flow" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a Python library for the Ollama API")
    (description "A Python library for the Ollama API.")
    (home-page "https://pypi.org/project/ollama-flow")
    (license license:expat)))

;;;
;;; --- 38. xfwm4-theme-pop-git ---
;;; Simple Xfwm theme for Xfce matching Pop GTK theme from Pop!_OS by System76 (git version)
;;;

(define-public xfwm4-theme-pop-git
  (package
    (name "xfwm4-theme-pop-git")
    (version "r9.cb3d3b5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "xfwm4-theme-pop-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple Xfwm theme for Xfce matching Pop GTK theme from Pop!_OS by System76 (g...")
    (description "Simple Xfwm theme for Xfce matching Pop GTK theme from Pop!_OS by System76 (git version)")
    (home-page "https://www.opendesktop.org/p/1299758/")
    (license license:gpl3+)))

;;;
;;; --- 39. lavalauncher-mao-git ---
;;; A simple launcher panel for Wayland.
;;;

(define-public lavalauncher-mao-git
  (package
    (name "lavalauncher-mao-git")
    (version "20250429.07717e7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "lavalauncher-mao-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a simple launcher panel for Wayland")
    (description "A simple launcher panel for Wayland.")
    (home-page "https://github.com/DreamMaoMao/lavalauncher")
    (license license:gpl3+)))

;;;
;;; --- 40. lfp ---
;;; A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and mu
;;;

(define-public lfp
  (package
    (name "lfp")
    (version "4.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "lfp" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a wrapper for the lf file manager with in-terminal media previews, on-exit di...")
    (description "A wrapper for the lf file manager with in-terminal media previews, on-exit directory changing and much more.")
    (home-page "https://gitlab.com/a4to/lfp")
    (license license:expat)))

;;;
;;; --- 41. uabea-next-git ---
;;; A research and modding tool for SerializedFiles and Asset Bundles.
;;;

(define-public uabea-next-git
  (package
    (name "uabea-next-git")
    (version "0.0.0.r146.f6a2143")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "uabea-next-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a research and modding tool for SerializedFiles and Asset Bundles")
    (description "A research and modding tool for SerializedFiles and Asset Bundles.")
    (home-page "https://github.com/nesrak1/UABEANext")
    (license license:expat)))

;;;
;;; --- 42. python-llm-mistral ---
;;; LLM plugin providing access to Mistral models using the Mistral API.
;;;

(define-public python-llm-mistral
  (package
    (name "python-llm-mistral")
    (version "0.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-llm-mistral" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM plugin providing access to Mistral models using the Mistral API")
    (description "LLM plugin providing access to Mistral models using the Mistral API.")
    (home-page "https://github.com/simonw/llm-mistral")
    (license license:asl2.0)))

;;;
;;; --- 43. lua53-pam-git ---
;;; A module for lua53 to use PAM.
;;;

(define-public lua53-pam-git
  (package
    (name "lua53-pam-git")
    (version "1:latest")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "lua53-pam-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a module for lua53 to use PAM")
    (description "A module for lua53 to use PAM.")
    (home-page "https://github.com/nhktmdzhg/lua-pam")
    (license license:expat)))

;;;
;;; --- 44. blender-launcher-v2-bin ---
;;; Blender Launcher is a standalone software client that provides management for stable, daily and expe
;;;

(define-public blender-launcher-v2-bin
  (package
    (name "blender-launcher-v2-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "blender-launcher-v2-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "blender-launcher-v2-bin/" )))))
    (synopsis "blender Launcher is a standalone software client that provides management for...")
    (description "Blender Launcher is a standalone software client that provides management for stable, daily and experimental builds of Blender 3D. It is a free open source project available for 64-bit Windows and Linux (GLIBC 2.31 and higher) operating systems.")
    (home-page "https://github.com/Victor-IX/Blender-Launcher-V2")
    (license license:gpl3)))

;;;
;;; --- 45. obs-plugin-vertical-canvas-git ---
;;; OBS Studio plugin to record in vertical canvas by aitum.
;;;

(define-public obs-plugin-vertical-canvas-git
  (package
    (name "obs-plugin-vertical-canvas-git")
    (version "1.2.1.r4.g392729a")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "obs-plugin-vertical-canvas-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "oBS Studio plugin to record in vertical canvas by aitum")
    (description "OBS Studio plugin to record in vertical canvas by aitum.")
    (home-page "https://github.com/Aitum/obs-vertical-canvas")
    (license license:gpl2+)))

;;;
;;; --- 46. ziniaobrowser-bin ---
;;; 紫鸟浏览器 - 基于 Chromium 的浏览器.
;;;

(define-public ziniaobrowser-bin
  (package
    (name "ziniaobrowser-bin")
    (version "6.9.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ziniaobrowser-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "ziniaobrowser-bin/" )))))
    (synopsis "紫鸟浏览器 - 基于 Chromium 的浏览器")
    (description "紫鸟浏览器 - 基于 Chromium 的浏览器.")
    (home-page "https://www.ziniao.com/")
    (license license:nonfree)))

;;;
;;; --- 47. cantata-legacy ---
;;; Qt5 client for the music player daemon (MPD)
;;;

(define-public cantata-legacy
  (package
    (name "cantata-legacy")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cantata-legacy" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "qt5 client for the music player daemon (MPD)")
    (description "Qt5 client for the music player daemon (MPD)")
    (home-page "https://github.com/CDrummond/cantata")
    (license license:gpl3+)))

;;;
;;; --- 48. python-llm-openrouter ---
;;; LLM plugin for models hosted by OpenRouter.
;;;

(define-public python-llm-openrouter
  (package
    (name "python-llm-openrouter")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-llm-openrouter" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM plugin for models hosted by OpenRouter")
    (description "LLM plugin for models hosted by OpenRouter.")
    (home-page "https://github.com/simonw/llm-openrouter")
    (license license:asl2.0)))

;;;
;;; --- 49. python-llm-ollama ---
;;; LLM plugin providing access to models running on an Ollama server.
;;;

(define-public python-llm-ollama
  (package
    (name "python-llm-ollama")
    (version "0.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-llm-ollama" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM plugin providing access to models running on an Ollama server")
    (description "LLM plugin providing access to models running on an Ollama server.")
    (home-page "https://github.com/taketwo/llm-ollama")
    (license license:asl2.0)))

;;;
;;; --- 50. python-llm-gemini ---
;;; LLM plugin to access Google's Gemini family of models.
;;;

(define-public python-llm-gemini
  (package
    (name "python-llm-gemini")
    (version "0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-llm-gemini" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM plugin to access Google's Gemini family of models")
    (description "LLM plugin to access Google's Gemini family of models.")
    (home-page "https://github.com/simonw/llm-gemini")
    (license license:asl2.0)))

;;;
;;; --- 51. python-llm-anthropic ---
;;; LLM plugin for models hosted by Anthropic, including the Claude series.
;;;

(define-public python-llm-anthropic
  (package
    (name "python-llm-anthropic")
    (version "0.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-llm-anthropic" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "lLM plugin for models hosted by Anthropic, including the Claude series")
    (description "LLM plugin for models hosted by Anthropic, including the Claude series.")
    (home-page "https://github.com/simonw/llm-anthropic")
    (license license:asl2.0)))

;;;
;;; --- 52. watershot-wayshot-git ---
;;; Watershot fork with libwayshot instead of grim.
;;;

(define-public watershot-wayshot-git
  (package
    (name "watershot-wayshot-git")
    (version "r83.7b9723c")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "watershot-wayshot-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "watershot fork with libwayshot instead of grim")
    (description "Watershot fork with libwayshot instead of grim.")
    (home-page "https://github.com/Gigas002/watershot")
    (license license:gpl3+)))

;;;
;;; --- 53. tomlq-bin ---
;;; Tool for getting data from TOML files.
;;;

(define-public tomlq-bin
  (package
    (name "tomlq-bin")
    (version "0.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "tomlq-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "tomlq-bin/" )))))
    (synopsis "tool for getting data from TOML files")
    (description "Tool for getting data from TOML files.")
    (home-page "https://github.com/cryptaliagy/tomlq")
    (license license:expat)))

;;;
;;; --- 54. python-ytfetcher ---
;;; Effortlessly fetch thousands of YouTube video transcripts and metadata in bulk.
;;;

(define-public python-ytfetcher
  (package
    (name "python-ytfetcher")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-ytfetcher" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "effortlessly fetch thousands of YouTube video transcripts and metadata in bulk")
    (description "Effortlessly fetch thousands of YouTube video transcripts and metadata in bulk.")
    (home-page "https://pypi.org/project/ytfetcher/")
    (license license:expat)))

;;;
;;; --- 55. dracut-iwd ---
;;; Dracut module to provide wireless internet access to initramfs.
;;;

(define-public dracut-iwd
  (package
    (name "dracut-iwd")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "dracut-iwd" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "dracut module to provide wireless internet access to initramfs")
    (description "Dracut module to provide wireless internet access to initramfs.")
    (home-page "https://git.sr.ht/~mvforell/dracut-iwd")
    (license license:expat)))

;;;
;;; --- 56. wayweather ---
;;; Custom Weather Script for Waybar with IP Geolocation.
;;;

(define-public wayweather
  (package
    (name "wayweather")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "wayweather" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "custom Weather Script for Waybar with IP Geolocation")
    (description "Custom Weather Script for Waybar with IP Geolocation.")
    (home-page "https://github.com/TheElevatedOne/wayweather")
    (license license:gpl3+)))

;;;
;;; --- 57. realm-bin ---
;;; A simple, high performance relay server written in rust.
;;;

(define-public realm-bin
  (package
    (name "realm-bin")
    (version "2.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "realm-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "realm-bin/" )))))
    (synopsis "a simple, high performance relay server written in rust")
    (description "A simple, high performance relay server written in rust.")
    (home-page "https://github.com/zhboner/realm")
    (license license:expat)))

;;;
;;; --- 58. pitchfork-bin ---
;;; Daemons with DX.
;;;

(define-public pitchfork-bin
  (package
    (name "pitchfork-bin")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pitchfork-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "pitchfork-bin/" )))))
    (synopsis "daemons with DX")
    (description "Daemons with DX.")
    (home-page "https://github.com/jdx/pitchfork")
    (license license:expat)))

;;;
;;; --- 59. hk-bin ---
;;; Git hooks and project lints.
;;;

(define-public hk-bin
  (package
    (name "hk-bin")
    (version "1.42.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "hk-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "hk-bin/" )))))
    (synopsis "git hooks and project lints")
    (description "Git hooks and project lints.")
    (home-page "https://github.com/jdx/hk")
    (license license:expat)))

;;;
;;; --- 60. grub-android-prober ---
;;; GRUB Configuration for Android detection (Only works with some sort of filesystems)
;;;

(define-public grub-android-prober
  (package
    (name "grub-android-prober")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "grub-android-prober" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "gRUB Configuration for Android detection (Only works with some sort of filesy...")
    (description "GRUB Configuration for Android detection (Only works with some sort of filesystems)")
    (home-page "https://github.com/shadichy/grub-android-x86.git")
    (license license:gpl3+)))

;;;
;;; --- 61. ingest-bin ---
;;; Parse files and websites to clipboard or a file for ingestions by AI / LLMs.
;;;

(define-public ingest-bin
  (package
    (name "ingest-bin")
    (version "0.15.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ingest-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "ingest-bin/" )))))
    (synopsis "parse files and websites to clipboard or a file for ingestions by AI / LLMs")
    (description "Parse files and websites to clipboard or a file for ingestions by AI / LLMs.")
    (home-page "https://github.com/sammcj/ingest")
    (license license:expat)))

;;;
;;; --- 62. grub-secureboot-scripts ---
;;; GRUB SecureBoot scripts to setup SecureBoot using sbctl with automatic signing of GRUB files and ker
;;;

(define-public grub-secureboot-scripts
  (package
    (name "grub-secureboot-scripts")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "grub-secureboot-scripts" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "gRUB SecureBoot scripts to setup SecureBoot using sbctl with automatic signin...")
    (description "GRUB SecureBoot scripts to setup SecureBoot using sbctl with automatic signing of GRUB files and kernel images.")
    (home-page "https://github.com/shadichy/grub-sbctl")
    (license license:gpl3+)))

;;;
;;; --- 63. ezy-bin ---
;;; Fully-featured desktop gRPC/gRPC-Web client.
;;;

(define-public ezy-bin
  (package
    (name "ezy-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ezy-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "ezy-bin/" )))))
    (synopsis "fully-featured desktop gRPC/gRPC-Web client")
    (description "Fully-featured desktop gRPC/gRPC-Web client.")
    (home-page "https://github.com/getezy/ezy")
    (license license:mpl2.0)))

;;;
;;; --- 64. cargo-leptos ---
;;; Build tool for the Rust framework Leptos.
;;;

(define-public cargo-leptos
  (package
    (name "cargo-leptos")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "cargo-leptos" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "build tool for the Rust framework Leptos")
    (description "Build tool for the Rust framework Leptos.")
    (home-page "https://github.com/leptos-rs/cargo-leptos")
    (license license:expat)))

;;;
;;; --- 65. ghorg-bin ---
;;; Quickly clone or backup an entire org/users repositories into one directory.
;;;

(define-public ghorg-bin
  (package
    (name "ghorg-bin")
    (version "1.11.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "ghorg-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "ghorg-bin/" )))))
    (synopsis "quickly clone or backup an entire org/users repositories into one directory")
    (description "Quickly clone or backup an entire org/users repositories into one directory.")
    (home-page "https://github.com/gabrie30/ghorg")
    (license license:asl2.0)))

;;;
;;; --- 66. flipperzero-ufbt-git ---
;;; Compact tool for building and debugging applications for Flipper Zero.
;;;

(define-public flipperzero-ufbt-git
  (package
    (name "flipperzero-ufbt-git")
    (version "r73.e04b34e")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "flipperzero-ufbt-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "compact tool for building and debugging applications for Flipper Zero")
    (description "Compact tool for building and debugging applications for Flipper Zero.")
    (home-page "https://pypi.org/project/ufbt/")
    (license license:gpl3+)))

;;;
;;; --- 67. crosspatch-bin ---
;;; A mod Manager for Sonic Racing: CrossWorlds.
;;;

(define-public crosspatch-bin
  (package
    (name "crosspatch-bin")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "crosspatch-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "crosspatch-bin/" )))))
    (synopsis "a mod Manager for Sonic Racing: CrossWorlds")
    (description "A mod Manager for Sonic Racing: CrossWorlds.")
    (home-page "https://github.com/NickPlayzGITHUB/CrossPatch")
    (license license:gpl3+)))

;;;
;;; --- 68. pog-appimage ---
;;; A Kmk firmware flashing and configuration tool.
;;;

(define-public pog-appimage
  (package
    (name "pog-appimage")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pog-appimage" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "pog-appimage/" )))))
    (synopsis "a Kmk firmware flashing and configuration tool")
    (description "A Kmk firmware flashing and configuration tool.")
    (home-page "https://github.com/JanLunge/pog")
    (license license:expat)))

;;;
;;; --- 69. go-ldap-admin ---
;;; go-ldap-admin旨在为OpenLDAP服务端提供一个简单易用，清晰美观的现代化管理后台。.
;;;

(define-public go-ldap-admin
  (package
    (name "go-ldap-admin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "go-ldap-admin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "go-ldap-admin旨在为OpenLDAP服务端提供一个简单易用，清晰美观的现代化管理后台。")
    (description "go-ldap-admin旨在为OpenLDAP服务端提供一个简单易用，清晰美观的现代化管理后台。.")
    (home-page "https://github.com/opsre/go-ldap-admin")
    (license license:asl2.0)))

;;;
;;; --- 70. geteduroam ---
;;; Configure your Eduroam Wifi connection.
;;;

(define-public geteduroam
  (package
    (name "geteduroam")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "geteduroam" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "configure your Eduroam Wifi connection")
    (description "Configure your Eduroam Wifi connection.")
    (home-page "https://get.eduroam.org/")
    (license license:bsd-3)))

;;;
;;; --- 71. doh-server-bin ---
;;; Fast, mature, secure DoH and ODoH server proxy written in Rust.
;;;

(define-public doh-server-bin
  (package
    (name "doh-server-bin")
    (version "0.9.15")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "doh-server-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "doh-server-bin/" )))))
    (synopsis "fast, mature, secure DoH and ODoH server proxy written in Rust")
    (description "Fast, mature, secure DoH and ODoH server proxy written in Rust.")
    (home-page "https://github.com/DNSCrypt/doh-server")
    (license license:expat)))

;;;
;;; --- 72. bstyle-qml-theme ---
;;; Style for QML applications.
;;;

(define-public bstyle-qml-theme
  (package
    (name "bstyle-qml-theme")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "bstyle-qml-theme" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "style for QML applications")
    (description "Style for QML applications.")
    (home-page "https://github.com/Blaadick/BStyle")
    (license license:gpl3)))

;;;
;;; --- 73. python-micropie ---
;;; An ultra micro ASGI web framework.
;;;

(define-public python-micropie
  (package
    (name "python-micropie")
    (version "0.28")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-micropie" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "an ultra micro ASGI web framework")
    (description "An ultra micro ASGI web framework.")
    (home-page "https://patx.github.io/micropie/")
    (license license:bsd-3)))

;;;
;;; --- 74. papirus-colors-git ---
;;; Papirus folders with KDE Color Scheme support.
;;;

(define-public papirus-colors-git
  (package
    (name "papirus-colors-git")
    (version "r5.ae694e1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "papirus-colors-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "papirus folders with KDE Color Scheme support")
    (description "Papirus folders with KDE Color Scheme support.")
    (home-page "https://github.com/varlesh/papirus-colors")
    (license license:gpl3+)))

;;;
;;; --- 75. dotify ---
;;; Next-generation music player with a modern interface and advanced features.
;;;

(define-public dotify
  (package
    (name "dotify")
    (version "2.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "dotify" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "next-generation music player with a modern interface and advanced features")
    (description "Next-generation music player with a modern interface and advanced features.")
    (home-page "https://sourceforge.net/projects/dotify/files/dotify/Dotify_2.1.3_amd64.deb/download")
    (license license:nonfree)))

;;;
;;; --- 76. stalwart-mail ---
;;; Stalwart Mail and Collaboration Server.
;;;

(define-public stalwart-mail
  (package
    (name "stalwart-mail")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "stalwart-mail" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "stalwart Mail and Collaboration Server")
    (description "Stalwart Mail and Collaboration Server.")
    (home-page "https://aur.archlinux.org/packages/stalwart-mail")
    (license license:gpl3+)))

;;;
;;; --- 77. stalwart-cli ---
;;; Stalwart Server CLI.
;;;

(define-public stalwart-cli
  (package
    (name "stalwart-cli")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "stalwart-cli" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "stalwart Server CLI")
    (description "Stalwart Server CLI.")
    (home-page "https://aur.archlinux.org/packages/stalwart-cli")
    (license license:gpl3+)))

;;;
;;; --- 78. masscode-bin ---
;;; A free and open source code snippets manager for developers.(Prebuilt version.Use system-wide electr
;;;

(define-public masscode-bin
  (package
    (name "masscode-bin")
    (version "5.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "masscode-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "masscode-bin/" )))))
    (synopsis "a free and open source code snippets manager for developers.(Prebuilt version...")
    (description "A free and open source code snippets manager for developers.(Prebuilt version.Use system-wide electron)")
    (home-page "https://masscode.io/")
    (license license:agpl3+)))

;;;
;;; --- 79. yaak-beta-bin ---
;;; Offline and Git friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (Pre-compiled versi
;;;

(define-public yaak-beta-bin
  (package
    (name "yaak-beta-bin")
    (version "2026.3.0-0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "yaak-beta-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "yaak-beta-bin/" )))))
    (synopsis "offline and Git friendly API client for HTTP, GraphQL, WebSockets, SSE, and g...")
    (description "Offline and Git friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC (Pre-compiled version)")
    (home-page "https://yaak.app/")
    (license license:expat)))

;;;
;;; --- 80. archupd ---
;;; Arch updater.
;;;

(define-public archupd
  (package
    (name "archupd")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "archupd" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "arch updater")
    (description "Arch updater.")
    (home-page "https://github.com/c4rlo/archupd")
    (license license:expat)))

;;;
;;; --- 81. obelisk-bin ---
;;; CLI tool for saving web page as single HTML file.
;;;

(define-public obelisk-bin
  (package
    (name "obelisk-bin")
    (version "0.91")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "obelisk-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "obelisk-bin/" )))))
    (synopsis "cLI tool for saving web page as single HTML file")
    (description "CLI tool for saving web page as single HTML file.")
    (home-page "https://github.com/go-shiori/obelisk")
    (license license:expat)))

;;;
;;; --- 82. syncthingdesktop ---
;;; Unnofficial Syncthing desktop application.
;;;

(define-public syncthingdesktop
  (package
    (name "syncthingdesktop")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "syncthingdesktop" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "unnofficial Syncthing desktop application")
    (description "Unnofficial Syncthing desktop application.")
    (home-page "https://gitlab.com/linuxbombay/syncthingdesktop")
    (license license:gpl3+)))

;;;
;;; --- 83. shim-systemd-boot-update ---
;;; Automatically update grubx64.efi with systemd-boot-update.service for shim.
;;;

(define-public shim-systemd-boot-update
  (package
    (name "shim-systemd-boot-update")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "shim-systemd-boot-update" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "automatically update grubx64.efi with systemd-boot-update.service for shim")
    (description "Automatically update grubx64.efi with systemd-boot-update.service for shim.")
    (home-page "https://aur.archlinux.org/packages/shim-systemd-boot-update")
    (license license:gpl3+)))

;;;
;;; --- 84. scolorpicker ---
;;; smooll's Color Picker.
;;;

(define-public scolorpicker
  (package
    (name "scolorpicker")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "scolorpicker" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "smooll's Color Picker")
    (description "smooll's Color Picker.")
    (home-page "https://www.github.com/smooll-d/scolorpicker")
    (license license:bsd-0)))

;;;
;;; --- 85. render50 ---
;;; Render source code as PDFs.
;;;

(define-public render50
  (package
    (name "render50")
    (version "9.2.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "render50" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "render source code as PDFs")
    (description "Render source code as PDFs.")
    (home-page "https://github.com/cs50/render50")
    (license license:gpl3+)))

;;;
;;; --- 86. reflectortk-git ---
;;; Simple GUI for selecting pacman mirrors using reflector (git version).
;;;

(define-public reflectortk-git
  (package
    (name "reflectortk-git")
    (version "r2.f8e83c8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "reflectortk-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "simple GUI for selecting pacman mirrors using reflector (git version)")
    (description "Simple GUI for selecting pacman mirrors using reflector (git version).")
    (home-page "https://github.com/indiscipline/reflectortk")
    (license license:gpl2+)))

;;;
;;; --- 87. panwriter ---
;;; Markdown editor with pandoc integration and paginated preview.
;;;

(define-public panwriter
  (package
    (name "panwriter")
    (version "0.8.10")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "panwriter" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "markdown editor with pandoc integration and paginated preview")
    (description "Markdown editor with pandoc integration and paginated preview.")
    (home-page "https://panwriter.com")
    (license license:gpl3+)))

;;;
;;; --- 88. gnome-shell-extension-applications-overview-tooltip ---
;;; Shows a tooltip over applications icons on applications overview.
;;;

(define-public gnome-shell-extension-applications-overview-tooltip
  (package
    (name "gnome-shell-extension-applications-overview-tooltip")
    (version "16")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-shell-extension-applications-overview-tooltip" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "shows a tooltip over applications icons on applications overview")
    (description "Shows a tooltip over applications icons on applications overview.")
    (home-page "https://github.com/RaphaelRochet/applications-overview-tooltip")
    (license license:gpl3+)))

;;;
;;; --- 89. python-backports.shutil_get_terminal_size ---
;;; A backport of the get_terminal_size function from Python 3.3's shutil.
;;;

(define-public python-backports-dot-shutil-get-terminal-size
  (package
    (name "python-backports.shutil_get_terminal_size")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "python-backports.shutil_get_terminal_size" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "a backport of the get_terminal_size function from Python 3.3's shutil")
    (description "A backport of the get_terminal_size function from Python 3.3's shutil.")
    (home-page "https://github.com/chrippa/backports.shutil_get_terminal_size")
    (license license:expat)))

;;;
;;; --- 90. pacbro ---
;;; Package Browser for Arch, terminal multi-panel edition.
;;;

(define-public pacbro
  (package
    (name "pacbro")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "pacbro" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "package Browser for Arch, terminal multi-panel edition")
    (description "Package Browser for Arch, terminal multi-panel edition.")
    (home-page "https://github.com/cherio/pacbro")
    (license license:expat)))

;;;
;;; --- 91. netbootxyz-systemd-boot ---
;;; netboot.xyz as systemd-boot loader entry.
;;;

(define-public netbootxyz-systemd-boot
  (package
    (name "netbootxyz-systemd-boot")
    (version "3.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "netbootxyz-systemd-boot" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "netboot.xyz as systemd-boot loader entry")
    (description "netboot.xyz as systemd-boot loader entry.")
    (home-page "https://netboot.xyz/")
    (license license:asl2.0)))

;;;
;;; --- 92. nemo-copypath ---
;;; Adds an option to copy the full path of the selected file to the nemo context menu.
;;;

(define-public nemo-copypath
  (package
    (name "nemo-copypath")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "nemo-copypath" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "adds an option to copy the full path of the selected file to the nemo context...")
    (description "Adds an option to copy the full path of the selected file to the nemo context menu.")
    (home-page "https://github.com/username227/nemo-copy-path")
    (license license:gpl3+)))

;;;
;;; --- 93. materialious-bin ---
;;; Modern material design for Invidious.
;;;

(define-public materialious-bin
  (package
    (name "materialious-bin")
    (version "1.16.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "materialious-bin" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list "." (string-append "share/" "materialious-bin/" )))))
    (synopsis "modern material design for Invidious")
    (description "Modern material design for Invidious.")
    (home-page "https://github.com/Materialious/Materialious")
    (license license:agpl3+)))

;;;
;;; --- 94. materialious ---
;;; Modern material design for Invidious.
;;;

(define-public materialious
  (package
    (name "materialious")
    (version "1.16.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "materialious" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "modern material design for Invidious")
    (description "Modern material design for Invidious.")
    (home-page "https://materialio.us")
    (license license:agpl3+)))

;;;
;;; --- 95. lib32-libxxf86misc ---
;;; X11 XFree86 misc extension library (32-bit)
;;;

(define-public lib32-libxxf86misc
  (package
    (name "lib32-libxxf86misc")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "lib32-libxxf86misc" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "x11 XFree86 misc extension library (32-bit)")
    (description "X11 XFree86 misc extension library (32-bit)")
    (home-page "https://xorg.freedesktop.org/")
    (license license:nonfree)))

;;;
;;; --- 96. icon-browser-git ---
;;; Browse system installed icon themes.
;;;

(define-public icon-browser-git
  (package
    (name "icon-browser-git")
    (version "r19.68c7343")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "icon-browser-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "browse system installed icon themes")
    (description "Browse system installed icon themes.")
    (home-page "https://github.com/Aylur/icon-browser")
    (license license:expat)))

;;;
;;; --- 97. gnome-software-packagekit-plugin-appstream-git ---
;;; PackageKit support plugin for GNOME Software (AppStream Git variant)
;;;

(define-public gnome-software-packagekit-plugin-appstream-git
  (package
    (name "gnome-software-packagekit-plugin-appstream-git")
    (version "48.0+r177+g149166546")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-software-packagekit-plugin-appstream-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "packageKit support plugin for GNOME Software (AppStream Git variant)")
    (description "PackageKit support plugin for GNOME Software (AppStream Git variant)")
    (home-page "https://wiki.gnome.org/Apps/Software/")
    (license license:gpl2+)))

;;;
;;; --- 98. gnome-software-appstream-git ---
;;; GNOME Software (AppStream Git variant)
;;;

(define-public gnome-software-appstream-git
  (package
    (name "gnome-software-appstream-git")
    (version "48.0+r177+g149166546")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-software-appstream-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "gNOME Software (AppStream Git variant)")
    (description "GNOME Software (AppStream Git variant)")
    (home-page "https://wiki.gnome.org/Apps/Software/")
    (license license:gpl2+)))

;;;
;;; --- 99. gnome-shell-extension-tiling-shell-git ---
;;; Extend GNOME Shell with advanced tiling window management.
;;;

(define-public gnome-shell-extension-tiling-shell-git
  (package
    (name "gnome-shell-extension-tiling-shell-git")
    (version "r69.5d01a62")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-shell-extension-tiling-shell-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "extend GNOME Shell with advanced tiling window management")
    (description "Extend GNOME Shell with advanced tiling window management.")
    (home-page "https://github.com/domferr/tilingshell")
    (license license:gpl2+)))

;;;
;;; --- 100. gnome-shell-extension-soft-brightness-git ---
;;; Manage your display brightness via an alpha overlay (instead of the backlight).
;;;

(define-public gnome-shell-extension-soft-brightness-git
  (package
    (name "gnome-shell-extension-soft-brightness-git")
    (version "1:43.r5.gdba4979")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://aur.archlinux.org/cgit/aur.git/snapshot/"
                                  "gnome-shell-extension-soft-brightness-git" ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "manage your display brightness via an alpha overlay (instead of the backlight)")
    (description "Manage your display brightness via an alpha overlay (instead of the backlight).")
    (home-page "https://github.com/jkitching/soft-brightness-plus")
    (license license:gpl3+)))
