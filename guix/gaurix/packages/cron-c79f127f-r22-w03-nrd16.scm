;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #16.
;;; 8 new recipes: 4 binary packages (vineflower-bin, signal-cli, vimcord-git,
;;; alpemix-bin), 1 binary-from-deb (openaudible-bin),
;;; 1 KDE/CMake from source (plasma-dialer), 1 C/CMake from source (openscap),
;;; 1 C/autotools from source (tilp).
;;; 7 compat aliases added to general-compat.scm.
;;; 15 re-blocked with specific reasons.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd16)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  ;; plasma-dialer deps
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pkg-config)
  ;; openscap deps
  #:use-module (gnu packages xml)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages python)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages popt)
  ;; tilp deps
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages emulators)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gnupg)
  #:use-module ((guix licenses) #:prefix license:)
  #:export (vineflower-bin
            signal-cli
            plasma-dialer
            openscap
            vimcord-git
            tilp
            openaudible-bin
            alpemix-bin))

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — copy-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. vineflower-bin (#3206) ───────────────────────────────────────

(define-public vineflower-bin
  (package
    (name "vineflower-bin")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Vineflower/vineflower/releases/download/"
                    version "/vineflower-" version ".jar"))
              (sha256
               (base32 "1gznakfymhlf589wsgm289w3s0wfr3gysjrc81h4kcvqgxg43qp1"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vineflower.jar" "share/java/vineflower.jar"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'rename-source
                 (lambda _
                   (rename-file (string-append "vineflower-" #$version ".jar")
                                "vineflower.jar")))
               (add-after 'install 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((out (assoc-ref outputs "out"))
                          (bin (string-append out "/bin"))
                          (jar (string-append out "/share/java/vineflower.jar"))
                          (java (search-input-file inputs "bin/java")))
                     (mkdir-p bin)
                     (call-with-output-file (string-append bin "/vineflower")
                       (lambda (port)
                         (format port "#!~a~%exec ~a -jar ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 java jar)))
                     (chmod (string-append bin "/vineflower") #o755)))))))
    (inputs (list (list openjdk21 "jdk") bash-minimal))
    (home-page "https://vineflower.org")
    (synopsis "modern Java decompiler")
    (description "Vineflower is a modern, general-purpose Java decompiler
focused on providing the best possible output quality.  It is a fork of
Fernflower with many additional features and improvements.")
    (license license:asl2.0)))

;; ── 2. signal-cli (#3188) ───────────────────────────────────────────

(define-public signal-cli
  (package
    (name "signal-cli")
    (version "0.14.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AsamK/signal-cli/releases/download/v"
                    version "/signal-cli-" version "-Linux-native.tar.gz"))
              (sha256
               (base32 "1lg60z8vaj2kmlaj5jyvzkmvkwirl20k02fmb2y4prbb4xs5a5c6"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("signal-cli" "bin/signal-cli"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/signal-cli")
                          #o755))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AsamK/signal-cli")
    (synopsis "command-line interface for the Signal messenger")
    (description "Signal-cli is a command-line interface for the Signal
messenger.  It supports registration, sending and receiving messages,
group management, and can be used as a daemon with D-Bus integration.
This package provides the pre-compiled GraalVM native binary.")
    (license license:gpl3+)))

;; ── 3. vimcord-git (#3168) ──────────────────────────────────────────

(define-public vimcord-git
  (package
    (name "vimcord-git")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/YetAnotherMechanicusEnjoyer/vimcord/"
                    "releases/download/v" version
                    "/vimcord-v" version "-linux-x86_64.tar.gz"))
              (sha256
               (base32 "1n1nx8x4xgdyvzw0kvpnn4hw3aszcj3bg0xzs55zl4lg86bsf2px"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("vimcord" "bin/vimcord")
                ("emojis.json" "share/vimcord/emojis.json"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/YetAnotherMechanicusEnjoyer/vimcord")
    (synopsis "terminal UI Discord client inspired by Vim")
    (description "Vimcord is a terminal user interface (TUI) client for
Discord written in Rust with Vim-style keybindings.  It provides a
lightweight, keyboard-driven way to interact with Discord servers,
channels, and messages from the terminal.")
    (license license:expat)))

;; ── 4. alpemix-bin (#3164) ──────────────────────────────────────────

(define-public alpemix-bin
  (package
    (name "alpemix-bin")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.alpemix.com/site/linux/Alpemix.zip")
              (sha256
               (base32 "1v721086qa3zqj7pidvvsjqlc2l54mk9w07arbz3hkdr22gzwq1n"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("Alpemix" "bin/alpemix"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'set-executable
                 (lambda* (#:key outputs #:allow-other-keys)
                   (chmod (string-append (assoc-ref outputs "out")
                                         "/bin/alpemix")
                          #o755))))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.alpemix.com/en/Linux")
    (synopsis "free remote desktop application")
    (description "Alpemix is a remote desktop application that allows users
to connect to and control remote computers.  It provides file transfer,
screen sharing, and remote support capabilities.")
    (license (license:non-copyleft
              "https://www.alpemix.com/"
              "Alpemix proprietary freeware license"))))

;; ── 5. openaudible-bin (#3181) ──────────────────────────────────────

(define-public openaudible-bin
  (package
    (name "openaudible-bin")
    (version "4.7.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/openaudible/openaudible/releases/"
                    "download/v" version "/OpenAudible_" version
                    "_x86_64.deb"))
              (sha256
               (base32 "1zvb3b83bdlxdvnyzhx4cspap6zfnpjr04x4akr0hvgiqi2yi60k"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (invoke "ar" "x" source)
                   (invoke "tar" "xzf" "data.tar.gz")
                   (copy-recursively "opt/OpenAudible" ".")))
               (replace 'install
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     (mkdir-p (string-append out "/opt/OpenAudible"))
                     (copy-recursively "." (string-append out "/opt/OpenAudible")
                                       #:follow-symlinks? #f)
                     (mkdir-p (string-append out "/bin"))
                     (symlink (string-append out "/opt/OpenAudible/OpenAudible")
                              (string-append out "/bin/openaudible"))))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://openaudible.org")
    (synopsis "cross-platform audiobook manager for Audible")
    (description "OpenAudible is a cross-platform audiobook manager designed
for Audible users.  It allows managing, downloading, and converting
audiobooks with an easy-to-use desktop application.")
    (license license:asl2.0)))

;; ═══════════════════════════════════════════════════════════════════
;; From-source packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. plasma-dialer (#3193) ────────────────────────────────────────

(define-public plasma-dialer
  (package
    (name "plasma-dialer")
    (version "6.3.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.kde.org/stable/plasma/" version
                    "/plasma-dialer-" version ".tar.xz"))
              (sha256
               (base32 "0lxpq5032wba0qbljl2frsx99pbsz6dac79h359hvqx0iw08mfxi"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))   ;no test suite
    (native-inputs
     (list extra-cmake-modules pkg-config))
    (inputs
     (list qtbase
           qtdeclarative
           ki18n
           kcoreaddons
           kdbusaddons
           kconfig
           knotifications
           kio
           kcontacts
           kpeople
           kirigami
           kirigami-addons
           modemmanager-qt
           kwindowsystem
           wayland
           plasma-wayland-protocols
           libphonenumber))
    (home-page "https://invent.kde.org/plasma-mobile/plasma-dialer")
    (synopsis "phone dialer application for KDE Plasma Mobile")
    (description "Plasma Dialer is the phone dialer and call handler for
KDE Plasma Mobile.  It provides a dialpad interface, call history,
contact integration, and modem management via ModemManager.  It includes
a D-Bus daemon for handling telephony operations and a QML-based user
interface.")
    (license license:gpl3+)))

;; ── 7. openscap (#3194) ─────────────────────────────────────────────

(define-public openscap
  (package
    (name "openscap")
    (version "1.4.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/OpenSCAP/openscap/releases/download/"
                    version "/openscap-" version ".tar.gz"))
              (sha256
               (base32 "1flgrw8v6j9nmxm6xi374h8pi4iiaxnmjacgg8lyp0zwmabydswn"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f    ;tests require network and additional test content
           #:configure-flags
           #~(list "-DENABLE_DOCS=OFF"
                   "-DENABLE_PERL=OFF")))
    (native-inputs
     (list pkg-config swig python))
    (inputs
     (list libxml2
           libxslt
           xmlsec
           pcre2
           curl
           openssl
           popt
           rpm
           dbus
           libgcrypt
           acl
           util-linux   ;for libblkid
           procps))
    (home-page "https://www.open-scap.org")
    (synopsis "NIST-certified security compliance scanning framework")
    (description "OpenSCAP is an open-source framework for security
compliance checking based on the Security Content Automation Protocol
(SCAP).  It provides tools for vulnerability assessment, configuration
compliance, and security policy enforcement using XCCDF, OVAL, CPE, and
other SCAP standards.  It is NIST-certified for SCAP 1.2 and 1.3.")
    (license license:lgpl2.1+)))

;; ── 8. tilp (#3201) ─────────────────────────────────────────────────

(define-public tilp
  (package
    (name "tilp")
    (version "1.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://sourceforge/tilp/tilp2-linux/tilp2-"
                    version "/tilp2-" version ".tar.bz2"))
              (sha256
               (base32 "0isf73bjwk06baz2gm3vpdh600gqck9ca4aqxzb089dmxriv6fkv"))))
    (build-system gnu-build-system)
    (native-inputs
     (list pkg-config intltool))
    (inputs
     (list gtk+-2
           glib
           libticables2
           libticonv
           libtifiles2
           libticalcs2
           zlib))
    (home-page "http://lpg.ticalc.org/prj_tilp/")
    (synopsis "TI graphing calculator linking and transfer program")
    (description "TiLP (formerly known as TiLP2) is a linking program for
Texas Instruments graphing calculators.  It allows transferring data between
a computer and TI calculators, including programs, variables, applications,
and OS updates.  It supports USB and serial cable connections through
libticables2.")
    (license license:gpl2+)))
