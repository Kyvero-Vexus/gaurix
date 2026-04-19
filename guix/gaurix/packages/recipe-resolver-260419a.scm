;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260419a
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (1 resolved, 1 definition):
;;;        1.  termirs-bin (copy-build-system, v0.3.2, MIT)
;;;
;;; BLOCKED EXHAUSTED (29):
;;;        2.  libminizinc -> MISSING_DEP_CHAIN: needs gecode + 5 coin-or-* solver libs not in Guix
;;;        3.  roleboi -> DOTNET_UNSUPPORTED: requires dotnet-sdk-9.0 not in Guix
;;;        4.  alephone-phoenix -> MISSING_DEP_CHAIN: depends on alephone engine not in Guix; unstable source URL
;;;        5.  libldap24 -> COMPLEX_BUILD: legacy OpenLDAP 2.4.x compat lib; conflicts with Guix openldap
;;;        6.  freetype2-qdoled -> COMPLEX_BUILD: patched freetype2 variant; conflicts with system freetype
;;;        7.  quill-editor -> MISSING_SOURCE: no upstream URL in AUR metadata; cannot identify source
;;;        8.  indicator-sysmonitor-appindicator-git -> MISSING_SOURCE: AUR package name no longer exists
;;;        9.  litellm-ollama -> MISSING_DEP_CHAIN: metapackage needs ollama + litellm + deep Python dep chain
;;;       10.  tauon-music-box-git -> MISSING_DEP_CHAIN: needs SDL3 + pysdl3 + 15 libs not in Guix
;;;       11.  xtool -> MISSING_DEP_CHAIN: needs swift-bin (Swift compiler not in Guix); Apple ecosystem tool
;;;       12.  xlibre-video-voodoo -> MISSING_DEP_CHAIN: needs xlibre-xserver>=25 (fork not in Guix); obsolete 3dfx hardware
;;;       13.  xlibre-input-wacom -> MISSING_DEP_CHAIN: needs xlibre-xserver>=25; Guix has xf86-input-wacom already
;;;       14.  xlibre-input-evdev -> MISSING_DEP_CHAIN: needs xlibre-xserver>=25; Guix has xf86-input-evdev already
;;;       15.  qqc2-desktop-style-git -> ALREADY_IN_GUIX: stable qqc2-desktop-style already in Guix; -git needs entire KDE Frameworks -git stack
;;;       16.  python-unitypy-git -> EXCESSIVE_PYTHON_DEPS: 7 niche Python libs not in Guix; C++20 native extensions
;;;       17.  stayfree-desktop -> NONFREE_PROPRIETARY: closed-source screen time tracker; no source code
;;;       18.  ftnn-desktop -> NONFREE_PROPRIETARY: proprietary Chinese stock trading client (Futu/Futubull)
;;;       19.  oblivion-desktop-git -> NONFREE_LICENSE: custom license prohibits redistribution; Electron-based
;;;       20.  gosplugin -> NONFREE_PROPRIETARY: Russian government crypto plugin; closed-source binary
;;;       21.  fastmail -> NONFREE_PROPRIETARY: proprietary Electron wrapper for commercial email service
;;;       22.  cheminot -> NONFREE_PROPRIETARY: proprietary university Java Web Start app; obsolete technology
;;;       23.  vlc-git -> ALREADY_IN_GUIX: VLC is already packaged in Guix; -git variant adds no channel value
;;;       24.  godot-git -> ALREADY_IN_GUIX: Godot is already packaged in Guix; -git variant adds no channel value
;;;       25.  geant4 -> ALREADY_IN_GUIX: available in guix-science channel; Geant4 Software License (non-standard)
;;;       26.  cnijfilter2-g3010 -> NONFREE_PROPRIETARY: Canon printer driver; restrictive license; binary blobs
;;;       27.  proton-cachyos-launcher -> DISTRO_SPECIFIC: trivial launcher for CachyOS-specific Proton fork
;;;       28.  systemd-liberated-libs-git -> DISTRO_SPECIFIC: systemd client libs not needed on Guix (uses Shepherd)
;;;       29.  watt-toolkit-bin -> DOTNET_RUNTIME_DEP: requires aspnet-runtime-10.0 + dotnet-runtime-10.0 not in Guix
;;;       30.  pm2ml -> DISTRO_SPECIFIC: Pacman metalink generator; depends on pyalpm (Arch-only); no Guix utility
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260419a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (termirs-bin))

;;; -------------------------------------------------------------------
;;; 1. termirs-bin --- Modern async SSH/SFTP terminal client
;;; Prebuilt statically-linked Rust binary from GitHub releases.
;;; Supports SSH and SFTP with a TUI interface built on ratatui.
;;; -------------------------------------------------------------------
(define-public termirs-bin
  (package
    (name "termirs-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/caelansar/termirs/releases/download/v"
                    version "/termirs-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("termirs" "bin/termirs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/caelansar/termirs")
    (synopsis "Modern async SSH/SFTP terminal client")
    (description "Termirs is a modern, async SSH and SFTP terminal client
written in Rust.  It provides a TUI interface for managing SSH connections
and file transfers, with support for SSH key authentication, port
forwarding, and integrated SFTP browsing.")
    (license license:expat)))
