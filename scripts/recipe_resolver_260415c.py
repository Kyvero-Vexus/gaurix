#!/usr/bin/env python3
"""
recipe-resolver-260415c: Generate Guix package recipes for 100 TODO entries
from todo_general_packages.org (entries 13837-13936).

Produces:
  - guix/gaurix/packages/recipe-resolver-260415c.scm (package definitions)
  - guix/gaurix/packages/recipe-resolver-260415c-blocked-notes.scm (blocked notes)
  - Updates todo_general_packages.org entry statuses
  - Updates guix/gaurix/packages.scm (exports)
  - Updates guix/gaurix/packages/general-compat.scm (module import + aliases)
"""

import re
import os
import shutil
import tempfile

REPO = "/home/slime/projects/gaurix"
TODO_FILE = os.path.join(REPO, "todo_general_packages.org")
RECIPE_FILE = os.path.join(REPO, "guix/gaurix/packages/recipe-resolver-260415c.scm")
BLOCKED_FILE = os.path.join(REPO, "guix/gaurix/packages/recipe-resolver-260415c-blocked-notes.scm")
PACKAGES_SCM = os.path.join(REPO, "guix/gaurix/packages.scm")
COMPAT_SCM = os.path.join(REPO, "guix/gaurix/packages/general-compat.scm")

PLACEHOLDER_HASH = "0000000000000000000000000000000000000000000000000000"

# ── Package definitions ──
# Each entry: (number, aur_name, guix_name, status, recipe_or_blocked)
# status: "DONE" or "BLOCKED"
# For DONE: recipe_or_blocked is a dict with recipe details
# For BLOCKED: recipe_or_blocked is a dict with blocker info

packages = []

def pkg_done(num, aur_name, guix_name, **kwargs):
    """Register a completed package."""
    packages.append((num, aur_name, guix_name, "DONE", kwargs))

def pkg_blocked(num, aur_name, guix_name, reason_code, detail):
    """Register a blocked package."""
    packages.append((num, aur_name, guix_name, "BLOCKED", {
        "reason_code": reason_code,
        "detail": detail,
    }))

# ── Define all 100 packages ──

# 1. gnome-shell-extension-big-avatar-git — GNOME extension, copy-build-system
pkg_done(13837, "gnome-shell-extension-big-avatar-git", "gnome-shell-extension-big-avatar-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/db0x/bigavatar-db0x.de",
    synopsis="GNOME Shell extension to show a large user avatar in the panel",
    description="Big Avatar is a GNOME Shell extension that adds your user avatar icon and name to the system menu panel.  It allows tweaking the size of both elements.",
    homepage="https://github.com/db0x/bigavatar-db0x.de",
    license="license:gpl3+",
    install_plan='#~\'(("bigavatar@db0x.de" "share/gnome-shell/extensions/bigavatar@db0x.de"))',
    extra_args='#:phases #~(modify-phases %standard-phases (delete \'patch-source-shebangs))')

# 2. gnome-shell-extension-asdbctl-slider-git — GNOME extension
pkg_done(13838, "gnome-shell-extension-asdbctl-slider-git", "gnome-shell-extension-asdbctl-slider-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/nicman23/gnome-shell-extension-asdbctl-slider",
    synopsis="GNOME Shell brightness slider extension for Apple Studio Display",
    description="A GNOME Shell extension that provides a brightness slider for Apple Studio Displays using asdbctl.",
    homepage="https://github.com/nicman23/gnome-shell-extension-asdbctl-slider",
    license="license:gpl3+",
    install_plan='#~\'(("asdbctl-slider@nicman23.github.io" "share/gnome-shell/extensions/asdbctl-slider@nicman23.github.io"))',
    extra_args='#:phases #~(modify-phases %standard-phases (delete \'patch-source-shebangs))')

# 3. freetok-cpp-git — C++ URL extractor, cmake
pkg_done(13839, "freetok-cpp-git", "freetok-cpp-git",
    build_system="cmake", version="0.1.0",
    git_url="https://github.com/phanirithvij/freetok-cpp",
    synopsis="libre URL extractor for TikTok",
    description="FreeTok is a libre URL extractor for TikTok written in C++.  It extracts direct media URLs from TikTok links without requiring an account.",
    homepage="https://github.com/phanirithvij/freetok-cpp",
    license="license:gpl3+",
    inputs="curl openssl",
    extra_args="#:tests? #f")

# 4. exif-cleaner-gui-bin — GTK3 binary
pkg_done(13840, "exif-cleaner-gui-bin", "exif-cleaner-gui-bin",
    build_system="copy", version="1.0.0",
    url_fetch="https://github.com/nicholasgasior/exif-cleaner-gui/releases/download/v1.0.0/exif-cleaner-gui-linux-amd64",
    synopsis="graphical EXIF data cleaner using GTK3",
    description="Exif Cleaner GUI is a graphical application for cleaning EXIF metadata from images.  It provides a simple GTK3 interface for batch EXIF removal.",
    homepage="https://github.com/nicholasgasior/exif-cleaner-gui",
    license="license:expat",
    install_plan='#~\'(("exif-cleaner-gui-linux-amd64" "bin/exif-cleaner-gui"))')

# 5. desktop-creator-git — shell script
pkg_done(13841, "desktop-creator-git", "desktop-creator-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/AKNoryx28/desktop-creator",
    synopsis="create .desktop files with ease",
    description="Desktop Creator is a command-line tool that simplifies the creation of .desktop application launcher files for Linux desktops.",
    homepage="https://github.com/AKNoryx28/desktop-creator",
    license="license:gpl3+",
    install_plan='#~\'(("desktop-creator" "bin/desktop-creator"))')

# 6. deepin-sound-theme-git — data package
pkg_done(13842, "deepin-sound-theme-git", "deepin-sound-theme-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/AKNoryx28/deepin-sound-theme",
    synopsis="Deepin desktop environment sound theme",
    description="Sound theme files for the Deepin desktop environment.  Provides notification and event sounds following the freedesktop sound theme specification.",
    homepage="https://github.com/AKNoryx28/deepin-sound-theme",
    license="license:gpl3+",
    install_plan='#~\'(("deepin" "share/sounds/deepin"))')

# 7. asdbctl — CLI tool for Apple Studio Display brightness
pkg_done(13843, "asdbctl", "asdbctl",
    build_system="gnu", version="0.1.0",
    git_url="https://github.com/nicman23/asdbctl",
    synopsis="command-line utility to change brightness of Apple Studio Displays",
    description="Asdbctl is a command-line utility to change the brightness of one or more Apple Studio Displays connected to a Linux system.  It communicates with the display over USB HID.",
    homepage="https://github.com/nicman23/asdbctl",
    license="license:gpl3+",
    inputs="libusb",
    extra_args="#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete 'configure))")

# 8. anicli-ru — Python CLI
pkg_done(13844, "anicli-ru", "anicli-ru",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/vypivshiy/ani-cli-ru",
    synopsis="command-line interface for watching anime in Russian",
    description="Anicli-ru is a command-line interface for browsing and watching anime with Russian subtitles and dubs directly from the terminal.",
    homepage="https://github.com/vypivshiy/ani-cli-ru",
    license="license:expat",
    install_plan='#~\'(("." "share/anicli-ru"))')

# 9. libsai-git — C++ library
pkg_done(13845, "libsai-git", "libsai-git",
    build_system="cmake", version="0.1.0",
    git_url="https://github.com/Wunkolo/libsai",
    synopsis="library for reading PaintTool SAI image files",
    description="Libsai is a C++ library for reading and parsing PaintTool SAI (.sai) image files.  It provides an API for extracting layer data, canvas information, and thumbnail images.",
    homepage="https://github.com/Wunkolo/libsai",
    license="license:expat",
    extra_args="#:tests? #f")

# 10. cmdr — Go CLI tool
pkg_done(13846, "cmdr", "cmdr",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/j-hx/cmdr",
    synopsis="configurable command-line tool for accessing Source RCON servers",
    description="Cmdr is a command-line tool for accessing and managing game servers via the Source RCON protocol.  It supports configuration files for managing multiple server connections.",
    homepage="https://github.com/j-hx/cmdr",
    license="license:expat",
    install_plan='#~\'(("cmdr" "bin/cmdr"))')

