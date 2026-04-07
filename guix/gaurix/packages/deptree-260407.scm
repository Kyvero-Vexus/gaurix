;;; Blocked dependency-tree priority pass 2026-04-07 (deptree-260407).
;;; Selected 100 packages from dep-tree priority queue (blocked_dep_count ASC,
;;; reverse_dep_count DESC, total_dep_count ASC, name ASC).
;;; Status: 7 recipes + 6 compat aliases + 87 re-blocked.
;;; Dependency-tree-driven resolver batch (2026-04-07).
;;; 25 new recipes for previously-undefined packages.
;;; Packages: libjodycode, deb2targz, ttf-gabarito-git, python-pid,
;;;   python-materialyoucolor, wd719x-firmware, scala3, cosmic-icons-git,
;;;   qtutilities-qt6, elephant-archlinuxpkgs-bin, elephant-bluetooth-bin,
;;;   elephant-desktopapplications-bin, elephant-menus-bin,
;;;   elephant-providerlist-bin, elephant-runner-bin,
;;;   mips64-linux-gnu-linux-api-headers, aspnet-runtime-bin,
;;;   aspnet-targeting-pack-bin, brscan4, foobar2000, vscodium-translucent,
;;;   asf, cosmic-randr-git, openbangla-keyboard-git, tuxedo-drivers-dkms.
(define-module (gaurix packages deptree-260407)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (
            ;; recipes
            ttf-vt323
            ttf-xenia
            deno-stable-bin
            rosec-bin
            auto-auto-complete
            fortune-mod-off
            httpdirfs
            ))


;;; ---------- RECIPES ----------

;; ttf-vt323: Monospaced typeface modeled after the VT320 terminal glyphs
(define-public ttf-vt323
  (package
    (name "ttf-vt323")
    (version "2.0")
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages image)
  #:export (libjodycode
            deb2targz
            ttf-gabarito-git
            python-pid
            python-materialyoucolor
            wd719x-firmware
            scala3
            cosmic-icons-git
            qtutilities-qt6
            elephant-archlinuxpkgs-bin
            elephant-bluetooth-bin
            elephant-desktopapplications-bin
            elephant-menus-bin
            elephant-providerlist-bin
            elephant-runner-bin
            mips64-linux-gnu-linux-api-headers
            aspnet-runtime-bin
            aspnet-targeting-pack-bin
            brscan4
            foobar2000
            vscodium-translucent
            asf
            cosmic-randr-git
            openbangla-keyboard-git
            tuxedo-drivers-dkms))
;;; ────────────────────────────────────────────────
;;; libjodycode — shared library by Jody Bruchon
;;; ────────────────────────────────────────────────
(define-public libjodycode
    (name "libjodycode")
    (version "4.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/phoikoi/VT323/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0p7j6svas0jbm77pc5sdxl7bcinbicjc1aky7fgz69pmzb3mjl8p"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts/" "share/fonts/truetype/vt323/"
           #:include-regexp (".*\\.ttf$")))))
    (home-page "https://github.com/phoikoi/VT323/")
    (synopsis "Monospaced typeface based on the VT320 text terminal glyphs")
    (description "VT323 is a monospaced TrueType font designed to emulate
the character shapes from the DEC VT320 text terminal.  It provides a
nostalgic terminal aesthetic suitable for code editors and retro-themed
applications.")
    (license license:silofl1.1)))


;; ttf-xenia: Monospaced font family
(define-public ttf-xenia
  (package
    (name "ttf-xenia")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Loretta1982/xenia/releases/download/v"
             version "/xenia_family.zip"))
       (sha256
        (base32 "0xcdjd0ip5bp068plnng0sfiv90i36vgi45p66c6mh2cpb7scqvd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/xenia/"
           #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://github.com/Loretta1982/xenia")
    (synopsis "Monospaced font designed with legibility in mind")
    (description "Xenia is a monospaced font family designed for readability
and aesthetics.  The family includes regular, bold, italic, and bold-italic
variants.")
    (license (license:non-copyleft
              "https://github.com/Loretta1982/xenia/blob/main/LICENSE"
              "Xenia Monofont license"))))


;; deno-stable-bin: Deno JavaScript/TypeScript runtime (prebuilt binary)
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
        (base32 "1xm7xi141aiddrc3prh6cng3r5g1wyw8p56k08hbh5qc8p8bn04i"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("deno" "bin/deno"))))
    (native-inputs (list unzip))
    (home-page "https://deno.com/")
    (synopsis "Modern JavaScript and TypeScript runtime (prebuilt binary)")
    (description "Deno is a modern runtime for JavaScript and TypeScript that
uses V8 and is built in Rust.  It ships as a single executable with built-in
tooling including a formatter, linter, test runner, and TypeScript compiler.
This package provides the prebuilt binary for x86_64 GNU/Linux.")
    (license license:expat)))


