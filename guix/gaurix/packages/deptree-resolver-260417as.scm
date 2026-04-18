;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency tree resolver pass --- deptree-resolver-260417as
;;; Resolves 21 BLOCKED packages from dependency tree queue.
;;; 61 packages remain BLOCKED or resolved-to-existing after evaluation.
;;;
;;; New recipes (21):
;;;    1. lnd-bin (copy-build-system, v0.20.1-beta, MIT)
;;;    2. llama-cpp-bin (copy-build-system, vb7376, MIT)
;;;    3. throne-sysqt-bin (copy-build-system, v1.1.1, GPL-3.0)
;;;    4. codequill-bin (copy-build-system, v2.0.9, MIT)
;;;    5. electron35-bin (copy-build-system, v35.7.5, MIT)
;;;    6. electron18-bin (copy-build-system, v18.3.15, MIT)
;;;    7. microsoft-openjdk-11-bin (copy-build-system, v11.0.30, GPL-2.0)
;;;    8. microsoft-openjdk-17-bin (copy-build-system, v17.0.18, GPL-2.0)
;;;    9. microsoft-openjdk-21-bin (copy-build-system, v21.0.10, GPL-2.0)
;;;   10. nym-vpn-app-bin (copy-build-system, v1.27.0, GPL-3.0)
;;;   11. nym-vpnd-bin (copy-build-system, v1.27.0, GPL-3.0)
;;;   12. pakeplus-bin (copy-build-system, v2.2.3, MIT)
;;;   13. satisfactory-mod-manager-bin (copy-build-system, v3.0.5, GPL-3.0)
;;;   14. lightning-terminal-bin (copy-build-system, v0.16.0-alpha.rc1, MIT)
;;;   15. fluxer-world-bin (copy-build-system, v1.0.57, AGPL-3.0)
;;;   16. linux-wifi-hotspot-bin (copy-build-system, v4.7.2, BSD-2)
;;;   17. lbry-desktop-bin (copy-build-system, v0.53.9, MIT)
;;;   18. uzdoom-bin (copy-build-system, v4.14.3, GPL-3.0)
;;;   19. veikk-tablet-bin (copy-build-system, v3.5.8-3, nonfree)
;;;   20. fortune-mod-discworld (copy-build-system, v0, custom)
;;;   21. gdevelop-bin (copy-build-system, v5.6.266, MIT)
;;;
;;; NOTE: All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages deptree-resolver-260417as)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (lnd-bin
            llama-cpp-bin
            throne-sysqt-bin
            codequill-bin
            electron35-bin
            electron18-bin
            microsoft-openjdk-11-bin
            microsoft-openjdk-17-bin
            microsoft-openjdk-21-bin
            nym-vpn-app-bin
            nym-vpnd-bin
            pakeplus-bin
            satisfactory-mod-manager-bin
            lightning-terminal-bin
            fluxer-world-bin
            linux-wifi-hotspot-bin
            lbry-desktop-bin
            uzdoom-bin
            veikk-tablet-bin
            fortune-mod-discworld
            gdevelop-bin))

;;; Nonfree license for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

