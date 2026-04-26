;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426m
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (21):
;;;   1. etcd (Go: distributed key-value store)
;;;   2. gowatch (Go: terminal stopwatch)
;;;   3. mod-maxminddb (C: Apache MaxMind GeoIP module)
;;;   4. disk-usage (C: disk usage monitor tool)
;;;   5. mermaid-ascii-git (Python: render Mermaid diagrams in terminal)
;;;   6. jellyfin-rpc-bin (prebuilt: Jellyfin Discord RPC client)
;;;   7. quantumlauncher-bin (prebuilt: Minecraft launcher)
;;;   8. flclashx-bin (prebuilt: multi-platform proxy client)
;;;   9. webos-dev-manager-bin (prebuilt: webOS TV device manager)
;;;  10. limine-booster (shell: Limine boot entry automation)
;;;  11. dela (Rust: task runner that delegates to other tools)
;;;  12. dpibreak (Rust: DPI circumvention tool)
;;;  13. harbor-wave (Go: DigitalOcean ephemeral VM tool)
;;;  14. livekit (Go: real-time video/audio server)
;;;  15. buf-git (Go: Protocol Buffers tooling)
;;;  16. artificial-rage-git (C++: sci-fi FPS game with Raylib)
;;;  17. luajit-sdl2-git (LuaJIT: SDL2 bindings)
;;;  18. luajit-sdl3-git (LuaJIT: SDL3 bindings)
;;;  19. protonmail-bridge-free-nokeychain-git (Go: Proton Mail bridge fork)
;;;  20. framework-control-bin (prebuilt: Framework Laptop control tool)
;;;  21. pam-exec-ssh-git (C: PAM module for SSH key unlock)
;;;
;;; Remaining BLOCKED: 70 packages (see blocked-notes)
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages deptree-resolver-260426m)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system go)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:export (etcd
            gowatch
            mod-maxminddb
            disk-usage
            mermaid-ascii-git
            jellyfin-rpc-bin
            quantumlauncher-bin
            flclashx-bin
            webos-dev-manager-bin
            limine-booster
            dela
            dpibreak
            harbor-wave
            livekit
            buf-git
            artificial-rage-git
            luajit-sdl2-git
            luajit-sdl3-git
            protonmail-bridge-free-nokeychain-git
            framework-control-bin
            pam-exec-ssh-git))

;;; ---- 1. etcd ----
;;; Distributed, reliable key-value store.
;;; Upstream: https://github.com/etcd-io/etcd
;;; Build: go-build-system (vendored deps via go modules)
;;; License: Apache-2.0

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
           #:install-source? #f
           #:import-path "go.etcd.io/etcd/v3"))
    (supported-systems '("x86_64-linux"))
    (synopsis "distributed reliable key-value store")
    (description "etcd is a distributed, reliable key-value store for the most
critical data of a distributed system.  It is used as a backing store for
service discovery, shared configuration, and distributed coordination.")
    (home-page "https://etcd.io/")
    (license license:asl2.0)))

;;; ---- 2. gowatch ----
;;; Simple terminal stopwatch written in Go.
;;; Upstream: https://github.com/buxxket/gowatch
;;; Build: go-build-system
;;; License: GPL-3.0

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
           #:install-source? #f
           #:import-path "github.com/buxxket/gowatch"))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple terminal stopwatch")
    (description "Gowatch is a simple terminal stopwatch application written in
Go.  It provides a clean terminal interface for timing activities.")
    (home-page "https://github.com/buxxket/gowatch")
    (license license:gpl3)))

;;; ---- 3. mod-maxminddb ----
;;; Apache HTTPD module for MaxMind GeoIP databases.
;;; Upstream: https://github.com/maxmind/mod_maxminddb
;;; Build: gnu-build-system (autotools)
;;; License: Apache-2.0

