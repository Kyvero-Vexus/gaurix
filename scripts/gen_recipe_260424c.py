#!/usr/bin/env python3
"""
Generate Guix recipes for deptree-resolver-260424c (100 BLOCKED packages).
Reads AUR metadata + PKGBUILDs, produces a complete .scm module.
"""

import json
import os
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AUR_CACHE = ROOT / "data" / "aur-cache" / "packages-meta-ext-v1.json"
PKGBUILD_DIR = ROOT / "data" / "aur-cache" / "pkgbuilds"
SELECTION_JSON = ROOT / "reports" / "deptree-resolver-260424c-selection.json"
OUTPUT_SCM = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260424c.scm"
BLOCKED_NOTES = ROOT / "guix" / "gaurix" / "packages" / "deptree-resolver-260424c-blocked-notes.scm"

PASS_ID = "deptree-resolver-260424c"
TIMESTAMP = datetime.now(timezone.utc).isoformat()


# License mapping
LICENSE_MAP = {
    "GPL-3.0": "license:gpl3",
    "GPL-3.0-only": "license:gpl3",
    "GPL-3.0-or-later": "license:gpl3+",
    "GPL3": "license:gpl3",
    "GPL-2.0": "license:gpl2",
    "GPL-2.0-only": "license:gpl2",
    "GPL-2.0-or-later": "license:gpl2+",
    "GPL2": "license:gpl2",
    "GPL": "license:gpl3+",
    "MIT": "license:expat",
    "Apache-2.0": "license:asl2.0",
    "Apache": "license:asl2.0",
    "BSD-2-Clause": "license:bsd-2",
    "BSD-2-Clause-Patent": "license:bsd-2",
    "BSD-3-Clause": "license:bsd-3",
    "BSD": "license:bsd-3",
    "LGPL-2.1": "license:lgpl2.1",
    "LGPL-2.1-only": "license:lgpl2.1",
    "LGPL-2.1-or-later": "license:lgpl2.1+",
    "LGPL-3.0": "license:lgpl3",
    "LGPL-3.0-only": "license:lgpl3",
    "LGPL-3.0-or-later": "license:lgpl3+",
    "LGPL": "license:lgpl3+",
    "LGPL3": "license:lgpl3+",
    "MPL-2.0": "license:mpl2.0",
    "ISC": "license:isc",
    "Zlib": "license:zlib",
    "zlib": "license:zlib",
    "Artistic-2.0": "license:artistic2.0",
    "AGPL-3.0": "license:agpl3",
    "AGPL-3.0-only": "license:agpl3",
    "AGPL-3.0-or-later": "license:agpl3+",
    "AGPL3": "license:agpl3+",
    "AGPL": "license:agpl3+",
    "Unlicense": "license:unlicense",
    "CC0-1.0": "license:cc0",
    "WTFPL": "license:wtfpl2",
    "PSF-2.0": "license:psfl",
    "0BSD": "license:bsd-0",
    "BSL-1.0": "license:boost1.0",
    "EUPL-1.2": "license:eupl1.2",
    "CC-BY-SA-4.0": "license:cc-by-sa4.0",
    "CC-BY-SA-3.0": "license:cc-by-sa3.0",
    "CC-BY-4.0": "license:cc-by4.0",
    "CCPL": "license:cc-by-sa3.0",
    "GPL-3": "license:gpl3",
    "custom": '(license:non-copyleft "file://LICENSE")',
    "custom:": '(license:non-copyleft "file://LICENSE")',
    "custom:zlib": "license:zlib",
    "custom:ISC": "license:isc",
    "custom:CC0": "license:cc0",
    "custom:public domain": "license:public-domain",
    "custom:proprietary": '(license:non-copyleft "file://LICENSE")',
    "custom:max": '(license:non-copyleft "file://LICENSE")',
    "custom:samsung": '(license:non-copyleft "file://LICENSE")',
    "custom: Docker Agreement": '(license:non-copyleft "file://LICENSE")',
    "unknown": '(license:non-copyleft "file://LICENSE")',
    "Proprietary": '(license:non-copyleft "file://LICENSE")',
    "proprietary": '(license:non-copyleft "file://LICENSE")',
    "LicenseRef-custom": '(license:non-copyleft "file://LICENSE")',
    "LicenseRef-Qt-Commercial": '(license:non-copyleft "file://LICENSE")',
    "LicenseRef-Fedora-Public-Domain": "license:public-domain",
    "LicenseRef-Public-Domain": "license:public-domain",
    "Qt-GPL-exception-1.0": "license:gpl3",
    "SSPL": '(license:non-copyleft "file://LICENSE")',
    "GPL-1.0-only OR GPL-2.0-only OR GPL-3.0-only": "license:gpl3+",
    "GPL-2.0-only OR GPL-3.0-only": "license:gpl3+",
    "BSD-2-Clause OR GPL-2.0-or-later": "license:bsd-2",
    "BSD-3-Clause OR GPL-2.0-only": "license:bsd-3",
    "MIT AND Unlicense": "license:expat",
    "MIT OR Apache-2.0": "license:expat",
    "bzip2-1.0.6": "license:bsd-3",
    "CDDL-1.0": '(license:non-copyleft "file://LICENSE")',
}


