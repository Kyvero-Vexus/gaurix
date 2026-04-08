;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260407k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   popular desktop applications, IDEs, messaging clients, and productivity
;;;   tools distributed as pre-built binaries (AppImage, .deb, tar.gz).
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260407k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (teams-for-linux-bin
            obsidian-bin
            1password-bin
            rambox-bin
            ferdium-bin
            insomnia-bin
            datagrip-bin
            pycharm-professional-bin
            webstorm-bin
            goland-bin
            mongodb-compass-bin
            beekeeper-studio-bin
            parsec-bin
            sunshine-bin
            protonmail-bridge-bin
            vivaldi-bin
            waterfox-bin
            youtube-music-bin
            jellyfin-media-player-bin
            drawio-desktop-bin
            figma-linux-bin
            wps-office-bin
            marktext-bin
            joplin-appimage
            simplenote-electron-bin
            signal-desktop-bin
            element-desktop-bin
            session-desktop-bin
            feishin-bin
            caprine-bin))

;;;
;;; ── 1. teams-for-linux-bin ──────────────────────────────────────────────
;;; Unofficial Microsoft Teams client for Linux
;;;
(define-public teams-for-linux-bin
  (package
    (name "teams-for-linux-bin")
    (version "2.7.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v"
             version "/teams-for-linux-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/teams-for-linux"))
            (chmod (string-append bin "/teams-for-linux") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/IsmaelMartinez/teams-for-linux")
    (synopsis "unofficial Microsoft Teams client for Linux")
    (description
     "Teams for Linux is an unofficial Microsoft Teams client built with
Electron.  It provides access to Microsoft Teams features including chat,
video calls, and file sharing on Linux desktops.")
    (license license:gpl3+)))

;;;
;;; ── 2. obsidian-bin ─────────────────────────────────────────────────────
;;; Knowledge base and note-taking application
;;;
(define-public obsidian-bin
  (package
    (name "obsidian-bin")
    (version "1.12.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/obsidianmd/obsidian-releases/releases/download/v"
             version "/Obsidian-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/obsidian"))
            (chmod (string-append bin "/obsidian") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://obsidian.md")
    (synopsis "knowledge base and note-taking app with Markdown support")
    (description
     "Obsidian is a powerful knowledge base application that works on local
Markdown files.  It features bidirectional linking, graph views, and an
extensible plugin system for personal knowledge management.")
    ;; Proprietary; custom Obsidian license.
    (license #f)))

;;;
;;; ── 3. 1password-bin ────────────────────────────────────────────────────
;;; Password manager and secure wallet
;;;
(define-public 1password-bin
  (package
    (name "1password-bin")
    (version "8.12.8")
    (source
     (origin
       (method url-fetch)
       ;; Rolling URL — hash corresponds to version above at time of packaging.
       (uri "https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/1password"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/1Password")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/1password")
                     (string-append bin "/1password"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://1password.com")
    (synopsis "password manager and secure digital wallet")
    (description
     "1Password is a password manager that stores passwords, software
licenses, and other sensitive information in a virtual vault.  It
features browser integration, two-factor authentication, and secure
sharing across devices.")
    ;; Proprietary.
    (license #f)))

;;;
;;; ── 4. rambox-bin ───────────────────────────────────────────────────────
;;; Workspace browser for web applications
;;;
(define-public rambox-bin
  (package
    (name "rambox-bin")
    (version "2.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ramboxapp/download/releases/download/v"
             version "/Rambox-" version "-linux-x64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/rambox"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Rambox")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/rambox")
                     (string-append bin "/rambox"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rambox.app")
    (synopsis "workspace browser for managing multiple web applications")
    (description
     "Rambox is a workspace organizer that allows you to combine common web
applications into one.  It supports services like Slack, WhatsApp,
Telegram, Gmail, and hundreds of other messaging and productivity tools.")
    ;; Proprietary.
    (license #f)))

;;;
;;; ── 5. ferdium-bin ──────────────────────────────────────────────────────
;;; Multi-service messaging browser
;;;
(define-public ferdium-bin
  (package
    (name "ferdium-bin")
    (version "7.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ferdium/ferdium-app/releases/download/v"
             version "/Ferdium-linux-Portable-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/ferdium"))
            (chmod (string-append bin "/ferdium") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ferdium.org")
    (synopsis "multi-service messaging browser combining web apps into one")
    (description
     "Ferdium is an open-source messaging browser that combines multiple web
applications into one application.  It supports services like WhatsApp,
Slack, Telegram, Gmail, and many more, running them all in a single
unified interface.")
    (license license:asl2.0)))

;;;
;;; ── 6. insomnia-bin ─────────────────────────────────────────────────────
;;; API client for REST and GraphQL
;;;
(define-public insomnia-bin
  (package
    (name "insomnia-bin")
    (version "12.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Kong/insomnia/releases/download/core%40"
             version "/Insomnia.Core-" version ".deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/insomnia"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Insomnia")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/insomnia")
                     (string-append bin "/insomnia"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://insomnia.rest")
    (synopsis "API client and design platform for REST and GraphQL")
    (description
     "Insomnia is a collaborative API client and design platform for building
and testing REST, GraphQL, gRPC, and SOAP APIs.  It features request
chaining, environment variables, and code generation.")
    (license license:asl2.0)))

;;;
;;; ── 7. datagrip-bin ─────────────────────────────────────────────────────
;;; JetBrains database IDE
;;;
(define-public datagrip-bin
  (package
    (name "datagrip-bin")
    (version "2026.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/datagrip/datagrip-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/datagrip"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^DataGrip" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/bin/datagrip.sh")
                     (string-append bin "/datagrip"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/datagrip/")
    (synopsis "smart SQL editor and advanced database client")
    (description
     "DataGrip is a JetBrains IDE for databases and SQL.  It supports
PostgreSQL, MySQL, Oracle, SQL Server, and many other databases with
intelligent query editing, schema navigation, and data export tools.")
    ;; Proprietary; JetBrains subscription license.
    (license #f)))

;;;
;;; ── 8. pycharm-professional-bin ─────────────────────────────────────────
;;; JetBrains Python IDE
;;;
(define-public pycharm-professional-bin
  (package
    (name "pycharm-professional-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/python/pycharm-professional-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/pycharm"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^pycharm" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/bin/pycharm.sh")
                     (string-append bin "/pycharm"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/pycharm/")
    (synopsis "Python IDE for professional developers")
    (description
     "PyCharm Professional is a full-featured Python IDE by JetBrains.  It
provides intelligent code completion, debugging, testing, profiling,
database tools, and support for web frameworks like Django and Flask.")
    ;; Proprietary; JetBrains subscription license.
    (license #f)))

;;;
;;; ── 9. webstorm-bin ─────────────────────────────────────────────────────
;;; JetBrains JavaScript IDE
;;;
(define-public webstorm-bin
  (package
    (name "webstorm-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/webstorm/WebStorm-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/webstorm"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^WebStorm" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/bin/webstorm.sh")
                     (string-append bin "/webstorm"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/webstorm/")
    (synopsis "JavaScript and TypeScript IDE")
    (description
     "WebStorm is a JetBrains IDE for JavaScript and TypeScript development.
It provides advanced coding assistance for React, Angular, Vue.js, and
Node.js with built-in debugging, testing, and version control.")
    ;; Proprietary; JetBrains subscription license.
    (license #f)))

;;;
;;; ── 10. goland-bin ──────────────────────────────────────────────────────
;;; JetBrains Go IDE
;;;
(define-public goland-bin
  (package
    (name "goland-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/go/goland-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/goland"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^GoLand" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/bin/goland.sh")
                     (string-append bin "/goland"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/go/")
    (synopsis "capable and ergonomic Go IDE")
    (description
     "GoLand is a JetBrains IDE designed for Go development.  It provides
smart code completion, refactoring, debugging, and testing tools
specifically tailored for the Go programming language.")
    ;; Proprietary; JetBrains subscription license.
    (license #f)))

;;;
;;; ── 11. mongodb-compass-bin ─────────────────────────────────────────────
;;; Official GUI for MongoDB
;;;
(define-public mongodb-compass-bin
  (package
    (name "mongodb-compass-bin")
    (version "1.49.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mongodb-js/compass/releases/download/v"
             version "/mongodb-compass_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/mongodb-compass"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/lib/mongodb-compass")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/MongoDB Compass")
                     (string-append bin "/mongodb-compass"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mongodb.com/products/compass")
    (synopsis "official graphical interface for MongoDB")
    (description
     "MongoDB Compass is the official GUI for MongoDB.  It allows you to
explore and manipulate data, visualize query performance, run
aggregation pipelines, and manage indexes without writing queries.")
    ;; SSPL; effectively proprietary for most uses.
    (license #f)))

;;;
;;; ── 12. beekeeper-studio-bin ────────────────────────────────────────────
;;; Modern SQL client for databases
;;;
(define-public beekeeper-studio-bin
  (package
    (name "beekeeper-studio-bin")
    (version "5.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/beekeeper-studio/beekeeper-studio"
             "/releases/download/v" version
             "/Beekeeper-Studio-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/beekeeper-studio"))
            (chmod (string-append bin "/beekeeper-studio") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.beekeeperstudio.io")
    (synopsis "modern SQL client for MySQL, Postgres, SQLite, and more")
    (description
     "Beekeeper Studio is a cross-platform SQL editor and database manager.
It supports MySQL, PostgreSQL, SQLite, SQL Server, CockroachDB, and
more with a clean, modern interface for writing and running queries.")
    (license license:gpl3+)))

;;;
;;; ── 13. parsec-bin ──────────────────────────────────────────────────────
;;; Low-latency remote desktop for gaming
;;;
(define-public parsec-bin
  (package
    (name "parsec-bin")
    (version "150_97c")
    (source
     (origin
       (method url-fetch)
       ;; Rolling URL — hash corresponds to version above at time of packaging.
       (uri "https://builds.parsec.app/package/parsec-linux.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/parsec"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            ;; Parsec .deb uses data.tar.gz
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.gz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/bin")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir bin)))
            (let ((srcdir (string-append tmp "/usr/share/parsec")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://parsec.app")
    (synopsis "low-latency remote desktop application for gaming")
    (description
     "Parsec is a remote desktop application optimized for low-latency
gaming.  It enables users to remotely connect to gaming PCs with
near-zero latency, supporting up to 4K resolution at 60 FPS.")
    ;; Proprietary.
    (license #f)))

;;;
;;; ── 14. sunshine-bin ────────────────────────────────────────────────────
;;; Self-hosted game streaming host
;;;
(define-public sunshine-bin
  (package
    (name "sunshine-bin")
    (version "2025.924.154138")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/LizardByte/Sunshine/releases/download/v"
             version "/sunshine.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/sunshine"))
            (chmod (string-append bin "/sunshine") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://app.lizardbyte.dev")
    (synopsis "self-hosted game streaming host for Moonlight")
    (description
     "Sunshine is a self-hosted game stream host for the Moonlight client.
It allows streaming games and applications from a host PC to another
device with low latency, supporting hardware encoding via NVIDIA,
AMD, and Intel GPUs.")
    (license license:gpl3)))

;;;
;;; ── 15. protonmail-bridge-bin ───────────────────────────────────────────
;;; ProtonMail IMAP/SMTP bridge for desktop clients
;;;
(define-public protonmail-bridge-bin
  (package
    (name "protonmail-bridge-bin")
    (version "3.23.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ProtonMail/proton-bridge/releases/download/v"
             version "/protonmail-bridge_" version "-1_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/protonmail-bridge"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/lib/protonmail/bridge")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/proton-bridge")
                     (string-append bin "/protonmail-bridge"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://proton.me/mail/bridge")
    (synopsis "ProtonMail IMAP/SMTP bridge for desktop email clients")
    (description
     "ProtonMail Bridge runs on your desktop and creates a local IMAP/SMTP
server.  It enables using ProtonMail with standard email clients like
Thunderbird, Outlook, and Apple Mail while maintaining end-to-end
encryption.")
    (license license:gpl3+)))

;;;
;;; ── 16. vivaldi-bin ─────────────────────────────────────────────────────
;;; Chromium-based browser with advanced customization
;;;
(define-public vivaldi-bin
  (package
    (name "vivaldi-bin")
    (version "7.9.3970.47")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.vivaldi.com/stable/vivaldi-stable_"
             version "-1_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/vivaldi"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/vivaldi")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/vivaldi")
                     (string-append bin "/vivaldi"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vivaldi.com")
    (synopsis "chromium-based web browser with advanced customization")
    (description
     "Vivaldi is a Chromium-based web browser focused on customization and
power-user features.  It offers built-in mail, calendar, feed reader,
tab stacking, command chains, and extensive UI theming options.")
    ;; Proprietary; custom Vivaldi license.
    (license #f)))

;;;
;;; ── 17. waterfox-bin ────────────────────────────────────────────────────
;;; Privacy-focused Firefox-based browser
;;;
(define-public waterfox-bin
  (package
    (name "waterfox-bin")
    (version "6.6.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.waterfox.com/waterfox/releases/"
             version "/Linux_x86_64/waterfox-" version ".tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/waterfox"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append bzip2 "/bin/bzip2")
                    "-xf" src "-C" tmp)
            (let ((srcdir (string-append tmp "/waterfox")))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/waterfox")
                     (string-append bin "/waterfox"))
            #t))))
    (native-inputs (list tar bzip2))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.waterfox.net")
    (synopsis "privacy-focused web browser based on Firefox")
    (description
     "Waterfox is a privacy-focused web browser based on Mozilla Firefox.
It strips telemetry and data collection while maintaining compatibility
with Firefox extensions and providing a fast browsing experience.")
    (license license:mpl2.0)))

;;;
;;; ── 18. youtube-music-bin ───────────────────────────────────────────────
;;; YouTube Music desktop application
;;;
(define-public youtube-music-bin
  (package
    (name "youtube-music-bin")
    (version "3.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pear-devs/pear-desktop/releases/download/v"
             version "/YouTube-Music-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/youtube-music"))
            (chmod (string-append bin "/youtube-music") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pear-devs/pear-desktop")
    (synopsis "YouTube Music desktop application with plugin support")
    (description
     "YouTube Music is an Electron-based desktop application for YouTube
Music.  It features a native-like experience with support for plugins,
custom themes, and media key integration on Linux.")
    (license license:expat)))

;;;
;;; ── 19. jellyfin-media-player-bin ───────────────────────────────────────
;;; Jellyfin desktop media player client
;;;
(define-public jellyfin-media-player-bin
  (package
    (name "jellyfin-media-player-bin")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jellyfin/jellyfin-media-player"
             "/releases/download/v" version
             "/jellyfin-media-player_" version "-1_amd64-bookworm.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/jellyfin-media-player"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/usr/lib/jellyfin-media-player")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/jellyfinmediaplayer")
                     (string-append bin "/jellyfin-media-player"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jellyfin/jellyfin-media-player")
    (synopsis "Jellyfin desktop media player client")
    (description
     "Jellyfin Media Player is a desktop client for the Jellyfin media
server.  It provides a native media playback experience with support
for hardware-accelerated decoding, subtitles, and remote control.")
    (license license:gpl2)))

;;;
;;; ── 20. drawio-desktop-bin ──────────────────────────────────────────────
;;; Diagram drawing application
;;;
(define-public drawio-desktop-bin
  (package
    (name "drawio-desktop-bin")
    (version "29.6.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jgraph/drawio-desktop/releases/download/v"
             version "/drawio-x86_64-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/drawio"))
            (chmod (string-append bin "/drawio") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.drawio.com")
    (synopsis "diagram drawing application built on web technology")
    (description
     "draw.io Desktop is a diagram and whiteboard application that lets you
create flowcharts, network diagrams, UML diagrams, and more.  It works
offline and supports multiple export formats including SVG, PNG, and PDF.")
    (license license:asl2.0)))

;;;
;;; ── 21. figma-linux-bin ─────────────────────────────────────────────────
;;; Unofficial Figma desktop client for Linux
;;;
(define-public figma-linux-bin
  (package
    (name "figma-linux-bin")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Figma-Linux/figma-linux/releases/download/v"
             version "/figma-linux_" version "_linux_x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/figma-linux"))
            (chmod (string-append bin "/figma-linux") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Figma-Linux/figma-linux")
    (synopsis "unofficial Figma desktop client for Linux")
    (description
     "Figma Linux is an unofficial desktop application for the Figma
collaborative design tool.  It provides a native Linux experience for
accessing Figma's interface design and prototyping features.")
    (license license:gpl2)))

;;;
;;; ── 22. wps-office-bin ──────────────────────────────────────────────────
;;; Kingsoft WPS Office suite
;;;
(define-public wps-office-bin
  (package
    (name "wps-office-bin")
    (version "11.1.0.11723")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/"
             (car (last-pair (string-split version #\.)))
             "/wps-office_" version ".XA_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/kingsoft/wps-office"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/kingsoft/wps-office")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (for-each
             (lambda (name)
               (let ((src-path (string-append opt "/office6/" name)))
                 (when (file-exists? src-path)
                   (symlink src-path (string-append bin "/" name)))))
             '("wps" "wpp" "et" "wpspdf"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wps.com")
    (synopsis "office productivity suite compatible with Microsoft Office")
    (description
     "WPS Office is an office suite developed by Kingsoft that includes
Writer, Presentation, and Spreadsheet applications.  It is compatible
with Microsoft Office formats including DOCX, PPTX, and XLSX.")
    ;; Proprietary; WPS EULA.
    (license #f)))

;;;
;;; ── 23. marktext-bin ────────────────────────────────────────────────────
;;; Simple and elegant markdown editor
;;;
(define-public marktext-bin
  (package
    (name "marktext-bin")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/marktext/marktext/releases/download/v"
             version "/marktext-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/marktext"))
            (chmod (string-append bin "/marktext") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.marktext.cc")
    (synopsis "simple and elegant open-source markdown editor")
    (description
     "Mark Text is a simple and elegant markdown editor focused on speed
and usability.  It features real-time preview, support for CommonMark
and GitHub Flavored Markdown, and various editing modes including
source code and typewriter mode.")
    (license license:expat)))

;;;
;;; ── 24. joplin-appimage ─────────────────────────────────────────────────
;;; Open source note-taking and to-do application
;;;
(define-public joplin-appimage
  (package
    (name "joplin-appimage")
    (version "3.5.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/laurent22/joplin/releases/download/v"
             version "/Joplin-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/joplin"))
            (chmod (string-append bin "/joplin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://joplinapp.org")
    (synopsis "open-source note-taking and to-do application")
    (description
     "Joplin is an open-source note-taking and to-do application with
synchronization capabilities.  It supports Markdown, end-to-end
encryption, and can sync with various cloud services including
Nextcloud, Dropbox, and OneDrive.")
    (license license:expat)))

;;;
;;; ── 25. simplenote-electron-bin ─────────────────────────────────────────
;;; Simple cross-platform note taking
;;;
(define-public simplenote-electron-bin
  (package
    (name "simplenote-electron-bin")
    (version "2.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Automattic/simplenote-electron"
             "/releases/download/v" version
             "/Simplenote-linux-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/simplenote"))
            (chmod (string-append bin "/simplenote") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://simplenote.com")
    (synopsis "simple cross-platform note-taking application")
    (description
     "Simplenote is a note-taking application by Automattic that keeps
notes in sync across devices.  It features tags, search, version
history, and Markdown support with a clean, distraction-free
interface.")
    (license license:gpl2)))

;;;
;;; ── 26. signal-desktop-bin ──────────────────────────────────────────────
;;; Private messenger for desktop
;;;
(define-public signal-desktop-bin
  (package
    (name "signal-desktop-bin")
    (version "8.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://updates.signal.org/desktop/apt/pool/s/signal-desktop"
             "/signal-desktop_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/signal-desktop"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Signal")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/signal-desktop")
                     (string-append bin "/signal-desktop"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://signal.org")
    (synopsis "private messenger with end-to-end encryption")
    (description
     "Signal Desktop is the desktop client for the Signal private messenger.
It provides end-to-end encrypted messaging, voice calls, and video calls
with a focus on privacy and security.  Messages sync with the Signal
mobile app.")
    (license license:agpl3+)))

;;;
;;; ── 27. element-desktop-bin ─────────────────────────────────────────────
;;; Matrix collaboration client for desktop
;;;
(define-public element-desktop-bin
  (package
    (name "element-desktop-bin")
    (version "1.12.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://packages.element.io/debian/pool/main/e/element-desktop"
             "/element-desktop_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/element-desktop"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append (@ (gnu packages base) binutils) "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/Element")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/element-desktop")
                     (string-append bin "/element-desktop"))
            #t))))
    (native-inputs (list tar gzip xz (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://element.io")
    (synopsis "glossy Matrix collaboration client for desktop")
    (description
     "Element is a desktop client for the Matrix communication protocol.
It provides encrypted messaging, voice and video calls, file sharing,
and integration with bridges to other messaging platforms like Slack,
IRC, and Telegram.")
    (license license:agpl3+)))

;;;
;;; ── 28. session-desktop-bin ─────────────────────────────────────────────
;;; Decentralized onion-routed messenger
;;;
(define-public session-desktop-bin
  (package
    (name "session-desktop-bin")
    (version "1.17.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/session-foundation/session-desktop"
             "/releases/download/v" version
             "/session-desktop-linux-x86_64-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/session-desktop"))
            (chmod (string-append bin "/session-desktop") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getsession.org")
    (synopsis "decentralized onion-routed private messenger")
    (description
     "Session is a decentralized messenger that uses onion routing for
privacy.  It does not require a phone number or email to sign up and
provides end-to-end encryption for messages, voice messages, and
file attachments.")
    (license license:gpl3)))

;;;
;;; ── 29. feishin-bin ─────────────────────────────────────────────────────
;;; Modern self-hosted music player
;;;
(define-public feishin-bin
  (package
    (name "feishin-bin")
    (version "1.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jeffvli/feishin/releases/download/v"
             version "/Feishin-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/feishin"))
            (chmod (string-append bin "/feishin") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jeffvli/feishin")
    (synopsis "modern self-hosted music player for Navidrome and Jellyfin")
    (description
     "Feishin is a modern desktop music player that connects to self-hosted
music servers like Navidrome and Jellyfin.  It features a polished
interface, gapless playback, lyrics display, and playlist management.")
    (license license:gpl3)))

;;;
;;; ── 30. caprine-bin ─────────────────────────────────────────────────────
;;; Elegant Facebook Messenger desktop app
;;;
(define-public caprine-bin
  (package
    (name "caprine-bin")
    (version "2.60.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sindresorhus/caprine/releases/download/v"
             version "/Caprine-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/caprine"))
            (chmod (string-append bin "/caprine") #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sindresorhus.com/caprine")
    (synopsis "elegant Facebook Messenger desktop application")
    (description
     "Caprine is an unofficial, privacy-focused Facebook Messenger app for
desktop.  It features dark mode, keyboard shortcuts, desktop
notifications, and the ability to hide distracting UI elements from
the Messenger interface.")
    (license license:expat)))
