;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415j
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue.
;;; 14 resolved with recipes; 16 re-evaluated with concrete exhaust reasons.
;;;
;;; Recipes (14 new):
;;;   1. font-hackgen (copy, v2.10.0, Japanese programming font, OFL-1.1)
;;;   2. iamroot (gnu, v23, LD_PRELOAD privilege emulation, LGPL-2.1)
;;;   3. zpaqfranz (gnu, v64.7, ZPAQ archiver/backup, MIT+mixed)
;;;   4. complete-alias (copy, v1.18.0, bash completion for aliases, GPL-3.0+)
;;;   5. asroot (gnu, v1.1.12, simple sudo alternative, ISC)
;;;   6. objconv (gnu, v2.50, object file format converter, GPL-2.0+)
;;;   7. libklvanc (gnu, v1.6.0, VANC data parsing library, LGPL-2.1)
;;;   8. logiops (cmake, v0.3.5, Logitech device configuration, GPL-3.0+)
;;;   9. python-zenlib (pyproject, v3.3.0, Python utility library, GPL-2.0)
;;;   10. qr-backup (gnu, v1.1.4, QR code paper backup, CC0/public-domain)
;;;   11. avvie (meson, v2.4, GTK4 avatar cropper, GPL-3.0+)
;;;   12. goxe (go, v1.6.0, log reduction tool, Apache-2.0)
;;;   13. pmtiles-bin (copy, v1.30.1, cloud-optimized map tiles CLI, BSD-3)
;;;   14. dred (gnu, v0.4.3, minimal text editor, MIT)
;;;
;;; Exhausted (16):
;;;   - posy-improved-cursors (#5031): NONFREE_LICENSE: CC-BY-NC-4.0 prohibits
;;;     commercial use; violates FSDG
;;;   - scmccid (#5339): PROPRIETARY_BINARY: proprietary license, binary-only
;;;     driver; use open-source ccid package instead
;;;   - ttf-aptos (#8037): PROPRIETARY_LICENSE: Microsoft EULA prohibits
;;;     redistribution; cannot package
;;;   - soundfont-fatboy (#7745): NO_LICENSE: no license specified; cannot
;;;     determine redistribution rights
;;;   - python-cryptg (#10690): RUST_MATURIN_BUILD: requires Rust/maturin build
;;;     chain with vendored crates; complex cross-ecosystem build
;;;   - pyradio (#5341): HEAVY_PYTHON_DEPS: 8+ Python runtime deps
;;;     (dnspython, psutil, rich, dateutil, netifaces, dbus-next, etc.)
;;;   - python-ghlang (#5270): MISSING_PYTHON_DEPS: requires bdfparser, typer
;;;     deps not fully available; heavy matplotlib chain
;;;   - keychron-link-udev (#4168): NO_UPSTREAM: no real upstream project;
;;;     trivial udev rules better as Guix system service
;;;   - noto-fonts-cjk-fontconfig (#5444): CONFIG_ONLY: fontconfig XML snippet;
;;;     Guix handles via fonts-service-type; not a standalone package
;;;   - recaf (#3454): JAVA_GRADLE_JAVAFX: Gradle+JavaFX build; JavaFX not
;;;     readily available in Guix; 2.x line officially unsupported
;;;   - procexp (#1079): PYQT6_DEPS: Python/PyQt6 with pyqtgraph, configobj;
;;;     complex Qt6 Python integration
;;;   - tnoodle-cli (#3441): KOTLIN_GRADLE: Kotlin/Gradle build with mixed
;;;     TypeScript; Kotlin poorly supported in Guix
;;;   - tnoodle-wca (#3442): KOTLIN_GRADLE: same as tnoodle-cli; depends on
;;;     same Kotlin/Gradle infrastructure
;;;   - h2status (#4589): NO_UPSTREAM: only a ~50 LOC GitHub Gist; no
;;;     releases, no license, not a proper project
;;;   - fsign (#4574): NO_RELEASES: only 13 commits, no tagged releases;
;;;     too immature for stable packaging
;;;   - fulcrum (#4260): BUNDLED_ROCKSDB: qmake build with bundled RocksDB;
;;;     complex C++20 requirements; Qt version compatibility concerns
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415j)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            font-hackgen
            iamroot
            zpaqfranz
            complete-alias
            asroot
            objconv
            libklvanc
            logiops
            python-zenlib
            qr-backup
            avvie
            goxe
            pmtiles-bin
            dred
            ))

;;;
;;; --- 1. font-hackgen ---
;;; HackGen is a Japanese programming font combining Hack and
;;; GenJyuuGothic (Source Han Sans derivative).
;;; Pre-built TTF files from GitHub releases.
;;; Upstream: https://github.com/yuru7/HackGen
;;;

(define-public font-hackgen
  (package
    (name "font-hackgen")
    (version "2.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yuru7/HackGen/releases/download/v"
                    version "/HackGen_v" version ".zip"))
              (sha256
               (base32
                "1dwdg1xqddznsm4y46v5agiml2r88mmjz4x7vsa2sycm9cm2w67d"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/hackgen/"
           #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (synopsis "Japanese programming font combining Hack and GenJyuuGothic")
    (description
     "HackGen is a composite programming font that merges the latin
glyphs of Hack with the Japanese glyphs of GenJyuuGothic (a Source Han
Sans derivative).  It provides a consistent coding experience for
mixed-script environments with multiple width variants including
HackGen35 (3:5 half-width to full-width ratio) and Console variants.")
    (home-page "https://github.com/yuru7/HackGen")
    (license license:silofl1.1)))

;;;
;;; --- 2. iamroot ---
;;; LD_PRELOAD library emulating privileged system calls for
;;; unprivileged users, enabling rootless rootfs creation.
;;; Upstream: https://github.com/gportay/iamroot
;;;

(define-public iamroot
  (package
    (name "iamroot")
    (version "23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gportay/iamroot/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "039rs2xvl3n2lqard59v3zbfx7cg51xxkrn94m6bjb7hg3r8fc7k"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests need root-like environment
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              "CC=gcc")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))          ;no configure script
    (synopsis "LD_PRELOAD library for unprivileged chroot emulation")
    (description
     "Iamroot is an LD_PRELOAD shared library that intercepts and
emulates privileged system calls such as chroot, chown, and mknod for
unprivileged users.  This enables building root file systems and
running package managers without requiring actual root privileges.")
    (home-page "https://github.com/gportay/iamroot")
    (license license:lgpl2.1)))

;;;
;;; --- 3. zpaqfranz ---
;;; Advanced ZPAQ archiver and target-backup utility.
;;; Single large C++ source file with Makefile.
;;; Upstream: https://github.com/fcorbelli/zpaqfranz
;;;

(define-public zpaqfranz
  (package
    (name "zpaqfranz")
    (version "64.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fcorbelli/zpaqfranz/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1rpmm36iz3h2vjirbkkdl30ski0qbbqm7kjmn47ll5vcnbbvkspk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:make-flags
      #~(list "CC=gcc"
              "CXX=g++"
              "CXXFLAGS=-O3 -pthread")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)             ;no configure script
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "zpaqfranz" bin)))))))
    (synopsis "advanced ZPAQ archiver and backup utility")
    (description
     "Zpaqfranz is an enhanced fork of the ZPAQ archiver that adds
enterprise-grade features including SHA-1/SHA-256/XXH3 checksums,
data deduplication, cumulative and rolling backups, file comparison,
and optional AES encryption.  It supports ZPAQ levels 0 through 5
for configurable compression ratios.")
    (home-page "https://github.com/fcorbelli/zpaqfranz")
    (license (list license:expat license:public-domain))))

;;;
;;; --- 4. complete-alias ---
;;; Bash completion function for aliases.
;;; Pure shell script.
;;; Upstream: https://github.com/cykerway/complete-alias
;;;

(define-public complete-alias
  (package
    (name "complete-alias")
    (version "1.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cykerway/complete-alias/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0ibljb5wm4r4f9hr18x833isjadasvpgw2i8jxfl2l4nfb18ajy3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("complete_alias" "share/bash-completion/completions/complete_alias"))))
    (synopsis "programmable completion function for bash aliases")
    (description
     "Complete-alias provides a Bash function @code{_complete_alias}
that enables programmable tab-completion for shell aliases.  When an
alias expands to a known command, completions from that command are
forwarded to the alias, providing seamless tab-completion for aliased
commands.")
    (home-page "https://github.com/cykerway/complete-alias")
    (license license:gpl3+)))

;;;
;;; --- 5. asroot ---
;;; Simple alternative to sudo and doas.
;;; C with Makefile.
;;; Upstream: https://codeberg.org/maandree/asroot
;;;

(define-public asroot
  (package
    (name "asroot")
    (version "1.1.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/maandree/asroot/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "09xqi96ir068qwy2z7qa7sdvridg9dzf9fah353adpzih9dlz3xg"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests need PAM/root
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              "CC=gcc")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)             ;no configure script
          (add-after 'unpack 'fix-makefile
            (lambda _
              ;; Codeberg archives prepend directory differently
              (when (file-exists? "asroot")
                (chdir "asroot")))))))
    (inputs (list linux-pam))
    (synopsis "simpler alternative to sudo and doas")
    (description
     "Asroot is a minimal privilege escalation tool that authenticates
users via PAM and runs commands as root.  It sanitizes the environment
and restricts usage to members of the wheel group, providing a simpler
and more auditable alternative to sudo or doas.")
    (home-page "https://codeberg.org/maandree/asroot")
    (license license:isc)))

;;;
;;; --- 6. objconv ---
;;; Object file format converter and disassembler by Agner Fog.
;;; Converts between COFF, OMF, ELF, and Mach-O.
;;; Upstream: https://www.agner.org/optimize/
;;;

(define-public objconv
  (package
    (name "objconv")
    (version "2.50")
    (source (origin
              (method url-fetch)
              (uri "https://www.agner.org/optimize/objconv.zip")
              (sha256
               (base32
                "1ycvfza7xbwrwfw952dvj62hyn6dgrizyyjdl48ppbzzf714j49h"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)
              (invoke "unzip" "source.zip" "-d" "src")))
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "g++" "-O2" "-o" "objconv"
                      "-Isrc"
                      "src/main.cpp"
                      "src/elf2asm.cpp"
                      "src/cof2elf.cpp"
                      "src/elf2cof.cpp"
                      "src/cof2omf.cpp"
                      "src/omf2cof.cpp"
                      "src/elf2mac.cpp"
                      "src/mac2elf.cpp"
                      "src/cof2asm.cpp"
                      "src/omf2asm.cpp"
                      "src/mac2asm.cpp"
                      "src/disasm1.cpp"
                      "src/disasm2.cpp"
                      "src/library.cpp"
                      "src/error.cpp"
                      "src/containers.cpp"
                      "src/cmdline.cpp")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "objconv"
                            (string-append (assoc-ref outputs "out")
                                           "/bin")))))))
    (native-inputs (list unzip))
    (synopsis "object file format converter and disassembler")
    (description
     "Objconv converts object files between COFF/PE, OMF, ELF, and
Mach-O formats for 32-bit and 64-bit x86.  It includes a disassembler
that supports SSE4, AVX, AVX-512, and other instruction set extensions.
It is useful for cross-platform development and binary analysis.")
    (home-page "https://www.agner.org/optimize/")
    (license license:gpl2+)))

;;;
;;; --- 7. libklvanc ---
;;; Library for parsing and generating VANC (Vertical Ancillary Data)
;;; in SDI video streams per SMPTE standards.
;;; Upstream: https://github.com/stoth68000/libklvanc
;;;

(define-public libklvanc
  (package
    (name "libklvanc")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/stoth68000/libklvanc/archive/refs/tags/"
                    "vid.obe." version ".tar.gz"))
              (sha256
               (base32
                "1hs8r6qpng8kzjnmim4gmnlkf6dji6hhp26dsbmg8kjs8m4clxjh"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (synopsis "VANC data parsing library for SDI video")
    (description
     "Libklvanc is a C library for parsing and generating Vertical
Ancillary Data (VANC) in SDI video streams.  It implements multiple
SMPTE standards including closed captions (CEA-708/EIA-608), timecodes
(SMPTE 12M), HDR metadata (SMPTE ST 2108), and SCTE-104 ad insertion
triggers.  It is used in broadcast video infrastructure.")
    (home-page "https://github.com/stoth68000/libklvanc")
    (license license:lgpl2.1)))

;;;
;;; --- 8. logiops ---
;;; Unofficial userspace driver for Logitech HID++ devices.
;;; Configures buttons, DPI, smartshift, gestures.
;;; Upstream: https://github.com/PixlOne/logiops
;;;

(define-public logiops
  (package
    (name "logiops")
    (version "0.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PixlOne/logiops/releases/download/v"
                    version "/logiops-v" version ".tar.gz"))
              (sha256
               (base32
                "16797848jazxian1aj026dpc5iy3ckkr83z5xbjwb83bkldv16jm"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")))
    (native-inputs
     (list pkg-config))
    (inputs
     (list eudev
           glib
           libconfig
           libevdev))
    (synopsis "unofficial userspace driver for Logitech HID++ devices")
    (description
     "LogiOps is a userspace daemon that configures Logitech mice and
keyboards using the HID++ protocol.  It supports button remapping,
DPI configuration, SmartShift sensitivity, gesture controls, and
per-application profiles.  It works with Logitech Unifying, Bolt,
and Bluetooth receivers.")
    (home-page "https://github.com/PixlOne/logiops")
    (license license:gpl3+)))

;;;
;;; --- 9. python-zenlib ---
;;; Utility library for Python with logging decorators and helpers.
;;; Upstream: https://github.com/desultory/zenlib
;;;

(define-public python-zenlib
  (package
    (name "python-zenlib")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/desultory/zenlib/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0fkw36ixwmcw3zdlpzny4w5zg8f40g1pjnh1gmgksy37mraysldf"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                  ;no test suite provided
    (native-inputs
     (list python-setuptools python-wheel))
    (synopsis "Python utility library with logging and argument parsing")
    (description
     "Zenlib is a Python utility library providing the @code{@@loggify}
decorator for automatic class-level logging, argument parsing helpers,
dictionary utilities, and @code{NoDupFlatList} for duplicate-free flat
list operations.  It simplifies common boilerplate patterns in Python
applications.")
    (home-page "https://github.com/desultory/zenlib")
    (license license:gpl2)))

;;;
;;; --- 10. qr-backup ---
;;; Back up files to paper using QR codes with Reed-Solomon
;;; error correction.
;;; Upstream: https://github.com/za3k/qr-backup
;;;

(define-public qr-backup
  (package
    (name "qr-backup")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/za3k/qr-backup/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "17qywymx7043qdqzjz0shi8cq94krrcbgpyx7hhbb9dkg1f3awnx"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;tests need scanner hardware
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))          ;no configure script
    (inputs
     (list ghostscript
           gnupg
           imagemagick
           python-3
           python-pillow
           python-qrcode))
    (synopsis "back up files to paper using QR codes")
    (description
     "Qr-backup encodes arbitrary files into a series of QR codes
printed on paper, with Reed-Solomon error correction for resilience
against physical damage.  The paper backup can be restored by scanning
the QR codes with any standard scanner or camera.  This provides
an offline, durable backup medium independent of electronic storage.")
    (home-page "https://github.com/za3k/qr-backup")
    (license license:public-domain)))

;;;
;;; --- 11. avvie ---
;;; Simple GTK4/libadwaita avatar image cropper.
;;; Python/Meson GNOME application.
;;; Upstream: https://github.com/Taiko2k/Avvie
;;;

(define-public avvie
  (package
    (name "avvie")
    (version "2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Taiko2k/Avvie/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1g695igzgx5x1rxnl18fj18ls2lwg7r09n0fgbkbs83iyxbkhgqa"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:glib-or-gtk? #t
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'glib-or-gtk-wrap 'python-wrap
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (wrap-program (string-append out "/bin/avvie")
                  `("GUIX_PYTHONPATH" prefix
                    (,(getenv "GUIX_PYTHONPATH")))
                  `("GI_TYPELIB_PATH" prefix
                    (,(getenv "GI_TYPELIB_PATH"))))))))))
    (native-inputs
     (list gettext-minimal
           `(,glib "bin")                 ;glib-compile-schemas
           `(,gtk "bin")                  ;gtk-update-icon-cache
           desktop-file-utils
           pkg-config))
    (inputs
     (list bash-minimal))
    (propagated-inputs
     (list python-3
           python-pycairo
           python-pygobject
           python-pillow
           gtk
           libadwaita))
    (synopsis "simple GTK4 avatar image cropper")
    (description
     "Avvie is a lightweight GTK4/libadwaita application for cropping
images to common avatar and profile picture dimensions.  It provides
quick square and circular crop modes with drag-to-position, EXIF
orientation handling, and export to PNG or JPEG formats.")
    (home-page "https://github.com/Taiko2k/Avvie")
    (license license:gpl3+)))

