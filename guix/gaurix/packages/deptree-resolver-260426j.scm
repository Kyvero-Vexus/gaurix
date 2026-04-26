;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426j
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (10):
;;;   1. go2tv (Go: DLNA/UPnP media casting tool)
;;;   2. principia (C++: physics-based sandbox building game)
;;;   3. glsmac (C++: open-source reimplementation of Alpha Centauri)
;;;   4. lincity-ng (C++: city simulation game)
;;;   5. cockatrice-server (C++: tabletop card game server)
;;;   6. shijima-qt (C++: desktop mascot/shimeji simulation)
;;;   7. ausweiskopie (Python: German ID document copy tool)
;;;   8. openxcom (C++: X-COM reimplementation)
;;;   9. whatip (Python: GNOME IP information tool)
;;;  10. panda3ds (C++: Nintendo 3DS emulator)
;;;
;;; Remaining BLOCKED: 90 packages (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260426j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages javascript)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (go2tv
            principia
            glsmac
            lincity-ng
            cockatrice-server
            shijima-qt
            ausweiskopie
            openxcom
            whatip
            panda3ds))

;;; ---- 1. go2tv ----
;;; Cast videos to UPnP/DLNA media renderers.
;;; Upstream: https://github.com/alexballas/go2tv
;;; Build: go-build-system
;;; License: MIT
;;; Resolves AUR go2tv.

