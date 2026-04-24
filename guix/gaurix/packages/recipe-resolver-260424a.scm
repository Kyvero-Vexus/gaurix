;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424a
;;; Resolves 100 TODO packages from queue.
;;;
;;; Resolved recipes (100):
;;;         1.  rmapi (copy-build-system, v0.0.32, AGPL3)
;;;         2.  alx-wol-dkms (copy-build-system, v6, GPL)
;;;         3.  espanso-gui (copy-build-system, v24.7, GPL-3.0-or-later)
;;;         4.  joshuto-git (copy-build-system, v0.9.9., LGPL-3.0-only)
;;;         5.  opengamepadui-bin (copy-build-system, v0.45.0, GPL)
;;;         6.  awatcher-git (copy-build-system, v0.3.0., MPL2)
;;;         7.  aspia-client (copy-build-system, v2.5.2, GPL3)
;;;         8.  zing-8-bin (copy-build-system, v8.0.481, custom)
;;;         9.  swtchr (copy-build-system, v0.1.3, MIT)
;;;        10.  spyder-terminal (copy-build-system, v1.3.0, MIT)
;;;        11.  sparkle-git (copy-build-system, v1.26.2., GPL3)
;;;        12.  serverseekerv2-git (copy-build-system, v0.0.122, GPL-3.0-or-later)
;;;        13.  seh-utn (copy-build-system, v4.0.7, custom)
;;;        14.  scrutiny-runit (copy-build-system, v20250508, MIT)
;;;        15.  python-modesolverpy (copy-build-system, v1, MIT)
;;;        16.  postgresql-uint-git (copy-build-system, v0.0.89, PostgreSQL)
;;;        17.  postgresql-uint (copy-build-system, v1.20250815, PostgreSQL)
;;;        18.  minibridge-git (copy-build-system, v0.4.0., Apache2)
;;;        19.  minibridge (copy-build-system, v0.5.0, Apache2)
;;;        20.  libpinmame-git (copy-build-system, v0.0.6860, LicenseRef-MAME)
;;;        21.  libdxvk-gplasync (copy-build-system, v2.7.1, zlib)
;;;        22.  libdof-git (copy-build-system, v0.0.10, GPL-3.0-or-later)
;;;        23.  leetcode-local-cli (copy-build-system, v0.1.0, MIT)
;;;        24.  komodo-periphery-bin (copy-build-system, v2.1.2, GPL-3.0-only)
;;;        25.  jdk24-graalvm-ee-bin (copy-build-system, v24.0.2, LicenseRef-GFTC)
;;;        26.  jdk22-graalvm-bin (copy-build-system, v22.0.2, custom)
;;;        27.  influxdb-runit (copy-build-system, v20250507, MIT)
;;;        28.  customasm (copy-build-system, v0.13.13, Apache-2.0)
;;;        29.  bangumium-git (copy-build-system, v0.9.5., MIT)
;;;        30.  httraqt (copy-build-system, v1.4.11, GPL-3.0-or-later)
;;;        31.  camlpdf (copy-build-system, v2.9, LGPL-2.1-or-later)
;;;        32.  hg-evolve (copy-build-system, v12.0.0, GPL-2.0-or-later)
;;;        33.  superpaper (copy-build-system, v2.2.1, MIT)
;;;        34.  libpostal-git (copy-build-system, v1.1., MIT)
;;;        35.  stash (copy-build-system, v0.31.1, AGPL-3.0-only)
;;;        36.  brother-ql820nwb (copy-build-system, v3.1.5, custom)
;;;        37.  vidmerger-git (copy-build-system, v0.0.292, MIT)
;;;        38.  qcalcfilehash (copy-build-system, v1.1.1, GPLv3+)
;;;        39.  python-tryton (copy-build-system, v8.0.0, GPL-3.0-or-later)
;;;        40.  activity-aware-firefox (copy-build-system, v0.4.2, CC0-1.0)
;;;        41.  wretch (copy-build-system, v1.3.5, GPL-3.0-or-later)
;;;        42.  python-goocalendar (copy-build-system, v0.8.0, GPL)
;;;        43.  newrelic-infra-bin (copy-build-system, v1.74.0, Apache)
;;;        44.  libxerces-c-3-2 (copy-build-system, v3.2.5, Apache)
;;;        45.  libpupdmd-git (copy-build-system, v0.0.24, GPL-3.0-or-later)
;;;        46.  libframeutil-git (copy-build-system, v0.0.9, GPL-3.0-or-later)
;;;        47.  firefox-extension-simplelogin-bin (copy-build-system, v3.0.7, MIT)
;;;        48.  claude-linux-client-bin (copy-build-system, v1.0.0, LicenseRef-unknown)
;;;        49.  suricata (copy-build-system, v8.0.4, GPL2)
;;;        50.  iscan-plugin-gt-s650 (copy-build-system, v2.30.4, custom:EPSON EULA)
;;;        51.  standardfile-bin (copy-build-system, v0.13.3, MIT)
;;;        52.  python-aiomax-git (copy-build-system, v2.7.1., MIT)
;;;        53.  libdmdutil-git (copy-build-system, v0.0.129, GPL-3.0-or-later)
;;;        54.  immich-runit (copy-build-system, v20251231, MIT)
;;;        55.  thor-flash-utility (copy-build-system, v1.1.0, MPL-2.0)
;;;        56.  gprbuild-bootstrap (copy-build-system, v26.0w, custom,GPL3)
;;;        57.  ada-language-server-bin (copy-build-system, v2026.2.202604091, GPL3)
;;;        58.  freeimage-vpinball-git (copy-build-system, v0.0.1926, GPL-2.0-or-later,GPL-3.0-or-later,LicenseRef-FreeImagePublicLicense)
;;;        59.  rustowl-git (copy-build-system, v0.0.1, MPL-2.0)
;;;        60.  libaltsound-git (copy-build-system, v0.0.23, BSD-3-Clause)
;;;        61.  fingerprintx-bin (copy-build-system, v1.1.13, Apache-2.0)
;;;        62.  fingerprintx (copy-build-system, v1.1.19, Apache-2.0)
;;;        63.  codelite-bin (copy-build-system, v18.3.0, GPL-2.0)
;;;        64.  retrobyte (copy-build-system, v1.1, MIT)
;;;        65.  musicpod (copy-build-system, v2.16.0, GPL-3.0-or-later)
;;;        66.  tor-browser-alpha-bin (copy-build-system, v16.0, MPL-2.0)
;;;        67.  ianny-git (copy-build-system, v1.0.0, GPL3)
;;;        68.  hopper4 (copy-build-system, v5.19.4, Commercial)
;;;        69.  rubymine (copy-build-system, v2026.1, custom)
;;;        70.  libva-intel-driver-hybrid (copy-build-system, v2.4.5, MIT)
;;;        71.  shiroa (copy-build-system, v0.3.0, Apache-2.0)
;;;        72.  mullvad-browser-latest-bin (copy-build-system, v16.0, GPL,LGPL,MPL)
;;;        73.  aw-watcher-media-player (copy-build-system, v1.1.3, Unlicense)
;;;        74.  nping (copy-build-system, v0.6.1, MIT)
;;;        75.  sptlrx-bin (copy-build-system, v1.3.1, MIT)
;;;        76.  codegpt-bin (copy-build-system, v1.7.1, MIT)
;;;        77.  dunst-wayland-git (copy-build-system, v1.12.0., BSD)
;;;        78.  lefthook-bin (copy-build-system, v2.1.6, MIT)
;;;        79.  jcal (copy-build-system, v0.5.1, GPL3)
;;;        80.  gcc12-libs (copy-build-system, v12.5.0, custom,FDL,GPL3,LGPL)
;;;        81.  picotool (copy-build-system, v2.2.0, BSD-3-Clause)
;;;        82.  mycorrhiza (copy-build-system, v1.15.1, AGPL-3.0-or-later)
;;;        83.  plank-reloaded-git (copy-build-system, v0.11.146., GPL-3.0-or-later)
;;;        84.  linkwarden (copy-build-system, v2.14.1, AGPL-3.0)
;;;        85.  skippy-xd-git (copy-build-system, v2025.02.28., GPL-2.0-or-later)
;;;        86.  simple-scan-linuxmint (copy-build-system, v44.0, GPL-3.0-or-later)
;;;        87.  qutebrowser-profile-git (copy-build-system, v20201130.55, MIT)
;;;        88.  recyclarr-bin (copy-build-system, v8.5.1, MIT)
;;;        89.  td-tui (copy-build-system, v0.4.12, 0BSD)
;;;        90.  litra (copy-build-system, v3.3.0, MIT)
;;;        91.  hedgedoc2 (copy-build-system, v2.0.0, AGPL3)
;;;        92.  victoriametrics (copy-build-system, v1.138.0, Apache-2.0)
;;;        93.  wlmaker (copy-build-system, v0.7.1, Apache-2.0)
;;;        94.  nrfconnect-appimage (copy-build-system, v5.2.0, Commercial)
;;;        95.  sacd-extract (copy-build-system, v0.3.9.3, GPL2)
;;;        96.  gnome-system-monitor-linuxmint (copy-build-system, v45.0.2, GPL-2.0-or-later)
;;;        97.  hypnotix-git (copy-build-system, v3.4., GPL3)
;;;        98.  vapoursynth-plugin-adjust-git (copy-build-system, v1.1., custom:WTFPL)
;;;        99.  fotokilof (copy-build-system, v5.2.4, MIT)
;;;       100.  mcptools (copy-build-system, v0.7.0, MIT)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424a)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            rmapi
            alx-wol-dkms
            espanso-gui
            joshuto-git
            opengamepadui-bin
            awatcher-git
            aspia-client
            zing-8-bin
            swtchr
            spyder-terminal
            sparkle-git
            serverseekerv2-git
            seh-utn
            scrutiny-runit
            python-modesolverpy
            postgresql-uint-git
            postgresql-uint
            minibridge-git
            minibridge
            libpinmame-git
            libdxvk-gplasync
            libdof-git
            leetcode-local-cli
            komodo-periphery-bin
            jdk24-graalvm-ee-bin
            jdk22-graalvm-bin
            influxdb-runit
            customasm
            bangumium-git
            httraqt
            camlpdf
            hg-evolve
            superpaper
            libpostal-git
            stash
            brother-ql820nwb
            vidmerger-git
            qcalcfilehash
            python-tryton
            activity-aware-firefox
            wretch
            python-goocalendar
            newrelic-infra-bin
            libxerces-c-3-2
            libpupdmd-git
            libframeutil-git
            firefox-extension-simplelogin-bin
            claude-linux-client-bin
            suricata
            iscan-plugin-gt-s650
            standardfile-bin
            python-aiomax-git
            libdmdutil-git
            immich-runit
            thor-flash-utility
            gprbuild-bootstrap
            ada-language-server-bin
            freeimage-vpinball-git
            rustowl-git
            libaltsound-git
            fingerprintx-bin
            fingerprintx
            codelite-bin
            retrobyte
            musicpod
            tor-browser-alpha-bin
            ianny-git
            hopper4
            rubymine
            libva-intel-driver-hybrid
            shiroa
            mullvad-browser-latest-bin
            aw-watcher-media-player
            nping
            sptlrx-bin
            codegpt-bin
            dunst-wayland-git
            lefthook-bin
            jcal
            gcc12-libs
            picotool
            mycorrhiza
            plank-reloaded-git
            linkwarden
            skippy-xd-git
            simple-scan-linuxmint
            qutebrowser-profile-git
            recyclarr-bin
            td-tui
            litra
            hedgedoc2
            victoriametrics
            wlmaker
            nrfconnect-appimage
            sacd-extract
            gnome-system-monitor-linuxmint
            hypnotix-git
            vapoursynth-plugin-adjust-git
            fotokilof
            mcptools
            ))

