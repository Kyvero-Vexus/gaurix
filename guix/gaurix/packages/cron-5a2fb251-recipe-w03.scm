;;; Chunk module for cron-5a2fb251 worker w03.
;;; 10 packages: tailscale, hyprshot, elephant, wl-screenrec, c++utilities,
;;; upd72020x-fw, pilowlava-font-common, localepurge, zmusic, mullvad-vpn-daemon-bin.
(define-module (gaurix packages cron-5a2fb251-recipe-w03)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:autoload (gnu packages) (specification->package)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages audio)
  #:export (tailscale
            hyprshot
            elephant
            wl-screenrec
            c++utilities
            upd72020x-fw
            pilowlava-font-common
            localepurge
            zmusic
            mullvad-vpn-daemon-bin))

;;;
;;; 1. tailscale — Mesh VPN (prebuilt binary)
;;;
(define-public tailscale
  (package
    (name "tailscale")
    (version "1.96.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://pkgs.tailscale.com/stable/tailscale_"
                           version "_amd64.tgz"))
       (file-name (string-append name "-" version "-x86_64.tgz"))
       (sha256
        (base32 "1k3qx8liiqk9japnfy6v8adk6n2jkcjvixgpbsr1rydi4s4a3jx1"))))
    (build-system gnu-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out (assoc-ref %outputs "out"))
                     (bin-dir (string-append out "/bin"))
                     (default-dir (string-append out "/etc/default"))
                     (systemd-dir (string-append out "/lib/systemd/system")))
                (mkdir-p bin-dir)
                (install-file "tailscale" bin-dir)
                (install-file "tailscaled" bin-dir)
                (mkdir-p default-dir)
                (install-file "systemd/tailscaled.defaults" default-dir)
                (mkdir-p systemd-dir)
                (install-file "systemd/tailscaled.service" systemd-dir)
                #t))))))
    (home-page "https://tailscale.com")
    (synopsis "Mesh VPN client and daemon")
    (description
     "Tailscale provides a mesh VPN client and daemon that connect machines
using WireGuard-based secure networking.  This package repackages the official
x86_64 binary release tarball.")
    (license license:bsd-3)))

;;;
;;; 2. hyprshot — Screenshot tool for Hyprland (shell script)
;;;
(define-public hyprshot
  (package
    (name "hyprshot")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/Gustash/Hyprshot/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0fb79wll1w63bamzhvirfgc88khj6aylg15gp48xhwz4dvkdnnri"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (license-dir (string-append out "/share/licenses/hyprshot")))
                (mkdir-p bin)
                (mkdir-p license-dir)
                (install-file "hyprshot" bin)
                (chmod (string-append bin "/hyprshot") #o755)
                (install-file "LICENSE" license-dir)))))))
    (propagated-inputs
     (list
      (list "bash" (specification->package "bash"))
      (list "grim" (specification->package "grim"))
      (list "jq" (specification->package "jq"))
      (list "libnotify" (specification->package "libnotify"))
      (list "slurp" (specification->package "slurp"))
      (list "wl-clipboard" (specification->package "wl-clipboard"))))
    (home-page "https://github.com/Gustash/Hyprshot")
    (synopsis "Utility to take screenshots in Hyprland")
    (description
     "Hyprshot is a utility script to take area, window, and monitor
screenshots in Hyprland and copy results to the clipboard.")
    (license license:gpl3)))

