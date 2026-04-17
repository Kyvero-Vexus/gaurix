#!/usr/bin/env python3
"""
Second pass for recipe-resolver-260417x: resolve blocked packages with
manually researched source URLs.
"""

import json
import os
import re
import subprocess
import sys

RESOLVER_FILE = "guix/gaurix/packages/recipe-resolver-260417x.scm"
DOWNLOAD_TIMEOUT = 60
MAX_PARALLEL = 8

# Manually researched source URLs for blocked packages
# Format: {name: {url: str, version: str, build_system: str, ...}}
MANUAL_URLS = {
    "steamos-add-to-steam": {
        "urls": [
            "https://github.com/vicrodh/steamos-add-to-steam/archive/refs/tags/v1.0.0.tar.gz",
            "https://github.com/vicrodh/steamos-add-to-steam/archive/refs/heads/main.tar.gz",
            "https://github.com/vicrodh/steamos-add-to-steam/archive/refs/heads/master.tar.gz",
        ],
        "version": "1.0.0",
        "bs": "gnu",
        "license": "license:expat",
    },
    "mp3gain": {
        "urls": [
            "https://sourceforge.net/projects/mp3gain/files/mp3gain/1.6.2/mp3gain-1_6_2-src.zip/download",
            "https://downloads.sourceforge.net/project/mp3gain/mp3gain/1.6.2/mp3gain-1_6_2-src.zip",
        ],
        "version": "1.6.2",
        "bs": "gnu",
        "license": "license:gpl2+",
    },
    "pacman-contrib-git": {
        "urls": [
            "https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/v1.10.7/pacman-contrib-v1.10.7.tar.gz",
            "https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/main/pacman-contrib-main.tar.gz",
        ],
        "version": "1.10.7",
        "bs": "gnu",
        "license": "license:gpl2+",
    },
    "pithos": {
        "urls": [
            "https://github.com/pithos/pithos/archive/refs/tags/1.6.2.tar.gz",
        ],
        "version": "1.6.2",
        "bs": "meson",
        "license": "license:gpl3",
    },
    "fingerprint-gui": {
        "urls": [
            "https://github.com/maksbotan/fingerprint-gui/archive/refs/tags/v1.09.tar.gz",
            "https://github.com/maksbotan/fingerprint-gui/archive/refs/tags/1.09.tar.gz",
        ],
        "version": "1.09",
        "bs": "cmake",
        "license": "license:gpl2+",
    },
    "wofi-vim": {
        "urls": [
            "https://github.com/timasoft/wofi-vim/archive/refs/tags/v1.0.tar.gz",
            "https://github.com/timasoft/wofi-vim/archive/refs/tags/1.0.tar.gz",
            "https://github.com/timasoft/wofi-vim/archive/refs/heads/master.tar.gz",
            "https://github.com/timasoft/wofi-vim/archive/refs/heads/main.tar.gz",
        ],
        "version": "1.0",
        "bs": "gnu",
        "license": "license:expat",
    },
    "ampache": {
        "urls": [
            "https://github.com/ampache/ampache/archive/refs/tags/7.9.2.tar.gz",
            "https://github.com/ampache/ampache/archive/refs/tags/v7.9.2.tar.gz",
        ],
        "version": "7.9.2",
        "bs": "copy",
        "license": "license:agpl3+",
    },
    "vulkan-caps-viewer-x11": {
        "urls": [
            "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/4.11.tar.gz",
            "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/v4.11.tar.gz",
        ],
        "version": "4.11",
        "bs": "cmake",
        "license": "license:lgpl3+",
    },
    "vulkan-caps-viewer-wayland": {
        "urls": [
            "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/4.11.tar.gz",
            "https://github.com/SaschaWillems/VulkanCapsViewer/archive/refs/tags/v4.11.tar.gz",
        ],
        "version": "4.11",
        "bs": "cmake",
        "license": "license:lgpl3+",
    },
    "kitty-terminfo-git": {
        "urls": [
            "https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.40.0.tar.gz",
            "https://github.com/kovidgoyal/kitty/archive/refs/heads/master.tar.gz",
        ],
        "version": "0.40.0",
        "bs": "copy",
        "license": "license:gpl3",
    },
    "kitty-shell-integration-git": {
        "urls": [
            "https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.40.0.tar.gz",
            "https://github.com/kovidgoyal/kitty/archive/refs/heads/master.tar.gz",
        ],
        "version": "0.40.0",
        "bs": "copy",
        "license": "license:gpl3",
    },
    "portainer-bin": {
        "urls": [
            "https://github.com/portainer/portainer/releases/download/2.37.0/portainer-2.37.0-linux-amd64.tar.gz",
        ],
        "version": "2.37.0",
        "bs": "copy",
        "license": "license:zlib",
    },
    "guile1.8": {
        "urls": [
            "https://ftp.gnu.org/gnu/guile/guile-1.8.8.tar.gz",
            "https://ftpmirror.gnu.org/guile/guile-1.8.8.tar.gz",
        ],
        "version": "1.8.8",
        "bs": "gnu",
        "license": "license:gpl2+",
    },
    "etterna": {
        "urls": [
            "https://github.com/etternagame/etterna/archive/refs/tags/v0.74.4.tar.gz",
            "https://github.com/etternagame/etterna/archive/refs/tags/0.74.4.tar.gz",
        ],
        "version": "0.74.4",
        "bs": "cmake",
        "license": "license:expat",
    },
    "cobra-cli": {
        "urls": [
            "https://github.com/spf13/cobra-cli/archive/refs/tags/v1.3.0.tar.gz",
        ],
        "version": "1.3.0",
        "bs": "copy",
        "license": "license:asl2.0",
    },
    "python-rocket-fft-git": {
        "urls": [
            "https://github.com/styfenschaer/rocket-fft/archive/refs/tags/v0.2.5.tar.gz",
            "https://github.com/styfenschaer/rocket-fft/archive/refs/heads/main.tar.gz",
        ],
        "version": "0.2.5",
        "bs": "pyproject",
        "license": "license:bsd-3",
    },
    "mystmd": {
        "urls": [
            "https://github.com/jupyter-book/mystmd/archive/refs/tags/mystmd@1.8.0.tar.gz",
            "https://github.com/jupyter-book/mystmd/archive/refs/tags/v1.8.0.tar.gz",
            "https://github.com/jupyter-book/mystmd/archive/refs/tags/1.8.0.tar.gz",
        ],
        "version": "1.8.0",
        "bs": "copy",
        "license": "license:expat",
    },
    "pianobooster": {
        "urls": [
            "https://github.com/pianobooster/PianoBooster/archive/refs/tags/v1.0.0.tar.gz",
        ],
        "version": "1.0.0",
        "bs": "cmake",
        "license": "license:gpl3+",
    },
    "simgrid": {
        "urls": [
            "https://framagit.org/simgrid/simgrid/-/archive/v4.0/simgrid-v4.0.tar.gz",
            "https://framagit.org/simgrid/simgrid/-/archive/v3.36/simgrid-v3.36.tar.gz",
        ],
        "version": "4.0",
        "bs": "cmake",
        "license": "license:lgpl2.1",
    },
    "textadept-gtk3": {
        "urls": [
            "https://github.com/orbitalquark/textadept/archive/refs/tags/textadept_12.9.tar.gz",
            "https://github.com/orbitalquark/textadept/archive/refs/tags/v12.9.tar.gz",
            "https://github.com/orbitalquark/textadept/archive/refs/tags/12.9.tar.gz",
        ],
        "version": "12.9",
        "bs": "gnu",
        "license": "license:expat",
    },
    "bloop": {
        "urls": [
            "https://github.com/scalacenter/bloop/archive/refs/tags/v2.0.19.tar.gz",
        ],
        "version": "2.0.19",
        "bs": "copy",
        "license": "license:asl2.0",
    },
    "psf-unifont": {
        "urls": [
            "https://unifoundry.com/pub/unifont/unifont-17.0.04/unifont-17.0.04.tar.gz",
            "https://unifoundry.com/pub/unifont/unifont-17.0.04/font-builds/unifont-17.0.04.psf.gz",
        ],
        "version": "17.0.04",
        "bs": "copy",
        "license": "license:gpl2+",
    },
    "otb-unifont": {
        "urls": [
            "https://unifoundry.com/pub/unifont/unifont-17.0.04/unifont-17.0.04.tar.gz",
            "https://unifoundry.com/pub/unifont/unifont-17.0.04/font-builds/unifont-17.0.04.otb",
        ],
        "version": "17.0.04",
        "bs": "copy",
        "license": "license:gpl2+",
    },
    "findent": {
        "urls": [
            "https://sourceforge.net/projects/findent/files/findent-4.3.6.tar.gz/download",
            "https://downloads.sourceforge.net/project/findent/findent-4.3.6.tar.gz",
        ],
        "version": "4.3.6",
        "bs": "gnu",
        "license": "license:bsd-3",
    },
    "miniupnpd-nft-git": {
        "urls": [
            "https://github.com/miniupnp/miniupnp/archive/refs/heads/master.tar.gz",
            "https://miniupnp.tuxfamily.org/files/miniupnpd-2.3.7.tar.gz",
        ],
        "version": "2.3.9",
        "bs": "gnu",
        "license": "license:bsd-3",
    },
    "libfprint-1": {
        "urls": [
            "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.9/libfprint-v1.94.9.tar.gz",
            "https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/V_1_0/libfprint-V_1_0.tar.gz",
        ],
        "version": "1.0",
        "bs": "meson",
        "license": "license:lgpl2.1+",
    },
    "nagstamon-git": {
        "urls": [
            "https://github.com/HenriWahl/Nagstamon/archive/refs/heads/master.tar.gz",
        ],
        "version": "3.19",
        "bs": "pyproject",
        "license": "license:gpl2+",
    },
    "gtk2-theme-dust": {
        "urls": [
            "https://github.com/rafaelmardojai/dust-theme/archive/refs/heads/master.tar.gz",
        ],
        "version": "0.5.1",
        "bs": "copy",
        "license": "license:gpl3+",
    },
    "devkitty-git": {
        "urls": [
            "https://github.com/nickvdyck/devkitty/archive/refs/tags/v4.1.1.tar.gz",
            "https://github.com/nickvdyck/devkitty/archive/refs/heads/main.tar.gz",
        ],
        "version": "4.1.1",
        "bs": "gnu",
        "license": "license:expat",
    },
    "arsenal": {
        "urls": [
            "https://github.com/Orange-Cyberdefense/arsenal/archive/refs/heads/master.tar.gz",
        ],
        "version": "1.2.7",
        "bs": "pyproject",
        "license": "license:gpl3+",
    },
    "apache-jena-fuseki": {
        "urls": [
            "https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-6.0.0.tar.gz",
            "https://archive.apache.org/dist/jena/binaries/apache-jena-fuseki-6.0.0.tar.gz",
        ],
        "version": "6.0.0",
        "bs": "copy",
        "license": "license:asl2.0",
    },
    "apache-jena": {
        "urls": [
            "https://dlcdn.apache.org/jena/binaries/apache-jena-6.0.0.tar.gz",
            "https://archive.apache.org/dist/jena/binaries/apache-jena-6.0.0.tar.gz",
        ],
        "version": "6.0.0",
        "bs": "copy",
        "license": "license:asl2.0",
    },
    # Fonts with direct download URLs
    "ttf-raleway-variable": {
        "urls": [
            "https://github.com/theleagueof/raleway/archive/refs/tags/4.101.tar.gz",
            "https://github.com/theleagueof/raleway/archive/refs/tags/v4.101.tar.gz",
        ],
        "version": "4.101",
        "bs": "copy",
        "license": "license:silofl1.1",
    },
    "otf-raleway": {
        "urls": [
            "https://github.com/theleagueof/raleway/archive/refs/tags/4.101.tar.gz",
            "https://github.com/theleagueof/raleway/archive/refs/tags/v4.101.tar.gz",
        ],
        "version": "4.101",
        "bs": "copy",
        "license": "license:silofl1.1",
    },
    "license": {
        "urls": [
            "https://git.sr.ht/~zethra/license/archive/3.2.1.tar.gz",
        ],
        "version": "3.2.1",
        "bs": "copy",
        "license": "license:mpl2.0",
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
            if len(lines) >= 2:
                hash_line = lines[-1].strip()
                if len(hash_line) == 52:
                    return hash_line
        return None
    except (subprocess.TimeoutExpired, Exception):
        return None


from concurrent.futures import ThreadPoolExecutor, as_completed

def download_pkg(name):
    """Try all URLs for a package, return (name, hash, url) or (name, None, None)."""
    if name not in MANUAL_URLS:
        return (name, None, None)
    info = MANUAL_URLS[name]
    for url in info["urls"]:
        h = try_guix_download(url)
        if h:
            return (name, h, url)
    return (name, None, None)


# ── Download all ──────────────────────────────────────────────────

names = list(MANUAL_URLS.keys())
print(f"Attempting downloads for {len(names)} packages...", file=sys.stderr)

results = {}
with ThreadPoolExecutor(max_workers=MAX_PARALLEL) as executor:
    future_to_name = {executor.submit(download_pkg, n): n for n in names}
    done = 0
    for future in as_completed(future_to_name):
        name = future_to_name[future]
        done += 1
        n, h, u = future.result()
        results[n] = (h, u)
        status = "OK" if h else "FAIL"
        print(f"  [{done}/{len(names)}] {status} {n}", file=sys.stderr)

# Report
succeeded = {n: (h, u) for n, (h, u) in results.items() if h}
failed = {n for n, (h, u) in results.items() if not h}

print(f"\nSucceeded: {len(succeeded)}", file=sys.stderr)
print(f"Failed: {len(failed)}", file=sys.stderr)
if failed:
    print(f"Still blocked: {', '.join(sorted(failed))}", file=sys.stderr)

# Output JSON for use by the main script
output = {}
for name, (h, u) in succeeded.items():
    info = MANUAL_URLS[name]
    output[name] = {
        "hash": h,
        "source_url": u,
        "version": info["version"],
        "bs": info["bs"],
        "license": info["license"],
    }

with open("reports/recipe-resolver-260417x-pass2.json", "w") as f:
    json.dump(output, f, indent=2)

print(f"\nResults written to reports/recipe-resolver-260417x-pass2.json", file=sys.stderr)
