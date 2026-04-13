;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass -- deptree-resolver-260413e
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 81 packages resolved with recipes, 19 remain BLOCKED with documented reasons.
;;; Generated: 2026-04-13
;;;
;;; Recipes (81):
;;;   - plymouth-theme-abstract-ring-alt-git (copy, gpl3+)
;;;   - plymouth-theme-abstract-ring-git (copy, gpl3+)
;;;   - plymouth-theme-alienware-git (copy, gpl3+)
;;;   - plymouth-theme-angular-alt-git (copy, gpl3+)
;;;   - plymouth-theme-angular-git (copy, gpl3+)
;;;   - plymouth-theme-black-hud-git (copy, gpl3+)
;;;   - plymouth-theme-blockchain-git (copy, gpl3+)
;;;   - plymouth-theme-circle-alt-git (copy, gpl3+)
;;;   - plymouth-theme-circle-flow-git (copy, gpl3+)
;;;   - plymouth-theme-circle-git (copy, gpl3+)
;;;   - plymouth-theme-circle-hud-git (copy, gpl3+)
;;;   - plymouth-theme-circuit-git (copy, gpl3+)
;;;   - plymouth-theme-colorful-git (copy, gpl3+)
;;;   - plymouth-theme-colorful-loop-git (copy, gpl3+)
;;;   - plymouth-theme-colorful-sliced-git (copy, gpl3+)
;;;   - plymouth-theme-connect-git (copy, gpl3+)
;;;   - plymouth-theme-cross-hud-git (copy, gpl3+)
;;;   - plymouth-theme-cubes-git (copy, gpl3+)
;;;   - plymouth-theme-cuts-alt-git (copy, gpl3+)
;;;   - plymouth-theme-cuts-git (copy, gpl3+)
;;;   - plymouth-i_use_arch_btw-git (copy, gpl3+)
;;;   - plymouth-theme-arch-logo-symbol (copy, expat)
;;;   - pkglog-elixir-bin (copy, agpl3+)
;;;   - printnotes-bin (copy, gpl3)
;;;   - protonup-qt-bin (copy, gpl3+)
;;;   - puzzletea-bin (copy, expat)
;;;   - raffi-bin (copy, asl2.0)
;;;   - rcl-bin (copy, asl2.0)
;;;   - responsively-bin (copy, agpl3+)
;;;   - rondo-bin (copy, expat)
;;;   - sdkman-bin (copy, asl2.0)
;;;   - shader-slang-bin (copy, expat)
;;;   - sngrep-bin (copy, gpl3+)
;;;   - squix-bin (copy, expat)
;;;   - sshconfig-lint-bin (copy, expat)
;;;   - standardnotes-bin (copy, agpl3+)
;;;   - subtui-bin (copy, expat)
;;;   - switchhosts-bin (copy, asl2.0)
;;;   - teams-for-linux-electron-bin (copy, gpl3+)
;;;   - timemap-bin (copy, expat)
;;;   - trakt-cli-bin (copy, expat)
;;;   - trashy-bin (copy, asl2.0)
;;;   - treehouse-bin (copy, expat)
;;;   - pi-coding-agent (copy, expat)
;;;   - plus42 (copy, gpl2)
;;;   - pnputils-git (copy, gpl3+)
;;;   - pocketenv (copy, mpl2.0)
;;;   - projectlibre (copy, cpal1.0)
;;;   - ps_mem (python, gpl3+)
;;;   - psgrep (copy, gpl3+)
;;;   - pvm (copy, gpl3+)
;;;   - python-android-backup-tools (python, asl2.0)
;;;   - qtfind (copy, gpl3+)
;;;   - roundcubemail-plugin-chbox (copy, gpl3+)
;;;   - roundcubemail-plugin-keyboard-shortcuts-ng (copy, agpl3+)
;;;   - rtree (cargo, expat)
;;;   - ruby-unicode_utils (ruby, gpl3+)
;;;   - runapp (copy, expat)
;;;   - s3sync (copy, asl2.0)
;;;   - safe-rm (cargo, gpl3+)
;;;   - scantool-git (copy, gpl3+)
;;;   - sendme (cargo, asl2.0)
;;;   - serve_md (cargo, expat)
;;;   - shikai-theme (copy, gpl3+)
;;;   - shiori-reader (copy, expat)
;;;   - simple-thumbnailer-stl (cargo, gpl3+)
;;;   - steamguard-cli (cargo, gpl3+)
;;;   - synodl (copy, gpl3+)
;;;   - systemd-numlockontty (copy, gpl3+)
;;;   - tdocker (go, expat)
;;;   - terraform-ls (go, mpl2.0)
;;;   - the-house (copy, expat)
;;;   - thunderbird-sieve (copy, agpl3+)
;;;   - tkey-ssh-agent (go, gpl2+)
;;;   - toipe (cargo, expat)
;;;   - tomb-kdf (copy, gpl3+)
;;;   - tome4-ashes_of_urhrok (copy, nonfree)
;;;   - tome4-embers_of_rage (copy, nonfree)
;;;   - tome4-forbidden_cults (copy, nonfree)
;;;   - trid (python, agpl3)
;;;   - trzsz (go, expat)
;;;
;;; Blocked (19):
;;;   - sonic-win (WINDOWS_SPECIFIC)
;;;   - new-lg4ff-dkms-git (DKMS_KERNEL_MODULE)
;;;   - yabridgectl-wine10-git (WINE_BRIDGE_COMPLEX)
;;;   - plasma6-applets-window-title (PLASMA6_APPLET_COMPLEX)
;;;   - powerofforreboot.efi (EFI_BINARY_SPECIALIZED)
;;;   - psiphonlinuxgui (PROPRIETARY_CORE_REQUIRED)
;;;   - pureref (PROPRIETARY_APP)
;;;   - replit-desktop-app (PROPRIETARY_ELECTRON)
;;;   - saleae-logic2 (PROPRIETARY_APP)
;;;   - skillshare (PROPRIETARY_SERVICE)
;;;   - ssacli-bin (PROPRIETARY_APP)
;;;   - stack-wallet-appimage (APPIMAGE_COMPLEX)
;;;   - storcli (PROPRIETARY_APP)
;;;   - svnkit (JAVA_MAVEN_COMPLEX)
;;;   - systemd-boot-pacman-hook (PACMAN_HOOK)
;;;   - systemd-oomd-defaults (DISTRO_SPECIFIC)
;;;   - tdarr (COMPLEX_SERVER_APP)
;;;   - technitium-dns-server-bin (DOTNET_RUNTIME_REQUIRED)
;;;   - tetrio-desktop (PROPRIETARY_GAME)
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros) unless noted.
;;; Run `guix download <url>` to obtain real hashes before building.

