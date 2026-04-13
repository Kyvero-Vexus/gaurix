;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260413i
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages:
;;;   - 15 recipes created
;;;   - 15 blocked with specific reason codes
;;;
;;; Recipes (15):
;;;   - python3-threaded-servers (copy, gpl3+)
;;;   - ps3dec (cmake, non-copyleft/wtfpl)
;;;   - trickle-bandwidth (gnu, bsd-3)
;;;   - oshd (copy, expat)
;;;   - sshpilot (pyproject, gpl3+)
;;;   - rip-cli (trivial/cargo-stub, gpl3+)
;;;   - disk-spinner (trivial/cargo-stub, expat)
;;;   - psn (trivial/cargo-stub, asl2.0)
;;;   - ripsecrets (trivial/cargo-stub, expat)
;;;   - kapowarr (copy, gpl3+)
;;;   - nut-multimedia (gnu, gpl2+)
;;;   - gnome-ssh-askpass4 (gnu, bsd-2)
;;;   - pleaser (trivial/cargo-stub, gpl3+)
;;;   - libsurvive (cmake, expat)
;;;   - sddm-conf (cmake, expat)
;;;
;;; Blocked (15):
;;;   - python-withoutbg (MISSING_GUIX_DEPS: onnxruntime, huggingface-hub)
;;;   - meshroom (COMPLEX_DEPS: AliceVision framework not in Guix)
;;;   - manga-tui (RUST_CARGO: 50+ crate deps, HTTP/image/TUI chain)
;;;   - objdiff (RUST_CARGO: binary format parsing, complex toolchain)
;;;   - css-inline (RUST_CARGO: full CSS/HTML parser stack)
;;;   - d2x-rebirth (COMPLEX_DEPS: SCons game engine, custom build)
;;;   - vpkedit (MISSING_GUIX_DEPS: Qt6 incomplete in Guix)
;;;   - welle.io (MISSING_GUIX_DEPS: soapysdr not in Guix)
;;;   - darkly (MISSING_GUIX_DEPS: KF6/Plasma6 deps not in Guix)
;;;   - 86box-git (COMPLEX_DEPS: x86 emulator, slirp/fluidsynth/munt)
;;;   - hyprlight (RUST_CARGO: Rust brightness tool, crate deps needed)
;;;   - python-requirements-language-server (MISSING_GUIX_DEPS: lsp-tree-sitter, tree-sitter-requirements)
;;;   - rustfetch-git (RUST_CARGO: system info tool, crate enumeration needed)
;;;   - icann-rdap (COMPLEX_DEPS: Go, 100+ Go module deps)
;;;   - logiops-rs (RUST_CARGO: HID/udev Rust bindings, upstream unclear)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.
;;; Rust/Cargo stubs use trivial-build-system; full builds require
;;; packaging all crate dependencies for cargo-build-system.

(define-module (gaurix packages recipe-resolver-260413i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:export (
            python3-threaded-servers
            ps3dec
            trickle-bandwidth
            oshd
            sshpilot
            rip-cli
            disk-spinner
            psn
            ripsecrets
            kapowarr
            nut-multimedia
            gnome-ssh-askpass4
            pleaser
            libsurvive
            sddm-conf
            ))

;;; ── 1. python3-threaded-servers ───────────────────────────────────────
;;; Threaded server modules for Python (HTTP, multicast, Pacserve)
;;; AUR: python3-threaded_servers  →  Guix: python3-threaded-servers
;;; Upstream: https://xyne.dev/projects/python3-threaded_servers/
;;;
(define-public python3-threaded-servers
  (package
    (name "python3-threaded-servers")
    (version "2022.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://xyne.dev/projects/python3-threaded_servers/src/"
             "python3-threaded_servers-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ThreadedServers" "lib/python3/site-packages/ThreadedServers"))))
    (inputs (list python))
    (home-page "https://xyne.dev/projects/python3-threaded_servers/")
    (synopsis "threaded server modules for Python including HTTPS and multicast")
    (description
     "Provides ThreadedHTTPSServer, ThreadedMulticastServer, Quickserve,
and Pacserve modules for Python.  These modules extend the standard
library @code{http.server} and @code{socketserver} with threading
support, HTTPS capability, and multicast discovery.")
    (license license:gpl3+)))

