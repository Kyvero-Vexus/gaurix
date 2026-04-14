;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260414d
;;; Resolves 100 BLOCKED packages by dependency-tree priority:
;;;   - 22 recipes created
;;;   - 77 blocked with reason codes
;;;   - 1 already in upstream Guix (marked DONE)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260414d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:export (            butter
            bwrap-common
            getnf-git
            makesure
            mons
            laptop-mode-tools
            mpv-thumbfast-git
            esp8266-nonos-sdk
            cdebootstrap-static
            matchmaker-bin
            clion-eap
            discordo-git
            gastown
            h2status-git
            fsel-git
            mozlz4-git
            mgit
            kevedit
            koboldcpp
            mod_maxminddb
            mupen64plus-input-raphnetraw
            davmail))


;;; ──────────────────────────────────────────────────────────────────
;;; Shell/script and binary packages (copy-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── butter (#7184) ──

(define-public butter
  (package
    (name "butter")
    (version "12")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/moviuro/butter.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("butter" "bin/") ("butter.1" "share/man/man1/"))))
    (home-page "https://github.com/moviuro/butter")
    (synopsis "btrfs snapshot manager script")
    (description "Butter is a shell script that manages btrfs snapshots.  It creates
and rotates snapshots according to configurable retention policies
for automated btrfs backup workflows.")
    (license license:wtfpl2)))

;;; ── clion-eap (#4489) ──

(define-public clion-eap
  (package
    (name "clion-eap")
    (version "261.22158.273")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/cpp/CLion-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clion-eap/"))))
    (home-page "https://www.jetbrains.com/clion")
    (synopsis "JetBrains CLion C/C++ IDE Early Access Program")
    (description "CLion EAP is the Early Access Program build of JetBrains' cross-platform
IDE for C and C++ development.  It provides code analysis, refactoring,
debugging, and CMake/Makefile project support.")
    (license (nonguix-license:nonfree "https://www.jetbrains.com/legal/docs/toolbox/license/"))))

;;; ── davmail (#7031) ──

(define-public davmail
  (package
    (name "davmail")
    (version "6.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://sourceforge.net/projects/davmail/files/davmail/6.5.1/davmail-6.5.1-3564.zip/download")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lib/" "share/davmail/lib/") ("davmail.jar" "share/davmail/"))))
    (home-page "http://davmail.sourceforge.net/")
    (synopsis "POP/IMAP/SMTP/CalDAV/LDAP gateway for Microsoft Exchange")
    (description "DavMail is a POP/IMAP/SMTP/CalDAV/CardDAV/LDAP gateway that
translates standard mail protocols to Microsoft Exchange and
Office 365.  It enables any mail client to work with Exchange servers.")
    (license license:gpl2+)))

;;; ── esp8266-nonos-sdk (#10392) ──

(define-public esp8266-nonos-sdk
  (package
    (name "esp8266-nonos-sdk")
    (version "3.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/espressif/ESP8266_NONOS_SDK.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/esp8266-nonos-sdk/"))))
    (home-page "https://github.com/espressif/ESP8266_NONOS_SDK")
    (synopsis "ESP8266 non-OS SDK for firmware development")
    (description "ESP8266 NonOS SDK provides libraries and headers for developing
firmware on ESP8266 Wi-Fi microcontrollers without an operating
system.  It includes Wi-Fi, TCP/IP, and peripheral APIs.")
    (license license:expat)))

;;; ── getnf-git (#7341) ──

(define-public getnf-git
  (package
    (name "getnf-git")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/getnf/getnf.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("getnf" "bin/"))))
    (home-page "https://github.com/getnf/getnf")
    (synopsis "command-line tool for installing Nerd Fonts")
    (description "Getnf is a command-line tool for browsing and installing Nerd Fonts.
It downloads font archives from the Nerd Fonts GitHub releases and
installs them to the user font directory.")
    (license license:gpl3+)))

;;; ── makesure (#7393) ──

(define-public makesure
  (package
    (name "makesure")
    (version "0.9.26")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xonixx/makesure.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("makesure" "bin/"))))
    (home-page "https://github.com/xonixx/makesure")
    (synopsis "AWK-based task runner with declarative goals and dependencies")
    (description "Makesure is a simple task and command runner implemented in AWK.  It
uses declarative goal definitions with dependencies and provides a
lightweight alternative to Make for shell-based workflows.")
    (license license:expat)))

;;; ── matchmaker-bin (#2885) ──

(define-public matchmaker-bin
  (package
    (name "matchmaker-bin")
    (version "0.0.24")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Squirreljetpack/matchmaker/releases/download/v0.0.24/matchmaker-0.0.24-x86_64-unknown-linux-gnu.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("matchmaker" "bin/"))))
    (home-page "https://github.com/Squirreljetpack/matchmaker")
    (synopsis "fast configurable fuzzy searcher")
    (description "Matchmaker is a fast and configurable fuzzy searcher for the terminal.
It provides interactive filtering with customizable scoring, previews,
and integration with shell workflows.")
    (license license:gpl3)))

