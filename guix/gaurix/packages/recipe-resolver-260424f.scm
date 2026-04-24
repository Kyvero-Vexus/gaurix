;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424f
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (30):
;;;         1.  brave-origin-beta-bin (copy-build-system, v1.91.87, MPL-2.0)
;;;         2.  weave-merge (cmake-build-system, v0.3.2, MIT/Apache-2.0)
;;;         3.  powershell-lts-bin (copy-build-system, v7.6.1, MIT)
;;;         4.  kosmos-bin (copy-build-system, v0.3.0, MIT)
;;;         5.  trae-bin (copy-build-system, v2.3.18717, MIT)
;;;         6.  motrix-next-bin (copy-build-system, v3.8.1, MIT)
;;;         7.  kavita-bin (copy-build-system, v0.8.9.1, GPL-3.0+)
;;;         8.  dota2-minify-bin (copy-build-system, v1.13.1, GPL-3.0+)
;;;         9.  quien-bin (copy-build-system, v0.7.2, MIT)
;;;        10.  linwood-butterfly-bin (copy-build-system, v2.5.0, AGPL-3.0)
;;;        11.  pangolin-bin (copy-build-system, v0.6.0, AGPL-3.0+)
;;;        12.  thunderbird-bin (copy-build-system, v150.0, MPL-2.0)
;;;        13.  vrcft-avalonia-bin (copy-build-system, v1.1.1.0, Apache-2.0)
;;;        14.  legendary-heroic-bin (copy-build-system, v0.20.42, GPL-3.0+)
;;;        15.  spotify-tui-bin (copy-build-system, v0.25.0, MIT)
;;;        16.  netronome-bin (copy-build-system, v0.11.0, GPL-2.0+)
;;;        17.  rdr-bin (copy-build-system, v0.7.0, MIT)
;;;        18.  concryptor-bin (copy-build-system, v1.0.5, AGPL-3.0+)
;;;        19.  sniffnet-bin (copy-build-system, v1.5.0, Apache-2.0/MIT)
;;;        20.  homebox-bin (copy-build-system, v0.25.0, AGPL-3.0)
;;;        21.  llama-panel-bin (copy-build-system, v0.11.0, MIT)
;;;        22.  marchat-bin (copy-build-system, v1.0.0, MIT)
;;;        23.  yaskkserv2-bin (copy-build-system, v0.1.7, Apache-2.0/MIT)
;;;        24.  typist-bin (copy-build-system, v2.0.1, MIT)
;;;        25.  tex-fmt-bin (copy-build-system, v0.5.6, MIT)
;;;        26.  timewall-bin (copy-build-system, v2.1.0, MIT)
;;;        27.  zrok2-bin (copy-build-system, v2.0.2, Apache-2.0)
;;;        28.  toofan-bin (copy-build-system, v2.1.0, MIT)
;;;        29.  screenix-bin (copy-build-system, v0.9.6, MIT)
;;;        30.  lektra-bin (copy-build-system, v0.6.9, AGPL-3.0)
;;;
;;; NOTE: sha256 hashes are REAL (obtained via `guix download`).

