;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408t
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 10 compat aliases (mapping bare names to existing -bin recipes)
;;;   - 5 new recipes (AppImage binary repacks, C/Make source, library)
;;;   - 15 re-evaluated with specific blocking reasons (see blocked-notes)
;;;
;;; Compat aliases (10):
;;;   - localsend: alias → localsend-bin (localsend-bin.scm)
;;;   - juliaup: alias → juliaup-bin (recipe-resolver-260407e)
;;;   - mindustry: alias → mindustry-bin (recipe-resolver-260407e)
;;;   - lidarr: alias → lidarr-bin (recipe-resolver-260407e)
;;;   - zl-equalizer: alias → zl-equalizer-bin (recipe-resolver-260407e)
;;;   - wallchemy: alias → wallchemy-bin (recipe-resolver-260407g)
;;;   - atlauncher: alias → atlauncher-bin (recipe-resolver-260407e)
;;;   - kopia: alias → kopia-bin (recipe-resolver-260407g)
;;;   - kopia-ui: alias → kopia-ui-bin (recipe-resolver-260408a)
;;;   - playit: alias → playit-bin (recipe-resolver-260408o)
;;;
;;; New recipes (5):
;;;   - arduino-ctags: Arduino-specific ctags fork (C/Make source)
;;;   - notesnook-bin: encrypted note-taking app (AppImage)
;;;   - jellyfin-desktop-bin: Jellyfin media player (deb binary)
;;;   - libsmb2: SMB2/3 userspace client library (C/CMake source)
;;;   - playit-agent-bin: playit.gg tunnel agent (pre-built binary)
;;;
;;; Re-evaluated (blocked with specific reasons, 15):
;;;   - nordvpn-gui-bin, aurutils-git, octopi-git, parui-git,
;;;     mangowm-git, caelestia-shell-git, android_translation_layer-git,
;;;     lceda-pro-bin, feishu-bin, shutter-encoder-bin, opendeck-git,
;;;     savestate-bin, tosu-overlay-git, python-urllib3-future,
;;;     python-niquests
;;;
;;; NOTE: All sha256 hashes verified via guix download / guix hash.

(define-module (gaurix packages recipe-resolver-260408t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gaurix packages localsend-bin)
  #:use-module (gaurix packages recipe-resolver-260407e)
  #:use-module (gaurix packages recipe-resolver-260407g)
  #:use-module (gaurix packages recipe-resolver-260408a)
  #:use-module (gaurix packages recipe-resolver-260408o)
  #:export (
            ;; compat aliases
            localsend
            juliaup
            mindustry
            lidarr
            zl-equalizer
            wallchemy
            atlauncher
            kopia
            kopia-ui
            playit
            ;; new recipes
            arduino-ctags
            notesnook-bin
            jellyfin-desktop-bin
            libsmb2
            playit-agent-bin))

;;;
;;; ── Compat aliases ───────────────────────────────────────────────
;;; Map bare package names to existing -bin recipes so that
;;; `guix show <name>` resolves correctly.
;;;

(define-public localsend
  (package
    (inherit localsend-bin)
    (name "localsend")))

(define-public juliaup
  (package
    (inherit juliaup-bin)
    (name "juliaup")))

(define-public mindustry
  (package
    (inherit mindustry-bin)
    (name "mindustry")))

(define-public lidarr
  (package
    (inherit lidarr-bin)
    (name "lidarr")))

(define-public zl-equalizer
  (package
    (inherit zl-equalizer-bin)
    (name "zl-equalizer")))

(define-public wallchemy
  (package
    (inherit wallchemy-bin)
    (name "wallchemy")))

(define-public atlauncher
  (package
    (inherit atlauncher-bin)
    (name "atlauncher")))

(define-public kopia
  (package
    (inherit kopia-bin)
    (name "kopia")))

(define-public kopia-ui
  (package
    (inherit kopia-ui-bin)
    (name "kopia-ui")))

(define-public playit
  (package
    (inherit playit-bin)
    (name "playit")))

