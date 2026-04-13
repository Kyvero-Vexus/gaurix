;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 23 recipes created
;;;   - 7 blocked with specific reason codes
;;;
;;; Recipes (23):
;;;   - sigscan-bin (copy, asl2.0/expat)
;;;   - ast-grep-bin (copy, expat)
;;;   - caescript-bin (copy, expat)
;;;   - httptap-bin (copy, expat)
;;;   - music-player-bin (copy, expat)
;;;   - nijiexpose-bin (copy, bsd-2)
;;;   - git-switcher-bin (copy, asl2.0)
;;;   - tidewave-bin (copy, asl2.0)
;;;   - veracrypt-console-bin (copy, asl2.0)
;;;   - logisim-evolution-bin (copy, gpl3+)
;;;   - ledfx-cc-bin (copy, gpl3+)
;;;   - termtosvg (python, bsd-3)
;;;   - pisek (pyproject, gpl3+)
;;;   - python-upnpclient (python, expat)
;;;   - python-backports.shutil-which (pyproject, gpl3+)
;;;   - snapborg (python, gpl3+)
;;;   - pam-luks-keyring-unlock (meson, expat)
;;;   - wlr-dpms (gnu, expat)
;;;   - wl-gears (gnu, expat)
;;;   - xtatusbar (gnu, expat)
;;;   - xdgctl (gnu, bsd-2)
;;;   - terminalimageviewer (gnu, asl2.0)
;;;   - snoop (meson, gpl3+)
;;;
;;; Blocked (7):
;;;   - exaile (MISSING_GUIX_DEPS: python-bsddb not in Guix, 15+ optional deps)
;;;   - stremio-service-bin (MISSING_GUIX_DEPS: libayatana-appindicator not in Guix)
;;;   - python-foobeef (MISSING_GUIX_DEPS: python-aiohttp-sse-client not in Guix)
;;;   - radiotray-ng-mpris (MISSING_GUIX_DEPS: python-mpris-server, python-yacl, radiotray-ng)
;;;   - fprintd-clients-git (COMPLEX_BUILD: needs local patches + libsystemd)
;;;   - fcitx5-pinyin-chinese-idiom (MISSING_GUIX_DEPS: python-pypinyin not in Guix)
;;;   - ksnip (VERSION_MISMATCH: Qt5/Qt6 mismatch with kimageannotator in Guix)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages java)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages time)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            sigscan-bin
            ast-grep-bin
            caescript-bin
            httptap-bin
            music-player-bin
            nijiexpose-bin
            git-switcher-bin
            tidewave-bin
            veracrypt-console-bin
            logisim-evolution-bin
            ledfx-cc-bin
            termtosvg
            pisek
            python-upnpclient
            python-backports.shutil-which
            snapborg
            pam-luks-keyring-unlock
            wlr-dpms
            wl-gears
            xtatusbar
            xdgctl
            terminalimageviewer
            snoop
            ))

;;; ── 1. sigscan-bin ───────────────────────────────────────────────────────
;;; Pre-compiled signal scanning tool
;;; AUR: sigscan-bin  →  Guix: sigscan-bin
;;; Upstream: https://github.com/brannondorsey/sigscan