;; rosec-bin: Multi-provider Secret Service daemon with SSH agent
(define-public rosec-bin
  (package
    (name "rosec-bin")
    (version "0.0.25")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/jmylchreest/rosec/releases/download/v"
             version "/rosec-" version
             "-x86_64-unknown-linux-gnu.tar.gz"))
       (sha256
        (base32 "0ddv1d5xcvri1f2sg83gakhjbv5is0d1b6y5xldpv9pkxpva5f8w"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("rosec" "bin/rosec"))))
    (home-page "https://github.com/jmylchreest/rosec")
    (synopsis "Secret service daemon with SSH agent and FUSE mount support")
    (description "Rosec is a multi-provider Secret Service daemon that
supports SSH agent functionality, FUSE mount, and PAM unlock integration.
It provides a D-Bus Secret Service API-compatible secrets manager.")
    (license license:expat)))


;; auto-auto-complete: Shell auto-completion script generator
(define-public auto-auto-complete
  (package
    (name "auto-auto-complete")
    (version "7.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeberg.org/maandree/auto-auto-complete/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0lnk02ivkl85c6qv0jnmic3bck2ma6y62q5i0ccy53kdwlppjclb"))))
             "https://codeberg.org/jbruchon/libjodycode/archive/v"
       (file-name (string-append name "-" version ".tar.gz"))
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
    (inputs (list python))
    (home-page "https://codeberg.org/maandree/auto-auto-complete")
    (synopsis "Autogenerate shell auto-completion scripts")
    (description "Auto-auto-complete generates shell auto-completion scripts
from a simple description format.  It supports Bash, Zsh, and Fish shells.")
    (license license:isc)))


;; fortune-mod-off: Fortune cookie program with offensive quotes
(define-public fortune-mod-off
  (package
    (name "fortune-mod-off")
    (version "3.24.0")
      #~(list (string-append "PREFIX=" #$output)
              (string-append "CC=" (or (getenv "CC") "gcc")))
    (home-page "https://codeberg.org/jbruchon/libjodycode")
    (synopsis "shared code used by several utilities written by Jody Bruchon")
    (description
     "Libjodycode is a shared code library used by several utilities
written by Jody Bruchon, such as jdupes.  It provides common functionality
like string handling, hash algorithms, and other utility functions.")
    (license license:expat)))
