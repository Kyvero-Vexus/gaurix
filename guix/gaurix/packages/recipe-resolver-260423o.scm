;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423o
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (15):
;;;        1.  amalgo-bin (copy-build-system, v0.5.1, GPL-3.0)
;;;        2.  bab-bin (copy-build-system, v0.8.1, MIT)
;;;        3.  shaka-packager-bin (copy-build-system, v3.7.2, BSD-3-Clause)
;;;        4.  ssh2incus-bin (copy-build-system, v0.10, GPL-3.0)
;;;        5.  zen-adblocker-bin (copy-build-system, v0.20.0, MIT)
;;;        6.  vermin-bin (copy-build-system, v0.130.0, Apache-2.0)
;;;        7.  binvec-bin (copy-build-system, v1.20.21, MIT)
;;;        8.  tabular-bin (copy-build-system, v0.7.0, AGPL-3.0)
;;;        9.  logisim-ita-bin (copy-build-system, v2.16.2.2, GPL-3.0)
;;;       10.  ffdec-bin (copy-build-system, v26.0.0, GPL-3.0+)
;;;       11.  llama.cpp-vulkan-bin (copy-build-system, b8911, MIT)
;;;       12.  kerminal-bin (copy-build-system, v2.6.5, MIT)
;;;       13.  python-proglog (pyproject-build-system, v0.1.12, MIT)
;;;       14.  aggregate (gnu-build-system, v1.6, ISC)
;;;       15.  ymuse-bin (copy-build-system, v0.22, Apache-2.0)
;;;
;;; BLOCKED (15):
;;;        1.  ttf-hellvetica — NON_FREE_LICENSE: personal use only
;;;        2.  ttf-segoe-ui-variable — PROPRIETARY: Microsoft font license
;;;        3.  heynote-bin — COMMONS_CLAUSE: non-FOSS license
;;;        4.  ttf-fonts-gb-deepin — UNCLEAR_SOURCE: upstream source/license unconfirmed
;;;        5.  dosbox-pure-unleashed-bin — NO_STABLE_RELEASE: preview only
;;;        6.  landrop-bin — NO_VERSIONED_URL: AppImage lacks version in URL
;;;        7.  garlmap-bin — ELECTRON_COMPLEX: Electron AppImage with mpv dep
;;;        8.  nuclear-player-bin — ELECTRON_COMPLEX: Electron app, 200+ bundled deps
;;;        9.  openoffice-bin — COMPLEX_REPACK: RPM tarball extraction needed
;;;       10.  heidisql-qt6-bin — MISSING_GUIX_DEPS: needs libqt6pas not in Guix
;;;       11.  technitium-dns-server-bin — DOTNET_REQUIRED: needs .NET 9 runtime
;;;       12.  yarc-launcher-bin — NON_STANDARD_LICENSE: YARG License not SPDX
;;;       13.  python-pdf2doi — MISSING_DEPS: needs unpackaged Python deps
;;;       14.  python-pympress — COMPLEX_DEPS: GTK3/poppler-glib/cairo integration
;;;       15.  python-speechrecognition — COMPLEX_NATIVE_DEPS: portaudio/flac/pocketsphinx
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423o)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            amalgo-bin
            bab-bin
            shaka-packager-bin
            ssh2incus-bin
            zen-adblocker-bin
            vermin-bin
            binvec-bin
            tabular-bin
            logisim-ita-bin
            ffdec-bin
            llama.cpp-vulkan-bin
            kerminal-bin
            python-proglog
            aggregate
            ymuse-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. amalgo-bin --- CLI for creating single-file code snapshots
