;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260425f
;;; Resolves 100 packages (81 recipes, 19 blocked).
;;;
;;; New recipes (81):
;;;       1.  aviator-git (gnu-build-system, vr210.d62aae3, gpl3+)
;;;       2.  solidigm-sst-storage-tool-cli (gnu-build-system, v2.7, #f)
;;;       3.  papis (pyproject-build-system, v0.15.0, gpl3+)
;;;       4.  glyph (cargo-build-system, v1.0.11, expat)
;;;       5.  protonutils (go-build-system, v1.6.7, expat)
;;;       6.  kosherlinux-git (copy-build-system, v1.0, gpl3+)
;;;       7.  flowkeeper-bin (copy-build-system, v0.9.1, gpl3)
;;;       8.  slic3r (gnu-build-system, v1.3.0, gpl3+)
;;;       9.  tilde (gnu-build-system, v1.1.3, gpl3+)
;;;      10.  pluma-plugins (gnu-build-system, v1.28.0, gpl2+)
;;;      11.  lokinet-bin (copy-build-system, v0.9.13, gpl3)
;;;      12.  hunspell-eo (copy-build-system, v20100216, gpl2+)
;;;      13.  dpp (cmake-build-system, v10.1.4, asl2.0)
;;;      14.  gbar-git (cmake-build-system, vr255.81b97f9, expat)
;;;      15.  qcm (cmake-build-system, v1.3.4, gpl2+)
;;;      16.  autofdo-git (cmake-build-system, v0.1.r202.gd2313ec, asl2.0)
;;;      17.  waylogout-git (meson-build-system, vr31.8470e0a, expat)
;;;      18.  q-zandronum (cmake-build-system, v1.4.20, #f)
;;;      19.  labwc-im-git (meson-build-system, v0.9.5.r67.gc9b4da2c, gpl2+)
;;;      20.  labwc-im (meson-build-system, v0.9.6, gpl2+)
;;;      21.  jfetch-git (copy-build-system, vr106.4f45e49, expat)
;;;      22.  zano-appimage (copy-build-system, v2.1.10.433, #f)
;;;      23.  xprinter-cups (gnu-build-system, v3.13.3, #f)
;;;      24.  xelfviewer-bin (copy-build-system, v0.05, expat)
;;;      25.  veesem-git (cmake-build-system, vr20.d25c8fb, isc)
;;;      26.  uivonim-bin (copy-build-system, v0.29.0, agpl3+)
;;;      27.  systune-git (meson-build-system, vr48.58d6da0, gpl3+)
;;;      28.  supercell-wx-appimage (copy-build-system, v0.5.5, #f)
;;;      29.  pytubepp-helper (pyproject-build-system, v0.8.0, expat)
;;;      30.  pororoca-bin (copy-build-system, v3.9.1, gpl3+)
;;;      31.  play-emu (cmake-build-system, v0.69, expat)
;;;      32.  nostr-relay-tray-bin (copy-build-system, v2.0.0, expat)
;;;      33.  mdq (cargo-build-system, v0.10.0, asl2.0 expat)
;;;      34.  librewolf-noscript (copy-build-system, v13.0.9, gpl2+)
;;;      35.  librewolf-extension-reverse-image-search (copy-build-system, v4.4.3, mpl2.0)
;;;      36.  librewolf-extension-foxyproxy (copy-build-system, v9.2, gpl3+)
;;;      37.  librewolf-decentraleyes (copy-build-system, v3.0.0, mpl2.0)
;;;      38.  kjots (cmake-build-system, v6.0.0, gpl2+ lgpl2.0+)
;;;      39.  kidex (cargo-build-system, v0.1.1, gpl3+)
;;;      40.  kde-fcstd-thumbnailer-git (cmake-build-system, v2.0.0, gpl3+)
;;;      41.  intel-ivsc-firmware (copy-build-system, vr2.764bd6e, #f)
;;;      42.  epubmerge (pyproject-build-system, v3.2.0, gpl3+)
;;;      43.  display-switch (cargo-build-system, v1.3.1, expat)
;;;      44.  aya-bin (copy-build-system, v1.14.2, agpl3+)
;;;      45.  gnome-shell-extension-custom-hot-corners (copy-build-system, v0.11, gpl3+)
;;;      46.  gnome-shell-extension-custom-hot-corners-extended (copy-build-system, v50, gpl3+)
;;;      47.  python-pycdlib-git (pyproject-build-system, v1.15.0.0.g67fe5ea, lgpl2.1+)
;;;      48.  vscode-js-debug-bin (copy-build-system, v1.102.0, expat)
;;;      49.  picom-pijulius-next-git (meson-build-system, v2530_11.513.g7094d7a9_2024.07.31, expat mpl2.0)
;;;      50.  jerry-cli-git (copy-build-system, vr150.e8d1598, gpl3+)
;;;      51.  jerry-cli (copy-build-system, v1.9.9, gpl3+)
;;;      52.  hangar-bin (copy-build-system, v1.9.4, asl2.0)
;;;      53.  gum-git (go-build-system, v0.2.0.r8.g378a000, expat)
;;;      54.  emv-utils-git (cmake-build-system, v0.3.1.r7.g130911d, lgpl2.1)
;;;      55.  clocking-in (copy-build-system, v0.0.4, #f)
;;;      56.  radeon-profile-git (cmake-build-system, v20200824.r22.g295d189, gpl2+)
;;;      57.  citra-appimage (copy-build-system, v20240927, gpl2+)
;;;      58.  librealsense (cmake-build-system, v2.56.5, asl2.0)
;;;      59.  protonvpn-cli-community-git (gnu-build-system, v2.2.10.r3.g3614101, gpl3+)
;;;      60.  libaudclient (gnu-build-system, v3.5rc2, bsd-2)
;;;      61.  python-wat-git (pyproject-build-system, v0.5.1.r5.g8ef5c93, expat)
;;;      62.  youtube-dl-gui-bin (copy-build-system, v2.5.6, agpl3+)
;;;      63.  xdg-desktop-portal-phosh-git (meson-build-system, v0.44.0.r0.g541ad66, gpl3+)
;;;      64.  python-dt-schema (pyproject-build-system, v2025.06.1, bsd-3)
;;;      65.  cloak-obfuscation (go-build-system, v2.10.0, gpl3+)
;;;      66.  dssd (cargo-build-system, v0.3.3, expat)
;;;      67.  unrpa (pyproject-build-system, v2.3.0, gpl3+)
;;;      68.  intel-npu-driver-bin (copy-build-system, v1.30.0.20260311_22963593310, expat)
;;;      69.  wit-git (gnu-build-system, v3.05a.r10.fc1c0b8, gpl2+)
;;;      70.  ffcast (gnu-build-system, v2.5.1, gpl3+)
;;;      71.  handlr (cargo-build-system, v0.6.4, expat)
;;;      72.  bat-asus-battery (go-build-system, v1.2, expat)
;;;      73.  python-mashumaro (pyproject-build-system, v3.17, asl2.0)
;;;      74.  ascii-rain-git (gnu-build-system, vr4.72ad7b3, expat)
;;;      75.  vivify-bin (copy-build-system, v0.14.0, gpl3+)
;;;      76.  victoriametrics-agent (go-build-system, v1.122.0, asl2.0)
;;;      77.  longoverdue (cargo-build-system, v0.5.4, expat)
;;;      78.  python-mov-cli-files (pyproject-build-system, v1.1.1, expat)
;;;      79.  radeon-profile-daemon-git (gnu-build-system, v20190603.r0.g7923bd6, gpl2+)
;;;      80.  i3lock-fancy-rapid-git (gnu-build-system, vr19.6eeebd4, bsd-3)
;;;      81.  thunar-extended (gnu-build-system, v4.18.11, gpl2+ lgpl2.1+)
;;;
;;; BLOCKED (19):
;;;       1.  qt6-xcb-private-headers-git -- DEP_RESOLUTION_FAILED
;;;       2.  playerctld-systemd-unit -- TOOLING_FAILURE
;;;       3.  borgwarehouse -- DEP_RESOLUTION_FAILED
;;;       4.  webcord-vencord-git -- DEP_RESOLUTION_FAILED
;;;       5.  faustus-dkms-git -- DEP_RESOLUTION_FAILED
;;;       6.  ideapad-laptop-tb2024g6plus-dkms -- DEP_RESOLUTION_FAILED
;;;       7.  ghostty-git-zen3 -- DEP_RESOLUTION_FAILED
;;;       8.  gephi-git -- DEP_RESOLUTION_FAILED
;;;       9.  bililive-recorder -- DEP_RESOLUTION_FAILED
;;;      10.  logstash -- DEP_RESOLUTION_FAILED
;;;      11.  mailspring -- DEP_RESOLUTION_FAILED
;;;      12.  veloren -- DEP_RESOLUTION_FAILED
;;;      13.  findbrokenpkgs -- TOOLING_FAILURE
;;;      14.  phonon-qt4-vlc -- DEP_RESOLUTION_FAILED
;;;      15.  thunderbird-beta -- DEP_RESOLUTION_FAILED
;;;      16.  ideapad-laptop-tb-dkms -- DEP_RESOLUTION_FAILED
;;;      17.  emmet-language-server -- DEP_RESOLUTION_FAILED
;;;      18.  ultrastardx-git -- DEP_RESOLUTION_FAILED
;;;      19.  lobe-chat -- DEP_RESOLUTION_FAILED
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260425f)
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
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
            aviator-git
            solidigm-sst-storage-tool-cli
            papis
            glyph
            protonutils
            kosherlinux-git
            flowkeeper-bin
            slic3r
            tilde
            pluma-plugins
            lokinet-bin
            hunspell-eo
            dpp
            gbar-git
            qcm
            autofdo-git
            waylogout-git
            q-zandronum
            labwc-im-git
            labwc-im
            jfetch-git
            zano-appimage
            xprinter-cups
            xelfviewer-bin
            veesem-git
            uivonim-bin
            systune-git
            supercell-wx-appimage
            pytubepp-helper
            pororoca-bin
            play-emu
            nostr-relay-tray-bin
            mdq
            librewolf-noscript
            librewolf-extension-reverse-image-search
            librewolf-extension-foxyproxy
            librewolf-decentraleyes
            kjots
            kidex
            kde-fcstd-thumbnailer-git
            intel-ivsc-firmware
            epubmerge
            display-switch
            aya-bin
            gnome-shell-extension-custom-hot-corners
            gnome-shell-extension-custom-hot-corners-extended
            python-pycdlib-git
            vscode-js-debug-bin
            picom-pijulius-next-git
            jerry-cli-git
            jerry-cli
            hangar-bin
            gum-git
            emv-utils-git
            clocking-in
            radeon-profile-git
            citra-appimage
            librealsense
            protonvpn-cli-community-git
            libaudclient
            python-wat-git
            youtube-dl-gui-bin
            xdg-desktop-portal-phosh-git
            python-dt-schema
            cloak-obfuscation
            dssd
            unrpa
            intel-npu-driver-bin
            wit-git
            ffcast
            handlr
            bat-asus-battery
            python-mashumaro
            ascii-rain-git
            vivify-bin
            victoriametrics-agent
            longoverdue
            python-mov-cli-files
            radeon-profile-daemon-git
            i3lock-fancy-rapid-git
            thunar-extended
            ))

;;; Nonfree/proprietary packages use (license #f) per repo convention.

;;; ===================================================================
;;; 1. aviator-git
;;; ===================================================================
;;; Source: https://github.com/gianni-rosato/aviator
;;; Easy-to-use GUI for encoding with SVT-AV1/libopus

(define-public aviator-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "aviator-git")
      (version (git-version "r210.d62aae3" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/gianni-rosato/aviator")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/gianni-rosato/aviator")
      (synopsis "easy-to-use GUI for encoding with SVT-AV1/libopus")
      (description "Easy-to-use GUI for encoding with SVT-AV1/libopus.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 2. solidigm-sst-storage-tool-cli
;;; ===================================================================
;;; Source: https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html
;;; Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size chang

(define-public solidigm-sst-storage-tool-cli
  (package
    (name "solidigm-sst-storage-tool-cli")
    (version "2.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.solidigm.com/content/solidigm/us/en/support-page/drivers-downloads/ka-00085.html")
    (synopsis "solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size ...")
    (description "Solidigm Storage Tool (SST) supports firmware upgrades and 4Kn sector size changes for Intel and Solidigm PCIe/NVMe/SATA NAND SSDs.")
    (license #f)))

;;; ===================================================================
;;; 3. papis
;;; ===================================================================
;;; Source: https://github.com/papis/papis
;;; Command-line document and bibliography manager

(define-public papis
  (package
    (name "papis")
    (version "0.15.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "p/papis/papis-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/papis/papis")
    (synopsis "command-line document and bibliography manager")
    (description "Command-line document and bibliography manager.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 4. glyph
;;; ===================================================================
;;; Source: https://github.com/seatedro/glyph
;;; Convert images/video to ASCII art (formerly asciigen)

(define-public glyph
  (package
    (name "glyph")
    (version "1.0.11")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seatedro/glyph")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/seatedro/glyph")
      (synopsis "convert images/video to ASCII art (formerly asciigen)")
      (description "Convert images/video to ASCII art (formerly asciigen).")
      (license license:expat))
)

;;; ===================================================================
;;; 5. protonutils
;;; ===================================================================
;;; Source: https://github.com/nning/protonutils
;;; CLI tool that provides different utilities to make using the Proton compatibilit

(define-public protonutils
  (package
    (name "protonutils")
    (version "1.6.7")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nning/protonutils")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nning/protonutils")
      (synopsis "CLI tool that provides different utilities to make using the Proton compati...")
      (description "CLI tool that provides different utilities to make using the Proton compatibility tool more easily.")
      (license license:expat))
)

;;; ===================================================================
;;; 6. kosherlinux-git
;;; ===================================================================
;;; Source: https://github.com/s1522711/Kosher-Linux
;;; this small thing automatically turns off your computer if you try to turn it on 

(define-public kosherlinux-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "kosherlinux-git")
      (version (git-version "1.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/s1522711/Kosher-Linux")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/s1522711/Kosher-Linux")
      (synopsis "this small thing automatically turns off your computer if you try to turn i...")
      (description "this small thing automatically turns off your computer if you try to turn it on during Shabbat.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 7. flowkeeper-bin
;;; ===================================================================
;;; Source: https://flowkeeper.org/
;;; Independent Pomodoro Technique desktop timer for power users (pre-compiled versi

(define-public flowkeeper-bin
  (package
    (name "flowkeeper-bin")
    (version "0.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://flowkeeper.org/releases/download/v"
                    version "/flowkeeper-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flowkeeper"))))
    (home-page "https://flowkeeper.org/")
    (synopsis "Independent Pomodoro Technique desktop timer for power users (pre-compiled ...")
    (description "Independent Pomodoro Technique desktop timer for power users (pre-compiled version).")
    (license license:gpl3)))

;;; ===================================================================
;;; 8. slic3r
;;; ===================================================================
;;; Source: http://slic3r.org/
;;; Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a mode

(define-public slic3r
  (package
    (name "slic3r")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://slic3r.org/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://slic3r.org/")
    (synopsis "slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a...")
    (description "Slic3r is an STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 9. tilde
;;; ===================================================================
;;; Source: http://os.ghalkes.nl/tilde.html
;;; An intuitive text editor for the terminal.

(define-public tilde
  (package
    (name "tilde")
    (version "1.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://os.ghalkes.nl/tilde.html/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://os.ghalkes.nl/tilde.html")
    (synopsis "An intuitive text editor for the terminal")
    (description "An intuitive text editor for the terminal.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 10. pluma-plugins
;;; ===================================================================
;;; Source: https://github.com/mate-desktop/pluma-plugins
;;; A set of plugins for Pluma

(define-public pluma-plugins
  (package
    (name "pluma-plugins")
    (version "1.28.0")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mate-desktop/pluma-plugins")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/mate-desktop/pluma-plugins")
      (synopsis "A set of plugins for Pluma")
      (description "A set of plugins for Pluma.")
      (license license:gpl2+))
)

;;; ===================================================================
;;; 11. lokinet-bin
;;; ===================================================================
;;; Source: https://github.com/oxen-io/lokinet
;;; Anonymous, decentralized and IP based overlay network for the internet. [LOKI, O

(define-public lokinet-bin
  (package
    (name "lokinet-bin")
    (version "0.9.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oxen-io/lokinet/releases/download/v"
                    version "/lokinet-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lokinet"))))
    (home-page "https://github.com/oxen-io/lokinet")
    (synopsis "Anonymous, decentralized and IP based overlay network for the internet. [LO...")
    (description "Anonymous, decentralized and IP based overlay network for the internet. [LOKI, OXEN].")
    (license license:gpl3)))

;;; ===================================================================
;;; 12. hunspell-eo
;;; ===================================================================
;;; Source: http://www.esperantilo.org/
;;; Esperanto hunspell dictionary

(define-public hunspell-eo
  (package
    (name "hunspell-eo")
    (version "20100216")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.esperantilo.org/releases/download/v"
                    version "/hunspell-eo-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hunspell-eo"))))
    (home-page "http://www.esperantilo.org/")
    (synopsis "esperanto hunspell dictionary")
    (description "Esperanto hunspell dictionary.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 13. dpp
;;; ===================================================================
;;; Source: https://dpp.dev/
;;; Lightweight and Scalable C++ Discord API Bot Library

(define-public dpp
  (package
    (name "dpp")
    (version "10.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dpp.dev/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://dpp.dev/")
    (synopsis "lightweight and Scalable C++ Discord API Bot Library")
    (description "Lightweight and Scalable C++ Discord API Bot Library.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 14. gbar-git
;;; ===================================================================
;;; Source: https://github.com/scorpion-26/gBar
;;; Blazingly fast status bar written with GTK

(define-public gbar-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "gbar-git")
      (version (git-version "r255.81b97f9" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/scorpion-26/gBar")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/scorpion-26/gBar")
      (synopsis "blazingly fast status bar written with GTK")
      (description "Blazingly fast status bar written with GTK.")
      (license license:expat))))

;;; ===================================================================
;;; 15. qcm
;;; ===================================================================
;;; Source: https://github.com/hypengw/Qcm
;;; Qt client for netease cloud music

(define-public qcm
  (package
    (name "qcm")
    (version "1.3.4")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hypengw/Qcm")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/hypengw/Qcm")
      (synopsis "Qt client for netease cloud music")
      (description "Qt client for netease cloud music.")
      (license license:gpl2+))
)

;;; ===================================================================
;;; 16. autofdo-git
;;; ===================================================================
;;; Source: https://github.com/google/autofdo
;;; a tool to convert perf.data profile to AutoFDO profile that can be used by GCC a

(define-public autofdo-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "autofdo-git")
      (version (git-version "0.1.r202.gd2313ec" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/google/autofdo")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/google/autofdo")
      (synopsis "a tool to convert perf.data profile to AutoFDO profile that can be used by ...")
      (description "a tool to convert perf.data profile to AutoFDO profile that can be used by GCC and LLVM.")
      (license license:asl2.0))))

;;; ===================================================================
;;; 17. waylogout-git
;;; ===================================================================
;;; Source: https://github.com/loserMcloser/waylogout
;;; A lock/logout/suspend/reboot/poweroff dialog for Wayland.

(define-public waylogout-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "waylogout-git")
      (version (git-version "r31.8470e0a" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/loserMcloser/waylogout")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/loserMcloser/waylogout")
      (synopsis "A lock/logout/suspend/reboot/poweroff dialog for Wayland")
      (description "A lock/logout/suspend/reboot/poweroff dialog for Wayland.")
      (license license:expat))))

;;; ===================================================================
;;; 18. q-zandronum
;;; ===================================================================
;;; Source: http://qzandronum.com/
;;; Zandronum 3.0 fork with improved netcode and Quake movement

(define-public q-zandronum
  (package
    (name "q-zandronum")
    (version "1.4.20")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://qzandronum.com/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://qzandronum.com/")
    (synopsis "zandronum 3.0 fork with improved netcode and Quake movement")
    (description "Zandronum 3.0 fork with improved netcode and Quake movement.")
    (license #f)))

;;; ===================================================================
;;; 19. labwc-im-git
;;; ===================================================================
;;; Source: https://github.com/labwc/labwc
;;; stacking wayland compositor with look and feel from openbox (git version with mi

(define-public labwc-im-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "labwc-im-git")
      (version (git-version "0.9.5.r67.gc9b4da2c" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/labwc/labwc")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/labwc/labwc")
      (synopsis "stacking wayland compositor with look and feel from openbox (git version wi...")
      (description "stacking wayland compositor with look and feel from openbox (git version with minimal text-input-v1 support).")
      (license license:gpl2+))))

;;; ===================================================================
;;; 20. labwc-im
;;; ===================================================================
;;; Source: https://github.com/labwc/labwc
;;; stacking wayland compositor with look and feel from openbox (with text-input-v1 

(define-public labwc-im
  (package
    (name "labwc-im")
    (version "0.9.6")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/labwc/labwc")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/labwc/labwc")
      (synopsis "stacking wayland compositor with look and feel from openbox (with text-inpu...")
      (description "stacking wayland compositor with look and feel from openbox (with text-input-v1 support).")
      (license license:gpl2+))
)

;;; ===================================================================
;;; 21. jfetch-git
;;; ===================================================================
;;; Source: https://github.com/Jimmysit0/jfetch
;;; A minimal Linux fetch script

(define-public jfetch-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "jfetch-git")
      (version (git-version "r106.4f45e49" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Jimmysit0/jfetch")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/Jimmysit0/jfetch")
      (synopsis "A minimal Linux fetch script")
      (description "A minimal Linux fetch script.")
      (license license:expat))))

;;; ===================================================================
;;; 22. zano-appimage
;;; ===================================================================
;;; Source: https://zano.org/
;;; Zano desktop wallet

(define-public zano-appimage
  (package
    (name "zano-appimage")
    (version "2.1.10.433")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://zano.org/releases/download/v"
                    version "/zano-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zano"))))
    (home-page "https://zano.org/")
    (synopsis "zano desktop wallet")
    (description "Zano desktop wallet.")
    (license #f)))

;;; ===================================================================
;;; 23. xprinter-cups
;;; ===================================================================
;;; Source: https://www.xprintertech.com/drivers-2
;;; Xprinter Drivers for Linux (ESC/POS and TSPL)

(define-public xprinter-cups
  (package
    (name "xprinter-cups")
    (version "3.13.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.xprintertech.com/drivers-2/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.xprintertech.com/drivers-2")
    (synopsis "Xprinter Drivers for Linux (ESC/POS and TSPL)")
    (description "Xprinter Drivers for Linux (ESC/POS and TSPL).")
    (license #f)))

;;; ===================================================================
;;; 24. xelfviewer-bin
;;; ===================================================================
;;; Source: https://github.com/horsicq/XELFViewer
;;; ELF file viewer/editor.

(define-public xelfviewer-bin
  (package
    (name "xelfviewer-bin")
    (version "0.05")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/horsicq/XELFViewer/releases/download/v"
                    version "/xelfviewer-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/xelfviewer"))))
    (home-page "https://github.com/horsicq/XELFViewer")
    (synopsis "ELF file viewer/editor")
    (description "ELF file viewer/editor.")
    (license license:expat)))

;;; ===================================================================
;;; 25. veesem-git
;;; ===================================================================
;;; Source: https://github.com/sp1187/veesem/
;;; V.Smile emulator

(define-public veesem-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "veesem-git")
      (version (git-version "r20.d25c8fb" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sp1187/veesem")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sp1187/veesem/")
      (synopsis "V.Smile emulator")
      (description "V.Smile emulator.")
      (license license:isc))))

;;; ===================================================================
;;; 26. uivonim-bin
;;; ===================================================================
;;; Source: https://github.com/smolck/uivonim
;;; Fork of the Veonim Neovim GUI.(Prebuilt version.Use system-wide electron)

(define-public uivonim-bin
  (package
    (name "uivonim-bin")
    (version "0.29.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/smolck/uivonim/releases/download/v"
                    version "/uivonim-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/uivonim"))))
    (home-page "https://github.com/smolck/uivonim")
    (synopsis "fork of the Veonim Neovim GUI.(Prebuilt version.Use system-wide electron)")
    (description "Fork of the Veonim Neovim GUI.(Prebuilt version.Use system-wide electron).")
    (license license:agpl3+)))

;;; ===================================================================
;;; 27. systune-git
;;; ===================================================================
;;; Source: https://github.com/fulgurcode/systune
;;; A lightweight and efficient GTK-based system settings manager

(define-public systune-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "systune-git")
      (version (git-version "r48.58d6da0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/fulgurcode/systune")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/fulgurcode/systune")
      (synopsis "A lightweight and efficient GTK-based system settings manager")
      (description "A lightweight and efficient GTK-based system settings manager.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 28. supercell-wx-appimage
;;; ===================================================================
;;; Source: https://supercellwx.net/
;;; A NEXRAD Level 2 and Level 3 radar viewing application

(define-public supercell-wx-appimage
  (package
    (name "supercell-wx-appimage")
    (version "0.5.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://supercellwx.net/releases/download/v"
                    version "/supercell-wx-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/supercell-wx"))))
    (home-page "https://supercellwx.net/")
    (synopsis "A NEXRAD Level 2 and Level 3 radar viewing application")
    (description "A NEXRAD Level 2 and Level 3 radar viewing application.")
    (license #f)))

;;; ===================================================================
;;; 29. pytubepp-helper
;;; ===================================================================
;;; Source: https://github.com/neosubhamoy/pytubepp-helper
;;; A Helper App for PytubePP Extension/Addon to Communicate with Pytube Post Proces

(define-public pytubepp-helper
  (package
    (name "pytubepp-helper")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "p/pytubepp-helper/pytubepp-helper-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/neosubhamoy/pytubepp-helper")
    (synopsis "A Helper App for PytubePP Extension/Addon to Communicate with Pytube Post P...")
    (description "A Helper App for PytubePP Extension/Addon to Communicate with Pytube Post Processor CLI.")
    (license license:expat)))

;;; ===================================================================
;;; 30. pororoca-bin
;;; ===================================================================
;;; Source: https://pororoca.io/
;;; Pororoca is a HTTP testing tool, inspired by Postman, but with many improvements

(define-public pororoca-bin
  (package
    (name "pororoca-bin")
    (version "3.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://pororoca.io/releases/download/v"
                    version "/pororoca-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pororoca"))))
    (home-page "https://pororoca.io/")
    (synopsis "pororoca is a HTTP testing tool, inspired by Postman, but with many improve...")
    (description "Pororoca is a HTTP testing tool, inspired by Postman, but with many improvements.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 31. play-emu
;;; ===================================================================
;;; Source: https://purei.org/
;;; Play! is an experimental Playstation 2 emulator.

(define-public play-emu
  (package
    (name "play-emu")
    (version "0.69")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://purei.org/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://purei.org/")
    (synopsis "play! is an experimental Playstation 2 emulator")
    (description "Play! is an experimental Playstation 2 emulator.")
    (license license:expat)))

;;; ===================================================================
;;; 32. nostr-relay-tray-bin
;;; ===================================================================
;;; Source: https://github.com/CodyTseng/nostr-relay-tray
;;; A simple nostr relay tray.(Prebuilt version.Use system-wide electron)

(define-public nostr-relay-tray-bin
  (package
    (name "nostr-relay-tray-bin")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CodyTseng/nostr-relay-tray/releases/download/v"
                    version "/nostr-relay-tray-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nostr-relay-tray"))))
    (home-page "https://github.com/CodyTseng/nostr-relay-tray")
    (synopsis "A simple nostr relay tray.(Prebuilt version.Use system-wide electron)")
    (description "A simple nostr relay tray.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))

;;; ===================================================================
;;; 33. mdq
;;; ===================================================================
;;; Source: https://github.com/yshavit/mdq
;;; like jq but for Markdown: find specific elements in a md doc

(define-public mdq
  (package
    (name "mdq")
    (version "0.10.0")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yshavit/mdq")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/yshavit/mdq")
      (synopsis "like jq but for Markdown: find specific elements in a md doc")
      (description "like jq but for Markdown: find specific elements in a md doc.")
      (license (list license:asl2.0 license:expat)))
)

;;; ===================================================================
;;; 34. librewolf-noscript
;;; ===================================================================
;;; Source: https://noscript.net/
;;; Extension for librewolf which disables javascript

(define-public librewolf-noscript
  (package
    (name "librewolf-noscript")
    (version "13.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://noscript.net/releases/download/v"
                    version "/librewolf-noscript-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-noscript"))))
    (home-page "https://noscript.net/")
    (synopsis "extension for librewolf which disables javascript")
    (description "Extension for librewolf which disables javascript.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 35. librewolf-extension-reverse-image-search
;;; ===================================================================
;;; Source: https://github.com/Brawl345/Image-Reverse-Search-WebExtension
;;; Context menu to search with an image on various services, such as Google, Bing, 

(define-public librewolf-extension-reverse-image-search
  (package
    (name "librewolf-extension-reverse-image-search")
    (version "4.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Brawl345/Image-Reverse-Search-WebExtension/releases/download/v"
                    version "/librewolf-extension-reverse-image-search-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-extension-reverse-image-search"))))
    (home-page "https://github.com/Brawl345/Image-Reverse-Search-WebExtension")
    (synopsis "context menu to search with an image on various services, such as Google, B...")
    (description "Context menu to search with an image on various services, such as Google, Bing, Yandex, TinEye, SauceNAO and IQDB.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 36. librewolf-extension-foxyproxy
;;; ===================================================================
;;; Source: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
;;; FoxyProxy is an advanced proxy management tool that completely replaces LibreWol

(define-public librewolf-extension-foxyproxy
  (package
    (name "librewolf-extension-foxyproxy")
    (version "9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/releases/download/v"
                    version "/librewolf-extension-foxyproxy-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-extension-foxyproxy"))))
    (home-page "https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/")
    (synopsis "foxyProxy is an advanced proxy management tool that completely replaces Lib...")
    (description "FoxyProxy is an advanced proxy management tool that completely replaces LibreWolf's limited proxying capabilities.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 37. librewolf-decentraleyes
;;; ===================================================================
;;; Source: https://decentraleyes.org/
;;; Local emulation of Content Delivery Networks

(define-public librewolf-decentraleyes
  (package
    (name "librewolf-decentraleyes")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://decentraleyes.org/releases/download/v"
                    version "/librewolf-decentraleyes-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-decentraleyes"))))
    (home-page "https://decentraleyes.org/")
    (synopsis "local emulation of Content Delivery Networks")
    (description "Local emulation of Content Delivery Networks.")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 38. kjots