;;; ── 2. ps3dec ─────────────────────────────────────────────────────────
;;; PS3 ISO encryptor/decryptor
;;; AUR: ps3dec-git  →  Guix: ps3dec
;;; Upstream: https://github.com/al3xtjames/PS3Dec
;;;
(define-public ps3dec
  (package
    (name "ps3dec")
    (version "0.0.0-1.7d1d27f")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/al3xtjames/PS3Dec")
             (commit "7d1d27f0fc0585c3e97f62e08f3d0e6100a5eb78")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DUSE_SYSTEM_MBEDTLS=ON")))
    (inputs (list mbedtls-lts))
    (home-page "https://github.com/al3xtjames/PS3Dec")
    (synopsis "ISO encryptor and decryptor for PS3 disc images")
    (description
     "PS3Dec encrypts and decrypts PS3 disc images in ISO format.  It
uses mbedTLS for cryptographic operations and supports both encryption
and decryption of Blu-ray disc images for the PlayStation 3.")
    (license (license:non-copyleft
              "http://www.wtfpl.net/about/"
              "WTFPL — Do What The F*** You Want To Public License"))))

;;; ── 3. trickle-bandwidth ──────────────────────────────────────────────
;;; Lightweight userspace bandwidth shaper
;;; AUR: trickle  →  Guix: trickle-bandwidth
;;; Upstream: https://github.com/mariusae/trickle
;;;
(define-public trickle-bandwidth
  (package
    (name "trickle-bandwidth")
    (version "1.07")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mariusae/trickle/archive/refs/heads/"
             "master.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs (list pkg-config))
    (inputs (list libevent))
    (home-page "https://github.com/mariusae/trickle")
    (synopsis "lightweight userspace bandwidth shaper for Unix-like systems")
    (description
     "Trickle is a portable lightweight userspace bandwidth shaper.  It
can run in collaborative or standalone mode to limit the bandwidth
consumption of applications without requiring root privileges or
kernel modifications.  It uses the BSD socket API via a shared
library preload mechanism.")
    (license license:bsd-3)))

;;; ── 4. oshd ───────────────────────────────────────────────────────────
;;; Odd Static Hosts Daemon — manages /etc/hosts entries
;;; AUR: oshd  →  Guix: oshd
;;; Upstream: https://github.com/TheOddCell/oshd
;;;
(define-public oshd
  (package
    (name "oshd")
    (version "2.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TheOddCell/oshd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oshd.py" "bin/oshd")
          ("oshctl.py" "bin/oshctl"))))
    (inputs (list python))
    (home-page "https://github.com/TheOddCell/oshd")
    (synopsis "daemon that manages /etc/hosts entries via a Unix socket")
    (description
     "Odd Static Hosts Daemon (oshd) dynamically manages @file{/etc/hosts}
entries through a Unix socket interface.  The companion @command{oshctl}
tool allows adding, removing, and listing host entries without
manually editing the hosts file.")
    (license license:expat)))

;;; ── 5. sshpilot ──────────────────────────────────────────────────────
;;; SSH connection manager with GTK4 UI
;;; AUR: sshpilot  →  Guix: sshpilot
;;; Upstream: https://github.com/mfat/sshpilot
;;;
(define-public sshpilot
  (package
    (name "sshpilot")
    (version "4.7.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mfat/sshpilot")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs
     (list python-pygobject python-pycairo python-paramiko
           python-cryptography python-keyring python-psutil))
    (inputs (list gtk libadwaita vte))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/mfat/sshpilot")
    (synopsis "user-friendly SSH connection manager and terminal")
    (description
     "SSHPilot is a graphical SSH connection manager built with GTK4 and
libadwaita.  It provides a tabbed terminal interface using VTE, with
features for saving connection profiles, managing SSH keys via
@code{paramiko}, and securely storing credentials through the system
keyring.")
    (license license:gpl3+)))

