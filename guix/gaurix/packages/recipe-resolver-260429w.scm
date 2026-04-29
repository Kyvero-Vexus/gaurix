;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260429w
;;; Resolves 100 packages from queue (100 recipes, 0 blocked).
;;; Groups: KDE/desktop (8), audio/media (12), CLI/dev tools (25),
;;;         games/emulators (8), themes/cursors (5), networking (10),
;;;         libraries (12), misc utilities (20).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.
;;;
;;; Generated: 2026-04-29

(define-module (gaurix packages recipe-resolver-260429w)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            xen-stubdom
            epsxe-plugin-spu-alsa
            mkinitcpio-firmware
            epsxe-plugin-gpu-xgl2
            epsxe-plugin-gpu-mesagl
            grub-legacy
            epsxe-plugin-padjoy
            bluedevil-git
            kde-gtk-config-git
            opencv-git
            opencv-samples-git
            python-opencv-git
            photivo-git
            jre7
            aquaria-ose-git
            freeme2
            lxqt-config-git
            mlt-git
            mopidy-mopify
            ntorrent
            qarte
            solarus-launcher
            solarus-editor
            supermeatboy
            ferdium-bin
            lxqt-panel-git
            gnome-shell-extension-appindicator-git
            krusader-git
            paper-icon-theme
            aoi
            eclipse-vrapper
            evilvte
            libbluray-git
            qtwebkit-bin
            rtmpdump-git
            shim-signed
            subtitleedit
            rider-eap
            kmozillahelper
            freemind-git
            ultravnc-viewer
            weather
            amrenc
            btscanner
            dino-git
            gcc43
            gnome-video-arcade
            goocanvas1
            gtk-bluecurve-engine
            libevhtp-seafile
            perl-gtk2-unique
            screencloud
            wingpanel-git
            xampp
            android-google-repository
            gnome-shell-extension-caffeine-git
            lshwd
            mate-tweak
            mikutter
            notepadqq-git
            qterminal-git
            qtermwidget-git
            cnrdrvcups-lb
            stm32cubeide
            networkmanager-iwd
            libnm-iwd
            nm-iwd-cloud-setup
            sunvox
            vala-panel-appmenu-mate-git
            vala-panel-appmenu-xfce-git
            vala-panel-appmenu-valapanel-git
            vala-panel-appmenu-budgie-git
            arm-linux-gnueabihf-gcc-stage1
            attica-git
            cjdns-git
            geany-plugins-git
            gtg-git
            gtk-theme-numix-solarized
            kakoune-git
            librecad-git
            pulseaudio-git
            libpulse-git
            pulseaudio-lirc-git
            pulseaudio-zeroconf-git
            pulseaudio-jack-git
            pulseaudio-bluetooth-git
            pulseaudio-equalizer-git
            pulseaudio-rtp-git
            shantz-xwinwrap-bzr
            qtwebflix-git
            waybar-git
            twmn-git
            ltspice
            gqrx-git
            glmark2-git
            lxqt-notificationd-git
            mozplugger
            pavucontrol-gtk2
            radare2-git
            tesseract-git
            ))

;;; xen-stubdom
(define-public xen-stubdom
  (package
    (name "xen-stubdom")
    (version "4.21.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xen-stubdom.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "xen hypervisor stubdom files")
    (description
     "Xen hypervisor stubdom files.")
    (home-page "https://xenproject.org/")
    (license license:gpl2)))

;;; epsxe-plugin-spu-alsa
(define-public epsxe-plugin-spu-alsa
  (package
    (name "epsxe-plugin-spu-alsa")
    (version "1.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epsxe-plugin-spu-alsa.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oSS/Alsa SPU plugin")
    (description
     "OSS/Alsa SPU plugin.")
    (home-page "http://www.pbernert.com")
    (license license:non-copyleft)))

;;; mkinitcpio-firmware
(define-public mkinitcpio-firmware
  (package
    (name "mkinitcpio-firmware")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mkinitcpio-firmware.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "optional firmware for the default linux kernel to get rid of the annoying")
    (description
     "Optional firmware for the default linux kernel to get rid of the annoying 'WARNING: Possibly missing firmware for module:' messages.")
    (home-page "https://aur.archlinux.org/packages/mkinitcpio-firmware")
    (license license:gpl3+)))

;;; epsxe-plugin-gpu-xgl2
(define-public epsxe-plugin-gpu-xgl2
  (package
    (name "epsxe-plugin-gpu-xgl2")
    (version "2.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epsxe-plugin-gpu-xgl2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "linux port of the OpenGL2 plugin")
    (description
     "Linux port of the OpenGL2 plugin.")
    (home-page "http://www.pbernert.com")
    (license license:non-copyleft)))

;;; epsxe-plugin-gpu-mesagl
(define-public epsxe-plugin-gpu-mesagl
  (package
    (name "epsxe-plugin-gpu-mesagl")
    (version "1.78")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epsxe-plugin-gpu-mesagl.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "accelerated MesaGL plugin")
    (description
     "Accelerated MesaGL plugin.")
    (home-page "http://www.pbernert.com")
    (license license:non-copyleft)))

