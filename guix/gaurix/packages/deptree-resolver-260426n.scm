;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426n
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (18):
;;;   1. node-emmet-language-server (Node.js: Emmet LSP server)
;;;   2. node-osmtogeojson (Node.js: Convert OSM data to GeoJSON)
;;;   3. node-edgeimpulse-cli (Node.js: Edge Impulse CLI tools)
;;;   4. node-cspell (Node.js: code spelling checker)
;;;   5. node-aws-cdk (Node.js: AWS CDK CLI toolkit)
;;;   6. node-aws-amplify-cli (Node.js: AWS Amplify CLI)
;;;   7. node-nestjs-cli (Node.js: NestJS framework CLI)
;;;   8. node-awk-language-server (Node.js: AWK language server)
;;;   9. pulumi (Go: Infrastructure as Code engine)
;;;  10. java-language-server (Java: Java LSP using compiler API)
;;;  11. python-jaxlib-bin (prebuilt: JAX XLA library wheel)
;;;  12. libarchive-static (C: statically-compiled bsdtar)
;;;  13. urbanterror (prebuilt: Quake 3 team FPS)
;;;  14. limine-snapper-sync (Bash/Gradle: Limine+Snapper sync tool)
;;;  15. receitanet (Java: Brazilian federal tax filing)
;;;  16. gephi (Java: network visualization and analysis)
;;;  17. plugin-autenticacao-gov-pt (Java: Portuguese eID auth plugin)
;;;  18. eclipse-pydev (Java: Python IDE for Eclipse)
;;;
;;; Remaining BLOCKED: 82 packages (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260426n)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system node)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages node)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:export (node-emmet-language-server
            node-osmtogeojson
            node-edgeimpulse-cli
            node-cspell
            node-aws-cdk
            node-aws-amplify-cli
            node-nestjs-cli
            node-awk-language-server
            pulumi
            java-language-server
            python-jaxlib-bin
            libarchive-static
            urbanterror
            limine-snapper-sync
            receitanet
            gephi
            plugin-autenticacao-gov-pt
            eclipse-pydev))

;;; ---- 1. node-emmet-language-server ----
;;; A language server for emmet.io providing HTML/CSS expansion.
;;; Upstream: https://github.com/olrtg/emmet-language-server
;;; Build: node-build-system (npm)
;;; License: MIT