;;; ===================================================================
;;; Source: https://www.kde.org/applications/utilities/kjots/
;;; A note taking application using Akonadi

(define-public kjots
  (package
    (name "kjots")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.kde.org/applications/utilities/kjots/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://www.kde.org/applications/utilities/kjots/")
    (synopsis "A note taking application using Akonadi")
    (description "A note taking application using Akonadi.")
    (license (list license:gpl2+ license:lgpl2.0+))))

;;; ===================================================================
;;; 39. kidex
;;; ===================================================================
;;; Source: github.com/Kirottu/kidex
;;; A simple file indexing service

(define-public kidex
  (package
    (name "kidex")
    (version "0.1.1")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "github.com/Kirottu/kidex")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "github.com/Kirottu/kidex")
      (synopsis "A simple file indexing service")
      (description "A simple file indexing service.")
      (license license:gpl3+))
)

;;; ===================================================================
;;; 40. kde-fcstd-thumbnailer-git
;;; ===================================================================
;;; Source: https://github.com/StefanHamminga/kde-fcstd-thumbnailer
;;; FreeCAD Thumbnail Creator.

(define-public kde-fcstd-thumbnailer-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "kde-fcstd-thumbnailer-git")
      (version (git-version "2.0.0" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/StefanHamminga/kde-fcstd-thumbnailer")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/StefanHamminga/kde-fcstd-thumbnailer")
      (synopsis "freeCAD Thumbnail Creator")
      (description "FreeCAD Thumbnail Creator.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 41. intel-ivsc-firmware
;;; ===================================================================
;;; Source: https://github.com/intel/ivsc-firmware
;;; Intel Vision Sensing Controller firmware

(define-public intel-ivsc-firmware
  (package
    (name "intel-ivsc-firmware")
    (version "r2.764bd6e")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/ivsc-firmware/releases/download/v"
                    version "/intel-ivsc-firmware-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/intel-ivsc-firmware"))))
    (home-page "https://github.com/intel/ivsc-firmware")
    (synopsis "Intel Vision Sensing Controller firmware")
    (description "Intel Vision Sensing Controller firmware.")
    (license #f)))

;;; ===================================================================
;;; 42. epubmerge
;;; ===================================================================
;;; Source: https://github.com/JimmXinu/EpubMerge
;;; A tool for merging multiple epub files into one.

(define-public epubmerge
  (package
    (name "epubmerge")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "e/epubmerge/epubmerge-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/JimmXinu/EpubMerge")
    (synopsis "A tool for merging multiple epub files into one")
    (description "A tool for merging multiple epub files into one.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 43. display-switch
;;; ===================================================================
;;; Source: https://github.com/haimgel/display-switch
;;; Turn a $30 USB switch into a full-featured multi-monitor KVM switch

(define-public display-switch
  (package
    (name "display-switch")
    (version "1.3.1")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/haimgel/display-switch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/haimgel/display-switch")
      (synopsis "turn a $30 USB switch into a full-featured multi-monitor KVM switch")
      (description "Turn a $30 USB switch into a full-featured multi-monitor KVM switch.")
      (license license:expat))
)

;;; ===================================================================
;;; 44. aya-bin
;;; ===================================================================
;;; Source: https://aya.liriliri.io
;;; A desktop application for easily controlling android devices, which can be consi

(define-public aya-bin
  (package
    (name "aya-bin")
    (version "1.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aya.liriliri.io/releases/download/v"
                    version "/aya-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aya"))))
    (home-page "https://aya.liriliri.io")
    (synopsis "A desktop application for easily controlling android devices, which can be ...")
    (description "A desktop application for easily controlling android devices, which can be considered as a GUI wrapper for ADB.(Prebuilt version.Use system-wide electron).")
    (license license:agpl3+)))

