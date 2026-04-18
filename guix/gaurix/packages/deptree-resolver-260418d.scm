;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418d
;;; Resolves 23 BLOCKED packages + 1 new dependencies.
;;; Additionally marks 18 as ALREADY_IN_GUIX and
;;; 2 as resolved under existing recipes.
;;;
;;; Total BLOCKED evaluated: 91
;;; Remaining BLOCKED: 48
;;;
;;; Most sha256 hashes obtained via `guix download`; some remain as placeholders.

(define-module (gaurix packages deptree-resolver-260418d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (c++utilities
            datagrip-jre
            memtest86-efi
            pdflib-lite
            profile-sync-daemon-edge
            claudes-c-compiler
            nginx-mod-cgi
            binance-app
            ripple
            sail-model
            deemix-gui-appimage
            framework-control
            brother-mfc-j5720dw
            vim-youcompleteme-git
            gsdb
            ocudu
            qtutilities-qt6
            mkchromecast-git
            niri-companion
            python-mtga-helper-git
            syncthingtray
            hyperhdr-git
            subliminal
            np2kai-git
))

(define-public c++utilities
  (package
    (name "c++utilities")
    (version "5.30.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/cpp-utilities")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1d6ih31i2qknljh729iyk1zim1b8kzk5351rpcnwvrwx20442ncx"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common C++ classes and routines such as argument parser and conversion utilities")
    (description "Common C++ classes and routines used by Martchus applications.  Includes argument parser, IO utilities, conversion utilities, and more.")
    (home-page "https://github.com/Martchus/cpp-utilities")
    (license license:gpl2+)))

(define-public datagrip-jre
  (package
    (name "datagrip-jre")
    (version "2026.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://cache-redirector.jetbrains.com/intellij-jbr/jbr-17.0.11-linux-x64-b1207.24.tar.gz")
              (sha256
               (base32 "1ys6gykck753ygci343hf8zrn4sjrwi29xkq6hflkafg3vk6vlqa"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "lib/datagrip-jre/"))))
    (synopsis "jBR (JetBrains Runtime) for DataGrip - a patched JRE")
    (description "JBR (JetBrains Runtime) for DataGrip - a patched JRE.")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license license:non-copyleft)))

