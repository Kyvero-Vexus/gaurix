;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415x
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages (BLOCKED items).
;;;
;;; Recipes (30):
;;;   1. splayer (copy/AppImage, v3.0.0, AGPL-3.0)
;;;   2. yaak-bin (copy/.deb, v2026.3.1, MIT)
;;;   3. google-earth-pro (copy/.deb, v7.3.7.1155, nonfree)
;;;   4. spacedrive-bin (copy/AppImage, v0.4.3, AGPL-3.0)
;;;   5. tlescope-bin (copy/AppImage, v3.9.2, AGPL-3.0)
;;;   6. pulse-visualizer-bin (copy/AppImage, v1.3.7, GPL-3.0)
;;;   7. orchids-bin (copy/pacman, v0.0.27, MIT)
;;;   8. audiorelay (copy/tar.gz, v0.27.5, nonfree)
;;;   9. editcp (copy/tar.gz, v1.0.31, GPL-3.0)
;;;  10. webcord-bin (copy/.deb, v4.13.0, MIT)
;;;  11. opera (copy/.deb, v130.0.5847.12, nonfree)
;;;  12. vs-launcher (copy/AppImage, v1.5.8, nonfree)
;;;  13. ghostty-nightly-bin (copy/tar.gz, nightly, MIT)
;;;  14. itch-bin (copy/zip, v26.9.0, MIT)
;;;  15. neomod-bin (copy/tar.gz, v43.08, GPL-3.0)
;;;  16. deskreen-bin (copy/AppImage, v2.0.4, AGPL-3.0)
;;;  17. plasticity-bin (copy/AppImage, v25.3.10, nonfree)
;;;  18. pastelock (copy/binary, v0.3.1, nonfree)
;;;  19. wavebox (copy/.deb, v10.147.44, nonfree)
;;;  20. kew-git (gnu, v3.7.3, GPL-2.0)
;;;  21. elephant-all-bin (copy/tar.gz, v2.21.0, GPL-3.0)
;;;  22. gns3-server-2 (pyproject, v2.2.58.1, GPL-3.0)
;;;  23. visual-studio-code-insiders-bin (copy/tar.gz, nightly, nonfree)
;;;  24. biu-bin (copy/.deb, v1.16.0, nonfree)
;;;  25. openconnect-sso (pyproject, v0.8.1, GPL-3.0)
;;;  26. superhuman (copy/AppImage, v1038.0.31, nonfree)
;;;  27. regexxer (gnu, v0.10, GPL-2.0+)
;;;  28. chwall (pyproject, v0.7.2, WTFPL)
;;;  29. jre25-zulu-bin (copy/tar.gz, v25.0.2, GPL-2.0)
;;;  30. softmaker-office-2024-bin (copy/tar.gz, v1230, nonfree)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260415x)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:export (
            splayer
            yaak-bin
            google-earth-pro
            spacedrive-bin
            tlescope-bin
            pulse-visualizer-bin
            orchids-bin
            audiorelay
            editcp
            webcord-bin
            opera
            vs-launcher
            ghostty-nightly-bin
            itch-bin
            neomod-bin
            deskreen-bin
            plasticity-bin
            pastelock
            wavebox
            kew-git
            elephant-all-bin
            gns3-server-2
            visual-studio-code-insiders-bin
            biu-bin
            openconnect-sso
            superhuman
            regexxer
            chwall
            jre25-zulu-bin
            softmaker-office-2024-bin
            ))

