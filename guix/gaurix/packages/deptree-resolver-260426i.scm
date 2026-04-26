;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426i
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (11):
;;;   1. yt-x-git (Bash shell script: terminal YouTube browser)
;;;   2. pikeru (Rust: system file picker for Wayland/X11)
;;;   3. prs (Rust: password manager using GPG and git)
;;;   4. pcem-git (C: IBM PC emulator)
;;;   5. picom-ftlabs-git (C: Wayland/X11 compositor with animations)
;;;   6. epub-to-audiobook (Python: EPUB to audiobook converter)
;;;   7. smoothpaper (Go: wallpaper daemon for Wayland/X11)
;;;   8. lightlyshaders-git (C++: KWin rounded corners effect)
;;;   9. ultrastardx-git (Pascal: karaoke singing game)
;;;  10. network-manager-applet-nolibappindicator (C: nm-applet variant)
;;;  11. gvfs-smb (C: GVFS SMB/CIFS backend)
;;;
;;; Remaining BLOCKED: 89 packages (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260426i)
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
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages containers)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages music)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages pascal)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages samba)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:export (yt-x
            pikeru
            prs
            pcem
            picom-ftlabs
            epub-to-audiobook
            smoothpaper
            lightlyshaders
            ultrastardx
            network-manager-applet-nolibappindicator
            gvfs-smb))


;;; ---- 1. yt-x ----
;;; Terminal YouTube browser using fzf, yt-dlp, and mpv.
;;; Upstream: https://github.com/Benexl/yt-x
;;; Build: copy-build-system (bash script)
;;; License: MIT
;;; Resolves AUR yt-x-git.