(define-module (gaurix packages recipe-resolver-260424f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:export (
            brave-origin-beta-bin
            weave-merge
            powershell-lts-bin
            kosmos-bin
            trae-bin
            motrix-next-bin
            kavita-bin
            dota2-minify-bin
            quien-bin
            linwood-butterfly-bin
            pangolin-bin
            thunderbird-bin
            vrcft-avalonia-bin
            legendary-heroic-bin
            spotify-tui-bin
            netronome-bin
            rdr-bin
            concryptor-bin
            sniffnet-bin
            homebox-bin
            llama-panel-bin
            marchat-bin
            yaskkserv2-bin
            typist-bin
            tex-fmt-bin
            timewall-bin
            zrok2-bin
            toofan-bin
            screenix-bin
            lektra-bin
            ))

;;; -------------------------------------------------------------------
;;; 1. brave-origin-beta-bin --- Brave Origin browser (beta)
;;; -------------------------------------------------------------------
(define-public brave-origin-beta-bin
  (package
    (name "brave-origin-beta-bin")
    (version "1.91.87")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/brave/brave-browser/releases/download/v"
                    version "/brave-origin-beta_" version "_amd64.deb"))
              (sha256
               (base32 "1aiiswbna7sal64k4vp3xkk84wv5q9syzpipyfl62726ay07msb5"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://brave.com/origin/download-beta")
    (synopsis "minimalist privacy-focused browser from the makers of Brave")
    (description "Brave Origin is a minimalist browser built by the Brave team,
focused on speed, privacy, and a distraction-free browsing experience.  This
is the beta channel release.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 2. weave-merge --- structured Git merge tool
;;; -------------------------------------------------------------------
(define-public weave-merge
  (package
    (name "weave-merge")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Ataraxy-Labs/weave/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1720y2gk7hf0hv5qhbmf1limy4cis27hr4a9vbqsciz5m5q7lba2"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                     (mkdir-p bin)
                     (when (file-exists? "weave")
                       (install-file "weave" bin))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Ataraxy-Labs/weave")
    (synopsis "structured Git merge tool for conflict resolution")
    (description "Weave is a Git merge driver that understands the structure
of common file formats, enabling automatic resolution of merge conflicts that
would otherwise require manual intervention.")
    (license (list license:expat license:asl2.0))))

;;; -------------------------------------------------------------------
;;; 3. powershell-lts-bin --- PowerShell LTS (binary)
;;; -------------------------------------------------------------------
(define-public powershell-lts-bin
  (package
    (name "powershell-lts-bin")
    (version "7.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/PowerShell/PowerShell/releases/download/v"
                    version "/powershell-lts_" version "-1.deb_amd64.deb"))
              (sha256
               (base32 "0h2jlfsfbvzbh7w95m0d8y379303sjcisg8if6x9zf61h1y9snh4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/PowerShell/PowerShell")
    (synopsis "cross-platform automation and configuration tool")
    (description "PowerShell is a cross-platform task automation solution
consisting of a command-line shell, a scripting language, and a configuration
management framework.  This is the long-term support binary release.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 4. kosmos-bin --- Tauri-based code editor (binary)
;;; -------------------------------------------------------------------
(define-public kosmos-bin
  (package
    (name "kosmos-bin")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/etchebarne/kosmos/releases/download/v"
                    version "/kosmos_" version "_amd64.deb"))
              (sha256
               (base32 "03dpqd082qi4f25yqdqc6kfx0gh4nd9gs9x8578wsi3knbgzi74f"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/etchebarne/kosmos")
    (synopsis "customizable tab-based code editor built with Tauri")
    (description "Kosmos is a highly customizable and versatile tab-based
code editor built with the Tauri framework for a native desktop experience.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 5. trae-bin --- AI-powered IDE (binary)
;;; -------------------------------------------------------------------
(define-public trae-bin
  (package
    (name "trae-bin")
    (version "2.3.18717")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/"
                    version "/linux/Trae-linux-x64.deb"))
              (sha256
               (base32 "0vf6sih1ibk0jg0nq2dp0lvn3scq09f8rf452dblx11j91wj274h"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://trae.ai")
    (synopsis "AI-powered code editor and IDE")
    (description "Trae is an AI-powered integrated development environment
that assists with code completion, debugging, and software development
workflows.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 6. motrix-next-bin --- download manager (binary)
;;; -------------------------------------------------------------------
(define-public motrix-next-bin
  (package
    (name "motrix-next-bin")
    (version "3.8.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AnInsomniacy/motrix-next/releases/download/v"
                    version "/MotrixNext_" version "_amd64.deb"))
              (sha256
               (base32 "1dhshwj5hv0yam9lqk65zhc0qbbq513l42svdi86a7xbd0fn0rh4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AnInsomniacy/motrix-next")
    (synopsis "full-featured download manager with modern interface")
    (description "Motrix Next is a full-featured download manager that
supports HTTP, FTP, BitTorrent, and Magnet links.  It provides a modern
user interface and advanced download management features.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. kavita-bin --- self-hosted reading server (binary)
;;; -------------------------------------------------------------------
(define-public kavita-bin
  (package
    (name "kavita-bin")
    (version "0.8.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Kareadita/Kavita/releases/download/v"
                    version "/kavita-linux-x64.tar.gz"))
              (sha256
               (base32 "1qizcsz05h8lzpnpsvvpg5fw9cdn6lbw111qw3lsfww9ifd1x6qs"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/kavita/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-bin
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                         (lib (string-append (assoc-ref outputs "out")
                                             "/lib/kavita")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/kavita")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/Kavita \"$@\"~%"
                                 lib)))
                     (chmod (string-append bin "/kavita") #o755)))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.kavitareader.com/")
    (synopsis "self-hosted ebook and comic reader server")
    (description "Kavita is a self-hosted digital library server for reading
ebooks, comics, and manga.  It supports EPUB, PDF, CBZ, CBR, and many
other formats with a web-based reader interface.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 8. dota2-minify-bin --- Dota 2 mod toolkit (binary)
;;; -------------------------------------------------------------------
(define-public dota2-minify-bin
  (package
    (name "dota2-minify-bin")
    (version "1.13.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Egezenn/dota2-minify/releases/download/"
                    "Minify-v" version "/Minify-v" version "-linux.zip"))
              (sha256
               (base32 "189978rnpaqkp527x4h1nl0jvysi7nrg3c2pck0gm32z5c4gn4fy"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dota2-minify/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-bin
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                         (share (string-append (assoc-ref outputs "out")
                                               "/share/dota2-minify")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/dota2-minify")
                       (lambda (port)
                         (format port "#!/bin/sh~%exec ~a/Minify \"$@\"~%"
                                 share)))
                     (chmod (string-append bin "/dota2-minify") #o755)))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Egezenn/dota2-minify")
    (synopsis "Dota 2 mod patcher and toolkit")
    (description "Dota 2 Minify is a mod patcher and toolkit for the game
Dota 2.  It provides tools for patching and managing game modifications.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 9. quien-bin --- container image inspection tool (binary)
;;; -------------------------------------------------------------------
(define-public quien-bin
  (package
    (name "quien-bin")
    (version "0.7.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/retlehs/quien/releases/download/v"
                    version "/quien_linux_amd64.tar.gz"))
              (sha256
               (base32 "1in29dwg5jz5995lj840wqsmyxzkq7wrvs1kfz9868mp18qvh1pm"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quien" "bin/quien"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/retlehs/quien")
    (synopsis "inspect who is inside a container image")
    (description "Quien is a command-line tool for inspecting the contents
and metadata of container images, helping you understand what is inside
OCI and Docker container images.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 10. linwood-butterfly-bin --- note-taking app (binary)
;;; -------------------------------------------------------------------
(define-public linwood-butterfly-bin
  (package
    (name "linwood-butterfly-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LinwoodDev/Butterfly/releases/download/v"
                    version "/linwood-butterfly-linux-x86_64.rpm"))
              (sha256
               (base32 "13r0870pfj4l7xqj9vfr0idrpgx9bic129cj60rbrmjdd572sxal"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "bsdtar" "-xf" source))))))
    (native-inputs (list (@ (gnu packages backup) libarchive)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://docs.butterfly.linwood.dev/")
    (synopsis "cross-platform note-taking and drawing application")
    (description "Butterfly by Linwood is a powerful, minimalistic,
cross-platform, open-source note-taking application.  It supports
handwriting, text notes, sketching, and document organization.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 11. pangolin-bin --- reverse proxy CLI tool (binary)
;;; -------------------------------------------------------------------
(define-public pangolin-bin
  (package
    (name "pangolin-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fosrl/cli/releases/download/"
                    version "/pangolin-cli_linux_amd64"))
              (sha256
               (base32 "1v674wz0yyvp69vpj180fgcdicq850p3x0h5dqz665w5xmw1ybif"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pangolin-cli_linux_amd64" "bin/pangolin"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "pangolin-cli_linux_amd64")
                   (chmod "pangolin-cli_linux_amd64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/fosrl/cli")
    (synopsis "CLI tool for the Pangolin reverse proxy")
    (description "Pangolin CLI is a command-line tool for managing
Pangolin, a self-hosted tunneled reverse proxy solution for exposing
services behind NATs and firewalls.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 12. thunderbird-bin --- Mozilla Thunderbird (binary)
;;; -------------------------------------------------------------------
(define-public thunderbird-bin
  (package
    (name "thunderbird-bin")
    (version "150.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://archive.mozilla.org/pub/thunderbird/releases/"
                    version "/linux-x86_64/en-US/thunderbird-"
                    version ".tar.xz"))
              (sha256
               (base32 "1mf3p9ag0mwr66195az0bswpi8w3pddd3s7865ld8mnn7f49cjvj"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "lib/thunderbird/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'install-bin
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((bin (string-append (assoc-ref outputs "out") "/bin"))
                         (lib (string-append (assoc-ref outputs "out")
                                             "/lib/thunderbird")))
                     (mkdir-p bin)
                     (symlink (string-append lib "/thunderbird")
                              (string-append bin "/thunderbird"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.mozilla.org/thunderbird")
    (synopsis "standalone mail and news reader from Mozilla")
    (description "Mozilla Thunderbird is a free and open-source email client,
news reader, and chat client.  It supports IMAP, POP3, SMTP, and many
extensions for additional functionality.  This is the prebuilt binary
release.")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 13. vrcft-avalonia-bin --- VR face tracking (binary AppImage)
;;; -------------------------------------------------------------------
(define-public vrcft-avalonia-bin
  (package
    (name "vrcft-avalonia-bin")
    (version "1.1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dfgHiatus/VRCFaceTracking.Avalonia/"
                    "releases/download/v" version
                    "/VRCFaceTracking.Avalonia." version ".x64.AppImage"))
              (sha256
               (base32 "0r44ir3d9h2bcczm8jimqd3jhkhn5li5ghka5wlcq2sznar2svx1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vrcft.AppImage" "bin/vrcft-avalonia"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "vrcft.AppImage")
                   (chmod "vrcft.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/dfgHiatus/VRCFaceTracking.Avalonia")
    (synopsis "cross-platform VR face tracking application")
    (description "VRCFaceTracking Avalonia is a cross-platform face tracking
application for VR, built with the Avalonia UI framework.  It provides
real-time facial expression tracking for use in VRChat and other VR
applications.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 14. legendary-heroic-bin --- Epic Games Launcher replacement (binary)
;;; -------------------------------------------------------------------
(define-public legendary-heroic-bin
  (package
    (name "legendary-heroic-bin")
    (version "0.20.42")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Heroic-Games-Launcher/legendary/"
                    "releases/download/" version "/legendary_linux_x86_64"))
              (sha256
               (base32 "1bxmi40m33picy506ndsa2a044f37d15kp5zcnbyzg0jyxqk7fhn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("legendary_linux_x86_64" "bin/legendary"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "legendary_linux_x86_64")
                   (chmod "legendary_linux_x86_64" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Heroic-Games-Launcher/legendary")
    (synopsis "free replacement for the Epic Games Launcher")
    (description "Legendary is a free and open-source replacement for the
Epic Games Launcher.  This is the fork maintained by the Heroic Games
Launcher project, providing game installation, updating, and launching
from the command line.")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 15. spotify-tui-bin --- terminal Spotify client (binary)
;;; -------------------------------------------------------------------
(define-public spotify-tui-bin
  (package
    (name "spotify-tui-bin")
    (version "0.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Rigellute/spotify-tui/releases/download/v"
                    version "/spotify-tui-linux.tar.gz"))
              (sha256
               (base32 "1q6ii0xqkxhjx8xpqnigwk7xpq2gracyrbjvy1g5bi5l9yn858iz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("spt" "bin/spt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Rigellute/spotify-tui")
    (synopsis "Spotify client for the terminal written in Rust")
    (description "spotify-tui (@code{spt}) is a terminal-based Spotify
client written in Rust.  It allows you to browse and play music, manage
playlists, and control playback from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 16. netronome-bin --- network speed testing tool (binary)
;;; -------------------------------------------------------------------
(define-public netronome-bin
  (package
    (name "netronome-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/autobrr/netronome/releases/download/v"
                    version "/netronome_" version "_linux_x86_64.tar.gz"))
              (sha256
               (base32 "1y5cnncjjrxfnbg6zmlj12ivmjjx1vyjqnhv6cjs75wsnhbkgpiz"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("netronome" "bin/netronome"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/autobrr/netronome")
    (synopsis "modern network speed testing and monitoring tool")
    (description "Netronome is a network speed testing and monitoring tool
that provides accurate bandwidth measurements for download, upload, and
latency testing.")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 17. rdr-bin --- terminal RSS/Atom feed reader (binary)
;;; -------------------------------------------------------------------
(define-public rdr-bin
  (package
    (name "rdr-bin")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/iRootPro/rdr/releases/download/v"
                    version "/rdr_linux_amd64.tar.gz"))
              (sha256
               (base32 "0syafmj4wnzlw21xrqy51midk18amb53cd157mypkidzicasri6s"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("rdr" "bin/rdr"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/iRootPro/rdr")
    (synopsis "terminal RSS and Atom feed reader built with Go")
    (description "rdr is a terminal-based RSS and Atom feed reader written
in Go.  It provides a text-based interface for subscribing to and reading
web feeds from the command line.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 18. concryptor-bin --- file encryption engine (binary)
;;; -------------------------------------------------------------------
(define-public concryptor-bin
  (package
    (name "concryptor-bin")
    (version "1.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/FrogSnot/Concryptor/releases/download/v"
                    version "/concryptor-linux-x86_64.tar.gz"))
              (sha256
               (base32 "13gc4wmc0bgwfx5r54cbx30hkqkari2df5qgh7a4d6l0kwv7k2n2"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("concryptor" "bin/concryptor"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/FrogSnot/Concryptor")
    (synopsis "multi-threaded file encryption engine")
    (description "Concryptor is a high-performance, multi-threaded file
encryption engine capable of processing data at gigabyte-per-second speeds.
It provides secure file encryption from the command line.")
    (license license:agpl3+)))

;;; -------------------------------------------------------------------
;;; 19. sniffnet-bin --- network traffic monitor (binary AppImage)
;;; -------------------------------------------------------------------
(define-public sniffnet-bin
  (package
    (name "sniffnet-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/GyulyVGC/sniffnet/releases/download/v"
                    version "/Sniffnet_LinuxAppImage_amd64.AppImage"))
              (sha256
               (base32 "0kjvrj3ww4sp88mndq4q8pld98r31x7sca6b3x4d67c3d40kdmmc"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("sniffnet.AppImage" "bin/sniffnet"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "sniffnet.AppImage")
                   (chmod "sniffnet.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/GyulyVGC/sniffnet")
    (synopsis "comfortable network traffic monitoring application")
    (description "Sniffnet is an application to comfortably monitor your
network traffic.  It provides real-time visualizations and statistics
about your network connections, with filtering and notification
capabilities.")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 20. homebox-bin --- home inventory system (binary)
;;; -------------------------------------------------------------------
(define-public homebox-bin
  (package
    (name "homebox-bin")
    (version "0.25.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sysadminsmedia/homebox/releases/download/v"
                    version "/homebox_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0h3ryxfpymjxmz6c93rxh8gxzy4ygbyrz7kcwrh06pnvmcjpfhx1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("homebox" "bin/homebox"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/sysadminsmedia/homebox")
    (synopsis "inventory and organization system for home users")
    (description "Homebox is a self-hosted inventory and organization system
built for the home user.  It provides a web interface for tracking household
items, their locations, labels, and associated metadata.")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 21. llama-panel-bin --- llama-server command centre (binary)
;;; -------------------------------------------------------------------
(define-public llama-panel-bin
  (package
    (name "llama-panel-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlexsJones/llama-panel/releases/download/v"
                    version "/llama-panel-v" version "-linux-amd64.deb"))
              (sha256
               (base32 "15g6a4dx8vvd86iackki0zb1x58cdzavysc0i1rh2q17h53mm6d7"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("usr/" ""))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.gz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AlexsJones/llama-panel")
    (synopsis "llama-server command centre and management panel")
    (description "Llama Panel is a command centre for managing llama-server
instances.  It provides a graphical interface for monitoring, configuring,
and controlling LLM inference servers.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. marchat-bin --- terminal chat application (binary)
;;; -------------------------------------------------------------------
(define-public marchat-bin
  (package
    (name "marchat-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Cod-e-Codes/marchat/releases/download/v"
                    version "/marchat-v" version "-linux-amd64.zip"))
              (sha256
               (base32 "0n924pw8bhcpy1s9rxjm4bdy38527c3spsr5k55d0l7szpviwpxw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("marchat" "bin/marchat"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Cod-e-Codes/marchat")
    (synopsis "terminal chat application using WebSockets")
    (description "Marchat is a terminal-based chat application that uses
WebSockets for real-time communication.  It provides a simple command-line
interface for group chat.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. yaskkserv2-bin --- SKK server in Rust (binary)
;;; -------------------------------------------------------------------
(define-public yaskkserv2-bin
  (package
    (name "yaskkserv2-bin")
    (version "0.1.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/wachikun/yaskkserv2/releases/download/"
                    version "/yaskkserv2-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "0kk3daxawl7y05xq2p0pkjm0ckrrbabz50xlk5ilkj94x6qsjwyv"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("yaskkserv2" "bin/yaskkserv2")
               ("yaskkserv2_make_dictionary" "bin/yaskkserv2_make_dictionary"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/wachikun/yaskkserv2")
    (synopsis "SKK server rewritten in Rust")
    (description "yaskkserv2 is Yet Another SKK server, rewritten in Rust
for performance and safety.  SKK is a Japanese input method, and yaskkserv2
provides dictionary lookup services for SKK clients.")
    (license (list license:asl2.0 license:expat))))

;;; -------------------------------------------------------------------
;;; 24. typist-bin --- typing practice application (binary)
;;; -------------------------------------------------------------------
(define-public typist-bin
  (package
    (name "typist-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/chuma-beep/typist/releases/download/v"
                    version "/typist_" version "_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "1510rbcz17i2fd9c53pa81c9pb367nvzvg92m0a57kb75a42v9w4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("typist" "bin/typist"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/chuma-beep/typist")
    (synopsis "cross-platform CLI and web UI typing application")
    (description "Typist is a cross-platform typing practice application
that provides both a command-line interface and a web UI for improving
typing speed and accuracy.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 25. tex-fmt-bin --- fast LaTeX formatter (binary)
;;; -------------------------------------------------------------------
(define-public tex-fmt-bin
  (package
    (name "tex-fmt-bin")
    (version "0.5.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/WGUNDERWOOD/tex-fmt/releases/download/v"
                    version "/tex-fmt-x86_64-linux.tar.gz"))
              (sha256
               (base32 "0q1rzkws33zl3bdhvqg97m7mfakmylilpnacq2bv70nhg680zp0c"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("tex-fmt" "bin/tex-fmt"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/WGUNDERWOOD/tex-fmt")
    (synopsis "extremely fast LaTeX formatter written in Rust")
    (description "tex-fmt is an extremely fast LaTeX formatter written in
Rust.  It provides consistent formatting for LaTeX source files with
minimal configuration.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 26. timewall-bin --- dynamic HEIF wallpaper tool (binary)
;;; -------------------------------------------------------------------
(define-public timewall-bin
  (package
    (name "timewall-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bcyran/timewall/releases/download/"
                    version "/timewall-" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32 "18sh6c74k2q2n91nngzj200a6c1if3950anm56j4hl73lv56mvxk"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("timewall" "bin/timewall"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/bcyran/timewall")
    (synopsis "Apple dynamic HEIF wallpapers on GNU/Linux")
    (description "Timewall enables Apple-style dynamic HEIF wallpapers on
GNU/Linux.  It automatically changes the desktop wallpaper based on the
time of day, using images stored in HEIF format.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 27. zrok2-bin --- open-source sharing solution (binary)
;;; -------------------------------------------------------------------
(define-public zrok2-bin
  (package
    (name "zrok2-bin")
    (version "2.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openziti/zrok/releases/download/v"
                    version "/zrok_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "1lyak61rawc0x4kfasd69y5rwsfzqgp07wn8nvkrc0bdl22hvv6r"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("zrok" "bin/zrok"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/openziti/zrok")
    (synopsis "open-source sharing solution built on OpenZiti")
    (description "zrok is an open-source sharing solution built on top of
the OpenZiti network overlay.  It allows you to share files, services,
and web applications over a secure zero-trust network.")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 28. toofan-bin --- terminal typing test (binary)
;;; -------------------------------------------------------------------
(define-public toofan-bin
  (package
    (name "toofan-bin")
    (version "2.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/vyrx-dev/toofan/releases/download/v"
                    version "/toofan_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "048js7fhd6ygiy5ampfyaz804493m1lvajx1m85sgynzicjy954l"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("toofan" "bin/toofan"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/vyrx-dev/toofan")
    (synopsis "minimal and fast terminal typing test")
    (description "Toofan is a minimal, lightning-fast typing test for the
terminal.  It provides quick typing speed measurements with a clean
command-line interface.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. screenix-bin --- screen recorder (binary)
;;; -------------------------------------------------------------------
(define-public screenix-bin
  (package
    (name "screenix-bin")
    (version "0.9.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mathisdev7/screenix-releases/"
                    "releases/download/v" version
                    "/Screenix_" version "_amd64.deb"))
              (sha256
               (base32 "0xnnksap5i70bwd6hyq9d47kw66407212mp3ig1kcsy8bfkax1mg"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("opt/" "opt/")
               ("usr/share/" "share/"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/mathisdev7/screenix")
    (synopsis "professional screen recorder with smooth zoom effects")
    (description "Screenix is a professional screen recorder application
that provides smooth zoom effects, cursor tracking, and other advanced
recording features.")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 30. lektra-bin --- high-performance PDF reader (binary)
;;; -------------------------------------------------------------------
(define-public lektra-bin
  (package
    (name "lektra-bin")
    (version "0.6.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/lektra/lektra/releases/download/v"
                    version "/lektra-" version "-x86_64.tar.gz"))
              (sha256
               (base32 "1k9gk4dlyk441s7k90417sbvpap5m7nh5jnabjrfgfd2r53hwabw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("lektra" "bin/lektra"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://codeberg.org/lektra/lektra")
    (synopsis "high-performance PDF reader for screen-first reading")
    (description "Lektra is a high-performance PDF reader that prioritizes
screen-first reading.  It provides fast rendering and a streamlined
reading experience for PDF documents.")
    (license license:agpl3)))
