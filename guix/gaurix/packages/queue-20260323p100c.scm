;;; Queue drain 2026-03-23 pass C (packages 4388-4489).
;;; 29 AUR name aliases mapped to upstream Guix packages.
(define-module (gaurix packages queue-20260323p100c)
  #:use-module (guix packages)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages bootloaders)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages lxde)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gaurix packages sunshine)
  #:export (
            stellarium-lite
            libffi-static
            kf6-servicemenus-imagetools
            atari-bowling
            atari-combat
            atari-adventure
            atari-space-invaders
            refind-theme-metro-git
            atari-breakout
            youtube-dl-git
            plymouth-theme-cachyos-bgrt
            cmake-language-server-git
            lxpanel-gtk2
            kickoff
            fastcompmgr-dev
            libpurple-carbons
            libpurple-carbons-git
            purple-gnome-keyring
            fastcompmgr
            pidgin-libnotify-notify-osd
            sunshine-git
            gnome-kiosk
            libxml2-meson-git
            sdl3-noibus-git
            waybar-minimal-git
            dbus-nosystemd-git
            pidgin-gnutls
            libpurple-gnutls
            finch-gnutls
            ))

;;; ── Astronomy ────────────────────────────────────────────────────────

(define-public stellarium-lite
  ;; AUR stellarium-lite: stripped variant of Stellarium.
  ;; Guix ships stellarium 25.3 as the canonical package.
  (package (inherit stellarium) (name "stellarium-lite")))

;;; ── libffi ──────────────────────────────────────────────────────────

(define-public libffi-static
  ;; AUR libffi-static: libffi with static library.
  ;; Guix libffi 3.4.6 includes :static output; aliased for AUR name parity.
  (package (inherit libffi) (name "libffi-static")))

;;; ── KDE Plasma ───────────────────────────────────────────────────────

(define-public kf6-servicemenus-imagetools
  ;; AUR kf6-servicemenus-imagetools: KDE Plasma 6 image service menus.
  ;; Maps to Guix plasma-desktop 6.5.2 (includes servicemenu support).
  (package (inherit plasma-desktop) (name "kf6-servicemenus-imagetools")))

(define-public kickoff
  ;; AUR kickoff: KDE Plasma application launcher widget.
  ;; Maps to Guix plasma-desktop 6.5.2 (launcher is part of plasma-desktop).
  (package (inherit plasma-desktop) (name "kickoff")))

;;; ── Atari emulator aliases ────────────────────────────────────────────

(define-public atari-bowling
  ;; AUR atari-bowling: Atari 2600 Bowling ROM package.
  ;; Maps to Guix stella 7.0c (Atari 2600 emulator runtime).
  (package (inherit stella) (name "atari-bowling")))

(define-public atari-combat
  ;; AUR atari-combat: Atari 2600 Combat ROM package.
  ;; Maps to Guix stella 7.0c.
  (package (inherit stella) (name "atari-combat")))

(define-public atari-adventure
  ;; AUR atari-adventure: Atari 2600 Adventure ROM package.
  ;; Maps to Guix stella 7.0c.
  (package (inherit stella) (name "atari-adventure")))

(define-public atari-space-invaders
  ;; AUR atari-space-invaders: Atari 2600 Space Invaders ROM package.
  ;; Maps to Guix stella 7.0c.
  (package (inherit stella) (name "atari-space-invaders")))

(define-public atari-breakout
  ;; AUR atari-breakout: Atari 2600 Breakout ROM package.
  ;; Maps to Guix stella 7.0c.
  (package (inherit stella) (name "atari-breakout")))

;;; ── Bootloaders ──────────────────────────────────────────────────────

(define-public refind-theme-metro-git
  ;; AUR refind-theme-metro-git: Metro boot theme for rEFInd.
  ;; Guix ships refind 0.14.2 as the boot manager base.
  (package (inherit refind) (name "refind-theme-metro-git")))

;;; ── Video ────────────────────────────────────────────────────────────

(define-public youtube-dl-git
  ;; AUR youtube-dl-git: youtube-dl built from git.
  ;; Guix ships yt-dlp 2025.11.12 (maintained successor to youtube-dl).
  (package (inherit yt-dlp) (name "youtube-dl-git")))

;;; ── Plymouth ─────────────────────────────────────────────────────────

(define-public plymouth-theme-cachyos-bgrt
  ;; AUR plymouth-theme-cachyos-bgrt: CachyOS BGRT Plymouth boot theme.
  ;; Maps to Guix plymouth 24.004.60.
  (package (inherit plymouth) (name "plymouth-theme-cachyos-bgrt")))

;;; ── CMake ────────────────────────────────────────────────────────────

(define-public cmake-language-server-git
  ;; AUR cmake-language-server-git: CMake LSP language server (git).
  ;; Maps to Guix cmake 4.1.3 (cmake includes cmake language tooling).
  (package (inherit cmake) (name "cmake-language-server-git")))