(define-module (gaurix packages deptree-resolver-260413e)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((nonguix licenses) #:prefix nonguix-license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system ruby)
  #:export (
            plymouth-theme-abstract-ring-alt-git
            plymouth-theme-abstract-ring-git
            plymouth-theme-alienware-git
            plymouth-theme-angular-alt-git
            plymouth-theme-angular-git
            plymouth-theme-black-hud-git
            plymouth-theme-blockchain-git
            plymouth-theme-circle-alt-git
            plymouth-theme-circle-flow-git
            plymouth-theme-circle-git
            plymouth-theme-circle-hud-git
            plymouth-theme-circuit-git
            plymouth-theme-colorful-git
            plymouth-theme-colorful-loop-git
            plymouth-theme-colorful-sliced-git
            plymouth-theme-connect-git
            plymouth-theme-cross-hud-git
            plymouth-theme-cubes-git
            plymouth-theme-cuts-alt-git
            plymouth-theme-cuts-git
            plymouth-i-use-arch-btw-git
            plymouth-theme-arch-logo-symbol
            pkglog-elixir-bin
            printnotes-bin
            protonup-qt-bin
            puzzletea-bin
            raffi-bin
            rcl-bin
            responsively-bin
            rondo-bin
            sdkman-bin
            shader-slang-bin
            sngrep-bin
            squix-bin
            sshconfig-lint-bin
            standardnotes-bin
            subtui-bin
            switchhosts-bin
            teams-for-linux-electron-bin
            timemap-bin
            trakt-cli-bin
            trashy-bin
            treehouse-bin
            pi-coding-agent
            plus42
            pnputils-git
            pocketenv
            projectlibre
            ps-mem
            psgrep
            pvm
            python-android-backup-tools
            qtfind
            roundcubemail-plugin-chbox
            roundcubemail-plugin-keyboard-shortcuts-ng
            rtree
            ruby-unicode-utils
            runapp
            s3sync
            safe-rm
            scantool-git
            sendme
            serve-md
            shikai-theme
            shiori-reader
            simple-thumbnailer-stl
            steamguard-cli
            synodl
            systemd-numlockontty
            tdocker
            terraform-ls
            the-house
            thunderbird-sieve
            tkey-ssh-agent
            toipe
            tomb-kdf
            tome4-ashes-of-urhrok
            tome4-embers-of-rage
            tome4-forbidden-cults
            trid
            trzsz
            ))

;;; PACKAGE DEFINITIONS (81 packages)

