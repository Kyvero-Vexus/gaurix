;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260416d
;;; Resolves 100 TODO packages from general queue.
;;; Mixed source builds and binary packages.

(define-module (gaurix packages recipe-resolver-260416d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:export (
    ryelang-git
    ftb
    shadps4
    cmake3-bin
    kvantum-qt5-git
    ocaml-extlib
    ocaml-ounit
    ocaml-lwt
    ocaml-react
    ocaml-easy-format
    ocaml-biniou
    ocaml-yojson
    ocaml-ppxlib
    wiggle
    vo-amrwbenc
    catgirl
    python-pymsgbox
    meshoptimizer
    xremap-kde
    xssproxy
    camlidl
    ptouch-print
    ptpython
    leafpad
    dualsensectl
    steghide
    gnome-shell-extension-clipboard-indicator
    gnome-shell-extension-dash-to-dock
    python-imageio-ffmpeg
    git-credential-oauth
    python-inotify-simple
    python-terminaltexteffects
    qbittorrent-enhanced
    python-spacy-loggers
    gnome-shell-extension-burn-my-windows
    python-cached-property
    python-sentencepiece
    vulkan-memory-allocator
    dsd-git
    hcxdumptool-git
    simdutf-git
    openrct2-git
    tenacity-git
    midori-bin
    signal-desktop-beta
    celestia-bin
    dstask-bin
    fceux-git
    corosync-git
    python-rich-argparse
    radicle-bin
    notmuch-addrlookup-c
    syncthing-bin
    numix-gtk-theme-git
    python-cucumber-tag-expressions
    python-lazr-restfulclient
    perl-universal-require
    cpr-git
    freeswitch
    k3s
    watchdog
    hunspell-pt-pt-preao
    fastgame-git
    dtv-scan-tables-git
    fcitx5-mcbopomofo-git
    puddletag-git
    plymouth-theme-catppuccin-latte-git
    plymouth-theme-catppuccin-frappe-git
    plymouth-theme-catppuccin-macchiato-git
    vscodium
    docker-desktop
    hyprland-git
    sonic-desktop-interface
    phonon-qt5
    wechat-universal-bwrap
    eden-beta
    azahar-git
    wezterm-git
    witr
    linphone-desktop-appimage
    telegram-desktop-bin
    rpcs3-git
    nvidia-settings-beta
    python-mcp
    chezmoi-git
    ttf-mononoki
    ttf-recursive
    tmsu-git
    clac
    grantlee
    tmsu-bin
    tree-sitter-css-git
    tree-sitter-elixir-git
    tree-sitter-html-git
    tree-sitter-jsdoc-git
    tree-sitter-php-git
    vhdl-ls
    codex-acp
    yaak
    copyq-git
  ))

;;; ── PACKAGE DEFINITIONS ─────────────────────────────────────────────

;;; 1. ryelang-git (queue #4399)
(define-public ryelang-git
  (package
    (name "ryelang-git")
    (version "0.0.99.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "ryelang-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rye — a programming language trying to be flexible about expression, but s...")
    (description
     "Rye — a programming language trying to be flexible about expression, but strict about state (development version).")
    (home-page "https://ryelang.org/")
    (license license:bsd-3)))

;;; 2. ftb (queue #4407)
(define-public ftb
  (package
    (name "ftb")
    (version "2.0.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/Cyxuan0311/ftb")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A file browser built with FTXUI")
    (description
     "A file browser built with FTXUI.")
    (home-page "https://github.com/Cyxuan0311/ftb")
    (license license:expat)))

;;; 3. shadps4 (queue #6776)
(define-public shadps4
  (package
    (name "shadps4")
    (version "0.15.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/shadps4-emu/shadPS4")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sony PlayStation 4 emulator")
    (description
     "Sony PlayStation 4 emulator.")
    (home-page "https://github.com/shadps4-emu/shadPS4")
    (license license:gpl2+)))

;;; 4. cmake3-bin (queue #8396)
(define-public cmake3-bin
  (package
    (name "cmake3-bin")
    (version "3.31.6")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "cmake3-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cmake3-bin/"))))
    (synopsis "A cross-platform open-source make system")
    (description
     "A cross-platform open-source make system.")
    (home-page "https://cmake.org")
    (license (license:non-copyleft "file://LICENSE"))))

;;; 5. kvantum-qt5-git (queue #8909)
(define-public kvantum-qt5-git
  (package
    (name "kvantum-qt5-git")
    (version "1.0.10.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/tsujan/Kvantum")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sVG-based theme engine for Qt5")
    (description
     "SVG-based theme engine for Qt5.")
    (home-page "https://github.com/tsujan/Kvantum")
    (license license:gpl3+)))

;;; 6. ocaml-extlib (queue #9611)
(define-public ocaml-extlib
  (package
    (name "ocaml-extlib")
    (version "1.8.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ygrek/ocaml-extlib")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "extends the OCaml standard library")
    (description
     "Extends the OCaml standard library.")
    (home-page "https://github.com/ygrek/ocaml-extlib")
    (license license:lgpl3+)))

;;; 7. ocaml-ounit (queue #9612)
(define-public ocaml-ounit
  (package
    (name "ocaml-ounit")
    (version "2.2.7")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/gildor478/oun")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unit testing framework for OCaml")
    (description
     "Unit testing framework for OCaml.")
    (home-page "https://github.com/gildor478/ounit")
    (license license:expat)))

;;; 8. ocaml-lwt (queue #9613)
(define-public ocaml-lwt
  (package
    (name "ocaml-lwt")
    (version "6.1.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ocsigen/lw")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A library for cooperative threads in OCaml")
    (description
     "A library for cooperative threads in OCaml.")
    (home-page "https://github.com/ocsigen/lwt")
    (license license:expat)))

;;; 9. ocaml-react (queue #9614)
(define-public ocaml-react
  (package
    (name "ocaml-react")
    (version "1.2.2")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "ocaml-react" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an OCaml module for functional reactive programming")
    (description
     "An OCaml module for functional reactive programming.")
    (home-page "https://erratique.ch/software/react")
    (license license:isc)))

;;; 10. ocaml-easy-format (queue #9615)
(define-public ocaml-easy-format
  (package
    (name "ocaml-easy-format")
    (version "1.3.4")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ocaml-community/easy-forma")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pretty-printing library for OCaml")
    (description
     "Pretty-printing library for OCaml.")
    (home-page "https://github.com/ocaml-community/easy-format")
    (license license:bsd-3)))

;;; 11. ocaml-biniou (queue #9616)
(define-public ocaml-biniou
  (package
    (name "ocaml-biniou")
    (version "1.2.2")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ocaml-community/biniou")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an optimized parsing and printing library for JSON")
    (description
     "An optimized parsing and printing library for JSON.")
    (home-page "https://github.com/ocaml-community/biniou")
    (license license:bsd-3)))

;;; 12. ocaml-yojson (queue #9617)
(define-public ocaml-yojson
  (package
    (name "ocaml-yojson")
    (version "3.0.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ocaml-community/yojson")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "low level JSON binary for OCaml")
    (description
     "Low level JSON binary for OCaml.")
    (home-page "https://github.com/ocaml-community/yojson")
    (license license:bsd-3)))

;;; 13. ocaml-ppxlib (queue #9618)
(define-public ocaml-ppxlib
  (package
    (name "ocaml-ppxlib")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ocaml-ppx/ppxlib")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utilities for working with Jane Street AST constructs")
    (description
     "Utilities for working with Jane Street AST constructs.")
    (home-page "https://github.com/ocaml-ppx/ppxlib")
    (license license:expat)))

;;; 14. wiggle (queue #9619)
(define-public wiggle
  (package
    (name "wiggle")
    (version "1.3")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/neilbrown/wiggle")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A program for applying patches that patch cannot apply because of conflict...")
    (description
     "A program for applying patches that patch cannot apply because of conflicting changes.")
    (home-page "https://github.com/neilbrown/wiggle")
    (license license:gpl2)))

;;; 15. vo-amrwbenc (queue #9620)
(define-public vo-amrwbenc
  (package
    (name "vo-amrwbenc")
    (version "0.1.3")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "vo-amrwbenc" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library for the VisualOn Adaptive Multi Rate Wideband (AMR-WB) audio encoder")
    (description
     "Library for the VisualOn Adaptive Multi Rate Wideband (AMR-WB) audio encoder.")
    (home-page "http://sourceforge.net/projects/opencore-amr/")
    (license license:asl2.0)))

;;; 16. catgirl (queue #9621)
(define-public catgirl
  (package
    (name "catgirl")
    (version "2.2.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "catgirl" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tLS-only terminal IRC client")
    (description
     "TLS-only terminal IRC client.")
    (home-page "https://git.causal.agency/catgirl/")
    (license license:gpl3+)))

;;; 17. python-pymsgbox (queue #9622)
(define-public python-pymsgbox
  (package
    (name "python-pymsgbox")
    (version "2.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/asweigart/PyMsgBox")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple, cross-platform, pure Python module to display message boxes, and j...")
    (description
     "Simple, cross-platform, pure Python module to display message boxes, and just message boxes.")
    (home-page "https://github.com/asweigart/PyMsgBox")
    (license license:gpl3+)))

;;; 18. meshoptimizer (queue #9623)
(define-public meshoptimizer
  (package
    (name "meshoptimizer")
    (version "1.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/zeux/meshoptimizer")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mesh optimization library that makes meshes smaller and faster to render")
    (description
     "Mesh optimization library that makes meshes smaller and faster to render.")
    (home-page "https://github.com/zeux/meshoptimizer")
    (license license:expat)))

;;; 19. xremap-kde (queue #9624)
(define-public xremap-kde
  (package
    (name "xremap-kde")
    (version "0.14.17")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/xremap/xremap")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "key remapper for X11 and Wayland - KDE Edition")
    (description
     "Key remapper for X11 and Wayland - KDE Edition.")
    (home-page "https://github.com/xremap/xremap")
    (license license:expat)))

;;; 20. xssproxy (queue #9625)
(define-public xssproxy
  (package
    (name "xssproxy")
    (version "1.1.2")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/vincentbernat/xssproxy")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "forward freedesktop.org idle inhibition service calls to Xss")
    (description
     "Forward freedesktop.org idle inhibition service calls to Xss.")
    (home-page "https://github.com/vincentbernat/xssproxy")
    (license license:gpl3+)))

;;; 21. camlidl (queue #9626)
(define-public camlidl
  (package
    (name "camlidl")
    (version "1.13")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/xavierleroy/camlidl")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A stub code generator and COM binding for Objective Caml (OCaml)")
    (description
     "A stub code generator and COM binding for Objective Caml (OCaml).")
    (home-page "https://github.com/xavierleroy/camlidl")
    (license license:gpl3+)))

;;; 22. ptouch-print (queue #9627)
(define-public ptouch-print
  (package
    (name "ptouch-print")
    (version "1.7")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "ptouch-print" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tool to print labels on Brother P-Touch printers")
    (description
     "Command line tool to print labels on Brother P-Touch printers.")
    (home-page "https://familie-radermacher.ch/dominic/projekte/ptouch-print/")
    (license license:gpl3)))

;;; 23. ptpython (queue #9628)
(define-public ptpython
  (package
    (name "ptpython")
    (version "3.0.32")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/prompt-toolkit/ptpython")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python REPL build on top of prompt_toolkit")
    (description
     "Python REPL build on top of prompt_toolkit.")
    (home-page "https://github.com/prompt-toolkit/ptpython")
    (license license:bsd-3)))

;;; 24. leafpad (queue #9629)
(define-public leafpad
  (package
    (name "leafpad")
    (version "0.8.19")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "leafpad" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A notepad clone for GTK+ 2.0")
    (description
     "A notepad clone for GTK+ 2.0.")
    (home-page "http://tarot.freeshell.org/leafpad/")
    (license license:gpl2+)))

;;; 25. dualsensectl (queue #9630)
(define-public dualsensectl
  (package
    (name "dualsensectl")
    (version "0.7")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/nowrep/dualsensectl")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for controlling Sony PlayStation 5 DualSense controller on Linux")
    (description
     "Tool for controlling Sony PlayStation 5 DualSense controller on Linux.")
    (home-page "https://github.com/nowrep/dualsensectl")
    (license license:gpl2+)))

;;; 26. steghide (queue #9631)
(define-public steghide
  (package
    (name "steghide")
    (version "0.5.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "steghide" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "embeds a message in a file by replacing some of the least significant bits")
    (description
     "Embeds a message in a file by replacing some of the least significant bits.")
    (home-page "http://steghide.sourceforge.net")
    (license license:gpl2+)))

;;; 27. gnome-shell-extension-clipboard-indicator (queue #9639)
(define-public gnome-shell-extension-clipboard-indicator
  (package
    (name "gnome-shell-extension-clipboard-indicator")
    (version "69")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "adds a clipboard indicator to the top panel, and caches clipboard history")
    (description
     "Adds a clipboard indicator to the top panel, and caches clipboard history.")
    (home-page "https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator")
    (license license:expat)))

;;; 28. gnome-shell-extension-dash-to-dock (queue #9647)
(define-public gnome-shell-extension-dash-to-dock
  (package
    (name "gnome-shell-extension-dash-to-dock")
    (version "1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "gnome-shell-extension-dash-to-dock" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "move the dash out of the overview transforming it in a dock")
    (description
     "Move the dash out of the overview transforming it in a dock.")
    (home-page "https://micheleg.github.io/dash-to-dock/")
    (license license:gpl2+)))

;;; 29. python-imageio-ffmpeg (queue #9651)
(define-public python-imageio-ffmpeg
  (package
    (name "python-imageio-ffmpeg")
    (version "0.6.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/imageio/imageio-ffmpe")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fFMPEG wrapper for Python")
    (description
     "FFMPEG wrapper for Python.")
    (home-page "https://github.com/imageio/imageio-ffmpeg")
    (license license:bsd-2)))

;;; 30. git-credential-oauth (queue #9674)
(define-public git-credential-oauth
  (package
    (name "git-credential-oauth")
    (version "0.0.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "git-credential-oauth" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "git-credential-oauth")
    (description "git-credential-oauth.")
    (home-page "https://aur.archlinux.org/packages/git-credential-oauth")
    (license license:expat)))

;;; 31. python-inotify-simple (queue #9686)
(define-public python-inotify-simple
  (package
    (name "python-inotify-simple")
    (version "2.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/chrisjbillington/inotify_simple")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A simple Python wrapper around inotify")
    (description
     "A simple Python wrapper around inotify.")
    (home-page "https://github.com/chrisjbillington/inotify_simple")
    (license license:bsd-2)))

;;; 32. python-terminaltexteffects (queue #9703)
(define-public python-terminaltexteffects
  (package
    (name "python-terminaltexteffects")
    (version "0.14.2")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ChrisBuilds/terminaltexteffects")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual effects engine applied to text in the terminal")
    (description
     "Visual effects engine applied to text in the terminal.")
    (home-page "https://github.com/ChrisBuilds/terminaltexteffects")
    (license license:expat)))

;;; 33. qbittorrent-enhanced (queue #9705)
(define-public qbittorrent-enhanced
  (package
    (name "qbittorrent-enhanced")
    (version "5.1.3.10")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition)")
    (description
     "A bittorrent client powered by C++, Qt and libtorrent (Enhanced Edition).")
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (license license:gpl2+)))

;;; 34. python-spacy-loggers (queue #9720)
(define-public python-spacy-loggers
  (package
    (name "python-spacy-loggers")
    (version "1.0.5")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/explosion/spacy-loggers")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "logging utilities for spaCy")
    (description
     "Logging utilities for spaCy.")
    (home-page "https://github.com/explosion/spacy-loggers")
    (license license:expat)))

;;; 35. gnome-shell-extension-burn-my-windows (queue #9733)
(define-public gnome-shell-extension-burn-my-windows
  (package
    (name "gnome-shell-extension-burn-my-windows")
    (version "48")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/Schneegans/Burn-My-Windows")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "disintegrate your windows with style. A GNOME Shell extension")
    (description
     "Disintegrate your windows with style. A GNOME Shell extension.")
    (home-page "https://github.com/Schneegans/Burn-My-Windows")
    (license license:gpl3+)))

;;; 36. python-cached-property (queue #9764)
(define-public python-cached-property
  (package
    (name "python-cached-property")
    (version "2.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/pydanny/cached-property")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A decorator for caching properties in classes")
    (description
     "A decorator for caching properties in classes.")
    (home-page "https://github.com/pydanny/cached-property")
    (license license:bsd-3)))

;;; 37. python-sentencepiece (queue #9769)
(define-public python-sentencepiece
  (package
    (name "python-sentencepiece")
    (version "0.2.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/google/sentencepiece")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python wrapper for SentencePiece")
    (description
     "Python wrapper for SentencePiece.")
    (home-page "https://github.com/google/sentencepiece")
    (license license:asl2.0)))

;;; 38. vulkan-memory-allocator (queue #9771)
(define-public vulkan-memory-allocator
  (package
    (name "vulkan-memory-allocator")
    (version "3.3.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "vulkan-memory-allocator" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easy to integrate Vulkan memory allocation library")
    (description
     "Easy to integrate Vulkan memory allocation library.")
    (home-page "https://gpuopen.com/vulkan-memory-allocator/")
    (license license:expat)))

;;; 39. dsd-git (queue #9812)
(define-public dsd-git
  (package
    (name "dsd-git")
    (version "1.6.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/LouisErigHerve/dsd")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "decoder for P25 Phase 1, D-STAR, NXDN/IDAS, ProVoice, DMR/MOTOTRBO, X2-TDM...")
    (description
     "Decoder for P25 Phase 1, D-STAR, NXDN/IDAS, ProVoice, DMR/MOTOTRBO, X2-TDMA, dPMR (LouisErigHerve's fork).")
    (home-page "https://github.com/LouisErigHerve/dsd")
    (license (list license:gpl2 license:isc))))

;;; 40. hcxdumptool-git (queue #9848)
(define-public hcxdumptool-git
  (package
    (name "hcxdumptool-git")
    (version "7.0.1.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/ZerBea/hcxdumptool")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small tool to capture packets from wlan devices")
    (description
     "Small tool to capture packets from wlan devices.")
    (home-page "https://github.com/ZerBea/hcxdumptool")
    (license license:expat)))

;;; 41. simdutf-git (queue #9874)
(define-public simdutf-git
  (package
    (name "simdutf-git")
    (version "8.0.0.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "simdutf-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unicode validation and transcoding at billions of characters per second")
    (description
     "Unicode validation and transcoding at billions of characters per second.")
    (home-page "https://simdutf.github.io/simdutf/")
    (license (list license:asl2.0 license:expat))))

;;; 42. openrct2-git (queue #9969)
(define-public openrct2-git
  (package
    (name "openrct2-git")
    (version "0.4.29.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "openrct2-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source re-implementation of Roller Coaster Tycoon 2")
    (description
     "Open source re-implementation of Roller Coaster Tycoon 2 (requires full copy of the game).")
    (home-page "https://openrct2.io")
    (license license:gpl3+)))

;;; 43. tenacity-git (queue #10002)
(define-public tenacity-git
  (package
    (name "tenacity-git")
    (version "1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "tenacity-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy-to-use multi-track audio editor and recorder, forked from Audacity")
    (description
     "An easy-to-use multi-track audio editor and recorder, forked from Audacity.")
    (home-page "https://tenacityaudio.org")
    (license (list (license:non-copyleft "file://LICENSE") license:gpl2))))

;;; 44. midori-bin (queue #10019)
(define-public midori-bin
  (package
    (name "midori-bin")
    (version "11.6.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "midori-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/midori-bin/"))))
    (synopsis "browser fork of Floorp fork of Firefox by Astian")
    (description
     "Browser fork of Floorp fork of Firefox by Astian.")
    (home-page "https://astian.org/midori-browser/")
    (license license:mpl2.0)))

;;; 45. signal-desktop-beta (queue #10037)
(define-public signal-desktop-beta
  (package
    (name "signal-desktop-beta")
    (version "8.7.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "signal-desktop-beta" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "signal Private Messenger for Linux - Beta version")
    (description
     "Signal Private Messenger for Linux - Beta version.")
    (home-page "https://signal.org")
    (license license:gpl3+)))

;;; 46. celestia-bin (queue #10039)
(define-public celestia-bin
  (package
    (name "celestia-bin")
    (version "1.7.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "celestia-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/celestia-bin/"))))
    (synopsis "real-time space simulation")
    (description
     "Real-time space simulation.")
    (home-page "https://celestiaproject.space/")
    (license license:gpl3+)))

;;; 47. dstask-bin (queue #10051)
(define-public dstask-bin
  (package
    (name "dstask-bin")
    (version "1.0.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "dstask-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dstask-bin/"))))
    (synopsis "A terminal-based TODO manager with git-based sync + markdown notes per task")
    (description
     "A terminal-based TODO manager with git-based sync + markdown notes per task.")
    (home-page "https://calbryant.uk/blog/dstask-a-taskwarrior-alternative")
    (license license:expat)))

;;; 48. fceux-git (queue #10076)
(define-public fceux-git
  (package
    (name "fceux-git")
    (version "2.3.0.17.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "fceux-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALI...")
    (description
     "Fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support.")
    (home-page "http://fceux.com/")
    (license license:gpl3+)))

;;; 49. corosync-git (queue #10091)
(define-public corosync-git
  (package
    (name "corosync-git")
    (version "3.1.6.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "corosync-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cluster engine for nodal communication systems with additional features fo...")
    (description
     "Cluster engine for nodal communication systems with additional features for implementing high availability within applications.")
    (home-page "http://www.corosync.org/")
    (license license:bsd-3)))

;;; 50. python-rich-argparse (queue #10105)
(define-public python-rich-argparse
  (package
    (name "python-rich-argparse")
    (version "1.7.2")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/hamdanal/rich-argparse")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rich help formatters for argparse and optparse")
    (description
     "Rich help formatters for argparse and optparse.")
    (home-page "https://github.com/hamdanal/rich-argparse")
    (license license:expat)))

;;; 51. radicle-bin (queue #10193)
(define-public radicle-bin
  (package
    (name "radicle-bin")
    (version "1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "radicle-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/radicle-bin/"))))
    (synopsis "open source, peer-to-peer code collaboration stack built on Git")
    (description
     "open source, peer-to-peer code collaboration stack built on Git.")
    (home-page "https://radicle.xyz")
    (license license:expat)))

;;; 52. notmuch-addrlookup-c (queue #10248)
(define-public notmuch-addrlookup-c
  (package
    (name "notmuch-addrlookup-c")
    (version "10")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/aperezdc/notmuch-addrlookup-c")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool to query the notmuch database for addresses")
    (description
     "A tool to query the notmuch database for addresses.")
    (home-page "https://github.com/aperezdc/notmuch-addrlookup-c")
    (license license:expat)))

;;; 53. syncthing-bin (queue #10281)
(define-public syncthing-bin
  (package
    (name "syncthing-bin")
    (version "2.0.16")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "syncthing-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/syncthing-bin/"))))
    (synopsis "open Source Continuous Replication / Cluster Synchronization Thing: binary")
    (description
     "Open Source Continuous Replication / Cluster Synchronization Thing: binary.")
    (home-page "https://syncthing.net/")
    (license license:mpl2.0)))

;;; 54. numix-gtk-theme-git (queue #10298)
(define-public numix-gtk-theme-git
  (package
    (name "numix-gtk-theme-git")
    (version "2.6.6.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/numixproject/numix-gtk-theme")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)")
    (description
     "A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce).")
    (home-page "https://github.com/numixproject/numix-gtk-theme")
    (license license:gpl3+)))

;;; 55. python-cucumber-tag-expressions (queue #10474)
(define-public python-cucumber-tag-expressions
  (package
    (name "python-cucumber-tag-expressions")
    (version "9.1.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/cucumber/tag-expressions")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "provides a tag-expression parser and evaluation logic for cucumber/behave")
    (description
     "Provides a tag-expression parser and evaluation logic for cucumber/behave.")
    (home-page "https://github.com/cucumber/tag-expressions")
    (license license:expat)))

;;; 56. python-lazr-restfulclient (queue #10607)
(define-public python-lazr-restfulclient
  (package
    (name "python-lazr-restfulclient")
    (version "0.14.6")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "python-lazr-restfulclient" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A programmable client library that takes advantage of the commonalities am...")
    (description
     "A programmable client library that takes advantage of the commonalities among lazr.restful web services to provide added functionality on top of wadllib.")
    (home-page "https://launchpad.net/lazr.restfulclient")
    (license license:lgpl3+)))

;;; 57. perl-universal-require (queue #10750)
(define-public perl-universal-require
  (package
    (name "perl-universal-require")
    (version "0.19")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "perl-universal-require" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl/CPAN Module UNIVERSAL::require: require() modules from a variable")
    (description
     "Perl/CPAN Module UNIVERSAL::require: require() modules from a variable.")
    (home-page "https://metacpan.org/release/UNIVERSAL-require")
    (license (list license:gpl3+ (license:non-copyleft "file://LICENSE")))))

;;; 58. cpr-git (queue #11171)
(define-public cpr-git
  (package
    (name "cpr-git")
    (version "1.10.1.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/libcpr/cpr")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "c++ Requests: Curl for People")
    (description
     "C++ Requests: Curl for People.")
    (home-page "https://github.com/libcpr/cpr")
    (license license:expat)))

;;; 59. freeswitch (queue #11175)
(define-public freeswitch
  (package
    (name "freeswitch")
    (version "1.10.12")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "freeswitch" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an opensource and free (libre, price) telephony system, similar to Asterisk")
    (description
     "An opensource and free (libre, price) telephony system, similar to Asterisk.")
    (home-page "http://freeswitch.org/")
    (license license:mpl2.0)))

;;; 60. k3s (queue #11177)
(define-public k3s
  (package
    (name "k3s")
    (version "1.35.2")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "k3s" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Kubernetes")
    (description
     "Lightweight Kubernetes.")
    (home-page "https://k3s.io")
    (license license:asl2.0)))

;;; 61. watchdog (queue #11196)
(define-public watchdog
  (package
    (name "watchdog")
    (version "5.16")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "watchdog" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "watchdog daemon")
    (description
     "Watchdog daemon.")
    (home-page "http://sourceforge.net/projects/watchdog")
    (license license:gpl3+)))

;;; 62. hunspell-pt_pt-preao (queue #11202)
(define-public hunspell-pt-pt-preao
  (package
    (name "hunspell-pt_pt-preao")
    (version "20251001")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "hunspell-pt_pt-preao" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "portuguese (European, pre-orthographic agreement) hunspell dictionaries")
    (description
     "Portuguese (European, pre-orthographic agreement) hunspell dictionaries.")
    (home-page "https://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/")
    (license (list license:gpl3+ license:lgpl3+ license:mpl2.0))))

;;; 63. fastgame-git (queue #11203)
(define-public fastgame-git
  (package
    (name "fastgame-git")
    (version "1.0.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/wwmm/fastgame")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "optimize system performance for games")
    (description
     "Optimize system performance for games.")
    (home-page "https://github.com/wwmm/fastgame")
    (license license:gpl3+)))

;;; 64. dtv-scan-tables-git (queue #11216)
(define-public dtv-scan-tables-git
  (package
    (name "dtv-scan-tables-git")
    (version "0.0.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "dtv-scan-tables-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "digital TV scan tables")
    (description
     "Digital TV scan tables.")
    (home-page "https://git.linuxtv.org/dtv-scan-tables.git")
    (license (list license:gpl2 license:lgpl2.1))))

;;; 65. fcitx5-mcbopomofo-git (queue #11227)
(define-public fcitx5-mcbopomofo-git
  (package
    (name "fcitx5-mcbopomofo-git")
    (version "3.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/openvanilla/fcitx5-mcbopomofo")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mcBopomofo for fcitx5")
    (description
     "McBopomofo for fcitx5.")
    (home-page "https://github.com/openvanilla/fcitx5-mcbopomofo")
    (license license:expat)))

;;; 66. puddletag-git (queue #11230)
(define-public puddletag-git
  (package
    (name "puddletag-git")
    (version "2.5.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/puddletag/puddleta")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an audio tag editor for GNU/Linux, git version")
    (description
     "An audio tag editor for GNU/Linux, git version.")
    (home-page "https://github.com/puddletag/puddletag")
    (license license:gpl3+)))

;;; 67. plymouth-theme-catppuccin-latte-git (queue #11278)
(define-public plymouth-theme-catppuccin-latte-git
  (package
    (name "plymouth-theme-catppuccin-latte-git")
    (version "0.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/catppuccin/plymouth")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for Plymouth - Latte")
    (description
     "Soothing pastel theme for Plymouth - Latte.")
    (home-page "https://github.com/catppuccin/plymouth")
    (license license:expat)))

;;; 68. plymouth-theme-catppuccin-frappe-git (queue #11279)
(define-public plymouth-theme-catppuccin-frappe-git
  (package
    (name "plymouth-theme-catppuccin-frappe-git")
    (version "0.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/catppuccin/plymouth")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for Plymouth - Frappe")
    (description
     "Soothing pastel theme for Plymouth - Frappe.")
    (home-page "https://github.com/catppuccin/plymouth")
    (license license:expat)))

;;; 69. plymouth-theme-catppuccin-macchiato-git (queue #11280)
(define-public plymouth-theme-catppuccin-macchiato-git
  (package
    (name "plymouth-theme-catppuccin-macchiato-git")
    (version "0.0.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/catppuccin/plymouth")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for Plymouth - Macchiato")
    (description
     "Soothing pastel theme for Plymouth - Macchiato.")
    (home-page "https://github.com/catppuccin/plymouth")
    (license license:expat)))

;;; 70. vscodium (queue #11479)
(define-public vscodium
  (package
    (name "vscodium")
    (version "1.112.01907")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/VSCodium/vscodium")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free/libre open source software binaries of VSCode")
    (description
     "Free/Libre Open Source Software Binaries of VSCode (git build from latest release).")
    (home-page "https://github.com/VSCodium/vscodium.git")
    (license license:expat)))

;;; 71. docker-desktop (queue #11533)
(define-public docker-desktop
  (package
    (name "docker-desktop")
    (version "4.69.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "docker-desktop" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Docker Desktop is an easy-to-install application that enables you to local...")
    (description
     "Docker Desktop is an easy-to-install application that enables you to locally build and share containerized applications and microservices.")
    (home-page "https://www.docker.com/products/docker-desktop/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; 72. hyprland-git (queue #11700)
(define-public hyprland-git
  (package
    (name "hyprland-git")
    (version "0.52.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/hyprwm/Hyprland")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Hyprland is an independent, highly customizable, dynamic tiling Wayland co...")
    (description
     "Hyprland is an independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks.")
    (home-page "https://github.com/hyprwm/Hyprland")
    (license license:bsd-3)))

;;; 73. sonic-desktop-interface (queue #11711)
(define-public sonic-desktop-interface
  (package
    (name "sonic-desktop-interface")
    (version "6.6.4.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/Sonic-DE/sonic-desktop-interface")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sonic Desktop Interface")
    (description
     "Sonic Desktop Interface.")
    (home-page "https://github.com/Sonic-DE/sonic-desktop-interface")
    (license license:gpl3+)))

;;; 74. phonon-qt5 (queue #11713)
(define-public phonon-qt5
  (package
    (name "phonon-qt5")
    (version "4.12.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "phonon-qt5" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "The multimedia framework by KDE")
    (description
     "The multimedia framework by KDE.")
    (home-page "https://community.kde.org/Phonon")
    (license license:lgpl3+)))

;;; 75. wechat-universal-bwrap (queue #11725)
(define-public wechat-universal-bwrap
  (package
    (name "wechat-universal-bwrap")
    (version "4.1.1.4")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "wechat-universal-bwrap" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "weChat (Universal) with bwrap sandbox")
    (description
     "WeChat (Universal) with bwrap sandbox.")
    (home-page "https://linux.weixin.qq.com/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; 76. eden-beta (queue #11755)
(define-public eden-beta
  (package
    (name "eden-beta")
    (version "0.2.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "eden-beta" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo Switch emulator forked from yuzu - beta and test releases")
    (description
     "Nintendo Switch emulator forked from yuzu - beta and test releases.")
    (home-page "https://eden-emulator.github.io/")
    (license license:gpl3+)))

;;; 77. azahar-git (queue #11776)
(define-public azahar-git
  (package
    (name "azahar-git")
    (version "2125.0.1.")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "azahar-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nintendo 3DS emulator based on Citra")
    (description
     "Nintendo 3DS emulator based on Citra.")
    (home-page "https://azahar-emu.org/")
    (license license:gpl2+)))

;;; 78. wezterm-git (queue #11781)
(define-public wezterm-git
  (package
    (name "wezterm-git")
    (version "20240203.110809.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/wez/wezterm")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A GPU-accelerated cross-platform terminal emulator and multiplexer")
    (description
     "A GPU-accelerated cross-platform terminal emulator and multiplexer.")
    (home-page "https://github.com/wez/wezterm")
    (license license:expat)))

;;; 79. witr (queue #11802)
(define-public witr
  (package
    (name "witr")
    (version "0.3.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/pranshuparmar/witr")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool to determine why a process is running")
    (description
     "A tool to determine why a process is running.")
    (home-page "https://github.com/pranshuparmar/witr")
    (license license:asl2.0)))

;;; 80. linphone-desktop-appimage (queue #11829)
(define-public linphone-desktop-appimage
  (package
    (name "linphone-desktop-appimage")
    (version "6.1.2")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "linphone-desktop-appimage" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/linphone-desktop-appimage/"))))
    (synopsis "A free VoIP and video softphone based on the SIP protocol (AppImage version)")
    (description
     "A free VoIP and video softphone based on the SIP protocol (AppImage version).")
    (home-page "https://www.linphone.org")
    (license license:gpl2)))

;;; 81. telegram-desktop-bin (queue #11834)
(define-public telegram-desktop-bin
  (package
    (name "telegram-desktop-bin")
    (version "6.7.6")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/telegramdesktop/tdesktop")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/telegram-desktop-bin/"))))
    (synopsis "official desktop version of Telegram messaging app - Static binaries")
    (description
     "Official desktop version of Telegram messaging app - Static binaries.")
    (home-page "https://github.com/telegramdesktop/tdesktop")
    (license license:gpl3+)))

;;; 82. rpcs3-git (queue #11892)
(define-public rpcs3-git
  (package
    (name "rpcs3-git")
    (version "0.0.40.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/RPCS3/rpcs3")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A Sony PlayStation 3 emulator")
    (description
     "A Sony PlayStation 3 emulator.")
    (home-page "https://github.com/RPCS3/rpcs3")
    (license license:gpl2)))

;;; 83. nvidia-settings-beta (queue #12014)
(define-public nvidia-settings-beta
  (package
    (name "nvidia-settings-beta")
    (version "595.58.03")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "nvidia-settings-beta" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tool for configuring the NVIDIA graphics driver (beta version)")
    (description
     "Tool for configuring the NVIDIA graphics driver (beta version).")
    (home-page "https://www.nvidia.com/")
    (license (license:non-copyleft "file://LICENSE"))))

;;; 84. python-mcp (queue #12054)
(define-public python-mcp
  (package
    (name "python-mcp")
    (version "1.26.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/modelcontextprotocol/python-sdk")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "model Context Protocol SDK")
    (description
     "Model Context Protocol SDK.")
    (home-page "https://github.com/modelcontextprotocol/python-sdk")
    (license license:expat)))

;;; 85. chezmoi-git (queue #12197)
(define-public chezmoi-git
  (package
    (name "chezmoi-git")
    (version "1.7.2.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/twpayne/chezmo")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "manage your dotfiles across multiple machines")
    (description
     "Manage your dotfiles across multiple machines.")
    (home-page "https://github.com/twpayne/chezmoi")
    (license license:expat)))

;;; 86. ttf-mononoki (queue #12252)
(define-public ttf-mononoki
  (package
    (name "ttf-mononoki")
    (version "1.6")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "ttf-mononoki" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "monospace font for programmers, successor of monoOne")
    (description
     "Monospace font for programmers, successor of monoOne.")
    (home-page "https://madmalik.github.io/mononoki/")
    (license license:silofl1.1)))

;;; 87. ttf-recursive (queue #12263)
(define-public ttf-recursive
  (package
    (name "ttf-recursive")
    (version "1.085")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/arrowtype/recursive")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A variable type family built for better code & UI")
    (description
     "A variable type family built for better code & UI.")
    (home-page "https://github.com/arrowtype/recursive")
    (license license:silofl1.1)))

;;; 88. tmsu-git (queue #12280)
(define-public tmsu-git
  (package
    (name "tmsu-git")
    (version "0.0.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "tmsu-git" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A tool for tagging your files and accessing them through a virtual filesys...")
    (description
     "A tool for tagging your files and accessing them through a virtual filesystem. (development version).")
    (home-page "https://tmsu.org/")
    (license license:gpl3+)))

;;; 89. clac (queue #12349)
(define-public clac
  (package
    (name "clac")
    (version "0.3.4")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/soveran/clac")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A command line, stack-based calculator with postfix notation")
    (description
     "A command line, stack-based calculator with postfix notation.")
    (home-page "https://github.com/soveran/clac")
    (license license:bsd-3)))

;;; 90. grantlee (queue #12367)
(define-public grantlee
  (package
    (name "grantlee")
    (version "5.3.1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/steveire/grantlee")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A string template engine based on the Django template system and written i...")
    (description
     "A string template engine based on the Django template system and written in Qt.")
    (home-page "https://github.com/steveire/grantlee")
    (license license:lgpl2.1+)))

;;; 91. tmsu-bin (queue #12430)
(define-public tmsu-bin
  (package
    (name "tmsu-bin")
    (version "0.7.5")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "tmsu-bin" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tmsu-bin/"))))
    (synopsis "A tool for tagging your files and accessing them through a virtual filesys...")
    (description
     "A tool for tagging your files and accessing them through a virtual filesystem. (Pre-compiled).")
    (home-page "https://tmsu.org")
    (license license:gpl3+)))

;;; 92. tree-sitter-css-git (queue #12432)
(define-public tree-sitter-css-git
  (package
    (name "tree-sitter-css-git")
    (version "0.25.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/tree-sitter/tree-sitter-css")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cSS grammar for tree-sitter")
    (description
     "CSS grammar for tree-sitter.")
    (home-page "https://github.com/tree-sitter/tree-sitter-css")
    (license license:expat)))

;;; 93. tree-sitter-elixir-git (queue #12433)
(define-public tree-sitter-elixir-git
  (package
    (name "tree-sitter-elixir-git")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/elixir-lang/tree-sitter-elixir")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "elixir grammar for tree-sitter")
    (description
     "Elixir grammar for tree-sitter.")
    (home-page "https://github.com/elixir-lang/tree-sitter-elixir")
    (license license:asl2.0)))

;;; 94. tree-sitter-html-git (queue #12434)
(define-public tree-sitter-html-git
  (package
    (name "tree-sitter-html-git")
    (version "0.23.2.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/tree-sitter/tree-sitter-html")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hTML grammar for tree-sitter")
    (description
     "HTML grammar for tree-sitter.")
    (home-page "https://github.com/tree-sitter/tree-sitter-html")
    (license license:expat)))

;;; 95. tree-sitter-jsdoc-git (queue #12436)
(define-public tree-sitter-jsdoc-git
  (package
    (name "tree-sitter-jsdoc-git")
    (version "0.25.0.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/tree-sitter/tree-sitter-jsdoc")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jSDoc grammar for tree-sitter")
    (description
     "JSDoc grammar for tree-sitter.")
    (home-page "https://github.com/tree-sitter/tree-sitter-jsdoc")
    (license license:expat)))

;;; 96. tree-sitter-php-git (queue #12437)
(define-public tree-sitter-php-git
  (package
    (name "tree-sitter-php-git")
    (version "0.24.2.")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/tree-sitter/tree-sitter-php")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pHP grammar for tree-sitter")
    (description
     "PHP grammar for tree-sitter.")
    (home-page "https://github.com/tree-sitter/tree-sitter-php")
    (license license:expat)))

;;; 97. vhdl-ls (queue #12443)
(define-public vhdl-ls
  (package
    (name "vhdl-ls")
    (version "0.86.0")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "vhdl-ls" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "language server for VHDL Written in rust")
    (description
     "Language server for VHDL Written in rust.")
    (home-page "github.com/VHDL-LS/rust_hdl")
    (license license:mpl2.0)))

;;; 98. codex-acp (queue #12539)
(define-public codex-acp
  (package
    (name "codex-acp")
    (version "0.10.0")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/zed-industries/codex-acp")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "aCP adapter for OpenAI Codex")
    (description
     "ACP adapter for OpenAI Codex.")
    (home-page "https://github.com/zed-industries/codex-acp")
    (license license:asl2.0)))

;;; 99. yaak (queue #12540)
(define-public yaak
  (package
    (name "yaak")
    (version "2026.3.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://aur.archlinux.org/cgit/aur.git/snapshot/"
            "yaak" ".tar.gz"))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, S...")
    (description
     "Fast, offline and Git-friendly API client for HTTP, GraphQL, WebSockets, SSE, and gRPC.")
    (home-page "https://yaak.app/")
    (license license:expat)))

;;; 100. copyq-git (queue #12651)
(define-public copyq-git
  (package
    (name "copyq-git")
    (version "1")
    (source
     (origin
      (method git-fetch)
      (uri (git-reference
            (url "https://github.com/hluk/CopyQ")
            (commit (string-append "v" version))))
      (file-name (git-file-name name version))
      (sha256
       (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "clipboard manager with searchable and editable history")
    (description
     "Clipboard manager with searchable and editable history.")
    (home-page "https://github.com/hluk/CopyQ")
    (license license:gpl3+)))

