;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417an
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; New recipes (22):
;;;    1.  fresh-editor-bin (copy-build-system, v0.2.14, GPL-2.0)
;;;    2.  ferris-scan-bin (copy-build-system, v0.25, MIT)
;;;    3.  iwmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;    4.  pwmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;    5.  bzmenu-bin (copy-build-system, v0.4.0, GPL-3.0)
;;;    6.  sabiql-bin (copy-build-system, v1.9.1, MIT)
;;;    7.  datui-bin (copy-build-system, v0.2.52, MIT)
;;;    8.  dsw-bin (copy-build-system, v0.0.3, MIT)
;;;    9.  seamonkey-bin (copy-build-system, v2.53.23, MPL-2.0)
;;;   10.  neovide-bin (copy-build-system, v0.16.1, MIT)
;;;   11.  paket-bin (copy-build-system, v0.1.3, Apache-2.0/MIT)
;;;   12.  marktext-tkaixiang-bin (copy-build-system, v0.18.2, MIT)
;;;   13.  stremio-service-bin (copy-build-system, v0.1.15, GPL-2.0)
;;;   14.  maretf-bin (copy-build-system, v0.10.2, MIT)
;;;   15.  vcard-studio-bin (copy-build-system, v1.5.0, CC0)
;;;   16.  kanri-bin (copy-build-system, v0.8.2, GPL-3.0+)
;;;   17.  clash-geoip (copy-build-system, v202511270021, CC-BY-SA/GPL-3.0)
;;;   18.  qtilitools (cmake-build-system, v0.1.2, BSD-3)
;;;   19.  osslsigncode (cmake-build-system, v2.12, GPL-3.0+)
;;;   20.  apngasm (cmake-build-system, v3.1.10, LGPL-2.1+)
;;;   21.  libcava (meson-build-system, v0.10.7, MIT)
;;;   22.  charliecloud (gnu-build-system, v0.43, Apache-2.0)
;;;
;;; BLOCKED (8):
;;;   23. fortune-mod-calvin (LICENSE_UNKNOWN — fortune file collection with
;;;       no declared license; author/origin unclear; cannot determine FOSS status)
;;;   24. fortune-mod-hitchhiker (LICENSE_UNKNOWN — Hitchhiker's Guide quotes;
;;;       copyrighted work, no FOSS license for quotation collection)
;;;   25. fortune-mod-discworld (LICENSE_RESTRICTIVE — Discworld quotes;
;;;       "Copyright" declared; copyrighted literary work, not FOSS-distributable)
;;;   26. breeze-contrast-cursor-theme (SOURCE_UNAVAILABLE — upstream URL
;;;       code.jpope.org returns 404/download failure; A1: primary URL dead;
;;;       A2: no mirror found; A3: no alternative source)
;;;   27. somewm-git (COMPLEX_DEPS — Wayland compositor porting AwesomeWM;
;;;       requires wlroots as meson subproject + luajit + seatd + vulkan +
;;;       many xcb/wayland libs; A1: too many unpackaged deps; A2: wlroots
;;;       subproject needs specific version pinning; A3: incomplete upstream)
;;;   28. input-remapper (MISSING_PYTHON_DEPS — Python GUI needing 10+ deps
;;;       not in Guix: python-evdev, python-dasbus, python-pydantic, etc.;
;;;       A1: package all deps — excessive scope; A2: some deps have native
;;;       extensions; A3: systemd integration incompatible with Guix System)
;;;   29. openhue-cli (GO_VENDORING — Go CLI for Philips Hue; requires
;;;       vendored Go module dependency tree; A1: go-build-system needs
;;;       Go module imports; A2: no pre-built binary published; A3: CGO
;;;       flags suggest native deps)
;;;   30. alt-sendme-bin (COMPLEX_DEPS — Tauri app requiring webkit2gtk-4.1,
;;;       gtk3, libsoup3, glib2, cairo, gdk-pixbuf2; A1: webkit2gtk version
;;;       mismatch in Guix; A2: .deb repack feasible but heavy library
;;;       patching needed; A3: upstream only provides .deb format)
;;;
;;; 22 new recipes + 8 BLOCKED = 30 resolved
;;;
;;; All sha256 hashes obtained via `guix download` or `guix hash`.

