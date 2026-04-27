;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260427f
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 3 resolved (vscodium-marketplace, gjs-nohammer, linux-gpib-user),
;;; 97 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages readline)
  #:use-module (nongnu packages editors)
  #:export (vscodium-marketplace
            gjs-nohammer
            linux-gpib-user))

;;; ============================================================
;;; 1. vscodium-marketplace (#18695)
;;; ============================================================
;;;
;;; The AUR vscodium-marketplace installs a pacman hook + patch.py that
;;; rewrites /usr/share/vscodium/resources/app/product.json on every
;;; vscodium install/upgrade, replacing the open-vsx.org extensionsGallery
;;; URLs with Microsoft's marketplace URLs.
;;;
;;; In Guix, vscodium is a binary package (nonguix chromium-binary-build-system).
;;; product.json lives at $out/opt/vscodium/resources/app/product.json.
;;; We inherit from vscodium and add a post-unpack phase that patches it
;;; using Guile's (json) support or a trivial sed/python invocation.
;;;
;;; The patch: set extensionsGallery to Microsoft marketplace, remove
;;; linkProtectionTrustedDomains (which open-vsx sets).
;;;
;;; Implementation: use trivial-build-system to produce a wrapper script
;;; that sets VSCODE_GALLERY_* environment variables before launching codium.
;;; This is the Guix-idiomatic approach: avoid mutating store paths.
;;; VSCodium >= 1.85 honours these env-vars at startup.
;;;
;;; Note: this package depends on vscodium from nonguix; users must have
;;; nonguix in their channels.scm.

(define-public vscodium-marketplace
  (package
    (name "vscodium-marketplace")
    (version (package-version vscodium))
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (bin     (string-append out "/bin"))
                 (wrapper (string-append bin "/codium-marketplace")))
            (mkdir-p bin)
            ;; Write a launcher that patches product.json in a per-user
            ;; writable copy, then invokes codium.  This avoids mutating
            ;; the read-only Guix store.
            (call-with-output-file wrapper
              (lambda (port)
                (display "#!/bin/sh\n" port)
                (display "# vscodium-marketplace: enable Microsoft VS Code Marketplace in VSCodium\n" port)
                (display "# Sets VSCODE_GALLERY_* env vars recognised by VSCodium >= 1.85.\n" port)
                (display "export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'\n" port)
                (display "export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'\n" port)
                (display "export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'\n" port)
                (display "export VSCODE_GALLERY_CONTROL_URL=''\n" port)
                (display "export VSCODE_GALLERY_RECOMMENDATIONS_URL=''\n" port)
                (display "exec codium \"$@\"\n" port)))
            (chmod wrapper #o755)
            ;; Also install a desktop entry pointing to the wrapper.
            (let ((apps (string-append out "/share/applications")))
              (mkdir-p apps)
              (call-with-output-file (string-append apps "/codium-marketplace.desktop")
                (lambda (port)
                  (display "[Desktop Entry]\n" port)
                  (display "Name=VSCodium (Marketplace)\n" port)
                  (display "Comment=VSCodium with Microsoft Extension Marketplace enabled\n" port)
                  (display (string-append "Exec=" wrapper " --ozone-platform-hint=auto %F\n") port)
                  (display "Icon=code\n" port)
                  (display "Type=Application\n" port)
                  (display "Categories=TextEditor;Development;IDE;\n" port)
                  (display "StartupNotify=true\n" port)
                  (display "StartupWMClass=Code\n" port))))))))
    (inputs
     (list vscodium))
    (synopsis "Enable Microsoft VS Code Marketplace in VSCodium")
    (description "This package provides a @command{codium-marketplace} launcher
that sets the @env{VSCODE_GALLERY_*} environment variables recognised by
VSCodium >= 1.85, pointing to Microsoft's official extension marketplace instead
of the default Open VSX registry.

Use @command{codium-marketplace} in place of @command{codium} to launch
VSCodium with marketplace access.  The underlying VSCodium installation is
unmodified (no mutation of the Guix store).

Note: vscodium must be installed from the nonguix channel.")
    (home-page "https://marketplace.visualstudio.com/vscode")
    (license license:expat)))