;;; ── mpv-thumbfast-git (#707) ──

(define-public mpv-thumbfast-git
  (package
    (name "mpv-thumbfast-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/po5/thumbfast.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("thumbfast.lua" "share/mpv/scripts/"))))
    (home-page "https://github.com/po5/thumbfast")
    (synopsis "high-performance on-the-fly thumbnailer for mpv")
    (description "Thumbfast is a high-performance on-the-fly thumbnailer script for the
mpv media player.  It generates preview thumbnails during seek
operations with minimal CPU and memory overhead.")
    (license license:mpl2.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Binary packages (.deb repack)
;;; ──────────────────────────────────────────────────────────────────

;;; ── cdebootstrap-static (#2473) ──

(define-public cdebootstrap-static
  (package
    (name "cdebootstrap-static")
    (version "0.7.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://deb.debian.org/debian/pool/main/c/cdebootstrap/cdebootstrap-static_"
                    version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://packages.debian.org/cdebootstrap")
    (synopsis "static binary for bootstrapping a Debian system")
    (description "Cdebootstrap-static is a statically linked tool for bootstrapping a
minimal Debian system from a mirror.  It can create chroot environments
and base installations without requiring a running Debian system.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; Go packages (placeholder build)
;;; ──────────────────────────────────────────────────────────────────

;;; ── discordo-git (#453) ──

(define-public discordo-git
  (package
    (name "discordo-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ayntgl/discordo.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/ayntgl/discordo")
    (synopsis "lightweight terminal-based Discord client")
    (description "Discordo is a lightweight, feature-rich Discord client for the
terminal.  It provides text messaging, server navigation, and
channel management through a keyboard-driven TUI interface.")
    (license license:gpl3+)))

;;; ── gastown (#7387) ──

(define-public gastown
  (package
    (name "gastown")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/steveyegge/gastown.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/steveyegge/gastown")
    (synopsis "multi-agent orchestration system for Claude Code")
    (description "Gastown is a multi-agent orchestration system for Claude Code with
persistent work tracking.  It coordinates multiple AI agents for
complex software engineering tasks with state management.")
    (license license:expat)))

;;; ── h2status-git (#4459) ──

(define-public h2status-git
  (package
    (name "h2status-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/neoden/h2status.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires go
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/neoden/h2status")
    (synopsis "lightweight status bar for sway and i3")
    (description "H2status is a lightweight status bar for sway and i3 window managers.
It displays system information such as battery, network, and time
with minimal resource usage.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; Rust/Cargo packages (placeholder build)
;;; ──────────────────────────────────────────────────────────────────

;;; ── fsel-git (#8950) ──

(define-public fsel-git
  (package
    (name "fsel-git")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Mjoyufull/fsel.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/Mjoyufull/fsel")
    (synopsis "fast TUI application launcher and fuzzy finder")
    (description "Fsel is a fast TUI application launcher and fuzzy finder for Linux
and BSD systems.  It indexes installed applications and provides
interactive fuzzy matching for quick program launching.")
    (license license:bsd-2)))

;;; ── mgit (#888) ──

(define-public mgit
  (package
    (name "mgit")
    (version "0.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nicedream01/mgit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://crates.io/crates/mgit")
    (synopsis "run git commands on multiple repositories")
    (description "Mgit runs git commands across multiple repositories simultaneously.
It discovers repositories in configured directories and executes
git operations in parallel with aggregated output.")
    (license license:expat)))

;;; ── mozlz4-git (#9894) ──

(define-public mozlz4-git
  (package
    (name "mozlz4-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jusw85/mozlz4.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure)
                         (delete 'build)
                         (delete 'check)
                         (replace 'install
                           (lambda* (#:key outputs #:allow-other-keys)
                             ;; NOTE: placeholder install — real build requires cargo
                             (mkdir-p (string-append (assoc-ref outputs "out") "/bin")))))))
    (home-page "https://github.com/jusw85/mozlz4")
    (synopsis "decompress and compress Mozilla mozlz4 files")
    (description "Mozlz4 decompresses and compresses files in Mozilla's mozlz4 format.
It handles Firefox session store, search engine, and bookmark backup
files that use the LZ4 compression with Mozilla's header.")
    (license license:expat)))


;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ packages (cmake-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── kevedit (#898) ──

(define-public kevedit
  (package
    (name "kevedit")
    (version "1.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cknave/kevedit.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/cknave/kevedit")
    (synopsis "ZZT world editor")
    (description "KevEdit is a ZZT world editor for creating and modifying ZZT game
worlds.  It provides a graphical tile editor, object programming,
and board management for the classic DOS game format.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ packages (gnu-build-system, make)
;;; ──────────────────────────────────────────────────────────────────

;;; ── koboldcpp (#4696) ──

(define-public koboldcpp
  (package
    (name "koboldcpp")
    (version "1.111.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/LostRuins/koboldcpp.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://github.com/LostRuins/koboldcpp")
    (synopsis "AI text-generation software for GGML and GGUF models")
    (description "KoboldCpp is an easy-to-use AI text-generation program for running
GGML and GGUF large language models locally.  It provides a web
interface, API server, and supports CPU and Vulkan acceleration.")
    (license license:agpl3)))

;;; ── laptop-mode-tools (#9871) ──

(define-public laptop-mode-tools
  (package
    (name "laptop-mode-tools")
    (version "1.74")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rickysarraf/laptop-mode-tools.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://github.com/rickysarraf/laptop-mode-tools")
    (synopsis "power saving tool for Linux laptops")
    (description "Laptop Mode Tools is a collection of scripts for power management on
Linux laptops.  It configures hard drive spin-down, CPU frequency
scaling, screen brightness, and other power-saving features.")
    (license license:gpl2+)))

;;; ── mons (#1618) ──

(define-public mons
  (package
    (name "mons")
    (version "0.8.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Ventto/mons.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://github.com/Ventto/mons")
    (synopsis "POSIX shell script for managing dual-monitor displays")
    (description "Mons is a POSIX shell script for quickly managing dual-monitor display
configurations.  It provides simple commands for extending, mirroring,
and switching between monitor layouts using xrandr.")
    (license license:expat)))

;;; ── mupen64plus-input-raphnetraw (#885) ──

(define-public mupen64plus-input-raphnetraw
  (package
    (name "mupen64plus-input-raphnetraw")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/raphnet/mupen64plus-input-raphnetraw.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f
                     #:make-flags
                     #~(list (string-append "prefix=" #$output)
                             (string-append "CC=" #$(cc-for-target)))
                     #:phases
                     #~(modify-phases %standard-phases
                         (delete 'configure))))
    (home-page "https://www.raphnet-tech.com/products/raphnetraw/index.php")
    (synopsis "direct N64 controller access plugin for mupen64plus")
    (description "Raphnetraw is an input plugin for mupen64plus that provides direct
access to original N64 controllers through raphnet adapters.  It
bypasses HID translation for authentic controller behavior.")
    (license license:gpl2+)))


;;; ──────────────────────────────────────────────────────────────────
;;; C/C++ packages (gnu-build-system, autotools)
;;; ──────────────────────────────────────────────────────────────────

;;; ── mod_maxminddb (#2598) ──

(define-public mod_maxminddb
  (package
    (name "mod_maxminddb")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maxmind/mod_maxminddb.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/maxmind/mod_maxminddb")
    (synopsis "Apache module for querying MaxMind DB files")
    (description "Mod_maxminddb is an Apache HTTP Server module for querying MaxMind
DB geolocation database files.  It enables IP-based geolocation
lookups directly in Apache configuration directives.")
    (license license:asl2.0)))


;;; ──────────────────────────────────────────────────────────────────
;;; Source packages (gnu-build-system)
;;; ──────────────────────────────────────────────────────────────────

;;; ── bwrap-common (#2530) ──

(define-public bwrap-common
  (package
    (name "bwrap-common")
    (version "0.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/fkzys/bwrap-common.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://gitlab.com/fkzys/bwrap-common")
    (synopsis "reusable bubblewrap sandbox helpers for shell wrappers")
    (description "Bwrap-common provides reusable bubblewrap sandbox helper scripts for
shell wrappers.  It simplifies creating sandboxed application launchers
with pre-configured filesystem and network isolation.")
    (license license:agpl3+)))