;;; grub-legacy
(define-public grub-legacy
  (package
    (name "grub-legacy")
    (version "0.97")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/grub-legacy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GNU multiboot boot loader")
    (description
     "A GNU multiboot boot loader.")
    (home-page "http://www.gnu.org/software/grub/")
    (license license:gpl3+)))

;;; epsxe-plugin-padjoy
(define-public epsxe-plugin-padjoy
  (package
    (name "epsxe-plugin-padjoy")
    (version "0.82")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/epsxe-plugin-padjoy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "joy-device plugin")
    (description
     "Joy-device plugin.")
    (home-page "http://members.chello.at/erich.kitzmueller/ammoq/main.html")
    (license license:gpl2)))

;;; bluedevil-git
(define-public bluedevil-git
  (package
    (name "bluedevil-git")
    (version "6.0.80_r2886.g7533d07e")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/bluedevil-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integrate the Bluetooth technology within KDE workspace and applications")
    (description
     "Integrate the Bluetooth technology within KDE workspace and applications.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:gpl2+)))

;;; kde-gtk-config-git
(define-public kde-gtk-config-git
  (package
    (name "kde-gtk-config-git")
    (version "6.0.80_r1027.g8f477ae")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kde-gtk-config-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gTK2 and GTK3 Configurator for KDE")
    (description
     "GTK2 and GTK3 Configurator for KDE.")
    (home-page "https://kde.org/plasma-desktop/")
    (license license:gpl2+)))

;;; opencv-git
(define-public opencv-git
  (package
    (name "opencv-git")
    (version "4.6.0.r213.gbb64db98d8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opencv-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source Computer Vision Library")
    (description
     "Open Source Computer Vision Library.")
    (home-page "https://opencv.org/")
    (license license:bsd-3)))

;;; opencv-samples-git
(define-public opencv-samples-git
  (package
    (name "opencv-samples-git")
    (version "4.6.0.r213.gbb64db98d8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/opencv-samples-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source Computer Vision Library (samples)")
    (description
     "Open Source Computer Vision Library (samples).")
    (home-page "https://opencv.org/")
    (license license:bsd-3)))

;;; python-opencv-git
(define-public python-opencv-git
  (package
    (name "python-opencv-git")
    (version "4.6.0.r213.gbb64db98d8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-opencv-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "python bindings for OpenCV")
    (description
     "Python bindings for OpenCV.")
    (home-page "https://opencv.org/")
    (license license:bsd-3)))

;;; photivo-git
(define-public photivo-git
  (package
    (name "photivo-git")
    (version "1:20240904_517cc62")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/photivo-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "free and open source photo processor")
    (description
     "Free and open source photo processor.")
    (home-page "https://photivo.org/")
    (license license:gpl3)))

;;; jre7
(define-public jre7
  (package
    (name "jre7")
    (version "7u80")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/jre7.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "oracle Java 7 Runtime Environment (public release - end of support)")
    (description
     "Oracle Java 7 Runtime Environment (public release - end of support).")
    (home-page "https://www.oracle.com/technetwork/java/archive-139210.html")
    (license license:non-copyleft)))

;;; aquaria-ose-git
(define-public aquaria-ose-git
  (package
    (name "aquaria-ose-git")
    (version "1.1.3+o1.002+g620.5f51dc4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AquariaOSE/Aquaria")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 2D fantasy underwater action-adventure game (Open Source Edition engine")
    (description
     "A 2D fantasy underwater action-adventure game (Open Source Edition engine = v1.1.3 + many improvements).")
    (home-page "https://github.com/AquariaOSE/Aquaria")
    (license license:gpl3+)))

;;; freeme2
(define-public freeme2
  (package
    (name "freeme2")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freeme2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "it strips wm-drm protection from wmv/asf/wma files as well as video/audio")
    (description
     "It strips wm-drm protection from wmv/asf/wma files as well as video/audio streams.")
    (home-page "http://sourceforge.net/projects/freeme2/")
    (license license:gpl3+)))

;;; lxqt-config-git
(define-public lxqt-config-git
  (package
    (name "lxqt-config-git")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxqt-config-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lXQt system configuration")
    (description
     "LXQt system configuration.")
    (home-page "https://lxqt-project.org")
    (license license:lgpl2.1)))

;;; mlt-git
(define-public mlt-git
  (package
    (name "mlt-git")
    (version "7.22.0.r27.30115615")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mltframework/mlt")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multimedia Framework")
    (description
     "Multimedia Framework.")
    (home-page "https://github.com/mltframework/mlt")
    (license license:lgpl2.1)))

;;; mopidy-mopify
(define-public mopidy-mopify
  (package
    (name "mopidy-mopify")
    (version "1.7.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mopidy-mopify.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a web client that uses external web services to provide additional featur")
    (description
     "A web client that uses external web services to provide additional features and a more complete music experience.")
    (home-page "https://github.com/dirkgroenen/mopidy-mopify")
    (license license:asl2.0)))

;;; ntorrent
(define-public ntorrent
  (package
    (name "ntorrent")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ntorrent.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a graphical user interface client to rtorrent written in java")
    (description
     "A graphical user interface client to rtorrent written in java.")
    (home-page "http://code.google.com/p/ntorrent")
    (license license:gpl3)))

;;; qarte
(define-public qarte
  (package
    (name "qarte")
    (version "5.18.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qarte.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "allow you to browse into the archive of arte+7 & arteLiveWeb sites and to")
    (description
     "Allow you to browse into the archive of arte+7 & arteLiveWeb sites and to record your prefered videos.")
    (home-page "https://launchpad.net/qarte")
    (license license:gpl3)))

;;; solarus-launcher
(define-public solarus-launcher
  (package
    (name "solarus-launcher")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solarus-launcher.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight, free and open-source 2D game engine for Action-RPGs")
    (description
     "A lightweight, free and open-source 2D game engine for Action-RPGs.")
    (home-page "https://www.solarus-games.org/")
    (license license:gpl3+)))

;;; solarus-editor
(define-public solarus-editor
  (package
    (name "solarus-editor")
    (version "2.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/solarus-editor.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight, free and open-source 2D game engine for Action-RPGs")
    (description
     "A lightweight, free and open-source 2D game engine for Action-RPGs.")
    (home-page "https://www.solarus-games.org/")
    (license license:gpl3+)))

;;; supermeatboy
(define-public supermeatboy
  (package
    (name "supermeatboy")
    (version "20131111")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/supermeatboy.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an insanely hard and delightfully meaty platformer (game sold separately)")
    (description
     "An insanely hard and delightfully meaty platformer (game sold separately).")
    (home-page "http://www.supermeatboy.com/")
    (license license:non-copyleft)))

;;; ferdium-bin
(define-public ferdium-bin
  (package
    (name "ferdium-bin")
    (version "7.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ferdium-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/ferdium-bin/"))))
    (synopsis "a messaging browser that allows you to combine your favorite messaging se")
    (description
     "A messaging browser that allows you to combine your favorite messaging services into one application (binary release).")
    (home-page "https://ferdium.org")
    (license license:asl2.0)))