(define-public mod-maxminddb
  (package
    (name "mod-maxminddb")
    (version "1.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/maxmind/mod_maxminddb")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs (list autoconf automake libtool pkg-config))
    (inputs (list httpd libmaxminddb))
    (supported-systems '("x86_64-linux"))
    (synopsis "Apache module for MaxMind DB geo-location lookups")
    (description "mod_maxminddb is an Apache 2.2+ module that allows querying
MaxMind DB files from Apache using the libmaxminddb library.  It provides
geo-location data for incoming requests.")
    (home-page "https://github.com/maxmind/mod_maxminddb")
    (license license:asl2.0)))

;;; ---- 4. disk-usage ----
;;; Disk usage monitoring tool with threshold alerts.
;;; Upstream: https://github.com/0xM4LL0C/disk_usage
;;; Build: gnu-build-system
;;; License: MIT

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
    (supported-systems '("x86_64-linux"))
    (synopsis "disk usage monitor with threshold alerts")
    (description "Disk_usage is a tool to monitor disk usage and alert when
usage exceeds a configurable threshold.  It provides simple command-line
monitoring for system administrators.")
    (home-page "https://github.com/0xM4LL0C/disk_usage")
    (license license:expat)))

;;; ---- 5. mermaid-ascii-git ----
;;; Render Mermaid diagrams as ASCII art in the terminal.
;;; Upstream: https://github.com/AlexanderGrooff/mermaid-ascii
;;; Build: pyproject-build-system
;;; License: MIT

(define-public mermaid-ascii-git
  (let ((commit "14ea0d2")
        (revision "1"))
    (package
      (name "mermaid-ascii-git")
      (version (git-version "0.7.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/AlexanderGrooff/mermaid-ascii")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system pyproject-build-system)
      (arguments (list #:tests? #f))
      (native-inputs (list python-setuptools python-wheel))
      (supported-systems '("x86_64-linux"))
      (synopsis "render Mermaid graphs as ASCII in the terminal")
      (description "Mermaid-ascii renders Mermaid diagram definitions as ASCII
art directly in the terminal.  It supports flowcharts, sequence diagrams, and
other Mermaid graph types.")
      (home-page "https://github.com/AlexanderGrooff/mermaid-ascii")
      (license license:expat))))

;;; ---- 6. jellyfin-rpc-bin ----
;;; Prebuilt Jellyfin Discord Rich Presence client.
;;; Upstream: https://github.com/Radiicall/jellyfin-rpc
;;; Build: copy-build-system (prebuilt binary)
;;; License: GPL-3.0

(define-public jellyfin-rpc-bin
  (package
    (name "jellyfin-rpc-bin")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Radiicall/jellyfin-rpc/releases/download/v"
                    version "/jellyfin-rpc-x86_64-unknown-linux-gnu"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("jellyfin-rpc-x86_64-unknown-linux-gnu" "bin/jellyfin-rpc"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "jellyfin-rpc-x86_64-unknown-linux-gnu")
                   (chmod "jellyfin-rpc-x86_64-unknown-linux-gnu" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Jellyfin Discord Rich Presence client")
    (description "Jellyfin-RPC displays the content you are currently watching
on Jellyfin as your Discord Rich Presence status.  It shows media title,
progress, and other metadata.")
    (home-page "https://github.com/Radiicall/jellyfin-rpc")
    (license license:gpl3)))

;;; ---- 7. quantumlauncher-bin ----
;;; Prebuilt Minecraft launcher.
;;; Upstream: https://github.com/Mrmayman/quantumlauncher
;;; Build: copy-build-system (prebuilt binary)
;;; License: GPL-3.0-or-later

(define-public quantumlauncher-bin
  (package
    (name "quantumlauncher-bin")
    (version "0.5.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Mrmayman/quantumlauncher/releases/download/v"
                    version "/quantum_launcher"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("quantum_launcher" "bin/quantum-launcher"))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (copy-file source "quantum_launcher")
                   (chmod "quantum_launcher" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple, powerful Minecraft launcher")
    (description "QuantumLauncher is a Minecraft launcher that provides a clean
interface for managing and launching Minecraft instances.  It supports multiple
versions and mod management.")
    (home-page "https://github.com/Mrmayman/quantumlauncher")
    (license license:gpl3+)))

;;; ---- 8. flclashx-bin ----
;;; Prebuilt multi-platform proxy client based on ClashMeta.
;;; Upstream: https://github.com/pluralplay/FlClashX
;;; Build: copy-build-system (prebuilt binary from .deb)
;;; License: GPL-3.0

(define-public flclashx-bin
  (package
    (name "flclashx-bin")
    (version "0.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pluralplay/FlClashX/releases/download/v"
                    version "/FlClashX-" version "-linux-amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform proxy client based on ClashMeta")
    (description "FlClashX is a fork of FlClash, a multi-platform proxy client
based on ClashMeta.  It provides a simple and easy-to-use interface for
managing proxy configurations.")
    (home-page "https://github.com/pluralplay/FlClashX")
    (license license:gpl3)))

;;; ---- 9. webos-dev-manager-bin ----
;;; Prebuilt webOS TV device manager.
;;; Upstream: https://github.com/webosbrew/dev-manager-desktop
;;; Build: copy-build-system (prebuilt AppImage/binary)
;;; License: Apache-2.0

(define-public webos-dev-manager-bin
  (package
    (name "webos-dev-manager-bin")
    (version "1.99.18")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/webosbrew/dev-manager-desktop/releases/download/v"
                    version "/dev-manager-desktop_" version "_amd64.deb"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "device and DevMode manager for webOS TV")
    (description "WebOS Dev Manager is a desktop application for managing webOS
TV devices.  It provides DevMode management, app installation, and device
configuration capabilities.")
    (home-page "https://github.com/webosbrew/dev-manager-desktop")
    (license license:asl2.0)))

;;; ---- 10. limine-booster ----
;;; Zero-config automation for Limine boot entries with Booster initrd.
;;; Upstream: https://github.com/abshka/limine-booster
;;; Build: copy-build-system (shell scripts)
;;; License: GPL-3.0

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
    (arguments
     (list #:install-plan
           #~'(("limine-booster" "bin/limine-booster"))))
    (inputs (list bash))
    (supported-systems '("x86_64-linux"))
    (synopsis "zero-config automation for Limine boot entries")
    (description "Limine-booster provides zero-configuration automation for
managing Limine bootloader entries with Booster initrd.  It automates the
creation and updating of boot entries.")
    (home-page "https://github.com/abshka/limine-booster")
    (license license:gpl3)))

;;; ---- 11. dela ----
;;; Task runner that delegates work to other tools.
;;; Upstream: https://github.com/aleyan/dela
;;; Build: cargo-build-system
;;; License: MIT

(define-public dela
  (package
    (name "dela")
    (version "0.0.6")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/aleyan/dela")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "task runner that delegates to other tools")
    (description "Dela is a task runner that delegates the actual work to other
tools.  It provides a unified interface for running tasks defined in various
configuration formats.")
    (home-page "https://github.com/aleyan/dela")
    (license license:expat)))

;;; ---- 12. dpibreak ----
;;; Fast DPI circumvention tool written in Rust.
;;; Upstream: https://github.com/dilluti0n/dpibreak
;;; Build: cargo-build-system
;;; License: GPL-3.0-or-later

(define-public dpibreak
  (package
    (name "dpibreak")
    (version "0.1.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/dilluti0n/dpibreak")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast DPI circumvention tool")
    (description "Dpibreak is a fast and easy-to-use DPI (Deep Packet
Inspection) circumvention tool written in Rust.  It helps bypass network
filtering and censorship.")
    (home-page "https://github.com/dilluti0n/dpibreak")
    (license license:gpl3+)))

;;; ---- 13. harbor-wave ----
;;; DigitalOcean ephemeral VM/Droplet management tool.
;;; Upstream: https://github.com/NetworkJack2/harbor-wave
;;; Build: go-build-system
;;; License: GPL-3.0

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
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:import-path "github.com/NetworkJack2/harbor-wave"))
    (supported-systems '("x86_64-linux"))
    (synopsis "DigitalOcean ephemeral VM management tool")
    (description "Harbor Wave is a tool for managing ephemeral virtual machines
and droplets on DigitalOcean.  It simplifies the creation and teardown of
temporary cloud instances.")
    (home-page "https://github.com/NetworkJack2/harbor-wave")
    (license license:gpl3)))

;;; ---- 14. livekit ----
;;; Real-time video, audio, and data server.
;;; Upstream: https://github.com/livekit/livekit
;;; Build: go-build-system
;;; License: Apache-2.0

(define-public livekit
  (package
    (name "livekit")
    (version "1.10.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/livekit/livekit")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system go-build-system)
    (arguments
     (list #:tests? #f
           #:install-source? #f
           #:import-path "github.com/livekit/livekit"))
    (supported-systems '("x86_64-linux"))
    (synopsis "real-time video, audio, and data server")
    (description "LiveKit is an open-source real-time communication server that
provides WebRTC-based video, audio, and data capabilities.  It enables
developers to build real-time applications with low latency.")
    (home-page "https://livekit.io/")
    (license license:asl2.0)))

;;; ---- 15. buf-git ----
;;; Protocol Buffers tooling for API development.
;;; Upstream: https://github.com/bufbuild/buf
;;; Build: go-build-system
;;; License: Apache-2.0

(define-public buf-git
  (let ((commit "5401b58ca")
        (revision "1"))
    (package
      (name "buf-git")
      (version (git-version "1.9.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/bufbuild/buf")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system go-build-system)
      (arguments
       (list #:tests? #f
             #:install-source? #f
             #:import-path "github.com/bufbuild/buf"))
      (supported-systems '("x86_64-linux"))
      (synopsis "Protocol Buffers tooling for modern API development")
      (description "Buf is a tool for working with Protocol Buffers.  It
provides linting, breaking change detection, generation, and a registry for
managing Protobuf schemas.")
      (home-page "https://buf.build")
      (license license:asl2.0))))

;;; ---- 16. artificial-rage-git ----
;;; Sci-fi FPS game made with Raylib.
;;; Upstream: https://codeberg.org/akselmo/artificial-rage
;;; Build: cmake-build-system
;;; License: GPL-3.0-or-later

(define-public artificial-rage-git
  (let ((commit "7a9f73d")
        (revision "1"))
    (package
      (name "artificial-rage-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://codeberg.org/akselmo/artificial-rage")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system cmake-build-system)
      (arguments (list #:tests? #f))
      (inputs (list raylib mesa))
      (supported-systems '("x86_64-linux"))
      (synopsis "sci-fi first-person shooter game made with Raylib")
      (description "Artificial Rage is a sci-fi first-person shooter game built
with the Raylib game development library.  It features retro-inspired graphics
and fast-paced gameplay.")
      (home-page "https://codeberg.org/akselmo/artificial-rage")
      (license license:gpl3+))))

;;; ---- 17. luajit-sdl2-git ----
;;; Autogenerated LuaJIT FFI bindings for SDL2.
;;; Upstream: https://github.com/sonoro1234/luajit-sdl2
;;; Build: copy-build-system (Lua FFI bindings, no compilation needed)
;;; License: MIT

(define-public luajit-sdl2-git
  (let ((commit "33529d3")
        (revision "1"))
    (package
      (name "luajit-sdl2-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/sonoro1234/luajit-sdl2")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/lua/5.1/sdl2/"
                  #:include-regexp ("\\.lua$")))))
      (inputs (list luajit sdl2))
      (supported-systems '("x86_64-linux"))
      (synopsis "LuaJIT FFI bindings for SDL2")
      (description "Autogenerated LuaJIT FFI bindings for SDL2, providing access
to SDL2 functionality including threads, audio, and graphics from LuaJIT
scripts.")
      (home-page "https://github.com/sonoro1234/luajit-sdl2")
      (license license:expat))))

;;; ---- 18. luajit-sdl3-git ----
;;; Autogenerated LuaJIT FFI bindings for SDL3.
;;; Upstream: https://github.com/sonoro1234/luajit-sdl3
;;; Build: copy-build-system (Lua FFI bindings, no compilation needed)
;;; License: MIT

(define-public luajit-sdl3-git
  (let ((commit "9c0b802")
        (revision "1"))
    (package
      (name "luajit-sdl3-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/sonoro1234/luajit-sdl3")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("." "share/lua/5.1/sdl3/"
                  #:include-regexp ("\\.lua$")))))
      (inputs (list luajit sdl2))
      (supported-systems '("x86_64-linux"))
      (synopsis "LuaJIT FFI bindings for SDL3")
      (description "Autogenerated LuaJIT FFI bindings for SDL3, providing access
to SDL3 functionality including threads, audio, and graphics from LuaJIT
scripts.")
      (home-page "https://github.com/sonoro1234/luajit-sdl3")
      (license license:expat))))

;;; ---- 19. protonmail-bridge-free-nokeychain-git ----
;;; Proton Mail Bridge fork without keychain requirement.
;;; Upstream: https://github.com/mnixry/proton-bridge
;;; Build: go-build-system
;;; License: GPL-3.0

(define-public protonmail-bridge-free-nokeychain-git
  (package
    (name "protonmail-bridge-free-nokeychain-git")
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
           #:install-source? #f
           #:import-path "github.com/mnixry/proton-bridge"))
    (supported-systems '("x86_64-linux"))
    (synopsis "Proton Mail Bridge fork without keychain requirement")
    (description "A fork of Proton Mail Bridge that stores secrets in a file
instead of requiring a system keychain.  It provides IMAP and SMTP access to
Proton Mail accounts for use with standard email clients.")
    (home-page "https://github.com/mnixry/proton-bridge")
    (license license:gpl3)))

;;; ---- 20. framework-control-bin ----
;;; Prebuilt Framework Laptop control tool.
;;; Upstream: https://github.com/ozturkkl/framework-control
;;; Build: copy-build-system (prebuilt binary)
;;; License: MIT

(define-public framework-control-bin
  (package
    (name "framework-control-bin")
    (version "0.5.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ozturkkl/framework-control/releases/download/v"
                    version "/framework-control-service-x86_64.tar.gz"))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments (list #:tests? #f))
    (supported-systems '("x86_64-linux"))
    (synopsis "Framework Laptop control tool for fan, battery, and LEDs")
    (description "Framework Control provides management of Framework Laptop
hardware features including fan speed, battery charge limits, and LED
configuration.  This package provides prebuilt binaries.")
    (home-page "https://github.com/ozturkkl/framework-control")
    (license license:expat)))

;;; ---- 21. pam-exec-ssh-git ----
;;; PAM module to unlock SSH keys on login.
;;; Upstream: https://github.com/x70b1/pam_exec-ssh
;;; Build: copy-build-system (shell script)
;;; License: Unlicense

(define-public pam-exec-ssh-git
  (let ((commit "cc3b533")
        (revision "1"))
    (package
      (name "pam-exec-ssh-git")
      (version (git-version "0.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/x70b1/pam_exec-ssh")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32 "0000000000000000000000000000000000000000000000000000"))))
      (build-system copy-build-system)
      (arguments
       (list #:install-plan
             #~'(("pam_exec-ssh" "bin/pam_exec-ssh"))))
      (inputs (list bash))
      (supported-systems '("x86_64-linux"))
      (synopsis "unlock SSH keys on login using PAM")
      (description "pam_exec-ssh is a PAM module that automatically unlocks SSH
keys during the login process using the pam_exec mechanism.  It integrates with
ssh-agent to provide seamless key management.")
      (home-page "https://github.com/x70b1/pam_exec-ssh")
      (license license:unlicense))))
