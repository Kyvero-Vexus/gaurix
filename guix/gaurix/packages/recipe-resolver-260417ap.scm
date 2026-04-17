;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417ap
;;; Resolves 25 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (17):
;;;    1.  ngrok (copy-build-system, v3.37.2, proprietary)
;;;    2.  mongodb-tools-bin (copy-build-system, v100.13.0, Apache-2.0)
;;;    3.  kopia-bin (copy-build-system, v0.22.3, Apache-2.0)
;;;    4.  blockbench-bin (copy-build-system, v5.0.7, GPL-3.0+)
;;;    5.  nexusmods-app-bin (copy-build-system, v0.21.1, GPL-3.0+)
;;;    6.  wootility (copy-build-system, v5.2.5, proprietary)
;;;    7.  kdrive-bin (copy-build-system, v3.8.1.4, GPL-2.0)
;;;    8.  sparrow-wallet (copy-build-system, v2.4.2, Apache-2.0)
;;;    9.  joplin-appimage (copy-build-system, v3.5.12, MIT)
;;;   10.  insync (copy-build-system, v3.9.8.60034, proprietary)
;;;   11.  microsoft-edge-beta-bin (copy-build-system, v145.0.3800.53, proprietary)
;;;   12.  local-by-flywheel-bin (copy-build-system, v10.0.0, proprietary)
;;;   13.  exodus (copy-build-system, v26.3.11, proprietary)
;;;   14.  howdy-bin (copy-build-system, v2.6.1, MIT)
;;;   15.  davmail (copy-build-system, v6.5.1, GPL-2.0)
;;;   16.  brscan4 (copy-build-system, v0.4.11, GPL-2.0/proprietary)
;;;   17.  spflashtool-bin (copy-build-system, v6.2228, proprietary)
;;;
;;; BLOCKED (8):
;;;   18. deezer (COMPLEX_DEPS — Windows exe repackaged via electron; requires
;;;       p7zip to extract .exe, asar to repack, 14+ patches from deezer-linux
;;;       project; depends on electron39 not in Guix; A1: needs electron39
;;;       packaging; A2: complex patch application chain)
;;;   19. wasistlos (DEP_RESOLUTION_FAILED — C++ GTK3 app depending on
;;;       webkit2gtk, libayatana-appindicator, gst-plugins-bad, gst-libav;
;;;       A1: webkit2gtk version mismatch; A2: libayatana-appindicator not
;;;       packaged; A3: heavy gstreamer plugin dependencies)
;;;   20. datagrip-jre (COMPLEX_DEPS — JetBrains DataGrip IDE; proprietary
;;;       with bundled JRE; massive dependency tree; A1: requires JetBrains
;;;       packaging framework; A2: IDE-specific plugin infrastructure)
;;;   21. gksu (DEP_RESOLUTION_FAILED — depends on libgksu>=2.0.12 which is
;;;       not in Guix; abandoned upstream; A1: package libgksu first; A2: use
;;;       pkexec as modern alternative; A3: GTK2 era, may not build)
;;;   22. winscp (DEP_RESOLUTION_FAILED — Windows application requiring Wine
;;;       runtime; not a native Linux application; A1: Wine packaging needed;
;;;       A2: use native alternatives like FileZilla or sshfs)
;;;   23. arch-silence-grub-theme-git (SOURCE_UNAVAILABLE — Arch-specific GRUB
;;;       theme from git; theme references Arch Linux branding; A1: distribution
;;;       specific; A2: no tagged releases; A3: git source needs snapshot)
;;;   24. selectdefaultapplication-git (DEP_RESOLUTION_FAILED — Qt5 app from
;;;       git with no tagged releases; A1: no stable version to pin; A2: git
;;;       snapshot needed; A3: depends on hicolor-icon-theme setup)
;;;   25. pstate-frequency (BUILD_FAILED — relies on Intel-specific sysfs paths
;;;       and kernel p-state driver; shell scripts with hard-coded Linux paths;
;;;       A1: requires Intel CPU with p-state driver; A2: not portable;
;;;       moved to file 1 as recipe instead)
;;;
;;; 17 new recipes + 8 BLOCKED = 25 resolved
;;;
;;; All sha256 hashes obtained via `guix download` or `guix hash`.

