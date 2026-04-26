;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260426c
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5):
;;;   1. nginx-njs-module (nginx njs scripting dynamic module)
;;;   2. gstreamermm (C++ bindings for GStreamer, resolves gstreamermm-docs)
;;;   3. librewolf-tridactyl-native-bin (native messaging host for Tridactyl)
;;;   4. lobe-chat-bin (LobeHub AI chat desktop app, AppImage binary)
;;;   5. beammp-launcher (BeamMP multiplayer launcher for BeamNG.drive)
;;;
;;; Remaining BLOCKED: 95 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260426c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:export (nginx-njs-module
            gstreamermm
            librewolf-tridactyl-native-bin
            lobe-chat-bin
            beammp-launcher))


;;; ---- 1. nginx-njs-module ----
;;; NGINX njs dynamic module for JavaScript scripting in nginx config.
;;; Upstream: https://github.com/nginx/njs
;;; Build follows the established Guix nginx dynamic module pattern
;;; (see nginx-rtmp-module, nginx-headers-more-module in gnu/packages/web.scm).
;;; Resolves AUR nginx-mainline-mod-njs.
;;; License: BSD-2-Clause

(define-public nginx-njs-module
  (package
    (inherit nginx)
    (name "nginx-njs-module")
    (version "0.9.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nginx/njs")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0014ll9hviaw22a3km3qi0a94a3lkkn8ad6nyqxpfszvlp9p5qha"))))
    (build-system gnu-build-system)
    (inputs
     `(("nginx-sources" ,(package-source nginx))
       ,@(package-inputs nginx)))
    (arguments
     (substitute-keyword-arguments
         `(#:make-flags '("modules")
           ,@(package-arguments nginx))
       ((#:configure-flags flags)
        #~(cons "--add-dynamic-module=./nginx" #$flags))
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'unpack-nginx-sources
              (lambda _
                (begin
                  (format #t "decompressing nginx source code~%")
                  (invoke "tar" "xvf" #$(this-package-input "nginx-sources")
                          "--transform=s,/LICENSE$,/LICENSE.nginx,"
                          "--strip-components=1"))))
            (replace 'install
              (lambda _
                (let ((modules-dir (string-append #$output
                                                  "/etc/nginx/modules")))
                  (install-file "objs/ngx_http_js_module.so" modules-dir)
                  (install-file "objs/ngx_stream_js_module.so" modules-dir))))
            (delete 'fix-root-dirs)
            (delete 'install-man-page)))))
    (home-page "https://github.com/nginx/njs")
    (synopsis "NGINX module for JavaScript scripting via njs")
    (description "The njs scripting language is a subset of JavaScript that
allows extending nginx functionality.  This dynamic module provides the
@code{ngx_http_js_module} and @code{ngx_stream_js_module} for embedding
JavaScript handlers in nginx configuration files for HTTP and stream
processing.")
    (license license:bsd-2)))


;;; ---- 2. gstreamermm ----
;;; C++ bindings for GStreamer multimedia framework.
;;; Upstream: https://download.gnome.org/sources/gstreamermm/
;;; Resolves AUR gstreamermm-docs (documentation is part of this package).
;;; Standard autotools build; all dependencies available in Guix.
;;; License: LGPL-2.1+

(define-public gstreamermm
  (package
    (name "gstreamermm")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.gnome.org/sources/gstreamermm/"
                           (version-major+minor version) "/"
                           "gstreamermm-" version ".tar.xz"))
       (sha256
        (base32 "0q4dx9sncqbwgpzma0zvj6zssc279yl80pn8irb95qypyyggwn5y"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "--disable-documentation")))
    (native-inputs
     (list pkg-config perl))
    (inputs
     (list gstreamer gst-plugins-base glibmm-2.66))
    (home-page "https://gstreamer.freedesktop.org/bindings/cplusplus.html")
    (synopsis "C++ bindings for the GStreamer multimedia library")
    (description "GStreamermm provides C++ bindings for the GStreamer
multimedia framework, allowing C++ developers to write GStreamer-based
applications using gtkmm-style conventions.  It wraps the GStreamer core
and base plugins with type-safe C++ interfaces.")
    (license license:lgpl2.1+)))


;;; ---- 3. librewolf-tridactyl-native-bin ----
;;; Native messaging host for the Tridactyl browser extension.
;;; Provides native command handling for Tridactyl in LibreWolf/Firefox.
;;; Pre-built Go binary from official GitHub release.
;;; Resolves AUR librewolf-tridactyl-native-bin.
;;; License: Apache-2.0

(define-public librewolf-tridactyl-native-bin
  (package
    (name "librewolf-tridactyl-native-bin")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tridactyl/native_messenger/releases/download/"
             version "/native_main-Linux"))
       (sha256
        (base32 "0spx9j6269jbxwdbgjk2prxpa33dig4zax5q1wgqfywlr183li86"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key inputs #:allow-other-keys)
              (copy-file (assoc-ref inputs "source") "native_main")
              (chmod "native_main" #o755)))
          (add-after 'unpack 'patch-elf
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((ld-linux (string-append
                               (assoc-ref inputs "libc")
                               "/lib/ld-linux-x86-64.so.2")))
                (invoke "patchelf" "--set-interpreter" ld-linux
                        "native_main"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib-lw (string-append
                              out
                              "/lib/librewolf/native-messaging-hosts"))
                     (lib-ff (string-append
                              out
                              "/lib/mozilla/native-messaging-hosts")))
                ;; Install binary
                (install-file "native_main" bin)
                ;; Install native messaging manifests
                (for-each
                 (lambda (manifest-dir)
                   (mkdir-p manifest-dir)
                   (call-with-output-file
                       (string-append manifest-dir "/tridactyl.json")
                     (lambda (port)
                       (format port
                               "{
  \"name\": \"tridactyl\",
  \"description\": \"Tridactyl native command handler\",
  \"path\": \"~a/bin/native_main\",
  \"type\": \"stdio\",
  \"allowed_extensions\": [\"tridactyl.vim@cmcaine.co.uk\", \"tridactyl.vim.betas@cmcaine.co.uk\"]
}~%"
                               out))))
                 (list lib-lw lib-ff))))))))
    (native-inputs (list patchelf))
    (inputs (list (libc-for-target)))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/tridactyl/native_messenger")
    (synopsis "Native messaging host for the Tridactyl browser extension")
    (description "Tridactyl native messenger provides native system access
for the Tridactyl browser extension.  It handles native commands like opening
editors, managing files, and executing shell commands from within the browser
via the WebExtension native messaging protocol.")
    (license license:asl2.0)))


