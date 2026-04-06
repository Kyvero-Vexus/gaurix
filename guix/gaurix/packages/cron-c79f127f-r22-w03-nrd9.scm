;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #9.
;;; 9 new recipes: 1 copy (shell script), 1 GNU make (C/GTK3),
;;; 2 CMake (Qt5/Qt6 theme), 1 GNU make (C/SDL2 game), 1 copy (binary),
;;; 1 cargo (Rust workspace), 1 cargo (Rust GPU fan daemon), 1 copy (bash script).
;;; 21 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r22-w03-nrd9)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cargo)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages version-control)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (git-recursive
            zenmonitor3
            adwaita-qt5
            adwaita-qt6
            opentyrian2000
            vr-lighthouse-bin
            amdfand-bin
            steamtinkerlaunch
            anyrun))

;; ═══════════════════════════════════════════════════════════════════
;; Copy/trivial packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. git-recursive ─────────────────────────────────────────────

(define-public git-recursive
  (package
    (name "git-recursive")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aelesbao/git-recursive/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0c4fv9jh700cslsmapq65snafpgk2691lamxbzbgc7hwz08blg1l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-recursive" "bin/git-recursive")
               ("LICENSE" "share/licenses/git-recursive/LICENSE"))))
    (inputs (list git))
    (home-page "https://github.com/aelesbao/git-recursive")
    (synopsis "execute git operations in multiple repositories")
    (description
     "Git-recursive is a shell script that executes git operations across
multiple repositories simultaneously.  It discovers git repositories in
subdirectories and runs the specified git command in each one.")
    (license license:expat)))

;; ── 2. steamtinkerlaunch ─────────────────────────────────────────

