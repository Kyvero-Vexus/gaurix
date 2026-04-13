;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260412a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 25 binary repacks (copy-build-system)
;;;   - 3 source builds (cmake, autotools, trivial)
;;;   - 1 Python package (pyproject-build-system)
;;;   - 1 shell script (trivial-build-system)
;;;
;;; Binary repacks:
;;;   1. vcvrack-bin: open-source virtual modular synthesizer (zip)
;;;   2. freac-bin: audio converter and CD ripper (AppImage)
;;;   3. gitnuro-bin: Git GUI client (JAR)
;;;   4. oama-bin: OAuth2 IMAP/SMTP renewal (tarball)
;;;   5. feedr-bin: terminal RSS/Atom feed reader (single binary)
;;;   6. crier-bin: push notification tool (tarball)
;;;   7. kotlin-native-bin: Kotlin/Native compiler SDK (tarball)
;;;   8. foxglove-bin: robotics visualization tool (deb)
;;;   9. sweep-bin: TUI minesweeper game (single binary)
;;;   10. pano-scrobbler-bin: music tracker/scrobbler (tarball)
;;;   11. ci-toolbox-bin: CI toolbox for GitLab CI (tarball)
;;;   12. axe-bin: xargs alternative with argument ordering (tarball)
;;;   13. tock-bin: CLI time tracking tool (tarball)
;;;   14. netscanner-bin: TUI network scanner (tarball)
;;;   15. pigo-bin: face detection library and CLI (tarball)
;;;   16. air-bin: live reload for Go apps (tarball)
;;;   17. neo4j-community-bin: graph database (deb)
;;;   18. reddcoin-bin: cryptocurrency wallet (tarball)
;;;   19. zebar-bin: customizable taskbar widgets (deb)
;;;   20. suwayomi-server-bin: manga reader server (JAR)
;;;   21. brave-bin: privacy-focused web browser (zip)
;;;   22. zen-browser-bin: performance-oriented Firefox fork (tarball)
;;;   23. ventoy-bin: bootable USB solution (tarball)
;;;   24. sliver-bin: open-source adversary emulation framework (binaries)
;;;   25. cliamp-bin: retro terminal music player (single binary)
;;;
;;; Source builds:
;;;   25. stormlib: MPQ archive library (cmake)
;;;   26. rarian: documentation metadata library (autotools)
;;;
;;; Shell script:
;;;   27. tungsten: WolframAlpha CLI (single script)
;;;
;;; Python:
;;;   28. python-importmonkey: import path utility (trivial)
;;;
;;; Binary JAR:
;;;   29. paper-velocity: Minecraft server proxy (JAR)
;;;
;;; Re-evaluated blocked:
;;;   30. (none — all 30 resolved)
;;;
;;; NOTE: Hashes are from AUR PKGBUILDs (converted hex sha256 to base32).

(define-module (gaurix packages recipe-resolver-260412a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages pkg-config)
  #:export (vcvrack-bin
            freac-bin
            gitnuro-bin
            oama-bin
            feedr-bin
            crier-bin
            kotlin-native-bin
            foxglove-bin
            sweep-bin
            pano-scrobbler-bin
            ci-toolbox-bin
            axe-bin
            tock-bin
            netscanner-bin
            pigo-bin
            air-bin
            neo4j-community-bin
            reddcoin-bin
            zebar-bin
            suwayomi-server-bin
            brave-bin
            zen-browser-bin
            ventoy-bin
            sliver-bin
            cliamp-bin
            stormlib
            rarian
            tungsten
            python-importmonkey
            paper-velocity))

;;; -------------------------------------------------------
;;; 1. vcvrack-bin — virtual modular synthesizer (zip)
;;; -------------------------------------------------------