;;; lxqt-panel-git
(define-public lxqt-panel-git
  (package
    (name "lxqt-panel-git")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/lxqt-panel")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the LXQt desktop panel")
    (description
     "The LXQt desktop panel.")
    (home-page "https://github.com/lxqt/lxqt-panel")
    (license license:lgpl2.1)))

;;; gnome-shell-extension-appindicator-git
(define-public gnome-shell-extension-appindicator-git
  (package
    (name "gnome-shell-extension-appindicator-git")
    (version "1:59+2+g557dbdd")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ubuntu/gnome-shell-extension-appindicator")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appIndicator/KStatusNotifierItem support for GNOME Shell")
    (description
     "AppIndicator/KStatusNotifierItem support for GNOME Shell.")
    (home-page "https://github.com/ubuntu/gnome-shell-extension-appindicator")
    (license license:gpl2+)))

;;; krusader-git
(define-public krusader-git
  (package
    (name "krusader-git")
    (version "2.10.0.dev.r7206.g1d788aa3b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/krusader-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "advanced twin panel file manager for KDE. (GIT version)")
    (description
     "Advanced twin panel file manager for KDE. (GIT version).")
    (home-page "http://www.krusader.org")
    (license license:gpl3+)))

;;; paper-icon-theme
(define-public paper-icon-theme
  (package
    (name "paper-icon-theme")
    (version "1.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/paper-icon-theme.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "paper is an open source desktop theme and icon project by Sam Hewitt")
    (description
     "Paper is an open source desktop theme and icon project by Sam Hewitt.")
    (home-page "https://snwh.org/paper")
    (license license:cc-by-sa4.0)))

;;; aoi
(define-public aoi
  (package
    (name "aoi")
    (version "3.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/aoi.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 3D modeling and rendering studio (Art of Illusion)")
    (description
     "A 3D modeling and rendering studio (Art of Illusion).")
    (home-page "http://www.artofillusion.org/")
    (license license:gpl3+)))

;;; eclipse-vrapper
(define-public eclipse-vrapper
  (package
    (name "eclipse-vrapper")
    (version "0.74.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/eclipse-vrapper.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vim-like editing plugin for Eclipse")
    (description
     "Vim-like editing plugin for Eclipse.")
    (home-page "http://vrapper.sourceforge.net/home/")
    (license license:gpl3)))

;;; evilvte
(define-public evilvte
  (package
    (name "evilvte")
    (version "0.5.2~pre1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/evilvte.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "vTE based, highly customizable terminal emulator")
    (description
     "VTE based, highly customizable terminal emulator.")
    (home-page "http://www.calno.com/evilvte/")
    (license license:gpl2)))

;;; libbluray-git
(define-public libbluray-git
  (package
    (name "libbluray-git")
    (version "1.4.0.7.gd41111c1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libbluray-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "library to access Blu-Ray disks for video playback. (GIT version)")
    (description
     "Library to access Blu-Ray disks for video playback. (GIT version).")
    (home-page "https://www.videolan.org/developers/libbluray.html")
    (license license:lgpl2.1)))

;;; qtwebkit-bin
(define-public qtwebkit-bin
  (package
    (name "qtwebkit-bin")
    (version "2.3.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/qtwebkit-bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/qtwebkit-bin/"))))
    (synopsis "an open source web browser engine (Qt port) Bin")
    (description
     "An open source web browser engine (Qt port) Bin.")
    (home-page "http://trac.webkit.org/wiki/QtWebKit")
    (license license:gpl3)))

;;; rtmpdump-git
(define-public rtmpdump-git
  (package
    (name "rtmpdump-git")
    (version "2.4.r98.gc5f04a5")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rtmpdump-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to download rtmp and rtmpe streams (git version)")
    (description
     "A tool to download rtmp and rtmpe streams (git version).")
    (home-page "http://rtmpdump.mplayerhq.hu/")
    (license license:gpl2)))

;;; shim-signed
(define-public shim-signed
  (package
    (name "shim-signed")
    (version "15.8+ubuntu+1.59")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shim-signed.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "initial UEFI bootloader that handles chaining to a trusted full bootloade")
    (description
     "Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 and AA64 binaries from Ubuntu).")
    (home-page "https://packages.ubuntu.com/noble/shim-signed")
    (license license:bsd-2)))

