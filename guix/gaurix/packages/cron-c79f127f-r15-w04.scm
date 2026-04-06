;;; Chunk-local module for blocked-tree run cron-c79f127f (worker w04, round 15).
(define-module (gaurix packages cron-c79f127f-r15-w04)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages wm))

;;; ---------------------------------------------------------------------------
;;; Helper
;;; ---------------------------------------------------------------------------
(define (gaurix-alias name spec)
  "Create an alias package named NAME from upstream Guix package SPEC."
  (package
    (inherit (specification->package spec))
    (name name)))

;;; ---------------------------------------------------------------------------
;;; 1. llvm-libs-minimal-git  →  upstream llvm
;;; ---------------------------------------------------------------------------
(define-public llvm-libs-minimal-git
  (gaurix-alias "llvm-libs-minimal-git" "llvm"))

;;; ---------------------------------------------------------------------------
;;; 2. hyprtoolkit-git  →  source build from git
;;; ---------------------------------------------------------------------------
(define %hyprtoolkit-commit "f3e4245c8493d78c909ebe821544d3c6bab951ae")

(define-public hyprtoolkit-git
  (package
    (name "hyprtoolkit-git")
    (version (git-version "0.0.0" "97" %hyprtoolkit-commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hyprwm/hyprtoolkit")
             (commit %hyprtoolkit-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0c5v3xavhnbh2hy2aci4rr5jhvs9ix6mqj7i98sdbsn513x44bav"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list (specification->package "pkg-config")
           (specification->package "hyprwayland-scanner")))
    (inputs
     (list (specification->package "cairo")
           (specification->package "hyprutils")
           (specification->package "hyprlang")
           (specification->package "iniparser")
           (specification->package "libdrm")
           (specification->package "libinput")
           (specification->package "libxkbcommon")
           (specification->package "mesa")
           (specification->package "pango")
           (specification->package "pixman")
           (specification->package "wayland")
           (specification->package "wayland-protocols")))
    (home-page "https://github.com/hyprwm/hyprtoolkit")
    (synopsis "Modern C++ Wayland-native GUI toolkit for Hyprland")
    (description
     "Hyprtoolkit is a modern C++ GUI toolkit designed for Wayland compositors
in the Hyprland ecosystem.")
    (license license:bsd-3)))

;;; ---------------------------------------------------------------------------
;;; 3. wayfire  →  3D Wayland compositor
;;; ---------------------------------------------------------------------------
(define-public wayfire
  (package
    (name "wayfire")
    (version "0.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WayfireWM/wayfire/releases/download/v"
             version "/wayfire-" version ".tar.xz"))
       (sha256
        (base32 "1y7izkrjy3i0ngmmyvpdffiazj88nkh6gqpizck0292qx55cjmwj"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Duse_system_wlroots=enabled"
              "-Duse_system_wfconfig=enabled"
              "-Dtests=disabled"
              "-Dxwayland=enabled")
      #:tests? #f))
    (native-inputs
     (list (specification->package "cmake")
           (specification->package "glm")
           (specification->package "ninja")
           (specification->package "nlohmann-json")
           (specification->package "pkg-config")
           (specification->package "vulkan-headers")
           (specification->package "wayland-protocols")))
    (inputs
     (list (specification->package "cairo")
           (specification->package "libinput")
           (specification->package "libjpeg-turbo")
           (specification->package "pango")
           (specification->package "wf-config")
           (specification->package "wlroots")
           (specification->package "yyjson")))
    (home-page "https://wayfire.org")
    (synopsis "3D Wayland compositor with plugin support")
    (description
     "Wayfire is a 3D Wayland compositor inspired by Compiz.  It provides
window management with 3D effects and a plugin architecture.")
    (license license:expat)))

;;; ---------------------------------------------------------------------------
;;; 4. libastal-meta  →  stub/placeholder package
;;; ---------------------------------------------------------------------------
(define-public libastal-meta
  (package
    (name "libastal-meta")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((out (assoc-ref %outputs "out")))
            (mkdir-p (string-append out "/lib"))
            (call-with-output-file (string-append out "/lib/.placeholder")
              (lambda (port)
                (display "libastal meta-package placeholder\n" port)))
            #t))))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "Meta-package for Astal widget libraries")
    (description
     "libastal-meta is a convenience meta-package that depends on the various
Astal widget toolkit libraries.  Astal provides building blocks for creating
custom desktop shells on Wayland.")
    (license license:lgpl2.1+)))

;;; ---------------------------------------------------------------------------
;;; 5. logmein-hamachi  →  proprietary binary repackage
;;; ---------------------------------------------------------------------------
(define-public logmein-hamachi
  (package
    (name "logmein-hamachi")
    (version "2.1.0.203")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://vpn.net/installers/logmein-hamachi-"
             version "-x64.tgz"))
       (sha256
        (base32 "0zy0jzvdqccfsg42m2lq1rj8r2c4iypd1h9vxl9824cbl92yim37"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (opt (string-append out "/opt/logmein-hamachi"))
                     (bin (string-append opt "/bin"))
                     (doc (string-append out "/share/doc/logmein-hamachi")))
                (mkdir-p bin)
                (mkdir-p doc)
                (for-each
                 (lambda (file)
                   (when (file-exists? file)
                     (install-file file bin)
                     (chmod (string-append bin "/" file) #o755)))
                 '("hamachid" "dnsup" "dnsdown"))
                (for-each
                 (lambda (file)
                   (when (file-exists? file)
                     (install-file file doc)))
                 '("README" "CHANGES" "LICENSE"))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append bin "/hamachid")
                         (string-append out "/bin/hamachi"))))))))
    (home-page "https://www.vpn.net/linux")
    (synopsis "Zero-configuration VPN service client")
    (description
     "LogMeIn Hamachi is a hosted VPN client that creates virtual private
networks between computers.")
    (license (license:non-copyleft
              "https://www.vpn.net/"
              "Proprietary LogMeIn Hamachi license"))))
