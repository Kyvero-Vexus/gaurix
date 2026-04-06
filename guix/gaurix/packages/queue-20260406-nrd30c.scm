;;; Queue drain 2026-04-06 NRD30c — resolve 30 NEEDS_RECIPE_DESIGN packages.
;;; 8 recipes: 2 binary (Go), 3 Python packages, 1 C source build,
;;; 1 Python script, 1 Python+udev tool.
;;; 8 compat aliases in general-compat.scm.
;;; 14 re-blocked with detailed notes.
(define-module (gaurix packages queue-20260406-nrd30c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module ((guix licenses) #:prefix license:))

;; Re-export list for packages.scm
(export gotop-bin
        resticprofile-bin
        python-transitions
        python-pyhocon
        python-pyjson5
        grabc
        googler
        rivalcfg-git)

;; ═══════════════════════════════════════════════════════════════════
;; Binary packages — trivial-build-system
;; ═══════════════════════════════════════════════════════════════════

;; ── 1. gotop-bin ───────────────────────────────────────────────────
;; Terminal-based graphical activity monitor (Go static binary)

(define-public gotop-bin
  (package
    (name "gotop-bin")
    (version "4.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/xxxserxxx/gotop/releases/download/v"
                    version "/gotop_v" version "_linux_amd64.tgz"))
              (sha256
               (base32 "1dwl0cw4b2r0ak5g5r2hv46marwh2kc7mkjx2jkai0kvy0ckdgvx"))))
    (build-system trivial-build-system)
    (native-inputs (list gzip tar))
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH" (string-append
                               #$(this-package-native-input "tar") "/bin:"
                               #$(this-package-native-input "gzip") "/bin"))
               (invoke "tar" "xzf" #$source)
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (install-file "gotop" bin)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/xxxserxxx/gotop")
    (synopsis "terminal-based graphical activity monitor inspired by gtop and vtop")
    (description "Gotop is a terminal-based graphical activity monitor inspired by
gtop and vtop.  It displays CPU, memory, disk, network, and temperature
information with configurable layouts and color schemes.")
    (license license:agpl3)))

;; ── 2. resticprofile-bin ───────────────────────────────────────────
;; Configuration profiles manager for restic backup (Go static binary)

(define-public resticprofile-bin
  (package
    (name "resticprofile-bin")
    (version "0.29.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/creativeprojects/resticprofile/releases/download/v"
                    version "/resticprofile_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "01sq60hgrdnvyyy4hakwggfgx6183h932sm9wjihw6ba64rvyfw8"))))
    (build-system trivial-build-system)
    (native-inputs (list gzip tar))
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (setenv "PATH" (string-append
                               #$(this-package-native-input "tar") "/bin:"
                               #$(this-package-native-input "gzip") "/bin"))
               (invoke "tar" "xzf" #$source)
               (let ((bin (string-append #$output "/bin")))
                 (mkdir-p bin)
                 (install-file "resticprofile" bin)))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/creativeprojects/resticprofile")
    (synopsis "configuration profiles manager for restic backup")
    (description "Resticprofile is a configuration profiles manager for the
restic backup tool.  It allows defining multiple backup profiles in TOML,
YAML, or JSON configuration files with scheduling support.")
    (license license:gpl3)))

;; ═══════════════════════════════════════════════════════════════════
;; Python packages
;; ═══════════════════════════════════════════════════════════════════

;; ── 3. python-transitions ──────────────────────────────────────────
;; Lightweight state machine library for Python

(define-public python-transitions
  (package
    (name "python-transitions")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "transitions" version))
              (sha256
               (base32 "01225mlp5922x02lkxcyhfswq1vdn0m065hmxxn3c6flvgdr111g"))))
    (build-system python-build-system)
    (propagated-inputs (list python-six))
    (arguments (list #:tests? #f))  ;; tests require python-pygraphviz, python-pytest
    (home-page "https://github.com/pytransitions/transitions")
    (synopsis "lightweight, object-oriented finite state machine in Python")
    (description "Transitions is a lightweight, object-oriented state machine
implementation for Python.  It supports nested states, parallel states,
callbacks, and auto-transitions with an optional graphical representation.")
    (license license:expat)))

;; ── 4. python-pyhocon ──────────────────────────────────────────────
;; HOCON parser for Python

(define-public python-pyhocon
  (package
    (name "python-pyhocon")
    (version "0.3.60")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyhocon" version))
              (sha256
               (base32 "0jzx4mjw4hfj3d7ca37p4dww5wpylpqq28m7419ix616l475467a"))))
    (build-system python-build-system)
    (propagated-inputs (list python-pyparsing))
    (arguments (list #:tests? #f))  ;; tests require python-pytest and fixtures
    (home-page "https://github.com/chimpler/pyhocon")
    (synopsis "HOCON parser for Python")
    (description "Pyhocon is a HOCON (Human-Optimized Config Object Notation)
parser for Python.  HOCON is a superset of JSON used by libraries such as
Typesafe's config for the JVM.  It supports includes, substitutions,
concatenation, and object merging.")
    (license license:asl2.0)))

;; ── 5. python-pyjson5 ─────────────────────────────────────────────
;; JSON5 serializer and parser for Python

(define-public python-pyjson5
  (package
    (name "python-pyjson5")
    (version "1.6.8")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "pyjson5" version))
              (sha256
               (base32 "0ylfp8j8mb0n1zma3zbqcns5grwb8w69lzhs9z606jwa182yxv5k"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-cython python-setuptools))
    (arguments (list #:tests? #f))  ;; tests require python-pytest and fixtures
    (home-page "https://github.com/Kijewski/pyjson5")
    (synopsis "JSON5 serializer and parser written in Cython")
    (description "Pyjson5 is a JSON5 serializer and parser for Python 3 written
in Cython.  JSON5 is a superset of JSON that allows comments, trailing commas,
single-quoted strings, and more relaxed syntax.")
    (license license:expat)))

;; ═══════════════════════════════════════════════════════════════════
;; Source builds
;; ═══════════════════════════════════════════════════════════════════

;; ── 6. grabc ───────────────────────────────────────────────────────
;; X11 color picker — click anywhere to grab a pixel's color

(define-public grabc
  (package
    (name "grabc")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/muquit/grabc/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "182yipbv44qgippqmi5dhmsk5qfzr27l2c56524kxxhyn7jx5r53"))))
    (build-system gnu-build-system)
    (inputs (list libx11))
    (arguments
     (list #:tests? #f   ;; no test suite
           #:phases
           #~(modify-phases %standard-phases
               (delete 'configure)  ;; no configure script
               (replace 'build
                 (lambda _
                   (invoke "make"
                           (string-append "LIBS=-L"
                                          #$(this-package-input "libx11")
                                          "/lib -lX11")
                           (string-append "INCLUDES=-I"
                                          #$(this-package-input "libx11")
                                          "/include"))))
               (replace 'install
                 (lambda _
                   (let ((bin (string-append #$output "/bin"))
                         (man (string-append #$output "/share/man/man1")))
                     (mkdir-p bin)
                     (mkdir-p man)
                     (install-file "grabc" bin)
                     (install-file "grabc.1" man)))))))
    (home-page "https://github.com/muquit/grabc")
    (synopsis "X11 color picker for grabbing pixel colors")
    (description "Grabc is a simple X11 command-line tool that lets you pick
a color from any pixel on the screen.  It displays the color value in hex
and decimal RGB format.")
    (license license:gpl2+)))

;; ── 7. googler ─────────────────────────────────────────────────────
;; Google search from the terminal

(define-public googler
  (package
    (name "googler")
    (version "4.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jarun/googler/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "0m4dqqa9zqk0d9qq9qf73prczv5r1iwj1dxyzjkchicsgr0ayndx"))))
    (build-system copy-build-system)
    (inputs (list python))
    (arguments
     (list #:install-plan
           #~'(("googler" "bin/googler"))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'install 'wrap-program
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((python (search-input-file inputs "bin/python3")))
                     (wrap-program (string-append #$output "/bin/googler")
                       `("PYTHONPATH" ":" prefix
                         ,(list (string-append
                                 #$(this-package-input "python")
                                 "/lib/python"
                                 ,(version-major+minor
                                   (package-version
                                    (this-package-input "python")))
                                 "/site-packages"))))))))))
    (home-page "https://github.com/jarun/googler")
    (synopsis "search Google from the command line")
    (description "Googler is a power tool to search Google (web, news,
videos) from the command line.  It shows title, URL, and abstract for each
result and supports navigation, site-specific search, and integration
with a text-based browser.")
    (license license:gpl3+)))

;; ── 8. rivalcfg-git ───────────────────────────────────────────────
;; CLI tool to configure SteelSeries gaming mice

(define-public rivalcfg-git
  (package
    (name "rivalcfg-git")
    (version "4.13.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/flozz/rivalcfg/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32 "1lip56rink6q69i521b2yvpihvj3pdbvx78g13b5d5p4mdya1ygy"))))
    (build-system python-build-system)
    (inputs (list python-hidapi))
    (propagated-inputs (list python-hidapi))
    (native-inputs (list python-setuptools))
    (arguments (list #:tests? #f))  ;; tests need connected hardware
    (home-page "https://github.com/flozz/rivalcfg")
    (synopsis "CLI tool to configure SteelSeries gaming mice on Linux")
    (description "Rivalcfg is a Python library and CLI tool to configure
SteelSeries gaming mice on Linux.  It supports setting sensitivity, polling
rate, color, and LED effects for various SteelSeries mouse models.")
    (license license:wtfpl2)))
