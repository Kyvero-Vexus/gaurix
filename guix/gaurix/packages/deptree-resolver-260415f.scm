;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260415f
;;; Resolves BLOCKED packages from general queue, prioritized by dependency tree.
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260415f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (
            gnu-apl
            opentyrian
            releng-tool
            luaunbound
            lxappearance-obconf-gtk3
            pass-audit
            python-requirements-language-server
            ajantv2-tools
            pins
            onset
            oniri
            proxybridge
            onthespot-bin
            libreoffice-extension-writingtool-bin
            linux-firmware-bnx2x
            linux-firmware-marvell
            linux-firmware-mellanox
            linux-firmware-nfp
            linux-firmware-qcom
            ))

;;;
;;; --- 1. gnu-apl ---
;;; An almost complete implementation of ISO standard 13751 (APL).
;;;

(define-public gnu-apl
  (package
    (name "gnu-apl")
    (version "1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "mirror://gnu/apl/apl-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list ncurses sqlite pcre))
    (synopsis "Implementation of the APL programming language")
    (description
     "GNU APL is an implementation of the programming language APL as defined
in ISO standard 13751.  It includes an APL interpreter, built-in functions and
operators, and can be extended with shared libraries.")
    (home-page "https://www.gnu.org/software/apl/")
    (license license:gpl3+)))

;;;
;;; --- 2. opentyrian ---
;;; Open-source port of the DOS shoot-em-up Tyrian.
;;;

(define-public opentyrian
  (package
    (name "opentyrian")
    (version "2.1.20221123")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/opentyrian/opentyrian")
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
      #~(list (string-append "prefix=" #$output)
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list sdl2 sdl2-net))
    (synopsis "Open-source port of the DOS shoot-em-up Tyrian")
    (description
     "OpenTyrian is an open-source port of the classic DOS shoot-em-up game
Tyrian.  It uses SDL2 for graphics and input, providing a faithful recreation
of the original game on modern systems.")
    (home-page "https://github.com/opentyrian/opentyrian")
    (license license:gpl2+)))

;;;
;;; --- 3. releng-tool ---
;;; Release engineering tool for creating packages.
;;;

(define-public releng-tool
  (package
    (name "releng-tool")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "releng_tool" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (synopsis "Tool to create packages for select runtime environments")
    (description
     "Releng-tool is a release engineering tool designed to help create
packages for various runtime environments.  It provides a structured approach
to building, configuring, and packaging software components.")
    (home-page "https://releng.io/")
    (license license:bsd-2)))

;;;
;;; --- 4. luaunbound ---
;;; Lua binding for the Unbound DNS resolver library.
;;;

(define-public luaunbound
  (package
    (name "luaunbound")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://code.zash.se/dl/luaunbound/luaunbound-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output)
              (string-append "LUA_LIBDIR=" #$output "/lib/lua/5.4")
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list lua unbound))
    (synopsis "Lua binding for the Unbound DNS resolver")
    (description
     "Luaunbound is a drop-in replacement for Prosody's internal DNS library
with a binding to the Unbound DNS resolver.  It provides asynchronous DNS
resolution capabilities for Lua applications.")
    (home-page "https://www.zash.se/luaunbound.html")
    (license license:expat)))

;;;
;;; --- 5. lxappearance-obconf-gtk3 ---
;;; Plugin for LXAppearance to configure Openbox (GTK+ 3).
;;;

(define-public lxappearance-obconf-gtk3
  (package
    (name "lxappearance-obconf-gtk3")
    (version "0.2.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lxde/lxappearance-obconf")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fi"))))))
    (native-inputs (list autoconf automake libtool intltool pkg-config))
    (inputs (list gtk+ openbox lxappearance))
    (synopsis "LXAppearance plugin for configuring Openbox with GTK3")
    (description
     "This is a plugin for LXAppearance that allows configuration of the
Openbox window manager.  This version is built against GTK+ 3, providing
a consistent look with modern GTK3-based desktop environments.")
    (home-page "http://lxde.org/")
    (license license:gpl2+)))

;;;
;;; --- 6. pass-audit ---
;;; A pass extension for auditing your password repository.
;;;

(define-public pass-audit
  (package
    (name "pass-audit")
    (version "1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/roddhjav/pass-audit")
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
              (string-append "BASHCOMPDIR=" #$output
                             "/share/bash-completion/completions"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list password-store python python-requests python-setuptools))
    (synopsis "Pass extension for auditing your password repository")
    (description
     "Pass-audit is an extension for the standard UNIX password manager
@command{pass}.  It checks passwords against known data breaches using the
Have I Been Pwned API and evaluates password strength using zxcvbn.")
    (home-page "https://github.com/roddhjav/pass-audit")
    (license license:gpl3+)))

;;;
;;; --- 7. python-requirements-language-server ---
;;; Language server for pip requirements.txt files.
;;;

(define-public python-requirements-language-server
  (package
    (name "python-requirements-language-server")
    (version "0.0.22")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "requirements-language-server" version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (propagated-inputs (list python-lsp-server))
    (synopsis "Language server for pip requirements.txt files")
    (description
     "This package provides a language server for pip requirements.txt files.
It offers completion, diagnostics, and hover information for Python package
dependency specifications.")
    (home-page "https://github.com/Freed-Wu/requirements-language-server")
    (license license:gpl3+)))

;;;
;;; --- 8. ajantv2-tools ---
;;; AJA NTV2 video I/O SDK and tools.
;;;

(define-public ajantv2-tools
  (package
    (name "ajantv2-tools")
    (version "17.5.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aja-video/libajantv2")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DAJANTV2_BUILD_DEMOS=OFF"
                   "-DAJANTV2_BUILD_TESTS=OFF")))
    (synopsis "AJA NTV2 video I/O SDK and tools")
    (description
     "AJA NTV2 is an open-source SDK for discovering, interrogating, and
controlling NTV2 professional video I/O devices from AJA Video Systems.
It provides libraries and command-line tools for video capture and playback.")
    (home-page "https://github.com/aja-video/libajantv2")
    (license license:expat)))

;;;
;;; --- 9. pins ---
;;; GTK4 application for creating and editing app shortcuts.
;;;

(define-public pins
  (package
    (name "pins")
    (version "2.4.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fabrialberio/Pins")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f
           #:glib-or-gtk? #t))
    (native-inputs (list pkg-config
                         `(,glib "bin")
                         gettext-minimal
                         desktop-file-utils))
    (inputs (list gtk libadwaita))
    (synopsis "Create and edit application shortcuts")
    (description
     "Pins is a GTK4 application for creating and editing desktop application
shortcuts (.desktop files).  It provides a graphical interface for managing
application launchers on freedesktop-compatible Linux desktops.")
    (home-page "https://github.com/fabrialberio/Pins")
    (license license:gpl3+)))

;;;
;;; --- 10. onset ---
;;; Lightweight GTK4 autostart manager for Linux.
;;;

(define-public onset
  (package
    (name "onset")
    (version "1.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xPathin/onset")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk libadwaita))
    (synopsis "Lightweight GTK4 autostart manager for Linux")
    (description
     "Onset is a lightweight GTK4 autostart manager for Linux desktops.
It provides a simple graphical interface for managing applications that
start automatically when you log in to your desktop session.")
    (home-page "https://github.com/xPathin/onset")
    (license license:expat)))

;;;
;;; --- 11. oniri ---
;;; Tool that automatically maximizes the only window of a niri workspace.
;;;

(define-public oniri
  (package
    (name "oniri")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Antiz96/oniri")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (synopsis "Auto-maximize single windows on niri workspaces")
    (description
     "Oniri is a tool that automatically maximizes the only window of a niri
workspace.  When a workspace has only one window, Oniri detects this and
maximizes it to use the full available space.")
    (home-page "https://github.com/Antiz96/oniri")
    (license license:gpl3+)))

;;;
;;; --- 12. proxybridge ---
;;; TCP and UDP traffic redirector with GUI.
;;;

(define-public proxybridge
  (package
    (name "proxybridge")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/InterceptSuite/ProxyBridge")
                    (commit "51d9b17")))
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
              (string-append "CC=" #$(cc-for-target)))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ libnetfilter-queue))
    (synopsis "TCP and UDP traffic redirector")
    (description
     "ProxyBridge is a network tool that redirects TCP and UDP traffic
through proxy servers.  It provides a GTK+ graphical interface for
configuring traffic redirection rules using netfilter.")
    (home-page "https://github.com/InterceptSuite/ProxyBridge")
    (license license:expat)))

;;;
;;; --- 13. onthespot-bin ---
;;; Music downloader AppImage for various streaming services.
;;;

(define-public onthespot-bin
  (package
    (name "onthespot-bin")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/justin025/onthespot/releases/download/"
                    "v" version "/OnTheSpot-" version "-linux-x86_64.AppImage"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("onthespot" "bin/onthespot"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "onthespot")
              (chmod "onthespot" #o755))))))
    (synopsis "Music downloader for various streaming services")
    (description
     "OnTheSpot is a GUI music downloader that supports multiple streaming
services including Bandcamp, Deezer, Qobuz, Soundcloud, Spotify, Tidal,
and YouTube Music.")
    (home-page "https://github.com/justin025/onthespot")
    (license license:gpl2)))

;;;
;;; --- 14. libreoffice-extension-writingtool-bin ---
;;; WritingTool extension for LibreOffice.
;;;

(define-public libreoffice-extension-writingtool-bin
  (package
    (name "libreoffice-extension-writingtool-bin")
    (version "26.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://writingtool.org/download/WritingTool-"
                    version ".oxt"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("WritingTool.oxt"
           "lib/libreoffice/share/extensions/writingtool/WritingTool.oxt"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "WritingTool.oxt"))))))
    (synopsis "Writing assistance extension for LibreOffice")
    (description
     "WritingTool is a LibreOffice extension that provides writing assistance
and tools for document editing.  It integrates directly into the LibreOffice
interface for convenient access.")
    (home-page "https://writingtool.org/index.php/en/")
    (license license:lgpl2.1)))

;;;
;;; --- 15. linux-firmware-bnx2x ---
;;; Firmware for Broadcom NetXtreme II network adapters.
;;;

(define-public linux-firmware-bnx2x
  (package
    (name "linux-firmware-bnx2x")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bnx2x" "lib/firmware/bnx2x"))))
    (synopsis "Firmware for Broadcom NetXtreme II network adapters")
    (description
     "This package provides firmware files for Broadcom NetXtreme II (bnx2x)
network adapters, extracted from the Linux firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 16. linux-firmware-marvell ---
;;; Firmware for Marvell devices.
;;;

(define-public linux-firmware-marvell
  (package
    (name "linux-firmware-marvell")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("marvell" "lib/firmware/marvell"))))
    (synopsis "Firmware for Marvell devices")
    (description
     "This package provides firmware files for Marvell network and storage
devices, extracted from the Linux firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 17. linux-firmware-mellanox ---
;;; Firmware for Mellanox network adapters.
;;;

(define-public linux-firmware-mellanox
  (package
    (name "linux-firmware-mellanox")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("mellanox" "lib/firmware/mellanox"))))
    (synopsis "Firmware for Mellanox network adapters")
    (description
     "This package provides firmware files for Mellanox network adapters,
extracted from the Linux firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 18. linux-firmware-nfp ---
;;; Firmware for Netronome Flow Processor devices.
;;;

(define-public linux-firmware-nfp
  (package
    (name "linux-firmware-nfp")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("netronome" "lib/firmware/netronome"))))
    (synopsis "Firmware for Netronome Flow Processor devices")
    (description
     "This package provides firmware files for Netronome Flow Processor (NFP)
network devices, extracted from the Linux firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))

;;;
;;; --- 19. linux-firmware-qcom ---
;;; Firmware for Qualcomm SoCs.
;;;

(define-public linux-firmware-qcom
  (package
    (name "linux-firmware-qcom")
    (version "20250305")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/kernel-firmware/linux-firmware.git")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("qcom" "lib/firmware/qcom"))))
    (synopsis "Firmware for Qualcomm SoCs")
    (description
     "This package provides firmware files for Qualcomm System-on-Chip (SoC)
devices, extracted from the Linux firmware repository.")
    (home-page "https://gitlab.com/kernel-firmware/linux-firmware")
    (license (list license:gpl2 license:gpl3))))
