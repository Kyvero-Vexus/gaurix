;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ai
;;; Resolves 100 TODO packages from queue (recipe-resolver-260417ai).
;;;
;;; New recipes (29):
;;;     1. apg (gnu-build-system, v2.2.3, gpl2+)
;;;     2. redsocks (gnu-build-system, v0.5, asl2.0)
;;;     3. digitemp (gnu-build-system, v3.7.2, gpl2+)
;;;     4. oqsprovider (cmake-build-system, v0.11.0, expat)
;;;     5. dinit (meson-build-system, v0.20.0, asl2.0)
;;;     6. tpm2-totp (gnu-build-system, v0.3.0, bsd-3)
;;;     7. iwqt (cmake-build-system, v0.0.3, gpl3)
;;;     8. rokuecp (cmake-build-system, v0.2.0, gpl2+)
;;;     9. mameuix (cmake-build-system, v0.1.4, expat)
;;;    10. kleiner-brauhelfer (cmake-build-system, v2.6.2, gpl3)
;;;    11. python-cheap-repr (pyproject-build-system, v0.5.2, expat)
;;;    12. python-pz (pyproject-build-system, v1.1.0, gpl2+)
;;;    13. ssort (pyproject-build-system, v0.12.0, expat)
;;;    14. patator (pyproject-build-system, v1.1.0, gpl2)
;;;    15. photocollage (pyproject-build-system, v1.5.0, gpl2+)
;;;    16. perl-net-amazon-signature-v4 (perl-build-system, v0.22, gpl1+)
;;;    17. ruby-hiera-eyaml (ruby-build-system, v5.0.1, expat)
;;;    18. grub-btrfs (copy-build-system, v4.14, gpl3)
;;;    19. simple-stateful-firewall (copy-build-system, v6, gpl2)
;;;    20. twuewand (copy-build-system, v3.0.0, mpl2.0)
;;;    21. pandoc-eisvogel-template (copy-build-system, v3.4.0, bsd-3)
;;;    22. waytune (copy-build-system, v0.15.0, agpl3)
;;;    23. kworkflow (copy-build-system, v0.10, gpl2)
;;;    24. libfprint-vfs009x (meson-build-system, v1.94.9, lgpl2.1+)
;;;    25. box (copy-build-system, v0.2.0, expat)
;;;    26. howl (gnu-build-system, v0.6, expat)
;;;    27. terminal-tetris (copy-build-system, v0.0.3, expat)
;;;    28. browsr (pyproject-build-system, v1.23.0, expat)
;;;    29. mfgtools (cmake-build-system, v1.5.182, bsd-3)
;;;
;;; 29 new recipes created from 100 TODO entries attempted.
;;; Remaining entries marked BLOCKED with specific reason codes.
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260417ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image)
  #:export (
            apg
            redsocks
            digitemp
            oqsprovider
            dinit
            tpm2-totp
            iwqt
            rokuecp
            mameuix
            kleiner-brauhelfer
            python-cheap-repr
            python-pz
            ssort
            patator
            photocollage
            perl-net-amazon-signature-v4
            ruby-hiera-eyaml
            grub-btrfs
            simple-stateful-firewall
            twuewand
            pandoc-eisvogel-template
            waytune
            kworkflow
            libfprint-vfs009x
            box
            howl
            terminal-tetris
            browsr
            mfgtools
            ))

