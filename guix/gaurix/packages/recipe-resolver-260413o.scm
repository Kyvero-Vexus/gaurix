;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 25 recipes created (copy-build-system binary packages + 1 source build)
;;;   - 5 re-blocked with specific reason codes
;;;
;;; Recipes (25):
;;;   - icann-rdap-bin (copy, v0.0.28)
;;;   - sendme-bin (copy, v0.31.0)
;;;   - ytcui-bin (copy, v1.0.0)
;;;   - tickit-bin (copy, v0.5.8)
;;;   - hazelnut-bin (copy, v0.2.49)
;;;   - feedo-bin (copy, v1.1.31)
;;;   - certradar-cli-bin (copy, v0.1.2)
;;;   - spotatui-bin (copy, v0.37.3)
;;;   - headroom-bin (copy, v1.7.1)
;;;   - jpu-bin (copy, v0.0.1)
;;;   - turso-bin (copy, v0.5.1)
;;;   - lsfg-vk-bin (copy, v1.0.0)
;;;   - sonyheadphonesclient-bluetooth-bin (copy, v1.4.4)
;;;   - usb-tree-app-bin (copy, v0.0.5)
;;;   - vvv-bin (copy, v1.5.0)
;;;   - pomodorolm-bin (copy, v0.8.0)
;;;   - insomnium-bin (copy, v0.2.3)
;;;   - pomotroid-bin (copy, v1.1.0)
;;;   - pulsar-bin (copy, v1.131.1)
;;;   - modrinth-app-bin (copy, v0.12.4)
;;;   - pince-bin (copy, v0.5)
;;;   - notepadnext-bin (copy, v0.13)
;;;   - swt-bin (copy, v4.38)
;;;   - qualcoder-bin (copy, v3.8)
;;;   - xdgctl (gnu, v1.0)
;;;
;;; Blocked (5):
;;;   - ttime-bin (PYTHON_DEPS_NEEDED)
;;;   - nblood-git (BUILD_SYSTEM_TOO_COMPLEX)
;;;   - keypunch-git (CARGO_DEPS_NEEDED)
;;;   - am (ROLLING_RELEASE)
;;;   - gameoftrees (MISSING_GUIX_DEPS)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages glib)
  #:export (
            icann-rdap-bin
            sendme-bin
            ytcui-bin
            tickit-bin
            hazelnut-bin
            feedo-bin
            certradar-cli-bin
            spotatui-bin
            headroom-bin
            jpu-bin
            turso-bin
            lsfg-vk-bin
            sonyheadphonesclient-bluetooth-bin
            usb-tree-app-bin
            vvv-bin
            pomodorolm-bin
            insomnium-bin
            pomotroid-bin
            pulsar-bin
            modrinth-app-bin
            pince-bin
            notepadnext-bin
            swt-bin
            qualcoder-bin
            xdgctl
            ))

