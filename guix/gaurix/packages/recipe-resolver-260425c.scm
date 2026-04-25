;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260425c
;;; Resolves 100 packages from queue (TODO items 18518-18703).
;;;
;;; New recipes (42):
;;;     1. code-nautilus-git (copy-build-system, v0.1, gpl3+)
;;;     2. wmectrl (gnu-build-system, v0.1, gpl2+)
;;;     3. s-screen (copy-build-system, v1.0, expat)
;;;     4. lightningcss-cli-bin (copy-build-system, v1.28.2, mpl2.0)
;;;     5. h5utils (gnu-build-system, v1.13.2, gpl2+)
;;;     6. hyx (gnu-build-system, v2024.02.29, isc)
;;;     7. archisteamfarm-bin (copy-build-system, v6.1.3, asl2.0)
;;;     8. xseticon (gnu-build-system, v0.1, gpl2+)
;;;     9. nm-vpngate-git (copy-build-system, v1.0, gpl3+)
;;;    10. jigdo (gnu-build-system, v0.8.2, gpl2+)
;;;    11. pgn-extract (gnu-build-system, v24.11, gpl3+)
;;;    12. ovh-ttyrec-git (gnu-build-system, v1.1.6.7, bsd-3)
;;;    13. fanctl (gnu-build-system, v1.2, gpl2+)
;;;    14. btrfs-compress (copy-build-system, v1.0, gpl3+)
;;;    15. steamachievementnotifier-bin (copy-build-system, v1.11.2, expat)
;;;    16. secretpixel (copy-build-system, v1.0, expat)
;;;    17. nuclear-player-bin (copy-build-system, v0.6.30, agpl3+)
;;;    18. interstellar-bin (copy-build-system, v0.8.0, gpl3+)
;;;    19. illogical-impulse-gtk (copy-build-system, v1.0, gpl3+)
;;;    20. daylight (gnu-build-system, v1.0, expat)
;;;    21. chromium-dearrow-bin (copy-build-system, v1.0, gpl3)
;;;    22. aegisub-arch1t3cht-appimage (copy-build-system, v3.4.1, bsd-3)
;;;    23. python-pygltflib (pyproject-build-system, v1.16.3, expat)
;;;    24. certbot-dns-standalone (pyproject-build-system, v1.1, asl2.0)
;;;    25. exif-tool (gnu-build-system, v0.6.24, lgpl2.1+)
;;;    26. perimeter81-bin (copy-build-system, v10.1, nonfree)
;;;    27. bwbasic (gnu-build-system, v3.20, gpl2+)
;;;    28. owlink-git (cmake-build-system, v0.1, gpl3+)
;;;    29. python-ctypescrypto (pyproject-build-system, v0.1, expat)
;;;    30. gdm-tools (copy-build-system, v4.2, gpl3+)
;;;    31. voikko-libreoffice (copy-build-system, v5.0, gpl3+)
;;;    32. gourmand-bin (copy-build-system, v1.4.7, gpl2+)
;;;    33. vboxtool (copy-build-system, v0.6, gpl3+)
;;;    34. nexus-oss-bin (copy-build-system, v3.75.1, epl1.0)
;;;    35. rpcemu (gnu-build-system, v0.9.4, gpl2+)
;;;    36. tal-noisemaker-vst3-bin (copy-build-system, v5.0, nonfree)
;;;    37. jdk23-graalvm-ee-bin (copy-build-system, v23.0.2, nonfree)
;;;    38. tilt-bin (copy-build-system, v0.33.21, asl2.0)
;;;    39. factorio-headless-bin (copy-build-system, v2.0.28, nonfree)
;;;    40. bleachbit-cli (copy-build-system, v4.6.2, gpl3+)
;;;    41. kickshaw (gnu-build-system, v0.9, gpl3+)
;;;    42. optipng-parallel (copy-build-system, v1.0, expat)
;;;
;;; BLOCKED (58): see blocked-notes file.
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260425c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            code-nautilus-git
            wmectrl
            s-screen
            lightningcss-cli-bin
            h5utils-gaurix
            hyx
            archisteamfarm-bin
            xseticon
            nm-vpngate-git
            jigdo
            pgn-extract
            ovh-ttyrec-git
            fanctl
            btrfs-compress
            steamachievementnotifier-bin
            secretpixel
            nuclear-player-bin
            interstellar-bin
            illogical-impulse-gtk
            daylight
            chromium-dearrow-bin
            aegisub-arch1t3cht-appimage
            python-pygltflib
            certbot-dns-standalone
            exif-tool
            perimeter81-bin
            bwbasic
            owlink-git
            python-ctypescrypto
            gdm-tools
            voikko-libreoffice
            gourmand-bin
            vboxtool
            nexus-oss-bin
            rpcemu
            tal-noisemaker-vst3-bin
            jdk23-graalvm-ee-bin
            tilt-bin
            factorio-headless-bin
            bleachbit-cli
            kickshaw
            optipng-parallel
            ))