(define-module (gaurix packages recipe-resolver-260417an)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages audio)
  #:export (
            fresh-editor-bin
            ferris-scan-bin
            iwmenu-bin
            pwmenu-bin
            bzmenu-bin
            sabiql-bin
            datui-bin
            dsw-bin
            seamonkey-bin
            neovide-bin
            paket-bin
            marktext-tkaixiang-bin
            stremio-service-bin
            maretf-bin
            vcard-studio-bin
            kanri-bin
            clash-geoip
            qtilitools
            osslsigncode
            apngasm
            libcava
            charliecloud
            ))

;;; ===================================================================
;;; 1. fresh-editor-bin — terminal editor with LSP support (pre-built)
;;; ===================================================================
(define-public fresh-editor-bin
  (package
    (name "fresh-editor-bin")
    (version "0.2.14")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sinelaw/fresh/releases/download/v"
                    version "/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0r0j7x52f14d01ik1fk8pw55a5aikvhrsvzcl4i9nsyvkw56l0bh"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("fresh-editor-x86_64-unknown-linux-gnu/fresh" "bin/fresh")
          ("fresh-editor-x86_64-unknown-linux-gnu/plugins" "share/fresh-editor/plugins"))))
    (synopsis "lightweight terminal text editor with LSP support")
    (description "Fresh is a lightweight, fast terminal-based text editor with
Language Server Protocol support and a TypeScript plugin system.  It provides
a modern editing experience in the terminal with minimal configuration.")
    (home-page "https://github.com/sinelaw/fresh")
    (license license:gpl2)))

