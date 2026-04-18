;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417au
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;    1.  dasel-bin (copy-build-system, v3.4.1, MIT)
;;;    2.  jjui-bin (copy-build-system, v0.10.2, MIT)
;;;    3.  dust-bin (copy-build-system, v1.2.4, Apache-2.0)
;;;    4.  tre-command-bin (copy-build-system, v0.4.0, MIT)
;;;    5.  dupe-krill-bin (copy-build-system, v1.4.8, MIT)
;;;    6.  fstl (cmake-build-system, v0.11.1, MIT)
;;;    7.  neovim-plenary (copy-build-system, v0.1.4, MIT)
;;;    8.  python-c-formatter-42 (python-build-system, v0.2.8, GPL-3.0)
;;;    9.  perl-jq-lite (perl-build-system, v2.43, Artistic/GPL)
;;;   10.  fsign (trivial-build-system, v1.1.0, GPL-3.0)
;;;   11.  fontviewer (trivial-build-system, v0.5.3, BSD-3)
;;;   12.  scopebuddy (copy-build-system, v1.4.0, Apache-2.0)
;;;   13.  deepchat-bin (copy-build-system, v1.0.2, Apache-2.0)
;;;   14.  ripes-bin (copy-build-system, v2.2.6, MIT)
;;;   15.  paket-bin (copy-build-system, v0.1.3, MIT/Apache-2.0)
;;;   16.  freeshow-bin (copy-build-system, v1.5.9, LGPL-3.0+)
;;;   17.  kanri-bin (copy-build-system, v0.8.2, GPL-3.0+)
;;;   18.  alt-sendme-bin (copy-build-system, v0.3.4, AGPL-3.0+)
;;;   19.  vcard-studio-bin (copy-build-system, v1.5.0, CC0)
;;;   20.  youtube-tui-full-bin (copy-build-system, v0.9.4, GPL-3.0)
;;;   21.  clojure-lsp-bin (copy-build-system, v2026.02.20-16.08.58, MIT)
;;;   22.  pandoc-crossref-bin (copy-build-system, v0.3.23a, GPL-2.0+)
;;;   23.  console2svg-bin (copy-build-system, v0.6.5, Apache-2.0)
;;;   24.  wo-bin (copy-build-system, v1.0.0, MIT)
;;;   25.  lazytail-bin (copy-build-system, v0.10.0, MIT)
;;;   26.  funzzy-bin (copy-build-system, v1.5.0, MIT)
;;;   27.  oken-bin (copy-build-system, v0.3.8, MIT)
;;;   28.  workz-bin (copy-build-system, v0.8.0, MIT)
;;;   29.  checkstyle-bin (copy-build-system, v13.4.0, LGPL-2.1)
;;;   30.  tmux-plugin-panel-bin (copy-build-system, v0.1.1, MIT)
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417au)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages java)
  #:export (
            dasel-bin
            jjui-bin
            dust-bin
            tre-command-bin
            dupe-krill-bin
            fstl
            neovim-plenary
            python-c-formatter-42
            perl-jq-lite
            fsign
            fontviewer
            scopebuddy
            deepchat-bin
            ripes-bin
            paket-bin
            freeshow-bin
            kanri-bin
            alt-sendme-bin
            vcard-studio-bin
            youtube-tui-full-bin
            clojure-lsp-bin
            pandoc-crossref-bin
            console2svg-bin
            wo-bin
            lazytail-bin
            funzzy-bin
            oken-bin
            workz-bin
            checkstyle-bin
            tmux-plugin-panel-bin
            ))


