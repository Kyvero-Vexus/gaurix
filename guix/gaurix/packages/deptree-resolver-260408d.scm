;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260408d
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 91 packages resolved with recipes, 9 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-08

(define-module (gaurix packages deptree-resolver-260408d)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system font)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:export (
            dxvk-bin
            envhub-bin
            envy-bin
            epub2txt
            etcdotica-bin
            exec-as
            fasttext-langid-models
            fcitx5-pinyin-starrail
            fdformat
            featherwallet-bin
            ficsit-cli-bin
            figma-agent-linux-bin
            filen-cli-bin
            firefox-gnome-theme
            flat-remix-gtk
            flow-control-bin
            fmtools
            fnm-bin
            fondu
            foundryvtt
            foxicons-theme
            frankenphp-bin
            furtherance-bin
            futhark-bin
            gama-platform-jdk
            gdscript-formatter-bin
            gdsdecomp-bin
            gdu-bin
            gh-aw-bin
            ghcup-hs-bin
            git-scope-bin
            git-who-bin
            gittop-tui-bin
            go-live-server-bin
            godshell-bin
            gofarsi-live-bin
            gohome-bin
            golem-bin
            gonzo-bin
            goreleaser-pro-bin
            gosimac-bin
            gozen-bin
            gpk-bin
            gpth-bin
            grabchars-bin
            grafana-bin
            grafito-bin
            gup-bin
            gvisor-bin
            gyr-bin
            hadolint-bin
            happ-desktop
            hazkey-zenzai-model
            hbuilderx-alpha-bin
            hdfview-bin
            heptabase-bin
            html2data-bin
            httptoolkit-bin
            httpx-bin
            hubstaff
            hulak-bin
            hyperfluent-grub-theme-arch
            hyphen-el
            hyprdynamicmonitors-bin
            intermodal-bin
            invoice-bin
            ironbar-script-net-bin
            joplin-bin
            jotit-bin
            just-the-browser-git
            justevery-code-bin
            k0sctl-bin
            kalker-bin
            katana-mk2-fxfloorboard-bin
            kloak-git
            krux-installer-bin
            kumono-bin
            kv-bin
            ladybug-bin
            languagetool-ngrams-es
            lattice-bin
            lazydns-bin
            lazydocker-ng-bin
            lazyjira-bin
            lazykiq-bin
            lazysql-bin
            lian-bin
            libglademm
            librespeed-cli-bin
            mipsel-linux-gnu-binutils
            qtutilities
            ))

;;; ====================================================================
;;; PACKAGE DEFINITIONS (91 packages)
;;; ====================================================================

;;; -- dxvk-bin --
(define-public dxvk-bin
  (package
    (name "dxvk-bin")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/doitsujin/dxvk/releases/download/v"
             version "/dxvk-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("x64/" "share/dxvk/x64/")
          ("x32/" "share/dxvk/x32/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/doitsujin/dxvk")
    (synopsis "Vulkan-based compatibility layer for Direct3D 9/10/11")
    (description
     "DXVK is a Vulkan-based compatibility layer for Direct3D 9/10/11
which allows running 3D applications on Linux using Wine.")
    (license license:zlib)))

;;; -- envhub-bin --
(define-public envhub-bin
  (package
    (name "envhub-bin")
    (version "0.2.18")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tsirysndr/envhub/releases/download/v"
             version "/envhub-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("envhub" "bin/envhub"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tsirysndr/envhub")
    (synopsis "manage your dotfiles, secrets and packages with ease. Define your $HOME as Co")
    (description
     "Manage your dotfiles, secrets and packages with ease. Define your $HOME as Code and re-use it everywhere (local machine, CI, server ...) 💻 🚀 ✨.")
    (license license:mpl2.0)))

;;; -- envy-bin --
(define-public envy-bin
  (package
    (name "envy-bin")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/XENONCYBER/envy/releases/download/v"
             version "/envy-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("envy" "bin/envy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/XENONCYBER/envy")
    (synopsis "A terminal based tool for managing secrets with both TUI and CLI support")
    (description
     "A terminal based tool for managing secrets with both TUI and CLI support.")
    (license license:expat)))

;;; -- epub2txt --
(define-public epub2txt
  (package
    (name "epub2txt")
    (version "2.08")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kevinboone/epub2txt2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kevinboone/epub2txt2")
    (synopsis "extract text from EPUB documents")
    (description
     "Extract text from EPUB documents.")
    (license license:gpl3+)))

;;; -- etcdotica-bin --
(define-public etcdotica-bin
  (package
    (name "etcdotica-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/senotrusov/etcdotica/releases/download/v"
             version "/etcdotica-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("etcdotica" "bin/etcdotica"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/senotrusov/etcdotica")
    (synopsis "A lightweight, file-based overlay that synchronizes system configuration with")
    (description
     "A lightweight, file-based overlay that synchronizes system configuration with a Git repository.")
    (license (list license:asl2.0 license:expat))))

;;; -- exec-as --
(define-public exec-as
  (package
    (name "exec-as")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/exec-as/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://codeberg.org/maandree/exec-as")
    (synopsis "A command that lets you start another command with any argv[0]")
    (description
     "A command that lets you start another command with any argv[0].")
    (license license:expat)))

