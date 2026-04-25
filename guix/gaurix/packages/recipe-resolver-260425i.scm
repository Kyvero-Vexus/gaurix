;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425i: 99 packages attempted (99 recipes, 1 SOURCE_UNAVAILABLE)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (
   brother-dcp7057
   lemminx
   drand-http-relay
   android-sdk-build-tools-35
   cassandra
   scriptisto
   gwe
   flexget-webui
   macbook-12-1-linux-fixes
   alterware-launcher-git
   symbiyosys-git
   mkdocs-material-pymdownx-extras
   gtk3-classic-xfce
   android-studio-beta
   openscad-lsp
   protondb-cli
   qmp3gain-git
   nodejs-vls
   plasma6-wallpapers-blurredwallpaper
   bananaplus
   lib32-lzo
   python-rembg
   python3-colorsysplus
   ultrastardx-songs
   xorgxrdp-glamor
   cyberghostvpn
   smoothie-rs-linux-git
   apfsprogs-git
   gnome-shell-extension-rounded-window-corners-reborn
   icinga2
   vattery
   mikmod
   uxplay-git
   php-oci8
   notepad---git
   shader-slang-git
   rtl8812au-aircrack-ng-dkms-git
   lan-mouse-git
   sticky-notes
   go-ascii-tool-git
   vatsim-crc
   snx
   kicad-nightly
   mcskinedit
   xwinwrap-git
   muc-git
   gnome-kra-ora-thumbnailer-git
   cinelerra-gg
   zaman
   xborder-git
   matplotplusplus
   aget
   tetris
   polybar-now-playing-git
   libfprint-elanmoc2-working-git
   doxide
   vufind
   unshell
   snmalloc
   ruby-asciidoctor-diagram-batik
   qregedit-git
   python-safehttpx
   ptt-fix
   porymap
   popcornfx-editor
   petalinux
   newm-next-git
   nemo-webp-git
   mtp
   metamorphose2-python3-git
   memsed-git
   lb-planner-git
   keyring-cli
   k8s-ldap-auth
   hfd-git
   gosign
   fluidx3d
   debounce
   baibot-git
   asciiconv
   yetris
   nfancurve
   xontrib-vox-git
   woz2dsk
   tile-world2
   python-pydantic-graph
   python-groq
   passport
   krunner-watch-git
   hostsd
   cadius
   baibot
   gaiasky
   python-click-extra
   py-cidr
   meep-python
   browser-on-ram-git
   pamac-gtk3
   kri
   ))

