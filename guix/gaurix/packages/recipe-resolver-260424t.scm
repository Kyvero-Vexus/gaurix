;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424t
;;; Resolves 100 packages from queue (TODO #18108-#18242).
;;;
;;; New recipes (72):
;;;       1.  screego-server (#18108, gnu-build-system, v1.0.2, license:asl2.0)
;;;       2.  kinda-bard-bin (#18111, copy-build-system, v1.0.0, license:expat)
;;;       3.  wavy-bin (#18112, copy-build-system, v0.1.0, license:expat)
;;;       4.  uptrack (#18113, gnu-build-system, v0.1.0, license:expat)
;;;       5.  ucn (#18114, gnu-build-system, v0.1.0, license:expat)
;;;       6.  tcg (#18115, gnu-build-system, v0.1.0, license:gpl2+)
;;;       7.  tauview-bin (#18116, copy-build-system, v0.1.0, license:expat)
;;;       8.  pipe-cutter-bin (#18118, copy-build-system, v0.1.0, license:expat)
;;;       9.  linked-bin (#18120, copy-build-system, v1.0.0, license:expat)
;;;      10.  freedata-server (#18121, gnu-build-system, v0.16.2, license:gpl3+)
;;;      11.  flac123 (#18122, gnu-build-system, v0.0.12, license:gpl2+)
;;;      12.  fetter-bin (#18123, copy-build-system, v0.1.0, license:expat)
;;;      13.  cproxy-bin (#18124, copy-build-system, v0.1.0, license:gpl3+)
;;;      14.  morgen-bin (#18126, copy-build-system, v3.0.0, license:nonfree)
;;;      15.  termrec (#18127, gnu-build-system, v0.19, license:gpl2+)
;;;      16.  appgate-sdp (#18129, copy-build-system, v6.3.0, license:nonfree)
;;;      17.  python-elpy (#18132, gnu-build-system, v1.35.0, license:gpl3+)
;;;      18.  catdvi (#18133, gnu-build-system, v0.14, license:gpl2+)
;;;      19.  lightproxy-bin (#18135, copy-build-system, v1.1.50, license:expat)
;;;      20.  aechoterm-bin (#18137, copy-build-system, v1.0.0, license:nonfree)
;;;      21.  writedoc (#18139, copy-build-system, v0.1.0, license:expat)
;;;      22.  whatstron-bin (#18140, copy-build-system, v1.0.0, license:expat)
;;;      23.  sgfc (#18142, gnu-build-system, v2.0, license:bsd-3)
;;;      24.  runeprice (#18143, copy-build-system, v0.1.0, license:expat)
;;;      25.  py-fetch (#18145, gnu-build-system, v0.1.0, license:expat)
;;;      26.  phomemo-tools-git (#18146, gnu-build-system, v0.1.0, license:gpl3+)
;;;      27.  notedeck-bin (#18147, copy-build-system, v0.1.0, license:expat)
;;;      28.  lemmeknow-bin (#18148, copy-build-system, v0.8.0, license:expat)
;;;      29.  image2display-bin (#18150, copy-build-system, v1.0.0, license:expat)
;;;      30.  flatten-git (#18153, gnu-build-system, v0.1.0, license:expat)
;;;      31.  ecode-bin (#18155, copy-build-system, v0.6.0, license:expat)
;;;      32.  f5fpc (#18161, copy-build-system, v7.2.3, license:nonfree)
;;;      33.  yaml2json (#18162, gnu-build-system, v1.3.0, license:expat)
;;;      34.  aspell-et (#18163, gnu-build-system, v0.1.21.1, license:gpl2+)
;;;      35.  pipelab-bin (#18166, copy-build-system, v1.0.0, license:expat)
;;;      36.  hunspell-et (#18169, gnu-build-system, v1.0, license:lgpl2.1+)
;;;      37.  ctree (#18170, gnu-build-system, v2.0.0, license:expat)
;;;      38.  cassowary-git (#18173, gnu-build-system, v0.6.0, license:expat)
;;;      39.  bintools (#18174, gnu-build-system, v0.1.0, license:expat)
;;;      40.  appgate-sdp-headless (#18175, copy-build-system, v6.3.0, license:nonfree)
;;;      41.  argparser (#18176, gnu-build-system, v5.1, license:gpl3+)
;;;      42.  argparser-doc (#18179, copy-build-system, v5.1, license:gpl3+)
;;;      43.  argparser-bash (#18180, copy-build-system, v5.1, license:gpl3+)
;;;      44.  xcftools-git (#18182, gnu-build-system, v1.0.7, license:gpl2+)
;;;      45.  ac-library (#18183, copy-build-system, v1.5.1, license:cc0)
;;;      46.  lan-share-bin (#18184, copy-build-system, v1.2.1, license:gpl2+)
;;;      47.  commas-bin (#18187, copy-build-system, v1.0.0, license:expat)
;;;      48.  oki-c321-c331-c531 (#18194, copy-build-system, v1.0, license:nonfree)
;;;      49.  uutils-findutils-bin (#18196, copy-build-system, v0.7.0, license:expat)
;;;      50.  zinit (#18198, copy-build-system, v4.3.0, license:expat)
;;;      51.  eparaksts-token-signing (#18204, copy-build-system, v1.0.0, license:nonfree)
;;;      52.  proxy-ns (#18205, gnu-build-system, v0.2.0, license:expat)
;;;      53.  activate-linux-toggle (#18206, gnu-build-system, v0.1.0, license:expat)
;;;      54.  geogebra-6-bin (#18207, copy-build-system, v6.0.847.0, license:nonfree)
;;;      55.  dockit-bin (#18209, copy-build-system, v1.0.0, license:expat)
;;;      56.  tagspaces-bin (#18210, copy-build-system, v6.0.0, license:agpl3+)
;;;      57.  frei (#18211, gnu-build-system, v0.1.0, license:expat)
;;;      58.  nom (#18212, gnu-build-system, v2.8.0, license:expat)
;;;      59.  lpl (#18219, gnu-build-system, v0.1.0, license:expat)
;;;      60.  bashfuscator-git (#18220, gnu-build-system, v0.1.0, license:expat)
;;;      61.  pfetch-rs-bin (#18222, copy-build-system, v2.9.2, license:expat)
;;;      62.  tetris-tui-git (#18223, gnu-build-system, v0.1.0, license:expat)
;;;      63.  dry-bin (#18224, copy-build-system, v0.11.2, license:expat)
;;;      64.  saturnon (#18225, gnu-build-system, v1.0.0, license:gpl3+)
;;;      65.  raise-or-run (#18226, copy-build-system, v0.1.0, license:gpl3+)
;;;      66.  alist (#18227, gnu-build-system, v3.41.0, license:agpl3+)
;;;      67.  piv-agent (#18233, gnu-build-system, v0.22.0, license:asl2.0)
;;;      68.  ministore (#18234, gnu-build-system, v0.3.1, license:gpl3+)
;;;      69.  zsh-hist-git (#18236, gnu-build-system, v0.1.0, license:expat)
;;;      70.  tockler-bin (#18239, copy-build-system, v3.0.0, license:expat)
;;;      71.  tess-bin (#18240, copy-build-system, v0.1.0, license:expat)
;;;      72.  sglauncher-git (#18242, gnu-build-system, v0.1.0, license:gpl3+)
;;;
;;; BLOCKED (28):
;;;       1.  neoforge-server (#18119) -- DEP_RESOLUTION_FAILED: Java Minecraft modding server; requires JDK + NeoForge build infrastructure + Mi
;;;       2.  wpa-cute (#18130) -- DEP_RESOLUTION_FAILED: Qt5 wpa_supplicant GUI frontend; requires Qt5 + wpa_supplicant development heade
;;;       3.  smtube (#18131) -- DEP_RESOLUTION_FAILED: Qt5 YouTube browser application; requires qtwebengine (massive 3GB+ build) + smp
;;;       4.  chomp (#18136) -- DEP_RESOLUTION_FAILED: Computation Homology Project software; requires PARI/GP math library + specializ
;;;       5.  soapysdrplay3-luarvique-git (#18141) -- DEP_RESOLUTION_FAILED: SoapySDR module for SDRPlay APIv3; requires proprietary SDRPlay API v3 library (
;;;       6.  kwin-effects-sliding-notifications-git (#18149) -- DEP_RESOLUTION_FAILED: KDE Plasma KWin C++ plugin; requires KDE Frameworks 5/6 development headers + KW
;;;       7.  futu-ftnn-wine (#18151) -- NEEDS_RECIPE_DESIGN: Wine wrapper for proprietary Chinese trading platform Futu Bull (FTNN); requires
;;;       8.  clspv-git (#18156) -- DEP_RESOLUTION_FAILED: OpenCL C to Vulkan SPIR-V compiler; requires LLVM/Clang source tree build + SPIR
;;;       9.  thunderbird-globalmenu (#18157) -- BUILD_FAILED: full Thunderbird build from source with globalmenu patches; requires Rust toolch
;;;      10.  codeblocks-svn (#18158) -- SOURCE_UNAVAILABLE: SVN source repository at svn://svn.code.sf.net/p/codeblocks/code/trunk; Guix lac
;;;      11.  udiskie-systemd-git (#18159) -- NEEDS_RECIPE_DESIGN: user systemd service file for udiskie auto mounting; Guix System uses GNU Shephe
;;;      12.  toxcore-c (#18164) -- DEP_RESOLUTION_FAILED: C backend implementation of Tox protocol; requires libsodium + opus + libvpx + c
;;;      13.  openfortivpn-webview-electron (#18167) -- DEP_RESOLUTION_FAILED: Electron webview for SAML SSO with openfortivpn; requires Node.js + npm dependen
;;;      14.  openconnect-sso-git (#18168) -- DEP_RESOLUTION_FAILED: Python wrapper for OpenConnect with Azure AD SAMLv2 auth; requires PyQt5/PyQtWeb
;;;      15.  ffmpeg-full-git (#18189) -- DEP_RESOLUTION_FAILED: ffmpeg git build with all features including libfdk-aac; requires 50+ optional l
;;;      16.  celeste64 (#18190) -- DEP_RESOLUTION_FAILED: .NET 8 / C# game (FNA framework); requires dotnet-sdk-8.0 not available in Guix 
;;;      17.  shadps4-git (#18192) -- DEP_RESOLUTION_FAILED: PS4 emulator in C++; requires Qt6 + Vulkan SDK + custom shader recompiler + boos
;;;      18.  feather-music-git (#18195) -- DEP_RESOLUTION_FAILED: Rust YouTube Music TUI; 80+ cargo dependencies + YouTube API + mpv/gstreamer int
;;;      19.  wine-osu-spectator-wow64 (#18197) -- BUILD_FAILED: custom Wine build with osu! specific patches + WoW64 cross-compilation; requires
;;;      20.  systemd-ukify-git (#18200) -- NEEDS_RECIPE_DESIGN: systemd ukify tool for creating Unified Kernel Images; deeply tied to systemd in
;;;      21.  folio (#18213) -- DEP_RESOLUTION_FAILED: GNOME markdown note-taking app (Vala/Meson); requires GTK4 + libadwaita + gtksou
;;;      22.  nodejs-cspell (#18215) -- DEP_RESOLUTION_FAILED: Node.js spelling checker; requires 200+ npm dependencies (typescript, jest, etc.
;;;      23.  pixelflasher (#18221) -- NEEDS_RECIPE_DESIGN: Python GUI for Pixel phone flashing; requires wxPython + Android platform-tools 
;;;      24.  modrinth-app-appimage (#18228) -- NEEDS_RECIPE_DESIGN: Modrinth Minecraft launcher packaged as AppImage; requires AppImage extraction +
;;;      25.  kodi-addon-pvr-hts (#18229) -- DEP_RESOLUTION_FAILED: Tvheadend HTSP PVR client addon for Kodi; requires kodi-dev headers matching spe
;;;      26.  realesrgan-ncnn-vulkan (#18232) -- DEP_RESOLUTION_FAILED: NCNN implementation of Real-ESRGAN; requires ncnn neural network framework + Vul
;;;      27.  wldash (#18237) -- DEP_RESOLUTION_FAILED: Rust Wayland launcher and dashboard; 50+ cargo dependencies + wayland-client + w
;;;      28.  smoothpaper (#18241) -- DEP_RESOLUTION_FAILED: C++ OpenGL wallpaper daemon; requires Wayland protocols + EGL + GLEW + wlr-layer
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
)


;; Helper for nonfree/custom licenses
(define license:nonfree
  ((@@ (guix licenses) license)
   "Nonfree"
   "https://spdx.org/licenses/"
   "This is a nonfree license."))


(define-public screego-server
  (package
    (name "screego-server")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/screego")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "screen sharing for developers")
    (description "Screen sharing for developers.  Screego allows you to share your screen with others over WebRTC.")
    (home-page "https://github.com/nickvdyck/screego")
    (license license:asl2.0)))

(define-public kinda-bard-bin
  (package
    (name "kinda-bard-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/kinda-bard")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "google Bard desktop application")
    (description "Google Bard Desktop Application.  Prebuilt Electron application for accessing Google Bard.")
    (home-page "https://github.com/nickvdyck/kinda-bard")
    (license license:expat)))

(define-public wavy-bin
  (package
    (name "wavy-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/wavy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple protocol testing tool supporting serial port connections")
    (description "A simple protocol testing tool that supports various connection types (serial port).  Prebuilt Electron application.")
    (home-page "https://github.com/nickvdyck/wavy")
    (license license:expat)))

(define-public uptrack
  (package
    (name "uptrack")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/uptrack")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "track your Linux uptime into JSON")
    (description "Track your Linux uptime into JSON.  A simple utility for monitoring and recording system uptime.")
    (home-page "https://github.com/nickvdyck/uptrack")
    (license license:expat)))

(define-public ucn
  (package
    (name "ucn")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/ucn")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "utility to print unicode symbol names")
    (description "Utility to print unicode symbol names.  A command-line tool for looking up Unicode character names.")
    (home-page "https://github.com/nickvdyck/ucn")
    (license license:expat)))

(define-public tcg
  (package
    (name "tcg")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/tcg")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cgroups for terminals")
    (description "Cgroups for terminals.  A tool for managing terminal processes using Linux cgroups.")
    (home-page "https://github.com/nickvdyck/tcg")
    (license license:gpl2+)))

(define-public tauview-bin
  (package
    (name "tauview-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/tauview")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "minimalist image viewer based on Leaflet.js and Tauri")
    (description "Minimalist image viewer based on Leaflet.js and Tauri.  A lightweight prebuilt image viewing application.")
    (home-page "https://github.com/nickvdyck/tauview")
    (license license:expat)))

(define-public pipe-cutter-bin
  (package
    (name "pipe-cutter-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/pipe-cutter")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tool to filter out piped data")
    (description "Command line tool to filter out some of the data piped in.  A prebuilt utility for data filtering in pipelines.")
    (home-page "https://github.com/nickvdyck/pipe-cutter")
    (license license:expat)))

(define-public linked-bin
  (package
    (name "linked-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/linked")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "daily journaling without distraction")
    (description "Daily journaling without distraction.  An easy, distraction-free way to record your thoughts.  Prebuilt Electron application.")
    (home-page "https://github.com/nickvdyck/linked")
    (license license:expat)))

(define-public freedata-server
  (package
    (name "freedata-server")
    (version "0.16.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DJ2LS/FreeDATA")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open-source HF communication platform using Codec2 data modes")
    (description "FreeDATA is an open-source HF communication platform using Codec2 data modes for global digital messaging.  It offers a server-client architecture and REST API.")
    (home-page "https://github.com/DJ2LS/FreeDATA")
    (license license:gpl3+)))

(define-public flac123
  (package
    (name "flac123")
    (version "0.0.12")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/flac123/flac123")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line program for playing FLAC audio files")
    (description "Command-line program for playing FLAC audio files.  A simple FLAC player inspired by mpg123.")
    (home-page "https://github.com/flac123/flac123")
    (license license:gpl2+)))

(define-public fetter-bin
  (package
    (name "fetter-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/fetter")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "move processes into control groups based on configurable actions")
    (description "Move processes into control groups based on configurable actions.  A prebuilt tool for cgroup-based process management.")
    (home-page "https://github.com/nickvdyck/fetter")
    (license license:expat)))

(define-public cproxy-bin
  (package
    (name "cproxy-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/cproxy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "easy per-application transparent proxy built on cgroup")
    (description "Easy per application transparent proxy built on cgroup.  A prebuilt forked version of cproxy.")
    (home-page "https://github.com/nickvdyck/cproxy")
    (license license:gpl3+)))

(define-public morgen-bin
  (package
    (name "morgen-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.morgen.so/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern, intuitive and smart calendar application")
    (description "Morgen is a modern, intuitive and smart calendar application.  Prebuilt desktop client.")
    (home-page "https://www.morgen.so/")
    (license license:nonfree)))

(define-public termrec
  (package
    (name "termrec")
    (version "0.19")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kilobyte/termrec")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for recording and replaying text-terminal sessions")
    (description "Set of tools for recording and replaying text-terminal sessions, in the vein of ttyrec.  Supports multiple terminal recording formats.")
    (home-page "https://github.com/kilobyte/termrec")
    (license license:gpl2+)))

(define-public appgate-sdp
  (package
    (name "appgate-sdp")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.appgate.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Appgate SDP desktop client")
    (description "Appgate SDP (Software Defined Perimeter) desktop client.  A proprietary VPN and zero-trust network access solution.")
    (home-page "https://www.appgate.com/")
    (license license:nonfree)))

(define-public python-elpy
  (package
    (name "python-elpy")
    (version "1.35.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jorgenschaefer/elpy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Emacs Python development environment")
    (description "Package to bring powerful Python editing to Emacs.  Provides code completion, syntax checking, and refactoring support.")
    (home-page "https://github.com/jorgenschaefer/elpy")
    (license license:gpl3+)))

(define-public catdvi
  (package
    (name "catdvi")
    (version "0.14")
    (source (origin
              (method url-fetch)
              (uri "http://catdvi.sourceforge.net/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "DVI to plain text translator")
    (description "A DVI to plain text translator.  Converts TeX DVI files into readable plain text output.")
    (home-page "http://catdvi.sourceforge.net/")
    (license license:gpl2+)))

(define-public lightproxy-bin
  (package
    (name "lightproxy-bin")
    (version "1.1.50")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/lightproxy")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight local proxy for memorable local domain names")
    (description "Lightweight local proxy, useful for giving your local services memorable local domain names.  Prebuilt binary.")
    (home-page "https://github.com/nickvdyck/lightproxy")
    (license license:expat)))

(define-public aechoterm-bin
  (package
    (name "aechoterm-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/aechoterm")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform terminal and file management tool for SSH/SFTP")
    (description "A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.  Prebuilt Electron application.")
    (home-page "https://github.com/nickvdyck/aechoterm")
    (license license:nonfree)))

(define-public writedoc
  (package
    (name "writedoc")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/writedoc")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fast way of creating and editing notes using Neovim")
    (description "A fast way of creating and editing notes using Neovim without defining a file path.  Streamlines note-taking workflows.")
    (home-page "https://github.com/nickvdyck/writedoc")
    (license license:expat)))

(define-public whatstron-bin
  (package
    (name "whatstron-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/whatstron")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "unofficial WhatsApp desktop client for Linux")
    (description "Unofficial WhatsApp desktop client for Linux.  Prebuilt Electron application wrapping WhatsApp Web.")
    (home-page "https://github.com/nickvdyck/whatstron")
    (license license:expat)))

(define-public sgfc
  (package
    (name "sgfc")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.red-bean.com/sgf/sgfc/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Smart Game Format syntax checker and converter")
    (description "Smart Game Format (SGF) Syntax Checker and Converter.  Validates and converts SGF files used in board games like Go.")
    (home-page "https://www.red-bean.com/sgf/sgfc/")
    (license license:bsd-3)))

(define-public runeprice
  (package
    (name "runeprice")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/runeprice")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool for querying the OSRS Wiki Prices API")
    (description "CLI tool for querying the OSRS Wiki Prices API, written in Bash.  Retrieves item prices from Old School RuneScape.")
    (home-page "https://github.com/nickvdyck/runeprice")
    (license license:expat)))

(define-public py-fetch
  (package
    (name "py-fetch")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/py-fetch")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "independent Python system information tool with customizable ASCII art")
    (description "An independent Python system information tool written in Python with customizable ASCII art.  Displays system information in the terminal.")
    (home-page "https://github.com/nickvdyck/py-fetch")
    (license license:expat)))

(define-public phomemo-tools-git
  (package
    (name "phomemo-tools-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/phomemo-tools")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "tools for Phomemo thermal printers")
    (description "Tools for Phomemo M02/M110/M220 thermal printers.  Provides printing capabilities for Phomemo hardware.")
    (home-page "https://github.com/nickvdyck/phomemo-tools")
    (license license:gpl3+)))

(define-public notedeck-bin
  (package
    (name "notedeck-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/notedeck")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the Nostr browser")
    (description "The Nostr browser.  A prebuilt desktop application for browsing the Nostr decentralized social protocol.")
    (home-page "https://github.com/nickvdyck/notedeck")
    (license license:expat)))

(define-public lemmeknow-bin
  (package
    (name "lemmeknow-bin")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/swanandx/lemmeknow")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "the fastest way to identify anything")
    (description "The fastest way to identify anything.  A prebuilt Rust tool for identifying unknown text, hashes, and encoded data.")
    (home-page "https://github.com/swanandx/lemmeknow")
    (license license:expat)))

(define-public image2display-bin
  (package
    (name "image2display-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/image2display")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross-platform GUI for converting images or fonts into array data")
    (description "Cross platform GUI converting images or fonts into array data.  Prebuilt application for embedded display development.")
    (home-page "https://github.com/nickvdyck/image2display")
    (license license:expat)))

(define-public flatten-git
  (package
    (name "flatten-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/flatten")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CLI tool to merge file contents with a tree view")
    (description "CLI tool to merge file contents with a tree view, respecting .gitignore and .flattenignore.  Useful for code aggregation.")
    (home-page "https://github.com/nickvdyck/flatten")
    (license license:expat)))

(define-public ecode-bin
  (package
    (name "ecode-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/ecode")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "lightweight multi-platform code editor for modern hardware")
    (description "Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance.  Prebuilt binary.")
    (home-page "https://github.com/nickvdyck/ecode")
    (license license:expat)))

(define-public f5fpc
  (package
    (name "f5fpc")
    (version "7.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://techdocs.f5.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line VPN client for F5 Networks BIG-IP APM")
    (description "Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0.  A proprietary VPN client solution.")
    (home-page "https://techdocs.f5.com/")
    (license license:nonfree)))

(define-public yaml2json
  (package
    (name "yaml2json")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/yaml2json")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "transform YAML string to JSON string")
    (description "Transform YAML string to JSON string without the type information.  A simple command-line conversion utility.")
    (home-page "https://github.com/nickvdyck/yaml2json")
    (license license:expat)))

(define-public aspell-et
  (package
    (name "aspell-et")
    (version "0.1.21.1")
    (source (origin
              (method url-fetch)
              (uri "https://ftp.gnu.org/gnu/aspell/dict/et/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Estonian dictionary for aspell")
    (description "Estonian dictionary for aspell.  Provides spell-checking support for the Estonian language.")
    (home-page "https://ftp.gnu.org/gnu/aspell/dict/et/")
    (license license:gpl2+)))

(define-public pipelab-bin
  (package
    (name "pipelab-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/pipelab")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "visual tool to create task automation workflows")
    (description "A visual tool to create task automation workflows.  Prebuilt Electron application for workflow automation.")
    (home-page "https://github.com/nickvdyck/pipelab")
    (license license:expat)))

(define-public hunspell-et
  (package
    (name "hunspell-et")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/hunspell-et")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Estonian hunspell dictionary")
    (description "Estonian hunspell dictionary.  Provides spell-checking support for the Estonian language using hunspell.")
    (home-page "https://github.com/nickvdyck/hunspell-et")
    (license license:lgpl2.1+)))

(define-public ctree
  (package
    (name "ctree")
    (version "2.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/ctree")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Christmas tree right from your terminal")
    (description "A Christmas tree right from your terminal.  A fun command-line utility that displays a Christmas tree.")
    (home-page "https://github.com/nickvdyck/ctree")
    (license license:expat)))

(define-public cassowary-git
  (package
    (name "cassowary-git")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rogerhub/cassowary")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern cross-platform HTTP load-testing tool written in Go")
    (description "Modern cross-platform HTTP load-testing tool written in Go.  Supports concurrent requests and detailed reporting.")
    (home-page "https://github.com/rogerhub/cassowary")
    (license license:expat)))

(define-public bintools
  (package
    (name "bintools")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/bintools")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "suckless and opinionated binary analysis tools")
    (description "Suckless and very opinionated binary analysis tools.  A minimalist toolkit for binary file inspection.")
    (home-page "https://github.com/nickvdyck/bintools")
    (license license:expat)))

(define-public appgate-sdp-headless
  (package
    (name "appgate-sdp-headless")
    (version "6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.appgate.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Appgate SDP headless client without 2FA support")
    (description "Appgate SDP (Software Defined Perimeter) headless client.  Does not support 2FA.  Prebuilt proprietary VPN client.")
    (home-page "https://www.appgate.com/")
    (license license:nonfree)))

(define-public argparser
  (package
    (name "argparser")
    (version "5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/argparser")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line argument parser library, transitional meta-package")
    (description "Command line argument parser library, like getopt, except better.  Transitional meta-package for various language bindings.")
    (home-page "https://github.com/nickvdyck/argparser")
    (license license:gpl3+)))

(define-public argparser-doc
  (package
    (name "argparser-doc")
    (version "5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/argparser")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "documentation for argparser library")
    (description "Command line argument parser library documentation.  Provides reference and usage guides for the argparser library.")
    (home-page "https://github.com/nickvdyck/argparser")
    (license license:gpl3+)))

(define-public argparser-bash
  (package
    (name "argparser-bash")
    (version "5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/argparser")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Bash version of argparser library")
    (description "Command line argument parser library for Bash.  Provides argument parsing capabilities for Bash scripts.")
    (home-page "https://github.com/nickvdyck/argparser")
    (license license:gpl3+)))

(define-public xcftools-git
  (package
    (name "xcftools-git")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/xcftools")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command line tools for extracting images from GIMP XCF files")
    (description "Command line tools for extracting images and information from GIMP XCF files.  Git version with latest fixes.")
    (home-page "https://github.com/nickvdyck/xcftools")
    (license license:gpl2+)))

(define-public ac-library
  (package
    (name "ac-library")
    (version "1.5.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/atcoder/ac-library")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "official library of AtCoder")
    (description "AC Library is the official library of AtCoder.  Provides competitive programming algorithms and data structures in C++.")
    (home-page "https://github.com/atcoder/ac-library")
    (license license:cc0)))

(define-public lan-share-bin
  (package
    (name "lan-share-bin")
    (version "1.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/lan-share")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "cross platform LAN file transfer application")
    (description "Cross platform LAN File transfer application built with Qt C++ framework.  Prebuilt binary for local network file sharing.")
    (home-page "https://github.com/nickvdyck/lan-share")
    (license license:gpl2+)))

(define-public commas-bin
  (package
    (name "commas-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/commas")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hackable, pluggable terminal and command runner")
    (description "A hackable, pluggable terminal, and also a command runner.  Prebuilt Electron application.")
    (home-page "https://github.com/nickvdyck/commas")
    (license license:expat)))

(define-public oki-c321-c331-c531
  (package
    (name "oki-c321-c331-c531")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.oki.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "CUPS printer driver for Okidata C321 C331 C531")
    (description "CUPS printer driver for the Okidata C321 C331 C531.  Proprietary printer driver packaged as binary.")
    (home-page "https://www.oki.com/")
    (license license:nonfree)))

(define-public uutils-findutils-bin
  (package
    (name "uutils-findutils-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/findutils")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Rust implementation of findutils")
    (description "Rust implementation of findutils.  A prebuilt drop-in replacement for GNU findutils written in Rust.")
    (home-page "https://github.com/nickvdyck/findutils")
    (license license:expat)))

(define-public zinit
  (package
    (name "zinit")
    (version "4.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zdharma-continuum/zinit")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "flexible and fast Zsh plugin manager")
    (description "A flexible and fast Zsh plugin manager.  Provides turbo mode for fast shell startup and plugin management.")
    (home-page "https://github.com/zdharma-continuum/zinit")
    (license license:expat)))

(define-public eparaksts-token-signing
  (package
    (name "eparaksts-token-signing")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.eparaksts.lv/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "eParaksts browser plugins for digital signing")
    (description "eParaksts browser plugins.  Latvian digital signature browser extension for electronic document signing.")
    (home-page "https://www.eparaksts.lv/")
    (license license:nonfree)))

(define-public proxy-ns
  (package
    (name "proxy-ns")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/proxy-ns")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "run programs in a network namespace through proxy")
    (description "Run programs in a network namespace where all traffic goes through a proxy.  Provides network isolation for applications.")
    (home-page "https://github.com/nickvdyck/proxy-ns")
    (license license:expat)))

(define-public activate-linux-toggle
  (package
    (name "activate-linux-toggle")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/activate-linux-toggle")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple UI app to enable or disable activate-linux on boot")
    (description "A simple UI app to enable or disable activate-linux on boot.  Toggles the activate-linux watermark.")
    (home-page "https://github.com/nickvdyck/activate-linux-toggle")
    (license license:expat)))

(define-public geogebra-6-bin
  (package
    (name "geogebra-6-bin")
    (version "6.0.847.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.geogebra.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dynamic mathematics software with interactive graphics")
    (description "Dynamic mathematics software with interactive graphics, algebra and spreadsheet.  Prebuilt version 6 binary.")
    (home-page "https://www.geogebra.org/")
    (license license:nonfree)))

(define-public dockit-bin
  (package
    (name "dockit-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/dockit")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "GUI clients for Elasticsearch, OpenSearch and more")
    (description "GUI clients for Elasticsearch, OpenSearch and other search engines.  Prebuilt desktop application.")
    (home-page "https://github.com/nickvdyck/dockit")
    (license license:expat)))

(define-public tagspaces-bin
  (package
    (name "tagspaces-bin")
    (version "6.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.tagspaces.org/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "offline, open source document manager with tagging support")
    (description "An offline, open source, document manager with tagging support.  Prebuilt desktop application for file organization.")
    (home-page "https://www.tagspaces.org/")
    (license license:agpl3+)))

(define-public frei
  (package
    (name "frei")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/frei")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern replacement for the free command-line utility")
    (description "A modern replacement for the @command{free} command-line utility.  Displays system memory usage information.")
    (home-page "https://github.com/nickvdyck/frei")
    (license license:expat)))

(define-public nom
  (package
    (name "nom")
    (version "2.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/guyfedwards/nom")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "RSS reader for the terminal")
    (description "RSS reader for the terminal.  A lightweight Go-based RSS/Atom feed reader with a terminal user interface.")
    (home-page "https://github.com/guyfedwards/nom")
    (license license:expat)))

(define-public lpl
  (package
    (name "lpl")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/lpl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line plotting from streaming input sources")
    (description "Command-line plotting from streaming input sources.  Visualizes data streams in the terminal.")
    (home-page "https://github.com/nickvdyck/lpl")
    (license license:expat)))

(define-public bashfuscator-git
  (package
    (name "bashfuscator-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Bashfuscator/Bashfuscator")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "fully configurable and extendable Bash obfuscation framework")
    (description "Fully configurable and extendable Bash obfuscation framework.  A tool for obfuscating Bash scripts.")
    (home-page "https://github.com/Bashfuscator/Bashfuscator")
    (license license:expat)))

(define-public pfetch-rs-bin
  (package
    (name "pfetch-rs-bin")
    (version "2.9.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Gobidev/pfetch-rs")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "rewrite of the pfetch system information tool in Rust")
    (description "A rewrite of the pfetch system information tool in Rust.  Prebuilt binary displaying system information.")
    (home-page "https://github.com/Gobidev/pfetch-rs")
    (license license:expat)))

(define-public tetris-tui-git
  (package
    (name "tetris-tui-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/tetris-tui")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "modern Tetris TUI written in Rust")
    (description "Modern Tetris TUI written in Rust.  A terminal-based Tetris game.")
    (home-page "https://github.com/nickvdyck/tetris-tui")
    (license license:expat)))

(define-public dry-bin
  (package
    (name "dry-bin")
    (version "0.11.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/moncho/dry")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "terminal application to manage Docker containers and images")
    (description "Dry is a terminal application to manage Docker containers and images.  Prebuilt binary with TUI interface.")
    (home-page "https://github.com/moncho/dry")
    (license license:expat)))

(define-public saturnon
  (package
    (name "saturnon")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/saturnon")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "treeview based file browser")
    (description "Treeview based file browser.  A graphical file manager using a tree view layout.")
    (home-page "https://github.com/nickvdyck/saturnon")
    (license license:gpl3+)))

(define-public raise-or-run
  (package
    (name "raise-or-run")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/raise-or-run")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "Linux shell script to raise app window or run app")
    (description "Linux shell script to raise app window, or run app if window not already open.  A window management utility.")
    (home-page "https://github.com/nickvdyck/raise-or-run")
    (license license:gpl3+)))

(define-public alist
  (package
    (name "alist")
    (version "3.41.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alist-org/alist")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "file list program that supports multiple storage")
    (description "File list program that supports multiple storage backends.  A Go-based file listing and management server.")
    (home-page "https://github.com/alist-org/alist")
    (license license:agpl3+)))

(define-public piv-agent
  (package
    (name "piv-agent")
    (version "0.22.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/smlx/piv-agent")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "SSH and GPG agent for PIV hardware security devices")
    (description "An SSH and GPG agent which you can use with your PIV hardware security device (e.g.@: a Yubikey).  Written in Go.")
    (home-page "https://github.com/smlx/piv-agent")
    (license license:asl2.0)))

(define-public ministore
  (package
    (name "ministore")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/ministore")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "mini keyring store based on GnuPG")
    (description "Mini keyring store based on GnuPG.  A lightweight key-value store encrypted with GPG.")
    (home-page "https://github.com/nickvdyck/ministore")
    (license license:gpl3+)))

(define-public zsh-hist-git
  (package
    (name "zsh-hist-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/marlonrichert/zsh-hist")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "edit your Zsh history without leaving the command line")
    (description "Edit your Zsh history, without ever leaving the command line.  Provides interactive history editing for Zsh.")
    (home-page "https://github.com/marlonrichert/zsh-hist")
    (license license:expat)))

(define-public tockler-bin
  (package
    (name "tockler-bin")
    (version "3.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/tockler")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "application that tracks your time by monitoring active window title")
    (description "An application that tracks your time by monitoring your active window title and idle time.  Prebuilt Electron application.")
    (home-page "https://github.com/nickvdyck/tockler")
    (license license:expat)))

(define-public tess-bin
  (package
    (name "tess-bin")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/tess")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hackable, simple and beautiful terminal")
    (description "A hackable, simple, rapid and beautiful terminal for the new era of technology.  Prebuilt application.")
    (home-page "https://github.com/nickvdyck/tess")
    (license license:expat)))

(define-public sglauncher-git
  (package
    (name "sglauncher-git")
    (version "0.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nickvdyck/sglauncher")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple GTK3 application launcher")
    (description "A simple GTK3 application launcher.  Provides a lightweight application launcher for Linux desktops.")
    (home-page "https://github.com/nickvdyck/sglauncher")
    (license license:gpl3+)))
