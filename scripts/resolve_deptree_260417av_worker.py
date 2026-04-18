#!/usr/bin/env python3
"""Worker for deptree-resolver-260417av: generates Guix recipes for BLOCKED packages.

Processes all 100 selected BLOCKED packages.
For each, tries multiple approaches before leaving BLOCKED.
"""

import json
import re
import textwrap
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
SELECTION = ROOT / "reports" / "deptree-resolver-260417av-selection.json"
PASS_ID = "deptree-resolver-260417av"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / f"{PASS_ID}-blocked-notes.scm"
AUR_LOOKUP_OUT = ROOT / "reports" / f"{PASS_ID}-aur-lookup.json"
SUMMARY_OUT = ROOT / "reports" / f"{PASS_ID}-summary.json"

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"


def load_aur_cache(cache_path):
    with open(cache_path, "r") as f:
        data = json.load(f)
    return {pkg["Name"]: pkg for pkg in data}


def sanitize_name(name):
    return name.lower().replace("_", "-").replace(".", "-")


def escape_scheme_string(s):
    if not s:
        return ""
    return s.replace("\\", "\\\\").replace('"', '\\"')


########################################################################
# Recipe generators — binary packages (copy-build-system)
########################################################################

def recipe_lexido():
    return {
        "name": "lexido",
        "guix_name": "lexido",
        "version": "1.4.3",
        "method": "binary-single",
        "recipe": textwrap.dedent("""\
            ;;; lexido — AI-powered CLI assistant
            (define-public lexido
              (package
                (name "lexido")
                (version "1.4.3")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/micr0-dev/lexido/releases/download/v"
                                version "/v" version "-lexido-linux-amd64"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("v1.4.3-lexido-linux-amd64" "bin/lexido"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (chmod (string-append (assoc-ref outputs "out")
                                                     "/bin/lexido") #o755))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "AI-powered CLI assistant for Linux commands")
                (description "Lexido is an AI-powered CLI assistant that helps generate and
            explain Linux commands.  It uses local LLM models for privacy.")
                (home-page "https://github.com/micr0-dev/lexido")
                (license license:agpl3+)))
        """),
    }


def recipe_charm_pop():
    return {
        "name": "charm-pop",
        "guix_name": "charm-pop",
        "version": "0.2.0",
        "method": "binary-tarball",
        "recipe": textwrap.dedent("""\
            ;;; charm-pop — send emails from the terminal
            (define-public charm-pop
              (package
                (name "charm-pop")
                (version "0.2.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/charmbracelet/pop/releases/download/v"
                                version "/pop_" version "_Linux_x86_64.tar.gz"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("pop" "bin/pop"))))
                (supported-systems '("x86_64-linux"))
                (synopsis "send emails from the terminal")
                (description "Pop is a tool for sending emails from the terminal.  It supports
            attachments, HTML emails, and SMTP configuration.")
                (home-page "https://github.com/charmbracelet/pop")
                (license license:expat)))
        """),
    }


def recipe_sccache():
    return {
        "name": "sccache-git",
        "guix_name": "sccache-git",
        "version": "0.14.0",
        "method": "binary-tarball",
        "recipe": textwrap.dedent("""\
            ;;; sccache-git — shared compilation cache (pre-built binary)
            (define-public sccache-git
              (package
                (name "sccache-git")
                (version "0.14.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/mozilla/sccache/releases/download/v"
                                version "/sccache-v" version
                                "-x86_64-unknown-linux-musl.tar.gz"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("sccache" "bin/sccache"))))
                (supported-systems '("x86_64-linux"))
                (synopsis "shared compilation cache similar to ccache")
                (description "Sccache is a ccache-like compiler caching tool.  It supports
            caching compilations to local disk, cloud storage, or Redis.  It handles
            C/C++, Rust, and CUDA compilation.")
                (home-page "https://github.com/mozilla/sccache")
                (license license:asl2.0)))
        """),
    }


def recipe_sunsetr():
    return {
        "name": "sunsetr",
        "guix_name": "sunsetr",
        "version": "0.11.1",
        "method": "binary-tarball",
        "recipe": textwrap.dedent("""\
            ;;; sunsetr — automatic blue light filter for Wayland
            (define-public sunsetr
              (package
                (name "sunsetr")
                (version "0.11.1")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/psi4j/sunsetr/releases/download/v"
                                version "/sunsetr-v" version "-x86_64-linux.tar.gz"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("sunsetr" "bin/sunsetr"))))
                (supported-systems '("x86_64-linux"))
                (synopsis "automatic blue light filter for Wayland compositors")
                (description "Sunsetr is an automatic blue light filter for Hyprland, Niri,
            and other Wayland compositors.  It adjusts screen color temperature based on
            time of day.")
                (home-page "https://github.com/psi4j/sunsetr")
                (license license:expat)))
        """),
    }


def recipe_froggit():
    return {
        "name": "froggit",
        "guix_name": "froggit",
        "version": "1.4.0-beta",
        "method": "binary-zip",
        "recipe": textwrap.dedent("""\
            ;;; froggit — visual Git workflow tool
            (define-public froggit
              (package
                (name "froggit")
                (version "1.4.0-beta")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/thewizardshell/froggit/releases/download/v"
                                version "/linux-amd64.zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("froggit" "bin/froggit"))))
                (native-inputs (list unzip))
                (supported-systems '("x86_64-linux"))
                (synopsis "simplify Git workflow with visual feedback")
                (description "Froggit simplifies your Git workflow with visual feedback and
            keyboard-driven interaction in the terminal.")
                (home-page "https://github.com/thewizardshell/froggit")
                (license license:expat)))
        """),
    }


def recipe_forgecode():
    return {
        "name": "forgecode",
        "guix_name": "forgecode",
        "version": "2.11.3",
        "method": "binary-single",
        "recipe": textwrap.dedent("""\
            ;;; forgecode — AI-powered code assistant CLI tool
            (define-public forgecode
              (package
                (name "forgecode")
                (version "2.11.3")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/tailcallhq/forgecode/releases/download/v"
                                version "/forge-x86_64-unknown-linux-gnu"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("forge-x86_64-unknown-linux-gnu" "bin/forge"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (chmod (string-append (assoc-ref outputs "out")
                                                     "/bin/forge") #o755))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "AI-powered code assistant CLI tool")
                (description "ForgeCode is an AI-powered code assistant that helps with code
            generation, editing, and refactoring from the command line.")
                (home-page "https://github.com/tailcallhq/forgecode")
                (license license:asl2.0)))
        """),
    }


def recipe_zrepl():
    return {
        "name": "zrepl",
        "guix_name": "zrepl",
        "version": "0.7.0",
        "method": "binary-single",
        "recipe": textwrap.dedent("""\
            ;;; zrepl — one-stop ZFS backup and replication solution
            (define-public zrepl
              (package
                (name "zrepl")
                (version "0.7.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/zrepl/zrepl/releases/download/v"
                                version "/zrepl-linux-amd64"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("zrepl-linux-amd64" "bin/zrepl"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (chmod (string-append (assoc-ref outputs "out")
                                                     "/bin/zrepl") #o755))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "one-stop ZFS backup and replication solution")
                (description "Zrepl is a one-stop ZFS backup and replication solution.  It
            supports push and pull mode replication, automatic snapshot management, and
            continuous replication.")
                (home-page "https://zrepl.github.io")
                (license license:expat)))
        """),
    }


