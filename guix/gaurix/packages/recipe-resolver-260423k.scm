;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260423k
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (30):
;;;        1.  aspnet-targeting-pack-9.0-bin (copy-build-system, v9.0.15.sdk313, MIT)
;;;        2.  pkgdu (cargo-build-system, v0.9.2, GPL-3.0-or-later)
;;;        3.  pacman-repo-stats (cargo-build-system, v0.5.2, GPL-3.0-or-later)
;;;        4.  msi-ec-dkms-git (gnu-build-system, vr675.b2412c6, GPL2)
;;;        5.  datagrip-eap-jre (gnu-build-system, v261.21849.37, custom:jetbrains)
;;;        6.  datagrip-eap (gnu-build-system, v261.21849.37, custom:jetbrains)
;;;        7.  openttd-jgrpp-opensfx (gnu-build-system, v20250609.01, CC0-1.0)
;;;        8.  openttd-jgrpp-openmsx (gnu-build-system, v20250609.01, CC0-1.0)
;;;        9.  openttd-jgrpp-opengfx (gnu-build-system, v20250609.01, CC0-1.0)
;;;       10.  firefox-extension-reddit-enhancement-suite (node-build-system, v5.24.8, GPL3)
;;;       11.  pgmq (gnu-build-system, v1.9.0, MIT)
;;;       12.  pacman-command-utils (cargo-build-system, v0.1.0, MIT)
;;;       13.  odinls-git (gnu-build-system, vdev_2026_02.r104.gbde7cef, MIT)
;;;       14.  mihomo-alpha-git (go-build-system, vr3340.c60750d, MIT)
;;;       15.  gtk2+extra (gnu-build-system, v3.3.4, LGPL)
;;;       16.  stormy (go-build-system, v0.3.2, MIT)
;;;       17.  firefox-sponsorblock-for-youtube-skip-sponsorships-bin (copy-build-system, v5.13.3, GPL-3.0)
;;;       18.  doublecmd-gtk2 (gnu-build-system, v1.1.26, GPL2)
;;;       19.  stable-diffusion.cpp-hipblas-git (cmake-build-system, vr256.5900ef6, MIT)
;;;       20.  claudes-c-compiler-doc (cargo-build-system, v0.1.0.r6f1b99a, CC0-1.0)
;;;       21.  claudes-c-compiler-src (cargo-build-system, v0.1.0.r6f1b99a, CC0-1.0)
;;;       22.  qucs (cmake-build-system, v0.0.20, GPL)
;;;       23.  brother-hl2270dw (gnu-build-system, v2.1.0_2, GPL)
;;;       24.  php84-mbstring (pyproject-build-system, v8.4.17, PHP)
;;;       25.  php84-intl (pyproject-build-system, v8.4.17, PHP)
;;;       26.  php84-gmp (pyproject-build-system, v8.4.17, PHP)
;;;       27.  php84-gd (pyproject-build-system, v8.4.17, PHP)
;;;       28.  php84-ftp (pyproject-build-system, v8.4.17, PHP)
;;;       29.  php84-ffi (pyproject-build-system, v8.4.17, PHP)
;;;       30.  python-rofi-git (pyproject-build-system, vr18.d20b3a2, GPL)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260423k)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:export (
            aspnet-targeting-pack-9-0-bin
            pkgdu
            pacman-repo-stats
            msi-ec-dkms-git
            datagrip-eap-jre
            datagrip-eap
            openttd-jgrpp-opensfx
            openttd-jgrpp-openmsx
            openttd-jgrpp-opengfx
            firefox-extension-reddit-enhancement-suite
            pgmq
            pacman-command-utils
            odinls-git
            mihomo-alpha-git
            gtk2+extra
            stormy
            firefox-sponsorblock-for-youtube-skip-sponsorships-bin
            doublecmd-gtk2
            stable-diffusion-cpp-hipblas-git
            claudes-c-compiler-doc
            claudes-c-compiler-src
            qucs
            brother-hl2270dw
            php84-mbstring
            php84-intl
            php84-gmp
            php84-gd
            php84-ftp
            php84-ffi
            python-rofi-git
            ))

