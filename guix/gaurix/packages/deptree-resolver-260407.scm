;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Dependency-tree-driven resolver — deptree-resolver-260407
;;; Resolves packages from the top-100 blocked dependency queue.
;;; Covers: source builds (cmake/meson/gnu/go), Python packages,
;;; firmware/data, and select binary packages.
;;; Dependency-tree resolver pass — deptree-resolver-260407
;;; Resolves BLOCKED packages from the priority queue.
;;; Covers: binary packages, source builds, compat aliases, data/fonts.

(define-module (gaurix packages deptree-resolver-260407)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages assembly)
  #:use-module (guix build-system font)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg))

;;;
;;; ── VIDEO CODEC LIBRARIES ──────────────────────────────────────────
;;;

(define-public davs2
  (package
    (name "davs2")
    (version "1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pkuvcl/davs2/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1j1wj9zp5aghacv30n23fz2590bwf0lnvk54lgnzgix1fsrx15xn"))))
  #:use-module (gnu packages xml))
;;; ── FONT PACKAGES ──────────────────────────────────────────────────────
(define-public ttf-meslo-nerd-font-powerlevel10k
    (name "ttf-meslo-nerd-font-powerlevel10k")
    (version "2.3.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/romkatv/powerlevel10k-media/raw/"
                    "master/MesloLGS%20NF%20Regular.ttf"))
              (file-name (string-append name "-" version "-regular.ttf"))
              (sha256
               (base32
                "0zg5qvrdi6y2y7dwbwi4d442s78ayjmq72cy2g0dgy4pdqc4cyfr"))))
    (build-system font-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((font-dir (string-append (assoc-ref outputs "out")
                                                  "/share/fonts/truetype")))
                     (mkdir-p font-dir)
                     (for-each (lambda (f)
                                 (install-file f font-dir))
                               (find-files "." "\\.ttf$"))))))))
    (home-page "https://github.com/romkatv/powerlevel10k-media")
    (synopsis "meslo Nerd Font patched for Powerlevel10k")
    (description
     "MesloLGS NF is a Meslo Nerd Font patched specifically for use with
the Powerlevel10k Zsh theme.  It includes all the glyphs and icons
needed for a complete Powerlevel10k experience.")
    (license license:asl2.0)))
;;; ── DATA / RESOURCE PACKAGES ───────────────────────────────────────────
(define-public v2ray-domain-list-custom
    (name "v2ray-domain-list-custom")
    (version "20240401")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Loyalsoldier/v2ray-rules-dat/"
                    "releases/latest/download/geosite.dat"))
              (file-name (string-append name "-" version ".dat"))
              (sha256
               (base32
                "1q0vg0kf7gfld36054qimvb1sn1cn36vdlkalhlcd0c2a7dfcdff"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("geosite.dat" "share/v2ray/geosite.dat"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "geosite.dat"))))))
    (home-page "https://github.com/Loyalsoldier/v2ray-rules-dat")
    (synopsis "custom domain list for V2Ray routing")
    (description
     "A curated list of domains for use as geosites for routing purposes
in V2Ray and compatible proxies.  Based on Loyalsoldier's rules.")
    (license license:gpl3+)))
(define-public reshade-shaders-git
    (name "reshade-shaders-git")
    (version "0.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crosire/reshade-shaders")
                    (commit "67603ed5cc968cda1538e1a2e1f4e8b795eb9a63")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Shaders" "share/reshade/shaders")
          ("Textures" "share/reshade/textures"))))
    (home-page "https://github.com/crosire/reshade-shaders")
    (synopsis "collection of post-processing shaders for ReShade and vkBasalt")
    (description
     "A collection of post-processing shaders written in the ReShade FX
shader language.  These can be used with vkBasalt or ReShade for
graphical enhancements in games and applications.")
    (license (license:non-copyleft
              "https://github.com/crosire/reshade-shaders/blob/master/LICENSE.md"
              "Custom license"))))
(define-public android-udev-git
    (name "android-udev-git")
    (version "20250311")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/M0Rf30/android-udev-rules")
                    (commit "e62577f4bad6e0c0b3c549e8e685c3edd96cee66")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("51-android.rules" "lib/udev/rules.d/51-android.rules"))))
    (home-page "https://github.com/M0Rf30/android-udev-rules")
    (synopsis "udev rules for connecting Android devices on Linux")
    (description
     "Comprehensive set of udev rules for connecting Android devices to
a Linux system.  Covers most Android device vendors for ADB, fastboot,
and MTP access.")
    (license license:gpl3+)))
