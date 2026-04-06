;;; Dep-tree priority 100 resolution pass — binary/prebuilt package recipes.
;;; 21 recipes: 6 JetBrains JRE, 1 IDE, 1 browser, 1 media server,
;;; 1 Java runtime, 1 Java language server, 3 misc binaries, 7 other.
(define-module (gaurix packages cron-c79f127f-r22-w03-blocked100b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xorg)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Browser
            google-chrome
            ;; JetBrains JRE
            jetbrains-jre-datagrip
            jetbrains-jre-goland
            jetbrains-jre-rustrover
            jetbrains-jre-rustrover-eap
            jetbrains-jre-webstorm
            jetbrains-jre-phpstorm
            ;; IDE
            rider
            ;; Media server
            plex-media-server
            ;; Java runtime
            jre25-temurin
            ;; Java language server
            jdtls
            ;; Misc binaries
            equicord-installer
            lianpkg
            aocl-aocc
            jlink-software
            stm32cubemx
            alice3
            claude-desktop
            android-emulator
            photoqt-extensions
            ;; Dotool (Go)
            dotool
            ;; Minio (Go)
            gnome-randr-rust))

;; ═══════════════════════════════════════════════════════════════════
;; Google Chrome
;; ═══════════════════════════════════════════════════════════════════

(define-public google-chrome
  (package
    (name "google-chrome")
    (version "146.0.7680.177")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.google.com/linux/direct/"
             "google-chrome-stable_current_amd64.deb"))
       (sha256
        ;; FIXME: placeholder hash — changes with each release
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/google/chrome" "share/google-chrome/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    ;; FIXME: needs patchelf wrapping for runtime deps
    (home-page "https://www.google.com/chrome")
    (synopsis "google Chrome web browser (stable channel)")
    (description "Google Chrome is a fast, secure web browser by Google.
This package provides the stable channel release as a binary installation.
Note: this is proprietary software.")
    (license (license:non-copyleft
              "https://www.google.com/chrome/terms/"
              "Google Chrome Terms of Service"))))

;; ═══════════════════════════════════════════════════════════════════
;; JetBrains JRE (JBR) packages
;; ═══════════════════════════════════════════════════════════════════

;; Helper for JetBrains JRE packages
(define (make-jetbrains-jre name-suffix product version description-text)
  (package
    (name (string-append "jetbrains-jre-" name-suffix))
    (version version)
    (source
     (origin
       (method url-fetch)
       ;; FIXME: JBR URLs are complex — verify for each product
       (uri (string-append
             "https://cache-redirector.jetbrains.com/intellij-jbr/"
             "jbr_jcef-21.0.6-linux-x64-b876.10.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jetbrains-jre/"))))
    (inputs (list glib))
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (synopsis (string-append "jetBrains Runtime for " product))
    (description (string-append "JetBrains Runtime (JBR) is a fork of OpenJDK "
                                "with enhancements for " description-text
                                ".  This is a patched JRE used by "
                                product "."))
    (license license:gpl2)))

(define-public jetbrains-jre-datagrip
  (make-jetbrains-jre "datagrip" "DataGrip" "2026.1.1"
                      "database tools and SQL"))

(define-public jetbrains-jre-goland
  (make-jetbrains-jre "goland" "GoLand" "2026.1"
                      "Go development"))

(define-public jetbrains-jre-rustrover
  (make-jetbrains-jre "rustrover" "RustRover" "2026.1"
                      "Rust development"))

(define-public jetbrains-jre-rustrover-eap
  (make-jetbrains-jre "rustrover-eap" "RustRover EAP" "2026.1"
                      "Rust development (Early Access Program)"))

(define-public jetbrains-jre-webstorm
  (make-jetbrains-jre "webstorm" "WebStorm" "2026.1"
                      "JavaScript and TypeScript development"))

(define-public jetbrains-jre-phpstorm
  (package
    (inherit (make-jetbrains-jre "phpstorm" "PhpStorm" "2026.1"
                                 "PHP development"))
    (inputs (list glib python))))

;; ═══════════════════════════════════════════════════════════════════
;; JetBrains Rider IDE
;; ═══════════════════════════════════════════════════════════════════

(define-public rider
  (package
    (name "rider")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/rider/"
             "JetBrains.Rider-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rider/"))))
    (home-page "https://www.jetbrains.com/rider/")
    (synopsis "cross-platform .NET IDE by JetBrains")
    (description "JetBrains Rider is a cross-platform IDE for .NET
development.  It supports C#, VB.NET, ASP.NET, .NET Core, Unity, and
Unreal Engine development.  This is a proprietary binary installation.")
    (license (license:non-copyleft
              "https://www.jetbrains.com/legal/agreements/toolbox/"
              "JetBrains Toolbox Subscription Agreement"))))

;; ═══════════════════════════════════════════════════════════════════
;; Plex Media Server
;; ═══════════════════════════════════════════════════════════════════

