;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. ttf-ms-fonts (font/copy, v2.0, custom:microsoft)
;;;   2. vscodium-bin (copy/binary, v1.99.3, MIT)
;;;   3. xnviewmp (copy/binary, v1.10.5, custom:proprietary)
;;;   4. davinci-resolve (copy/binary, v20.3.2, custom:commercial)
;;;   5. virtualbox-ext-oracle (copy/binary, v7.2.6, custom:PUEL)
;;;   6. rider-bin (copy/binary, v2026.1, custom:commercial)
;;;   7. logseq-desktop-bin (copy/binary, v0.10.15, AGPL-3.0+)
;;;   8. corsix-th (cmake, v0.69.1, MIT)
;;;   9. birdtray (cmake/Qt5, v1.11.4, GPL-3.0)
;;;  10. tutanota-desktop-bin (copy/binary, v340.260326.1, GPL-3.0+)
;;;  11. tomb (gnu/copy, v2.13, GPL-3.0+)
;;;  12. perl-mojolicious (perl, v9.42, GPL+Artistic)
;;;  13. floorp-bin (copy/binary, v12.12.1, MPL-2.0)
;;;  14. vcmi (cmake, v1.7.3, GPL-2.0+)
;;;  15. bvi (gnu, v1.5.0, GPL-2.0+)
;;;  16. jamesdsp (cmake/Qt6, v2.7.0, GPL-3.0+)
;;;  17. oh-my-posh-bin (copy/binary, v29.10.0, MIT)
;;;  18. plzip (gnu, v1.12, GPL-2.0+)
;;;  19. musikcube (cmake, v3.0.5, BSD-3)
;;;  20. libticonv (gnu, v1.1.5, GPL-2.0+)
;;;  21. python-schedule (pyproject, v1.2.2, MIT)
;;;  22. cc65 (gnu/make, v2.19, BSD)
;;;  23. opustags (cmake, v1.10.1, BSD-3)
;;;  24. ddcui (cmake/Qt6, v0.6.0, GPL-2.0+)
;;;  25. svtplay-dl (pyproject, v4.179, MIT)
;;;  26. python-pywal16 (python, v3.8.15, MIT)
;;;  27. shutter-encoder-bin (copy/binary, v20.0, GPL-3.0)
;;;  28. hytale-launcher-bin (copy/binary, v2026.04.08, custom)
;;;  29. openttd-jgrpp (cmake, v0.71.2, GPL-2.0)
;;;  30. latin-words (gnu/make, v1.97FC, custom)
;;;
;;; 30 recipes written. 0 BLOCKED.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260417k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            ttf-ms-fonts
            vscodium-bin
            xnviewmp
            davinci-resolve-bin
            virtualbox-ext-oracle
            rider-bin
            logseq-desktop-bin
            corsix-th
            birdtray
            tutanota-desktop-bin
            tomb
            perl-mojolicious
            floorp-bin
            vcmi
            bvi
            jamesdsp
            oh-my-posh-bin
            plzip
            musikcube
            libticonv
            python-schedule
            cc65
            opustags
            ddcui
            svtplay-dl
            python-pywal16
            shutter-encoder-bin
            hytale-launcher-bin
            openttd-jgrpp
            latin-words
            ))

;;; Custom license definitions for non-standard licenses.
(define license:microsoft-core-fonts
  ((@@ (guix licenses) license) "Microsoft Core Fonts EULA"
    "https://corefonts.sourceforge.net/eula.htm"
    "Microsoft core fonts end-user license agreement"))

(define license:puel
  ((@@ (guix licenses) license) "Oracle PUEL"
    "https://www.virtualbox.org/wiki/VirtualBox_PUEL"
    "Oracle VM VirtualBox Personal Use and Evaluation License"))

(define license:blackmagic
  ((@@ (guix licenses) license) "Blackmagic Design EULA"
    "https://www.blackmagicdesign.com/eula"
    "Blackmagic Design end-user license agreement"))

