;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413v
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from general queue:
;;;   - 21 recipes created (mixed build systems)
;;;   - 9 re-blocked with concrete attempt notes
;;;
;;; Recipes (21):
;;;   obsidian-appimage, electrum-ltc-appimage, orca-slicer-unstable-bin,
;;;   vicinae-appimage-bin, chitubox-free-bin, tabularis-bin, onlyoffice-bin,
;;;   02engine-bin, kubelogin, google-cloud-cli-gke-gcloud-auth-plugin,
;;;   netlogo, browsh-bin, fabric-server, python-morfeus-ml, python-landlock,
;;;   termux-language-server, otpgui, tidal-dl-ng, usergrant,
;;;   linux-enable-ir-emitter, beekeeper-qt
;;;
;;; Blocked (9):
;;;   arduino [COMPLEX_BUILD: 8+ sources, Java+Processing+custom toolchain]
;;;   jivexdv-bin [WINDOWS_ONLY: source is Windows .exe installer]
;;;   intellij-idea-open-eap [COMPLEX_BUILD: 2 large git repos, full JDK build]
;;;   cython2 [PYTHON2_DEPRECATED: requires Python 2, EOL in Guix]
;;;   helion [DOTNET_UNSUPPORTED: C# game engine, .NET SDK not in Guix]
;;;   piper-voices-en-gb [GIT_LFS_NEEDED: requires git-lfs for HuggingFace models]
;;;   python-zoekt-py-git [DEP_FORK_NEEDED: depends on forked httpx variant]
;;;   socos [DEP_MISSING: requires python-soco not in Guix]
;;;   lazynmap [BUILD_SYSTEM_UNKNOWN: cannot determine language/build system]
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413v)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages java)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:export (
            ;; AppImage binary packages
            obsidian-appimage
            electrum-ltc-appimage
            orca-slicer-unstable-bin
            vicinae-appimage-bin
            chitubox-free-bin
            ;; .deb binary packages
            tabularis-bin
            onlyoffice-bin
            02engine-bin
            ;; Binary tarball/zip packages
            kubelogin
            google-cloud-cli-gke-gcloud-auth-plugin
            netlogo
            browsh-bin
            ;; Java JAR wrapper
            fabric-server
            ;; Python packages
            python-morfeus-ml
            python-landlock
            termux-language-server
            otpgui
            tidal-dl-ng
            ;; Shell/script
            usergrant
            ;; Meson build
            linux-enable-ir-emitter
            ;; CMake build
            beekeeper-qt
            ))

;;; ──────────────────────────────────────────────────────────────────
;;; AppImage binary packages
;;; All use copy-build-system with rename-source phase.
;;; ──────────────────────────────────────────────────────────────────

