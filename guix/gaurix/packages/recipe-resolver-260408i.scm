;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Recipe resolver pass — recipe-resolver-260408i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 7 new binary recipes (copy-build-system)
;;;   - 3 compat aliases to existing Guix/Gaurix packages
;;;   - 20 re-evaluated with specific blocking reasons
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260408i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages high-availability)
  #:use-module (nongnu packages linux)
  #:export (
            ;; New binary recipes
            recaf-bin
            pixelorama-bin
            tnoodle-wca-bin
            flclash-bin
            openmarch-bin
            chataigne-stable-bin
            capacities-appimage
            ;; Compat aliases
            linux-firmware-git
            tnoodle-cli
            haproxy-awslc))

;;;
;;; ── recaf-bin ──────────────────────────────────────────
;;; Modern Java bytecode editor
;;;
(define-public recaf-bin
  (package
    (name "recaf-bin")
    (version "4.0.0-alpha")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Col-E/Recaf/releases/download/"
             version "/recaf-4x-alpha-linux-86-x64.jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("recaf.jar" "share/java/recaf.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "recaf.jar")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jar (string-append out "/share/java/recaf.jar")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/recaf")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec java -jar ~a \"$@\"\n" jar)))
                (chmod (string-append bin "/recaf") #o755))))
          (delete 'install-license-files))))
    (inputs (list icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Col-E/Recaf")
    (synopsis "modern Java bytecode editor")
    (description
     "Recaf is a modern Java bytecode editor that simplifies editing
compiled Java applications.  It provides an IDE-like interface for
decompilation, editing, and recompilation of Java class files.  This
package provides the self-contained binary distribution.")
    (license license:expat)))

;;;
;;; ── pixelorama-bin ──────────────────────────────────────────
;;; Open-source pixel art multitool
;;;
(define-public pixelorama-bin
  (package
    (name "pixelorama-bin")
    (version "1.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Orama-Interactive/Pixelorama/releases/download/v"
             version "/Pixelorama-Linux-64bit.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Pixelorama.x86_64" "bin/pixelorama")
           ("Pixelorama.pck" "share/pixelorama/Pixelorama.pck"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Orama-Interactive/Pixelorama")
    (synopsis "open-source pixel art multitool built with Godot")
    (description
     "Pixelorama is a free and open-source pixel art editor built with
the Godot engine.  It features layers, animation timeline, onion
skinning, custom brushes, tiling mode, and various selection and
drawing tools.  This package provides the pre-built binary.")
    (license license:expat)))

;;;
;;; ── tnoodle-wca-bin ──────────────────────────────────────────
;;; Official WCA Rubik's Cube scramble generator
;;;
(define-public tnoodle-wca-bin
  (package
    (name "tnoodle-wca-bin")
    (version "1.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thewca/tnoodle/releases/download/v"
             version "/TNoodle-WCA-" version ".jar"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tnoodle-wca.jar" "share/java/tnoodle-wca.jar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "tnoodle-wca.jar")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (jar (string-append out "/share/java/tnoodle-wca.jar")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/tnoodle-wca")
                  (lambda (port)
                    (format port "#!/bin/sh\nexec java -jar ~a \"$@\"\n" jar)))
                (chmod (string-append bin "/tnoodle-wca") #o755))))
          (delete 'install-license-files))))
    (inputs (list icedtea))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thewca/tnoodle")
    (synopsis "official WCA scramble program for Rubik's Cube competitions")
    (description
     "TNoodle is the official scramble program of the World Cube
Association (WCA) for generating competition-legal scramble sequences
for twisty puzzles.  It provides a web-based interface for scramble
generation and PDF export.  This package provides the pre-built JAR.")
    (license license:agpl3+)))

;;;
;;; ── flclash-bin ──────────────────────────────────────────
;;; Multi-platform proxy client based on ClashMeta
;;;
(define-public flclash-bin
  (package
    (name "flclash-bin")
    (version "0.8.92")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chen08209/FlClash/releases/download/v"
             version "/FlClash-" version "-linux-amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/flclash/" "share/flclash/")
           ("usr/share/" "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (symlink (string-append out "/share/flclash/flclash")
                         (string-append bin "/flclash")))))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chen08209/FlClash")
    (synopsis "multi-platform proxy client based on ClashMeta")
    (description
     "FlClash is a multi-platform proxy client based on ClashMeta with
a Flutter GUI.  It supports various proxy protocols and provides
traffic routing, rule-based filtering, and connection management.
This package provides the pre-built binary.")
    (license license:gpl3+)))

;;;
;;; ── openmarch-bin ──────────────────────────────────────────
;;; Open-source marching band drill design tool
;;;
(define-public openmarch-bin
  (package
    (name "openmarch-bin")
    (version "0.0.22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OpenMarch/OpenMarch/releases/download/v"
             version "/OpenMarch_" version "-linux_x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("openmarch" "bin/openmarch"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "openmarch")
              (chmod "openmarch" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OpenMarch/OpenMarch")
    (synopsis "open-source marching band drill design application")
    (description
     "OpenMarch is a free and open-source drill-writing application for
marching bands and color guards.  It provides tools for creating and
editing formations, generating transitions, and exporting drill
charts.  This package provides the pre-built AppImage binary.")
    (license license:agpl3+)))

;;;
;;; ── chataigne-stable-bin ──────────────────────────────────────────
;;; Artist-friendly modular machine for art and technology
;;;
(define-public chataigne-stable-bin
  (package
    (name "chataigne-stable-bin")
    (version "1.10.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://benjamin.kuperberg.fr/chataigne/user/data/"
             "Chataigne-linux-x64-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("chataigne" "bin/chataigne"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "chataigne")
              (chmod "chataigne" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/benkuper/Chataigne")
    (synopsis "artist-friendly modular machine for art and technology")
    (description
     "Chataigne is a free, open-source, modular software for creative
projects.  It connects hardware (OSC, MIDI, DMX, Serial) and software
(HTTP, WebSocket) with a node-based interface for real-time control of
lighting, sound, video, and interactive installations.  This package
provides the pre-built AppImage binary.")
    (license license:gpl3+)))

;;;
;;; ── capacities-appimage ──────────────────────────────────────────
;;; Personal knowledge management app
;;;
(define-public capacities-appimage
  (package
    (name "capacities-appimage")
    (version "1.60.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://2vks4.upcloudobjects.com/capacities-desktop-app/"
             "Capacities-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("capacities" "bin/capacities"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "capacities")
              (chmod "capacities" #o755)))
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://capacities.io")
    (synopsis "personal knowledge management desktop application")
    (description
     "Capacities is a knowledge management application that organizes
notes, ideas, and information using an object-based approach.  It
provides bidirectional linking, daily notes, and structured content
types.  This package provides the pre-built AppImage binary.")
    (license (nonguix-license:nonfree
              "https://capacities.io/terms"))))

;;;
;;; ── Compat aliases ──────────────────────────────────────────
;;;

;; AUR linux-firmware-git -> Guix linux-firmware
(define-public linux-firmware-git
  (package
    (inherit linux-firmware)
    (name "linux-firmware-git")))

;; AUR tnoodle-cli -> gaurix tnoodle-wca-bin
(define-public tnoodle-cli
  (package
    (inherit tnoodle-wca-bin)
    (name "tnoodle-cli")))

;; AUR haproxy-awslc -> Guix haproxy
;; Note: AUR variant links against AWS-LC instead of OpenSSL;
;; this alias maps to standard haproxy.
(define-public haproxy-awslc
  (package
    (inherit haproxy)
    (name "haproxy-awslc")))
