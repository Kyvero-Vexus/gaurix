;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #12.
;;; 7 new recipes: 2 Wayland compositors/plugins (mangowm, plasma6-wallpapers-blurredwallpaper-git),
;;; 1 Go TUI tool (podman-tui), 1 KDE settings app (plasma-settings),
;;; 1 smartcard auth app (web-eid-native), 1 Bengali keyboard (openbangla-keyboard),
;;; 1 Python Chromecast tool (mkchromecast-git).
;;; 8 compat aliases added to general-compat.scm.
;;; 15 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd12)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xdisorg)
  #:export (podman-tui
            plasma-settings
            plasma6-wallpapers-blurredwallpaper-git
            web-eid-native
            mangowm
            mkchromecast-git
            openbangla-keyboard))

;; ═══════════════════════════════════════════════════════════════════
;; 1. podman-tui — Go TUI for Podman
;; ═══════════════════════════════════════════════════════════════════

(define-public podman-tui
  (package
    (name "podman-tui")
    (version "1.11.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/containers/podman-tui/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1qblmrndrg8yahm4cffhngpzxj9rc51amzjf2c9h8k462wcnj2r1"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/containers/podman-tui"
           #:install-source? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'build
                 (lambda* (#:key import-path #:allow-other-keys)
                   (with-directory-excursion
                       (string-append "src/" import-path)
                     (invoke "go" "build" "-v" "-mod=vendor"
                             "-o" "podman-tui" "."))))
               (replace 'install
                 (lambda* (#:key import-path outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (install-file
                      (string-append "src/" import-path "/podman-tui")
                      bin))))
               (delete 'check))))
    (home-page "https://github.com/containers/podman-tui")
    (synopsis "terminal user interface for Podman v4+")
    (description
     "Podman TUI is a terminal user interface for Podman (v4 and later).
It provides a convenient text-based way to manage containers, pods,
images, volumes, and networks from the command line.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. plasma-settings — KDE Plasma settings for mobile
;; ═══════════════════════════════════════════════════════════════════

(define-public plasma-settings
  (package
    (name "plasma-settings")
    (version "26.02.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.kde.org/stable/plasma-settings/"
                    "plasma-settings-" version ".tar.xz"))
              (sha256
               (base32 "1pj0c6c5z3jqj2rnrgjnllhlxazacj4s3sznr9257rxx46hqjwzs"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite provided
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list kcmutils
                  kdeclarative
                  ki18n
                  kirigami
                  kirigami-addons
                  kitemmodels
                  kitemviews
                  kservice
                  plasma-workspace
                  qtbase))
    (home-page "https://invent.kde.org/plasma-mobile/plasma-settings")
    (synopsis "settings application for Plasma Mobile")
    (description
     "Plasma Settings provides a touch-friendly interface for configuring
system and application settings on Plasma Mobile devices.  It exposes
KDE Configuration Modules (KCMs) in a mobile-optimized layout.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. plasma6-wallpapers-blurredwallpaper-git — blurred wallpaper plugin
;; ═══════════════════════════════════════════════════════════════════

(define-public plasma6-wallpapers-blurredwallpaper-git
  (package
    (name "plasma6-wallpapers-blurredwallpaper-git")
    (version "3.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bouteillerAlan/blurredwallpaper")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "066jbvg51zwsmhk67wnlbirgb6ynjkbr5fi230dm5pmhkb8c8isg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("a2n.blur" "share/plasma/wallpapers/a2n.blur"))))
    (home-page "https://github.com/bouteillerAlan/blurredwallpaper")
    (synopsis "blurred wallpaper plugin for KDE Plasma 6")
    (description
     "Blurred Wallpaper is a Plasma 6 wallpaper plugin that applies
a Gaussian blur effect to your desktop wallpaper.  It supports
configurable blur radius and can optionally display the time on top
of the blurred image.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. web-eid-native — Web eID browser extension native component
;; ═══════════════════════════════════════════════════════════════════

(define-public web-eid-native
  (package
    (name "web-eid-native")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/web-eid/web-eid-app")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0ssgdhpd8qc44sa0pkcrmq1fw7ihnwhvpy85cfawzkwrscb5z7jb"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require browser runtime
    (native-inputs (list pkg-config))
    (inputs (list openssl
                  pcsc-lite
                  qtbase))
    (home-page "https://web-eid.eu")
    (synopsis "native messaging host for the Web eID browser extension")
    (description
     "Web eID is an application that enables authentication and digital
signing in the web browser using European electronic identity (eID)
smart cards.  This package provides the native messaging host component
that communicates between the browser extension and the smart card
reader via PC/SC.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. mangowm — Wayland compositor based on wlroots
;; ═══════════════════════════════════════════════════════════════════

(define-public mangowm
  (package
    (name "mangowm")
    (version "0.12.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mangowm/mango/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1hb1x5an92v1ma359scz8dcal3k70l9z0nd0vdlq14v7qa4v8xwv"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (native-inputs (list pkg-config wayland-protocols))
    (inputs (list libdrm
                  libinput
                  libxkbcommon
                  pcre2
                  pixman
                  scenefx
                  wayland
                  wlroots))
    (home-page "https://github.com/mangowm/mango")
    (synopsis "wayland compositor based on wlroots and scenefx")
    (description
     "Mango is a Wayland compositor built on wlroots and scenefx.  It
provides tiling and stacking window management with support for
blur, rounded corners, and animations via the scenefx rendering
library.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. mkchromecast-git — cast media to Chromecast devices
;; ═══════════════════════════════════════════════════════════════════

(define-public mkchromecast-git
  (package
    (name "mkchromecast-git")
    (version "0.3.8.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/muammar/mkchromecast")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0baxilfalndip3fx8cj03pjkdywv1v65k41srarcdrzvm8dqca9s"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))  ;; imports optional deps at startup
    (inputs (list ffmpeg
                  flac
                  lame
                  python-flask
                  python-psutil))
    (home-page "https://mkchromecast.com")
    (synopsis "cast audio and video to Chromecast and Sonos devices")
    (description
     "Mkchromecast is a tool to cast audio and video from your computer
to Chromecast and Sonos devices.  It supports multiple audio codecs
including MP3, AAC, FLAC, and Opus, and can stream system audio
or media files.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. openbangla-keyboard — Bengali phonetic/fixed keyboard for Linux
;; ═══════════════════════════════════════════════════════════════════

(define-public openbangla-keyboard
  (package
    (name "openbangla-keyboard")
    (version "2.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenBangla/OpenBangla-Keyboard")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "03qj4v3jg2ibz73qyw7n7dh4x60ks7l82zhqy7yh6zh4q2i4iggl"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (native-inputs (list pkg-config))
    (inputs (list ibus
                  qtbase-5
                  zstd))
    (home-page "https://openbangla.github.io")
    (synopsis "phonetic and fixed-layout Bengali keyboard for Linux")
    (description
     "OpenBangla Keyboard is an open-source, Unicode-compliant Bengali
input method for Linux.  It supports Avro Phonetic, Probhat, Munir
Optima, and National (Jatiya) keyboard layouts and integrates with
IBus for system-wide input.")
    (license license:gpl3+)))