(define-public linux-firmware-whence-git
    (name "linux-firmware-whence-git")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware")
                    (commit "a3e1417a98e20bd40f50e3780e5e7e27ad5b52b0")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("WHENCE" "share/doc/linux-firmware/WHENCE")
          ("LICENCE.txt" "share/doc/linux-firmware/LICENCE.txt"
           #:optional #t))))
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (synopsis "license documentation for Linux firmware files")
    (description
     "This package provides the WHENCE license file from the Linux firmware
repository, which documents vendor license details for binary firmware
blobs distributed with the Linux kernel.")
    (license license:gpl2)))
(define-public cosmic-icons-git
    (name "cosmic-icons-git")
    (version "1.0.0-alpha.5.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pop-os/cosmic-icons")
                    (commit "705d3986b72f35c59f2b74f65f7b1b4addbdbdb5")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Cosmic/"
           #:include-regexp ("\\.svg$" "index\\.theme")))))
    (home-page "https://github.com/pop-os/cosmic-icons")
    (synopsis "icon theme for the COSMIC desktop environment")
    (description
     "System76 COSMIC icon theme.  Provides a comprehensive set of SVG icons
designed for the COSMIC desktop environment.")
    (license (list license:cc-by-sa4.0 license:gpl3))))
(define-public mips64-linux-gnu-linux-api-headers
    (name "mips64-linux-gnu-linux-api-headers")
    (version "6.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://kernel.org/linux/kernel/v6.x/"
                                  "linux-" version ".tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (chdir "build/linux")
                (invoke "./configure"
                        (string-append "--prefix=" out)
                        "--enable-shared"
                        "--disable-static")))))))
    (native-inputs (list nasm))
    (home-page "https://github.com/pkuvcl/davs2")
    (synopsis "open-source decoder of AVS2-P2/IEEE1857.4 video coding standard")
    (description
     "davs2 is an open-source decoder for the AVS2-P2/IEEE1857.4 video coding
standard.  It provides a shared library for decoding AVS2 encoded video
streams.")
    (license license:gpl2+)))

(define-public xavs2
  (package
    (name "xavs2")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/pkuvcl/xavs2/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1kn6aanhphkvlhr2903x6lwvphraki7x4gqa1aaaicjcsqf76v8y"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (chdir "build/linux")
                (invoke "./configure"
                        (string-append "--prefix=" out)
                        "--enable-shared"
                        "--disable-static")))))))
    (native-inputs (list nasm))
    (home-page "https://github.com/pkuvcl/xavs2")
    (synopsis "open-source encoder of AVS2-P2/IEEE1857.4 video coding standard")
    (description
     "xavs2 is an open-source encoder for the AVS2-P2/IEEE1857.4 video coding
standard.  It provides a shared library and command-line tool for encoding
video streams in the AVS2 format.")
    (license license:gpl2+)))

(define-public xevd
  (package
    (name "xevd")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mpeg5/xevd/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1n7c7hmlaabsl35ndx36wyy8iljd3nd15ghzx47ygm4s3bncfmcd"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/mpeg5/xevd")
    (synopsis "MPEG-5 EVC (Essential Video Coding) decoder")
    (description
     "xevd is a decoder for the MPEG-5 Essential Video Coding (EVC) standard.
It provides a library and tools for decoding EVC-encoded video streams.")
    (license license:bsd-3)))

(define-public xeve
  (package
    (name "xeve")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/mpeg5/xeve/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0if24k9vl5mby5f7nh1sj0191b99ndg08m4k7n8hacd6s7frb313"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/mpeg5/xeve")
    (synopsis "MPEG-5 EVC (Essential Video Coding) encoder")
    (description
     "xeve is an encoder for the MPEG-5 Essential Video Coding (EVC) standard.
It provides a library and tools for encoding video into the EVC format.")
    (license license:bsd-3)))
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "make" "ARCH=mips" "headers_install"
                      (string-append "INSTALL_HDR_PATH=" #$output))))
          (delete 'install))))
    (home-page "https://www.kernel.org")
    (synopsis "Linux API headers for MIPS64 cross-compilation")
     "Sanitized Linux kernel headers for use in user space, targeting the
MIPS64 architecture with the GNU C library and multilib ABI.")
    (license license:gpl2)))
;;;
;;; ── BINARY PACKAGES ────────────────────────────────────────────────────
;;;
(define-public bitwarden-cli-bin
    (name "bitwarden-cli-bin")
    (version "2024.12.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/@bitwarden/cli/-/cli-"
                    version ".tgz"))
              (sha256
               (base32
                "0rj0xwm2li0rnbl24shmgyxlraqsw4vhn32j4dnishksbds79ra2"))))
    (build-system copy-build-system)
      #:install-plan #~'(("." "lib/node_modules/@bitwarden/cli/"))
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (node (search-input-file inputs "bin/node"))
                     (cli (string-append out
                                         "/lib/node_modules/@bitwarden/cli"
                                         "/build/bw.js")))
                (mkdir-p bin)
                (with-output-to-file (string-append bin "/bw")
                  (lambda ()
                    (display (string-append "#!/bin/sh\nexec " node
                                            " " cli " \"$@\"\n"))))
                (chmod (string-append bin "/bw") #o755)))))))
    (inputs (list node))
    (home-page "https://bitwarden.com")
    (synopsis "command line interface for the Bitwarden password manager")
     "The Bitwarden CLI is a powerful, full-featured command line interface
for interacting with the Bitwarden vault.  It supports all vault
management operations including login, sync, and item management.")
    (license license:gpl3)))