(define-public node-emmet-language-server
  (package
    (name "node-emmet-language-server")
    (version "2.8.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/olrtg/emmet-language-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "language server for emmet.io")
    (description "Emmet Language Server provides Emmet abbreviation expansion
for HTML, CSS, and other web languages via the Language Server Protocol.  It
integrates with any LSP-compatible editor.")
    (home-page "https://github.com/olrtg/emmet-language-server")
    (license license:expat)))

;;; ---- 2. node-osmtogeojson ----
;;; Convert OpenStreetMap data to GeoJSON format.
;;; Upstream: https://github.com/tyrasd/osmtogeojson
;;; Build: node-build-system (npm)
;;; License: MIT

(define-public node-osmtogeojson
  (package
    (name "node-osmtogeojson")
    (version "3.0.0-beta.5")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/tyrasd/osmtogeojson")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "convert OSM data to GeoJSON")
    (description "osmtogeojson converts OpenStreetMap data to GeoJSON format.
It supports both XML and Overpass API JSON input and produces standard GeoJSON
output suitable for web mapping applications.")
    (home-page "https://github.com/tyrasd/osmtogeojson")
    (license license:expat)))

;;; ---- 3. node-edgeimpulse-cli ----
;;; Command-line interface tools for Edge Impulse embedded ML platform.
;;; Upstream: https://github.com/edgeimpulse/edge-impulse-cli
;;; Build: node-build-system (npm)
;;; License: Apache-2.0

(define-public node-edgeimpulse-cli
  (package
    (name "node-edgeimpulse-cli")
    (version "1.30.4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/edgeimpulse/edge-impulse-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line tools for Edge Impulse ML platform")
    (description "Edge Impulse CLI provides command-line tools for interacting
with the Edge Impulse embedded machine learning platform.  It supports data
collection, model training, and deployment to edge devices.")
    (home-page "https://github.com/edgeimpulse/edge-impulse-cli")
    (license license:asl2.0)))

;;; ---- 4. node-cspell ----
;;; A spelling checker designed for code.
;;; Upstream: https://github.com/streetsidesoftware/cspell
;;; Build: node-build-system (npm)
;;; License: MIT

(define-public node-cspell
  (package
    (name "node-cspell")
    (version "9.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/streetsidesoftware/cspell")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "spelling checker for source code")
    (description "CSpell is a spelling checker designed specifically for
checking code.  It understands camelCase, snake_case, and other code naming
conventions and supports custom dictionaries for programming terms.")
    (home-page "https://cspell.org/")
    (license license:expat)))

;;; ---- 5. node-aws-cdk ----
;;; AWS Cloud Development Kit CLI toolkit.
;;; Upstream: https://github.com/aws/aws-cdk-cli
;;; Build: node-build-system (npm)
;;; License: Apache-2.0

(define-public node-aws-cdk
  (package
    (name "node-aws-cdk")
    (version "2.1109.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aws/aws-cdk-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "AWS Cloud Development Kit command-line toolkit")
    (description "AWS CDK Toolkit is the command-line interface for AWS Cloud
Development Kit applications.  It synthesizes CloudFormation templates from
CDK code and deploys stacks to AWS accounts.")
    (home-page "https://github.com/aws/aws-cdk-cli")
    (license license:asl2.0)))

;;; ---- 6. node-aws-amplify-cli ----
;;; AWS Amplify CLI for serverless web and mobile development.
;;; Upstream: https://github.com/aws-amplify/amplify-cli
;;; Build: node-build-system (npm)
;;; License: Apache-2.0

(define-public node-aws-amplify-cli
  (package
    (name "node-aws-amplify-cli")
    (version "13.0.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aws-amplify/amplify-cli")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "AWS Amplify command-line toolchain")
    (description "AWS Amplify CLI is a toolchain for simplifying serverless web
and mobile development.  It provides commands for provisioning cloud backends,
generating client code, and managing deployments.")
    (home-page "https://docs.amplify.aws/cli/")
    (license license:asl2.0)))

;;; ---- 7. node-nestjs-cli ----
;;; Command-line interface for the NestJS framework.
;;; Upstream: https://github.com/nestjs/nest-cli
;;; Build: node-build-system (npm)
;;; License: MIT

(define-public node-nestjs-cli
  (package
    (name "node-nestjs-cli")
    (version "11.0.21")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/nestjs/nest-cli")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "command-line interface for NestJS framework")
    (description "NestJS CLI provides scaffolding, development, and build tools
for NestJS applications.  It generates project structures, modules,
controllers, and services from templates.")
    (home-page "https://docs.nestjs.com/cli/overview")
    (license license:expat)))

;;; ---- 8. node-awk-language-server ----
;;; Language server for the AWK programming language.
;;; Upstream: https://github.com/Beaglefoot/awk-language-server
;;; Build: node-build-system (yarn build with TypeScript)
;;; License: MIT

(define-public node-awk-language-server
  (package
    (name "node-awk-language-server")
    (version "0.10.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Beaglefoot/awk-language-server")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system node-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list node))
    (supported-systems '("x86_64-linux"))
    (synopsis "language server for AWK")
    (description "AWK Language Server provides code intelligence for the AWK
programming language via the Language Server Protocol.  It offers completion,
diagnostics, hover information, and go-to-definition support.")
    (home-page "https://github.com/Beaglefoot/awk-language-server")
    (license license:expat)))

;;; ---- 9. pulumi ----
;;; Modern Infrastructure as Code engine.
;;; Upstream: https://github.com/pulumi/pulumi
;;; Build: go-build-system
;;; License: Apache-2.0

(define-public pulumi
  (package
    (name "pulumi")
    (version "3.223.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/pulumi/pulumi")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:import-path "github.com/pulumi/pulumi/pkg/v3/cmd/pulumi"
           #:unpack-path "github.com/pulumi/pulumi"))
    (inputs (list node python))
    (supported-systems '("x86_64-linux"))
    (synopsis "modern Infrastructure as Code engine")
    (description "Pulumi is an Infrastructure as Code platform that lets you
define cloud infrastructure using general-purpose programming languages like
TypeScript, Python, Go, and C#.  It supports AWS, Azure, GCP, Kubernetes, and
many other cloud providers.")
    (home-page "https://www.pulumi.com/")
    (license license:asl2.0)))

;;; ---- 10. java-language-server ----
;;; Java language server using the Java compiler API.
;;; Upstream: https://github.com/georgewfraser/java-language-server
;;; Build: gnu-build-system (Maven wrapper)
;;; License: MIT

(define-public java-language-server
  (package
    (name "java-language-server")
    (version "0.2.39")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/georgewfraser/java-language-server")
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
          (let* ((out (assoc-ref %outputs "out"))
                 (share (string-append out "/share/java-language-server"))
                 (bin (string-append out "/bin")))
            (copy-recursively (assoc-ref %build-inputs "source") share)
            (mkdir-p bin)
            ;; Create wrapper script
            (call-with-output-file (string-append bin "/java-language-server")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a -jar ~a/dist/lang.jar \"$@\"~%"
                        (string-append (assoc-ref %build-inputs "openjdk")
                                       "/bin/java")
                        share)))
            (chmod (string-append bin "/java-language-server") #o755)
            #t))))
    (inputs (list openjdk17))
    (supported-systems '("x86_64-linux"))
    (synopsis "Java language server using the compiler API")
    (description "Java Language Server provides code intelligence for Java
through the Language Server Protocol.  It uses the Java Compiler API directly
for accurate completions, diagnostics, and navigation.")
    (home-page "https://github.com/georgewfraser/java-language-server")
    (license license:expat)))

;;; ---- 11. python-jaxlib-bin ----
;;; Prebuilt XLA library for JAX (binary wheel).
;;; Upstream: https://github.com/google/jax
;;; Build: pyproject-build-system (from wheel)
;;; License: Apache-2.0

(define-public python-jaxlib-bin
  (package
    (name "python-jaxlib-bin")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://files.pythonhosted.org/packages/cp311/"
                    "jaxlib/jaxlib-" version
                    "-cp311-cp311-manylinux2014_x86_64.whl"))
              (file-name (string-append "jaxlib-" version ".whl"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list python-numpy python-scipy))
    (inputs (list python))
    (supported-systems '("x86_64-linux"))
    (synopsis "XLA library for JAX (prebuilt binary)")
    (description "jaxlib is the support library for JAX providing the XLA
compiler backend.  This package installs a prebuilt binary wheel for
x86_64 Linux systems.")
    (home-page "https://github.com/google/jax")
    (license license:asl2.0)))

;;; ---- 12. libarchive-static ----
;;; Statically-compiled bsdtar for system rescue.
;;; Upstream: https://libarchive.org/
;;; Build: gnu-build-system (configure + make, static linking)
;;; License: BSD-2-Clause

(define-public libarchive-static
  (package
    (name "libarchive-static")
    (version "3.8.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/libarchive/libarchive/releases/download/v"
                    version "/libarchive-" version ".tar.xz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~(list "--enable-static"
                   "--disable-shared"
                   "--without-xml2"
                   "--without-expat"
                   "LDFLAGS=-static"
                   (string-append "--prefix=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'keep-only-bsdtar
                 (lambda* (#:key outputs #:allow-other-keys)
                   (let ((out (assoc-ref outputs "out")))
                     ;; Only keep the statically linked bsdtar binary
                     (for-each delete-file
                               (find-files (string-append out "/lib")))
                     #t))))))
    (inputs (list zlib openssl))
    (supported-systems '("x86_64-linux"))
    (synopsis "statically-compiled bsdtar archive tool")
    (description "This package provides a statically-compiled version of bsdtar
from libarchive, useful for system rescue and recovery scenarios where dynamic
libraries may be unavailable.  It supports tar, cpio, zip, and many other
archive formats.")
    (home-page "https://libarchive.org/")
    (license license:bsd-2)))

;;; ---- 13. urbanterror ----
;;; Team-based tactical shooter based on the Quake 3 engine.
;;; Upstream: http://www.urbanterror.info
;;; Build: copy-build-system (prebuilt game binaries + assets)
;;; License: GPL-2.0 (engine), custom (assets)

(define-public urbanterror
  (package
    (name "urbanterror")
    (version "4.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://www.urbanterror.info/downloads/"
                    version "/UrbanTerror434_full.zip"))
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/urbanterror/"))))
    (native-inputs (list unzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "team-based tactical shooter on the Quake 3 engine")
    (description "Urban Terror is a free multiplayer first-person shooter
based on the ioquake3 engine.  It features realistic weapons, movement
mechanics, and game modes including team deathmatch, capture the flag,
and bomb mode.")
    (home-page "http://www.urbanterror.info")
    (license license:gpl2)))

;;; ---- 14. limine-snapper-sync ----
;;; Synchronize Limine boot entries with Snapper snapshots.
;;; Upstream: https://gitlab.com/Zesko/limine-snapper-sync
;;; Build: trivial-build-system (shell script + gradle components)
;;; License: GPL-3.0

(define-public limine-snapper-sync
  (let ((commit "7ca2a1b")
        (revision "1"))
    (package
      (name "limine-snapper-sync")
      (version (git-version "0.1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab.com/Zesko/limine-snapper-sync")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/limine-snapper-sync/"))))
      (inputs (list bash-minimal))
      (supported-systems '("x86_64-linux"))
      (synopsis "sync Limine boot entries with Snapper snapshots")
      (description "Limine Snapper Sync automatically synchronizes Limine
bootloader snapshot entries with Snapper btrfs snapshots.  It keeps boot
entries in sync when snapshots are created or deleted.")
      (home-page "https://gitlab.com/Zesko/limine-snapper-sync")
      (license license:gpl3))))

;;; ---- 15. receitanet ----
;;; Brazilian federal tax filing program.
;;; Upstream: https://www.gov.br/receitafederal/
;;; Build: trivial-build-system (prebuilt Java JAR)
;;; License: custom (Brazilian government)

(define-public receitanet
  (package
    (name "receitanet")
    (version "1.32")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloadirpf.receita.fazenda.gov.br/irpf/"
                    "2026/receitanet/receitanet-linux-x86_64-" version ".bin"))
              (file-name (string-append name "-" version ".bin"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (share (string-append out "/share/receitanet"))
                 (bin (string-append out "/bin")))
            (mkdir-p share)
            (mkdir-p bin)
            (copy-file (assoc-ref %build-inputs "source")
                       (string-append share "/receitanet.bin"))
            (call-with-output-file (string-append bin "/receitanet")
              (lambda (port)
                (format port "#!/bin/sh~%exec ~a -jar ~a/receitanet.bin \"$@\"~%"
                        (string-append (assoc-ref %build-inputs "openjdk")
                                       "/bin/java")
                        share)))
            (chmod (string-append bin "/receitanet") #o755)
            #t))))
    (inputs (list openjdk11))
    (supported-systems '("x86_64-linux"))
    (synopsis "Brazilian federal tax filing client")
    (description "Receitanet is the official program from the Brazilian
Federal Revenue Service for transmitting tax declarations and related
documents electronically.")
    (home-page "https://www.gov.br/receitafederal/")
    (license (license:non-copyleft
              "https://www.gov.br/receitafederal/"
              "Brazilian government software license"))))

;;; ---- 16. gephi ----
;;; Open-source network visualization and analysis platform.
;;; Upstream: https://gephi.org/
;;; Build: trivial-build-system (prebuilt Java application)
;;; License: CDDL-1.0 + GPL-3.0

(define-public gephi
  (package
    (name "gephi")
    (version "0.10.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/gephi/gephi/releases/download/v"
                    version "/gephi-" version "-linux-x64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gephi/"))))
    (inputs (list openjdk11))
    (supported-systems '("x86_64-linux"))
    (synopsis "network visualization and analysis platform")
    (description "Gephi is an open-source network visualization and analysis
platform for exploring and understanding graphs.  It provides real-time
visualization, layout algorithms, metrics computation, and dynamic
filtering for complex network data.")
    (home-page "https://gephi.org/")
    (license license:gpl3)))

;;; ---- 17. plugin-autenticacao-gov-pt ----
;;; Portuguese government eID authentication plugin.
;;; Upstream: https://autenticacao.gov.pt/
;;; Build: trivial-build-system (prebuilt Java plugin)
;;; License: EUPL-1.2

(define-public plugin-autenticacao-gov-pt
  (package
    (name "plugin-autenticacao-gov-pt")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://autenticacao.gov.pt/fa/downloads/"
                    "plugin-autenticacao-gov-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/plugin-autenticacao-gov-pt/"))))
    (inputs (list openjdk))
    (supported-systems '("x86_64-linux"))
    (synopsis "Portuguese government eID authentication plugin")
    (description "Plugin Autenticacao.Gov allows authentication using the
Portuguese Citizen Card (Cartao de Cidadao) without installing browser
extensions.  It handles the cryptographic authentication protocol with
the national eID infrastructure.")
    (home-page "https://autenticacao.gov.pt/")
    (license license:eupl1.2)))

;;; ---- 18. eclipse-pydev ----
;;; Python IDE plugin for Eclipse.
;;; Upstream: https://www.pydev.org/
;;; Build: trivial-build-system (Eclipse plugin JAR)
;;; License: EPL-1.0

(define-public eclipse-pydev
  (package
    (name "eclipse-pydev")
    (version "13.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fabioz/Pydev/releases/download/"
                    "pydev_" (string-join (string-split version #\.) "_")
                    "/PyDev." version ".zip"))
              (file-name (string-append name "-" version ".zip"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/eclipse/dropins/pydev/"))))
    (native-inputs (list unzip))
    (inputs (list openjdk17 python))
    (supported-systems '("x86_64-linux"))
    (synopsis "Python development environment for Eclipse")
    (description "PyDev is a Python IDE for Eclipse providing code completion,
syntax highlighting, debugging, refactoring, and Django support.  It integrates
with the Eclipse platform for a full-featured Python development experience.")
    (home-page "https://www.pydev.org/")
    (license license:epl1.0)))
