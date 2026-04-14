;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260414i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 22 recipes created (copy, gnu, cmake, pyproject, font)
;;;   - 8 re-blocked as NEEDS_RECIPE_DESIGN_EXHAUSTED with concrete notes
;;;
;;; Recipes (22):
;;;   jump-bin, orla-bin, feluda-bin, wasmrun-bin,
;;;   seqtui-bin, clipvault-bin, lact-headless-bin, teleport-client-bin,
;;;   jiq-ai-bin, checkstyle-bin, vitals, ect, rtrlib,
;;;   quakewatch, mousetrap, font-annotation-mono,
;;;   python-pympress, gonic-bin, skyterm-bin,
;;;   rtimelog-bin, rtimelogger-bin, needle-cli-bin
;;;
;;; Already resolved (referenced, not redefined):
;;;   auth0-bin (deptree-resolver-260407d),
;;;   python-indexed-gzip (recipe-resolver-260408w),
;;;   vcsi (recipe-resolver-260407m)
;;;
;;; Exhausted (8):
;;;   terraform-bin (BSL non-free), harmonoid-bin (PolyForm non-free),
;;;   crossover (proprietary), hoppscotch-bin (Tauri/complex/out-of-date),
;;;   uuid (dead upstream), rzip (dead upstream),
;;;   python-neo4j (heavy dep chain), python-transitions-gui (no upstream)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260414i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:export (jump-bin
            orla-bin
            feluda-bin
            wasmrun-bin
            seqtui-bin
            clipvault-bin
            lact-headless-bin
            teleport-client-bin
            jiq-ai-bin
            checkstyle-bin
            vitals
            ect
            rtrlib
            quakewatch
            mousetrap
            font-annotation-mono
            python-pympress
            gonic-bin
            skyterm-bin
            rtimelog-bin
            rtimelogger-bin
            needle-cli-bin))

;;;
;;; --- 1. jump-bin (copy-build-system, pre-built Go binary) ---
;;;

(define-public jump-bin
  (package
    (name "jump-bin")
    (version "0.67.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gsamokovarov/jump/releases/download/v"
                    version "/jump_linux_amd64_binary"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jump_linux_amd64_binary" "bin/jump"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/jump")
                          #o755))))))
    (synopsis "navigate faster by learning your habits")
    (description "Jump integrates with your shell and learns about your
navigational habits by keeping track of the directories you visit.  It
gives you the most visited directory for the search term.")
    (home-page "https://github.com/gsamokovarov/jump")
    (license license:expat)))

;;;
;;; --- 2. orla-bin (copy-build-system, pre-built binary) ---
;;;

(define-public orla-bin
  (package
    (name "orla-bin")
    (version "1.2.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dorcha-inc/orla/releases/download/v"
                    version "/orla-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("orla-linux-amd64" "bin/orla"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/orla")
                          #o755))))))
    (synopsis "lightweight open-source local AI agents")
    (description "Orla is a dead-simple unix tool for running local AI
agents.  It provides a lightweight interface for managing and running
AI agent workflows on your local machine.")
    (home-page "https://github.com/dorcha-inc/orla")
    (license license:expat)))

;;;
;;; --- 3. rtimelog-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public rtimelog-bin
  (package
    (name "rtimelog-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/umpire274/rtimelog/releases/download/v"
                    version "/rtimelog-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rtimelog" "bin/"))))
    (synopsis "simple time tracking tool with SQLite storage")
    (description "Rtimelog is a command-line time tracking tool that stores
entries in a local SQLite database.  It allows you to log time spent on
projects and generate reports.")
    (home-page "https://github.com/umpire274/rtimelog")
    (license license:expat)))

;;;
;;; --- 4. feluda-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public feluda-bin
  (package
    (name "feluda-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anistark/feluda/releases/download/v"
                    version "/feluda-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("feluda" "bin/"))))
    (synopsis "detect license usage restrictions in projects")
    (description "Feluda is a tool to detect and analyze license usage
restrictions in software projects.  It scans project dependencies and
reports license compatibility issues.")
    (home-page "https://github.com/anistark/feluda")
    (license license:expat)))

;;;
;;; --- 5. wasmrun-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public wasmrun-bin
  (package
    (name "wasmrun-bin")
    (version "0.15.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aspect-build/rules_js/releases/download/v"
                    version "/wasmrun-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wasmrun" "bin/"))))
    (synopsis "run WebAssembly modules in the browser with a single command")
    (description "Wasmrun lets you run WebAssembly modules in the browser
with a single command.  It starts a local development server and serves
your WASM binary with a minimal HTML harness.")
    (home-page "https://github.com/anistark/wasmrun")
    (license license:expat)))

;;;
;;; --- 6. seqtui-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public seqtui-bin
  (package
    (name "seqtui-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ranwez-search/SeqTUI/releases/download/v"
                    version "/seqtui-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seqtui" "bin/"))))
    (synopsis "terminal viewer for molecular sequences")
    (description "SeqTUI is a terminal-based viewer for molecular sequences
such as DNA and amino acid sequences.  It provides a text user interface
for browsing and analyzing sequence data.")
    (home-page "https://github.com/ranwez-search/SeqTUI")
    (license license:expat)))