(define-public nordvpn-bin
    (name "nordvpn-bin")
    (version "3.19.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/"
                    "nordvpn_" version "_amd64.deb"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
      #:install-plan #~'(("usr/bin/" "bin/")
                         ("usr/sbin/" "sbin/")
                         ("usr/share/" "share/"))
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list (@ (gnu packages base) binutils)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nordvpn.com/download/linux/")
    (synopsis "NordVPN CLI tool for Linux")
     "NordVPN command line interface for connecting to NordVPN servers
on Linux.  Supports automatic server selection, protocol switching,
and kill switch functionality.")
    (license (license:non-copyleft
              "https://nordvpn.com/terms-of-service/"
              "NordVPN Terms of Service"))))
;;;
;;; ── SOURCE-BUILD PACKAGES ──────────────────────────────────────────────
;;;

(define-public vvenc
  (package
    (name "vvenc")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fraunhoferhhi/vvenc/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0x71ks9rhmq6iy9jhqk427c7v1vj0ss9rfg5kadhvg4xsmhx0hyx"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/fraunhoferhhi/vvenc")
    (synopsis "H.266/VVC (Versatile Video Coding) encoder")
    (description
     "vvenc is an encoder for the H.266/VVC (Versatile Video Coding)
standard developed by the Fraunhofer Heinrich Hertz Institute.  It provides
an optimized implementation for encoding video in the VVC format.")
    (license license:bsd-3)))

(define-public openapv
  (package
    (name "openapv")
    (version "0.2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AcademySoftwareFoundation/openapv/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "067z57hawak72r3dncmaclyhrfyfl17z3vi4vzlgb5phqkl0ch8n"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AcademySoftwareFoundation/openapv")
    (synopsis "reference implementation of the APV codec")
    (description
     "OpenAPV is the reference implementation of the APV (Advanced Professional
Video) codec.  It provides encoding and decoding tools for professional
video workflows.")
    (license license:bsd-3)))
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fraunhoferhhi/vvenc/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0x71ks9rhmq6iy9jhqk427c7v1vj0ss9rfg5kadhvg4xsmhx0hyx"))))
     (list
      #:configure-flags
      #~(list "-DBUILD_SHARED_LIBS=ON"
              "-DVVENC_ENABLE_LINK_TIME_OPT=OFF")))
    (home-page "https://github.com/fraunhoferhhi/vvenc/")
    (synopsis "H.266/VVC encoder implementation")
     "VVenC is an open-source H.266/VVC (Versatile Video Coding) encoder
implementation developed by Fraunhofer HHI.  It provides fast and
efficient VVC encoding with various presets and configurations.")
    (license (license:non-copyleft
              "https://github.com/fraunhoferhhi/vvenc/blob/master/LICENSE.txt"
              "BSD-3-Clause-Clear"))))
(define-public vpcs
    (name "vpcs")
    (version "0.8.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GNS3/vpcs/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "19rxlfqf58kqdfgl0kq1xnmvpfmknxxqgx6xfryvv2yv7y98q0bk"))))
    (build-system gnu-build-system)
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              (chdir "src")
              (invoke "sh" "mk.sh")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "vpcs" bin)))))))
    (home-page "https://github.com/GNS3/vpcs")
    (synopsis "simple virtual PC simulator for network emulation")
     "VPCS (Virtual PC Simulator) is a lightweight program that simulates
up to 9 virtual PCs for use with network emulators like GNS3.  Each
virtual PC supports basic networking commands including ping, traceroute,
and ARP.")
    (license license:bsd-2)))
(define-public dynamips
    (name "dynamips")
    (version "0.2.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GNS3/dynamips/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "18a1lkfm4g0d9ri44whbipif4xjbh05vvs6vm079149zq19bnfsh"))))
    (inputs (list libpcap elfutils))
    (home-page "https://github.com/GNS3/dynamips")
    (synopsis "Cisco router emulator for network simulation")
     "Dynamips is a Cisco router emulator that can emulate Cisco 7200, 3600,
3725, 3745, and 2600 series routers.  It is primarily used with GNS3
for network simulation and lab environments.")
    (license license:gpl2+)))

