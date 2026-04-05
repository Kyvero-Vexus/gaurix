;;; Round-26 worker-03 NEEDS_RECIPE_DESIGN resolution pass.
;;; 26 new recipes: 3 inherit (noglycin variants), 16 binary (copy-build-system),
;;; 1 trivial data (udev), 1 shell script, 2 C/autotools/cmake,
;;; 2 binary (.NET/Go), 1 vendored binary (seccomp).
;;; 4 re-blocked with specific reasons.
(define-module (gaurix packages cron-c79f127f-r26-w03-nrd)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages image)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages video)
  #:use-module (gnu packages perl)
  #:use-module (gaurix packages cron-5a2fb251-r19-w01)
  #:use-module (gaurix packages cron-5a2fb251-r14-w01)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (;; Inherit variants
            libavif-noglycin
            libheif-noglycin
            libjxl-noglycin
            ;; Trivial data packages
            q5k-usb-udev
            ;; Binary packages (copy-build-system)
            iwmenu-bin
            bzmenu-bin
            pwmenu-bin
            wrkflw-bin
            ferris-scan-bin
            sabiql-bin
            lazytail-bin
            funzzy-bin
            console2svg-bin
            wo-bin
            oken-bin
            netwatch-tui-bin
            podserv-b-bin
            gram-editor-bin
            bililive-recorder-bin
            framework-control-bin
            claude-code-seccomp
            mezzotone-bin
            chough-bin
            ;; Shell script
            lobster
            ;; C/autotools/cmake
            ddccontrol
            clightd))

