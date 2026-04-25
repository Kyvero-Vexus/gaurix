;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425e
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (7): shig-bin, atuin-lily-bin, hyperledger-fabric-bin,
;;;   gdx-liftoff-bin, beet-summarize, openpace, openfortivpn-webview-bin
;;; Already resolved (0)
;;; Already in Guix (0)
;;; Remaining BLOCKED: 93 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages java)
  #:export (shig-bin
            atuin-lily-bin
            hyperledger-fabric-bin
            gdx-liftoff-bin
            beet-summarize
            openpace
            openfortivpn-webview-bin))


;;; ---- 1. shig-bin ----
;;; AUR: shig-git (#18578) -- CLI utility to sign files and verify
;;; signatures in OpenSSH format.
;;; Prebuilt Go binary from GitHub releases.
;;; License: MIT

(define-public shig-bin
  (package
    (name "shig-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/SierraSoftworks/shig/releases/download/v"
                    version "/shig-linux-amd64"))
              (sha256
               (base32
                "08ks4c1vwdihy44a8af6gg2zj9k7s4ajrzsa69jswrmfb29yvjj4"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("shig" "bin/shig"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "shig")
                   (chmod "shig" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI utility for OpenSSH file signing and verification")
    (description "Shig is a command-line utility that signs files and verifies
signatures using OpenSSH keys.  It provides a simple interface for
cryptographic file signing without requiring GPG or other complex
key management tools.")
    (home-page "https://github.com/SierraSoftworks/shig")
    (license license:expat)))


;;; ---- 2. atuin-lily-bin ----
;;; AUR: atuin-lily-git (#18410) -- Magical shell history (lilydjwg fork).
;;; Prebuilt Rust binary (musl, statically linked) from GitHub releases.
;;; License: MIT

(define-public atuin-lily-bin
  (package
    (name "atuin-lily-bin")
    (version "18.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/lilydjwg/atuin/releases/download/v"
                    version "/atuin-v" version
                    "-x86_64-unknown-linux-musl.tar.gz"))
              (sha256
               (base32
                "0w70gbns4waqjbqnvsb9vpiwsxlvkicb31das3dqbp91309mh27m"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~(let ((base (string-append "atuin-v" #$version
                                        "-x86_64-unknown-linux-musl")))
               (list (list (string-append base "/atuin") "bin/atuin-lily")
                     (list (string-append base "/completions/atuin.bash")
                           "share/bash-completion/completions/atuin-lily")
                     (list (string-append base "/completions/atuin.fish")
                           "share/fish/vendor_completions.d/atuin-lily.fish")
                     (list (string-append base "/completions/_atuin")
                           "share/zsh/site-functions/_atuin-lily")))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Magical shell history with sync (lilydjwg fork)")
    (description "Atuin replaces your existing shell history with a SQLite
database, and records additional context for your commands.  It provides
optional encrypted synchronization between machines.  This is the lilydjwg
fork with additional patches and improvements.  The binary is installed as
@command{atuin-lily} to avoid conflicts with the upstream atuin package.")
    (home-page "https://github.com/lilydjwg/atuin")
    (license license:expat)))


;;; ---- 3. hyperledger-fabric-bin ----
;;; AUR: hyperledger-fabric (#18301) -- Platform for distributed ledger
;;; solutions.  Prebuilt Go binaries from GitHub releases.
;;; License: Apache-2.0

(define-public hyperledger-fabric-bin
  (package
    (name "hyperledger-fabric-bin")
    (version "3.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hyperledger/fabric/releases/download/v"
                    version "/hyperledger-fabric-linux-amd64-" version
                    ".tar.gz"))
              (sha256
               (base32
                "1vfmdvcx3s8gn894pyfh1xd1w4r297b19vzmn2hgb87bsdip46cw"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin/peer" "bin/fabric-peer")
               ("bin/orderer" "bin/fabric-orderer")
               ("bin/configtxgen" "bin/fabric-configtxgen")
               ("bin/configtxlator" "bin/fabric-configtxlator")
               ("bin/cryptogen" "bin/fabric-cryptogen")
               ("bin/discover" "bin/fabric-discover")
               ("bin/ledgerutil" "bin/fabric-ledgerutil")
               ("bin/osnadmin" "bin/fabric-osnadmin")
               ("config/" "share/hyperledger-fabric/config/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "platform for distributed ledger solutions")
    (description "Hyperledger Fabric is an enterprise-grade permissioned
distributed ledger framework.  It provides modular architecture with
pluggable consensus, identity management, and smart contract (chaincode)
support.  This package provides the core CLI tools: peer, orderer,
configtxgen, configtxlator, cryptogen, discover, ledgerutil, and osnadmin.")
    (home-page "https://www.hyperledger.org/projects/fabric")
    (license license:asl2.0)))


;;; ---- 4. gdx-liftoff-bin ----
;;; AUR: gdx-liftoff (#18599) -- LibGDX project generator.
;;; Prebuilt JAR with embedded JVM launcher for Linux.
;;; License: Apache-2.0

(define-public gdx-liftoff-bin
  (package
    (name "gdx-liftoff-bin")
    (version "1.14.0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libgdx/gdx-liftoff/releases/download/v"
                    version "/gdx-liftoff-" version "-linux.jar"))
              (sha256
               (base32
                "1mz7cvi0hbh8r26p9yk9pazd7ig67lkdp5chyl7cvpihxmqfmznq"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gdx-liftoff.jar" "share/java/gdx-liftoff.jar")
               ("gdx-liftoff" "bin/gdx-liftoff"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "gdx-liftoff.jar")))
               (add-after 'unpack 'create-wrapper
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let ((java (search-input-file inputs "bin/java"))
                         (jar (string-append (assoc-ref outputs "out")
                                             "/share/java/gdx-liftoff.jar")))
                     (with-output-to-file "gdx-liftoff"
                       (lambda ()
                         (display (string-append "#!/bin/sh\nexec "
                                                 java " -jar " jar
                                                 " \"$@\"\n"))))
                     (chmod "gdx-liftoff" #o755)))))))
    (inputs (list openjdk))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern setup tool for LibGDX Gradle projects")
    (description "Gdx-Liftoff is a setup tool for LibGDX projects that
generates Gradle-based project skeletons.  It supports various JVM
languages (Java, Kotlin, Scala, Groovy) and provides templates for
desktop, Android, iOS, and web targets.")
    (home-page "https://github.com/libgdx/gdx-liftoff")
    (license license:asl2.0)))


;;; ---- 5. beet-summarize ----
;;; AUR: beet-summarize-git (#18604) -- Summarize your beets library.
;;; Pure Python beets plugin with setuptools build.
;;; License: MIT

(define-public beet-summarize
  (package
    (name "beet-summarize")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/steven-murray/beet-summarize"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (sha256
               (base32
                "0904cfbpy919xv68vr74zrgviiyc572jycrcip227wxnbl3skmdl"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests require pytest fixtures not in tarball
    (native-inputs (list python-setuptools python-setuptools-scm))
    (propagated-inputs (list beets))
    (synopsis "summarize your beets music library")
    (description "Beet-summarize is a plugin for the beets music manager
that provides a @command{beet summarize} command.  It prints a summary of
your music library including total tracks, albums, artists, genres, and
file format statistics.")
    (home-page "https://github.com/steven-murray/beet-summarize")
    (license license:expat)))


;;; ---- 6. openpace ----
;;; AUR: openpace-git (#18502) -- Cryptographic library for EAC version 2.
;;; C library with autotools build, depends on OpenSSL.
;;; License: GPL-3.0

(define-public openpace
  (package
    (name "openpace")
    (version "1.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/frankmorgner/openpace/archive/refs/tags/"
                    version ".tar.gz"))
              (sha256
               (base32
                "022fpqwpxc31jqvq33y9dpavm0c459cimnwn8jxmr5d8kz5zirzs"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'bootstrap
            (lambda _
              (invoke "autoreconf" "-vfi"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config))
    (inputs (list openssl))
    (synopsis "cryptographic library for EAC version 2")
    (description "OpenPACE implements the Extended Access Control (EAC)
version 2 protocol suite defined in BSI TR-03110.  It provides
Password Authenticated Connection Establishment (PACE), Terminal
Authentication (TA), and Chip Authentication (CA) for electronic
identity documents and smart cards.")
    (home-page "https://frankmorgner.github.io/openpace/")
    (license license:gpl3)))


;;; ---- 7. openfortivpn-webview-bin ----
;;; AUR: openfortivpn-webview-electron (#18167) -- FortiVPN SAML SSO tool.
;;; Prebuilt Electron AppImage from GitHub releases.
;;; License: MIT

(define-public openfortivpn-webview-bin
  (package
    (name "openfortivpn-webview-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gm-vm/openfortivpn-webview"
                    "/releases/download/v" version "-electron"
                    "/openfortivpn-webview-" version "-x86_64.AppImage"))
              (sha256
               (base32
                "1dpswzs9v6v6am54zksxxqp6c50741wm60w9d5ivq5rw6aq7m4mx"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("openfortivpn-webview.AppImage"
                "bin/openfortivpn-webview"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p ".")
                   (copy-file source "openfortivpn-webview.AppImage")
                   (chmod "openfortivpn-webview.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "SAML single sign-on helper for openfortivpn")
    (description "Openfortivpn-webview provides a graphical webview for
SAML-based single sign-on authentication with FortiGate VPN.  It
retrieves the SVPNCOOKIE needed by openfortivpn to establish a VPN
connection through SAML/SSO portals.  This is the prebuilt Electron
AppImage version.")
    (home-page "https://github.com/gm-vm/openfortivpn-webview")
    (license license:expat)))