;;;
;;; ── arduino-ctags ────────────────────────────────────────────────
;;; Arduino ctags — C/C++ tag generator for Arduino IDE
;;;
(define-public arduino-ctags
  (package
    (name "arduino-ctags")
    (version "5.8-arduino11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arduino/ctags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c4qk8qj8j0ar20921ix9v8agqlfrqfmq4vrb1x462qlcjnb7as4"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/arduino/ctags")
    (synopsis "Arduino-specific fork of Exuberant Ctags for C/C++ parsing")
    (description
     "This is an Arduino-specific fork of Exuberant Ctags that provides
improved C/C++ tag generation tailored for Arduino IDE.  It produces tag
files used by the Arduino IDE to resolve symbols and provide code navigation
in sketches and libraries.")
    (license license:gpl2+)))

;;;
;;; ── notesnook-bin ────────────────────────────────────────────────
;;; Notesnook — end-to-end encrypted note taking
;;;
(define-public notesnook-bin
  (package
    (name "notesnook-bin")
    (version "3.3.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/streetwriters/notesnook/releases/download/v"
             version "/notesnook_linux_x86_64.AppImage"))
       (sha256
        (base32 "16zhk6mz4b1k1mcxxa2png4gxy71dnzn6kfcd2kvvyvrv6z91i8j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("notesnook" "bin/notesnook"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "notesnook")
                   (chmod "notesnook" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/notesnook"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://notesnook.com")
    (synopsis "end-to-end encrypted note-taking application")
    (description
     "Notesnook is an open-source, end-to-end encrypted note-taking
application.  All notes are encrypted on the client before being synced
to Notesnook servers.  It supports rich text editing, notebooks, tags,
and cross-device sync.  This package provides the pre-built Electron
desktop application as an AppImage.")
    (license license:gpl3+)))

;;;
;;; ── jellyfin-desktop-bin ─────────────────────────────────────────
;;; Jellyfin Media Player — desktop client for Jellyfin
;;;
(define-public jellyfin-desktop-bin
  (package
    (name "jellyfin-desktop-bin")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jellyfin/jellyfin-media-player/"
             "releases/download/v" version
             "/jellyfin-media-player_" version "-bookworm.deb"))
       (sha256
        (base32 "1b97d2amp8bjf1y8wgacgh4mz3zlrdxa8s7fqmhrb8591c2lj0nv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/lib/jellyfin-media-player" "lib/jellyfin-media-player/")
          ("usr/share" "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append
                          out "/lib/jellyfin-media-player/jellyfinmediaplayer")
                         (string-append out "/bin/jellyfin-media-player"))))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jellyfin.org")
    (synopsis "desktop media player client for the Jellyfin media server")
    (description
     "Jellyfin Media Player is a desktop client for the Jellyfin media
server, based on Plex Media Player and MPV.  It provides native playback
of media hosted on a Jellyfin server with hardware-accelerated decoding,
subtitle support, and a web-based UI.  This package provides the pre-built
Debian binary.")
    (license license:gpl2)))

;;;
;;; ── libsmb2 ──────────────────────────────────────────────────────
;;; libsmb2 — SMB2/3 userspace client library
;;;
(define-public libsmb2
  (package
    (name "libsmb2")
    (version "6.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sahlberg/libsmb2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cjigz4hslfkq72xr2sfp9759gn75jz4lwk8nnn0y8x51y0sshrv"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/sahlberg/libsmb2")
    (synopsis "userspace client library for accessing SMB2/3 shares")
    (description
     "Libsmb2 is a userspace client library for accessing SMB2/3 shares
on a network.  It provides both synchronous and asynchronous APIs for
connecting to SMB servers, reading and writing files, and enumerating
directory contents.  It supports SMB2 and SMB3 protocols with
encryption and signing.")
    (license license:lgpl2.1+)))

;;;
;;; ── playit-agent-bin ─────────────────────────────────────────────
;;; playit.gg tunnel agent — game server hosting
;;;
(define-public playit-agent-bin
  (package
    (name "playit-agent-bin")
    (version "0.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/playit-cloud/playit-agent/releases/download/v"
             version "/playit-linux-amd64"))
       (sha256
        (base32 "0md5z0j63vscizgnbf6fzl2rk1zyyjhxbph6db1kw7majcyld3g7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("playit" "bin/playit"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "playit")
                   (chmod "playit" #o755)))
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out"))
                         (patchelf (search-input-file inputs "bin/patchelf"))
                         (ld-linux (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")))
                     (invoke patchelf "--set-interpreter" ld-linux
                             (string-append out "/bin/playit"))))))))
    (native-inputs (list patchelf))
    (supported-systems '("x86_64-linux"))
    (home-page "https://playit.gg")
    (synopsis "tunnel agent for hosting game servers behind NAT")
    (description
     "Playit is a tunnel agent that allows hosting game servers accessible
from the internet without port forwarding.  It creates encrypted tunnels
from your local game server to playit.gg relay servers, supporting
Minecraft, Terraria, and other game servers.  This package provides the
pre-built Linux binary.")
    (license license:bsd-2)))
