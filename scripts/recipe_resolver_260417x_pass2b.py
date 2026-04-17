#!/usr/bin/env python3
"""
Pass 2b: Re-download the 16 that succeeded in pass2 + retry the 19 that failed.
Then merge results into the existing recipe-resolver-260417x.scm.
"""

import json
import os
import re
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed

RESOLVER_ID = "recipe-resolver-260417x"
RESOLVER_FILE = f"guix/gaurix/packages/{RESOLVER_ID}.scm"
TODO_FILE = "todo_general_packages.org"
PACKAGES_FILE = "guix/gaurix/packages.scm"
COMPAT_FILE = "guix/gaurix/packages/general-compat.scm"
DOWNLOAD_TIMEOUT = 60
MAX_PARALLEL = 6

# All packages to attempt
PACKAGES = {
    # ── Pass2 successes (re-download for hashes) ──
    "pithos": {
        "urls": ["https://github.com/pithos/pithos/archive/refs/tags/1.6.2.tar.gz"],
        "version": "1.6.2", "bs": "meson", "license": "license:gpl3",
        "homepage": "https://pithos.github.io/",
        "desc": "Pandora Internet Radio player for GNOME",
    },
    "vulkan-caps-viewer-x11": {
        "urls": ["https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/4.11.tar.gz"],
        "version": "4.11", "bs": "cmake", "license": "license:lgpl3+",
        "homepage": "https://vulkan.gpuinfo.org",
        "desc": "Vulkan hardware capability viewer for X11",
    },
    "vulkan-caps-viewer-wayland": {
        "urls": ["https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/4.11.tar.gz"],
        "version": "4.11", "bs": "cmake", "license": "license:lgpl3+",
        "homepage": "https://vulkan.gpuinfo.org",
        "desc": "Vulkan hardware capability viewer for Wayland",
    },
    "ampache": {
        "urls": ["https://github.com/ampache/ampache/archive/refs/tags/7.9.2.tar.gz"],
        "version": "7.9.2", "bs": "copy", "license": "license:agpl3+",
        "homepage": "https://ampache.org/",
        "desc": "Web-based audio/video streaming application and file manager",
    },
    "steamos-add-to-steam": {
        "urls": ["https://github.com/vicrodh/steamos-add-to-steam/archive/refs/tags/v1.0.0.tar.gz"],
        "version": "1.0.0", "bs": "copy", "license": "license:expat",
        "homepage": "https://github.com/vicrodh/steamos-add-to-steam",
        "desc": "Script to add non-Steam games to Steam on SteamOS",
    },
    "wofi-vim": {
        "urls": ["https://github.com/timasoft/wofi-vim/archive/refs/heads/master.tar.gz"],
        "version": "1.0", "bs": "copy", "license": "license:expat",
        "homepage": "https://github.com/timasoft/wofi-vim",
        "desc": "Vim-like key bindings for wofi launcher",
    },
    "kitty-terminfo-git": {
        "urls": ["https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.40.0.tar.gz"],
        "version": "0.40.0", "bs": "copy", "license": "license:gpl3",
        "homepage": "https://sw.kovidgoyal.net/kitty/",
        "desc": "Terminfo files for the kitty terminal emulator",
    },
    "kitty-shell-integration-git": {
        "urls": ["https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.40.0.tar.gz"],
        "version": "0.40.0", "bs": "copy", "license": "license:gpl3",
        "homepage": "https://sw.kovidgoyal.net/kitty/",
        "desc": "Shell integration scripts for kitty terminal emulator",
    },
    "guile1.8": {
        "urls": ["https://ftp.gnu.org/gnu/guile/guile-1.8.8.tar.gz"],
        "version": "1.8.8", "bs": "gnu", "license": "license:gpl2+",
        "homepage": "https://www.gnu.org/software/guile/",
        "desc": "GNU extension language and Scheme interpreter, version 1.8",
    },
    "cobra-cli": {
        "urls": ["https://github.com/spf13/cobra-cli/archive/refs/tags/v1.3.0.tar.gz"],
        "version": "1.3.0", "bs": "copy", "license": "license:asl2.0",
        "homepage": "https://cobra.dev",
        "desc": "CLI tool for generating Cobra application scaffolding",
    },
    "portainer-bin": {
        "urls": ["https://github.com/portainer/portainer/releases/download/2.37.0/portainer-2.37.0-linux-amd64.tar.gz"],
        "version": "2.37.0", "bs": "copy", "license": "license:zlib",
        "homepage": "https://www.portainer.io/",
        "desc": "Lightweight management UI for Docker and Kubernetes",
    },
    "python-rocket-fft-git": {
        "urls": ["https://github.com/styfenschaer/rocket-fft/archive/refs/tags/v0.2.5.tar.gz"],
        "version": "0.2.5", "bs": "pyproject", "license": "license:bsd-3",
        "homepage": "https://github.com/styfenschaer/rocket-fft",
        "desc": "Fast FFT implementation for Python using Numba",
    },
    "pianobooster": {
        "urls": ["https://github.com/pianobooster/PianoBooster/archive/refs/tags/v1.0.0.tar.gz"],
        "version": "1.0.0", "bs": "cmake", "license": "license:gpl3+",
        "homepage": "https://www.pianobooster.org",
        "desc": "Piano practice aid that plays MIDI files and listens to your playing",
    },
    "textadept-gtk3": {
        "urls": ["https://github.com/orbitalquark/textadept/archive/refs/tags/textadept_12.9.tar.gz"],
        "version": "12.9", "bs": "gnu", "license": "license:expat",
        "homepage": "https://orbitalquark.github.io/textadept/",
        "desc": "Fast, minimalist, and remarkably extensible cross-platform text editor",
    },
    "mystmd": {
        "urls": ["https://github.com/jupyter-book/mystmd/archive/refs/tags/mystmd@1.8.0.tar.gz"],
        "version": "1.8.0", "bs": "copy", "license": "license:expat",
        "homepage": "https://mystmd.org/",
        "desc": "Command line tools for MyST Markdown document authoring",
    },
    "bloop": {
        "urls": ["https://github.com/scalacenter/bloop/archive/refs/tags/v2.0.19.tar.gz"],
        "version": "2.0.19", "bs": "copy", "license": "license:asl2.0",
        "homepage": "https://scalacenter.github.io/bloop/",
        "desc": "Fast Scala build server for IDE and CLI compilation",
    },
    # ── Pass2 failures: retried with alternate URLs ──
    "pacman-contrib-git": {
        "urls": [
            "https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/v1.10.7/pacman-contrib-v1.10.7.tar.bz2",
            "https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/v1.10.6/pacman-contrib-v1.10.6.tar.bz2",
        ],
        "version": "1.10.7", "bs": "gnu", "license": "license:gpl2+",
        "homepage": "https://gitlab.archlinux.org/pacman/pacman-contrib",
        "desc": "Contributed scripts and tools for pacman systems",
    },
    "fingerprint-gui": {
        "urls": [
            "https://github.com/nicenemo/fingerprint-gui/archive/refs/heads/master.tar.gz",
            "https://github.com/nicenemo/fingerprint-gui/archive/refs/tags/v1.09.tar.gz",
        ],
        "version": "1.09", "bs": "cmake", "license": "license:gpl2+",
        "homepage": "https://github.com/nicenemo/fingerprint-gui",
        "desc": "GUI for fingerprint reader management on Linux",
    },
    "nagstamon-git": {
        "urls": [
            "https://github.com/HenriWahl/Nagstamon/archive/refs/tags/v3.14.0.tar.gz",
            "https://github.com/HenriWahl/Nagstamon/archive/refs/tags/Nagstamon-3.14.0.tar.gz",
        ],
        "version": "3.14.0", "bs": "pyproject", "license": "license:gpl2+",
        "homepage": "https://nagstamon.de/",
        "desc": "Nagios status monitor for desktop notification area",
    },
    "mp3gain": {
        "urls": [
            "https://sourceforge.net/projects/mp3gain/files/mp3gain/1.6.2/mp3gain-1_6_2-src.zip/download",
        ],
        "version": "1.6.2", "bs": "gnu", "license": "license:gpl2+",
        "homepage": "https://sourceforge.net/projects/mp3gain/",
        "desc": "Lossless MP3 volume normalizer with statistical analysis",
    },
    "findent": {
        "urls": [
            "https://sourceforge.net/projects/findent/files/findent-4.3.6.tar.gz/download",
        ],
        "version": "4.3.6", "bs": "gnu", "license": "license:bsd-3",
        "homepage": "https://www.ratrabbit.nl/ratrabbit/findent",
        "desc": "Fortran source code indenter and converter",
    },
    "simgrid": {
        "urls": [
            "https://framagit.org/simgrid/simgrid/-/archive/v3.36/simgrid-v3.36.tar.bz2",
            "https://framagit.org/simgrid/simgrid/-/archive/v3.35/simgrid-v3.35.tar.bz2",
        ],
        "version": "3.36", "bs": "cmake", "license": "license:lgpl2.1",
        "homepage": "https://simgrid.org/",
        "desc": "Versatile simulation framework for distributed systems",
    },
    "etterna": {
        "urls": [
            "https://github.com/etternagame/etterna/archive/refs/tags/v0.74.3.tar.gz",
            "https://github.com/etternagame/etterna/archive/refs/tags/v0.74.2.tar.gz",
        ],
        "version": "0.74.3", "bs": "cmake", "license": "license:expat",
        "homepage": "https://etternaonline.com",
        "desc": "Advanced rhythm game focused on keyboard play",
    },
    "devkitty-git": {
        "urls": [
            "https://github.com/nickvdyck/devkitty/archive/refs/heads/main.tar.gz",
            "https://github.com/nickvdyck/devkitty/archive/refs/heads/master.tar.gz",
        ],
        "version": "4.1.1", "bs": "copy", "license": "license:expat",
        "homepage": "https://devkitty.app/",
        "desc": "Developer toolkit for common development tasks",
    },
    "arsenal": {
        "urls": [
            "https://github.com/Orange-Cyberdefense/arsenal/archive/refs/tags/v1.1.0.tar.gz",
            "https://github.com/Orange-Cyberdefense/arsenal/archive/refs/heads/master.tar.gz",
        ],
        "version": "1.1.0", "bs": "pyproject", "license": "license:gpl3+",
        "homepage": "https://github.com/Orange-Cyberdefense/arsenal",
        "desc": "Cheat sheet tool for pentest and CTF commands",
    },
    "miniupnpd-nft-git": {
        "urls": [
            "https://miniupnp.tuxfamily.org/files/miniupnpd-2.3.7.tar.gz",
            "https://miniupnp.tuxfamily.org/files/miniupnpd-2.3.6.tar.gz",
        ],
        "version": "2.3.7", "bs": "gnu", "license": "license:bsd-3",
        "homepage": "https://miniupnp.tuxfamily.org",
        "desc": "Lightweight UPnP IGD daemon using nftables",
    },
    "libfprint-1": {
        "urls": [
            "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.8/libfprint-v1.94.8.tar.bz2",
            "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.7/libfprint-v1.94.7.tar.bz2",
        ],
        "version": "1.94.8", "bs": "meson", "license": "license:lgpl2.1+",
        "homepage": "https://fprint.freedesktop.org/",
        "desc": "Library for fingerprint reader support",
    },
    "gtk2-theme-dust": {
        "urls": [
            "https://github.com/nicholasgasior/Dust-Theme/archive/refs/heads/master.tar.gz",
        ],
        "version": "0.5.1", "bs": "copy", "license": "license:gpl3+",
        "homepage": "https://wiki.ubuntu.com/Artwork/Incoming/DustTheme",
        "desc": "Dust GTK2 theme for warm, earthy desktop appearance",
    },
    "apache-jena-fuseki": {
        "urls": [
            "https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-5.4.0.tar.gz",
            "https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-5.3.0.tar.gz",
        ],
        "version": "5.4.0", "bs": "copy", "license": "license:asl2.0",
        "homepage": "https://jena.apache.org/",
        "desc": "SPARQL server for Apache Jena RDF framework",
    },
    "apache-jena": {
        "urls": [
            "https://archive.apache.org/dist/jena/binaries/apache-jena-5.4.0.tar.gz",
            "https://archive.apache.org/dist/jena/binaries/apache-jena-5.3.0.tar.gz",
        ],
        "version": "5.4.0", "bs": "copy", "license": "license:asl2.0",
        "homepage": "https://jena.apache.org/",
        "desc": "Java framework for building Semantic Web and linked-data applications",
    },
    "ttf-raleway-variable": {
        "urls": [
            "https://github.com/theleagueof/raleway/releases/download/4.101/Raleway.zip",
            "https://github.com/theleagueof/raleway/archive/refs/heads/master.tar.gz",
        ],
        "version": "4.101", "bs": "copy", "license": "license:silofl1.1",
        "homepage": "https://www.theleagueofmoveabletype.com/raleway",
        "desc": "Raleway variable font family, an elegant sans-serif typeface",
    },
    "otf-raleway": {
        "urls": [
            "https://github.com/theleagueof/raleway/releases/download/4.101/Raleway.zip",
            "https://github.com/theleagueof/raleway/archive/refs/heads/master.tar.gz",
        ],
        "version": "4.101", "bs": "copy", "license": "license:silofl1.1",
        "homepage": "https://www.theleagueofmoveabletype.com/raleway",
        "desc": "Raleway OpenType font family, an elegant sans-serif typeface",
    },
    "license": {
        "urls": [
            "https://git.sr.ht/~zethra/license/archive/v3.2.1.tar.gz",
            "https://git.sr.ht/~zethra/license/archive/3.2.1.tar.gz",
        ],
        "version": "3.2.1", "bs": "copy", "license": "license:mpl2.0",
        "homepage": "https://sr.ht/~zethra/license",
        "desc": "Command line tool for managing project licenses",
    },
    "psf-unifont": {
        "urls": [
            "https://unifoundry.com/pub/unifont/unifont-16.0.01/unifont-16.0.01.tar.gz",
        ],
        "version": "16.0.01", "bs": "copy", "license": "license:gpl2+",
        "homepage": "https://unifoundry.com/unifont/",
        "desc": "GNU Unifont PSF font for console use",
    },
    "otb-unifont": {
        "urls": [
            "https://unifoundry.com/pub/unifont/unifont-16.0.01/unifont-16.0.01.tar.gz",
        ],
        "version": "16.0.01", "bs": "copy", "license": "license:gpl2+",
        "homepage": "https://unifoundry.com/unifont/",
        "desc": "GNU Unifont OTB bitmap font for low-resolution displays",
    },
}


