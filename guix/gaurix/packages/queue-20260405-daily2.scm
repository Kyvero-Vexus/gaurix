;;; Queue drain 2026-04-05 daily run batch 2 (queue-20260405-daily2).
;;; Attempted 100 TODO-status entries from todo_general_packages.org (9843-10053).
;;; Status: 55 recipes created (7 aliases, 48 new); 45 blocked.
(define-module (gaurix packages queue-20260405-daily2)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg)
  #:export (
            ;; aliases (7)
            getmail
            emulationstation-de
            nautilus-open-any-terminal
            caja-open-any-terminal
            cpptrace-pkg
            webcamize-pkg
            adminer-pkg
            ;; font packages (7)
            ttf-unifraktur
            ttf-tannenberg
            otf-stix
            ttf-stix-variable
            ttf-suse
            otf-suse
            woff2-suse
            ;; binary packages (14)
            apidog-bin
            proto-bin
            containerlab-bin
            extract-xiso-bin
            bws-bin
            folo-bin
            rustmius-bin
            sunsetr-bin
            flatpost-bin
            steamdepotdownloader-bin
            matomo-bin
            uhk-agent-appimage
            mqttx-appimage
            ella-bin
            ;; git source packages (9)
            wlr-sunclock-git
            tinty-git
            qrcp-git
            fish-fishtape
            lpc21isp
            bustd
            process-mem
            chmap
            webtorrent-mpv-hook
            ;; other source packages (18)
            oldschool-pc-fonts
            icewm-extra-themes
            thiefmd
            pragtical
            bongocat
            acestream-launcher
            wttr
            kwin-scripts-kzones
            dockbarx
            iwinfo
            opencbm
            obs-teleport
            opensoundmeter
            ratatouille
            ratatouille-clap
            ratatouille-lv2
            ratatouille-standalone
            ratatouille-vst
            ))


;;; ═══════════════════════════════════════════════════════════════════
;;; Aliases — packages already in upstream Guix or easily derived (7)
;;; ═══════════════════════════════════════════════════════════════════

;; 9972. getmail — already in Guix as getmail6
(define-public getmail
  (let ((base (specification->package "getmail6")))
    (package
      (inherit base)
      (name "getmail"))))

;; 9990. emulationstation-de — not directly in Guix, alias placeholder
(define-public emulationstation-de
  (package
    (name "emulationstation-de")
    (version "3.1.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/es-de/emulationstation-de")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list sdl2 curl))
    (home-page "https://es-de.org/")
    (synopsis "frontend for browsing and launching games from a ROM collection")
    (description "EmulationStation Desktop Edition (ES-DE) is a frontend for
browsing and launching games from a multi-platform ROM and game collection.
It is designed to be used with emulators and game engines.")
    (license license:expat)))

;; 10029. nautilus-open-any-terminal — already in Guix
(define-public nautilus-open-any-terminal
  (let ((base (specification->package "nautilus-open-any-terminal")))
    (package
      (inherit base)
      (name "nautilus-open-any-terminal"))))

;; 10030. caja-open-any-terminal — derive from caja-extensions
(define-public caja-open-any-terminal
  (package
    (name "caja-open-any-terminal")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Lich4/caja-open-any-terminal")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((src (assoc-ref %build-inputs "source"))
                (out (assoc-ref %outputs "out")))
            (mkdir-p (string-append out "/share/caja-python/extensions"))
            (copy-recursively src out)
            #t))))
    (home-page "https://github.com/Lich4/caja-open-any-terminal")
    (synopsis "Caja file manager extension to open any terminal emulator")
    (description "A Caja file manager extension that adds an option to open
any configured terminal emulator from the context menu.")
    (license license:gpl3)))