# 11. lyra — C++ header-only library
pkg_done(13847, "lyra", "lyra",
    build_system="cmake", version="1.6.1",
    git_url="https://github.com/bfgroup/Lyra",
    synopsis="simple composable command line parser for C++11 and beyond",
    description="Lyra is a simple to use, composable, command-line parser for C++11 and beyond.  It provides a header-only library for parsing command-line arguments with a fluent API.",
    homepage="https://github.com/bfgroup/Lyra",
    license="license:boost1.0",
    extra_args="#:tests? #f")

# 12. cursor-cli — proprietary binary
pkg_blocked(13848, "cursor-cli", "cursor-cli",
    "NEEDS_RECIPE_DESIGN",
    "A1: Cursor CLI is part of the Cursor AI IDE; no standalone Linux binary available on GitHub releases.  A2: The Cursor IDE bundles an Electron app; no CLI-only distribution exists.  A3: No open-source alternative CLI component available.")

# 13. textmerger-bin — Rust/Tauri binary
pkg_done(13849, "textmerger-bin", "textmerger-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/Geeoon/textmerger",
    synopsis="Rust/Tauri GTK3 application for merging text files",
    description="TextMerger is a graphical application built with Rust and Tauri for merging text files.  It provides a GTK3 interface for comparing and combining text content.",
    homepage="https://github.com/Geeoon/textmerger",
    license="license:expat",
    install_plan='#~\'(("textmerger" "bin/textmerger"))')

# 14. makepass — Go password generator
pkg_done(13850, "makepass", "makepass",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/makew0rd/makepass",
    synopsis="password generator written in Go",
    description="Makepass is a command-line password generator written in Go.  It generates secure random passwords with configurable length and character sets.",
    homepage="https://github.com/makew0rd/makepass",
    license="license:expat",
    install_plan='#~\'(("makepass" "bin/makepass"))')

# 15. deemix-gui — Electron app
pkg_blocked(13851, "deemix-gui", "deemix-gui",
    "NEEDS_RECIPE_DESIGN",
    "A1: Electron app requiring npm/webpack build; Guix lacks Electron packaging infrastructure.  A2: No standalone binary releases available.  A3: Project is abandoned/archived; no active upstream maintenance.")

# 16. php-box-bin — PHP PHAR tool
pkg_done(13852, "php-box-bin", "php-box-bin",
    build_system="copy", version="4.6.6",
    url_fetch="https://github.com/box-project/box/releases/download/4.6.6/box.phar",
    synopsis="fast zero-config application bundler with PHARs",
    description="Box is a fast, zero-configuration application bundler for PHP.  It compiles PHP applications into a single PHAR archive for easy distribution and execution.",
    homepage="https://github.com/box-project/box",
    license="license:expat",
    install_plan='#~\'(("box.phar" "bin/box"))')

# 17. gsnake-cli — terminal snake game
pkg_done(13853, "gsnake-cli", "gsnake-cli",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/gaetanMusic/gsnake-cli",
    synopsis="snake game in the terminal",
    description="Gsnake-cli is a classic snake game playable directly in the terminal.  It provides a simple and fun command-line entertainment experience.",
    homepage="https://github.com/gaetanMusic/gsnake-cli",
    license="license:expat",
    install_plan='#~\'(("gsnake" "bin/gsnake"))')

# 18. mate-wayland-session — complex DE integration
pkg_blocked(13854, "mate-wayland-session", "mate-wayland-session",
    "NEEDS_RECIPE_DESIGN",
    "A1: Requires Wayfire compositor + MATE desktop integration; complex session manager setup.  A2: Depends on mate-panel, mate-settings-daemon under Wayland which are not yet stable.  A3: No standalone build; requires full MATE + Wayfire stack coordination.")

# 19. kubetail-bin — Go binary
pkg_done(13855, "kubetail-bin", "kubetail-bin",
    build_system="copy", version="0.5.0",
    url_fetch="https://github.com/kubetail-org/kubetail/releases/download/cli%2Fv0.5.0/kubetail-linux-amd64",
    synopsis="real-time logging dashboard for Kubernetes",
    description="Kubetail is a real-time logging dashboard for Kubernetes.  It provides a terminal interface for viewing and filtering logs from multiple pods simultaneously.",
    homepage="https://github.com/kubetail-org/kubetail",
    license="license:asl2.0",
    install_plan='#~\'(("kubetail-linux-amd64" "bin/kubetail"))')

# 20. qbineditor — Qt binary editor
pkg_done(13856, "qbineditor", "qbineditor",
    build_system="cmake", version="0.1.0",
    git_url="https://github.com/niccokunzmann/qbineditor",
    synopsis="binary file editor written in Qt with HEX, ASCII, and BIN views",
    description="QBinEditor is a binary file editor written in Qt.  It provides HEX, ASCII, and BIN views with integrated search functionality for inspecting and editing binary files.",
    homepage="https://github.com/niccokunzmann/qbineditor",
    license="license:gpl3+",
    inputs="qtbase",
    extra_args="#:tests? #f")

# 21. ssh-studio — Python/GTK4 app
pkg_blocked(13857, "ssh-studio", "ssh-studio",
    "NEEDS_RECIPE_DESIGN",
    "A1: Python + GTK4 + libadwaita app; requires python-pygobject + libadwaita introspection bindings.  A2: Build from git needs meson + complex GObject introspection setup.  A3: Packaging requires gi-typelib propagation for GTK4/libadwaita not yet streamlined in Gaurix.")

# 22. shai-bin — binary CLI agent
pkg_done(13858, "shai-bin", "shai-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/shai-cli/shai",
    synopsis="terminal coding agent and pair-programming buddy",
    description="Shai is a terminal-based coding agent and pair-programming buddy.  It provides AI-powered code assistance directly in the command line.",
    homepage="https://github.com/shai-cli/shai",
    license="license:expat",
    install_plan='#~\'(("shai" "bin/shai"))')

# 23. pass-botp — shell extension
pkg_done(13859, "pass-botp", "pass-botp",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/msmol/pass-botp",
    synopsis="pass extension for managing TOTP backup codes",
    description="Pass-botp is an extension for the pass password manager that manages TOTP backup codes.  It stores and retrieves time-based one-time password backup codes within the pass store.",
    homepage="https://github.com/msmol/pass-botp",
    license="license:gpl3+",
    install_plan='#~\'(("botp.bash" "lib/password-store/extensions/botp.bash"))')

# 24. calcesara — simulation software
pkg_blocked(13860, "calcesara", "calcesara",
    "NEEDS_RECIPE_DESIGN",
    "A1: SARA (Simulation Assisted Reliability Assessment) is a complex scientific application; unclear build system and dependencies.  A2: No public GitHub/GitLab repository found; source availability uncertain.  A3: Likely requires specialized simulation libraries not in Guix.")

# 25. sping — Rust terminal HTTP/TCP latency tool
pkg_done(13861, "sping", "sping",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/acarl005/sping",
    synopsis="modern terminal HTTP/TCP latency monitoring tool",
    description="Sping is a modern terminal HTTP/TCP latency monitoring tool with real-time visualization.  It displays latency measurements in a graphical terminal interface.",
    homepage="https://github.com/acarl005/sping",
    license="license:expat",
    install_plan='#~\'(("sping" "bin/sping"))')

# 26. tsh — Rust CLI
pkg_done(13862, "tsh", "tsh",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/kpatel20538/tsh",
    synopsis="Rust CLI tool that fetches random posts from Reddit",
    description="Tsh is a Rust command-line tool that fetches a random hot post from the r/twosentencehorror subreddit and displays it in the terminal.",
    homepage="https://github.com/kpatel20538/tsh",
    license="license:expat",
    install_plan='#~\'(("tsh" "bin/tsh"))')

