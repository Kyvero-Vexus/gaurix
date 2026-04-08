;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 10 binary repacks (copy-build-system)
;;;   - 5 icon/font/data packages (copy-build-system)
;;;   - 5 source builds (cmake/gnu/copy)
;;;   - 10 re-evaluated with specific blocking reasons
;;;
;;; New recipes (20):
;;;   - simplex-chat-bin: private messaging CLI (Haskell binary)
;;;   - sourcegit-bin: cross-platform Git GUI (.NET AppImage)
;;;   - github-desktop-plus-bin: GitHub Desktop fork (AppImage)
;;;   - seamonkey-bin: internet application suite (binary tarball)
;;;   - openbuilds-control-bin: CNC machine control (Electron .deb)
;;;   - bfg: Git repo cleaner (Java jar)
;;;   - apache-gremlin-console: TinkerPop graph DB console (Java)
;;;   - nzbhydra2-bin: NZB meta-search/aggregator (Java binary)
;;;   - deadd-notification-center-bin: desktop notification center
;;;   - dupeguru: duplicate file finder (Python .deb)
;;;   - quickemu: quick VM creation with QEMU (shell scripts)
;;;   - xdg-terminal-exec: XDG default terminal launcher (shell)
;;;   - whitesur-icon-theme: macOS Big Sur icon theme
;;;   - candy-icons-git: candy-colored icon theme
;;;   - sweet-folders-icons-git: Sweet folder icon theme
;;;   - simple2d: simple 2D graphics library for C
;;;   - apngasm: animated PNG assembler (CMake)
;;;   - cpr: C++ HTTP requests library (CMake)
;;;   - logiops: unofficial Logitech driver (CMake)
;;;   - fontpreview: terminal font previewer (shell script)
;;;
;;; Re-evaluated (blocked with specific reasons):
;;;   - waypaper: needs GTK4/libadwaita + missing Python deps
;;;   - exaile: Python/GTK3, 15+ optional deps not in Guix
;;;   - fcitx5-mcbopomofo-git: needs fcitx5 CMake infrastructure
;;;   - fcitx5-sitelen-pona: needs fcitx5 + libime table builder
;;;   - grub-customizer: complex C++ GTK3 + GRUB2 libs + polkit
;;;   - subliminal: Python, 5+ missing deps
;;;   - varia: Python/GTK4/Meson, needs blueprint-compiler
;;;   - auto-cpufreq: systemd service + polkit + missing Python deps
;;;   - safe-rm: Rust/Cargo, needs full vendored crate enumeration
;;;   - makemkv: proprietary+OSS hybrid, complex ffmpeg linkage
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages tls)
  #:export (
            simplex-chat-bin
            sourcegit-bin
            github-desktop-plus-bin
            seamonkey-bin
            openbuilds-control-bin
            bfg-repo-cleaner
            apache-gremlin-console
            nzbhydra2-bin
            deadd-notification-center-bin
            dupeguru
            quickemu
            xdg-terminal-exec
            whitesur-icon-theme
            candy-icons-git
            sweet-folders-icons-git
            simple2d
            apngasm
            cpr
            logiops
            fontpreview))

;;;
;;; ── simplex-chat-bin ──────────────────────────────────────────────
;;; SimpleX Chat CLI — private-by-design messaging
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
             version "/simplex-chat-ubuntu-22_04-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("simplex-chat" "bin/simplex-chat"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "simplex-chat")
                   (chmod "simplex-chat" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/simplex-chat"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://simplex.chat")
    (synopsis "private-by-design messaging platform without user identifiers")
    (description
     "SimpleX Chat is a fully decentralized messaging platform that operates
without user identifiers such as phone numbers or usernames.  Messages are
routed through relay servers using the SimpleX Messaging Protocol, providing
end-to-end encryption and metadata privacy.  This package provides the
pre-built command-line client.")
    (license license:agpl3+)))