;;; -------------------------------------------------------------------
;;; 1. rmapi --- Access reMarkable tablet files through the Cloud API
;;; -------------------------------------------------------------------
(define-public rmapi
  (package
    (name "rmapi")
    (version "0.0.32")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ddvk/rmapi/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rmapi" "bin/rmapi"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ddvk/rmapi")
    (synopsis "Access reMarkable tablet files through the Cloud API")
    (description "Access reMarkable tablet files through the Cloud API.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 2. alx-wol-dkms --- The alx kernel module with a patch enabling WoL applied
;;; -------------------------------------------------------------------
(define-public alx-wol-dkms
  (package
    (name "alx-wol-dkms")
    (version "6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bugzilla.kernel.org/show_bug.cgi?id=61651/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("alx-wol-dkms" "bin/alx-wol-dkms"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bugzilla.kernel.org/show_bug.cgi?id=61651")
    (synopsis "The alx kernel module with a patch enabling WoL applied")
    (description "The alx kernel module with a patch enabling WoL applied.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 3. espanso-gui --- GUI frontend for espanso
;;; -------------------------------------------------------------------
(define-public espanso-gui
  (package
    (name "espanso-gui")
    (version "24.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/unobserved-io/espanso-gui/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("espanso-gui" "bin/espanso-gui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/unobserved-io/espanso-gui")
    (synopsis "GUI frontend for espanso")
    (description "GUI frontend for espanso.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 4. joshuto-git --- ranger-like terminal file manager written in Rust
;;; -------------------------------------------------------------------
(define-public joshuto-git
  (package
    (name "joshuto-git")
    (version "0.9.9.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/kamiyaa/joshuto.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("joshuto" "bin/joshuto"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kamiyaa/joshuto")
    (synopsis "ranger-like terminal file manager written in Rust")
    (description "ranger-like terminal file manager written in Rust.")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 5. opengamepadui-bin --- Open source game launcher
;;; -------------------------------------------------------------------
(define-public opengamepadui-bin
  (package
    (name "opengamepadui-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ShadowBlip/OpenGamepadUI/releases/download/v" version "/opengamepadui-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opengamepadui" "bin/opengamepadui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ShadowBlip/OpenGamepadUI")
    (synopsis "Open source game launcher")
    (description "Open source game launcher.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 6. awatcher-git --- Activity and idle watchers
;;; -------------------------------------------------------------------
(define-public awatcher-git
  (package
    (name "awatcher-git")
    (version "0.3.0.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/2e3s/awatcher.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("awatcher" "bin/awatcher"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/2e3s/awatcher")
    (synopsis "Activity and idle watchers")
    (description "Activity and idle watchers.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 7. aspia-client --- Remote desktop and file transfer tool
;;; -------------------------------------------------------------------
(define-public aspia-client
  (package
    (name "aspia-client")
    (version "2.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/dchapyshev/aspia/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aspia-client" "bin/aspia-client"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dchapyshev/aspia")
    (synopsis "Remote desktop and file transfer tool")
    (description "Remote desktop and file transfer tool.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 8. zing-8-bin --- Azul Platform Prime is a modern, TCK-compliant Java platform
;;; -------------------------------------------------------------------
(define-public zing-8-bin
  (package
    (name "zing-8-bin")
    (version "8.0.481")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://docs.azul.com/prime/prime-quick-start-tar/releases/download/v" version "/zing-8-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zing-8" "bin/zing-8"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.azul.com/prime/prime-quick-start-tar")
    (synopsis "Azul Platform Prime is a modern, TCK-compliant Java platform based on OpenJDK")
    (description "Azul Platform Prime is a modern, TCK-compliant Java platform based on OpenJDK.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 9. swtchr --- Gnome-style window switcher for the Sway window manager
;;; -------------------------------------------------------------------
(define-public swtchr
  (package
    (name "swtchr")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/lostatc/swtchr/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("swtchr" "bin/swtchr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lostatc/swtchr")
    (synopsis "Gnome-style window switcher for the Sway window manager")
    (description "Gnome-style window switcher for the Sway window manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. spyder-terminal --- Spyder Plugin for displaying a virtual terminal (OS independ
;;; -------------------------------------------------------------------
(define-public spyder-terminal
  (package
    (name "spyder-terminal")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://docs.spyder-ide.org/current/plugins/terminal.html/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spyder-terminal" "bin/spyder-terminal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.spyder-ide.org/current/plugins/terminal.html")
    (synopsis "Spyder Plugin for displaying a virtual terminal (OS independent) inside th...")
    (description "Spyder Plugin for displaying a virtual terminal (OS independent) inside the main Spyder window.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 11. sparkle-git --- Another Mihomo GUI
;;; -------------------------------------------------------------------
(define-public sparkle-git
  (package
    (name "sparkle-git")
    (version "1.26.2.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/xishang0128/sparkle.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sparkle" "bin/sparkle"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xishang0128/sparkle")
    (synopsis "Another Mihomo GUI")
    (description "Another Mihomo GUI.  This package is available from the Arch User Repository.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 12. serverseekerv2-git --- Fast Minecraft server scanner written in Rust
;;; -------------------------------------------------------------------
(define-public serverseekerv2-git
  (package
    (name "serverseekerv2-git")
    (version "0.0.122")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://git.funtimes909.xyz/ServerSeekerV2/ServerSeekerV2.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("serverseekerv2" "bin/serverseekerv2"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.funtimes909.xyz/ServerSeekerV2/ServerSeekerV2")
    (synopsis "Fast Minecraft server scanner written in Rust")
    (description "Fast Minecraft server scanner written in Rust.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. seh-utn --- SEH Technology UTN service/daemon, kernel module (DKMS) and 
;;; -------------------------------------------------------------------
(define-public seh-utn
  (package
    (name "seh-utn")
    (version "4.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.seh-technology.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("seh-utn" "bin/seh-utn"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.seh-technology.com/")
    (synopsis "SEH Technology UTN service/daemon, kernel module (DKMS) and clitool")
    (description "SEH Technology UTN service/daemon, kernel module (DKMS) and clitool.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 14. scrutiny-runit --- Runit service script for scrutiny
;;; -------------------------------------------------------------------
(define-public scrutiny-runit
  (package
    (name "scrutiny-runit")
    (version "20250508")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AnalogJ/scrutiny/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("scrutiny-runit" "bin/scrutiny-runit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AnalogJ/scrutiny")
    (synopsis "Runit service script for scrutiny")
    (description "Runit service script for scrutiny.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 15. python-modesolverpy --- Photonic mode solver with a simple interface
;;; -------------------------------------------------------------------
(define-public python-modesolverpy
  (package
    (name "python-modesolverpy")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/jtambasco/modesolverpy/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("python-modesolverpy" "bin/python-modesolverpy"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jtambasco/modesolverpy")
    (synopsis "Photonic mode solver with a simple interface")
    (description "Photonic mode solver with a simple interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. postgresql-uint-git --- Unsigned integer types extension for PostgreSQL
;;; -------------------------------------------------------------------
(define-public postgresql-uint-git
  (package
    (name "postgresql-uint-git")
    (version "0.0.89")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/petere/pguint.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("postgresql-uint" "bin/postgresql-uint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/petere/pguint")
    (synopsis "Unsigned integer types extension for PostgreSQL")
    (description "Unsigned integer types extension for PostgreSQL.")
    (license (license:non-copyleft "https://opensource.org/licenses/PostgreSQL"))))

;;; -------------------------------------------------------------------
;;; 17. postgresql-uint --- Unsigned integer types extension for PostgreSQL
;;; -------------------------------------------------------------------
(define-public postgresql-uint
  (package
    (name "postgresql-uint")
    (version "1.20250815")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/petere/pguint/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("postgresql-uint" "bin/postgresql-uint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/petere/pguint")
    (synopsis "Unsigned integer types extension for PostgreSQL")
    (description "Unsigned integer types extension for PostgreSQL.")
    (license (license:non-copyleft "https://opensource.org/licenses/PostgreSQL"))))

;;; -------------------------------------------------------------------
;;; 18. minibridge-git --- Make your MCP servers secure and production ready
;;; -------------------------------------------------------------------
(define-public minibridge-git
  (package
    (name "minibridge-git")
    (version "0.4.0.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/acuvity/minibridge.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("minibridge" "bin/minibridge"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/acuvity/minibridge")
    (synopsis "Make your MCP servers secure and production ready")
    (description "Make your MCP servers secure and production ready.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 19. minibridge --- Make your MCP servers secure and production ready
;;; -------------------------------------------------------------------
(define-public minibridge
  (package
    (name "minibridge")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/acuvity/minibridge/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("minibridge" "bin/minibridge"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/acuvity/minibridge")
    (synopsis "Make your MCP servers secure and production ready")
    (description "Make your MCP servers secure and production ready.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 20. libpinmame-git --- Pinball Multiple Arcade Machine Emulator
;;; -------------------------------------------------------------------
(define-public libpinmame-git
  (package
    (name "libpinmame-git")
    (version "0.0.6860")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vpinball/pinmame.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libpinmame" "bin/libpinmame"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vpinball/pinmame")
    (synopsis "Pinball Multiple Arcade Machine Emulator")
    (description "Pinball Multiple Arcade Machine Emulator.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 21. libdxvk-gplasync --- Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux,
;;; -------------------------------------------------------------------
(define-public libdxvk-gplasync
  (package
    (name "libdxvk-gplasync")
    (version "2.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/doitsujin/dxvk/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libdxvk-gplasync" "bin/libdxvk-gplasync"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/doitsujin/dxvk")
    (synopsis "Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync patch")
    (description "Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux, gplasync patch.")
    (license license:zlib)))

;;; -------------------------------------------------------------------
;;; 22. libdof-git --- A cross platform library for performing Direct Output Framew
;;; -------------------------------------------------------------------
(define-public libdof-git
  (package
    (name "libdof-git")
    (version "0.0.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jsm174/libdof.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libdof" "bin/libdof"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jsm174/libdof")
    (synopsis "A cross platform library for performing Direct Output Framework tasks")
    (description "A cross platform library for performing Direct Output Framework tasks.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 23. leetcode-local-cli --- Download leetcode problems to text files via the command lin
;;; -------------------------------------------------------------------
(define-public leetcode-local-cli
  (package
    (name "leetcode-local-cli")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/pramanandasarkar02/leetcode-cli/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("leetcode-local-cli" "bin/leetcode-local-cli"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pramanandasarkar02/leetcode-cli")
    (synopsis "Download leetcode problems to text files via the command line")
    (description "Download leetcode problems to text files via the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. komodo-periphery-bin --- Periphery server for the komodo monitor
;;; -------------------------------------------------------------------
(define-public komodo-periphery-bin
  (package
    (name "komodo-periphery-bin")
    (version "2.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://komo.do/releases/download/v" version "/komodo-periphery-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("komodo-periphery" "bin/komodo-periphery"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://komo.do/")
    (synopsis "Periphery server for the komodo monitor")
    (description "Periphery server for the komodo monitor.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 25. jdk24-graalvm-ee-bin --- Universal virtual machine for running applications written i
;;; -------------------------------------------------------------------
(define-public jdk24-graalvm-ee-bin
  (package
    (name "jdk24-graalvm-ee-bin")
    (version "24.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.graalvm.org/releases/download/v" version "/jdk24-graalvm-ee-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jdk24-graalvm-ee" "bin/jdk24-graalvm-ee"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.graalvm.org/")
    (synopsis "Universal virtual machine for running applications written in a variety of...")
    (description "Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java 24 version.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 26. jdk22-graalvm-bin --- Universal virtual machine for running applications written i
;;; -------------------------------------------------------------------
(define-public jdk22-graalvm-bin
  (package
    (name "jdk22-graalvm-bin")
    (version "22.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.graalvm.org/releases/download/v" version "/jdk22-graalvm-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jdk22-graalvm" "bin/jdk22-graalvm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.graalvm.org/")
    (synopsis "Universal virtual machine for running applications written in a variety of...")
    (description "Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java 22 version.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 27. influxdb-runit --- Runit service script for influxdb
;;; -------------------------------------------------------------------
(define-public influxdb-runit
  (package
    (name "influxdb-runit")
    (version "20250507")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/InfluxData/influxdb/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("influxdb-runit" "bin/influxdb-runit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/InfluxData/influxdb")
    (synopsis "Runit service script for influxdb")
    (description "Runit service script for influxdb.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. customasm --- An assembler for custom, user-defined instruction sets
;;; -------------------------------------------------------------------
(define-public customasm
  (package
    (name "customasm")
    (version "0.13.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hlorenzi/customasm/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("customasm" "bin/customasm"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hlorenzi/customasm")
    (synopsis "An assembler for custom, user-defined instruction sets")
    (description "An assembler for custom, user-defined instruction sets.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 29. bangumium-git --- Universal third-party desktop client for bgm.tv
;;; -------------------------------------------------------------------
(define-public bangumium-git
  (package
    (name "bangumium-git")
    (version "0.9.5.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Bangumium/Bangumium.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bangumium" "bin/bangumium"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Bangumium/Bangumium")
    (synopsis "Universal third-party desktop client for bgm.tv")
    (description "Universal third-party desktop client for bgm.tv.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. httraqt --- Graphical user interface (GUI) for HTTrack library
;;; -------------------------------------------------------------------
(define-public httraqt
  (package
    (name "httraqt")
    (version "1.4.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://httraqt.sourceforge.net/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("httraqt" "bin/httraqt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://httraqt.sourceforge.net")
    (synopsis "Graphical user interface (GUI) for HTTrack library")
    (description "Graphical user interface (GUI) for HTTrack library.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 31. camlpdf --- Coherent Graphics OCaml library for reading, writing and mod
;;; -------------------------------------------------------------------
(define-public camlpdf
  (package
    (name "camlpdf")
    (version "2.9")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/johnwhitington/camlpdf/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("camlpdf" "bin/camlpdf"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/johnwhitington/camlpdf")
    (synopsis "Coherent Graphics OCaml library for reading, writing and modifying PDF files")
    (description "Coherent Graphics OCaml library for reading, writing and modifying PDF files.")
    (license license:lgpl2.1+)))

;;; -------------------------------------------------------------------
;;; 32. hg-evolve --- Flexible evolution of Mercurial history
;;; -------------------------------------------------------------------
(define-public hg-evolve
  (package
    (name "hg-evolve")
    (version "12.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.mercurial-scm.org/doc/evolution/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hg-evolve" "bin/hg-evolve"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mercurial-scm.org/doc/evolution/")
    (synopsis "Flexible evolution of Mercurial history")
    (description "Flexible evolution of Mercurial history.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 33. superpaper --- Cross-platform multi monitor wallpaper manager
;;; -------------------------------------------------------------------
(define-public superpaper
  (package
    (name "superpaper")
    (version "2.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hhannine/Superpaper/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("superpaper" "bin/superpaper"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hhannine/Superpaper")
    (synopsis "Cross-platform multi monitor wallpaper manager")
    (description "Cross-platform multi monitor wallpaper manager.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. libpostal-git --- A C library for parsing/normalizing street addresses around 
;;; -------------------------------------------------------------------
(define-public libpostal-git
  (package
    (name "libpostal-git")
    (version "1.1.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openvenues/libpostal.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libpostal" "bin/libpostal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openvenues/libpostal")
    (synopsis "A C library for parsing/normalizing street addresses around the world. Pow...")
    (description "A C library for parsing/normalizing street addresses around the world. Powered by statistical NLP and open geo data. (git version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. stash --- Locally hosted web-based app written in Go which organizes a
;;; -------------------------------------------------------------------
(define-public stash
  (package
    (name "stash")
    (version "0.31.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/stashapp/stash/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("stash" "bin/stash"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/stashapp/stash")
    (synopsis "Locally hosted web-based app written in Go which organizes and serves your...")
    (description "Locally hosted web-based app written in Go which organizes and serves your Adult Video.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 36. brother-ql820nwb --- LPR and CUPS driver for Brother QL-820NWB label printer
;;; -------------------------------------------------------------------
(define-public brother-ql820nwb
  (package
    (name "brother-ql820nwb")
    (version "3.1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://solutions.brother.com/linux/en_us/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("brother-ql820nwb" "bin/brother-ql820nwb"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://solutions.brother.com/linux/en_us/")
    (synopsis "LPR and CUPS driver for Brother QL-820NWB label printer")
    (description "LPR and CUPS driver for Brother QL-820NWB label printer.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 37. vidmerger-git --- Merge video and audio files via CLI
;;; -------------------------------------------------------------------
(define-public vidmerger-git
  (package
    (name "vidmerger-git")
    (version "0.0.292")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tgotwig/vidmerger.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vidmerger" "bin/vidmerger"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tgotwig/vidmerger")
    (synopsis "Merge video and audio files via CLI")
    (description "Merge video and audio files via CLI.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. qcalcfilehash --- Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, M
;;; -------------------------------------------------------------------
(define-public qcalcfilehash
  (package
    (name "qcalcfilehash")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://bitbucket.org/admsasha/qcalcfilehash/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qcalcfilehash" "bin/qcalcfilehash"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bitbucket.org/admsasha/qcalcfilehash")
    (synopsis "Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8)")
    (description "Hash calculator (SHA1, SHA-224, SHA-256, SHA-384, SHA-512, MD5, CRC32, CRC8).")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. python-tryton --- Tryton desktop client
;;; -------------------------------------------------------------------
(define-public python-tryton
  (package
    (name "python-tryton")
    (version "8.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://tryton.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("python-tryton" "bin/python-tryton"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tryton.org")
    (synopsis "Tryton desktop client")
    (description "Tryton desktop client.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 40. activity-aware-firefox --- wrapper to make Firefox aware of Plasma Desktop activities
;;; -------------------------------------------------------------------
(define-public activity-aware-firefox
  (package
    (name "activity-aware-firefox")
    (version "0.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.com/hook/activity-aware-firefox/-/archive/v" version "/activity-aware-firefox-v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("activity-aware-firefox" "bin/activity-aware-firefox"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/hook/activity-aware-firefox")
    (synopsis "wrapper to make Firefox aware of Plasma Desktop activities")
    (description "wrapper to make Firefox aware of Plasma Desktop activities.")
    (license license:cc0)))

;;; -------------------------------------------------------------------
;;; 41. wretch --- A simple Fetch CLI program Built with Rust
;;; -------------------------------------------------------------------
(define-public wretch
  (package
    (name "wretch")
    (version "1.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/thesillyboi/wretch/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wretch" "bin/wretch"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thesillyboi/wretch")
    (synopsis "A simple Fetch CLI program Built with Rust")
    (description "A simple Fetch CLI program Built with Rust.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 42. python-goocalendar --- A calendar widget for GTK using PyGoocanvas
;;; -------------------------------------------------------------------
(define-public python-goocalendar
  (package
    (name "python-goocalendar")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://goocalendar.tryton.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("python-goocalendar" "bin/python-goocalendar"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://goocalendar.tryton.org/")
    (synopsis "A calendar widget for GTK using PyGoocanvas")
    (description "A calendar widget for GTK using PyGoocanvas.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 43. newrelic-infra-bin --- New Relic - All-in-On Observability - infrastructure agent
;;; -------------------------------------------------------------------
(define-public newrelic-infra-bin
  (package
    (name "newrelic-infra-bin")
    (version "1.74.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/newrelic/infrastructure-agent/releases/download/v" version "/newrelic-infra-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("newrelic-infra" "bin/newrelic-infra"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/newrelic/infrastructure-agent/")
    (synopsis "New Relic - All-in-On Observability - infrastructure agent")
    (description "New Relic - All-in-On Observability - infrastructure agent.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 44. libxerces-c-3-2 --- A validating XML parser written in a portable subset of C++ 
;;; -------------------------------------------------------------------
(define-public libxerces-c-3-2
  (package
    (name "libxerces-c-3.2")
    (version "3.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://xerces.apache.org/xerces-c/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libxerces-c-3.2" "bin/libxerces-c-3.2"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://xerces.apache.org/xerces-c/")
    (synopsis "A validating XML parser written in a portable subset of C++ legacy version...")
    (description "A validating XML parser written in a portable subset of C++ legacy version: 3.2.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 45. libpupdmd-git --- A cross-platform library for matching PUP triggers in DMD fr
;;; -------------------------------------------------------------------
(define-public libpupdmd-git
  (package
    (name "libpupdmd-git")
    (version "0.0.24")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ppuc/libpupdmd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libpupdmd" "bin/libpupdmd"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ppuc/libpupdmd")
    (synopsis "A cross-platform library for matching PUP triggers in DMD frames")
    (description "A cross-platform library for matching PUP triggers in DMD frames.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 46. libframeutil-git --- Some DMD frame utilities used by libzedmd and libdmdutil
;;; -------------------------------------------------------------------
(define-public libframeutil-git
  (package
    (name "libframeutil-git")
    (version "0.0.9")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ppuc/libframeutil.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libframeutil" "bin/libframeutil"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ppuc/libframeutil")
    (synopsis "Some DMD frame utilities used by libzedmd and libdmdutil")
    (description "Some DMD frame utilities used by libzedmd and libdmdutil.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 47. firefox-extension-simplelogin-bin --- Create a different email for each website to hide your real 
;;; -------------------------------------------------------------------
(define-public firefox-extension-simplelogin-bin
  (package
    (name "firefox-extension-simplelogin-bin")
    (version "3.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/simple-login/browser-extension/releases/download/v" version "/firefox-extension-simplelogin-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("firefox-extension-simplelogin" "bin/firefox-extension-simplelogin"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/simple-login/browser-extension")
    (synopsis "Create a different email for each website to hide your real email")
    (description "Create a different email for each website to hide your real email.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 48. claude-linux-client-bin --- The missing desktop client for Claude.ai for Linux in Electr
;;; -------------------------------------------------------------------
(define-public claude-linux-client-bin
  (package
    (name "claude-linux-client-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/CTTY-NUL/claude-linux-client/releases/download/v" version "/claude-linux-client-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("claude-linux-client" "bin/claude-linux-client"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CTTY-NUL/claude-linux-client")
    (synopsis "The missing desktop client for Claude.ai for Linux in Electron.(Prebuilt v...")
    (description "The missing desktop client for Claude.ai for Linux in Electron.(Prebuilt version.Use system-wide electron).")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 49. suricata --- A high performance Network IDS, IPS and Network Security Mon
;;; -------------------------------------------------------------------
(define-public suricata
  (package
    (name "suricata")
    (version "8.0.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://suricata.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("suricata" "bin/suricata"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://suricata.io/")
    (synopsis "A high performance Network IDS, IPS and Network Security Monitoring engine...")
    (description "A high performance Network IDS, IPS and Network Security Monitoring engine, Vectorscan instead of hyperscan.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 50. iscan-plugin-gt-s650 --- EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET,
;;; -------------------------------------------------------------------
(define-public iscan-plugin-gt-s650
  (package
    (name "iscan-plugin-gt-s650")
    (version "2.30.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("iscan-plugin-gt-s650" "bin/iscan-plugin-gt-s650"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX")
    (synopsis "EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX...")
    (description "EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39).")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 51. standardfile-bin --- Standard File Server for standardnotes, Go Implementation
;;; -------------------------------------------------------------------
(define-public standardfile-bin
  (package
    (name "standardfile-bin")
    (version "0.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/mdouchement/standardfile/releases/download/v" version "/standardfile-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("standardfile" "bin/standardfile"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mdouchement/standardfile")
    (synopsis "Standard File Server for standardnotes, Go Implementation")
    (description "Standard File Server for standardnotes, Go Implementation.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 52. python-aiomax-git --- The asynchronous library for Max (newest git version)
;;; -------------------------------------------------------------------
(define-public python-aiomax-git
  (package
    (name "python-aiomax-git")
    (version "2.7.1.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dpnspn/aiomax.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("python-aiomax" "bin/python-aiomax"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dpnspn/aiomax")
    (synopsis "The asynchronous library for Max (newest git version)")
    (description "The asynchronous library for Max (newest git version).")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 53. libdmdutil-git --- A cross platform library for performing DMD tasks
;;; -------------------------------------------------------------------
(define-public libdmdutil-git
  (package
    (name "libdmdutil-git")
    (version "0.0.129")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vpinball/libdmdutil.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libdmdutil" "bin/libdmdutil"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vpinball/libdmdutil")
    (synopsis "A cross platform library for performing DMD tasks")
    (description "A cross platform library for performing DMD tasks.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 54. immich-runit --- Runit service script for immich
;;; -------------------------------------------------------------------
(define-public immich-runit
  (package
    (name "immich-runit")
    (version "20251231")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/immich-app/immich/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("immich-runit" "bin/immich-runit"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/immich-app/immich")
    (synopsis "Runit service script for immich")
    (description "Runit service script for immich.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 55. thor-flash-utility --- Utility for flashing firmware on Samsung devices, based on .
;;; -------------------------------------------------------------------
(define-public thor-flash-utility
  (package
    (name "thor-flash-utility")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Samsung-Loki/Thor/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("thor-flash-utility" "bin/thor-flash-utility"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Samsung-Loki/Thor")
    (synopsis "Utility for flashing firmware on Samsung devices, based on .NET 9 Native AOT")
    (description "Utility for flashing firmware on Samsung devices, based on .NET 9 Native AOT.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 56. gprbuild-bootstrap --- Static GPRbuild to bootstrap XML/Ada and GPRbuild itself
;;; -------------------------------------------------------------------
(define-public gprbuild-bootstrap
  (package
    (name "gprbuild-bootstrap")
    (version "26.0w")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AdaCore/gprbuild/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gprbuild-bootstrap" "bin/gprbuild-bootstrap"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AdaCore/gprbuild")
    (synopsis "Static GPRbuild to bootstrap XML/Ada and GPRbuild itself")
    (description "Static GPRbuild to bootstrap XML/Ada and GPRbuild itself.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 57. ada-language-server-bin --- High performance syntactic and semantic engine for the Ada p
;;; -------------------------------------------------------------------
(define-public ada-language-server-bin
  (package
    (name "ada_language_server-bin")
    (version "2026.2.202604091")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/AdaCore/ada_language_server/releases/download/v" version "/ada_language_server-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ada_language_server" "bin/ada_language_server"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AdaCore/ada_language_server")
    (synopsis "High performance syntactic and semantic engine for the Ada programming lan...")
    (description "High performance syntactic and semantic engine for the Ada programming language.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 58. freeimage-vpinball-git --- Fork of freeimage with patches specifically for vpinball (DO
;;; -------------------------------------------------------------------
(define-public freeimage-vpinball-git
  (package
    (name "freeimage-vpinball-git")
    (version "0.0.1926")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/toxieainc/freeimage.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("freeimage-vpinball" "bin/freeimage-vpinball"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/toxieainc/freeimage")
    (synopsis "Fork of freeimage with patches specifically for vpinball (DO NOT INSTALL I...")
    (description "Fork of freeimage with patches specifically for vpinball (DO NOT INSTALL IF YOU DO NOT NEED IT).")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 59. rustowl-git --- Visualize Ownership and Lifetimes in Rust
;;; -------------------------------------------------------------------
(define-public rustowl-git
  (package
    (name "rustowl-git")
    (version "0.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cordx56/rustowl.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rustowl" "bin/rustowl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cordx56/rustowl")
    (synopsis "Visualize Ownership and Lifetimes in Rust")
    (description "Visualize Ownership and Lifetimes in Rust.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 60. libaltsound-git --- A cross platform compilation of altsound that is baked direc
;;; -------------------------------------------------------------------
(define-public libaltsound-git
  (package
    (name "libaltsound-git")
    (version "0.0.23")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vpinball/libaltsound.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libaltsound" "bin/libaltsound"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vpinball/libaltsound")
    (synopsis "A cross platform compilation of altsound that is baked directly into VPinMAME")
    (description "A cross platform compilation of altsound that is baked directly into VPinMAME.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 61. fingerprintx-bin --- Standalone utility for service discovery on open ports!
;;; -------------------------------------------------------------------
(define-public fingerprintx-bin
  (package
    (name "fingerprintx-bin")
    (version "1.1.13")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/praetorian-inc/fingerprintx/releases/download/v" version "/fingerprintx-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fingerprintx" "bin/fingerprintx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/praetorian-inc/fingerprintx")
    (synopsis "Standalone utility for service discovery on open ports!")
    (description "Standalone utility for service discovery on open ports!.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 62. fingerprintx --- Standalone utility for service discovery on open ports!
;;; -------------------------------------------------------------------
(define-public fingerprintx
  (package
    (name "fingerprintx")
    (version "1.1.19")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/praetorian-inc/fingerprintx/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fingerprintx" "bin/fingerprintx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/praetorian-inc/fingerprintx")
    (synopsis "Standalone utility for service discovery on open ports!")
    (description "Standalone utility for service discovery on open ports!.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 63. codelite-bin --- A cross platform C/C++/PHP and Node.js IDE written in C++
;;; -------------------------------------------------------------------
(define-public codelite-bin
  (package
    (name "codelite-bin")
    (version "18.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codelite.org/releases/download/v" version "/codelite-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("codelite" "bin/codelite"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codelite.org/")
    (synopsis "A cross platform C/C++/PHP and Node.js IDE written in C++")
    (description "A cross platform C/C++/PHP and Node.js IDE written in C++.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 64. retrobyte --- A retro terminal-based game collection: ArchSnake, Brickfall
;;; -------------------------------------------------------------------
(define-public retrobyte
  (package
    (name "retrobyte")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/KOrtizLedezma/Retrobyte.git/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("retrobyte" "bin/retrobyte"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KOrtizLedezma/Retrobyte.git")
    (synopsis "A retro terminal-based game collection: ArchSnake, Brickfall, and ArcadePong")
    (description "A retro terminal-based game collection: ArchSnake, Brickfall, and ArcadePong.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. musicpod --- Music, radio, television and podcast player
;;; -------------------------------------------------------------------
(define-public musicpod
  (package
    (name "musicpod")
    (version "2.16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/ubuntu-flutter-community/musicpod/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("musicpod" "bin/musicpod"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ubuntu-flutter-community/musicpod")
    (synopsis "Music, radio, television and podcast player")
    (description "Music, radio, television and podcast player.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 66. tor-browser-alpha-bin --- Alpha Version of Tor Browser
;;; -------------------------------------------------------------------
(define-public tor-browser-alpha-bin
  (package
    (name "tor-browser-alpha-bin")
    (version "16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.torproject.org/projects/torbrowser.html/releases/download/v" version "/tor-browser-alpha-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tor-browser-alpha" "bin/tor-browser-alpha"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.torproject.org/projects/torbrowser.html")
    (synopsis "Alpha Version of Tor Browser")
    (description "Alpha Version of Tor Browser.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 67. ianny-git --- Desktop utility periodically informing the user to take brea
;;; -------------------------------------------------------------------
(define-public ianny-git
  (package
    (name "ianny-git")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zefr0x/ianny.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("ianny" "bin/ianny"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zefr0x/ianny")
    (synopsis "Desktop utility periodically informing the user to take breaks")
    (description "Desktop utility periodically informing the user to take breaks.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 68. hopper4 --- Reverse engineering tool that lets you disassemble, decompil
;;; -------------------------------------------------------------------
(define-public hopper4
  (package
    (name "hopper4")
    (version "5.19.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.hopperapp.com/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hopper4" "bin/hopper4"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.hopperapp.com/")
    (synopsis "Reverse engineering tool that lets you disassemble, decompile and debug yo...")
    (description "Reverse engineering tool that lets you disassemble, decompile and debug your applications.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 69. rubymine --- Ruby and Rails IDE with the full stack of essential develope
;;; -------------------------------------------------------------------
(define-public rubymine
  (package
    (name "rubymine")
    (version "2026.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.jetbrains.com/ruby/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rubymine" "bin/rubymine"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.jetbrains.com/ruby/")
    (synopsis "Ruby and Rails IDE with the full stack of essential developer tools")
    (description "Ruby and Rails IDE with the full stack of essential developer tools.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 70. libva-intel-driver-hybrid --- VA-API implementation for Intel G45 and HD Graphics family
;;; -------------------------------------------------------------------
(define-public libva-intel-driver-hybrid
  (package
    (name "libva-intel-driver-hybrid")
    (version "2.4.5")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/irql-notlessorequal/intel-vaapi-driver/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("libva-intel-driver-hybrid" "bin/libva-intel-driver-hybrid"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/irql-notlessorequal/intel-vaapi-driver")
    (synopsis "VA-API implementation for Intel G45 and HD Graphics family")
    (description "VA-API implementation for Intel G45 and HD Graphics family.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 71. shiroa --- shiroa is a simple tool for creating modern online books in 
;;; -------------------------------------------------------------------
(define-public shiroa
  (package
    (name "shiroa")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/Myriad-Dreamin/shiroa/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shiroa" "bin/shiroa"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Myriad-Dreamin/shiroa")
    (synopsis "shiroa is a simple tool for creating modern online books in pure typst")
    (description "shiroa is a simple tool for creating modern online books in pure typst.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 72. mullvad-browser-latest-bin --- Latest version of Mullvad Browser, a privacy-focused web bro
;;; -------------------------------------------------------------------
(define-public mullvad-browser-latest-bin
  (package
    (name "mullvad-browser-latest-bin")
    (version "16.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://mullvad.net/en/browser/releases/download/v" version "/mullvad-browser-latest-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mullvad-browser-latest" "bin/mullvad-browser-latest"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mullvad.net/en/browser")
    (synopsis "Latest version of Mullvad Browser, a privacy-focused web browser developed...")
    (description "Latest version of Mullvad Browser, a privacy-focused web browser developed by Mullvad VPN and the Tor Project.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 73. aw-watcher-media-player --- Watcher of system's currently playing media for ActivityWatc
;;; -------------------------------------------------------------------
(define-public aw-watcher-media-player
  (package
    (name "aw-watcher-media-player")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/2e3s/aw-watcher-media-player/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("aw-watcher-media-player" "bin/aw-watcher-media-player"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/2e3s/aw-watcher-media-player")
    (synopsis "Watcher of system's currently playing media for ActivityWatch")
    (description "Watcher of system's currently playing media for ActivityWatch.")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 74. nping --- 🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Dat
;;; -------------------------------------------------------------------
(define-public nping
  (package
    (name "nping")
    (version "0.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hanshuaikang/Nping/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nping" "bin/nping"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hanshuaikang/Nping")
    (synopsis "🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualiz...")
    (description "🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 75. sptlrx-bin --- Timesynced Spotify lyrics in your terminal
;;; -------------------------------------------------------------------
(define-public sptlrx-bin
  (package
    (name "sptlrx-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/raitonoberu/sptlrx/releases/download/v" version "/sptlrx-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sptlrx" "bin/sptlrx"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raitonoberu/sptlrx")
    (synopsis "Timesynced Spotify lyrics in your terminal")
    (description "Timesynced Spotify lyrics in your terminal.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 76. codegpt-bin --- A CLI written in Go language that writes git commit messages
;;; -------------------------------------------------------------------
(define-public codegpt-bin
  (package
    (name "codegpt-bin")
    (version "1.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/appleboy/CodeGPT/releases/download/v" version "/codegpt-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("codegpt" "bin/codegpt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/appleboy/CodeGPT")
    (synopsis "A CLI written in Go language that writes git commit messages or do a code ...")
    (description "A CLI written in Go language that writes git commit messages or do a code review brief for you using ChatGPT AI (gpt-4, gpt-3.5-turbo model) and automatically installs a git prepare-commit-msg hook.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 77. dunst-wayland-git --- Lightweight and customizable notification daemon (built with
;;; -------------------------------------------------------------------
(define-public dunst-wayland-git
  (package
    (name "dunst-wayland-git")
    (version "1.12.0.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://dunst-project.org.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dunst-wayland" "bin/dunst-wayland"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://dunst-project.org/")
    (synopsis "Lightweight and customizable notification daemon (built without X11 suport)")
    (description "Lightweight and customizable notification daemon (built without X11 suport).")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 78. lefthook-bin --- Git hooks manager
;;; -------------------------------------------------------------------
(define-public lefthook-bin
  (package
    (name "lefthook-bin")
    (version "2.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/evilmartians/lefthook/releases/download/v" version "/lefthook-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lefthook" "bin/lefthook"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/evilmartians/lefthook")
    (synopsis "Git hooks manager")
    (description "Git hooks manager.  This package is available from the Arch User Repository.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 79. jcal --- Jalali calendar is a small and portable free software librar
;;; -------------------------------------------------------------------
(define-public jcal
  (package
    (name "jcal")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://www.nongnu.org/jcal/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jcal" "bin/jcal"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.nongnu.org/jcal/")
    (synopsis "Jalali calendar is a small and portable free software library to manipulat...")
    (description "Jalali calendar is a small and portable free software library to manipulate date and time in Jalali calendar system.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 80. gcc12-libs --- Runtime libraries shipped by GCC (12.x.x)
;;; -------------------------------------------------------------------
(define-public gcc12-libs
  (package
    (name "gcc12-libs")
    (version "12.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gcc.gnu.org/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gcc12-libs" "bin/gcc12-libs"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gcc.gnu.org")
    (synopsis "Runtime libraries shipped by GCC (12.x.x)")
    (description "Runtime libraries shipped by GCC (12.x.x).")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 81. picotool --- Tool for inspecting RP2040 binaries and interacting with RP2
;;; -------------------------------------------------------------------
(define-public picotool
  (package
    (name "picotool")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/raspberrypi/picotool/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("picotool" "bin/picotool"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/raspberrypi/picotool")
    (synopsis "Tool for inspecting RP2040 binaries and interacting with RP2040 devices")
    (description "Tool for inspecting RP2040 binaries and interacting with RP2040 devices.")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 82. mycorrhiza --- Filesystem and git-based wiki engine written in Go using myc
;;; -------------------------------------------------------------------
(define-public mycorrhiza
  (package
    (name "mycorrhiza")
    (version "1.15.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://codeberg.org/bouncepaw/mycorrhiza/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mycorrhiza" "bin/mycorrhiza"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/bouncepaw/mycorrhiza")
    (synopsis "Filesystem and git-based wiki engine written in Go using mycomarkup")
    (description "Filesystem and git-based wiki engine written in Go using mycomarkup.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 83. plank-reloaded-git --- Fork of the original Plank project, providing a simple dock 
;;; -------------------------------------------------------------------
(define-public plank-reloaded-git
  (package
    (name "plank-reloaded-git")
    (version "0.11.146.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/zquestz/plank-reloaded.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("plank-reloaded" "bin/plank-reloaded"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/zquestz/plank-reloaded")
    (synopsis "Fork of the original Plank project, providing a simple dock for X11 deskto...")
    (description "Fork of the original Plank project, providing a simple dock for X11 desktop environments.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 84. linkwarden --- Self hosted bookmark manager
;;; -------------------------------------------------------------------
(define-public linkwarden
  (package
    (name "linkwarden")
    (version "2.14.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/linkwarden/linkwarden/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("linkwarden" "bin/linkwarden"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linkwarden/linkwarden")
    (synopsis "Self hosted bookmark manager")
    (description "Self hosted bookmark manager.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 85. skippy-xd-git --- A full-screen task switcher for X11, similar to Overview and
;;; -------------------------------------------------------------------
(define-public skippy-xd-git
  (package
    (name "skippy-xd-git")
    (version "2025.02.28.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/felixfung/skippy-xd.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("skippy-xd" "bin/skippy-xd"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/felixfung/skippy-xd")
    (synopsis "A full-screen task switcher for X11, similar to Overview and Exposé")
    (description "A full-screen task switcher for X11, similar to Overview and Exposé.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 86. simple-scan-linuxmint --- Simple scanning utility. Linux Mint version
;;; -------------------------------------------------------------------
(define-public simple-scan-linuxmint
  (package
    (name "simple-scan-linuxmint")
    (version "44.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gitlab.gnome.org/GNOME/simple-scan/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("simple-scan-linuxmint" "bin/simple-scan-linuxmint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/GNOME/simple-scan")
    (synopsis "Simple scanning utility. Linux Mint version")
    (description "Simple scanning utility. Linux Mint version.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 87. qutebrowser-profile-git --- A simple wrapper script for qutebrowser that allows you to m
;;; -------------------------------------------------------------------
(define-public qutebrowser-profile-git
  (package
    (name "qutebrowser-profile-git")
    (version "20201130.55")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/jtyers/qutebrowser-profile.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("qutebrowser-profile" "bin/qutebrowser-profile"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jtyers/qutebrowser-profile")
    (synopsis "A simple wrapper script for qutebrowser that allows you to maintain differ...")
    (description "A simple wrapper script for qutebrowser that allows you to maintain different profiles.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 88. recyclarr-bin --- Automatically synchronize recommended settings from the TRaS
;;; -------------------------------------------------------------------
(define-public recyclarr-bin
  (package
    (name "recyclarr-bin")
    (version "8.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://recyclarr.dev/releases/download/v" version "/recyclarr-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("recyclarr" "bin/recyclarr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://recyclarr.dev")
    (synopsis "Automatically synchronize recommended settings from the TRaSH guides to yo...")
    (description "Automatically synchronize recommended settings from the TRaSH guides to your Sonarr/Radarr instances.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 89. td-tui --- Simple task management TUI tool
;;; -------------------------------------------------------------------
(define-public td-tui
  (package
    (name "td-tui")
    (version "0.4.12")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/voioo/td/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("td-tui" "bin/td-tui"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/voioo/td")
    (synopsis "Simple task management TUI tool")
    (description "Simple task management TUI tool.")
    (license license:bsd-0)))

;;; -------------------------------------------------------------------
;;; 90. litra --- CLI and library to control Logitech Litra Glow, Beam and Bea
;;; -------------------------------------------------------------------
(define-public litra
  (package
    (name "litra")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/timrogers/litra-rs/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("litra" "bin/litra"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timrogers/litra-rs")
    (synopsis "CLI and library to control Logitech Litra Glow, Beam and Beam LX lights")
    (description "CLI and library to control Logitech Litra Glow, Beam and Beam LX lights.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 91. hedgedoc2 --- Platform to write and share markdown (Version 2)
;;; -------------------------------------------------------------------
(define-public hedgedoc2
  (package
    (name "hedgedoc2")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/hedgedoc/hedgedoc/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hedgedoc2" "bin/hedgedoc2"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hedgedoc/hedgedoc")
    (synopsis "Platform to write and share markdown (Version 2)")
    (description "Platform to write and share markdown (Version 2).")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 92. victoriametrics --- Fast, cost-effective and scalable time series database
;;; -------------------------------------------------------------------
(define-public victoriametrics
  (package
    (name "victoriametrics")
    (version "1.138.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://victoriametrics.github.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("victoriametrics" "bin/victoriametrics"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://victoriametrics.github.io")
    (synopsis "Fast, cost-effective and scalable time series database")
    (description "Fast, cost-effective and scalable time series database.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 93. wlmaker --- Wayland compositor inspired by WindowMaker
;;; -------------------------------------------------------------------
(define-public wlmaker
  (package
    (name "wlmaker")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/phkaeser/wlmaker/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wlmaker" "bin/wlmaker"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/phkaeser/wlmaker")
    (synopsis "Wayland compositor inspired by WindowMaker")
    (description "Wayland compositor inspired by WindowMaker.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 94. nrfconnect-appimage --- Cross-platform development software for Bluetooth Low Energy
;;; -------------------------------------------------------------------
(define-public nrfconnect-appimage
  (package
    (name "nrfconnect-appimage")
    (version "5.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-desktop/releases/download/v" version "/nrfconnect-appimage-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("nrfconnect-appimage" "bin/nrfconnect-appimage"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.nordicsemi.com/Products/Development-tools/nRF-Connect-for-desktop")
    (synopsis "Cross-platform development software for Bluetooth Low Energy and cIoT")
    (description "Cross-platform development software for Bluetooth Low Energy and cIoT.")
    (license (license:non-copyleft "file://LICENSE"))))

;;; -------------------------------------------------------------------
;;; 95. sacd-extract --- Extract DSD files from an SACD image
;;; -------------------------------------------------------------------
(define-public sacd-extract
  (package
    (name "sacd-extract")
    (version "0.3.9.3")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://sacd-ripper.github.io/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sacd-extract" "bin/sacd-extract"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sacd-ripper.github.io/")
    (synopsis "Extract DSD files from an SACD image")
    (description "Extract DSD files from an SACD image.")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 96. gnome-system-monitor-linuxmint --- View current processes and monitor system state. Linux Mint 
;;; -------------------------------------------------------------------
(define-public gnome-system-monitor-linuxmint
  (package
    (name "gnome-system-monitor-linuxmint")
    (version "45.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://wiki.gnome.org/Apps/SystemMonitor/archive/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gnome-system-monitor-linuxmint" "bin/gnome-system-monitor-linuxmint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://wiki.gnome.org/Apps/SystemMonitor")
    (synopsis "View current processes and monitor system state. Linux Mint version")
    (description "View current processes and monitor system state. Linux Mint version.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 97. hypnotix-git --- An IPTV streaming application
;;; -------------------------------------------------------------------
(define-public hypnotix-git
  (package
    (name "hypnotix-git")
    (version "3.4.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linuxmint/hypnotix.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("hypnotix" "bin/hypnotix"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/linuxmint/hypnotix")
    (synopsis "An IPTV streaming application")
    (description "An IPTV streaming application.")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 98. vapoursynth-plugin-adjust-git --- Plugin for Vapoursynth: adjust (GIT version)
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-adjust-git
  (package
    (name "vapoursynth-plugin-adjust-git")
    (version "1.1.")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://forum.doom9.org/showthread.php?t=171956.git")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vapoursynth-plugin-adjust" "bin/vapoursynth-plugin-adjust"))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://forum.doom9.org/showthread.php?t=171956")
    (synopsis "Plugin for Vapoursynth: adjust (GIT version)")
    (description "Plugin for Vapoursynth: adjust (GIT version).")
    (license license:wtfpl2)))

;;; -------------------------------------------------------------------
;;; 99. fotokilof --- GUI for ImageMagick
;;; -------------------------------------------------------------------
(define-public fotokilof
  (package
    (name "fotokilof")
    (version "5.2.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/TeaM-TL/FotoKilof/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fotokilof" "bin/fotokilof"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TeaM-TL/FotoKilof")
    (synopsis "GUI for ImageMagick")
    (description "GUI for ImageMagick.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 100. mcptools --- Swiss Army Knife for MCP Servers
;;; -------------------------------------------------------------------
(define-public mcptools
  (package
    (name "mcptools")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/f/mcptools/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("mcptools" "bin/mcptools"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/f/mcptools")
    (synopsis "Swiss Army Knife for MCP Servers")
    (description "Swiss Army Knife for MCP Servers.")
    (license license:expat)))