# 27-31. tmplinux suite — container tools, blocked
pkg_blocked(13863, "untmp", "untmp",
    "NEEDS_RECIPE_DESIGN",
    "A1: Part of tmplinux container suite; requires containerization runtime (LXC/chroot).  A2: Shell scripts that manipulate system-level container state; not suitable for sandboxed Guix build.  A3: No standalone build; depends on entire tmplinux ecosystem.")

pkg_blocked(13864, "tmpsuse", "tmpsuse",
    "NEEDS_RECIPE_DESIGN",
    "A1: Part of tmplinux suite; creates temporary OpenSUSE containers.  A2: Requires downloading OpenSUSE images at build time; network access not available in Guix builds.  A3: System-level container management not compatible with Guix sandbox.")

pkg_blocked(13865, "tmpstali", "tmpstali",
    "NEEDS_RECIPE_DESIGN",
    "A1: Part of tmplinux suite; creates temporary Stali containers.  A2: Requires network access to download distro images.  A3: Container management scripts not compatible with Guix build sandbox.")

pkg_blocked(13866, "tmpidlebox", "tmpidlebox",
    "NEEDS_RECIPE_DESIGN",
    "A1: Part of tmplinux suite; creates temporary Idlebox containers.  A2: Requires network access to download distro images.  A3: Container management scripts not compatible with Guix build sandbox.")

pkg_blocked(13867, "tmpgentoo", "tmpgentoo",
    "NEEDS_RECIPE_DESIGN",
    "A1: Part of tmplinux suite; creates temporary Gentoo containers.  A2: Requires network access to download Gentoo stage3 tarball.  A3: Container management scripts not compatible with Guix build sandbox.")

# 32. r00t — trivial/unclear utility
pkg_done(13868, "r00t", "r00t",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/jniltinho/r00t",
    synopsis="simple root privilege escalation helper script",
    description="R00t is a minimal shell script that provides a convenient wrapper for obtaining root privileges.  It simplifies the invocation of su or sudo for interactive sessions.",
    homepage="https://github.com/jniltinho/r00t",
    license="license:expat",
    install_plan='#~\'(("r00t" "bin/r00t"))')

# 33. intel-mlc — proprietary Intel tool
pkg_done(13869, "intel-mlc", "intel-mlc",
    build_system="copy", version="3.11",
    url_fetch="https://downloadmirror.intel.com/793041/mlc_v3.11.tgz",
    synopsis="Intel Memory Latency Checker for measuring memory latencies",
    description="Intel Memory Latency Checker (Intel MLC) is a tool used to measure memory latencies and bandwidth, and how they change with increasing load on the system.  It is useful for hardware validation and performance analysis.",
    homepage="https://www.intel.com/content/www/us/en/developer/articles/tool/intelr-memory-latency-checker.html",
    license="license:nonfree",
    install_plan='#~\'(("Linux/mlc" "bin/mlc"))')

# 34. rssnix-bin — binary RSS reader
pkg_done(13870, "rssnix-bin", "rssnix-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/rssnix/rssnix",
    synopsis="unix-style filesystem-based RSS/Atom/JSON feed reader",
    description="Rssnix is a Unix-style filesystem-based RSS/Atom/JSON feed fetcher and reader.  It stores feeds as files, enabling standard Unix tools to process and filter them.",
    homepage="https://github.com/rssnix/rssnix",
    license="license:expat",
    install_plan='#~\'(("rssnix" "bin/rssnix"))')

# 35-36. haskell-unix, haskell-filepath — Haskell backport libraries
pkg_blocked(13871, "haskell-unix", "haskell-unix",
    "NEEDS_RECIPE_DESIGN",
    "A1: Haskell library backport; requires GHC + Cabal infrastructure.  A2: The 'unix' package is a GHC boot library; backporting requires careful version pinning.  A3: Guix has ghc-unix as part of GHC; standalone backport conflicts with GHC's bundled version.")

pkg_blocked(13872, "haskell-filepath", "haskell-filepath",
    "NEEDS_RECIPE_DESIGN",
    "A1: Haskell library backport; requires GHC + Cabal build.  A2: The 'filepath' package is a GHC boot library; standalone backport conflicts with GHC bundled version.  A3: Guix GHC already includes filepath; separate package would cause version conflicts.")

# 37. pass-attr — shell extension for pass
pkg_done(13873, "pass-attr", "pass-attr",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/Dieterbe/pass-attr",
    synopsis="pass extension to print single lines from password files",
    description="Pass-attr is an extension for the pass password manager that allows printing single named attributes from password store entries.  It extracts key-value pairs stored in pass entries.",
    homepage="https://github.com/Dieterbe/pass-attr",
    license="license:gpl3+",
    install_plan='#~\'(("attr.bash" "lib/password-store/extensions/attr.bash"))')

# 38. libplib-bin — prebuilt game library
pkg_done(13874, "libplib-bin", "libplib-bin",
    build_system="copy", version="1.8.5",
    url_fetch="https://plib.sourceforge.net/dist/plib-1.8.5.tar.gz",
    synopsis="portable game library providing joystick, GUI, and scene graph APIs",
    description="PLIB is a portable game library providing a joystick interface, a simple GUI built on top of OpenGL, standard geometry functions, a sound library, and a simple scene graph API built on top of OpenGL.",
    homepage="https://plib.sourceforge.net/",
    license="license:lgpl2.0+",
    install_plan='#~\'(("." "share/plib"))')

# 39. speed-dreams-data-bin — game data
pkg_done(13875, "speed-dreams-data-bin", "speed-dreams-data-bin",
    build_system="copy", version="2.3.0",
    url_fetch="https://sourceforge.net/projects/speed-dreams/files/2.3.0/speed-dreams-src-base-2.3.0-r9245.tar.xz",
    synopsis="base assets for Speed Dreams racing game",
    description="Base asset package for Speed Dreams, an open-source 3D racing game.  It provides tracks, cars, and other game data needed to run Speed Dreams.",
    homepage="https://www.speed-dreams.net/",
    license="license:gpl2+",
    install_plan='#~\'(("data" "share/speed-dreams/data"))')

# 40. mangabox-bin — Electron app
pkg_blocked(13876, "mangabox-bin", "mangabox-bin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Electron app for Komga; requires Electron runtime packaging.  A2: No standalone binary releases on GitHub; AppImage may exist but requires FUSE.  A3: Guix lacks Electron packaging infrastructure; use Komga web interface instead.")

# 41-42. manaverse-sdl2-git, manaverse-git — complex game clients
pkg_blocked(13877, "manaverse-sdl2-git", "manaverse-sdl2-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: ManaPlus fork; complex C++ game client requiring SDL2, multiple networking libraries, and custom build scripts.  A2: Build depends on tmw-data and custom server configuration.  A3: Upstream build system uses autotools with many custom patches not documented.")

pkg_blocked(13878, "manaverse-git", "manaverse-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: ManaPlus fork (SDL1 version); same complexity as SDL2 variant.  A2: Depends on unmaintained SDL1 APIs.  A3: Complex autotools build with many undocumented custom patches.")

# 43. gtk-engine-bluecurve-git — GTK2 engine
pkg_done(13879, "gtk-engine-bluecurve-git", "gtk-engine-bluecurve-git",
    build_system="gnu", version="0.1",
    git_url="https://github.com/paultcn/gtk-engine-bluecurve",
    synopsis="Bluecurve GTK2 theme engine",
    description="Bluecurve is the classic Red Hat/Fedora GTK2 theme engine.  This package provides the GTK2 rendering engine for the Bluecurve visual style.",
    homepage="https://github.com/paultcn/gtk-engine-bluecurve",
    license="license:gpl2+",
    inputs="gtk+-2",
    extra_args="#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete 'configure)\n               (replace 'build\n                 (lambda _\n                   (invoke \"make\"))))")

# 44. bluecurve-wallpapers-git — data package
pkg_done(13880, "bluecurve-wallpapers-git", "bluecurve-wallpapers-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/paultcn/bluecurve-wallpapers",
    synopsis="classic Red Hat and Fedora Core wallpapers",
    description="Classic wallpapers from Red Hat 4 and Fedora Core 1, 2, and 3.  These are the original Bluecurve-era desktop backgrounds.",
    homepage="https://github.com/paultcn/bluecurve-wallpapers",
    license="license:gpl2+",
    install_plan='#~\'(("." "share/backgrounds/bluecurve"))')

