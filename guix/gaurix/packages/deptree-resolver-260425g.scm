;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260425g
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (4): gearhead2, nemo-engrampa, playerctld-systemd-unit,
;;;                  locale-mul-zz
;;; Already resolved (0)
;;; Already in Guix (0)
;;; Remaining BLOCKED: 96 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260425g)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages pascal)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages cinnamon)
  #:use-module (gnu packages mate)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages music)
  #:use-module (gnu packages elf)
  #:export (gearhead2
            nemo-engrampa
            playerctld-systemd-unit
            locale-mul-zz))


;;; ---- 1. gearhead2 ----
;;; AUR: gearhead2 (#18?) -- Roguelike mecha RPG, sequel to GearHead.
;;; Free Pascal + SDL1.2. All deps in Guix.
;;; License: LGPL-2.1+

(define-public gearhead2
  (package
    (name "gearhead2")
    (version "0.701")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/jwvhewitt/gearhead-2/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "06xqvfr8vm8sgchnqxjg4kxc780lkwn6lk65nlf8jlna1xzmvn6j"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((sdl-dir (dirname
                               (search-input-file
                                inputs "lib/libSDL.so")))
                     (sdl-image-dir (dirname
                                    (search-input-file
                                     inputs "lib/libSDL_image.so")))
                     (sdl-ttf-dir (dirname
                                  (search-input-file
                                   inputs "lib/libSDL_ttf.so")))
                     (x11-dir (dirname
                               (search-input-file
                                inputs "lib/libX11.so")))
                     (glibc-dir (dirname
                                (search-input-file
                                 inputs "lib/libc.so")))
                     (sdl-inc (string-append
                               (dirname sdl-dir) "/include/SDL")))
                (invoke "fpc"
                        (string-append "-Fl" sdl-dir)
                        (string-append "-Fl" sdl-image-dir)
                        (string-append "-Fl" sdl-ttf-dir)
                        (string-append "-Fl" x11-dir)
                        (string-append "-Fl" glibc-dir)
                        (string-append "-Fi" sdl-inc)
                        "-O2"
                        "gearhead2.pas"))))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (share (string-append out "/share/gearhead2")))
                (install-file "gearhead2" bin)
                (for-each (lambda (dir)
                            (when (file-exists? dir)
                              (copy-recursively
                               dir (string-append share "/" dir))))
                          '("Image" "design" "gamedata" "doc")))))
          (add-after 'install 'fix-runpath
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/gearhead2"))
                     (sdl-dir (dirname
                               (search-input-file
                                inputs "lib/libSDL.so")))
                     (sdl-image-dir (dirname
                                    (search-input-file
                                     inputs "lib/libSDL_image.so")))
                     (sdl-ttf-dir (dirname
                                  (search-input-file
                                   inputs "lib/libSDL_ttf.so")))
                     (x11-dir (dirname
                               (search-input-file
                                inputs "lib/libX11.so")))
                     (glibc-dir (dirname
                                (search-input-file
                                 inputs "lib/libc.so"))))
                (invoke "patchelf" "--set-rpath"
                        (string-join (list sdl-dir sdl-image-dir
                                          sdl-ttf-dir x11-dir glibc-dir)
                                     ":")
                        bin)))))))
    (native-inputs (list fpc patchelf))
    (inputs (list sdl sdl-image sdl-ttf libx11))
    (supported-systems '("x86_64-linux" "i686-linux"))
    (synopsis "Roguelike mecha role-playing game")
    (description "GearHead 2 is a roguelike mecha role-playing game and the
sequel to GearHead: Arena.  Set in a science fiction universe, it features
tactical mecha combat, character development, and procedurally generated
missions.  Built with Free Pascal and SDL.")
    (home-page "http://www.gearheadrpg.com/")
    (license license:lgpl2.1+)))


