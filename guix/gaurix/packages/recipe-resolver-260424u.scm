;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260424u
;;; Resolves 100 packages (98 recipes, 2 blocked).
;;;
;;; New recipes (98):
;;;        1.  elk-shell-bin (#19315, copy, v0.0.3, MIT)
;;;        2.  parallel-disk-usage-bin (#19320, copy, v0.23.0, Apache-2.0)
;;;        3.  opencli-rs-bin (#19339, copy, v0.2.3, Apache-2.0)
;;;        4.  clc-bin (#19357, copy, v0.4.0, MIT)
;;;        5.  mconf-bin (#19365, copy, v1:1.2505.7, WTFPL)
;;;        6.  updatecli-bin (#19373, copy, v0.116.3, Apache)
;;;        7.  spacetimedb-bin (#19377, copy, v2.0.5, custom:BSL)
;;;        8.  firefox-extension-linkding-bin (#19437, copy, v1.14.0, MIT)
;;;        9.  tlsx-bin (#19442, copy, v1.2.2, MIT)
;;;       10.  sui-mainnet-bin (#19443, copy, v1.68.1, Apache-2.0)
;;;       11.  sui-testnet-bin (#19451, copy, v1.68.1, Apache-2.0)
;;;       12.  trackaudio-bin (#19456, copy, v1.4.0_beta.1, GPL-3.0-or-later)
;;;       13.  maplemononormal-variable (#19550, gnu, v7.9, OFL-1.1)
;;;       14.  maplemononormal-ttf-autohint (#19551, gnu, v7.9, OFL-1.1)
;;;       15.  maplemononormal-ttf (#19552, gnu, v7.9, OFL-1.1)
;;;       16.  maplemononormal-otf (#19553, gnu, v7.9, OFL-1.1)
;;;       17.  maplemononormal-nf-unhinted (#19554, gnu, v7.9, OFL-1.1)
;;;       18.  maplemononormal-nf-cn-unhinted (#19555, gnu, v7.9, OFL-1.1)
;;;       19.  maplemononormal-nf-cn (#19556, gnu, v7.9, OFL-1.1)
;;;       20.  maplemononormal-nf (#19557, gnu, v7.9, OFL-1.1)
;;;       21.  maplemononormal-cn-unhinted (#19558, gnu, v7.9, OFL-1.1)
;;;       22.  maplemononormal-cn (#19559, gnu, v7.9, OFL-1.1)
;;;       23.  betafpv-configurator (#19566, gnu, v1:2.0, GPL3)
;;;       24.  hledger-ui-bin (#19610, copy, v1.52, GPL-3.0-or-later)
;;;       25.  gowin-eda-programmer (#19653, gnu, v1:1.9.12.02, unknown)
;;;       26.  rpk-bin (#19724, copy, v25.2.3, Redpanda Business Source License)
;;;       27.  zsh-manpage-completion-generator-bin (#19756, copy, v1.0.2, MIT)
;;;       28.  nordic-darker-standard-buttons-theme (#19762, gnu, v2.2.0, GPL3)
;;;       29.  kube-burner-bin (#19771, copy, v2.2.2, Apache-2.0)
;;;       30.  payload-dumper-go-bin (#19796, copy, v1.3.0, Apache-2.0)
;;;       31.  nvidia-force-comp-pipeline (#19878, gnu, v1.0, MIT)
;;;       32.  bazelisk-bin (#19880, copy, v1.25.0, Apache-2.0)
;;;       33.  hubble-bin (#19895, copy, v1.18.6, Apache)
;;;       34.  traitor-bin (#19907, copy, v0.0.14, MIT)
;;;       35.  torpedo-bin (#19908, copy, v0.0.13, unknown)
;;;       36.  elasticvue-bin (#19933, copy, v1.14.0, MIT)
;;;       37.  swc-js-bin (#19957, copy, v1.11.24, Apache-2.0)
;;;       38.  owlplug-bin (#19962, copy, v1.31.1, GPL-3.0)
;;;       39.  pimpmystremio-bin (#19985, copy, v1.2.2, MIT)
;;;       40.  gotify-cli-bin (#20003, copy, v2.3.2, MIT)
;;;       41.  kdenlive-appimage (#20011, copy, v25.12.0, GPL)
;;;       42.  chessterm (#20066, gnu, v1.1.1, MIT)
;;;       43.  goimports-reviser-bin (#20104, copy, v3.12.6, MIT)
;;;       44.  germanium-bin (#20106, copy, v1.2.3, MIT)
;;;       45.  fuzzynote-bin (#20108, copy, v0.25.5, AGPL-3.0-only)
;;;       46.  eol-bin (#20109, copy, v0.2.0, MIT)
;;;       47.  chyle-bin (#20113, copy, v1.19.0, MIT)
;;;       48.  bitrise-bin (#20115, copy, v2.39.3, MIT)
;;;       49.  aoruscontrol-bin (#20116, copy, v1.0.1, MIT)
;;;       50.  tut-bin (#20126, copy, v2.0.1, MIT)
;;;       51.  mouse-actions-cli-bin (#20142, copy, v0.4.5, MIT)
;;;       52.  kitchenowl (#20145, gnu, v0.7.7, GPL3)
;;;       53.  extempore-bin (#20149, copy, v0.8.9, LicenseRef-extempore)
;;;       54.  dsk2nib-git (#20151, gnu, vr7.ce7a4b8, MIT)
;;;       55.  pylyzer-bin (#20199, copy, v0.0.82, MIT)
;;;       56.  dirbuster-wordlists (#20209, gnu, v2.3, CC BY-SA 3.0)
;;;       57.  donut.c (#20222, gnu, v2.0, None)
;;;       58.  altserver-bin (#20297, copy, v0.0.5, AGPL3)
;;;       59.  bisc-bin (#20350, copy, v0.4.1, GPL3)
;;;       60.  redpanda-connect-bin (#20362, copy, v4.81.0, Apache-2.0)
;;;       61.  mangal-bin (#20373, copy, v4.0.6, MIT)
;;;       62.  wonderdraft (#20377, gnu, v1.1.8.2, custom)
;;;       63.  lowcharts-bin (#20401, copy, v0.5.9, MIT)
;;;       64.  blisp-bin (#20405, copy, v0.0.4, MIT)
;;;       65.  ain-bin (#20440, copy, v1.6.0, MIT)
;;;       66.  dos33fsprogs-git (#20457, gnu, vr6362.7848dbaf, GPL2)
;;;       67.  anime4k-git (#20472, gnu, v4.0.1.r40.g8e39551, MIT)
;;;       68.  ente-cli-bin (#20479, copy, v0.2.3, AGPL-3.0-or-later)
;;;       69.  sqlean-bin (#20482, copy, v3.49.1, MIT)
;;;       70.  elles-bin (#20488, copy, v0.2.0, MIT)
;;;       71.  kubewall-bin (#20492, copy, v0.0.18, Apache License 2.0)
;;;       72.  catppuccin-catwalk-bin (#20493, copy, v1.3.2, MIT)
;;;       73.  vcd (#20495, gnu, v221217, MIT)
;;;       74.  kernel-modules-hook-hardlinks (#20528, gnu, v0.2.4, GPL3)
;;;       75.  nom-bin (#20531, copy, v3.3.0, GPL)
;;;       76.  lazycomplete-bin (#20536, copy, v0.0.19, MIT)
;;;       77.  gitin-bin (#20548, copy, v0.2.5, BSD)
;;;       78.  probe-bin (#20560, copy, v0.0.3, MIT)
;;;       79.  yeet-bin (#20566, copy, v0.16.0, BSD3)
;;;       80.  remindme-bin (#20579, copy, v0.0.8, unknown)
;;;       81.  pww-bin (#20582, copy, v0.0.8, unknown)
;;;       82.  piknik-bin (#20586, copy, v0.10.2, ISC)
;;;       83.  oxen-server-bin (#20589, copy, v0.42.2, Apache-2.0)
;;;       84.  oxen-bin (#20590, copy, v0.42.2, Apache-2.0)
;;;       85.  neuralnote-vst3 (#20594, gnu, v1.1.0, Apache-2.0)
;;;       86.  neuralnote-bin (#20595, copy, v1.1.0, Apache-2.0)
;;;       87.  bmv-bin (#20617, copy, v0.0.14, MIT)
;;;       88.  belle-cpu (#20618, gnu, v0.2.0, BSD-3-Clause)
;;;       89.  catppuccin-gtk-theme-latte (#20621, gnu, v1.0.3, GPL-3.0-only)
;;;       90.  vkteams-bin (#20660, copy, v26.1.10.79081, unknown)
;;;       91.  electerm-bin (#20693, copy, v3.6.16, MIT)
;;;       92.  xfetch-bin (#20719, copy, v1.0.0, MIT)
;;;       93.  mautrix-whatsapp-bin (#20725, copy, v0.2604.0, AGPL-3.0-or-later)
;;;       94.  exfetch-bin (#20730, copy, v0.11.0, MIT)
;;;       95.  gsh-bin (#20768, copy, v1.10.3, GPL-3.0-or-later)
;;;       96.  gotz-bin (#20769, copy, v0.1.15, MIT)
;;;       97.  flood-bin (#20771, copy, v4.13.9, GPL-3.0)
;;;       98.  etcd-bin (#20773, copy, v3.6.10, Apache)
;;;
;;; BLOCKED (2):
;;;        1.  wooting-udev (#20313) -- SOURCE_UNAVAILABLE: no upstream URL in AUR metadata
;;;        2.  lamzu-maya-x-udev (#20334) -- SOURCE_UNAVAILABLE: no upstream URL in AUR metadata
;;;
;;; NOTE: All sha256 hashes are placeholders (all zeros).
;;; Use `guix download` or `guix hash` to obtain real hashes.

(define-module (gaurix packages recipe-resolver-260424u)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:export (
            elk-shell-bin
            parallel-disk-usage-bin
            opencli-rs-bin
            clc-bin
            mconf-bin
            updatecli-bin
            spacetimedb-bin
            firefox-extension-linkding-bin
            tlsx-bin
            sui-mainnet-bin
            sui-testnet-bin
            trackaudio-bin
            maplemononormal-variable
            maplemononormal-ttf-autohint
            maplemononormal-ttf
            maplemononormal-otf
            maplemononormal-nf-unhinted
            maplemononormal-nf-cn-unhinted
            maplemononormal-nf-cn
            maplemononormal-nf
            maplemononormal-cn-unhinted
            maplemononormal-cn
            betafpv-configurator
            hledger-ui-bin
            gowin-eda-programmer
            rpk-bin
            zsh-manpage-completion-generator-bin
            nordic-darker-standard-buttons-theme
            kube-burner-bin
            payload-dumper-go-bin
            nvidia-force-comp-pipeline
            bazelisk-bin
            hubble-bin
            traitor-bin
            torpedo-bin
            elasticvue-bin
            swc-js-bin
            owlplug-bin
            pimpmystremio-bin
            gotify-cli-bin
            kdenlive-appimage
            chessterm
            goimports-reviser-bin
            germanium-bin
            fuzzynote-bin
            eol-bin
            chyle-bin
            bitrise-bin
            aoruscontrol-bin
            tut-bin
            mouse-actions-cli-bin
            kitchenowl
            extempore-bin
            dsk2nib-git
            pylyzer-bin
            dirbuster-wordlists
            donut.c
            altserver-bin
            bisc-bin
            redpanda-connect-bin
            mangal-bin
            wonderdraft
            lowcharts-bin
            blisp-bin
            ain-bin
            dos33fsprogs-git
            anime4k-git
            ente-cli-bin
            sqlean-bin
            elles-bin
            kubewall-bin
            catppuccin-catwalk-bin
            vcd
            kernel-modules-hook-hardlinks
            nom-bin
            lazycomplete-bin
            gitin-bin
            probe-bin
            yeet-bin
            remindme-bin
            pww-bin
            piknik-bin
            oxen-server-bin
            oxen-bin
            neuralnote-vst3
            neuralnote-bin
            bmv-bin
            belle-cpu
            catppuccin-gtk-theme-latte
            vkteams-bin
            electerm-bin
            xfetch-bin
            mautrix-whatsapp-bin
            exfetch-bin
            gsh-bin
            gotz-bin
            flood-bin
            etcd-bin
            ))


;; Helper for nonfree/custom licenses
(define (nonfree uri)
  (license:license "nonfree" uri
    "This is a nonfree license."))

(define-public elk-shell-bin
  (package
    (name "elk-shell-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/PaddiM8/elk/releases/download/v0.0.3/elk-shell-bin-0.0.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elk-shell-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A shell language with syntax similar to that of a general-purpose language")
    (description "A shell language with syntax similar to that of a general-purpose language.")
    (home-page "https://github.com/PaddiM8/elk")
    (license license:expat)))

(define-public parallel-disk-usage-bin
  (package
    (name "parallel-disk-usage-bin")
    (version "0.23.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/KSXGitHub/parallel-disk-usage/releases/download/v0.23.0/parallel-disk-usage-bin-0.23.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/parallel-disk-usage-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "summarize disk usage of the set of files, recursively for directories")
    (description "Summarize disk usage of the set of files, recursively for directories.")
    (home-page "https://github.com/KSXGitHub/parallel-disk-usage")
    (license license:asl2.0)))

(define-public opencli-rs-bin
  (package
    (name "opencli-rs-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nashsu/opencli-rs/releases/download/v0.2.3/opencli-rs-bin-0.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/opencli-rs-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "blazing fast, memory-safe CLI tool to fetch information from websites with ...")
    (description "Blazing fast, memory-safe CLI tool to fetch information from websites with a single command.")
    (home-page "https://github.com/nashsu/opencli-rs")
    (license license:asl2.0)))

(define-public clc-bin
  (package
    (name "clc-bin")
    (version "0.4.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/alchemy/clc/releases/download/v0.4.0/clc-bin-0.4.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/clc-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A command-line tool for converting between configuration file formats")
    (description "A command-line tool for converting between configuration file formats.")
    (home-page "https://github.com/alchemy/clc")
    (license license:expat)))

(define-public mconf-bin
  (package
    (name "mconf-bin")
    (version "1:1.2505.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/marzeq/mconf/releases/download/v1:1.2505.7/mconf-bin-1:1.2505.7-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mconf-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "parser for the mconf configuration language")
    (description "Parser for the mconf configuration language.")
    (home-page "https://github.com/marzeq/mconf")
    (license license:wtfpl2)))

(define-public updatecli-bin
  (package
    (name "updatecli-bin")
    (version "0.116.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.updatecli.io")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/updatecli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A declarative update policy engine")
    (description "A declarative update policy engine.")
    (home-page "https://www.updatecli.io")
    (license license:asl2.0)))

(define-public spacetimedb-bin
  (package
    (name "spacetimedb-bin")
    (version "2.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.0.5/spacetimedb-bin-2.0.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/spacetimedb-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A relational database and a server combined into one (bin version)")
    (description "A relational database and a server combined into one (bin version).")
    (home-page "https://github.com/clockworklabs/SpacetimeDB")
    (license (nonfree "custom:BSL"))))

(define-public firefox-extension-linkding-bin
  (package
    (name "firefox-extension-linkding-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sissbruecker/linkding-extension/releases/download/v1.14.0/firefox-extension-linkding-bin-1.14.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/firefox-extension-linkding-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "companion extension for the self-hosted linkding bookmark service")
    (description "Companion extension for the self-hosted linkding bookmark service.")
    (home-page "https://github.com/sissbruecker/linkding-extension")
    (license license:expat)))

(define-public tlsx-bin
  (package
    (name "tlsx-bin")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/projectdiscovery/tlsx/releases/download/v1.2.2/tlsx-bin-1.2.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tlsx-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "fast and configurable TLS grabber focused on TLS based data collection")
    (description "Fast and configurable TLS grabber focused on TLS based data collection.")
    (home-page "https://github.com/projectdiscovery/tlsx")
    (license license:expat)))

(define-public sui-mainnet-bin
  (package
    (name "sui-mainnet-bin")
    (version "1.68.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MystenLabs/sui/releases/download/v1.68.1/sui-mainnet-bin-1.68.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sui-mainnet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sui, a next-generation smart contract platform with high throughput, low la...")
    (description "Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language.")
    (home-page "https://github.com/MystenLabs/sui")
    (license license:asl2.0)))

(define-public sui-testnet-bin
  (package
    (name "sui-testnet-bin")
    (version "1.68.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/MystenLabs/sui/releases/download/v1.68.1/sui-testnet-bin-1.68.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sui-testnet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sui, a next-generation smart contract platform with high throughput, low la...")
    (description "Sui, a next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model powered by the Move programming language.")
    (home-page "https://github.com/MystenLabs/sui")
    (license license:asl2.0)))

(define-public trackaudio-bin
  (package
    (name "trackaudio-bin")
    (version "1.4.0_beta.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pierr3/TrackAudio/releases/download/v1.4.0_beta.1/trackaudio-bin-1.4.0_beta.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/trackaudio-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "next-generation cross-platform Audio-For-VATSIM ATC Client")
    (description "Next-generation cross-platform Audio-For-VATSIM ATC Client.")
    (home-page "https://github.com/pierr3/TrackAudio")
    (license license:gpl3+)))

(define-public maplemononormal-variable
  (package
    (name "maplemononormal-variable")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-ttf-autohint
  (package
    (name "maplemononormal-ttf-autohint")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-ttf
  (package
    (name "maplemononormal-ttf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-otf
  (package
    (name "maplemononormal-otf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-nf-unhinted
  (package
    (name "maplemononormal-nf-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-nf-cn-unhinted
  (package
    (name "maplemononormal-nf-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-nf-cn
  (package
    (name "maplemononormal-nf-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-nf
  (package
    (name "maplemononormal-nf")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-cn-unhinted
  (package
    (name "maplemononormal-cn-unhinted")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public maplemononormal-cn
  (package
    (name "maplemononormal-cn")
    (version "7.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/subframe7536/maple-font")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "open source monospace font with round corner, ligatures and Nerd-Font for I...")
    (description "Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line.")
    (home-page "https://github.com/subframe7536/maple-font")
    (license license:silofl1.1)))

(define-public betafpv-configurator
  (package
    (name "betafpv-configurator")
    (version "1:2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/BETAFPV/BETAFPV_Configurator")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "BETAFPV Configurator — software for configuring BETAFPV drones")
    (description "BETAFPV Configurator — software for configuring BETAFPV drones.")
    (home-page "https://github.com/BETAFPV/BETAFPV_Configurator")
    (license license:gpl3)))

(define-public hledger-ui-bin
  (package
    (name "hledger-ui-bin")
    (version "1.52")
    (source (origin
              (method url-fetch)
              (uri "http://hledger.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hledger-ui-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "curses-style terminal interface for the hledger accounting system")
    (description "Curses-style terminal interface for the hledger accounting system.")
    (home-page "http://hledger.org")
    (license license:gpl3+)))

(define-public gowin-eda-programmer
  (package
    (name "gowin-eda-programmer")
    (version "1:1.9.12.02")
    (source (origin
              (method url-fetch)
              (uri "https://www.gowinsemi.com.cn/software/index")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "gowin EDA Programmer - Gowin EDA, an easy to use integrated design environm...")
    (description "Gowin EDA Programmer - Gowin EDA, an easy to use integrated design environment provides design engineers one-stop solution from design entry to verification.")
    (home-page "https://www.gowinsemi.com.cn/software/index")
    (license (nonfree "unknown"))))

(define-public rpk-bin
  (package
    (name "rpk-bin")
    (version "25.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/redpanda-data/redpanda/releases/download/v25.2.3/rpk-bin-25.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/rpk-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the rpk command line interface tool is designed to manage your entire Redpa...")
    (description "The rpk command line interface tool is designed to manage your entire Redpanda cluster, without the need to run a separate script for each function, as with Apache Kafka.")
    (home-page "https://github.com/redpanda-data/redpanda")
    (license (nonfree "Redpanda Business Source License"))))

(define-public zsh-manpage-completion-generator-bin
  (package
    (name "zsh-manpage-completion-generator-bin")
    (version "1.0.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/umlx5h/zsh-manpage-completion-generator/releases/download/v1.0.2/zsh-manpage-completion-generator-bin-1.0.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/zsh-manpage-completion-generator-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatically generate zsh completions from man page")
    (description "Automatically generate zsh completions from man page.")
    (home-page "https://github.com/umlx5h/zsh-manpage-completion-generator")
    (license license:expat)))

(define-public nordic-darker-standard-buttons-theme
  (package
    (name "nordic-darker-standard-buttons-theme")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/EliverLara/Nordic")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "nord-derived themes for GTK and other platforms")
    (description "Nord-derived themes for GTK and other platforms.")
    (home-page "https://github.com/EliverLara/Nordic")
    (license license:gpl3)))

(define-public kube-burner-bin
  (package
    (name "kube-burner-bin")
    (version "2.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kube-burner/kube-burner/releases/download/v2.2.2/kube-burner-bin-2.2.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kube-burner-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "kubernetes performance and scale test orchestration framework written in go...")
    (description "Kubernetes performance and scale test orchestration framework written in golang.")
    (home-page "https://github.com/kube-burner/kube-burner")
    (license license:asl2.0)))

(define-public payload-dumper-go-bin
  (package
    (name "payload-dumper-go-bin")
    (version "1.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ssut/payload-dumper-go/releases/download/v1.3.0/payload-dumper-go-bin-1.3.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/payload-dumper-go-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an android OTA payload dumper written in Go.(Prebuilt version)")
    (description "An android OTA payload dumper written in Go.(Prebuilt version).")
    (home-page "https://github.com/ssut/payload-dumper-go")
    (license license:asl2.0)))

(define-public nvidia-force-comp-pipeline
  (package
    (name "nvidia-force-comp-pipeline")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Askannz/nvidia-force-comp-pipeline")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "simple script to enable "Force Composition Pipeline" on all monitors connec...")
    (description "Simple script to enable \"Force Composition Pipeline\" on all monitors connected to an Nvidia card (fixes tearing).")
    (home-page "https://github.com/Askannz/nvidia-force-comp-pipeline")
    (license license:expat)))

(define-public bazelisk-bin
  (package
    (name "bazelisk-bin")
    (version "1.25.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bazelbuild/bazelisk/releases/download/v1.25.0/bazelisk-bin-1.25.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bazelisk-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A user-friendly launcher for Bazel")
    (description "A user-friendly launcher for Bazel.")
    (home-page "https://github.com/bazelbuild/bazelisk")
    (license license:asl2.0)))

(define-public hubble-bin
  (package
    (name "hubble-bin")
    (version "1.18.6")
    (source (origin
              (method url-fetch)
              (uri "https://cilium.io/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/hubble-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "network, Service & Security Observability for Kubernetes using eBPF")
    (description "Network, Service & Security Observability for Kubernetes using eBPF.")
    (home-page "https://cilium.io/")
    (license license:asl2.0)))

(define-public traitor-bin
  (package
    (name "traitor-bin")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/liamg/traitor/releases/download/v0.0.14/traitor-bin-0.0.14-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/traitor-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "automatic Linux privesc via exploitation of low-hanging fruit")
    (description "Automatic Linux privesc via exploitation of low-hanging fruit.")
    (home-page "https://github.com/liamg/traitor")
    (license license:expat)))

(define-public torpedo-bin
  (package
    (name "torpedo-bin")
    (version "0.0.13")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sst/torpedo/releases/download/v0.0.13/torpedo-bin-0.0.13-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/torpedo-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "connect to databases in private VPCs securely the easy way - no VPN required")
    (description "Connect to databases in private VPCs securely the easy way - no VPN required.")
    (home-page "https://github.com/sst/torpedo")
    (license (nonfree "unknown"))))

(define-public elasticvue-bin
  (package
    (name "elasticvue-bin")
    (version "1.14.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/cars10/elasticvue/releases/download/v1.14.0/elasticvue-bin-1.14.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elasticvue-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A free and open source gui for elasticsearch")
    (description "A free and open source gui for elasticsearch.")
    (home-page "https://github.com/cars10/elasticvue")
    (license license:expat)))

(define-public swc-js-bin
  (package
    (name "swc-js-bin")
    (version "1.11.24")
    (source (origin
              (method url-fetch)
              (uri "https://swc.rs")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/swc-js-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "super-fast TypeScript / JavaScript compiler written in Rust")
    (description "Super-fast TypeScript / JavaScript compiler written in Rust.")
    (home-page "https://swc.rs")
    (license license:asl2.0)))

(define-public owlplug-bin
  (package
    (name "owlplug-bin")
    (version "1.31.1")
    (source (origin
              (method url-fetch)
              (uri "https://owlplug.com/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/owlplug-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "audio plugin manager. Small tool to manage VST / AU / LV2 plugins on Window...")
    (description "Audio plugin manager. Small tool to manage VST / AU / LV2 plugins on Windows, MacOS and Linux.")
    (home-page "https://owlplug.com/")
    (license license:gpl3)))

(define-public pimpmystremio-bin
  (package
    (name "pimpmystremio-bin")
    (version "1.2.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/sungshon/PimpMyStremio/releases/download/v1.2.2/pimpmystremio-bin-1.2.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pimpmystremio-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "local add-on manager for Stremio")
    (description "Local add-on manager for Stremio.")
    (home-page "https://github.com/sungshon/PimpMyStremio")
    (license license:expat)))

(define-public gotify-cli-bin
  (package
    (name "gotify-cli-bin")
    (version "2.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/gotify/cli/releases/download/v2.3.2/gotify-cli-bin-2.3.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gotify-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "command line interface for pushing messages to gotify server")
    (description "Command line interface for pushing messages to gotify server.")
    (home-page "https://github.com/gotify/cli")
    (license license:expat)))

(define-public kdenlive-appimage
  (package
    (name "kdenlive-appimage")
    (version "25.12.0")
    (source (origin
              (method url-fetch)
              (uri "https://kdenlive.org")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kdenlive-appimage/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A non-linear video editor for Linux using the MLT video framework")
    (description "A non-linear video editor for Linux using the MLT video framework.")
    (home-page "https://kdenlive.org")
    (license license:gpl3+)))

(define-public chessterm
  (package
    (name "chessterm")
    (version "1.1.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Chewt/chessterm")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "play Chess in the terminal!")
    (description "Play Chess in the terminal!.")
    (home-page "https://github.com/Chewt/chessterm")
    (license license:expat)))

(define-public goimports-reviser-bin
  (package
    (name "goimports-reviser-bin")
    (version "3.12.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/incu6us/goimports-reviser/releases/download/v3.12.6/goimports-reviser-bin-3.12.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/goimports-reviser-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool for Golang to sort goimports by 3-4 groups: std, general, local(which ...")
    (description "Tool for Golang to sort goimports by 3-4 groups: std, general, local(which is optional) and project dependencies.")
    (home-page "https://github.com/incu6us/goimports-reviser")
    (license license:expat)))

(define-public germanium-bin
  (package
    (name "germanium-bin")
    (version "1.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/matsuyoshi30/germanium/releases/download/v1.2.3/germanium-bin-1.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/germanium-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "generate image from source code")
    (description "Generate image from source code.")
    (home-page "https://github.com/matsuyoshi30/germanium")
    (license license:expat)))

(define-public fuzzynote-bin
  (package
    (name "fuzzynote-bin")
    (version "0.25.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/Sambigeara/fuzzynote/releases/download/v0.25.5/fuzzynote-bin-0.25.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/fuzzynote-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "terminal-based, hyper-fast, CRDT-backed, collaborative note-taking tool")
    (description "Terminal-based, hyper-fast, CRDT-backed, collaborative note-taking tool.")
    (home-page "https://github.com/Sambigeara/fuzzynote")
    (license license:agpl3)))

(define-public eol-bin
  (package
    (name "eol-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kobayashi/eol/releases/download/v0.2.0/eol-bin-0.2.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/eol-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI tool for endoflife.date")
    (description "CLI tool for endoflife.date.")
    (home-page "https://github.com/kobayashi/eol")
    (license license:expat)))

(define-public chyle-bin
  (package
    (name "chyle-bin")
    (version "1.19.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/antham/chyle/releases/download/v1.19.0/chyle-bin-1.19.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/chyle-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "changelog generator: use a git repository and various data sources and publ...")
    (description "Changelog generator: use a git repository and various data sources and publish the result on external services.(Prebuilt version).")
    (home-page "https://github.com/antham/chyle")
    (license license:expat)))

(define-public bitrise-bin
  (package
    (name "bitrise-bin")
    (version "2.39.3")
    (source (origin
              (method url-fetch)
              (uri "https://www.bitrise.io/cli")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bitrise-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the workflow runner that powers Bitrise builds.Run your automations on your...")
    (description "The workflow runner that powers Bitrise builds.Run your automations on your Mac or Linux machine(prebuilt version).")
    (home-page "https://www.bitrise.io/cli")
    (license license:expat)))

(define-public aoruscontrol-bin
  (package
    (name "aoruscontrol-bin")
    (version "1.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/SIMULATAN/aoruscontrol/releases/download/v1.0.1/aoruscontrol-bin-1.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/aoruscontrol-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "control Aorus Devices from the Terminal")
    (description "Control Aorus Devices from the Terminal.")
    (home-page "https://github.com/SIMULATAN/aoruscontrol")
    (license license:expat)))

(define-public tut-bin
  (package
    (name "tut-bin")
    (version "2.0.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/RasmusLindroth/tut/releases/download/v2.0.1/tut-bin-2.0.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/tut-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the...")
    (description "A TUI for Mastodon with vim inspired keys. Same as aur/tut, but this is the binary version.")
    (home-page "https://github.com/RasmusLindroth/tut")
    (license license:expat)))

(define-public mouse-actions-cli-bin
  (package
    (name "mouse-actions-cli-bin")
    (version "0.4.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jersou/mouse-actions/releases/download/v0.4.5/mouse-actions-cli-bin-0.4.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mouse-actions-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "use your mouse to execute commands, for X11 and Wayland. You can use gestur...")
    (description "Use your mouse to execute commands, for X11 and Wayland. You can use gestures, hot corners and modifier keys. Mouse-actions is a mix between Easystroke and Compiz edge commands. This is the CLI only version!.")
    (home-page "https://github.com/jersou/mouse-actions")
    (license license:expat)))

(define-public kitchenowl
  (package
    (name "kitchenowl")
    (version "0.7.7")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/TomBursch/kitchenowl")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "kitchenOwl is a self-hosted grocery list and recipe manager")
    (description "KitchenOwl is a self-hosted grocery list and recipe manager.")
    (home-page "https://github.com/TomBursch/kitchenowl")
    (license license:gpl3)))

(define-public extempore-bin
  (package
    (name "extempore-bin")
    (version "0.8.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/digego/extempore/releases/download/v0.8.9/extempore-bin-0.8.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/extempore-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A cyber-physical programming environment")
    (description "A cyber-physical programming environment.")
    (home-page "https://github.com/digego/extempore")
    (license (nonfree "LicenseRef-extempore"))))

(define-public dsk2nib-git
  (package
    (name "dsk2nib-git")
    (version "r7.ce7a4b8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/slotek/dsk2nib")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "apple II DSK-to-NIB and NIB-to-DSK image file conversion utilities")
    (description "Apple II DSK-to-NIB and NIB-to-DSK image file conversion utilities.")
    (home-page "https://github.com/slotek/dsk2nib")
    (license license:expat)))

(define-public pylyzer-bin
  (package
    (name "pylyzer-bin")
    (version "0.0.82")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mtshiba/pylyzer/releases/download/v0.0.82/pylyzer-bin-0.0.82-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pylyzer-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A fast static code analyzer & language server for Python")
    (description "A fast static code analyzer & language server for Python.")
    (home-page "https://github.com/mtshiba/pylyzer")
    (license license:expat)))

(define-public dirbuster-wordlists
  (package
    (name "dirbuster-wordlists")
    (version "2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/3ndG4me/KaliLists/tree/master/dirbuster")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "dirbuster's default directories wordlists")
    (description "Dirbuster's default directories wordlists.")
    (home-page "https://github.com/3ndG4me/KaliLists/tree/master/dirbuster")
    (license (nonfree "CC BY-SA 3.0"))))

(define-public donut.c
  (package
    (name "donut.c")
    (version "2.0")
    (source (origin
              (method url-fetch)
              (uri "https://www.a1k0n.net/2021/01/13/optimizing-donut.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "donut-shaped C code that outputs a 3D spinning donut")
    (description "Donut-shaped C code that outputs a 3D spinning donut.")
    (home-page "https://www.a1k0n.net/2021/01/13/optimizing-donut.html")
    (license (nonfree "None"))))

(define-public altserver-bin
  (package
    (name "altserver-bin")
    (version "0.0.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/NyaMisty/AltServer-Linux/releases/download/v0.0.5/altserver-bin-0.0.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/altserver-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "altServer for Linux")
    (description "AltServer for Linux.")
    (home-page "https://github.com/NyaMisty/AltServer-Linux")
    (license (nonfree "AGPL3"))))

(define-public bisc-bin
  (package
    (name "bisc-bin")
    (version "0.4.1")
    (source (origin
              (method url-fetch)
              (uri "https://maxwell.eurofusion.eu/git/rnhmjoj/bisc")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bisc-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A small tool that clears cookies for qutebrowser and chromium-based browsers")
    (description "A small tool that clears cookies for qutebrowser and chromium-based browsers.")
    (home-page "https://maxwell.eurofusion.eu/git/rnhmjoj/bisc")
    (license license:gpl3)))

(define-public redpanda-connect-bin
  (package
    (name "redpanda-connect-bin")
    (version "4.81.0")
    (source (origin
              (method url-fetch)
              (uri "https://docs.redpanda.com/redpanda-connect/about/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/redpanda-connect-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "redpanda Connect is a declarative data streaming service")
    (description "Redpanda Connect is a declarative data streaming service.")
    (home-page "https://docs.redpanda.com/redpanda-connect/about/")
    (license license:asl2.0)))

(define-public mangal-bin
  (package
    (name "mangal-bin")
    (version "4.0.6")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/metafates/mangal/releases/download/v4.0.6/mangal-bin-4.0.6-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mangal-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "the most advanced cli manga downloader in the entire universe!")
    (description "The most advanced cli manga downloader in the entire universe!.")
    (home-page "https://github.com/metafates/mangal")
    (license license:expat)))

(define-public wonderdraft
  (package
    (name "wonderdraft")
    (version "1.1.8.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.wonderdraft.net")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "an intuitive yet powerful fantasy mapmaking tool for 64-bit Windows 10, Lin...")
    (description "An intuitive yet powerful fantasy mapmaking tool for 64-bit Windows 10, Linux and MacOSX.")
    (home-page "https://www.wonderdraft.net")
    (license (nonfree "custom"))))

(define-public lowcharts-bin
  (package
    (name "lowcharts-bin")
    (version "0.5.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/juan-leon/lowcharts/releases/download/v0.5.9/lowcharts-bin-0.5.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lowcharts-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "tool to draw low-resolution graphs in terminal")
    (description "Tool to draw low-resolution graphs in terminal.")
    (home-page "https://github.com/juan-leon/lowcharts")
    (license license:expat)))

(define-public blisp-bin
  (package
    (name "blisp-bin")
    (version "0.0.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/pine64/blisp/releases/download/v0.0.4/blisp-bin-0.0.4-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/blisp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs")
    (description "ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs.")
    (home-page "https://github.com/pine64/blisp")
    (license license:expat)))

(define-public ain-bin
  (package
    (name "ain-bin")
    (version "1.6.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jonaslu/ain/releases/download/v1.6.0/ain-bin-1.6.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ain-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A HTTP API client for the terminal. An alternative to postman, paw or insomnia")
    (description "A HTTP API client for the terminal. An alternative to postman, paw or insomnia.")
    (home-page "https://github.com/jonaslu/ain")
    (license license:expat)))

(define-public dos33fsprogs-git
  (package
    (name "dos33fsprogs-git")
    (version "r6362.7848dbaf")
    (source (origin
              (method url-fetch)
              (uri "http://www.deater.net/weave/vmwprod/apple/dos33fs.html")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "software package")
    (description "Software package.")
    (home-page "http://www.deater.net/weave/vmwprod/apple/dos33fs.html")
    (license license:gpl2)))

(define-public anime4k-git
  (package
    (name "anime4k-git")
    (version "4.0.1.r40.g8e39551")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/bloc97/Anime4K")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "A High-Quality Real Time Upscaler for Anime Video")
    (description "A High-Quality Real Time Upscaler for Anime Video.")
    (home-page "https://github.com/bloc97/Anime4K")
    (license license:expat)))

(define-public ente-cli-bin
  (package
    (name "ente-cli-bin")
    (version "0.2.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/ente-io/ente/releases/download/v0.2.3/ente-cli-bin-0.2.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/ente-cli-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "CLI for ente Photos")
    (description "CLI for ente Photos.")
    (home-page "https://github.com/ente-io/ente/tree/main/cli")
    (license license:agpl3+)))

(define-public sqlean-bin
  (package
    (name "sqlean-bin")
    (version "3.49.1")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/nalgeon/sqlite/releases/download/v3.49.1/sqlean-bin-3.49.1-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/sqlean-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "sqlean shell is SQLite shell bundled with a collection of essential extensi...")
    (description "Sqlean shell is SQLite shell bundled with a collection of essential extensions ranging from regular expressions and math statistics to file I/O and dynamic SQL.")
    (home-page "https://github.com/nalgeon/sqlite")
    (license license:expat)))

(define-public elles-bin
  (package
    (name "elles-bin")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/arp242/elles/releases/download/v0.2.0/elles-bin-0.2.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/elles-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A nicer /bin/ls")
    (description "A nicer /bin/ls.")
    (home-page "https://github.com/arp242/elles")
    (license license:expat)))

(define-public kubewall-bin
  (package
    (name "kubewall-bin")
    (version "0.0.18")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kubewall/kubewall/releases/download/v0.0.18/kubewall-bin-0.0.18-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/kubewall-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "kubewall is a single binary to manage multiple clusters")
    (description "Kubewall is a single binary to manage multiple clusters.")
    (home-page "https://github.com/kubewall/kubewall")
    (license license:asl2.0)))

(define-public catppuccin-catwalk-bin
  (package
    (name "catppuccin-catwalk-bin")
    (version "1.3.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/catppuccin/catwalk/releases/download/v1.3.2/catppuccin-catwalk-bin-1.3.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/catppuccin-catwalk-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "soothing pastel previews for the high-spirited!")
    (description "Soothing pastel previews for the high-spirited!.")
    (home-page "https://github.com/catppuccin/catwalk")
    (license license:expat)))

(define-public vcd
  (package
    (name "vcd")
    (version "221217")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/yne/vcd")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "VCD file (Value Change Dump) command line viewer")
    (description "VCD file (Value Change Dump) command line viewer.")
    (home-page "https://github.com/yne/vcd")
    (license license:expat)))

(define-public kernel-modules-hook-hardlinks
  (package
    (name "kernel-modules-hook-hardlinks")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/VannTen/kernel-modules-hook")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "keeps your system fully functional after a kernel upgrade")
    (description "Keeps your system fully functional after a kernel upgrade.")
    (home-page "https://github.com/VannTen/kernel-modules-hook")
    (license license:gpl3)))

(define-public nom-bin
  (package
    (name "nom-bin")
    (version "3.3.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/guyfedwards/nom/releases/download/v3.3.0/nom-bin-3.3.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/nom-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "RSS reader for the terminal")
    (description "RSS reader for the terminal.")
    (home-page "https://github.com/guyfedwards/nom")
    (license license:gpl3+)))

(define-public lazycomplete-bin
  (package
    (name "lazycomplete-bin")
    (version "0.0.19")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/rsteube/lazycomplete/releases/download/v0.0.19/lazycomplete-bin-0.0.19-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/lazycomplete-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "lazy loading for shell completion scripts")
    (description "Lazy loading for shell completion scripts.")
    (home-page "https://github.com/rsteube/lazycomplete")
    (license license:expat)))

(define-public gitin-bin
  (package
    (name "gitin-bin")
    (version "0.2.5")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/isacikgoz/gitin/releases/download/v0.2.5/gitin-bin-0.2.5-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gitin-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "commit/branch/workdir explorer for git")
    (description "Commit/branch/workdir explorer for git.")
    (home-page "https://github.com/isacikgoz/gitin")
    (license license:bsd-3)))

(define-public probe-bin
  (package
    (name "probe-bin")
    (version "0.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abhimanyu003/probe/releases/download/v0.0.3/probe-bin-0.0.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/probe-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "simplified Integration Testing Using YAML and JQ")
    (description "Simplified Integration Testing Using YAML and JQ.")
    (home-page "https://github.com/abhimanyu003/probe")
    (license license:expat)))

(define-public yeet-bin
  (package
    (name "yeet-bin")
    (version "0.16.0")
    (source (origin
              (method url-fetch)
              (uri "https://yeet.cx/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/yeet-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "yeet daemon and associated tools")
    (description "Yeet daemon and associated tools.")
    (home-page "https://yeet.cx/")
    (license (nonfree "BSD3"))))

(define-public remindme-bin
  (package
    (name "remindme-bin")
    (version "0.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abenz1267/remindme/releases/download/v0.0.8/remindme-bin-0.0.8-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/remindme-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "scheduled notifications")
    (description "Scheduled notifications.")
    (home-page "https://github.com/abenz1267/remindme")
    (license (nonfree "unknown"))))

(define-public pww-bin
  (package
    (name "pww-bin")
    (version "0.0.8")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abenz1267/pww/releases/download/v0.0.8/pww-bin-0.0.8-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/pww-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "utility wrapper around playerctl")
    (description "Utility wrapper around playerctl.")
    (home-page "https://github.com/abenz1267/pww")
    (license (nonfree "unknown"))))

(define-public piknik-bin
  (package
    (name "piknik-bin")
    (version "0.10.2")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jedisct1/piknik/releases/download/v0.10.2/piknik-bin-0.10.2-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/piknik-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "copy/paste anything over the network")
    (description "Copy/paste anything over the network.")
    (home-page "https://github.com/jedisct1/piknik")
    (license license:isc)))

(define-public oxen-server-bin
  (package
    (name "oxen-server-bin")
    (version "0.42.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.oxen.ai/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/oxen-server-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "oxen server. Oxen is a lightning fast data version control system for struc...")
    (description "Oxen server. Oxen is a lightning fast data version control system for structured and unstructured machine learning datasets.")
    (home-page "https://www.oxen.ai/")
    (license license:asl2.0)))

(define-public oxen-bin
  (package
    (name "oxen-bin")
    (version "0.42.2")
    (source (origin
              (method url-fetch)
              (uri "https://www.oxen.ai/")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/oxen-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "oxen CLI. Oxen is a lightning fast data version control system for structur...")
    (description "Oxen CLI. Oxen is a lightning fast data version control system for structured and unstructured machine learning datasets.")
    (home-page "https://www.oxen.ai/")
    (license license:asl2.0)))

(define-public neuralnote-vst3
  (package
    (name "neuralnote-vst3")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DamRsn/NeuralNote")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "neuralnote vst3 release. Audio Plugin for Audio to MIDI transcription using...")
    (description "Neuralnote vst3 release. Audio Plugin for Audio to MIDI transcription using deep learning.")
    (home-page "https://github.com/DamRsn/NeuralNote")
    (license license:asl2.0)))

(define-public neuralnote-bin
  (package
    (name "neuralnote-bin")
    (version "1.1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/DamRsn/NeuralNote/releases/download/v1.1.0/neuralnote-bin-1.1.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/neuralnote-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "neural Note standalone release. Audio Plugin for Audio to MIDI transcriptio...")
    (description "Neural Note standalone release. Audio Plugin for Audio to MIDI transcription using deep learning.")
    (home-page "https://github.com/DamRsn/NeuralNote")
    (license license:asl2.0)))

(define-public bmv-bin
  (package
    (name "bmv-bin")
    (version "0.0.14")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/abenz1267/bmv/releases/download/v0.0.14/bmv-bin-0.0.14-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/bmv-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "drop-in mv replacement with bulk moving support")
    (description "Drop-in mv replacement with bulk moving support.")
    (home-page "https://github.com/abenz1267/bmv")
    (license license:expat)))

(define-public belle-cpu
  (package
    (name "belle-cpu")
    (version "0.2.0")
    (source (origin
              (method url-fetch)
              (uri "https://belle-cpu.xyz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "BELLE - The Big Endian, Low Level Emulator")
    (description "BELLE - The Big Endian, Low Level Emulator.")
    (home-page "https://belle-cpu.xyz")
    (license license:bsd-3)))

(define-public catppuccin-gtk-theme-latte
  (package
    (name "catppuccin-gtk-theme-latte")
    (version "1.0.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/catppuccin/gtk")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system gnu-build-system)
    (arguments (list #:tests? #f))
    (synopsis "soothing pastel theme for GTK3/4 - Latte")
    (description "Soothing pastel theme for GTK3/4 - Latte.")
    (home-page "https://github.com/catppuccin/gtk")
    (license license:gpl3)))

(define-public vkteams-bin
  (package
    (name "vkteams-bin")
    (version "26.1.10.79081")
    (source (origin
              (method url-fetch)
              (uri "https://teams.vk.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/vkteams-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "VK Team app for team collaboration")
    (description "VK Team app for team collaboration.")
    (home-page "https://teams.vk.com")
    (license (nonfree "unknown"))))

(define-public electerm-bin
  (package
    (name "electerm-bin")
    (version "3.6.16")
    (source (origin
              (method url-fetch)
              (uri "https://electerm.html5beta.com")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/electerm-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "an electron-based SSH/SFTP Connection manager and terminal")
    (description "An electron-based SSH/SFTP Connection manager and terminal.")
    (home-page "https://electerm.html5beta.com")
    (license license:expat)))

(define-public xfetch-bin
  (package
    (name "xfetch-bin")
    (version "1.0.0")
    (source (origin
              (method url-fetch)
              (uri "https://codeberg.org/pparaxan/xfetch")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/xfetch-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A simple Arch Linux fetching tool that's not associated with X-Men")
    (description "A simple Arch Linux fetching tool that's not associated with X-Men.")
    (home-page "https://codeberg.org/pparaxan/xfetch")
    (license license:expat)))

(define-public mautrix-whatsapp-bin
  (package
    (name "mautrix-whatsapp-bin")
    (version "0.2604.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/mautrix/whatsapp/releases/download/v0.2604.0/mautrix-whatsapp-bin-0.2604.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/mautrix-whatsapp-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A Matrix-Whatsapp puppeting bridge (binary release)")
    (description "A Matrix-Whatsapp puppeting bridge (binary release).")
    (home-page "https://github.com/mautrix/whatsapp")
    (license license:agpl3+)))

(define-public exfetch-bin
  (package
    (name "exfetch-bin")
    (version "0.11.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/WilliamAnimate/exfetch/releases/download/v0.11.0/exfetch-bin-0.11.0-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/exfetch-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A fork of xFetch designed to look as good as possible, whilst maintaining i...")
    (description "A fork of xFetch designed to look as good as possible, whilst maintaining its high performance.")
    (home-page "https://github.com/WilliamAnimate/exfetch")
    (license license:expat)))

(define-public gsh-bin
  (package
    (name "gsh-bin")
    (version "1.10.3")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/kunchenguid/gsh/releases/download/v1.10.3/gsh-bin-1.10.3-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gsh-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A battery-included, POSIX-compatible, generative shell")
    (description "A battery-included, POSIX-compatible, generative shell.")
    (home-page "https://github.com/kunchenguid/gsh")
    (license license:gpl3+)))

(define-public gotz-bin
  (package
    (name "gotz-bin")
    (version "0.1.15")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/merschformann/gotz/releases/download/v0.1.15/gotz-bin-0.1.15-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/gotz-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A simple CLI timezone info tool")
    (description "A simple CLI timezone info tool.")
    (home-page "https://github.com/merschformann/gotz")
    (license license:expat)))

(define-public flood-bin
  (package
    (name "flood-bin")
    (version "4.13.9")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/jesec/flood/releases/download/v4.13.9/flood-bin-4.13.9-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/flood-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A modern web UI for various torrent clients with a Node.js backend and Reac...")
    (description "A modern web UI for various torrent clients with a Node.js backend and React frontend.")
    (home-page "https://github.com/jesec/flood")
    (license license:gpl3)))

(define-public etcd-bin
  (package
    (name "etcd-bin")
    (version "3.6.10")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/etcd-io/etcd/releases/download/v3.6.10/etcd-bin-3.6.10-linux-x86_64.tar.gz")
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system copy-build-system)
    (arguments
     (list #:install-plan #~'(("." "share/etcd-bin/"))))
    (supported-systems '("x86_64-linux"))
    (synopsis "A highly-available key value store for shared configuration and service dis...")
    (description "A highly-available key value store for shared configuration and service discovery - binary version.")
    (home-page "https://github.com/etcd-io/etcd")
    (license license:asl2.0)))
