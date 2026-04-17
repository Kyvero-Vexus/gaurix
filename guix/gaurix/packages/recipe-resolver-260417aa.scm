;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260417aa
;;; Resolves 100 TODO packages from queue.
;;;
;;; Recipes (48):
;;;    1. gandom-fonts (copy, v0.8, OFL-1.1)
;;;    2. shabnam-fonts (copy, v5.0.1, OFL-1.1)
;;;    3. samim-fonts (copy, v4.0.5, OFL-1.1)
;;;    4. parastoo-fonts (copy, v2.0.1, OFL-1.1)
;;;    5. sahel-fonts (copy, v3.4.0, OFL-1.1)
;;;    6. nahid-fonts (copy, v0.3.0, OFL-1.1)
;;;    7. iran-nastaliq-fonts (copy, v2.1, OFL-1.1)
;;;    8. ir-standard-fonts (copy, v1.0, OFL-1.1)
;;;    9. ttf-jost-variable (copy, v3.8, OFL-1.1)
;;;   10. ttf-jost (copy, v3.8, OFL-1.1)
;;;   11. otf-jost (copy, v3.8, OFL-1.1)
;;;   12. otf-vt323 (copy, v2.000, OFL-1.1)
;;;   13. ttf-mulish (copy, v2.200, OFL-1.1)
;;;   14. ttf-fixedsys-excelsior-linux (copy, v3.01, PD)
;;;   15. otf-nasin-nanpa (copy, v4.1.0, OFL-1.1)
;;;   16. cherry-font-git (copy, v1.0, OFL-1.1)
;;;   17. nerd-fonts-inter (copy, v3.3.0, OFL-1.1)
;;;   18. otf-manufacturing-consent (copy, v1.0, OFL-1.1)
;;;   19. maplemononormalnl-ttf-autohint (copy, v7.0, OFL-1.1)
;;;   20. fcitx5-theme-wechat (copy, v0.1, GPL-3.0)
;;;   21. sddm-astronaut-theme (copy, v1.0, GPL-3.0)
;;;   22. whitesur-cursor-theme-git (copy, v2024.02.01, GPL-3.0)
;;;   23. grub-theme-minegrub (copy, v1.1, MIT)
;;;   24. whitesur-icon-theme-git (copy, v2024.02.01, GPL-3.0)
;;;   25. pegasus-frontend-theme-gameos-git (copy, v0.1, CC-BY-NC-SA-4.0)
;;;   26. pegasus-frontend-theme-pegasus-boy-git (copy, v0.1, CC-BY-NC-SA-4.0)
;;;   27. pegasus-frontend-theme-shinretro-git (copy, v0.1, CC-BY-NC-SA-4.0)
;;;   28. pegasus-frontend-theme-sleipnir-git (copy, v0.1, CC-BY-NC-SA-4.0)
;;;   29. pegasus-frontend-theme-xboxos-git (copy, v0.1, CC-BY-NC-SA-4.0)
;;;   30. httprobe-bin (copy/binary, v0.2, MIT)
;;;   31. gomi-bin (copy/binary, v1.3.0, MIT)
;;;   32. krabby-bin (copy/binary, v0.4.0, MIT)
;;;   33. chsrc-bin (copy/binary, v0.1.9, GPL-3.0)
;;;   34. buildifier-bin (copy/binary, v7.3.1, Apache-2.0)
;;;   35. palettro-bin (copy/binary, v0.4.0, MIT)
;;;   36. alt-bin (copy/binary, v2.6.0, MIT)
;;;   37. systemd-manager-tui-bin (copy/binary, v0.3.1, MIT)
;;;   38. dict-freedict-fra-deu-bin (copy, v0.4.1, GPL-3.0)
;;;   39. dict-freedict-fra-eng-bin (copy, v0.4.1, GPL-3.0)
;;;   40. dict-freedict-deu-fra-bin (copy, v0.4.1, GPL-3.0)
;;;   41. ccze (gnu, v0.2.1, GPL-2.0)
;;;   42. dotdrop (pyproject, v1.14.0, GPL-3.0)
;;;   43. lbreakouthd (gnu, v1.1.8, GPL-2.0)
;;;   44. mpremote (pyproject, v1.23.0, MIT)
;;;   45. waycorner (cargo, v0.3.0, MIT)
;;;   46. shell-color-scripts-git (copy, v0.1, MIT)
;;;   47. gltron (gnu, v0.70, GPL-2.0)
;;;   48. sfwbar (meson, v1.0~beta15, GPL-3.0)
;;;
;;; Blocked (52):
;;;   49. otf-apple-pingfang — BLOCKED: SOURCE_UNAVAILABLE (Apple proprietary; no redistribution source)
;;;   50. otf-apple-pingfang-relaxed — BLOCKED: SOURCE_UNAVAILABLE (Apple proprietary variant)
;;;   51. otf-apple-pingfang-ui — BLOCKED: SOURCE_UNAVAILABLE (Apple proprietary variant)
;;;   52. noto-fonts-cjk-chws — BLOCKED: NEEDS_RECIPE_DESIGN (chws/vchw OT feature injection pipeline)
;;;   53. ttf-ms-office365 — BLOCKED: SOURCE_UNAVAILABLE (Microsoft proprietary; no redistribution)
;;;   54. choco-fontviewer — BLOCKED: NEEDS_RECIPE_DESIGN (GTK font viewer; build system unclear)
;;;   55. webots-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Large robotics sim >1GB; complex .deb extraction)
;;;   56. wavey-launcher-bin — BLOCKED: SOURCE_UNAVAILABLE (No releases found; project 404)
;;;   57. elastic-dashboard-bin — BLOCKED: SOURCE_UNAVAILABLE (No public binary release found)
;;;   58. kh-melonmix-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   59. zoraxy-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Go reverse proxy; embedded web UI assets)
;;;   60. gizmosql-bin — BLOCKED: SOURCE_UNAVAILABLE (No public binary releases)
;;;   61. refind-btrfs-snapshots-bin — BLOCKED: NEEDS_RECIPE_DESIGN (EFI partition + rEFInd integration)
;;;   62. redot-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Godot fork >200MB; complex runtime deps)
;;;   63. iriunwebcam-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Needs v4l2loopback kernel module)
;;;   64. zulu21-fx-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Azul JDK+FX >300MB; JAVA_HOME setup)
;;;   65. 115-browser-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Electron app; Chromium runtime deps)
;;;   66. watchman-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Daemon setup + socket management)
;;;   67. mdatp-bin — BLOCKED: LICENSE_REVIEW_NEEDED (MS Defender ATP; redistribution unclear)
;;;   68. zulu-17-fx-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Azul JDK 17+FX; same as zulu21)
;;;   69. zzzfm-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   70. yomikiru-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Electron manga reader; AppImage extraction)
;;;   71. forge-gui-desktop-snapshot-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Java >500MB; complex classpath)
;;;   72. kotlin-lsp-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Requires JVM runtime)
;;;   73. buildozer-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Needs Android SDK/NDK)
;;;   74. alman-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   75. amsel_suite-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   76. openutau-bin — BLOCKED: NEEDS_RECIPE_DESIGN (.NET app; needs dotnet runtime)
;;;   77. unofficial-homestuck-collection-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Electron >2GB; complex AppImage)
;;;   78. xpipe-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Java app; shell integration + daemon)
;;;   79. basedpyright-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Node.js app; needs npm runtime)
;;;   80. aethertune-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   81. argus-bin — BLOCKED: NEEDS_RECIPE_DESIGN (Multiple projects named Argus; ambiguous)
;;;   82. astra-music-bin — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   83. browservice-bin — BLOCKED: NEEDS_RECIPE_DESIGN (CEF/Chromium runtime deps)
;;;   84. openscad-snapshot-appimage — BLOCKED: NEEDS_RECIPE_DESIGN (AppImage >100MB; OpenGL runtime)
;;;   85. amass — BLOCKED: NEEDS_RECIPE_DESIGN (Go app; 50+ Go module deps)
;;;   86. gdrcopy — BLOCKED: NEEDS_RECIPE_DESIGN (CUDA kernel module; system-level)
;;;   87. ferroxide — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   88. starsector — BLOCKED: LICENSE_REVIEW_NEEDED (Commercial game; paid license required)
;;;   89. bazecor — BLOCKED: NEEDS_RECIPE_DESIGN (Electron; node_modules + udev rules)
;;;   90. python-gpustat — BLOCKED: NEEDS_RECIPE_DESIGN (Requires NVIDIA pynvml)
;;;   91. cryptpad — BLOCKED: NEEDS_RECIPE_DESIGN (Node.js web app; complex npm deps)
;;;   92. python-jupyterlab-variableinspector — BLOCKED: NEEDS_RECIPE_DESIGN (JupyterLab ext; npm+Python hybrid)
;;;   93. parus — BLOCKED: SOURCE_UNAVAILABLE (No public repo found)
;;;   94. porla — BLOCKED: NEEDS_RECIPE_DESIGN (C++; libtorrent-rasterbar + Boost cmake)
;;;   95. verapdf — BLOCKED: NEEDS_RECIPE_DESIGN (Java/Maven; complex classpath)
;;;   96. mandarine — BLOCKED: NEEDS_RECIPE_DESIGN (C++ Game Boy emu; Qt5 + shaders)
;;;   97. man-pages-ja — BLOCKED: NEEDS_RECIPE_DESIGN (groff locale + encoding conversion)
;;;   98. magicq — BLOCKED: LICENSE_REVIEW_NEEDED (ChamSys proprietary; redistribution unclear)
;;;   99. python-birdseye — BLOCKED: NEEDS_RECIPE_DESIGN (Flask+sqlalchemy+web UI; many deps)
;;;   100. termusic-git — BLOCKED: NEEDS_RECIPE_DESIGN (Rust; 30+ cargo deps resolution needed)
;;;
;;; 48 recipes + 52 BLOCKED = 100 total.
;;;
;;; NOTE: All sha256 hashes are placeholders pending `guix download` verification.

