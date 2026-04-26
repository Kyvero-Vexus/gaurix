;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426f
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (3):
;;;   1. arti (Rust implementation of the Tor anonymity network)
;;;   2. vegastrike-engine (Vega Strike space simulator engine, cmake)
;;;   3. vegastrike (Vega Strike game data and launcher)
;;;
;;; Remaining BLOCKED: 97 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426f)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages image)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages check)
  #:export (arti
            vegastrike-engine
            vegastrike))


;;; ---- 1. arti ----
;;; Rust implementation of the Tor anonymity network.
;;; Upstream: https://gitlab.torproject.org/tpo/core/arti
;;; Crate: https://crates.io/crates/arti
;;; Build: cargo-build-system (cargo-inputs auto-vendors all crate deps)
;;; License: MIT OR Apache-2.0
;;; Resolves AUR arti-git.

(define-public arti
  (package
    (name "arti")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arti" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "04vhgmdljkzbfvpz7kvng2wf1wcd6z7954kza88y6lzqxx9dy0zn"))))
    (build-system cargo-build-system)
    (arguments
     (list #:install-source? #f))
    (native-inputs (list pkg-config))
    (inputs
     (cons* openssl sqlite xz
            (cargo-inputs 'arti)))
    (home-page "https://gitlab.torproject.org/tpo/core/arti/-/wikis/home")
    (synopsis "Rust implementation of the Tor anonymity network")
    (description "Arti is a project to produce an embeddable, production-quality
implementation of the Tor anonymity protocols in Rust.  It provides a SOCKS
proxy interface for routing traffic through the Tor network, with features
including onion services, pluggable transports, and a modular architecture
for embedding into other applications.")
    (license (list license:expat license:asl2.0))))


;;; ---- 2. vegastrike-engine ----
;;; Open-source space flight simulator engine.
;;; Upstream: https://github.com/vegastrike/Vega-Strike-Engine-Source
;;; Build: cmake-build-system
;;; License: GPL-2.0+
;;; Dependency for vegastrike game package.

(define-public vegastrike-engine
  (package
    (name "vegastrike-engine")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vegastrike/Vega-Strike-Engine-Source"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "03xzznkkrs3call44c0bwf2jiziwp1y9wni9374fwgrjix6s8mqg"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "-DENABLE_PIE=ON"
              "-DUSE_GTEST=OFF"
              (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'enter-engine-dir
            (lambda _
              (chdir "engine")))
          (delete 'check))))  ;; tests need game assets
    (native-inputs (list pkg-config))
    (inputs
     (list boost
           expat
           freeglut
           glu
           gtk+
           glib
           libjpeg-turbo
           libpng
           libvorbis
           openal
           python
           sdl2
           zlib))
    (home-page "https://www.vega-strike.org")
    (synopsis "Open-source space flight simulator engine")
    (description "Vega Strike Engine is the core engine for the Vega Strike
open-source space flight simulator.  It provides a 3D rendering engine with
OpenGL support, physics simulation, AI systems, and scripting via Python.
The engine supports space combat, trading, and exploration gameplay.")
    (license license:gpl2+)))


;;; ---- 3. vegastrike ----
;;; Open-source space flight simulator game data and launcher.
;;; Upstream: https://github.com/vegastrike/Assets-Production
;;; Build: copy-build-system (game assets + engine wrapper)
;;; License: GPL-2.0+
;;; Resolves AUR vegastrike-git.

(define-public vegastrike
  (package
    (name "vegastrike")
    (version "0.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/vegastrike/Assets-Production"
             "/archive/refs/tags/v" version ".tar.gz"))
       (sha256
        (base32 "06ahiql3kmhl4srzx72jcr11qmfnlwnxkb2qxf70hx6627859wqd"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/vegastrike/"
           #:exclude ("CMakeLists.txt" ".github" ".gitignore"
                      ".gitattributes" "LICENSE")))))
    (inputs (list vegastrike-engine))
    (home-page "https://www.vega-strike.org")
    (synopsis "Open-source space flight simulator")
    (description "Vega Strike is an open-source 3D space flight simulator
that lets players trade, fight, and explore in a vast universe.  It features
Newtonian flight physics, dynamic economies, multiple factions, and campaign
missions.  This package provides the game assets and data files.")
    (license license:gpl2+)))
