;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417z
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (23):
;;;    1. suru-plus-icons (copy, v30.0, GPL-3.0)
;;;    2. fcitx5-material-color (copy, v0.2.1, Apache-2.0)
;;;    3. bullet-train-zsh-theme (copy, v0.0.5, MIT)
;;;    4. vim-pkgbuild (copy, git 2469a0a9, MIT)
;;;    5. reshade-steam-proton (copy, git 55d4a681, GPL-2.0)
;;;    6. zenity-rs-bin (copy/binary, v0.2.6, MIT)
;;;    7. saul-bin (copy/binary, v0.3.4, MIT)
;;;    8. akeyshually-bin (copy/binary, v0.3.2, MIT)
;;;    9. wayvr-bin (copy/binary, v26.2.1, GPL-3.0)
;;;   10. ocr4linux (copy, v1.5.0, MIT)
;;;   11. flipclock (meson, v2.10.0, Apache-2.0)
;;;   12. python-pkb-client (python, v2.3.1, MIT)
;;;   13. xbindkeys-config-gtk2 (gnu, v0.1.4, GPL-2.0)
;;;   14. scnlib (cmake, v4.0.1, Apache-2.0)
;;;   15. grub-reboot-picker (pyproject, v0.0.11, MIT)
;;;   16. xdg-launch (gnu, v1.12, GPL-3.0)
;;;   17. freetuxtv (gnu, v0.6.8, GPL-3.0)
;;;   18. pidgin-extprefs (gnu, v0.7, GPL-2.0)
;;;   19. clang-include-graph (cmake, v0.2.0, Apache-2.0)
;;;   20. barrier-headless (cmake, v2.4.0, GPL-2.0)
;;;   21. thonny (python, v4.1.7, MIT)
;;;   22. materia-theme (meson, v20210322, GPL-2.0)
;;;   23. coomer (gnu, v1.2.1, MIT)
;;;
;;; Blocked (7):
;;;   24. oh-my-zsh-powerline-theme-git — BLOCKED: NO_LICENSE (archived, no license)
;;;   25. vim-systemd — BLOCKED: NO_LICENSE (no license file)
;;;   26. rustle-bin — BLOCKED: SOURCE_UNAVAILABLE (repo deleted/404)
;;;   27. hyde — BLOCKED: COMPLEX_DEPS (30+ Hyprland ecosystem deps)
;;;   28. mystiq — BLOCKED: QMAKE_UNSUPPORTED (Qt5 qmake not in Guix)
;;;   29. seadrive-cli — BLOCKED: MISSING_DEP (needs libsearpc not in Guix)
;;;   30. cinnamon-artwork — BLOCKED: COMPLEX_DEPS (pysassc + mint icon deps)
;;;
;;; 23 recipes + 7 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417z)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages web)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            suru-plus-icons
            fcitx5-material-color
            bullet-train-zsh-theme
            vim-pkgbuild
            reshade-steam-proton
            zenity-rs-bin
            saul-bin
            akeyshually-bin
            wayvr-bin
            ocr4linux
            flipclock
            python-pkb-client
            xbindkeys-config-gtk2
            scnlib
            grub-reboot-picker
            xdg-launch
            freetuxtv
            pidgin-extprefs
            clang-include-graph
            barrier-headless
            thonny
            materia-theme
            coomer
            ))