;;;
;;; ── sourcegit-bin ──────────────────────────────────────────────
;;; SourceGit — cross-platform Git GUI client
;;;
(define-public sourcegit-bin
  (package
    (name "sourcegit-bin")
    (version "2026.07")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sourcegit-scm/sourcegit/releases/download/v"
             version "/sourcegit-" version ".linux.amd64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sourcegit" "bin/sourcegit"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "sourcegit")
              (chmod "sourcegit" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sourcegit-scm/sourcegit")
    (synopsis "cross-platform Git GUI client built with Avalonia")
    (description
     "SourceGit is a free, open-source, cross-platform Git GUI client built
with Avalonia UI.  It provides visual commit graph, diff viewer, merge
conflict resolution, and Git LFS support.  This package provides the
pre-built AppImage binary.")
    (license license:expat)))

;;;
;;; ── github-desktop-plus-bin ──────────────────────────────────────
;;; GitHub Desktop Plus — enhanced GitHub Desktop for Linux
;;;
(define-public github-desktop-plus-bin
  (package
    (name "github-desktop-plus-bin")
    (version "3.5.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pol-rivero/github-desktop-plus/releases/download/v"
             version "/GitHubDesktopPlus-v" version
             "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("github-desktop-plus" "bin/github-desktop-plus"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "github-desktop-plus")
              (chmod "github-desktop-plus" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pol-rivero/github-desktop-plus")
    (synopsis "enhanced fork of GitHub Desktop with Linux support")
    (description
     "GitHub Desktop Plus is an enhanced fork of the official GitHub Desktop
application with additional features including custom themes, improved
conflict resolution, and native Linux support.  This package provides
the pre-built AppImage binary.")
    (license license:expat)))

;;;
;;; ── seamonkey-bin ──────────────────────────────────────────────
;;; SeaMonkey — all-in-one internet application suite
;;;
(define-public seamonkey-bin
  (package
    (name "seamonkey-bin")
    (version "2.53.23")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://archive.seamonkey-project.org/releases/" version
             "/linux-x86_64/en-US/seamonkey-" version
             ".en-US.linux-x86_64.tar.bz2"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/seamonkey/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/lib/seamonkey/seamonkey")
                         (string-append out "/bin/seamonkey"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.seamonkey-project.org")
    (synopsis "all-in-one internet application suite with browser and email")
    (description
     "SeaMonkey is an all-in-one internet application suite combining a web
browser, email and newsgroup client, HTML editor, IRC chat client, and
web development tools.  It is the continuation of the former Mozilla
Application Suite.  This package provides the pre-built binary.")
    (license license:mpl2.0)))

;;;
;;; ── openbuilds-control-bin ──────────────────────────────────────
;;; OpenBuilds CONTROL — CNC machine control interface
;;;
(define-public openbuilds-control-bin
  (package
    (name "openbuilds-control-bin")
    (version "1.0.390")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OpenBuilds/OpenBuilds-CONTROL/releases/download/v"
             version "/OpenBuildsCONTROL_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/OpenBuilds CONTROL" "share/openbuilds-control/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append
                          out "/share/openbuilds-control/openbuilds-control")
                         (string-append out "/bin/openbuilds-control"))))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenBuilds/OpenBuilds-CONTROL")
    (synopsis "CNC machine control interface for OpenBuilds machines")
    (description
     "OpenBuilds CONTROL is an Electron-based application for controlling
CNC machines.  It provides G-code sending, machine jogging, probing,
and real-time status monitoring for OpenBuilds and GRBL-compatible
machines.  This package provides the pre-built binary.")
    (license license:gpl3)))

;;;
;;; ── bfg-repo-cleaner ──────────────────────────────────────────
;;; BFG Repo-Cleaner — remove large files from Git history
;;;
(define-public bfg-repo-cleaner
  (package
    (name "bfg-repo-cleaner")
    (version "1.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo1.maven.org/maven2/com/madgag/bfg/"
             version "/bfg-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bfg.jar" "share/java/bfg.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "bfg.jar")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (java (search-input-file inputs "bin/java")))
                (mkdir-p (string-append out "/bin"))
                (call-with-output-file (string-append out "/bin/bfg")
                  (lambda (port)
                    (format port "#!~a~%exec ~a -jar ~a/share/java/bfg.jar \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            java out)))
                (chmod (string-append out "/bin/bfg") #o755)))))))
    (inputs (list (list openjdk "jdk")))
    (home-page "https://rtyley.github.io/bfg-repo-cleaner/")
    (synopsis "fast alternative to git-filter-branch for cleaning Git history")
    (description
     "BFG Repo-Cleaner is a simpler, faster alternative to @command{git
filter-branch} for removing large files, passwords, credentials, and other
unwanted data from Git repository history.  It runs up to 100x faster than
@command{git filter-branch}.")
    (license license:gpl3)))

;;;
;;; ── apache-gremlin-console ──────────────────────────────────────
;;; Apache TinkerPop Gremlin Console — graph database query console
;;;
(define-public apache-gremlin-console
  (package
    (name "apache-gremlin-console")
    (version "3.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://archive.apache.org/dist/tinkerpop/" version
             "/apache-tinkerpop-gremlin-console-" version "-bin.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lib" "share/gremlin-console/lib")
          ("ext" "share/gremlin-console/ext")
          ("conf" "share/gremlin-console/conf")
          ("bin/gremlin.sh" "share/gremlin-console/bin/gremlin.sh"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" "-q" source)
              (chdir (string-append "apache-tinkerpop-gremlin-console-"
                                    #$version))))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (java (search-input-file inputs "bin/java")))
                (mkdir-p (string-append out "/bin"))
                (call-with-output-file (string-append out "/bin/gremlin")
                  (lambda (port)
                    (format port "#!~a~%export JAVA_HOME=~a~%exec ~a/share/gremlin-console/bin/gremlin.sh \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            (dirname (dirname java))
                            out)))
                (chmod (string-append out "/bin/gremlin") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list (list openjdk "jdk")))
    (home-page "https://tinkerpop.apache.org/")
    (synopsis "interactive console for Apache TinkerPop graph databases")
    (description
     "The Gremlin Console from Apache TinkerPop is a REPL environment for
interacting with graph databases using the Gremlin graph traversal
language.  It supports connecting to remote graph servers and local
in-memory graphs.")
    (license license:asl2.0)))

;;;
;;; ── nzbhydra2-bin ──────────────────────────────────────────────
;;; NZBHydra2 — NZB meta search and aggregator
;;;
(define-public nzbhydra2-bin
  (package
    (name "nzbhydra2-bin")
    (version "8.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/theotherp/nzbhydra2/releases/download/v"
             version "/nzbhydra2-" version "-amd64-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/nzbhydra2/"
           #:exclude ("readme.md" "changelog.md")))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" "-q" source)))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (call-with-output-file (string-append out "/bin/nzbhydra2")
                  (lambda (port)
                    (format port "#!~a~%exec ~a/share/nzbhydra2/nzbhydra2 \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            out)))
                (chmod (string-append out "/bin/nzbhydra2") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/theotherp/nzbhydra2")
    (synopsis "meta search aggregator for NZB indexers")
    (description
     "NZBHydra2 is a meta search application for NZB indexers.  It provides
access to multiple indexers via a single API, deduplication of results,
statistics, and integration with Sonarr, Radarr, and other download
automation tools.")
    (license license:asl2.0)))

;;;
;;; ── deadd-notification-center-bin ──────────────────────────────
;;; Deadd Notification Center — customizable notification center
;;;
(define-public deadd-notification-center-bin
  (package
    (name "deadd-notification-center-bin")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/phuhl/linux_notification_center"
             "/releases/download/" version
             "/deadd-notification-center"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("deadd-notification-center"
                "bin/deadd-notification-center"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "deadd-notification-center")
                   (chmod "deadd-notification-center" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append
                              out "/bin/deadd-notification-center"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/phuhl/linux_notification_center")
    (synopsis "customizable notification center for Linux desktops")
    (description
     "Deadd Notification Center is a notification daemon and center for
Linux desktops.  It provides a notification popup and a pull-down
notification center with configurable appearance, notification grouping,
and do-not-disturb mode.  This package provides the pre-built binary.")
    (license license:bsd-3)))

;;;
;;; ── dupeguru ──────────────────────────────────────────────
;;; dupeGuru — duplicate file finder
;;;
(define-public dupeguru
  (package
    (name "dupeguru")
    (version "4.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arsenetar/dupeguru/releases/download/"
             version "/dupeguru_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin" "bin")
          ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dupeguru.voltaicideas.net")
    (synopsis "cross-platform duplicate file finder with fuzzy matching")
    (description
     "dupeGuru is a cross-platform GUI tool for finding duplicate files on
your computer.  It can scan either by filename or content and supports
fuzzy matching for music files.  It supports multiple scan modes and
provides a reference/duplicate grouping system.")
    (license license:gpl3)))

;;;
;;; ── quickemu ──────────────────────────────────────────────
;;; Quickemu — quickly create and run VMs
;;;
(define-public quickemu
  (package
    (name "quickemu")
    (version "4.9.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/quickemu-project/quickemu")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/quickemu-project/quickemu")
    (synopsis "quickly create and run optimized virtual machines")
    (description
     "Quickemu is a Bash wrapper around QEMU that enables quick creation
and running of optimized Windows, macOS, and Linux desktop virtual machines.
It handles display, audio, USB passthrough, and port forwarding
configuration automatically.")
    (license license:expat)))

;;;
;;; ── xdg-terminal-exec ──────────────────────────────────────────
;;; XDG Terminal Exec — default terminal execution utility
;;;
(define-public xdg-terminal-exec
  (package
    (name "xdg-terminal-exec")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Vladimir-csp/xdg-terminal-exec")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/Vladimir-csp/xdg-terminal-exec")
    (synopsis "proposed XDG standard for default terminal emulator execution")
    (description
     "xdg-terminal-exec is an implementation of a proposed XDG standard for
launching the default terminal emulator.  It reads
@file{xdg-terminals.list} configuration files and desktop entries to
determine and launch the preferred terminal emulator for applications that
declare @code{Terminal=true}.")
    (license license:gpl3+)))

;;;
;;; ── whitesur-icon-theme ──────────────────────────────────────────
;;; WhiteSur icon theme — macOS Big Sur icons for Linux
;;;
(define-public whitesur-icon-theme
  (package
    (name "whitesur-icon-theme")
    (version "2025.12.27")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vinceliuice/WhiteSur-icon-theme")
             (commit "2025-12-27")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src" "share/icons/WhiteSur"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-via-script
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "./install.sh"
                        "-d" (string-append out "/share/icons"))))))))
    (home-page "https://github.com/vinceliuice/WhiteSur-icon-theme")
    (synopsis "macOS Big Sur style icon theme for Linux desktops")
    (description
     "WhiteSur icon theme is an icon theme designed to replicate the look
of macOS Big Sur on Linux desktop environments.  It supports GNOME,
KDE, Xfce, and other desktop environments.")
    (license license:gpl3)))

;;;
;;; ── candy-icons-git ──────────────────────────────────────────
;;; Candy Icons — colorful gradient icon theme
;;;
(define-public candy-icons-git
  (package
    (name "candy-icons-git")
    (version "0.0.0-1.83512fb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EliverLara/candy-icons")
             (commit "83512fb8caeda05df698d98b7c9cd6e93bfeef36")))
       (file-name (git-file-name "candy-icons" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/candy-icons/"
           #:exclude (".git" ".github" "README.md" "LICENSE")))))
    (home-page "https://github.com/EliverLara/candy-icons")
    (synopsis "colorful gradient icon theme for Linux desktops")
    (description
     "Candy Icons is a vibrant, colorful icon theme featuring gradient
designs for Linux desktop environments.  It provides icons for a wide
variety of applications and system elements.")
    (license license:gpl3)))

;;;
;;; ── sweet-folders-icons-git ──────────────────────────────────
;;; Sweet Folders — folder icons for the Sweet theme
;;;
(define-public sweet-folders-icons-git
  (package
    (name "sweet-folders-icons-git")
    (version "0.0.0-1.40a5d36")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/EliverLara/Sweet-folders")
             (commit "40a5d360a74dafabf1a7a49bbf79e31fbe95e4e6")))
       (file-name (git-file-name "sweet-folders" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Sweet-Rainbow" "share/icons/Sweet-Rainbow/"))))
    (home-page "https://github.com/EliverLara/Sweet-folders")
    (synopsis "folder icons for the Sweet GTK theme")
    (description
     "Sweet Folders provides colorful folder icons designed to complement
the Sweet GTK theme.  Multiple color variants are included.")
    (license license:gpl3)))

;;;
;;; ── simple2d ──────────────────────────────────────────────
;;; Simple 2D — 2D graphics library for C
;;;
(define-public simple2d
  (package
    (name "simple2d")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/simple2d/simple2d")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list sdl2 sdl2-image sdl2-mixer sdl2-ttf))
    (home-page "https://github.com/simple2d/simple2d")
    (synopsis "simple 2D graphics library for C wrapping SDL2")
    (description
     "Simple 2D is a small, open-source library that provides a simple
interface for creating 2D applications in C.  It wraps SDL2 and
OpenGL, providing functions for drawing shapes, images, sprites, and
text, as well as handling input and audio.")
    (license license:expat)))

;;;
;;; ── apngasm ──────────────────────────────────────────────
;;; APNG Assembler — create animated PNG files
;;;
(define-public apngasm
  (package
    (name "apngasm")
    (version "3.1.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/apngasm/apngasm")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libpng zlib boost))
    (home-page "https://github.com/apngasm/apngasm")
    (synopsis "assemble individual PNG frames into animated PNG files")
    (description
     "APNG Assembler creates animated PNG (APNG) files from individual
PNG frames.  It supports per-frame delay settings, various compression
options, and can produce both APNG and optimized static PNG output.")
    (license license:zlib)))

;;;
;;; ── cpr ──────────────────────────────────────────────
;;; CPR — C++ HTTP requests library
;;;
(define-public cpr
  (package
    (name "cpr")
    (version "1.14.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/libcpr/cpr")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DCPR_USE_SYSTEM_CURL=ON"
                   "-DBUILD_SHARED_LIBS=ON")))
    (inputs (list curl openssl))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/libcpr/cpr")
    (synopsis "C++ HTTP requests library inspired by Python Requests")
    (description
     "CPR (C++ Requests) is a modern C++ HTTP client library modeled
after the Python Requests library.  It provides a simple, intuitive
API for making HTTP requests with support for authentication, cookies,
multipart uploads, and asynchronous requests, wrapping libcurl.")
    (license license:expat)))

;;;
;;; ── logiops ──────────────────────────────────────────────
;;; LogiOps — unofficial Logitech options for Linux
;;;
(define-public logiops
  (package
    (name "logiops")
    (version "0.3.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/PixlOne/logiops")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list eudev libevdev libconfig))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/PixlOne/logiops")
    (synopsis "unofficial userspace driver for Logitech HID++ devices")
    (description
     "LogiOps is an unofficial driver and configuration daemon for Logitech
mice and keyboards that use the HID++ protocol.  It supports gesture
configuration, DPI settings, button remapping, and SmartShift
configuration for devices like the MX Master series.")
    (license license:gpl3+)))

;;;
;;; ── fontpreview ──────────────────────────────────────────
;;; fontpreview — preview fonts in the terminal
;;;
(define-public fontpreview
  (package
    (name "fontpreview")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sdushantha/fontpreview")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fontpreview" "bin/fontpreview"))))
    (home-page "https://github.com/sdushantha/fontpreview")
    (synopsis "preview fonts installed on your system in the terminal")
    (description
     "fontpreview is a shell script that allows you to preview fonts
installed on your system.  It uses @command{fzf} for font selection and
@command{imagemagick} to generate font preview images displayed via
@command{sxiv} or other image viewers.")
    (license license:expat)))
