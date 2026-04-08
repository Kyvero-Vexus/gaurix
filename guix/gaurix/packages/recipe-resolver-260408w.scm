;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260408w
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 1 font package (font-build-system)
;;;   - 4 theme/icon packages (copy-build-system)
;;;   - 6 shell script/plugin packages (copy-build-system)
;;;   - 6 binary repacks (copy-build-system)
;;;   - 5 Python packages (pyproject/python-build-system)
;;;   - 2 C/C++ source builds (cmake/meson-build-system)
;;;   - 1 AppImage repack (copy-build-system)
;;;   - 5 re-evaluated with concrete blocking reasons
;;;
;;; New recipes (25):
;;;   - font-unifont: GNU Unifont OTF with comprehensive Unicode (GPL-2.0+/OFL-1.1)
;;;   - candy-icons: sweet gradient icons for desktops (GPL-3.0)
;;;   - sweet-folders-icons: sweet folder icons for desktops (GPL-3.0)
;;;   - dracula-icons: dark icons in Dracula palette (GPL-3.0+)
;;;   - graphite-gtk-theme: flat design GTK theme (GPL-3.0)
;;;   - neowofetch: system info display tool (MIT)
;;;   - sshcommand: thin SSH client wrapper (MIT)
;;;   - hosts-update: hosts file blocklist updater (GPL-3.0)
;;;   - rclonefzf: interactive FZF frontend for rclone (GPL-3.0+)
;;;   - fontpreview: minimal font previewer using FZF (MIT)
;;;   - bash-git-prompt: informative git prompt for bash (BSD-2)
;;;   - lore-cli-bin: reasoning history CLI for code (Apache-2.0)
;;;   - vex-tui-bin: terminal-based Excel/CSV viewer (MIT)
;;;   - ghk-bin: GitHub helper CLI tool (MIT)
;;;   - qo-bin: interactive JSON/CSV query TUI (MIT)
;;;   - kftui-bin: kubectl port forward TUI manager (GPL-3.0)
;;;   - simplex-chat-bin: private-by-design chat CLI (AGPL-3.0+)
;;;   - greenlight-bin: open-source Xbox streaming client (MIT)
;;;   - python-inplace: in-place file processing library (MIT)
;;;   - python-types-waitress: typing stubs for waitress (Apache-2.0)
;;;   - neovim-remote: neovim --remote support tool (MIT)
;;;   - dirsearch: web path scanner (GPL-2.0)
;;;   - python-indexed-gzip: fast random access of gzip files (BSD-3)
;;;   - mpris-scrobbler: MPRIS music scrobbler daemon (MIT)
;;;   - apngasm: animated PNG assembler tool (zlib)
;;;
;;; Re-evaluated (blocked with specific reasons, 5):
;;;   - breeze-contrast-cursor-theme: NO_STABLE_URL
;;;   - fortune-mod-hitchhiker: MISSING_DEP (fortune-mod)
;;;   - fortune-mod-calvin: MISSING_DEP (fortune-mod)
;;;   - fortune-mod-discworld: MISSING_DEP (fortune-mod)
;;;   - data-peek-bin: PROPRIETARY_NO_STABLE_URL
;;;
;;; NOTE: All sha256 hashes verified via guix download / guix hash.

(define-module (gaurix packages recipe-resolver-260408w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages web)
  #:export (
            ;; font
            font-unifont
            ;; themes / icons
            candy-icons
            sweet-folders-icons
            dracula-icons
            graphite-gtk-theme
            ;; shell scripts / plugins
            neowofetch
            sshcommand
            hosts-update
            rclonefzf
            fontpreview
            bash-git-prompt
            ;; binary repacks
            lore-cli-bin
            vex-tui-bin
            ghk-bin
            qo-bin
            kftui-bin
            simplex-chat-bin
            greenlight-bin
            ;; python
            python-inplace
            python-types-waitress
            neovim-remote
            dirsearch
            python-indexed-gzip
            ;; C/C++
            mpris-scrobbler
            apngasm))