(define-public steamtinkerlaunch
  (package
    (name "steamtinkerlaunch")
    (version "12.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sonic2kk/steamtinkerlaunch/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0md5wdcj89rjx04y1dqk5js4bqlww2hlw1rbyvcwr1vvzv0ry6xq"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/sonic2kk/steamtinkerlaunch")
    (synopsis "wrapper tool for use with the Steam client")
    (description
     "SteamTinkerLaunch is a versatile Linux wrapper tool for use with the
Steam client.  It allows customizing and start tools and options for
games launched with Steam, such as Proton, GameScope, MangoHud,
modding tools, and custom commands.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; GNU make packages (C)
;; ═══════════════════════════════════════════════════════════════════

;; ── 3. zenmonitor3 ──────────────────────────────────────────────

(define-public zenmonitor3
  (let ((commit "1e1ceec7353dc418578fe8ae56536bfee6adeca3")
        (revision "0"))
    (package
      (name "zenmonitor3")
      (version (string-append "0.0.0-" revision "." (string-take commit 7)))
      (source (origin
                (method url-fetch)
                (uri (string-append
                      "https://github.com/detiam/zenmonitor3/archive/"
                      commit ".tar.gz"))
                (sha256
                 (base32 "0cp3mx0y8f343nzih36niilpbfi9ikd7r4dcbjinw46zwjzfvdg0"))))
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
      (inputs (list gtk+))
      (home-page "https://github.com/detiam/zenmonitor3")
      (synopsis "monitoring software for AMD Zen-based CPUs")
      (description
       "Zenmonitor3 is a monitoring tool for AMD Zen-based CPUs.  It reads
CPU sensor data including temperature, voltage, current, and power
through the sysfs interface and displays them in a GTK3 GUI.")
      (license license:expat))))

;; ── 4. opentyrian2000 ──────────────────────────────────────────

(define-public opentyrian2000
  (package
    (name "opentyrian2000")
    (version "2000.20250408")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/KScl/opentyrian2000/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0vjxsbqv2aw341byn5h4yhxqhzhi7q5wxs9hgfy90nzi6412x6y3"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output)
                   (string-append "gamesdir=" #$output "/share"))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 sdl2-net))
    (home-page "https://github.com/KScl/opentyrian2000")
    (synopsis "open-source port of the DOS shoot-em-up Tyrian 2000")
    (description
     "OpenTyrian2000 is an open-source port of the classic DOS vertical
scrolling shoot-em-up game Tyrian 2000.  It features enhanced support
for modern systems while preserving the original gameplay experience.")
    (license license:gpl2)))

;; ═══════════════════════════════════════════════════════════════════
;; CMake packages (Qt themes)
;; ═══════════════════════════════════════════════════════════════════

;; ── 5. adwaita-qt5 ──────────────────────────────────────────────

(define-public adwaita-qt5
  (package
    (name "adwaita-qt5")
    (version "1.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FedoraQt/adwaita-qt/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "1a2v6fd9j42r27dp2035m3b8grrlgkjn4iflib0707978qfdfpyd"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list qtbase-5))
    (home-page "https://github.com/FedoraQt/adwaita-qt")
    (synopsis "Adwaita theme for Qt5 applications")
    (description
     "Adwaita-qt is a style to bend Qt5 applications to look like they
belong into GNOME Shell.  It provides an Adwaita-like theme for Qt5
widgets to achieve visual consistency with GTK applications.")
    (license license:lgpl2.1+)))

;; ── 6. adwaita-qt6 ──────────────────────────────────────────────

(define-public adwaita-qt6
  (package
    (inherit adwaita-qt5)
    (name "adwaita-qt6")
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DUSE_QT6=ON")))
    (inputs (list qtbase))
    (synopsis "Adwaita theme for Qt6 applications")
    (description
     "Adwaita-qt is a style to bend Qt6 applications to look like they
belong into GNOME Shell.  It provides an Adwaita-like theme for Qt6
widgets to achieve visual consistency with GTK applications.")))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages (copy-build-system)
;; ═══════════════════════════════════════════════════════════════════

;; ── 7. vr-lighthouse-bin ─────────────────────────────────────────

(define-public vr-lighthouse-bin
  (package
    (name "vr-lighthouse-bin")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ShayBox/Lighthouse/releases/download/"
                    version "/Linux-x86_64.zip"))
              (sha256
               (base32 "1nfvqzahnh11ijrsjzhfb9rz8hf164b6wdsqw4qq7ypw1pviqwkm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lighthouse" "bin/lighthouse"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ShayBox/Lighthouse")
    (synopsis "VR Lighthouse power state management tool")
    (description
     "Lighthouse is a command-line tool for managing the power state of
SteamVR Lighthouse base stations.  It can turn base stations on and
off via Bluetooth, supporting both V1 and V2 base stations.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Rust/Cargo packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 8. anyrun ────────────────────────────────────────────────────

(define-public anyrun
  (package
    (name "anyrun")
    (version "25.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anyrun-org/anyrun/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0l1x1k8isd1140hrwm4d3wcc7zjl9dzplg4d28lrh4ynbzva44s2"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk gtk4-layer-shell))
    (home-page "https://github.com/anyrun-org/anyrun")
    (synopsis "wayland-native, highly customizable application launcher")
    (description
     "Anyrun is a Wayland-native application launcher written in Rust.  It
supports a plugin system with built-in plugins for application launching,
shell commands, symbol search, unit conversion, dictionary lookup, and
web search.  It uses GTK4 Layer Shell for Wayland integration.")
    (license license:gpl3)))

;; ── 9. amdfand-bin ──────────────────────────────────────────────

(define-public amdfand-bin
  (package
    (name "amdfand-bin")
    (version "1.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Eraden/amdgpud/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0sxxxxwg8xc94zn56i8r0ay9gqxsg9d9b5mbc3m2sspagc6rjvfk"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f
                     #:install-source? #f))
    (home-page "https://github.com/Eraden/amdgpud")
    (synopsis "AMD GPU fan control daemon for Linux")
    (description
     "Amdfand is a fan control daemon for AMD GPUs on Linux.  It reads GPU
temperature sensors and adjusts fan speed according to a configurable
curve.  It is part of the amdgpud suite of AMD GPU management tools.")
    (license (list license:asl2.0 license:expat))))