;;; ── obsidian-appimage (#7028) ──
;;; Obsidian knowledge base, AppImage distribution.

(define-public obsidian-appimage
  (package
    (name "obsidian-appimage")
    (version "1.12.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/obsidianmd/obsidian-releases"
                    "/releases/download/v" version
                    "/Obsidian-" version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("obsidian.AppImage" "bin/obsidian-appimage"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "obsidian.AppImage")
                     (chmod "obsidian.AppImage" #o755)))))))
    (home-page "https://obsidian.md/")
    (synopsis "knowledge base on local Markdown files (AppImage)")
    (description "Obsidian is a powerful knowledge base that works on top of
a local folder of plain text Markdown files.  This package provides the
AppImage distribution.")
    (license (license:non-copyleft
              "https://obsidian.md/eula"
              "Obsidian EULA"))))

;;; ── electrum-ltc-appimage (#7248) ──
;;; Litecoin wallet, AppImage distribution.

(define-public electrum-ltc-appimage
  (package
    (name "electrum-ltc-appimage")
    (version "4.2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://electrum-ltc.org/download/electrum-ltc-"
                    version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("electrum-ltc.AppImage" "bin/electrum-ltc"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "electrum-ltc.AppImage")
                     (chmod "electrum-ltc.AppImage" #o755)))))))
    (home-page "https://electrum-ltc.org/")
    (synopsis "lightweight Litecoin wallet (AppImage)")
    (description "Electrum-LTC is a lightweight Litecoin wallet.  It does not
download the Litecoin blockchain, and it is able to verify transactions using
SPV.  This package provides the AppImage distribution.")
    (license license:expat)))

;;; ── orca-slicer-unstable-bin (#10190) ──
;;; OrcaSlicer 3D printing G-code generator, AppImage.

(define-public orca-slicer-unstable-bin
  (package
    (name "orca-slicer-unstable-bin")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OrcaSlicer/OrcaSlicer"
                    "/releases/download/v" version
                    "/OrcaSlicer_Linux_AppImage_Ubuntu2404_V"
                    version ".AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("orca-slicer.AppImage" "bin/orca-slicer"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "orca-slicer.AppImage")
                     (chmod "orca-slicer.AppImage" #o755)))))))
    (home-page "https://github.com/OrcaSlicer/OrcaSlicer")
    (synopsis "G-code generator for 3D printers (AppImage)")
    (description "OrcaSlicer is an open-source G-code generator for 3D
printers.  It supports a wide range of 3D printers and filament types, with
features like multi-plate support, auto-orientation, and tree supports.  This
package provides the unstable/beta AppImage distribution.")
    (license license:agpl3)))

;;; ── vicinae-appimage-bin (#7667) ──
;;; Vicinae: Raycast-like FOSS app launcher for Linux.

(define-public vicinae-appimage-bin
  (package
    (name "vicinae-appimage-bin")
    (version "0.20.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vicinaehq/vicinae"
                    "/releases/download/v" version
                    "/vicinae-" version "-x86_64.AppImage"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vicinae.AppImage" "bin/vicinae"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (let ((appimage (car (find-files "." "\\.AppImage$"))))
                     (rename-file appimage "vicinae.AppImage")
                     (chmod "vicinae.AppImage" #o755)))))))
    (home-page "https://github.com/vicinaehq/vicinae")
    (synopsis "Raycast-like FOSS app launcher for Linux")
    (description "Vicinae is a Raycast-like FOSS application launcher for
Linux.  It provides a quick-access search bar for launching applications,
running commands, and accessing shortcuts.")
    (license license:gpl3)))

;;; ── chitubox-free-bin (#4711) ──
;;; Chitubox 3D slicer for SLA/DLP/LCD printers.

(define-public chitubox-free-bin
  (package
    (name "chitubox-free-bin")
    (version "2.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.chitubox.com/17839/v" version
                    "/CHITUBOX_Basic_linux_Installer_" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file #$source (string-append bin "/chitubox-free"))
            (chmod (string-append bin "/chitubox-free") #o755)
            #t))))
    (home-page "https://www.chitubox.com/")
    (synopsis "3D slicer for SLA/DLP/LCD resin printers")
    (description "CHITUBOX Basic is a 3D printing slicer for SLA, DLP, and LCD
resin printers.  It provides slicing, support generation, and print preparation
tools for resin-based 3D printing workflows.")
    (license (license:non-copyleft
              "https://www.chitubox.com/eula"
              "CHITUBOX EULA"))))

;;; ──────────────────────────────────────────────────────────────────
;;; .deb binary packages
;;; All use trivial-build-system for extraction.
;;; ──────────────────────────────────────────────────────────────────

;;; ── tabularis-bin (#4594) ──
;;; Lightweight database management tool, Tauri binary .deb.

(define-public tabularis-bin
  (package
    (name "tabularis-bin")
    (version "0.9.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/debba/tabularis/releases/download/v"
                    version "/tabularis_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://github.com/debba/tabularis")
    (synopsis "lightweight database management tool")
    (description "Tabularis is a lightweight, developer-focused database
management tool built with Tauri.  It provides a clean interface for working
with databases without the overhead of full-featured GUI clients.")
    (license (license:non-copyleft
              "https://github.com/debba/tabularis/blob/main/LICENSE"
              "Tabularis custom license"))))

;;; ── onlyoffice-bin (#12019) ──
;;; OnlyOffice Desktop Editors, binary .deb from GitHub.

(define-public onlyoffice-bin
  (package
    (name "onlyoffice-bin")
    (version "9.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ONLYOFFICE/DesktopEditors"
                    "/releases/download/v" version
                    "/onlyoffice-desktopeditors_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            (when (file-exists? "opt")
              (copy-recursively "opt" (string-append out "/opt")))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://www.onlyoffice.com/")
    (synopsis "office suite with text, spreadsheet, and presentation editors")
    (description "ONLYOFFICE Desktop Editors is an office suite that combines
text, spreadsheet, and presentation editors.  It allows creating, viewing,
and editing documents locally with high compatibility for Microsoft Office
formats.")
    (license license:agpl3)))

;;; ── 02engine-bin (#5004) ──
;;; 02engine design tool, binary .deb from GitHub.

(define-public 02engine-bin
  (package
    (name "02engine-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              ;; Release tag includes commit hash suffix
              (uri "https://github.com/02engine/desktop/releases/download/v1.2.3-3315b4af/02Engine-linux-amd64-1.2.3.deb")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (setenv "PATH" (string-append #$tar "/bin:"
                                          #$gzip "/bin:"
                                          #$xz "/bin"))
            (invoke "tar" "xf" #$source)
            (invoke "tar" "xf" (car (find-files "." "^data\\.tar")))
            (mkdir-p bin)
            (mkdir-p share)
            (when (file-exists? "usr/bin")
              (copy-recursively "usr/bin" bin))
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            #t))))
    (native-inputs (list tar gzip xz))
    (home-page "https://github.com/02engine/")
    (synopsis "design tool for creative workflows")
    (description "02Engine is a design tool that aims to redefine the designing
experience.  It provides a desktop application for creative design workflows.")
    (license license:gpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Binary tarball/zip packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── kubelogin (#4344) ──
;;; Kubernetes OIDC authentication kubectl plugin, prebuilt binary.

(define-public kubelogin
  (package
    (name "kubelogin")
    (version "1.35.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/int128/kubelogin"
                    "/releases/download/v" version
                    "/kubelogin_linux_amd64.zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("kubelogin" "bin/kubelogin"))))
    (native-inputs (list unzip))
    (home-page "https://github.com/int128/kubelogin")
    (synopsis "kubectl plugin for Kubernetes OpenID Connect authentication")
    (description "Kubelogin is a kubectl plugin for Kubernetes OpenID Connect
(OIDC) authentication, also known as kubectl oidc-login.  It obtains tokens
from the OIDC provider and writes them to the kubeconfig.")
    (license license:asl2.0)))

;;; ── google-cloud-cli-gke-gcloud-auth-plugin (#4221) ──
;;; GKE authentication plugin for Google Cloud CLI.

(define-public google-cloud-cli-gke-gcloud-auth-plugin
  (package
    (name "google-cloud-cli-gke-gcloud-auth-plugin")
    (version "542.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dl.google.com/dl/cloudsdk/release"
                    "/downloads/for_packagers/linux/"
                    "google-cloud-cli-gke-gcloud-auth-plugin_"
                    version ".orig_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gke-gcloud-auth-plugin" "bin/gke-gcloud-auth-plugin"))))
    (home-page "https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke")
    (synopsis "GKE authentication plugin for kubectl")
    (description "A Google Cloud CLI component that provides a kubectl
authentication plugin for Google Kubernetes Engine (GKE).  It handles
authentication to GKE clusters using Google Cloud credentials.")
    (license license:asl2.0)))

;;; ── netlogo (#4503) ──
;;; Multi-agent programmable modeling environment, self-contained tarball.

(define-public netlogo
  (package
    (name "netlogo")
    (version "7.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://ccl.northwestern.edu/netlogo/"
                    version "/NetLogo-" version "-64.tgz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/netlogo/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-wrapper
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (netlogo-dir (string-append out "/share/netlogo")))
                     (mkdir-p bin)
                     (with-output-to-file (string-append bin "/netlogo")
                       (lambda ()
                         (format #t "#!/bin/sh~%exec ~a/NetLogo \"$@\"~%"
                                 netlogo-dir)))
                     (chmod (string-append bin "/netlogo") #o755)))))))
    (home-page "https://www.netlogo.org")
    (synopsis "multi-agent programmable modeling environment")
    (description "NetLogo is a multi-agent programmable modeling environment
for simulating natural and social phenomena.  It is particularly well suited
for modeling complex systems developing over time, and can instruct thousands
of independent agents to operate concurrently.")
    (license license:gpl2+)))

;;; ── browsh-bin (#4712) ──
;;; Text-based browser, pre-built binary from GitHub.

(define-public browsh-bin
  (package
    (name "browsh-bin")
    (version "1.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/browsh-org/browsh"
                    "/releases/download/v" version
                    "/browsh_" version "_linux_amd64"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file #$source (string-append bin "/browsh"))
            (chmod (string-append bin "/browsh") #o755)
            #t))))
    (home-page "https://www.brow.sh")
    (synopsis "fully modern text-based browser")
    (description "Browsh is a fully-modern text-based browser, rendering to
TTY and browsers.  It uses Firefox in the background to render web pages
and then converts the rendered output to text.")
    (license license:lgpl2.1)))

;;; ──────────────────────────────────────────────────────────────────
;;; Java JAR wrapper
;;; ──────────────────────────────────────────────────────────────────

;;; ── fabric-server (#4267) ──
;;; Fabric modded Minecraft server installer JAR.

(define-public fabric-server
  (package
    (name "fabric-server")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://maven.fabricmc.net/net/fabricmc"
                    "/fabric-installer/" version
                    "/fabric-installer-" version ".jar"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (bin (string-append out "/bin"))
                 (lib (string-append out "/lib"))
                 (jar (string-append lib "/fabric-installer.jar"))
                 (wrapper (string-append bin "/fabric-server")))
            (mkdir-p bin)
            (mkdir-p lib)
            (copy-file #$source jar)
            (with-output-to-file wrapper
              (lambda ()
                (format #t "#!/bin/sh~%exec ~a/bin/java -jar ~a server \"$@\"~%"
                        #$icedtea jar)))
            (chmod wrapper #o755)
            #t))))
    (inputs (list icedtea))
    (home-page "https://fabricmc.net")
    (synopsis "Fabric modded Minecraft server installer")
    (description "Fabric is a lightweight, modular mod loader for Minecraft.
This package provides the Fabric server installer JAR, which sets up a
Fabric-enabled Minecraft server with the specified loader and game version.")
    (license license:asl2.0)))

;;; ──────────────────────────────────────────────────────────────────
;;; Python packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── python-morfeus-ml (#7568) ──
;;; Python package for calculating molecular features.

(define-public python-morfeus-ml
  (package
    (name "python-morfeus-ml")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "morfeus-ml" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/digital-chemistry-laboratory/morfeus")
    (synopsis "Python package for calculating molecular features")
    (description "Morfeus is a Python package for calculating molecular
features from 3D structures.  It provides various molecular descriptors
useful in computational chemistry and machine learning applications.")
    (license license:expat)))

;;; ── python-landlock (#7614) ──
;;; Python interface to the Landlock Linux Security Module.

(define-public python-landlock
  (package
    (name "python-landlock")
    (version "1.0.0.dev5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Edward-Knight/landlock"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Edward-Knight/landlock")
    (synopsis "Python interface to the Landlock Linux Security Module")
    (description "Python-landlock provides a Python interface to the Landlock
Linux Security Module.  Landlock allows unprivileged processes to restrict
their own access rights, providing a lightweight sandboxing mechanism.")
    (license license:expat)))

;;; ── termux-language-server (#7474) ──
;;; Language server for build.sh, PKGBUILD, ebuild.

(define-public termux-language-server
  (package
    (name "termux-language-server")
    (version "0.0.31")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "termux-language-server" version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/termux/termux-language-server")
    (synopsis "language server for shell build scripts")
    (description "Termux Language Server provides IDE-like features for shell
build script formats including Termux build.sh, Arch Linux PKGBUILD, and
Gentoo ebuild files.  It supports completion, hover, diagnostics, and
formatting via the Language Server Protocol.")
    (license license:gpl3)))

;;; ── otpgui (#7450) ──
;;; Python/GTK OTP generator compatible with TOTP.

(define-public otpgui
  (package
    (name "otpgui")
    (version "0.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gianluca-mascolo/otpgui"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/gianluca-mascolo/otpgui")
    (synopsis "OTP generator compatible with TOTP")
    (description "OTPGui is an OTP (One-Time Password) generator compatible
with TOTP (Time-based One-Time Password).  It provides a graphical interface
built with GTK for generating and managing OTP tokens.")
    (license license:gpl3)))

;;; ── tidal-dl-ng (#3804) ──
;;; Tool for downloading music from TIDAL.

(define-public tidal-dl-ng
  (package
    (name "tidal-dl-ng")
    (version "0.33.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/t/"
                    "tidal_dl_ng/tidal_dl_ng-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://pypi.org/project/tidal-dl-ng/")
    (synopsis "tool for downloading music from TIDAL")
    (description "Tidal-dl-ng is a tool for downloading music and albums from
the TIDAL streaming service.  It supports downloading tracks, albums, and
playlists in various audio qualities including lossless FLAC.")
    (license license:agpl3)))

;;; ──────────────────────────────────────────────────────────────────
;;; Shell/script packages
;;; ──────────────────────────────────────────────────────────────────

;;; ── usergrant (#7451) ──
;;; Temporarily grant ACLs and environment to a secondary user.

(define-public usergrant
  (package
    (name "usergrant")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pyamsoft/usergrant")
                    (commit "89a0b27")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/usergrant/"
                #:exclude (".git" ".gitignore" "LICENSE" "README.md")))))
    (home-page "https://github.com/pyamsoft/usergrant")
    (synopsis "temporarily grant ACLs to a secondary user")
    (description "Usergrant temporarily grants ACLs and environment variables
to a secondary user for the duration of a command.  It provides a mechanism
for controlled privilege delegation without permanent permission changes.")
    (license license:gpl2)))

;;; ──────────────────────────────────────────────────────────────────
;;; Meson/CMake source builds
;;; ──────────────────────────────────────────────────────────────────

;;; ── linux-enable-ir-emitter (#4193) ──
;;; IR camera emitter enablement tool.

(define-public linux-enable-ir-emitter
  (package
    (name "linux-enable-ir-emitter")
    (version "7.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/EmixamPP/linux-enable-ir-emitter"
                    "/archive/refs/tags/" version "-beta.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list python))
    (home-page "https://github.com/EmixamPP/linux-enable-ir-emitter")
    (synopsis "enable infrared camera emitters on Linux")
    (description "Linux-enable-ir-emitter provides support for infrared cameras
that are not directly enabled out-of-the-box on Linux.  It configures the IR
emitter associated with a camera device, enabling features like Windows Hello
compatible face recognition.")
    (license license:expat)))

;;; ── beekeeper-qt (#4387) ──
;;; Disk deduplication tool with Qt interface.

(define-public beekeeper-qt
  (package
    (name "beekeeper-qt")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/techmanwalker/beekeeper-qt"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/techmanwalker/beekeeper-qt")
    (synopsis "disk deduplication tool with Qt interface")
    (description "Beekeeper-Qt is a deduplication tool that identifies and
removes redundant data on disk to save storage space.  It provides a Qt-based
graphical interface for managing deduplication operations with features like
file scanning, hash comparison, and safe removal of duplicates.")
    (license license:agpl3)))