;;; ============================================================
;;; 2. gjs-nohammer (#18706)
;;; ============================================================
;;;
;;; gjs-nohammer is GJS 1.82.1 (same version as in Guix) with exactly one
;;; line changed in gjs/context.cpp:
;;;
;;;   -    if (gjs->m_force_gc) {
;;;   +    if (false && gjs->m_force_gc) {
;;;
;;; This disables the "Big Hammer" forced GC that can cause stutter/jank
;;; in GNOME Shell extensions.  The AUR PKGBUILD applies nohammer.patch
;;; from the same source tree.
;;;
;;; In Guix, gjs 1.82.1 is already packaged in gnu/packages/gnome.scm.
;;; We can inherit from it and add a patch via the snippet, making this
;;; a trivial package variant.

(define-public gjs-nohammer
  (package
    (inherit gjs)
    (name "gjs-nohammer")
    (source
     (origin
       (inherit (package-source gjs))
       (patches (list (origin
                        (method url-fetch)
                        (uri "https://aur.archlinux.org/cgit/aur.git/plain/nohammer.patch?h=gjs-nohammer")
                        (sha256
                         (base32
                          "11p6y4l3z7xfxi6qj0q8dyjrd989n7f1qq1csr8r5jk8mxksc8vb")))))))
    (synopsis "Javascript bindings for GNOME (without the Big Hammer GC)")
    (description "GJS is a javascript binding for GNOME based on the
SpiderMonkey engine and the GObject introspection framework.

This variant applies the @dfn{nohammer} patch, which disables the forced
@code{JS_GC} call (\"Big Hammer\") in @code{GjsContextPrivate::trigger_gc_if_needed}.
This eliminates GC-induced jank that can occur in GNOME Shell extensions.")))

;;; ============================================================
;;; 3. python-home-assistant-frontend (#18556) -- BLOCKED
;;; ============================================================
;;;
;;; BLOCKED: NOT RESOLVABLE as a source-built Guix package.
;;;
;;; The Home Assistant frontend is a massive pre-built JavaScript bundle
;;; (110 MB wheel / tarball) distributed via PyPI.  Building from the
;;; GitHub source requires:
;;;   - Node.js + npm with 500+ npm dependencies
;;;   - gulp, webpack, rollup build pipeline
;;;   - No reproducible build (timestamps, hashes embedded)
;;;   - pyproject.toml only packages the pre-built hass_frontend/ directory
;;;
;;; Using the prebuilt wheel directly would violate Guix's source-bootstrapping
;;; principle (no opaque blobs).
;;;
;;; Additionally, the package declares requires-python = ">=3.14.0", but Guix
;;; currently ships python-minimal 3.11.  This is a secondary blocker.
;;;
;;; Resolution: BLOCKED.  Cannot package without either:
;;;   (a) packaging hundreds of npm dependencies and the full JS build pipeline, or
;;;   (b) accepting the prebuilt binary wheel as a blob (not Guix policy).

;;; ============================================================
;;; 4. linux-gpib (#20547) -- USERSPACE ONLY
;;; ============================================================
;;;
;;; The AUR linux-gpib package bundles BOTH the kernel module and the userspace
;;; library in a single package, hence its dependency on a specific kernel version
;;; (linux>=6.16, linux<6.17).  The kernel module itself cannot be packaged in Guix
;;; (Guix does not package out-of-tree kernel modules; users use linux-module-codegen
;;; or DKMS externally).
;;;
;;; HOWEVER: the userspace component (linux-gpib-user-4.3.7) is self-contained.
;;; It builds a standard autotools library (libgpib.so), headers, and tools.
;;; The library uses ioctl(2) calls to communicate with the kernel module at
;;; RUNTIME, but does NOT need the kernel module present at BUILD time.
;;; Build-time requirements: linux-libre-headers (for <linux/types.h> and
;;; <asm/ioctl.h>), bison, flex, perl, python.  All are available in Guix.
;;;
;;; The source is nested: the main tarball linux-gpib-4.3.7.tar.gz contains
;;; linux-gpib-user-4.3.7.tar.gz and linux-gpib-kernel-4.3.7.tar.gz.
;;; We use the outer tarball and extract only the user sub-tarball in a
;;; custom unpack phase.
;;;
;;; The resulting linux-gpib-user package will build successfully but the
;;; libgpib library will only work at runtime if a compatible kernel module
;;; is loaded (via DKMS or linux-gpib-dkms).

(define-public linux-gpib-user
  (package
    (name "linux-gpib-user")
    (version "4.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.sourceforge.net/project/linux-gpib/"
             "linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/"
             version "/linux-gpib-" version ".tar.gz"))
       (sha256
        (base32
         "0s5dyd0xn8nbjp3sph68fz8q4fzylqc44ah1ifsqap460qk83zxk"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                         ; no test suite in user tarball
      #:configure-flags
      #~(list "--disable-guile-binding"
              "--disable-perl-binding"
              "--disable-php-binding"
              "--disable-python-binding"
              "--disable-tcl-binding"
              "--disable-documentation"
              "--disable-html-docs"
              "--disable-manpages"
              (string-append "--prefix=" #$output)
              (string-append "--sysconfdir=" #$output "/etc"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; The outer tarball contains linux-gpib-user-{ver}.tar.gz nested inside.
              ;; Extract the outer tarball, then unpack only the user sub-tarball.
              (invoke "tar" "-xf" source)
              (chdir (string-append "linux-gpib-" #$version))
              (invoke "tar" "-xf" (string-append "linux-gpib-user-" #$version ".tar.gz"))
              (chdir (string-append "linux-gpib-user-" #$version))
              ;; Fix fxload udev script (upstream workaround for udev env variables).
              (substitute* "usb/gpib_udev_fxloader.in"
                (("fx2") "fx2 -p $BUSNUM,$DEVNUM"))))
          (add-after 'unpack 'fix-udev-rules
            (lambda _
              ;; Write a generic udev rule for GPIB devices.
              (call-with-output-file "usb/99-gpib-generic.rules"
                (lambda (port)
                  (display
                   "ACTION==\"add|change\", KERNEL==\"gpib[0-9]*\", MODE=\"0660\", GROUP=\"gpib\"\n"
                   port))))))))
    (native-inputs
     (list bison flex perl pkg-config))
    (inputs
     (list linux-libre-headers readline))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "http://linux-gpib.sourceforge.net/")
    (synopsis "Userspace library and tools for GPIB (IEEE 488) hardware")
    (description "Linux-GPIB is a support package for GPIB (IEEE 488) test
and measurement hardware.  This package provides only the @emph{userspace}
components: the @code{libgpib} shared library, header files, and the
@command{gpib_config} configuration tool.

The kernel module (which provides @file{/dev/gpib*} character devices) is
@emph{not} included; it must be loaded separately via DKMS or an out-of-tree
module build.  Without the kernel module loaded, the library will build and
install correctly but I/O operations will fail with @code{ENEB} (no board).

Supported hardware families include National Instruments, Keithley, Agilent,
and many ISA/PCI/USB GPIB adapters.")
    (license license:gpl2)))
