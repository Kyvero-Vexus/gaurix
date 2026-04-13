;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413c
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from TODO queue:
;;;   - 18 recipes created
;;;   - 12 blocked with specific reason codes
;;;
;;; Recipes (18):
;;;   - yt-beats (Python/shell app, GPL-3.0)
;;;   - preset (Rust/Cargo CLI, MIT)
;;;   - x50ng (C/Make HP 50g emulator, GPL-2.0)
;;;   - phoenix-arch (Firefox privacy config data, GPL-3.0)
;;;   - tome4-zomnibus-addon (ToME4 game addon data, custom)
;;;   - pseint-bin (pseudocode IDE binary, GPL-2.0)
;;;   - brother-hl1200 (Brother printer CUPS driver binary, GPL+nonfree)
;;;   - brother-mfc-j1010dw (Brother MFC printer driver binary, nonfree)
;;;   - dev-janitor-bin (workspace cleanup Tauri binary, MIT)
;;;   - hla-bin (High Level Assembly binary, CC-BY-4.0)
;;;   - notify-complete (Rust shell notifier, MIT)
;;;   - awsvpnclient (AWS VPN client binary, nonfree)
;;;   - starcal (Star Calendar Python app binary, GPL-3.0)
;;;   - adom-noteye (ADOM roguelike graphical binary, nonfree)
;;;   - opentaiko-bin (Taiko drum rhythm game .NET binary, MIT)
;;;   - doublecmd-plugin-p7z-usr (Double Commander 7z plugin, GPL-3.0)
;;;   - whisper-cpp-vulkan (Whisper.cpp Vulkan speech recognition, MIT)
;;;   - rbdoom3-bfg (DOOM 3 BFG Edition source port, GPL-3.0)
;;;
;;; Blocked (12):
;;;   - paru-static (ARCH_SPECIFIC — AUR helper, pacman ecosystem, no Guix utility)
;;;   - aurto (ARCH_SPECIFIC — AUR auto-build, depends on pacman/aurutils)
;;;   - linux-xanmod-lts-linux-bin-x64v3 (KERNEL_INCOMPATIBLE — pre-built kernel)
;;;   - linux-xanmod-linux-bin-x64v3 (KERNEL_INCOMPATIBLE — pre-built kernel)
;;;   - linux-xanmod-linux-headers-bin-x64v3 (KERNEL_INCOMPATIBLE — pre-built headers)
;;;   - pamac-all (ARCH_SPECIFIC — Manjaro pkg manager, depends on libpamac-full)
;;;   - lazarus-gtk2 (MISSING_GUIX_DEPS — requires Free Pascal Compiler fpc)
;;;   - ladybird-git (COMPLEX_DEPS — AUR-only: angle, simdutf-git, cpptrace)
;;;   - bilibili (ELECTRON_APP — Electron/nvm/pnpm build chain)
;;;   - lyrionmusicserver (PERL_VERSION_PINNING — Perl 5.40-5.43, vendor build)
;;;   - mozillavpn-git (BUILD_SYSTEM_TOO_COMPLEX — Rust+Go+CMake+Qt6)
;;;   - vrms-arch (ARCH_SPECIFIC — depends on pyalpm, Arch-only)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xml)
  #:export (
            yt-beats
            preset
            x50ng
            phoenix-arch
            tome4-zomnibus-addon
            pseint-bin
            brother-hl1200
            brother-mfc-j1010dw
            dev-janitor-bin
            hla-bin
            notify-complete
            awsvpnclient
            starcal
            adom-noteye
            opentaiko-bin
            doublecmd-plugin-p7z-usr
            whisper-cpp-vulkan
            rbdoom3-bfg
            ))

