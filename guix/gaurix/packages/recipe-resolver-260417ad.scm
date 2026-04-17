;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ad
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; Recipes (24):
;;;    1. typioca-bin (copy/binary, v3.1.0, MIT)
;;;    2. lutgen-bin (copy/binary, v1.0.1, MIT)
;;;    3. gibo-bin (copy/binary, v3.0.20, Unlicense)
;;;    4. pet-bin (copy/binary, v1.0.1, MIT)
;;;    5. picocrypt-bin (copy/binary, v1.49, GPL-3.0)
;;;    6. tone-bin (copy/binary, v0.2.5, Apache-2.0)
;;;    7. qp-bin (copy/binary, v5.108.0, GPL-3.0)
;;;    8. wretch-bin (copy/binary, v1.4.1, GPL-3.0)
;;;    9. localsend-go-bin (copy/binary, v1.2.7, MIT)
;;;   10. taskr-bin (copy/binary, v0.1.7, MIT)
;;;   11. mail-deduplicate-bin (copy/binary, v8.1.2, GPL-2.0+)
;;;   12. reels-bin (copy/binary, v1.2.8, MIT)
;;;   13. ncspot-bin (copy/binary, v1.3.3, BSD-2)
;;;   14. gphotos-uploader-cli-bin (copy/binary, v5.1.0, MIT)
;;;   15. ktop-bin (copy/binary, v0.5.3, Apache-2.0)
;;;   16. volt-bin (copy/binary, v1.3.3, MIT)
;;;   17. mdviewer-bin (copy/binary, v0.1.1, MIT)
;;;   18. clipse-bin (copy/binary, v1.2.1, MIT)
;;;   19. duckling-bin (copy/binary, v0.0.50, MIT)
;;;   20. twlauncher-bin (copy/binary, v1.2.1, MIT)
;;;   21. heimer-bin (copy/binary, v4.5.0, GPL-3.0)
;;;   22. tinytotp-bin (copy/binary, v4.6.4, Apache-2.0)
;;;   23. compose-cli-bin (copy/binary, v0.0.21, BSD-4)
;;;   24. gmat-bin (copy/binary, R2026a, Apache-2.0)
;;;
;;; Blocked (6):
;;;   25. gitfetch-bin — BLOCKED: BROKEN_UPSTREAM (AUR v1.0.0 release deleted, v2.0.0 asset renamed)
;;;   26. restfox-bin — BLOCKED: COMPLEX_DEPS (Electron app requiring system electron29)
;;;   27. tela-icon-theme-bin — BLOCKED: COMPLEX_SOURCE (downloads from OpenDesktop, not GitHub)
;;;   28. enlightenment-eminence-theme-bin — BLOCKED: ORPHANED_STALE (AUR orphaned since 2019)
;;;   29. shopify-themekit-bin — BLOCKED: DEPRECATED_UPSTREAM (Shopify recommends Shopify CLI)
;;;   30. plexamp-bin — BLOCKED: PROPRIETARY_COMPLEX (proprietary Electron app, needs electron38)
;;;
;;; 24 recipes + 6 BLOCKED = 30 total.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ad)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:export (
            typioca-bin
            lutgen-bin
            gibo-bin
            pet-bin
            picocrypt-bin
            tone-bin
            qp-bin
            wretch-bin
            localsend-go-bin
            taskr-bin
            mail-deduplicate-bin
            reels-bin
            ncspot-bin
            gphotos-uploader-cli-bin
            ktop-bin
            volt-bin
            mdviewer-bin
            clipse-bin
            duckling-bin
            twlauncher-bin
            heimer-bin
            tinytotp-bin
            compose-cli-bin
            gmat-bin
            ))