(define-public go2tv
  (package
    (name "go2tv")
    (version "2.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/alexballas/go2tv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/alexballas/go2tv"
           #:install-source? #f))
    (synopsis "cast media to UPnP/DLNA devices")
    (description "Go2tv casts local media files to UPnP/DLNA media renderers
and Smart TVs.  It supports video, audio, and image files and provides
both a GUI and a command-line interface.")
    (home-page "https://github.com/alexballas/go2tv")
    (license license:expat)))

;;; ---- 2. principia ----
;;; Physics-based sandbox building game.
;;; Upstream: https://github.com/Bithack/principia
;;; Build: cmake-build-system
;;; License: BSD-3
;;; Resolves AUR principia-git.

(define-public principia
  (let ((commit "f71e177c")
        (revision "478"))
    (package
      (name "principia")
      (version (git-version "0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Bithack/principia")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config))
      (inputs (list curl
                    freetype
                    glew
                    gtk+
                    libjpeg-turbo
                    libpng
                    sdl2))
      (synopsis "physics-based sandbox building game")
      (description "Principia is a physics-based sandbox building game where
players construct machines, vehicles, and contraptions using a variety
of mechanical and electronic components.  Objects interact according to
realistic physics simulations.")
      (home-page "https://github.com/Bithack/principia")
      (license license:bsd-3))))

;;; ---- 3. glsmac ----
;;; Open-source reimplementation of Sid Meier's Alpha Centauri.
;;; Upstream: https://github.com/afwbkbc/glsmac
;;; Build: cmake-build-system
;;; License: AGPL-3.0-only
;;; Resolves AUR glsmac-git.

(define-public glsmac
  (let ((commit "f239b59b")
        (revision "3"))
    (package
      (name "glsmac")
      (version (git-version "0.3" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/afwbkbc/glsmac")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config))
      (inputs (list freetype
                    glew
                    libglvnd
                    sdl2
                    sdl2-image
                    yaml-cpp))
      (synopsis "open-source reimplementation of Alpha Centauri")
      (description "GLSMAC is an unofficial open-source OpenGL/SDL2
reimplementation of Sid Meier's Alpha Centauri (and Alien Crossfire).
It aims to recreate the gameplay experience using modern rendering.")
      (home-page "https://github.com/afwbkbc/glsmac")
      (license license:agpl3))))

;;; ---- 4. lincity-ng ----
;;; City simulation game.
;;; Upstream: https://github.com/lincity-ng/lincity-ng
;;; Build: cmake-build-system
;;; License: GPL-2.0-or-later
;;; Resolves AUR lincity-ng-git.

(define-public lincity-ng
  (let ((commit "352a8419")
        (revision "62"))
    (package
      (name "lincity-ng")
      (version (git-version "2.14.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/lincity-ng/lincity-ng")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f))
      (native-inputs (list pkg-config))
      (inputs (list fmt
                    libxml++
                    sdl2
                    sdl2-image
                    sdl2-mixer
                    sdl2-ttf
                    zlib))
      (synopsis "city simulation game")
      (description "LinCity-NG is an open-source city simulation game.
Players build and manage a city, balancing economy, technology, and
sustainability to grow from a small settlement into a thriving
metropolis.  It is the successor to LinCity with modernized graphics.")
      (home-page "https://github.com/lincity-ng/lincity-ng")
      (license license:gpl2+))))

;;; ---- 5. cockatrice-server ----
;;; Tabletop card game network server.
;;; Upstream: https://cockatrice.github.io/
;;; Build: cmake-build-system
;;; License: GPL-2.0
;;; Resolves AUR cockatrice-server-git.

(define-public cockatrice-server
  (let ((commit "b7042165")
        (revision "21"))
    (package
      (name "cockatrice-server")
      (version (git-version "2.9.1-beta.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/Cockatrice/Cockatrice")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DWITH_SERVER=ON"
                     "-DWITH_CLIENT=OFF")))
      (native-inputs (list pkg-config qttools))
      (inputs (list protobuf
                    qtbase
                    qtwebsockets
                    zlib))
      (synopsis "server for Cockatrice tabletop card game platform")
      (description "Cockatrice is an open-source multiplatform program for
playing tabletop card games over a network.  This package provides the
dedicated server component (Servatrice) that hosts game rooms and
manages player connections.")
      (home-page "https://cockatrice.github.io/")
      (license license:gpl2))))

;;; ---- 6. shijima-qt ----
;;; Desktop mascot / shimeji simulation.
;;; Upstream: https://github.com/pixelomer/Shijima-Qt
;;; Build: cmake-build-system
;;; License: GPL-3.0-only
;;; Resolves AUR shijima-qt.

(define-public shijima-qt
  (package
    (name "shijima-qt")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pixelomer/Shijima-Qt")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config imagemagick))
    (inputs (list libarchive
                  qtbase
                  qtmultimedia
                  xcb-util-cursor))
    (synopsis "cross-platform desktop mascot simulation")
    (description "Shijima-Qt is a cross-platform shimeji (desktop mascot)
simulation application.  It renders animated characters that interact
with desktop windows, walking along edges and performing various
animations.  Built with Qt6 for broad platform support.")
    (home-page "https://github.com/pixelomer/Shijima-Qt")
    (license license:gpl3)))

;;; ---- 7. ausweiskopie ----
;;; Privacy-friendly German ID document copy tool.
;;; Upstream: https://github.com/Varbin/ausweiskopie
;;; Build: pyproject-build-system
;;; License: MPL-2.0
;;; Resolves AUR ausweiskopie.

(define-public ausweiskopie
  (package
    (name "ausweiskopie")
    (version "0.1.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Varbin/ausweiskopie")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools-scm))
    (inputs (list python-dbus
                  python-pillow
                  python-pygobject
                  tk))
    (propagated-inputs (list gobject-introspection))
    (synopsis "create privacy-friendly copies of German ID documents")
    (description "Ausweiskopie creates privacy-friendly and legally compliant
copies of German identity documents (Personalausweis, Reisepass).  It
automatically masks sensitive fields that are not needed for the
specific use case, helping protect personal data.")
    (home-page "https://github.com/Varbin/ausweiskopie")
    (license license:mpl2.0)))

;;; ---- 8. openxcom ----
;;; Open-source reimplementation of X-COM: UFO Defense.
;;; Upstream: https://openxcom.org/
;;; Build: cmake-build-system
;;; License: GPL-3.0-or-later
;;; Resolves AUR openxcom-git.

(define-public openxcom
  (let ((commit "31c72c887")
        (revision "3144"))
    (package
      (name "openxcom")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/OpenXcom/OpenXcom")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments
       (list #:tests? #f
             #:configure-flags
             #~(list "-DCMAKE_BUILD_TYPE=Release")))
      (native-inputs (list pkg-config))
      (inputs (list sdl12-compat
                    sdl-gfx
                    sdl-image
                    sdl-mixer
                    yaml-cpp))
      (synopsis "open-source reimplementation of X-COM: UFO Defense")
      (description "OpenXcom is an open-source reimplementation of the
original X-COM: UFO Defense (UFO: Enemy Unknown) game engine.  It
requires the original game data files to play.  OpenXcom provides
improved usability, modding support, and bug fixes while preserving
the classic gameplay experience.")
      (home-page "https://openxcom.org/")
      (license license:gpl3+))))

;;; ---- 9. whatip ----
;;; GNOME application showing IP information.
;;; Upstream: https://gitlab.gnome.org/gabmus/whatip
;;; Build: meson-build-system
;;; License: GPL-3.0
;;; Resolves AUR whatip-git.

(define-public whatip
  (let ((commit "678ba7e")
        (revision "0"))
    (package
      (name "whatip")
      (version (git-version "1.2" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.gnome.org/gabmus/whatip")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments
       (list #:tests? #f
             #:glib-or-gtk? #t
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'install 'wrap-program
                   (lambda* (#:key outputs #:allow-other-keys)
                     (let ((out (assoc-ref outputs "out")))
                       (wrap-program (string-append out "/bin/whatip")
                         `("GUIX_PYTHONPATH" ":" prefix
                           (,(getenv "GUIX_PYTHONPATH")))
                         `("GI_TYPELIB_PATH" ":" prefix
                           (,(getenv "GI_TYPELIB_PATH"))))))))))
      (native-inputs (list blueprint-compiler pkg-config))
      (inputs (list gtk
                    iproute2
                    libadwaita
                    python
                    python-netaddr
                    python-pygobject
                    python-requests))
      (propagated-inputs (list gobject-introspection))
      (synopsis "information about your IP address")
      (description "What IP is a GNOME application that displays information
about your current IP address, including public IP, local network
details, and geographic location data.  Built with GTK4 and
libadwaita for a modern GNOME desktop experience.")
      (home-page "https://gitlab.gnome.org/gabmus/whatip")
      (license license:gpl3))))

;;; ---- 10. panda3ds ----
;;; Nintendo 3DS emulator.
;;; Upstream: https://github.com/wheremyfoodat/Panda3DS
;;; Build: cmake-build-system
;;; License: GPL-3.0-only
;;; Resolves AUR panda3ds.

(define-public panda3ds
  (package
    (name "panda3ds")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/wheremyfoodat/Panda3DS")
                    (commit (string-append "v" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DENABLE_QT_GUI=ON"
                   "-DENABLE_VULKAN=ON")))
    (native-inputs (list pkg-config))
    (inputs (list boost
                  libglvnd
                  qtbase
                  sdl2))
    (synopsis "Nintendo 3DS emulator")
    (description "Panda3DS is a high-level emulation (HLE) Nintendo 3DS
emulator.  It supports both a Qt6 GUI and an SDL2 frontend, with
OpenGL and Vulkan rendering backends.  It aims for game compatibility
and performance on modern hardware.")
    (home-page "https://github.com/wheremyfoodat/Panda3DS")
    (license license:gpl3)))
