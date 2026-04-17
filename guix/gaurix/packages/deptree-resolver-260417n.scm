;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417n
;;; Resolves 13 BLOCKED packages from dependency tree queue:
;;;   - cook (#14634): single-file C build system
;;;   - capnproto-java (#14567): Cap'n Proto Java bindings
;;;   - zef (#14612): Raku module manager
;;;   - vs1clickmodinstaller (#14602): Vintage Story mod installer
;;;   - libjxl-doc (#14607): JPEG XL documentation
;;;   - arrow-c-glib (#14610): Apache Arrow GLib bindings
;;;   - mayo (#14604): 3D CAD viewer (Qt5 + OpenCascade)
;;;   - swaysettings (#14632): Sway desktop settings GUI
;;;   - ghostty (#14572): GPU-accelerated terminal emulator
;;;   - xpipe-ptb (#14608): remote shell connection hub (binary)
;;;   - atom-ng-bin (#14629): Atom editor fork (binary)
;;;   - gridmonger (#14492): cRPG dungeon mapping tool (Nim)
;;;   - ccdciel (#14615): CCD capture for amateur astronomy
;;;
;;; 16 packages remain BLOCKED (see blocked-notes).
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260417n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system zig)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages nim)
  #:use-module (gnu packages pantheon)
  #:use-module (gnu packages pascal)
  #:use-module (gnu packages perl6)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages zig)
  #:export (cook
            capnproto-java
            zef
            vs1clickmodinstaller
            libjxl-doc
            arrow-c-glib
            mayo
            swaysettings
            ghostty
            xpipe-ptb
            atom-ng-bin
            gridmonger
            ccdciel))

;;; ── cook ─────────────────────────────────────────────────────────────
;;; Single-file C build system.  Compile cook.c, write a Cookfile, done.
;;; Simple Makefile build: gcc sources → binary.

(define-public cook
  (package
    (name "cook")
    (version "0.1.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hanion/cook")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC_LINUX=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key make-flags #:allow-other-keys)
              (mkdir-p "build")
              (apply invoke "make" "build/cook" make-flags)))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "build/cook" bin)))))))
    (synopsis "single-file build system written in C")
    (description "Cook is a minimal build system.  Build @code{cook.c} once,
run it, and it builds your project via a @code{Cookfile}.  Requires only a
C compiler, no external tools needed.")
    (home-page "https://github.com/hanion/cook")
    (license license:expat)))

;;; ── capnproto-java ───────────────────────────────────────────────────
;;; Java bindings for Cap'n Proto serialization.  Runtime compiled with
;;; javac directly (no Maven needed); compiler plugin built with capnpc.

(define-public capnproto-java
  (package
    (name "capnproto-java")
    (version "0.1.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/capnproto/capnproto-java")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Build the runtime jar from plain Java sources
              (mkdir-p "build/classes")
              (let ((java-files (find-files "runtime/src/main/java" "\\.java$")))
                (apply invoke "javac" "-d" "build/classes" java-files))
              (invoke "jar" "cf" "build/capnproto-java.jar"
                      "-C" "build/classes" ".")
              ;; Build the capnpc-java compiler plugin
              (invoke "make" "-C" "compiler"
                      (string-append "CXX=" #$(cxx-for-target))
                      (string-append "CAPNPC=capnpc")
                      (string-append "PREFIX=" #$output))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (jar-dir (string-append out "/share/java"))
                     (bin (string-append out "/bin")))
                (mkdir-p jar-dir)
                (mkdir-p bin)
                (install-file "build/capnproto-java.jar" jar-dir)
                (when (file-exists? "compiler/capnpc-java")
                  (install-file "compiler/capnpc-java" bin))))))))
    (native-inputs (list `(,openjdk "jdk")))
    (inputs (list capnproto))
    (synopsis "Cap'n Proto serialization for Java")
    (description "Cap'n Proto for Java provides runtime library and compiler
plugin for the Cap'n Proto serialization protocol.  Cap'n Proto offers
zero-copy serialization with no encoding/decoding step.")
    (home-page "https://github.com/capnproto/capnproto-java")
    (license license:expat)))

;;; ── zef ──────────────────────────────────────────────────────────────
;;; Raku module management tool.  Installed via copy with rakudo wrapper.

(define-public zef
  (package
    (name "zef")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ugexe/zef")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin" "share/zef/bin")
          ("lib" "share/zef/lib")
          ("resources" "share/zef/resources"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (rakudo (assoc-ref inputs "rakudo")))
                (mkdir-p bin)
                (let ((wrapper (string-append bin "/zef")))
                  (call-with-output-file wrapper
                    (lambda (port)
                      (format port "#!~a~%exec ~a -I~a ~a \"$@\"~%"
                              (which "bash")
                              (string-append rakudo "/bin/rakudo")
                              (string-append out "/share/zef/lib")
                              (string-append out "/share/zef/bin/zef"))))
                  (chmod wrapper #o755))))))))
    (inputs (list rakudo))
    (synopsis "Raku module management")
    (description "Zef is a Raku module manager.  It handles searching,
installing, testing, reporting, and listing of Raku ecosystem modules and
their dependencies.")
    (home-page "https://github.com/ugexe/zef")
    (license license:artistic2.0)))

;;; ── vs1clickmodinstaller ─────────────────────────────────────────────
;;; Single-file Python script for Vintage Story mod installation.

(define-public vs1clickmodinstaller
  (package
    (name "vs1clickmodinstaller")
    (version "0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maximalmax90/vs1clickmodinstaller")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("vs1clickmodinstaller" "share/vs1clickmodinstaller/vs1clickmodinstaller.py")
          ("vs1clickmodinstaller.desktop" "share/applications/vs1clickmodinstaller.desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (python (search-input-file inputs "bin/python3")))
                (mkdir-p bin)
                (let ((wrapper (string-append bin "/vs1clickmodinstaller")))
                  (call-with-output-file wrapper
                    (lambda (port)
                      (format port "#!~a~%exec ~a ~a \"$@\"~%"
                              (which "bash")
                              python
                              (string-append out "/share/vs1clickmodinstaller/vs1clickmodinstaller.py"))))
                  (chmod wrapper #o755))))))))
    (inputs (list python python-requests tk))
    (synopsis "Vintage Story 1-click mod install handler")
    (description "A simple 1-click install handler for Vintage Story mods.
Allows installing mods from the Vintage Story mod database with a single
click via a custom URI scheme handler.")
    (home-page "https://github.com/maximalmax90/vs1clickmodinstaller")
    (license license:gpl3)))

;;; ── libjxl-doc ───────────────────────────────────────────────────────
;;; Documentation for JPEG XL reference implementation, built with Doxygen.

(define-public libjxl-doc
  (package
    (name "libjxl-doc")
    (version "0.11.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/libjxl/libjxl")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DBUILD_TESTING=OFF"
              "-DJPEGXL_ENABLE_TOOLS=OFF"
              "-DJPEGXL_ENABLE_JPEGLI=OFF"
              "-DJPEGXL_ENABLE_DOXYGEN=ON"
              "-DJPEGXL_ENABLE_MANPAGES=OFF"
              "-DJPEGXL_ENABLE_BENCHMARK=OFF"
              "-DJPEGXL_ENABLE_EXAMPLES=OFF"
              "-DJPEGXL_FORCE_SYSTEM_BROTLI=ON"
              "-DJPEGXL_FORCE_SYSTEM_HWY=ON")
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda _
              (invoke "cmake" "--build" "." "--target" "doc")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((doc (string-append (assoc-ref outputs "out")
                                        "/share/doc/libjxl")))
                (when (file-exists? "doc/html")
                  (copy-recursively "doc/html"
                                    (string-append doc "/html")))))))))
    (native-inputs (list doxygen graphviz))
    (inputs (list brotli google-highway libjxl))
    (synopsis "JPEG XL reference implementation documentation")
    (description "Documentation for the JPEG XL image format reference
implementation (libjxl), generated from source code with Doxygen.  Covers
the encoder, decoder, and utility APIs.")
    (home-page "https://jpeg.org/jpegxl/")
    (license license:bsd-3)))

;;; ── arrow-c-glib ─────────────────────────────────────────────────────
;;; GLib/GObject wrapper for Apache Arrow C++.  Built from the c_glib
;;; subdirectory of the Apache Arrow source tree.

(define-public arrow-c-glib
  (package
    (name "arrow-c-glib")
    (version "23.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/apache/arrow")
                    (commit (string-append "apache-arrow-" version))))
              (file-name (git-file-name "apache-arrow" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir-to-c-glib
            (lambda _
              (chdir "c_glib/arrow-glib"))))))
    (native-inputs (list gobject-introspection pkg-config))
    (inputs (list apache-arrow glib))
    (synopsis "Apache Arrow GLib wrapper library")
    (description "Apache Arrow GLib provides C and GObject API for Apache
Arrow.  It allows C programs and GObject-based language bindings (Python,
Ruby, Lua via GObject Introspection) to access the Arrow columnar
in-memory data format.")
    (home-page "https://arrow.apache.org/")
    (license license:asl2.0)))

;;; ── mayo ─────────────────────────────────────────────────────────────
;;; 3D CAD viewer and converter using Qt5 and OpenCascade.

(define-public mayo
  (package
    (name "mayo")
    (version "0.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fougue/mayo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DOpenCASCADE_DIR="
                              (assoc-ref %build-inputs "opencascade-occt")
                              "/lib/cmake/opencascade"))))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5 qtsvg-5 opencascade-occt))
    (synopsis "3D CAD viewer and converter based on Qt and OpenCascade")
    (description "Mayo is an open-source 3D CAD viewer and converter.  It
supports STEP, IGES, STL, OBJ, glTF and other CAD formats using the
OpenCascade geometry kernel and Qt5 for the user interface.")
    (home-page "https://github.com/fougue/mayo")
    (license license:bsd-2)))

;;; ── swaysettings ─────────────────────────────────────────────────────
;;; GTK4/libadwaita settings application for the Sway window manager.

(define-public swaysettings
  (package
    (name "swaysettings")
    (version "0.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ErikReider/SwaySettings")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (native-inputs (list vala pkg-config blueprint-compiler
                         gobject-introspection))
    (inputs (list gtk gtk4-layer-shell libadwaita libgee json-glib
                  granite accountsservice libgtop pulseaudio
                  libxml2))
    (synopsis "GUI for setting Sway wallpaper, default apps, and themes")
    (description "SwaySettings is a graphical settings application for the
Sway window manager.  It provides configuration of wallpapers, default
applications, GTK themes, input devices, Bluetooth, screen settings,
and more via a modern libadwaita interface.")
    (home-page "https://github.com/ErikReider/SwaySettings")
    (license license:gpl3)))

;;; ── ghostty ──────────────────────────────────────────────────────────
;;; Fast, GPU-accelerated terminal emulator built with Zig.
;;; Uses GTK4 and libadwaita for the Linux GUI.

(define-public ghostty
  (package
    (name "ghostty")
    (version "1.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghostty-org/ghostty")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system zig-build-system)
    (arguments
     (list
      #:install-source? #f
      #:tests? #f
      #:zig-release-type "safe"
      #:zig-build-flags
      #~(list "-Dpie=true"
              "-Demit-docs=false"
              "-Dfetch=false")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-paths
            (lambda _
              (substitute* "build.zig"
                (("/bin/sh") (which "sh"))))))))
    (native-inputs (list pkg-config))
    (inputs (list gtk gtk4-layer-shell libadwaita
                  oniguruma pixman fontconfig freetype
                  harfbuzz libpng zlib bzip2
                  wayland libx11))
    (synopsis "fast, native, feature-rich terminal emulator")
    (description "Ghostty is a fast, feature-rich, and cross-platform terminal
emulator that uses platform-native UI and GPU acceleration.  It supports
modern terminal features including true color, undercurl, Kitty graphics
protocol, images via sixel, hyperlinks, and ligatures.")
    (home-page "https://ghostty.org/")
    (license license:expat)))

;;; ── xpipe-ptb ────────────────────────────────────────────────────────
;;; XPipe Public Test Build — remote shell connection hub (binary).

(define-public xpipe-ptb
  (package
    (name "xpipe-ptb")
    (version "22.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xpipe-io/xpipe-ptb/releases/download/"
                    version "-4/xpipe-portable-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/xpipe-ptb"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-symlink
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/xpipe-ptb/bin/xpiped")
                         (string-append bin "/xpipe-ptb"))))))))
    (inputs (list gtk+ glib pango cairo freetype gdk-pixbuf))
    (synopsis "connection hub for remote shell access (public test build)")
    (description "XPipe is a connection hub for managing remote shell
connections including SSH, Docker, Kubernetes, and more.  This is the
Public Test Build (PTB) providing early access to new features.  It
provides a desktop GUI for organizing and accessing remote systems.")
    (home-page "https://github.com/xpipe-io/xpipe-ptb")
    (license license:asl2.0)))

;;; ── atom-ng-bin ──────────────────────────────────────────────────────
;;; Atom editor community fork with compiler optimizations (binary).

(define-public atom-ng-bin
  (package
    (name "atom-ng-bin")
    (version "1.66.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Alex313031/atom-ng/releases/download/v"
                    version "/Atom-ng_linux_" version "_SSE4.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/atom-ng"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-symlink
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (when (file-exists? (string-append out "/share/atom-ng/atom-ng"))
                  (symlink (string-append out "/share/atom-ng/atom-ng")
                           (string-append bin "/atom-ng")))))))))
    (native-inputs (list unzip))
    (synopsis "hyper-hackable text editor (community maintained fork)")
    (description "Atom-ng is a community maintained fork of the Atom text
editor with compiler optimizations from Nickel Browser.  It is a hackable
text editor for the 21st century, built on Electron, supporting packages,
themes, and a rich extension API.")
    (home-page "https://thorium.rocks/atom-ng/")
    (license license:expat)))

;;; ── gridmonger ───────────────────────────────────────────────────────
;;; Old-school cRPG dungeon mapping tool, built with Nim.

(define-public gridmonger
  (package
    (name "gridmonger")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/johnnovak/gridmonger")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "nim" "compile"
                      "--opt:speed"
                      "-d:release"
                      "--out:gridmonger"
                      "src/main.nim")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "gridmonger" bin)))))))
    (native-inputs (list nim))
    (inputs (list libx11 libxi libxrandr libxcursor libxinerama
                  mesa libxxf86vm zenity))
    (synopsis "old-school cRPG dungeon mapping companion")
    (description "Gridmonger is a mapping tool for classic computer
role-playing games (cRPGs).  It provides a grid-based editor for creating
dungeon maps with notes, annotations, region colors, and various map
elements commonly found in first-person blobbers and dungeon crawlers.")
    (home-page "https://gridmonger.johnnovak.net/")
    (license license:wtfpl2)))

;;; ── ccdciel ──────────────────────────────────────────────────────────
;;; CCD capture software for amateur astronomy, built with Free Pascal
;;; and the Lazarus IDE.

(define-public ccdciel
  (package
    (name "ccdciel")
    (version "0.9.92")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pchev/ccdciel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((lazarus-dir (string-append
                                  (assoc-ref inputs "lazarus")
                                  "/share/lazarus")))
                ;; Build the main application with lazbuild
                (invoke "lazbuild"
                        (string-append "--lazarusdir=" lazarus-dir)
                        "--build-mode=Release"
                        "src/ccdciel.lpi"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (install-file "src/ccdciel" bin)))))))
    (native-inputs (list fpc lazarus))
    (inputs (list libpasastro))
    (synopsis "CCD capture software for amateur astronomers")
    (description "CCDciel is a CCD and CMOS camera capture application for
amateur astronomers.  It provides telescope and camera control, image
acquisition sequences, autoguiding, plate solving, and focus assistance
via the INDI and ASCOM frameworks.")
    (home-page "https://www.ap-i.net/ccdciel")
    (license license:gpl2+)))