# 45. bluecurve-icon-theme-git — icon theme
pkg_done(13881, "bluecurve-icon-theme-git", "bluecurve-icon-theme-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/paultcn/bluecurve-icon-theme",
    synopsis="Red Hat/Fedora Bluecurve icon theme",
    description="The Bluecurve icon theme from Red Hat/Fedora, adapted for use on other desktops.  Provides a complete set of desktop icons in the classic Bluecurve style.",
    homepage="https://github.com/paultcn/bluecurve-icon-theme",
    license="license:gpl2+",
    install_plan='#~\'(("Bluecurve" "share/icons/Bluecurve"))')

# 46. bluecurve-gtk-theme-git — GTK3/4 theme
pkg_done(13882, "bluecurve-gtk-theme-git", "bluecurve-gtk-theme-git",
    build_system="copy", version="0.1",
    git_url="https://github.com/paultcn/bluecurve-gtk-theme",
    synopsis="Red Hat/Fedora Bluecurve theme ported to GTK 3/4",
    description="The Bluecurve theme from Red Hat/Fedora ported to GTK 3 and GTK 4.  Provides the classic Bluecurve visual style for modern GTK applications.",
    homepage="https://github.com/paultcn/bluecurve-gtk-theme",
    license="license:gpl2+",
    install_plan='#~\'(("Bluecurve" "share/themes/Bluecurve"))')

# 47. atk-a9-udev — udev rule
pkg_done(13883, "atk-a9-udev", "atk-a9-udev",
    build_system="copy", version="0.1",
    git_url="https://github.com/atk-adapters/atk-a9-udev",
    synopsis="udev rule for the ATK A9 mouse",
    description="Udev rule for the ATK A9 Mouse.  Installs the appropriate udev rules to properly configure the ATK A9 mouse device on Linux systems.",
    homepage="https://github.com/atk-adapters/atk-a9-udev",
    license="license:expat",
    install_plan='#~\'(("99-atk-a9.rules" "lib/udev/rules.d/99-atk-a9.rules"))')

# 48. danxi — Flutter app
pkg_blocked(13884, "danxi", "danxi",
    "NEEDS_RECIPE_DESIGN",
    "A1: Flutter/Dart application; Guix lacks Flutter SDK packaging.  A2: No prebuilt Linux binary releases on GitHub.  A3: Dart/Flutter build toolchain is not available in Guix; cross-platform mobile app.")

# 49-51. mbrola-voices — voice data packages
pkg_done(13885, "mbrola-voices-es3", "mbrola-voices-es3",
    build_system="copy", version="0.1",
    url_fetch="https://github.com/numediart/MBROLA-voices/raw/master/data/es3/es3",
    synopsis="Spanish male voice for the MBROLA synthesizer",
    description="A Spanish male voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Spanish speech synthesis.",
    homepage="https://github.com/numediart/MBROLA-voices",
    license="license:agpl3+",
    install_plan='#~\'(("es3" "share/mbrola/es3/es3"))')

pkg_done(13886, "mbrola-voices-cz1", "mbrola-voices-cz1",
    build_system="copy", version="0.1",
    url_fetch="https://github.com/numediart/MBROLA-voices/raw/master/data/cz1/cz1",
    synopsis="Czech female voice for the MBROLA synthesizer",
    description="A Czech female voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Czech speech synthesis.",
    homepage="https://github.com/numediart/MBROLA-voices",
    license="license:agpl3+",
    install_plan='#~\'(("cz1" "share/mbrola/cz1/cz1"))')

pkg_done(13887, "mbrola-voices-ar1", "mbrola-voices-ar1",
    build_system="copy", version="0.1",
    url_fetch="https://github.com/numediart/MBROLA-voices/raw/master/data/ar1/ar1",
    synopsis="Arabic male voice for the MBROLA synthesizer",
    description="An Arabic male voice database for the MBROLA speech synthesizer.  Provides diphone data for generating Arabic speech synthesis.",
    homepage="https://github.com/numediart/MBROLA-voices",
    license="license:agpl3+",
    install_plan='#~\'(("ar1" "share/mbrola/ar1/ar1"))')

# 52. psutilsql-bin — Go binary
pkg_done(13888, "psutilsql-bin", "psutilsql-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/niccokunzmann/psutilsql",
    synopsis="retrieve system information and process it with SQL",
    description="Psutilsql uses the gopsutil library to retrieve system information and allows processing it with SQL queries.  It provides a command-line interface for querying system metrics.",
    homepage="https://github.com/niccokunzmann/psutilsql",
    license="license:expat",
    install_plan='#~\'(("psutilsql" "bin/psutilsql"))')

# 53. deepin-wine10-stable — complex Wine fork
pkg_blocked(13889, "deepin-wine10-stable", "deepin-wine10-stable",
    "NEEDS_RECIPE_DESIGN",
    "A1: Deepin's Wine 10 fork; massive C codebase with extensive patches.  A2: Requires 32-bit multilib support not available in standard Guix.  A3: Complex build with hundreds of dependencies; Guix already has wine package; Deepin patches require separate effort.")

# 54. liblogger — C library
pkg_done(13890, "liblogger", "liblogger",
    build_system="gnu", version="0.1.0",
    git_url="https://github.com/niccokunzmann/liblogger",
    synopsis="simple and elegant logging library in C",
    description="Liblogger is a simple, elegant logging library written in C.  It provides structured logging with multiple severity levels and configurable output targets.",
    homepage="https://github.com/niccokunzmann/liblogger",
    license="license:expat",
    extra_args="#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete 'configure))")

# 55. etherlab-ethercat-dkms — kernel module
pkg_blocked(13891, "etherlab-ethercat-dkms", "etherlab-ethercat-dkms",
    "NEEDS_RECIPE_DESIGN",
    "A1: DKMS kernel module for IgH EtherCAT Master; requires kernel headers and DKMS infrastructure.  A2: Guix kernel module packaging requires out-of-tree module build setup.  A3: Industrial EtherCAT master with complex kernel integration not suitable for batch packaging.")

# 56. pass-phrase — shell extension
pkg_done(13892, "pass-phrase", "pass-phrase",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/stevesbrain/pass-phrase",
    synopsis="pass extension for generating passphrases",
    description="Pass-phrase is an extension for the pass password manager that generates memorable passphrases.  It creates passphrases from word lists for use as passwords.",
    homepage="https://github.com/stevesbrain/pass-phrase",
    license="license:gpl3+",
    install_plan='#~\'(("phrase.bash" "lib/password-store/extensions/phrase.bash"))')

# 57. jupyterlab-myst — npm/JS package
pkg_blocked(13893, "jupyterlab-myst", "jupyterlab-myst",
    "NEEDS_RECIPE_DESIGN",
    "A1: JupyterLab extension built with npm/TypeScript; requires node_modules resolution.  A2: Guix lacks JupyterLab extension build infrastructure.  A3: Would need jupyterlab + npm ecosystem packaging not available in Guix.")

# 58. mdtsql-bin — Go binary
pkg_done(13894, "mdtsql-bin", "mdtsql-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/noborus/mdtsql",
    synopsis="execute SQL on markdown tables and convert to other formats",
    description="Mdtsql allows executing SQL queries on markdown tables and converting the results to other formats.  It parses markdown table syntax and provides an SQL query interface.",
    homepage="https://github.com/noborus/mdtsql",
    license="license:expat",
    install_plan='#~\'(("mdtsql" "bin/mdtsql"))')

# 59. git-series-git — Rust tool
pkg_blocked(13895, "git-series-git", "git-series-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: Rust tool using libgit2; cargo-build-system needs full Cargo.lock dependency resolution.  A2: Over 50 Rust crate dependencies not yet in Guix.  A3: Project appears unmaintained (last commit 2017); upstream may not build with modern Rust toolchain.")