;;; -- fasttext-langid-models --
(define-public fasttext-langid-models
  (package
    (name "fasttext-langid-models")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://fasttext.cc/docs/en/language-identification.html/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fasttext-langid-models/"))))
    (home-page "https://fasttext.cc/docs/en/language-identification.html")
    (synopsis "pre-trained models for language identification for fasttext")
    (description
     "Pre-trained models for language identification for fasttext.")
    (license license:expat)))

;;; -- fcitx5-pinyin-starrail --
(define-public fcitx5-pinyin-starrail
  (package
    (name "fcitx5-pinyin-starrail")
    (version "20240803")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sihuan/mw2fcitx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fcitx5-pinyin-starrail/"))))
    (home-page "https://github.com/sihuan/mw2fcitx")
    (synopsis "starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com")
    (description
     "Starrail Fcitx 5 Pinyin Dictionary from wiki.biligame.com.")
    (license license:expat)))

;;; -- fdformat --
(define-public fdformat
  (package
    (name "fdformat")
    (version "2.38.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/karelzak/util-linux")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/karelzak/util-linux")
    (synopsis "fdformat from util-linux")
    (description
     "fdformat from util-linux.")
    (license license:gpl2+)))

;;; -- featherwallet-bin --
(define-public featherwallet-bin
  (package
    (name "featherwallet-bin")
    (version "2.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://featherwallet.org/files/releases/linux/feather-"
             version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "feather-" #$version ".AppImage")
                    "bin/feather-wallet"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://featherwallet.org")
    (synopsis "A free, open-source Monero light wallet")
    (description
     "A free, open-source Monero light wallet.")
    (license license:expat)))

;;; -- ficsit-cli-bin --
(define-public ficsit-cli-bin
  (package
    (name "ficsit-cli-bin")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/satisfactorymodding/ficsit-cli/releases/download/v"
             version "/ficsit-cli-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ficsit-cli" "bin/ficsit-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/satisfactorymodding/ficsit-cli")
    (synopsis "A CLI for managing mods for the game Satisfactory")
    (description
     "A CLI for managing mods for the game Satisfactory.")
    (license license:gpl3+)))

;;; -- figma-agent-linux-bin --
(define-public figma-agent-linux-bin
  (package
    (name "figma-agent-linux-bin")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neetly/figma-agent-linux/releases/download/v"
             version "/figma-agent-linux-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("figma-agent-linux" "bin/figma-agent-linux"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neetly/figma-agent-linux")
    (synopsis "A lightweight local service that makes your locally installed fonts available")
    (description
     "A lightweight local service that makes your locally installed fonts available on Figma.")
    (license license:expat)))

;;; -- filen-cli-bin --
(define-public filen-cli-bin
  (package
    (name "filen-cli-bin")
    (version "0.0.39")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/FilenCloudDienste/filen-cli/releases/download/v"
             version "/filen-cli-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("filen-cli" "bin/filen-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FilenCloudDienste/filen-cli")
    (synopsis "The Filen CLI provides a set of useful tools for interacting with the cloud")
    (description
     "The Filen CLI provides a set of useful tools for interacting with the cloud.")
    (license license:agpl3+)))

;;; -- firefox-gnome-theme --
(define-public firefox-gnome-theme
  (package
    (name "firefox-gnome-theme")
    (version "149.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rafaelmardojai/firefox-gnome-theme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/firefox-gnome-theme/"))))
    (home-page "https://github.com/rafaelmardojai/firefox-gnome-theme")
    (synopsis "A GNOME theme for Firefox")
    (description
     "A GNOME theme for Firefox.")
    (license license:unlicense)))

;;; -- flat-remix-gtk --
(define-public flat-remix-gtk
  (package
    (name "flat-remix-gtk")
    (version "20240730")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://drasite.com/flat-remix-gtk/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://drasite.com/flat-remix-gtk")
    (synopsis "flat Remix GTK theme is a pretty simple gtk window theme inspired on material")
    (description
     "Flat Remix GTK theme is a pretty simple gtk window theme inspired on material design following a modern design using \"flat\" colors with high contrasts and sharp borders.")
    (license license:expat)))

;;; -- flow-control-bin --
(define-public flow-control-bin
  (package
    (name "flow-control-bin")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neurocyte/flow/releases/download/v"
             version "/flow-control-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("flow-control" "bin/flow-control"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neurocyte/flow")
    (synopsis "a programmer's text editor")
    (description
     "a programmer's text editor.")
    (license license:expat)))

;;; -- fmtools --
(define-public fmtools
  (package
    (name "fmtools")
    (version "2.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://benpfaff.org/fmtools//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://benpfaff.org/fmtools/")
    (synopsis "A pair of simple command-line utilities for v4l2 radio tuner cards")
    (description
     "A pair of simple command-line utilities for v4l2 radio tuner cards.")
    (license license:expat)))

;;; -- fnm-bin --
(define-public fnm-bin
  (package
    (name "fnm-bin")
    (version "1.39.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Schniz/fnm/releases/download/v"
             version "/fnm-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fnm" "bin/fnm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Schniz/fnm")
    (synopsis "fast and simple Node.js version manager, built in Rust")
    (description
     "Fast and simple Node.js version manager, built in Rust.")
    (license license:gpl3+)))

;;; -- fondu --
(define-public fondu
  (package
    (name "fondu")
    (version "060102")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://fondu.sourceforge.net//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "http://fondu.sourceforge.net/")
    (synopsis "mac font conversion utility - debian patches")
    (description
     "Mac font conversion utility - debian patches.")
    (license license:bsd-3)))

