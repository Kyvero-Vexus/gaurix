;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (5):
;;;     1.  errands-c (gnu-build-system, v49.0, expat)
;;;     2.  netcheck (pyproject-build-system, v1.10.1, gpl2+)
;;;     3.  flatpak-builder-tools (copy-build-system, v0.0.1-git, expat)
;;;     4.  shutter-encoder (copy-build-system, v20.0, gpl3)
;;;     5.  phonon-mpv (cmake-build-system, v0.1.0, lgpl2.1)
;;;
;;; ALREADY_IN_GUIX (2):
;;;     6.  python315 -> already in upstream Guix as python (version variants)
;;;     7.  libxml2-git -> already in upstream Guix as libxml2
;;;
;;; BLOCKED EXHAUSTED (23):
;;;     8.  pesconvert-git -> NEEDS_RECIPE_DESIGN_EXHAUSTED: NO_LICENSE:
;;;         no LICENSE/COPYING file in repository; legally cannot redistribute;
;;;         A1: no license declared; A2: contacting author impractical for channel;
;;;         A3: all-rights-reserved by default without explicit license
;;;     9.  pyload-ng -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PYTHON_DEEP_DEPS:
;;;         requires mini-racer (V8 JS engine) + 15 Flask packages + pycurl;
;;;         A1: mini-racer wraps V8 (>100MB C++ build) not in Guix;
;;;         A2: no stable release (all versions are dev/beta);
;;;         A3: heavy web framework dependency chain
;;;    10.  shorewall6 -> NEEDS_RECIPE_DESIGN_EXHAUSTED: MISSING_DEPS:
;;;         requires shorewall-core + shorewall base packages not in Guix;
;;;         A1: package shorewall-core first — shell-script installer, non-standard;
;;;         A2: shorewall project dormant since 2020;
;;;         A3: Guix System uses nftables/iptables directly via service configs
;;;    11.  cassette -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_BUILD:
;;;         Vala/GTK4 Yandex Music client with internal libtape-0 subproject;
;;;         A1: needs blueprint-compiler not in Guix;
;;;         A2: Meson subproject (libtape-0) must be vendored or packaged separately;
;;;         A3: depends on webkitgtk-6.0 for authentication
;;;    12.  melonds-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_REPACK:
;;;         previously resolved in recipe-resolver-260413n, re-blocked;
;;;         A1: AppImage inside zip needs patchelf + dynamic linker fixup;
;;;         A2: binary extraction and relinking fragile across Guix updates;
;;;         A3: source build preferred but needs Qt6 + OpenGL + complex deps
;;;    13.  keystore-explorer-bin -> NEEDS_RECIPE_DESIGN_EXHAUSTED: COMPLEX_REPACK:
;;;         previously resolved in recipe-resolver-260413n, re-blocked;
;;;         A1: Java app needs JRE wrapper + desktop integration;
;;;         A2: non-standard packaging (custom installer script);
;;;         A3: alternative: use keytool bundled with OpenJDK
;;;    14.  php84 -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PHP_VERSION_VARIANT:
;;;         Guix packages PHP with extensions built-in; separate version
;;;         packaging requires maintaining full build from php.net;
;;;         A1: Guix php already available at stable versions;
;;;         A2: 8.4 is latest stable but Guix update cycle handles this;
;;;         A3: individual extension split packages are Arch-specific pattern
;;;    15-24. php84-bcmath, php84-bz2, php84-calendar, php84-cgi, php84-cli,
;;;         php84-ctype, php84-curl, php84-dba, php84-dblib, php84-dom
;;;         -> NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT:
;;;         Arch splits PHP into per-extension packages; Guix builds PHP as
;;;         single package with extensions compiled in; these are not separate
;;;         packages in the Guix model
;;;    25.  php84-embed -> NEEDS_RECIPE_DESIGN_EXHAUSTED: SUBSUMES_BY_PARENT
;;;    26.  vulkan-amdgpu-pro -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD:
;;;         proprietary AMD Vulkan driver; closed-source binary blob;
;;;         A1: proprietary license prohibits redistribution;
;;;         A2: mesa provides open-source AMD Vulkan (RADV);
;;;         A3: nonguix channel handles proprietary drivers
;;;    27.  lib32-vulkan-amdgpu-pro -> NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;         PROPRIETARY_AMD + MULTILIB: 32-bit proprietary AMD Vulkan;
;;;         A1: proprietary; A2: Guix lacks multilib; A3: use RADV
;;;    28.  lib32-amdgpu-pro-oglp -> NEEDS_RECIPE_DESIGN_EXHAUSTED:
;;;         PROPRIETARY_AMD + MULTILIB: 32-bit proprietary AMD OpenGL;
;;;         A1: proprietary; A2: Guix lacks multilib; A3: mesa radeonsi
;;;    29.  amf-amdgpu-pro -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD:
;;;         proprietary AMD Advanced Media Framework;
;;;         A1: closed-source hardware encoder; A2: no open equivalent;
;;;         A3: VA-API provides open-source alternative for video encoding
;;;    30.  amdgpu-pro-oglp -> NEEDS_RECIPE_DESIGN_EXHAUSTED: PROPRIETARY_AMD:
;;;         proprietary AMD OpenGL Pro driver;
;;;         A1: proprietary license; A2: mesa radeonsi is open-source alternative;
;;;         A3: nonguix handles proprietary drivers
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:export (
            errands-c
            netcheck
            flatpak-builder-tools
            shutter-encoder
            phonon-mpv))