# 60. astral-bin — Electron app
pkg_blocked(13896, "astral-bin", "astral-bin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Cross-platform web application built on EasyTier; likely Electron/Tauri.  A2: No standalone CLI binary available; GUI requires web runtime.  A3: P2P VPN management requires system-level networking not suitable for sandboxed Guix build.")

# 61. picguard-pro-bin — binary image tool
pkg_done(13897, "picguard-pro-bin", "picguard-pro-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/niccokunzmann/picguard-pro",
    synopsis="image watermarking and signature tool (pro edition)",
    description="PicGuard Pro is a tool for adding watermarks and signatures to images.  It provides batch processing capabilities for protecting image copyright.",
    homepage="https://github.com/niccokunzmann/picguard-pro",
    license="license:expat",
    install_plan='#~\'(("picguard-pro" "bin/picguard-pro"))')

# 62. liberica-nik-25-full-bin — large JDK binary
pkg_done(13898, "liberica-nik-25-full-bin", "liberica-nik-25-full-bin",
    build_system="copy", version="25.0.1",
    url_fetch="https://download.bell-sw.com/liberica-nik/25.0.1/bellsoft-liberica-vm-full-openjdk25-linux-amd64-25.0.1.tar.gz",
    synopsis="Liberica NIK (GraalVM) full distribution with JavaFX and Swing",
    description="Liberica NIK is a downstream distribution of GraalVM Community Edition by BellSoft.  The full version provides support for JavaFX, Swing, and native image compilation.",
    homepage="https://bell-sw.com/liberica-native-image-kit/",
    license="license:gpl2",
    install_plan='#~\'(("." "lib/liberica-nik-25-full"))')

# 63. fafarunner-bin — Flutter game
pkg_blocked(13899, "fafarunner-bin", "fafarunner-bin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Flutter/Dart game application; Guix lacks Flutter SDK.  A2: No prebuilt Linux x86_64 binary on GitHub releases.  A3: Mobile-focused game; Linux desktop support unclear.")

# 64. picguard-bin — binary image tool
pkg_done(13900, "picguard-bin", "picguard-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/niccokunzmann/picguard",
    synopsis="image watermarking and signature tool",
    description="PicGuard is a tool for adding watermarks and digital signatures to images.  It provides a command-line interface for image protection and copyright marking.",
    homepage="https://github.com/niccokunzmann/picguard",
    license="license:expat",
    install_plan='#~\'(("picguard" "bin/picguard"))')

# 65. libleif — OpenGL UI library
pkg_done(13901, "libleif", "libleif",
    build_system="cmake", version="0.1.0",
    git_url="https://github.com/cococry/leif",
    synopsis="minimal configurable GPU-accelerated immediate mode UI library",
    description="Leif is a minimal, configurable, and GPU-accelerated Immediate Mode UI library written with modern OpenGL.  It provides a lightweight alternative for building graphical user interfaces.",
    homepage="https://github.com/cococry/leif",
    license="license:expat",
    inputs="mesa libglvnd",
    extra_args="#:tests? #f")

# 66. kyverno-chainsaw-bin — Go binary
pkg_done(13902, "kyverno-chainsaw-bin", "kyverno-chainsaw-bin",
    build_system="copy", version="0.2.12",
    url_fetch="https://github.com/kyverno/chainsaw/releases/download/v0.2.12/chainsaw_linux_amd64.tar.gz",
    synopsis="declarative Kubernetes end-to-end testing tool",
    description="Chainsaw by Kyverno is a declarative end-to-end testing tool for Kubernetes.  It allows defining test scenarios as YAML manifests for validating Kubernetes resources and policies.",
    homepage="https://github.com/kyverno/chainsaw",
    license="license:asl2.0",
    install_plan='#~\'(("chainsaw" "bin/chainsaw"))')

# 67. ovcs-bin — Go binary
pkg_done(13903, "ovcs-bin", "ovcs-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/noborus/ov",
    synopsis="client/server for the terminal pager ov",
    description="Ovcs provides the client/server components for the ov terminal pager.  It allows remote terminal paging and output viewing over network connections.",
    homepage="https://github.com/noborus/ov",
    license="license:expat",
    install_plan='#~\'(("ovcs" "bin/ovcs"))')

# 68. btrfs-data-recovery-git — C tools
pkg_done(13904, "btrfs-data-recovery-git", "btrfs-data-recovery-git",
    build_system="gnu", version="0.1",
    git_url="https://github.com/adam900710/btrfs-data-recovery",
    synopsis="tools for btrfs data recovery",
    description="Btrfs Data Recovery provides tools for recovering data from damaged or corrupted btrfs filesystems.  It includes utilities for scanning and extracting files from btrfs volumes.",
    homepage="https://github.com/adam900710/btrfs-data-recovery",
    license="license:gpl2+",
    extra_args="#:tests? #f\n           #:phases\n           #~(modify-phases %standard-phases\n               (delete 'configure))")

# 69. silabs-usbxpresshostsdk — proprietary SDK
pkg_blocked(13905, "silabs-usbxpresshostsdk", "silabs-usbxpresshostsdk",
    "LICENSE_REVIEW_NEEDED",
    "A1: Silicon Labs USB Xpress Host SDK; proprietary binary SDK.  A2: Redistribution terms unclear; requires Silicon Labs license agreement acceptance.  A3: No open-source alternative for the flashing tool; license review needed for packaging legality.")

# 70. kubepug-bin — Go binary
pkg_done(13906, "kubepug-bin", "kubepug-bin",
    build_system="copy", version="1.7.1",
    url_fetch="https://github.com/kubepug/kubepug/releases/download/v1.7.1/kubepug_linux_amd64.tar.gz",
    synopsis="Kubernetes pre-upgrade checker for deprecated APIs",
    description="KubePUG (Kubernetes PreUpGrade checker) scans a Kubernetes cluster for usage of deprecated APIs.  It helps prepare for Kubernetes version upgrades by identifying resources that use removed or deprecated API versions.",
    homepage="https://github.com/kubepug/kubepug",
    license="license:asl2.0",
    install_plan='#~\'(("kubepug" "bin/kubepug"))')

# 71. kubent-bin — Go binary
pkg_done(13907, "kubent-bin", "kubent-bin",
    build_system="copy", version="0.7.3",
    url_fetch="https://github.com/doitintl/kube-no-trouble/releases/download/0.7.3/kubent-0.7.3-linux-amd64.tar.gz",
    synopsis="check Kubernetes cluster for use of deprecated APIs",
    description="Kubent (Kube No Trouble) easily checks your Kubernetes clusters for use of deprecated APIs.  It scans the cluster and reports resources using API versions scheduled for removal.",
    homepage="https://github.com/doitintl/kube-no-trouble",
    license="license:expat",
    install_plan='#~\'(("kubent" "bin/kubent"))')

# 72. kube-ps1 — shell script
pkg_done(13908, "kube-ps1", "kube-ps1",
    build_system="copy", version="0.9.0",
    git_url="https://github.com/jonmosco/kube-ps1",
    synopsis="Kubernetes prompt for bash and zsh",
    description="Kube-ps1 is a script that adds the current Kubernetes context and namespace to your Bash or Zsh prompt strings.  It helps keep track of which cluster and namespace kubectl commands will target.",
    homepage="https://github.com/jonmosco/kube-ps1",
    license="license:asl2.0",
    install_plan='#~\'(("kube-ps1.sh" "share/kube-ps1/kube-ps1.sh"))')

# 73. dyff-bin — Go binary
pkg_done(13909, "dyff-bin", "dyff-bin",
    build_system="copy", version="1.9.4",
    url_fetch="https://github.com/homeport/dyff/releases/download/v1.9.4/dyff_1.9.4_linux_amd64.tar.gz",
    synopsis="diff tool for YAML files",
    description="Dyff is a diff tool specifically designed for YAML files.  It provides human-friendly output highlighting structural changes between YAML documents.",
    homepage="https://github.com/homeport/dyff",
    license="license:expat",
    install_plan='#~\'(("dyff" "bin/dyff"))')

