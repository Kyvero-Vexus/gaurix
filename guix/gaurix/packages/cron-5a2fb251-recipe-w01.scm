;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2026 Gaurix contributors
;;;
;;; Standalone package definitions for cron-5a2fb251 worker 01.
;;; These bypass the broken general-compat.scm module by defining
;;; aliases directly.

(define-module (gaurix packages cron-5a2fb251-recipe-w01)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gaurix packages llama-cpp-cuda)
  #:export (openssl-1.0
            lib32-openssl-1.0
            llama.cpp-vulkan
            lib32-openssl-1.1
            libvpx1.3
            lib32-libvpx1.3
            lib32-glew1.10
            glew1.10
            llama.cpp-cuda
            circle-flags))

;; 1. openssl-1.0 — AUR compat alias for OpenSSL 1.0
(define-public openssl-1.0
  (package
    (inherit (specification->package "openssl"))
    (name "openssl-1.0")
    (synopsis "OpenSSL (AUR compatibility alias for openssl-1.0)")))

;; 2. lib32-openssl-1.0 — 32-bit compat alias
(define-public lib32-openssl-1.0
  (package
    (inherit openssl-1.0)
    (name "lib32-openssl-1.0")
    (synopsis "OpenSSL (AUR 32-bit compatibility alias for openssl-1.0)")))

;; 3. llama.cpp-vulkan — Vulkan variant alias
;;    Upstream llama-cpp already includes Vulkan support.
(define-public llama.cpp-vulkan
  (package
    (inherit (specification->package "llama-cpp"))
    (name "llama.cpp-vulkan")
    (synopsis "Port of Facebook's LLaMA model in C/C++ (Vulkan compatibility alias)")))

;; 4. lib32-openssl-1.1 — 32-bit OpenSSL 1.1 compat
(define-public lib32-openssl-1.1
  (package
    (inherit (specification->package "openssl"))
    (name "lib32-openssl-1.1")
    (synopsis "OpenSSL (AUR 32-bit compatibility alias for openssl-1.1)")))

;; 5. libvpx1.3 — Old libvpx compat
(define-public libvpx1.3
  (package
    (inherit (specification->package "libvpx"))
    (name "libvpx1.3")
    (synopsis "VP8/VP9 video codec library (AUR compatibility alias for libvpx 1.3)")))

;; 6. lib32-libvpx1.3 — 32-bit variant
(define-public lib32-libvpx1.3
  (package
    (inherit libvpx1.3)
    (name "lib32-libvpx1.3")
    (synopsis "VP8/VP9 video codec library (AUR 32-bit compatibility alias for libvpx 1.3)")))

;; 7. lib32-glew1.10 — Old GLEW 32-bit compat
(define-public lib32-glew1.10
  (package
    (inherit (specification->package "glew"))
    (name "lib32-glew1.10")
    (synopsis "GLEW (AUR 32-bit compatibility alias for glew 1.10)")))

;; 8. glew1.10 — GLEW 1.10 compat
(define-public glew1.10
  (package
    (inherit (specification->package "glew"))
    (name "glew1.10")
    (synopsis "GLEW (AUR compatibility alias for glew 1.10)")))

;; 9. llama.cpp-cuda — CUDA variant alias
;;    Re-export from (gaurix packages llama-cpp-cuda) with dotted name.
(define-public llama.cpp-cuda
  (package
    (inherit llama-cpp-cuda)
    (name "llama.cpp-cuda")))

;; 10. circle-flags — SVG flag icons from Linux Mint
(define-public circle-flags
  (package
    (name "circle-flags")
    (version "0-git.52b264a")
    (source
     (origin
       (method url-fetch)
       (uri "https://github.com/linuxmint/circle-flags/archive/52b264ab2bda4651f0ed4667184e9a173b8dbe85.tar.gz")
       (sha256
        (base32 "03d54vbg44c52d2hql626cwf589p4xx894cbwcacxkbwgg1x9b1v"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("usr/share/circle-flags-svg" "share/circle-flags-svg"))))
    (home-page "https://github.com/linuxmint/circle-flags")
    (synopsis "Collection of circular flags in SVG format")
    (description
     "Circle-flags provides a collection of circular country and territory
flags in SVG format, originally created for the Linux Mint project.")
    (license license:gpl2+)))
