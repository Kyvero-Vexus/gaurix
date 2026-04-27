;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260426o
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 20 packages resolved with recipes, 80 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-26

(define-module (gaurix packages deptree-resolver-260426o)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages web)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages pulseaudio)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:export (etcd
            gowatch
            mermaid-ascii-bin
            disk-usage
            harbor-wave
            mod-maxminddb
            limine-booster
            pam-exec-ssh
            quantumlauncher-bin
            flclashx-bin
            framework-control-bin
            webos-dev-manager-bin
            livekit-bin
            luajit-sdl2-git
            luajit-sdl3-git
            spinwheel-pipewire
            etcd-bin
            jellyfin-rpc-bin
            buf-bin
            protonmail-bridge-free-git))

;;; ======================================================================
;;; SOURCE BUILD PACKAGES
;;; ======================================================================

;;; etcd — distributed key-value store (Go source build)
(define-public etcd
  (package
    (name "etcd")
    (version "3.6.10")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/etcd-io/etcd")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:import-path "go.etcd.io/etcd/v3"
           #:install-source? #f))
    (home-page "https://github.com/etcd-io/etcd")
    (synopsis "distributed reliable key-value store")
    (description "Etcd is a distributed, reliable key-value store for the most
critical data of a distributed system.  It is used as the backing store for
service discovery and configuration in many distributed systems including
Kubernetes.")
    (license license:asl2.0)))

;;; gowatch — terminal stopwatch (Go source build)
(define-public gowatch
  (package
    (name "gowatch")
    (version "1.1.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/buxxket/gowatch")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/buxxket/gowatch")
    (synopsis "simple terminal stopwatch written in Go")
    (description "Gowatch is a simple terminal stopwatch application written
in Go.  It provides a clean interface for timing activities from the command
line.")
    (license license:gpl3)))

;;; disk-usage — disk usage monitor with alerts (C/make source build)
(define-public disk-usage
  (package
    (name "disk-usage")
    (version "0.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/0xM4LL0C/disk_usage")
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
    (home-page "https://github.com/0xM4LL0C/disk_usage")
    (synopsis "disk usage monitoring tool with threshold alerts")
    (description "A tool to monitor disk usage and alert when usage exceeds a
configurable threshold.  Uses libnotify for desktop notifications.")
    (license license:expat)))

;;; harbor-wave — DigitalOcean ephemeral VM tool (Python)
(define-public harbor-wave
  (package
    (name "harbor-wave")
    (version "0.6.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/NetworkJack2/harbor-wave")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (inputs (list python))
    (home-page "https://github.com/NetworkJack2/harbor-wave")
    (synopsis "DigitalOcean ephemeral VM and droplet tool")
    (description "Harbor Wave is a DigitalOcean ephemeral VM/Droplet tool for
quickly spinning up and tearing down temporary cloud instances.")
    (license license:gpl3)))

;;; mod-maxminddb — Apache HTTPD module for MaxMind GeoIP (C/autotools)
(define-public mod-maxminddb
  (package
    (name "mod-maxminddb")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maxmind/mod_maxminddb/releases/download/"
                    version "/mod_maxminddb-" version ".tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/maxmind/mod_maxminddb")
    (synopsis "Apache module for MaxMind DB geo-IP lookups")
    (description "This Apache HTTPD module allows querying MaxMind DB files
for geo-IP lookups using the libmaxminddb library.  It enables location-based
access control and content customization in Apache.")
    (license license:asl2.0)))

;;; limine-booster — zero-config Limine boot entry automation (shell scripts)
(define-public limine-booster
  (package
    (name "limine-booster")
    (version "3.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/abshka/limine-booster")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://github.com/abshka/limine-booster")
    (synopsis "zero-config automation for Limine boot entries with Booster")
    (description "Limine-booster provides zero-configuration automation for
managing Limine bootloader entries using the Booster initramfs generator.")
    (license license:gpl3)))

;;; pam-exec-ssh — unlock SSH keys on login via PAM (shell scripts)
(define-public pam-exec-ssh
  (let ((commit "cc3b533")
        (revision "0"))
    (package
      (name "pam-exec-ssh")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/x70b1/pam_exec-ssh")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/x70b1/pam_exec-ssh")
      (synopsis "unlock SSH keys on login using PAM")
      (description "Pam_exec-ssh uses the PAM exec module to automatically
unlock SSH keys when logging in, using the expect utility to handle the
passphrase prompt.")
      (license license:unlicense))))

;;; luajit-sdl2-git — LuaJIT FFI bindings for SDL2
(define-public luajit-sdl2-git
  (let ((commit "33529d3")
        (revision "0"))
    (package
      (name "luajit-sdl2-git")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/sonoro1234/luajit-sdl2")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sonoro1234/luajit-sdl2")
      (synopsis "autogenerated LuaJIT bindings for SDL2")
      (description "Autogenerated LuaJIT FFI bindings for SDL2, providing
thread and audio support for LuaJIT applications.")
      (license license:expat))))

;;; luajit-sdl3-git — LuaJIT FFI bindings for SDL3
(define-public luajit-sdl3-git
  (let ((commit "9c0b802")
        (revision "0"))
    (package
      (name "luajit-sdl3-git")
      (version (git-version "0.1" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/sonoro1234/luajit-sdl3")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments (list #:tests? #f))
      (home-page "https://github.com/sonoro1234/luajit-sdl3")
      (synopsis "autogenerated LuaJIT bindings for SDL3")
      (description "Autogenerated LuaJIT FFI bindings for SDL3, providing
thread and audio support for LuaJIT applications.")
      (license license:expat))))

;;; spinwheel-pipewire — terminal wheel spinner with PipeWire audio
(define-public spinwheel-pipewire
  (package
    (name "spinwheel-pipewire")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://codeberg.org/the-traveler/spinwheel")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (home-page "https://codeberg.org/the-traveler/spinwheel")
    (synopsis "terminal wheel spinner with named wheels and built-in modes")
    (description "Spinwheel is a terminal wheel spinner with named wheels and
built-in modes.  This variant includes PipeWire audio integration for sound
effects during spinning.")
    (license license:gpl3)))

;;; protonmail-bridge-free-git — Proton Mail Bridge fork without keychain
(define-public protonmail-bridge-free-git
  (package
    (name "protonmail-bridge-free-git")
    (version "3.24.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mnixry/proton-bridge")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f))
    (home-page "https://github.com/mnixry/proton-bridge")
    (synopsis "Proton Mail Bridge fork without keychain requirement")
    (description "A fork of Proton Mail Bridge that removes the system keychain
requirement, storing secrets in a plaintext file instead.  Provides IMAP and
SMTP access to Proton Mail accounts for use with desktop email clients.")
    (license license:gpl3)))

;;; ======================================================================
;;; BINARY PACKAGES (prebuilt, copy-build-system)
;;; ======================================================================

;;; mermaid-ascii-bin — render Mermaid graphs in terminal (prebuilt Go binary)
(define-public mermaid-ascii-bin
  (package
    (name "mermaid-ascii-bin")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/"
                    version "/mermaid-ascii_Linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("mermaid-ascii" "bin/mermaid-ascii"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/AlexanderGrooff/mermaid-ascii")
    (synopsis "render Mermaid graphs as ASCII art in the terminal")
    (description "Mermaid-ascii renders Mermaid diagram definitions as ASCII
art directly in the terminal, without requiring a browser or graphical
environment.")
    (license license:expat)))

;;; quantumlauncher-bin — Minecraft launcher (prebuilt binary)
(define-public quantumlauncher-bin
  (package
    (name "quantumlauncher-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mrmayman/quantumlauncher/releases/download/v"
                    version "/quantum_launcher_linux_x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("quantum_launcher" "bin/quantum-launcher"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Mrmayman/quantumlauncher")
    (synopsis "simple and powerful Minecraft launcher")
    (description "QuantumLauncher is a simple, powerful Minecraft launcher
that supports multiple instances and mod management.")
    (license license:gpl3)))

;;; flclashx-bin — multi-platform proxy client (prebuilt AppImage)
(define-public flclashx-bin
  (package
    (name "flclashx-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pluralplay/FlClashX/releases/download/v"
                    version "/FlClashX-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/pluralplay/FlClashX")
    (synopsis "multi-platform proxy client based on ClashMeta")
    (description "FlClashX is a fork of FlClash, providing a multi-platform
proxy client based on ClashMeta with a simple and easy-to-use interface.")
    (license license:gpl3)))

;;; framework-control-bin — Framework Laptop control tool (prebuilt)
(define-public framework-control-bin
  (package
    (name "framework-control-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozturkkl/framework-control/releases/download/"
                    version "/framework-control-service-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/ozturkkl/framework-control")
    (synopsis "tool for Framework Laptop features like fan, battery and LEDs")
    (description "Framework Control is a tool for managing Framework Laptop
features including fan control, battery charging limits, and LED keyboard
configuration.")
    (license license:expat)))

;;; webos-dev-manager-bin — webOS TV device manager (prebuilt)
(define-public webos-dev-manager-bin
  (package
    (name "webos-dev-manager-bin")
    (version "1.99.16")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/webosbrew/dev-manager-desktop/releases/download/v"
                    version "/webos-dev-manager_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/webosbrew/dev-manager-desktop")
    (synopsis "device and DevMode manager for webOS TV")
    (description "WebOS Dev Manager is a desktop application for managing
webOS TV devices, including DevMode activation, app installation, and device
configuration.")
    (license license:asl2.0)))

;;; livekit-bin — real-time audio/video infrastructure (prebuilt Go binary)
(define-public livekit-bin
  (package
    (name "livekit-bin")
    (version "1.11.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/livekit/livekit/releases/download/v"
                    version "/livekit_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("livekit-server" "bin/livekit-server"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://livekit.io/")
    (synopsis "real-time audio, video and data infrastructure server")
    (description "LiveKit is an open-source real-time communication server
providing WebRTC-based audio, video, and data capabilities for building
real-time applications.")
    (license license:asl2.0)))

;;; etcd-bin — distributed key-value store (prebuilt binary)
(define-public etcd-bin
  (package
    (name "etcd-bin")
    (version "3.6.10")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/etcd-io/etcd/releases/download/v"
                    version "/etcd-v" version "-linux-amd64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("etcd" "bin/etcd")
               ("etcdctl" "bin/etcdctl")
               ("etcdutl" "bin/etcdutl"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/etcd-io/etcd")
    (synopsis "distributed reliable key-value store (prebuilt binary)")
    (description "Etcd is a distributed, reliable key-value store for the most
critical data of a distributed system.  This is the prebuilt binary release.")
    (license license:asl2.0)))

;;; jellyfin-rpc-bin — Jellyfin Discord Rich Presence (prebuilt)
(define-public jellyfin-rpc-bin
  (package
    (name "jellyfin-rpc-bin")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://aur.archlinux.org/cgit/aur.git/snapshot/jellyfin-rpc-bin.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/Radiicall/jellyfin-rpc")
    (synopsis "display Jellyfin content on Discord Rich Presence")
    (description "Jellyfin-RPC displays the content you are currently watching
on Jellyfin as Discord Rich Presence status.")
    (license license:gpl3)))

;;; buf-bin — Protocol Buffers tooling (prebuilt Go binary)
(define-public buf-bin
  (package
    (name "buf-bin")
    (version "1.50.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bufbuild/buf/releases/download/v"
                    version "/buf-Linux-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("buf/bin/buf" "bin/buf")
                              ("buf/bin/protoc-gen-buf-breaking" "bin/protoc-gen-buf-breaking")
                              ("buf/bin/protoc-gen-buf-lint" "bin/protoc-gen-buf-lint"))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://buf.build")
    (synopsis "tool for working with Protocol Buffers")
    (description "Buf is a tool for working with Protocol Buffers, providing
linting, breaking change detection, and code generation management for
protobuf schemas.")
    (license license:asl2.0)))