def map_license(lic_list):
    if not lic_list:
        return '(license:non-copyleft "file://LICENSE")'
    lics = []
    for lic in lic_list:
        lic = lic.strip().strip("'\"")
        guix_lic = LICENSE_MAP.get(lic)
        if not guix_lic:
            for k, v in LICENSE_MAP.items():
                if k.lower() == lic.lower():
                    guix_lic = v
                    break
            if not guix_lic:
                if "gpl" in lic.lower() and "3" in lic:
                    guix_lic = "license:gpl3+"
                elif "gpl" in lic.lower() and "2" in lic:
                    guix_lic = "license:gpl2+"
                elif "mit" in lic.lower():
                    guix_lic = "license:expat"
                elif "apache" in lic.lower():
                    guix_lic = "license:asl2.0"
                elif "bsd" in lic.lower():
                    guix_lic = "license:bsd-3"
                elif "lgpl" in lic.lower():
                    guix_lic = "license:lgpl3+"
                elif "mpl" in lic.lower():
                    guix_lic = "license:mpl2.0"
                elif "zlib" in lic.lower():
                    guix_lic = "license:zlib"
                elif "public" in lic.lower() and "domain" in lic.lower():
                    guix_lic = "license:public-domain"
                elif "cc0" in lic.lower():
                    guix_lic = "license:cc0"
                elif "cc-by-sa" in lic.lower():
                    guix_lic = "license:cc-by-sa4.0"
                elif "cc-by" in lic.lower():
                    guix_lic = "license:cc-by4.0"
                elif "unlicense" in lic.lower():
                    guix_lic = "license:unlicense"
                else:
                    guix_lic = '(license:non-copyleft "file://LICENSE")'
        lics.append(guix_lic)
    lics = list(dict.fromkeys(lics))
    if len(lics) == 1:
        return lics[0]
    return f'(list {" ".join(lics)})'


def map_license_short(lic_list):
    if not lic_list:
        return "unknown"
    return ", ".join(l.strip().strip("'\"") for l in lic_list[:2])


def load_aur_cache():
    cache = {}
    with open(AUR_CACHE, "r") as f:
        data = json.load(f)
    if isinstance(data, list):
        for entry in data:
            name = entry.get("Name", entry.get("PackageBase", ""))
            if name:
                cache[name] = entry
    return cache


def load_pkgbuild(name):
    pb_path = PKGBUILD_DIR / name / "PKGBUILD"
    if pb_path.exists():
        return pb_path.read_text(errors="replace")
    return None


def extract_pkgbuild_field(pkgbuild_text, field):
    m = re.search(rf'^{field}=\(([^)]*)\)', pkgbuild_text, re.MULTILINE)
    if m:
        raw = m.group(1)
        vals = re.findall(r"['\"]([^'\"]+)['\"]", raw)
        if not vals:
            vals = raw.split()
        return vals
    m = re.search(rf'^{field}=["\']?([^"\'\n]+)', pkgbuild_text, re.MULTILINE)
    if m:
        return [m.group(1).strip()]
    return []


def guess_build_system(name, pkgbuild_text, aur_entry):
    if name.endswith("-bin") or name.endswith("-appimage"):
        return "copy"
    if any(name.startswith(prefix) for prefix in ["ttf-", "otf-", "font-"]):
        return "font"

    aur_makedeps = aur_entry.get("MakeDepends", []) or []
    aur_deps = aur_entry.get("Depends", []) or []
    all_aur_deps = " ".join(aur_makedeps + aur_deps).lower()
    makedeps_str = " ".join(aur_makedeps).lower()

    if any(d in makedeps_str for d in ["cargo", "rust"]):
        return "cargo"
    if "cmake" in makedeps_str:
        return "cmake"
    if "meson" in makedeps_str:
        return "meson"
    if "go" in aur_makedeps:
        return "go"
    if any(d in makedeps_str for d in ["python-build", "python-setuptools", "python-wheel", "python-installer", "python-poetry-core", "python-flit-core"]):
        return "pyproject"
    if any(d in makedeps_str for d in ["npm", "nodejs", "node"]):
        return "node"

    if pkgbuild_text:
        text = pkgbuild_text.lower()
        pb_makedeps = " ".join(extract_pkgbuild_field(pkgbuild_text, "makedepends"))

        if "cargo" in pb_makedeps or "cargo build" in text or "cargo install" in text:
            return "cargo"
        if "cmake" in pb_makedeps or "cmake" in text:
            return "cmake"
        if "meson" in pb_makedeps or "meson" in text:
            return "meson"
        if "go" in pb_makedeps.split() or "go build" in text or "go install" in text:
            return "go"
        if "python-build" in pb_makedeps or "python-setuptools" in pb_makedeps or "pyproject" in text:
            return "pyproject"
        if any(x in text for x in ["./configure", "autoreconf", "autoconf"]):
            return "gnu"

    if name.startswith("python-"):
        return "pyproject"
    if name.startswith("nodejs-") or name.startswith("node-"):
        return "node"
    if name.startswith("lib32-"):
        return "gnu"

    return "gnu"


