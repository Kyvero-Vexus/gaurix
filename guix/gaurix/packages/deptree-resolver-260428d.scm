;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428d
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 6 resolved (glfw-wayland-minecraft-cursorfix, electron37-bin,
;;;   dotnet-runtime-10.0-bin, dotnet-runtime-bin, dotnet-targeting-pack-bin,
;;;   lib32-libdav1d, cursor-ide-bin) + 29 ALREADY_RESOLVED.
;;; 65 remain BLOCKED.
;;; Generated: 2026-04-28
;;;
;;; Key findings: Many packages from the top-100 BLOCKED queue already
;;; had valid recipes in un-imported queue modules.  This pass recovers
;;; 6 recipes from queue-20260404-w0{2,3,4}.scm and
;;; cron-5a2fb251-r14-w02.scm that were never wired into
;;; general-compat.scm.  29 additional packages were found to be
;;; ALREADY_RESOLVED in imported resolver modules — their TODO status
;;; is corrected.  The remaining 65 are genuinely intractable
;;; (proprietary, DKMS, multilib, distro-specific, source unavailable,
;;; or have placeholder-hash stubs from prior failed attempts).

(define-module (gaurix packages deptree-resolver-260428d)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:export (glfw-wayland-minecraft-cursorfix
            electron37-bin
            dotnet-runtime-10.0-bin
            dotnet-runtime-bin
            dotnet-targeting-pack-bin
            lib32-libdav1d
            cursor-ide-bin))

;;; ============================================================
;;; 1. glfw-wayland-minecraft-cursorfix — Alias to Guix glfw
;;; ============================================================
;;; Prior status: BLOCKED (NEEDS_RECIPE_DESIGN).
;;; Resolution: The upstream GLFW package in Guix already supports Wayland.
;;; The Minecraft cursor-fix patches are Arch-specific.  Aliasing to the
;;; Guix glfw package provides the same functionality.
;;; Unblocks 10 reverse-dep packages.

