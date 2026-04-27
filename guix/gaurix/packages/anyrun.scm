;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; anyrun --- Wayland-native application launcher (krunner-like)
;;; AUR: anyrun-git  ->  Guix: anyrun
;;; Upstream: https://github.com/Kirottu/anyrun
;;; Build: Cargo (Rust workspace with 16 members)
;;; License: GPL-3.0
;;;
;;; Dependencies:
;;;   Runtime: gtk4-layer-shell, gtk4, pango, cairo, gdk-pixbuf, glib
;;;   Build: pkg-config, rust, cargo
;;;
;;; Crate dependency situation:
;;;   Total crate deps in Cargo.lock: 371
;;;   Already in Guix's rust-crates.scm (exact version): 286
;;;   New crate-source definitions needed: 85
;;;   All crate sources are defined in (gaurix packages anyrun-crates).
;;;
;;; The Cargo.lock pins specific versions. All 371 crate-source definitions
;;; (including 286 that duplicate Guix's existing ones) are provided in the
;;; companion anyrun-crates module to ensure version consistency.
;;;
;;; Note: anyrun uses a custom fork of relm4 from anyrun-org/Relm4 and
;;; external git deps anyrun-interface and anyrun-provider-ipc.  These are
;;; included as git-fetch origins in the crates module.

(define-module (gaurix packages anyrun)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:export (anyrun))

(define-public anyrun
  (package
    (name "anyrun")
    (version "25.12.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Kirottu/anyrun")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0111jp0png803cl3amlfc5l8fj95qmhljgzsn004x8vg8hn0jh98"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:install-source? #f
      #:tests? #f                       ;no test suite
      #:cargo-build-flags
      #~'("--release")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-extras
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (etc (string-append out "/etc/anyrun"))
                     (plugins (string-append etc "/plugins")))
                ;; Install the main binary
                (install-file "target/release/anyrun" bin)
                ;; Install default configuration files
                (mkdir-p plugins)
                (when (file-exists? "examples/config.ron")
                  (install-file "examples/config.ron" etc))
                (when (file-exists? "anyrun/res/style.css")
                  (install-file "anyrun/res/style.css" etc))
                ;; Install plugin shared libraries
                (for-each
                 (lambda (so)
                   (install-file so plugins))
                 (find-files "target/release" "\\.so$"))))))))
    (native-inputs (list pkg-config))
    (inputs
     (append
      (list gtk4-layer-shell
            gtk                             ;GTK4 (called 'gtk' in Guix)
            pango
            cairo
            gdk-pixbuf
            glib)
      (cargo-inputs 'anyrun
                    #:module '(gaurix packages anyrun-crates))))
    (home-page "https://github.com/Kirottu/anyrun")
    (synopsis "wayland-native application launcher written in Rust")
    (description
     "Anyrun is a Wayland-native, highly customizable application launcher
similar to KRunner.  It is written in Rust using GTK4 and supports plugins
for applications, shell commands, symbols, translations, web searches,
dictionary lookups, and calculator expressions.  Plugins are loaded as
shared libraries, and the interface is styled with CSS.")
    (license license:gpl3)))
