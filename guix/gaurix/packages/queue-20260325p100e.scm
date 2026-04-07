;;; Queue drain 2026-03-25 pass-e (packages 5446-5525, 80 new entries).
;;; Initially all 80 were NEEDS_RECIPE_DESIGN stubs; selected entries are now packaged.
;;; Note: entries 5348/5353/5363/5426/5430-5445 (20 items) were already stubbed
;;;       in queue-20260325p100d.scm and are marked BLOCKED in the org queue.
(define-module (gaurix packages queue-20260325p100e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages radio)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages synergy)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (
            linux-clear-cjktty-zfs-headers
            linux-clear-cjktty-zfs
            clightd
            libmodule
            mas
            wrkflw-bin
            iwmenu-bin
            pwmenu-bin
            bzmenu-bin
            claude-code-seccomp
            ferris-scan-bin
            gram-editor-bin
            bapctools-git
            sabiql-bin
            podserv-b-git
            netwatch-tui
            synergy3-bin
            q5k-usb-udev
            qpdf-zopfli
            swhook
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin-doc
            libjxl-noglycin
            op-cache-git
            console2svg-bin
            szsol-rs
            arch-remaster
            pixora-icons-git
            udiskr
            comp-scan-bin
            tilem-gtk3-git
            r47-bin
            docx-you-want
            c47-bin
            wo-bin
            cliamp
            oken-bin
            lazytail-bin
            funzzy-bin
            framework-control-bin
            baremetal-compiler-rt
            dpibreak
            lobster
            dpibreak-git
            uac-polkit-agent-git
            mezzotone-bin
            ipmctl-git
            python-aiohttp-jinja2
            pricehist
            fish-session
            workz-bin
            omp-manager-bin
            tmux-plugin-panel-bin
            spinwheel-pipewire
            compendium
            pandoc-crossref-bin
            boomer-git
            mkinitcpio-firmware
            qxmledit
            tufw-git
            adbfs-rootless-git
            dafny-bin
            weylus-bin
            zerx-lab-fluxdown-bin
            bililive-recorder-bin
            lenovo-print-driver-lj2400-m7400-bin
            nodejs-knit
            fw-fanctrl-rs-git
            aerothemeplasma-desktop-x11-git
            aeroshell-workspace-git
            aeroshell-libplasma-git
            aeroshell-kwin-components-git
            keks-meet-server
            jellything-git
            hurrycurry-server
            gnix
            mkbrr-gui-bin
            wireview-linux
            chough-bin
            ))

;;; ── NEEDS_RECIPE_DESIGN stubs ────────────────────────────────────────

(define-public linux-clear-cjktty-zfs-headers
  ;; AUR linux-clear-cjktty-zfs-headers: Clear Linux kernel +zfs+cjktty headers; v6.18.1-1.
  ;; BLOCKED: No standalone upstream for *-headers (AUR repo is empty); headers are split out
  ;; from linux-clear-cjktty-zfs PKGBUILD, which carries a large custom patch stack and
  ;; OpenZFS builtin integration that is not yet ported to Guix linux-build-system here.
  (package (inherit zoxide) (name "linux-clear-cjktty-zfs-headers")))

(define-public linux-clear-cjktty-zfs
  ;; AUR linux-clear-cjktty-zfs: Clear Linux kernel +zfs+cjktty; v6.18.1-1.
  ;; BLOCKED: Upstream recipe requires a large Tachyon patch series plus OpenZFS builtin
  ;; integration workflow not yet translated to a reproducible Guix kernel recipe in this pass.
  (package (inherit zoxide) (name "linux-clear-cjktty-zfs")))

