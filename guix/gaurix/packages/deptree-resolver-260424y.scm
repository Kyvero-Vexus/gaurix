;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dep-tree resolver pass --- deptree-resolver-260424y
;;; Resolves 100 BLOCKED packages via dependency-tree priority.
;;;
;;; New recipes (5): wooting-udev, lamzu-maya-x-udev, udiskie-systemd,
;;;   neoforge-server, pixelflasher
;;; AUR repo deleted: 19 (celeste64, clspv-git, codeblocks-svn,
;;;   feather-music-git, ffmpeg-full-git, kodi-addon-pvr-hts,
;;;   realesrgan-ncnn-vulkan, shadps4-git, thunderbird-globalmenu,
;;;   smuxi-server, systemd-ukify-git, huawei-me936-udev, elp,
;;;   libga68-snapshot, libgfortran-snapshot, libgnat-snapshot,
;;;   libgo-snapshot, dotnet-runtime-5.0-bin, dotnet-runtime-6.0-bin)
;;; Remaining BLOCKED: 76 packages (see blocked-notes)

(define-module (gaurix packages deptree-resolver-260424y)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages java)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:export (wooting-udev
            lamzu-maya-x-udev
            udiskie-systemd
            neoforge-server
            pixelflasher))


;;; ---- 1. wooting-udev ----
;;; AUR #20313 -- udev rules for Wooting keyboards.
;;; Source: Inline udev rules (no upstream tarball).
;;; License: GPL-3.0+

(define-public wooting-udev
  (package
    (name "wooting-udev")
    (version "1.0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((rules-dir (string-append #$output "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (call-with-output-file
                (string-append rules-dir "/70-wooting.rules")
              (lambda (port)
                (display
                 (string-append
                  "# Wooting One Legacy\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"ff01\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"ff01\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "# Wooting One update mode\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"2402\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "\n"
                  "# Wooting Two Legacy\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"ff02\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"ff02\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "# Wooting Two update mode\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"03eb\", "
                  "ATTRS{idProduct}==\"2403\", MODE:=\"0660\", "
                  "GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "\n"
                  "# Generic Wootings\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"31e3\", "
                  "MODE:=\"0660\", GROUP=\"input\", TAG+=\"uaccess\"\n"
                  "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"31e3\", "
                  "MODE:=\"0660\", GROUP=\"input\", TAG+=\"uaccess\"\n")
                 port)))))))
    (home-page "https://wooting.io")
    (synopsis "udev rules for Wooting keyboards")
    (description "This package provides udev rules that grant user access
to Wooting analog mechanical keyboards.  It supports Wooting One, Wooting
Two, and all newer Wooting keyboard models via vendor ID matching.")
    (license license:gpl3+)))


;;; ---- 2. lamzu-maya-x-udev ----
;;; AUR #20334 -- udev rules for Lamzu Maya X Gaming Mouse.
;;; Source: Inline udev rules (no upstream tarball).
;;; License: GPL-3.0+

(define-public lamzu-maya-x-udev
  (package
    (name "lamzu-maya-x-udev")
    (version "1.0.1")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((rules-dir (string-append #$output "/lib/udev/rules.d")))
            (mkdir-p rules-dir)
            (call-with-output-file
                (string-append rules-dir "/70-lamzu-maya-x.rules")
              (lambda (port)
                (display
                 (string-append
                  "# Lamzu Maya X\n"
                  "SUBSYSTEM==\"hidraw\", ATTRS{idVendor}==\"373e\", "
                  "MODE=\"0660\", TAG+=\"uaccess\"\n"
                  "SUBSYSTEMS==\"usb*\", ATTRS{idVendor}==\"373e\", "
                  "MODE=\"0660\", TAG+=\"uaccess\"\n")
                 port)))))))
    (home-page "https://lamzu.gg")
    (synopsis "udev rules for Lamzu Maya X gaming mouse")
    (description "This package provides udev rules that grant user access
to the Lamzu Maya X gaming mouse over USB and HID interfaces.")
    (license license:gpl3+)))


;;; ---- 3. udiskie-systemd ----
;;; AUR #18159 -- User systemd service for udiskie auto-mounting.
;;; Source: GitHub git repository.
;;; License: Public domain (simple service file).
;;; Hash verified via guix hash.

(define-public udiskie-systemd
  (package
    (name "udiskie-systemd")
    (version "0.0.1-1.7e71ca2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/hrehfeld/udiskie-systemd")
                    (commit "7e71ca225d132f786d160a6b65059924e67f0df8")))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "05s55p507qsik9fiypw0gznjih7ivk00flfcvb1m8gfxd84gfcgx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("udiskie.service"
           "lib/systemd/user/udiskie.service"))))
    (home-page "https://github.com/hrehfeld/udiskie-systemd")
    (synopsis "Systemd user service for udiskie auto-mounting")
    (description "This package provides a systemd user service unit for
udiskie, an automatic disk mounting daemon.  It allows udiskie to start
automatically as part of the user session via systemd.")
    (license license:public-domain)))