;;; ── yt-beats ────────────────────────────────────────────────────
;;; Terminal YouTube Music player with TUI interface
;;; AUR: yt-beats  →  Guix: yt-beats
;;; Upstream: https://github.com/krishnakanthb13/yt-beats (Python, GPL-3.0)
;;;
(define-public yt-beats
  (package
    (name "yt-beats")
    (version "0.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/krishnakanthb13/yt-beats"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yt-beats"
                #:exclude ("LICENSE" "README.md" ".gitignore")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/yt-beats")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/yt-beats")
                       (lambda (port)
                         (format port "#!~a~%exec ~a ~a/main.py \"$@\"~%"
                                 (which "bash")
                                 (which "python3")
                                 share)))
                     (chmod (string-append bin "/yt-beats") #o755)))))))
    (inputs (list bash))
    (home-page "https://github.com/krishnakanthb13/yt-beats")
    (synopsis "terminal YouTube Music player with TUI interface")
    (description
     "YT-Beats is a terminal-based YouTube Music player that provides a
text user interface for searching, browsing, and playing music from
YouTube.  It uses yt-dlp for media extraction and mpv for playback,
with a Textual-based TUI for navigation.")
    (license license:gpl3)))

;;; ── preset ──────────────────────────────────────────────────────
;;; CLI tool for saving and running command presets
;;; AUR: preset  →  Guix: preset
;;; Upstream: https://github.com/VG-dev1/preset (Rust, MIT)
;;;
(define-public preset
  (package
    (name "preset")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/VG-dev1/preset/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/VG-dev1/preset")
    (synopsis "CLI tool for saving and running command presets")
    (description
     "Preset is a command-line utility for saving frequently used shell
commands as named presets and running them later.  It simplifies
repetitive workflows by allowing users to define, list, and execute
command presets from the terminal.")
    (license license:expat)))

;;; ── x50ng ───────────────────────────────────────────────────────
;;; HP 50g calculator emulator for Linux
;;; AUR: x50ng  →  Guix: x50ng
;;; Upstream: https://codeberg.org/gwh/x50ng (C, GPL-2.0)
;;;
(define-public x50ng
  (package
    (name "x50ng")
    (version "2.5.9999")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/gwh/x50ng/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output)
                   (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ lua ncurses))
    (home-page "https://codeberg.org/gwh/x50ng")
    (synopsis "HP 50g calculator emulator for Linux")
    (description
     "x50ng is an emulator for the HP 50g graphing calculator on Linux.
It provides a graphical interface using GTK and supports the full HP 50g
ROM functionality, including the RPL programming language, CAS, and
graphing capabilities.  Requires an HP 50g ROM image to operate.")
    (license license:gpl2)))

;;; ── phoenix-arch ────────────────────────────────────────────────
;;; Privacy and security hardened Firefox configuration
;;; AUR: phoenix-arch  →  Guix: phoenix-arch
;;; Upstream: https://phoenix.celenity.dev (data files, GPL-3.0)
;;;
(define-public phoenix-arch
  (package
    (name "phoenix-arch")
    (version "202602231")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/celenityy/Phoenix/-/raw/"
             "441f8cb296a3d8bc959a315e6f89258781de26b6"
             "/archives/phoenix-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/phoenix-arch"))))
    (home-page "https://phoenix.celenity.dev")
    (synopsis "privacy and security hardened Firefox configuration")
    (description
     "Phoenix is a collection of Firefox configuration files that harden
the browser for privacy and security.  It includes @file{user.js}
preferences, policies, autoconfig files, and enterprise policy settings
that disable telemetry, restrict fingerprinting, and enforce secure
defaults while maintaining usability.")
    (license license:gpl3+)))

;;; ── tome4-zomnibus-addon ────────────────────────────────────────
;;; Zomnibus addon pack for Tales of Maj'Eyal
;;; AUR: tome4-zomnibus_addon  →  Guix: tome4-zomnibus-addon
;;; Upstream: https://te4.org/ (game addon data, custom)
;;;
(define-public tome4-zomnibus-addon
  (package
    (name "tome4-zomnibus-addon")
    (version "17.8.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://te4.org/sites/default/files/games-addons/tome-zomnibus_198.teaa")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (basename (assoc-ref %build-inputs "source"))
                         "share/tome4/addons/tome-zomnibus_198.teaa"))))
    (home-page "https://te4.org/games/addons/tome/zomnibus-addon-pack")
    (synopsis "zomnibus addon pack for Tales of Maj'Eyal")
    (description
     "Zomnibus is a free community addon pack for Tales of Maj'Eyal
(ToME4) that adds zombie-themed content including new classes, races,
and gameplay elements.  It requires ToME4 version 1.7.4 or later.")
    (license (license:non-copyleft
              "https://te4.org/games/addons/tome/zomnibus-addon-pack"
              "Custom license; see upstream for terms"))))

