;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413m
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 23 recipes created
;;;   - 7 blocked with specific reason codes
;;;
;;; Recipes (23):
;;;   - grepai-bin (copy, expat)
;;;   - lazydns-bin (copy, gpl3+)
;;;   - aceplay-bin (copy, expat)
;;;   - dawn-writer-bin (copy, expat)
;;;   - miro-pdf-bin (copy, agpl3+)
;;;   - lianwalld-bin (copy, expat)
;;;   - koboldcpp-cuda-bin (copy, agpl3+)
;;;   - portablemc-bin (copy, asl2.0)
;;;   - aura-bin (copy, gpl3+)
;;;   - hla-bin (copy, cc-by4.0)
;;;   - ab-download-manager-bin (copy, asl2.0)
;;;   - katana-mk2-fxfloorboard-bin (copy, gpl3+)
;;;   - exifcleaner-bin (copy, expat)
;;;   - dev-janitor-bin (copy, expat)
;;;   - ride-bin (copy, expat)
;;;   - pairux-bin (copy, expat)
;;;   - openmarch-bin (copy, gpl3+)
;;;   - stremio-enhanced-bin (copy, expat)
;;;   - vial-appimage (copy, gpl2)
;;;   - bs-manager-bin (copy, gpl3+)
;;;   - dn-famitracker-bin (copy, gpl2+)
;;;   - qfinderpro-bin (copy, nonfree)
;;;   - pexip-infinity-connect-bin (copy, nonfree)
;;;
;;; Blocked (7):
;;;   - codex-app-bin (NOT_TRULY_BINARY: builds from source with Node.js/pnpm/electron, not a prebuilt binary)
;;;   - dolphin-anty-bin (UNVERSIONED_SOURCE: proprietary, download URL has no version pinning)
;;;   - time-desktop-bin (UNVERSIONED_SOURCE: download URL always fetches latest, no reproducibility)
;;;   - elephant-symbols-bin (AUR_REMOVED: package does not exist on AUR)
;;;   - elephant-runner-bin (AUR_REMOVED: package does not exist on AUR)
;;;   - elephant-menus-bin (AUR_REMOVED: package does not exist on AUR)
;;;   - elephant-desktopapplications-bin (AUR_REMOVED: package does not exist on AUR)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            grepai-bin
            lazydns-bin
            aceplay-bin
            dawn-writer-bin
            miro-pdf-bin
            lianwalld-bin
            koboldcpp-cuda-bin
            portablemc-bin
            aura-bin
            hla-bin
            ab-download-manager-bin
            katana-mk2-fxfloorboard-bin
            exifcleaner-bin
            dev-janitor-bin
            ride-bin
            pairux-bin
            openmarch-bin
            stremio-enhanced-bin
            vial-appimage
            bs-manager-bin
            dn-famitracker-bin
            qfinderpro-bin
            pexip-infinity-connect-bin
            ))

;;; ---- Simple single-binary packages (tar.gz / raw binary) ----