(define license:jetbrains
  ((@@ (guix licenses) license) "JetBrains Subscription Agreement"
    "https://www.jetbrains.com/legal/docs/toolbox/license/"
    "JetBrains subscription license agreement"))

(define license:hytale
  ((@@ (guix licenses) license) "Hytale EULA"
    "https://hytale.com/terms"
    "Hytale end-user license agreement"))

(define license:latin-words
  ((@@ (guix licenses) license) "Latin Words License"
    "http://archives.nd.edu/whitaker/words.htm"
    "Freely distributable Latin dictionary by William Whitaker"))

;;; -------------------------------------------------------------------
;;; 1. ttf-ms-fonts — Microsoft core TrueType fonts
;;; -------------------------------------------------------------------
(define-public ttf-ms-fonts
  (package
    (name "ttf-ms-fonts")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://downloads.sourceforge.net/corefonts/andale32.exe")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/msfonts/"
                #:include-regexp ("\\.ttf$" "\\.TTF$")))))
    (native-inputs (list cabextract))
    (synopsis "core TrueType fonts from Microsoft")
    (description "This package provides the Microsoft core TrueType fonts
including Andale Mono, Arial, Comic Sans MS, Courier New, Georgia, Impact,
Times New Roman, Trebuchet MS, Verdana, and Webdings.  These fonts are
commonly required for web browsing and document compatibility.")
    (home-page "https://corefonts.sourceforge.net/")
    (license license:microsoft-core-fonts)))

;;; -------------------------------------------------------------------
;;; 2. vscodium-bin — VS Code without Microsoft telemetry
;;; -------------------------------------------------------------------
(define-public vscodium-bin
  (package
    (name "vscodium-bin")
    (version "1.99.3.25104")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/VSCodium/vscodium/releases/download/"
                    version "/VSCodium-linux-x64-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vscodium/" #:exclude ("resources/app/LICENSE.txt")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/vscodium/bin/codium")
                              (string-append out "/bin/codium"))))))))
    (synopsis "binary releases of VS Code without MS branding and telemetry")
    (description "VSCodium is a community-driven, freely-licensed binary
distribution of Microsoft's VS Code editor.  It removes Microsoft's telemetry,
branding, and proprietary license, providing the same editing experience with
full extension support.")
    (home-page "https://vscodium.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. xnviewmp — multimedia viewer and browser
;;; -------------------------------------------------------------------
(define-public xnviewmp
  (package
    (name "xnviewmp")
    (version "1.10.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.xnview.com/XnViewMP-linux-x64.tgz"))
              (file-name (string-append "xnviewmp-" version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/xnviewmp/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/xnviewmp/xnview")
                              (string-append out "/bin/xnviewmp"))))))))
    (synopsis "efficient multimedia viewer, browser, and converter")
    (description "XnViewMP is a versatile and powerful photo viewer, image
management, and image resizing application.  It supports more than 500 image
formats and provides batch processing, metadata editing, and format conversion
features.")
    (home-page "https://www.xnview.com/en/xnviewmp/")
    (license ((@@ (guix licenses) license) "XnViewMP License"
               "https://www.xnview.com/en/xnviewmp/#license"
               "Free for personal and educational use"))))

;;; -------------------------------------------------------------------
;;; 4. davinci-resolve-bin — professional video editing suite
;;; -------------------------------------------------------------------
(define-public davinci-resolve-bin
  (package
    (name "davinci-resolve-bin")
    (version "20.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.blackmagicdesign.com/api/support/us/downloads"
                    "/DaVinci_Resolve_" version "_Linux.zip"))
              (file-name (string-append "davinci-resolve-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/davinci-resolve/"))))
    (synopsis "professional video editing, color correction, and audio post-production")
    (description "DaVinci Resolve is a professional non-linear video editing,
color correction, visual effects, and audio post-production application from
Blackmagic Design.  The free version includes editing, Fusion visual effects,
color grading, and Fairlight audio tools.")
    (home-page "https://www.blackmagicdesign.com/products/davinciresolve/")
    (license license:blackmagic)))