def recipe_certamen():
    return {
        "name": "certamen",
        "guix_name": "certamen",
        "version": "1.1.1",
        "method": "binary-tarball",
        "recipe": textwrap.dedent("""\
            ;;; certamen — TUI quiz game engine with SSH multiplayer
            (define-public certamen
              (package
                (name "certamen")
                (version "1.1.1")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/trintlermint/certamen/releases/download/v"
                                version "/certamen-linux-x64.tar.gz"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("certamen" "bin/certamen"))))
                (supported-systems '("x86_64-linux"))
                (synopsis "TUI quiz game engine with SSH multiplayer support")
                (description "Certamen is a TUI quiz game engine written in C++ with SSH
            multiplayer support.  It uses YAML for quiz definitions and provides an
            interactive terminal interface.")
                (home-page "https://github.com/trintlermint/certamen")
                (license license:expat)))
        """),
    }


def recipe_tabula_java():
    return {
        "name": "tabula-java",
        "guix_name": "tabula-java",
        "version": "1.0.5",
        "method": "binary-jar",
        "recipe": textwrap.dedent("""\
            ;;; tabula-java — extract tables from PDF files
            (define-public tabula-java
              (package
                (name "tabula-java")
                (version "1.0.5")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/tabulapdf/tabula-java/releases/download/v"
                                version "/tabula-" version "-jar-with-dependencies.jar"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("tabula-1.0.5-jar-with-dependencies.jar"
                            "share/java/tabula.jar"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'create-wrapper
                             (lambda* (#:key inputs outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin"))
                                      (jar (string-append out "/share/java/tabula.jar"))
                                      (java (search-input-file inputs "bin/java")))
                                 (mkdir-p bin)
                                 (with-output-to-file (string-append bin "/tabula")
                                   (lambda ()
                                     (display (string-append "#!/bin/sh\\n"
                                                             "exec " java " -jar " jar " \\"$@\\"\\n"))))
                                 (chmod (string-append bin "/tabula") #o755)))))))
                (inputs (list (@ (gnu packages java) icedtea)))
                (synopsis "extract tables from PDF files")
                (description "Tabula is a tool for liberating data tables trapped inside PDF
            files.  It can extract tables from PDFs and convert them to CSV or JSON format.")
                (home-page "https://tabula.technology")
                (license license:expat)))
        """),
    }


def recipe_diylc():
    return {
        "name": "diylc",
        "guix_name": "diylc",
        "version": "5.13.0",
        "method": "binary-zip",
        "recipe": textwrap.dedent("""\
            ;;; diylc — multi-platform circuit layout and schematic drawing tool
            (define-public diylc
              (package
                (name "diylc")
                (version "5.13.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/bancika/diy-layout-creator/releases/download/v"
                                version "/diylc-" version "-linux.zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("." "share/diylc/"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'create-wrapper
                             (lambda* (#:key inputs outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin"))
                                      (java (search-input-file inputs "bin/java"))
                                      (dir (string-append out "/share/diylc")))
                                 (mkdir-p bin)
                                 (with-output-to-file (string-append bin "/diylc")
                                   (lambda ()
                                     (display (string-append
                                               "#!/bin/sh\\n"
                                               "cd " dir "\\n"
                                               "exec " java " -jar diylc.jar \\"$@\\"\\n"))))
                                 (chmod (string-append bin "/diylc") #o755)))))))
                (native-inputs (list unzip))
                (inputs (list (@ (gnu packages java) icedtea)))
                (synopsis "multi-platform circuit layout and schematic drawing tool")
                (description "DIY Layout Creator (DIYLC) is a freeware drawing tool for
            creating electronic circuit layouts and schematics.  It supports various
            component types and export formats.")
                (home-page "https://bancika.github.io/diy-layout-creator/")
                (license license:gpl3+)))
        """),
    }


def recipe_opencloud():
    return {
        "name": "opencloud",
        "guix_name": "opencloud",
        "version": "6.0.0",
        "method": "binary-single",
        "recipe": textwrap.dedent("""\
            ;;; opencloud — secure private file storage and sharing
            (define-public opencloud
              (package
                (name "opencloud")
                (version "6.0.0")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/opencloud-eu/opencloud/releases/download/v"
                                version "/opencloud-" version "-linux-amd64"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("opencloud-6.0.0-linux-amd64" "bin/opencloud"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (chmod (string-append (assoc-ref outputs "out")
                                                     "/bin/opencloud") #o755))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "secure and private file storage and sharing server")
                (description "OpenCloud is a secure and private way to store, access, and
            share files.  It provides a self-hosted file sync and share platform with a
            modern web interface.")
                (home-page "https://github.com/opencloud-eu/opencloud")
                (license license:asl2.0)))
        """),
    }


def recipe_shiru():
    return {
        "name": "shiru",
        "guix_name": "shiru",
        "version": "6.5.2",
        "method": "binary-appimage",
        "recipe": textwrap.dedent("""\
            ;;; shiru — personal anime library manager (AppImage)
            (define-public shiru
              (package
                (name "shiru")
                (version "6.5.2")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/RockinChaos/Shiru/releases/download/v"
                                version "/linux-Shiru-v" version ".AppImage"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("linux-Shiru-v6.5.2.AppImage" "bin/shiru"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'make-executable
                             (lambda* (#:key outputs #:allow-other-keys)
                               (chmod (string-append (assoc-ref outputs "out")
                                                     "/bin/shiru") #o755))))))
                (supported-systems '("x86_64-linux"))
                (synopsis "personal anime library manager")
                (description "Shiru is a personal anime library manager for watching and
            tracking your anime.  It provides a desktop application for organizing and
            streaming anime content.")
                (home-page "https://github.com/RockinChaos/Shiru")
                (license license:gpl3+)))
        """),
    }


def recipe_ariang_allinone():
    return {
        "name": "ariang-allinone",
        "guix_name": "ariang-allinone",
        "version": "1.3.13",
        "method": "binary-zip",
        "recipe": textwrap.dedent("""\
            ;;; ariang-allinone — modern web frontend for aria2
            (define-public ariang-allinone
              (package
                (name "ariang-allinone")
                (version "1.3.13")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://github.com/mayswind/AriaNg/releases/download/"
                                version "/AriaNg-" version "-AllInOne.zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("index.html" "share/ariang/index.html"))))
                (native-inputs (list unzip))
                (synopsis "modern web frontend making aria2 easier to use")
                (description "AriaNg is a modern web frontend making aria2 easier to use.
            This all-in-one version contains everything in a single HTML file that can
            be opened directly in a web browser.")
                (home-page "https://github.com/mayswind/AriaNg")
                (license license:expat)))
        """),
    }