;;; ── pseint-bin ──────────────────────────────────────────────────
;;; Pseudocode IDE for learning programming
;;; AUR: pseint-bin  →  Guix: pseint-bin
;;; Upstream: http://pseint.sourceforge.net (binary, GPL-2.0)
;;;
(define-public pseint-bin
  (package
    (name "pseint-bin")
    (version "20250314")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cfhcable.dl.sourceforge.net/project/pseint/"
             version "/pseint-l64-" version ".tgz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/pseint"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/opt/pseint/wxPSeInt")
                              (string-append bin "/pseint"))))))))
    (home-page "http://pseint.sourceforge.net")
    (synopsis "pseudocode IDE for learning programming")
    (description
     "PSeInt (Pseudo Interprete) is an educational tool for Spanish-speaking
students learning the fundamentals of programming.  It provides an IDE
for writing, testing, and debugging pseudocode in a simplified
algorithmic language with flow chart visualization.")
    (license license:gpl2)))

;;; ── brother-hl1200 ──────────────────────────────────────────────
;;; Brother HL-1200 series CUPS printer driver
;;; AUR: brother-hl1200  →  Guix: brother-hl1200
;;; Upstream: http://support.brother.com (binary RPMs, GPL/proprietary)
;;;
(define-public brother-hl1200
  (package
    (name "brother-hl1200")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://download.brother.com/welcome/dlf101869/"
             "hl1200lpr-" version "-1.i386.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/brother"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "rpm2cpio" source)
                   ;; rpm2cpio outputs to stdout; use cpio to extract
                   (system* "sh" "-c"
                            (string-append "rpm2cpio " source
                                           " | cpio -idm")))))))
    (home-page "http://support.brother.com")
    (synopsis "Brother HL-1200 series CUPS printer driver")
    (description
     "This package provides the Brother HL-1200 series CUPS printer driver
including the LPR filter and PPD file.  It contains proprietary binary
filter components from Brother required for printing.  Note: this
package includes 32-bit i386 binaries that require multilib support.")
    (license (list license:gpl2
                   (nonguix-license:nonfree
                    "https://support.brother.com"
                    "Brother proprietary filter binaries")))))

;;; ── brother-mfc-j1010dw ─────────────────────────────────────────
;;; Brother MFC-J1010DW printer/scanner driver
;;; AUR: brother-mfc-j1010dw  →  Guix: brother-mfc-j1010dw
;;; Upstream: https://support.brother.com (binary RPM, proprietary)
;;;
(define-public brother-mfc-j1010dw
  (package
    (name "brother-mfc-j1010dw")
    (version "3.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.brother.com/welcome/dlf105353/"
             "mfcj1010dwpdrv-" version "-1.i386.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/brother"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (system* "sh" "-c"
                            (string-append "rpm2cpio " source
                                           " | cpio -idm")))))))
    (home-page "https://support.brother.com")
    (synopsis "Brother MFC-J1010DW printer and scanner driver")
    (description
     "This package provides the Brother MFC-J1010DW multifunction
printer and scanner driver for CUPS.  It includes the LPR driver, CUPS
wrapper, PPD file, and scanner driver components.  Note: this package
contains proprietary 32-bit i386 binaries from Brother.")
    (license (nonguix-license:nonfree
              "https://support.brother.com"
              "Brother EULA; proprietary driver binaries"))))