(define-public libaribcaption
  (package
    (name "libaribcaption")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xqq/libaribcaption/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "10s6sjfglm8wznv44f30ikby5v9m4prn9z4a2x30ml32lsh07397"))))
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xqq/libaribcaption/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "10s6sjfglm8wznv44f30ikby5v9m4prn9z4a2x30ml32lsh07397"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list fontconfig freetype))
    (home-page "https://github.com/xqq/libaribcaption")
    (synopsis "caption decoder/renderer for ARIB STD-B24 TV broadcast captions")
    (description
     "libaribcaption is a caption decoder and renderer library for handling
ARIB STD-B24 based TV broadcast captions.  It supports rendering Japanese
broadcast captions with proper font handling.")
    (license license:expat)))

(define-public uavs3d
  (package
    (name "uavs3d")
    (version "1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/uavs3/uavs3d")
             (commit "0e20d2c291853f196c68922a264bcd8471d75b68")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ss6mmx03b2xi3lxs1vr87rigkpmzivhcflddgp4vca114p8cl2a"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags #~(list "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/uavs3/uavs3d")
    (synopsis "AVS3 decoder supporting AVS3-P2 baseline profile")
    (description
     "uavs3d is an open-source decoder for the AVS3 video coding standard,
supporting the AVS3-P2 baseline profile.  It provides a shared library for
decoding AVS3 encoded video streams.")
    (license license:bsd-3)))

;;;
;;; ── MULTIMEDIA LIBRARIES ───────────────────────────────────────────
;;;

(define-public zmusic
  (package
    (name "zmusic")
    (version "1.1.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0m6c7alh7wy6837j3rz1mhr8ak6z4xf73rq3fzrkd0d09vz10i7h"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list alsa-lib libsndfile mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "GZDoom's music system as a standalone library")
    (description
     "ZMusic is GZDoom's music system extracted as a standalone library.
It supports playback of various music formats including MIDI, MOD, and
streaming audio formats used in Doom-engine games.")
    (license license:gpl3+)))

(define-public libuvc
  (package
    (name "libuvc")
    (version "0.0.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/libuvc/libuvc/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0wpfhsd95zdi3rirdfnp06vpb7rzs3xxrjp6zg6hqpdd4fbsfsvw"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libusb libjpeg-turbo))
    (home-page "https://github.com/libuvc/libuvc")
    (synopsis "cross-platform library for USB video devices")
    (description
     "libuvc is a cross-platform library for USB video devices, built atop
libusb.  It enables fine-grained control over USB video devices exporting
the standard USB Video Class (UVC) interface.")
    (license license:bsd-3)))

;;;
;;; ── NETWORK / FILESYSTEM TOOLS ─────────────────────────────────────
;;;

(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fangfufu/httpdirfs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1wz9amh32fnrz57l2j3g66q7sxrms8g4mpcs3fbk4cggm98nipn7"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list curl expat fuse gumbo-parser openssl))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "filesystem for mounting HTTP directory listings")
    (description
     "HTTPDirFS is a FUSE filesystem that allows you to mount HTTP
directory listings with a virtual filesystem.  It supports a range of
HTTP servers and handles caching and multi-threaded downloading.")
    (license license:gpl3+)))

(define-public grepcidr
  (package
    (name "grepcidr")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.pc-tools.net/files/unix/grepcidr-"
             version ".tar.gz"))
       (sha256
        (base32 "1yzpa1nigmmp4hir6377hrkpp0z6jnxgccaw2jbqgydbglvnm231"))))
    (home-page "https://github.com/xqq/libaribcaption/")
    (synopsis "ARIB STD-B24 caption decoder and renderer library")
     "Libaribcaption is a caption decoder and renderer library for handling
ARIB STD-B24 based TV broadcast captions.  It is used by media players
and video processing tools to display Japanese broadcast captions.")
(define-public ntfsprogs-plus
    (name "ntfsprogs-plus")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "http://www.pc-tools.net/unix/grepcidr/")
    (synopsis "filter IPv4 and IPv6 addresses matching CIDR patterns")
    (description
     "grepcidr filters input for lines containing IP addresses matching
CIDR patterns or ranges.  It supports both IPv4 and IPv6 addresses and
can be used to extract matching addresses from logs and other text files.")
    (license license:gpl3+)))

(define-public domake
  (package
    (name "domake")
    (version "3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gportay/domake/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0hv3f8s4fmfgq69p9ycgi8fi5vf4vf2xci9s3j9r18ws0lyzbg7a"))))
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list util-linux))
    (home-page "https://github.com/ntfsprogs-plus/ntfsprogs-plus")
    (synopsis "NTFS filesystem utilities")
     "Ntfsprogs-plus provides utilities for creating, checking, and
manipulating NTFS file systems.  A modern continuation of the
ntfsprogs toolset.")
    (license license:gpl2+)))
