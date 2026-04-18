;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass 260417aw (2026-04-17)
;;;
;;; Summary: 12 new recipes, 18 blocked with exhaustion notes.
;;;
;;; New recipes:
;;;   - tmux-plugin-manager: Tmux Plugin Manager v3.1.0 (shell, MIT)
;;;   - pwnat: NAT-to-NAT traversal v0.3.0 (C/Make, GPL-3.0+)
;;;   - ossp: OSS emulator via CUSE v1.3.3 (C/cmake, GPL-2.0)
;;;   - font-kopub: Korean KoPub OpenType fonts (font data, custom)
;;;   - shimmer-wallpapers: Xfce complementary wallpapers (data, CC-BY-SA-3.0)
;;;   - cachyos-ananicy-rules: CachyOS ananicy process rules v1.1.34 (data, GPL-3.0)
;;;   - dosh: Docker Shell v8 (shell, LGPL-2.1+)
;;;   - domake: Docker Make v3 (shell, LGPL-2.1+)
;;;   - nodenv-node-build: nodenv node-build plugin v5.4.34 (shell, MIT)
;;;   - barify: Volume/brightness notification bar v1.2 (shell, GPL-3.0)
;;;   - grub2-theme-preview: GRUB2 theme preview v2.9.1 (Python, GPL-2.0+)
;;;   - authselect: System auth profile selector v1.7.1 (C/autotools, GPL-3.0)
;;;
;;; Blocked (18):
;;;   neoarch-git, fish-lsp-git, streamcontroller, coolerdash-git,
;;;   screenpipe-bin, boca, wsdd-native, vesta, bisq-bin,
;;;   hypryou-greeter, snx-rs, nodejs-fast-cli, yay-git,
;;;   sysc-greet, quran-companion, monado-vulkan-layers-git,
;;;   gelly, networkd-dispatcher
;;;
;;; Hashes obtained via `guix download` on 2026-04-17.

(define-module (gaurix packages recipe-resolver-260417aw)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages popt)
  #:export (tmux-plugin-manager
            pwnat
            ossp
            font-kopub
            shimmer-wallpapers
            cachyos-ananicy-rules
            dosh
            domake
            nodenv-node-build
            barify
            grub2-theme-preview
            authselect))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; COPY-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── tmux-plugin-manager ─────────────────────────────────────────
;;; TPM — manages tmux plugins via .tmux.conf
;;;
(define-public tmux-plugin-manager
  (package
    (name "tmux-plugin-manager")
    (version "3.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tmux-plugins/tpm/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0w2mjxz0vwmlzl9nmwpz499iyfpv7ahd0y0hysbx4xa4di0zq494"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "share/tmux-plugin-manager/bin")
               ("bindings" "share/tmux-plugin-manager/bindings")
               ("lib" "share/tmux-plugin-manager/lib")
               ("scripts" "share/tmux-plugin-manager/scripts")
               ("tpm" "share/tmux-plugin-manager/tpm"))))
    (home-page "https://github.com/tmux-plugins/tpm")
    (synopsis "tmux plugin manager for managing tmux plugins")
    (description
     "Tmux Plugin Manager installs and manages tmux plugins.  It loads
plugins listed in @file{.tmux.conf}, supports automatic plugin
installation on first run, and provides keybindings for plugin
install, update, and cleanup operations.")
    (license license:expat)))

;;; ── barify ──────────────────────────────────────────────────────
;;; barify — volume/brightness bar via libnotify
;;;
(define-public barify
  (package
    (name "barify")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/arctize/barify/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0bnz92zhv4z46xx53i5n673r7skp1fxjpxwn4grfkmh7azadpi85"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("barify" "bin/barify"))))
    (home-page "https://github.com/arctize/barify")
    (synopsis "volume and brightness notification bar script")
    (description
     "Barify adjusts volume or brightness and displays the result as a
progress bar via desktop notifications.  It works with both dunst
on Xorg and mako on Wayland.")
    (license license:gpl3)))

;;; ── nodenv-node-build ───────────────────────────────────────────
;;; node-build — install Node.js versions (nodenv plugin)
;;;
(define-public nodenv-node-build
  (package
    (name "nodenv-node-build")
    (version "5.4.34")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nodenv/node-build/archive/v"
             version ".tar.gz"))
       (sha256
        (base32 "13ig65kj9yriykypawz13zsvz5mhdhakxvn2pk6dwg094pl3vyx8"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("bin" "bin")
               ("share" "share"))))
    (home-page "https://github.com/nodenv/node-build")
    (synopsis "install Node.js versions as a nodenv plugin")
    (description
     "Node-build provides definitions and scripts for installing
specific Node.js versions.  It can be used standalone or as a
plugin for nodenv to manage multiple Node.js installations.")
    (license license:expat)))