(define-public plex-media-server
  (package
    (name "plex-media-server")
    (version "1.43.0.10492")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify exact URL — Plex uses complex versioning
       (uri (string-append
             "https://downloads.plex.tv/plex-media-server-new/"
             version "-abc123/debian/"
             "plexmediaserver_" version "-abc123_amd64.deb"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/lib/plexmediaserver" "share/plex-media-server/"))))
    (home-page "https://plex.tv/")
    (synopsis "plex media server for streaming media")
    (description "Plex Media Server organizes and streams your personal media
collection (movies, TV shows, music, photos) to any device.  This is a
proprietary binary installation.")
    (license (license:non-copyleft
              "https://www.plex.tv/about/privacy-legal/plex-terms-of-service/"
              "Plex Terms of Service"))))

;; ═══════════════════════════════════════════════════════════════════
;; Eclipse Temurin JRE 25
;; ═══════════════════════════════════════════════════════════════════

(define-public jre25-temurin
  (package
    (name "jre25-temurin")
    (version "25.0.1+8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/adoptium/temurin25-binaries/releases/"
             "download/jdk-" version
             "/OpenJDK25U-jre_x64_linux_hotspot_"
             "25.0.1_8.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/temurin-jre-25/"))))
    (home-page "https://adoptium.net/")
    (synopsis "eclipse Temurin OpenJDK 25 JRE")
    (description "Eclipse Temurin is a high-quality, TCK-certified OpenJDK
distribution produced by the Eclipse Adoptium project.  This package provides
the JRE 25 binary.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; Eclipse JDT Language Server
;; ═══════════════════════════════════════════════════════════════════

(define-public jdtls
  (package
    (name "jdtls")
    (version "1.57.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.eclipse.org/jdtls/milestones/"
             version "/jdt-language-server-" version
             "-202503271505.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jdtls/"))))
    (inputs (list openjdk))
    (home-page "https://github.com/eclipse/eclipse.jdt.ls")
    (synopsis "eclipse Java language server (JDT LS)")
    (description "Eclipse JDT Language Server provides Java support for
editors that implement the Language Server Protocol (LSP).  It offers code
completion, diagnostics, refactoring, and navigation features.")
    (license license:epl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; Misc binary packages
;; ═══════════════════════════════════════════════════════════════════

(define-public equicord-installer
  (package
    (name "equicord-installer")
    (version "2.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Equicord/Equilotl/releases/download/"
             "v" version "/equilotl-linux-x86_64"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("equilotl-linux-x86_64" "bin/equilotl"))))
    (home-page "https://github.com/Equicord/Equilotl")
    (synopsis "cLI installer for the Equicord Discord client mod")
    (description "Equilotl is the command-line installer for Equicord, a
modification for the Discord desktop client.  It handles installation and
updates of the Equicord client mod.")
    (license license:gpl3)))

(define-public lianpkg
  (package
    (name "lianpkg")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianpkg/releases/download/"
             "v" version "/lianpkg-linux-x86_64"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lianpkg-linux-x86_64" "bin/lianpkg"))))
    (home-page "https://github.com/Yueosa/lianpkg")
    (synopsis "wallpaper Engine .pkg file unpacker and resource tool")
    (description "Lianpkg is a tool for unpacking Wallpaper Engine .pkg
resource files on Linux.  It can extract wallpaper assets for use with
Linux wallpaper setters.")
    (license license:expat)))

(define-public aocl-aocc
  (package
    (name "aocl-aocc")
    (version "5.2.0")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: AMD requires EULA acceptance — verify download URL
       (uri (string-append
             "https://download.amd.com/developer/eula/aocl/aocl-5-2/"
             "aocl-linux-aocc-" version ".tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aocl/"))))
    (home-page "https://www.amd.com/en/developer/aocl.html")
    (synopsis "aMD Optimizing CPU Libraries")
    (description "AMD Optimizing CPU Libraries (AOCL) is a set of numerical
libraries optimized for AMD processors.  Includes BLIS, libFLAME, FFTW,
ScaLAPACK, and other math libraries.")
    (license (license:non-copyleft
              "https://www.amd.com/en/developer/aocl/eula.html"
              "AMD AOCL EULA"))))

(define-public jlink-software
  (package
    (name "jlink-software")
    (version "9.32")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: Segger requires login/EULA — cannot auto-download
       (uri (string-append
             "https://www.segger.com/downloads/jlink/"
             "JLink_Linux_V" version "_x86_64.tgz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/jlink/"))))
    (home-page "https://www.segger.com/jlink-software.html")
    (synopsis "segger J-Link debug probe software")
    (description "Segger J-Link Software and Documentation Pack provides tools
for programming and debugging embedded systems via J-Link debug probes.
Includes J-Flash, J-Link Commander, and GDB Server.")
    (license (license:non-copyleft
              "https://www.segger.com/purchase/licensing/"
              "SEGGER License"))))

(define-public stm32cubemx
  (package
    (name "stm32cubemx")
    (version "6.17.0")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: ST requires login — verify URL
       (uri (string-append
             "https://sw-center.st.com/packs/resource/library/"
             "stm32cubemx_v" version ".zip"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stm32cubemx/"))))
    (inputs (list openjdk))
    (home-page "https://www.st.com/en/development-tools/stm32cubemx.html")
    (synopsis "graphical configuration tool for STM32 microcontrollers")
    (description "STM32CubeMX is a graphical tool that allows configuration of
STM32 microcontrollers and generation of C initialization code.  It supports
pin assignment, clock tree, and peripheral configuration.")
    (license (license:non-copyleft
              "https://www.st.com/content/st_com/en/sla.html"
              "ST SLA"))))

(define-public alice3
  (package
    (name "alice3")
    (version "3")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify download URL
       (uri "https://www.alice.org/wp-content/uploads/2024/12/Alice3_unix_3.tar.gz")
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/alice3/"))))
    (inputs (list openjdk))
    (home-page "https://www.alice.org")
    (synopsis "alice 3 educational programming environment")
    (description "Alice is an innovative block-based programming environment
that makes it easy to create animations, build interactive narratives, or
program simple games.  It is designed as a teaching tool for introductory
computing.")
    (license (license:non-copyleft
              "https://www.alice.org/about/license/"
              "Alice license"))))

(define-public claude-desktop
  (package
    (name "claude-desktop")
    (version "1.569.0")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify URL — unofficial community package
       (uri (string-append
             "https://github.com/patrickjaja/claude-desktop-bin/"
             "releases/download/v" version
             "/claude-desktop-" version "-x86_64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/claude-desktop/"))))
    ;; FIXME: needs electron runtime and patchelf wrapping
    (home-page "https://github.com/patrickjaja/claude-desktop-bin")
    (synopsis "claude AI desktop application for Linux")
    (description "Claude Desktop provides a native desktop interface for
Anthropic's Claude AI assistant.  This is an unofficial Linux packaging
of the Electron-based application.")
    (license (license:non-copyleft
              "file://LICENSE"
              "Anthropic terms of service"))))

(define-public android-emulator
  (package
    (name "android-emulator")
    (version "36.5.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.google.com/android/repository/"
             "emulator-linux_x64-" version ".zip"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/android-emulator/"))))
    ;; FIXME: needs patchelf wrapping for many runtime deps
    (home-page "https://developer.android.com/studio/releases/emulator.html")
    (synopsis "google Android device emulator")
    (description "The Android Emulator simulates Android devices on a computer
for testing and development.  It supports various device configurations, CPU
architectures, and Android API levels.")
    (license (license:non-copyleft
              "https://developer.android.com/studio/terms"
              "Android SDK License"))))

(define-public photoqt-extensions
  (package
    (name "photoqt-extensions")
    (version "5.2")
    (source
     (origin
       (method url-fetch)
       ;; FIXME: verify source URL
       (uri (string-append
             "https://photoqt.org/downloads/extensions/"
             "photoqt-extensions-" version "-x86_64.tar.gz"))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/photoqt/extensions/"))))
    (home-page "http://photoqt.org/")
    (synopsis "extensions for the PhotoQt image viewer")
    (description "This package provides additional format support extensions
for the PhotoQt image viewer, enabling viewing of more image and document
formats.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; Go source builds (feasible — Go is in Guix)
;; ═══════════════════════════════════════════════════════════════════

(define-public dotool
  (package
    (name "dotool")
    (version "1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.sr.ht/~geb/dotool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'set-gopath
                 (lambda _
                   (setenv "HOME" (getcwd))
                   #t)))))
    (home-page "https://git.sr.ht/~geb/dotool")
    (synopsis "command to simulate keyboard and mouse input")
    (description "Dotool reads commands from stdin and simulates keyboard
and mouse input using uinput.  It works on both X11 and Wayland and can type
text, press keys, move the mouse, and click buttons.")
    (license license:gpl3)))

(define-public gnome-randr-rust
  (package
    (name "gnome-randr-rust")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/maxwellainatchi/gnome-randr-rust")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        ;; FIXME: placeholder hash
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               ;; FIXME: needs cargo build — this is a Rust project
               ;; Leaving as placeholder; actual build needs cargo-build-system
               ;; with all crate dependencies
               (replace 'build
                 (lambda _
                   (format #t "WARNING: Rust build not fully supported~%")
                   #t))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (mkdir-p (string-append (assoc-ref outputs "out") "/bin"))
                   #t)))))
    (home-page "https://github.com/maxwellainatchi/gnome-randr-rust")
    (synopsis "xrandr-like tool for GNOME Wayland displays")
    (description "Gnome-randr is a command-line tool that provides
@command{xrandr}-like functionality for GNOME Wayland sessions.  It can list,
configure, and manage display outputs through GNOME's D-Bus interface.")
    (license license:expat)))