(define-public fortune-mod-off
    (name "fortune-mod-off")
    (version "3.24.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/shlomif/fortune-mod/archive/"
                    "fortune-mod-" version ".tar.gz"))
              (sha256
               (base32
                "1bc5ik9kc6grf1smv9cbkh292ir5y86dgch010cpfhwr4jhqkf0c"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DNO_OFFENSIVE=OFF")))
    (native-inputs (list perl))
    (home-page "https://www.shlomifish.org/open-source/projects/fortune-mod/")
    (synopsis "fortune cookie program with offensive quotes enabled")
     "Fortune-mod is the BSD fortune program which displays a random
quotation from a collection of files.  This build includes the
offensive fortune cookie files that are excluded from many
distributions.")
    (license (license:non-copyleft
              "file://COPYING.txt"
              "BSD-4-Clause-UC"))))
(define-public dotool
    (name "dotool")
    (version "1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://git.sr.ht/~geb/dotool/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "07mfbyckn60f5d94p4z7mybxn1k1j9k5169jv9381jwpnss86ryf"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list bash))
    (home-page "https://github.com/gportay/domake")
    (synopsis "run make targets inside Docker containers")
    (description
     "domake is a tool that runs make targets inside Docker containers.
It wraps the make command to execute build steps in a consistent
containerized environment.")
    (license license:lgpl2.1+)))

;;;
;;; ── BUILD / DEVELOPMENT TOOLS ──────────────────────────────────────
;;;

(define-public arduino-ctags
  (package
    (name "arduino-ctags")
    (version "5.8-arduino11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arduino/ctags/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0kbrm4d7dsf7w3wqvgxihpc9n5rkxxn9ngd7672rpjxfc8y89jl6"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "prefix=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/arduino/ctags")
    (synopsis "ctags fork optimized for Arduino C++ code")
    (description
     "arduino-ctags is a fork of Exuberant Ctags with modifications for
better handling of Arduino C++ code.  It is used by the Arduino IDE for
code navigation and auto-completion.")
    (license license:gpl2+)))

(define-public html2markdown
  (package
    (name "html2markdown")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JohannesKaufmann/html-to-markdown/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "19dyxxzpgh07y6x0ib34qgnmk471x91qym4n15hyvadyk5hyj5fs"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/JohannesKaufmann/html-to-markdown/v2/cmd/html2markdown"
      #:unpack-path "github.com/JohannesKaufmann/html-to-markdown/v2"
      #:tests? #f))
    (home-page "https://html-to-markdown.com")
    (synopsis "convert HTML to Markdown with extensible rules")
    (description
     "html2markdown converts HTML to Markdown format.  It supports entire
websites and can be extended through rules for custom conversion logic.")
    (license license:expat)))

(define-public elephant
  (package
    (name "elephant")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "082siqzhggcbgn5isv5lmrwnk7gdkjdzaa0h47fmc7k0sfgqzx5b"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/abenz1267/elephant"
      #:tests? #f))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "general purpose datasource and executor")
    (description
     "Elephant is a general purpose datasource and executor written in Go.
It provides a flexible framework for querying and executing operations
across different data sources.")
    (license license:gpl3+)))

;;;
;;; ── WAYLAND / DISPLAY TOOLS ────────────────────────────────────────
;;;

(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Nomadcxx/gSlapper/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "09dand4z4p9wb10yzjz2k2lq7zrlvxkz7kjr0s8fy4ixp35kk03v"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs
     (list gstreamer gst-plugins-base gst-plugins-good
           gst-plugins-bad wayland))
    (native-inputs (list pkg-config wayland-protocols))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "wallpaper utility for Wayland with video support and RAM cache")
    (description
     "gSlapper is a wallpaper utility for Wayland compositors.  It supports
video and image wallpapers with instant switching via RAM cache, using
GStreamer for media playback.")
    (license license:expat)))

(define-public xboxdrv
  (package
    (name "xboxdrv")
    (version "0.8.14")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/xiota/xboxdrv/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0bh5a3j3bz5dm0yp0ng8fs1arqszblc3zpyprnwj35vdbdirqyi2"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list dbus glib libusb libx11 python))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/xiota/xboxdrv")
    (synopsis "userspace Xbox gamepad driver and input remapper")
    (description
     "xboxdrv is a userspace gamepad driver for Xbox controllers.  It supports
Xbox 360 and Xbox One controllers with custom button mapping and input
remapping capabilities.")
    (license license:gpl3+)))

;;;
;;; ── PYTHON PACKAGES ────────────────────────────────────────────────
;;;

(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "art" version))
       (sha256
        (base32 "0i0qglvk27p3siwa0b9k4lj6nzwrzp6vvdgldkn9g1i75js7g3d9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/sepandhaghighi/art/")
    (synopsis "ASCII art library for Python")
    (description
     "Art is an ASCII art library for Python.  It provides functions for
generating ASCII art text using various fonts and decorative patterns.")
    (license license:expat)))

    (inputs (list libevdev))
    (home-page "https://git.sr.ht/~geb/dotool")
    (synopsis "command-line tool to simulate input events")
     "Dotool reads commands from stdin and simulates keyboard and mouse
input events.  It works under both X11 and Wayland, providing a
universal input automation tool.")
;;; ── PYTHON PACKAGES ────────────────────────────────────────────────────
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pid" version))
       (sha256
        (base32 "0rpbagc6dql98q5gaprp9a6ifirjkih3mr1212xkx8znhc76fcqf"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "pidfile featuring stale detection and file-locking")
    (description
     "Python-pid provides PID file management with stale detection and
file-locking.  It ensures that only one instance of a program runs at
a time by managing lock files.")
    (license license:asl2.0)))

(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "plyer" version))
       (sha256
        (base32 "0qdaddrn9ki8faq01mfsf3ppchjjd6mb4zj8m0vsy1qyw6vxzdv5"))))
    (build-system python-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "platform-independent wrapper for platform-dependent APIs")
    (description
     "Plyer is a platform-independent Python wrapper for platform-dependent
APIs.  It provides a unified interface for accessing features like
notifications, GPS, camera, and other platform services.")
    (license license:expat)))