;;; ---- 2. nemo-engrampa ----
;;; AUR: nemo-engrampa (#18?) -- Archive management plugin for Nemo using
;;; Engrampa (MATE's archive manager) instead of file-roller.
;;; Built from nemo-extensions monorepo, nemo-fileroller component renamed.
;;; License: GPL-2.0

(define-public nemo-engrampa
  (package
    (name "nemo-engrampa")
    (version "6.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/linuxmint/nemo-extensions"
                    "/archive/refs/tags/" version ".tar.gz"))
              (sha256
               (base32
                "0c5yqf2npx7v0fvf9wgw4nsr5b3iy931a5gxc2khpc3px88h0qdb"))))
    (build-system meson-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir-and-rename
            (lambda _
              (use-modules (ice-9 ftw) (ice-9 regex))
              ;; Remove top-level 'build' script that conflicts with
              ;; meson's '../build' output directory.
              (when (file-exists? "build")
                (delete-file "build"))
              (chdir "nemo-fileroller")
              (with-directory-excursion "src"
                (for-each
                 (lambda (file)
                   (let ((new-name (regexp-substitute/global
                                    #f "fileroller" file
                                    'pre "engrampa" 'post)))
                     (rename-file file new-name)))
                 (filter (lambda (f) (string-contains f "fileroller"))
                         (scandir "."
                                  (lambda (f)
                                    (not (member f '("." ".."))))))))
              (for-each
               (lambda (file)
                 (substitute* file
                   (("file[- ]?roller") "engrampa")
                   (("File[- ]?[rR]oller") "Engrampa")))
               (find-files "." "\\.(c|h|py|in|xml|desktop|build|gschema\\.xml)$"))
              ;; Override the extension install directory to use our
              ;; output prefix instead of nemo's store path.
              (substitute* "src/meson.build"
                (("install_dir: libnemo_extension_dir")
                 "install_dir: get_option('prefix') / get_option('libdir') / 'nemo' / 'extensions-3.0'")))))))
    (native-inputs (list pkg-config gettext-minimal))
    (inputs (list nemo engrampa glib gtk+))
    (synopsis "Archive management plugin for Nemo using Engrampa")
    (description "This package provides archive management integration for
the Nemo file manager using Engrampa (MATE's archive manager) as the
backend.  It allows creating, extracting, and managing archives directly
from the Nemo context menu.")
    (home-page "https://github.com/linuxmint/nemo-extensions")
    (license license:gpl2)))


;;; ---- 3. playerctld-systemd-unit ----
;;; AUR: playerctld-systemd-unit (#18838) -- Systemd user unit for playerctld.
;;; Simple .service file for the playerctl daemon.
;;; License: GPL-1.0+

(define-public playerctld-systemd-unit
  (package
    (name "playerctld-systemd-unit")
    (version "2")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out #$output)
                 (unit-dir (string-append out "/lib/systemd/user"))
                 (playerctl #$(this-package-input "playerctl")))
            (mkdir-p unit-dir)
            (call-with-output-file
                (string-append unit-dir "/playerctld.service")
              (lambda (port)
                (format port
                        "[Unit]~%Description=MPRIS media player daemon~%Documentation=man:playerctld(1)~%After=graphical-session.target~%~%[Service]~%Type=simple~%ExecStart=~a/bin/playerctld~%Restart=on-failure~%~%[Install]~%WantedBy=default.target~%"
                        playerctl)))))))
    (inputs (list playerctl))
    (synopsis "Systemd user unit for playerctld")
    (description "This package provides a systemd user service unit for
@code{playerctld}, the MPRIS media player tracking daemon from the
playerctl project.  It enables automatic startup of playerctld as a
user service on systems using systemd.")
    (home-page "https://github.com/altdesktop/playerctl")
    (license license:gpl1+)))


;;; ---- 4. locale-mul-zz ----
;;; AUR: locale-mul_zz (#18423) -- Custom locale definitions following
;;; UTC, UTF-8, and ISO 8601 conventions.
;;; License: AGPL-3.0+

(define-public locale-mul-zz
  (package
    (name "locale-mul-zz")
    (version "2.0-rc3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/0h7z/locale/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "168cmnwp5racf8gd0cnpjqm09scqrc3xvd15pyanwnpii564l1z5"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("usr/share/i18n/locales/en_ZZ"
           "share/i18n/locales/en_ZZ")
          ("usr/share/i18n/locales/zh_ZZ"
           "share/i18n/locales/zh_ZZ"))))
    (synopsis "Custom locales following UTC, UTF-8, and ISO 8601")
    (description "This package provides custom locale definitions
(@code{en_ZZ} and @code{zh_ZZ}) that follow UTC for timezone, UTF-8 for
character encoding, and ISO 8601 for date and time formatting.  These
synthetic locales are useful for environments that prefer standardized,
locale-independent formatting.")
    (home-page "https://github.com/0h7z/locale")
    (license license:agpl3+)))