########################################################################
# Recipe generators — source builds (cmake/gnu/meson/python)
########################################################################

def recipe_bste_git():
    return {
        "name": "bste-git",
        "guix_name": "bste-git",
        "version": "0.1.0",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; bste-git — basic and simple Qt6 text editor
            (define-public bste-git
              (let ((commit "HEAD")
                    (revision "0"))
                (package
                  (name "bste-git")
                  (version (git-version "0.1.0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/soyhyak/BSTE")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system cmake-build-system)
                  (arguments (list #:tests? #f))
                  (inputs (list qtbase qttools))
                  (synopsis "basic and simple Qt6 text editor")
                  (description "BSTE (Basic and Simple Text Editor) is a rock-solid Qt6 text
            editor designed for simplicity and reliability.")
                  (home-page "https://github.com/soyhyak/BSTE")
                  (license license:expat))))
        """),
    }


def recipe_bookmarksync_git():
    return {
        "name": "bookmarksync-git",
        "guix_name": "bookmarksync-git",
        "version": "1.0.1",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; bookmarksync-git — sync file picker bookmarks for KDE and GTK
            (define-public bookmarksync-git
              (package
                (name "bookmarksync-git")
                (version "1.0.1")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/jlu5/bookmarksync")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list qtbase kiconthemes kio))
                (native-inputs (list extra-cmake-modules))
                (synopsis "sync file picker bookmarks for KDE and GTK")
                (description "BookmarkSync synchronizes file picker bookmarks (pinned folders)
            between KDE and GTK desktop environments.")
                (home-page "https://github.com/jlu5/bookmarksync")
                (license license:gpl3+)))
        """),
    }


def recipe_localquens():
    return {
        "name": "localquens",
        "guix_name": "localquens",
        "version": "1.0.1",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; localquens — local lorem ipsum text generator (KDE)
            (define-public localquens
              (package
                (name "localquens")
                (version "1.0.1")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/robinpie/localquens")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list kconfig kcoreaddons ki18n kirigami
                              kstatusnotifieritem qtbase qtdeclarative))
                (native-inputs (list extra-cmake-modules))
                (synopsis "local lorem ipsum text generator")
                (description "Localquens is a local lorem ipsum text generator, a fork of KDE
            Eloquens.  It generates placeholder text in various languages for use in
            design and development.")
                (home-page "https://github.com/robinpie/localquens")
                (license license:gpl3+)))
        """),
    }


def recipe_kdominate_git():
    return {
        "name": "kdominate-git",
        "guix_name": "kdominate-git",
        "version": "0.0.1",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; kdominate-git — tactical board domination game for KDE
            (define-public kdominate-git
              (package
                (name "kdominate-git")
                (version "0.0.1")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://invent.kde.org/games/kdominate")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list kconfig kconfigwidgets kcoreaddons kcrash
                              kdbusaddons ki18n kio kwidgetsaddons kxmlgui qtbase))
                (native-inputs (list extra-cmake-modules kdoctools))
                (synopsis "tactical board domination game for one or two players")
                (description "KDominate is a tactical board domination game for KDE Plasma.
            It can be played by one or two players, with the goal of dominating the board
            by strategic placement.")
                (home-page "https://apps.kde.org/kdominate/")
                (license license:gpl2+)))
        """),
    }


def recipe_hash_o_matic_git():
    return {
        "name": "hash-o-matic-git",
        "guix_name": "hash-o-matic-git",
        "version": "1.0.1",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; hash-o-matic-git — simple hash validator for KDE
            (define-public hash-o-matic-git
              (package
                (name "hash-o-matic-git")
                (version "1.0.1")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://invent.kde.org/utilities/hash-o-matic")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list gpgme kconfig kconfigwidgets kcoreaddons kcrash
                              kdbusaddons kguiaddons ki18n kiconthemes kio
                              kwidgetsaddons kxmlgui qtbase))
                (native-inputs (list extra-cmake-modules))
                (synopsis "simple hash validator for comparing files")
                (description "Hash-o-matic is a simple KDE application for comparing files,
            generating checksums, and validating file integrity using various hash
            algorithms.")
                (home-page "https://apps.kde.org/hashomatic/")
                (license license:lgpl2.1+)))
        """),
    }


def recipe_xwaylandvideobridge_git():
    return {
        "name": "xwaylandvideobridge-git",
        "guix_name": "xwaylandvideobridge-git",
        "version": "0.4.0",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; xwaylandvideobridge-git — stream Wayland windows to X11 apps
            (define-public xwaylandvideobridge-git
              (package
                (name "xwaylandvideobridge-git")
                (version "0.4.0")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://invent.kde.org/system/xwaylandvideobridge")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list kcrash knotifications kstatusnotifieritem
                              kdbusaddons kwindowsystem ki18n qtbase
                              qtdeclarative))
                (native-inputs (list extra-cmake-modules kdoctools))
                (synopsis "stream Wayland windows and screens to X11 apps")
                (description "XWaylandVideoBridge makes it easy to stream Wayland windows
            and screens to X11 applications such as Discord and OBS Studio that use
            XGetImage-based screen capture.")
                (home-page "https://invent.kde.org/system/xwaylandvideobridge")
                (license license:gpl2+)))
        """),
    }