;;; ────────────────────────────────────────────────
;;; deb2targz — Debian .deb to .tar.gz converter
;;; ────────────────────────────────────────────────
(define-public deb2targz
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.miketaylor.org.uk/tech/deb/deb2targz")
       (file-name (string-append name "-" version))
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
                 (bin-dir (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "/deb2targz"))
            (chmod (string-append bin-dir "/deb2targz") #o755)
            (wrap-program (string-append bin-dir "/deb2targz")
              `("PATH" ":" prefix
                (,(dirname (search-input-file %build-inputs "/bin/perl")))))
            #t))))
    (inputs (list perl))
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (synopsis "convert a Debian .deb file to a .tar.gz archive")
    (description
     "Deb2targz is a simple Perl script that converts a Debian Linux
@code{.deb} package file to a @code{.tar.gz} archive.")
    (license license:gpl2+)))
;;; ────────────────────────────────────────────────
;;; ttf-gabarito-git — geometric sans typeface
;;; ────────────────────────────────────────────────
(define-public ttf-gabarito-git
    (name "ttf-gabarito-git")
    (version "1.000")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/naipefoundry/gabarito")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fonts/ttf" "share/fonts/truetype/gabarito"))))
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "light-hearted geometric sans typeface with 6 weights")
    (description
     "Gabarito is a light-hearted geometric sans typeface designed by the
Naipe Foundry.  It comes in 6 weights and is suitable for display and
body text.")
    (license license:silofl1.1)))
;;; ────────────────────────────────────────────────
;;; python-pid — pidfile with stale detection
;;; ────────────────────────────────────────────────
(define-public python-pid
    (name "python-pid")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shlomif/fortune-mod/archive/refs/tags/"
             "fortune-mod-" version ".tar.gz"))
       (sha256
        (base32 "1bc5ik9kc6grf1smv9cbkh292ir5y86dgch010cpfhwr4jhqkf0c"))))
             "https://files.pythonhosted.org/packages/source/p/pid/pid-"
             version ".tar.gz"))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/trbs/pid")
    (synopsis "pidfile featuring stale detection and file-locking")
    (description
     "Python daemon PID file module with stale detection and file-locking.
Provides a context manager for creating and managing PID files for daemon
processes.")
    (license license:asl2.0)))

;;; ────────────────────────────────────────────────
;;; python-materialyoucolor — Material You colors
;;; ────────────────────────────────────────────────
(define-public python-materialyoucolor
  (package
    (name "python-materialyoucolor")
    (version "3.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://files.pythonhosted.org/packages/source/m/"
             "materialyoucolor/materialyoucolor-" version ".tar.gz"))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pillow))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "Material You color algorithms for Python")
    (description
     "Materialyoucolor is a Python library implementing Material You
color algorithms.  It generates dynamic color schemes from images,
similar to Android's Material You theming system.")
    (license license:expat)))

;;; ────────────────────────────────────────────────
;;; wd719x-firmware — Western Digital SCSI firmware
;;; ────────────────────────────────────────────────
(define-public wd719x-firmware
  (package
    (name "wd719x-firmware")
    (version "1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mijailr/wd719x-firmware")
             (commit "master")))
       (file-name (git-file-name name version))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/wd719x/"
           #:include-regexp (".*\\.bin$")))))
    (home-page "https://github.com/mijailr/wd719x-firmware")
    (synopsis "firmware for Western Digital WD7193/WD7197/WD7296 SCSI cards")
    (description
     "Firmware blobs for Western Digital WD7193, WD7197, and WD7296
SCSI host adapter cards.")
    (license (license:non-copyleft
              "file://LICENCE"
              "Custom firmware license"))))

;;; ────────────────────────────────────────────────
;;; scala3 — Scala 3 compiler (Dotty)
;;; ────────────────────────────────────────────────
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
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin" "bin")
          ("lib" "lib")
          ("VERSION" "share/scala3/VERSION"))))
    (home-page "https://dotty.epfl.ch")
    (synopsis "Scala 3 compiler, also known as Dotty")
    (description
     "Scala 3 (Dotty) is the latest version of the Scala programming
language compiler.  It features a simplified syntax, improved type
inference, and new metaprogramming capabilities.")
    (license license:asl2.0)))

;;; ────────────────────────────────────────────────
;;; cosmic-icons-git — System76 Cosmic icon theme
;;; ────────────────────────────────────────────────
(define-public cosmic-icons-git
  (package
    (name "cosmic-icons-git")
    (version "1.0.0-alpha.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-icons")
             (commit "epoch-1.0.0-alpha.5.1")))
       (file-name (git-file-name name version))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/icons/Cosmic/"
           #:include-regexp (".*\\.svg$" "index\\.theme")))))
    (home-page "https://github.com/pop-os/cosmic-icons")
    (synopsis "System76 Cosmic icon theme")
    (description
     "Icon theme for the System76 COSMIC desktop environment.  Contains
SVG icons following the freedesktop.org icon naming specification.")
    (license (list license:cc-by-sa4.0 license:gpl3))))

;;; ────────────────────────────────────────────────
;;; qtutilities-qt6 — Qt 6 utility library
;;; ────────────────────────────────────────────────
(define-public qtutilities-qt6
  (package
    (name "qtutilities-qt6")
    (version "6.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Martchus/qtutilities/archive/v"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DLOCALDIR=" #$output "/share/fortune"))))
    (native-inputs (list pkg-config))
    (inputs (list bash-minimal))
    (home-page "https://www.shlomifish.org/open-source/projects/fortune-mod/")
    (synopsis "Fortune cookie program including offensive quotes")
    (description "Fortune-mod displays random quotes (fortune cookies) from a
database of quotation files.  This version includes the offensive quotes that
were removed from some distributions.")
    (license license:bsd-4)))


;; httpdirfs: FUSE filesystem for HTTP directory listings
(define-public httpdirfs
  (package
    (name "httpdirfs")
    (version "1.2.7")
      #~(list "-DCONFIGURATION_NAME=qt6"
              "-DQT_PACKAGE_PREFIX=Qt6"
              "-DBUILTIN_TRANSLATIONS=ON"
              "-DBUILD_SHARED_LIBS=ON")))
    (home-page "https://github.com/Martchus/qtutilities")
    (synopsis "common Qt related C++ classes and routines")
    (description
     "Qtutilities provides common Qt related C++ classes and routines
used by applications such as dialogs, widgets, and models.  This build
targets Qt 6.")
    (license license:gpl2+)))
;;; ────────────────────────────────────────────────
;;; elephant-*-bin — elephant launcher provider plugins
;;; ────────────────────────────────────────────────
(define (make-elephant-plugin-bin plugin-name description-text)
  "Create an elephant plugin binary package."
    (name (string-append "elephant-" plugin-name "-bin"))
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/fangfufu/httpdirfs/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1wz9amh32fnrz57l2j3g66q7sxrms8g4mpcs3fbk4cggm98nipn7"))))
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-" plugin-name "-linux-amd64"))
       (file-name (string-append "elephant-" plugin-name "-" version))
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin-dir (string-append out "/lib/elephant/"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin-dir)
            (copy-file src (string-append bin-dir "elephant-"
                                          #$plugin-name))
            (chmod (string-append bin-dir "elephant-" #$plugin-name)
                   #o755)
            #t))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis (string-append plugin-name " provider for elephant launcher"))
    (description
     (string-append "The " plugin-name " provider plugin for the Elephant
application launcher.  " description-text))
    (license license:gpl3)))

(define-public elephant-archlinuxpkgs-bin
  (make-elephant-plugin-bin
   "archlinuxpkgs"
   "Provides Arch Linux package search integration."))

(define-public elephant-bluetooth-bin
  (make-elephant-plugin-bin
   "bluetooth"
   "Provides Bluetooth device management integration."))

(define-public elephant-desktopapplications-bin
  (make-elephant-plugin-bin
   "desktopapplications"
   "Provides desktop application search and launch capabilities."))

(define-public elephant-menus-bin
  (make-elephant-plugin-bin
   "menus"
   "Provides menu-based navigation integration."))

(define-public elephant-providerlist-bin
  (make-elephant-plugin-bin
   "providerlist"
   "Provides a list of available providers for the launcher."))

(define-public elephant-runner-bin
  (make-elephant-plugin-bin
   "runner"
   "Provides command runner integration for executing shell commands."))

;;; ────────────────────────────────────────────────
;;; mips64-linux-gnu-linux-api-headers — cross kernel headers
;;; ────────────────────────────────────────────────
(define-public mips64-linux-gnu-linux-api-headers
  (package
    (name "mips64-linux-gnu-linux-api-headers")
    (version "6.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"
             version ".tar.xz"))
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
    (native-inputs (list pkg-config))
    (inputs (list curl expat fuse gumbo-parser openssl util-linux))
    (home-page "https://github.com/fangfufu/httpdirfs")
    (synopsis "FUSE filesystem for mounting HTTP directory listings")
    (description "HTTPDirFS is a FUSE-based filesystem that allows mounting
HTTP directory listings as a local filesystem.  It supports caching, partial
downloads, and works with Apache, Nginx, and other web servers that provide
directory listings.")
    (license license:gpl3+)))
          (delete 'configure)
          (replace 'build
            (lambda _
              (invoke "make" "ARCH=mips" "headers_install"
                      (string-append "INSTALL_HDR_PATH=" #$output))))
          (delete 'install))))
    (native-inputs (list rsync))
    (home-page "https://www.kernel.org")
    (synopsis "kernel headers sanitized for userspace (MIPS64 target)")
    (description
     "Linux kernel API headers sanitized for use in userspace, targeting
the MIPS64 architecture.  These headers are used for cross-compilation
toolchains.")
    (license license:gpl2)))

;;; ────────────────────────────────────────────────
;;; aspnet-runtime-bin — ASP.NET Core runtime (binary)
;;; ────────────────────────────────────────────────
(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com")
    (synopsis "ASP.NET Core runtime (binary)")
    (description
     "The ASP.NET Core runtime enables running ASP.NET Core web applications.
This is a prebuilt binary distribution for x86_64 Linux.")
    (license license:expat)))

;;; ────────────────────────────────────────────────
;;; aspnet-targeting-pack-bin — ASP.NET targeting pack
;;; ────────────────────────────────────────────────
(define-public aspnet-targeting-pack-bin
  (package
    (name "aspnet-targeting-pack-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/"
             version "/aspnetcore-targeting-pack-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dotnet.microsoft.com")
    (synopsis "ASP.NET Core targeting pack (binary)")
    (description
     "The ASP.NET Core targeting pack provides reference assemblies for
building ASP.NET Core applications.  This is a prebuilt binary
distribution.")
    (license license:expat)))

;;; ────────────────────────────────────────────────
;;; brscan4 — Brother SANE scanner drivers
;;; ────────────────────────────────────────────────
(define-public brscan4
  (package
    (name "brscan4")
    (version "0.4.11-1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.brother.com/welcome/dlf105203/"
             "brscan4-" version ".x86_64.rpm"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt" "opt")
          ("etc" "etc"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://support.brother.com")
    (synopsis "SANE drivers from Brother for compatible scanner models")
    (description
     "SANE scanner drivers from Brother for compatible scanner models.
This is a proprietary binary package redistributed from Brother's
official download site.")
    (license (license:non-copyleft
              "https://support.brother.com"
              "Brother proprietary license"))))

;;; ────────────────────────────────────────────────
;;; foobar2000 — audio player (Wine-based)
;;; ────────────────────────────────────────────────
(define-public foobar2000
  (package
    (name "foobar2000")
    (version "2.25.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.foobar2000.org/files/foobar2000-x64_v"
             version ".exe"))
       (file-name (string-append name "-" version ".exe"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/foobar2000/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.foobar2000.org")
    (synopsis "advanced freeware audio player (uses Wine)")
    (description
     "Foobar2000 is an advanced freeware audio player for Windows.
This package provides the Windows binary which requires Wine to run
on Linux.")
    (license (license:non-copyleft
              "https://www.foobar2000.org"
              "Freeware, custom license"))))

;;; ────────────────────────────────────────────────
;;; vscodium-translucent — VSCodium with translucency
;;; ────────────────────────────────────────────────
(define-public vscodium-translucent
  (package
    (name "vscodium-translucent")
    (version "1.109.51242")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/VSCodium/vscodium/releases/download/"
             version "/VSCodium-linux-x64-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vscodium/"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VSCodium/vscodium")
    (synopsis "free/libre binaries of VS Code with translucent patch")
    (description
     "VSCodium Translucent is a community-driven distribution of
Visual Studio Code with the translucent patch applied.  It provides
free/libre open-source binaries without Microsoft telemetry.")
    (license license:expat)))

;;; ────────────────────────────────────────────────
;;; asf — ArchiSteamFarm
;;; ────────────────────────────────────────────────
(define-public asf
  (package
    (name "asf")
    (version "6.3.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/JustArchiNET/ArchiSteamFarm")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/asf/"))))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "Steam cards farmer")
    (description
     "ArchiSteamFarm (ASF) is a C# application with primary purpose
of farming Steam cards from multiple accounts simultaneously.  Requires
the .NET runtime.")
    (license license:asl2.0)))

;;; ────────────────────────────────────────────────
;;; cosmic-randr-git — Wayland output configuration
;;; ────────────────────────────────────────────────
(define-public cosmic-randr-git
  (package
    (name "cosmic-randr-git")
    (version "1.0.0-beta.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pop-os/cosmic-randr")
             (commit "epoch-1.0.0-beta.8")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/cosmic-randr/"))))
    (home-page "https://github.com/pop-os/cosmic-randr")
    (synopsis "library and utility for configuring Wayland outputs")
    (description
     "Cosmic-randr is a library and command-line utility for displaying
and configuring Wayland outputs for the COSMIC desktop environment.")
    (license license:mpl2.0)))

;;; ────────────────────────────────────────────────
;;; openbangla-keyboard-git — Bengali input method
;;; ────────────────────────────────────────────────
(define-public openbangla-keyboard-git
  (package
    (name "openbangla-keyboard-git")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenBangla/OpenBangla-Keyboard")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DENABLE_IBUS=ON")))
    (home-page "https://openbangla.github.io")
    (synopsis "open-source Unicode-compliant Bengali input method")
    (description
     "OpenBangla Keyboard is an open-source, Unicode-compliant Bengali
input method for Linux.  It supports Avro Phonetic, Probhat, and other
popular Bengali keyboard layouts.")
    (license license:gpl3)))

;;; ────────────────────────────────────────────────
;;; tuxedo-drivers-dkms — TUXEDO kernel drivers
;;; ────────────────────────────────────────────────
(define-public tuxedo-drivers-dkms
  (package
    (name "tuxedo-drivers-dkms")
    (version "4.21.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/tuxedocomputers/development/packages/"
             "tuxedo-drivers/-/archive/v" version
             "/tuxedo-drivers-v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "src/tuxedo-drivers/"))))
    (home-page
     "https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers")
    (synopsis "TUXEDO Computers kernel module drivers")
    (description
     "Kernel module drivers for TUXEDO Computers laptops, providing
support for keyboard backlight, fans, and general hardware I/O
using the SysFS interface.  Requires DKMS or manual kernel module
compilation.")
    (license license:gpl2+)))
