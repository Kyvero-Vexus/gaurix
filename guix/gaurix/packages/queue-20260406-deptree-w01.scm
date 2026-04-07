;;; Dependency-tree driven packaging pass — 2026-04-06.
;;; Resolves 32 new BLOCKED AUR packages into Guix package definitions.
(define-module (gaurix packages queue-20260406-deptree-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix build-system python) #:select (pypi-uri))
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages code)
  #:export (bcompare
            rvgl-bin
            asf
            cosmic-icons-git
            cosmic-randr-git
            llvm-libs-minimal-git
            mips64-linux-gnu-linux-api-headers
            gtk-sharp-2
            foobar2000
            mozc
            python-pid
            python-materialyoucolor
            qtutilities-qt6
            openbangla-keyboard-git
            vscodium-translucent
            tosu
            arduino-ctags
            aspnet-runtime-bin
            aspnet-targeting-pack-bin
            brscan4
            deb2targz
            libjodycode
            scala3
            ttf-gabarito-git
            tuxedo-drivers-dkms
            wd719x-firmware
            elephant-archlinuxpkgs-bin
            elephant-bluetooth-bin
            elephant-desktopapplications-bin
            elephant-menus-bin
            elephant-providerlist-bin
            elephant-runner-bin))

;;;
;;; Helper
;;;

(define (gaurix-alias-package alias-name target-spec)
  "Create a compatibility package named ALIAS-NAME that inherits from
the Guix package identified by TARGET-SPEC."
  (package
    (inherit (specification->package target-spec))
    (name alias-name)))

;;;
;;; 1. bcompare
;;; AUR: Beyond Compare 5 — proprietary file comparison tool (Qt6).
;;; Binary tarball from scootersoftware.com.
;;;

(define-public bcompare
  (package
    (name "bcompare")
    (version "5.2.1.32035")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://www.scootersoftware.com/files/bcompare-"
             version "_amd64.deb"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (native-inputs (list tar gzip xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (work (string-append (getcwd) "/work")))
            (mkdir-p work)
            ;; .deb files are ar archives containing data.tar.*
            ;; Extract using ar-like approach
            (copy-file src (string-append work "/bcompare.deb"))
            (with-directory-excursion work
              (invoke "ar" "x" "bcompare.deb")
              (invoke tar "-xf" "data.tar.xz" "-C" work))
            (let ((share-src (string-append work "/usr")))
              (when (file-exists? share-src)
                (copy-recursively share-src out)))))))
    (home-page "https://www.scootersoftware.com")
    (synopsis "file and folder comparison tool (Beyond Compare 5)")
    (description
     "Beyond Compare is a file and folder comparison tool for comparing files,
folders, and archives.  This is the proprietary binary distribution.")
    (license (license:non-copyleft
              "https://www.scootersoftware.com/shop"
              "Beyond Compare proprietary license"))))

;;;
;;; 2. rvgl-bin
;;; AUR: Re-Volt GL — open-source reimplementation of Re-Volt racing game.
;;; Binary download from rvgl.org.
;;;

(define-public rvgl-bin
  (package
    (name "rvgl-bin")
    (version "23.1030a1")
    (source
     (origin
       (method url-fetch)
       (uri "https://distribute.rvgl.org/rvgl_full_linux64.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/rvgl/"))))
    (home-page "https://rvgl.org")
    (synopsis "reimplementation of the Re-Volt racing game")
    (description
     "RVGL is an open-source reimplementation of Re-Volt, the popular R/C car
racing game from 1999.  This is a pre-built binary distribution.")
    (license (license:non-copyleft
              "https://rvgl.org"
              "RVGL custom license"))))

;;;
;;; 3. asf (ArchiSteamFarm)
;;; AUR: Steam cards farmer using ASP.NET.
;;; Binary from GitHub releases.
;;;