;;; ===================================================================
;;; 45. gnome-shell-extension-custom-hot-corners
;;; ===================================================================
;;; Source: https://github.com/janxyz/custom-hot-corners
;;; A GNOME Shell Extension for customizable hot corners

(define-public gnome-shell-extension-custom-hot-corners
  (package
    (name "gnome-shell-extension-custom-hot-corners")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/janxyz/custom-hot-corners/releases/download/v"
                    version "/gnome-shell-extension-custom-hot-corners-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell-extension-custom-hot-corners"))))
    (home-page "https://github.com/janxyz/custom-hot-corners")
    (synopsis "A GNOME Shell Extension for customizable hot corners")
    (description "A GNOME Shell Extension for customizable hot corners.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 46. gnome-shell-extension-custom-hot-corners-extended
;;; ===================================================================
;;; Source: https://github.com/G-dH/custom-hot-corners-extended
;;; A GNOME Shell Extension that allows you to use corners and edges as triggers for

(define-public gnome-shell-extension-custom-hot-corners-extended
  (package
    (name "gnome-shell-extension-custom-hot-corners-extended")
    (version "50")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/G-dH/custom-hot-corners-extended/releases/download/v"
                    version "/gnome-shell-extension-custom-hot-corners-extended-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell-extension-custom-hot-corners-extended"))))
    (home-page "https://github.com/G-dH/custom-hot-corners-extended")
    (synopsis "A GNOME Shell Extension that allows you to use corners and edges as trigger...")
    (description "A GNOME Shell Extension that allows you to use corners and edges as triggers for various actions.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 47. python-pycdlib-git
;;; ===================================================================
;;; Source: https://github.com/clalancette/pycdlib
;;; Python library to read and write ISOs

(define-public python-pycdlib-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "python-pycdlib-git")
      (version (git-version "1.15.0.0.g67fe5ea" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/clalancette/pycdlib")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/clalancette/pycdlib")
      (synopsis "python library to read and write ISOs")
      (description "Python library to read and write ISOs.")
      (license license:lgpl2.1+))))

