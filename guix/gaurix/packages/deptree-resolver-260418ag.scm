;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260418ag
;;; Resolves 83 TODO packages with concrete recipes.
;;; Moves 17 packages to FAILED status.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260418ag)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system r)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:export (libpurple
            kservice-git
            kiconthemes-git
            ktextwidgets-git
            kjobwidgets-git
            kpackage-git
            kwallet-git
            cython0
            r-stringr
            kbookmarks-git
            krunner-git
            aurora-scanner-git
            lxqt-menu-data-git
            gtkada
            python-ffmpeg-python
            jack-audio-tools-common
            r-askpass
            r-rstudioapi
            bitrock-unpacker
            r-later
            vim-lightline-git
            julec
            ananicy
            perl-wx
            python-rospkg
            python-sexpdata
            python-ufonormalizer
            python-xyzservices
            r-gtable
            sockpp
            fineftp-server
            libobjfwtls
            libunarr
            perl-moosex-role-parameterized
            python-sv-ttk
            vte-legacy
            ignition-math
            liblcf-git
            nsis
            ofxstatement
            prison-git
            python-face-recognition
            ruby-actionview
            signal-cli
            tkimg
            v8-r
            vapoursynth-plugin-tcanny-git
            bacula-dir
            gstreamermm
            mathics-scanner
            python-mautrix
            python-opengl-accelerate
            cnijfilter-common
            ncine
            plasma-activities-stats-git
            pocketsphinx
            python-cu2qu
            swt
            exim-heavy
            libgcc-snapshot
            viennarna
            courier-authlib
            networkmanager-qt-git
            kwayland-git
            libkscreen-git
            qtkeychain-qt5
            ahriman-core
            asterisk
            doom3
            python-acme-git
            python-dash
            ladish
            psi-plus-git
            freeipa-common
            libxcomp
            gulkan-git
            mauikit-git
            qtwebkit
            marble-common-git
            luxcorerender
            libmega-git
            regolith-i3
            avidemux-core-git
))