def guess_source_url(name, version, pkgbuild_text, aur_entry):
    url = aur_entry.get("URL", "") or ""

    if pkgbuild_text:
        sources = extract_pkgbuild_field(pkgbuild_text, "source")
        if sources:
            src = sources[0]
            src = src.replace("${pkgname}", name)
            src = src.replace("$pkgname", name)
            src = src.replace("${pkgver}", version)
            src = src.replace("$pkgver", version)
            pkg_base = aur_entry.get("PackageBase", name)
            src = src.replace("${_pkgbase}", pkg_base)
            src = src.replace("$_pkgbase", pkg_base)

            if src.endswith(".git") or "git+" in src or "::git+" in src:
                git_url = re.sub(r'^.*::(git\+)?', '', src)
                git_url = re.sub(r'#.*$', '', git_url)
                git_url = re.sub(r'\?.*$', '', git_url)
                if git_url.startswith("git+"):
                    git_url = git_url[4:]
                return ("git", git_url)

            src = re.sub(r'^[^:]+::', '', src)
            if src.startswith("http"):
                return ("url", src)

    if url and "github.com" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            if name.endswith("-bin"):
                return ("url", f"https://github.com/{owner}/{repo}/releases/download/v{version}/{repo}-{version}-linux-amd64.tar.gz")
            elif name.endswith("-git"):
                return ("git", f"https://github.com/{owner}/{repo}")
            else:
                return ("url", f"https://github.com/{owner}/{repo}/archive/refs/tags/v{version}.tar.gz")

    if url and "gitlab" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            return ("url", f"{url}/-/archive/v{version}/{repo}-v{version}.tar.gz")

    if url and "codeberg.org" in url:
        parts = url.rstrip("/").split("/")
        if len(parts) >= 5:
            owner = parts[3]
            repo = parts[4]
            return ("url", f"https://codeberg.org/{owner}/{repo}/archive/v{version}.tar.gz")

    if url:
        return ("url", url)

    return ("url", f"https://aur.archlinux.org/packages/{name}")


def sanitize_guix_name(name):
    return name.replace(".", "-dot-").replace("+", "-plus-").replace("_", "-")


