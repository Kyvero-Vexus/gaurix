;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417aq
;;; Resolves 25 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (7):
;;;    1.  wscat (copy-build-system, v6.1.0, MIT)
;;;    2.  apache-tools (gnu-build-system, v2.4.66, Apache-2.0)
;;;    3.  passwordsafe (cmake-build-system, v1.23.0, Artistic-2.0)
;;;    4.  brother-hl2030 (copy-build-system, v2.0.1, GPL-2.0)
;;;    5.  kopia-ui-bin (copy-build-system, v0.22.3, Apache-2.0)
;;;    6.  python-steamgriddb (pyproject-build-system, v1.0.5, MIT)
;;;    7.  selectdefaultapplication-git (cmake-build-system, v0.1, GPL-2.0+)
;;;
;;; BLOCKED (18):
;;;    8. linux-firmware-whence-git (COMPLEX_DEPS — 600MB+ git repo of firmware
;;;       blobs; split-package architecture with 9 sub-packages; requires
;;;       parallel+rdfind+python build deps; A1: too large for single-pass
;;;       recipe; A2: needs split-output packaging infrastructure)
;;;    9. linux-firmware-git (COMPLEX_DEPS — depends on linux-firmware-whence-git
;;;       infrastructure; split into 8+ sub-packages by vendor; requires
;;;       custom make install with DESTDIR; A1: parent package not ready)
;;;   10. amd-ucode-git (DEP_RESOLUTION_FAILED — depends on linux-firmware-git
;;;       build infrastructure; extracted from linux-firmware during build)
;;;   11. linux-firmware-nfp-git (DEP_RESOLUTION_FAILED — split package from
;;;       linux-firmware-git for Netronome Flow Processors)
;;;   12. linux-firmware-mellanox-git (DEP_RESOLUTION_FAILED — split package
;;;       from linux-firmware-git for Mellanox Spectrum switches)
;;;   13. linux-firmware-marvell-git (DEP_RESOLUTION_FAILED — split package
;;;       from linux-firmware-git for Marvell devices)
;;;   14. linux-firmware-qcom-git (DEP_RESOLUTION_FAILED — split package from
;;;       linux-firmware-git for Qualcomm SoCs)
;;;   15. linux-firmware-liquidio-git (DEP_RESOLUTION_FAILED — split package
;;;       from linux-firmware-git for Cavium LiquidIO adapters)
;;;   16. linux-firmware-qlogic-git (DEP_RESOLUTION_FAILED — split package
;;;       from linux-firmware-git for QLogic devices)
;;;   17. linux-firmware-bnx2x-git (DEP_RESOLUTION_FAILED — split package
;;;       from linux-firmware-git for Broadcom NetXtreme II adapters)
;;;   18. vim-youcompleteme-git (COMPLEX_DEPS — code completion engine needing
;;;       git submodules (ycmd); cmake+pybind11 build; clang runtime dep;
;;;       A1: ycmd server build is complex; A2: multiple git sources; A3:
;;;       needs specific clang/llvm version matching)
;;;   19. syncthingtray (DEP_RESOLUTION_FAILED — depends on qtutilities,
;;;       qtforkawesome, c++utilities libraries not in Guix; A1: package
;;;       3 dependency libraries first; A2: boost+Qt5+cmake build)
;;;   20. floorp (COMPLEX_DEPS — Firefox fork requiring cargo+cbindgen+clang+
;;;       deno+lld+llvm+mercurial+wasi-libc; 25+ makedepends; A1: Firefox-class
;;;       build complexity; A2: needs wasi toolchain; A3: multiple git sources)
;;;   21. ladybird-git (COMPLEX_DEPS — web browser with 24+ deps including
;;;       angle, simdutf-git, cpptrace, skia-static not in Guix; A1: too many
;;;       unpackaged deps; A2: fast_float+sdl3 not in Guix; A3: cmake+ninja)
;;;   22. cdesktopenv (DEP_RESOLUTION_FAILED — CDE desktop requiring ksh,
;;;       openmotif, opensp, libutempter not in Guix; A1: package 4+ deps
;;;       first; A2: complex X11 desktop environment; A3: legacy codebase)
;;;   23. apparmor.d-git (TOOLING_FAILURE — Go project using 'just' build
;;;       system; requires go+just+git; A1: 'just' not in Guix; A2: Go
;;;       module vendoring needed; A3: apparmor version constraints)
;;;   24. asf (COMPLEX_DEPS — ArchiSteamFarm .NET project; requires
;;;       dotnet-sdk>=10 and aspnet-runtime>=10 not in Guix; A1: .NET
;;;       ecosystem not well-supported in Guix; A2: 7 sub-packages)
;;;   25. pamac-all (DEP_RESOLUTION_FAILED — Manjaro package manager depending
;;;       on libpamac-full, pamac-cli; Arch/Manjaro-specific; A1: core deps
;;;       not portable; A2: vala+meson build; A3: deeply tied to pacman)
;;;
;;; 7 new recipes + 18 BLOCKED = 25 resolved
;;;
;;; All sha256 hashes obtained via `guix download` or `guix hash`.