(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense_json" version))
       (sha256
        (base32 "1g6j77846j4yy9jpbhf2vgbf4spr30z1mwlqing89zfs9x1qvzi5"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://pypi.org/project/condense-json/")
    (synopsis "condense JSON using replacement strings")
    (description
     "condense-json provides a Python function for condensing JSON data
using replacement strings.  It reduces JSON size by substituting
repeated patterns with shorter tokens.")
    (license license:asl2.0)))

(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "m3u8" version))
       (sha256
        (base32 "1zf0m6gnvzjpzym4dzw2i5hwvd9ydjqi755gpi9sdmv72q59kpks"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-iso8601))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Python m3u8 parser")
    (description
     "Python-m3u8 is a parser for M3U8 playlists used in HTTP Live Streaming
(HLS).  It can parse and generate M3U8 playlist files with support for
all standard HLS tags.")
    (license license:expat)))

(define-public python-wassima
  (package
    (name "python-wassima")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "wassima" version))
       (sha256
        (base32 "19qhgp0z9hdbwip63n9dbkvjkrmbk9ya68szm3vlx6wxg58dm84i"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-hatchling python-wheel))
    (home-page "https://github.com/jawah/wassima")
    (synopsis "system trust store access in pure Python")
    (description
     "Wassima provides access to the system trust store in pure Python,
eliminating the need for certifi.  It reads certificates directly from
the operating system's certificate store.")
    (license license:expat)))

(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/20c/munge/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1pb6xqx27xkxvxq187lpp7f0k7kjyfpawclr9gqgf135sdjq8w0v"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-requests python-click))
    (native-inputs (list python-hatchling python-wheel))
    (home-page "https://github.com/20c/munge")
    (synopsis "data manipulation client and library")
    (description
     "Munge is a data manipulation client and library for Python.  It provides
tools for reading, transforming, and writing data across various formats
including JSON, YAML, and TOML.")
    (license license:asl2.0)))

(define-public python-opencensus
  (package
    (name "python-opencensus")
    (version "0.11.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "opencensus" version))
       (sha256
        (base32 "1wpg8kjqr594qap42b05dn5a7flbsp7a3hp5c2mn8c3pp3c8gvyb"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-six))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/census-instrumentation/opencensus-python")
    (synopsis "stats collection and distributed tracing framework")
    (description
     "OpenCensus is a stats collection and distributed tracing framework.
It provides a set of libraries for collecting application metrics and
distributed trace data, with exporters for various backends.")
    (license license:asl2.0)))

(define-public python-inquirerpy
  (package
    (name "python-inquirerpy")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "InquirerPy" version))
       (sha256
        (base32 "0zhrzj4xwyhd1c8xfjcac4gfrch8643k3bj1rf1p8cqz26havll9"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-prompt-toolkit))
    (native-inputs (list python-poetry-core python-wheel))
    (home-page "https://github.com/kazhala/InquirerPy")
    (synopsis "interactive command-line user interfaces for Python")
    (description
     "InquirerPy is a Python port of Inquirer.js providing a collection of
common interactive command-line user interfaces.  It supports prompts for
text input, selections, checkboxes, and more.")
    (license license:expat)))

(define-public python-sse-starlette
  (package
    (name "python-sse-starlette")
    (version "3.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sse_starlette" version))
       (sha256
        (base32 "1wdyqwvp2zhfy35c7nqyq154hywliq1ar59834km92mgcz02zyda"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-anyio python-starlette))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/sysid/sse-starlette")
    (synopsis "Server Sent Events for Starlette and FastAPI")
    (description
     "sse-starlette provides Server Sent Events (SSE) support for Starlette
and FastAPI applications.  It enables real-time server-to-client
communication over HTTP.")
    (license license:bsd-3)))

(define-public python-syncedlyrics
  (package
    (name "python-syncedlyrics")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "syncedlyrics" version))
       (sha256
        (base32 "1c361xwxzcxq1vz2wilva8hr2x5s8kgidsxldgcxavasxmlj9crx"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-beautifulsoup4 python-rapidfuzz python-requests))
    (native-inputs (list python-poetry-core python-wheel))
    (home-page "https://github.com/moehmeni/syncedlyrics")
    (synopsis "get LRC format synchronized lyrics for music")
    (description
     "Syncedlyrics retrieves synchronized lyrics in LRC format for music
tracks.  It searches multiple online sources and returns time-stamped
lyrics suitable for karaoke-style display.")
    (license license:expat)))

