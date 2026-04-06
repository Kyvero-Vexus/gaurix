;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass (batch 2).
;;; 30 new recipes: 14 binary (copy-build-system), 3 fonts/icons/data,
;;; 3 scripts/plugins, 3 simple C tools, 1 Python/pyproject, 1 C interpreter,
;;; 1 C++/FUSE, 4 binary (Tauri/WebKitGTK).
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd2)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages android)
  #:use-module (gnu packages gtk)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Binary packages
            ffsend-bin
            pandoc-crossref-bin
            tori-bin
            telepresence2-bin
            workz-bin
            comp-scan-bin
            omp-manager-bin
            tmux-plugin-panel-bin
            endcord-bin
            tufw-bin
            wt-bin
            trolley-bin
            mcdu-bin
            weylus-bin
            ;; Tauri/GTK binary packages
            wtq-bin
            mouse-actions-gui-bin
            mkbrr-gui-bin
            swhkd-bin
            ;; Fonts/Icons/Data
            ttf-phosphor-icons
            noto-fonts-cjk-fontconfig
            pixora-icons-git
            ;; Scripts/Plugins
            mpvcut
            asciify
            pdfmted-git
            ;; C tools
            lswt
            sxcs
            warpd
            ;; Python
            hererocks
            ;; C interpreter
            kuroko
            ;; C++/FUSE
            adbfs-rootless-git))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system from GitHub releases
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. ffsend-bin (#3108) ───────────────────────────────────────────

(define-public ffsend-bin
  (package
    (name "ffsend-bin")
    (version "0.2.77")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timvisee/ffsend/releases/download/v"
                    version "/ffsend-v" version "-linux-x64-static"))
              (sha256
               (base32 "04vk6lkrvrd9d06zga7ahk4an1ywv5bz0xs6x1678zbfqiklmlgb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "ffsend-v" #$version "-linux-x64-static")
                "bin/ffsend"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ffsend")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/timvisee/ffsend")
    (synopsis "easily and securely share files from the command line")
    (description "Ffsend is a command-line Firefox Send client.  It allows
easily and securely uploading and downloading files and directories using a
simple command.  Files are shared through a web-based file sharing service,
with built-in encryption for end-to-end security.")
    (license license:gpl3+)))

;; ── 2. pandoc-crossref-bin (#3092) ──────────────────────────────────

(define-public pandoc-crossref-bin
  (package
    (name "pandoc-crossref-bin")
    (version "0.3.23a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lierdakil/pandoc-crossref/releases/download/v"
                    version "/pandoc-crossref-Linux-X64.tar.xz"))
              (sha256
               (base32 "116yr5nnm7ffn2ii8alzsx0aan29cyv0blwzwbq9fyjlf7if8xzs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pandoc-crossref" "bin/")
               ("pandoc-crossref.1" "share/man/man1/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for cross-references in documents")
    (description "Pandoc-crossref is a pandoc filter for numbering figures,
equations, tables, and cross-references to them.  It supports LaTeX, HTML,
and other output formats.")
    (license license:gpl2+)))

;; ── 3. tori-bin (#3150) ────────────────────────────────────────────

(define-public tori-bin
  (package
    (name "tori-bin")
    (version "0.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LeoRiether/tori/releases/download/v"
                    version "/tori-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0is5y4kj5dv89n6w28zj9hq4gvjb650zkwqq01fcaxb84rwklq2r"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tori" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/LeoRiether/tori")
    (synopsis "TUI music player for the terminal")
    (description "Tori is a terminal-based music player that uses mpv as its
playback backend.  It supports streaming from various sources including
YouTube via yt-dlp.")
    (license license:gpl3+)))

;; ── 4. telepresence2-bin (#3104) ────────────────────────────────────

(define-public telepresence2-bin
  (package
    (name "telepresence2-bin")
    (version "2.27.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/telepresenceio/telepresence/releases/download/v"
                    version "/telepresence-linux-amd64"))
              (sha256
               (base32 "1bmz1alsmn9p9ga9lmfja0kb8i0j31c4y9a1xar64zxm3pjkazrd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("telepresence-linux-amd64" "bin/telepresence"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/telepresence")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.telepresence.io/")
    (synopsis "local development against a remote Kubernetes cluster")
    (description "Telepresence is a tool that lets you run a single service
locally while connecting that service to a remote Kubernetes cluster.  It
enables fast, local development of Kubernetes services.")
    (license license:asl2.0)))

;; ── 5. workz-bin (#3086) ───────────────────────────────────────────

(define-public workz-bin
  (package
    (name "workz-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rohansx/workz/releases/download/v"
                    version "/workz-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "092lmgl9i208kd57xnjk1rlk4qnkard6kmkp8sj2212a9rv427mz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("workz" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktree management tool")
    (description "Workz is a command-line tool for managing Git worktrees.
It simplifies creating, switching between, and cleaning up worktrees for
parallel development workflows.")
    (license license:expat)))

;; ── 6. comp-scan-bin (#3061) ───────────────────────────────────────

(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvk147/comp-scan/releases/download/v"
                    version "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "142iwz4y69c5d0if1rfr3x8az047n3nn7pmwazifb287qlpjmswi"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compscan" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "system scanner that suggests improvements")
    (description "Comp-scan is a local system analysis tool that scans your
computer configuration and provides suggestions for improvements and
optimizations.")
    (license license:expat)))

;; ── 7. omp-manager-bin (#3087) ──────────────────────────────────────

(define-public omp-manager-bin
  (package
    (name "omp-manager-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marlocarlo/omp-manager/releases/download/v"
                    version "/omp-manager-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0y0fy7q5xy7444ps6bqyyw2zp9ws27gbm9qdy01iazx0rs5q2ayz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("omp-manager" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/omp-manager")
    (synopsis "installation and management tool for Oh My Posh")
    (description "Omp-manager is a command-line tool for installing and
managing Oh My Posh, a prompt theme engine for any shell.  It handles
downloading, updating, and configuring Oh My Posh themes.")
    (license license:expat)))

;; ── 8. tmux-plugin-panel-bin (#3088) ────────────────────────────────

(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/marlocarlo/Tmux-Plugin-Panel/releases/download/v"
                    version "/tmuxpanel-v" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "1ss6gy3598jv2ljz2vxzlw0dj78m99572apwjy1226wrjvffnh60"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmuxpanel" "bin/")
               ("tmuxthemes" "bin/")
               ("tmuxplugins" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/marlocarlo/Tmux-Plugin-Panel")
    (synopsis "TUI plugin manager for tmux")
    (description "Tmux-Plugin-Panel provides a full-fledged terminal user
interface for managing tmux plugins and themes.  It includes tools for
browsing, installing, and configuring tmux extensions.")
    (license license:expat)))

;; ── 9. endcord-bin (#3111) ──────────────────────────────────────────

(define-public endcord-bin
  (package
    (name "endcord-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sparklost/endcord/releases/download/"
                    version "/endcord-" version "-linux.tar.gz"))
              (sha256
               (base32 "0f88rvr7hl803df4jqrm5qg1sb0bp1icyq63qp16hf8r7b44yglk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("endcord" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sparklost/endcord")
    (synopsis "feature-rich Discord TUI client")
    (description "Endcord is a terminal-based Discord client that provides
a text user interface for chatting, browsing channels, and managing Discord
servers from the command line.")
    (license license:gpl3)))

;; ── 10. tufw-bin (#3099) ────────────────────────────────────────────

(define-public tufw-bin
  (package
    (name "tufw-bin")
    (version "0.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/peltho/tufw/releases/download/v"
                    version "/tufw_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0gsgc7akdb29qxcg53ca70zszwfk46l88xz65m4b0a69di9r38gv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tufw" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/peltho/tufw")
    (synopsis "terminal UI for ufw firewall management")
    (description "Tufw is a terminal user interface for managing the
Uncomplicated Firewall (ufw).  It provides an interactive way to add, remove,
and manage firewall rules without memorizing ufw commands.")
    (license license:expat)))

;; ── 11. wt-bin (#3154) ─────────────────────────────────────────────

(define-public wt-bin
  (package
    (name "wt-bin")
    (version "0.1.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/timvw/wt/releases/download/v"
                    version "/wt_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0fs3wkjaa520hnl051mn5qcfnavj6k9lfw8dcg7w55x33jc8xxxw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wt" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timvw/wt")
    (synopsis "fast and simple Git worktree helper")
    (description "Wt is a lightweight command-line tool for quickly creating,
listing, and switching between Git worktrees.  It streamlines the worktree
workflow with short, memorable commands.")
    (license license:expat)))

;; ── 12. trolley-bin (#3204) ─────────────────────────────────────────

(define-public trolley-bin
  (package
    (name "trolley-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/weedonandscott/trolley/releases/download/v"
                    version "/trolley-cli-x86_64-linux.tar.xz"))
              (sha256
               (base32 "1w4gb53rkd6bv6lj2i4d7q69arrm7ri0awphy38aa60pfwryk01q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("trolley-cli" "bin/trolley"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/weedonandscott/trolley")
    (synopsis "run terminal applications anywhere")
    (description "Trolley is a tool for bundling and running terminal
applications.  It packages terminal apps so they can be distributed and
executed across different systems.")
    (license license:expat)))

;; ── 13. mcdu-bin (#3186) ────────────────────────────────────────────

(define-public mcdu-bin
  (package
    (name "mcdu-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mikalv/mcdu/releases/download/v"
                    version "/mcdu-linux-x86_64-gnu.tar.gz"))
              (sha256
               (base32 "1lxxgmwnddy4h22h6s9sda87wdi6cbqwzi2cr8zxgawjmwrpidgd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mcdu" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mikalv/mcdu")
    (synopsis "modern disk usage analyzer with TUI")
    (description "Mcdu is a modern disk usage analyzer with a terminal user
interface.  It provides an interactive way to explore disk usage, find large
files, and clean up disk space with developer-friendly features.")
    (license license:expat)))

;; ── 14. weylus-bin (#3102) ──────────────────────────────────────────

(define-public weylus-bin
  (package
    (name "weylus-bin")
    (version "0.11.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/H-M-H/Weylus/releases/download/v"
                    version "/linux.zip"))
              (sha256
               (base32 "1wlri95vly460bphh0hp26s6rbpbqq9wacaqxwg4bam86w6n82lg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("weylus" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/weylus")
                          #o755))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/H-M-H/Weylus")
    (synopsis "use your tablet as a graphic tablet or touch screen")
    (description "Weylus turns your tablet or smartphone into a graphic
tablet or touch screen for your computer.  It streams your desktop to a
browser on your tablet and sends touch/pen input back to your computer.")
    (license license:agpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Tauri/WebKitGTK binary packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 15. wtq-bin (#3118) ─────────────────────────────────────────────

(define-public wtq-bin
  (package
    (name "wtq-bin")
    (version "2.0.19")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flyingpie/windows-terminal-quake/releases/download/v"
                    version "/linux-x64_self-contained.tar.gz"))
              (sha256
               (base32 "19n1hc2a1qy1598mdnra9li8yn2kiizkanvb7k8c92i0qpg5wq30"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/wtq/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/lib/wtq/wtq")
                              (string-append out "/bin/wtq"))
                     (chmod (string-append out "/lib/wtq/wtq") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/flyingpie/windows-terminal-quake")
    (synopsis "quake-style dropdown terminal toggler")
    (description "Wtq provides Quake-style dropdown functionality for terminal
emulators.  It toggles a terminal window that slides down from the top of the
screen, similar to the classic Quake console.")
    (license license:expat)))

;; ── 16. mouse-actions-gui-bin (#3103) ───────────────────────────────

(define-public mouse-actions-gui-bin
  (package
    (name "mouse-actions-gui-bin")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jersou/mouse-actions/releases/download/v"
                    version "/mouse-actions-gui-v" version ".tar.gz"))
              (sha256
               (base32 "057ydpkjmphxdhc554fsrac9y7zxmdgjvmwwk2cr744ih962hsp1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mouse-actions-gui" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mouse-actions-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jersou/mouse-actions")
    (synopsis "mouse gesture and hot corner tool with GUI")
    (description "Mouse-actions is a tool for executing commands from mouse
events such as gestures, button combinations, and hot corners.  It works on
both X11 and Wayland and includes a graphical configuration interface.")
    (license license:expat)))

;; ── 17. mkbrr-gui-bin (#3062) ───────────────────────────────────────

(define-public mkbrr-gui-bin
  (package
    (name "mkbrr-gui-bin")
    (version "1.19.0-rc.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/autobrr/mkbrr/releases/download/v"
                    version "/mkbrr-gui_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "1649pwbw8cxihd1dxi0s8bwkh648hh40dyxpb8fwysz32kkyh3ms"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mkbrr-gui" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/autobrr/mkbrr")
    (synopsis "torrent file creator and inspector with GUI")
    (description "Mkbrr-gui is a graphical application for creating and
inspecting torrent files.  It provides a user-friendly interface built with
WebKitGTK for managing BitTorrent metadata files.")
    (license license:gpl2)))

;; ── 18. swhkd-bin (#3135) ──────────────────────────────────────────

(define-public swhkd-bin
  (package
    (name "swhkd-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/waycrate/swhkd/releases/download/"
                    version "/glibc-x86_64-.zip"))
              (sha256
               (base32 "04g038jn89311h093xfn76z53khpq6syms7saqliyabr6skd9rsd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("swhkd" "bin/")
               ("swhks" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (chmod (string-append bin "/swhkd") #o755)
                     (chmod (string-append bin "/swhks") #o755)))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/waycrate/swhkd")
    (synopsis "hotkey daemon for Wayland, X11, and TTY")
    (description "Swhkd is a display protocol-independent hotkey daemon
inspired by sxhkd.  It works on Wayland, X11, and TTY and uses a
configuration format similar to sxhkd for defining keybindings.")
    (license license:bsd-2)))

;; ═══════════════════════════════════════════════════════════════════
;; Fonts / Icons / Data packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 19. ttf-phosphor-icons (#3120) ──────────────────────────────────

(define-public ttf-phosphor-icons
  (package
    (name "ttf-phosphor-icons")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/phosphor-icons/web/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0fcxzdqx614prn7jdy8m3zvzmylhv3b5i0rfpqki9a0d2kqgf2nz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/bold/Phosphor-Bold.ttf"
                "share/fonts/truetype/phosphor-icons/")
               ("src/duotone/Phosphor-Duotone.ttf"
                "share/fonts/truetype/phosphor-icons/")
               ("src/fill/Phosphor-Fill.ttf"
                "share/fonts/truetype/phosphor-icons/")
               ("src/light/Phosphor-Light.ttf"
                "share/fonts/truetype/phosphor-icons/")
               ("src/regular/Phosphor.ttf"
                "share/fonts/truetype/phosphor-icons/")
               ("src/thin/Phosphor-Thin.ttf"
                "share/fonts/truetype/phosphor-icons/"))))
    (home-page "https://phosphoricons.com/")
    (synopsis "flexible icon family as TTF fonts")
    (description "Phosphor Icons is a flexible icon family available as TTF
font files.  It includes six weights: thin, light, regular, bold, fill, and
duotone, providing a comprehensive set of interface icons.")
    (license license:expat)))

;; ── 20. noto-fonts-cjk-fontconfig (#3019) ───────────────────────────

(define-public noto-fonts-cjk-fontconfig
  (package
    (name "noto-fonts-cjk-fontconfig")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (conf-dir (string-append out "/etc/fonts/conf.d"))
                 (conf-file (string-append conf-dir "/70-noto-cjk.conf")))
            (mkdir-p conf-dir)
            (call-with-output-file conf-file
              (lambda (port)
                (display
                 "<?xml version=\"1.0\"?>
<!DOCTYPE fontconfig SYSTEM \"urn:fontconfig:fonts.dtd\">
<fontconfig>
  <!-- Append Noto CJK fonts by locale for CJK fallback -->
  <match target=\"pattern\">
    <test name=\"lang\" compare=\"contains\"><string>ja</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK JP</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\" compare=\"contains\"><string>ko</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK KR</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\" compare=\"contains\"><string>zh-CN</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK SC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\" compare=\"contains\"><string>zh-TW</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK TC</string></edit>
  </match>
  <match target=\"pattern\">
    <test name=\"lang\" compare=\"contains\"><string>zh-HK</string></test>
    <edit name=\"family\" mode=\"append\"><string>Noto Sans CJK HK</string></edit>
  </match>
</fontconfig>
" port)))))))
    (home-page "https://fonts.google.com/noto")
    (synopsis "fontconfig rules for Noto CJK fonts by locale")
    (description "This package provides fontconfig configuration rules that
append Noto CJK fonts as fallback fonts based on the user locale.  It maps
Japanese, Korean, and Chinese locale settings to the appropriate Noto Sans
CJK font variant.")
    (license license:gpl3+)))

;; ── 21. pixora-icons-git (#3059) ────────────────────────────────────

(define-public pixora-icons-git
  (package
    (name "pixora-icons-git")
    (version "1.0.0-a1215de")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tsora1603/pixora-icons")
                    (commit "a1215de097093f5024ba63dab1cd5577a8ab04fa")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0fi5qbi7kli6spsv3jsr9ff955hn739566xw2x8rrgvpsxf7xsbc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pixora" "share/icons/pixora")
               ("pixelitos-dark" "share/icons/pixelitos-dark")
               ("pixelitos-light" "share/icons/pixelitos-light"))))
    (home-page "https://github.com/tsora1603/pixora-icons")
    (synopsis "16-bit pixel art icon theme for Linux desktops")
    (description "Pixora Icons is a 16-bit pixel art icon theme for Linux
desktops.  It includes three variants: pixora, pixelitos-dark, and
pixelitos-light, providing a retro pixel art aesthetic for desktop
environments.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; Script / Plugin packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 22. mpvcut (#3160) ──────────────────────────────────────────────

(define-public mpvcut
  (package
    (name "mpvcut")
    (version "0.5-3716e46")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/tuxnix/mpvcut")
                    (commit "3716e46fa0e63222a6e9b4f090a0f71271bb5cbd")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0c2j7d87gll12hw2cfn64n74hmbdgi634j494wvcilc3m2dvsgdv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("main.lua" "share/mpv/scripts/mpvcut/")
               ("config.lua" "share/mpv/scripts/mpvcut/"))))
    (home-page "https://codeberg.org/tuxnix/mpvcut")
    (synopsis "mpv Lua plugin for video cutting and trimming")
    (description "Mpvcut is a Lua script plugin for the mpv media player
that adds video cutting and trimming functionality.  It allows marking
start and end points during playback and uses ffmpeg to extract the
selected segment without re-encoding.")
    (license license:gpl2)))

;; ── 23. asciify (#3165) ────────────────────────────────────────────

(define-public asciify
  (package
    (name "asciify")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/desyatkoff/asciify/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1b0zd6fsir460z6krr1zzc6lsa7vx4l4rv7lvbwk9bh04b3rdv3z"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("main.py" "bin/asciify"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-script
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (chmod (string-append out "/bin/asciify") #o755)
                     ;; Add shebang if missing
                     (substitute* (string-append out "/bin/asciify")
                       (("^(#!/.*)" line) line)
                       (("^([^#])" all)
                        (string-append "#!/usr/bin/env python3\n" all)))))))))
    (inputs (list python python-pillow))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/desyatkoff/asciify")
    (synopsis "convert images to ASCII art")
    (description "Asciify is a simple image-to-ASCII-art converter.  It takes
an image file as input and produces an ASCII art representation using Python
and the Pillow imaging library.")
    (license license:gpl3+)))

;; ── 24. pdfmted-git (#3155) ────────────────────────────────────────

(define-public pdfmted-git
  (package
    (name "pdfmted-git")
    (version "0-7d7af77")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/glutanimate/pdfmted")
                    (commit "7d7af776cb3c7d39ffa04af57f0727f72bf6fc52")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1788qfmiql5y232y761xyxpx04lwlyhy7if5r5h9kpsii52wxhf3"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pdfmted-editor" "bin/")
               ("pdfmted-inspector" "bin/")
               ("pdfmted-thumbnailer" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (for-each (lambda (f) (chmod (string-append bin "/" f) #o755))
                               '("pdfmted-editor" "pdfmted-inspector"
                                 "pdfmted-thumbnailer"))))))))
    (inputs (list perl python))
    (home-page "https://github.com/glutanimate/pdfmted")
    (synopsis "graphical tool to view and modify PDF metadata")
    (description "Pdfmted provides graphical tools for viewing and modifying
PDF metadata on Linux.  It includes an editor, inspector, and thumbnailer
component that use ExifTool, qpdf, and yad as backends.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; C tool packages — built from source
;; ═══════════════════════════════════════════════════════════════════

;; ── 25. lswt (#3109) ───────────────────────────────────────────────

(define-public lswt
  (package
    (name "lswt")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~leon_plickat/lswt/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1az6amqql2k24f0l11za3vz9xsvnrc8q34qh2q55nwdv01fcq8wf"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list (@ (gnu packages freedesktop) wayland)))
    (native-inputs (list (@ (gnu packages pkg-config) pkg-config)
                         (@ (gnu packages freedesktop) wayland-protocols)))
    (home-page "https://git.sr.ht/~leon_plickat/lswt")
    (synopsis "list Wayland toplevel windows")
    (description "Lswt is a command-line tool that lists Wayland toplevel
windows using the wlr-foreign-toplevel-management protocol.  It displays
information about open windows including their title and app-id.")
    (license license:gpl3)))

;; ── 26. sxcs (#3128) ───────────────────────────────────────────────

(define-public sxcs
  (package
    (name "sxcs")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/NRK/sxcs/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0j1pgzgvnyfkc4hflblwbsa202vdg203824h9is740arkpprmk93"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list (@ (gnu packages xorg) libx11)
                  (@ (gnu packages xorg) libxcursor)))
    (home-page "https://codeberg.org/NRK/sxcs")
    (synopsis "minimal X11 color picker and screen magnifier")
    (description "Sxcs is a minimal X11 color picker and screen magnifier.
It allows picking colors from anywhere on the screen and displaying a
magnified view of the area around the cursor.")
    (license license:gpl3)))

;; ── 27. warpd (#3134) ──────────────────────────────────────────────

(define-public warpd
  (package
    (name "warpd")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rvaiya/warpd/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1bw0v7k5vg9g7f52dgy3jir9m9ilqd4jh2ijraf32drng8f5b3vh"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   "PLATFORM=X11"
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list (@ (gnu packages xorg) libx11)
                  (@ (gnu packages xorg) libxinerama)
                  (@ (gnu packages xorg) libxft)
                  (@ (gnu packages xorg) libxfixes)
                  (@ (gnu packages xorg) libxtst)
                  (@ (gnu packages xdisorg) libxkbcommon)
                  (@ (gnu packages gtk) cairo)))
    (native-inputs (list (@ (gnu packages pkg-config) pkg-config)))
    (home-page "https://github.com/rvaiya/warpd")
    (synopsis "modal keyboard-driven mouse manipulation tool")
    (description "Warpd is a modal keyboard-driven virtual pointer
manipulation tool, similar to Vim-style mouse control.  It allows moving the
mouse cursor, clicking, and scrolling using only the keyboard with multiple
navigation modes including grid, hint, and normal modes.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 28. hererocks (#3126) ──────────────────────────────────────────

(define-public hererocks
  (package
    (name "hererocks")
    (version "0.25.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/luarocks/hererocks/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1q7ry4928v0jbac1i95vkvl1hwdd19n5lmq1fvv49jbskzxnjdxx"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list (@ (gnu packages python-build) python-setuptools)
                         (@ (gnu packages python-build) python-wheel)))
    (home-page "https://github.com/luarocks/hererocks")
    (synopsis "install Lua and LuaRocks locally")
    (description "Hererocks is a Python script for installing Lua, LuaJIT,
or Moonjit and LuaRocks into a local directory.  It provides virtualenv-like
isolation for Lua development environments.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; C interpreter — built from source
;; ═══════════════════════════════════════════════════════════════════

;; ── 29. kuroko (#3148) ─────────────────────────────────────────────

(define-public kuroko
  (package
    (name "kuroko")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kuroko-lang/kuroko/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0pf9crc37gfvfr1jg0q75018xz04vhl7i7rva87yvcx93mv47ham"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://kuroko-lang.github.io/")
    (synopsis "dynamic bytecode-compiled programming language")
    (description "Kuroko is a dynamic, bytecode-compiled programming language
that is a dialect of Python.  It features a clean syntax similar to Python
with support for classes, closures, list comprehensions, and a C embedding
API.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; C++/FUSE — built from source
;; ═══════════════════════════════════════════════════════════════════

;; ── 30. adbfs-rootless-git (#3100) ──────────────────────────────────

(define-public adbfs-rootless-git
  (package
    (name "adbfs-rootless-git")
    (version "0-277c088")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/spion/adbfs-rootless")
                    (commit "277c08840da9d0a540983a704741f2660296d492")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "07khdxgn6yxwjcij46k5aq6vr9dgcahaxsvhwld3hfsqwvjfwksk"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" (or (getenv "CXX") "g++"))
                   (string-append "CFLAGS="
                                  "-D_FILE_OFFSET_BITS=64 "
                                  "-DFUSE_USE_VERSION=26 "
                                  "-I" (assoc-ref %build-inputs "fuse")
                                  "/include/fuse "
                                  "-lfuse -lpthread"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "adbfs" bin)))))))
    (inputs (list (@ (gnu packages linux) fuse)))
    (native-inputs (list (@ (gnu packages pkg-config) pkg-config)))
    (home-page "https://github.com/spion/adbfs-rootless")
    (synopsis "FUSE filesystem over ADB for Android devices")
    (description "Adbfs-rootless is a FUSE-based filesystem that allows
mounting an Android device's storage on your computer via ADB, without
requiring root access on the Android device.  It provides transparent file
access to the device's files through the standard filesystem interface.")
    (license license:bsd-3)))
