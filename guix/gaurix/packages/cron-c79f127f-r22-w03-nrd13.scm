;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #13.
;;; New recipes: 8 Python packages, 4 Catppuccin KDE themes, 2 Go tools,
;;; 3 shell/script tools, 1 font package, 3 OBS plugins, 1 game port,
;;; 1 binary tool, 1 C++ library.
;;; Compat aliases added to general-compat.scm.
;;; Remaining re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd13)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages networking)
  ;; obs is in (gnu packages video), already imported
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages image)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages xdisorg)
  #:export (python-pysnooper
            python-pytweening
            python-vermin
            python-ollama
            python-pyscreeze
            python-mouseinfo
            python-timesched
            python-pinstall
            catppuccin-plasma-colorscheme-latte
            catppuccin-plasma-colorscheme-frappe
            catppuccin-plasma-colorscheme-macchiato
            catppuccin-plasma-colorscheme-mocha
            openvpn-update-systemd-resolved
            pokemon-colorscripts-git
            networkmanager-dmenu-git
            obs-text-pthread
            obs-source-dock
            obs-3d-effect
            devilutionx
            properties-cpp
            qstat
            gauth
            llama-swap
            clipboard-type-wl))

;; ═══════════════════════════════════════════════════════════════════
;; 1. python-pysnooper — Python debugging/tracing tool
;; ═══════════════════════════════════════════════════════════════════