;;;
;;; --- 12. goxe ---
;;; Log aggregation and reduction tool.
;;; Pure Go with no external dependencies.
;;; Upstream: https://github.com/DumbNoxx/goxe
;;;

(define-public goxe
  (package
    (name "goxe")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/DumbNoxx/goxe/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0l6lnq4n9ygs8zpp8vnifs3kglqhc03dsq6cr0b63shy7i5s8y1s"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/DumbNoxx/goxe"
      #:install-source? #f))
    (synopsis "log aggregation and reduction tool")
    (description
     "Goxe is a lightweight log aggregation tool that ingests logs
via syslog over UDP, normalizes messages, filters noise, and
aggregates repeated entries.  It reduces log volume while preserving
important events for monitoring and debugging.")
    (home-page "https://github.com/DumbNoxx/goxe")
    (license license:asl2.0)))

;;;
;;; --- 13. pmtiles-bin ---
;;; CLI tool for creating and serving PMTiles map tile archives.
;;; Pre-built Go binary from GitHub releases.
;;; Upstream: https://github.com/protomaps/go-pmtiles
;;;

(define-public pmtiles-bin
  (package
    (name "pmtiles-bin")
    (version "1.30.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/protomaps/go-pmtiles/releases/download/v"
                    version "/go-pmtiles_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1biqdvhy4b4x4jsnr6nkppn07f5kp71nml6c76sj10v55wia58i3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pmtiles" "bin/pmtiles"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cloud-optimized map tiles CLI tool")
    (description
     "PMTiles is a single-file archive format for tiled data that
enables hosting map tiles on commodity cloud storage.  This CLI tool
creates, inspects, serves, and converts PMTiles archives.  It supports
HTTP range requests for efficient partial reads, enabling serverless
map tile hosting on S3, GCS, or Azure Blob Storage.")
    (home-page "https://github.com/protomaps/go-pmtiles")
    (license license:bsd-3)))

;;;
;;; --- 14. dred ---
;;; Minimal, portable text editor.
;;; Single-file C compilation with GTK+ 3.
;;; Upstream: https://github.com/mackron/dred
;;;

(define-public dred
  (package
    (name "dred")
    (version "0.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mackron/dred/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0zrfp7lwkn3v24p1zw9kfxiyakf59ki0mfhvj8a9wlqw1nvwj3va"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)             ;no configure script
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((cflags (string-split
                             (string-trim-right
                              (with-output-to-string
                                (lambda ()
                                  (invoke "pkg-config" "--cflags" "gtk+-3.0"))))
                             #\space))
                    (libs (string-split
                           (string-trim-right
                            (with-output-to-string
                              (lambda ()
                                (invoke "pkg-config" "--libs" "gtk+-3.0"))))
                           #\space)))
                (apply invoke "gcc" "-O2"
                       "source/dred/dred_main.c"
                       "-o" "dred"
                       "-Isource"
                       "-lm" "-ldl" "-lpthread"
                       (append cflags libs)))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "dred"
                            (string-append (assoc-ref outputs "out")
                                           "/bin")))))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+))
    (synopsis "minimal portable text editor")
    (description
     "Dred is a minimal, portable text editor with a GTK+ 3 interface.
It aims for simplicity and small code size while providing essential
editing features.  The entire editor compiles from a single C source
file.")
    (home-page "https://github.com/mackron/dred")
    (license license:expat)))