(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FedeDP/Clightd/archive/" version
                           ".tar.gz"))
       (sha256
        (base32 "0m1h1xjvarj6n6b06v9qf45w3dmj662ls79vqac1qwpbbrdqdbkn"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DUDEV_RULES_INSTALL_DIR=" #$output
                              "/lib/udev/rules.d")
              (string-append "-DSYSTEMD_SERVICE_DIR=" #$output
                              "/lib/systemd/system")
              (string-append "-DDBUS_CONFIG_DIR=" #$output
                              "/etc/dbus-1/system.d")
              (string-append "-DMODULE_LOAD_DIR=" #$output
                              "/lib/modules-load.d")
              "-DENABLE_GAMMA=ON"
              "-DENABLE_DPMS=ON"
              "-DENABLE_SCREEN=ON"
              "-DENABLE_YOCTOLIGHT=OFF")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-install-paths
            (lambda _
              (let ((conf "src/modules/modules.conf"))
                (when (file-exists? conf)
                  (substitute* conf
                    (("/usr/lib/systemd/system")
                     (string-append #$output "/lib/systemd/system")))))
              (substitute* "CMakeLists.txt"
                (("pkg_get_variable\\(SYSTEM_BUS_DIR dbus-1 system_bus_services_dir\\)")
                 (string-append
                  "set(SYSTEM_BUS_DIR \"" #$output
                  "/share/dbus-1/system-services\")"))
                (("pkg_get_variable\\(POLKIT_ACTION_DIR polkit-gobject-1 actiondir\\)")
                 (string-append
                  "set(POLKIT_ACTION_DIR \"" #$output
                  "/share/polkit-1/actions\")")))
              #t)))))
    (native-inputs (list pkg-config))
    (inputs
     (list dbus
           ddcutil
           elogind
           eudev
           libdrm
           libiio
           libjpeg-turbo
           libmodule
           libusb
           libx11
           libxext
           libxrandr
           polkit
           wayland))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "D-Bus daemon for brightness and webcam frame capture")
    (description
     "clightd provides a D-Bus interface to control display brightness, gamma,
DPMS, and related ambient-light features for user sessions.")
    (license license:gpl3+)))

(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FedeDP/libmodule/archive/" version
                           ".tar.gz"))
       (sha256
        (base32 "1zpp46jly4sqb7gbffxajv72i6rh60cacc7sfrsr65mym9liw43j"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "C library for building modular Linux projects")
    (description
     "libmodule is a C helper library that provides reusable modules and
patterns for modular Linux applications.")
    (license license:expat)))

(define-public mas
  ;; AUR mas is a renamed distribution of the ASL macro cross-assembler.
  (package
    (inherit asl)
    (name "mas")))

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bahdotsh/wrkflw/releases/download/v" version
             "/wrkflw-v" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin (string-append out "/bin")))
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src)
            (mkdir-p bin)
            (install-file "wrkflw" bin)
            (chmod (string-append bin "/wrkflw") #o755)
            #t))))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "Validate and run GitHub Actions workflows locally")
    (description
     "wrkflw validates and executes GitHub Actions workflows in a local
environment.  This package repackages the upstream prebuilt Linux binary.")
    (license license:expat)))

(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/iwmenu/releases/download/v" version
             "/iwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/iwmenu"))
            (chmod (string-append bin "/iwmenu") #o755)
            #t))))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "Launcher-driven Wi-Fi manager for Linux")
    (description
     "iwmenu is a lightweight launcher-driven interface for managing Wi-Fi
connections on Linux.  This package repackages the upstream prebuilt binary.")
    (license license:gpl3)))

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/pwmenu/releases/download/v" version
             "/pwmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (inputs (list pipewire))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/pwmenu"))
            (chmod (string-append bin "/pwmenu") #o755)
            #t))))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "Launcher-driven audio manager for Linux")
    (description
     "pwmenu is a launcher-driven audio manager for Linux systems using
PipeWire.  This package repackages the upstream prebuilt binary.")
    (license license:gpl3)))