;;; ===================================================================
;;; STANDALONE BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. typioca-bin — terminal typing speed tester
;;; -------------------------------------------------------------------
(define-public typioca-bin
  (package
    (name "typioca-bin")
    (version "3.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bloznelis/typioca/releases/download/"
                    version "/typioca-linux-amd64"))
              (sha256
               (base32
                "1jm0lcqi74j2va73arjcxc4damd5dr5ndp1gn0pv2alciv8cphz4"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/typioca")
                   (chmod "src/typioca" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("typioca" "bin/typioca"))))
    (synopsis "minimal terminal-based typing speed tester")
    (description "Typioca is a minimal, terminal-based typing speed tester
built in Go.  It provides multiple test modes including timed tests, word
count tests, and quote tests, with real-time WPM and accuracy tracking.")
    (home-page "https://github.com/bloznelis/typioca")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. lutgen-bin — blazingly fast LUT generation utility
;;; -------------------------------------------------------------------
(define-public lutgen-bin
  (package
    (name "lutgen-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozwaldorf/lutgen-rs/releases/download/"
                    "lutgen-v" version
                    "/lutgen-cli-v" version "-x86_64-unknown-linux-gnu"))
              (sha256
               (base32
                "0vpp6h36zqrpmda349izyan1c7nz8mhg1p0pd0m7dbcq1d39fxcm"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/lutgen")
                   (chmod "src/lutgen" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("lutgen" "bin/lutgen"))))
    (synopsis "interpolated LUT generator for color palettes")
    (description "Lutgen is a blazingly fast interpolated LUT (Look-Up Table)
generator for arbitrary and popular color palettes.  It can apply color
palette transformations to images using generated hald-clut LUTs.")
    (home-page "https://github.com/ozwaldorf/lutgen-rs")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. wretch-bin — simple system fetch CLI in Rust
;;; -------------------------------------------------------------------
(define-public wretch-bin
  (package
    (name "wretch-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Addy10s/wretch/releases/download/v"
                    version "/wretch-release-" version "-linux"))
              (sha256
               (base32
                "0szvx5kixq3444a2xvgnkwnwlccmrxa0yvnb2hfwss77861s6a0q"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/wretch")
                   (chmod "src/wretch" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("wretch" "bin/wretch"))))
    (synopsis "simple system information fetch CLI written in Rust")
    (description "Wretch is a simple, neofetch-like system information fetch
tool written in Rust.  It displays system information such as OS, kernel,
uptime, packages, shell, and hardware details in the terminal.")
    (home-page "https://github.com/Addy10s/wretch")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 4. localsend-go-bin — CLI LocalSend protocol in Go
;;; -------------------------------------------------------------------
(define-public localsend-go-bin
  (package
    (name "localsend-go-bin")
    (version "1.2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/meowrain/localsend-go/releases/download/v"
                    version "/localsend-go-linux-amd64"))
              (sha256
               (base32
                "0x1i8rccwhxzjn3a1lfrh3ga8nm9riyf6xxqsd4l3z6wrxzilg8h"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/localsend-go")
                   (chmod "src/localsend-go" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("localsend-go" "bin/localsend-go"))))
    (synopsis "CLI implementation of the LocalSend protocol in Go")
    (description "Localsend-go is a command-line implementation of the
LocalSend file sharing protocol written in Go.  It allows sending and
receiving files between devices on a local network without an internet
connection.")
    (home-page "https://github.com/meowrain/localsend-go")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. taskr-bin — terminal task runner for VS Code tasks
;;; -------------------------------------------------------------------
(define-public taskr-bin
  (package
    (name "taskr-bin")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/altlimit/taskr/releases/download/v"
                    version "/taskr_linux_amd64"))
              (sha256
               (base32
                "1hhkg2f16m8f96x0a3z83jd6z9qzxdvxm0wqj723wlyvb9akwx4x"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/taskr")
                   (chmod "src/taskr" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("taskr" "bin/taskr"))))
    (synopsis "terminal-native task runner for VS Code tasks.json")
    (description "Taskr is a terminal-native task runner that reads
@file{.vscode/tasks.json} files and provides a TUI interface for selecting
and running tasks.  It supports task dependencies, input variables, and
problem matchers.")
    (home-page "https://github.com/altlimit/taskr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. mail-deduplicate-bin — CLI to deduplicate mailbox messages
;;; -------------------------------------------------------------------
(define-public mail-deduplicate-bin
  (package
    (name "mail-deduplicate-bin")
    (version "8.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kdeldycke/mail-deduplicate"
                    "/releases/download/v" version "/mdedup-linux-x64.bin"))
              (sha256
               (base32
                "0j7ny6mv4fs3p19wh2cqiff403r0cj0p03bmvlgnpsp1h317sc73"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/mdedup")
                   (chmod "src/mdedup" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("mdedup" "bin/mdedup"))))
    (synopsis "command-line tool to deduplicate mail from mailboxes")
    (description "Mail-deduplicate (mdedup) is a CLI tool that detects and
removes duplicate email messages from maildir, mbox, and babyl mailboxes.
It supports multiple strategies for selecting which duplicate to keep or
remove, including by date, size, and content hash.")
    (home-page "https://github.com/kdeldycke/mail-deduplicate")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 7. reels-bin — Instagram Reels viewer in terminal
;;; -------------------------------------------------------------------
(define-public reels-bin
  (package
    (name "reels-bin")
    (version "1.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/njyeung/reels/releases/download/v"
                    version "/reels-linux-amd64"))
              (sha256
               (base32
                "0lqicw09qd348882gfrc33awn750a27g3kmgzr7x2ng3mrd7apcw"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/reels")
                   (chmod "src/reels" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("reels" "bin/reels"))))
    (synopsis "view Instagram reels in the terminal")
    (description "Reels is a terminal application for browsing and watching
Instagram Reels directly in the terminal.  It renders video content as
ASCII art with audio playback support.")
    (home-page "https://github.com/njyeung/reels")
    (license license:expat)))

;;; ===================================================================
;;; TARBALL BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 8. gibo-bin — .gitignore boilerplate generator
;;; -------------------------------------------------------------------
(define-public gibo-bin
  (package
    (name "gibo-bin")
    (version "3.0.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/simonwhitaker/gibo/releases/download/v"
                    version "/gibo_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1wwnq5723nknhhyyd8yphl6q0pxvjkgkwk9cxmmjgsk8zbl7aggj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("gibo" "bin/gibo"))))
    (synopsis "CLI tool to access gitignore boilerplates")
    (description "Gibo (short for .gitignore boilerplates) is a command-line
tool that helps you easily access @file{.gitignore} boilerplates from
GitHub's collection.  It can list, search, and dump gitignore templates
for various programming languages, editors, and operating systems.")
    (home-page "https://github.com/simonwhitaker/gibo")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 9. pet-bin — command-line snippet manager
;;; -------------------------------------------------------------------
(define-public pet-bin
  (package
    (name "pet-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/knqyf263/pet/releases/download/v"
                    version "/pet_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "086xj5f2hfsi4cvrljwl0cm0cspmpn196ldi60scdwsk96vacv5y"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pet" "bin/pet"))))
    (synopsis "simple command-line snippet manager written in Go")
    (description "Pet is a simple command-line snippet manager written in Go.
It allows you to save, search, and execute frequently used commands and
code snippets.  Supports Gist sync, fuzzy search with peco/fzf, and
parameter interpolation in snippets.")
    (home-page "https://github.com/knqyf263/pet")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. tone-bin — audio metadata modification tool
;;; -------------------------------------------------------------------
(define-public tone-bin
  (package
    (name "tone-bin")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sandreas/tone/releases/download/v"
                    version "/tone-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0ghdq9ksp33si5ks7rpsj5b68fbiz2kw3kijf1gh8c32ilr2dimc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tone" "bin/tone"))))
    (synopsis "cross-platform utility to modify audio metadata")
    (description "Tone is a cross-platform command-line utility to dump and
modify audio metadata for a wide variety of formats including mp3, m4a/m4b,
flac, ogg, and opus.  It supports batch processing, chapter management,
and cover art embedding.")
    (home-page "https://github.com/sandreas/tone")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 11. qp-bin — query installed packages across managers
;;; -------------------------------------------------------------------
(define-public qp-bin
  (package
    (name "qp-bin")
    (version "5.108.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zweih/qp/releases/download/v"
                    version "/qp-v" version "-x86_64.tar.gz"))
              (sha256
               (base32
                "1c1pbq3dxgi3mgfwz61xf4r0m5lnz8ba83qi2vdxrnxqzy096njw"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-binary
                 (lambda _
                   (when (file-exists? "qp-x86_64")
                     (rename-file "qp-x86_64" "qp")))))
           #:install-plan #~'(("qp" "bin/qp"))))
    (synopsis "CLI utility to query installed packages across managers")
    (description "Qp (query packages) is a CLI utility for querying installed
packages across multiple package managers.  It provides a unified interface
to search for packages installed via pacman, apt, brew, snap, flatpak, and
other package managers.")
    (home-page "https://github.com/Zweih/qp")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. gphotos-uploader-cli-bin — Google Photos CLI uploader
;;; -------------------------------------------------------------------
(define-public gphotos-uploader-cli-bin
  (package
    (name "gphotos-uploader-cli-bin")
    (version "5.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gphotosuploader/gphotos-uploader-cli"
                    "/releases/download/v" version
                    "/gphotos-uploader-cli_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "01mg2p4gdb6ycm1xyhxbrk3g1nnrg7kz3ywbshy9j78lvq66p3wz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gphotos-uploader-cli" "bin/gphotos-uploader-cli"))))
    (synopsis "command-line tool to upload media to Google Photos")
    (description "Gphotos-uploader-cli is a command-line tool to mass upload
photos and videos to your Google Photos account.  It supports folder
watching, file pattern filtering, album management, and resumable uploads.")
    (home-page "https://github.com/gphotosuploader/gphotos-uploader-cli")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. ncspot-bin — ncurses Spotify client
;;; -------------------------------------------------------------------
(define-public ncspot-bin
  (package
    (name "ncspot-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hrkfdn/ncspot/releases/download/v"
                    version "/ncspot-v" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "049lild7p638xf2ik78dndpms5apda11cjzn4ysqmc7qndr2l23p"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ncspot" "bin/ncspot"))))
    (synopsis "cross-platform ncurses Spotify client written in Rust")
    (description "Ncspot is a cross-platform ncurses-based Spotify client
written in Rust.  It provides a lightweight terminal interface for browsing,
searching, and playing music from Spotify with vim-like keybindings and
support for Spotify Connect.")
    (home-page "https://github.com/hrkfdn/ncspot")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 14. ktop-bin — Kubernetes cluster metrics viewer
;;; -------------------------------------------------------------------
(define-public ktop-bin
  (package
    (name "ktop-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vladimirvivien/ktop/releases/download/v"
                    version "/ktop_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "19my7nilhs0p8fgnks87p4k5mxbkbkvyb1xs2jh4sxmv15flw47q"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ktop" "bin/ktop"))))
    (synopsis "top-like tool for Kubernetes cluster metrics")
    (description "Ktop is a top-like tool for displaying real-time metrics
for your Kubernetes clusters.  It shows node and pod resource usage,
CPU and memory consumption, and other cluster health indicators in a
terminal user interface.")
    (home-page "https://github.com/vladimirvivien/ktop")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 15. volt-bin — terminal-based API testing tool
;;; -------------------------------------------------------------------
(define-public volt-bin
  (package
    (name "volt-bin")
    (version "1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/frypan05/Volt/releases/download/v"
                    version "/volt-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1gvqbwnpp7awsnlf01w4z0r1l41y7vd7q6kmrlmfs97923fdiad7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("volt" "bin/volt"))))
    (synopsis "terminal-based API testing tool written in Rust")
    (description "Volt is a terminal-based API testing tool written in Rust.
It provides a TUI interface for sending HTTP requests, viewing responses,
managing request collections, and testing REST APIs without leaving the
terminal.")
    (home-page "https://github.com/frypan05/Volt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. mdviewer-bin — terminal markdown renderer
;;; -------------------------------------------------------------------
(define-public mdviewer-bin
  (package
    (name "mdviewer-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noborus/mdviewer/releases/download/v"
                    version "/mdviewer_" version "_linux_amd64.zip"))
              (sha256
               (base32
                "0hpf6ck2fdrkgv7biq6zpl958v335w7plhv3gkymc6zj05bgx121"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan #~'(("mdviewer" "bin/mdviewer"))))
    (synopsis "rendered display of markdown in the terminal")
    (description "Mdviewer is a terminal-based markdown viewer that renders
markdown files with syntax highlighting, tables, links, and other
formatting directly in the terminal.  It supports scrolling, search, and
navigation through rendered documents.")
    (home-page "https://github.com/noborus/mdviewer")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. clipse-bin — TUI clipboard manager
;;; -------------------------------------------------------------------
(define-public clipse-bin
  (package
    (name "clipse-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/savedra1/clipse/releases/download/v"
                    version "/clipse_v" version
                    "_linux_wayland_amd64.tar.gz"))
              (sha256
               (base32
                "00s054743ashqrs8nnmv6b419p3h5wh4xgxf7fkw3vx8pw628lq8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("clipse" "bin/clipse"))))
    (synopsis "configurable TUI clipboard manager for Unix")
    (description "Clipse is a configurable TUI clipboard manager for Unix
systems.  It provides a terminal user interface for browsing clipboard
history, searching entries, pinning frequently used items, and supports
both Wayland and X11 display servers.")
    (home-page "https://github.com/savedra1/clipse")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. picocrypt-bin — small secure file encryption tool
;;; -------------------------------------------------------------------
(define-public picocrypt-bin
  (package
    (name "picocrypt-bin")
    (version "1.49")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Picocrypt/Picocrypt/releases/download/"
                    version "/Picocrypt.deb"))
              (sha256
               (base32
                "0rwvy63wajh2189pd4p2qlfaircavbq271sna71bw9w8mxh45yni"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")
                   (chdir "usr"))))
           #:install-plan
           #~'(("bin" "bin")
               ("share" "share"))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (synopsis "small, simple, yet secure file encryption tool")
    (description "Picocrypt is a very small, very simple, yet very secure
encryption tool.  It uses the XChaCha20-Poly1305 cipher and Argon2id key
derivation function.  Despite its small size, it provides features like
password-based and keyfile encryption, file integrity verification, and
Reed-Solomon error correction.")
    (home-page "https://github.com/Picocrypt/Picocrypt")
    (license license:gpl3)))

;;; ===================================================================
;;; APPIMAGE PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 19. duckling-bin — CSV/Parquet/database viewer
;;; -------------------------------------------------------------------
(define-public duckling-bin
  (package
    (name "duckling-bin")
    (version "0.0.50")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/l1xnan/duckling/releases/download/v"
                    version "/Duckling_" version "_amd64.AppImage"))
              (sha256
               (base32
                "111yy402zs0sqs16srysl6fcs8xqycsjavnq0gazqwm3pd8hh5mi"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/duckling")
                   (chmod "src/duckling" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("duckling" "bin/duckling"))))
    (synopsis "fast viewer for CSV, Parquet files and databases")
    (description "Duckling is a fast, lightweight desktop application for
viewing CSV and Parquet files, and connecting to databases such as DuckDB,
SQLite, PostgreSQL, and MySQL.  Built with Tauri, it provides a responsive
GUI for data exploration with filtering, sorting, and SQL query support.")
    (home-page "https://github.com/l1xnan/duckling")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. twlauncher-bin — Teeworlds game launcher
;;; -------------------------------------------------------------------
(define-public twlauncher-bin
  (package
    (name "twlauncher-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/noxygalaxy/TWLauncher/releases/download/v"
                    version "/TWLauncher-x86_64.AppImage"))
              (sha256
               (base32
                "08ax72nl86h49n1gnj24sws7avb0wxil44m27g1gp8c9g5rdnqi7"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/twlauncher")
                   (chmod "src/twlauncher" #o755)
                   (chdir "src"))))
           #:install-plan #~'(("twlauncher" "bin/twlauncher"))))
    (synopsis "launcher for popular Teeworlds game clients")
    (description "TWLauncher is a launcher application for the most popular
Teeworlds and DDNet game clients.  It provides a graphical interface for
managing, downloading, and launching different Teeworlds client versions
and mods.")
    (home-page "https://github.com/noxygalaxy/TWLauncher")
    (license license:expat)))

;;; ===================================================================
;;; DEB-EXTRACTED PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. heimer-bin — cross-platform mind map tool
;;; -------------------------------------------------------------------
(define-public heimer-bin
  (package
    (name "heimer-bin")
    (version "4.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/juzzlin/Heimer/releases/download/"
                    version "/heimer-" version
                    "-ubuntu-24.04_amd64.deb"))
              (sha256
               (base32
                "1rgdaj3hknpwy5ppg3lfp2w12di77srkj37mbznn2fmxnfdnm6sl"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")
                   (chdir "usr"))))
           #:install-plan
           #~'(("bin" "bin")
               ("share" "share"))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (synopsis "simple cross-platform mind map, diagram, and note-taking tool")
    (description "Heimer is a simple cross-platform mind map, diagram, and
note-taking tool written in C++ with Qt.  It supports multiple node types,
text formatting, edge labels, PNG/SVG export, and undo/redo operations
for creating and organizing visual diagrams.")
    (home-page "https://github.com/juzzlin/Heimer")
    (license license:gpl3)))

;;; ===================================================================
;;; JAVA/JVM PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 22. tinytotp-bin — TOTP authentication client
;;; -------------------------------------------------------------------
(define-public tinytotp-bin
  (package
    (name "tinytotp-bin")
    (version "4.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kryptonbutterfly/TinyTotp"
                    "/releases/download/v" version
                    "/TinyTotp-" version ".deb"))
              (sha256
               (base32
                "13lb4hbf8r7ha1mk3c0jh6ibbc0myxz786qnwz3yiw0ich0d7daj"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")
                   (chdir "usr"))))
           #:install-plan
           #~'(("share" "share")
               ("bin" "bin"))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (synopsis "small TOTP authentication client")
    (description "TinyTotp is a small two-factor authentication (TOTP) client
application.  It generates time-based one-time passwords compatible with
Google Authenticator and other TOTP implementations.  Features include
encrypted storage, QR code scanning, and a graphical user interface.")
    (home-page "https://github.com/kryptonbutterfly/TinyTotp")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. compose-cli-bin — Android Compose CLI for terminal
;;; -------------------------------------------------------------------
(define-public compose-cli-bin
  (package
    (name "compose-cli-bin")
    (version "0.0.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/mrinmoyin/compose-cli/-/releases/v"
                    version "/downloads/compose-cli-v" version ".tar"))
              (sha256
               (base32
                "1knk049p0lwxd14w1f22xlx4g1bcxnr6x1m65vb7wzgas4sn80ac"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("app/bin" "bin")
               ("app/lib" "lib"))))
    (synopsis "Android Compose CLI for developers who live in the terminal")
    (description "Compose CLI is a command-line interface tool for Android
developers who prefer working in the terminal.  It provides quick access
to Jetpack Compose project scaffolding, component generation, and build
management without requiring a full IDE.")
    (home-page "https://gitlab.com/mrinmoyin/compose-cli")
    (license license:bsd-4)))

;;; ===================================================================
;;; LARGE APPLICATION PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 24. gmat-bin — space mission analysis tool
;;; -------------------------------------------------------------------
(define-public gmat-bin
  (package
    (name "gmat-bin")
    (version "R2026a")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/gmat/files/GMAT/GMAT-"
                    version "/gmat-ubuntu-x64-" version ".tar.gz"))
              (sha256
               (base32
                "0m3p983n0psb60f6djqq1pgxb63mp0virfvg99q3nbkbc154n4py"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "bin")
               ("data" "share/gmat/data")
               ("plugins" "lib/gmat/plugins")
               ("docs" "share/doc/gmat"))))
    (synopsis "open-source space mission analysis and design tool")
    (description "GMAT (General Mission Analysis Tool) is an open-source
space mission analysis tool developed by NASA.  It supports spacecraft
trajectory optimization, orbit determination, mission planning, and
ground track visualization for Earth-orbiting and interplanetary missions.")
    (home-page "https://gmat.atlassian.net/wiki/spaces/GW/overview")
    (license license:asl2.0)))