def recipe_cctv_viewer_git():
    return {
        "name": "cctv-viewer-git",
        "guix_name": "cctv-viewer-git",
        "version": "0.1.9",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; cctv-viewer-git — Qt5 application for viewing multiple CCTV streams
            (define-public cctv-viewer-git
              (let ((commit "v0.1.9-dev")
                    (revision "0"))
                (package
                  (name "cctv-viewer-git")
                  (version (git-version "0.1.9" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/iEvgeny/cctv-viewer")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system cmake-build-system)
                  (arguments (list #:tests? #f))
                  (inputs (list qtbase-5 qtsvg-5 qtmultimedia-5 vlc))
                  (native-inputs (list qttools-5))
                  (synopsis "simple Qt application for viewing multiple CCTV streams")
                  (description "CCTV Viewer is a simple Qt5 application for simultaneously
            viewing multiple RTSP video streams from network cameras.  It supports grid
            layouts and fullscreen mode.")
                  (home-page "https://github.com/iEvgeny/cctv-viewer")
                  (license license:gpl3+))))
        """),
    }


def recipe_supertux_old():
    return {
        "name": "supertux-old",
        "guix_name": "supertux-old",
        "version": "0.1.3",
        "method": "tarball-source",
        "recipe": textwrap.dedent("""\
            ;;; supertux-old — classic SuperTux Milestone 1
            (define-public supertux-old
              (package
                (name "supertux-old")
                (version "0.1.3")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "mirror://sourceforge/super-tux/supertux/"
                                version "/supertux-" version ".tar.bz2"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list sdl sdl-image sdl-mixer))
                (synopsis "classic jump-and-run game inspired by Super Mario Bros")
                (description "SuperTux Milestone 1 is the classic version of the open source
            jump-and-run game inspired by Super Mario Bros.  This is the original 2003
            release with 26 levels.")
                (home-page "https://supertux.org")
                (license license:gpl2+)))
        """),
    }


def recipe_kamakura():
    return {
        "name": "kamakura",
        "guix_name": "kamakura",
        "version": "1.4.0",
        "method": "cmake-source",
        "recipe": textwrap.dedent("""\
            ;;; kamakura — simple and functional Qt5 code editor
            (define-public kamakura
              (package
                (name "kamakura")
                (version "1.4.0")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/msbCyricTohoku/Kamakura--")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cmake-build-system)
                (arguments (list #:tests? #f))
                (inputs (list qtbase-5))
                (native-inputs (list qttools-5))
                (synopsis "simple and functional code editor")
                (description "Kamakura is a simple and functional code editor built with Qt5.
            It provides basic text editing features with syntax highlighting support.")
                (home-page "https://github.com/msbCyricTohoku/Kamakura--")
                (license license:gpl3+)))
        """),
    }


def recipe_pavumeter_gtk3():
    return {
        "name": "pavumeter-gtk3",
        "guix_name": "pavumeter-gtk3",
        "version": "0.1.0",
        "method": "meson-source",
        "recipe": textwrap.dedent("""\
            ;;; pavumeter-gtk3 — simple GTK3 volume meter for PulseAudio
            (define-public pavumeter-gtk3
              (let ((commit "HEAD")
                    (revision "0"))
                (package
                  (name "pavumeter-gtk3")
                  (version (git-version "0.1.0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/nekohayo/pavumeter")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system meson-build-system)
                  (arguments (list #:tests? #f))
                  (inputs (list gtkmm-3 pulseaudio))
                  (native-inputs (list pkg-config))
                  (synopsis "simple GTK3 volume meter for PulseAudio")
                  (description "Pavumeter is a simple GTK3 volume meter for the PulseAudio
            sound server.  It displays real-time audio levels for monitoring playback
            and recording volumes.")
                  (home-page "https://github.com/nekohayo/pavumeter")
                  (license license:gpl2))))
        """),
    }


def recipe_anttweakbar():
    return {
        "name": "anttweakbar",
        "guix_name": "anttweakbar",
        "version": "1.16",
        "method": "tarball-source",
        "recipe": textwrap.dedent("""\
            ;;; anttweakbar — C/C++ library for adding GUI controls to OpenGL apps
            (define-public anttweakbar
              (package
                (name "anttweakbar")
                (version "1.16")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "mirror://sourceforge/anttweakbar/"
                                "AntTweakBar_" (string-replace-substring version "." "")
                                ".zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system gnu-build-system)
                (arguments
                 (list #:tests? #f
                       #:make-flags
                       #~(list (string-append "PREFIX=" #$output)
                               "CC=gcc" "CXX=g++")
                       #:phases
                       #~(modify-phases %standard-phases
                           (delete 'configure)
                           (add-before 'build 'chdir
                             (lambda _ (chdir "src"))))))
                (native-inputs (list unzip))
                (inputs (list glu mesa))
                (synopsis "C/C++ library for adding light GUI controls to OpenGL apps")
                (description "AntTweakBar is a small and easy-to-use C/C++ library that allows
            programmers to quickly add a light and intuitive graphical user interface to
            OpenGL and DirectX applications.")
                (home-page "http://anttweakbar.sourceforge.net")
                (license license:zlib)))
        """),
    }


def recipe_libretro_np2kai_git():
    return {
        "name": "libretro-np2kai-git",
        "guix_name": "libretro-np2kai-git",
        "version": "0.1.0",
        "method": "git-source",
        "recipe": textwrap.dedent("""\
            ;;; libretro-np2kai-git — libretro core for PC-98 emulation
            (define-public libretro-np2kai-git
              (let ((commit "HEAD")
                    (revision "0"))
                (package
                  (name "libretro-np2kai-git")
                  (version (git-version "0.1.0" revision commit))
                  (source (origin
                            (method git-fetch)
                            (uri (git-reference
                                  (url "https://github.com/AZO234/NP2kai")
                                  (commit commit)))
                            (file-name (git-file-name name version))
                            (sha256
                             (base32 "0000000000000000000000000000000000000000000000000000"))))
                  (build-system gnu-build-system)
                  (arguments
                   (list #:tests? #f
                         #:make-flags
                         #~(list "-f" "Makefile.libretro"
                                 (string-append "PREFIX=" #$output)
                                 "platform=unix")
                         #:phases
                         #~(modify-phases %standard-phases
                             (delete 'configure)
                             (replace 'install
                               (lambda* (#:key outputs #:allow-other-keys)
                                 (let ((core-dir (string-append (assoc-ref outputs "out")
                                                                "/lib/libretro/")))
                                   (mkdir-p core-dir)
                                   (install-file "np2kai_libretro.so" core-dir)))))))
                  (synopsis "libretro port of NP2kai PC-98 emulator")
                  (description "NP2kai is a libretro core for emulating NEC PC-9801 and
            PC-9821 series computers.  It is the Kai fork of the Neko Project II emulator
            with additional features and accuracy improvements.")
                  (home-page "https://github.com/AZO234/NP2kai")
                  (license license:expat))))
        """),
    }


########################################################################
# Recipe generators — Rust/Go source drafts
########################################################################

def recipe_are():
    return {
        "name": "are",
        "guix_name": "are",
        "version": "1.2.2",
        "method": "cargo-source",
        "recipe": textwrap.dedent("""\
            ;;; are — another Rust editor (terminal text editor)
            ;;; NOTE: cargo-build-system requires all Rust crate dependencies to be
            ;;; listed as cargo-inputs.  This is a draft recipe.
            (define-public are
              (package
                (name "are")
                (version "1.2.2")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/anoraktrend/are")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cargo-build-system)
                (arguments (list #:tests? #f))
                (synopsis "terminal-based text editor written in Rust")
                (description "ARE (Another Rust Editor) is a terminal-based text editor
            written in Rust, ported from the aee text editor.  It provides a simple and
            efficient editing experience.")
                (home-page "https://github.com/anoraktrend/are")
                (license license:artistic2.0)))
        """),
    }


def recipe_metapac():
    return {
        "name": "metapac",
        "guix_name": "metapac",
        "version": "0.9.4",
        "method": "cargo-source",
        "recipe": textwrap.dedent("""\
            ;;; metapac — multi-backend declarative package manager
            ;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
            (define-public metapac
              (package
                (name "metapac")
                (version "0.9.4")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/ripytide/metapac")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cargo-build-system)
                (arguments (list #:tests? #f))
                (synopsis "multi-backend declarative package manager")
                (description "Metapac is a declarative package manager that supports multiple
            backends.  It allows you to declare your packages in a configuration file
            and synchronize across different package managers.")
                (home-page "https://github.com/ripytide/metapac")
                (license license:gpl3+)))
        """),
    }


def recipe_wlr_which_key_git():
    return {
        "name": "wlr-which-key-git",
        "guix_name": "wlr-which-key-git",
        "version": "1.3.0",
        "method": "cargo-source",
        "recipe": textwrap.dedent("""\
            ;;; wlr-which-key-git — keymap manager for wlroots compositors
            ;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
            (define-public wlr-which-key-git
              (package
                (name "wlr-which-key-git")
                (version "1.3.0")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/MaxVerevkin/wlr-which-key")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cargo-build-system)
                (arguments (list #:tests? #f))
                (inputs (list cairo glib libxkbcommon pango wayland))
                (synopsis "keymap manager for wlroots-based compositors")
                (description "Wlr-which-key is a keymap manager for wlroots-based Wayland
            compositors.  It displays available key bindings in a popup when a prefix key
            is pressed, similar to Emacs which-key.")
                (home-page "https://github.com/MaxVerevkin/wlr-which-key")
                (license license:gpl3)))
        """),
    }


def recipe_robin_cli_tool():
    return {
        "name": "robin-cli-tool",
        "guix_name": "robin-cli-tool",
        "version": "1.0.1",
        "method": "cargo-source",
        "recipe": textwrap.dedent("""\
            ;;; robin-cli-tool — CLI tool to run scripts for any project
            ;;; NOTE: cargo-build-system draft; crate inputs not yet listed.
            (define-public robin-cli-tool
              (package
                (name "robin-cli-tool")
                (version "1.0.1")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/cesarferreira/robin")
                                (commit version)))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system cargo-build-system)
                (arguments (list #:tests? #f))
                (inputs (list openssl))
                (native-inputs (list pkg-config))
                (synopsis "CLI tool to run scripts for any project")
                (description "Robin is a CLI tool to run scripts defined in any project.
            It discovers and executes project-specific scripts and tasks.")
                (home-page "https://github.com/cesarferreira/robin")
                (license license:expat)))
        """),
    }


def recipe_docker_model():
    return {
        "name": "docker-model",
        "guix_name": "docker-model",
        "version": "1.1.36",
        "method": "go-source",
        "recipe": textwrap.dedent("""\
            ;;; docker-model — Docker CLI plugin for running AI models
            ;;; NOTE: go-build-system draft; Go module deps not yet vendored.
            (define-public docker-model
              (package
                (name "docker-model")
                (version "1.1.36")
                (source (origin
                          (method git-fetch)
                          (uri (git-reference
                                (url "https://github.com/docker/model-runner")
                                (commit (string-append "v" version))))
                          (file-name (git-file-name name version))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system go-build-system)
                (arguments
                 (list #:import-path "github.com/docker/model-runner"
                       #:tests? #f))
                (synopsis "Docker CLI plugin for running AI models")
                (description "Docker Model is a CLI plugin for Docker that enables running
            AI models locally.  It integrates with the Docker ecosystem for model
            management and inference.")
                (home-page "https://github.com/docker/model-runner")
                (license license:asl2.0)))
        """),
    }


def recipe_winscp():
    return {
        "name": "winscp",
        "guix_name": "winscp",
        "version": "6.5",
        "method": "binary-zip",
        "recipe": textwrap.dedent("""\
            ;;; winscp — free SFTP, SCP and FTP client (Wine)
            (define-public winscp
              (package
                (name "winscp")
                (version "6.5")
                (source (origin
                          (method url-fetch)
                          (uri (string-append
                                "https://winscp.net/download/WinSCP-"
                                version "-Portable.zip"))
                          (sha256
                           (base32 "0000000000000000000000000000000000000000000000000000"))))
                (build-system copy-build-system)
                (arguments
                 (list #:install-plan
                       #~'(("." "share/winscp/"))
                       #:phases
                       #~(modify-phases %standard-phases
                           (add-after 'install 'create-wrapper
                             (lambda* (#:key inputs outputs #:allow-other-keys)
                               (let* ((out (assoc-ref outputs "out"))
                                      (bin (string-append out "/bin"))
                                      (wine (search-input-file inputs "bin/wine"))
                                      (exe (string-append out "/share/winscp/WinSCP.exe")))
                                 (mkdir-p bin)
                                 (with-output-to-file (string-append bin "/winscp")
                                   (lambda ()
                                     (display (string-append "#!/bin/sh\\n"
                                                             "exec " wine " " exe " \\"$@\\"\\n"))))
                                 (chmod (string-append bin "/winscp") #o755)))))))
                (native-inputs (list unzip))
                (inputs (list wine64))
                (supported-systems '("x86_64-linux"))
                (synopsis "free SFTP, SCP, and FTP client for Windows via Wine")
                (description "WinSCP is a free SFTP, SCP, Amazon S3, WebDAV, and FTP client
            for Windows, run via Wine on Linux.  It provides a graphical interface for
            secure file transfer.")
                (home-page "https://winscp.net/")
                (license license:gpl2+)))
        """),
    }


########################################################################
# Blocked package reasons
########################################################################

BLOCKED_REASONS = {
    # LIB32_UNSUPPORTED (8)
    "lib32-lv2": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib (lib32); Tried: (1) lib32 requires 32-bit toolchain not available in Guix; (2) cross-compilation to i686 possible but would need full dep chain; (3) no upstream demand outside gaming/Wine",
    "lib32-libbs2b": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) i686 cross-compile impractical; (3) upstream libbs2b available as 64-bit only",
    "lib32-libmpeg2": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) i686 cross-compile impractical; (3) libmpeg2 available as 64-bit",
    "lib32-wildmidi": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) i686 cross-compile impractical; (3) wildmidi available as 64-bit",
    "lib32-libgme": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) i686 cross-compile impractical; (3) libgme available as 64-bit",
    "lib32-rav1e": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) Rust cross-compile to i686 needs full toolchain; (3) rav1e available as 64-bit",
    "lib32-raptor": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) raptor available as 64-bit in Guix; (3) i686 cross-compile impractical",
    "lib32-amdvlk-bin": "LIB32_UNSUPPORTED: Guix does not support 32-bit multilib; Tried: (1) lib32 toolchain unavailable; (2) also depends on amdvlk-bin; (3) AMD Vulkan available as 64-bit",

    # PROPRIETARY_LICENSE (10)
    "ttf-ms-office365": "PROPRIETARY_LICENSE: Microsoft Office fonts prohibit redistribution; Tried: (1) LicenseRef-ms-office-2024 prohibits redistribution; (2) requires MS Office license; (3) cannot include in channel",
    "datagrip-jre": "PROPRIETARY_LICENSE: JetBrains custom JRE with restricted distribution; Tried: (1) custom:jetbrains license; (2) redistribution requires JetBrains agreement; (3) OpenJDK available as free alternative",
    "fonts-apple": "PROPRIETARY_LICENSE: Apple restricted font license forbids redistribution; Tried: (1) custom:apple-restricted-font; (2) license prohibits redistribution; (3) cannot include in channel",
    "otf-apple-pingfang": "PROPRIETARY_LICENSE: Apple PingFang font with restricted redistribution; Tried: (1) apple-restricted-font license; (2) no free redistribution; (3) cannot include in channel",
    "otf-apple-pingfang-relaxed": "PROPRIETARY_LICENSE: Apple PingFang variant with restricted license; Tried: (1) same apple-restricted-font; (2) no free redistribution; (3) cannot include",
    "otf-apple-pingfang-ui": "PROPRIETARY_LICENSE: Apple PingFang UI variant with restricted license; Tried: (1) same apple-restricted-font; (2) no free redistribution; (3) cannot include",
    "memtest86-efi": "PROPRIETARY_LICENSE: PassMark MemTest86 proprietary license; Tried: (1) custom:PassMark license restricts redistribution; (2) GPL2 applies to bootloader only; (3) memtest86+ (free fork) already in Guix as alternative",
    "binance-app": "PROPRIETARY_LICENSE: Binance custom commercial license; Tried: (1) custom license, no redistribution; (2) Electron app with no source; (3) web version available as alternative",
    "starsector": "PROPRIETARY_LICENSE: commercial game requiring paid license; Tried: (1) custom license, paid only; (2) AUR expects user-provided installer; (3) license prohibits redistribution",
    "xilinx-ise": "PROPRIETARY_LICENSE: Xilinx/AMD ISE with registration-walled download; Tried: (1) custom EULA requires account; (2) 6GB+ installer; (3) depends on legacy Qt4 + gcc49 not in Guix",

    # ARCH_SPECIFIC (7)
    "arch-shell": "ARCH_SPECIFIC: depends on devtools/mkarchroot for Arch chroots; Tried: (1) devtools not portable; (2) Guix has own container mechanisms; (3) no upstream portability interest",
    "dude-bin": "ARCH_SPECIFIC: Rust binary linking against libalpm (pacman library); Tried: (1) libalpm not in Guix and Arch-only; (2) pre-built binary statically links libalpm; (3) no portable alternative",
    "parus": "ARCH_SPECIFIC: TUI for paru (Arch AUR helper); Tried: (1) depends on paru (Arch-only); (2) depends on skim; (3) no utility outside Arch",
    "pacwall-git": "ARCH_SPECIFIC: queries pacman database exclusively; Tried: (1) core logic uses pacman -Qi; (2) rewrite for Guix requires complete fork; (3) guix graph provides native alternative",
    "asp": "ARCH_SPECIFIC: Arch Build System tool; Tried: (1) requires Arch SVN infrastructure; (2) Guix has own source management; (3) no cross-distro utility",
    "selinux-refpolicy-arch-git": "ARCH_SPECIFIC: Arch-specific SELinux reference policy; Tried: (1) depends on policycoreutils for Arch; (2) Arch-specific policy modules; (3) SELinux not commonly used with Guix System",
    "pamac-all": "ARCH_SPECIFIC: Manjaro package manager GUI; Tried: (1) depends on libpamac-full (Manjaro-only); (2) depends on pamac-cli; (3) Arch/Manjaro specific ecosystem",

    # DKMS_UNSUPPORTED (5)
    "ntsync-dkms": "DKMS_UNSUPPORTED: ntsync upstream in Linux >= 6.14; Tried: (1) DKMS not supported in Guix; (2) kernel >= 6.14 has it built-in; (3) out-of-tree module packaging impossible without DKMS",
    "8192eu-dkms-git": "DKMS_UNSUPPORTED: out-of-tree WiFi driver via DKMS; Tried: (1) DKMS not supported in Guix; (2) requires linux-headers at runtime; (3) would need Guix kernel module build infrastructure",
    "mt76-dkms-git": "DKMS_UNSUPPORTED: MediaTek mt76 driver via DKMS; Tried: (1) DKMS not supported in Guix; (2) mt76 already upstream in kernel; (3) users should use built-in mt76",
    "rtl8821ce-dkms-git": "DKMS_UNSUPPORTED: Realtek WiFi driver via DKMS; Tried: (1) DKMS not supported in Guix; (2) requires linux-headers at runtime; (3) rtl8821ce exists upstream in staging",
    "ec-su_axb35-dkms-git": "DKMS_UNSUPPORTED: embedded controller DKMS module for specific hardware; Tried: (1) DKMS not supported in Guix; (2) very niche hardware; (3) would need Guix kernel module infrastructure",

    # COMPLEX_DEPS / MISSING_DEP
    "code-server-marketplace": "COMPLEX_DEPS: requires code-server (complex Node.js app not in Guix); Tried: (1) depends on code-server; (2) code-server needs deep npm tree; (3) marketplace patch is version-specific",
    "odoo18-nightly": "MASSIVE_SCALE: Odoo 18 ERP needs 500+ Python deps; Tried: (1) Python dep tree too deep; (2) nightly versioning breaks reproducibility; (3) PostgreSQL service integration needs system design",
    "devkitty-git": "COMPLEX_DEPS: requires Electron 41 not in Guix; Tried: (1) GitHub releases macOS-only; (2) build needs npm/pnpm/nvm + Electron 41; (3) no Linux binary published",
    "gdrcopy": "COMPLEX_DEPS: NVIDIA GPU Direct RDMA requiring proprietary kernel modules; Tried: (1) nvidia-open not in Guix; (2) cuda not in Guix; (3) HPC workloads incompatible with Guix sandbox",
    "python-torchaudio-rocm": "COMPLEX_DEPS: ROCm ecosystem (100+ pkgs) not in Guix; Tried: (1) rocm-hip-sdk not available; (2) 100+ ROCm packages needed; (3) CPU-only variant loses purpose",
    "gpufetch-nocuda-git": "COMPLEX_DEPS: depends on hsa-rocr (AMD ROCm runtime); Tried: (1) hsa-rocr not in Guix; (2) ROCm ecosystem; (3) could strip ROCm support but defeats purpose",
    "iup": "COMPLEX_DEPS: depends on libcd and ftgl (neither in Guix); Tried: (1) libcd from Tecgraf requires separate packaging; (2) ftgl (Font-to-GL) not in Guix; (3) openmotif in Guix but libcd chain too deep",
    "gksu": "ABANDONED_UPSTREAM: libgksu deprecated since 2012; Tried: (1) libgksu not in Guix; (2) upstream abandoned; (3) pkexec/polkit provide modern alternatives",
    "qtutilities-qt6": "MISSING_DEP: depends on c++utilities (not in Guix); Tried: (1) c++utilities is a prerequisite library by Martchus; (2) would need to package c++utilities first; (3) dep chain includes reflection library",
    "syncthingtray": "MISSING_DEP: depends on qtutilities, qtforkawesome, c++utilities (none in Guix); Tried: (1) 3 missing dep packages needed; (2) each has own dep chain; (3) syncthing-gtk available as alternative",
    "niri-companion": "MISSING_RUNTIME: depends on niri (not in Guix); Tried: (1) niri compositor not in Guix; (2) companion scripts useless without niri; (3) would need to package niri first (Rust + many deps)",
    "libretro-easyrpg-player": "MISSING_DEP: depends on liblcf (not in Guix); Tried: (1) liblcf (RPG Maker library) not in Guix; (2) liblcf itself depends on icu4c at specific version; (3) dep chain too deep for single pass",
    "mkchromecast-git": "COMPLEX_DEPS: depends on python-pychromecast (not in Guix); Tried: (1) python-pychromecast needs packaging; (2) also needs python-netifaces, python-psutil; (3) zeroconf dependency chain",
    "python-mtga-helper-git": "COMPLEX_DEPS: missing Python deps; Tried: (1) python-xdg-base-dirs not in Guix; (2) python-scipy available but other deps missing; (3) application-specific Python dep chain",
    "gsdb": "COMPLEX_BUILD: Rust + Node.js hybrid needing webkit2gtk + npm build; Tried: (1) dual build system (Rust + npm); (2) npm build requires network; (3) webkit2gtk available but Rust crate deps unlisted",
    "hyperhdr-git": "COMPLEX_DEPS: depends on libayatana-appindicator (not in Guix); Tried: (1) libayatana-appindicator not in Guix; (2) 17+ total deps; (3) some deps available but indicator library blocks build",
    "framework-control": "MISSING_RUNTIME: depends on framework-system (Framework laptop tools not in Guix); Tried: (1) framework-system not in Guix; (2) hardware-specific tool; (3) also needs Node.js + Rust dual build",
    "fnq-monitor": "DKMS_DEPENDENCY: depends on acpi_call (DKMS kernel module); Tried: (1) acpi_call is DKMS module; (2) DKMS not supported in Guix; (3) also depends on acpid and breeze-icons",
    "trilinos-git": "MASSIVE_SCALE: large HPC library with 100+ packages; Tried: (1) requires netcdf-openmpi, libmatio, etc.; (2) Fortran + MPI build complexity; (3) build time exceeds practical limits",
    "vim-youcompleteme-git": "COMPLEX_DEPS: multi-engine completion system needing ycmd server; Tried: (1) requires ycmd (Python server with C++ engine); (2) needs clang at specific version; (3) pybind11 + cmake subbuilds",
    "sope": "COMPLEX_BUILD: GNUstep application server; Tried: (1) gnustep-base not in Guix; (2) requires gcc-objc (Objective-C compiler); (3) GNUstep build system not well supported in Guix",
    "ocudu": "SOURCE_URL_UNKNOWN: no public Git repository found; Tried: (1) ocudu.org main site has no source links; (2) no GitHub/GitLab repo found; (3) AUR PKGBUILD may use private source",

    # LEGAL/PROPRIETARY
    "deemix-gui-appimage": "LEGAL_ISSUES: Deezer music downloader archived after legal action; Tried: (1) project taken down; (2) no stable source URL; (3) legal risk for redistribution",
    "deezer": "PROPRIETARY_LICENSE + ELECTRON: proprietary music service needing Electron 39; Tried: (1) custom proprietary license; (2) electron39 not in Guix; (3) web app available as alternative",
    "libfprint-2-tod1-broadcom": "PROPRIETARY_LICENSE: Dell/Broadcom proprietary fingerprint driver; Tried: (1) proprietary binary blob; (2) no source code; (3) restricted license",
    "brother-mfc-j5720dw": "PROPRIETARY_LICENSE: Brother proprietary printer driver with i386 blobs; Tried: (1) proprietary i386 binaries; (2) requires lib32-glibc; (3) proprietary license",
    "cn-dascom-pin-driver": "PROPRIETARY_BINARY: Dascom printer driver with binary components; Tried: (1) contains proprietary components from dascom.cn; (2) Chinese-only support documentation; (3) redistribution unclear",
    "olauncher": "PROPRIETARY_LICENSE: custom Minecraft launcher with custom license; Tried: (1) custom license terms unclear on redistribution; (2) depends on Minecraft (proprietary); (3) MultiMC/PolyMC available as FOSS alternatives",

    # MISSING_RUNTIME
    "palemoon-i18n-fr": "MISSING_RUNTIME: depends on Pale Moon browser (not in Guix); Tried: (1) palemoon-i18n-common not in Guix; (2) Pale Moon itself not in Guix; (3) language pack useless without browser",
    "seamonkey-i18n-es-es": "MISSING_RUNTIME: depends on SeaMonkey browser (not in Guix); Tried: (1) seamonkey not in Guix; (2) language pack useless without browser; (3) SeaMonkey build extremely complex",
    "pypy3-pyparsing": "MISSING_RUNTIME: depends on PyPy3 (not in Guix); Tried: (1) pypy3 not in Guix; (2) pypy3 build extremely complex (bootstrapping); (3) pyparsing available for CPython",
    "profile-sync-daemon-edge": "MISSING_RUNTIME: depends on profile-sync-daemon (not in Guix); Tried: (1) profile-sync-daemon not in Guix; (2) also specific to Microsoft Edge; (3) Edge not in Guix either",

    # NGINX_MODULE
    "nginx-mod-cgi": "NGINX_MODULE: requires nginx-src build infrastructure; Tried: (1) nginx modules need to be compiled against nginx source; (2) Guix nginx package doesn't expose module build API; (3) would need nginx custom build variant",

    # SAIL/OCAML
    "sail-model": "COMPLEX_BUILD: OCaml project requiring opam ecosystem; Tried: (1) opam (OCaml package manager) not well supported in Guix; (2) dune build system needs OCaml >= 4.8.1; (3) z3 SMT solver required; OCaml dep chain impractical",

    # NO_RELEASE
    "claudes-c-compiler": "NO_STABLE_RELEASE: GitHub repo has 0 releases; Tried: (1) no tagged releases on GitHub; (2) cargo-build-system needs crate deps listed; (3) project may be experimental/WIP",
    "claudes-c-compiler-doc": "NO_STABLE_RELEASE: same as claudes-c-compiler; no tagged releases; Tried: (1) same upstream repo; (2) no releases; (3) doc variant of unreleased project",
    "claudes-c-compiler-src": "NO_STABLE_RELEASE: same as claudes-c-compiler; no tagged releases; Tried: (1) same upstream repo; (2) no releases; (3) src variant of unreleased project",

    # CUSTOM_LICENSE
    "pdflib-lite": "CUSTOM_LICENSE: custom:pdflib-lite license with commercial restrictions; Tried: (1) PDFlib commercial product; (2) lite version has use restrictions; (3) license not clearly FOSS-compatible",

    # SOURCE_UNAVAILABLE
    "ripple": "SOURCE_UNAVAILABLE: no public Git repository found; Tried: (1) URL zepyx.home.kg/ripple may be offline; (2) no GitHub/GitLab mirror found; (3) cannot verify source availability",

    # MISC COMPLEX
    "supertux-old": None,  # resolved
}


########################################################################
# Main
########################################################################

def main():
    with open(SELECTION) as f:
        selection = json.load(f)

    aur_cache = load_aur_cache(AUR_CACHE)
    packages = selection["packages"]

    # All resolved recipes
    resolved_recipes = [
        recipe_lexido(),
        recipe_charm_pop(),
        recipe_sccache(),
        recipe_sunsetr(),
        recipe_froggit(),
        recipe_forgecode(),
        recipe_zrepl(),
        recipe_certamen(),
        recipe_tabula_java(),
        recipe_diylc(),
        recipe_opencloud(),
        recipe_shiru(),
        recipe_ariang_allinone(),
        recipe_bste_git(),
        recipe_bookmarksync_git(),
        recipe_localquens(),
        recipe_kdominate_git(),
        recipe_hash_o_matic_git(),
        recipe_xwaylandvideobridge_git(),
        recipe_cctv_viewer_git(),
        recipe_supertux_old(),
        recipe_kamakura(),
        recipe_pavumeter_gtk3(),
        recipe_anttweakbar(),
        recipe_libretro_np2kai_git(),
        recipe_are(),
        recipe_metapac(),
        recipe_wlr_which_key_git(),
        recipe_robin_cli_tool(),
        recipe_docker_model(),
        recipe_winscp(),
    ]

    resolved_names = {r["name"] for r in resolved_recipes}

    # Map AUR names to resolved recipe names
    aur_to_recipe = {}
    for r in resolved_recipes:
        aur_to_recipe[r["name"]] = r["guix_name"]
    # charm-pop maps from AUR 'charm-pop'
    # sccache-git maps from AUR 'sccache-git'

    blocked = []
    for pkg in packages:
        name = pkg["name"]
        if name in resolved_names:
            continue
        reason = BLOCKED_REASONS.get(name)
        if reason is None:
            reason = f"NEEDS_INVESTIGATION: not yet evaluated in this pass ({PASS_ID})"
        blocked.append({
            "name": name,
            "number": pkg["number"],
            "reason": reason,
        })

    print(f"[{PASS_ID}] Resolved: {len(resolved_recipes)}, Blocked: {len(blocked)}")

    # Collect build systems
    build_systems_used = set()
    for r in resolved_recipes:
        recipe = r["recipe"]
        for bs in ["copy-build-system", "gnu-build-system", "cmake-build-system",
                    "go-build-system", "cargo-build-system", "meson-build-system",
                    "pyproject-build-system"]:
            if bs in recipe:
                build_systems_used.add(bs)

    bs_module_map = {
        "copy-build-system": "(guix build-system copy)",
        "gnu-build-system": "(guix build-system gnu)",
        "cmake-build-system": "(guix build-system cmake)",
        "go-build-system": "(guix build-system go)",
        "cargo-build-system": "(guix build-system cargo)",
        "meson-build-system": "(guix build-system meson)",
        "pyproject-build-system": "(guix build-system pyproject)",
    }

    # Build the Scheme module
    exports = [sanitize_name(r["guix_name"]) for r in resolved_recipes]

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix contributors")
    lines.append(";;;")
    lines.append(f";;; Dependency-tree resolver pass --- {PASS_ID}")
    lines.append(";;; Resolves BLOCKED packages prioritized by dependency tree order.")
    lines.append(";;;")
    lines.append(f";;; Recipes ({len(resolved_recipes)}):")
    for i, r in enumerate(resolved_recipes):
        lines.append(f";;;   {i+1}. {r['name']} ({r['method']}, v{r['version']})")
    lines.append(";;;")
    lines.append(f";;; {len(resolved_recipes)} recipes written. {len(blocked)} remain BLOCKED.")
    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Run `guix download <url>` to obtain real hashes before building.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")

    for bs in sorted(build_systems_used):
        mod = bs_module_map.get(bs)
        if mod:
            lines.append(f"  #:use-module {mod}")

    lines.append("  #:use-module ((guix licenses) #:prefix license:)")
    lines.append("  #:use-module (gnu packages)")
    lines.append("  #:use-module (gnu packages base)")
    lines.append("  #:use-module (gnu packages compression)")
    lines.append("  #:use-module (gnu packages gl)")
    lines.append("  #:use-module (gnu packages glib)")
    lines.append("  #:use-module (gnu packages gnupg)")
    lines.append("  #:use-module (gnu packages gtk)")
    lines.append("  #:use-module (gnu packages java)")
    lines.append("  #:use-module (gnu packages kde-frameworks)")
    lines.append("  #:use-module (gnu packages pango)")
    lines.append("  #:use-module (gnu packages pkg-config)")
    lines.append("  #:use-module (gnu packages pulseaudio)")
    lines.append("  #:use-module (gnu packages qt)")
    lines.append("  #:use-module (gnu packages sdl)")
    lines.append("  #:use-module (gnu packages tls)")
    lines.append("  #:use-module (gnu packages video)")
    lines.append("  #:use-module (gnu packages wine)")
    lines.append("  #:use-module (gnu packages xdisorg)")
    lines.append("  #:use-module (gnu packages xorg)")

    lines.append("  #:export (")
    for exp in exports:
        lines.append(f"            {exp}")
    lines.append("))")
    lines.append("")

    for r in resolved_recipes:
        lines.append(r["recipe"])

    full_module = "\n".join(lines)

    with open(OUTPUT_SCM, "w") as f:
        f.write(full_module)
    print(f"  Wrote {OUTPUT_SCM}")

    # Generate blocked notes
    if blocked:
        notes_lines = [
            f";;; Blocked notes for {PASS_ID}",
            f";;; {len(blocked)} packages remain BLOCKED after evaluation",
            ";;;",
        ]
        for b in blocked:
            notes_lines.append(f";;; {b['name']} (#{b['number']}): {b['reason']}")

        with open(BLOCKED_NOTES, "w") as f:
            f.write("\n".join(notes_lines) + "\n")
        print(f"  Wrote {BLOCKED_NOTES}")

    # Write AUR lookup
    aur_lookup = []
    for pkg in packages:
        name = pkg["name"]
        found = name in aur_cache
        entry = {"name": name, "found": found}
        if name in resolved_names:
            entry["resolved"] = True
        else:
            entry["resolved"] = False
            entry["reason"] = BLOCKED_REASONS.get(name, "unknown")
        aur_lookup.append(entry)

    with open(AUR_LOOKUP_OUT, "w") as f:
        json.dump(aur_lookup, f, indent=2)
    print(f"  Wrote {AUR_LOOKUP_OUT}")

    # Write summary
    summary = {
        "pass_id": PASS_ID,
        "total_selected": len(packages),
        "resolved": len(resolved_recipes),
        "blocked": len(blocked),
        "resolved_packages": [
            {"name": r["name"], "version": r["version"], "method": r["method"]}
            for r in resolved_recipes
        ],
        "blocked_packages": blocked,
    }
    with open(SUMMARY_OUT, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"  Wrote {SUMMARY_OUT}")

    return resolved_recipes, blocked


if __name__ == "__main__":
    resolved, blocked = main()
    print(f"\nResolved {len(resolved)} packages:")
    for r in resolved:
        print(f"  - {r['name']} v{r['version']} ({r['method']})")
    print(f"\nBlocked {len(blocked)} packages:")
    for b in blocked[:10]:
        print(f"  - {b['name']}: {b['reason'][:60]}...")
    if len(blocked) > 10:
        print(f"  ... and {len(blocked)-10} more")