;;; -------------------------------------------------------------------
;;; 5. virtualbox-ext-oracle — Oracle VirtualBox Extension Pack
;;; -------------------------------------------------------------------
(define-public virtualbox-ext-oracle
  (package
    (name "virtualbox-ext-oracle")
    (version "7.2.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.virtualbox.org/virtualbox/" version
                    "/Oracle_VirtualBox_Extension_Pack-" version ".vbox-extpack"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/virtualbox/extensions/"))))
    (synopsis "extension pack for Oracle VM VirtualBox")
    (description "The Oracle VM VirtualBox Extension Pack adds USB 2.0/3.0
support, VirtualBox Remote Desktop Protocol (VRDP), host webcam passthrough,
Intel PXE boot ROM, disk image encryption with AES, and NVMe controller
support to VirtualBox.")
    (home-page "https://www.virtualbox.org/")
    (license license:puel)))

;;; -------------------------------------------------------------------
;;; 6. rider-bin — JetBrains .NET IDE
;;; -------------------------------------------------------------------
(define-public rider-bin
  (package
    (name "rider-bin")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.jetbrains.com/rider/"
                    "JetBrains.Rider-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rider/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/rider/bin/rider")
                              (string-append out "/bin/rider"))))))))
    (synopsis "cross-platform .NET IDE by JetBrains")
    (description "JetBrains Rider is a cross-platform .NET IDE based on the
IntelliJ platform and ReSharper.  It supports .NET Framework, .NET Core, Mono,
Xamarin, ASP.NET, and Unity development with integrated debugging, testing,
profiling, and database tools.")
    (home-page "https://www.jetbrains.com/rider/")
    (license license:jetbrains)))

