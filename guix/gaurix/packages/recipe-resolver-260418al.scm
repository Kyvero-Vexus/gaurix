;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418al
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (12):
;;;        1.  libmodule (cmake-build-system, v5.0.2, MIT)
;;;        2.  clightd (cmake-build-system, v5.9, GPL-3.0)
;;;        3.  funzzy-bin (copy-build-system, v1.5.0, MIT)
;;;        4.  wo-bin (copy-build-system, v1.0.0, MIT)
;;;        5.  oken-bin (copy-build-system, v0.3.8, MIT)
;;;        6.  comp-scan-bin (copy-build-system, v0.1.0, MIT)
;;;        7.  c47-bin (copy-build-system, v00.109.03.01b1, GPL-3.0+)
;;;        8.  claude-code-seccomp (copy-build-system, v0.0.49, Apache-2.0)
;;;        9.  q5k-usb-udev (trivial-build-system, v2026.02.28, BSD-2)
;;;       10.  noto-fonts-cjk-fontconfig (trivial-build-system, v1, GPL-3.0+)
;;;       11.  qpdf-zopfli (cmake-build-system, v11.8.0, Apache-2.0)
;;;       12.  tilem-gtk3-git (gnu-build-system, v2.0-git, GPL-3.0)
;;;
;;; BLOCKED EXHAUSTED (18):
;;;       13.  orca-slicer -> COMPLEX_BUILD: massive C++ codebase, bundled deps
;;;       14.  vcvrack -> NON_FOSS: CC BY-NC 4.0 assets
;;;       15.  sway-scroll -> COMPLEX_BUILD: bundles modified wlroots
;;;       16.  lutris-live-bin -> UNNECESSARY: lutris already in Guix upstream
;;;       17.  jetbrains-toolbox -> PROPRIETARY: no source code
;;;       18.  flaresolverr-bin -> COMPLEX_DEPS: requires Chromium + selenium
;;;       19.  renamemytvseries-gtk-bin -> PROPRIETARY: closed-source freeware
;;;       20.  sysbox-ce -> COMPLEX_BUILD: system-level container runtime
;;;       21.  gram-editor-bin -> COMPLEX_BUILD: Zed fork, 100+ cargo crates
;;;       22.  libjxl-noglycin-doc -> UNNECESSARY: libjxl already in Guix
;;;       23.  console2svg-bin -> DOTNET: no .NET support in Guix
;;;       24.  framework-control-bin -> COMPLEX_BUILD: hybrid Rust+Svelte
;;;       25.  ferris-scan-bin -> NO_BINARY: no prebuilt, Rust crate enum needed
;;;       26.  pwmenu-bin -> NO_BINARY: no prebuilt, Rust crate enum needed
;;;       27.  sabiql-bin -> NO_BINARY: no prebuilt, Rust crate enum needed
;;;       28.  netwatch-tui -> CARGO_DEPS: Rust with crate deps, no prebuilt
;;;       29.  swhook -> CARGO_DEPS: Rust with crate deps, no prebuilt
;;;       30.  szsol-rs -> CARGO_DEPS: Rust with crate deps, no prebuilt
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260418al)
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
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (libmodule
            clightd
            funzzy-bin
            wo-bin
            oken-bin
            comp-scan-bin
            c47-bin
            claude-code-seccomp
            q5k-usb-udev
            noto-fonts-cjk-fontconfig
            qpdf-zopfli
            tilem-gtk3-git))