(define-module (gaurix packages recipe-resolver-260417ap)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bootstrap)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages xorg)
  #:export (
            ngrok
            mongodb-tools-bin
            kopia-bin
            blockbench-bin
            nexusmods-app-bin
            wootility
            kdrive-bin
            sparrow-wallet
            joplin-appimage
            insync
            microsoft-edge-beta-bin
            local-by-flywheel-bin
            exodus
            howdy-bin
            davmail
            brscan4
            spflashtool-bin
            ))

;;; ===================================================================
;;; 1. ngrok — Secure tunneling reverse proxy
;;; ===================================================================
(define-public ngrok
  (package
    (name "ngrok")
    (version "3.37.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://bin.equinox.io/c/bNyj1mQVY4c/"
                    "ngrok-v3-stable-linux-amd64.tgz"))
              (sha256
               (base32
                "1c7fg5iiy6i77a1v6qzgcy52w0pq9qxahv3pffnnvx4n139sa06b"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ngrok" "bin/ngrok"))))
    (synopsis "secure tunneling reverse proxy for local services")
    (description "Ngrok provides secure introspectable tunnels to localhost,
allowing you to expose a local server behind a NAT or firewall to the
Internet.  It supports HTTP, HTTPS, TCP, and TLS tunnels with features like
request inspection and replay.")
    (home-page "https://ngrok.com")
    (license (license:non-copyleft
              "https://ngrok.com/tos"
              "Proprietary — ngrok Terms of Service"))))

;;; ===================================================================
;;; 2. mongodb-tools-bin — MongoDB database tools (pre-built)
;;; ===================================================================
(define-public mongodb-tools-bin
  (package
    (name "mongodb-tools-bin")
    (version "100.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://fastdl.mongodb.org/tools/db/"
                    "mongodb-database-tools-ubuntu2204-x86_64-"
                    version ".tgz"))
              (sha256
               (base32
                "1b0zgrd67d540ls7siglxipkqy6wd4lrz85pca820ryh3h4cs3a9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/" "bin/"))))
    (synopsis "MongoDB database import, export, and diagnostic tools")
    (description "The MongoDB Database Tools are a collection of command-line
utilities for working with MongoDB deployments.  Includes @command{mongodump},
@command{mongorestore}, @command{mongoexport}, @command{mongoimport},
@command{mongostat}, and @command{mongotop}.")
    (home-page "https://github.com/mongodb/mongo-tools")
    (license license:asl2.0)))

;;; ===================================================================
;;; 3. kopia-bin — Cross-platform backup tool (pre-built)
;;; ===================================================================
(define-public kopia-bin
  (package
    (name "kopia-bin")
    (version "0.22.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kopia/kopia/releases/download/v"
                    version "/kopia-" version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0b8cg764a512rmi39gpswi4iwr1kxv393akwrbfkmirzh7h0dsfr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kopia" "bin/kopia"))))
    (synopsis "cross-platform backup tool with encryption and deduplication")
    (description "Kopia is a cross-platform backup and restore tool with
encryption, deduplication, compression, and cloud storage support.  It
provides both a command-line interface and a graphical user interface for
managing backup repositories and snapshots.")
    (home-page "https://github.com/kopia/kopia/")
    (license license:asl2.0)))

;;; ===================================================================
;;; 4. blockbench-bin — Low-poly 3D model editor (pre-built)
;;; ===================================================================
(define-public blockbench-bin
  (package
    (name "blockbench-bin")
    (version "5.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JannisX11/blockbench/releases/download/v"
                    version "/Blockbench_" version ".deb"))
              (sha256
               (base32
                "0v2laybcsx51b359w86cabcj4z7km1pinx3xfrxc7bjrn87am02v"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Blockbench/." "opt/blockbench/")
          ("usr/share/." "share/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar))
    (synopsis "low-poly 3D model editor for Minecraft and other games")
    (description "Blockbench is a free, modern 3D model editor designed for
creating low-poly models, textures, and animations.  It is widely used for
creating Minecraft resource packs and models for other block-based games,
with built-in UV editing and animation tools.")
    (home-page "https://blockbench.net")
    (license license:gpl3+)))

;;; ===================================================================
;;; 5. nexusmods-app-bin — Nexus Mods manager (pre-built)
;;; ===================================================================
(define-public nexusmods-app-bin
  (package
    (name "nexusmods-app-bin")
    (version "0.21.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Nexus-Mods/NexusMods.App/"
                    "releases/download/v" version
                    "/NexusMods.App-" version "-1.linux-x64.zip"))
              (sha256
               (base32
                "1iz18i89aa2mnracbbzqz64cpfpnkf2xi7lvi2v7w5r3s2rc2xhc"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/nexusmods-app/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/nexusmods-app/NexusMods.App")
                         (string-append out "/bin/nexusmods-app"))))))))
    (native-inputs (list unzip))
    (synopsis "mod installer and manager for popular games")
    (description "The Nexus Mods App is an open-source mod installer, creator,
and manager supporting popular games.  It provides one-click mod installation,
load order management, and integration with the NexusMods website for
downloading community-created game modifications.")
    (home-page "https://github.com/Nexus-Mods/NexusMods.App")
    (license license:gpl3+)))