;; ═══════════════════════════════════════════════════════════════════
;; Inherit variants — noglycin builds
;; (Guix does not use glycin in gdk-pixbuf; these are name-compat aliases)
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. libavif-noglycin (#3043) ─────────────────────────────────────

(define-public libavif-noglycin
  (package
    (inherit libavif)
    (name "libavif-noglycin")
    (synopsis "AVIF encoder/decoder library, without glycin integration")
    (description "This is the standard libavif library for encoding and decoding
AVIF image files.  In Guix, gdk-pixbuf does not use glycin, so this package is
functionally identical to libavif.  It exists for compatibility with packages
that depend on the @code{-noglycin} variant name.")))

;; ── 2. libheif-noglycin (#3044) ─────────────────────────────────────

(define-public libheif-noglycin
  (package
    (inherit libheif)
    (name "libheif-noglycin")
    (synopsis "HEIF/AVIF decoder and encoder, without glycin integration")
    (description "This is the standard libheif library for decoding and encoding
HEIF and AVIF image files.  In Guix, gdk-pixbuf does not use glycin, so this
package is functionally identical to libheif.  It exists for compatibility with
packages that depend on the @code{-noglycin} variant name.")))

;; ── 3. libjxl-noglycin (#3045) ──────────────────────────────────────

(define-public libjxl-noglycin
  (package
    (inherit libjxl)
    (name "libjxl-noglycin")
    (synopsis "JPEG XL reference implementation, without glycin integration")
    (description "This is the standard libjxl reference implementation for the
JPEG XL image format.  In Guix, gdk-pixbuf does not use glycin, so this package
is functionally identical to libjxl.  It exists for compatibility with packages
that depend on the @code{-noglycin} variant name.")))

;; ═══════════════════════════════════════════════════════════════════
;; Trivial data packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 4. q5k-usb-udev (#3040) ─────────────────────────────────────────

(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (rules-dir (string-append out "/lib/udev/rules.d"))
                 (rules-file (string-append rules-dir "/99-qudelix.rules")))
            (mkdir-p rules-dir)
            (call-with-output-file rules-file
              (lambda (port)
                (display
                 "# Qudelix-5K USB udev rules
# Vendor 0a12 - CSR (Qudelix)
# 44.1 KHz with Mic
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4126\", MODE=\"0666\"
# 48 KHz with Mic
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4125\", MODE=\"0666\"
# 44.1/48/88.2/96 KHz (charging/HID/Mass Storage)
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4007\", MODE=\"0666\"
# 44.1 KHz DAC
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4006\", MODE=\"0666\"
# 48 KHz DAC
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4005\", MODE=\"0666\"
# 88.2 KHz DAC
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4004\", MODE=\"0666\"
# 96 KHz DAC
SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"0a12\", ATTRS{idProduct}==\"4003\", MODE=\"0666\"
" port)))))))
    (home-page "https://gist.github.com/hmtheboy154/21c0a25ff025667981a35b6656f7da69")
    (synopsis "udev rules for the Qudelix-5K USB DAC")
    (description "This package provides udev rules that grant user access to
the Qudelix-5K USB DAC/amplifier in all its operating modes (various sample
rates, microphone modes, charging/HID).")
    (license license:bsd-2)))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system from GitHub releases
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. iwmenu-bin (#3027) ───────────────────────────────────────────

(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/iwmenu/releases/download/v"
                    version "/iwmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iwmenu-x86_64-linux-gnu" "bin/iwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out") "/bin/iwmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/iwmenu")
    (synopsis "launcher-driven Wi-Fi manager for Linux")
    (description "Iwmenu is a launcher-driven wireless network manager for
Linux that integrates with iwd.  It provides a menu-based interface through
dmenu, rofi, fuzzel, or similar launchers for connecting to and managing
Wi-Fi networks.")
    (license license:gpl3+)))

;; ── 7. bzmenu-bin (#3028) ───────────────────────────────────────────

(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/bzmenu/releases/download/v"
                    version "/bzmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bzmenu-x86_64-linux-gnu" "bin/bzmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out") "/bin/bzmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/bzmenu")
    (synopsis "launcher-driven Bluetooth manager for Linux")
    (description "Bzmenu is a launcher-driven Bluetooth manager for Linux that
integrates with BlueZ.  It provides a menu-based interface through dmenu, rofi,
fuzzel, or similar launchers for pairing and managing Bluetooth devices.")
    (license license:gpl3+)))

;; ── 8. pwmenu-bin (#3029) ───────────────────────────────────────────

(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-x86_64-linux-gnu"))
              (sha256
               (base32 "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pwmenu-x86_64-linux-gnu" "bin/pwmenu"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out") "/bin/pwmenu")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/e-tho/pwmenu")
    (synopsis "launcher-driven audio manager for Linux")
    (description "Pwmenu is a launcher-driven audio manager for Linux that
integrates with PipeWire/PulseAudio.  It provides a menu-based interface
through dmenu, rofi, fuzzel, or similar launchers for managing audio
devices and streams.")
    (license license:gpl3+)))

;; ── 9. wrkflw-bin (#3026) ───────────────────────────────────────────

(define-public wrkflw-bin
  (package
    (name "wrkflw-bin")
    (version "0.7.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bahdotsh/wrkflw/releases/download/v"
                    version "/wrkflw-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1fycd87x4idp7va9j7fxldkmqm1c20v3qxymk3j4x85061006lmn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wrkflw" "bin/wrkflw"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bahdotsh/wrkflw")
    (synopsis "validate and run GitHub Actions workflows locally")
    (description "Wrkflw validates and executes GitHub Actions workflow files
locally, allowing developers to test their CI/CD pipelines without pushing
to a remote repository.")
    (license license:expat)))

;; ── 10. ferris-scan-bin (#3032) ──────────────────────────────────────

(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                    version "/ferris-scan-tui-v" version "-linux"))
              (sha256
               (base32 "0cwbq60zw4dx5gg2xkd5qny22yg9cjkyfrcnznl4rmkicxas8mal"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "ferris-scan-tui-v"
                                        #$(package-version this-package)
                                        "-linux")
                         "bin/ferris-scan"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/ferris-scan")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (synopsis "lightweight Rust-based file scanner TUI")
    (description "Ferris Scan is a lightweight terminal-based file scanner
written in Rust.  It provides a TUI for quickly browsing and searching
through files and directories.")
    (license license:expat)))

;; ── 11. sabiql-bin (#3036) ──────────────────────────────────────────

(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.10.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/riii111/sabiql/releases/download/v"
                    version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1vg1q5475ayq89yn8v8znz5mswgainas53blsgjbf19jiw17475z"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sabiql" "bin/sabiql"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/riii111/sabiql")
    (synopsis "driver-less TUI for browsing and querying PostgreSQL databases")
    (description "Sabiql is a fast, driver-less terminal user interface for
browsing, querying, and editing PostgreSQL databases.  It connects directly
to PostgreSQL without requiring additional database drivers.")
    (license license:expat)))

;; ── 12. lazytail-bin (#3071) ────────────────────────────────────────

(define-public lazytail-bin
  (package
    (name "lazytail-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/raaymax/lazytail/releases/download/v"
                    version "/lazytail-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1fd6f3j40f33wk4d7wymaia08gi7hax59dif4zda7h5qchpf9z3g"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lazytail" "bin/lazytail"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raaymax/lazytail")
    (synopsis "terminal-based log viewer with live filtering and follow mode")
    (description "Lazytail is a fast, universal terminal-based log viewer with
live filtering and follow mode.  It supports tailing multiple log files
simultaneously with real-time search and filtering capabilities.")
    (license license:expat)))

;; ── 13. funzzy-bin (#3072) ──────────────────────────────────────────

(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cristianoliveira/funzzy/releases/download/v"
                    version "/funzzy-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("funzzy" "bin/funzzy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight generic-purpose file watcher")
    (description "Funzzy is a lightweight, configurable file watcher that
executes commands when files change.  It uses a simple YAML configuration
file to define watch rules and actions.")
    (license license:expat)))

;; ── 14. console2svg-bin (#3048) ─────────────────────────────────────

(define-public console2svg-bin
  (package
    (name "console2svg-bin")
    (version "0.6.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/arika0093/console2svg/releases/download/v"
                    version "/console2svg-linux-x64"))
              (sha256
               (base32 "1bkqs48ph0b0m96p6v6kgrkh3kbhaqfcc5vvs4lsw5bfk3fizyxy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("console2svg-linux-x64" "bin/console2svg"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/console2svg")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/arika0093/console2svg")
    (synopsis "convert terminal output to SVG images")
    (description "Console2svg converts terminal output into SVG images,
preserving colors and formatting.  It reads terminal escape sequences and
produces clean, scalable vector graphics.")
    (license license:expat)))

;; ── 15. wo-bin (#3067) ──────────────────────────────────────────────

(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/antham/wo/releases/download/"
                    version "/wo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "1p2ny73avwylp1vg1syfrqi2mx2a5xqv1n2v2pp4g835xgr0igy9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wo" "bin/wo"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager")
    (description "Wo is a workspace shell manager that helps organize and switch
between different project environments.  It provides quick navigation and
environment setup for development workspaces.")
    (license license:expat)))

;; ── 16. oken-bin (#3069) ────────────────────────────────────────────

(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linkwithjoydeep/oken/releases/download/v"
                    version "/oken-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32 "12rizglhm1snlmwnh6cdp492f178kqmyamw8qm6rw8j4c6jk6ff8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oken" "bin/oken"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "smarter SSH CLI with host management and fuzzy picker")
    (description "Oken is a smarter SSH command-line interface with better host
management and a fuzzy host picker.  It works standalone or as an optional
drop-in replacement for the standard ssh command.")
    (license license:expat)))

;; ── 17. netwatch-tui-bin (#3038) ────────────────────────────────────

(define-public netwatch-tui-bin
  (package
    (name "netwatch-tui-bin")
    (version "0.9.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/matthart1983/netwatch/releases/download/v"
                    version "/netwatch-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0dljijbx2n9514rbfwgxl0s4p0n1kbwp4pdi85kzl3zpg5lk3djc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netwatch" "bin/netwatch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/matthart1983/netwatch")
    (synopsis "real-time network diagnostics TUI")
    (description "Netwatch is a real-time network diagnostics tool with a
terminal user interface.  It provides live monitoring of network connections,
latency, and bandwidth usage in a format similar to htop.")
    (license license:expat)))

;; ── 18. podserv-b-bin (#3037) ───────────────────────────────────────

(define-public podserv-b-bin
  (package
    (name "podserv-b-bin")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/l5yth/podserv-b/releases/download/v"
                    version "/podserv-b"))
              (sha256
               (base32 "0zbp5nrlr9jcbc7vily70ikfv7mz829ckp5sv2miywkgpjgimlic"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("podserv-b" "bin/podserv-b"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/podserv-b")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/l5yth/podserv-b")
    (synopsis "minimalist podcast server for serving media files")
    (description "Podserv-b is a minimalist podcast server (type B) for serving
media files on the web.  It generates RSS feeds from a directory of audio files,
making it easy to self-host podcast content.")
    (license license:asl2.0)))

;; ── 19. gram-editor-bin (#3033) ─────────────────────────────────────

(define-public gram-editor-bin
  (package
    (name "gram-editor-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/GramEditor/gram/releases/download/"
                    version "/gram-linux-x86_64-" version ".tar.gz"))
              (sha256
               (base32 "07hxs5nnb802k3vvpngm89vfbkyw465k1v9a7m10g6z002d3sfjg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/gram" "bin/gram")
               ("libexec/" "libexec/")
               ("share/" "share/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/GramEditor/gram")
    (synopsis "GPU-accelerated code editor")
    (description "Gram is a GPU-accelerated code editor built for speed and
productivity.  It provides modern editing features with high-performance
rendering.")
    (license license:gpl3+)))

;; ── 20. bililive-recorder-bin (#3014) ───────────────────────────────

(define-public bililive-recorder-bin
  (package
    (name "bililive-recorder-bin")
    (version "2.18.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/BililiveRecorder/BililiveRecorder"
                    "/releases/download/v" version
                    "/BililiveRecorder-CLI-linux-x64.zip"))
              (sha256
               (base32 "01743ds2qdr7x1y5hbv84chdhja9i56dgq9n4sgr8xnhi8xyqbyq"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("BililiveRecorder.Cli" "bin/bililive-recorder"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/bililive-recorder")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/BililiveRecorder/BililiveRecorder")
    (synopsis "BiliBili live stream recorder")
    (description "BililiveRecorder (B站录播姬) is a tool for recording live
streams from BiliBili.  It supports automatic recording, stream quality
selection, and fault-tolerant continuous recording.")
    (license license:gpl3)))

;; ── 21. framework-control-bin (#3073) ───────────────────────────────

(define-public framework-control-bin
  (package
    (name "framework-control-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozturkkl/framework-control/releases/download/"
                    version "/framework-control-service-x86_64.tar.gz"))
              (sha256
               (base32 "07jqg00l7kihd3hf2wppj8c9qfi1zixgsbwpw9qmhi4dxi3mxyqi"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("framework-control-service" "bin/framework-control"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "control tool for Framework Laptop features")
    (description "Framework Control is a tool for managing Framework Laptop
features including fan speed, battery charge limits, and keyboard LED
brightness.  It provides a service-based interface for hardware control.")
    (license license:expat)))

;; ── 22. claude-code-seccomp (#3030) ─────────────────────────────────

(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.35")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropic-experimental/sandbox-runtime")
                    (commit "4fad8fa35db3f09958db1df401b30bd00402b611")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "1wakxriibp789jz83k4xj76w0j2nsbx51z3962w44qdrix9p6k61"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vendor/seccomp/x64/apply-seccomp"
                "lib/claude-code-seccomp/apply-seccomp")
               ("vendor/seccomp/x64/unix-block.bpf"
                "lib/claude-code-seccomp/unix-block.bpf"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/lib/claude-code-seccomp/apply-seccomp")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp filter for Claude Code sandbox")
    (description "This package provides the seccomp filter binary and BPF
program used by Claude Code's @code{/sandbox} feature.  The @code{apply-seccomp}
binary loads a pre-compiled BPF filter that restricts Unix domain socket access,
then executes the given command under the filter.")
    (license license:asl2.0)))

;; ── 23. mezzotone-bin (#3079) ────────────────────────────────────────

(define-public mezzotone-bin
  (package
    (name "mezzotone-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joaoheitorgarcia/Mezzotone/releases/download/v"
                    version "/app-linux-amd64"))
              (sha256
               (base32 "05rfaihzcqwaxv75cn3j7lqfvap7lfdbpccql8mqcj158jbsagcq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("app-linux-amd64" "bin/mezzotone"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/mezzotone")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joaoheitorgarcia/Mezzotone")
    (synopsis "TUI to convert images and GIFs to ASCII/Unicode art")
    (description "Mezzotone is a terminal user interface application written
in Go that converts images and GIFs into ASCII or Unicode art.  It supports
various rendering styles and can process both static images and animations.")
    (license license:expat)))

;; ── 24. chough-bin (#3080) ──────────────────────────────────────────

(define-public chough-bin
  (package
    (name "chough-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hyperpuncher/chough/releases/download/v"
                    version "/chough_v" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32 "0gb1ivviybc7zbailqsbmyw3dx80jizkqkzmhypr05r2rdy3fqy9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("chough" "bin/chough")
               ("libonnxruntime.so" "lib/chough/libonnxruntime.so")
               ("libsherpa-onnx-c-api.so" "lib/chough/libsherpa-onnx-c-api.so")
               ("libsherpa-onnx-cxx-api.so" "lib/chough/libsherpa-onnx-cxx-api.so"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hyperpuncher/chough")
    (synopsis "fast speech recognition CLI using Parakeet TDT")
    (description "Chough is a fast automatic speech recognition (ASR) command-line
tool that uses the Parakeet TDT 0.6b V3 model via Sherpa-ONNX.  It provides
offline, local speech-to-text transcription.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Shell script package
;; ═══════════════════════════════════════════════════════════════════

;; ── 23. lobster (#3076) ─────────────────────────────────────────────

(define-public lobster
  (package
    (name "lobster")
    (version "4.6.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/justchokingaround/lobster/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1hdss5h1wfbbb51hsfvxky5s4yly50sgp5sfkf6is5wvz3dxvx99"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lobster.sh" "bin/lobster"))))
    (inputs (list bash curl))
    (home-page "https://github.com/justchokingaround/lobster")
    (synopsis "shell script to stream movies and shows from the terminal")
    (description "Lobster is a shell script that allows users to search for and
stream movies, web series, and TV shows directly from the terminal.  It uses
external providers and integrates with mpv for playback.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; C/Autotools/CMake source builds
;; ═══════════════════════════════════════════════════════════════════

;; ── 27. ddccontrol (#1699) ──────────────────────────────────────────

(define-public ddccontrol
  (package
    (name "ddccontrol")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ddccontrol/ddccontrol/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0pzlp8x2qxzcl9zrmhcvww26kmilgfmb2kkmjkj9znf868x65l98"))))
    (build-system gnu-build-system)
    (native-inputs (list autoconf automake libtool intltool
                         pkg-config perl gettext-minimal))
    (inputs (list ddccontrol-db-git
                  libxml2
                  i2c-tools
                  pciutils))
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "sh" "autogen.sh")))
               (add-after 'unpack 'fix-ddccontrol-db-path
                 (lambda* (#:key inputs #:allow-other-keys)
                   (substitute* "configure.ac"
                     (("\\$\\{prefix\\}/share/ddccontrol-db")
                      (string-append (assoc-ref inputs "ddccontrol-db-git")
                                     "/share/ddccontrol-db")))))
               (delete 'check))))
    (home-page "https://github.com/ddccontrol/ddccontrol")
    (synopsis "control monitor settings via DDC/CI protocol")
    (description "DDCcontrol allows users to control monitor parameters such
as brightness, contrast, and input source via the DDC/CI protocol over
the I2C bus.  It provides both command-line and library interfaces.")
    (license license:gpl2+)))

;; ── 28. clightd (#3023) ─────────────────────────────────────────────

(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FedeDP/Clightd/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32 "0nlainnyhl60qvbvqpd1brk48980dzn2a6p24df4mxn5svf3vjry"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libmodule
                  polkit
                  dbus
                  eudev
                  ddcutil
                  libdrm
                  wayland
                  libxrandr))
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DPOLKIT_POLICY_DIR="
                                  #$output "/share/polkit-1/actions")
                   (string-append "-DDBUS_SYSTEM_SERVICES_DIR="
                                  #$output "/share/dbus-1/system-services")
                   (string-append "-DDBUS_SYSTEM_CONFIG_DIR="
                                  #$output "/etc/dbus-1/system.d"))))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "backlight, screen temperature, and display control daemon")
    (description "Clightd is a lightweight D-Bus daemon that provides an
interface for controlling screen backlight, color temperature (gamma), and
DDC/CI monitor settings.  It is the backend service for Clight, providing
automatic screen dimming and color temperature adjustment.")
    (license license:gpl3+)))