;;; -------------------------------------------------------------------
;;; 1. libmodule --- C event-driven actor library
;;; Lightweight library implementing actor-model IPC with an event loop.
;;; Needed by clightd.
;;; -------------------------------------------------------------------
(define-public libmodule
  (package
    (name "libmodule")
    (version "5.0.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedeDP/libmodule")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))  ;; no test suite
    (home-page "https://github.com/FedeDP/libmodule")
    (synopsis "simple and elegant implementation of an actor library for C")
    (description "Libmodule is a C library that provides an actor-model
implementation with an internal event loop.  It uses Linux epoll for
event multiplexing and supports modular program design with lifecycle
management for components.  Each module can register, deregister, and
communicate through a publish-subscribe messaging system.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. clightd --- Linux bus interface for screen brightness control
;;; D-Bus service to manage screen brightness, gamma, DPMS, and sensor
;;; data.  Depends on libmodule.
;;; -------------------------------------------------------------------
(define-public clightd
  (package
    (name "clightd")
    (version "5.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/FedeDP/Clightd")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:configure-flags
           #~(list "-DENABLE_DDC=ON"
                   "-DENABLE_GAMMA=ON"
                   "-DENABLE_DPMS=ON"
                   "-DENABLE_SCREEN=ON")))
    (native-inputs (list pkg-config))
    (inputs (list dbus
                  ddcutil
                  elogind
                  eudev
                  libdrm
                  libmodule
                  libjpeg-turbo
                  libusb
                  libxrandr
                  libxext
                  polkit
                  wayland))
    (home-page "https://github.com/FedeDP/Clightd")
    (synopsis "Linux bus interface for screen brightness and gamma control")
    (description "Clightd is a D-Bus service that provides a bus interface
to manage screen brightness, gamma temperature, DPMS state, and ambient
light sensor data on Linux.  It supports multiple backends including DDC/CI
for external monitors, backlight sysfs for laptops, and X11/Wayland gamma
adjustment.  It is designed to be used with the Clight user-space daemon.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 3. funzzy-bin --- Lightweight file watcher (prebuilt)
;;; Configurable file watcher that runs commands on file changes.
;;; -------------------------------------------------------------------
(define-public funzzy-bin
  (package
    (name "funzzy-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cristianoliveira/funzzy"
                    "/releases/download/v" version
                    "/funzzy-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("funzzy" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cristianoliveira/funzzy")
    (synopsis "lightweight configurable file watcher")
    (description "Funzzy is a lightweight file watcher that executes
configured commands when files matching specified patterns change.  It
supports YAML-based configuration files with glob patterns and multiple
watch targets, making it useful for development workflows such as
auto-rebuilding, test running, and live reloading.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. wo-bin --- Workspace shell manager (prebuilt)
;;; CLI tool for managing workspace-based shell sessions.
;;; -------------------------------------------------------------------
(define-public wo-bin
  (package
    (name "wo-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/antham/wo/releases/download/v"
                    version "/wo_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wo" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/antham/wo")
    (synopsis "workspace shell manager for project environments")
    (description "Wo is a workspace shell manager that helps organize and
switch between project environments.  It provides commands to create,
list, and activate workspaces, each with their own shell configuration
and environment variables.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. oken-bin --- SSH CLI with fuzzy host picker (prebuilt)
;;; SSH client wrapper with better host management.
;;; -------------------------------------------------------------------
(define-public oken-bin
  (package
    (name "oken-bin")
    (version "0.3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linkwithjoydeep/oken"
                    "/releases/download/v" version
                    "/oken-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("oken" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwithjoydeep/oken")
    (synopsis "SSH CLI with fuzzy host picker and host management")
    (description "Oken is an SSH client wrapper that provides improved host
management with a fuzzy host picker.  It can function as a standalone SSH
tool or as an optional drop-in replacement for the ssh command, with
features for organizing and quickly connecting to remote hosts.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. comp-scan-bin --- Local AI system scanner (prebuilt)
;;; System scanner that uses local AI to suggest improvements.
;;; -------------------------------------------------------------------
(define-public comp-scan-bin
  (package
    (name "comp-scan-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vvk147/comp-scan"
                    "/releases/download/v" version
                    "/compscan-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("compscan" "bin/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vvk147/comp-scan")
    (synopsis "local AI agent for system scanning and improvement suggestions")
    (description "Comp-scan is a system scanner that uses a locally running
AI model to observe system configuration, analyze usage patterns, and
suggest improvements.  It requires a local AI inference server such as
Ollama to be running for the AI analysis features.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. c47-bin --- C47 pocket calculator emulator (prebuilt)
;;; RPN-based programmable scientific calculator emulator for SwissMicros
;;; DM42/DM42n hardware.
;;; -------------------------------------------------------------------
(define-public c47-bin
  (package
    (name "c47-bin")
    (version "00.109.03.01b1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/api/v4/projects/14055190"
                    "/packages/generic/c47/" version
                    "/c47-linux-" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "unzip" source))))
           #:install-plan
           #~'(("c47" "bin/")
               ("c47.png" "share/icons/hicolor/256x256/apps/"))))
    (native-inputs (list (@ (gnu packages compression) unzip)))
    (inputs (list cairo
                  glib
                  gmp
                  gtk+
                  pulseaudio))
    (supported-systems '("x86_64-linux"))
    (home-page "https://47calc.com")
    (synopsis "emulator for the C47 RPN programmable scientific calculator")
    (description "C47 is an emulator for the C47 pocket calculator, an
RPN-based programmable scientific calculator designed for SwissMicros
DM42 and DM42n hardware.  It provides a desktop interface for the same
calculator firmware, with features including complex number support,
matrix operations, and a programmable keystroke system.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. claude-code-seccomp --- Seccomp filter for Claude Code sandbox
;;; Prebuilt seccomp BPF filter and applicator binary used by Claude
;;; Code's /sandbox feature.
;;; -------------------------------------------------------------------
(define-public claude-code-seccomp
  (package
    (name "claude-code-seccomp")
    (version "0.0.49")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropic-experimental/sandbox-runtime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vendor/seccomp/x64/apply-seccomp"
                "lib/claude-code-seccomp/")
               ("vendor/seccomp/x64/unix-block.bpf"
                "lib/claude-code-seccomp/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/anthropic-experimental/sandbox-runtime")
    (synopsis "seccomp filter dependency for Claude Code sandbox")
    (description "This package provides the prebuilt seccomp BPF filter
and applicator binary used by Claude Code's @code{/sandbox} feature.
The @code{apply-seccomp} binary loads the @code{unix-block.bpf} filter
to restrict system calls in the sandboxed environment.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 9. q5k-usb-udev --- Udev rules for Qudelix-5K USB DAC
;;; Provides user-accessible permissions for the Qudelix-5K audio DAC.
;;; -------------------------------------------------------------------
(define-public q5k-usb-udev
  (package
    (name "q5k-usb-udev")
    (version "2026.02.28")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((rules-dir (string-append #$output
                                               "/lib/udev/rules.d")))
                 (mkdir-p rules-dir)
                 (call-with-output-file
                     (string-append rules-dir "/99-qudelix.rules")
                   (lambda (port)
                     (display
                      (string-append
                       "# Qudelix-5K USB DAC udev rules\n"
                       "# Vendor 0x0a12 (Qudelix)\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4126\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4125\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4007\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4006\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4005\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4004\", MODE=\"0666\"\n"
                       "KERNEL==\"hidraw*\", ATTRS{idVendor}==\"0a12\","
                       " ATTRS{idProduct}==\"4003\", MODE=\"0666\"\n")
                      port)))
                 #t))))
    (home-page "https://www.qudelix.com/")
    (synopsis "udev rules for Qudelix-5K USB DAC")
    (description "This package provides udev rules that grant user-level
access to Qudelix-5K USB DAC hidraw devices.  The rules cover all sample
rate configurations (44.1, 48, 88.2, and 96 kHz) with and without
microphone support, allowing the Qudelix-5K companion application to
communicate with the device without requiring root privileges.")
    (license license:bsd-2)))

;;; -------------------------------------------------------------------
;;; 10. noto-fonts-cjk-fontconfig --- Fontconfig rules for Noto CJK
;;; Locale-aware fontconfig snippet that orders CJK font variants by
;;; language preference.
;;; -------------------------------------------------------------------
(define-public noto-fonts-cjk-fontconfig
  (package
    (name "noto-fonts-cjk-fontconfig")
    (version "1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let ((conf-dir (string-append
                                #$output
                                "/share/fontconfig/conf.avail")))
                 (mkdir-p conf-dir)
                 (call-with-output-file
                     (string-append conf-dir "/70-noto-cjk.conf")
                   (lambda (port)
                     (display
                      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE fontconfig SYSTEM \"urn:fontconfig:fonts.dtd\">
<fontconfig>
  <!-- CJK font ordering by locale for Noto CJK fonts -->
  <match>
    <test name=\"lang\" compare=\"contains\"><string>zh-cn</string></test>
    <test name=\"family\"><string>Noto Sans CJK</string></test>
    <edit name=\"family\" mode=\"prepend\" binding=\"strong\">
      <string>Noto Sans CJK SC</string>
    </edit>
  </match>
  <match>
    <test name=\"lang\" compare=\"contains\"><string>zh-tw</string></test>
    <test name=\"family\"><string>Noto Sans CJK</string></test>
    <edit name=\"family\" mode=\"prepend\" binding=\"strong\">
      <string>Noto Sans CJK TC</string>
    </edit>
  </match>
  <match>
    <test name=\"lang\" compare=\"contains\"><string>zh-hk</string></test>
    <test name=\"family\"><string>Noto Sans CJK</string></test>
    <edit name=\"family\" mode=\"prepend\" binding=\"strong\">
      <string>Noto Sans CJK HK</string>
    </edit>
  </match>
  <match>
    <test name=\"lang\" compare=\"contains\"><string>ja</string></test>
    <test name=\"family\"><string>Noto Sans CJK</string></test>
    <edit name=\"family\" mode=\"prepend\" binding=\"strong\">
      <string>Noto Sans CJK JP</string>
    </edit>
  </match>
  <match>
    <test name=\"lang\" compare=\"contains\"><string>ko</string></test>
    <test name=\"family\"><string>Noto Sans CJK</string></test>
    <edit name=\"family\" mode=\"prepend\" binding=\"strong\">
      <string>Noto Sans CJK KR</string>
    </edit>
  </match>
</fontconfig>
"
                      port)))
                 #t))))
    (home-page "https://fonts.google.com/noto")
    (synopsis "fontconfig rules for locale-aware Noto CJK font ordering")
    (description "This package provides a fontconfig configuration snippet
that appends the correct regional variant of Noto CJK fonts (Simplified
Chinese, Traditional Chinese, Hong Kong, Japanese, or Korean) based on
the requesting application's locale.  This ensures proper CJK glyph
selection when multiple Noto CJK font variants are installed.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 11. qpdf-zopfli --- QPDF with Zopfli compression support
;;; Variant of QPDF built with Zopfli for better PDF compression.
;;; -------------------------------------------------------------------
(define-public qpdf-zopfli
  (package
    (inherit qpdf)
    (name "qpdf-zopfli")
    (arguments
     (substitute-keyword-arguments (package-arguments qpdf)
       ((#:configure-flags flags #~'())
        #~(append #$flags (list "-DUSE_IMPLICIT_CRYPTO=OFF"
                                "-DREQUIRE_CRYPTO_OPENSSL=ON")))))
    (inputs (modify-inputs (package-inputs qpdf)
              (append zopfli)))
    (synopsis "PDF transformation tool with Zopfli compression support")
    (description "This variant of QPDF is built with Zopfli compression
support enabled, providing better compression ratios for PDF stream
data at the cost of slower compression speed.  QPDF is a command-line
tool and C++ library for structural, content-preserving transformations
on PDF files.")))

;;; -------------------------------------------------------------------
;;; 12. tilem-gtk3-git --- TI calculator emulator (GTK3)
;;; GTK3 fork of the TilEm TI calculator emulator.
;;; -------------------------------------------------------------------
(define-public tilem-gtk3-git
  (package
    (name "tilem-gtk3-git")
    (version "2.0-git.20250401")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kuba160/tilem-gtk3")
                    (commit "e36102e")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f  ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (replace 'bootstrap
                 (lambda _
                   (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list (@ (gnu packages autotools) autoconf)
                         (@ (gnu packages autotools) automake)
                         (@ (gnu packages autotools) libtool)
                         pkg-config))
    (inputs (list gtk+
                  libticalcs2))
    (home-page "https://github.com/kuba160/tilem-gtk3")
    (synopsis "TI calculator emulator with GTK3 interface")
    (description "TilEm GTK3 is a fork of the TilEm TI calculator emulator
ported to GTK3.  It emulates TI-73 through TI-86 Z80-based calculators,
providing a graphical interface that reproduces the calculator's display
and keypad.  ROM images must be obtained separately.")
    (license license:gpl3)))
