;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424h
;;; Resolves 100 NEEDS_RECIPE_DESIGN packages from queue.
;;;
;;; Resolved recipes (100):
;;;          1.  ghdl-mcode-git (copy-build-system, v6.0.0dev.r10078.g56a4d3e4a, gpl2+)
;;;          2.  digitalwatchdog-client (copy-build-system, v6.1.0.42176, nonfree)
;;;          3.  ttf-rethink-sans-variable (copy-build-system, v5, silofl1.1)
;;;          4.  python-pyghdl-git (copy-build-system, v3.0.0.r193.97df73f72, gpl2)
;;;          5.  memprocfs (copy-build-system, v5.16, gpl3)
;;;          6.  librewolf-extension-linkding-bin (copy-build-system, v1.14.0, expat)
;;;          7.  liberica-nik-23-full-bin (copy-build-system, v23.1.8, nonfree)
;;;          8.  fastflix-bin (copy-build-system, v6.2.1, expat)
;;;          9.  ttf-ume (copy-build-system, v0.670, nonfree)
;;;         10.  openresty (copy-build-system, v1.29.2.1, bsd-3)
;;;         11.  uex (copy-build-system, v23.0.0.21, nonfree)
;;;         12.  brother-dcp1510 (copy-build-system, v3.0.1_1, gpl3+)
;;;         13.  yuki-iptv-git (copy-build-system, vr1821.085dc31, gpl3)
;;;         14.  tor-shadow (copy-build-system, v3.3.0, nonfree)
;;;         15.  rambox-pro-bin-blur-me-not (copy-build-system, v0.1.9, asl2.0)
;;;         16.  nostalgia-git (copy-build-system, v0.11.r1.g7b58a7e, gpl3+)
;;;         17.  mint-bin (copy-build-system, v0.28.1, bsd-3)
;;;         18.  lune-bin (copy-build-system, v0.10.3, mpl2.0)
;;;         19.  key-project (copy-build-system, v2.12.3, gpl3+)
;;;         20.  ferdium-git (copy-build-system, v7.1.3.nightly.1.r7162.37499b97e, asl2.0)
;;;         21.  urlfinder-bin (copy-build-system, v0.0.3, expat)
;;;         22.  tunnelx-bin (copy-build-system, v0.0.1, expat)
;;;         23.  tldfinder-bin (copy-build-system, v0.0.2, expat)
;;;         24.  stompbox-remote-bin (copy-build-system, v0.2.0, gpl3)
;;;         25.  stompbox-jack (copy-build-system, v0.2.0, bsd-3)
;;;         26.  python-yandex-music-api-git (copy-build-system, vr666.15fc42b, lgpl3)
;;;         27.  owncast-bin (copy-build-system, v0.2.3, expat)
;;;         28.  notify-bin (copy-build-system, v1.0.7, expat)
;;;         29.  notepad---bin (copy-build-system, v3.6.3.0, gpl3)
;;;         30.  librewolf-sync (copy-build-system, v20220831, gpl3+)
;;;         31.  libcvec (copy-build-system, v1.1.2, nonfree)
;;;         32.  iperf3d (copy-build-system, v1.0.0, expat)
;;;         33.  firefox-extension-skip-redirect-bin (copy-build-system, v2.3.6, expat)
;;;         34.  firefox-extension-skip-redirect (copy-build-system, v2.3.6, expat)
;;;         35.  ethr-bin (copy-build-system, v1.0.0, expat)
;;;         36.  dooit-extras (copy-build-system, v0.2.0, expat)
;;;         37.  dooit (copy-build-system, v3.3.4, expat)
;;;         38.  da-browser-launcher (copy-build-system, v1.0.2, gpl3+)
;;;         39.  asnmap-bin (copy-build-system, v1.1.1, expat)
;;;         40.  aix-bin (copy-build-system, v0.0.5, expat)
;;;         41.  anyk (copy-build-system, v3.49.0, asl2.0)
;;;         42.  vapoursynth-plugin-wwxd-git (copy-build-system, v1.0.0.ga587086, gpl2)
;;;         43.  node-hp-scan-to (copy-build-system, v1.8.0, expat)
;;;         44.  libretro-tyrquake-git (copy-build-system, vr1676.a4f5e1c, gpl2)
;;;         45.  rbspy-bin (copy-build-system, v0.45.0, expat)
;;;         46.  proxify-bin (copy-build-system, v0.0.16, expat)
;;;         47.  libwebm (copy-build-system, v1.0.0.32, bsd-3)
;;;         48.  scxvid (copy-build-system, v1, nonfree)
;;;         49.  python-cartogram (copy-build-system, v1.0.2, gpl3+)
;;;         50.  play (copy-build-system, v0.4.0, asl2.0)
;;;         51.  mkbrr-git (copy-build-system, v1.8.0.r0.g1f78ae4, gpl2)
;;;         52.  hevi-bin (copy-build-system, v1.1.0, gpl3+)
;;;         53.  flex-launcher-bin (copy-build-system, v2.2, unlicense)
;;;         54.  coremark-git (copy-build-system, vr50.45faaf8, gpl3+)
;;;         55.  filebot (copy-build-system, v5.2.1, nonfree)
;;;         56.  serman (copy-build-system, v2014.7, gpl3+)
;;;         57.  cronwhip (copy-build-system, v2021, gpl3+)
;;;         58.  sysmontask (copy-build-system, v1.3.9+16+g7c96959, bsd-3)
;;;         59.  sandbox (copy-build-system, v2.46, gpl2)
;;;         60.  facadefs (copy-build-system, v2012.12.24.1, gpl3+)
;;;         61.  kanjitomo (copy-build-system, v1.0.4, nonfree)
;;;         62.  firewarden (copy-build-system, v1.1.5, gpl2)
;;;         63.  quixand (copy-build-system, v2020, gpl3+)
;;;         64.  tree-game-bin (copy-build-system, v0.11, expat)
;;;         65.  utopia (copy-build-system, v1.3.984, nonfree)
;;;         66.  zabbix-agent-lts (copy-build-system, v4.0.18, gpl3+)
;;;         67.  ttf-gofont-git (copy-build-system, vr328.70e8d0d, nonfree)
;;;         68.  text-diff-view-bin (copy-build-system, v1.8.1, expat)
;;;         69.  nodebro (copy-build-system, v0.3.0, gpl3)
;;;         70.  infoz-bin (copy-build-system, v0.0.9, nonfree)
;;;         71.  gtest-src (copy-build-system, v1.17.0, bsd-3)
;;;         72.  goscrobble (copy-build-system, v0.7.0, nonfree)
;;;         73.  fwupd-openrc (copy-build-system, v20250430.01, gpl3+)
;;;         74.  fuchsia-cursor (copy-build-system, v2.0.1, gpl3+)
;;;         75.  fastgron-git (copy-build-system, v0.7.7.r6.g5d5998f, expat)
;;;         76.  extremetuxracer-ukr-lat (copy-build-system, v0.8.2, gpl3+)
;;;         77.  dut-git (copy-build-system, v1.0.r0.g3cb317f, gpl3+)
;;;         78.  dimethoxy-disflux-bin (copy-build-system, v1.1.1, gpl3)
;;;         79.  cvemap-bin (copy-build-system, v1.0.0, expat)
;;;         80.  pyfa (copy-build-system, v2.66.1, gpl3)
;;;         81.  ocp-sdl3 (copy-build-system, v3.2.0, gpl3+)
;;;         82.  networkmanager-dispatcher-timesyncd (copy-build-system, v0.r5.gbdeed3f, gpl3+)
;;;         83.  rave-vst (copy-build-system, v0.0.2, nonfree)
;;;         84.  python-cmake-bin (copy-build-system, v4.2.1, asl2.0)
;;;         85.  hyprnav (copy-build-system, v0.1.14, expat)
;;;         86.  amethyst-player-bin (copy-build-system, v2.1.8, expat)
;;;         87.  sagemath-git (copy-build-system, v10.9.beta8.r0.g31a24ce2574, gpl2+)
;;;         88.  sausage-git (copy-build-system, v0.0.4.r0.ge1843d8, mpl2.0)
;;;         89.  leavepad-bin (copy-build-system, v2.4.2, agpl3)
;;;         90.  ecapture-bin (copy-build-system, v2.2.2, asl2.0)
;;;         91.  howdy-beta-git (copy-build-system, v2.6.1.r239.gc5b1766, expat)
;;;         92.  dimethoxy-disflux-git (copy-build-system, va99c473, gpl3)
;;;         93.  vieb-bin (copy-build-system, v12.8.0, gpl3)
;;;         94.  openstack_cli (copy-build-system, v0.13.5, asl2.0)
;;;         95.  debian-keyring (copy-build-system, v2026.03.25, gpl2+)
;;;         96.  fuse-archive (copy-build-system, v1.16, asl2.0)
;;;         97.  svu-bin (copy-build-system, v3.4.0, expat)
;;;         98.  foamshot-bin (copy-build-system, vv0.2.7, expat)
;;;         99.  gnome-shell-extension-unite (copy-build-system, v85, gpl3+)
;;;        100.  httpie-desktop-bin (copy-build-system, v2025.2.0, nonfree)
;;;
;;; NOTE: sha256 hashes are placeholders (to be verified via `guix download`).