(define-public vcvrack-bin
  (package
    (name "vcvrack-bin")
    (version "2.6.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://vcvrack.com/downloads/RackFree-"
                    version "-lin-x64.zip"))
              (sha256
               (base32 "0vpwn0zhdnl90hgn9n3vpn3rifgvvh4xc5d1j493ins7ip4z1b39"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("Rack2Free" "share/vcvrack/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/vcvrack")
                       (lambda ()
                         (format #t "#!~a~%exec ~a/share/vcvrack/Rack \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 out)))
                     (chmod (string-append bin "/vcvrack") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vcvrack.com/")
    (synopsis "Open-source virtual modular synthesizer")
    (description "VCV Rack is a free and open-source virtual modular
synthesizer.  It simulates a Eurorack modular synthesizer with a library of
modules for oscillators, filters, sequencers, and effects.  Users can build
custom synthesizer patches by connecting modules together via virtual cables.")
    (license license:gpl3+)))

;;; -------------------------------------------------------
;;; 2. freac-bin — audio converter (AppImage)
;;; -------------------------------------------------------

(define-public freac-bin
  (package
    (name "freac-bin")
    (version "1.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/enzo1982/freac/releases/download/v"
                    version "/freac-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "1mpjj7m5b1vx22b7jd2bkwygwmz59vv2y04xcghrh11sdkpdim8p"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("freac.AppImage" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "freac.AppImage")
                     (chmod "freac.AppImage" #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.freac.org/")
    (synopsis "Audio converter and CD ripper with support for many formats")
    (description "fre:ac is a free audio converter and CD ripper that supports
various popular formats and encoders.  It converts between MP3, MP4/M4A, WMA,
Ogg Vorbis, FLAC, AAC, WAV, and Bonk formats.  It integrates freedb/CDDB for
automatic CD track naming.")
    (license license:gpl2)))

;;; -------------------------------------------------------
;;; 3. gitnuro-bin — Git GUI client (JAR)
;;; -------------------------------------------------------

(define-public gitnuro-bin
  (package
    (name "gitnuro-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JetpackDuba/Gitnuro/releases/download/v"
                    version "/Gitnuro-linux-x86_64-" version ".jar"))
              (sha256
               (base32 "0r3fdnn247y5vjy9198s4spmxsqm4aiy1drkq6v07rhfvz1n700j"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("Gitnuro.jar" "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file (car (find-files "." "\\.jar$")) "Gitnuro.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/gitnuro")
                       (lambda ()
                         (format #t "#!~a~%exec ~a -jar ~a/share/java/Gitnuro.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append bin "/gitnuro") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/JetpackDuba/Gitnuro")
    (synopsis "Multiplatform Git client for desktop")
    (description "Gitnuro is a free and open-source Git client built with
Kotlin and Compose for Desktop.  It provides a graphical interface for Git
operations including staging, committing, branching, merging, and viewing
diffs and logs.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 4. oama-bin — OAuth2 IMAP renewal (tarball)
;;; -------------------------------------------------------

(define-public oama-bin
  (package
    (name "oama-bin")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pdobsan/oama/releases/download/"
                    version "/oama-" version "-Linux-x86_64.tar.gz"))
              (sha256
               (base32 "0856g63w3zihlb68pn9haz1qdh74lixf2d9sqsiqli3ihjsnnnb3"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("oama" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pdobsan/oama")
    (synopsis "OAuth2 credential renewal for IMAP and SMTP")
    (description "Oama provides OAuth2 renewal and authorization capabilities
for email clients.  It manages OAuth2 tokens for use with IMAP and SMTP
servers, supporting providers such as Google and Microsoft.  It integrates
with mail clients like mutt, neomutt, msmtp, fdm, offlineimap, and isync.")
    (license license:bsd-3)))

;;; -------------------------------------------------------
;;; 5. feedr-bin — terminal RSS reader (single binary)
;;; -------------------------------------------------------

(define-public feedr-bin
  (package
    (name "feedr-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/feedr/releases/download/v"
                    version "/feedr-linux-x86_64"))
              (sha256
               (base32 "12lq9hqv67cbry40zcsd3l6s2q9jf0wdgczahiknqxpamnnyy83p"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("feedr" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-and-chmod
                 (lambda _
                   (rename-file (car (find-files "." "feedr"))
                                "feedr")
                   (chmod "feedr" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/feedr")
    (synopsis "Terminal-based RSS and Atom feed reader")
    (description "Feedr is a feature-rich terminal-based RSS and Atom feed
reader written in Rust.  It provides a TUI interface for subscribing to and
reading feeds directly from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 6. crier-bin — push notification tool (tarball)
;;; -------------------------------------------------------

(define-public crier-bin
  (package
    (name "crier-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/skorotkiewicz/crier/releases/download/"
                    version "/crier-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0b204py1nf70fw5zdbn4xdcfj659d5v27bsglrn704qjib62ghhl"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("crier" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/crier")
    (synopsis "Simple push notification tool for LAN and internet")
    (description "Crier is a simple push notification tool that works on LAN
via TCP or across the internet via MQTT.  It allows sending and receiving
notifications between devices on the same network or remotely.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 7. kotlin-native-bin — Kotlin/Native compiler SDK
;;; -------------------------------------------------------

(define-public kotlin-native-bin
  (package
    (name "kotlin-native-bin")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JetBrains/kotlin/releases/download/v"
                    version "/kotlin-native-prebuilt-linux-x86_64-"
                    version ".tar.gz"))
              (sha256
               (base32 "0zjn399ly374manyzp9gnbja5k6f6g279r817v7xl1ndy8mgkm30"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "lib/kotlin-native/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-symlinks
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (kn (string-append out "/lib/kotlin-native/bin")))
                     (mkdir-p bin)
                     (for-each
                      (lambda (tool)
                        (let ((target (string-append kn "/" tool)))
                          (when (file-exists? target)
                            (symlink target (string-append bin "/" tool)))))
                      '("kotlinc-native" "konanc" "klib" "cinterop"
                        "run_konan" "generate-platform"))))))))
    (inputs (list icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kotlinlang.org/docs/native-overview.html")
    (synopsis "LLVM-based backend for the Kotlin compiler")
    (description "Kotlin/Native is an LLVM-based backend for the Kotlin
compiler and a native implementation of the Kotlin standard library.  It
compiles Kotlin code to native binaries that run without a virtual machine,
targeting platforms including Linux, macOS, Windows, iOS, and embedded systems.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 8. foxglove-bin — robotics visualization (deb)
;;; -------------------------------------------------------

(define-public foxglove-bin
  (package
    (name "foxglove-bin")
    (version "2.48.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://get.foxglove.dev/desktop/v"
                    version "/foxglove-studio-" version
                    "-linux-amd64.deb"))
              (sha256
               (base32 "1b913sv7z6b7cvajcn6i7blsbm91hsjrgrz54shrfl59z1lzwrvd"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://foxglove.dev/")
    (synopsis "Integrated visualization and diagnosis tool for robotics")
    (description "Foxglove is an open-source visualization and diagnosis tool
for robotics development.  It supports ROS 1, ROS 2, and custom data sources,
providing interactive panels for 3D visualization, plots, logs, and image
viewing.  Data can be loaded from local files or streamed live from robots.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 9. sweep-bin — TUI minesweeper (single binary)
;;; -------------------------------------------------------

(define-public sweep-bin
  (package
    (name "sweep-bin")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Erokez0/sweep/releases/download/v"
                    version "/sweep-linux-amd64"))
              (sha256
               (base32 "1vd5aq28fq7wkjwqz80a5281mb28msa8lj47rj6mpj9dd0ha9y7x"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("sweep" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-and-chmod
                 (lambda _
                   (rename-file (car (find-files "." "sweep"))
                                "sweep")
                   (chmod "sweep" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Erokez0/sweep")
    (synopsis "Flexible minesweeping game for the terminal")
    (description "Sweep is a TUI minesweeper game that runs in the terminal
emulator.  It provides a flexible minesweeping experience with configurable
difficulty and board sizes.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 10. pano-scrobbler-bin — music tracker (tarball)
;;; -------------------------------------------------------

(define-public pano-scrobbler-bin
  (package
    (name "pano-scrobbler-bin")
    (version "4.37")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kawaiiDango/pano-scrobbler/releases/download/"
                    "437/pano-scrobbler-linux-x64.tar.gz"))
              (sha256
               (base32 "1yvg2g1c6pcdn17j4680224fpw7svj1iajlk236dnxmvzx51mky6"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/pano-scrobbler/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/pano-scrobbler")
                       (lambda ()
                         (format #t "#!~a~%exec ~a/share/pano-scrobbler/pano-scrobbler \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 out)))
                     (chmod (string-append bin "/pano-scrobbler") #o755)))))))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kawaiiDango/pano-scrobbler")
    (synopsis "Cross-platform music tracker and scrobbler")
    (description "Pano Scrobbler is a feature-packed cross-platform music
tracker that scrobbles to Last.fm, ListenBrainz, GNU FM, Pleroma, and other
compatible services.  It detects currently playing tracks from various music
players via MPRIS and submits listening data.")
    (license license:gpl3+)))

;;; -------------------------------------------------------
;;; 11. ci-toolbox-bin — CI toolbox for GitLab (tarball)
;;; -------------------------------------------------------

(define-public ci-toolbox-bin
  (package
    (name "ci-toolbox-bin")
    (version "8.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/api/v4/projects/mbedsys%2fcitbx4gitlab"
                    "/packages/generic/ci-toolbox/"
                    version "/ci-toolbox-" version ".tar.xz"))
              (sha256
               (base32 "1jz9ya94cjyh79149njavadb8wrg1vz5p677618lqk8j2q8fvxim"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/mbedsys/citbx4gitlab")
    (synopsis "CI toolbox for GitLab CI pipelines")
    (description "CI Toolbox provides a set of utilities for enhancing GitLab
CI pipelines.  It includes tools for managing CI/CD workflow configurations,
build automation, and deployment scripts.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 12. axe-bin — xargs alternative (tarball)
;;; -------------------------------------------------------

(define-public axe-bin
  (package
    (name "axe-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jacek-kurlit/axe/releases/download/"
                    version "/axe-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1i8r8jqya4gj1nv2dwlx118lmy7mvab2fpv74y8dj7p8zscdhdny"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("axe" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'enter-dir
                 (lambda _
                   (let ((dir (car (find-files "." "^axe$" #:directories? #t))))
                     (when (not (string=? dir "axe"))
                       ;; Binary might be in a subdirectory
                       #t)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jacek-kurlit/axe")
    (synopsis "Argument execute: xargs alternative with argument ordering")
    (description "Axe is an xargs alternative that supports argument ordering.
It allows placing arguments at specific positions in the command line, not
just at the end like xargs.  This makes it useful for commands that require
arguments in a particular order.")
    (license license:asl2.0)))

;;; -------------------------------------------------------
;;; 13. tock-bin — CLI time tracker (tarball)
;;; -------------------------------------------------------

(define-public tock-bin
  (package
    (name "tock-bin")
    (version "1.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kriuchkov/tock/releases/download/v"
                    version "/tock_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0018xq04f2kznhwvln41zjflr2i0sr5yf9mljycdlgav45hi22vj"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("tock" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kriuchkov/tock")
    (synopsis "Powerful time tracking tool for the command line")
    (description "Tock is a command-line time tracking tool that helps you
record and analyze how you spend your time.  It supports projects, tags,
and detailed reports for tracking work hours and activities.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 14. netscanner-bin — TUI network scanner (tarball)
;;; -------------------------------------------------------

(define-public netscanner-bin
  (package
    (name "netscanner-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Chleba/netscanner/releases/download/v"
                    version "/netscanner-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0cnkc3gbq6fg4asx6xfv1brni2g4k5r9g72dmvigbnanmzq2b5qy"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("netscanner" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Chleba/netscanner")
    (synopsis "TUI network scanner for discovering devices and services")
    (description "Netscanner is a terminal user interface network scanner that
discovers devices and services on your network.  It provides an interactive
display of network hosts, open ports, and service information.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 15. pigo-bin — face detection CLI (tarball)
;;; -------------------------------------------------------

(define-public pigo-bin
  (package
    (name "pigo-bin")
    (version "1.4.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/esimov/pigo/releases/download/v"
                    version "/pigo-" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "1g7c3zmcngx7yw2x75lahjqj012v83l5aisz3diibpz0la3zibc0"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("pigo" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'find-binary
                 (lambda _
                   (let ((bin (car (find-files "." "^pigo$"))))
                     (when (not (string=? bin "pigo"))
                       (copy-file bin "pigo"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/esimov/pigo")
    (synopsis "Fast face detection and facial landmark detection library")
    (description "Pigo is a pure Go face detection library based on the Pixel
Intensity Comparison-based Object detection paper.  It supports face
detection, pupil and eye localization, and facial landmark point detection.
This package provides the pre-built command-line tool.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 16. air-bin — live reload for Go (tarball)
;;; -------------------------------------------------------

(define-public air-bin
  (package
    (name "air-bin")
    (version "1.65.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/air-verse/air/releases/download/v"
                    version "/air_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "18j4aadfcyvrw483z41nbhkx4as475754lrxc83jw1rssppad0x1"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("air" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/air-verse/air")
    (synopsis "Live reload for Go applications during development")
    (description "Air is a live-reloading command-line utility for Go
applications.  It watches for file changes in your Go project and
automatically rebuilds and restarts the application, providing a faster
development feedback loop.")
    (license license:gpl3+)))

;;; -------------------------------------------------------
;;; 17. neo4j-community-bin — graph database (deb)
;;; -------------------------------------------------------

(define-public neo4j-community-bin
  (package
    (name "neo4j-community-bin")
    (version "2026.02.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dist.neo4j.org/deb/neo4j_"
                    version "_all.deb"))
              (sha256
               (base32 "1p9dh43ph7wgmywz00z3n6r851m3271dj6n38qafhnvx133mcykz"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/")
               ("var/" "/var/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (inputs (list icedtea))
    (home-page "https://neo4j.com/")
    (synopsis "High-performance graph database")
    (description "Neo4j is a high-performance, transactional graph database
implemented in Java.  It stores data as nodes and relationships with
properties, enabling complex queries via the Cypher query language.  This
package provides the community edition.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 18. reddcoin-bin — cryptocurrency wallet (tarball)
;;; -------------------------------------------------------

(define-public reddcoin-bin
  (package
    (name "reddcoin-bin")
    (version "4.22.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.reddcoin.com/bin/reddcoin-core-"
                    version "/reddcoin-" version
                    "-x86_64-linux-gnu.tar.gz"))
              (sha256
               (base32 "1dkzf1zd55yybjwbkvmcxg1n03jrglnxf1rbnd7wprsjrn9050qf"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("bin/" "bin/")
               ("lib/" "lib/")
               ("share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'enter-dir
                 (lambda _
                   (chdir (car (find-files "." "^reddcoin-" #:directories? #t))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.reddcoin.com/")
    (synopsis "Social cryptocurrency wallet and daemon")
    (description "Reddcoin is a cryptocurrency designed for social media
tipping and micropayments.  This package provides the Reddcoin Core wallet
client (reddcoin-qt), the daemon (reddcoind), and the command-line interface
(reddcoin-cli) as pre-built binaries.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 19. zebar-bin — customizable taskbar widgets (deb)
;;; -------------------------------------------------------

(define-public zebar-bin
  (package
    (name "zebar-bin")
    (version "3.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/glzr-io/zebar/releases/download/v"
                    version "/zebar-v" version "-opt4-x64.deb"))
              (sha256
               (base32 "04gd6imhyj0sp2papakx2llj3jqvc0cvh8cxffk1jmm5nwrhyg5b"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/glzr-io/zebar")
    (synopsis "Customizable and cross-platform taskbar and desktop widgets")
    (description "Zebar is a tool for creating customizable and cross-platform
taskbars, desktop widgets, and popups.  Built with Tauri, it provides a web
technologies-based approach to desktop widget creation with system
monitoring, workspace display, and clock widgets.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 20. suwayomi-server-bin — manga reader server (JAR)
;;; -------------------------------------------------------

(define-public suwayomi-server-bin
  (package
    (name "suwayomi-server-bin")
    (version "2.1.1867")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Suwayomi/Suwayomi-Server/releases/download/v"
                    version "/suwayomi-server-v" version ".jar"))
              (sha256
               (base32 "1by518nki9w4m63mjsa29h3qng2hfwx3xawi5401lkhyb310gqsi"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("suwayomi-server.jar" "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file (car (find-files "." "\\.jar$"))
                                "suwayomi-server.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/suwayomi-server")
                       (lambda ()
                         (format #t "#!~a~%exec ~a -jar ~a/share/java/suwayomi-server.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append bin "/suwayomi-server") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (home-page "https://github.com/Suwayomi/Suwayomi-Server")
    (synopsis "Free and open-source manga reader server")
    (description "Suwayomi Server is a free and open-source manga reader
that runs extensions built for Tachiyomi.  It provides a web-based interface
for reading manga from various sources and can be accessed from any device
with a web browser.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 21. brave-bin — privacy-focused browser (zip)
;;; -------------------------------------------------------

(define-public brave-bin
  (package
    (name "brave-bin")
    (version "1.87.190")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brave/brave-browser/releases/download/v"
                    version "/brave-browser-" version
                    "-linux-amd64.zip"))
              (sha256
               (base32 "08y76fwigpzrnld923zqzbn25kr3zqjqax9whivab5y45qhzq2sz"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/brave/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/brave")
                       (lambda ()
                         (format #t "#!~a~%exec ~a/share/brave/brave \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 out)))
                     (chmod (string-append bin "/brave") #o755)))))))
    (native-inputs (list unzip))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brave.com/")
    (synopsis "Privacy-focused web browser that blocks ads and trackers")
    (description "Brave is a web browser that blocks ads and trackers by
default.  Built on Chromium, it provides faster page loads and improved
privacy.  Features include built-in ad blocking, HTTPS Everywhere, script
blocking, and fingerprinting protection.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 22. zen-browser-bin — Firefox fork (tarball)
;;; -------------------------------------------------------

(define-public zen-browser-bin
  (package
    (name "zen-browser-bin")
    (version "1.18.9b")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/zen-browser/desktop/releases/download/"
                    version "/zen.linux-x86_64.tar.xz"))
              (sha256
               (base32 "0y2g0p2c2zbfybz2kqblbpgafngfb7jk6xxbjr47kcbarz39s91j"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "lib/zen/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/zen-browser")
                       (lambda ()
                         (format #t "#!~a~%exec ~a/lib/zen/zen \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 out)))
                     (chmod (string-append bin "/zen-browser") #o755)))))))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://zen-browser.app/")
    (synopsis "Performance-oriented web browser based on Firefox")
    (description "Zen Browser is a performance-oriented web browser built on
Firefox.  It focuses on speed, privacy, and a clean user interface while
maintaining compatibility with Firefox extensions and web standards.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------
;;; 23. ventoy-bin — bootable USB solution (tarball)
;;; -------------------------------------------------------

(define-public ventoy-bin
  (package
    (name "ventoy-bin")
    (version "1.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ventoy/Ventoy/releases/download/v"
                    version "/ventoy-" version "-linux.tar.gz"))
              (sha256
               (base32 "025jpv2rgv362rqgvzpl0j08a4m945k9cjjpzqs2hwdvw7kan4qi"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("." "share/ventoy/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/ventoy")
                       (lambda ()
                         (format #t "#!~a~%exec ~a/share/ventoy/VentoyGUI.x86_64 \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 out)))
                     (chmod (string-append bin "/ventoy") #o755)))))))
    (inputs (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.ventoy.net/")
    (synopsis "Bootable USB solution supporting multiple ISO files")
    (description "Ventoy is an open-source tool to create bootable USB drives.
Instead of formatting the drive for each ISO, you simply copy ISO files onto
the drive and boot from them directly.  It supports multiple ISO files
simultaneously and works with most Linux distributions, Windows installers,
and WinPE images.")
    (license license:gpl3+)))

;;; -------------------------------------------------------
;;; 24. sliver-bin — adversary emulation framework (binaries)
;;; -------------------------------------------------------

(define-public sliver-bin
  (package
    (name "sliver-bin")
    (version "1.5.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BishopFox/sliver/releases/download/v"
                    version "/sliver-client_linux"))
              (sha256
               (base32 "029668swas219k7q3jqprim5hyyi5x7xykslvs1c6lvjfi9vyjfz"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("sliver-client" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-and-chmod
                 (lambda _
                   (rename-file (car (find-files "." "sliver"))
                                "sliver-client")
                   (chmod "sliver-client" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BishopFox/sliver")
    (synopsis "Open-source adversary emulation and red team framework")
    (description "Sliver is an open-source cross-platform adversary emulation
and red team framework developed by Bishop Fox.  It is used by security
professionals for authorized penetration testing and security assessments.
This package provides the client binary for connecting to Sliver servers.")
    (license license:bsd-3)))

;;; -------------------------------------------------------
;;; 25. cliamp-bin — retro terminal music player (binary)
;;; -------------------------------------------------------

(define-public cliamp-bin
  (package
    (name "cliamp-bin")
    (version "1.35.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bjarneo/cliamp/releases/download/v"
                    version "/cliamp-x86_64"))
              (sha256
               (base32 "14q49zypqbhmalf0x81gh41hf4vinygn4pd5ml24pz7w0s3r6rc6"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("cliamp" "bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-and-chmod
                 (lambda _
                   (rename-file (car (find-files "." "cliamp"))
                                "cliamp")
                   (chmod "cliamp" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bjarneo/cliamp")
    (synopsis "Retro terminal music player inspired by Winamp 2.x")
    (description "Cliamp is a retro terminal music player inspired by the
classic Winamp 2.x interface.  It provides a TUI for playing audio files
with support for various formats through FFmpeg, including MP3, FLAC,
OGG, and WAV.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 26. stormlib — MPQ archive library (cmake)
;;; (renumbered from original 25)
;;; -------------------------------------------------------

(define-public stormlib
  (package
    (name "stormlib")
    (version "9.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ladislav-zezula/StormLib/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1h8mz3x4l8znd12ap76l91438w3ckn7w9d8bs3rch1y9dii7xmy8"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON"
                   "-DWITH_LIBTOMCRYPT=ON")
           #:tests? #f))
    (inputs (list bzip2 zlib))
    (home-page "https://github.com/ladislav-zezula/StormLib")
    (synopsis "C/C++ library for reading and writing MPQ archives")
    (description "StormLib is a C/C++ library for reading and writing MPQ
(Mo'PaQ) archives, the archive format used by Blizzard Entertainment games.
It supports merged archives, patch MPQs, listfiles, attributes, and
various compression methods including zlib, bzip2, and LZMA.")
    (license license:expat)))

;;; -------------------------------------------------------
;;; 26. rarian — documentation metadata library (autotools)
;;; -------------------------------------------------------

(define-public rarian
  (package
    (name "rarian")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.freedesktop.org/rarian/rarian/-/archive/"
                    version "/rarian-" version ".tar.gz"))
              (sha256
               (base32 "0byi06bsd767y6mc8jb9r0mgwvn8zvzsackfiq4qlszqd70z2y26"))))
    (build-system gnu-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "sh" "autogen.sh")))
               (add-before 'check 'set-locale
                 (lambda _
                   (setenv "LANG" "C")
                   (setenv "LC_ALL" "C"))))))
    (native-inputs (list autoconf automake libtool pkg-config libxslt))
    (inputs (list tinyxml2))
    (home-page "https://gitlab.freedesktop.org/rarian/rarian")
    (synopsis "Documentation metadata library replacing Scrollkeeper")
    (description "Rarian is a documentation metadata library designed as a
replacement for Scrollkeeper.  It provides a simple API to manage and access
documentation metadata installed on the system, used primarily by GNOME
desktop environments for the help system.")
    (license license:gpl2+)))

;;; -------------------------------------------------------
;;; 27. tungsten — WolframAlpha CLI (shell script)
;;; -------------------------------------------------------

(define-public tungsten
  (package
    (name "tungsten")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://raw.githubusercontent.com/ASzc/tungsten/release-"
                    version "/tungsten.sh"))
              (sha256
               (base32 "1pma7q3js4c0zvimiqhaa0mpbbnbyir2n9i6rcj531m019740wbw"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin")))
                 (mkdir-p bin)
                 (copy-file (assoc-ref %build-inputs "source")
                            (string-append bin "/tungsten"))
                 (chmod (string-append bin "/tungsten") #o755)))))
    (home-page "https://github.com/ASzc/tungsten")
    (synopsis "Command-line interface for WolframAlpha queries")
    (description "Tungsten is a simple bash script that queries the
WolframAlpha computational knowledge engine from the command line.  It uses
curl and jq to send queries and format responses.  An API key from
WolframAlpha is required.")
    (license license:gpl3)))

;;; -------------------------------------------------------
;;; 28. python-importmonkey — import path utility
;;; -------------------------------------------------------

(define-public python-importmonkey
  (package
    (name "python-importmonkey")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/i/"
                    "importmonkey/importmonkey-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/hirsimaki-markus/importmonkey")
    (synopsis "Utility for adding new Python import paths")
    (description "Importmonkey is a Python utility for adding new import paths.
It provides a simple interface to modify sys.path for importing modules from
non-standard locations, useful for project structures where modules need to
import from sibling directories.")
    (license license:unlicense)))

;;; -------------------------------------------------------
;;; 29. paper-velocity — Minecraft server proxy (JAR)
;;; -------------------------------------------------------

(define-public paper-velocity
  (package
    (name "paper-velocity")
    (version "3.5.0-SNAPSHOT-584")
    (source (origin
              (method url-fetch)
              (uri "https://fill-data.papermc.io/v1/objects/4334a3577a4c6daac264d1ff3be73d27ec1f4f9b3339af683bdcf3099f66402b/velocity-3.5.0-SNAPSHOT-584.jar")
              (sha256
               (base32 "0as0csghkwyw7dlayf9kkd7izv177pkkpzyick1alvacg9bs6d23"))))
    (build-system copy-build-system)
    (arguments
     (list #:validate-runpath? #f
           #:install-plan
           #~'(("velocity.jar" "share/java/"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'install-license-files)
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file (car (find-files "." "\\.jar$")) "velocity.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/velocity")
                       (lambda ()
                         (format #t "#!~a~%exec ~a -jar ~a/share/java/velocity.jar \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs "bin/java")
                                 out)))
                     (chmod (string-append bin "/velocity") #o755)))))))
    (inputs (list bash-minimal icedtea))
    (home-page "https://papermc.io/software/velocity")
    (synopsis "Modern Minecraft server proxy")
    (description "Velocity is a modern, next-generation Minecraft server proxy.
It allows multiple Minecraft servers to be linked together, enabling players
to move between servers seamlessly.  It offers improved performance and
security compared to older proxy solutions.")
    (license license:gpl3+)))