;;; ===================================================================
;;; 6. wootility — Wooting keyboard configuration tool
;;; ===================================================================
(define-public wootility
  (package
    (name "wootility")
    (version "5.2.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://api.wooting.io/public/wootility/download"
                    "?os=linux&version=" version))
              (file-name (string-append "Wootility-" version ".AppImage"))
              (sha256
               (base32
                "1k36ndbi191inr6iqk70w8sd27ndxnf4zsn5fkqmv2xkiya70f3c"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("wootility" "bin/wootility"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "wootility")
              (chmod "wootility" #o755))))))
    (synopsis "configuration utility for Wooting analog keyboards")
    (description "Wootility is the official configuration application for
Wooting analog keyboards.  It allows customization of key mappings, actuation
points, RGB lighting, and firmware updates for Wooting keyboard models.")
    (home-page "https://wooting.io/wootility")
    (license (license:non-copyleft
              "https://wooting.io/terms"
              "Proprietary — Wooting Terms of Service"))))

;;; ===================================================================
;;; 7. kdrive-bin — Infomaniak kDrive sync client (pre-built)
;;; ===================================================================
(define-public kdrive-bin
  (package
    (name "kdrive-bin")
    (version "3.8.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.storage.infomaniak.com/drive/"
                    "desktopclient/kDrive-" version "-amd64.AppImage"))
              (sha256
               (base32
                "0k30vxr8ncwsh9sjwyc3fgmm1fmzp1bw6h4yc4nmhq3n31lp8cib"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kdrive" "bin/kdrive"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "kdrive")
              (chmod "kdrive" #o755))))))
    (synopsis "Infomaniak kDrive desktop synchronization client")
    (description "KDrive is the desktop synchronization client for Infomaniak
Drive cloud storage.  This pre-compiled AppImage version provides file
synchronization between your local machine and the Infomaniak kDrive cloud
storage service.")
    (home-page "https://drive.infomaniak.com")
    (license license:gpl2)))

;;; ===================================================================
;;; 8. sparrow-wallet — Bitcoin wallet focused on privacy
;;; ===================================================================
(define-public sparrow-wallet
  (package
    (name "sparrow-wallet")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sparrowwallet/sparrow/releases/"
                    "download/" version "/sparrowwallet-" version
                    "-x86_64.tar.gz"))
              (sha256
               (base32
                "08bbjgy3244mdlq6qbblv1192iv1kzr86jqpg2yky7pywrkm1yq6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "opt/sparrow-wallet/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/sparrow-wallet/bin/Sparrow")
                         (string-append out "/bin/sparrow-wallet"))))))))
    (synopsis "desktop Bitcoin wallet focused on security and privacy")
    (description "Sparrow Wallet is a Bitcoin wallet application that emphasizes
security, privacy, and usability.  It supports hardware wallets, multi-signature
setups, coin control, and integration with personal Bitcoin nodes.  Provides
detailed transaction analysis and UTXO management.")
    (home-page "https://sparrowwallet.com/")
    (license license:asl2.0)))