;;;
;;; --- 7. clipvault-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public clipvault-bin
  (package
    (name "clipvault-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rolv-Apneseth/clipvault/releases/download/v"
                    version "/clipvault-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipvault" "bin/"))))
    (synopsis "clipboard history manager for Wayland")
    (description "ClipVault is a clipboard history manager for Wayland
compositors.  It records clipboard entries and allows you to search and
recall previous clipboard contents.")
    (home-page "https://github.com/Rolv-Apneseth/clipvault")
    (license license:agpl3+)))

;;;
;;; --- 8. lact-headless-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public lact-headless-bin
  (package
    (name "lact-headless-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ilya-zlobintsev/LACT/releases/download/v"
                    version "/lact-" version "-0-x86_64.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lact" "bin/"))))
    (synopsis "Linux AMDGPU controller daemon (headless)")
    (description "LACT is a Linux AMDGPU controller application that allows
managing GPU fans, clocks, power limits, and other parameters.  This
headless variant runs as a daemon without a GUI.")
    (home-page "https://github.com/ilya-zlobintsev/LACT")
    (license license:expat)))

;;;
;;; --- 9. teleport-client-bin (copy-build-system, pre-built Go binary) ---
;;;

(define-public teleport-client-bin
  (package
    (name "teleport-client-bin")
    (version "18.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.teleport.dev/teleport-v" version
                    "-linux-amd64-bin.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("teleport/tsh" "bin/")
                ("teleport/tctl" "bin/"))))
    (synopsis "client tools for Gravitational Teleport")
    (description "Teleport is a tool for providing zero-trust access to
infrastructure.  This package provides the client tools tsh and tctl for
connecting to Teleport clusters and managing access.")
    (home-page "https://goteleport.com")
    (license license:asl2.0)))

;;;
;;; --- 10. jiq-ai-bin (copy-build-system, pre-built binary) ---
;;;

(define-public jiq-ai-bin
  (package
    (name "jiq-ai-bin")
    (version "3.21.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bellicose100xp/jiq/releases/download/v"
                    version "/jiq-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jiq" "bin/"))))
    (synopsis "interactive JSON query tool with AI assistant")
    (description "Jiq is an interactive JSON query tool that combines jq
syntax with an AI assistant.  It provides a terminal interface for
exploring and filtering JSON data interactively.")
    (home-page "https://github.com/bellicose100xp/jiq")
    (license license:expat)))

;;;
;;; --- 11. checkstyle-bin (copy-build-system, Java JAR) ---
;;;

(define-public checkstyle-bin
  (package
    (name "checkstyle-bin")
    (version "13.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/checkstyle/checkstyle/releases/download/"
                    "checkstyle-" version "/checkstyle-" version "-all.jar"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "checkstyle-" #$version "-all.jar")
                         "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (java (search-input-file inputs "bin/java")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file (string-append out "/bin/checkstyle")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a/share/java/checkstyle-~a-all.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java out #$version)))
                     (chmod (string-append out "/bin/checkstyle") #o755)))))))
    (inputs (list (list icedtea "jdk")))
    (synopsis "Java source code analysis tool for coding standards")
    (description "Checkstyle is a development tool to help programmers write
Java code that adheres to a coding standard.  It automates the process of
checking Java code to spare humans of this boring but important task.")
    (home-page "https://checkstyle.org")
    (license license:lgpl2.1)))

;;;
;;; --- 12. vitals (gnu-build-system, simple C tool) ---
;;;

(define-public vitals
  (package
    (name "vitals")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AngelJumbo/vitals")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "CLI system usage visualizer for Linux")
    (description "Vitals is a lightweight command-line system monitoring tool
that displays CPU, memory, disk, and network usage in a visual format
directly in the terminal.")
    (home-page "https://github.com/AngelJumbo/vitals")
    (license license:expat)))

;;;
;;; --- 13. ect (cmake-build-system, C++ compression tool) ---
;;;

(define-public ect
  (package
    (name "ect")
    (version "0.9.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fhanau/Efficient-Compression-Tool")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-binary
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (when (file-exists? "ect")
                       (install-file "ect" bin))))))))
    (native-inputs (list nasm))
    (synopsis "efficient PNG, JPEG, GZIP and ZIP compressor")
    (description "Efficient Compression Tool (ECT) is a C++ file optimizer
that supports PNG, JPEG, GZIP and ZIP files.  It uses a combination of
techniques to achieve smaller file sizes than other popular compression
tools.")
    (home-page "https://github.com/fhanau/Efficient-Compression-Tool")
    (license license:asl2.0)))

;;;
;;; --- 14. rtrlib (cmake-build-system, C RPKI library) ---
;;;

(define-public rtrlib
  (package
    (name "rtrlib")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rtrlib/rtrlib/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libssh))
    (native-inputs (list pkg-config))
    (synopsis "RPKI-RTR client C library")
    (description "RTRlib is an open-source C implementation of the RPKI/RTR
protocol (RFC 6810, RFC 8210).  It allows routers and other network
devices to validate BGP route origin using RPKI data.")
    (home-page "https://rtrlib.realmv6.org")
    (license license:expat)))