;;; ── dev-janitor-bin ─────────────────────────────────────────────
;;; Developer workspace cleanup tool (Tauri binary)
;;; AUR: dev-janitor-bin  →  Guix: dev-janitor-bin
;;; Upstream: https://github.com/cocojojo5213/Dev-Janitor (binary, MIT)
;;;
(define-public dev-janitor-bin
  (package
    (name "dev-janitor-bin")
    (version "2.2.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/cocojojo5213/Dev-Janitor"
             "/releases/latest/download/"
             "Dev.Janitor_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out #$output)
                      (bin (string-append out "/bin"))
                      (share (string-append out "/share"))
                      (source #$source))
                 (setenv "PATH"
                         (string-append #$(this-package-native-input "tar")
                                        "/bin:"
                                        #$(this-package-native-input "gzip")
                                        "/bin:"
                                        #$(this-package-native-input "binutils")
                                        "/bin"))
                 (invoke "ar" "x" source)
                 (invoke "tar" "xf" "data.tar.gz")
                 (mkdir-p bin)
                 (copy-recursively "usr/bin" bin)
                 (when (file-exists? "usr/share")
                   (mkdir-p share)
                   (copy-recursively "usr/share" share))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) gzip)
                         (@ (gnu packages base) binutils)))
    (home-page "https://github.com/cocojojo5213/Dev-Janitor")
    (synopsis "developer workspace cleanup tool")
    (description
     "Dev Janitor is a desktop application for cleaning up developer
workspaces by removing @code{node_modules}, @code{target}, and other
build artifact directories.  It scans project directories and provides
a GUI for selectively removing build artifacts to free disk space.")
    (license license:expat)))

;;; ── hla-bin ─────────────────────────────────────────────────────
;;; High Level Assembly language system
;;; AUR: hla-bin  →  Guix: hla-bin
;;; Upstream: https://www.plantation-productions.com/Webster/HighLevelAsm
;;;   (binary, CC-BY-4.0)
;;;
(define-public hla-bin
  (package
    (name "hla-bin")
    (version "2.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.plantation-productions.com/Webster/HighLevelAsm/"
             "HLAv" version "/linux.hla.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/hla/hla" "bin/hla")
                ("usr/hla/hlacmp" "bin/hlacmp")
                ("usr/hla/hlaparse" "bin/hlaparse")
                ("usr/hla/lib" "lib/hla/")
                ("usr/hla/include" "include/hla/"))))
    (home-page
     "https://www.plantation-productions.com/Webster/HighLevelAsm")
    (synopsis "High Level Assembly language compiler and tools")
    (description
     "HLA (High Level Assembly) is an assembly language development system
that uses high-level language syntax such as @code{if/then/else},
@code{while}, and @code{for} loops while generating native x86 machine
code.  It is designed for teaching assembly language programming with
a gentler learning curve than traditional assemblers.")
    (license license:cc-by4.0)))

;;; ── notify-complete ─────────────────────────────────────────────
;;; Desktop notification when long-running shell commands finish
;;; AUR: notify-complete  →  Guix: notify-complete
;;; Upstream: https://github.com/andybug/notify-complete (Rust, MIT)
;;;
(define-public notify-complete
  (package
    (name "notify-complete")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/andybug/notify-complete"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/andybug/notify-complete")
    (synopsis "desktop notification for completed shell commands")
    (description
     "notify-complete sends a desktop notification when a long-running
shell command finishes executing.  It integrates with D-Bus to display
notifications through the system notification daemon, helping users
track background tasks without constantly checking the terminal.")
    (license license:expat)))

