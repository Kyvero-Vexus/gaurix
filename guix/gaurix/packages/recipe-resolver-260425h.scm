;; -*- mode: scheme; coding: utf-8 -*-
;;; recipe-resolver-260425h: 100 packages attempted (100 recipes, 0 BLOCKED)
;;; Generated from AUR PKGBUILDs via queue-drain pass.

(define-module (gaurix packages recipe-resolver-260425h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:export (
   catppuccinifier-bin
   pipr-bin
   houdoku-bin
   qbittorrent-enhanced-nox-bin
   clipboard-bin
   semgrep-bin
   netpad-bin
   autorestic-bin
   colorpicker-app-bin
   skychart-bin
   websocketd-bin
   vhs-bin
   webcatalog-bin
   rclone-beta-bin
   memospot-bin
   hexpick-bin
   deadbolt-bin
   combaud-bin
   kunkun-bin
   cgpt-bin
   appimagetool-bin
   portfolio-performance-bin
   noseyparker-bin
   gitify-bin
   greptimedb-bin
   namida-bin
   mmv-go-bin
   librewolf-extension-plasma-integration-bin
   fillin-bin
   diffcatcher-bin
   codemux-bin
   balena-etcher-bin
   jextract-bin
   k6-studio-bin
   go-hass-agent-bin
   mapcidr-bin
   nteract-bin
   n-m3u8dl-re-bin
   sui-bin
   android-knot-bin
   dagtoc-bin
   realesrgan-ncnn-vulkan-bin
   rash-bin
   rstudio-server-bin
   ssa-bin
   amdguid-wayland-bin
   teamide-bin
   pshash-bin
   slic3r-bin
   describe-commit-bin
   caesium-image-compressor-bin
   netron-bin
   winegui-bin
   distroav-bin
   epyrus-bin
   yt-bin
   buckets-bin
   calendar-bin
   lvce-bin
   transformerlab-bin
   cassette-bin
   buildcache-bin
   86box-manager-bin
   teleport-bin
   whalebird-bin
   ipfs-desktop-bin
   iortcw-bin
   apple-music-bin
   d0phamine-music-player-bin
   shijima-qt-bin
   yank-note-bin
   hyper-bin
   inputplumber-bin
   trufflehog-bin
   nvrs-bin
   note-gen-bin
   gex-bin
   delta-walker-bin
   jqp-bin
   musicat-bin
   arnis-bin
   iceshrimp-net-bin
   meowpad-configurator-v2-bin
   cinc-workstation-bin
   inform7-ide-bin
   androidscreencast-bin
   universal-gcode-sender-bin
   mullvad-vpn-beta-bin
   stremio-web-desktop-bin
   mpdris-bin
   gameclock-bin
   jqsh-bin
   openrocket-beta-bin
   secondlife-bin
   lantern-bin
   heaven-studio-nightly-bin
   powder-toy-jacob1-bin
   chia-bin
   wolai-appimage
   pico-8))


;;; catppuccinifier-bin — an application to catppuccinifiy your images
(define-public catppuccinifier-bin
  (package
    (name "catppuccinifier-bin")
    (version "9.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/lighttigerXIV/catppuccinifier/releases/download/" version "/Catppuccinifier-Linux-" version ".tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("catppuccinifier" "bin/catppuccinifier"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/lighttigerXIV/catppuccinifier")
    (synopsis "Application to catppuccinifiy your images")
    (description "An application to catppuccinifiy your images.")
    (license #f)))


;;; pipr-bin — a commandline-utility to interactively build complex shell pipelines
(define-public pipr-bin
  (package
    (name "pipr-bin")
    (version "0.0.16")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//pipr/releases/download/v0.0.16/pipr")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pipr" "bin/pipr"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "pipr")
              (chmod "pipr" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/elkowar/pipr")
    (synopsis "Commandline-utility to interactively build complex shell pipelines")
    (description "A commandline-utility to interactively build complex shell pipelines.")
    (license license:expat)))


;;; houdoku-bin — manga reader and library manager for the desktop
(define-public houdoku-bin
  (package
    (name "houdoku-bin")
    (version "2.16.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/xgi/houdoku/v2.16.0/LICENSE.txt")
       (sha256
        (base32 "1s4hf9fkrb2yq5nd2szjp3g02254z6midd57zr2xhwxsjavzrmrz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("houdoku" "bin/houdoku"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "houdoku")
              (chmod "houdoku" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://houdoku.org/")
    (synopsis "Manga reader and library manager for the desktop")
    (description "Manga reader and library manager for the desktop.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; qbittorrent-enhanced-nox-bin — a bittorrent client powered by C++, Qt and the good libtorrent library...
(define-public qbittorrent-enhanced-nox-bin
  (package
    (name "qbittorrent-enhanced-nox-bin")
    (version "5.1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-5.1.2.10/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip")
       (sha256
        (base32 "19x9v9h45xwn1nz212j7yqy6mpz7s3jyjzww8rfhasy5nrg680wj"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("qbittorrent-enhanced-nox" "bin/qbittorrent-enhanced-nox"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/c0re100/qBittorrent-Enhanced-Edition")
    (synopsis "Bittorrent client powered by C++, Qt and the good libtorrent library")
    (description "A bittorrent client powered by C++, Qt and the good libtorrent library (Enhanced Edition).")
    (license #f)))


;;; clipboard-bin — cut, copy, and paste anything in your terminal 
(define-public clipboard-bin
  (package
    (name "clipboard-bin")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Slackadays/Clipboard/releases/download/0.10.0/clipboard-bin%-bin}-linux-amd64.zip")
       (sha256
        (base32 "0h8lb58vy9cd2vfzcfdar7dqphr2c53dacxrbsaa05pfbb0599i3"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("clipboard" "bin/clipboard"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://getclipboard.app")
    (synopsis "Cut, copy, and paste anything in your terminal")
    (description "Cut, copy, and paste anything in your terminal (binary version).")
    (license license:gpl3+)))


;;; semgrep-bin — lightweight static analysis for many languages. Find bug variants with...
(define-public semgrep-bin
  (package
    (name "semgrep-bin")
    (version "1.161.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.pythonhosted.org/packages////")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("semgrep" "bin/semgrep"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "semgrep")
              (chmod "semgrep" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/returntocorp/semgrep")
    (synopsis "Lightweight static analysis for many languages. Find bug variants with")
    (description "Lightweight static analysis for many languages.  Find bug variants with patterns that look like source code.")
    (license license:gpl3+)))


;;; netpad-bin — a cross-platform C# editor and playground
(define-public netpad-bin
  (package
    (name "netpad-bin")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/tareqimbasher/NetPad/v0.12.0/LICENSE")
       (sha256
        (base32 "1mgjcxg4yq3hk3lg1pi187q282rj0x5sss7s2wra8y3zaz7vd9fj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("netpad" "bin/netpad"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "netpad")
              (chmod "netpad" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tareqimbasher/NetPad")
    (synopsis "Cross-platform C# editor and playground")
    (description "A cross-platform C# editor and playground.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; autorestic-bin — high level CLI utility for restic
(define-public autorestic-bin
  (package
    (name "autorestic-bin")
    (version "1.8.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/cupcakearmy/autorestic-bin%-bin}")
       (sha256
        (base32 "0ing3qkrpm59368gia236p555gx3m1l8i17ysd5bk2y77ljm5kib"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("autorestic" "bin/autorestic"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "autorestic")
              (chmod "autorestic" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/cupcakearmy/autorestic")
    (synopsis "High level CLI utility for restic")
    (description "High level CLI utility for restic.")
    (license license:asl2.0)))


;;; colorpicker-app-bin — a mininal but complete colorpicker desktop app
(define-public colorpicker-app-bin
  (package
    (name "colorpicker-app-bin")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://colorpicker.fr/")
       (sha256
        (base32 "1n62yd2qh2bxn0y9jy081m8hq98rdi3cv522ix9my6bdnv49b99r"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("colorpicker-app" "bin/colorpicker-app"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "colorpicker-app")
              (chmod "colorpicker-app" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://colorpicker.fr/")
    (synopsis "Mininal but complete colorpicker desktop app")
    (description "A mininal but complete colorpicker desktop app.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; skychart-bin — free software to draw sky charts, also known as Cartes du Ciel
(define-public skychart-bin
  (package
    (name "skychart-bin")
    (version "4.2.1")
    (source
     (origin
       (method url-fetch)
       (uri "http://sourceforge.net/projects/skychart/files/1-software/version_4.2.1/skychart-4.2.1-4073-linux_")
       (sha256
        (base32 "0825dl1pqi5nyq9q0rssra2pr12ra6y4h8ilax82q277ysfx3wgw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("skychart" "bin/skychart"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "skychart")
              (chmod "skychart" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.ap-i.net/skychart/start")
    (synopsis "Free software to draw sky charts, also known as Cartes du Ciel")
    (description "Free software to draw sky charts, also known as Cartes du Ciel.")
    (license license:gpl2+)))


;;; websocketd-bin — like inetd, but for WebSockets. Turn any application that uses...
(define-public websocketd-bin
  (package
    (name "websocketd-bin")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//")
       (sha256
        (base32 "147qsmpa6hs4j31knxi4z41y2v95byad7ylrhil3qq5m5di18b2c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("websocketd" "bin/websocketd"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "websocketd")
              (chmod "websocketd" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/barakplasma/websocketd")
    (synopsis "Like inetd, but for WebSockets. Turn any application that uses")
    (description "Like inetd, but for WebSockets.  Turn any application that uses STDIO/STDOUT into a WebSocket server.")
    (license license:bsd-2)))


;;; vhs-bin — a tool for recording terminal GIFs
(define-public vhs-bin
  (package
    (name "vhs-bin")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/charmbracelet/vhs/releases/download/v0.11.0/vhs_0.11.0_Linux_x86_64.tar.gz")
       (sha256
        (base32 "02ahxsvqq7hspgzagq4zz4kqq11s1jw7sdzaq5rh9bpahx2n7jwr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("vhs" "bin/vhs"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://charm.land/")
    (synopsis "Tool for recording terminal GIFs")
    (description "A tool for recording terminal GIFs.")
    (license license:expat)))


;;; webcatalog-bin — turn Any Websites into Real Desktop Apps
(define-public webcatalog-bin
  (package
    (name "webcatalog-bin")
    (version "74.0.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://cdn-2.webcatalog.io/webcatalog/WebCatalog-74.0.2.AppImage")
       (sha256
        (base32 "1m23w6k8h623nwzwpx00jhd2lhjz5dqqn818addbrvvza2b5g8ws"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("webcatalog" "bin/webcatalog"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "webcatalog")
              (chmod "webcatalog" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://webcatalog.io/webcatalog/")
    (synopsis "Turn Any Websites into Real Desktop Apps")
    (description "Turn Any Websites into Real Desktop Apps.")
    (license #f)))


;;; rclone-beta-bin — sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and...
(define-public rclone-beta-bin
  (package
    (name "rclone-beta-bin")
    (version "1.74.0_beta.9664.96760f1c1")
    (source
     (origin
       (method url-fetch)
       (uri "https://beta.rclone.org/v/rclone-v-linux-amd64.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("rclone-beta" "bin/rclone-beta"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://beta.rclone.org/")
    (synopsis "Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and")
    (description "Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage.  (Beta version).")
    (license license:expat)))


;;; memospot-bin — self-contained desktop version of Memos -a privacy-first, lightweight...
(define-public memospot-bin
  (package
    (name "memospot-bin")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/memospot/memospot/v1.0.3/LICENSE.md")
       (sha256
        (base32 "0nzgmsjr9j4b6y25z38l3spscnlg31888mby53f56b1rkwbngjyb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("memospot" "bin/memospot"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "memospot")
              (chmod "memospot" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://memospot.github.io/")
    (synopsis "Self-contained desktop version of Memos -a privacy-first, lightweight")
    (description "Self-contained desktop version of Memos -a privacy-first, lightweight note-taking service.(Prebuilt version).")
    (license #f)))


;;; hexpick-bin — a simple color picker app for Linux
(define-public hexpick-bin
  (package
    (name "hexpick-bin")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/KartoffelChipss/HexPick")
       (sha256
        (base32 "0lal7l6lwf6wzy64cclab2l2cila47wllnj248i40h2li8gmic84"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("hexpick" "bin/hexpick"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "hexpick")
              (chmod "hexpick" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KartoffelChipss/HexPick")
    (synopsis "Simple color picker app for Linux")
    (description "A simple color picker app for Linux.")
    (license license:gpl3)))


;;; deadbolt-bin — dead-simple file encryption for any OS
(define-public deadbolt-bin
  (package
    (name "deadbolt-bin")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/alichtman/deadbolt/v2.1.1/LICENSE")
       (sha256
        (base32 "1ak50v6qv9b40w0ip58k0lqfpy9z5bzh5i9wslns1wi0r92bgn6c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("deadbolt" "bin/deadbolt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "deadbolt")
              (chmod "deadbolt" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/alichtman/deadbolt")
    (synopsis "Dead-simple file encryption for any OS")
    (description "Dead-simple file encryption for any OS.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; combaud-bin — broadcasting audio output from applications to a virtual microphone
(define-public combaud-bin
  (package
    (name "combaud-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//combaud")
       (sha256
        (base32 "0ivpqa1z7r5k5m0zhp01i0lv5zhxxpraqg48wbsyf26r9x94f4kx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("combaud" "bin/combaud"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "combaud")
              (chmod "combaud" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/VHSgunzo/combaud")
    (synopsis "Broadcasting audio output from applications to a virtual microphone")
    (description "Broadcasting audio output from applications to a virtual microphone.")
    (license license:expat)))


;;; kunkun-bin — an open source, cross-platform, extensible app launcher
(define-public kunkun-bin
  (package
    (name "kunkun-bin")
    (version "0.1.37")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/kunkunsh/kunkun/releases/download/Kunkun-v0.1.37/kunkun_0.1.37_amd64.deb")
       (sha256
        (base32 "1yjb9mlvi0hlj7mx73ias891p1cpjfgs0wzqajvpra6shwhbv0pm"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("kunkun" "bin/kunkun"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kunkun.sh/")
    (synopsis "Open source, cross-platform, extensible app launcher")
    (description "An open source, cross-platform, extensible app launcher.")
    (license #f)))


;;; cgpt-bin — gPT manipulation tool with support for Chromium OS extensions
(define-public cgpt-bin
  (package
    (name "cgpt-bin")
    (version "15054.B")
    (source
     (origin
       (method url-fetch)
       (uri "https://files.tree123.org/utils/x86_64/gnu/cgpt")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("cgpt" "bin/cgpt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "cgpt")
              (chmod "cgpt" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://chromium.googlesource.com/chromiumos/platform/vboot_reference/")
    (synopsis "GPT manipulation tool with support for Chromium OS extensions")
    (description "GPT manipulation tool with support for Chromium OS extensions.")
    (license license:bsd-3)))


;;; appimagetool-bin — package desktop applications as AppImages
(define-public appimagetool-bin
  (package
    (name "appimagetool-bin")
    (version "r67.aa0b7dc")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/AppImage/appimagetool")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("appimagetool" "bin/appimagetool"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "appimagetool")
              (chmod "appimagetool" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AppImage/appimagetool")
    (synopsis "Package desktop applications as AppImages")
    (description "Package desktop applications as AppImages.")
    (license license:expat)))


;;; portfolio-performance-bin — a simple tool to calculate the overall performance of an investment portfolio
(define-public portfolio-performance-bin
  (package
    (name "portfolio-performance-bin")
    (version "0.83.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/portfolio-performance/portfolio/releases/download/0.83.2/PortfolioPerformance-0.83.2-linux.gtk..tar.gz")
       (sha256
        (base32 "1ygcnfr3c4xj0k4lnkjbsjxhxmmqa6kkmblrpjap8jkkrxma96jq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("portfolio-performance" "bin/portfolio-performance"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.portfolio-performance.info")
    (synopsis "Simple tool to calculate the overall performance of an investment portfolio")
    (description "A simple tool to calculate the overall performance of an investment portfolio.")
    (license license:epl1.0)))


;;; noseyparker-bin — find secrets and sensitive information in textual data and Git history
(define-public noseyparker-bin
  (package
    (name "noseyparker-bin")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/praetorian-inc/noseyparker")
       (sha256
        (base32 "0g0zv80zpgcc2pyjgkysk80ipq0baz2i9a4m376sg1p8djh4xl0v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("noseyparker" "bin/noseyparker"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "noseyparker")
              (chmod "noseyparker" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/praetorian-inc/noseyparker")
    (synopsis "Find secrets and sensitive information in textual data and Git history")
    (description "Find secrets and sensitive information in textual data and Git history.")
    (license license:asl2.0)))


;;; gitify-bin — GitHub notifications on your menu bar
(define-public gitify-bin
  (package
    (name "gitify-bin")
    (version "6.19.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/gitify-app/gitify/v6.19.0/LICENSE")
       (sha256
        (base32 "156j61v6bhpkfs6454zj3bl7qq31x0lrz7fla48l0g11wl5m44bq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("gitify" "bin/gitify"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "gitify")
              (chmod "gitify" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.gitify.io/")
    (synopsis "GitHub notifications on your menu bar")
    (description "GitHub notifications on your menu bar.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; greptimedb-bin — open-source time-series database
(define-public greptimedb-bin
  (package
    (name "greptimedb-bin")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/GreptimeTeam/greptimedb/releases/download//greptime-linux-amd64-.tar.gz")
       (sha256
        (base32 "0489z6l5502j55rh6xs4v8xdpw04g3kkrj7a7a3anbi4l3swrxbw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("greptimedb" "bin/greptimedb"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GreptimeTeam/greptimedb")
    (synopsis "Open-source time-series database")
    (description "Open-source time-series database.")
    (license license:asl2.0)))


;;; namida-bin — a Beautiful and Feature-rich Music Player, With YouTube & Video Support...
(define-public namida-bin
  (package
    (name "namida-bin")
    (version "6.0.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/namidaco/namida-snapshots/releases/download/6.0.4-beta%2B/namida-v6.0.4-beta.linux.tar.gz")
       (sha256
        (base32 "1aqaw9q2g6z5gmxbfqrd6zn43rjd4phixa653nrdxiih6jzibjrf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("namida" "bin/namida"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/namidaco/namida-snapshots")
    (synopsis "Beautiful and Feature-rich Music Player, With YouTube & Video Support")
    (description "A Beautiful and Feature-rich Music Player, With YouTube & Video Support Built in Flutter.")
    (license #f)))


;;; mmv-go-bin — rename multiple files with editor
(define-public mmv-go-bin
  (package
    (name "mmv-go-bin")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//mmv")
       (sha256
        (base32 "0aw51068rg6ijbh4bgahxnc1c93s1m34d3ki5lhq7x2my033pysa"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("mmv-go" "bin/mmv-go"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "mmv-go")
              (chmod "mmv-go" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/itchyny/mmv")
    (synopsis "Rename multiple files with editor")
    (description "Rename multiple files with editor.")
    (license license:expat)))


;;; librewolf-extension-plasma-integration-bin — plasma Integration extension for LibreWolf
(define-public librewolf-extension-plasma-integration-bin
  (package
    (name "librewolf-extension-plasma-integration-bin")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://addons.mozilla.org/firefox/downloads/file/4614817/plasma_integration-2.1.xpi")
       (sha256
        (base32 "0i4xbvngdzp6kmdl5ajxf86skfvvv5adwnsj9zkn0w89drva7grm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("librewolf-extension-plasma-integration" "bin/librewolf-extension-plasma-integration"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "librewolf-extension-plasma-integration")
              (chmod "librewolf-extension-plasma-integration" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://addons.mozilla.org/en-US/firefox/addon/plasma-integration")
    (synopsis "Plasma Integration extension for LibreWolf")
    (description "Plasma Integration extension for LibreWolf.")
    (license license:gpl3)))


;;; fillin-bin — fill-in your command and execute
(define-public fillin-bin
  (package
    (name "fillin-bin")
    (version "0.3.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//fillin")
       (sha256
        (base32 "048xqfi68skzbh9nynacvzcwf0xmvk97xq2mq6yas35w0yaf7a1n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("fillin" "bin/fillin"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "fillin")
              (chmod "fillin" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/itchyny/fillin")
    (synopsis "Fill-in your command and execute")
    (description "Fill-in your command and execute.")
    (license license:expat)))


;;; diffcatcher-bin — recursive Git State
(define-public diffcatcher-bin
  (package
    (name "diffcatcher-bin")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//DiffCatcher")
       (sha256
        (base32 "1hs1vpbsxk5dhdkimd1b6q0809yw66iiksgkkzic3jpwzbz6y7l8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("diffcatcher" "bin/diffcatcher"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "diffcatcher")
              (chmod "diffcatcher" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Teycir/DiffCatcher")
    (synopsis "Recursive Git State")
    (description "Recursive Git State.")
    (license license:expat)))


;;; codemux-bin — the Agentic Development Environment for Builders
(define-public codemux-bin
  (package
    (name "codemux-bin")
    (version "0.1.29")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Zeus-Deus/codemux/releases/download/v0.1.29/codemux_0.1.29_amd64.AppImage")
       (sha256
        (base32 "1cxqaawcspfkxxj6krlz9zacwp3l2ikva92krqybz1rlcix4hfsp"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("codemux" "bin/codemux"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "codemux")
              (chmod "codemux" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Zeus-Deus/codemux")
    (synopsis "Agentic Development Environment for Builders")
    (description "The Agentic Development Environment for Builders.")
    (license #f)))


;;; balena-etcher-bin — flash OS images to SD cards & USB drives, safely and easily
(define-public balena-etcher-bin
  (package
    (name "balena-etcher-bin")
    (version "2.1.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/balena-io/etcher/releases/download/v2.1.4/balenaEtcher-linux-x64-2.1.4.zip")
       (sha256
        (base32 "1n8njsm99xy1id5i1g0ia7r6zakk6b9b2bc393bb0p613h08zq5h"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("balena-etcher" "bin/balena-etcher"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://etcher.balena.io/")
    (synopsis "Flash OS images to SD cards & USB drives, safely and easily")
    (description "Flash OS images to SD cards & USB drives, safely and easily.")
    (license license:asl2.0)))


;;; jextract-bin — a tool which mechanically generates Java bindings from native library headers
(define-public jextract-bin
  (package
    (name "jextract-bin")
    (version "25.1.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://download.java.net/java/early_access/jextract///openjdk--jextract+-_linux-x64_bin.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("jextract" "bin/jextract"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://jdk.java.net/jextract/")
    (synopsis "Tool which mechanically generates Java bindings from native library headers")
    (description "A tool which mechanically generates Java bindings from native library headers.")
    (license license:gpl2+)))


;;; k6-studio-bin — desktop application to help generate k6 test scripts
(define-public k6-studio-bin
  (package
    (name "k6-studio-bin")
    (version "1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/grafana/k6-studio/releases/download/v1.4.0/k6-studio_1.4.0_amd64.deb")
       (sha256
        (base32 "1qlq5fvlmdgnzx3g33kn7ky5ghimqx364hpa4gs19m6as430x1d0"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("k6-studio" "bin/k6-studio"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/grafana/k6-studio")
    (synopsis "Desktop application to help generate k6 test scripts")
    (description "Desktop application to help generate k6 test scripts (binary release).")
    (license license:gpl3+)))


;;; go-hass-agent-bin — a Home Assistant, native app integration for desktop/laptop...
(define-public go-hass-agent-bin
  (package
    (name "go-hass-agent-bin")
    (version "14.10.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/joshuar/go-hass-agent")
       (sha256
        (base32 "12hh0jy18r3501jjn6c5gmmsqvbhdhvn7b5v2qia46bs3bqpw1p4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("go-hass-agent" "bin/go-hass-agent"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "go-hass-agent")
              (chmod "go-hass-agent" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/joshuar/go-hass-agent")
    (synopsis "Home Assistant, native app integration for desktop/laptop")
    (description "A Home Assistant, native app integration for desktop/laptop devices.Written in Go.(Prebuilt version).")
    (license license:expat)))


;;; mapcidr-bin — utility program to perform multiple operations for a given subnet/CIDR ranges
(define-public mapcidr-bin
  (package
    (name "mapcidr-bin")
    (version "1.1.97")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/projectdiscovery/mapcidr")
       (sha256
        (base32 "1i3jir8jd3ziqd9dqsrxjyjf4ys834qm46a82124wg9hpzk9a6yk"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("mapcidr" "bin/mapcidr"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "mapcidr")
              (chmod "mapcidr" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/projectdiscovery/mapcidr")
    (synopsis "Utility program to perform multiple operations for a given subnet/CIDR ranges")
    (description "Utility program to perform multiple operations for a given subnet/CIDR ranges.")
    (license license:expat)))


;;; nteract-bin — interactive literate coding notebook
(define-public nteract-bin
  (package
    (name "nteract-bin")
    (version "0.28.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/nteract/nteract/releases/download/v0.28.0/nteract_0.28.0_amd64.deb")
       (sha256
        (base32 "142cvk7gv46rz32zixy13y1svylzmhmv4bzwl6cplgrvmvicad9g"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("nteract" "bin/nteract"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://nteract.io")
    (synopsis "Interactive literate coding notebook")
    (description "Interactive literate coding notebook.")
    (license license:bsd-3)))


;;; n-m3u8dl-re-bin — cross-Platform, beautiful and powerful stream downloader for DASH/HLS
(define-public n-m3u8dl-re-bin
  (package
    (name "n-m3u8dl-re-bin")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/nilaoda/N_m3u8DL-RE")
       (sha256
        (base32 "145mdzmy270mbf6py6qf8cgxhh1873hh441dldvfcgmgchdykk1a"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("n-m3u8dl-re" "bin/n-m3u8dl-re"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "n-m3u8dl-re")
              (chmod "n-m3u8dl-re" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nilaoda/N_m3u8DL-RE")
    (synopsis "Cross-Platform, beautiful and powerful stream downloader for DASH/HLS")
    (description "Cross-Platform, beautiful and powerful stream downloader for DASH/HLS.")
    (license license:expat)))


;;; sui-bin — a next-generation smart contract platform with high throughput, low...
(define-public sui-bin
  (package
    (name "sui-bin")
    (version "1.70.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/MystenLabs/sui")
       (sha256
        (base32 "1mm70z58dxv5gm132z6m78rn17rr7z0ypl17qanjbl7mav5r4vp0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("sui" "bin/sui"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "sui")
              (chmod "sui" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/MystenLabs/sui")
    (synopsis "Next-generation smart contract platform with high throughput, low")
    (description "A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model.")
    (license license:asl2.0)))


;;; android-knot-bin — an Android gadget that integrates common modules such as Todo, Notes and...
(define-public android-knot-bin
  (package
    (name "android-knot-bin")
    (version "2.1.85")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/ic005k/Knot/2.1.85/LICENSE")
       (sha256
        (base32 "1s0v6z7pzf63n6kyz96h6ndml458hdk5qj84flgyawl3i3f1wjlq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("android-knot" "bin/android-knot"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "android-knot")
              (chmod "android-knot" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ic005k/Knot")
    (synopsis "Android gadget that integrates common modules such as Todo, Notes and")
    (description "An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes.(Prebuilt version).")
    (license license:expat)))


;;; dagtoc-bin — a CLI tool for operating pdf contents
(define-public dagtoc-bin
  (package
    (name "dagtoc-bin")
    (version "5.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/TD-Sky/PKGBUILDs")
       (sha256
        (base32 "1g122ni3r6gxyfk0bfps8q2bgvk9h6xiryzcbal6v9yfmvgf33xv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("dagtoc" "bin/dagtoc"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "dagtoc")
              (chmod "dagtoc" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/TD-Sky/dagtoc")
    (synopsis "CLI tool for operating pdf contents")
    (description "A CLI tool for operating pdf contents.")
    (license license:gpl3+)))


;;; realesrgan-ncnn-vulkan-bin — Real-ESRGAN aims at developing Practical Algorithms for General Image...
(define-public realesrgan-ncnn-vulkan-bin
  (package
    (name "realesrgan-ncnn-vulkan-bin")
    (version "0.2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan--ubuntu.zip")
       (sha256
        (base32 "15hclj2s5dlmpsdjn3xpnx1fdqzmj29vi0hzqp08fjr366qnxap5"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("realesrgan-ncnn-vulkan" "bin/realesrgan-ncnn-vulkan"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xinntao/Real-ESRGAN-ncnn-vulkan")
    (synopsis "Real-ESRGAN aims at developing Practical Algorithms for General Image")
    (description "Real-ESRGAN aims at developing Practical Algorithms for General Image Restoration.")
    (license license:bsd-3)))


;;; rash-bin — declarative shell scripting using Rust native bindings
(define-public rash-bin
  (package
    (name "rash-bin")
    (version "2.20.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/rash-sh/rash/releases/download/v2.20.0/rash-2.20.0--unknown-linux-gnu.tar.gz")
       (sha256
        (base32 "1jdpm1dnvrxaz3g367vlsp9a5rmliv42rx26k1x5pvl77v4rn5zv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("rash" "bin/rash"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://rash-sh.github.io")
    (synopsis "Declarative shell scripting using Rust native bindings")
    (description "Declarative shell scripting using Rust native bindings.")
    (license license:gpl3+)))


;;; rstudio-server-bin — a integrated development environment (IDE) for R
(define-public rstudio-server-bin
  (package
    (name "rstudio-server-bin")
    (version "2026.04.0_526")
    (source
     (origin
       (method url-fetch)
       (uri "https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2026.04.0_526/_/-}-amd64.deb")
       (sha256
        (base32 "0fim9a97rs4c6nlaph6zd4yis8m4dqzsfwx70skffnnqg2acn64n"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("rstudio-server" "bin/rstudio-server"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.rstudio.org/")
    (synopsis "Integrated development environment (IDE) for R")
    (description "A integrated development environment (IDE) for R (binary version from RStudio official website).")
    (license license:gpl3+)))


;;; ssa-bin — HPE Smart Storage Administrator Web GUI
(define-public ssa-bin
  (package
    (name "ssa-bin")
    (version "6.40_6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://downloads.linux.hpe.com/SDR/repo/mcp/oracle/9/x86_64/current/ssa-bin//-bin/}-6.40_6.0//_/-}.x86_64.rpm")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("ssa" "bin/ssa"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "ssa")
              (chmod "ssa" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/ssa-bin")
    (synopsis "HPE Smart Storage Administrator Web GUI")
    (description "HPE Smart Storage Administrator Web GUI.")
    (license #f)))


;;; amdguid-wayland-bin — AMDGPU temperature and fan speed monitoring tool
(define-public amdguid-wayland-bin
  (package
    (name "amdguid-wayland-bin")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/adamperkowski/PKGBUILDs")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("amdguid-wayland" "bin/amdguid-wayland"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "amdguid-wayland")
              (chmod "amdguid-wayland" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Eraden/amdgpud")
    (synopsis "AMDGPU temperature and fan speed monitoring tool")
    (description "AMDGPU temperature and fan speed monitoring tool.")
    (license license:asl2.0)))


;;; teamide-bin — integrate MySQL, Oracle, Kingbase, Dameng, Shentong databases, SSH, FTP,...
(define-public teamide-bin
  (package
    (name "teamide-bin")
    (version "2.6.38")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/team-ide/teamide")
       (sha256
        (base32 "1j4kqqdaz630zrn2q9xh7gfa816dq2qn2nqpjf6hhjgmylkj4r1v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("teamide" "bin/teamide"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "teamide")
              (chmod "teamide" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/team-ide/teamide")
    (synopsis "Integrate MySQL, Oracle, Kingbase, Dameng, Shentong databases, SSH, FTP,")
    (description "Integrate MySQL, Oracle, Kingbase, Dameng, Shentong databases, SSH, FTP, Redis, Zookeeper, Kafka, Elasticsearch, Mongodb, small tools and other management tools.(Prebuilt version.Use system-wide electron).")
    (license license:asl2.0)))


;;; pshash-bin — a functional pseudo-hash password generator
(define-public pshash-bin
  (package
    (name "pshash-bin")
    (version "0.1.20.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//pshash")
       (sha256
        (base32 "08yc67r8vvkq286fqk89hb4cr90q58c3kf108h8w06sv49mzm072"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pshash" "bin/pshash"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "pshash")
              (chmod "pshash" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/thornoar/pshash")
    (synopsis "Functional pseudo-hash password generator")
    (description "A functional pseudo-hash password generator.")
    (license license:expat)))


;;; slic3r-bin — open Source toolpath generator for 3D printers
(define-public slic3r-bin
  (package
    (name "slic3r-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://slic3r.org/")
       (sha256
        (base32 "1pdn3lj5izd9ia7rkx4zxbps3xgypjbs1z20x49dwmx0mhr1wxi3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("slic3r" "bin/slic3r"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "slic3r")
              (chmod "slic3r" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://slic3r.org/")
    (synopsis "Open Source toolpath generator for 3D printers")
    (description "Open Source toolpath generator for 3D printers.(Prebuilt version).")
    (license license:gpl3)))


;;; describe-commit-bin — cLI tool that leverages AI to generate commit messages based on changes...
(define-public describe-commit-bin
  (package
    (name "describe-commit-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/tarampampam/describe-commit/releases/download/v0.2.0/describe-commit-linux-amd64.tar.gz")
       (sha256
        (base32 "0mzf1ddrlznsvzpxxmq0knxzcdmbh34g1mfmr981cg2p37rlcwf1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("describe-commit" "bin/describe-commit"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tarampampam/describe-commit")
    (synopsis "CLI tool that leverages AI to generate commit messages based on changes")
    (description "CLI tool that leverages AI to generate commit messages based on changes made in a Git repository.")
    (license license:expat)))


;;; caesium-image-compressor-bin — an image compression software that helps you store, send and share digital...
(define-public caesium-image-compressor-bin
  (package
    (name "caesium-image-compressor-bin")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://saerasoft.com/caesium#downloads")
       (sha256
        (base32 "15bl7rxij6s5v4xb08nn8rq46l7l59w0kzm46ifjm6fh2rk056sl"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("caesium-image-compressor" "bin/caesium-image-compressor"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "caesium-image-compressor")
              (chmod "caesium-image-compressor" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://saerasoft.com/caesium#downloads")
    (synopsis "Image compression software that helps you store, send and share digital")
    (description "An image compression software that helps you store, send and share digital pictures, supporting JPG, PNG, WebP and TIFF formats.(Prebuilt version).")
    (license license:gpl3)))


;;; netron-bin — visualizer for neural network, deep learning and machine learning models
(define-public netron-bin
  (package
    (name "netron-bin")
    (version "9.0.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://netron.app/")
       (sha256
        (base32 "0ri12gsnj4h1v5lhfjk61adjr5wmpay4323z20vg27kv5b8bx271"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("netron" "bin/netron"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "netron")
              (chmod "netron" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://netron.app/")
    (synopsis "Visualizer for neural network, deep learning and machine learning models")
    (description "Visualizer for neural network, deep learning and machine learning models.(Prebuilt version,use system-wide electron).")
    (license license:expat)))


;;; winegui-bin — a user-friendly WINE graphical interface
(define-public winegui-bin
  (package
    (name "winegui-bin")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://winegui.melroy.org/downloads/WineGUI-v3.1.0.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("winegui" "bin/winegui"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.melroy.org/melroy/winegui")
    (synopsis "User-friendly WINE graphical interface")
    (description "A user-friendly WINE graphical interface.")
    (license license:gpl3+)))


;;; distroav-bin — newTek NDI integration for OBS Studio
(define-public distroav-bin
  (package
    (name "distroav-bin")
    (version "6.0.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/DistroAV/DistroAV")
       (sha256
        (base32 "1ckq0mbbjh61kivkn5ig17qzcq48w4q15gc839l3hb6dmlab7yrm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("distroav" "bin/distroav"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "distroav")
              (chmod "distroav" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/DistroAV/DistroAV")
    (synopsis "NewTek NDI integration for OBS Studio")
    (description "NewTek NDI integration for OBS Studio.")
    (license license:gpl2+)))


;;; epyrus-bin — open source email client based on Thundermail
(define-public epyrus-bin
  (package
    (name "epyrus-bin")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.addons.epyrus.org/download/epyrus-2.2.0.linux-x86_64-gtk3.tar.xz")
       (sha256
        (base32 "1n44am9rnf894xrcz2al3zz2dcpab0lwgnnzf4m1v6p4sbwhh3gx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("epyrus" "bin/epyrus"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.epyrus.org/")
    (synopsis "Open source email client based on Thundermail")
    (description "Open source email client based on Thundermail.")
    (license license:gpl3+)))


;;; yt-bin — youtube Terminal UI for music streaming. WIP
(define-public yt-bin
  (package
    (name "yt-bin")
    (version "r60.da2f5bf")
    (source
     (origin
       (method url-fetch)
       (uri "https://ahbnr.de/jenkins/job/yt/27/artifact/yt")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("yt" "bin/yt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "yt")
              (chmod "yt" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://aur.archlinux.org/packages/yt-bin")
    (synopsis "Youtube Terminal UI for music streaming. WIP")
    (description "Youtube Terminal UI for music streaming.  WIP.")
    (license license:gpl3+)))


;;; buckets-bin — private budgeting with the envelope budgeting method
(define-public buckets-bin
  (package
    (name "buckets-bin")
    (version "0.80.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/buckets/application/releases/download/v0.80.0/")
       (sha256
        (base32 "1q7x9fv9ad1kyd8dyabfmlgyydj7303f36a7d38n1bvry2kq9zpm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("buckets" "bin/buckets"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "buckets")
              (chmod "buckets" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.budgetwithbuckets.com/")
    (synopsis "Private budgeting with the envelope budgeting method")
    (description "Private budgeting with the envelope budgeting method.")
    (license #f)))


;;; calendar-bin — task, calendar, Vision protection
(define-public calendar-bin
  (package
    (name "calendar-bin")
    (version "1.0.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/KangLin/Calendar")
       (sha256
        (base32 "0w5jk4ws8c0sdkjxb8b2nlqmhjrw4h83slhi4lryj21ksrhxb68s"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("calendar" "bin/calendar"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "calendar")
              (chmod "calendar" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/KangLin/Calendar")
    (synopsis "Task, calendar, Vision protection")
    (description "Task, calendar, Vision protection.(Prebuilt version).")
    (license license:gpl3+)))


;;; lvce-bin — vS Code inspired text editor that mostly runs in a webworker
(define-public lvce-bin
  (package
    (name "lvce-bin")
    (version "0.80.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://lvce-editor.github.io/lvce-editor")
       (sha256
        (base32 "1bph2i7hs4p6xv1ym3y4vzzi9y263npdh1d6wdazzyrssz98xy6h"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("lvce" "bin/lvce"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "lvce")
              (chmod "lvce" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lvce-editor.github.io/lvce-editor")
    (synopsis "VS Code inspired text editor that mostly runs in a webworker")
    (description "VS Code inspired text editor that mostly runs in a webworker.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; transformerlab-bin — open Source Application for Advanced LLM Engineering: interact, train,...
(define-public transformerlab-bin
  (package
    (name "transformerlab-bin")
    (version "0.27.8")
    (source
     (origin
       (method url-fetch)
       (uri "https://transformerlab.ai/")
       (sha256
        (base32 "0l0sb9nll4haf410aa31ij4llid7q5nxq6dfdnrcvsn8p8a4d3fw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("transformerlab" "bin/transformerlab"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "transformerlab")
              (chmod "transformerlab" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://transformerlab.ai/")
    (synopsis "Open Source Application for Advanced LLM Engineering: interact, train,")
    (description "Open Source Application for Advanced LLM Engineering: interact, train, fine-tune, and evaluate large language models on your own computer.(Prebuilt version.Use system-wide electron).")
    (license license:expat)))


;;; cassette-bin — gTK4/Adwaita application that allows you to use Yandex Music service on...
(define-public cassette-bin
  (package
    (name "cassette-bin")
    (version "0.2.1.g49")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.gnome.org/Rirusha/cassette-bin%-bin}")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("cassette" "bin/cassette"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "cassette")
              (chmod "cassette" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.gnome.org/Rirusha/cassette")
    (synopsis "GTK4/Adwaita application that allows you to use Yandex Music service on")
    (description "GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems.")
    (license license:gpl3+)))


;;; buildcache-bin — an advanced compiler accelerator
(define-public buildcache-bin
  (package
    (name "buildcache-bin")
    (version "0.31.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/bits-n-bites/buildcache/-/releases/v0.31.7/downloads/buildcache-linux-amd64.tar.gz")
       (sha256
        (base32 "0q3jr873zcglpmgnv7w9yic572fzix7iq9fy9bvnn6qgaycl97zx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("buildcache" "bin/buildcache"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/bits-n-bites/buildcache")
    (synopsis "Advanced compiler accelerator")
    (description "An advanced compiler accelerator.")
    (license license:zlib)))


;;; 86box-manager-bin — a (cross-platform) configuration manager for the 86Box emulator
(define-public 86box-manager-bin
  (package
    (name "86box-manager-bin")
    (version "1.7.6.0e")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/RetBox/86BoxManagerX/releases/download/v1.7.6.0e/_linux.tar.gz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("86box-manager" "bin/86box-manager"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RetBox/86BoxManagerX")
    (synopsis "(cross-platform) configuration manager for the 86Box emulator")
    (description "A (cross-platform) configuration manager for the 86Box emulator.")
    (license license:expat)))


;;; teleport-bin — modern SSH server for teams managing distributed infrastructure
(define-public teleport-bin
  (package
    (name "teleport-bin")
    (version "18.7.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://get.gravitational.com/teleport-v18.7.2-linux-amd64-bin.tar.gz")
       (sha256
        (base32 "0r2p4j007py8bazgx9ibnfn7wxgxi4j9aq4nlli2wfzrc1k2ryyg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("teleport" "bin/teleport"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://goteleport.com/")
    (synopsis "Modern SSH server for teams managing distributed infrastructure")
    (description "Modern SSH server for teams managing distributed infrastructure.")
    (license #f)))


;;; whalebird-bin — single-column Fediverse client for desktop
(define-public whalebird-bin
  (package
    (name "whalebird-bin")
    (version "6.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://whalebird.social/")
       (sha256
        (base32 "1kv2hvnjjgjw8nc3m9b7c0fdngijqrdvf6j9pajmvqr17b1irmm8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("whalebird" "bin/whalebird"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "whalebird")
              (chmod "whalebird" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://whalebird.social/")
    (synopsis "Single-column Fediverse client for desktop")
    (description "Single-column Fediverse client for desktop.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; ipfs-desktop-bin — desktop client for the InterPlanetary File System
(define-public ipfs-desktop-bin
  (package
    (name "ipfs-desktop-bin")
    (version "0.48.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://docs.ipfs.tech/install/ipfs-desktop")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("ipfs-desktop" "bin/ipfs-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "ipfs-desktop")
              (chmod "ipfs-desktop" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.ipfs.tech/install/ipfs-desktop")
    (synopsis "Desktop client for the InterPlanetary File System")
    (description "Desktop client for the InterPlanetary File System.")
    (license license:expat)))


;;; iortcw-bin — open source engine for Return to Castle Wolfenstein
(define-public iortcw-bin
  (package
    (name "iortcw-bin")
    (version "1.51c")
    (source
     (origin
       (method url-fetch)
       (uri "https://gitlab.com/linuxbombay/iortcw")
       (sha256
        (base32 "0v8b3brjdhspjlbvyp3cjq280yh6gvbrfrrw0xb73mcswm98m7v5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("iortcw" "bin/iortcw"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "iortcw")
              (chmod "iortcw" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://gitlab.com/linuxbombay/iortcw")
    (synopsis "Open source engine for Return to Castle Wolfenstein")
    (description "Open source engine for Return to Castle Wolfenstein.")
    (license license:gpl3+)))


;;; apple-music-bin — an Electron app that provides a native Apple Music experience
(define-public apple-music-bin
  (package
    (name "apple-music-bin")
    (version "2.1.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/Alex313031/apple-music-desktop/2.1.2/LICENSE.md")
       (sha256
        (base32 "03b4hqws1ajsv5mpipzp9bpdq0hb3clhligmf91y6prba6k3r7aa"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("apple-music" "bin/apple-music"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "apple-music")
              (chmod "apple-music" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Alex313031/apple-music-desktop")
    (synopsis "Electron app that provides a native Apple Music experience")
    (description "An Electron app that provides a native Apple Music experience.(Prebuilt version).")
    (license license:bsd-3)))


;;; d0phamine-music-player-bin — simple desktop music app
(define-public d0phamine-music-player-bin
  (package
    (name "d0phamine-music-player-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/d0phamine/d0phamine-music-player")
       (sha256
        (base32 "1159flacyd6nhdhjgy6cx7hdplnzv5b3j81yp6cjvxglb59flgvr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("d0phamine-music-player" "bin/d0phamine-music-player"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "d0phamine-music-player")
              (chmod "d0phamine-music-player" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/d0phamine/d0phamine-music-player")
    (synopsis "Simple desktop music app")
    (description "Simple desktop music app.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; shijima-qt-bin — cross-platform shimeji simulation Desktop pets on any device
(define-public shijima-qt-bin
  (package
    (name "shijima-qt-bin")
    (version "0.2.0alpha1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/pixelomer/Shijima-Qt")
       (sha256
        (base32 "11775y2n20qzl722z75i9lahps4i7c7siazsy0w36441pmyjydvs"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("shijima-qt" "bin/shijima-qt"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "shijima-qt")
              (chmod "shijima-qt" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pixelomer/Shijima-Qt")
    (synopsis "Cross-platform shimeji simulation Desktop pets on any device")
    (description "Cross-platform shimeji simulation Desktop pets on any device.")
    (license license:gpl3)))


;;; yank-note-bin — a Hackable Markdown Note Application for Programmers
(define-public yank-note-bin
  (package
    (name "yank-note-bin")
    (version "3.87.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://yank-note.com/")
       (sha256
        (base32 "02d2aqaqjiziylc98hfapym2q0jn5604p39c4nwwakl9j9gm2sly"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("yank-note" "bin/yank-note"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "yank-note")
              (chmod "yank-note" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://yank-note.com/")
    (synopsis "Hackable Markdown Note Application for Programmers")
    (description "A Hackable Markdown Note Application for Programmers.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; hyper-bin — a terminal built on web technologies
(define-public hyper-bin
  (package
    (name "hyper-bin")
    (version "3.4.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/zeit/hyper/releases/download/v3.4.1/Hyper_3.4.1_amd64.deb")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("hyper" "bin/hyper"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://hyper.is")
    (synopsis "Terminal built on web technologies")
    (description "A terminal built on web technologies.")
    (license license:expat)))


;;; inputplumber-bin — open source input router and remapper daemon for Linux
(define-public inputplumber-bin
  (package
    (name "inputplumber-bin")
    (version "v0.76.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ShadowBlip/inputplumber/releases/download/v0.76.1/inputplumber-x86_64.tar.gz")
       (sha256
        (base32 "1przm75q44qya0657hs7b1jypi193g1pkdfsq975a0vyp8mgbzb6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("inputplumber" "bin/inputplumber"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ShadowBlip/inputplumber")
    (synopsis "Open source input router and remapper daemon for Linux")
    (description "Open source input router and remapper daemon for Linux.")
    (license license:gpl3+)))


;;; trufflehog-bin — find, verify, and analyze leaked credentials
(define-public trufflehog-bin
  (package
    (name "trufflehog-bin")
    (version "3.95.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//")
       (sha256
        (base32 "0yb7hj6sx1rd94pyhfalcmnmbmc2im1f2rfykwnqglz4kw9irvgx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("trufflehog" "bin/trufflehog"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "trufflehog")
              (chmod "trufflehog" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/trufflesecurity/trufflehog")
    (synopsis "Find, verify, and analyze leaked credentials")
    (description "Find, verify, and analyze leaked credentials.")
    (license license:gpl3)))


;;; nvrs-bin — fast new version checker for software releases
(define-public nvrs-bin
  (package
    (name "nvrs-bin")
    (version "0.1.9")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//nvrs")
       (sha256
        (base32 "1vflajxv8p042x5bcq9if9ajnqgrpapad3cnyvwwaz7g3kpngkrw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("nvrs" "bin/nvrs"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "nvrs")
              (chmod "nvrs" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/adamperkowski/nvrs")
    (synopsis "Fast new version checker for software releases")
    (description "Fast new version checker for software releases.")
    (license license:expat)))


;;; note-gen-bin — an AI notebook that focuses on recording and writing and is...
(define-public note-gen-bin
  (package
    (name "note-gen-bin")
    (version "0.27.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://raw.githubusercontent.com/codexu/note-gen/note-gen-bin%-bin}-v0.27.7/LICENSE")
       (sha256
        (base32 "1sjgsh7q9bcac4zx5s63k093kdjx9b2agh98jynmpik9c16s4p7c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("note-gen" "bin/note-gen"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "note-gen")
              (chmod "note-gen" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codexu.github.io/note-gen-help")
    (synopsis "AI notebook that focuses on recording and writing and is")
    (description "An AI notebook that focuses on recording and writing and is cross-platform.(Prebuilt version)一款专注于记录和写作的跨端AI笔记.")
    (license license:expat)))


;;; gex-bin — git Explorer: cross-platform git workflow improvement tool inspired by Magit
(define-public gex-bin
  (package
    (name "gex-bin")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri "https://codeberg.org/Piturnah/gex")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("gex" "bin/gex"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "gex")
              (chmod "gex" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/Piturnah/gex")
    (synopsis "Git Explorer: cross-platform git workflow improvement tool inspired by Magit")
    (description "Git Explorer: cross-platform git workflow improvement tool inspired by Magit.")
    (license license:expat)))


;;; delta-walker-bin — file and folder comparison and synchronization
(define-public delta-walker-bin
  (package
    (name "delta-walker-bin")
    (version "2.6.3")
    (source
     (origin
       (method url-fetch)
       (uri "https://s3.amazonaws.com/deltawalker/DeltaWalker-2.6.3-Linux.tar.gz")
       (sha256
        (base32 "142kjdk92rhl146w1asdmlav7pch9h266q4c98zfq0c7jgxx7g2n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("delta-walker" "bin/delta-walker"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.deltawalker.com/")
    (synopsis "File and folder comparison and synchronization")
    (description "File and folder comparison and synchronization.")
    (license #f)))


;;; jqp-bin — a TUI playground to experiment with jq
(define-public jqp-bin
  (package
    (name "jqp-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/noahgorstein/jqp")
       (sha256
        (base32 "1g6jqi4xkd2f9cc19qbzwchk0v6343vp3pmil35ivagjfsnrbmak"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("jqp" "bin/jqp"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "jqp")
              (chmod "jqp" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/noahgorstein/jqp")
    (synopsis "TUI playground to experiment with jq")
    (description "A TUI playground to experiment with jq.")
    (license license:expat)))


;;; musicat-bin — a sleek desktop music player and tagger for offline music 🪕 With...
(define-public musicat-bin
  (package
    (name "musicat-bin")
    (version "0.17.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/basharovV/musicat")
       (sha256
        (base32 "1iggz1p6h64kplkn0x7wzxyqjds37k1vkq3rx5kiqqnmkarbry41"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("musicat" "bin/musicat"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "musicat")
              (chmod "musicat" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/basharovV/musicat")
    (synopsis "Sleek desktop music player and tagger for offline music 🪕 With")
    (description "A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit.(Prebuilt version).")
    (license license:gpl3)))


;;; arnis-bin — generate any location from the real world in Minecraft
(define-public arnis-bin
  (package
    (name "arnis-bin")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/louis-e/arnis/releases/download/v" version "/arnis-linux.tar.gz"))
       (sha256
        (base32 "04nalwkk10wpahr50dj985hs0s7in13rwa5m9z2al0r7y32vb5zm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("arnis" "bin/arnis"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "arnis")
              (chmod "arnis" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/louis-e/arnis")
    (synopsis "Generate any location from the real world in Minecraft")
    (description "Generate any location from the real world in Minecraft (binary version).")
    (license license:asl2.0)))


;;; iceshrimp.net-bin — decentralized and federated social networking service, implementing the...
(define-public iceshrimp-net-bin
  (package
    (name "iceshrimp.net-bin")
    (version "2026.1.beta")
    (source
     (origin
       (method url-fetch)
       (uri "https://iceshrimp.dev/iceshrimp/Iceshrimp.NET/releases/download/v2026.1-beta/Iceshrimp.NET-v2026.1-beta-linux-amd64-glibc.tar.zst")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("iceshrimp.net" "bin/iceshrimp.net"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://iceshrimp.dev/iceshrimp/iceshrimp.net")
    (synopsis "Decentralized and federated social networking service, implementing the")
    (description "Decentralized and federated social networking service, implementing the ActivityPub standard.")
    (license #f)))


;;; meowpad-configurator-v2-bin — meowpad v2 配置器
(define-public meowpad-configurator-v2-bin
  (package
    (name "meowpad-configurator-v2-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://assets.desu.life/device/app/resources/MeowpadConfiguratorForV2_v1.2.0_linux.deb")
       (sha256
        (base32 "1qjrywp44r5svc0qcf8lwgbrhq942h75zw3qi3qd41fb94756x71"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("meowpad-configurator-v2" "bin/meowpad-configurator-v2"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://desu.life/")
    (synopsis "Meowpad v2 配置器")
    (description "Meowpad v2 配置器.")
    (license license:expat)))


;;; cinc-workstation-bin — the Cinc installation package includes everything you need to start...
(define-public cinc-workstation-bin
  (package
    (name "cinc-workstation-bin")
    (version "25.9.1094")
    (source
     (origin
       (method url-fetch)
       (uri "http://downloads.cinc.sh/files/stable/cinc-workstation/25.9.1094/ubuntu/24.04/cinc-workstation_25.9.1094-1_amd64.deb")
       (sha256
        (base32 "0qdqhgar8yin1crzh69pzi9jwk1h0v95q8ng4wfqdqdzjhz5i44s"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("cinc-workstation" "bin/cinc-workstation"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://cinc.sh/download/")
    (synopsis "Cinc installation package includes everything you need to start")
    (description "The Cinc installation package includes everything you need to start converging your machines.")
    (license license:asl2.0)))


;;; inform7-ide-bin — inform 7 IDE for the Inform 7 programming language for interactive fiction
(define-public inform7-ide-bin
  (package
    (name "inform7-ide-bin")
    (version "2.0.0_1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/ganelson/inform/releases/download/v10.1.2/inform7-ide-2.0.0_1//_/-}.fc35.x86_64.rpm")
       (sha256
        (base32 "1x1hcc65jh3748qfi8373sqvh2h4j210ws8jp09v9ajdb9vzl18c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("inform7-ide" "bin/inform7-ide"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "inform7-ide")
              (chmod "inform7-ide" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ptomato/inform7-ide")
    (synopsis "Inform 7 IDE for the Inform 7 programming language for interactive fiction")
    (description "Inform 7 IDE for the Inform 7 programming language for interactive fiction.")
    (license #f)))


;;; androidscreencast-bin — desktop app to control an android device remotely using mouse and keyboard
(define-public androidscreencast-bin
  (package
    (name "androidscreencast-bin")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/xSAVIKx/AndroidScreencast/releases/download/v0.1/androidscreencast-0.1-linux.tar.gz")
       (sha256
        (base32 "0lw22ahjrdwp9ng28lxwmlsddygvhnrxgxwfa9aiwhqa8cnrir87"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("androidscreencast" "bin/androidscreencast"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xSAVIKx/AndroidScreencast")
    (synopsis "Desktop app to control an android device remotely using mouse and keyboard")
    (description "Desktop app to control an android device remotely using mouse and keyboard.")
    (license license:asl2.0)))


;;; universal-gcode-sender-bin — Universal G-Code Sender (UGS) is a Java based, cross platform G-Code...
(define-public universal-gcode-sender-bin
  (package
    (name "universal-gcode-sender-bin")
    (version "2.1.22")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/winder/Universal-G-Code-Sender/releases/download/v2.1.22/ugs-platform-app-2.1.22.zip")
       (sha256
        (base32 "1gpa8kh2zazs75qmmryhfq9xl3dn70yvfrdfgmrfzq3rc9xirwkb"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("universal-gcode-sender" "bin/universal-gcode-sender"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://universalgcodesender.com/")
    (synopsis "Universal G-Code Sender (UGS) is a Java based, cross platform G-Code")
    (description "Universal G-Code Sender (UGS) is a Java based, cross platform G-Code sender, compatible with GRBL, TinyG, g2core and Smoothieware.")
    (license license:gpl3+)))


;;; mullvad-vpn-beta-bin — the Mullvad VPN client app for desktop (beta channel) (desktop application)
(define-public mullvad-vpn-beta-bin
  (package
    (name "mullvad-vpn-beta-bin")
    (version "2026.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/mullvad/mullvadvpn-app/releases/download/2026.2-beta/MullvadVPN-2026.2-beta_amd64.deb")
       (sha256
        (base32 "1yvh39s05zs0ymrg4q162jra8lp5k0vlw72n7a15hsgcrhgwmfcz"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("mullvad-vpn-beta" "bin/mullvad-vpn-beta"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mullvad.net")
    (synopsis "Mullvad VPN client app for desktop (beta channel) (desktop application)")
    (description "The Mullvad VPN client app for desktop (beta channel) (desktop application).")
    (license license:gpl3+)))


;;; stremio-web-desktop-bin — Stremio Web as Electron Desktop App. Latest Stremio Web v5 and Server...
(define-public stremio-web-desktop-bin
  (package
    (name "stremio-web-desktop-bin")
    (version "523")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Zaarrg/stremio-web-desktop")
       (sha256
        (base32 "1cgc67pzf7b863bm570s71vnksb1igc3hngynifvi7hg3x8d27k7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("stremio-web-desktop" "bin/stremio-web-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "stremio-web-desktop")
              (chmod "stremio-web-desktop" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Zaarrg/stremio-web-desktop")
    (synopsis "Stremio Web as Electron Desktop App. Latest Stremio Web v5 and Server")
    (description "Stremio Web as Electron Desktop App.  Latest Stremio Web v5 and Server bundled as electron app.Not affiliated with Stremio in any way.(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; mpdris-bin — a MPD client implementing the dbus MPRIS standard written in rust --...
(define-public mpdris-bin
  (package
    (name "mpdris-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/jasger9000/mpdris")
       (sha256
        (base32 "0k6571nqxx82jz9f44z2jmz5cm2dxc26f8hpmb1bngi0fnhvh0hr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("mpdris" "bin/mpdris"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "mpdris")
              (chmod "mpdris" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/jasger9000/mpdris")
    (synopsis "MPD client implementing the dbus MPRIS standard written in rust --")
    (description "A MPD client implementing the dbus MPRIS standard written in rust -- binary version.")
    (license license:expat)))


;;; gameclock-bin — track your Game time with your friends!
(define-public gameclock-bin
  (package
    (name "gameclock-bin")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Didiloy/GameClock")
       (sha256
        (base32 "09x8j1icqvp3qfm1j8ma39834rjnfsfbsgm5dm71acgwmqrpya6i"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("gameclock" "bin/gameclock"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "gameclock")
              (chmod "gameclock" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Didiloy/GameClock")
    (synopsis "Track your Game time with your friends!")
    (description "Track your Game time with your friends!(Prebuilt version.Use system-wide electron).")
    (license license:gpl3)))


;;; jqsh-bin — an interactive wrapper to the jq command line utility
(define-public jqsh-bin
  (package
    (name "jqsh-bin")
    (version "0.5")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com//jqsh")
       (sha256
        (base32 "18wn919pafxi83kznnsmgxq7w0bapfkbhx58cznsmns0s5n8g6id"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("jqsh" "bin/jqsh"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "jqsh")
              (chmod "jqsh" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bmatsuo/jqsh")
    (synopsis "Interactive wrapper to the jq command line utility")
    (description "An interactive wrapper to the jq command line utility.")
    (license license:expat)))


;;; openrocket-beta-bin — a free and fully featured rocket flight simulator - 6 degrees of freedom,...
(define-public openrocket-beta-bin
  (package
    (name "openrocket-beta-bin")
    (version "24.12")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/openrocket/openrocket/releases/download/release-24.12/OpenRocket-24.12.jar")
       (sha256
        (base32 "15zqqhqrznr9lc245y5vxcw4l33zgfxsn8lp3sa0gxpma8pvfna9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("openrocket-beta" "bin/openrocket-beta"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "openrocket-beta")
              (chmod "openrocket-beta" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openrocket.info/")
    (synopsis "Free and fully featured rocket flight simulator - 6 degrees of freedom,")
    (description "A free and fully featured rocket flight simulator - 6 degrees of freedom, prerelease.")
    (license license:gpl3+)))


;;; secondlife-bin — Second Life's official client
(define-public secondlife-bin
  (package
    (name "secondlife-bin")
    (version "7.1.12.13382132360")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/secondlife/viewer/releases/download//.tar.xz")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("secondlife" "bin/secondlife"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/secondlife/viewer")
    (synopsis "Second Life's official client")
    (description "Second Life's official client.")
    (license license:gpl3+)))


;;; lantern-bin — a censorship circumvention tool that delivers fast, reliable, and secure...
(define-public lantern-bin
  (package
    (name "lantern-bin")
    (version "8.3.7")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/getlantern/lantern-binaries/raw/main/lantern-installer-8.3.7-64-bit.deb")
       (sha256
        (base32 "0jd7d75x580nq18gg6df6rdfpjvgwv1qy6pbqmjpvqy9nk3v8d0y"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("lantern" "bin/lantern"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lantern.io")
    (synopsis "Censorship circumvention tool that delivers fast, reliable, and secure")
    (description "A censorship circumvention tool that delivers fast, reliable, and secure access to the open internet.")
    (license license:asl2.0)))


;;; heaven-studio-nightly-bin — fully playable, open source recreation of every Rhythm Heaven minigame...
(define-public heaven-studio-nightly-bin
  (package
    (name "heaven-studio-nightly-bin")
    (version "6241434638")
    (source
     (origin
       (method url-fetch)
       (uri "https://archive.org/download/hs-nightly-140624/StandaloneLinux64-build.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list
      #:install-plan #~'(("heaven-studio-nightly" "bin/heaven-studio-nightly"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/RHeavenStudio/HeavenStudio")
    (synopsis "Fully playable, open source recreation of every Rhythm Heaven minigame")
    (description "Fully playable, open source recreation of every Rhythm Heaven minigame with a built in level editor.")
    (license license:gpl3+)))


;;; powder-toy-jacob1-bin — desktop version of the classic falling sand physics sandbox, simulates air...
(define-public powder-toy-jacob1-bin
  (package
    (name "powder-toy-jacob1-bin")
    (version "58.2")
    (source
     (origin
       (method url-fetch)
       (uri "https://starcatcher.us/TPT/mod/Older/Jacob1")
       (sha256
        (base32 "07sm4xfmm6slvsy24l6y52g72blqyvq7kk44cmkbb2xflkx8z4fb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("powder-toy-jacob1" "bin/powder-toy-jacob1"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "powder-toy-jacob1")
              (chmod "powder-toy-jacob1" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://powdertoy.co.uk/Discussions/Thread/View.html?Thread=11117")
    (synopsis "Desktop version of the classic falling sand physics sandbox, simulates air")
    (description "Desktop version of the classic falling sand physics sandbox, simulates air pressure, velocity & heat! Modded version by Jacob1.")
    (license license:gpl3+)))


;;; chia-bin — a new blockchain and smart transaction platform that is easier to use,...
(define-public chia-bin
  (package
    (name "chia-bin")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/Chia-Network/chia-blockchain/releases/download/2.7.0//_/-}/chia-blockchain_2.7.0//_/-}_amd64.deb")
       (sha256
        (base32 "0kx70a0aza3i4acdfq7d6jm304hf07j00nyrrpf5wg2s7qv0sq0d"))))
    (build-system copy-build-system)
    (native-inputs (list ar))
    (arguments
     (list
      #:install-plan #~'(("chia" "bin/chia"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.chia.net/")
    (synopsis "New blockchain and smart transaction platform that is easier to use,")
    (description "A new blockchain and smart transaction platform that is easier to use, more efficient, and secure.  - Binary Release, Provides GUI.")
    (license license:asl2.0)))


;;; wolai-appimage — wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生...
(define-public wolai-appimage
  (package
    (name "wolai-appimage")
    (version "1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri "https://cdn.wostatic.cn/dist/installers/wolai-appimage%-appimage}-1.2.10.AppImage")
       (sha256
        (base32 "0d0k4cdvrijjc58nd080dljjd3agg9v1xjz49ll3gxhgh25s6xsm"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("wolai-appimage" "bin/wolai-appimage"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "wolai-appimage")
              (chmod "wolai-appimage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.wolai.com")
    (synopsis "Wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生")
    (description "Wolai是一种新形态的文档/笔记/信息系统,它与你过去使用的所有传统文档、在线文档都有很多不同,学会使用wolai就等于拥有了一个强大的个人与团队生产力工具。.")
    (license #f)))


;;; pico-8 — a fantasy console for making, sharing and playing tiny games and other...
(define-public pico-8
  (package
    (name "pico-8")
    (version "0.2.7")
    (source
     (origin
       (method url-fetch)
       (uri "http://www.lexaloffle.com/pico-8.php")
       (sha256
        (base32 "1alyii0bc9r9j2519q3jhxn8xazrcffy0kl8k07mnn208y2wxwpd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("pico-8" "bin/pico-8"))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "pico-8")
              (chmod "pico-8" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "http://www.lexaloffle.com/pico-8.php")
    (synopsis "Fantasy console for making, sharing and playing tiny games and other")
    (description "A fantasy console for making, sharing and playing tiny games and other computer programs.")
    (license #f)))