(define-public sigscan-bin
  (package
    (name "sigscan-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brannondorsey/sigscan/releases/download/v"
                    version "/sigscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sigscan" "bin/sigscan"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "radio frequency signal scanner and analyzer")
    (description "Sigscan is a command-line tool for scanning and analyzing
RF signals.  It provides frequency scanning capabilities for software-defined
radio applications.")
    (home-page "https://github.com/brannondorsey/sigscan")
    (license (list license:asl2.0 license:expat))))

;;; ── 2. ast-grep-bin ──────────────────────────────────────────────────────
;;; Pre-compiled AST-based code search/lint/rewrite tool
;;; AUR: ast-grep-bin  →  Guix: ast-grep-bin
;;; Upstream: https://github.com/ast-grep/ast-grep

(define-public ast-grep-bin
  (package
    (name "ast-grep-bin")
    (version "0.42.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ast-grep/ast-grep/releases/download/"
                    version "/app-x86_64-unknown-linux-gnu.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("ast-grep" "bin/ast-grep"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "structural code search, lint, and rewrite tool")
    (description "ast-grep is a command-line tool for structural code search,
lint, and rewrite.  It uses abstract syntax trees (ASTs) to match code
patterns, providing more precise results than text-based search tools.")
    (home-page "https://ast-grep.github.io")
    (license license:expat)))

;;; ── 3. caescript-bin ─────────────────────────────────────────────────────
;;; Pre-compiled Monkey language dialect interpreter
;;; AUR: caescript-bin  →  Guix: caescript-bin
;;; Upstream: https://github.com/caelansar/caescript

(define-public caescript-bin
  (package
    (name "caescript-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/caelansar/caescript/releases/download/v"
                    version "/caescript-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("caescript" "bin/caescript"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "interpreter for a Monkey programming language dialect")
    (description "Caescript is an interpreter for a dialect of the Monkey
programming language.  It supports closures, higher-order functions, and
a REPL for interactive use.")
    (home-page "https://github.com/caelansar/caescript")
    (license license:expat)))

;;; ── 4. httptap-bin ───────────────────────────────────────────────────────
;;; Pre-compiled HTTP/HTTPS request inspector
;;; AUR: httptap-bin  →  Guix: httptap-bin
;;; Upstream: https://github.com/monasticacademy/httptap

(define-public httptap-bin
  (package
    (name "httptap-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/monasticacademy/httptap/releases/download/v"
                    version "/httptap_linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("httptap" "bin/httptap"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "transparent HTTP/HTTPS request inspector")
    (description "Httptap intercepts and displays HTTP/HTTPS requests made
by any program, without requiring proxy configuration or code changes.  It
creates a network namespace to transparently capture traffic.")
    (home-page "https://github.com/monasticacademy/httptap")
    (license license:expat)))

;;; ── 5. music-player-bin ──────────────────────────────────────────────────
;;; Pre-compiled extensible music server
;;; AUR: music-player-bin  →  Guix: music-player-bin
;;; Upstream: https://github.com/tsirysndr/music-player

(define-public music-player-bin
  (package
    (name "music-player-bin")
    (version "0.2.0-alpha.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tsirysndr/music-player/releases/download/v"
                    version "/music-player_v" version
                    "_x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list alsa-lib))
    (arguments
     (list #:install-plan
           #~'(("music-player" "bin/music-player"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "extensible terminal music player and server")
    (description "Music Player is a terminal-based music player and server
written in Rust.  It supports local audio playback via ALSA and can be
controlled remotely.")
    (home-page "https://github.com/tsirysndr/music-player")
    (license license:expat)))

;;; ── 6. nijiexpose-bin ────────────────────────────────────────────────────
;;; Pre-compiled VTuber camera application
;;; AUR: nijiexpose-bin  →  Guix: nijiexpose-bin
;;; Upstream: https://github.com/nijigenerate/nijiexpose

(define-public nijiexpose-bin
  (package
    (name "nijiexpose-bin")
    (version "0.9.0-rc4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nijigenerate/nijiexpose/releases/download/v"
                    version "/nijiexpose-linux-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (inputs (list dbus freetype sdl2))
    (arguments
     (list #:install-plan
           #~'(("nijiexpose" "bin/nijiexpose"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "face tracking camera application for VTubers")
    (description "Nijiexpose is a camera application for VTuber face tracking
using the nijigenerate framework.  It captures facial expressions and
translates them to 2D avatar animations.")
    (home-page "https://github.com/nijigenerate/nijiexpose")
    (license license:bsd-2)))

;;; ── 7. git-switcher-bin ──────────────────────────────────────────────────
;;; Pre-compiled Git profile switcher
;;; AUR: git-switcher-bin  →  Guix: git-switcher-bin
;;; Upstream: https://github.com/TheYkk/git-switcher

(define-public git-switcher-bin
  (package
    (name "git-switcher-bin")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/TheYkk/git-switcher/releases/download/"
                    version "/git-switcher-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("git-switcher" "bin/git-switcher"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "switch between multiple Git user profiles")
    (description "Git Switcher is a command-line tool that manages multiple
Git user configurations.  It allows switching between different name, email,
and signing key settings for different projects.")
    (home-page "https://github.com/TheYkk/git-switcher")
    (license license:asl2.0)))

;;; ── 8. tidewave-bin ──────────────────────────────────────────────────────
;;; Pre-compiled AI coding agent AppImage
;;; AUR: tidewave-bin  →  Guix: tidewave-bin
;;; Upstream: https://github.com/tidewave-ai/tidewave_app

(define-public tidewave-bin
  (package
    (name "tidewave-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tidewave-ai/tidewave_app/releases/download/v"
                    version "/tidewave-app-amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list fuse zlib))
    (arguments
     (list #:install-plan
           #~'(("tidewave-app-amd64.AppImage" "bin/tidewave"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop application for AI-assisted coding")
    (description "Tidewave is an AI coding agent that helps with software
development tasks.  Distributed as an AppImage, it provides a desktop
interface for AI-assisted programming.")
    (home-page "https://tidewave.ai")
    (license license:asl2.0)))

;;; ── 9. veracrypt-console-bin ─────────────────────────────────────────────
;;; VeraCrypt console-only binary from official .deb
;;; AUR: veracrypt-console-bin  →  Guix: veracrypt-console-bin
;;; Upstream: https://www.veracrypt.fr/

(define-public veracrypt-console-bin
  (package
    (name "veracrypt-console-bin")
    (version "1.26.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launchpad.net/veracrypt/trunk/" version
                    "/+download/veracrypt-console-" version
                    "-Debian-11-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list fuse lvm2))
    (native-inputs (list tar gzip))
    (arguments
     (list #:install-plan
           #~'(("usr/bin/veracrypt" "bin/veracrypt"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "console-only disk encryption tool based on TrueCrypt")
    (description "VeraCrypt is a disk encryption software based on TrueCrypt.
This console-only variant provides command-line access to create, mount,
and manage encrypted volumes without a graphical interface.")
    (home-page "https://www.veracrypt.fr/")
    (license license:asl2.0)))

;;; ── 10. logisim-evolution-bin ────────────────────────────────────────────
;;; Digital logic simulator Java application
;;; AUR: logisim-evolution-bin  →  Guix: logisim-evolution-bin
;;; Upstream: https://github.com/logisim-evolution/logisim-evolution

(define-public logisim-evolution-bin
  (package
    (name "logisim-evolution-bin")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/logisim-evolution/logisim-evolution/"
                    "releases/download/v" version
                    "/logisim-evolution-" version "-all.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list (list openjdk21 "jdk")))
    (arguments
     (list #:install-plan
           #~'(("logisim-evolution.jar" "share/java/logisim-evolution/logisim-evolution.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "logisim-evolution.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/logisim-evolution/logisim-evolution.jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/logisim-evolution")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java jar)))
                     (chmod (string-append bin "/logisim-evolution") #o755)))))))
    (synopsis "digital logic design tool and simulator for education")
    (description "Logisim-evolution is a digital logic design and simulation
tool intended for educational use.  It features a graphical interface for
designing circuits with gates, flip-flops, and other components.")
    (home-page "https://github.com/logisim-evolution/logisim-evolution")
    (license license:gpl3+)))

;;; ── 11. ledfx-cc-bin ────────────────────────────────────────────────────
;;; LedFx Community Edition AppImage
;;; AUR: ledfx-cc-bin  →  Guix: ledfx-cc-bin
;;; Upstream: https://github.com/YeonV/LedFx-Builds

(define-public ledfx-cc-bin
  (package
    (name "ledfx-cc-bin")
    (version "2.0.108-b6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YeonV/LedFx-Builds/releases/download/v"
                    version "/LedFx_CC-v" version "--linux-amd64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list fuse zlib))
    (arguments
     (list #:install-plan
           #~(let ((appimage (string-append "LedFx_CC-v"
                                            #$(package-version this-package)
                                            "--linux-amd64.AppImage")))
               (list (list appimage "bin/ledfx-cc")))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source
                              (string-append "LedFx_CC-v"
                                             #$(package-version this-package)
                                             "--linux-amd64.AppImage"))
                   (chmod (string-append "LedFx_CC-v"
                                         #$(package-version this-package)
                                         "--linux-amd64.AppImage")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "network-based LED effect controller")
    (description "LedFx CC (Community Edition) is a network-based LED effect
controller that synchronizes LED lights with audio.  It supports various
LED protocols and provides real-time audio-reactive effects.")
    (home-page "https://github.com/YeonV/LedFx-Builds")
    (license license:gpl3+)))

;;; ── 12. termtosvg ────────────────────────────────────────────────────────
;;; Record terminal sessions as SVG animations
;;; AUR: termtosvg  →  Guix: termtosvg
;;; Upstream: https://github.com/nbedos/termtosvg

(define-public termtosvg
  (package
    (name "termtosvg")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "termtosvg" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (propagated-inputs (list python-lxml python-pyte))
    (synopsis "record terminal sessions as SVG animations")
    (description "Termtosvg records terminal sessions and renders them as
standalone SVG animations.  The output files can be viewed in any web
browser without requiring JavaScript.")
    (home-page "https://github.com/nbedos/termtosvg")
    (license license:bsd-3)))

;;; ── 13. pisek ────────────────────────────────────────────────────────────
;;; Programming competition task development tool
;;; AUR: pisek  →  Guix: pisek
;;; Upstream: https://github.com/piskoviste/pisek

(define-public pisek
  (package
    (name "pisek")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/piskoviste/pisek/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-colorama
                             python-argcomplete
                             python-pydantic
                             python-readchar))
    (synopsis "programming competition task preparation tool")
    (description "Pisek is a tool for developing and testing tasks for
programming competitions.  It automates test generation, solution
verification, and task package creation.")
    (home-page "https://github.com/piskoviste/pisek")
    (license license:gpl3+)))

;;; ── 14. python-upnpclient ────────────────────────────────────────────────
;;; UPnP device discovery and control library
;;; AUR: python-upnpclient  →  Guix: python-upnpclient
;;; Upstream: https://github.com/flyte/upnpclient

(define-public python-upnpclient
  (package
    (name "python-upnpclient")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "upnpclient" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests
                             python-six
                             python-dateutil
                             python-lxml
                             python-ifaddr))
    (synopsis "client library for UPnP device discovery and control")
    (description "Upnpclient is a Python library for discovering and
controlling UPnP devices on a local network.  It provides a simple
API for device enumeration, service invocation, and event subscription.")
    (home-page "https://github.com/flyte/upnpclient")
    (license license:expat)))

;;; ── 15. python-backports.shutil-which ────────────────────────────────────
;;; Backport of shutil.which for Python
;;; AUR: python-backports.shutil_which  →  Guix: python-backports.shutil-which
;;; Upstream: https://github.com/minrk/backports.shutil_which

(define-public python-backports.shutil-which
  (package
    (name "python-backports.shutil-which")
    (version "3.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/minrk/backports.shutil_which/"
                    "archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "backport of shutil.which from Python 3.12")
    (description "This package provides a backport of @code{shutil.which}
from Python 3.12 to older Python versions.  It locates executables on
the system PATH.")
    (home-page "https://github.com/minrk/backports.shutil_which")
    (license license:gpl3+)))

;;; ── 16. snapborg ─────────────────────────────────────────────────────────
;;; Automated snapper-to-borg backup tool
;;; AUR: snapborg  →  Guix: snapborg
;;; Upstream: https://github.com/enzingerm/snapborg

(define-public snapborg
  (package
    (name "snapborg")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/enzingerm/snapborg")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list borg snapper python-pyyaml))
    (synopsis "automated snapper snapshot to borg backup tool")
    (description "Snapborg automates the process of creating Borg backups
from Snapper snapshots.  It monitors Snapper snapshot creation and
triggers corresponding Borg backup operations.")
    (home-page "https://github.com/enzingerm/snapborg")
    (license license:gpl3+)))

;;; ── 17. pam-luks-keyring-unlock ──────────────────────────────────────────
;;; PAM module for LUKS keyring unlock
;;; AUR: pam-luks-keyring-unlock  →  Guix: pam-luks-keyring-unlock
;;; Upstream: https://github.com/cubic3d/pam-luks-keyring-unlock

(define-public pam-luks-keyring-unlock
  (package
    (name "pam-luks-keyring-unlock")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cubic3d/pam-luks-keyring-unlock/"
                    "releases/download/v" version
                    "/pam-luks-keyring-unlock-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list linux-pam keyutils))
    (native-inputs (list pkg-config))
    (synopsis "unlock LUKS volumes via kernel keyring at PAM login")
    (description "pam-luks-keyring-unlock is a PAM module that stores LUKS
volume passwords in the Linux kernel keyring during login, allowing
automatic unlocking of encrypted volumes without re-entering passwords.")
    (home-page "https://github.com/cubic3d/pam-luks-keyring-unlock")
    (license license:expat)))

;;; ── 18. wlr-dpms ────────────────────────────────────────────────────────
;;; Wayland DPMS control utility
;;; AUR: wlr-dpms-git  →  Guix: wlr-dpms
;;; Upstream: https://sr.ht/~dsemy/wlr-dpms/

(define-public wlr-dpms
  (package
    (name "wlr-dpms")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~dsemy/wlr-dpms")
                    (commit "d0e6412")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list wayland))
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "control DPMS settings on Wayland compositors")
    (description "wlr-dpms is a command-line utility to control Display Power
Management Signaling (DPMS) on Wayland compositors that support the
wlr-output-power-management protocol.")
    (home-page "https://sr.ht/~dsemy/wlr-dpms/")
    (license license:expat)))

;;; ── 19. wl-gears ────────────────────────────────────────────────────────
;;; Wayland glxgears equivalent
;;; AUR: wl-gears-git  →  Guix: wl-gears
;;; Upstream: https://git.sr.ht/~soreau/wl-gears

(define-public wl-gears
  (package
    (name "wl-gears")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.sr.ht/~soreau/wl-gears")
                    (commit "b7ecdeb")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list libepoxy libglvnd wayland))
    (native-inputs (list wayland-protocols pkg-config))
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "wl-gears" bin)))))))
    (synopsis "spinning gears demo for Wayland (glxgears equivalent)")
    (description "wl-gears is a Wayland-native version of the classic
glxgears OpenGL demo.  It displays spinning gears rendered with OpenGL
in a Wayland window, useful for testing GPU acceleration.")
    (home-page "https://git.sr.ht/~soreau/wl-gears")
    (license license:expat)))

;;; ── 20. xtatusbar ───────────────────────────────────────────────────────
;;; Minimal X11 status bar in C
;;; AUR: xtatusbar  →  Guix: xtatusbar
;;; Upstream: https://codeberg.org/caskstrength/xtatusbar

(define-public xtatusbar
  (package
    (name "xtatusbar")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/caskstrength/xtatusbar")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list alsa-lib libx11))
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gcc" "-Wall" "-O2" "-std=c23"
                           "-D_POSIX_C_SOURCE=200809L"
                           "-o" "xtatusbar"
                           "src/main.c" "src/battery.c" "src/cpu.c"
                           "src/datetime.c" "src/memory.c" "src/volume.c"
                           "-lasound" "-lX11")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (man (string-append out "/share/man/man1")))
                     (mkdir-p bin)
                     (install-file "xtatusbar" bin)
                     (when (file-exists? "xtatusbar.1")
                       (mkdir-p man)
                       (install-file "xtatusbar.1" man))))))))
    (synopsis "minimal X11 status bar for window managers")
    (description "Xtatusbar is a lightweight X11 status bar that displays
system information including CPU usage, memory, battery status, volume
level, and date/time.  It uses xsetroot to update the root window name.")
    (home-page "https://codeberg.org/caskstrength/xtatusbar")
    (license license:expat)))

;;; ── 21. xdgctl ──────────────────────────────────────────────────────────
;;; TUI for managing XDG default applications
;;; AUR: xdgctl  →  Guix: xdgctl
;;; Upstream: https://github.com/mitjafelicijan/xdgctl

(define-public xdgctl
  (package
    (name "xdgctl")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mitjafelicijan/xdgctl/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list glib))
    (native-inputs (list pkg-config))
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "sh" "-c"
                           (string-append
                            "gcc $(pkg-config --cflags gio-2.0 gio-unix-2.0)"
                            " -o xdgctl main.c"
                            " $(pkg-config --libs gio-2.0 gio-unix-2.0)"))))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "xdgctl" bin)))))))
    (synopsis "terminal interface for managing XDG default applications")
    (description "Xdgctl is a terminal user interface for managing XDG
default application associations.  It provides an interactive way to
view and change file type associations on the desktop.")
    (home-page "https://github.com/mitjafelicijan/xdgctl")
    (license license:bsd-2)))

;;; ── 22. terminalimageviewer ──────────────────────────────────────────────
;;; Display images in the terminal
;;; AUR: terminalimageviewer  →  Guix: terminalimageviewer
;;; Upstream: https://github.com/stefanhaustein/TerminalImageViewer

(define-public terminalimageviewer
  (package
    (name "terminalimageviewer")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stefanhaustein/TerminalImageViewer/"
                    "archive/refs/tags/v" version
                    "/TerminalImageViewer-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list imagemagick))
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-after 'unpack 'chdir-src
                 (lambda _ (chdir "src/main/cpp"))))))
    (synopsis "display images in the terminal using block characters")
    (description "TerminalImageViewer (tiv) displays images directly in the
terminal using Unicode block characters and 24-bit color.  It supports
common image formats via ImageMagick and provides fast rendering.")
    (home-page "https://github.com/stefanhaustein/TerminalImageViewer")
    (license (list license:asl2.0 license:gpl3+))))

;;; ── 23. snoop ────────────────────────────────────────────────────────────
;;; GNOME file search application
;;; AUR: snoop  →  Guix: snoop
;;; Upstream: https://gitlab.gnome.org/philippun1/snoop

(define-public snoop
  (package
    (name "snoop")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.gnome.org/philippun1/snoop/-/archive/"
                    version "/snoop-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list gtksourceview libadwaita))
    (native-inputs (list pkg-config vala `(,glib "bin")))
    (arguments (list #:tests? #f))
    (synopsis "search through files and folders on GNOME")
    (description "Snoop is a GNOME file search application built with
Vala and GTK4.  It provides fast file searching with syntax-highlighted
previews powered by GtkSourceView.")
    (home-page "https://gitlab.gnome.org/philippun1/snoop")
    (license license:gpl3+)))