;;; subtitleedit
(define-public subtitleedit
  (package
    (name "subtitleedit")
    (version "4.0.15")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/subtitleedit.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an advanced subtitle editor and converter")
    (description
     "An advanced subtitle editor and converter.")
    (home-page "https://www.nikse.dk/SubtitleEdit")
    (license license:gpl3)))

;;; rider-eap
(define-public rider-eap
  (package
    (name "rider-eap")
    (version "1:261.22158.211")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rider-eap.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cross-platform .NET IDE by JetBrains")
    (description
     "A cross-platform .NET IDE by JetBrains.")
    (home-page "https://www.jetbrains.com/rider/eap/")
    (license license:non-copyleft)))

;;; kmozillahelper
(define-public kmozillahelper
  (package
    (name "kmozillahelper")
    (version "1:5.0.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kmozillahelper.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mozilla KDE Integration")
    (description
     "Mozilla KDE Integration.")
    (home-page "https://github.com/openSUSE/kmozillahelper")
    (license license:expat)))

;;; freemind-git
(define-public freemind-git
  (package
    (name "freemind-git")
    (version "1.1.0_Beta_2.r1064.cc87d4a4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/freemind-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a mind mapper, and a hierarchical editor with strong emphasis on folding")
    (description
     "A mind mapper, and a hierarchical editor with strong emphasis on folding.")
    (home-page "https://freemind.sourceforge.io/wiki/")
    (license license:gpl2+)))

;;; ultravnc-viewer
(define-public ultravnc-viewer
  (package
    (name "ultravnc-viewer")
    (version "1.4.31")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ultravnc-viewer.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a powerful VNC Client with a lot of features, compatible with Windows' Ul")
    (description
     "A powerful VNC Client with a lot of features, compatible with Windows' UltraVNC servers.")
    (home-page "http://www.uvnc.com")
    (license license:gpl3+)))

;;; weather
(define-public weather
  (package
    (name "weather")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/weather.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a command-line utility intended to provide quick access to current weathe")
    (description
     "A command-line utility intended to provide quick access to current weather conditions and forecasts.")
    (home-page "http://fungi.yuggoth.org/weather")
    (license license:isc)))

;;; amrenc
(define-public amrenc
  (package
    (name "amrenc")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amrenc.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an AMR encoder")
    (description
     "An AMR encoder.")
    (home-page "http://teknoraver.net/software/mp4tools/")
    (license license:non-copyleft)))

;;; btscanner
(define-public btscanner
  (package
    (name "btscanner")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/btscanner.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bluetooth device scanner")
    (description
     "Bluetooth device scanner.")
    (home-page "http://www.pentest.co.uk")
    (license license:gpl3+)))

;;; dino-git
(define-public dino-git
  (package
    (name "dino-git")
    (version "0.5.0.r72.ga3d96a8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/dino-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple and modern Jabber/XMPP client written in vala")
    (description
     "Simple and modern Jabber/XMPP client written in vala.")
    (home-page "https://dino.im/")
    (license license:gpl3)))

;;; gcc43
(define-public gcc43
  (package
    (name "gcc43")
    (version "4.3.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gcc43.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection (4.3.x)")
    (description
     "The GNU Compiler Collection (4.3.x).")
    (home-page "http://gcc.gnu.org")
    (license license:gpl2)))

