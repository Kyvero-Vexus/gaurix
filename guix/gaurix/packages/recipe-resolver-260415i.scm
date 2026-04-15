;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415i
;;; Resolves 100 packages from general queue.
;;; 39 resolved with recipes; 9 resolved as compat aliases;
;;; 52 blocked with reason codes.
;;;
;;; Recipes (39 new):
;;;   1. mdc-bin (copy, v0.3)
;;;   2. kqalc-bin (copy, v0.2.1)
;;;   3. kai-bin (copy, v2.1.4)
;;;   4. whatsapp-linux-desktop-bin (copy, v1.0.1)
;;;   5. csview-bin (copy, v1.3.4)
;;;   6. listmonk-bin (copy, v6.1.0)
;;;   7. pinokio-bin (copy, v7.1.15)
;;;   8. i2tor-bin (copy, v0.1.1)
;;;   9. dstimer-bin (copy, v1.1.0)
;;;   10. dz6-bin (copy, v0.6.0)
;;;   11. kopia-bin (copy, v0.22.3)
;;;   12. hadolint-bin (copy, v2.14.0)
;;;   13. helix-gpt-bin (copy, v0.34)
;;;   14. aonsoku-bin (copy, v0.14.0)
;;;   15. yolk-bin (copy, v0.3.6)
;;;   16. sttr-bin (copy, v0.2.30)
;;;   17. hgrep-bin (copy, v0.3.9)
;;;   18. psa-update-bin (copy, v1.0.11)
;;;   19. ludo-bin (copy, v0.19.0)
;;;   20. llvm-mingw-w64-toolchain-msvcrt-bin (copy, v20260324)
;;;   21. hellfire-browser-bin (copy, v151.0a1_FP1)
;;;   22. stirling-pdf-bin (copy, v2.9.2)
;;;   23. bed-bin (copy, v0.2.8)
;;;   24. uvtools-bin (copy, v6.0.3)
;;;   25. amoxide-tui-bin (copy, v0.5.0)
;;;   26. amoxide-bin (copy, v0.5.0)
;;;   27. lc-bin (copy, v1.3.1)
;;;   28. bun-bin (copy, v1.2.13)
;;;   29. micromamba-bin (copy, v2.1.1)
;;;   30. siyuan-bin (copy, v3.1.25)
;;;   31. blockbench-bin (copy, v4.12.4)
;;;   32. soar-bin (copy, v0.5.3)
;;;   33. oh-my-posh-bin (copy, v25.6.1)
;;;   34. piper-tts-bin (copy, v2023.11.14-2)
;;;   35. kopia-ui-bin (copy, v0.22.3)
;;;   36. panwriter-bin (copy, v0.8.10)
;;;   37. mongosh-bin (copy, v2.5.0)
;;;   38. sheets-bin (copy, v0.2.0)
;;;   39. fcitx5-vinput-bin (copy, v2.1.8)
;;;
;;; Compat aliases (9) — see general-compat.scm:
;;;   - grayjay-bin -> grayjay
;;;   - rsgain -> rsgain
;;;   - splix -> splix
;;;   - byobu -> byobu
;;;   - xfwm4-themes -> xfwm4-themes
;;;   - gnome-bluetooth -> gnome-bluetooth
;;;   - webkit2gtk -> webkitgtk
;;;   - webkit2gtk-docs -> webkitgtk
;;;   - qt5-sensors -> qtsensors
;;;
;;; Blocked (52):
;;;   FETCH_FAILED (22):
;;;     - proton-meet-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - brave-origin-nightly-bin: NIGHTLY: no stable versioned release URL; nightly builds are ephemeral
;;;     - wgtunnel-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - crunchycleaner-bin: GitHub release assets in non-standard format (.pkg.tar.zst Arch packag
;;;     - piebald-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - arctic-comfyui-helper-bin: GitHub release assets in non-standard format (.pkg.tar.zst Arch packag
;;;     - gram-bin: Codeberg project; no Linux binary release found at expected URL
;;;     - spotube-bin: GitHub release URL returned 404/redirect; version mismatch or renamed 
;;;     - spflashtool-bin: Download behind login/captcha wall; no direct URL available
;;;     - softmaker-office-2024-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - implay-bin: GitHub release URL returned 404/redirect; version mismatch or renamed 
;;;     - nitro-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - znote-bin: GitHub release URL returned 404/redirect; version mismatch or renamed 
;;;     - anytype-electron-bin: GitHub release URL returned 404/redirect; version mismatch or renamed 
;;;     - todesk-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - beaver-notes-bin: Only .rpm or non-Linux assets available in GitHub releases
;;;     - smap-bin: Only .rpm or non-Linux assets available in GitHub releases
;;;     - dvdae-bin: PROPRIETARY/NO_STABLE_URL: no publicly available stable download URL f
;;;     - ddrescueview-bin: No Linux x86_64 binary found in project releases
;;;     - psysonic-bin: GitHub releases not found; private/restricted repository
;;;     - xclicker: GitHub release v1.5.1 has no Linux AppImage/binary asset; only .deb wi
;;;     - poptracker: GitHub release v0.35.1 has no Linux .deb asset; only .AppImage without
;;;   NEEDS_RECIPE_DESIGN (29):
;;;     - illogical-impulse-bibata-modern-classic-bin: Package requires further investigation for source URL and build system
;;;     - insomnia-bin: ALREADY_PACKAGED_PRIOR: recipe exists in recipe-resolver-260407k.scm f
;;;     - dotnet-targeting-pack-8.0-bin: COMPLEX_DEPS: .NET SDK/runtime bundle with 100+ components; needs mult
;;;     - dotnet-sdk-8.0-bin: COMPLEX_DEPS: .NET SDK/runtime bundle with 100+ components; needs mult
;;;     - dotnet-runtime-8.0-bin: COMPLEX_DEPS: .NET SDK/runtime bundle with 100+ components; needs mult
;;;     - aspnet-targeting-pack-8.0-bin: COMPLEX_DEPS: .NET SDK/runtime bundle with 100+ components; needs mult
;;;     - aspnet-runtime-8.0-bin: COMPLEX_DEPS: .NET SDK/runtime bundle with 100+ components; needs mult
;;;     - electron25-bin: COMPLEX_DEPS: Electron framework binary requires Chromium runtime patc
;;;     - virtualhere-server-bin: PROPRIETARY: commercial USB-over-network server; no public download wi
;;;     - lean-ctx-bin: ACADEMIC: Lean theorem prover context tool; niche package needs Lean 4
;;;     - lib32-gstreamer: MULTILIB_UNSUPPORTED: Guix uses separate i686-linux system builds inst
;;;     - lib32-gst-plugins-base-libs: MULTILIB_UNSUPPORTED: Guix uses separate i686-linux system builds inst
;;;     - lib32-gst-plugins-base: MULTILIB_UNSUPPORTED: Guix uses separate i686-linux system builds inst
;;;     - lib32-gst-plugins-good: MULTILIB_UNSUPPORTED: Guix uses separate i686-linux system builds inst
;;;     - sunshine: COMPLEX_DEPS: GPU screen capture needs CUDA/VAAPI/KMS; 50+ deps includ
;;;     - tuxmanager: SOURCE_BUILD: C++ Qt5 app from GitHub source; needs cmake + Qt5 integr
;;;     - linux-cachyos-cjktty-headers: KERNEL_VARIANT: custom kernel; Guix has own kernel packaging model wit
;;;     - linux-cachyos-cjktty: KERNEL_VARIANT: custom kernel; Guix has own kernel packaging model wit
;;;     - wakatime: GO_DEPS: wakatime-cli is Go app with 50+ module deps; go-build-system 
;;;     - kcgroups-dmemcg: KERNEL_MODULE: requires cgroups v2 kernel module integration; KDE Plas
;;;     - plasma-foreground-booster-dmemcg: KERNEL_MODULE: requires cgroups v2 kernel module integration; KDE Plas
;;;     - mnt-reform-lpc-dkms: KERNEL_MODULE: DKMS kernel module for MNT Reform hardware; needs kerne
;;;     - roomeqwizard-beta: PROPRIETARY: Room EQ Wizard; Java app with proprietary license; no sta
;;;     - vim-classic-git: SOURCE_BUILD: vim fork from sr.ht git; needs autotools build with care
;;;     - vim-classic-runtime-git: SOURCE_BUILD: vim fork from sr.ht git; needs autotools build with care
;;;     - gvim-classic-git: SOURCE_BUILD: vim fork from sr.ht git; needs autotools build with care
;;;     - linux-cachyos: KERNEL_VARIANT: custom kernel; Guix has own kernel packaging model wit
;;;     - linux-cachyos-headers: KERNEL_VARIANT: custom kernel; Guix has own kernel packaging model wit
;;;     - systemd-cron: SYSTEMD_SPECIFIC: requires systemd; Guix System uses GNU Shepherd init
;;;   SOURCE_UNAVAILABLE (1):
;;;     - jai: PROPRIETARY: Jai programming language; closed beta, no public source o
;;;
;;; All sha256 hashes obtained via `guix download`.

(define-module (gaurix packages recipe-resolver-260415i)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:export (
            mdc-bin
            kqalc-bin
            kai-bin
            whatsapp-linux-desktop-bin
            csview-bin
            listmonk-bin
            pinokio-bin
            i2tor-bin
            dstimer-bin
            dz6-bin
            kopia-bin
            hadolint-bin
            helix-gpt-bin
            aonsoku-bin
            yolk-bin
            sttr-bin
            hgrep-bin
            psa-update-bin
            ludo-bin
            llvm-mingw-w64-toolchain-msvcrt-bin
            hellfire-browser-bin
            stirling-pdf-bin
            bed-bin
            uvtools-bin
            amoxide-tui-bin
            amoxide-bin
            lc-bin
            bun-bin
            micromamba-bin
            siyuan-bin
            blockbench-bin
            soar-bin
            oh-my-posh-bin
            piper-tts-bin
            kopia-ui-bin
            panwriter-bin
            mongosh-bin
            sheets-bin
            fcitx5-vinput-bin
            ))

(define-public mdc-bin
  (package
    (name "mdc-bin")
    (version "0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kooler/MiddayCommander/releases/download/v0.3/MiddayCommander_0.3_linux_amd64.tar.gz")
              (sha256
               (base32
                "1f1ih6kir85rw35zzx2xdd73qwkwd83ls2ca576z8vdqf925ljw9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("mdc" "bin/mdc"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/mdc"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A TUI dual-panel terminal file manager written in Go, inspired by Midnight ...")
    (description
     "A TUI dual-panel terminal file manager written in Go, inspired by Midnight Commander.  This package provides the pre-built binary release.")
    (home-page "https://github.com/kooler/MiddayCommander")
    (license license:expat)))

(define-public kqalc-bin
  (package
    (name "kqalc-bin")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/noctuum/kqalc/releases/download/v0.2.1/kqalc_0.2.1_linux_amd64.tar.gz")
              (sha256
               (base32
                "0ps3vkvllv60bfaicj45h64hw2ziwd5fra7zcqc68ihcc6gy9h43"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/kqalc"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "full qalculate power in KRunner")
    (description
     "Full qalculate power in KRunner.  This package provides the pre-built binary release.")
    (home-page "https://github.com/noctuum/kqalc")
    (license license:gpl2+)))

(define-public kai-bin
  (package
    (name "kai-bin")
    (version "2.1.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SimonSchubert/Kai/releases/download/v2.1.4/Kai-2.1.4-linux-x86_64.tar.gz")
              (sha256
               (base32
                "0dmw1cxv1q0l0353krgykvwdj0nwdasqvvh1h9ipbbcrbs8afkr1"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/kai"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI assistant powered by Ollama, Gemini, ChatGPT and more")
    (description
     "AI assistant powered by Ollama, Gemini, ChatGPT and more.  This package provides the pre-built binary release.")
    (home-page "https://github.com/SimonSchubert/Kai")
    (license license:asl2.0)))

(define-public whatsapp-linux-desktop-bin
  (package
    (name "whatsapp-linux-desktop-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sayedulsayem/whatsapp-linux-desktop/releases/download/v1.0.1/whatsapp-linux-desktop-1.0.1-x86_64.AppImage")
              (sha256
               (base32
                "1g5g6c876pbhmhxyhmyha6imfghfxf3hbx8g3h7h8h7liy5kfniz"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "whatsapp-linux-desktop.AppImage")
              (chmod "whatsapp-linux-desktop.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an unofficial WhatsApp Linux Desktop application")
    (description
     "An unofficial WhatsApp Linux Desktop application.  This package provides the pre-built binary release.")
    (home-page "https://github.com/sayedulsayem/whatsapp-linux-desktop")
    (license license:expat)))

(define-public csview-bin
  (package
    (name "csview-bin")
    (version "1.3.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/wfxr/csview/releases/download/v1.3.4/csview_1.3.4_amd64.deb")
              (sha256
               (base32
                "1b4lvrwr69941sazksjp23c4zxhm8pdik4x601j8winzglqcrzq8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("csview" "bin/csview"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "high performance CSV viewer with CJK/emoji support")
    (description
     "High performance CSV viewer with CJK/emoji support.  This package provides the pre-built binary release.")
    (home-page "https://github.com/wfxr/csview")
    (license license:asl2.0)))

(define-public listmonk-bin
  (package
    (name "listmonk-bin")
    (version "6.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/knadh/listmonk/releases/download/v6.1.0/listmonk_6.1.0_linux_amd64.tar.gz")
              (sha256
               (base32
                "1w3gs8b5rmjk6az4k6nl0xm2jdgjklqwp3cldkvvx32r5j7lzx08"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("listmonk" "bin/listmonk"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/listmonk"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "self-hosted newsletter and mailing list manager with a modern dashboard (bi...")
    (description
     "Self-hosted newsletter and mailing list manager with a modern dashboard (binary release).  This package provides the pre-built binary release.")
    (home-page "https://github.com/knadh/listmonk")
    (license license:agpl3)))

(define-public pinokio-bin
  (package
    (name "pinokio-bin")
    (version "7.1.15")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pinokiocomputer/pinokio/releases/download/v7.1.15/pinokio_7.1.15_amd64.deb")
              (sha256
               (base32
                "1zdgdxd855pr9kkf74hvl3yvb4m5i0irqlplh323rr71cc8rcczj"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "AI Browser")
    (description
     "AI Browser.  This package provides the pre-built binary release.")
    (home-page "https://github.com/pinokiocomputer/pinokio")
    (license license:expat)))

(define-public i2tor-bin
  (package
    (name "i2tor-bin")
    (version "0.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SethMcGuire/i2tor/releases/download/v0.1.1/i2tor-0.1.1-linux-x86_64")
              (sha256
               (base32
                "061j7668vn5yjsg0yj067q10k17693myihcfcpq4i2x26242k8l9"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("i2tor" "bin/i2tor"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "i2tor")
              (chmod "i2tor" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/i2tor"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "desktop launcher that combines Tor Browser and Java I2P without forking Tor...")
    (description
     "Desktop launcher that combines Tor Browser and Java I2P without forking Tor Browser.  This package provides the pre-built binary release.")
    (home-page "https://github.com/SethMcGuire/i2tor")
    (license license:expat)))

(define-public dstimer-bin
  (package
    (name "dstimer-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/madLinux7/dstimer/releases/download/v"
                    version
                    "/dstimer-linux-x86_64"))
              (sha256
               (base32
                "074b4rfqzaf9ia0vl6qdwsdh939pczrh1gh1fv7r52p877fl528g"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dstimer" "bin/dstimer"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "dstimer")
              (chmod "dstimer" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/dstimer"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "the timer for CLI people")
    (description
     "The timer for CLI people.  This package provides the pre-built binary release.")
    (home-page "https://github.com/madLinux7/dstimer")
    (license license:expat)))

(define-public dz6-bin
  (package
    (name "dz6-bin")
    (version "0.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mentebinaria/dz6/releases/download/v"
                    version
                    "/dz6-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0viivl3msrpy1pfyyd4rg85vlmjq3ild3kqcwyd45r2yvxnb3qbf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("dz6" "bin/dz6"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/dz6"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast Vim-inspired TUI hex editor")
    (description
     "Fast Vim-inspired TUI hex editor.  This package provides the pre-built binary release.")
    (home-page "https://github.com/mentebinaria/dz6")
    (license license:gpl3+)))

(define-public kopia-bin
  (package
    (name "kopia-bin")
    (version "0.22.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kopia/kopia/releases/download/v0.22.3/kopia-0.22.3-linux-x64.tar.gz")
              (sha256
               (base32
                "0b8cg764a512rmi39gpswi4iwr1kxv393akwrbfkmirzh7h0dsfr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("kopia" "bin/kopia"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/kopia"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform backup-tool with encryption, deduplication, compression an...")
    (description
     "A cross-platform backup-tool with encryption, deduplication, compression and cloud support.  This package provides the pre-built binary release.")
    (home-page "https://github.com/kopia/kopia/")
    (license license:asl2.0)))

(define-public hadolint-bin
  (package
    (name "hadolint-bin")
    (version "2.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/hadolint/hadolint/releases/download/v"
                    version
                    "/hadolint-linux-x86_64"))
              (sha256
               (base32
                "0issvklkjvyckgckn6zn900mqhi7knbqnkh1vn26rxc48sa2dwkb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hadolint" "bin/hadolint"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "hadolint")
              (chmod "hadolint" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/hadolint"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "dockerfile linter, validate inline bash, written in Haskell")
    (description
     "Dockerfile linter, validate inline bash, written in Haskell.  This package provides the pre-built binary release.")
    (home-page "https://github.com/hadolint/hadolint")
    (license license:gpl3+)))

(define-public helix-gpt-bin
  (package
    (name "helix-gpt-bin")
    (version "0.34")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/leona/helix-gpt/releases/download/0.34/helix-gpt-0.34-x86_64-linux.tar.gz")
              (sha256
               (base32
                "0scyvhqkbz5jcbc4qd7hk19f26rrl7xa65p6dlnkhhk82s3jk7jf"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("helix-gpt" "bin/helix-gpt"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/helix-gpt"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "code assistant language server for Helix with support for Copilot/OpenAI/Co...")
    (description
     "Code assistant language server for Helix with support for Copilot/OpenAI/Codeium/Ollama.  This package provides the pre-built binary release.")
    (home-page "https://github.com/leona/helix-gpt")
    (license license:expat)))

(define-public aonsoku-bin
  (package
    (name "aonsoku-bin")
    (version "0.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/victoralvesf/aonsoku/releases/download/v0.14.0/Aonsoku-v0.14.0-linux-amd64.deb")
              (sha256
               (base32
                "0qyr5pckb3ipqi06nz8q6j6lv5pv777navs458ysg7i7r2czrmij"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "A modern desktop client for Navidrome/Subsonic servers built with React and...")
    (description
     "A modern desktop client for Navidrome/Subsonic servers built with React and Electron.  This package provides the pre-built binary release.")
    (home-page "https://github.com/victoralvesf/aonsoku")
    (license license:expat)))

(define-public yolk-bin
  (package
    (name "yolk-bin")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/elkowar/yolk/releases/download/v"
                    version
                    "/yolk_dots-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "0mx4zlzhdn1qsg97bknpvadyc9j8ic2987pkzh1nmqgj40yv3jjy"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("yolk" "bin/yolk"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/yolk"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "templated dotfile management that won't get in your way")
    (description
     "Templated dotfile management that won't get in your way.  This package provides the pre-built binary release.")
    (home-page "https://github.com/elkowar/yolk")
    (license license:expat)))

(define-public sttr-bin
  (package
    (name "sttr-bin")
    (version "0.2.30")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abhimanyu003/sttr/releases/download/v0.2.30/sttr_0.2.30_linux_386.deb")
              (sha256
               (base32
                "0l8ilndvhs2k2h5xrjmkncvvxp2cppxzvlwl5ahi5mbkaflh112m"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "sttr is command line software that allows you to quickly run various transf...")
    (description
     "sttr is command line software that allows you to quickly run various transformation operations on the string.  This package provides the pre-built binary release.")
    (home-page "https://github.com/abhimanyu003/sttr")
    (license license:expat)))

(define-public hgrep-bin
  (package
    (name "hgrep-bin")
    (version "0.3.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rhysd/hgrep/releases/download/v0.3.9/hgrep-v0.3.9-x86_64-unknown-linux-gnu.zip")
              (sha256
               (base32
                "1knhl5c7algmqag3z63sms15xr3fny21sgpqc8zzpwm9mh9p40pn"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hgrep" "bin/hgrep"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/hgrep"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list unzip patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "grep with human-friendly search results")
    (description
     "Grep with human-friendly search results.  This package provides the pre-built binary release.")
    (home-page "https://github.com/rhysd/hgrep")
    (license license:expat)))

(define-public psa-update-bin
  (package
    (name "psa-update-bin")
    (version "1.0.11")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/zeld/psa-update/releases/download/1.0.11/psa-update-1.0.11-x86_64-unknown-linux-gnu.tar.gz")
              (sha256
               (base32
                "12rpfjxkv7n84wdzwbgx5zb0l8nky6az1dr9jqbmwawpwyj6666n"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("psa-update" "bin/psa-update"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/psa-update"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system ...")
    (description
     "CLI alternative to PSA (Peugeot / Citroën / DS / Opel) infotainment system update (NAC / RCC firmware and navigation maps), hopefully more robust.  This package provides the pre-built binary release.")
    (home-page "https://github.com/zeld/psa-update")
    (license license:unlicense)))

(define-public ludo-bin
  (package
    (name "ludo-bin")
    (version "0.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/libretro/ludo/releases/download/v0.19.0/Ludo-Linux-wayland-x86_64-0.19.0.tar.gz")
              (sha256
               (base32
                "1rlwki7a9nvp5jqwp4h2bz472h1c064nk4haq1svgs2z0i1qzzrw"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("ludo" "bin/ludo"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/ludo"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "ludo is a minimalist frontend for emulators")
    (description
     "Ludo is a minimalist frontend for emulators.  This package provides the pre-built binary release.")
    (home-page "https://github.com/libretro/ludo")
    (license license:gpl3+)))

(define-public llvm-mingw-w64-toolchain-msvcrt-bin
  (package
    (name "llvm-mingw-w64-toolchain-msvcrt-bin")
    (version "20260324")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mstorsjo/llvm-mingw/releases/download/20260324/llvm-mingw-20260324-msvcrt-ubuntu-22.04-x86_64.tar.xz")
              (sha256
               (base32
                "0zljnq68akliapln2fasxcj7vvgvfny8ky9w21clfxpjkycjx2jv"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/llvm-mingw/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/None"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "LLVM/Clang/LLD based mingw-w64 toolchain (MSVCRT) targeting i686, x86-64, a...")
    (description
     "LLVM/Clang/LLD based mingw-w64 toolchain (MSVCRT) targeting i686, x86-64, armv7, and aarch64.  This package provides the pre-built binary release.")
    (home-page "https://github.com/mstorsjo/llvm-mingw")
    (license license:asl2.0)))

(define-public hellfire-browser-bin
  (package
    (name "hellfire-browser-bin")
    (version "151.0a1_FP1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/CYFARE/HellFire/releases/download/v"
                    version
                    "/hellfire-151.0a1.en-US.linux-x86_64.tar.xz"))
              (sha256
               (base32
                "187pih4ib92lqy8c9y4ix8nvj05js13nkgxy44h5f4vz35mcl3q0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("hellfire/" "lib/hellfire/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/hellfire"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "optimized Firefox for GNU/Linux")
    (description
     "Optimized Firefox for GNU/Linux.  This package provides the pre-built binary release.")
    (home-page "https://github.com/CYFARE/HellFire")
    (license license:expat)))

(define-public stirling-pdf-bin
  (package
    (name "stirling-pdf-bin")
    (version "2.9.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v"
                    version
                    "/Stirling-PDF-linux-x86_64.deb"))
              (sha256
               (base32
                "0l81rwys6lh7gpljc7jczfd1h2mi0m92899247dpvfx1wacq2qam"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "locally hosted web application that allows you to perform various operation...")
    (description
     "Locally hosted web application that allows you to perform various operations on PDF files.  This package provides the pre-built binary release.")
    (home-page "https://github.com/Stirling-Tools/Stirling-PDF")
    (license license:expat)))

(define-public bed-bin
  (package
    (name "bed-bin")
    (version "0.2.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/itchyny/bed/releases/download/v0.2.8/bed_v0.2.8_linux_amd64.tar.gz")
              (sha256
               (base32
                "1bj5qjznpyiqaangc1jqy1rzpxdqcfl57a8z7z48pm733sfqr8yl"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bed" "bin/bed"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/bed"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "binary editor written in Go")
    (description
     "Binary editor written in Go.  This package provides the pre-built binary release.")
    (home-page "https://github.com/itchyny/bed")
    (license license:expat)))

(define-public uvtools-bin
  (package
    (name "uvtools-bin")
    (version "6.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sn4k3/UVtools/releases/download/v6.0.3/UVtools_linux-x64_v6.0.3.AppImage")
              (sha256
               (base32
                "1amla4h7axzm41k7fm1vr2gjvfmhlp2f8jcmv4gh56bn6pblia38"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("UVtools.AppImage" "bin/uvtools"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "uvtools.AppImage")
              (chmod "uvtools.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation")
    (description
     "MSLA/DLP, file analysis, calibration, repair, conversion and manipulation.  This package provides the pre-built binary release.")
    (home-page "https://github.com/sn4k3/UVtools")
    (license license:expat)))

(define-public amoxide-tui-bin
  (package
    (name "amoxide-tui-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sassman/amoxide-rs/releases/download/v"
                    version
                    "/amoxide-tui-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "022zna2vxm1h58149fsb388bg5fwc0pd4p693d8ff9j6f78bk1b7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("amoxide-tui" "bin/amoxide-tui"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/amoxide-tui"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "like direnv, but for aliases. Define aliases per project, per toolchain, or...")
    (description
     "Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically.  This package provides the pre-built binary release.")
    (home-page "https://github.com/sassman/amoxide-rs")
    (license license:gpl3+)))

(define-public amoxide-bin
  (package
    (name "amoxide-bin")
    (version "0.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/sassman/amoxide-rs/releases/download/v"
                    version
                    "/amoxide-tui-x86_64-unknown-linux-gnu.tar.xz"))
              (sha256
               (base32
                "022zna2vxm1h58149fsb388bg5fwc0pd4p693d8ff9j6f78bk1b7"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("amoxide-tui" "bin/amoxide"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/amoxide"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "like direnv, but for aliases. Define aliases per project, per toolchain, or...")
    (description
     "Like direnv, but for aliases. Define aliases per project, per toolchain, or globally — and load the right ones automatically.  This package provides the pre-built binary release.")
    (home-page "https://github.com/sassman/amoxide-rs")
    (license license:gpl3+)))

(define-public lc-bin
  (package
    (name "lc-bin")
    (version "1.3.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/boyter/lc/releases/download/v1.3.1/lc-1.3.1-x86_64-unknown-linux.zip")
              (sha256
               (base32
                "1fbx8vihlhbyw19a1jchp654y12qn5h150bxbhka39fp5spdsxph"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("lc" "bin/lc"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/lc"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list unzip patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A command line application which scans directories and identifies what soft...")
    (description
     "A command line application which scans directories and identifies what software license things are under.  This package provides the pre-built binary release.")
    (home-page "https://github.com/boyter/lc")
    (license license:agpl3)))

(define-public bun-bin
  (package
    (name "bun-bin")
    (version "1.2.13")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/oven-sh/bun/releases/download/bun-v"
                    version
                    "/bun-linux-x64.zip"))
              (sha256
               (base32
                "0071c883sylqly3jav34dn1s5i4qfz79nny5fcj3y65fgv2f9clb"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bun" "bin/bun"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "unzip" source)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/bun"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list unzip patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "all-in-one JavaScript runtime built for speed, with bundler, transpiler, te...")
    (description
     "All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs.  This package provides the pre-built binary release.")
    (home-page "https://github.com/oven-sh/bun")
    (license license:expat)))

(define-public micromamba-bin
  (package
    (name "micromamba-bin")
    (version "2.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mamba-org/micromamba-releases/releases/latest/download/micromamba-linux-64")
              (sha256
               (base32
                "001bhnwr16p5avh5hcqksfz2w8ydiy5hd8rhslr583kmn37p2if0"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("micromamba" "bin/micromamba"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "micromamba")
              (chmod "micromamba" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/micromamba"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "tiny version of mamba, the fast conda package installer")
    (description
     "Tiny version of mamba, the fast conda package installer.  This package provides the pre-built binary release.")
    (home-page "https://github.com/mamba-org/mamba")
    (license license:bsd-3)))

(define-public siyuan-bin
  (package
    (name "siyuan-bin")
    (version "3.1.25")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/siyuan-note/siyuan/releases/download/v3.1.25/siyuan-3.1.25-linux.tar.gz")
              (sha256
               (base32
                "1ym27286vvjzfx9qpvcpafmrhmachdq6qwhxkp0g49zgf4m5sp8s"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("SiYuan/" "share/siyuan/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/siyuan"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "auto upload to AUR when SiYuan stable release")
    (description
     "auto upload to AUR when SiYuan stable release.  This package provides the pre-built binary release.")
    (home-page "https://b3log.org/siyuan")
    (license license:agpl3)))

(define-public blockbench-bin
  (package
    (name "blockbench-bin")
    (version "4.12.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/JannisX11/blockbench/releases/download/v4.12.4/Blockbench_4.12.4.AppImage")
              (sha256
               (base32
                "0j1r7r0pxw27lllr1mh66s1qi6y8c32mkij9xkp4n5w7a7c5bfa2"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("Blockbench.AppImage" "bin/blockbench"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "blockbench.AppImage")
              (chmod "blockbench.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A low-poly 3D model editor")
    (description
     "A low-poly 3D model editor.  This package provides the pre-built binary release.")
    (home-page "https://blockbench.net")
    (license license:gpl3+)))

(define-public soar-bin
  (package
    (name "soar-bin")
    (version "0.5.3")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/pkgforge/soar/releases/download/v"
                    version
                    "/soar-x86_64-Linux"))
              (sha256
               (base32
                "06fd2dpj6qqzbi0w3agvn591zgck4vhx70ixmkacwfjdv6bc7p0d"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("soar" "bin/soar"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "soar")
              (chmod "soar" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/soar"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A fast, modern package manager for Static Binaries, Portable Formats (AppIm...")
    (description
     "A fast, modern package manager for Static Binaries, Portable Formats (AppImage|AppBundle|FlatImage|Runimage) & More.(Prebuilt version).  This package provides the pre-built binary release.")
    (home-page "https://soar.qaidvoid.dev/")
    (license license:expat)))

(define-public oh-my-posh-bin
  (package
    (name "oh-my-posh-bin")
    (version "25.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v"
                    version
                    "/posh-linux-amd64"))
              (sha256
               (base32
                "06nz35hmpvs3ji3n2hfw0xchk4ykj8rcgwj3dgw99i5kwk6m43q8"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("oh-my-posh" "bin/oh-my-posh"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "oh-my-posh")
              (chmod "oh-my-posh" #o755)))
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/oh-my-posh"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A prompt theme engine for any shell")
    (description
     "A prompt theme engine for any shell.  This package provides the pre-built binary release.")
    (home-page "https://github.com/JanDeDobbeleer/oh-my-posh")
    (license license:expat)))

(define-public piper-tts-bin
  (package
    (name "piper-tts-bin")
    (version "2023.11.14-2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rhasspy/piper/releases/download/"
                    version
                    "/piper_linux_x86_64.tar.gz"))
              (sha256
               (base32
                "14jr49pa58x7sbkcpj4c745blxvqf5hb7haqszvg2yjv6mgv8355"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("piper" "bin/piper") ("lib/" "lib/piper/") ("espeak-ng-data/" "share/piper/espeak-ng-data/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/piper"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "A fast, local neural text to speech system")
    (description
     "A fast, local neural text to speech system.  This package provides the pre-built binary release.")
    (home-page "https://github.com/rhasspy/piper")
    (license license:expat)))

(define-public kopia-ui-bin
  (package
    (name "kopia-ui-bin")
    (version "0.22.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kopia/kopia/releases/download/v0.22.3/kopia-ui_0.22.3_amd64.deb")
              (sha256
               (base32
                "0d642y7jc66wk8z0l85pii2klrz67rwaj4yd2mg0mjf3ckcvzf3d"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'None
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "ar" "x" source)
              (invoke "tar" "xf" "data.tar.xz"))))))
    (native-inputs (list binutils))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cross-platform backup-tool with encryption, deduplication, compression an...")
    (description
     "A cross-platform backup-tool with encryption, deduplication, compression and cloud support.  This package provides the pre-built binary release.")
    (home-page "https://kopia.io/")
    (license license:asl2.0)))

(define-public panwriter-bin
  (package
    (name "panwriter-bin")
    (version "0.8.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mb21/panwriter/releases/download/v0.8.10/PanWriter-0.8.10.AppImage")
              (sha256
               (base32
                "0hg9191dba4zbhlmbg4l0h3ypfl6fkc1kivirb7dy8wl2sgqhflr"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("PanWriter.AppImage" "bin/panwriter"))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (copy-file source "panwriter.AppImage")
              (chmod "panwriter.AppImage" #o755))))))
    (supported-systems '("x86_64-linux"))
    (synopsis "markdown editor with pandoc integration and paginated preview.(Prebuilt ver...")
    (description
     "Markdown editor with pandoc integration and paginated preview.(Prebuilt version.Use system-wide electron).  This package provides the pre-built binary release.")
    (home-page "https://panwriter.com/")
    (license license:gpl3+)))

(define-public mongosh-bin
  (package
    (name "mongosh-bin")
    (version "2.5.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://downloads.mongodb.com/compass/mongosh-"
                    version
                    "-linux-x64.tgz"))
              (sha256
               (base32
                "004gycmjc2s2qaak2xlswahfw9ng1g01aiwrcqmirqad5d7w9pyi"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("bin/mongosh" "bin/mongosh"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/mongosh"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "an interactive shell to connect with MongoDB with syntax highlighting, auto...")
    (description
     "An interactive shell to connect with MongoDB with syntax highlighting, autocomplete, contextual help and error messages.  This package provides the pre-built binary release.")
    (home-page "https://github.com/mongodb-js/mongosh.git")
    (license license:asl2.0)))

(define-public sheets-bin
  (package
    (name "sheets-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/maaslalani/sheets/releases/download/v"
                    version
                    "/sheets_Linux_x86_64.tar.gz"))
              (sha256
               (base32
                "0scwds0xn9wpgv8v4x47sfizqyna13kfhahj6v6p2iyzl9id2s2q"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("sheets" "bin/sheets"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/sheets"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal based spreadsheet tool")
    (description
     "Terminal based spreadsheet tool.  This package provides the pre-built binary release.")
    (home-page "https://github.com/maaslalani/sheets")
    (license license:expat)))

(define-public fcitx5-vinput-bin
  (package
    (name "fcitx5-vinput-bin")
    (version "2.1.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/xifan2333/fcitx5-vinput/releases/download/v2.1.8/fcitx5-vinput_2.1.8-1_linux_x86_64_bundled.tar.gz")
              (sha256
               (base32
                "0ysrbpxc9dgrir0v4ywcmwqi8p7wc7jm7k01k1jh6q2pbikgaxva"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "share/fcitx5-vinput/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'patch-elf
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin/fcitx5-vinput"))
                     (ld-so (search-input-file inputs
                                              "lib/ld-linux-x86-64.so.2"))
                     (rpath (string-join
                             (list (dirname ld-so)
                                   (dirname
                                    (search-input-file inputs
                                                       "lib/libgcc_s.so.1")))
                             ":")))
                (when (file-exists? bin)
                  (invoke "patchelf" "--set-interpreter" ld-so bin)
                  (invoke "patchelf" "--set-rpath" rpath bin))))))))
    (native-inputs (list patchelf))
    (inputs (list (list gcc "lib") glibc))
    (supported-systems '("x86_64-linux"))
    (synopsis "offline voice input addon for Fcitx5 with optional OpenAI-compatible postpr...")
    (description
     "Offline voice input addon for Fcitx5 with optional OpenAI-compatible postprocess.  This package provides the pre-built binary release.")
    (home-page "https://github.com/xifan2333/fcitx5-vinput")
    (license license:gpl3+)))