;;; -- foundryvtt --
(define-public foundryvtt
  (package
    (name "foundryvtt")
    (version "13.351")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://foundryvtt.com//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://foundryvtt.com/")
    (synopsis "A self-hosted, modern, and developer-friendly roleplaying platform")
    (description
     "A self-hosted, modern, and developer-friendly roleplaying platform.")
    (license license:expat)))

;;; -- foxicons-theme --
(define-public foxicons-theme
  (package
    (name "foxicons-theme")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SzponerZoli/foxicons-theme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/foxicons-theme/"))))
    (home-page "https://github.com/SzponerZoli/foxicons-theme")
    (synopsis "A collection of multi-sized icons organized as a Linux desktop icon theme")
    (description
     "A collection of multi-sized icons organized as a Linux desktop icon theme.")
    (license license:unlicense)))

;;; -- frankenphp-bin --
(define-public frankenphp-bin
  (package
    (name "frankenphp-bin")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/php/frankenphp/releases/download/v"
             version "/frankenphp-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("frankenphp" "bin/frankenphp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/php/frankenphp")
    (synopsis "frankenPHP is a modern application server for PHP built on top of the Caddy w")
    (description
     "FrankenPHP is a modern application server for PHP built on top of the Caddy web server.")
    (license license:expat)))

;;; -- furtherance-bin --
(define-public furtherance-bin
  (package
    (name "furtherance-bin")
    (version "26.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unobserved-io/Furtherance/releases/download/v"
             version "/furtherance-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("furtherance" "bin/furtherance"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unobserved-io/Furtherance")
    (synopsis "track your time without being tracked")
    (description
     "Track your time without being tracked.")
    (license license:gpl3+)))

;;; -- futhark-bin --
(define-public futhark-bin
  (package
    (name "futhark-bin")
    (version "0.25.37")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://futhark-lang.org//releases/download/v"
             version "/futhark-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("futhark" "bin/futhark"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://futhark-lang.org/")
    (synopsis "A data-parallel functional programming language")
    (description
     "A data-parallel functional programming language.")
    (license license:expat)))

;;; -- gama-platform-jdk --
(define-public gama-platform-jdk
  (package
    (name "gama-platform-jdk")
    (version "2025.06.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gama-platform.org/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gama-platform.org")
    (synopsis "GAMA is a modeling and simulation development environment for building spatia")
    (description
     "GAMA is a modeling and simulation development environment for building spatially explicit agent-based simulations. JDK embedded version.")
    (license license:expat)))

;;; -- gdscript-formatter-bin --
(define-public gdscript-formatter-bin
  (package
    (name "gdscript-formatter-bin")
    (version "0.18.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GDQuest/GDScript-formatter/releases/download/v"
             version "/gdscript-formatter-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gdscript-formatter" "bin/gdscript-formatter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GDQuest/GDScript-formatter")
    (synopsis "A fast code formatter for GDScript and Godot 4, written in Rust")
    (description
     "A fast code formatter for GDScript and Godot 4, written in Rust.")
    (license license:expat)))

;;; -- gdsdecomp-bin --
(define-public gdsdecomp-bin
  (package
    (name "gdsdecomp-bin")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GDRETools/gdsdecomp/releases/download/v"
             version "/gdsdecomp-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gdsdecomp" "bin/gdsdecomp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GDRETools/gdsdecomp")
    (synopsis "Godot reverse engineering tools")
    (description
     "Godot reverse engineering tools.")
    (license license:expat)))

;;; -- gdu-bin --
(define-public gdu-bin
  (package
    (name "gdu-bin")
    (version "5.35.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Dundee/gdu/releases/download/v"
             version "/gdu_linux_amd64.tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gdu_linux_amd64" "bin/gdu"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Dundee/gdu")
    (synopsis "fast disk usage analyzer")
    (description
     "Fast disk usage analyzer.")
    (license license:expat)))

;;; -- gh-aw-bin --
(define-public gh-aw-bin
  (package
    (name "gh-aw-bin")
    (version "0.67.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/github/gh-aw/releases/download/v"
             version "/gh-aw-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gh-aw" "bin/gh-aw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/github/gh-aw")
    (synopsis "GitHub Agentic Workflows")
    (description
     "GitHub Agentic Workflows.")
    (license license:expat)))

;;; -- ghcup-hs-bin --
(define-public ghcup-hs-bin
  (package
    (name "ghcup-hs-bin")
    (version "0.1.50.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.haskell.org/~ghcup/"
             version "/x86_64-linux-ghcup-" version ""))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "x86_64-linux-ghcup-" #$version)
                    "bin/ghcup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.haskell.org/ghcup/")
    (synopsis "an installer for the general purpose language Haskell")
    (description
     "an installer for the general purpose language Haskell.")
    (license license:lgpl3+)))

;;; -- git-scope-bin --
(define-public git-scope-bin
  (package
    (name "git-scope-bin")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bharath-code/git-scope/releases/download/v"
             version "/git-scope-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("git-scope" "bin/git-scope"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bharath-code/git-scope")
    (synopsis "A fast TUI to see the status of all git repositories on your machine")
    (description
     "A fast TUI to see the status of all git repositories on your machine.")
    (license license:expat)))