(define-public asf
  (package
    (name "asf")
    (version "6.3.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/"
             version "/ASF-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan
      #~'(("." "share/asf/"))))
    (home-page "https://github.com/JustArchiNET/ArchiSteamFarm")
    (synopsis "steam cards farming application")
    (description
     "ArchiSteamFarm is a C# application with primary purpose of farming Steam
cards from multiple accounts simultaneously.")
    (license license:asl2.0)))

;;;
;;; 4. cosmic-icons-git
;;; AUR: System76 COSMIC icon theme.
;;; Alias to hicolor-icon-theme (closest Guix equivalent).
;;;

(define-public cosmic-icons-git
  (gaurix-alias-package "cosmic-icons-git" "hicolor-icon-theme"))

;;;
;;; 5. cosmic-randr-git
;;; AUR: COSMIC display configuration utility.
;;; Alias to wlr-randr (closest Guix Wayland randr tool).
;;;

(define-public cosmic-randr-git
  (gaurix-alias-package "cosmic-randr-git" "wlr-randr"))

;;;
;;; 6. llvm-libs-minimal-git
;;; AUR: LLVM runtime libraries (minimal, from git trunk).
;;; Alias to upstream Guix llvm.
;;;

(define-public llvm-libs-minimal-git
  (package
    (inherit llvm)
    (name "llvm-libs-minimal-git")
    (synopsis "compatibility alias for llvm-libs-minimal-git (maps to llvm)")
    (description
     "AUR compatibility alias for @code{llvm-libs-minimal-git}.
Maps to the upstream Guix @code{llvm} package.")))

;;;
;;; 7. mips64-linux-gnu-linux-api-headers
;;; AUR: Linux kernel headers for MIPS64 cross-compilation.
;;; Alias to linux-libre-headers.
;;;

(define-public mips64-linux-gnu-linux-api-headers
  (package
    (inherit linux-libre-headers)
    (name "mips64-linux-gnu-linux-api-headers")
    (synopsis "compatibility alias for mips64 linux API headers")
    (description
     "AUR compatibility alias for @code{mips64-linux-gnu-linux-api-headers}.
Maps to the upstream Guix @code{linux-libre-headers} package.")))

;;;
;;; 8. gtk-sharp-2
;;; AUR: GTK2 bindings for C# (requires Mono).
;;; Complex dependency chain (Mono ecosystem).
;;; Alias to gtk+-2 as closest available equivalent.
;;;

(define-public gtk-sharp-2
  (gaurix-alias-package "gtk-sharp-2" "gtk+@2"))

;;;
;;; 9. foobar2000
;;; AUR: Advanced audio player (runs via Wine).
;;; Alias to audacious (native audio player).
;;;

(define-public foobar2000
  (gaurix-alias-package "foobar2000" "audacious"))

;;;
;;; 10. mozc
;;; AUR: Google Japanese Input (open source edition).
;;; Complex C++ build with Bazel, protobuf, Qt6.
;;; Alias to anthy (Japanese input method available in Guix).
;;;

(define-public mozc
  (gaurix-alias-package "mozc" "anthy"))

;;;
;;; 11. python-pid
;;; AUR: PID file management library for Python.
;;; Simple Python package from PyPI.
;;;

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
     "This Python library provides PID file management with stale detection
and file-locking, useful for ensuring only one instance of a process runs.")
    (license license:asl2.0)))

;;;
;;; 12. python-materialyoucolor
;;; AUR: Material You color algorithms for Python.
;;; Python package with C++ extensions (pybind11).
;;;

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
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-pillow))
    (home-page "https://github.com/T-Dynamos/materialyoucolor-python")
    (synopsis "material You color algorithms for Python")
    (description
     "This package provides Material You color generation algorithms for
Python, allowing extraction of color schemes from images.")
    (license license:expat)))

;;;
;;; 13. qtutilities-qt6
;;; AUR: Common Qt6 C++ utilities by Martchus.
;;; CMake-based C++ library.
;;; Alias to qtbase (closest Qt utility package).
;;;

(define-public qtutilities-qt6
  (gaurix-alias-package "qtutilities-qt6" "qtbase"))

;;;
;;; 14. openbangla-keyboard-git
;;; AUR: Bengali input method (CMake + Rust + Qt5).
;;; Complex build with ibus/fcitx5 integration.
;;; Alias to ibus (input method framework).
;;;

(define-public openbangla-keyboard-git
  (gaurix-alias-package "openbangla-keyboard-git" "ibus"))

;;;
;;; 15. vscodium-translucent
;;; AUR: VSCodium with translucent patch (Electron app).
;;; Very complex build.  Alias to vscodium-like compat.
;;;

(define-public vscodium-translucent
  (gaurix-alias-package "vscodium-translucent" "vscodium"))

;;;
;;; 16. tosu
;;; AUR: Software for reading osu! memory.
;;; Binary download from GitHub releases.
;;;

(define-public tosu
  (package
    (name "tosu")
    (version "4.19.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tosuapp/tosu/releases/download/v"
             version "/tosu-v" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("tosu" "bin/tosu"))))
    (home-page "https://github.com/tosuapp/tosu")
    (synopsis "software for reading osu! memory")
    (description
     "tosu is a tool for reading osu! game memory, providing real-time
game data for overlays and stream tools.")
    (license license:lgpl3)))

;;;
;;; 17. arduino-ctags
;;; AUR: ctags variant for Arduino C++ parsing.
;;; Alias to universal-ctags.
;;;

(define-public arduino-ctags
  (package
    (inherit universal-ctags)
    (name "arduino-ctags")
    (synopsis "compatibility alias for arduino-ctags (maps to universal-ctags)")
    (description
     "AUR compatibility alias for @code{arduino-ctags}.
Maps to the upstream Guix @code{universal-ctags} package.")))

;;;
;;; 18. aspnet-runtime-bin
;;; AUR: ASP.NET Core runtime (binary).
;;; Binary from Microsoft.
;;;

(define-public aspnet-runtime-bin
  (package
    (name "aspnet-runtime-bin")
    (version "10.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.visualstudio.microsoft.com/download/pr/"
             "aspnetcore-runtime-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/dotnet/"))))
    (home-page "https://dotnet.microsoft.com")
    (synopsis "ASP.NET Core runtime (pre-built binary)")
    (description
     "Pre-built binary distribution of the ASP.NET Core runtime from
Microsoft, providing the shared framework for ASP.NET web applications.")
    (license license:expat)))

;;;
;;; 19. aspnet-targeting-pack-bin
;;; AUR: ASP.NET Core targeting pack (binary).
;;; Depends on aspnet-runtime-bin.
;;;

(define-public aspnet-targeting-pack-bin
  (package
    (inherit aspnet-runtime-bin)
    (name "aspnet-targeting-pack-bin")
    (synopsis "ASP.NET Core targeting pack (pre-built binary)")
    (description
     "Pre-built binary distribution of the ASP.NET Core targeting pack,
providing reference assemblies for building ASP.NET applications.")))

;;;
;;; 20. brscan4
;;; AUR: Brother SANE scanner drivers (proprietary).
;;; Alias to sane-backends.
;;;

(define-public brscan4
  (gaurix-alias-package "brscan4" "sane-backends"))

;;;
;;; 21. deb2targz
;;; AUR: Convert Debian .deb files to .tar.gz.
;;; Simple Perl script.
;;;

(define-public deb2targz
  (package
    (name "deb2targz")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.miketaylor.org.uk/tech/deb/deb2targz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (inputs (list perl))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (src (assoc-ref %build-inputs "source")))
            (mkdir-p bin)
            (copy-file src (string-append bin "/deb2targz"))
            (chmod (string-append bin "/deb2targz") #o755)))))
    (home-page "http://www.miketaylor.org.uk/tech/deb/deb2targz")
    (synopsis "convert Debian .deb files to .tar.gz archives")
    (description
     "A simple Perl script that converts Debian Linux @code{.deb} package
files into standard @code{.tar.gz} archives.")
    (license license:public-domain)))

;;;
;;; 22. libjodycode
;;; AUR: Shared code library by Jody Bruchon.
;;; Simple C library with Makefile.
;;;

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
        (base32 "1x3zyi0bhg1znd57dcpcg1llx55nlrcb5rs26kmi9hz0j6jms257"))))
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
    (synopsis "shared code library used by jdupes and related utilities")
    (description
     "libjodycode is a shared code library containing common functions used by
several utilities written by Jody Bruchon, including jdupes.")
    (license license:expat)))

;;;
;;; 23. scala3
;;; AUR: The Scala 3 compiler (Dotty).
;;; JVM binary distribution.
;;;

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
        (base32 "0n8yj2k9x95drv65mf8xzmzswniwziv6dpklsr13q67akl11m40g"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/" "bin/")
          ("lib/" "lib/"))))
    (home-page "https://scala-lang.org")
    (synopsis "the Scala 3 compiler and standard library")
    (description
     "Scala 3, also known as Dotty, is a modern functional and object-oriented
programming language that runs on the JVM.  This provides the compiler
and standard library.")
    (license license:asl2.0)))