;;; -------------------------------------------------------------------
;;; 7. logseq-desktop-bin — knowledge management platform
;;; -------------------------------------------------------------------
(define-public logseq-desktop-bin
  (package
    (name "logseq-desktop-bin")
    (version "0.10.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/logseq/logseq/releases/download/"
                    version "/Logseq-linux-x64-" version ".AppImage"))
              (file-name (string-append "logseq-desktop-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/logseq/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/logseq")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/share/logseq/Logseq-linux-x64-~a.AppImage \"$@\"~%"
                                 out #$version)))
                     (chmod (string-append bin "/logseq") #o755)))))))
    (synopsis "privacy-first open-source platform for knowledge management")
    (description "Logseq is a privacy-first, open-source knowledge base that
works on top of local plain-text Markdown and Org-mode files.  It provides
bidirectional linking, outlining, journaling, task management, and a graph
view of your knowledge network.")
    (home-page "https://logseq.com/")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 8. corsix-th — Theme Hospital reimplementation
;;; -------------------------------------------------------------------
(define-public corsix-th
  (package
    (name "corsix-th")
    (version "0.69.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/CorsixTH/CorsixTH")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLUA_INCLUDE_DIR="
                                  (assoc-ref %build-inputs "lua")
                                  "/include")
                   "-DWITH_AUDIO=ON"
                   "-DWITH_MOVIES=ON")))
    (native-inputs (list pkg-config))
    (inputs (list ffmpeg freetype lua sdl2 sdl2-mixer))
    (synopsis "reimplementation of the Theme Hospital game engine")
    (description "CorsixTH is an open-source reimplementation of the game
engine of Theme Hospital, the classic Bullfrog hospital management simulation
game.  It requires the original game data files to play and adds modern
features like higher resolutions, bug fixes, and new gameplay options.")
    (home-page "https://corsixth.com/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. birdtray — system tray integration for Thunderbird
;;; -------------------------------------------------------------------
(define-public birdtray
  (package
    (name "birdtray")
    (version "1.11.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gyunaev/birdtray")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list qttools-5))
    (inputs (list qtbase-5 qtsvg-5 qtx11extras))
    (synopsis "system tray icon for Thunderbird with unread mail notification")
    (description "Birdtray is a system tray application that provides a
notification icon for Mozilla Thunderbird.  It shows the number of unread
messages and allows controlling Thunderbird from the system tray, including
showing, hiding, and launching the mail client.")
    (home-page "https://github.com/gyunaev/birdtray")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 10. tutanota-desktop-bin — encrypted email client
;;; -------------------------------------------------------------------
(define-public tutanota-desktop-bin
  (package
    (name "tutanota-desktop-bin")
    (version "340.260326.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tutao/tutanota/releases/download/"
                    "tutanota-desktop-release-" version
                    "/tutanota-desktop-linux.AppImage"))
              (file-name (string-append "tutanota-desktop-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tutanota/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink (string-append out "/share/tutanota/tutanota-desktop-linux.AppImage")
                              (string-append bin "/tutanota-desktop"))))))))
    (synopsis "desktop client for Tuta encrypted email service")
    (description "Tuta (formerly Tutanota) Desktop is the official desktop
client for the Tuta encrypted email service.  It provides end-to-end encrypted
email, calendar, and contacts with a focus on privacy and security.")
    (home-page "https://tuta.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. tomb — encrypted storage manager
;;; -------------------------------------------------------------------
(define-public tomb
  (package
    (name "tomb")
    (version "2.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.dyne.org/tomb/Tomb-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list cryptsetup gnupg zsh pinentry))
    (synopsis "crypto undertaker for managing encrypted storage")
    (description "Tomb is a simple tool to manage encrypted storage on
GNU/Linux.  It generates encrypted LUKS volumes to be opened and closed using
associated key files, which are also protected with a password.  Tomb is
written in Zsh and uses standard GNU/Linux tools like cryptsetup and GnuPG.")
    (home-page "https://www.dyne.org/software/tomb/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 12. perl-mojolicious — real-time web framework for Perl
;;; -------------------------------------------------------------------
(define-public perl-mojolicious
  (package
    (name "perl-mojolicious")
    (version "9.42")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://cpan/authors/id/S/SR/SRI/Mojolicious-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "real-time web framework for Perl")
    (description "Mojolicious is a next generation web framework for Perl.
It provides an integrated development server, automatic CGI and PSGI detection,
RESTful routes, plugins, templates, cookie management, session management,
testing framework, and first class Unicode support with no dependencies beyond
core Perl.")
    (home-page "https://mojolicious.org/")
    (license license:artistic2.0)))

;;; -------------------------------------------------------------------
;;; 13. floorp-bin — Firefox-based browser
;;; -------------------------------------------------------------------
(define-public floorp-bin
  (package
    (name "floorp-bin")
    (version "12.12.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicehash/nicehash/releases/download/"
                    "floorp-v" version
                    "/floorp-" version ".linux-x86_64.tar.bz2"))
              (file-name (string-append "floorp-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/floorp/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/floorp/floorp")
                              (string-append out "/bin/floorp"))))))))
    (synopsis "Firefox-based web browser focused on performance and customizability")
    (description "Floorp is a Firefox-based web browser focused on keeping the
Open, Private and Sustainable Web alive.  It provides vertical tabs, workspaces,
flexible toolbar customization, and enhanced privacy features while maintaining
full Firefox extension compatibility.")
    (home-page "https://floorp.app/")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 14. vcmi — Heroes of Might and Magic III engine
;;; -------------------------------------------------------------------
(define-public vcmi
  (package
    (name "vcmi")
    (version "1.7.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vcmi/vcmi")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DENABLE_TEST=OFF"
                   "-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE")))
    (native-inputs (list pkg-config qttools))
    (inputs (list boost ffmpeg minizip qtbase sdl2-image sdl2-mixer sdl2-ttf
                  zlib))
    (synopsis "open-source engine for Heroes of Might and Magic III")
    (description "VCMI is an open-source reimplementation of the Heroes of
Might and Magic III game engine.  It requires the original game data to play
and provides modern features including higher resolutions, improved AI, new
game mechanics, modding support, and multiplayer capabilities.")
    (home-page "https://vcmi.eu/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 15. bvi — binary file editor with vi-like interface
;;; -------------------------------------------------------------------
(define-public bvi
  (package
    (name "bvi")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/bvi/bvi-"
                    version ".src.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list ncurses))
    (synopsis "display-oriented editor for binary files with vi-like interface")
    (description "Bvi is a display-oriented editor for binary files that
operates similarly to the vi text editor.  It provides hex and ASCII display
modes, searching with regular expressions, and the ability to edit raw binary
data using familiar vi key bindings.")
    (home-page "https://bvi.sourceforge.net/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 16. jamesdsp — audio effect processor for PipeWire
;;; -------------------------------------------------------------------
(define-public jamesdsp
  (package
    (name "jamesdsp")
    (version "2.7.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Audio4Linux/JDSP4Linux")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list glibmm libarchive pipewire qtbase qtsvg))
    (synopsis "audio effect processor for PipeWire clients")
    (description "JamesDSP for Linux is an audio effect processor for
PipeWire and PulseAudio clients.  It provides equalizer, bass boost, stereo
widening, crossfeed, reverb, and convolution engine features through a Qt-based
graphical interface, allowing real-time audio processing of system audio.")
    (home-page "https://github.com/Audio4Linux/JDSP4Linux")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. oh-my-posh-bin — prompt theme engine
;;; -------------------------------------------------------------------
(define-public oh-my-posh-bin
  (package
    (name "oh-my-posh-bin")
    (version "29.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JanDeDobbeleer/oh-my-posh/releases/"
                    "download/v" version "/posh-linux-amd64"))
              (file-name (string-append "oh-my-posh-" version "-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "oh-my-posh-" #$version
                                        "-linux-amd64")
                         "bin/oh-my-posh"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'make-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/oh-my-posh")
                          #o755))))))
    (synopsis "prompt theme engine for any shell")
    (description "Oh My Posh is a custom prompt theme engine for any shell.
It supports bash, zsh, fish, PowerShell, and other shells with features
including git status integration, execution time display, battery level, and
highly customizable segment-based prompt themes using JSON or YAML
configuration.")
    (home-page "https://ohmyposh.dev/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. plzip — parallel lossless data compressor
;;; -------------------------------------------------------------------
(define-public plzip
  (package
    (name "plzip")
    (version "1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.savannah.gnu.org/releases/lzip/plzip/"
                    "plzip-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list lzlib))
    (synopsis "massively parallel lossless data compressor based on lzlib")
    (description "Plzip is a massively parallel (multi-threaded) lossless data
compressor and decompressor based on the lzlib compression library.  It uses
the lzip file format and is designed to scale to hundreds of processors,
providing much faster compression than the single-threaded lzip while
producing identical output.")
    (home-page "https://www.nongnu.org/lzip/plzip.html")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 19. musikcube — terminal-based music player
;;; -------------------------------------------------------------------
(define-public musikcube
  (package
    (name "musikcube")
    (version "3.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/clangen/musikcube")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DNO_NCURSESW=false")))
    (native-inputs (list pkg-config))
    (inputs (list curl faad2 ffmpeg flac lame libmicrohttpd libogg
                  libvorbis ncurses openssl pipewire zlib))
    (synopsis "terminal-based cross-platform music player and server")
    (description "Musikcube is a fully functional terminal-based music player,
library, and streaming audio server.  It features a clean ncurses interface,
gapless playback, library management with metadata indexing, remote control via
a web interface, and support for a wide range of audio formats through FFmpeg.")
    (home-page "https://musikcube.com/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 20. libticonv — TI character set conversion library
;;; -------------------------------------------------------------------
(define-public libticonv
  (package
    (name "libticonv")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/tilp/libticonv-"
                    version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (inputs (list glib))
    (synopsis "character set conversion library for TI calculators")
    (description "Libticonv is a library for converting character sets used
by Texas Instruments graphing calculators to and from UTF-8 and other standard
encodings.  It is part of the TILP project and supports TI-82 through TI-Nspire
calculator character sets.")
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 21. python-schedule — Python job scheduling for humans
;;; -------------------------------------------------------------------
(define-public python-schedule
  (package
    (name "python-schedule")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "schedule" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "job scheduling for humans in Python")
    (description "Schedule is an in-process scheduler for periodic jobs that
uses the builder pattern for configuration.  It provides a simple, human-
friendly syntax for scheduling Python functions to run at set intervals, on
certain days, or at specific times, without needing cron or external task
queues.")
    (home-page "https://github.com/dbader/schedule")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. cc65 — C compiler for 6502 family
;;; -------------------------------------------------------------------
(define-public cc65
  (package
    (name "cc65")
    (version "2.19")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cc65/cc65")
                    (commit (string-append "V" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "C compiler for 6502 family microprocessors")
    (description "Cc65 is a complete cross-development package for 65(C)02
systems, including a C compiler, macro assembler, linker, librarian, and
several other tools.  It supports development for Commodore 64, Apple II,
Atari, NES, and other 6502-based platforms with a subset of C89 and
platform-specific libraries.")
    (home-page "https://cc65.github.io/")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 23. opustags — Opus tags editor
;;; -------------------------------------------------------------------
(define-public opustags
  (package
    (name "opustags")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fmang/opustags")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libogg))
    (synopsis "Opus comment tag editor")
    (description "Opustags is a command-line tool for viewing and editing the
comment tags (metadata) in Opus audio files.  It supports reading, writing,
deleting, and replacing Vorbis comment tags in OggOpus files.")
    (home-page "https://github.com/fmang/opustags")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 24. ddcui — graphical user interface for ddcutil
;;; -------------------------------------------------------------------
(define-public ddcui
  (package
    (name "ddcui")
    (version "0.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rockowitz/ddcui")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config qttools))
    (inputs (list ddcutil glib qtbase))
    (synopsis "graphical user interface for controlling monitor settings via DDC/CI")
    (description "Ddcui is a Qt-based graphical user interface for ddcutil,
the Linux utility for managing monitor settings through the DDC/CI protocol.
It allows adjusting brightness, contrast, color temperature, input source,
and other monitor settings without using physical buttons.")
    (home-page "https://github.com/rockowitz/ddcui")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 25. svtplay-dl — media downloader for streaming sites
;;; -------------------------------------------------------------------
(define-public svtplay-dl
  (package
    (name "svtplay-dl")
    (version "4.179")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "svtplay-dl" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel python-build
                         python-installer))
    (propagated-inputs (list python-cryptography python-requests python-pyyaml
                             ffmpeg))
    (synopsis "media downloader for play sites like SVT Play")
    (description "Svtplay-dl is a command-line tool for downloading video and
audio streams from various Swedish and Nordic streaming services including
SVT Play, TV4 Play, and SR Play.  It supports HLS, DASH, and other streaming
protocols with automatic quality selection.")
    (home-page "https://svtplay-dl.se/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. python-pywal16 — color scheme generator using 16 colors
;;; -------------------------------------------------------------------
(define-public python-pywal16
  (package
    (name "python-pywal16")
    (version "3.8.15")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eylles/pywal16")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list imagemagick))
    (native-inputs (list python-setuptools))
    (synopsis "generate and change color schemes on the fly using 16 colors")
    (description "Pywal16 is a fork of pywal that generates a color scheme
from the dominant colors in a wallpaper image and applies it system-wide.
It uses 16 colors instead of the original pywal's approach, providing better
terminal color support.  It can theme terminals, window managers, and other
applications in real time.")
    (home-page "https://github.com/eylles/pywal16")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. shutter-encoder-bin — multimedia converter
;;; -------------------------------------------------------------------
(define-public shutter-encoder-bin
  (package
    (name "shutter-encoder-bin")
    (version "20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.shutterencoder.com/Shutter%20Encoder%20"
                    version "%20Linux%2064bits.tar.gz"))
              (file-name (string-append "shutter-encoder-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/shutter-encoder/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (call-with-output-file
                         (string-append out "/bin/shutter-encoder")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/share/shutter-encoder/Shutter\\ Encoder \"$@\"~%"
                                 out)))
                     (chmod (string-append out "/bin/shutter-encoder")
                            #o755)))))))
    (synopsis "multimedia converter for video, audio, and image formats")
    (description "Shutter Encoder is a converter for all video, audio, and
image formats using FFmpeg.  It supports professional codecs and standards
including H.264, H.265, ProRes, DNxHR, VP9, AV1, and many more, with a
graphical interface for batch processing and advanced encoding options.")
    (home-page "https://www.shutterencoder.com/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 28. hytale-launcher-bin — Hytale game launcher
;;; -------------------------------------------------------------------
(define-public hytale-launcher-bin
  (package
    (name "hytale-launcher-bin")
    (version "2026.04.08")
    (source (origin
              (method url-fetch)
              (uri "https://launcher-api.hytale.com/api/launcher/download/linux")
              (file-name (string-append "hytale-launcher-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hytale/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/hytale")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/share/hytale/hytale-launcher-~a.AppImage \"$@\"~%"
                                 out #$version)))
                     (chmod (string-append bin "/hytale") #o755)))))))
    (synopsis "native Linux launcher for the Hytale game")
    (description "Hytale Launcher is the official launcher for Hytale, a block
game developed by Hypixel Studios.  The launcher handles game updates,
authentication, and launching the game client on Linux.")
    (home-page "https://hytale.com/")
    (license license:hytale)))

;;; -------------------------------------------------------------------
;;; 29. openttd-jgrpp — OpenTTD with JGR's patch pack
;;; -------------------------------------------------------------------
(define-public openttd-jgrpp
  (package
    (name "openttd-jgrpp")
    (version "0.71.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JGRennison/OpenTTD-patches")
                    (commit (string-append "jgrpp-" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_INSTALL_BINDIR=bin")))
    (native-inputs (list pkg-config))
    (inputs (list fluidsynth fontconfig lzo sdl2 zlib))
    (synopsis "engine for Transport Tycoon Deluxe with JGR's patch pack")
    (description "OpenTTD-JGRPP is a fork of OpenTTD (open-source Transport
Tycoon Deluxe) that includes JGR's patch pack.  It adds features like
scheduled dispatch, template-based vehicle replacement, infrastructure sharing,
town cargo generation factor, zoning overlay, and many other gameplay and
quality-of-life improvements.")
    (home-page "https://github.com/JGRennison/OpenTTD-patches")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 30. latin-words — Latin-English dictionary and text analyzer
;;; -------------------------------------------------------------------
(define-public latin-words
  (package
    (name "latin-words")
    (version "1.97FC")
    (source (origin
              (method url-fetch)
              (uri "https://archives.nd.edu/whitaker/wordsall.zip")
              (file-name (string-append "latin-words-" version ".zip"))
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
                   (invoke "gnatmake" "-O2" "words")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (share (string-append out "/share/latin-words")))
                     (mkdir-p bin)
                     (mkdir-p share)
                     (install-file "words" bin)
                     (for-each (lambda (f) (install-file f share))
                               (find-files "." "\\.(txt|lat)$"))))))))
    (native-inputs (list gnat unzip))
    (synopsis "Latin-English-Latin intelligent dictionary and text analyzer")
    (description "WORDS is William Whitaker's Latin-English-Latin dictionary
program.  It can parse Latin words, identify their forms (declension, conjugation,
etc.), and provide English translations.  It handles over 39,000 Latin entries
and can analyze Latin text passages, making it useful for students, scholars,
and anyone working with Latin texts.")
    (home-page "https://archives.nd.edu/whitaker/words.htm")
    (license license:latin-words)))
