;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423s
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (30):
;;;        1.  nexttrace-bin (copy-build-system, v1.6.4, GPL-3.0)
;;;        2.  picsort-bin (copy-build-system, v0.4.0, MIT)
;;;        3.  nvidia-gpu-exporter-bin (copy-build-system, v1.4.1, MIT)
;;;        4.  clipvault-bin (copy-build-system, v1.1.1, AGPL-3.0)
;;;        5.  lact-headless-bin (copy-build-system, v0.8.2, MIT)
;;;        6.  feluda-bin (copy-build-system, v1.12.0, MIT)
;;;        7.  dopamine-bin (copy-build-system, v3.0.4, GPL-3.0)
;;;        8.  teleport-client-bin (copy-build-system, v18.7.1, Apache-2.0)
;;;        9.  nitchrevived-bin (copy-build-system, v0.1.7.5, MIT)
;;;       10.  nmp-settings-bin (copy-build-system, v0.7.0, GPL-3.0+)
;;;       11.  clash-verge-rev-autobuild-bin (copy-build-system, v2.4.8, GPL-3.0)
;;;       12.  discord-rpc-extension-bin (copy-build-system, v0.3.0, GPL-3.0)
;;;       13.  bluebubbles-bin (copy-build-system, v1.15.7, Apache-2.0)
;;;       14.  deepchat-bin (copy-build-system, v1.0.2, Apache-2.0)
;;;       15.  firedragon-alpha-bin (copy-build-system, v13.0.0-beta.10, MPL-2.0)
;;;       16.  java17-openjfx-bin (copy-build-system, v17.0.12, GPL-2.0)
;;;       17.  shstatus (copy-build-system, v2.0.2, MIT)
;;;       18.  caches-manager (copy-build-system, v0.1.10, MIT)
;;;       19.  path-utils (copy-build-system, v1.1.0, MIT)
;;;       20.  ffmpeg-audio-thumbnailer (copy-build-system, v1.2.0, GPL-3.0+)
;;;       21.  fcitx5-skin-ori-git (copy-build-system, v0.1, MPL-2.0)
;;;       22.  python-stringzilla (pyproject-build-system, v4.6.0, Apache-2.0)
;;;       23.  python-pdf2doi (pyproject-build-system, v1.7, MIT)
;;;       24.  python-pympress (pyproject-build-system, v1.8.6, GPL-2.0+)
;;;       25.  python-audible-cli (pyproject-build-system, v0.3.3, AGPL-3.0)
;;;       26.  uhubctl (gnu-build-system, v2.6.0, GPL-2.0)
;;;       27.  vvdec (cmake-build-system, v3.1.0, BSD-3-Clause)
;;;       28.  ebsl (cmake-build-system, v2.8.0, MIT)
;;;       29.  jbofihe-git (gnu-build-system, v0.44, GPL-2.0+)
;;;       30.  abuse-git (cmake-build-system, v2025.1.0, GPL-2.0+)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423s)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            nexttrace-bin
            picsort-bin
            nvidia-gpu-exporter-bin
            clipvault-bin
            lact-headless-bin
            feluda-bin
            dopamine-bin
            teleport-client-bin
            nitchrevived-bin
            nmp-settings-bin
            clash-verge-rev-autobuild-bin
            discord-rpc-extension-bin
            bluebubbles-bin
            deepchat-bin
            firedragon-alpha-bin
            java17-openjfx-bin
            shstatus
            caches-manager
            path-utils
            ffmpeg-audio-thumbnailer
            fcitx5-skin-ori-git
            python-stringzilla
            python-pdf2doi
            python-pympress
            python-audible-cli
            uhubctl
            vvdec
            ebsl
            jbofihe-git
            abuse-git
            ))