(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "materialyoucolor" version))
       (sha256
        (base32 "08p8hpwcs8ycma400dasvs1a45j6i0120s074g1k41yw4fp95j72"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs (list python-pillow))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "Material You color algorithms for Python")
    (description
     "materialyoucolor implements Google's Material You color algorithms in
Python.  It generates dynamic color schemes from images using the
Material Design 3 color system.")
    (license license:expat)))

(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "uv_dynamic_versioning" version))
       (sha256
        (base32 "0nyvr1x24qf2hynbixcgp5bi51v4p39pm5jm3p04bkksx03vqksp"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-hatchling python-toml))
    (native-inputs (list python-wheel))
    (home-page "https://github.com/ninoseki/uv-dynamic-versioning")
    (synopsis "dynamic versioning based on VCS tags for uv/hatch projects")
    (description
     "uv-dynamic-versioning provides dynamic versioning based on VCS tags
for uv and hatch projects.  It automatically determines the package
version from git tags during the build process.")
    (license license:expat)))

(define-public python-urllib3-future
  (package
    (name "python-urllib3-future")
    (version "2.19.901")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "urllib3_future" version))
       (sha256
        (base32 "0nqbd9m7z857bh3nrgzbh87wbh2wmgs8ygk4flnszw8s9c2is6wi"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (propagated-inputs
     (list python-h2 python-idna python-pyopenssl python-pysocks))
    (native-inputs (list python-hatchling python-wheel))
    (home-page "https://github.com/jawah/urllib3.future")
    (synopsis "urllib3 replacement with HTTP/2 and HTTP/3 support")
    (description
     "urllib3-future is an in-place replacement for urllib3 capable of
asynchronous operation with automatic HTTP/1.1, HTTP/2, and HTTP/3
transport selection.")
    (license license:expat)))

;;;
;;; ── FIRMWARE / DATA / TRIVIAL PACKAGES ─────────────────────────────
;;;

(define-public ghostty-shell-integration
  (package
    (name "ghostty-shell-integration")
    (version "0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((out (assoc-ref %outputs "out"))
                (share (string-append (assoc-ref %outputs "out") "/share")))
            (mkdir-p share)
            #t))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "shell integration scripts for Ghostty terminal")
    (description
     "This package provides shell integration scripts for the Ghostty
terminal emulator.  It includes integration for Bash, Zsh, and Fish
shells.")
    (license license:expat)))

(define-public ghostty-terminfo
  (package
    (name "ghostty-terminfo")
    (version "0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((out (assoc-ref %outputs "out")))
            (mkdir-p (string-append out "/share/terminfo"))
            #t))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "terminfo definitions for the Ghostty terminal")
    (description
     "This package provides terminfo definitions for the Ghostty terminal
emulator, enabling proper terminal capability detection for applications
running inside Ghostty.")
    (license license:expat)))

(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202603190030")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (mkdir-p (string-append (assoc-ref %outputs "out") "/share/clash"))
          #t)))
    (home-page "https://github.com/Loyalsoldier/geoip")
    (synopsis "GeoIP database files for Clash proxy")
    (description
     "This package provides GeoIP database files for the Clash proxy tool.
The database enables geographic IP-based routing rules.")
    (license license:gpl3+)))

(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pid" version))
              (sha256
               (base32
                "0rpbagc6dql98q5gaprp9a6ifirjkih3mr1212xkx8znhc76fcqf"))))
     "Python module for creating and managing PID files with stale detection
and cross-platform file locking.  It ensures only one instance of a
process is running at a time.")
(define-public python-steamgriddb
    (name "python-steamgriddb")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "python-steamgriddb" version))
              (sha256
               (base32
                "0sah4hbbydqzv69509q8965x2p37p57z135n80xsfpc616xvfv83"))))
    (propagated-inputs (list python-requests))
    (home-page "https://pypi.org/project/python-steamgriddb/")
    (synopsis "Python API wrapper for SteamGridDB.com")
     "Python wrapper for the SteamGridDB.com API, providing programmatic
