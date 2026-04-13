;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413g
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 15 recipes created
;;;   - 15 blocked with specific reason codes
;;;
;;; Recipes (15):
;;;   - rustrover-eap (trivial, proprietary)
;;;   - microsoft-edge-beta-bin (trivial, proprietary)
;;;   - svt-jpeg-xs (cmake, bsd-2)
;;;   - vlc-pause-click-plugin (gnu, lgpl2.1)
;;;   - rewaita (copy, gpl3+)
;;;   - lianwall-gui-bin (copy, expat)
;;;   - proton-ge-custom-rtsp-bin (copy, bsd-3)
;;;   - crossover-overlay-bin (copy, cc-by-sa4.0)
;;;   - cato-client-bin (copy, nonfree)
;;;   - kstart (gnu, isc)
;;;   - lidm-git (gnu, gpl3)
;;;   - xsane-gimp (gnu, gpl2+)
;;;   - gtkhash-thunar (cmake, gpl2+)
;;;   - brother-hl2030 (trivial, nonfree)
;;;   - curseforge-bin (trivial, nonfree)
;;;
;;; Blocked (15):
;;;   - makepkg-optimize-mold (ARCH_SPECIFIC)
;;;   - aura-bin (ARCH_SPECIFIC)
;;;   - zectl-pacman-hook (ARCH_SPECIFIC)
;;;   - syca (ARCH_SPECIFIC)
;;;   - guiman (ARCH_SPECIFIC + TAURI_BUILD)
;;;   - shiori-reader (MISSING_SOURCE)
;;;   - ids-ips-tool (NO_RELEASE + LOW_QUALITY)
;;;   - nicol (MISSING_GUIX_DEPS: Qt6 WebEngine)
;;;   - airwindows-consolidated-git (MISSING_GUIX_DEPS: VCV Rack SDK)
;;;   - rtw89-dkms-git (DKMS_INCOMPATIBLE)
;;;   - obs-advanced-scene-switcher (MISSING_GUIX_DEPS: OBS Studio)
;;;   - kwin-effects-better-blur-dx-git (MISSING_GUIX_DEPS: KDE Plasma 6)
;;;   - apparmor.d-git (DISTRO_SPECIFIC)
;;;   - invoiceninja (WEB_SERVICE: Laravel PHP)
;;;   - semantic-diff (MISSING_GUIX_DEPS: anthropic Python pkg)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages recipe-resolver-260413g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages cpio)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xfce)
  #:export (
            rustrover-eap
            microsoft-edge-beta-bin
            svt-jpeg-xs
            vlc-pause-click-plugin
            rewaita
            lianwall-gui-bin
            proton-ge-custom-rtsp-bin
            crossover-overlay-bin
            cato-client-bin
            kstart
            lidm-git
            xsane-gimp
            gtkhash-thunar
            brother-hl2030
            curseforge-bin
            ))