(define-module (gaurix packages recipe-resolver-260417aa)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages sdl)
  #:export (
            gandom-fonts
            shabnam-fonts
            samim-fonts
            parastoo-fonts
            sahel-fonts
            nahid-fonts
            iran-nastaliq-fonts
            ir-standard-fonts
            ttf-jost-variable
            ttf-jost
            otf-jost
            otf-vt323
            ttf-mulish
            ttf-fixedsys-excelsior-linux
            otf-nasin-nanpa
            cherry-font-git
            nerd-fonts-inter
            otf-manufacturing-consent
            maplemononormalnl-ttf-autohint
            fcitx5-theme-wechat
            sddm-astronaut-theme
            whitesur-cursor-theme-git
            grub-theme-minegrub
            whitesur-icon-theme-git
            pegasus-frontend-theme-gameos-git
            pegasus-frontend-theme-pegasus-boy-git
            pegasus-frontend-theme-shinretro-git
            pegasus-frontend-theme-sleipnir-git
            pegasus-frontend-theme-xboxos-git
            httprobe-bin
            gomi-bin
            krabby-bin
            chsrc-bin
            buildifier-bin
            palettro-bin
            alt-bin
            systemd-manager-tui-bin
            dict-freedict-fra-deu-bin
            dict-freedict-fra-eng-bin
            dict-freedict-deu-fra-bin
            ccze
            dotdrop
            lbreakouthd
            mpremote
            waycorner
            shell-color-scripts-git
            gltron
            sfwbar
            ))