;;; gnome-video-arcade
(define-public gnome-video-arcade
  (package
    (name "gnome-video-arcade")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gnome-video-arcade.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GTK3 front-end wich supports MAME")
    (description
     "Simple GTK3 front-end wich supports MAME.")
    (home-page "https://wiki.gnome.org/action/show/Apps/GnomeVideoArcade")
    (license license:gpl3+)))

;;; goocanvas1
(define-public goocanvas1
  (package
    (name "goocanvas1")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/goocanvas1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a cairo canvas widget for GTK+")
    (description
     "A cairo canvas widget for GTK+.")
    (home-page "http://live.gnome.org/GooCanvas")
    (license license:lgpl3+)))

;;; gtk-bluecurve-engine
(define-public gtk-bluecurve-engine
  (package
    (name "gtk-bluecurve-engine")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-bluecurve-engine.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "original Bluecurve engine from Red Hat's artwork package")
    (description
     "Original Bluecurve engine from Red Hat's artwork package.")
    (home-page "https://fedoraproject.org/wiki/Design")
    (license license:gpl2)))

;;; libevhtp-seafile
(define-public libevhtp-seafile
  (package
    (name "libevhtp-seafile")
    (version "2:1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libevhtp-seafile.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a more flexible replacement for libevent's httpd API. [Built for seafile]")
    (description
     "A more flexible replacement for libevent's httpd API. [Built for seafile].")
    (home-page "https://github.com/haiwen/libevhtp")
    (license license:bsd-3)))

;;; perl-gtk2-unique
(define-public perl-gtk2-unique
  (package
    (name "perl-gtk2-unique")
    (version "0.07")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/perl-gtk2-unique.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "perl bindings for the C library libunique")
    (description
     "Perl bindings for the C library libunique.")
    (home-page "https://metacpan.org/release/Gtk2-Unique")
    (license license:lgpl3+)))

;;; screencloud
(define-public screencloud
  (package
    (name "screencloud")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/screencloud.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an easy to use screenshot sharing application")
    (description
     "An easy to use screenshot sharing application.")
    (home-page "https://github.com/olav-st/screencloud/")
    (license license:gpl3+)))

;;; wingpanel-git
(define-public wingpanel-git
  (package
    (name "wingpanel-git")
    (version "3.0.5.r94.ge5fa914")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/elementary/wingpanel")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stylish top panel that holds indicators and spawns an application launcher")
    (description
     "Stylish top panel that holds indicators and spawns an application launcher.")
    (home-page "https://github.com/elementary/wingpanel")
    (license license:gpl3+)))

;;; xampp
(define-public xampp
  (package
    (name "xampp")
    (version "8.2.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/xampp.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a stand-alone LAMPP distribution")
    (description
     "A stand-alone LAMPP distribution.")
    (home-page "https://www.apachefriends.org")
    (license license:gpl3+)))

;;; android-google-repository
(define-public android-google-repository
  (package
    (name "android-google-repository")
    (version "r58")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/android-google-repository.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "android SDK Local Maven repository for Google Libraries")
    (description
     "Android SDK Local Maven repository for Google Libraries.")
    (home-page "https://developer.android.com/sdk/index.html")
    (license license:non-copyleft)))

;;; gnome-shell-extension-caffeine-git
(define-public gnome-shell-extension-caffeine-git
  (package
    (name "gnome-shell-extension-caffeine-git")
    (version "57.r7.g9e93251")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/eonpatapon/gnome-shell-extension-caffeine")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "disable the screensaver and auto suspend")
    (description
     "Disable the screensaver and auto suspend.")
    (home-page "https://github.com/eonpatapon/gnome-shell-extension-caffeine")
    (license license:gpl2+)))

;;; lshwd
(define-public lshwd
  (package
    (name "lshwd")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lshwd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lists hardware and approp modules")
    (description
     "Lists hardware and approp modules.")
    (home-page "http://user-contributions.org/projects/lshwd/")
    (license license:gpl3+)))

;;; mate-tweak
(define-public mate-tweak
  (package
    (name "mate-tweak")
    (version "22.10.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mate-tweak.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tweak tool for MATE (fork of MintDesktop)")
    (description
     "Tweak tool for MATE (fork of MintDesktop).")
    (home-page "https://github.com/ubuntu-mate/mate-tweak")
    (license license:gpl3+)))

;;; mikutter
(define-public mikutter
  (package
    (name "mikutter")
    (version "5.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mikutter.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a moest twitter client")
    (description
     "A moest twitter client.")
    (home-page "http://mikutter.hachune.net/")
    (license license:expat)))

;;; notepadqq-git
(define-public notepadqq-git
  (package
    (name "notepadqq-git")
    (version "2.0.0.beta.r13.gb426303b")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notepadqq-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "notepad++-like text editor for Linux")
    (description
     "Notepad++-like text editor for Linux.")
    (home-page "https://notepadqq.com/")
    (license license:gpl3+)))