;;; ---- 4. neoforge-server ----
;;; AUR #18119 -- Minecraft NeoForge modded server.
;;; Source: Maven release (installer jar).
;;; License: LGPL-2.1-or-later
;;; Hash verified via guix download.

(define-public neoforge-server
  (package
    (name "neoforge-server")
    (version "21.1.172")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://maven.neoforged.net/releases/net/neoforged/"
                    "neoforge/" version "/neoforge-" version
                    "-installer.jar"))
              (file-name (string-append name "-" version "-installer.jar"))
              (sha256
               (base32
                "155qkrar9yhp58v7h5cigjfiq8091mjpw6j1wn6547f2zy4r7l9z"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "neoforge-installer.jar")))
          (delete 'install-license-files)
          (replace 'install
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (share (string-append out "/share/neoforge-server"))
                     (bin (string-append out "/bin"))
                     (java (search-input-file inputs "bin/java")))
                (mkdir-p share)
                (copy-file "neoforge-installer.jar"
                           (string-append share "/neoforge-installer.jar"))
                (mkdir-p bin)
                (call-with-output-file
                    (string-append bin "/neoforge-server-install")
                  (lambda (port)
                    (format port "#!~a~%exec ~a -jar ~a --installServer \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            java
                            (string-append share
                                           "/neoforge-installer.jar"))))
                (chmod (string-append bin "/neoforge-server-install")
                       #o755)))))))
    (inputs (list bash-minimal
                  (list openjdk21 "jdk")))
    (home-page "https://neoforged.net")
    (synopsis "NeoForge modding API server for Minecraft")
    (description "NeoForge is a modding API for Minecraft based on Forge.
This package provides the NeoForge server installer.  Run
@command{neoforge-server-install} in an empty directory to set up a modded
Minecraft server for version 1.21.1.")
    (license license:lgpl2.1+)))


;;; ---- 5. pixelflasher ----
;;; AUR #18221 -- Pixel phone flashing GUI utility.
;;; Source: GitHub release tarball.
;;; License: GPL-3.0-or-later
;;; Hash verified via guix download.

(define-public pixelflasher
  (package
    (name "pixelflasher")
    (version "9.0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/badabing2005/PixelFlasher"
                    "/archive/refs/tags/v" version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "0jf0qimn76w9468nn6z1kl7i8l2vprlvilp3shgvc6vfh5k2zs5r"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/pixelflasher/"
           #:include-regexp (".*\\.py$" ".*\\.json$" ".*\\.pem$"
                             ".*\\.crt$")
           #:exclude ("build-on-" "compile_po"))
          ("images/" "share/pixelflasher/images/")
          ("bin/" "share/pixelflasher/bin/"
           #:exclude ("7z.dll" "7z.exe")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'create-wrapper
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/pixelflasher"))
                     (python (search-input-file inputs "bin/python3")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/pixelflasher")
                  (lambda (port)
                    (format port "#!~a~%exec ~a ~a/PixelFlasher.py \"$@\"~%"
                            (search-input-file inputs "bin/bash")
                            python app)))
                (chmod (string-append bin "/pixelflasher") #o755))))
          (add-after 'install 'install-icons
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (src (string-append out "/share/pixelflasher/images")))
                (for-each
                 (lambda (size)
                   (let ((dest (string-append
                                out "/share/icons/hicolor/"
                                size "x" size "/apps")))
                     (mkdir-p dest)
                     (when (file-exists?
                            (string-append src "/icon-dark-" size ".png"))
                       (copy-file
                        (string-append src "/icon-dark-" size ".png")
                        (string-append dest "/pixelflasher.png")))))
                 '("64" "128" "256"))))))))
    (inputs (list bash-minimal
                  python))
    (propagated-inputs
     (list python-beautifulsoup4
           python-bsdiff4
           python-chardet
           python-cryptography
           python-darkdetect
           python-json5
           python-lz4
           python-markdown
           python-packaging
           python-platformdirs
           python-polib
           python-protobuf
           python-psutil
           python-pyperclip
           python-requests
           python-rsa
           python-wxpython))
    (home-page "https://github.com/badabing2005/PixelFlasher")
    (synopsis "GUI utility for flashing Google Pixel phones")
    (description "PixelFlasher is a graphical utility for flashing Google
Pixel phones.  It supports bootloader unlocking, firmware flashing, rooting,
and managing Android device images with a user-friendly interface.")
    (license license:gpl3+)))