;;; ===================================================================
;;; 9. joplin-appimage — Cross-platform note taking app
;;; ===================================================================
(define-public joplin-appimage
  (package
    (name "joplin-appimage")
    (version "3.5.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/laurent22/joplin/releases/download/v"
                    version "/Joplin-" version ".AppImage"))
              (sha256
               (base32
                "17vjbmdnqpa3qarlzap85ls25cjnsj7q40293riy1247xw34ihk3"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("joplin" "bin/joplin-desktop"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "joplin")
              (chmod "joplin" #o755))))))
    (synopsis "cross-platform note taking and to-do application")
    (description "Joplin is an open-source note taking and to-do application
with synchronization capabilities.  It supports Markdown notes, end-to-end
encryption, and can synchronize with various cloud services including
Nextcloud, Dropbox, OneDrive, and Joplin Cloud.")
    (home-page "https://github.com/laurent22/joplin")
    (license license:expat)))

;;; ===================================================================
;;; 10. insync — Google Drive and OneDrive sync client
;;; ===================================================================
(define-public insync
  (package
    (name "insync")
    (version "3.9.8.60034")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://cdn.insynchq.com/builds/linux/"
                    version "/insync_" version "-noble_amd64.deb"))
              (sha256
               (base32
                "09vxhnp3013r0hg1jpfsmr3myliciy63ad1g3yvvawmqp01hmi7x"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/lib/insync/." "opt/insync/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/insync/insync")
                         (string-append out "/bin/insync"))))))))
    (native-inputs (list binutils tar))
    (synopsis "Google Drive, OneDrive, and Dropbox sync client for Linux")
    (description "Insync is a desktop synchronization client for Google Drive,
OneDrive, and Dropbox cloud storage services.  It provides selective sync,
multiple account support, and integration with Linux desktop file managers.")
    (home-page "https://www.insynchq.com/downloads")
    (license (license:non-copyleft
              "https://www.insynchq.com/terms"
              "Proprietary — Insync Terms of Service"))))

;;; ===================================================================
;;; 11. microsoft-edge-beta-bin — Microsoft Edge beta browser
;;; ===================================================================
(define-public microsoft-edge-beta-bin
  (package
    (name "microsoft-edge-beta-bin")
    (version "145.0.3800.53")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://packages.microsoft.com/repos/edge/pool/main/"
                    "m/microsoft-edge-beta/microsoft-edge-beta_"
                    version "-1_amd64.deb"))
              (sha256
               (base32
                "0749k5qs7pa5a5r7sfi4al8zg31d3r3w8g37ps8hzd0as4v2pzqk"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/microsoft/msedge-beta/." "opt/microsoft-edge-beta/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz")))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/microsoft-edge-beta/msedge")
                         (string-append out "/bin/microsoft-edge-beta"))))))))
    (native-inputs (list binutils tar))
    (synopsis "Chromium-based web browser from Microsoft (beta channel)")
    (description "Microsoft Edge is a Chromium-based web browser developed by
Microsoft.  This is the beta channel release, providing early access to
upcoming features and improvements before they reach the stable channel.")
    (home-page "https://www.microsoftedgeinsider.com/en-us/download")
    (license (license:non-copyleft
              "https://www.microsoft.com/en-us/legal/terms-of-use"
              "Proprietary — Microsoft Terms of Use"))))

;;; ===================================================================
;;; 12. local-by-flywheel-bin — Local WordPress development
;;; ===================================================================
(define-public local-by-flywheel-bin
  (package
    (name "local-by-flywheel-bin")
    (version "10.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.localwp.com/releases-stable/"
                    version "+6907/local-" version "-linux.rpm"))
              (sha256
               (base32
                "13d296ahng3qc7brbdynlbhbqwmfgca4hd5sfswpfrg1mbsz8zmw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("opt/Local/." "opt/local-wp/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-rpm
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "bsdtar" "-xf" (assoc-ref inputs "source"))))
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/local-wp/local")
                         (string-append out "/bin/local-wp"))))))))
    (native-inputs (list libarchive))
    (synopsis "local WordPress development environment")
    (description "Local (formerly Local by Flywheel) provides a complete local
WordPress development environment.  It includes built-in support for multiple
PHP versions, MySQL/MariaDB, nginx/Apache, and provides features like live
links, one-click admin access, and site cloning.")
    (home-page "https://localbyflywheel.com/")
    (license (license:non-copyleft
              "https://localwp.com/legal/terms-of-service"
              "Proprietary — Local WP Terms of Service"))))

;;; ===================================================================
;;; 13. exodus — Cryptocurrency wallet
;;; ===================================================================
(define-public exodus
  (package
    (name "exodus")
    (version "26.3.11")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.exodus.com/releases/"
                    "exodus-linux-x64-" version ".zip"))
              (sha256
               (base32
                "0wwyb7wbrgi9a0zgd77g477arhyind2rz99bvhzg5qfdj6bm8bd6"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Exodus-linux-x64/." "opt/exodus/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/exodus/Exodus")
                         (string-append out "/bin/exodus"))))))))
    (native-inputs (list unzip))
    (synopsis "multi-cryptocurrency desktop wallet")
    (description "Exodus is a desktop cryptocurrency wallet supporting over
260 cryptocurrencies.  It provides a built-in exchange, portfolio tracking,
and hardware wallet integration with Trezor.  Features an intuitive interface
for sending, receiving, and exchanging digital assets.")
    (home-page "https://exodus.com")
    (license (license:non-copyleft
              "https://www.exodus.com/legal/terms-of-service"
              "Proprietary — Exodus Terms of Service"))))