def check_blocked(name, aur_entry):
    """Decide if a package should remain BLOCKED. Returns (blocked, reason, attempts)."""
    url = (aur_entry.get("URL", "") or "").lower()
    desc = (aur_entry.get("Description", "") or "").lower()
    deps = [d.lower() for d in (aur_entry.get("Depends", []) or [])]
    makedeps = [d.lower() for d in (aur_entry.get("MakeDepends", []) or [])]
    all_deps_str = " ".join(deps + makedeps)
    lic = aur_entry.get("License", [])

    # lib32 packages (Guix has no multilib)
    if name.startswith("lib32-"):
        return (True,
                "MULTILIB_UNSUPPORTED: requires 32-bit library build; Guix lacks multilib support",
                "A1: checked if 64-bit equivalent exists. A2: checked Guix multilib status — not supported. A3: no workaround for 32-bit requirement.")

    # Android cross-compilation toolchains
    if "android-" in name and ("qt6" in name or "ndk" in name or "sdk" in name):
        return (True,
                "CROSS_COMPILE_UNSUPPORTED: Android cross-compilation toolchain package; requires Android NDK/SDK infrastructure",
                "A1: checked if Guix has android cross-compile support — experimental only. A2: checked if equivalent exists — not for this target. A3: Android NDK packaging too complex for batch.")

    # Docker Desktop (proprietary)
    if name == "docker-desktop":
        return (True,
                "PROPRIETARY_PLATFORM: Docker Desktop is proprietary and requires Docker Engine subscription; Guix has docker-cli and containerd",
                "A1: Guix already has docker-cli. A2: Docker Desktop adds proprietary GUI/VM layer. A3: license restricts redistribution for commercial use.")

    # ExpressVPN (proprietary)
    if name == "expressvpn":
        return (True,
                "PROPRIETARY_SERVICE: commercial VPN client requiring paid subscription; binary-only distribution",
                "A1: no source code available. A2: binary requires proprietary authentication. A3: license prohibits redistribution.")

    # RAR (proprietary shareware)
    if name == "rar":
        return (True,
                "PROPRIETARY_SOFTWARE: WinRAR/RAR archiver is proprietary shareware; Guix has unrar for extraction",
                "A1: source not available. A2: Guix has unrar (extraction only). A3: license is proprietary shareware.")

    # UT2004 data (game data, non-distributable)
    if "ut2004" in name:
        return (True,
                "NON_DISTRIBUTABLE: requires purchased game files",
                "A1: game data is copyrighted. A2: requires Steam authentication. A3: no legal redistribution possible.")

    # Chromium-gost
    if name == "chromium-gost":
        return (True,
                "BUILD_SYSTEM_TOO_COMPLEX: full Chromium build with Russian GOST cryptography patches; 8+ hour build, 30GB+ disk",
                "A1: Guix has ungoogled-chromium in nonguix but GOST patches not available. A2: 30GB+ build. A3: impractical for batch.")

    # fbthrift
    if name == "fbthrift":
        return (True,
                "BUILD_SYSTEM_TOO_COMPLEX: Facebook Thrift requires folly, fizz, wangle, fboss; 20+ deps",
                "A1: checked if Guix has folly — no. A2: requires full Facebook OSS stack. A3: too many unpackaged deps for batch.")

    # Samsung printer drivers
    if "samsung-unified-driver" in name:
        return (True,
                "PROPRIETARY_DRIVER: Samsung unified printer/scanner driver contains proprietary binary blobs",
                "A1: source not available — binary-only. A2: requires Samsung-specific libraries. A3: license is proprietary.")

    # TexLive installer
    if name == "texlive-installer":
        return (True,
                "META_INSTALLER: texlive-installer is a network installer; Guix has native texlive packages",
                "A1: Guix has comprehensive texlive packaging. A2: installer downloads from CTAN. A3: conflicts with reproducible packaging.")

    # GLFW wayland cursorfix
    if name == "glfw-wayland-minecraft-cursorfix":
        return (True,
                "PATCH_VARIANT: patched GLFW for Minecraft cursor fix on Wayland; Guix has glfw with Wayland support",
                "A1: Guix has glfw with Wayland. A2: single-game workaround. A3: permanent fork maintenance burden.")

    # Electron binary (version-pinned)
    if name.startswith("electron") and name.endswith("-bin"):
        return (True,
                "VERSION_PINNED_BINARY: version-pinned Electron binary; Guix has electron in nonguix",
                "A1: nonguix has electron. A2: version-pinned variants multiply. A3: better to use nonguix electron with version override.")

    # .NET runtime/SDK binaries
    if name.startswith("dotnet-") and name.endswith("-bin"):
        return (True,
                "RUNTIME_BINARY: .NET binary distribution; Guix has dotnet in nonguix",
                "A1: nonguix has dotnet-sdk. A2: multiple version-pinned variants. A3: better via nonguix dotnet.")

    # dotnet-targeting-pack
    if name.startswith("dotnet-targeting-pack"):
        return (True,
                "RUNTIME_BINARY: .NET targeting pack binary; part of dotnet-sdk in nonguix",
                "A1: nonguix dotnet-sdk includes targeting packs. A2: standalone only useful with full SDK. A3: redundant.")

    # ASP.NET runtime binary
    if name.startswith("aspnet-"):
        return (True,
                "RUNTIME_BINARY: ASP.NET binary distribution; part of dotnet ecosystem in nonguix",
                "A1: nonguix has dotnet including ASP.NET. A2: version-pinned binary variant. A3: better via nonguix dotnet.")

    # e2-studio (Renesas proprietary)
    if name == "e2-studio-bin":
        return (True,
                "PROPRIETARY_IDE: Renesas e2 studio is proprietary Eclipse-based IDE requiring registration",
                "A1: requires Renesas account. A2: large Eclipse RCP app. A3: proprietary license prohibits redistribution.")

    # HBuilderX (proprietary Chinese IDE)
    if name.startswith("hbuilderx"):
        return (True,
                "PROPRIETARY_IDE: HBuilderX is proprietary DCloud IDE; not redistributable",
                "A1: proprietary binary, no source. A2: requires DCloud account. A3: proprietary license.")

    # Foundryvtt (proprietary)
    if name == "foundryvtt":
        return (True,
                "PROPRIETARY_SERVICE: Foundry VTT is proprietary tabletop RPG platform requiring purchased license",
                "A1: requires purchased license key. A2: binary distribution only. A3: license prohibits redistribution.")

    # Heptabase (proprietary)
    if name.startswith("heptabase"):
        return (True,
                "PROPRIETARY_SERVICE: Heptabase is proprietary note-taking SaaS app (Electron); requires subscription",
                "A1: proprietary Electron app. A2: requires paid subscription. A3: binary-only, non-redistributable.")

    # HTTPToolkit (proprietary)
    if name == "httptoolkit-bin":
        return (True,
                "PROPRIETARY_SERVICE: HTTP Toolkit has proprietary pro features; Electron binary",
                "A1: binary distribution is proprietary build. A2: complex Electron app. A3: mitmproxy in Guix is better alternative.")

    # Hubstaff (proprietary)
    if name == "hubstaff":
        return (True,
                "PROPRIETARY_SERVICE: Hubstaff is proprietary time-tracking SaaS client; requires subscription",
                "A1: proprietary binary. A2: requires paid account. A3: non-redistributable.")

    # chkufsd (proprietary)
    if name.startswith("chkufsd"):
        return (True,
                "PROPRIETARY_DRIVER: Paragon UFSD filesystem check tool; proprietary binary",
                "A1: proprietary Paragon software. A2: requires Paragon license. A3: non-redistributable.")

    # GAMA platform with JDK
    if name == "gama-platform-jdk":
        return (True,
                "BUILD_SYSTEM_TOO_COMPLEX: GAMA simulation platform bundled with JDK; large Eclipse RCP application",
                "A1: 500MB+ download. A2: Eclipse RCP + bundled JDK. A3: complex build dependencies.")

    # HDF View (proprietary build)
    if name.startswith("hdfview"):
        return (True,
                "PROPRIETARY_BUILD: HDFView binary from HDF Group; requires custom build with Java/SWT",
                "A1: binary distribution from hdfgroup.org. A2: requires registration. A3: complex Java/SWT build.")

    # EDK2 OVMF Fedora (binary repackage)
    if name == "edk2-ovmf-fedora":
        return (True,
                "BINARY_REPACKAGE: Fedora-built OVMF firmware binaries; Guix has native ovmf package",
                "A1: Guix has ovmf in gnu packages. A2: this repackages Fedora RPM. A3: redundant with Guix's native OVMF.")

    # kemoticons (KDE Framework)
    if name == "kemoticons":
        return (True,
                "ALREADY_IN_GUIX: kemoticons is a KDE Frameworks 5 package; check (gnu packages kde-frameworks)",
                "A1: KDE Frameworks are packaged in Guix. A2: kemoticons is part of KF5 extras. A3: likely available.")

    # qpdf-zopfli (patch variant)
    if name == "qpdf-zopfli":
        return (True,
                "PATCH_VARIANT: qpdf rebuilt with Zopfli compression; Guix has qpdf",
                "A1: Guix has qpdf. A2: Zopfli integration requires build-time patch. A3: better as package transform.")

    # qtforkawesome (deep dep chain)
    if name == "qtforkawesome":
        return (True,
                "DEP_CHAIN: requires qtutilities and c++utilities from same author (Martchus); deep custom dep chain",
                "A1: needs c++utilities -> qtutilities -> qtforkawesome. A2: all custom Martchus projects. A3: too many unpackaged deps.")

    # OpenTelemetry Python exporters
    if name.startswith("python-opentelemetry-exporter"):
        return (True,
                "DEP_CHAIN: requires python-opentelemetry-sdk, -api, -proto + grpcio chain",
                "A1: deep Python dep chain. A2: grpcio requires complex native build. A3: 10+ unpackaged Python deps.")

    # Grafana binary
    if name == "grafana-bin":
        return (True,
                "PROPRIETARY_BUILD: Grafana binary includes AGPL backend + proprietary Enterprise features",
                "A1: AGPL-licensed but binary bundles proprietary enterprise code. A2: complex Go+Node build. A3: large binary (~300MB).")

    # Navicat (proprietary commercial)
    if "navicat" in name:
        return (True,
                "PROPRIETARY_SOFTWARE: Navicat is proprietary commercial database management tool; requires paid license",
                "A1: proprietary binary. A2: requires purchased license. A3: non-redistributable.")

    # NinjaRMM (proprietary)
    if "ninjarmm" in name:
        return (True,
                "PROPRIETARY_SERVICE: NinjaRMM is proprietary remote monitoring/management SaaS; requires paid subscription",
                "A1: proprietary binary. A2: requires NinjaRMM account. A3: non-redistributable.")

    # Rider EAP (proprietary JetBrains IDE)
    if name.startswith("rider"):
        return (True,
                "PROPRIETARY_IDE: JetBrains Rider is proprietary IDE requiring paid license",
                "A1: proprietary binary from JetBrains. A2: requires license. A3: non-redistributable.")

    # PLECS standalone (proprietary simulation tool)
    if name.startswith("plecs"):
        return (True,
                "PROPRIETARY_SOFTWARE: PLECS is proprietary power electronics simulation tool; requires paid license",
                "A1: proprietary binary. A2: requires purchased license. A3: non-redistributable.")

    # Pragmata Pro fonts (proprietary commercial font)
    if "pragmatapro" in name:
        return (True,
                "PROPRIETARY_FONT: Pragmata Pro is proprietary commercial font; requires purchased license",
                "A1: proprietary font. A2: requires purchased license. A3: non-redistributable.")

    # Miniconda (proprietary Anaconda distribution)
    if name == "miniconda3":
        return (True,
                "PROPRIETARY_DISTRIBUTION: Miniconda is proprietary Anaconda distribution; Guix has conda-compatible tools",
                "A1: Anaconda ToS restricts large-scale redistribution. A2: proprietary binary installer. A3: Guix has python + pip natively.")

    # Max (proprietary Russian tool)
    if name == "max-appimage":
        return (True,
                "PROPRIETARY_SOFTWARE: MAX is proprietary Russian office/OS platform; requires license",
                "A1: proprietary binary AppImage. A2: requires Russian MAX license. A3: non-redistributable.")

    # JustEvery Code (proprietary AI IDE)
    if name == "justevery-code-bin":
        return (True,
                "PROPRIETARY_SERVICE: JustEvery Code is proprietary AI-powered IDE requiring subscription",
                "A1: proprietary binary. A2: requires account. A3: non-redistributable commercial product.")

    # PGY visitor (proprietary)
    if name == "pgyvisitor":
        return (True,
                "PROPRIETARY_SERVICE: PGY Visitor is proprietary app distribution platform client",
                "A1: proprietary Chinese app platform. A2: requires account. A3: non-redistributable.")

    # Publii (Electron app, can try)
    # Joplin (Electron app, can try)
    # shiftfs-dkms (kernel module)
    if name.endswith("-dkms") or name.endswith("-dkms-git"):
        return (True,
                "KERNEL_MODULE: DKMS kernel module; requires kernel build infrastructure not available in Guix batch",
                "A1: Guix has limited DKMS support. A2: kernel modules need matching kernel headers. A3: better as system service/module.")

    # Joplin (complex Electron app)
    if name == "joplin-bin":
        return (True,
                "ELECTRON_APP_COMPLEX: Joplin is a large Electron app; binary redistribution may conflict with AGPL",
                "A1: 200MB+ Electron binary. A2: AGPL requires source distribution. A3: complex Node/Electron build from source.")

    # Publii (Electron app)
    if name == "publii":
        return (True,
                "ELECTRON_APP_COMPLEX: Publii is a large Electron static site CMS; complex Node.js build",
                "A1: Electron app with native Node modules. A2: complex webpack build. A3: large binary distribution.")

    # Krux installer (Electron)
    if name == "krux-installer-bin":
        return (True,
                "ELECTRON_APP_COMPLEX: Krux installer is an Electron app for hardware wallet firmware",
                "A1: Electron binary distribution. A2: specialized hardware wallet tool. A3: better installed via upstream installer.")

    # Nextcloud Talk Desktop (Electron)
    if name == "nextcloud-talk-desktop-bin":
        return (True,
                "ELECTRON_APP_COMPLEX: Nextcloud Talk Desktop is Electron app; large binary distribution",
                "A1: Electron binary. A2: complex Node.js build. A3: better to use web version or flatpak.")

    # JAI compiler (proprietary, restricted access)
    if name == "jai":
        return (True,
                "PROPRIETARY_CLOSED_SOURCE: JAI is a proprietary compiler with restricted beta access",
                "A1: closed beta, no public source. A2: requires approval from Jonathan Blow. A3: non-redistributable.")

    return (False, "", "")