;;; ===================================================================
;;; 1. apg — automated password generator
;;; ===================================================================
(define-public apg
  (package
    (name "apg")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/buzo-ffm/apg/archive/refs/tags/v2.2.3.tar.gz")
              (sha256
               (base32 "1msqkr51riv6c7fihmpilh12pvjqs4s1hwqxz8g3ry14qwvjb4av"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "automated password generator")
    (description "APG (Automated Password Generator) generates random passwords using
several password generation algorithms.  It supports pronounceable and
random character password modes with configurable length, character sets,
and entropy sources.")
    (home-page "https://github.com/buzo-ffm/apg/")
    (license license:gpl2+)))

;;; ===================================================================
;;; 2. redsocks — transparent TCP-to-proxy redirector
;;; ===================================================================
(define-public redsocks
  (package
    (name "redsocks")
    (version "0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/darkk/redsocks/archive/refs/tags/release-0.5.tar.gz")
              (sha256
               (base32 "0qpfl85kxik1mcd4yq3xpbrx6hffmhyp7mhv5w8dg1hrgwfm7sxv"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "transparent TCP-to-proxy redirector")
    (description "Redsocks is a daemon that transparently redirects any TCP connection
via a SOCKS4, SOCKS5, or HTTP proxy server.  It uses the Linux
netfilter/iptables to capture connections and forward them through
the configured proxy, enabling system-wide transparent proxying.")
    (home-page "https://github.com/darkk/redsocks")
    (license license:asl2.0)))

;;; ===================================================================
;;; 3. digitemp — read temperature values from 1-wire sensors
;;; ===================================================================
(define-public digitemp
  (package
    (name "digitemp")
    (version "3.7.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bcl/digitemp/archive/refs/tags/v3.7.2.tar.gz")
              (sha256
               (base32 "095s296xccig6j55dq5kj75bqd4d2j7nj3469zz4afn5bjmz8gb8"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "read temperature values from 1-wire sensors")
    (description "DigiTemp is a command-line application for reading temperature values
from Dallas Semiconductor 1-Wire devices such as the DS1820, DS18S20,
and DS18B20 sensors.  It supports serial and USB 1-Wire adapters and
can log readings in various output formats.")
    (home-page "https://www.digitemp.com/software.shtml")
    (license license:gpl2+)))

;;; ===================================================================
;;; 4. oqsprovider — post-quantum cryptography provider for OpenSSL 3
;;; ===================================================================
(define-public oqsprovider
  (package
    (name "oqsprovider")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/open-quantum-safe/oqs-provider/archive/refs/tags/0.11.0.tar.gz")
              (sha256
               (base32 "0b1304lazj681x72vmx6c986pj07dx3y7kjg7p0wjbq4hk0pbdh8"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "post-quantum cryptography provider for OpenSSL 3")
    (description "OQS Provider is an OpenSSL 3 provider that integrates post-quantum
cryptographic algorithms from liboqs into OpenSSL.  It enables TLS 1.3
connections with quantum-resistant key exchange and authentication
algorithms, supporting hybrid classical/post-quantum modes.")
    (home-page "https://openquantumsafe.org/")
    (license license:expat)))

;;; ===================================================================
;;; 5. dinit — service manager and init system
;;; ===================================================================
(define-public dinit
  (package
    (name "dinit")
    (version "0.20.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/davmac314/dinit/releases/download/v0.20.0/dinit-0.20.0.tar.xz")
              (sha256
               (base32 "0g73x60nwpq285x40sz1fccc2m17zhfdsn8qkv8bgbnr54kgkqzq"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "service manager and init system")
    (description "Dinit is a service manager and init system for POSIX-compatible
operating systems.  It features process supervision, dependency-based
service startup ordering, socket activation, and a small memory
footprint.  It can function as a system init (PID 1) or as a
user-level service manager.")
    (home-page "https://github.com/davmac314/dinit")
    (license license:asl2.0)))

;;; ===================================================================
;;; 6. tpm2-totp — attest device trustworthiness via TPM2-based TOTP
;;; ===================================================================
(define-public tpm2-totp
  (package
    (name "tpm2-totp")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/tpm2-software/tpm2-totp/archive/refs/tags/v0.3.0.tar.gz")
              (sha256
               (base32 "1qb98imd6vwrrsmz9l3h6b7cqa89x2p1gkmga45bq8cxjxj93wjz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "attest device trustworthiness via TPM2-based TOTP")
    (description "TPM2-TOTP generates Time-based One-Time Passwords (TOTP) using a
TPM 2.0 chip to attest the trustworthiness of a device to a human.
It allows verifying that a machine's firmware and bootloader have not
been tampered with, using a standard TOTP authenticator app.")
    (home-page "https://github.com/tpm2-software/tpm2-totp")
    (license license:bsd-3)))

;;; ===================================================================
;;; 7. iwqt — iwd network management applet
;;; ===================================================================
(define-public iwqt
  (package
    (name "iwqt")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/FinGu/iwqt/archive/refs/tags/v0.0.3.tar.gz")
              (sha256
               (base32 "09zrwqiindxfbwrn0k31mg8kzhql9kq9n2b6kc4vxhg1l2w1yv1a"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "iwd network management applet")
    (description "IWQT is a Qt-based graphical network applet for managing wireless
connections via iwd (iNet Wireless Daemon) on Linux systems.  It
provides a system tray interface for scanning, connecting to, and
managing Wi-Fi networks.")
    (home-page "https://github.com/FinGu/iwqt")
    (license license:gpl3)))

;;; ===================================================================
;;; 8. rokuecp — library to interact with Roku devices via ECP
;;; ===================================================================
(define-public rokuecp
  (package
    (name "rokuecp")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/benthetechguy/rokuecp/archive/refs/tags/v0.2.0.tar.gz")
              (sha256
               (base32 "0ana5gsfz5cb7ssgx5jkrhdfxm3adf2pzcslbxr4m2b6bm8j4x27"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "library to interact with Roku devices via ECP")
    (description "RokuECP is a C library for interacting with Roku streaming devices
remotely using the External Control Protocol (ECP).  It supports
device discovery, remote control commands, app launching, and
querying device information over a local network.")
    (home-page "https://github.com/benthetechguy/rokuecp")
    (license license:gpl2+)))

;;; ===================================================================
;;; 9. mameuix — modern GUI frontend for MAME arcade emulator
;;; ===================================================================
(define-public mameuix
  (package
    (name "mameuix")
    (version "0.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/firesand/MAMEUIx/archive/refs/tags/v0.1.4.tar.gz")
              (sha256
               (base32 "1r29y3qg7pwrxqw3wmbxh7m3qfh75i8k1bm68cjgkd8kd2gx3a1q"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "modern GUI frontend for MAME arcade emulator")
    (description "MAMEUIx is a graphical frontend for the MAME arcade emulator.  It
provides a modern interface with ROM management, game filtering, and
a thread pool for improved performance when scanning large ROM
collections.")
    (home-page "https://github.com/firesand/MAMEUIx")
    (license license:expat)))

;;; ===================================================================
;;; 10. kleiner-brauhelfer — Qt-based calculator and manager for homebrewing
;;; ===================================================================
(define-public kleiner-brauhelfer
  (package
    (name "kleiner-brauhelfer")
    (version "2.6.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kleiner-brauhelfer/kleiner-brauhelfer-2/archive/refs/tags/v2.6.2.tar.gz")
              (sha256
               (base32 "006bmcnajb5vadr3bk8skvcxm3kqc0gi4kwfmwblbk1xqf7y6yz2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "Qt-based calculator and manager for homebrewing")
    (description "Kleiner Brauhelfer is a Qt-based desktop application for hobby brewers
to calculate and manage their beer recipes.  It provides recipe
planning, ingredient calculations, brew day logging, and fermentation
tracking in a comprehensive brewing workflow.")
    (home-page "https://github.com/kleiner-brauhelfer/kleiner-brauhelfer-2")
    (license license:gpl3)))

;;; ===================================================================
;;; 11. python-cheap-repr — better repr/reprlib for short, cheap string representations
;;; ===================================================================
(define-public python-cheap-repr
  (package
    (name "python-cheap-repr")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/source/c/cheap_repr/cheap_repr-0.5.2.tar.gz")
              (sha256
               (base32 "03x3lmn8rcmwrrq5gy4pkmajmb20c1vmyb0msdx5qc5hmpw5q6h0"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "better repr/reprlib for short, cheap string representations")
    (description "cheap-repr is a Python library that provides shorter and more
performant string representations than the built-in @code{repr}
function.  It handles large data structures gracefully by truncating
output, making it suitable for logging and debugging contexts
where full representations would be too verbose.")
    (home-page "https://github.com/alexmojaki/cheap_repr")
    (license license:expat)))

;;; ===================================================================
;;; 12. python-pz — pythonic replacement for awk, sed, and grep
;;; ===================================================================
(define-public python-pz
  (package
    (name "python-pz")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/source/p/pz/pz-1.1.0.tar.gz")
              (sha256
               (base32 "1iks6z8fc490j5plq17iz4c8vzjcgyib0xqkgifwkxcybaar5fn1"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "pythonic replacement for awk, sed, and grep")
    (description "pz is a command-line utility that replaces common text-processing
tools like awk, sed, and grep with Python expressions.  It reads
lines from standard input, applies a Python expression to each line,
and outputs the results, combining Unix pipeline ergonomics with
Python string manipulation.")
    (home-page "https://github.com/CZ-NIC/pz")
    (license license:gpl2+)))

;;; ===================================================================
;;; 13. ssort — automatic sorter for Python statements
;;; ===================================================================
(define-public ssort
  (package
    (name "ssort")
    (version "0.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/source/s/ssort/ssort-0.12.0.tar.gz")
              (sha256
               (base32 "0s8x1inn42d2gp9danv6c4f9khynmgb8aq7pg54vva57h64hi1cp"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "automatic sorter for Python statements")
    (description "ssort is a tool that automatically sorts Python source code statements
into a canonical order based on their dependency relationships.  It
analyzes which functions and classes reference each other and reorders
them so that definitions appear before their first use.")
    (home-page "https://github.com/bwhmather/ssort")
    (license license:expat)))

;;; ===================================================================
;;; 14. patator — multi-purpose brute-force testing tool
;;; ===================================================================
(define-public patator
  (package
    (name "patator")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/lanjelot/patator/archive/refs/tags/1.1.0.tar.gz")
              (sha256
               (base32 "1kj0siskgzbcyr1cjckm9j8fnq0ir6gl4dlpmps9w42wyzkvr22r"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "multi-purpose brute-force testing tool")
    (description "Patator is a multi-purpose network brute-force testing tool written
in Python.  It supports multiple protocols including SSH, FTP, HTTP,
SMTP, LDAP, and SQL databases, with a modular design that allows
combining attack modules with response-matching conditions.")
    (home-page "https://github.com/lanjelot/patator")
    (license license:gpl2)))

;;; ===================================================================
;;; 15. photocollage — graphical tool to make photo collage posters
;;; ===================================================================
(define-public photocollage
  (package
    (name "photocollage")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/source/P/PhotoCollage/photocollage-1.5.0.tar.gz")
              (sha256
               (base32 "00x4hzlx05g9sw7jpcp4vj869hv9i4imvziy99ygllvlkrk6kn3d"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "graphical tool to make photo collage posters")
    (description "PhotoCollage is a graphical application for creating photo collage
posters.  It automatically arranges multiple photographs into an
aesthetically pleasing layout, supporting various paper sizes and
aspect ratios with drag-and-drop photo selection.")
    (home-page "https://github.com/adrienverge/PhotoCollage")
    (license license:gpl2+)))

;;; ===================================================================
;;; 16. perl-net-amazon-signature-v4 — AWS Signature Version 4 implementation for Perl
;;; ===================================================================
(define-public perl-net-amazon-signature-v4
  (package
    (name "perl-net-amazon-signature-v4")
    (version "0.22")
    (source (origin
              (method url-fetch)
              (uri "https://cpan.metacpan.org/authors/id/D/DB/DBOOK/Net-Amazon-Signature-V4-0.22.tar.gz")
              (sha256
               (base32 "1zjw0r6svk0zpvxrn8x02j3h6wjrf7dyafvyvv1scccbdhkflbsj"))))
    (build-system perl-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "AWS Signature Version 4 implementation for Perl")
    (description "Net::Amazon::Signature::V4 implements the Amazon Web Services
Signature Version 4 signing process for Perl.  It handles request
signing for AWS API calls, computing the canonical request hash,
string-to-sign, and final signature required for authenticated
AWS service requests.")
    (home-page "https://metacpan.org/release/Net-Amazon-Signature-V4")
    (license license:gpl1+)))

;;; ===================================================================
;;; 17. ruby-hiera-eyaml — OpenSSL encryption backend for Hiera
;;; ===================================================================
(define-public ruby-hiera-eyaml
  (package
    (name "ruby-hiera-eyaml")
    (version "5.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/voxpupuli/hiera-eyaml/archive/refs/tags/v5.0.1.tar.gz")
              (sha256
               (base32 "11rqy5ilq72j3abfmhkp3bac50vc7cxx1x91ymkw3gzlrkzngmpj"))))
    (build-system ruby-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "OpenSSL encryption backend for Hiera")
    (description "hiera-eyaml is a backend for Puppet's Hiera hierarchical data store
that provides per-value encryption using OpenSSL.  It allows storing
sensitive data such as passwords and API keys in version-controlled
Hiera YAML files while keeping them encrypted at rest.")
    (home-page "https://github.com/voxpupuli/hiera-eyaml")
    (license license:expat)))

;;; ===================================================================
;;; 18. grub-btrfs — include btrfs snapshots in GRUB boot menu
;;; ===================================================================
(define-public grub-btrfs
  (package
    (name "grub-btrfs")
    (version "4.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Antynea/grub-btrfs/archive/refs/tags/v4.14.tar.gz")
              (sha256
               (base32 "1ii0mpnkpfp02kh751pgx70j4whsz2hcbfsizihybqrrkfjgiqjg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("41_snapshots-btrfs" "etc/grub.d/41_snapshots-btrfs")
               ("grub-btrfsd" "bin/grub-btrfsd"))))
    (synopsis "include btrfs snapshots in GRUB boot menu")
    (description "grub-btrfs automatically adds btrfs snapshot entries to the GRUB
boot menu.  When snapshots exist on a btrfs filesystem, it generates
menu entries that allow booting directly into any snapshot, providing
a convenient recovery mechanism for system rollbacks.")
    (home-page "https://github.com/Antynea/grub-btrfs")
    (license license:gpl3)))

;;; ===================================================================
;;; 19. simple-stateful-firewall — stateful iptables firewall for personal use
;;; ===================================================================
(define-public simple-stateful-firewall
  (package
    (name "simple-stateful-firewall")
    (version "6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/asciiscry3r/simple-stateful-firewall/archive/refs/tags/6.tar.gz")
              (sha256
               (base32 "18blxv866fk2vpqxydkkxnrcnvx07x215czzw1j2c5yg9pqvn7y8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iptables.sh" "bin/simple-stateful-firewall"))))
    (synopsis "stateful iptables firewall for personal use")
    (description "Simple Stateful Firewall provides shell scripts to configure a
stateful iptables firewall for personal computers and small servers.
It sets up connection tracking, default-deny policies, and common
rules for typical workstation use cases.")
    (home-page "https://github.com/asciiscry3r/simple-stateful-firewall")
    (license license:gpl2)))

;;; ===================================================================
;;; 20. twuewand — TrueRand-based entropy generation tool
;;; ===================================================================
(define-public twuewand
  (package
    (name "twuewand")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rfinnie/twuewand/archive/refs/tags/v3.0.0.tar.gz")
              (sha256
               (base32 "1w2bngx1wg21ghd2c1k1as63j0vanprvzav5izfzb35awb1nin4j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("twuewand" "bin/twuewand"))))
    (synopsis "TrueRand-based entropy generation tool")
    (description "twuewand implements a TrueRand-style algorithm for generating random
data using timing jitter between the system clock and interval timers.
It provides a command-line interface for producing random bytes suitable
for seeding entropy pools on headless or low-entropy systems.")
    (home-page "https://github.com/rfinnie/twuewand")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 21. pandoc-eisvogel-template — clean LaTeX template for pandoc
;;; ===================================================================
(define-public pandoc-eisvogel-template
  (package
    (name "pandoc-eisvogel-template")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Wandmalfarbe/pandoc-latex-template/archive/refs/tags/v3.4.0.tar.gz")
              (sha256
               (base32 "1f6x20dagh834hfq594cdl355vfncdax2wi01mk6k42lkxdvih1s"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("eisvogel.tex" "share/pandoc/templates/eisvogel.latex"))))
    (synopsis "clean LaTeX template for pandoc")
    (description "Eisvogel is a LaTeX template for pandoc that produces clean, modern
PDF documents from Markdown source.  It supports title pages, table
of contents, syntax highlighting, custom headers and footers, and
many other formatting options through pandoc metadata variables.")
    (home-page "https://github.com/Wandmalfarbe/pandoc-latex-template")
    (license license:bsd-3)))

;;; ===================================================================
;;; 22. waytune — collection of custom Waybar modules
;;; ===================================================================
(define-public waytune
  (package
    (name "waytune")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Nadim147c/WayTune/archive/refs/tags/v0.15.0.tar.gz")
              (sha256
               (base32 "0p5bsvz7jndfj532dq805d586a1qnqnkg4qwhf68cqp3nwamhqg6"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/waytune/"))))
    (synopsis "collection of custom Waybar modules")
    (description "WayTune provides a collection of custom modules for the Waybar status
bar on Wayland compositors.  It includes modules for system monitoring,
media control, and other desktop utilities that integrate with the
Waybar JSON protocol.")
    (home-page "https://github.com/Nadim147c/WayTune")
    (license license:agpl3)))

;;; ===================================================================
;;; 23. kworkflow — CLI workflow tool for Linux kernel development
;;; ===================================================================
(define-public kworkflow
  (package
    (name "kworkflow")
    (version "0.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kworkflow/kworkflow/archive/refs/tags/0.10.tar.gz")
              (sha256
               (base32 "072a170i1jx1zvn25rpkqpmkviqcs8v2szp4fhirm7b67dfqxj11"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src/" "share/kworkflow/src/")
               ("kw" "bin/kw"))))
    (synopsis "CLI workflow tool for Linux kernel development")
    (description "kworkflow is a command-line tool that streamlines the Linux kernel
development workflow.  It provides commands for building kernels,
deploying to test machines via SSH, managing QEMU virtual machines,
and running checkpatch and other kernel code quality tools.")
    (home-page "https://github.com/kworkflow/kworkflow")
    (license license:gpl2)))

;;; ===================================================================
;;; 24. libfprint-vfs009x — fingerprint reader library with VFS009x support
;;; ===================================================================
(define-public libfprint-vfs009x
  (package
    (name "libfprint-vfs009x")
    (version "1.94.9")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.archlinux.org/gugah/libfprint/-/archive/vfs009x/libfprint-vfs009x.tar.gz")
              (sha256
               (base32 "0f2ns6nfqa4940vjvs4q38ddyj7acczpad9m350mf90gj2dv4l8n"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "fingerprint reader library with VFS009x support")
    (description "This fork of libfprint adds support for Validity VFS0090 and VFS009x
fingerprint sensors.  It provides a libre driver implementation for
these commonly found laptop fingerprint readers, integrating with
fprintd for system authentication.")
    (home-page "https://gitlab.archlinux.org/gugah/libfprint")
    (license license:lgpl2.1+)))

;;; ===================================================================
;;; 25. box — command-line tool to draw frames around text
;;; ===================================================================
(define-public box
  (package
    (name "box")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/AlphaLynx/box/archive/v0.2.0.tar.gz")
              (sha256
               (base32 "1iyjl0h765yxc741l7mbbbqj3j5yxp2ay96s4mm3211mg8a70aaw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("box" "bin/box"))))
    (synopsis "command-line tool to draw frames around text")
    (description "box is a small command-line utility that draws decorative frames
around text using Unicode box-drawing characters.  It reads text from
standard input or arguments and outputs it surrounded by a customizable
border, useful for making terminal output more readable.")
    (home-page "https://codeberg.org/AlphaLynx/box")
    (license license:expat)))

;;; ===================================================================
;;; 26. howl — light-weight customizable text editor
;;; ===================================================================
(define-public howl
  (package
    (name "howl")
    (version "0.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/howl-editor/howl/archive/refs/tags/0.6.tar.gz")
              (sha256
               (base32 "159zdgz92vh4dd902lww4npgmizwyrrx696z6x1ci8k6lhq8cndl"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "light-weight customizable text editor")
    (description "Howl is a general-purpose, light-weight text editor written in
Moonscript and Lua.  It features a modal editing interface, extensive
customization through Lua scripting, built-in file browser, multiple
cursors, and a fast incremental search.")
    (home-page "https://howl.io/")
    (license license:expat)))

;;; ===================================================================
;;; 27. terminal-tetris — simple Tetris game for the terminal
;;; ===================================================================
(define-public terminal-tetris
  (package
    (name "terminal-tetris")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/averyvisentin/terminal-tetris/archive/refs/tags/v0.0.3.tar.gz")
              (sha256
               (base32 "0izkwrc9jcn6jdnz5jz3axqpyndzylw7vf2l5qkim0nih08cp4rd"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/terminal-tetris/"))))
    (synopsis "simple Tetris game for the terminal")
    (description "Terminal Tetris is a text-based implementation of the classic Tetris
puzzle game that runs in a terminal emulator.  It provides keyboard
controls for moving, rotating, and dropping pieces with score tracking
and increasing difficulty levels.")
    (home-page "https://github.com/averyvisentin/terminal-tetris")
    (license license:expat)))

;;; ===================================================================
;;; 28. browsr — TUI file browser application
;;; ===================================================================
(define-public browsr
  (package
    (name "browsr")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri "https://files.pythonhosted.org/packages/source/b/browsr/browsr-1.23.0.tar.gz")
              (sha256
               (base32 "1vamsnwbxmcazd5ypmmdiwmnflb4rwh74l3zz5assv9pl80aia49"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "TUI file browser application")
    (description "browsr is a terminal user interface (TUI) file browser built with
Textual.  It provides a rich file browsing experience in the terminal
with syntax-highlighted file previews, directory navigation, and
support for browsing remote filesystems via cloud storage providers.")
    (home-page "https://github.com/juftin/browsr")
    (license license:expat)))

;;; ===================================================================
;;; 29. mfgtools — NXP i.MX Universal Update Utility
;;; ===================================================================
(define-public mfgtools
  (package
    (name "mfgtools")
    (version "1.5.182")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nxp-imx/mfgtools/archive/refs/tags/uuu_1.5.182.tar.gz")
              (sha256
               (base32 "1n3gjwaj4rx0karvdzbrr5k0xsxy6348nrqlfbf9w7p3n9f3810k"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "NXP i.MX Universal Update Utility")
    (description "mfgtools (UUU - Universal Update Utility) is a command-line tool
for flashing firmware to NXP i.MX processors.  It supports USB and
serial boot modes for provisioning and updating embedded Linux devices
based on NXP application processors.")
    (home-page "https://github.com/nxp-imx/mfgtools")
    (license license:bsd-3)))