;;; ===================================================================
;;; COPY-BUILD-SYSTEM BINARY PACKAGES (tarballs / raw binaries)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. dasel-bin — JSON/TOML/YAML/XML/CSV data selector
;;; -------------------------------------------------------------------
(define-public dasel-bin
  (package
    (name "dasel-bin")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TomWright/dasel/releases/download/v"
                    version "/dasel_linux_amd64.gz"))
              (sha256
               (base32
                "0sps2dvwjm3x75jj9x4mhay1rxxy58wvf98s4rnhd00j3996yn2x"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dasel_linux_amd64" "bin/dasel"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'decompress
                 (lambda _
                   (invoke "gzip" "-d" (string-append "dasel_linux_amd64.gz"))
                   (chmod "dasel_linux_amd64" #o755))))))
    (native-inputs (list gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TomWright/dasel")
    (synopsis "select, put and delete data from JSON, TOML, YAML, XML and CSV")
    (description "Dasel (short for data-selector) allows you to query and modify
data structures using selector strings.  It supports JSON, TOML, YAML, XML,
and CSV formats with a unified command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. jjui-bin — Jujutsu TUI
;;; -------------------------------------------------------------------
(define-public jjui-bin
  (package
    (name "jjui-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/idursun/jjui/releases/download/v"
                    version "/jjui-" version "-linux-amd64.zip"))
              (sha256
               (base32
                "11rln2z70hq4g39ahwg15k15ms908lqim9gn7jdihc9lvy0czji4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jjui" "bin/jjui"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/idursun/jjui")
    (synopsis "terminal UI for the Jujutsu version control system")
    (description "Jjui is a terminal user interface for Jujutsu, a Git-compatible
version control system.  It provides an interactive way to manage changes,
branches, and history in Jujutsu repositories.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. dust-bin — intuitive disk usage tool
;;; -------------------------------------------------------------------
(define-public dust-bin
  (package
    (name "dust-bin")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bootandy/dust/releases/download/v"
                    version "/dust-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0lj4a1giv1ymj6lmbav37psqqyv7fhbhsk6s5a5fa5s0hngkycaf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dust" "bin/dust"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bootandy/dust")
    (synopsis "more intuitive version of du in Rust")
    (description "Dust is a more intuitive version of @command{du}, the disk
usage estimator.  It shows you what is using disk space with a visual chart
of the directory tree.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 4. tre-command-bin — improved tree command
;;; -------------------------------------------------------------------
(define-public tre-command-bin
  (package
    (name "tre-command-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dduan/tre/releases/download/v"
                    version "/tre-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "1b3b4q5yd3s6san8yrxixslrxsj2m06d0960513139ybnq6v5dj7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tre" "bin/tre"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dduan/tre")
    (synopsis "improved tree command with git awareness and editor integration")
    (description "Tre is an improved replacement for the @command{tree} command
that features git awareness, editor integration, and a modern interface for
exploring directory structures.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. paket-bin — Fish shell package manager
;;; -------------------------------------------------------------------
(define-public paket-bin
  (package
    (name "paket-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joseluisq/paket/releases/download/v"
                    version "/paket-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "14vhan3wk36g9rqaknpx6nqj49w4vqjdpjls5k7lxs564hvyczis"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("paket" "bin/paket"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joseluisq/paket")
    (synopsis "simple and fast package manager for Fish shell")
    (description "Paket is a lightweight package manager for Fish shell that
provides a simple and fast way to manage Fish shell plugins and packages.")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 6. youtube-tui-full-bin — TUI YouTube frontend
;;; -------------------------------------------------------------------
(define-public youtube-tui-full-bin
  (package
    (name "youtube-tui-full-bin")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Siriusmart/youtube-tui/releases/download/v"
                    version "/youtube-tui-full_arch-x86_64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "1j9b3ws26gk37hs89y0phbxqlfvvlyg1kf89r26mg1g5pmn8x2f8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "youtube-tui-full-bin-" #$version)
                "bin/youtube-tui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/youtube-tui") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Siriusmart/youtube-tui")
    (synopsis "aesthetically pleasing TUI frontend for YouTube")
    (description "Youtube-tui is a terminal user interface for browsing and
watching YouTube content.  It provides search, playback controls, and
channel browsing in a text-based interface.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 7. wo-bin — workspace shell manager
;;; -------------------------------------------------------------------
(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/antham/wo/releases/download/"
                    version "/wo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "1p2ny73avwylp1vg1syfrqi2mx2a5xqv1n2v2pp4g835xgr0igy9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wo" "bin/wo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager for project directories")
    (description "Wo is a workspace shell manager that helps organize and
navigate between project directories.  It provides a simple interface for
managing development workspaces.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. lazytail-bin — terminal-based log viewer
;;; -------------------------------------------------------------------
(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raaymax/lazytail/releases/download/v"
                    version "/lazytail-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0r4d07bj8q4c6x1v7g7jl8ay2vh7wwz1mbqwc7vy9s89qn37ikra"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazytail" "bin/lazytail"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "fast terminal-based log viewer with live filtering")
    (description "Lazytail is a fast, universal terminal-based log viewer with
live filtering and follow mode.  It provides an interactive way to view and
search through log files in real time.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. funzzy-bin — lightweight file watcher
;;; -------------------------------------------------------------------
(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cristianoliveira/funzzy/releases/download/v"
                    version "/funzzy-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("funzzy" "bin/funzzy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight generic purpose file watcher")
    (description "Funzzy is a lightweight, configurable, and generic purpose
file watcher.  It watches for file changes and runs configured commands
when modifications are detected.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. oken-bin — smarter SSH CLI
;;; -------------------------------------------------------------------
(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linkwithjoydeep/oken/releases/download/v"
                    version "/oken-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0dljijbx2n9514rbfwgxl0s4p0n1kbwp4pdi85kzl3zpg5lk3djc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oken" "bin/oken"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "smarter SSH CLI with fuzzy host picker")
    (description "Oken is a smarter SSH command-line interface with better host
management and a fuzzy host picker.  It works standalone or as an optional
drop-in replacement for @command{ssh}.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. workz-bin — Git worktree manager
;;; -------------------------------------------------------------------
(define-public workz-bin
  (package
    (name "workz-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rohansx/workz/releases/download/v"
                    version "/workz-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "02jbwlghrw35x0mln7pyzh8h5m10q4glisnrc85h0bzf89yck2g5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("workz" "bin/workz"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rohansx/workz")
    (synopsis "git worktree manager with zero-config dependency sync")
    (description "Workz is a Git worktree manager that provides zero-config
dependency sync and fleet mode for parallel agents.  It simplifies working
with multiple Git worktrees.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. tmux-plugin-panel-bin — tmux plugin manager TUI
;;; -------------------------------------------------------------------
(define-public tmux-plugin-panel-bin
  (package
    (name "tmux-plugin-panel-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/psmux/Tmux-Plugin-Panel/releases/download/v"
                    version "/tmuxpanel-v" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1ss6gy3598jv2ljz2vxzlw0dj78m99572apwjy1226wrjvffnh60"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tmuxpanel" "bin/tmuxpanel"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/psmux/Tmux-Plugin-Panel")
    (synopsis "full-fledged TUI plugin manager for tmux")
    (description "Tmux Plugin Panel is a terminal user interface for managing
tmux plugins.  It provides an interactive way to browse, install, update,
and remove tmux plugins.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. omp-manager-bin — Oh My Posh manager (was #5498)
;;; (omitted from final 30 — replaced by console2svg-bin)
;;; -------------------------------------------------------------------

;;; -------------------------------------------------------------------
;;; 13. console2svg-bin — terminal output to SVG converter
;;; -------------------------------------------------------------------
(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arika0093/console2svg/releases/download/v"
                    version "/console2svg-linux-x64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "17yi3cccyxlsxxmbqb254v36lbk0d7cv59mnsclcs72jkq65yk26"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "console2svg-bin-" #$version)
                "bin/console2svg"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/console2svg") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output into SVG images")
    (description "Console2svg easily converts terminal output into SVG images.
It captures the rendering of terminal text including colors and formatting
and produces clean SVG files.")
    (license license:asl2.0)))


;;; ===================================================================
;;; .DEB BINARY PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 14. dupe-krill-bin — file deduplicator
;;; -------------------------------------------------------------------
(define-public dupe-krill-bin
  (package
    (name "dupe-krill-bin")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kornelski/dupe-krill/releases/download/v"
                    version "/dupe-krill_" version "_amd64.deb"))
              (sha256
               (base32
                "0i0xg7yrr2rkdaknnnxa2mj1zj1iv8q6pz0f0l7kxh81hf3v4fd2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/dupe-krill" "bin/dupe-krill"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kornelski/dupe-krill")
    (synopsis "incremental file deduplicator replacing duplicates with hardlinks")
    (description "Dupe-krill is a file deduplication tool that replaces duplicate
files with hardlinks, saving disk space.  It works incrementally and can
handle large file collections efficiently.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. freeshow-bin — presentation software
;;; -------------------------------------------------------------------
(define-public freeshow-bin
  (package
    (name "freeshow-bin")
    (version "1.5.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ChurchApps/FreeShow/releases/download/v"
                    version "/freeshow-" version "-amd64.deb"))
              (sha256
               (base32
                "1d9ccd3nn0q77l5qb166fn9jpz2035bb5ksnq0ljp4c2xgy921vh"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://freeshow.app")
    (synopsis "free and open-source presentation software")
    (description "FreeShow is a free and open-source presentation software
designed for churches and other organizations.  It supports multimedia
slides, stage displays, and remote control.")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 16. kanri-bin — offline Kanban board
;;; -------------------------------------------------------------------
(define-public kanri-bin
  (package
    (name "kanri-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kanriapp/kanri/releases/download/app-v"
                    version "/kanri_" version "_amd64.deb"))
              (sha256
               (base32
                "05bgpb8fddkgczz6i13bjpx5sfpcnja7jjv46ifjfmqfa0l8dppk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kanriapp.com")
    (synopsis "modern offline Kanban board application")
    (description "Kanri is a modern, offline Kanban board application for
organizing tasks and projects.  It stores data locally and provides a clean
interface for task management.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. alt-sendme-bin — real-time file transfer
;;; -------------------------------------------------------------------
(define-public alt-sendme-bin
  (package
    (name "alt-sendme-bin")
    (version "0.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tonyantony300/alt-sendme/releases/download/v"
                    version "/AltSendme_" version "_amd64.deb"))
              (sha256
               (base32
                "07m6baxkpg1qrzfyklzinf0cm6hi2lg28bdnkls5zm3wb1sxna33"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tonyantony300/alt-sendme")
    (synopsis "frictionless real-time file transfer tool")
    (description "Alt-sendme is a frictionless real-time file transfer tool that
enables quick sharing of files between devices on the same network without
complex setup.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 18. vcard-studio-bin — vCard contact management
;;; -------------------------------------------------------------------
(define-public vcard-studio-bin
  (package
    (name "vcard-studio-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://svn.zdechov.net/vcard-studio/bin/deb/vcard-studio_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "1c9vr0kc3zq1z4mqcbxv69qw0mgyadb9wa0kjyr79pzfwgd9ns1k"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://svn.zdechov.net/vcard-studio")
    (synopsis "contact management application for vCard files")
    (description "VCard Studio is a contact management application for working
with vCard files.  It provides a graphical interface for viewing, editing,
and organizing contact information stored in vCard format.")
    (license license:cc0)))


;;; ===================================================================
;;; APPIMAGE PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 19. deepchat-bin — AI assistant
;;; -------------------------------------------------------------------
(define-public deepchat-bin
  (package
    (name "deepchat-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ThinkInAIXYZ/deepchat/releases/download/v"
                    version "/DeepChat-" version
                    "-linux-x86_64.AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32
                "15lg3knqzdi8falj178yrajjjjhcdxs0ryb5fidw0yaisy8zg5aq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "deepchat-bin-" #$version ".AppImage")
                "bin/deepchat"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/deepchat") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ThinkInAIXYZ/deepchat")
    (synopsis "smart AI assistant for personal productivity")
    (description "DeepChat is a smart AI assistant desktop application for
personal productivity.  It provides a clean interface for conversing with
AI models locally.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. ripes-bin — RISC-V processor simulator
;;; -------------------------------------------------------------------
(define-public ripes-bin
  (package
    (name "ripes-bin")
    (version "2.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mortbopet/Ripes/releases/download/v"
                    version "/Ripes-v" version
                    "-linux-x86_64.AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32
                "1nsmrliq4r76aad33l9fw6d30f3ydp5xwcjd1kfq28bzi5jc6p06"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~`((,(string-append "ripes-bin-" #$version ".AppImage")
                "bin/ripes"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ripes") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mortbopet/Ripes")
    (synopsis "graphical RISC-V processor simulator and assembly editor")
    (description "Ripes is a graphical processor simulator and assembly code
editor for the RISC-V instruction set architecture.  It visualizes the
pipeline execution and supports multiple RISC-V processor models.")
    (license license:expat)))


;;; ===================================================================
;;; ARCHIVE BINARY PACKAGES (zip, tar.xz)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 21. clojure-lsp-bin — Clojure language server
;;; -------------------------------------------------------------------
(define-public clojure-lsp-bin
  (package
    (name "clojure-lsp-bin")
    (version "2026.02.20-16.08.58")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/clojure-lsp/clojure-lsp/releases/download/"
                    version "/clojure-lsp-native-static-linux-amd64.zip"))
              (sha256
               (base32
                "0l150apjdlmf6zxfbd8v2dj6km2638cxy0jj72cdkdspvqqs3an7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clojure-lsp" "bin/clojure-lsp"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/clojure-lsp/clojure-lsp")
    (synopsis "language server protocol implementation for Clojure")
    (description "Clojure-lsp is a Language Server Protocol implementation for
Clojure and ClojureScript.  It provides IDE features like code completion,
go-to-definition, find-references, and refactoring support.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. pandoc-crossref-bin — Pandoc cross-reference filter
;;; -------------------------------------------------------------------
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
               (base32
                "116yr5nnm7ffn2ii8alzsx0aan29cyv0blwzwbq9fyjlf7if8xzs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pandoc-crossref" "bin/pandoc-crossref"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lierdakil/pandoc-crossref")
    (synopsis "pandoc filter for cross-references in documents")
    (description "Pandoc-crossref is a filter for Pandoc that adds support for
figure, equation, table, and section cross-references in documents.  It
processes Pandoc's internal representation to generate numbered references.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 23. checkstyle-bin — Java source code linter
;;; -------------------------------------------------------------------
(define-public checkstyle-bin
  (package
    (name "checkstyle-bin")
    (version "13.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-"
                    version "/checkstyle-" version "-all.jar"))
              (sha256
               (base32
                "0353vwkb20ssgh5ciznzf1b58ykx7m94f58hcydh5mi6yxps9vmi"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin"))
                      (jar-dir (string-append out "/share/java"))
                      (source (assoc-ref %build-inputs "source"))
                      (java (assoc-ref %build-inputs "openjdk")))
                 (mkdir-p bin)
                 (mkdir-p jar-dir)
                 (copy-file source
                            (string-append jar-dir "/checkstyle.jar"))
                 (call-with-output-file (string-append bin "/checkstyle")
                   (lambda (port)
                     (format port "#!/bin/sh\nexec ~a/bin/java -jar ~a \"$@\"\n"
                             java (string-append jar-dir "/checkstyle.jar"))))
                 (chmod (string-append bin "/checkstyle") #o755)))))
    (inputs (list openjdk))
    (home-page "https://checkstyle.org")
    (synopsis "development tool for checking Java code style")
    (description "Checkstyle is a development tool to help programmers write
Java code that adheres to a coding standard.  It supports the Google Java
Style Guide and Sun Code Conventions, and is highly configurable.")
    (license license:lgpl2.1)))


;;; ===================================================================
;;; SOURCE-BUILD PACKAGES
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 24. fstl — STL 3D model viewer
;;; -------------------------------------------------------------------
(define-public fstl
  (package
    (name "fstl")
    (version "0.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fstl-app/fstl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1dx8m57753nyk6xdrl1h4xw3kw1l4zl4z9sr99p3kjb20dfdiq56"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5 mesa))
    (home-page "https://github.com/fstl-app/fstl")
    (synopsis "viewer for STL 3D model files")
    (description "Fstl is a lightweight viewer for STL files, the standard file
format for 3D printing.  It provides fast rendering of 3D models with
OpenGL acceleration.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. neovim-plenary — Lua library for Neovim plugins
;;; -------------------------------------------------------------------
(define-public neovim-plenary
  (package
    (name "neovim-plenary")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nvim-lua/plenary.nvim")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1sn7vpsbwpyndsjyxb4af8fvz4sfhlbavvw6jjsv3h18sdvkh7nd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lua" "share/nvim/site/pack/guix/start/plenary.nvim/lua")
               ("plugin" "share/nvim/site/pack/guix/start/plenary.nvim/plugin"))))
    (home-page "https://github.com/nvim-lua/plenary.nvim")
    (synopsis "lua library of common utilities for Neovim plugins")
    (description "Plenary.nvim is a Lua library providing common utilities used
by many Neovim plugins.  It includes async primitives, path manipulation,
test harnesses, and functional programming helpers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. python-c-formatter-42 — C formatter for 42 school
;;; -------------------------------------------------------------------
(define-public python-c-formatter-42
  (package
    (name "python-c-formatter-42")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "c_formatter_42" version))
              (sha256
               (base32
                "0yq55c5f5z121zgdnm7wr4ljx633y16294g778vdv4nw9jmv2cfs"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/dawnbeen/c_formatter_42")
    (synopsis "C language formatter following the 42 school norm")
    (description "C-formatter-42 is a code formatter for C files following the
42 school coding standard (the Norm).  It can format header blocks, variable
alignments, and other style requirements.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 27. perl-jq-lite — lightweight jq-like JSON query in Perl
;;; -------------------------------------------------------------------
(define-public perl-jq-lite
  (package
    (name "perl-jq-lite")
    (version "2.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/S/SH/SHINGO/JQ-Lite-"
                    version ".tar.gz"))
              (sha256
               (base32
                "1p72bsl74fi1i89hcvk6jd94fdhnp6vhgs83wmjfd39fy92mf7rq"))))
    (build-system perl-build-system)
    (home-page "https://metacpan.org/release/JQ-Lite")
    (synopsis "lightweight jq-like JSON query engine in pure Perl")
    (description "JQ-Lite is a lightweight jq-like JSON query engine implemented
in pure Perl.  It supports a subset of jq's filter syntax for querying and
transforming JSON data without external dependencies.")
    (license license:perl-license)))

;;; -------------------------------------------------------------------
;;; 28. fsign — folder signing utility
;;; -------------------------------------------------------------------
(define-public fsign
  (package
    (name "fsign")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bill88t/fsign")
                    (commit "6defe28a2039430b4850342796cc83e6af621b32")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "092x09jr28fgsmllx9d7dj16lf6c9760lw29xqzx0qcszlh1vyf2"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin"))
                      (source (assoc-ref %build-inputs "source"))
                      (python (assoc-ref %build-inputs "python")))
                 (mkdir-p bin)
                 (copy-file (string-append source "/fsign.py")
                            (string-append bin "/fsign"))
                 (chmod (string-append bin "/fsign") #o755)
                 (substitute* (string-append bin "/fsign")
                   (("#!/usr/bin/env python3")
                    (string-append "#!" python "/bin/python3")))))))
    (inputs (list python))
    (home-page "https://github.com/bill88t/fsign")
    (synopsis "trivial folder signing utility using SHA-256 checksums")
    (description "Fsign is a simple folder signing utility that generates and
verifies SHA-256 checksums for directory contents.  It helps ensure file
integrity by creating signature files that can be verified later.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 29. fontviewer — font viewer in Tcl/Tk
;;; -------------------------------------------------------------------
(define-public fontviewer
  (package
    (name "fontviewer")
    (version "0.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/siyb/fontviewer")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1v18j2ackgk8ypzsl672l8qn2a8km2c638wj32dvpfnndl0fhcm3"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin"))
                      (source (assoc-ref %build-inputs "source"))
                      (tk (assoc-ref %build-inputs "tk")))
                 (mkdir-p bin)
                 (copy-file (string-append source "/fontviewer.tcl")
                            (string-append bin "/fontviewer"))
                 (chmod (string-append bin "/fontviewer") #o755)
                 (substitute* (string-append bin "/fontviewer")
                   (("#!/usr/bin/env wish")
                    (string-append "#!" tk "/bin/wish")))))))
    (inputs (list tk))
    (home-page "https://github.com/siyb/fontviewer")
    (synopsis "font viewer written in Tcl/Tk")
    (description "Fontviewer is a simple font viewer application written in
Tcl/Tk.  It displays installed fonts with preview text and allows browsing
through the system's font collection.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 30. scopebuddy — Gamescope session helper
;;; -------------------------------------------------------------------
(define-public scopebuddy
  (package
    (name "scopebuddy")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenGamingCollective/ScopeBuddy")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "053pf3hnfjfh58vw5wi1lm5wx5nzdkfjj43g5rykbd2v4xk6azfn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scopebuddy" "bin/scopebuddy")
               ("scopebuddy.conf" "etc/scopebuddy/scopebuddy.conf"))))
    (inputs (list bash))
    (home-page "https://github.com/OpenGamingCollective/ScopeBuddy")
    (synopsis "helper script for configuring Gamescope sessions")
    (description "ScopeBuddy is a helper script for configuring Gamescope
sessions on Linux.  It simplifies the setup of Gamescope, the SteamOS
session compositing window manager.")
    (license license:asl2.0)))