;;; ===================================================================
;;; 48. vscode-js-debug-bin
;;; ===================================================================
;;; Source: https://github.com/microsoft/vscode-js-debug
;;; A DAP-compatible JavaScript debugger

(define-public vscode-js-debug-bin
  (package
    (name "vscode-js-debug-bin")
    (version "1.102.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/microsoft/vscode-js-debug/releases/download/v"
                    version "/vscode-js-debug-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vscode-js-debug"))))
    (home-page "https://github.com/microsoft/vscode-js-debug")
    (synopsis "A DAP-compatible JavaScript debugger")
    (description "A DAP-compatible JavaScript debugger.")
    (license license:expat)))

;;; ===================================================================
;;; 49. picom-pijulius-next-git
;;; ===================================================================
;;; Source: https://github.com/pijulius/picom
;;; X compositor (fork of yshui-picom) (git-version), enhanced animiation fork

(define-public picom-pijulius-next-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "picom-pijulius-next-git")
      (version (git-version "2530_11.513.g7094d7a9_2024.07.31" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pijulius/picom")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/pijulius/picom")
      (synopsis "X compositor (fork of yshui-picom) (git-version), enhanced animiation fork")
      (description "X compositor (fork of yshui-picom) (git-version), enhanced animiation fork.")
      (license (list license:expat license:mpl2.0)))))