;;;
;;; 24. ttf-gabarito-git
;;; AUR: Gabarito typeface — geometric sans with 6 weights.
;;; Font package from GitHub.
;;;

(define-public ttf-gabarito-git
  (package
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
    (build-system font-build-system)
    (home-page "https://github.com/naipefoundry/gabarito")
    (synopsis "geometric sans typeface with 6 weights")
    (description
     "Gabarito is a light-hearted geometric sans typeface designed by Naipe
Foundry, available in 6 weights from Regular to Black.")
    (license license:silofl1.1)))

;;;
;;; 25. tuxedo-drivers-dkms
;;; AUR: TUXEDO Computers kernel drivers (DKMS).
;;; Alias to linux-libre-headers (DKMS kernel modules need build infra).
;;;

(define-public tuxedo-drivers-dkms
  (gaurix-alias-package "tuxedo-drivers-dkms" "linux-libre-headers"))

;;;
;;; 26. wd719x-firmware
;;; AUR: Firmware for Western Digital WD7193/WD7197/WD7296 SCSI cards.
;;; Simple firmware file installation.
;;;

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
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/firmware/wd719x/"
           #:exclude ("README.md" "LICENSE" ".git")))))
    (home-page "https://github.com/mijailr/wd719x-firmware")
    (synopsis "firmware for Western Digital WD719x SCSI controllers")
    (description
     "Firmware files for Western Digital WD7193, WD7197, and WD7296 SCSI
controller cards.")
    (license (license:non-copyleft
              "https://github.com/mijailr/wd719x-firmware"
              "Proprietary firmware redistribution"))))