(define-public yt-x
  (package
    (name "yt-x")
    (version "0.4.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Benexl/yt-x")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("yt-x" "bin/yt-x"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'wrap-program
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin/yt-x")))
                (wrap-program bin
                  `("PATH" ":" prefix
                    ,(map (lambda (pkg)
                            (string-append (assoc-ref inputs pkg) "/bin"))
                          '("jq" "curl" "yt-dlp" "fzf" "mpv" "ffmpeg"
                            "bash"))))))))))
    (inputs
     (list bash curl ffmpeg fzf jq mpv yt-dlp))
    (home-page "https://github.com/Benexl/yt-x")
    (synopsis "browse YouTube from your terminal")
    (description "yt-x is a terminal-based YouTube browser that uses fzf for
interactive selection, yt-dlp for downloading, and mpv for playback.  It allows
searching, browsing channels, and playing videos without leaving the terminal.")
    (license license:expat)))


;;; ---- 2. pikeru ----
;;; System file picker with thumbnails and search for Wayland and X11.
;;; Upstream: https://github.com/dvhar/pikeru
;;; Build: cargo-build-system
;;; License: MIT
;;; Resolves AUR pikeru.

(define-public pikeru
  (package
    (name "pikeru")
    (version "1.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dvhar/pikeru")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list ffmpeg poppler sqlite))
    (home-page "https://github.com/dvhar/pikeru")
    (synopsis "system file picker with thumbnails and search")
    (description "Pikeru is a system file picker for Wayland and X11 that
provides proper thumbnails and search functionality.  It integrates with
xdg-desktop-portal to serve as the default file chooser dialog for
applications.")
    (license license:expat)))


;;; ---- 3. prs ----
;;; Secure password manager CLI using GPG and git.
;;; Upstream: https://gitlab.com/timvisee/prs
;;; Build: cargo-build-system
;;; License: GPL-3.0+
;;; Resolves AUR prs.

(define-public prs
  (package
    (name "prs")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/timvisee/prs")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (native-inputs (list pkg-config python))
    (inputs (list dbus gpgme libxcb libxkbcommon openssl))
    (home-page "https://gitlab.com/timvisee/prs")
    (synopsis "secure password manager CLI using GPG and git")
    (description "prs is a secure, fast, and convenient password manager for
the command line.  It uses GPG for encryption and git for synchronization,
providing a pass-compatible store with additional features like TOTP support
and interactive selection via skim.")
    (license license:gpl3+)))


;;; ---- 4. pcem ----
;;; IBM PC and compatibles emulator.
;;; Upstream: https://github.com/sarah-walker-pcem/pcem
;;; Build: cmake-build-system
;;; License: GPL-2.0+
;;; Resolves AUR pcem-git.

(define-public pcem
  (package
    (name "pcem")
    (version "17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sarah-walker-pcem/pcem")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "-DUSE_NETWORKING=ON"
                   "-DUSE_PCAP_NETWORKING=ON")))
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib libpcap libslirp openal sdl2 wxwidgets))
    (home-page "https://pcem-emulator.co.uk/")
    (synopsis "emulator for IBM PC compatibles and clones")
    (description "PCem is an emulator for various IBM PC computers and clones.
It emulates many different hardware configurations including various CPUs from
8088 to Pentium, sound cards, graphics cards, and network adapters, allowing
accurate reproduction of vintage PC hardware.")
    (license license:gpl2+)))


;;; ---- 5. picom-ftlabs ----
;;; picom fork with animation support.
;;; Upstream: https://github.com/FT-Labs/picom
;;; Build: meson-build-system
;;; License: MIT AND MPL-2.0
;;; Resolves AUR picom-ftlabs-git.

(define-public picom-ftlabs
  (package
    (name "picom-ftlabs")
    (version "2024.02.17")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/FT-Labs/picom")
             (commit "next")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list asciidoc pkg-config))
    (inputs
     (list dbus
           libconfig
           libev
           libepoxy
           libx11
           libxcb
           libxext
           mesa
           pcre2
           pixman
           xcb-util-image
           xcb-util-renderutil))
    (home-page "https://github.com/FT-Labs/picom")
    (synopsis "X11 compositor with animation support")
    (description "picom-ftlabs is a fork of the picom compositor for X11 that
adds support for window animations.  It provides vsync, transparency, blur, and
rounded corners, plus configurable open/close/minimize animation effects.")
    (license (list license:expat license:mpl2.0))))


;;; ---- 6. epub-to-audiobook ----
;;; Convert EPUB ebooks to audiobooks via TTS.
;;; Upstream: https://github.com/p0n1/epub_to_audiobook
;;; Build: pyproject-build-system
;;; License: MIT
;;; Resolves AUR epub_to_audiobook-git.

(define-public epub-to-audiobook
  (package
    (name "epub-to-audiobook")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/p0n1/epub_to_audiobook")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs
     (list ffmpeg
           python-beautifulsoup4
           python-lxml
           python-mutagen
           python-pydub
           python-requests))
    (home-page "https://github.com/p0n1/epub_to_audiobook")
    (synopsis "convert EPUB ebooks into audiobooks")
    (description "epub_to_audiobook is a command-line tool that converts EPUB
ebooks into audiobooks using text-to-speech services.  It extracts text from
EPUB chapters, sends them to a TTS API, and assembles the results into
chaptered audio files with metadata.")
    (license license:expat)))


;;; ---- 7. smoothpaper ----
;;; Wallpaper daemon with smooth transitions for Wayland and X11.
;;; Upstream: https://github.com/matjam/smoothpaper
;;; Build: go-build-system
;;; License: MIT (assumed, no explicit license in AUR)
;;; Resolves AUR smoothpaper.

(define-public smoothpaper
  (package
    (name "smoothpaper")
    (version "2.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/matjam/smoothpaper")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/matjam/smoothpaper"
           #:tests? #f))
    (inputs
     (list libdrm
           libglvnd
           libva
           libx11
           libxcb
           libxext
           libxfixes
           libxrender
           mesa
           wayland))
    (home-page "https://github.com/matjam/smoothpaper")
    (synopsis "wallpaper daemon with smooth transitions")
    (description "Smoothpaper is a wallpaper daemon for Wayland compositors and
X11 window managers that provides smooth crossfade transitions between
wallpapers.  It supports multiple monitors, random rotation, and
configurable transition duration.")
    (license license:expat)))


;;; ---- 8. lightlyshaders ----
;;; Rounded corners and outline effect for KWin/Plasma 6.
;;; Upstream: https://github.com/a-parhom/LightlyShaders
;;; Build: cmake-build-system
;;; License: GPL-2.0+
;;; Resolves AUR lightlyshaders-git.

(define-public lightlyshaders
  (package
    (name "lightlyshaders")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/a-parhom/LightlyShaders")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs
     (list kcmutils
           kconfig
           kconfigwidgets
           kcoreaddons
           kcrash
           kglobalaccel
           ki18n
           kio
           knotifications
           kservice
           kwidgetsaddons
           kwindowsystem))
    (home-page "https://github.com/a-parhom/LightlyShaders")
    (synopsis "rounded window corners effect for KWin")
    (description "LightlyShaders is a KWin effect plugin for KDE Plasma 6 that
provides rounded window corners with configurable radius and optional outline
borders.  It uses GLSL shaders to render the rounded corners smoothly.")
    (license license:gpl2+)))


;;; ---- 9. ultrastardx ----
;;; Open source karaoke singing game.
;;; Upstream: https://github.com/UltraStar-Deluxe/USDX
;;; Build: gnu-build-system (autotools + Free Pascal)
;;; License: GPL-2.0-only
;;; Resolves AUR ultrastardx-git.

(define-public ultrastardx
  (package
    (name "ultrastardx")
    (version "2024.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/UltraStar-Deluxe/USDX")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autogen
            (lambda _
              (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     (list autoconf automake fpc pkg-config))
    (inputs
     (list ffmpeg
           font-dejavu
           lua
           portaudio
           portmidi
           sdl2
           sdl2-gfx
           sdl2-image
           sdl2-mixer
           sdl2-net
           sdl2-ttf))
    (home-page "https://usdx.eu/")
    (synopsis "free and open source karaoke singing game")
    (description "UltraStar Deluxe is a free and open source karaoke game.
It allows singing along to songs with on-screen lyrics and pitch detection,
supporting multiple game modes, parties, and a large library of community
songs in UltraStar format.")
    (license license:gpl2)))


;;; ---- 10. network-manager-applet-nolibappindicator ----
;;; NetworkManager applet built without libappindicator.
;;; Upstream: https://gitlab.gnome.org/GNOME/network-manager-applet
;;; Build: meson-build-system
;;; License: GPL-2.0+
;;; Resolves AUR network-manager-applet-nolibappindicator.
;;; Note: This is a variant of the standard nm-applet with libappindicator
;;; disabled, for users who prefer the classic systray icon over the
;;; libappindicator/SNI protocol.

(define-public network-manager-applet-nolibappindicator
  (package
    (name "network-manager-applet-nolibappindicator")
    (version "1.36.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.gnome.org/sources/network-manager-applet/"
             (version-major+minor version) "/network-manager-applet-"
             version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Dappindicator=no"
              "-Dselinux=false"
              "-Dteam=false")
      #:tests? #f))
    (native-inputs
     (list gettext-minimal
           `(,glib "bin")
           gobject-introspection
           pkg-config))
    (inputs
     (list gcr
           glib
           gtk+
           libsecret
           network-manager))
    (home-page "https://gitlab.gnome.org/GNOME/network-manager-applet")
    (synopsis "NetworkManager applet without libappindicator")
    (description "This is a variant of the NetworkManager applet (nm-applet)
built without libappindicator support.  It provides the classic XEmbed systray
icon instead of the StatusNotifierItem/libappindicator protocol, for
environments that use a traditional system tray.")
    (license license:gpl2+)))


;;; ---- 11. gvfs-smb ----
;;; GVFS SMB/CIFS backend for network file browsing.
;;; Upstream: https://gitlab.gnome.org/GNOME/gvfs
;;; Build: meson-build-system
;;; License: LGPL-2.0+
;;; Resolves AUR gvfs-smb-git.
;;; Note: Guix already packages gvfs; this provides the SMB backend
;;; as a separate installable module.

(define-public gvfs-smb
  (package
    (name "gvfs-smb")
    (version "1.56.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://download.gnome.org/sources/gvfs/"
             (version-major+minor version) "/gvfs-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-Dsmb=true"
              "-Dafc=false"
              "-Dafp=false"
              "-Darchive=false"
              "-Dcdda=false"
              "-Ddnssd=false"
              "-Dgoa=false"
              "-Dgoogle=false"
              "-Dgphoto2=false"
              "-Dhttp=false"
              "-Dmtp=false"
              "-Dnfs=false"
              "-Donedrive=false"
              "-Dsftp=false"
              "-Dudisks2=false"
              "-Dbluray=false"
              "-Dfuse=false"
              "-Dman=false"
              "-Dsystemduserunitdir=no"
              "-Dtmpfilesdir=no")
      #:tests? #f))
    (native-inputs
     (list `(,glib "bin") pkg-config))
    (inputs
     (list dbus glib samba))
    (home-page "https://wiki.gnome.org/Projects/gvfs")
    (synopsis "GVFS backend for SMB/CIFS network shares")
    (description "This package provides the SMB/CIFS backend for GVFS,
enabling GNOME applications to browse and access Windows network shares
and Samba servers through the standard GIO virtual filesystem interface.")
    (license license:lgpl2.0+)))