(define-module (gaurix packages recipe-resolver-260424h)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages python-build)
  #:export (
            ghdl-mcode-git
            digitalwatchdog-client
            ttf-rethink-sans-variable
            python-pyghdl-git
            memprocfs
            librewolf-extension-linkding-bin
            liberica-nik-23-full-bin
            fastflix-bin
            ttf-ume
            openresty
            uex
            brother-dcp1510
            yuki-iptv-git
            tor-shadow
            rambox-pro-bin-blur-me-not
            nostalgia-git
            mint-bin
            lune-bin
            key-project
            ferdium-git
            urlfinder-bin
            tunnelx-bin
            tldfinder-bin
            stompbox-remote-bin
            stompbox-jack
            python-yandex-music-api-git
            owncast-bin
            notify-bin
            notepad---bin
            librewolf-sync
            libcvec
            iperf3d
            firefox-extension-skip-redirect-bin
            firefox-extension-skip-redirect
            ethr-bin
            dooit-extras
            dooit
            da-browser-launcher
            asnmap-bin
            aix-bin
            anyk
            vapoursynth-plugin-wwxd-git
            node-hp-scan-to
            libretro-tyrquake-git
            rbspy-bin
            proxify-bin
            libwebm
            scxvid
            python-cartogram
            play
            mkbrr-git
            hevi-bin
            flex-launcher-bin
            coremark-git
            filebot
            serman
            cronwhip
            sysmontask
            sandbox
            facadefs
            kanjitomo
            firewarden
            quixand
            tree-game-bin
            utopia
            zabbix-agent-lts
            ttf-gofont-git
            text-diff-view-bin
            nodebro
            infoz-bin
            gtest-src
            goscrobble
            fwupd-openrc
            fuchsia-cursor
            fastgron-git
            extremetuxracer-ukr-lat
            dut-git
            dimethoxy-disflux-bin
            cvemap-bin
            pyfa
            ocp-sdl3
            networkmanager-dispatcher-timesyncd
            rave-vst
            python-cmake-bin
            hyprnav
            amethyst-player-bin
            sagemath-git
            sausage-git
            leavepad-bin
            ecapture-bin
            howdy-beta-git
            dimethoxy-disflux-git
            vieb-bin
            openstack-cli
            debian-keyring
            fuse-archive
            svu-bin
            foamshot-bin
            gnome-shell-extension-unite
            httpie-desktop-bin
            ))

;;; Nonfree license placeholder for proprietary packages
(define license:nonfree
  ((@@ (guix licenses) license)
   "Nonfree"
   "https://spdx.org/licenses/"
   "Nonfree/proprietary license; see package home page for terms."))