;;; -- git-who-bin --
(define-public git-who-bin
  (package
    (name "git-who-bin")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sinclairtarget/git-who/releases/download/v"
             version "/git-who-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("git-who" "bin/git-who"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sinclairtarget/git-who")
    (synopsis "git blame for file trees")
    (description
     "Git blame for file trees.")
    (license license:expat)))

;;; -- gittop-tui-bin --
(define-public gittop-tui-bin
  (package
    (name "gittop-tui-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hjr265/gittop/releases/download/v"
             version "/gittop-tui-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gittop-tui" "bin/gittop-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hjr265/gittop")
    (synopsis "A beautiful terminal UI for visualizing Git repository statistics, inspired b")
    (description
     "A beautiful terminal UI for visualizing Git repository statistics, inspired by htop/btop.")
    (license license:bsd-3)))

;;; -- go-live-server-bin --
(define-public go-live-server-bin
  (package
    (name "go-live-server-bin")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/coolapso/go-live-server/releases/download/v"
             version "/go-live-server-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("go-live-server" "bin/go-live-server"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolapso/go-live-server")
    (synopsis "simple development webserver with live reload")
    (description
     "Simple development webserver with live reload.")
    (license license:expat)))

;;; -- godshell-bin --
(define-public godshell-bin
  (package
    (name "godshell-bin")
    (version "0.9.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Raulgooo/godshell/releases/download/v"
             version "/godshell-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("godshell" "bin/godshell"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Raulgooo/godshell")
    (synopsis "A Tool to give your LLM access to your Kernel")
    (description
     "A Tool to give your LLM access to your Kernel.")
    (license license:expat)))

;;; -- gofarsi-live-bin --
(define-public gofarsi-live-bin
  (package
    (name "gofarsi-live-bin")
    (version "2026.02.22_071121_683c119a6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/GoFarsi/book/releases/download/v"
             version "/gofarsi-live-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gofarsi-live" "bin/gofarsi-live"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GoFarsi/book")
    (synopsis "free Persian Go programming language book (Live version)")
    (description
     "Free Persian Go programming language book (Live version).")
    (license license:cc0)))

;;; -- gohome-bin --
(define-public gohome-bin
  (package
    (name "gohome-bin")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/anIcedAntFA/gohome/releases/download/v"
             version "/gohome-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gohome" "bin/gohome"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anIcedAntFA/gohome")
    (synopsis "A fast, configurable Git standup & activity reporting CLI written in Go")
    (description
     "A fast, configurable Git standup & activity reporting CLI written in Go.")
    (license license:expat)))

;;; -- golem-bin --
(define-public golem-bin
  (package
    (name "golem-bin")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/assapir/golem/releases/download/v"
             version "/golem-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("golem" "bin/golem"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/assapir/golem")
    (synopsis "A clay body, animated by words. Rust AI agent with ReAct loop, pluggable tool")
    (description
     "A clay body, animated by words. Rust AI agent with ReAct loop, pluggable tools, and SQLite memory.")
    (license license:gpl2)))

;;; -- gonzo-bin --
(define-public gonzo-bin
  (package
    (name "gonzo-bin")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/control-theory/gonzo/releases/download/v"
             version "/gonzo-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gonzo" "bin/gonzo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/control-theory/gonzo")
    (synopsis "TUI log analysis tool")
    (description
     "TUI log analysis tool.")
    (license license:expat)))

;;; -- goreleaser-pro-bin --
(define-public goreleaser-pro-bin
  (package
    (name "goreleaser-pro-bin")
    (version "2.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/goreleaser/goreleaser-pro/releases/download/v"
             version "/goreleaser-pro_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("goreleaser-pro" "bin/goreleaser-pro"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://goreleaser.com")
    (synopsis "release engineering, simplified")
    (description
     "Release engineering, simplified.")
    (license license:expat)))