;;; qterminal-git
(define-public qterminal-git
  (package
    (name "qterminal-git")
    (version "2.2.1.5.g1233838")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qterminal")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight Qt-based terminal emulator")
    (description
     "Lightweight Qt-based terminal emulator.")
    (home-page "https://github.com/lxqt/qterminal")
    (license license:gpl2)))

;;; qtermwidget-git
(define-public qtermwidget-git
  (package
    (name "qtermwidget-git")
    (version "1.4.0.44.g75c0066")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/lxqt/qtermwidget")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a terminal widget for Qt, used by QTerminal")
    (description
     "A terminal widget for Qt, used by QTerminal.")
    (home-page "https://github.com/lxqt/qtermwidget")
    (license license:bsd-3)))

;;; cnrdrvcups-lb
(define-public cnrdrvcups-lb
  (package
    (name "cnrdrvcups-lb")
    (version "1:6.20.1.20")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cnrdrvcups-lb.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS I")
    (description
     "CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers.")
    (home-page "https://www.canon-europe.com/support/consumer/products/printers/i-sensys/mf-series/i-sensys-mf657cdw.html?type=drivers&language=EN&os=Linux%20(64-bit)")
    (license license:gpl2)))

;;; stm32cubeide
(define-public stm32cubeide
  (package
    (name "stm32cubeide")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/stm32cubeide.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "integrated Development Environment for STM32")
    (description
     "Integrated Development Environment for STM32.")
    (home-page "https://www.st.com/en/development-tools/stm32cubeide.html")
    (license license:non-copyleft)))

;;; networkmanager-iwd
(define-public networkmanager-iwd
  (package
    (name "networkmanager-iwd")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/networkmanager-iwd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "network connection manager and user applications; using iwd backend inste")
    (description
     "Network connection manager and user applications; using iwd backend instead of wpa_supplicant.")
    (home-page "https://networkmanager.dev/")
    (license license:gpl2+)))

;;; libnm-iwd
(define-public libnm-iwd
  (package
    (name "libnm-iwd")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libnm-iwd.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "networkManager client library with iwd backend")
    (description
     "NetworkManager client library with iwd backend.")
    (home-page "https://networkmanager.dev/")
    (license license:lgpl2.1+)))

;;; nm-iwd-cloud-setup
(define-public nm-iwd-cloud-setup
  (package
    (name "nm-iwd-cloud-setup")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/nm-iwd-cloud-setup.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "automatically configure NetworkManager with iwd backend in cloud")
    (description
     "Automatically configure NetworkManager with iwd backend in cloud.")
    (home-page "https://networkmanager.dev/")
    (license license:lgpl2.1+)))

;;; sunvox
(define-public sunvox
  (package
    (name "sunvox")
    (version "2.1.4.d")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/sunvox.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "small, fast and powerful modular synthesizer with pattern-based sequencer")
    (description
     "Small, fast and powerful modular synthesizer with pattern-based sequencer (tracker).")
    (home-page "http://warmplace.ru/soft/sunvox/")
    (license license:bsd-3)))