;;; ===================================================================
;;; 50. jerry-cli-git
;;; ===================================================================
;;; Source: https://github.com/justchokingaround/jerry
;;; watch anime with automatic anilist syncing and other cool stuff

(define-public jerry-cli-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "jerry-cli-git")
      (version (git-version "r150.e8d1598" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justchokingaround/jerry")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/justchokingaround/jerry")
      (synopsis "watch anime with automatic anilist syncing and other cool stuff")
      (description "watch anime with automatic anilist syncing and other cool stuff.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 51. jerry-cli
;;; ===================================================================
;;; Source: https://github.com/justchokingaround/jerry
;;; watch anime with automatic anilist syncing and other cool stuff

(define-public jerry-cli
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "jerry-cli")
      (version (git-version "1.9.9" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/justchokingaround/jerry")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/jerry-cli"))))
      (home-page "https://github.com/justchokingaround/jerry")
      (synopsis "watch anime with automatic anilist syncing and other cool stuff")
      (description "watch anime with automatic anilist syncing and other cool stuff.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 52. hangar-bin
;;; ===================================================================
;;; Source: https://github.com/cnrancher/hangar
;;; Command line utility for container images

(define-public hangar-bin
  (package
    (name "hangar-bin")
    (version "1.9.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cnrancher/hangar/releases/download/v"
                    version "/hangar-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hangar"))))
    (home-page "https://github.com/cnrancher/hangar")
    (synopsis "command line utility for container images")
    (description "Command line utility for container images.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 53. gum-git
;;; ===================================================================
;;; Source: https://github.com/charmbracelet/gum
;;; A tool for glamorous shell scripts

(define-public gum-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "gum-git")
      (version (git-version "0.2.0.r8.g378a000" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/charmbracelet/gum")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/charmbracelet/gum")
      (synopsis "A tool for glamorous shell scripts")
      (description "A tool for glamorous shell scripts.")
      (license license:expat))))