;;; ===================================================================
;;; 2. ferris-scan-bin — Rust-themed vulnerability scanner (pre-built)
;;; ===================================================================
(define-public ferris-scan-bin
  (package
    (name "ferris-scan-bin")
    (version "0.25")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vnilabean/ferris-scan/releases/download/v"
                    version "/ferris-scan-tui-v" version "-linux"))
              (sha256
               (base32
                "1a2sb0w04a3qnxdbjg7nf74zab949wpsj5yfgbx5v9yfgws8fbq4"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ferris-scan-tui" "bin/ferris-scan-tui"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "ferris-scan-tui")
              (chmod "ferris-scan-tui" #o755))))))
    (synopsis "network vulnerability scanner with terminal interface")
    (description "Ferris Scan is a network vulnerability scanner providing a
terminal user interface for scanning hosts and identifying potential security
issues.  It provides both TUI and GUI variants for flexible usage.")
    (home-page "https://github.com/Vnilabean/ferris-scan")
    (license license:expat)))

;;; ===================================================================
;;; 3. iwmenu-bin — interactive Wi-Fi menu for iwd (pre-built)
;;; ===================================================================
(define-public iwmenu-bin
  (package
    (name "iwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/iwmenu/releases/download/v"
                    version "/iwmenu-x86_64-linux-gnu"))
              (sha256
               (base32
                "1pwkv6a8h5kx82dn7wpd9n701i510v2zwjzykd66r9rpm9pkc2rf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("iwmenu" "bin/iwmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "iwmenu")
              (chmod "iwmenu" #o755))))))
    (synopsis "interactive Wi-Fi menu for iwd using dmenu/rofi/fuzzel")
    (description "Iwmenu is an interactive menu for managing Wi-Fi connections
through iwd.  It integrates with dmenu, rofi, wofi, fuzzel, or other
dmenu-compatible launchers for a seamless wireless network selection
experience.")
    (home-page "https://github.com/e-tho/iwmenu")
    (license license:gpl3)))

;;; ===================================================================
;;; 4. pwmenu-bin — interactive PipeWire audio menu (pre-built)
;;; ===================================================================
(define-public pwmenu-bin
  (package
    (name "pwmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/pwmenu/releases/download/v"
                    version "/pwmenu-x86_64-linux-gnu"))
              (sha256
               (base32
                "0gj12lpwx6zw3p6gcda1gq7cr5frsvzzq1plra2sm511m0lg3rbj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("pwmenu" "bin/pwmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "pwmenu")
              (chmod "pwmenu" #o755))))))
    (synopsis "interactive PipeWire audio device menu using dmenu/rofi")
    (description "Pwmenu is an interactive menu for managing PipeWire audio
devices and streams.  It integrates with dmenu, rofi, wofi, fuzzel, or other
dmenu-compatible launchers for quick audio output and input selection.")
    (home-page "https://github.com/e-tho/pwmenu")
    (license license:gpl3)))

;;; ===================================================================
;;; 5. bzmenu-bin — interactive Bluetooth menu (pre-built)
;;; ===================================================================
(define-public bzmenu-bin
  (package
    (name "bzmenu-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/e-tho/bzmenu/releases/download/v"
                    version "/bzmenu-x86_64-linux-gnu"))
              (sha256
               (base32
                "0ggnand2ih6s1si6amp0mnl9r6d4gjj65vx03kysmzdvggxy71a2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bzmenu" "bin/bzmenu"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-binary
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "bzmenu")
              (chmod "bzmenu" #o755))))))
    (synopsis "interactive Bluetooth device menu using dmenu/rofi/fuzzel")
    (description "Bzmenu is an interactive menu for managing Bluetooth devices.
It integrates with dmenu, rofi, wofi, fuzzel, or other dmenu-compatible
launchers for quick Bluetooth device pairing and connection management.")
    (home-page "https://github.com/e-tho/bzmenu")
    (license license:gpl3)))

;;; ===================================================================
;;; 6. sabiql-bin — TUI for PostgreSQL queries (pre-built)
;;; ===================================================================
(define-public sabiql-bin
  (package
    (name "sabiql-bin")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/riii111/sabiql/releases/download/v"
                    version "/sabiql-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "0mp1x9k4v9r5snba1m07ywbhx6d6kx85zrbhq19wrkh2bv24y0ay"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sabiql" "bin/sabiql"))))
    (synopsis "terminal user interface for PostgreSQL database queries")
    (description "Sabiql is a terminal user interface for querying PostgreSQL
databases interactively.  It provides a streamlined interface for writing
and executing SQL queries with syntax highlighting and result navigation.")
    (home-page "https://github.com/riii111/sabiql")
    (license license:expat)))

;;; ===================================================================
;;; 7. datui-bin — data exploration TUI (pre-built)
;;; ===================================================================
(define-public datui-bin
  (package
    (name "datui-bin")
    (version "0.2.52")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/derekwisong/datui/releases/download/v"
                    version "/datui-" version "-x86_64.tar.gz"))
              (sha256
               (base32
                "067jyxzrcn56pjly9jprs3mfq6ig947wq3ahpqna64kb7sds9gc7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("datui" "bin/datui"))))
    (synopsis "terminal user interface for exploring tabular data files")
    (description "Datui is a terminal user interface for exploring and
navigating tabular data files such as CSV and Parquet.  It provides
interactive filtering, sorting, and browsing of datasets directly
in the terminal.")
    (home-page "https://github.com/derekwisong/datui")
    (license license:expat)))

;;; ===================================================================
;;; 8. dsw-bin — dotfiles sync wrapper (pre-built Go binary)
;;; ===================================================================
(define-public dsw-bin
  (package
    (name "dsw-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/albertoboccolini/dsw/releases/download/v"
                    version "/dsw_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "1w5wac5sgc96ryyszvwri60qgivxzrlripqk91gpwq97yhn9cjli"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dsw" "bin/dsw"))))
    (synopsis "command-line dotfiles sync wrapper")
    (description "Dsw (Dotfiles Sync Wrapper) is a command-line tool for
synchronizing dotfiles across machines.  It provides a simple interface
for managing and syncing configuration files using Git.")
    (home-page "https://github.com/albertoboccolini/dsw")
    (license license:expat)))

;;; ===================================================================
;;; 9. seamonkey-bin — Mozilla internet suite (pre-built)
;;; ===================================================================
(define-public seamonkey-bin
  (package
    (name "seamonkey-bin")
    (version "2.53.23")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://archive.seamonkey-project.org/releases/"
                    version "/linux-x86_64/en-US/seamonkey-"
                    version ".en-US.linux-x86_64.tar.bz2"))
              (sha256
               (base32
                "1si5vqprq7hgm366db76yziqxcqdvxj675kgxb6lp2ppprl8rlkw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("seamonkey" "lib/seamonkey"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/seamonkey")))
                (mkdir-p bin)
                (symlink (string-append lib "/seamonkey")
                         (string-append bin "/seamonkey"))))))))
    (synopsis "all-in-one internet application suite from Mozilla")
    (description "SeaMonkey is an all-in-one internet application suite
containing a web browser, email and newsgroup client, HTML editor, IRC chat
client, and web development tools.  It is the continuation of the former
Mozilla Application Suite.")
    (home-page "https://www.seamonkey-project.org")
    (license license:mpl2.0)))

