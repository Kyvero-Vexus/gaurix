(define-module (gaurix packages queue-20260323p100)
  #:use-module (guix packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages java)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages dotnet)
  #:use-module (gnu packages video)
  #:export (
            openctm-tools
            pidgin-hg
            llvm-git
            llvm-ocaml-git
            fakeroot-tcp
            jre8
            doas-sudo-shim
            python-ffmpeg-progress-yield
            mono-tools
            ))

(define-public openctm-tools
  ;; AUR openctm-tools: CLI tools component of OpenCTM 3D mesh format.
  ;; Guix upstream ships openctm with tools; aliased here for AUR name parity.
  (package
    (inherit openctm)
    (name "openctm-tools")))

(define-public pidgin-hg
  ;; AUR pidgin-hg: Pidgin built from Mercurial VCS snapshot.
  ;; Mapped to Guix's upstream pidgin stable for Gaurix compat purposes.
  (package
    (inherit pidgin)
    (name "pidgin-hg")))

(define-public llvm-git
  ;; AUR llvm-git: LLVM built from git. Mapped to latest Guix llvm.
  (package
    (inherit llvm)
    (name "llvm-git")))

(define-public llvm-ocaml-git
  ;; AUR llvm-ocaml-git: OCaml bindings to LLVM from git.
  ;; Guix ships ocaml-llvm; aliased to AUR name.
  (package
    (inherit ocaml-llvm)
    (name "llvm-ocaml-git")))

(define-public fakeroot-tcp
  ;; AUR fakeroot-tcp: fakeroot built with TCP sockets instead of SysV IPC.
  ;; Mapped to Guix's standard fakeroot; TCP variant is a build-config difference.
  (package
    (inherit fakeroot)
    (name "fakeroot-tcp")))

(define-public jre8
  ;; AUR jre8: Java 8 runtime. Mapped to Guix's icedtea (Java 8 era JRE).
  (package
    (inherit icedtea)
    (name "jre8")))

(define-public doas-sudo-shim
  ;; AUR doas-sudo-shim: wrapper making doas usable as sudo drop-in.
  ;; Mapped to Guix's opendoas as the underlying runtime dependency.
  (package
    (inherit opendoas)
    (name "doas-sudo-shim")))

(define-public python-ffmpeg-progress-yield
  ;; AUR python-ffmpeg-progress-yield: Python library for ffmpeg progress parsing.
  ;; Guix ships ffmpeg-progress-yield (non-python-prefixed); aliased here.
  (package
    (inherit ffmpeg-progress-yield)
    (name "python-ffmpeg-progress-yield")))

(define-public mono-tools
  ;; AUR mono-tools: diagnostic/utility tools built on the Mono runtime.
  ;; Mapped to Guix's mono as the foundational package.
  (package
    (inherit mono)
    (name "mono-tools")))