;;; -------------------------------------------------------------------
;;; 1. aspnet-targeting-pack-9.0-bin --- the ASP.NET Core targeting pack
;;; -------------------------------------------------------------------
(define-public aspnet-targeting-pack-9-0-bin
  (package
    (name "aspnet-targeting-pack-9-0-bin")
    (version "9.0.15.sdk313")
    (source (origin
              (method url-fetch)
              (uri "https://dotnet.microsoft.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("aspnet-targeting-pack-9-0-bin" "bin/aspnet-targeting-pack-9-0-bin"))))
    (synopsis "the ASP.NET Core targeting pack")
    (description "The ASP.NET Core targeting pack.")
    (home-page "https://dotnet.microsoft.com")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 2. pkgdu --- a tool to display packages disk usage size
;;; -------------------------------------------------------------------
(define-public pkgdu
  (package
    (name "pkgdu")
    (version "0.9.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpetlert/pkgdu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a tool to display packages disk usage size")
    (description "A tool to display packages disk usage size.")
    (home-page "https://github.com/bpetlert/pkgdu")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. pacman-repo-stats --- show usage statistics of repositories in pacman.conf
;;; -------------------------------------------------------------------
(define-public pacman-repo-stats
  (package
    (name "pacman-repo-stats")
    (version "0.5.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bpetlert/pacman-repo-stats")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "show usage statistics of repositories in pacman.conf")
    (description "Show usage statistics of repositories in pacman.conf.")
    (home-page "https://github.com/bpetlert/pacman-repo-stats")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. msi-ec-dkms-git --- driver for MSI laptop EC (DKMS)
;;; -------------------------------------------------------------------
(define-public msi-ec-dkms-git
  (package
    (name "msi-ec-dkms-git")
    (version "r675.b2412c6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/BeardOverflow/msi-ec")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "driver for MSI laptop EC (DKMS)")
    (description "Driver for MSI laptop EC (DKMS).")
    (home-page "https://github.com/BeardOverflow/msi-ec")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5. datagrip-eap-jre --- JBR (JetBrains Runtime) for DataGrip - a patched JRE
;;; -------------------------------------------------------------------
(define-public datagrip-eap-jre
  (package
    (name "datagrip-eap-jre")
    (version "261.21849.37")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JetBrains/JetBrainsRuntime")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glib))
    (synopsis "JBR (JetBrains Runtime) for DataGrip - a patched JRE")
    (description "JBR (JetBrains Runtime) for DataGrip - a patched JRE.")
    (home-page "https://github.com/JetBrains/JetBrainsRuntime")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 6. datagrip-eap --- smart SQL Editor and Advanced Database Client Packed Together for Optimum...
;;; -------------------------------------------------------------------
(define-public datagrip-eap
  (package
    (name "datagrip-eap")
    (version "261.21849.37")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jetbrains.com/datagrip/nextversion//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glib))
    (synopsis "smart SQL Editor and Advanced Database Client Packed Together for Optimum...")
    (description "Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity (EAP).")
    (home-page "https://www.jetbrains.com/datagrip/nextversion/")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 7. openttd-jgrpp-opensfx --- metapackage which symlinks 'openttd-opensfx' such that 'openttd-jgrpp' ca...
;;; -------------------------------------------------------------------
(define-public openttd-jgrpp-opensfx
  (package
    (name "openttd-jgrpp-opensfx")
    (version "20250609.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aur.archlinux.org/packages/openttd-jgrpp//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "metapackage which symlinks 'openttd-opensfx' such that 'openttd-jgrpp' ca...")
    (description "Metapackage which symlinks 'openttd-opensfx' such that 'openttd-jgrpp' can find it.")
    (home-page "http://aur.archlinux.org/packages/openttd-jgrpp/")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 8. openttd-jgrpp-openmsx --- metapackage which symlinks 'openttd-openmsx' such that 'openttd-jgrpp' ca...
;;; -------------------------------------------------------------------
(define-public openttd-jgrpp-openmsx
  (package
    (name "openttd-jgrpp-openmsx")
    (version "20250609.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aur.archlinux.org/packages/openttd-jgrpp//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "metapackage which symlinks 'openttd-openmsx' such that 'openttd-jgrpp' ca...")
    (description "Metapackage which symlinks 'openttd-openmsx' such that 'openttd-jgrpp' can find it.")
    (home-page "http://aur.archlinux.org/packages/openttd-jgrpp/")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 9. openttd-jgrpp-opengfx --- metapackage which symlinks 'openttd-opengfx' such that 'openttd-jgrpp' ca...
;;; -------------------------------------------------------------------
(define-public openttd-jgrpp-opengfx
  (package
    (name "openttd-jgrpp-opengfx")
    (version "20250609.01")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://aur.archlinux.org/packages/openttd-jgrpp//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "metapackage which symlinks 'openttd-opengfx' such that 'openttd-jgrpp' ca...")
    (description "Metapackage which symlinks 'openttd-opengfx' such that 'openttd-jgrpp' can find it.")
    (home-page "http://aur.archlinux.org/packages/openttd-jgrpp/")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 10. firefox-extension-reddit-enhancement-suite --- suite of modules that enhances your Reddit browsing experience
;;; -------------------------------------------------------------------
(define-public firefox-extension-reddit-enhancement-suite
  (package
    (name "firefox-extension-reddit-enhancement-suite")
    (version "5.24.8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/honestbleeps/Reddit-Enhancement-Suite")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments (list #:tests? #f))
    (synopsis "suite of modules that enhances your Reddit browsing experience")
    (description "Suite of modules that enhances your Reddit browsing experience.")
    (home-page "https://github.com/honestbleeps/Reddit-Enhancement-Suite")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 11. pgmq --- a lightweight message queue. Like AWS SQS and RSMQ but on Postgres
;;; -------------------------------------------------------------------
(define-public pgmq
  (package
    (name "pgmq")
    (version "1.9.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pgmq/pgmq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "a lightweight message queue. Like AWS SQS and RSMQ but on Postgres")
    (description "A lightweight message queue. Like AWS SQS and RSMQ but on Postgres.")
    (home-page "https://github.com/pgmq/pgmq")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 12. pacman-command-utils --- command utils to help out long pacman commands
;;; -------------------------------------------------------------------
(define-public pacman-command-utils
  (package
    (name "pacman-command-utils")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/crypticverse/pacman-command-utils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command utils to help out long pacman commands")
    (description "Command utils to help out long pacman commands.")
    (home-page "https://github.com/crypticverse/pacman-command-utils")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 13. odinls-git --- language server and source code formatter for Odin
;;; -------------------------------------------------------------------
(define-public odinls-git
  (package
    (name "odinls-git")
    (version "dev_2026_02.r104.gbde7cef")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/DanielGavin/ols")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "language server and source code formatter for Odin")
    (description "Language server and source code formatter for Odin.")
    (home-page "https://github.com/DanielGavin/ols")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 14. mihomo-alpha-git --- mihomo Kernel by MetaCubeX, formerly known as Clash.Meta
;;; -------------------------------------------------------------------
(define-public mihomo-alpha-git
  (package
    (name "mihomo-alpha-git")
    (version "r3340.c60750d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MetaCubeX/mihomo")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/MetaCubeX/mihomo"
      #:tests? #f))
    (inputs (list glibc))
    (synopsis "mihomo Kernel by MetaCubeX, formerly known as Clash.Meta")
    (description "Mihomo Kernel by MetaCubeX, formerly known as Clash.Meta.")
    (home-page "https://github.com/MetaCubeX/mihomo")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. gtk2+extra --- gtkExtra is a useful set of widgets for creating GUI's for the Xwindows s...
;;; -------------------------------------------------------------------
(define-public gtk2+extra
  (package
    (name "gtk2+extra")
    (version "3.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://gtkextra.sourceforge.net//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gtkExtra is a useful set of widgets for creating GUI's for the Xwindows s...")
    (description "GtkExtra is a useful set of widgets for creating GUI's for the Xwindows system using GTK+.")
    (home-page "http://gtkextra.sourceforge.net/")
    (license license:lgpl3+)))

;;; -------------------------------------------------------------------
;;; 16. stormy --- minimal, customizable, and neofetch-like weather CLI
;;; -------------------------------------------------------------------
(define-public stormy
  (package
    (name "stormy")
    (version "0.3.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ashish0kumar/stormy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/ashish0kumar/stormy"
      #:tests? #f))
    (inputs (list glibc))
    (synopsis "minimal, customizable, and neofetch-like weather CLI")
    (description "Minimal, customizable, and neofetch-like weather CLI.")
    (home-page "https://github.com/ashish0kumar/stormy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 17. firefox-sponsorblock-for-youtube-skip-sponsorships-bin --- easily skip YouTube video sponsors
;;; -------------------------------------------------------------------
(define-public firefox-sponsorblock-for-youtube-skip-sponsorships-bin
  (package
    (name "firefox-sponsorblock-for-youtube-skip-sponsorships-bin")
    (version "5.13.3")
    (source (origin
              (method url-fetch)
              (uri "https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("firefox-sponsorblock-for-youtube-skip-sponsorships-bin" "bin/firefox-sponsorblock-for-youtube-skip-sponsorships-bin"))))
    (synopsis "easily skip YouTube video sponsors")
    (description "Easily skip YouTube video sponsors.")
    (home-page "https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 18. doublecmd-gtk2 --- file manager with two panels side by side (GTK version)
;;; -------------------------------------------------------------------
(define-public doublecmd-gtk2
  (package
    (name "doublecmd-gtk2")
    (version "1.1.26")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://doublecmd.sourceforge.io//archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file manager with two panels side by side (GTK version)")
    (description "File manager with two panels side by side (GTK version).")
    (home-page "https://doublecmd.sourceforge.io/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 19. stable-diffusion.cpp-hipblas-git --- stable Diffusion in pure C/C++ (with AMD ROCm optimizations)
;;; -------------------------------------------------------------------
(define-public stable-diffusion-cpp-hipblas-git
  (package
    (name "stable-diffusion-cpp-hipblas-git")
    (version "r256.5900ef6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/leejet/stable-diffusion.cpp")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "stable Diffusion in pure C/C++ (with AMD ROCm optimizations)")
    (description "Stable Diffusion in pure C/C++ (with AMD ROCm optimizations).")
    (home-page "https://github.com/leejet/stable-diffusion.cpp")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 20. claudes-c-compiler-doc --- claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, A...
;;; -------------------------------------------------------------------
(define-public claudes-c-compiler-doc
  (package
    (name "claudes-c-compiler-doc")
    (version "0.1.0.r6f1b99a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claudes-c-compiler")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (synopsis "claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, A...")
    (description "Claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, AArch64, and RISC-V 64.")
    (home-page "https://github.com/anthropics/claudes-c-compiler")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 21. claudes-c-compiler-src --- claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, A...
;;; -------------------------------------------------------------------
(define-public claudes-c-compiler-src
  (package
    (name "claudes-c-compiler-src")
    (version "0.1.0.r6f1b99a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/anthropics/claudes-c-compiler")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (inputs (list glibc))
    (synopsis "claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, A...")
    (description "Claude's C Compiler — GCC-compatible C compiler targeting x86-64, i686, AArch64, and RISC-V 64.")
    (home-page "https://github.com/anthropics/claudes-c-compiler")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 22. qucs --- an integrated circuit simulator with a graphical user interface
;;; -------------------------------------------------------------------
(define-public qucs
  (package
    (name "qucs")
    (version "0.0.20")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Qucs/qucs")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an integrated circuit simulator with a graphical user interface")
    (description "An integrated circuit simulator with a graphical user interface.")
    (home-page "https://github.com/Qucs/qucs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. brother-hl2270dw --- brother HL-2270DW CUPS Driver
;;; -------------------------------------------------------------------
(define-public brother-hl2270dw
  (package
    (name "brother-hl2270dw")
    (version "2.1.0_2")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "brother HL-2270DW CUPS Driver")
    (description "Brother HL-2270DW CUPS Driver.")
    (home-page "http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 24. php84-mbstring --- mbstring module for php84
;;; -------------------------------------------------------------------
(define-public php84-mbstring
  (package
    (name "php84-mbstring")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "mbstring module for php84")
    (description "Mbstring module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 25. php84-intl --- intl module for php84
;;; -------------------------------------------------------------------
(define-public php84-intl
  (package
    (name "php84-intl")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "intl module for php84")
    (description "Intl module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 26. php84-gmp --- gmp module for php84
;;; -------------------------------------------------------------------
(define-public php84-gmp
  (package
    (name "php84-gmp")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "gmp module for php84")
    (description "Gmp module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 27. php84-gd --- gd module for php84
;;; -------------------------------------------------------------------
(define-public php84-gd
  (package
    (name "php84-gd")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "gd module for php84")
    (description "Gd module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 28. php84-ftp --- FTP module for php84
;;; -------------------------------------------------------------------
(define-public php84-ftp
  (package
    (name "php84-ftp")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list openssl))
    (synopsis "FTP module for php84")
    (description "FTP module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 29. php84-ffi --- ffi module for php84
;;; -------------------------------------------------------------------
(define-public php84-ffi
  (package
    (name "php84-ffi")
    (version "8.4.17")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.php.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list libffi))
    (synopsis "ffi module for php84")
    (description "Ffi module for php84.")
    (home-page "http://www.php.net")
    (license (license:non-copyleft "unknown"))))

;;; -------------------------------------------------------------------
;;; 30. python-rofi-git --- a Python module to make simple GUIs with Rofi
;;; -------------------------------------------------------------------
(define-public python-rofi-git
  (package
    (name "python-rofi-git")
    (version "r18.d20b3a2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/bcbnz/python-rofi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (inputs (list python))
    (synopsis "a Python module to make simple GUIs with Rofi")
    (description "A Python module to make simple GUIs with Rofi.")
    (home-page "https://github.com/bcbnz/python-rofi")
    (license license:gpl3+)))