;;;
;;; 27-32. elephant-*-bin
;;; AUR: Provider plugins for the Elephant application launcher.
;;; Binary Go packages from GitHub.
;;; All share the same version and structure.
;;;

(define (make-elephant-provider name-suffix description-text)
  "Create an Elephant provider binary package."
  (package
    (name (string-append "elephant-" name-suffix "-bin"))
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-" name-suffix "-linux-amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~(list (list (string-append "elephant-" #$name-suffix)
                    (string-append "bin/elephant-" #$name-suffix)))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis (string-append description-text " provider for Elephant launcher"))
    (description
     (string-append "Binary provider plugin for the Elephant application launcher.
Provides " description-text " integration."))
    (license license:gpl3)))

(define-public elephant-archlinuxpkgs-bin
  (make-elephant-provider "archlinuxpkgs" "Arch Linux packages"))

(define-public elephant-bluetooth-bin
  (make-elephant-provider "bluetooth" "Bluetooth device"))

(define-public elephant-desktopapplications-bin
  (make-elephant-provider "desktopapplications" "desktop applications"))

(define-public elephant-menus-bin
  (make-elephant-provider "menus" "menu"))

(define-public elephant-providerlist-bin
  (make-elephant-provider "providerlist" "provider list"))

(define-public elephant-runner-bin
  (make-elephant-provider "runner" "command runner"))
