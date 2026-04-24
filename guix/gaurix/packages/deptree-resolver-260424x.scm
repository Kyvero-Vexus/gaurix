;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424x
;;; Resolves 104 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5): modrinth-app-appimage, wpa-cute, chomp, folio,
;;;   kwin-effects-sliding-notifications
;;; Already in Guix: 1 (toxcore-c as c-toxcore)
;;; AUR repo deleted: 2 (systemd-ukify-git, smuxi-server)
;;; Remaining BLOCKED: 92 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424x)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system qt)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:export (modrinth-app-appimage
            wpa-cute
            chomp
            folio
            kwin-effects-sliding-notifications))


;;; ---- 1. modrinth-app-appimage ----
;;; AUR #18228 -- Open source Minecraft mod launcher.
;;; Source: Pre-built AppImage from modrinth.com CDN.
;;; License: GPL-3.0-only
;;; Hash verified via guix download.

(define-public modrinth-app-appimage
  (package
    (name "modrinth-app-appimage")
    (version "0.13.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launcher-files.modrinth.com/versions/"
                    version "/linux/Modrinth%20App_" version
                    "_amd64.AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32
                "1v7sms8wdnvfwh351z602wl10cfifbdskvhkkjra3nl0wi61lr0y"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("modrinth-app.AppImage" "bin/modrinth-app"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((source (assoc-ref inputs "source")))
                (copy-file source "modrinth-app.AppImage")
                (chmod "modrinth-app.AppImage" #o755))))
          (add-after 'install 'make-executable
            (lambda* (#:key outputs #:allow-other-keys)
              (chmod (string-append (assoc-ref outputs "out")
                                    "/bin/modrinth-app")
                     #o755))))))
    (home-page "https://modrinth.com/app")
    (synopsis "Open source Minecraft mod launcher")
    (description "Modrinth App is an open source mod launcher for Minecraft.
It provides a clean interface for discovering, installing, and managing
mods, modpacks, shaders, and resource packs from the Modrinth platform.")
    (license license:gpl3)))


;;; ---- 2. wpa-cute ----
;;; AUR #18152 -- Qt6 GUI for wpa_supplicant.
;;; Source: GitHub release tarball.
;;; License: BSD-3-Clause
;;; Hash verified via guix download.

(define-public wpa-cute
  (package
    (name "wpa-cute")
    (version "0.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/loh-tar/wpa-cute/archive/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1s48rzq3v3ya2hd52cc6647c6svnykk30w85im3zhv5pka4x2pj7"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (chdir "src")
                (invoke "qmake"
                        (string-append "PREFIX=" out)))))
          (add-after 'install 'install-extras
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (share (string-append out "/share")))
                (chdir "..")
                (install-file "wpa-cute.desktop"
                              (string-append share "/applications"))
                (install-file "icons/wpa-cute.svg"
                              (string-append share "/icons/hicolor/scalable/apps"))))))))
    (inputs (list qtbase qtsvg))
    (home-page "https://github.com/loh-tar/wpa-cute")
    (synopsis "Qt6 graphical frontend for wpa_supplicant")
    (description "WPA Cute is a Qt-based graphical user interface for
wpa_supplicant.  It provides a clean, modern interface for managing
wireless network connections including WPA, WPA2, and WPA3 networks.")
    (license license:bsd-3)))


;;; ---- 3. chomp ----
;;; AUR #18136 -- Computational Homology Project.
;;; Source: GitHub release tarball.
;;; License: MIT
;;; Hash verified via guix download.

(define-public chomp
  (package
    (name "chomp")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shaunharker/CHomP/archive/v"
                    version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1b2gfgm57cx2j30p0w4pl2qyq0fabh5mhjxbc963bjd4zri880a4"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs (list boost))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/shaunharker/CHomP")
    (synopsis "Computational homology project for topological data analysis")
    (description "CHomP (Computational Homology Project) is a software suite
for computing homology of cubical complexes and simplicial complexes.  It is
used in topological data analysis and computational topology research.")
    (license license:expat)))


;;; ---- 4. folio ----
;;; AUR #18166 -- GNOME notes application.
;;; Source: GitHub release tarball.
;;; License: GPL-3.0-only
;;; Hash verified via guix download.

(define-public folio
  (package
    (name "folio")
    (version "25.02")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/toolstack/Folio/archive/"
                    version "/Folio-" version ".tar.gz"))
              (sha256
               (base32
                "1zy4gyd3jn14cqf0wka57ddyw3fjpayzlh807ypc6qk5g387yhqn"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t))
    (native-inputs
     (list blueprint-compiler
           `(,glib "bin")
           pkg-config
           vala))
    (inputs
     (list glib
           gtk
           gtksourceview
           libadwaita
           libgee
           pango))
    (home-page "https://github.com/toolstack/Folio")
    (synopsis "Notes application for GNOME")
    (description "Folio is a notes application for GNOME that supports
Markdown formatting.  It provides a clean, modern interface for taking
and organizing notes with rich text editing capabilities.")
    (license license:gpl3)))


;;; ---- 5. kwin-effects-sliding-notifications ----
;;; AUR #18199 -- KWin effect for sliding notifications.
;;; Source: GitHub git repository.
;;; License: MIT
;;; Hash verified via guix hash.

(define-public kwin-effects-sliding-notifications
  (package
    (name "kwin-effects-sliding-notifications")
    (version "0.0.1-1.1fd1a3f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zzag/kwin-effects-sliding-notifications")
                    (commit "1fd1a3fdf9cb0b6d43c89926f760d4e84d8f31d5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1pjvn6x95a045d5j1fs7q9wxb0a3lqbr7b5fhzsr1a1yb3brsc8j"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f))
    (native-inputs
     (list extra-cmake-modules pkg-config))
    (inputs
     (list kwin))
    (home-page "https://github.com/zzag/kwin-effects-sliding-notifications")
    (synopsis "KWin effect that slides notification windows")
    (description "A KWin desktop effect that makes notification windows
slide in and out from the edge of the screen instead of simply appearing
and disappearing.  It provides smooth animation for desktop notifications.")
    (license license:expat)))