;;;
;;; =====================================================================
;;; FONTS
;;; =====================================================================
;;;

;;; -- font-unifont -------------------------------------------------------
;;; GNU Unifont -- comprehensive Unicode BMP font
;;;
(define-public font-unifont
  (package
    (name "font-unifont")
    (version "17.0.03")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://unifoundry.com/pub/unifont/unifont-" version
             "/font-builds/unifont-" version ".otf"))
       (sha256
        (base32 "1x8vqak6r4965dcrzw3rj0217517xvkla1kbpkffyg2kjxd1q1r6"))))
    (build-system font-build-system)
    (home-page "https://unifoundry.com/unifont.html")
    (synopsis "Unicode font with glyphs for every printable BMP code point")
    (description
     "GNU Unifont is a duospaced bitmap font that covers every printable
code point in the Unicode Basic Multilingual Plane (BMP).  It provides
a fallback glyph for virtually every script and symbol block, making it
useful as a last-resort font for multilingual text rendering and
terminal applications.")
    (license (list license:gpl2+ license:silofl1.1))))

;;;
;;; =====================================================================
;;; THEMES / ICONS
;;; =====================================================================
;;;

;;; -- candy-icons --------------------------------------------------------
;;; Sweet gradient icons for Linux desktops
;;; Snapshot: 2026-04-08 (no tagged releases)
;;;
(define-public candy-icons
  (let ((commit "7a29005e80d4538bb3e780a541ef30438a874845")
        (revision "0"))
    (package
      (name "candy-icons")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/EliverLara/candy-icons")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0vrw84brdp81mp0cly95bdbl9iv3088fgliscyir1yn13igy70hm"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/icons/candy-icons"
                  #:exclude ("LICENSE" "README.md" ".github")))))
      (home-page "https://github.com/EliverLara/candy-icons")
      (synopsis "sweet gradient icons for Linux desktop environments")
      (description
       "Candy Icons is an icon theme for Linux desktop environments
featuring sweet gradient colors.  It provides a comprehensive set of
application, folder, and system icons with a modern, colorful design.")
      (license license:gpl3))))

;;; -- sweet-folders-icons ------------------------------------------------
;;; Sweet folder icons for Linux desktops
;;; Snapshot: 2026-04-08 (no tagged releases)
;;;
(define-public sweet-folders-icons
  (let ((commit "b2192ff42a3b9a46afdc29018e1f84e63d1d52ff")
        (revision "0"))
    (package
      (name "sweet-folders-icons")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/EliverLara/Sweet-folders")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "19s92lnhl9dnnpv6g7yw02d0a7xpwv478hvhsh486gjsq7s831f7"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/icons/Sweet-folders"
                  #:exclude ("LICENSE" "README.md" ".github")))))
      (home-page "https://github.com/EliverLara/Sweet-folders")
      (synopsis "folder icons from the Sweet GTK theme")
      (description
       "Sweet Folders provides folder icons designed to complement the
Sweet GTK theme for Linux desktop environments.  The icons feature a
dark, modern aesthetic with gradient accents.")
      (license license:gpl3))))

;;; -- dracula-icons ------------------------------------------------------
;;; Dracula dark icons theme
;;; Snapshot: 2026-04-08 (no tagged releases)
;;;
(define-public dracula-icons
  (let ((commit "de2a8ed06c27ded5098d5d0cc15c95e49f9f5cd4")
        (revision "0"))
    (package
      (name "dracula-icons")
      (version (git-version "1.0.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/m4thewz/dracula-icons")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1lnnfyk5kh1r90dfq0586lrzl2vj941m62f5pg6l8l2cph462sxd"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/icons/Dracula"
                  #:exclude ("LICENSE" "README.md" ".github")))))
      (home-page "https://github.com/m4thewz/dracula-icons")
      (synopsis "dark icon theme in the Dracula color palette")
      (description
       "Dracula Icons is a dark icon theme for Linux desktop environments
based on the Dracula color scheme.  It provides application, folder,
and system icons with a consistent dark aesthetic using the signature
Dracula purple, pink, and cyan accent colors.")
      (license license:gpl3+))))

;;; -- graphite-gtk-theme -------------------------------------------------
;;; Graphite -- flat design GTK theme
;;;
(define-public graphite-gtk-theme
  (package
    (name "graphite-gtk-theme")
    (version "2024-07-15")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vinceliuice/Graphite-gtk-theme/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0idcapsrpa6ids3mpfrk751zji393mg8s8cjs0w6xwvhhga4vwxm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src" "share/themes/Graphite/gtk-3.0"
                #:include-regexp ("gtk\\.css$" "gtk-dark\\.css$"))
               ("src" "share/themes/Graphite/gtk-4.0"
                #:include-regexp ("gtk\\.css$" "gtk-dark\\.css$"))
               ("." "share/themes/Graphite"
                #:include ("index.theme")))))
    (home-page "https://github.com/vinceliuice/Graphite-gtk-theme")
    (synopsis "flat design GTK theme with clean aesthetics")
    (description
     "Graphite is a flat material design GTK theme for Linux desktop
environments.  It supports GTK 3 and GTK 4 with multiple color
variants including light, dark, and nord palettes.  The theme provides
a clean, modern look with consistent styling across applications.")
    (license license:gpl3)))

;;;
;;; =====================================================================
;;; SHELL SCRIPTS / PLUGINS
;;; =====================================================================
;;;

;;; -- neowofetch ---------------------------------------------------------
;;; neowofetch -- system information display tool (from hyfetch)
;;;
(define-public neowofetch
  (package
    (name "neowofetch")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hykilpikonna/hyfetch/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append "hyfetch-" version ".tar.gz"))
       (sha256
        (base32 "1jmzqw9kph1hnaccbbvl408wkp6rrk7c477zwjd97xw8h9ajx51j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("neowofetch" "bin/neowofetch"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/neowofetch")
                          #o755))))))
    (inputs (list bash))
    (home-page "https://github.com/hykilpikonna/hyfetch")
    (synopsis "system information display tool forked from neofetch")
    (description
     "Neowofetch is a system information display tool for the terminal,
forked from the original neofetch project.  It shows system information
alongside an ASCII art logo of the operating system.  This is the
standalone neowofetch script from the hyfetch project.")
    (license license:expat)))

;;; -- sshcommand ---------------------------------------------------------
;;; sshcommand -- SSH thin client wrapper
;;;
(define-public sshcommand
  (package
    (name "sshcommand")
    (version "0.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dokku/sshcommand/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0gpj0l0241d47phliz2khv1wb9ixim01cpglxpc532s4zfchvagh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sshcommand" "bin/sshcommand"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/sshcommand")
                          #o755))))))
    (inputs (list bash))
    (home-page "https://github.com/dokku/sshcommand")
    (synopsis "turn SSH into a thin client for your application")
    (description
     "Sshcommand is a tool that turns SSH into a thin client specifically
for your app.  It creates dedicated system users that can only run
a specific command via SSH, useful for building Git push-based
deployment systems like Dokku.")
    (license license:expat)))

;;; -- hosts-update -------------------------------------------------------
;;; hosts-update -- hosts file blocklist updater
;;;
(define-public hosts-update
  (package
    (name "hosts-update")
    (version "1.38")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/graysky2/hosts-update/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fpjl1f8h1zc8jwp9f22xabakqfg1w1s1wf55r6gmygaic1dn3ws"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/hosts-update" "bin/hosts-update")
               ("man/hosts-update.8" "share/man/man8/hosts-update.8"))))
    (inputs (list curl))
    (home-page "https://github.com/graysky2/hosts-update")
    (synopsis "update /etc/hosts with a blocklist to block ad servers")
    (description
     "Hosts-update downloads and installs an ad-blocking hosts file from
the MVPS HOSTS project.  It merges the blocklist with the existing
/etc/hosts file, adding entries that redirect known advertising and
tracking domains to 127.0.0.1.")
    (license license:gpl3)))

;;; -- rclonefzf ----------------------------------------------------------
;;; rclonefzf -- interactive FZF frontend for rclone
;;;
(define-public rclonefzf
  (package
    (name "rclonefzf")
    (version "1.0.19")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ConnerWill/rclonefzf/archive/refs/tags/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xv72a1pkd5q2jg881x3kkxvk6xasa5vwxh85nbpldz79138ggbm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rclonefzf" "bin/rclonefzf"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/rclonefzf")
                          #o755))))))
    (inputs (list bash))
    (home-page "https://github.com/ConnerWill/rclonefzf")
    (synopsis "interactive terminal UI for rclone using FZF")
    (description
     "Rclonefzf is an interactive terminal user interface for browsing
and viewing files on rclone remotes.  It uses FZF for fuzzy-finding
and selecting files and directories across configured rclone backends.")
    (license license:gpl3+)))

;;; -- fontpreview --------------------------------------------------------
;;; fontpreview -- minimal font previewer using FZF
;;;
(define-public fontpreview
  (package
    (name "fontpreview")
    (version "1.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sdushantha/fontpreview/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n3p5yikd10j38h87mhlsw7872pa2546vxasq21f111bhnbfv1ap"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fontpreview" "bin/fontpreview")
               ("fontpreview.1" "share/man/man1/fontpreview.1"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/fontpreview")
                          #o755))))))
    (inputs (list bash))
    (home-page "https://github.com/sdushantha/fontpreview")
    (synopsis "highly customizable minimal font previewer for the terminal")
    (description
     "Fontpreview is a shell script that provides a minimal font
previewer.  It uses FZF for interactive font selection and ImageMagick
to render font samples, displaying them in a floating terminal window
for quick visual comparison.")
    (license license:expat)))

;;; -- bash-git-prompt ----------------------------------------------------
;;; Informative git prompt for bash
;;;
(define-public bash-git-prompt
  (package
    (name "bash-git-prompt")
    (version "2.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/magicmonty/bash-git-prompt/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "02d7p2aalhmldp0jdkn7igkvivf87d60s1g8xl7pcr9v2gswcpsy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gitprompt.sh" "share/bash-git-prompt/gitprompt.sh")
               ("git-prompt-help.sh" "share/bash-git-prompt/git-prompt-help.sh")
               ("gitstatus.sh" "share/bash-git-prompt/gitstatus.sh")
               ("prompt-colors.sh" "share/bash-git-prompt/prompt-colors.sh")
               ("themes" "share/bash-git-prompt/themes"))))
    (inputs (list bash))
    (home-page "https://github.com/magicmonty/bash-git-prompt")
    (synopsis "informative and fancy bash prompt for Git users")
    (description
     "Bash Git Prompt displays information about the current Git
repository in the bash prompt.  It shows the branch name, number of
staged and unstaged changes, ahead/behind status relative to the
remote, and other useful information.  Multiple themes are included.")
    (license license:bsd-2)))

;;;
;;; =====================================================================
;;; BINARY REPACKS
;;; =====================================================================
;;;

;;; -- lore-cli-bin -------------------------------------------------------
;;; Lore -- reasoning history CLI for code
;;;
(define-public lore-cli-bin
  (package
    (name "lore-cli-bin")
    (version "0.1.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/varalys/lore/releases/download/v"
             version "/lore-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "1r5rjzpvkq0cd31ix44vz0g83960pakn395wz6gdlc1var6dlxpl"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lore" "bin/lore"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/varalys/lore")
    (synopsis "reasoning history for AI-assisted code development")
    (description
     "Lore captures reasoning history during AI-assisted code development
sessions.  It tracks decisions, context, and rationale behind code
changes, helping developers maintain a narrative of how and why code
evolved.  This package provides the pre-built Linux binary.")
    (license license:asl2.0)))

;;; -- vex-tui-bin --------------------------------------------------------
;;; vex-tui -- terminal-based spreadsheet viewer
;;;
(define-public vex-tui-bin
  (package
    (name "vex-tui-bin")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CodeOne45/vex-tui/releases/download/v"
             version "/vex-tui_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "06gqzi38k7bjnjfdliba6r84rrwd7yrfrmbbyhp3f9l4s7sv56y7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vex-tui" "bin/vex-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CodeOne45/vex-tui")
    (synopsis "terminal-based Excel and CSV spreadsheet viewer")
    (description
     "Vex TUI is a fast, feature-rich terminal-based viewer for Excel
spreadsheets and CSV files.  It provides keyboard-driven navigation,
cell inspection, and support for multiple sheets.  This package
provides the pre-built Linux binary.")
    (license license:expat)))

;;; -- ghk-bin ------------------------------------------------------------
;;; ghk -- GitHub helper CLI
;;;
(define-public ghk-bin
  (package
    (name "ghk-bin")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bymehul/ghk/releases/download/v"
             version "/ghk-linux-x86_64"))
       (sha256
        (base32 "06fj70p2qsg3iq53m6jhbm5nbf4j2fnp6b8fabipfp7fhx7ig140"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ghk-linux-x86_64" "bin/ghk"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "ghk-linux-x86_64")
                   (chmod "ghk-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bymehul/ghk")
    (synopsis "GitHub helper for pushing code with ease")
    (description
     "Ghk is a command-line tool that simplifies common GitHub
operations.  It streamlines the push workflow by combining staging,
committing, and pushing into a single command.  This package provides
the pre-built Linux binary.")
    (license license:expat)))

;;; -- qo-bin -------------------------------------------------------------
;;; qo -- interactive JSON/CSV query TUI
;;;
(define-public qo-bin
  (package
    (name "qo-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kiki-ki/go-qo/releases/download/v"
             version "/qo_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "09f8cnv95lxvv2x657vli56yhk775b4fxyzgh547wvk5qsdz14hj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qo" "bin/qo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kiki-ki/go-qo")
    (synopsis "interactive minimalist TUI for querying JSON, CSV, and TSV")
    (description
     "Qo is an interactive terminal user interface for querying and
filtering JSON, CSV, and TSV data.  It provides a minimal but
effective interface for exploring structured data from the command
line.  This package provides the pre-built Go binary.")
    (license license:expat)))

;;; -- kftui-bin ----------------------------------------------------------
;;; kftui -- kubectl port forward TUI manager
;;;
(define-public kftui-bin
  (package
    (name "kftui-bin")
    (version "0.27.28")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hcavarsan/kftray/releases/download/v"
             version "/kftui_linux_amd64"))
       (sha256
        (base32 "1j6x9764dk8xqajks8k29a76z9ybdlajyxfi4hd056mf479pw3qd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kftui_linux_amd64" "bin/kftui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "kftui_linux_amd64")
                   (chmod "kftui_linux_amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hcavarsan/kftray")
    (synopsis "kubectl port forward manager with TUI interface")
    (description
     "Kftui is a terminal user interface for managing kubectl port
forwards.  It supports TCP and UDP port forwarding with features like
proxy configuration, multiple context support, and persistent
configurations.  This package provides the pre-built Linux binary.")
    (license license:gpl3)))

;;; -- simplex-chat-bin ---------------------------------------------------
;;; SimpleX Chat -- private-by-design chat platform CLI
;;;
(define-public simplex-chat-bin
  (package
    (name "simplex-chat-bin")
    (version "6.4.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/simplex-chat/simplex-chat/releases/download/v"
             version "/simplex-chat-ubuntu-24_04-x86_64"))
       (sha256
        (base32 "1h5pxlpha5g9qk1rny28lnwc7s750a60253zppildkvy52lizzs8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("simplex-chat-ubuntu-24_04-x86_64" "bin/simplex-chat"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "simplex-chat-ubuntu-24_04-x86_64")
                   (chmod "simplex-chat-ubuntu-24_04-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://simplex.chat/")
    (synopsis "private-by-design terminal chat client")
    (description
     "SimpleX Chat is a messaging platform designed for maximum
privacy.  It uses a unique architecture with no user identifiers,
not even random numbers, making it impossible to correlate messages to
users.  This package provides the pre-built CLI client for Linux.")
    (license license:agpl3+)))

;;; -- greenlight-bin -----------------------------------------------------
;;; Greenlight -- open-source Xbox streaming client
;;;
(define-public greenlight-bin
  (package
    (name "greenlight-bin")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/unknownskl/greenlight/releases/download/v"
             version "/Greenlight-" version ".AppImage"))
       (sha256
        (base32 "0mvkvfznzc1fh2qs0abgy81wgn410kw7rzdqynn8j1qh542g91q9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "Greenlight-" #$version ".AppImage")
                "bin/greenlight"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source
                              (string-append "Greenlight-"
                                             #$version ".AppImage"))
                   (chmod (string-append "Greenlight-"
                                         #$version ".AppImage")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unknownskl/greenlight")
    (synopsis "open-source Xbox streaming client for xCloud and home streaming")
    (description
     "Greenlight is an open-source client for Xbox Cloud Gaming (xCloud)
and Xbox home streaming.  It allows playing Xbox games on Linux by
streaming them from the cloud or a local Xbox console.  This package
provides the pre-built AppImage.")
    (license license:expat)))

;;;
;;; =====================================================================
;;; PYTHON PACKAGES
;;; =====================================================================
;;;

;;; -- python-inplace -----------------------------------------------------
;;; in-place -- in-place file processing in Python
;;;
(define-public python-inplace
  (package
    (name "python-inplace")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "in_place" version))
       (sha256
        (base32 "0hw7ph078wgyrp7mggk79fr1cqmm24bzbxqrz0ba3ry3ff82n2sb"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/jwodder/inplace")
    (synopsis "in-place file processing in Python")
    (description
     "The @code{in-place} library provides a Python context manager for
reading from and writing to a file \"in place\", similar to the
@code{-i} flag of @command{sed}.  It handles creating temporary files,
copying permissions, and atomically replacing the original.")
    (license license:expat)))

;;; -- python-types-waitress ----------------------------------------------
;;; Type stubs for waitress
;;;
(define-public python-types-waitress
  (package
    (name "python-types-waitress")
    (version "3.0.1.20250801")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types_waitress" version))
       (sha256
        (base32 "1gjmjjsksq4n8azvza8spjhz2rf1ff2vnm5cv1qqfya4kshgs6gr"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/python/typeshed")
    (synopsis "typing stubs for the waitress WSGI server")
    (description
     "This package provides type annotation stubs for the Waitress WSGI
server, generated from the typeshed project.  These stubs enable static
type checking of code that uses the Waitress API with tools like mypy
or pyright.")
    (license license:asl2.0)))

;;; -- neovim-remote ------------------------------------------------------
;;; neovim-remote -- support --remote and friends for Neovim
;;;
(define-public neovim-remote
  (package
    (name "neovim-remote")
    (version "2.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "neovim-remote" version))
       (sha256
        (base32 "00kxlb3f1k7iaxzpsr07scavmnyg8c1jmicmr13mfk2lcdac6g2b"))))
    (build-system python-build-system)
    (propagated-inputs (list python-pynvim python-psutil))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/mhinz/neovim-remote")
    (synopsis "control Neovim processes using the --remote interface")
    (description
     "Neovim-remote provides a command-line tool @command{nvr} that
supports @code{--remote} and related flags for Neovim.  It enables
opening files in an existing Neovim instance from external programs,
which is useful for integrating Neovim as a file editor in tools like
Git, terminal multiplexers, and IDEs.")
    (license license:expat)))

;;; -- dirsearch ----------------------------------------------------------
;;; dirsearch -- web path scanner
;;;
(define-public dirsearch
  (package
    (name "dirsearch")
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "dirsearch" version))
       (sha256
        (base32 "1na84ijdm9d334rng9yn6sfmq825rnhl65cpn28bzk4bc5wxszz9"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite in sdist
    (propagated-inputs
     (list python-certifi
           python-chardet
           python-urllib3
           python-cryptography
           python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/maurosoria/dirsearch")
    (synopsis "web path scanner and directory brute-forcer")
    (description
     "Dirsearch is a command-line tool for brute-forcing directories and
files on web servers.  It supports recursive scanning, multiple
wordlists, HTTP method selection, and various output formats.  It is
designed for authorized security testing and penetration testing.")
    (license license:gpl2)))

;;; -- python-indexed-gzip ------------------------------------------------
;;; indexed-gzip -- fast random access of gzip files
;;;
(define-public python-indexed-gzip
  (package
    (name "python-indexed-gzip")
    (version "1.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "indexed_gzip" version))
       (sha256
        (base32 "09gd7pp0a87j6mk6rd47kriqdskw4l0ji7jxvd85qb2jqnvg6iqk"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;tests require pytest-cov and test fixtures
    (inputs (list zlib))
    (native-inputs (list python-cython python-setuptools python-wheel))
    (home-page "https://github.com/pauldmccarthy/indexed_gzip")
    (synopsis "fast random access of gzip files in Python")
    (description
     "The @code{indexed_gzip} library provides a drop-in replacement
for Python's @code{gzip.GzipFile} that builds an index during
reading, enabling fast random access to gzip-compressed data.  This
is particularly useful for accessing large compressed neuroimaging
datasets (NIfTI) without full decompression.")
    (license license:bsd-3)))

;;;
;;; =====================================================================
;;; C/C++ SOURCE BUILDS
;;; =====================================================================
;;;

;;; -- mpris-scrobbler ----------------------------------------------------
;;; MPRIS scrobbler daemon
;;;
(define-public mpris-scrobbler
  (package
    (name "mpris-scrobbler")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://git.sr.ht/~mariusor/mpris-scrobbler/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0377c9knfn8s3pkqs2qkv3r6l3p0a15jfbbv0pnyhygqgllvp73f"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs
     (list curl
           dbus
           json-c
           libevent))
    (home-page "https://git.sr.ht/~mariusor/mpris-scrobbler")
    (synopsis "minimalistic MPRIS music scrobbler daemon")
    (description
     "Mpris-scrobbler is a minimalistic user daemon that submits
currently playing tracks to Last.fm, Libre.fm, or ListenBrainz using
the MPRIS D-Bus interface.  It runs as a background service and
supports any media player that implements the MPRIS specification.")
    (license license:expat)))

;;; -- apngasm ------------------------------------------------------------
;;; apngasm -- animated PNG assembler
;;;
(define-public apngasm
  (package
    (name "apngasm")
    (version "3.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/apngasm/apngasm/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0v0gp12zr38bmgl7ikp389vf7khmblgcn80k0si33ckssg0y4wc1"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;no test suite
    (inputs
     (list libpng
           boost
           zlib))
    (home-page "https://github.com/apngasm/apngasm")
    (synopsis "tool for creating animated PNG files from individual frames")
    (description
     "Apngasm creates animated PNG (APNG) files from a sequence of
individual PNG frame images.  It supports setting per-frame delays,
loop counts, and optimization options.  APNG is an extension of the
PNG format that adds animation capability, supported natively by most
modern web browsers.")
    (license license:zlib)))