;;; ===================================================================
;;; 10. neovide-bin — graphical Neovim client (pre-built Rust binary)
;;; ===================================================================
(define-public neovide-bin
  (package
    (name "neovide-bin")
    (version "0.16.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/neovide/neovide/releases/download/"
                    version "/neovide-linux-x86_64.tar"))
              (sha256
               (base32
                "09js3hw4i9kj36v4vfvqn3sbsjv1iibji9ws946q77slkfy5k7bd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("neovide" "bin/neovide"))))
    (synopsis "graphical Neovim client with smooth scrolling and animations")
    (description "Neovide is a no-nonsense graphical user interface for Neovim.
It features smooth scrolling, animated cursor, blurred floating windows,
emoji support, and a native feel while maintaining full Neovim compatibility.")
    (home-page "https://neovide.dev")
    (license license:expat)))

;;; ===================================================================
;;; 11. paket-bin — lightweight package manager for Fish shell (pre-built)
;;; ===================================================================
(define-public paket-bin
  (package
    (name "paket-bin")
    (version "0.1.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/joseluisq/paket/releases/download/v"
                    version "/paket-v" version
                    "-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "14vhan3wk36g9rqaknpx6nqj49w4vqjdpjls5k7lxs564hvyczis"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("paket" "bin/paket"))))
    (synopsis "simple and fast package manager for the Fish shell")
    (description "Paket is a simple and fast package manager for the Fish
shell.  It handles installation, updating, and removal of Fish shell
plugins and themes from Git repositories.")
    (home-page "https://github.com/joseluisq/paket")
    (license (list license:asl2.0 license:expat))))

;;; ===================================================================
;;; 12. marktext-tkaixiang-bin — Markdown editor (pre-built Electron)
;;; ===================================================================
(define-public marktext-tkaixiang-bin
  (package
    (name "marktext-tkaixiang-bin")
    (version "0.18.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Tkaixiang/marktext/releases/download/v"
                    version "/marktext-linux-" version ".tar.gz"))
              (sha256
               (base32
                "18m4xdngqry9fsfg69g6lbwrwcp879vmm75xa9ahvccvj1q4ib58"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "lib/marktext"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/marktext")))
                (mkdir-p bin)
                (symlink (string-append lib "/marktext")
                         (string-append bin "/marktext"))))))))
    (synopsis "modernized Markdown editor fork with real-time preview")
    (description "MarkText (Tkaixiang fork) is a modernized fork of the
MarkText Markdown editor with updated dependencies and bug fixes.  It
features real-time preview, support for CommonMark and GitHub Flavored
Markdown, and a distraction-free writing mode.")
    (home-page "https://github.com/Tkaixiang/marktext")
    (license license:expat)))

