;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424t
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (11): dashpay-bls-signatures, python-pylibssh, ipe,
;;;   thanos, ocaml-lablgl, fht-compositor, rsdkv4-bin,
;;;   redlib-git, mycorrhiza-git, minikube-git, fht-share-picker-git
;;; Already in Guix: 2 (libxfce4ui-devel, llvm19)
;;; Remaining BLOCKED: 87 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424t)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:export (dashpay-bls-signatures
            python-pylibssh
            ipe-editor
            thanos-monitoring
            ocaml-lablgl
            fht-compositor
            rsdkv4-bin
            redlib-git
            mycorrhiza-git
            minikube-git
            fht-share-picker-git))


;;; ---- 1. dashpay-bls-signatures ----
;;; Chia Networks BLS Signatures implementation fork for Dashcore.
;;; Source: https://github.com/dashpay/bls-signatures/
;;; License: Apache-2.0

(define-public dashpay-bls-signatures
  (package
    (name "dashpay-bls-signatures")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/dashpay/bls-signatures/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0vk2fvf1f2ilx4cwljcb97q5dnb9qmabnp0nr3mra7fw6m8psbay"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f  ;; tests require network / Catch2 integration
           #:configure-flags
           #~(list "-DBUILD_BLS_PYTHON_BINDINGS=OFF"
                   "-DBUILD_BLS_TESTS=OFF"
                   "-DBUILD_BLS_BENCHMARKS=OFF")))
    (inputs (list gmp libsodium))
    (native-inputs (list pkg-config))
    (synopsis "BLS signatures library forked for Dash cryptocurrency")
    (description
     "BLS Signatures implementation based on the Chia Network library,
forked and maintained by the Dash cryptocurrency project.  Provides
threshold signatures and signature aggregation using BLS12-381 curves.")
    (home-page "https://github.com/dashpay/bls-signatures/")
    (license license:asl2.0)))


;;; ---- 2. python-pylibssh ----
;;; Python bindings for libssh, specific to Ansible use case.
;;; Source: https://github.com/ansible/pylibssh
;;; License: LGPL-2.1

(define-public python-pylibssh
  (package
    (name "python-pylibssh")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ansible/pylibssh/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "1pc7hzhnvyx52sv2df08lgxz5j9j471f59bbi3n147jly668v62s"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))  ;; tests need running SSH server
    (inputs (list libssh))
    (native-inputs
     (list python-cython
           python-setuptools
           python-setuptools-scm
           python-toml
           python-wheel
           pkg-config))
    (propagated-inputs (list libssh))
    (synopsis "Python bindings for libssh for Ansible")
    (description
     "Python bindings for the libssh C library, specifically developed
for use with Ansible.  Provides SSH session management, channel
operations, SFTP support, and SCP file transfers from Python.")
    (home-page "https://github.com/ansible/pylibssh")
    (license license:lgpl2.1)))


;;; ---- 3. ipe ----
;;; The extensible drawing editor.
;;; Source: https://github.com/otfried/ipe
;;; License: GPL-3.0+

(define-public ipe-editor
  (package
    (name "ipe")
    (version "7.2.30")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/otfried/ipe/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0nkkaj9hvwm36bqhmjcjsa86z41f4hp2g4jxmgp5vba8vh76aa4j"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:make-flags
      #~(list (string-append "IPEPREFIX=" #$output)
              (string-append "LUA_PACKAGE=lua")
              "MOC=moc"
              "CXX=g++")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)  ;; no configure script, uses make variables
          (add-before 'build 'chdir-to-src
            (lambda _
              (chdir "src"))))))
    (inputs
     (list lua
           qtbase
           qtsvg
           freetype
           zlib
           poppler
           gsl))
    (native-inputs (list pkg-config))
    (synopsis "Extensible drawing editor for creating figures with LaTeX")
    (description
     "Ipe is an extensible drawing editor for creating figures in PDF
format.  It supports integration with LaTeX for typesetting labels
and text within figures.  Features include multiple pages, layers,
precise snapping, and Lua scripting for extensions.")
    (home-page "https://ipe.otfried.org/")
    (license license:gpl3+)))


;;; ---- 4. thanos ----
;;; Highly available Prometheus setup with long-term storage.
;;; Source: https://github.com/thanos-io/thanos
;;; License: MIT
;;; NOTE: Go build requires vendored modules; this is a draft recipe.