;;; -------------------------------------------------------------------
;;; 1. nexttrace-bin --- open source visual route tracking CLI tool
;;; -------------------------------------------------------------------
(define-public nexttrace-bin
  (package
    (name "nexttrace-bin")
    (version "1.6.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nxtrace/NTrace-core/releases/download/v"
                    version "/nexttrace_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nexttrace_linux_amd64" "bin/nexttrace"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nxtrace/NTrace-core")
    (synopsis "open source visual route tracking CLI tool")
    (description "NextTrace is an open source visual route tracking CLI tool
that traces the path network packets take to reach a destination, providing
geographical and ISP information for each hop.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. picsort-bin --- simple tool to sort pictures using keyboard
;;; -------------------------------------------------------------------
(define-public picsort-bin
  (package
    (name "picsort-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/coolapso/picsort/releases/download/v"
                    version "/picsort_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("picsort" "bin/picsort"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/coolapso/picsort")
    (synopsis "simple tool to sort pictures using keyboard")
    (description "PicSort is a simple tool to sort your pictures using only
your keyboard.  It displays images and lets you quickly sort them into
configurable directories with single key presses.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. nvidia-gpu-exporter-bin --- Nvidia GPU exporter for Prometheus
;;; -------------------------------------------------------------------
(define-public nvidia-gpu-exporter-bin
  (package
    (name "nvidia-gpu-exporter-bin")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/utkuozdemir/nvidia_gpu_exporter"
                    "/releases/download/v" version
                    "/nvidia_gpu_exporter_" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nvidia_gpu_exporter" "bin/nvidia_gpu_exporter"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/utkuozdemir/nvidia_gpu_exporter")
    (synopsis "nvidia GPU exporter for Prometheus using nvidia-smi")
    (description "Nvidia GPU Exporter is a Prometheus exporter that collects
GPU metrics using the @command{nvidia-smi} binary.  It exposes temperature,
utilization, memory, and power metrics for monitoring.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. clipvault-bin --- clipboard history manager for Wayland
;;; -------------------------------------------------------------------
(define-public clipvault-bin
  (package
    (name "clipvault-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rolv-Apneseth/clipvault/releases/download/v"
                    version "/clipvault-" version "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipvault" "bin/clipvault"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Rolv-Apneseth/clipvault")
    (synopsis "clipboard history manager for Wayland")
    (description "ClipVault is a clipboard history manager for Wayland,
inspired by cliphist.  It stores clipboard entries and provides a searchable
interface for pasting previous clipboard contents.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 5. lact-headless-bin --- Linux GPU configuration tool (headless)
;;; -------------------------------------------------------------------
(define-public lact-headless-bin
  (package
    (name "lact-headless-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ilya-zlobintsev/LACT/releases/download/v"
                    version "/lact-" version "-0-x86_64.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lact/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ilya-zlobintsev/LACT")
    (synopsis "linux AMD GPU configuration tool (headless binary)")
    (description "LACT is a Linux GPU Configuration Tool providing fan control,
power management, overclocking, and monitoring for AMD GPUs.  This headless
binary variant runs without a GUI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. feluda-bin --- detect license usage restrictions in projects
;;; -------------------------------------------------------------------
(define-public feluda-bin
  (package
    (name "feluda-bin")
    (version "1.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/anistark/feluda/releases/download/v"
                    version "/feluda-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("feluda" "bin/feluda"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anistark/feluda")
    (synopsis "detect license usage restrictions in your project")
    (description "Feluda is a command-line tool that scans your project
dependencies and detects license usage restrictions.  It helps ensure
compliance with open source license requirements.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. dopamine-bin --- audio player that keeps it simple
;;; -------------------------------------------------------------------
(define-public dopamine-bin
  (package
    (name "dopamine-bin")
    (version "3.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/digimezzo/dopamine/releases/download/v"
                    version "/Dopamine-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Dopamine.AppImage" "bin/dopamine"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/digimezzo/dopamine")
    (synopsis "audio player that keeps it simple")
    (description "Dopamine is a clean audio player for listening to music.
It features a simple, elegant interface with support for multiple audio
formats, playlists, and music library management.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. teleport-client-bin --- Teleport remote access client binaries
;;; -------------------------------------------------------------------
(define-public teleport-client-bin
  (package
    (name "teleport-client-bin")
    (version "18.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.teleport.dev/teleport-v" version
                    "-linux-amd64-bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tsh" "bin/tsh")
                ("tctl" "bin/tctl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gravitational/teleport")
    (synopsis "teleport remote access client tools (tsh, tctl)")
    (description "Teleport is an access platform for infrastructure.  This
package provides the client-only binaries: @command{tsh} for SSH and
Kubernetes access, and @command{tctl} for cluster administration.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. nitchrevived-bin --- fast system fetch written in Nim
;;; -------------------------------------------------------------------
(define-public nitchrevived-bin
  (package
    (name "nitchrevived-bin")
    (version "0.1.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gnuvalerie/nitchrevived/releases/download/v"
                    version "/nitchrevived"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nitchrevived" "bin/nitchrevived"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gnuvalerie/nitchrevived")
    (synopsis "incredibly fast system fetch written in Nim")
    (description "NitchRevived is a fast system information fetch tool
written in Nim.  It displays system details such as OS, kernel, shell,
and hardware information in a minimal format.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. nmp-settings-bin --- extensible settings GUI for Linux
;;; -------------------------------------------------------------------
(define-public nmp-settings-bin
  (package
    (name "nmp-settings-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nmp-apps/nmp-settings/releases/download/v"
                    version "/nmp-settings_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nmp-settings/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nmp-apps/nmp-settings")
    (synopsis "extensible settings GUI for Linux")
    (description "NMP Settings is a settings GUI for Linux that is
extensible with plugins.  It provides a clean interface for managing
system configuration options.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. clash-verge-rev-autobuild-bin --- Clash Meta GUI based on Tauri
;;; -------------------------------------------------------------------
(define-public clash-verge-rev-autobuild-bin
  (package
    (name "clash-verge-rev-autobuild-bin")
    (version "2.4.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/clash-verge-rev/clash-verge-rev"
                    "/releases/download/v" version
                    "/Clash.Verge_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/clash-verge/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/clash-verge-rev/clash-verge-rev")
    (synopsis "Clash Meta GUI based on Tauri")
    (description "Clash Verge Rev is a continuation of Clash Verge, providing
a GUI for the Clash Meta proxy core.  It is built with Tauri and offers rule-based
traffic routing, multiple proxy protocols, and system proxy integration.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. discord-rpc-extension-bin --- Discord rich presence extension
;;; -------------------------------------------------------------------
(define-public discord-rpc-extension-bin
  (package
    (name "discord-rpc-extension-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lolamtisch/Discord-RPC-Extension"
                    "/releases/download/" version
                    "/discord-rpc-extension-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/discord-rpc-extension/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lolamtisch/Discord-RPC-Extension")
    (synopsis "discord rich presence extension with open API")
    (description "Discord RPC Extension provides rich presence integration
for Discord, allowing applications and browser extensions to display
activity status through an open API.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 13. bluebubbles-bin --- iMessage for Android, PC, and Web
;;; -------------------------------------------------------------------
(define-public bluebubbles-bin
  (package
    (name "bluebubbles-bin")
    (version "1.15.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BlueBubblesApp/bluebubbles-app"
                    "/releases/download/v" version
                    "/bluebubbles-" version "-linux-x64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/bluebubbles/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bluebubbles.app")
    (synopsis "cross-platform app bringing iMessage to Android, PC, and web")
    (description "BlueBubbles is a cross-platform app ecosystem that brings
iMessage to Android, PC, and Web.  It requires a Mac server to relay
messages and supports rich media, reactions, and group chats.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. deepchat-bin --- AI assistant connecting to your personal world
;;; -------------------------------------------------------------------
(define-public deepchat-bin
  (package
    (name "deepchat-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ThinkInAIXYZ/deepchat/releases/download/v"
                    version "/DeepChat-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("DeepChat.AppImage" "bin/deepchat"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://deepchat.thinkinai.xyz")
    (synopsis "AI assistant that connects to your personal world")
    (description "DeepChat is an AI assistant application that connects
powerful AI models to your personal world.  It provides a desktop
interface for interacting with various AI providers.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 15. firedragon-alpha-bin --- Floorp-based browser with custom branding
;;; -------------------------------------------------------------------
(define-public firedragon-alpha-bin
  (package
    (name "firedragon-alpha-bin")
    (version "13.0.0-beta.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/garuda-linux/firedragon/firedragon13"
                    "/-/releases/v" version
                    "/downloads/firedragon-" version ".linux-x86_64.tar.bz2"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/firedragon/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/garuda-linux/firedragon/firedragon13")
    (synopsis "Floorp fork with custom branding and settings (testing)")
    (description "FireDragon is a browser based on Floorp (itself a Firefox
fork), built with custom Garuda Linux branding and privacy settings.  This
is the alpha/testing version for early adopters.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 16. java17-openjfx-bin --- Java OpenJFX 17 client platform (Gluon)
;;; -------------------------------------------------------------------
(define-public java17-openjfx-bin
  (package
    (name "java17-openjfx-bin")
    (version "17.0.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download2.gluonhq.com/openjfx/" version
                    "/openjfx-" version "_linux-x64_bin-sdk.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/java/openjfx/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openjfx.io")
    (synopsis "Java OpenJFX 17 client application platform (Gluon build)")
    (description "OpenJFX is the open-source implementation of the JavaFX
platform for building rich client applications.  This package provides the
pre-built Gluon SDK for JDK 17, including JavaFX modules for UI, media,
and web rendering.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 17. shstatus --- simple statusline generator for i3bar and swaybar
;;; -------------------------------------------------------------------
(define-public shstatus
  (package
    (name "shstatus")
    (version "2.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acuteenvy/shstatus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shstatus" "bin/shstatus"))))
    (home-page "https://github.com/acuteenvy/shstatus")
    (synopsis "simple statusline generator for i3bar and swaybar")
    (description "Shstatus is a simple, fast statusline generator for i3bar
and swaybar.  It is written as a shell script and can be configured to
display system information like time, battery, volume, and network status.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. caches-manager --- keep selected directories clean via tmpfs
;;; -------------------------------------------------------------------
(define-public caches-manager
  (package
    (name "caches-manager")
    (version "0.1.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/HanabishiRecca/caches-manager")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("caches-manager" "bin/caches-manager"))))
    (home-page "https://github.com/HanabishiRecca/caches-manager")
    (synopsis "keep selected directories clean via tmpfs symlinking")
    (description "Caches Manager is a simple script that helps keep selected
directories clean by symlinking or mounting them to tmpfs ramdisks.  This
reduces disk writes and speeds up access to cache directories.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 19. path-utils --- shell PATH management tools
;;; -------------------------------------------------------------------
(define-public path-utils
  (package
    (name "path-utils")
    (version "1.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Remenod/path-utils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/path-utils/"))))
    (home-page "https://github.com/Remenod/path-utils")
    (synopsis "useful shell PATH management tools")
    (description "Path-utils provides shell RC functions for managing the
@env{PATH} environment variable.  It includes utilities for adding,
removing, and reordering directories in your shell path.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. ffmpeg-audio-thumbnailer --- minimal audio file thumbnailer
;;; -------------------------------------------------------------------
(define-public ffmpeg-audio-thumbnailer
  (package
    (name "ffmpeg-audio-thumbnailer")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ffmpeg-audio-thumbnailer" "bin/ffmpeg-audio-thumbnailer")
                ("ffmpeg-audio-thumbnailer.thumbnailer"
                 "share/thumbnailers/ffmpeg-audio-thumbnailer.thumbnailer"))))
    (home-page "https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer")
    (synopsis "minimal audio file thumbnailer for file managers")
    (description "A minimal audio file thumbnailer for file managers such
as Nautilus, Dolphin, Thunar, and Nemo.  It uses FFmpeg to extract
embedded album art from audio files for thumbnail display.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. fcitx5-skin-ori-git --- round corner SVG theme for Fcitx5
;;; -------------------------------------------------------------------
(define-public fcitx5-skin-ori-git
  (package
    (name "fcitx5-skin-ori-git")
    (version "0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Reverier-Xu/Ori-fcitx5")
                    (commit "9acce9")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fcitx5/themes/Ori/"))))
    (home-page "https://github.com/Reverier-Xu/Ori-fcitx5")
    (synopsis "round corner SVG theme for Fcitx5")
    (description "Ori is a clean, round-corner SVG theme for the Fcitx5
input method framework.  It provides a modern visual style for the input
method candidate window.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 22. python-stringzilla --- SIMD-accelerated string operations
;;; -------------------------------------------------------------------
(define-public python-stringzilla
  (package
    (name "python-stringzilla")
    (version "4.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ashvardanian/StringZilla/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ashvardanian/StringZilla")
    (synopsis "SIMD-accelerated string search, sort, hashes, and edit distances")
    (description "StringZilla is a library providing SIMD-accelerated string
operations including search, sort, hashes, fingerprints, and edit distance
calculations.  It offers significant speedups over standard library
string functions for large-scale text processing.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 23. python-pdf2doi --- extract DOI from PDF files
;;; -------------------------------------------------------------------
(define-public python-pdf2doi
  (package
    (name "python-pdf2doi")
    (version "1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pdf2doi/pdf2doi-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/MicheleCotrufo/pdf2doi")
    (synopsis "extract DOI or identifiers from scientific paper PDFs")
    (description "pdf2doi is a Python library and command-line tool to
extract the DOI or other identifiers of a scientific paper from a PDF file.
It uses multiple strategies including text extraction, web lookups, and
metadata parsing.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. python-pympress --- dual-screen PDF reader for presentations
;;; -------------------------------------------------------------------
(define-public python-pympress
  (package
    (name "python-pympress")
    (version "1.8.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/pympress/pympress-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Cimbali/pympress")
    (synopsis "simple and powerful dual-screen PDF reader for presentations")
    (description "Pympress is a simple yet powerful PDF reader designed for
dual-screen presentations.  It renders PDF slides on a projector while
showing notes, a timer, and a next-slide preview on the presenter screen.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 25. python-audible-cli --- command line interface for Audible
;;; -------------------------------------------------------------------
(define-public python-audible-cli
  (package
    (name "python-audible-cli")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/a/audible-cli/"
                    "audible_cli-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mkb79/audible-cli")
    (synopsis "command line interface for the Audible package")
    (description "Audible-cli is a command line interface for the audible
Python package.  It allows downloading Audible audiobooks, covers, and
chapter files from the command line.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 26. uhubctl --- control USB per-port power switching
;;; -------------------------------------------------------------------
(define-public uhubctl
  (package
    (name "uhubctl")
    (version "2.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mvp/uhubctl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:make-flags
           #~(list (string-append "CC=" #$(cc-for-target))
                   (string-append "PREFIX=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/mvp/uhubctl")
    (synopsis "control USB per-port power switching on smart USB hubs")
    (description "uhubctl is a utility to control USB per-port power
switching on compatible smart USB hubs.  It can turn individual USB ports
on and off, which is useful for resetting USB devices or saving power.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 27. vvdec --- Fraunhofer versatile video decoder (VVC/H.266)
;;; -------------------------------------------------------------------
(define-public vvdec
  (package
    (name "vvdec")
    (version "3.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fraunhoferhhi/vvdec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc/fraunhofer-versatile-video-decoder-vvdec.html")
    (synopsis "Fraunhofer versatile video decoder for VVC/H.266")
    (description "VVdeC is the Fraunhofer Versatile Video Decoder, a fast
H.266/VVC software decoder.  It implements the ITU-T H.266 / MPEG-I Part 3
standard for next-generation video coding with improved compression
efficiency over HEVC/H.265.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 28. ebsl --- shell-accessible configuration file format
;;; -------------------------------------------------------------------
(define-public ebsl
  (package
    (name "ebsl")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aarikpokras/ebsl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/aarikpokras/ebsl")
    (synopsis "shell-accessible configuration file format")
    (description "EBSL is a shell-accessible configuration file format.
It provides a simple syntax for configuration files that can be easily
parsed and manipulated from shell scripts.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. jbofihe-git --- tools to operate on Lojban text
;;; -------------------------------------------------------------------
(define-public jbofihe-git
  (package
    (name "jbofihe-git")
    (version "0.44")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lojban/jbofihe")
                    (commit "652c20e")))
              (file-name (git-file-name name version))
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
    (home-page "https://github.com/lojban/jbofihe")
    (synopsis "tools for parsing and glossing Lojban text")
    (description "Jbofihe is a suite of tools for operating on Lojban text.
Its main feature is approximate translation to English through parsing,
grammatical analysis, and word-by-word glossing of Lojban sentences.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 30. abuse-git --- side-scroller action game
;;; -------------------------------------------------------------------
(define-public abuse-git
  (package
    (name "abuse-git")
    (version "2025.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Abuse-Team/abuse")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://abuse.zoy.org/")
    (synopsis "side-scroller action game against alien killers")
    (description "Abuse is a side-scroller action game that pits you against
ruthless alien killers.  Originally released by Crack dot Com in 1995, this
modernized version adds SDL2 support, improved rendering, and cross-platform
compatibility.")
    (license license:gpl2+)))