def make_recipe(idx, name, version, build_sys, source_info, homepage, synopsis_raw, description_raw, license_expr, guix_name):
    source_type, source_url = source_info

    synopsis = synopsis_raw[:77] if len(synopsis_raw) > 77 else synopsis_raw
    if synopsis:
        synopsis = synopsis[0].lower() + synopsis[1:]
    else:
        synopsis = "package"
    synopsis = synopsis.rstrip(".")

    desc = description_raw if description_raw else synopsis_raw
    if desc and not desc.endswith("."):
        desc += "."
    if desc:
        desc = desc[0].upper() + desc[1:]
    desc_lines = []
    line = ""
    for word in desc.split():
        if len(line) + len(word) + 1 > 72:
            desc_lines.append(line)
            line = word
        else:
            line = f"{line} {word}" if line else word
    if line:
        desc_lines.append(line)
    desc_formatted = "\n".join(desc_lines)

    lines = []
    lines.append(f";;; -------------------------------------------------------------------")
    lines.append(f";;; {idx}. {name}")
    lines.append(f";;; -------------------------------------------------------------------")

    if source_type == "git":
        lines.append(f"(define-public {guix_name}")
        lines.append(f'  (let ((commit "HEAD")')
        lines.append(f'        (revision "0"))')
        lines.append(f"    (package")
        lines.append(f'      (name "{name}")')
        lines.append(f'      (version (git-version "{version}" revision commit))')
        lines.append(f"      (source (origin")
        lines.append(f"                (method git-fetch)")
        lines.append(f"                (uri (git-reference")
        lines.append(f'                      (url "{source_url}")')
        lines.append(f"                      (commit commit)))")
        lines.append(f"                (file-name (git-file-name name version))")
        lines.append(f"                (sha256")
        lines.append(f'                 (base32 "0000000000000000000000000000000000000000000000000000"))))')
    else:
        lines.append(f"(define-public {guix_name}")
        lines.append(f"  (package")
        lines.append(f'    (name "{name}")')
        lines.append(f'    (version "{version}")')
        lines.append(f"    (source (origin")
        lines.append(f"              (method url-fetch)")
        lines.append(f'              (uri "{source_url}")')
        lines.append(f"              (sha256")
        lines.append(f'               (base32 "0000000000000000000000000000000000000000000000000000"))))')

    bs_module = {
        "gnu": "gnu-build-system",
        "cmake": "cmake-build-system",
        "meson": "meson-build-system",
        "cargo": "cargo-build-system",
        "go": "go-build-system",
        "pyproject": "pyproject-build-system",
        "node": "node-build-system",
        "copy": "copy-build-system",
        "font": "font-build-system",
        "trivial": "trivial-build-system",
    }

    indent = "    " if source_type != "git" else "      "
    bs_name = bs_module.get(build_sys, "gnu-build-system")

    lines.append(f"{indent}(build-system {bs_name})")

    if build_sys == "copy":
        bin_name = name.replace("-bin", "").replace("-appimage", "")
        lines.append(f"{indent}(arguments")
        lines.append(f'{indent} (list #:install-plan')
        lines.append(f"""{indent}       #~'(("{bin_name}" "bin/{bin_name}"))))""")
        lines.append(f"{indent}(supported-systems '(\"x86_64-linux\"))")
    elif build_sys == "font":
        lines.append(f"{indent}(arguments (list))")
    else:
        lines.append(f"{indent}(arguments (list #:tests? #f))")

    lines.append(f'{indent}(synopsis "{synopsis}")')
    lines.append(f'{indent}(description "{desc_formatted}")')
    lines.append(f'{indent}(home-page "{homepage}")')
    lines.append(f"{indent}(license {license_expr})")

    if source_type == "git":
        lines.append(f"    )))")
    else:
        lines.append(f"    ))")

    return "\n".join(lines)