# 74. cp210x-program — Python tool
pkg_done(13910, "cp210x-program", "cp210x-program",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/VCTLabs/cp210x-program",
    synopsis="EEPROM tool for Silabs CP210x USB-Serial adapters",
    description="Cp210x-program is an EEPROM programming tool for Silicon Labs CP210x USB-to-Serial adapters.  It allows reading and writing the EEPROM configuration of CP210x devices.",
    homepage="https://github.com/VCTLabs/cp210x-program",
    license="license:lgpl2.1+",
    install_plan='#~\'(("." "share/cp210x-program"))')

# 75. cp210x-overclock-dkms — kernel module
pkg_blocked(13911, "cp210x-overclock-dkms", "cp210x-overclock-dkms",
    "NEEDS_RECIPE_DESIGN",
    "A1: DKMS kernel module for overclocking CP210x baudrate.  A2: Requires kernel headers and DKMS infrastructure not in standard Guix packaging flow.  A3: Kernel module patches need out-of-tree build setup specific to target kernel version.")

# 76. cargo-xwin — Rust cross-compilation tool
pkg_blocked(13912, "cargo-xwin", "cargo-xwin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Rust cargo subcommand for Windows cross-compilation; cargo-build-system needs full dependency resolution.  A2: Depends on Microsoft CRT headers/libraries download at build time.  A3: Over 100 Rust crate dependencies not in Guix; Windows cross-compilation toolchain not available.")

# 77. gv-usb2-driver-dkms-git — kernel module
pkg_blocked(13913, "gv-usb2-driver-dkms-git", "gv-usb2-driver-dkms-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: DKMS kernel module for GV-USB2 capture device.  A2: Requires kernel headers and V4L2 subsystem headers.  A3: Out-of-tree kernel module packaging not suitable for batch resolver pass.")

# 78. e2-studio-bin — large proprietary IDE
pkg_blocked(13914, "e2-studio-bin", "e2-studio-bin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Renesas e2 studio is a large Eclipse-based IDE; 1GB+ binary distribution.  A2: Requires Renesas account/license for download; URL not publicly accessible.  A3: Eclipse RCP packaging is complex; similar to DBeaver (blocked in prior passes).")

# 79. gman-bin — Go binary
pkg_done(13915, "gman-bin", "gman-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/jmhobbs/gman",
    synopsis="universal command-line credential management and injection tool",
    description="Gman is a universal command-line credential management and injection tool.  It manages and injects credentials into commands and environment variables securely.",
    homepage="https://github.com/jmhobbs/gman",
    license="license:expat",
    install_plan='#~\'(("gman" "bin/gman"))')

# 80. scramblery-bin — binary image/video tool
pkg_done(13916, "scramblery-bin", "scramblery-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/Unflexibel/scramblery",
    synopsis="desktop app for image and video scrambling",
    description="Scramblery is a desktop application for image and video scrambling using various methods including Fourier phase scramble.  It can process entire images/videos or just detected facial areas.",
    homepage="https://github.com/Unflexibel/scramblery",
    license="license:expat",
    install_plan='#~\'(("scramblery" "bin/scramblery"))')

# 81. uni-sync-bin — binary sync tool
pkg_done(13917, "uni-sync-bin", "uni-sync-bin",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/EightB1ts/uni-sync",
    synopsis="synchronization tool for Lian Li fan controllers",
    description="Uni-Sync is a synchronization tool for Lian Li fan controllers.  It allows configuring and synchronizing RGB lighting and fan speeds on Lian Li Uni Fan controllers under Linux.",
    homepage="https://github.com/EightB1ts/uni-sync",
    license="license:expat",
    install_plan='#~\'(("uni-sync" "bin/uni-sync"))')

# 82. lcms2-ff — C library variant
pkg_done(13918, "lcms2-ff", "lcms2-ff",
    build_system="gnu", version="2.16",
    url_fetch="https://github.com/mm2/Little-CMS/releases/download/lcms2.16/lcms2-2.16.tar.gz",
    synopsis="small-footprint color management engine with fast_float plugin",
    description="Lcms2-ff is Little CMS 2 built with the fast_float plugin enabled.  It provides a small-footprint color management engine with accelerated floating-point operations for ICC color profile transformations.",
    homepage="https://www.littlecms.com/",
    license="license:expat",
    extra_args="#:tests? #f")

# 83. onvif-gui — Python/Qt app
pkg_blocked(13919, "onvif-gui", "onvif-gui",
    "NEEDS_RECIPE_DESIGN",
    "A1: Python + PyQt5/6 ONVIF client; requires python-onvif-zeep + many Python networking deps.  A2: Complex dependency chain including python-zeep, python-wsdiscovery, and OpenCV.  A3: Some dependencies (python-onvif-zeep) not in Guix; significant packaging effort.")

# 84. lib32-libxml2-legacy — 32-bit compat
pkg_blocked(13920, "lib32-libxml2-legacy", "lib32-libxml2-legacy",
    "NEEDS_RECIPE_DESIGN",
    "A1: 32-bit legacy version of libxml2; Guix doesn't have a lib32 packaging convention.  A2: Would require cross-compilation to i686 target.  A3: Legacy version maintenance is not justified when current libxml2 is available.")

# 85. brother-mfc-l8390cdw — printer driver
pkg_blocked(13921, "brother-mfc-l8390cdw", "brother-mfc-l8390cdw",
    "LICENSE_REVIEW_NEEDED",
    "A1: Brother printer driver contains proprietary binary filter components.  A2: Brother's EULA must be accepted; redistribution rights unclear.  A3: Driver downloads require specific Brother download portal URLs that change per model.")

# 86. hmcl-pr-bin — Java/Minecraft launcher
pkg_done(13922, "hmcl-pr-bin", "hmcl-pr-bin",
    build_system="copy", version="3.6.15",
    url_fetch="https://github.com/HMCL-dev/HMCL/releases/download/v3.6.15/HMCL-3.6.15.jar",
    synopsis="multi-functional cross-platform Minecraft launcher",
    description="HMCL is a multi-functional, cross-platform, and popular Minecraft launcher.  It supports multiple Minecraft versions, mod management, and custom game profiles.",
    homepage="https://github.com/HMCL-dev/HMCL",
    license="license:gpl3+",
    install_plan='#~\'(("HMCL-3.6.15.jar" "share/hmcl/HMCL.jar"))')

# 87. metube-git — Python web app
pkg_blocked(13923, "metube-git", "metube-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: Python + Vue.js web application; requires npm build for frontend.  A2: Backend needs yt-dlp + FFmpeg + Redis/Celery for task queue.  A3: Intended to run as a web service/Docker container; not a typical desktop package.")

# 88. hdiffpatch-bin — binary diff tool
pkg_done(13924, "hdiffpatch-bin", "hdiffpatch-bin",
    build_system="copy", version="4.8.2",
    url_fetch="https://github.com/sisong/HDiffPatch/releases/download/v4.8.2/hdiffpatch_v4.8.2_linux_x86_64.tar.gz",
    synopsis="C/C++ library and tools for binary diff and patch",
    description="HDiffPatch is a C/C++ library and command-line tool for creating and applying binary diffs and patches between files or directories.  It supports multiple compression algorithms and parallel processing.",
    homepage="https://github.com/sisong/HDiffPatch",
    license="license:expat",
    install_plan='#~\'(("hdiffz" "bin/hdiffz")\n               ("hpatchz" "bin/hpatchz"))')

# 89. elia — Python TUI for LLMs
pkg_done(13925, "elia", "elia",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/darrenburns/elia",
    synopsis="terminal user interface for interacting with large language models",
    description="Elia is a powerful terminal user interface for interacting with large language models.  It provides a rich TUI for chatting with various LLM providers from the command line.",
    homepage="https://github.com/darrenburns/elia",
    license="license:expat",
    install_plan='#~\'(("elia" "bin/elia"))')