;;; brother-dcp7057 — LPR and CUPS driver for the Brother DCP-7057 printer
(define-public brother-dcp7057
  (package
    (name "brother-dcp7057")
    (version "2.0.4_2")
    (source
     (origin
       (method url-fetch)
       (uri "https://support.brother.com/g/b/producttop.aspx?c=cn&lang=zh&prod=dcp7057_cn")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://support.brother.com/g/b/producttop.aspx?c=cn&lang=zh&prod=dcp7057_cn")
    (synopsis "LPR and CUPS driver for the Brother DCP-7057 printer")
    (description "LPR and CUPS driver for the Brother DCP-7057 printer.")
    (license #f)))

;;; lemminx — Eclipse XML language server
(define-public lemminx
  (package
    (name "lemminx")
    (version "0.31.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eclipse/lemminx/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("lemminx" "bin/lemminx"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eclipse/lemminx")
    (synopsis "eclipse XML language server")
    (description "Eclipse XML language server.")
    (license license:epl2.0)))

;;; drand-http-relay — An HTTP relay for drand nodes
(define-public drand-http-relay
  (package
    (name "drand-http-relay")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/drand/http-relay/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/drand/http-relay")
    (synopsis "an HTTP relay for drand nodes")
    (description "An HTTP relay for drand nodes.")
    (license #f)))

;;; android-sdk-build-tools-35 — Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-c
(define-public android-sdk-build-tools-35
  (package
    (name "android-sdk-build-tools-35")
    (version "r35")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.android.com/studio/releases/build-tools")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.android.com/studio/releases/build-tools")
    (synopsis "build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)")
    (description "Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc).")
    (license #f)))

;;; cassandra — Apache Cassandra NoSQL database
(define-public cassandra
  (package
    (name "cassandra")
    (version "5.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "http://cassandra.apache.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("cassandra" "bin/cassandra"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://cassandra.apache.org/")
    (synopsis "Apache Cassandra NoSQL database")
    (description "Apache Cassandra NoSQL database.")
    (license license:asl2.0)))

;;; scriptisto — A language-agnostic "shebang interpreter" that enables you to write sc
(define-public scriptisto
  (package
    (name "scriptisto")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/igor-petruk/scriptisto/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/igor-petruk/scriptisto")
    (synopsis "a language-agnostic "shebang interpreter" that enables you to write scripts...")
    (description "A language-agnostic \"shebang interpreter\" that enables you to write scripts in compiled languages.")
    (license license:asl2.0)))

;;; gwe — A system utility for controlling NVIDIA GPUs
(define-public gwe
  (package
    (name "gwe")
    (version "0.15.9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.com/leinardi/gwe/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/leinardi/gwe")
    (synopsis "a system utility for controlling NVIDIA GPUs")
    (description "A system utility for controlling NVIDIA GPUs.")
    (license license:gpl3+)))

;;; flexget-webui — The FlexGet Web UI
(define-public flexget-webui
  (package
    (name "flexget-webui")
    (version "2.0.29")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Flexget/webui/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Flexget/webui")
    (synopsis "the FlexGet Web UI")
    (description "The FlexGet Web UI.")
    (license license:expat)))

;;; macbook-12-1-linux-fixes — Custom fixes for MacBook 12,1 (2015 Pro 13 inch)
(define-public macbook-12-1-linux-fixes
  (package
    (name "macbook-12-1-linux-fixes")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Chamal1120/macbookpro-12-1-linux-fix-files")
    (synopsis "custom fixes for MacBook 12,1 (2015 Pro 13 inch)")
    (description "Custom fixes for MacBook 12,1 (2015 Pro 13 inch).")
    (license license:expat)))

;;; alterware-launcher-git — AlterWare.dev updater & launcher, written in Rust.
(define-public alterware-launcher-git
  (package
    (name "alterware-launcher-git")
    (version "0.8.1.r2.g8f0ba69")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mxve/alterware-launcher/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mxve/alterware-launcher")
    (synopsis "alterWare.dev updater & launcher, written in Rust")
    (description "AlterWare.dev updater & launcher, written in Rust.")
    (license license:gpl3+)))

;;; symbiyosys-git — A front-end driver program for Yosys-based formal hardware verificatio
(define-public symbiyosys-git
  (package
    (name "symbiyosys-git")
    (version "r615.c9e3b82")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/YosysHQ/sby.git/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YosysHQ/sby.git")
    (synopsis "a front-end driver program for Yosys-based formal hardware verification flows")
    (description "A front-end driver program for Yosys-based formal hardware verification flows.")
    (license license:isc)))

;;; mkdocs-material-pymdownx-extras — MkDocs Material additions used for pymdownx documentation
(define-public mkdocs-material-pymdownx-extras
  (package
    (name "mkdocs-material-pymdownx-extras")
    (version "2.8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/facelessuser/mkdocs_pymdownx_material_extras/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/facelessuser/mkdocs_pymdownx_material_extras")
    (synopsis "mkDocs Material additions used for pymdownx documentation")
    (description "MkDocs Material additions used for pymdownx documentation.")
    (license license:expat)))

;;; gtk3-classic-xfce — Patched GTK+3 that provides a more classic experience, with patches fo
(define-public gtk3-classic-xfce
  (package
    (name "gtk3-classic-xfce")
    (version "3.24.51")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/lah7/gtk3-classic/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lah7/gtk3-classic")
    (synopsis "patched GTK+3 that provides a more classic experience, with patches for xfce")
    (description "Patched GTK+3 that provides a more classic experience, with patches for xfce.")
    (license license:lgpl2.1+)))

;;; android-studio-beta — The Official Android IDE (Beta branch)
(define-public android-studio-beta
  (package
    (name "android-studio-beta")
    (version "2025.3.1.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://developer.android.com/studio/preview")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://developer.android.com/studio/preview")
    (synopsis "the Official Android IDE (Beta branch)")
    (description "The Official Android IDE (Beta branch).")
    (license license:asl2.0)))

;;; openscad-lsp — A LSP server for OpenSCAD
(define-public openscad-lsp
  (package
    (name "openscad-lsp")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Leathong/openscad-LSP/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Leathong/openscad-LSP")
    (synopsis "a LSP server for OpenSCAD")
    (description "A LSP server for OpenSCAD.")
    (license license:asl2.0)))

;;; protondb-cli — A command-line tool to fetch and display game summaries from the Proto
(define-public protondb-cli
  (package
    (name "protondb-cli")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/hypeedev/protondb-cli/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/hypeedev/protondb-cli")
    (synopsis "a command-line tool to fetch and display game summaries from the ProtonDB API")
    (description "A command-line tool to fetch and display game summaries from the ProtonDB API.")
    (license license:expat)))

;;; qmp3gain-git — User interface front end supporting famous MP3Gain engine which analyz
(define-public qmp3gain-git
  (package
    (name "qmp3gain-git")
    (version "0.9.3.r123.20220727.95b2608")
    (source
     (origin
       (method url-fetch)
       (uri "https://sourceforge.net/projects/qmp3gain/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://sourceforge.net/projects/qmp3gain/")
    (synopsis "user interface front end supporting famous MP3Gain engine which analyzes and...")
    (description "User interface front end supporting famous MP3Gain engine which analyzes and losslessly adjusts MP3 files to a specified target volume.")
    (license license:gpl3+)))

;;; nodejs-vls — Vue language server (LSP)
(define-public nodejs-vls
  (package
    (name "nodejs-vls")
    (version "0.8.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.npmjs.com/package/vls")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.npmjs.com/package/vls")
    (synopsis "vue language server (LSP)")
    (description "Vue language server (LSP).")
    (license license:expat)))

;;; plasma6-wallpapers-blurredwallpaper — KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a
(define-public plasma6-wallpapers-blurredwallpaper
  (package
    (name "plasma6-wallpapers-blurredwallpaper")
    (version "3.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/bouteillerAlan/blurredwallpaper/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bouteillerAlan/blurredwallpaper")
    (synopsis "KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a...")
    (description "KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a window is active.")
    (license license:gpl3+)))

;;; bananaplus — Simple and fast accounting software
(define-public bananaplus
  (package
    (name "bananaplus")
    (version "10.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.banana.ch/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.banana.ch/")
    (synopsis "simple and fast accounting software")
    (description "Simple and fast accounting software.")
    (license #f)))

;;; lib32-lzo — Portable lossless data compression library (32 bit)
(define-public lib32-lzo
  (package
    (name "lib32-lzo")
    (version "2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.oberhumer.com/opensource/lzo/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.oberhumer.com/opensource/lzo/")
    (synopsis "portable lossless data compression library (32 bit)")
    (description "Portable lossless data compression library (32 bit).")
    (license license:gpl3+)))

;;; python-rembg — Rembg is a tool to remove images background
(define-public python-rembg
  (package
    (name "python-rembg")
    (version "2.0.72")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/danielgatis/rembg/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/danielgatis/rembg")
    (synopsis "rembg is a tool to remove images background")
    (description "Rembg is a tool to remove images background.")
    (license license:expat)))

;;; python3-colorsysplus — An extension of the standard colorsys module with support for CMYK, te
(define-public python3-colorsysplus
  (package
    (name "python3-colorsysplus")
    (version "2025.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://xyne.dev/projects/python3-colorsysplus")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://xyne.dev/projects/python3-colorsysplus")
    (synopsis "an extension of the standard colorsys module with support for CMYK, terminal...")
    (description "An extension of the standard colorsys module with support for CMYK, terminal colors, ANSI and more.")
    (license license:gpl3+)))

;;; ultrastardx-songs — Songs for UltraStar Deluxe (USDX)
(define-public ultrastardx-songs
  (package
    (name "ultrastardx-songs")
    (version "2012.09.09")
    (source
     (origin
       (method url-fetch)
       (uri "https://usdx.eu/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://usdx.eu/")
    (synopsis "songs for UltraStar Deluxe (USDX)")
    (description "Songs for UltraStar Deluxe (USDX).")
    (license #f)))

;;; xorgxrdp-glamor — Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AM
(define-public xorgxrdp-glamor
  (package
    (name "xorgxrdp-glamor")
    (version "0.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/neutrinolabs/xorgxrdp/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neutrinolabs/xorgxrdp")
    (synopsis "xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs")
    (description "Xorg drivers for xrdp, with glamor enabled. Only works on Intel and AMD GPUs.")
    (license license:x11)))

;;; cyberghostvpn — CyberGhost VPN
(define-public cyberghostvpn
  (package
    (name "cyberghostvpn")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.cyberghostvpn.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.cyberghostvpn.com")
    (synopsis "cyberGhost VPN")
    (description "CyberGhost VPN.")
    (license #f)))

;;; smoothie-rs-linux-git — Linux-Tested version of smoothie-rs
(define-public smoothie-rs-linux-git
  (package
    (name "smoothie-rs-linux-git")
    (version "Nightly_2025.01.11_12.34.r0.g25cec11")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Hzqkii/smoothie-rs/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Hzqkii/smoothie-rs")
    (synopsis "linux-Tested version of smoothie-rs")
    (description "Linux-Tested version of smoothie-rs.")
    (license license:gpl3+)))

;;; apfsprogs-git — Experimental APFS tools for linux
(define-public apfsprogs-git
  (package
    (name "apfsprogs-git")
    (version "r348.f9e48ce")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eafer/apfsprogs/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eafer/apfsprogs")
    (synopsis "experimental APFS tools for linux")
    (description "Experimental APFS tools for linux.")
    (license license:gpl2)))

;;; gnome-shell-extension-rounded-window-corners-reborn — A GNOME Shell extension that adds rounded corners for all windows
(define-public gnome-shell-extension-rounded-window-corners-reborn
  (package
    (name "gnome-shell-extension-rounded-window-corners-reborn")
    (version "15.8773ee9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/flexagoon/rounded-window-corners/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/flexagoon/rounded-window-corners")
    (synopsis "a GNOME Shell extension that adds rounded corners for all windows")
    (description "A GNOME Shell extension that adds rounded corners for all windows.")
    (license license:gpl3+)))

;;; icinga2 — An open source host, service and network monitoring program
(define-public icinga2
  (package
    (name "icinga2")
    (version "2.16.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://icinga.com/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://icinga.com/")
    (synopsis "an open source host, service and network monitoring program")
    (description "An open source host, service and network monitoring program.")
    (license license:gpl3+)))

;;; vattery — A GTK battery monitor for the sys-tray
(define-public vattery
  (package
    (name "vattery")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.jezra.net/projects/vattery.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.jezra.net/projects/vattery.html")
    (synopsis "a GTK battery monitor for the sys-tray")
    (description "A GTK battery monitor for the sys-tray.")
    (license license:gpl3+)))

;;; mikmod — A curses module player based on libmikmod
(define-public mikmod
  (package
    (name "mikmod")
    (version "3.2.8")
    (source
     (origin
       (method url-fetch)
       (uri "http://mikmod.sourceforge.net")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://mikmod.sourceforge.net")
    (synopsis "a curses module player based on libmikmod")
    (description "A curses module player based on libmikmod.")
    (license license:gpl3+)))

;;; uxplay-git — AirPlay Unix mirroring server
(define-public uxplay-git
  (package
    (name "uxplay-git")
    (version "r1432.099da8c")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FDH2/UxPlay/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FDH2/UxPlay")
    (synopsis "airPlay Unix mirroring server")
    (description "AirPlay Unix mirroring server.")
    (license license:gpl3+)))

;;; php-oci8 — PHP extension for OCI8
(define-public php-oci8
  (package
    (name "php-oci8")
    (version "3.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://pecl.php.net/package/oci8")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://pecl.php.net/package/oci8")
    (synopsis "PHP extension for OCI8")
    (description "PHP extension for OCI8.")
    (license license:php3.01)))

;;; notepad---git — Notepad-- 是使用C++编写的轻量级文本编辑器, 简称ndd, 可以支持Window/Mac/Linux操作系统平台。
(define-public notepad---git
  (package
    (name "notepad---git")
    (version "3.2.r0.gee35169")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitee.com/cxasm/notepad--")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitee.com/cxasm/notepad--")
    (synopsis "notepad-- 是使用C++编写的轻量级文本编辑器, 简称ndd, 可以支持Window/Mac/Linux操作系统平台。")
    (description "Notepad-- 是使用C++编写的轻量级文本编辑器, 简称ndd, 可以支持Window/Mac/Linux操作系统平台。.")
    (license license:gpl3+)))

;;; shader-slang-git — Shading language that makes it easier to build and maintain large shad
(define-public shader-slang-git
  (package
    (name "shader-slang-git")
    (version "2026.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/shader-slang/slang/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/shader-slang/slang")
    (synopsis "shading language that makes it easier to build and maintain large shader...")
    (description "Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion.")
    (license license:expat)))

;;; rtl8812au-aircrack-ng-dkms-git — RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame inject
(define-public rtl8812au-aircrack-ng-dkms-git
  (package
    (name "rtl8812au-aircrack-ng-dkms-git")
    (version "5.6.4.2_20230501.c3fb89a")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/aircrack-ng/rtl8812au/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("rtl8812au-aircrack-ng-dkms" "bin/rtl8812au-aircrack-ng-dkms"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/aircrack-ng/rtl8812au")
    (synopsis "RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame injection")
    (description "RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame injection.")
    (license license:gpl2)))

;;; lan-mouse-git — Software KVM Switch / mouse & keyboard sharing software for Local Area
(define-public lan-mouse-git
  (package
    (name "lan-mouse-git")
    (version "0.10.0.r79.g27225ed564")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/feschber/lan-mouse/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/feschber/lan-mouse")
    (synopsis "software KVM Switch / mouse & keyboard sharing software for Local Area Networks")
    (description "Software KVM Switch / mouse & keyboard sharing software for Local Area Networks.")
    (license license:gpl3)))

;;; sticky-notes — A simple sticky notes app
(define-public sticky-notes
  (package
    (name "sticky-notes")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vixalien/sticky/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vixalien/sticky")
    (synopsis "a simple sticky notes app")
    (description "A simple sticky notes app.")
    (license license:expat)))

;;; go-ascii-tool-git — GoAT: render ASCII art as SVG diagrams
(define-public go-ascii-tool-git
  (package
    (name "go-ascii-tool-git")
    (version "r108.07bb911")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/blampe/goat/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/blampe/goat")
    (synopsis "goAT: render ASCII art as SVG diagrams")
    (description "GoAT: render ASCII art as SVG diagrams.")
    (license license:expat)))

;;; vatsim-crc — Consolidated Radar Client (CRC), a controller application connects to 
(define-public vatsim-crc
  (package
    (name "vatsim-crc")
    (version "2.16.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://vnas.vatsim.net/crc")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vnas.vatsim.net/crc")
    (synopsis "consolidated Radar Client (CRC), a controller application connects to the...")
    (description "Consolidated Radar Client (CRC), a controller application connects to the VATSIM network through vNAS.")
    (license #f)))

;;; snx — Check Point SSL Network Extender (VPN Client)
(define-public snx
  (package
    (name "snx")
    (version "800008409")
    (source
     (origin
       (method url-fetch)
       (uri "https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824")
    (synopsis "check Point SSL Network Extender (VPN Client)")
    (description "Check Point SSL Network Extender (VPN Client).")
    (license #f)))

;;; kicad-nightly — Electronic schematic and printed circuit board (PCB) design tools
(define-public kicad-nightly
  (package
    (name "kicad-nightly")
    (version "10.99.0_703_g46f9656518")
    (source
     (origin
       (method url-fetch)
       (uri "https://kicad.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kicad.org/")
    (synopsis "electronic schematic and printed circuit board (PCB) design tools")
    (description "Electronic schematic and printed circuit board (PCB) design tools.")
    (license license:gpl3+)))

;;; mcskinedit — Minecraft Skin Editor
(define-public mcskinedit
  (package
    (name "mcskinedit")
    (version "alpha3pre7")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.minecraftforum.net/topic/3796-skinedit-new-version-13-april-alpha-3-pre-7/#entry49969")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("mcskinedit" "bin/mcskinedit"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.minecraftforum.net/topic/3796-skinedit-new-version-13-april-alpha-3-pre-7/#entry49969")
    (synopsis "minecraft Skin Editor")
    (description "Minecraft Skin Editor.")
    (license #f)))

;;; xwinwrap-git — Fork of XwinWrap from takase1121 on GitHub
(define-public xwinwrap-git
  (package
    (name "xwinwrap-git")
    (version "r5.ec32e9b")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/takase1121/xwinwrap/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/takase1121/xwinwrap")
    (synopsis "fork of XwinWrap from takase1121 on GitHub")
    (description "Fork of XwinWrap from takase1121 on GitHub.")
    (license #f)))

;;; muc-git — Visualize your most used commands
(define-public muc-git
  (package
    (name "muc-git")
    (version "r58.1c7b988")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nate-sys/muc/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nate-sys/muc")
    (synopsis "visualize your most used commands")
    (description "Visualize your most used commands.")
    (license license:gpl3+)))

;;; gnome-kra-ora-thumbnailer-git — A thumbnailer for KRA ( Krita native file ) and ORA ( open-raster ) fo
(define-public gnome-kra-ora-thumbnailer-git
  (package
    (name "gnome-kra-ora-thumbnailer-git")
    (version "1.4.r0.g53b68a1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/GNOME/gnome-kra-ora-thumbnailer")
    (synopsis "a thumbnailer for KRA ( Krita native file ) and ORA ( open-raster ) for the...")
    (description "A thumbnailer for KRA ( Krita native file ) and ORA ( open-raster ) for the Gnome desktop.")
    (license license:gpl3+)))

;;; cinelerra-gg — Professional video editing and compositing environment
(define-public cinelerra-gg
  (package
    (name "cinelerra-gg")
    (version "2026.02")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.cinelerra-gg.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.cinelerra-gg.org")
    (synopsis "professional video editing and compositing environment")
    (description "Professional video editing and compositing environment.")
    (license license:gpl2)))

;;; zaman — A simple CLI tool to display (or save) man pages as PDFs
(define-public zaman
  (package
    (name "zaman")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Antiz96/zaman/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Antiz96/zaman")
    (synopsis "a simple CLI tool to display (or save) man pages as PDFs")
    (description "A simple CLI tool to display (or save) man pages as PDFs.")
    (license license:gpl3+)))

;;; xborder-git — Active window border replacement for window managers.
(define-public xborder-git
  (package
    (name "xborder-git")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/deter0/xborder/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/deter0/xborder")
    (synopsis "active window border replacement for window managers")
    (description "Active window border replacement for window managers.")
    (license license:unlicense)))

;;; matplotplusplus — Matplot++: A C++ Graphics Library for Data Visualization
(define-public matplotplusplus
  (package
    (name "matplotplusplus")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://alandefreitas.github.io/matplotplusplus")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://alandefreitas.github.io/matplotplusplus")
    (synopsis "matplot++: A C++ Graphics Library for Data Visualization")
    (description "Matplot++: A C++ Graphics Library for Data Visualization.")
    (license license:expat)))

;;; aget — Minimalistic AUR helper
(define-public aget
  (package
    (name "aget")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/xyproto/aget/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xyproto/aget")
    (synopsis "minimalistic AUR helper")
    (description "Minimalistic AUR helper.")
    (license license:bsd-3)))

;;; tetris — Linux port of the OpenBSD version
(define-public tetris
  (package
    (name "tetris")
    (version "7.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eNV25/tetris/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/eNV25/tetris")
    (synopsis "linux port of the OpenBSD version")
    (description "Linux port of the OpenBSD version.")
    (license license:bsd-3)))

;;; polybar-now-playing-git — Script for polybar to display and control media (not only Spotify)usin
(define-public polybar-now-playing-git
  (package
    (name "polybar-now-playing-git")
    (version "1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/d093w1z/polybar-now-playing.git/archive/refs/tags/v1.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/d093w1z/polybar-now-playing.git")
    (synopsis "script for polybar to display and control media (not only Spotify)using DBus")
    (description "Script for polybar to display and control media (not only Spotify)using DBus.")
    (license license:gpl3+)))

;;; libfprint-elanmoc2-working-git — Library for fingerprint readers with patches for the support of the EL
(define-public libfprint-elanmoc2-working-git
  (package
    (name "libfprint-elanmoc2-working-git")
    (version "1.94.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://fprint.freedesktop.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://fprint.freedesktop.org/")
    (synopsis "library for fingerprint readers with patches for the support of the ELAN...")
    (description "Library for fingerprint readers with patches for the support of the ELAN 0C4C & 0C00.")
    (license license:lgpl3+)))

;;; doxide — Modern documentation for modern C++
(define-public doxide
  (package
    (name "doxide")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://doxide.org")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://doxide.org")
    (synopsis "modern documentation for modern C++")
    (description "Modern documentation for modern C++.")
    (license license:asl2.0)))

;;; vufind — VuFind® is a discovery system designed and developed for libraries by 
(define-public vufind
  (package
    (name "vufind")
    (version "11.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://vufind.org/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("vufind" "bin/vufind"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://vufind.org/")
    (synopsis "vuFind® is a discovery system designed and developed for libraries by libraries")
    (description "VuFind® is a discovery system designed and developed for libraries by libraries.")
    (license license:gpl2)))

;;; unshell — A utility for splitting input into shell-like tokens
(define-public unshell
  (package
    (name "unshell")
    (version "0.12.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/coralpink/unshell/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/coralpink/unshell")
    (synopsis "a utility for splitting input into shell-like tokens")
    (description "A utility for splitting input into shell-like tokens.")
    (license #f)))

;;; snmalloc — Message passing based allocator
(define-public snmalloc
  (package
    (name "snmalloc")
    (version "0.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/microsoft/snmalloc/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/microsoft/snmalloc")
    (synopsis "message passing based allocator")
    (description "Message passing based allocator.")
    (license license:expat)))

;;; ruby-asciidoctor-diagram-batik — Asciidoctor diagramming Apache Batik SVG extension
(define-public ruby-asciidoctor-diagram-batik
  (package
    (name "ruby-asciidoctor-diagram-batik")
    (version "1.17")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/asciidoctor/asciidoctor-diagram/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/asciidoctor/asciidoctor-diagram")
    (synopsis "asciidoctor diagramming Apache Batik SVG extension")
    (description "Asciidoctor diagramming Apache Batik SVG extension.")
    (license license:asl2.0)))

;;; qregedit-git — Windows registry editor written with Qt, based on chntpw code
(define-public qregedit-git
  (package
    (name "qregedit-git")
    (version "20230428.7650144")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kernel1024/qregedit/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kernel1024/qregedit")
    (synopsis "windows registry editor written with Qt, based on chntpw code")
    (description "Windows registry editor written with Qt, based on chntpw code.")
    (license license:gpl2)))

;;; python-safehttpx — A small Python library created to help developers protect their applic
(define-public python-safehttpx
  (package
    (name "python-safehttpx")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/gradio-app/safehttpx/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gradio-app/safehttpx")
    (synopsis "a small Python library created to help developers protect their applications...")
    (description "A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.")
    (license license:asl2.0)))

;;; ptt-fix — A somewhat hacky workaround for push-to-talk in Discord and other apps
(define-public ptt-fix
  (package
    (name "ptt-fix")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/DeedleFake/ptt-fix/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DeedleFake/ptt-fix")
    (synopsis "a somewhat hacky workaround for push-to-talk in Discord and other apps in...")
    (description "A somewhat hacky workaround for push-to-talk in Discord and other apps in Wayland.")
    (license license:expat)))

;;; porymap — porymap
(define-public porymap
  (package
    (name "porymap")
    (version "6.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/huderlem/porymap/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/huderlem/porymap/")
    (synopsis "package from AUR")
    (description "Package from AUR.")
    (license license:lgpl3)))

;;; popcornfx-editor — The PopcornFX Editor is a suite of tools dedicated to effects creation
(define-public popcornfx-editor
  (package
    (name "popcornfx-editor")
    (version "2.21.1.23070")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.popcornfx.com")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.popcornfx.com")
    (synopsis "the PopcornFX Editor is a suite of tools dedicated to effects creation and...")
    (description "The PopcornFX Editor is a suite of tools dedicated to effects creation and management of related assets.")
    (license #f)))

;;; petalinux — Toolchain and SDK for Xilinx embedded Linux
(define-public petalinux
  (package
    (name "petalinux")
    (version "2023.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html")
    (synopsis "toolchain and SDK for Xilinx embedded Linux")
    (description "Toolchain and SDK for Xilinx embedded Linux.")
    (license #f)))

;;; newm-next-git — newm-next Wayland compositor
(define-public newm-next-git
  (package
    (name "newm-next-git")
    (version "r765.dd9097f")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/newm-next/newm-next/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/newm-next/newm-next")
    (synopsis "newm-next Wayland compositor")
    (description "Newm-next Wayland compositor.")
    (license license:expat)))

;;; nemo-webp-git — WebP image format support for thumbnails in Nemo
(define-public nemo-webp-git
  (package
    (name "nemo-webp-git")
    (version "1.0.0.r6.ff9a489")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pliski/nemo-webp.git/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pliski/nemo-webp.git")
    (synopsis "webP image format support for thumbnails in Nemo")
    (description "WebP image format support for thumbnails in Nemo.")
    (license license:gpl3+)))

;;; mtp — Automated/interactive cryptanalysis for the Many-time pad attack
(define-public mtp
  (package
    (name "mtp")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/CameronLonsdale/mtp/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/CameronLonsdale/mtp")
    (synopsis "automated/interactive cryptanalysis for the Many-time pad attack")
    (description "Automated/interactive cryptanalysis for the Many-time pad attack.")
    (license license:expat)))

;;; metamorphose2-python3-git — Updated fork of Métamorphose 2, by timinaust
(define-public metamorphose2-python3-git
  (package
    (name "metamorphose2-python3-git")
    (version "r130.55ffc9f")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/timinaust/metamorphose2/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/timinaust/metamorphose2/tree/Python3_WXPython4")
    (synopsis "updated fork of Métamorphose 2, by timinaust")
    (description "Updated fork of Métamorphose 2, by timinaust.")
    (license license:gpl3+)))

;;; memsed-git — MEMory Search and EDit for Linux, inspired by Cheat Engine
(define-public memsed-git
  (package
    (name "memsed-git")
    (version "0.1.r19.gcafbbe9")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Willy-JL/MemSed/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Willy-JL/MemSed")
    (synopsis "mEMory Search and EDit for Linux, inspired by Cheat Engine")
    (description "MEMory Search and EDit for Linux, inspired by Cheat Engine.")
    (license license:gpl3)))

;;; lb-planner-git — a Planning tool for students at the TGM Vienna (unstable version)
(define-public lb-planner-git
  (package
    (name "lb-planner-git")
    (version "1.2.0.979_1c505a5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/necodeIT/lb_planner_app/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/necodeIT/lb_planner_app")
    (synopsis "a Planning tool for students at the TGM Vienna (unstable version)")
    (description "A Planning tool for students at the TGM Vienna (unstable version).")
    (license #f)))

;;; keyring-cli — A very basic cli keyring tool to use accross various OS.
(define-public keyring-cli
  (package
    (name "keyring-cli")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/vbouchaud/keyring/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vbouchaud/keyring")
    (synopsis "a very basic cli keyring tool to use accross various OS")
    (description "A very basic cli keyring tool to use accross various OS.")
    (license license:mpl2.0)))

;;; k8s-ldap-auth — Kubernetes webhook token authentication plugin implementation using ld
(define-public k8s-ldap-auth
  (package
    (name "k8s-ldap-auth")
    (version "4.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/HopopOps/k8s-ldap-auth/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/HopopOps/k8s-ldap-auth")
    (synopsis "kubernetes webhook token authentication plugin implementation using ldap")
    (description "Kubernetes webhook token authentication plugin implementation using ldap.")
    (license license:mpl2.0)))

;;; hfd-git — CLI-Tool for download Huggingface models and datasets with aria2/wget+
(define-public hfd-git
  (package
    (name "hfd-git")
    (version "r30.258f20e")
    (source
     (origin
       (method url-fetch)
       (uri "https://gist.github.com/padeoe/697678ab8e528b85a2a7bddafea1fa4f")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gist.github.com/padeoe/697678ab8e528b85a2a7bddafea1fa4f")
    (synopsis "cLI-Tool for download Huggingface models and datasets with aria2/wget+git")
    (description "CLI-Tool for download Huggingface models and datasets with aria2/wget+git.")
    (license #f)))

;;; gosign — Nuovo tool di firma e rinnovo online per i certificati digitali emessi
(define-public gosign
  (package
    (name "gosign")
    (version "2.4.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.firma.infocert.it")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.firma.infocert.it")
    (synopsis "nuovo tool di firma e rinnovo online per i certificati digitali emessi da...")
    (description "Nuovo tool di firma e rinnovo online per i certificati digitali emessi da InfoCert.")
    (license #f)))

;;; fluidx3d — The fastest and most memory efficient lattice Boltzmann CFD software, 
(define-public fluidx3d
  (package
    (name "fluidx3d")
    (version "3.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ProjectPhysX/FluidX3D/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ProjectPhysX/FluidX3D")
    (synopsis "the fastest and most memory efficient lattice Boltzmann CFD software, using...")
    (description "The fastest and most memory efficient lattice Boltzmann CFD software, using OpenCL.")
    (license #f)))

;;; debounce — A utility for debouncing lines from stdin
(define-public debounce
  (package
    (name "debounce")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://codeberg.org/coralpink/debounce/archive/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/coralpink/debounce")
    (synopsis "a utility for debouncing lines from stdin")
    (description "A utility for debouncing lines from stdin.")
    (license #f)))

;;; baibot-git — Baibot - Matrix AI Chatbot
(define-public baibot-git
  (package
    (name "baibot-git")
    (version "1.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/etkecc/baibot/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/etkecc/baibot")
    (synopsis "baibot - Matrix AI Chatbot")
    (description "Baibot - Matrix AI Chatbot.")
    (license license:expat)))

;;; asciiconv — AsciiConv is a program for creating Ascii art in Python. Read more on 
(define-public asciiconv
  (package
    (name "asciiconv")
    (version "1.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/1RoboTron/AsciiConv/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/1RoboTron/AsciiConv")
    (synopsis "asciiConv is a program for creating Ascii art in Python. Read more on GitHub")
    (description "AsciiConv is a program for creating Ascii art in Python. Read more on GitHub.")
    (license license:bsd-3)))

;;; yetris — Customizable Tetris clone for the terminal
(define-public yetris
  (package
    (name "yetris")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/alexdantas/yetris/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alexdantas/yetris")
    (synopsis "customizable Tetris clone for the terminal")
    (description "Customizable Tetris clone for the terminal.")
    (license license:gpl3+)))

;;; nfancurve — A small and lightweight Bash script for using a custom fan curve in Li
(define-public nfancurve
  (package
    (name "nfancurve")
    (version "019.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/nan0s7/nfancurve/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nan0s7/nfancurve")
    (synopsis "a small and lightweight Bash script for using a custom fan curve in Linux...")
    (description "A small and lightweight Bash script for using a custom fan curve in Linux for NVIDIA GPUs.")
    (license license:gpl3+)))

;;; xontrib-vox-git — Python virtual environment manager for xonsh
(define-public xontrib-vox-git
  (package
    (name "xontrib-vox-git")
    (version "r12.fe51b7b")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/xonsh/xontrib-vox/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xonsh/xontrib-vox")
    (synopsis "Python virtual environment manager for xonsh")
    (description "Python virtual environment manager for xonsh.")
    (license license:expat)))

;;; woz2dsk — woz2dsk is a utility for converting .woz files to .dsk, .po and .nib f
(define-public woz2dsk
  (package
    (name "woz2dsk")
    (version "r18.b10c59f")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/leesaudan2/woz2dsk/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/leesaudan2/woz2dsk")
    (synopsis "woz2dsk is a utility for converting .woz files to .dsk, .po and .nib files")
    (description "Woz2dsk is a utility for converting .woz files to .dsk, .po and .nib files.")
    (license license:gpl3+)))

;;; tile-world2 — Emulation of the game Chip's Challenge
(define-public tile-world2
  (package
    (name "tile-world2")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://tw2.bitbusters.club/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://tw2.bitbusters.club/")
    (synopsis "emulation of the game Chip's Challenge")
    (description "Emulation of the game Chip's Challenge.")
    (license license:gpl2+)))

;;; python-pydantic-graph — Graph and state machine librarys.
(define-public python-pydantic-graph
  (package
    (name "python-pydantic-graph")
    (version "1.25.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pydantic/pydantic-ai/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph")
    (synopsis "graph and state machine librarys")
    (description "Graph and state machine librarys.")
    (license license:expat)))

;;; python-groq — The official Python library for the groq API.
(define-public python-groq
  (package
    (name "python-groq")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/groq/groq-python/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/groq/groq-python")
    (synopsis "the official Python library for the groq API")
    (description "The official Python library for the groq API.")
    (license license:asl2.0)))

;;; passport — a verification and copy program for 5.25-inch Apple II floppy disks
(define-public passport
  (package
    (name "passport")
    (version "20240913")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/a2-4am/passport/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/a2-4am/passport")
    (synopsis "a verification and copy program for 5.25-inch Apple II floppy disks")
    (description "A verification and copy program for 5.25-inch Apple II floppy disks.")
    (license license:gpl3+)))

;;; krunner-watch-git — A temporary solution for krunner on nvidia driver by scanning logs for
(define-public krunner-watch-git
  (package
    (name "krunner-watch-git")
    (version "r1.95d3cfd")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kpostekk/krunner-restarter/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kpostekk/krunner-restarter")
    (synopsis "a temporary solution for krunner on nvidia driver by scanning logs for...")
    (description "A temporary solution for krunner on nvidia driver by scanning logs for eglSwapBuffers errors (Also called: krunner-restarter).")
    (license #f)))

;;; hostsd — A simple hosts file manager
(define-public hostsd
  (package
    (name "hostsd")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://git.private.coffee/kumi/hostsd")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://git.private.coffee/kumi/hostsd")
    (synopsis "a simple hosts file manager")
    (description "A simple hosts file manager.")
    (license license:expat)))

;;; cadius — BrutalDeluxe's Cadius ProDOS disk imaging utility (used for making App
(define-public cadius
  (package
    (name "cadius")
    (version "1.4.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.brutaldeluxe.fr/products/crossdevtools/cadius/")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.brutaldeluxe.fr/products/crossdevtools/cadius/")
    (synopsis "brutalDeluxe's Cadius ProDOS disk imaging utility (used for making Apple II...")
    (description "BrutalDeluxe's Cadius ProDOS disk imaging utility (used for making Apple II disk images).")
    (license license:gpl3+)))

;;; baibot — Baibot - Matrix AI Chatbot
(define-public baibot
  (package
    (name "baibot")
    (version "1.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/etkecc/baibot/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/etkecc/baibot")
    (synopsis "baibot - Matrix AI Chatbot")
    (description "Baibot - Matrix AI Chatbot.")
    (license license:expat)))

;;; gaiasky — Open source 3D universe simulator for desktop and VR with support for 
(define-public gaiasky
  (package
    (name "gaiasky")
    (version "3.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://gaiasky.space")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("gaiasky" "bin/gaiasky"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gaiasky.space")
    (synopsis "open source 3D universe simulator for desktop and VR with support for more...")
    (description "Open source 3D universe simulator for desktop and VR with support for more than a billion objects.")
    (license license:mpl2.0)))

;;; python-click-extra — Drop-in replacement for Click to make user-friendly and colorful CLI.
(define-public python-click-extra
  (package
    (name "python-click-extra")
    (version "7.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kdeldycke/click-extra/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/kdeldycke/click-extra")
    (synopsis "drop-in replacement for Click to make user-friendly and colorful CLI")
    (description "Drop-in replacement for Click to make user-friendly and colorful CLI.")
    (license license:gpl2+)))

;;; py-cidr — python module providing network / CIDR tools
(define-public py-cidr
  (package
    (name "py-cidr")
    (version "3.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/gene-git/py-cidr/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/gene-git/py-cidr")
    (synopsis "python module providing network / CIDR tools")
    (description "Python module providing network / CIDR tools.")
    (license license:gpl2+)))

;;; meep-python — A free finite-difference time-domain simulation software package (with
(define-public meep-python
  (package
    (name "meep-python")
    (version "1.29.0")
    (source
     (origin
       (method url-fetch)
       (uri "http://ab-initio.mit.edu/wiki/index.php/Meep")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "http://ab-initio.mit.edu/wiki/index.php/Meep")
    (synopsis "a free finite-difference time-domain simulation software package (with...")
    (description "A free finite-difference time-domain simulation software package (with Python support).")
    (license license:gpl3+)))

;;; browser-on-ram-git — Synchronizes browser related directories to RAM
(define-public browser-on-ram-git
  (package
    (name "browser-on-ram-git")
    (version "v1.1.r2.a921454")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/64-bitman/browser-on-ram/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/64-bitman/browser-on-ram")
    (synopsis "synchronizes browser related directories to RAM")
    (description "Synchronizes browser related directories to RAM.")
    (license license:expat)))

;;; pamac-gtk3 — A Package Manager based on libalpm with AUR and Appstream support (GTK
(define-public pamac-gtk3
  (package
    (name "pamac-gtk3")
    (version "10.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/manjaro/pamac/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/manjaro/pamac")
    (synopsis "a Package Manager based on libalpm with AUR and Appstream support (GTK3)")
    (description "A Package Manager based on libalpm with AUR and Appstream support (GTK3).")
    (license license:gpl3+)))

;;; kri — Simple, compact & very fast text editor
(define-public kri
  (package
    (name "kri")
    (version "0.8.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ikozyris/kri/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ikozyris/kri")
    (synopsis "simple, compact & very fast text editor")
    (description "Simple, compact & very fast text editor.")
    (license license:gpl3+)))