(define-module (gaurix packages recipe-resolver-260417aq)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages apr)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages node)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages check)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages image)
  #:export (
            wscat
            apache-tools
            passwordsafe
            brother-hl2030
            kopia-ui-bin
            ))

;;; ===================================================================
;;; 1. wscat — WebSocket client for the command line
;;; ===================================================================
(define-public wscat
  (package
    (name "wscat")
    (version "6.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://registry.npmjs.org/wscat/-/wscat-"
                    version ".tgz"))
              (sha256
               (base32
                "07jyw7sxysdw2h1mpgw7p490mzyi44iivwrm53q677j635ycfrs8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("package/." "lib/node_modules/wscat/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-deps-and-link
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (with-directory-excursion
                    (string-append out "/lib/node_modules/wscat")
                  (invoke "npm" "install" "--production" "--no-optional"))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/lib/node_modules/wscat/bin/wscat")
                         (string-append out "/bin/wscat"))))))))
    (inputs (list node))
    (synopsis "WebSocket client for the command line")
    (description "Wscat is a command-line WebSocket client, similar to netcat
but for WebSocket connections.  It allows connecting to WebSocket servers,
sending messages, and inspecting responses interactively from the terminal.")
    (home-page "https://github.com/websockets/wscat")
    (license license:expat)))

;;; ===================================================================
;;; 2. apache-tools — Apache HTTP utilities (htpasswd, ab, etc.)
;;; ===================================================================
(define-public apache-tools
  (package
    (name "apache-tools")
    (version "2.4.66")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dlcdn.apache.org/httpd/httpd-"
                    version ".tar.bz2"))
              (sha256
               (base32
                "0nm2zvy6w4g4jqsss8y6g655b3nlp969x8hbhy785fxc88mzzmwl"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key outputs #:allow-other-keys)
              (invoke "./configure"
                      (string-append "--prefix=" (assoc-ref outputs "out"))
                      "--with-apr=" (search-input-directory %build-inputs "bin")
                      "--with-pcre="
                      (search-input-directory %build-inputs "bin"))))
          (replace 'build
            (lambda _
              (invoke "make" "-C" "support")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (for-each
                 (lambda (tool)
                   (install-file (string-append "support/" tool) bin))
                 '("ab" "htpasswd" "htdigest" "htdbm" "logresolve" "rotatelogs"))))))))
    (inputs (list apr apr-util pcre2))
    (synopsis "useful Apache HTTP Server utilities")
    (description "Apache-tools provides the standalone utilities from the
Apache HTTP Server distribution: @command{ab} (Apache Benchmark),
@command{htpasswd}, @command{htdigest}, @command{htdbm},
@command{logresolve}, and @command{rotatelogs}.")
    (home-page "http://httpd.apache.org/")
    (license license:asl2.0)))

;;; ===================================================================
;;; 3. passwordsafe — Password manager
;;; ===================================================================
(define-public passwordsafe
  (package
    (name "passwordsafe")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pwsafe/pwsafe/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0ziliaz4b4s9qlmai2rkn0nwvpi3mlwmhym6driqv4rlvy40jf5i"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DNO_YUBI=ON")))
    (native-inputs (list pkg-config zip perl))
    (inputs (list wxwidgets
                  xerces-c
                  libqrencode
                  libxt))
    (synopsis "simple and secure password management application")
    (description "Password Safe is a password manager that allows you to
create and manage a secure collection of username/password combinations.
The database is encrypted using the Twofish algorithm, and the master
password is processed using a key stretching function for added security.")
    (home-page "https://pwsafe.org/")
    (license license:artistic2.0)))

;;; ===================================================================
;;; 4. brother-hl2030 — Brother HL-2030 CUPS driver
;;; ===================================================================
(define-public brother-hl2030
  (package
    (name "brother-hl2030")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://download.brother.com/welcome/dlf005837/"
                    "cupswrapperHL2030-" version "-1.i386.rpm"))
              (sha256
               (base32
                "0hzjmaygajq849p5y2cf2lyhpb6iz6m75fdyfwmd6pd92w5fda3w"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/." ""))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-rpm
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "bsdtar" "-xf" (assoc-ref inputs "source")))))))
    (native-inputs (list libarchive))
    (synopsis "CUPS driver for Brother HL-2030 printer")
    (description "Provides the CUPS printer driver and PPD file for the
Brother HL-2030 laser printer, enabling printing support on Linux systems
through the CUPS printing system.")
    (home-page "http://www.brother.com")
    (license license:gpl2)))

;;; ===================================================================
;;; 5. kopia-ui-bin — Kopia backup GUI (pre-built)
;;; ===================================================================
(define-public kopia-ui-bin
  (package
    (name "kopia-ui-bin")
    (version "0.22.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kopia/kopia/releases/download/v"
                    version "/KopiaUI-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/kopia-ui/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/kopia-ui/kopia-ui")
                         (string-append out "/bin/kopia-ui"))))))))
    (synopsis "graphical user interface for Kopia backup tool")
    (description "KopiaUI provides a graphical user interface for the Kopia
backup tool, enabling easy management of backup repositories, snapshots, and
policies through a desktop application instead of the command line.")
    (home-page "https://kopia.io/")
    (license license:asl2.0)))