;;; ── icann-rdap-bin (#1346) ──

(define-public icann-rdap-bin
  (package
    (name "icann-rdap-bin")
    (version "0.0.28")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/icann/icann-rdap/releases/download/v"
                    version "/icann-rdap-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("rdap" "bin/rdap"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ICANN implementation of RDAP client")
    (description "ICANN RDAP is a command-line client for the Registration Data
Access Protocol, providing domain name and IP address registration data
lookups.  It implements the RDAP protocol as specified by ICANN.")
    (home-page "https://github.com/icann/icann-rdap")
    (license (list license:asl2.0 license:expat))))

;;; ── sendme-bin (#1256) ──

(define-public sendme-bin
  (package
    (name "sendme-bin")
    (version "0.31.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/n0-computer/sendme/releases/download/v"
                    version "/sendme-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("sendme" "bin/sendme"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast peer-to-peer file and directory transfer tool")
    (description "Sendme is a peer-to-peer tool for transferring files and
directories quickly over the network.  It uses QUIC transport and content
addressing for efficient, resumable transfers without requiring a server.")
    (home-page "https://github.com/n0-computer/sendme")
    (license (list license:expat license:asl2.0))))

;;; ── ytcui-bin (#1362) ──

(define-public ytcui-bin
  (package
    (name "ytcui-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/MilkmanAbi/ytcui/releases/download/v"
                    version "/ytcui"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("ytcui" "bin/ytcui"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "ytcui")
                   (chmod "ytcui" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight terminal-based YouTube client")
    (description "Ytcui is a lightweight terminal-based YouTube client written
in C++.  It provides a text user interface for browsing and watching YouTube
content from the command line.")
    (home-page "https://github.com/MilkmanAbi/ytcui")
    (license license:expat)))

;;; ── tickit-bin (#1370) ──

(define-public tickit-bin
  (package
    (name "tickit-bin")
    (version "0.5.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ricardodantas/tickit/releases/download/v"
                    version "/tickit-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("tickit" "bin/tickit"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based task manager CLI and TUI")
    (description "Tickit is a terminal-based task manager providing both a
command-line interface and a text user interface for managing tasks and
to-do items efficiently from the terminal.")
    (home-page "https://github.com/ricardodantas/tickit")
    (license license:gpl3)))

;;; ── hazelnut-bin (#1405) ──

(define-public hazelnut-bin
  (package
    (name "hazelnut-bin")
    (version "0.2.49")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ricardodantas/hazelnut/releases/download/v"
                    version "/hazelnut-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("hazelnut" "bin/hazelnut"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based automated file organizer")
    (description "Hazelnut is a terminal-based automated file organizer that
helps sort and organize files into directories based on configurable rules
and file type patterns.")
    (home-page "https://github.com/ricardodantas/hazelnut")
    (license license:gpl3)))

;;; ── feedo-bin (#1410) ──

(define-public feedo-bin
  (package
    (name "feedo-bin")
    (version "1.1.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ricardodantas/feedo/releases/download/v"
                    version "/feedo-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("feedo" "bin/feedo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal RSS feed reader")
    (description "Feedo is a terminal-based RSS feed reader that allows
browsing and reading RSS and Atom feeds from the command line with a
text user interface.")
    (home-page "https://github.com/ricardodantas/feedo")
    (license license:gpl3)))

;;; ── certradar-cli-bin (#1427) ──

(define-public certradar-cli-bin
  (package
    (name "certradar-cli-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FlerAlex/certradar-cli/releases/download/v"
                    version "/certradar-cli-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("certradar-cli" "bin/certradar-cli"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "certificate transparency search and SSL/TLS analysis CLI")
    (description "CertRadar CLI is a command-line tool for searching
certificate transparency logs and analyzing SSL/TLS certificate security.
It helps identify certificates issued for domains and detect potential
security issues.")
    (home-page "https://github.com/FlerAlex/certradar-cli")
    (license license:expat)))

;;; ── spotatui-bin (#1596) ──

(define-public spotatui-bin
  (package
    (name "spotatui-bin")
    (version "0.37.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LargeModGames/spotatui/releases/download/v"
                    version "/spotatui-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("spotatui" "bin/spotatui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Spotify terminal client with Ratatui interface")
    (description "Spotatui is a terminal-based Spotify client built with
Ratatui.  It provides a text user interface for controlling Spotify
playback, browsing playlists, and searching music from the terminal.")
    (home-page "https://github.com/LargeModGames/spotatui")
    (license license:expat)))

;;; ── headroom-bin (#1623) ──

(define-public headroom-bin
  (package
    (name "headroom-bin")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/M-Igashi/headroom/releases/download/v"
                    version "/headroom-v" version
                    "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("headroom" "bin/headroom"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "audio loudness analyzer and gain adjustment tool")
    (description "Headroom is an audio loudness analysis tool that measures
and adjusts audio gain levels.  It supports multiple audio formats and
provides loudness normalization capabilities from the command line.")
    (home-page "https://github.com/M-Igashi/headroom")
    (license license:expat)))

;;; ── jpu-bin (#1682) ──

(define-public jpu-bin
  (package
    (name "jpu-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/adamperkowski/jpu/releases/download/v"
                    version "/jpu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("jpu" "bin/jpu"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "jpu")
                   (chmod "jpu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast lightweight ProtonUp alternative for managing Proton GE")
    (description "Jpu is a fast, lightweight alternative to ProtonUp for
managing Proton-GE installations.  It downloads and installs custom Proton
builds for use with Steam on Linux.")
    (home-page "https://github.com/adamperkowski/jpu")
    (license license:bsd-3)))

;;; ── turso-bin (#1765) ──

(define-public turso-bin
  (package
    (name "turso-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tursodatabase/turso/releases/download/v"
                    version "/turso_cli-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("turso" "bin/turso"))))
    (native-inputs (list (@ (gnu packages compression) xz)))
    (supported-systems '("x86_64-linux"))
    (synopsis "SQLite-compatible database CLI from Turso")
    (description "Turso CLI is a command-line tool for managing Turso databases,
an edge-hosted SQLite-compatible SQL database.  It supports creating,
querying, and administering databases and organizations.")
    (home-page "https://turso.tech")
    (license license:expat)))

;;; ── lsfg-vk-bin (#1675) ──

(define-public lsfg-vk-bin
  (package
    (name "lsfg-vk-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PancakeTAS/lsfg-vk/releases/download/v"
                    version "/lsfg-vk-" version ".x86_64.tar.zst"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("lsfg-vk" "bin/lsfg-vk"))))
    (native-inputs (list (@ (gnu packages compression) zstd)))
    (supported-systems '("x86_64-linux"))
    (synopsis "lossless scaling frame generation on Linux using Vulkan")
    (description "LSFG-VK provides lossless scaling frame generation on
Linux using Vulkan compute shaders.  It interpolates frames for smoother
visual output in games and applications.")
    (home-page "https://github.com/PancakeTAS/lsfg-vk")
    (license license:gpl3+)))

;;; ── sonyheadphonesclient-bluetooth-bin (#1735) ──

(define-public sonyheadphonesclient-bluetooth-bin
  (package
    (name "sonyheadphonesclient-bluetooth-bin")
    (version "1.4.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mos9527/SonyHeadphonesClient/releases/download/"
                    version "/SonyHeadphonesClient-linux-x64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("SonyHeadphonesClient-linux-x64"
                               "bin/sony-headphones-client"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "SonyHeadphonesClient-linux-x64")
                   (chmod "SonyHeadphonesClient-linux-x64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for Sony Bluetooth headphones")
    (description "SonyHeadphonesClient is a desktop client that recreates the
Sony Headphones app functionality for controlling Sony Bluetooth headphones.
It supports noise cancellation settings, equalizer, and other features
via Bluetooth.")
    (home-page "https://github.com/mos9527/SonyHeadphonesClient")
    (license license:expat)))

;;; ── usb-tree-app-bin (#1676) ──

(define-public usb-tree-app-bin
  (package
    (name "usb-tree-app-bin")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AOzmond/usb-tree/releases/download/"
                    version "/usb-tree-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usb-tree" "bin/usb-tree"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "USB device tree viewer with monitoring")
    (description "USB Tree is a USB device tree viewer that displays detailed
information about connected USB devices in a hierarchical tree view.  It
provides real-time monitoring and device inspection capabilities.")
    (home-page "https://github.com/AOzmond/usb-tree")
    (license license:gpl2+)))

;;; ── vvv-bin (#1695) ──

(define-public vvv-bin
  (package
    (name "vvv-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/vvvapp/VVV-"
                    version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vvv/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "virtual volumes view for cataloging removable media")
    (description "VVV (Virtual Volumes View) catalogs the contents of
removable volumes so that their contents can be searched and browsed
offline without having the media physically connected.")
    (home-page "https://vvvapp.sourceforge.net")
    (license license:gpl2)))

;;; ── pomodorolm-bin (#1536) ──

(define-public pomodorolm-bin
  (package
    (name "pomodorolm-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vjousse/pomodorolm/releases/download/app-v"
                    version "/pomodorolm_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform Pomodoro tracker")
    (description "Pomodorolm is a multi-platform Pomodoro technique tracker
built with Tauri and Elm.  It provides customizable timer intervals, break
reminders, and session tracking for productivity.")
    (home-page "https://github.com/vjousse/pomodorolm")
    (license license:expat)))

;;; ── insomnium-bin (#1622) ──

(define-public insomnium-bin
  (package
    (name "insomnium-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ArchGPT/insomnium/releases/download/core%40"
                    version "-a/Insomnium.Core-" version "-a.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("opt/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused open source API client")
    (description "Insomnium is a privacy-focused, open source API client
forked from Insomnia.  It provides REST, GraphQL, gRPC, and WebSocket
testing capabilities without telemetry or cloud requirements.")
    (home-page "https://github.com/ArchGPT/insomnium")
    (license license:expat)))

;;; ── pomotroid-bin (#1722) ──

(define-public pomotroid-bin
  (package
    (name "pomotroid-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Splode/pomotroid/releases/download/v"
                    version "/Pomotroid_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple visually-pleasing Pomodoro timer")
    (description "Pomotroid is a simple and visually-pleasing Pomodoro timer
application.  It features customizable timers, themes, and notifications
for managing work and break intervals using the Pomodoro technique.")
    (home-page "https://github.com/Splode/pomotroid")
    (license license:expat)))

;;; ── pulsar-bin (#1656) ──

(define-public pulsar-bin
  (package
    (name "pulsar-bin")
    (version "1.131.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pulsar-edit/pulsar/releases/download/v"
                    version "/Linux.pulsar_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "community-led hackable text editor")
    (description "Pulsar is a community-led, hackable text editor forked
from Atom.  It supports packages, themes, and a rich extension ecosystem
for customizing the editing experience across multiple programming
languages.")
    (home-page "https://pulsar-edit.dev")
    (license license:expat)))

;;; ── modrinth-app-bin (#1604) ──

(define-public modrinth-app-bin
  (package
    (name "modrinth-app-bin")
    (version "0.12.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://launcher-files.modrinth.com/versions/"
                    version "/linux/Modrinth%20App_"
                    version "_amd64.deb"))
              (file-name (string-append "modrinth-app-" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("usr/" "/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) tar)))
    (supported-systems '("x86_64-linux"))
    (synopsis "open source Minecraft mod launcher")
    (description "Modrinth App is an open source Minecraft mod launcher built
with Tauri.  It supports installing, managing, and updating Minecraft mods,
modpacks, resource packs, and shaders from the Modrinth platform.")
    (home-page "https://modrinth.com")
    (license license:gpl3)))

;;; ── pince-bin (#1566) ──

(define-public pince-bin
  (package
    (name "pince-bin")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/korcankaraokcu/PINCE/releases/download/v"
                    version "/PINCE-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("PINCE-x86_64.AppImage" "bin/pince"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "PINCE-x86_64.AppImage")
                   (chmod "PINCE-x86_64.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "reverse engineering and GDB frontend for Linux")
    (description "PINCE is a reverse engineering tool and GDB frontend for
Linux.  It provides memory scanning, debugging, and game hacking
capabilities through an integrated graphical interface.")
    (home-page "https://github.com/korcankaraokcu/PINCE")
    (license license:gpl3)))

;;; ── notepadnext-bin (#1574) ──

(define-public notepadnext-bin
  (package
    (name "notepadnext-bin")
    (version "0.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dail8859/NotepadNext/releases/download/v"
                    version "/NotepadNext-v" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("NotepadNext.AppImage" "bin/notepadnext"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source")
                              "NotepadNext.AppImage")
                   (chmod "NotepadNext.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform reimplementation of Notepad++")
    (description "NotepadNext is a cross-platform reimplementation of
Notepad++.  It provides syntax highlighting, code folding, multi-cursor
editing, and many other features familiar to Notepad++ users on Linux,
macOS, and Windows.")
    (home-page "https://github.com/dail8859/NotepadNext")
    (license license:gpl3)))

;;; ── swt-bin (#1371) ──

(define-public swt-bin
  (package
    (name "swt-bin")
    (version "4.38")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.eclipse.org/eclipse/downloads/drops4/R-"
                    version "-202512010920/swt-" version
                    "-gtk-linux-x86_64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("swt.jar" "share/java/swt.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" (assoc-ref inputs "source")))))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "Eclipse Standard Widget Toolkit for Java")
    (description "SWT (Standard Widget Toolkit) is a graphical widget toolkit
for use with the Java platform.  It provides native-looking GUI components
by using the operating system's native widgets through JNI.")
    (home-page "https://www.eclipse.org/swt/")
    (license license:epl2.0)))

;;; ── qualcoder-bin (#1569) ──

(define-public qualcoder-bin
  (package
    (name "qualcoder-bin")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ccbogel/QualCoder/releases/download/"
                    version "/QualCoder_3_8_Ubuntu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("QualCoder" "bin/qualcoder"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (copy-file (assoc-ref inputs "source") "QualCoder")
                   (chmod "QualCoder" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "qualitative data analysis application")
    (description "QualCoder is a qualitative data analysis application for
working with text, images, audio, and video data.  It supports coding,
categorizing, and analyzing qualitative research data with an intuitive
graphical interface.")
    (home-page "https://github.com/ccbogel/QualCoder")
    (license license:expat)))

;;; ── xdgctl (#1239) ──

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
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build
                 (lambda _
                   (invoke "gcc" "-o" "xdgctl" "main.c"
                           "-I" (string-append
                                 #$(this-package-input "glib") "/include/glib-2.0")
                           "-I" (string-append
                                 #$(this-package-input "glib")
                                 "/lib/glib-2.0/include")
                           "-I" (string-append
                                 #$(this-package-input "glib") "/include/gio-unix-2.0")
                           "-L" (string-append
                                 #$(this-package-input "glib") "/lib")
                           "-lgio-2.0" "-lgobject-2.0" "-lglib-2.0")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (install-file "xdgctl" bin)))))))
    (inputs (list glib))
    (native-inputs (list pkg-config))
    (synopsis "TUI for managing XDG default applications")
    (description "Xdgctl is a text user interface for managing XDG default
applications on Linux.  It provides an interactive terminal interface
for viewing and setting default applications for different MIME types.")
    (home-page "https://github.com/mitjafelicijan/xdgctl")
    (license license:bsd-2)))
