;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428b
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 resolved (open-tv) + 0 deps packaged.
;;; 99 remain BLOCKED.
;;; Generated: 2026-04-28
;;;
;;; Key finding: open-tv can be resolved as a binary package from GitHub
;;; .deb release.  All other 99 packages fall into genuinely intractable
;;; categories documented in deptree-resolver-260428b-blocked-notes.scm.

(define-module (gaurix packages deptree-resolver-260428b)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg)
  #:export (open-tv))

;;; ============================================================
;;; open-tv — Fast & simple IPTV app (Tauri/WebKitGTK)
;;; ============================================================
;;; Prior status: BLOCKED due to Tauri build infrastructure (npm + Rust +
;;; webkit2gtk build chain).
;;; Resolution: Binary package from upstream .deb release.  The upstream
;;; project provides pre-built .deb files on GitHub Releases.  The binary
;;; is a native Tauri app linked against webkit2gtk-4.1, gtk3, glib, and
;;; openssl.  Runtime requires ffmpeg, mpv, and yt-dlp in PATH.

(define-public open-tv
  (package
    (name "open-tv")
    (version "1.9.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Fredolx/open-tv/releases/download/v"
                    version "/Fred.TV_" version "_amd64.deb"))
              (sha256
               (base32
                "0qijfrkffyxj4dikw3x0dq001jgqisahkdikfmprsa5jv7wbr1ya"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan #~'()
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; The source is a .deb (ar archive).  Extract data.tar.gz.
              (invoke "ar" "x" source)
              (invoke "tar" "xzf" "data.tar.gz")))
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share"))
                     (apps (string-append share "/applications"))
                     (icons (string-append share "/icons")))
                ;; Install binary
                (install-file "usr/bin/open_tv" bin)
                ;; Install desktop file
                (mkdir-p apps)
                (copy-file "usr/share/applications/Fred TV.desktop"
                           (string-append apps "/open-tv.desktop"))
                ;; Install icons
                (for-each
                 (lambda (size)
                   (let ((src (string-append "usr/share/icons/hicolor/"
                                             size "/apps/open_tv.png"))
                         (dst-dir (string-append icons "/hicolor/"
                                                 size "/apps")))
                     (when (file-exists? src)
                       (mkdir-p dst-dir)
                       (copy-file src (string-append dst-dir "/open_tv.png")))))
                 '("32x32" "128x128" "256x256@2")))))
          (add-after 'install 'patch-binary
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/open_tv"))
                     (libc (assoc-ref inputs "libc"))
                     (gcc-lib (assoc-ref inputs "gcc:lib"))
                     (ld-so (string-append libc "/lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (string-append libc "/lib")
                                   (string-append gcc-lib "/lib")
                                   (string-append (assoc-ref inputs "openssl")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "webkitgtk")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "gtk+")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "glib")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "gdk-pixbuf")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "cairo")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "pango")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "libsoup")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "zlib")
                                                  "/lib")
                                   (string-append (assoc-ref inputs "zstd")
                                                  "/lib"))
                             ":")))
                (invoke "patchelf" "--set-interpreter" ld-so bin)
                (invoke "patchelf" "--set-rpath" rpath bin))))
          (add-after 'patch-binary 'wrap-binary
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/open_tv"))
                     (path-dirs
                      (list (string-append (assoc-ref inputs "ffmpeg")
                                           "/bin")
                            (string-append (assoc-ref inputs "mpv")
                                           "/bin")
                            (string-append (assoc-ref inputs "yt-dlp")
                                           "/bin"))))
                (wrap-program bin
                  `("PATH" ":" prefix ,path-dirs)
                  `("WEBKIT_DISABLE_DMABUF_RENDERER" = ("1")))))))))
    (native-inputs
     (list patchelf
           (@ (gnu packages base) binutils)))  ;; for 'ar'
    (inputs
     (list (list gcc "lib")
           glibc
           openssl
           webkitgtk
           gtk+
           glib
           gdk-pixbuf
           cairo
           pango
           (@ (gnu packages gnome) libsoup)
           zlib
           (@ (gnu packages compression) zstd)
           ffmpeg
           mpv
           (@ (gnu packages video) yt-dlp)))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast and simple IPTV application")
    (description
     "Open TV (Fred TV) is a fast and simple IPTV application built with
Tauri and WebKitGTK.  It supports M3U playlists, EPG guides, and multiple
video backends including MPV and FFmpeg.  Features include channel
favorites, search, and streaming via yt-dlp.")
    (home-page "https://github.com/Fredolx/open-tv")
    (license license:gpl2)))