;;; ===================================================================
;;; 54. emv-utils-git
;;; ===================================================================
;;; Source: https://github.com/openemv/emv-utils
;;; Libraries and tools for EMV card data

(define-public emv-utils-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "emv-utils-git")
      (version (git-version "0.3.1.r7.g130911d" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/openemv/emv-utils")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/openemv/emv-utils")
      (synopsis "libraries and tools for EMV card data")
      (description "Libraries and tools for EMV card data.")
      (license license:lgpl2.1))))

;;; ===================================================================
;;; 55. clocking-in
;;; ===================================================================
;;; Source: https://github.com/sneedragon/jam-game
;;; Fast-paced Puzzle-Clicker Game about disarming a timebomb.

(define-public clocking-in
  (package
    (name "clocking-in")
    (version "0.0.4")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/sneedragon/jam-game")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sneedragon/jam-game")
      (synopsis "fast-paced Puzzle-Clicker Game about disarming a timebomb")
      (description "Fast-paced Puzzle-Clicker Game about disarming a timebomb.")
      (license #f))
)

;;; ===================================================================
;;; 56. radeon-profile-git
;;; ===================================================================
;;; Source: http://github.com/emerge-e-world/radeon-profile
;;; App for display info about radeon card

(define-public radeon-profile-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "radeon-profile-git")
      (version (git-version "20200824.r22.g295d189" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/emerge-e-world/radeon-profile")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "http://github.com/emerge-e-world/radeon-profile")
      (synopsis "App for display info about radeon card")
      (description "App for display info about radeon card.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 57. citra-appimage
;;; ===================================================================
;;; Source: https://citra-emu.org
;;; An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already

(define-public citra-appimage
  (package
    (name "citra-appimage")
    (version "20240927")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://citra-emu.org/releases/download/v"
                    version "/citra-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/citra"))))
    (home-page "https://citra-emu.org")
    (synopsis "An experimental open-source Nintendo 3DS emulator/debugger, GUI version, al...")
    (description "An experimental open-source Nintendo 3DS emulator/debugger, GUI version, already compiled.")
    (license license:gpl2+)))

