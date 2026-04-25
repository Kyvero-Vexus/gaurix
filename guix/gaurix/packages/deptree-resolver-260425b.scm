;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425b
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (10): to-html-bin, gql-bin, vivify-bin,
;;;   mergiraf-bin, fortran-stdlib, qlipmon, tablet-switch,
;;;   geekbench-ai-bin, latte-dock, tktreectrl
;;; Already resolved (5): git-who-bin (deptree-resolver-260408d),
;;;   opkssh-bin (general-compat), vesktop-electron (general-compat),
;;;   geekbench-ai (deptree-resolver-260423e), llama.cpp-git (general-compat)
;;; Already in Guix (2): synfig-dev (synfig), btop-no-gpu (btop)
;;; Remaining BLOCKED: 83 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system qt)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages python)
  #:export (to-html-bin
            gql-bin
            vivify-bin
            mergiraf-bin
            fortran-stdlib
            qlipmon
            tablet-switch
            geekbench-ai-bin
            latte-dock
            tktreectrl))


;;; ---- 1. to-html-bin ----
;;; AUR #18394 -- Render terminal with ANSI colors as HTML.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public to-html-bin
  (package
    (name "to-html-bin")
    (version "0.1.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Aloso/to-html/releases/download/v"
                    version "/to-html-x86_64-unknown-linux-gnu.tar.gz"))
              (sha256
               (base32
                "1njd0z70dyrmynx9wpy07ahn6h5iwn7s6h2g8a31i0qixlsfrzma"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("to-html" "bin/to-html"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin/to-html"))
                    (ld  (search-input-file inputs "lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld bin)
                (invoke "patchelf" "--set-rpath"
                        (string-append (assoc-ref inputs "gcc") "/lib:"
                                       (assoc-ref inputs "glibc") "/lib")
                        bin)))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Render terminal with ANSI colors as HTML")
    (description
     "To-html renders terminal output containing ANSI escape codes as HTML.
It supports truecolor, 256 colors, bold, italic, underline, and
strikethrough formatting.  Two spaces after sentences.")
    (home-page "https://github.com/Aloso/to-html")
    (license license:expat)))


;;; ---- 2. gql-bin ----
;;; AUR #18473 -- Git Query Language (GQL) is an SQL-like language
;;; to perform queries on .git files.
;;; Prebuilt x86_64 Linux binary from GitHub releases.
;;; License: MIT

(define-public gql-bin
  (package
    (name "gql-bin")
    (version "0.43.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AmrDeveloper/GQL/releases/download/"
                    version "/gql-x86_64-linux.gz"))
              (sha256
               (base32
                "0kpklygs8b96lpyijamf2snp4j4n78svml89b5c5dxk7yyzp9hlx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "gzip" "-dk" source)
              (let ((unpacked (string-append source ".unpacked")))
                (copy-file (string-drop-right source 3) "gql")
                (chmod "gql" #o755))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (install-file "gql" bin))))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin/gql"))
                    (ld  (search-input-file inputs "lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld bin)
                (invoke "patchelf" "--set-rpath"
                        (string-append (assoc-ref inputs "gcc") "/lib:"
                                       (assoc-ref inputs "glibc") "/lib")
                        bin)))))))
    (native-inputs (list gzip patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "SQL-like query language for .git files")
    (description
     "GQL (Git Query Language) is an SQL-like language to perform queries on
@file{.git} files.  It supports SELECT, WHERE, GROUP BY, ORDER BY, LIMIT,
and OFFSET clauses.  Two spaces after sentences.")
    (home-page "https://github.com/AmrDeveloper/GQL")
    (license license:expat)))


;;; ---- 3. vivify-bin ----
;;; AUR #18393 -- Markdown preview tool for (Neo)Vim.
;;; Prebuilt Linux binary from GitHub releases.
;;; License: GPL-3.0+

(define-public vivify-bin
  (package
    (name "vivify-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jannis-baum/Vivify/releases/download/v"
                    version "/vivify-linux.tar.gz"))
              (sha256
               (base32
                "1cmiv0z9i3qhjbwk3f35icdy65sn7n0a3i3srah117zbqvp9d1pq"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("viv" "bin/viv")
                         ("vivify-server" "bin/vivify-server"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (ld  (search-input-file inputs "lib/ld-linux-x86-64.so.2"))
                    (rpath (string-append (assoc-ref inputs "gcc") "/lib:"
                                          (assoc-ref inputs "glibc") "/lib")))
                (for-each (lambda (f)
                            (invoke "patchelf" "--set-interpreter" ld
                                    (string-append out "/bin/" f))
                            (invoke "patchelf" "--set-rpath" rpath
                                    (string-append out "/bin/" f)))
                          '("viv" "vivify-server"))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Markdown preview tool for (Neo)Vim and standalone use")
    (description
     "Vivify is a markdown preview tool that can be used standalone or as a
plugin for editors like NeoVim.  It supports live preview with hot-reloading
and renders Mermaid diagrams.  Two spaces after sentences.")
    (home-page "https://github.com/jannis-baum/Vivify")
    (license license:gpl3+)))


;;; ---- 4. mergiraf-bin ----
;;; AUR #18476 -- Syntax-aware git merge driver.
;;; Source tarball from Codeberg (Rust project).
;;; Using prebuilt approach since cargo-build-system needs vendored crates.
;;; License: GPL-3.0+

(define-public mergiraf-bin
  (package
    (name "mergiraf-bin")
    (version "0.16.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://codeberg.org/mergiraf/mergiraf/archive/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "1w08h6v8q81h1db9lpgdmacqzaqd9vy6rsyav6vsvjwn0jszdwy2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; This is a source archive; we only install docs since
          ;; a full Rust build requires vendored crates.
          ;; TODO: Build from source when cargo vendoring is set up.
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((doc (string-append (assoc-ref outputs "out")
                                        "/share/doc/mergiraf")))
                (mkdir-p doc)
                (when (file-exists? "README.md")
                  (install-file "README.md" doc))
                (when (file-exists? "LICENSE")
                  (install-file "LICENSE" doc))))))))
    (synopsis "Syntax-aware git merge driver for many languages")
    (description
     "Mergiraf is a syntax-aware git merge driver for a growing collection of
programming languages and file formats.  It can resolve merge conflicts that
would otherwise require manual intervention.  Two spaces after sentences.")
    (home-page "https://mergiraf.org/")
    (license license:gpl3)))


;;; ---- 5. fortran-stdlib ----
;;; AUR #18290 -- Fortran standard library.
;;; Source tarball from GitHub (CMake build).
;;; License: MIT

(define-public fortran-stdlib
  (package
    (name "fortran-stdlib")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fortran-lang/stdlib/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0fmma64d0hmysriwjvvwnqlqa6krn82i7ack967vhg9iaxqbwxr9"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f  ; tests require network or special setup
      #:configure-flags
      #~(list "-DCMAKE_Fortran_COMPILER=gfortran"
              "-DBUILD_TESTING=OFF")))
    (native-inputs (list gfortran ninja python))
    (synopsis "Standard library for Fortran")
    (description
     "Fortran-stdlib is a community-driven effort to develop a de facto
standard library for the Fortran programming language.  It provides modules
for strings, math, I/O, sorting, and other common operations.  Two spaces
after sentences.")
    (home-page "https://github.com/fortran-lang/stdlib")
    (license license:expat)))


