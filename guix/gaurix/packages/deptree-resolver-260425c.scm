;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425c
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (6): ddpolymerase-bin, wl-binclock-bin, hypraway-bin,
;;;   openexr-viewer, firetools, ruby-ruby-vips
;;; Already resolved (1): python-materialyoucolor (cron-c79f127f-r22-w00)
;;; Already in Guix (1): libcurl-gnutls-git (Guix curl uses GnuTLS)
;;; Remaining BLOCKED: 92 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system ruby)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages image-processing)
  #:export (ddpolymerase-bin
            wl-binclock-bin
            hypraway-bin
            openexr-viewer
            firetools
            ruby-ruby-vips))


;;; ---- 1. ddpolymerase-bin ----
;;; AUR #18639 -- Copy, repair and verify a file.
;;; Prebuilt x86_64 Linux binary from Codeberg releases.
;;; License: GPL-3.0+

(define-public ddpolymerase-bin
  (package
    (name "ddpolymerase-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/tokideveloper/ddpolymerase"
                    "/releases/download/v" version
                    "/ddpolymerase-v" version "-x86_64-linux.tar.xz"))
              (sha256
               (base32
                "0jycdz12djjp5bl893hn55gcxm0wx3mycaypxg0k7vw1x0w25jwp"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("bin/ddpolymerase" "bin/ddpolymerase")
                          ("man/ddpolymerase.1.gz" "share/man/man1/ddpolymerase.1.gz")
                          ("bash-completion/completions/ddpolymerase"
                           "share/bash-completion/completions/ddpolymerase"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                        "/bin/ddpolymerase"))
                    (ld  (search-input-file inputs
                                            "lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld bin)
                (invoke "patchelf" "--set-rpath"
                        (string-append (assoc-ref inputs "gcc")
                                       "/lib:"
                                       (assoc-ref inputs "glibc") "/lib")
                        bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "copy, repair and verify a file")
    (description
     "Ddpolymerase copies, repairs, and verifies files.  It works like dd
but adds verification and repair capabilities, making it useful for
recovering data from failing storage devices.  Two spaces after sentences.")
    (home-page "https://codeberg.org/tokideveloper/ddpolymerase")
    (license license:gpl3+)))


;;; ---- 2. wl-binclock-bin ----
;;; AUR #18639 -- Binary clock for Wayland.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public wl-binclock-bin
  (package
    (name "wl-binclock-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dongdigua/wl-binclock"
                    "/releases/download/" version "/wl-binclock"))
              (sha256
               (base32
                "02g1axjf0mijaa8azm7li25ma91m8fy835s0vi5yys434lk2p92g"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("wl-binclock" "bin/wl-binclock"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "wl-binclock")
              (chmod "wl-binclock" #o755)))
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                        "/bin/wl-binclock"))
                    (ld  (search-input-file inputs
                                            "lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld bin)
                (invoke "patchelf" "--set-rpath"
                        (string-append (assoc-ref inputs "gcc")
                                       "/lib:"
                                       (assoc-ref inputs "glibc") "/lib")
                        bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary clock for Wayland")
    (description
     "Wl-binclock displays a binary clock on Wayland compositors.  It shows
the current time in binary representation as a Wayland surface widget.
Two spaces after sentences.")
    (home-page "https://github.com/dongdigua/wl-binclock")
    (license license:expat)))


;;; ---- 3. hypraway-bin ----
;;; AUR #18639 -- Lock screen automatically when you leave.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public hypraway-bin
  (package
    (name "hypraway-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/canmi21/hypraway"
                    "/releases/download/v" version "/hypraway"))
              (sha256
               (base32
                "0rx0w52ly3szxv7klm1iz11l5wkn90kn43ik7yppv9yn90kciv3b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("hypraway" "bin/hypraway"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "hypraway")
              (chmod "hypraway" #o755)))
          (delete 'install-license-files)
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out")
                                        "/bin/hypraway"))
                    (ld  (search-input-file inputs
                                            "lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld bin)
                (invoke "patchelf" "--set-rpath"
                        (string-append (assoc-ref inputs "gcc")
                                       "/lib:"
                                       (assoc-ref inputs "glibc") "/lib")
                        bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "lock screen automatically when you leave")
    (description
     "Hypraway monitors user presence and automatically locks the screen
when the user walks away.  It integrates with Hyprland and swayidle for
idle detection and screen locking.  Two spaces after sentences.")
    (home-page "https://github.com/canmi21/hypraway")
    (license license:expat)))



;;; ---- 4. openexr-viewer ----
;;; AUR #18099 -- Simple viewer for OpenEXR files.
;;; CMake source build.
;;; License: BSD

(define-public openexr-viewer
  (package
    (name "openexr-viewer")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/afichet/openexr-viewer"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "14rv9316cz9mfqis9g548hyb7vcbc0gxkkq4g75ng6yqbaz8y124"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f  ;no test suite
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (inputs (list openexr
                  qtbase-5
                  qtsvg-5))
    (native-inputs (list pkg-config))
    (synopsis "simple viewer for OpenEXR files with metadata display")
    (description
     "OpenEXR Viewer is a viewer for OpenEXR image files.  It displays
HDR images with tone-mapping and shows detailed metadata including
channels, layers, and attributes.  Two spaces after sentences.")
    (home-page "https://github.com/afichet/openexr-viewer")
    (license license:bsd-3)))


;;; ---- 6. firetools ----
;;; AUR #18639 -- Graphical user interface of Firejail.
;;; Autotools source build.
;;; License: GPL-2.0+

(define-public firetools
  (package
    (name "firetools")
    (version "0.9.72")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/netblue30/firetools"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0bbvqk6vv11fr9f55yy306bkpxffdxg86vl7sd4wvxh0sqkajiwq"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;no test suite
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'fix-paths
            (lambda _
              ;; The configure script is not generated by autotools
              ;; but is a hand-written script.
              (substitute* "configure"
                (("/usr") #$output)))))))
    (inputs (list firejail qtbase-5))
    (synopsis "graphical user interface for Firejail")
    (description
     "Firetools is a graphical user interface for Firejail security
sandbox.  It provides a launcher for sandboxed applications and a
system tray icon for monitoring running sandboxes.  Two spaces
after sentences.")
    (home-page "https://firejail.wordpress.com/")
    (license license:gpl2+)))


;;; ---- 7. ruby-ruby-vips ----
;;; AUR #18639 -- Ruby extension for the vips image processing library.
;;; Ruby gem (FFI binding, no compiled extensions).
;;; License: MIT

(define-public ruby-ruby-vips
  (package
    (name "ruby-ruby-vips")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "ruby-vips" version))
              (sha256
               (base32
                "14nwdsd73c4ygjb7sfldnndlbzn5yyl02llnlzafmmjwh0d2pla1"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))  ;tests require test images
    (propagated-inputs (list ruby-ffi vips))
    (synopsis "Ruby extension for the vips image processing library")
    (description
     "Ruby-vips is a binding for the libvips image processing library.
It uses FFI to call into the native library, providing a fast and
memory-efficient API for image manipulation.  Two spaces after sentences.")
    (home-page "https://github.com/libvips/ruby-vips")
    (license license:expat)))