;;; ===================================================================
;;; 58. librealsense
;;; ===================================================================
;;; Source: https://github.com/IntelRealSense/librealsense
;;; Intel(R) RealSense(TM) SDK 2.0 is a cross-platform library for Intel(R) RealSense(TM) dept

(define-public librealsense
  (package
    (name "librealsense")
    (version "2.56.5")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/IntelRealSense/librealsense")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/IntelRealSense/librealsense")
      (synopsis "Intel(R) RealSense(TM) SDK 2.0 is a cross-platform library for Intel(R) RealSense(TM)...")
      (description "Intel(R) RealSense(TM) SDK 2.0 is a cross-platform library for Intel(R) RealSense(TM) depth cameras (D400 & L500 series and the SR300).")
      (license license:asl2.0))
)

;;; ===================================================================
;;; 59. protonvpn-cli-community-git
;;; ===================================================================
;;; Source: https://github.com/ProtonVPN/linux-cli-community
;;; A Community Linux CLI for ProtonVPN

(define-public protonvpn-cli-community-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "protonvpn-cli-community-git")
      (version (git-version "2.2.10.r3.g3614101" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ProtonVPN/linux-cli-community")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/ProtonVPN/linux-cli-community")
      (synopsis "A Community Linux CLI for ProtonVPN")
      (description "A Community Linux CLI for ProtonVPN.")
      (license license:gpl3+))))

;;; ===================================================================
;;; 60. libaudclient
;;; ===================================================================
;;; Source: https://audacious-media-player.org
;;; Legacy D-Bus client library for Audacious

(define-public libaudclient
  (package
    (name "libaudclient")
    (version "3.5rc2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://audacious-media-player.org/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://audacious-media-player.org")
    (synopsis "legacy D-Bus client library for Audacious")
    (description "Legacy D-Bus client library for Audacious.")
    (license license:bsd-2)))

;;; ===================================================================
;;; 61. python-wat-git
;;; ===================================================================
;;; Source: https://github.com/igrek51/wat
;;; WAT Inspector: Deep inspection of Python objects (latest commit)

(define-public python-wat-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "python-wat-git")
      (version (git-version "0.5.1.r5.g8ef5c93" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/igrek51/wat")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/igrek51/wat")
      (synopsis "WAT Inspector: Deep inspection of Python objects (latest commit)")
      (description "WAT Inspector: Deep inspection of Python objects (latest commit).")
      (license license:expat))))

;;; ===================================================================
;;; 62. youtube-dl-gui-bin
;;; ===================================================================
;;; Source: https://github.com/StefanLobbenmeier/youtube-dl-gui
;;; A cross-platform GUI for youtube-dl made in Electron and node.js (binary release

(define-public youtube-dl-gui-bin
  (package
    (name "youtube-dl-gui-bin")
    (version "2.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/StefanLobbenmeier/youtube-dl-gui/releases/download/v"
                    version "/youtube-dl-gui-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/youtube-dl-gui"))))
    (home-page "https://github.com/StefanLobbenmeier/youtube-dl-gui")
    (synopsis "A cross-platform GUI for youtube-dl made in Electron and node.js (binary re...")
    (description "A cross-platform GUI for youtube-dl made in Electron and node.js (binary release, system Electron).")
    (license license:agpl3+)))

;;; ===================================================================
;;; 63. xdg-desktop-portal-phosh-git
;;; ===================================================================
;;; Source: https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh
;;; xdg-desktop-portal implementation using GTK/GNOME/Phosh

(define-public xdg-desktop-portal-phosh-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "xdg-desktop-portal-phosh-git")
      (version (git-version "0.44.0.r0.g541ad66" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system meson-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh")
      (synopsis "xdg-desktop-portal implementation using GTK/GNOME/Phosh")
      (description "xdg-desktop-portal implementation using GTK/GNOME/Phosh.")
      (license license:gpl3+))
))

;;; ===================================================================
;;; 64. python-dt-schema
;;; ===================================================================
;;; Source: https://github.com/devicetree-org/dt-schema
;;; Tooling for devicetree validation using YAML and jsonschema

(define-public python-dt-schema
  (package
    (name "python-dt-schema")
    (version "2025.06.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "d/dt-schema/dt-schema-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/devicetree-org/dt-schema")
    (synopsis "tooling for devicetree validation using YAML and jsonschema")
    (description "Tooling for devicetree validation using YAML and jsonschema.")
    (license license:bsd-3)))

;;; ===================================================================
;;; 65. cloak-obfuscation
;;; ===================================================================
;;; Source: https://github.com/cbeuw/Cloak
;;; A pluggable transport that works alongside traditional proxy tools like OpenVPN 

(define-public cloak-obfuscation
  (package
    (name "cloak-obfuscation")
    (version "2.10.0")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/cbeuw/Cloak")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/cbeuw/Cloak")
      (synopsis "A pluggable transport that works alongside traditional proxy tools like Ope...")
      (description "A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship.")
      (license license:gpl3+))
)

;;; ===================================================================
;;; 66. dssd
;;; ===================================================================
;;; Source: https://github.com/ylxdzsw/dssd
;;; Dead simple freedesktop SecretService implementation

(define-public dssd
  (package
    (name "dssd")
    (version "0.3.3")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ylxdzsw/dssd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/ylxdzsw/dssd")
      (synopsis "dead simple freedesktop SecretService implementation")
      (description "Dead simple freedesktop SecretService implementation.")
      (license license:expat))
)

;;; ===================================================================
;;; 67. unrpa
;;; ===================================================================
;;; Source: https://github.com/Lattyware/unrpa
;;; Extract files from the RPA archive format (from Ren'Py visual novels).

(define-public unrpa
  (package
    (name "unrpa")
    (version "2.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "u/unrpa/unrpa-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Lattyware/unrpa")
    (synopsis "extract files from the RPA archive format (from Ren'Py visual novels)")
    (description "Extract files from the RPA archive format (from Ren'Py visual novels).")
    (license license:gpl3+)))

;;; ===================================================================
;;; 68. intel-npu-driver-bin
;;; ===================================================================
;;; Source: https://github.com/intel/linux-npu-driver
;;; Intel(R) NPU (Neural Processing Unit) Driver

(define-public intel-npu-driver-bin
  (package
    (name "intel-npu-driver-bin")
    (version "1.30.0.20260311_22963593310")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/intel/linux-npu-driver/releases/download/v"
                    version "/intel-npu-driver-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/intel-npu-driver"))))
    (home-page "https://github.com/intel/linux-npu-driver")
    (synopsis "Intel(R) NPU (Neural Processing Unit) Driver")
    (description "Intel(R) NPU (Neural Processing Unit) Driver.")
    (license license:expat)))

;;; ===================================================================
;;; 69. wit-git
;;; ===================================================================
;;; Source: https://wit.wiimm.de
;;; Wiimms ISO Tools (git version)

