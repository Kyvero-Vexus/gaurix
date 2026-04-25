;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425f
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (3): nvidiactl-bin, ntpd-rs-bin, truckersmp-cli
;;; Already resolved (0)
;;; Already in Guix (0)
;;; Remaining BLOCKED: 97 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system python)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python-xyz)
  #:export (nvidiactl-bin
            ntpd-rs-bin
            truckersmp-cli))


;;; ---- 1. nvidiactl-bin ----
;;; AUR: nvidiactl-git (#18707) -- Dynamic fan speed and power limit
;;; adjustments for NVIDIA GPUs.
;;; Prebuilt Zig-compiled binary from Codeberg releases.
;;; License: MIT

(define-public nvidiactl-bin
  (package
    (name "nvidiactl-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/mutker/nvidiactl/releases/download/v"
                    version "/nvidiactl"))
              (sha256
               (base32
                "0bk8by1myws2cnd7khpzq3wl34ch176b7hqamjqc4fhck9lagc4j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nvidiactl" "bin/nvidiactl"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "nvidiactl")
                   (chmod "nvidiactl" #o755)))
               (delete 'install-license-files)
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin/nvidiactl"))
                          (glibc (assoc-ref inputs "glibc"))
                          (loader (string-append glibc
                                                 "/lib/ld-linux-x86-64.so.2")))
                     (invoke "patchelf" "--set-interpreter" loader bin)
                     (invoke "patchelf" "--set-rpath"
                             (string-append glibc "/lib")
                             bin)))))))
    (native-inputs (list patchelf))
    (inputs (list glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Dynamic fan speed and power limit control for NVIDIA GPUs")
    (description "Nvidiactl provides dynamic fan speed and power limit
adjustments for NVIDIA GPUs.  It monitors GPU temperature and adjusts fan
speeds accordingly, and can set custom power limits.  Requires the NVIDIA
proprietary driver to be installed.")
    (home-page "https://codeberg.org/mutker/nvidiactl")
    (license license:expat)))


;;; ---- 2. ntpd-rs-bin ----
;;; AUR: ntpd-rs-git (#18838) -- Full-featured NTP implementation in Rust.
;;; Prebuilt binaries extracted from upstream .deb package.
;;; License: Apache-2.0 / MIT dual-licensed

(define-public ntpd-rs-bin
  (package
    (name "ntpd-rs-bin")
    (version "1.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pendulum-project/ntpd-rs/releases"
                    "/download/v" version
                    "/ntpd-rs_" version "-1_amd64.deb"))
              (sha256
               (base32
                "0lv640qx8d88gabl7q9402nqih3kgvzpfv5v9zd9kh6gysqy9ga2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/ntp-daemon" "bin/ntp-daemon")
                ("usr/bin/ntp-ctl" "bin/ntp-ctl")
                ("usr/bin/ntp-metrics-exporter" "bin/ntp-metrics-exporter")
                ("usr/share/man/" "share/man/")
                ("usr/share/doc/ntpd-rs/" "share/doc/ntpd-rs/")
                ("etc/ntpd-rs/" "etc/ntpd-rs/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz")))
               (delete 'install-license-files)
               (add-after 'install 'patch-elf
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (glibc (assoc-ref inputs "glibc"))
                          (gcc-lib (assoc-ref inputs "gcc"))
                          (loader (string-append glibc
                                                 "/lib/ld-linux-x86-64.so.2"))
                          (rpath (string-append glibc "/lib:"
                                                gcc-lib "/lib")))
                     (for-each
                      (lambda (bin-name)
                        (let ((bin (string-append out "/bin/" bin-name)))
                          (invoke "patchelf" "--set-interpreter" loader bin)
                          (invoke "patchelf" "--set-rpath" rpath bin)))
                      '("ntp-daemon" "ntp-ctl" "ntp-metrics-exporter"))))))))
    (native-inputs (list patchelf))
    (inputs (list glibc `(,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (synopsis "Full-featured NTP implementation written in Rust")
    (description "Ntpd-rs is a full-featured implementation of the Network
Time Protocol, including NTS support.  It provides the @command{ntp-daemon}
service for time synchronization, @command{ntp-ctl} for status and control,
and @command{ntp-metrics-exporter} for Prometheus metrics export.")
    (home-page "https://github.com/pendulum-project/ntpd-rs")
    (license (list license:asl2.0 license:expat))))


;;; ---- 3. truckersmp-cli ----
;;; AUR: truckersmp-cli (#18838) -- Launcher for TruckersMP multiplayer.
;;; Python package from GitHub release tarball.
;;; License: MIT

(define-public truckersmp-cli
  (package
    (name "truckersmp-cli")
    (version "0.10.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/truckersmp-cli/truckersmp-cli/releases"
                    "/download/" version
                    "/truckersmp-cli-" version ".tar.xz"))
              (sha256
               (base32
                "0z7piaga23mmag1196p0wwzl8b3vp7irjxskqsrxzs0lbhl5z5id"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (propagated-inputs (list python-vdf))
    (synopsis "Launcher for TruckersMP multiplayer mod")
    (description "Truckersmp-cli is a simple launcher for TruckersMP to play
American Truck Simulator or Euro Truck Simulator 2 in multiplayer.  It
manages downloading and installing the TruckersMP mod and launching the game
through Wine or Proton.")
    (home-page "https://github.com/truckersmp-cli/truckersmp-cli")
    (license license:expat)))