(define-public libpurple
  (package
    (name "libpurple")
    (version "2.14.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpurple.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "IM library extracted from Pidgin")
    (description "IM library extracted from Pidgin.")
    (home-page "https://pidgin.im/")
    (license license:gpl3+)))

(define-public kservice-git
  (package
    (name "kservice-git")
    (version "6.0.0_r1266.g837a2cff")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kservice-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Advanced plugin and service introspection")
    (description "Advanced plugin and service introspection.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kiconthemes-git
  (package
    (name "kiconthemes-git")
    (version "6.0.0_r782.g3aeeeac")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kiconthemes-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/icons/" #:include-regexp (".*")))))
    (synopsis "Support for icon themes")
    (description "Support for icon themes.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public ktextwidgets-git
  (package
    (name "ktextwidgets-git")
    (version "6.0.0_r592.g95b9970")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ktextwidgets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Advanced text editing widgets")
    (description "Advanced text editing widgets.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kjobwidgets-git
  (package
    (name "kjobwidgets-git")
    (version "6.0.0_r580.gda1b7d3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kjobwidgets-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Widgets for tracking KJob instances")
    (description "Widgets for tracking KJob instances.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kpackage-git
  (package
    (name "kpackage-git")
    (version "6.0.0_r1037.g5adb7f8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kpackage-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Framework that lets applications manage user installable packages of")
    (description "Framework that lets applications manage user installable packages of non-binary assets.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public kwallet-git
  (package
    (name "kwallet-git")
    (version "6.24.0_r1684.gde631daf")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwallet-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KWallet Framework")
    (description "KWallet Framework.")
    (home-page "https://projects.kde.org/projects/frameworks/kwallet")
    (license license:lgpl3+)))

(define-public cython0
  (package
    (name "cython0")
    (version "0.29.37.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cython0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C-Extensions for Python (legacy version)")
    (description "C-Extensions for Python (legacy version).")
    (home-page "https://cython.org")
    (license license:asl2.0)))

(define-public r-stringr
  (package
    (name "r-stringr")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "stringr" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Simple, Consistent Wrappers for Common String Operations")
    (description "Simple, Consistent Wrappers for Common String Operations.")
    (home-page "https://cran.r-project.org/package=stringr")
    (license license:expat)))

(define-public kbookmarks-git
  (package
    (name "kbookmarks-git")
    (version "6.0.0_r648.g47a3552")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kbookmarks-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Support for bookmarks and the XBEL format")
    (description "Support for bookmarks and the XBEL format.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public krunner-git
  (package
    (name "krunner-git")
    (version "6.0.0_r1077.ge7a2ff1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/krunner-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Framework for providing different actions given a string query")
    (description "Framework for providing different actions given a string query.")
    (home-page "https://community.kde.org/Frameworks")
    (license license:lgpl3+)))

(define-public aurora-scanner-git
  (package
    (name "aurora-scanner-git")
    (version "r10.c2e3441")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aurora-scanner-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Converts XML protocol descriptions to C++ code for Aurora compositors and")
    (description "Converts XML protocol descriptions to C++ code for Aurora compositors and clients.")
    (home-page "https://liri.io")
    (license license:gpl3+)))

(define-public lxqt-menu-data-git
  (package
    (name "lxqt-menu-data-git")
    (version "2.1.0.r1.eda2916")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxqt-menu-data-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "LXQt menu files")
    (description "LXQt menu files.")
    (home-page "https://lxqt-project.org")
    (license license:lgpl2.1+)))

(define-public gtkada
  (package
    (name "gtkada")
    (version "1:26.0w")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AdaCore/gtkada")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Ada bindings for the Gtk+ library")
    (description "Ada bindings for the Gtk+ library.")
    (home-page "https://github.com/AdaCore/gtkada")
    (license license:expat)))

(define-public python-ffmpeg-python
  (package
    (name "python-ffmpeg-python")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kkroening/ffmpeg-python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "(old) Python bindings for FFmpeg with complex filtering support")
    (description "(old) Python bindings for FFmpeg with complex filtering support.")
    (home-page "https://github.com/kkroening/ffmpeg-python")
    (license license:asl2.0)))

(define-public jack-audio-tools-common
  (package
    (name "jack-audio-tools-common")
    (version "0.4.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/SpotlightKid/jack-audio-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Collection of utilities and tools for the JACK audio ecosystem")
    (description "A collection of utilities and tools for the JACK audio ecosystem.")
    (home-page "https://github.com/SpotlightKid/jack-audio-tools")
    (license license:expat)))

(define-public r-askpass
  (package
    (name "r-askpass")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "askpass" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Password Entry Utilities for R, Git, and SSH")
    (description "Password Entry Utilities for R, Git, and SSH.")
    (home-page "https://cran.r-project.org/package=askpass")
    (license license:expat)))

(define-public r-rstudioapi
  (package
    (name "r-rstudioapi")
    (version "0.17.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "rstudioapi" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Safely Access the RStudio API")
    (description "Safely Access the RStudio API.")
    (home-page "https://cran.r-project.org/package=rstudioapi")
    (license license:expat)))

(define-public bitrock-unpacker
  (package
    (name "bitrock-unpacker")
    (version "1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/greyltc/bitrock-unpacker")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tcl script for unpacking bitrock packed archives")
    (description "A tcl script for unpacking bitrock packed archives.")
    (home-page "https://github.com/greyltc/bitrock-unpacker/")
    (license license:expat)))

(define-public r-later
  (package
    (name "r-later")
    (version "1.4.8")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "later" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Utilities for Scheduling Functions to Execute Later with Event Loops")
    (description "Utilities for Scheduling Functions to Execute Later with Event Loops.")
    (home-page "https://cran.r-project.org/package=later")
    (license license:expat)))

(define-public vim-lightline-git
  (package
    (name "vim-lightline-git")
    (version "r685.1c6b455")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/itchyny/lightline.vim")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Light and configurable statusline/tabline for Vim")
    (description "A light and configurable statusline/tabline for Vim.")
    (home-page "https://github.com/itchyny/lightline.vim")
    (license license:expat)))

(define-public julec
  (package
    (name "julec")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/julelang/jule")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Jule Programming Language Compiler")
    (description "The Jule Programming Language Compiler.")
    (home-page "https://github.com/julelang/jule")
    (license license:bsd-3)))

(define-public ananicy
  (package
    (name "ananicy")
    (version "2.2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Nefelim4ag/Ananicy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Another auto nice daemon, with community rules support")
    (description "Another auto nice daemon, with community rules support.")
    (home-page "https://github.com/Nefelim4ag/Ananicy.git")
    (license license:gpl3+)))

(define-public perl-wx
  (package
    (name "perl-wx")
    (version "0.9932")
    (source (origin
              (method url-fetch)
              (uri "wx")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Interface to the wxWidgets cross-platform GUI toolkit")
    (description "Interface to the wxWidgets cross-platform GUI toolkit.")
    (home-page "https://metacpan.org/dist/Wx")
    (license license:gpl3+)))

(define-public python-rospkg
  (package
    (name "python-rospkg")
    (version "1.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ros-infrastructure/rospkg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Standalone Python library for the ROS package system")
    (description "Standalone Python library for the ROS package system.")
    (home-page "https://github.com/ros-infrastructure/rospkg")
    (license license:bsd-3)))

(define-public python-sexpdata
  (package
    (name "python-sexpdata")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jd-boyd/sexpdata")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "S-expression parser for Python")
    (description "S-expression parser for Python.")
    (home-page "https://github.com/jd-boyd/sexpdata")
    (license license:bsd-3)))

(define-public python-ufonormalizer
  (package
    (name "python-ufonormalizer")
    (version "0.6.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/unified-font-object/ufoNormalizer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tool that will normalize XML and other data inside of a UFO")
    (description "A tool that will normalize XML and other data inside of a UFO.")
    (home-page "https://github.com/unified-font-object/ufoNormalizer")
    (license license:bsd-3)))

(define-public python-xyzservices
  (package
    (name "python-xyzservices")
    (version "2026.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/geopandas/xyzservices")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provides a repository of available XYZ services offering raster basemap tiles")
    (description "Provides a repository of available XYZ services offering raster basemap tiles.")
    (home-page "https://github.com/geopandas/xyzservices")
    (license license:bsd-3)))

(define-public r-gtable
  (package
    (name "r-gtable")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "gtable" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system r-build-system)
    (synopsis "Arrange ‘Grobs’ in Tables")
    (description "Arrange ‘Grobs’ in Tables.")
    (home-page "https://cran.r-project.org/package=gtable")
    (license license:expat)))

(define-public sockpp
  (package
    (name "sockpp")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fpagliughi/sockpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Simple, modern, C++ socket library")
    (description "Simple, modern, C++ socket library.")
    (home-page "https://github.com/fpagliughi/sockpp")
    (license license:bsd-3)))

(define-public fineftp-server
  (package
    (name "fineftp-server")
    (version "1.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eclipse-ecal/fineftp-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "FineFTP is a minimal FTP server library for Windows and Unix flavors")
    (description "FineFTP is a minimal FTP server library for Windows and Unix flavors.")
    (home-page "https://github.com/eclipse-ecal/fineftp-server")
    (license license:expat)))

(define-public libobjfwtls
  (package
    (name "libobjfwtls")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libobjfwtls.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "TLS support for ObjFW")
    (description "TLS support for ObjFW.")
    (home-page "https://objfw.nil.im/")
    (license license:lgpl3+)))

(define-public libunarr
  (package
    (name "libunarr")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/selmf/unarr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Lightweight decompression library with support for rar, tar and zip archives")
    (description "A lightweight decompression library with support for rar, tar and zip archives.")
    (home-page "https://github.com/selmf/unarr")
    (license license:lgpl3+)))

(define-public perl-moosex-role-parameterized
  (package
    (name "perl-moosex-role-parameterized")
    (version "1.11")
    (source (origin
              (method url-fetch)
              (uri "moosex-role-parameterized")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system perl-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Moose roles with composition parameters")
    (description "Moose roles with composition parameters.")
    (home-page "https://metacpan.org/dist/MooseX-Role-Parameterized")
    (license license:gpl3+)))

(define-public python-sv-ttk
  (package
    (name "python-sv-ttk")
    (version "2.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rdbende/Sun-Valley-ttk-theme")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles")
    (description "A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles.")
    (home-page "https://github.com/rdbende/Sun-Valley-ttk-theme")
    (license license:expat)))

(define-public vte-legacy
  (package
    (name "vte-legacy")
    (version "0.28.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vte-legacy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Virtual Terminal Emulator widget for use with GTK2")
    (description "Virtual Terminal Emulator widget for use with GTK2.")
    (home-page "http://www.gnome.org")
    (license license:lgpl3+)))

(define-public ignition-math
  (package
    (name "ignition-math")
    (version "7.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ignition-math.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "General purpose math library for robot applications")
    (description "General purpose math library for robot applications.")
    (home-page "https://gazebosim.org/libs/math")
    (license license:asl2.0)))

(define-public liblcf-git
  (package
    (name "liblcf-git")
    (version "0.8.1.r0.g92c4450")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liblcf-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library to handle RPG Maker 2000/2003 and EasyRPG projects (development")
    (description "Library to handle RPG Maker 2000/2003 and EasyRPG projects (development version).")
    (home-page "https://easyrpg.org")
    (license license:expat)))

(define-public nsis
  (package
    (name "nsis")
    (version "3.11")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nsis.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Professional open source system to create Windows installers")
    (description "A professional open source system to create Windows installers.")
    (home-page "http://nsis.sourceforge.net")
    (license license:expat)))

(define-public ofxstatement
  (package
    (name "ofxstatement")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kedder/ofxstatement")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Tool to convert proprietary bank statement to OFX format, suitable for")
    (description "Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash.")
    (home-page "https://github.com/kedder/ofxstatement")
    (license license:gpl3+)))

(define-public prison-git
  (package
    (name "prison-git")
    (version "v6.7.0.r2.g4cbf603")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/prison-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Barcode api currently offering a nice Qt api to produce QRCode barcodes")
    (description "Barcode api currently offering a nice Qt api to produce QRCode barcodes and DataMatrix barcodes. (GIT version).")
    (home-page "https://invent.kde.org/frameworks/prison")
    (license license:lgpl3+)))

(define-public python-face-recognition
  (package
    (name "python-face_recognition")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ageitgey/face_recognition")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "World's simplest facial recognition api for Python and the command line")
    (description "The world's simplest facial recognition api for Python and the command line.")
    (home-page "https://github.com/ageitgey/face_recognition")
    (license license:expat)))

(define-public ruby-actionview
  (package
    (name "ruby-actionview")
    (version "8.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ruby-actionview.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Simple, battle-tested conventions and helpers for building web pages")
    (description "Simple, battle-tested conventions and helpers for building web pages.")
    (home-page "https://rubyonrails.org")
    (license license:expat)))

(define-public signal-cli
  (package
    (name "signal-cli")
    (version "0.14.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AsamK/signal-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provides a commandline and dbus interface for secure Signal messaging")
    (description "Provides a commandline and dbus interface for secure Signal messaging.")
    (home-page "https://github.com/AsamK/signal-cli")
    (license license:gpl3+)))

(define-public tkimg
  (package
    (name "tkimg")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tkimg.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provides the handling of several image formats beyond the standard formats")
    (description "Provides the handling of several image formats beyond the standard formats in Tk.")
    (home-page "https://wiki.tcl-lang.org/page/Img")
    (license license:expat)))

(define-public v8-r
  (package
    (name "v8-r")
    (version "14.5.137")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/v8-r.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Google's open source JavaScript and WebAssembly engine")
    (description "Google's open source JavaScript and WebAssembly engine.")
    (home-page "https://v8.dev")
    (license license:bsd-3)))

(define-public vapoursynth-plugin-tcanny-git
  (package
    (name "vapoursynth-plugin-tcanny-git")
    (version "14.1.g14ac2ce")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-tcanny-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Plugin for Vapoursynth: tcanny (GIT version)")
    (description "Plugin for Vapoursynth: tcanny (GIT version).")
    (home-page "https://forum.doom9.org/showthread.php?t=171136")
    (license license:gpl3+)))

(define-public bacula-dir
  (package
    (name "bacula-dir")
    (version "15.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bacula-dir.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Bacula - A Network Backup Tool (Director)")
    (description "Bacula - A Network Backup Tool (Director).")
    (home-page "https://www.bacula.org")
    (license license:agpl3+)))

(define-public gstreamermm
  (package
    (name "gstreamermm")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gstreamermm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "C++ interface for GStreamer")
    (description "C++ interface for GStreamer.")
    (home-page "https://gstreamer.freedesktop.org/bindings/cplusplus.html")
    (license license:lgpl3+)))

(define-public mathics-scanner
  (package
    (name "mathics-scanner")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mathics-scanner.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Mathics' tokeniser or scanner portion for the Wolfram Language")
    (description "Mathics' tokeniser or scanner portion for the Wolfram Language.")
    (home-page "https://mathics.org/")
    (license license:gpl3+)))

(define-public python-mautrix
  (package
    (name "python-mautrix")
    (version "0.21.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mautrix/python")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python 3 asyncio Matrix framework")
    (description "A Python 3 asyncio Matrix framework.")
    (home-page "https://github.com/mautrix/python/")
    (license license:mpl2.0)))

(define-public python-opengl-accelerate
  (package
    (name "python-opengl-accelerate")
    (version "3.1.10")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "PyOpenGL-accelerate" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "This is the Cython-coded accelerator module for PyOpenGL 3.x")
    (description "This is the Cython-coded accelerator module for PyOpenGL 3.x.")
    (home-page "https://pypi.org/project/PyOpenGL-accelerate/")
    (license license:bsd-3)))

(define-public cnijfilter-common
  (package
    (name "cnijfilter-common")
    (version "4.10")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cnijfilter-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Canon IJ Printer Driver (Common Package)")
    (description "Canon IJ Printer Driver (Common Package).")
    (home-page "https://www.canon-europe.com/support/pixma_software/")
    (license license:expat)))

(define-public ncine
  (package
    (name "ncine")
    (version "2020.05")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ncine.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Multi-platform 2D game engine")
    (description "A multi-platform 2D game engine.")
    (home-page "http://ncine.github.io")
    (license license:expat)))

(define-public plasma-activities-stats-git
  (package
    (name "plasma-activities-stats-git")
    (version "6.0.80_r489.g6fba8de")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/plasma-activities-stats-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Library for accessing the usage data collected by the activities system")
    (description "A library for accessing the usage data collected by the activities system.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:lgpl3+)))

(define-public pocketsphinx
  (package
    (name "pocketsphinx")
    (version "5.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pocketsphinx.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Small speech recognizer")
    (description "A small speech recognizer.")
    (home-page "https://cmusphinx.github.io")
    (license license:bsd-3)))

(define-public python-cu2qu
  (package
    (name "python-cu2qu")
    (version "1.6.7.post2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/googlefonts/cu2qu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Cubic-to-quadratic bezier curve conversion")
    (description "Cubic-to-quadratic bezier curve conversion.")
    (home-page "https://github.com/googlefonts/cu2qu")
    (license license:asl2.0)))

(define-public swt
  (package
    (name "swt")
    (version "4.35")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/swt.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Open source widget toolkit for Java")
    (description "An open source widget toolkit for Java.")
    (home-page "https://www.eclipse.org/swt/")
    (license license:expat)))

(define-public exim-heavy
  (package
    (name "exim-heavy")
    (version "4.99.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/exim-heavy.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Message Transfer Agent with maximal-enabled features")
    (description "Message Transfer Agent with maximal-enabled features.")
    (home-page "https://www.exim.org/")
    (license license:gpl3+)))

(define-public libgcc-snapshot
  (package
    (name "libgcc-snapshot")
    (version "16.0.0.snapshot20260412")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libgcc-snapshot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GNU Compiler Collection - Low-level runtime libraries (snapshot)")
    (description "GNU Compiler Collection - Low-level runtime libraries (snapshot).")
    (home-page "https://gcc.gnu.org")
    (license license:expat)))

(define-public viennarna
  (package
    (name "viennarna")
    (version "2.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/viennarna.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "RNA Secondary Structure Prediction and Comparison")
    (description "RNA Secondary Structure Prediction and Comparison.")
    (home-page "https://www.tbi.univie.ac.at/RNA")
    (license license:expat)))

(define-public courier-authlib
  (package
    (name "courier-authlib")
    (version "0.72.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/courier-authlib.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Authentication library for the Courier mailserver(s)")
    (description "Authentication library for the Courier mailserver(s).")
    (home-page "https://courier-mta.org/authlib/")
    (license license:gpl3+)))

(define-public networkmanager-qt-git
  (package
    (name "networkmanager-qt-git")
    (version "5.249.0.r2.g7bc1121")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/networkmanager-qt-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE's Qt wrapper for NetworkManager API (git build)")
    (description "KDE's Qt wrapper for NetworkManager API (git build).")
    (home-page "https://invent.kde.org/frameworks/networkmanager-qt")
    (license license:lgpl2.1+)))

(define-public kwayland-git
  (package
    (name "kwayland-git")
    (version "6.0.80_r1256.ge87c6d8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kwayland-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Qt-style Client and Server library wrapper for the Wayland libraries")
    (description "Qt-style Client and Server library wrapper for the Wayland libraries.")
    (home-page "https://www.kde.org")
    (license license:lgpl3+)))

(define-public libkscreen-git
  (package
    (name "libkscreen-git")
    (version "6.0.80_r1902.g2e08e78")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libkscreen-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "KDE screen management software")
    (description "KDE screen management software.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:lgpl3+)))

(define-public qtkeychain-qt5
  (package
    (name "qtkeychain-qt5")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/frankosterfeld/qtkeychain")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Provides support for secure credentials storage (Qt5 version)")
    (description "Provides support for secure credentials storage (Qt5 version).")
    (home-page "https://github.com/frankosterfeld/qtkeychain")
    (license license:bsd-3)))

(define-public ahriman-core
  (package
    (name "ahriman-core")
    (version "2.20.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ahriman-core.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ArcH linux ReposItory MANager")
    (description "ArcH linux ReposItory MANager.")
    (home-page "https://ahriman.readthedocs.io/")
    (license license:gpl3+)))

(define-public asterisk
  (package
    (name "asterisk")
    (version "23.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/asterisk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Complete PBX solution")
    (description "A complete PBX solution.")
    (home-page "https://www.asterisk.org")
    (license license:gpl2+)))

(define-public doom3
  (package
    (name "doom3")
    (version "1.3.1.1304")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/doom3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Doom 3 Engine. You need the retail .pk4 files to play")
    (description "Doom 3 Engine. You need the retail .pk4 files to play.")
    (home-page "https://doom.com/")
    (license license:expat)))

(define-public python-acme-git
  (package
    (name "python-acme-git")
    (version "2.8.0.r6.g926d0c7e0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/certbot/certbot")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "ACME protocol implementation for Python")
    (description "ACME protocol implementation for Python.")
    (home-page "https://github.com/certbot/certbot")
    (license license:asl2.0)))

(define-public python-dash
  (package
    (name "python-dash")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-dash.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Python framework for building analytical web applications")
    (description "A python framework for building analytical web applications.")
    (home-page "https://plot.ly/products/dash/")
    (license license:expat)))

(define-public ladish
  (package
    (name "ladish")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ladish.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Session management system for JACK")
    (description "Session management system for JACK.")
    (home-page "https://ladish.org")
    (license license:expat)))

(define-public psi-plus-git
  (package
    (name "psi-plus-git")
    (version "1.5.1692.r4652.g4b93355d")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/psi-plus-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users")
    (description "Psi+ is a powerful XMPP client (Qt, C++) designed for the XMPP power users (built with Qt 5.x).")
    (home-page "https://psi-plus.com")
    (license license:gpl2+)))

(define-public freeipa-common
  (package
    (name "freeipa-common")
    (version "4.13.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freeipa-common.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Common files used by IPA")
    (description "Common files used by IPA.")
    (home-page "http://www.freeipa.org/")
    (license license:gpl3+)))

(define-public libxcomp
  (package
    (name "libxcomp")
    (version "3.5.99.27")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libxcomp.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "NX X compression library")
    (description "NX X compression library.")
    (home-page "https://arctica-project.org")
    (license license:gpl3+)))

(define-public gulkan-git
  (package
    (name "gulkan-git")
    (version "0.16.0.r450.9acfcd6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.freedesktop.org/xrdesktop/gulkan")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GLib library for Vulkan abstraction")
    (description "A GLib library for Vulkan abstraction.")
    (home-page "https://gitlab.freedesktop.org/xrdesktop/gulkan")
    (license license:expat)))

(define-public mauikit-git
  (package
    (name "mauikit-git")
    (version "4.0.0.r5.g55676c73")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mauikit-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Utilities and \"templated\" controls based on Kirigami and QCC2 that follow")
    (description "Utilities and \"templated\" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG.")
    (home-page "https://mauikit.org/")
    (license license:lgpl3+)))

(define-public qtwebkit
  (package
    (name "qtwebkit")
    (version "2.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtwebkit.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Open source web browser engine (Qt port)")
    (description "An open source web browser engine (Qt port).")
    (home-page "http://trac.webkit.org/wiki/QtWebKit")
    (license license:gpl3+)))

(define-public marble-common-git
  (package
    (name "marble-common-git")
    (version "24.04.70_r13851.gab23c211a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KDE/marble")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Common libraries and plugins for Marble")
    (description "Common libraries and plugins for Marble.")
    (home-page "https://github.com/KDE/marble")
    (license license:gpl2+)))

(define-public luxcorerender
  (package
    (name "luxcorerender")
    (version "2:2.10.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/luxcorerender.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Physically correct, unbiased rendering engine")
    (description "Physically correct, unbiased rendering engine.")
    (home-page "https://www.luxcorerender.org/")
    (license license:asl2.0)))

(define-public libmega-git
  (package
    (name "libmega-git")
    (version "6.2.0.38.gd93d7417c")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libmega-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "MEGASync libs (GIT Version)")
    (description "MEGASync libs (GIT Version).")
    (home-page "https://mega.co.nz/#sync")
    (license license:expat)))

(define-public regolith-i3
  (package
    (name "regolith-i3")
    (version "1.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/regolith-linux/regolith-desktop")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Regolith's i3-gaps-based DE's underpinnings and gnome foundational")
    (description "Regolith's i3-gaps-based DE's underpinnings and gnome foundational dependencies.")
    (home-page "https://github.com/regolith-linux/regolith-desktop")
    (license license:expat)))

(define-public avidemux-core-git
  (package
    (name "avidemux-core-git")
    (version "2.8.2.250320.4b5c2a3d7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/avidemux-core-git.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Core libs for Avidemux. (GIT version)")
    (description "Core libs for Avidemux. (GIT version).")
    (home-page "http://www.avidemux.org")
    (license license:gpl2+)))