;;; ===================================================================
;;; 13. stremio-service-bin — Stremio background service (binary from .deb)
;;; ===================================================================
(define-public stremio-service-bin
  (package
    (name "stremio-service-bin")
    (version "0.1.15")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Stremio/stremio-service/releases/download/v"
                    version "/stremio-service_amd64.deb"))
              (sha256
               (base32
                "1k2z9df6qjpzvvxbri26qxrf94fahpqxy4swq7izgc47axs4l7sw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin" "bin")
          ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.xz")))
          (delete 'install-license-files))))
    (native-inputs (list binutils tar))
    (synopsis "background service for the Stremio media center")
    (description "Stremio Service is the background service component for
Stremio, a media center application.  It handles streaming, addon
management, and media playback coordination for the Stremio ecosystem.")
    (home-page "https://www.stremio.com")
    (license license:gpl2)))

;;; ===================================================================
;;; 14. maretf-bin — VTF texture file viewer/converter (pre-built)
;;; ===================================================================
(define-public maretf-bin
  (package
    (name "maretf-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/craftablescience/MareTF/releases/download/v"
                    version "/MareTF-Linux-Standalone-gcc-release.zip"))
              (sha256
               (base32
                "0fknb4l6midv1wg71cp5cqgl04yjjpq3lnz78f6bpmc0viz9896l"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("maretf" "bin/maretf")
          ("maretf_gui" "bin/maretf_gui"))))
    (native-inputs (list unzip))
    (synopsis "viewer and converter for Valve Texture Format files")
    (description "MareTF is a tool for viewing and converting Valve Texture
Format (VTF) files used in Source Engine games.  It provides both a
command-line interface and a graphical user interface for texture inspection
and conversion.")
    (home-page "https://github.com/craftablescience/MareTF")
    (license license:expat)))

;;; ===================================================================
;;; 15. vcard-studio-bin — contact management application (binary from .deb)
;;; ===================================================================
(define-public vcard-studio-bin
  (package
    (name "vcard-studio-bin")
    (version "1.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://svn.zdechov.net/vcard-studio/bin/deb/vcard-studio_"
                    version "_amd64.deb"))
              (sha256
               (base32
                "1c9vr0kc3zq1z4mqcbxv69qw0mgyadb9wa0kjyr79pzfwgd9ns1k"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin" "bin")
          ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.zst")))
          (delete 'install-license-files))))
    (native-inputs (list binutils tar zstd))
    (synopsis "contact management application with vCard support")
    (description "VCard Studio is a contact management application with
support for vCard format.  It allows importing, editing, exporting, and
organizing contacts with a graphical user interface.")
    (home-page "https://app.zdechov.net/vcard-studio")
    (license license:cc0)))

;;; ===================================================================
;;; 16. kanri-bin — offline Kanban board application (binary from .deb)
;;; ===================================================================
(define-public kanri-bin
  (package
    (name "kanri-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kanriapp/kanri/releases/download/app-v"
                    version "/kanri_" version "_amd64.deb"))
              (sha256
               (base32
                "05bgpb8fddkgczz6i13bjpx5sfpcnja7jjv46ifjfmqfa0l8dppk"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/bin" "bin")
          ("usr/share" "share"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'extract-deb
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "ar" "x" (assoc-ref inputs "source"))
              (invoke "tar" "xf" "data.tar.gz")))
          (delete 'install-license-files))))
    (native-inputs (list binutils tar))
    (synopsis "modern offline Kanban board application")
    (description "Kanri is a modern, offline-first Kanban board application
built with Tauri.  It supports multiple boards, drag-and-drop card management,
customizable columns, and works entirely without an internet connection.")
    (home-page "https://kanriapp.com")
    (license license:gpl3+)))

;;; ===================================================================
;;; 17. clash-geoip — GeoIP database for Clash proxy (data file)
;;; ===================================================================
(define-public clash-geoip
  (package
    (name "clash-geoip")
    (version "202511270021")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Loyalsoldier/geoip/releases/download/"
                    version "/Country.mmdb"))
              (sha256
               (base32
                "154jdavrfx105l6vhz28qjdiy1089sli33c6k8zm5f1z1ir30mw7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Country.mmdb" "share/clash/Country.mmdb"))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'prepare-file
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "Country.mmdb"))))))
    (synopsis "GeoIP MaxMind database for Clash proxy routing")
    (description "This package provides a GeoIP MaxMind database file
(Country.mmdb) for use with Clash and compatible proxy tools.  It maps
IP addresses to country codes for rule-based proxy routing.")
    (home-page "https://github.com/Loyalsoldier/geoip")
    (license (list license:cc-by-sa4.0 license:gpl3+))))