;;; -------------------------------------------------------------------
(define-public amalgo-bin
  (package
    (name "amalgo-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Broderick-Westrope/amalgo/releases/download/v"
                    version "/amalgo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("amalgo" "bin/amalgo"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "create single-file snapshots of multiple code files")
    (description "Amalgo is a CLI tool for creating single-file snapshots of
multiple code files.  It combines source files into a single document suitable
for sharing with LLMs, documentation, or code review.")
    (home-page "https://github.com/Broderick-Westrope/amalgo")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 2. bab-bin --- dependency-free task runner using YAML
;;; -------------------------------------------------------------------
(define-public bab-bin
  (package
    (name "bab-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bab-sh/bab/releases/download/v"
                    version "/bab_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bab" "bin/bab"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "dependency-free task runner using YAML configuration")
    (description "Bab is a modern, dependency-free task runner that replaces
Makefiles and npm scripts.  It uses YAML configuration for defining project
commands with support for variables, conditions, and cross-platform operation.")
    (home-page "https://github.com/bab-sh/bab")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 3. shaka-packager-bin --- media packaging for DASH and HLS
;;; -------------------------------------------------------------------
(define-public shaka-packager-bin
  (package
    (name "shaka-packager-bin")
    (version "3.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shaka-project/shaka-packager/releases/download/v"
                    version "/packager-linux-x64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("packager-linux-x64" "bin/shaka-packager"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "packager-linux-x64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "media packaging framework for DASH and HLS streaming")
    (description "Shaka Packager is a media packaging and development
framework for DASH and HLS packaging, supporting Common Encryption for
Widevine and other DRM systems.  Developed by Google as part of the Shaka
Player project.")
    (home-page "https://github.com/shaka-project/shaka-packager")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 4. ssh2incus-bin --- SSH server for Incus instances
;;; -------------------------------------------------------------------
(define-public ssh2incus-bin
  (package
    (name "ssh2incus-bin")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mobydeck/ssh2incus/releases/download/"
                    version "/ssh2incus_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ssh2incus" "bin/ssh2incus"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SSH server that routes connections to Incus instances")
    (description "ssh2incus is an SSH server for Incus containers and virtual
machines.  It routes SSH connections to instances via the Incus API without
requiring SSH to be installed inside the containers.")
    (home-page "https://github.com/mobydeck/ssh2incus")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 5. zen-adblocker-bin --- system-wide ad blocker and privacy guard
;;; -------------------------------------------------------------------
(define-public zen-adblocker-bin
  (package
    (name "zen-adblocker-bin")
    (version "0.20.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AnyRoad/zen-desktop/releases/download/v"
                    version "/Zen_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zen" "bin/zen-adblocker"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source system-wide ad blocker and privacy guard")
    (description "Zen is an open-source system-wide ad blocker and privacy
guard.  It works as an HTTP proxy intercepting requests from all applications,
blocking ads and trackers at the network level.")
    (home-page "https://github.com/AnyRoad/zen-desktop")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. vermin-bin --- smart virtual machines manager
;;; -------------------------------------------------------------------
(define-public vermin-bin
  (package
    (name "vermin-bin")
    (version "0.130.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mhewedy/vermin/releases/download/v"
                    version "/vermin-linux-amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vermin-linux-amd64" "bin/vermin"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "vermin-linux-amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "smart virtual machines manager using Vagrant boxes")
    (description "Vermin is a smart virtual machines manager that provides a
modern CLI for managing Vagrant Boxes.  It simplifies VM lifecycle management
with support for VirtualBox and QEMU backends.")
    (home-page "https://github.com/mhewedy/vermin")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 7. binvec-bin --- raster-to-vector graphics converter
;;; -------------------------------------------------------------------
(define-public binvec-bin
  (package
    (name "binvec-bin")
    (version "1.20.21")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RouHim/binvec/releases/download/"
                    version "/binvec-linux-x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("binvec-linux-x86_64" "bin/binvec"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod
                 (lambda _
                   (chmod "binvec-linux-x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert raster graphics to vector graphics")
    (description "Binvec is a graphical application for converting raster
graphics (PNG, JPEG, BMP) to vector graphics (SVG).  Built with Rust and the
Iced UI toolkit.")
    (home-page "https://github.com/RouHim/binvec")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 8. tabular-bin --- SQL and NoSQL database client
;;; -------------------------------------------------------------------
(define-public tabular-bin
  (package
    (name "tabular-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tabular-id/tabular/releases/download/v"
                    version "/tabular_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/tabular" "bin/tabular")
               ("usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast native SQL and NoSQL database client")
    (description "Tabular is a fast, native, cross-platform database client
built in Rust.  It supports MySQL, PostgreSQL, SQLite, Redis, MongoDB, and
other database engines with a modern interface.")
    (home-page "https://github.com/tabular-id/tabular")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 9. logisim-ita-bin --- digital logic circuit simulator
;;; -------------------------------------------------------------------
(define-public logisim-ita-bin
  (package
    (name "logisim-ita-bin")
    (version "2.16.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Logisim-Ita/Logisim/releases/download/v"
                    version "/logisim-generic-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("logisim.jar" "share/java/logisim-ita.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "logisim.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/logisim-ita.jar")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/logisim-ita")
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec java -jar " jar " \"$@\"\n"))))
                     (chmod (string-append bin "/logisim-ita") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "educational digital logic circuit designer and simulator")
    (description "Logisim-ITA is an Italian fork of Logisim, an educational
tool for designing and simulating digital logic circuits.  It provides a
graphical interface for building circuits with gates, flip-flops, and other
components.")
    (home-page "https://github.com/Logisim-Ita/Logisim")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 10. ffdec-bin --- Flash SWF decompiler and editor
;;; -------------------------------------------------------------------
(define-public ffdec-bin
  (package
    (name "ffdec-bin")
    (version "26.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jindrapetrik/jpexs-decompiler/releases/download/version"
                    version "/ffdec_" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ffdec.jar" "share/java/ffdec.jar")
               ("lib" "share/java/lib"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/ffdec.jar")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/ffdec")
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec java -jar " jar " \"$@\"\n"))))
                     (chmod (string-append bin "/ffdec") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source Flash SWF decompiler and editor")
    (description "JPEXS Free Flash Decompiler (FFDec) is an open-source tool
for decompiling and editing Adobe Flash SWF files.  It can extract resources,
decompile ActionScript, and export assets from Flash content.")
    (home-page "https://github.com/jindrapetrik/jpexs-decompiler")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. llama.cpp-vulkan-bin --- LLM inference with Vulkan acceleration
;;; -------------------------------------------------------------------
(define-public llama.cpp-vulkan-bin
  (package
    (name "llama.cpp-vulkan-bin")
    (version "b8911")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggml-org/llama.cpp/releases/download/"
                    version "/llama-" version "-bin-ubuntu-vulkan-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("build/bin/." "bin"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'chmod-binaries
                 (lambda _
                   (for-each (lambda (f) (chmod f #o755))
                             (find-files "build/bin" "")))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "LLM inference in C/C++ with Vulkan GPU acceleration")
    (description "llama.cpp is a high-performance LLM inference engine
implemented in C/C++.  This binary package includes Vulkan GPU acceleration
for running large language models efficiently on GPUs that support the Vulkan
compute API.")
    (home-page "https://github.com/ggml-org/llama.cpp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. kerminal-bin --- modern terminal emulator and SSH manager
;;; -------------------------------------------------------------------
(define-public kerminal-bin
  (package
    (name "kerminal-bin")
    (version "2.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/klpod221/kerminal/releases/download/v"
                    version "/Kerminal_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/kerminal" "bin/kerminal")
               ("usr/share" "share"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern terminal emulator and SSH manager")
    (description "Kerminal is a modern terminal emulator and SSH manager built
with Tauri.  It features encrypted SSH profiles, tunneling support, and
multi-device synchronization.")
    (home-page "https://github.com/klpod221/kerminal")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. python-proglog --- progress logging for Python
;;; -------------------------------------------------------------------
(define-public python-proglog
  (package
    (name "python-proglog")
    (version "0.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/p/proglog/proglog-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "progress logging system for Python libraries")
    (description "Proglog provides a unified progress logging interface for
Python.  It allows library authors to write progress-reporting code that can
use different backends including text logs, progress bars, and custom
callbacks.")
    (home-page "https://github.com/Edinburgh-Genome-Foundry/Proglog")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. aggregate --- IP prefix aggregation tool
;;; -------------------------------------------------------------------
(define-public aggregate
  (package
    (name "aggregate")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ftp.isc.org/isc/aggregate/aggregate-"
                    version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (synopsis "optimise a list of IP route prefixes to remove redundancy")
    (description "Aggregate takes a list of prefixes in conventional format on
stdin, and performs two optimisations to attempt to reduce the length of the
prefix list: duplicate removal and subnet aggregation.  Useful for optimising
router configurations and firewall rules.")
    (home-page "https://ftp.isc.org/isc/aggregate/")
    (license license:isc)))

;;; -------------------------------------------------------------------
;;; 15. ymuse-bin --- GTK client for Music Player Daemon
;;; -------------------------------------------------------------------
(define-public ymuse-bin
  (package
    (name "ymuse-bin")
    (version "0.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yktoo/ymuse/releases/download/v"
                    version "/ymuse_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ymuse" "bin/ymuse"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "easy, functional, and snappy client for Music Player Daemon")
    (description "Ymuse is a GTK3 client for the Music Player Daemon (MPD),
written in Go.  It provides an easy-to-use interface for browsing and playing
music through an MPD server.")
    (home-page "https://github.com/yktoo/ymuse")
    (license license:asl2.0)))