;;; ── shimmer-wallpapers ──────────────────────────────────────────
;;; Complementary wallpapers for Xfce Shimmer themes
;;;
(define-public shimmer-wallpapers
  (package
    (name "shimmer-wallpapers")
    (version "0.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/shimmerproject/Wallpapers/archive/"
             "ba134cbfa7130e88822f07b18c454a8791d504b8.tar.gz"))
       (sha256
        (base32 "0n2dskknp3ahdvz9z9ig09r7iwm7z027crbjh8xi54ryd3nfmc7b"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/backgrounds/shimmer"
                #:exclude ("README" "README.md" "LICENSE" ".gitignore")))))
    (home-page "http://shimmerproject.org")
    (synopsis "complementary wallpapers for Xfce Shimmer themes")
    (description
     "A collection of wallpaper images designed to complement the
Shimmer Project Xfce themes, including Albatross, Bluebird, and
Greybird.")
    (license license:cc-by-sa3.0)))

;;; ── cachyos-ananicy-rules ───────────────────────────────────────
;;; CachyOS process scheduling rules for ananicy-cpp
;;;
(define-public cachyos-ananicy-rules
  (package
    (name "cachyos-ananicy-rules")
    (version "1.1.34")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/CachyOS/ananicy-rules/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "12vp7bira1kf73j244h0881m014h18ha3m3z9w2wcp9g44jx04fn"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("00-default" "etc/ananicy.d/00-default")
               ("00-cgroups" "etc/ananicy.d/00-cgroups")
               ("ananicy.conf" "etc/ananicy.d/ananicy.conf"))))
    (home-page "https://github.com/CachyOS/ananicy-rules")
    (synopsis "process scheduling rules for ananicy daemon")
    (description
     "CachyOS ananicy-rules provides process priority, I/O scheduling,
and cgroup assignment rules for the ananicy or ananicy-cpp daemon.
The rules automatically adjust process priorities for common
applications to improve system responsiveness.")
    (license license:gpl3)))

;;; ── font-kopub ──────────────────────────────────────────────────
;;; KoPub OTF — Korean OpenType fonts from Korean Publishers Society
;;;
(define-public font-kopub
  (package
    (name "font-kopub")
    (version "2.0")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.kopus.org/wp-content/uploads/2022/04/KOPUB2.0_OTF_FONTS.zip")
       (sha256
        (base32 "0l004fgmw18mmpymhbyzqrslid7sdyqilyp852pcd7h3cg2mm1ay"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/kopub"
                #:include-regexp ("\\.otf$")))))
    (native-inputs (list unzip))
    (home-page "https://www.kopus.org/biz-electronic-font2-2/")
    (synopsis "Korean KoPub OpenType fonts")
    (description
     "KoPub fonts are professional Korean OpenType fonts published by
the Korean Publishers Society (KoPuS).  The set includes Batang
(serif), Dotum (sans-serif), and World (mixed) families in
multiple weights.")
    (license (license:non-copyleft
              "https://www.kopus.org/biz-electronic-font2-2/"
              "KoPub font license"))))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; GNU-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── pwnat ───────────────────────────────────────────────────────
;;; pwnat — NAT-to-NAT connection tool
;;;
(define-public pwnat
  (package
    (name "pwnat")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/samyk/pwnat/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "0i0b2h8wh3y5i0zhywmkz70m7hhnkw2gapx92jryb6i4y87ar167"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "CC=" (or (getenv "CC") "gcc")))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((bin (string-append (assoc-ref outputs "out") "/bin")))
                (mkdir-p bin)
                (install-file "pwnat" bin)))))))
    (home-page "https://sa.my/pwnat/")
    (synopsis "NAT-to-NAT client-server communication tool")
    (description
     "Pwnat allows any number of clients behind NATs to communicate with
a server behind a separate NAT with no port forwarding, no DMZ
setup, and no third-party proxies.  It exploits a property of NAT
translation tables to establish direct connections.")
    (license license:gpl3+)))