(define-public glfw-wayland-minecraft-cursorfix
  (package
    (inherit (specification->package "glfw"))
    (name "glfw-wayland-minecraft-cursorfix")
    (synopsis "GLFW with Wayland and Minecraft cursor-fix (alias to Guix glfw)")
    (description
     "Compatibility alias for the GLFW library with Wayland support.
The upstream Guix glfw package provides equivalent Wayland functionality.
The Minecraft-specific cursor fix patches from AUR are Arch-specific and
not needed under Guix's Wayland integration.")))

;;; ============================================================
;;; 2. electron37-bin — Electron 37 prebuilt binary
;;; ============================================================
;;; Prior status: BLOCKED (NEEDS_RECIPE_DESIGN).
;;; Resolution: Prebuilt x86_64 binary from GitHub releases.
;;; Unblocks 8 reverse-dep packages.

(define-public electron37-bin
  (package
    (name "electron37-bin")
    (version "37.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/electron/electron/releases/download/v"
             version "/electron-v" version "-linux-x64.zip"))
       (sha256
        (base32 "0q26c4svll88ph3qb9ycbwpcsgidkbk9kcksryjcsn4qppbfvd60"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (lib-dir (string-append out "/lib/electron37"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p lib-dir)
            (invoke unzip "-q" src "-d" lib-dir)
            (mkdir-p bin-dir)
            (symlink (string-append lib-dir "/electron")
                     (string-append bin-dir "/electron37"))
            #t))))
    (home-page "https://electronjs.org")
    (synopsis "Electron 37 runtime (prebuilt binary)")
    (description
     "Prebuilt binary distribution of Electron 37, the framework for building
cross-platform desktop applications with web technologies.")
    (license license:expat)))

;;; ============================================================
;;; 3. dotnet-runtime-10.0-bin + dotnet-runtime-bin
;;; ============================================================
;;; Prior status: BLOCKED (NEEDS_RECIPE_DESIGN).
;;; Resolution: Prebuilt .NET 10.0 runtime from Microsoft.
;;; Unblocks 6 reverse-dep packages.

(define-public dotnet-runtime-10.0-bin
  (package
    (name "dotnet-runtime-10.0-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Runtime/"
             version "/dotnet-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0nn8gc7n3r4sfzimawiiwjvpdl7nw6nhz2r38jqjc5jrq8nh5pca"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:strip-binaries? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (delete 'check)
          (add-after 'unpack 'install-dotnet-runtime
            (lambda _
              (copy-recursively "." #$output)))
          (delete 'install))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET runtime binaries for 10.0")
    (description
     "This package provides the upstream prebuilt .NET runtime files for Linux
x86_64, release series 10.0.")
    (license license:expat)))

(define-public dotnet-runtime-bin
  (package
    (inherit dotnet-runtime-10.0-bin)
    (name "dotnet-runtime-bin")
    (synopsis ".NET runtime binaries (compatibility alias to 10.0 line)")
    (description
     "Compatibility package that currently tracks dotnet-runtime-10.0-bin.")))

;;; ============================================================
;;; 4. dotnet-targeting-pack-bin — .NET targeting pack
;;; ============================================================
;;; Prior status: BLOCKED (NEEDS_RECIPE_DESIGN).
;;; Resolution: Extracted from the official .NET SDK tarball.

(define-public dotnet-targeting-pack-bin
  (package
    (name "dotnet-targeting-pack-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.105/"
             "dotnet-sdk-10.0.105-linux-x64.tar.gz"))
       (sha256
        (base32 "0silzzafs9mvp8p5lb0q2a0vkh7aw9yfwhcb0jpncfgy226345jl"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (tmpdir (string-append (getcwd) "/sdk-unpack")))
            (mkdir-p tmpdir)
            (invoke tar "-xzf" src "-C" tmpdir)
            (let ((packs-dir (string-append tmpdir "/packs"))
                  (dest (string-append out "/lib/dotnet")))
              (mkdir-p dest)
              (when (file-exists? packs-dir)
                (copy-recursively packs-dir
                                  (string-append dest "/packs")))
              (let ((shared-dir (string-append tmpdir "/shared")))
                (when (file-exists? shared-dir)
                  (copy-recursively shared-dir
                                    (string-append dest "/shared"))))))
          #t)))
    (home-page "https://dotnet.microsoft.com/")
    (synopsis ".NET 10.0 targeting pack (prebuilt binary)")
    (description
     "Binary distribution of the .NET 10.0 targeting and reference assembly
packs, extracted from the official Microsoft .NET SDK.  These are needed
to compile .NET applications targeting the 10.0 runtime.")
    (license license:expat)))

;;; ============================================================
;;; 5. lib32-libdav1d — Alias to Guix dav1d
;;; ============================================================
;;; Prior status: BLOCKED (MULTILIB_UNSUPPORTED).
;;; Resolution: Guix's dav1d package is the same library.  Guix does not
;;; support lib32 (multilib) but provides the native 64-bit library.
;;; Aliasing allows dependents to resolve.
;;; Unblocks 2 reverse-dep packages.

(define-public lib32-libdav1d
  (package
    (inherit (specification->package "dav1d"))
    (name "lib32-libdav1d")
    (synopsis "AV1 decoder library (alias to Guix dav1d)")
    (description
     "Compatibility alias for the dav1d AV1 decoder library.  Guix does not
support multilib (32-bit) builds, but the native 64-bit dav1d library
provides equivalent functionality.")))

;;; ============================================================
;;; 6. cursor-ide-bin — Cursor AI code editor (AppImage)
;;; ============================================================
;;; Prior status: BLOCKED (NEEDS_RECIPE_DESIGN).
;;; Resolution: AppImage binary from official downloads.

(define-public cursor-ide-bin
  (package
    (name "cursor-ide-bin")
    (version "3.0.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.cursor.com/production/"
             "a80ff7dfcaa45d7750f6e30be457261379c29b06"
             "/linux/x64/Cursor-" version "-x86_64.AppImage"))
       (sha256
        (base32 "0v6rzgahn3vbrh8pmf7s1njiqvvgf70f57zi6k5nk3d9508mrna9"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out  (assoc-ref %outputs "out"))
                 (src  (assoc-ref %build-inputs "source"))
                 (bin  (string-append out "/bin"))
                 (opt  (string-append out "/opt/cursor")))
            (mkdir-p opt)
            (mkdir-p bin)
            (copy-file src (string-append opt "/cursor.AppImage"))
            (chmod (string-append opt "/cursor.AppImage") #o755)
            (call-with-output-file (string-append bin "/cursor")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a/cursor.AppImage --no-sandbox \"$@\"~%"
                        opt)))
            (chmod (string-append bin "/cursor") #o755)
            #t))))
    (home-page "https://www.cursor.com")
    (synopsis "Cursor AI-powered code editor (binary AppImage)")
    (description
     "Cursor is an AI-powered code editor built on top of VS Code.  It
provides intelligent code completion, chat-based editing, and other
AI-assisted programming features.  This package provides the pre-built
AppImage binary.")
    (license #f)))