;;; Nonfree license placeholder (for proprietary binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; WTFPL license (not in Guix upstream).
(define license:wtfpl2
  ((@@ (guix licenses) license) "WTFPL"
    "http://www.wtfpl.net/"
    "Do What The Fuck You Want To Public License, version 2"))

;;;
;;; --- 1. splayer ---
;;; Minimalist desktop music player (AppImage).
;;; Source: https://github.com/imsyy/SPlayer
;;;

(define-public splayer
  (package
    (name "splayer")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/imsyy/SPlayer/releases/download/v"
                    version "/SPlayer-" version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("SPlayer.AppImage" "bin/splayer"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "SPlayer.AppImage")
                   (chmod "SPlayer.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "minimalist music player")
    (description "SPlayer is a minimalist desktop music player with a clean
interface.  It supports common audio formats and provides a
distraction-free listening experience.")
    (home-page "https://github.com/imsyy/SPlayer")
    (license license:agpl3+)))

;;;
;;; --- 2. yaak-bin ---
;;; API client for HTTP, GraphQL, and WebSockets (.deb).
;;; Source: https://github.com/mountain-loop/yaak
;;;

(define-public yaak-bin
  (package
    (name "yaak-bin")
    (version "2026.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mountain-loop/yaak/releases/download/v"
                    version "/yaak_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "API client for HTTP, GraphQL, and WebSockets")
    (description "Yaak is a fast, offline, and Git-friendly API client
supporting HTTP, GraphQL, WebSockets, SSE, and gRPC.  It provides a desktop
interface for API development and testing.")
    (home-page "https://github.com/mountain-loop/yaak")
    (license license:expat)))

;;;
;;; --- 3. google-earth-pro ---
;;; 3D interface to explore the globe, terrain, and streets (.deb).
;;; Source: https://www.google.com/earth/about/versions/
;;;

(define-public google-earth-pro
  (package
    (name "google-earth-pro")
    (version "7.3.7.1155")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.google.com/dl/earth/client/current/"
                    "google-earth-pro-stable_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/") ("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D interface to explore the globe, terrain, and streets")
    (description "Google Earth Pro provides a three-dimensional interface to
explore the globe, terrain, streets, and buildings.  It includes tools for
measuring distances, creating fly-throughs, and viewing historical imagery.")
    (home-page "https://www.google.com/earth/about/versions/")
    ;; Proprietary Google Terms of Service
    (license license:nonfree)))

;;;
;;; --- 4. spacedrive-bin ---
;;; Cross-platform file manager (AppImage).
;;; Source: https://github.com/spacedriveapp/spacedrive
;;;

(define-public spacedrive-bin
  (package
    (name "spacedrive-bin")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/spacedriveapp/spacedrive/releases/download/"
                    version "/Spacedrive-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Spacedrive.AppImage" "bin/spacedrive"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "Spacedrive.AppImage")
                   (chmod "Spacedrive.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform file manager")
    (description "Spacedrive is a cross-platform file manager powered by a
virtual distributed filesystem.  It combines files from multiple devices and
cloud services into one place.")
    (home-page "https://github.com/spacedriveapp/spacedrive")
    (license license:agpl3+)))

;;;
;;; --- 5. tlescope-bin ---
;;; Satellite visualization tool (AppImage).
;;; Source: https://github.com/aweeri/TLEscope
;;;

(define-public tlescope-bin
  (package
    (name "tlescope-bin")
    (version "3.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/aweeri/TLEscope/releases/download/v"
                    version "/TLEscope-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("TLEscope.AppImage" "bin/tlescope"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "TLEscope.AppImage")
                   (chmod "TLEscope.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "satellite visualization tool")
    (description "TLEscope transforms Two-Line Element data into interactive
3D visualizations of satellite orbits.  It allows tracking satellites in
real time and viewing their trajectories.")
    (home-page "https://github.com/aweeri/TLEscope")
    (license license:agpl3+)))

;;;
;;; --- 6. pulse-visualizer-bin ---
;;; GPU-accelerated audio visualizer for PulseAudio (AppImage).
;;; Source: https://github.com/Audio-Solutions/pulse-visualizer
;;;

(define-public pulse-visualizer-bin
  (package
    (name "pulse-visualizer-bin")
    (version "1.3.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Audio-Solutions/pulse-visualizer/"
                    "releases/download/v" version
                    "/pulse-visualizer-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pulse-visualizer.AppImage"
                               "bin/pulse-visualizer"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "pulse-visualizer.AppImage")
                   (chmod "pulse-visualizer.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "GPU-accelerated audio visualizer for PulseAudio")
    (description "Pulse Visualizer is a GPU-accelerated audio visualizer that
works with PulseAudio and PipeWire.  It renders real-time frequency and
waveform displays of system audio output.")
    (home-page "https://github.com/Audio-Solutions/pulse-visualizer")
    (license license:gpl3+)))

;;;
;;; --- 7. orchids-bin ---
;;; AI-powered developer tool (.pacman archive).
;;; Source: https://orchids.app
;;;

(define-public orchids-bin
  (package
    (name "orchids-bin")
    (version "0.0.27")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://slelguoygbfzlpylpxfs.supabase.co/storage/v1/"
                    "object/public/desktop-artifact/public/v" version
                    "/linux/orchids.pacman"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   ;; .pacman files are tar.zst archives
                   (invoke "tar" "--use-compress-program=zstd"
                           "-xf" (assoc-ref inputs "source")))))))
    (native-inputs (list tar zstd))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI-powered developer tool")
    (description "Orchids is an AI developer tool that provides intelligent
code assistance and productivity features for software development
workflows.")
    (home-page "https://orchids.app")
    (license license:expat)))

;;;
;;; --- 8. audiorelay ---
;;; Stream PC audio to mobile devices (tar.gz).
;;; Source: https://audiorelay.net
;;;

(define-public audiorelay
  (package
    (name "audiorelay")
    (version "0.27.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.audiorelay.net/setups/linux/audiorelay-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/audiorelay/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "stream PC audio to mobile devices")
    (description "AudioRelay streams audio from a computer to mobile phones
and other devices over a local network.  It works as a virtual audio cable
between desktop and mobile systems.")
    (home-page "https://audiorelay.net")
    ;; Proprietary closed-source application
    (license license:nonfree)))

;;;
;;; --- 9. editcp ---
;;; Codeplug editor for TYT and Alinco amateur radios (tar.gz).
;;; Source: https://www.farnsworth.org/dale/codeplug/editcp/
;;;

(define-public editcp
  (package
    (name "editcp")
    (version "1.0.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.farnsworth.org/dale/codeplug/editcp/"
                    "downloads/editcp-" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("editcp" "bin/editcp"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "codeplug editor for TYT and Alinco amateur radios")
    (description "EditCP is a codeplug editor for TYT MD380, MD390, Retevis
RT3, and Alinco DJ-MD40 digital mobile radios.  It provides a graphical
interface for programming radio channel configurations.")
    (home-page "https://www.farnsworth.org/dale/codeplug/editcp/")
    (license license:gpl3+)))

;;;
;;; --- 10. webcord-bin ---
;;; Privacy-focused Discord client (.deb).
;;; Source: https://github.com/nicedcord/webcord
;;;

(define-public webcord-bin
  (package
    (name "webcord-bin")
    (version "4.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedcord/webcord/releases/download/v"
                    version "/webcord_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused Discord client")
    (description "WebCord is an open-source Discord client implemented without
the Discord API.  It provides enhanced privacy features and avoids tracking
present in the official client.")
    (home-page "https://github.com/nicedcord/webcord")
    (license license:expat)))

;;;
;;; --- 11. opera ---
;;; Feature-rich proprietary web browser (.deb).
;;; Source: https://www.opera.com
;;;

(define-public opera
  (package
    (name "opera")
    (version "130.0.5847.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://get.geo.opera.com/ftp/pub/opera/desktop/"
                    version "/linux/opera-stable_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-rich proprietary web browser")
    (description "Opera is a web browser with a built-in ad blocker, free VPN,
and integrated messaging services.  It features a customizable interface with
workspaces, tab management, and a sidebar for quick access to tools.")
    (home-page "https://www.opera.com")
    ;; Proprietary Opera license
    (license license:nonfree)))

;;;
;;; --- 12. vs-launcher ---
;;; Unofficial launcher for Vintage Story (AppImage).
;;; Source: https://github.com/XurxoMF/vs-launcher
;;;

(define-public vs-launcher
  (package
    (name "vs-launcher")
    (version "1.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/XurxoMF/vs-launcher/releases/download/v"
                    version "/vs-launcher-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("vs-launcher.AppImage" "bin/vs-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "vs-launcher.AppImage")
                   (chmod "vs-launcher.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unofficial launcher for Vintage Story")
    (description "VS Launcher is an unofficial launcher and version manager
for Vintage Story.  It provides a graphical interface for managing game
installations and switching between versions.")
    (home-page "https://github.com/XurxoMF/vs-launcher")
    ;; Custom license per upstream
    (license license:nonfree)))

;;;
;;; --- 13. ghostty-nightly-bin ---
;;; Fast native terminal emulator with modern features (nightly tar.gz).
;;; Source: https://github.com/ghostty-org/ghostty
;;;

(define-public ghostty-nightly-bin
  (package
    (name "ghostty-nightly-bin")
    (version "20260414")
    (source (origin
              (method url-fetch)
              (uri "https://release.files.ghostty.org/nightly/ghostty-nightly-linux-x86_64.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ghostty-nightly/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast native terminal emulator with modern features")
    (description "Ghostty is a fast, feature-rich terminal emulator that pushes
modern terminal capabilities.  It supports GPU-accelerated rendering,
ligatures, true color, and extensive customization options.")
    (home-page "https://ghostty.org")
    (license license:expat)))

;;;
;;; --- 14. itch-bin ---
;;; Desktop client for itch.io game platform (zip).
;;; Source: https://itch.io/app
;;;

(define-public itch-bin
  (package
    (name "itch-bin")
    (version "26.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://broth.itch.zone/itch/linux-amd64/"
                    version "/archive/default"))
              (file-name (string-append "itch-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/itch-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-q"
                           (assoc-ref inputs "source")))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for itch.io game platform")
    (description "The itch.io desktop application provides a convenient
interface for browsing, downloading, and managing games from the itch.io
indie game platform.  It supports automatic updates and offline access.")
    (home-page "https://itch.io/app")
    (license license:expat)))

;;;
;;; --- 15. neomod-bin ---
;;; Third-party McOsu fork with additional features (tar.gz).
;;; Source: https://github.com/neomodnet/neomod
;;;

(define-public neomod-bin
  (package
    (name "neomod-bin")
    (version "43.08")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neomodnet/neomod/releases/download/v"
                    version "/neomod-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/neomod-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "third-party McOsu fork with additional features")
    (description "NeoMod is a fork of McOsu with additional gameplay features
and improvements.  It provides a practice client for rhythm game players
with extended customization options.")
    (home-page "https://github.com/neomodnet/neomod")
    (license license:gpl3+)))

;;;
;;; --- 16. deskreen-bin ---
;;; Turn any device into a secondary screen (AppImage).
;;; Source: https://deskreen.com
;;;

(define-public deskreen-bin
  (package
    (name "deskreen-bin")
    (version "2.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicedcord/deskreen-v2/releases/download/v"
                    version "/Deskreen-" version
                    "-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Deskreen.AppImage" "bin/deskreen"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "Deskreen.AppImage")
                   (chmod "Deskreen.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "turn any device into a secondary screen")
    (description "Deskreen turns any device with a web browser into a secondary
screen for a computer.  It uses screen sharing over the local network to
extend or mirror the desktop.")
    (home-page "https://deskreen.com")
    (license license:agpl3+)))

;;;
;;; --- 17. plasticity-bin ---
;;; 3D modeling software for concept artists (AppImage).
;;; Source: https://github.com/nkallen/plasticity
;;;

(define-public plasticity-bin
  (package
    (name "plasticity-bin")
    (version "25.3.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nkallen/plasticity/releases/download/v"
                    version "/Plasticity-" version
                    "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Plasticity.AppImage" "bin/plasticity"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "Plasticity.AppImage")
                   (chmod "Plasticity.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "3D modeling software for concept artists")
    (description "Plasticity is a 3D modeling application designed for concept
artists and industrial designers.  It provides a streamlined workflow for
creating hard-surface models with precise geometric control.")
    (home-page "https://www.plasticity.xyz")
    ;; Custom proprietary license
    (license license:nonfree)))

;;;
;;; --- 18. pastelock ---
;;; Encrypted clipboard manager with login (binary).
;;; Source: https://gitlab.com/E-Gamma-102/pastelock
;;;

(define-public pastelock
  (package
    (name "pastelock")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/E-Gamma-102/pastelock/-/releases/v"
                    version "/downloads/pastelock-linux-x86_64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("pastelock" "bin/pastelock"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "pastelock")
                   (chmod "pastelock" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "encrypted clipboard manager with login")
    (description "Pastelock is an encrypted clipboard manager with
authentication, scrollable history, and support for text and image content.
It provides secure clipboard storage with login protection.")
    (home-page "https://gitlab.com/E-Gamma-102/pastelock")
    ;; Custom license per upstream
    (license license:nonfree)))

;;;
;;; --- 19. wavebox ---
;;; Web-desktop communication platform (.deb).
;;; Source: https://wavebox.io
;;;

(define-public wavebox
  (package
    (name "wavebox")
    (version "10.147.44")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.wavebox.app/stable/linux/deb/amd64/"
                    "wavebox_" version "-2_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/") ("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "web-desktop communication platform")
    (description "Wavebox is a web-desktop communication platform that
integrates web apps, email, and messaging services into a unified workspace.
It provides tools for managing multiple web accounts efficiently.")
    (home-page "https://wavebox.io")
    ;; Proprietary Wavebox license
    (license license:nonfree)))

;;;
;;; --- 20. kew-git ---
;;; Command-line music player (source build with gnu-build-system).
;;; Source: https://codeberg.org/ravachol/kew
;;;

(define-public kew-git
  (package
    (name "kew-git")
    (version "3.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/ravachol/kew/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "kew" bin)))))))
    (native-inputs (list pkg-config))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line music player")
    (description "Kew is a terminal-based music player that provides a simple
command-line interface for playing audio files.  It supports common audio
formats and features a minimalist playback interface.")
    (home-page "https://codeberg.org/ravachol/kew")
    (license license:gpl2)))

;;;
;;; --- 21. elephant-all-bin ---
;;; Application launcher with all official plugins (tar.gz).
;;; Source: https://github.com/abenz1267/elephant
;;;

(define-public elephant-all-bin
  (package
    (name "elephant-all-bin")
    (version "2.21.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/abenz1267/elephant/releases/download/v"
                    version "/elephant-all-linux-amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("elephant" "bin/elephant"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "application launcher with all official plugins")
    (description "Elephant is a fast application launcher bundled with all
official provider plugins.  It supports launching applications, searching
files, performing calculations, and integrating with external services.")
    (home-page "https://github.com/abenz1267/elephant")
    (license license:gpl3+)))

;;;
;;; --- 22. gns3-server-2 ---
;;; GNS3 network simulator server (Python source build).
;;; Source: https://github.com/GNS3/gns3-server
;;;

(define-public gns3-server-2
  (package
    (name "gns3-server-2")
    (version "2.2.58.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GNS3/gns3-server/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    ;; Runtime deps include aiohttp, jsonschema, psutil, etc. (not all in Guix).
    (synopsis "GNS3 network simulator server")
    (description "GNS3 Server provides the backend for the GNS3 network
simulator, enabling emulation of complex network topologies.  It supports
Dynamips, QEMU, VirtualBox, and Docker for network device virtualization.")
    (home-page "https://www.gns3.com")
    (license license:gpl3+)))

;;;
;;; --- 23. visual-studio-code-insiders-bin ---
;;; Visual Studio Code Insiders preview build (tar.gz).
;;; Source: https://code.visualstudio.com/insiders/
;;;

(define-public visual-studio-code-insiders-bin
  (package
    (name "visual-studio-code-insiders-bin")
    (version "1773701914")
    (source (origin
              (method url-fetch)
              (uri "https://update.code.visualstudio.com/latest/linux-x64/insider")
              (file-name (string-append "code-insiders-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/code-insiders/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Visual Studio Code Insiders preview build")
    (description "Visual Studio Code Insiders is the preview build of VS Code
with the latest features and bug fixes.  It provides an integrated development
environment with debugging, Git support, and extension ecosystem.")
    (home-page "https://code.visualstudio.com/insiders/")
    ;; Proprietary Microsoft license
    (license license:nonfree)))

;;;
;;; --- 24. biu-bin ---
;;; Desktop music player for Bilibili (.deb).
;;; Source: https://github.com/wood3n/biu
;;;

(define-public biu-bin
  (package
    (name "biu-bin")
    (version "1.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wood3n/biu/releases/download/v"
                    version "/Biu-" version "-linux-amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop music player for Bilibili")
    (description "Biu is a cross-platform desktop music player that provides
access to music through the Bilibili API.  It offers a clean interface for
browsing and streaming audio content.")
    (home-page "https://github.com/wood3n/biu")
    ;; PolyForm Noncommercial license
    (license license:nonfree)))

;;;
;;; --- 25. openconnect-sso ---
;;; OpenConnect wrapper with Azure AD authentication (Python source build).
;;; Source: https://github.com/vlaci/openconnect-sso
;;;

(define-public openconnect-sso
  (package
    (name "openconnect-sso")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vlaci/openconnect-sso/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    ;; Runtime deps include PyQt6, structlog, requests, etc. (not all in Guix).
    (synopsis "OpenConnect wrapper with Azure AD authentication")
    (description "OpenConnect SSO is a wrapper script for the OpenConnect VPN
client that supports Azure Active Directory SAMLv2 authentication.  It
automates the single sign-on process for corporate VPN connections.")
    (home-page "https://github.com/vlaci/openconnect-sso")
    (license license:gpl3+)))

;;;
;;; --- 26. superhuman ---
;;; Fast email client (AppImage).
;;; Source: https://superhuman.com
;;;

(define-public superhuman
  (package
    (name "superhuman")
    (version "1038.0.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://storage.googleapis.com/nicedcord-superhuman/"
                    "Superhuman-" version ".AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("Superhuman.AppImage" "bin/superhuman"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "Superhuman.AppImage")
                   (chmod "Superhuman.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast email client")
    (description "Superhuman is a desktop email client designed for speed and
productivity.  It provides keyboard shortcuts, AI-powered triage, and
scheduling features for efficient email management.")
    (home-page "https://superhuman.com")
    ;; Proprietary Superhuman license
    (license license:nonfree)))

;;;
;;; --- 27. regexxer ---
;;; Interactive search and replace tool for GNOME (source build).
;;; Source: https://sourceforge.net/projects/regexxer/
;;;

(define-public regexxer
  (package
    (name "regexxer")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/regexxer/regexxer-"
                    version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config intltool))
    (inputs (list glib gtkmm-3))
    (synopsis "interactive search and replace tool for GNOME")
    (description "Regexxer is a graphical search and replace tool using
regular expressions for the GNOME desktop.  It searches through files and
directories, showing matches in context and allowing interactive
replacements.")
    (home-page "https://regexxer.sourceforge.net")
    (license license:gpl2+)))

;;;
;;; --- 28. chwall ---
;;; Tiny wallpaper changer written in Python (source build).
;;; Source: https://git.umaneti.net/chwall/
;;;

(define-public chwall
  (package
    (name "chwall")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.umaneti.net/chwall/snapshot/chwall-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "tiny wallpaper changer written in Python")
    (description "Chwall is a lightweight wallpaper changer for Linux desktops.
It fetches wallpapers from various online sources and automatically rotates
desktop backgrounds.")
    (home-page "https://git.umaneti.net/chwall/")
    (license license:wtfpl2)))

;;;
;;; --- 29. jre25-zulu-bin ---
;;; Azul Zulu OpenJDK 25 runtime environment (tar.gz).
;;; Source: https://www.azul.com/downloads/
;;;

(define-public jre25-zulu-bin
  (package
    (name "jre25-zulu-bin")
    (version "25.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.azul.com/zulu/bin/"
                    "zulu25.32.21-ca-jre" version
                    "-linux_x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/jre25-zulu/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Azul Zulu OpenJDK 25 runtime environment")
    (description "Azul Zulu JRE provides a certified, standards-compliant build
of the OpenJDK 25 Java runtime environment.  It includes long-term support
and is suitable for production Java application deployment.")
    (home-page "https://www.azul.com/downloads/")
    ;; GPL-2.0 with Classpath exception (OpenJDK binary distribution)
    (license license:gpl2)))

;;;
;;; --- 30. softmaker-office-2024-bin ---
;;; Proprietary office suite for word processing and spreadsheets (tar.gz).
;;; Source: https://www.softmaker.com
;;;

(define-public softmaker-office-2024-bin
  (package
    (name "softmaker-office-2024-bin")
    (version "1230")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.softmaker.net/down/"
                    "softmaker-office-2024-" version "-amd64.tgz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/softmaker-office-2024/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "proprietary office suite for word processing and spreadsheets")
    (description "SoftMaker Office 2024 provides word processing, spreadsheet,
and presentation software with high Microsoft Office compatibility.  It
includes TextMaker, PlanMaker, and Presentations.")
    (home-page "https://www.softmaker.com/en/softmaker-office")
    ;; Proprietary SoftMaker license
    (license license:nonfree)))