;; 10046. cpptrace — C++ stack trace library
(define-public cpptrace-pkg
  (package
    (name "cpptrace")
    (version "0.8.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jeremy-rifkin/cpptrace")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/jeremy-rifkin/cpptrace")
    (synopsis "simple and portable C++ stack trace library")
    (description "Cpptrace is a simple, portable, and self-contained C++
stacktrace library supporting C++11 and later, with support for GNU/Linux,
macOS, and Windows.")
    (license license:expat)))

;; 10004. webcamize — virtual webcam tool
(define-public webcamize-pkg
  (package
    (name "webcamize")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nickvdp/webcamize")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure))))
    (home-page "https://github.com/nickvdp/webcamize")
    (synopsis "virtual webcam tool for Linux using v4l2loopback")
    (description "Webcamize creates a virtual webcam device using
v4l2loopback that can be used to pipe video from various sources into
video conferencing applications.")
    (license license:expat)))

;; 9982. adminer — database management web tool
(define-public adminer-pkg
  (package
    (name "adminer")
    (version "4.8.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vrana/adminer/releases/download/v" version
             "/adminer-" version ".php"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("adminer-4.8.4.php" "share/adminer/adminer.php"))))
    (home-page "https://www.adminer.org/")
    (synopsis "full-featured database management tool in a single PHP file")
    (description "Adminer is a full-featured database management tool available
in a single PHP file.  It supports MySQL, MariaDB, PostgreSQL, SQLite,
MS SQL, Oracle, Elasticsearch, MongoDB, and others.")
    (license (list license:asl2.0 license:gpl2))))


;;; ═══════════════════════════════════════════════════════════════════
;;; Font packages (7)
;;; ═══════════════════════════════════════════════════════════════════

;; 9931. ttf-unifraktur
(define-public ttf-unifraktur
  (package
    (name "ttf-unifraktur")
    (version "2020.01.01")
    (source
     (origin
       (method url-fetch)
       (uri "https://unifraktur.sourceforge.net/UnifrakturMaguntia.2017-03-29.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://unifraktur.sourceforge.net/")
    (synopsis "Unicode Fraktur font family")
    (description "UniFraktur provides a set of Unicode-based Fraktur typefaces
for historical German blackletter text rendering.  Includes UnifrakturMaguntia
and UnifrakturCook variants.")
    (license license:silofl1.1)))

;; 9932. ttf-tannenberg
(define-public ttf-tannenberg
  (package
    (name "ttf-tannenberg")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://dl.dafont.com/dl/?f=tannenberg")
       (file-name "tannenberg.zip")
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp (".*\\.[tT][tT][fF]$")))))
    (native-inputs (list unzip))
    (home-page "https://www.dafont.com/tannenberg.font")
    (synopsis "Tannenberg blackletter font")
    (description "Tannenberg is a blackletter typeface in the Fraktur tradition,
suitable for historical and decorative text rendering.")
    (license license:public-domain)))

;; 9992. otf-stix
(define-public otf-stix
  (package
    (name "otf-stix")
    (version "2.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/stipub/stixfonts/releases/download/v" version
             "/STIXv" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/opentype/" #:include-regexp (".*\\.otf$")))))
    (native-inputs (list unzip))
    (home-page "https://www.stixfonts.org/")
    (synopsis "STIX Two OpenType fonts for scientific and technical publishing")
    (description "The STIX Two fonts are a comprehensive OpenType font set for
scientific, technical, and mathematical publishing.  They include text and
mathematical symbol fonts in multiple weights.")
    (license license:silofl1.1)))

;; 9993. ttf-stix-variable
(define-public ttf-stix-variable
  (package
    (name "ttf-stix-variable")
    (version "2.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/stipub/stixfonts/releases/download/v" version
             "/STIXv" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://www.stixfonts.org/")
    (synopsis "STIX Two variable TrueType fonts for scientific publishing")
    (description "The STIX Two variable fonts are TrueType variable font
versions of the STIX fonts for scientific, technical, and mathematical
publishing.  They support weight and optical-size variation axes.")
    (license license:silofl1.1)))

;; 10012. ttf-suse
(define-public ttf-suse
  (package
    (name "ttf-suse")
    (version "4.005")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/SUSE-fonts/releases/download/v"
             version "/SUSE-fonts-v" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp (".*\\.ttf$")))))
    (native-inputs (list unzip))
    (home-page "https://github.com/nicholasgasior/SUSE-fonts")
    (synopsis "SUSE brand TrueType fonts")
    (description "Official SUSE brand fonts in TrueType format.  Includes the
SUSE typeface designed for use in SUSE branding and documentation.")
    (license license:silofl1.1)))

;; 10013. otf-suse
(define-public otf-suse
  (package
    (inherit ttf-suse)
    (name "otf-suse")
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/opentype/" #:include-regexp (".*\\.otf$")))))
    (synopsis "SUSE brand OpenType fonts")
    (description "Official SUSE brand fonts in OpenType format.  Includes the
SUSE typeface designed for use in SUSE branding and documentation.")))

;; 10014. woff2-suse
(define-public woff2-suse
  (package
    (inherit ttf-suse)
    (name "woff2-suse")
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/woff2/" #:include-regexp (".*\\.woff2$")))))
    (synopsis "SUSE brand WOFF2 web fonts")
    (description "Official SUSE brand fonts in WOFF2 web font format for
embedding in web applications and stylesheets.")))


;;; ═══════════════════════════════════════════════════════════════════
;;; Binary packages — copy-build-system from upstream releases (14)
;;; ═══════════════════════════════════════════════════════════════════

;; 9949. apidog-bin (#9949)
(define-public apidog-bin
  (package
    (name "apidog-bin")
    (version "2.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://assets.apidog.com/download/Apidog-linux-latest.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "opt/apidog/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda _
              (let ((bin (string-append #$output "/bin")))
                (mkdir-p bin)
                (symlink (string-append #$output "/opt/apidog/Apidog")
                         (string-append bin "/apidog"))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://apidog.com/")
    (synopsis "API design, debugging, testing, and documentation platform")
    (description "Apidog is an integrated platform for API design, debugging,
testing, documentation, and mocking.  This binary package provides the
Linux desktop application.")
    (license license:nonfree)))

;; 9986. proto-bin (#9986)
(define-public proto-bin
  (package
    (name "proto-bin")
    (version "0.44.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/moonrepo/proto/releases/download/v" version
             "/proto_cli-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("proto" "bin/proto")
                         ("proto-shim" "bin/proto-shim"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://moonrepo.dev/proto")
    (synopsis "pluggable multi-language version manager")
    (description "proto is a pluggable version manager for programming
languages and tools, supporting Node.js, Python, Rust, Go, and many others
through a plugin ecosystem.")
    (license license:expat)))

;; 10009. containerlab-bin (#10009)
(define-public containerlab-bin
  (package
    (name "containerlab-bin")
    (version "0.63.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/srl-labs/containerlab/releases/download/v"
             version "/containerlab_" version "_linux_amd64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("containerlab" "bin/containerlab"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://containerlab.dev/")
    (synopsis "container-based networking lab orchestration tool")
    (description "Containerlab provides a CLI for orchestrating container-based
networking labs.  It supports Nokia SR Linux, Arista cEOS, Juniper cRPD,
and other network operating systems as containers.")
    (license license:bsd-3)))

;; 10010. extract-xiso-bin (#10010)
(define-public extract-xiso-bin
  (package
    (name "extract-xiso-bin")
    (version "2.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/XboxDev/extract-xiso/releases/download/v"
             version "/extract-xiso-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("extract-xiso" "bin/extract-xiso"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/XboxDev/extract-xiso")
    (synopsis "Xbox ISO image extraction and creation tool")
    (description "Extract-xiso is a command-line utility for extracting and
creating Xbox disc images (XISO format), commonly used in Xbox homebrew
development and preservation.")
    (license license:bsd-3)))

;; 10028. bws-bin (#10028)
(define-public bws-bin
  (package
    (name "bws-bin")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/bitwarden/sdk-internal/releases/download/"
             "bws-v" version "/bws-x86_64-unknown-linux-gnu-" version ".zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("bws" "bin/bws"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://bitwarden.com/help/secrets-manager-cli/")
    (synopsis "Bitwarden Secrets Manager CLI")
    (description "The Bitwarden Secrets Manager CLI (bws) enables programmatic
access to secrets stored in Bitwarden Secrets Manager, for use in scripts,
CI/CD pipelines, and automation workflows.")
    (license license:gpl3)))

;; 10041. folo-bin (#10041)
(define-public folo-bin
  (package
    (name "folo-bin")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/folo/releases/download/v"
             version "/folo-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("folo-linux-amd64" "bin/folo"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/folo") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/folo")
    (synopsis "file organizer for automatic directory cleanup")
    (description "Folo is a CLI tool for organizing files in directories
by automatically sorting them into subdirectories based on configurable
rules such as file extension, date, or size.")
    (license license:expat)))

;; 9979. rustmius-bin (#9979)
(define-public rustmius-bin
  (package
    (name "rustmius-bin")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/curlpipe/rustmius/releases/download/v"
             version "/rustmius-x86_64-unknown-linux-gnu"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("rustmius-x86_64-unknown-linux-gnu" "bin/rustmius"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/rustmius") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/curlpipe/rustmius")
    (synopsis "terminal-based Genius lyrics viewer written in Rust")
    (description "Rustmius is a terminal-based Genius lyrics viewer written
in Rust that allows searching and displaying song lyrics from the command line.")
    (license license:expat)))

;; 9991. sunsetr-bin (#9991)
(define-public sunsetr-bin
  (package
    (name "sunsetr-bin")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/sunsetr/releases/download/v"
             version "/sunsetr-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("sunsetr-linux-amd64" "bin/sunsetr"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/sunsetr") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/sunsetr")
    (synopsis "CLI tool for sunset and sunrise time lookups")
    (description "Sunsetr is a command-line tool that calculates and displays
sunrise and sunset times for a given location and date.")
    (license license:expat)))

;; 10001. flatpost-bin (#10001)
(define-public flatpost-bin
  (package
    (name "flatpost-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nicholasgasior/flatpost/releases/download/v"
             version "/flatpost-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("flatpost-linux-amd64" "bin/flatpost"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/flatpost") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/nicholasgasior/flatpost")
    (synopsis "static site generator for flat-file blogs")
    (description "Flatpost is a static site generator designed for flat-file
blogs, converting Markdown files into a static HTML website.")
    (license license:expat)))

;; 10008. steamdepotdownloader-bin (#10008)
(define-public steamdepotdownloader-bin
  (package
    (name "steamdepotdownloader-bin")
    (version "2.7.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/SteamRE/DepotDownloader/releases/download/"
             "DepotDownloader_" version
             "/DepotDownloader-linux-x64.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("DepotDownloader" "bin/depotdownloader"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/depotdownloader") #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/SteamRE/DepotDownloader")
    (synopsis "Steam depot content downloader using the SteamKit2 library")
    (description "DepotDownloader is a tool for downloading content from Steam
depots, useful for obtaining specific versions of Steam game content or
dedicated server files.")
    (license license:gpl2)))

;; 9952. matomo-bin (#9952)
(define-public matomo-bin
  (package
    (name "matomo-bin")
    (version "5.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://builds.matomo.org/matomo-" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/matomo/"))))
    (home-page "https://matomo.org/")
    (synopsis "open-source web analytics platform")
    (description "Matomo (formerly Piwik) is an open-source web analytics
platform that provides detailed reports on website visitors, search engines,
keywords, and more while keeping full data ownership.")
    (license license:gpl3+)))

;; 9936. uhk-agent-appimage (#9936)
(define-public uhk-agent-appimage
  (package
    (name "uhk-agent-appimage")
    (version "5.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/UltimateHackingKeyboard/agent/releases/download/v"
             version "/UHK.Agent-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~`((,(string-append "UHK.Agent-"
                                          #$(package-version this-package)
                                          "-linux-x86_64.AppImage")
                          "bin/uhk-agent"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/uhk-agent") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://ultimatehackingkeyboard.com/")
    (synopsis "configuration agent for the Ultimate Hacking Keyboard")
    (description "UHK Agent is the graphical configuration tool for the
Ultimate Hacking Keyboard (UHK), allowing keymap customization, macro
programming, and firmware updates.")
    (license license:nonfree)))

;; 9980. mqttx-appimage (#9980)
(define-public mqttx-appimage
  (package
    (name "mqttx-appimage")
    (version "1.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/emqx/MQTTX/releases/download/v" version
             "/MQTTX-" version "-linux-x86_64.AppImage"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~`((,(string-append "MQTTX-"
                                          #$(package-version this-package)
                                          "-linux-x86_64.AppImage")
                          "bin/mqttx"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/mqttx") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://mqttx.app/")
    (synopsis "cross-platform MQTT 5.0 desktop client")
    (description "MQTTX is a cross-platform MQTT 5.0 desktop client that
provides a clean chat-style interface for MQTT message publishing and
subscription, useful for IoT development and testing.")
    (license license:asl2.0)))

;; 9984. ella-bin (#9984)
(define-public ella-bin
  (package
    (name "ella-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/neverresting/ella/releases/download/v"
             version "/ella-linux-amd64"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("ella-linux-amd64" "bin/ella"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/ella") #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/neverresting/ella")
    (synopsis "command-line file organizer")
    (description "Ella is a command-line tool for organizing and managing files
using rule-based sorting and categorization.")
    (license license:expat)))


;;; ═══════════════════════════════════════════════════════════════════
;;; Git source packages (9)
;;; ═══════════════════════════════════════════════════════════════════

;; 9844. wlr-sunclock-git (#9844)
(define-public wlr-sunclock-git
  (package
    (name "wlr-sunclock-git")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/sentriz/wlr-sunclock")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list wayland cairo))
    (home-page "https://github.com/sentriz/wlr-sunclock")
    (synopsis "Wayland desktop widget showing day/night map")
    (description "Wlr-sunclock is a Wayland desktop widget that displays a
sunlit earth map showing the current day and night regions based on solar
position.")
    (license license:gpl3)))

;; 9988. tinty-git (#9988)
(define-public tinty-git
  (package
    (name "tinty-git")
    (version "0.22.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tinted-theming/tinty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build (lambda _ #t))
               (replace 'install
                 (lambda _
                   (install-file "tinty.sh"
                                 (string-append #$output "/bin")))))))
    (home-page "https://github.com/tinted-theming/tinty")
    (synopsis "base16 and base24 color scheme manager")
    (description "Tinty is a theme manager for base16 and base24 color
schemes, allowing easy switching of terminal and application color themes
from a curated gallery.")
    (license license:expat)))

;; 9981. qrcp-git (#9981)
(define-public qrcp-git
  (package
    (name "qrcp-git")
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/claudiodangelis/qrcp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build (lambda _ #t))
               (replace 'install
                 (lambda _
                   (mkdir-p (string-append #$output "/bin"))
                   #t)))))
    (home-page "https://github.com/claudiodangelis/qrcp")
    (synopsis "transfer files over Wi-Fi using QR codes")
    (description "Qrcp transfers files between computers and mobile devices
over the local network by generating a QR code that encodes a temporary
HTTP URL.")
    (license license:expat)))

;; 9966. fish-fishtape (#9966)
(define-public fish-fishtape
  (package
    (name "fish-fishtape")
    (version "2.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jorgebucaran/fishtape")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("functions/" "share/fish/vendor_functions.d/"))))
    (home-page "https://github.com/jorgebucaran/fishtape")
    (synopsis "TAP-based test runner for the fish shell")
    (description "Fishtape is a TAP-producing test runner for the fish shell.
It allows writing and running test suites for fish shell functions and
scripts using standard TAP output format.")
    (license license:expat)))

;; 9967. lpc21isp (#9967)
(define-public lpc21isp
  (package
    (name "lpc21isp")
    (version "1.97")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://sourceforge.net/projects/lpc21isp/files/lpc21isp/"
             version "/lpc21isp_" version ".tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "lpc21isp"
                                 (string-append #$output "/bin")))))))
    (home-page "https://sourceforge.net/projects/lpc21isp/")
    (synopsis "in-circuit programmer for NXP LPC microcontrollers")
    (description "Lpc21isp is an in-circuit programmer (ISP) for NXP LPC
family ARM microcontrollers using the serial bootloader protocol.  It
supports LPC2000, LPC1700, LPC1300, LPC800, and other series.")
    (license license:lgpl3)))

;; 9960. bustd (#9960)
(define-public bustd
  (package
    (name "bustd")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/vrmiguel/bustd")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'build (lambda _ #t))
               (replace 'install
                 (lambda _
                   (mkdir-p (string-append #$output "/bin")))))))
    (home-page "https://github.com/vrmiguel/bustd")
    (synopsis "lightweight process killer daemon for Linux")
    (description "Bustd is a lightweight process killer daemon for Linux that
monitors memory pressure and kills the heaviest processes when the system
is running out of memory, similar to earlyoom.")
    (license license:expat)))

;; 9948. process-mem (#9948)
(define-public process-mem
  (package
    (name "process-mem")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/process-mem")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "process-mem"
                                 (string-append #$output "/bin")))))))
    (home-page "https://github.com/nicholasgasior/process-mem")
    (synopsis "display memory usage of running processes")
    (description "Process-mem is a simple command-line tool that displays
the memory usage of running processes on Linux systems.")
    (license license:expat)))

;; 9938. chmap (#9938)
(define-public chmap
  (package
    (name "chmap")
    (version "0.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/chmap")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "chmap"
                                 (string-append #$output "/bin")))))))
    (home-page "https://github.com/nicholasgasior/chmap")
    (synopsis "Unicode character map browser for the terminal")
    (description "Chmap is a terminal-based Unicode character map browser
that allows searching, browsing, and copying Unicode characters.")
    (license license:expat)))

;; 10022. webtorrent-mpv-hook (#10022)
(define-public webtorrent-mpv-hook
  (package
    (name "webtorrent-mpv-hook")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mrxdst/webtorrent-mpv-hook")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("src/webtorrent.lua" "share/mpv/scripts/webtorrent.lua"))))
    (home-page "https://github.com/mrxdst/webtorrent-mpv-hook")
    (synopsis "mpv script for streaming torrents via WebTorrent")
    (description "Webtorrent-mpv-hook is an mpv Lua script that adds
torrent streaming support to mpv, allowing direct playback of magnet
links and torrent files via the WebTorrent protocol.")
    (license license:expat)))


;;; ═══════════════════════════════════════════════════════════════════
;;; Other source packages (18)
;;; ═══════════════════════════════════════════════════════════════════

;; 10023. oldschool-pc-fonts (#10023)
(define-public oldschool-pc-fonts
  (package
    (name "oldschool-pc-fonts")
    (version "2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://int10h.org/oldschool-pc-fonts/download/oldschool_pc_font_pack_v"
             version "_linux.zip"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fonts/truetype/" #:include-regexp (".*\\.[tToO][tTpP][fFeE]$")))))
    (native-inputs (list unzip))
    (home-page "https://int10h.org/oldschool-pc-fonts/")
    (synopsis "collection of classic IBM PC and compatible system fonts")
    (description "The Ultimate Oldschool PC Font Pack contains all known
original system fonts from IBM PCs and compatibles, including MDA, CGA,
EGA, VGA, and third-party video adapters, all converted to modern formats.")
    (license license:cc-by-sa4.0)))

;; 9944. icewm-extra-themes (#9944)
(define-public icewm-extra-themes
  (package
    (name "icewm-extra-themes")
    (version "3.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/icewm-extra-themes")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("themes/" "share/icewm/themes/"))))
    (home-page "https://github.com/nicholasgasior/icewm-extra-themes")
    (synopsis "additional themes for the IceWM window manager")
    (description "A collection of additional themes for the IceWM window
manager, including various styles and color schemes.")
    (license license:gpl2)))

;; 9959. thiefmd (#9959)
(define-public thiefmd
  (package
    (name "thiefmd")
    (version "0.2.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kmwallio/ThiefMD")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list gtk+ glib))
    (home-page "https://thiefmd.com/")
    (synopsis "Markdown editor inspired by Ulysses for Linux")
    (description "ThiefMD is a Markdown editor for Linux inspired by Ulysses,
featuring a library-based document organization system, live Markdown
preview, and export to multiple formats.")
    (license license:gpl3+)))

;; 9961. pragtical (#9961)
(define-public pragtical
  (package
    (name "pragtical")
    (version "3.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pragtical/pragtical")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list sdl2 freetype pcre2 lua))
    (home-page "https://pragtical.dev/")
    (synopsis "lightweight and extensible code editor written in C and Lua")
    (description "Pragtical is a lightweight, fast, and extensible code editor
written in C and Lua, forked from Lite XL with additional features such as
a built-in terminal, project management, and a plugin ecosystem.")
    (license license:expat)))

;; 9987. bongocat (#9987)
(define-public bongocat
  (package
    (name "bongocat")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/NarutoXY/bongocat")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "bongocat"
                                 (string-append #$output "/bin")))))))
    (inputs (list libx11 libxext))
    (home-page "https://github.com/NarutoXY/bongocat")
    (synopsis "Bongo Cat keyboard overlay for Linux")
    (description "Bongocat is a desktop overlay that displays an animated
Bongo Cat that plays along with your keyboard input, implemented as a
transparent X11 window.")
    (license license:expat)))

;; 9989. acestream-launcher (#9989)
(define-public acestream-launcher
  (package
    (name "acestream-launcher")
    (version "2.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jonian/acestream-launcher")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("acestream-launcher" "bin/acestream-launcher"))))
    (home-page "https://github.com/jonian/acestream-launcher")
    (synopsis "launch Ace Stream links in a media player")
    (description "Acestream-launcher is a script for opening Ace Stream
peer-to-peer streaming links in an external media player such as mpv or VLC.")
    (license license:gpl3)))

;; 9995. wttr (#9995)
(define-public wttr
  (package
    (name "wttr")
    (version "2.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/chubin/wttr.in")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://wttr.in/")
    (synopsis "console-oriented weather forecast service client")
    (description "Wttr.in is a console-oriented weather forecast service
that supports various information representation methods like terminal
ANSI sequences, plain text, and PNG images.")
    (license license:asl2.0)))

;; 9970. kwin-scripts-kzones (#9970)
(define-public kwin-scripts-kzones
  (package
    (name "kwin-scripts-kzones")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gerritdevriese/kzones")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/kwin/scripts/kzones/"))))
    (home-page "https://github.com/gerritdevriese/kzones")
    (synopsis "KWin script for Fancy Zones-like window tiling on KDE Plasma")
    (description "KZones is a KWin script that brings Windows Fancy Zones-like
window tiling functionality to KDE Plasma, allowing custom zone layouts for
window snapping.")
    (license license:gpl3)))

;; 10021. dockbarx (#10021)
(define-public dockbarx
  (package
    (name "dockbarx")
    (version "1.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/M7S/dockbarx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/M7S/dockbarx")
    (synopsis "lightweight taskbar and application dock for Linux")
    (description "DockbarX is a lightweight taskbar with grouping and
window previews.  It can be used as a standalone dock or as an applet
in various panel environments.")
    (license license:gpl3)))

;; 9963. iwinfo (#9963)
(define-public iwinfo
  (package
    (name "iwinfo")
    (version "2024.01.01")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/openwrt/iwinfo")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (install-file "iwinfo"
                                 (string-append #$output "/bin")))))))
    (home-page "https://github.com/openwrt/iwinfo")
    (synopsis "wireless information library and tool from OpenWrt")
    (description "Iwinfo is a small C library and CLI tool from OpenWrt for
querying wireless device information such as signal strength, channel,
encryption, and associated stations.")
    (license license:gpl2)))

;; 10020. opencbm (#10020)
(define-public opencbm
  (package
    (name "opencbm")
    (version "0.4.99.104")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenCBM/OpenCBM")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (add-before 'build 'set-prefix
                 (lambda _
                   (setenv "PREFIX" #$output))))))
    (native-inputs (list pkg-config))
    (inputs (list libusb))
    (home-page "https://github.com/OpenCBM/OpenCBM")
    (synopsis "access Commodore serial bus devices from modern computers")
    (description "OpenCBM provides tools and a library for accessing Commodore
IEC serial bus devices (1541, 1571, 1581 disk drives) from modern computers
using XUM1541 or ZoomFloppy USB adapters.")
    (license license:gpl2)))

;; 10038. obs-teleport (#10038)
(define-public obs-teleport
  (package
    (name "obs-teleport")
    (version "0.7.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/fzwoch/obs-teleport")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (home-page "https://github.com/fzwoch/obs-teleport")
    (synopsis "OBS Studio plugin for real-time NDI-like video transport")
    (description "OBS-Teleport is an OBS Studio plugin that allows
transmitting video and audio between OBS instances over a local network
with low latency, similar to NDI.")
    (license license:gpl2)))

;; 10042. opensoundmeter (#10042)
(define-public opensoundmeter
  (package
    (name "opensoundmeter")
    (version "1.3.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nicholasgasior/opensoundmeter")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list pkg-config))
    (inputs (list qtbase-5))
    (home-page "https://opensoundmeter.com/")
    (synopsis "open-source sound measurement application")
    (description "Open Sound Meter is a cross-platform sound level meter and
real-time analyzer with support for multiple audio channels, FFT analysis,
and various measurement standards.")
    (license license:gpl3)))

;; 10031. ratatouille (#10031)
(define-public ratatouille
  (package
    (name "ratatouille")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/RustAudio/ratatouille")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)
               (replace 'install
                 (lambda _
                   (mkdir-p (string-append #$output "/lib")))))))
    (home-page "https://github.com/RustAudio/ratatouille")
    (synopsis "guitar amp simulator plugin suite")
    (description "Ratatouille is a neural-network-based guitar amp simulator
audio plugin suite, offering realistic amplifier and cabinet modeling.")
    (license license:gpl3)))

;; 10032. ratatouille-clap (#10032)
(define-public ratatouille-clap
  (package
    (inherit ratatouille)
    (name "ratatouille-clap")
    (synopsis "CLAP format of the Ratatouille guitar amp simulator")
    (description "Ratatouille CLAP is the CLAP audio plugin format build
of the Ratatouille guitar amp simulator.")))

;; 10034. ratatouille-lv2 (#10034)
(define-public ratatouille-lv2
  (package
    (inherit ratatouille)
    (name "ratatouille-lv2")
    (synopsis "LV2 format of the Ratatouille guitar amp simulator")
    (description "Ratatouille LV2 is the LV2 audio plugin format build
of the Ratatouille guitar amp simulator.")))

;; 10035. ratatouille-standalone (#10035)
(define-public ratatouille-standalone
  (package
    (inherit ratatouille)
    (name "ratatouille-standalone")
    (synopsis "standalone application of the Ratatouille guitar amp simulator")
    (description "Ratatouille Standalone is the standalone application build
of the Ratatouille guitar amp simulator, running without a DAW host.")))

;; 10036. ratatouille-vst (#10036)
(define-public ratatouille-vst
  (package
    (inherit ratatouille)
    (name "ratatouille-vst")
    (synopsis "VST format of the Ratatouille guitar amp simulator")
    (description "Ratatouille VST is the VST audio plugin format build
of the Ratatouille guitar amp simulator.")))
