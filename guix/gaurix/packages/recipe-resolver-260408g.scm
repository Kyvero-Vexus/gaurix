;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 2 new binary recipes (android-studio, netbeans-bin)
;;;   - 6 compat aliases for -git/-bin variants
;;;   - 18 already resolved (recipes exist in cron-*/recipe-resolver-* modules)
;;;   - 4 properly blocked with exhausted approaches
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages video)
  #:use-module (gaurix packages localsend-bin)
  #:use-module (gaurix packages recipe-resolver-260408f)
  #:export (
            android-studio-bin
            netbeans-bin
            localsend-git
            logseq-desktop-git
            xlibre-input-wacom-bin
            xlibre-video-fbdev-bin
            appimagelauncher-git
            ffmpeg-amd-full-git))

;;;
;;; ── android-studio-bin ──────────────────────────────────────────
;;; Official Android IDE (pre-built binary distribution)
;;;
(define-public android-studio-bin
  (package
    (name "android-studio-bin")
    (version "2024.3.2.16")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dl.google.com/dl/android/studio/ide-zips/"
             version "/android-studio-" version "-linux.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/android-studio/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source "--strip-components=1")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/android-studio/bin/studio")
                         (string-append bin "/android-studio")))))
          (delete 'install-license-files))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.android.com/studio")
    (synopsis "official Android IDE based on IntelliJ IDEA")
    (description
     "Android Studio is the official integrated development environment for
Android app development, based on IntelliJ IDEA.  It includes a code
editor, debugger, performance tools, emulator, and Gradle-based build
system.  This package provides the pre-built binary distribution.")
    ;; Proprietary; Android Studio License Agreement.
    (license #f)))

;;;
;;; ── netbeans-bin ──────────────────────────────────────────
;;; Apache NetBeans IDE (pre-built binary distribution)
;;;
(define-public netbeans-bin
  (package
    (name "netbeans-bin")
    (version "24")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dlcdn.apache.org/netbeans/netbeans/"
             version "/netbeans-" version "-bin.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/netbeans/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" "-q" source)
              (chdir "netbeans")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (nb (string-append out "/share/netbeans/bin/netbeans"))
                     (jdk (search-input-file inputs "bin/java")))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/netbeans")
                  (lambda ()
                    (display (string-append "#!/bin/sh\n"
                                            "export JAVA_HOME="
                                            (dirname (dirname jdk)) "\n"
                                            "exec " nb " \"$@\"\n"))))
                (chmod (string-append bin "/netbeans") #o755))))
          (delete 'install-license-files))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (inputs (list (@ (gnu packages java) openjdk21)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://netbeans.apache.org")
    (synopsis "extensible Java IDE with multi-language support")
    (description
     "Apache NetBeans is a free and open-source IDE for Java, JavaScript,
PHP, HTML5, CSS, and other languages.  It provides a modular
architecture with extensive plugin support for enterprise development.
This package provides the pre-built binary distribution with a JDK
wrapper.")
    (license license:asl2.0)))

;;;
;;; ── compat aliases for -git/-bin variants ──────────────────────
;;;

;; localsend-git -> localsend-bin (real recipe in localsend-bin.scm)
(define-public localsend-git
  (package
    (inherit localsend-bin)
    (name "localsend-git")))

;; logseq-desktop-git -> logseq-desktop-bin (real recipe in recipe-resolver-260408f.scm)
(define-public logseq-desktop-git
  (package
    (inherit logseq-desktop-bin)
    (name "logseq-desktop-git")))

;; xlibre-input-wacom-bin -> xf86-input-wacom (Guix package)
(define-public xlibre-input-wacom-bin
  (package
    (inherit xf86-input-wacom)
    (name "xlibre-input-wacom-bin")))

;; xlibre-video-fbdev-bin -> xf86-video-fbdev (Guix package)
(define-public xlibre-video-fbdev-bin
  (package
    (inherit xf86-video-fbdev)
    (name "xlibre-video-fbdev-bin")))

;; appimagelauncher-git -> appimagelauncher-bin (real recipe in recipe-resolver-260408f.scm)
(define-public appimagelauncher-git
  (package
    (inherit appimagelauncher-bin)
    (name "appimagelauncher-git")))

;; ffmpeg-amd-full-git -> ffmpeg (Guix package)
(define-public ffmpeg-amd-full-git
  (package
    (inherit ffmpeg)
    (name "ffmpeg-amd-full-git")))