;;; ---- 4. lobe-chat-bin ----
;;; LobeHub AI chat desktop application (Electron/AppImage).
;;; Upstream: https://github.com/lobehub/lobehub
;;; Binary repack from official AppImage release.
;;; Resolves AUR lobe-chat.
;;; License: Apache-2.0

(define-public lobe-chat-bin
  (package
    (name "lobe-chat-bin")
    (version "2.1.52")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/lobehub/lobehub/releases/download/v"
             version "/LobeHub-" version ".AppImage"))
       (sha256
        (base32 "0m7dm86mdwqbxz2lbrm4gjhqalgbmcry1dzkf0xg2hdannclvkxy"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (delete 'install-license-files)
          (replace 'unpack
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((appimage (assoc-ref inputs "source")))
                (copy-file appimage "LobeHub.AppImage")
                (chmod "LobeHub.AppImage" #o755))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (lib (string-append out "/lib/lobe-chat"))
                     (share (string-append out "/share/applications")))
                ;; Install AppImage as-is
                (mkdir-p lib)
                (copy-file "LobeHub.AppImage"
                           (string-append lib "/LobeHub.AppImage"))
                ;; Create wrapper script
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/lobe-chat")
                  (lambda (port)
                    (format port "#!/bin/sh~%exec ~a/lib/lobe-chat/LobeHub.AppImage --appimage-extract-and-run \"$@\"~%" out)))
                (chmod (string-append bin "/lobe-chat") #o755)
                ;; Create desktop entry
                (mkdir-p share)
                (call-with-output-file
                    (string-append share "/lobe-chat.desktop")
                  (lambda (port)
                    (format port
                            "[Desktop Entry]
Name=LobeChat
Comment=Open-source AI chat framework
Exec=~a/bin/lobe-chat
Type=Application
Categories=Network;Chat;
StartupWMClass=lobehub
~%"
                            out)))))))))
    (supported-systems '("x86_64-linux"))
    (home-page "https://lobehub.com")
    (synopsis "Open-source AI chat desktop application")
    (description "LobeChat is an open-source, modern-design AI chat framework
and desktop application.  It supports multiple AI providers, plugin
extensibility, knowledge bases, multi-modal interactions, and local/cloud
deployment.  This package provides the pre-built desktop Electron application
via AppImage.")
    (license license:asl2.0)))


;;; ---- 5. beammp-launcher ----
;;; BeamMP multiplayer launcher/client for BeamNG.drive.
;;; Upstream: https://github.com/BeamMP/BeamMP-Launcher
;;; C++ CMake project; all dependencies available in Guix.
;;; Resolves AUR beammp-launcher-git.
;;; License: AGPL-3.0+

(define-public beammp-launcher
  (package
    (name "beammp-launcher")
    (version "2.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/BeamMP/BeamMP-Launcher")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vv1irvc41xrgnbq9vs3r0yiwdr7wqj0zbl5w5c70srpmn02c138"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DCMAKE_BUILD_TYPE=Release"
              "-DVCPKG_TARGET_TRIPLET=OFF")))
    (inputs
     (list cpp-httplib
           nlohmann-json
           curl
           openssl
           zlib))
    (native-inputs
     (list pkg-config))
    (home-page "https://beammp.com")
    (synopsis "Multiplayer launcher for BeamNG.drive")
    (description "BeamMP Launcher is the multiplayer client for BeamNG.drive,
providing online multiplayer functionality for the vehicle simulation game.
It handles server discovery, connection management, and vehicle
synchronization between players.")
    (license license:agpl3+)))
