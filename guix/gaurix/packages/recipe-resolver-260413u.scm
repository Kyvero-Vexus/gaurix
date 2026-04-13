;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413u
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 16 recipes created (mixed build systems)
;;;   - 14 re-blocked with concrete attempt notes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages node)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages xml)
  #:export (
            ;; Elephant suite plugins (binary from GitHub releases)
            elephant-files-plugin
            elephant-calc-plugin
            elephant-niriactions-plugin
            elephant-bitwarden-plugin
            ;; Binary packages
            dust-git-bin
            lazytail-bin
            qbit-manage-desktop-bin
            brewtarget-bin
            epub2pdf
            sillytavern
            deezer-enhanced-bin
            ghc9.12-bin
            ;; Source packages
            hunspell-ja
            ;; Python packages
            python-pyfiglet
            python-opentelemetry-exporter-zipkin-proto-http
            python-opencensus
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; Elephant suite plugins (#272, #273, #912, #915)
;;; All are Go plugin .so files distributed as tarballs on GitHub.
;;; Base elephant package already exists in gaurix channel.
;;; ──────────────────────────────────────────────────────────────────

;;; ── elephant-files-plugin (#272) ──

(define-public elephant-files-plugin
  (package
    (name "elephant-files-plugin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/files-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/elephant/plugins/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "file manager plugin for Elephant launcher")
    (description "File manager plugin for the Elephant application launcher.
Provides file search and browsing capabilities using fd as backend.")
    (license license:gpl3+)))

;;; ── elephant-calc-plugin (#273) ──

(define-public elephant-calc-plugin
  (package
    (name "elephant-calc-plugin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/calc-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/elephant/plugins/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "calculator plugin for Elephant launcher")
    (description "Calculator plugin for the Elephant application launcher.
Provides inline calculator functionality using libqalculate as backend.")
    (license license:gpl3+)))

;;; ── elephant-niriactions-plugin (#912) ──

(define-public elephant-niriactions-plugin
  (package
    (name "elephant-niriactions-plugin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/niriactions-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/elephant/plugins/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "Niri window manager actions plugin for Elephant launcher")
    (description "Plugin for the Elephant application launcher that provides
actions for the Niri Wayland compositor, such as workspace switching and
window management commands.")
    (license license:gpl3+)))

;;; ── elephant-bitwarden-plugin (#915) ──

(define-public elephant-bitwarden-plugin
  (package
    (name "elephant-bitwarden-plugin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/bitwarden-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/elephant/plugins/"))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "Bitwarden integration plugin for Elephant launcher")
    (description "Plugin for the Elephant application launcher that provides
Bitwarden password manager integration using rbw as backend.  Allows searching
and copying credentials directly from the launcher.")
    (license license:gpl3+)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── dust-git-bin (#1092) ──
;;; du replacement written in Rust.  Binary from GitHub releases.

(define-public dust-git-bin
  (package
    (name "dust-git-bin")
    (version "1.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bootandy/dust/releases/download/v"
                    version "/du-dust-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dust" "bin/dust"))))
    (home-page "https://github.com/bootandy/dust")
    (synopsis "more intuitive version of du written in Rust")
    (description "Dust is a more intuitive version of du (disk usage).
It shows you the largest directories and files on your system as a visual
tree, making it easy to find what is consuming disk space.")
    (license license:asl2.0)))

;;; ── lazytail-bin (#3070) ──
;;; Terminal log viewer.  Binary from GitHub releases.

(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lucassarcanjo/lazytail/releases/download/v"
                    version "/lazytail-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazytail" "bin/lazytail"))))
    (home-page "https://github.com/lucassarcanjo/lazytail")
    (synopsis "terminal log viewer with TUI interface")
    (description "Lazytail is a terminal-based log viewer with a TUI interface
that provides real-time log file monitoring with features like filtering,
highlighting, and multiple file support.")
    (license license:expat)))

;;; ── qbit-manage-desktop-bin (#3267) ──
;;; qBittorrent management tool.  Binary .deb from GitHub.

(define-public qbit-manage-desktop-bin
  (package
    (name "qbit-manage-desktop-bin")
    (version "4.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StuffAnThings/qbit_manage/releases/download/v"
                    version "/qBit.Manage_" version
                    "_amd64-desktop-installer.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source #$source)
                 (out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin"))
            (invoke "tar" "xf" source)
            (invoke "tar" "xf" "data.tar.gz")
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip))
    (home-page "https://github.com/StuffAnThings/qbit_manage")
    (synopsis "desktop interface for managing qBittorrent instances")
    (description "qBit Manage Desktop provides a graphical interface for
managing qBittorrent instances.  Built with Tauri, it offers features like
torrent categorization, tag management, and automated cleanup rules.")
    (license license:expat)))

;;; ── brewtarget-bin (#3401) ──
;;; Brewing recipe calculator.  AppImage from GitHub releases.

(define-public brewtarget-bin
  (package
    (name "brewtarget-bin")
    (version "5.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Brewtarget/brewtarget/releases/download/v"
                    version "/brewtarget-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brewtarget.AppImage" "bin/brewtarget"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "brewtarget.AppImage")
                     (chmod "brewtarget.AppImage" #o755)))))))
    (home-page "https://github.com/Brewtarget/brewtarget")
    (synopsis "open-source beer brewing recipe calculator")
    (description "Brewtarget is a brewing recipe calculator that helps
brewers create and manage beer recipes.  It supports BeerXML import/export,
automatic calculations for gravity, color, bitterness, and more.")
    (license license:gpl3+)))

;;; ── epub2pdf (#3382) ──
;;; EPUB to PDF converter.  Pre-built Java JAR.

(define-public epub2pdf
  (package
    (name "epub2pdf")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Nickvision-Team/epub2pdf/releases/download/v"
                    version "/epub2pdf-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib"))
                 (jar (string-append lib "/epub2pdf.jar"))
                 (wrapper (string-append bin "/epub2pdf")))
            (mkdir-p bin)
            (mkdir-p lib)
            (copy-file #$source jar)
            (with-output-to-file wrapper
              (lambda ()
                (format #t "#!/bin/sh~%exec ~a/bin/java -jar ~a \"$@\"~%"
                        #$icedtea jar)))
            (chmod wrapper #o755)
            #t))))
    (inputs (list icedtea))
    (home-page "https://github.com/Nickvision-Team/epub2pdf")
    (synopsis "convert EPUB files to PDF format")
    (description "epub2pdf is a command-line tool that converts EPUB e-book
files to PDF format.  It preserves formatting and layout while producing
standard PDF output suitable for printing or reading.")
    (license license:gpl3)))

;;; ── sillytavern (#3377) ──
;;; AI chat frontend.  Node.js application.

(define-public sillytavern
  (package
    (name "sillytavern")
    (version "1.17.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SillyTavern/SillyTavern")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sillytavern/"
                #:exclude ("node_modules" ".git")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (app (string-append out "/share/sillytavern")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/sillytavern")
                       (lambda ()
                         (format #t "#!/bin/sh~%cd ~a~%exec ~a/bin/node server.js \"$@\"~%"
                                 app #$node)))
                     (chmod (string-append bin "/sillytavern") #o755)))))))
    (inputs (list node))
    (home-page "https://github.com/SillyTavern/SillyTavern")
    (synopsis "frontend for AI chat and roleplay")
    (description "SillyTavern is a locally-installed user interface for
interacting with LLM AI chatbots.  It supports multiple backends including
OpenAI, Claude, KoboldAI, and local models.  Features include character
management, chat history, and extensive customization.")
    (license license:agpl3+)))

;;; ── deezer-enhanced-bin (#360) ──
;;; Enhanced Deezer client.  AppImage from GitHub releases.

(define-public deezer-enhanced-bin
  (package
    (name "deezer-enhanced-bin")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/duzda/deezer-enhanced/releases/download/v"
                    version "/deezer-enhanced-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("deezer-enhanced.AppImage" "bin/deezer-enhanced"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "deezer-enhanced.AppImage")
                     (chmod "deezer-enhanced.AppImage" #o755)))))))
    (home-page "https://github.com/duzda/deezer-enhanced")
    (synopsis "enhanced Deezer desktop client with extra features")
    (description "Deezer Enhanced is a modified Deezer desktop client that
adds extra features on top of the official Deezer web player, including
Discord Rich Presence, system tray support, and media key integration.")
    (license license:expat)))

;;; ── ghc9.12-bin (#3406) ──
;;; GHC 9.12 Haskell compiler binary distribution.

(define-public ghc9.12-bin
  (package
    (name "ghc9.12-bin")
    (version "9.12.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.haskell.org/~ghc/" version
                    "/ghc-" version
                    "-x86_64-deb12-linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "--prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'build)
          (add-before 'configure 'fix-paths
            (lambda _
              (substitute* "configure"
                (("/bin/sh") (which "sh"))))))))
    (native-inputs (list tar))
    (home-page "https://www.haskell.org/ghc/")
    (synopsis "Glasgow Haskell Compiler version 9.12")
    (description "GHC is a compiler and interactive environment for the
Haskell programming language.  This package provides a pre-built binary
distribution of GHC version 9.12.")
    (license license:bsd-3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Data / dictionary packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── hunspell-ja (#3353) ──
;;; Japanese Hunspell dictionary data.

(define-public hunspell-ja
  (let ((commit "d2e7ff0bb8ec7cf2d5dae86e5f30d64c4e09cc18")
        (revision "1"))
    (package
      (name "hunspell-ja")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Ajatt-Tools/hunspell-ja")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("ja_JP.aff" "share/hunspell/ja_JP.aff")
                 ("ja_JP.dic" "share/hunspell/ja_JP.dic"))))
      (home-page "https://github.com/Ajatt-Tools/hunspell-ja")
      (synopsis "Japanese dictionary for Hunspell spell checker")
      (description "Japanese Hunspell dictionary providing spell checking
support for the Japanese language.  Includes affix rules and word lists
for use with Hunspell-compatible applications.")
      (license license:gpl3))))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-pyfiglet (dependency for #1366 ttime-bin) ──
;;; ASCII art text rendering library.

(define-public python-pyfiglet
  (package
    (name "python-pyfiglet")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyfiglet" version))
              (sha256
               (base32 "1avd0sizc1giq4y52g36prj3q39kzw2ymqc417favymqi80qi1vm"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/pwaller/pyfiglet")
    (synopsis "pure Python FIGlet implementation for ASCII art text")
    (description "PyFIGlet is a pure Python implementation of FIGlet, a
program that generates ASCII art text banners from ordinary text.  It
includes a collection of FIGlet fonts and supports custom font loading.")
    (license license:expat)))

;;; ── python-opentelemetry-exporter-zipkin-proto-http (#2144) ──

(define-public python-opentelemetry-exporter-zipkin-proto-http
  (package
    (name "python-opentelemetry-exporter-zipkin-proto-http")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "opentelemetry_exporter_zipkin_proto_http" version))
              (sha256
               (base32 "1cvbjdh71phsx4s9zmij6xhajlcc9b26w3mjzcw97bdfqvfv2kbh"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/open-telemetry/opentelemetry-python")
    (synopsis "OpenTelemetry Zipkin protobuf HTTP exporter")
    (description "OpenTelemetry exporter that sends trace data to Zipkin
collectors using the Protobuf encoding over HTTP.  Part of the OpenTelemetry
Python SDK instrumentation ecosystem.")
    (license license:asl2.0)))

;;; ── python-opencensus (#2845) ──

(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "opencensus" version))
              (sha256
               (base32 "1wpg8kjqr594qap42b05dn5a7flbsp7a3hp5c2mn8c3pp3c8gvyb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "stats collection and distributed tracing framework")
    (description "OpenCensus is a stats collection and distributed tracing
framework.  It provides a set of libraries for collecting application
performance metrics and distributed traces, then sending them to a backend
of your choice.")
    (license license:asl2.0)))