;;; ===================================================================
;;; COPY-BUILD-SYSTEM PACKAGES (data installs, scripts, binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. suru-plus-icons — cyberpunkish Papirus-like icon theme
;;; -------------------------------------------------------------------
(define-public suru-plus-icons
  (package
    (name "suru-plus-icons")
    (version "30.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gusbemacbe/suru-plus/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1rb1rqi7gggsry1bj53qyjwnnjiwmki31a44lb5p61f97s8w56zr"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/Suru++"))))
    (synopsis "cyberpunkish Papirus-like icon theme for Linux")
    (description "Suru++ is a third-party icon theme for Linux featuring a
cyberpunkish, elegant, and futuristic style.  It provides over 5360 app icons,
1800 action icons, and support for 20+ distributions.  Based on the Papirus
icon theme design language.")
    (home-page "https://github.com/gusbemacbe/suru-plus")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. fcitx5-material-color — Material Design skin for Fcitx5
;;; -------------------------------------------------------------------
(define-public fcitx5-material-color
  (package
    (name "fcitx5-material-color")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hosxy/Fcitx5-Material-Color"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "1505sf42bx4av08nb2d88bw1c059qbbqn98jdyxg4id68y7p9vpf"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((themes-dir (string-append (assoc-ref outputs "out")
                                                    "/share/fcitx5/themes")))
                     (for-each
                      (lambda (dir)
                        (when (and (file-exists? dir)
                                   (eq? 'directory (stat:type (stat dir)))
                                   (string-prefix? "Material-Color" dir))
                          (let ((dest (string-append themes-dir "/" dir)))
                            (mkdir-p dest)
                            (copy-recursively dir dest))))
                      (scandir "."))))))
           #:install-plan #~'()))
    (synopsis "material design skin for the Fcitx5 input method framework")
    (description "Fcitx5 Material Color provides Material Design colored themes
for the Fcitx5 input method framework.  It offers 10 color variants including
black, blue, brown, deep purple, indigo, orange, pink, red, sakura pink,
and teal.")
    (home-page "https://github.com/hosxy/Fcitx5-Material-Color")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 3. bullet-train-zsh-theme — Powerline-based oh-my-zsh theme
;;; -------------------------------------------------------------------
(define-public bullet-train-zsh-theme
  (package
    (name "bullet-train-zsh-theme")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/caiogondim/bullet-train-oh-my-zsh-theme"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1lwqk89j7q0kgjzfvvjkbac8pjxmavl1v6w8s1kq06k66dmcy8fn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bullet-train.zsh-theme"
                "share/zsh/themes/bullet-train.zsh-theme"))))
    (synopsis "powerline-based zsh theme with contextual information")
    (description "Bullet Train is a Powerline-based oh-my-zsh theme that shows
contextual information such as git status, Ruby/Python/Node versions, virtualenv,
background jobs, and exit codes only when relevant.")
    (home-page "https://github.com/caiogondim/bullet-train-oh-my-zsh-theme")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. vim-pkgbuild — Vim plugin for Arch Linux PKGBUILD files
;;; -------------------------------------------------------------------
(define-public vim-pkgbuild
  (let ((commit "2469a0a9f09410268a2c6b7e83767b7399ed9dd2")
        (revision "0"))
    (package
      (name "vim-pkgbuild")
      (version (string-append "0.0.0-" revision "."
                              (string-take commit 7)))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/m-pilia/vim-pkgbuild/archive/"
                      commit ".tar.gz"))
                (sha256
                 (base32
                  "16djmssjjjhs3qqjh9n6inc3sh6ryx7jbicrf8rf8dc85gxy2w03"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("autoload" "share/vim/vimfiles/autoload")
                 ("doc" "share/vim/vimfiles/doc")
                 ("ftdetect" "share/vim/vimfiles/ftdetect")
                 ("ftplugin" "share/vim/vimfiles/ftplugin")
                 ("indent" "share/vim/vimfiles/indent")
                 ("plugin" "share/vim/vimfiles/plugin")
                 ("syntax" "share/vim/vimfiles/syntax"))))
      (synopsis "vim plugin for Arch Linux PKGBUILD files")
      (description "Vim-pkgbuild provides filetype detection, syntax
highlighting, templates, checksum updating, and shellcheck-based linting
for Arch Linux PKGBUILD files in Vim and Neovim.")
      (home-page "https://github.com/m-pilia/vim-pkgbuild")
      (license license:expat))))