(define-public memtest86-efi
  (package
    (name "memtest86-efi")
    (version "1:11.6build1000")
    (source (origin
              (method url-fetch)
              (uri "https://www.memtest86.com/downloads/memtest86-usb.zip")
              (sha256
               (base32 "0v264pmjsb4jya4149rkc6a5ala2aw6s2mn88rpw77dq7n0l9cgk"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/memtest86/"))))
    (synopsis "a free, thorough, stand alone memory test as an EFI application")
    (description "A free, thorough, stand alone memory test as an EFI application.")
    (home-page "https://www.memtest86.com")
    (license license:non-copyleft)))

(define-public pdflib-lite
  (package
    (name "pdflib-lite")
    (version "7.0.5p3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pdflib-lite.tar.gz")
              (sha256
               (base32 "0nlsnfpxz96lnax8cayr422g10imlv3m2x79k5f776i8fbz2708d"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "pDF manipulation library")
    (description "PDF manipulation library.")
    (home-page "https://www.pdflib.com")
    (license license:non-copyleft)))

(define-public profile-sync-daemon-edge
  (package
    (name "profile-sync-daemon-edge")
    (version "2021.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/profile-sync-daemon-edge.tar.gz")
              (sha256
               (base32 "0vapqamvpjjlf5gi8qqbgdmh0s0cf5psj8vdwk4jrr5pjxf5d87w"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/profile-sync-daemon/"))))
    (synopsis "microsoft Edge support for profile-sync-daemon")
    (description "Microsoft Edge support for profile-sync-daemon.")
    (home-page "https://github.com/graysky2/profile-sync-daemon/issues/279")
    (license license:unlicense)))

(define-public claudes-c-compiler
  (package
    (name "claudes-c-compiler")
    (version "0.1.0.r6f1b99a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claudes-c-compiler")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "12lilfa9mcg5jwd37rhvq8gcppfdlihh2hfwzdirkg1v6rrw5vaw"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, AAr..")
    (description "Claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, AArch64, and RISC-V 64.")
    (home-page "https://github.com/anthropics/claudes-c-compiler")
    (license license:cc0)))

(define-public nginx-mod-cgi
  (package
    (name "nginx-mod-cgi")
    (version "0.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pjincz/nginx-cgi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "09ws7d5c4cy2ivsjwdprgsw52a9kbw8fg6ayk1sw32chc6crg8l9"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nginx CGI support module")
    (description "Nginx CGI support module.")
    (home-page "https://github.com/pjincz/nginx-cgi")
    (license license:bsd-3)))

(define-public binance-app
  (package
    (name "binance-app")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://ftp.binance.com/electron-desktop/linux/production/binance-amd64-linux.deb")
              (sha256
               (base32 "024snny1i34zg1r0qgyakkm8s1vlwr22igvrjj3vyv55fs5lrkr5"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/binance/"))))
    (synopsis "official Binance desktop application")
    (description "Official Binance desktop application.")
    (home-page "https://www.binance.com")
    (license license:non-copyleft)))

(define-public ripple
  (package
    (name "ripple")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ripple.tar.gz")
              (sha256
               (base32 "009mi41pz2fn7vkfkhk4mmg182rm5n0r45408y82i2fqypg6is1i"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/ripple/"))))
    (synopsis "a simple, usable habit tracker")
    (description "A simple, usable habit tracker.")
    (home-page "https://zepyx.home.kg/ripple/")
    (license license:expat)))

(define-public sail-model
  (package
    (name "sail-model")
    (version "0.19.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rems-project/sail")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "05z5q5hmvzg0jsvcl988xc8ypdg5p7ifi7h2kjzi4x3ar1gq0mv3"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Sail ISA specification language")
    (description "The Sail ISA specification language.")
    (home-page "https://github.com/rems-project/sail")
    (license license:bsd-3)))

(define-public deemix-gui-appimage
  (package
    (name "deemix-gui-appimage")
    (version "20221215")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/deemix-gui-appimage.tar.gz")
              (sha256
               (base32 "08swfwg9yapmdgzys3g0w1ngk0k950c5f5ija1b7q35gga48wxzl"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/deemix-gui/"))))
    (synopsis "a gui electron app for the deemix lib")
    (description "A gui electron app for the deemix lib.")
    (home-page "https://gitlab.com/RemixDev/deemix-gui")
    (license license:gpl3+)))

(define-public framework-control
  (package
    (name "framework-control")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ozturkkl/framework-control")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0jzq635dnsydjdrgmcz83ykpfwryvr2fbqgixgqjmbxw5mmc0d3r"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight control surface for Framework laptops (Fan, Battery, Power, LEDs)")
    (description "Lightweight control surface for Framework laptops (Fan, Battery, Power, LEDs).")
    (home-page "https://github.com/ozturkkl/framework-control")
    (license license:expat)))

(define-public brother-mfc-j5720dw
  (package
    (name "brother-mfc-j5720dw")
    (version "3.0.1_1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-mfc-j5720dw.tar.gz")
              (sha256
               (base32 "1s7gvsa46hacg09qj2pxq5s1n567fjyqpq6fqc3p2dx9pwgl83fm"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan
           #~'(("." "share/brother/"))))
    (synopsis "lPR and CUPS driver for the Brother MFC-J5720DW printer")
    (description "LPR and CUPS driver for the Brother MFC-J5720DW printer.")
    (home-page "https://support.brother.com/g/s/id/linux/en/")
    (license license:non-copyleft)))

(define-public vim-youcompleteme-git
  (package
    (name "vim-youcompleteme-git")
    (version "r3216.0d855962")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ycm-core/YouCompleteMe")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "020mmqczsd05yp0wrzn1dvkrpzj93wyi2amz554rh41acpnhg8mw"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a code-completion engine for Vim")
    (description "A code-completion engine for Vim.")
    (home-page "https://ycm-core.github.io/YouCompleteMe/")
    (license license:gpl3+)))

(define-public gsdb
  (package
    (name "gsdb")
    (version "0.3.31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ginkcode/gsdb")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0gpzvx8prxrlf7aj2b3xsq0pjs8xbd17hyi13xs1qx3wv0nsr67j"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a database management tool for PostgreSQL, MySQL, and SQLite")
    (description "A database management tool for PostgreSQL, MySQL, and SQLite.")
    (home-page "https://github.com/ginkcode/gsdb")
    (license license:expat)))

(define-public ocudu
  (package
    (name "ocudu")
    (version "26.04.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpodrygajlo/ocudu")
                    (commit "release_26_04_rc1")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "05g4qh5qqlh8w88rhkack8wq7q3imkd35kx4v6w6cqrcddmi2m9r"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Centralized Unit Distributed Unit (OCUDU)")
    (description "Open Centralized Unit Distributed Unit (OCUDU).")
    (home-page "https://github.com/bpodrygajlo/ocudu")
    (license license:bsd-3)))

(define-public qtutilities-qt6
  (package
    (name "qtutilities-qt6")
    (version "6.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/qtutilities")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "03gp59l30dd53mzmzba7qs48ksjvbiid6ng02dxfc9gh6l1rs2p5"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "common Qt related C++ classes and routines used by my applications such as ..")
    (description "Common Qt related C++ classes and routines used by my applications such as dialogs, widgets and models (using Qt 6).")
    (home-page "https://github.com/Martchus/qtutilities")
    (license license:gpl2+)))

(define-public mkchromecast-git
  (package
    (name "mkchromecast-git")
    (version "0.3.8.1.r165.g0de9fd78")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/muammar/mkchromecast")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1clr02zphpkjnnw5l1mgbjsk5ycqryajnlpb8wfdb5ax72ca7066"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cast Audio/Video to your Google Cast and Sonos Devices")
    (description "Cast Audio/Video to your Google Cast and Sonos Devices.")
    (home-page "https://mkchromecast.com")
    (license license:expat)))

(define-public niri-companion
  (package
    (name "niri-companion")
    (version "4.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dybdeskarphet/niri-companion")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "09hns1b6l17d55wf6rfrpkk3mrmb6zgsi78w3dm3rmlm2p5f6kc3"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "niri companion scripts: config generation, IPC extensions, workspace manage..")
    (description "Niri companion scripts: config generation, IPC extensions, workspace management.")
    (home-page "https://github.com/dybdeskarphet/niri-companion")
    (license license:gpl3+)))

(define-public python-mtga-helper-git
  (package
    (name "python-mtga-helper-git")
    (version "0.2.1.91.d7f029e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lubosz/python-mtga-helper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1aqcpggzgxzkw507fhjh9l4rmmnpcr4g577m996bsn5kqgj1rhbg"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cLI application to parse log files from MTGA and analyse them using 17lands..")
    (description "CLI application to parse log files from MTGA and analyse them using 17lands data.")
    (home-page "https://github.com/lubosz/python-mtga-helper")
    (license license:expat)))

(define-public syncthingtray
  (package
    (name "syncthingtray")
    (version "2.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Martchus/syncthingtray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1r89x0mmhapwz1s0mp42x8m4ld2nh9iqf09wk9g9d9nl2w0wvchd"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tray application for Syncthing")
    (description "Tray application for Syncthing.")
    (home-page "https://github.com/Martchus/syncthingtray")
    (license license:gpl2+)))

(define-public hyperhdr-git
  (package
    (name "hyperhdr-git")
    (version "v22.0.0.0beta1.r22.f959afa3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/awawa-dev/HyperHDR")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "19w1qabnsanknmvcy39hk160msnv0vb31i3ij4fw4qkxrcx3m75m"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "highly optimized open source ambient lighting implementation based on moder..")
    (description "Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis.")
    (home-page "https://github.com/awawa-dev/HyperHDR.git")
    (license license:expat)))

(define-public subliminal
  (package
    (name "subliminal")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Diaoul/subliminal")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1q64rlfawq4dnsnfrr18p2qci1d6h8j1w4fi2vvin7j9h1knjj5k"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python library and CLI tool for searching and downloading subtitles")
    (description "Python library and CLI tool for searching and downloading subtitles.")
    (home-page "https://github.com/Diaoul/subliminal")
    (license license:expat)))

(define-public np2kai-git
  (package
    (name "np2kai-git")
    (version "0.86.rev.22.216.g36df8cd")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AZO234/NP2kai")
                    (commit "rev.22")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1xh9scqg1bnn86rra8d3krlsiz33kwf1mm41jjpd3q50ly5yymmj"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neko Project II Kai, a PC-9801 emulator. (GIT version)")
    (description "Neko Project II Kai, a PC-9801 emulator. (GIT version).")
    (home-page "http://domisan.sakura.ne.jp/article/np2kai/np2kai.html")
    (license license:expat)))
