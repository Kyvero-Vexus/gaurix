;;; Dependency-tree resolver — round 21, worker 01
;;; Timestamp: 2026-04-06
;;; Selected from dependency-tree priority queue
;;; 63 packages: cmake (8), gnu (7), meson (2), pyproject/python (12),
;;;   copy/data/fonts (9), shell/perl (4), binary (10), other (11)
(define-module (gaurix packages deptree-r21-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system ruby)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  ;; GNU packages
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages image)
  #:use-module (gnu packages java)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (davs2
            openapv
            xevd
            xeve
            vvenc
            libaribcaption
            libuvc
            apriltag
            grepcidr
            libjodycode
            libklvanc
            genders
            arduino-ctags
            asroot
            doas
            httpdirfs
            gslapper
            python-art
            python-condense-json
            python-pid
            python-plyer
            python-wassima
            python-munge
            python-m3u8
            cmake-format
            crossplane
            python-syncedlyrics
            python-uv-dynamic-versioning
            sqlite-utils
            clash-geoip
            keychron-link-udev
            xone-dongle-firmware
            upd72020x-fw
            wd719x-firmware
            noto-fonts-emoji-blob
            redhat-fonts
            ghostty-shell-integration-nightly-bin
            ghostty-terminfo-nightly-bin
            notify-send.sh
            localepurge
            deb2targz
            auto-auto-complete
            deno-stable-bin
            netbird-bin
            xcaddy-bin
            rtk-bin
            viu-media-bin
            nordvpn-bin
            gnirehtet-bin
            elephant-archlinuxpkgs-bin
            elephant-bluetooth-bin
            elephant-desktopapplications-bin
            ruby-http-2
            elephant
            scala3
            modern-beep
            claude-code-stable
            fortune-mod-off
            lidm-systemd-git
            domake
            openbsd-netcat-tls
            tosu
            kaitai-struct-compiler
            babashka-bin
            fftw-amd))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 1: C/C++ CMake projects
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 1. davs2 — AVS2 decoder
;;; ─────────────────────────────────────────────
(define-public davs2
  (package
    (name "davs2")
    (version "1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pkuvcl/davs2")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (native-inputs (list nasm))
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir-to-build
            (lambda _ (chdir "build/linux"))))))
    (home-page "https://github.com/pkuvcl/davs2")
    (synopsis "AVS2/IEEE 1857.4 video decoder")
    (description
     "davs2 is an open-source decoder for the AVS2 (Audio Video Coding
Standard 2) video coding standard, also known as IEEE 1857.4.  It provides
high-performance decoding of AVS2 bitstreams.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 2. openapv — APV codec reference implementation
;;; ─────────────────────────────────────────────
(define-public openapv
  (package
    (name "openapv")
    (version "0.2.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AcademySoftwareFoundation/openapv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/AcademySoftwareFoundation/openapv")
    (synopsis "APV codec reference implementation")
    (description
     "OpenAPV is the reference implementation of the APV (Advanced Professional
Video) codec.  It provides encoding and decoding of APV bitstreams as defined
by the APV specification.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 3. xevd — MPEG-5 EVC decoder
;;; ─────────────────────────────────────────────
(define-public xevd
  (package
    (name "xevd")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mpeg5/xevd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mpeg5/xevd")
    (synopsis "MPEG-5 Essential Video Coding (EVC) decoder")
    (description
     "xevd is a decoder for the MPEG-5 Essential Video Coding (EVC) standard.
It provides a reference implementation capable of decoding EVC baseline and
main profile bitstreams.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 4. xeve — MPEG-5 EVC encoder
;;; ─────────────────────────────────────────────
(define-public xeve
  (package
    (name "xeve")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mpeg5/xeve")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/mpeg5/xeve")
    (synopsis "MPEG-5 Essential Video Coding (EVC) encoder")
    (description
     "xeve is an encoder for the MPEG-5 Essential Video Coding (EVC) standard.
It provides a reference implementation capable of encoding video into EVC
baseline and main profile bitstreams.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 5. vvenc — H.266/VVC encoder
;;; ─────────────────────────────────────────────
(define-public vvenc
  (package
    (name "vvenc")
    (version "1.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fraunhoferhhi/vvenc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fraunhoferhhi/vvenc")
    (synopsis "Fraunhofer Versatile Video Encoder (H.266/VVC)")
    (description
     "VVenC is an open-source H.266/VVC (Versatile Video Coding) encoder
developed by Fraunhofer HHI.  It provides fast and efficient encoding of
video content according to the VVC standard.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 6. libaribcaption — ARIB STD-B24 caption library
;;; ─────────────────────────────────────────────
(define-public libaribcaption
  (package
    (name "libaribcaption")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/xqq/libaribcaption")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list fontconfig freetype))
    (home-page "https://github.com/xqq/libaribcaption")
    (synopsis "ARIB STD-B24 caption decoder and renderer")
    (description
     "libaribcaption is a portable library for decoding and rendering ARIB
STD-B24 captions, the standard used for digital television captioning in
Japan and several other countries.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 7. libuvc — USB video devices library
;;; ─────────────────────────────────────────────
(define-public libuvc
  (package
    (name "libuvc")
    (version "0.0.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/libuvc/libuvc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libusb libjpeg-turbo))
    (home-page "https://libuvc.github.io/libuvc/")
    (synopsis "Cross-platform library for USB video devices")
    (description
     "libuvc is a cross-platform library for USB video class (UVC) devices.
It provides a user-space API for accessing UVC webcams and other USB video
devices without requiring kernel driver support.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 8. apriltag — Visual fiducial system
;;; ─────────────────────────────────────────────
(define-public apriltag
  (package
    (name "apriltag")
    (version "3.4.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/AprilRobotics/apriltag")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://april.eecs.umich.edu/software/apriltag")
    (synopsis "Visual fiducial system for robotics and AR applications")
    (description
     "AprilTag is a visual fiducial system useful for a wide variety of tasks
including augmented reality, robotics, and camera calibration.  It detects
specially designed markers in images and computes their precise 3D position,
orientation, and identity.")
    (license license:bsd-2)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 2: C source with make/autotools (gnu-build-system)
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 9. grepcidr — Filter IPs by CIDR
;;; ─────────────────────────────────────────────
(define-public grepcidr
  (package
    (name "grepcidr")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.pc-tools.net/files/unix/grepcidr-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (man (string-append out "/share/man/man1")))
                (mkdir-p bin)
                (mkdir-p man)
                (install-file "grepcidr" bin)
                (install-file "grepcidr.1" man)))))))
    (home-page "http://www.pc-tools.net/unix/grepcidr/")
    (synopsis "Filter IPv4 and IPv6 addresses matching CIDR patterns")
    (description
     "grepcidr can be used to filter a list of IP addresses against one or
more Classless Inter-Domain Routing (CIDR) patterns.  It efficiently matches
IPv4 and IPv6 addresses against network blocks.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 10. libjodycode — Shared library by Jody Bruchon
;;; ─────────────────────────────────────────────
(define-public libjodycode
  (package
    (name "libjodycode")
    (version "4.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/jbruchon/libjodycode")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "Shared code library used by Jody Bruchon's utilities")
    (description
     "libjodycode is a shared library containing common code used by various
utilities by Jody Bruchon, including jdupes and other file management tools.
It provides string manipulation, hashing, and other utility functions.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 11. libklvanc — VANC parsing library
;;; ─────────────────────────────────────────────
(define-public libklvanc
  (package
    (name "libklvanc")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/stoth68000/libklvanc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list pkg-config))
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/stoth68000/libklvanc")
    (synopsis "VANC (Vertical Ancillary Data) parsing library")
    (description
     "libklvanc is a library for parsing and generating Vertical Ancillary
Data (VANC) as used in professional video standards.  It supports SMPTE
standards for closed captioning, AFD, SCTE-104, and other ancillary data
types embedded in SDI video streams.")
    (license license:lgpl2.1+)))

;;; ─────────────────────────────────────────────
;;; 12. genders — Cluster config database
;;; ─────────────────────────────────────────────
(define-public genders
  (package
    (name "genders")
    (version "1.32.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chaos/genders")
             (commit (string-append "genders-" version "-1"))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "--prefix=" #$output))))
    (home-page "https://github.com/chaos/genders")
    (synopsis "Static cluster configuration database for node attributes")
    (description
     "Genders is a static cluster configuration database used for
configuration management.  It allows cluster nodes to be grouped and
described by attributes, enabling tools to query which nodes have
particular properties.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 13. arduino-ctags — C++ ctags variant
;;; ─────────────────────────────────────────────
(define-public arduino-ctags
  (package
    (name "arduino-ctags")
    (version "5.8-arduino11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/arduino/ctags")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
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
    (synopsis "C/C++ ctags fork used by the Arduino IDE")
    (description
     "Arduino-ctags is a fork of Exuberant Ctags used by the Arduino IDE
to parse C and C++ source files.  It generates tag files containing
function and variable definitions for use by the Arduino build system.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 14. asroot — Simple sudo alternative
;;; ─────────────────────────────────────────────
(define-public asroot
  (package
    (name "asroot")
    (version "1.1.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/asroot")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/asroot")
    (synopsis "Simple alternative to sudo for running commands as root")
    (description
     "asroot is a minimal tool for running commands as root.  It is designed
as a simpler alternative to sudo, providing basic privilege escalation
without the complexity of a full sudo implementation.")
    (license license:isc)))

;;; ─────────────────────────────────────────────
;;; 15. doas — OpenBSD doas port (different from opendoas)
;;; ─────────────────────────────────────────────
(define-public doas
  (package
    (name "doas")
    (version "6.3p13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/thejessesmith/doas")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (native-inputs (list bison))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "./configure"
                      (string-append "--prefix=" (assoc-ref outputs "out"))
                      "--without-pam"))))))
    (home-page "https://codeberg.org/thejessesmith/doas")
    (synopsis "OpenBSD doas port for Linux privilege escalation")
    (description
     "Doas is a port of the OpenBSD doas utility to Linux.  It is a minimal
program to execute commands as another user, offering a simpler alternative
to sudo with a straightforward configuration file syntax.  This package is
different from opendoas and uses a separate upstream.")
    (license license:isc)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 3: Meson builds
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 16. httpdirfs — HTTP directory filesystem
;;; ─────────────────────────────────────────────
(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fangfufu/httpdirfs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config help2man))
    (inputs (list gumbo-parser fuse curl expat openssl))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "FUSE filesystem for HTTP directory listings")
    (description
     "HTTPDirFS is a FUSE filesystem that mounts HTTP directory listings
as a local filesystem.  It allows browsing and reading files from web
servers that provide directory index pages, without downloading the
entire content upfront.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 17. gslapper — Wayland wallpaper utility
;;; ─────────────────────────────────────────────
(define-public gslapper
  (package
    (name "gslapper")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Nomadcxx/gSlapper")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config wayland-protocols))
    (inputs (list gstreamer gst-plugins-base gst-plugins-good
                  gst-plugins-bad wayland))
    (home-page "https://github.com/Nomadcxx/gSlapper")
    (synopsis "GStreamer-based wallpaper utility for Wayland compositors")
    (description
     "gSlapper is a wallpaper utility for Wayland compositors that uses
GStreamer for rendering.  It supports video wallpapers and various media
formats through the GStreamer pipeline framework.")
    (license license:expat)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 4: Python packages
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 18. python-art — ASCII art library
;;; ─────────────────────────────────────────────
(define-public python-art
  (package
    (name "python-art")
    (version "6.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sepandhaghighi/art")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/sepandhaghighi/art")
    (synopsis "ASCII art library for Python")
    (description
     "Art is a Python library for generating ASCII art text and decorations.
It supports a wide variety of ASCII art fonts and one-line art decorations
for use in terminal applications and text-based interfaces.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 19. python-condense-json — JSON condensing
;;; ─────────────────────────────────────────────
(define-public python-condense-json
  (package
    (name "python-condense-json")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "condense-json" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://pypi.org/project/condense-json/")
    (synopsis "Condense JSON data into a more compact form")
    (description
     "condense-json is a Python library for condensing JSON data into a more
compact representation.  It reduces the size of JSON output while maintaining
its structure and validity.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 20. python-pid — PID file management
;;; ─────────────────────────────────────────────
(define-public python-pid
  (package
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/trbs/pid")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/trbs/pid")
    (synopsis "PID file management library for Python daemons")
    (description
     "python-pid is a library for managing PID (Process ID) files in Python.
It provides a simple interface for creating, checking, and cleaning up PID
files, which are commonly used by daemon processes to prevent multiple
instances from running simultaneously.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 21. python-plyer — Platform APIs wrapper
;;; ─────────────────────────────────────────────
(define-public python-plyer
  (package
    (name "python-plyer")
    (version "2.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kivy/plyer")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/kivy/plyer")
    (synopsis "Platform-independent Python wrapper for platform APIs")
    (description
     "Plyer is a platform-independent Python wrapper for platform-dependent
APIs.  It provides a unified interface to features like notifications,
GPS, camera, accelerometer, and other hardware and OS features across
Linux, macOS, Windows, iOS, and Android.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 22. python-wassima — System trust store
;;; ─────────────────────────────────────────────
(define-public python-wassima
  (package
    (name "python-wassima")
    (version "2.0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jawah/wassima")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (home-page "https://github.com/jawah/wassima")
    (synopsis "Access system trust store certificates from Python")
    (description
     "Wassima is a Python library that provides access to the operating
system's trust store.  It extracts root CA certificates from the native
certificate store, enabling Python applications to use system-managed
TLS certificates.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 23. python-munge — Data manipulation
;;; ─────────────────────────────────────────────
(define-public python-munge
  (package
    (name "python-munge")
    (version "1.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/20c/munge")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-requests python-click))
    (home-page "https://github.com/20c/munge")
    (synopsis "Data manipulation and merging utilities for Python")
    (description
     "Munge is a Python library providing utilities for data manipulation
and merging.  It offers tools for loading, transforming, and combining
configuration data from various sources and formats.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 24. python-m3u8 — M3U8 parser
;;; ─────────────────────────────────────────────
(define-public python-m3u8
  (package
    (name "python-m3u8")
    (version "6.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/globocom/m3u8")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-iso8601))
    (home-page "https://github.com/globocom/m3u8")
    (synopsis "Parser for M3U8 playlists used in HTTP Live Streaming")
    (description
     "python-m3u8 is a Python parser for M3U8 playlists, the format used
by HTTP Live Streaming (HLS).  It can parse and generate M3U8 playlist
files, supporting both media and master playlists with all standard HLS
tags and attributes.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 25. cmake-format — CMake formatter
;;; ─────────────────────────────────────────────
(define-public cmake-format
  (package
    (name "cmake-format")
    (version "0.6.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cheshirekow/cmake_format")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-six))
    (home-page "https://github.com/cheshirekow/cmake_format")
    (synopsis "Source code formatter and linter for CMake files")
    (description
     "cmake-format is a source code formatter for CMakeLists.txt files and
other CMake source files.  It parses CMake code into a syntax tree and
re-formats it according to configurable style rules, similar to what
clang-format does for C/C++.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 26. crossplane — NGINX config parser
;;; ─────────────────────────────────────────────
(define-public crossplane
  (package
    (name "crossplane")
    (version "0.5.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nginxinc/crossplane")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/nginxinc/crossplane")
    (synopsis "NGINX configuration file parser and builder")
    (description
     "Crossplane is a Python library and command-line tool for parsing,
analyzing, and building NGINX configuration files.  It can convert NGINX
configs to JSON and back, enabling programmatic manipulation of NGINX
configuration.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 27. python-syncedlyrics — Synchronized lyrics fetcher
;;; ─────────────────────────────────────────────
(define-public python-syncedlyrics
  (package
    (name "python-syncedlyrics")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/moehmeni/syncedlyrics")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-poetry-core))
    (propagated-inputs (list python-beautifulsoup4 python-rapidfuzz
                             python-requests))
    (home-page "https://github.com/moehmeni/syncedlyrics")
    (synopsis "Fetch synchronized lyrics from multiple online sources")
    (description
     "syncedlyrics is a Python library and CLI tool for fetching synchronized
(time-stamped) lyrics from various online sources.  It searches multiple
lyrics providers and returns LRC-formatted synchronized lyrics for a given
song.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 28. python-uv-dynamic-versioning — UV/hatch dynamic versioning
;;; ─────────────────────────────────────────────
(define-public python-uv-dynamic-versioning
  (package
    (name "python-uv-dynamic-versioning")
    (version "0.14.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ninoseki/uv-dynamic-versioning")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-tomlkit python-pydantic python-jinja2
                             python-hatchling python-dunamai))
    (home-page "https://github.com/ninoseki/uv-dynamic-versioning")
    (synopsis "Dynamic versioning plugin for UV and Hatch build systems")
    (description
     "uv-dynamic-versioning is a plugin that provides dynamic versioning for
Python projects using the UV or Hatch build systems.  It automatically
determines version numbers from version control system tags, enabling
single-source version management.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 29. sqlite-utils — SQLite CLI and library
;;; ─────────────────────────────────────────────
(define-public sqlite-utils
  (package
    (name "sqlite-utils")
    (version "3.39")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/simonw/sqlite-utils")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (propagated-inputs (list python-sqlite-fts4 python-click
                             python-click-default-group python-tabulate
                             python-dateutil python-pluggy))
    (home-page "https://sqlite-utils.datasette.io")
    (synopsis "CLI tool and Python library for manipulating SQLite databases")
    (description
     "sqlite-utils is a command-line tool and Python library for manipulating
SQLite databases.  It provides utilities for creating tables, inserting data,
running queries, and transforming data, with support for JSON, CSV, and TSV
input and output formats.")
    (license license:asl2.0)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 5: Data/firmware/fonts (copy-build-system)
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 30. clash-geoip — GeoIP data for Clash
;;; ─────────────────────────────────────────────
(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202604")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Loyalsoldier/geoip/releases/latest/download/"
             "Country.mmdb"))
       (file-name (string-append "clash-geoip-" version "-Country.mmdb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/clash/Country.mmdb" #:include ("clash-geoip-202604-Country.mmdb")))))
    (home-page "https://github.com/Loyalsoldier/geoip")
    (synopsis "GeoIP database for Clash proxy tool")
    (description
     "This package provides a MaxMind MMDB-format GeoIP database for use
with the Clash proxy tool.  It contains IP-to-country mappings compiled
from various public sources.")
    (license (list license:cc-by-sa4.0 license:gpl3+))))

;;; ─────────────────────────────────────────────
;;; 31. keychron-link-udev — udev rule for Keychron
;;; ─────────────────────────────────────────────
(define-public keychron-link-udev
  (package
    (name "keychron-link-udev")
    (version "1.0.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((rules-dir (string-append (assoc-ref %outputs "out")
                                          "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (call-with-output-file
                (string-append rules-dir "/50-keychron-link.rules")
              (lambda (port)
                (display
                 "# Keychron Link dongle udev rule\nSUBSYSTEM==\"usb\", ATTR{idVendor}==\"3434\", MODE=\"0666\"\n"
                 port)))))))
    (home-page "https://aur.archlinux.org/packages/keychron-link-udev")
    (synopsis "Udev rules for Keychron Link wireless dongle")
    (description
     "This package installs udev rules to allow unprivileged access to the
Keychron Link USB wireless dongle, enabling the Keychron Link desktop
application to communicate with Keychron keyboards.")
    (license license:public-domain)))

;;; ─────────────────────────────────────────────
;;; 32. xone-dongle-firmware — Xbox wireless dongle firmware
;;; ─────────────────────────────────────────────
(define-public xone-dongle-firmware
  (package
    (name "xone-dongle-firmware")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/medusalix/xone/releases/download/v"
             version "/xone-dongle-firmware.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/xone/" #:include-regexp ("\\.bin$")))))
    (home-page "https://github.com/medusalix/xone")
    (synopsis "Firmware files for Xbox One wireless dongle")
    (description
     "This package provides the firmware files required by the xone Linux
driver for the Xbox One wireless dongle.  The firmware enables the dongle
to communicate with Xbox wireless controllers.")
    (license (license:non-copyleft
              "https://github.com/medusalix/xone/blob/master/LICENSE"
              "Proprietary Microsoft firmware"))))

;;; ─────────────────────────────────────────────
;;; 33. upd72020x-fw — Renesas USB3 firmware
;;; ─────────────────────────────────────────────
(define-public upd72020x-fw
  (package
    (name "upd72020x-fw")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://git.disroot.org/glektarssza/aur-upd72020x-fw")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/" #:include-regexp ("\\.fw$")))))
    (home-page "https://git.disroot.org/glektarssza/aur-upd72020x-fw")
    (synopsis "Firmware for Renesas uPD72020x USB 3.0 host controllers")
    (description
     "This package provides firmware files for the Renesas uPD72020x family
of USB 3.0 host controllers.  The firmware is required by the xhci-pci
Linux kernel driver to initialise these controllers.")
    (license (license:non-copyleft
              "https://git.disroot.org/glektarssza/aur-upd72020x-fw"
              "Proprietary Renesas firmware"))))

;;; ─────────────────────────────────────────────
;;; 34. wd719x-firmware — WD SCSI firmware
;;; ─────────────────────────────────────────────
(define-public wd719x-firmware
  (package
    (name "wd719x-firmware")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mijailr/wd719x-firmware")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/wd719x/" #:include-regexp ("\\.fw$")))))
    (home-page "https://github.com/mijailr/wd719x-firmware")
    (synopsis "Firmware for Western Digital WD7193/7197/7296 SCSI controllers")
    (description
     "This package provides firmware files for Western Digital WD719x series
SCSI controllers.  The firmware is required by the wd719x Linux kernel
driver to operate these PCI SCSI adapters.")
    (license (license:non-copyleft
              "https://github.com/mijailr/wd719x-firmware"
              "Custom firmware license"))))

;;; ─────────────────────────────────────────────
;;; 35. noto-fonts-emoji-blob — Blob emoji font
;;; ─────────────────────────────────────────────
(define-public noto-fonts-emoji-blob
  (package
    (name "noto-fonts-emoji-blob")
    (version "15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/C1710/blobmoji/releases/download/v"
             version "/Blobmoji.ttf"))
       (file-name (string-append "Blobmoji-" version ".ttf"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp ("\\.ttf$")))))
    (home-page "https://github.com/C1710/blobmoji")
    (synopsis "Blobmoji emoji font based on Noto Color Emoji")
    (description
     "Noto Fonts Emoji Blob (Blobmoji) is an emoji font that brings back the
blob-style emoji designs originally used in Android.  It is based on the Noto
Color Emoji font but replaces the standard emoji designs with the classic
blob characters.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 36. redhat-fonts — Red Hat typeface
;;; ─────────────────────────────────────────────
(define-public redhat-fonts
  (package
    (name "redhat-fonts")
    (version "4.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/RedHatOfficial/RedHatFont")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts/proportional/static/ttf/" "share/fonts/truetype/redhat/")
          ("fonts/mono/static/ttf/" "share/fonts/truetype/redhat-mono/"))))
    (home-page "https://www.redhat.com")
    (synopsis "Red Hat corporate typeface family")
    (description
     "Red Hat Fonts is the official typeface family of Red Hat.  It includes
Red Hat Display for headlines and large text, Red Hat Text for body copy,
and Red Hat Mono for code and technical content.  The fonts are designed
for excellent legibility in both print and digital media.")
    (license license:silofl1.1)))

;;; ─────────────────────────────────────────────
;;; 37. ghostty-shell-integration-nightly-bin — Shell integration for ghostty
;;; ─────────────────────────────────────────────
(define-public ghostty-shell-integration-nightly-bin
  (package
    (name "ghostty-shell-integration-nightly-bin")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghostty-org/ghostty")
             (commit "main")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src/shell-integration/" "share/ghostty/shell-integration/"))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "Shell integration scripts for the Ghostty terminal emulator")
    (description
     "This package provides shell integration scripts for the Ghostty terminal
emulator.  These scripts enable features like automatic title setting, working
directory tracking, and prompt marking in Bash, Zsh, and Fish shells.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 38. ghostty-terminfo-nightly-bin — Terminfo for ghostty
;;; ─────────────────────────────────────────────
(define-public ghostty-terminfo-nightly-bin
  (package
    (name "ghostty-terminfo-nightly-bin")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ghostty-org/ghostty")
             (commit "main")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src/terminfo/" "share/terminfo/"))))
    (home-page "https://github.com/ghostty-org/ghostty")
    (synopsis "Terminfo definitions for the Ghostty terminal emulator")
    (description
     "This package provides terminfo definitions for the Ghostty terminal
emulator.  Installing these definitions allows programs that use terminfo
to correctly render output when running inside Ghostty.")
    (license license:expat)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 6: Shell/Perl scripts
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 39. notify-send.sh — Notify-send replacement
;;; ─────────────────────────────────────────────
(define-public notify-send.sh
  (package
    (name "notify-send.sh")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vlevit/notify-send.sh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal glib))
    (arguments
     (list
      #:install-plan
      #~'(("notify-send.sh" "bin/")
          ("notify-action.sh" "bin/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-scripts
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (glib (assoc-ref inputs "glib")))
                (for-each
                 (lambda (script)
                   (wrap-program (string-append out "/bin/" script)
                     `("PATH" ":" prefix (,(string-append glib "/bin")))))
                 '("notify-send.sh" "notify-action.sh"))))))))
    (home-page "https://github.com/vlevit/notify-send.sh")
    (synopsis "Drop-in replacement for notify-send with more features")
    (description
     "notify-send.sh is a drop-in replacement for the notify-send command
from libnotify.  It adds support for replacing and closing existing
notifications by ID, and can wait for notification actions using gdbus.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 40. localepurge — Locale purge script
;;; ─────────────────────────────────────────────
(define-public localepurge
  (package
    (name "localepurge")
    (version "0.7.3.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://deb.debian.org/debian/pool/main/l/localepurge/"
             "localepurge_" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/sbin/localepurge" "bin/")
          ("usr/share/man/man8/localepurge.8" "share/man/man8/"))))
    (home-page "http://packages.debian.org/source/sid/localepurge")
    (synopsis "Remove unneeded locale data to save disk space")
    (description
     "localepurge is a script that removes locale data files for languages
that are not configured on the system.  It can free significant disk space
on systems that only use a small number of locales.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 41. deb2targz — Deb to tar.gz converter
;;; ─────────────────────────────────────────────
(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "http://www.miketaylor.org.uk/tech/deb/deb2targz"))
       (file-name (string-append "deb2targz-" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list perl))
    (arguments
     (list
      #:install-plan
      #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (perl (search-input-file inputs "/bin/perl"))
                    (src (assoc-ref %build-inputs "source")))
                (mkdir-p (string-append out "/bin"))
                (copy-file src (string-append out "/bin/deb2targz"))
                (substitute* (string-append out "/bin/deb2targz")
                  (("#!/usr/bin/perl") (string-append "#!" perl)))
                (chmod (string-append out "/bin/deb2targz") #o755)))))))
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (synopsis "Convert Debian .deb packages to tar.gz archives")
    (description
     "deb2targz is a simple Perl script that converts Debian .deb package
files into standard tar.gz archives.  This is useful for extracting the
contents of Debian packages on non-Debian systems.")
    (license license:gpl2+)))

;;; ─────────────────────────────────────────────
;;; 42. auto-auto-complete — Shell completion generator
;;; ─────────────────────────────────────────────
(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://codeberg.org/maandree/auto-auto-complete")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list python))
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Generator of shell completions from command descriptions")
    (description
     "auto-auto-complete generates shell completion scripts for Bash, Zsh,
and Fish from a simple description of a command's arguments and options.
It allows maintaining a single completion definition that targets multiple
shells.")
    (license license:isc)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 7: Binary packages (trivial-build-system)
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 43. deno-stable-bin — Deno runtime
;;; ─────────────────────────────────────────────
(define-public deno-stable-bin
  (package
    (name "deno-stable-bin")
    (version "2.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/denoland/deno/releases/download/v"
             version "/deno-x86_64-unknown-linux-gnu.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (invoke unzip "-q" src "-d" bin-dir)
            (let ((exe (string-append bin-dir "/deno")))
              (chmod exe #o755)
              (invoke patchelf "--set-interpreter" ld-so exe)
              (invoke patchelf "--set-rpath" rpath exe))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://deno.land")
    (synopsis "Secure JavaScript and TypeScript runtime")
    (description
     "Deno is a secure runtime for JavaScript and TypeScript built on V8
and Rust.  It ships as a single executable with no dependencies, provides
built-in TypeScript support, and uses a capability-based security model
that requires explicit permissions for file, network, and environment
access.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 44. netbird-bin — WireGuard mesh network
;;; ─────────────────────────────────────────────
(define-public netbird-bin
  (package
    (name "netbird-bin")
    (version "0.67.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/netbirdio/netbird/releases/download/v"
             version "/netbird_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "netbird" bin-dir)
            (chmod (string-append bin-dir "/netbird") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://netbird.io")
    (synopsis "WireGuard-based mesh network manager")
    (description
     "NetBird is a tool for creating secure private networks using WireGuard.
It provides zero-configuration mesh networking with automatic peer
discovery, NAT traversal, and a management interface for controlling
access between network members.")
    (license license:bsd-3)))

;;; ─────────────────────────────────────────────
;;; 45. xcaddy-bin — Caddy builder
;;; ─────────────────────────────────────────────
(define-public xcaddy-bin
  (package
    (name "xcaddy-bin")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/caddyserver/xcaddy/releases/download/v"
             version "/xcaddy_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "xcaddy" bin-dir)
            (chmod (string-append bin-dir "/xcaddy") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/caddyserver/xcaddy")
    (synopsis "Custom Caddy web server builder")
    (description
     "xcaddy is a command-line tool for building custom versions of the Caddy
web server with additional plugins.  It automates the process of compiling
Caddy from source with user-specified modules included.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 46. rtk-bin — LLM proxy
;;; ─────────────────────────────────────────────
(define-public rtk-bin
  (package
    (name "rtk-bin")
    (version "0.34.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/rtk-ai/rtk/releases/download/v"
             version "/rtk-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (let ((exe "rtk"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/" exe)))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/rtk-ai/rtk")
    (synopsis "LLM proxy and routing toolkit")
    (description
     "RTK is a proxy and routing toolkit for Large Language Models (LLMs).
It provides a unified API for routing requests across multiple LLM
providers with features like load balancing, rate limiting, and caching.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 47. viu-media-bin — Anime viewer
;;; ─────────────────────────────────────────────
(define-public viu-media-bin
  (package
    (name "viu-media-bin")
    (version "3.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/viu-media/viu/releases/download/v"
             version "/viu-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (let ((exe "viu"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/" exe)))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/viu-media/viu")
    (synopsis "Anime and media viewer application")
    (description
     "Viu Media is an application for browsing and viewing anime and other
media content.  It provides a convenient interface for discovering and
watching video content from various sources.")
    (license license:public-domain)))

;;; ─────────────────────────────────────────────
;;; 48. nordvpn-bin — NordVPN CLI
;;; ─────────────────────────────────────────────
(define-public nordvpn-bin
  (package
    (name "nordvpn-bin")
    (version "4.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/"
             "nordvpn_" version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin"))
                 (tmp      (string-append out "/tmp")))
            (mkdir-p bin-dir)
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            ;; Extract .deb (is an ar archive, data.tar.gz inside)
            (copy-file src (string-append tmp "/nordvpn.deb"))
            (with-directory-excursion tmp
              (invoke "ar" "x" "nordvpn.deb")
              (invoke tar "xzf" "data.tar.gz"))
            (for-each
             (lambda (exe-name)
               (let ((exe (string-append tmp "/usr/bin/" exe-name)))
                 (when (file-exists? exe)
                   (install-file exe bin-dir)
                   (let ((installed (string-append bin-dir "/" exe-name)))
                     (chmod installed #o755)
                     (invoke patchelf "--set-interpreter" ld-so installed)
                     (invoke patchelf "--set-rpath" rpath installed)))))
             '("nordvpn"))
            (let ((sbin-exe (string-append tmp "/usr/sbin/nordvpnd")))
              (when (file-exists? sbin-exe)
                (install-file sbin-exe bin-dir)
                (let ((installed (string-append bin-dir "/nordvpnd")))
                  (chmod installed #o755)
                  (invoke patchelf "--set-interpreter" ld-so installed)
                  (invoke patchelf "--set-rpath" rpath installed))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nordvpn.com/download/linux/")
    (synopsis "NordVPN command-line client for Linux")
    (description
     "NordVPN is a VPN client for connecting to NordVPN servers.  This
package provides the command-line interface and daemon for managing VPN
connections on Linux.")
    (license license:gpl3+)))

;;; ─────────────────────────────────────────────
;;; 49. gnirehtet-bin — Android reverse tethering
;;; ─────────────────────────────────────────────
(define-public gnirehtet-bin
  (package
    (name "gnirehtet-bin")
    (version "2.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Genymobile/gnirehtet/releases/download/v"
             version "/gnirehtet-rust-linux64-v" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list unzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (unzip    (search-input-file %build-inputs "/bin/unzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin"))
                 (tmp      (string-append out "/tmp")))
            (mkdir-p bin-dir)
            (mkdir-p tmp)
            (invoke unzip "-q" src "-d" tmp)
            (let ((exe (car (find-files tmp "^gnirehtet$"))))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/gnirehtet")))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))
            (delete-file-recursively (string-append out "/tmp"))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Genymobile/gnirehtet")
    (synopsis "Reverse tethering for Android devices over USB")
    (description
     "Gnirehtet provides reverse tethering for Android, allowing an Android
device to use the computer's internet connection over USB without requiring
root access on the device.  It creates a VPN-like tunnel from the device
through the host computer.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 50. elephant-archlinuxpkgs-bin — Elephant Arch packages provider
;;; ─────────────────────────────────────────────
(define-public elephant-archlinuxpkgs-bin
  (package
    (name "elephant-archlinuxpkgs-bin")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-archlinuxpkgs-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "elephant-archlinuxpkgs" bin-dir)
            (chmod (string-append bin-dir "/elephant-archlinuxpkgs") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "Arch Linux packages provider for Elephant launcher")
    (description
     "This is the Arch Linux packages provider plugin for the Elephant
general-purpose executor.  It allows searching and installing Arch Linux
packages directly from the Elephant launcher interface.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; 51. elephant-bluetooth-bin — Elephant Bluetooth provider
;;; ─────────────────────────────────────────────
(define-public elephant-bluetooth-bin
  (package
    (name "elephant-bluetooth-bin")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-bluetooth-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "elephant-bluetooth" bin-dir)
            (chmod (string-append bin-dir "/elephant-bluetooth") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "Bluetooth device provider for Elephant launcher")
    (description
     "This is the Bluetooth device provider plugin for the Elephant
general-purpose executor.  It allows managing Bluetooth connections
directly from the Elephant launcher interface.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; 52. elephant-desktopapplications-bin — Elephant desktop apps provider
;;; ─────────────────────────────────────────────
(define-public elephant-desktopapplications-bin
  (package
    (name "elephant-desktopapplications-bin")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-desktopapplications-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            ;; Go static binary — no patching needed
            (install-file "elephant-desktopapplications" bin-dir)
            (chmod (string-append bin-dir "/elephant-desktopapplications")
                   #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "Desktop applications provider for Elephant launcher")
    (description
     "This is the desktop applications provider plugin for the Elephant
general-purpose executor.  It allows launching desktop applications
directly from the Elephant launcher interface.")
    (license license:gpl3)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 8: Other resolvable
;;; ═══════════════════════════════════════════════
;;;

;;; ─────────────────────────────────────────────
;;; 53. ruby-http-2 — Pure Ruby HTTP/2
;;; ─────────────────────────────────────────────
(define-public ruby-http-2
  (package
    (name "ruby-http-2")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "http-2" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list ruby))
    (arguments
     (list
      #:install-plan
      #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (gem-home (string-append out "/lib/ruby/gems"))
                     (ruby (search-input-file inputs "/bin/ruby"))
                     (gem (search-input-file inputs "/bin/gem"))
                     (src (assoc-ref %build-inputs "source")))
                (setenv "GEM_HOME" gem-home)
                (invoke gem "install" "--local" "--no-document" src)))))))
    (home-page "https://rubygems.org/gems/http-2")
    (synopsis "Pure Ruby implementation of the HTTP/2 protocol")
    (description
     "http-2 is a pure Ruby implementation of the HTTP/2 binary framing
protocol.  It provides a complete implementation of HTTP/2 connection
management, flow control, header compression (HPACK), and stream
multiplexing.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 54. elephant — General purpose executor (Go)
;;; ─────────────────────────────────────────────
(define-public elephant
  ;; NEEDS_RECIPE_DESIGN: Go module build with many dependencies;
  ;; requires go-build-system with proper vendoring or module proxy setup.
  (package
    (name "elephant")
    (version "2.20.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/abenz1267/elephant")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure (lambda _ #t))
               (replace 'build (lambda _ #t))
               (replace 'install (lambda _ #t)))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "General purpose executor and application launcher")
    (description
     "Elephant is a general-purpose executor written in Go.  It provides
an extensible application launcher with support for plugins that provide
different search sources such as desktop applications, Bluetooth devices,
and package managers.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; 55. scala3 — Scala 3 compiler
;;; ─────────────────────────────────────────────
(define-public scala3
  (package
    (name "scala3")
    (version "3.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/scala/scala3/releases/download/"
             version "/scala3-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (inputs (list bash-minimal openjdk))
    (arguments
     (list
      #:install-plan
      #~'(("bin/" "bin/")
          ("lib/" "lib/scala3/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-binaries
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (java (assoc-ref inputs "openjdk"))
                     (bin-dir (string-append out "/bin")))
                (for-each
                 (lambda (script)
                   (let ((path (string-append bin-dir "/" script)))
                     (when (file-exists? path)
                       (wrap-program path
                         `("JAVA_HOME" = (,java))
                         `("PATH" ":" prefix
                           (,(string-append java "/bin")))))))
                 '("scala" "scalac" "scaladoc" "common"))))))))
    (home-page "http://dotty.epfl.ch")
    (synopsis "Scala 3 programming language compiler and tools")
    (description
     "Scala 3 (formerly Dotty) is the next generation of the Scala programming
language.  It brings significant improvements including a simplified syntax,
union and intersection types, enums, type class derivation, and a new macro
system based on TASTy.")
    (license license:asl2.0)))

;;; ─────────────────────────────────────────────
;;; 56. modern-beep — Modern beep command
;;; ─────────────────────────────────────────────
(define-public modern-beep
  (package
    (name "modern-beep")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/skorotkiewicz/modern-beep/releases/download/v"
             version "/modern-beep-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip patchelf))
    (inputs (list bash-minimal glibc `(,gcc "lib")))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out      (assoc-ref %outputs "out"))
                 (src      (assoc-ref %build-inputs "source"))
                 (tar      (search-input-file %build-inputs "/bin/tar"))
                 (gzip     (search-input-file %build-inputs "/bin/gzip"))
                 (patchelf (search-input-file %build-inputs "/bin/patchelf"))
                 (ld-so    (search-input-file %build-inputs
                                              "/lib/ld-linux-x86-64.so.2"))
                 (libc-lib (dirname (dirname ld-so)))
                 (gcc-lib  (assoc-ref %build-inputs "gcc:lib"))
                 (rpath    (string-append libc-lib "/lib:" gcc-lib "/lib"))
                 (bin-dir  (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH"
                    (string-append (dirname tar) ":"
                                   (dirname gzip)))
            (invoke tar "xzf" src)
            (let ((exe "modern-beep"))
              (install-file exe bin-dir)
              (let ((installed (string-append bin-dir "/" exe)))
                (chmod installed #o755)
                (invoke patchelf "--set-interpreter" ld-so installed)
                (invoke patchelf "--set-rpath" rpath installed)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/skorotkiewicz/modern-beep")
    (synopsis "Modern replacement for the classic beep command")
    (description
     "modern-beep is a modern replacement for the classic Linux beep command.
It provides a simple way to produce system beep sounds from the command line
with configurable frequency and duration.")
    (license license:expat)))

;;; ─────────────────────────────────────────────
;;; 57. claude-code-stable — Claude Code CLI
;;; ─────────────────────────────────────────────
(define-public claude-code-stable
  ;; NEEDS_RECIPE_DESIGN: npm ecosystem package with complex dependency tree;
  ;; requires node-build-system or bundling strategy for npm modules.
  (package
    (name "claude-code-stable")
    (version "2.1.85")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/anthropics/claude-code")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure (lambda _ #t))
               (replace 'build (lambda _ #t))
               (replace 'install (lambda _ #t)))))
    (home-page "https://github.com/anthropics/claude-code")
    (synopsis "Anthropic Claude Code command-line interface")
    (description
     "Claude Code is the official command-line interface for Anthropic's
Claude AI.  It provides an interactive terminal-based coding assistant
that can read, write, and modify code in your projects.")
    (license (license:non-copyleft
              "https://github.com/anthropics/claude-code/blob/main/LICENSE"
              "Custom Anthropic license"))))

;;; ─────────────────────────────────────────────
;;; 58. fortune-mod-off — Fortune with offensive quotes
;;; ─────────────────────────────────────────────
(define-public fortune-mod-off
  (package
    (name "fortune-mod-off")
    (version "3.24.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/shlomif/fortune-mod")
             (commit (string-append "fortune-mod-" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output)
              "-DLOCALDIR=share/fortune"
              "-DOFFDIR=share/fortune/off"
              "-DNO_OFFENSIVE=OFF")))
    (native-inputs (list rinutils pkg-config))
    (inputs (list recode))
    (home-page "https://www.shlomifish.org/open-source/projects/fortune-mod/")
    (synopsis "Fortune cookie program with offensive quotes enabled")
    (description
     "fortune-mod is an implementation of the classic BSD fortune command
that displays a random quotation from a database of quotes.  This build
includes the offensive fortune database that is excluded from the standard
build.")
    (license license:bsd-4)))

;;; ─────────────────────────────────────────────
;;; 59. lidm-systemd-git — TUI display manager systemd files
;;; ─────────────────────────────────────────────
(define-public lidm-systemd-git
  (package
    (name "lidm-systemd-git")
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
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("contrib/lidm.service" "lib/systemd/system/"))))
    (home-page "https://github.com/javalsai/lidm")
    (synopsis "Systemd service files for the lidm TUI display manager")
    (description
     "This package provides systemd service unit files for lidm, a TUI-based
display manager for Linux.  It includes the service files needed to run
lidm as the system display manager under systemd.")
    (license license:gpl3)))

;;; ─────────────────────────────────────────────
;;; 60. domake — Docker make
;;; ─────────────────────────────────────────────
(define-public domake
  ;; NEEDS_RECIPE_DESIGN: requires dosh (Docker shell) which is not in Guix.
  (package
    (name "domake")
    (version "3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gportay/domake")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure (lambda _ #t))
               (replace 'build (lambda _ #t))
               (replace 'install (lambda _ #t)))))
    (home-page "https://github.com/gportay/domake")
    (synopsis "Run make targets inside Docker containers")
    (description
     "domake is a tool for running make targets inside Docker containers.
It wraps the make command to execute builds in isolated Docker environments,
ensuring consistent and reproducible build results across different host
systems.")
    (license license:lgpl2.1+)))

;;; ─────────────────────────────────────────────
;;; 61. openbsd-netcat-tls — OpenBSD netcat with TLS
;;; ─────────────────────────────────────────────
(define-public openbsd-netcat-tls
  (package
    (name "openbsd-netcat-tls")
    (version "1.234")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/"
             "libressl-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list libbsd))
    (home-page "https://www.libressl.org")
    (synopsis "OpenBSD netcat with TLS support via LibreSSL")
    (description
     "This package provides a port of the OpenBSD netcat utility with TLS
support built against LibreSSL.  It can establish encrypted connections
using TLS, making it useful for testing and debugging secure network
services.")
    (license license:isc)))

;;; ─────────────────────────────────────────────
;;; 62. tosu — osu! memory reader
;;; ─────────────────────────────────────────────
(define-public tosu
  ;; NEEDS_RECIPE_DESIGN: likely requires complex Electron/Node.js build
  ;; or binary extraction; build system not straightforward.
  (package
    (name "tosu")
    (version "4.19.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tosuapp/tosu")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure (lambda _ #t))
               (replace 'build (lambda _ #t))
               (replace 'install (lambda _ #t)))))
    (home-page "https://github.com/tosuapp/tosu")
    (synopsis "Memory reader and overlay tool for osu!")
    (description
     "tosu is a memory reader and overlay tool for the rhythm game osu!.
It reads game state from memory in real-time and provides data to
overlays and other tools for stream integration and statistics tracking.")
    (license license:lgpl3)))

;;; ─────────────────────────────────────────────
;;; 63. kaitai-struct-compiler — Binary format parser compiler
;;; ─────────────────────────────────────────────
(define-public kaitai-struct-compiler
  (package
    (name "kaitai-struct-compiler")
    (version "0.11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/kaitai-io/kaitai_struct_compiler"
             "/releases/download/" version
             "/kaitai-struct-compiler-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (inputs (list bash-minimal openjdk))
    (arguments
     (list
      #:install-plan
      #~'(("lib/" "lib/kaitai-struct-compiler/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (java (assoc-ref inputs "openjdk"))
                     (bin-dir (string-append out "/bin"))
                     (lib-dir (string-append out "/lib/kaitai-struct-compiler")))
                (mkdir-p bin-dir)
                (call-with-output-file (string-append bin-dir "/kaitai-struct-compiler")
                  (lambda (port)
                    (format port "#!/bin/sh~%exec ~a/bin/java -jar ~a/kaitai-struct-compiler.jar \"$@\"~%"
                            java lib-dir)))
                (chmod (string-append bin-dir "/kaitai-struct-compiler")
                       #o755)))))))
    (home-page "http://kaitai.io/")
    (synopsis "Compiler for binary data structure definitions")
    (description
     "Kaitai Struct is a declarative language for describing binary data
structures.  The compiler reads structure definitions in Kaitai Struct
YAML format and generates parser source code in multiple target languages
including Python, Java, C++, C#, Ruby, and JavaScript.")
    (license license:gpl3+)))

;;;
;;; ═══════════════════════════════════════════════
;;; Section 9: Compat aliases / binary fallbacks
;;; ═══════════════════════════════════════════════

;;; ─────────────────────────────────────────────
;;; babashka-bin — Clojure scripting runtime (prebuilt)
;;; ─────────────────────────────────────────────
(define-public babashka-bin
  (package
    (name "babashka-bin")
    (version "1.12.217")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/babashka/babashka/releases/download/v"
             version "/babashka-" version "-linux-amd64-static.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip))
    (inputs (list bash-minimal))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out     (assoc-ref %outputs "out"))
                 (src     (assoc-ref %build-inputs "source"))
                 (tar     (search-input-file %build-inputs "/bin/tar"))
                 (gzip    (search-input-file %build-inputs "/bin/gzip"))
                 (bin-dir (string-append out "/bin")))
            (mkdir-p bin-dir)
            (setenv "PATH" (string-append (dirname tar) ":" (dirname gzip)))
            (invoke tar "xzf" src)
            (install-file "bb" bin-dir)
            (chmod (string-append bin-dir "/bb") #o755)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/babashka/babashka")
    (synopsis "fast native Clojure scripting runtime")
    (description
     "Babashka is a native Clojure interpreter for scripting with fast
startup.  It runs as a self-contained statically-linked binary and
supports a large subset of Clojure including multithreading, I/O, and
many popular libraries.")
    (license license:epl1.0)))

;;; ─────────────────────────────────────────────
;;; fftw-amd — FFTW with AMD Ryzen/EPYC optimizations
;;; ─────────────────────────────────────────────
(define-public fftw-amd
  ;; NEEDS_RECIPE_DESIGN: AMD-optimized FFTW fork requires cmake (not
  ;; autotools like upstream fftw), gcc-fortran, and openmpi.  The AMD
  ;; patch set diverges significantly from upstream.
  (package
    (inherit hello)
    (name "fftw-amd")))