;;;
;;; --- 15. quakewatch (python-build-system, simple CLI) ---
;;;

(define-public quakewatch
  (package
    (name "quakewatch")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/baraclese/quakewatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-requests python-tabulate))
    (synopsis "list latest earthquakes from the command line")
    (description "Quakewatch is a command-line tool that fetches and displays
the latest earthquake data from the USGS API.  It shows magnitude,
location, depth, and time for recent seismic events worldwide.")
    (home-page "https://github.com/baraclese/quakewatch")
    (license license:gpl3+)))

;;;
;;; --- 16. mousetrap (python-build-system, X11 utility) ---
;;;

(define-public mousetrap
  (package
    (name "mousetrap")
    (version "3.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eazar001/mousetrap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-xlib))
    (inputs (list libx11 libxfixes))
    (synopsis "utility to hide the mouse pointer after inactivity")
    (description "Mousetrap is an X11 utility that automatically hides the
mouse pointer after a configurable period of inactivity.  The pointer
reappears when the mouse is moved.")
    (home-page "https://github.com/eazar001/mousetrap")
    (license license:expat)))

;;;
;;; --- 17. font-annotation-mono (font-build-system) ---
;;; Covers: otf-annotation-mono, ttf-annotation-mono, ttf-annotation-mono-variable
;;;

(define-public font-annotation-mono
  (package
    (name "font-annotation-mono")
    (version "0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/qwerasd205/AnnotationMono")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system font-build-system)
    (synopsis "handwriting-style monospace font for annotations")
    (description "Annotation Mono is a handwriting-style monospace font
designed for code annotations and comments.  It provides OTF, TTF, and
variable font formats.")
    (home-page "https://qwerasd205.github.io/AnnotationMono")
    (license license:silofl1.1)))

;;;
;;; --- 18. rtimelogger-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public rtimelogger-bin
  (package
    (name "rtimelogger-bin")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/umpire274/rtimelogger/releases/download/v"
                    version "/rtimelogger-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rtimelogger" "bin/"))))
    (synopsis "enhanced time tracking tool with SQLite and reporting")
    (description "Rtimelogger is an enhanced command-line time tracking tool
that stores entries in a local SQLite database.  It extends rtimelog with
additional reporting features and a richer command set.")
    (home-page "https://github.com/umpire274/rtimelogger")
    (license license:expat)))

;;;
;;; --- 19. needle-cli-bin (copy-build-system, pre-built Rust binary) ---
;;;

(define-public needle-cli-bin
  (package
    (name "needle-cli-bin")
    (version "0.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cesarferreira/needle/releases/download/v"
                    version "/needle-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("needle" "bin/"))))
    (synopsis "TUI tool for managing GitHub pull requests")
    (description "Needle is a terminal user interface for managing GitHub
pull requests.  It provides an interactive view of open PRs with the
ability to review, approve, and merge directly from the terminal.")
    (home-page "https://github.com/cesarferreira/needle")
    (license license:expat)))

;;;
;;; --- 20. python-pympress (pyproject-build-system, PDF presentation tool) ---
;;;

(define-public python-pympress
  (package
    (name "python-pympress")
    (version "1.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Cimbali/pympress/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel python-babel))
    (propagated-inputs (list python-pycairo python-pygobject poppler
                             gtk+ gdk-pixbuf python-watchdog))
    (synopsis "dual-screen PDF reader for presentations")
    (description "Pympress is a PDF presentation tool designed for
dual-screen setups.  It renders the current slide on the projector
while showing the next slide, notes, and a timer on the presenter
screen.  It supports PDF annotations and embedded media.")
    (home-page "https://github.com/Cimbali/pympress")
    (license license:gpl2+)))

;;;
;;; --- 21. gonic-bin (copy-build-system, pre-built Go binary) ---
;;;

(define-public gonic-bin
  (package
    (name "gonic-bin")
    (version "0.20.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sentriz/gonic/releases/download/v"
                    version "/gonic_v" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gonic" "bin/"))))
    (synopsis "lightweight Subsonic-compatible music streaming server")
    (description "Gonic is a lightweight, music streaming server compatible
with the Subsonic API.  It scans your music library and serves it to
Subsonic-compatible clients.  It focuses on simplicity and low resource
usage compared to other Subsonic servers.")
    (home-page "https://github.com/sentriz/gonic")
    (license license:gpl3)))

;;;
;;; --- 22. skyterm-bin (copy-build-system, pre-built Go binary) ---
;;;

(define-public skyterm-bin
  (package
    (name "skyterm-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/craigderington/skyterm/releases/download/v"
                    version "/skyterm_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("skyterm" "bin/"))))
    (synopsis "terminal-based astronomy and sky observation tool")
    (description "SkyTerm is a terminal-based astronomy application that
provides sky observation data including planet positions, moon phases, and
star visibility.  It runs directly in the terminal without requiring a
graphical environment.")
    (home-page "https://github.com/craigderington/skyterm")
    (license license:expat)))
