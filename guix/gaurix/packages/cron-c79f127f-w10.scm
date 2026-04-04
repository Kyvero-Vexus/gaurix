;;; Chunk-local module for blocked-tree run cron-c79f127f (worker w10).
(define-module (gaurix packages cron-c79f127f-w10)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:autoload (gnu packages) (specification->package)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (noto-fonts-emoji-blob
            redhat-fonts
            tailscale
            ttf-material-symbols-variable-git
            upd72020x-fw
            arduino-ctags
            zerotier-one
            libenv
            asroot))

(define (gaurix-alias-package alias-name target-spec)
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

(define-public noto-fonts-emoji-blob
  (package
    (name "noto-fonts-emoji-blob")
    (version "15.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/C1710/blobmoji/releases/download/v15.0/Blobmoji.ttf")
       (sha256
        (base32 "1ybqxd3nkx2ychya5jw6k2yvaw17achj4kapxwsrpfina1kxdhyw"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((font-dir (string-append #$output "/share/fonts/truetype")))
            (mkdir-p font-dir)
            (copy-file #$source (string-append font-dir "/Blobmoji.ttf"))
            #t))))
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "Blob-style color emoji font")
    (description
     "This package installs the Blobmoji TrueType font from the C1710 blobmoji
project, providing a blob-style color emoji font for desktop and terminal use.")
    (license license:asl2.0)))

(define-public redhat-fonts
  (package
    (name "redhat-fonts")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeload.github.com/RedHatOfficial/RedHatFont/tar.gz/refs/tags/"
             version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1dg5i12cficr3axji78q33nkba0lfqdqhx3g2y6bzxzh9nwb4866"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out (assoc-ref %outputs "out"))
                     (ttf-dir (string-append out "/share/fonts/truetype/redhat"))
                     (otf-dir (string-append out "/share/fonts/opentype/redhat"))
                     (license-dir (string-append out "/share/licenses/redhat-fonts")))
                (mkdir-p ttf-dir)
                (mkdir-p otf-dir)
                (for-each (lambda (file) (install-file file ttf-dir))
                          (find-files "fonts" "\\.ttf$"))
                (for-each (lambda (file) (install-file file otf-dir))
                          (find-files "fonts" "\\.otf$"))
                (mkdir-p license-dir)
                (for-each
                 (lambda (file)
                   (copy-file file (string-append license-dir "/" (basename file))))
                 '("LICENSE" "OFL.txt"))
                #t))))))
    (home-page "https://github.com/RedHatOfficial/RedHatFont")
    (synopsis "Red Hat corporate typeface family")
    (description
     "Red Hat Fonts provides the Red Hat Text, Red Hat Display, and Red Hat
Mono families in TrueType and OpenType formats.")
    (license (list license:silofl1.1 license:cc-by-sa4.0))))

(define-public tailscale
  (package
    (name "tailscale")
    (version "1.96.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://pkgs.tailscale.com/stable/tailscale_"
                           version
                           "_amd64.tgz"))
       (file-name (string-append name "-" version "-x86_64.tgz"))
       (sha256
        (base32 "1k3qx8liiqk9japnfy6v8adk6n2jkcjvixgpbsr1rydi4s4a3jx1"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out (assoc-ref %outputs "out"))
                     (bin-dir (string-append out "/bin"))
                     (default-dir (string-append out "/etc/default"))
                     (systemd-dir (string-append out "/lib/systemd/system")))
                (mkdir-p bin-dir)
                (install-file "tailscale" bin-dir)
                (install-file "tailscaled" bin-dir)
                (mkdir-p default-dir)
                (install-file "systemd/tailscaled.defaults" default-dir)
                (mkdir-p systemd-dir)
                (install-file "systemd/tailscaled.service" systemd-dir)
                #t))))))
    (home-page "https://tailscale.com")
    (synopsis "Mesh VPN client and daemon")
    (description
     "Tailscale provides a mesh VPN client and daemon that connect machines
using WireGuard-based secure networking.  This package repackages the official
x86_64 binary release tarball.")
    (license license:bsd-3)))

(define-public ttf-material-symbols-variable-git
  (gaurix-alias-package "ttf-material-symbols-variable-git"
                        "font-google-material-design-icons"))

(define-public upd72020x-fw
  (package
    (name "upd72020x-fw")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://web.archive.org/web/20240316231746if_/"
         "https://codeload.github.com/denisandroid/"
         "uPD72020x-Firmware/tar.gz/refs/tags/1.0.0"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xx2hzyp1qfs9rm6127iq6p4mkx9m7jxq728l3q2vb27wkrbk13f"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out (assoc-ref %outputs "out"))
                     (fw-dir (string-append out "/lib/firmware"))
                     (license-dir (string-append out "/share/licenses/upd72020x-fw")))
                (mkdir-p fw-dir)
                (copy-file "UPDATE.mem"
                           (string-append fw-dir "/renesas_usb_fw.mem"))
                (mkdir-p license-dir)
                (copy-file "License.rtf"
                           (string-append license-dir "/LICENSE.rtf"))
                #t))))))
    (home-page
     (string-append
      "https://web.archive.org/web/20240316231746/"
      "https://github.com/denisandroid/uPD72020x-Firmware"))
    (synopsis "Firmware for Renesas uPD720201 and uPD720202 USB 3 controllers")
    (description
     "This package installs the Renesas USB 3 controller firmware blob used by
uPD720201 and uPD720202 chipsets.")
    (license
     (license:non-copyleft
      "file://License.rtf"
      "Vendor firmware license; see bundled License.rtf."))))

(define-public arduino-ctags
  (gaurix-alias-package "arduino-ctags" "universal-ctags"))

(define-public zerotier-one
  (package
    (name "zerotier-one")
    (version "1.2.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/zerotier/ZeroTierOne/archive/"
                           version
                           ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0n035f2qslw1srxjlm0szrnvb3va3sspbpxqqhng08dp68vmn9wz"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list "CC=gcc"
              "CXX=g++"
              (string-append "DESTDIR=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://www.zerotier.com/")
    (synopsis "Virtual Ethernet network controller")
    (description
     "ZeroTier One creates software-defined virtual Ethernet networks over the
Internet and local networks, allowing endpoints to join managed peer-to-peer
overlay networks.")
    (license license:gpl3+)))

(define-public libenv
  (package
    (name "libenv")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/maandree/libenv/archive/"
                           version
                           ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "01qadp8g9incjixds37wv601pqfiw3w5kyjaxa0wrhfdfrixshkx"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list "CC=gcc"
              (string-append "PREFIX=" #$output)
              (string-append "MANPREFIX=" #$output "/share/man"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/libenv")
    (synopsis "Environment sanitation library")
    (description
     "Libenv is a C library for selecting and filtering environment variables
according to predefined policies or custom allow/deny lists.")
    (license license:isc)))

(define-public asroot
  (package
    (name "asroot")
    (version "1.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/maandree/asroot/archive/"
                           version
                           ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "09xqi96ir068qwy2z7qa7sdvridg9dzf9fah353adpzih9dlz3xg"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list "CC=gcc"
              (string-append "PREFIX=" #$output)
              (string-append "MANPREFIX=" #$output "/share/man"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list libenv (specification->package "libxcrypt")))
    (home-page "https://codeberg.org/maandree/asroot")
    (synopsis "Simpler alternative to sudo and doas")
    (description
     "Asroot is a minimal privilege escalation tool that authenticates the
invoking user and executes a command as root.")
    (license license:isc)))