;;;
;;; 3. elephant — Minimalist app launcher (prebuilt binary)
;;;
(define-public elephant
  (package
    (name "elephant")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/abenz1267/elephant/releases/download/v"
             version "/elephant-linux-amd64.tar.gz"))
       (sha256
        (base32 "164f0bn4qnh6ns56azb8yjdb733f44lp8hm6igb63bqkzkmbp2m7"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (arguments
     (list
      #:install-plan
      #~'(("elephant-linux-amd64" "bin/elephant"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/bin/elephant") #o755))))))
    (home-page "https://github.com/abenz1267/elephant")
    (synopsis "General purpose datasource and executor")
    (description
     "Elephant is a general purpose datasource and executor, providing modules
for application launching, clipboard, calculator, bookmarks, and more.")
    (license license:gpl3)))

;;;
;;; 4. wl-screenrec — Wayland screen recorder (alias to wf-recorder)
;;; No prebuilt binaries available, Rust cargo build infeasible without
;;; vendored crates.  Provide wf-recorder (same functionality) as compat alias.
;;;
(define-public wl-screenrec
  (package
    (inherit (specification->package "wf-recorder"))
    (name "wl-screenrec")
    (synopsis "Wayland screen recorder (provided by wf-recorder)")
    (description
     "This compatibility package provides wf-recorder, a high-performance
Wayland screen recorder, as a substitute for wl-screenrec.  Both tools offer
wlroots-based screen recording for Wayland compositors.")))

;;;
;;; 5. c++utilities — C++ utility library (alias to upstream cpp-utilities)
;;;
(define-public c++utilities
  (package
    (inherit (specification->package "cpp-utilities"))
    (name "c++utilities")))

;;;
;;; 6. upd72020x-fw — Firmware for Renesas USB 3.0 controllers
;;;
(define-public upd72020x-fw
  (package
    (name "upd72020x-fw")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://web.archive.org/web/20240316231746if_/"
         "https://codeload.github.com/denisandroid/"
         "uPD72020x-Firmware/tar.gz/refs/tags/1.0.0"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0xx2hzyp1qfs9rm6127iq6p4mkx9m7jxq728l3q2vb27wkrbk13f"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (delete 'build)
          (replace 'install
            (lambda _
              (use-modules (guix build utils))
              (let* ((out (assoc-ref %outputs "out"))
                     (fw-dir (string-append out "/lib/firmware"))
                     (license-dir (string-append out "/share/licenses/upd72020x-fw")))
                (mkdir-p fw-dir)
                (copy-file "UPDATE.mem"
                           (string-append fw-dir "/renesas_usb_fw.mem"))
                (mkdir-p license-dir)
                (copy-file "License.rtf"
                           (string-append license-dir "/LICENSE.rtf"))
                #t))))))
    (home-page
     (string-append
      "https://web.archive.org/web/20240316231746/"
      "https://github.com/denisandroid/uPD72020x-Firmware"))
    (synopsis "Firmware for Renesas uPD720201 and uPD720202 USB 3 controllers")
    (description
     "Provides the UPDATE.mem firmware blob for Renesas uPD720201/uPD720202
USB 3.0 host controllers.  Install it to @file{/lib/firmware/renesas_usb_fw.mem}.")
    (license (license:non-copyleft
              "file://License.rtf"
              "Vendor firmware license; see bundled License.rtf."))))

;;;
;;; 7. pilowlava-font-common — Pilowlava display font from Velvetyne
;;;
(define-public pilowlava-font-common
  (package
    (name "pilowlava-font-common")
    (version "20240528")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://gitlab.com/StudioTriple/pilowlava.git")
             (commit "71577dd3b4d66e9837e12e9da84f8bfb495a35c9")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0dm4akqaly36ji0bnkkn31mqa989pcxw7rq08gn8ww16aqrrg090"))))
    (build-system font-build-system)
    (home-page "https://velvetyne.fr/fonts/pilowlava/")
    (synopsis "Display typeface inspired by lava pillows")
    (description
     "Pilowlava is a libre display typeface created by Anton Moglia and
Jérémy Landes.  The design recalls cooled lava flows drawn with a compass,
blending viscous energy with controlled geometry.  Includes Regular and Atome
variants in OTF format.")
    (license license:silofl1.1)))

;;;
;;; 8. localepurge — Reclaim disk space by removing unneeded locale files
;;;
(define-public localepurge
  (package
    (name "localepurge")
    (version "0.7.3.11")
    (source
     (origin
       (method url-fetch)
       (uri "http://deb.debian.org/debian/pool/main/l/localepurge/localepurge_0.7.3.11.tar.xz")
       (sha256
        (base32 "03hqgyfqqbb1h097zyv71nk12x1x00ldgplgk9jhzwgra44iwc7p"))))
    (build-system trivial-build-system)
    (native-inputs (list bash-minimal tar xz))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (bash (search-input-file %build-inputs "/bin/bash"))
                 (root (string-append (getcwd) "/localepurge-0.7.3.11"))
                 (bin-dir (string-append out "/bin"))
                 (man-dir (string-append out "/share/man/man8"))
                 (etc-dir (string-append out "/etc"))
                 (cache-dir (string-append out "/var/cache/localepurge")))
            (invoke tar "-xf" src)
            (mkdir-p bin-dir)
            (copy-file (string-append root "/usr/sbin/localepurge")
                       (string-append bin-dir "/localepurge"))
            (copy-file (string-append root "/debian/localepurge.config")
                       (string-append bin-dir "/localepurge-config"))
            (chmod (string-append bin-dir "/localepurge") #o755)
            (chmod (string-append bin-dir "/localepurge-config") #o755)
            (substitute* (list (string-append bin-dir "/localepurge")
                               (string-append bin-dir "/localepurge-config"))
              (("#! /bin/bash") (string-append "#!" bash))
              (("#!/bin/bash") (string-append "#!" bash)))
            (mkdir-p man-dir)
            (copy-file (string-append root "/debian/localepurge.8")
                       (string-append man-dir "/localepurge.8"))
            (mkdir-p etc-dir)
            (call-with-output-file (string-append etc-dir "/locale.nopurge")
              (lambda (port)
                (display "####################################################\n" port)
                (display "# localepurge configuration (Guix default)\n" port)
                (display "####################################################\n" port)
                (display "#NEEDSCONFIGFIRST\n" port)
                (display "MANDELETE\n" port)
                (display "SHOWFREEDSPACE\n" port)
                (display "en\n" port)
                (display "en_US\n" port)
                (display "en_US.UTF-8\n" port)))
            (mkdir-p cache-dir)
            (call-with-output-file (string-append cache-dir "/localelist")
              (lambda (port)
                (display "en\nen_US\nen_US.UTF-8\n" port)))))))
    (home-page "https://packages.debian.org/source/sid/localepurge")
    (synopsis "Script to remove unneeded locale data")
    (description
     "Localepurge removes unneeded locale files and localized manual pages to
reduce disk usage on systems where only a subset of locales is required.")
    (license license:gpl2+)))

;;;
;;; 9. zmusic — ZDoom music playback library
;;;
(define-public zmusic
  (package
    (name "zmusic")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ZDoom/ZMusic/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0zwzx2pcxswrhfgwmr3dj7f2m6vi6mbdd55b54vqpcy93hgd9k1f"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list alsa-lib libsndfile mpg123))
    (home-page "https://github.com/ZDoom/ZMusic")
    (synopsis "Standalone music playback library from GZDoom")
    (description
     "ZMusic is a standalone music playback library extracted from the GZDoom
project.  It provides playback and synthesis support for multiple game music
formats.")
    (license license:gpl3+)))

;;;
;;; 10. mullvad-vpn-daemon-bin — Mullvad VPN daemon (prebuilt binary)
;;;
(define-public mullvad-vpn-daemon-bin
  (package
    (name "mullvad-vpn-daemon-bin")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://cdn.mullvad.net/app/desktop/releases/"
             version "/MullvadVPN-" version "_amd64.deb"))
       (sha256
        (base32 "0gpg5yb1b4fw6zw06ymgicw46v7qj4sf7i5zd5srdhqvn66rlmqy"))))
    (build-system trivial-build-system)
    (supported-systems '("x86_64-linux"))
    (native-inputs (list tar gzip))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (bin-dir (string-append out "/bin"))
                 (share-dir (string-append out "/share/mullvad"))
                 (tmp (string-append (getcwd) "/deb-extract")))
            ;; Extract the .deb (ar archive containing data.tar.xz)
            (mkdir-p tmp)
            (setenv "PATH"
                    (string-append
                     #$(file-append tar "/bin") ":"
                     #$(file-append gzip "/bin") ":"
                     (getenv "PATH")))
            ;; .deb is an ar archive
            (invoke "ar" "x" src)
            ;; Extract data tarball
            (invoke "tar" "-xf" "data.tar.xz" "-C" tmp)
            ;; Install binaries
            (mkdir-p bin-dir)
            (let ((opt-bin (string-append tmp "/opt/Mullvad VPN/")))
              (for-each
               (lambda (f)
                 (when (file-exists? (string-append opt-bin f))
                   (install-file (string-append opt-bin f) bin-dir)))
               '("mullvad-daemon" "mullvad" "mullvad-exclude"
                 "mullvad-problem-report")))
            ;; Also check usr/bin
            (let ((usr-bin (string-append tmp "/usr/bin/")))
              (when (file-exists? usr-bin)
                (for-each
                 (lambda (f)
                   (let ((src-file (string-append usr-bin f)))
                     (when (file-exists? src-file)
                       (install-file src-file bin-dir))))
                 '("mullvad" "mullvad-daemon" "mullvad-exclude"
                   "mullvad-problem-report"))))
            #t))))
    (home-page "https://mullvad.net")
    (synopsis "Mullvad VPN daemon and CLI (prebuilt binary)")
    (description
     "Mullvad VPN is a privacy-focused VPN service.  This package extracts the
daemon and CLI tools from the official Debian package.")
    (license license:gpl3)))