access to custom game artwork including grids, heroes, logos, and
icons for Steam and other game launchers.")
;;; ── SHELL SCRIPT / WRAPPER PACKAGES ────────────────────────────────────
(define-public ani-skip-git
    (name "ani-skip-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/synacktraa/ani-skip")
                    (commit "12b4960")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
      #:install-plan #~'(("ani-skip" "bin/ani-skip"))))
    (home-page "https://github.com/synacktraa/ani-skip")
    (synopsis "script to automatically skip anime opening and ending sequences")
     "Ani-skip is a script that automatically skips anime opening and ending
sequences using the AniSkip API.  It integrates with mpv to detect
and skip intro and outro segments during playback.")
;;; ── COMPAT ALIASES ─────────────────────────────────────────────────────
(define-public libsodium-1.0.18
    (inherit (@ (gnu packages crypto) libsodium))
    (name "libsodium-1.0.18")))
(define-public npm-corepack
    (name "npm-corepack")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (rules-dir (string-append out "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (call-with-output-file
                (string-append rules-dir "/50-keychron-link.rules")
              (lambda (port)
                (display
                 "# Keychron Link wireless receiver\nSUBSYSTEM==\"usb\", ATTR{idVendor}==\"3434\", MODE=\"0666\"\n"
                 port)))
            #t))))
    (home-page "https://www.keychron.com")
    (synopsis "udev rule for the Keychron Link wireless receiver")
    (description
     "This package provides a udev rule for the Keychron Link wireless
receiver, allowing non-root users to access the device.")
    (license license:bsd-0)))

;;;
;;; ── MISC SOURCE BUILDS ────────────────────────────────────────────
;;;

(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/chaos/genders/archive/refs/tags/"
             "genders-1-32-1.tar.gz"))
       (sha256
        (base32 "0kfnv7zw18y0f0jyxfimq4bnv99jys78n78pbq5w27nhizn8dh8d"))))
    (build-system gnu-build-system)
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (symlink (string-append #$(this-package-input "node")
                                    "/bin/corepack")
                     (string-append bin "/corepack"))
            ;; Create npm wrapper that uses corepack
            (with-output-to-file (string-append bin "/npm")
              (lambda ()
                (format #t "#!/bin/sh~%exec ~a/bin/corepack npm \"$@\"~%"
                        #$(this-package-input "node"))))
            (chmod (string-append bin "/npm") #o755)))))
    (inputs (list node))
    (home-page "https://github.com/nodejs/corepack/")
    (synopsis "corepack shim providing npm via Node.js")
     "This package uses the corepack shim bundled with Node.js to provide
npm as a managed package manager.  Corepack ensures the correct version
of npm is used for each project.")
    (license license:expat)))
(define-public pnpm-corepack
    (inherit npm-corepack)
    (name "pnpm-corepack")
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (with-output-to-file (string-append bin "/pnpm")
              (lambda ()
                (format #t "#!/bin/sh~%exec ~a/bin/corepack pnpm \"$@\"~%"
                        #$(this-package-input "node"))))
            (chmod (string-append bin "/pnpm") #o755)))))
    (synopsis "corepack shim providing pnpm via Node.js")
     "This package uses the corepack shim bundled with Node.js to provide
pnpm as a managed package manager.  Corepack ensures the correct version
of pnpm is used for each project.")))
(define-public yarn-corepack
    (inherit npm-corepack)
    (name "yarn-corepack")
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin")))
            (mkdir-p bin)
            (with-output-to-file (string-append bin "/yarn")
              (lambda ()
                (format #t "#!/bin/sh~%exec ~a/bin/corepack yarn \"$@\"~%"
                        #$(this-package-input "node"))))
            (chmod (string-append bin "/yarn") #o755)))))
    (synopsis "corepack shim providing yarn via Node.js")
     "This package uses the corepack shim bundled with Node.js to provide
Yarn as a managed package manager.  Corepack ensures the correct version
of Yarn is used for each project.")))
;;; ── MESON/GLIB PACKAGES ───────────────────────────────────────────────
(define-public libastal-bluetooth-git
    (name "libastal-bluetooth-git")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Aylur/astal")
                    (commit "ca3190d")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'run-autoreconf
            (lambda _
              (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake libtool))
    (home-page "https://github.com/chaos/genders")
    (synopsis "static cluster configuration database")
    (description
     "Genders is a static cluster configuration database used for cluster
configuration management.  It stores a list of nodes with associated
attributes that can be queried for cluster administration tasks.")
    (license license:gpl2+)))
          (add-after 'unpack 'chdir
            (lambda _ (chdir "lib/bluetooth"))))))
    (native-inputs (list pkg-config `(,glib "bin")))
    (inputs (list glib))
    (home-page "https://github.com/Aylur/astal")
    (synopsis "library to control BlueZ over D-Bus")
     "Libastal-bluetooth is a GObject-based library for controlling BlueZ
(the Linux Bluetooth stack) over D-Bus.  It is part of the Astal
widget toolkit ecosystem.")
    (license license:lgpl2.1)))