;;; ── 6. rip-cli ───────────────────────────────────────────────────────
;;; Safe rm replacement — moves files to graveyard instead of unlinking
;;; AUR: rip-cli  →  Guix: rip-cli
;;; Upstream: https://github.com/nivekuil/rip (crates.io: rm-improved)
;;; NOTE: Rust/Cargo stub.  Full build requires cargo-build-system with
;;; crate deps: clap 2, walkdir 1, time 0.1, error-chain 0.12.
;;;
(define-public rip-cli
  (package
    (name "rip-cli")
    (version "0.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nivekuil/rip/archive/refs/tags/"
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/rip-cli"))
          #t)))
    (home-page "https://github.com/nivekuil/rip")
    (synopsis "safe and ergonomic alternative to rm")
    (description
     "Rip (rm-improved) moves deleted files to a graveyard directory
instead of permanently unlinking them, allowing easy recovery.  It
provides the @command{rip} command as a safer replacement for
@command{rm}.  Full build requires cargo-build-system with all Rust
crate dependencies packaged.")
    (license license:gpl3+)))

;;; ── 7. disk-spinner ──────────────────────────────────────────────────
;;; Burn-in tool for spinning HDDs
;;; AUR: disk-spinner  →  Guix: disk-spinner
;;; Upstream: https://github.com/boinkor-net/disk-spinner
;;; NOTE: Rust/Cargo stub.  Full build requires cargo-build-system with
;;; crate deps: clap, aes, ctr, blake3, rand, rayon, indicatif, etc.
;;;
(define-public disk-spinner
  (package
    (name "disk-spinner")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/boinkor-net/disk-spinner/archive/refs/tags/v"
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/disk-spinner"))
          #t)))
    (home-page "https://github.com/boinkor-net/disk-spinner")
    (synopsis "burn-in tool for spinning rust hard disk drives")
    (description
     "Disk-spinner performs burn-in testing on traditional spinning hard
disk drives by writing AES-CTR encrypted random data and verifying
it with BLAKE3 checksums.  It supports parallel operation via rayon
for testing multiple drives simultaneously.  Full build requires
cargo-build-system with all Rust crate dependencies packaged.")
    (license license:expat)))

;;; ── 8. psn ───────────────────────────────────────────────────────────
;;; Terminal UI for process status navigation
;;; AUR: psn-git  →  Guix: psn
;;; Upstream: https://github.com/l5yth/psn (crates.io: psn)
;;; NOTE: Rust/Cargo stub.  Full build requires cargo-build-system with
;;; crate deps: ratatui, crossterm, sysinfo, nix, users, regex, anyhow.
;;;
(define-public psn
  (package
    (name "psn")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/l5yth/psn/archive/refs/tags/v"
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/psn"))
          #t)))
    (home-page "https://github.com/l5yth/psn")
    (synopsis "terminal UI for process status navigation and signal control")
    (description
     "PSN is a TUI process manager for Linux built with ratatui,
providing interactive browsing, filtering by name or PID, and signal
control of running processes.  Full build requires cargo-build-system
with all Rust crate dependencies packaged.")
    (license license:asl2.0)))

;;; ── 9. ripsecrets ────────────────────────────────────────────────────
;;; Prevent committing secret keys into source code
;;; AUR: ripsecrets  →  Guix: ripsecrets
;;; Upstream: https://github.com/sirwart/ripsecrets (crates.io: ripsecrets)
;;; NOTE: Rust/Cargo stub.  Full build requires cargo-build-system with
;;; crate deps (minimal set, primarily regex-based scanning).
;;;
(define-public ripsecrets
  (package
    (name "ripsecrets")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/sirwart/ripsecrets/archive/refs/tags/v"
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
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/ripsecrets"))
          #t)))
    (home-page "https://github.com/sirwart/ripsecrets")
    (synopsis "command-line tool to prevent committing secret keys into source code")
    (description
     "Ripsecrets scans files for high-entropy strings and known secret
key patterns (AWS keys, private keys, tokens) to prevent accidental
commits of credentials.  Designed as a pre-commit hook or CI check.
Full build requires cargo-build-system with all Rust crate
dependencies packaged.")
    (license license:expat)))

;;; ── 10. kapowarr ─────────────────────────────────────────────────────
;;; Comic book library manager in the *arr suite
;;; AUR: kapowarr  →  Guix: kapowarr
;;; Upstream: https://github.com/Casvt/Kapowarr
;;;
(define-public kapowarr
  (package
    (name "kapowarr")
    (version "1.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Casvt/Kapowarr")
             (commit (string-append "V" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kapowarr"
           #:exclude ("tests" ".github" ".gitignore" "Dockerfile"
                      "docker-compose.yml")))))
    (propagated-inputs
     (list python python-flask python-requests python-beautifulsoup4))
    (home-page "https://github.com/Casvt/Kapowarr")
    (synopsis "comic book library manager fitting in the *arr suite")
    (description
     "Kapowarr is a software to build and manage a comic book library,
designed to integrate with the *arr suite of media management tools.
It provides automated downloading, organizing, and metadata management
for comic book collections via a web interface built with Flask.")
    (license license:gpl3+)))

;;; ── 11. nut-multimedia ───────────────────────────────────────────────
;;; NUT free multimedia container format library (libnut)
;;; AUR: nut-multimedia-git  →  Guix: nut-multimedia
;;; Upstream: https://git.ffmpeg.org/nut.git
;;;
(define-public nut-multimedia
  (package
    (name "nut-multimedia")
    (version "0.0.0-1.12f6a7a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AoD314/nut")
             (commit "12f6a7a5c560d1e38fd0e150af28d85c03a6a979")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" (assoc-ref %outputs "out"))
              (string-append "LIBDIR=" (assoc-ref %outputs "out") "/lib"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://ffmpeg.org/nut.html")
    (synopsis "free multimedia container format library and utilities")
    (description
     "NUT is an open multimedia container format designed to be simple,
extensible, and error-resistant.  This package provides @code{libnut},
the reference implementation library, and associated command-line
utilities for muxing and demuxing NUT streams.  Developed as part of
the FFmpeg project ecosystem.")
    (license license:gpl2+)))

;;; ── 12. gnome-ssh-askpass4 ───────────────────────────────────────────
;;; GNOME passphrase dialog for ssh-add using gcr4
;;; AUR: gnome-ssh-askpass4-git  →  Guix: gnome-ssh-askpass4
;;; Upstream: https://github.com/openssh/openssh-portable (contrib/)
;;;
(define-public gnome-ssh-askpass4
  (package
    (name "gnome-ssh-askpass4")
    (version "9.9p1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openssh/openssh-portable")
             (commit (string-append "V_9_9_P1"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure (lambda _ #t))
          (replace 'build
            (lambda _
              (with-directory-excursion "contrib"
                (invoke "make" "gnome-ssh-askpass4"
                        (string-append
                         "CC=" (or (getenv "CC") "gcc"))
                        (string-append
                         "GTK4_CFLAGS="
                         (string-join
                          (list
                           (string-append
                            "-I" (assoc-ref %build-inputs "gtk") "/include/gtk-4.0")
                           (string-append
                            "-I" (assoc-ref %build-inputs "glib") "/include/glib-2.0"))))))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "contrib/gnome-ssh-askpass4" bin)))))))
    (native-inputs (list pkg-config))
    (inputs (list gtk gcr))
    (home-page "https://www.openssh.com/portable.html")
    (synopsis "GNOME passphrase requester for ssh-add using gcr4")
    (description
     "A graphical SSH passphrase dialog built from the OpenSSH portable
@file{contrib/} directory.  It uses the GNOME gcr4 library and GTK4
to display a secure passphrase prompt when @command{ssh-add} requests
authentication, suitable for use as @env{SSH_ASKPASS}.")
    (license license:bsd-2)))

;;; ── 13. pleaser ──────────────────────────────────────────────────────
;;; Regex-first sudo/doas alternative
;;; AUR: pleaser  →  Guix: pleaser
;;; Upstream: https://gitlab.com/edneville/please
;;; NOTE: Rust/Cargo stub.  Full build requires cargo-build-system with
;;; crate deps: regex, chrono, nix, pam, uzers, rpassword, syslog, etc.
;;;
(define-public pleaser
  (package
    (name "pleaser")
    (version "0.5.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/edneville/please")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out")
                                 "/share/pleaser"))
          #t)))
    (home-page "https://gitlab.com/edneville/please")
    (synopsis "polite regex-first sudo alternative for privilege elevation")
    (description
     "Please is a sudo/doas alternative that uses regex-based rules for
determining which users may execute which commands with elevated
privileges.  It supports PAM authentication, configurable timeouts,
and detailed logging.  Full build requires cargo-build-system with
all Rust crate dependencies packaged.")
    (license license:gpl3+)))

;;; ── 14. libsurvive ───────────────────────────────────────────────────
;;; Open-source VR lighthouse tracking library
;;; AUR: libsurvive-git  →  Guix: libsurvive
;;; Upstream: https://github.com/cntools/libsurvive
;;;
(define-public libsurvive
  (package
    (name "libsurvive")
    (version "0.0.0-1.32cf62c")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cntools/libsurvive")
             (commit "32cf62c9f23c5671ad8e36c6ffb3cf5a2dc8a89e")
             (recursive? #t)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DUSE_EIGEN=ON"
              (string-append "-DCMAKE_INSTALL_LIBDIR="
                             (assoc-ref %outputs "out") "/lib"))))
    (native-inputs (list pkg-config))
    (inputs (list hidapi libpcap zlib libusb eigen))
    (home-page "https://github.com/cntools/libsurvive")
    (synopsis "open-source lighthouse-based VR tracking library")
    (description
     "Libsurvive is an open-source library for working with SteamVR
lighthouse-based tracking systems (HTC Vive, Valve Index).  It
provides sensor fusion, calibration, and pose estimation without
depending on proprietary SteamVR runtime components.  Uses Eigen
for linear algebra computations.")
    (license license:expat)))

;;; ── 15. sddm-conf ───────────────────────────────────────────────────
;;; Configuration editor for SDDM display manager
;;; AUR: sddm-conf  →  Guix: sddm-conf
;;; Upstream: https://github.com/qtilities/sddm-conf
;;;
(define-public sddm-conf
  (package
    (name "sddm-conf")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/qtilities/sddm-conf/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX="
                             (assoc-ref %outputs "out")))))
    (native-inputs (list pkg-config qttools-5))
    (inputs (list qtbase-5))
    (home-page "https://github.com/qtilities/sddm-conf")
    (synopsis "configuration editor for the SDDM display manager")
    (description
     "SDDM-conf is a Qt5-based graphical configuration editor for the
Simple Desktop Display Manager (SDDM).  It provides a user-friendly
interface for editing SDDM settings including theme selection,
auto-login, session defaults, and display server options.")
    (license license:expat)))