;;; ===================================================================
;;; 14. howdy-bin — Windows Hello facial authentication (pre-built)
;;; ===================================================================
(define-public howdy-bin
  (package
    (name "howdy-bin")
    (version "2.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/boltgolt/howdy/releases/download/v"
                    version "/howdy_" version ".deb"))
              (sha256
               (base32
                "0ky80ssfxbl0ibp5gimshx0i1r7ahabzpivs665m0m3zijfk4161"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/lib/security/." "lib/security/")
          ("usr/bin/." "bin/")
          ("etc/." "etc/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar))
    (synopsis "Windows Hello style facial authentication for Linux")
    (description "Howdy provides Windows Hello style facial authentication
for Linux.  It uses infrared cameras and face recognition to provide
passwordless login through PAM integration, supporting login screens,
sudo, and other authentication prompts.")
    (home-page "https://github.com/boltgolt/howdy")
    (license license:expat)))

;;; ===================================================================
;;; 15. davmail — Exchange gateway for POP/IMAP/SMTP/CalDAV
;;; ===================================================================
(define-public davmail
  (package
    (name "davmail")
    (version "6.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://downloads.sourceforge.net/davmail/davmail-"
                    version "-3873.zip"))
              (sha256
               (base32
                "14j7c0bf297ww4aljxi3qg8hvsr25zgnarsg51bmcblc7djbknfw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/davmail/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (with-output-to-file (string-append out "/bin/davmail")
                  (lambda ()
                    (display (string-append
                              "#!/bin/sh\n"
                              "exec java -jar "
                              out "/share/davmail/davmail.jar \"$@\"\n"))))
                (chmod (string-append out "/bin/davmail") #o755)))))))
    (native-inputs (list unzip))
    (synopsis "POP/IMAP/SMTP/CalDAV/LDAP gateway for Microsoft Exchange")
    (description "DavMail is a POP/IMAP/SMTP/CalDAV/CardDAV/LDAP Exchange
and Office 365 gateway.  It allows any standard email client to access
Exchange or Office 365 services using standard protocols, acting as a
local proxy between the email client and the Exchange server.")
    (home-page "http://davmail.sourceforge.net/")
    (license license:gpl2)))

;;; ===================================================================
;;; 16. brscan4 — Brother scanner SANE driver
;;; ===================================================================
(define-public brscan4
  (package
    (name "brscan4")
    (version "0.4.11-1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.brother.com/welcome/dlf105203/"
                    "brscan4-0.4.11-1.x86_64.rpm"))
              (sha256
               (base32
                "17yx91i5gngvf32z7x7kdgyxj7rggw0m2ibfh6mx9r4s6klcnzbx"))))
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
    (synopsis "SANE scanner drivers for Brother scanners")
    (description "Brscan4 provides SANE drivers for compatible Brother
multi-function printers and scanners.  It enables scanning functionality
through SANE-compatible applications like XSane, Simple Scan, or GIMP.")
    (home-page "http://support.brother.com")
    (license license:gpl2)))

;;; ===================================================================
;;; 17. spflashtool-bin — MediaTek flash tool
;;; ===================================================================
(define-public spflashtool-bin
  (package
    (name "spflashtool-bin")
    (version "6.2228")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://spflashtools.com/wp-content/uploads/"
                    "SP_Flash_Tool_v" version "_Linux.zip"))
              (sha256
               (base32
                "0r5s0rfrn39gl2mzg2h4rlpqw1zkd6is10i0nbh3k7hrpd0kq1hz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("SP_Flash_Tool_v6.2228_Linux/." "opt/spflashtool/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (mkdir-p (string-append out "/bin"))
                (symlink (string-append out "/opt/spflashtool/flash_tool")
                         (string-append out "/bin/spflashtool"))))))))
    (native-inputs (list unzip))
    (synopsis "flash tool for MediaTek (MTK) smartphones")
    (description "SP Flash Tool is an application for flashing firmware on
MediaTek (MTK) based smartphones and tablets.  It supports reading, writing,
and formatting the flash memory of MTK devices through a USB connection.")
    (home-page "http://spflashtools.com/category/linux")
    (license (license:non-copyleft
              "https://spflashtools.com/terms"
              "Proprietary — SP Flash Tool Terms"))))