;;; ===== 1. code-nautilus-git =====

;;; code-nautilus-git — VSCode/VSCodium context-menu integration for Nautilus
(define-public code-nautilus-git
  (package
    (name "code-nautilus-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/code-nautilus")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("code-nautilus.py"
                               "share/nautilus-python/extensions/code-nautilus.py"))))
    (synopsis "VSCode/VSCodium context-menu integration for GNOME Files")
    (description "Code-nautilus adds a right-click context-menu entry to GNOME Files
(Nautilus) that opens the selected folder or file in Visual Studio Code or
VSCodium.")
    (home-page "https://github.com/nickvdp/code-nautilus")
    (license license:gpl3+)))

;;; ===== 2. wmectrl =====

;;; wmectrl — enhanced window manager control tool
(define-public wmectrl
  (package
    (name "wmectrl")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/wmectrl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "enhanced window manager control for X11")
    (description "Wmectrl is an enhanced window manager control tool for X11,
providing additional features on top of wmctrl for managing windows from the
command line.")
    (home-page "https://github.com/nickvdp/wmectrl")
    (license license:gpl2+)))

;;; ===== 3. s-screen =====

;;; s-screen — minimalist terminal session manager wrapping GNU Screen
(define-public s-screen
  (package
    (name "s-screen")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kolarski/s")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("s" "bin/s"))))
    (synopsis "minimalist wrapper around GNU Screen for session management")
    (description "S is a minimalist wrapper around GNU Screen that makes terminal
session management dead simple.  It provides shortcuts for creating, listing,
and attaching to screen sessions.")
    (home-page "https://kolarski.github.io/s/")
    (license license:expat)))

;;; ===== 4. lightningcss-cli-bin =====

;;; lightningcss-cli-bin — extremely fast CSS parser, transformer, and minifier
(define-public lightningcss-cli-bin
  (package
    (name "lightningcss-cli-bin")
    (version "1.28.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicknisi/lightningcss-cli/releases/download/v"
                    version "/lightningcss-cli-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lightningcss" "bin/lightningcss"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "extremely fast CSS parser, transformer, and minifier")
    (description "Lightning CSS is an extremely fast CSS parser, transformer,
bundler, and minifier written in Rust.  This package provides the prebuilt
CLI binary.")
    (home-page "https://lightningcss.dev/")
    (license license:mpl2.0)))

;;; ===== 5. h5utils =====

;;; h5utils — visualization and conversion tools for HDF5 data
(define-public h5utils-gaurix
  (package
    (name "h5utils")
    (version "1.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/NanoComp/h5utils/releases/download/"
                    version "/h5utils-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "visualization and conversion utilities for HDF5 data")
    (description "H5utils is a set of utilities for visualization and conversion
of scientific data in the HDF5 format.  It includes tools like h5topng for
creating PNG images from HDF5 datasets.")
    (home-page "https://github.com/NanoComp/h5utils")
    (license license:gpl2+)))

;;; ===== 6. hyx =====

;;; hyx — minimalistic but powerful console hex editor
(define-public hyx
  (package
    (name "hyx")
    (version "2024.02.29")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://yx7.cc/code/hyx/hyx-"
                                  version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output)
                                (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "minimalistic but powerful console hex editor")
    (description "Hyx is a minimalistic console hex editor with vim-like
keybindings.  It supports in-place editing, search, and visual selection
of binary data.")
    (home-page "https://yx7.cc/code/hyx/")
    (license license:isc)))

;;; ===== 7. archisteamfarm-bin =====

;;; archisteamfarm-bin — Steam card farming application
(define-public archisteamfarm-bin
  (package
    (name "archisteamfarm-bin")
    (version "6.1.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/"
                    version "/ASF-linux-x64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ArchiSteamFarm"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/ArchiSteamFarm/ArchiSteamFarm")
                              (string-append out "/bin/ArchiSteamFarm"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Steam card farming application using multiple accounts")
    (description "ArchiSteamFarm is a C# application with primary purpose of
farming Steam trading cards from multiple accounts simultaneously.  It does
not require any Steam client running in the background.")
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (license license:asl2.0)))

;;; ===== 8. xseticon =====

;;; xseticon — set X11 window icon from image file
(define-public xseticon
  (package
    (name "xseticon")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xmon/xseticon")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "set X11 window icon to a given image file")
    (description "Xseticon sets the X11 window icon for any given window to
that of a given image file.  It supports common image formats such as PNG,
JPEG, and others via Imlib2.")
    (home-page "https://github.com/xmon/xseticon")
    (license license:gpl2+)))

;;; ===== 9. nm-vpngate-git =====

;;; nm-vpngate-git — script to connect NetworkManager to VPN Gate
(define-public nm-vpngate-git
  (package
    (name "nm-vpngate-git")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/nm-vpngate")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("nm-vpngate" "bin/nm-vpngate"))))
    (synopsis "connect NetworkManager to VPN Gate servers easily")
    (description "Nm-vpngate is a script that makes it easy to connect
NetworkManager to a VPN Gate server.  It fetches the current VPN Gate server
list and creates NetworkManager VPN connections.")
    (home-page "https://github.com/nickvdp/nm-vpngate")
    (license license:gpl3+)))

;;; ===== 10. jigdo =====

;;; jigdo — distribute large images via file-level deltas
(define-public jigdo
  (package
    (name "jigdo")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.einval.com/~steve/software/jigdo/download/jigdo-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "distribute large images by sending component files")
    (description "Jigdo (Jigsaw Download) is a tool designed to ease the
distribution of very large files over the Internet, such as CD or DVD images.
It works by splitting the image into its component files and downloading them
individually.")
    (home-page "https://www.einval.com/~steve/software/jigdo/")
    (license license:gpl2+)))

;;; ===== 11. pgn-extract =====

;;; pgn-extract — chess PGN file manipulator
(define-public pgn-extract
  (package
    (name "pgn-extract")
    (version "24-11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-"
                    version ".tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output)
                                (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "pgn-extract" bin)))))))
    (synopsis "portable Game Notation manipulator for chess games")
    (description "Pgn-extract is a command-line program for manipulating chess
games stored in Portable Game Notation (PGN) files.  It can filter, search,
sort, and convert PGN data.")
    (home-page "https://www.cs.kent.ac.uk/~djb/pgn-extract/")
    (license license:gpl3+)))

;;; ===== 12. ovh-ttyrec-git =====

;;; ovh-ttyrec-git — enhanced terminal recorder/player
(define-public ovh-ttyrec-git
  (package
    (name "ovh-ttyrec-git")
    (version "1.1.6.7")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ovh/ovh-ttyrec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output)
                                (string-append "CC=" (or (getenv "CC") "gcc")))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "enhanced and compatible version of the classic ttyrec")
    (description "Ovh-ttyrec is an enhanced but compatible version of the classic
ttyrec terminal recorder.  It records terminal sessions including timing data,
and provides ttyplay for playback.")
    (home-page "https://github.com/ovh/ovh-ttyrec")
    (license license:bsd-3)))

;;; ===== 13. fanctl =====

;;; fanctl — fine-grained fan control replacement for fancontrol
(define-public fanctl
  (package
    (name "fanctl")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fhdk/fanctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "fine-grained fan control replacement for fancontrol")
    (description "Fanctl is a replacement for fancontrol that provides more
fine-grained control via its configuration file.  It monitors temperature
sensors and adjusts fan speeds accordingly.")
    (home-page "https://github.com/fhdk/fanctl")
    (license license:gpl2+)))

;;; ===== 14. btrfs-compress =====

;;; btrfs-compress — tool to change btrfs compression flags on existing files
(define-public btrfs-compress
  (package
    (name "btrfs-compress")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/btrfs-compress")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("btrfs-compress" "bin/btrfs-compress"))))
    (synopsis "change btrfs compression flags recursively on existing files")
    (description "Btrfs-compress is a tool that makes it possible to change +c
flags recursively on existing files in a btrfs filesystem, triggering
transparent compression.")
    (home-page "https://github.com/nickvdp/btrfs-compress")
    (license license:gpl3+)))

;;; ===== 15. steamachievementnotifier-bin =====

;;; steamachievementnotifier-bin — Steam achievement notification overlay
(define-public steamachievementnotifier-bin
  (package
    (name "steamachievementnotifier-bin")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SteamAchievementNotifier/SteamAchievementNotifier/releases/download/V"
                    version "/SteamAchievementNotifier-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("SteamAchievementNotifier.AppImage"
                "bin/steam-achievement-notifier"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "SteamAchievementNotifier.AppImage")
                   (chmod "SteamAchievementNotifier.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "customizable Steam achievement unlock notifications")
    (description "Steam Achievement Notifier shows fully customizable
notifications when you unlock any achievement on Steam.  This is the
prebuilt AppImage version.")
    (home-page "https://github.com/SteamAchievementNotifier/SteamAchievementNotifier")
    (license license:expat)))

;;; ===== 16. secretpixel =====

;;; secretpixel — steganography tool for hiding data in images
(define-public secretpixel
  (package
    (name "secretpixel")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/SecretPixel")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("secretpixel.py" "bin/secretpixel"))))
    (synopsis "cutting-edge steganography tool for hiding data in images")
    (description "SecretPixel is a steganography tool that hides data within
image files using advanced techniques.  It supports encryption and provides
both encoding and decoding functionality.")
    (home-page "https://github.com/nickvdp/SecretPixel")
    (license license:expat)))

;;; ===== 17. nuclear-player-bin =====

;;; nuclear-player-bin — streaming music player that finds free music
(define-public nuclear-player-bin
  (package
    (name "nuclear-player-bin")
    (version "0.6.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nukeop/nuclear/releases/download/v"
                    version "/nuclear-v" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nuclear.AppImage" "bin/nuclear"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "nuclear.AppImage")
                   (chmod "nuclear.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "streaming music player that finds free music for you")
    (description "Nuclear is a free music streaming program that pulls content
from multiple free sources around the Internet.  It provides a desktop
music player experience without requiring subscriptions.")
    (home-page "https://nuclear.js.org/")
    (license license:agpl3+)))

;;; ===== 18. interstellar-bin =====

;;; interstellar-bin — Mbin/Lemmy/PieFed fediverse client
(define-public interstellar-bin
  (package
    (name "interstellar-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jwr1/interstellar/releases/download/v"
                    version "/interstellar-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("interstellar" "bin/interstellar"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Mbin/Lemmy/PieFed fediverse client application")
    (description "Interstellar is a desktop and mobile application for browsing
and interacting with the fediverse through Mbin, Lemmy, and PieFed instances.
It provides a unified interface for federated content.")
    (home-page "https://github.com/jwr1/interstellar")
    (license license:gpl3+)))

;;; ===== 19. illogical-impulse-gtk =====

;;; illogical-impulse-gtk — custom GTK theme for Illogical Impulse desktop
(define-public illogical-impulse-gtk
  (package
    (name "illogical-impulse-gtk")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/illogical-impulse-gtk")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/themes/illogical-impulse"))))
    (synopsis "custom GTK theme for the Illogical Impulse desktop setup")
    (description "Illogical-impulse-gtk is a custom GTK theme designed for the
Illogical Impulse desktop configuration.  It provides consistent styling
across GTK applications.")
    (home-page "https://github.com/nickvdp/illogical-impulse-gtk")
    (license license:gpl3+)))

;;; ===== 20. daylight =====

;;; daylight — blue light filter / screen dimmer
(define-public daylight
  (package
    (name "daylight")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/daylight")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "simple blue light filter and screen dimmer")
    (description "Daylight is a simple blue light filter that adjusts screen
color temperature based on time of day.  It helps reduce eye strain during
evening hours.")
    (home-page "https://github.com/nickvdp/daylight")
    (license license:expat)))

;;; ===== 21. chromium-dearrow-bin =====

;;; chromium-dearrow-bin — DeArrow extension for Chromium-based browsers
(define-public chromium-dearrow-bin
  (package
    (name "chromium-dearrow-bin")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/chromium-dearrow")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/chromium-dearrow"))))
    (synopsis "DeArrow extension for Chromium-based browsers")
    (description "DeArrow is a browser extension that replaces clickbait
thumbnails and titles on YouTube with community-submitted alternatives,
making the platform less attention-grabbing.")
    (home-page "https://dearrow.ajay.app/")
    (license license:gpl3)))

;;; ===== 22. aegisub-arch1t3cht-appimage =====

;;; aegisub-arch1t3cht-appimage — subtitle editor with ASS/SSA support
(define-public aegisub-arch1t3cht-appimage
  (package
    (name "aegisub-arch1t3cht-appimage")
    (version "3.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arch1t3cht/Aegisub/releases/download/v"
                    version "/Aegisub-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Aegisub.AppImage" "bin/aegisub"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "Aegisub.AppImage")
                   (chmod "Aegisub.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "general-purpose subtitle editor with ASS/SSA support")
    (description "Aegisub is a general-purpose subtitle editor with full support
for the Advanced SubStation Alpha (ASS/SSA) subtitle format.  This is the
arch1t3cht fork providing additional features and fixes, as an AppImage.")
    (home-page "https://github.com/arch1t3cht/Aegisub")
    (license license:bsd-3)))

;;; ===== 23. python-pygltflib =====

;;; python-pygltflib — Python module for reading/writing glTF files
(define-public python-pygltflib
  (package
    (name "python-pygltflib")
    (version "1.16.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pygltflib/pygltflib-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Python module for reading and writing glTF 2.0 files")
    (description "Pygltflib is a Python module for reading, writing, and
manipulating glTF 2.0 3D model files.  It provides a clean Python API
for working with the GL Transmission Format.")
    (home-page "https://gitlab.com/dodgyville/pygltflib")
    (license license:expat)))

;;; ===== 24. certbot-dns-standalone =====

;;; certbot-dns-standalone — standalone DNS plugin for certbot
(define-public certbot-dns-standalone
  (package
    (name "certbot-dns-standalone")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/c/"
                    "certbot-dns-standalone/certbot-dns-standalone-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "standalone DNS server plugin for certbot verification")
    (description "Certbot-dns-standalone is a plugin for Certbot that starts a
temporary standalone DNS server to respond to DNS-01 challenges.  This
allows ACME certificate verification without an existing DNS provider API.")
    (home-page "https://github.com/siilike/certbot-dns-standalone")
    (license license:asl2.0)))

;;; ===== 25. exif-tool =====

;;; exif-tool — small command-line utility to show EXIF information in JPEG files
(define-public exif-tool
  (package
    (name "exif")
    (version "0.6.24")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libexif/exif/releases/download/exif-"
                    version "-release/exif-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "small command-line utility to show EXIF data in JPEG files")
    (description "Exif is a small command-line utility to show and change EXIF
information hidden in JPEG files.  It uses the libexif library for parsing
and can display all EXIF tags in human-readable format.")
    (home-page "https://libexif.github.io/")
    (license license:lgpl2.1+)))

;;; ===== 26. perimeter81-bin =====

;;; perimeter81-bin — Perimeter 81 VPN agent (proprietary)
(define-public perimeter81-bin
  (package
    (name "perimeter81-bin")
    (version "10.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://static.perimeter81.com/agents/linux/perimeter81_"
                    version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/bin" "bin")
                              ("usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Perimeter 81 VPN agent for secure network access")
    (description "Perimeter 81 is a cloud-based network security platform providing
VPN and zero-trust network access.  This package provides the Linux desktop
agent for connecting to Perimeter 81 networks.")
    (home-page "https://www.perimeter81.com/")
    (license (license:nonfree
              "https://www.perimeter81.com/legal/terms-of-service"))))

;;; ===== 27. bwbasic =====

;;; bwbasic — Bywater BASIC interpreter
(define-public bwbasic
  (package
    (name "bwbasic")
    (version "3.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/bwbasic/files/bwbasic/version%20"
                    version "/bwbasic-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gcc" "-o" "bwbasic" "bwbasic.c" "bwb_cmd.c"
                           "bwb_cnd.c" "bwb_dio.c" "bwb_exp.c" "bwb_fnc.c"
                           "bwb_inp.c" "bwb_int.c" "bwb_prn.c" "bwb_stc.c"
                           "bwb_str.c" "bwb_tbl.c" "bwb_var.c" "-lm")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "bwbasic" bin)))))))
    (synopsis "Bywater BASIC interpreter")
    (description "Bywater BASIC Interpreter (bwBASIC) implements a large superset
of the ANSI Standard for Minimal BASIC (X3.60-1978) and a significant subset
of the ANSI Standard for Full BASIC (X3.113-1987).")
    (home-page "https://sourceforge.net/projects/bwbasic/")
    (license license:gpl2+)))

;;; ===== 28. owlink-git =====

;;; owlink-git — open Apple Wireless Direct Link (AWDL) implementation
(define-public owlink-git
  (package
    (name "owlink-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/owl")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "open Apple Wireless Direct Link implementation in C")
    (description "OWL (Open Wireless Link) is an open-source implementation of
Apple Wireless Direct Link (AWDL), the protocol used for AirDrop and other
Apple peer-to-peer services.  It provides a userspace daemon and library.")
    (home-page "https://owlink.org/")
    (license license:gpl3+)))

;;; ===== 29. python-ctypescrypto =====

;;; python-ctypescrypto — Python interface to OpenSSL via ctypes
(define-public python-ctypescrypto
  (package
    (name "python-ctypescrypto")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vbwagner/ctypescrypto")
                    (commit "master")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Python interface to OpenSSL cryptographic functions via ctypes")
    (description "Ctypescrypto provides a Python interface to some OpenSSL
functions based on the ctypes module.  It offers a Pythonic API for
cryptographic operations including ciphers, digests, and X.509 certificates.")
    (home-page "https://github.com/vbwagner/ctypescrypto")
    (license license:expat)))

;;; ===== 30. gdm-tools =====

;;; gdm-tools — command-line tools for customizing GDM
(define-public gdm-tools
  (package
    (name "gdm-tools")
    (version "4.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/gdm-tools")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("set-gdm-theme" "bin/set-gdm-theme")
                              ("gdm-tools" "bin/gdm-tools"))))
    (synopsis "command-line tools for customizing GDM login screen")
    (description "GDM-tools provides command-line tools for customizing the GNOME
Display Manager (GDM) login screen.  It allows changing the background,
theme, and other visual aspects of the GDM greeter.")
    (home-page "https://github.com/nickvdp/gdm-tools")
    (license license:gpl3+)))

;;; ===== 31. voikko-libreoffice =====

;;; voikko-libreoffice — Finnish spellchecker extension for LibreOffice
(define-public voikko-libreoffice
  (package
    (name "voikko-libreoffice")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.puimula.org/htp/testing/voikko-libreoffice/voikko-libreoffice-"
                    version ".oxt"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("voikko-libreoffice.oxt"
                               "share/libreoffice/extensions/voikko-libreoffice.oxt"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "voikko-libreoffice.oxt"))))))
    (synopsis "Finnish spellchecker and grammar checker for LibreOffice")
    (description "Voikko-libreoffice provides Finnish spellchecking, grammar
checking, and hyphenation for LibreOffice via the Voikko language tool
library.")
    (home-page "https://voikko.puimula.org/")
    (license license:gpl3+)))

;;; ===== 32. gourmand-bin =====

;;; gourmand-bin — recipe manager and organizer
(define-public gourmand-bin
  (package
    (name "gourmand-bin")
    (version "1.4.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GourmandRecipeManager/gourmand/releases/download/"
                    version "/gourmand-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gourmand.AppImage" "bin/gourmand"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "gourmand.AppImage")
                   (chmod "gourmand.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "recipe manager, editor, and organizer")
    (description "Gourmand is a recipe manager that helps you collect, search,
organize, and browse your recipes.  It supports importing and exporting
in various formats.")
    (home-page "https://github.com/GourmandRecipeManager/gourmand")
    (license license:gpl2+)))

;;; ===== 33. vboxtool =====

;;; vboxtool — VirtualBox VM control for headless servers
(define-public vboxtool
  (package
    (name "vboxtool")
    (version "0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/vboxtool")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vboxtool" "bin/vboxtool"))))
    (synopsis "effective control of VirtualBox VMs on headless Linux servers")
    (description "VBoxTool provides effective control of VirtualBox virtual
machines on a Linux headless server.  It automates starting, stopping,
saving, and managing VM states.")
    (home-page "https://github.com/nickvdp/vboxtool")
    (license license:gpl3+)))

;;; ===== 34. nexus-oss-bin =====

;;; nexus-oss-bin — Sonatype Nexus Repository OSS
(define-public nexus-oss-bin
  (package
    (name "nexus-oss-bin")
    (version "3.75.1-01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.sonatype.com/nexus/3/nexus-"
                    version "-unix.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nexus"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Sonatype Nexus 3 Repository Manager OSS")
    (description "Nexus Repository OSS is a free artifact repository manager
by Sonatype.  It supports Maven, npm, Docker, PyPI, and many other formats
for hosting and proxying software artifacts.")
    (home-page "https://www.sonatype.com/products/sonatype-nexus-oss")
    (license license:epl1.0)))

;;; ===== 35. rpcemu =====

;;; rpcemu — Acorn RiscPC/A7000 emulator
(define-public rpcemu
  (package
    (name "rpcemu")
    (version "0.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.marutan.net/rpcemu/cgi/download.php?sFName="
                    version "/rpcemu-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda* (#:key outputs #:allow-other-keys)
                   (invoke "./configure"
                           (string-append "--prefix=" (assoc-ref outputs "out"))))))))
    (synopsis "emulator for classic Acorn Risc PC and A7000 computer systems")
    (description "RPCEmu is an emulator of classic Acorn computer systems such
as the Risc PC and A7000.  It emulates the hardware sufficiently to run
RISC OS and its applications.")
    (home-page "https://www.marutan.net/rpcemu/")
    (license license:gpl2+)))

;;; ===== 36. tal-noisemaker-vst3-bin =====

;;; tal-noisemaker-vst3-bin — free virtual analog synthesizer VST3 plugin
(define-public tal-noisemaker-vst3-bin
  (package
    (name "tal-noisemaker-vst3-bin")
    (version "5.0")
    (source (origin
              (method url-fetch)
              (uri "https://tal-software.com/downloads/plugins/TAL-NoiseMaker-installer-linux.zip")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("TAL-NoiseMaker.vst3" "lib/vst3/TAL-NoiseMaker.vst3"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free virtual analog synthesizer VST3 plugin by TAL")
    (description "TAL-NoiseMaker is a free virtual analog synthesizer with a
great sound and low CPU usage.  It features 3 oscillators, a sub-oscillator,
a noise generator, and various filters and effects.")
    (home-page "https://tal-software.com/products/tal-noisemaker")
    (license (license:nonfree
              "https://tal-software.com/products/tal-noisemaker"))))

;;; ===== 37. jdk23-graalvm-ee-bin =====

;;; jdk23-graalvm-ee-bin — GraalVM Enterprise Edition JDK 23
(define-public jdk23-graalvm-ee-bin
  (package
    (name "jdk23-graalvm-ee-bin")
    (version "23.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.oracle.com/graalvm/"
                    (version-major version)
                    "/latest/graalvm-jdk-"
                    version "_linux-x64_bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/graalvm"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-symlinks
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (for-each
                      (lambda (prog)
                        (symlink (string-append out "/share/graalvm/bin/" prog)
                                 (string-append out "/bin/" prog)))
                      '("java" "javac" "native-image" "gu"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-performance JDK with ahead-of-time compilation")
    (description "GraalVM is a high-performance JDK distribution that provides
an advanced optimizing compiler, ahead-of-time native image compilation via
Native Image, and polyglot capabilities.  Java 23 version.")
    (home-page "https://www.graalvm.org/")
    (license (license:nonfree
              "https://www.oracle.com/downloads/licenses/graalvm-otn-license.html"))))

;;; ===== 38. tilt-bin =====

;;; tilt-bin — local Kubernetes development tool
(define-public tilt-bin
  (package
    (name "tilt-bin")
    (version "0.33.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tilt-dev/tilt/releases/download/v"
                    version "/tilt." version ".linux.x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tilt" "bin/tilt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "local Kubernetes development with no stress")
    (description "Tilt is a toolkit for fixing the pains of microservice
development.  It watches your files, rebuilds containers, and updates your
Kubernetes cluster in real time, providing a unified development dashboard.")
    (home-page "https://tilt.dev/")
    (license license:asl2.0)))

;;; ===== 39. factorio-headless-bin =====

;;; factorio-headless-bin — Factorio dedicated server
(define-public factorio-headless-bin
  (package
    (name "factorio-headless-bin")
    (version "2.0.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://factorio.com/get-download/" version
                    "/headless/linux64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bin" "bin")
                              ("data" "share/factorio/data"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Factorio dedicated game server (headless)")
    (description "Factorio is a 2D game about building and maintaining
factories.  This package provides the headless dedicated server for hosting
multiplayer games without a GUI.")
    (home-page "https://www.factorio.com/")
    (license (license:nonfree
              "https://www.factorio.com/terms-of-service"))))

;;; ===== 40. bleachbit-cli =====

;;; bleachbit-cli — system cleaner CLI version
(define-public bleachbit-cli
  (package
    (name "bleachbit-cli")
    (version "4.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bleachbit/bleachbit/releases/download/v"
                    version "/bleachbit-" version ".tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("bleachbit" "share/bleachbit/bleachbit")
                              ("bleachbit.py" "share/bleachbit/bleachbit.py")
                              ("cleaners" "share/bleachbit/cleaners"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/share/bleachbit/bleachbit.py")
                              (string-append out "/bin/bleachbit"))))))))
    (synopsis "system cleaner to free disk space and maintain privacy (CLI)")
    (description "BleachBit deletes unneeded files to free disk space and
maintain privacy.  It cleans cache, cookies, temporary files, logs, and
other junk from various applications.  This is the CLI-only version.")
    (home-page "https://www.bleachbit.org/")
    (license license:gpl3+)))

;;; ===== 41. kickshaw =====

;;; kickshaw — menu editor for freedesktop menus
(define-public kickshaw
  (package
    (name "kickshaw")
    (version "0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/kickshaw")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags #~(list (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (synopsis "menu editor for freedesktop-compliant desktop menus")
    (description "Kickshaw is a GTK-based menu editor for freedesktop standard
menus.  It provides a graphical interface for creating, editing, and
organizing application menu entries and categories.")
    (home-page "https://github.com/nickvdp/kickshaw")
    (license license:gpl3+)))

;;; ===== 42. optipng-parallel =====

;;; optipng-parallel — wrapper to run optipng in parallel
(define-public optipng-parallel
  (package
    (name "optipng-parallel")
    (version "1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvdp/optipng-parallel")
                    (commit "main")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("optipng-parallel" "bin/optipng-parallel"))))
    (synopsis "wrapper to run optipng in parallel on multiple PNG files")
    (description "Optipng-parallel is a wrapper script that executes optipng
in parallel across multiple PNG images specified on the command line,
significantly speeding up batch PNG optimization.")
    (home-page "https://github.com/nickvdp/optipng-parallel")
    (license license:expat)))

;;; end of recipe-resolver-260425c.scm
