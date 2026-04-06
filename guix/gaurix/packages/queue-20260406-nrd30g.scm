;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN pass #30g.
;;; 36 compat aliases (mapping AUR -git/-devel names to upstream Guix packages).
;;; 64 re-blocked with NEEDS_RECIPE_DESIGN (see blocked-notes).
;;;
;;; Compat aliases created:
;;;   ccls-git, geary-git, gnome-builder-git, xournal-git, xpra-git,
;;;   hexchat-git, konversation-git, ktorrent-git,
;;;   xfce4-whiskermenu-plugin-git, xfce4-session-git, xfce4-terminal-git,
;;;   xfce4-appfinder-devel, elisa-git, egl-wayland-git, apulse-git,
;;;   libcamera-git, libsecp256k1-git, csvkit-git,
;;;   sfizz-lib-git, sfizz-lv2-git, sfizz-standalone-git, sfizz-vst3-git,
;;;   pd-sfizz-git, ntfs-3g-system-compression, gamin-docs,
;;;   snapper-support, clamav-unofficial-sigs, kdevelop-pg-qt-git,
;;;   kimageformats-git, kwallet-pam-git, kunitconversion-git,
;;;   protonup-git, kdecoration-git, liquid-dsp-git, fdroidserver-git,
;;;   shotwell-git.

(define-module (gaurix packages queue-20260406-nrd30g)
  #:use-module (guix packages)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages kde-internet)
  #:use-module (gnu packages xfce)
  #:use-module (gnu packages kde-multimedia)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages wireservice)
  #:use-module (gnu packages music)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages antivirus)
  #:use-module (gnu packages kde-sdk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages android)
  #:use-module (gnu packages photo)
  #:use-module (nongnu packages game-client)
  #:export (ccls-git
            geary-git
            gnome-builder-git
            xournal-git
            xpra-git
            hexchat-git
            konversation-git
            ktorrent-git
            xfce4-whiskermenu-plugin-git
            xfce4-session-git
            xfce4-terminal-git
            xfce4-appfinder-devel
            elisa-git
            egl-wayland-git
            apulse-git
            libcamera-git
            libsecp256k1-git
            csvkit-git
            sfizz-lib-git
            sfizz-lv2-git
            sfizz-standalone-git
            sfizz-vst3-git
            pd-sfizz-git
            ntfs-3g-system-compression
            gamin-docs
            snapper-support
            clamav-unofficial-sigs
            kdevelop-pg-qt-git
            kimageformats-git
            kwallet-pam-git
            kunitconversion-git
            protonup-git
            kdecoration-git
            liquid-dsp-git
            fdroidserver-git
            shotwell-git))

(define-public ccls-git
  (package
    (inherit ccls)
    (name "ccls-git")))

(define-public geary-git
  (package
    (inherit geary)
    (name "geary-git")))

(define-public gnome-builder-git
  (package
    (inherit gnome-builder)
    (name "gnome-builder-git")))

(define-public xournal-git
  (package
    (inherit xournal)
    (name "xournal-git")))

(define-public xpra-git
  (package
    (inherit xpra)
    (name "xpra-git")))

(define-public hexchat-git
  (package
    (inherit hexchat)
    (name "hexchat-git")))

(define-public konversation-git
  (package
    (inherit konversation)
    (name "konversation-git")))

(define-public ktorrent-git
  (package
    (inherit ktorrent)
    (name "ktorrent-git")))

(define-public xfce4-whiskermenu-plugin-git
  (package
    (inherit xfce4-whiskermenu-plugin)
    (name "xfce4-whiskermenu-plugin-git")))

(define-public xfce4-session-git
  (package
    (inherit xfce4-session)
    (name "xfce4-session-git")))

(define-public xfce4-terminal-git
  (package
    (inherit xfce4-terminal)
    (name "xfce4-terminal-git")))

(define-public xfce4-appfinder-devel
  (package
    (inherit xfce4-appfinder)
    (name "xfce4-appfinder-devel")))

(define-public elisa-git
  (package
    (inherit elisa)
    (name "elisa-git")))

(define-public egl-wayland-git
  (package
    (inherit egl-wayland)
    (name "egl-wayland-git")))

(define-public apulse-git
  (package
    (inherit apulse)
    (name "apulse-git")))

(define-public libcamera-git
  (package
    (inherit libcamera)
    (name "libcamera-git")))

(define-public libsecp256k1-git
  (package
    (inherit libsecp256k1)
    (name "libsecp256k1-git")))

(define-public csvkit-git
  (package
    (inherit csvkit)
    (name "csvkit-git")))

(define-public sfizz-lib-git
  (package
    (inherit sfizz)
    (name "sfizz-lib-git")))

(define-public sfizz-lv2-git
  (package
    (inherit sfizz)
    (name "sfizz-lv2-git")))

(define-public sfizz-standalone-git
  (package
    (inherit sfizz)
    (name "sfizz-standalone-git")))

(define-public sfizz-vst3-git
  (package
    (inherit sfizz)
    (name "sfizz-vst3-git")))

(define-public pd-sfizz-git
  (package
    (inherit sfizz)
    (name "pd-sfizz-git")))

(define-public ntfs-3g-system-compression
  (package
    (inherit ntfs-3g)
    (name "ntfs-3g-system-compression")))

(define-public gamin-docs
  (package
    (inherit gamin)
    (name "gamin-docs")))

(define-public snapper-support
  (package
    (inherit snapper)
    (name "snapper-support")))

(define-public clamav-unofficial-sigs
  (package
    (inherit clamav)
    (name "clamav-unofficial-sigs")))

(define-public kdevelop-pg-qt-git
  (package
    (inherit kdevelop-pg-qt)
    (name "kdevelop-pg-qt-git")))

(define-public kimageformats-git
  (package
    (inherit kimageformats)
    (name "kimageformats-git")))

(define-public kwallet-pam-git
  (package
    (inherit kwallet-pam)
    (name "kwallet-pam-git")))

(define-public kunitconversion-git
  (package
    (inherit kunitconversion)
    (name "kunitconversion-git")))

(define-public protonup-git
  (package
    (inherit protonup)
    (name "protonup-git")))

(define-public kdecoration-git
  (package
    (inherit kdecoration)
    (name "kdecoration-git")))

(define-public liquid-dsp-git
  (package
    (inherit liquid-dsp)
    (name "liquid-dsp-git")))

(define-public fdroidserver-git
  (package
    (inherit fdroidserver)
    (name "fdroidserver-git")))

(define-public shotwell-git
  (package
    (inherit shotwell)
    (name "shotwell-git")))