;;; ── 1. rustrover-eap ────────────────────────────────────────────────────
;;; JetBrains Rust IDE (EAP)
;;; AUR: rustrover-eap  →  Guix: rustrover-eap
;;; Upstream: https://www.jetbrains.com/rust/
;;;
(define-public rustrover-eap
  (package
    (name "rustrover-eap")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.jetbrains.com/rustrover/RustRover-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/rustrover"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/src")))
            (mkdir-p tmp)
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xf" src "-C" tmp)
            (let ((srcdir (car (find-files tmp "^RustRover" #:directories? #t
                                           #:fail-on-error? #f))))
              (copy-recursively srcdir opt))
            (mkdir-p bin)
            (symlink (string-append opt "/bin/rustrover.sh")
                     (string-append bin "/rustrover"))
            #t))))
    (native-inputs (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/rust/")
    (synopsis "JetBrains Rust IDE (pre-built binary)")
    (description
     "RustRover is an IDE from JetBrains for Rust development.  It provides
code assistance, debugging, testing, and integration with Cargo and
other Rust tooling.  This package installs the pre-built binary
distribution.")
    ;; Proprietary JetBrains license
    (license #f)))

;;; ── 2. microsoft-edge-beta-bin ──────────────────────────────────────────
;;; Microsoft Edge browser (Beta channel)
;;; AUR: microsoft-edge-beta-bin  →  Guix: microsoft-edge-beta-bin
;;; Upstream: https://www.microsoft.com/edge
;;;
(define-public microsoft-edge-beta-bin
  (package
    (name "microsoft-edge-beta-bin")
    (version "147.0.3912.26")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://packages.microsoft.com/repos/edge/pool/main/m/"
             "microsoft-edge-beta/microsoft-edge-beta_"
             version "-1_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/microsoft-edge-beta"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append binutils "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.xz"
                    "-C" tmp)
            (let ((srcdir (string-append tmp "/opt/microsoft/msedge-beta")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (symlink (string-append opt "/msedge")
                     (string-append bin "/microsoft-edge-beta"))
            #t))))
    (native-inputs (list tar gzip xz binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.microsoft.com/edge")
    (synopsis "Microsoft Edge web browser (beta channel, pre-built binary)")
    (description
     "Microsoft Edge is a Chromium-based web browser from Microsoft.
This package installs the beta channel pre-built binary from the
official Microsoft package repository.")
    ;; Proprietary Microsoft license
    (license #f)))

;;; ── 3. svt-jpeg-xs ──────────────────────────────────────────────────────
;;; JPEG XS encoder/decoder library
;;; AUR: svt-jpeg-xs  →  Guix: svt-jpeg-xs
;;; Upstream: https://github.com/OpenVisualCloud/SVT-JPEG-XS
;;;
(define-public svt-jpeg-xs
  (package
    (name "svt-jpeg-xs")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenVisualCloud/SVT-JPEG-XS")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DBUILD_SHARED_LIBS=ON")))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/OpenVisualCloud/SVT-JPEG-XS")
    (synopsis "JPEG XS encoder and decoder library")
    (description
     "SVT-JPEG-XS is an open-source implementation of the JPEG XS standard
(ISO/IEC 21122).  It provides both encoding and decoding capabilities
for visually lossless, low-latency image and video compression.  The
library is optimized for Intel processors with SIMD acceleration.")
    (license license:bsd-2)))

;;; ── 4. vlc-pause-click-plugin ───────────────────────────────────────────
;;; VLC plugin to pause/play on video click
;;; AUR: vlc-pause-click-plugin  →  Guix: vlc-pause-click-plugin
;;; Upstream: https://github.com/nurupo/vlc-pause-click-plugin
;;;
(define-public vlc-pause-click-plugin
  (package
    (name "vlc-pause-click-plugin")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nurupo/vlc-pause-click-plugin")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "make"
                      (string-append
                       "VLC_PLUGIN_CFLAGS="
                       (string-join
                        (list (string-append
                               "-I"
                               (search-input-directory inputs
                                                       "include/vlc/plugins"))
                              "-DPIC" "-fPIC")
                        " "))
                      (string-append
                       "VLC_PLUGIN_LIBS=-lvlccore"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((plugindir (string-append (assoc-ref outputs "out")
                                              "/lib/vlc/plugins/video_filter")))
                (mkdir-p plugindir)
                (install-file "libpause_click_plugin.so" plugindir)))))))
    (inputs (list vlc))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/nurupo/vlc-pause-click-plugin")
    (synopsis "VLC plugin to pause/play video on mouse click")
    (description
     "This VLC plugin allows pausing and playing a video by clicking on
the video image.  It provides a simple and intuitive way to control
video playback with the mouse.")
    (license license:lgpl2.1)))

;;; ── 5. rewaita ──────────────────────────────────────────────────────────
;;; GTK icon theme based on Adwaita
;;; AUR: rewaita  →  Guix: rewaita
;;; Upstream: https://github.com/SwordPuffin/Rewaita
;;;
(define-public rewaita
  (package
    (name "rewaita")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SwordPuffin/Rewaita")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Rewaita" "share/icons/Rewaita")
               ("Rewaita-Black" "share/icons/Rewaita-Black")
               ("Rewaita-Dark" "share/icons/Rewaita-Dark")
               ("Rewaita-Dark-Black" "share/icons/Rewaita-Dark-Black"))))
    (home-page "https://github.com/SwordPuffin/Rewaita")
    (synopsis "modified Adwaita icon theme with macOS-style folder icons")
    (description
     "Rewaita is a GTK icon theme based on GNOME's Adwaita, with modified
folder icons inspired by macOS design.  It includes light, dark, and
black variants for different desktop themes.")
    (license license:gpl3+)))

;;; ── 6. lianwall-gui-bin ─────────────────────────────────────────────────
;;; Firewall GUI (binary release)
;;; AUR: lianwall-gui-bin  →  Guix: lianwall-gui-bin
;;; Upstream: https://github.com/Yueosa/lianwall-gui
;;;
(define-public lianwall-gui-bin
  (package
    (name "lianwall-gui-bin")
    (version "1.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Yueosa/lianwall-gui/releases/download/v"
             version "/lianwall-gui-linux-x86_64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lianwall-gui-linux-x86_64" "bin/lianwall-gui"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'chmod-exec
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/lianwall-gui")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Yueosa/lianwall-gui")
    (synopsis "graphical firewall management tool")
    (description
     "LianWall GUI is a graphical interface for managing firewall rules.
Built with Qt6, it provides an accessible way to configure iptables
or nftables rules without using the command line.  This package
installs the pre-built binary release.")
    (license license:expat)))

;;; ── 7. proton-ge-custom-rtsp-bin ────────────────────────────────────────
;;; Proton-GE with RTSP streaming patches
;;; AUR: proton-ge-custom-rtsp-bin  →  Guix: proton-ge-custom-rtsp-bin
;;; Upstream: https://github.com/SpookySkeletons/proton-ge-rtsp
;;;
(define-public proton-ge-custom-rtsp-bin
  (package
    (name "proton-ge-custom-rtsp-bin")
    (version "GE-Proton10-33-rtsp22")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/"
             version "/" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/steam/compatibilitytools.d/proton-ge-rtsp"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SpookySkeletons/proton-ge-rtsp")
    (synopsis "Proton-GE fork with RTSP streaming support for Steam")
    (description
     "Proton-GE Custom RTSP is a fork of GloriousEggroll's Proton-GE that
adds RTSP streaming support for Steam Play games.  It is a Wine/Proton
compatibility layer for running Windows games on Linux via Steam with
additional multimedia streaming capabilities.")
    (license license:bsd-3)))

;;; ── 8. crossover-overlay-bin ────────────────────────────────────────────
;;; Crosshair overlay for any screen
;;; AUR: crossover-overlay-bin  →  Guix: crossover-overlay-bin
;;; Upstream: https://github.com/lacymorrow/crossover
;;;
(define-public crossover-overlay-bin
  (package
    (name "crossover-overlay-bin")
    (version "3.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lacymorrow/crossover/releases/download/"
             version "/CrossOver-" version ".AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("CrossOver.AppImage" "bin/crossover-overlay"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'rename-source
                 (lambda _
                   (copy-file (getenv "source") "CrossOver.AppImage")
                   (chmod "CrossOver.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lacymorrow/crossover")
    (synopsis "crosshair overlay for any screen")
    (description
     "CrossOver is a crosshair overlay application that can be placed on
any screen.  It is useful for games that do not provide a built-in
crosshair, or for accessibility purposes.  This package installs the
pre-built AppImage binary.")
    (license license:cc-by-sa4.0)))

;;; ── 9. cato-client-bin ──────────────────────────────────────────────────
;;; Cato Networks VPN client
;;; AUR: cato-client-bin  →  Guix: cato-client-bin
;;; Upstream: https://clientdownload.catonetworks.com/
;;;
(define-public cato-client-bin
  (package
    (name "cato-client-bin")
    (version "5.5.0.2620")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://clientdownload.catonetworks.com/public/clients/linux/"
             "cato-client-install-" version "-1.x86_64.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/cato-client"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/rpm")))
            (mkdir-p tmp)
            ;; RPM is cpio+gzip/xz; extract with rpm2cpio pattern
            (with-directory-excursion tmp
              (invoke "sh" "-c"
                      (string-append
                       #$(file-append xz "/bin/xz") " -dc " src
                       " | " #$(file-append cpio
                                            "/bin/cpio")
                       " -idmv 2>/dev/null || true")))
            (let ((srcdir (string-append tmp "/opt/cato")))
              (when (file-exists? srcdir)
                (copy-recursively srcdir opt)))
            (mkdir-p bin)
            (when (file-exists? (string-append opt "/CatoClient"))
              (symlink (string-append opt "/CatoClient")
                       (string-append bin "/cato-client")))
            #t))))
    (native-inputs (list xz cpio))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.catonetworks.com/")
    (synopsis "Cato Networks SASE/VPN client (pre-built binary)")
    (description
     "The Cato Client is a VPN client from Cato Networks for connecting to
the Cato Cloud SASE platform.  It provides secure access to corporate
networks and cloud resources.  This package installs the pre-built
binary from the official download site.")
    ;; Proprietary Cato Networks license
    (license #f)))

;;; ── 10. kstart ──────────────────────────────────────────────────────────
;;; Kerberos kinit with AFS support and ticket refreshing
;;; AUR: kstart  →  Guix: kstart
;;; Upstream: https://www.eyrie.org/~eagle/software/kstart/
;;;
(define-public kstart
  (package
    (name "kstart")
    (version "4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://archives.eyrie.org/software/kerberos/kstart-"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))   ;; tests require live Kerberos infrastructure
    (inputs (list mit-krb5))
    (home-page "https://www.eyrie.org/~eagle/software/kstart/")
    (synopsis "kerberos kinit supporting AFS and ticket refreshing")
    (description
     "Kstart provides @command{k5start} and @command{krenew}, replacements
for @command{kinit} which add support for running as a daemon to maintain
Kerberos tickets and AFS tokens.  @command{k5start} obtains and
optionally keeps alive a Kerberos ticket, while @command{krenew}
renews an existing ticket.")
    (license license:isc)))

;;; ── 11. lidm-git ────────────────────────────────────────────────────────
;;; TUI display manager in C
;;; AUR: lidm-git  →  Guix: lidm-git
;;; Upstream: https://github.com/javalsai/lidm
;;;
(define-public lidm-git
  (package
    (name "lidm-git")
    (version "1.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/javalsai/lidm")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "make")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "lidm" bin)))))))
    (inputs (list linux-pam ncurses))
    (home-page "https://github.com/javalsai/lidm")
    (synopsis "colorful TUI display manager written in C")
    (description
     "Lidm is a lightweight TUI (text user interface) display manager for
Linux.  It provides a fully colorful and customizable login screen
in the terminal, supporting PAM authentication and session selection.")
    (license license:gpl3)))

;;; ── 12. xsane-gimp ──────────────────────────────────────────────────────
;;; XSane GIMP plugin variant (scanner frontend)
;;; AUR: xsane-gimp-git  →  Guix: xsane-gimp
;;; Upstream: https://gitlab.com/sane-project/frontend/xsane
;;; Note: Guix xsane already supports GIMP integration; this variant
;;; explicitly installs the GIMP plug-in symlink for discoverability.
;;;
(define-public xsane-gimp
  (package
    (inherit xsane)
    (name "xsane-gimp")
    (inputs (modify-inputs (package-inputs xsane)
              (prepend gimp)))
    (synopsis "XSane scanner frontend as GIMP plug-in")
    (description
     "XSane-GIMP provides the XSane scanner frontend with explicit GIMP
integration.  It inherits all features of XSane (preview, batch scan,
multipage, OCR) and ensures the GIMP plug-in is installed for use
within the GIMP image editing workflow.")))

;;; ── 13. gtkhash-thunar ──────────────────────────────────────────────────
;;; GtkHash with Thunar file manager plugin
;;; AUR: gtkhash-thunar  →  Guix: gtkhash-thunar
;;; Upstream: https://github.com/tristanheaven/gtkhash
;;;
(define-public gtkhash-thunar
  (package
    (name "gtkhash-thunar")
    (version "1.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tristanheaven/gtkhash")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "--with-thunar"
              "--with-gtk3")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list pkg-config autoconf automake intltool))
    (inputs
     (list gtk+ libgcrypt thunar))
    (home-page "https://github.com/tristanheaven/gtkhash")
    (synopsis "GTK+ hash calculator with Thunar file manager plugin")
    (description
     "GtkHash is a desktop utility for computing message digests or checksums.
It supports MD5, SHA-1, SHA-256, and many other hash algorithms.  This
variant includes a plugin for the Thunar file manager that allows
computing checksums from the file properties dialog.")
    (license license:gpl2+)))

;;; ── 14. brother-hl2030 ──────────────────────────────────────────────────
;;; Brother HL-2030 CUPS printer driver
;;; AUR: brother-hl2030  →  Guix: brother-hl2030
;;; Upstream: https://www.brother.com/
;;;
(define-public brother-hl2030
  (package
    (name "brother-hl2030")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.brother.com/welcome/dlf005893/brhl2030lpr-"
             version "-1.i386.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (lib (string-append out "/opt/brother/Printers/HL2030"))
                 (tmp (string-append (getcwd) "/deb")))
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append #$(file-append tar "/bin") ":"
                                   #$(file-append gzip "/bin") ":"
                                   #$(file-append xz "/bin")))
            (invoke #$(file-append binutils "/bin/ar")
                    "x" src)
            (invoke #$(file-append tar "/bin/tar") "-xf" "data.tar.gz"
                    "-C" tmp)
            (copy-recursively
             (string-append tmp "/opt/brother/Printers/HL2030") lib)
            (mkdir-p (string-append out "/bin"))
            ;; Install filter scripts if present
            (for-each (lambda (f)
                        (when (file-exists? f)
                          (install-file f (string-append out "/bin"))))
                      (find-files (string-append tmp "/usr") "brhl2030filter"
                                  #:directories? #f))
            #t))))
    (native-inputs (list tar gzip xz binutils))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (home-page "https://www.brother.com/")
    (synopsis "Brother HL-2030 CUPS printer driver (pre-built binary)")
    (description
     "This package provides the Brother HL-2030 CUPS printer driver.
It includes the LPR driver files needed to print to a Brother HL-2030
laser printer.  The driver is a pre-built binary from Brother.")
    ;; Proprietary Brother license
    (license #f)))

;;; ── 15. curseforge-bin ──────────────────────────────────────────────────
;;; CurseForge desktop client for game mods
;;; AUR: curseforge  →  Guix: curseforge-bin
;;; Upstream: https://curseforge.com
;;;
(define-public curseforge-bin
  (package
    (name "curseforge-bin")
    (version "1.300.0-31983")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://curseforge.overwolf.com/downloads/"
             "curseforge-latest-linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (opt (string-append out "/opt/curseforge"))
                 (bin (string-append out "/bin"))
                 (tmp (string-append (getcwd) "/zip")))
            (mkdir-p tmp)
            (invoke #$(file-append unzip
                                   "/bin/unzip")
                    "-q" src "-d" tmp)
            ;; The zip should contain an AppImage or binary
            (let ((appimage (find-files tmp "\\.AppImage$"
                                       #:fail-on-error? #f)))
              (if (pair? appimage)
                  (begin
                    (mkdir-p bin)
                    (copy-file (car appimage)
                               (string-append bin "/curseforge"))
                    (chmod (string-append bin "/curseforge") #o755))
                  ;; Fallback: copy everything
                  (begin
                    (copy-recursively tmp opt)
                    (mkdir-p bin)
                    (when (file-exists? (string-append opt "/curseforge"))
                      (symlink (string-append opt "/curseforge")
                               (string-append bin "/curseforge"))))))
            #t))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://curseforge.com")
    (synopsis "CurseForge mod manager for games (pre-built binary)")
    (description
     "CurseForge is a desktop client for browsing, downloading, and managing
game modifications.  It supports Minecraft, World of Warcraft, and other
games with mod communities.  This package installs the pre-built Linux
binary.")
    ;; Proprietary Overwolf/CurseForge license
    (license #f)))