(define-public grepai-bin
  (package
    (name "grepai-bin")
    (version "0.35.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yoanbernabeu/grepai/releases/download/v"
                    version "/grepai_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("grepai" "bin/grepai"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-first CLI tool for semantic code search")
    (description "GrepAI is a privacy-first CLI tool for semantic code search
using vector embeddings.  It indexes your codebase locally and allows
natural language queries to find relevant code snippets.")
    (home-page "https://github.com/yoanbernabeu/grepai")
    (license license:expat)))

(define-public lazydns-bin
  (package
    (name "lazydns-bin")
    (version "0.2.63")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lazywalker/lazydns/releases/download/v"
                    version "/lazydns-full-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazydns" "bin/lazydns"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "light and fast DNS server/forwarder in Rust")
    (description "LazyDNS is a lightweight and fast DNS server and forwarder
implementation written in Rust.  It provides DNS resolution with caching
and forwarding capabilities.")
    (home-page "https://github.com/lazywalker/lazydns")
    (license license:gpl3+)))

(define-public aceplay-bin
  (package
    (name "aceplay-bin")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/crstian19/aceplay/releases/download/v"
                    version "/aceplay_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aceplay" "bin/aceplay"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern CLI to play Ace Stream links")
    (description "AcePlay is a modern command-line interface to play Ace Stream
links.  It automatically starts the acestream-engine and launches playback
of Ace Stream content.")
    (home-page "https://github.com/crstian19/aceplay")
    (license license:expat)))

(define-public dawn-writer-bin
  (package
    (name "dawn-writer-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/andrewmd5/dawn/releases/download/v"
                    version "/dawn-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dawn" "bin/dawn-writer"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "distraction-free writing environment")
    (description "Dawn is a distraction-free writing environment for drafting
text.  It provides a minimal, focused interface for writing without
unnecessary features getting in the way.")
    (home-page "https://github.com/andrewmd5/dawn")
    (license license:expat)))

(define-public miro-pdf-bin
  (package
    (name "miro-pdf-bin")
    (version "0.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vincent-uden/miro/releases/download/v"
                    version "/miro"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("miro" "bin/miro"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "native PDF viewer for Linux with configurable keybindings")
    (description "Miro is a native PDF viewer for Linux supporting both
Wayland and X11.  It features configurable keybindings and a lightweight
interface for reading PDF documents.")
    (home-page "https://github.com/vincent-uden/miro")
    (license license:agpl3+)))

(define-public lianwalld-bin
  (package
    (name "lianwalld-bin")
    (version "5.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Yueosa/lianwall/releases/download/v"
                    version "/lianwalld_" version "_linux_x86_64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lianwalld" "bin/lianwalld"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "lianwalld_" #$version "_linux_x86_64")
                    "lianwalld")
                   (chmod "lianwalld" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "wallpaper engine daemon based on swww and mpvpaper")
    (description "LianWall Daemon is a wallpaper engine based on swww and
mpvpaper.  It manages wallpaper display and transitions on Wayland
compositors.")
    (home-page "https://github.com/Yueosa/lianwall")
    (license license:expat)))

(define-public koboldcpp-cuda-bin
  (package
    (name "koboldcpp-cuda-bin")
    (version "1.111.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LostRuins/koboldcpp/releases/download/v"
                    version "/koboldcpp-linux-x64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("koboldcpp" "bin/koboldcpp"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file "koboldcpp-linux-x64" "koboldcpp")
                   (chmod "koboldcpp" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple one-file way to run GGML and GGUF models")
    (description "KoboldCpp is a simple, self-contained way to run various
GGML and GGUF language models with KoboldAI's UI.  This binary includes
CUDA support for GPU-accelerated inference.")
    (home-page "https://github.com/LostRuins/koboldcpp")
    (license license:agpl3+)))

(define-public portablemc-bin
  (package
    (name "portablemc-bin")
    (version "5.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/theorzr/portablemc/releases/download/v"
                    version "/portablemc-" version
                    "-linux-x86_64-gnu.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("portablemc" "bin/portablemc"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform command-line Minecraft launcher")
    (description "PortableMC is a cross-platform command-line utility for
launching Minecraft quickly and reliably.  It supports multiple Minecraft
versions and provides a lightweight alternative to the official launcher.")
    (home-page "https://github.com/theorzr/portablemc")
    (license license:asl2.0)))

(define-public aura-bin
  (package
    (name "aura-bin")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fosskers/aura/releases/download/v"
                    version "/aura-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aura" "bin/aura")
               ("aura.8" "share/man/man8/aura.8"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "package manager for Arch Linux and the AUR")
    (description "Aura is a package manager for Arch Linux and its AUR
(Arch User Repository).  It provides a unified interface for managing
both official repository packages and AUR packages.")
    (home-page "https://github.com/fosskers/aura")
    (license license:gpl3+)))

(define-public hla-bin
  (package
    (name "hla-bin")
    (version "2.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.plantation-productions.com/Webster/"
                    "HighLevelAsm/HLAv" version "/linux.hla.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/hla/hla" "bin/hla")
               ("usr/hla/hlaparse" "bin/hlaparse")
               ("usr/hla/hlacmp" "bin/hlacmp")
               ("usr/hla/hlalib/" "lib/hla/hlalib/")
               ("usr/hla/include/" "lib/hla/include/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-level assembler for x86 CPUs")
    (description "HLA (High Level Assembly) is an assembler for the x86 CPU
family that uses a high-level language syntax to make assembly language
programming more accessible.  It supports advanced data types, control
structures, and a standard library.")
    (home-page "https://www.plantation-productions.com/Webster/HighLevelAsm")
    (license license:cc-by4.0)))

;;; ---- tar.gz with directory structure ----

(define-public ab-download-manager-bin
  (package
    (name "ab-download-manager-bin")
    (version "1.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/amir1376/ab-download-manager/"
                    "releases/download/v" version
                    "/ABDownloadManager_" version "_linux_x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/" "lib/ab-download-manager/bin/")
               ("lib/" "lib/ab-download-manager/lib/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (lib (string-append out "/lib/ab-download-manager")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/ab-download-manager")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/bin/ABDownloadManager \"$@\"~%"
                                 lib)))
                     (chmod (string-append bin "/ab-download-manager") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "download manager that speeds up downloads")
    (description "AB Download Manager is a download manager application that
accelerates file downloads by using multiple connections.  It provides a
graphical interface for managing and organizing downloads.")
    (home-page "https://abdownloadmanager.com/")
    (license license:asl2.0)))

(define-public katana-mk2-fxfloorboard-bin
  (package
    (name "katana-mk2-fxfloorboard-bin")
    (version "20260112")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.sourceforge.net/project/fxfloorboard/"
                    "KatanaFxFloorBoard/"
                    "Katana%20FxFloorboard%20for%20MK2%20Desktop/"
                    "Katana_Mk2_FxFloorBoard_FW2_linux.tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/katana-mk2-fxfloorboard/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file
                         (string-append bin "/katana-mk2-fxfloorboard")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/katana-mk2-fxfloorboard/Katana_Mk2_FxFloorBoard \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/katana-mk2-fxfloorboard")
                            #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "editing software for Boss Katana MK2 guitar amplifier")
    (description "Katana MK2 FxFloorBoard is editing software for the Boss
Katana MK2 guitar modelling and effects amplifier.  It allows users to
configure effects, patches, and amp settings from a desktop interface.")
    (home-page "https://sourceforge.net/projects/fxfloorboard/")
    (license license:gpl3+)))

;;; ---- .deb extraction packages ----

(define-public exifcleaner-bin
  (package
    (name "exifcleaner-bin")
    (version "3.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/szTheory/exifcleaner/releases/download/v"
                    version "/exifcleaner_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/"))
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
                     (call-with-output-file (string-append bin "/exifcleaner")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/opt/ExifCleaner/exifcleaner \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/exifcleaner") #o755)))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "clean metadata from images, videos, PDFs, and other files")
    (description "ExifCleaner is a desktop application for removing metadata
from images, videos, PDFs, and other files.  It provides a simple
drag-and-drop interface for batch cleaning EXIF and other metadata.")
    (home-page "https://github.com/szTheory/exifcleaner")
    (license license:expat)))

(define-public dev-janitor-bin
  (package
    (name "dev-janitor-bin")
    (version "2.2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cocojojo5213/Dev-Janitor/releases/"
                    "latest/download/Dev.Janitor_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (cond
                    ((file-exists? "data.tar.xz")
                     (invoke "tar" "xf" "data.tar.xz"))
                    ((file-exists? "data.tar.gz")
                     (invoke "tar" "xf" "data.tar.gz"))))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "developer tool management application")
    (description "Dev Janitor is a developer tool management application that
helps organize and maintain development environments.  It provides a
graphical interface built with Tauri for managing developer tools.")
    (home-page "https://github.com/cocojojo5213/Dev-Janitor")
    (license license:expat)))

(define-public ride-bin
  (package
    (name "ride-bin")
    (version "4.5.4097")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dyalog/ride/releases/download/v"
                    version "/ride-" version "-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (cond
                    ((file-exists? "data.tar.xz")
                     (invoke "tar" "xf" "data.tar.xz"))
                    ((file-exists? "data.tar.gz")
                     (invoke "tar" "xf" "data.tar.gz")))))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/ride")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/opt/ride-4.5/Ride-4.5 \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/ride") #o755)))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "remote IDE for Dyalog APL")
    (description "RIDE (Remote IDE) is a cross-platform development environment
for Dyalog APL.  It provides a graphical interface for writing, debugging,
and running APL code with Dyalog interpreters.")
    (home-page "https://github.com/Dyalog/ride")
    (license license:expat)))

(define-public qfinderpro-bin
  (package
    (name "qfinderpro-bin")
    (version "7.13.2.1308")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.qnap.com/Storage/Utility/"
                    "QNAPQfinderProUbuntux64-" version ".deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "find and access QNAP NAS devices on the network")
    (description "Qfinder Pro helps you find and access all QNAP NAS devices
on the same local area network.  It provides network discovery, system
status monitoring, and quick access to NAS management interfaces.")
    (home-page "https://www.qnap.com/en/utilities/essentials")
    (license (license:nonfree
              "https://www.qnap.com/en/before_buy/con_show.php?op=showone&cid=10"))))

(define-public pexip-infinity-connect-bin
  (package
    (name "pexip-infinity-connect-bin")
    (version "1.13.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.pexip.com/hubfs/dev-assets/"
                    "infinity-connect-download-files/" version
                    "/pexip-infinity-connect_" version
                    "-76975.0.0-1_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "Pexip Infinity video conferencing desktop client")
    (description "Pexip Infinity Connect is the desktop client for Pexip
video conferencing infrastructure.  It provides a native application for
joining and managing video conferences on Pexip Infinity platforms.")
    (home-page "https://www.pexip.com/apps")
    (license (license:nonfree "https://www.pexip.com/legal"))))

;;; ---- AppImage packages ----

(define-public pairux-bin
  (package
    (name "pairux-bin")
    (version "0.6.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/profullstack/pairux.com/releases/download/v"
                    version "/PairUX-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pairux.AppImage" "lib/pairux/pairux.AppImage"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "PairUX-" #$version "-x86_64.AppImage")
                    "pairux.AppImage")
                   (chmod "pairux.AppImage" #o755)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/pairux")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/pairux/pairux.AppImage \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/pairux") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "collaborative screen sharing with remote control")
    (description "PairUX provides collaborative screen sharing with remote
control capabilities.  It enables pair programming and remote assistance
through a desktop application.")
    (home-page "https://pairux.com")
    (license license:expat)))

(define-public openmarch-bin
  (package
    (name "openmarch-bin")
    (version "0.0.22")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenMarch/OpenMarch/releases/download/v"
                    version "/OpenMarch_" version
                    "-linux_x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openmarch.AppImage" "lib/openmarch/openmarch.AppImage"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "OpenMarch_" #$version
                                   "-linux_x86_64.AppImage")
                    "openmarch.AppImage")
                   (chmod "openmarch.AppImage" #o755)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/openmarch")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/openmarch/openmarch.AppImage \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/openmarch") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free and open source drill-writing application")
    (description "OpenMarch is a free and open source drill-writing application
for marching bands and other marching ensembles.  It provides tools for
designing and visualizing marching formations and movements.")
    (home-page "http://openmarch.com/")
    (license license:gpl3+)))

(define-public stremio-enhanced-bin
  (package
    (name "stremio-enhanced-bin")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/REVENGE977/stremio-enhanced/releases/"
                    "download/v" version
                    "/Stremio.Enhanced-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stremio-enhanced.AppImage"
                "lib/stremio-enhanced/stremio-enhanced.AppImage"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "Stremio.Enhanced-" #$version ".AppImage")
                    "stremio-enhanced.AppImage")
                   (chmod "stremio-enhanced.AppImage" #o755)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file
                         (string-append bin "/stremio-enhanced")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/stremio-enhanced/stremio-enhanced.AppImage \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/stremio-enhanced") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "enhanced Stremio media center client with plugins")
    (description "Stremio Enhanced is an Electron-based Stremio client with
support for plugins and themes.  It runs the Stremio streaming server
locally and provides an enhanced media center experience.")
    (home-page "https://github.com/REVENGE977/stremio-enhanced")
    (license license:expat)))

(define-public vial-appimage
  (package
    (name "vial-appimage")
    (version "0.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vial-kb/vial-gui/releases/download/v"
                    version "/Vial-v" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vial.AppImage" "lib/vial/vial.AppImage"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file
                    (string-append "Vial-v" #$version "-x86_64.AppImage")
                    "vial.AppImage")
                   (chmod "vial.AppImage" #o755)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/vial")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/vial/vial.AppImage \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/vial") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source cross-platform keyboard firmware configurator")
    (description "Vial is an open-source cross-platform keyboard firmware
configurator.  It provides a graphical interface for configuring keyboards
running Vial-compatible QMK firmware, with real-time keymap editing.")
    (home-page "https://get.vial.today/")
    (license license:gpl2)))

;;; ---- RPM-based packages ----

(define-public bs-manager-bin
  (package
    (name "bs-manager-bin")
    (version "1.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Zagrios/bs-manager/releases/download/v"
                    version "/bs-manager-" version ".x86_64.rpm"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/BSManager/" "lib/bs-manager/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "rpm2cpio" source)
                   ;; Extract cpio from rpm
                   (system* "sh" "-c"
                            (string-append "rpm2cpio " source " | cpio -idmv"))))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/bs-manager")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/lib/bs-manager/bs-manager \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/bs-manager") #o755)))))))
    (native-inputs (list (@ (gnu packages package-management) rpm)))
    (supported-systems '("x86_64-linux"))
    (synopsis "all-in-one tool for managing Beat Saber")
    (description "BSManager is an all-in-one tool for managing Beat Saber
versions, maps, mods, and more.  It provides a graphical interface for
organizing your Beat Saber installation and custom content.")
    (home-page "https://github.com/Zagrios/bs-manager")
    (license license:gpl3+)))

;;; ---- Wine-wrapped packages ----

(define-public dn-famitracker-bin
  (package
    (name "dn-famitracker-bin")
    (version "0.5.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Dn-Programming-Core-Management/"
                    "Dn-FamiTracker/releases/download/Dn" version
                    "/Dn-FamiTracker_v052_x64_Release.7z"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/Dn-FamiTracker/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "7z" "x" source)))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (call-with-output-file
                         (string-append bin "/dn-famitracker")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec wine ~a/share/Dn-FamiTracker/Dn-FamiTracker.exe \"$@\"~%"
                                 out)))
                     (chmod (string-append bin "/dn-famitracker") #o755)))))))
    (native-inputs (list (@ (gnu packages compression) p7zip)))
    (supported-systems '("x86_64-linux"))
    (synopsis "fork of 0cc-FamiTracker NES music tracker")
    (description "Dn-FamiTracker is a fork of 0cc-FamiTracker, which is itself
a fork of FamiTracker -- a Windows tracker program for producing NES/Famicom
sound chip music.  It incorporates numerous fixes and new features.  This
package runs via Wine.")
    (home-page "https://github.com/Dn-Programming-Core-Management/Dn-FamiTracker")
    (license license:gpl2+)))