(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/e-tho/bzmenu/releases/download/v" version
             "/bzmenu-x86_64-linux-gnu"))
       (sha256
        (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (inputs (list dbus elogind))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/bzmenu"))
            (chmod (string-append bin "/bzmenu") #o755)
            #t))))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "Launcher-driven Bluetooth manager for Linux")
    (description
     "bzmenu is a launcher-driven Bluetooth manager for Linux.  This package
repackages the upstream prebuilt binary.")
    (license license:gpl3)))

(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://raw.githubusercontent.com/anthropic-experimental/sandbox-runtime/"
         "4fad8fa35db3f09958db1df401b30bd00402b611/vendor/seccomp/x64/"
         "apply-seccomp"))
       (sha256
        (base32 "1zcq1gc1p9nqyda8g9fi3xrfxapqy3j238sxhg4xprwp6yv4c0z7"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list
      `("unix-block.bpf"
        ,(origin
           (method url-fetch)
           (uri
            (string-append
             "https://raw.githubusercontent.com/anthropic-experimental/sandbox-runtime/"
             "4fad8fa35db3f09958db1df401b30bd00402b611/vendor/seccomp/x64/"
             "unix-block.bpf"))
           (sha256
            (base32 "01w8hr79mk93f3p8xavhsd2m1k9q76n9pcrsn56r6rs2smh5klf4"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (apply-seccomp (assoc-ref %build-inputs "source"))
                 (unix-block (assoc-ref %build-inputs "unix-block.bpf"))
                 (libdir (string-append out "/lib/claude-code-seccomp")))
            (mkdir-p libdir)
            (copy-file apply-seccomp (string-append libdir "/apply-seccomp"))
            (chmod (string-append libdir "/apply-seccomp") #o755)
            (copy-file unix-block (string-append libdir "/unix-block.bpf"))
            #t))))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "Seccomp sandbox runtime payloads for Claude Code")
    (description
     "claude-code-seccomp installs the prebuilt apply-seccomp helper binary
and unix-block seccomp BPF payload used by Claude Code sandboxing.")
    (license license:asl2.0)))

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                           version "/ferris-scan-tui-v" version "-linux"))
       (sha256
        (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs
     (list
      (list "ferris-scan-gui"
            (origin
              (method url-fetch)
              (uri
               (string-append
                "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                version "/ferris-scan-gui-v" version "-linux"))
              (sha256
               (base32 "1fdjhgz0gzlad89jggq99m4bfyi7a3mssp5fdnkm9xkinar61xys"))))))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src-tui (assoc-ref %build-inputs "source"))
                 (src-gui (assoc-ref %build-inputs "ferris-scan-gui")))
            (mkdir-p bin)
            (copy-file src-tui (string-append bin "/ferris-scan-tui"))
            (copy-file src-gui (string-append bin "/ferris-scan-gui"))
            (chmod (string-append bin "/ferris-scan-tui") #o755)
            (chmod (string-append bin "/ferris-scan-gui") #o755)
            (symlink (string-append out "/bin/ferris-scan-tui")
                     (string-append bin "/ferris-scan"))
            #t))))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "Lightweight file scanner binaries")
    (description
     "Ferris Scan is a lightweight file scanner written in Rust.  This
package installs the upstream pre-built Linux TUI and GUI binaries from the
official release artifacts.")
    (license license:expat)))

(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/GramEditor/gram/releases/download/"
                           version "/gram-linux-x86_64-" version ".tar.gz"))
       (sha256
        (base32 "044sivzmka5chgmjw32y8vmxfplnigav654pxvfwbfwdvhhxf79c"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin-out (string-append out "/bin"))
                 (lib-out (string-append out "/lib/gram"))
                 (apps-out (string-append out "/share/applications"))
                 (icons-out (string-append out "/share/icons")))
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xvf" src)
            (mkdir-p bin-out)
            (mkdir-p lib-out)
            (mkdir-p apps-out)
            (install-file "gram.app/bin/gram" bin-out)
            (install-file "gram.app/libexec/gram-editor" lib-out)
            (chmod (string-append bin-out "/gram") #o755)
            (chmod (string-append lib-out "/gram-editor") #o755)
            (install-file "gram.app/share/applications/gram.desktop" apps-out)
            (copy-recursively "gram.app/share/icons" icons-out)
            #t))))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "Code editor binary distribution from Gram Editor")
    (description
     "Gram is a code editor.  This package repackages the upstream Linux
x86_64 binary release published by the Gram Editor project.")
    (license (list license:gpl3+ license:agpl3+ license:asl2.0))))

(define-public bapctools-git
  (package
    (name "bapctools-git")
    (version "r1310.16e23ee")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/RagnarGrootKoerkamp/BAPCtools/archive/"
             "16e23ee1f866f17ea71756b77897230e73b948e3.tar.gz"))
       (sha256
        (base32 "0jr44rw5gnhhpbc7cczj8rg547bali7qmnym42iwk61vppd9da59"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (propagated-inputs
     (list python
           python-argcomplete
           python-colorama
           python-pyyaml
           python-requests
           python-ruamel.yaml))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (dir "BAPCtools-16e23ee1f866f17ea71756b77897230e73b948e3")
                 (share-dir (string-append out "/share/bapctools"))
                 (bin-dir (string-append out "/bin")))
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xvf" src)
            (copy-recursively dir share-dir)
            (mkdir-p bin-dir)
            (symlink (string-append share-dir "/bin/tools.py")
                     (string-append bin-dir "/bt"))
            (symlink (string-append share-dir "/bin/tools.py")
                     (string-append bin-dir "/bapctools"))
            #t))))
    (home-page "https://github.com/RagnarGrootKoerkamp/BAPCtools")
    (synopsis "Toolkit for ICPC-style programming contest problem development")
    (description
     "BAPCtools provides utilities for creating, validating, and testing
ICPC-style programming contest problems.  This package installs a pinned
snapshot of the upstream Git repository.")
    (license license:gpl3+)))

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/riii111/sabiql/releases/download/v" version
             "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (invoke #$(file-append tar "/bin/tar")
                    "--use-compress-program" #$(file-append gzip "/bin/gzip")
                    "-xvf" src)
            (mkdir-p bin)
            (install-file "sabiql" bin)
            (chmod (string-append bin "/sabiql") #o755)
            #t))))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "Fast driver-less PostgreSQL terminal UI")
    (description
     "Sabiql is a terminal user interface for browsing, querying, and editing
PostgreSQL databases.  This package repackages the upstream pre-built Linux
x86_64 binary release.")
    (license license:expat)))

(define-public podserv-b-git
  (package
    (name "podserv-b-git")
    (version "0.1.2.r0.g536e372")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/l5yth/podserv-b/releases/download/v0.1.2/podserv-b")
       (sha256
        (base32 "1hdss5h1wfbbb51hsfvxky5s4yly50sgp5sfkf6is5wvz3dxvx99"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/podserv-b"))
            (chmod (string-append bin "/podserv-b") #o755)
            #t))))
    (home-page "https://github.com/l5yth/podserv-b")
    (synopsis "Minimalist podcast media HTTP server")
    (description
     "Podserv-b is a minimalist podcast server for serving media files over
HTTP.  This package installs the upstream pre-built Linux binary and keeps the
AUR compatibility name podserv-b-git.")
    (license license:asl2.0)))

(define-public netwatch-tui
  ;; AUR netwatch-tui: Real-time network diagnostics TUI; v0.8.0-1; 1 vote.
  ;; Source: https://github.com/matthart1983/netwatch
  ;; BLOCKED after 3 approaches in this pass:
  ;; 1) `guix import crate netwatch` fails: missing module (semver ranges).
  ;; 2) Binary route unavailable: upstream release v0.8.0 ships zero assets.
  ;; 3) Manual cargo-build-system skeleton fails offline: missing vendored crate
  ;;    `atomic-waker` without full cargo-inputs graph.
  (package (inherit zoxide) (name "netwatch-tui")))

(define-public synergy3-bin
  (package
    (inherit synergy)
    (name "synergy3-bin")
    (synopsis "Compatibility alias for the Synergy keyboard/mouse sharing tool")
    (description
     "This package provides the AUR-style compatibility name
@code{synergy3-bin} by re-exporting Guix's @code{synergy} package.")))

(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gist.githubusercontent.com/hmtheboy154/"
             "21c0a25ff025667981a35b6656f7da69/raw/"
             "8242cefe13667ddcbe8291b5f34bb523c3142eed/99-qudelix.rules"))
       (sha256
        (base32 "1lm47kh7gbdphfqszdx1zhd47h87f29k8b11w27swq0hca29255d"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (rules-dir (string-append out "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (copy-file src (string-append rules-dir "/99-qudelix.rules"))
            #t))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "Udev rules for Qudelix-5K USB mode")
    (description
     "This package installs udev rules for Qudelix-5K USB devices so the
device is accessible with the expected permissions on GNU/Linux systems.")
    (license license:bsd-3)))

(define-public qpdf-zopfli
  (package
    (inherit qpdf)
    (name "qpdf-zopfli")
    (inputs
     (modify-inputs (package-inputs qpdf)
       (prepend zopfli)))
    (arguments
     (substitute-keyword-arguments (package-arguments qpdf)
       ((#:configure-flags flags #~'())
        #~(append #$flags
                  (list "-DZOPFLI=ON")))))
    (synopsis "QPDF with Zopfli compression support")
    (description
     "qpdf-zopfli is a qpdf variant built with Zopfli compression support
enabled.")))


(define-public swhook
  ;; AUR swhook: Minimalistic webhook server; v0.0.3-1; 1 vote.
  ;; Source: https://github.com/AndyLocks/swhook
  ;; BLOCKED: upstream ships source-only Rust releases (no prebuilt binaries)
  ;; and packaging from source requires a non-trivial cargo dependency graph.
  (package (inherit zoxide) (name "swhook")))

(define-public libavif-noglycin
  ;; AUR libavif-noglycin: libavif for gdk-pixbuf2-noglycin variant; v1.3.0-5; 1 vote.
  ;; Maps to Guix libavif (gnu/packages/image.scm).
  (package
    (inherit libavif)
    (name "libavif-noglycin")
    (synopsis "Compatibility package name for libavif")
    (description
     "Compatibility package that provides @code{libavif} under the AUR-style
package name @code{libavif-noglycin}.")))

(define-public libheif-noglycin
  ;; AUR libheif-noglycin: libheif for gdk-pixbuf2-noglycin variant; v1.21.2-2; 1 vote.
  ;; Maps to Guix libheif (gnu/packages/image.scm).
  (package
    (inherit libheif)
    (name "libheif-noglycin")
    (synopsis "Compatibility package name for libheif")
    (description
     "Compatibility package that provides @code{libheif} under the AUR-style
package name @code{libheif-noglycin}.")))

(define-public libjxl-noglycin
  ;; AUR libjxl-noglycin: JPEG XL for gdk-pixbuf2-noglycin variant; v0.11.2-2; 1 vote.
  ;; Maps to Guix libjxl (gnu/packages/image.scm).
  (package
    (inherit libjxl)
    (name "libjxl-noglycin")
    (synopsis "Compatibility package name for libjxl")
    (description
     "Compatibility package that provides @code{libjxl} under the AUR-style
package name @code{libjxl-noglycin}.")))

(define-public libjxl-noglycin-doc
  ;; AUR libjxl-noglycin-doc: JPEG XL docs variant for gdk-pixbuf2-noglycin; v0.11.2-2.
  ;; Guix does not split libjxl docs into a separate output package.
  (package
    (inherit libjxl-noglycin)
    (name "libjxl-noglycin-doc")
    (synopsis "Compatibility package name for libjxl documentation variant")
    (description
     "Compatibility package that provides @code{libjxl} under the AUR-style
package name @code{libjxl-noglycin-doc}.  Guix does not split libjxl
documentation into a standalone docs package.")))

(define-public op-cache-git
  ;; AUR op-cache-git: Caching proxy for 1Password CLI op read; v0-1; 1 vote.
  ;; Source: https://github.com/crmne/op-cache
  ;; BLOCKED: upstream is an unpublished Rust git branch with no release assets;
  ;; packaging from source requires a generated cargo dependency graph.
  (package (inherit zoxide) (name "op-cache-git")))

(define-public console2svg-bin
  ;; AUR console2svg-bin: Convert terminal output to SVG images (binary); v0.6.5-1.
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/arika0093/console2svg/releases/download/v"
         version
         "/console2svg-linux-x64"))
       (sha256
        (base32 "0cwbq60zw4dx5gg2xkd5qny22yg9cjkyfrcnznl4rmkicxas8mal"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin (string-append out "/bin"))
                 (target (string-append bin "/console2svg")))
            (mkdir-p bin)
            (copy-file src target)
            (chmod target #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "Convert terminal output to SVG")
    (description
     "Console2svg converts terminal output streams into SVG images suitable
for documentation and sharing.")
    (license license:asl2.0)))

(define-public szsol-rs
  ;; AUR szsol-rs: Solitaire card game from SHENZHEN I/O with TUI; v1.0.1-1.
  (package
    (name "szsol-rs")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/ghoker143/szsol-rs/releases/download/v"
         version
         "/szsol-rs-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "1mdmrlzw9w5sslrqmijk36aid19rhzv3x60fbj394ykixi1v6g5a"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (bin (string-append out "/bin"))
                 (doc (string-append out "/share/doc/szsol-rs"))
                 (licenses (string-append out "/share/licenses/szsol-rs"))
                 (extract-dir "szsol-rs-x86_64-unknown-linux-gnu"))
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" src)
            (mkdir-p bin)
            (install-file (string-append extract-dir "/szsol-rs") bin)
            (chmod (string-append bin "/szsol-rs") #o755)
            (mkdir-p doc)
            (install-file (string-append extract-dir "/README.MD") doc)
            (mkdir-p licenses)
            (install-file (string-append extract-dir "/LICENSE") licenses)))))
    (home-page "https://github.com/ghoker143/szsol-rs")
    (synopsis "Solitaire card game from SHENZHEN I/O")
    (description
     "Szsol-rs is a terminal-based solitaire card game inspired by
SHENZHEN I/O.")
    (license license:expat)))

(define-public arch-remaster
  ;; AUR arch-remaster: Tools for remastering Arch Linux live systems; v26.02.1-1.
  (package
    (name "arch-remaster")
    (version "26.02.1")
    (source
     (origin
       (method url-fetch)
       (uri
        "https://github.com/AdrianTM/arch-remaster/archive/refs/tags/26.02.1.tar.gz")
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11xmq1vygbnflwzankxmpdvdwjpdamx892188d7njark92dp47jy"))))
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
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (gzip (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin"))
                 (man1-dir (string-append out "/share/man/man1"))
                 (work (string-append (getcwd) "/work"))
                 (top (string-append work "/arch-remaster-26.02.1"))
                 (bash (string-append #$bash-minimal "/bin/bash")))
            (mkdir-p work)
            (invoke tar (string-append "--use-compress-program=" gzip) "-xf" src "-C" work)
            (mkdir-p bin-dir)
            (install-file (string-append top "/live-remaster") bin-dir)
            (install-file (string-append top "/update-cow-space") bin-dir)
            (for-each
             (lambda (script)
               (chmod script #o755)
               (substitute* script
                 (("^#!/bin/bash")
                  (string-append "#!" bash))))
             (list (string-append bin-dir "/live-remaster")
                   (string-append bin-dir "/update-cow-space")))
            (mkdir-p man1-dir)
            (install-file (string-append top "/live-remaster.1") man1-dir)
            (install-file (string-append top "/update-cow-space.1") man1-dir)))))
    (home-page "https://github.com/AdrianTM/arch-remaster")
    (synopsis "Tools for remastering Arch Linux live systems")
    (description
     "arch-remaster provides shell tools to remaster Arch Linux live systems
and to update live USB copy-on-write boot parameters.")
    (license license:gpl3+)))

(define-public pixora-icons-git
  ;; AUR pixora-icons-git: 16-bit pixel icon theme for Linux desktops (git); r264.gf5604c1-1; 1 vote.
  ;; Source: https://github.com/tsora1603/pixora-icons
  ;; NEEDS_RECIPE_DESIGN: trivial icon theme install; pin git commit.
  ;; Next: pin git rev, compute sha256, draft trivial icon theme install.
  (package (inherit zoxide) (name "pixora-icons-git")))

(define-public udiskr
  ;; AUR udiskr: Lightweight alternative to udiskie; v0.1.1-1; 1 vote.
  ;; Source: https://github.com/uriib/udiskr
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, udisks2.
  ;; Next: fetch udiskr v0.1.1 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "udiskr")))

(define-public comp-scan-bin
  ;; AUR comp-scan-bin: Local AI agent system scanner (binary); v0.1.0-1; 1 vote.
  ;; Source: https://github.com/vvk147/comp-scan
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch comp-scan v0.1.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "comp-scan-bin")))

(define-public tilem-gtk3-git
  ;; AUR tilem-gtk3-git: TI calculator emulator (GTK3 fork); r7.e36102e-1; 1 vote.
  ;; Source: https://github.com/kuba160/tilem-gtk3
  ;; NEEDS_RECIPE_DESIGN: cmake/autotools C+GTK3 recipe; deps: gtk3, glib, SDL.
  ;; Next: pin git rev, compute sha256, draft cmake C+GTK3 recipe.
  (package (inherit zoxide) (name "tilem-gtk3-git")))

(define-public r47-bin
  ;; AUR r47-bin: R47 pocket calculator emulator (binary); v00.109.03.01b1-1; 1 vote.
  ;; Source: https://47calc.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary from 47calc.com.
  ;; Next: fetch R47 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "r47-bin")))

(define-public docx-you-want
  ;; AUR docx-you-want: Unusual PDF-to-DOCX converter; v0.1.2-1; 1 vote.
  ;; Source: https://github.com/MikeWalrus/docx-you-want
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, poppler or pdfium.
  ;; Next: fetch docx-you-want v0.1.2 source, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "docx-you-want")))

(define-public c47-bin
  ;; AUR c47-bin: C47 pocket calculator emulator (binary); v00.109.03.01b1-1; 1 vote.
  ;; Source: https://47calc.com (proprietary)
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; proprietary; fetch Linux binary from 47calc.com.
  ;; Next: fetch C47 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "c47-bin")))

(define-public wo-bin
  ;; AUR wo-bin: Workspace shell manager (binary); v1.0.0-1; 1 vote.
  ;; Source: https://github.com/antham/wo
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Go binary; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch wo v1.0.0 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "wo-bin")))

(define-public cliamp
  ;; AUR cliamp: Retro terminal music player inspired by Winamp 2.x (source); v1.27.2-1; 1 vote.
  ;; Source: https://github.com/bjarneo/cliamp
  ;; NEEDS_RECIPE_DESIGN: node.js/npm recipe; deps: node, npm, various audio libs.
  ;; Next: fetch cliamp v1.27.2 from npm/GitHub, compute sha256, draft node recipe.
  (package (inherit zoxide) (name "cliamp")))

(define-public oken-bin
  ;; AUR oken-bin: Smarter SSH CLI with fuzzy host picker (binary); v0.3.8-1; 1 vote.
  ;; Source: https://github.com/linkwithjoydeep/oken
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; fetch Linux amd64 binary from GitHub releases.
  ;; Next: fetch oken v0.3.8 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "oken-bin")))

(define-public uac-polkit-agent-git
  ;; AUR uac-polkit-agent-git: UAC-style Polkit authenticator for AeroShell; r30f6179-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/uac-polkit-agent
  ;; NEEDS_RECIPE_DESIGN: cmake Qt/KDE recipe; deps: polkit, KDE Plasma, AeroShell.
  ;; Next: pin git commit, compute sha256, draft cmake KDE recipe.
  (package (inherit zoxide) (name "uac-polkit-agent-git")))

(define-public ipmctl-git
  ;; AUR ipmctl-git: Intel Optane DC persistent memory management utility (git); 1 vote.
  ;; Source: https://github.com/intel/ipmctl
  ;; NEEDS_RECIPE_DESIGN: cmake C recipe; deps: libsafec, libndctl, ndctl.
  ;; Next: pin git rev, compute sha256, draft cmake recipe with ndctl deps.
  (package (inherit zoxide) (name "ipmctl-git")))

(define-public boomer-git
  ;; AUR boomer-git: Zoomer application for Linux (git); r286.cc0f531-1; 1 vote.
  ;; Source: https://github.com/tsoding/boomer
  ;; NEEDS_RECIPE_DESIGN: nim recipe; deps: nim, OpenGL, X11.
  ;; Next: pin git rev, compute sha256, draft nim build recipe.
  (package (inherit zoxide) (name "boomer-git")))

(define-public tufw-git
  ;; AUR tufw-git: Terminal UI for ufw firewall manager (git); v0.2.7-2; 1 vote.
  ;; Source: https://github.com/peltho/tufw
  ;; NEEDS_RECIPE_DESIGN: Go recipe; deps: go, ufw.
  ;; Next: pin git commit for v0.2.7, compute sha256, draft go-build-system recipe.
  (package (inherit zoxide) (name "tufw-git")))

(define-public zerx-lab-fluxdown-bin
  ;; AUR zerx-lab-fluxdown-bin: FluxDown multi-protocol download manager (binary); v0.1.31-1; 1 vote.
  ;; Source: https://fluxdown.zerx.dev
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Rust binary; fetch Linux amd64 binary from releases.
  ;; Next: fetch FluxDown v0.1.31 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "zerx-lab-fluxdown-bin")))

(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.17.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Bililive/BililiveRecorder/releases/download/v"
             version
             "/BililiveRecorder-CLI-linux-x64.zip"))
       (sha256
        (base32 "1lw4i01zjpnglrv6sbz3q357mjfap1z2218pr0r7lx7m5qml21dw"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list unzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (unzip (search-input-file %build-inputs "/bin/unzip"))
                 (work (string-append (getcwd) "/unpack"))
                 (lib (string-append out "/lib/bililive-recorder"))
                 (bin (string-append out "/bin")))
            (mkdir-p work)
            (invoke unzip "-q" src "-d" work)
            (mkdir-p lib)
            (copy-recursively work lib)
            (mkdir-p bin)
            (symlink (string-append lib "/BililiveRecorder.Cli")
                     (string-append bin "/BililiveRecorder.Cli"))
            #t))))
    (home-page "https://github.com/Bililive/BililiveRecorder")
    (synopsis "Bilibili live stream recorder")
    (description
     "Bililive Recorder captures and stores livestreams from Bilibili.  This
package repackages the upstream x86_64 CLI binary release.")
    (license license:gpl3)))

(define-public lenovo-print-driver-lj2400-m7400-bin
  (package
    (name "lenovo-print-driver-lj2400-m7400-bin")
    (version "5.0.3")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://aur.archlinux.org/cgit/aur.git/plain/"
         "drive-service_signed_com.lenovo.lenovoprints_5.0.3-2_amd64.deb"
         "?h=lenovo-print-driver-lj2400-m7400-bin&id="
         "2ea87abde555df0367b9453b34e4885223bc7790"))
       (file-name "lenovo-print-driver-lj2400-m7400-bin-5.0.3.deb")
       (sha256
        (base32 "13wsmva0frgmg1naimik9majn5mg75z8vbzj6j7i2lqs063l5nhp"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list binutils tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (driver-root (string-append out "/opt/lenovo/com.lenovo.lenovoprints"))
                 (lpd-root (string-append driver-root "/bin/lpd"))
                 (license-dir (string-append out "/share/licenses/lenovo-print-driver-lj2400-m7400-bin"))
                 (cups-model-dir (string-append out "/share/cups/model"))
                 (cups-filter-dir (string-append out "/lib/cups/filter"))
                 (bin-dir (string-append out "/bin"))
                 (models '("LJ2405D" "LJ2605D" "LJ2405" "LJ2400Pro" "M7405D"
                           "M7605D" "M7400Pro" "M7450FPro" "M7655DHF" "M7400W"
                           "M7405DW" "M7605DW" "M7625DWA" "M7626DNA" "M7628DNA"
                           "M7685DXF" "M7686DXF" "LJ2680DN" "M7680D" "M7460"
                           "M7480" "M7690DNA" "M7490DNF" "M7675DXF" "M7455DNF"
                           "M7615DNA" "LJ2655DN")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" "data.tar.xz")
            (copy-recursively "opt" (string-append out "/opt"))
            (mkdir-p cups-model-dir)
            (copy-recursively "usr/share/cups/model" cups-model-dir)
            (mkdir-p license-dir)
            (copy-file (string-append driver-root "/bin/LICENSE_ENG.txt")
                       (string-append license-dir "/LICENSE_ENG.txt"))
            (copy-file (string-append driver-root "/bin/LICENSE_CHN.txt")
                       (string-append license-dir "/LICENSE_CHN.txt"))
            (symlink (string-append lpd-root "/x86_64/rawtobr3")
                     (string-append lpd-root "/rawtobr3"))
            (symlink (string-append lpd-root "/x86_64/brprintconflsr3")
                     (string-append lpd-root "/brprintconflsr3"))
            (mkdir-p cups-filter-dir)
            (for-each
             (lambda (model)
               (symlink (string-append driver-root "/bin/cupswrapper/lpdwrapper")
                        (string-append cups-filter-dir "/lenovo_" model)))
             models)
            (mkdir-p bin-dir)
            (for-each
             (lambda (model)
               (let ((wrapper (string-append bin-dir "/brprintconflsr3_" model)))
                 (call-with-output-file wrapper
                   (lambda (port)
                     (format port
                             "#!/bin/sh~%exec \"~a/bin/lpd/brprintconflsr3\" -P ~a \"$@\"~%"
                             driver-root model)))
                 (chmod wrapper #o755)))
             models)
            #t))))
    (home-page "https://aur.archlinux.org/packages/lenovo-print-driver-lj2400-m7400-bin")
    (synopsis "Lenovo LJ2400 and M7400 series printer driver payload")
    (description
     "This package repackages the Lenovo LJ2400/M7400 proprietary Debian
driver payload mirrored in AUR, including PPD files and CUPS filter wrappers.")
    (license (license:non-copyleft "https://www.lenovo.com/us/en/legal/"))))

(define-public nodejs-knit
  ;; AUR nodejs-knit: Knit local Node.js dependencies together; v0.1.2-1; 1 vote.
  ;; Source: https://github.com/coopbri/knit and npm @omnidev/knit 0.1.2
  ;; BLOCKED after 3 approaches in this pass:
  ;; 1) npm tarball direct run fails at runtime: missing module `yargs`.
  ;; 2) `npm install --offline` fails with ENOTCACHED (full dependency graph not vendored).
  ;; 3) Guix dependency route blocked: required node-* packages (yargs/chalk/fs-extra/
  ;;    glob/ignore/ini/npm-packlist/@npmcli-arborist) are unavailable in current channels.
  (package (inherit zoxide) (name "nodejs-knit")))

(define-public fw-fanctrl-rs-git
  ;; AUR fw-fanctrl-rs-git: Lightweight fan control daemon for Framework laptops (git); r106.g20b84a6-1.
  ;; BLOCKED: upstream currently requires a full Rust workspace + unstable feature path for
  ;; plugin hashing in default feature set; cargo-build-system recipe is pending after feature
  ;; gating/patch strategy is finalized for stable toolchains.
  (package (inherit zoxide) (name "fw-fanctrl-rs-git")))

(define-public aerothemeplasma-desktop-x11-git
  ;; AUR aerothemeplasma-desktop-x11-git: X11 session for AeroThemePlasma; r662.ra70f432-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aerothemeplasma
  ;; BLOCKED: current upstream requires an AeroShell-specific patched Plasma stack
  ;; (aeroshell-workspace/libplasma/kwin-components) not packaged in Guix.
  (package (inherit zoxide) (name "aerothemeplasma-desktop-x11-git")))

(define-public aeroshell-workspace-git
  ;; AUR aeroshell-workspace-git: Desktop components for AeroShell-based desktops (git); r2dff129-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aeroshell-workspace
  ;; BLOCKED: CMake build depends on LibNotificationManager/KSysGuard/Plasma APIs
  ;; tied to AeroShell patches not available in current Guix channels.
  (package (inherit zoxide) (name "aeroshell-workspace-git")))

(define-public aeroshell-libplasma-git
  ;; AUR aeroshell-libplasma-git: Plasma library with AeroShell patches (git); r6aa6d2f0b-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/libplasma
  ;; NEEDS_RECIPE_DESIGN: cmake C++ recipe; deps: KDE Plasma 6 full build chain.
  ;; Next: pin git commit, compute sha256, draft cmake KDE Plasma library recipe.
  (package (inherit zoxide) (name "aeroshell-libplasma-git")))

(define-public aeroshell-kwin-components-git
  ;; AUR aeroshell-kwin-components-git: KWin effects/scripts for AeroShell (git); r002e505-1; 1 vote.
  ;; Source: https://github.com/aeroshell-desktop/aeroshell-kwin-components
  ;; NEEDS_RECIPE_DESIGN: cmake KDE recipe; deps: kwin, KDE Plasma 6.
  ;; Next: pin git commit, compute sha256, draft cmake KDE kwin plugin recipe.
  (package (inherit zoxide) (name "aeroshell-kwin-components-git")))

(define-public keks-meet-server
  ;; AUR keks-meet-server: Server for keks-meet simple secure conferencing; v1.1.0-2; 1 vote.
  ;; Source: https://codeberg.org/metamuffin/keks-meet
  ;; NEEDS_RECIPE_DESIGN: cargo or Node recipe for server component; deps: rust or node.
  ;; Next: fetch keks-meet v1.1.0 source, determine server build system, draft recipe.
  (package (inherit zoxide) (name "keks-meet-server")))

(define-public jellything-git
  ;; AUR jellything-git: Jellything media streaming server (git); r997.823c0c6-1; 1 vote.
  ;; Source: https://codeberg.org/metamuffin/jellything
  ;; NEEDS_RECIPE_DESIGN: cargo build recipe; deps: rust, ffmpeg optional.
  ;; Next: pin git rev, compute sha256, draft cargo recipe.
  (package (inherit zoxide) (name "jellything-git")))

(define-public hurrycurry-server
  ;; AUR hurrycurry-server: Server for hurrycurry cooking game; v3.0.1-1; 1 vote.
  ;; Source: https://codeberg.org/hurrycurry/hurrycurry
  ;; NEEDS_RECIPE_DESIGN: recipe for server component; determine build system (likely Rust/Nim).
  ;; Next: fetch hurrycurry v3.0.1 source, identify server build system, draft recipe.
  (package (inherit zoxide) (name "hurrycurry-server")))

(define-public mkbrr-gui-bin
  ;; AUR mkbrr-gui-bin: Create/modify/inspect torrent files - GUI version (binary); v1.19.0_rc1-2; 1 vote.
  ;; Source: https://github.com/autobrr/mkbrr/
  ;; NEEDS_RECIPE_DESIGN: binary wrapper; Electron/Go binary; fetch Linux binary from GitHub.
  ;; Next: fetch mkbrr-gui v1.19.0-rc1 Linux binary, compute sha256, draft binary wrapper.
  (package (inherit zoxide) (name "mkbrr-gui-bin")))

(define-public wireview-linux
  ;; AUR wireview-linux: Unofficial Linux port of Thermal Grizzly WireView Pro II; v1.0.4.0-1; 1 vote.
  ;; Source: https://github.com/emaspa/wireview-linux
  ;; NEEDS_RECIPE_DESIGN: binary wrapper or build recipe; fetch Linux binary/source from GitHub.
  ;; Next: fetch wireview-linux v1.0.4.0 source/binary, compute sha256, draft recipe.
  (package (inherit zoxide) (name "wireview-linux")))