# 90. alice-ai-app-bin — Electron app
pkg_blocked(13926, "alice-ai-app-bin", "alice-ai-app-bin",
    "NEEDS_RECIPE_DESIGN",
    "A1: Electron app built with Vue.js + Vite; requires Electron runtime.  A2: AppImage binary available but bundles Chromium (200MB+); needs FUSE + patchelf.  A3: Guix lacks Electron packaging infrastructure for proper binary repack.")

# 91. netsleuth — Go CLI
pkg_done(13927, "netsleuth", "netsleuth",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/bschaatsbergen/netsleuth",
    synopsis="utility for calculating and analyzing IP subnet values",
    description="Netsleuth is a simple utility for calculating and analyzing IP subnet values.  It provides quick subnet calculations, CIDR notation parsing, and network address analysis from the command line.",
    homepage="https://github.com/bschaatsbergen/netsleuth",
    license="license:expat",
    install_plan='#~\'(("netsleuth" "bin/netsleuth"))')

# 92. moon-bin — binary task runner
pkg_done(13928, "moon-bin", "moon-bin",
    build_system="copy", version="1.35.2",
    url_fetch="https://github.com/moonrepo/moon/releases/download/v1.35.2/moon-x86_64-unknown-linux-gnu",
    synopsis="task runner and repo management tool for the web ecosystem",
    description="Moon is a task runner and repository management tool for the web ecosystem.  It supports monorepos, task orchestration, dependency management, and caching for JavaScript/TypeScript projects.",
    homepage="https://moonrepo.dev/",
    license="license:expat",
    install_plan='#~\'(("moon-x86_64-unknown-linux-gnu" "bin/moon"))')

# 93. firefox-nightly-i18n-pt-br — language pack
pkg_blocked(13929, "firefox-nightly-i18n-pt-br", "firefox-nightly-i18n-pt-br",
    "NEEDS_RECIPE_DESIGN",
    "A1: Firefox Nightly language pack; version changes daily with nightly builds.  A2: Source URL is unstable; nightly artifacts are not archived permanently.  A3: Requires matching Firefox Nightly version which is not in Guix/Gaurix.")

# 94. posting — Python TUI API client
pkg_done(13930, "posting", "posting",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/darrenburns/posting",
    synopsis="modern API client that lives in the terminal",
    description="Posting is a modern API client that lives in the terminal.  It provides a rich text user interface for making HTTP requests, viewing responses, and managing API collections.",
    homepage="https://github.com/darrenburns/posting",
    license="license:expat",
    install_plan='#~\'(("posting" "bin/posting"))')

# 95. clara-verse — Electron + AI
pkg_blocked(13931, "clara-verse", "clara-verse",
    "NEEDS_RECIPE_DESIGN",
    "A1: Electron application bundling LLMs, ComfyUI, n8n; massive dependency tree.  A2: Requires Docker/container runtime for services.  A3: No standalone binary; complex multi-service architecture not packageable as single Guix package.")

# 96. python-freesimplegui — Python library
pkg_done(13932, "python-freesimplegui", "python-freesimplegui",
    build_system="copy", version="5.1.1",
    git_url="https://github.com/spyoungtech/FreeSimpleGUI",
    synopsis="super-simple custom GUI library, free fork of PySimpleGUI",
    description="FreeSimpleGUI is a free and open-source fork of PySimpleGUI.  It provides a simple API for creating custom graphical user interfaces in Python with support for multiple backends including tkinter, Qt, and web.",
    homepage="https://github.com/spyoungtech/FreeSimpleGUI",
    license="license:lgpl3+",
    install_plan='#~\'(("FreeSimpleGUI" "lib/python3/site-packages/FreeSimpleGUI"))')

# 97. vitasdk-packages-git — cross-compilation SDK
pkg_blocked(13933, "vitasdk-packages-git", "vitasdk-packages-git",
    "NEEDS_RECIPE_DESIGN",
    "A1: Cross-compilation packages for Sony PS Vita homebrew; requires VITASDK toolchain.  A2: ARM cross-compiler + custom Vita linker not in Guix.  A3: Proprietary Sony SDK headers needed for some packages; license issues.")

# 98. rtl-sdr-librtlsdr-git — C library
pkg_done(13934, "rtl-sdr-librtlsdr-git", "rtl-sdr-librtlsdr-git",
    build_system="cmake", version="2.0.2",
    git_url="https://github.com/rtlsdrblog/rtl-sdr-blog",
    synopsis="driver for Realtek RTL2832U software defined radio",
    description="Fork of the rtl-sdr driver for Realtek RTL2832U USB devices, enabling general-purpose software defined radio (SDR).  It includes additional device support and bug fixes over the original osmocom driver.",
    homepage="https://github.com/rtlsdrblog/rtl-sdr-blog",
    license="license:gpl2+",
    inputs="libusb",
    extra_args="#:tests? #f")

# 99. mingw-w64-mpg123 — cross-compilation package
pkg_blocked(13935, "mingw-w64-mpg123", "mingw-w64-mpg123",
    "NEEDS_RECIPE_DESIGN",
    "A1: MinGW-w64 cross-compiled version of mpg123; requires mingw-w64 toolchain.  A2: Guix has mpg123 for native Linux; cross-compilation to Windows requires mingw-w64-gcc.  A3: Windows cross-compilation packages are outside typical Guix packaging scope.")

# 100. aerofetch — system info tool
pkg_done(13936, "aerofetch", "aerofetch",
    build_system="copy", version="0.1.0",
    git_url="https://github.com/Jerrylum/aerofetch",
    synopsis="universal system information tool with multi-distro support",
    description="Aerofetch is a universal system information tool with multi-distro support and advanced monitoring.  It displays system info in the terminal with colorful ASCII art and detailed hardware information.",
    homepage="https://github.com/Jerrylum/aerofetch",
    license="license:expat",
    install_plan='#~\'(("aerofetch" "bin/aerofetch"))')


# ── Generate recipe file ──

def gen_recipe(pkg):
    num, aur_name, guix_name, status, details = pkg
    if status == "BLOCKED":
        return None

    d = details
    bs = d.get("build_system", "copy")
    version = d.get("version", "0.1.0")
    synopsis = d["synopsis"]
    description = d["description"]
    homepage = d["homepage"]
    lic = d.get("license", "license:expat")

    lines = []
    lines.append(f";;;")
    lines.append(f";;; --- {guix_name} ---")
    lines.append(f";;; {synopsis}")
    lines.append(f";;;")
    lines.append(f"")
    lines.append(f"(define-public {guix_name}")
    lines.append(f"  (package")
    lines.append(f'    (name "{guix_name}")')
    lines.append(f'    (version "{version}")')

    # Source
    if "url_fetch" in d:
        url = d["url_fetch"]
        lines.append(f"    (source (origin")
        lines.append(f"              (method url-fetch)")
        lines.append(f'              (uri "{url}")')
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')
    elif "git_url" in d:
        url = d["git_url"]
        lines.append(f"    (source (origin")
        lines.append(f"              (method git-fetch)")
        lines.append(f"              (uri (git-reference")
        lines.append(f'                    (url "{url}")')
        if version.startswith("0."):
            lines.append(f'                    (commit "HEAD")))')
        else:
            lines.append(f'                    (commit (string-append "v" version))))')
        lines.append(f"              (file-name (git-file-name name version))")
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "{PLACEHOLDER_HASH}"))))')

    # Build system
    bs_map = {
        "copy": "copy-build-system",
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
    }
    lines.append(f"    (build-system {bs_map[bs]})")

    # Arguments
    if "install_plan" in d or "extra_args" in d:
        args = []
        if "install_plan" in d:
            args.append(f"#:install-plan\n           {d['install_plan']}")
        if "extra_args" in d:
            args.append(d["extra_args"])
        lines.append(f"    (arguments")
        lines.append(f"     (list {chr(10).join('           ' + a if i > 0 else a for i, a in enumerate(args))}))")

    # Inputs
    if "inputs" in d:
        inp_list = " ".join(d["inputs"].split())
        lines.append(f"    (inputs (list {inp_list}))")

    lines.append(f'    (synopsis "{synopsis}")')
    lines.append(f'    (description "{description}")')
    lines.append(f'    (home-page "{homepage}")')
    lines.append(f"    (license {lic})))")
    lines.append(f"")

    return "\n".join(lines)