;;; ===================================================================
;;; 1. lnd-bin --- Lightning Network Daemon for Bitcoin
;;; ===================================================================
(define-public lnd-bin
  (package
    (name "lnd-bin")
    (version "0.20.1-beta")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lightningnetwork/lnd/releases"
                    "/download/v" version "/lnd-linux-amd64-v"
                    version ".tar.gz"))
              (sha256
               (base32
                "02jpfhlypvq6r8g8qfz287iall5252ilbmlz1yraficfl5dpa7z0"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append "lnd-linux-amd64-v"
                                       #$(package-version this-package))))
               (list (list (string-append dir "/lnd") "bin/lnd")
                     (list (string-append dir "/lncli") "bin/lncli")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightning network daemon for Bitcoin")
    (description
     "LND is a complete implementation of a Lightning Network node.  It
can create and manage channels, route payments, and generate invoices.
This package installs the prebuilt @command{lnd} daemon and
@command{lncli} command-line interface.")
    (home-page "https://github.com/lightningnetwork/lnd")
    (license license:expat)))

;;; ===================================================================
;;; 2. llama-cpp-bin --- prebuilt LLM inference engine
;;; ===================================================================
(define-public llama-cpp-bin
  (package
    (name "llama-cpp-bin")
    (version "b7376")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ggerganov/llama.cpp/releases"
                    "/download/" version "/llama-" version
                    "-bin-ubuntu-x64.zip"))
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32
                "1mgnfz50xms1hmdrcmvqkki13msy9x1a7dy5q53d0swvalclmjxb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("build/bin/" "bin/"
                #:include-regexp ("^llama-" "^rpc-"))
               ("build/bin/" "lib/"
                #:include-regexp ("^lib")))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "prebuilt LLM inference engine in C/C++")
    (description
     "Llama.cpp is a high-performance inference engine for large language
models written in C/C++.  It supports GGUF model format, quantization,
and runs on CPU with optional GPU acceleration.  This package installs
the prebuilt Ubuntu x64 binaries.")
    (home-page "https://github.com/ggerganov/llama.cpp")
    (license license:expat)))

;;; ===================================================================
;;; 3. throne-sysqt-bin --- GUI proxy utility powered by sing-box
;;; ===================================================================
(define-public throne-sysqt-bin
  (package
    (name "throne-sysqt-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/throneproj/Throne/releases"
                    "/download/" version "/Throne-" version
                    "-debian-system-qt-x64.deb"))
              (sha256
               (base32
                "077h66mi365a8ddvw1hfj4238czmg5c3lxlj10flk9ysar1mfxam"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/Throne/Throne" "bin/throne")
               ("opt/Throne/ThroneCore" "bin/throne-core"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform GUI proxy utility powered by sing-box")
    (description
     "Throne is a cross-platform GUI proxy utility powered by the sing-box
core.  It provides an intuitive interface for managing proxy
configurations.  This package installs the prebuilt Linux binary
without bundled Qt libraries.")
    (home-page "https://github.com/throneproj/Throne")
    (license license:gpl3)))

;;; ===================================================================
;;; 4. codequill-bin --- code snippet organizer and previewer
;;; ===================================================================
(define-public codequill-bin
  (package
    (name "codequill-bin")
    (version "2.0.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/The-Best-Codes/codequill/releases"
                    "/download/v" version "/CodeQuill-" version
                    "-1.x86_64.rpm"))
              (sha256
               (base32
                "0ss22kc1i3wnfxx6amhkdf7q5fi01nqs5vjhpyc3mspnp3wmrsph"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/codequill" "bin/codequill"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "bsdtar" "-xf"
                           (assoc-ref inputs "source")))))))
    (native-inputs (list libarchive))
    (supported-systems '("x86_64-linux"))
    (synopsis "code snippet organizer, editor, and previewer")
    (description
     "CodeQuill helps organize, edit, and preview code snippets
efficiently.  Built with Tauri for a lightweight desktop experience.
This package installs the prebuilt Linux binary.")
    (home-page "https://github.com/The-Best-Codes/codequill")
    (license license:expat)))

;;; ===================================================================
;;; 5. electron35-bin --- Electron framework version 35
;;; ===================================================================
(define-public electron35-bin
  (package
    (name "electron35-bin")
    (version "35.7.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/electron/electron/releases"
                    "/download/v" version "/electron-v" version
                    "-linux-x64.zip"))
              (sha256
               (base32
                "0ada9rafzi12bf9spxg1zik71rvr4xqlncqx25nhbqc945d1b39n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/electron35/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-symlink
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink "../lib/electron35/electron"
                              (string-append out "/bin/electron35"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform desktop application framework (version 35)")
    (description
     "Electron is a framework for building cross-platform desktop
applications using web technologies (HTML, CSS, JavaScript).  This
package provides prebuilt Electron 35 binaries for applications
that depend on this version.")
    (home-page "https://electronjs.org")
    (license license:expat)))

;;; ===================================================================
;;; 6. electron18-bin --- Electron framework version 18
;;; ===================================================================
(define-public electron18-bin
  (package
    (name "electron18-bin")
    (version "18.3.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/electron/electron/releases"
                    "/download/v" version "/electron-v" version
                    "-linux-x64.zip"))
              (sha256
               (base32
                "1v6ddryj0hy14dpfbgja08l71xdbm4vcy5myqvif08mzimj028a8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/electron18/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-symlink
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink "../lib/electron18/electron"
                              (string-append out "/bin/electron18"))))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "cross-platform desktop application framework (version 18)")
    (description
     "Electron is a framework for building cross-platform desktop
applications using web technologies.  This package provides prebuilt
Electron 18 binaries for legacy applications that require this version.")
    (home-page "https://electronjs.org")
    (license license:expat)))

;;; ===================================================================
;;; 7. microsoft-openjdk-11-bin --- Microsoft Build of OpenJDK 11
;;; ===================================================================
(define-public microsoft-openjdk-11-bin
  (package
    (name "microsoft-openjdk-11-bin")
    (version "11.0.30")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aka.ms/download-jdk/microsoft-jdk-"
                    version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "0j1q5npdavlp0p7pbb1l9pjjzhnvdw6mx5jgszv3xd7qqk1cmc9h"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/jvm/java-11-microsoft-openjdk/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft build of OpenJDK 11")
    (description
     "Microsoft Build of OpenJDK is a no-cost distribution of OpenJDK
that is open source and available for free.  It includes Long-Term
Support (LTS) binaries for Java 11 on x64 Linux.")
    (home-page "https://www.microsoft.com/openjdk")
    (license license:gpl2)))

;;; ===================================================================
;;; 8. microsoft-openjdk-17-bin --- Microsoft Build of OpenJDK 17
;;; ===================================================================
(define-public microsoft-openjdk-17-bin
  (package
    (name "microsoft-openjdk-17-bin")
    (version "17.0.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aka.ms/download-jdk/microsoft-jdk-"
                    version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1k6izgrc164xs61k3frsw6iil2r8z7fmllp7yfxl25wsv2bch2qb"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/jvm/java-17-microsoft-openjdk/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft build of OpenJDK 17")
    (description
     "Microsoft Build of OpenJDK is a no-cost distribution of OpenJDK
that is open source and available for free.  It includes Long-Term
Support (LTS) binaries for Java 17 on x64 Linux.")
    (home-page "https://www.microsoft.com/openjdk")
    (license license:gpl2)))

;;; ===================================================================
;;; 9. microsoft-openjdk-21-bin --- Microsoft Build of OpenJDK 21
;;; ===================================================================
(define-public microsoft-openjdk-21-bin
  (package
    (name "microsoft-openjdk-21-bin")
    (version "21.0.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aka.ms/download-jdk/microsoft-jdk-"
                    version "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1zb0rxd2f756zbiic1n94gmyy9f01lqibibn77mk96yargcq3jhq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/jvm/java-21-microsoft-openjdk/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "microsoft build of OpenJDK 21")
    (description
     "Microsoft Build of OpenJDK is a no-cost distribution of OpenJDK
that is open source and available for free.  It includes Long-Term
Support (LTS) binaries for Java 21 on x64 Linux.")
    (home-page "https://www.microsoft.com/openjdk")
    (license license:gpl2)))

;;; ===================================================================
;;; 10. nym-vpn-app-bin --- NymVPN desktop client
;;; ===================================================================
(define-public nym-vpn-app-bin
  (package
    (name "nym-vpn-app-bin")
    (version "1.27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nymtech/nym-vpn-client/releases"
                    "/download/nym-vpn-app-v" version
                    "/nym-vpn_" version "_linux_x64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0gn5kjwivfj00n5ba8pgk7f82hdmsn546pih6an3kj43p4w21g13"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'()
           #:phases
           #~(modify-phases %standard-phases
               (delete 'unpack)
               (replace 'install
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                            "/bin")))
                     (mkdir-p bin)
                     (copy-file (assoc-ref inputs "source")
                                (string-append bin "/nym-vpn-app"))
                     (chmod (string-append bin "/nym-vpn-app") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused VPN desktop client using Nym mixnet")
    (description
     "NymVPN is a privacy-focused VPN client that routes traffic through
the Nym mixnet for enhanced anonymity.  This package installs the
prebuilt Linux binary.")
    (home-page "https://github.com/nymtech/nym-vpn-client")
    (license license:gpl3)))

;;; ===================================================================
;;; 11. nym-vpnd-bin --- NymVPN daemon
;;; ===================================================================
(define-public nym-vpnd-bin
  (package
    (name "nym-vpnd-bin")
    (version "1.27.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nymtech/nym-vpn-client/releases"
                    "/download/nym-vpn-core-v" version
                    "/nym-vpn-core-v" version
                    "_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "1y4px4pvmny6lx8zi5hhbrajxannlqwzcy54fgk0kx5sibmkqyji"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append "nym-vpn-core-v"
                                       #$(package-version this-package)
                                       "_linux_x86_64")))
               (list (list (string-append dir "/nym-vpnd")
                           "bin/nym-vpnd")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "privacy-focused VPN daemon using Nym mixnet")
    (description
     "NymVPN daemon provides the backend service for routing traffic
through the Nym mixnet.  It manages tunnel interfaces and mixnet
connections.  This package installs the prebuilt daemon binary.")
    (home-page "https://github.com/nymtech/nym-vpn-client")
    (license license:gpl3)))

;;; ===================================================================
;;; 12. pakeplus-bin --- turn webpages into desktop applications
;;; ===================================================================
(define-public pakeplus-bin
  (package
    (name "pakeplus-bin")
    (version "2.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Sjj1024/PakePlus/releases"
                    "/download/PakePlus-v" version
                    "/PakePlus-" version "-1.x86_64.rpm"))
              (sha256
               (base32
                "1y5vzwbw4pww1vc4lbc6lz3y8l8nl69x7mr846bzgmpg78idp9pk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/PakePlus" "bin/pakeplus"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "bsdtar" "-xf"
                           (assoc-ref inputs "source")))))))
    (native-inputs (list libarchive))
    (supported-systems '("x86_64-linux"))
    (synopsis "turn any webpage into a lightweight desktop application")
    (description
     "PakePlus converts any webpage into a lightweight desktop application
using Rust and Tauri.  The resulting applications are typically only
5 MB in size.  This package installs the prebuilt Linux binary.")
    (home-page "https://pakeplus.com")
    (license license:expat)))

;;; ===================================================================
;;; 13. satisfactory-mod-manager-bin --- mod manager for Satisfactory
;;; ===================================================================
(define-public satisfactory-mod-manager-bin
  (package
    (name "satisfactory-mod-manager-bin")
    (version "3.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/satisfactorymodding/"
                    "SatisfactoryModManager/releases/download/v"
                    version "/SatisfactoryModManager_linux_amd64"))
              (file-name (string-append name "-" version))
              (sha256
               (base32
                "0l8zik64dsjqqdishisw8k1fpyzlyr1p6xgls7lhff65vcx05c84"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'()
           #:phases
           #~(modify-phases %standard-phases
               (delete 'unpack)
               (replace 'install
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                            "/bin")))
                     (mkdir-p bin)
                     (copy-file (assoc-ref inputs "source")
                                (string-append bin
                                  "/satisfactory-mod-manager"))
                     (chmod (string-append bin
                              "/satisfactory-mod-manager") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "mod manager for the Satisfactory game")
    (description
     "Satisfactory Mod Manager provides an easy way to install mods and
the mod loader for the Satisfactory game.  It handles mod dependencies
and version compatibility automatically.  This package installs the
prebuilt Linux binary.")
    (home-page
     "https://github.com/satisfactorymodding/SatisfactoryModManager")
    (license license:gpl3)))

;;; ===================================================================
;;; 14. lightning-terminal-bin --- Lightning Network management
;;; ===================================================================
(define-public lightning-terminal-bin
  (package
    (name "lightning-terminal-bin")
    (version "0.16.0-alpha.rc1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lightninglabs/lightning-terminal"
                    "/releases/download/v" version
                    "/lightning-terminal-linux-amd64-v" version
                    ".tar.gz"))
              (sha256
               (base32
                "00dc5m76i3hx6xvbzwxj90yyq4qx1hvf6akp61jmh3plzmnghkg9"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append
                         "lightning-terminal-linux-amd64-v"
                         #$(package-version this-package))))
               (list (list (string-append dir "/litd")
                           "bin/litd")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "browser-based Lightning Network channel management")
    (description
     "Lightning Terminal (LiT) provides a browser-based interface for
managing Lightning Network channel liquidity.  It integrates Loop,
Pool, and Faraday services into a single binary.  This package
installs the prebuilt litd daemon.")
    (home-page "https://github.com/lightninglabs/lightning-terminal")
    (license license:expat)))

;;; ===================================================================
;;; 15. fluxer-world-bin --- Fluxer World chat platform client
;;; ===================================================================
(define-public fluxer-world-bin
  (package
    (name "fluxer-world-bin")
    (version "1.0.57")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fluxerworld/fluxerworld/releases"
                    "/download/v" version "/Fluxer-World-" version
                    "-linux-x64.tar.gz"))
              (sha256
               (base32
                "1xgg2q1y5klli0xlzs4z5frgdz7x0sijz3fgav1vs2k6id72j9yn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((dir (string-append "Fluxer-World-"
                                       #$(package-version this-package)
                                       "-linux-x64")))
               (list (list dir "lib/fluxer-world/")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'create-symlink
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/bin"))
                     (symlink "../lib/fluxer-world/fluxer-world"
                              (string-append out
                                "/bin/fluxer-world"))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for the Fluxer World chat platform")
    (description
     "Fluxer World is an open-source chat, voice, and community platform.
This package installs the prebuilt Electron-based desktop client for
Linux x64.")
    (home-page "https://fluxer.world")
    (license license:agpl3+)))

;;; ===================================================================
;;; 16. linux-wifi-hotspot-bin --- wifi hotspot creator for Linux
;;; ===================================================================
(define-public linux-wifi-hotspot-bin
  (package
    (name "linux-wifi-hotspot-bin")
    (version "4.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lakinduakash/linux-wifi-hotspot"
                    "/releases/download/v" version
                    "/linux-wifi-hotspot_" version "_amd64.deb"))
              (sha256
               (base32
                "1m0sybba6pl542k6akhy60fqigm9f5mdshza3zv86cbyr3gblc9j"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/bin/" "bin/")
               ("etc/create_ap.conf" "etc/create_ap.conf"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-rich wifi hotspot creator for Linux")
    (description
     "Linux Wifi Hotspot provides both a GUI and CLI for creating wifi
hotspots on Linux.  It supports 2.4 GHz and 5 GHz bands, QR code
sharing, and connected client management.  This package installs the
prebuilt binary.")
    (home-page "https://github.com/lakinduakash/linux-wifi-hotspot")
    (license license:bsd-2)))

;;; ===================================================================
;;; 17. lbry-desktop-bin --- LBRY decentralized content platform
;;; ===================================================================
(define-public lbry-desktop-bin
  (package
    (name "lbry-desktop-bin")
    (version "0.53.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lbryio/lbry-desktop/releases"
                    "/download/v" version "/LBRY_" version ".deb"))
              (sha256
               (base32
                "1r53w0sihlhpvd8aifl7md3mx5qv65f23cj5v4qdkcmzmdwymcnk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/LBRY/" "lib/lbry/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-deb
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "ar" "x" (assoc-ref inputs "source"))
                   (invoke "tar" "xf" "data.tar.xz")))
               (add-after 'install 'create-symlinks
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin")))
                     (mkdir-p bin)
                     (symlink "../lib/lbry/lbry"
                              (string-append bin "/lbry"))))))))
    (native-inputs (list binutils tar xz))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop client for the LBRY decentralized content network")
    (description
     "LBRY Desktop is an Electron-based client for the LBRY decentralized
content network (Odysee).  It allows browsing, uploading, and
downloading content.  Note: active development has ended.  This
package installs the prebuilt binary.")
    (home-page "https://lbry.com")
    (license license:expat)))

;;; ===================================================================
;;; 18. uzdoom-bin --- feature-rich fork of GZDoom
;;; ===================================================================
(define-public uzdoom-bin
  (package
    (name "uzdoom-bin")
    (version "4.14.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/UZDoom/UZDoom/releases/download/"
                    version "/Linux-UZDoom-" version ".AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32
                "0rx18fx870jlykp23n1319p2376007vpkm5pfglgz98xjnmih2bs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'()
           #:phases
           #~(modify-phases %standard-phases
               (delete 'unpack)
               (replace 'install
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                            "/bin")))
                     (mkdir-p bin)
                     (copy-file (assoc-ref inputs "source")
                                (string-append bin "/uzdoom"))
                     (chmod (string-append bin "/uzdoom") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "feature-rich fork of the GZDoom engine")
    (description
     "UZDoom is a fork of GZDoom that adds additional features and
improvements to the classic Doom source port.  It supports hardware
rendering, modern effects, and extensive modding.  This package
installs the prebuilt AppImage binary.")
    (home-page "https://github.com/UZDoom/UZDoom")
    (license license:gpl3+)))

;;; ===================================================================
;;; 19. veikk-tablet-bin --- graphics tablet driver for Veikk devices
;;; ===================================================================
(define-public veikk-tablet-bin
  (package
    (name "veikk-tablet-bin")
    (version "3.5.8-3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://veikk.com/image/catalog/Software/vktablet-"
                    version ".x86_64.zip"))
              (sha256
               (base32
                "0kp4y90sls3jk26mfr8xf38gi5pr2pm65wi1z8nadww0cj30vjhv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key inputs #:allow-other-keys)
                   (invoke "unzip" "-q" (assoc-ref inputs "source"))
                   (invoke "bsdtar" "-xf"
                           (car (find-files "." "\\.rpm$"))))))))
    (native-inputs (list unzip libarchive))
    (supported-systems '("x86_64-linux"))
    (synopsis "graphics tablet driver for Veikk devices")
    (description
     "Veikk Tablet Driver provides pressure sensitivity, button mapping,
and display area configuration for Veikk drawing tablets.  This
package installs the prebuilt proprietary driver binary.")
    (home-page "https://www.veikk.com")
    (license license:nonfree)))

;;; ===================================================================
;;; 20. fortune-mod-discworld --- Discworld fortune cookies
;;; ===================================================================
(define-public fortune-mod-discworld
  (package
    (name "fortune-mod-discworld")
    (version "0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "http://www.splitbrain.org/_media/projects"
                    "/fortunes/fortune-discworld.tgz"))
              (sha256
               (base32
                "0lnx6b592mzmqgg4faz14iw9zdlys545xckn4c4xr0ci3q44xfqx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("fortune-discworld/discworld"
                "share/fortune/discworld")
               ("fortune-discworld/discworld.dat"
                "share/fortune/discworld.dat"))))
    (synopsis "fortune cookies from Terry Pratchett's Discworld novels")
    (description
     "This package provides fortune cookie quotes extracted from Terry
Pratchett's Discworld novel series.  Use with the @code{fortune-mod}
program to display random quotes.")
    (home-page
     "http://www.splitbrain.org/projects/fortunes/discworld")
    (license (license:non-copyleft
              "http://www.splitbrain.org/projects/fortunes/discworld"
              "Custom; see README in source"))))

;;; ===================================================================
;;; 21. gdevelop-bin --- open-source game development platform
;;; ===================================================================
(define-public gdevelop-bin
  (package
    (name "gdevelop-bin")
    (version "5.6.266")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/4ian/GDevelop/releases/download/v"
                    version "/GDevelop-5-" version ".AppImage"))
              (file-name (string-append name "-" version ".AppImage"))
              (sha256
               (base32
                "020rggyix1mqlk6vnk4vf5zqrgk7ydf52wh4zi4ils55m3qzd5aa"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'()
           #:phases
           #~(modify-phases %standard-phases
               (delete 'unpack)
               (replace 'install
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out")
                                            "/bin")))
                     (mkdir-p bin)
                     (copy-file (assoc-ref inputs "source")
                                (string-append bin "/gdevelop"))
                     (chmod (string-append bin "/gdevelop") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open-source no-code game development platform")
    (description
     "GDevelop is a full-featured, open-source game development platform
that requires no programming knowledge.  It provides a visual event
system and supports exporting to multiple platforms.  This package
installs the prebuilt AppImage binary.")
    (home-page "https://gdevelop.io")
    (license license:expat)))