;;; ── awsvpnclient ────────────────────────────────────────────────
;;; AWS Client VPN desktop application
;;; AUR: awsvpnclient  →  Guix: awsvpnclient
;;; Upstream: https://aws.amazon.com/vpn/ (binary .deb, proprietary)
;;;
(define-public awsvpnclient
  (package
    (name "awsvpnclient")
    (version "5.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://d20adtppz83p9s.cloudfront.net/GTK/"
             version "/awsvpnclient_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out #$output)
                      (bin (string-append out "/bin"))
                      (source #$source))
                 (setenv "PATH"
                         (string-append #$(this-package-native-input "tar")
                                        "/bin:"
                                        #$(this-package-native-input "zstd")
                                        "/bin:"
                                        #$(this-package-native-input "binutils")
                                        "/bin"))
                 (invoke "ar" "x" source)
                 (invoke "tar" "xf" "data.tar.zst")
                 (mkdir-p bin)
                 (copy-recursively "usr" (string-append out "/usr"))
                 (copy-recursively "opt" (string-append out "/opt"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) zstd)
                         (@ (gnu packages base) binutils)))
    (home-page "https://aws.amazon.com/vpn/")
    (synopsis "AWS Client VPN desktop application")
    (description
     "AWS Client VPN is the official desktop application from Amazon Web
Services for establishing VPN connections to AWS Client VPN endpoints.
It provides a GUI for managing VPN profiles and connecting to AWS
private networks.")
    (license (nonguix-license:nonfree
              "https://aws.amazon.com/agreement/"
              "AWS Customer Agreement; proprietary binary"))))

;;; ── starcal ─────────────────────────────────────────────────────
;;; Multi-calendar and event manager
;;; AUR: starcal  →  Guix: starcal
;;; Upstream: https://github.com/ilius/starcal (Python/GTK, GPL-3.0)
;;;
(define-public starcal
  (package
    (name "starcal")
    (version "3.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ilius/starcal/releases/download/"
             version "/starcal3-" version "-1-any.pkg.tar.zst"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out #$output)
                      (source #$source))
                 (setenv "PATH"
                         (string-append #$(this-package-native-input "tar")
                                        "/bin:"
                                        #$(this-package-native-input "zstd")
                                        "/bin"))
                 (invoke "tar" "xf" source)
                 (copy-recursively "usr" (string-append out "/usr"))))))
    (native-inputs (list (@ (gnu packages base) tar)
                         (@ (gnu packages compression) zstd)))
    (home-page "https://github.com/ilius/starcal")
    (synopsis "multi-calendar application and event manager")
    (description
     "StarCalendar is a desktop calendar application that supports
multiple calendar systems including Gregorian, Jalali (Persian),
Islamic Hijri, and more.  It provides event management, day notes,
and a GTK-based interface with plugin support for additional calendar
systems.")
    (license license:gpl3)))

;;; ── adom-noteye ─────────────────────────────────────────────────
;;; Ancient Domains of Mystery graphical frontend
;;; AUR: adom-noteye  →  Guix: adom-noteye
;;; Upstream: http://www.adom.de/ (binary, custom/proprietary)
;;;
(define-public adom-noteye
  (package
    (name "adom-noteye")
    (version "3.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo.sshadm.in/archlinux/eldios/x86_64/"
             "adom_noteye_64_" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/adom"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/adom")
                       (lambda (port)
                         (format port "#!~a~%cd ~a/opt/adom~%exec ./adom \"$@\"~%"
                                 (which "bash")
                                 out)))
                     (chmod (string-append bin "/adom") #o755)))))))
    (inputs (list bash ncurses))
    (home-page "http://www.adom.de/")
    (synopsis "Ancient Domains of Mystery graphical roguelike")
    (description
     "ADOM (Ancient Domains of Mystery) is a roguelike RPG with a rich
story, deep character development, and complex dungeon exploration.
This package provides the NotEye graphical frontend version which
adds tile-based graphics, sound, and mouse support to the classic
terminal-based game.  ADOM is freeware but not open source.")
    (license (nonguix-license:nonfree
              "http://www.adom.de/"
              "ADOM freeware license; proprietary"))))

;;; ── opentaiko-bin ───────────────────────────────────────────────
;;; Open-source Taiko drum rhythm game
;;; AUR: opentaiko  →  Guix: opentaiko-bin
;;; Upstream: https://github.com/0auBSQ/OpenTaiko (.NET binary, MIT)
;;;
(define-public opentaiko-bin
  (package
    (name "opentaiko-bin")
    (version "0.6.0.96")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/0auBSQ/OpenTaiko/releases/download/"
             version "/OpenTaiko.Linux.x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "opt/opentaiko"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/opentaiko")
                       (lambda (port)
                         (format port "#!~a~%cd ~a/opt/opentaiko~%exec ./OpenTaiko \"$@\"~%"
                                 (which "bash")
                                 out)))
                     (chmod (string-append bin "/opentaiko") #o755)))))))
    (inputs (list bash))
    (home-page "https://github.com/0auBSQ/OpenTaiko")
    (synopsis "open-source Taiko drum rhythm game")
    (description
     "OpenTaiko is an open-source Taiko no Tatsujin (Taiko drum)
rhythm game clone built with .NET.  It supports custom songs, multiple
difficulty levels, multiplayer, and a variety of gameplay modes.
Requires a .NET runtime and SDL2 for audio and input.")
    (license license:expat)))

;;; ── doublecmd-plugin-p7z-usr ────────────────────────────────────
;;; 7-Zip plugin for Double Commander file manager
;;; AUR: doublecmd-plugin-p7z-usr  →  Guix: doublecmd-plugin-p7z-usr
;;; Upstream: https://github.com/ikk00/p7z-usr (C++/Make, GPL-3.0)
;;;
(define-public doublecmd-plugin-p7z-usr
  (package
    (name "doublecmd-plugin-p7z-usr")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ikk00/p7z-usr/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (chdir "projects/01_shared_lib")
                   (invoke "make" "release")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (lib (string-append out "/lib/doublecmd/plugins/wcx/p7z_usr")))
                     (mkdir-p lib)
                     (install-file "release/p7z_usr.wcx" lib)))))))
    (home-page "https://github.com/ikk00/p7z-usr")
    (synopsis "7-Zip WCX plugin for Double Commander")
    (description
     "This is a 7-Zip archive handler plugin for the Double Commander
file manager.  It uses the p7zip library to provide transparent access
to 7z, ZIP, RAR, and other archive formats within the Double Commander
file panel, supporting browsing, extraction, and creation of archives.")
    (license license:gpl3)))