;;; ── dosh ────────────────────────────────────────────────────────
;;; dosh — Docker Shell
;;;
(define-public dosh
  (package
    (name "dosh")
    (version "8")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gportay/dosh/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "05ji7lpjxjcx12cr2n8mrcw7rb7sv2n9n356k44arj8drmsiw3gv"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (home-page "https://github.com/gportay/dosh")
    (synopsis "run shell commands in Docker containers")
    (description
     "Dosh is a Docker Shell that runs interactive and non-interactive
shell commands inside Docker containers.  It reads a Doshfile to
configure the container image, volumes, and environment for
reproducible shell environments.")
    (license license:lgpl2.1+)))

;;; ── domake ──────────────────────────────────────────────────────
;;; domake — Docker Make
;;;
(define-public domake
  (package
    (name "domake")
    (version "3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/gportay/domake/archive/"
             version ".tar.gz"))
       (sha256
        (base32 "0hv3f8s4fmfgq69p9ycgi8fi5vf4vf2xci9s3j9r18ws0lyzbg7a"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:make-flags
      #~(list (string-append "PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure))))
    (inputs (list dosh))
    (home-page "https://github.com/gportay/domake")
    (synopsis "run Makefile targets inside Docker containers")
    (description
     "Domake provides a make-compatible CLI that runs every Makefile
shell command inside a Docker container.  It delegates to dosh
for container management, providing reproducible build environments
without modifying existing Makefiles.")
    (license license:lgpl2.1+)))

;;; ── authselect ──────────────────────────────────────────────────
;;; authselect — system authentication profile selector
;;;
(define-public authselect
  (package
    (name "authselect")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/authselect/authselect/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "0xlgfly15mmczvv8c3f80w3ycx0wir8yknij0ba1q8zxilxcaj9z"))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'autoreconf
            (lambda _
              (invoke "autoreconf" "-fiv"))))))
    (native-inputs
     (list autoconf automake libtool pkg-config gettext-minimal asciidoc))
    (inputs
     (list popt libselinux))
    (home-page "https://github.com/authselect/authselect")
    (synopsis "select system authentication and identity profiles")
    (description
     "Authselect is a tool to select system authentication and identity
sources from a list of supported profiles.  It configures PAM
and nsswitch files according to the selected profile, simplifying
the management of authentication stacks on Linux systems.")
    (license license:gpl3)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; CMAKE-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── ossp ────────────────────────────────────────────────────────
;;; ossp — OSS Proxy Daemon via CUSE
;;;
(define-public ossp
  (package
    (name "ossp")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OpenMandrivaSoftware/ossp/archive/refs/tags/v"
             version ".tar.gz"))
       (sha256
        (base32 "1p248r71fmp6j0jdvi33ix34bskg16dfjdwsxq7k4kp71q4hpj4c"))))
    (build-system cmake-build-system)
    (arguments
     (list #:tests? #f))
    (inputs (list fuse))
    (native-inputs (list pkg-config))
    (home-page "https://github.com/OpenMandrivaSoftware/ossp")
    (synopsis "emulate OSS sound devices using CUSE")
    (description
     "OSSP emulates Open Sound System devices using CUSE (Character
device in Userspace).  It creates virtual @file{/dev/dsp} and
@file{/dev/mixer} devices that forward audio through PulseAudio
or ALSA, enabling legacy OSS applications on modern sound
systems.")
    (license license:gpl2)))

;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
;;; PYPROJECT-BUILD-SYSTEM PACKAGES
;;; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

;;; ── grub2-theme-preview ─────────────────────────────────────────
;;; Preview GRUB2 themes using KVM/QEMU
;;;
(define-public grub2-theme-preview
  (package
    (name "grub2-theme-preview")
    (version "2.9.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/hartwork/grub2-theme-preview/archive/refs/tags/"
             version ".tar.gz"))
       (sha256
        (base32 "1hi98rxz2n57nvcaq4p2hw4ccj41zs3clzsxvj2m0gsfm1m0igci"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list python-setuptools python-wheel))
    (inputs
     (list qemu mtools xorriso))
    (home-page "https://github.com/hartwork/grub2-theme-preview")
    (synopsis "preview GRUB 2 themes using KVM and QEMU")
    (description
     "Grub2-theme-preview previews full GRUB 2 themes or background
images using KVM/QEMU.  It creates a temporary disk image, installs
GRUB with the specified theme, and boots it in a QEMU virtual machine
for visual inspection.")
    (license license:gpl2+)))