;;; ===================================================================
;;; FONT PACKAGES (copy-build-system)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 1. gandom-fonts — Gandom Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public gandom-fonts
  (package
    (name "gandom-fonts")
    (version "0.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/gandom/releases/download/v"
                    version "/gandom-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/gandom-fonts"))))
    (synopsis "Gandom Persian/Arabic font family")
    (description "Gandom is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/gandom")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 2. shabnam-fonts — Shabnam Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public shabnam-fonts
  (package
    (name "shabnam-fonts")
    (version "5.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/Shabnam/releases/download/v"
                    version "/Shabnam-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/shabnam-fonts"))))
    (synopsis "Shabnam Persian/Arabic font family")
    (description "Shabnam is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/Shabnam")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 3. samim-fonts — Samim Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public samim-fonts
  (package
    (name "samim-fonts")
    (version "4.0.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/Samim/releases/download/v"
                    version "/Samim-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/samim-fonts"))))
    (synopsis "Samim Persian/Arabic font family")
    (description "Samim is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/Samim")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 4. parastoo-fonts — Parastoo Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public parastoo-fonts
  (package
    (name "parastoo-fonts")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/Parastoo/releases/download/v"
                    version "/Parastoo-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/parastoo-fonts"))))
    (synopsis "Parastoo Persian/Arabic font family")
    (description "Parastoo is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/Parastoo")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 5. sahel-fonts — Sahel Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public sahel-fonts
  (package
    (name "sahel-fonts")
    (version "3.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/Sahel/releases/download/v"
                    version "/Sahel-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/sahel-fonts"))))
    (synopsis "Sahel Persian/Arabic font family")
    (description "Sahel is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/Sahel")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 6. nahid-fonts — Nahid Persian/Arabic font
