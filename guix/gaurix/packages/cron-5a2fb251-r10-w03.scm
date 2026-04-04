;;; Chunk-local package module for cron-5a2fb251-r10 worker w03.
(define-module (gaurix packages cron-5a2fb251-r10-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-build)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (prefixer
            noctalia-qs
            minecraft-launcher
            polychromatic
            ttf-ms-win11-auto
            rustdesk
            ventoy-bin
            noctalia-shell
            vscodium-bin
            dms-shell-bin))

;;; ─── 1. prefixer ─────────────────────────────────────────────────────────────
;;; Proton Prefix management tool.  Pure Python; build from source with
;;; pyproject-build-system.

(define-public prefixer
  (package
    (name "prefixer")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/wojtmic/prefixer/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0n90999igq2l7c8d4dwhlmsn09i496wh4iw39q2cnsm7930zafxi"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))                ; no test suite in upstream
    (propagated-inputs
     (list python-vdf
           python-json5
           python-requests
           python-click
           python-rapidfuzz))
    (home-page "https://github.com/wojtmic/prefixer")
    (synopsis "Modern Proton Prefix management tool")
    (description
     "Prefixer is a modern tool for managing Proton prefixes, providing
features for Wine/Proton compatibility layer configuration.")
    (license license:gpl3)))

;;; ─── 2. noctalia-qs ──────────────────────────────────────────────────────────
;;; Custom fork of Quickshell powering Noctalia Shell.
;;; Requires cmake + Qt6 + Wayland — complex native build with many deps not
;;; in Guix.  Mark BLOCKED.

(define-public noctalia-qs
  (package
    (name "noctalia-qs")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://example.com/placeholder")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "noctalia-qs: BLOCKED — requires Qt6 Wayland/Quickshell ecosystem not available in Guix")))
    (home-page "https://github.com/noctalia-dev/noctalia-qs")
    (synopsis "Custom Quickshell fork for Noctalia Shell (BLOCKED — Qt6 Wayland ecosystem)")
    (description
     "Noctalia-qs is a custom fork of Quickshell powering the Noctalia Shell
desktop environment.  Building from source requires the Qt6 Wayland compositor
ecosystem (qt6-declarative, qt6-wayland, qt6-shadertools, SPIRV-Tools, CLI11)
which are not yet packaged in Guix.  Attempted approaches: (1) cmake source
build — blocked by missing qt6-declarative/qt6-wayland, (2) searching for
pre-built binaries — none published, (3) checking for alternative packaging
— no AppImage or Flatpak available.")
    (license license:lgpl3)))

;;; ─── 3. minecraft-launcher ───────────────────────────────────────────────────
;;; Official Minecraft launcher — binary tar.gz from Mojang.

(define-public minecraft-launcher
  (package
    (name "minecraft-launcher")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://launcher.mojang.com/download/Minecraft.tar.gz")
       (sha256
        (base32 "0pp42k9qazi1ly3ccq0hlq9xqk8fg8136ip7gzsbrfs72ll6jlk9"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (bin (string-append out "/bin")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (install-file (string-append tmp "/minecraft-launcher/minecraft-launcher")
                          bin)
            (chmod (string-append bin "/minecraft-launcher") #o755)))))
    (home-page "https://www.minecraft.net")
    (synopsis "Official Minecraft launcher")
    (description
     "The official Minecraft launcher from Mojang for launching and managing
Minecraft: Java Edition.")
    (license (license:non-copyleft
              "https://www.minecraft.net/en-us/eula"
              "Proprietary Minecraft EULA"))))

;;; ─── 4. polychromatic ────────────────────────────────────────────────────────
;;; RGB lighting controller — Python + meson.  Depends on python-openrazer,
;;; python-pyqt6, etc. which are not in Guix.  BLOCKED.

(define-public polychromatic
  (package
    (name "polychromatic")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://example.com/placeholder")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "polychromatic: BLOCKED — requires python-openrazer and python-pyqt6 not available in Guix")))
    (home-page "https://github.com/polychromatic/polychromatic")
    (synopsis "RGB lighting management front-end (BLOCKED — missing python-openrazer/PyQt6)")
    (description
     "Polychromatic is an RGB lighting management front-end application for
OpenRazer.  Building from source requires python-openrazer, python-pyqt6,
python-pyqt6-webengine, and python-colour which are not yet available in Guix.
Attempted approaches: (1) meson source build — blocked by missing
python-openrazer and python-pyqt6, (2) checking for binary releases — no .deb,
AppImage, or Flatpak binary provided by upstream, (3) attempting to package
only the CLI portion — still requires python-openrazer as core dependency.")
    (license license:gpl3+)))

;;; ─── 5. ttf-ms-win11-auto ───────────────────────────────────────────────────
;;; Windows 11 fonts — requires downloading selective parts from a Windows
;;; Enterprise evaluation ISO.  BLOCKED.

(define-public ttf-ms-win11-auto
  (package
    (name "ttf-ms-win11-auto")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://example.com/placeholder")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "ttf-ms-win11-auto: BLOCKED — requires downloading Windows 11 Enterprise ISO or selective HTTP mount")))
    (home-page "https://www.microsoft.com/typography/fonts")
    (synopsis "Windows 11 TrueType fonts (BLOCKED — requires Windows ISO download)")
    (description
     "Microsoft Windows 11 TrueType fonts extracted from the enterprise
evaluation ISO.  The AUR package uses HTTPDirFS to selectively download font
files from a Windows 11 Enterprise evaluation image.  Attempted approaches:
(1) direct font download — no stable direct URLs for individual font files,
(2) scripted ISO partial download — requires HTTPDirFS, udisks2, loop mount
infrastructure not suitable for Guix build sandbox, (3) alternative font
sources — Microsoft does not provide standalone downloads for Win11 system fonts.
EULA also prohibits usage outside Windows.")
    (license (license:non-copyleft
              "https://www.microsoft.com/typography/fonts/eula.aspx"
              "Proprietary Microsoft fonts license"))))

;;; ─── 6. rustdesk ─────────────────────────────────────────────────────────────
;;; Remote desktop — binary .deb repackage (source build extremely complex
;;; with Rust + Flutter + sciter + vcpkg).

(define-public rustdesk
  (package
    (name "rustdesk")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rustdesk/rustdesk/releases/download/"
             version "/rustdesk-" version "-x86_64.deb"))
       (sha256
        (base32 "014giif43vrxgclkn780f5rgmh8hk8qp8grjspg848i5gdx6v90d"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (share (string-append out "/share")))
            (invoke #$(file-append binutils "/bin/ar") "x" src)
            (invoke #$(file-append tar "/bin/tar")
                    (string-append "--use-compress-program="
                                   #$(file-append xz "/bin/xz"))
                    "-xf" "data.tar.xz")
            (copy-recursively "usr/bin" bin)
            (when (file-exists? "usr/share")
              (copy-recursively "usr/share" share))
            (when (file-exists? "usr/lib")
              (copy-recursively "usr/lib"
                                (string-append out "/lib")))))))
    (home-page "https://rustdesk.com")
    (synopsis "Open-source remote desktop software")
    (description
     "RustDesk is a full-featured open-source remote desktop software that
works out of the box, no configuration required.  You have full control of
your data, with no concerns about security.  This package repackages the
official pre-built binary.")
    (license license:agpl3+)))

;;; ─── 7. ventoy-bin ───────────────────────────────────────────────────────────
;;; Bootable USB solution — binary tar.gz repackage.

(define-public ventoy-bin
  (package
    (name "ventoy-bin")
    (version "1.1.10")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ventoy/Ventoy/releases/download/v"
             version "/ventoy-" version "-linux.tar.gz"))
       (sha256
        (base32 "025jpv2rgv362rqgvzpl0j08a4m945k9cjjpzqs2hwdvw7kan4qi"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (opt (string-append out "/opt/ventoy"))
                 (bin (string-append out "/bin")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (copy-recursively (string-append tmp "/ventoy-" #$version) opt)
            (mkdir-p bin)
            (symlink (string-append opt "/VentoyGUI.x86_64")
                     (string-append bin "/ventoy-gui"))
            (for-each
             (lambda (script)
               (when (file-exists? (string-append opt "/" script))
                 (symlink (string-append opt "/" script)
                          (string-append bin "/" script))))
             '("Ventoy2Disk.sh" "CreatePersistentImg.sh"
               "ExtendPersistentImg.sh"))))))
    (home-page "https://www.ventoy.net")
    (synopsis "Bootable USB solution")
    (description
     "Ventoy is an open-source tool to create bootable USB drives.  Simply
copy ISO/WIM/IMG/VHD(x)/EFI files to the USB drive and boot from them
directly.  No need to extract the images.  This package repackages the
official pre-built Linux binary release.")
    (license license:gpl3+)))

;;; ─── 8. noctalia-shell ───────────────────────────────────────────────────────
;;; Desktop shell for Wayland built with Quickshell.
;;; Depends on noctalia-qs which is BLOCKED.  BLOCKED transitively.

(define-public noctalia-shell
  (package
    (name "noctalia-shell")
    (version "0")
    (source
     (origin
       (method url-fetch)
       (uri "https://example.com/placeholder")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(error "noctalia-shell: BLOCKED — depends on noctalia-qs which is BLOCKED")))
    (home-page "https://github.com/noctalia-dev/noctalia-shell")
    (synopsis "Sleek minimal Wayland desktop shell (BLOCKED — depends on noctalia-qs)")
    (description
     "Noctalia Shell is a sleek and minimal desktop shell for Wayland built
with Quickshell.  It depends on noctalia-qs (custom Quickshell fork) which
cannot currently be built in Guix due to missing Qt6 Wayland ecosystem.
Attempted approaches: (1) package as data files (QML) with noctalia-qs
dependency — noctalia-qs is BLOCKED, (2) looking for standalone binary
release — none available, (3) checking Flatpak/AppImage — none published.")
    (license license:expat)))

;;; ─── 9. vscodium-bin ─────────────────────────────────────────────────────────
;;; Free/open VSCode binary — .deb repackage from GitHub releases.

(define-public vscodium-bin
  (package
    (name "vscodium-bin")
    (version "1.112.01907")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/VSCodium/vscodium/releases/download/"
             version "/codium_" version "_amd64.deb"))
       (sha256
        (base32 "1hw7di3bbww28i9k3p78y6h32rm88jzqpbfqf4b25hb6sslvlxyy"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/vscodium"))
                 (bin (string-append out "/bin"))
                 (apps (string-append out "/share/applications"))
                 (pixmaps (string-append out "/share/pixmaps")))
            (invoke #$(file-append binutils "/bin/ar") "x" src)
            (invoke #$(file-append tar "/bin/tar")
                    (string-append "--use-compress-program="
                                   #$(file-append xz "/bin/xz"))
                    "-xf" "data.tar.xz")
            (copy-recursively "usr/share/codium" opt)
            (mkdir-p bin)
            (symlink (string-append opt "/bin/codium")
                     (string-append bin "/codium"))
            (mkdir-p apps)
            (mkdir-p pixmaps)
            (when (file-exists? "usr/share/applications")
              (copy-recursively "usr/share/applications" apps))
            (when (file-exists? "usr/share/pixmaps")
              (copy-recursively "usr/share/pixmaps" pixmaps))))))
    (home-page "https://vscodium.com")
    (synopsis "Free/open-source binary distribution of VS Code")
    (description
     "VSCodium is a community-driven, freely-licensed binary distribution of
Microsoft's VS Code editor, without Microsoft's telemetry and branding.
This package repackages the official pre-built .deb release.")
    (license license:expat)))

;;; ─── 10. dms-shell-bin ───────────────────────────────────────────────────────
;;; DMS (Dank Material Shell) — binary tar.gz repackage.

(define-public dms-shell-bin
  (package
    (name "dms-shell-bin")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AvengeMedia/DankMaterialShell/releases/download/v"
             version "/dms-full-amd64.tar.gz"))
       (sha256
        (base32 "08y0wg80b967dw53daswq2f4ab8zjjdfbpdbz2n32027yb7vs3f2"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tmp (string-append (getcwd) "/src"))
                 (bin (string-append out "/bin"))
                 (share-qs (string-append out "/share/quickshell"))
                 (share-doc (string-append out "/share/doc/dms-shell-bin")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (mkdir-p bin)
            (install-file (string-append tmp "/bin/dms-distropkg") bin)
            (rename-file (string-append bin "/dms-distropkg")
                         (string-append bin "/dms"))
            (chmod (string-append bin "/dms") #o755)
            (when (file-exists? (string-append tmp "/dms"))
              (mkdir-p share-qs)
              (copy-recursively (string-append tmp "/dms")
                                (string-append share-qs "/dms")))
            (when (file-exists? (string-append tmp "/docs"))
              (mkdir-p share-doc)
              (copy-recursively (string-append tmp "/docs")
                                share-doc))))))
    (home-page "https://github.com/AvengeMedia/DankMaterialShell")
    (synopsis "Desktop shell for Wayland compositors built with Quickshell and Go")
    (description
     "DMS (Dank Material Shell) is a desktop shell for Wayland compositors
built with Quickshell and Go.  It provides a material-design-inspired shell
experience.  This package repackages the official pre-built binary release.")
    (license license:expat)))