;;; -------------------------------------------------------------------
;;; 1. errands-c --- GNOME todo application rewritten in C
;;; -------------------------------------------------------------------
(define-public errands-c
  (package
    (name "errands-c")
    (version "49.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mrvladus/Errands")
                    (commit "dcb49fb4d4e6d2e45c58476655818b4b6dabecd9")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))  ;; plain Makefile, no configure script
    (native-inputs (list pkg-config))
    (inputs (list libadwaita
                  gtksourceview
                  libical
                  curl
                  libsecret
                  libportal))
    (home-page "https://github.com/mrvladus/Errands")
    (synopsis "todo application for those who prefer simplicity")
    (description "Errands is a GNOME task management application rewritten in C
for improved performance.  It uses GTK4 and libadwaita for a modern
GNOME-native interface, supports CalDAV/Nextcloud sync via libical, and
provides a simple, clean task list experience.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. netcheck --- network connectivity monitor
;;; -------------------------------------------------------------------
(define-public netcheck
  (package
    (name "netcheck")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gene-git/netcheck")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (inputs (list python))
    (home-page "https://github.com/gene-git/netcheck")
    (synopsis "check and record network packet losses")
    (description "Netcheck monitors network connectivity by checking packet
losses and saving results to files.  Results can be turned into time-series
plots with the companion netcheck-plot tool.  Designed to run from cron, it
checks multiple hosts in parallel using asyncio.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 3. flatpak-builder-tools --- helper scripts for Flatpak manifests
;;; -------------------------------------------------------------------
(define-public flatpak-builder-tools
  (package
    (name "flatpak-builder-tools")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nickvision-cinnamon/flatpak-builder-tools")
                    (commit "34ecf07e2b3f0f92f3b9e693acb96bf33f575de5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pip/" "share/flatpak-builder-tools/pip/")
               ("cargo/" "share/flatpak-builder-tools/cargo/")
               ("node/" "share/flatpak-builder-tools/node/")
               ("npm/" "share/flatpak-builder-tools/npm/"))))
    (inputs (list python))
    (home-page "https://github.com/nickvision-cinnamon/flatpak-builder-tools")
    (synopsis "helper scripts for generating flatpak-builder manifests")
    (description "A collection of scripts that generate flatpak-builder manifest
JSON/YAML from various package manager lock files.  Includes generators for
pip, npm, cargo, and other ecosystems.  Intended for use in Flatpak build
processes.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. shutter-encoder --- media transcoding tool based on FFmpeg
;;; -------------------------------------------------------------------
(define-public shutter-encoder
  (package
    (name "shutter-encoder")
    (version "20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/paulpacifico/shutter-encoder/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/shutter-encoder/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jar (string-append out "/share/shutter-encoder/Shutter Encoder.jar"))
                     (java (search-input-file inputs "bin/java"))
                     (ffmpeg-dir (dirname
                                  (search-input-file inputs "bin/ffmpeg"))))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/shutter-encoder")
                  (lambda ()
                    (format #t "#!/bin/sh~%exec ~a -jar '~a' \"$@\"~%"
                            java jar)))
                (chmod (string-append bin "/shutter-encoder") #o755)))))))
    (inputs (list (list openjdk "jdk") ffmpeg-6))
    (home-page "https://www.shutterencoder.com")
    (synopsis "professional video compression tool based on FFmpeg")
    (description "Shutter Encoder is a free media transcoding application with
a Java GUI built on FFmpeg.  It supports a wide range of video, audio, and
image formats with features like batch processing and subtitle extraction.
Designed for video editors and post-production professionals.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. phonon-mpv --- Phonon multimedia backend using MPV
;;; -------------------------------------------------------------------
(define-public phonon-mpv
  (package
    (name "phonon-mpv")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/OpenProgger/phonon-mpv")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:configure-flags
      #~(list "-DPHONON_BUILD_QT5=ON"
              "-DPHONON_BUILD_QT6=OFF")))
    (native-inputs (list extra-cmake-modules))
    (inputs (list phonon
                  qtbase-5
                  mpv))
    (home-page "https://github.com/OpenProgger/phonon-mpv")
    (synopsis "Phonon multimedia backend using MPV")
    (description "Phonon-mpv is a Phonon backend that uses libmpv as its
multimedia engine.  It provides an alternative to the VLC and GStreamer
backends for KDE's Phonon multimedia framework.  Configuration is read
from @file{~/.config/Phonon/mpv.conf}.")
    (license license:lgpl2.1)))