(define-public thanos-monitoring
  (package
    (name "thanos")
    (version "0.39.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/thanos-io/thanos/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "17kwz8wy6k5vzniv5jrdfcrql5ljzhzfsw2p6x3jflg7smv1jz8h"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/thanos-io/thanos"
      #:install-source? #f
      #:tests? #f  ;; tests require prometheus, alertmanager, minio
      #:phases
      #~(modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key import-path #:allow-other-keys)
              (invoke "go" "build"
                      "-o" "thanos"
                      "-ldflags" (string-append
                                  "-X main.Version=" #$version)
                      (string-append import-path "/cmd/thanos"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "thanos" bin)))))))
    (synopsis "Highly available Prometheus setup with long-term storage")
    (description
     "Thanos is a set of components that can be composed into a highly
available metric system with unlimited storage capacity.  It seamlessly
integrates with existing Prometheus deployments and provides global query
view, data downsampling, and compaction.")
    (home-page "https://thanos.io/")
    (license license:expat)))


;;; ---- 5. ocaml-lablgl ----
;;; OCaml interface to OpenGL.
;;; Source: https://github.com/garrigue/lablgl
;;; License: BSD-3-Clause

(define-public ocaml-lablgl
  (package
    (name "ocaml-lablgl")
    (version "1.07")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/garrigue/lablgl/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "07r7lq1f8vlj08js6dvf5j9jpmpqv30xz7ksj1isvsjsipnpfm44"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f  ;; no test suite
      #:phases
      #~(modify-phases %standard-phases
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (ocaml-lib (string-append
                                (assoc-ref outputs "out")
                                "/lib/ocaml/site-lib")))
                (with-output-to-file "Makefile.config"
                  (lambda ()
                    (format #t "BINDIR=~a/bin~%" out)
                    (format #t "INSTALLDIR=~a/lablGL~%" ocaml-lib)
                    (format #t "DLLDIR=~a/stublibs~%" ocaml-lib)
                    (format #t "GLLIBS=-lGL -lGLU~%")
                    (format #t "GLUTLIBS=-lglut~%")
                    (format #t "TKLIBS=~%")
                    (format #t "TKINCLUDES=~%")
                    (format #t "RANLIB=ranlib~%"))))))
          (replace 'build
            (lambda _
              (invoke "make" "lib")
              (invoke "make" "libopt")
              (invoke "make" "glut")
              (invoke "make" "glutopt"))))))
    (inputs
     (list mesa
           glu
           freeglut
           libxi
           libxmu))
    (native-inputs
     (list ocaml
           ocaml-findlib))
    (synopsis "OCaml interface to OpenGL")
    (description
     "LablGL is an OCaml interface to OpenGL.  It includes support
for the GL, GLU, and GLUT libraries.  It allows writing OpenGL
applications in OCaml using a type-safe interface with labeled
arguments for optional parameters.")
    (home-page "https://github.com/garrigue/lablgl")
    (license license:bsd-3)))


;;; ---- 6. fht-compositor ----
;;; A dynamic tiling Wayland compositor.
;;; Source: https://github.com/nferhat/fht-compositor
;;; License: GPL-3.0+
;;; NOTE: Rust build requires vendored crates; this is a draft recipe.

(define-public fht-compositor
  (package
    (name "fht-compositor")
    (version "25.03.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nferhat/fht-compositor/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0g9cbnciblqvy625gi8r09p13z3mif5vzm3jblxb44lc9rf9ly2m"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:tests? #f
      #:install-source? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'set-env
            (lambda _
              (setenv "RUSTFLAGS"
                      (string-append
                       "-C link-arg=-Wl,-rpath="
                       #$output "/lib")))))))
    (inputs
     (list mesa
           libinput
           pipewire
           eudev
           libxkbcommon))
    (native-inputs (list pkg-config))
    (synopsis "Dynamic tiling Wayland compositor")
    (description
     "Fht-compositor is a dynamic tiling Wayland compositor written in
Rust.  It supports workspaces, window rules, keyboard shortcuts,
and integrates with Wayland protocols for a modern desktop experience.")
    (home-page "https://github.com/nferhat/fht-compositor")
    (license license:gpl3+)))


;;; ---- 7. rsdkv4-bin ----
;;; RSDKv4 engine for Sonic 1 and Sonic 2 (prebuilt binary).
;;; Source: https://gitlab.com/linuxbombay/RSDKv4
;;; License: GPL

(define-public rsdkv4-bin
  (package
    (name "rsdkv4-bin")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://gitlab.com/linuxbombay/RSDKv4/binaries/"
             version "/-/raw/main/RSDKv4-linux-x64.tar.xz"))
       (sha256
        (base32 "010qkmv4kqwlqvyvw9qh71p52r72bv3q03klfbgfl602s0ly82br"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("RSDKv4" "bin/rsdkv4"))))
    (inputs
     (list sdl2
           sdl2-ttf
           sdl2-mixer))
    (synopsis "RSDKv4 engine for classic Sonic games")
    (description
     "RSDKv4 is the Retro Engine v4 used by Sonic 1 and Sonic 2
mobile ports.  This package provides the prebuilt Linux binary
of the open-source engine reimplementation.")
    (home-page "https://gitlab.com/linuxbombay/RSDKv4")
    (license license:gpl3)))


;;; ---- 8. redlib-git ----
;;; Private front-end for Reddit.
;;; Source: https://github.com/redlib-org/redlib
;;; License: AGPL-3.0
;;; NOTE: Rust build requires vendored crates; this is a draft recipe.

(define-public redlib-git
  (let ((commit "27f25e0")
        (revision "227"))
    (package
      (name "redlib-git")
      (version (git-version "0.29.4" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/redlib-org/redlib")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments
       (list
        #:tests? #f
        #:install-source? #f))
      (synopsis "Private front-end for Reddit")
      (description
       "Redlib is a private front-end for Reddit written in Rust.
It provides an alternative interface that does not require JavaScript,
does not track users, and allows browsing Reddit content with enhanced
privacy.")
      (home-page "https://github.com/redlib-org/redlib")
      (license license:agpl3))))


;;; ---- 9. mycorrhiza-git ----
;;; Filesystem and git-based wiki engine written in Go.
;;; Source: https://github.com/bouncepaw/mycorrhiza
;;; License: AGPL-3.0+
;;; NOTE: Go build requires vendored modules; this is a draft recipe.

(define-public mycorrhiza-git
  (let ((commit "da84a76")
        (revision "4"))
    (package
      (name "mycorrhiza-git")
      (version (git-version "1.15.1" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bouncepaw/mycorrhiza")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list
        #:import-path "github.com/bouncepaw/mycorrhiza"
        #:install-source? #f
        #:tests? #f))
      (synopsis "Git-based wiki engine using mycomarkup")
      (description
       "Mycorrhiza is a lightweight wiki engine that stores content in
a Git repository and uses the mycomarkup lightweight markup language.
It supports media uploads, user authentication, and Atom feeds.")
      (home-page "https://github.com/bouncepaw/mycorrhiza")
      (license license:agpl3+))))


;;; ---- 10. minikube-git ----
;;; Tool for running Kubernetes locally.
;;; Source: https://github.com/kubernetes/minikube
;;; License: Apache-2.0
;;; NOTE: Go build requires vendored modules; this is a draft recipe.

(define-public minikube-git
  (let ((commit "bed9aabaf")
        (revision "55"))
    (package
      (name "minikube-git")
      (version (git-version "0.28.2" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/kubernetes/minikube")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list
        #:import-path "k8s.io/minikube"
        #:install-source? #f
        #:tests? #f
        #:phases
        #~(modify-phases %standard-phases
            (replace 'build
              (lambda* (#:key import-path #:allow-other-keys)
                (invoke "go" "build"
                        "-o" "minikube"
                        (string-append import-path "/cmd/minikube"))))
            (replace 'install
              (lambda* (#:key outputs #:allow-other-keys)
                (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                  (install-file "minikube" bin)))))))
      (synopsis "Tool for running Kubernetes locally")
      (description
       "Minikube implements a local Kubernetes cluster on macOS, Linux,
and Windows.  It focuses on making it easy to learn and develop for
Kubernetes by running a single-node cluster in a virtual machine.")
      (home-page "https://minikube.sigs.k8s.io/")
      (license license:asl2.0))))


;;; ---- 11. fht-share-picker-git ----
;;; A Wayland XDG screencast output picker.
;;; Source: https://github.com/nferhat/fht-compositor
;;; License: GPL-3.0+
;;; NOTE: Rust build requires vendored crates; this is a draft recipe.

(define-public fht-share-picker-git
  (let ((commit "7b500b1")
        (revision "784"))
    (package
      (name "fht-share-picker-git")
      (version (git-version "25.10.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/nferhat/fht-compositor")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cargo-build-system)
      (arguments
       (list
        #:tests? #f
        #:install-source? #f
        #:phases
        #~(modify-phases %standard-phases
            (add-after 'unpack 'chdir
              (lambda _
                (chdir "fht-share-picker"))))))
      (inputs
       (list gtk
             libadwaita))
      (native-inputs (list pkg-config))
      (synopsis "Wayland XDG screencast output picker")
      (description
       "Fht-share-picker is a Wayland XDG screencast output picker
widget built with GTK4 and libadwaita.  It provides a graphical
interface for selecting which screen or window to share during
screen casting sessions.")
      (home-page "https://github.com/nferhat/fht-compositor")
      (license license:gpl3+))))