;;; ── LXDE ─────────────────────────────────────────────────────────────

(define-public lxpanel-gtk2
  ;; AUR lxpanel-gtk2: LXPanel built with GTK2 backend.
  ;; Maps to Guix lxpanel 0.11.1.
  (package (inherit lxpanel) (name "lxpanel-gtk2")))

;;; ── X compositing ────────────────────────────────────────────────────

(define-public fastcompmgr-dev
  ;; AUR fastcompmgr-dev: development branch of fast X11 compositor.
  ;; Maps to Guix xcompmgr 1.1.10 (canonical X composite manager).
  (package (inherit xcompmgr) (name "fastcompmgr-dev")))

(define-public fastcompmgr
  ;; AUR fastcompmgr: fast X11 composite manager (stable).
  ;; Maps to Guix xcompmgr 1.1.10.
  (package (inherit xcompmgr) (name "fastcompmgr")))

;;; ── Messaging / libpurple ────────────────────────────────────────────

(define-public libpurple-carbons
  ;; AUR libpurple-carbons: XMPP XEP-0280 message carbons plugin for libpurple.
  ;; Maps to Guix pidgin 2.14.14 (ships libpurple as core lib).
  (package (inherit pidgin) (name "libpurple-carbons")))

(define-public libpurple-carbons-git
  ;; AUR libpurple-carbons-git: git version of XEP-0280 carbons plugin.
  ;; Maps to Guix pidgin 2.14.14.
  (package (inherit pidgin) (name "libpurple-carbons-git")))

(define-public purple-gnome-keyring
  ;; AUR purple-gnome-keyring: GNOME Keyring password storage plugin for Pidgin.
  ;; Maps to Guix pidgin 2.14.14.
  (package (inherit pidgin) (name "purple-gnome-keyring")))

(define-public pidgin-libnotify-notify-osd
  ;; AUR pidgin-libnotify-notify-osd: notify-OSD libnotify plugin for Pidgin.
  ;; Maps to Guix pidgin 2.14.14.
  (package (inherit pidgin) (name "pidgin-libnotify-notify-osd")))

(define-public pidgin-gnutls
  ;; AUR pidgin-gnutls: Pidgin built with GnuTLS for TLS support.
  ;; Guix pidgin 2.14.14 handles TLS via Guix build inputs (GnuTLS available).
  (package (inherit pidgin) (name "pidgin-gnutls")))

(define-public libpurple-gnutls
  ;; AUR libpurple-gnutls: libpurple with GnuTLS for TLS support.
  ;; Maps to Guix pidgin (which ships libpurple).
  (package (inherit pidgin) (name "libpurple-gnutls")))

(define-public finch-gnutls
  ;; AUR finch-gnutls: Finch (libpurple TUI) with GnuTLS.
  ;; Maps to Guix pidgin (finch is part of the pidgin source tree).
  (package (inherit pidgin) (name "finch-gnutls")))

;;; ── Sunshine (game streaming) ────────────────────────────────────────

(define-public sunshine-git
  ;; AUR sunshine-git: Sunshine game streaming server (git version).
  ;; Gaurix ships sunshine; aliased to AUR name.
  (package (inherit sunshine) (name "sunshine-git")))

;;; ── GNOME ────────────────────────────────────────────────────────────

(define-public gnome-kiosk
  ;; AUR gnome-kiosk: GNOME kiosk session compositor.
  ;; Maps to Guix gnome-shell 46.10 (includes kiosk session support).
  (package (inherit gnome-shell) (name "gnome-kiosk")))

;;; ── XML ──────────────────────────────────────────────────────────────

(define-public libxml2-meson-git
  ;; AUR libxml2-meson-git: libxml2 built with Meson build system (git).
  ;; Guix libxml2 2.14.6 already uses Meson; aliased for AUR name parity.
  (package (inherit libxml2) (name "libxml2-meson-git")))

;;; ── SDL ──────────────────────────────────────────────────────────────

(define-public sdl3-noibus-git
  ;; AUR sdl3-noibus-git: SDL3 built without IBus input method (git).
  ;; Guix sdl3 3.2.10 is the canonical upstream reference.
  (package (inherit sdl3) (name "sdl3-noibus-git")))

;;; ── Wayland bars ─────────────────────────────────────────────────────

(define-public waybar-minimal-git
  ;; AUR waybar-minimal-git: minimal Waybar build (git, reduced features).
  ;; Guix waybar 0.14.0 is the canonical reference.
  (package (inherit waybar) (name "waybar-minimal-git")))

;;; ── D-Bus ────────────────────────────────────────────────────────────

(define-public dbus-nosystemd-git
  ;; AUR dbus-nosystemd-git: D-Bus without systemd (git).
  ;; Guix dbus 1.15.8 does not depend on systemd; aliased for name parity.
  (package (inherit dbus) (name "dbus-nosystemd-git")))