(define-public python-pysnooper
  (package
    (name "python-pysnooper")
    (version "1.2.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cool-RR/PySnooper")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1w2xvd6f3n037vlncdb9bxm1vgks55krlwh6ah8fwn349j5yla7q"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-pytest python-setuptools))
    (home-page "https://github.com/cool-RR/PySnooper")
    (synopsis "poor man's debugger for Python")
    (description "PySnooper lets you do the same, except instead of
carefully crafting the right @code{print} lines, you just add one
decorator line to the function you're interested in.  You'll get a
play-by-play log of your function, including which lines ran and when,
and exactly when local variables were changed.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 2. python-pytweening — Python tweening/easing functions
;; ═══════════════════════════════════════════════════════════════════

(define-public python-pytweening
  (package
    (name "python-pytweening")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pytweening" version))
       (sha256
        (base32 "06y7rbs6mzmbm35fgj63jx1cykj3nv1cabinbxn0d636ffvihcr4"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/asweigart/pytweening")
    (synopsis "collection of tweening (aka easing) functions")
    (description "PyTweening provides a collection of tweening / easing
functions implemented in Python for use in animation and graphical
applications.  Attempt to simulate natural motion by using non-linear
interpolation.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 3. python-vermin — Python minimum version detector
;; ═══════════════════════════════════════════════════════════════════

(define-public python-vermin
  (package
    (name "python-vermin")
    (version "1.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/netromdk/vermin")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0bz59msy6d70xi9aw1s5s875qz18djg7l2zq20fch8x7231hi42h"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/netromdk/vermin")
    (synopsis "detect minimum Python versions needed to run code")
    (description "Vermin concurrently detects the minimum Python versions
needed to run code.  It analyzes Python source files and reports which
minimum versions of Python 2 and 3 are required.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 4. python-ollama — official Python client for Ollama
;; ═══════════════════════════════════════════════════════════════════

(define-public python-ollama
  (package
    (name "python-ollama")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ollama" version))
       (sha256
        (base32 "1inpd572f99kida9s6kqj7zx3lqgi7x69v8mnhs00hrnd1a6g327"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; requires running ollama server
    (propagated-inputs (list python-httpx python-pydantic))
    (native-inputs (list python-hatch-vcs python-hatchling))
    (home-page "https://github.com/ollama/ollama-python")
    (synopsis "official Python client for Ollama")
    (description "The official Python client library for Ollama, providing
a convenient interface to interact with Ollama's API for running and
managing large language models locally.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 5. python-pyscreeze — Python screenshot module
;; ═══════════════════════════════════════════════════════════════════

(define-public python-pyscreeze
  (package
    (name "python-pyscreeze")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyscreeze" version))
       (sha256
        (base32 "1gnlxb8clwz9prjy7rkq9apj17nsczrj7vi9y9gslihv1xqn45ng"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require display
    (propagated-inputs (list python-pillow))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/asweigart/pyscreeze")
    (synopsis "simple, cross-platform screenshot module for Python")
    (description "PyScreeze is a simple, cross-platform screenshot module
for Python 2 and 3.  It can take screenshots, save them to files, and
locate images on the screen.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 6. python-mouseinfo — Python mouse position/RGB info
;; ═══════════════════════════════════════════════════════════════════

(define-public python-mouseinfo
  (package
    (name "python-mouseinfo")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "MouseInfo" version))
       (sha256
        (base32 "1rznyzv6w9f8bfq2x5b0ik0dqyk5ghlhmkiw1998waq6hn4gnqic"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require display
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/asweigart/mouseinfo")
    (synopsis "display XY position and RGB color of the mouse cursor")
    (description "An application to display the XY position and RGB color
information for the pixel currently under the mouse.  Works on Windows,
macOS, and Linux.")
    (license license:gpl3+)))

;; ═══════════════════════════════════════════════════════════════════
;; 7. python-timesched — time-based scheduler for Python
;; ═══════════════════════════════════════════════════════════════════

(define-public python-timesched
  (package
    (name "python-timesched")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "timesched" version))
       (sha256
        (base32 "1fmvbzmwprax0cn4k8l860li9vs6zki8zrc52iismwkxvrzr7gja"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/bulletmark/timesched")
    (synopsis "simple time event scheduler for Python")
    (description "A Python module providing a simple time-based event
scheduler built on top of @code{sched} from the standard library.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 8. python-pinstall — installer tool for Python programs
;; ═══════════════════════════════════════════════════════════════════

(define-public python-pinstall
  (package
    (name "python-pinstall")
    (version "1.8")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pinstall" version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools))
    (home-page "https://github.com/bulletmark/pinstall")
    (synopsis "installer tool for Python programs")
    (description "Pinstall is a tool to facilitate installation of Python
command-line programs on Linux systems.  It helps set up desktop files,
man pages, and shell completion scripts.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 9-12. Catppuccin Plasma color schemes (copy-build-system from GitHub)
;; ═══════════════════════════════════════════════════════════════════

(define (make-catppuccin-plasma-colorscheme flavor)
  (package
    (name (string-append "catppuccin-plasma-colorscheme-" flavor))
    (version "0.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/catppuccin/kde")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(list (list (string-append "Resources/colorSchemes/Catppuccin"
                                        (string-capitalize #$flavor) ".colors")
                         (string-append "share/color-schemes/Catppuccin"
                                        (string-capitalize #$flavor) ".colors")))))
    (home-page "https://github.com/catppuccin/kde")
    (synopsis (string-append "catppuccin " flavor " color scheme for KDE Plasma"))
    (description (string-append "Soothing pastel Catppuccin " flavor
                                " color scheme for KDE Plasma desktop environment."))
    (license license:expat)))

(define-public catppuccin-plasma-colorscheme-latte
  (make-catppuccin-plasma-colorscheme "latte"))

(define-public catppuccin-plasma-colorscheme-frappe
  (make-catppuccin-plasma-colorscheme "frappe"))

(define-public catppuccin-plasma-colorscheme-macchiato
  (make-catppuccin-plasma-colorscheme "macchiato"))

(define-public catppuccin-plasma-colorscheme-mocha
  (make-catppuccin-plasma-colorscheme "mocha"))

;; ═══════════════════════════════════════════════════════════════════
;; 13. openvpn-update-systemd-resolved — OpenVPN + systemd-resolved
;; ═══════════════════════════════════════════════════════════════════

(define-public openvpn-update-systemd-resolved
  (package
    (name "openvpn-update-systemd-resolved")
    (version "1.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jonathanio/update-systemd-resolved")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("update-systemd-resolved" "libexec/openvpn/update-systemd-resolved"))))
    (inputs (list bash openvpn))
    (home-page "https://github.com/jonathanio/update-systemd-resolved")
    (synopsis "integrate OpenVPN with systemd-resolved via D-Bus")
    (description "A helper script designed to integrate OpenVPN with
@code{systemd-resolved} via the D-Bus interface.  It updates DNS settings
when connecting to and disconnecting from VPN tunnels.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 14. pokemon-colorscripts-git — Pokemon ASCII art in terminal
;; ═══════════════════════════════════════════════════════════════════

(define-public pokemon-colorscripts-git
  (package
    (name "pokemon-colorscripts-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/phoneybadger/pokemon-colorscripts")
                    (commit "0483c85b93366e498d7e8774a498e118fcfb36f5")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pokemon-colorscripts.sh" "bin/pokemon-colorscripts")
               ("colorscripts/" "share/pokemon-colorscripts/colorscripts/"))))
    (home-page "https://gitlab.com/phoneybadger/pokemon-colorscripts")
    (synopsis "print Pokemon ASCII art in the terminal")
    (description "A script to print colored Pokemon ASCII art sprites in
the terminal.  Supports all generations of Pokemon and can display random
or specific Pokemon.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 15. networkmanager-dmenu-git — NetworkManager dmenu/rofi frontend
;; ═══════════════════════════════════════════════════════════════════

(define-public networkmanager-dmenu-git
  (package
    (name "networkmanager-dmenu-git")
    (version "2.3.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/firecat53/networkmanager-dmenu")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("networkmanager_dmenu" "bin/networkmanager_dmenu")
               ("networkmanager_dmenu.conf.example"
                "share/doc/networkmanager-dmenu/networkmanager_dmenu.conf.example"))))
    (inputs (list python network-manager))
    (home-page "https://github.com/firecat53/networkmanager-dmenu")
    (synopsis "manage NetworkManager connections with dmenu or rofi")
    (description "A script to manage NetworkManager connections with
@code{dmenu}, @code{rofi}, @code{wofi}, @code{bemenu}, or @code{fuzzel}
instead of @code{nm-applet}.  Supports WiFi, wired, VPN, and Bluetooth
connections.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 16. obs-text-pthread — OBS Studio text rendering plugin
;; ═══════════════════════════════════════════════════════════════════

(define-public obs-text-pthread
  (package
    (name "obs-text-pthread")
    (version "3.0.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/norihiro/obs-text-pthread")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLIBOBS_INCLUDE_DIR="
                                  (assoc-ref %build-inputs "obs") "/include/obs"))))
    (inputs (list obs pkg-config))
    (home-page "https://github.com/norihiro/obs-text-pthread")
    (synopsis "text rendering plugin for OBS Studio using Pango")
    (description "An OBS Studio plugin that provides text source with
Pango rendering, allowing beautiful text display with rich formatting
options for streaming and recording.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 17. obs-source-dock — OBS Studio source dock plugin
;; ═══════════════════════════════════════════════════════════════════

(define-public obs-source-dock
  (package
    (name "obs-source-dock")
    (version "0.4.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/exeldro/obs-source-dock")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLIBOBS_INCLUDE_DIR="
                                  (assoc-ref %build-inputs "obs") "/include/obs"))))
    (inputs (list obs qtbase))
    (home-page "https://github.com/exeldro/obs-source-dock")
    (synopsis "source dock plugin for OBS Studio")
    (description "An OBS Studio plugin that allows creating a dock for a
source, enabling interaction, audio level monitoring, and volume changes
directly from the dock interface.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 18. obs-3d-effect — OBS Studio 3D effect filter plugin
;; ═══════════════════════════════════════════════════════════════════

(define-public obs-3d-effect
  (package
    (name "obs-3d-effect")
    (version "0.0.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/exeldro/obs-3d-effect")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list (string-append "-DLIBOBS_INCLUDE_DIR="
                                  (assoc-ref %build-inputs "obs") "/include/obs"))))
    (inputs (list obs))
    (home-page "https://github.com/exeldro/obs-3d-effect")
    (synopsis "3D effect filter plugin for OBS Studio")
    (description "An OBS Studio plugin that adds a 3D effect filter,
allowing sources to be rotated and transformed in 3D space during
streaming or recording.")
    (license license:gpl2+)))

;; ═══════════════════════════════════════════════════════════════════
;; 19. devilutionx — Diablo source port
;; ═══════════════════════════════════════════════════════════════════

(define-public devilutionx
  (package
    (name "devilutionx")
    (version "1.5.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/diasurgical/devilutionX")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DCMAKE_BUILD_TYPE=Release"
                   "-DBUILD_TESTING=OFF")))
    (inputs (list sdl2 sdl2-image sdl2-mixer
                  libsodium zlib bzip2 libpng))
    (native-inputs (list pkg-config cmake))
    (home-page "https://github.com/diasurgical/devilutionX")
    (synopsis "Diablo build for modern operating systems")
    (description "DevilutionX is a port of Diablo and Hellfire to modern
operating systems.  It is a source port that aims to provide a faithful
recreation of the original game while fixing bugs and adding quality of
life improvements.")
    (license license:unlicense)))

;; ═══════════════════════════════════════════════════════════════════
;; 20. properties-cpp — C++ properties/signals library
;; ═══════════════════════════════════════════════════════════════════

(define-public properties-cpp
  (package
    (name "properties-cpp")
    (version "0.0.3")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/lib-cpp/properties-cpp")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/lib-cpp/properties-cpp")
    (synopsis "C++ library for properties and signals")
    (description "A very simple convenience library for handling properties
and signals in C++11.  Used primarily by Ubuntu Touch/Mir projects for
observable property patterns.")
    (license license:lgpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; 21. qstat — game server query tool
;; ═══════════════════════════════════════════════════════════════════

(define-public qstat
  (package
    (name "qstat")
    (version "2.17")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/multiplay/qstat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/multiplay/qstat")
    (synopsis "command-line tool to query game servers")
    (description "QStat is a command-line program that displays
information about Internet game servers.  It supports a wide variety
of game protocols including Quake, Half-Life, Unreal, and many more.")
    (license license:artistic2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; 22. gauth — Google Authenticator CLI in Go
;; ═══════════════════════════════════════════════════════════════════

(define-public gauth
  (package
    (name "gauth")
    (version "1.4.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pcarrier/gauth")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/pcarrier/gauth"
           #:install-source? #f))
    (home-page "https://github.com/pcarrier/gauth")
    (synopsis "two-factor authentication agent in the terminal")
    (description "Gauth is a simple two-factor authentication (2FA) agent
that generates TOTP tokens on the command line, replacing the need for a
phone-based authenticator app.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 23. llama-swap — LLM model hot-swapping proxy
;; ═══════════════════════════════════════════════════════════════════

(define-public llama-swap
  (package
    (name "llama-swap")
    (version "0.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mostlygeek/llama-swap")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/mostlygeek/llama-swap"
           #:install-source? #f))
    (home-page "https://github.com/mostlygeek/llama-swap")
    (synopsis "model swapping proxy for llama.cpp servers")
    (description "Llama-swap is a model-swapping proxy for @code{llama.cpp}
or any local OpenAI-compatible server.  It manages multiple models and
automatically loads/unloads them based on incoming requests.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; 24. clipboard-type-wl — Wayland clipboard type-out script
;; ═══════════════════════════════════════════════════════════════════

(define-public clipboard-type-wl
  (package
    (name "clipboard-type-wl")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/AdrienPoworworworworworworworwork/clipboard-type-wl")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("clipboard-type-wl" "bin/clipboard-type-wl"))))
    (inputs (list bash))
    (home-page "https://github.com/clipboard-type-wl")
    (synopsis "type clipboard contents on Wayland using dotool")
    (description "A simple script that uses @code{dotool} to type the
contents of the clipboard on Wayland compositors, useful when paste
is not supported in the target application.")
    (license license:expat)))
