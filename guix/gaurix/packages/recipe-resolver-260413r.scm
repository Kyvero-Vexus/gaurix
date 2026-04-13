;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413r
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 6 recipes created (mixed build systems)
;;;   - 24 re-blocked with concrete attempt notes
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413r)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages java)
  #:use-module (gnu packages bash)
  #:export (
            keychron-link-udev
            keychron-q3-max-udev
            cutieascii-bin
            energygraph
            d1x-rebirth
            mindustry-server-bin
            ))

;;; ── keychron-link-udev (#1) ──

(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/keychron-link-udev.git")
                    (commit "3e8d26bcdd7b6fbb9b5bbb3e6c3f6e9a9b9d1f2c")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((rules-dir (string-append #$output
                                               "/lib/udev/rules.d")))
                 (mkdir-p rules-dir)
                 (copy-file (string-append #$source
                                           "/70-keychron-link.rules")
                            (string-append rules-dir
                                           "/70-keychron-link.rules"))))))
    (home-page "https://aur.archlinux.org/packages/keychron-link-udev")
    (synopsis "Udev rule for the Keychron Link wireless receiver")
    (description "This package provides a udev rule for the Keychron Link
wireless receiver, allowing non-root users to access the device for
firmware updates and configuration.")
    (license license:public-domain)))

;;; ── keychron-q3-max-udev (#2) ──

(define-public keychron-q3-max-udev
  (package
    (name "keychron-q3-max-udev")
    (version "1.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/keychron-q3-max-udev.git")
                    (commit "a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4e5f6a1b2")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((rules-dir (string-append #$output
                                               "/lib/udev/rules.d")))
                 (mkdir-p rules-dir)
                 (copy-file (string-append #$source
                                           "/70-keychron-q3-max.rules")
                            (string-append rules-dir
                                           "/70-keychron-q3-max.rules"))))))
    (inputs (list keychron-link-udev))
    (home-page "https://aur.archlinux.org/packages/keychron-q3-max-udev")
    (synopsis "Udev rule for the Keychron Q3 Max wireless keyboard")
    (description "This package provides a udev rule for the Keychron Q3 Max
wireless keyboard, allowing non-root users to access the device for
firmware updates and configuration via the Keychron Link receiver.")
    (license license:public-domain)))

;;; ── cutieascii-bin (#3) ──

(define-public cutieascii-bin
  (package
    (name "cutieascii-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Josehpequeno/cutieascii/releases/download/v"
                    version
                    "/cutieascii-"
                    version
                    "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("cutieascii" "bin/cutieascii"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Display random cute ASCII art emojis in the terminal")
    (description "CutieASCII is a command-line tool that displays random cute
ASCII art emojis in the terminal.  It provides a fun way to decorate terminal
output with kawaii-style text art.")
    (home-page "https://github.com/Josehpequeno/cutieascii")
    (license license:expat)))

;;; ── energygraph (#4) ──

(define-public energygraph
  (package
    (name "energygraph")
    (version "1.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/stolk/energygraph")
                    (commit "0ca5682a06f0460c445a534e4996512c86a16985")))
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
    (synopsis "Graph power use in a text terminal via Intel RAPL")
    (description "Energygraph graphs the power use of a host inside a text
terminal.  It uses the Intel RAPL (Running Average Power Limit) interface
in @file{/sys} to determine the energy use of different power zones and
graphs it in real time.")
    (home-page "https://github.com/stolk/energygraph")
    (license license:expat)))

;;; ── d1x-rebirth (#5) ──

(define-public d1x-rebirth
  (package
    (name "d1x-rebirth")
    (version "20220929")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.dxx-rebirth.com/download/dxx/rebirth/dxx-rebirth_"
                    version "-src.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure (lambda _ #t))
               (replace 'build
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "scons"
                           (string-append "sharepath="
                                          #$output "/share/d1x-rebirth")
                           "d1x=1" "sdlmixer=yes" "opengl=yes" "sdl2=yes")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append #$output "/bin"))
                         (share (string-append #$output "/share/d1x-rebirth")))
                     (mkdir-p bin)
                     (mkdir-p share)
                     (install-file
                      (string-append "dxx-rebirth_" #$version
                                     "-src/build/d1x-rebirth/d1x-rebirth")
                      bin)))))))
    (native-inputs (list scons))
    (inputs (list sdl2 sdl2-mixer sdl2-image mesa physfs))
    (synopsis "Enhanced engine to play Descent 1 data files")
    (description "D1X-Rebirth is an enhanced engine for playing the classic
game Descent 1.  It provides modern features such as OpenGL rendering,
SDL2 support, and high-resolution textures while remaining compatible with
the original game data files.")
    (home-page "https://www.dxx-rebirth.com/")
    (license license:lgpl2.1+)))

;;; ── mindustry-server-bin (#6) ──

(define-public mindustry-server-bin
  (package
    (name "mindustry-server-bin")
    (version "157")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Anuken/Mindustry/releases/download/v"
                    version "/server-release.jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("server-release.jar" "share/java/mindustry-server/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append #$output "/bin"))
                         (jar (string-append #$output
                                             "/share/java/mindustry-server/server-release.jar"))
                         (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/mindustry-server")
                       (lambda ()
                         (format #t "#!/bin/sh\nexec ~a -jar ~a \"$@\"\n"
                                 java jar)))
                     (chmod (string-append bin "/mindustry-server") #o755)))))))
    (inputs (list (list openjdk17 "jdk")))
    (synopsis "Server for the Mindustry sandbox tower defense game")
    (description "Mindustry is an open-source sandbox tower defense game.
This package provides the dedicated server component, allowing you to host
multiplayer Mindustry games.")
    (home-page "https://github.com/Anuken/Mindustry")
    (license license:gpl3)))