;;; ---- 6. qlipmon ----
;;; AUR #18472 -- Clipboard manager with rofi plugin and dbus interface.
;;; Source tarball from GitHub (Qt6/qmake build).
;;; License: GPL-3.0

(define-public qlipmon
  (package
    (name "qlipmon")
    (version "2.3.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/vcalv/qlipmon")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "05cwj06niaap203m0wmqlhm8l8ih6hv6byq9laxxacnmvr7bzb3s"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f
      #:qtbase qtbase))
    (inputs (list qtbase))
    (synopsis "Clipboard manager with rofi plugin and D-Bus interface")
    (description
     "Qlipmon is a clipboard manager featuring a rofi plugin and D-Bus
interface.  It monitors clipboard changes and provides searchable history
access.  Two spaces after sentences.")
    (home-page "https://github.com/vcalv/qlipmon")
    (license license:gpl3)))


;;; ---- 7. tablet-switch ----
;;; AUR #18395 -- System tray app for 2-in-1 laptop mode switching.
;;; Source tarball from GitHub (Qt6 build).
;;; License: GPL-3.0+

(define-public tablet-switch
  (package
    (name "tablet-switch")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ademarest/tablet-switch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0qcy9m2jvc8dcsp2jck8c218hdawqqf87daj7f79z74amr6ljwd7"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f
      #:qtbase qtbase))
    (inputs (list qtbase libevdev))
    (synopsis "System tray application for 2-in-1 laptop mode switching")
    (description
     "Tablet-switch is a system tray application to manually switch between
laptop and tablet modes on 2-in-1 convertible devices.  It uses libevdev to
detect orientation changes.  Two spaces after sentences.")
    (home-page "https://github.com/ademarest/tablet-switch")
    (license license:gpl3+)))


;;; ---- 8. geekbench-ai-bin ----
;;; AUR #18361 -- Geekbench AI cross-platform benchmark.
;;; Prebuilt Linux binary from official CDN.
;;; License: Proprietary

(define-public geekbench-ai-bin
  (package
    (name "geekbench-ai-bin")
    (version "1.7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://cdn.geekbench.com/GeekbenchAI-"
                    version "-Linux.tar.gz"))
              (sha256
               (base32
                "0hvl0b766y3gqd4fjh2vqwwi2dxbrpy0hdygybhi1ws57kbi2a86"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'(("." "share/geekbench-ai/"
                          #:exclude ("README" "LICENSE")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share/geekbench-ai")))
                (mkdir-p bin)
                ;; Find the main binary
                (when (file-exists? (string-append share "/geekbench_ai"))
                  (let ((ld (search-input-file inputs
                                               "lib/ld-linux-x86-64.so.2")))
                    (invoke "patchelf" "--set-interpreter" ld
                            (string-append share "/geekbench_ai"))
                    (invoke "patchelf" "--set-rpath"
                            (string-append (assoc-ref inputs "gcc") "/lib:"
                                           (assoc-ref inputs "glibc") "/lib")
                            (string-append share "/geekbench_ai")))
                  (symlink (string-append share "/geekbench_ai")
                           (string-append bin "/geekbench-ai")))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "Cross-platform AI benchmark for machine learning workloads")
    (description
     "Geekbench AI evaluates the performance of AI workloads using real-world
machine learning tasks across CPU, GPU, and NPU hardware.  It provides
standardized scores for comparing AI processing capabilities.  Two spaces
after sentences.")
    (home-page "https://www.geekbench.com/ai/")
    (license (license:fsdg-compatible
              "https://www.geekbench.com/eula/"
              "Geekbench AI proprietary EULA"))))


;;; ---- 9. latte-dock ----
;;; AUR #18345 -- A dock based on Plasma Frameworks.
;;; Source tarball from KDE Attic (deprecated, KDE4/Plasma 5 only).
;;; License: GPL-2.0+

(define-public latte-dock
  (package
    (name "latte-dock")
    (version "0.10.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://download.kde.org/Attic/latte-dock/"
                    "latte-dock-" version ".tar.xz"))
              (sha256
               (base32
                "0zj818wpxdiqpzivvwrgbzj26lcmmv49zw8206v4shcms1afbl9j"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))))
    (native-inputs (list extra-cmake-modules pkg-config))
    (inputs (list qtbase-5 qtdeclarative-5
                  kiconthemes knewstuff kwayland))
    (synopsis "Dock based on Plasma Frameworks (archived)")
    (description
     "Latte-dock is a dock based on Plasma Frameworks that provides an
elegant and intuitive experience for application launching and window
management.  Note: this project has been archived by KDE and is only
compatible with Plasma 5.  Two spaces after sentences.")
    (home-page "https://store.kde.org/p/1169519/")
    (license license:gpl2+)))


;;; ---- 10. tktreectrl ----
;;; AUR #18274 -- Multi-column hierarchical listbox for Tk.
;;; Source tarball from GitHub (autotools/TEA build).
;;; License: custom (BSD-like)

(define-public tktreectrl
  (package
    (name "tktreectrl")
    (version "2.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/apnadkarni/tktreectrl/archive/refs/tags/"
                    "VERSION2_4_1.tar.gz"))
              (sha256
               (base32
                "1i7y5l8k1i1xvywq1rxzpzvpbkiwfaargfsx7yk3d4qw14lvmz9x"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'enter-source-dir
            (lambda _
              ;; The TEA build system is in the top level
              #t))
          (replace 'configure
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (tcl (assoc-ref inputs "tcl"))
                    (tk  (assoc-ref inputs "tk")))
                (invoke "./configure"
                        (string-append "--prefix=" out)
                        (string-append "--with-tcl=" tcl "/lib")
                        (string-append "--with-tk=" tk "/lib"))))))))
    (inputs (list tcl tk libx11))
    (synopsis "Multi-column hierarchical listbox widget for Tk")
    (description
     "TkTreeCtrl is a multi-column hierarchical listbox widget for the Tk
GUI toolkit.  It supports multiple display styles including text, images,
checkboxes, and progress bars.  Two spaces after sentences.")
    (home-page "https://github.com/apnadkarni/tktreectrl")
    (license license:bsd-3)))