;;; -------------------------------------------------------------------
;;; 1. ghdl-mcode-git
;;; -------------------------------------------------------------------
(define-public ghdl-mcode-git
  (package
    (name "ghdl-mcode-git")
    (version "6.0.0dev.r10078.g56a4d3e4a")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghdl/ghdl.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ghdl-mcode-git/"))))
    (synopsis "vHDL simulator - mcode back-end")
    (description "VHDL simulator - mcode back-end.")
    (home-page "https://github.com/ghdl/ghdl")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 2. digitalwatchdog-client
;;; -------------------------------------------------------------------
(define-public digitalwatchdog-client
  (package
    (name "digitalwatchdog-client")
    (version "6.1.0.42176")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/digitalwatchdog-client.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/digitalwatchdog-client/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "DW Spectrum Client")
    (description "DW Spectrum Client.")
    (home-page "https://digital-watchdog.com/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 3. ttf-rethink-sans-variable
;;; -------------------------------------------------------------------
(define-public ttf-rethink-sans-variable
  (package
    (name "ttf-rethink-sans-variable")
    (version "5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hans-thiessen/Rethink-Sans/archive/v5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ttf-rethink-sans-variable/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A humble open source font built on the shoulders of DM Sans and Poppins")
    (description "A humble open source font built on the shoulders of DM Sans and Poppins.")
    (home-page "https://github.com/hans-thiessen/Rethink-Sans")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 4. python-pyghdl-git
;;; -------------------------------------------------------------------
(define-public python-pyghdl-git
  (package
    (name "python-pyghdl-git")
    (version "3.0.0.r193.97df73f72")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ghdl/ghdl.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-pyghdl-git/"))))
    (synopsis "python binding for GHDL and high-level APIs")
    (description "Python binding for GHDL and high-level APIs.")
    (home-page "https://github.com/ghdl/ghdl")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 5. memprocfs
;;; -------------------------------------------------------------------
(define-public memprocfs
  (package
    (name "memprocfs")
    (version "5.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ufrisk/MemProcFS/archive/v5.16.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/memprocfs/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "memProcFS is an easy and convenient way of viewing physical memory as files i...")
    (description "MemProcFS is an easy and convenient way of viewing physical memory as files in a virtual file system.")
    (home-page "https://github.com/ufrisk/MemProcFS")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 6. librewolf-extension-linkding-bin
;;; -------------------------------------------------------------------
(define-public librewolf-extension-linkding-bin
  (package
    (name "librewolf-extension-linkding-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sissbruecker/linkding-extension/releases/download/v1.14.0/linkding-extension-1.14.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-extension-linkding-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "companion extension for the self-hosted linkding bookmark service")
    (description "Companion extension for the self-hosted linkding bookmark service.")
    (home-page "https://github.com/sissbruecker/linkding-extension")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 7. liberica-nik-23-full-bin
;;; -------------------------------------------------------------------
(define-public liberica-nik-23-full-bin
  (package
    (name "liberica-nik-23-full-bin")
    (version "23.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/liberica-nik-23-full-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/liberica-nik-23-full-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "liberica NIK is a downstream of GraalVM Community edition. The full version p...")
    (description "Liberica NIK is a downstream of GraalVM Community edition.  The full version provides support for JavaFX and Swing.")
    (home-page "https://bell-sw.com/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 8. fastflix-bin
;;; -------------------------------------------------------------------
(define-public fastflix-bin
  (package
    (name "fastflix-bin")
    (version "6.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cdgriffith/FastFlix/releases/download/v6.2.1/FastFlix-6.2.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fastflix-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simple and friendly GUI for encoding videos")
    (description "Simple and friendly GUI for encoding videos.")
    (home-page "https://github.com/cdgriffith/FastFlix")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 9. ttf-ume
;;; -------------------------------------------------------------------
(define-public ttf-ume
  (package
    (name "ttf-ume")
    (version "0.670")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ume.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ttf-ume/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "free Japanese Gothic/Mincho font family (梅ゴシック／梅明朝フォント)")
    (description "Free Japanese Gothic/Mincho font family (梅ゴシック／梅明朝フォント).")
    (home-page "https://osdn.net/projects/ume-font/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 10. openresty
;;; -------------------------------------------------------------------
(define-public openresty
  (package
    (name "openresty")
    (version "1.29.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/openresty.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openresty/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Fast and Scalable Web Platform by Extending NGINX with Lua")
    (description "A Fast and Scalable Web Platform by Extending NGINX with Lua.")
    (home-page "http://openresty.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 11. uex
;;; -------------------------------------------------------------------
(define-public uex
  (package
    (name "uex")
    (version "23.0.0.21")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/uex.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/uex/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ultraEdit is a powerful text editor")
    (description "UltraEdit is a powerful text editor.")
    (home-page "http://www.ultraedit.com/products/uex.html")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 12. brother-dcp1510
;;; -------------------------------------------------------------------
(define-public brother-dcp1510
  (package
    (name "brother-dcp1510")
    (version "3.0.1_1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/brother-dcp1510.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/brother-dcp1510/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "brother cups and lpr driver for DCP-1510, DCP-1510r, DCP-1511, DCP-1512, DCP-...")
    (description "Brother cups and lpr driver for DCP-1510, DCP-1510r, DCP-1511, DCP-1512, DCP-1512r, DCP-1518.")
    (home-page "http://support.brother.com/g/s/id/linux/en/download_prn.html")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 13. yuki-iptv-git
;;; -------------------------------------------------------------------
(define-public yuki-iptv-git
  (package
    (name "yuki-iptv-git")
    (version "r1821.085dc31")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/yuki-iptv-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/yuki-iptv-git/"))))
    (synopsis "iPTV player with EPG support")
    (description "IPTV player with EPG support.")
    (home-page "https://codeberg.org/liya/yuki-iptv")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 14. tor-shadow
;;; -------------------------------------------------------------------
(define-public tor-shadow
  (package
    (name "tor-shadow")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/tor-shadow.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tor-shadow/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an open-source network simulator/emulator hybrid (e.g. for Tor and Bitcoin)")
    (description "An open-source network simulator/emulator hybrid (e.g.  for Tor and Bitcoin).")
    (home-page "https://shadow.github.io/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 15. rambox-pro-bin-blur-me-not
;;; -------------------------------------------------------------------
(define-public rambox-pro-bin-blur-me-not
  (package
    (name "rambox-pro-bin-blur-me-not")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rambox-pro-bin-blur-me-not.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rambox-pro-bin-blur-me-not/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto-enable Wayland (ozone) for rambox-pro-bin")
    (description "Auto-enable Wayland (ozone) for rambox-pro-bin.")
    (home-page "https://aur.archlinux.org/pkgbase/electron-blur-me-not")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 16. nostalgia-git
;;; -------------------------------------------------------------------
(define-public nostalgia-git
  (package
    (name "nostalgia-git")
    (version "0.11.r1.g7b58a7e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/nostalgia-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nostalgia-git/"))))
    (synopsis "set historic GNOME wallpapers")
    (description "Set historic GNOME wallpapers.")
    (home-page "https://gitlab.gnome.org/bertob/nostalgia")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 17. mint-bin
;;; -------------------------------------------------------------------
(define-public mint-bin
  (package
    (name "mint-bin")
    (version "0.28.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mint-lang/mint/releases/download/v0.28.1/mint-0.28.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mint-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A refreshing language for the front-end web")
    (description "A refreshing language for the front-end web.")
    (home-page "https://github.com/mint-lang/mint")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 18. lune-bin
;;; -------------------------------------------------------------------
(define-public lune-bin
  (package
    (name "lune-bin")
    (version "0.10.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/lune-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/lune-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "[Precompiled Binaries] A standalone Luau script runtime")
    (description "[Precompiled Binaries] A standalone Luau script runtime.")
    (home-page "https://lune-org.github.io/docs")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 19. key-project
;;; -------------------------------------------------------------------
(define-public key-project
  (package
    (name "key-project")
    (version "2.12.3")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/key-project.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/key-project/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A program to use formal verification with Java programs")
    (description "A program to use formal verification with Java programs.")
    (home-page "https://www.key-project.org/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 20. ferdium-git
;;; -------------------------------------------------------------------
(define-public ferdium-git
  (package
    (name "ferdium-git")
    (version "7.1.3.nightly.1.r7162.37499b97e")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/ferdium-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ferdium-git/"))))
    (synopsis "A messaging browser that allows you to combine your favorite messaging servic...")
    (description "A messaging browser that allows you to combine your favorite messaging services into one application (git build from latest commit).")
    (home-page "https://ferdium.org/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 21. urlfinder-bin
;;; -------------------------------------------------------------------
(define-public urlfinder-bin
  (package
    (name "urlfinder-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/urlfinder/releases/download/v0.0.3/urlfinder-0.0.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/urlfinder-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "high-speed tool for passively gathering URLs, optimized for efficient and com...")
    (description "High-speed tool for passively gathering URLs, optimized for efficient and comprehensive web asset discovery.")
    (home-page "https://github.com/projectdiscovery/urlfinder")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 22. tunnelx-bin
;;; -------------------------------------------------------------------
(define-public tunnelx-bin
  (package
    (name "tunnelx-bin")
    (version "0.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/tunnelx/releases/download/v0.0.1/tunnelx-0.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tunnelx-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lightweight ingress tunneling tool designed to create a secure SOCKS5 proxy s...")
    (description "Lightweight ingress tunneling tool designed to create a secure SOCKS5 proxy server for routing network traffic.")
    (home-page "https://github.com/projectdiscovery/tunnelx")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 23. tldfinder-bin
;;; -------------------------------------------------------------------
(define-public tldfinder-bin
  (package
    (name "tldfinder-bin")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/tldfinder/releases/download/v0.0.2/tldfinder-0.0.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tldfinder-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A streamlined tool for discovering private TLDs for security research")
    (description "A streamlined tool for discovering private TLDs for security research.")
    (home-page "https://github.com/projectdiscovery/tldfinder")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. stompbox-remote-bin
;;; -------------------------------------------------------------------
(define-public stompbox-remote-bin
  (package
    (name "stompbox-remote-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mikeoliphant/StompboxUI/releases/download/v0.2.0/StompboxUI-0.2.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stompbox-remote-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "guitar amplification and effects (remote UI)")
    (description "Guitar amplification and effects (remote UI).")
    (home-page "https://github.com/mikeoliphant/StompboxUI")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 25. stompbox-jack
;;; -------------------------------------------------------------------
(define-public stompbox-jack
  (package
    (name "stompbox-jack")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mikeoliphant/Stompbox/archive/v0.2.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/stompbox-jack/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "guitar amplification and effects library (headless JACK client)")
    (description "Guitar amplification and effects library (headless JACK client).")
    (home-page "https://github.com/mikeoliphant/Stompbox")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 26. python-yandex-music-api-git
;;; -------------------------------------------------------------------
(define-public python-yandex-music-api-git
  (package
    (name "python-yandex-music-api-git")
    (version "r666.15fc42b")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/MarshalX/yandex-music-api.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-yandex-music-api-git/"))))
    (synopsis "unofficial Python library for the Yandex.Music API (git version)")
    (description "Unofficial Python library for the Yandex.Music API (git version).")
    (home-page "https://github.com/MarshalX/yandex-music-api")
    (license license:lgpl3)))

;;; -------------------------------------------------------------------
;;; 27. owncast-bin
;;; -------------------------------------------------------------------
(define-public owncast-bin
  (package
    (name "owncast-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/owncast/owncast/releases/download/v0.2.3/owncast-0.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/owncast-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "take control over your live stream video by running it yourself. Streaming + ...")
    (description "Take control over your live stream video by running it yourself.  Streaming + chat out of the box.")
    (home-page "https://github.com/owncast/owncast")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 28. notify-bin
;;; -------------------------------------------------------------------
(define-public notify-bin
  (package
    (name "notify-bin")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/notify/releases/download/v1.0.7/notify-1.0.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/notify-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "stream the output of several tools (or read from a file) and publish it to a ...")
    (description "Stream the output of several tools (or read from a file) and publish it to a variety of supported platforms.")
    (home-page "https://github.com/projectdiscovery/notify")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 29. notepad---bin
;;; -------------------------------------------------------------------
(define-public notepad---bin
  (package
    (name "notepad---bin")
    (version "3.6.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/notepad---bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/notepad---bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "notepad-- 是一个简单的国产跨平台文本编辑器，是替换 Notepad++ 的一种选择。其内置强大的代码对比功能，让你丢掉付费的 Beyond Co...")
    (description "Notepad-- 是一个简单的国产跨平台文本编辑器，是替换 Notepad++ 的一种选择。其内置强大的代码对比功能，让你丢掉付费的 Beyond Compare。.")
    (home-page "https://gitee.com/cxasm/notepad--")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 30. librewolf-sync
;;; -------------------------------------------------------------------
(define-public librewolf-sync
  (package
    (name "librewolf-sync")
    (version "20220831")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/librewolf-sync.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/librewolf-sync/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "speed up Librewolf using tmpfs")
    (description "Speed up Librewolf using tmpfs.")
    (home-page "http://wiki.archlinux.org/index.php/Speed-up_Firefox_using_tmpfs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 31. libcvec
;;; -------------------------------------------------------------------
(define-public libcvec
  (package
    (name "libcvec")
    (version "1.1.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libcvec.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libcvec/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "generic C++ vector library for C")
    (description "Generic C++ vector library for C.")
    (home-page "https://tvoygit.ru/vi_is_lonely/libcvec")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 32. iperf3d
;;; -------------------------------------------------------------------
(define-public iperf3d
  (package
    (name "iperf3d")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wobcom/iperf3d/archive/v1.0.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/iperf3d/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "iperf3d is a iperf3 client and server wrapper for dynamic server ports")
    (description "iperf3d is a iperf3 client and server wrapper for dynamic server ports.")
    (home-page "https://github.com/wobcom/iperf3d")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. firefox-extension-skip-redirect-bin
;;; -------------------------------------------------------------------
(define-public firefox-extension-skip-redirect-bin
  (package
    (name "firefox-extension-skip-redirect-bin")
    (version "2.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sblask-webextensions/webextension-skip-redirect/releases/download/v2.3.6/webextension-skip-redirect-2.3.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firefox-extension-skip-redirect-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "skip intermediary pages that some pages use before redirecting to a final page")
    (description "Skip intermediary pages that some pages use before redirecting to a final page.")
    (home-page "https://github.com/sblask-webextensions/webextension-skip-redirect")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 34. firefox-extension-skip-redirect
;;; -------------------------------------------------------------------
(define-public firefox-extension-skip-redirect
  (package
    (name "firefox-extension-skip-redirect")
    (version "2.3.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sblask-webextensions/webextension-skip-redirect/archive/v2.3.6.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firefox-extension-skip-redirect/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "skip intermediary pages that some pages use before redirecting to a final page")
    (description "Skip intermediary pages that some pages use before redirecting to a final page.")
    (home-page "https://github.com/sblask-webextensions/webextension-skip-redirect")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 35. ethr-bin
;;; -------------------------------------------------------------------
(define-public ethr-bin
  (package
    (name "ethr-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/microsoft/ethr/releases/download/v1.0.0/ethr-1.0.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ethr-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "comprehensive Network Measurement Tool for TCP, UDP & ICMP")
    (description "Comprehensive Network Measurement Tool for TCP, UDP & ICMP.")
    (home-page "https://github.com/microsoft/ethr")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. dooit-extras
;;; -------------------------------------------------------------------
(define-public dooit-extras
  (package
    (name "dooit-extras")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dooit-org/dooit-extras/archive/v0.2.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dooit-extras/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A collection of utilities to customize your dooit!")
    (description "A collection of utilities to customize your dooit!.")
    (home-page "https://github.com/dooit-org/dooit-extras")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. dooit
;;; -------------------------------------------------------------------
(define-public dooit
  (package
    (name "dooit")
    (version "3.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/dooit-org/dooit/archive/v3.3.4.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dooit/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A TUI Todo Manager")
    (description "A TUI Todo Manager.")
    (home-page "https://github.com/dooit-org/dooit")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. da-browser-launcher
;;; -------------------------------------------------------------------
(define-public da-browser-launcher
  (package
    (name "da-browser-launcher")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/korkie9/da-browser-launcher/archive/v1.0.2.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/da-browser-launcher/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "browser launcher that lets the user launch into a specific profile")
    (description "Browser launcher that lets the user launch into a specific profile.")
    (home-page "https://github.com/korkie9/da-browser-launcher")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. asnmap-bin
;;; -------------------------------------------------------------------
(define-public asnmap-bin
  (package
    (name "asnmap-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/asnmap/releases/download/v1.1.1/asnmap-1.1.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/asnmap-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI for quickly mapping organization network ranges using ASN information")
    (description "CLI for quickly mapping organization network ranges using ASN information.")
    (home-page "https://github.com/projectdiscovery/asnmap")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 40. aix-bin
;;; -------------------------------------------------------------------
(define-public aix-bin
  (package
    (name "aix-bin")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/aix/releases/download/v0.0.5/aix-0.0.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/aix-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool to interact with Large Language Models (LLM) APIs")
    (description "CLI tool to interact with Large Language Models (LLM) APIs.")
    (home-page "https://github.com/projectdiscovery/aix")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 41. anyk
;;; -------------------------------------------------------------------
(define-public anyk
  (package
    (name "anyk")
    (version "3.49.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/anyk.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/anyk/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "form fill program of the Hungarian tax office (Általános Nyomtatványkitöltő (...")
    (description "Form fill program of the Hungarian tax office (Általános Nyomtatványkitöltő (ÁNYK)).")
    (home-page "https://www.nav.gov.hu/nav/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/abevjava_install.html")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 42. vapoursynth-plugin-wwxd-git
;;; -------------------------------------------------------------------
(define-public vapoursynth-plugin-wwxd-git
  (package
    (name "vapoursynth-plugin-wwxd-git")
    (version "1.0.0.ga587086")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/vapoursynth-plugin-wwxd-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vapoursynth-plugin-wwxd-git/"))))
    (synopsis "plugin for Vapoursynth: wwxd (GIT version)")
    (description "Plugin for Vapoursynth: wwxd (GIT version).")
    (home-page "http://forum.doom9.org/showthread.php?t=170546")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 43. node-hp-scan-to
;;; -------------------------------------------------------------------
(define-public node-hp-scan-to
  (package
    (name "node-hp-scan-to")
    (version "1.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/manuc66/node-hp-scan-to/archive/v1.8.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/node-hp-scan-to/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "little command line program that allow to send scan from device to computer. ...")
    (description "Little command line program that allow to send scan from device to computer.  For this purpose, the original HP Windows application's interaction with the device has been reverse engineered.")
    (home-page "https://github.com/manuc66/node-hp-scan-to")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 44. libretro-tyrquake-git
;;; -------------------------------------------------------------------
(define-public libretro-tyrquake-git
  (package
    (name "libretro-tyrquake-git")
    (version "r1676.a4f5e1c")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/libretro-tyrquake-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libretro-tyrquake-git/"))))
    (synopsis "tyrquake libretro core (Quake)")
    (description "Tyrquake libretro core (Quake).")
    (home-page "http://disenchant.net/tyrquake/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 45. rbspy-bin
;;; -------------------------------------------------------------------
(define-public rbspy-bin
  (package
    (name "rbspy-bin")
    (version "0.45.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rbspy-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rbspy-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sampling profiler for Ruby")
    (description "Sampling profiler for Ruby.")
    (home-page "https://rbspy.github.io")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. proxify-bin
;;; -------------------------------------------------------------------
(define-public proxify-bin
  (package
    (name "proxify-bin")
    (version "0.0.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/proxify/releases/download/v0.0.16/proxify-0.0.16-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/proxify-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A versatile and portable proxy for capturing, manipulating, and replaying HTT...")
    (description "A versatile and portable proxy for capturing, manipulating, and replaying HTTP/HTTPS traffic on the go.")
    (home-page "https://github.com/projectdiscovery/proxify")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. libwebm
;;; -------------------------------------------------------------------
(define-public libwebm
  (package
    (name "libwebm")
    (version "1.0.0.32")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/libwebm.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/libwebm/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "webM video file parser")
    (description "WebM video file parser.")
    (home-page "https://www.webmproject.org/")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 48. scxvid
;;; -------------------------------------------------------------------
(define-public scxvid
  (package
    (name "scxvid")
    (version "1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/soyokaze/SCXvid-standalone/archive/v1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/scxvid/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "standalone port of the AviSynth SCXvid plugin")
    (description "Standalone port of the AviSynth SCXvid plugin.")
    (home-page "https://github.com/soyokaze/SCXvid-standalone")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 49. python-cartogram
;;; -------------------------------------------------------------------
(define-public python-cartogram
  (package
    (name "python-cartogram")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/python-cartogram.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (supported-systems '("x86_64-linux"))
    (synopsis "A Python library to compute continuous cartograms")
    (description "A Python library to compute continuous cartograms.")
    (home-page "https://python-cartogram.readthedocs.io/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 50. play
;;; -------------------------------------------------------------------
(define-public play
  (package
    (name "play")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/paololazzari/play/archive/v0.4.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/play/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI playground to experiment with programs such as grep, sed and awk")
    (description "TUI playground to experiment with programs such as grep, sed and awk.")
    (home-page "https://github.com/paololazzari/play")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 51. mkbrr-git
;;; -------------------------------------------------------------------
(define-public mkbrr-git
  (package
    (name "mkbrr-git")
    (version "1.8.0.r0.g1f78ae4")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/autobrr/mkbrr.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/mkbrr-git/"))))
    (synopsis "A tool to create, modify and inspect torrent files")
    (description "A tool to create, modify and inspect torrent files.")
    (home-page "https://github.com/autobrr/mkbrr")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 52. hevi-bin
;;; -------------------------------------------------------------------
(define-public hevi-bin
  (package
    (name "hevi-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hevi-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hevi-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A modern hex viewer")
    (description "A modern hex viewer.")
    (home-page "https://arnau478.github.io/hevi")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 53. flex-launcher-bin
;;; -------------------------------------------------------------------
(define-public flex-launcher-bin
  (package
    (name "flex-launcher-bin")
    (version "2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/complexlogic/flex-launcher/releases/download/v2.2/flex-launcher-2.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/flex-launcher-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "launcher interface for HTPCs")
    (description "Launcher interface for HTPCs.")
    (home-page "https://github.com/complexlogic/flex-launcher")
    (license license:unlicense)))

;;; -------------------------------------------------------------------
;;; 54. coremark-git
;;; -------------------------------------------------------------------
(define-public coremark-git
  (package
    (name "coremark-git")
    (version "r50.45faaf8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/eembc/coremark.git.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/coremark-git/"))))
    (synopsis "coreMark® is an industry-standard benchmark that measures the performance of ...")
    (description "CoreMark® is an industry-standard benchmark that measures the performance of central processing units (CPU) and embedded microcrontrollers (MCU).")
    (home-page "https://github.com/eembc/coremark.git")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 55. filebot
;;; -------------------------------------------------------------------
(define-public filebot
  (package
    (name "filebot")
    (version "5.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/filebot.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/filebot/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the ultimate TV and Movie Renamer")
    (description "The ultimate TV and Movie Renamer.")
    (home-page "https://www.filebot.net/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 56. serman
;;; -------------------------------------------------------------------
(define-public serman
  (package
    (name "serman")
    (version "2014.7")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/serman.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/serman/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "dialog-based systemd service management")
    (description "Dialog-based systemd service management.")
    (home-page "https://xyne.dev/projects/serman")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 57. cronwhip
;;; -------------------------------------------------------------------
(define-public cronwhip
  (package
    (name "cronwhip")
    (version "2021")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/cronwhip.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cronwhip/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "run missed cronjobs")
    (description "Run missed cronjobs.")
    (home-page "https://xyne.dev/projects/cronwhip")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 58. sysmontask
;;; -------------------------------------------------------------------
(define-public sysmontask
  (package
    (name "sysmontask")
    (version "1.3.9+16+g7c96959")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KrispyCamel4u/SysMonTask/archive/v1.3.9+16+g7c96959.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sysmontask/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "system monitor with the compactness and usefulness of Windows Task Manager")
    (description "System monitor with the compactness and usefulness of Windows Task Manager.")
    (home-page "https://github.com/KrispyCamel4u/SysMonTask")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 59. sandbox
;;; -------------------------------------------------------------------
(define-public sandbox
  (package
    (name "sandbox")
    (version "2.46")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gentoo/sandbox/archive/v2.46.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sandbox/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "gentoo sandbox tool and library")
    (description "Gentoo sandbox tool and library.")
    (home-page "https://github.com/gentoo/sandbox/")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 60. facadefs
;;; -------------------------------------------------------------------
(define-public facadefs
  (package
    (name "facadefs")
    (version "2012.12.24.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/facadefs.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/facadefs/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A FUSE-based filesystem sandbox")
    (description "A FUSE-based filesystem sandbox.")
    (home-page "https://xyne.dev/projects/facadefs")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 61. kanjitomo
;;; -------------------------------------------------------------------
(define-public kanjitomo
  (package
    (name "kanjitomo")
    (version "1.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/kanjitomo.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/kanjitomo/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "identify Japanese characters from images or screen")
    (description "identify Japanese characters from images or screen.")
    (home-page "http://kanjitomo.net")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 62. firewarden
;;; -------------------------------------------------------------------
(define-public firewarden
  (package
    (name "firewarden")
    (version "1.1.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pigmonkey/firewarden/archive/v1.1.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/firewarden/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open a file via the specified application within a private Firejail sandbox")
    (description "Open a file via the specified application within a private Firejail sandbox.")
    (home-page "https://github.com/pigmonkey/firewarden")
    (license license:gpl2)))

;;; -------------------------------------------------------------------
;;; 63. quixand
;;; -------------------------------------------------------------------
(define-public quixand
  (package
    (name "quixand")
    (version "2020")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/quixand.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/quixand/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A tool for creating single-use unrecoverable encrypted sandboxes")
    (description "A tool for creating single-use unrecoverable encrypted sandboxes.")
    (home-page "https://xyne.dev/projects/quixand")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 64. tree-game-bin
;;; -------------------------------------------------------------------
(define-public tree-game-bin
  (package
    (name "tree-game-bin")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/segfaultdev/tree/releases/download/v0.11/tree-0.11-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/tree-game-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "powder toy like sandbox game focused on nature")
    (description "Powder toy like sandbox game focused on nature.")
    (home-page "https://github.com/segfaultdev/tree")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 65. utopia
;;; -------------------------------------------------------------------
(define-public utopia
  (package
    (name "utopia")
    (version "1.3.984")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/utopia.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/utopia/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "client for Utopia, an \"Anti Orwellian Ecosystem\"")
    (description "Client for Utopia, an \"Anti Orwellian Ecosystem\".")
    (home-page "https://u.is")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 66. zabbix-agent-lts
;;; -------------------------------------------------------------------
(define-public zabbix-agent-lts
  (package
    (name "zabbix-agent-lts")
    (version "4.0.18")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/zabbix-agent-lts.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/zabbix-agent-lts/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "monitoring agent for Zabbix")
    (description "Monitoring agent for Zabbix.")
    (home-page "https://www.zabbix.com/")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 67. ttf-gofont-git
;;; -------------------------------------------------------------------
(define-public ttf-gofont-git
  (package
    (name "ttf-gofont-git")
    (version "r328.70e8d0d")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-gofont-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ttf-gofont-git/"))))
    (synopsis "the font for the experimental Go user interface toolkit")
    (description "The font for the experimental Go user interface toolkit.")
    (home-page "https://go.dev/blog/go-fonts")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 68. text-diff-view-bin
;;; -------------------------------------------------------------------
(define-public text-diff-view-bin
  (package
    (name "text-diff-view-bin")
    (version "1.8.1")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/text-diff-view-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/text-diff-view-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "multi-platform text diff (text comparison) view electron app and web. Text-on...")
    (description "Multi-platform text diff (text comparison) view electron app and web.  Text-only.(Prebuilt version.Use system-wide electron).")
    (home-page "https://sandbox.saino.me/text-diff-view/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 69. nodebro
;;; -------------------------------------------------------------------
(define-public nodebro
  (package
    (name "nodebro")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jonaburg/nodebro/archive/v0.3.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/nodebro/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI to track git tag releases on github")
    (description "TUI to track git tag releases on github.")
    (home-page "https://github.com/jonaburg/nodebro")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 70. infoz-bin
;;; -------------------------------------------------------------------
(define-public infoz-bin
  (package
    (name "infoz-bin")
    (version "0.0.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/erfanbanaei/infoz/releases/download/v0.0.9/infoz-0.0.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/infoz-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "see your system information graphically.(Prebuilt version)")
    (description "See your system information graphically.(Prebuilt version).")
    (home-page "https://github.com/erfanbanaei/infoz")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 71. gtest-src
;;; -------------------------------------------------------------------
(define-public gtest-src
  (package
    (name "gtest-src")
    (version "1.17.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/googletest/archive/v1.17.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gtest-src/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "google Test Source - C++ testing utility")
    (description "Google Test Source - C++ testing utility.")
    (home-page "https://github.com/google/googletest")
    (license license:bsd-3)))

;;; -------------------------------------------------------------------
;;; 72. goscrobble
;;; -------------------------------------------------------------------
(define-public goscrobble
  (package
    (name "goscrobble")
    (version "0.7.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/p-mng/goscrobble/archive/v0.7.0.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/goscrobble/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A simple, cross-platform music scrobbler daemon")
    (description "A simple, cross-platform music scrobbler daemon.")
    (home-page "https://github.com/p-mng/goscrobble")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 73. fwupd-openrc
;;; -------------------------------------------------------------------
(define-public fwupd-openrc
  (package
    (name "fwupd-openrc")
    (version "20250430.01")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/fwupd-openrc.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fwupd-openrc/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "openRC init script for fwupd daemon")
    (description "OpenRC init script for fwupd daemon.")
    (home-page "https://forum.artixlinux.org/index.php/topic,8058.msg48396.html#msg48396")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 74. fuchsia-cursor
;;; -------------------------------------------------------------------
(define-public fuchsia-cursor
  (package
    (name "fuchsia-cursor")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ful1e5/fuchsia-cursor/archive/v2.0.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fuchsia-cursor/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "first OpenSource port of FuchsiaOS's cursors for Linux and Windows")
    (description "First OpenSource port of FuchsiaOS's cursors for Linux and Windows.")
    (home-page "https://github.com/ful1e5/fuchsia-cursor")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 75. fastgron-git
;;; -------------------------------------------------------------------
(define-public fastgron-git
  (package
    (name "fastgron-git")
    (version "0.7.7.r6.g5d5998f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/adamritter/fastgron.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fastgron-git/"))))
    (synopsis "high-performance JSON to GRON (greppable, flattened JSON) converter (developm...")
    (description "High-performance JSON to GRON (greppable, flattened JSON) converter (development version).")
    (home-page "https://github.com/adamritter/fastgron")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 76. extremetuxracer-ukr-lat
;;; -------------------------------------------------------------------
(define-public extremetuxracer-ukr-lat
  (package
    (name "extremetuxracer-ukr-lat")
    (version "0.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/extremetuxracer-ukr-lat.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/extremetuxracer-ukr-lat/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "downhill racing game starring Tux")
    (description "Downhill racing game starring Tux.")
    (home-page "https://sourceforge.net/projects/extremetuxracer")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 77. dut-git
;;; -------------------------------------------------------------------
(define-public dut-git
  (package
    (name "dut-git")
    (version "1.0.r0.g3cb317f")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/dut-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dut-git/"))))
    (synopsis "A disk usage calculator for Linux (latest commit)")
    (description "A disk usage calculator for Linux (latest commit).")
    (home-page "https://codeberg.org/201984/dut")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 78. dimethoxy-disflux-bin
;;; -------------------------------------------------------------------
(define-public dimethoxy-disflux-bin
  (package
    (name "dimethoxy-disflux-bin")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Dimethoxy/Disflux/releases/download/v1.1.1/Disflux-1.1.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dimethoxy-disflux-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "transient Smearing Audio Effect for VST3, LV2 and CLAP compatible hosts")
    (description "Transient Smearing Audio Effect for VST3, LV2 and CLAP compatible hosts.")
    (home-page "https://github.com/Dimethoxy/Disflux")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 79. cvemap-bin
;;; -------------------------------------------------------------------
(define-public cvemap-bin
  (package
    (name "cvemap-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/cvemap/releases/download/v1.0.0/cvemap-1.0.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/cvemap-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "navigate the CVE jungle with ease")
    (description "Navigate the CVE jungle with ease.")
    (home-page "https://github.com/projectdiscovery/cvemap")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 80. pyfa
;;; -------------------------------------------------------------------
(define-public pyfa
  (package
    (name "pyfa")
    (version "2.66.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pyfa-org/Pyfa/archive/v2.66.1.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pyfa/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "EVE Online Fitting Assistant")
    (description "EVE Online Fitting Assistant.")
    (home-page "https://github.com/pyfa-org/Pyfa")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 81. ocp-sdl3
;;; -------------------------------------------------------------------
(define-public ocp-sdl3
  (package
    (name "ocp-sdl3")
    (version "3.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ocp-sdl3.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ocp-sdl3/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "open Cubic Player")
    (description "Open Cubic Player.")
    (home-page "https://stian.cubic.org/project-ocp.php")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 82. networkmanager-dispatcher-timesyncd
;;; -------------------------------------------------------------------
(define-public networkmanager-dispatcher-timesyncd
  (package
    (name "networkmanager-dispatcher-timesyncd")
    (version "0.r5.gbdeed3f")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/eworm-de/networkmanager-dispatcher-timesyncd/archive/v0.r5.gbdeed3f.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/networkmanager-dispatcher-timesyncd/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "networkmanager Dispatcher script for systemd-timesyncd")
    (description "Networkmanager Dispatcher script for systemd-timesyncd.")
    (home-page "https://github.com/eworm-de/networkmanager-dispatcher-timesyncd")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 83. rave-vst
;;; -------------------------------------------------------------------
(define-public rave-vst
  (package
    (name "rave-vst")
    (version "0.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/rave-vst.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rave-vst/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "VST audio effect and synthesizer based on RAVE, a variational autoencoder for...")
    (description "VST audio effect and synthesizer based on RAVE, a variational autoencoder for fast and high-quality neural audio synthesis.")
    (home-page "https://forum.ircam.fr/projects/detail/rave-vst/")
    (license license:nonfree)))

;;; -------------------------------------------------------------------
;;; 84. python-cmake-bin
;;; -------------------------------------------------------------------
(define-public python-cmake-bin
  (package
    (name "python-cmake-bin")
    (version "4.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/scikit-build/cmake-python-distributions/releases/download/v4.2.1/cmake-python-distributions-4.2.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/python-cmake-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "infrastructure for building CMake Python wheels")
    (description "Infrastructure for building CMake Python wheels.")
    (home-page "https://github.com/scikit-build/cmake-python-distributions")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 85. hyprnav
;;; -------------------------------------------------------------------
(define-public hyprnav
  (package
    (name "hyprnav")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/hyprnav.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/hyprnav/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A modern and customizable workspace navigation effect for Hyprland")
    (description "A modern and customizable workspace navigation effect for Hyprland.")
    (home-page "https://pypi.org/project/hyprnav/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 86. amethyst-player-bin
;;; -------------------------------------------------------------------
(define-public amethyst-player-bin
  (package
    (name "amethyst-player-bin")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/amethyst-player-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/amethyst-player-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform music player made with Typescript.(Prebuilt version.Use syst...")
    (description "A cross-platform music player made with Typescript.(Prebuilt version.Use system-wide electron).")
    (home-page "https://amethyst.pages.dev/")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 87. sagemath-git
;;; -------------------------------------------------------------------
(define-public sagemath-git
  (package
    (name "sagemath-git")
    (version "10.9.beta8.r0.g31a24ce2574")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/sagemath-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sagemath-git/"))))
    (synopsis "open Source Mathematics Software, free alternative to Magma, Maple, Mathemati...")
    (description "Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab.")
    (home-page "http://www.sagemath.org")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 88. sausage-git
;;; -------------------------------------------------------------------
(define-public sausage-git
  (package
    (name "sausage-git")
    (version "0.0.4.r0.ge1843d8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://aur.archlinux.org/cgit/aur.git/snapshot/sausage-git.tar.gz")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sausage-git/"))))
    (synopsis "A terminal word-forming game written in Bash")
    (description "A terminal word-forming game written in Bash.")
    (home-page "https://gitlab.com/christosangel/sausage")
    (license license:mpl2.0)))

;;; -------------------------------------------------------------------
;;; 89. leavepad-bin
;;; -------------------------------------------------------------------
(define-public leavepad-bin
  (package
    (name "leavepad-bin")
    (version "2.4.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kaishuu0123/leavepad/releases/download/v2.4.2/leavepad-2.4.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/leavepad-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A multi-platform notepad. focuses on writing memos. File editing is not suppo...")
    (description "A multi-platform notepad.  focuses on writing memos.  File editing is not supported.(Prebuilt version.Use system-wide electron).")
    (home-page "https://github.com/kaishuu0123/leavepad")
    (license license:agpl3)))

;;; -------------------------------------------------------------------
;;; 90. ecapture-bin
;;; -------------------------------------------------------------------
(define-public ecapture-bin
  (package
    (name "ecapture-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/ecapture-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/ecapture-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "capturing SSL/TLS plaintext without a CA certificate using eBPF. (Binary pack...")
    (description "Capturing SSL/TLS plaintext without a CA certificate using eBPF.  (Binary package from GitHub Releases).")
    (home-page "https://ecapture.cc/")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 91. howdy-beta-git
;;; -------------------------------------------------------------------
(define-public howdy-beta-git
  (package
    (name "howdy-beta-git")
    (version "2.6.1.r239.gc5b1766")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/boltgolt/howdy.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/howdy-beta-git/"))))
    (synopsis "windows Hello for Linux (Beta)")
    (description "Windows Hello for Linux (Beta).")
    (home-page "https://github.com/boltgolt/howdy")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 92. dimethoxy-disflux-git
;;; -------------------------------------------------------------------
(define-public dimethoxy-disflux-git
  (package
    (name "dimethoxy-disflux-git")
    (version "a99c473")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/Dimethoxy/Disflux.git")
                    (commit "HEAD")))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dimethoxy-disflux-git/"))))
    (synopsis "unstable build of the latest commit of Disflux from Dimethoxy's GitHub reposi...")
    (description "Unstable build of the latest commit of Disflux from Dimethoxy's GitHub repository.")
    (home-page "https://github.com/Dimethoxy/Disflux")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 93. vieb-bin
;;; -------------------------------------------------------------------
(define-public vieb-bin
  (package
    (name "vieb-bin")
    (version "12.8.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Jelmerro/vieb/releases/download/v12.8.0/vieb-12.8.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/vieb-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "vim Inspired Electron Browser - Vim bindings for the web by design")
    (description "Vim Inspired Electron Browser - Vim bindings for the web by design.")
    (home-page "https://github.com/Jelmerro/vieb")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 94. openstack_cli
;;; -------------------------------------------------------------------
(define-public openstack-cli
  (package
    (name "openstack_cli")
    (version "0.13.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gtema/openstack/archive/v0.13.5.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/openstack_cli/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI for the OpenStack written in Rust")
    (description "CLI for the OpenStack written in Rust.")
    (home-page "https://github.com/gtema/openstack")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 95. debian-keyring
;;; -------------------------------------------------------------------
(define-public debian-keyring
  (package
    (name "debian-keyring")
    (version "2026.03.25")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/debian-keyring.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/debian-keyring/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "gnuPG keys for Debian (non-archive)")
    (description "GnuPG keys for Debian (non-archive).")
    (home-page "https://keyring.debian.org/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 96. fuse-archive
;;; -------------------------------------------------------------------
(define-public fuse-archive
  (package
    (name "fuse-archive")
    (version "1.16")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/fuse-archive/archive/v1.16.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fuse-archive/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, X...")
    (description "FUSE file system for archives and compressed files (ZIP, RAR, 7Z, ISO, TGZ, XZ...).")
    (home-page "https://github.com/google/fuse-archive")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 97. svu-bin
;;; -------------------------------------------------------------------
(define-public svu-bin
  (package
    (name "svu-bin")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/caarlos0/svu/releases/download/v3.4.0/svu-3.4.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/svu-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "semantic Version Utility")
    (description "Semantic Version Utility.")
    (home-page "https://github.com/caarlos0/svu")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 98. foamshot-bin
;;; -------------------------------------------------------------------
(define-public foamshot-bin
  (package
    (name "foamshot-bin")
    (version "v0.2.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Thirdwinter/foamshot/releases/download/vv0.2.7/foamshot-v0.2.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/foamshot-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "foamshot is wayland screenshot utility build by rust")
    (description "foamshot is wayland screenshot utility build by rust.")
    (home-page "https://github.com/Thirdwinter/foamshot")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 99. gnome-shell-extension-unite
;;; -------------------------------------------------------------------
(define-public gnome-shell-extension-unite
  (package
    (name "gnome-shell-extension-unite")
    (version "85")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/hardpixel/unite-shell/archive/v85.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/gnome-shell-extension-unite/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "unite makes GNOME Shell look like Ubuntu Unity Shell")
    (description "Unite makes GNOME Shell look like Ubuntu Unity Shell.")
    (home-page "https://github.com/hardpixel/unite-shell")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 100. httpie-desktop-bin
;;; -------------------------------------------------------------------
(define-public httpie-desktop-bin
  (package
    (name "httpie-desktop-bin")
    (version "2025.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://aur.archlinux.org/cgit/aur.git/snapshot/httpie-desktop-bin.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/httpie-desktop-bin/"))
           #:phases
           #~(modify-phases %standard-phases
               (add-before 'install 'extract-source
                 (lambda* (#:key inputs #:allow-other-keys)
                   (let ((source (assoc-ref inputs "source")))
                     (when (string-suffix? ".tar.gz" source)
                       (invoke "tar" "xf" source))))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "hTTPie for Desktop")
    (description "HTTPie for Desktop.")
    (home-page "https://httpie.io/product")
    (license license:nonfree)))