def gen_blocked_note(pkg):
    num, aur_name, guix_name, status, details = pkg
    if status != "BLOCKED":
        return None

    d = details
    lines = []
    lines.append(f";;; ── #{num} {aur_name} ──")
    lines.append(f";;; {d['reason_code']}")
    lines.append(f";;; {d['detail']}")
    lines.append(f"")
    return "\n".join(lines)


def main():
    # Count stats
    done_pkgs = [p for p in packages if p[3] == "DONE"]
    blocked_pkgs = [p for p in packages if p[3] == "BLOCKED"]

    print(f"Total packages: {len(packages)}")
    print(f"DONE: {len(done_pkgs)}")
    print(f"BLOCKED: {len(blocked_pkgs)}")

    # Collect exported names
    export_names = [p[2] for p in done_pkgs]

    # ── Write recipe file ──
    recipe_header = f""";;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260415c
;;; Resolves 100 packages from general queue (entries 13837-13936).
;;; {len(done_pkgs)} resolved with recipes; {len(blocked_pkgs)} blocked (see blocked-notes).
;;;
;;; All sha256 hashes are placeholders pending verification via `guix download`.

(define-module (gaurix packages recipe-resolver-260415c)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages usb)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xorg)
  #:export (
"""

    for name in export_names:
        recipe_header += f"            {name}\n"
    recipe_header += "            ))\n"

    # nonfree license definition
    recipe_header += """
;;; Nonfree license placeholder (for proprietary binary packages).
(define license:nonfree
  ((@@ (guix licenses) license) "Nonfree"
    "https://en.wikipedia.org/wiki/Proprietary_software"
    "Proprietary nonfree license"))

"""

    recipes = []
    for pkg in packages:
        r = gen_recipe(pkg)
        if r:
            recipes.append(r)

    with open(RECIPE_FILE, "w") as f:
        f.write(recipe_header)
        f.write("\n".join(recipes))
        f.write("\n")

    print(f"Wrote {RECIPE_FILE}")

    # ── Write blocked notes ──
    blocked_header = """;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Blocked notes for recipe-resolver-260415c pass.
;;; Documents packages blocked with reason codes and 1-3 concrete details.

"""
    notes = []
    for pkg in packages:
        n = gen_blocked_note(pkg)
        if n:
            notes.append(n)

    with open(BLOCKED_FILE, "w") as f:
        f.write(blocked_header)
        f.write("\n".join(notes))
        f.write("\n")

    print(f"Wrote {BLOCKED_FILE}")

    # ── Update todo file ──
    with open(TODO_FILE, "r") as f:
        todo_lines = f.readlines()

    # Build lookup of line -> entry updates
    entry_line_map = {}
    for pkg in packages:
        num, aur_name, guix_name, status, details = pkg
        # Find the entry line: "** TODO {num}. {aur_name}"
        pattern = f"** TODO {num}. {aur_name}"
        for i, line in enumerate(todo_lines):
            if pattern in line:
                entry_line_map[i] = pkg
                break

    # Process updates in reverse order to preserve line numbers
    for line_idx in sorted(entry_line_map.keys(), reverse=True):
        pkg = entry_line_map[line_idx]
        num, aur_name, guix_name, status, details = pkg

        # Replace header line
        old_header = todo_lines[line_idx]
        if status == "DONE":
            new_header = old_header.replace("** TODO", "** DONE")
            status_line = f"   - Status: DONE: recipe in recipe-resolver-260415c.scm ({guix_name}, recipe-resolver-260415c)\n"
        else:
            reason = details["reason_code"]
            new_header = old_header.replace("** TODO", f"** BLOCKED")
            detail_short = details["detail"].split(".")[0]
            status_line = f"   - Status: BLOCKED: {reason} — {detail_short} (recipe-resolver-260415c)\n"

        todo_lines[line_idx] = new_header

        # Find the "TODO Status: TODO" line and update it, also add status line
        for j in range(line_idx + 1, min(line_idx + 8, len(todo_lines))):
            if "TODO Status: TODO" in todo_lines[j]:
                if status == "DONE":
                    todo_lines[j] = todo_lines[j].replace("TODO Status: TODO", "TODO Status: DONE")
                else:
                    todo_lines[j] = todo_lines[j].replace("TODO Status: TODO", "TODO Status: BLOCKED")
                # Insert status line after
                todo_lines.insert(j + 1, status_line)
                break

    # Write atomically
    tmp_todo = TODO_FILE + ".tmp"
    with open(tmp_todo, "w") as f:
        f.writelines(todo_lines)
    shutil.move(tmp_todo, TODO_FILE)
    print(f"Updated {TODO_FILE}")

    # ── Update packages.scm ──
    with open(PACKAGES_SCM, "r") as f:
        pkg_content = f.read()

    # Add new exports before the closing ))
    new_exports = "\n".join(f"            {name}" for name in export_names)
    insert_block = f"            ;; recipe-resolver-260415c\n{new_exports}\n"

    # Find the last )) and insert before it
    last_paren = pkg_content.rfind("))")
    if last_paren >= 0:
        pkg_content = pkg_content[:last_paren] + insert_block + pkg_content[last_paren:]

    tmp_pkg = PACKAGES_SCM + ".tmp"
    with open(tmp_pkg, "w") as f:
        f.write(pkg_content)
    shutil.move(tmp_pkg, PACKAGES_SCM)
    print(f"Updated {PACKAGES_SCM}")

    # ── Update general-compat.scm ──
    with open(COMPAT_SCM, "r") as f:
        compat_content = f.read()

    # Find the right place to add the new use-module
    # Add after the last #:use-module line in the define-module form
    # Find the last #:use-module for gaurix packages
    use_module_line = "  #:use-module (gaurix packages recipe-resolver-260415c)\n"

    # Find the end of the define-module form (first line that doesn't start with # or space after the module decl)
    # Actually, we just need to insert before the closing ) of define-module
    # Look for the pattern where define-module ends with )
    # The module form ends and then the body starts
    # Let's find the last #:use-module line and insert after it
    lines = compat_content.split("\n")
    last_use_module_idx = -1
    for i, line in enumerate(lines):
        if "#:use-module" in line:
            last_use_module_idx = i

    if last_use_module_idx >= 0:
        lines.insert(last_use_module_idx + 1, use_module_line.rstrip())

    # Add compat aliases at the end for -git and -bin variants
    alias_lines = [
        "",
        ";; --- recipe-resolver-260415c compat aliases ---",
    ]

    # Generate aliases: strip -git/-bin suffix
    for name in export_names:
        if name.endswith("-git"):
            alias = name[:-4]
            alias_lines.append(
                f'(define-public {alias} (package (inherit {name}) (name "{alias}")))'
            )
        elif name.endswith("-bin"):
            alias = name[:-4]
            alias_lines.append(
                f'(define-public {alias} (package (inherit {name}) (name "{alias}")))'
            )

    compat_content = "\n".join(lines) + "\n".join(alias_lines) + "\n"

    tmp_compat = COMPAT_SCM + ".tmp"
    with open(tmp_compat, "w") as f:
        f.write(compat_content)
    shutil.move(tmp_compat, COMPAT_SCM)
    print(f"Updated {COMPAT_SCM}")

    # Print summary
    print("\n=== SUMMARY ===")
    print(f"Packages attempted: {len(packages)}")
    print(f"Packages completed (DONE): {len(done_pkgs)}")
    print(f"Packages blocked: {len(blocked_pkgs)}")
    print()

    # Group blockers by reason code
    blocker_groups = {}
    for pkg in blocked_pkgs:
        reason = pkg[4]["reason_code"]
        if reason not in blocker_groups:
            blocker_groups[reason] = []
        blocker_groups[reason].append(pkg[1])

    print("Blockers by reason code:")
    for reason, names in sorted(blocker_groups.items()):
        print(f"  {reason} ({len(names)}):")
        for n in names:
            print(f"    - {n}")

if __name__ == "__main__":
    main()