def try_guix_download(url, timeout=DOWNLOAD_TIMEOUT):
    """Try to download a URL with guix download and return the hash."""
    try:
        result = subprocess.run(
            ["guix", "download", url],
            capture_output=True, text=True, timeout=timeout
        )
        if result.returncode == 0:
            lines = result.stdout.strip().split("\n")
            for line in lines:
                line = line.strip()
                if len(line) == 52 and all(c in "0123456789abcdfghijklmnpqrsvwxyz" for c in line):
                    return line
        return None
    except (subprocess.TimeoutExpired, Exception):
        return None


def download_pkg(item):
    """Try all URLs for a package, return (name, hash, url)."""
    name, info = item
    for url in info["urls"]:
        h = try_guix_download(url)
        if h:
            return (name, h, url)
    return (name, None, None)


# ── Download all ──
names_items = list(PACKAGES.items())
print(f"Attempting downloads for {len(names_items)} packages...", file=sys.stderr)

results = {}
with ThreadPoolExecutor(max_workers=MAX_PARALLEL) as executor:
    future_to_name = {executor.submit(download_pkg, item): item[0] for item in names_items}
    done = 0
    for future in as_completed(future_to_name):
        name = future_to_name[future]
        done += 1
        n, h, u = future.result()
        results[n] = (h, u)
        status = "OK" if h else "FAIL"
        print(f"  [{done}/{len(names_items)}] {status} {n}", file=sys.stderr)

# Report
succeeded = {n: (h, u) for n, (h, u) in results.items() if h}
failed = {n for n, (h, u) in results.items() if not h}

print(f"\nSucceeded: {len(succeeded)}", file=sys.stderr)
print(f"Failed: {len(failed)}", file=sys.stderr)
if failed:
    for n in sorted(failed):
        print(f"  FAIL: {n}", file=sys.stderr)

# Output JSON
output = {}
for name, (h, u) in succeeded.items():
    info = PACKAGES[name]
    output[name] = {
        "hash": h,
        "source_url": u,
        "version": info["version"],
        "bs": info["bs"],
        "license": info["license"],
        "homepage": info["homepage"],
        "desc": info["desc"],
    }

with open("reports/recipe-resolver-260417x-pass2.json", "w") as f:
    json.dump(output, f, indent=2)

print(f"\nResults written to reports/recipe-resolver-260417x-pass2.json", file=sys.stderr)
print(f"Total new recipes: {len(succeeded)}", file=sys.stderr)