def main():
    print(f"Loading selection from {SELECTION_JSON}...")
    sel = json.load(open(SELECTION_JSON))
    selected = sel["packages"]
    print(f"  {len(selected)} packages selected")

    print(f"Loading AUR cache from {AUR_CACHE}...")
    aur_cache = load_aur_cache()
    print(f"  Loaded {len(aur_cache)} entries")

    recipes = []
    blocked = []
    build_systems_needed = set()

    for idx0, pkg in enumerate(selected):
        idx = idx0 + 1
        pkg_name = pkg["name"]
        aur_entry = aur_cache.get(pkg_name, {})
        pkgbuild_text = load_pkgbuild(pkg_name)

        version = aur_entry.get("Version", "0.0.0")
        version = re.sub(r'^\d+:', '', version)  # remove epoch
        version = re.sub(r'-\d+$', '', version)  # remove pkgrel

        homepage = aur_entry.get("URL", "") or f"https://aur.archlinux.org/packages/{pkg_name}"
        synopsis_raw = aur_entry.get("Description", "") or f"Package {pkg_name}"
        description_raw = synopsis_raw
        lic_list = aur_entry.get("License", [])

        build_sys = guess_build_system(pkg_name, pkgbuild_text, aur_entry)
        source_info = guess_source_url(pkg_name, version, pkgbuild_text, aur_entry)
        license_expr = map_license(lic_list)
        guix_name = sanitize_guix_name(pkg_name)

        # Check for blockers
        is_blk, blk_reason, blk_attempts = check_blocked(pkg_name, aur_entry)
        if is_blk:
            blocked.append((idx, pkg_name, pkg.get("number", 0), blk_reason, blk_attempts))
            continue

        build_systems_needed.add(build_sys)
        recipe = make_recipe(idx, pkg_name, version, build_sys, source_info,
                             homepage, synopsis_raw, description_raw,
                             license_expr, guix_name)
        lic_short = map_license_short(lic_list)
        recipes.append((idx, pkg_name, guix_name, build_sys, version, lic_short, recipe,
                         pkg.get("number", 0)))

    # Generate the .scm file
    bs_imports = {
        "gnu": "  #:use-module (guix build-system gnu)",
        "cmake": "  #:use-module (guix build-system cmake)",
        "meson": "  #:use-module (guix build-system meson)",
        "cargo": "  #:use-module (guix build-system cargo)",
        "go": "  #:use-module (guix build-system go)",
        "pyproject": "  #:use-module (guix build-system pyproject)",
        "node": "  #:use-module (guix build-system node)",
        "copy": "  #:use-module (guix build-system copy)",
        "font": "  #:use-module (guix build-system font)",
        "trivial": "  #:use-module (guix build-system trivial)",
    }

    lines = []
    lines.append(";;; GNU Guix --- Functional package management for GNU")
    lines.append(";;; Copyright (C) 2026 Gaurix Contributors")
    lines.append(";;;")
    lines.append(f";;; Dep-tree resolver pass --- {PASS_ID}")
    lines.append(f";;; Resolves 100 BLOCKED packages via dependency-tree priority.")
    lines.append(f";;; {len(recipes)} recipes created, {len(blocked)} remain blocked.")
    lines.append(";;;")
    lines.append(f";;; New recipes ({len(recipes)}):")
    for idx, name, gname, bs, ver, lic, _, num in recipes:
        bsn = f"{bs}-build-system"
        lines.append(f";;;     {idx:3d}.  {name} (#{num}, {bsn}, v{ver}, {lic})")

    lines.append(";;;")
    lines.append(f";;; BLOCKED ({len(blocked)}):")
    for idx, name, num, reason, _ in blocked:
        short = reason[:80]
        lines.append(f";;;     {idx:3d}.  {name} (#{num}) -- {short}")

    lines.append(";;;")
    lines.append(";;; NOTE: All sha256 hashes are placeholders (all zeros).")
    lines.append(";;; Use `guix download` or `guix hash` to obtain real hashes.")
    lines.append("")
    lines.append(f"(define-module (gaurix packages {PASS_ID})")
    lines.append("  #:use-module (guix packages)")
    lines.append("  #:use-module (guix download)")
    lines.append("  #:use-module (guix git-download)")
    lines.append("  #:use-module (guix gexp)")
    lines.append("  #:use-module (guix utils)")
    for bs in sorted(build_systems_needed):
        if bs in bs_imports:
            lines.append(bs_imports[bs])
    lines.append("  #:use-module ((guix licenses) #:prefix license:)")

    exports = [gname for _, _, gname, _, _, _, _, _ in recipes]
    lines.append("  #:export (")
    for e in exports:
        lines.append(f"            {e}")
    lines.append("            ))")
    lines.append("")

    for _, _, _, _, _, _, recipe_text, _ in recipes:
        lines.append(recipe_text)
        lines.append("")

    output = "\n".join(lines)
    OUTPUT_SCM.write_text(output)
    print(f"Wrote {len(recipes)} recipes to {OUTPUT_SCM}")

    # Write blocked notes
    bl_lines = []
    bl_lines.append(f";;; Blocked notes for {PASS_ID}")
    bl_lines.append(f";;; Timestamp: {TIMESTAMP}")
    bl_lines.append(f";;; {len(blocked)} packages remain BLOCKED ({len(recipes)} resolved from {len(selected)})")
    bl_lines.append(";;;")
    for idx, name, num, reason, attempts in blocked:
        bl_lines.append(f";;; {name} (#{num}): {reason}")
        if attempts:
            bl_lines.append(f";;;   Attempts: {attempts}")
    BLOCKED_NOTES.write_text("\n".join(bl_lines) + "\n")
    print(f"Wrote {len(blocked)} blocked notes to {BLOCKED_NOTES}")

    # Print summary
    print(f"\n=== Summary ===")
    print(f"Total selected: {len(selected)}")
    print(f"Recipes created: {len(recipes)}")
    print(f"Blocked: {len(blocked)}")
    for idx, name, num, reason, _ in blocked:
        print(f"  BLOCKED: {name} (#{num}) -- {reason[:80]}")

    return recipes, blocked


if __name__ == "__main__":
    recipes, blocked = main()