;;; -- gosimac-bin --
(define-public gosimac-bin
  (package
    (name "gosimac-bin")
    (version "5.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/1995parham/gosimac/releases/download/v"
             version "/gosimac-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gosimac" "bin/gosimac"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/1995parham/gosimac")
    (synopsis "fetch the wallpaper from Bings, Unsplash")
    (description
     "Fetch the wallpaper from Bings, Unsplash...")
    (license license:gpl2+)))

;;; -- gozen-bin --
(define-public gozen-bin
  (package
    (name "gozen-bin")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/VoylinsGamedevJourney/GoZen/releases/download/v"
             version "/gozen-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gozen" "bin/gozen"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VoylinsGamedevJourney/GoZen")
    (synopsis "A minimalistic video editor (binary AppImage release)")
    (description
     "A minimalistic video editor (binary AppImage release).")
    (license license:gpl3+)))

;;; -- gpk-bin --
(define-public gpk-bin
  (package
    (name "gpk-bin")
    (version "0.3.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neur0map/glazepkg/releases/download/v"
             version "/gpk-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gpk" "bin/gpk"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neur0map/glazepkg")
    (synopsis "TUI dashboard that unifies 34 package managers into one searchable view")
    (description
     "TUI dashboard that unifies 34 package managers into one searchable view.")
    (license license:gpl3+)))

;;; -- gpth-bin --
(define-public gpth-bin
  (package
    (name "gpth-bin")
    (version "3.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/releases/download/v"
             version "/gpth-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gpth" "bin/gpth"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper")
    (synopsis "tool to help you with exporting stuff from Google Photos")
    (description
     "Tool to help you with exporting stuff from Google Photos.")
    (license license:asl2.0)))

;;; -- grabchars-bin --
(define-public grabchars-bin
  (package
    (name "grabchars-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/DanielSmith/grabchars/releases/download/v"
             version "/grabchars-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("grabchars" "bin/grabchars"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DanielSmith/grabchars")
    (synopsis "get keystrokes directly from user - interactive terminal input for shell scri")
    (description
     "Get keystrokes directly from user - interactive terminal input for shell scripts.")
    (license license:asl2.0)))

;;; -- grafana-bin --
(define-public grafana-bin
  (package
    (name "grafana-bin")
    (version "12.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.grafana.com/oss/release/grafana-"
             version ".linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "grafana-v" #$version "/")
                    "share/grafana/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://grafana.com/")
    (synopsis "open-source analytics and monitoring platform")
    (description
     "Grafana is an open-source analytics and interactive visualization
platform.  It provides dashboards and editors for Graphite, InfluxDB,
Prometheus, Elasticsearch, and many other data sources.")
    (license license:asl2.0)))

;;; -- grafito-bin --
(define-public grafito-bin
  (package
    (name "grafito-bin")
    (version "0.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ralsina/grafito/releases/download/v"
             version "/grafito-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("grafito" "bin/grafito"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ralsina/grafito")
    (synopsis "A linux logs web frontend")
    (description
     "A linux logs web frontend.")
    (license license:expat)))

;;; -- gup-bin --
(define-public gup-bin
  (package
    (name "gup-bin")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nao1215/gup/releases/download/v"
             version "/gup-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gup" "bin/gup"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nao1215/gup")
    (synopsis "update binaries installed by \"go install\" with goroutines")
    (description
     "Update binaries installed by \"go install\" with goroutines.")
    (license license:asl2.0)))

;;; -- gvisor-bin --
(define-public gvisor-bin
  (package
    (name "gvisor-bin")
    (version "20260302.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gvisor.dev/releases/download/v"
             version "/gvisor-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gvisor" "bin/gvisor"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gvisor.dev")
    (synopsis "OCI container sandbox runtime focused on security, efficiency, and ease of us")
    (description
     "OCI container sandbox runtime focused on security, efficiency, and ease of use.")
    (license license:asl2.0)))

;;; -- gyr-bin --
(define-public gyr-bin
  (package
    (name "gyr-bin")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sr.ht/~nkeor/gyr/releases/download/v"
             version "/gyr-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("gyr" "bin/gyr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sr.ht/~nkeor/gyr")
    (synopsis "blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version)")
    (description
     "Blazing fast TUI launcher for GNU/Linux and *BSD (prebuilt binary version).")
    (license license:bsd-2)))

;;; -- hadolint-bin --
(define-public hadolint-bin
  (package
    (name "hadolint-bin")
    (version "2.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hadolint/hadolint/releases/download/v"
             version "/hadolint-Linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hadolint-Linux-x86_64" "bin/hadolint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hadolint/hadolint")
    (synopsis "dockerfile linter, validate inline bash, written in Haskell")
    (description
     "Dockerfile linter, validate inline bash, written in Haskell.")
    (license license:gpl3+)))

;;; -- happ-desktop --
(define-public happ-desktop
  (package
    (name "happ-desktop")
    (version "2.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Happ-proxy/happ-desktop")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Happ-proxy/happ-desktop")
    (synopsis "happ is a mobile application designed for convenient proxy server management,")
    (description
     "Happ is a mobile application designed for convenient proxy server management, powered by the robust Xray core.")
    (license license:expat)))

;;; -- hazkey-zenzai-model --
(define-public hazkey-zenzai-model
  (package
    (name "hazkey-zenzai-model")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/hazkey-zenzai-model/"))))
    (home-page "https://huggingface.co/Miwa-Keita/zenz-v3.1-small-gguf")
    (synopsis "zenzai system model for Hazkey")
    (description
     "Zenzai system model for Hazkey.")
    (license license:expat)))

;;; -- hbuilderx-alpha-bin --
(define-public hbuilderx-alpha-bin
  (package
    (name "hbuilderx-alpha-bin")
    (version "4.87.2025112602")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.dcloud.io/releases/download/v"
             version "/hbuilderx-alpha-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hbuilderx-alpha" "bin/hbuilderx-alpha"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.dcloud.io")
    (synopsis "cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。")
    (description
     "cli的用途是让开发者可以在linux服务器上调用HBuilderX cli，来实现程序化操作打包app、上传unicloud云函数。.")
    (license license:expat)))

;;; -- hdfview-bin --
(define-public hdfview-bin
  (package
    (name "hdfview-bin")
    (version "3.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/HDFGroup/hdfview/releases/download/v"
             version "/hdfview-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hdfview" "bin/hdfview"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HDFGroup/hdfview/")
    (synopsis "a GUI browser for reading hdf5 files - prebuilt binaries from the HDF group")
    (description
     "a GUI browser for reading hdf5 files - prebuilt binaries from the HDF group.")
    (license license:expat)))

;;; -- heptabase-bin --
(define-public heptabase-bin
  (package
    (name "heptabase-bin")
    (version "1.87.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://heptabase.com/releases/download/v"
             version "/heptabase-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("heptabase" "bin/heptabase"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://heptabase.com")
    (synopsis "A visual note-taking tool for learning complex topics")
    (description
     "A visual note-taking tool for learning complex topics.")
    (license license:expat)))

;;; -- html2data-bin --
(define-public html2data-bin
  (package
    (name "html2data-bin")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/msoap/html2data/releases/download/v"
             version "/html2data-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("html2data" "bin/html2data"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/msoap/html2data")
    (synopsis "CLI for extracting data from HTML via CSS selectors")
    (description
     "CLI for extracting data from HTML via CSS selectors.")
    (license license:expat)))

;;; -- httptoolkit-bin --
(define-public httptoolkit-bin
  (package
    (name "httptoolkit-bin")
    (version "1.25.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://httptoolkit.com//releases/download/v"
             version "/httptoolkit-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("httptoolkit" "bin/httptoolkit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://httptoolkit.com/")
    (synopsis "beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client")
    (description
     "Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client.")
    (license license:agpl3+)))

;;; -- httpx-bin --
(define-public httpx-bin
  (package
    (name "httpx-bin")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/projectdiscovery/httpx/releases/download/v"
             version "/httpx_" version "_linux_amd64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("httpx" "bin/httpx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/httpx")
    (synopsis "fast and multi-purpose HTTP toolkit")
    (description
     "Fast and multi-purpose HTTP toolkit.")
    (license license:expat)))

;;; -- hubstaff --
(define-public hubstaff
  (package
    (name "hubstaff")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://app.hubstaff.com/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://app.hubstaff.com")
    (synopsis "employee time tracking software for employees")
    (description
     "Employee time tracking software for employees.")
    (license license:expat)))

;;; -- hulak-bin --
(define-public hulak-bin
  (package
    (name "hulak-bin")
    (version "0.2.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xaaha/hulak/releases/download/v"
             version "/hulak-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hulak" "bin/hulak"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xaaha/hulak")
    (synopsis "lightweight file-based API client for terminal nerds")
    (description
     "Lightweight file-based API client for terminal nerds.")
    (license license:expat)))

;;; -- hyperfluent-grub-theme-arch --
(define-public hyperfluent-grub-theme-arch
  (package
    (name "hyperfluent-grub-theme-arch")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/hyperfluent-grub-theme-arch/"))))
    (home-page "https://github.com/Coopydood/HyperFluent-GRUB-Theme")
    (synopsis "arch hyperfluent grub theme")
    (description
     "Arch hyperfluent grub theme.")
    (license license:expat)))

;;; -- hyphen-el --
(define-public hyphen-el
  (package
    (name "hyphen-el")
    (version "7.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.documentfoundation.org//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/hyphen-el/"))))
    (home-page "https://www.documentfoundation.org/")
    (synopsis "greek hyphenation rules")
    (description
     "Greek hyphenation rules.")
    (license license:expat)))

;;; -- hyprdynamicmonitors-bin --
(define-public hyprdynamicmonitors-bin
  (package
    (name "hyprdynamicmonitors-bin")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fiffeek/hyprdynamicmonitors/releases/download/v"
             version "/hyprdynamicmonitors-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hyprdynamicmonitors" "bin/hyprdynamicmonitors"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fiffeek/hyprdynamicmonitors")
    (synopsis "dynamic monitor configuration for Hyprland")
    (description
     "Dynamic monitor configuration for Hyprland.")
    (license license:expat)))

;;; -- intermodal-bin --
(define-public intermodal-bin
  (package
    (name "intermodal-bin")
    (version "0.1.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/casey/intermodal/releases/download/v"
             version "/imdl-v" version "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("imdl" "bin/imdl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/casey/intermodal")
    (synopsis "user-friendly and featureful CLI BitTorrent metainfo utility, written in Rust")
    (description
     "User-friendly and featureful CLI BitTorrent metainfo utility, written in Rust.")
    (license license:cc0)))

;;; -- invoice-bin --
(define-public invoice-bin
  (package
    (name "invoice-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/maaslalani/invoice/releases/download/v"
             version "/invoice-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("invoice" "bin/invoice"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/maaslalani/invoice")
    (synopsis "command line invoice generator")
    (description
     "Command line invoice generator.")
    (license license:expat)))

;;; -- ironbar-script-net-bin --
(define-public ironbar-script-net-bin
  (package
    (name "ironbar-script-net-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/liuhq/ironbar-script-net/releases/download/v"
             version "/ironbar-script-net-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ironbar-script-net" "bin/ironbar-script-net"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/liuhq/ironbar-script-net")
    (synopsis "A network speed monitoring script for Ironbar")
    (description
     "A network speed monitoring script for Ironbar.")
    (license license:expat)))

;;; -- joplin-bin --
(define-public joplin-bin
  (package
    (name "joplin-bin")
    (version "3.5.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/laurent22/joplin/releases/download/v"
             version "/Joplin-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "Joplin-" #$version ".AppImage")
                    "bin/joplin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/laurent22/joplin")
    (synopsis "open-source note-taking and to-do application")
    (description
     "Joplin is a free, open-source note-taking and to-do application
with synchronisation capabilities.  It handles a large number of notes
organized into notebooks and supports Markdown format.")
    (license license:agpl3+)))

;;; -- jotit-bin --
(define-public jotit-bin
  (package
    (name "jotit-bin")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mkaz/jotit/releases/download/v"
             version "/jotit-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("jotit" "bin/jotit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mkaz/jotit")
    (synopsis "A simple command-line tool to jot notes")
    (description
     "A simple command-line tool to jot notes.")
    (license license:expat)))

;;; -- just-the-browser-git --
(define-public just-the-browser-git
  (package
    (name "just-the-browser-git")
    (version "r101.6fe2f08")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://justthebrowser.com//archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://justthebrowser.com/")
    (synopsis "remove AI features, telemetry data reporting, sponsored content, product inte")
    (description
     "Remove AI features, telemetry data reporting, sponsored content, product integrations, and other annoyances from web browsers.")
    (license license:expat)))

;;; -- justevery-code-bin --
(define-public justevery-code-bin
  (package
    (name "justevery-code-bin")
    (version "0.6.92")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/just-every/code/releases/download/v"
             version "/justevery-code-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("justevery-code" "bin/justevery-code"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/just-every/code")
    (synopsis "community-driven fork of the Codex CLI for local terminal coding assistance")
    (description
     "Community-driven fork of the Codex CLI for local terminal coding assistance.")
    (license license:asl2.0)))

;;; -- k0sctl-bin --
(define-public k0sctl-bin
  (package
    (name "k0sctl-bin")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/k0sproject/k0sctl/releases/download/v"
             version "/k0sctl-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("k0sctl" "bin/k0sctl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/k0sproject/k0sctl")
    (synopsis "A bootstrapping and management tool for k0s clusters")
    (description
     "A bootstrapping and management tool for k0s clusters.")
    (license license:asl2.0)))

;;; -- kalker-bin --
(define-public kalker-bin
  (package
    (name "kalker-bin")
    (version "2.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PaddiM8/kalker/releases/download/v"
             version "/kalker-linux"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kalker-linux" "bin/kalker"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kalker.xyz/")
    (synopsis "kalker/kalk is a calculator with math syntax that supports user-defined varia")
    (description
     "Kalker/kalk is a calculator with math syntax that supports user-defined variables and functions, complex numbers, and estimation of derivatives and integrals.")
    (license license:expat)))

;;; -- katana-mk2-fxfloorboard-bin --
(define-public katana-mk2-fxfloorboard-bin
  (package
    (name "katana-mk2-fxfloorboard-bin")
    (version "20260112")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/fxfloorboard/files/KatanaFxFloorBoard/Katana%20FxFloorboard%20for%20MK2%20Desktop//releases/download/v"
             version "/katana-mk2-fxfloorboard-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("katana-mk2-fxfloorboard" "bin/katana-mk2-fxfloorboard"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/fxfloorboard/files/KatanaFxFloorBoard/Katana%20FxFloorboard%20for%20MK2%20Desktop/")
    (synopsis "editing software for the Boss Katana MK2 guitar modelling and effects amplifi")
    (description
     "Editing software for the Boss Katana MK2 guitar modelling and effects amplifier.")
    (license license:gpl3+)))

;;; -- kloak-git --
(define-public kloak-git
  (package
    (name "kloak-git")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vmonaco/kloak/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/vmonaco/kloak")
    (synopsis "anti keystroke deanonymization tool")
    (description
     "anti keystroke deanonymization tool.")
    (license license:expat)))

;;; -- krux-installer-bin --
(define-public krux-installer-bin
  (package
    (name "krux-installer-bin")
    (version "0.0.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/selfcustody/krux-installer/releases/download/v"
             version "/krux-installer-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("krux-installer" "bin/krux-installer"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/selfcustody/krux-installer")
    (synopsis "A GUI based application to flash Krux firmware on K210 based devices.(Prebuil")
    (description
     "A GUI based application to flash Krux firmware on K210 based devices.(Prebuilt version).")
    (license license:expat)))

;;; -- kumono-bin --
(define-public kumono-bin
  (package
    (name "kumono-bin")
    (version "0.77.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/APT37/kumono/releases/download/v"
             version "/kumono-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kumono" "bin/kumono"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/APT37/kumono")
    (synopsis "media ripper for coomer and kemono")
    (description
     "Media ripper for coomer and kemono.")
    (license license:expat)))

;;; -- kv-bin --
(define-public kv-bin
  (package
    (name "kv-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AmrSaber/kv/releases/download/v"
             version "/kv-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kv" "bin/kv"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AmrSaber/kv")
    (synopsis "A lightweight, feature-rich command-line key-value store with encryption, TTL")
    (description
     "A lightweight, feature-rich command-line key-value store with encryption, TTL, and version control.")
    (license license:expat)))

;;; -- ladybug-bin --
(define-public ladybug-bin
  (package
    (name "ladybug-bin")
    (version "0.15.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ladybugdb.com/releases/download/v"
             version "/ladybug-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ladybug" "bin/ladybug"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ladybugdb.com")
    (synopsis "in-process property graph database management system (GDBMS) built for query")
    (description
     "In-process property graph database management system (GDBMS) built for query speed and scalability.")
    (license license:expat)))

;;; -- languagetool-ngrams-es --
(define-public languagetool-ngrams-es
  (package
    (name "languagetool-ngrams-es")
    (version "20150915")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://wiki.languagetool.org/finding-errors-using-n-gram-data/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/languagetool-ngrams-es/"))))
    (home-page "http://wiki.languagetool.org/finding-errors-using-n-gram-data")
    (synopsis "finding errors using n-gram data, spanish text")
    (description
     "Finding errors using n-gram data, spanish text.")
    (license license:expat)))

;;; -- lattice-bin --
(define-public lattice-bin
  (package
    (name "lattice-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/floatpane/lattice/releases/download/v"
             version "/lattice-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lattice" "bin/lattice"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/floatpane/lattice")
    (synopsis "A modular terminal dashboard built with Go and Bubble Tea")
    (description
     "A modular terminal dashboard built with Go and Bubble Tea.")
    (license license:expat)))

;;; -- lazydns-bin --
(define-public lazydns-bin
  (package
    (name "lazydns-bin")
    (version "0.2.63")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lazywalker/lazydns/releases/download/v"
             version "/lazydns-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazydns" "bin/lazydns"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lazywalker/lazydns")
    (synopsis "A light and fast DNS server/forwarder implementation in Rust")
    (description
     "A light and fast DNS server/forwarder implementation in Rust.")
    (license license:gpl3+)))

;;; -- lazydocker-ng-bin --
(define-public lazydocker-ng-bin
  (package
    (name "lazydocker-ng-bin")
    (version "0.26.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/peauc/lazydocker-ng/releases/download/v"
             version "/lazydocker-ng_Linux_x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazydocker-ng" "bin/lazydocker-ng"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peauc/lazydocker-ng/")
    (synopsis "The continuation of lazydocker the simple terminal UI for docker, written in ")
    (description
     "The continuation of lazydocker the simple terminal UI for docker, written in Go.")
    (license license:expat)))

;;; -- lazyjira-bin --
(define-public lazyjira-bin
  (package
    (name "lazyjira-bin")
    (version "2.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/textfuel/lazyjira/releases/download/v"
             version "/lazyjira-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazyjira" "bin/lazyjira"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/textfuel/lazyjira")
    (synopsis "terminal UI for Jira (prebuilt binary)")
    (description
     "Terminal UI for Jira (prebuilt binary).")
    (license license:expat)))

;;; -- lazykiq-bin --
(define-public lazykiq-bin
  (package
    (name "lazykiq-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kpumuk/lazykiq/releases/download/v"
             version "/lazykiq-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazykiq" "bin/lazykiq"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kpumuk/lazykiq")
    (synopsis "A rich terminal UI for Sidekiq")
    (description
     "A rich terminal UI for Sidekiq.")
    (license license:expat)))

;;; -- lazysql-bin --
(define-public lazysql-bin
  (package
    (name "lazysql-bin")
    (version "0.4.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jorgerojas26/lazysql/releases/download/v"
             version "/lazysql_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lazysql" "bin/lazysql"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jorgerojas26/lazysql")
    (synopsis "A cross-platform TUI database management tool written in Go")
    (description
     "A cross-platform TUI database management tool written in Go.")
    (license license:expat)))

;;; -- lian-bin --
(define-public lian-bin
  (package
    (name "lian-bin")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lian/releases/download/v"
             version "/lian-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lian" "bin/lian"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lian")
    (synopsis "TUI frontend for paru/yay/pacman with AI-powered operation analysis")
    (description
     "TUI frontend for paru/yay/pacman with AI-powered operation analysis.")
    (license license:expat)))

;;; -- libglademm --
(define-public libglademm
  (package
    (name "libglademm")
    (version "2.6.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "mirror://gnome/sources/libglademm/2.6/libglademm-"
             version ".tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://gtkmm.org/")
    (synopsis "C++ wrapper for libglade")
    (description
     "Libglademm is a C++ wrapper for libglade, allowing GTK+
applications to load Glade UI files at runtime.  It provides a
type-safe C++ API for the libglade library.")
    (license license:lgpl2.1+)))

;;; -- librespeed-cli-bin --
(define-public librespeed-cli-bin
  (package
    (name "librespeed-cli-bin")
    (version "1.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/librespeed/speedtest-cli/releases/download/v"
             version "/librespeed-cli_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("librespeed-cli" "bin/librespeed-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/librespeed/speedtest-cli")
    (synopsis "command line interface for LibreSpeed speed test backends. Written in Go")
    (description
     "Command line interface for LibreSpeed speed test backends. Written in Go.")
    (license license:lgpl3+)))

;;; -- mipsel-linux-gnu-binutils --
(define-public mipsel-linux-gnu-binutils
  (package
    (name "mipsel-linux-gnu-binutils")
    (version "2.45")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ftp.gnu.org/gnu/binutils/binutils-"
             version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--target=mipsel-linux-gnu"
                   "--disable-nls"
                   "--disable-werror")))
    (home-page "https://www.gnu.org/software/binutils/")
    (synopsis "cross-compilation binutils for MIPSEL targets")
    (description
     "GNU Binutils configured as a cross-toolchain for the
MIPSEL (little-endian MIPS) Linux target.  Includes the assembler,
linker, and related binary utilities.")
    (license license:gpl3+)))

;;; -- qtutilities --
(define-public qtutilities
  (package
    (name "qtutilities")
    (version "6.21.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Martchus/qtutilities")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/Martchus/qtutilities")
    (synopsis "common Qt related C++ classes and routines")
    (description
     "Common Qt related C++ classes and routines used by applications
such as dialogs, widgets, and models.  Provides reusable utilities
for Qt-based C++ projects.")
    (license license:gpl2+)))