;;; ── whisper-cpp-vulkan ──────────────────────────────────────────
;;; OpenAI Whisper speech recognition with Vulkan GPU acceleration
;;; AUR: whisper.cpp-vulkan  →  Guix: whisper-cpp-vulkan
;;; Upstream: https://github.com/ggml-org/whisper.cpp (C++/CMake, MIT)
;;;
(define-public whisper-cpp-vulkan
  (package
    (name "whisper-cpp-vulkan")
    (version "1.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ggml-org/whisper.cpp/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DGGML_VULKAN=ON"
                   "-DWHISPER_SDL2=ON"
                   "-DWHISPER_FFMPEG=ON"
                   "-DBUILD_SHARED_LIBS=ON")
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 ffmpeg vulkan-headers vulkan-loader
                  shaderc))
    (home-page "https://github.com/ggml-org/whisper.cpp")
    (synopsis "OpenAI Whisper speech recognition with Vulkan GPU support")
    (description
     "whisper.cpp is a high-performance C/C++ port of OpenAI's Whisper
automatic speech recognition model.  This variant is built with Vulkan
GPU acceleration for faster inference on GPUs that support the Vulkan
compute API.  It supports real-time transcription, translation, and
language detection across 99 languages.")
    (license license:expat)))

;;; ── rbdoom3-bfg ─────────────────────────────────────────────────
;;; DOOM 3 BFG Edition source port with modern rendering
;;; AUR: rbdoom3-bfg-git  →  Guix: rbdoom3-bfg
;;; Upstream: https://github.com/RobertBeckebans/RBDOOM-3-BFG
;;;   (C++/CMake, GPL-3.0)
;;;
(define-public rbdoom3-bfg
  (package
    (name "rbdoom3-bfg")
    (version "1.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/RobertBeckebans/RBDOOM-3-BFG")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DUSE_SYSTEM_ZLIB=ON"
                   "-DUSE_SYSTEM_LIBPNG=ON"
                   "-DUSE_SYSTEM_LIBJPEG=ON"
                   "-DUSE_SYSTEM_GLEW=ON"
                   "-DUSE_SYSTEM_RAPIDJSON=ON")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'chdir-to-neo
                 (lambda _ (chdir "neo"))))))
    (native-inputs (list pkg-config))
    (inputs (list zlib libpng libjpeg-turbo glew openal sdl2
                  ffmpeg vulkan-headers vulkan-loader))
    (home-page "https://github.com/RobertBeckebans/RBDOOM-3-BFG")
    (synopsis "DOOM 3 BFG Edition source port with modern rendering")
    (description
     "RBDOOM-3-BFG is a modernized source port of DOOM 3 BFG Edition with
PBR materials, baked global illumination, soft shadows, Vulkan renderer
support, and other graphical enhancements.  It requires the original
DOOM 3 BFG Edition game data files to play.")
    (license license:gpl3)))