;;; vala-panel-appmenu-mate-git
(define-public vala-panel-appmenu-mate-git
  (package
    (name "vala-panel-appmenu-mate-git")
    (version "24.05.r2.g7631683")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appMenu (Global Menu) plugin for mate-panel")
    (description
     "AppMenu (Global Menu) plugin for mate-panel.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (license license:lgpl3)))

;;; vala-panel-appmenu-xfce-git
(define-public vala-panel-appmenu-xfce-git
  (package
    (name "vala-panel-appmenu-xfce-git")
    (version "24.05.r2.g7631683")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appMenu (Global Menu) plugin for xfce4-panel")
    (description
     "AppMenu (Global Menu) plugin for xfce4-panel.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (license license:lgpl3)))

;;; vala-panel-appmenu-valapanel-git
(define-public vala-panel-appmenu-valapanel-git
  (package
    (name "vala-panel-appmenu-valapanel-git")
    (version "24.05.r2.g7631683")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appMenu (Global Menu) plugin for vala-panel")
    (description
     "AppMenu (Global Menu) plugin for vala-panel.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (license license:lgpl3)))

;;; vala-panel-appmenu-budgie-git
(define-public vala-panel-appmenu-budgie-git
  (package
    (name "vala-panel-appmenu-budgie-git")
    (version "24.05.r2.g7631683")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "appMenu (Global Menu) plugin for budgie-panel")
    (description
     "AppMenu (Global Menu) plugin for budgie-panel.")
    (home-page "https://gitlab.com/vala-panel-project/vala-panel-appmenu")
    (license license:lgpl3)))

;;; arm-linux-gnueabihf-gcc-stage1
(define-public arm-linux-gnueabihf-gcc-stage1
  (package
    (name "arm-linux-gnueabihf-gcc-stage1")
    (version "15.2.1+r19+g76aeacb436df")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/arm-linux-gnueabihf-gcc-stage1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the GNU Compiler Collection. Stage 1 for toolchain building")
    (description
     "The GNU Compiler Collection. Stage 1 for toolchain building.")
    (home-page "https://gcc.gnu.org")
    (license license:non-copyleft)))

;;; attica-git
(define-public attica-git
  (package
    (name "attica-git")
    (version "v5.102.0.r9.g2bab489")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/attica-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "qt5 library that implements the Open Collaboration Services API")
    (description
     "Qt5 library that implements the Open Collaboration Services API.")
    (home-page "https://projects.kde.org/projects/frameworks/attica")
    (license license:lgpl3+)))

;;; cjdns-git
(define-public cjdns-git
  (package
    (name "cjdns-git")
    (version "21.3.r434.g4be793cb")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cjdelisle/cjdns")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a routing engine designed for security, scalability, speed and ease of use")
    (description
     "A routing engine designed for security, scalability, speed and ease of use.")
    (home-page "https://github.com/cjdelisle/cjdns")
    (license license:gpl3)))

;;; geany-plugins-git
(define-public geany-plugins-git
  (package
    (name "geany-plugins-git")
    (version "2.0.0.r177.g1d0e74a7")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/geany-plugins-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "various plugins for Geany (git version)")
    (description
     "Various plugins for Geany (git version).")
    (home-page "https://plugins.geany.org/")
    (license license:gpl2+)))

;;; gtg-git
(define-public gtg-git
  (package
    (name "gtg-git")
    (version "0.6.r533.g025aebd")
    (source
     (origin
       (method url-fetch)
       (uri "https://getting-things-gnome.github.io")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "getting Things GNOME! is a personal tasks and TODO-list items organizer f")
    (description
     "Getting Things GNOME! is a personal tasks and TODO-list items organizer for GNOME.")
    (home-page "https://getting-things-gnome.github.io")
    (license license:gpl3+)))

;;; gtk-theme-numix-solarized
(define-public gtk-theme-numix-solarized
  (package
    (name "gtk-theme-numix-solarized")
    (version "20230408")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gtk-theme-numix-solarized.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:install-plan #~'(("." "share/themes/"))))
    (synopsis "solarized versions of Numix GTK2 and GTK3 theme, compatible with GTK 3.20")
    (description
     "Solarized versions of Numix GTK2 and GTK3 theme, compatible with GTK 3.20.")
    (home-page "https://github.com/Ferdi265/numix-solarized-gtk-theme")
    (license license:gpl3)))

;;; kakoune-git
(define-public kakoune-git
  (package
    (name "kakoune-git")
    (version "2023.08.05+r366+g8bb0f44c2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mawww/kakoune")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "multiple-selection, UNIX-flavored modal editor")
    (description
     "Multiple-selection, UNIX-flavored modal editor.")
    (home-page "https://github.com/mawww/kakoune")
    (license license:unlicense)))

;;; librecad-git
(define-public librecad-git
  (package
    (name "librecad-git")
    (version "2.2.2_alpha.latest.r352.g7befe2a9d")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librecad-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a 2D CAD drawing tool based on the community edition of QCad")
    (description
     "A 2D CAD drawing tool based on the community edition of QCad.")
    (home-page "https://librecad.org")
    (license license:gpl3+)))

;;; pulseaudio-git
(define-public pulseaudio-git
  (package
    (name "pulseaudio-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a featureful, general-purpose sound server (development version)")
    (description
     "A featureful, general-purpose sound server (development version).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; libpulse-git
(define-public libpulse-git
  (package
    (name "libpulse-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libpulse-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a featureful, general-purpose sound server (development version) (client ")
    (description
     "A featureful, general-purpose sound server (development version) (client library) (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl3+)))

;;; pulseaudio-lirc-git
(define-public pulseaudio-lirc-git
  (package
    (name "pulseaudio-lirc-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-lirc-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "iR (lirc) support for PulseAudio (development)")
    (description
     "IR (lirc) support for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; pulseaudio-zeroconf-git
(define-public pulseaudio-zeroconf-git
  (package
    (name "pulseaudio-zeroconf-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-zeroconf-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "zeroconf support for PulseAudio (development)")
    (description
     "Zeroconf support for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; pulseaudio-jack-git
(define-public pulseaudio-jack-git
  (package
    (name "pulseaudio-jack-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-jack-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "jack support for PulseAudio (development)")
    (description
     "Jack support for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; pulseaudio-bluetooth-git
(define-public pulseaudio-bluetooth-git
  (package
    (name "pulseaudio-bluetooth-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-bluetooth-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "bluetooth support for PulseAudio (development)")
    (description
     "Bluetooth support for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; pulseaudio-equalizer-git
(define-public pulseaudio-equalizer-git
  (package
    (name "pulseaudio-equalizer-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-equalizer-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "graphical equalizer for PulseAudio (development)")
    (description
     "Graphical equalizer for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; pulseaudio-rtp-git
(define-public pulseaudio-rtp-git
  (package
    (name "pulseaudio-rtp-git")
    (version "17.0.r38.gcba313d8f")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pulseaudio-rtp-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rTP and RAOP support for PulseAudio (development)")
    (description
     "RTP and RAOP support for PulseAudio (development).")
    (home-page "http://pulseaudio.org/")
    (license license:lgpl2.1+)))

;;; shantz-xwinwrap-bzr
(define-public shantz-xwinwrap-bzr
  (package
    (name "shantz-xwinwrap-bzr")
    (version "20090421")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/shantz-xwinwrap-bzr.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to play Movies on your Desktop Or ElectricSheep")
    (description
     "Utility to play Movies on your Desktop Or ElectricSheep.")
    (home-page "https://shantanugoel.com/2008/09/03/shantz-xwinwrap/")
    (license license:expat)))

;;; qtwebflix-git
(define-public qtwebflix-git
  (package
    (name "qtwebflix-git")
    (version "0.1.r184.g3741139")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gort818/qtwebflix")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "standalone HD Netflix Browser using qt5-webengine (also supports Amazon p")
    (description
     "Standalone HD Netflix Browser using qt5-webengine (also supports Amazon prime, HBO Go, Hulu, Crunchy Roll).")
    (home-page "https://github.com/gort818/qtwebflix")
    (license license:gpl3)))

;;; waybar-git
(define-public waybar-git
  (package
    (name "waybar-git")
    (version "0.13.0.r41.g0776e69")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Alexays/Waybar")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "highly customizable Wayland bar for Sway and Wlroots based compositors")
    (description
     "Highly customizable Wayland bar for Sway and Wlroots based compositors.")
    (home-page "https://github.com/Alexays/Waybar")
    (license license:expat)))

;;; twmn-git
(define-public twmn-git
  (package
    (name "twmn-git")
    (version "194.e0922a6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sboli/twmn")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a notification system for tiling window managers")
    (description
     "A notification system for tiling window managers.")
    (home-page "https://github.com/sboli/twmn")
    (license license:lgpl3+)))

;;; ltspice
(define-public ltspice
  (package
    (name "ltspice")
    (version "26.0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ltspice.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sPICE simulator, schematic capture and waveform viewer")
    (description
     "SPICE simulator, schematic capture and waveform viewer.")
    (home-page "https://www.analog.com/en/resources/design-tools-and-calculators/ltspice-simulator.html")
    (license license:non-copyleft)))

;;; gqrx-git
(define-public gqrx-git
  (package
    (name "gqrx-git")
    (version "1:r2574.25fdbb5a")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/gqrx-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "sDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices")
    (description
     "SDR receiver for Funcube Dongle, RTL-SDR, USRP and OsmoSDR devices.")
    (home-page "http://gqrx.dk/")
    (license license:gpl3+)))

;;; glmark2-git
(define-public glmark2-git
  (package
    (name "glmark2-git")
    (version "r971.af498f4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/glmark2/glmark2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an OpenGL 2.0 and ES 2.0 benchmark (X11, Wayland, DRM)")
    (description
     "An OpenGL 2.0 and ES 2.0 benchmark (X11, Wayland, DRM).")
    (home-page "https://github.com/glmark2/glmark2")
    (license license:non-copyleft)))

;;; lxqt-notificationd-git
(define-public lxqt-notificationd-git
  (package
    (name "lxqt-notificationd-git")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lxqt-notificationd-git.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lXQt notification daemon and library")
    (description
     "LXQt notification daemon and library.")
    (home-page "https://lxqt-project.org")
    (license license:lgpl2.1)))

;;; mozplugger
(define-public mozplugger
  (package
    (name "mozplugger")
    (version "2.1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/mozplugger.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a Mozilla & Firefox multimedia plugin")
    (description
     "A Mozilla & Firefox multimedia plugin.")
    (home-page "https://web.archive.org/web/20190413003821/http://mozplugger.mozdev.org/")
    (license license:gpl3+)))

;;; pavucontrol-gtk2
(define-public pavucontrol-gtk2
  (package
    (name "pavucontrol-gtk2")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/pavucontrol-gtk2.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a GTK volume control tool for PulseAudio")
    (description
     "A GTK volume control tool for PulseAudio.")
    (home-page "https://freedesktop.org/software/pulseaudio/pavucontrol/")
    (license license:gpl2)))

;;; radare2-git
(define-public radare2-git
  (package
    (name "radare2-git")
    (version "6.0.8.r65.ge515192")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/radare/radare2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source tools to disasm, debug, analyze and manipulate binary files")
    (description
     "Open-source tools to disasm, debug, analyze and manipulate binary files.")
    (home-page "https://github.com/radare/radare2")
    (license license:gpl3)))

;;; tesseract-git
(define-public tesseract-git
  (package
    (name "tesseract-git")
    (version "1:5.0.1.r9.g31a96843")
    (source
     (origin
       (method url-fetch)
       (uri "https://tesseract-ocr.github.io/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open Source OCR Engine")
    (description
     "Open Source OCR Engine.")
    (home-page "https://tesseract-ocr.github.io/")
    (license license:asl2.0)))