(define-public wit-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "wit-git")
      (version (git-version "3.05a.r10.fc1c0b8" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://wit.wiimm.de")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://wit.wiimm.de")
      (synopsis "wiimms ISO Tools (git version)")
      (description "Wiimms ISO Tools (git version).")
      (license license:gpl2+))
))

;;; ===================================================================
;;; 70. ffcast
;;; ===================================================================
;;; Source: https://github.com/ropery/FFcast
;;; run command on rectangular screen regions, e.g. screenshot, screencast

(define-public ffcast
  (package
    (name "ffcast")
    (version "2.5.1")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ropery/FFcast")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/ropery/FFcast")
      (synopsis "run command on rectangular screen regions, e.g. screenshot, screencast")
      (description "run command on rectangular screen regions, e.g. screenshot, screencast.")
      (license license:gpl3+))
)

;;; ===================================================================
;;; 71. handlr
;;; ===================================================================
;;; Source: https://github.com/chmln/handlr
;;; Powerful alternative to xdg-utils written in Rust

(define-public handlr
  (package
    (name "handlr")
    (version "0.6.4")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/chmln/handlr")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/chmln/handlr")
      (synopsis "powerful alternative to xdg-utils written in Rust")
      (description "Powerful alternative to xdg-utils written in Rust.")
      (license license:expat))
)

;;; ===================================================================
;;; 72. bat-asus-battery
;;; ===================================================================
;;; Source: https://github.com/tshakalekholoane/bat
;;; Replicate the functionality of the ASUS Battery Health Charging on Windows which

(define-public bat-asus-battery
  (package
    (name "bat-asus-battery")
    (version "1.2")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tshakalekholoane/bat")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/tshakalekholoane/bat")
      (synopsis "replicate the functionality of the ASUS Battery Health Charging on Windows ...")
      (description "Replicate the functionality of the ASUS Battery Health Charging on Windows which aims prolong the battery's life-span.")
      (license license:expat))
)

;;; ===================================================================
;;; 73. python-mashumaro
;;; ===================================================================
;;; Source: https://github.com/Fatal1ty/mashumaro
;;; A fast and well tested serialization library on top of dataclasses.

(define-public python-mashumaro
  (package
    (name "python-mashumaro")
    (version "3.17")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "m/mashumaro/mashumaro-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Fatal1ty/mashumaro")
    (synopsis "A fast and well tested serialization library on top of dataclasses")
    (description "A fast and well tested serialization library on top of dataclasses.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 74. ascii-rain-git
;;; ===================================================================
;;; Source: https://github.com/nkleemann/ascii-rain
;;; Comfy rain for your console written in C with Ncurses.

(define-public ascii-rain-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "ascii-rain-git")
      (version (git-version "r4.72ad7b3" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nkleemann/ascii-rain")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/nkleemann/ascii-rain")
      (synopsis "comfy rain for your console written in C with Ncurses")
      (description "Comfy rain for your console written in C with Ncurses.")
      (license license:expat))))

;;; ===================================================================
;;; 75. vivify-bin
;;; ===================================================================
;;; Source: https://github.com/jannis-baum/vivify
;;; Markdown preview tool which can be used standalone or plug into an editor like (

(define-public vivify-bin
  (package
    (name "vivify-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jannis-baum/vivify/releases/download/v"
                    version "/vivify-" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vivify"))))
    (home-page "https://github.com/jannis-baum/vivify")
    (synopsis "markdown preview tool which can be used standalone or plug into an editor l...")
    (description "Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim.")
    (license license:gpl3+)))

;;; ===================================================================
;;; 76. victoriametrics-agent
;;; ===================================================================
;;; Source: https://victoriametrics.github.io
;;; Agent for Victoria Metrics, a fast, cost-effective and scalable time series data

(define-public victoriametrics-agent
  (package
    (name "victoriametrics-agent")
    (version "1.122.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://victoriametrics.github.io/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://victoriametrics.github.io")
    (synopsis "Agent for Victoria Metrics, a fast, cost-effective and scalable time series...")
    (description "Agent for Victoria Metrics, a fast, cost-effective and scalable time series database.")
    (license license:asl2.0)))

;;; ===================================================================
;;; 77. longoverdue
;;; ===================================================================
;;; Source: https://github.com/9ary/longoverdue
;;; System service update management made easy

(define-public longoverdue
  (package
    (name "longoverdue")
    (version "0.5.4")
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/9ary/longoverdue")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/9ary/longoverdue")
      (synopsis "system service update management made easy")
      (description "System service update management made easy.")
      (license license:expat))
)

;;; ===================================================================
;;; 78. python-mov-cli-files
;;; ===================================================================
;;; Source: https://github.com/mov-cli/mov-cli-files
;;; A mov-cli v4 plugin for watching files on your device.

(define-public python-mov-cli-files
  (package
    (name "python-mov-cli-files")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/source/"
                    "m/mov-cli-files/mov-cli-files-" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mov-cli/mov-cli-files")
    (synopsis "A mov-cli v4 plugin for watching files on your device")
    (description "A mov-cli v4 plugin for watching files on your device.")
    (license license:expat)))

;;; ===================================================================
;;; 79. radeon-profile-daemon-git
;;; ===================================================================
;;; Source: http://github.com/marazmista/radeon-profile-daemon
;;; System daemon for radeon-profile

(define-public radeon-profile-daemon-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "radeon-profile-daemon-git")
      (version (git-version "20190603.r0.g7923bd6" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "http://github.com/marazmista/radeon-profile-daemon")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "http://github.com/marazmista/radeon-profile-daemon")
      (synopsis "system daemon for radeon-profile")
      (description "System daemon for radeon-profile.")
      (license license:gpl2+))))

;;; ===================================================================
;;; 80. i3lock-fancy-rapid-git
;;; ===================================================================
;;; Source: https://github.com/yvbbrjdr/i3lock-fancy-rapid
;;; A faster implementation of i3lock-fancy

(define-public i3lock-fancy-rapid-git
  (let ((commit "HEAD")
        (revision "0"))
    (package
      (name "i3lock-fancy-rapid-git")
      (version (git-version "r19.6eeebd4" revision commit))
      (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/yvbbrjdr/i3lock-fancy-rapid")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
      (build-system gnu-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/yvbbrjdr/i3lock-fancy-rapid")
      (synopsis "A faster implementation of i3lock-fancy")
      (description "A faster implementation of i3lock-fancy.")
      (license license:bsd-3))))

;;; ===================================================================
;;; 81. thunar-extended
;;; ===================================================================
;;; Source: http://thunar.xfce.org
;;; Thunar with cursor audio preview and extra options for trash

(define-public thunar-extended
  (package
    (name "thunar-extended")
    (version "4.18.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://thunar.xfce.org/archive/v" version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "http://thunar.xfce.org")
    (synopsis "thunar with cursor audio preview and extra options for trash")
    (description "Thunar with cursor audio preview and extra options for trash.")
    (license (list license:gpl2+ license:lgpl2.1+))))