;;; -------------------------------------------------------------------
;;; 5. reshade-steam-proton — ReShade setup scripts for Steam/Proton
;;; -------------------------------------------------------------------
(define-public reshade-steam-proton
  (let ((commit "55d4a681c9389e20ab569234f01bf67dbd6866a7")
        (revision "0"))
    (package
      (name "reshade-steam-proton")
      (version (string-append "0.0.0-" revision "."
                              (string-take commit 7)))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/kevinlekiller/reshade-steam-proton"
                      "/archive/" commit ".tar.gz"))
                (sha256
                 (base32
                  "176kwsr89wf1y0czc5dplxhvyhlp2ylqczdasdyg2lzbhc5ccjk3"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("reshade-linux.sh" "bin/reshade-linux")
                 ("reshade-steam-proton.sh" "bin/reshade-steam-proton"))))
      (inputs (list bash))
      (synopsis "scripts to set up ReShade for games under Wine/Proton")
      (description "Reshade-steam-proton provides Bash scripts to automatically
download, set up, and update ReShade and its shader collections for games
running under Wine or Steam Proton on Linux.")
      (home-page "https://github.com/kevinlekiller/reshade-steam-proton")
      (license license:gpl2))))

;;; -------------------------------------------------------------------
;;; 6. zenity-rs-bin — Rust-based zenity alternative (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public zenity-rs-bin
  (package
    (name "zenity-rs-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/QaidVoid/zenity-rs/releases/download/v"
                    version "/zenity-rs-x86_64-linux"))
              (sha256
               (base32
                "0amqpsfi6wg1zgf2sqi5ar3hgj0sy0v13z75sa835wqnc51jpjx0"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/zenity-rs")
                   (chmod "src/zenity-rs" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("zenity-rs" "bin/zenity-rs"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line dialog utility written in Rust")
    (description "Zenity-rs displays simple GUI dialogs such as message boxes
and file choosers from the command line.  It is a Rust-based alternative to
GNOME's zenity with support for both X11 and Wayland.  This package installs
the pre-built Linux binary.")
    (home-page "https://github.com/QaidVoid/zenity-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. saul-bin — CLI HTTP client (prebuilt Go binary)
;;; -------------------------------------------------------------------
(define-public saul-bin
  (package
    (name "saul-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DeprecatedLuar/better-curl-saul"
                    "/releases/download/v" version "/saul-linux-amd64"))
              (sha256
               (base32
                "1vs56j3gl6cfbgqk2a6ksm21r5p4as61vf683n1xd2ycr99da8bn"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/saul")
                   (chmod "src/saul" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("saul" "bin/saul"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI HTTP client with TOML-configured request profiles")
    (description "Saul (Better Curl Saul) is a command-line HTTP client
designed to make API request reusability simple through TOML-configured
request profiles.  This package installs the pre-built Go binary for Linux.")
    (home-page "https://github.com/DeprecatedLuar/better-curl-saul")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. akeyshually-bin — hotkey daemon (prebuilt Go binary)
;;; -------------------------------------------------------------------
(define-public akeyshually-bin
  (package
    (name "akeyshually-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DeprecatedLuar/akeyshually"
                    "/releases/download/v" version
                    "/akeyshually-linux-amd64"))
              (sha256
               (base32
                "0xfvlkrhsxcndzdy7nx2d0ziwvf4fba4l46v00jcb7w4z1jibmi3"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/akeyshually")
                   (chmod "src/akeyshually" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("akeyshually" "bin/akeyshually"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphical-session-agnostic shortcut daemon using evdev")
    (description "Akeyshually is a hotkey daemon that works independently of
any graphical session by using Linux evdev for input.  It is configured via
a TOML config file.  This package installs the pre-built Go binary for Linux.")
    (home-page "https://github.com/DeprecatedLuar/akeyshually")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. wayvr-bin — Linux VR overlay (prebuilt binary)
;;; -------------------------------------------------------------------
(define-public wayvr-bin
  (package
    (name "wayvr-bin")
    (version "26.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wayvr-org/wayvr/releases/download/v"
                    version "/wayvr"))
              (sha256
               (base32
                "09fr6wzkfm0wj36hk1wgnkg8mafg2amkx137978abk7f84vfc4gi"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/wayvr")
                   (chmod "src/wayvr" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("wayvr" "bin/wayvr"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "linux VR overlay for running desktop apps in VR")
    (description "WayVR is a Linux VR overlay that lets you run Wayland and X11
applications inside VR environments via Monado, WiVRn, or SteamVR.  This
package installs the pre-built binary for Linux.")
    (home-page "https://github.com/wayvr-org/wayvr")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 10. ocr4linux — OCR screenshot tool using Tesseract
;;; -------------------------------------------------------------------
(define-public ocr4linux
  (package
    (name "ocr4linux")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/moheladwy/OCR4Linux/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1dqbnn8jksj74h6j9wnl1mrxcc4cdg7vqkd94zy6zcjrhpkl6hs1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ocr4linux.py" "bin/ocr4linux")
               ("setup.sh" "share/ocr4linux/setup.sh"))))
    (synopsis "CLI tool for extracting text from screenshots via Tesseract")
    (description "OCR4Linux is a command-line tool for extracting text from
screenshots using Tesseract OCR.  It supports both X11 and Wayland sessions,
capturing screen regions and copying recognized text to the clipboard.")
    (home-page "https://github.com/moheladwy/OCR4Linux")
    (license license:expat)))

;;; ===================================================================
;;; MESON-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 11. flipclock — flip clock screensaver using SDL2
;;; -------------------------------------------------------------------
(define-public flipclock
  (package
    (name "flipclock")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlynxZhou/flipclock/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0llg9janqrxrhnmgvhz5qs833whzs107rjjl5bvqc5kxg6d20zd9"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list sdl2 sdl2-ttf))
    (native-inputs (list pkg-config))
    (synopsis "flip clock screensaver rendered with SDL2")
    (description "Flipclock is a flip clock screensaver and desktop clock
application rendered using SDL2.  It displays time with a retro flip-card
animation style.")
    (home-page "https://github.com/AlynxZhou/flipclock")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 22. materia-theme — Material Design GTK theme
;;; -------------------------------------------------------------------
(define-public materia-theme
  (package
    (name "materia-theme")
    (version "20210322")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nana-4/materia-theme/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1ddwfjz4cf4bwpmyk1ll0nz3ksiyjvw2646779a440np5ihsyq24"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list sassc))
    (synopsis "material design theme for GNOME/GTK desktop environments")
    (description "Materia is a Material Design theme for GNOME/GTK-based
desktop environments.  It supports GTK2, GTK3, GTK4, GNOME Shell, Budgie,
Cinnamon, and MATE window managers and desktop environments.")
    (home-page "https://github.com/nana-4/materia-theme")
    (license license:gpl2)))

;;; ===================================================================
;;; PYTHON / PYPROJECT BUILD SYSTEMS
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 12. python-pkb-client — Porkbun DNS API client
;;; -------------------------------------------------------------------
(define-public python-pkb-client
  (package
    (name "python-pkb-client")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/infinityofspace/pkb_client"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1r1lr6awh7z37hndijpgx3vbrhxrjz83whic89yhf4l2l209vynd"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require network access (Porkbun API)
    (propagated-inputs (list python-requests python-dnspython))
    (synopsis "python client for the Porkbun DNS API")
    (description "Pkb_client is a Python command-line client and library for
managing DNS records via the Porkbun API.  It supports creating, updating,
deleting, and listing DNS records.")
    (home-page "https://github.com/infinityofspace/pkb_client")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. grub-reboot-picker — system tray GRUB entry picker
;;; -------------------------------------------------------------------
(define-public grub-reboot-picker
  (package
    (name "grub-reboot-picker")
    (version "0.0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mendhak/grub-reboot-picker"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "07a0ixr3wakhkb77vdibj3nf95f9w3s58vz4bxw1m5nynfwmxcin"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite; requires system GRUB
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-pygobject))
    (synopsis "system tray app to preselect a GRUB boot entry")
    (description "Grub-reboot-picker is a system tray application that lets
you preselect a GRUB menu entry to reboot into, without waiting at the GRUB
screen.  It uses PyGObject and GTK for the tray indicator.")
    (home-page "https://github.com/mendhak/grub-reboot-picker")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 21. thonny — beginner-friendly Python IDE
;;; -------------------------------------------------------------------
(define-public thonny
  (package
    (name "thonny")
    (version "4.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/thonny/thonny/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0z0grr8v48cx01aly5j7kjd7nq136kfqisgcgnr36031in7kxp3s"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require Tkinter display
    (propagated-inputs
     (list python-docutils
           python-jedi
           python-pylint
           python-pyserial
           python-send2trash))
    (synopsis "beginner-friendly Python IDE with integrated debugger")
    (description "Thonny is a Python IDE designed for beginners.  It features
an integrated debugger with variable inspector and step-through code
execution, making it suitable for learning programming.  It uses Tkinter
for its graphical interface.")
    (home-page "https://thonny.org")
    (license license:expat)))

;;; ===================================================================
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 13. xbindkeys-config-gtk2 — GTK2 GUI for xbindkeys
;;; -------------------------------------------------------------------
(define-public xbindkeys-config-gtk2
  (package
    (name "xbindkeys-config-gtk2")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rgeorgiev583/xbindkeys_config"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "1yjbd72f37rkhcjm4jccpgwk5ggalaw0bd8shpdfdbx6hbxw921x"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script, just Makefile
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "xbindkeys_config" bin)))))))
    (inputs (list gtk+-2))
    (native-inputs (list pkg-config))
    (synopsis "GTK2-based graphical configuration tool for xbindkeys")
    (description "Xbindkeys-config is a GTK2-based graphical tool for
creating and modifying key binding configurations for xbindkeys.  It
provides a simple GUI for managing keyboard shortcuts.")
    (home-page "https://github.com/rgeorgiev583/xbindkeys_config")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 16. xdg-launch — XDG-compliant application launcher
;;; -------------------------------------------------------------------
(define-public xdg-launch
  (package
    (name "xdg-launch")
    (version "1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bbidulock/xdg-launch/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0p68h9c287a3mkwzl14kvyadwzb18wgin4k93d7ai0s0jrap8x85"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'configure 'run-autogen
                 (lambda _
                   (invoke "bash" "autogen.sh"))))))
    (inputs (list glib libx11 libxrandr libxinerama))
    (native-inputs (list autoconf automake libtool pkg-config))
    (synopsis "XDG-compliant application launcher for X11")
    (description "Xdg-launch is a command-line XDG-compliant application
launcher and associated tools for X11 desktops.  It handles desktop entry
files and startup notification.")
    (home-page "https://github.com/bbidulock/xdg-launch")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 17. freetuxtv — Internet TV and radio player using VLC
;;; -------------------------------------------------------------------
(define-public freetuxtv
  (package
    (name "freetuxtv")
    (version "0.6.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freetuxtv/freetuxtv/releases/download/"
                    "freetuxtv-" version "/freetuxtv-" version ".tar.gz"))
              (sha256
               (base32
                "061frim1bnzx5i6zgv5ivdxgdx1bpjdbdbw49h5rpa1fi6pxh6b9"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list gtk+-2 glib vlc sqlite libcurl libnotify))
    (native-inputs (list pkg-config))
    (synopsis "internet television and radio player using VLC backend")
    (description "FreetuxTV is an internet television and radio player that
uses VLC as its playback backend.  It provides a GTK+ interface for browsing
and playing online TV and radio streams.")
    (home-page "https://github.com/freetuxtv/freetuxtv")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. pidgin-extprefs — extended preferences plugin for Pidgin
;;; -------------------------------------------------------------------
(define-public pidgin-extprefs
  (package
    (name "pidgin-extprefs")
    (version "0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/gaim-extprefs"
                    "/Extended%20Preferences/" version
                    "/pidgin-extprefs-" version ".tar.gz"))
              (sha256
               (base32
                "1ql2j98dzlq7ffrha3cgdhhjv85gsv1gnxs1d6bka360vzrxw8sz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list pidgin gtk+-2))
    (native-inputs (list pkg-config))
    (synopsis "extended preferences plugin for Pidgin instant messenger")
    (description "Pidgin-extprefs provides additional preferences for the
Pidgin instant messenger, such as adjustable conversation text font size
and customizable buddy list tooltip behavior.")
    (home-page "http://gaim-extprefs.sourceforge.net/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 23. coomer — screen zoomer/magnifier for X11 and Wayland
;;; -------------------------------------------------------------------
(define-public coomer
  (package
    (name "coomer")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yuzujr/coomer/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0hz73s77nvqk65zy54niwvgy68h4zzs3w9ckianamgj374i8wsi8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script, just Makefile
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file "coomer" bin)))))))
    (inputs (list libx11 libxrandr
                  mesa  ;; GL, EGL
                  wayland libxkbcommon dbus))
    (native-inputs (list pkg-config))
    (synopsis "screen zoomer/magnifier for X11 and Wayland")
    (description "Coomer is a screen zoomer and magnification application for
Linux supporting X11 and Wayland with OpenGL rendering.  It provides smooth
zoom and pan across the desktop.")
    (home-page "https://github.com/yuzujr/coomer")
    (license license:expat)))

;;; ===================================================================
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 14. scnlib — modern C++ formatted input library
;;; -------------------------------------------------------------------
(define-public scnlib
  (package
    (name "scnlib")
    (version "4.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/eliaskosunen/scnlib/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "19s6zwrw54640bn4sllpnbf9m4j08pz3hw8jlxbwr508hhk7pqgc"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; tests require Google Test (not available in sandbox)
           #:configure-flags
           #~(list "-DSCN_TESTS=OFF"
                   "-DSCN_BENCHMARKS=OFF"
                   "-DSCN_EXAMPLES=OFF"
                   "-DFETCHCONTENT_FULLY_DISCONNECTED=ON")))
    (synopsis "modern C++ library for formatted input parsing")
    (description "Scnlib is a modern C++ library providing scanf-like formatted
input parsing with a type-safe, extensible API.  It offers a replacement for
@code{scanf} and @code{std::istream} with better type safety and performance.")
    (home-page "https://github.com/eliaskosunen/scnlib")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. clang-include-graph — C++ include dependency analyzer
;;; -------------------------------------------------------------------
(define-public clang-include-graph
  (package
    (name "clang-include-graph")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bkryza/clang-include-graph"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "03225i4lvgr4xwzrjnzxbk011b545kml9x5w080h69i43abbyjqp"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need test fixtures
    (inputs (list clang boost))
    (native-inputs (list pkg-config))
    (synopsis "tool for analyzing C++ include dependency graphs")
    (description "Clang-include-graph is a tool for analyzing and visualizing
C++ project include dependency graphs using libclang.  It generates
dependency information useful for understanding project structure.")
    (home-page "https://github.com/bkryza/clang-include-graph")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. barrier-headless — software KVM switch (headless, no GUI)
;;; -------------------------------------------------------------------
(define-public barrier-headless
  (package
    (name "barrier-headless")
    (version "2.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/debauchee/barrier/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0xzyw95fk04h11q6ln0i9iwlrvdxp7z08vqbfjrrn7c3gap6q110"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBARRIER_BUILD_GUI=OFF"
                   "-DBARRIER_BUILD_INSTALLER=OFF")
           #:tests? #f))  ;; no test suite for headless build
    (inputs (list openssl libx11 libxi libxtst libxrandr
                  libxinerama curl))
    (native-inputs (list pkg-config))
    (synopsis "software KVM switch (headless server/client)")
    (description "Barrier is a software KVM switch that allows sharing a
single keyboard and mouse across multiple computers over a network.  This
headless variant builds only the @command{barriers} server and
@command{barrierc} client without the Qt GUI.")
    (home-page "https://github.com/debauchee/barrier")
    (license license:gpl2)))