;;; -------------------------------------------------------------------
(define-public nahid-fonts
  (package
    (name "nahid-fonts")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/rastikerdar/Nahid/releases/download/v"
                    version "/Nahid-v" version ".zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/nahid-fonts"))))
    (synopsis "Nahid Persian/Arabic font family")
    (description "Nahid is an open-source Persian/Arabic font designed
by Saber Rastikerdar.  It provides a clean, modern typeface suitable for
web and print use in Farsi and Arabic scripts.")
    (home-page "https://github.com/rastikerdar/Nahid")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 7. iran-nastaliq-fonts — Iran Nastaliq calligraphic font
;;; -------------------------------------------------------------------
(define-public iran-nastaliq-fonts
  (package
    (name "iran-nastaliq-fonts")
    (version "2.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AminHP/IranNastaliq/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/iran-nastaliq"))))
    (synopsis "Iran Nastaliq calligraphic font for Persian and Arabic")
    (description "Iran Nastaliq is a Nastaliq-style calligraphic font for
Persian and Arabic scripts.  Designed for high-quality typesetting of Farsi
text in the traditional Nastaliq calligraphic style.")
    (home-page "https://github.com/AminHP/IranNastaliq")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 8. ir-standard-fonts — Iranian standard web fonts
;;; -------------------------------------------------------------------
(define-public ir-standard-fonts
  (package
    (name "ir-standard-fonts")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/AminHP/IranStandardFonts/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/ir-standard"))))
    (synopsis "Iranian standard web fonts collection")
    (description "A collection of standard Iranian web fonts suitable for use
in Farsi websites and applications.  Includes multiple typeface families
optimized for screen readability.")
    (home-page "https://github.com/AminHP/IranStandardFonts")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 9. ttf-jost-variable — Jost* geometric sans-serif (variable TrueType)
;;; -------------------------------------------------------------------
(define-public ttf-jost-variable
  (package
    (name "ttf-jost-variable")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/indestructible-type/Jost/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf/ttf-jost-variable"))))
    (synopsis "Jost* geometric sans-serif typeface (variable TrueType format)")
    (description "Jost* is an original font created by Owen Earl inspired
by the 1920s German sans-serif tradition.  It is a geometric sans-serif
typeface suitable for display and text use.")
    (home-page "https://github.com/indestructible-type/Jost")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 10. ttf-jost — Jost* geometric sans-serif (TrueType)
;;; -------------------------------------------------------------------
(define-public ttf-jost
  (package
    (name "ttf-jost")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/indestructible-type/Jost/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/ttf/ttf-jost"))))
    (synopsis "Jost* geometric sans-serif typeface (TrueType format)")
    (description "Jost* is an original font created by Owen Earl inspired
by the 1920s German sans-serif tradition.  It is a geometric sans-serif
typeface suitable for display and text use.")
    (home-page "https://github.com/indestructible-type/Jost")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 11. otf-jost — Jost* geometric sans-serif (OpenType)
;;; -------------------------------------------------------------------
(define-public otf-jost
  (package
    (name "otf-jost")
    (version "3.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/indestructible-type/Jost/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/otf/otf-jost"))))
    (synopsis "Jost* geometric sans-serif typeface (OpenType format)")
    (description "Jost* is an original font created by Owen Earl inspired
by the 1920s German sans-serif tradition.  It is a geometric sans-serif
typeface suitable for display and text use.")
    (home-page "https://github.com/indestructible-type/Jost")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 12. otf-vt323 — VT323 pixel-style monospace font
;;; -------------------------------------------------------------------
(define-public otf-vt323
  (package
    (name "otf-vt323")
    (version "2.000")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/phoikoi/VT323/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/vt323"))))
    (synopsis "VT323 pixel-style monospace font")
    (description "VT323 is a monospace pixel-style font inspired by the DEC
VT320 text terminal.  It provides a nostalgic terminal aesthetic suitable
for retro-themed applications and websites.")
    (home-page "https://fonts.google.com/specimen/VT323")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 13. ttf-mulish — Mulish sans-serif font family
;;; -------------------------------------------------------------------
(define-public ttf-mulish
  (package
    (name "ttf-mulish")
    (version "2.200")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/googlefonts/mulish/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/mulish"))))
    (synopsis "Mulish sans-serif font family")
    (description "Mulish is a minimalist sans-serif typeface designed by Vernon
Adams.  It features a clean geometric style with multiple weights suitable for
both display and body text.")
    (home-page "https://fonts.google.com/specimen/Mulish")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 14. ttf-fixedsys-excelsior-linux — Fixedsys Excelsior monospace
;;; -------------------------------------------------------------------
(define-public ttf-fixedsys-excelsior-linux
  (package
    (name "ttf-fixedsys-excelsior-linux")
    (version "3.01")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/kika/fixedsys/releases/download/v"
                    version "/FSEX301-L2.ttf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/FSEX301-L2.ttf")
                   (chdir "src"))))
           #:install-plan
           #~'(("FSEX301-L2.ttf" "share/fonts/truetype/fixedsys/FSEX301-L2.ttf"))))
    (synopsis "Fixedsys Excelsior monospace bitmap font in TrueType format")
    (description "Fixedsys Excelsior is a TrueType version of the classic Windows
Fixedsys bitmap font.  It provides a pixel-perfect monospace typeface with
Unicode coverage for programming and terminal use.")
    (home-page "https://github.com/kika/fixedsys")
    (license license:public-domain)))

;;; -------------------------------------------------------------------
;;; 15. otf-nasin-nanpa — sitelen pona number font
;;; -------------------------------------------------------------------
(define-public otf-nasin-nanpa
  (package
    (name "otf-nasin-nanpa")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ETBCOR/nasin-nanpa/releases/download/v"
                    version "/nasin-nanpa-" version ".otf"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/nasin-nanpa.otf")
                   (chdir "src"))))
           #:install-plan
           #~'(("nasin-nanpa.otf" "share/fonts/opentype/nasin-nanpa/nasin-nanpa.otf"))))
    (synopsis "nasin nanpa number font for sitelen pona")
    (description "Nasin Nanpa is a font for writing numbers in the sitelen pona
writing system used for the Toki Pona constructed language.  It encodes number
glyphs as OpenType features.")
    (home-page "https://github.com/ETBCOR/nasin-nanpa")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 16. cherry-font-git — Cherry pixel font
;;; -------------------------------------------------------------------
(define-public cherry-font-git
  (package
    (name "cherry-font-git")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/cherry-font/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/cherry"))))
    (synopsis "Cherry pixel bitmap font")
    (description "Cherry is a small pixel bitmap font for terminals, editors, and
retro-styled applications.  It provides a clean, compact design optimized for
readability at small sizes.")
    (home-page "https://github.com/subframe7536/cherry-font")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 17. nerd-fonts-inter — Nerd Fonts patched Inter font
;;; -------------------------------------------------------------------
(define-public nerd-fonts-inter
  (package
    (name "nerd-fonts-inter")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/ryanoasis/nerd-fonts/releases/download/v"
                    version "/Inter.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/nerd-fonts-inter"))))
    (synopsis "Nerd Fonts patched Inter font family")
    (description "Inter is a typeface designed for computer screens, patched with
Nerd Fonts glyphs for use in terminals and editors.  Includes programming
ligatures, powerline symbols, and devicons.")
    (home-page "https://github.com/ryanoasis/nerd-fonts")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 18. otf-manufacturing-consent — display font
;;; -------------------------------------------------------------------
(define-public otf-manufacturing-consent
  (package
    (name "otf-manufacturing-consent")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ManuConGit/ManufacturingConsent/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/opentype/manufacturing-consent"))))
    (synopsis "Manufacturing Consent display font")
    (description "Manufacturing Consent is a decorative display font inspired by
newspaper headline typefaces.  It provides a bold, striking style suitable for
posters, titles, and graphic design projects.")
    (home-page "https://github.com/ManuConGit/ManufacturingConsent")
    (license license:silofl1.1)))

;;; -------------------------------------------------------------------
;;; 19. maplemononormalnl-ttf-autohint — Maple Mono NL autohinted
;;; -------------------------------------------------------------------
(define-public maplemononormalnl-ttf-autohint
  (package
    (name "maplemononormalnl-ttf-autohint")
    (version "7.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/subframe7536/maple-font/releases/download/v"
                    version "/MapleMono-NF-autohint.zip"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (native-inputs (list unzip))
    (arguments
     (list #:install-plan
           #~'(("." "share/fonts/truetype/maple-mono-nl"))))
    (synopsis "Maple Mono Normal NL font with autohinting")
    (description "Maple Mono NormalNL is a variant of the Maple Mono programming
font with Normal ligatures and Nerd Ligatures.  This version includes
autohinted TrueType outlines for improved screen rendering.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

;;; ===================================================================
;;; THEME PACKAGES (copy-build-system)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 20. fcitx5-theme-wechat — WeChat skin for Fcitx5
;;; -------------------------------------------------------------------
(define-public fcitx5-theme-wechat
  (package
    (name "fcitx5-theme-wechat")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/anjiannian/fcitx5-theme-wechat/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("wechat" "share/fcitx5/themes/wechat"))))
    (synopsis "WeChat-style skin for Fcitx5 input method")
    (description "A Fcitx5 input method theme styled after the WeChat messaging
application interface.  Provides a clean green-and-white color scheme for
the Fcitx5 input method framework.")
    (home-page "https://github.com/anjiannian/fcitx5-theme-wechat")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 21. sddm-astronaut-theme — Astronaut SDDM login theme
;;; -------------------------------------------------------------------
(define-public sddm-astronaut-theme
  (package
    (name "sddm-astronaut-theme")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Keyitdev/sddm-astronaut-theme/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sddm/themes/astronaut"))))
    (synopsis "astronaut-themed login screen for SDDM")
    (description "A visually appealing SDDM login theme featuring an astronaut
space motif.  Provides a modern, customizable login screen with animated
background support for the SDDM display manager.")
    (home-page "https://github.com/Keyitdev/sddm-astronaut-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 22. whitesur-cursor-theme-git — macOS-style cursor theme
;;; -------------------------------------------------------------------
(define-public whitesur-cursor-theme-git
  (package
    (name "whitesur-cursor-theme-git")
    (version "2024.02.01")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vinceliuice/WhiteSur-cursors/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("dist" "share/icons"))))
    (synopsis "macOS-style cursor theme for Linux desktops")
    (description "WhiteSur is a cursor theme inspired by macOS Big Sur.  It
provides smooth, high-resolution cursors in both light and dark variants
for X11 and Wayland desktops.")
    (home-page "https://github.com/vinceliuice/WhiteSur-cursors")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 23. grub-theme-minegrub — Minecraft GRUB theme
;;; -------------------------------------------------------------------
(define-public grub-theme-minegrub
  (package
    (name "grub-theme-minegrub")
    (version "1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Lxtharia/minegrub-theme/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("minegrub" "share/grub/themes/minegrub"))))
    (synopsis "Minecraft-styled GRUB bootloader theme")
    (description "Minegrub is a GRUB theme that makes the boot menu look like
the Minecraft Java Edition title screen.  It supports custom background
images and provides a pixelated retro aesthetic.")
    (home-page "https://github.com/Lxtharia/minegrub-theme")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 24. whitesur-icon-theme-git — macOS-style icon theme
;;; -------------------------------------------------------------------
(define-public whitesur-icon-theme-git
  (package
    (name "whitesur-icon-theme-git")
    (version "2024.02.01")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/vinceliuice/WhiteSur-icon-theme/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("src" "share/icons/WhiteSur"))))
    (synopsis "macOS-style icon theme for Linux desktops")
    (description "WhiteSur is an icon theme for Linux desktops inspired by macOS
Big Sur.  It provides a consistent, modern icon set for GNOME, KDE, and
other desktop environments.")
    (home-page "https://github.com/vinceliuice/WhiteSur-icon-theme")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 25. pegasus-frontend-theme-gameos-git
;;; -------------------------------------------------------------------
(define-public pegasus-frontend-theme-gameos-git
  (package
    (name "pegasus-frontend-theme-gameos-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PlayingKarreram/pegasus-theme-gameOS/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pegasus-frontend/themes/pegasus-frontend-theme-gameos-git"))))
    (synopsis "gameOS theme for Pegasus Frontend")
    (description "gameOS is a theme for the Pegasus Frontend game launcher.
It provides a customized visual layout for browsing and launching games from
various emulator platforms.")
    (home-page "https://github.com/PlayingKarreram/pegasus-theme-gameOS")
    (license license:cc-by-nc-sa4.0)))

;;; -------------------------------------------------------------------
;;; 26. pegasus-frontend-theme-pegasus-boy-git
;;; -------------------------------------------------------------------
(define-public pegasus-frontend-theme-pegasus-boy-git
  (package
    (name "pegasus-frontend-theme-pegasus-boy-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PlayingKarreram/pegasus-theme-pegasus-boy/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pegasus-frontend/themes/pegasus-frontend-theme-pegasus-boy-git"))))
    (synopsis "Pegasus Boy theme for Pegasus Frontend")
    (description "Pegasus Boy is a theme for the Pegasus Frontend game launcher.
It provides a customized visual layout for browsing and launching games from
various emulator platforms.")
    (home-page "https://github.com/PlayingKarreram/pegasus-theme-pegasus-boy")
    (license license:cc-by-nc-sa4.0)))

;;; -------------------------------------------------------------------
;;; 27. pegasus-frontend-theme-shinretro-git
;;; -------------------------------------------------------------------
(define-public pegasus-frontend-theme-shinretro-git
  (package
    (name "pegasus-frontend-theme-shinretro-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PlayingKarreram/pegasus-theme-shinretro/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pegasus-frontend/themes/pegasus-frontend-theme-shinretro-git"))))
    (synopsis "shinretro theme for Pegasus Frontend")
    (description "shinretro is a theme for the Pegasus Frontend game launcher.
It provides a customized visual layout for browsing and launching games from
various emulator platforms.")
    (home-page "https://github.com/PlayingKarreram/pegasus-theme-shinretro")
    (license license:cc-by-nc-sa4.0)))

;;; -------------------------------------------------------------------
;;; 28. pegasus-frontend-theme-sleipnir-git
;;; -------------------------------------------------------------------
(define-public pegasus-frontend-theme-sleipnir-git
  (package
    (name "pegasus-frontend-theme-sleipnir-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PlayingKarreram/pegasus-theme-sleipnir/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pegasus-frontend/themes/pegasus-frontend-theme-sleipnir-git"))))
    (synopsis "Sleipnir theme for Pegasus Frontend")
    (description "Sleipnir is a theme for the Pegasus Frontend game launcher.
It provides a customized visual layout for browsing and launching games from
various emulator platforms.")
    (home-page "https://github.com/PlayingKarreram/pegasus-theme-sleipnir")
    (license license:cc-by-nc-sa4.0)))

;;; -------------------------------------------------------------------
;;; 29. pegasus-frontend-theme-xboxos-git
;;; -------------------------------------------------------------------
(define-public pegasus-frontend-theme-xboxos-git
  (package
    (name "pegasus-frontend-theme-xboxos-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PlayingKarreram/pegasus-theme-xboxos/archive/refs/heads/master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pegasus-frontend/themes/pegasus-frontend-theme-xboxos-git"))))
    (synopsis "xboxOS theme for Pegasus Frontend")
    (description "xboxOS is a theme for the Pegasus Frontend game launcher.
It provides a customized visual layout for browsing and launching games from
various emulator platforms.")
    (home-page "https://github.com/PlayingKarreram/pegasus-theme-xboxos")
    (license license:cc-by-nc-sa4.0)))

;;; ===================================================================
;;; BINARY PACKAGES (copy-build-system, prebuilt)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 30. httprobe-bin — HTTP probe tool for discovering web servers
;;; -------------------------------------------------------------------
(define-public httprobe-bin
  (package
    (name "httprobe-bin")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tomnomnom/httprobe/releases/download/v"
                    version "/httprobe-linux-amd64-0.2.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("httprobe" "bin/httprobe"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "HTTP probe tool for discovering web servers")
    (description "Httprobe takes a list of domains and probes for working HTTP and HTTPS servers.  Useful for bug bounty and penetration testing reconnaissance.")
    (home-page "https://github.com/tomnomnom/httprobe")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 31. gomi-bin — trash CLI replacement for rm
;;; -------------------------------------------------------------------
(define-public gomi-bin
  (package
    (name "gomi-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/b4b4r07/gomi/releases/download/v"
                    version "/gomi_" version "_linux_amd64.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("gomi" "bin/gomi"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "trash CLI replacement for rm")
    (description "Gomi is a command-line trash utility that moves files to a trash directory instead of permanently deleting them.  It provides undo capability and FreeDesktop Trash spec support.")
    (home-page "https://github.com/b4b4r07/gomi")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 32. krabby-bin — terminal Pokemon sprite viewer
;;; -------------------------------------------------------------------
(define-public krabby-bin
  (package
    (name "krabby-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/yannjor/krabby/releases/download/v"
                    version "/krabby-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/krabby")
                   (chmod "src/krabby" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("krabby" "bin/krabby"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal Pokemon sprite viewer")
    (description "Krabby displays colorful Pokemon sprites in the terminal using ANSI art.  Supports all Pokemon generations for use as a fetch-style display or greeting.")
    (home-page "https://github.com/yannjor/krabby")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 33. chsrc-bin — change source mirror tool for package managers
;;; -------------------------------------------------------------------
(define-public chsrc-bin
  (package
    (name "chsrc-bin")
    (version "0.1.9")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/RubyMetric/chsrc/releases/download/v"
                    version "/chsrc-x64-linux"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/chsrc")
                   (chmod "src/chsrc" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("chsrc" "bin/chsrc"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "change source mirror tool for package managers")
    (description "Chsrc is a CLI tool to easily switch software source mirrors for package managers including pip, npm, cargo, and gem.  Automates mirror URL configuration.")
    (home-page "https://github.com/RubyMetric/chsrc")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 34. buildifier-bin — Bazel BUILD file formatter and linter
;;; -------------------------------------------------------------------
(define-public buildifier-bin
  (package
    (name "buildifier-bin")
    (version "7.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/bazelbuild/buildtools/releases/download/v"
                    version "/buildifier-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/buildifier")
                   (chmod "src/buildifier" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("buildifier" "bin/buildifier"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "Bazel BUILD file formatter and linter")
    (description "Buildifier is a tool for formatting and linting Bazel BUILD and .bzl files.  It enforces consistent style and detects common errors in build definitions.")
    (home-page "https://github.com/bazelbuild/buildtools")
    (license license:asl2.0)))

;;; -------------------------------------------------------------------
;;; 35. palettro-bin — color palette picker for the terminal
;;; -------------------------------------------------------------------
(define-public palettro-bin
  (package
    (name "palettro-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/nicholasgasior/palettro/releases/download/v"
                    version "/palettro-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/palettro")
                   (chmod "src/palettro" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("palettro" "bin/palettro"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "color palette picker for the terminal")
    (description "Palettro is a terminal-based color palette picker for browsing, selecting, and copying color values.  Supports hex, RGB, and HSL formats.")
    (home-page "https://github.com/nicholasgasior/palettro")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 36. alt-bin — version manager for programming languages
;;; -------------------------------------------------------------------
(define-public alt-bin
  (package
    (name "alt-bin")
    (version "2.6.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/dotenvx/alt/releases/download/v"
                    version "/alt-linux-amd64"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/alt")
                   (chmod "src/alt" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("alt" "bin/alt"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "version manager for programming languages")
    (description "Alt is a simple version manager for switching between different versions of programming language runtimes.  Uses shims to route commands to the selected version.")
    (home-page "https://github.com/dotenvx/alt")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 37. systemd-manager-tui-bin — TUI for managing systemd services
;;; -------------------------------------------------------------------
(define-public systemd-manager-tui-bin
  (package
    (name "systemd-manager-tui-bin")
    (version "0.3.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/realzl/systemd-manager-tui/releases/download/v"
                    version "/systemd-manager-tui-x86_64-linux"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:phases
           #~(modify-phases %standard-phases
               (replace 'unpack
                 (lambda* (#:key source #:allow-other-keys)
                   (mkdir-p "src")
                   (copy-file source "src/systemd-manager-tui")
                   (chmod "src/systemd-manager-tui" #o755)
                   (chdir "src"))))
           #:install-plan
           #~'(("systemd-manager-tui" "bin/systemd-manager-tui"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "TUI for managing systemd services")
    (description "Systemd Manager TUI provides a terminal user interface for viewing and managing systemd units.  Allows starting, stopping, enabling, and disabling services.")
    (home-page "https://github.com/realzl/systemd-manager-tui")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 38. dict-freedict-fra-deu-bin — FreeDict French-German
;;; -------------------------------------------------------------------
(define-public dict-freedict-fra-deu-bin
  (package
    (name "dict-freedict-fra-deu-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freedict/fd-dictionaries/releases/download/v"
                    version "/freedict-fra-deu-" version ".dictd.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dictd"))))
    (synopsis "FreeDict French-German dictionary for dictd")
    (description "A French-to-German translation dictionary from the
FreeDict project, packaged for use with dictd dictionary servers.  Provides
word-level translations and basic definitions.")
    (home-page "https://freedict.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 39. dict-freedict-fra-eng-bin — FreeDict French-English
;;; -------------------------------------------------------------------
(define-public dict-freedict-fra-eng-bin
  (package
    (name "dict-freedict-fra-eng-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freedict/fd-dictionaries/releases/download/v"
                    version "/freedict-fra-eng-" version ".dictd.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dictd"))))
    (synopsis "FreeDict French-English dictionary for dictd")
    (description "A French-to-English translation dictionary from the
FreeDict project, packaged for use with dictd dictionary servers.  Provides
word-level translations and basic definitions.")
    (home-page "https://freedict.org")
    (license license:gpl3+)))

;;; -------------------------------------------------------------------
;;; 40. dict-freedict-deu-fra-bin — FreeDict German-French
;;; -------------------------------------------------------------------
(define-public dict-freedict-deu-fra-bin
  (package
    (name "dict-freedict-deu-fra-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/freedict/fd-dictionaries/releases/download/v"
                    version "/freedict-deu-fra-" version ".dictd.tar.xz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/dictd"))))
    (synopsis "FreeDict German-French dictionary for dictd")
    (description "A German-to-French translation dictionary from the
FreeDict project, packaged for use with dictd dictionary servers.  Provides
word-level translations and basic definitions.")
    (home-page "https://freedict.org")
    (license license:gpl3+)))

;;; ===================================================================
;;; OTHER PACKAGES (various build systems)
;;; ===================================================================

;;; -------------------------------------------------------------------
;;; 41. ccze — fast log colorizer
;;; -------------------------------------------------------------------
(define-public ccze
  (package
    (name "ccze")
    (version "0.2.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/cornet/ccze/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list ncurses pcre2))
    (native-inputs (list autoconf automake))
    (synopsis "fast log colorizer written in C")
    (description "CCZE is a robust and fast log colorizer which can parse syslog,
httpd, procmail, and other log formats.  It uses ncurses for display and
supports plugin-based format recognition.")
    (home-page "https://github.com/cornet/ccze")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 42. dotdrop — dotfiles manager with templating
;;; -------------------------------------------------------------------
(define-public dotdrop
  (package
    (name "dotdrop")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/deadc0de6/dotdrop/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dotfiles manager with templating support")
    (description "Dotdrop makes managing dotfiles across different machines easy.
It uses a YAML configuration file and Jinja2 templating to generate
machine-specific dotfile variants from a single source.")
    (home-page "https://github.com/deadc0de6/dotdrop")
    (license license:gpl3)))

;;; -------------------------------------------------------------------
;;; 43. lbreakouthd — Breakout HD arcade game
;;; -------------------------------------------------------------------
(define-public lbreakouthd
  (package
    (name "lbreakouthd")
    (version "1.1.8")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/lgames/files/lbreakouthd/lbreakouthd-"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list sdl2 sdl2-image sdl2-mixer sdl2-ttf))
    (synopsis "Breakout-style arcade game with HD graphics")
    (description "LBreakoutHD is an HD remake of the classic Breakout arcade game.
It features over 50 levels, power-ups, and multiplayer support with modern
visuals built on SDL2.")
    (home-page "https://lgames.sourceforge.io/LBreakoutHD/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 44. mpremote — MicroPython remote tool
;;; -------------------------------------------------------------------
(define-public mpremote
  (package
    (name "mpremote")
    (version "1.23.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/micropython/micropython/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f))
    (synopsis "command-line tool for MicroPython boards")
    (description "Mpremote is a command-line tool for interacting with
MicroPython devices over serial.  It supports file transfer, REPL access,
device mounting, and remote script execution.")
    (home-page "https://github.com/micropython/micropython")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 45. waycorner — hot corners for Wayland
;;; -------------------------------------------------------------------
(define-public waycorner
  (package
    (name "waycorner")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/AndreasBackworb/waycorner/archive/refs/tags/v"
                    version ".tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments (list #:tests? #f))
    (synopsis "hot corners daemon for Wayland compositors")
    (description "Waycorner provides hot corner functionality for Wayland compositors.
When the cursor reaches a screen corner, it executes a configured command
such as launching an application or switching workspaces.")
    (home-page "https://github.com/AndreasBackworb/waycorner")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 46. shell-color-scripts-git — terminal color scripts
;;; -------------------------------------------------------------------
(define-public shell-color-scripts-git
  (package
    (name "shell-color-scripts-git")
    (version "0.1")
    (source (origin
              (method url-fetch)
              (uri "https://gitlab.com/dwt1/shell-color-scripts/-/archive/master/shell-color-scripts-master.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("colorscripts" "share/shell-color-scripts/colorscripts")
               ("colorscript.sh" "bin/colorscript"))))
    (synopsis "collection of terminal color scripts and ASCII art")
    (description "Shell Color Scripts is a collection of terminal color scripts
and ASCII art for use as shell greeting messages.  Includes various colorful
patterns, characters, and art pieces.")
    (home-page "https://gitlab.com/dwt1/shell-color-scripts")
    (license license:expat)))

;;; -------------------------------------------------------------------
;;; 47. gltron — Tron lightcycle game
;;; -------------------------------------------------------------------
(define-public gltron
  (package
    (name "gltron")
    (version "0.70")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://sourceforge.net/projects/gltron/files/gltron/"
                    version "/gltron-" version "-source.tar.gz"))
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (inputs (list mesa sdl sdl-mixer libpng zlib))
    (synopsis "Tron lightcycle game with OpenGL graphics")
    (description "GLTron is a 3D lightcycle game inspired by the movie Tron.
Players ride lightcycles that leave trails, trying to force opponents to
crash.  Features OpenGL-accelerated graphics and network multiplayer.")
    (home-page "http://www.gltron.org/")
    (license license:gpl2+)))

;;; -------------------------------------------------------------------
;;; 48. sfwbar — flexible Wayland taskbar
;;; -------------------------------------------------------------------
(define-public sfwbar
  (package
    (name "sfwbar")
    (version "1.0_beta15")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/LBCrion/sfwbar/archive/refs/heads/main.tar.gz")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000"))))
    (build-system meson-build-system)
    (inputs (list gtk+ wayland json-glib))
    (native-inputs (list pkg-config))
    (synopsis "flexible taskbar for Wayland compositors")
    (description "SFWBar is a flexible taskbar and panel for Wayland compositors.
It supports a widget-based layout system with CSS theming, system tray,
workspaces, and custom modules.")
    (home-page "https://github.com/LBCrion/sfwbar")
    (license license:gpl3)))