;;; ===================================================================
;;; 18. qtilitools — shell utility scripts (cmake)
;;; ===================================================================
(define-public qtilitools
  (package
    (name "qtilitools")
    (version "0.1.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/qtilities/qtilitools/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "139axzbhk4zfm64pr97by4rsdd6p4r74l8w3dcs3havl5dghrakr"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list bash))
    (synopsis "collection of shell utility scripts from Qtilities")
    (description "Qtilitools is a collection of shell utility scripts from
the Qtilities project.  It provides various helper commands for common
system administration and development tasks.")
    (home-page "https://github.com/qtilities/qtilitools")
    (license license:bsd-3)))

;;; ===================================================================
;;; 19. osslsigncode — Microsoft Authenticode signing tool
;;; ===================================================================
(define-public osslsigncode
  (package
    (name "osslsigncode")
    (version "2.12")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mtrojnar/osslsigncode/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0bnq6543svpy2gwqsl61d95shak2jy6pl45szjda9ifl6z4jl2kc"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release")
      #:tests? #f))
    (inputs (list curl openssl))
    (synopsis "Microsoft Authenticode signing and timestamping tool")
    (description "Osslsigncode is a tool for signing and timestamping
PE (Windows executable), MSI, and CAB files using Microsoft Authenticode.
It uses OpenSSL and libcurl for cryptographic operations and timestamp
server communication.")
    (home-page "https://github.com/mtrojnar/osslsigncode")
    (license license:gpl3+)))

;;; ===================================================================
;;; 20. apngasm — animated PNG assembler
;;; ===================================================================
(define-public apngasm
  (package
    (name "apngasm")
    (version "3.1.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/apngasm/apngasm/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "0v0gp12zr38bmgl7ikp389vf7khmblgcn80k0si33ckssg0y4wc1"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'fix-man-path
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (when (file-exists? (string-append out "/man"))
                  (mkdir-p (string-append out "/share/man"))
                  (rename-file (string-append out "/man/man1")
                               (string-append out "/share/man/man1"))
                  (rmdir (string-append out "/man")))))))))
    (inputs (list libpng boost zlib))
    (synopsis "assembler for creating animated PNG files from frames")
    (description "Apngasm is a tool for creating Animated PNG (APNG) files
from individual PNG frames.  It supports configurable frame delays, loop
counts, and various optimization options for producing efficient APNG
animations.")
    (home-page "https://github.com/apngasm/apngasm")
    (license license:lgpl2.1+)))

;;; ===================================================================
;;; 21. libcava — shared library fork of the Cava audio visualizer
;;; ===================================================================
(define-public libcava
  (package
    (name "libcava")
    (version "0.10.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/LukashonakV/cava/archive/"
                    version ".tar.gz"))
              (sha256
               (base32
                "1zwy4s2x43iy6jl33vczzwj9lhmg5d57857qawv50v69x49n9k2h"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-Dcava_font=false")
      #:tests? #f))
    (inputs (list fftw ncurses alsa-lib sdl2 libpulse))
    (native-inputs (list pkg-config))
    (synopsis "shared library version of the Cava audio visualizer")
    (description "Libcava is a shared library fork of Cava, the Console-based
Audio Visualizer for Alsa.  It provides the audio visualization functionality
as a library that can be embedded in other applications, supporting ALSA,
PulseAudio, PipeWire, and other audio backends.")
    (home-page "https://github.com/LukashonakV/cava")
    (license license:expat)))

;;; ===================================================================
;;; 22. charliecloud — lightweight HPC container runtime
;;; ===================================================================
(define-public charliecloud
  (package
    (name "charliecloud")
    (version "0.43")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.com/charliecloud/charliecloud/-/archive/v"
                    version "/charliecloud-v" version ".tar.gz"))
              (sha256
               (base32
                "1m693x983y8cvrqmjbpl7k02xpwpkhdgx2f9iaik5v4zc1lrpw7j"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (replace 'bootstrap
            (lambda _
              (invoke "sh" "autogen.sh"))))))
    (native-inputs (list autoconf automake))
    (inputs (list python))
    (synopsis "lightweight container runtime for HPC environments")
    (description "Charliecloud provides user-defined software stacks for
high-performance computing centers.  It uses Linux user namespaces to run
containers with no privileged operations or daemons, making it suitable
for multi-tenant HPC environments where Docker is not appropriate.")
    (home-page "https://hpc.github.io/charliecloud/")
    (license license:asl2.0)))