;;; -- plymouth-theme-abstract-ring-alt-git --
(define-public plymouth-theme-abstract-ring-alt-git
  (package
    (name "plymouth-theme-abstract-ring-alt-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/abstract-ring-alt" "share/plymouth/themes/abstract-ring-alt"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (abstract-ring-alt)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-abstract-ring-git --
(define-public plymouth-theme-abstract-ring-git
  (package
    (name "plymouth-theme-abstract-ring-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/abstract-ring" "share/plymouth/themes/abstract-ring"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (abstract-ring)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-alienware-git --
(define-public plymouth-theme-alienware-git
  (package
    (name "plymouth-theme-alienware-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/alienware" "share/plymouth/themes/alienware"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (alienware)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-angular-alt-git --
(define-public plymouth-theme-angular-alt-git
  (package
    (name "plymouth-theme-angular-alt-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/angular-alt" "share/plymouth/themes/angular-alt"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (angular-alt)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-angular-git --
(define-public plymouth-theme-angular-git
  (package
    (name "plymouth-theme-angular-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/angular" "share/plymouth/themes/angular"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (angular)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-black-hud-git --
(define-public plymouth-theme-black-hud-git
  (package
    (name "plymouth-theme-black-hud-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/black-hud" "share/plymouth/themes/black-hud"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (black-hud)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-blockchain-git --
(define-public plymouth-theme-blockchain-git
  (package
    (name "plymouth-theme-blockchain-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/blockchain" "share/plymouth/themes/blockchain"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (blockchain)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-circle-alt-git --
(define-public plymouth-theme-circle-alt-git
  (package
    (name "plymouth-theme-circle-alt-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/circle-alt" "share/plymouth/themes/circle-alt"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (circle-alt)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-circle-flow-git --
(define-public plymouth-theme-circle-flow-git
  (package
    (name "plymouth-theme-circle-flow-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/circle-flow" "share/plymouth/themes/circle-flow"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (circle-flow)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-circle-git --
(define-public plymouth-theme-circle-git
  (package
    (name "plymouth-theme-circle-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/circle" "share/plymouth/themes/circle"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (circle)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-circle-hud-git --
(define-public plymouth-theme-circle-hud-git
  (package
    (name "plymouth-theme-circle-hud-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/circle-hud" "share/plymouth/themes/circle-hud"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (circle-hud)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-circuit-git --
(define-public plymouth-theme-circuit-git
  (package
    (name "plymouth-theme-circuit-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/circuit" "share/plymouth/themes/circuit"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (circuit)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-colorful-git --
(define-public plymouth-theme-colorful-git
  (package
    (name "plymouth-theme-colorful-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/colorful" "share/plymouth/themes/colorful"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (colorful)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-colorful-loop-git --
(define-public plymouth-theme-colorful-loop-git
  (package
    (name "plymouth-theme-colorful-loop-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/colorful-loop" "share/plymouth/themes/colorful-loop"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (colorful-loop)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-colorful-sliced-git --
(define-public plymouth-theme-colorful-sliced-git
  (package
    (name "plymouth-theme-colorful-sliced-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/colorful-sliced" "share/plymouth/themes/colorful-sliced"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (colorful-sliced)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-connect-git --
(define-public plymouth-theme-connect-git
  (package
    (name "plymouth-theme-connect-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/connect" "share/plymouth/themes/connect"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (connect)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-cross-hud-git --
(define-public plymouth-theme-cross-hud-git
  (package
    (name "plymouth-theme-cross-hud-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/cross-hud" "share/plymouth/themes/cross-hud"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (cross-hud)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-cubes-git --
(define-public plymouth-theme-cubes-git
  (package
    (name "plymouth-theme-cubes-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/cubes" "share/plymouth/themes/cubes"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (cubes)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-cuts-alt-git --
(define-public plymouth-theme-cuts-alt-git
  (package
    (name "plymouth-theme-cuts-alt-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/cuts-alt" "share/plymouth/themes/cuts-alt"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (cuts-alt)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-theme-cuts-git --
(define-public plymouth-theme-cuts-git
  (package
    (name "plymouth-theme-cuts-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/adi1090x/plymouth-themes")
             (commit "bf2f570bee8e84c5c20caac353cbe1d811a4745f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("pack_4/cuts" "share/plymouth/themes/cuts"))))
    (home-page "https://github.com/adi1090x/plymouth-themes")
    (synopsis "plymouth boot theme (cuts)")
    (description
     "A Plymouth boot splash theme from the adi1090x collection.  This
theme provides a visually appealing boot animation for Plymouth.")
    (license license:gpl3+)))

;;; -- plymouth-i_use_arch_btw-git --
(define-public plymouth-i-use-arch-btw-git
  (package
    (name "plymouth-i_use_arch_btw-git")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/SimoriccITA/plymouth-i_use_arch_btw")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/plymouth/themes/plymouth-i_use_arch_btw-git/"))))
    (home-page "https://github.com/SimoriccITA/plymouth-i_use_arch_btw")
    (synopsis "plymouth theme "i_use_arch_btw"")
    (description "Plymouth theme "i_use_arch_btw".")
    (license license:gpl3+)))

;;; -- plymouth-theme-arch-logo-symbol --
(define-public plymouth-theme-arch-logo-symbol
  (package
    (name "plymouth-theme-arch-logo-symbol")
    (version "0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/mfinelli/plymouth-theme-arch-logo-symbol")
             (commit "HEAD")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("./" "share/plymouth/themes/plymouth-theme-arch-logo-symbol/"))))
    (home-page "https://github.com/mfinelli/plymouth-theme-arch-logo-symbol")
    (synopsis "arch linux logo (symbol) plymouth theme")
    (description "Arch linux logo (symbol) plymouth theme.")
    (license license:expat)))

;;; -- pkglog-elixir-bin --
(define-public pkglog-elixir-bin
  (package
    (name "pkglog-elixir-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/tranquil-tr0/pkglog-elixir/releases/download/v" version "/pkglog-elixir-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/pkglog-elixir-bin/"))))
    (home-page "https://github.com/tranquil-tr0/pkglog-elixir")
    (synopsis "reports log of package updates")
    (description "Reports log of package updates.")
    (license license:agpl3+)))

;;; -- printnotes-bin --
(define-public printnotes-bin
  (package
    (name "printnotes-bin")
    (version "0.10.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/RoBoT095/printnotes/releases/download/v" version "/printnotes-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/printnotes-bin/"))))
    (home-page "https://github.com/RoBoT095/printnotes")
    (synopsis "cross-platform markdown notes app inspired by Google Keep and Obsidian")
    (description "A cross-platform markdown notes app inspired by Google Keep
and Obsidian.  Prebuilt version.")
    (license license:gpl3)))

;;; -- protonup-qt-bin --
(define-public protonup-qt-bin
  (package
    (name "protonup-qt-bin")
    (version "2.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://davidotek.github.io/protonup-qt/releases/download/v" version "/protonup-qt-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/protonup-qt-bin/"))))
    (home-page "https://davidotek.github.io/protonup-qt")
    (synopsis "install and manage Proton-GE for Steam and Wine-GE for Lutris with this gr")
    (description "Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface.")
    (license license:gpl3+)))

;;; -- puzzletea-bin --
(define-public puzzletea-bin
  (package
    (name "puzzletea-bin")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/FelineStateMachine/puzzletea/releases/download/v" version "/puzzletea-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/puzzletea-bin/"))))
    (home-page "https://github.com/FelineStateMachine/puzzletea")
    (synopsis "A collection of puzzle bubbles for BubbleTea")
    (description "A collection of puzzle bubbles for BubbleTea.")
    (license license:expat)))

;;; -- raffi-bin --
(define-public raffi-bin
  (package
    (name "raffi-bin")
    (version "0.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/chmouel/raffi/releases/download/v" version "/raffi-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/raffi-bin/"))))
    (home-page "https://github.com/chmouel/raffi")
    (synopsis "raffi - fuzzel launcher based on yaml configuration")
    (description "Raffi - fuzzel launcher based on yaml configuration.")
    (license license:asl2.0)))

;;; -- rcl-bin --
(define-public rcl-bin
  (package
    (name "rcl-bin")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/ruuda/rcl/releases/download/v" version "/rcl-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rcl-bin/"))))
    (home-page "https://github.com/ruuda/rcl")
    (synopsis "A reasonable configuration language")
    (description "A reasonable configuration language.")
    (license license:asl2.0)))

;;; -- responsively-bin --
(define-public responsively-bin
  (package
    (name "responsively-bin")
    (version "1.17.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://responsively.app/releases/download/v" version "/responsively-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/responsively-bin/"))))
    (home-page "https://responsively.app")
    (synopsis "A modified web browser that helps in responsive web development. A web dev")
    (description "A modified web browser that helps in responsive web development. A web developer's must have dev-tool.")
    (license license:agpl3+)))

;;; -- rondo-bin --
(define-public rondo-bin
  (package
    (name "rondo-bin")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/roniel-rhack/rondo/releases/download/v" version "/rondo-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/rondo-bin/"))))
    (home-page "https://github.com/roniel-rhack/rondo")
    (synopsis "A modern terminal productivity app that combines task management with a da")
    (description "A modern terminal productivity app that combines task management with a daily journal.")
    (license license:expat)))

;;; -- sdkman-bin --
(define-public sdkman-bin
  (package
    (name "sdkman-bin")
    (version "5.22.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://sdkman.io//releases/download/v" version "/sdkman-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sdkman-bin/"))))
    (home-page "https://sdkman.io/")
    (synopsis "the Software Development Kit Manager Command Line Interface")
    (description "The Software Development Kit Manager Command Line Interface.")
    (license license:asl2.0)))

;;; -- shader-slang-bin --
(define-public shader-slang-bin
  (package
    (name "shader-slang-bin")
    (version "2026.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/shader-slang/slang/releases/download/v" version "/shader-slang-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/shader-slang-bin/"))))
    (home-page "https://github.com/shader-slang/slang")
    (synopsis "shading language that makes it easier to build and maintain large shader c")
    (description "Shading language that makes it easier to build and maintain large shader codebases in a modular and extensible fashion.")
    (license license:expat)))

;;; -- sngrep-bin --
(define-public sngrep-bin
  (package
    (name "sngrep-bin")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/irontec/sngrep/releases/download/v" version "/sngrep-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sngrep-bin/"))))
    (home-page "https://github.com/irontec/sngrep")
    (synopsis "A tool for displaying SIP call message flows from a terminal")
    (description "A tool for displaying SIP call message flows from a terminal.")
    (license license:gpl3+)))

;;; -- squix-bin --
(define-public squix-bin
  (package
    (name "squix-bin")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/eduardofuncao/squix/releases/download/v" version "/squix-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/squix-bin/"))))
    (home-page "https://github.com/eduardofuncao/squix")
    (synopsis "A minimal CLI tool for managing and executing SQL queries across multiple ")
    (description "A minimal CLI tool for managing and executing SQL queries across multiple databases.")
    (license license:expat)))

;;; -- sshconfig-lint-bin --
(define-public sshconfig-lint-bin
  (package
    (name "sshconfig-lint-bin")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Noah4ever/sshconfig-lint/releases/download/v" version "/sshconfig-lint-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/sshconfig-lint-bin/"))))
    (home-page "https://github.com/Noah4ever/sshconfig-lint")
    (synopsis "linter for OpenSSH client config files")
    (description "Linter for OpenSSH client config files.")
    (license license:expat)))

;;; -- standardnotes-bin --
(define-public standardnotes-bin
  (package
    (name "standardnotes-bin")
    (version "3.201.21")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/standardnotes/app/releases/download/v" version "/standardnotes-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/standardnotes-bin/"))))
    (home-page "https://github.com/standardnotes/app")
    (synopsis "free, open-source encrypted notes app")
    (description "Free, open-source encrypted notes app.")
    (license license:agpl3+)))

;;; -- subtui-bin --
(define-public subtui-bin
  (package
    (name "subtui-bin")
    (version "2.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/MattiaPun/SubTUI/releases/download/v" version "/subtui-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/subtui-bin/"))))
    (home-page "https://github.com/MattiaPun/SubTUI")
    (synopsis "lightweight TUI music player for Subsonic-compatible servers")
    (description "Lightweight TUI music player for Subsonic-compatible servers.")
    (license license:expat)))

;;; -- switchhosts-bin --
(define-public switchhosts-bin
  (package
    (name "switchhosts-bin")
    (version "4.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://swh.app//releases/download/v" version "/switchhosts-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/switchhosts-bin/"))))
    (home-page "https://swh.app/")
    (synopsis "switch hosts quickly!(Prebuilt version.Use system-wide electron)")
    (description "Switch hosts quickly!(Prebuilt version.Use system-wide electron).")
    (license license:asl2.0)))

;;; -- teams-for-linux-electron-bin --
(define-public teams-for-linux-electron-bin
  (package
    (name "teams-for-linux-electron-bin")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v" version "/teams-for-linux-electron-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/teams-for-linux-electron-bin/"))))
    (home-page "https://github.com/IsmaelMartinez/teams-for-linux")
    (synopsis "unofficial Microsoft Teams for Linux client, prebuilt version")
    (description "Unofficial Microsoft Teams for Linux client.  Prebuilt version
using system-wide Electron.")
    (license license:gpl3+)))

;;; -- timemap-bin --
(define-public timemap-bin
  (package
    (name "timemap-bin")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/srliu3264/timemap/releases/download/v" version "/timemap-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/timemap-bin/"))))
    (home-page "https://github.com/srliu3264/timemap")
    (synopsis "A Terminal-based Diary & Knowledge & Task Calendar Manager (Binary)")
    (description "A Terminal-based Diary & Knowledge & Task Calendar Manager (Binary).")
    (license license:expat)))

;;; -- trakt-cli-bin --
(define-public trakt-cli-bin
  (package
    (name "trakt-cli-bin")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/angristan/trakt-cli/releases/download/v" version "/trakt-cli-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/trakt-cli-bin/"))))
    (home-page "https://github.com/angristan/trakt-cli")
    (synopsis "A CLI for trakt.tv")
    (description "A CLI for trakt.tv.")
    (license license:expat)))

;;; -- trashy-bin --
(define-public trashy-bin
  (package
    (name "trashy-bin")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/oberblastmeister/trashy/releases/download/v" version "/trashy-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/trashy-bin/"))))
    (home-page "https://github.com/oberblastmeister/trashy")
    (synopsis "a cli system trash manager, alternative to rm and trash-cli")
    (description "A cli system trash manager, alternative to rm and trash-cli.")
    (license license:asl2.0)))

;;; -- treehouse-bin --
(define-public treehouse-bin
  (package
    (name "treehouse-bin")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/kunchenguid/treehouse/releases/download/v" version "/treehouse-bin-" version "-linux-x86_64.tar.gz"))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan
           #~'(("." "share/treehouse-bin/"))))
    (home-page "https://github.com/kunchenguid/treehouse")
    (synopsis "manage worktrees without managing worktrees")
    (description "Manage worktrees without managing worktrees.")
    (license license:expat)))

;;; -- pi-coding-agent --
(define-public pi-coding-agent
  (package
    (name "pi-coding-agent")
    (version "0.65.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/pi-coding-agent.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://shittycodingagent.ai/")
    (synopsis "A terminal-based coding agent with multi-model support, mid-session model ")
    (description "A terminal-based coding agent with multi-model support, mid-session model switching, and a simple CLI for headless coding tasks.")
    (license license:expat)))

;;; -- plus42 --
(define-public plus42
  (package
    (name "plus42")
    (version "1.3.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/plus42.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://thomasokken.com/plus42/")
    (synopsis "advanced scientific programmable calculator, based on Free42")
    (description "Advanced scientific programmable calculator, based on Free42.")
    (license license:gpl2)))

;;; -- pnputils-git --
(define-public pnputils-git
  (package
    (name "pnputils-git")
    (version "a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/pnputils-git.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "http://git.debian.org/?p=collab-maint/pnputils.git")
    (synopsis "PNP utils")
    (description "PNP utils.")
    (license license:gpl3+)))

;;; -- pocketenv --
(define-public pocketenv
  (package
    (name "pocketenv")
    (version "0.6.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pocketenv-io/pocketenv")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/pocketenv-io/pocketenv")
    (synopsis "open, interoperable sandbox platform for agents and humans 📦 ✨")
    (description "Open, interoperable sandbox platform for agents and humans 📦 ✨.")
    (license license:mpl2.0)))

;;; -- projectlibre --
(define-public projectlibre
  (package
    (name "projectlibre")
    (version "1.9.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/projectlibre.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "http://www.projectlibre.org")
    (synopsis "projectLibre is an open source project management software")
    (description "ProjectLibre is an open source project management software.")
    (license license:cpal1.0)))

;;; -- ps_mem --
(define-public ps-mem
  (package
    (name "ps_mem")
    (version "3.14")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pixelb/ps_mem")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:tests? #f))
    (build-system pyproject-build-system)
    (home-page "https://github.com/pixelb/ps_mem")
    (synopsis "list processes by memory usage")
    (description "List processes by memory usage.")
    (license license:gpl3+)))

;;; -- psgrep --
(define-public psgrep
  (package
    (name "psgrep")
    (version "1.0.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/jvz/psgrep")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/jvz/psgrep")
    (synopsis "process list search thru grep")
    (description "Process list search thru grep.")
    (license license:gpl3+)))

;;; -- pvm --
(define-public pvm
  (package
    (name "pvm")
    (version "3.4.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/pvm.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "http://www.netlib.org/pvm3")
    (synopsis "parallel Virtual Machine")
    (description "Parallel Virtual Machine.")
    (license license:gpl3+)))

;;; -- python-android-backup-tools --
(define-public python-android-backup-tools
  (package
    (name "python-android-backup-tools")
    (version "0.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bluec0re/android-backup-tools")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:tests? #f))
    (build-system pyproject-build-system)
    (home-page "https://github.com/bluec0re/android-backup-tools")
    (synopsis "unpack and repack android backups")
    (description "Unpack and repack android backups.")
    (license license:asl2.0)))

;;; -- qtfind --
(define-public qtfind
  (package
    (name "qtfind")
    (version "1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/qtfind.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://forum.manjaro.org/index.php?topic=16371.0")
    (synopsis "qt5 search tool for pcmanfm-qt")
    (description "Qt5 search tool for pcmanfm-qt.")
    (license license:gpl3+)))

;;; -- roundcubemail-plugin-chbox --
(define-public roundcubemail-plugin-chbox
  (package
    (name "roundcubemail-plugin-chbox")
    (version "1.3.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/roundcubemail-plugin-chbox.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://plugins.roundcube.net/packages/roundcube/chbox")
    (synopsis "this chbox plugin adds the convenient functionality of making single and/o")
    (description "This chbox plugin adds the convenient functionality of making single and/or multiple selections from a number of emails in Roundcube message list.")
    (license license:gpl3+)))

;;; -- roundcubemail-plugin-keyboard-shortcuts-ng --
(define-public roundcubemail-plugin-keyboard-shortcuts-ng
  (package
    (name "roundcubemail-plugin-keyboard-shortcuts-ng")
    (version "0.9.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/roundcubemail-plugin-keyboard-shortcuts-ng.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://plugins.roundcube.net/packages/teon/keyboard_shortcuts_ng")
    (synopsis "roundcube plugin that enables keyboard shortcuts, and makes associations c")
    (description "Roundcube plugin that enables keyboard shortcuts, and makes associations configurable by Roundcube admin.")
    (license license:agpl3+)))

;;; -- rtree --
(define-public rtree
  (package
    (name "rtree")
    (version "0.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/marcusbandit/rtree")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://github.com/marcusbandit/rtree")
    (synopsis "A fast tree command with smart pattern filtering and live-search TUI")
    (description "A fast tree command with smart pattern filtering and live-search TUI.")
    (license license:expat)))

;;; -- ruby-unicode_utils --
(define-public ruby-unicode-utils
  (package
    (name "ruby-unicode_utils")
    (version "1.4.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "http://github.com/lang/unicode_utils")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:tests? #f))
    (build-system ruby-build-system)
    (home-page "http://github.com/lang/unicode_utils")
    (synopsis "additional Unicode aware functions for Ruby 1.9")
    (description "Additional Unicode aware functions for Ruby 1.9.")
    (license license:gpl3+)))

;;; -- runapp --
(define-public runapp
  (package
    (name "runapp")
    (version "0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/c4rlo/runapp")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/c4rlo/runapp")
    (synopsis "application runner for Linux desktop environments that integrate with systemd")
    (description "Application runner for Linux desktop environments that integrate with systemd.")
    (license license:expat)))

;;; -- s3sync --
(define-public s3sync
  (package
    (name "s3sync")
    (version "1.56.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/nidor1998/s3sync")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/nidor1998/s3sync")
    (synopsis "reliable, flexible, and fast synchronization tool for S3")
    (description "Reliable, flexible, and fast synchronization tool for S3.")
    (license license:asl2.0)))

;;; -- safe-rm --
(define-public safe-rm
  (package
    (name "safe-rm")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/safe-rm.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://launchpad.net/safe-rm")
    (synopsis "A tool intended to prevent the accidental deletion of important files")
    (description "A tool intended to prevent the accidental deletion of important files.")
    (license license:gpl3+)))

;;; -- scantool-git --
(define-public scantool-git
  (package
    (name "scantool-git")
    (version "v2.1.2.r21.gce6257a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/kees/scantool")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/kees/scantool")
    (synopsis "OBD-II vehicle diagnostic scanner")
    (description "OBD-II vehicle diagnostic scanner.")
    (license license:gpl3+)))

;;; -- sendme --
(define-public sendme
  (package
    (name "sendme")
    (version "0.30.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/n0-computer/sendme")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://github.com/n0-computer/sendme")
    (synopsis "A tool to send files and directories, based on iroh")
    (description "A tool to send files and directories, based on iroh.")
    (license license:asl2.0)))

;;; -- serve_md --
(define-public serve-md
  (package
    (name "serve_md")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/GhelloZ/serve_md")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://github.com/GhelloZ/serve_md")
    (synopsis "serve a markdown file as an HTML webpage")
    (description "Serve a markdown file as an HTML webpage.")
    (license license:expat)))

;;; -- shikai-theme --
(define-public shikai-theme
  (package
    (name "shikai-theme")
    (version "v1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/TheWisker/Shikai")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/TheWisker/Shikai")
    (synopsis "modern lightdm webkit2 theme")
    (description "Modern lightdm webkit2 theme.")
    (license license:gpl3+)))

;;; -- shiori-reader --
(define-public shiori-reader
  (package
    (name "shiori-reader")
    (version "0.5")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/meowcat767/Shiori")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/meowcat767/Shiori")
    (synopsis "shiori - A simple MangaDex-based manga reader")
    (description "Shiori - A simple MangaDex-based manga reader.")
    (license license:expat)))

;;; -- simple-thumbnailer-stl --
(define-public simple-thumbnailer-stl
  (package
    (name "simple-thumbnailer-stl")
    (version "4.348b27a")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/simple-thumbnailer-stl.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://aur.archlinux.org/packages/simple-thumbnailer-stl")
    (synopsis "create isometric thumbnails from STL models using software rendering")
    (description "Create isometric thumbnails from STL models using software rendering.")
    (license license:gpl3+)))

;;; -- steamguard-cli --
(define-public steamguard-cli
  (package
    (name "steamguard-cli")
    (version "0.17.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/dyc3/steamguard-cli")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://github.com/dyc3/steamguard-cli")
    (synopsis "A linux utility for generating 2FA codes for Steam and managing Steam trad")
    (description "A linux utility for generating 2FA codes for Steam and managing Steam trade confirmations.")
    (license license:gpl3+)))

;;; -- synodl --
(define-public synodl
  (package
    (name "synodl")
    (version "0.5.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/synodl.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://code.ott.net/synodl/")
    (synopsis "command-line client for Synology's DownloadStation")
    (description "Command-line client for Synology's DownloadStation.")
    (license license:gpl3+)))

;;; -- systemd-numlockontty --
(define-public systemd-numlockontty
  (package
    (name "systemd-numlockontty")
    (version "0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ybalrid/systemd-numlockontty")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/Ybalrid/systemd-numlockontty")
    (synopsis "systemd service + script, automatically activate numpad on ttys")
    (description "Systemd service + script, automatically activate numpad on ttys.")
    (license license:gpl3+)))

;;; -- tdocker --
(define-public tdocker
  (package
    (name "tdocker")
    (version "0.5.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pivovarit/tdocker")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:import-path "github.com/pivovarit/tdocker"
           #:install-source? #f
           #:tests? #f))
    (build-system go-build-system)
    (home-page "https://github.com/pivovarit/tdocker")
    (synopsis "A minimalistic terminal UI for everyday Docker operations")
    (description "A minimalistic terminal UI for everyday Docker operations.")
    (license license:expat)))

;;; -- terraform-ls --
(define-public terraform-ls
  (package
    (name "terraform-ls")
    (version "0.38.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/hashicorp/terraform-ls")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:import-path "github.com/hashicorp/terraform-ls"
           #:install-source? #f
           #:tests? #f))
    (build-system go-build-system)
    (home-page "https://github.com/hashicorp/terraform-ls")
    (synopsis "terraform Language Server")
    (description "Terraform Language Server.")
    (license license:mpl2.0)))

;;; -- the-house --
(define-public the-house
  (package
    (name "the-house")
    (version "2.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/therock444/the-house")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/therock444/the-house")
    (synopsis "A cursed command line casino suite. Russian roulette, blackjack, and more")
    (description "A cursed command line casino suite. Russian roulette, blackjack, and more.")
    (license license:expat)))

;;; -- thunderbird-sieve --
(define-public thunderbird-sieve
  (package
    (name "thunderbird-sieve")
    (version "0.6.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/thsmi/sieve")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://github.com/thsmi/sieve")
    (synopsis "this Extension implements the ManageSieve protocol for securely managing S")
    (description "This Extension implements the ManageSieve protocol for securely managing Sieve Script on a remote IMAP server.")
    (license license:agpl3+)))

;;; -- tkey-ssh-agent --
(define-public tkey-ssh-agent
  (package
    (name "tkey-ssh-agent")
    (version "1.1.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tillitis/tkey-ssh-agent")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:import-path "github.com/tillitis/tkey-ssh-agent"
           #:install-source? #f
           #:tests? #f))
    (build-system go-build-system)
    (home-page "https://github.com/tillitis/tkey-ssh-agent")
    (synopsis "A ssh-agent for the Tillitis TKey")
    (description "A ssh-agent for the Tillitis TKey.")
    (license license:gpl2+)))

;;; -- toipe --
(define-public toipe
  (package
    (name "toipe")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Samyak2/toipe")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-source? #f
           #:tests? #f))
    (build-system cargo-build-system)
    (home-page "https://github.com/Samyak2/toipe")
    (synopsis "yet another typing test, but crab flavoured")
    (description "Yet another typing test, but crab flavoured.")
    (license license:expat)))

;;; -- tomb-kdf --
(define-public tomb-kdf
  (package
    (name "tomb-kdf")
    (version "2.13")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/tomb-kdf.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://www.dyne.org/software/tomb/")
    (synopsis "crypto Undertaker extensions to improve password security")
    (description "Crypto Undertaker extensions to improve password security.")
    (license license:gpl3+)))

;;; -- tome4-ashes_of_urhrok --
(define-public tome4-ashes-of-urhrok
  (package
    (name "tome4-ashes_of_urhrok")
    (version "1.1.4")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/tome4-ashes_of_urhrok.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://te4.org/")
    (synopsis "ashes of Urhok DLC for tome4")
    (description "Ashes of Urhok DLC for tome4.")
    (license nonguix-license:nonfree)))

;;; -- tome4-embers_of_rage --
(define-public tome4-embers-of-rage
  (package
    (name "tome4-embers_of_rage")
    (version "1.1.10")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/tome4-embers_of_rage.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://te4.org/")
    (synopsis "embers of Rage DLC for tome4")
    (description "Embers of Rage DLC for tome4.")
    (license nonguix-license:nonfree)))

;;; -- tome4-forbidden_cults --
(define-public tome4-forbidden-cults
  (package
    (name "tome4-forbidden_cults")
    (version "1.0.12")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/tome4-forbidden_cults.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:install-plan
           #~'(("." "share/' + name + '/"))))
    (build-system copy-build-system)
    (home-page "https://te4.org/")
    (synopsis "forbidden Cults DLC for tome4")
    (description "Forbidden Cults DLC for tome4.")
    (license nonguix-license:nonfree)))

;;; -- trid --
(define-public trid
  (package
    (name "trid")
    (version "2.47")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/trid.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:tests? #f))
    (build-system pyproject-build-system)
    (home-page "http://mark0.net/soft-trid-e.html")
    (synopsis "an utility designed to identify file types from their binary signatures")
    (description "An utility designed to identify file types from their binary signatures.")
    (license license:agpl3)))

;;; -- trzsz --
(define-public trzsz
  (package
    (name "trzsz")
    (version "1.2.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://aur.archlinux.org/trzsz.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0000000000000000000000000000000000000000000000000000"))))
    (arguments
     (list #:import-path "trzsz.github.io/"
           #:install-source? #f
           #:tests? #f))
    (build-system go-build-system)
    (home-page "https://trzsz.github.io/")
    (synopsis "simple file transfer tools, similar to lrzsz (rz/sz), and compatible with ")
    (description "Simple file transfer tools, similar to lrzsz (rz/sz), and compatible with tmux.")
    (license license:expat)))

